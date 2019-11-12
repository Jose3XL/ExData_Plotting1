## Load dplyr
library(dplyr)

## read data
dt <- tbl_df(read.table("household_power_consumption.txt", header=TRUE, 
                        sep= ";", na.strings = c("?",""))) 
## Convert date and time data
dt$Time<-strptime(paste(dt$Date,dt$Time),'%d/%m/%Y %H:%M:%S')
dt$Date<-as.Date(dt$Date,'%d/%m/%Y')

## Subset data to the selected dates
dtSubsetData<-subset(dt, Date>='2007-02-01' & Date<= '2007-02-02')

## Create png plot2
png(file = "plot2.png", width = 480, height = 480)

##Create histogram plot2
hist(data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

##close the PNG device
dev.off()
