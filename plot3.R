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

###set the plot width and height & create the PNG file
png("plot3.png",width=480,height=480)

###draw the plot
plot(DATE, sub1,type="l",ylab="Energy Submetering", xlab="")

###add sub metering 2 & 3 with appropriate colors
lines(DATE,sub2,type="l",col="red")
lines(DATE,sub3,type="l",col="blue")

###draw the legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
