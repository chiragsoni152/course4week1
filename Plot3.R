#below code creates the third graph in assignment
#data is collected from Electric power consumption as per forked library

dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#first read the relevant data from dates mentioned in assignment

data_graph <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


#below code to subset the data
datetime <- strptime(paste(data_graph$Date, data_graph$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(data_graph$Global_active_power)

#convert to numeric
subMetering1 <- as.numeric(data_graph$Sub_metering_1)
subMetering2 <- as.numeric(data_graph$Sub_metering_2)
subMetering3 <- as.numeric(data_graph$Sub_metering_3)

#now plot using below code
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
