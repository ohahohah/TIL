## memo
- Spring 에서의 DI 에 대해서 중점적으로 적는다. 

## IoC 란?
- IoC(Inversion Of Control)
  - https://martinfowler.com/articles/injection.html
  - [한글 번역 요약본 - [번역] IoC 콘테이너와 디펜던시 인젝션 패턴 - javacan,최범균](https://javacan.tistory.com/entry/120)
- IOC 하지 않은 것
  ```java 
    class OwnerController {
      private OwnerRepository repository = new OwnerRepository();
    }
  ```
  - OwnerController 가 repository 를 직접 만들어서 의존성을 가지고 있다. 내가 사용할 의존성은 내가 만들겠어.
 - **controll 이란건, OwnerController 가 내가 어떤 class 사용할 건지(OwnerRepository 사용할거야) 정하고, 언제 어떻게 그 object 를 만들지 흐름을 스스로 관장한다.** 
- **Depedency Injection 도 IoC 라고 볼 수 있겠지.**
    ```java
      class OwnerController {
        private OwnerRepository repo;

        public OwnerController(OwnerRepository repo){
          this.repo = repo;
        }
      }
    ```
  - 어디선가 생성된 repo를 주입받음. Dependency 를 injection 받음
  - 내가 사용할 것 의존성 type or interface 만 맞으면 됨. 
    - 의존 주입 대상이 되는 객체를 생성하는 곳만 수정해주면 됨.
  - 테스트하기도 편하다고 함. 
  - **IoC이기 때문에, 내가 사용할 object 를 스스로 선택하지도 않고, 언제 어떻게 생성될지 사용될지를 알 수 없다. 모든 제어 권한을 다른 대상에 위임한다.** 

- Spring 의 IoC container 가 clinicService,visits 타입에 맞는  (OwnerRepository, VisitRepository) Bean(Spring이 관리하는 객체) 찾아서 Injection시켜줌. 
  - injection 은 annotation 등을 보고 해줌
  ```java
    class OwnerController {
      private final OwnerRepository owners;
      private VisitRepository visits;
        
      public OwnerController(OwnerRepository clinicService, VisitRepository visits) {
        this.owners = clinicService;
        this.visits = visits;
      }
    }
  ```
  
- Spring이 제공하는 DI 기능, Container 의 lifecycle 관리 등의 이유로 Spring assembler(조립기, 객체 생성, 의존 주입을 처리) 를 통해 DI를 사용하고 있음.

## DI
### 의존성 Dependency
- 기능 구현을 위해 다른 구성 요소를 사용하여 의존 대상 객체의 변경에 영향을 받을 때 'Depenecy 가 있음'. 
  - 예: 객체 생성, method 호출, 데이터 사용
- 예를 들면, 아래 코드에서 OwnerRepository의 save 함수를 save(Owner owner, int code) 로 바꾸면 이 method 를 사용하는 OwnerController 의 소스 코드도 바뀌어야한다. 
  ```java
    class OwnerController {
        private OwnerRepository repo;

        public OwnerController(OwnerRepository repo){
          this.repo = repo;
        }
        
        public String processCreationForm(@Valid Owner owner, BindingResult result) {
          owners.save(owner);
		}
    }
  ```
  - 의존하는 객체(OwnerController와 같은)와 의존되는 객체(OwnerRepository와 같은) 사이에 Aggregation 과 composition 관계라고 볼 수도 있음. 
    - OwnerController 와 OwnerRepository 가 다른 생명 주기를 가지면 Aggregation,집합
      - 집 - 냉장고
    - 다른 생명주기면 composition,구성. 
      - 사람 - 심장
- Circular Dependencies,순환 의존은 정말 난감하다.
  - A -> B -> C 의존 관계가 있을 때, A 가 변경되면 B가 그리고 C 모두 변경해주어야한다. 
- 의존하는 대상이 많다면? 
  - X 가 A,B,C, D, E 를 의존하고 있다면 다섯 object 중 하나라도 변경된다면 X를 변경해주어야한다. 언제 바꾸어주어야할지 모르는 폭탄을 들고 가는 기분이겠지.
  - AS-IS - 하나의 class에 여러 기능
    ```java
    public class UserService {
        public void regist(RegReq regReq){
            //코드 조각 생략
        }

        public void ChangePw(ChangeReq chgReq){
            //코드 조각 생략
        }

        public void blockUser(Strign id, String reason){
            //코드 조각 생략
        }
    }
    ```
  - TO-BE : 기능별로 분리
    ```java
    public class UserRegistService {
        public void regist(RegReq regReq){
            //코드 조각 생략
        }
    }

    public class ChangePwService {
        public void ChangePw(ChangeReq chgReq){
            //코드 조각 생략
        }
    }

    public class UserBlockService {
        public void blockUser(Strign id, String reason){
            //코드 조각 생략
        }
    }
    ```

### Dependecy Injection 이 왜 편할까?
- spring 설정 없이, 드라이버 - 자동차 - tire 예제로 살펴보자.
  - from 책 - 스프링 입문을 위한 자바 객체지향의 원리와 이해, IoC/DI - 제어의 역전/ 의존성 주입 234p 부터
- 생성 클래스가 바뀌면 의존하는 코드도 바뀜. 
- DI 외에 의존 대상 객체를 직접 생성하지 않는 방법
  - 팩토리, 빌더
  - Service Locator 
- 장점
  - 아래 예제처럼 상위 type (interface) 사용할 경우, spring assembler 만 변경하면 됨.
  - 의존하는 객체 없이 MockObject 를 사용해 테스트 가능
    - MockObject 를 사용하면 상태 초기화도 할 수 있기 때문에 원하는 상황에 맞게 설정 자유롭게 할 수 있음

#### DI 없이 의존성만 있을 때
- Tire interface가 있고, 각각 implement 한 KoreanTire와 ChinessTire 가 있다. 
  ```java
    interface Tire {
      String getBrand();
    }
  ```

  ```java
    public class KoreanTire implements Tire {
      public String getBrand() {
        return '국산 타이어';
      }
    }
  ```

  ```java
    public class ChinessTire implements Tire{
      public String getBrand() {
        return '중국산 타이어';
      }
    }
  ```
  - 이제 Tire 에 의존성을 가지는 Car 를 만들어보자. Aggregation 관계라고 볼 수도 있겠다. 
  ```java
    public class Car {
      Tire tire;

      public Car (){
        tire = new KoreanTire();
      }

      public String getTireBrand() {
        return "장착된 타이어: " + tire.getBrand();
      }
    }
  ```
  - constructor 에서 KoreanTire 를 만들어 의존성이 생겼다. getTireBrand 에서도 tire의 method 를 사용하고 있다. **중국산 타이어로 갈아끼려면 Car 를 다시 만들어야하는 엄청난 일이 발생한다. 뭔일이여 이게.**

#### 생성자로 DI 하기 
- 앞선 Tire, KoreanTire, ChinessTire 는 같다.
```java
  public class Car {
    Tire tire;

    public Car(Tire tire) {
      this.tire = tire;
    }

    public String getTireBrand() {
      return "장착된 타이어: " + tire.getBrand();
    }
  }
``` 
- 이제 type 만 같다면 중국산 타이어, 한국산 타이어를 마음껏 사용할 수 있다. 아래처럼.

  ```java
  import static org.junit.Assert.*;
  import org.junit.Test;

  public class CarTest {
    @Test
    public void 국산타이어_장착되었는지_테스트 (){
      Tire tire = new KoreanTire();
      Car car = new Car(tire);

      assertEquals("장착된 타이어: 국산 타이어", car.getTireBrand());
    }

    @Test
    public void 중국산타이어_장착되었는지_테스트 (){
      Tire tire = new ChinessTire();
      Car car = new Car(tire);

      assertEquals("장착된 타이어: 중국산 타이어", car.getTireBrand());
    }
  }
  ```
  - Car 에서는 Tire 타입만 맞춰주면 된다. 인터페이스로 구현한 이점을 얻을 수 있다. 나중에 미국산, 터키산 등 여러 타이어를 편하게 장착할 수 있게 된 것이다. 

#### 속성으로 DI 하기
```java
  public class Car {
    Tire tire;
  }

  public Tire getTire(){
    return tire;
  }

  public void setTire(Tire tire){
    this.tire = tire;
  }

  public String getTireBrand(){
    return "장착된 타이어: " + tire.getBrand();
  }
```
- 테스트는 아래처럼 할 수 있다.   
  ```java
  import static org.junit.Assert.*;
  import org.junit.Test;

  public class CarTest {
    @Test
    public void 국산타이어_장착되었는지_테스트 (){
      Tire tire = new KoreanTire();
      Car car = new Car();
      car.setTire(tire);

      assertEquals("장착된 타이어: 국산 타이어", car.getTireBrand());
    }

    @Test
    public void 중국산타이어_장착되었는지_테스트 (){
      Tire tire = new ChinessTire();
      Car car = new Car();
      car.setTire(tire);

      assertEquals("장착된 타이어: 중국산 타이어", car.getTireBrand());
    }
  }
  ```

## Reference
-  [인프런 - 예제로 배우는 스프링 입문 by 백기선](https://www.inflearn.com/course/spring_revised_edition/dashboard)
- 최범균.스프링5 프로그래밍 입문.가메.2018
- 김종민.스프링 입문을 위한 자바 객체지향의 원리와 이해.위키북스.2017 
- [인프런 - 객체 지향 프로그래밍 입문 by 최범균 - 의존과 DI](https://www.inflearn.com/course/%EA%B0%9D%EC%B2%B4-%EC%A7%80%ED%96%A5-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D-%EC%9E%85%EB%AC%B8)