# 문제 1
exam1 <- function(){
  ans <- paste(LETTERS, letters, sep = "") #paste0 사용 가능
  return(ans)
}
exam1()

# 문제 2
exam2 <- function(n){
  sum <- 0
  for (i in 1:n){
    sum <- sum + i
  }
  return(sum)
}
# sum 함수 이용해도 됨! return(sum(1:num))
exam2(9)

# 문제 3
exam3 <- function(a,b){
  if (a>=b) ans <- a-b
  else ans <- b-a
  return (ans)
}
# 제어문 안에 1줄 수행이면 나란히 코드 짜도 됨
exam3(10,20)
exam3(20,20)
exam3(5,3)

# 문제 4
exam4 <- function(a, b, c){
  if(b == '+'){
    result = a+c
  }else if(b == '-'){
    result = a-c
  }else if(b == '*'){
    result = a*c
  }else if(b == '%/%'){
    if(a == 0){
      result = '오류1'
    }else if(c == 0){
      result = '오류2'
    }else{
      result = a%/%c
    }  
  }else if(b == '%%'){
    if(a == 0){
      result = '오류1'
    }else if(c == 0){
      result = '오류2'
    }else{
      result = a%%c
    }
  }else{
    result = "규격의 연산자만 전달하세요"
  }
  return(result)
}
exam4(10, '+', 2)
exam4(5, '-', 3)
exam4(4, '*', 5)
exam4(20, '%/%', 3)
exam4(30, '%%', 4)
exam4(18, '/', 2)
exam4(0, '%/%', 10)
exam4(0, '%%', 5)
exam4(10, '%/%', 0)
exam4(5, '%%', 0)

# 문제 5
exam5 <- function(a, b ='#'){
  if (a<=0){
    return() 
  }else {
    for (i in 1:a){
      cat(b, sep = "")
    }
  }
}

exam5(5)
exam5(3,"$")
exam5(-1)

# 문제 6
exam6 <- function(v){
  for (i in v){
    if (is.na(i) == TRUE){
      print("NA는 처리 불가")
      next
    }else if (i>=85){
      ans <-"상"
    }else if (i>=70){
      ans <- "중"
    }
    else {
      ans <- "하"
    }
    print(paste(i, "점은", ans, "등급입니다."))
  }
}
exam6(c(80,50,70,66,NA,35))

# na 체크하는 if문을 맨 위에 사용해야 하는 이유는 ?
# NA>= 85 인거는 T,F가 아니라 무조건 NA다. 
# 즉 if문 가로 안에는 T,F가 와야하는데, NA가 와버려서 더 이상 연산이 안되서 오류남. 
