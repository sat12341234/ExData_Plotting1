#Assignment to create 3rd plot

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

#change dates
datetime <- paste(as.Date(data2$Date), data2$Time)
head(datetime)
data2$Datetime <- as.POSIXct(datetime)
head(data2$Datetime) 

# plot on screen
plot(data2$Sub_metering_1 ~ data2$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
lines(data2$Sub_metering_2 ~ data2$Datetime,col='Red')
lines(data2$Sub_metering_3 ~ data2$Datetime,col='Red')

# add legend
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Open plot file, copy the plot and close the graphic device.
dev.copy(png, file="plot3.png",height=480,width=480)
dev.off()
