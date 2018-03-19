## Keword

## Reference
- [2.5 Git의 기초 - remote 저장소](https://git-scm.com/book/ko/v2/Git%EC%9D%98-%EA%B8%B0%EC%B4%88-%EB%A6%AC%EB%AA%A8%ED%8A%B8-%EC%A0%80%EC%9E%A5%EC%86%8C)
- [git scm - 3.5 Git 브랜치 - 리모트 브랜치](https://git-scm.com/book/ko/v2/Git-%EB%B8%8C%EB%9E%9C%EC%B9%98-%EB%A6%AC%EB%AA%A8%ED%8A%B8-%EB%B8%8C%EB%9E%9C%EC%B9%98)
## 궁금
- svn local repository 

## 정리 
### Local 저장소를 빈 원격 저장소에 연결 
- e.g. local에서 작업하던 내용을 원격저장소 생성해 옮길 필요가 있을때
- README.md 자동생성 하지 않음. push에서 충돌이 생김.

1. local repository `git init`
1-1. git global setup(`--global`) 또는 해당 repository에만 적용될 setup 설정 (난 여러계정을 사용하기때문에 repository 별로 설정함)
```
git config user.name "name"
git config user.email "email@email.com"
```

2. `git remote add [giturl's alias] [giturl]`
3. `git push -u origin master` 또는 `git push origin -all` (local의 모든 branch push)
3-1. local repository에 branch 가 없을 경우, 아래와 같은 error 발생할 수 있음. first commit 실행하면 해결됨.
  - [stackoverflow - git-error-failed-to-push-some-refs-to](https://stackoverflow.com/questions/24114676/git-error-failed-to-push-some-refs-to)
```
$ git checkout
fatal: You are on a branch yet to be born

$ git push origin master
error: src refspec master does not match any.
error: failed to push some refs to 'giturl/something.git'
```

### branch 관리
#### What is remote branch
- remote refs : remote repository 에 있는 pointer인 reference like branch, tag,...
- `git ls-remote [remote]` : remote refs 조회
- remote tracking branch = romote brach를 tracking하는 branch.(이 문서에서는 remote branch 와 tracking하는 local branch임)
  > git.ourcompany.com 이라는 Git 서버가 있고 이 서버의 저장소를 하나 Clone 하면 Git은 자동으로 `origin`이라는 이름을 붙인다.  `origin`으로부터 저장소 데이터를 모두 내려받고 master 브랜치를 가리키는 포인터를 만든다. 이 포인터는 origin/master 라고 부르고 멋대로 조종할 수 없다. 그리고 Git은 로컬의 master 브랜치가 origin/master를 가리키게 한다. 이제 이 master 브랜치에서 작업을 시작할 수 있다.
  - why 'orgin'? 
  > ‘origin’의 의미  브랜치 이름으로 많이 사용하는 ‘master’라는 이름이 괜히 특별한 의미를 가지는 게 아닌 것처럼 ‘origin'도 특별한 의미가 있는 것은 아니다. git init 명령이 자동으로 만들기 때문에 사용하는 이름인 'master’와 마찬가지로 'origin'도 git clone 명령이 자동으로 만들어주는 리모트 이름이다. `git clone -o booyah` 라고 옵션을 주고 명령을 실행하면 booyah/master 라고 사용자가 정한 대로 리모트 이름을 생성해준다.


#### Get Remote branch
- [git-scm : 3.5 Git branch - remote branch](https://git-scm.com/book/ko/v2/Git-%EB%B8%8C%EB%9E%9C%EC%B9%98-%EB%A6%AC%EB%AA%A8%ED%8A%B8-%EB%B8%8C%EB%9E%9C%EC%B9%98)
1. `git fetch`  : Get remote traching branch
  > Fetch 명령으로 remote tracking branch를 내려받는다고 해서 local 저장소에 수정할 수 있는 branch가 새로 생기는 것이 아니다. 다시 말해서 patch-04 라는 branch가 생기는 것이 아니라 그저 수정 못 하는 origin/patch-04 branch 포인터가 생기는 것이다. (from 'git-scm 3.5 Git branch - remote branch' 인용)
```
  $ git fetch
From gitlab.com:someone/test
 * [new branch]      patch-04   -> origin/patch-04 
  ```
  - 확인 : remote branch 가 생성되었지만, 자동으로 local branch 가 생기지 않음
```
$ git branch --all
  master
  patch-01
  patch-02
* patch03
  remotes/origin/master
  remotes/origin/patch-01
  remotes/origin/patch-02
  remotes/origin/patch-04
  ```
2. git 1.65 이상 버전에서는 `git checkout [remote branch name]` 로 자동으로 remote branch 와 같은 이름으로 local branch 생성(자동으로 tracking 됨)
```
$ git checkout patch-04
Switched to a new branch 'patch-04'
Branch patch-04 set up to track remote branch patch-04 from origin.
```
**또는**
2-1. merge 하기
  > 새로 받은 branch의 내용을 Merge 하려면 git merge origin/serverfix 명령을 사용한다. 
2-2. Merge 하지 않고 remote tracking branch에서 시작하는 새 branch를 만들려면 (원론적으로는 이 명령어 사용)
```
$ git checkout -b serverfix origin/serverfix
Branch serverfix set up to track remote branch serverfix from origin.
Switched to a new branch 'serverfix'
```

#### Tracking branch
- remote tracking branch를 local branch로 Checkout 하면 자동으로 'tracking(Tracking) branch'가 만들어짐 
  - Upstream branch: tracking 하는 대상 branch / liek orgin/patch-04  
  - tracking branch에서 git pull 명령을 내리면 remote 저장소로부터 데이터를 내려받아 연결된 remote branch와 자동으로 Merge 한다.  `patch-04   -> origin/patch-04`
- `git remote show [remote repository name]`
  - remote 저장소 정보 보여줌. remote branch, tracking branch 정보 확인할 수 있어서 유용
  - remote repository name 생각나지 않을 땐 , `git remote -v` 사용해서 repository alias  - giturl 정보 함께 볼 수 있음
- Tracking 상태 확인 `git branch -vv` 
  - `git fetch --all; git branch -vv` : 최신 fetch내용을 가져
```
$ git branch -vv
  master   fbb9c4e [origin/master] Merge branch 'patch-01' into 'master'
  patch-01 bbb02a7 [origin/patch-01] 업데이트 상세내용
  patch-02 11b13dd [origin/patch-02] Update brach
  patch-04 fbb9c4e [origin/patch-04] Merge branch 'patch-01' into 'master'
* patch03  525803a [origin/patch-03: ahead 2] Update branch test phase
```
- Tracking branch 만들기  
  - `git checkout [remote branch name]` : 자동으로 remote branch 와 같은 이름으로 local branch 생성
    - 사실, 위 명령어는 `git checkout --track origin/branchname` 을 생략한 버전임. --track 옵션을 사용하여 로컬 브랜치 이름을 자동으로 생성한 것임. 
    - 사용가능 조건: 
      - (a) 해당 local repository가 해당 이름의 branch를 가진 remote 가 딱 하나 있고 (내 경우엔, 한 repository에 여러 remote 저장소를 사용하지 않도록 해서 상관없음. 1:1 관계로 만들어놓음)
      - (b) 해당 이름이 local에는 없으면 Git은 트래킹 브랜치를 만들어 준다.
  - `git checkout -b [branch] [remotename]/[branch]` : 다른 이름으로 local branch 만들 수 있음.
```
$ git checkout -b sf origin/serverfix
Branch sf set up to track remote branch serverfix from origin.
Switched to a new branch 'sf'
```
- 이미 로컬에 존재하는 브랜치가 리모트의 특정 브랜치를 추적 : `-u`(`--set-upstream-to` 짧은 표현) 옵션 사용
  - 지금 속한 brach 가 origin/serverfix 를 tracking하도록 설정
```
$ git branch -u origin/serverfix
Branch serverfix set up to track remote branch serverfix from origin.
```

#### set multiple remote repository
- [Pro Git - 3.2 Git 브랜치 - 브랜치와 Merge 의 기초](https://git-scm.com/book/ko/v2/Git-%EB%B8%8C%EB%9E%9C%EC%B9%98-%EB%B8%8C%EB%9E%9C%EC%B9%98%EC%99%80-Merge-%EC%9D%98-%EA%B8%B0%EC%B4%88)
- 팀 작업시, 팀 repository을 fork해서 개인 repository 에서 작업 후, Pull Request(a.k.a. PR / gitlab : Merge Request(a.k.a. MR))함. 
- PR 전, 그동안 다른 사람들이 팀 repository에 작업한 commit내용을 반영해야함
  - branch pointer가 fast-forward하므로(최신 버전의 팀 repository의 commit history를 가지고 있음), PR의 commit 내용이 팀 repository의 최신 commit에 새로운 commit(PR)을 추가한다. 팀 repository에 commit history의 분기없이(3-way merge), (다른 작업자가 같은 파일을 작업했을때 발생하는)Merge conflict없이 깔끔하게 Merge된다. 해당 작업을 하지 않음 
- 팀 repository를 반영하기 위해(pull) remote 를 새로 지정함
  - `git remote add upstream 팀_repository_url`
  - >>> fatal: remote upstream already exists. 같은 메시지가 출력될 경우, 다시 upstream 지정
    - `git remote set-url upstream 팀_repository_url`
  - 해당 과정 거친 후, `git remote -v` 또는 `git remote show upstream` 으로 확인

#### Syncing a fork
- [help_github - Syncing a fork](https://help.github.com/articles/syncing-a-fork/)
- Syncing a fork
```
git fetch upstream
git checkout master
git merge upstream/master
```
- Before creating new branch : fetched the latest master version of the upstream
```
git pull upstream master --ff-only
```
- Before PR(MR) 전
``` 
git fetch upstream
git merge upstream/master
```

#### Merge / Rebase 
##### [상황] 
- Merge와 rebase를 각각 어떤 경우에 사용해야하는지 헷갈려서 정리함. 
- [Git: Rebase는 언제 어떻게 해야 할까?](http://dogfeet.github.io/articles/2012/git-merge-rebase.html)
- [Pro Git(v1) - .6 Git 브랜치 - Rebase하기](https://git-scm.com/book/ko/v1/Git-%EB%B8%8C%EB%9E%9C%EC%B9%98-Rebase%ED%95%98%EA%B8%B0)

### push pull fetch
#### fetch 
- `git fetch [remote]` : remote branch 정보 update


```
$ git push
fatal: The current branch patch-02 has no upstream branch.
To push the current branch and set the remote as upstream, use

    git push --set-upstream origin patch-02
```



### svn to gitlab
- [GitLab Documentation - Migrating from SVN to GitLab](https://docs.gitlab.com/ce/user/project/import/svn.html)
- svn 과 gitlab 모두 bidirectional 하게 설치.

1. Install subgit
- 


