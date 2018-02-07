## Keyword
`homebrew` `mac package`

## Reference

## 정리

### 에러
- [문제] mac High Sierra 업데이트 후, brew link 정상적으로 처리 안됨 
  > Could not symlink sbin/설치한패키지명  /usr/local/sbin is not writable.
- [해결] https://github.com/Homebrew/homebrew-php/issues/4527
  > So to solve the problem, simply create the directory with `sudo mkdir /usr/local/sbin` and then set the correct ownership on it with ```sudo chown -R `whoami`:admin /usr/local/sbin```