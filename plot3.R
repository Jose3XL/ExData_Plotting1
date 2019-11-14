##Set WD
setwd("~/R/Coursera/Exploratory Data Analysis/-4_Exploratory_Data_Analysis/ExData_Plotting1/data")

## Read data
Data <- tbl_df(read.table("household_power_consumption.txt", header=TRUE, 
                          sep= ";", na.strings = c("?",""))) 

## Convert date and time data
Data$Time<-strptime(paste(Data$Date,Data$Time),'%d/%m/%Y %H:%M:%S')
Data$Date<-as.Date(Data$Date,'%d/%m/%Y')

## Subset data to the selected dates
SubsetData<-subset(Data, Date>='2007-02-01' & Date<= '2007-02-02')

## Convert data into numeric value
SubsetData$Global_active_power<-as.numeric(as.character(SubsetData$Global_active_power))
SubsetData$Sub_metering_1<-as.numeric(as.character(SubsetData$Sub_metering_1))
SubsetData$Sub_metering_2<-as.numeric(as.character(SubsetData$Sub_metering_2))
SubsetData$Sub_metering_3<-as.numeric(as.character(SubsetData$Sub_metering_3))

## Create png plot3
png("plot3.png", width=480, height=480)

## Creating plot3
plot(SubsetData$Time,SubsetData$Sub_metering_1,type='l', ylab='Energy sub metering',xlab='')
lines(SubsetData$Time,SubsetData$Sub_metering_2,col='red',type='l')
lines(SubsetData$Time,SubsetData$Sub_metering_3,col='blue',type='l')
legend("topright",c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lty=c(1,1,1),cex=0.8)

##close the PNG device
dev.off()
