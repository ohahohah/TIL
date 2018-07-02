## Keyword
`tensorflow.js` `tensorflow`

## Reference
- [행사 페이지](https://www.facebook.com/lab4all/posts/798811233645180)
- 발표자료
  - 1. [Real-World Robot Learning / 최석원] (https://www.slideshare.net/modulabs/rearworld-robot-learning)
　- 2. [TF.data & Eager Execution / 김보섭](https://www.slideshare.net/modulabs/tfdata-eager-execution)
　- 3. [Debugging with tensor board / 이준호](https://www.slideshare.net/modulabs/debugging-with-tensor-board)
  - 4. [TF.data / 신성진](https://github.com/modulabs/DeepNLP/blob/master/TF_Tutorial/TF.DATA_Summary.ipynb)
　- 5. [TensorFlow.js & Applied AI at the Coca-Cola Company / 민규식](https://www.slideshare.net/modulabs/tensorflowjs-applied-ai-at-the-cocacola-company)
　- 6. [Machine Learning on Your Hand - Introduction to Tensorflow Lite Preview / 강재욱](https://www.slideshare.net/modulabs/tensorflowjs-applied-ai-at-the-cocacola-company)

## 흥미로웠던 것들
- 모두의 연구소- Datalab3 분산처리 랩에서 다함께 <TF Dev Summit X 모두연 : learn by run!> 들으러 감. 
- TensorFlow Dev Summit 2018에서 발표된 내용을 정리하여 모두연 연구원들이 발표함.
- TensorFlow 는 까막눈이었는데도 재밌는 발표가 있었음. 더 내용을 알고 있었다면 재밌었겠다는 아쉬움이 깊이 남음. 
 
### Real-World Robot Learning 
- 로봇팔로 물체 집기
- CNN으로 일부만 사용 
- 로봇팔에 카메라 - 위치 2D정보 / 시뮬레이션 / 로봇 위치에 따라 잡을 확률 학습
- 1. PIXEL Level ~ : Generator - real-like 하게 시뮬레이션
- 2. Feature Level ~ : 도메인간 차이에서 나는 차이를 줄임
- 둘 다 기존에 존재했음. 합쳐보면 어떨까? 
- 합쳐서 학습시킴
- Result  - sim-only(=시뮬레이션 only)

### tf.data, Eager Execution
- tf.data : 대용량 데이터를 처리하기 위해선 Input pipeline이 중요하져
  - placeholder써서 내 컴 메모리에 다 올릴 순 없잖아여ㅠㅠ 
  - 그러니까 tf.data 써서 올리세여
  - tf.data 어려운데여
  - tf.data 특성
  - ETL for tensorflow
    - Code ex - Linear regression using tf.data : 함수형 프로그래밍처럼 구성
    - 쓰는건 tf.placeholder랑 크게 다르지 않아요
- Eager Execution : pytouch처럼 쓸 수 있게 해주겠다? 동적으로
  - numpy처럼 세션이 없어요 
  - numpy와 좀 더 심리스해진 거 같아요
  - 쓰세여! An intutive Interface,... 
    - python datastructure 처럼, numpy와 심리스하게 , 디버깅이 쉬우니까
  - 하지만 단점도 있어여 - 이미 기존 방식에 정말 익숙하다면 안쓰셔도 뭐... 
    - 코드가 많이 바뀌어요
    - 정적과 동적의 차이 - 대용량에서 실제 퍼포먼스는 어떨까...?
    - summit 에서도 small data 프로토타입에서 쓰라고 함
    - multi GPU, multi CPU가 안돼여
  - 하지만 이제 배우기 시작하셨다면 꼭 쓰세여
- tf tutorial 보면 점점 두 API를 사용하는 방식으로 바뀌고 있어여

### Debugging with TensorBoard
- TensorBoard 소개

### TF.DATA
- 상용서비스를 염두에 두고 있다는 인상
- 필요할때만 데이터를 메모리에 올린다
- 주요 특징
- 실습

### Tensorflow.js
- deeplearn.js + Tensorflow! 
- conversion! js를 몰라도 tensorflow 를 js로 conversion 해줌









