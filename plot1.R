DHPC <- "./exdata_data_household_power_consumption/household_power_consumption.txt"
DHPC_data <- read.table(DHPC, header=T, sep=";", na.strings="?")

#select only time for assignment and format
DHPC_data_new <- DHPC_data[DHPC_data$Date %in% c("1/2/2007","2/2/2007"),]
TimeFormat <-strptime(paste(DHPC_data_new$Date, DHPC_data_new$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
DHPC_data_new <- cbind(TimeFormat, DHPC_data_new)

#plot
png(filename="plot1.png")
#1
hist(DHPC_data_new$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()