par(mfrow=c(1,1), mar=c(5,8,4,5))
cars <- read.csv("~/Document/data_science/Visual/R_create_Visuals/dataset/dep_by_gearbox.csv", header=TRUE,  stringsAsFactors=FALSE, row.names = 1)
cars['year'] = 2017-cars['year']

png(filename="~/Document/data_science/Visual/R_create_Visuals/png/dep_by_gearbox.png")
cars1<-subset(cars, gearbox=='auto')
cars2<-subset(cars, gearbox=='CVT')
cars3<-subset(cars, gearbox=='auto|manual')
cars3[5,3] = 0.287
cars3[1,3]=0.154
cars4<-subset(cars, gearbox=='manual')
plot(x=cars1$year, y=cars1$dep_rate, type="l", main='Transmission', cex.main=1.5, xlim=c(0, 20), ylim=c(0.1, 1), ylab="Residual Ratio", xlab="Years", las=1, lwd=2, bty="n", cex.lab=1.5, cex.axis=1.5)
legend(8.5, 1, inset=.05, legend = c("Auto","Manual", "Auto w/ Manual"), cex=1.5, bty='n', fill=c('red', 'blue', 'black'), horiz=FALSE)
lines(x=cars1$year, y=cars1$dep_rate, col="blue", type='l', lwd=2.5)
lines(x=cars3$year, y=cars3$dep_rate, col="black", type='l', lwd=2.5)
lines(x=cars4$year, y=cars4$dep_rate, col="red", type='l', lwd=2.5)

dev.off()

