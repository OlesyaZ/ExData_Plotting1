setwd("~/Documents/Olesya/Exploratory Data Analys ")
dataset <- read.table("household_power_consumption.txt",sep=";", quote="\"",
                      stringsAsFactors = FALSE) 
dataset[[1]]<-as.Date(dataset[[1]],"%d/%m/%Y")
data1<-which(dataset=="2007-02-01")
data2<-which(dataset=="2007-02-02")
datasubset<-dataset[data1[1]:data2[length(data2)],]

DT<-as.POSIXct(paste(datasubset[[1]], datasubset[[2]]), "%Y-%m-%d %H:%M:%S")
datasubset[,3]<-as.numeric(datasubset[,3]) 
   
  png(filename = "plot2.png", width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")                           
     plot(DT,datasubset[,3],type="l",
     ylab = "Global Active Power (kilowatts)", xlab="")
   dev.off()