cars <- read.csv("~/Document/data_science/Visual/R_create_Visuals/dataset/dep_by_model.csv", header=TRUE,  stringsAsFactors=FALSE, row.names = 1)
cars['year'] = 2017-cars['year']
png(filename="~/Document/data_science/Visual/R_create_Visuals/png/dep_by_model.png")
cars1<-subset(cars, model_level==1)
cars2<-subset(cars, model_level==2)
cars3<-subset(cars, model_level==3)
cars4<-subset(cars, model_level==0)
#cars5<-subset(cars, capa_range==5)

plot(x=0, y=0, type="l", cex.main=1.5, xlim=c(0, 20), ylim=c(0.1, 1), main="Model Segment", ylab="Residual Ratio", xlab="Years", las=1, lwd=2, bty="n", cex.lab=1.5, cex.axis=1.5)
lines(x=cars1$year, y=cars1$dep_rate, col="blue", type='l', lwd=2.5)
lines(x=cars2$year, y=cars2$dep_rate, col="red", type='l', lwd=2.5)
lines(x=cars3$year, y=cars3$dep_rate, col="black", type='l', lwd=2.5)
#lines(x=cars4$year, y=cars4$dep_rate, col="yellow", type='l', lwd=2.5)
legend(8.5, 1, inset=.05, c("D-segment","E-segment","F-segment"), bty='n', fill=c('blue','red', 'black'), cex=1.5, horiz=FALSE)

dev.off()

