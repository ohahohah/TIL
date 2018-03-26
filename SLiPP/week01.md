- create에서 id값 무조건 -1 로 함.
- store() 에 todo null 주면 안됨
- validation 실패할때 IllegalArgumentException 
  - 예외메시지 상세내용 ("") 개발자 
  - IAE("에러난필드.todo", cause(있으면))
- Todorepository에서 store() 호출했을떄 그쪽에서 error 던질때 어떻게함? 
  - 삭제하라고 했는데 없을경우 IAE 발생
    - 다시  IAE던짐
  - like DB 다운됨 Repository Fail Exception
    - runtime exception 으로 다시 던짐
  - RuntimeException -> RuntimeException("storage Failed",cause)
- todo가 아닌 null 이 들어올 경우 IAE던짐 
- 0 < id < integerMax

20개 이상?

TestCase - 뭐를 확인해야하는지 리스트
- field validation 확인

- id가_-1인지_확인
- title이_null이면_IllegalArgumentException예외던짐_확인
- title이_50byte이상이면_IllegalArgumentException예외던짐_확인
- 파라미터content가_null이면_content가_emptyString인지_확인
- content가_500byte이상이면_IllegalArgumentException예외던짐_확인
- parameter가_null인경우_IllegalArgumentException예외던짐_확인
- store()에서_IlligalArgumentException던질때_IlligalArgumentException던짐_확인
- store()에서_RepositoryFailException던질때_RuntimeException던짐_확인
- store()에서_RuntimeException던질때_RuntimeException던짐_확인
- id가_범위를_넘을때_


---------
- testCase의 범위? testcase는 경계점에 대해서만 테스트함




