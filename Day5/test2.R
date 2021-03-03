# 문제 9
iotest2 <- scan("data/iotest2.txt", what="",encoding="UTF-8")
v <- strsplit(iotest2, " ")
cat("가장 많이 등장한 단어는", names(which.max(table(unlist(v)))), "입니다.")

# which.max 활용! 값이 최대인 셀의 인덱스(위치) 리턴!
# 팩터 -> summary로 풀어도됨