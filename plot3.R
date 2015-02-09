rm(list=ls())
library(lubridate)
source("./funcs.R")

ReadOrDownloadData() # Reads data file if in local directory, downloads if it is not


dat["DateTime"] <- paste(dat[["Date"]],dat[["Time"]],sep=" ")
dat["DateTime"] <- dmy_hms(dat[["DateTime"]])

with(dat,
     {
        timeRange <<- range(DateTime)
        print(timeRange)
        submeterRange <<- (range(rbind(Sub_metering_1,Sub_metering_2,Sub_metering_3)))
        
         
         
     
        #time <- dat[["DateTime"]]
        submeter1 <- dat[["Sub_metering_1"]]
        submeter2 <- dat[["Sub_metering_2"]]
        submeter3 <- dat[["Sub_metering_3"]]
        submeter <- cbind(submeter1,submeter2,submeter3)
        
        #timeRange <- range(time)
        #submeterRange <- range(c(submeter1,submeter2,submeter3))



plot(timeRange,submeterRange,
     type="n",
     xlab="",
     ylab="Energy sub metering")

colors <- c("black","red","blue")

for (i in 1:3)
{
    lines(DateTime,submeter[,i],col=colors[i])
}

names = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
linetype = c(1,1,1)

legend("topright",names,lty=linetype,col=colors)
})
#dev.copy(png, file = "plot3.png")
#dev.off()