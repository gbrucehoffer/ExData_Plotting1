png(filename = "plot2.png",
    width = 480, height = 480)

#change data classes and read data
mydata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",
                   colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")) #read datafile

mydata$Date<-as.Date(as.character(mydata$Date),"%d/%m/%Y") #change Date variable to date type

mydata2<-subset(mydata,Date=="2007-02-01"|Date=="2007-02-02") #select data for 2/1 and 2/2

mydata2$datetime <- as.POSIXlt(paste(mydata2$Date, mydata2$Time)) #create datetime variable

mydata2$dayofweek<-weekdays(mydata2$datetime) #create day of week variable

plot(mydata2$datetime, mydata2$Global_active_power, 
     type="n",
     xlab="",
     ylab="Global Active Power (kilowatts)")

lines(mydata2$datetime,mydata2$Global_active_power)

dev.off()