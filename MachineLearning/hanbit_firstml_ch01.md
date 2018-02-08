## Keyword
`머신러닝_정의` `필요_배경지식`

## 세 줄 요약
- 머신러닝이란,  
"**데이터**를 이용해서 명시적으로 정의되지 않은 **패턴**을 컴퓨터로 **학습**하여 결과를 만들어내는 학문 분야" 
("Field of study that gives computers the ability to learn without being explicitly programmed” Arthur Samuel (1959))
- 머신러닝 기법 이해할때 The Three Cultures of Machine Learning By Jason Eisner (`Insight 통찰력` , `Fit 데이터 적합성`, `Analysis 이론적 엄정성`) 떠올려보기

## Reference 
- `처음 배우는 머신러닝` - 1장 머신러닝 소개(김승연,정용주 지음, 한빛미디어)
- [모두를 위한 머신러닝 by 김성훈 교수](http://hunkim.github.io/ml/) - 시즌 1 - 딥러닝의 기본 : '머신러닝의 기본과 용어'
- [Udacity - Deep Learning by  Google](https://classroom.udacity.com/courses/ud730)  - Lesson 1: From Machine Learning to Deep Learning

------------
### 1. 머신러닝이란  
- "**데이터**를 이용해서 명시적으로 정의되지 않은 **패턴**을 컴퓨터로 **학습**하여 결과를 만들어내는 학문 분야"
- Limitations of explicit programming
> "Field of study that gives computers the ability to learn without being explicitly programmed” Arthur Samuel (1959)
- **데이터** 
  - 데이터 학습을 통해 실행 동작이 바뀜. 
  - 고전적 인공지능(규칙 단순조합), 사용자가 어떻게 동작할지 완전히 정의하는 알고리즘과 주요한 차이점임. 
- **패턴인식**
  - 데이터의 패턴을 유추하는 방법을 주축으로 함.
  - ** 데이터 -> 패턴을 찾아냄 **. (<->정해진 패턴으로 데이터 분석을 하는 것이 아님)
- **컴퓨터를 이용한 계산**
  - 실제 데이터에 대해 계산해서 결과를 만들어냄.
  - 특히 딥러닝의 경우, 대용량 데이터가 필요하므로 분산 처리  등  Data Engineering 을 통해 계산 속도를 높이고, 더 많은 데이터를 효율적으로 다루려고 함.
- 통계학과 가까움.
  -  닯은 점: 데이터를 기반으로 하고, 데이터에서 패턴을 찾아내는 공통점을 가짐.
  - 차이 : 통계학은 수학적인 모델 구축이나 증명에서 그치지만 머신러닝은 실제 데이터 계산으로 결과를 만들어냄.

### 2. 머신러닝 3가지 관점
- 머신러닝 기법의 성격에 따른 관점.  머신러닝 기법이 잘 동작하는데 필요한 핵심 연구 방향이므로, **기법 분류시에 각 관점에 대해 생각해보자!** 
- 여러 논의 중  [The Three Cultures of Machine Learning By Jason Eisner제이슨 아이스너 3 관점](https://www.cs.jhu.edu/~jason/tutorials/ml-simplex) 살펴봄.
  - `Insight 통찰력` , `Fit 데이터 적합성` `Analysis 이론적 엄정성`

### 3. 머신러닝 기법 분류
- 풀고자 하는 목표에 따라 `supervised 지도학습` `unsupervised비지도학습` `Reinforcement 강화학습`
- supervised  : learning with labeled examples
  - Most common problem type in ML
  - Image labeling: learning from tagged images like [CS231n Convolutional Neural Networks for Visual Recognition](http://cs231n.github.io/classification/)
  - Email spam filter: learning from labeled (spam or ham)
  - email Predicting exam score: learning from previous exam score and time spent
- Unsupervised learning: un-labeled data 
  - i.e.  Google news grouping / Word clustering
  - Predicting final exam score based on time spent - regression
  - Pass/non-pass based on time spent - binary classification
  - Letter grade (A, B, C, E and F) based on time spent - multi-label classification

### 4. 머신러닝 발전사
- 현재 트렌드(2017) : 대량 데이터 바탕으로 하는 딥러닝 기법사용. 
  - 성격이 다른 데이터를 연관시켜 데이터 효율적으로 사용하는 딥러닝 구조 개발됨 (비디오의 자막+이미지 동시학습 / 영어,프랑스어,스페인어 동시학습)
  - 통계학적 머신러닝 기법 조합해 데이터 더 효율적으로 사용([원샷](), [제로샷 러닝]())
  - 거대 규모로 빠르게 연산할 수 있는 시스템
  - 딥러닝 더 효율적인 학습 기술 ([드롭아웃](), [비동기 SGD]() 등) 발전
  - 데이터 수집 기술 발전 (질적, 양적)
- 1950년 컴퓨터 가능성 가늠. 1950년 [튜링테스트]() 제안됨.
- 1950년대 신경망시대 : [퍼셉트론 perceptron]()  이라는 기초 신경망 개발되었지만 쓸 수 있는 데이터가 적었고 기초 이론이 부족해 한정적인 패턴만 학습이 가능. 인공지능의 겨울
- 1990년대 통계학적 머신러닝 시대
- 빅데이터 시대: 웹 데이터, 대용량 저장장치, 분산 처리 기술로 시너지 
- 딥러닝 시대:  신경망 이론 GPU 발전 

### 5. 필요한 배경지식
- 수학 (선형대수, 미분, 통계, 확률)
  - 행렬연산, 행렬곱, 역행렬 개념 (패턴인식 기법이 대부분 수치 연산 사용)
  - 선형대수 , 행렬 분해 지식(특잇값 분해 등)
  - 미분 (최소값, 최대값, 대학수준 미적분학, 최적화)
  - 통계학 (통계학과 접근방법이 비슷하기 때문 / 대학수준 일반 통계학 이론)
    - 분포, 정상분포, 가우스분포
    - 상관관계
    - 회귀
    - 베이지안 통계 기본 (특히 딥러닝)
- 확률 지식 (머신러닝이 확률 모델 중심으로 구성되어 있음)
  - 확률 정의, 조건부 확률
- 프로그래밍 
  - 머신러닝 라이브러리 사용
  - 분산처리
  - python (padas, numpy,...)
  - tensorflow, keras, pytorch
