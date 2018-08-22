## Spring에서 발생할 수 있는 여러 문제점

54 / 675
534

--------

##  JDBC에서 발생가능한 문제점들
- 애플리케이션의 응답속도를 지연시키는 상당수 원인은 DB쿼리수행시간과 결과를 처리하는 시간임. 실제로 성능 진단을 하면 8~90%의 시스템이 DB에서 많은 시간이 소요됨.
- DB쿼리 진단과 튜닝이 함께 진행되여야함
- 최근에는 mybatis처럼 SQL mapper가 가능하거나 ORM표준 JPA Framework를 많이 사용하므로 애플리케이션 환경에 맞는 튜닝 전략이 필요함
- 성능 튜닝시 고려해야할 것들
1. 데이터베이스 관련 성능 측정
2. JDBC 튜닝
3. SQL 튜닝 or JPA 튜닝

## 베스트 프랙티스
- JDBC 와 JPA 설정을 적절하게 구성해서 가능한 한 많은 읽기와 쓰기 작업을 일괄 처리하자
- 애플리케이션의 SQL을 최적화 시키자. JPA 애플리케이션에서 L2캐시의 개입을 고려하자
- 가능하면 락을 최소화하자
- 반드시 prestatement pool을 사용하자
- 적절한 크기의 connection pool을 사용하자
- 적절한 트랜잭션 법위를 설정하자. 트랜잭션동안 락때문에 애플리케이션 확장성을 저해하지 않도록 가능한 크게 잡아야함

### JDBC 고려사항
#### 환경에 맞는 JDBC 드라이버를 선택
- 예를 들면,Oracle DB의 thin 드라이버는 데이터베이스 서버가 처리를 더 많이 하도록 하게 설정되어있고, thick 드라이버는 메모리를 더 사용해 Java client 에서 더 처리를 많이 해서 데이터베이스의 업무를 줄임. 대형 DB서버 + 작은 서버 라면 thin서버 사용하는 것
- JDBC 드라이버 타입은 1~4까지 있음. 상황에 따라 맞는 드라이버를 선택
    - 단, 타입 1 드라이버(다른 드라이버에 대한 JDBC 브리지 / ODBC와 JDBC 와 통신할 수 있게 해줄 수 있음)는 성능이 떨어지므로 특수한 상황을 제외하고 되도록 사용하지 말자

#### SQL 최적화
  - 한번에 처리할 수 있는 작업을 여러 번 나눠서 하지말자
  - 데이터베이스 서버의 작업을 최소화하고 동시에 자바 애플리케이션의 부담을 너무 늘리지 말자
    - JDBC통신에서 데이터베이스는 데이터를 처리하고 SQL명령을 받고, SQL지시에 따라 접근과 갱신작업을 처리하며 요구한 데이터를 돌려줌. 데이터베이스 서버가 해야하는 일이 많을 수록 서버 처리에 긴 시간이 소요됨
    - 굳이 DB가 할 필요없는 일을 하게 만들지 말자
  -  전송 데이터량의 최소화 - 꼭 필요한 데이터만 가져오자
    - 예를 들면 `SELECT * from foo` 대신 필요한 데이터만 가져오자

### JPA 성능 최적화
- JPA 성능은 기본 JDBC 드라이버의 성능에 직접 영향을 받음
- JPA는 entity클래스의 바이트 코드를 병경햇 성능을 개선함. Java EE 환경에서는 최적화 되어있음. Java SE환경에서도 바이트 코드 처리가 올바르게 설정되도록 하는 것이 중요함
- compile 일부의 과정으로 이루어지며, 컴파일 후 바이트코드를 '개선'하는 postprocessor를 거쳐 최적화됨
- 에이전트는 classloading 중간에 끼어들어 class정의 전에 바이트를 변경함
- 에이전트는 애플리케이션의 커맨드 라인에 명시됨

