## 개요
- (2020.11.06)일하면서, 사이드 프로젝트할 때 사용하는 자주 쓰이는 언어가 되었다. 파이썬 관련 기초 강의를 하면서 수강생들에게 안내한 정보 메모
- (18.01.12)python 언어 자체를 다룬 강의나 책을 본 적이 없음. 데이터사이언스 책에서 나오는 python으로 봄. 기초 문법 강의로 python을 다시 공부하면서 몰랐던 부분을 정리

## 참고
- [Beginners Guide - Python for Programmers](https://wiki.python.org/moin/BeginnersGuide/Programmers)
- [python Doc](https://docs.python.org/3/genindex.html)
- [python tutorial](https://docs.python.org/3/tutorial/index.html)

## List comprehention
- [Python Docs - List Comprehention](https://docs.python.org/3/tutorial/datastructures.html#list-comprehensions)
- [Parkito's on the way - Python list comprehension에 대한 즐거운 이해](https://shoark7.github.io/programming/python/about-list-comprehension-python)
- [mingrammer.com - 파이썬의 Comprehension 소개](https://mingrammer.com/introduce-comprehension-of-python/)


## standard input/ output
### input
- [doc input()](https://docs.python.org/3/library/functions.html#input)

### print
- [doc - print()](https://docs.python.org/3/library/functions.html#print)
- `print(*objects, sep=' ', end='\n', file=sys.stdout, flush=False)`
  - separated by *sep* and followed by *end*
  - print(9,8,7) : 9\n8\n7\n
  - print(9,8,7,sep='\n'): 9\n8\n7 == print('9\n8\n7')
  ```
  print(9,end='')
  print(8, end='')
  print(7)
  # print 987

  print(9,end=' ')
  print(8, end=' ')
  print(7)
  # print 9 8 7
  ```

## Type Conversion
- `print(str(2)+ str(5))` >> 25
- `print(int(3.8))` >> 3
- `print(float(3))` >> 3.0
- `print(int("2")+ int("5"))` >> 7

## 단순 문법
- `print(2 ** 3)` >> 8 / `print(2 ** 3.0)` >> 8.0
- `print(4 / 2)`  >> 2.0 : 나눗셈 연산 무조건 결과값 floating point
- `print("Hello" * 3)` >> HelloHelloHello
- `print("%d일 %s요일. %.2f"" % (day + 1, "월", (1.0 / 3)))` >> 13일 월요일. 0.33

## String
```python
word = "qwer" 
print(word[0]) # q
```

## 반복문 - for
- Using with range statment(`range(start, stop[, step])`) [API](https://docs.python.org/3/library/stdtypes.html#ranges)/[tutorial](https://docs.python.org/3/tutorial/controlflow.html#the-range-function) 
```python
for i in range(0,10):
    print("Say Num", i)) # 0 ~ 9

for n in range(6,0,-1):
    print(n) # prints [6, 5, 4, 3, 2, 1]

for fruit in ['사과', '딸기', '복숭아']:
     print(fruit)

sample_str = 'Python'
for letter in my_str:
     print(letter)

for letter in 'python':
     print(letter)

singers = ['Aretha Franklin', 'Ray Charles', 'John Lennon']
for i, singer in enumerate(singers):
  print('{}번: {}'.format(i + 1, singer))
```

- 입력받은 문자만큼(띄어쓰기 유지) 멍멍을 출력 (e.g. 우리 모두 춤춰요 -> 멍멍멍멍 멍멍멍멍 멍멍멍멍멍멍)
```python
user_input = input().split(" ")

for word in user_input:
    for letter in word:
# for i in range(len(user_input)):
    # for j in user_input[i]:
        print("멍멍",end='')
    print("",end = ' ')
```

- count 숫자 에서부터 1까지 하나씩 줄어들면서 출력
```python
count = 10

for i in range(10):
    print("count: ", count)
    count-=1

#for i in range(0,count):
#    print("count: " , count - i)

#for i in range(count,0,-1):
#     print("count: ",i)
```

- 함수 객체 : 함수 정의로 생성된 값. 함수의 이름은 함수 객체를 참조하는 변수.
```python
def do_twice(func, arg):
    func(arg)
    func(arg)
# not print_twice()! 함수 객체를 참조하는 '변수'인 함수 이름을 적어야하므로
do_twice(print_twice, 'spam') 
```
