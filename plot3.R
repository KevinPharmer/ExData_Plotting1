##use grep to read only the lines with required dates
project_1_data <- read.table(text = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"), value = TRUE), 
                             col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                                           "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                             sep = ";", header = TRUE)

##third plot plot
##combine both the date and time into POSIXct format and add to the table
project_1_data$Date_Time <- as.POSIXct(paste(project_1_data$Date, project_1_data$Time), format="%d/%m/%Y %H:%M:%S")
plot(project_1_data$Date_Time, project_1_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(project_1_data$Date_Time, project_1_data$Sub_metering_2, type = "l", col = "red")
lines(project_1_data$Date_Time, project_1_data$Sub_metering_3, type = "l", col = "blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1), cex=0.65)
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()