#### 트랜잭션 처리
- Java EE에서는 JTA(Java Transaction API) 구현체 중 하나가 JPA 트랜잭션임
- 애플리케이션 서버는 CMT(Container Management Transaction)으로 범위를 다루거나 , UMT(User Management Transaction)으로 애플리케이션 내 트랜잭션 범위를 명시적으로 코딩할 수 있음
- JAva SE 에서는 객체에 대한 트랜잭션 범위를 정해야함
- 트랜잭션 커밋 주기와 기본적인 트랜잭션 범위는 서로 트레이드 오프 관계임

#### JPA 쓰기 최적화
- 애플리케이션의 persistence.xml 파일 내 특정 속성을 설정해야함
- Statement 재사용 설정
  - JDBC 드라이버가 statement pool을 제공할 수 있다면 JPA 설정에서는 이 속성을 빼고 드라이버 내에 statement 캐시 설정을 하는게 나음
- 자동 statement 배치 처리
  -  JDBC드라이버는 자동으로 statement 배치 처리 할 수 없으므로 이 설정이 유용할 수 있음
  - persistence.xml 설정을 바꾸거나 flush() 메서드를 호출해서 바꿈

#### JPA 읽기 최적화
- JPA는 데이터를 캐시하기떄문에 DB에서 데이터 읽는 시기와 방법을 최적화하는건 까다로움
- JPA 가 데이터베이스를 읽는 경우
  1. EntityManager의 find()메서드가 호출될때
  2. JPA 쿼리가 실행될 때
  3. 코드에서 기존 엔터티 관계 이용해서 신규 엔터티를 탐색할때

#####  기본 조회 - EntityManager의 find()메서드가 호출될때
- 최적화할 수 있는 요소: 조회할 데이터의 양
- 일부 컬럼만 가지고 오거나 조회할 컬럼에 관련됨 다른 엔터티를 prefetch(한 번 접속할때마다 여러 데이터를 미리 읽어들임)

1. 데이터 덜 읽기
- 대상 필드가 지연로딩(lazy loading) 되도록 명시 - `FetchType.LAZY`
2. 쿼리에 JOIN사용하기 
- Fetch Join 사용
- 단, JPA 캐시에 영향을 줄 수 있으므로 주의해야함
3. 배치와 쿼리 
- JPA 구현체는 선택적으로 한 번에 모든 결과를 가져오거나, 애플리케이션이 반복될 때마다 결과를 가져오거나, 한번에 결과 몇 개만 가져옴
- JPA에는 없지만 각 구현 프레임워크/벤더에는 페치 크기 설정 메커니즘이 있음
  - eclipselink : `q.setHint("eclipselink.JDBC_FETCH_SIZE", "10000")`
  - Hibernate : @BatchSize
    - 연관된 엔티티를 조회할 때 지정한 size만큼 SQL의 IN 절을 사용해서 조회
  - JPA 구현체가 네임드 쿼리를 위해 거의 statemenct 캐시 풀을 사용해서 preparedStatement를 사용하므로, 네임드 쿼리를 통해 데이터를 읽으면 대개 일반적인 쿼리보다 더 빠름
- 위 내용이 복합적으로 연관된 것이 'N + 1 성능문제'임

#### JPA 캐시
- Java내 자주 사용되는 데이터를 캐시하면 클라이언트의 응답 시간이 매우 빨라짐
- JPA는 두 종류 캐시가 있음. 로컬캐시(L1) , 글로벌캐시(L2)
- Entity Manager instance 는 그자체로 캐시임
- 하나의 트랜잭션 동안 조회되거나/쓰인 데이터를 로컬에 캐시
- 트랜잭션이 커밋될떄만 데이터베이스로 전송
- 각각 다른 트랜잭션을 수행하고 자체 로컬캐시를 갖고 있음
- 엔터티 매니저가 트랜잭션을 커밋할 때 로컬 캐시(L1) 내 데이터는 전부 글로벌 캐시로 머지될 수 있음. 글로벌 캐시(L2)는 애플리케이션 내 모든 엔터티 매니저 사이에서 공유됨
- 하이버네이트는 L2 사용이 기본 설정이 아님. 사용하려면 고쳐줘야함
- L2캐시를 사용하고 조율하는 방식이 성능에 많은 영향을 미침
- JPA캐시는 기본 키 접속 entity(find() 메서드 호출, 연관 엔터티에 접속 또는 이른 로딩해서 조회한 아이템)에만 동작함. 쿼리를 통해 반환한 아이템은 L2캐시 내에 없음.
  - 쿼리 캐시를 지원하더라도 엔터티 자체는 L2캐시 내에 저장되지 않으며 그 후 find()를 호출하더라도 사용할 수 없음
