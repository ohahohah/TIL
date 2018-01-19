## Keyword
`maven` `local_jar`

## Reference
- [3 ways to add local jar to maven project](http://roufid.com/3-ways-to-add-local-jar-to-maven-project/)
- [Can I add jars to maven 2 build classpath without installing them? - Problems of popular approaches](https://stackoverflow.com/questions/364114/can-i-add-jars-to-maven-2-build-classpath-without-installing-them/764684#764684)
- [Local jars are not included in class path (`<scope>system</scope>`) - system scope reference](https://stackoverflow.com/questions/3280834/local-jars-are-not-included-in-class-path-scopesystem-scope/3281409#3281409)
- [stackoverflow - Adding a jar in WEB-INF\lib in POM - system scope](https://stackoverflow.com/questions/9990872/adding-a-jar-in-web-inf-lib-in-pom)
- [메이븐(Maven) WEB-INF/lib jar 파일 추가 - webcontent-dir properties 설정](http://blog.daum.net/liberalis/13222456)
- [stackoverflow - How to add local jar files to a Maven project?](https://stackoverflow.com/questions/4955635/how-to-add-local-jar-files-to-a-maven-project)
- [Maven Repository 가 없는 로컬 jar 파일 을 maven project 에 추가하는 방법](http://itnp.kr/blog/post/Maven_Repository_%EA%B0%80_%EC%97%86%EB%8A%94_%EB%A1%9C%EC%BB%AC_jar_%ED%8C%8C%EC%9D%BC_%EC%9D%84_maven_project_%EC%97%90_%EC%B6%94%EA%B0%80%ED%95%98%EB%8A%94)

## 상황/ 궁금증
- [발생] maven의 라이브러리 의존 기능만 사용했던 프로젝트를 build기능까지 사용하려고 보니 제대로 build 되지 않는 문제가 발생. 
- [원인] maven central repository 외에 사용하고 있는 `local jar`(WEB-INF/lib)가 maven dependecies로 관리되지 않음.
  - 기존에는 project classpath에 추가하여 사용.
- [궁금] ** local jar 사용하면서 maven build 기능을 온전히 사용할 수 있을까? **
- [궁금] version 이 명시되지 않은 jar는 임의로 versioning 을 하면 되나?

## 정리
- 크게 세가지 방법
  - 1. `local Maven repository에 JAR 설치(Install manually the JAR into your local Maven repository)` (적용)
  - 2. `NEXUS로 자체 저장소 사용(Using Nexus repository manager)`(다음 기회에)
  - 3. `system scope로 설치없이 사용(Adding directly the dependency as system scope)` (하지 말자)

1. local Maven repository 사용
  1. local jar 만 따로 maven repository 를 만듦. 
   - 과정 : local jar deploy -> 해당 jar 각각 dependecy 추가 
     - local jar 는 하나의 폴더 밑에 모아져있어서 깔끔해보인다. 
     - [궁금] pom.xml 와 같은 위치 (project base dir) 외에 위치해있을때도 가능한가?

  2. local jar install 후, dependecy 추가
   - 

2. Nexus 사용
- 책 `메이븐(박재성 지음)`
- 
- local로 관리하고 있는 lib 수가 적고, 프로젝트 차원이 아니라 나만 local에 nexus 사용한다면, 


3. System scope 