## Keyword
`docker`

## 상황
- 20180906
  - 회사에서 윈도우즈 노트북을 사용하고 있는데, 개발은 맥북에서 작업할 예정이라 이중으로 서버환경을 구축하는 것보다 편할 것 같아서 도커를 사용해서 환경을 구축해보려고함
  - 아직 docker에 대해서 알아가는 중이라 이중으로 설정하는 품보다 docker가 편할지, docker에서 개발하는게 나을지 확인해보아야함
  - 나중에 개발자에게 프로젝트 인수인계 해줄때 해당 환경을 전달하는게 더 낫지 않을까 하는 생각도 있음

## Reference
- [subicura blog - 초보를 위한 도커 안내서 - 도커란 무엇인가?](https://subicura.com/2017/01/19/docker-guide-for-beginners-1.html)
- [popit - 개발자가 처음 Docker 접할때 오는 멘붕 몇가지](http://www.popit.kr/%EA%B0%9C%EB%B0%9C%EC%9E%90%EA%B0%80-%EC%B2%98%EC%9D%8C-docker-%EC%A0%91%ED%95%A0%EB%95%8C-%EC%98%A4%EB%8A%94-%EB%A9%98%EB%B6%95-%EB%AA%87%EA%B0%80%EC%A7%80/)
- [Minimum hardware requirement to run Docker](https://forums.docker.com/t/minimum-hardware-requirement-to-run-docker/28072/5)
- [docker - Get started ](https://docs.docker.com/get-started/)
- [raccoony Blog - Docker (Compose) 활용법 - 개발 환경 구성하기](http://raccoonyy.github.io/docker-usages-for-dev-environment-setup/)
- [Docker 한글 문서 / 영상 모음집](http://documents.docker.co.kr/)
- [pyrasis - 가장 빨리 만나는 도커(Docker)](http://www.pyrasis.com/private/2014/11/30/publish-docker-for-the-really-impatient-book)

## 정리
0. 설치 전, 설치할 개발 환경 spec을 조사
- 해당 서버 환경 정보를 요청하고, 이번에 만든 사내 wiki에 업데이트함. 
- 이번 프로젝트는 DB서버와 솔루션 설치 서버, 데이터 분석 서버 등 여러 서버에서 분리되어 있음
- [ ] Docker환경에서도 다른 서버와 연동이 되는지 확인
- [ ] 형상관리(svn) 어떻게 하지?
- [ ] ant로 deploy 하는데 가능한가?

2. 설치 
- [ ] 외부 시스템 
- 환경 cent os 6.10 / java 8 / tomcat 8.5
0) docker 설치 
- docker for mac 
1) cent os 
- cent os 설치 
- 기본 설치 
- [리눅스 디렉토리 구조](http://webdir.tistory.com/101)
2) JDK 설치







