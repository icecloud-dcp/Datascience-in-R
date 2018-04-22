## p.302 (2) ��Ʈ��ũ �м� ��ǥ

# ��Ʈ��ũ �����
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

# ���� ����(g_star �׷���)
degree(g_star, normalized=FALSE)
degree(g_star, normalized=TRUE)

tmax <- centr_degree_tmax(g_star)
centralization.degree(g_star, normalized=FALSE)$centralization / tmax

# ���� ����(g_Y �׷���)
degree(g_Y, normalized=FALSE)
degree(g_Y, normalized=TRUE)

tmax <- centr_degree_tmax(g_Y)
centralization.degree(g_Y, normalized=FALSE)$centralization / tmax

# ���� ���� (g_ring �׷���)
degree(g_ring)
degree(g_ring, normalized=TRUE)

tmax <- centr_degree_tmax(g_ring)
centralization.degree(g_ring, normalized=FALSE)$centralization / tmax

# ���� (g_star �׷���)
closeness(g_star, normalized=FALSE)

closeness(g_star, normalized=TRUE)

tmax <- centralization.closeness.tmax(g_star)
centralization.closeness(g_star, normalized=FALSE)$centralization / tmax 

# ���� (g_Y �׷���)
closeness(g_Y)

closeness(g_Y, normalized=TRUE)

tmax <- centralization.closeness.tmax(g_Y)
centralization.closeness(g_Y, normalized=FALSE)$centralization / tmax

# ���� (g_ring �׷���)
closeness(g_ring)

closeness(g_ring, normalized=TRUE)

tmax <- centralization.closeness.tmax(g_ring)
centralization.closeness(g_ring, normalized=FALSE)$centralization / tmax

# �߰�(g_star �׷���)
betweenness(g_star, normalized=FALSE)

betweenness(g_star, normalized=TRUE)

tmax <- centralization.betweenness.tmax(g_star)
centralization.betweenness(g_star, normalized=FALSE)$centralization / tmax

# �߰� (g_Y �׷���)
betweenness(g_Y, normalized=FALSE)
betweenness(g_Y, normalized=TRUE)

tmax <- centralization.betweenness.tmax(g_Y)
centralization.betweenness(g_Y, normalized=FALSE)$centralization / tmax

# �߰� (g_ring �׷���)
betweenness(g_ring, normalized=FALSE)
betweenness(g_ring, normalized=TRUE)

tmax <- centralization.betweenness.tmax(g_ring)
centralization.betweenness(g_ring, normalized=FALSE)$centralization / tmax

# ��Ʈ��ũ �е�
graph.density(g_star)

# �ִ� ���
shortest.paths(g_ring)

get.shortest.paths(g_ring, "A")

get.shortest.paths(g_ring, "A", "C")

get.shortest.paths(g_ring, "A", c("C", "E"))

get.all.shortest.paths(g_ring, "A", c("C", "E"))

average.path.length(g_ring)

## p.329 (3) ���̽��� ����� ��Ʈ��ũ �м�

# ���̽��� ����� ������ �б�� �׷��� ���
library(igraph)
sn <- read.table(file.choose(), header=F)
head(sn)

tail(sn)

sn.df <- graph.data.frame(sn, directed=FALSE)
plot(sn.df)

# ���̽��� ����� 1���� ����� ����ڵ��� �׷���
sn1 <- subset(sn, sn$V1==1)
sn1.df <- graph.data.frame(sn1, directed=FALSE)
plot(sn1.df)

# ��Ʈ��ũ�� ũ��
vcount(sn.df)

ecount(sn.df)

V(sn.df)$name

vmax <- V(sn.df)$name[degree(sn.df)==max(degree(sn.df))]
vmax

degree(sn.df, vmax)

# ���� ����
summary(degree(sn.df))

plot(degree(sn.df), xlab="����� ��ȣ", ylab="���� ����", type='h')

sn.df.dist <- degree.distribution(sn.df)

plot(sn.df.dist, xlab="���� ����", ylab="Ȯ��")

# �߽ɼ��� �߽�ȭ
degree(sn.df, normalized=TRUE)

tmax <- centralization.degree.tmax(sn.df)
centralization.degree(sn.df, normalized=FALSE)$centralization / tmax

closeness(sn.df, normalized=TRUE)

tmax <- centralization.closeness.tmax(sn.df)
centralization.closeness(sn.df, normalized=FALSE)$centralization / tmax

betweenness(sn.df, normalized=TRUE)

tmax <- centralization.betweenness.tmax(sn.df)
centralization.betweenness(sn.df, normalized=FALSE)$centralization / tmax

# ��Ʈ��ũ �е�
graph.density(sn.df)

# ��Ʈ��ũ ���
average.path.length(sn.df)

sn10 <- subset(sn, sn$V1<10 & sn$V2<10)
sn10.graph <- graph.data.frame(sn10, directed=FALSE)
shortest.paths(sn10.graph)

get.shortest.paths(sn10.graph, "5")

get.shortest.paths(sn10.graph, "5", "9")

get.all.shortest.paths(sn10.graph, "5", c("8", "9"))
     