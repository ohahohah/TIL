## Keyword
`테스트기반` `SLiPP` ``

## Reference
- [SLiPP - 테스트기반실습](https://www.slipp.net/wiki/pages/viewpage.action?pageId=28278788)
- [내가 정리 - Test.md](Test_TDD_BDD/Test.md)
- [내가 정리 - JUnit](Test_TDD_BDD/JUnit.md)


## 상황/궁금증
- SLiPP 14차 스터디 테스트기반 개발 내용 정리

## 진행
1. 1주차 : 요구사항 정의 - 어떤걸 확인해야하나
- [1주차 - 환경 구성과 실습 코드 설명](https://www.slipp.net/wiki/pages/viewpage.action?pageId=28279096) 중 특히 정독
  - SW 개발 업무 Cycle
  - 이슈 트래킹
  - 테스트 케이스 이름
  - Spring과 Mock 객체
    - 추가 자료 필요
- 요구사항과 확인해야할 것 -> 테스트로 연결됨.
- 프로세스 
- 코드리뷰를 팀문화로 
  - 감정상하지 않게
  - 왜하는지 되짚어주기
  - 자연스러운 팀의 컨벤션이 만들어짐
- 버그를 재현 -> 안하면 고쳤는지 어떻게 알앙ㅠ
- 코드리뷰할때 로직을 안봐도 등록된 문서(issue)로 알 수 있게 왜, 어떻게를 적는다
- [적용] gitlab으로 이동 (로그 기록 안되는 문제 남음) / ~문서파싱 프로젝트 trac - svn issue tracking 연동하기~  

2. 2주차 : 테스트케이스 구현
- Mock 객체사용해서 **메소드간 의존성을 줄였다**
- Test에서 Spring config를 불러왔음. 
[ ] Mock 에 대해 더 알아보자.
[ ] spring config 에 대해서 좀 더 찾아보자. 실무프로젝트에도 적용할 수 있도록 xml 스타일 설정도 같이
- 테스트케이스 이름으로 먼저 적어두었어도 실제로 구현하려면 걸리는 부분이 생긴다. 

## 고민
- 실제 프로덕트에 적용하려고 하니, issue 생성부터 막힌다. 
- MainController처럼 파라미터에 따라 method를 호출하는 main method는 어떻게 테스트해야할까? 올바른 method를 호출하는지 확인하고 싶은데, Mock을 사용해야하나? 해당 method를 호출하는지 어떨게 test하지?
  - 일단, 옳은 파라미터인지 확인하는 부분은 다른 테스트케이스로 나누고, method를 분리할꺼다

## 질문
- 인터페이스 테스트는 왜하지? (전체 카톡방 대화)
  - 테스트의 목적은 로직테스트가 아닌건가?
- 테스트 케이스의 리소스 파일 위치를 왜 따로 하지?
  > 각 테스트 케이스 메소드 별로 사용하는 별개의 파일을 따로 둔다.  그리고 그 위치는 테스트케이스 클래스 이름을 따서 TodoManagerTest_resources라고 폴더를 둔다.  정말로 정말로 여러개의 테스트 케이스 클래스가 공통으로 사용되는 것만 test/java/resources 밑에 둔다.
- 문서에서 정보 추출할때, 전체 문서 -> 해당 파트 단락 -> 단락에서 항목 추출 단계를 거침. 앞 과정이 완료되어야 가능함. 문서 정규화 -> 단락 파싱 - DB 저장 -> DB에서 단락 불러옴 - 항목 추출 
  - input, 예상 output 이 정의될때 테스트 가능한거 아닌가. 
  - 요구사항 유효조건 
  - 실패조건 구현? 테스트는 시나리오인가? - 시나리오는 통합 테스트인뎅
  - `self-shunt pattern`(셀프션트) (From. TDD - 켄트벡 개정판 p.362) 
    - [Say No to Self-Shunt](http://kaczanowscy.pl/tomek/2010-09/say-no-to-self-shunt)
      - test + Mock 두 역할하므로 [Single responsibility principle](https://en.wikipedia.org/wiki/Single_responsibility_principle) 원칙을 위반. 
      - temporary 는 결국에 refactoring 해야하는데(몸집이 커지는 경우), 경험상 temporary는 영원히 그 자체로(;;;) 머물러 있을 가능성이 높음 (매우 동의함!)
    - [Self Shunt by Paul Pagel](https://8thlight.com/blog/paul-pagel/2006/09/11/self-shunt.html)

- 이슈 단위는 어떻게 하지? 
  - `task != issue` `기능 != method`
  - issue tracking 도구로 내가 일했던 log남기는게 가능한가? 
    - 다른 도구 필요하지 않을까? issue 는 기능, 소스단위이다보니 적절하진 않을듯.
  - refactoring할때도 이슈발행함? 
    - 필요없지 않나?
  - 기능 구현
  - method 버그 <- 이렇게 report 하는 경우가 있나...?

## 알아가는 중
- 단위테스트의 목적 
  - 코드가 `예상대로` 동작하는가? 코드품질(의존성 줄이기, '테스트가능 설계'와 연관이 있는거 같은데 잘 모르겠다)
  - 프로그램 기능에 대한 개발자용 메뉴얼?(도형오라버니 said "오픈소스에서 testcase와 doc 제대로 되어있지 않으면 PR 무시해요.(...) 코드 리뷰할 때도 testcase로 로직와 기능을 파악힐 수 있어서, 소스코드를 훑가면서 로직을 파악하는 것보다 훨씬 부담이 덜해서 소스리뷰 정착에도 도움이 됩니다.(...)")
- Effective Unit Testing 책에 '테스트가능 설계'라는 말이 나온다. 
  - 모듈간 불필요한 의존성이 없고, method의 롤이 파악하기 쉽다는게 아닐까?(1method, 1 role)
- 좋은 테스트 케이스는 `테스트 케이스간 의존성`을 줄이고(Mock, stub, self-shunt 사용), 하나의 test case 가 `Single responsibility principle(하나의 role만 수행하고 그 의도를 명확히 전달)`하는 특징을 가지는 거 같다.
- 좋은 테스트케이스를 작성하면, 뭔가 문제가 발생하면 알려줄꺼라는 믿음을 주는 거 같다. 아직 느껴보지는 못했지만, 여러 책에서 반복적으로 나온다.
- 코드 퀄리티 높이기
  - 작게나마 TDD를 프로젝트에 적용해봤을 때, testcase = method 단위로 잘못 적용했지만, testcode가 커지지 않게 만들다보니 거의 one role 을 수행하게 되었고, 어쩌다 얻어걸려서 '하나의 method가 하는 일은 하나여야 한다'를 비교적 잘 지킬 수 있었다. 잘 쪼개놓으니 갑작스런 요구사항 추가에도 비교적 잘 대응할 수 있었다(testcase 후에 작성한 코드들은 퀄리티가 달랐다)
  - Mock 사용 :  목 객체 안에서는 비즈니스 로직을 절대 구현하지 말라

  
## 깨달음
- test는 method단위가 아님!! 충족시켜야하는 요건 단위!
  - method 단위로 테스트만들때 뭔가 쎄했음. 리팩토링할때 method 나누면 testcase 도 다시 만들어야함. 여러 함수 사용해서 최종 결과가 나오는거면 중간중간 입력값을 다 따로 관리해야해서 귀찮음.  
  - 요구사항 요건 분석해서, 그 단위로 test 만들면 자연스럽게 필요한 method도 처음부터 작은 단위로 만드는게 가능하지 않을까? Effective Unittesting에서 나온 `테스트하기 쉬운 설계`가 이런 의미인가?
- 한글로 테스트목록쓰니 테스트 목표가 자동으로 정해지네! 
 - production code -> test 제외 어떻게 하지? gitlab flow 사용 중. master에서 test code 삭제하고 copy 하는 방법이 있나? 아, 처음에만 삭제하고 나중에 변경된 코드만 반영하니까 상관이 없네. 

## 추가
- 도형형님 자료 (https://www.slideshare.net/dhrim/ss-14990143)
  > 발생과 인지간격이 멀수록삽질스러워 진다.
  > 테스트 코드는테스트 케이스가 아니다.버그의 발생을 파악할 수 없다.
  > 버그 발생 파악할 수 있어야 테스트 케이스 / 언제나 정상동작을 확인할 수 있어야내일도 모레도 1년뒤에도
  > 재사용 가능해야테스트 케이스
  > 자동화 가능해야테스트 케이스
와 이거!
  > 개발자 스스로가 지금, 전부 실행시킬 수 있어야 한다.  

