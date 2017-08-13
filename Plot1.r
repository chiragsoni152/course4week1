library(dplyr)
library(lubridate)

# read the data
data_graph <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)

# clearing unrelevant variables
data_graph <- data_graph %>% select(V3) %>% mutate(V3 = as.numeric(as.character(V3)))

# below creates the histogram
hist(data$V3, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (killowatts)", ylab = "Frequency")
