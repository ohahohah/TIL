## Keyword 
`Oracle Tuning` , `index`, 'join'

## Reference 
### oracle explain plan
- [Oracle - Database Performance Tuning Guide- 13.4.2 Reading and Understanding Execution Plans](https://docs.oracle.com/cd/B19306_01/server.102/b14211/optimops.htm#i82029)
- 오라클 성능 고도화 원리와 해법 I(조시형 지음) - ch03. 오라클 성능 관리 -04.DBMS_XPLAN 패키지
- [구루비 지식창고 - EXPLAIN PLAN](http://wiki.gurubee.net/display/DBSTUDY/EXPLAIN+PLAN)

### query optimization
- [쿼리 계획과 최적화를 이용한 더 효율적인 SQL](https://ko.khanacademy.org/computing/computer-programming/sql/relational-queries-in-sql/a/more-efficient-sql-with-query-planning-and-optimization)
- [SQL 고급 활용 및 튜닝 - 인덱스와 조인](http://www.dbguide.net/db.db?mobile&cmd=view&boardUid=148220&boardConfigUid=9&categoryUid=216&boardIdx=140&boardStep=1)
- [김범의 데이터 모델링 - 2.1 옵티마이저(Optimizer)의 이해](http://playdata.io/2017/12/12/2-1-%EC%98%B5%ED%8B%B0%EB%A7%88%EC%9D%B4%EC%A0%80optimizer%EC%9D%98-%EC%9D%B4%ED%95%B4/)


## SQL QUERY OPTIMIZING
### Check
- JOIN시 INDEX 사용

### SQL Tuning Process (from 오라클 성능 고도화 원리와 해법 I)
 1. query executeion plan 확인 
 (1로 파악안될 경우)
 2-1. autotrace 걸기 : 수행 시, 실제 일량 측정 
 2-2. SQL Trace 걸기 : 내부 수행 절차상 어느 단계에서 부하 일으키는지 눈으로 확인
 (문제점 파악 후)
 3. query 수정 or optimizor hint 사용

---------------
### 상황 / 궁금증
- 20180104 오픈API 개발 프로젝트에서 결과 데이터 응답 조회시 사용하는 query 수정(응답데이터의 전체 데이터수 정보를 포함해서 응답)  
- query 속도를 높이기 위해 join 구문에 pk_index 를 타도록 수정.
- [궁금] A.정말로 어떻게 빨라지는지 궁금해 
-> query execution plan 결과 분석
- [궁금] B.왜 index를 타면 query 속도가 빨라질까?
-> index와 join에 대해서 찾아보기
- [궁금] C.SQL Tuning 다른 방법은 뭐가 있지? (DB를 수정하는 권한이 없으므로, Query수정이 가장 현실적인 방법임)
-> SQL tuning을 왜 하는지, 어떤 방법을 쓰는지 찾아보자

### A.SQL excute plan 
- [궁금] excution plan은 무엇인가? 
- Oracle 9.2이후부터 사용된 dbms_xplan package를 사용함.(explain_plan보다 더 많은 정보를 담고 있다고 함) 

- 실행방법 : 
 - 이미 DBA가 setting을 해놓았음. 
 - `EXPLAIN PLAN SET STATEMENT_ID='SQL1' FOR 쿼리` 로 실행함.

- 실행결과 : 
 - `SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY('PLAN_TABLE','SQL1','ALL'));` 로 확인. 'ALL'대신 여러 다른 옵션을 줄 수 있음.

- 결과확인 : 
 - 하... 결과 어떻게 확인하는지 모르겠어. 각각 항목의 의미가 뭐지???
 - pk_index 사용하는 것과 아닌 쿼리의 차이는 보임. cost 가 다르고, fullscan 과 index Scan의 차이
>
index를 타지 않음
-------------------------------------------------------------------------------------------------
| Id  | Operation                         | Name        | Rows  | Bytes | Cost (%CPU)| Time     |
-------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT                  |             |    40 | 82320 |    12   (9)| 00:00:01 |
|*  1 |  VIEW                             |             |    40 | 82320 |    12   (9)| 00:00:01 |
|*  2 |   COUNT STOPKEY                   |             |       |       |            |          |
|   3 |    VIEW                           |             |    41 | 83845 |    12   (9)| 00:00:01 |
|   4 |     WINDOW SORT                   |             |    41 |  9143 |    12   (9)| 00:00:01 |
|*  5 |      FILTER                       |             |       |       |            |          |
|*  6 |       HASH JOIN                   |             |    41 |  9143 |    12   (9)| 00:00:01 |
|   7 |        TABLE ACCESS FULL          | TABLE_A     |    33 |  6798 |     3   (0)| 00:00:01 |
|   8 |        TABLE ACCESS BY INDEX ROWID| TABLE_B     |    71 |  1207 |     8   (0)| 00:00:01 |
|*  9 |         INDEX SKIP SCAN           |PK_B(index)  |     1 |       |     7   (0)| 00:00:01 |
-------------------------------------------------------------------------------------------------

> 
index를 탐
-------------------------------------------------------------------------------------------------
| Id  | Operation                         | Name        | Rows  | Bytes | Cost (%CPU)| Time     |
-------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT                  |             |    17 | 34986 |     6  (17)| 00:00:01 |
|*  1 |  VIEW                             |             |    17 | 34986 |     6  (17)| 00:00:01 |
|*  2 |   COUNT STOPKEY                   |             |       |       |            |          |
|   3 |    VIEW                           |             |    17 | 34765 |     6  (17)| 00:00:01 |
|   4 |     WINDOW SORT                   |             |    17 |  3791 |     6  (17)| 00:00:01 |
|*  5 |      FILTER                       |             |       |       |            |          |
|*  6 |       HASH JOIN                   |             |    17 |  3791 |     6  (17)| 00:00:01 |
|   7 |        TABLE ACCESS BY INDEX ROWID| TABLE_A     |     5 |  1030 |     2   (0)| 00:00:01 |
|*  8 |         INDEX RANGE SCAN          | PK_A(index) |     5 |       |     1   (0)| 00:00:01 |
|   9 |        TABLE ACCESS BY INDEX ROWID| TABLE_B     |    16 |   272 |     3   (0)| 00:00:01 |
|* 10 |         INDEX RANGE SCAN          | PK_B(index) |    11 |       |     2   (0)| 00:00:01 |
-------------------------------------------------------------------------------------------------

### B. index와 join의 상관관계

### C. SQL Tuning

