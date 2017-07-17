cars <- read.csv("~/Document/data_science/Visual/cars.com/R_create_Visuals/dataset/dep_by_country.csv", header=TRUE,  stringsAsFactors=FALSE, row.names = 1)
cars['year'] = 2017-cars['year']
cars1<-subset(cars, country=='G')
cars1[36, 3] = 0.911
cars2<-subset(cars, country=='J')

#png(filename="~/Document/data_science/Visual/R_create_Visuals/dataset/1-dep_by_country.png")

par(bg = 'white', fg='black', mar=c(5,5,4,2))
par(col ='blue', col.lab='black', col.axis='black', cex.lab=1.8, las=0, col.main='black',col.sub='blue')
plot(x=cars1$year, y=cars1$dep_rate, type="l", xlim=c(0, 20), ylim=c(0.1, 1), ylab="Residual Ratio", xlab="Years", las=1, lwd=2, bty="n", cex.axis=1.2)
lines(x=cars1$year, y=cars1$dep_rate, col="blue", type='l', lwd=3.5)
lines(x=cars2$year, y=cars2$dep_rate, col="red", type='l', lwd=3.5)
legend("topright", inset=.05, c("LIA","ABB"), fill=c('red', 'blue'), bty='n', horiz=TRUE, pt.lwd=15)

#dev.off()

