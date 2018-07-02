## Keyword
`commit template`

## Project 관리
### Git 기본 이해
  -[Pro git v.2 한글판](https://git-scm.com/book/ko/v2)

### Workflow
- Gitlab-flow (Github-flow with Pre-production and Production) 사용
  - [GitLab Flow - official document](https://about.gitlab.com/2014/09/29/gitlab-flow/)
    - [한글 번역(일부)](https://ujuc.github.io/2015/12/16/git-flow-github-flow-gitlab-flow/)
  - issue 발행 후, assgine한 사항에 대해 개발 진행.
  - Branch 흐름은 feature -> master -> Pre-production -> Production 임.
  - Pre-production 개발계 테스트 진행
  - 운영계 배포는 Production branch 코드 사용
  - merge 시, rebase 하여 불필요한 merge log가 남지 않도록 함.

### 프로젝트 관리
- 리포지토리를 관리하는 정원사 역할이 필요
- 프로젝트 관리를 위해 템플릿 설정을 통해 관리
  - opensource 프로젝트의 리포지토리 관리를 참고
- issue template
  - issue type 에 따른 template 설정
  - issue 작성 등과 관련된 체크리스트를 적어서 작성자가 해당 사항을 다시 검토하도록 유도하는 것이 좋음 
    - 예. - [ ] issue 제목은 약속한 형식을 따랐는가?
- PR template 
  - PR 관련된 체크사항을 함께 기술
    - test 여부,... 
  - **PR만 보고도 어떤 작업내용인지 파악할 수 있어야함**
- Assignees , Reviewer, Labels 을 프로젝트 성격에 맞게 커스텀하여 사용
  -  organization 프로젝트의 경우 Team설정을 이용하면 편함 

#### Branch 명
- feature branch 명명시, 최대한 atomic하게 작성.

### Documentation 을 통한 communication
- 프로젝트 설계의도 전달과 향후 유지보수를 위한 내용을 기술. **다음 개발자를 위해** 인수인계가 가능한 수준으로 작성. 
- 주석 내 commnet : JavaDoc 생성을 위한 comment 양식 및 tag 준수
  - [How to Write Doc Comments for the Javadoc Tool](http://www.oracle.com/technetwork/java/javase/documentation/index-137868.html)
- Gitlab내 wiki 사용
  - 기능 및 프로젝트 세팅 개발자 메뉴얼 수준으로 기록
  - 페이지 추가 변경시, home에 목차 변경
    - 참고 : gollum TOC 자동 생성 플러그인 
  - 기능 및 프로젝트 세팅 변경 시, 수정. 주기적으로 업데이트 필요.

### Commit 
- feature branch 개발시 atomic 단위로 commit
- master branch merge시, squash commit 사용해 기능 및 이슈단위로 작성
- 필요에 따라 commit template 작성함. [git-scm - commit.template](https://git-scm.com/book/ko/v1/Git%EB%A7%9E%EC%B6%A4-Git-%EC%84%A4%EC%A0%95%ED%95%98%EA%B8%B0)

#### log
- 한글로, tracking을 위해 issue number 포함
- 형식 
```
[issue 번호 또는 commit 분류코드] : 메시지 제목
- 커밋 내용
- 커밋 내용
```
- master branch에 merge시, squash commit(issue사항 중심으로 정리)하여 commit log 관리
- issue 해결시, keyword 사용해 [Automatic issue closing](https://docs.gitlab.com/ee/user/project/issues/automatic_issue_closing.html)

#### commit 분류코드
> - ENH: Enhancement, new functionality  - BUG: Bug fix  - DOC: Additions/updates to documentation  - TST: Additions/updates to tests  - BLD: Updates to the build process/scripts  - PERF: Performance improvement  - CLN: Code cleanup
From [pandas-docs : Committing your code](http://pandas.pydata.org/pandas-docs/stable/contributing.html#committing-your-code)

#### Reference
- [Git을 이용하여 텔레파시 통하는 팀 만들기 : commit message와 commit log](http://story.haezoom.com/?p=936)
- [좋은 git 커밋 메시지를 작성하기 위한 7가지 약속](http://meetup.toast.com/posts/106)
