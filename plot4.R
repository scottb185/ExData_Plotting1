d1<-"household_power_consumption.txt"
d2<-read.table(text=grep("^[1,2]/2/2007", readLines(d1), 
                           value=TRUE), col.names=c("Date", "Time",
                                                    "Global_active_power",
                                                    "Global_reactive_power",
                                                    "Voltage", "Global_intensity",
                                                    "Sub_metering_1",
                                                    "Sub_metering_2",
                                                    "Sub_metering_3"),
                 sep=";", header = TRUE)
d2$Date<-as.Date(d2$Date,format="%d/%m/%Y")
d3<-paste(as.Date(d2$Date),d2$Time)
d2$d3<-as.POSIXct(d3)
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2),mar=c(4,4,2,1), oma=c(0,0,2,0))
with(d2,{
        plot(Global_active_power~d3, type = "l",ylab="Global Active Power", xlab="")
        plot(Voltage~d3,type="l",ylab="Voltage",xlab = "datetime")
        plot(Sub_metering_1~d3, type ="l", ylab="Energy sub metering",xlab="")
        lines(Sub_metering_2~d3,col="Red")
        lines(Sub_metering_3~d3,col="Blue")
        legend("topright",col=c("black","red","blue"),lty=1,lwd=2,
               bty="n",
               legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        plot(Global_reactive_power~d3,type="l",
             ylab="Global_reactive_power", xlab="datetime")
})
dev.off()