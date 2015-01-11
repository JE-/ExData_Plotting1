rm(list=ls())
setwd("C:/Main/Data Science (Coursera 2014)/Exploratory Data Analysis")
# load data into a data frame
data <- read.table("household_power_consumption.txt",sep=';',header=T,na.strings = "?")

# Reduce data frame to desired dates
data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
save(data, file = "myData.RData")
#-----------------------------------------------------------------------------------------------------

## Create plot 3
rm(list=ls())
setwd("C:/Main/Data Science (Coursera 2014)/Exploratory Data Analysis")
load("myData.RData")
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "red", "blue"))
dev.copy(png,"plot3.png", width=480, height=480, units='px')
dev.off()