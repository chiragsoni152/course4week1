#below code creates the first graph in assignment
#data is collected from Electric power consumption as per forked library


#first read the relevant data from dates mentioned in assignment
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
graph_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#below code creates Global Active Power graph
globalActivePower <- as.numeric(graph_data$Global_active_power)
#relevant dimensions as mentioned

png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
