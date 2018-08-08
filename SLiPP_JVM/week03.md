- 발표자료


# 기본 GC 튜닝
- GC의 성능은 기본 동작에 따라 좌우됨
  - 사용하지 않는 미사용 객체 찾기
  - 가용 메모리 생성
  - 힙 압축 등등
- 가비지 컬렉터별 기본 동작에 대해 다른 접근 방식을 취함. 성능상의 특징이 달라지는 이유가 됨
- 일반적으로 애플리케이션 성능에 가장 큰 영향을 미치는 stop the world pause(가비지 컬렉션을 실행하기 위해, 모든 애플리케이션 스레드가 중지시키는 것)가 최소화되도록 고려해야함 

## 가비지 컬렉터 고르기 - 뭐야 이게 
- 저번 시간(링크)의 가비지컬렉터 
- G1이 가장 성능이 좋으나, 각 상황에 따라 트레이드오프를 고려하여야함.
- 개별적인 요청은 중지 시간, 특히 풀 GC에 의한 긴 중지 시간에 영향을 받을 것이다. 
- 목표가 중지 시간이 응답 시간에 미치는 영향을 최소화시키는 것이라면 동시 병렬 컬렉터가 좀 더 적절할 것 이다.
- 평균 응답 시간이 특이 요소(예 응답 시간의 99%대)보다 더 중요하다면 보통 처리율 컬렉터가 더 나은 결과를 낼 것이다.
- 동시 병렬 컬렉터로 긴 중지 시간을 피하는 이점을 얻는 대신 CPU 사용률에 대한 추가 비용이 들어간다.

### 배치 애플리케이션의 경우 고려해야할 트레이드 오프
•CPU 제한되어 있을 경우 : 동시 병렬 컬렉터가 CPU를 추가적으로 소비하게 되어 배치 작업을 하는 데 더 많은 시간이 걸리게 됨
•단, CPU를 중분히 사용할 수 있다면, 동시 병렬 컬렉터를 사용하면 작업이 더 빨리 끝남(풀 GC 중지를 피함)

-----
## GC 알고리즘 선택
- 선택 기준 : 애플리케이션의 상태 & 애플리케이션에 대한 성능 목표
- 대부분은 Parallel collector, CMS, G1 을 사용함
- 특히 G1은 여러 컬렉터의 단점을 개선한 것이기 때문에 상당한 성능상 이점이 있음
- Serial Collector? 
- 애플리케이션이 100MB 미만으로 사용하는 경우
  - 애플리케이션이 Pararell collector, CMS, G1 의 컬렉션 대상이 안되는 작은 힙을 요청함
p.166 ~ 171

## 기본 GC 튜닝
- 많은 상황에서 기본 튜닝만으로도 충분함. 
- GC 알고리즘의 공통 환경 설정 매개 변수(configuration parameter) 사용한 튜닝

### 힙 크기 정하기
- 애플리케이션이 실행되고 있는 플랫폼의 default 최대값보다 큰 힙을 필요로 하지 않을때 효과적
- 가용시스템 자원을 기반으로 힙에 대한 '합리적인' 디폴트 초기값을 찾고 합리적인 최대 값으로 힙의 크기를 올리는 것
- 힙 크기 조정 플래그 : ```-XmsN ``` /  ```-XmxN ```
- 힙에 대한 초기, 최대 크기가 지정되어 있으므로, '알맞은' GC의 수를 유지하거나 최대 크기가 될 때까지 힙을 지속적으로 늘림
- 주의. 
  - 명시적으로 최대 크기를 설정하더라도 힙의 크기는 자동 조정됨
  - 때문에 필요로 하는 것보다 더 큰 힙을 명시해도 반드시 메모리상 불이익이 아님. GC 성능 목적을 만족시킬 정도만 늘어남
- 힙의 크기는 어떤게 적절할까?
- 만약, 힙이 너무 작다면? 
  - 일단, 애플리케이션 로직 수행시간이 오래걸림 
  - GC 수행 시간이 많이 걸림
- 만약, 힙이 매우 크다면?
  - GC 중단이 일어난 기간이 길어지면서 성능이 지연됨
  - 풀 GC동안 시스템이서 스와핑이 발생할 경우 중단은 더 길어짐 (p.172)

