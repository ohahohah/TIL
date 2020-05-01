## Keyword

## memo
- 딥러닝을 공부하는 백수들의 모임에서 매주 몇 챕터를 읽고 모여서 토론하는 스터디로 진행하고 있다. python, C, C++, Java 여러 언어를 사용하는 사람들이 같이 스터디를 해서 각자 언어에서는 어떻게 쓰고 있는지 이야기가 나와서 흥미로웠다. 오고가는 주제를 다 이해할 수는 없었지만 
---
## ch.23 Assertive Programming
### Underline
- 언제 쓰냐고? **결코 일어나면 안되는 것을 검사할 때**
  - 프로그래밍에서 **"이런 일은 절대 일어날 리 없어"** 는 자기기만이다. 하지만 일어나지 않을 거라는 생각이 든다면 그걸 확인하는 코드-assertion 같은-를 추가하자. 
- assert할 때는 주의를 기울이자
  - 디버깅 행위가 디버깅되는 시스템의 행위를 바꿔버리는 하이젠버그를 조심하자(`Test.ASSERT(iter.nextElement() != null)`).
  - run 되어야하는 코드는 절대 assert 속에 넣지 않는다. 컴파일 중에 assert가 꺼져 있을 수도 있다. 
  - 진짜 에러처리 대신으로 단정을 사용하지 마라. 
- assert를 켜두자. - 퍼포먼스 문제가 있다 할지라도 정말 문제가 되는 assert문만 끄자. 
  - 잘못된 이야기 - **"assert는 코드에 overhead를 준다. product 코드에는 assert를 넣지 말자. 디버깅 도구일 뿐이다."** 
    - 테스트는 모든 버그를 발견할 수 없고, 프로그램은 험한 세상에서 돌아간다. 무슨 일이 일어날지 모른다고!
  - 첫번째 방어선은 모든 가능한 에러를 체크하는 것이고, 둘째는 놓친 것을 잡아내기 위해 단정문을 쓰는 것이다. 
### Practice
- 19번 
  - 나의 답: 2(디렉터리가 지워졌을 경우) / 3(자료형이 int가 아닐 수 있음) / 6(overflow) 
  - 실제 답: 1,2,3,4,5,6  
  - 뭐라고...다 해당된다고. 세상에 이게 무슨 일이야. 내가 "이런 일은 절대 일어날 리 없어"를 해버렸군. 그렇다고 이 모든 걸 assert를 해야하나...? 이것도 테스트 해야하는건가? 음?
