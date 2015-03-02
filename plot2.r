data_full <- read.csv("household_power_consumption.txt",
                      header=T,
                      sep=';',
                      na.strings="?",
                      nrows=2075259,
                      check.names=F,
                      stringsAsFactors=F,
                      comment.char="",
                      quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

# Extract only from exact dates
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

plot(data$Global_active_power~data$Datetime,
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")

# Export
dev.copy(png, file="plot2.png")
dev.off()
