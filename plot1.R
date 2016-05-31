library(dplyr)
library(ggplot2)
library(data.table)

consumpt<-fread('consumpt_1-2Feb2007.csv',na.strings=c("?",",,"))

#Create a  PLOT1
hist(consumpt$Global_active_power, 
     xlab="Global Active Power,(kilowatts)", 
     col='green', 
     main='Global Active Power'
)

#Copy Plot to PNG device
dev.copy(png, file = "plot1.png",width=480,height=480)
dev.off()