df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings= "?")
twodates <- subset(df,(df$Date == "1/2/2007" | df$Date == "2/2/2007"))
twodates$DateTime <- as.POSIXct(paste(twodates$Date, twodates$Time), format="%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height= 480)
plot(twodates$DateTime, twodates$Global_active_power, 
     type= "l", lwd=1, 
     ylab= "Global Active Power (kilowatts)", xlab="")
dev.off()
