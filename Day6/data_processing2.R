# 문제 2
v <- readLines("c://hju/Rexam/data/memo.txt", encoding = "UTF-8")
v
v[1] <- gsub("[&$!#@%]","", v[1]); v[1]
#v[2] <- gsub("")
v[3] <- gsub("[[:digit:]]", "", v[3]); v[3]
v[4] <- gsub("[A-Z]|[a-z]", "", v[4]); v[4]
v[5] <- gsub("[!<>]|[1-9]", "", v[5]); v[5]
v[6] <- gsub("[[:space:]]", "", v[6]); v[6]
v[7] <- gsub("[:upper:]", "", v[7]); v[7]

write.csv(v, file = "memo_new.txt", row.names = F)