ReadOrDownloadData <- function()
{
    
    fileName <- "./household_power_consumption.txt"
    
    if(!file.exists(fileName))
    {
        url <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        temp <- tempfile()
        download.file(url,temp)
        path <- unzip(temp)
        unlink(temp)
    }
    
    firstLine <- 66638
    lastLine  <- 69517
    numRows   <- lastLine - firstLine
    colNames    <- colnames(read.delim(fileName,sep=";",nrow=1,header=TRUE))
    
    dat <<- read.delim(fileName, sep=";", skip = firstLine, nrows = numRows, col.names = colNames)


}