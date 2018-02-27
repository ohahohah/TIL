- [Keyword](git_command.md#keyword)
- [Reference](git_command.md#reference)
- [상황 / 궁금](git_command.md#상황--궁금)
- [정리](git_command.md#정리)
   - [Branch](git_command.md#branch)
   - [commit](git_command.md#commit)
   - [Staging Area ( git index)](git_command.md#staging-area--git-index)
   - [Diff](git_command.md#diff)

-----------

## Keyword
`git command` `git`

## Reference
- [[GIT] 병합하고 Commit 재정렬하기: cherry-pick, rebase, merge](https://tuwlab.com/ece/22218)


## 상황 / 궁금

## 정리
### Branch
- `git brach` : 어떤 branch 있는지 확인, 현재 brach는 앞에 * 붙음. `git branch 생성할 브랜치명` (브랜치 생성)
- `git checkout 이동할 브랜치명` : 해당 브랜치로 이동
- `git checkout -b 생성하고_이동할_브랜치명` : 브랜치 생성하고 생성한 브랜치로 이동
- `git push (remote) (localbranch)` : `git push orgin localbranch01` = remote 브랜치에 로컬브랜치와 같은 이름의 브랜치를 만들고 해당 내용을 push 함
- `git push --set-upstream origin localbranch01` : 로컬브랜치와 같은 이름의 upstream(remote) 브랜치 tracking
- `git branch -m <oldname> <newname>` : rename a branch while pointed to any branch / `git branch -m <newname>` : rename the current branch
- `git branch -d localbranch01` : delete local branch named 'localbranch01' 
- `git push origin --delete remotebranch01` : delete remote branch ('remotebranch01')
  - `git fetch -p` : The git manual says -p, --prune After fetching, remove any remote-tracking branches which no longer exist on the remote.
  - [Git: Delete a branch (local or remote)](https://makandracards.com/makandra/621-git-delete-a-branch-local-or-remote)

### commit 
- `git commit -m "commit message"` : 한줄로 짧게 commit
- `git commit` : 길게 commit log 사용할때 사용
  - `git config core.editor "편집기(like vim)"` 또는 GIT_EDITOR 로 사용할 에디터 지정할 수 있음.
    - cygwin의 경우 "편집기" 대신 "c:/편집기경로/편집기.exe" 로 명시해주는게 나을 수 있음. (cygwin git이 아니라 Git for Windows 등 외부 git 사용할 경우)
- `git commit -a` : Staging area 생략. Tracked 상태의 파일을 자동으로 Staging Area에 넣음
- [Remove files from Git commit](https://stackoverflow.com/questions/12481639/remove-files-from-git-commit)
- git add * 2 -> git commit : added files 합쳐서 한번에 commit 됨
- `git commit --amend` : 최신 commit 수정
- commit 수정하고 싶을때 : [Git-과거의-특정-커밋-수정하기](http://homoefficio.github.io/2017/04/16/Git-과거의-특정-커밋-수정하기/index.html)
  - [git-scm - Git 도구 - 히스토리 단장하기](https://git-scm.com/book/ko/v1/Git-%EB%8F%84%EA%B5%AC-%ED%9E%88%EC%8A%A4%ED%86%A0%EB%A6%AC-%EB%8B%A8%EC%9E%A5%ED%95%98%EA%B8%B0)
  - 해당 remote branch에서 다른 수정이 일어났을 경우, 완전히 꼬여버리므로 주의하자
  1. `git rebase --i HEAD~되돌릴commit숫자` or `git rebase --interative commit아이디`
  2. 에디터창에서 pick -> edit 로 수정
  3. `git commit --amend` 후 commit 수정 , 완료 후 계속 작업 `git rebase --continue`
  4. 완료 후, `git push --force`

### Staging Area ( git index)
- `git add/rm filename01 filename02`
- `git add -u` : add all file
- `git add -u foldername` : To stage just under folder
- [Multiple file staging](https://stackoverflow.com/questions/492558/removing-multiple-files-from-a-git-repo-that-have-already-been-deleted-from-disk)
- ```git rm `git ls-files -d` ``` or ```git ls-files -z -d | xargs -0 --no-run-if-empty git rm``` : rm all delete file
  - [How to add and commit removals made with “rm” instead of “git rm”?](https://stackoverflow.com/questions/1856654/how-to-add-and-commit-removals-made-with-rm-instead-of-git-rm)

### Diff
- `git diff` : 수정했지만 아직 staged 상태가 아닌 파일의 내용을 비교
- `git diff --staged` : 저장소와 staging 된 파일 내용 비교

### log
`git log` : [scm - git log](https://git-scm.com/book/ko/v1/Git%EC%9D%98-%EA%B8%B0%EC%B4%88-%EC%BB%A4%EB%B0%8B-%ED%9E%88%EC%8A%A4%ED%86%A0%EB%A6%AC-%EC%A1%B0%ED%9A%8C%ED%95%98%EA%B8%B0)에서 추가 command 확인가능
- `git log -p -2` : -p = 각 커밋의 diff -2 = 최근 두 개의 결과
- `git log --pretty=oneline` : --pretty = 예쁘게 보여줌 / oneline = 각 커밋을 한 줄로, 그 외 short, full, fuller 있음
- 조회 제한
  - `--since=2018-02-13` `--since=2.weeks` , 2 years 1 day 3 minutes ago,...
  > -(n)	최근 n 개의 커밋만 조회한다.
    --since, --after	명시한 날짜 이후의 커밋만 검색한다.
    --until, --before	명시한 날짜 이전의 커밋만 조회한다.
    --author	입력한 저자의 커밋만 보여준다.
    --committer	입력한 커미터의 커밋만 보여준다.
- 그 외 
  - `--stat` : 커밋 통계정보
  - `git log --pretty=format:"%h %s" --graph` : 정해진 포맷(commit hash,subject) 과 함께 그래프 출력(source tree처럼 branch, merge history 보여줌)
