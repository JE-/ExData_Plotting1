rm(list=ls())
setwd("C:/Main/Data Science (Coursera 2014)/Exploratory Data Analysis")
# load data into a data frame
data <- read.table("household_power_consumption.txt",sep=';',header=T,na.strings = "?")

# Reduce data frame to desired dates
data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
save(data, file = "myData.RData")
#-----------------------------------------------------------------------------------------------------

# Create plot1
rm(list=ls())
setwd("C:/Main/Data Science (Coursera 2014)/Exploratory Data Analysis")
load("myData.RData")
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

hist(data$Global_active_power, col="red",main='Global Active Power',
     xlab='Global Active Power (kilowatts)')
dev.copy(png,"plot1.png", width=480, height=480, units='px',res=100)
dev.off()
#-----------------------------------------------------------------------------------------------------

