# 날짜와 시간 관련 기능을 지원하는 함수들

(today <- Sys.Date())
str(today) # date 객체
format(today, "%Y년 %m월 %d일%")
format(today, "%d일 %B %Y년")
format(today, "%y")
format(today, "%Y")
format(today, "%B");format(today, "%b")
format(today, "%a")
format(today, "%A")
weekdays(today) 
months(today) 
quarters(today)
unclass(today)  # 1970-01-01을 기준으로 얼마나 날짜가 지났지는 지의 값을 가지고 있다.
Sys.Date()
Sys.time(); str(Sys.time())
Sys.timezone() 

as.Date('1/15/2018',format='%m/%d/%Y') # format 은 생략 가능
as.Date('4월 26, 2018',format='%B %d, %Y') 
as.Date('110228',format='%d%b%y')
as.Date('11228',format='%d%b%y') 

x1 <- "2019-01-10 13:30:41"
# 문자열을 날짜형으로
as.Date(x1, "%Y-%m-%d %H:%M:%S") # date형이라 시분초 안나옴
# 문자열을 날짜+시간형으로
strptime(x1, "%Y-%m-%d %H:%M:%S") # 시분초 중요할때는 strptime 사용해야됨 
strptime('2019-08-21 14:10:30', "%Y-%m-%d %H:%M:%S")

x2 <- "20200601"
as.Date(x2, "%Y%m%d")
datetime<-strptime(x2, "%Y%m%d")
str(datetime)

as.Date("2020/01/01 08:00:00") - as.Date("2020/01/01 05:00:00")
as.POSIXct("2020/01/01 08:00:00") - as.POSIXct("2020/01/01 05:00:00")
as.POSIXlt("2020/01/01 08:00:00") - as.POSIXlt("2020/01/01 05:00:00")

t<-Sys.time()
str(t)
ct<-as.POSIXct(t)
lt<-as.POSIXlt(t)
str(ct) 
str(lt) 
unclass(ct) 
unclass(lt) 
lt$mon+1
lt$hour
lt$year+1900
as.POSIXct(1449894438,origin="1970-01-01")
as.POSIXlt(1449894438,origin="1970-01-01")

as.POSIXlt("2021/03/02")$wday
as.POSIXlt("2021/03/04")$wday
as.POSIXlt("2021/03/05")$wday
as.POSIXlt("2021/03/06")$wday
as.POSIXlt("2021/03/07")$wday

#내가 태어난 요일 출력하기
myday<-as.POSIXlt("2021-03-01")
weekdays(myday)
#내가 태어난지 며칠
as.POSIXlt(Sys.Date()) - myday
#올해의 크리스마스 요일 2가지방법(요일명,숫자)
christmas2<-as.POSIXlt("2021-12-25")
weekdays(christmas2)
christmas2$wday
#2021년 1월 1일 어떤 요일
tmp<-as.POSIXct("2021-01-01")
weekdays(tmp)
#오늘은 xxxx년x월xx일x요일입니다 형식으로 출력
tmp<-Sys.Date()
year<-format(tmp,'%Y')
month<-format(tmp,'%m')
day<-format(tmp,'%d')
weekday<-format(tmp,'%A')
paste("오늘은 ",year,"년 ",month,"월 ",day,"일 ",weekday," 입니다.",sep="")

format(tmp,'오늘은 %Y년 %B %d일 %A입니다')

# 정규표현식
# gsub(pattern, replacement, x, ignore.case=F) 
# 해당 패턴을 가지는 문자열을 x에서 발견하여, replacement로 바꿔주는 함수. 

word <- "JAVA javascript 가나다 123 %^&*"
gsub("A", "", word) 
gsub("a", "", word) 
gsub("[Aa]", "", word) 
gsub("[가-힣]", "", word) 
gsub("[^가-힣]", "", word) 
gsub("[&^%*]", "", word) 
gsub("[[:punct:]]", "", word) # 구두점 문자, !"#$ () ~~~ 
gsub("[[:alnum:]]", "", word) # 공백은 제거 안됨, 한글도 포함
gsub("[1234567890]", "", word) 
gsub("[[:digit:]]", "", word) # 숫자 제거
gsub("[^[:alnum:]]", "", word) # 한글은 안지워짐
gsub("[[:space:]]", "", word) 
gsub("[[:space:][:punct:]]", "", word)


# 정규표현식 사용
word <- "JAVA javascript Aa 가나다 AAaAaA123 %^&*"
gsub(" ", "@", word); sub(" ", "@", word)

