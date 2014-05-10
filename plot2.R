## code to construct plot 2 of project 1 in Exploratory data analysis course

#set working directory and read in file
setwd("/Users/amit/datascispec/exdata/")
powerfile <- "household_power_consumption.txt"
dat <- read.table(powerfile, header=TRUE, sep=";", na.strings="?")

#convert date and time to R date and time classes
date <- as.Date(dat$Date, "%d/%m/%Y")
datetime <- strptime(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")

# only plot data from 2007-02-01 to 2007-02-02
ind <- which( (date>="2007-02-01") & (date<="2007-02-02"))

#plot of global_active_power
globpower <- dat$Global_active_power[ind]
png(filename="plot2.png", width=480, height=480, units="px")
plot(datetime[ind], ts(globpower), type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()