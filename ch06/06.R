## p.156 (2) 애니메이션 1: 카운트 다운

# 숫자 출력: 카운트 다운
library(animation)
ani.options(interval = 1)
 
for (i in 10:0) {
    plot.new()
    rect(0, 0, 1, 1, col="yellow")
    size = 11-i
    text(0.5, 0.5, i, cex=size, col=rgb(0,0,1,1)) 
    ani.pause()
}

## p.162 (3) 애니메이션 2: 움직이는 차트

library(animation)
ani.options(interval = 1)
while(TRUE) {
    y <- runif(5, 0, 1)
    barplot(y, ylim = c(0, 1), col=rainbow(5))
    ani.pause()
}

## p.164 (4) 애니메이션 3: 움직이는 그림
# 굴러가는 공
library(animation)
library(png)
ani.options(interval = 0.5)
for (i in 1:6) {
    img <- paste("C://temp/ball", i, ".png", sep="")
    img <- readPNG(img)
    plot.new()
    rect(0, 0, 1, 1, col="white")
    rasterImage(img, 0, 0, 1, 1)
    ani.pause()
}
dev.off()
        