- 스터디하면서 적은 메모 version 20180503    

## 요구사항 분석
### 주어진 요구사항
- ST-6  TodoManager.delete 구현   
  - delete(Todo) 메소드 구현.
  - TodoRepository.store(todo, should_delete=True)를 호출한다.

### 요구사항 분석
- 조회는 id로 함
- 조회하는 todo가 없을때 IllegalArgumentException을 던짐
- store(todo, true)의 return 값은 null로 함
- 조회하는 todo가 없을때 IllegalArgumentException을 던짐

## 테스트케이스
- delete 호출시,store를 호출하는지
  - store가 true인지와 store가 todo를 받는지
- 조회하는 todo가 없을때 RuntimeException을 던짐
  - Mock의 store가 IllegalArgumentException 던지면 delete가 RuntimeException 던지는지 해야하나? - > Yes

### store Mock 구현
- 실제 todo가 사라지는지는 store(todo, true) 구현의 역할이므로 mock을 사용합시다
- 두번째 인자가 true일때 todo를 삭제
    + assert : 해당 todo 다시 조회하면 null 이어야함
- 두번째 인자가 false일때 무시하고 아무것도 하지 않음
  - [질문] 명세만 해놓고 아무 테스트 기능도 없는데 적어야할까?
- 조회하는 todo가 없을때 IllegalArgumentException 던짐


