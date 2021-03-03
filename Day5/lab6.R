# 문제 1
countEvenOdd <- function(ip){
  even <- 0
  odd <- 0
  if (is.numeric(ip) & is.vector(ip)){
    for (i in ip){
      if (i %% 2 == 0){
        even <- even + 1
      }else{
        odd <- odd + 1
      } 
    }
    return(list(even, odd))
  }else{
    return(NULL)
  }
}

countEvenOdd(c(5,10,12,11,10))
countEvenOdd(c("d",5,5))
countEvenOdd(5)

# is.numeric
# %% -> 나머지

# 문제 2
vmSum <- function(input){
  if (is.vector(input) & !is.list(input)){ # 리스트가 아닌가도 체크해야됨.
    if (is.numeric(input)){
      return(sum(input))
    }else{
      print("숫자 벡터를 전달하숑!")
      return(0)
    }
  }else {
    return("벡터만 전달하숑!")
  }
  
}

vmSum(c(10,5,3))
vmSum(c(10,5,3,"c"))
vmSum(c("b",10,5,3))
vmSum(list(10,5,3))

# 문제 3
vmSum2 <- function(input){
  if (is.vector(input) & !is.list(input)){ # 리스트가 아닌가도 체크해야됨.
    if (is.numeric(input)){
      return(sum(input))
    }else{
      warning("숫자 벡터를 전달하숑!")
      return(0)
    }
  }else {
    stop("벡터만 전달하숑!")
  }
  
}

vmSum2(c(10,5,3))
vmSum2(c(10,5,3,"c"))
vmSum2(c("b",10,5,3))
vmSum2(list(10,5,3))

# 문제 4
mySum <- function(input){
  oddSum <- 0
  evenSum <- 0
  if (is.vector(input) & !is.list(input)){
    for (i in 1:length(input)){
     if (i %% 2 == 1){
       if (is.na(input[i])){
         warning("NA를 최저값으로 변경하여 처리함!!")
         input[i] <- min(input, na.rm = T) #na.rm = T 
         oddSum <- oddSum + input[i]
       }else{
         oddSum <- oddSum + input[i]
       }
     }else{
       if (is.na(input[i])){
         warning("NA를 최저값으로 변경하여 처리함!!")
         input[i] <- min(input, na.rm = T)
         evenSum <- evenSum + input[i]
       }else{
         evenSum <- evenSum + input[i]
       }
     } 
    }
    return(list("oddSum" = oddSum,"evenSum" = evenSum))
  }else if (is.null(input)){
    return()
  }else{
    stop("벡터만 처리 가능")
  }
}

mySum(c(1,2,3,4,5))
mySum(NULL)
mySum(c(1,2,3,4,NA))
mySum(list(1,2,3,4))
mySum(c(4,5,4,NA,10))

# 문제 5
myExpr <- function(input){
  if (!is.function(input)){ #아규먼트로 함수 주는 것 가능. 
    stop("수행 안할꺼임!!")
  }else{
    return(input(sample(1:45,6))) # 한 번에 처리.
  }
}

myExpr(sum)
myExpr(mean)

# input시 괄호를 빼야하는 이유는?

# 문제 6
createVector1 <- function(...){
  data <- c(...)
  if (is.null(data)){
    return(NULL)
  }else if(any(is.na(data))){
    return(NA)
  }else{
    return(data)
  }
}

createVector1()
createVector1(5,4,6,NA)
createVector1(5,4,6,8,5,"재웅")

# 문제 7
createVector2 <- function(...){
  data <- list(...)
  if (is.null(data)){
    return(NULL)
  }else{
    return(data)
  }
}

createVector2(11,2,3,"C")
