## Keyword
`git` `git config`

## Reference
- [git 에서 https repository 연결시 SSL 인증서 오류 해결법](https://www.lesstif.com/pages/viewpage.action?pageId=14090808)

## 상황/궁금증
- 회사프로젝트 gitlab설정하면서, git global config 를 회사계정정보로 설정했더니, 하위 폴더의 개인repository 설정도 회사계정으로 덮어써짐.
- git ssl로 repository 가져오거나 GitlabAPI 사용시, `curl: (60) SSL certificate problem: unable to get local issuer certificate` 출력

## 정리
- [git-scm : 시작하기 - Git 최초 설정](https://git-scm.com/book/ko/v2/%EC%8B%9C%EC%9E%91%ED%95%98%EA%B8%B0-Git-%EC%B5%9C%EC%B4%88-%EC%84%A4%EC%A0%95)
- global 설정 확인 `git config --global --list`
  - [git config global file - remove settings](https://askubuntu.com/questions/206449/git-config-global-file-remove-settings)
- Git httpsrepository 연결시, `curl: (60) SSL certificate problem: unable to get local issuer certificate` 메시지 출력
 - > git 은 https repository 연결시 curl 을 사용하며  curl은 기본적으로 SSL 인증서 검증을 수행
 - [lesstif - curl 에 신뢰하는 인증기관 인증서 추가하기](https://www.lesstif.com/pages/viewpage.action?pageId=15892500) 의 CA 인증서 파일 갱신 해도 안됨.
 - [askubuntu](https://askubuntu.com/questions/702882/curl-60-ssl-certificate-problem-unable-to-get-local-issuer-certificate) 참고해, 직접 gitlab의 crt 추가함.
   - ![Website certification download](Image/CurlSslDown01.png)
   - ![Website certification download](Image/CurlSslDown02.png)
