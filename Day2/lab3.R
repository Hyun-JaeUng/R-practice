# 문제 1
str(iris)

# 문제 2
df1 <- data.frame(x=c(1,2,3,4,5), y=c(2,4,6,8,10)); df1

# 문제 3
df2 <- data.frame(col1=c(1,2,3,4,5), col2=c("a","b","c","d","e")
                  ,col3 = c(6,7,8,9,10)); df2

# 문제 4
a <- c("사과","딸기","수박")
b <- c(1800,1500,3000)
c <- c(24,38,13)
df3 <- data.frame(제품명=a, 가격=b, 판매량=c, stringsAsFactors=F); df3

# 문제 5
mean(df3$가격)
mean(df3$판매량)

# 문제 6
name <- c("Potter", "Elsa", "Gates", "Wendy", "Ben")
gender <- factor(c("M", "F", "M", "F", "M"))
math <- c(85, 76, 99, 88, 40)
df4 <- data.frame(name, gender, math)
stat <- c(76,73,95,82,35)
df4$stat = stat # 이렇게 stat 변수 추가해야됨.
df4$score <- df4$math + df4$stat
df4$grade <- ifelse(df4$score>=150,"A",ifelse(df4$score>=100,"B",
                                              ifelse(df4$score>=70,"C","D")))
df4

# 문제 7
myemp <- read.csv("c:/hju/Rexam/data/emp.csv")
str(myemp)

# 문제 8
myemp[3:5,]

# 문제 9
myemp[,-1]

# 문제 10
myemp$ename

# 문제 11
myemp[,c("ename", "sal")] # 중요!

# 문제 12
subset(myemp, myemp$job=="SALESMAN", c("ename", "sal", "job")) # == 두개! 

# 문제 13
subset(myemp, myemp$sal>=1000 & myemp$sal<=3000, c("ename", "sal", "deptno"))

# 문제 14
subset(myemp, myemp$job!="ANALYST", c("ename", "job", "sal"))

# 문제 15
subset(myemp, job=="SALESMAN"|job=="ANALYST", c("ename", "job")) # 열이름만 줘서 명령해도됨

# 문제 16
subset(myemp, is.na(myemp$comm), c("ename", "sal"))
myemp[is.na(myemp$comm), c("ename", "sal")] # 인덱싱 방법도 가능하다. 

# 문제 17
sort(myemp$sal) # 이건 월급 값만 정렬
myemp[order(myemp$sal), ] # df sort시 order가 중요함!!! 
# 오름차순으로 했을 때 본래 인덱스를 가져와서 넣은 것이므로 순서에 맞게 출력됨. 

# 문제 18
dim(myemp)

# 문제 19
table(myemp$deptno)

# 팩터형으로 바꾼 후 summary() 해도 됨.
myemp$deptno = as.factor(myemp$deptno) # factor(myemp$deptno)
str(myemp)
summary(myemp$deptno)

# 문제 20
table(myemp$job) # type에 상관없이 무조건 갯수 카운트
