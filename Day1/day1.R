v1 <- 1:10 
v2 = 10:1
print(v1)
v2
v3 <- 100
v3
v1 <- c(4,1,8,6,10) # c() 함수에는 아규먼트를 원하는 만큼 전달 가능.
v2 <- c(100,200, TRUE, FALSE); print(v2) # 벡터는 동일한 타입만 가능하기에 논리형이 수치형으로..
v3 <- c("100", 200, T, F); print(v3) # 다른 타입이기에 문>수>논 순으로 자동변환됨
v1[5]; v1[3]; v1[1]; v1[0]; v1[6]
length(v3)

rep(1, 100) # 1이 100번 반복
rep(1:3, 5) # 1,2,3 이 5번 반복, 15개
rep(1:3, times=5) # 키워드 파라미터
rep(1:3, each=5) # 각각, 1 쭉 2쭉 3쭉~ 
?rep  #help()

LETTERS
letters
month.name
month.abb
pi

LETTERS;letters;month.name;month.abb;pi

LETTERS[1]; LETTERS[c(3,4,5)]
LETTERS[3:5]; LETTERS[5:3]
LETTERS[-1]; LETTERS[c(-2,-4)] # 음의 값 인덱스: 제외하는 의미

length(LETTERS)
length(month.name)
length(pi)


x <- c(10,2,7,4,15)
x
print(x)
class(x) # x의 type 
rev(x) # reverse
range(x)
sort(x)
sort(x, decreasing = TRUE) # 내림차순
sort(x, decreasing = T)
#x <- sort(x)
order(x) # 오름차순한 x값들의 본래 인덱스를 출력! 



x[3] <- 20
x
x + 1 # 작은 것이 큰것 만큼 갯수 맞춰지고 플러스 연산
x <- x + 1
max(x);min(x);mean(x);sum(x)
summary(x) # 기초통계량 구하기

x[c(2,4)] # x[2], x[4], x의 인덱스에 해당되는 원소값 꺼내기.
x[c(F,T,F,T,F)] # x[c(T,F)] 
x > 5 # 각각의 원소가 5보다 큰지 따지는 것 - T,F로 출력
x[x > 5] # 5보다 큰 값이 출력
x[x > 5 & x < 15] # x[x > 5 && x < 15] 
#x[x > 5 | x < 15]
# and: &, or: | 
# &&, ||: 벡터의 무조건 첫번째 원소만 대상으로 생각하는 것.

names(x) # 네임 벡터
names(x) <- LETTERS[1:5] # 네임 벡터 지정
names(x) <- NULL
x[2];x["B"];


# &, &&
c(T, T, F, F) & c(T, F, T, F)
c(T, T, F, F) | c(T, F, T, F)
c(T, T, F, F) && c(T, F, T, F)
c(T, T, F, F) || c(T, F, T, F)


ls() # 지금까지 만든 변수들의 리스트가 나옴
rm(x) 
x
class(x)

rainfall <- c(21.6, 23.6, 45.8, 77.0, 
              102.2, 133.3,327.9, 348.0, 
              137.6, 49.3, 53.0, 24.9)
rainfall > 100
rainfall[rainfall > 100]
which(rainfall > 100) # 조건식이 참인 경우 -> 인덱스 값 가져옴.
month.name[which(rainfall > 100)]
month.abb[which(rainfall > 100)]
month.korname <- c("1월","2월","3월",
                   "4월","5월","6월",
                   "7월","8월","9월",
                   "10월","11월","12월")
month.korname[which(rainfall > 100)]
which.max(rainfall) # 최댓값의 인덱스
which.min(rainfall)
month.korname[which.max(rainfall)]
month.korname[which.min(rainfall)]


sample(1:20, 3) # 랜덤으로 1부터 20에서 3개 추출, 중복 X
sample(1:45, 6)
sample(1:10, 7)
sample(1:10, 7, replace=T) # 중복 허용은 replace=T

paste("I'm","Duli","!!") # 3개의 문자열을 결합, 사이사이 공백들어감. 
paste("I'm","Duli","!!", sep="") # 중간에 구분자 설정하는 방법
paste0("I'm","Duli","!!")

fruit <- c("Apple", "Banana", "Strawberry")
food <- c("Pie","Juice", "Cake")
paste(fruit, food) # 각 순서에 맞게 두개 문자열결합

paste(fruit, food, sep="")
paste(fruit, food, sep=":::")
paste(fruit, food, sep="", collapse="-") # collapse 설정을 통해이을수 있음
paste(fruit, food, sep="", collapse="")
paste(fruit, food, collapse=",")




