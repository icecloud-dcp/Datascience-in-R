## p.118 (2) 단일 벡터 데이터의 차트 그리기

# 단순 파이 차트 1
install.packages("graphics")
library(graphics)
x <- c(9, 15, 20, 6)
label <- c("영업 1팀", "영업 2팀", "영업 3팀", "영업 4팀")
pie(x, labels=label, main="부서별 영업 실적")

# 단순 파이 차트 2
pie (x, init.angle=90, labels=label, main="부서별 영업 실적")

# 퍼센트가 있는 파이 차트
pct <- round(x/sum(x)*100)
label <- paste(label, pct)
label <- paste(label,"%",sep="")
pie(x,labels=label, init.angle=90, col=rainbow(length(x)), main="부서별 영업 실적")

# 3D 파이 차트
library(plotrix)
pie3D(x,labels=label, explode=0.1, labelcex=0.8, main="부서별 영업 실적")

# 단순 바 차트 1
height <- c(9, 15, 20, 6)
name <- c("영업 1팀", "영업 2팀", "영업 3팀", "영업 4팀")
barplot(height, names.arg=name, main="부서별 영업 실적")

# 단순 바 차트 2
barplot(height, names.arg=name, main="부서별 영업 실적", col=rainbow(length(height)))

# 단순 바 차트 3
barplot(height, names.arg=name, main="부서별 영업 실적", col=rainbow(length(height)), xlab="부서", ylab="영업 실적(억 원)")

barplot(height, names.arg=name, main="부서별 영업 실적", 
        col=rainbow(length(height)), xlab="부서", ylab="영업 실적(억 원)", ylim=c(0,25))

# 데이터 라벨 출력
bp <- barplot(height, names.arg=name, main="부서별 영업 실적",
      col=rainbow(length(height)), xlab="부서", ylab="영업 실적(억 원)", ylim=c(0,25))
text(x=bp, y=height, labels=round(height,0), pos=3)	

bp <- barplot(height, names.arg=name, main="부서별 영업 실적",
      col=rainbow(length(height)), xlab="부서", ylab="영업 실적(억 원)", ylim=c(0,25))
text(x=bp, y=height, labels=round(height,0), pos=1)

# 바 차트의 수평 회전(가로 막대)
barplot(height, names.arg=name, main="부서별 영업 실적",
        col=rainbow(length(height)),
        xlab="영업 실적(억 원)", ylab="부서", horiz=TRUE, width=50)

# 스택형 바 차트(Stacked Bar Chart)		
height1 <- c(4, 18, 5, 8)
height2 <- c(9, 15, 20, 6)
height <- rbind(height1, height2)
height
		
name <- c("영업 1팀", "영업 2팀", "영업 3팀", "영업 4팀")
legend_lbl <- c("2014년", "2015년")

barplot(height, main="부서별 영업 실적",
        names.arg=name,
        xlab="부서", ylab="영업 실적(억 원)",
        col=c("darkblue","red"),
        legend.text=legend_lbl,
        ylim=c(0, 35))
		
# 그룹형 바 차트(Grouped Bar Chart)
barplot(height, main="부서별 영업 실적",
        names.arg=name,
        xlab="부서", ylab="영업 실적(억 원)",
        col=c("darkblue","red"),
        legend.text=legend_lbl,
        ylim=c(0, 30),
        beside=TRUE,
        args.legend=list(x='top'))
		
# Generic X-Y Plotting
data(women)
women

weight <- women$weight
plot(weight)

height <- women$height
plot(height, weight, xlab="키", ylab="몸무게")

# Simple Scatter Plot
weight <- women$weight
height <- women$height
plot(height, weight, xlab="키", ylab="몸무게", pch=23,
     col="blue", bg="yellow", cex=1.5)

## p.139 (3) 히스토그램

# 지진의 강도에 대한 히스토그램
data(quakes)
head(quakes)

mag <- quakes$mag
mag

hist(mag, main="지진 발생 강도의 분포", xlab="지진 강도", ylab="발생 건수")

colors <- c("red", "orange", "yellow", "green", "blue", "navy", "violet")
hist(mag, main="지진 발생 강도의 분포", xlab="지진 강도", ylab="발생 건수",
     col=colors, breaks=seq(4, 6.5, by=0.5))

hist(mag, main="지진 발생 강도의 분포", xlab="지진 강도", ylab="상대도수",
     col=colors, breaks=seq(4, 6.5, by=0.5), freq=FALSE)	 
	
hist(mag, main="지진 발생 강도의 분포", xlab="지진 강도", ylab="상대도수",
     col=colors, breaks="Sturges", freq=FALSE)	

## p.144 (4) 박스 플롯	 
	 
# Box Plot
data(quakes)
mag ＜- quakes$mag
min(mag)
max(mag)
median(mag)
quantile(mag, c(0.25, 0.5, 0.75))
boxplot(mag, main="지진 발생 강도의 분포", xlab="지진", ylab="발생 건수",col="red")
  