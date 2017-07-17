cars <- read.csv("~/Document/data_science/Visual/R_create_Visuals/dataset/dep_by_int.csv", header=TRUE,  stringsAsFactors=FALSE, row.names = 1)
cars['year'] = 2017-cars['year']
#png(filename="~/Document/data_science/Visual/R_create_Visuals/dataset/tss.png")
cars1<-subset(cars, int_=='black_')
cars2<-subset(cars, int_=='beige_')
cars3<-subset(cars, int_=='brown_')
cars4<-subset(cars, int_=='grey_')
#cars5<-subset(cars, capa_range==5)

plot(x=0, y=0, type="l", xlim=c(0, 20), ylim=c(0.1, 1), main="Residual Values of Cars", ylab="Residual Ratio", xlab="Years", las=1, lwd=2, bty="n", cex.axis=0.7)
lines(x=cars1$year, y=cars1$dep_rate, col="blue", type='l', lwd=2.5)
lines(x=cars2$year, y=cars2$dep_rate, col="red", type='l', lwd=2.5)
lines(x=cars3$year, y=cars3$dep_rate, col="black", type='l', lwd=2.5)
lines(x=cars4$year, y=cars4$dep_rate, col="yellow", type='l', lwd=2.5)
legend("topright", inset=.05, c("LIA","ABB"), fill=c('red', 'blue'), horiz=TRUE)

dev.off()

def cat(curr):
  x = float(curr)
if x<2.2:
  return 1
elif x<2.4:
  return 2
elif x<2.8:
  return 3
elif x<3.2:
  return 4
else:
  return 5