# 데이터 수집 시작!!
library() # 설치된 패키지 리스트
installed.packages()
search()

install.packages("rvest")
install.packages("XML")
install.packages("httr")

library(rvest)
library(XML)
library(httr)

# [ 예제1 ]
url <- "http://unico2013.dothome.co.kr/crawling/tagstyle.html"
text <- read_html(url)
text # html_node 객체 

nodes <- html_nodes(text, "div") # 태그 선택자
nodes
title <- html_text(nodes) # 찾아진 노드만큼 각각의 컨텐터들을 뽑아서 만듬. 
title

node1 <- html_nodes(text, "div:nth-of-type(1)")
node1
html_text(node1)
html_attr(node1, "style") #  노드에서 주어진 명칭(style)의 속성값 가져오기.

node2 <- html_nodes(text, "div:nth-of-type(2)")
node2
html_text(node2)
html_attr(node2, "style")

node3 <- html_nodes(text, "div:nth-of-type(3)")
node3
html_text(node3)

# [ 예제2 ]
# 웹문서 읽기
url <- "https://www.data.go.kr/tcs/dss/selectDataSetList.do"
html <- read_html(url) # 제일 먼저 read_html -> nodes -> text 순으로 진행된 경우.
html

# 목록 아이템 추출, #id
title <- html_text(html_nodes(html, "#apiDataList .title"))#, trim=T) trim하면 앞 뒤 쓸데없는 분리문자 제거해줌. (공백, 탭, 등등)
title

# 목록 아이템 설명 추출
desc <- html_text(html_nodes(html, "#apiDataList .ellipsis"))
desc

# 데이터 정제: 제어문자를 공백으로 대체 
title <- gsub("[[:cntrl:]]", "", title) # cntrl -> 컨트롤 캐릭터: \n, \c
title

desc <- gsub("[[:cntrl:](</br>)∙]", "", desc)
# 점있는 상태에서 dataframe으로 변환하면 보기 안좋아져서 제거 한 것. 
desc

# 데이터 출력
api <- data.frame(title, desc)
api


# [ 예제3 ]
# 단일 페이지(rvest 패키지 사용)
library(rvest)
# 영화 제목과 평점 읽기
text<- NULL; title<-NULL; point<-NULL; review<-NULL; page<-NULL
url<- "http://movie.naver.com/movie/point/af/list.nhn?"
text <- read_html(url) #,  encoding="CP949")
text
#save(text, file="imsi.rda")
# 영화제목
nodes <- html_nodes(text, ".movie")
title <- html_text(nodes)
title
# 영화평점
nodes <- html_nodes(text, ".title em")
point <- html_text(nodes)
point

page <- data.frame(title, point)
print(page)

# 리뷰 ---------------------------------

# 영화 제목, 평점, 리뷰글 읽기
text<- NULL; title<-NULL; point<-NULL; review<-NULL; page<-NULL
url<- "http://movie.naver.com/movie/point/af/list.nhn?"
text <- read_html(url)#,  encoding="CP949")
text
#save(text, file="imsi.rda")
# 영화제목
nodes <- html_nodes(text, ".movie")
title <- html_text(nodes)
title
# 영화평점
nodes <- html_nodes(text, ".title em")
point <- html_text(nodes)
point
# 영화리뷰
review <- html_nodes(text, xpath="//*[@id='old_content']/table/tbody/tr/td[2]/text()")
review <- html_text(review, trim=TRUE)
review <- review[nchar(review) > 0]
review
page <- data.frame(title, point, review) # 갯수가 안맞아서 df 못만듬
print(page)


# [ 예제4 ]
# 영화 제목, 평점, 리뷰글 읽기
text<- NULL; vtitle<-NULL; vpoint<-NULL; vreview<-NULL; page=NULL
url<- "http://movie.naver.com/movie/point/af/list.nhn"
text <- read_html(url,  encoding="CP949")
text

