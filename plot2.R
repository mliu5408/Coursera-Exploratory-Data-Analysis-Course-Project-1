setwd("D:/Coursera/coursera-exploratory-data-analysis-course-project-1")

data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?",  
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') 
data$Date <- as.Date(data$Date, format="%d/%m/%Y") 

## Subsetting the data 
subdata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 
rm(data) 

## Converting dates 
datetime <- paste(as.Date(subdata$Date), subdata$Time) 
subdata$Datetime <- as.POSIXct(datetime) 

## Plot 2 
plot(subdata$Global_active_power~subdata$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="") 
dev.copy(png, file="plot2.png", height=480, width=480) 
dev.off() 
