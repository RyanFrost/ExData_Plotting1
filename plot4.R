rm(list=ls())
library(lubridate)
source("./funcs.R")

ReadOrDownloadData() # Reads data file if in local directory, downloads if it is not


dat["DateTime"] <- paste(dat[["Date"]],dat[["Time"]],sep=" ")
dat["DateTime"] <- dmy_hms(dat[["DateTime"]])

par(mfrow=c(2,2))

with(dat,
{
    # Top Right Figure
    plot(DateTime,
         Global_active_power,
         type="n",
         xlab="",
         ylab="Globabl Active Power")
    lines(DateTime,Global_active_power)
    
    # Top Left Figure
    plot(DateTime,
         Voltage,
         type="n",
         xlab="datetime",
         ylab="Voltage")
    lines(DateTime,Voltage)
    
    # Bottom Left Figure
    timeRange <- range(DateTime)
    submeterRange <- (range(rbind(Sub_metering_1,Sub_metering_2,Sub_metering_3)))
    
    submeter1 <- dat[["Sub_metering_1"]]
    submeter2 <- dat[["Sub_metering_2"]]
    submeter3 <- dat[["Sub_metering_3"]]
    submeter <- cbind(submeter1,submeter2,submeter3)

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
    
    legend("topright",names,lty=linetype,col=colors,bty="n")
    
    plot(DateTime,
         Global_reactive_power,
         type="n",
         xlab="datetime",
         ylab="Global_reactive_power")
    lines(DateTime,Global_reactive_power)
    
})


dev.copy(png, file = "plot4.png")
dev.off()