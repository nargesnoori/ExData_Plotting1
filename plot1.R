# loads the data

data_p1<-read.table('household_power_consumption.txt', sep=";",na.strings = "?", header=TRUE)

# subsets the data to two days (1st and 2nd of Feb)
p1<-data_p1[as.character(data_p1$Date) %in% c("1/2/2007","2/2/2007") , ]

png("plot1.png", width=480, height=480)

#plots the histogram
hist(p1$Global_active_power,  col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
