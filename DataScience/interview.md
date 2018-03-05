- [Keyword](#keyword)
- [Reference](#reference)
- [상황 / 궁금](#상황--궁금)
- [정리](#정리)
   - [웹 아키텍쳐](#웹-아키텍쳐)
----------

## Keyword
`interview` `datascience`

## Reference
- [데이터 사이언스 인터뷰 질문 모음집](https://zzsza.github.io/data/2018/02/17/datascience-interivew-questions/)

## 상황 / 궁금
- 데이터 사이언스 인터뷰 질문 모음집을 보고 적을 수 있는 부분을 적음. 아직 공부하고 있는 분야는 그렇다 치더라도 웹 아키텍쳐, 분산처리, 시스템엔지니어링, 데이터시각화, 데이터베이스 정도는 적을 수 있지 않을까? 했는데 모르는게 많음. 연관 개념까지 꼼곰하게 정리해서 포스팅 할 예정.

## 정리
### 웹 아키텍쳐
- 트래픽이 몰리는 상황입니다. AWS의 ELB 세팅을 위해서 웹서버는 어떤 요건을 가져야 쉽게 autoscale가능할까요?
  - 네...? 일반 로드밸랜스 세팅하고 다른가?
- 왜 Apache보다 Nginx가 성능이 좋을까요? node.js가 성능이 좋은 이유와 곁들여 설명할 수 있을까요? 
  - node.js처럼 **single-thread기반 비동기IO처리** 를 하기 때문에 성능이 더 좋음. 
  - 참고: http://blog.naver.com/PostView.nhn?blogId=tmondev&logNo=220737182315 
  - node.js의 장점 : 발췌(http://bcho.tistory.com/876) 하나의 쓰레드가 request를 받으면, 처리를 하고, File IO나Network 처리 (데이타 베이스 접근)등이 있을 경우에는 IO 요청을 보내 놓고, 작업을 처리하다가, IO 요청이 끝나면 이벤트를 받아서 처리하는 이벤트 방식을 사용한다. 이로 인해서, CPU가 IO 응답을 기다리는 시간이 필요 없고, 대부분의 연산 작업에 사용되기 때문에 높은 효용성을 가질 수 있으며, 특히 하나의 Thread로 여러개의 요청을 처리하는 구조로 되어 있기 때문에, C10K 문제를 처리할 수 있는데 아주 최적화 되어 있다.
- node.js는 일반적으로 빠르지만 어떤 경우에는 쓰면 안될까요? 
  - single thread 특성상, 하나의 작업이 오래 걸리면, 성능이 떨어짐. 또 멀티코어의 이점을 살리기 위해 부가적인 처리가 필요함. Node.js를 사용할 때 주의할 점 참고: http://bcho.tistory.com/876)
- 하나의 IP에서 여러 도메인의 HTTPS 서버를 운영할 수 있을까요? 안된다면 왜인가요? 또 이걸 해결하는 방법이 있는데 그건 뭘까요? 
  - 기본적으로 소켓(소켓:https://ko.wikipedia.org/wiki/%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%81%AC_%EC%86%8C%EC%BC%93 참고)당 하나의 SSL Certificate를 사용하게 되어있기 때문에 별도 처리가 필요함.
Server Name Indication (SNI) 를 사용하면 해결가능. 참고 : https://en.wikipedia.org/wiki/Server_Name_Indication#Support )
  - 추가 개념
    - [wikipedia - Transport_Layer_Security](https://en.wikipedia.org/wiki/Transport_Layer_Security)
    - [wikipedia - Application_layer](https://en.wikipedia.org/wiki/Application_layer)
- 개발이 한창 진행되는 와중에도 서비스는 계속 운영되어야 합니다. 이를 가능하게 하는 상용 deploy 환경은 어떻게 구현가능한가요? WEB/WAS/DB/Cluster 각각의 영역에서 중요한 변화가 수반되는 경우에도 동작 가능한, 가장 Cost가 적은 방식을 구상하고 시나리오를 만들어봅시다. 
 - '무중단배포(Zero Downtime Deployment)'