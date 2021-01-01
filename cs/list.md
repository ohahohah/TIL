## memo
- 아래 roadmap 에 있는 concept과 짧게 정리할 수 있는 사용법들을 각 한 페이지로 정리할 생각
  - concept 을 파고 들어가면 끝도 없을 듯하여 최대한 정의 중심으로 정리 
    - 나중에 여기에 맞는 실습 예제 덧붙이면 재밌겠다. 
  - [Web developer Roadmap 2020 by kamranahmedse](https://github.com/kamranahmedse/developer-roadmap) - index : BE(Back-end), FE(Front-end), DO(DevOps)
  - [Modern Data Engineer Roadmap 2020 by datastacktv](https://github.com/datastacktv/data-engineer-roadmap) - index : DE(Data Engineering)
  - [우아한 테크코스 로드맵 2020](https://github.com/woowacourse/roadmap)  - index : WH
<details><summary>log</summary>
  
- 20201217 각 topic 별로 reference 매핑  
  - 최대한 부담없이 읽을 수 있는 입문책 1권.   
    - 소유하고 있거나, learning oreilly 구독으로 볼 수 있거나, 도서관에서 빌려볼 수 있는 책 중심  
- 20201211-13 여러 로드맵에서 겹치는 주제부터 정리  
  - 각 concept 옆에 어떤 roadmap 에 나오는지 적음.   
    - DE(Data Enginner), BE(Backend Developer), FE(Frontend Developer), WH(우아한 테크코스), DO(DevOps)  
</details>


## List
- How does the computer work? (in DE)
  - ref : [ebook] J. 클라크 스코트. But How do it know? - The basic pricipal of computers for everyone 그래서 컴퓨터는 어떻게 동작하나요?.인사이트(지유록 역).2019
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
    - [The Linux Command Line by William Shotts](http://linuxcommand.org/tlcl.php) / [한글 번역서 - 리눅스 커맨드라인 완벽 입문서.비제이퍼블릭(이종우 , 정영신 옮김).2013](http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788994774299) : 스르륵 한번에 훑는 건 역시 이 책으로.
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
