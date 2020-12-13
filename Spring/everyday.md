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

## NextAction
- [ ] 한글 번역 요약본 - [번역] IoC 콘테이너와 디펜던시 인젝션 패턴 - javacan,최범균](https://javacan.tistory.com/entry/120) 글 읽고 이해한 부분 정리하기