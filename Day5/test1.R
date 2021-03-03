# 문제 8
iotest1 <- scan("data/iotest1.txt", what="",encoding="UTF-8")
v <- as.numeric(iotest1)
cat(" 오름차순 :", sort(v), "\n", "내림차순 :", sort(v, decreasing = T)
    , "\n", "합 :", sum(v), "\n", "평균 :", mean(v))