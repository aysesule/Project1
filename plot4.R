fname <- "household_power_consumption.txt"
df <- read.table(fname, header=TRUE, sep=";",
                 colClasses=c("character", "character", rep("numeric",7)),
                 na="?")
# convert date-time to YYYY-MM-DD HH:MM:SS format
df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, "%d/%m/%Y")

# get data of the dates 2007-02-01 and 2007-02-02
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
df <- subset(df, Date %in% dates)

# Plot4
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(df$Time, df$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(df$Time, df$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(df$Time, df$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")

lines(df$Time, df$Sub_metering_2, col="red")
lines(df$Time, df$Sub_metering_3, col="blue")

dev.off()