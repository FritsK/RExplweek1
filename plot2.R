#get data for plot 1
setwd("C:/TEMP/R")
hpc<-read.csv("household_power_consumption.csv", sep=";")

#select to-be-plotted days
selday<- (hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007")
hpc2 <- hpc[selday,]

#convert data to numeric
gap<-as.numeric(as.character(hpc2$Global_active_power))
#convert data to datetime
datetime<-paste(hpc2$Date, hpc2$Time, sep=" ") #concatenate Date and Time column
dt<-strptime(datetime, format="%d/%m/%Y %H:%M:%S") #make datetime

#create plot2 file
png(filename = "plot2.png", width = 480, height = 480)
plot(dt,gap, type="l", ylab="Global Active Power (kilowatts)")
dev.off()