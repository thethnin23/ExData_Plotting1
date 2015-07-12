# This R Script reads the data and plots four graphs in a 2x2 layout 
# where first graph is a histogram of Global Active Power data
# the second graph is a line graph of Voltage data across the period
# the third graph is a line graph for three categories of Sub_Metering data across time
# the fourth graph is a line graph of Global reactive Power data across time

# reads the data from the file 
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.string = "?")

# takes the subset of the data for a 2-day period 
test <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
newDatetime <- strptime(paste(test$Date, test$Time), format = "%d/%m/%Y %H:%M:%S")
newtest <- data.frame(test, DateTime = newDateTime)

# creates the layout for the four graphs
par(mfrow = c(2,2), mar = c(5,5,1,1))

# creates the histogram
with(newtest, plot(DateTime, Global_active_power, type="l", xlab = "", ylab = "Global Active Power(kilowatts)"))

# creates the line graph for Voltage data
with(newtest,plot(DateTime, Voltage, type="l", xlab="datetime",ylab="Voltage"))

# creates the line graph for Sub_Metering data
with(newtest, plot(DateTime, Sub_metering_1, type="l", col = "black", xlab = "", ylab = "Energy sub metering"))
lines(newtest$DateTime, newtest$Sub_metering_2, type="l", col = "red")
lines(newtest$DateTime, newtest$Sub_metering_3, type="l", col = "blue")
legend("topright",c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), lty=c(1,1), lwd=c(2.5,2.5), col = c("black","red", "blue"), cex = 0.5, bty = "n" )

# creates the line graph for Global Reactive Power data 
with(newtest, plot(DateTime,Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))

# create a png file by copying the plot from the screen device with dimensions 480x480 
dev.copy(png, filename="Plot4.png", width = 480, height= 480, units ="px")
dev.off()
