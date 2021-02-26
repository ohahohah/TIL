## memo
- [나동빈,이것이 코딩 테스트다 with 파이썬,한빛미디어] 주요 내용요약
  - 구입해두고 나중에 필요할 때 봐야지했던 책인데 [SLiPP 20차 코딩 테스트 스터디](https://www.slipp.net/wiki/pages/viewpage.action?pageId=52528646)의 홍광필님이 추천해주셔서 책을 폈다
  - 목차를 살펴보니 코딩테스트 첫 준비용으로 좋아보인다. 이 책에 집중해서 보라고 하니 마음도 편하네.
- 나중에 다른 자료도 보게 되면 여기 목차를 뼈대로 해서 덧붙여나갈 예정

## coding test tip
### online
- 실제 코딩테스트에서는 제출 횟수 제한 있음
- 온라인의 경우 인터넷 검색을 허용하기도 함
- 부정행위 잘못 인식되는 것 피하기
  - 인터넷 참고한 소스코드를 내 것에 맞게 변경하는 능력 필요
  - 온라인 IDE 사용시 public 모드인지 확인
    - public 옵션이 있다면 구글 검색 엔진 등이 수집해가서 내 코드인데 인터넷에 있는 코드를 그대로 베낀 것으로 잘못 인식 될 수 있음

### offline
- 대체로 인터넷 검색 허용안됨. 회사 제공 컴퓨터 환경에서 풀어야함
- 자주 사용하는 소스코드 가져올 수 있게 허용할 수도 있음. (**TeamNote** - 알고리즘 문제 풀이용 코드 라이브러리)
- **구체적인 시험 방식을 명시하지 않았다면 꼭 회사에 문의해서 방식과 규정을 확인하자**
- 화이트보드 등으로 면접관과 함께 문제 해결 과정 설명하는 절차도 있음

### online judge service
- [codeup.kr](https://codeup.kr/)
  - 초심자라면, 기본 100제 + 간단한 문제 100제 먼저 풀어보기 추천
    - 기초 100제 : implementation 문제 위주라서 기본 코드 유형 연관 문제라서 실전 문법 연습에 도움이 됨
  - 문제 순서와 난이도 순서 대체로 비례. 자신감 얻고 다양한 유형 풀어보기
- [백준 온라인 저지](https://www.acmicpc.net/)
  - [유형별 분류](https://www.acmicpc.net/problem/tags) 로 유형을 파고 들어가면 학습할 수 있음
  - 초심자용 [단계별 문제](https://www.acmicpc.net/step) 풀이
  - 문제 난이도 정보 표시해주는 chrome extension - [sovled.ac](https://chrome.google.com/webstore/detail/solvedac/anenheoccfogllpbpcmbbpcbjpogeehe/related?hl=en-US)
  - Slack 에서 질문, 대화 가능 [BOJ slack](https://acmicpc.slack.com)
- [프로그래머스](https://programmers.co.kr/learn/challenges)
  - 카카오 공채 문제 제공
- 시간 제한
  - [codesignal](https://app.codesignal.com/): 쉬운 문제 제공.UI 사용자 친화적. 토너먼트 제공: 10분 동안 낮은 난이도 5개 풀기. 15분마다 토너먼트 있음. 2명 이상 등록하면 바로 시작.
    - 비슷 - [codingame](https://www.codingame.com)
  - [codeforces](https://codeforces.com/) : 매주 1회 이상 대회 열림. 대회 성적에 따라 rating됨. 2-2.5 시간 주어짐. 유명하고 알고리즘 대회 준비하는 사람들도 대회에 많이 참가. discussion 활발. 
  
### 언어 선택
- python : 최근 출제 경향은 파이썬 사용자에게 유리함. 
  - 변칙 유형에 유연하게 대응할 수 있음. 직관적. 기본 자료형 제공 기능 강력(batteries included). 문자열 처리 간결 쉬움.
  - 실행 시간은 불리. 
- C/C++ : 실행시간 유리. but 난 현업에서 잘 사용하지 않기 때문에 보다 익숙한 python 과 Java 사용 예정

### 실습 환경 구축
- 온라인 IDE 에 익숙해지기 
  - 온라인 coding test 경우 웹 브라우저에서 소스코드 작성 제출하므로 같은 환경에 익숙해지자
  - [Repl.it](https://repl.it/) - 한쪽 모니터에는 IDE, 한쪽에는 문제 띄우기
  - [python tutor](http://pythontutor.com/visualize.html#mode=edit) - visualize Excution mode 사용하면 소스코드 단계별 실행 가능 - 메모리 데이터 점유 시각적으로 보여줌
  - [online GDB](https://www.onlinegdb.com/) : debugging 기능 제공. C/C++ 사용할 때 좋음. 위 사이트 안될 때 planB

## 접근 단계
- 저자 추천 책 활용법
  - 틈날 때마다 책을 읽기
  - 3번에 걸쳐 완독 여러 번. 
  - 첫 번째 과정은 알고리즘 유형과 소스코드 타입 익숙해져서 부담을 줄이기임

### 초급
1. 코딩테스트를 위한 python 문법 익히기
2. python 용 개발 환경 with testcode 구축
3. [codeup.kr - 기초 100제](https://codeup.kr/problemsetsol.php?psid=23)
4. [codeup.kr - + 100문제 더 풀기](https://codeup.kr/problemsetsol.php?psid=24)
5. 2부 - 주요알고리즘 이론과 실전 문제 , 3부 - 알고리즘 유형별 기출문제 읽고 풀기
  - 3 번 정도 완독하는 것을 권장하고 있음. 각 완독 회차마다 점차 속도를 높여나가기. 1회차 30시간, 2회차 20시간, 3회차 10시간
6. 백준 온라인 저지에서 유형별 문제 5개 이상 풀기 

### 중급
7. 완독 후 백준 온라인 저지에서 [삼성 SW 역량테스트 문제집](https://www.acmicpc.net/workbook/view/1152) 풀기
8. 프로그래머스에서 [kakako 문제집](https://programmers.co.kr/learn/challenges?tab=all_challenges) 풀기
9. 책 2부, 3부 중심으로 알고리즘 복기

### 실전 대비
- 타임 어택 방식에 익숙해지기 - 시간 분배 
- TeamNote 정리 
- Online judge 국내 플랫폼 익숙해지기 - 실제 코딩 테스트 환경과 비슷하게

## Complexity
- 문제 조건 : 시간 제한 1초, 메모리 제한 128MB -> time complexity, space complexity
### Time complexity -> 필요 연산 횟수
- 함수 호출한다면 그 시간 복잡도까지 꼭 계산하자
- 최악의 경우를 고려해야함. e.g. quick sort -> O(N^2)
- 흔치 않지만, 상수도 고려해야하는 경우가 있음.
  - e.g. 3N^3 + 5N^2 + 1,000,000, N =10 -> 상수 영향 무시할 수 없죠
- O(N^3) 넘어가면 문제 풀이 사용하기 어려움. 
  - 채점용 CPU 는 연산 횟수 10억 넘어가면 -> C 는 1sec 소요, N > 5000이면 10sec, 당연히 python 은 더 오래 걸림.
  - 통상 시간 제한은 1~5 sec 이므로 오버됨. 
- constraint 확인해서 시간복잡도 감을 잡을 수도 있음
  - N = 500 : O(N^3)
  - N = 2000 : O(N^2)
  - N = 100,000 : O(NlogN)
  - N = 10,000,000 : O(N)

### Space complexity -> 필요 메모리 양 
- Time complexity 와 Trade-off 관계 - e.g. memoization 
- 코딩 테스트 문제는 대부분 list(array)를 사용해 풀어야함. 
  - 메모리 사용량을 보통 128 ~ 512MB 로 제한함.
  -> 일반적으로 데이터 개수 1,000만 단위 넘어가지 않도록 설계하기
    - int a[2000][2000] - 16MB
    - int a[1000000] - 4MB 

### 시간과 메모리 측정
- **습관 기르기 - 실제 프로그램 수행 시간 측정** -> 알고리즘 효율성 측정
  - 알고리즘 소요 시간 확인해야 제대로 알고리즘 작성하고 있는지 체크할 수 있음.
  ```python
  import time
  start_time = time.time() # 측정 시작

  # 프로그램 소스코드
  end_time = time.time() # 측정 종료
  print("time:", end_time - start_time) # 수행 시간 출력
  ```
## 16-20년 코딩테스트 기출유형분석
- 알고리즘 코딩 테스트가 많음. 문제 평가가 용이
- 2-5시간 동안 8개 이하 알고리즘 문제풀기
  - 정확한 알고리즘으로, 얼마나 빠르게, 많은 문제를 푸는지
- 복합적 문제 - 여러 알고리즘을 사용해야함. 
  - 복잡할 때는 sorting, dynamic, binary search, implementation 을 다 사용해야함. 
- Greedy: 빈출. 기초 유형 - 문제 해결방법을 알면 구현이 간단.  
- Implementation: 빈출. 실제 개발 과정에서 사용될 기법
- DFS/BFS: 빈출
- Dynamic: 드물게. 난이도 낮음.
- Graph: 드물게. 난이도 낮음.
- 그 외: 최단 경로, sorting, binary Search
- Kakao : Greedy, Implementation
  - 문자열 처리 구현
  - 다양한 케이스를 고려해야 안정적으로 만점 가능
    - [ ] 테스트 케이스 설계 연습
- 안정권: 정답 70% 이상, codeforce blue 정도

## 주요 빈출 알고리즘 
### Greedy
- 외우지 않고 생각으로 푸는 유형. 아이디어가 있어야함. (Dijkstra algorithm은 제외)
- 현재 상황에서 가장 좋아 보이는 것만 선택해도 문제를 풀 수 있나? 를 확인 
- '가장 좋은 것' -> 기준이 있어야 함. 예를 들면, 가장 큰 순서, 작은 순서 등. sorting 과 짝을 이뤄 출제됨. 
- **문제 풀이를 위한 최소 아이디어를 떠올리고 이 solution 이 정당한지 역으로 검토해야함.** 
- 문제 유형을 파악하기 어렵다면 greedy 를 떠올려보자. 안되면 dynamic 과 graph 로 solution 생각하기.
- e.g. 거스름돈 문제 - 가장 적은 동전 갯수로 돈을 거슬러주기
- 예제 풀기 - solution 까지 30분 안. 
  - 문제1. 13분 소요됨. 꽤 오래 걸리네. online judge 가 없다. 예시 답안과 살짝 다른 데, 테스트케이스 넣어보니 맞다.
    - [ ] 체크리스트 추가 - 문제 읽는 연습하자.  문제와 상관없는 서술 문장 빼고 무엇이 문제와 연관되는지 보는 연습도 해야할듯. 영어문제는 단어만 바로 보여서 편한 데 한글문제는 어색하기도 하고 눈에 잘 안 들어온다. 
    - 낮은 난이도는 유형 파악하면 그냥 별 생각없이 풀 수 있구나






