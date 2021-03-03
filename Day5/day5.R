test1 <- function() {
  print("test1호출")
}
test1()

r1 <- test1() 
r1 # 마지막으로 출력한 것이 리턴값으로 들어가버림.

test2 <- function() {
  print("test2호출")
  return()
}
test2()

r2 <- test2()
r2 # NULL이 리턴됨, 가급적 리턴함수 쓰는게 좋다.

paste0(c("R"), 1:10) # 공백없이 결합 -> paste0, 벡터 원소끼리 결합!!  
paste0(c("A", "B"), 1:10) # 부족한건 다시 돌아가서 채움

makeVector <- function(type, ...) {
  return(switch(EXPR=type, paste0("A", c(...)), 
                paste0("B", c(...)), 
                paste0("C", c(...)), 
                paste0("D", c(...))))
}
# type 아규먼트 값에 따라 앞 글자 바뀜! 

makeVector(type = 1,1,2,3,4,5)
makeVector(2,100,200,300)
makeVector(3,10,20,30,40,50,60,70,80,90)
makeVector(4,111,222,333,444,555)

v <- c(10,11,20,22,30,33)
evenodd1 <- function(p) if(p %% 2 == 0) return("even") else return("odd")
sapply(v, evenodd1) # 벡터 형태
lapply(v, evenodd1) # 리스트 형태 리턴값

# sapply(v, 함수) : vector의 원소값을 가지고, 한번씩 함수에 호출함. 다만 리턴값은 simple한 형태 (정해지지않음)
# lapply(v, 함수) : sapply랑 같은데 무조건 리턴값 list 객체

evenodd2 <- function(p) {
  if(p %% 2 == 0) # 나머지
    r <- "even" 
  else 
    r <- "odd"
  return("odd")
}
sapply(v, evenodd2)
lapply(v, evenodd2)

# R에도 전역 변수와 지역 변수가 있다.

a<-3;b<-7;c<-11 
ft<-function(a){
  b<-a+10     
  c<<-a+10   # 전역대입연산 (<<-)
  d<-a
  print(a);print(b);print(c);print(d)
  return()  # NULL
} 
print(ft(100))
print(a);print(b);print(c);print(d) 

# 혼공 시작
#return() 함수와 invisible() 함수 

ft.1 <- function(x) return()
ft.2 <- function(x) return(x+10)
ft.3 <- function(x) invisible(x+10) #invisible -> 리턴값 출력하지 않음. 

ft.1(100)
ft.2(100)
ft.3(100) # 리턴값 출력 x

r1 <- ft.1(1000);r1
r2 <- ft.2(1000);r2
r3 <- ft.3(1000);r3

# sleep() 함수

testSleep <- function(second) {
  for(data in LETTERS[1:5]) {
    cat(data)
    Sys.sleep(second) # 코드 실행 시키지않게 유지시켜주는 sleep함수
  }
}

testSleep(1)
testSleep(0)
testSleep(3)

# 매개변수에 전달된 데이터의 타입 채크
testParamType <- function(x){
  if(is.vector(x)) print("벡터를 전달했군요!")
  if(is.data.frame(x)) print("데이터프레임을 전달했군요!")
  if(is.list(x)) print("리스트를 전달했군요!")
  if(is.matrix(x)) print("매트릭스를 전달했군요!")
  if(is.array(x)) print("배열을 전달했군요!")
  if(is.function(x)) print("함수를 전달했군요!")
}

testParamType(c(5,4,2))

# 혼공끝
#dataframe이 list에, list는 vector에 포함 됨 
#list는 원소 1개 짜리 1차원 배열과 같다.
testParamType(100)
testParamType(LETTERS)
testParamType(data.frame())
testParamType(matrix())
testParamType(list())
testParamType(array())
testParamType(mean)

#testParamType1
# 앞서 있던 중복문제 해결. 
testParamType1 <- function(x){
  result <- NULL
  if(is.vector(x)  && !is.list(x)) result <-"벡터를 전달했군요!" # 벡터이면서 리스트가 아닌 것은 벡터 뿐. 
  else if(is.data.frame(x)) result <- "데이터프레임을 전달했군요!"
  else if(is.list(x)) result <- "리스트를 전달했군요!"
  else if(is.matrix(x)) result <- "매트릭스를 전달했군요!"
  else if(is.array(x)) result <- "배열을 전달했군요!"
  else if(is.function(x)) result <- "함수를 전달했군요!"
  return(result)
}

