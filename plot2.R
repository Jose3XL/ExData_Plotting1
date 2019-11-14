##Set WD
setwd("~/R/Coursera/Exploratory Data Analysis/-4_Exploratory_Data_Analysis/ExData_Plotting1/data")

## Read Data
Data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)

## Change class of Date column
Data$Date <- (as.Date(Data$Date,"%d/%m/%Y"))

## Subset Data
SubsetData <- subset(Data, Date == "2007-02-01" | Date =="2007-02-02")

## Change the class of Global_active_power column
SubsetData$Global_active_power <- as.numeric(as.character(SubsetData$Global_active_power))

## Form DateTime column
SubsetData$DateTime <- strptime(paste(SubsetData$Date, SubsetData$Time, sep=" "),"%Y-%m-%d %T")

## Plot
png("plot2.png", width = 480, height = 480)

## Creating plot2
plot(SubsetData$DateTime,SubsetData$Global_active_power,type="l",xlab="",ylab="Global Active Power (in kilowatts)")

##close the PNG device
dev.off()
