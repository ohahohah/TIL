## Keyword
`exception` `python exception`

## Reference
- [점프 투 파이썬 - 예외처리](https://wikidocs.net/30)
- [파이썬 예외 계층도](https://docs.python.org/3/library/exceptions.html#exception-hierarchy)
- [예제로 배우는 Python](http://pythonstudy.xyz/python/article/20-%EC%98%88%EC%99%B8%EC%B2%98%EB%A6%AC)
- [jupyter doc](http://nbviewer.jupyter.org/gist/irobii/014b8aa3574090a0d04a#3.1.5-키보드-단축키)
- [Jupyter notebook 이해하기 by Yong Joon Moon](https://www.slideshare.net/dahlmoon/jupyter-notebok-20160815)
- [28 Jupyter 노트북 팁, 트릭 및 바로 가기](https://www.dataquest.io/blog/jupyter-notebook-tips-tricks-shortcuts/)                

## 정리
### 예외처리에서 배운 것 
- try..else : else를 굳이 쓸 필요있나? 
  - 예외처리가 발생하지 않을때만 else를 실행함.
  - 예외처리하고 싶은 예외만 처리한다. 코드의 의도를 전달하기 좋음. 1번 코드처럼 의도하지 않은 예외(`another_operation_that_can_throw_ioerror()`)발생을 막을 수 있음
1. try - except 
```
try:
    operation_that_can_throw_ioerror()
    # we don't want to catch the IOError if it's raised
    another_operation_that_can_throw_ioerror()
except IOError:
    handle_the_exception_somehow()    
finally:
    something_we_always_need_to_do()
```
2. try - except - else
```
try:
    operation_that_can_throw_ioerror()
except IOError:
    handle_the_exception_somehow()
else:
     # we don't want to catch the IOError if it's raised
    another_operation_that_can_throw_ioerror()
finally:
    something_we_always_need_to_do()
```

- 오늘의 코드
```
try:
    a = [1,2]
    print(a[3])
    4/0
except (ZeroDivisionError, IndexError) as e:
    print(e)
```

- 사용자 정의 예외
  - 통상적으로, Exception 을 상속받음. 하위 Exception도 상속이 가능함. 
```
class MyError(ZeroDivisionError):
    def __str__(self):
        return "0으로 나누기 불가함"
def say_divide(a,b):
    if b == 0:
        raise MyError()
    else:
        print(a/b)

try:
    say_divide(4,2)
    say_divide(4,0)
except MyError as e:
    print(e)
```

### Juypter 단축키 / 매직 명령어 
##### 자주 쓰이는 기능
- 셀에서 command 실행 가능
- Esc + h : 도움말 나옴
- tab : 자동완성
- shift + enter : 실행
- shifr + tab : 함수/객체 정보 조회 / '' + ? : '?' 붙이면 내부 정보 
- '' + ?? : '??' 붙이면 example source 출력

- python 예외처리 
- Juypter 단축키 / 매직 명령어 자주 쓰는 정리 
[ ]정규표현식
[ ]파이썬으로 웹 크롤러 만들기 ch.03

