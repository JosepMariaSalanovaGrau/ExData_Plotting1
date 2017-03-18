DHPC <- "./exdata_data_household_power_consumption/household_power_consumption.txt"
DHPC_data <- read.table(DHPC, header=T, sep=";", na.strings="?")

#select only time for assignment and format
DHPC_data_new <- DHPC_data[DHPC_data$Date %in% c("1/2/2007","2/2/2007"),]
TimeFormat <-strptime(paste(DHPC_data_new$Date, DHPC_data_new$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
DHPC_data_new <- cbind(TimeFormat, DHPC_data_new)

#plot
png(filename="plot3.png",width=480, height=480)
#3
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(DHPC_data_new$TimeFormat, DHPC_data_new$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(DHPC_data_new$TimeFormat, DHPC_data_new$Sub_metering_2, col=columnlines[2])
lines(DHPC_data_new$TimeFormat, DHPC_data_new$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")
dev.off()