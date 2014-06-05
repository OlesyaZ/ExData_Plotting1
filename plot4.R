setwd("~/Documents/Olesya/Exploratory Data Analys ")
dataset <- read.table("household_power_consumption.txt",sep=";", quote="\"",
                      stringsAsFactors = FALSE) 
dataset[[1]]<-as.Date(dataset[[1]],"%d/%m/%Y")
data1<-which(dataset=="2007-02-01")
data2<-which(dataset=="2007-02-02")
datasubset<-dataset[data1[1]:data2[length(data2)],]

DT<-as.POSIXct(paste(datasubset[[1]], datasubset[[2]]), "%Y-%m-%d %H:%M:%S")

datasubset[,7]<-as.numeric(datasubset[,7]) ##Sub metering 1
datasubset[,8]<-as.numeric(datasubset[,8]) ##Sub metering 2
datasubset[,9]<-as.numeric(datasubset[,9]) ##Sub metering 3
datasubset[,3]<-as.numeric(datasubset[,3]) ##Global active power
datasubset[,5]<-as.numeric(datasubset[,5]) ##Voltage
datasubset[,4]<-as.numeric(datasubset[,4]) ##Global Intensity

png(filename = "plot4.png", width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white") 
   par(mfrow=c(2,2))
     ## plot1
     plot(DT,datasubset[,3],type="l",
     ylab = "Global Active Power (kilowatts)", xlab="")
     ## plot2
     plot(DT,datasubset[,5],type="l",
     ylab = "Voltage", xlab="datetime")
     ##plot3
     yrange<-range(c(datasubset[,7],datasubset[,8],datasubset[,9]))
     plot(DT,datasubset[,7],type="l",ylim=yrange,
     ylab = "Energy sub metering", xlab="")
     par(new=T)
     plot(DT,datasubset[,9],type="l", col="blue",ylim=yrange,ylab = "", xlab="")
     par(new=T)
     plot(DT,datasubset[,8],type="l", col="red",ylim=yrange,ylab = "", xlab="")   
     legend(x = "topright",
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),   
           lty=c(1, 1, 1),   
           lwd=c(2.5, 2.5, 2.5),
           col=c("black", "red", "blue"),
           bty="n")  
     ##plot4
     plot(DT,datasubset[,4],type="l",
     ylab = "Global_reactive_power", xlab="datetime")
dev.off()