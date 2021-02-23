# matrix 실습
x1 <- matrix(1:8, nrow = 2) #ncol 매개변수 생략, 행에 맞춰서 자동으로 설정, 또한 열단위가 디폴트임!!
x1
x1<-x1*3 # 모든 원소마다 각각 3 곱한 결과. 
x1

sum(x1); min(x1);max(x1);mean(x1)

x2 <-matrix(1:8, nrow =3) # 행렬을 채우기 위해 마지막 9번째는 첫번째로 다시 돌아감.
x2

chars <- letters[1:10] # 벡터 생성만 한 코드
(chars <- letters[1:10]) # 벡터 생성 + 대입된 결과를 화면에 출력까지 해줌 -> () 역할

mat1 <-matrix(chars) # 행/열 갯수 안줘서 1열에만 데이터 다 들어감.
mat1; dim(mat1)
matrix(chars, nrow=1)
matrix(chars, nrow=5)
matrix(chars, nrow=5, byrow=T) # row를 우선적으로 데이터 줘라. (기본값은 FALSE)
matrix(chars, ncol=5)
matrix(chars, ncol=5, byrow=T)
matrix(chars, nrow=3, ncol=5)
matrix(chars, nrow=3)

m <- matrix(chars, nrow=3)
m[1,1]
m[3,4]
m[3,4] <- 'w'

colnames(m)
rownames(m)
colnames(m) <- c('c1', 'c2', 'c3', 'c4')
rownames(m) <- c('r1', 'r2', 'r3'); m

vec1 <- c(1,2,3)
vec2 <- c(4,5,6)
vec3 <- c(7,8,9)
mat1 <- rbind(vec1,vec2,vec3); mat1 # 자동으로 벡터이름이 행이름이 됨
mat2 <- cbind(vec1,vec2,vec3); mat2
mat1[1,1]
mat1[2,];mat1[,3] 
mat1[1,1,drop=F] #행렬구조 유지여부 (FALSE 해야 행렬 구조 유지)
mat1[2,,drop=F];mat1[,3,drop=F]

rownames(mat1) <- NULL # 행 이름 삭제
colnames(mat2) <- NULL # 열 이름 삭제
mat1;mat2
rownames(mat1) <- c("row1","row2","row3")
colnames(mat1) <- c("col1","col2","col3")
mat1
ls()
mean(x2)
sum(x2)
min(x2)
max(x2)
summary(x2)

mean(x2[2,]) #X2의 2행의 평균
sum(x2[2,])
rowSums(x2); colSums(x2)

x2; apply(x2, 1, sum); apply(x2, 2, sum)  # 1은 행단위, 2는 열단위
?apply
apply(x2, 1, max)
apply(x2, 1, min)
apply(x2, 1, mean)

apply(x2, 2, max)
apply(x2, 2, min)
apply(x2, 2, mean)

#Array 실습
a1 <- array(1:30, dim=c(2,3,5)) # array는 dim 꼭 필요. dim(행,열,층)
a1

a1[1,3,4] # 원소 1개라서 벡터로 출력
a1[,,3] # 3층의 모든 데이터 출력
a1[,2,]
a1[1,,] # 행이지만 열 단위로 붙는다!! 
a1 * 100 