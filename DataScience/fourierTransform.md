## 개요
- [kaggle - TensorFlow Speech Recognition Challenge](https://www.kaggle.com/c/tensorflow-speech-recognition-challenge] 우승사례 분석하면서 나온 기본 개념

## 참고
- [모두의 연구소 - Music Processing LAB - Fourier Transform 발표자료](http://www.modulabs.co.kr/MPL_library/12776)

### 복소수
- 허수, 실수가 아닌 무언가
- 각각 실수와 허수를 축으로 가진 2차원의 정보를 나타낼 수 있음
- 카드뉴스의 과제
  - 실수도 허수도 아닌 고유의 특성을 가진다면 3차원도 나타낼 수 있음
  - 4차원은 가능하다고 함. 퀀텀 참고

### 오일러의 공식
- 삼각함수- 주기성 관계

### 푸리에 해석
- 비주기함수를 어떻게 주기성으로 만들까?
  - 비주기함수는 continuous해서 푸리에 분석할 수 없다.
  - 분석할 부분을 뽑아서 그 부분이 반복되는 '주기'라고 가정한다. 
  - x[n]에서 x(w) 를 어떻게 찾을 것인가?
   - 잠깐, x(w)? 주파수가 f0인 임의의 주기신호는 fundamentalfrequency(f0)의 n배인 삼각함수(또는 복소지수함수 - 증명을 찾아보면 cos theta = 복소지수함수의 변형 으로 나타낼 수 있음)로 나타낼 수 있음
     - f0 = 0.9sin(440t) + 1.3sin(880t) + (-1.6)sin(440*3t) + ...
     - 앞에 'x(t) = ~' 에서 k는 자연수, Ak가 x[n]에서 찾는 x(w)임

### ETC 
- DCT는 대칭(mirroring)과 연관