## Keyword
`complier` `moniotring tool`

## Reference
- [SLiPP wiki - Java Compiler](https://www.slipp.net/wiki/pages/viewpage.action?pageId=30770152)
- [SLiPP wiki - 모니터링 tools](https://www.slipp.net/wiki/pages/viewpage.action?pageId=30770150)
- [](https://dzone.com/articles/client-server-and-tiered-compilation)
- [stackoverflow - How does the JVM decided to JIT-compile a method (categorize a method as “hot”)?](https://stackoverflow.com/questions/35601841/how-does-the-jvm-decided-to-jit-compile-a-method-categorize-a-method-as-hot)

## 정리
- 핫스팟? 자주 실행되는 부분. loop 많이 돌거나
  - 자주 쓰니까 컴파일하자,계속 쓰니까 - 인터프리터 대신 

- 바로 컴파일하지 않아요, 두가지 이유로
  - 첫째, 한번만 실행되는지 확인
  - 둘쨰, 최적화
      + 메모리의 부하를 덜어내자!

- 다 컴파일하지 않아요, 특정한 코드(핫스팟)만 컴파일

- Q. 언제 어떤 컴파일러를 사용할지 어떻게 알지? 무조건 하나만 사용가능? 
  - host의 성능에 따라 권장옵션이 달라짐
  - 
- 티어드컴파일러 - 서버컴파일러의 옵션사항 - Java8 이상이면 default로 켜져있음
  - Q. 티어드 컴파일 - '초기에는 클라이언트 컴파일 사용하고, 많이 쓰이게 되면 서버컴파일러로 다시 
  컴파일됨' - 초기, 나중 기준은? 
  - 다시 컴파일됨 - 초기에 클라이언트로 코드 캐쉬를 해놓고, 나중에 최적화된 코드 캐쉬로 스위칭함

- JVM 최적화 != 성능 최적화
  -  그 외에 요인들이 많음

- BigApp 비슷한 이유 - 추측
  - jar -> 메모리에 올림 부하생김 비슷비슷해짐

- Q.최적화 의미 다시
- 컴파일 임계치 - 설정
- ORS : 메모리상의 stack이 아니라 공간을 교체한다는 의미임

- 질문. 최적화된 코드로 스위칭 어떻게 함?

- 컴파일 큐의 이점 - 코드 실행 중에도 코드 컴파일을 진행할 수 있음. ORS로 코드체인징을 하게 됨
- 생산자 - 소비자 패턴 - 최적화는 언제 해
  - JIT compier가 소비자 ->  최적화 바이너리를 만듦
  - 그림 그려보기

### 모니터링 툴
- visualization tool은 애플리케이션의 성능에 영향을 미침
- jmx로 서버 정보 get
- jconsole
  - MBeans : 모니터링 빈 .JMX로 추가해서 모니터링
- jvisualvm
  - thread, heap dump 가능
- jmc
  - 라이센스 정책 있음
  - CPU 정보 등 하드웨어에 대한 추가정보도 보여줌 
- jstat
  - jps 로 ps id get
- jmap 과 jhat 같이 쓰이겠는데영?
- [ ] 기본 command 정리 

### Tip
- 핀포
- intellij에서 byte code 보기 - Build 후, cmd+shift+A show bytecode
- 실제 서비스에서 모니터링 - 메모리 따로 고려해서 붙이기 

### plus
- 성능 : 얼마나 많은 사람이 사용할 수 있나
- 


### 예상질문
1. Machine Code == binary code / assembly code?
2. 인터프리팅 횟수 1로 두고,.. 시도는 해 볼 수 있겠져 
3. 테스트 목적 외에는 비추천. 느리니까
