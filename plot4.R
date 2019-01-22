epc <- read.table("C:/Users/sotir/Desktop/myfolder/exdata_data_household_power_consumption/household_power_consumption.txt",skip=1,sep=";")

names(epc) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
ourdates <- subset(epc, epc$Date=="1/2/2007" | epc$Date =="2/2/2007")

ourdates$Date <- as.Date(ourdates$Date, format="%d/%m/%Y")
ourdates$Time <- strptime(ourdates$Time, format="%H:%M:%S")
ourdates[1:1440,"Time"] <- format(ourdates[1:1440,"Time"],"2007-02-01 %H:%M:%S")
ourdates[1441:2880,"Time"] <- format(ourdates[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

par(mfrow=c(2,2))

with(ourdates,{
  plot(ourdates$Time,as.numeric(as.character(ourdates$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(ourdates$Time,as.numeric(as.character(ourdates$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(ourdates$Time,ourdates$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(ourdates,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(ourdates,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(ourdates,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("grey","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(ourdates$Time,as.numeric(as.character(ourdates$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})