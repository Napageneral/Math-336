mydata <- read.table("gl_land_ocean.txt")
summary(mydata)
boxplot(mydata)

year = mydata[,1]
Annual_Anomaly = mydata[,2]
hist(Annual_Anomaly)
YearVsAnnual_Anomaly = mydata[,c(1,2)]
plot(YearVsAnnual_Anomaly,type="o", xlab = "Year", ylab = "Annual Temperature Anomaly")

#Linear Regressions in order (i),(ii),(iii),(iv),(v)
ablinepiece(lm(Annual_Anomaly ~ year), lwd=2.0, col = "yellow")
legend(1880,.9, col=c("yellow"), lty = 1,lwd=2.0, legend=c("1880-2014"), bty="n", text.font=2, cex=1)
abline(lm(Annual_Anomaly[1:31] ~ year[1:31]),lwd=2.0, col = "blue")
legend(1880,.8, col=c("blue"), lty = 1,lwd=2.0, legend=c("1880-1910"), bty="n", text.font=2, cex=1)
abline(lm(Annual_Anomaly[1:71] ~ year[1:71]), lwd=2.0, col = "green")
legend(1880,.7, col=c("green"), lty = 1,lwd=2.0, legend=c("1880-1950"), bty="n", text.font=2, cex=1)
abline(lm(Annual_Anomaly[1:96] ~ year[1:96]), lwd=2.0, col = "red")
legend(1880,.6, col=c("red"), lty = 1,lwd=2.0, legend=c("1880-1975"), bty="n", text.font=2, cex=1)
abline(lm(Annual_Anomaly[1:121] ~ year[1:121]),lwd=2.0, col = "orange")
legend(1880,.5, col=c("orange"), lty = 1,lwd=2.0, legend=c("1880-2000"), bty="n", text.font=2, cex=1)


#Table of linear regression slope intercepts in order
slope_int= matrix(c(-13.4232, 0.0069, 10.9900, -0.0059, -7.2173 , 0.0036, -7.0258, 0.0035, -10.6817, 0.0054), ncol = 2, byrow=TRUE)
colnames(slope_int) = c("intercept","slope")
rownames(slope_int) = c("1880-2014","1880-1910","1880-1950","1880-1975","1880-2000")
slope_int = as.table(slope_int)
slope_int
