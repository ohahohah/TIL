## memo
- 아래 roadmap 에 있는 concept과 짧게 정리할 수 있는 사용법들을 각 한 페이지로 정리할 생각
  - concept 을 파고 들어가면 끝도 없을 듯하여 최대한 정의 중심으로 정리 
    - 나중에 여기에 맞는 실습 예제 덧붙이면 재밌겠다. 
  - [Web developer Roadmap 2020 by kamranahmedse](https://github.com/kamranahmedse/developer-roadmap)
  - [Modern Data Engineer Roadmap 2020 by datastacktv](https://github.com/datastacktv/data-engineer-roadmap)
  - [우아한 테크코스 로드맵 2020](https://github.com/woowacourse/roadmap)
- 여러 로드맵에서 겹치는 주제부터 정리
  - 각 concept 옆에 어떤 roadmap 에 나오는지 적음. 
    - DE(Data Enginner), BE(Backend Developer), FE(Frontend Developer), WH(우아한 테크코스)


## List
- How does the computer work? (in DE)
  - 야... 이건 한페이지로 정리하기 어렵겠는데

### OS
- How OSs work in General (in BE)
- Process Management (in BE)
- Threads and Concurrency (in BE)
- Memory Management (in BE)
- Interprocess Communication (in BE)
- I/O Management
- POSIX Basics 
  - stdin, stdout, stderr, pipes
  
#### Linux
- Basic Terminal Commands (in BE)
  - grep, awk, sed, lsof, curl, wget, tail, head, less, find, ssh, kill
  - 음 너무 기초적인 건데
- shell scripting (in DE)
  - 괜찮은 reference 정리
- cronjobs(in DE)


### Network
- How does the internet work? (in DE, BE)
- What is HTTP, HTTPS(in DE, BE)
  - 이건 추가 reference 와 RFC 도 넣어두기
- Browsers and how they work?(in BE)

- Network protocols (in DE)
  - 많이 쓰이는 것 개요 정도만
- TCP (in DE)
- SSH (in DE)
- IP (in DE)
- DNS and how it works? (in DE, BE)
- What is Domain Name? (in BE)
- What is hosting (in BE)
- Firewalls (in DE)
- VPN (in DE)
  - AWS 에서 어떻게 적용해서 쓰고 있는지 덧붙여봐야겠음. 
- VPC (in DE)

### Web Security (in BE)
- CORS
- SSL/TLS
- OWASP Security Risks
- Content Security Policy

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
- Horizontal vs vertical scaling (in DE, DE)
  - scale-out , scale-up
