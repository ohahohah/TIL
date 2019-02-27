## Intro
- Jetbrain 사에서 만든 IDE Intellij에 관한 사용법 정리
  - 나는 학부때 사용하던 eclipse를 쓰다가 Intellij를 쓰면 얘가 개발 다 해준다더라는 소문을 듣고 Intellij를 쓰기 시작했다. 확실히 인간이 굳이 하지 않아도 되는 잡일들을 확 줄여준다. 
  - 처음에 굳이 왜 Intellij를 쓰는지 **실제로 사용하는 모습을 보고 관찰** 한 다음 넘어가면 좋을 듯 하다(e.g. 주위에 잘 사용하고 있는 사람의 모습보기 or Intellij로 livecoding 하는 영상). 어디에 장점을 가지고 있는지 파악이 되었다면, 그 이후에 세부 사용법은 친절한 공식문서를 보면서 익히면 됨. Jetbrain 계열 IDE (pycharm,..)에도 단축키가 같아서 한번 배우면 여러 IDE에 적용할 수 있음 

## Reference
- [IntelliJ IDEA 2018.3 Help](https://www.jetbrains.com/help/idea/meet-intellij-idea.html) : Intellij를 만든 Jetbrain의 공식 도움문서로 참으로 친절하다
- [IntelliJ IDEA 2018.3 Help - Migrating From Eclipse to IntelliJ IDEA
](https://www.jetbrains.com/help/idea/migrating-from-eclipse-to-intellij-idea.html): eclipse에서 Intellij로 넘어갈때 헷갈리는 개념에 대해 참고할만한 자료
- [IntelliJ를 시작하시는 분들을 위한  IntelliJ 가이드 - 이동욱님 인프런 강의](https://www.inflearn.com/course/intellij-guide/): 처음 접근하는 사람도 무섭지 않게 차근차근 핵심기능을 알려줌. 어우 바꾸기 부담되고 어디서부터 시작할지 모르겠어 하는 사람들에게 추천. 내가 쓰던 단축키-기능을 Intellij에서는 어떻게 쓰는지 알려줌.

## Intellij 기본 사용법
- 기존에 알고 있던 내용은 제외하고 새로 알게된 내용이나 한번 더 리마인드가 필요한 내용만 정리함. 나만 알아볼 수 있게 정리해두었으므로 자세한 내용이 알고 싶으면 위 공식 문서와 이동욱님 인프런 강의를 참고할 것.
- Toolbox 에서 JVM 설정
![jetbrainToolboxSetting](https://i.imgur.com/mh6H4gm.png?1)
- 라이브러리 관리를 위해 기본 Java 프로젝트도 Maven or Gradle 프로젝트로 생성
- Maven,Gradle 사용시 라이브러리 Auto import 를 켜놓자. 자동으로 가져오게 되어서 편함
![intellijMavenimport](https://i.imgur.com/NCgGMoA.png?1)

## Code inspection
- [IntelliJ IDEA 2018.3 Help - code-inspection](https://www.jetbrains.com/help/idea/code-inspection.html)
- Menu - Analyze - Inspect code 선택 
- IDE내에서 git commit 할 경우, Before Commit 옵션에 'Perform codeanalyze' 체크해서 사용하자 

## 들어가기 전 - mac 기본 단어 이동 shortcut
- 단어별 이동 `opt + left/right`
- 줄 맨 앞 뒤로 `fn + left/ right`
- page up/down `fn + up/down`
- 단축키에 `shift` 추가하면 block 선택됨

## shortcut - 자주 쓰이는 단축키 중심 정리 (Mac 10.5+)
- Find Action(`cmd + shift + a`) : 뜨는 창에 찾고 싶은 action 입력하면 창이 쭉 뜸. 단축키를 잘 모르는 초기에 가장 많이 사용. 단축키 모른다 -> 'Find Action'띄워놓고 검색하자
- Preferece (`cmd + ,`)
- New(`cmd + N`) : 새로 생성할때 사용. 클래스내에서는 method생성으로, project창에서는 새로운 파일명 등등 각 위치에 따른 context에 맞게 무엇을 새로 생성할 것인지 선택하는 부분이 뜸. 
  -  Directory 명 입력시 '/'입력하면 하위 디렉토리 생성. e.g. 'src/main/java'
  -  package 명 입력시도 비슷하게 '.'으로 하위 package생성. e.g com.ohahohah.intellij
- smart completion (`shift + ctrl + space`)
  - 기본 자동 완성(`ctrl + space`) : static method 자동완성은 `ctrl + space` * 2
  - override(`ctrl + I`)
- Rename(`shift + F6`)
- Refactoring - 중복부분 Extraction(Variable,Parameter,Method) - `opt + cmd + V/P/M` 
- Reformat code(`cmd + opt + L`) : 코드 자동정렬
  - 프로젝트의 code convention에 따라 설정하려면 참고 - [IntelliJ IDEA 2018.3 Help - configuring-code-style](https://www.jetbrains.com/help/idea/configuring-code-style.html) / [Installing the google styleguide settings in intellij and eclipse](https://github.com/HPI-Information-Systems/Metanome/wiki/Installing-the-google-styleguide-settings-in-intellij-and-eclipse)
- Run(`ctrl + shift + R`) ; 실행환경 실행
  - selected Run (`ctrl + R`) : IDE 창 우측 상단에 select된 것 Run / 이전 실행했던거 다시 실행할때 유용
![intellijRunConfiguration](https://i.imgur.com/psMfUvI.png?1)
- Recent File(`cmd + E`) : 모달으로 최근 접근한 파일 목록 보여줌. 파일 이동할때 편함
  - Recently changed File(`cmd + shift + E`) : 최근 수정 파일 목
- Show Intetion Action (`opt + Enter`) : 즉각적으로 에러 수정할때 유용
  - Navigate -> Next Highlighted Error(`F2`) : 에러 난 곳으로 커서 이동
- 기본 설정으로 Optimize import 설정 
![Intellij_optimizeImport](https://i.imgur.com/lgMpQbE.png)
  - 협업을 위해 wildcard import (*)를 피해야할 경우 설정 참고 : [Disable wildcard imports](https://www.jetbrains.com/help/idea/creating-and-optimizing-imports.html#disable-wildcard-imports)
  - Optimize import(`cmd + opt + O(alphabet)`) : 해당 파일의 안 쓰는 import문 없애기 
- Git popup(`ctrl + v + 팝업창 action숫자`)
  - commit(`cmd + k`) - Before commit option 활용하기 
  - push (`cmd + shift + k`)

## Shortcut - Search / replace
- Find in Path 프로젝트 내 전체 찾기 (`shift + cmd + F`)/ Find(`cmd + F`) : Regex 사용가능
- Replace in Path 프로젝트 내 전체 바꾸기 (`shift + cmd + R`) / Replace(`cmd + R`) : Regex 사용가능 
- File Name search (`cmd + shift + O(alphabet)`) : '/'사용해 계층 구조까지 검색 가능. e.g. helper/Member -> helper package안의 Memeber라는 파일명 검색 
- Symbol search (`cmd + opt + O(alphabet)`) : 메소드 검색에 유용.

## Shortcut - selection
- Extend/shrink Selection (`opt + up/down`) : 계층구조 단위로 selection이 늘어나거나 줄어듦. 
- Navigate -> back/forward (`cmd + [ / ]`) : 이전,이후에 있던 커서 위치로 이동
- Clone Caret Above/Below (`opt * 2 + up/down`) : 해당 커서를 위 아래 줄로도 확장.
  - e,x. 3 ~ 6라인의 같은 위치에 적혀있는 member라는 단어를 동시에 선택하기 :  3라인의 member 단어에 커서 위치시킴 ->  `opt*2 + down`으로 6라인까지 커서 확장 -> `opt + up`으로 member 단어 selection 

## Shortcut - Editing Line
- Duplacate line (`cmd + d`) : 복제 원하는 line에 커서 둔 후에 실행
- Remove line (`cmd + backspace`)
- Join line (`ctrl +_shift + j`) : "line01 " + "line02 " + "line03" -> "line01 line02 " + "line03" -> ""line01 line02 line03"
- Move line up/down 
  - `opt + shift + up/down key` : 컴파일 에러에 상관없이 라인단위로 아래 위로 이동
  - `cmd + shift + up/down key` : block(for문, method 단위)을 생각하면서 라인 이동
- Move Element (`opt + cmd + shift + left/right key`) : <h1 id="titleid" name="titlename"></h1> 에서 name 에 커서를 두고 이동하면 해당 element 가 좌우로 이동

## Shortcut - code info
- Parameter Info(`cmd + p`) : method, constructor등의 param info(e.g. Long id, String name)를 보여줌
- Quick Definition(`opt + space`) :  모달창으로 커서가 위치한 해당 method,class,js,...에 대해 정의 보여줌. (주의. name에 커서를 두고 단축키 입력해야함. 괄호 부분은 안됨)
- Quick Documentation(`F1`) : 해당 부분에 커서를 두고 단축키를 누르면 모달창으로 짧은 정의 문서 보여줌 (Java 등의 공식문서)

## Live Template 
- 참고 : [IntelliJ IDEA 2018.3 Help - Using live templates](https://www.jetbrains.com/help/idea/using-live-templates.html)
- 자주 쓰이는 코드 구문을 축약어를 타이핑하면 자동 생성됨. 직접 만들어 쓸 수 있음.
- `cmd + J` 입력하면 등록된 live template 목록 보
  - `sout`을 입력하면 `System.out.println();`이 자동 생성됨.
  - `psfs` ->  `public static final String`
  - `fori` ->  `for (int i = 0; i < ; i++) { }`
  - `ifn` -> `if (var == null) { }`

## Refactoring 
### 중복부분 Extraction - `opt + cmd + V/P/M`
- Extract - variable(`opt + cmd + V`)
- Extract - parameter (`opt + cmd + P`) : option을 통해 기존 method 유지하면서 overloading으로 parameter 뽑아내는 것 가
- Extract - Method (`opt + cmd + M`)
- Class(`F6`) : class명에 커서를 두고 누르면 inner클래스를 Upperlevel로 바꾸거나 다른 package 로 변경  

### Rename / ReType
- Rename(`shift + F6`)
- ReType (`shift + cmd + F6`) : 타입 바꾸기 

## plugin (내장기능 포함)
- 평소에 플러그인을 많이 사용하지 않음. 가장 유용하게 쓰고 있는 몇 가지 플러그인을 소개.
- [codota](https://www.codota.com/) : AI code 자동완성을 표방하는 서비스 codota. 내가 작성하는 코드와 유사한 코드를 찾아서 추천해줌.
- Key promoter X : 마우스로 클릭한 기능이 단축'키'로 무엇인지 알려줌. 자주 쓰는 기능을 단축키로 익히는데 유용.
- UML : 기본 내장기능. class diagram으로 클래스간의 구조를 reverse engineering으로 파악함. 쓸데없이 복잡도가 높아지진 않았는지, 객체의 역할별로 제대로 클래스 분리가 되었는지 확인차원에서 사용.
- Rainbow Bracket : 짝이 되는 괄호끼리만 같은 색으로 표시해 괄호를 한눈에 볼 수 있음. chain을 쓸때 유용함.
- [Translator](https://github.com/jojoldu/translator) : 한<->영 변환. naming할때 IDE 창을 벗어나지 않고 정보를 얻을 수 있음
- Presentation assistant: 같은 기능의 단축키가 Mac/ Windows/ Linux 에서 어떤 단축키인지 확인가능. 
- [.ignore](https://plugins.jetbrains.com/plugin/7495--ignore) : VCS의 .ignore 파일 자동완성 지원
- [Bash support](https://www.plugin-dev.com/project/bashsupport/) : bash파일 자동완성 등 지원

## Debugging
- 다른 IDE 와 거의 유사. 
- 기본 사용은 [IntelliJ IDEA 2018.3 Help - Debugging](https://www.jetbrains.com/help/idea/debugging-code.html) / 기본 UI는 [IntelliJ IDEA 2018.3 Help - Debug Tool Window](https://www.jetbrains.com/help/idea/debug-tool-window.html#steptoolbar) 참고 
- Start Debugging (실행할 곳에 커서를 두고 `ctrl + shift + D`) 
  - Toggle Line Breakingpoint 는 마우스 클릭으로 왼쪽 창에 찍음(단축키도 있지만 굳이 외울 필요x)
    - conditional breakepoint : 조건문으로 특정 조건을 설정. 조건 충족할때만 breake.
- Run Selected Debugging (`ctrl + D`) : 직전에 실행한 디버깅을 다시 실행
- Debug view : 좌측 callstack / 우측 variable(현재 breakingpoint에서 볼 수 있는 var)
- Debug toolbar - resume(`cmd + opt + R`) : 다음 Breaking point로 넘어감
- Stepping toolbar : breaking point 이동 관련 toolbar
  - step over(`F8`) : Breaking point 다음 라인 실행, 다음 라인 실행,...
  - step into(`F7`) / step out (`shift + F8`): 현재 breaking point의 내부 method, 생성자 안으로 들어감 / 들어갔다가 나감
  - Evaluate Expression(`opt + F8`) : Breake 상태에서 code 사용. 현재 breakpoint에서 한번만 확인해보면 되는 실행결과값을 바로 확인가능. [IntelliJ IDEA 2018.3 Help - evaluating-expressions](https://www.jetbrains.com/help/idea/evaluating-expressions.html) 참고. 
  - Watch : 현재 breake에서부터 다음 breake시점까지 실시간으로 값이 변하는 걸 볼 때 사용.
- 기타 참고 : [IntelliJ 디버깅 해보기 - jojoldu blog](https://jojoldu.tistory.com/149)

## Error 정리
- 파일 인코딩 문제 [Error:(1, 1) java: illegal character: '\ufeff'](http://blog.naver.com/PostView.nhn?blogId=zzisoo9&logNo=220394962141) : 파일을 다른 에디터로 오픈했을때 UTF-8을 제대로 못 읽어옴. 파일 앞에 보통 인코딩 정보가 있는데 그 정보가 제대로 읽어들이지 않음. 인코딩 깨짐 에러 나면 UTF-16 으로 바꾼 후 다시 UTF-8 로 바꾸면 해결