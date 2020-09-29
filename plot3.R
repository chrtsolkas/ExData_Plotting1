source("import_data.R")

png("plot3.png", width = 480, height = 480)
plot(dat1$Time, dat1$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(dat1$Time, dat1$Sub_metering_1, type = "l", col = "black")
lines(dat1$Time, dat1$Sub_metering_2, type = "l", col = "red")
lines(dat1$Time, dat1$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
dev.off()