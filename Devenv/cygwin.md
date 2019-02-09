<!--ts-->
<!--te-->

## Keyword
`cygwin` `windows as linux`

## Reference

## 상황/ 궁금증
- command key 를 windows용으로 또 익히기 귀찮아서 linux 환경처럼 사용할 수 있는 cygwin설치
- git SSH 사용해서 local pc와 server 연결해놓을 경우, 가상path 문제(로 짐작됨) 때문에 push가 안됨
- [삽질중] SSH 제대로 읽어오기 위해 
  - cygwin 기본 path windows와 같게 설정해보기
    - 같게 설정하면 한글이 와장창 다 깨진다
      - 인터넷에 나와있는 설정들은 왜 다 다르게 설명하지... 뭐가 맞는 건지 몰라서 이것저것 설정하다가
      - 설정이 엉망이 되어서 밀어버림


## 정리
### Installation
- 첫 install 후에도 setup~.exe (windows version에 따라 파일명 다름) 사용해 추가 plugin, package 설치 
  - download 에러시에도 재시동해서 사용. pending tab에서 error난 package 들이 보임. 
  - retry시에도 package download때문에 에러가 날 경우, 다른 mirror 에서 시도.
- 환경변수 setting 
  - [The CYGWIN environment variable](https://cygwin.com/cygwin-ug-net/using-cygwinenv.html)
- ssh 사용 (cygwin 관리자모드로 실행해야함)
  - [ssh config under cygwin](https://superuser.com/questions/493270/ssh-config-under-cygwin)
  - [Oracle - Installing Cygwin and Starting the SSH Daemon](https://docs.oracle.com/cd/E63000_01/EMBSC/preinstall_req_cygwin_ssh.htm#EMBSC150)
  - [install_cygwin_sshd.txt](https://gist.github.com/roxlu/5038729)
- 주요 설치 plugin : gcc,g+, wget, patch, ruby,ruby-devel,rubygem, openssh, cron, vim, nano, tar, unzip
- 설정파일 변경시, terminal종료 후 재시작(Run as Administrator) / 재부팅해야하는 경우도 있음!
- package 설치시에 ~-devel 이 있음. 다른 package 관리하면서 compile해야할 경우가 많기때문에, 해당 package를 설치했더라도 오류가 나는 경우, devel package 핑요여부를 한번 더 체크해주는게 나음 [stackoverflow - what-are-devel-packages](https://stackoverflow.com/questions/2358801/what-are-devel-packages)


#### Gem setting 
- gem (RubyGem, 루비 표준화 패키징 및 설치 프레임워크 / Ruby Application 또는 lib 설치, packaging 관리) 사용하기 위한 setting 
  - ruby와 RVM 설치하여 gem 사용.
  - [what-is-a-gem](http://ruby-korea.github.io/rubygems-guides/what-is-a-gem/)
  - [rubygems-basics - installing-gems](http://ruby-korea.github.io/rubygems-guides/rubygems-basics/#installing-gems)
- [setting-up-rvm-with-cygwin](https://vaporsoft.net/setting-up-rvm-with-cygwin/)
  - [rvm-fails-to-install-rubies](https://stackoverflow.com/questions/20479878/rvm-fails-to-install-rubies)
     `rvm autolibs disable` 
  - [gem-install-failed-to-build-gem-native-extension-cant-find-header-files](https://stackoverflow.com/questions/4304438/gem-install-failed-to-build-gem-native-extension-cant-find-header-files/27158307) : ruby-devel 설치
  - open-ssl setting 확인
  - log 확인 후 googling 으로 고침 - 필요한 package가 제대로 설치되어 있지 않아 발생하는 문제가 많음
    - [Error installing charlock_holmes v0.7.5](https://github.com/github/linguist/issues/3878)
```
  $ gem install gollum
Building native extensions.  This could take a while...
ERROR:  Error installing gollum:
        ERROR: Failed to build gem native extension.

    current directory: /cygdrive/c/Users/ohahohah/cygwin/.rvm/gems/ruby-2.4.1/gems/charlock_holmes-0.7.5/ext/charlock_holmes
/cygdrive/c/Users/ohahohah/cygwin/.rvm/rubies/ruby-2.4.1/bin/ruby.exe -r ./siteconf20180205-3616-14j5mhk.rb extconf.rb
checking for -licui18n... no
which: no brew in (/cygdrive/c/Users/ohahohah/cygwin/.rvm/gems/ruby-2.4.1/bin:/cygdrive/c/Users/ohahohah/cygwin/.rvm/gems/ruby-2.4.1@global/bin:/cygdrive/c/Users/ohahohah/cygwin/.rvm/rubies/ruby-2.4.1/bin:/usr/local/bin:/usr/bin:/cygdrive/c/ProgramData/Oracle/Java/javapath:(중략))
checking for -licui18n... no


*********************************************
******* icu required (brew install icu4c or apt-get install libicu-dev) *******
*********************************************
*** extconf.rb failed ***
Could not create Makefile due to some reason, probably lack of necessary
libraries and/or headers.  Check the mkmf.log file for more details.  You may
need configuration options.
(이해 생략)
```
- [Gem install hangs indefinitely](https://stackoverflow.com/questions/15239859/gem-install-hangs-indefinitely) : `gem install -V package_you_install` : -V, -​-[no-]verbose - Set the verbose level of output [rubygems - command reference](http://guides.rubygems.org/command-reference/#gem-install)


#### apt-cyg 설치 (optional)
- apt-cyg : `apt-get` 처럼 cygwin에서 설치할 수 있음
- cygwin 공식 installGUI (setupx86_~.exe)로 설치하는게 원칙이나, 검색해서 없는 패키지의 경우에 사용함.
- [apt-cyg github](https://github.com/transcode-open/apt-cyg)

### home directory 바꾸기
  - [Cygwin Change Home Directory](https://ryanharrison.co.uk/2015/12/01/cygwin-change-home-directory.html) : Use /etc/nsswitch.conf db_home change
    - `bash: alias: ▒뱒how-control-chars▒▒: not found` 발생 : ls 등 linux commad 를 사용하지 못함.
      - ls 입력시 \342\200\231ls 로 입력받았다고 메시지 뜸 [weird problem: changing directories with apostrophes in it](https://arstechnica.com/civis/viewtopic.php?f=19&t=170448) 참고해서 "ls" 로 실행했더니 실행됨. 하지만 "ls -a" 는 실행안됨
      - [Cygwin에서 .bash_profile설정](http://egloos.zum.com/uuzazuk9/v/905921) 에서 힌트를 얻음
      - cygwin 설정대신 windows 의 .bash_profile 설정을 불러와서 에러 발생
      - [진행중]cygwin과  windows 의 .bash_profile 를 동일하게 하면 문제 생길듯하여, ssh 설정을 변경 (~/.ssh 를 불러오게 되어있으므로)
  - [change-cygwin-home-directory 2011 version](http://codeaweso.me/2011/07/change-cygwin-home-directory/) : Use mkpassword / doesn't work - cannot use ls (only can use unix command)
  - [How to get the Windows path to Cygwin home directory?](https://stackoverflow.com/questions/42841907/how-to-get-the-windows-path-to-cygwin-home-directory/42842354) : `cygpath -w ~`

### SSH 설정변경

### Etc
- [How do I change the default startup directory in Cygwin?](https://superuser.com/questions/388397/how-do-i-change-the-default-startup-directory-in-cygwin/388409) : Just add `cd /path/to/directory/you/care/about` to the bottom of your ~/.bashrc file(C:\cygwin\home\%USERNAME%\.bashrc).
- [sudo-command-not-found-on-cygwin](https://stackoverflow.com/questions/22527668/sudo-command-not-found-on-cygwin)
  > Cygwin is not a full Linux distribution. (...) `Run as Administrator.`(...)


### git
- [vim not working when calling git commit within cygwin](https://stackoverflow.com/questions/36742345/vim-not-working-when-calling-git-commit-within-cygwin)
```
git commit
Vim warning: output is not to a terminal
Vim warning: input is not from a terminal
```
- cygwin git commit Using vim `git config core.editor "C:\cygwin64\bin\vim.exe"`
  - `git config core.editor "vim"` doesn't work because I use 'Git for windows' not 'cygwin git'
  - [how-to-set-default-editor-when-using-git-in-cygwin](https://stackoverflow.com/questions/27023402/how-to-set-default-editor-when-using-git-in-cygwin)
    - [How do I make Git use the editor of my choice for commits?](https://stackoverflow.com/questions/2596805/how-do-i-make-git-use-the-editor-of-my-choice-for-commits)
    - [GIT_EDITOR](https://git-scm.com/docs/git-var#_variables)
    - [Git fails to launch Vim in Cygwin](https://superuser.com/questions/638854/git-fails-to-launch-vim-in-cygwin/638907#638907)

### Vim
- [Cygwin Vi 설정](http://haprj.tistory.com/entry/Cygwin-Vi-%EC%84%A4%EC%A0%95)
- [vim 에디터 이쁘게 사용하기 - .vimrc 편집을 통해 vim 에디터의 모습을 바꿔봅시다](https://medium.com/sunhyoups-story/vim-%EC%97%90%EB%94%94%ED%84%B0-%EC%9D%B4%EC%81%98%EA%B2%8C-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0-5b6b8d546017)
- [How to install vim plugin under cygwin?](https://stackoverflow.com/questions/4447940/how-to-install-vim-plugin-under-cygwin)
- [Are cygwin vim commands different than normal vim?](https://unix.stackexchange.com/questions/11707/are-cygwin-vim-commands-different-than-normal-vim) : vim shortcut이 제대로 작동하지 않을때 참고. .vimrc 설정에 대한 내용 기술


## memo
- http://zeany.net/29?category=678345
- http://webnautes.tistory.com/778
- http://mickymoon.tistory.com/3?category=586789c

Table of Contents
=================

      * [Keyword](#keyword)
      * [Reference](#reference)
      * [상황/ 궁금증](#상황-궁금증)
      * [정리](#정리)
         * [Installation](#installation)
            * [Gem setting](#gem-setting)
            * [apt-cyg 설치 (optional)](#apt-cyg-설치-optional)
         * [home directory 바꾸기](#home-directory-바꾸기)
         * [SSH 설정변경](#ssh-설정변경)
         * [Etc](#etc)
         * [git](#git)
         * [Vim](#vim)
      * [memo](#memo)
   * [Table of Contents](#table-of-contents)

Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc)
