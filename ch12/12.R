## p.302 (2) 네트워크 분석 지표

# 네트워크 만들기
install.packages("igraph")
library(igraph)

g_star <- graph(edges=NULL,n=NULL,directed=FALSE)
g_star <- g_star + vertex("A", shape="circle", size=30, color="yellow")
g_star <- g_star + vertices("B", "C", "D", "E", "F", shape="circle", size=30)
g_star <- g_star + edge("A", "B")
g_star <- g_star + edges("A", "C",  "A", "D", "A", "E", "A", "F")
plot(g_star)

vcount(g_star)  # length(V(g_star))
ecount(g_star)  # length(E(g_star))

g_Y <- graph(edges=NULL,n=NULL,directed=FALSE)
g_Y <- g_Y + vertices("A", "B", "C", "D", "E", "F", shape="circle", size=30)
g_Y <- g_Y + edge("A", "B", "A", "C", "A", "D", "D", "E", "E", "F")
plot(g_Y)

g_ring <- graph(edges=NULL,n=NULL,directed=FALSE)
g_ring <- g_ring + vertices("A", "B", "C", "D", "E", "F", shape="circle", size=30)
g_ring <- g_ring + edge("A", "B", "B", "C", "C", "D", "D", "E", "E", "F", "F", "A")
plot(g_ring)

# 연결 정도(g_star 그래프)
degree(g_star, normalized=FALSE)
degree(g_star, normalized=TRUE)

tmax <- centr_degree_tmax(g_star)
centralization.degree(g_star, normalized=FALSE)$centralization / tmax

# 연결 정도(g_Y 그래프)
degree(g_Y, normalized=FALSE)
degree(g_Y, normalized=TRUE)

tmax <- centr_degree_tmax(g_Y)
centralization.degree(g_Y, normalized=FALSE)$centralization / tmax

# 연결 정도 (g_ring 그래프)
degree(g_ring)
degree(g_ring, normalized=TRUE)

tmax <- centr_degree_tmax(g_ring)
centralization.degree(g_ring, normalized=FALSE)$centralization / tmax

# 근접 (g_star 그래프)
closeness(g_star, normalized=FALSE)

closeness(g_star, normalized=TRUE)

tmax <- centralization.closeness.tmax(g_star)
centralization.closeness(g_star, normalized=FALSE)$centralization / tmax 

# 근접 (g_Y 그래프)
closeness(g_Y)

closeness(g_Y, normalized=TRUE)

tmax <- centralization.closeness.tmax(g_Y)
centralization.closeness(g_Y, normalized=FALSE)$centralization / tmax

# 근접 (g_ring 그래프)
closeness(g_ring)

closeness(g_ring, normalized=TRUE)

tmax <- centralization.closeness.tmax(g_ring)
centralization.closeness(g_ring, normalized=FALSE)$centralization / tmax

# 중개(g_star 그래프)
betweenness(g_star, normalized=FALSE)

betweenness(g_star, normalized=TRUE)

tmax <- centralization.betweenness.tmax(g_star)
centralization.betweenness(g_star, normalized=FALSE)$centralization / tmax

# 중개 (g_Y 그래프)
betweenness(g_Y, normalized=FALSE)
betweenness(g_Y, normalized=TRUE)

tmax <- centralization.betweenness.tmax(g_Y)
centralization.betweenness(g_Y, normalized=FALSE)$centralization / tmax

# 중개 (g_ring 그래프)
betweenness(g_ring, normalized=FALSE)
betweenness(g_ring, normalized=TRUE)

tmax <- centralization.betweenness.tmax(g_ring)
centralization.betweenness(g_ring, normalized=FALSE)$centralization / tmax

# 네트워크 밀도
graph.density(g_star)

# 최단 경로
shortest.paths(g_ring)

get.shortest.paths(g_ring, "A")

get.shortest.paths(g_ring, "A", "C")

get.shortest.paths(g_ring, "A", c("C", "E"))

get.all.shortest.paths(g_ring, "A", c("C", "E"))

average.path.length(g_ring)

## p.329 (3) 페이스북 사용자 네트워크 분석

# 페이스북 사용자 데이터 읽기와 그래프 출력
library(igraph)
sn <- read.table(file.choose(), header=F)
head(sn)

tail(sn)

sn.df <- graph.data.frame(sn, directed=FALSE)
plot(sn.df)

# 페이스북 사용자 1번과 연결된 사용자들의 그래프
sn1 <- subset(sn, sn$V1==1)
sn1.df <- graph.data.frame(sn1, directed=FALSE)
plot(sn1.df)

# 네트워크의 크기
vcount(sn.df)

ecount(sn.df)

V(sn.df)$name

vmax <- V(sn.df)$name[degree(sn.df)==max(degree(sn.df))]
vmax

degree(sn.df, vmax)

# 연결 정도
summary(degree(sn.df))

plot(degree(sn.df), xlab="사용자 번호", ylab="연결 정도", type='h')

sn.df.dist <- degree.distribution(sn.df)

plot(sn.df.dist, xlab="연결 정도", ylab="확률")

# 중심성과 중심화
degree(sn.df, normalized=TRUE)

tmax <- centralization.degree.tmax(sn.df)
centralization.degree(sn.df, normalized=FALSE)$centralization / tmax

closeness(sn.df, normalized=TRUE)

tmax <- centralization.closeness.tmax(sn.df)
centralization.closeness(sn.df, normalized=FALSE)$centralization / tmax

betweenness(sn.df, normalized=TRUE)

tmax <- centralization.betweenness.tmax(sn.df)
centralization.betweenness(sn.df, normalized=FALSE)$centralization / tmax

# 네트워크 밀도
graph.density(sn.df)

# 네트워크 경로
average.path.length(sn.df)

sn10 <- subset(sn, sn$V1<10 & sn$V2<10)
sn10.graph <- graph.data.frame(sn10, directed=FALSE)
shortest.paths(sn10.graph)

get.shortest.paths(sn10.graph, "5")

get.shortest.paths(sn10.graph, "5", "9")

get.all.shortest.paths(sn10.graph, "5", c("8", "9"))
     