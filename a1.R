setwd('C:/Users/miguel.picallo.cruz/Documents/personal/coursera/JH data science/exploratory data analysis')

data=read.table('./data/household_power_consumption.txt',sep=';',header=T)#,
                #colClasses=c(rep('character',2),rep('numeric',7)))

data$Date2=as.Date(strptime(data$Date,'%d/%m/%Y'))
dates=c('2007-02-01','2007-02-02')
dates=as.Date(dates)
data=data[which(data$Date2 %in% dates),]
databu=data

data$DateTime=apply(data,1,function(x){paste(x[1],x[2],sep=' ')})
data$DateTime=strptime(data$DateTime,'%d/%m/%Y %H:%M:%S')

for(i in 3:9){
  data[,i]=as.numeric(as.character(data[,i]))
}

Sys.setlocale("LC_TIME", "English")

# plot 1
png('plot1.png')
hist(data$Global_active_power,col='red',main='Global Active Power',
     xlab='Global Active Power (kilowatts)')
dev.off()

# plot 2
png('plot2.png')
plot(data$DateTime,data$Global_active_power,type='l',
     ylab='Global Active Power (kilowatts)',xlab='')
dev.off()

# plot 3
png('plot3.png')
plot(data$DateTime,data$Sub_metering_1,type='l',col='black',
     ylab='Energy sub metering',xlab='')
lines(data$DateTime,data$Sub_metering_2,type='l',col='red')
lines(data$DateTime,data$Sub_metering_3,type='l',col='blue')
legend('topright',lwd=1,col=c('black','red','blue'),
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.off()

# plot 4
png('plot4.png')
par(mfrow=c(2,2))
plot(data$DateTime,data$Global_active_power,type='l',
     ylab='Global Active Power',xlab='')

plot(data$DateTime,data$Voltage,type='l',
     ylab='Voltage',xlab='datetime')

plot(data$DateTime,data$Sub_metering_1,type='l',col='black',
     ylab='Energy sub metering',xlab='')
lines(data$DateTime,data$Sub_metering_2,type='l',col='red')
lines(data$DateTime,data$Sub_metering_3,type='l',col='blue')
legend('topright',lwd=1,col=c('black','red','blue'),
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

plot(data$DateTime,data$Global_reactive_power,type='l',
     ylab='Global_reactive_power',xlab='datetime')
dev.off()