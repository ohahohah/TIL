## memo
- 모두의 연구소 풀잎스쿨11기 분산처리-스파크-완벽-가이드 스터디하면서 정리한 내용입니다.

## Install 실습환경 구축
- 책의 실습예제를 편하게 구동할 수 있게 docker를 사용합니다. Jupyter Notebook으로 구성되어있습니다. 미리 도커이미지가 만들어져있는 [실습리포지토리](https://github.com/dream2globe/SparkDefinitiveGuide) 사용.  
**1. 사전에 [docker 설치](https://docs.docker.com/engine/install/) 되어있어야합니다.**  
**2. submodule 세팅**  
  - '스파크 완벽가이드' 책의 [예제 파일](https://github.com/FVBros/Spark-The-Definitive-Guide/tree/a1f81d09687c227c1401f11d5e7ef1a49651a6f9)을 가져오기 위해 [submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules)로 구성되어있습니다. 아래 명령어를 실행하여 책 예제파일의 콘텐츠를 가져옵니다. 
  1) git clone 받은 폴더로 이동  
  2) `git submodule init` 실행  
  3) `git submodule update` 실행 

**3. docker 사용 : `Makefile`**    
  - docker 명령어와 기타 명령어를 편하게 사용할 수 있도록 [Makefile](Makefile) 설정되어 있습니다. (참고. [What is a Makefile and how does it work?](https://opensource.com/article/18/8/what-how-makefile))  
  1) 실행 전 개인 개발환경으로 설정 변경  
    - docker 실행 설정을 자신의 폴더 위치로 바꾸어주어야합니다. `Makefile`의  `~/workspace/python/SparkDefinitiveGuide` 를 자신의 repository가 있는 폴더위치로 변경해주세요.  
      ```bash
      setup:
        docker run -p 8888:8888 -p 4040:4040 -p 4041:4041 -d --rm -v ~/workspace/python/SparkDefinitiveGuide:/home/jovyan/work --name my-spark-lab dream2globe/my-spark-env
      ```  
  2) docker 실행 : `make setup` 
  3) 웹 브라우저에서 `localhost:8888` 에 접속합니다. Jupyter Notebook이 실행되며, password는 `mysparklab` 입니다.  
  4) 사용을 종료하려면 docker 중지 : `make stop`


## Preface
- 1부 : 스파크 전반 내용 - 개념 위주 이해
- 2부,3부 : 주요 API와 데이터 타입 자세히 다룸
- 4부, 5부 : 실제 프로그램 구동 방법
- 지은이의 말 : 쉽게 실행해볼 수 있는 예제와 모든 유형의 기초적인 사용 사례, 스파크 2.0의 구조적 API 인 DataFrame, Dataset, 스파크 SQL, Structured Streaming 집중 소개 를 하려고 집필을 하였음. 스파크 2.x버전 다룸, 스파크 전반구조, 주요 API를 자세하게 다루고 있음
- *읽는 방법 추천(by 스파크사용자모임 이상훈님) : 전체 속독 -> 4부 -> 2부 -> 5부 -> 3부(로우레벨 API) -> 6부(고급분석 기법)*

---
# I.Gentle Overview of Big Data and Spark
# Ch01. What is Apache Spark
### Key
- Spark를 한 문장으로 설명하면? unifed computing engine + libs(parallel data processing on clusters)
  - All Componets and lib of Spark to end-users
  - '통합 unified' 엔진의 의미 - 일관성, 한 번에  
  - 컴퓨팅 엔진 🗄 - 어떤 데이터 저장소를 사용하던 ok, computing에 집중
  - 라이브러리 - 통합,통합,통합, Standard + Third-party
- 🥚 Context: The Big Data Problem 등장 배경 - 병렬 처리 / 클러스터 처리 필요
- 🐣 Spark의 탄생 - History of spark
- 🐥 점점 성장하는 spark - The Present and Future of Spark
- spark 개발 환경구성

---
## More
- 병렬
- 클러스터
- 클러스터 컴퓨팅
- 스파크 API 단계 정의 
- ucberkly 연구 자료 보고 싶다 

----
## Summary
- Spark 란? *통합 unified computing engine* and a set of libraries for *parallel data processing* on computer clusters. 데이터 워크로드를 일관된 형태로 묶을 수 있는 고성능 컴퓨팅 엔진.
- All Componets and lib of Spark to end-users  

| |  |  |  
|---|---|---|  
|strctured Streaming  | Advanced Analytics | Lib & Ecosystem |  
|Datasets*  | DataFrames* | SQL* |  
| RDDs** | Distributed Variables** |  |   

`*Structured API 🚙`  
`**Low-level API ↘️`  
- **'통합 unified' 엔진의 의미 - 일관성, 한 번에**
  - Spark의 목표는 '빅데이터 애플리케이션 개발에 필요한 **통합** 플랫폼을 제공하는 것. 
  - 다양한 데이터 분석 작업(데이터 읽기, SQL처리, ML,stream 처리,..)을 **같은 연산 엔진**과 **일관성 있는 API**로 수행할 수 있음. 서로 다른 라이브러리의 기능을 조합해 사용.
  - 예. SQL 쿼리로 데이터를 읽고 ML라이브러리로 ML모델 평가를 해야한다면, 두 단계를 하나로 병합하고 데이터를 한 번만 조회 가능
