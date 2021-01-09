## memo
- 아래 roadmap 에 있는 concept과 짧게 정리할 수 있는 사용법들을 각 한 페이지로 정리할 생각
  - concept 을 파고 들어가면 끝도 없을 듯하여 최대한 정의 중심으로 정리 
    - 나중에 여기에 맞는 실습 예제 덧붙이면 재밌겠다. 
  - [Web developer Roadmap 2020 by kamranahmedse](https://github.com/kamranahmedse/developer-roadmap) - index : BE(Back-end), FE(Front-end), DO(DevOps)
  - [Modern Data Engineer Roadmap 2020 by datastacktv](https://github.com/datastacktv/data-engineer-roadmap) - index : DE(Data Engineering)
  - [우아한 테크코스 로드맵 2020](https://github.com/woowacourse/roadmap)  - index : WH
<details><summary>log</summary>
- 20210107 각 topic 별로 reference 매핑 추가
  - 레퍼런스를 더 덧붙이고 싶은 유혹을 느낀다. 이 부분에서는 이 레퍼런스가 더 자세하고 좋은데... 
    - 자기 전 스르륵 읽을 수 있는 책을 고르자. 상세한 설명보다 뼈대 위주의 레퍼런스로. 큰 그림이 안 보일 수 있다. 
- 20201217 각 topic 별로 reference 매핑  
  - 최대한 부담없이 읽을 수 있는 입문책 1권.   
    - 소유하고 있거나, learning oreilly 구독으로 볼 수 있거나, 도서관에서 빌려볼 수 있는 책 중심  
- 20201211-13 여러 로드맵에서 겹치는 주제부터 정리  
  - 각 concept 옆에 어떤 roadmap 에 나오는지 적음.   
    - DE(Data Enginner), BE(Backend Developer), FE(Frontend Developer), WH(우아한 테크코스), DO(DevOps)  
</details>


## List
- How does the computer work? (in DE)
  - ref : [ebook] [J. 클라크 스코트. But How do it know? - The basic pricipal of computers for everyone](https://www.goodreads.com/en/book/show/18276352-but-how-do-it-know---the-basic-principles-of-computers-for-everyone) / 역서 - [그래서 컴퓨터는 어떻게 동작하나요?.인사이트(지유록 역).2019](https://blog.insightbook.co.kr/2019/10/10/%EA%B7%B8%EB%9E%98%EC%84%9C-%EC%BB%B4%ED%93%A8%ED%84%B0%EB%8A%94-%EC%96%B4%EB%96%BB%EA%B2%8C-%EC%9E%91%EB%8F%99%ED%95%98%EB%82%98%EC%9A%94/)[역서 ebook](http://ebook.insightbook.co.kr/book/73)
  - 야... 이건 한페이지로 정리하기 어렵겠는데

### OS
- ref 
  - [ebook] 반효경.운영체제와 정보기술의 원리.이화여자대학교출판부.2008 ([목차](http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788966262502))
  - Remzi H. Arpaci-Dusseau and Andrea C. Arpaci-Dusseau(University of Wisconsin-Madison).Operating Systems: Three Easy Pieces - [site with free download](http://pages.cs.wisc.edu/~remzi/OSTEP/)
     - [ebook] Remzi H. Arpaci-Dusseau 외. 운영체제 아주 쉬운 세 가지 이야기.홍릉과학출판사((원유집 외 옮김).2017 / [2판 번역 개정판](http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9791156007937)이 나왔다. 
  
- How OSs work in General (in BE)
- Process Management (in BE, DO)
- Threads and Concurrency (in BE, DO)
- Sockets (in DO)
- Memory Management (in BE)
- Memory / Storage (in DO)
- File Sytems (in DO)
- Interprocess Communication (in BE)
- I/O Management (in DE, BE, DO)
- POSIX Basics (in DE, BE, DO)
  - stdin, stdout, stderr, pipes
- virtualization (in DO)

  
#### Linux
- Basic Terminal Commands (in BE, DO)
  - ref 
    - [Shotts,William.The Linux Command Line.No Starch Press](http://linuxcommand.org/tlcl.php) / [역서 - 리눅스 커맨드라인 완벽 입문서.비제이퍼블릭(이종우 , 정영신 옮김).2013](http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788994774299) : 스르륵 한번에 훑는 건 역시 이 책으로.
      - [OccupyTheWeb.Linux Basics for Hackers.No Starch Press.2018](https://learning.oreilly.com/library/view/linux-basics-for/9781492069485/) : 표지가 귀엽다. Kali Linux 사용하지만 Linux basic 사용을 다루고 있어서 크게 상관없을듯.
    - [Linux Bible by Christopher Negus, Christine Bresnahan](https://www.goodreads.com/book/show/13838572-linux-bible) / [역서 - 리눅스 바이블 9판.제이펍(배장열 옮김).2016](http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791185890586) : 조곤조곤 상세하게 내용을 설명하고 있음. 위 책과 보완해서 보려고 했는데 재밌어서 쭉 읽게 됨.

  - Text manipulation 
    - awk, sed, grep, sort, uniq, cat, cut,echo, fmt, tr, nl,  egrep, fgrep, wc
  - process Monitoring
    - ps, top, htop, atop, lsof, kill
  - Network 
    - nmap, tcpdump, ping, mtr, traceroute, dig, alrmon, alrodump, iptables, netstat
  - System performance 
    - nmon, lsotat, sar, vmstat
  - etc
    - curl, wget, tail, head, less, find, ssh
    - strace, dtrace, systemptap, uname, df, history
- compiling apps from source 
  - gcc, make, and other realted stuff

- shell scripting (in DE, DO)
  - 괜찮은 reference 정리
- cronjobs(in DE)


### Network
- ref
  - network가 처음이라면 아래 중 취향껏 어떤 하나를 골라도 상관없음. 
  - 전공과목이나 여러 루트로 공부를 한번 해 보았다면 큰 얼개를 파악하기 위해 여러 레퍼런스의 목차를 비교하면서 각 레퍼런스에 없는 내용을 서로 보완하면서 동시에 보는 것을 추천. 
  <details><summary>list</summary>  

  - [리브로웍스.TCP/IP 쉽게, 더 쉽게-명쾌한 설명과 풍부한 그림으로 배우는.제이펍(신상재 옮김).2016](http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9791185890678) : 옮긴이 머리말로 소개를 대체한다. 
    > 이 책은 쉽다. 그것도 아주 쉽다. (...) 상상력을 자극하는 그림이 넘쳐난다. (...) 이 책을 보면서 '네트워크를 배워서 어디에 써먹지?' 와 같은 부담스러운 걱정은 할 필요가 없다. 그냥 지금 사용하고 있는 네트워크를 이해하고 그것을 알았을 때 느끼는 지적 포만감을 만끽하면 된다. 
  - [아미노 에이지.하루 3분 네트워크 교실-인터넷 박사가 조교 넷군에게 알려주는 왕초보를 위한 네트워크 교실.영진닷컴(김현주 옮김).2016](http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788931454727) : 왕초보를 위한. 배경 지식이 없는 사람도 쉽게 읽어나갈 수 있음. 조교와 박사의 대화체로 되어있음. 조교는 이상한 질문을 하고 박사는 조교를 구박한다. 조교는 대학원생인걸까... 힘내요.
  - [우에노 센.그림으로 배우는 HTTP & Network.영진닷컴(이병억 역).2015](http://www.yes24.com/Product/Goods/15894097) : 역시 부담없는 책. HTTP 파트를 좀 더 다루고 있음. 마지막 장에 웹 공격 기술도 다루고 있음.
  - [강의 / 김영한 - 모든 개발자를 위한 HTTP 웹 기본 지식 in 인프런](https://inf.run/4QZ7) : 5시간 40분(2배속하면 3시간). 네트워크 기초 지식부터 가볍게 설명해줌. 입문 단계에서 특히 좋을 듯. 요약 강의. 웹 개발자라면 이미 알고 있는 내용들로 구성되어 있어서 전체 흐름을 되짚을 겸 두 세시간 부담없는 세미나 듣듯이 스르륵 들으면 됨. 
    - [강의 / 리얼리눅스 - 5월 무료세미나 "브라우저 부터 웹서버 까지" (네트워크 동작원리)](https://youtu.be/oW_EirDkCnM) : 1시간 가량. 간단한 실습(linux shell command)으로 흐름을 파악함
  </details>
- How does the internet work? (in DE, BE)
- What is HTTP, HTTPS(in DE, BE)
  - 이건 추가 reference 와 RFC 도 넣어두기    
  - Header, caching, Optimization, HTTP 2.0, HTTP 3.0 (in WH)
- Browsers and how they work?(in BE)

- Network protocols (in DE, DO)
  - 많이 쓰이는 것 개요 정도만
- Connection Management (in WH)
- OSI 7 Layer (in WH)
- FTP (in DO)
- TCP (in DE)
- SSH (in DE)
- Emails : SMTP, IMAPS, POP3S (in DO)
- IP (in DE)
- DNS and how it works? (in DE, BE)
- What is Domain Name? (in BE)
- What is hosting (in BE)
- Port Forwarding (in DO)
- Firewalls (in DE)
- VPN (in DE)
  - AWS 에서 어떻게 적용해서 쓰고 있는지 덧붙여봐야겠음. 
- VPC (in DE)
- Block/Non-block Sync/Async (in WH)
- Proxy : Reverse / Forward Proxy (in WH)
- Caching Server (in DO)
- Load Balancer (in DO)
- DMARC (in DO)
- SPF (in DO)
- Domain Keys (in DO)


### Web Security (in BE, WH)
- ref (inbox)
  - amazon에서 목차 탐색만 함. / [oreilly playlist 로 보기](https://learning.oreilly.com/playlists/3b35317a-447f-427a-a0b0-939d68a9bec7)
  - [McDonald,Malcolm.Web Security for Developers.No Starch Press.2020](https://learning.oreilly.com/library/view/web-security-for/9781098122683/) : 매우 기초적인 내용. 각 부분이 어떻게 동작하는지(How the internet works,...)에 대한 설명도 포함되어있음. 
    - 이 책을 sub 로. [Bryan Sullivan, Vincent Liu.Web Application Security, A Beginner's Guide.McGraw-Hill.2011](https://learning.oreilly.com/library/view/web-application-security/9780071776165/)  
  - [Hoffman,Andrew.Web Application Security.O'Reilly Media, Inc.2020](https://learning.oreilly.com/library/view/web-application-security/9781492053101/) : 위 책과 함께/다음 스텝으로 보기. 살짝 더 많은 내용을 커버하고 있음
  - [Jonathan LeBlanc, Tim Messerschmidt.Identity and Data Security for Web Development.O'Reilly Media, Inc.2016](https://learning.oreilly.com/library/view/identity-and-data/9781491937006/) : 인증을 포함한 
Identity and Data Security 중심
  - For fun
    - [ebook] Peter Yaworski.Web Hacking 101.2016
    - [Peter Yaworski.Real-World Bug Hunting.No Starch Press.2019](https://learning.oreilly.com/library/view/real-world-bug-hunting/9781098122508/)


- CORS
- SSL/TLS
- OWASP Security Risks
- Content Security Policy
- SQL Injection

- Cookie based 
- OAuth
- Basic Authentication
- Token Authentication
- JWT
- and OpenID, SAML

- Hashing Algorithms
  - MD4 and why not to use it
  - SHA Family
  - scrypt
  - bcrypt


### Data security & privacy' section (in DE)
- Key management
- Encryption
- Legal compliance

### APIs
- REST(in DE, BE) 
  - RMM
    - https://martinfowler.com/articles/richardsonMaturityModel.html
    - https://medium.com/@osaigbovoemmanuel1/is-the-richardson-maturity-model-relevant-in-2019-80e0cd211483
    - https://techblog.commercetools.com/graphql-and-rest-level-3-hateoas-70904ff1f9cf

### Caching
- CDN
- Redis
- Memcached
- client side

### Design and Development Priciples (in BE)
- 아래 토픽을 한 페이지에 내용을 정리하면 어떻게 될까? toy project 로 code로 만드는 게 나을 듯
  - DDD
  - TDD
  - GoF Design Pattern
- SOLID
  - 이것도 코드 중심으로
- KISS
- YAGNI 
- DRY

### Architectural Patterns (in BE)
- 아래 걸 한 페이지로 정리...? 오우... 오우.. 
- Monolithic Apps
- MSA
- SOA
- CQRS and Ebent Sourcing
- Severless

- Fundamentals of Software Architecture: An Engineering Approach 1st Edition
by Mark Richards
- Monolith to Microservices: Evolutionary Patterns to Transform Your Monolith 1st Edition
by Sam Newman 

### Databases
- ORMS (in BE)
- N+1 Problem (in BE)
- Transactions (in BE)
- ACID transactions (in DE, BE)
- Data Normalization (in DE, BE)
- Indexes and how the work (in BE)

- OLTP vs OLAP (in DE)
- Data Replication (in BE)
- Sharding Strategies (in BE)
- CAP theorem (in DE, BE)
  https://dzone.com/articles/understanding-the-cap-theorem


- NoSQL (in DE)
  - 이거... RDB vs Non-relationalDB 로 정리
- Batch, streaming (in DE)
- cluster (in DE)
  - map reduce
- Messaging (in DE, BE)
  - RabbitMQ 
  - 작은 예제를 만들어볼까? 

- Serialization(in DE)

## Inbox
- gRPC
- log 
  - I heart log [oreilly](https://www.oreilly.com/library/view/i-heart-logs/9781491909379/)

### Building For Scale (in BE)
- 이건 어떻게 정리해야할지 감이 안오네 
- Mitigation Strategies
  - Gracefil Degradation
  - Throttling
  - Backpressure
  - Loadshifiting
  - circuit Breaker
- Understading the diff
  - Instrumentation
  - Monitoring
  - Telemetry 
- Migration Strategies
- Horizontal vs vertical scaling (in DE,  BE, WH)
  - scale-out , scale-up
- SPOF - Fault Tolerance (in WH)

## Testing
- 주제가 다 커서 topic 으로 정리될지 의문
- TDD 
- F.I.R.S.T
