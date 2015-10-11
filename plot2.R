# loads the data
data_p1<-read.table('household_power_consumption.txt', sep=";",na.strings = "?", header=TRUE)

# subsets the data to two days (1st and 2nd of Feb)
p1<-data_p1[as.character(data_p1$Date) %in% c("1/2/2007","2/2/2007") , ]

# converts time to desired format with weekdays
datetime <- strptime(paste(p1$Date, p1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width=480, height=480)
plot(datetime,as.numeric(p1$Global_active_power), xlab ="",ylab="Global Active Power (kilowatts)", type="l" )
dev.off()
