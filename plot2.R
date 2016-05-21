
## Get All The Dataset
dataSource <- "D:/R_Programming/Coursera Training/exdata-data-household_power_consumption
                /household_power_consumption.txt"
dataHousehold <- read.table(dataSource, header=TRUE, sep=";", 
                stringsAsFactors=FALSE, dec=".")

## subset the data for 1 - 2 July 2007

Data_part <- dataHousehold[dataHousehold$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(Data_part$Date, Data_part$Time, sep=" "), 
             "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(Data_part$Global_active_power)


## plot and copy to file
    plot(datetime, globalActivePower, type="l", xlab="", 
         ylab="Global Active Power (kilowatts)")
    dev.copy(png, file="plot2.png", height=480, width=480)
    dev.off()
