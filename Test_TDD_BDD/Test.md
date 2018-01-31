## Keyword

## Reference
### 외부 
- [JUnit In Action](http://www.aladin.co.kr/shop/wproduct.aspx?ItemId=12075966)
- [Effective Unit Testing - 클린 코드와 좋은 설계를 이끄는 단위 테스트, 한국어판](http://www.aladin.co.kr/shop/wproduct.aspx?ItemId=32953284)

### 직접 정리자료 
- [TIL - EffectiveUnitTesting]()

## 상황/ 궁금증
**In 오픈API 프로젝트**
- 일부 모듈에서 어설프게나마 TDD를 적용시켜보면서 전혀 Unit단위로 test 되고 있지 않다는 것을 느낌.
- 프로젝트 테스트 단계에서 API 단위테스트 시나리오 작성을 상세하게 적은 덕분에 몇 가지 잘못 구현된 부분을 찾음.
- JUnit에서 SpringTest를 설정하다가, TDD가 아니라 JUnit을 하고 있음을 깨닫고, 테스트프레임워크를 익히는 게 아니라 test 설계에 대해 알고 싶다고 생각. 
  - 사족: mapper 로 쿼리 수행 테스트에서, 설정파일 setting을 불러와야했음을 장장 세시간에 걸친 삽질 후 깨달음.

## 진행
- 2018/01/10 ~ 
- 일과 전 오전에 1pomodoro씩 Effective Unit Testing 챕터 읽기
- [ ] 한 번 읽고 난뒤 어떻게 진행할지는 정해야함.

## 정리
### DB test
- query 정상작동 검증 테스트 코드
- 외부 시스템을 호출 혹은 사용하는 경우, 시스템의 정상동작은 검증할 필요 없음. 하지만 정확하게 사용 혹은 호출했는지에 대한 검증은 필요
  - 검증을 위한 기록 log  / e.g 상대시스템에 data 넘겼다던가 log 기록