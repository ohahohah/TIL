## memo
- 20201124. 데이터 엔지니어링 과정 조교하면서 재미있던 것, 리마인드되었던 것 정리 
  - 강의 목적 : End to End 로 데이터 엔지니어링의 전반적인 파이프라인을 체험해보기
- [ ] 전체 과정의 지식맵 만들어보기


## Reference
- [data engineer basic by psyoblade](https://github.com/psyoblade/data-engineer-basic-training)
- [Cloud Design Patterns by Microsoft](https://docs.microsoft.com/ko-kr/azure/architecture/patterns/)

## 무엇을 배웠나
- [ ] data pipe line 도식

## What is data engineering works?
- [ ] 정리하기
- source 에서 summary 지표를 뽑아냄

## Data warehouse 
- (Business Intelligence 관점) 비즈니스 가치 달성을 위해, 데이터에 기반 분석과 의사결정을 하기 위해 필요한 도구
- RDB -> open-source 로 구성된 BI 플랫폼 구축

- conventional Data warehouse
  - **Extract** - source가 사용되지 않는 시간동안 데이터를 보냄
    - Multi Data source -> Data staging Area 
    - 여러 포맷을 어떻게 넣을까? 
  - **Transformation** & **Load**   
    - 분석이 용이하게 summary data 등을 옮김
    - 점점 summary data가 커지면? TB?PB 가 되면 조회도 어려워질텐데
--> "Big"data warehouse
- Big data warehouse
  - batch data 에 적합한 것들은 무엇인지 (spark, hive,...) 데이터 특성에 따라 선택
  - starangler pattern
    - 점진적 migration
    - [Strangler pattern by Microsoft Cloud design pattern Docs](https://docs.microsoft.com/en-us/azure/architecture/patterns/strangler)
      - [StranglerFigApplication by Martin Fowler](https://martinfowler.com/bliki/StranglerFigApplication.html)
      - [Monolith to Microservices Using the Strangler Pattern by Samir Behara in DZone](https://dzone.com/articles/monolith-to-microservices-using-the-strangler-patt)

## Data warehouse vs Hadoop
- [Data Warehouse vs Hadoop](https://www.educba.com/data-warehouse-vs-hadoop/)
-  
Security
  - 새로운 기술이기 때문에 상대적으로 기존 Datawarehouse 에 비해 Security 취약할 수 있음
  - 데이터는 언제나 security를 신경써야함. 예를 들면, 민감정보(개인정보 등)에 접근하면 큰일나니까

## sqoop
- **SQ**L to Had**oop**, hadoop to SQL
- [Sqoop User Guide (v1.4.7)](https://sqoop.apache.org/docs/1.4.7/SqoopUserGuide.html)
- Sqoop 은 version 1을 더 많이 씀
  - [ ] version 2 안 쓰는 이유

- codegen 은 쓰는 경우가 많이 없는듯
- `-relaxed-isolation`
  - `select * with nolock` 과 유사
  - 예를 들어, select 하는 중에 특정 테이블이 delete 되었다면?
    - table 안 데이터가 1,2,3,4,5 있음
    - select 로 1,2하고 3 불러오는 중에 delete table 명령어가 실행된다면, 충돌이 생김. select 는 다음 데이터를 가져오려고 하는데 실제로 데이터는 지워져버림.
  - 그래서 해당 명령어 실행하는 중에 lock 함
  - live 서비스에 영향을 주므로 신중히 사용할 것
- `import control arguments` 많이 씀
  - [ ] 퀴즈에서 나오는 문제 확인하기


## Fluentd
- [fluentd v1.0 Documentation](https://docs.fluentd.org/)
  - [Input plugin](https://docs.fluentd.org/input)
  - [Output plugin](https://docs.fluentd.org/output)
    - [webhdfs](https://docs.fluentd.org/output/webhdfs)
      - 경험상 이건 좀 쓰기 그랬음. - fluentd -> 바로 hadoop 으로 옮기는 건 비추천
      - 왜나면 
        - 파일 버퍼가 적어야 안정적으로 저장이 되니까 fluentd에서 버퍼 작게 해서 파일 여러 개 생성됨
        -> hadoop은 파일당 mapper 를 띄움 
        -> mapper 가 많이 띄워져서 메모리 리소스를 어마어마하게 소모함
- time, tag, message 확인 
- tag 가 어떻게 매치되는지 확인하기
  - conf의 match, filter 
- 설정 세팅은 내가 원하는 형태의 결과로 수집하기 위함임
### Buffer
- set of "chunk"
- The Life cycle of Chunks 
  - from. https://docs.fluentd.org/buffer#the-lifecycle-of-chunks  

  > You can think of a chunk as a cargo box. A buffer plugin uses a chunk as a lightweight container, and fills it with events incoming from input sources. If a chunk becomes full, then it gets "shipped" to the destination. 
  Internally, a buffer plugin has two separated places to store its chunks: "stage" where chunks get filled with events, and "queue" where chunks wait before the transportation. Every newly-created chunk starts from stage, then proceeds to queue in time (and subsequently gets transferred to the destination.    

![the-lifecycle-of-chunks by fluentd Docs](https://github.com/fluent/fluentd-docs-gitbook/blob/da81ba70252eaa863cc28fc888584c59d6fc14d3/images/fluentd-v0.14-plugin-api-overview.png?raw=true)
- rotate_wait
  - 파일 변경되고 있는 상황에서 불러오려고 하면 에러가 나겠죠. 그래서 잠시 기다리는 것
  - [docs.fluentd - input/tail#rotate_wait](https://docs.fluentd.org/input/tail#rotate_wait)

## 데이터 변환도구 - Spark
- 여러가지가 있었으나 최근에는 spark 로 대동단결. 
  - spark 외
    - Hadoop MapReduce Framework
      - Map 할 작업, reduce 할 작업을 짜두면, 알아서 mapreduce 를 실행시킴
    - 그 외, cascading, pig
- spark 의 실제 execution 은 YARN 이 해줌
- [ ] RDD 장점
  - 
- which RDD vs Dataframe and Dataset
  - [ ] 왜 Dataframe 을 쓰는 게 낫다고 하는 걸까?

## Hive
- SQL on Hadoop, DW Enginge
  - mapReduce 코드 대신 SQL 만으로도 사용이 가능하기 때문에 기존 BI 개발자들도 쉽게 사용할 수 있음
- 반복처리, 업데이트가 자주 발생하는 경우(ML, graph 분석 algorithm) 에는 SQL 통한 data pipeline 으로는 부족할 수 있음
- hive managed table 과 external table
  - hive 가 직접 관리하나 안하나의 차이
  - 시스템 관리자나, 다른 개발자가 관리하는 테이블은 external table 로 함. 관리용 테이블은 external table 로 주로 관리. 
  - 여러가지 오픈 소스를 활용할 때, 각각으로 수집한 건 각각 tool 에 저장해두었다가, 준비가 되면 최종적으로 hive managed table 을 만들어 넣어둠.
  - [Managed vs. External Tables in cwiki.apache](https://cwiki.apache.org/confluence/display/Hive/Managed+vs.+External+Tables)
  - [Hive tables - Managed and External in docs.cloudera](https://docs.cloudera.com/replication-manager/cloud/core-concepts/topics/rm-managed-tables-external-tables.html)

## 현업 데이터 엔지니어링 사례
- oracle + Informatica -> Hadoop + Pig + MapReduce 로 이전함
- 데이터 크기는 커지고, 여러 source 들이 다양화되면서 기존 데이터이 GB 를 넘어 TB 까지 됨. Informatica 에서 fali 이 나면 복구하는데 반나절이 걸리게 됨.
  - Informatica 에서는 작업을 다 메모리에 올려서 처리함. UI 상에서 쉽게 구조를 확인할 수 있음
  - oracle 에서 관리해주기 때문에 지불하는 비용은 늘어나고, 내부 조직에서 쌓이는 기술 경험이 없음. 
  - 1년 반 이상 걸리면서 전환함
- ETL 을 수십,수 백개를 빠르게 만들어냈어야함.
  - 스크립트로 빠르게 PIG 로 구현해냄
  - command line bash script 로 빠르게 빠르게 바로바로 구현해내감.
  - 구축한 이후에 조금씩 오픈소스를 더해서 전환함. 
- [팀 단위에서 마이크로 서비스 적용 하기 @ 데이터야놀자 2018 by 박수혁](https://www.slideshare.net/psyoblade/2018-120091234)
    - Q. spring boot 를 선택한 이유가 있는지, python 으로 하면 더 빠르게 개발할 수 있지 않나?
      - 배포 관점에서 볼 때 jar 편했음.  - hadoop eco system 상당수가 java로 짜여있음.
      - 당시 팀에서 spring과 spring boot 둘 을 고려하다가 더 가벼웠던 spring boot로 감. 생태계나 팀 구성도 고려해야할 요소 중에 하나. 
- 의존성의 심해짐 -> container oriented Data service Platform 으로 이동
  - 컨테이너에서 먼저 구축해서 개발 환경을 테스트함.
  - 본 과정 실습에서 했던 것과 비슷한 flow

## 데이터 엔지니링 전반적인 방향
- 모든 걸 커버할 수 없겠지만 이 정도까지
- 시스템 아키텍트까지

## 데이터 엔지니어 학습 커리큘럼
> 공부했던 history 라고 생각하고 봐주세요
  - 신입사원 교육했던 시간을 고려해봤을 때, 3개월 정도 트레이닝이 필요하지 않을까

- 업무 프로세스 협업 툴 : Jira, WIKI, Sprint tools
- OS 에 대한 이해도
  - Linux 에 대한 이해. 명령어들만 잘 활용해도 ETL을 할 수 있음.
  - 서비스 상태, 모니터링, CPU resouce 파악
- Bash
- [ ] 토픽 추가하기

## 내가 생각하는 데이터 엔지니어란?
- 문제해결에 집중하자. 목적을 이루기 위해 살아남기
- 그러려면, 도구에만 얽매이지 말자.
  - 내 손에 익은 도구가 최고일 때가 있다.
  - 나는 열심히 spark hive 학습했는데 실제 환경은 리눅스 운영환경이라면?
    - 때로는 spark 설치하고 ,만들고 하는 거보다 linux script 로 하는게 더 빠를 수 있다. 
  - **문제해결을 위해 스스로의 iteration loop 를 짧게 가져가는 것**
- 눈 앞의 목표, 나의 커리어, KPI 는 다른 것
  - 회사 KPI 는 주어진 프로젝트를 완수하는 것.
- 나의 능력을 신장하는데 도움이 되는 건 무엇일까? 어떤 방법과 방식으로 KPI 를 달성할 수 있을까? 를 고민해보자
- 그림은 크게 그리고, 보고(report)는 작게
  - 처음부터 작은 그림을 그린다면, 작업하다보면 2-3년 후에도 이 아키텍쳐가 버틸까?
  - 내 마음 속 큰 그림. 회사에 적용하는 것은 small step 부터 
- 오늘의 라이브는 내일의 신상 레거시
  - 팀의 리소스를 파악해서 우리에게 익숙한 환경, 도구, 언어를 파악해서 도구를 도입하자.
    - programming language, os tool 늘리지 말고 관리 리소스를 염두에 두자. 

## Term + alpha
- Dementional data
- Staging
  - virtual하게 공간을 만들어두기도 함
  - hdfs://datastaging : root, admin 만 CRUD 가능
    - roll-based 권한을 줄 수 있음
      - hdfs://datastaging/marketing : marketing 팀 꺼
    - convention 을 만들어서 관리
      - hdfs://datastaging/marketing/tablename/dt=20201124/...parquet :  마케팅팀이 필요한 수집일이 2020.11.24(date)
  - hdfs://datastore : 가공된 1,2차 데이터 저장공간
- [ ] Map Reduce
  - [what-is-mapreduce by educba](https://www.educba.com/what-is-mapreduce/)
    - [how-mapreduce-work by educba](https://www.educba.com/how-mapreduce-work/)
  - [what-is-mapreduce-in-hadoop by educba](https://www.educba.com/what-is-mapreduce-in-hadoop/)
  - [mapreduce-architecture by educba](https://www.educba.com/mapreduce-architecture/)  
- backfill
  - [What is Data Backfilling and How Far Back Does it Go? by Metigy](https://metigy.com/support/data-backfilling-far-back-go/)
  - log 형식에 맞지 않더라도 중요한 정보가 있을 수 있음. 데이터를 누락시키지 않고  이런 데이터까지 log 에 포함해서 남겨둠.
    - in fluentd conf [docs link](https://docs.fluentd.org/input/tail#emit_unmatched_lines): `emit_unmatched_lines true`
  - googling keyword: `backfill data` `backfill log`
- logrotate
  - 로그 관리에 쓰임. 로그가 점점 쌓여서 로그파일 크기가 커졌을 때를 위해 사용함. 특정 조건을 걸어서 메인 로그의 이름을 바꾸고 압축해서 새롭게 생성되는 이벤트부터는 빈 파일에 기록되도록 하는 것.
  - [logrotate - linux manual by die.net](https://linux.die.net/man/8/logrotate)
  - [How to Setup and Manage Log Rotation Using Logrotate in Linux by TecMint](https://www.tecmint.com/install-logrotate-to-manage-log-rotation-in-linux/)
    - [How to Manage System Logs (Configure, Rotate and Import Into Database) in RHEL 7 – Part 5](https://www.tecmint.com/manage-linux-system-logs-using-rsyslogd-and-logrotate/)
  - [리눅스 로그관리 - Logrotate 알아보기 by 서버구축이야기](https://server-talk.tistory.com/271)
- Data Lineage
  

## QnA
Q. 기존 RDB 스케일링 한계치는 어느정도 데이터 일까?
  - 일일 발생 데이터 1TB 이상이라면 힘들지 않을까? GB 단위라면 어떻게든 해보겠지만.
  - scale out 도 repartioning 문제 등으로 한계가 있음
Q. NoSQL 에서 데이터 수집하는 방법은?
  - 라이브 DB에 바로 접근한다면, 동시성 등 lock 문제가 발생할 수 있음. 때문에 라이브 DB 대신 replication DB 를 만들어 데이터를 가져옴
  - NoSQL 경우, sharding 시켜놓은 경우가 많음
    - 분산시켜서 저장하고, 분산 정보를 파악해 조회 등을 함
  - 그렇기 때문에 라이브에 부하를 주지 않으면서 snapshot 을 뜨기 어려움.
  - 단, mongoDB의 경우 partitionaing 을 하지 않은 경우에 broker를 통해서 cursor 를 지정해서 제한된 collection 만 replication 해올 수 있음.  
  
Q. [sqoop] sqoop 에서 INFO message 는 제외하고 출력하는 방법은?
  - 방법 01. Warning 제외하고 결과만 깔끔하게 보여주기
  `sqoop eval -Dmapreduce.map.log.level=WARN -connect jdbc:mysql://mysql:3306/testdb --username sqoop --password sqoop -e "show tables" 2>/dev/null`

Q. [fleuntd] tag 명 일부로 폴더 만들기
  - buffer 쪽에서 chunk 를 만들 때의 키 값에 포함되어 있어야 path 와 같은 저장 위치에 적용을 할 수가 있음. 사용하고자 하는 table_name 혹은 tag 가 있다면 그걸 buffer 지시자의 tag 에 포함시켜주고 사용하면 됨.
  ```bash
  <source>
    @type dummy
    tag test.info
    size 5
    rate 1
    auto_increment_key seq
    dummy {"info":"hello-world"}
  </source>

  <match test.info>
    @type file
    path_suffix .log
    path /tmp/target/${tag[0]}/%Y%m%d/part-%Y%m%d.%H%M
    <buffer time,tag>
        timekey 1m
        timekey_wait 10s
        timekey_use_utc false
        timekey_zone +0900
    </buffer>
  </match>
  ```

Q. [fluentd] 물리적으로 source와 target 서버가 다르다면 어떻게 로그를 전송해야할까?
  - 방법 1. direct forward fluentd agent 로 전송
  - 방법 2. spark, java등을 사용해 로컬 스토리지에 저장
  - remote path를 fluentd 이용해서 저장하는 경우는 거의 없음. 다만, hdfs 적재하는 것이 목적이라면, spark 혹은 별도의 hadoop client or java application 을 활용해서 업로드하는 것이 운영 상 편리할 것 같음
  
Q. Linux 환경에서 스케쥴링 작업은 어떻게 하나?
  1. crontab
  2. airflow, luige (workflow a->b->c+d->d)
  3. java application 직접 구현 (quartz ..) + api server
  - 주로 crontab 을 썼다. 여러 작업을 workflow 가 있을 때에는 bash  script 사용했음. 
  - crontab을 사용한 다음에 다른 것들을 서서히 도입하는 것도 좋을듯. 다른 것들은 부가적인 학습이 필요하지 않나. UI 가 필요하다면 airflow 를 고려해본다던가 등등으로 필요성에 따라 확장시켜나가면 좋을듯.

Q. 현업에서는 데이터엔지니어가 서버 설치 + 프로그램(open source) 설치 및 환경 설정 등도 다 하나?
  - 기본 설치하는 팀이 따로 있더라도 일반적으로 세팅 실험 sandbox 구축해보고 설치를 한다. 어떻게 하는지 파악하고 있어야한다.
Q. 현재 조직에 데이터엔지니어링 팀이 구축이 안되어있는데 어떻게 도입하고 시도할 수 있을까?
  - 먼저 container 환경을 만들어서 작은 규모로 적용하는 걸 추천. 내가 적용하고 싶은 툴들부터 하나씩 설치를 하고 작업을 해보자

Q. 주로 사용하는 Tool이 왜 Open소스 기반의 Tool인지?
  - 툴보다 ROI 의 문제라고 생각함. trade-off 가 있음.
  - 상용 툴을 사용하면 managed service를 받을 수 있다.
  - 데이터가 늘어날 수록 상용 툴을 쓰면 비용이 증가한다. 그 예산으로 개발자를 키워서 장기적으로 오픈소스를 사용하면 유연하게 대응할 수 있다는 판단. 
    - 일반 상용 툴은 제공하는 기능에서 기능 추가라던지 상황에 맞게 유연하게 대응하는게 빠르지 못함. 
    - 필요한 부분만 따로 구현한다고 하면 유지보수성, 나중의 기술부채가 쌓일 수도 있는 위험도 있다.



## Tip
- 작업하기 전 먼저 데이터 형태를 확인할 때, schema와 데이터 아주 작은 일부를 출력하면서 형태 파악하기
  ```python
  user = spark.read.option("header", "true").option("inferSchema", "true").csv("data/tbl_user.csv")
  user.printSchema()
  user.show(5)
  ```
- 예약어와 table 명, column 명이 겹칠 때는 back quote 사용
  - 예. user 라는 테이블을 hive 에서 사용하고 싶을 때(user 가 예약어), `user`로 처리
    ```
    alter table `user` add if not exists partition (dt = '20201025') location 'hdfs:///user/company/user/dt=20201025';
    ```
- 로그 디자인 