# security 101
[![License: CC BY-NC-ND 4.0](https://licensebuttons.net/l/by-nc-nd/4.0/80x15.png)](https://creativecommons.org/licenses/by-nc-nd/4.0/)

- 정말 기초 중의 기초만 먼저 봅시다
- 보안 담당자만 보안을 신경써야하나? 서비스(프로덕트)를 만드는 사람으로서 기본적인 보안사항을 점검해야함.

    ['여기어때' 개인정보 99만건 유출...'SQL인젝션' 공격이 원인](https://www.bloter.net/newsView/blt201704260005)

    [[기고] 반복되는 보안 취약점 진단 및 조치, 그 해결 방법은?](https://www.comworld.co.kr/news/articleView.html?idxno=50068)

    - keyword : Secure coding
    - Q. 서비스 개발자만 아는 보안 취약점을 보완해야하나, 어디까지 점검해야하나?

        A. 보안 취약점을 보완하지 않은 합리적 이유가 있는지? 대문을 안 잠구고 활짝 열어둬서 도둑이 들 수 있는데 뭐 그냥 내버려두었어요와 비슷함. 보안 취약점을 인지하고 대책을 마련하지 않았다면 책무를 다하지 않은 것. 우리는 프로개발자(돈 받고 일하는 사람)! 왜 일을 안했죠?ㅠㅠ 책임을 지게 될 수도 있음. 

- 웹 서비스(Web application)에서는
    - 역사적으로는 주로 공격하는 지점이 '서버' 취약점 - Backend!
    - Frontend 는 신경 안 써도 될까?
    - DOM, CSS 를 이용해 browser 를 통해 침투하기도 함. Frontend 도 보안위험을 인지하고 있어야함.
    - UI 에서 커버할 수 있는 보안도 있다! - Frontend
        - 예를 들면, ID/PW 입력시 오류날 경우, '없는 사용자명입니다' 메시지가 뜬다면?
            - attacker 는 해당 ID 의 존재여부를 알 수 있음.
            - '잘못된 정보입니다' 보다 attacker 에게 많은 정보를 주게 됨.
        - wiki.mozilla - WebAppSec/Secure Coding Guidelines

            [WebAppSec/Secure Coding Guidelines](https://wiki.mozilla.org/WebAppSec/Secure_Coding_Guidelines#Preventing_Malicious_Site_Framing_.28ClickJacking.29)

    - 취약점 점검 기준?
        - OWASP Top10, SANS Top 25,...

            [OWASP Top Ten](https://owasp.org/www-project-top-ten/)

        - 웹서버 보안 강화 안내서

            [KISA 인터넷 보호나라&KrCERT](https://www.krcert.or.kr/data/guideView.do?bulletin_writing_sequence=27364)

        - 시큐어코딩 가이드

            [정책자료](https://www.mois.go.kr/frt/bbs/type001/commonSelectBoardArticle.do%3Bjsessionid=fr7QaTyG2gK5o02XJnYETp3havIQ1MGLKMYdWaaEe5me9IOk932SIy2BbP1AM08Z.mopwas54_servlet_engine1?bbsId=BBSMSTR_000000000012&nttId=42152)

## Action

- 실제 회사 소프트웨어에 대한 보안 공격과 방어를 해 봄
    - 우리 프로덕트가 해커 막을 수 있나? 해킹 시도하는 Red team
    - 방어하는 Blue Team - 보안 개선. Red Team 의견 참고해 우선순위 정함.
    - 둘 다 하면 Purple Team
    - 외부에서는 Bug Bounty Hunter (침투 테스터) 가 보안 결함 찾으면 상금 얻어갈 수 있음. 예를 들면, 이런 github bounty hunter 프로그램

        [Bounty hunters](https://bounty.github.com/bounty-hunters.html)

- 창과 방패! 공격과 방어! 우리도 직접 해봅시다.
    - 다른 서비스(우리 서비스) 직접 공격도 해보고!
    - 우리 서비스 보안 취약점 점검해서 방어도 해보고!
    - 기프티콘 걸고 Bug Bounty 도?

### 개념 탑재

- 정말 기초 교양! 개념 탑재
    - CORS
    - CSRF
    - SQL Injection (Injection들 -  command Injection, code Injection)
    - Dos (DDos)
        - 기본적인 서버 부하 이상. 서버에 부담이 가도록 설계해두었거나,  API 요청을 잘못 사용하는 경우와 연관.
    - XSS (특히 FE)
    - DOM Injection (특히 FE)
    - 보안 취약점이 있는 기본 제공 코드(boilerplate code) 사용하고 있지 않나? 성능을 떨어뜨려서 Dos 공격 등등이 가능하게 만드는 코드가 섞여있지는 않나?
        - 예. Flask  의 Debug=True

## Checklist

- *지금 단계에서 시도해볼 수 있는 최소* 보안 101
- [ ]  정적 분석 도구 사용
    - PMD(Java)
- [ ]  000 security checklist 자료 검색해서 적용해보기
    - 예를 들면,
    - node js

        [Nodejs Security - OWASP Cheat Sheet Series](https://cheatsheetseries.owasp.org/cheatsheets/Nodejs_Security_Cheat_Sheet.html)

        [프로덕션 환경의 Express를 위한 보안 우수 사례](https://expressjs.com/ko/advanced/best-practice-security.html)

        [](https://blog.risingstack.com/node-js-security-checklist/)

- [ ]  HTTPS
- 데이터 보호를 위한 DB 보안 설정
    - DB 에 어떻게 접근할 수 있는 권한을 가진 관리자는 누구?
        - [ ]  서버 방화벽
        - [ ]  특정 IP 만 접속 가능하게
        - [ ]  기본 중의 기본 id /pw 관리
        - [ ]  DB 의 admin 계정 관리
        - [ ]  설마 password 평문 저장? hashing 하자! (hashing 도 종류에 따라 더 강할 수 있음. e.g. MD5 < BCrypt)
- 공개된 정보 기록
    - [ ]  노출되면 안되는 API key
        - Github 에 남아있는 API key
            - 지금은 삭제했더라도 history 를 보면 찾을 수 있다던가
    - 그 외 보안 키
        - ssh 키 가 노출되면 서버에 바로 접근해버리기
    - 이메일 주소, 전화번호 등 개인정보가 검색 엔진에서 검색이 되어버림
    - robots.txt 미설정
        - 검색 crawler 가 온갖 페이지를 다 크롤링 해갈 수 있다?
    - snapshot 정보가 어딘가에 저장되어버림
        - archive.org
        - 검색엔진 캐시
        - SNS
    - More 서브도메인 찾아내서 취약한 부분 공격
        - DNS 인 척 하고 정보 얻어내기(zone transfer attack), dictionary  attack, brute force attack

- API 요청
    - [ ]  사용자가 API URL 주소보고 다른 사람 회원정보에도 접근할 수 있다면?
    - [ ]  민감 데이터를 담은 API - URL 주소로 바로 접근할 수 있다?
    - 네트워크 분석 도구 사용해 API request 관찰이 가능
        - 간단하게는 브라우저 개발자도구 Network - XHR 탭
    - 호출 구조 Oauth 어떻게 하고 있는지,...
    - 민감정보를 넘기는 방식을 규칙을 유추해낼 수 있는 url parameter(GET) 로 노출시킨다던가
- CVE 이용하기
    - 000 Frontend Framework 1.12 버전에 보안 취약점이 있다?
        - 내가 찾아내지 않아도 CVE 사용해서 공격할 수도 있음
        - [https://cve.mitre.org/](https://cve.mitre.org/)
    - [ ]  내가 사용하고 있는 lib version 등에 report 된 보안 취약점 있는지 점검
    - [ ]  서버 종류 노출되고 있나?
    - [ ]  직접 공격하지 않더라도 이정도는 해볼 수 있음 (Front-end)
        - 해당 사이트가 어떤 library 사용하고 있는지
        - 어떤 버전을 쓰는지 찾아보기

            ```jsx
            const version = React.version;
            console.log(version)
            ```

    - [ ]  Header 에 웹 서버 정보 그대로 노출하고 있나?
        - 서버 관리로 없애보기
    - DB 정보 알아내기
        - 예를 들면, Object id 가 API 에서 노출된다면 키 생성 알고리즘 찾아봐서 어떤 DB 사용하고 있는지 유추가 가능
- [ ]  특정 정보(페이지 등)에 인증 정보 없이 접근이 가능한가?

## More

- CVSS (Common Vulnerability Scoring System)
    - 만능은 아님!

        [](https://www.boannews.com/media/view.asp?idx=74913)

- 매년 발견되는 Report 동향을 살펴보자. OWASP Top10,...
