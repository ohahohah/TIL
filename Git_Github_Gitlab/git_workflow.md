## Keyword
`gitlab` `gitlab workflow`

## Reference
- [gitlab doc](https://docs.gitlab.com/)

## 상황 / 궁금증
- 20180323 : 모여서 이야기하다가 새로운 프로젝트를 질렀다. 포트폴리오를 핑계로 하고 싶었던 기술스택을 적용해보는 프로젝트! 둘이 나란히 앉아서 벚꽃엔딩 들으면서 workflow를 세팅했다. 같이 하는 사람이 있어서 행복하다.
- 20180314 : 회사 프로젝트를 gitlab으로 옮기면서 만들었던 workflow를 정리
  - 기본 협업환경(현재 코딩컨벤션 없음, 테스팅 환경없음, 테스트코드 부재)과 CI/CD를 위한 환경세팅(현재 수동으로 서버에 파일 복사-붙여넣기로 배포)하는 방식을 벗어나 모던한 개발환경 구축하고 싶음.
  - 사내에서 CI / CD 에 대한 도움을 받을 수 없는 상황(의지없음, 개념이해없음 등의 이유로)이므로, 관련 시스템을 혼자 구축할때 위험성, 우선순위, 들이는 시간 대비 충분히 효과가 있는지 고민해봐야함.
  - maven 빌드스크립트부터 시작하는게 낫지 않을까?

## 정리
### 요구사항
- 메뉴얼 작성 : 기존 svn프로젝트에서 gitlab으로 옮기는 것이므로, 초심자도 접근할 수 있도록 git 및 gitlab-flow 이해할 수 있는 메뉴얼 필요
- 업무관련툴을 위한 slack, trello, CI 
- 테스팅 환경 구축

### 업무관련툴 세팅
#### 요구사항 
- gitlab issue,merge,commit notify -> slack 알림
- 

#### 구현
- slack (프로젝트별로 생성된 slack channel 사용)
  - 추가 채널이 필요할 경우 '프로젝트명_채널목적' 으로 채널 생성(e.g. #000프로젝트_이슈관리) 
  - Incomming webhook 을 사용하여, slack에 gitlab notify를 세팅함
    - 사내 gitlab 버전에 맞는 doc을 참고하여, setting
    - webhook url 의 맨 마지막에 붙는 문자열이 token이 됨
- trello
  - gitlab API를 사용한 인증사용. API version4만 가능 - [GitLab doc - Trello Power-Up](https://docs.gitlab.com/ce/integration/trello_power_up.html)
    - Gitlab 버전에 따라 사용할 수 있는 API version이 다름 / 현재 회사 [Gitlab API v3](https://gitlab.com/gitlab-org/gitlab-ce/blob/8-16-stable/doc/api/README.md)
  - API 사용시, 사용자의 private token 과 project id 사용함. 
  - Profile - Account settings - Private token 확인가능: [personal-access-tokens](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html) 
- zapier 사용해 자동 세팅 불가
  - 특정 IP에서만 접근할 수 있으므로,gitlab url을 통한 사용자인증이 불가함. 현재 gitlab service에서는 zapier 지원하지 않음. 