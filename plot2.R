#Defining some variables: file name, title of the plot and X label
fileName <- "household_power_consumption.txt"
yLabel = "Global Active Power (Kilowatts)" 

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

# Openning the device on wich to plot the Histogram
# the default size is 480x480 pixels
png(file="plot2.png")

#Plotting the Global Active power in term of weekdays by using a line type
plot(shpc$Date_time, shpc$Global_active_power, type="l", ylab=yLabel, xlab="")

# Closing the device to release resourses
dev.off()