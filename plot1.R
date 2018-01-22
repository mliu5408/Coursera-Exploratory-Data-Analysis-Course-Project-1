setwd("D:/Coursera/coursera-exploratory-data-analysis-course-project-1")

dataFile <- "./household_power_consumption.txt" 
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

subSetData <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#str(subSetData) 


globalActivePower <- as.numeric(subSetData$Global_active_power) 
png("plot1.png", width=480, height=480) 
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") 
while (!is.null(dev.list())) dev.off() 
