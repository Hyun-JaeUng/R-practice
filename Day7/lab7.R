# lab 7, 웹 스크래핑
url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
html <- read_html(url); html

# 요구사항 출력
h1_text <- html_text(html_node(html, "h1")); h1_text

a_href <- html_attr(html_nodes(html, "a"), "href"); a_href
# s 붙여서 두개 이상 가져오고, name = ""href" 아규먼트로 주기

img_src <- html_attr(html_nodes(html, "img"), "src"); img_src

h2_text <- html_text(html_nodes(html, "h2:nth-of-type(1)")); h2_text

ans5 <- html_text(html_nodes(html, "ul>li[style$='green']")); ans5
# ul의 자식 li의 [], style이 green으로 끝나는 것 

ans6 <- html_text(html_node(html, "h2:nth-of-type(2)")); ans6
# nth-of-type(n)

ans7 <- html_text(html_nodes(html,"ol>*"), trim = T); ans7
# ol태그의 모든 자식 태그 칭함

ans8 <- html_text(html_nodes(html, "table *")); ans8
# table의 모든 자손 태그
# 자식 ">" , 자손 " "(공백)
# 차이점: 자손 -> 밑의 전체, 자식 -> 바로 한 단계 아래,직계 자식만 

ans9 <- html_text(html_nodes(html,"tr.name")); ans9
# tr.name 순서 주의. 클래스는 태그.classname

ans10 <- html_text(html_nodes(html, "td#target")); ans10
# 아이디는 태그#id. 