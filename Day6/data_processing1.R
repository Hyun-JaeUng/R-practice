# 문제 1
v <- sample(1:26, 10)
sapply(v, function(d) for (i in d) return(LETTERS[i]))