l <- list(1,2,3)
v <- c(1,2,3)

sum(v)
sum(l) # 리스트 타입은 합 불가. -> is.xxx 활용하여 알고리즘 구현한 것. 

#read file data
# scan 함수는 수치에 특화. 
nums <- scan("data/sample_num.txt") # 공백 단위로 구분하여 벡터로 가져옴
word_ansi <- scan("data/sample_ansi.txt",what="")
words_utf8 <- scan("data/sample_utf8.txt", what="",encoding="UTF-8") # encoding="코드셋명" 줘야 한글 안깨짐
words_utf8_new <- scan("data/sample_utf8.txt", what="")
lines_ansi <- readLines("data/sample_ansi.txt")
lines_utf8 <- readLines("data/sample_utf8.txt",encoding="UTF-8")

df2 <- read.table("data/product_click.log", stringsAsFactors = T) 
# read.csv()와 차이는 구분자가 콤마가 아니라 탭이나 공백 -> read.table()
# 파일 읽어서 데이터프레임 만드는건 똑같음.
# read.table은 기본값으로 컬럼명도 없다고 생각, csv는 첫 열 컬럼명으로 인식.
str(df2)
head(df2)
summary(df2$V2)

# 함수 정의와 활용

func1 <- function() {
  xx <- 10   # 지역변수
  yy <- 20
  return(xx*yy)
}
func1()
#yy
result <- func1()
result
xx  # 오류발생


func2 <- function(x,y) {
  xx <- x
  yy <- y
  return(sum(xx, yy))
}

func2()
func2(5,6) # 식 : 연산식, 호출식, 변수, 리터럴

func3 <- function(x,y) {
  #x3 <- x+1
  #y3 <- y+1
  x4 <- func2(x+1, y+1)  # 값(식) : 변수, 리터럴, 연산식, 호출식
  return(x4)
}

func3(9, 19)  # 30

func4 <- function(x=100, y=200, z) {
  return(x+y+z)
}
func4()
func4(10,20,30)
func4(x=1,y=2,z=3)
func4(y=11,z=22,x=33)
func4(z=1000)  

# 쉬트에 있는 함수 코드
f1 <- function() print("TEST")
f1()
r <- f1()
r
f2 <- function(num) {print("TEST"); print(num) }
f2(100)
f2()
f3<- function (p="R") print(p)
f3()
f3(p="PYTHON")
f3("java")
f4<- function (p1="ㅋㅋㅋ",p2) for(i in 1:p2) print(p1)
f4(p1="abc", p2=3)
f4("abc", 3) 
f4(5) 
f4(p2=5) 
f5<- function(...) { print("TEST"); data <- c(...); print(length(data))}
f5(10, 20, 30)
f5("abc", T, 10, 20)
f6<- function(...) {
  print("수행시작")
  data <- c(...)
  for(item in data) {
    print(item)
  }
  return(length(data))
}
f6()
f6(10)
f6(10,20)
f6(10,20,30)
f6(10,'abc', T, F)

f7<- function(...) {
  data <- c(...)
  sum <- 0;
  for(item in data) {
    if(is.numeric(item))
      sum <- sum + item
    else
      print(item)
  }
  return(sum)
}
f7(10,20,30)
f7(10,20,'test', 30,40) # 벡터는 모든 원소의 TYPE이 동일해야 됨
# 즉, 문자열이 하나있기 때문에 자동형변환룰에 의해 숫자들도 문자열 TYPE으로 변경됨
# 그러므로 2번째 경우 5개 원소 다 화면에 출력됨! 

f8<- function(...) {
  data <- list(...) # 리스트로 만듬
  sum <- 0;
  for(item in data) {
    if(is.numeric(item))
      sum <- sum + item
    else
      print(item)
  }
  return(sum)
}

f8(10,20,30)
f8(10,20,"test", 30,40)

# 리스트로 만들어서 원소 각각 타입에  맞게 처리됨. 
