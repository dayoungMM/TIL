### if
a = 30
if a>30:
    print("30 초과입니다")
elif a<=20:
    print("20 이하입니다")
else: 
    print(" 둘다 아닙니다")

if 30<= a and a<150:
    print("두 조건에 부합합니다")

elif a>150 or a>10:
    print("둘 중 하나가 맞습니다.")


### while
n = 0

while n<3:
    print("출력")
    n= n+1


numbers = list(range(1,3))

for i in numbers:
    print("넘버는 {}".format(i))
