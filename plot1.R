png(filename = "plot1.png",
    width = 480, height = 480)

#change data classes and read data
mydata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",
                   colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")) #read datafile

mydata$Date<-as.Date(as.character(mydata$Date),"%d/%m/%Y") #change Date variable to date type

mydata2<-subset(mydata,Date=="2007-02-01"|Date=="2007-02-02") #select data for 2/1 and 2/2

hist(mydata2$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red",
     xaxt="n",
     yaxt="n")

axis(1,at=seq(0,6,by=2))  #adjust x axis numbering
axis(2,at=seq(0,1200,by=200)) #adjust y axis numbering

dev.off()