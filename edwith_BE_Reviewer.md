## 1. 웹 프로그래밍 기초  
- 웹이 어떻게 작동하는가?   
    + 클라이언트 / 서버 가 무엇인가  
    + 웹페이지가 보여질 때 클라이언트 요청부터 벡엔드의 응답까지 어떤 과정을 거치는가   
- Web Server / Web Application Server(WAS)   

### 웹이 어떻게 작동하는가?
#### HTTP 프로토콜 이해 (작동방식, Request(요청) / Response(응답) 데이터 포맷)
- HTTP(Hypertext Transfer Protocol)
  - client(e.g. Web Browser)와 Server가 Data(다양한 종류, e.g. image,text,audio,..)를 주고받기 위한(서로 통신하기 위한) protocol(규약,서로 지키도록 협의하여 정하여 놓은 규칙). 
  - 서버 - 클라이언트 모델(client가 request하면 server가 해당 request에 대해 response)의 작동방식을 따름. 
  - HTTP/2 버전까지 등장함. 
- 관련 keyword : 인터넷, 포트, 네트워크, stateful, stateless

#### URL(Uniform Resource Locator)
- 구성 : '프로토콜 종류 - IP주소(도메인 주소),포트번호 - 자원의 위치' 세 부분으로 구성됨 e.g. https://localhost:8080
- 관련 keyword: IP, port

#### Request format  / Respose Format
- 관련 Keyword : Header, request Method, request URI, protocol version
- HEAD, OPTIONS, TRACE 는 어떤 상황에서 사용하는가?
- Quiz 01. 왜 내 RESTful API에서 DELETE 요청은 되지 않을까? (왜 DELETE 요청을 막아놨을까?)
- Quiz 02. 왜 모든 POST가 GET 보다 보안이 뛰어나다고 착각하는 걸까?

#### HTTPS

### Web Browser Rendering
- [How Browsers Work: Behind the scenes of modern web browsers](https://www.html5rocks.com/en/tutorials/internals/howbrowserswork/) / [번역- 브라우저는 어떻게 동작하는가? - D2](https://d2.naver.com/helloworld/59361)

--------
### Wannar Going Deep?
- [책- HTTP 완벽 가이드](http://www.insightbook.co.kr/book/programming-insight/http-the-definitive-guide)(HTTP/1까지 커버. 책 무게만 1.4kg) - [웹 프로그래머를 위한 HTTP 완벽 가이드 읽는 법- 이응준님 블로그](https://blog.npcode.com/2015/06/07/%EC%9B%B9-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%A8%B8%EB%A5%BC-%EC%9C%84%ED%95%9C-http-%EC%99%84%EB%B2%BD-%EA%B0%80%EC%9D%B4%EB%93%9C-%EC%9D%BD%EB%8A%94-%EB%B2%95/)  

#### WWW 관련 concept과 protocol을 정리한 standard & 믿고 볼 수 있는 articles
- [World Wide Web Consortium (W3C) - protocols](https://www.w3.org/Protocols/) 
  - W3C는 WWW(World Wide Web) Standard(표준)를 개발하고 장려하는 국제 컨소시엄으로, 웹의 지속적인 성장을 도모하는 프로토콜과 가이드라인을 개발하여 WWW의 모든 잠재력을 이끌어 내는 것임.
  - 위 문서는 정부,기구,단체 모두 모여 protocol의 concept(개념)에 대한 원본 문서라 할 수 있음
  - w3school은 이것과 관계없다
  - [W3 - RFC 2616-sec10](https://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html)
- [IETF - rfc 1738 - URL](https://www.ietf.org/rfc/rfc1738.txt) 
    + RFC(Request of Comments)는 기술 관련된 새로운 연구, 기법 등의 메모라는 뜻으로 Internet Scociety에서는 RFC메모 형태로 출판한다. 일부 RFC는 IETF(인터넷 국제 표준화 기구)를 통해 인터넷 표준으로 받아들여진다. 한 번 일련번호를 받은 rfc는 수정이 안되고 새로운 번호로 재발행함. 
    + 위 문서는 IETF가 인터넷 표준으로 받아들인 1738 번 RFC 문서로 URL에 관한 내용을 담고 있다
- [MDN Web Docs- An Overview of HTTP](https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview) : mozilla 재단의 프로젝트로, 일부 문서는 한국어로 번역되어 있고, article 작성과 번역을 통해 이 오픈소스 프로젝트에 기여할 수도 있음.

#### 디버깅
- 크롬 개발자도구 의 이해 
