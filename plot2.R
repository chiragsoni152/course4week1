#below code creates the second graph in assignment
#data is collected from Electric power consumption as per forked library
dataFile <- "./data/household_power_consumption.txt"

#first read the relevant data from dates mentioned in assignment
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data_graph <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#extracting features for graph
datetime <- strptime(paste(data_graph$Date, data_graph$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(data_graph$Global_active_power)

#relevant dimaneions
png("plot2.png", width=480, height=480)

#plot graph for Global Active Power kilowatts
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
