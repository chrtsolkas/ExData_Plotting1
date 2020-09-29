source("import_data.R")

png("plot4.png", width = 480, height = 480)

# Store the current value of mfrow
oldmfrow = par("mfrow")

# Change mfrow for a 2 x 2 plot
par(mfrow = c(2,2))

# Create top left plot
plot(dat1$Time, dat1$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

# Create top right plot
plot(dat1$Time, dat1$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

# Create bottom left plot
plot(dat1$Time, dat1$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(dat1$Time, dat1$Sub_metering_1, type = "l", col = "black")
lines(dat1$Time, dat1$Sub_metering_2, type = "l", col = "red")
lines(dat1$Time, dat1$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), bty = "n")

# Create bottom right plot
plot(dat1$Time, dat1$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

# Reset mfrow to its previous value
par(mfrow = oldmfrow)

dev.off()