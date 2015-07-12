library(data.table)
library(lubridate)
data <- data.table(read.csv("household_power_consumption.txt",sep=";",na.string="?"))
nrow(data)
sdata <- data[Date =="1/2/2007" | Date=="2/2/2007"]
sdata$DateTime<-dmy(sdata$Date)+hms(sdata$Time)

library(datasets)

par(mfrow=c(2,2))

#PLOT 1
plot(sdata$DateTime,sdata$Global_active_power, type="l", xlab="", ylab="Global Active Power")
#PLOT 2
plot(sdata$DateTime,sdata$Voltage, type="l", xlab="datetime", ylab="Voltage")

#PLOT 3
plot(sdata$DateTime,sdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(sdata$DateTime,sdata$Sub_metering_2,col="red")
lines(sdata$DateTime,sdata$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly

#PLOT 4
plot(sdata$DateTime,sdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png,filename = 'plot4.png', width = 480, height = 480, units="px")
dev.off()