1. 머신 내의 물리적인 메모리 크기보다 더 큰 힙을 지정하지 말자
- JVM이 여러 개 실행 되고 있다면 모든 힙의 총합을 넘지 않도록 함
- OS 프로파일을 위해서 적어도 1GB의 공간이 필요
2. 경험상 풀 GC 가 일어난 후에 30%로 설정하는 것
- How? 
  - 정상 상태(steady-state, 캐시한 것이 로드되고, 클라이언트 연결이 최대치까지 생성되는 등의 시점)의 설정에 도달할 때까지 애플리케이션을 실행
  - 그 다음 강제로 풀GC 일으키고 풀GC가 완료될 때 사용된 메모리 갯수 관찰
  - GC 로그 참조
3. 애플리케이션에서 필요로 하는 힙의 크기를 정확하게 안다면, 힙의 초기와
최대 값을 설정 (```-Xms4096m ``` /  ```-Xmx4096m ```) 
- 힙 크기를 조정하면서 적절한 조정값을 알아낼 필요가 결코 없기 때문에 약간 더 효율적임

- Q.실제 힙 크기 어떻게 할당하고 있나요?
  - 경험적으로 할당 
  - ```-XmsN ``` /  ```-XmxN ``` 같게 할당하는 사례
  - 힙 크기에 대한 전면적인 통제 (p.244)

### 제너레이션의 크기 정하기
- 영/올드 제너레이션에 힙 얼마나 할당할지 정하기
- think. 영/올드 제터레이션 사이의 균형 찾기 
  - 영 제너레이션이 비교적 더 크다면 덜 자주 수집되고 더 적은 객
체가 올드 제너레이션으로 감. 
  - 올드 제너레이션이 비교적 더 작기 때문에 더 자주 가득 차고 풀GC가 자주 일어남. 
- 튜닝 플래그는 영 제너레이션의 크기를 조정함. 올드 제너레이션은 그 나머지 공간.

- ```XX:NewRatio=N``` :올드 제너레이션과 영 제너레이션의 비율 설정
 - 초기 영 제너레이션 크기 = 초기 힙 크기 / (1 + NewRatio)
 - default : 초기 힙 크기 33%
- ```XX:NewSize=N``` : 영 제너레이션의 초기 크기 설정
  - NewRatio 계산 값보다 우선함
  - default값 없음
- ```XX:MaxNewSize=N``` : 영 제너레이션의 최대 크기 설정
  - default : 최대 힙 크기
- ```XmnN``` : NewSize와 MaxNewSize 양쪽에 동일한 값
  - 힙크기 고정(```-XmsN ``` =  ```-XmxN ``` 같을때)일 때 사용.  

### 퍼머넌트 제너레이션과 메타스페이스 크기 정하기
- Permenant와 metaspace는 무엇인가?
-  JVM 이 클래스 로드할때 특정 메타데이터에 대해서 계속 파악하고 있어야함
-  이 정보는 독립된 힙처럼 작동함. 자바 7에서 permgen(또는 퍼머넌트 제너레이션)이라고 불리고, 자바 8에서는 메타스페이스(Metaspace)라고 함
-  퍼머넌트 제너레이션/메타스페이스 내의 정보는 컴파일러와 런타임에만 사용됨. 이때 갖고 있는 데이터는 클래스 메타데이터
- 이 크기는 사용되는 클래스의 수에 비례함.
- 메타 스페이스는 필요한 만큼의 공간을 default로 사용함
- 플래그
  - 퍼머넌트 제너레이션 :  ```-XX:PermSize=N``` / ```-XX:MaxPermSize=N``` 
  - 메타스페이스 : ```XX:MetaspaceSize=N``` / ```-XX:MaxMetaspaceSize=N```
  - 초기 크기를 기반으로 동적으로 크기를 정하고 최대 크기에 필요한 만큼 늘어남
- 이 영역의 크기를 다시 정하려면 풀 GC가 일어남 (비용이 높음)
- 어떤 경우에 어떻게 사용하는가?
  - (클래스가 로딩되면서) 프로그램이 스타트업하는 동안 풀 GC가 많이 일어나면 퍼머
