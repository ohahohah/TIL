# 코드 실습하면서 정리 - 사실 / 깨달은 것 / 느낀 것
- SpringBoot, JPA 들어보기만 했지 실제로 코드로 보는 건 처음이라 당황했다. 진땀난다.
  - springboot, JPA 공부하고 코드 작성할까 하다가 힌트를 참고해 일단 부딪혀보기로 했다.
    - 당연히 코드를 읽을 수 있어야 가능하겠지만, 일단 목표인 인수테스트 먼저 경험해보자! 초초초친절한 힌트와 가이드가 있어서 시도해볼 수 있다.
      - 처음 접하는 코드를 어떻게 이해하고 접근해나갈지 이번 기회에 좌충우돌하면서 과정을 정리해봐야겠다.
    - Spring 스터디할때 정리했던 DI,AOP 자료를 봐도 머리가 새햐얗다
- 처음 접하는 것, 익숙하지 않은 것을 접할때 머리가 새햐얗게 될 정도로 많이 당황한다. 요즘 코딩테스트를 준비하면서 좌절하는 부분. 시험에 정말 정말 정말 약하다.

## 코드 처음 접할때
- 일단 익숙한 부분을 찾는다.
  - 이 경우엔 구조를 아는 테스트코드 먼저 보기
  - 테스트코드 안에서 다행히 RESTful API 개발했을때 썼던 함수와 비슷한 부분을 발견했다.
  - 흠 이런 방식으로 테스트하는군
- 익숙한 부분이 없을때 멘탈깨질때 잠시 도망친다
  - 혼자 시간들여서 조금씩 공부해서 익숙하게 된 것(git 사용처럼)을 해보면서 자신감을 얻는다
  - 정신승리한다 - 삽잘하다보면 언젠간 되겠지
  - 명상을 한다
- 잘하는 사람에게 SOS 친다 (여기선 자바지기에게 물어볼 수 있다. oh yeah!)
  - 아는 부분까지 정리하고, 어디까지 아는지 모르면 어디서부터 모르는지 정리해서 물어본다

# 코드 실습 관련
##  LoginAcceptanceTest 
- 처음에 로그인 성공/ 00한 경우에 로그인 실패 가 인수테스트인줄 알았음. 아님!
  - 위 테스트케이스는 단위테스트임
- [질문]사용자 입장으로 생각했을때, 로그인 했을때 제대로 된 페이지가 보이면 성공한건가?
  - [답변] 사용자 관점에서 요청을 보냈을 때 어떤 응답이 오는지를 집중적으로 테스트. 로그인의 경우 성공과 실패 두가지로 나눠 테스트하면 됨.
    - 사용자가 요청을 보냈을때(로그인 버튼을 클릭했을때) 응답의 결과인 새로 로딩된 사용자 페이지가. 정상인지 (HttpStatus.FOUND)로 설계하는것

## JPA 잘 모르는데요? 
- 미리 구현된 코드 중에 이해안가는 부분 찾아봄.
```
import org.springframework.data.jpa.repository.JpaRepository;
...

public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByUserId(String userId);
}
```
-> 스프링 데이터 JPA가 메소드이름 분석해서 JPQL 실행해줌. 세상에 충격이야.
  - JpaRepository 코드를 까봐도 모르겠어서 회사서가 책을 찾아봤다. 충격. 세상에 이런걸 지원해줌??? 직접 그동안 짰던 내가 원시인 같음. 현업에서 안쓰더라도 도움이 될 것같아서 JPA책 지원신청했는데 신청하길 잘했다.
  > 일반적인 CRUD 메소드는 JpaRepository 인터페이스가 공통으로 제공하므로 문제가 없다. 그런데 MemberRepository.findByUsername(...)처럼 공통으로 처리할 수 없는 메소드는 어떻게 해야 할까? 놀랍게도 스프링 데이터 JPA는 메소드 이름을 분석해서 다음 JPQL을 실행한다. 
  > ```
  > select m from Member m where username =:username
  > ```
  > from. [자바 ORM 표준 JPA 프로그래밍(김영한 지음, 에이콘출판사)](http://acornpub.co.kr/book/jpa-programmig)

## Optional 이해
- 구현되어있는 코드 이해를 돕기 위한 자료
  - [자바8 Optional 1부: 빠져나올 수 없는 null 처리의 늪](http://www.daleseo.com/java8-optional-before/)
  - [자바8 Optional 2부: null을 대하는 새로운 방법](http://www.daleseo.com/java8-optional-after/)
  - [자바8 Optional 3부: Optional을 Optional답게](http://www.daleseo.com/java8-optional-effective/)
  - map : 함수형 프로그래밍의 핵심연산 중 하나로, `원래 컬렉션에 담긴 요소를 새로운 값으로 변환한 다음, 변환된 값들을 담고 있는 새로운 컬렉션을 생성한다. 원래 컬렉션과 새로운 컬렉션은 크기가 동일하다(from. Funtional Prgramming for Java Developers)`
