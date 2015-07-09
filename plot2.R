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
png("plot2.png", width=480, height=480)
plot(d2$Global_active_power ~ d2$d3, type = "l",
     ylab="Global Active Power (kilowatts)", xlab = "")
dev.off()