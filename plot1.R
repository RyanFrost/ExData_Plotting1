rm(list=ls())

source("./funcs.R")

ReadOrDownloadData() # Reads data file if in local directory, downloads if it is not

with(dat,
     {
        hist(Global_active_power,
        col  = "red",
        main = "Global Active Power",
        xlab = "Global Active Power (kilowatts)",
        ylab = "Frequency")
     })


dev.copy(png, file = "plot1.png")
dev.off()