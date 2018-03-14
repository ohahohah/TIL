## 정리
- 파일 삭제
- User 권한 주기 / 권한 확인
  - [stackoverflow - Undeletable file in cygwin](https://stackoverflow.com/questions/3739477/undeletable-file-in-cygwin)
    - Open a cmd windows (run as Administrator)
```
	takeown /r /f DRIVE:\PATH
	icacls DRIVE:\PATH /grant USERNAME:F /T
```

- [Windows Modules Installer Worker - high CPU usage](https://answers.microsoft.com/en-us/windows/forum/windows8_1-performance/windows-modules-installer-worker-high-cpu-usage/bf3dc73e-0b05-4935-920c-22409323f258)
  > In Windows 8 or 8.1 laptop, sometimes CPU fan run very fast and make noise
  because Windows Module Installer Worker occupies CPU more than 50%.
  In this case, you can solve the problem by changing windows update into manual mode.