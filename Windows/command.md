## 정리
- 파일 삭제
- User 권한 주기 / 권한 확인
  - [stackoverflow - Undeletable file in cygwin](https://stackoverflow.com/questions/3739477/undeletable-file-in-cygwin)
    - Open a cmd windows (run as Administrator)
```
	takeown /r /f DRIVE:\PATH
	icacls DRIVE:\PATH /grant USERNAME:F /T
```