- 기본키나 ORM통해 객체 찾으려 할떄 L2캐시에서 찾아보고 있다면 객체 반환해서 데이터베이스까지 조회하는 시간 절약할 수 있음

#### JPA 캐시 크기 변경하기 
- 캐시가 메모리를 너무 많이 소비하면 GC압박이 생기게 됨. 이럴 경우 캐시 크기를 조정해 튜닝하거나 엔터티가 캐시되는 모드를 제어해야함

#### 배치 처리 
- 수백만 건의 데이터를 배치를 한다고 하면, 일반적인 방식으로 엔티티를 계속 조회하면 영속성 컨텍스트에 아주 많은 엔티티가 쌓이면서 메모리 부족 오류가 발생.
- 이런 배치 처리는 적절한 단위로 영속성 컨텍스트를 초기화
- L2 캐시에 엔티티를 보관하지 않도록 주의
- 일반적인 배치 처리 방법
  - 페이징 처리: 데이터베이스 페이징 기능 사용
  - 커서CURSOR: 데이터베이스가 지원하는 커서 기능 사용
    - JPA는JDBC 커서cursor를 지원하지 않음. 커서를 사용하기위해 하이버네이트 세션Session을 사용해야함
      - 하이버네이트 scroll 사용 - JDBC 커서를 지원
      - 하이버네이트 무상태 세션사용

#### JPA 읽기 전용 엔터티
- 읽기 전용 엔터티는 엔터티 상태 추적, 트랜잭션동안 락 잠그기 등의 작업을 할 필요가 없어 읽기-쓰기 엔터티보다 성능이 더 좋음
- 무엇보다 영속성 컨텍스트 관리에 드는 메모리 사용량을 최적화 할 수 있음
  - 영속성 컨텍스트는 변경감지를 위한 스냅샷 인스턴스를 보관하면서 메모리를 많이 사용함

1. 읽기 전용 쿼리 힌트 사용
- 하이버네이트의 경우, 'org.hibernate.readOnly' 사용
```java
TypedQuery<Order〉 query = em. createQuery("Select o from Order o", Order.class);
query.setHint("org.hibernate.readOnly",true);
```
2. 읽기 전용 트랜잭션 사용
- 스프링 프레임워크를 사용하면 트랜잭션을 읽기 전용 모드로 설정
`@Transactional(reado nly = true)`
- 하이버네이트 세션의 플러시 모드를 MANUAL로 설정해서 강제로 플러시를 호출하
지 않는 한 플러시가 일어나지 않는다.따라서 트랜잭션을 커밋해도 영속성 컨텍
스트를 플러시하지 않는다. 

3. 트랜잭션 밖에서 읽기
- 트랜잭션 없이 엔티티를 조회. 조회가 목적일때만 사용
- 트랜잭션을 사용하지 않으면 플러시가 일어나지 않으므로 조회 성능이
향상
- 스프링 프레임워크 설정
`@Transactional(propagation = Propagation.NOT_SUPPORTED)`
- J2EE 표준 컨테이너 설정
`0TransactionAttribute(TransactionAttributeType.NOT_SUPPORTED)`

- 베스트 케이스 = 읽기 전용 트랜잭션(or 트랜잭션 밖에서 읽기) +  읽기 전용 쿼리 힌트 적용(or 스칼라 타입으로 조회)
- 읽기 전용 트랜잭션 사용:플러시를 작동하지 않도록 해서 성능 향상
- 읽기 전용 엔티티 사용:엔티티를 읽기 전용으로 조회해서 메모리 절약

