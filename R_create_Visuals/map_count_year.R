library(foreign)    # To read .dbf file
library(maps)       # To draw map
library(plyr)
library(mapproj)

states<- read.csv("~/Document/data_science/Visual/R_create_Visuals/dataset/state_count_year.csv", header=TRUE,  stringsAsFactors=FALSE, row.names = 1)
states['color']='grey'
heatcols <- rev(heat.colors(22))

par(mfrow=c(6,6), mar=c(0,0,0,0))
#plot(0, 0, type="n", axes=FALSE, xlim=c(0,100), ylim=c(0,80))
years <- 1985:2017
for (curr_year in years) {
  curr_states <- states[states$year == curr_year,]
  for (i in 1:length(curr_states[,1])){
    if(curr_states[i, 3]>5){
      curr_states[i, 3]=heatcols[1]
    }
    else{
      curr_states[i, 5]=heatcols[22]
    }
  }
  map("state", regions=curr_states$State, proj="albers", param=c(39,45), fill=TRUE, col=curr_states$color, exact = TRUE, border=NA, resolution=0)
  text(mapproject(-99, 55), toString(curr_year), cex=1)
}

# Make-shift legend
#rect(c(5,10,25,30), c(1,1,1,1), c(10,15,20,25), c(1.25,1.25,1.25,1.25), col=sapply(c(6,11440,16,21), getColor), border="black", lwd=0.4)
#text(15, 1.35, "Accidents per mil. pop.")
#text(c(10,15,20), c(0.9,0.9,0.9), c(10,15,20), cex=0.8) # Tick labels
