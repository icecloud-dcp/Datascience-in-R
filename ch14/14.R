## p.374 (3) 인공 신경망을 이용한 주가 예측

# 패키지 설치 및 로딩
install.packages("xlsx")
install.packages("nnet")
library(xlsx)
library(nnet)

#####################################
## 1단계: 인공신경망 모형구조 정의
#####################################
INPUT_NODES   <- 10
HIDDEN_NODES  <- INPUT_NODES * 2
OUTPUT_NODES  <- 5              
ITERATION     <- 500

#####################################
## 2단계: 시계열 데이터 읽기와 전처리 
#####################################
data <- read.xlsx2(file.choose(), 1)
data

data$종가 <- gsub(",", "", data$종가) 
data$종가 <- as.numeric(data$종가) 
df <- data.frame(일자=data$년.월.일, 종가=data$종가)
df

plot(df$일자, df$종가, xlab="일자", ylab="종가", type="o")

# 입출력 데이터 파일 생성 함수
getDataSet <- function(item, from, to, size) {
    dataframe <- NULL
    to <- to - size + 1                        # 마지막 행의 시작날짜 번호
    for(i in from:to) {                        # 각 행의 날짜 시작번호에 대한 반복
        start <- i                             # 각 행의 시작날짜 번호
        end   <- start + size - 1              # 각 행의 끝날짜 번호
        temp  <- item[c(start:end)]            # item에서 start~end 구간의 데이터 추출 
        dataframe <- rbind(dataframe, t(temp)) # t() 함수를 사용하여 열 단위의 데이터를 행으로 전환 후 데이터 프레임에 추가
    }  
    return(dataframe)                          # 데이터 프레임 반환 
}

#####################################
## 3단계: 테스트
#####################################
# 학습 입력 데이터 만들기
in_learning <- getDataSet(df$종가, 1, 111, INPUT_NODES)
in_learning

# 학습 목표치 데이터 만들기
out_learning <- getDataSet(df$종가, 11, 116, OUTPUT_NODES)
out_learning

# 학습
model <- nnet(in_learning, out_learning, size=HIDDEN_NODES, linout=TRUE, skip=TRUE, rang=0.1, maxit=ITERATION)

# 예측 입력 데이터 만들기
in_forecasting <- getDataSet(df$종가, 107, 116, INPUT_NODES)
in_forecasting

# 예측
predicted_values <- predict(model, in_forecasting, type="raw")
predicted_values

# 실제 값 데이터 만들기
real <- getDataSet(df$종가, 117, 121, OUTPUT_NODES)
real

# 에러 계산 및 출력
ERR <- abs(real - predicted_values)
MAPE <- mean(ERR / real) * 100
MAPE

#####################################
## 4단계: 최적모형 선정 (단일 모형이기 때문에 생략)
#####################################

#####################################
## 5단계: 예측
#####################################
# 학습 입력 데이터 만들기
in_learning <- getDataSet(df$종가, 1, 116, INPUT_NODES)
in_learning

# 학습 목표치 데이터 만들기
out_learning <- getDataSet(df$종가, 11, 121, OUTPUT_NODES)
out_learning

# 학습 
model <- nnet(in_learning, out_learning, size=HIDDEN_NODES, linout=TRUE, skip=TRUE, rang=0.1, maxit=ITERATION)

# 예측 입력 데이터 만들기
in_forecasting <- getDataSet(df$종가, 112, 121, INPUT_NODES)
in_forecasting 

# 예측
predicted_values <- predict(model, in_forecasting, type="raw")
predicted_values

plot(1:10, df$종가[112:121], xlab="기간", ylab="종가", xlim=c(0, 15), ylim=c(1800, 2000), type="o")
lines(11:15, predicted_values, type="o", col="red")
       