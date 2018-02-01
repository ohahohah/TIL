## Keyword
`cygwin cron` `crontab`

## Reference

## 상황/ 궁금증

## 정리
- Basic
  - [서버에서 자동 실행을 가능케 해주는 crontab(크론탭) 설정 방법](https://happist.com/553442/%EC%84%9C%EB%B2%84%EC%97%90%EC%84%9C-%EC%9E%90%EB%8F%99-%EC%8B%A4%ED%96%89%EC%9D%84-%EA%B0%80%EB%8A%A5%EC%BC%80-%ED%95%B4%EC%A3%BC%EB%8A%94-crontab%ED%81%AC%EB%A1%A0%ED%83%AD-%EC%84%A4%EC%A0%95/)
    - 되도록 `crontab -e` 를 사용해 등록
    - [리눅스 작업 스케줄러 Crontab(크론탭) 적용 및 오류 해결 방법](https://itrend.site/157/%EB%A6%AC%EB%88%85%EC%8A%A4-%EC%9E%91%EC%97%85-crontab%ED%81%AC%EB%A1%A0%ED%83%AD-%EC%A0%81%EC%9A%A9%EC%8A%A4%EC%BC%80%EC%A4%84%EB%9F%AC-%EB%B0%8F-%EC%98%A4%EB%A5%98-%ED%95%B4%EA%B2%B0-%EB%B0%A9/)
  - [웹서버 자동 실행 crontab(크론탭) 적용 시 문제점과 해결 방안](https://happist.com/558036/%EC%9B%B9%EC%84%9C%EB%B2%84-%EC%9E%90%EB%8F%99-%EC%8B%A4%ED%96%89-crontab%ED%81%AC%EB%A1%A0%ED%83%AD-%EC%A0%81%EC%9A%A9-%EC%8B%9C-%EB%AC%B8%EC%A0%9C%EC%A0%90%EA%B3%BC-%ED%95%B4%EA%B2%B0-%EB%B0%A9/)
- [lesstif - cron](https://www.lesstif.com/display/1STB/cron)
  > cron 은 보안 이슈때문에 사용자의 쉘 초기화 파일(.bashrc, .bash_profile)을 읽지 않는다. 그러므로 실행할 프로그램이 /usr/bin이나 /bin 같이 일반적인 경로에 있지 않는다면 초기화 파일에 PATH 나 LD_LIBRARY_PATH 등 개인적인 환경변수를 지정했어도 cron 이 실행할 수가 없다. 이런 개인적인 설정이 있다면 해당 내용을 cron 이 실행할 쉘 스크립트에도 똑같이 지정해 주어야 한다. 
- cygwin crontab 사용 
  - cygwin 'cron' plugin 설치
  - [How do you run a crontab in Cygwin on Windows?](https://stackoverflow.com/questions/707184/how-do-you-run-a-crontab-in-cygwin-on-windows)