#### N + 1 문제
- 처음 실행한 SQL의 결과 수만큼 추가로 SQL을 실행하는 것
- 즉시 로딩은 사용하지 말고 지연로딩을 되도록 사용하자. 성능 최적화가 필요한 곳에서는 JPQL의 페치 조인을 사용하자
  - 즉시 로딩은 비즈니스 로직에 따라 필요하지 않은 엔티티를 로딩해야 하는 상황이 자주 발생.  
  - 가장 큰 문제는 성능 최적화가 어렵다는 점이다. 
  - 엔티티를 조회하다보면 즉시 로딩이 연속으로 발생해서 전혀 예상하지 못한 SQL이 실행될 수 있음
- JPA의 글로벌 페치 전략 기본값은 다음과 같다.
  - @OneToOne, @ManyToOne：기본 페치 전략은 즉시 로딩
  - @OneToMany, @ManyToMany：기본 페치 전략은 지연 로딩

##### 예제 
회원
```java
@Entity
public class Member {

  @Id @GeneratedValue
  private Long id;
  @OneToMany(mappedBy = "member", fetch = FetchType.EAGER)private List<Order> orders = new ArrayList<Order>();
  ...
}
```
회원의 주문정보
```java
@Entity
@Table(name = "ORDERS”》
public class Order {
  @Id @GeneratedValue
  private Long id;
  @ManyToOne
  private Member member;
  ...
}
```

- 1:N , N:1 양방향 연관관계
- 회원이 참조하는 주문정보인 Member .orders를 즉시 로딩으로 설정

##### 즉시로딩
- 특정 회원 조회시, `em.find (Member. class, id);` 주문정보도 함께 조회
- 실행 SQL : Join 을 통해 회원과 주문정보 함께 조회
```SQL
SELECT M.*, 0.*
FROM
MEMBER M
OUTER JOIN ORDERS 0 ON M.ID=O.MEMBER_ID
```
- 문제상황 - JPQL 사용할때 발생 -> JPA는 JPQL만 사용해서 즉시로딩 / 지연로딩 상관없이 SQL을 생성
```java
List<Member> members = em.createQuery("select m from Member m", Member.class).getResultList();
```
먼저 실행되는 SQL
```SQL
SELECT * FROM MEMBER
```
연관 주문 컬렉션이 즉시 로딩으로 설정되어있으므로 다음 SQL을 추가로 실행
```SQL
SELECT ★ FROM ORDERS WHERE MEMBER_ID=?
```
만약 조회된 회원이 5명 이라면
```SQL
SELECT * FROM MEMBER //I번 실행으로 회원 5명 조회
SELECT * FROM ORDERS WHERE MEMBER_ID=1 //회원파 연관된 주문
SELECT ★ FROM ORDERS WHERE MEMBER_ID=2 //회원과 연관된 주문
SELECT * FROM ORDERS WHERE MEMBER_ID=3 //회원과연관된주문
SELECT ★ FROM ORDERS WHERE MEMBER_ID=4 //회원과연관된주문
SELECT * FROM ORDERS WHERE MEMBER_ID=5 //회원과 연관된 주문
```

##### 지연로딩을 한다면? 
- `FetchType.LAZY`로 설정
- 데이터베이스에서 회원만 조회됨. 
  `SELECT * FROM MEMBER`
- 비즈니스 로직에서 주문 컬렉션 실제 사용할떄 지연로딩 발생
```java
firstMember = members .get (0);
firstMember.getOrders () .size (); / / 지연 로딩 초기화
```
실행 SQL은 아래와 같음
```SQL
SELECT * FROM ORDERS WHERE MEMBER_ID=?
```
- *하지만, 모든 회원에 대해 주문 컬렉션을 사용한다면?*
```java
for (Member member : members》 {
    //지연 로딩 초기화
    System.out.printIn("member = " + member.getOrders().sizㄷ();
}
```

