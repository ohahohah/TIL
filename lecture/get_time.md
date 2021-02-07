- python 에서 현재 시간 구하기

```python
import datetime
from pytz import timezone, utc  # pytz 패키지 검색해서 가상환경에 설치하기
​
# reference
# 현재 날짜 구하기 https://www.programiz.com/python-programming/datetime/current-datetime
# python 시간대 구하기 https://spoqa.github.io/2019/02/15/python-timezone.html
# pytz 에서 타임존 https://edykim.com/ko/post/pytz-python-library-for-world-time-zone-definition/
​
# timezone 가져오기
KST = timezone('Asia/Seoul')
EST = timezone('US/Eastern')
​
#### UTC-0 시간 구하기
utc_now = datetime.datetime.utcnow()
# 문자열 형식으로 바꾸기
utc_now_str = utc_now.strftime("%Y-%m-%d %H:%M:%S")
print(utc_now_str)
​
#### 한국 시간 구하기
kst_now = utc.localize(utc_now).astimezone(KST)
# 문자열 형식으로 바꾸기
kst_now_str = kst_now.strftime("%Y-%m-%d %H:%M:%S")
print(kst_now_str)
kst_today_str = kst_now.strftime("%Y-%m-%d")
​
#### 미국 동부 EST 시간 구하기
est_now = utc.localize(utc_now).astimezone(EST)
# 문자열 형식으로 바꾸기
est_now_str = est_now.strftime("%Y-%m-%d %H:%M:%S")
print(est_now_str)
```