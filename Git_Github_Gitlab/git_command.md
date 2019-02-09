---
search:
    keywords: ['git command', 'git']
---
  
- [Reference](#reference)
- [상황 / 궁금](#상황--궁금)
- [정리](#정리)
   - [Branch](#branch)
   - [commit](#commit)
   - [Staging Area ( git index)](#staging-area--git-index)
   - [Diff](#diff)
   - [log](#log)
   - [git Statsh : branch 변경할때 commit 하지 않고 다시 돌아와서 작업하기](#git-statsh--branch-변경할때-commit-하지-않고-다시-돌아와서-작업하기)
   - [Removing sensitive data from a repository 민감한 데이터 제거하기](#removing-sensitive-data-from-a-repository-민감한-데이터-제거하기)
      - [1. 작업 전 처리해야할 것](#1-작업-전-처리해야할-것)
      - [2-1. Using the BFG : 설치 필요하지만 간단함](#2-1-using-the-bfg--설치-필요하지만-간단함)
      - [2-2. git-filter-branch 사용해 파일 삭제 : Git 내장 command 사용](#2-2-git-filter-branch-사용해-파일-삭제--git-내장-command-사용)
         - [command 역할](#command-역할)
-----------

## Reference
- [[GIT] 병합하고 Commit 재정렬하기: cherry-pick, rebase, merge](https://tuwlab.com/ece/22218)
- [Removing sensitive data from a repository](https://help.github.com/articles/removing-sensitive-data-from-a-repository/) / [이전 버전 문서 비공식번역본 - GitHub / Advanced Git / 민감한 데이터 제거하기](http://minsone.github.io/git/github-advanced-remove-sensitive-data)
- [git- docs](https://git-scm.com/docs/) : `git --version`으로 사용하고 있는 version에 맞는 doc 확인
- [pro Git book](https://git-scm.com/book/en/v2) / [pro Git book(한국어)](https://git-scm.com/book/ko/v2)
- [[git]작업의 취소 - by 에코지오](http://ecogeo.tistory.com/276)

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

### PR
- [GitHub의 Pull Request를 로컬로 가져오기](https://blog.outsider.ne.kr/1204#recentTrackbacks)

### Repository
- [[번역]GitHub / Managing Remotes / 원격 저장소 URL 변경하기](http://minsone.github.io/git/github-managing-remotes-changing-a-remotes-url)

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
  1. `git rebase --interative commit아이디` 
    - commit아이디 = 수정할 commit의 이전 아이디
    - `git rebase --i HEAD~되돌릴commit숫자` 안됨. command 확인필요
  2. 에디터창에서 pick -> edit 로 수정
  3. `git commit --amend` 후 commit 수정 , 완료 후 계속 작업 `git rebase --continue`
  4. 완료 후, `git push --force`
- `git reset` : commit 취소시 사용. 
  - `git reset HEAD^` / `git reset HEAD~4` : 가장 최근 commit 취소/최근 4개의 commit 취소. push 아직 안했을때 사용.

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
- `git log -p --word-diff <filename>` : 해당 파일의 단어 기준의 diff 출력
- `git log --pretty=oneline` : --pretty = 예쁘게 보여줌 / oneline = 각 커밋을 한 줄로, 그 외 short, full, fuller 있음
- 특정 파일의 log 확인 : `git log <filename>` 
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

### git Stash : branch 변경할때 commit 하지 않고 다시 돌아와서 작업하기
- [Pro git - 7.3 Git 도구 - Stashing과 Cleaning](https://git-scm.com/book/ko/v2/Git-%EB%8F%84%EA%B5%AC-Stashing%EA%B3%BC-Cleaning)

### Git remote branch 가져오기
- [Git remote branch 가져오기](https://cjh5414.github.io/get-git-remote-branch/)
- 단일 브랜치만 클론하기 : `git clone -b {가져올 브랜치이름} {git url}`
- remote repository 특정 브랜치 가져오기 : `git checkout -t {remote repository/브랜치명}` (git checkout -t origin/ohahohah)
  - `git branch -r`  : 원격저장소 branch 리스트 보기

### Removing sensitive data from a repository 민감한 데이터 제거하기
- git 자체 command(`git-filter-branch`) 를 사용하는 방법과 - [BFG Repo-Cleaner](https://rtyley.github.io/bfg-repo-cleaner/)를 사용하는 두 가지 방법이 있음.
- 패스워드 키등 민감한 데이터 제거를 위해 리포지토리의 일부 파일/폴더를 삭제하려면, 해당 데이터뿐만 아니라 히스토리도 함께 삭제해야함. 
- `git-filter-branch` 사용해서 히스토리 전체에서 필요한 것(해당 파일이 포함된 히스토리를 '필터링'해 제외한 모든 히스토리)만을 골라낸다.
  - 단일 commit 수정으로 가능할 경우, 되도록 이 command를 사용하지 말 것! 
  - rewritten history는 모든 object는 다른 object name을 가지게 되어서, orginal branch를 cover하지 않으므로, 
rewritten branch 는 쉽게 original branch에 push, distribute 할 수 없음. 
- 본 단락은  아래 reference 발췌,요약했음. 
  - [GitHub - Removing sensitive data from a repository](https://help.github.com/articles/removing-sensitive-data-from-a-repository/) / [비공식번역본 - GitHub / Advanced Git / 민감한 데이터 제거하기](http://minsone.github.io/git/github-advanced-remove-sensitive-data)
  - [git Doc - filter-branch](https://git-scm.com/docs/git-filter-branch)
  - [git scm - 7.6 Git Tools - Rewriting History](https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History) / [git scm - 7.6 Git 도구 - 히스토리 단장하기](https://git-scm.com/book/ko/v2/Git-%EB%8F%84%EA%B5%AC-%ED%9E%88%EC%8A%A4%ED%86%A0%EB%A6%AC-%EB%8B%A8%EC%9E%A5%ED%95%98%EA%B8%B0)
-------
- 최근 commit에서 단순 파일 제거시에는 [Removing files from a repository's history](https://help.github.com/articles/removing-files-from-a-repository-s-history/#platform-mac) 참고
- 처리된 후에도, GitHub cached view를 통해 clone이나 fork로 해당 commit에 접근될 수 있음. cached view 제거하고 싶을 경우, Github에 따로 요청. 
 > However, it's important to note that those commits may still be accessible in any clones or forks of your repository, directly via their SHA-1 hashes in cached views on GitHub, and through any pull requests that reference them. You can't do anything about existing clones or forks of your repository, but you can permanently remove all of your repository's cached views and pull requests on GitHub by contacting GitHub Support. (from [article](https://help.github.com/articles/removing-sensitive-data-from-a-repository/))

#### 1. 작업 전 처리해야할 것
- 오픈 PR을 merge하거나, close 해야함. 
  - repository history를 rewrite하는 것이므로, SHA 변경이 됨. 관련 commit에 영향을 줄 수 있음. 
- 삭제해야할 파일을 stashing 했을 경우, unstashing해야함. 
  - `git stash show -p | git apply -R` 
  - [Pro git - 7.3 Git 도구 - Stashing과 Cleaning](https://git-scm.com/book/ko/v2/Git-%EB%8F%84%EA%B5%AC-Stashing%EA%B3%BC-Cleaning)
- stash해두었을 경우 commit history 가 변경되었을때 해당 stash가 사라질 수 있음

#### 2-1. Using the BFG : 설치 필요하지만 간단함
- [BFG Repo-Cleaner](https://rtyley.github.io/bfg-repo-cleaner/)는 `git-filter-branch` 보다 간단함.
- 설치 후, `bfg --delete-files YOUR-FILE-WITH-SENSITIVE-DATA` 로 YOUR-FILE-WITH-SENSITIVE-DATA 파일 삭제

#### 2-2. `git-filter-branch` 사용해 파일 삭제 : Git 내장 command 사용
- `git-filter-branch` 는 모든 branch,tag,commit을 정리하고 branch pointer를 다시 복원해줌
  - 'YOUR-FILE-WITH-SENSITIVE-DATA' 파일이 포함된 commit을 변경하고, 이후 commit의 전체 history를 rewite. 나중에 empty commit은 완전히 제거('YOUR-FILE-WITH-SENSITIVE-DATA'만 변경되었으므로)
- testing brach에서 실험하고 나서 master branch에 적용하는 게 좋음(filter-branch 명령에 --all 옵션을 추가하면 모든 브랜치에 적용됨)

1. 삭제해야할 파일을 필터링해 git-filter-branch
 `git filter-branch --force --index-filter \
'git rm --cached --ignore-unmatch PATH-TO-YOUR-FILE-WITH-SENSITIVE-DATA' \
--prune-empty --tag-name-filter cat -- --all`
- FileName이 아닌 path가 필요함.
  - 삭제해야할 파일이 전에 path를 바꾼 적이 있을때, 이전 경로에 대해서 동일한 작업 실행해야함.

##### command 역할
- 역할 
  - Git이 모든 브랜치와 태그의 전체 히스토리를 처리하지만 체크아웃하지 않음.
  - 지정된 파일뿐만 아니라 (해당 파일을 제거 필터링한)결과로 생성된 빈 커밋을 제거
  - 기존 태그 덮어 쓰기
- `--force --index-filter` : 강제로 인덱스를 재작성. tree filter와 비슷하지만 checkout하지 않아서 더 빠름. 
- `'git rm --cached --ignore-unmatch YOUR-FILE-WITH-SENSITIVE-DATA'`
  - 각 스냅샷에 YOUR-FILE-WITH-SENSITIVE-DATA 이 있으면, 인덱스에서만 path를(`--cached` / Staging Area에서만 제거하고 워킹 디렉토리에 있는 파일은 지우지 않고) 삭제(rm)하고, 매치되는 파일이 없어도 zero status로 exit함(--ignore-unmatch)
  - [git doc - git-rm](https://git-scm.com/docs/git-rm)
  - [Pro Git - 2.2 Git Basics - Recording Changes to the Repository](https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository) / [Pro Git - 2.2 (한국어판)](https://git-scm.com/book/ko/v2/Git%EC%9D%98-%EA%B8%B0%EC%B4%88-%EC%88%98%EC%A0%95%ED%95%98%EA%B3%A0-%EC%A0%80%EC%9E%A5%EC%86%8C%EC%97%90-%EC%A0%80%EC%9E%A5%ED%95%98%EA%B8%B0)
- `--prune-empty`
  - tree를 건드리지 않고, merge commit이 그대로 유지되도록 함. (하나 또는 가지치기되지 않은 부모(one or non-pruned parents)가 있는 커밋을 git-filter-branch에서 remove함.) 
- `--tag-name-filter cat` 
  - 태그를 rewrite. 모든 tag ref가 rewritten object(or to a tag object which points to a rewritten object)를 point하게 됨. 
  - `cat` option을 사용했으므로, original tag가 삭제되지 않고, 덮어써짐(overwritten). 이때 새로 생성된 tag object의 message, author, and timestamp는 동일하게 생성되지만, signatures는 유지되지 않음.
- `--all` : 모든 branch에 적용

3. repository의 history에서 원하는 모든 것을 제거했는지, 모든 brach를 checkout했는지 다시 확인.
4. `git push origin master --force` : 변경된 사항(local에 적용되어있음)을 remote에 적용(강제 push 실행)
5. `git push origin --force --tags ` : tagged release 에 파일 있을 경우, 적용
6. 작업 후 처리해야할 것
- 다시 commit하는 실수를 하지 않도록 .gitignore에 추가 
- 공동작업자에게 merge하지 않고 rebase 하도록 알려줌. (merge commit시, 이전 버전의 history가 적용되어버릴 수 있음.)
- 파일 삭제시 해당 데이터가 손상된 것으로 간주해야함. 암호 또는 키일 경우, 변경필요
- (Git 1.8.5 이상일 경우)
```
$ git for-each-ref --format='delete %(refname)' refs/original | git update-ref --stdin
$ git reflog expire --expire=now --all
$ git gc --prune=now
```

### git rebase
- PR하기 전에 upstream(fork해온 repository말고 원본 repository)에서 rebase 해오는데 아래와 같은 Merge conflict 메시지가 뜨는 경우가 있음. 
- 하단 가이드대로 
  - `git am --show-current-patch` : 현재 내용과 upstream의 commit과 어떤 부분이 충돌나는지 대략적으로 확인
  - 충돌 해결 : `<<<<<<< HEAD`와 `=======` 사이가 현재 파일에서 충돌난 내용. `=======` 와 `>>>>>>>` 사이가 upstream의 충돌난 내용임. 두 부분을 적절히 선택해서 남기고 주석까지 지워줘야함. 대략 아래와 같은 구조
    ```
    <<<<<<< HEAD
    현재 checkout된 파일 내용
    =======
    upstream의 commit 가져올 내용
    >>>>>>> upstream의 commit 메시지 
    ```   
  - `git add/rm <conflicted_files>` : 충돌 해결한 내용을 업데이트. 해당 파일을 지우거나 수정해서 업데이트 하거나.
  - `git rebase --continue` : rebase 마저 진행하쇼
  - 충돌난 commit 을 skip 하고 싶을 땐 `git rebase --skip`
  - 이 rebase를 그만두고 rebase전 상태로 돌아갈 때 `git rebase --abort`

- 아래와 같이 충돌났을때 guide가 출력됨.
```
❯ git rebase upstream/ohahohah                                          
First, rewinding head to replay your work on top of it...
Applying: Add Tdd practice metting
Using index info to reconstruct a base tree...
M       meeting_log.md
.git/rebase-apply/patch:14: trailing whitespace.
  
Falling back to patching base and 3-way merge...
Auto-merging meeting_log.md
CONFLICT (content): Merge conflict in meeting_log.md
error: Failed to merge in the changes.
Patch failed at 0001 Add Tdd practice metting
Use 'git am --show-current-patch' to see the failed patch

Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".
```
