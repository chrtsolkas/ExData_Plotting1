source("import_data.R")

# Needed to change locale for time to English
# Sys.setlocale("LC_TIME", "en_US.UTF-8")

png("plot2.png", width = 480, height = 480)
plot(dat1$Time, dat1$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()