```SQL
SELECT * FROM ORDERS WHERE MEMBER_ID=1 //회원파 연관된 주문
SELECT ★ FROM ORDERS WHERE MEMBER_ID=2 //회원과 연관된 주문
SELECT * FROM ORDERS WHERE MEMBER_ID=3 //회원과연관된주문
SELECT ★ FROM ORDERS WHERE MEMBER_ID=4 //회원과연관된주문
SELECT * FROM ORDERS WHERE MEMBER_ID=5 //회원과 연관된 주문
```

##### 페치조인 사용
- 조인 사용해서 연관 엔터티 함께 조회하므로 문제 해결됨. 실제 사용할땐 JPQL의 DISTINCT 사용해서 중복을 제거하자
```SQL
select m from Member m join fetch m.orders
```
실행 SQL
```SQL
SELECT M.*, 0.* FROM MEMBER M
INNER JOIN ORDERS 0 ON M.ID=O.MEMBER_ID
```

#### 배치 처리
#### SQL 쿼리 힌트 사용
#### 트랜잭션을 지원하는 쓰기 지연과 성능 최적화

### FrameWork 사용하지 않을때 / 애플리케이션과 데이터베이스 사이 계층이 없을때
- 잠깐 체크 .JDBC 관련 API는 interface이므로, 같은 interface라 하더라도 DB vendor에 따라 처리속도나 내부 처리방식이 다름. 사용하는 vendor를 더 살펴보아야함

#### DB connection시, 공통 유틸 사용
- 일반적으로 DB 관련처리 담당하는 DBManager 클래스를 사용함
-  WAS 에서 제공하는 DB conection Pool 또는 DataSource 사용
- Why? 
  - DB에 쿼리날린다고 했을때, 가장 느린 부분은 DB와 WAS 사이 통신을 하는 Connection객체를 얻는 부분임. 
  - 사용자 증가시 Connection객체를 얻기 위해 시간 증가할 것임)
  - Connection 객체 생성 부분에서 발생하는 대기시간을 줄이고, 네트워크 부담을 줄이기 위해 DB connection Pool을 사용함
    - Connection Pool을 사용하면, 시스템이 가동되면 지정된 개수만큼 연결하고，필요할 때 증가시키도록 되어있음(지정된 최대값까지만). 
    - 사용자가 증가해 더 이상 사용할 수 있는 연결이 없으면， 여유가 생길 때까지 대기. 그러다 어느정도 시간이 지나면 오류가 발생
  - 검증되지 않은 Connection Pool은 성능저하를 일으킬 수 있음
(Q.정확한 정의가 뭐여 커넥션 풀 )

#### 각 모듈별 DataSource사용해서 리소스 부족현상 방지 
#### Connection, Statement 관련객체, ResultSet들을 close
- 질문. GC될 때까지 기다리면 안되나? 
  - GC하기 전에 사용 후 바로 닫아서 DB와 JDBC 리소스를 해제해서 DB 서버의 부담을 줄이자
  - GC가 될 때까지 기다리면 Connection Pool이 부족해질 수 있음
