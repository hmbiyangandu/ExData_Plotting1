#Defining some variables: dataset path, Y axis label
fileName <- "household_power_consumption.txt"
yLabel = "Energy sub metering" 

# Reading the dataset from the file
hpc = read.table(fileName, header=T, sep=";", na.strings="?")

#Subsetting the dataset
shpc = subset(hpc,Date=="1/2/2007"|Date=="2/2/2007")

# Deleting row names (We don't need it)
row.names(shpc) <- c()

# Adding to the dataset a column "Date_time" to combine Date and Time in one Column
shpc$Date_time <- paste(shpc$Date,shpc$Time)

# Transform Date_time in Datetime values
shpc$Date_time <- strptime(shpc$Date_time,"%d/%m/%Y %H:%M:%S")

# Openning the device on wich to plot
# the default size is 480x480 pixels
png(file="plot3.png")

#Plotting Energy sub metering in term of weekdays by using a line type
plot(shpc$Date_time, shpc$Sub_metering_1, type="l", ylab=yLabel, xlab="")
lines(shpc$Date_time, shpc$Sub_metering_2, col="red")
lines(shpc$Date_time, shpc$Sub_metering_3, col="blue")
legend("topright", pch="_", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# Closing the device to release resourses
dev.off()