#dataframe이 list에, list는 vector에 포함 됨 
#list는 원소 1개 짜리 1차원 배열과 같다.....

testParamType1(100)
testParamType1(LETTERS)
testParamType1(data.frame())
testParamType1(matrix())
testParamType1(list())
testParamType1(array())
testParamType1(function(){})


#testParamType2
testParamType2 <- function(x){
  result <- NULL
  if(is.vector(x)  && !is.list(x) && is.numeric(x)) {
    result <- sum(x)
  } else {
    stop("숫자 백터만을 원하오!!") # stop함수 활용하여 함수 수행 중단. 
  }
  return(result)
}

testParamType2(1:3)
testParamType2(list(1,2,3))
testParamType2(LETTERS)

#stop() 함수도 알고 가자
testError1 <- function(x){
  if(x<=0)
    stop("양의 값만 전달 하숑!! 더 이상 수행 안할거임..")
  return(rep("테스트",x)) # a를 b횟수만큼 반복.
}

# 문제가 일어날 때 에러메시지 띄우면서 멈춤 -> stop

testError1(5)
testError1(0)



#warning() 함수
testWarn <- function(x){
  if(x<=0)
    stop("양의 값만 전달 하숑!! 더 이상 수행 안할거임..")
  if(x>5){
    x<-5
    warning("5보다 크면 안됨!! 하여 5로 처리했삼...!!")
  }
  return(rep("테스트",x))
}

# warning()은 수행자체를 멈추진 않고, 경고메시지만 출력. 

testWarn(3)
testWarn(10)

test1 <-function(p){
  cat("난 수행함\n")
  testError1(-1)
  cat("나 수행할 까요? \n")
}
test1()

#try() 함수를 알아야 데이터 수집을 편하게 할 수 있다.
#() 안에 에러가 일어나더라도 무시 -> 함수 수행을 멈추지 말고 이어가라! 
test2 <- function(p){
  cat("난 수행함\n")
  try(testError1(-1))
  cat("나 수행할 까요? \n")
}
test2()

# tryCatch 함수
testAll <-function(p){
  tryCatch({  
    if(p=="오류테스트"){
      testError1(-1)
    }else if (p =="경고테스트"){
      testWarn(6)
    }else{
      cat("정상 수행..\n")
      print(testError1(2))
      print(testWarn(3))
    }
  },warning = function(w){
    print(w)
    cat("-.-;;\n")
  },error = function(e){
    print(e)
    cat("ㅠㅠ \n")
  },finally ={
    cat("오류, 경고 발생 여부에 관계없이 반드시 수행되는 부분입니다요..\n")
  })
}

testAll("오류테스트")
testAll("경고테스트")
testAll("아무거나")


f.case1 <- function(x) {
  if(is.na(x)) 
    return("NA가 있슈")
  else
    return("NA가 없슈")
}
f.case1(100)
f.case1(NA)
f.case1(1:6) # 첫번째 원소만 가지고 체크하는 성질 -> is.na 
f.case1(c(10,20,30))
f.case1(c(NA, 20))
f.case1(c(10, NA, 20))

# any()
f.case2 <- function(x) {
  if(any(is.na(x))) # x의 원소가 하나라도 참이면 -> any 
    return("NA가 있슈")
  else
    return("NA가 없슈")
}
f.case2(100)
f.case2(NA)
f.case2(1:6)
f.case2(c(10,20,30))
f.case2(c(NA, 20))
f.case2(c(10, NA, 20))

# all()
f.case3 <- function(x) {
  if(all(is.na(x))) # 이 경우, 모두 다 na여야 true됨. 
    return("모두 NA임")
  else
    return("모두 NA인 것은 아님")
}
f.case3(100)
f.case3(LETTERS)
f.case3(NA)
f.case3(c(NA, NA, NA))
f.case3(c(NA, NA, 10))


#Sys.sleep(초시간) 함수
testSleep <- function(x) {
  for(data in 6:10) {       
    cat(data,"\n")
    if(x)
      Sys.sleep(1)
  }
  return()
}
testSleep(FALSE)
testSleep(TRUE)

# 가변형 인자 테스트
funcArgs1 <- function(...) {
  p <- c(...)
  data <- c(10,15,3,5,17,25)
  for(opt in p) {
    switch(EXPR=opt,
           SUM=, Sum=, sum= print(sum(data)), 
           MEAN=, Mean=, mean= print(mean(data)),
           DIFF=, Diff=, diff= print(max(data) - min(data)),
           MAX=, Max=, max= print(max(data)),
           MIN=, Min=, min= print(min(data)),
           SORT=, Sort=, sort= print(sort(data))
    )
  }
}

