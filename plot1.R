epc <- read.table("C:/Users/sotir/Desktop/myfolder/exdata_data_household_power_consumption/household_power_consumption.txt",skip=1,sep=";")

names(epc) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
ourdates <- subset(epc, epc$Date=="1/2/2007" | epc$Date =="2/2/2007")


ourdates$Global_active_power <- as.numeric(as.character(ourdates$Global_active_power))



hist((ourdates$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")


