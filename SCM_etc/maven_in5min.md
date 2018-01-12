## Keyword
`maven` `build`

## Reference
- [자바 세상의 빌드를 이끄는 메이븐(박재성지음) - 2장.메이븐 설치 및 템플릿 프로젝트 생성](http://www.aladin.co.kr/shop/wproduct.aspx?ItemId=11169988)
- [Maven in 5 Minutes](https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html)

## 상황/ 궁금증
- [궁금] 서블릿 표준 스펙? 

## 진행 
- 2018/01/12
- Tutorial(Maven in 5 Minutes)에서 확장 -> 모르는 개념 검색 보충
- :heavy_check_mark: 프로젝트 구조 / pom.xml 어떻게 생겼나 

### 1. Installation
- Install test `mvn --version`

### 2. Creating a Project
- Using Maven **Template**(편함.표준이 됨)! 
```
mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
```
or 
`mvn archetype:generate -DarchetypeCatalog=internal` : internal의 template 사용
- Maven에는 다양한 archetype이 존재. 직접 설정할 수도 있음.  
  - [] [공식 - Maven Archetype](https://maven.apache.org/archetype/index.html)

### 3. mvn command
`mvn [option] [<goal(s)>] [<phase(s)>]`
- option : (특정 프로젝트 외)전체에서 사용가능. i.e. mvn - version / *-D*: mvn -Dmaven.test.skip=true test:
- 여러 goal , phase 실행가능. i.e. mvn clean test

### 4. Life Cycle
- phase 실행했을때, 그 이전단계 phase 실행 후에  실행하네?
```
Unlike the first command executed (archetype:generate) you may notice the second is simply a single word - package. Rather than a goal, this is a phase. A phase is a step in the build lifecycle, which is an ordered sequence of phases. When a phase is given, Maven will execute every phase in the sequence up to and including the one defined. For example, if we execute the compile phase, the phases that actually get executed are:

1.validate
2.generate-sources
3.process-sources
4.generate-resources
5.process-resources
6.compile
(from.https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html)
```

- 실습
  - `//check part!` 는 주석임
  - test 전에 컴파일까지 다해주네
```
PS C:\Users\ohah\Documents\project\myfirst> mvn test
[INFO] Scanning for projects...
[INFO]
[INFO] ------------------------------------------------------------------------
[INFO] Building myfirst 1.0-SNAPSHOT
[INFO] ------------------------------------------------------------------------
[INFO]
//check part! resources:resources
[INFO] --- maven-resources-plugin:2.6:resources (default-resources) @ myfirst ---
[WARNING] Using platform encoding (MS949 actually) to copy filtered resources, i.e. build is platform dependent!
[INFO] skip non existing resourceDirectory C:\Users\ohah\Documents\project\myfirst\src\main\resources
[INFO]
//check part! compiler:compile
[INFO] --- maven-compiler-plugin:3.1:compile (default-compile) @ myfirst ---
[INFO] Changes detected - recompiling the module!
[WARNING] File encoding has not been set, using platform encoding MS949, i.e. build is platform dependent!
[INFO] Compiling 1 source file to C:\Users\ohah\Documents\project\myfirst\target\classes
[INFO]
//check part! resources:testResources
[INFO] --- maven-resources-plugin:2.6:testResources (default-testResources) @ myfirst ---
[WARNING] Using platform encoding (MS949 actually) to copy filtered resources, i.e. build is platform dependent!
[INFO] skip non existing resourceDirectory C:\Users\ohah\Documents\project\myfirst\src\test\resources
[INFO]
//check part! compiler:testCompile
[INFO] --- maven-compiler-plugin:3.1:testCompile (default-testCompile) @ myfirst ---
[INFO] Changes detected - recompiling the module!
[WARNING] File encoding has not been set, using platform encoding MS949, i.e. build is platform dependent!
[INFO] Compiling 1 source file to C:\Users\ohah\Documents\project\myfirst\target\test-classes
[INFO]
//check part! surefire:test
[INFO] --- maven-surefire-plugin:2.12.4:test (default-test) @ myfirst ---
[INFO] Surefire report directory: C:\Users\ohah\Documents\project\myfirst\target\surefire-reports
Downloading: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-junit3/2.12.4/surefire-junit3-2.12.4.pom
Downloaded: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-junit3/2.12.4/surefire-junit3-2.12.4.pom (2 KB at 0.8 KB/sec)
Downloading: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-providers/2.12.4/surefire-providers-2.12.4.pom
Downloaded: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-providers/2.12.4/surefire-providers-2.12.4.pom (3 KB at 5.5 KB/sec)
Downloading: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-junit3/2.12.4/surefire-junit3-2.12.4.jar
Downloaded: https://repo.maven.apache.org/maven2/org/apache/maven/surefire/surefire-junit3/2.12.4/surefire-junit3-2.12.4.jar (26 KB at 27.4 KB/sec)

//check part!
-------------------------------------------------------
 T E S T S
-------------------------------------------------------
Running com.ohah.AppTest
Tests run: 1, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 0.013 sec

Results :

Tests run: 1, Failures: 0, Errors: 0, Skipped: 0

[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 14.679 s
[INFO] Finished at: 2018-01-12T16:38:11+09:00
[INFO] Final Memory: 10M/124M
[INFO] -------------------------------------------------------------------------
```

------------------
## Error / 삽질파티 

### Creating Maven Project
1. 상황
- BUILD FAILURE 발생.
```
PS C:\Users\ohah\Documents\project> mvn archetype:generate -DgroupId=com.ohah -DartifactId=myfirst -DarchetypeArtifactId=maven-archetype-quickstart -Dintera
ctiveMode=false
[INFO] Scanning for projects...
[INFO] ------------------------------------------------------------------------
[INFO] BUILD FAILURE
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 0.136 s
[INFO] Finished at: 2018-01-12T16:00:24+09:00
[INFO] Final Memory: 2M/120M
[INFO] ------------------------------------------------------------------------
[ERROR] The goal you specified requires a project to execute but there is no POM in this directory (C:\Users\ohah\Documents\project). Please verify you invo
ked Maven from the correct directory. -> [Help 1]
[ERROR]
[ERROR] To see the full stack trace of the errors, re-run Maven with the -e switch.
[ERROR] Re-run Maven using the -X switch to enable full debug logging.
[ERROR]
[ERROR] For more information about the errors and possible solutions, please read the following articles:
[ERROR] [Help 1] http://cwiki.apache.org/confluence/display/MAVEN/MissingProjectException
```
> 처음 프로젝트 실행하려고 하는데 왜 안되죠? no POM이겠지. creating project 인데

2. 해결
- `powershell` 을 사용하고 있어서, 구문에 ""따옴표 붙인 command 로 문제해결 (참고.[TIL - powershell](Devenv/powershell.md))
```
mvn archetype:generate "-DgroupId=com.ohah" "-DartifactId=myfirst" "-DarchetypeArtifactId=maven-archetype-quickstart" "-DinteractiveMode=false"
```
- [stackoverflow - Error “The goal you specified requires a project to execute but there is no POM in this directory” after executing maven command](https://stackoverflow.com/questions/16348459/error-the-goal-you-specified-requires-a-project-to-execute-but-there-is-no-pom)
