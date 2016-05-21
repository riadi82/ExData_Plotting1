
## Get All The Dataset
dataSource <- "D:/R_Programming/Coursera Training/exdata-data-household_power_consumption/household_power_consumption.txt"
dataHousehold <- read.table(dataSource, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## subset the data for 1 - 2 July 2007

Data_part <- dataHousehold[dataHousehold$Date %in% c("1/2/2007","2/2/2007") ,
globalActivePower <- as.numeric(Data_part$Global_active_power)

## Histogram plot and copy to file
    hist(Data_part$globalActivePower, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
    dev.copy(png, file="plot1.png", height=480, width=480)
    dev.off()

