setwd("~/Documents/Olesya/Exploratory Data Analys ")
dataset <- read.table("household_power_consumption.txt",sep=";", quote="\"",
                      stringsAsFactors = FALSE) 
## subsetting to dates 2007-02-01 and 2007-02-02
dataset[[1]]<-as.Date(dataset[[1]],"%d/%m/%Y")
data1<-which(dataset=="2007-02-01")
data2<-which(dataset=="2007-02-02")
datasubset<-dataset[data1[1]:data2[length(data2)],]
# merge Data and Time columns in one and convert it to classes representing date/time
DT<-as.POSIXct(paste(datasubset[[1]], datasubset[[2]]), "%Y-%m-%d %H:%M:%S")

datasubset[,7]<-as.numeric(datasubset[,7]) 
datasubset[,8]<-as.numeric(datasubset[,8]) 
datasubset[,9]<-as.numeric(datasubset[,9]) 
## creates PNG file   
  png(filename = "plot3.png", width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")                           
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
               col=c("black", "red", "blue"))  
  dev.off()

