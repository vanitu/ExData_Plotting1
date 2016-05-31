library(dplyr)
library(ggplot2)
library(data.table)
library(lubridate)

#Read data
consumpt<-fread('consumpt_1-2Feb2007.csv',na.strings=c("?",",,"))

#Convert dates to POSIX
consumpt$Date<-dmy_hms(paste(consumpt$Date,consumpt$Time))

#Creating 4 plot functions
plot1<-function(df){
  #Make a plot
  plot(df$Date, 
       df$Global_active_power,
       type="l",
       xlab='',
       ylab='Global Active Power,(kilowatts)',
       main='')
  
}   

plot2<-function(df){
  plot(df$Date, 
       df$Voltage,
       type="l",
       xlab='datetime',
       ylab='Voltage',
       main='')
  
}
    
plot3<-function(df){
#Make a plot with 1st submetering
plot(x=df$Date,
     y=df$Sub_metering_1,
     type="l",
     xlab='',
     ylab='Energy sub metering',
     main='')

#Adding 2 submetering lines
lines(df$Date,df$Sub_metering_2,col='red')
lines(df$Date,df$Sub_metering_3,col='green')

#Adding Legend
legend("topright" ,lty=1,col = c('black',"blue", "red"), cex=.7,legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
}

plot4<-function(df){
  plot(df$Date, 
       df$Global_reactive_power,
       type="l",
       xlab='datetime',
       ylab='Voltage',
       main='')
}


#Set multiple plots 
par(mfrow = c(2, 2))

plot1(consumpt)
plot2(consumpt)
plot3(consumpt)
plot4(consumpt)


#Copy Plot to PNG file
dev.copy(png, file = "plot4.png",width=480,height=480)
dev.off()



