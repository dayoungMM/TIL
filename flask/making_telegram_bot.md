## 텔레그램 챗봇 만들기

1. 텔레그램 설치

   http://www.telegram.pe.kr/

   

2. 텔레그램에서 @BotFather 과 대화하기

- 챗봇 이름을 두번에 걸쳐 전송
- 두번째 챗봇 이름 전송시에는 끝이 bot으로 끝나도록 하기
- 챗봇 생성 완료 (@<챗봇이름>하면 검색할 수 있다)
- 토큰 복사하기



3. request 요청하는 방법

https://core.telegram.org/bots/api

상기의 사이트를 참고하여 다음과 같은 url로 request 한다.

form : `https://api.telegram.org/bot<token>/METHOD_NAME`

* getme: 봇 정보 가져오기

```
https://api.telegram.org/bot123456:ABC-DEF1234ghIkl-zyx57W2v1u123ew11/getMe
```

- getupdates: 업데이트 상태 보여주기

```
https://api.telegram.org/bot123456:ABC-DEF1234ghIkl-zyx57W2v1u123ew11/getupdates
```

* sendMessage:메세지 보내기

```
https://api.telegram.org/bot<토큰>/sendMessage?chat_id=<보낼 chat_id번호>&text=<메세지>

##아이디 번호를 알고싶다면 bot에게 메세지를 보내고 getupdates로 chat_id를 확인해보자 
```

* 기타 메소드를 알고싶다면 telegram api사이트를 참고



4. app.py 와 html 작성하기

- 유의사항: token과 chat_id는 개인정보로 github등 공개된 공간에 오픈하지 않는것이 좋다
- 따라서 python- decouple을 이용하여 개인정보는 숨겨놓기

```bash
$ pip install python-decouple
```
- .env파일을 만들어 개인 정보 입력하기
```bash
$touch .env
```
- python 파일에서 import 하기 

```python 
from decouple import config
```

