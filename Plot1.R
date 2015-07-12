# This R script reads the data from the file and plots a histogram, illustrating 
# the frequency of different usage levels of Global Active Power in kilowatts

# reading data from the file
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.string = "?")

#take the subset from the data only for a 2-day period "1/2/2007" to "2/2/2007"
test <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

# plot a histogram with columns colored "red"
hist(test$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")

# create a png file by copying the plot from the screen device with dimensions 480x480 
dev.copy(png, filename="Plot1.png",width = 480, height= 480, units ="px")
dev.off()