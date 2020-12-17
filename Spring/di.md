## memo
- Spring 에서의 DI 에 대해서 중점적으로 적는다. 

----
## DI는  
- DI(IoC의 일종) 는 서로 다른 layer 에서 component 를 연결(assemble 조립)하기 위한 방법 중 하나이다. 
  - spring 과 같은 lightweight 를 표방하는 Framework 에서는 IoC Container 서로 다른 component 사용할 때 발생하는 dependency 의존성 문제를 해결한다. 
- 아래에서는 익숙하지 않은 용어들을 하나하나씩 이해한대로 풀어나가보겠다. 
   - 접근 방식은 많은 부분 [Martin Fowler 의 Inversion of Control Containers and the Dependency Injection pattern](https://www.martinfowler.com/articles/injection.html) article 을 따라간다.
  
<details>
<summary>component 와 service</summary>
  - application에서 사용될 목적으로 만들어진 소프트웨어의 한 구성 요소. 
  - Service 도 이와 같다. Service는 지정해둔 remote interface(웹서비스, 메시징 시스템, RPC, 소켓 등)를 통해 원격으로 동기/비동기 방식으로 사용되고, component 는 local(jar or dll)에서 사용된다는게 차이이다. 
</details>

- Dependency - 서로 다른 component 를 assemble 할 때 부딪히는 문제
  - 기능 구현을 위해 다른 구성 요소를 사용하여 의존 대상 객체의 변경에 영향을 받을 때 'Depenecy 가 있음'.   
    - 예: 객체 생성, method 호출, 데이터 사용  

  <details><summary>코드로 살펴보는 Dependency</summary>    

    - 아래 코드에서 OwnerRepository의 save 함수를 save(Owner owner, int code) 로 바꾸면 이 method 를 사용하는 OwnerController 의 소스 코드도 바뀌어야한다. 
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
        public void blockUser(Strign id, String     reason){
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
    
  </details>
  
## IoC  
- Inversion of Control 제어역전. Framework 의 큰 특성 중 하나. library는 코드 내 필요한 부분에서 실행된다. 프로그램의 control 을  Framework가 담당한다. 이것을 제어가 역전되었다고 표현한다. 
- 단순히 IoC 라고 표현하기보다 **어떤 부분의 control 을 Inversion 하는지**가 중요하다. 
  
  <details>
  <summary> "The question is: "what aspect of control are they inverting?" - Martin Fowler - Inversion of Control</summary>  

    - UI control 에서 IoC 가 일어난 경우를 예로 들어보자. 이전에는 application 이 prompt 를 통해 입력값을 유도하고 그에 대한 response 를 받았다 ("Enter name:"). UI control을 application 했다. GUI 에서는 UI Framework 이 이것을 control한다. program은 이제 event handler 만 한다. Framework 로 IoC 가 일어난 것이다. 
  </details>

- Spring 과 같은 lightweight Container 에서는 **plugin implementation 를 조회(look up)할 때 IoC Container 가 control 한다.** (객체에서 IoC container 로 IoC 됨)
  - IoC 는 범용적인 표현이므로 이 패턴을 좀 더 정확히 표현할 수 있는 DI(Dependency Injection)이란 용어를 사용.


-----
## Inbox

즉 Component 간의 의존성을 해결하기 위해서 IoC(DI) 를 사용하게 되는 것이다. 

- DI 
    - Dependency 
    - 다양한 layer 에서 component 를 사용해야하는 경우가 있다. 
    - 한 코드의 변경이 그 method 등을 사용하는 다른 component에 영향을 미친다. 이것을 dependency하다고 표현한다. 이런 dependency 를 줄이고 제어해서 결합도를 낮추도록 설계해야 한다. 한 부분의 변경이 원치 않게 다른 부분까지 영향을 미치는 상황이니까. 
      - 다른 component 를 사용한다고 하면 dependency 가 생길 수 밖에 없다. 다른 팀이 만든 object 를 사용한다고 할 때는 코드도 잘 모르는 상황에서는 더더욱 힘들겠지.
  - 이 Dependency 를 관리하기 위해서 Spring 의 assembler 가 Dependency Injection 해서 해결한다. 



  - 
- Spring 의 IoC container 
  - Sigleton pattern 

- IoC 하지 않은 것
  ```java 
    class OwnerController {
      private OwnerRepository repository = new OwnerRepository();
    }
  ```
  - OwnerController 가 repository 를 직접 만들어서 의존성을 가지고 있다. 내가 사용할 의존성은 내가 만들겠어.
  - **control 하고 있다는 것은, OwnerController 가 내가 어떤 class 사용할 건지(OwnerRepository 사용할거야) 정하고, 언제 어떻게 그 object 를 만들지 흐름을 스스로 관장한다는 것.** 
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
  - 테스트하기도 편함. 
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
  
- Spring은 Container 의 lifecycle 관리 등의 이유로 Spring assembler(조립기, 객체 생성, 의존 주입을 처리) 를 통해 DI를 사용하고 있음.


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
---
## Inversion of Control Containers and the Dependency Injection pattern
 : https://www.martinfowler.com/articles/injection.html 

- 서로 다른 요소를 어떻게 연결하는 과제를 생각해보자.  서로 다른 객체들을 어떻게 연결할까? 만약 각 객체를 서로 다른 팀이 개발했고, 서로의 코드를 잘 모른다면? 
- 이 문제를 해결하기 위해 경량 콘테이너 lightweight container - 다른 layer 에 위치하는 component 를 조립하는 기능을 제공하는 프레임워크 - 중에 하나가 Spring 임.
- 이 컬럼에서 이야기하는 Service 는 
  - 어플리케이션에서 사용될 목적으로 만들어진 소프트웨어의 한 구성 요소
  - 지정해둔 remote interface(웹서비스, 메시징 시스템, RPC, 소켓 등)를 통해 원격으로 동기/비동기 방식으로 사용됨
    - component 는 local(jar or dll)에서 사용된다는게 차이
- 아래에서 MovieFinder 와 MovieLister 객체를 어떻게 연결시키는지 살펴볼 것이다.
```java
class MovieLister...
        public Movie[] moviesDirectedBy(String arg) {
            List allMovies = finder.findAll();
            for (Iterator it = allMovies.iterator(); it.hasNext();) {
                Movie movie = (Movie) it.next();
                if (!movie.getDirector().equals(arg)) it.remove();
            }
            return (Movie[]) allMovies.toArray(new Movie[allMovies.size()]);
        }
```
- interface 로 구현해서 MovieLister 와 MovieFinder 의 coupling 결합도 낮춤.
```java
  public interface MovieFinder {
        List findAll();
    }
```
- MovieFinder는 interface 이므로 실제 구현 객체 ColonDelimiterMovieFinder 로 연결했다. 
```java
 class MovieLister...
      private MovieFinder finder;
      public MovieLister() {
        finder = new ColonDelimitedMovieFinder("movies1.txt");
      }
```

- 여기서 문제발생. 만약 파일을 처리하는 ColonDelimitedMovieFinder 말고 DB, xml 등을 사용해 movie 정보를 불러오고 싶다면? ColonDelimitedMovieFinder 말고 다른 걸 사용해야한다. 
- 근데 지금 위에 코드에서 ColonDelimitedMovieFinder 객체를 create하고 있네? 실제 구현 클래스에도 dependecy 가 있다. 
![Figure 1: The dependencies using a simple creation in the lister class : MovieLister - dependency - MovieFinderImpl](https://user-images.githubusercontent.com/17819874/102112778-86e53580-3e7b-11eb-941c-0719bc4e562d.png)

- 만들고 싶은 건 interface에만 dependency 하고 실제 구현 클래스에는 dependecy 하지 않도록 하는 것! 
- 이때 사용하는게 plugin pattern 
  - 어떤 MovieFinder Implement class 를 사용할 지 모르기 때문에
  - The implementation class for the finder 는 컴파일 타임에 연결되지 않음
  - 대신 어느 구현에서나 lister 가 동작되기 위해 나중에 'plug in' 시킨다. 구현시키는 것도 내가 처리하지 않는다. 
  - lister 는 implementation class 를 모르도록 link 할 수 있지만 instance 와 대화해서 작업은 가능하다. 
- 이렇게 plug-in 을 사용해 상호작용을 처리해야 다른 implement class 를 사용할 수 있을 것이다. 
- 그럼 이런 plug-in을 어떻게 application 으로 assemble 조립 할 수 있을까? 이게 바로 lightweight container 가 직면하는 주요 문제이고, 일반적으로 IoC 를 사용해 문제를 처리한다.

### IoC 란
- Framework 는 Control 을 Inversion 하는 특징을 가진다. 단순히 IoC 라고 하는 것 대신에 **어떤 부분의 control 을 Inversion 하고 있는지**가 중요하다. 
  - UI 가 IoC 된 것을 예로 들어보자. 이전에는 application 이 UI를 control했다. '이름 입력'처럼 prompt를 구동하고 그에 대한 response을 선택하고. GUI 로 바뀐 후에는 UI Framework 가 이 루프를 담당하게 되고, 프로그램은 화면 fields의 event handler만을 제공한다. UI control이 Framework 로 inversion된 것이다.
- **lightweight container 의 IoC 는 container 가 plugin Implementation 를 어떻게 찾아내느냐(look up) 이다.** 
  - 위 예제에서 lister 는 MovieFinder의 Implementation 를 직접 instance 생성해서 implementation을 찾아냈다. 이렇게 하면 finder 가 plugin 되지 못한다. 
  - 대신 이런 접근 방식을 사용한다. **별도의 assemble module** 에서 implementation 을 lister 에 injection 할 수 있게 몇 가지 규칙을 따르게 하는 것이다. 
- IoC 용어는 범용적이로 쓰이므로 이 패턴에 맞게 DI, Dependecy Injection 용어를 만들어냈다. 
  - application class에서 plugin 구현으로 dependency 를 제거하는 방법은 DI 외에 service location 등이 있다.


## Reference
- Inversion of Control Containers and the Dependency Injection pattern
 : https://www.martinfowler.com/articles/injection.html 
 - 범위만 참고. 일부 번역이 원문과 맥락 차이가 있다. [번역 / 요약 - IoC 콘테이너와 디펜던시 인젝션 패턴 - javacan,최범균](https://javacan.tistory.com/entry/120)
-  [인프런 - 예제로 배우는 스프링 입문 by 백기선](https://www.inflearn.com/course/spring_revised_edition/dashboard)
- 최범균.스프링5 프로그래밍 입문.가메.2018
- 김종민.스프링 입문을 위한 자바 객체지향의 원리와 이해.위키북스.2017 
- [인프런 - 객체 지향 프로그래밍 입문 by 최범균 - 의존과 DI](https://www.inflearn.com/course/%EA%B0%9D%EC%B2%B4-%EC%A7%80%ED%96%A5-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D-%EC%9E%85%EB%AC%B8)
