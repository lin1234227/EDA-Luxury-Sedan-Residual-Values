library(foreign)    # To read .dbf file
library(maps)       # To draw map
library(plyr)
library(mapproj)

states<- read.csv("~/Document/data_science/Visual/R_create_Visuals/dataset/state_count.csv", header=TRUE,  stringsAsFactors=FALSE, row.names = 1)
states['color']='grey'
colfunc <- colorRampPalette(c("white", "dark blue"))
heatcols <- rev(heat.colors(22))
heatcols <- colfunc(22)
png(filename="~/Document/data_science/Visual/R_create_Visuals/png/count_by_map.png")
for (i in 1:length(states[,1])){
  if(states[i, 3]<1){
    states[i, 4]=heatcols[12]
  }
  else if(states[i, 3]>6){
    states[i, 4]=heatcols[22]
  }
  else{
    states[i, 4]=heatcols[as.integer(states[i, 3]/0.5)+10]
  }
}
par(mfrow=c(1,1), mar=c(0,0,0,0))
plot(0, 0, type="n", axes=FALSE, xlim=c(0,100), ylim=c(0,80))

map("state", regions=states$State, proj="albers", param=c(39,45), fill=TRUE, exact=TRUE, col=states$color, border=NA, resolution=0)

# Make-shift legend
#rect(c(5,10,25,30), c(1,1,1,1), c(10,15,20,25), c(1.25,1.25,1.25,1.25), col=sapply(c(6,11440,16,21), getColor), border="black", lwd=0.4)
#text(15, 1.35, "Accidents per mil. pop.")
#text(c(10,15,20), c(0.9,0.9,0.9), c(10,15,20), cex=0.8) # Tick labels
dev.off()

