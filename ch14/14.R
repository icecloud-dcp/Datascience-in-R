## p.374 (3) �ΰ� �Ű���� �̿��� �ְ� ����

# ��Ű�� ��ġ �� �ε�
install.packages("xlsx")
install.packages("nnet")
library(xlsx)
library(nnet)

#####################################
## 1�ܰ�: �ΰ��Ű�� �������� ����
#####################################
INPUT_NODES   <- 10
HIDDEN_NODES  <- INPUT_NODES * 2
OUTPUT_NODES  <- 5              
ITERATION     <- 500

#####################################
## 2�ܰ�: �ð迭 ������ �б�� ��ó�� 
#####################################
data <- read.xlsx2(file.choose(), 1)
data

data$���� <- gsub(",", "", data$����) 
data$���� <- as.numeric(data$����) 
df <- data.frame(����=data$��.��.��, ����=data$����)
df

plot(df$����, df$����, xlab="����", ylab="����", type="o")

# ����� ������ ���� ���� �Լ�
getDataSet <- function(item, from, to, size) {
    dataframe <- NULL
    to <- to - size + 1                        # ������ ���� ���۳�¥ ��ȣ
    for(i in from:to) {                        # �� ���� ��¥ ���۹�ȣ�� ���� �ݺ�
        start <- i                             # �� ���� ���۳�¥ ��ȣ
        end   <- start + size - 1              # �� ���� ����¥ ��ȣ
        temp  <- item[c(start:end)]            # item���� start~end ������ ������ ���� 
        dataframe <- rbind(dataframe, t(temp)) # t() �Լ��� ����Ͽ� �� ������ �����͸� ������ ��ȯ �� ������ �����ӿ� �߰�
    }  
    return(dataframe)                          # ������ ������ ��ȯ 
}

#####################################
## 3�ܰ�: �׽�Ʈ
#####################################
# �н� �Է� ������ �����
in_learning <- getDataSet(df$����, 1, 111, INPUT_NODES)
in_learning

# �н� ��ǥġ ������ �����
out_learning <- getDataSet(df$����, 11, 116, OUTPUT_NODES)
out_learning

# �н�
model <- nnet(in_learning, out_learning, size=HIDDEN_NODES, linout=TRUE, skip=TRUE, rang=0.1, maxit=ITERATION)

# ���� �Է� ������ �����
in_forecasting <- getDataSet(df$����, 107, 116, INPUT_NODES)
in_forecasting

# ����
predicted_values <- predict(model, in_forecasting, type="raw")
predicted_values

# ���� �� ������ �����
real <- getDataSet(df$����, 117, 121, OUTPUT_NODES)
real

# ���� ��� �� ���
ERR <- abs(real - predicted_values)
MAPE <- mean(ERR / real) * 100
MAPE

#####################################
## 4�ܰ�: �������� ���� (���� �����̱� ������ ����)
#####################################

#####################################
## 5�ܰ�: ����
#####################################
# �н� �Է� ������ �����
in_learning <- getDataSet(df$����, 1, 116, INPUT_NODES)
in_learning

# �н� ��ǥġ ������ �����
out_learning <- getDataSet(df$����, 11, 121, OUTPUT_NODES)
out_learning

# �н� 
model <- nnet(in_learning, out_learning, size=HIDDEN_NODES, linout=TRUE, skip=TRUE, rang=0.1, maxit=ITERATION)

# ���� �Է� ������ �����
in_forecasting <- getDataSet(df$����, 112, 121, INPUT_NODES)
in_forecasting 

# ����
predicted_values <- predict(model, in_forecasting, type="raw")
predicted_values

plot(1:10, df$����[112:121], xlab="�Ⱓ", ylab="����", xlim=c(0, 15), ylim=c(1800, 2000), type="o")
lines(11:15, predicted_values, type="o", col="red")
       