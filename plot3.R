colNames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
              "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

dat <- read.table(file = "household_power_consumption.txt", header = FALSE, sep = ";", 
                  nrows = 2880, skip = 66637, col.names = colNames)

Sys.setlocale("LC_TIME", "English")

time <- strptime(paste(dat$Date, dat$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480)

plot(time, dat$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

lines(time, dat$Sub_metering_2, col = "red")

lines(time, dat$Sub_metering_3, col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()