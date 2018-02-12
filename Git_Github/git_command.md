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

## 상황 / 궁금

## 정리
### Branch
- `git brach` : 어떤 branch 있는지 확인, 현재 brach는 앞에 * 붙음. `git branch 생성할 브랜치명` (브랜치 생성)
- `git checkout 이동할 브랜치명` : 해당 브랜치로 이동
- `git checkout -b 생성하고_이동할_브랜치명` : 브랜치 생성하고 생성한 브랜치로 이동

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
  - 해당 remote branch에서 다른 수정이 일어났을 경우, 완전히 꼬여버리므로 주의하자
  1. `git rebase --i HEAD ~되돌릴commit숫자` or `git rebase --interative commit아이디`
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
