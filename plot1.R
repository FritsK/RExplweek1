#get data for plot 1
setwd("C:/TEMP/R")
hpc<-read.csv("household_power_consumption.csv", sep=";")

#select to-be-plotted days
selday<- (hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007")
hpc2 <- hpc[selday,]

#convert data to numeric
gap<-as.numeric(as.character(hpc2$Global_active_power))

#create plot1 file
png(filename = "plot1.png", width = 480, height = 480)
hist(gap, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()