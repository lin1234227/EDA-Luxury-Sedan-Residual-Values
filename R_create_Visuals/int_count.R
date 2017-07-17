library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")

text <- readLines("~/Document/data_science/Visual/R_create_Visuals/dataset/int_.txt")
docs <- Corpus(VectorSource(text))
inspect(docs)

dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d1 <- data.frame(word = names(v),freq=v)
d1 <-d1[c(-2), ]

#wordcloud
par(bg='white')
wordcloud(words = d$word, freq = d$freq, scale=c(3, 1), min.freq=200, max.words=200,
          random.color=TRUE, colors=brewer.pal(8, "Dark2"), random.order=FALSE, rot.per=0.35)

## pie charts
d1['color']='yellow'
d1 <-d1[c(-7:-12), ]
de<-data.frame("others",787, 'yellow')
names(de)<-c("word","freq", 'color')
d1 <- rbind(d1, de)
d1[1,3]='black'
d1[2,3]='beige'
d1[3,3]='brown'
d1[4,3]='grey'
d1[5,3]='white'
d1[6,3]='red'
d1[7,3]='yellow'

piepercent<-round(100*d1$freq/sum(d1$freq), 1)
piepercent <-paste(piepercent, "%", sep = "")
pipercent <- paste(d1$word, ": ", sep="")
piepercent <-paste(pipercent, piepercent, sep = "")
#d['label']= d$wordsum(d$freq)
png(filename="~/Document/data_science/Visual/R_create_Visuals/png/int_pie.png")
pie(d1$freq, piepercent, init.angle = 45, radius = 0.6, border='black', col=d1$color, lty=1)
dev.off()

