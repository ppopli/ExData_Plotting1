##Reading Data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".",na.strings = "?")

##Subsetting data
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Converting date and time to POSIXlt class
date_time <- paste(data$Date,data$Time)
date_time <- strptime(date_time, "%d/%m/%Y%H:%M:%S")

##Opening Graphic Device
png(file = "plot2.png", width = 480, height = 480)

plot(date_time, data$Global_active_power, type="l", xlab = "",ylab="Global Active Power (kilowatts)")

## Closing Graphic Device
dev.off()