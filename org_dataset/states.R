library(foreign)    # To read .dbf file
library(maps)       # To draw map
library(plyr)
library(mapproj)
file_loc <- "~/Downloads/201312small-maps-tutorial/data/accident2001.dbf"
acc <- read.dbf(file_loc)

par(mfrow=c(1,2), mar=c(0,0,0,0))
map("state", proj="albers", param=c(39,45), lwd=1, col="#cccccc")   # First the Albers
points(mapproject(acc$longitud, acc$latitude), col=NA, bg="#00000030", pch=21, cex=0.20)
map("state", proj="elliptic", par=100, lwd=1, col="#cccccc")        # Then the Elliptic
points(mapproject(acc$longitud, acc$latitude), col=NA, bg="#00007030", pch=21, cex=0.20)

# Map for every hour, sorted
par(mfrow=c(6,4), mar=c(0,0,0,0))
for (hr in 0:24) {
  
  if (hr == 0) {
    acc.hr <- acc[acc$HOUR == hr | acc$HOUR == 24,]
  } else if (hr == 24) {
    next
  } else {
    acc.hr <- acc[acc$HOUR == hr,]
  }
  
  map("state", proj="albers", param=c(39,45), lwd=0.3, col="#cccccc")
  points(mapproject(acc.hr$longitud, acc.hr$latitude), col=NA, bg="#000070", pch=21, cex=0.15)
  
  # Label the map
  text(mapproject(-99, 52), paste("Hour:", hr), cex=1)
}


