###Read the data frame into R
df <- read.csv("household_power_consumption.txt", sep=";",stringsAsFactors=FALSE,dec=".")

###subset the data for the dates of
df2 <- df[which(df$"Date" %in% c("1/2/2007","2/2/2007")),]

###convert DATE column to date format with time
DATE<-strptime(paste(df2$"Date",df2$"Time",sep=" "), "%d/%m/%Y %H:%M:%S")

###subset the global active power vector for the plot
globalactivepower<-as.numeric(df2$"Global_active_power")

###set the plot width and height & create the PNG file
png("plot2.png",width=480,height=480)

###draw the plot
plot(DATE, globalactivepower,type="l",ylab="Global Active Power (kilowatts)", xlab="")
