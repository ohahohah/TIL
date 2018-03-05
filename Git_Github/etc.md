## Keyword
`gitignore`

## Reference
- [gitignore - Create gitignore file](https://www.gitignore.io)
- [Github Help- Ignoring files](https://help.github.com/articles/ignoring-files/)

## 상황 / 궁금

## 정리
- repository에서 불필요한 파일,폴더 무시 : .gitignore (local) or .gitignore_global(global) / [Github Help- Ignoring files](https://help.github.com/articles/ignoring-files/)
  - [gitignore](https://www.gitignore.io) 에서 제외할 환경검색.
    - [gitignore.io - command line](https://www.gitignore.io/docs) 사용하면 편리함.
  - 최상위디렉토리에서 .gitignore 생성 (echo 또는 `touch`(windows경우) 로 파일 생성)  
- GitLab API 사용 https://docs.gitlab.com/ee/api/ 
  - 회사 gitlab website 상에서 issue label 생성만 되고 편집, 삭제가 되지 않음. API 를 사용해 편집, 삭제 하려고 했으나  회사 server에서는 GET 만 허용하므로 조회만 가능
    - curl 사용시 `-v` 옵션 추가하여 상세 상태 알 수 있음. 
      - 회사 gitlab API 실행 결과

      ```
      (...)
      < Status: 405 Method Not Allowed
      < Allow: OPTIONS, GET, HEAD
      (...)
      ```
  
  - 현재 Gitlab에 따라 사용할 수 있는 API version이 다름 / 현재 회사 [Gitlab API v3](https://gitlab.com/gitlab-org/gitlab-ce/blob/8-16-stable/doc/api/README.md)
  - API 사용시, 사용자의 private token 과 project id 사용함. 
    - Profile - Account settings - Private token 확인가능: [personal-access-tokens](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html) 
    - project id 조회 : `curl -XGET --header "PRIVATE-TOKEN: XXXX" "https://gitlab.com/api/v3/projects/owned"`  - [where do I find the project id for the gitlab api?](https://stackoverflow.com/questions/39559689/where-do-i-find-the-project-id-for-the-gitlab-api)