- **컴퓨팅 엔진 🗄 - 어떤 데이터 저장소를 사용하던 ok, computing에 집중**
  - 애플리케이션이 어떤 데이터 저장소를 쓰던 상관없이 스파크를 컴퓨팅엔진으로 사용할 수 있음. 
  - 데이터 저장소 상관없다고?
    - '통합'의 관점에서 컴퓨팅 엔진만 제공하도록 스파크의 기능을 제한시킴. 데이터를 옮기는 것은 많은 비용이 들기 때문에(특히 네트워크에서 많이 발생. 연산 클러스터에서는 네트워크 포화 현상이 발생하기도 함) 데이터 연산역할만 수행하고 기존의 데이터저장소를 활용함. 
  - computing에 집중.
    - 기존 빅데이터 플랫폼(like hadoop)과 차별화 : 'HDFS(file system) + mapreduce(computing)' 가 다른 데이터저장소를 가지기 힘들고, 두 시스템이 밀접한 조합을 가지는 것과 비교됨.
    - hadoop쓰기 어려운 연산노드와 저장소를 별도 구매할 수 있는 공개 클라우드 환경, 스트리밍 애플리케이션 필요환경에서 많이 사용됨. 

- 라이브러리 : 오픈소스로 이루어진 standard lib + third-party lib 
  - 스파크 SQL(SQL과 구조화된 데이터 제공), MLlib(ML지원), 스파크 스트리밍 & 구조적 스트리밍(스트림 처리 기능 제공), Graphx(그래프 분석 엔진), 다양한 저장소 시스템을 위한 connector 등등
  - [외부라이브러리 목록 - spark-packages.org](spark-packages.org)
- 🥚 등장 배경 - 병렬 / 클러스터 처리 필요
  - 병렬 처리가 필요해! : 기존 대규모 애플리케이션은 컴퓨터 프로세서의 성능향상에 의존해서 단일 프로세서로만 동작했음. 2005년 이후 발열 등의 이유로 컴퓨터 프로세서 개발 방향이 단일 프로세서 성능 향상 -> 병렬 프로세서 사용으로 바뀜. 
  - 클러스터 처리가 필요해 : 데이터 수집(센서,카메라,공개 데이터) 비용은 어마어마하게 저렴해졌는데 처리해야할 데이터는 많아졌어. 
- 🐣 spark 가 태어났어요. 
  - UCberkly에서 기존 빅데이터 시스템(하둡 맵리듀스)를 연구하면서 범용적인 컴퓨팅 플랫폼을 설계함
    - 두 가지 사실 발견: 클러스터 컴퓨팅은 엄청나. 맵리듀스 경험이 있는 조직은 자체 데이터로 새로운 애플리케이션을 만들어낼 수 있잖아! / 근데 맵리듀스 엔진은 난이도와 효율성 문제가 있네. ML 알고리즘 쓰려면 데이터 처리 10-20회는 해야하는데 그때마다 처음부터 데이터를 읽어야한다고? 게다가 단계별로 맵리듀스 잡을 개발하고 클러스터를 실행해야한다고. 너무 복잡해.
    - 오케이, 그럼 더 개선된 컴퓨팅 플랫폼 요건은 뭐야? 일단 일관된 API를 해보자고. 
      - Funtional prgramming API : 여러 단계로 이루어진 애플리케이션을 간결하게 개발할 수 있게 하자
      - **같은 엔진을 사용해 여러 처리비용을 결합한 빅데이터 애플리케이션 개발가능**
- 🐥 점점 성장하는 spark
  -  Batch application 만 지원 -> interactive Data Anaylsis , ad-hoc query -> 🦈 Shark - interactive SQL 실행 엔진(2011)
  - Funtional Prgramming 관점 -> 구조화된 데이터 관점 - Spark SQL -> 구조체 기반 신규 API

# Ch02. Gentle Introduction to Spark
## Keyword
- 스파크 - 클러스터 - 클러스터 매니저

## More

## Summary
- 스파크를 클러스터 작업을 조율할 수 있는 프레임워크로 사용. 
  - 클러스터 : 여러 컴퓨터의 자원을 모아 하나의 컴퓨터처럼 사용하게 만듦. 한 대의 컴퓨터로 처리하지 못하는 대규모 연산과 성능을 확보하기 위해 구성함. 
- 클러스터 매니저는 Spark 애플리케이션 실행에 필요한 자원을 할당하고, 할당받은 자원으로 작업을 처리. 클러스터 매니저에 스파크 애플리케이션을 submit. 
  - 클러스터 매니저 : spark standalone cluster manager, Hadoop YARN, Mesos 같은 클러스터 매니저





