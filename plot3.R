epc <- read.table("C:/Users/sotir/Desktop/myfolder/exdata_data_household_power_consumption/household_power_consumption.txt",skip=1,sep=";")

names(epc) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
ourdates <- subset(epc, epc$Date=="1/2/2007" | epc$Date =="2/2/2007")
globalActivePower <- as.numeric(ourdates$Global_active_power)



date_and_time <- strptime(paste(ourdates$Date, ourdates$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subM1 <- as.numeric(ourdates$Sub_metering_1)
subM2 <- as.numeric(ourdates$Sub_metering_2)
subM3 <- as.numeric(ourdates$Sub_metering_3)


plot(date_and_time, subM1, type="l", ylab="Energy Submetering", xlab="")
lines(date_and_time, subM2, type="l", col="red")
lines(date_and_time, subM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("grey", "red", "blue"))