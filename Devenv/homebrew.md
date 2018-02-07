## Keyword
`homebrew` `mac package`

## Reference
- [공식 Homebrew - The missing package manager for macOS](https://brew.sh/)
- [개발자를 위한 맥(Mac) 정보 – 패키지관리자 Homebrew](http://www.popit.kr/%EA%B0%9C%EB%B0%9C%EC%9E%90%EB%A5%BC-%EC%9C%84%ED%95%9C-%EB%A7%A5mac-%EC%A0%95%EB%B3%B4-%ED%8C%A8%ED%82%A4%EC%A7%80%EA%B4%80%EB%A6%AC%EC%9E%90-homebrew/)

## 정리
- [Starting and Stopping Background Services with Homebrew](https://robots.thoughtbot.com/starting-and-stopping-background-services-with-homebrew)

### 에러
- [문제] mac High Sierra 업데이트 후, brew link 정상적으로 처리 안됨 
  > Could not symlink sbin/설치한패키지명  /usr/local/sbin is not writable.
- [해결] https://github.com/Homebrew/homebrew-php/issues/4527
  > So to solve the problem, simply create the directory with `sudo mkdir /usr/local/sbin` and then set the correct ownership on it with ```sudo chown -R `whoami`:admin /usr/local/sbin```