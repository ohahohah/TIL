---
search:
    keywords: ['git log', 'git commit', 'git']
---
## Reference

## 상황/궁금증

## 정리
- git commit 후 바로 push 하지말자. 한 번 더 commit 내용 확인하고 올리자. 깔끔하게 되돌려지지 않는다
- commit 은 나중에 내용 보기 편하도록 atomic하게 작성
  - 단, 프로젝트 성격에 따라, squash commit 을 적극 활용하자. (open source PR,...)
  - 기능구현시, 여러 commit으로 나뉠 경우, 앞에 [기능명 또는 issue 내용]을 붙여서 tracking 하기 편하게 한다.
- [how-can-i-reference-a-commit-in-an-issue-comment-on-github](https://stackoverflow.com/questions/8910271/how-can-i-reference-a-commit-in-an-issue-comment-on-github) : To reference a commit, simply write its SHA-hash, and it'll automatically get turned into a link.
