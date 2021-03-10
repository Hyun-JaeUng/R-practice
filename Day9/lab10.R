# 동적 크롤링 실습
# 네이버 호텔 페이지 "신라스테이 역삼" 에 대한 모든 댓글 추출하는 기능 

library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
Sys.sleep(3)
site <- "https://hotel.naver.com/hotels/item?hotelId=hotel:Shilla_Stay_Yeoksam&destination_kor=%EC%8B%A0%EB%9D%BC%EC%8A%A4%ED%85%8C%EC%9D%B4%20%EC%97%AD%EC%82%BC&rooms=2"
remDr$navigate(site)
Sys.sleep(3)

text_comment <- c()

repeat{
  # 페이지에 있는 댓글 4개 수집
  for (index in 1:4){
    comment <- remDr$findElement(using = 'css selector', 
                                 paste0('body div.content div.review_ta.ng-scope > ul > li:nth-child(', index, ') > div.review_desc > p'))
    text_comment <- append(text_comment, unlist(comment$getElementText()))
  }
  # 버튼 태그 찾기
  nextbt <- remDr$findElement(using = 'css selector', 'body div.review_ta.ng-scope > div.paginate > a.direction.next')

  # 마지막 페이지 알아내는 조건 - 비활성화 되는 버튼 -> class 속성의 변화
  if (nextbt$getElementAttribute("class") == "direction next disabled"){
    break
  }else{ 
    # 마지막 페이지 아닐 시, 페이지 넘기기
    nextbt$clickElement()
  }
}

# 파일 저장
write(text_comment, file = 'output/naverhotel.txt')


# 페이지의 4개 댓글을 읽는 다른 방법 (findElements, sapply 활용)
# content<-remDr$findElements(using='css selector','div.review_ta.ng-scope > ul > li > div.review_desc > p') 
# sapply(content, function(x) x$getElementText())


