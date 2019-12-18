## list 
array = [1,2,3,"four","five","six",True]
print(array[:3])

dust = {
    '영등포구': 50,
    '강남구' : 40
}

## Dictionary
print(dust['영등포구'])
dust2 = dict(abc=50)
print(dust2)


## 랜덤으로 coffee메뉴 3개 뽑기
import random

coffee = ['아아','뜨아','라떼','믹스','핫초코']

coffee_fav=coffee[1:4] #내가 좋아하는 메뉴 일부 출력
print(coffee_fav)


ls = []
while True:
  a = random.choice(coffee)
  if a not in ls:
    ls.append(a)
  if len(ls) ==3:
    break
print(ls)

### range
b= list(range(1,10))
print(b)

### 랜덤으로 오늘의 점심메뉴 식당과 전화번호 출력하기
import random

manu = ['20층','양자강','김밥카페','순남시래기','바나프레소']

phone_book = {
    '20층' : '02-1233-4444',
    '양자강' : '02-4444-5555',
    '김밥카페' : '02-6666-7777',
    '순남시래기' : '02-8888-9999',
    '바나프레소' : '02-1000-2222'
}

today_manu = random.choice(manu)
today_num = phone_book[today_manu]
print("오늘의 메뉴:{}, 전화번호는:{}".format(today_manu, today_num))

# print(dir(random))

