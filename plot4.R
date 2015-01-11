rm(list=ls())
setwd("C:/Main/Data Science (Coursera 2014)/Exploratory Data Analysis")
# load data into a data frame
data <- read.table("household_power_consumption.txt",sep=';',header=T,na.strings = "?")

# Reduce data frame to desired dates
data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
save(data, file = "myData.RData")
#-----------------------------------------------------------------------------------------------------

## create plot 4
rm(list=ls())
setwd("C:/Main/Data Science (Coursera 2014)/Exploratory Data Analysis")
load("myData.RData")
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2), mar=c(5,4,2,1), oma=c(1,1,1,1))
with(data, {
  plot(DateTime,Global_active_power, type = "l", 
       ylab = "Global Active Power", xlab = "")
  plot(DateTime, Voltage, type = "l", 
       ylab = "Voltage", xlab = "datetime")
  plot(DateTime,Sub_metering_1, type = "l", 
       ylab = "Energy sub metering", xlab = "")
  lines(DateTime, Sub_metering_2, col = 'Red')
  lines(DateTime, Sub_metering_3, col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(DateTime, Global_reactive_power, type = "l", 
       ylab = "Global_rective_power", xlab = "datetime")
})
dev.copy(png,"plot4.png", width=480, height=480, units='px')
dev.off()

