## Keyword
`Redundant If`

## Reference

## 상황 / 궁금증

## 정리
- [stackoverflow - redundant-if-statement-warning](https://stackoverflow.com/questions/27233269/redundant-if-statement-warning)
  - Intellij 에서 Inspection code 하다가 redundant-if-statement 이므로 simply 하라는 메시지가 뜸. 
  - 과연 가독성이 높은 건지 의문이 들었음. 성능에 큰 영향을 끼치는 걸까? 아니면 익숙해지지 않아서 그래보이는걸까? if-elseif-elseif 라서 아래 예제랑 좀 경우가 다른거 같은데.
1. simply statement 가 유용해보임 
  ```
  if ( a > b) {
      return true;
  }
  return false;
  ```
simply
  ```
  return a > b;
  ```

2. 왠지 어색해보이는 경우
```
       //Check parameter depend on Action code(args[1])
        if ("0".equals(args[1]) && args.length == 2) {
            return true;
        } else if ("1".equals(args[1]) && args.length == 3 && args[2].length() == 8) {
            return true;
        } else if ("2".equals(args[1]) && args.length == 3 && args[2].length() == 4) {
            return true;
        } else return "3".equals(args[1]) && args.length == 4 && args[2].length() == 8 && args[3].length() == 4;
 ```