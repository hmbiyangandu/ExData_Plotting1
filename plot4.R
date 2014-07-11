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
png(file="plot4.png")

# Defining a 2 col x 2 row matrix to receive the 4 plots
par(mfrow=c(2,2))

# Plotting data
with(shpc, {
  # Plot (1,1)
  plot(shpc$Date_time, shpc$Global_active_power, type="l", ylab="Global Active Power", xlab="")
  
  # Plot (1,2)
  plot(shpc$Date_time, shpc$Voltage, type="l", ylab="Voltage", xlab="Datetime")
  
  # Plot (2,1)
  plot(shpc$Date_time, shpc$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(shpc$Date_time, shpc$Sub_metering_2, col="red")
  lines(shpc$Date_time, shpc$Sub_metering_3, col="blue")
  legend("topright", pch="_", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  # Plot (2,2)
  plot(shpc$Date_time, shpc$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="Datetime")
  
})
dev.off()