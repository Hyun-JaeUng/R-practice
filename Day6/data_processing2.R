# 문제 2
v <- readLines("c://hju/Rexam/data/memo.txt", encoding = "UTF-8")
# 행단위 불러오기 -> readLines
v

# 정규표현식, gsub 활용
v[1] <- gsub("[&$!#@%]","", v[1]); v[1] #대괄호로 묶어서 각각 다 제거 
v[2] <- gsub("e", "E", v[2]); v[2] 
v[3] <- gsub("[[:digit:]]", "", v[3]); v[3]
v[4] <- gsub("[A-Z]|[a-z]", "", v[4]); v[4]
v[5] <- gsub("[!<>]|[1-9]", "", v[5]); v[5]
v[6] <- gsub("[[:space:]]", "", v[6]); v[6]
v[7] <- gsub("YOU", "you", v[7]); # 수동으로 바꿔야됨 
v[7] <- gsub("OK", "ok", v[7]); 
v[7]

ans <- c(v[1],v[2], v[3], v[4], v[5], v[6], v[7]); ans

write.csv(ans, file = "memo_new.txt", row.names = F, quote = F)