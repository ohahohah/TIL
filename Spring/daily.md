## memo
- 하루 30분 이상 Spring 보며 감 찾기

## Todo
- [ ] 사이드 프로젝트로 만들기
- [ ] 내용 훑기

## log
### 20201210 - reference 찾기
- reference 고름
  - [인프런 - 예제로 배우는 스프링 입문 by 백기선](https://www.inflearn.com/course/spring_revised_edition/dashboard)
  - 최범균.스프링5 프로그래밍 입문.가메.2018
  - 크레이그 윌즈.spring in action 5판(심재철 옮김).제이펍.2020
  - 김종민.스프링 입문을 위한 자바 객체지향의 원리와 이해.위키북스.2017 
- code review 받을 곳 만듦 - 2021.01.07 - 2021.02.11

## 20201211 - spring boot sample project - petclinic 기본 분석
- spring boot - petclinic sample project [github repo](https://github.com/spring-projects/spring-petclinic) / [diagrams](https://speakerdeck.com/michaelisvy/spring-petclinic-sample-application)
  - in-memory DB h2
  - 일반적인 maven 구조
  - docker 도 있음
1. 실행하기
- 실행- built using maven
  ```bash
    cd spring-petclinic
    ./mvnw package 
  ```
  - log 확인 in terminal
    ```bash
      [INFO] Building jar: /myfolder/spring-petclinic/target/spring-petclinic-2.4.0.BUILD-SNAPSHOT.jar
    ```
- 실행 jar
  - pom.xml 에 `<packging>` 명시되어 있지 않기 때문에 default값인 jar로 생성됨
    ```bash
      java -jar target/*.jar
    ``` 
  - log 확인 - tomcat 8080
    ```bash
      INFO 90950 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port(s): 8080 (http) with context path ''
    ```
  - 당연히 main 함수 실행시켜도 됨

2. 간단한 흐름 보기
2-1. 로그로 보기
- 흐름을 자세히 보기 위해 log level 을 debug 로 설정한 후 재실행
  - src/main/resources/application.properties : `logging.level.org.springframework.web=DEBUG`
- Find owner 실행
  - org/springframework/samples/petclinic/owner/OwnerController.java - `@GetMapping("/owners/find")` -> `return "owners/findOwners";` -> src/main/resources/templates/owners/findOwners.html
- Add owner 실행
  - page 로딩
    ```
    2020-12-11 21:15:14.156 DEBUG 99164 --- [nio-8080-exec-5] o.s.web.servlet.DispatcherServlet        : GET "/owners/new", parameters={}

    2020-12-11 21:15:14.157 DEBUG 99164 --- [nio-8080-exec-5] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped to org.springframework.samples.petclinic.owner.OwnerController#initCreationForm(Map)
    
    2020-12-11 21:15:14.158 DEBUG 99164 --- [nio-8080-exec-5] o.s.w.s.v.ContentNegotiatingViewResolver : Selected 'text/html' given [text/html, application/xhtml+xml, image/avif, image/webp, image/apng, application/xml;q=0.9, application/signed-exchange;v=b3;q=0.9, */*;q=0.8]
    
    2020-12-11 21:15:14.180 DEBUG 99164 --- [nio-8080-exec-5] o.s.web.servlet.DispatcherServlet        : Completed 200 OK
    ```

    - line 2:  `OwnerController#initCreationForm(Map)`(org/springframework/samples/petclinic/owner/OwnerController.java) -  `@GetMapping("/owners/new")` - `returns` template page(src/main/resources/templates/owners/createOrUpdateOwnerForm.html)
  - 데이터 입력 후 add owner 
    ```
    2020-12-11 21:18:55.293 DEBUG 99164 --- [nio-8080-exec-8] o.s.web.servlet.DispatcherServlet        : POST "/owners/new", parameters={masked}
    
    2020-12-11 21:18:55.294 DEBUG 99164 --- [nio-8080-exec-8] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped to org.springframework.samples.petclinic.owner.OwnerController#processCreationForm(Owner, BindingResult)
    
    2020-12-11 21:18:55.379 DEBUG 99164 --- [nio-8080-exec-8] o.s.web.servlet.view.RedirectView        : View name 'redirect:/owners/11', model {}
    
    2020-12-11 21:18:55.380 DEBUG 99164 --- [nio-8080-exec-8] o.s.web.servlet.DispatcherServlet        : Completed 302 FOUND
    
    2020-12-11 21:18:55.383 DEBUG 99164 --- [nio-8080-exec-9] o.s.web.servlet.DispatcherServlet        : GET "/owners/11", parameters={}
    
    2020-12-11 21:18:55.385 DEBUG 99164 --- [nio-8080-exec-9] s.w.s.m.m.a.RequestMappingHandlerMapping : Mapped to org.springframework.samples.petclinic.owner.OwnerController#showOwner(int)
    
    2020-12-11 21:18:55.409 DEBUG 99164 --- [nio-8080-exec-9] o.s.w.s.v.ContentNegotiatingViewResolver : Selected 'text/html' given [text/html, application/xhtml+xml, image/avif, image/webp, image/apng, application/xml;q=0.9, application/signed-exchange;v=b3;q=0.9, */*;q=0.8]
    
    2020-12-11 21:18:55.426 DEBUG 99164 --- [nio-8080-exec-9] o.s.web.servlet.DispatcherServlet        : Completed 200 OK
    ```
    - line2 : `@PostMapping("/owners/new")` -> `RequestMappingHandlerMapping ...OwnerController#processCreationForm`
    - line 3 :  processCreationForm - `return "redirect:/owners/" + owner.getId();` -> redirect page
    - line 6 : `@GetMapping("/owners/{ownerId}")` - `OwnerController#showOwner`
      - `ModelAndView mav = new ModelAndView("owners/ownerDetails");` - `mav.addObject(owner);\n return mav` - templates/owners/ownerDetails.html - `object="${owner}"`
2-2. debugger로 보기
- Using Debugger -  variables view  

## 20201212 - petclinic 변경
- 각 항목마다 분리해서 commit 남아있으니 참고(private repo).
- [x] petclinic 변경 - first name 검색 가능
  - controller 와 Repository 에서 Get mapping url 과 조회하는 함수와 쿼리 수정하고
  - 나머지는 관련된 view 찾아서 html 적절하게 변경
- [x] petclinic 변경 - first name 일부 문자열만 입력해도 검색 가능
  - query 에서 like 조건 와일드카드 사용 `LIKE %:firstName%`
- [x] petclinic 변경 - owner 에 age 속성 추가
  - Owner 와 owner 정보 보여주는 화면들 변경
  - 에러 로그 보고 processing form DB 컬럼 없다는 에러 파악
    - create owner db query 도 변경. insert 쿼리도 age 값 추가해줌.

## 20201213 - petclinic 변경 review
- 흐름보면서 변경하는 순서 잡아나가기 
  - Find owners 화면에서부터 찾아들어감 - 화면 페이지 (templates/owners/findOwners.html) text 변경 -> `th:field="*{firstName}` binding 
  -> OwnerController 
   - `this.owners.findByFirstName(owner.getFirstName())` 변경 
     - IDE 의 Create Method 기능 사용해서 OwnerRepository 에 함수 바로 만들어주기
  -> OwnerRepository 에서 annotation 추가
- getter, setter IDE 기능으로 추가하기 

## 20201213 - IoC intro
- [TIL/spring/DI 문서](./di.md) 에 적어두었다.

## 20201214 - IoC 개념 이해하기 - refernece 이해 1 
- Inversion of Control Containers and the Dependency Injection pattern
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
- Framework 는 Control 을 Inversion 하는 특징을 가진다. 
  - UI 를 예로 들어보자. 이전에는 UI 출력에서 '프로그램 코드를 입력하세요' 처럼 사용자의 입력을 유도하고 입력값을 기다렸다. GUI  로 바뀐 후에는 UI Framework 가 이 루프를 담당하고, 프로그램은 화면 fields의 event handler를 제공한다. 프로그램의 control이 Framework 로 전도되었다. 
- lightweight container 의 IoC 는 container 가 plugin Implementation 를 어떻게 찾아내느냐 이다. 
  - 위 예제에서 lister 는 MovieFinder의 Implementation 를 직접 instance 생성해서 implementation을 찾아냈다. 이렇게 하면 finder 가 plugin 되지 못한다. 
  - 대신 이런 접근 방식을 사용한다. **별도의 assemble module** 에서 implementation 을 lister 에 injection 할 수 있게 몇 가지 규칙을 따르게 하는 것이다. 
- IoC 용어는 범용적이로 쓰이므로 이 패턴에 맞게 DI, Dependecy Injection 용어를 만들어냈다. 
  - application class에서 plugin 구현으로 dependency 를 제거하는 방법은 DI 외에 service location 등이 있다.
  



## NextAction
- [doing] 이해한만큼 정리하기  https://www.martinfowler.com/articles/injection.html#FormsOfDependencyInjection
  - Inversion of Control Containers and the Dependency Injection pattern
 : https://www.martinfowler.com/articles/injection.html 
 - 범위 참고. 한글 번역 요약본 - [번역] IoC 콘테이너와 디펜던시 인젝션 패턴 - javacan,최범균](https://javacan.tistory.com/entry/120) 글 읽고 이해한 부분 정리하기


