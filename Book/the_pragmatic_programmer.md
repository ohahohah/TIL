## Keyword

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

## ch.24 언제 예외를 사용할까
- *'20주년 기념 실용주의 프로그래머 2판'에서는 이 챕터가 삭제되었다.*
### Underline 
- 예외를 정상적인 처리과정의 일부로 사용하는 프로그램은 스파게티 코드처럼 가독성 문제와 관리성 문제를 떠안게 되고, 캡슐화를 깨뜨린다. 예외 처리를 하며 루틴과 호출자들 사이 결합도가 높아진다. 





