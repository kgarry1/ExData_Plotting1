data <- read.table("household_power_consumption.txt", sep=";")
colnames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

colnames(data)[1] <- colnames[1]
colnames(data)[2] <- colnames[2]
colnames(data)[3] <- colnames[3]
colnames(data)[4] <- colnames[4]
colnames(data)[5] <- colnames[5]
colnames(data)[6] <- colnames[6]
colnames(data)[7] <- colnames[7]
colnames(data)[8] <- colnames[8]
colnames(data)[9] <- colnames[9]

data2<-subset(data,(Date %in% c("1/2/2007", "2/2/2007")))
row.names(data2) <-seq(nrow(data2))

data2$Date<-as.Date(data2$Date, format="%d/%m/%Y")
data2$Global_active_power<-as.numeric(as.character(data2$Global_active_power))

data3<-data2
data3$Date<-as.character(data3$Date)
data3$Date<-gsub("-", "", as.character(data3$Date))
data3$DateTime <- strptime(paste(data3$Date,data3$Time), "%Y%m%d %H:%M:%S")

data4$Sub_metering_1<-as.numeric(as.character(data4$Sub_metering_1))
data4$Sub_metering_2<-as.numeric(as.character(data4$Sub_metering_2))
data4$Sub_metering_3<-as.numeric(as.character(data4$Sub_metering_3))

data5<-data4
data5$Global_reactive_power<-as.numeric(as.character(data5$Global_reactive_power))
data5$Voltage<-as.numeric(as.character(data5$Voltage))

par(mfrow = c(2,2), cex.axis = 0.8,  cex=0.75)

plot(data5$DateTime,data5$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)") 
plot(data5$DateTime,data5$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(data5$DateTime,data5$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data5$DateTime, data5$Sub_metering_2, col="red")
lines(data5$DateTime, data5$Sub_metering_3, col="blue")
legend("topright",bty = "n", pch="_____",col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.9, pt.cex=0.7, text.width = 70000)
plot(data5$DateTime,data5$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
  

dev.copy(png,file="plot4.png")
dev.off()