# gsub() 함수는 데이터에서 매칭되는 모든 값에 대해 치환을 하지만,
# sub() 는 매칭되는 처음 값만 치환한다.

gsub("A", "", word) 
gsub("a", "", word) 
gsub("Aa", "", word) 
gsub("(Aa)", "", word) # 위와 동일
gsub("(Aa){2}", "", word);gsub("Aa{2}", "", word) # 처음:AaAa, 뒤:Aaa -> 괄호로 인해 차이
# "JAVA javascript Aa 가나다 AAaAaA123 %^&*"
gsub("[Aa]", "", word) #A랑 a 있는 것 다 제거 (각자, or의 의미)
gsub("[가-힣]", "", word) 
gsub("[^가-힣]", "", word) # 한글 아닌애들 없애라.
gsub("[&^%*]", "", word) 
gsub("[[:punct:]]", "", word) 
gsub("[[:alnum:]]", "", word) 
gsub("[1234567890]", "", word) 
gsub("[0-9]", "", word) 
gsub("\\d", "", word) # 동등한 표현 [:digit:]
gsub("\\D", "", word) # 숫자가 아닌 것 모두 제거, 동등한 표현 [^0-9]
gsub("[[:digit:]]", "", word) 
gsub("[^[:alnum:]]", "", word) 
gsub("[[:space:]]", "", word) 
gsub("[[:punct:][:digit:]]", "", word) # 두가지 패턴 함께 가능 (or)
gsub("[[:punct:][:digit:][:space:]]", "", word)  

#문자열 처리 관련 주요 함수들 

x <- "We have a dream"
nchar(x) 
length(x)

y <- c("We", "have", "a", "dream", "ㅋㅋㅋ")
length(y) # 벡터의 원소 갯수 
nchar(y) # 한 글자당 1로 계산, 문자의 길이

letters
sort(letters, decreasing=TRUE) # 내림 차순

fox.says <- "It is only with the HEART that one can See Rightly"
tolower(fox.says) # 소문자로
toupper(fox.says) # 대문자로 

substr("Data Analytics", start=1, stop=4)
substr("Data Analytics", 6, 14)
substring("Data Analytics", 6)

classname <- c("Data Analytics", "Data Mining", 
               "Data Visualization")
substr(classname, 1, 4) # 각 원소마다 1~4번째 글자 가져옴 

countries <- c("Korea, KR", "United States, US", 
               "China, CN")
substr(countries, nchar(countries)-1, nchar(countries)) # 끝에 2개 

str(islands)
head(islands)
landmesses <- names(islands)
landmesses
grep(pattern="New", x=landmesses) # 인덱스 출력 

index <- grep("New", landmesses)
landmesses[index]
# 동일
grep("New", landmesses, value=T) # 해당 값을 출력 


txt <- "Data Analytics is useful. Data Analytics is also interesting."
sub(pattern="Data", replacement="Business", x=txt)
gsub(pattern="Data", replacement="Business", x=txt) # 키워드 형으로 준 예시, 값만 줘도 됨. 

x <- c("test1.csv", "test2.csv", "test3.csv", "test4.csv")
gsub(".csv", "", x)


gsub("[ABC]", "@", "123AunicoBC98ABC")
gsub("ABC", "@", "123AunicoBC98ABC")
gsub("(AB)|C", "@", "123AunicoBC98ABC") # AB OR C 
gsub("A|(BC)", "@", "123AunicoBC98ABC") 
gsub("A|B|C", "@", "123AunicoBC98ABC") # = [ABC]

words <- c("ct", "at", "bat", "chick", "chae", "cat", 
           "cheanomeles", "chase", "chasse", "mychasse", 
           "cheap", "check", "cheese", "hat", "mycat")

grep("che", words, value=T)
grep("at", words, value=T)
grep("[ch]", words, value=T)
grep("[at]", words, value=T)
grep("ch|at", words, value=T)
grep("ch(e|i)ck", words, value=T)
grep("chase", words, value=T)
grep("chas?e", words, value=T) # chae or chase (물음표 없거나 1개 있거나)
grep("chas*e", words, value=T) # 위에 더불어 s가 여러개 있어도 찾음 
grep("chas+e", words, value=T) # 위와 달리 chae는 찾음 (s 필수 )
grep("ch(a*|e*)se", words, value=T)
grep("^c", words, value=T) # [^...] -> 부정, 대괄호안에 있으면 부정의 의미. 
grep("t$", words, value=T) # t로 끝나는 것
grep("^c.*t$", words, value=T) # c로 시작, t로 끝, 사이에 뭐가 있어도 관계없음.  

