#Defining some variables: dataset path, title of the plot, X axis label
fileName <- "household_power_consumption.txt"
mainTitle <- "Global Active Power"
xLabel = "Global Active Power (Kilowatts)" 

# Reading the dataset from the txt file
hpc = read.table(fileName, header=T, sep=";", na.strings="?")

#Subsetting the dataset
shpc = subset(hpc,Date=="1/2/2007"|Date=="2/2/2007")

# Deleting row names (We don't need it)
row.names(shpc) <- c()

# Openning the png device on which to plot the Histogram
# the default size is 480x480 pixels
png(file="plot1.png")

#Plotting the Histogram 
hist(shpc$Global_active_power,xlab= xLabel, col="red", main=mainTitle)

# Closing the device to release resources
dev.off()