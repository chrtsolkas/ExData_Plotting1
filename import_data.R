# Download the zip file and unzip it only if this was not already done
if(!file.exists("Household_power_consumtion.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "Household_power_consumtion.zip")
}
if(!file.exists("household_power_consumption.txt")) {
  unzip("Household_power_consumtion.zip") # results in household_power_consumption.txt of size ~127 MB
}


# Read everything
# dat <- read.table(unz("Household_power_consumtion.zip","household_power_consumption.txt"), header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)
# dat$Time <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %T")
# dat$Date <- as.Date(dat$Date, "%d/%m/%Y")  
# # str(dat)
# # which(dat$Date == as.Date("2007-02-02")) # 66637 - 69516
# dat1 <- dat[dat$Date >= as.Date("2007-02-01") & dat$Date <= as.Date("2007-02-02"),]

# Read only the lines starting with 1/2/2007 or 2/2/2007
if (!("dat1" %in% ls())) {
  library(data.table)
  dat1 <- fread(cmd="grep ^[1-2]/2/2007 household_power_consumption.txt", data.table = FALSE, na.strings = "?")
  colnames(dat1) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  
  # Covert character columns Date and Time to Date and POSIXlt formats respectively
  dat1$Time <- strptime(paste(dat1$Date, dat1$Time), "%d/%m/%Y %T")
  dat1$Date <- as.Date(dat1$Date, "%d/%m/%Y")  
  # str(dat1)
  # colSums(is.na(dat1))  # There are no NAs in data
}

