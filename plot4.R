## Reading data

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".",na.strings = "?")

## Subsetting Data

data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Converting data and time to POSIXlt

date_time <- paste(data$Date,data$Time)
date_time <- strptime(date_time, "%d/%m/%Y%H:%M:%S")

##Opening Graphic Device

png(file = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))
plot(date_time, data$Global_active_power, type="l", xlab = "",ylab="Global Active Power")

plot(date_time, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(date_time,data$Sub_metering_1, type = "l", xlab = "",ylab = "Energy sub metering")
lines(date_time, data$Sub_metering_2, type = "l",col = "red")
lines(date_time, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2, col=c("black", "red", "blue"))

plot(date_time, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

##closing graphic device
dev.off()