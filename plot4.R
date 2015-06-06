###Read the data frame into R
df <- read.csv("household_power_consumption.txt", sep=";",stringsAsFactors=FALSE,dec=".")

###subset the data for the dates of
df2 <- df[which(df$"Date" %in% c("1/2/2007","2/2/2007")),]

###convert DATE column to date format with time
DATE<-strptime(paste(df2$"Date",df2$"Time",sep=" "), "%d/%m/%Y %H:%M:%S")

###subset the sub metering vectors 
sub1<- df2$"Sub_metering_1"
sub2<- df2$"Sub_metering_2"
sub3<- df2$"Sub_metering_3"

###subset the global active power vector for the plot
globalactivepower<-as.numeric(df2$"Global_active_power")

###subset the global reactive power vector
globalreactivepower<-as.numeric(df2$"Global_reactive_power")

###subset the voltage vector
voltage<-as.numeric(df2$"Voltage")

###set the plot width and height & create the PNG file
png("plot4.png", width=480, height=480)

###set the plot for a 2x2 plot matrix 
par(mfrow = c(2, 2)) 


###Plot1
###draw the plot
plot(DATE, globalactivepower,type="l",ylab="Global Active Power (kilowatts)", xlab="")


###Plot2
###draw the plot 
plot(DATE,voltage,type="l",xlab="datetime",ylab="Voltage")


###plot3
###draw the plot
plot(DATE, sub1,type="l",ylab="Energy Submetering", xlab="")

###add sub metering 2 & 3 with appropriate colors
lines(DATE,sub2,type="l",col="red")
lines(DATE,sub3,type="l",col="blue")

###draw the legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))


###plot4
###draw the plot
plot(DATE,globalreactivepower,type="l",xlab="datetime",ylab="Global_reactive_power")

