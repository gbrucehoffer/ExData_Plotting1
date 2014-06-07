png(filename = "plot4.png",
    width = 480, height = 480)

#change data classes and read data
mydata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",
                   colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")) #read datafile

mydata$Date<-as.Date(as.character(mydata$Date),"%d/%m/%Y") #change Date variable to date type

mydata2<-subset(mydata,Date=="2007-02-01"|Date=="2007-02-02") #select data for 2/1 and 2/2

mydata2$datetime <- as.POSIXlt(paste(mydata2$Date, mydata2$Time)) #create datetime variable

mydata2$dayofweek<-weekdays(mydata2$datetime) #create day of week variable

par(mfrow=c(2,2))  #set up margins and structure for 2x2 plots

#Plot 1
plot(mydata2$datetime, mydata2$Global_active_power, 
     type="n",
     xlab="",
     ylab="Global Active Power")

lines(mydata2$datetime,mydata2$Global_active_power)

#Plot 2
plot(mydata2$datetime, mydata2$Voltage, 
     type="n",
     xlab="datetime",
     ylab="Voltage")

lines(mydata2$datetime,mydata2$Voltage)

#Plot 3
plot(mydata2$datetime,mydata2$Sub_metering_1,type="n",xlab="",
     ylab="Energy sub metering")  

lines(mydata2$datetime,mydata2$Sub_metering_1,col="black") #adds a line for Sub metering 1
lines(mydata2$datetime,mydata2$Sub_metering_2,col="red") #adds a line for Sub metering 2
lines(mydata2$datetime,mydata2$Sub_metering_3,col="blue") #adds a line for Sub metering 3

legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty="n",
       lty = c(1,1,1),
       lwd=c(2.5,2.5,2.5),
       col=c("black","red","blue")
)

#Plot 4
plot(mydata2$datetime, mydata2$Global_reactive_power, 
     type="n",
     xlab="datetime",
     ylab="Global_reactive_power")

lines(mydata2$datetime,mydata2$Global_reactive_power)

dev.off()
