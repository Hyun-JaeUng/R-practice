# dplyr 패키지 활용 실습
library(dplyr)

emp <- read.csv('data/emp.csv')

# 문제 1번
filter(emp, job == 'MANAGER')

# 문제 2번
select(emp, empno, ename, sal)

# 문제 3번
select(emp, -empno)

# 문제 4번
select(emp, ename, sal)

# 문제 5번 - 업무별 직원수
emp %>% count(job)

# 문제 6번 - 이어서 줄 수 있는 것이 장점 (다음 input으로 간다고 생각)
emp %>% filter(sal >= 1000 & sal<=3000) %>% select(ename, job, sal)

# 문제 7번
emp %>% filter(job != 'ANALYST') %>% select(ename, job, sal)

# 문제 8번
emp %>% filter(job == 'SALESMAN' | job == 'ANALYST') %>% 
  select(ename, job)

# 문제 9번 - groupby() 
emp %>% group_by(deptno) %>% summarise(sum_sal=sum(sal))

# 문제 10번
emp %>% arrange(sal)

# 문제 11번
emp %>% arrange(desc(sal)) %>% slice(1)

# 문제 12번
emp %>% rename(salary=sal, commrate=comm) -> empnew

# 문제 13번
emp %>% count(deptno) %>% max

# 문제 14번
emp %>% mutate(enamelength = nchar(ename)) %>% 
  arrange(enamelength) %>% select(ename)

# 문제 15번 - 마지막에 count만 주기. 
emp %>% filter(comm != 'NA') %>% count