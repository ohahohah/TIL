## Keyword
`exception`

## Reference
- [Documenting Exceptions with @throws Tag](http://www.oracle.com/technetwork/java/javase/documentation/index-137868.html#throwstag)

## 상황 / 궁금증
- parameter가 null일때(null이면 안됨), IlligalArgument Excetion을 던저야하는지, guava의 checkNotNull을 써서 NullPointerException을 던져야하는지 헷갈린다. 매번! 그래서 매번 다르게 처리한다. 설계 엉망이여ㅠ

## 정리
- [ ] 다시 읽고 정리하기
  - [Automatically throwing IllegalArgumentException when null values are. passed to a method](https://stackoverflow.com/questions/33090701/automatically-throwing-illegalargumentexception-when-null-values-are-passed-to-a)
  - [stackoverflow - IllegalArgumentException or NullPointerException for a null parameter? [closed](https://stackoverflow.com/questions/3881/illegalargumentexception-or-nullpointerexception-for-a-null-parameter?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa)
  - 자매품 null체크할때
    - [stackoverflow - Avoiding != null statements](https://stackoverflow.com/questions/271526/avoiding-null-statements#)
    - [wikipedia - Null object pattern](https://en.wikipedia.org/wiki/Null_object_pattern)
    - 마틴파울러의 리팩토링 책에서 null object pattern 파트에 대해서 읽었는데,일시적으로 사용할때나, 객체가 잘 설계되어있지않거나(역할에 맞게 잘 나누어져있지 않다면. 지금 작업하는 코드에는 부끄럽게도 그런 경우가 많다ㅠ 하... 기존 설계를 손대면 안되는거아닌가. 이것도 방법을 찾아야겠다.) 맞지 않는 방법같다. 

