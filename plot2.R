library(dplyr)
library(ggplot2)
library(data.table)
library(lubridate)

#Read data
consumpt<-fread('consumpt_1-2Feb2007.csv',na.strings=c("?",",,"))

#Convert dates to POSIX
consumpt$Date<-dmy_hms(paste(consumpt$Date,consumpt$Time))

#Make a plot
plot(consumpt$Date, 
     consumpt$Global_active_power,
     type="line",
     xlab='',
     ylab='Global Active Power,(kilowatts)',
     main='')



#Copy Plot to PNG file
dev.copy(png, file = "plot2.png",width=480,height=480)
dev.off()



