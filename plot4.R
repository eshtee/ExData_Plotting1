hpc <- read.table("household_power_consumption.txt",header=TRUE, sep = ";")

hpc = subset(hpc, as.Date(Date,"%d/%m/%Y") >= '2007-02-01' & as.Date(Date,"%d/%m/%Y") < '2007-02-03')
hpc$Global_active_power = as.numeric(as.character(hpc$Global_active_power))
hpc$Sub_metering_1 = as.numeric(as.character(hpc$Sub_metering_1))
hpc$Sub_metering_2 = as.numeric(as.character(hpc$Sub_metering_2))
hpc$Sub_metering_3 = as.numeric(as.character(hpc$Sub_metering_3))
hpc$Voltage = as.numeric(as.character(hpc$Voltage))
hpc$Global_reactive_power = as.numeric(as.character(hpc$Global_reactive_power))
hpc$DateTime = strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S") 

png("plot4.png", width = 480, height = 480)

old.par <- par(mfrow=c(2, 2))

plot(hpc$DateTime, hpc$Global_active_power,  type="l",ylab="Global Active Power (kilowatts)", xlab="")

plot(hpc$DateTime, hpc$Voltage,  type="l",ylab="Voltage", xlab="datetime")

plot(hpc$DateTime, hpc$Sub_metering_1,col="black",  type="l",ylab="Energy sub metering", xlab="")
lines(hpc$DateTime, hpc$Sub_metering_2,col="red")
lines(hpc$DateTime, hpc$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),lwd=c(2.5,2.5,2.5), col=c("black","red","blue"))

plot(hpc$DateTime, hpc$Global_reactive_power,  type="l",ylab="Global_reactive_power", xlab="datetime")

par(old.par)

dev.off()