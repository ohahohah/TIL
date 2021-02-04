- [여러 버전의 파이썬 관리하기 (pyenv)
Jan 11, 2020 - by Dale Seo](https://www.daleseo.com/python-pyenv/)
  - pyenv 동작 안되는 문제 설정에서 alias 삭제로 해결함.  
  https://github.com/pyenv/pyenv/issues/849#issuecomment-773221432

- 파이썬에서의 접근자 
- 오늘의 코드를 쓴 이유를 적자

## [궁금 / 해결] random.seed() 왜 하죠? etc 참고 
```python
random.seed(datetime.datetime.now())
random.seed(3):  
```

- [python random.seed() 예제](https://www.tutorialspoint.com/python/number_seed.htm) : 같은 seed값을 넣으면 같은 난수를 생성함.
- [Random 함수 난수 발생 - C언어](http://simplesolace.tistory.com/entry/Random-함수-난수-발생)
같은 seed 값을 입력하면 같은 값이 생성되므로, 언제나 다른 seed 값을 넣어줘야함. 현실적으로 매번 다른 값 입력하는 것이 불가능하므로 날짜시간같은 항상 변하는 값을 넣어주도록 함.
- [python API](https://docs.python.org/3/library/random.html#random.seed) : default로 언제나 변하는 값을 seed값으로 함.
> random.seed(a=None, version=2). Initialize the random number generator.
If a is omitted or None, the current system time is used. If randomness sources are provided by the operating system, they are used instead of the system time (see the os.urandom() function for details on availability).

## Web scraping vs Web crawler
- [wikipedia - Web scraping](https://en.wikipedia.org/wiki/Web_scraping)
  > A Web crawler, sometimes called a spider, is an Internet bot that systematically browses the World Wide Web, typically for the purpose of Web indexing (web spidering).
- [wikipedia - Web crawler](https://en.wikipedia.org/wiki/Web_crawler)
  > Web scraping, web harvesting, or web data extraction is data scraping used for extracting data from websites.[1] 
- [Web Crawling: Data Scraping vs. Data Crawling](https://www.promptcloud.com/data-scraping-vs-data-crawling/)






