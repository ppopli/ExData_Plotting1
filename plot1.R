## Reading Data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".",na.strings = "?")

## Subset Data
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Opening Graphic device(png)
png(file = "plot4.png", height = 480, width =480)

hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")
##Closing Graphic Device
dev.off()