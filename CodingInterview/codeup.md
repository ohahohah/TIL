## memo
- 워밍업으로 codeup 사이트에서 기초 문제 100제 + a 풀기
- 재밌는 문제는 기록

## List

<details><summary>unicode - [1008 : 기초-출력 출력하기08]</summary>

- https://codeup.kr/problem.php?id=1008

  ```python
  print('\u250C\u252C\u2510\n\u251C\u253C\u2524\n\u2514\u2534\u2518\n')
  ```
- https://stackoverflow.com/a/1207479 - unicodedata.normalize
  ```python
  title = u"Klüft skräms inför på fédéral électoral große"
  import unicodedata
  unicodedata.normalize('NFKD', title).encode('ascii', 'ignore')
  >> 'Kluft skrams infor pa federal electoral groe'
  ```
</details>

<details><summary>type casting 주의 - [1012 : 기초-입출력 - 실수 1개 입력받아 그대로 출력하기]</summary> 

- https://codeup.kr/problem.php?id=1012
- input 자체를 형 변환시켜버리자. 그래야 밑에서 타입 형변환 실수가 줄어듦.
- float 로 출력하라고 해서 다시 formatting 해줌
- python 3.6 까지 지원해서 f-string 인식 못함. 

```python
  float_input = float(input())
  # print(f'{float_input:f}')
  print('{:f}'.format(float_input))
```
</details>

<details><summary>multiple input in one line - [1013 : 기초-입출력- 정수 2개 입력받아 그대로 출력]</summary>

- https://codeup.kr/problem.php?id=1013
- 변수명 짧게 쓰기 - input01, input02 대신 x,y
```python
  x, y = map(int,input().split())
  print(x, y)
```
</details>

## referece
Online judge 프로그램 버전 상, python 3.6 이나 3.7 까지만 지원할 수 있음. 해당 버전 기준으로 정리 
- python format string
  - https://docs.python.org/3.7/tutorial/inputoutput.html#tut-f-strings
  - https://docs.python.org/3.7/reference/lexical_analysis.html#f-strings
  - https://docs.python.org/3/library/string.html#format-specification-mini-language
  - https://realpython.com/python-strings/