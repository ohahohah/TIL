## Keyword
`maven` `build`

## Reference
- [자바 세상의 빌드를 이끄는 메이븐 - 박재성 지음](http://www.aladin.co.kr/shop/wproduct.aspx?ItemId=11169988)
- [Maven in 5 Minutes](https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html)

## 상황/ 궁금증
- 'Effectiv Unit Testing'책의 예제코드를 보니 submodule로 구성되어 각 디렉토리가 독립된 프로젝트로 구성되어있음. 이거 build 어떻게 하지 당황하다가, maven 
- 그동안 설정이 꼬일 때마다 애써 외면해왔던 `mvn` build 에 드디어 입문해야할 시기임을 느껴...
- yark shaving 하는 기분이지만, build 와 debugging에 대한 이해가 매우 부족해 더이상 미뤄둘 수 없다는 생각이 들었음. 

## 진행(2018/01/12 ~)
### 1. 책 예제 + 인터넷 자료 (2018/01/12 ~)
- Tutorial에서 확장 -> 모르는 개념 검색 보충
- 책에서 읽었는데도 이해하지 못한 내용은 tag 유지해둠. 다시 읽기.

### 2. 맡고 있는 프로젝트에 배운 내용 적용

### 작성글
#### 1. :+1: 왜 Maven을 사용하는거지? 
- `개발환경 개선` : 핵심 비즈니스 로직에 집중하려고(복잡한 프로젝트 구조, 라이브러리 의존성 대신) 
  - 사례 : 개발계 / 운영계 서버간 환경이 다름. (표준을 준수하였으면)build 환경을 자유롭게 세팅가능 (개발계 - tomcat / 운영계 - weblogic)
- `의존관계`  라이브러리 관리 (그동안 이것만 씀)
- 나는! `단위테스트 자동화` + `report`가 가능하다는 게 충격! 왜 그동안 build안에 단위테스트 자동실행은 생각못했지? 
  - maven은 기본적으로 build할때 단위테스트를 진행함!
- 게다가, `문서`도 자동으로 만들어줌! `mvn site`
- `소스코드관리` `릴리즈` `배포` 이건 아직 안와닿음.
- `개발환경 자동화(~CI)`
  - 왜 필요? 지금은 테스트자동화만 와닿음.

#### TIL
- [maven_in_5min](SCM_etc/maven_in5min.md)