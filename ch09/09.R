## p.228 (3) 버스위치정보조회서비스의 오픈 API 활용

# 노선 버스 번호에 대한 버스 경로 ID 확인
install.packages("XML")
library(XML)
# API 키
# API_key <- "DEp3%2BU.....DQ%3D%3D"
bus_No <- "402"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
xmlfile <- xmlParse(url)
xmltop <- xmlRoot(xmlfile)
xmltop

# 노선 ID에 대한 버스 실시간 위치 확인
# install.packages("XML")
# library(XML)
# API 키
# API_key <- "DEp3%2BU.....DQ%3D%3D"
busRouteId <- "100100063"
url <- paste("http://ws.bus.go.kr/api/rest/buspos/getBusPosByRtid?ServiceKey=", API_key, "&busRouteId=", busRouteId, sep="")
xmlfile <- xmlParse(url)
xmltop <- xmlRoot(xmlfile)
xmltop

# 노선 버스 번호에 대한 버스 경로 ID 확인
# install.packages("XML")
# library(XML)
# API 키
# API_key <- "DEp3%2BU.....DQ%3D%3D"
bus_No <- "402"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
doc <- xmlParse(url)
top <- xmlRoot(doc)
top

df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))
df

busRouteId <- df$busRouteId
busRouteId

# 노선 ID에 대한 버스 실시간 위치 정보 확인
url <- paste("http://ws.bus.go.kr/api/rest/buspos/getBusPosByRtid?ServiceKey=", API_key, "&busRouteId=", busRouteId, sep="")
doc <- xmlParse(url)
top <- xmlRoot(doc)
top

df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))
df

# 구글 맵에 버스 위치 출력
df$gpsX <- as.numeric(as.character(df$gpsX))
df$gpsY <- as.numeric(as.character(df$gpsY))
gc <- data.frame(lon=df$gpsX, lat=df$gpsY)
gc

cen <- c(mean(gc$lon), mean(gc$lat))
map <- get_googlemap(center=cen, maptype="roadmap",zoom=12, marker=gc)
ggmap(map, extent="device")
            