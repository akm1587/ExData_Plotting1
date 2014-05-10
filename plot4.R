## code to construct plot 4 of project 1 in Exploratory data analysis course

#set working directory and read in file
setwd("/Users/amit/datascispec/exdata/")
powerfile <- "household_power_consumption.txt"
dat <- read.table(powerfile, header=TRUE, sep=";", na.strings="?")

#convert date and time to R date and time classes
date <- as.Date(dat$Date, "%d/%m/%Y")
datetime <- strptime(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")

# only plot data from 2007-02-01 to 2007-02-02
ind <- which( (date>="2007-02-01") & (date<="2007-02-02"))
globpower <- dat$Global_active_power[ind]
voltage <- dat$Voltage[ind]
meter1 <- dat$Sub_metering_1[ind]
meter2 <- dat$Sub_metering_2[ind]
meter3 <- dat$Sub_metering_3[ind]
globreact <- dat$Global_reactive_power[ind]
png(filename="plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))
plot(datetime[ind], ts(globpower), type="l", xlab="", 
     ylab="Global Active Power")

plot(datetime[ind], ts(voltage), type="l", xlab="datetime", ylab="Voltage")

plot(datetime[ind], ts(meter1), type="l", xlab="", 
     ylab="Energy sub metering")
legtxt <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend(x="topright", legtxt, col=c("black", "red","blue"), lty=c(1,1,1), 
       bty="n")
lines(datetime[ind], ts(meter2), type="l", col="red")
lines(datetime[ind], ts(meter3), type="l", col="blue")

plot(datetime[ind], ts(globreact), type="l", xlab="datetime", 
     ylab="Global_reactive_power")
dev.off()
