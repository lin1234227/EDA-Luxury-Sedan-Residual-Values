cars <- read.csv("~/Document/data_science/Visual/R_create_Visuals/dataset/dep_by_capacity_detail.csv", header=TRUE,  stringsAsFactors=FALSE, row.names = 1)
cars[168, 3]=0.25
library(plotrix)
#cars['year'] = 2017-cars['year']
png(filename="~/Document/data_science/Visual/R_create_Visuals/png/dep_by_capa.png")
par(bg = 'white', fg='black', mar=c(5,5,4,2))

plot(0, 0, type="l", main='Engine Capacity', cex.main=1.5, xlim=c(0, 20), ylim=c(0.1, 1), ylab="Residual Ratio", xlab="Years", las=1, lwd=2, bty="n", cex.lab=1.5, cex.axis=1.5)
capacities <- unique(cars$capacity)
colfunc <- colorRampPalette(c("blue", "red"))
#heatcols <-colfunc(17)
heatcols <- heat.colors(25)
for (i in 1:length(capacities)){
  curr_cap <-capacities[i]
  curr_cars <- cars[cars$capacity == curr_cap,]
  curr_cars['year'] = 2017-curr_cars['year']
  curr_col <- heatcols[25-i]
  if (length(curr_cars[,1])>8){
    lines(x=curr_cars$year, y=curr_cars$dep_rate, col=curr_col, type='l', lwd=1.5)
    }
}
gradient.rect(11, 0.6, 13, 0.9, col=rev(heatcols), nslices=15,gradient="y",border=par("fg"))
text(10, 0.6, '1.5', col='black', cex=1.5)
text(10, 0.9, '6.5', col='black', cex=1.5)
dev.off()
