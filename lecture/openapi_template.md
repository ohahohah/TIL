## memo
- Open API 에 request 해서 response(XML) 데이터 중 필요한 부분을 mongodb 에 저장하는 예제
  - 예시 API : 공공데이터 포털 한국수자원공사_물과여행정보 https://www.data.go.kr/data/15038393/openapi.do 

```python
import requests
from flask import json
from pymongo import MongoClient
import xmltodict
# No module name 에러 뜨면 해당 package 설치하기

client = MongoClient('localhost', 27017)
db = client.dbtest

# API URL
url = 'http://opendata.kwater.or.kr/openapi-data/service/pubd/myportal/travel/list'
# header 정보
headers = {'Content-Type': 'application/xml; charset=utf-8'}
# request 할 때 필요한 parameter
params = {'searchTypeCd': '01', 'regionCd': 'HA', 'numOfRows': '1000', 'pageNo': '1', 'serviceKey': '인증코드'}

response = requests.get(url, headers=headers, params=params)

# xml 을 dictionary 형태로 변경
response_dict = xmltodict.parse(response.text)

# 결과값을 익숙한 형태인 dictionary 로 바꾸기
result = json.loads(json.dumps(response_dict))
# print(result)
# print된 결과를 보기 쉽게 바꾸기 : https://jsonformatter.curiousconcept.com/#

# 내가 필요한 값만 가져오기
items = result['response']['body']['items']['item']
# print(items)

# list 니까 for 문으로 list 안의 각 element 에 접근할 수 있음.
for item in items:
    # print(item)
    # print(item['course'])

    # 저장할 데이터 doc 으로 만들어서 저장히기  
    doc = {
        'course': item['course']
    }
    db.river.insert_one(doc)
```