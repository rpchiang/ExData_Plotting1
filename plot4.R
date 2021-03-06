# plot4.R
#
#

working_directory <- "G:/R Programming/Data Science 4 - Exploratary Data Analysis/Week 1/"
setwd(working_directory)

power_data <- read.csv(paste(working_directory, "household_power_consumption.txt", sep=""), 
                       sep=";", 
                       stringsAsFactors=FALSE)

gap <- subset(power_data, 
              power_data$Date %in% c("1/2/2007", "2/2/2007"))


sampleTime <-strptime(paste(gap$Date, gap$Time), 
                      format="%d/%m/%Y %H:%M:%S")

# start plotting
png(filename = "plot4.png", units = "px", height = 480, width = 480)

par(mfcol = c(2,2))
# 1st subplot
plot(sampleTime, 
     as.numeric(gap$Global_active_power), 
     xlab="", 
     ylab="Global Active Power (kilowatts)", 
     type="l")

# 2nd subplot
plot(sampleTime, 
     as.numeric(gap$Sub_metering_1), 
     ylim = range(c(0,38)),
     xlab = "", 
     ylab = "Energy sub metering", 
     type = "l",
     col  = "black")
par(new = TRUE)
plot(sampleTime, 
     as.numeric(gap$Sub_metering_2), 
     ylim = range(c(0,38)),
     xlab = "", 
     ylab = "", 
     type = "l",
     col  = "red")
par(new=TRUE)
plot(sampleTime, 
     as.numeric(gap$Sub_metering_3), 
     ylim = range(c(0,38)),
     xlab = "", 
     ylab = "", 
     type = "l",
     col  = "blue")

legend("topright", 
       lty = 1, 
       col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# 3rd subplot
plot(sampleTime, 
     as.numeric(gap$Voltage), 
     xlab="datetime", 
     ylab="Voltage", 
     type="l")

# 4th subplot
plot(sampleTime, 
     as.numeric(gap$Global_reactive_power), 
     xlab="datetime", 
     ylab = "Global_reactive_power",
     type="l")

dev.off()
