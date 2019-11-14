##Set WD
setwd("~/R/Coursera/Exploratory Data Analysis/-4_Exploratory_Data_Analysis/ExData_Plotting1/data")

## Read data
Data <- tbl_df(read.table("household_power_consumption.txt", header=TRUE, 
                        sep= ";", na.strings = c("?",""))) 
## Convert data
Data$Time<-strptime(paste(Data$Date,Data$Time),'%d/%m/%Y %H:%M:%S')
Data$Date<-as.Date(Data$Date,'%d/%m/%Y')

## Subset data to the selected dates
SubsetData<-subset(Data, Date>='2007-02-01' & Date<= '2007-02-02')

## Convert data into numeric value
SubsetData$Global_active_power<-as.numeric(as.character(SubsetData$Global_active_power))
SubsetData$Sub_metering_1<-as.numeric(as.character(SubsetData$Sub_metering_1))
SubsetData$Sub_metering_2<-as.numeric(as.character(SubsetData$Sub_metering_2))
SubsetData$Sub_metering_3<-as.numeric(as.character(SubsetData$Sub_metering_3))

##Create png plot
png(filename='plot4.png')

## Creating plot area with two columns and two rows
par(mfrow=c(2,2))

## plot 1
plot(SubsetData$Time,SubsetData$Global_active_power/1000,type='l', ylab='Global Active Power',xlab='')

## plot 2
plot(SubsetData$Time,SubsetData$Voltage,type='l', ylab='Voltage',xlab='datetime')

##  plot 3
plot(SubsetData$Time,SubsetData$Sub_metering_1,type='l', ylab='Energy sub metering',xlab='')
lines(SubsetData$Time,SubsetData$Sub_metering_2,col='red',type='l')
lines(SubsetData$Time,SubsetData$Sub_metering_3,col='blue',type='l')
legend("topright",c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lty=c(1,1,1),cex=0.8)

## plot 4
plot(SubsetData$Time,SubsetData$Global_reactive_power,type='l', ylab='Global_reactive_power',xlab='datetime')

## close the PNG device
dev.off()

