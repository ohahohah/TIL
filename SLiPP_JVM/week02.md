## Reference
- https://www.slipp.net/wiki/pages/viewpage.action?pageId=30770252

## JVM Heap과 GC 기본 동작
### Point
- Eden영역이 가득차면 아동
- S0,S1 둘 중 하나는 반드시 비어있어야함. S0,S1 둘다 채워져있을때 JVM이 오동작 했다고 판별

## GC 방식
- CMS , G1 : 무중단이 장점
- G1 
  - 퍼즐의 스페이스가 바뀜(Eden일수도 다른 것일 수도). 모니터링하면 그래프 막대 크기가 바뀜. 다른 GC에도 블록크기를 다르게 할 수 있지만 튜닝이 잘못될 가능성이 있음
  - 영역간(Eden,...)의 비율을 설정할 수 있음

## GC 실험
- [질문] Parallel GC는 aging을 사용해서 히스토그램이 없다? - visual GC공식문서 참고 