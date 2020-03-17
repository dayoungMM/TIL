# R 설치하기

- R

  - https://cran.r-project.org/bin/windows/base/

- R-Studio

  - https://rstudio.com/products/rstudio/download/

  - ### RStudio Desktop 1.2.5033

- 수업자료

  - ## <Do it! 쉽게 배우는 R 데이터 분석> 저장소

  - https://github.com/youngwoos/Doit_R/#start_r





<br><br>

# 프로젝트 시작

- 실행: ctrl +enter
- 주석 ctrl shift c



# 내장함수로 데이터 추출하기

1. 데이터 불러오기

```
exam <- read.csv("csv_exam.csv")

```

2. 행 추출하기

```
exam[1,] # 1행 추출 
## id class math english science 
## 1 1 1 50 98 50


exam[exam$math >= 80,] # 수학점수가 80점 이상인 행 추출

# 1반 이면서 수학점수가 50점 이상 
exam[exam$class == 1 & exam$math >= 50,]

# 영어점수가 90점 미만이거나 과학점수가 50점 미만 
exam[exam$english < 90 | exam$science < 50,]

```

3. 열 추출하기

```
exam[,1] # 첫 번째 열 추출

exam[, "class"] # class 변수 추출

exam[,c("class", "math", "english")] # class, math, english 변수 추출
```

4. 행, 변수 동시 추출

```
# 행 인덱스, 열 변수명 
exam[5, "english"]

# 행 부등호 조건, 열 변수명 
exam[exam$math >= 50, c("english", "science")]
```

<br>

<br>

## 데이터 구조

- 벡터(Vactor): 1차원/ 한 가지 변수 타입으로 구성

  ```
  # 벡터 만들기
  a <- 1
  a
  
  ```

  

- 데이터 프레임(Data Frame): 2차원 /다양한 변수 타입으로 구성

```
# 데이터 프레임 만들기
x1 <- data.frame(var1 = c(1,2,3),
                 var2 = c("a","b","c"))

```



- 매트릭스(Matrix):2차원/한가지 변수 타입으로 구성

```
# 매트릭스 만들기 - 1~12로 2열
x2 <- matrix(c(1:12), ncol = 2)
x2

```



- 어레이(Array):다차원/2차원 이상의 매트릭스

```
# array 만들기 - 1~20으로 2행 x 5열 x 2차원
x3 <- array(1:20, dim = c(2, 5, 2))

```



- 리스트(List):다차원/서로 다른 데이터 구조 포함

```
# 리스트 생성 - 앞에서 생성한 데이터 구조 활용
x4 <- list(f1 = a,   # 벡터
           f2 = x1,  # 데이터 프레임
           f3 = x2,  # 매트릭스
           f4 = x3)  # 어레이

```



### 함수

```
# 데이터 구조 확인 
 class(a)
```



