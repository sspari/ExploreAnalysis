library(data.table)

#sample few rows to create vector of classes for data variables
tab5rows <- read.table("household_power_consumption.txt", sep=";",header=TRUE, nrows = 5)
classes <- sapply(tab5rows, class)

# Read source file
hldPwData <-fread("household_power_consumption.txt",sep=";",na.strings=c("?"),colClasses = classes)

#Data required for plots
explr <-hldPwData[hldPwData$Date=="1/2/2007"|hldPwData$Date=="2/2/2007"]

#Clean up memory
rm(tab5rows)
rm(hldPwData)

#Change the variable types to match the data
explr$Date<-as.Date(explr$Date,"%d/%m/%Y")

#Add new column to the data table
# explr[,datetime:=paste(as.character(explr$Date),explr$Time)]

#Could not convert datetime to POSIXlt form using strptime
# dtime <-strptime(explr$datetime,format="%Y-%m-%d %H:%M:%S",tz="GMT")

#Set the PNG file device
png(filename = "Plot1.png",width = 480, height = 480, units = "px")

#Set margins
par(mar=c(5.1, 6.1, 4.1, 2.1))

#Plot Histogram
hist(explr$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.off()









