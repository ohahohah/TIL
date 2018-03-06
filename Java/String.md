## Keyword
`java string` `microbenchmarking`

## Reference

## 상황 - 정리 - 궁금증/추가 정리 필요
### Which String method: “contains” or “indexOf > -1”?
#### [상황] Intellij Inspection 실행했을때, 다음 항목에서 warning 걸림
  ```
  'indexOf()' expression is replaceable with 'contains()'  
  Reports any String.indexOf() expressions which can be replaced with a call to the String.contains() method available in Java 5 and newer.  
  This inspection only reports if the project or module is configured to use a language level of 5.0 or higher.
  ```
#### [정리]
  -  java.lang.String을 살펴보면, contains()은 내부적으로 String.indexOf() 을 호출함. 
  ```java
  public boolean contains(CharSequence s) {
  return indexOf(s.toString()) > -1;
  }
  ```
  - [stackoverflow - Which String method: “contains” or “indexOf > -1”?](https://stackoverflow.com/questions/10714376/which-string-method-contains-or-indexof-1#) 을 참고하면, 
  - 추가 method 호출이 성능에 영향을 끼치는지에 대한 논의를 하고 있음. 가장 vote를 많이 받은 답변(18/03/06 기준)은 성능에 유의미한 영향을 끼치지 않는다는 입장임.
  - 좀 더 가독성이 좋은(readable)한 contains로 작성하는게 낫지 않을까? 

#### [궁금증/추가]
- 위 stackoverflow 답변에서 성능측정 부분이 궁금해서 더 찾아봄. `benchmarking` `microbenchmarking`
  - [stackoverflow - What is microbenchmarking?](https://stackoverflow.com/questions/2842695/what-is-microbenchmarking)
  - [OpenJDK wiki - MicroBenchmarks](https://wiki.openjdk.java.net/display/HotSpot/MicroBenchmarks)
  - [Oracle hotspotFAQ - Benchmarking the Java HotSpot VM ](http://www.oracle.com/technetwork/java/hotspotfaq-138619.html#benchmarking_simple)
  - [google/caliper wiki](https://github.com/google/caliper/wiki/BestPractices) : Java microbenchmark tool
- 찾다보니, 추가 개념
  - [Program optimization From Wikipedia](https://en.wikipedia.org/wiki/Program_optimization)
  - [Profiling (computer programming) From Wikipedia](https://en.wikipedia.org/wiki/Profiling_(computer_programming))
  - [Java performance From Wikipedia](https://en.wikipedia.org/wiki/Java_performance)
  - [Dynamic program analysis From Wikipedia](https://en.wikipedia.org/wiki/Dynamic_program_analysis)
  - [Static program analysis From Wikipedia](https://en.wikipedia.org/wiki/Static_program_analysis)
- 정적 분석 tool인 sonarQube는 세팅해두고 가끔 사용하기는 하는데 이것도 한 번 정리해보고 싶구나.


