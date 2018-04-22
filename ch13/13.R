## p.355 (2) 동전 던지기

# 동전을 5,000번 던질 때 시행 횟수에 따라 앞면이 나오는 확률의 변화
iteration <- 5000
plot(0, 0, xlab="동전을 던진 회수", ylab="앞면이 나오는 비율", xlim=c(0, iteration), ylim=c(0, 1)) 

abline(a=0.5, b=0, col="red") 

sum <- 0
for(x in 1:iteration) {
 
    coin <- sample(c("앞면", "뒷면"), 1, replace=T)
    
    if (coin == "앞면")
        sum = sum + 1 

    prob <- sum / x
    
    points(x, prob)
}

# 동전을 5,000번 던질 때 앞면이 나온 횟수
# 시행 횟수: 5000
iteration <- 5000
x <- sample(c(0, 1), iteration, replace=T)
round(sum(x)/iteration * 100, 1)

## p.362 (3) 몬테카를로 시뮬레이션에 의한 원주율 구하기

# 원주율 계산
iteration <- 1000
n_circle <- 0
for(i in 1: iteration) {
    x <- runif(1, min=0, max=1)
    y <- runif(1, min=0, max=1)
    dist <- sqrt(x^2 + y^2)
    if (dist <= 1)
        n_circle <- n_circle + 1
}
pi <- 4 * n_circle/iteration
pi
       