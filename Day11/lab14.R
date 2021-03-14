# tm 패키지와 유사도 분석 실습

library(tm)
library(proxy)

# 벡터 정의 시 한 개의 문자열로 해줘야 함. 
fruit <- NULL
duke <- c("사과 포도 망고")
dulli <- c("포도 자몽 자두")
ddochi <- c("복숭아 사과 포도")
dounu <- c("오렌지 바나나 복숭아")
gildong <- c("포도 바나나 망고")
heedong <- c("포도 귤 오렌지")

fruit <- c(duke, dulli, ddochi, dounu, gildong, heedong)

# Corpus가 아닌 VCorpus로 해줘야 한글이 에러나지 않음  
cps <- VCorpus(VectorSource(fruit))

# VCorpus는 wordLengths 설정해줘야함 (기본이 3글자 이상만 처리)
# Corpus는 길이 정보 설정 안해도 되나 한글이 깨짐  
dtm <- DocumentTermMatrix(cps,
                          control = list(wordLengths = c(1,Inf)))

as.matrix(dtm)
inspect(dtm)
m <- as.matrix(dtm)
com <- m %*% t(m)
com

# 유사도 측정
dist(com, method = "cosine")
dist(com, method = "Euclidean")

# 과일 선호도 알아보기위해 TermDocumentMatrix 활용 
tdm <- TermDocumentMatrix(cps, control = list(wordLengths=c(1,Inf)))
m2 <- as.matrix(tdm)
ans <- sort(rowSums(m2), decreasing = T)
ans

# 가장 많이 선택된 과일
names(which.max(ans)) 