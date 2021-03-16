# 실습 - 기본 그래프 그려보기 

# 문제1 - 제품 당 클릭갯수에 대한 데이터를 가지고 그래프 그리기
data <- read.table('data/product_click.log')
data <- data.frame(data)
names(data) <- c('time', 'product') 

# 폰트 추가
library(showtext)
showtext_auto() 
font_add(family = "dog", regular = "fonts/THEdog.ttf")

# barplot하기 위해서는 table 객체 만들기
ds <- table(data$product)

# 그래프 저장 시작
png('output/clicklog1.png', 600, 600)

# 그래프 그리기
barplot(ds, main = "세로바 그래프 실습"
        , col=terrain.colors(10), col.main='red', family='dog')
title(xlab='상품ID', ylab='클릭수')

# 그래프 저장 끝
dev.off()


# 문제2 - 클릭된 시간정보를 가지고, 파이 그래프 그리기
data2 <- c(data$time)
(newdata <- (data2%%10000)%/%100)
ds2 <- table(newdata)


# 파이 그래프 그리기 - 라벨 설정 주의!
# as.integer 함수 활용하여 숫자로 변환하여 요구사항에 적합한 라벨 만듬
pie(ds2, col = rainbow(19), main = '파이그래프 실습'
    , family = 'dog', labels=paste0(as.integer(names(ds2)),'~',as.integer(names(ds2)) + 1)
    , col.main='blue')

# 그래프 저장 - 위와 다른방법
dev.copy(png, 'output/clicklog2.png')
dev.off()


# 문제3 - 성적데이터를 가지고 boxplot 그리기
data3 <- read.table('data/성적.txt', header = T)
ds3 <- data3[,3:5]

png('output/clicklog3.png', width = 400, height = 500)

# boxplot만 폰트 적용 안됨. -> title() 함수 활용
boxplot(ds3, col = rainbow(3), main = '과목별 성적분포'
        , col.main ='orange', family='dog')

dev.off()


# 문제4 - 막대그래프
ds4 <- ds3
rownames(ds4) <- data3$성명

# barplot은 열을 기준으로 그리기 때문에 전치행렬 사용
data4 <- t(as.matrix(ds4))

png('output/clicklog4.png', width = 800, height = 500)
barplot(data4, col = c('orange', 'skyblue', 'pink'), 
        main = '학생별 점수', col.main = 'purple', legend.text = c('국어', '수학', '영어'))

dev.off()