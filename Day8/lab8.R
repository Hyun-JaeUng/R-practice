# 다음 뉴스 랭킹페이지를스크래핑 하기.

# 나의 방법: 직접 css 지정, rvest 패키지 사용
html <- read_html("https://news.daum.net/ranking/popular/")
data_node <- html_nodes(html,'a.link_txt'); data_node # 직접 css 지정
newstitle <- html_text(data_node[1:50], trim = T); newstitle # 50개 지정

data2_node <- html_nodes(html, 'span.info_news')
newspapername <- html_text(data2_node[1:50], trim = T); newspapername

ans <- data.frame(newstitle) # 데이터 프레임 생성
ans <- cbind(ans, newspapername) # cbind 열단위로 합치기

write.csv(ans, file = "output/daumnews.csv") # output 폴더 경로 지정



# other case: 달라지는 숫자 값을 for문을 통해 넣기 -> 단점: 50번 각각 찾아옴
for (index in 1:50){
  ntitle <- html_node(html, paste0("#mArticle > div.rank_news > ul.list_news2 > li:nth-child(", index, ") > div.cont_thumb > strong > a"))
  title <- html_text(ntitle)
  newstitle[index] <- title
}
# View() 를 통해서 파일 생성 전에확인도 가능
# other case: xpathSapply(~~, xmlValue) 사용 (XML 패키지 사용)