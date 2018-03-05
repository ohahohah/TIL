## Keyword

## Reference
### 외부 
- [JUnit In Action](http://www.aladin.co.kr/shop/wproduct.aspx?ItemId=12075966)
- [Effective Unit Testing - 클린 코드와 좋은 설계를 이끄는 단위 테스트, 한국어판](http://www.aladin.co.kr/shop/wproduct.aspx?ItemId=32953284)
- 테스트 주도 개발 TDD 실천법과 도구 by 채수원 / 한빛미디어
- [테스트 주도 개발로 배우는 객체 지향 설계와 실천 by 스티브 프리먼, 냇 프라이스 / 인사이트](http://www.insightbook.co.kr/book/programming-insight/%ED%85%8C%EC%8A%A4%ED%8A%B8-%EC%A3%BC%EB%8F%84-%EA%B0%9C%EB%B0%9C%EB%A1%9C-%EB%B0%B0%EC%9A%B0%EB%8A%94-%EA%B0%9D%EC%B2%B4-%EC%A7%80%ED%96%A5-%EC%84%A4%EA%B3%84%EC%99%80-%EC%8B%A4%EC%B2%9C)

### 직접 정리자료 
- [TIL - EffectiveUnitTesting](Book/Effective_unit_testing.md)
- [TIL - JUnit](Test_TDD_BDD/JUnit.md)
- [TIL - TBD_SLiPP](Learning_by_doing/TBD_SLiPP.md)

### 읽는 중
- [[SpringCamp2013] Spring MVC TEST 어렵지 않아요! :+tv:](https://www.youtube.com/watch?v=k_88ADbuJqQ)
- [SpringCamp2013 Spring MVC TEST](https://www.slideshare.net/youngeunchoi12/spring-mvc-test-27318842)
- [TDD.JUnit.조금더.알기](https://www.slideshare.net/WonchangSong1/abouttddj-unit)
- [목 오브젝트(Mock Object)의 이해](https://www.slideshare.net/yonghoonkim940/mock-object-56624509)
- [테스트와 스프릥 :+tv:](https://www.youtube.com/watch?v=SOfhE_Dt-f4&index=17&list=PL2D6EA0CE629ACE5B)
- [Spring test mvc 발표자료 by KSUG 이수홍](https://www.slideshare.net/sbcoba/spring-test-mvc?related=1)
- [D2 - Spring-Test-MVC 프로젝트 소개 ](http://d2.naver.com/helloworld/1341)
- [스프링 MVC 단위 테스트! by the wave](http://thswave.github.io/java/2015/03/02/spring-mvc-test.html)
- [Mockito Features에 대한 한글 번역](https://github.com/mockito/mockito/wiki/Mockito-features-in-Korean)

## 상황/ 궁금증
**In 오픈API 프로젝트**
- 일부 모듈에서 어설프게나마 TDD를 적용시켜보면서 전혀 Unit단위로 test 되고 있지 않다는 것을 느낌.
- 프로젝트 테스트 단계에서 API 단위테스트 시나리오 작성을 상세하게 적은 덕분에 몇 가지 잘못 구현된 부분을 찾음.
- JUnit에서 SpringTest를 설정하다가, TDD가 아니라 JUnit을 하고 있음을 깨닫고, 테스트프레임워크를 익히는 게 아니라 test 설계에 대해 알고 싶다고 생각. 
  - 사족: mapper 로 쿼리 수행 테스트에서, 설정파일 setting을 불러와야했음을 장장 세시간에 걸친 삽질 후 깨달음.

## 진행
- 2018/01/10 ~ 
- ~~일과 전 오전에 1pomodoro씩 Effective Unit Testing 챕터 읽기~~
- ~~[ ] 한 번 읽고 난뒤 어떻게 진행할지는 정해야함.~~

- 2018/02/09
- SLiPP 스터디를 제대로 정리하고 지금 리팩토링하고 있는 현업 프로젝트에 적용해보는 걸 목표로 한다.
- 상세 개념이 필요할때마다, `JUnit in Action` , `Effective Unit Testing` 등을 참고.

### 테스트 원칙 
- `격리된 테스트` `(테스트를 믿고) 과감한 리팩토링을 가능하게 한다`
> 비즈니스 로직과 관계되지 않는 객체는 모두 외부에서 생성해 넘겨주는 것이 효과적인 설계 전략이다. (JUnit in Action(2011)/인사이트 - p.138)

## 정리
### DB test
- query 정상작동 검증 테스트 코드
- 외부 시스템을 호출 혹은 사용하는 경우, 시스템의 정상동작은 검증할 필요 없음. 하지만 정확하게 사용 혹은 호출했는지에 대한 검증은 필요
  - 검증을 위한 기록 log  / e.g 상대시스템에 data 넘겼다던가 log 기록

### Mock 객체 테스트
 - JUnit in Action(인사이트, 2012) 발췌
 > 메서드 레벨 단위 테스트에서 다른 메서드나 환경에 구애받지 않도록(...) 타 클래스의 메서드 호출도 격리할 수 있을까? 
 > 단위 테스트는 회귀에 대한 안전장치가 되어준다
 > 리팩터링 과정에서 버그가 만들어졌을때 (...) 테스트 단위가 충분히 작다면, 더 적은 수의 테스트만이 버그의 영향을 받고, 문제의 원인이 어디인지 보다 정확하게 짚어주는 메시지를 제공해준다.
 
 > Mock은 코드 로직의 일부를 나머지 코드와 격리시켜 테스트하려는 용도에 정확하게 부합된다. 목은 테스트 대산 메서드와 상호작용하는 객체즐을 대체하는 격리층으로 동작. 아무런 로직도 구현하지 않는 빈껍데기일 뿐이며, 
 > 대신 테스트가 더미 클래스(목 객체)의 모든 비즈니스 메소드의 행위를 조작할 수 있는 메서드를 제공한다.  -- 이게 무슨 말일까...
 
 p.136
 > 목 객체 안에서는 비즈니스 로직을 절대 구현하지 말라.(...) 목은 테스트가 시키는 대로만 수행하는 바보 객체(dumb object)여야 한다. (...) 첫째 목 객체 제작은 아주 쉽다. 둘째, 목 객체들은 빈껍대기일 뿐이므로, 문제가 발생할 만큼 복잡하지 않아 테스트도 필요 없다.
 > 문제될 가능성이 있는 것만 테스트하라 (...) 이유는 단순 데이터 접근용 객체는 목이 필요 없기 때문이다. (p.137)  