words2 <- c("12 Dec", "OK", "http//", 
            "<TITLE>Time?</TITLE>", 
            "12345", "Hi there")

grep("[[:alnum:]]", words2, value=TRUE)
grep("[[:alpha:]]", words2, value=TRUE)
grep("[[:digit:]]", words2, value=TRUE)
grep("[[:punct:]]", words2, value=TRUE)
grep("[[:space:]]", words2, value=TRUE)
grep("\\w", words2, value=TRUE)
grep("\\d", words2, value=TRUE);grep("\\D", words2, value=TRUE)
grep("\\s", words2, value=TRUE)



fox.said <- "What is essential is invisible to the eye"
fox.said
strsplit(x= fox.said, split= " ") # 공백 단위로 쪼개서 리스트로 출력. 
strsplit(x= fox.said, split="")

fox.said.words <- unlist(strsplit(fox.said, " "))
fox.said.words
fox.said.words <- strsplit(fox.said, " ")[[1]] # 격대괄호 인덱스로 꺼내서 쓰는 방법 
fox.said.words
fox.said.words[3]
p1 <- "You come at four in the afternoon, than at there I shall begin to the  happy"
p2 <- "One runs the risk of weeping a little, if one lets himself be tamed"
p3 <- "What makes the desert beautiful is that somewhere it hides a well"
littleprince <- c(p1, p2, p3)
strsplit(littleprince, " ") 
strsplit(littleprince, " ")[[3]] 
strsplit(littleprince, " ")[[3]][5]


# 데이터 전처리(1) - apply 계열의 함수를 알아보자
weight <- c(65.4, 55, 380, 72.2, 51, NA)
height <- c(170, 155, NA, 173, 161, 166)
gender <- c("M", "F","M","M","F","F")

df <- data.frame(w=weight, h=height)
df
?apply
?lapply
apply(df, 1, sum, na.rm=TRUE) # 1 -> 행단위로 sum함수
apply(df, 2, sum, na.rm=TRUE) # 2 -> 열단위 
lapply(df, sum, na.rm=TRUE) # 열단위로 sum함 
sapply(df, sum, na.rm=TRUE) # 벡터 리턴 (꼭 그런건 아님)
tapply(1:6, gender, sum) # rm(sum)
tapply(df$w, gender, mean, na.rm=TRUE)
mapply(paste, 1:5, LETTERS[1:5], month.abb[1:5]) # function이 앞에 오고, 뒤에 다른 아규먼트 여러 개 줄 수 있음
# 같은 원소 순서끼리 함수 실행해줌. 
# 첫번째 원소 끼리 paste해라 ~~~ 


v<-c("abc", "DEF", "TwT")
sapply(v, function(d) paste("-",d,"-", sep=""))

l<-list("abc", "DEF", "TwT")
sapply(l, function(d) paste("-",d,"-", sep=""))
lapply(l, function(d) paste("-",d,"-", sep=""))

flower <- c("rose", "iris", "sunflower", "anemone", "tulip")
length(flower)
nchar(flower)
sapply(flower, function(d) if(nchar(d) > 5) return(d)) # 리스트 리턴 
sapply(flower, function(d) if(nchar(d) > 5) d) # 리스트 

# 벡터안에는 null이 들어갈 수 없음. 그에 따라 여러 형태로 출력되는 sapply 함수 
sapply(flower, function(d) if(nchar(d) > 5) return(d) else return(NA)) # 벡터
sapply(flower, function(d) paste("-",d,"-", sep="")) # 벡터 

sapply(flower, function(d, n=5) if(nchar(d) > n) return(d)) # 매개변수 2개 줌.
sapply(flower, function(d, n=5) if(nchar(d) > n) return(d), 3) # 기본값이라 생각. 
sapply(flower, function(d, n=5) if(nchar(d) > n) return(d), n=4) # n값 지정

count <- 1
myf <- function(x, wt=T){
  print(paste(x,"(",count,")"))
  Sys.sleep(1)
  if(wt) 
    r <- paste("*", x, "*")
  else
    r <- paste("#", x, "#") 
  count <<- count + 1; # 전역변수 지정
  return(r)
}
result <- sapply(df$w, myf)
length(result)
result
sapply(df$w, myf, F)
sapply(df$w, myf, wt=F)
rr1 <- sapply(df$w, myf, wt=F)
str(rr1)

count <- 1
sapply(df, myf) # w 열벡터가 한번에 전달.
rr2 <- sapply(df, myf)
str(rr2)
rr2[1,1]
rr2[1,"w"]