넌트 제너레이션이나 메타스페이스의 크기가 변경됐기 때문임. 스타트업 속도를 개선하기 위해 초기 크기를 변경하는 편이 좋음.
  -  애플리케이션 서버는 전형적으로 최대 퍼머넌트 제너레이션의 크기를 128MB, 192MB나 그 이상
으로 명시함
  - 스타트업 직후에 클래스를 로드하지 않는 애플리케이션에서는 모든 클래스가 로드된 후의 사용량을 기반으로 초기값을 정함. 스타트업이 약간 빨라지게 됨
  - 개발서버(클래스가 자주 재정의되는 환경)에서는 이 영역이 가득차고, 기존 클래스 메타데이터가 폐기될때 가끔 풀GC가 발생됨 
  - Perm 영역의 크기는 OutOfMemoryError가 발생하고, 그 문제의 원인이 Perm 영역의 크기 때문일 때에만 -XX:PermSize 옵션과 -XX:MaxPermSize 옵션으로 지정해도 큰 문제는 없다.
- java reflection 예제 


### 병렬성 제어하기
- GC 알고리즘은 여러개의 스레드를 사용 (시리얼 컬렉터 제외)
- 플래그
  - 스레드 개수 제어 ```-XX:ParaUelGCThreads=N```
  - 다음 동작 스레드 개수에 영향을 미침
  - ```-xx:+UseParallelGC``` 사용할 때 영 제너레이션의 컬렉션
  - ```-xx:+UseParallelOldGC``` 사용할 때 올드 제너레이션의 컬렉션
  - ```-xx:+UseParNewGC```  사용할 때 영 제너레이션 컬렉션
  - ```-xx:+UseG1GC```  사용할 때 영 제너레이션 컬렉션
  - CMS의 모든 애플리케이션 스레드 중단 단계 (stop-the-world)
  - G1의 모든 애플리케이션 스레드 중단 단계 (stop-the-world)
  - CMS, G1이 사용하는 백그라운드 스레드의 수를 설정하진 않음
- 모든 GC알고리즘에 사용하는 스레드의 기본개수는 머신 CPU개수를 기반으로함
- 단일 머신에 여러개의 JVM이 실행되고 있는 경우, 스레드 수가 너무 많다면 줄여야함

### 특이한 경우 - 매우 큰 객체의 할당

### 특이한 경우 - 짧게도 길게도 사용하지 않는 객체

------

# 알고리즘별 GC 튜닝
- 기본 튜닝으로 충분하지 않을때, 사용 중인 GC 특성 동작을 분석해 최적화된 튜닝을 해야함

## G1 GC
- 튜닝과 연관된 특성
  - region 별로 generation을 지정해서 효율이 좋지만 튜닝하는게 까다로움
  - Old Generation GC를 꼭 필요할 때에만 실행한다. 보통 New Area와 Old Area 비율이 일정 값 이하로 떨어질 때 실행하게 된다. Young GC만 하다가 Old Area가 지속적으로 증가하여 New Area가 감소되면 Old Generation GC를 통해 어느 정도 회복을 한다.
