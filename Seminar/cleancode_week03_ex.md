## Keyword
`TDD ex` `codesquard`

## 상황 
- 클린코드 실습하면서 메모해서 정리해야할 것들 자유롭게 메모해둠

## Inbox
- map 의 새로운 활용 - Java8 
  - https://stackoverflow.com/questions/4157972/how-to-update-a-value-given-a-key-in-a-java-hashmap
  ```java
  /**package lotttoOlder class Lottos */
        //TODO enum if else if 말고 순환해서 매핑할 수도 있지 않을까? for(Fruit f : Fruit.values()){
      //            System.out.println(f+", "+f.getColor());
      //        }

//      TODO 이거 왜 값 안더해지는지 정리         result.put(LottoInfo.SECOND.getMapKey(),result.getOrDefault(LottoInfo.SECOND.getMatchNum(), 0) + 1);
//      TODO 람다쓸때 더하기 왜 안되는지 정리 result.computeIfPresent(LottoInfo.SECOND.getMapKey(), (k, v) -> v + 1);

//바꾼 코드
      int sameNumCount = l.countSameNum(jackpot);

      for(LottoInfo li : LottoInfo.values()){
        if(li.getMatchNum() == sameNumCount){
          result.merge(li.getMapKey(),1,Integer::sum);
        }
      }

//      if (l.countSameNum(jackpot) == LottoInfo.FIRST.getMatchNum()) {
//        result.merge(LottoInfo.FIRST.getMapKey(), 1, Integer::sum);
//      } else if (l.countSameNum(jackpot) == LottoInfo.SECOND.getMatchNum()) {
//        result.merge(LottoInfo.SECOND.getMapKey(), 1, Integer::sum);
//      } else if (l.countSameNum(jackpot) == LottoInfo.THIRD.getMatchNum()) {
//        result.merge(LottoInfo.THIRD.getMapKey(), 1, Integer::sum);
//      } else if (l.countSameNum(jackpot) == LottoInfo.FOURTH.getMatchNum()) {
//        result.merge(LottoInfo.FOURTH.getMapKey(), 1, Integer::sum);
//      }

  ``` 


- 뭐하냐
```
public class LottoResult {

//  int match3Count;
//  int match4Count;
//  int match5Count;
//  int match6Count;

  Map<String, Integer> matchNumresult;

  public LottoResult(Map<String, Integer> matchNumresult) {
//    TODO match3Count 애네들 무슨 의미야? -> map이  ("3",2) -> 3개 일치가 2개 있음-> 별루다
//    this.match3Count = map.getOrDefault(LottoInfo.FOURTH.getMatchNum(), 0);
//    this.match4Count = map.getOrDefault(LottoInfo.THIRD.getMatchNum(), 0);
//    this.match5Count = map.getOrDefault(LottoInfo.SECOND.getMatchNum(), 0);
//    this.match6Count = map.getOrDefault(LottoInfo.FIRST.getMatchNum(), 0);
    this.matchNumresult = matchNumresult;
  }
```

- Java 8 에서 string return
```
//Lotto
public String showNum(String delimiter) {
    return actualNums.stream().map(Object::toString)
        .collect(Collectors.joining(delimiter));
  }
```

-------
## test 오류
- 유닛 테스트에서는 통과했는데 엉뚱한 결과가 나옴
```
구입금액을 입력해 주세요.
14000
14개를 구매했습니다.
[9, 12, 23, 30, 37, 44]
[1, 21, 25, 28, 30, 37]
[4, 17, 20, 33, 40, 42]
[5, 14, 30, 34, 38, 45]
[11, 20, 30, 36, 40, 41]
[4, 12, 28, 30, 37, 41]
[3, 9, 12, 17, 23, 39]
[2, 10, 12, 24, 31, 43]
[8, 27, 32, 37, 38, 43]
[22, 25, 26, 27, 36, 37]
[5, 13, 16, 29, 35, 43]
[17, 26, 29, 35, 41, 44]
[9, 10, 13, 20, 34, 38]
[2, 6, 12, 14, 36, 37]
지난 주 당첨 번호를 입력해 주세요.
9,12,23,30,37,44
  당첨 통계
---------
6개 일치 (2000000000원)- 2개
5개 일치 (1500000원)- 2개
4개 일치 (50000원)- 2개
3개 일치 (5000원)- 2개
총 수익률은 1.4285785714285715E7%입니다.

Process finished with exit code 0

```
- 유닛테스트로 커버안되는 부분이 많음 TDD하다가 구현만 하는 파트 있었음