- 20번
  - 나의 답
    ```java
    public static void assert(boolean condition){
        if(!condition){
            System.out.println("===FAIL===")
            System.exit(1);
        }
    }
    ```
  - 실제 답
    ```java
    public static void TEST(boolean condition){
            if(!condition){
                System.out.println("===Assertion Failed===")
                Tread.dumpStack();
                System.exit(1);
            }
        }
    ```
    - 그리고 만든 assert를 검사할 수 있는 코드.
  - 다시 고치기
    - `Thread.dumpStack()` 
      - 현재 thread의 스택트레이스 출력. Prints a stack trace of the current thread to the standard error stream(from [Java7 Doc](https://docs.oracle.com/javase/7/docs/api/java/lang/Thread.html#dumpStack()))
        - standard error stream:  `System.err.println("Got an error: " + e);`
      - [실제 코드 쓰임새](https://www.codota.com/code/java/methods/java.lang.Thread/dumpStack)
    - 코드를 만들었으면 테스트해봐야지! 테스트 코드를 만듭시다
    - 나중에 로그를 볼 때, "===FAIL===" 보다 "===Assertion Failed===" 이 좀 더 구체적인 정보를 주어서 낫다.   
    
### 스터디하면서 이야기   
- type check가 없는 python에서 assert 쓰는 경우(DL연구할 때)
  - [PEP484 type hint](https://www.python.org/dev/peps/pep-0484/) : type alias 를 사용 `def retry(url: Url, retry_count: int) -> None: ...`
  - mylint를 사용해서 타입체크를 해주지만 완전히 다 잡아주진 못한다. 이 경우 assert를 쓰기도 함.
  - Java 10 에도 `var`(컴파일러 타입 추론)가 도입되었다 - [JEP 286](https://openjdk.java.net/jeps/286) / [Java10 신규 기능(특징) 정리 - 1. JEP 286: Local-Variable Type Inference by 덕's IT Story](https://itstory.tk/entry/Java-10-%EC%8B%A0%EA%B7%9C-%EA%B8%B0%EB%8A%A5%ED%8A%B9%EC%A7%95-%EC%A0%95%EB%A6%AC)
    - [C의 auto](https://stackoverflow.com/questions/2192547/where-is-the-c-auto-keyword-used) / [C++ auto](https://en.cppreference.com/w/c/keyword/auto)- [Storage-class specifiers](https://en.cppreference.com/w/c/language/storage_duration) 와 비슷함
      - 함수를 호출해서 가져다 쓰는 경우, 내부적으로 여러 자료형이 중첩되어있을때 사용하기 편하다. 가독성을 고려해 적당히 써야함.
    - 함수형 프로그래밍의 variable binding 하고는 다름.
- assert를 하면 프로그램 자체가 중단되기 때문에 서비스 환경에서는 보수적으로 쓰게 된다.  

## ch.24 언제 예외를 사용할까
- *'20주년 기념 실용주의 프로그래머 2판'에서는 이 챕터가 삭제되었다.*
### Underline 
- 예외를 정상적인 처리과정의 일부로 사용하는 프로그램은 스파게티 코드처럼 가독성 문제와 관리성 문제를 떠안게 되고, 캡슐화를 깨뜨린다. 예외 처리를 하며 루틴과 호출자들 사이 결합도가 높아진다. 

### 스터디하면서 이야기
- 연습문제에 예외(catch exception)를 잡는 경우와 error를 그대로 발생시켜야하는 경우가 헷갈리네요.
- 이 루틴에 책임을 지고 있는 부분이 어디냐에 따라서 어디까지 exception 을 throw해야하는가 갈리는 것 같다. 
- 다른 언어보다 Java 가 try-catch를 많이 쓰는 것 같다. 왜 그럴까? Checked, Uncheked가 있기 때문에? [does-every-exception-have-an-required-try-catch - stackoverflow](https://stackoverflow.com/questions/29851253/does-every-exception-have-an-required-try-catch)

## ch.25 리소스 관리
### Underline
(2판)
> In this topic we're mostly looking at ephemeral resources used by your running process. But you might want to consider what other messes you might be leaving behind.
For instance, how are your logging files handled? You are creating data and using up storage space. Is there something in place to rotate the logs and clean them up? How about for your unofficial debug files you're dropping? If you're adding logging records in a database, is there a similar process in place to expire them? For anything that you create that takes up a finite resource, consider how to balance it.
What else are you leaving behind?
  - 이 부분을 읽고 다시 읽으니 정신이 번쩍 들었다. Java에서는 gc가 있으니까 하고 정신을 놓고 읽었는데, 코드레벨에서 리소스 사용을 memory에만 너무 한정시켜 생각했다는 생각이 들었다. 책에서 짚은 대로 리소스를 memory외에  `transactions, threads, network connections, files, timers —all kinds of things with limited availability` 한다. 어딘가 놓친 리소스가 메모리릭이 되어 돌아올 그날을 대비하기 위해 모니터링과 로깅을 정말 더 정신차리고 해야겠다. 
  - 특히 웹개발할 때에는 network connection, DB connection 를 항상 생각해둬야하지 않을까.
### 스터디하면서 나온 이야기
- C++ 에서 스마트 포인터 사용 예시 
  - [Bjarne Stroustrup 교수님 QnA썰](https://minjang.github.io/2016/03/21/talk-with-stroustrup/#fnref:talk) 
    > C++에서 C 포인터 사용에 대해 어떻게 생각하세요?(...)   
    > 한숨을 내쉬면서 생각보다 굉장한 어조로 포인터를 싫어한다고 말씀하셨다. 가능하다면 스마트 포인터와 참조자를 쓸 것을 권유하셨다. 
 
## ch26. 결합도 줄이기 
- [디미터 법칙 (The Law of Demeter) - johngrib님 wiki](https://johngrib.github.io/wiki/law-of-demeter/) 
- 개념을 이해하기 어려웠는데 위 링크가 조금이나마 이해하는데 도움이 되었다.
  - OOP를 객체가 각자 역할을 가지고 메시지를 통해 협력한다 로 이해했고, "객체의 내부 구조에 강하게 결합되지 않도록 협력 경로를 제한하라는 것이다." 이게 가장 나에게 와닿는 디미터 법칙 설명이었다.
  - 그런데 적용을 어떻게 해야할까...
    - Java에서 의존성 정도를 분석하는 code analyser [JDepend](https://github.com/clarkware/jdepend) 가 있음

### 스터디하면서 나온 이야기
> 디미터 법칙과 반대로 여러 모듈의 결합도를 높힘으로써 중요한 성능향상을 꾀할 수 있다. 해당 모듈들이 서로 결합하고 있다는 것을 잘 알고, 또 그것을 받아들일 수 있다면 아직 괜찮은 설계라 할 수 있다.
  - 코드를 보고 갯수를 세는 의존성을 파악하는 건 아닌 거 같다. 고쳐야하는 의존성 정도를 커뮤니케이션하면서 확인하자
    - 생각보다 수정이 오래 걸린다(디버깅 프로세스 리포트) -> 결합도가 높다 -> 논의를 하고 의존성을 줄이는 방식으로 리팩토링을 해보자 
    - 커뮤니케이션이라는 걸 조직이 시스템으로 어떻게 풀어낼 수 있을까?  
      - 예를 들면, 특정 task가 오래 걸릴 때, PO가 신호를 포착 -> 왜 그렇게 오래 걸리는지 원인을 파악하고 그 이유가 설계에 문제가 있다면 리팩토링을 하게 되고. 이렇게 팀에서 개선을 하는 것 역시 중요한 프로젝트 기여로 파악해야한다.
- 결합도를 낮출 때 상속에서 어떻게 처리할 것인가. composition 형태로 바꿔야할까? composition이 너무 많아도 문제다. depth는 낮아지만 결합이 높아지죠.
- [Dependency Injection](https://www.tutorialsteacher.com/ioc/dependency-injection) 을 고려