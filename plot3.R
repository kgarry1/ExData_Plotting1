## Load data and use header row values to assign column names
data <- read.table("household_power_consumption.txt", sep=";")
colnames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
names(data)<-colnames

## subset data to only include Feb 1 and Feb 2, 2007
data<-subset(data,(Date %in% c("1/2/2007", "2/2/2007")))
row.names(data) <-seq(nrow(data))

## reclass data from factor to appropriate class
data$Date<-as.Date(data2$Date, format="%d/%m/%Y")
data$Global_active_power<-as.numeric(as.character(data2$Global_active_power))
data$Date<-as.character(data$Date)
data$Date<-gsub("-", "", as.character(data$Date))
data$DateTime <- strptime(paste(data$Date,data$Time), "%Y%m%d %H:%M:%S")
data$Sub_metering_1<-as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2<-as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3<-as.numeric(as.character(data$Sub_metering_3))

## Create Plot 1
## par(mfrow = c(1,1))
## hist(data$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
## dev.copy(png,file="plot1.png")
## dev.off()

## Create Plot 2
## par(mfrow = c(1,1)
## plot(data$DateTime,data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
## dev.copy(png,file="plot2.png")
## dev.off()

## Create Plot 3
par(mfrow = c(1,1))
plot(data$DateTime,data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright",pch="_____",col=c("black", "red", "blue"), legend=c(" Sub_metering_1"," Sub_metering_2"," Sub_metering_3"), cex=.8, pt.cex=1.2, text.width = 70000)

dev.copy(png,file="plot3.png")
dev.off()