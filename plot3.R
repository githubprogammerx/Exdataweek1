##Plot3

##Set working directory
##C:/Users/ptimusk/Documents/GitHub/ExData_Plotting1
setwd("C:/Users/ptimusk/Documents/GitHub/ExData_Plotting1/")
##plot3

## Data file was downloaded and unzipped with Windows Explorer previous to running this

file<-"household_power_consumption.txt"

##read in data

datasetproj1 <- read.table(file, header=TRUE,quote="", sep=";")

##Select only the two days worth of data we are interested in

datasubsetproj1day1<-as.data.frame(datasetproj1[ ( "1/2/2007"==datasetproj1[,1] ),])
datasubsetproj1day2<-as.data.frame(datasetproj1[ ( "2/2/2007"==datasetproj1[,1] ),])

## Join the two days together.

datasubsetproj1plot3a<-rbind(datasubsetproj1day1, datasubsetproj1day2)
##create a time date variable
datasubsetproj1plot3b<-as.data.frame(c(paste(datasubsetproj1plot3a[,"Date"],datasubsetproj1plot3a[,"Time"])))
colnames(datasubsetproj1plot3b)<-c("Date_Time")

install.packages("stringr")
library(stringr)

install.packages("timeDate")
library(timeDate)
datasubsetproj1plot3d<-as.POSIXct(strptime(str_extract_all(datasubsetproj1plot3b[,"Date_Time"],"([[:digit:]]{1})([[:punct:]]{1})([[:digit:]]{1})([[:punct:]]{1})([[:digit:]]{4})([[:blank:]]{1})([[:digit:]]{2})([[:punct:]]{1})([[:digit:]]{2})([[:punct:]]{1})([[:digit:]]{2})"),"%d/%m/%Y %H:%M:%S", tz="UTC"))
datasubsetproj1plot3d<-as.POSIXct(strptime(datasubsetproj1plot3b[,"Date_Time"], format="%d %m %Y %H:%M:%S", tz="UTC"))

datasubsetproj1plot3e1<-cbind(datasubsetproj1plot3b,datasubsetproj1plot3a[,7:9])
colnames(datasubsetproj1plot3e1)<-c("Date_Time","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## output the plot to an PNG image file with the correct dimensions

png(filename="C:/Users/ptimusk/Documents/GitHub/ExData_Plotting1/plot3.png", height=480, width=480, 
    bg="white")
## plot adjust add title and convert variable to a nummeric formmat, label axis, limit Y and X ranges

plot(as.numeric(as.character(datasubsetproj1plot3e1[,"Sub_metering_1"]))~datasubsetproj1plot3e1[,"Date_Time"], ylab="Energy sub metering"
     , xaxt="n" ,type='n',xlab =  NULL)

lines(as.numeric(as.character(datasubsetproj1plot3e1[,"Sub_metering_1"]))~datasubsetproj1plot3e1[,"Date_Time"])
##plot(as.numeric(as.character(datasubsetproj1plot3e1[,"Sub_metering_2"]))~datasubsetproj1plot3e1[,"Date_Time"], ylab="Energy Sub Metering"
 ##    , xaxt="n" ,type='n',xlab =  NULL)

lines(as.numeric(as.character(datasubsetproj1plot3e1[,"Sub_metering_2"]))~datasubsetproj1plot3e1[,"Date_Time"], col="red")
##plot(as.numeric(as.character(datasubsetproj1plot3e1[,"Sub_metering_3"]))~datasubsetproj1plot3e1[,"Date_Time"], ylab="Energy Sub Metering"
  ##   , xaxt="n" ,type='n',xlab =  NULL)

lines(as.numeric(as.character(datasubsetproj1plot3e1[,"Sub_metering_3"]))~datasubsetproj1plot3e1[,"Date_Time"],col="blue")

tic1<-subset (datasubsetproj1plot3e1,datasubsetproj1plot3e1[,"Date_Time"]=="1/2/2007 00:00:00","Date_Time")
tic2<-subset (datasubsetproj1plot3e1,datasubsetproj1plot3e1[,"Date_Time"]=="2/2/2007 00:00:00","Date_Time")
tic3<-subset (datasubsetproj1plot3e1,datasubsetproj1plot3e1[,"Date_Time"]=="2/2/2007 23:59:00","Date_Time")


testseq<-c(tic1,tic2,tic3)
days<-c("Thu","Fri","Sat")
## reset X ticks marks

axis(side=1, at= testseq, label=days )
legend1<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
color1<-c("black","red","blue")
legend("topright",legend=legend1,col=color1,lty=1)  
## turn graphic window off so the R session writes to the PNG file.
dev.off()