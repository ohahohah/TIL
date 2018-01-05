## Keyword
`svn`

## Reference
- [Version Control with Subversion 1.7 - eBook](http://svnbook.red-bean.com/en/1.7/index.html)

## svn 변경사항 확인
- svn command로 확인
```
svn diff -r (비교구간)revision시작번호:revision끝번호 --summarize
```

## svn log 확인
- 최근 10개의 로그 확인. 
- local에서 commit했더라도 다시 서버에서 **update** 를 받지 않으면, local commit log가 뜨지 않음. 
  - revison 20 으로 local에서 commit함. 현재 프로젝트 상태가 revison 19에 있으면 19까지의 log만 보임 
```
svn log -l 10
```

------------
### 상황 / 궁금
- 오픈API프로젝트에서 개발내용을 운영서버에 반영하려면 수정된 소스파일 + 클래스파일 리스트를 정리하여 전달해야함
- eclipse에서 svn history로 변경파일click -> 눈으로 path위치 찾기 -> 소스파일 properties -> path 복사 의 과정을 거침. 정말 오래걸리고 못할 짓임.
- 찾은 방법: PowerShell(window)를 사용해 command로 확인
- 해당 revison 번호를 eclipse의  매번 찾아야함.
- [궁금] A.svn command 상에서 log 확인 방법
- [궁금] B.배포를 이 방식으로 해야만하는걸까? CI(지속가능한 통합)가 편리하다는 말은 들었는데 그게 뭐지?

### A. check svn log (in CLI)

