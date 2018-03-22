## Reference
- [spark doc - Spark SQL](https://spark.apache.org/docs/latest/sql-programming-guide.html)
- [Mastering Spark SQL by jaceklaskowski](https://jaceklaskowski.gitbooks.io/mastering-spark-sql/spark-sql-StructType.html)

# Spark SQL
- RDD 장점 
  - 분산환경에서 메모리 기반으로 빠르고 안정적으로 동작하는 프로그램 작성
  - 풍부한 데이터 처리 연산
but 아쉬운 점.
- metadata-schema 표현방법이 따로 없음 (Schema?)
이를 보안하기 위해, 다른 유형의 데이터 모델, API 제공하는 스파크 모듈
- SQL 처리 + Dataset API 
- SQL : ansi sql , hive-sql

p.248 간단 실습
```scala
ds.printSchema
```

## Dataset
- 분산 오브젝트 컬렉션 프로그래밍 모델
- Dataframe API - 풍부한 API + 옵티마이저 - 복잡한 데이터 처리 수월하나, 복잡한 코드, 예외처리 사용어려움 
  - dataframe 대신(호환성 제공). 현재 Spark 2.3
  - Dataset API 지원하지 않음 - Python,R [Spark SQL Guide 참조](https://spark.apache.org/docs/latest/sql-programming-guide.html#datasets-and-dataframes)
- 값 + 스키마 정보 -> 데이터 처리 + 내부 성능최적화 제공
  - RDD + 기존 dataframe 대부분 기능 지원
- Row 타입 데이터셋

### 트랜스포메이션, 액션 연산
- transforamtion : 새로운 데이터셋 생성 연산. action 연산 호출될때까지 수행되지 않음
- action : 데이터처리 수행, 결과 생성 연산

### RDD와 차이점 
- typed operation / uptyped operation 으로 나뉨
- uptyped operation : 
```scala
val ds = data.toDS
val ds = ds.map(_+1) // 각 요소에 1을 더함
```
같은 의미 - table과 유사하게 처리  (col("~")) - int가 아닌 ~.sql.Column 타입
```
ds.select(col("value")+1)
```
-> table row, column 해당하는 타입 정의, 로우와 칼럼 타입으로 감싸서 처리

### 정리
- org.apache.spark.sql.Row 타입 요소로 구성된 데이터셋 가리키는 용어
- Dataframe 연산 - untyped operation

### 주요 구성요소
[Spark SQL API]()
- Spark session : spark context
  -spark shell 
- Dataset : 분산 데이터 모델. Since Spark 1.6
- DataFrame : ~.sql.Row database Table,R dataframe / Row 타입 요소 구성된 데이터셋
- DataFrameReader: 다양한 유형 데이터소스로부터 데이터프레임 생성 메서드 제공. read() 메서드 통해 접근
- DataFrameWriter: 다양한 저장소에 저장할 때 사용할 수 있는 메서드 제공
- **Row, column** : DataFrame 구성요서 표현 모델, API, 대부분의 method
- **function** : 집계함수, 통계 함수 제공. 많이 쓰임
- StructType, StructField : 데이터에 대한 schema 정보 나타내는 API. 중첩구조 표현이 가능. [spark-sql-StructType by  jaceklaskowski](https://jaceklaskowski.gitbooks.io/mastering-spark-sql/spark-sql-StructType.html)
- GroupedData, GroupedDataSet : 그루핑,집계 연산

### Spark SQL 코드 작성
1. 스파크세션 생성
2. 스파크세션으로부터 데이터셋 또는 데이터 프레임 생성
3. 생성된 데이터셋 또는 데이터 프레임을 이용해 데이터 처리
4. 처리된 결과 데이터를 외부 저장소에 저장
5. 스파크세션 종료
 
### 실습코드
https://github.com/wikibook/spark/blob/master/Python/ch5/spark_session_sample.py
1. appname, master 정보 설정
2. DataFrameReader instance 이용해 데이터로부터 데이터프레임 생성. 
3. DataFrame 연산 / untyped operation - Row, column
