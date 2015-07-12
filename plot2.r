library(data.table)
library(lubridate)
data <- data.table(read.csv("household_power_consumption.txt",sep=";",na.string="?"))
nrow(data)
sdata <- data[Date =="1/2/2007" | Date=="2/2/2007"]
sdata$DateTime<-dmy(sdata$Date)+hms(sdata$Time)

library(datasets)
plot(sdata$DateTime, sdata$Global_active_power, type = "l", col = "black",ylab="Globale Active Power(kilowatts)",xlab="")
dev.copy(png,filename = 'plot2.png', width = 480, height = 480, units="px")
dev.off()