library(readr)
mydata <- read_csv("C:/Users/Tyler/Desktop/Math-336/R-Datasets/tabula-SDSUweather-Jan-2017.csv")
day = mydata[,3]
day=lapply(day,as.numeric)
tmax = mydata[,4]
tmin = mydata[,5]
tmean = (tmax+tmin)/2
prec = mydata[,6]
prec = replace(prec, prec=="T", 0.00)
prec=lapply(prec,as.numeric)
df = data.frame(day, tmean, prec)

plot.new()
plot(df[,1],df[,2], type="o", col="red", xlab="Day (January 2017)", ylab="Mean Temperature (Fahrenheit)", lwd=1.5, main="SDSU Daily Weather")
legend(1,64, col=c("red"), pch = 1, legend=c("Temp Mean"), bty="n", text.font=2, cex=1)

par(new=TRUE)
par(margin(5,5,5,5))
plot(df[,1], df[,3],type="o", col="blue", lwd = 1.5, axes=FALSE, xlab="", ylab="")
legend(1,1, col=c("blue"), pch = 1,legend=c("Prec"),bty="n", text.font=2,cex=1)
axis(4)
mtext("Precipitation (inches)", side=4, line=3)
