hpc <- read.table("household_power_consumption.txt",header=TRUE, sep = ";")

hpc = subset(hpc, as.Date(Date,"%d/%m/%Y") >= '2007-02-01' & as.Date(Date,"%d/%m/%Y") < '2007-02-03')

hpc$Global_active_power = as.numeric(as.character(hpc$Global_active_power))

png("plot1.png", width = 480, height = 480)
hist(hpc$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()