물론 이 과정에서도 충분히 회복을 하지 못하면 결국엔 Full GC를 통해 회복을 하게 된다.
- 지금까지 알려진 문제
1. perm generation collection을 풀GC때만 함 (JDK 7)
  - Hot Deploy를 많이 할 경우 perm Generation문제 발생 (http://openjdk.java.net/jeps/156)
  - 자주 재배포 발생 코드가 있는 경우 문제가 생김 (class unloading을 풀GC때만 실행)
  - 단, JDK 8u40 버전에서 permanent generation을 없애고 metaspace 방식으로 바꾼 후에 해결됨
    - class 영역이 클 경우 class unloading을 하는 gc 시간이 매우 길어질 수 있음
      - ```-XX:+UseLargePagesInMetaspace```
      - metaspace에 large page를 사용하여 접근하도록 함 (cf.TLB 관련 이슈)
2. 메모리 사용량이 큰 객체(humongous object)에 대한 처리가 최적화되지 않음
  - 큰 객체가 있을 경우, 다른 GC를 고려해아야함

- 어떻게 튜닝해야할 것인가? 
  - [Tuning Java Garbage Collection for Apache Spark Applications](https://databricks.com/blog/2015/05/28/tuning-java-garbage-collection-for-spark-applications.html)
  - 주요 포인트 
    - 사용하는 ConcGCThread 수를 늘림
    - InitiatingHeapOccupancyPercent옵션을 기본값보다 더 작게 설정
      - old heap region을 언제부터 mark하는지 지정

## Parallel GC 
- 고려해야할 포인트
  - 영/올드 제너레이션 크기와 전체 힙 크기사이 균형
  - 중단시간
- 참고해야할 트레이드 오프
  - 힙의 크기 : 메모리 소비가 큰 대신, 애플리케이션 처리율이 높아짐
  - GC 수행하는데 걸리는 시간 : 힙 크기가 크면 풀GC 중단횟수가 줄어들지만 GC가 더 오래 걸려서 평균 응답 시간이 길어짐
  - 풀 GC 중단 : 영 제너레이션에 더 많은 힙 할당하면 줄어들지만, 올드 GC컬렉션 빈도가 늘어남
    - p.194 그림

참고.
- https://logonjava.blogspot.com/2015/08/java-g1-gc-full-gc.html
- http://openjdk.java.net/jeps/156

-------
## JVM 구조
[그림]
1. class 파일 JVM 으로 로딩
2. class 파일을 Execution Engine을 통해 해석
3. Runtime Data areas에서 동작
- Tread 관리, Garbage collection 관리 작업 실행

## Runtime data area (RDA)
[그림]
- Java 프로그램 수행하기 위해 OS에서 할당받는 메모리 영역
- WAS 사용할때 가장 빈번하게 성능문제가 발생함
- PC Register, Java Virtual Machine Stacks, Native Method Stacks은 Thread 별로 생성
- Method Area와 Heap은 모든 Thread에 공유된다.
- Java Virtual Machine Stacks, Native Method Stacks은 JVM 1.3 버전에서 통합

## PC Register
[그림]
- cf. PC counter : CPU에서 현재 실행 중인 명령어 다음에 실행될 명령어의 메모리 주소를 담고 있는 레지스터
- PC register: stack base로 동작. Stack에서 operand를 뽑아내어 이를 별도의 메모리 공간에 저장
- 각 thread 마다 하나씩 존재. JVM은 연산을 위해 필요한 operand를 임시로 저장하기 위한 용도로 PC Register를 활용. PC Register는 현재 수행중인 JVM Instruction의 주소를 가지고 있게 된다. 

## Java Virtual Machine Stacks
[그림]
- Thread의 수행 정보를 기록하는 Frame을 저장하는 메모리 영역
- JVM Stacks는 Thread별로 하나씩 존재하기 때문에 동기화 이슈가 발생하지 않음.

### Stack Frame
- Thread가 수행하고 있는 Application을 Method 단위로 기록하는 곳
- Class의 메타 정보를 활용해 크기를 할당하는데 이 크기는 가변이 아니라 Compile Time에 이미 결정된다.

### Local Variable Section
- Local Variable Section은 0부터 시작하는 인덱스를 가지는 Array로 구성
- 인덱스를 통해 데이터에 접근
- 메모리 크기를 가변이 아니라 Compile Time에 결정할 수 있는 primitive type은 크기를 결정할 수 있으며, Object, Array, String과 같은 객체는 reference를 활용해 Heap 메모리를 참조하도록 할 수 있기 때문이다.
- primitive type가 reference보다 성능상 유리함
  - Reference는 Local Variable Section에서 Heap으로의 이동이 발생(CPU 연산)
- reference는 크기가 가변적이기 때문에, referece에 대한 주소가 저장이 됨

### operand stack
- JVM이 프로그램을 수행하면서 연산을 위해 사용되는 데이터 및 결과를 처리하는 영역. JVM의 작업공간
- OS에 종속적이지 않기 위해 따로 Operand 를 저장함
Stack이라는 말처럼 미리 공간을 할당하지 않고 push, pop 작업을 통해 필요할 때마다 공간을 할당한다.

각 Method별 StackFrame이 존재하는 영역이 이 영역이다.
kill -3 pid로 Stack Trace 또는 Stack Dump를 얻어내어 분석하는 영역이 이 영역이다.








