## Keyword
`linux command`

## Reference
- https://linuxjourney.com/

## 정리
### 처음 sever setting시 참고
- [ ] 외부접속 network 설정
- [ ] user 설정
  - passwd 재설정 : root : `sudo passwd` / user : `passwd` / change other users : `sudo passwd USERNAME`
- [ ] 외부접속에서 접속시(ssh 사용) : 간편히 접속할 수있도록 ip,port,publickey등  ~/.ssh/config 에 설정 `ssh -p port번호 user이름@ip`
- [ ] Check the version of Ubuntu : `lsb_release -a` or `cat /etc/*release`
- [ ] Check installed package " `apt list --installed`

### 기초 - For newbie - Don't panic!
- https://linuxjourney.com/ (2018/03/09 버전)를 발췌 정리함. 
- 도움말 찾기 : command에 `--help` 붙여서 실행. e.g. `less --help`
- 메뉴얼 찾기 : command 앞에 `man` 붙여서 실행. e.g. `man less`
- option은 여러개 사용가능. e.g. `cp -r -i 원본폴더 목적지폴더`
- 자동완성
  - 화살표 아래,위 키 입력시 이전에 입력했던 command가 자동완성됨.
  - `tab`키 입력하면 path가 자동으로 완성됨. 
    - e.g. exercise/README.md 라는 path를 입력하고 싶을 경우, `ex` 입력 후, `tab`키 입력 -> `exercise` 자동완성 ->  `RE`입력 후, `tab`키 입력 -> `README.md` 자동완성되어 `exercise/README.md` 출력됨.
  - `history` (내가 실행한 명령어보기)를 입력하면, 입력했던 command log 볼 수 있음
  - !! : 최근 실행한 command 실행 
  - ctrl+R(comamnd+R) : 실행한 명령어 검색해서 실행 가능 (history에서 검색함) 
- 기본 탈출 command : ctrl+c(command+c) / 내부 실행시에는 `esc` + `q` (quit)
- `pwd`: print working directory 
- `cd` : change directory
- `ls` : list Directories / `-a` : 숨김파일폴더까지 ls / `-l` : 상세 정보
- `touch` : redirection / 새로운 파일 만들기 `touch newfilename`
- `file README.md` : 파일타입 알려줌. e.g. `README.md: UTF-8 Unicode text, with CRLF line terminators`
- `cat Linux/linux.md Java/inbox.md Refactoring/reference.md` : concatenate. 파일 내용 보기. 여러 파일을 결합해서 출력가능.
- `less README.md` : Text를 페이지로 나누어 출력 (Page Up/Down, 화살표 키로 이동가능). 내부 command는 아래 키워드 확인
  - `h` 도움말 `q` : 보기 종료 / `g` 문서 맨 처음으로 / `G` 문서 맨 마지막으로 / `/keyword` search 'keyword' 
- `clear` : 화면 clear.
- copy (cp)
  - `cp *.jpg /home/pete/Pictures` : (wildcard 사용) 현재 path에서 .jpg 확장자 가진 파일을 /home/pete/Pictures 으로 이동함.
  - `cp -r 원본폴더 목적지폴더` : 폴더 통째 복사됨. option '-r'(recursive)로 디렉토리 내의 파일과 폴더를 재귀적으로 복사하기 때문. 덮어쓰기에 주의
  - `cp -i  /home/pete/Pictures` : option 'i'(interactive)은 대화형 옵션으로, 파일덮어쓰기 전에 물어보는 메시지 출력되어 덮어쓰기 여부를 선택할 수 있음.
- move (mv) : 파일이동, 이름 바꾸기 
  - `mv oldfilename newfilename` : 파일이름을 oldfilename에서 newfilename으로 바꿈. 같은 방식으로 폴더명을 바꿀 수도 있음. 
  - `mv file1 /home/pete/Documents` / `mv file1 file2 /home/pete/Documents` : file2를 /home/pete/Documents 폴더로 이동 / 여러 파일 이동가능.file1, file2 이동
  - `mv -i directory1 directory2` : 폴더 이동 + `i` option(`-i`)으로 덮어쓰기될 경우, 파일덮어쓰기 전에 물어보는 메시지 출력되어 덮어쓰기 여부를 선택할 수 있음.
  - `mv -b oldfile existfile` : backup option(`-b`). 이미 existfile 이라는 이름의 파일이 있다고 가정. oldfile 이름을 existfile로 바꿈. 기존에 존재하던 existfile은 existfile~로 바뀌어 백업됨. 여러 추가옵션이 존재함. 

### 몰랐던 것
- `cp -r 원본폴더 목적지폴더` 폴더 통째 복사 option '-r'