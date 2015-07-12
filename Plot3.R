# This R Script reads the data and plots a line graph using three categories of data 
# (sub_Metering_1, Sub_Metering_2,Sub_Metering_3) against the time 

# reads the data from the file 
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.string = "?")

# takes the subset of the data for a 2-day period 
test <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

# converts date and time columns to R date and time objects 
newDatetime <- strptime(paste(test$Date, test$Time), format = "%d/%m/%Y %H:%M:%S")
newtest <- data.frame(test, DateTime = newDateTime)
# creates a line graph for the data Sub_Metering_1 against DateTime 
with(newtest, plot(DateTime, Sub_metering_1, type="l", col = "black", xlab = "", ylab = "Energy sub metering"))

# adds another line to the graph for the data Sub_Metering_2 
lines(newtest$DateTime, newtest$Sub_metering_2, type="l", col = "red")

# adds another line to the graph for the data Sub_Metering_3
lines(newtest$DateTime, newtest$Sub_metering_3, type="l", col = "blue")

# adds legend
legend("topright",c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), lty=c(1,1), lwd=c(1,1), col = c("black","red", "blue"), cex = 0.75)

# create a png file by copying the plot from the screen device with dimensions 480x480 
dev.copy(png, filename="plot3.png", width = 480, height= 480, units ="px")
dev.off()