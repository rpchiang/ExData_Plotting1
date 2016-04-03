# plot3.R
#
#

working_directory <- "G:/R Programming/Data Science 4 - Exploratary Data Analysis/Week 1/"

power_data <- read.csv(paste(working_directory, "household_power_consumption.txt", sep=""), 
                       sep=";", 
                       stringsAsFactors=FALSE)

gap <- subset(power_data, 
              power_data$Date %in% c("1/2/2007", "2/2/2007"))


sampleTime <-strptime(paste(gap$Date, gap$Time), 
                      format="%d/%m/%Y %H:%M:%S")

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
