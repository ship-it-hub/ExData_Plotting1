colNames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
              "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

dat <- read.table(file = "household_power_consumption.txt", header = FALSE, sep = ";", 
                  nrows = 2880, skip = 66637, col.names = colNames)

Sys.setlocale("LC_TIME", "English")

time <- strptime(paste(dat$Date, dat$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

plot(time, dat$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(time, dat$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(time, dat$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(time, dat$Sub_metering_2, col = "red")
lines(time, dat$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"),  bty = "n")

plot(time, dat$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()