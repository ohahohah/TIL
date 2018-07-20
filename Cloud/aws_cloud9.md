## Keyword
`cloud 9` `cloud IDE`

## Reference

## 정리
### AWS cloud9 설정하기
#### 설치
- cloud9은 한국에서는 가장 가까운 region이 singapore임
- singapore에서 EC2를 생성하고 나중에 IDE 세팅을 Seoul로 바꾸어줌
  - [질문]서울로 region을 바꾸는게 가능한 이유는?
- shared 할 co-worker들을 초대
- 인터넷으로 접속이 가능하도록 VPC세팅 [질문]VPC 세팅 오류나서 다시 인스턴스 생성함

#### Java 환경설정
- [Java Sample for AWS Cloud9](https://docs.aws.amazon.com/ko_kr/cloud9/latest/user-guide/sample-java.html) 참고해서 세팅
- [](https://docs.aws.amazon.com/ko_kr/devicefarm/latest/developerguide/test-types-web-app-appium-java-junit.html)

#### Python 설정
- 바로 python을 실행했더니 제대로 작동을 안함.
- 세팅이 필요함
- https://docs.aws.amazon.com/ko_kr/cloud9/latest/user-guide/sample-python.html
- unittest 에서 `ImportError: No module named ~` 에러가 발생함
