### venv(가상환경)사용하기

- venv 설치

  python -m venv venv

-  venv 열기

source venv/Scripts/activate

- venv 해제

deactivate

- 설치된 패키지를 requirements.txt에 리스트로 저장하기

  pip freeze > requirement.txt

- 저장했던 패키지 리스트를 한번에 설치

pip install -r requirement.txt



### 크롤링에 필요한 파이썬 패키지

*  pip install requests
  * import requests
* pip install beautifulsoup4
  * from bs4 import BeautifulSoup



### 네이버 증권에서 코스피 지수 크롤링하기

```python
import requests
from bs4 import BeautifulSoup

url = "https://finance.naver.com/sise"

# request = requests.get(url)
request = requests.get(url).text

soup = BeautifulSoup(request, 'html.parser')
elements = soup.select_one("#KOSPI_now").text

print(elements)

```



### 네이버 증권에서 US 달러 환율정보 가져오기

```python
import requests
from bs4 import BeautifulSoup

url = 'https://finance.naver.com/marketindex/'

response = requests.get(url).text
dom = BeautifulSoup(response, "html.parser")
element = dom.select_one("#exchangeList> li.on >a.head.usd> div>span.value").text
print(element)
```





### 네이버 실시간 검색어 크롤링하기

```python
import requests
from bs4 import BeautifulSoup

url = "https://www.naver.com/"
    
response = requests.get(url).text

dom = BeautifulSoup(response, "html.parser")
elements = dom.select("div.ah_roll.PM_CL_realtimeKeyword_rolling_base > div > ul > li > a > span.ah_k")
elements

ls = []
for element in elements:
    ls.append(element.text)
    # print(element.text)

print(ls)

```

