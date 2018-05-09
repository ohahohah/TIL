## Keyword
`java` `basic`

## 상황 / 궁금증
- Java를 사용하면서 패러다임 외에도 모르는 문법들이 많아서 해당 부분을 정리 
  - 공개 리포지토리에 올려둔 코드의 경우, 해당 코드의 url을 함께 적음
  - java 내부 구현코드를 함께 적음(구현코드가 30줄을 넘어가지 않을 경우)

## 정리
- instanceof
- Arrays.asList
- Arrays.equals(actual, expected) : array의 내용 비교
  ```
  public static boolean equals(Object[] a, Object[] a2) {
        if (a==a2)
            return true;
        if (a==null || a2==null)
            return false;

        int length = a.length;
        if (a2.length != length)
            return false;

        for (int i=0; i<length; i++) {
            Object o1 = a[i];
            Object o2 = a2[i];
            if (!(o1==null ? o2==null : o1.equals(o2)))
                return false;
        }

        return true;
    }
  ```
  - actual.equals(expected) : hashcode? 
