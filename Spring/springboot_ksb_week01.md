## What
- 패스트캠퍼스 스프링부트 (김성박 강사) 강의 듣고 정리
- 수업 내용
- 개념이해를 메꿔야할 부분 Todo list

## How
1. 수업을 듣고 필기내용을 안보고 생각나는 대로 적음 - 2018/10/06 작업
2. 수업필기내용을 보고 빠진 부분을 메꿔나감
3. 수업내용 중에 더 상세하게 알아야하거나 관련 개념을 키워드-3문장으로 정리
4. 관련 개념을 정리하지 못할 경우, 외부 자료를 사용해 메꿈
5. 수업시간 기준으로 분류하지 말고 개념카테고리 별로 분류해서 정리

## 개요
- 기반지식
- OOP
- Web
- Spring core
- SpringBoot
- Programming Tip
- 이직팁 

-------

## Spring을 이해하기 위한 기초 개념
- [부족] 왜 이 내용이 중요한지, 어느 부분에서 연결되는지 감이 안옴. 아직은 수업내용 가이드에 맞게 따라가서 공부해야할듯.
- Spring은 무엇인가? Framework
  - Library vs Framework
    - DI, IoC
- 어디에 쓰이는가? Web
  - Servlet 생명주기
  - WAS
  - 브라우저에서 url을 넣어서 WAS - HttpRequest - Httpresponse -> Dispather Servlet & Default Servlet
- 무엇을 기반으로 만들어졌는가? OOP
  - Spring은 어떻게 객체들을 제어하는가? 객체 생성의 제어
    1. component 생성
    2. Bean 사용 //? 수정
  - Spring에서 객체 생명주기 - Java 객체 생성(메모리에 언제 어떻게 올라가는지)
  - 상속(is-a, kind of), overriding
    - overriding 이해하기 위한 sample code 
      - Field는 왜 바뀌지 않는가?
      ```
      Car bus = new Bus();
      ```
  - interface 
    - interface가 왜 필요한가? interface는 선언이다
  - singleton
- 구조를 나타내기 위한 UML
  - 상속, aggregation, interface

## Spring Core with 실습코드 
- spring은 겍체를 어떻게 대신 생성하는가?
  - FinalApplication 에서 객체를 생성하는 코드가 없는데도 localhost페이지에 메시지가 뜨네
  - spring이 대신 생성(객체를 만들어서 메모리에 올림)해주었기 때문
  - 어떻게 객체 생성을 하는가?
  - 방법1. component로 스캔 
    - [부족] component?
  - 방법2. 직접 @Bean을 사용해서 생성 - DI 의존성 주입해서 생성
    - [부족] DI 가 뭔지 설명못함
- component
  - config 패키지가 속한 특정 패키지 
  - base 이하 
  - [부족] component가 무엇인지 설명 못함
  - 왜 @Service, @Controller 도 component지? 해당 annotation안에 component를 가지고 있다는 말인가?
- Bean
  - Bean을 singleton으로 생성
    - singleton : 메모리에 하나의 객체만 생성됨.
    - 각 method가 하나의 id를 가짐
    - ex. TodayBean(), TodayBean2()
- TodayService1, TodayService2 를 해도 하나의 객체만 생성됨 [부족]
  - 첫번째는 super.today() / 두번쨰는 동적으로 생성됨
  - Using CGLIB - interface 가 아닌 class도 동적생성(무슨 개념)할 수 있게 해줌
- Componet vs Bean
- DI 
  - 의존성 주입 코드
  - AutoWired
  - 의존성 주입 코드 vs Autowired
    - Autowired를 사용한다면, private 일 경우 외부에서 접근못해서 다른 데서 사용할 수가 없음
    - 하지만 모습이 간단 
    - 둘 다 장단점이 있음
- Dispather Servlet

## Spring Boot
-  Auto Config 
  - Annotation까보면 여러 설정을 가지고 있음
  - `SpringApplincation.run(FirstApplication.class, --)`
    - 파라미터에는 javaconfig가 와야함. FirstApplication안에 config를 가지고 있다는 말임

## Programming Tip - 접근방법
- Annotation 클릭해서 안에 구현 소스코드 까보면서 내부 구조 확인해나가기
- 직접 print해서 직관적으로 어떻게 생성되는지 확인