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
globalReactivePower <- as.numeric(Data_part$Global_reactive_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)
voltage <- as.numeric(Data_part$Voltage)


## plot and copy to file
    par(mfrow = c(2, 2)) 
    plot(datetime, globalActivePower, type="l", xlab="", 
          ylab="Global Active Power", cex=0.2)
    plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
    plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
         lines(datetime, subMetering2, type="l", col="red") 
         lines(datetime, subMetering3, type="l", col="blue")
         legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
    plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
    dev.copy(png, file="plot4.png", height=480, width=480)
    dev.off()
