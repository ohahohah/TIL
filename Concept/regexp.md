## Refrence
- [programmers - RegExp 강의](https://programmers.co.kr/learn/courses/11)
- [hackerrank - RegExp](https://www.hackerrank.com/domains/regex)
- [tryHelloWorld Lecture](https://goo.gl/r4xz6m)  
- [Mindscale Lecture](http://mindscale.kr/course/regex). 

## 정리
- 모르는 내용만 골라서 정리함.
### Introduction 
- Group : (.{3}\\.)(.{3}\\.)(.{3}\\.)(.{3}) vs (.{3}\\.){3}.{3}
- digit == \d non-digit == \D : (\\d{2}\\D){2}\\d{4} -> 06-11-2015
- whitespace(\s [\r\n\t\f]) non-whiteSpace \S
- Word == \w Non-Word Character == \W
- 'non-' -> Upper Case
- start == ^ , End == $ :  ^\\d\\w{4}.$
- [ ] matches only one out of several characters placed inside the square brackets.
- [^] not mathces <br/>

### Character Class, Repetitions, Grouping and Capturing 
- character Range [A-Z][a-z][0-9][가-힣] 
- [a-zA-Z] : lowercase & uppercase 
- Repetitions :  {1,3}: 1,2or3 time / {3,}: 3 or more time / {3}: 3time
- Grouping and Capturing word:
    + word Boundary : \bcat\b -> My *cat* is 
    +  () : boundary
    +  not capture (?: ) 
    +  | : or
- Matching Same Text Again & Again \group_number 
    - e.g.(\d)\1 -> 11,22,33,44 
    - e.g.(\w)(\w)k\1\2 -> abkab , cdkcd
    - e.g.^\\d{2}(-?)(\\d{2}\\1){2}\\d{2}$ -> 12-34-56-78 or 12345678, not 1234-56-78,...
    - e.g. (\2amigo|(go!))+ -> go!go!amigo

### Assertion
Asserts regex_1 to be immediately followed by regex_2. The lookahead is excluded from the match. It does not return matches of regex_2. The lookahead only asserts whether a match is possible or not. 
- Positive lookahead : regExp_1(?=regExp_2)  
                      Asserts regExp_1 to be immediately followed by regex_2
- Negative lookahead : regExp_1(?!regExp_2)
                      Asserts regExp_1 to be immediately followed by not regex_2
- Positive Lookbehind : (?<=regExp_2)regExp_1
                        - Asserts regex_1 to be immediately preceded by regex_2

### Check
- \ba\s*\b (O)  \b^a\s$*\b (x) : '\b \b' is Range.
- [a-zA-Z] : lowercase & uppercase ,not [A-z] because of ASCII range <br/>
cf. [Difference between regex [A-z] and [a-zA-Z]
](http://stackoverflow.com/questions/4923380/difference-between-regex-a-z-and-a-za-z)
- Backreferences To Failed Groups (Think!)
    +  S consists of 8 digits. S may have "-" separator such that string  gets divided in  parts, with each part having exactly two digits.(Eg.12-34-56-78)
    +   \\d{2}((-?)\\d{2}\\1){2}\\d{2} (X)
    +   ^\\d{2}(-?)(\\d{2}\\1){2}\\d{2}$ (O)