## Keyword
`git` `git history`

## Reference
- [[GIT] 병합하고 Commit 재정렬하기: cherry-pick, rebase, merge](https://tuwlab.com/ece/22218)
- [git 에서 https repository 연결시 SSL 인증서 오류 해결법](https://www.lesstif.com/pages/viewpage.action?pageId=14090808)

## 상황/궁금증
- 회사프로젝트 gitlab설정하면서, git global config 를 회사계정정보로 설정했더니, 하위 폴더의 개인repository 설정도 회사계정으로 덮어써짐.
- git ssl로 repository 가져오거나 GitlabAPI 사용시, `curl: (60) SSL certificate problem: unable to get local issuer certificate` 출력

## 정리
### 이력 되돌리기 
#### git commit 수정 - push 전
- `git commit --amend` : 최신 commit 수정
- commit 수정하고 싶을때 : [Git-과거의-특정-커밋-수정하기](http://homoefficio.github.io/2017/04/16/Git-과거의-특정-커밋-수정하기/index.html)
  - [git-scm - Git 도구 - 히스토리 단장하기](https://git-scm.com/book/ko/v1/Git-%EB%8F%84%EA%B5%AC-%ED%9E%88%EC%8A%A4%ED%86%A0%EB%A6%AC-%EB%8B%A8%EC%9E%A5%ED%95%98%EA%B8%B0)
  - 해당 remote branch에서 다른 수정이 일어났을 경우, 완전히 꼬여버리므로 주의하자
  1. `git rebase --interative commit아이디` 
    - commit아이디 = 수정할 commit의 이전 아이디
    - `git rebase --i HEAD~되돌릴commit숫자` 안됨. command 확인필요
  2. 에디터창에서 pick -> edit 로 수정
  3. `git commit --amend` 후 commit 수정 , 완료 후 계속 작업 `git rebase --continue`
  4. 완료 후, `git push --force`
- `git reset` : commit 취소시 사용. 
  - `git reset HEAD^` / `git reset HEAD~4` : 가장 최근 commit 취소/최근 4개의 commit 취소. push 아직 안했을때 사용.
 
 #### git reset / git revert 차이
 - git reset
   - 
   - 
 - git revert
   - 
