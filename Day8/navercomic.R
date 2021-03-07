# 정적크롤링 수행평가 - 현재웅

urldata <- "https://comic.naver.com/genre/bestChallenge.nhn?&page="
comicName <- c(); comicSummary <- c(); comicGrade <- c()

# 20페이지 크롤링 -< for문 20번 수행
for (i in 1:20){
  url <- paste0(urldata, i)
  html <- read_html(url)
  
  # 만화 이름
  node <- html_nodes(html, '#content div.challengeInfo > h6 > a')
  name <- html_text(node, trim = T)
  comicName <- append(comicName, name)
  
  # 만화 요약
  node2 <- html_nodes(html, '#content div.challengeInfo > div.summary')
  cmsummary <- html_text(node2, trim = T)
  comicSummary <- append(comicSummary, cmsummary)
  
  # 만화 평점
  node3 <- html_nodes(html, '#content div.challengeInfo > div.rating_type > strong')
  cmgrade <- html_text(node3, trim = T)
  comicGrade <- append(comicGrade, cmgrade)
}

result <- data.frame(comicName, comicSummary, comicGrade)
write.csv(result, file = "output/navercomic.csv")


