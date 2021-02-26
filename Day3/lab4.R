# 문제 1
L1 <- list(name="scott", sal=3000); L1
result1 <- L1[[2]]*2; result1

# 문제 2
l2 <- list("scott", c(100,200,300)); l2

# 문제 3
l3 <- list(c(3,5,7), c("A", "B", "C"))
l3[[2]][[1]] <- "Alpha"; l3

# 문제 4
l4 <- list(alpha=0:4, beta=sqrt(1:5), gamma=log(1:5)); l4
l4[[1]] + 10 

# 문제 5
emp <- read.csv("c:/hju/Rexam/data/emp.csv")
l5 <- list(data1=LETTERS, data2=emp[1:3,], data3=l4); l5
l5[[1]][1] # 뒤에꺼는 단일 대괄호 쓰는게 좋다. 원소가 벡터니깐.
l5[[2]]$ename; l5$data2$ename
l5[[3]][[3]] # 원소가 리스트이기에 둘다 격대괄호!

# 문제 6
l6 <- list(math=list(95, 90), writing=list(90, 85), reading=list(85, 80))
sum <- 0
for (num in unlist(l6)){
  sum <- sum + num 
  # print(sum) 확인용
}
sum/6

# 다른 방법 (unlist와 mean 활용)
mean(unlist(l6)) # 한꺼번에 리스트 다 벗겨냄

# 문제 7
grade <- sample(1:6, 1)
if (grade<=3){
  cat(grade , "학년은 저학년입니다.", "\n")
} else { # { 옆에 else를 해줘야함. 다음줄에 하면 안됨!
  cat(grade , "학년은 고학년입니다.", "\n")
}
 
# 문제 8
choice <- sample(1:5, 1)
if (choice==1){
  ans <- 300+50
} else if (choice==2){
  ans <- 300-50
} else if (choice==3){
  ans <- 300*50
} else if (choice==4){
  ans <- 300/50
} else {
  ans <- 300%%50 # 나머지 연산
}
cat("결과값 :", ans)

# 문제 9
count <- sample(3:10, 1)
deco <- sample(1:3, 1)
if (deco == 1){
  for (i in c(1:count)){
    cat("*")
  }
} else if (deco == 2) {
  for (i in c(1:count)){
    cat("$")
  }
} else {
  for (i in c(1:count)){
    cat("#") 
  }
}
# if문과 rep("#", count) 2개로 코드 짜도됨.


# 문제 10
score <- sample(0:100, 1)
ans <- score %/% 10
ans <- as.character(ans)
cat(score, "점은", switch(EXPR = ans, "10"=, "9"="A", "8"="B", "7"="C", "6"="D", "F"), "등급입니다.")
# 몫을 활용하여 코드 간소화 시킴

# 문제 11 
for (i in 1:26){
  cat(LETTERS[i], letters[i], sep = "", " ")
}

# 이게 더 정확. 
alpha <- paste(LETTERS, letters, sep=""); alpha
