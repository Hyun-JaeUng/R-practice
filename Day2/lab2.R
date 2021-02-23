# 문제 1 
v1 <- sample(1:30, 10, replace = T) # 중복 허용 시 replace = T 
v2 <- letters[26:17]
names(v1) <- v2
v1
v2

# 문제 2
v <- seq(10,38,2)
m1 <- matrix(v, nrow=3, ncol = 5, byrow= T); m1 # 행 우선 저장
m2 <- m1 + 100; m2
(m_max_v <- max(m1))
(m_min_v <- min(m1))
(row_max <- apply(m1, 1, max)) #행 단위
(col_max <- apply(m1, 2, max)) #열 단위

# 문제 3
n1 <- c(1:3)
n2 <- c(4:6)
n3 <- c(7:9)
m2 <- cbind(n1, n2, n3); 
colnames(m2) <- NULL; m2

# 문제 4
n1 <- c(1:9)
m3 <- matrix(n1, nrow=3, byrow = T); m3

# 문제 5
m4 <- m3
colnames(m4) <- c("col1", "col2", "col3")
rownames(m4) <- c("row1", "row2", "row3")
m4 

# 문제 6
alpha <- matrix(letters[1:6], nrow = 2); alpha
alpha2 <- rbind(alpha, letters[24:26]); alpha2 # 행렬과 벡터지만 합쳐서 행렬 완성됨. 
alpha3 <- cbind(alpha2, c('s', 'p')); alpha3

# 문제 7
a <- array(1:24, dim = c(2,3,4)); a # dim에서 c로 까먹지 않기
a[2,3,4]
a[2,,]
a[,1,]
a[,,3]
(a+100)
a[,,4]*100
a[1,2:3,]
(a[2,,2] <- a[2,,2] + 100)
(a[,,1] <- a[,,1] - 2)
(a <- a*10)
(rm(a)) # a 배열 삭제 