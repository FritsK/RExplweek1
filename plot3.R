#get data for plot 1
setwd("C:/TEMP/R")
hpc<-read.csv("household_power_consumption.csv", sep=";")

#select to-be-plotted days
selday<- (hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007")
hpc2 <- hpc[selday,]

#convert data to datetime
datetime<-paste(hpc2$Date, hpc2$Time, sep=" ") #concatenate Date and Time column
dt<-strptime(datetime, format="%d/%m/%Y %H:%M:%S") #make datetime
#convert data to numeric
sm1<-as.numeric(as.character(hpc2$Sub_metering_1))
sm2<-as.numeric(as.character(hpc2$Sub_metering_2))
sm3<-as.numeric(as.character(hpc2$Sub_metering_3))


#create plot3 file
png(filename = "plot3.png", width = 480, height = 480)
plot(dt,sm1, type="l", ylab="Energy sub metering")
lines(dt,sm2,type="l", col=2)
lines(dt,sm3,type="l", col=4)
legend("topright", lty=1, col=c(1,2,4), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()