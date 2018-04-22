## p.281 (3) 특정 웹 페이지의 상품 정보 스크래핑

# 웹 스크래핑 URL
library(XML)
url <- "http://www.coupang.com/np/search?q=%EC%97%AC%EC%84%B1%ED%81%AC%EB%A1%9C%EC%8A%A4%EB%B0%B1"
doc <- htmlParse(url, encoding="UTF-8")

# 쿠팡 상품 페이지 소스 변경에 따라, 상품명 검색 경로 수정 
# prod_name <- xpathSApply(doc, "//ul[@id='productList']//dd[@class='name']", xmlValue) 
prod_name <- xpathSApply(doc, "//ul[@id='productList']//div[@class='name']", xmlValue) 
prod_name
prod_name <- gsub('\n', '', prod_name)
# 쿠팡 상품 페이지 소스 변경에 따라, '\t'(탭 키) 추가 제거
prod_name <- gsub('\t', '', prod_name)

prod_name <- gsub(' ', '', prod_name)
prod_name

price     <- xpathSApply(doc, "//ul[@id='productList']//strong[@class='price-value']", xmlValue)
price

df <- data.frame(상품명=prod_name, 가격=price) 
df

df$상품명 <- format(df$상품명, justify = "left")
df

## p.286 (4) 다수 웹 페이지의 상품 정보 스크래핑

# 웹 스크래핑 URL
# library(XML)
url <- "http://www.coupang.com/np/search?q=%EC%97%AC%EC%84%B1%ED%81%AC%EB%A1%9C%EC%8A%A4%EB%B0%B1&channel=user&component=&eventCategory=SRP&sorter=&minPrice=&maxPrice=&priceRange=&filterType=&listSize=36&filter=&filterKey=&isPriceRange=false&brand=&rating=0&page="

df.products <- NULL

for (page in 1:10) {
    url2 <- paste(url, page, sep="") 
    doc <- htmlParse(url2, encoding="UTF-8")
    # 쿠팡 상품 페이지 소스 변경에 따라, 상품명 검색 경로 수정 
    # prod_name <- xpathSApply(doc, "//ul[@id='productList']//dd[@class='name']", xmlValue) 
    prod_name <- xpathSApply(doc, "//ul[@id='productList']//div[@class='name']", xmlValue) 
    prod_name <- gsub('\n', '', prod_name)
    # 쿠팡 상품 페이지 소스 변경에 따라, '\t'(탭 키) 추가 제거
    prod_name <- gsub('\t', '', prod_name)
	
    prod_name <- gsub(' ', '', prod_name)
    price     <- xpathSApply(doc, "//ul[@id='productList']//strong[@class='price-value']", xmlValue)
    df <- data.frame(상품명= prod_name, 가격=price) 
    df.products <- rbind(df.products, df) 
}
df.products

df.products$상품명 <- format(df.products$상품명, justify = "left")
df.products
     