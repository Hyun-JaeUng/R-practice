# 텍스트마이닝 실습, api, 라이브러리 활용

# 문제 1
v1 <- c('Happy', 'Birthday', "to", "You")
length(v1) 
sum(nchar(v1))

# 문제 2
text <- paste(v1[1], v1[2], v1[3], v1[4])
length(text)
nchar(text)

# 문제 3
ans3_1 <- NULL; ans3_2 <- NULL
for (i in 1:10){
  ans3_1 <- append(ans3_1, paste(LETTERS[i], i))
  ans3_2 <- append(ans3_2, paste0(LETTERS[i], i))
}
ans3_1; ans3_2

# 문제 4
q4 <- (strsplit('Good Morning', " ")[[1]])
ans4 <- list(q4[1], q4[2]); ans4

# 문제 5
q5 <- c("Yesterday is history, tommrrow is a mystery, today is a gift!", 
        "That's why we call it the present - from kung fu Panda")

q5 <- gsub("[,-]", "", q5)
q5 <- gsub("\\s{2}", " ", q5) # 공백 두개 인 것 제거, 텍스트 분석 시 자주쓰임!
word5 <- unlist(strsplit(q5, " "))
word5

# 문제 6
s1 <- "@^^@Have a nice day!! 좋은 하루!! 오늘도 100점 하루...."
r1 <- gsub("[가-힣]", "", s1); r1
r2 <- gsub("[[:punct:]]", "", s1); r2
r3 <- gsub("[[:punct:]]|[가-힣]", "", s1); r3
r4 <- gsub("100", "백", s1); r4

# 문제 7
library(KoNLP)
word_data <- readLines("output/naverhotel.txt")
word_data <- gsub("[[:punct:][:digit:]]", "", word_data)
q7 <- unlist(extractNoun(word_data))
ans7_table <- table(q7)
ans7 <- sort(ans7_table, decreasing = T)
result <- data.frame(head(ans7, 10)) # 테이블을 df로 변환
names(result) <- c('wname', 'wcount') # df 이름 설정

write.csv(result, file = 'output/hotel_top_word.csv', row.names = F)
