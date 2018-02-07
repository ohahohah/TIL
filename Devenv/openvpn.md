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
1. `brew install openvpn`
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

#### Using Tunnelblick
- 'Tunnelblick' is free software for OpenVPN on OS X 
- [OpenVPN - To connect to Access Server from a MacOSX client computer](https://openvpn.net/index.php/access-server/docs/admin-guides/183-how-to-connect-to-access-server-from-a-mac.html)
- [Tunnelblick - Document](https://tunnelblick.net/documents.html)
- [Tunnelblick - If OpenVPN is connected to the server but your IP address does not change](https://tunnelblick.net/cConnectedBut.html#if-openvpn-is-connected-to-the-server-but-your-ip-address-does-not-change)
  - 내 경우 .ovpn 수정해도 되지 않아서 [If the IP Address Does Not Change](https://tunnelblick.net/cIpInfo.html)에 나와 있는 Tunnelblick 내 option 사용했다 (ver 3.7.4b 기준)
    - 하지만 서버에는 접속되지만 인터넷에 접속되지 않아서 CLI를 이용한 openvpn 연결로 갈아탐. 
