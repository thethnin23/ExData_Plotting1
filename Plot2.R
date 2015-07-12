# This R Script reads the data from the file and 
# plots Global Active Power in kilowatts across a 2-day period by time.

# reads the data from the file 
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.string = "?")

# takes the subset of the data for a 2-day period 
test <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

# converts date and time columns to R date and time objects 
newDateTime <- strptime(paste(test$Date, test$Time), format = "%d/%m/%Y %H:%M:%S")
newtest <- data.frame(test, DateTime = newDateTime)

# plots a line graph using Global Active Power data against the time 
with(newtest, plot(DateTime, Global_active_power, type="l", xlab = "", ylab = "Global Active Power(kilowatts)"))

# create a png file by copying the plot from the screen device with dimensions 480x480 
dev.copy(png, filename="Plot2.png", width = 480, height= 480, units ="px")
dev.off()