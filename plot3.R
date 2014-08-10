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

plot(data4$DateTime,data4$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data4$DateTime, data4$Sub_metering_2, col="red")
lines(data4$DateTime, data4$Sub_metering_3, col="blue")
legend("topright",pch="_____",col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.7, pt.cex=1.4, text.width = 32000)

dev.copy(png,file="plot3.png")
dev.off()