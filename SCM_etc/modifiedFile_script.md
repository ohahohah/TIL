## Keyword
`powershell` `script` `automation`

## Reference
- [TIL - svn](SCM_etc/svn.md)
- [The Java™ Tutorials - PATH and CLASSPATH](https://docs.oracle.com/javase/tutorial/essential/environment/paths.html)
- [[Java] CLASSPATH의 정의 및 설정 방법에 관한 기술 문서](http://egloos.zum.com/pcandme/v/2698293)
- [stackoverflow - how-can-i-list-all-classes-loaded-in-a-specific-class-loader](https://stackoverflow.com/questions/2681459/how-can-i-list-all-classes-loaded-in-a-specific-class-loader)
- [클래스로더 1, 동적인 클래스 로딩과 클래스로더](http://javacan.tistory.com/entry/1)
- google search `classloader list`
- [class파일내에서 classpath에 존재하는 리소스 파일읽어오기](http://roqkffhwk.tistory.com/124)
- [특정 package 목록에 포함된 class 목록 가져오기](http://icary.tistory.com/42)

### powershell script
- [Test-Path and If](https://community.spiceworks.com/topic/1472195-test-path-and-if)
- [Powershell - Test-Path if a file exists within a folder](https://social.technet.microsoft.com/Forums/scriptcenter/en-US/20cfc9af-d45a-4bcf-a79a-c7844f996984/powershell-testpath-if-a-file-exists-within-a-folder?forum=ITCG) // RegExp 참고
- [A better way to check if a path exists or not in PowerShell](https://stackoverflow.com/questions/31888580/a-better-way-to-check-if-a-path-exists-or-not-in-powershell)

## 상황/ 궁금증
- openAPI 프로젝트 운영계 특성상, 외부와 deploy가 막혀있어서 classfile, sourcefile 수동으로 복사해서 서버에 반영해야함.
- 변경 source 파일이 한두개가 아닌지라, source, class 파일 txt로 리스트만드는 것도 일이라 자동화할 수 있는 powershell 스크립트 만듦.
- [궁금] java classLoader 사용하면 mapping된 class 파일 가져올 수 있지 않을까?
- [궁금] resource 파일은 정규표현식으로 검색해야하나? (path명 규칙에 따라 변경 - 확장자명 제외한 파일이름으로 검색)
- [궁금] classpath 매핑을 어떻게 되어있지?


## 진행
- 스크립트 단계 기술 -> 스크립트 작성
1. svn revison number 사용해 svn 변경사항 확인 내용을 **'svnlog.txt'**로 기록
  - `svn diff -r (비교구간)revision시작번호:revision끝번호 --summarize`
2. 변경 파일과 매핑되는 class 파일 path 기록
  1. 변경종류에 따라 파일 패스만 남도록 정규화
    - 'M','A' 는 변경, 신규 파일이므로, path만 남도록 정규화
    - 'D' 는 삭제 파일이므로, '### 삭제 파일' 문구 뒤로 모아둠.
  2. ('삭제파일'이전 path만 해당) 해당 class 파일이 존재할때, **'svnlog.txt'**에 덧붙여 기록
    - 기록된 source 파일 path 이용하여 변경하여, 검색
    - `If(Test-Path path/classname.class) { >> WEB-INF/class/ExcelView.class svnlog.txt }`
  3. 
3. 

