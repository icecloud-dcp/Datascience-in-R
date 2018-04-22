## p.173 (2) ���۸� �ٷ��

# ����(����) �߽��� ���� ���
install.packages("ggmap")
library(ggmap)
gc <- geocode(enc2utf8('����'))
cen <- as.numeric(gc)
map <- get_googlemap(center=cen)
ggmap(map)

# ���� �ּ���(��û�ϵ� �ܾ籺) �߽��� ���� ���
gc <- geocode(enc2utf8('��û�ϵ� �ܾ籺'))
cen <- as.numeric(gc)
map <- get_googlemap(center=cen, maptype="terrain")
ggmap(map)

# ��ü �������� ���� ���
map <- get_googlemap(center=cen, maptype="roadmap")
ggmap(map, extent="device")

# ��Ŀ ���
gc <- geocode(enc2utf8('��û�ϵ� �ܾ籺'))
cen <- as.numeric(gc)
map <- get_googlemap(center=cen, maptype="roadmap", marker=gc)
ggmap(map, extent="device")

p.180 (3) ���� ����(�ܾ��Ȱ�)�� ���� ���� ǥ���ϱ�

# �ܾ��Ȱ� ��ġ�� ��Ŀ ���
install.packages("ggplot2")
library(ggplot2)
names <- c("1.������/����", "2.����/������", "3.���ξ�", "4.�ϼ���", "5.�߼���", "6.�󼱾�")
addr <- c("��û�ϵ� �ܾ籺 ������ ����� 644-33",
          "��û�ϵ� �ܾ籺 �ܼ��� ���Ƿ� 3827",
          "��û�ϵ� �ܾ籺 �밭�� ���ξ�2�� 42",
          "��û�ϵ� �ܾ籺 �ܼ��� ���ϰ��� 1337",
          "��û�ϵ� �ܾ籺 �ܼ��� ���ϰ��� 868-2",
          "��û�ϵ� �ܾ籺 �ܼ��� ���ϰ��� 790")
		  
gc <- geocode(enc2utf8(addr))
gc

df <- data.frame(name=names, lon=gc$lon, lat=gc$lat)
df

cen <- c(mean(df$lon), mean(df$lat))
cen

map <- get_googlemap(center=cen, maptype="roadmap", zoom=11, marker=gc)
ggmap(map)

# ��Ŀ�� ���� ���
gmap <- ggmap(map)
gmap + geom_text(data=df, aes(x=lon, y=lat), size=5, label=df$name)

# ���� ���
map <- get_googlemap(center=cen, maptype = "roadmap", zoom=11)
gmap <- ggmap(map, fullpage=TRUE, legend="topright")
gmap + geom_text(data=df, aes(lon, lat, colour=factor(name)), size=10, label=seq_along(df$name))

## p.185 (4) ���� ��ġ ���

# ���� ������ ��Ŀ ǥ��
library(ggmap)
df <- head(quakes, 100)
df

cen <- c(mean(df$long), mean(df$lat))
cen

gc <- data.frame(lon=df$long, lat=df$lat)
gc$lon <- ifelse(gc$lon>180, -(360-gc$lon), gc$lon)
gc

map <- get_googlemap(center=cen, scale=1, maptype="roadmap",zoom=4, marker=gc)
ggmap(map, extent="device")

# ���� �Ը� ǥ��
map <- get_googlemap(center=cen, scale=1, maptype="roadmap",zoom=5)
ggmap(map, fullpage = TRUE) + geom_point(data=df, aes(x=long, y=lat, size=mag), alpha=0.5)
    