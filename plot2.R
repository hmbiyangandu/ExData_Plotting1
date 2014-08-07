#Defining some variables: dataset path, Y axis label
fileName <- "household_power_consumption.txt"
yLabel = "Global Active Power (Kilowatts)" 

# Reading the dataset from the txt file
hpc = read.table(fileName, header=T, sep=";", na.strings="?")

#Subsetting the dataset
shpc = subset(hpc,Date=="1/2/2007"|Date=="2/2/2007")

# Deleting row names (Optional)
row.names(shpc) <- c()

# Adding to the dataset a column "Date_time" to combine Date and Time in one Column
shpc$Date_time <- paste(shpc$Date,shpc$Time)

# Transform Date_time in Datetime values
shpc$Date_time <- strptime(shpc$Date_time,"%d/%m/%Y %H:%M:%S")

# Openning the png device on which to plot
# the default size is 480x480 pixels
png(file="plot2.png")

#Plotting the Global Active power / weekdays, by using a line type
plot(shpc$Date_time, shpc$Global_active_power, type="l", ylab=yLabel, xlab="")

# Closing the device to release resourses
dev.off()