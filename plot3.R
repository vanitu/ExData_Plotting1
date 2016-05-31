library(dplyr)
library(ggplot2)
library(data.table)
library(lubridate)

#Read data
consumpt<-fread('consumpt_1-2Feb2007.csv',na.strings=c("?",",,"))

#Convert dates to POSIX
consumpt$Date<-dmy_hms(paste(consumpt$Date,consumpt$Time))

#Make a plot with 1st submetering
plot(x=consumpt$Date,
     y=consumpt$Sub_metering_1,
     type="l",
     xlab='',
     ylab='Energy sub metering',
     main='')

#Adding 2 submetering lines
lines(consumpt$Date,consumpt$Sub_metering_2,col='red')
lines(consumpt$Date,consumpt$Sub_metering_3,col='green')

#Adding Legend
legend("topright" ,lty=1,col = c('black',"blue", "red"), cex=.7,legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))


#Copy Plot to PNG file
dev.copy(png, file = "plot3.png",width=480,height=480)
dev.off()