funcArgs1()
funcArgs1("SUM", "mean", "Min")
funcArgs1("SORT", "Sort", "sort")





# 가변형 인자 테스트
funcArgs2 <- function(...) {
  p <- c(...)
  data <- c(10,15,3,5,17,25)
  if(is.null(p))
    print(data)
  else 
    for(opt in p) {
      switch(EXPR=opt,
             SUM=, Sum=, sum= print(sum(data)),
             MEAN=, Mean=, mean= print(mean(data)),
             DIFF=, Diff=, diff= print(max(data) - min(data)),
             MAX=, Max=, max= print(max(data)),
             MIN=, Min=, min= print(min(data)),
             SORT=, Sort=, sort= print(sort(data))
      )
    }
}

funcArgs2() 
funcArgs2("SUM", "mean", "Min")
funcArgs2("SORT", "Sort", "sort")




# 사분위수란 측정한 양적 데이터 값을 4등분 했을 때 각 등위에 해당하는 것을 말하며 
# 1/4분위수(25% quantile), 2/4분위수(50% quantile), 
# 3/4분위수(75% quantile), 4/4분위수(100% quantile) 4가지로 나뉜다.
# R에서는 quantile() 함수를 사용한다. 
# 홀수 갯수의 숫자들에 대한 사분위수 계산은 간단하다.
# 전체에서 중간값 : 2/4 분위수
# 2/4 분위수를 기준(포함)으로 양쪽에서 중간값을 구하면 1/4, 3/4 분위수 값이 된다.
o1 <- c(1,2,3,4,5) # 1 2 3 4 5
quantile(o1)

o2 <- c(1,2,3,4,5,6,7) # 1.0 2.5 4.0 5.5 7.0
quantile(o2)

o3 <- c(1,2,3,4,5,6,7,8,9) # 1 3 5 7 9
quantile(o3)

o4 <- c(1,2,3,4,5,6,7,8,9,10,11) # 1.0 3.5 6.0 8.5 11.0
quantile(o4)

o5 <- c(2,4,6,8,10) # 2 4 6 8 10
quantile(o5)

o6 <- c(2,10,16,28,30) # 2 10 16 28 30
quantile(o6)

o7 <- c(2,10,15,28,30,40,45) # 2.0 12.5 28.0 35.0 45.0 
quantile(o7)

o8 <- c(10,12,18,20,25,26,30,32,33,40,50) # 10.0 19.0 26.0 32.5 50.0 
quantile(o8)
summary(o8)

# 짝수 갯수의 숫자들에 대한 사분위수 계산은 다음과 같다.
# 2/4 분위수(중간값) : 중앙의 2개 값의 평균
# 1/4 분위수 : 중간값의 왼쪽 데이터들
#              홀수 갯수 : 중간값 + (중간값의 다음값 - 중간값) * 0.25 
#              짝수 갯수 : 중간값 + (큰값 - 작은값) * 0.25
# 3/4 분위수 : 중간값의 왼쪽 데이터들
#              홀수 갯수 : 중간값 - (중간값의 다음값 - 중간값) * 0.25 
#              짝수 갯수 : 중간값 - (큰값 - 작은값) * 0.25


e1 <- c(1,2,3,4) # 1.0 1.75 2.5 3.25 4.0
quantile(e1)

e2 <- c(1,2,3,4,5,6) # 1.0 2.25  3.5 4.75 6.0
quantile(e2)

e3 <- c(1,2,3,4,5,6,7,8) # 1.0 2.25 4.5 6.25 8.0
quantile(e3)

e4 <- c(1,2,3,4,5,6,7,8,9,10) # 1.0 3.25 5.5 7.75 10.0
quantile(e4)

e5 <- c(2,4,6,8,10,12) # 2 4.5 7 9.5 12
quantile(e5)

e6 <- c(2,5,10,15,18,20) # 2.00 6.25 12.50 17.25 20.00
quantile(e6)

e7 <- c(2,3,10,15,50,100) # 2.00 4.75 12.50 41.25 100.00
quantile(e7)

e8 <- c(1,2,10,14,15,16,27,38)  # 1.00 8.00 14.50 18.75 38.00
quantile(e8)


ls()
length(ls())
save(list=ls(),file="all.rda") # varience will save in "all.rda" of rexam
rm(list=ls())
ls()
load("all.rda")
ls()