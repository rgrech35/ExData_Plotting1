##read file and prepare datatable
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
df$DateTime <- paste(df$Date, df$Time)
df$DateTime <- strptime(df$DateTime, "%d/%m/%Y %H:%M:%S")
df$Date <- NULL
df$Time <- NULL
df <- df[c(8,1,2,3,4,5,6,7)]
df <- subset(df, DateTime>"2007-01-31 23:59:59" & DateTime<"2007-02-03 00:00:00")


##Code for Plot 1
png(filename="plot1.png", width=480, height=480)
hist(df$Global_active_power, 
     ylab="Frequency", 
     xlab="Global Active Power (kilowatts)", 
     col="red", 
     main="Global Active Power")
dev.off()