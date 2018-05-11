df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings= "?")
twodates <- subset(df,(df$Date == "1/2/2007" | df$Date == "2/2/2007"))
twodates$DateTime <- as.POSIXct(paste(twodates$Date, twodates$Time), format="%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height= 480)
plot(twodates$DateTime, twodates$Sub_metering_1, 
     type="l", ylab= "Energy sub metering", xlab="")
lines(twodates$DateTime, twodates$Sub_metering_2, 
      type="l", col="red")
lines(twodates$DateTime, twodates$Sub_metering_3, 
      type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c("black", "red", "blue"))
dev.off()
