library(ggplot2)
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

plot = ggplot(df)
plot = plot + geom_point(aes(df[,1],df[,2]), color = "red")
plot = plot + geom_point(aes(df[,1], df[,3]*50), color = "blue")
plot = plot + labs(title = "SDSU Daily Weather", x="Day (Jan-2017)", y = "Temperature")
plot = plot + scale_y_continuous(sec.axis = sec_axis(~./50),name = "Precipitation")
plot
