#Defining some variables: file name, title of the plot and X label
fileName <- "household_power_consumption.txt"
mainTitle <- "Global Active Power"
xLabel = "Global Active Power (Kilowatts)" 

# Reading the dataset from the file
hpc = read.table(fileName, header=T, sep=";", na.strings="?")

#Subsetting the dataset
shpc = subset(hpc,Date=="1/2/2007"|Date=="2/2/2007")

# Deleting row names (We don't need it)
row.names(shpc) <- c()

# Openning the device on wich to plot the Histogram
# the default size is 480x480 pixels
png(file="plot1.png")

#Plotting the Histogram 
hist(shpc$Global_active_power,xlab= xLabel, col="red", main=mainTitle)

# Closing the device to release resourses
dev.off()