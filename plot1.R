#Assignment to create 1st plot

# set working directory to where the data is
setwd ("/_Training/_Coursera/DataScience/4/Week1/Quiz")

# read the data with na set to ?
data1 <- read.table("household_power_consumption.txt",header = T, sep = ";",as.is=T,na.strings = "?")

#set the date to the format for easy processing
data1$Date <- as.Date(data1$Date,"%d/%m/%Y")

# limit the data to the date range
data2 <- data[data$Date >= '2007-02-01' & data$Date <= '2007-02-02',]

head(data2)
# set the other columns to numeric values. We just need 1 for the time being.
for(i in 3:9) data2[,i] <- as.numeric(data2[,i])

with(data2,hist(Global_active_power,main = "Global Active Power",col='red',xlab = 'Global Active Power (kilowatts)'))

# Open plot file, copy the plot and close the graphic device.
dev.copy(png, file="plot1.png", height=480,width=480)
dev.off()
