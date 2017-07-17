library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")

text <- readLines("~/Document/data_science/Visual/R_create_Visuals/dataset/ext_.txt")
docs <- Corpus(VectorSource(text))
inspect(docs)

dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
d <-d[c(-6), ]
d <-d[c(-7:-13), ]
de<-data.frame("others",3180)
names(de)<-c("word","freq")
d <- rbind(d, de)
d['color']='grey'
d[1,3]='#C0C0C0'
d[2,3]='black'
d[3,3]='white'
d[4,3]='#A9A9A9'
d[5,3]='blue'
d[6,3]='red'
d[7,3]='yellow'

## wordcloud
par(bg='white')
wordcloud(words = d$word, freq = d$freq, scale=c(3, 1), min.freq=200, max.words=200,
          random.color=TRUE, colors=brewer.pal(8, "Dark2"), random.order=FALSE, rot.per=0.35)

## pie charts
piepercent<-round(100*d$freq/sum(d$freq), 1)
piepercent <-paste(piepercent, "%", sep = "")
pipercent <- paste(d$word, ": ", sep="")
piepercent <-paste(pipercent, piepercent, sep = "")
#d['label']= d$wordsum(d$freq)
png(filename="~/Document/data_science/Visual/R_create_Visuals/png/ext_pie.png")
pie(d$freq, piepercent, init.angle = 45, radius = 0.6, border='black', col=d$color, lty=1)
dev.off()
