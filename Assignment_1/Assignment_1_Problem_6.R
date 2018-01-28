mydata <- read.table("gl_land_ocean.txt")
summary(mydata)
boxplot(mydata)

year = mydata[,1]
Annual_Anomaly = mydata[,2]
hist(Annual_Anomaly)
YearVsAnnual_Anomaly = mydata[,c(1,2)]
plot(YearVsAnnual_Anomaly, xlab = "Annual Temperature Anomaly", ylab = "Year")

#Linear Regressions in order (i),(ii),(iii),(iv),(v)
abline(lm(Annual_Anomaly ~ year), col = "yellow")
abline(lm(Annual_Anomaly[1:31] ~ year[1:31]), col = "blue")
abline(lm(Annual_Anomaly[1:71] ~ year[1:71]), col = "green")
abline(lm(Annual_Anomaly[1:96] ~ year[1:96]), col = "red")
abline(lm(Annual_Anomaly[1:121] ~ year[1:121]),col = "orange")

#Table of linear regression slope intercepts in order
slope_int= matrix(c(-13.4232, 0.0069, 10.9900, -0.0059, -7.2173 , 0.0036, -7.0258, 0.0035, -10.6817, 0.0054), ncol = 2, byrow=TRUE)
colnames(slope_int) = c("intercept","slope")
rownames(slope_int) = c("1850-2014","1850-1910","1850-1950","1850-1975","1850-2000")
slope_int = as.table(slope_int)
slope_int
