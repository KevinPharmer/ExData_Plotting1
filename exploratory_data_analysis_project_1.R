##Exploratory Data Analysis
##use grep to read only the lines with required dates
project_1_data <- read.table(text = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"), value = TRUE), 
                   col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                                 "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                                  sep = ";", header = TRUE)

##first plot
hist(project_1_data$Global_active_power, xlab = "Global Acive Power (kilowatts)", col = "red", main = "Global Active Power")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()

##second plot
##combine both the date and time into POSIXct format and add to the table
project_1_data$Date_Time <- as.POSIXct(paste(project_1_data$Date, project_1_data$Time), format="%d/%m/%Y %H:%M:%S")
plot(project_1_data$Date_Time, project_1_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()

##third plot
plot(project_1_data$Date_Time, project_1_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(project_1_data$Date_Time, project_1_data$Sub_metering_2, type = "l", col = "red")
lines(project_1_data$Date_Time, project_1_data$Sub_metering_3, type = "l", col = "blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1), cex=0.65)
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()

##fourth plot
par(mfrow=c(2,2))##create 2x2 layout

plot(project_1_data$Date_Time, project_1_data$Global_active_power, xlab="", type="l", ylab="Global Active Power (kilowatts)")

plot(project_1_data$Date_Time, project_1_data$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(project_1_data$Date_Time, project_1_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(project_1_data$Date_Time, project_1_data$Sub_metering_2, type = "l", col = "red")
lines(project_1_data$Date_Time, project_1_data$Sub_metering_3, type = "l", col = "blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1), bty = "n", cex=0.75)

plot(project_1_data$Date_Time, project_1_data$Global_reactive_power, type="l", xlab="datetime", ylab="Global Reactive Power")

dev.copy(png, file="plot4.png")
dev.off()