hc <- read.csv("household_power_consumption.txt", sep = ";")
hc = transform(hc, Date = as.Date(Date, format = "%d/%m/%Y"))
startDate = as.Date("2007-02-01")
endDate = as.Date("2007-02-02")
hc = subset(hc, Date >= startDate & Date <= endDate)
png("plot4.png", 480, 480)
par(mfcol = c(2,2))

hc$Global_active_power = as.numeric(as.character(hc$Global_active_power))
hc$fullDate <- paste(as.character(hc$Date), as.character(hc$Time))
hc$fullDate <- as.POSIXct(hc$fullDate, format = "%Y-%m-%d %H:%M:%S")
plot(hc$fullDate, hc$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

hc$fullDate <- paste(as.character(hc$Date), as.character(hc$Time))
hc$fullDate <- as.POSIXct(hc$fullDate, format = "%Y-%m-%d %H:%M:%S")
with(hc, plot(hc$fullDate, as.numeric(as.character(hc$Sub_metering_1)), type = "l", xlab = "", ylab = "Energy sub metering"))
lines(hc$fullDate, as.numeric(as.character(hc$Sub_metering_2)), col = "red")
lines(hc$fullDate, as.numeric(as.character(hc$Sub_metering_3)), col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, bty="n")

hc$Voltage = as.numeric(as.character(hc$Voltage))
plot(hc$fullDate, hc$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

hc$Global_reactive_power = as.numeric(as.character(hc$Global_reactive_power))
plot(hc$fullDate, hc$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()