## 개요
- 참고
  - [인터넷 obeythetestinggoat 최신판(2판) - ebook](https://www.obeythetestinggoat.com)
  - [번역서 -  파이썬을 이용한 테스트주도개발(1판)](http://www.yes24.co.kr/24/goods/16886031)
  - [lhy blog - 최신판과 번역서 차이 비교](https://lhy.kr/tdd-with-python)
  - [Django 2.1 공식문서(한글)](https://docs.djangoproject.com/ko/2.1/intro/)
  - 
- Django에 대해 학습한 것과 TDD 에 대해 학습한 것을 나누어서 적는다.

## 풀잎스쿨용 실습 준비
-  이하 가이드에서는 사용한 레퍼런스가 무엇인지 표기함. DjangoGirls tutorial 는 [dgt], obey the testing goat는 [ottg]로 표기.
- [ottg 실습코드](https://github.com/hjwp/book-example) : 실습은 타이핑부터 기본. 중간에 오류로 실습을 따라가지 못할 경우의 풀잎이들만 사용.

### 설치
- 초반에는 IDE 사용 자제. 코드에디터를 사용하도록 함.
- python3.x(3.6), Django 1.11 사용
  - python2 를 사용하지 않도록 함
- [dgt] venv를 사용할 수 있는 풀잎이의 경우엔 `sudo` 설치대신 venv 사용하도록 유도함. venv에 어려움을 겪을 경우 sudo로 설치. 가이드에 django 2.0.0으로 되어있으므로 주의.


#### pip 설치 
- python3 가 설치되어있는데 `command not found: pip3` 등의 메시지가 나올 때, https://pip.pypa.io/en/stable/installing/ 의 안내를 따라 설치하도록 함. 


## 개인학습용

## 사전 준비
- 번역판 대신 인터넷 최신판에 있는 설정을 따름
  - https://www.obeythetestinggoat.com/book/pre-requisite-installations.html
- 최신판과 번역판의 명령어들이 조금씩 다를 수 있다. 때로는 결과메시지도 다름. 
- 책대로 설정된 `virtualenv` 가 활성화되어있는지 확인하고 작업할 것
  - 여기서는 최신판과 다르게 python3.6, django(최신판), selenium<4 를 사용했다
  - [여기](https://stackoverflow.com/questions/34827566/attributeerror-module-html-parser-has-no-attribute-htmlparseerror)와 같이 django와 python 버전이 안맞는 문제가 있었기 때문이다
  ```bash
  > python3.6 -m venv virtualenv
  ```
  `pip install "django" "selenium<4"`

```bash
$ source virtualenv/bin/activate # virtualenv 활성화
(virtualenv)$
(virtualenv)$ which python # 어떤 python 사용하고 있는지 확인
/home/myusername/python-tdd-book/virtualenv/bin/python
(virtualenv)$ deactivate # virtualenv 비활성화
$
$ which python
/usr/bin/python
```

## ch01
- conda 환경에서 selenum install : https://anaconda.org/conda-forge/selenium 
- selenium 실행 에러 - 마지막 줄- geckodriver 없음 : https://stackoverflow.com/questions/40208051/selenium-using-python-geckodriver-executable-needs-to-be-in-path
```
> python3 functional_test.py
Traceback (most recent call last):
  File "/Users/syo/anaconda3/lib/python3.6/site-packages/selenium/webdriver/common/service.py", line 76, in start
    stdin=PIPE)
  File "/Users/syo/anaconda3/lib/python3.6/subprocess.py", line 709, in __init__
    restore_signals, start_new_session)
  File "/Users/syo/anaconda3/lib/python3.6/subprocess.py", line 1344, in _execute_child
    raise child_exception_type(errno_num, err_msg, err_filename)
FileNotFoundError: [Errno 2] No such file or directory: 'geckodriver': 'geckodriver'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "functional_test.py", line 4, in <module>
    browser = webdriver.Firefox()
  File "/Users/syo/anaconda3/lib/python3.6/site-packages/selenium/webdriver/firefox/webdriver.py", line 164, in __init__
    self.service.start()
  File "/Users/syo/anaconda3/lib/python3.6/site-packages/selenium/webdriver/common/service.py", line 83, in start
    os.path.basename(self.path), self.start_error_message)
selenium.common.exceptions.WebDriverException: Message: 'geckodriver' executable needs to be in PATH.
```
- 1장  에러 메시지 - 'Unable to Connect'가 맞음 - selenium.common.exceptions.WebDriverException: Message: Reached error page: abo
  ut:neterror?e=connectionFailure&u=http%3A//localhost%3A8000/[...] 

### Django 구조
- [ ] `django-admin startproject superlists .` 과 `django-admin startproject superlists` 차이 : manage.py 의 위치가 다름. manage 범위가 다른 걸까?

```bash
> `django-admin.py startproject superlists .`
> tree ../../django/testinggoat/superlists
../../django/testinggoat/superlists
├── manage.py
├── functional_tests.py
├── geckodriver.log
└── superlists
    ├── __init__.py
    ├── settings.py
    ├── urls.py
    └── wsgi.py
└── virtualenv
    ├── [...]
```
- superlist/superlist 폴더가 사이트 전역에 걸쳐서 적용됨
  - settings.py 가 사이트 전역에 걸쳐서 적용됨
- manage.py : 맥가이버칼. 개발 서버를 가동시키는 역할도 함
  - `python3 manage.py runserver`


