## p.263 (4) ������ ��õ �丮�� �м��� ���� ���̹� ���α� �˻�

# ����Ű ����
# install.packages("RCurl")
# install.packages("XML")
library(RCurl)
library(XML)

# ���α� �˻� API
searchUrl <- "https://openapi.naver.com/v1/search/blog.xml"

# Ŭ���̾�Ʈ ID�� ��ũ��
Client_ID <- "LzRE.....HCwT"
Client_Secret <- "m8.....3I"

# �˻��� 
query <- URLencode(iconv("������õ�丮","euc-kr","UTF-8"))
url <- paste(searchUrl, "?query=", query, "&display=20", sep="")

doc <- getURL(url, 
    httpheader = c('Content-Type' = "application/xml",
        'X-Naver-Client-Id' = Client_ID,
        'X-Naver-Client-Secret' = Client_Secret))

# ���α� ���뿡 ���� ����Ʈ �����		
doc2 <- htmlParse(doc, encoding="UTF-8")
text <- xpathSApply(doc2, "//item/description", xmlValue) 
text

# ���� Ŭ���� �����
# install.packages("KoNLP")
# install.packages("RColorBrewer")
# install.packages("wordcloud")
library(KoNLP)
library(RColorBrewer)   
library(wordcloud)

useSejongDic() 

noun <- sapply(text, extractNoun, USE.NAMES=F)
noun   

noun2 <- unlist(noun)  
noun2

word_count <- table(noun2)   
word_count   

noun2 <- Filter(function(x){nchar(x) >= 2}, noun2)
noun2  

noun2 <- gsub('\\d+', '', noun2)
noun2 <- gsub('<b>', '', noun2)
noun2 <- gsub('</b>', '', noun2)
noun2 <- gsub('&amp', '', noun2)
noun2 <- gsub('&lt', '', noun2)
noun2 <- gsub('&gt', '', noun2)
noun2 <- gsub('&quot;', '', noun2)
noun2 <- gsub('"', '', noun2)
noun2 <- gsub('\'', '', noun2)
noun2 <- gsub(' ', '', noun2)
noun2 <- gsub('-', '', noun2)
noun2

wordcount <- table(noun2)
head(sort(wordcount, decreasing=T), 30)

palete <- brewer.pal(9,"Set1") 

wordcloud(names(wordcount), freq=wordcount, scale=c(5,0.25), rot.per=0.25, min.freq=1, random.order=F,  random.color=T, colors=palete)
          