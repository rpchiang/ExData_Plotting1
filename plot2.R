# plot2.R
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
     as.numeric(gap$Global_active_power), 
     xlab="", 
     ylab="Global Active Power (kilowatts)", 
     type="l")