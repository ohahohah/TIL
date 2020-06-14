## memo
- [모두의 연구소 X 서울시 DataSceince 고급과정](http://edu.ai-yangjae.kr/#) 조교하면서 수업 내용을 정리

## What is Datascience  
- 데이터 -- 과학적 방법론, 프로세스, 알고리즘, 시스템 --> 지식, 인사이트 
  - 다양한 데이터로부터 지식과 인사이트를 추출하기 위해 과학적 방법론, 프로세스, 알고리즘, 시스템을 동원
    - 데이터를 통해 실제 현상을 이해하고 분석하는데 통계학, 데이터 분석, 기계학습과 연관된 방법론을 통합하는 개념으로 정의되기도 함
  - 과학에서 경험주의, 방법론적 자연주의, 실험을 통해 관찰로 지식을 얻어내는 것과 같음. 여기에 추가된 것은 컴퓨팅 파워를 활용하는 것.   
    - 처리해야하는 데이터량이 많아지고 지식이 복잡(도메인 심화)해지고 있어 컴퓨팅 파워를 이용해서 지식을 뽑아내는 것이 추가됨
- [5 Steps of a Data Science Project Lifecycle](https://towardsdatascience.com/5-steps-of-a-data-science-project-lifecycle-26c50372b492)
  [!Data Science Process (a.k.a the O.S.E.M.N. framework)](https://miro.medium.com/max/1400/1*eE8DP4biqtaIK3aIy1S2zA.png)  
  - 데이터 탐색 단계에서는 데이터 시각화, 통계치를 보면서 데이터를 이해해봄
- 어떤 기반지식이 필요할까?
  - **통계학**
  - 적용 분야(도메인) 이해
  - 선형대수학
  - 크롤링 / 데이터 마이닝
  - 웹
  - 기계 학습
  - 분산 처리
  - 시각화
  - 어플리케이션
- 적용분야 
  - 의료 
    - [!의료 빅데이터 분석 플랫폼 개념도](https://img.etoday.co.kr/pto_db/2015/10/20151002102725_722913_600_677.jpg) (from [](https://www.etoday.co.kr/news/view/1209122))
  

- SSE(SquaresSumError) 최소 오차 제곱법
  - 제곱을 왜 할까?
    - 양수로 만들기 : +, -  상관없이 같은 차이로 보기 위해서
    - 차이를 크게 하기 위해서 : 1^2 = 1, 3^2 = 9 -> 제곱해서 에러값을 커지게 해서 차이를 눈에 띄게 하기 위해.

- 결정계수 - 데이터 적합도(평가하기) 를 간단하게 보자
  - res : Residual, tot : total
  - SS tot : 최대 차이 
