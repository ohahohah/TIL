# Python 으로 Web Scraping

- Web Scraping 이란? 웹 페이지에서 특정 정보를 가져오는 것. 신문 기사 스크래핑 📰 ✂️
  - 즉, HTML 구조를 분석해서 정보를 잘라내는 것
1. URL 을 사용해 Request 해서 HTML 코드를 Response로 가져오기
  - requests 패키지 사용
  - 옵션. User-Agent 사용해서 chrome 에서 Request 보낸 것처럼
2. HTML code 에서 내가 원하는 요소 element 만 가져옴
  - DOM 구조 사용 (예. body > h1)
  - Selector 사용 (예. #news)
  - BeautifulSoup4 패키지 사용


## 초 간단 스크래핑 예제
- DOM 구조 이해하며 요소 찾아내기
- Chrome 개발자도구 Inspector 사용
[https://elastic-hugle-d528b6.netlify.app/demo/simple.html](https://elastic-hugle-d528b6.netlify.app/demo/simple.html)

```python
import requests
from bs4 import BeautifulSoup

# Request 설정값(HTTP Msg) - Desktop Chrome 인 것처럼 
headers = {'User-Agent' : 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36'}
url = 'https://elastic-hugle-d528b6.netlify.app/demo/simple.html'

# URL request 해서 HTML 코드를 response 받음.
data = requests.get(url, headers=headers)
# print(data.text)

# BeautifulSoup4 사용해서 html 요소에 각각 접근하기 쉽게 만듦.
soup = BeautifulSoup(data.text, 'html.parser')
# print(soup)
# data.text 와 soup 은 타입이 다릅니다! 접근쉽게 형태를 바꿈.
# print(f'data.text: {type(data.text)} / soup : {type(soup)}')

# HTML의 특정 element요소만 가지고 옴. 
p_el = soup.select_one('body > p')
# print(p_el)
# print('text만 가져오기:' + p_el.text)

# selector 이용 - id 는 유일하므로 더 확실!  
news_el = soup.select_one('#news')
# print(news_el)
# print('text만 가져오기:' + news_el.text)

# 여러 요소 가져오기 
div_els = soup.select('div')
# print(div_els)
# text만 가져오기
# for div_el in div_els:
#     print(div_el.text)

# 여러 요소 가져오기 - selector class
cool_els = soup.select('.cool')
# print(cool_els)
# # text만 가져오기
# for cool_el in cool_els:
#     print(cool_el.text)

# 첫번째 요소만 가져오게 됨
first_div_els = soup.select_one('div')
# print(first_div_els)
# print(first_div_els.text)

# copy selector 사용 - div 4번째 자식 요소
we_cool_el = soup.select_one('body > div:nth-child(4)')
# print(we_cool_el)
# print(we_cool_el.text)


```


## 따릉이 페이지로 정보 정보 가져오기
🔥  문제 분석 먼저!

- 우리는 아래 🚲 따릉이 페이지에서 따릉이 정보를  스크래핑 해올 거에요.
[https://elastic-hugle-d528b6.netlify.app/demo/bikeinfo.html](https://elastic-hugle-d528b6.netlify.app/demo/bikeinfo.html)

- 만약 따릉이 API 정보가 제공되지 않는다면 이렇게 웹 페이지에서 직접 정보를 긁어서 가져와야하죠.
- 여기서 우리는 차례대로 아래 정보들을 가져올 거에요.
    - 거치대 위치 '들'
    - 각 거치대 별 거치대 수
    - 현재 거치된 따릉이 수

1. 템플릿에서부터 시작합시다.
- `[Tutorials.py](http://tutorials.py)` 라는 이름으로 만들어볼게요.

    [💻 코드 - 튜토리얼 01] 템플릿
    ```python
    # requests와 bs4 패키지 사용할 거야
    import requests
    from bs4 import BeautifulSoup

    # 데스크톱 크롬인것럼 요청 - 기기마다 뜨는 웹페이지가 다르게 생겼어요. 모바일과 데스크탑 접속할 때 모양 다르죠?
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36'}

    # GET 요청이라 get 함수
    data = requests.get('https://amazing-wiles-4ebf2c.netlify.app/scraping/bikeinfo.html', headers=headers)

    # BeautifulSoup 형태로 조작할 수 있게 parsing
    soup = BeautifulSoup(data.text, 'html.parser')
    ```

- 이 형태는 대부분 스크래핑 시작할 때 먼저 해주어야하는 것들! 템플릿 이라고 기억해두시면 좋아요.

2. 스크래핑에서도 select 해온다! 

- 화면의 elements 를 선택(select) 해서 가져오는 건 스크래핑도 똑같아요.
    - html 의 parent-children (부모-자식) 인 tree 구조를 이해하고 있으면 편합니다!
- 먼저 가져올 부분을 chrome 개발자도구  Inspect 로 확인해볼까요? 테이블 부분을 선택해보세요. **특징이 될 만한 부분이 뭐가 있을까요?** id? class? 구조?

[💻 코드 - 튜토리얼 02] select 탐구하기

```python
# requests와 bs4 패키지 사용할 거야
import requests
from bs4 import BeautifulSoup

# 데스크톱 크롬인것럼 요청 - 기기마다 뜨는 웹페이지가 다르게 생겼어요. 모바일과 데스크탑 접속할 때 모양 다르죠?
headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36'}

# GET 요청이라 get 함수
data = requests.get('https://amazing-wiles-4ebf2c.netlify.app/scraping/bikeinfo.html', headers=headers)

# BeautifulSoup 형태로 조작할 수 있게 parsing
soup = BeautifulSoup(data.text, 'html.parser')

infos = soup.select('#bike-info')
print(infos)
```
- 이 페이지에서 유일한 부분 (id 이니까요!) 인 정보 보는 페이지를 가져왔어요.

3. 우리가 원하는 정보에 더 가까이 좁혀나가봅시다. 
- 자주 쓰이는 함수인 select_one 과 select 에 대해서도 탐구해보죠.

[💻 코드 - 튜토리얼 03] select_one 과 select

```python
# requests와 bs4 패키지 사용할 거야
import requests
from bs4 import BeautifulSoup

# 데스크톱 크롬인것럼 요청 - 기기마다 뜨는 웹페이지가 다르게 생겼어요. 모바일과 데스크탑 접속할 때 모양 다르죠?
headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36'}

# GET 요청이라 get 함수
data = requests.get('https://amazing-wiles-4ebf2c.netlify.app/scraping/bikeinfo.html', headers=headers)

# BeautifulSoup 형태로 조작할 수 있게 parsing
soup = BeautifulSoup(data.text, 'html.parser')

infos = soup.select('#bike-info > tr')
print(infos)

# select 함수를 쓰니 여기에 해당되는 모든 tag들이 return 되네요!
# print(infos[0])

# select_one 함수를 쓰면 어떻게 될까요? 
# info_one = soup.select_one('#bike-info> tr')
# print(info_one) # 맨 처음 나오는 거 딱 하나의 값만 가져와요. 그래서 이름이 one

```

4. 문제는 한 번에 하나씩 접근! 거치대 위치 정보만 가져와볼게요.

- 방법은 하나만 있는 게 아니랍니다!

[💻 코드 - 튜토리얼 04-1] class명으로 접근하기

```python
# requests와 bs4 패키지 사용할 거야
import requests
from bs4 import BeautifulSoup

# 데스크톱 크롬인것럼 요청 - 기기마다 뜨는 웹페이지가 다르게 생겼어요. 모바일과 데스크탑 접속할 때 모양 다르죠?
headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36'}

# GET 요청이라 get 함수
data = requests.get('https://amazing-wiles-4ebf2c.netlify.app/scraping/bikeinfo.html', headers=headers)

# BeautifulSoup 형태로 조작할 수 있게 parsing
soup = BeautifulSoup(data.text, 'html.parser')

stations = soup.select('.station')
print(stations)
```

[💻 코드 - 튜토리얼 04-2] infos  활용해 접근하기

```python
# requests와 bs4 패키지 사용할 거야
import requests
from bs4 import BeautifulSoup

# 데스크톱 크롬인것럼 요청 - 기기마다 뜨는 웹페이지가 다르게 생겼어요. 모바일과 데스크탑 접속할 때 모양 다르죠?
headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36'}

# GET 요청이라 get 함수
data = requests.get('https://amazing-wiles-4ebf2c.netlify.app/scraping/bikeinfo.html', headers=headers)

# BeautifulSoup 형태로 조작할 수 있게 parsing
soup = BeautifulSoup(data.text, 'html.parser')

infos = soup.select('#bike-info > tr')
print(infos)

for info in infos:
#    print(info)    # info 가 무얼지 모르겠다면 출력해보면 됩니다 

    station_tag = info.select_one('.station')
    station = station_tag.text
# 위 두 줄을 아래처럼 줄여쓸 수도 있어요
#    station = info.select_one('.station').text

     print(station)

```

5. 거치대 수 가져와보기

[💻 코드 - 튜토리얼 05] 

```python
# requests와 bs4 패키지 사용할 거야
import requests
from bs4 import BeautifulSoup

# 데스크톱 크롬인것럼 요청 - 기기마다 뜨는 웹페이지가 다르게 생겼어요. 모바일과 데스크탑 접속할 때 모양 다르죠?
headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36'}

# GET 요청이라 get 함수
data = requests.get('https://amazing-wiles-4ebf2c.netlify.app/scraping/bikeinfo.html', headers=headers)

# BeautifulSoup 형태로 조작할 수 있게 parsing
soup = BeautifulSoup(data.text, 'html.parser')

infos = soup.select('#bike-info > tr')
print(infos)

for info in infos:
    station = info.select_one('.station').text
    rack = info.select_one('.rack').text

    print(station, rack)
```

- 혹시 패턴이 보이시나요? 다시 한번 해 볼까요?

6. 현재 주차되어있는 따릉이 수 가져와보기 

[💻 코드 - 튜토리얼 06] 

```python
# requests와 bs4 패키지 사용할 거야
import requests
from bs4 import BeautifulSoup

# 데스크톱 크롬인것럼 요청 - 기기마다 뜨는 웹페이지가 다르게 생겼어요. 모바일과 데스크탑 접속할 때 모양 다르죠?
headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36'}

# GET 요청이라 get 함수
data = requests.get('https://amazing-wiles-4ebf2c.netlify.app/scraping/bikeinfo.html', headers=headers)

# BeautifulSoup 형태로 조작할 수 있게 parsing
soup = BeautifulSoup(data.text, 'html.parser')

infos = soup.select('#bike-info > tr')
print(infos)

for info in infos:
    station = info.select_one('.station').text
    rack = info.select_one('.rack').text
    parking = info.select_one('.parking').text

    print(station, rack, parking)
```

7.  파란 글씨 부분들의 거치대 이름,  거치대 수, 남은 따릉이 수 가져오기

[💻 코드 - 튜토리얼 07] 

```python
# requests와 bs4 패키지 사용할 거야
import requests
from bs4 import BeautifulSoup

# 데스크톱 크롬인것럼 요청 - 기기마다 뜨는 웹페이지가 다르게 생겼어요. 모바일과 데스크탑 접속할 때 모양 다르죠?
headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36'}

# GET 요청이라 get 함수
data = requests.get('https://amazing-wiles-4ebf2c.netlify.app/scraping/bikeinfo.html', headers=headers)

# BeautifulSoup 형태로 조작할 수 있게 parsing
soup = BeautifulSoup(data.text, 'html.parser')

infos_like = soup.select('#bike-info > tr.like')
# print(infos_like)    # 먼저 출력해서 확인

for info in infos_like:
    station = info.select_one('.station').text
    rack = info.select_one('.rack').text
    parking = info.select_one('.parking').text

    print(station, rack, parking)
```
