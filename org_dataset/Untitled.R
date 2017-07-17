acc <- read.dbf("~/Downloads/201312small-maps-tutorial/data/accident2001.dbf")
statepop <- read.csv("~/Downloads/201312small-maps-tutorial/data/states.csv")
statecnts <- count(acc$STATE)
states <- merge(statepop, statecnts, by.x="code", by.y="x")
states$accrate <- states$freq / (states$pop2012/1000000)

getColor.mon <- function(x) {
  
  if (x > 20) {
    col <- "#13373e"
  } else if (x > 15) {
    col <- "#246571"
  } else if (x > 10) {
    col <- "#308898"
  } else {
    col <- "#7bc7d5"
  }
  
  return(col)
}

# Draw the maps
par(mfrow=c(4,4), mar=c(0,0,0,0))
months <- 1:12
monthnames <- c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")
for (mon in months) {
  
  acc.mon <- acc[acc$MONTH == mon,]
  statecnts.mon <- count(acc.mon$STATE)
  states.mon <- merge(statepop, statecnts.mon, by.x="code", by.y="x")
  states.mon$accrate <- states.mon$freq / (states.mon$pop2012/1000000)
  
  # Match values to database region names
  m <- match(mapnames.fin, tolower(states.mon$name))
  maprates.mon <- states.mon$accrate[m]
  
  statecols.mon <- sapply(maprates.mon, FUN=getColor.mon)
  map("state", regions=states.mon$name[m], proj="albers", param=c(39,45), fill=TRUE, col=statecols, border=NA, resolution=0)
  
  text(mapproject(-99, 55), monthnames[mon], cex=1)
}
map("state", regions=states.mon$name[m], proj="albers", param=c(39,45), fill=TRUE, col=statecols, border=NA, resolution=0)
# Make-shift legend
plot(0, 0, type="n", axes=FALSE, xlim=c(0,30), ylim=c(0,2))
rect(c(5,10,15,20), c(1,1,1,1), c(10,15,20,25), c(1.25,1.25,1.25,1.25), col=sapply(c(6,11,16,21), getColor.mon), border="white", lwd=0.4)
text(15, 1.35, "Accidents per mil. pop.")
text(c(10,15,20), c(0.9,0.9,0.9), c(10,15,20), cex=0.8) # Tick labels
