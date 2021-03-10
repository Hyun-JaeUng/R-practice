# gs25 사이트에서 2+1 행사 진행하는 모든 상품의 상품명, 가격 데이터 추출

# GS25 이벤트 상품 정보.
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
site <- 'http://gs25.gsretail.com/gscvs/ko/products/event-goods'
remDr$navigate(site)
Sys.sleep(2)

# 2+1 페이지로 클릭
twobt <- remDr$findElements(using='css selector', '#TWO_TO_ONE')
twobt[[1]]$clickElement()

goodsname <- c(); goodsprice <- c(); presentpage <- 1

repeat{
  Sys.sleep(3)
  goodsnameWE <- remDr$findElements(using = 'css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.tit')
  goodsnametext <- sapply(goodsnameWE, function(x) {x$getElementText()} )
  goodsname <- append(goodsname, unlist(goodsnametext))
  
  goodspriceWE <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.price > span')
  goodspricetext <- sapply(goodspriceWE, function(x) {x$getElementText()})
  goodsprice <- append(goodsprice, unlist(goodspricetext))
  
  presentpage <<- presentpage + 1
  
  nextbt <- remDr$findElement(using = 'css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > a.next')
  nextbt$clickElement()
  Sys.sleep(3)
  
  onpage <- remDr$findElement(using = 'css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > span > a.on')
  onpage <- onpage$getElementText()
  
  if (presentpage != onpage[[1]]){
    cat(presentpage, "페이지에서 데이터 수집 완료", "\n")
    break
  }else{
    cat("현재 페이지는", presentpage, "입니다.", "\n")
  }
}

result <- data.frame(goodsname, goodsprice)
write.csv(result, file = "output/gs25_twotoone.csv")


