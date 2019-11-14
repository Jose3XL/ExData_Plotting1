##Set WD
setwd("~/R/Coursera/Exploratory Data Analysis/-4_Exploratory_Data_Analysis/ExData_Plotting1/data")

## Load dplyr
library(dplyr)

## Read data
DT <- tbl_df(read.table("household_power_consumption.txt", header=TRUE, 
                          sep= ";", na.strings = c("?",""))) 
##Filter the dates
Data <- filter(DT,Date %in% c("1/2/2007","2/2/2007"))

## Create png plot1
png(file = "plot1.png", width = 480, height = 480)

##Create histogram plot1
hist(Data$Global_active_power, col = "red", main = "Global Active Power", 
xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

##close the PNG device
dev.off()

