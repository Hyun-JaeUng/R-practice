# dplyr 패키지 활용한 실습

# 문제 1
library(ggplot2)
library(dplyr)

str(mpg) # 구조 확인
mpg %>% nrow() # 행의 갯수
mpg %>% ncol() # 열의 갯수
mpg %>% head(10) 
mpg %>% tail(10)
mpg %>% View() # GUI 환경으로 출력
mpg %>% summary() # 열 단위로 요약 - summary()
mpg %>% count(manufacturer)
mpg %>% count(manufacturer, model)
mpg %>% group_by(manufacturer) %>% count(model) 

# 문제 2
mpg %>% rename(city=cty, highway=hwy) -> mpg2 # rename하고 저장해야함
mpg2 %>% head()

# 문제 3-1
str(midwest) # structure
midwest %>% as.data.frame() %>% str()

# 문제 3-2
midwest <- midwest %>% rename(total=poptotal, asian=popasian)

# 문제 3-3
midwest <- midwest %>% mutate(asiaratio = asian/total*100)
head(midwest)

# 문제 3-4
as.numeric(midwest %>% summarise(mean(asiaratio))) -> mean_ratio
midwest <- midwest %>% mutate(asiasize = 
                                ifelse(asiaratio > mean_ratio, "large", "small"))
midwest %>% count(asiasize)

# 문제 4-1
mpg %>% mutate(displ_2 = ifelse(displ <= 4, "low", "high")) %>% 
  group_by(displ_2) %>% summarise(mean_hwy=mean(hwy, na.rm = T))

# 문제 4-2
mpg %>% group_by(manufacturer) %>% 
  filter(manufacturer == 'audi'| manufacturer == 'toyota') %>% 
  summarise(mean_cty = mean(cty))
                                        
# 문제 4-3
mpg %>% 
  filter(manufacturer == 'chevrolet'| manufacturer == 'ford' | manufacturer == 'honda') %>%
  summarise(mean(hwy))

# 문제 5-1
mpg %>% select(class, cty) -> newdata
head(newdata)

# 문제 5-2
mpg %>% group_by(class) %>% filter(class == 'suv' | class == 'compact') %>% 
  summarise(mean(cty))

# 문제 6
mpg %>% filter(manufacturer == 'audi') %>% arrange(desc(hwy)) %>% 
  head(5)
  