- Statement의 경우, GC대상이 되거나 close() 하는 두 가지 경우에만 닫힌다
- try-catch-finally 를 사용해 close() 합시다
- JDK 7 이상이면 [AutoClosable 인터페이스](https://docs.oracle.com/javase/8/docs/api/java/lang/AutoCloseable.html)로 구현되어있는 리소스 객체라면 [try-with-resource](https://docs.oracle.com/javase/tutorial/essential/exceptions/tryResourceClose.html)를 사용하면 됨

#### Prepared Statement 사용
- Statement대신 PreparedStatement를 사용하면, 이미 사용한 SQL에 대한 정보를 재사용 할 수 있어서 이점이 있음 
- 같은 요청을 여러번하는 배치성 프로그램, 애플리케이션 서버는 PreparedStatement나 DB Framework를 사용하자.

#### 캐싱
- JDBC는 네트워크 통신, 데이터 변환, 서버측 처리의 부담을 안고 있음. 때문에 JDBC 데이터를 캐싱해야함. 그렇다면 '어떤 데이터를 어떻게 캐싱해야할 것인가'
- 어떤 데이터를? (캐싱 대상) : 읽기 전용의 작은 테이블과 자주 갱신되지 않는 테이블
- 어떻게 캐싱?
  - ResultSet 레이어에서 캐싱
  - ResultSet에서 추출되고 객체 또는 객체 데이터로 변환된 뒤 캐싱

#### 추가 팁
- 데이터베이스 서버의 위치?
- 트랜잭션 최적화
  - setAutoCommit() 메서드는 필요할 때만 사용
  - setAutoCommit()의 자동 커밋 여부를 지정은 반드시 필요할 때만 하자.  
    - 단순한 select 시 커밋 여부를 지정하게 될 경우, 여러 개의 쿼리를 동시에 작업할 때 성능에 영향을 주게 됨
- 일괄 갱신
  - 배치성 작업은 executeBatch() 메서드 사용
    - 배치성 작업올 할 때는 Statement 인터페이스에 정의되어 있는 addBatch() 메서드를사용하여 쿼리를 지정하고， executeBatch() 메서드를사용하여 쿼리를 수행. 여러 개의 쿼리를 한 번에 수행할 수 있기 때문에 JDBC 호출 횟수가 감소되어 성능이 좋아진다
- 행 페치 최적화를 위한 일괄 접근 
  - setFetchSize()(Statement와 ResultSet 인터페이스) 메서드를 사용하여 데이터를 더 빠르게 가져오자
  - 한 번에 가져오는 열의 개수는 JDBC의 종류마다 다름
  - 가져오는 데이터의 수가 정해져 있을 경우에는 에 있는 setFetchSize() 메서드를 사용하여 원하는 개수를 정의
  - 너무 많은 건수를 지정하면 서버에 많은 부하가 올 수 있으니， 적절하게 시용필요
- 한 건만 필요할 때는 한 건만가져오자.
- 게시판 페이징 처리 하기 위해 ResultSet객체.last() 메서드 사용금지
  - [Java API - Interface ResultSet의 last method](https://docs.oracle.com/javase/7/docs/api/java/sql/ResultSet.html#last)는 ResultSet객체가 갖고 있는 결과의 Cursor를 맨 끝으로 옮기는 메서드임.
  - 메서드의 수행 시간은 데이터의 건수와 DB 통신 속도에 따라서 달라짐. 건수가 많으면 많을수록 대기 시간(Wait time)이 증가해서 rs.next()와 엄청나게 속도차이가 나게됨.


cf. Exception 처리에 대해서(자바7에 추가된 try-catch-resources 포함)http://blog.eomdev.com/java/2016/03/31/exception.html
- 책 - 자바 ORM 표준 JPA 프로그래밍 (김영한)
- 책 - 자바 성능 튜닝(스캇 오크스)
- 책 - 자바 성능 튜닝 이야기 (이상민)
- 책 - 자바 퍼포먼스 튜닝 (잭 시라지)

---------

## 서버 세팅
- 서버 세팅 문제 진단할때 기본은 성능 테스트를 통해 병목 지점 미리 파악하는 것
- 애플리케이션 위주 병목 보다 문제가 될 만한 세팅값을 먼저 진단하는 것이 효율적일 수 있음
### 1. 아파치 웹 서버 세팅
- 정적인 부분 웹 서버에서 처리하도록 WAS 앞에 두어야함
- 상용서버의 경우, 벤더에서 설치와 설정을 해주니 제외함
- 아파치 웹 서버는 MPM(Multi-Processing Module)을 사용. 여러 개의 프로세싱 모듈 기반의 서비스를 제공함.
- 가장 손쉬운 설정 변경은 설치 폴더/conf 디렉토리의 'httpd.conf' 수정
  - ThreadsPerChild N(숫자값 설정을 뜻함)
  - MaxRequestsPerChild N
ㅌ
### 2. WAS 서버 세팅

### 3. DB 서버 세팅

### 4. 장비 세팅