for (index in 1:10) {
  # 영화제목
  node <- html_node(text, paste0("#old_content > table > tbody > tr:nth-child(", index, ") > td.title > a.movie.color_b"))
  title <- html_text(node)
  vtitle[index] <- title
  # 영화평점
  node <- html_node(text, paste0("#old_content > table > tbody > tr:nth-child(", index,") > td.title > div > em"))
  point <- html_text(node)
  vpoint <- c(vpoint, point)
  # 영화리뷰 (리뷰 글 빈 것들 null 넣기 위해서 함)
  node <- html_nodes(text, xpath=paste0('//*[@id="old_content"]/table/tbody/tr[', index,"]/td[2]/text()"))
  node <- html_text(node, trim=TRUE)
  print(node)
  review = node[4]
  vreview <- append(vreview, review)
}
page <- data.frame(vtitle, vpoint, vreview)
View(page)
write.csv(page, "output/movie_reviews1.csv")

# [ 예제5 ]
# 여러 페이지1
site<- "http://movie.naver.com/movie/point/af/list.nhn?page="
text <- NULL
movie.review <- NULL
for(i in 1: 100) {
  url <- paste(site, i, sep="") # url 뒤에 페이지숫자 연결해주기. 
  text <- read_html(url,  encoding="CP949")
  nodes <- html_nodes(text, ".movie")
  title <- html_text(nodes)
  nodes <- html_nodes(text, ".title em")
  point <- html_text(nodes)
  nodes <- html_nodes(text, xpath="//*[@id='old_content']/table/tbody/tr/td[2]/text()")
  imsi <- html_text(nodes, trim=TRUE)
  review <- imsi[nchar(imsi) > 0] 
  if(length(review) == 10) {
    page <- data.frame(title, point, review)
    movie.review <- rbind(movie.review, page)
  } else {
    cat(paste(i," 페이지에는 리뷰글이 생략된 데이터가 있어서 수집하지 않습니다.ㅜㅜ\n"))
  } # 리뷰글 완벽하지 않은 페이지는 수집 생략하는 방법을 활용. 
}
write.csv(movie.review, "output/movie_reviews2.csv")

# [ 예제6 ]
# 여러 페이지2
site<- "http://movie.naver.com/movie/point/af/list.nhn?page="
text <- NULL
movie.allreview <- NULL
for(i in 1: 100) {
  url <- paste(site, i, sep="")
  text <- read_html(url,  encoding="CP949")
  for (index in 1:10) {
    # 영화제목
    node <- html_node(text, paste0("#old_content > table > tbody > tr:nth-child(", index, ") > td.title > a.movie.color_b"))
    title <- html_text(node)
    vtitle[index] <- title
    # 영화평점
    node <- html_node(text, paste0("#old_content > table > tbody > tr:nth-child(", index,") > td.title > div > em"))
    point <- html_text(node)
    vpoint <- c(vpoint, point)
    # 영화리뷰 
    node <- html_nodes(text, xpath=paste0('//*[@id="old_content"]/table/tbody/tr[', index,"]/td[2]/text()"))
    node <- html_text(node, trim=TRUE)
    print(node)
    review = node[4] # 질문!!
    vreview <- append(vreview, review)
  }
  page <- data.frame(vtitle, vpoint, vreview)
  movie.review <- rbind(movie.allreview, page)
  
}
write.csv(movie.review, "output/movie_reviews3.csv")


# [ 예제7 ]
# 한겨레 페이지(XML 패키지 사용)
library(XML)
library(rvest)
imsi <- read_html("http://www.hani.co.kr/")
t <- htmlParse(imsi)
content<- xpathSApply(t,'//*[@id="main-top01-scroll-in"]/div/div/h4/a', xmlValue); # 함수 뒤에 준 것 확인.
# xPath와 css는 찾는 룰이 다름, 이 경우 xpath 룰
# //* : 조상이 누구있든, 태그명이 무엇이든의 의미
content