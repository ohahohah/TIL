## Keyword
`gradle`

## 상황 / 궁금증
- 2018/04/25 'TDD,리팩토링,클린코드' 강의 들으면서 새롭게 gradle을 써보게 됨. gradle 공부까지는 아직이고, 프로젝트하면서 걸리는 부분들 위주로 정리시작.

## 정리
- [Gradle 설치](https://gradle.org/install/#helpful-information) : 메뉴얼이 친절하게 되어있으므로 이것만 따라고도 헤멜 걱정없음
- [How to define Gradle's home in IDEA?](https://stackoverflow.com/questions/18495474/how-to-define-gradles-home-in-idea) : homebrew 사용해 설치했을 경우, `brew info gradle`  command 사용
    + intellij에서 'Gradle home' path를 잡지 못해서 수동으로 설정하기 위해 찾아봄. 
    + 결국, 수동설정은 하지 않고, PATH 설정을 확인하고 intellij를 재부팅하여 해결.