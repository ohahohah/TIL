## Keyword
`scraping` `scraper`

## summary 세 줄 요약



## Reference
- [ko.wikipedia - 패킷](https://ko.wikipedia.org/wiki/%ED%8C%A8%ED%82%B7) / [wikipedia_Eng - netowrk packet](https://en.wikipedia.org/wiki/Network_packet)
- [How Browsers Work: Behind the scenes of modern web browsers](https://www.html5rocks.com/en/tutorials/internals/howbrowserswork/) / 번역: [Naver-D2 브라우저는 어떻게 동작하는가?](http://d2.naver.com/helloworld/59361)
- [Beautiful Soup 4.4.0 documentation](https://www.crummy.com/software/BeautifulSoup/bs4/doc/#)


## 궁금
 - [궁금] virtualEnv 가상환경 구축 : 가상환경 A 에서 '가'라이브러리 사용, 가상환경 B 에서 '가'라이브러리 사용한다고 하면, 중복으로 '가'라이브러리가 설치되는지, 중앙에서 한번 설치하고 참조해서 쓰는 개념인지? 컴퓨터 하드웨어 자원관리 차원에서 중복설치는 좀...

## 정리 
### ch01. Your First Web Scraper
- [study summary](https://github.com/Incheon170517/python_study_group/blob/master/scraping/%ED%8C%8C%EC%9D%B4%EC%8D%AC%EC%9C%BC%EB%A1%9C%EC%9B%B9%ED%81%AC%EB%A1%A4%EB%9F%AC%EB%A7%8C%EB%93%A4%EA%B8%B0ch01-summary.md)
- [Web] 웹 작동방식
  - What is networking packet : [ko.wikipedia - 패킷](https://ko.wikipedia.org/wiki/%ED%8C%A8%ED%82%B7) / [wikipedia_Eng - netowrk packet](https://en.wikipedia.org/wiki/Network_packet)
  > 패킷(packet, 문화어: 파케트, 소포)은 정보 기술에서 패킷 방식의 컴퓨터 네트워크가 전달하는 데이터의 형식화된 블록이다. 패킷을 지원하지 않는 컴퓨터 통신 연결은 단순히 바이트, 문자열, 비트를 독립적으로 연속하여 데이터를 전송한다. 데이터가 패킷으로 형식이 바뀔 때, 네트워크는 장문 메시지를 더 효과적이고 신뢰성 있게 보낼 수 있다. 패킷은 데이터의 한 단위라고 할 수 있다. (ko.wikipedia - 패킷)
  - [How Browsers Work: Behind the scenes of modern web browsers](https://www.html5rocks.com/en/tutorials/internals/howbrowserswork/) / 번역: [Naver-D2 브라우저는 어떻게 동작하는가?](http://d2.naver.com/helloworld/59361)
- [python] virtualEnv 가상환경 구축
  - 프로젝트별로 사용하는 라이브러리 따로 관리하여 가상환경을 구축
- [lib] [urllib](https://docs.python.org/3/library/urllib.html) 
- [lib] Beautiful Soup는 html을 xml python 객체로 변환
  - 잘못된 html을 xml(well-formed) 로 바꿈
  - python '객체'가 됨