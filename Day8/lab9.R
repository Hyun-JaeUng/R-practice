# OPEN API 실습

# 문제 1번
library(XML)
searchUrl<- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x" # 네이버 인증키
Client_Secret <- "WrwbQ1l6ZI"

query <- URLencode(iconv("맛집","euc-kr","UTF-8")) # 키워드: 맛집
url <- paste0(searchUrl, "?query=", query, "&display=100") 
doc <- GET(url, add_headers("Content_Type" = "application/xml",
                            "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))
# 블로그 내용에 대한 리스트 만들기		
doc2 <- htmlParse(doc, encoding="UTF-8")
text<- xpathSApply(doc2, "//item/description", xmlValue)
text
text <- gsub("</?b>", "", text) # </?b> --> <b> 또는 </b>, ?는 바로 앞에 있는 문자가 0번 or 1번
text <- gsub("&.+t;", "", text) # &.+t; --> &at;, &abct;, &1t;, &111t; .... , .은 어떤 문자가 됐든 여러번 반복

write.csv(text, file = "output/naverblog.txt")

# 문제 2번
library(rtweet) 
appname <- "edu_data_collection"
api_key <- "RvnZeIl8ra88reu8fm23m0bST"
api_secret <- "wTRylK94GK2KmhZUnqXonDaIszwAsS6VPvpSsIo6EX5GQLtzQo"
access_token <- "959614462004117506-dkWyZaO8Bz3ZXh73rspWfc1sQz0EnDU"
access_token_secret <- "rxDWfg7uz1yXMTDwijz0x90yWhDAnmOM15R6IgC8kmtTe"
twitter_token <- create_token(
  app = appname,
  consumer_key = api_key,
  consumer_secret = api_secret,
  access_token = access_token,
  access_secret = access_token_secret)

key <- "코로나"
key <- enc2utf8(key)
result <- search_tweets(key, n=100, token = twitter_token)
str(result)
content <- result$retweet_text
content <- gsub("[[:punct:]]|[a-z]|[A-Z]", "", content)   
content <- na.omit(content) #na.omit() -> na행 제거
write.csv(content, file = "output/twitter.txt")

# 문제 3번
library(XML)
API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "360"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
doc <- xmlParse(url, encoding="UTF-8")
top <- xmlRoot(doc)
top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList")) #itemlist만 dataframe 생성해라. 

# 360번 인덱싱
cat("노선 ID :", df[df$busRouteNm == 360, "busRouteId"], "\n")
cat("노선길이 :", df[df$busRouteNm == 360, "length"], "\n")
cat("기점 :", df[df$busRouteNm == 360, "stStationNm"], "\n")
cat("종점 :", df[df$busRouteNm == 360, "edStationNm"], "\n")
cat("배차간격 :", df[df$busRouteNm == 360, "term"], "\n")

# 문제 4
# 네이버 뉴스 연동 (json 방식)
library(jsonlite)
library(httr)
searchUrl<- "https://openapi.naver.com/v1/search/news.json" #.json 주기
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query <- URLencode(iconv("빅데이터","euc-kr","UTF-8"))
url <- paste0(searchUrl, "?query=", query, "&display=100")
doc <- GET(url, add_headers("Content_Type" = "application/json", #json형식 지정  
                            "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))

doc2 <- content(doc, type = 'text', encoding = "UTF-8")
text <- fromJSON(doc2)
df <- data.frame(text) 
ans <- df$items.title; 
ans <- gsub("</?b>", "", ans)
ans <- gsub("&quot;", "", ans)
ans <- gsub("&gt;", "", ans)
write(ans, file = "output/navernews.txt")

