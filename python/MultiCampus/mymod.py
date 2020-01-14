
def myfunc(num1, num2):
    return num1 + num2

## if절 조건은 mymod.py를 실행할때만 충족한다
## 다른 파일에서 mymod를 import 해서 쓸 때에는 실행되지 않는다
## test 용도
if __name__ == '__main__':
    print(myfunc(3,5))
