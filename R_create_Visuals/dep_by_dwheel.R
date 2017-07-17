cars <- read.csv("~/Document/data_science/Visual/R_create_Visuals/dataset/dep_by_dwheel.csv", header=TRUE,  stringsAsFactors=FALSE, row.names = 1)
cars['year'] = 2017-cars['year']

png(filename="~/Document/data_science/Visual/R_create_Visuals/png/dep_by_dwheel.png")
#cars1<-subset(cars, dwheel=='2WD')
cars2<-subset(cars, dwheel=='AWD')
cars3<-subset(cars, dwheel=='RWD')
cars4<-subset(cars, dwheel=='FWD')
plot(0, 0, type="l", main='Drivetrain', cex.main=1.5, xlim=c(0, 20), ylim=c(0.1, 1), ylab="Residual Ratio", xlab="Years", las=1, lwd=2, bty="n", cex.lab=1.5, cex.axis=1.5)
#lines(x=cars1$year, y=cars1$dep_rate, col="blue", type='l', lwd=1.5)
lines(x=cars2$year, y=cars2$dep_rate, col="red", type='l', lwd=2.5)
lines(x=cars3$year, y=cars3$dep_rate, col="blue", type='l', lwd=2.5)
lines(x=cars4$year, y=cars4$dep_rate, col="black", type='l', lwd=2.5)

legend(8.5, 1, inset=0, c("AWD","RWD","FWD"), fill=c('red','blue', 'black'), cex=1.5, bty='n', horiz=FALSE)

dev.off()

