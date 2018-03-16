## Keyword
`rest` `rest cli` `curl`

## Reference
- [Postman doc](https://www.getpostman.com/docs/) : v6을 기준으로 함(2018/03/14)
  - [intro_to_scripts](https://www.getpostman.com/docs/v6/postman/scripts/intro_to_scripts)
  - [api-testing-tips-from-a-postman-professional](http://blog.getpostman.com/2017/07/28/api-testing-tips-from-a-postman-professional/)
- [TOAST meetup - Postman 개요 / 설치 / 사용법 / 활용 방법](http://meetup.toast.com/posts/107)

## 상황 / 궁금
- 2017년 업무프로젝트로 HttpAPI 서비스를 제공하면서, API 테스트를 위해 postman을 사용했던 내용을 정리.

## 정리
- Postman 소개 

### API 여러 파라미터 호출 편하게 하기
- 테스트를 하다보면, 여러 시나리오를 확인해야할 경우가 있다. test script 작성해 test에 통과하는지 확인
- 요구사항 : 여러 parameter를 입력하여, 응답결과 (actual result - response data)를 파일로 저장
  - 테스트를 실행하지 않고 단순히 결과 파일만을 저장하는 거면, 간단한 스크립트를 짜는게 훨씬 빠름. (단순하고 빠르게 작업하기 위해서 postman을 실행했는데, 빙빙 돌아가는 느낌)
  - 지금 하고 있는 일이 '기존 tool을 서칭 + 사용 익히는 시간' > '직접 프로그래밍 + 스크립트 작성시간' 인지 아닌지 확인해야한다.
  - 결국 간단한 프로그래밍으로 해결(python3, 코드짜고 결과얻는데까지 15분 걸림.)

#### process
1. 여러 parameter를 입력 -> collection run 실행
- 입력할 여러 파라미터 입력해 파일 생성해둠 
  - [docs postman - working_with_data_files](https://www.getpostman.com/docs/v6/postman/collection_runs/working_with_data_files)
  - [blog postman - using-csv-and-json-files-in-the-postman-collection-runner](http://blog.getpostman.com/2014/10/28/using-csv-and-json-files-in-the-postman-collection-runner/)
  - 착각했던 것 : 쿼리파라미터 znCd에 11, 26 값을 넣어주고 싶었음. url에 {{znCd}}를 넣어줌. 아래와 같이 만들었다면 `znCd={{value}}` 로 적어야함.
  ```
  [{
  "path": "znCd",
  "value": "11" 
  }, 
  {
  "path": "znCd",
  "value": "26"
  }]
  ```
  - {{znCd}}를 쓰고 싶다면 json을 아래와 같이 만들어야함. 
  ```
  [{
  "znCd": "11"
  }, {
  "znCd": "26
  }]
  ```

- postman CLI tool인 newman 에서 실행 
  `newman run postman_collection.json -d paramete.csv`
  - [postman doc - newman-run-collection-file-source-options](https://www.npmjs.com/package/newman#newman-run-collection-file-source-options) 참고
  - collection 파일은 postman에서 export함.
    ![export collection](Image/postman_export_collection.png)
- GUI 에서 실행
  - [Starting a collection run](https://www.getpostman.com/docs/v6/postman/collection_runs/starting_a_collection_run)
  - 미리 만들어둔 collection 
2. script 작성
- [stackoverflow - how-to-export-download-response-body-into-an-external-file-from-postman-collection](https://stackoverflow.com/questions/48113414/how-to-export-download-response-body-into-an-external-file-from-postman-collecti) 에서 힌트를 얻음
- [blog postman - Write to your local file system using a Postman Collection](http://blog.getpostman.com/2017/09/01/write-to-your-local-file-system-using-a-postman-collection/)
  - API response결과를 다시 local server 에 post로 넘겨서 결과를 출력하는 스크립트.
  - [ Newman to run a collection and writing the file to your disk](https://github.com/postmanlabs/postman-app-support/issues/3033#issuecomment-301758179) script 사용시, newman이 설치되었는데도 `Error: Cannot find module 'newman'` 가 출력됨.
- [새로운 접근방법] newman으로 collection실행 -> reponse data 를 console.log로 출력 -> 해당 출력값을 파일로 저장 -> 파싱해서 각각의 실행결과를 각각의 파일로 만듦.
