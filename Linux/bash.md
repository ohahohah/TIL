## memo
- 따로 빼두기 애매해서 linux 안에 같이 적음
- command 에 대한 내용도 여기에 적음

## Reference
- [BASH 커맨드라인 단축키 by devh SEP 28, 2018](http://www.devh.kr/2018/Command-Line-Shortcuts/)
- 정의 
  - [Unix shell](https://en.wikipedia.org/wiki/Unix_shell)
  - [Bash_(Unix_shell)](https://en.wikipedia.org/wiki/Bash_(Unix_shell))
  - [What is "the Shell"? - linuxcommand.org](https://linuxcommand.org/lc3_lts0010.php)
- [Linux Bible by Christopher Negus, Christine Bresnahan](https://www.goodreads.com/book/show/13838572-linux-bible)
- [The Linux Command Line by William Shotts](http://linuxcommand.org/tlcl.php) / [한글 번역서 - 리눅스 커맨드라인 완벽 입문서.비제이퍼블릭(이종우 , 정영신 옮김).2013](http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788994774299)
- Resources in udacity shell workshop
  - [Bash Guide for Beginners by Machtelt Garrels. 2008](https://tldp.org/LDP/Bash-Beginners-Guide/html/)
  - [BASH Programming - Introduction HOW-TO by Mike G mikkey at dynamo.com.ar. 2000](https://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO.html)


## What is Bash,shell and terminal
- Shell
  - 사용자가 입력한 command 를 OS 에 전달해 실행시키게 하는 프로그램
    - shell scripts, commands and programs 실행 위한 enviorment. 
  - 조개 껍데기처럼 OS 의 가장 바깥 layer (껍데기) 임.
  - underlying kernel 의 direct interface 라기 보다 kernal API 를 사용하는 special application 
  - 특히 unix shell 을 줄여서 shell 이라고 부르는 경우가 많음.
    - unix sytem 을 제어하기 위한 interface 를 제공
- bash 
  - unix shell  의 한 종류 또는 명령 언어. 대부분 `/bin/sh` 로 설치됨. 개발자인 Stephen Bourne 이름을 따서 Bourne shell 이라고 함. 
    - 현재 zsh 사용 중(mac OS Catallina 이후 기본 shell). 
- .bashrc .bash_profile
- shell command 는 어디서 찾는 것일까?
  - $PATH 에서. 왼쪽 -> 오른쪽으로 검색되므로 중복된 command 가 있으면 왼쪽에 있는 것이 실행됨
    - path 에 환경변수 추가해줄 때 `specific_program/bin/:$PATH` 로 해주는 이유가 기본 command 보다 우선하게 하기 위해서
  - PATH 에 등록되어있지 않을 때는 `locate command_to_find` 를 실행시키면 해당 command 를 찾아줌

- Terminal : shell 을 사용하기 위한 interface. 즉, shell 과 직접 작업할 수 있게하는 program.

## command line shortcut
- [The Best Keyboard Shortcuts for Bash (aka the Linux and macOS Terminal). LOWELL HEDDINGS. MARCH 17, 2017, 6:40AM EDT](https://www.howtogeek.com/howto/ubuntu/keyboard-shortcuts-for-bash-command-shell-for-ubuntu-debian-suse-redhat-linux-etc/)

## Did you know?
- shell command 는 왜 줄임말을 쓸까?(예. copy => cp)
  - unix system이 computer 와 terminal connection 이 느린 때에 만들어졌기 때문에 글자를 줄여서 빨리 사용하게 만들었음. C 언어에서처럼.
- 따옴표를 어떻게 쓰라고요?
  - curly quotes (둥글게 생긴 따옴표) 는 shell 에서 동작하지 않음. 복사 붙여넣기 를 해올 때 주의하세요. terminal 에서 직접 입력하면 제대로 따옴표가 작성됩니다.
  - 작은 따옴표와 큰 따옴표 둘 중에 헷갈릴 땐 일단 작은 따옴표 ''를 사용하세요.
  - 특수문자 & 가 섞여있을 때 다른 식으로 동작할 수 있어요. url 은 항상 따옴표로 묶읍시다.
- Unix system 에서 terminal 을 왜 tty 라고 할까?
  - TeleTYpewriter 전신타자기 약자. tty가 초기 컴퓨터에서 컴퓨터 input을 주고(Punched tape로) output을 출력하면서 CLI 역할을 했음. 그 흔적이 남아서 tty라고 부름.

## Questions
- What is difference between them?
  - `curl -L -o dictionary.txt https://google.com` vs `curl -L https://google.com >> dictionary.txt`

## Remind ME
- less : less of file. better than cat(concaternate) for long text [man less](https://man7.org/linux/man-pages/man1/less.1.html) / [less command summary by linuxize](https://linuxize.com/post/less-command-in-linux/)
  - [number] + space : forward N line or page down
  - Enter : forward line 
  - G : 맨 마지막으로 이동
    - 1G or g : 맨 처음으로 이동
  - [number] + B : Move Up N line or page 
  - / : search 
    - n : 다음 검색결과 보기
- `echo $COLUMNS x $LINES`
- `curl -L -o dictionary.txt https://tinyurl.com/zeyq9vc` : curl - to transfer data
- `grep shell dictionary.txt | less` : global regular expression print. line by line print
- `curl -L https://tinyurl.com/zeyq9vc | grep fish | wc -l` , `curl -L https://tinyurl.com/zeyq9vc | grep -c fish`
- `cp -u *.html /somedir`
- `$PS1` : "Prompt String 1"
  - default : [user@host last_path_elem]$ like `ubuntu@ip-172-34-56-36`
  - can customize in .bashrc like `~/work/TIL/cs master*`


## Cheatsheet
### Moving the Cursor
- Ctrl+A : beginning of the line
- Ctrl+E : end of the line.
- Alt+F: Word Forward
- Alt+B: Word Backward
- Ctrl+F: Character Forward
- Ctrl+B: Character Backward
- Ctrl+XX: Move between the beginning of the line and the current position of the cursor. 

## Editing Text
- Ctrl+D : Delete current
- Alt+D: Delete characters after the cursor

- Alt+T: Transpose word
- Ctrl+T: Transpose Chracters
- Ctrl+_: Undo last key press. can repeat multiple times.
- Alt+U: Upper case Word
- Alt+L: Lower case Word
- Alt+C: Capitalize the character under the cursor

- Ctrl+W: Cut privious word
- Ctrl+K: Cut the line after the cursor
- Ctrl+U: Cut the line before the cursor
- Ctrl+Y: Paste recent text
- Alt+Y: Paste earlier text

