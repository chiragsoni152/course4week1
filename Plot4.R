#below code creates the fourth graph in assignment
#data is collected from Electric power consumption as per forked library

dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#first read the relevant data from dates mentioned in assignment


data_graph <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#below code used to extract features 

datetime <- strptime(paste(data_graph$Date, data_graph$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

subMetering1 <- as.numeric(data_graph$Sub_metering_1)
subMetering2 <- as.numeric(data_graph$Sub_metering_2)
subMetering3 <- as.numeric(data_graph$Sub_metering_3)

#convert to numeric
globalActivePower <- as.numeric(data_graph$Global_active_power)
globalReactivePower <- as.numeric(data_graph$Global_reactive_power)
voltage <- as.numeric(data_graph$Voltage)


#png function to set the required variables and dimensions
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 


#below code creates plots to be dislpayed

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
