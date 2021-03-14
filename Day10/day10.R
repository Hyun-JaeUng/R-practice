# 한국어 형태소 분석 패키지 설치
# Rtools 설치
# https://cran.r-project.org/bin/windows/Rtools/index.html
install.packages("Sejong")
install.packages("hash")
install.packages("tau")
install.packages("devtools")

# github 버전 설치
install.packages("remotes")
# 64bit 에서만 동작합니다.
remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))

library(KoNLP) # 한국어 자연어 처리: KoNLP
useSejongDic()
R.version

word_data <- readLines("data/애국가(가사).txt")
word_data

word_data2 <- sapply(word_data, extractNoun, USE.NAMES = F)
word_data2
word_data3 <- extractNoun(word_data) #이거 쓰면 됨 
word_data3

# 직접 단어 리빌드 (로컬 환경에서만 적용됨)
add_words <- c("백두산", "남산", "철갑", "가을", "달")
buildDictionary(user_dic=data.frame(add_words, rep("ncn", length(add_words))), replace_usr_dic=T)

word_data3 <- extractNoun(word_data)
word_data3

undata <- unlist(word_data3)
undata

word_table <- table(undata)
word_table

# Filter() 활용하여 두글자 이상만 남겨놓기
undata2 <- Filter(function(x) {nchar(x) >= 2}, undata)
word_table2 <- table(undata2)
word_table2

final <- sort(word_table2, decreasing = T)

head(final, 10)

extractNoun("대한민국의 영토는 한반도와 그 부속도서로 한다")
SimplePos22("대한민국의 영토는 한반도와 그 부속도서로 한다")
SimplePos09("대한민국의 영토는 한반도와 그 부속도서로 한다")
