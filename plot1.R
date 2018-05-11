#Load Data
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings= "?")

#Filter two dates and combine date&time
twodates <- subset(df,(df$Date == "1/2/2007" | df$Date == "2/2/2007"))
twodates$DateTime <- as.POSIXct(paste(twodates$Date, twodates$Time), format="%d/%m/%Y %H:%M:%S")

#Making plot
png("plot1.png", width=480, height= 480)
hist(twodates$Global_active_power, col= "red", 
     xlab= "Global Active Power (kilowatts)", 
     ylab= "Frequency", main= "Global Active Power")
dev.off()
