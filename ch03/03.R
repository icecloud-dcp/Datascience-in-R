## p059 (2) ���Ϳ� ���� ������

# ���� �����
x <- c(80, 85, 70)
x

c(80, 85, 70) -> x
x

# ���� ���Ұ� �ϳ��� ��
x <- c(80)
x

x <- 80
x

# ��� ������
x <- 5+2
x

x <- 5/3
x

x <- 5^2
x

x <- 5%%3
x

x <- 5%/%3
x

���Ϳ� ��Ģ����
x <- c(1, 2, 3, 4) # 4�� ����
y <- c(2, 3, 4, 5) # 4�� ����
z <- c(1, 2)       # 2�� ����

w <- x+y
w

w <- x+5
w

w <- y/2
w

w <- x+z
w

w <- x/z
w

w <- z/x
w

# ���� �ٸ� ������ ������ ����
x <- c(1, 2, 3)
x

y <- c("A", "B", "c")
y

y <- c("A", 1, 2)
y

z <- y + 1

# �� ������
x <- 5 �� 3
x 

y <- c(10, 20, 30)
z <- y <= 10
z

# ���� ������
x <- TRUE
y <- FALSE
x | y

x & y

x <- 3
!x

isTRUE(y)

z <- c(TRUE, FALSE, FALSE)
z | y

# �������� ������ ���� �����
x <- seq(1, 10)
x

x <- 1:10
x

x <- seq(10, 1)
x

y <- 10:1
y

x <- seq(1, 10, by=3)
x

y <- seq(1, 10, length.out=5)
y

# �ݺ����� ������ ���� �����
x <- c(1, 2, 3)
rep(x, times=2)

rep(x, each=2)

# ������ ���� ���� �� ����
x <- c(1, 2, 3, 4, 5)
x[2]

x[c(1, 3, 5)]

x[-c(2, 4)]

x[x��2]

x[x��=2 & x��=4]

x[2] <- 20
x

x[c(3, 4)] <- 15
x

x[x��=15] <- 10
x

# ���Ϳ� ���� �Լ��� ���
x <- seq(1:10)
sum(x)

mean(x)

var(x)

sd(x)

sqrt(x)

length(x)

x <- c(1, 2, -3)
abs(x)

# NULL, NA(not available), NaN(not a number)
x <- NULL
is.null(x)

y <- c(1, 2, 3, NA, 5)
y

z <- 10/0
z

w <- 0/0
w

## 074 (3) �迭 

# 1���� �迭
x <- array(1:3, dim=c(3))
x

# 2���� �迭 ����� p076
x <- array(1:6, dim=c(2, 3))
x

x <- array(c(2, 4, 6, 8, 10, 12), dim=c(2, 3))
x

# 2���� �迭�� ��� �� ����� ����
x[1, 3]

x[, 3]

x[,-3]

x[1, 2] <- 20
x

# 2���� �迭�� ��� �� �̸� �߰�
names <- list(c("1��", "2��"), c("1��", "2��", "3��"))

x <- array(c(2, 4, 6, 8, 10, 12), dim=c(2, 3), dimnames=names)
x

x["1��", ]

# 3���� �迭
x <- array(1:24, dim=c(2, 3, 4))
x

## p079 (4) ���

# ��� �����
x <- matrix(1:6, nrow=2)
x

x <- matrix(1:6, nrow=2, byrow=TRUE)
x

x[1, 3]

# ��� �� �̸� �ֱ�
names <- list(c("1��", "2��"), c("1��", "2��", "3��"))

matrix(1:6, nrow=2, byrow=TRUE, dimnames=names)

# ���� ���տ� ���� ��� �����
v1 <- c(1, 2, 3, 4)
v2 <- c(5, 6, 7, 8)
v3 <- c(9, 10, 11, 12)
x <- cbind(v1, v2, v3)
x

# ��� �� �̸� �ֱ�
rownames(x) <- c("1��", "2��", "3��", "4��")
x

colnames(x) <- c("1��", "2��", "3��")
x

rbind(v1, v2, v3)

## p082 (5) ����Ʈ

# ����Ʈ �����
x <- list("ȫ�浿", "2016001", 20, c("IT����", "������ ����"))
x

y <- list("����"="ȫ�浿", "�й�"="2016001", "����"=20, "��������"=c("IT����",
"������ ����"))
y

# ������ ���
y <- list(����="ȫ�浿", �й�="2016001", ����=20, ��������=c("IT����", "������ ��
��"))

# ��ü ���� ���
x["����"]

x[["����"]]

x$����

## p086 (6) ������ ������

# �� ���� ���� ������ ���� ������ ������ �����
x <- data.frame(����=c("ȫ�浿", "�տ���"), ����=c(20, 30), �ּ�=c("����", "�λ�"))
x

# ������ ���
x <- data.frame("����"=c("ȫ�浿", "�տ���"), "����"=c(20, 30), "�ּ�"=c("����", "�λ�"))

# ���� �� ���� �߰�
x <- cbind(x, �а�=c("e-����", "�濵"))
x

x <- rbind(x, data.frame(����="�����", ����=40, �ּ�="�ĸ�", �а�="����"))
x

# ��� �� ����
x[3, 2]

x[3,]

x[, 2]

x[-2,]

x["����"]

x$����

x[["����"]]

x[[1]]

x[[1]][2]

x[1, 2] <- 21
x

x[1, "����"] <- 22
x

## p090 (7) ������ ���� �б�

# ������ ��Ʈ ��� ����
library(help=datasets)

# data() �Լ��ε� ������ ��Ʈ ��� ��ȸ�� ������
data()

# ������ ��Ʈ�� ������ ����
data(quakes)

quakes

head(quakes, n=10)

tail(quakes, n=6)

# ������ ��Ʈ ���� ����
names(quakes)

str(quakes)

dim(quakes)

# ������ ��Ʈ ��� ����
summary(quakes)

summary(quakes$mag)

# ������ ��Ʈ �����ϰ� �б�
write.table(quakes, "c:/temp/quakes.txt", sep=",")

x <- read.csv("c:/temp/quakes.txt", header=T)
x

x <- read.csv(file.choose(), header=T)
x

# ������Ʈ�� ������ ���� �б�
url <- "https://vincentarelbundock.github.io/Rdatasets/csv/datasets/
Titanic.csv"
x <- read.csv(url)
x

## p101 (8) �Լ� �����

# ��ġ�� ��Ƽ���ͷ� ��ȯ�ϴ� �Լ��� ���ǿ� ȣ��
inch_to_cm <- function(inch) {
    cm <- inch * 2.54
    return(cm)
}

inch_to_cm(3)
   