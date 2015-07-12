library(data.table)
library(lubridate)
data <- data.table(read.csv("household_power_consumption.txt",sep=";",na.string="?"))
nrow(data)
sdata <- data[Date =="1/2/2007" | Date=="2/2/2007"]
sdata$DateTime<-dmy(sdata$Date)+hms(sdata$Time)

library(datasets)

# plot data
lncol<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(sdata$DateTime,sdata$Sub_metering_1,type="l",col=lncol[1],ylab="Energy sub metering",xlab="")
lines(sdata$DateTime,sdata$Sub_metering_2,col=lncol[2])
lines(sdata$DateTime,sdata$Sub_metering_3,col=lncol[3])

# add legend
legend('topright',legend=lbls,col=lncol,lty='solid')

dev.copy(png,filename = 'plot3.png', width = 480, height = 480, units="px")
dev.off()