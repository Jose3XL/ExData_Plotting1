## Load dplyr
library(dplyr)

## read data
dt <- tbl_df(read.table("household_power_consumption.txt", header=TRUE, 
sep= ";", na.strings = c("?",""))) 

##Filter the dates
data <- filter(dt,Date %in% c("1/2/2007","2/2/2007"))

## Create png plot
png(file = "plot1.png", width = 480, height = 480)

##Create histogram
hist(data$Global_active_power, col = "red", main = "Global Active Power", 
xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

##close the PNG device
dev.off()
