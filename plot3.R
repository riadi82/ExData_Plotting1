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
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)


## plot and copy to file
    plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")    
    lines(datetime, subMetering2, type="l", col="red")
    lines(datetime, subMetering3, type="l", col="blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
    dev.copy(png, file="plot3.png", height=480, width=480)
    dev.off()
