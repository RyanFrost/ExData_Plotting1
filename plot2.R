rm(list=ls())
library(lubridate)
source("./funcs.R")

ReadOrDownloadData() # Reads data file if in local directory, downloads if it is not


dat["DateTime"] <- paste(dat[["Date"]],dat[["Time"]],sep=" ")
dat["DateTime"] <- dmy_hms(dat[["DateTime"]])


with(dat,
     {
        plot(DateTime,
        Global_active_power,
        type="n",
        xlab="",
        ylab="Globabl Active Power (kilowatts)")
        lines(DateTime,Global_active_power)
     })

dev.copy(png, file = "plot2.png")
dev.off()