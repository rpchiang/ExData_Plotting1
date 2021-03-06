# plot1.R
#
#
working_directory <- "G:/R Programming/Data Science 4 - Exploratary Data Analysis/Week 1/"
setwd(working_directory)

power_data <- read.csv(paste(working_directory, "household_power_consumption.txt", sep=""), 
                       sep=";", 
                       stringsAsFactors=FALSE)

gap <- subset(power_data, 
              power_data$Date %in% c("1/2/2007", "2/2/2007"))

gap$Global_active_power <- as.numeric(gap$Global_active_power)

# start plotting
png(filename = "plot1.png", units = "px", height = 480, width = 480)

hist(gap$Global_active_power[!is.na(gap$Global_active_power)], 
     main  = "Global Active Power", 
     xlab  = "Global Active Power (kilowatts)", 
     ylab  = "Frequency", 
     col   = "red")

dev.off()
