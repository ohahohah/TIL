- [Keyword](#keyword)
- [Reference](#reference)
- [상황 / 궁금](#상황--궁금)
- [정리](#정리)
   - [snap-shot](#snap-shot)
   - [check-summed](#check-summed)
   - [States : committed, modified, and staged](#states--committed-modified-and-staged)
   - [Branch](#branch)
   - [Git Objects](#git-objects)
   - [refs(reference)](#refsreference)
      - [What is refs?](#what-is-refs)
      - [Branch 와 refs?](#branch-와-refs)
      - [HEAD](#head)
      - [Tag](#tag)
      - [Remote Refs](#remote-refs)
      - [참고](#참고)
-------------

## Keyword
`git concept` `git` `git objects` `git refs` `git branch`

## Reference
- [git- docs](https://git-scm.com/docs/) : `git --version`으로 사용하고 있는 version에 맞는 doc 확인
- [pro Git book](https://git-scm.com/book/en/v2) / [pro Git book(한국어)](https://git-scm.com/book/ko/v2)

## 상황 / 궁금
- 지금까지는 당장 사용할 수 있는 command와 특정시나리오(e.g. commit한 내용을 취소하고, 되돌리려면?) 중심으로 찾아서 봤음. 하지만 복잡한 시나리오나 command를 제대로 이해하기엔 git의 기초 개념이 부족한 것 같아 정리를 시작함.
- 용어는 영어기준으로 정리함.

## 정리
### snap-shot
https://git-scm.com/book/ko/v2/%EC%8B%9C%EC%9E%91%ED%95%98%EA%B8%B0-Git-%EA%B8%B0%EC%B4%88 - 차이가 아니라 스냅샷
### check-summed
https://git-scm.com/book/ko/v2/%EC%8B%9C%EC%9E%91%ED%95%98%EA%B8%B0-Git-%EA%B8%B0%EC%B4%88 - git의 무결성
### States : committed, modified, and staged
[!Working tree, staging area, and Git directory](https://git-scm.com/book/en/v2/images/areas.png)
https://git-scm.com/book/ko/v2/%EC%8B%9C%EC%9E%91%ED%95%98%EA%B8%B0-Git-%EA%B8%B0%EC%B4%88 - 세가지 상태
### Branch
- [Pro Git - 3.1 Git Branching - Branches in a Nutshell](https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell) / [Pro Git - 3.1 Git 브랜치 - 브랜치란 무엇인가](https://git-scm.com/book/ko/v2/Git-%EB%B8%8C%EB%9E%9C%EC%B9%98-%EB%B8%8C%EB%9E%9C%EC%B9%98%EB%9E%80-%EB%AC%B4%EC%97%87%EC%9D%B8%EA%B0%80)

### Git Objects
[Pro git - 10.2 Git의 내부 - Git 개체](https://git-scm.com/book/ko/v2/Git%EC%9D%98-%EB%82%B4%EB%B6%80-Git-%EA%B0%9C%EC%B2%B4) / [Pro git - 10.2 Git Internals - Git Objects](https://git-scm.com/book/id/v2/Git-Internals-Git-Objects)

### refs(reference)
- [Pro git ver.1- .3 Git의 내부 - Git 레퍼런스](https://git-scm.com/book/ko/v1/Git%EC%9D%98-%EB%82%B4%EB%B6%80-Git-%EB%A0%88%ED%8D%BC%EB%9F%B0%EC%8A%A4) 와 [Pro git ver.2- 10.3 Git의 내부 - Git Refs](https://git-scm.com/book/ko/v2/Git%EC%9D%98-%EB%82%B4%EB%B6%80-Git-Refs)을 발췌,요약 편집함.

#### What is refs? 
> (commit의) SHA-1 값을 날로 사용하기보다 쉬운 이름으로 된 포인터가 있으면 그걸 사용하는게 더 좋다. 외우기 쉬운 이름으로 된 파일에 SHA-1 값을 저장한다. Git에서는 이런 것을 "레퍼런스" 또는 "refs"라고 부른다. SHA-1 값이 든 파일은 .git/refs 디렉토리에 있다. 
- 확인 : master branch의 최신 commit의 SHA-1 값은 .git/refs/heads/master 에 저장되어있음.
 - `echo "1a410efbd13591db07496601ebc7a059dd55cfe9" > .git/refs/heads/master` 와 같음.
   - 직접 .git/refs/heads/master 를 수정하는 것 보다 안전하게 `update-ref`를 사용하는게 나음.    
   - 위 명령어는 다음의 명령어와 같음. `git update-ref refs/heads/master 1a410efbd13591db07496601ebc7a059dd55cfe9`
   - 그러므로 `git log 1a410e` == `git log master`
 
#### Branch 와 refs?
> branch는 어떤 작업들 중 마지막 작업을 가리키는 포인터 또는 레퍼런스이다. 
- `git branch (branchname)` 을 실행하면 Git은 내부적으로 `update-ref` 명령을 실행한다. 입력받은 branch 이름과 현재 branch의  마지막 커밋의 SHA-1 값을 가져다 `update-ref` 명령을 실행한다.
 - `git branch (branchname)` == `git update-ref refs/heads/current-branch 1a410e(latest commit SHA-1)`
#### HEAD
- 현재 branch 가 무엇인지에 대한 정보는 .git/HEAD 에 저장되어 있음. 
> HEAD 파일은 현 브랜치를 가리키는 간접(symbolic) 레퍼런스다. 간접 레퍼런스이기 때문에 다른 레퍼런스와 다르다. 이 레퍼런스는 다른 레퍼런스를 가리키는 것이라서 SHA-1 값이 없다. 파일을 열어 보면 아래와 같이 생겼다  
  - `git symbolic-ref HEAD` 로 값을 읽음(== `cat .git/HEAD`)
  - 현재 branch가 master라면, .git/HEAD 의 내용은  `ref: refs/heads/master` 임.
  - `git checkout test` 하면(test branch로 변경) .git/HEAD의 내용은 `ref: refs/heads/test` 임.
- HEAD값 변경이 가능함. test로 변경 : `git symbolic-ref HEAD refs/heads/test`
  - 위 command 을 실행하고, `git branch` 로 현재 branch를 확인하면, test branch에 있다고 출력됨. 
#### Tag
- Tag object : 누가(tagger == author),언제(timestamp) tag를 만들었는지, tag message와 어떤 commit을 가리키는지 정보를 포함함
  - .git/refs/tags/v1.1 의 SHA-1을 사용해 tag object 를 확인 (`git cat-file -p` : 저장된 데이터를 불러오는 command. 파일내용 출력(-p))
  ```
  $git cat-file -p a3a5f7944b6a087429353f6b1dc1c15a05c69ffc
  object 4476d5a8e95d6a8189748af8d199822cc17b82d2
  type commit
  tag v1.1
  tagger ohahohah <ohahohah.dev@gmail.com> 1519802958 +0000

  test tag
  ```
    - tag message 는 'test tag' 임
    - 가리키고 있는 commit : 'object 4476d5a8e95d6a8189748af8d199822cc17b82d2'
      - `git cat-file -p`로 commit object 를 확인할 수 있음.
      ```
      git cat-file -p 4476d5a8e95d6a8189748af8d199822cc17b82d2
      tree 6d57a3e005b4446167c54272929e7a53ba5259f3
      parent 28378846add4b86832e355e59ff1dddec84ead69
      author ohahohah <ohahohah.dev@gmail.com> 1519724138 +0000
      committer ohahohah <ohahohah.dev@gmail.com> 1519724138 +0000
      Add branch command,reference / 20180227 TIL
      - Add managing Branch command
      - Add Reference about 'rebase,cherry-pick,merge'
      [ticket: ]
      ```
        - tree 6d57~ : 해당하는 tree object의 SHA-1. UNIX의 directory 같음. [Pro Git - 10.2 Git의 내부 - Git 개체](https://git-scm.com/book/ko/v2/Git%EC%9D%98-%EB%82%B4%EB%B6%80-Git-%EA%B0%9C%EC%B2%B4) 의 'Tree 개체' 참고
        - parent 283788~ : 바로 직전 commit. commit log를 가계도라고 생각하면, 바로 위에 있는 commit이므로 parent 가 됨. 

#### Remote Refs
- push 한 마지막 commtit 의 SHA-1 값을 'refs/remotes'에 저장함.
  - 현재 branch가 tracking 하고 있는 remote branch가 master 라면 '.git/refs/remotes/origin/master' 로 remote 서버에 반영된 최종 commit이 뭔지 확인 할 수 있음.
  ```
  $ cat .git/refs/remotes/origin/master
  ca82a6dff817ec66f44342007202690a93763949
  ```
- 읽기만 가능. checkout(수정)이 불가능한 일종의 북마크임.

#### 참고
- SHA-1의 이해 
  > Git의 무결성  
  Git은 데이터를 저장하기 전에 항상 check-summed을 구하고 그 check-summed으로 데이터를 관리한다. 그래서 check-summed을 이해하는 Git 없이는 어떠한 파일이나 디렉토리도 변경할 수 없다. check-summed은 Git에서 사용하는 가장 기본적인(Atomic) 데이터 단위이자 Git의 기본 철학이다. Git 없이는 check-summed을 다룰 수 없어서 파일의 상태도 알 수 없고 심지어 데이터를 잃어버릴 수도 없다.  
  Git은 SHA-1 해시를 사용하여 check-summed을 만든다. 만든 check-summed은 40자 길이의 16진수 문자열이다. 파일의 내용이나 디렉토리 구조를 이용하여 check-summed을 구한다. SHA-1은 아래처럼 생겼다.  
  `24b9da6552252987aa493b52f8696cd6d3b00373`  
  Git은 모든 것을 해시로 식별하기 때문에 이런 값은 여기저기서 보인다. 실제로 Git은 파일을 이름으로 저장하지 않고 해당 파일의 해시로 저장한다.  
  from [Pro Git - 1.3 시작하기 - Git 기초](https://git-scm.com/book/ko/v2/%EC%8B%9C%EC%9E%91%ED%95%98%EA%B8%B0-Git-%EA%B8%B0%EC%B4%88) - Git의 무결성
  - [wikipedia - SHA-1](https://en.wikipedia.org/wiki/SHA-1)
- Git 에서의 object, pointer
