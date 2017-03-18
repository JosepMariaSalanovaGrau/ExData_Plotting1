DHPC <- "./exdata_data_household_power_consumption/household_power_consumption.txt"
DHPC_data <- read.table(DHPC, header=T, sep=";", na.strings="?")

#select only time for assignment and format
DHPC_data_new <- DHPC_data[DHPC_data$Date %in% c("1/2/2007","2/2/2007"),]
TimeFormat <-strptime(paste(DHPC_data_new$Date, DHPC_data_new$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
DHPC_data_new <- cbind(TimeFormat, DHPC_data_new)

#plot
png(filename="plot4.png",width=480, height=480)
#4
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(DHPC_data_new$TimeFormat, DHPC_data_new$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(DHPC_data_new$TimeFormat, DHPC_data_new$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(DHPC_data_new$TimeFormat, DHPC_data_new$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(DHPC_data_new$TimeFormat, DHPC_data_new$Sub_metering_2, type="l", col="red")
lines(DHPC_data_new$TimeFormat, DHPC_data_new$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(DHPC_data_new$TimeFormat, DHPC_data_new$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()