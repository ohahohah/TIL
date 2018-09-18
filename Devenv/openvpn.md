## Keyword
`openvpn`

## Reference
- [openvpn - howto :+1:](https://openvpn.net/index.php/open-source/documentation/howto.html#redirect)
- [Mac openVPN 서버 설치](http://blog.iolate.kr/166)

## 정리
- ip 확인 : https://tunnelblick.net/ipinfo

### Installation & Execution for mac
#### Using `brew` 
- 설치 후 기본 path: /usr/local/etc/openvpn
0. 사전작업
- zsh 를 쓰는 경우, path 가 제대로 잡혀있는지 미리 확인하자
  - ~/.zshrc 에 `export PATH="/usr/local/sbin:$PATH"` 추가되어있는지 확인
  - 참고. `brew doctor` 명령어를 입력하면 예상되는 문제해결 방법을 알려줌
  - [stackoverflow - brew installation for zsh?](https://stackoverflow.com/questions/7117184/brew-installation-for-zsh)
- 위 작업이 안되면 `zsh: command not found: openvpn` 이런식으로 제대로 실행하기가 어려운 경우가 생김

1. `brew install openvpn`
  - 2018/09/18 현재 아래 문제 해결됨
  - [문제] mac os High Sierra 이상 버전 사용시, brew link 정상적으로 처리 안됨
  > Could not symlink sbin/설치한패키지명  /usr/local/sbin is not writable.
  - [해결] https://github.com/Homebrew/homebrew-php/issues/4527
  > So to solve the problem, simply create the directory with `sudo mkdir /usr/local/sbin` and then set the correct ownership on it with ```sudo chown -R. `whoami`:admin /usr/local/sbin```
  
2. Install tuntap
 - http://tuntaposx.sourceforge.net/
 > The TunTap project provides kernel extensions for Mac OS X that allow creation of virtual network interfaces.  http://tuntaposx.sourceforge.net  Because these are kernel extensions, there is no Homebrew formula for tuntap.
 From https://gist.github.com/btbytes/2855991

3. path 등록. 
  - [Installed openvpn with brew but it doesn't appear to be installed correctly](https://apple.stackexchange.com/questions/203115/installed-openvpn-with-brew-but-it-doesnt-appear-to-be-installed-correctly)

4. root 권한 설정
```
sudo cp -vf /usr/local/Cellar/openvpn/다운받은버전번호(like2.2.4)/homebrew.mxcl.openvpn.plist /Library/LaunchDaemons/
sudo chown -v root:wheel /Library/LaunchDaemons/homebrew.mxcl.openvpn.plist
```    

4-2. root권한 설정해주지 않았을때 실행
- `sudo` 로 실행하면 됨 : `sudo openvpn ovpn파일패스/파일명.ovpn`
- 그렇지 않을 경우 아래와 같은 메시지 출력될 수 있음
```
Tue Sep 18 14:07:41 2018 Opening utun (connect(AF_SYS_CONTROL)): Operation not permitted (errno=1)
Tue Sep 18 14:07:41 2018 Failed to open utun device. Falling back to /dev/tun device
Tue Sep 18 14:07:41 2018 Cannot allocate TUN/TAP dev dynamically
```
- 참고. [Using OpenVPN from Mac OSX Terminal, cannot load Tun/Tap
](https://superuser.com/questions/561816/using-openvpn-from-mac-osx-terminal-cannot-load-tun-tap)

5. (optional)service starts at login
- launchctl 설정 또는
- [Starting and Stopping Background Services with Homebrew](https://robots.thoughtbot.com/starting-and-stopping-background-services-with-homebrew) 참고해 brew services 로 실행
  - launchctl plist 설정을 통한 autoload : [how-to-auto-load-mysql-on-startup-on-os-x-yosemite-el-capitan](https://stackoverflow.com/questions/26476391/how-to-auto-load-mysql-on-startup-on-os-x-yosemite-el-capitan)

6. command line 으로 vpn 실행
- autoload 실행시 불필요
```
cd /usr/local/etc/openvpn/  
sudo /usr/local/opt/openvpn/sbin/openvpn --config /usr/local/etc/openvpn/[설정파일].conf
```

#### 그 외 에러
- vpn사용해서 특정 사이트에 접속할 경우, 브라우저를 바꿔서 확인해보자. 회사 gitlab의 경우 chrome 에서는 정상 접속되나 safari 브라우저에서는 'safari can't connect to ther server'라는 메시지를 출력함. 이유는 왜일까?

##### ovpn 은 제대로 불러오는데 그 외에 ca ~.crt 등의 다른 설정을 불러오지 못할 경우
- ovpn 파일을 편집해서 crt , key 에 절대경로를 적어줌. 일반적으로 같은 폴더에 있을 경우 자동으로 불러오지만 드물게 이런 경우가 생김
  - ovpn파일 내의 `ca ca.crt` 를 `ca /실제 파일이 위치한 절대경로/ca.crt` 로 변경

##### 다른 vpn 제대로 삭제하지 않고 설치했을 경우
- openvpn 홈페이지에서 tar.gz 파일을 직접 다운로드해서 make install 한 후 완전 삭제하지 않고 brew 로 openvpn 설치했을 경우 아래와 같은 메시지가 출력됨
- 기존 파일에 symlink 되어있기때문에 충돌이 생김. 아래 안내에 따라 `brew link 원하는 옵션 openvpn` 해주면 됨

```
Error: The `brew link` step did not complete successfully
The formula built, but is not symlinked into /usr/local
Could not symlink include/openvpn-msg.h
Target /usr/local/include/openvpn-msg.h
already exists. You may want to remove it:
  rm '/usr/local/include/openvpn-msg.h'

To force the link and overwrite all conflicting files:
  brew link --overwrite openvpn

To list all files that would be deleted:
  brew link --overwrite --dry-run openvpn

Possible conflicting files are:
/usr/local/include/openvpn-msg.h
/usr/local/include/openvpn-plugin.h
==> Caveats
To have launchd start openvpn now and restart at startup:
  sudo brew services start openvpn
==> Summary
🍺  /usr/local/Cellar/openvpn/2.4.6: 83 files, 1.4MB

/usr/local/Cellar 32s
❯ brew link --overwrite openvpn
Linking /usr/local/Cellar/openvpn/2.4.6... 6 symlinks created
```

#### Using Tunnelblick
- 'Tunnelblick' is free software for OpenVPN on OS X 
- [OpenVPN - To connect to Access Server from a MacOSX client computer](https://openvpn.net/index.php/access-server/docs/admin-guides/183-how-to-connect-to-access-server-from-a-mac.html)
- [Tunnelblick - Document](https://tunnelblick.net/documents.html)
- [Tunnelblick - If OpenVPN is connected to the server but your IP address does not change](https://tunnelblick.net/cConnectedBut.html#if-openvpn-is-connected-to-the-server-but-your-ip-address-does-not-change)
  - 내 경우 .ovpn 수정해도 되지 않아서 [If the IP Address Does Not Change](https://tunnelblick.net/cIpInfo.html)에 나와 있는 Tunnelblick 내 option 사용했다 (ver 3.7.4b 기준)
    - 하지만 서버에는 접속되지만 인터넷에 접속되지 않아서 CLI를 이용한 openvpn 연결로 갈아탐. 
