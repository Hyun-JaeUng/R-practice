# 워드클라우드 실습 - wordcloud2 이용
library(wordcloud2)
library(KoNLP)

# txt 파일을 불러오기
word1 <- readLines("output/yes24.txt", encoding = "UTF-8")

# 명사 갯수 추출 - extractNoun
word2 <- unlist(extractNoun(word1))

# 한글 아닌 것 제거 - 정규표현식 활용
word3 <- gsub("[^가-힣]", "", word2)

# 단어 길이 조건에 부합하는 데이터만 추출 - Filter()
word4 <- Filter(function(x) {nchar(x)>=2 & nchar(x)<=4}, word3)

# 갯수 세기 - table()
word5 <- table(word4)

# 내림차순 정렬
(word6 <- sort(word5, decreasing = T))

# 데이터프레임 생성
(realdata <- data.frame(word6))

# wordcloud2를 통한 시각화
(result <- wordcloud2(data = realdata))

# 시각화 한것 파일로 저장 -> htmltools 패키지의 save_html 함수 활용.
htmltools::save_html(result,"output/yes24.html") 
