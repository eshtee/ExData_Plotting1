hpc <- read.table("household_power_consumption.txt",header=TRUE, sep = ";")

hpc = subset(hpc, as.Date(Date,"%d/%m/%Y") >= '2007-02-01' & as.Date(Date,"%d/%m/%Y") < '2007-02-03')
hpc$Global_active_power = as.numeric(as.character(hpc$Global_active_power))
hpc$Sub_metering_1 = as.numeric(as.character(hpc$Sub_metering_1))
hpc$Sub_metering_2 = as.numeric(as.character(hpc$Sub_metering_2))
hpc$Sub_metering_3 = as.numeric(as.character(hpc$Sub_metering_3))
hpc$DateTime = strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S") 

png("plot3.png", width = 480, height = 480)

plot(hpc$DateTime, hpc$Sub_metering_1,col="black",  type="l",ylab="Energy sub metering", xlab="")
lines(hpc$DateTime, hpc$Sub_metering_2,col="red")
lines(hpc$DateTime, hpc$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),lwd=c(2.5,2.5,2.5), col=c("black","red","blue"))

dev.off()