# loads the data
data_p1<-read.table('household_power_consumption.txt', sep=";",na.strings = "?", header=TRUE)

# subsets the data to two days (1st and 2nd of Feb)
p1<-data_p1[as.character(data_p1$Date) %in% c("1/2/2007","2/2/2007") , ]
# converts time to desired format with weekdays
datetime <- strptime(paste(p1$Date, p1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

plot(datetime,as.numeric(p1$Global_active_power), xlab ="",ylab="Global Active Power", type="l" )
plot(datetime,as.numeric(p1$Voltage), xlab ="datatime",ylab="Voltage", type="l" )

sub1 = p1$Sub_metering_1
sub2 = p1$Sub_metering_2
sub3 = p1$Sub_metering_3

rangePlot = range(range(sub1), range(sub2), range(sub3))

plot(datetime,as.numeric(sub1), type="l", ylim = rangePlot, ylab = "Energy sub metering", xlab="" )
par(new=TRUE)
plot(datetime,as.numeric(sub2), col="red", type="l", ylim = rangePlot, ylab = "Energy sub metering", xlab="" )
par(new=TRUE)
plot(datetime,as.numeric(sub3), col="blue", type="l", ylim = rangePlot, ylab = "Energy sub metering", xlab="" )

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(datetime,as.numeric(p1$Global_reactive_power), xlab ="datetime",ylab="Global_reactive_power", type="l" )
dev.off()



