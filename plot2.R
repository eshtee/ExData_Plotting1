hpc <- read.table("household_power_consumption.txt",header=TRUE, sep = ";")

hpc = subset(hpc, as.Date(Date,"%d/%m/%Y") >= '2007-02-01' & as.Date(Date,"%d/%m/%Y") < '2007-02-03')
hpc$Global_active_power = as.numeric(as.character(hpc$Global_active_power))
hpc$DateTime = strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width = 480, height = 480)

plot(hpc$DateTime, hpc$Global_active_power,  type="l",ylab="Global Active Power (kilowatts)", xlab="")

dev.off()
