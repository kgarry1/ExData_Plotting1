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

hist(data2$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png,file="plot1.png")
dev.off()
