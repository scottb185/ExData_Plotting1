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
png("plot3.png", width=480, height=480)
with(d2,{
        plot(Sub_metering_1~d3, type ="l", ylab="Energy sub metering",xlab="")
        lines(Sub_metering_2~d3,col="Red")
        lines(Sub_metering_3~d3,col="Blue")
        })
legend("topright",col=c("black","red","blue"),lty=1,lwd=2,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()