# Creating a dataframe
# Example: RPI Weather dataframe.

days <- c('Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun') 
temp<-c(28,30.5,32,31.2,29.3,27.9,26.4)
snowed <- c('T', 'T', 'F', 'F', 'T', 'T', 'F') # Snowed on that day: T = TRUE, F= FALSE
help("data.frame")

RPI_Weather_Week <- data.frame(days, temp, snowed) # creating the dataframe using the data. frame() function
RPI_Weather_Week

head(RPI_Weather_Week) # head of the data frame, NOTE: it will show only 6 rows, usually head() function shows the
# first 6 rows of the dataframe, here we have only 7 rows in our dataframe.
str(RPI_Weather_Week) # we can take a look at the structure of the dataframe using the strO function.
summary(RPI_Weather_Week) # summary of the dataframe using the summary) function

RPI_Weather_Week[1,] # showing the 1st row and all the columns
RPI_Weather_Week[,1] # showing the 1st coulmn and all the rows
RPI_Weather_Week[, 'snowed']
RPI_Weather_Week[, 'days']
RPI_Weather_Week[, 'temp']
RPI_Weather_Week[1:5, c("days", "temp")]
RPI_Weather_Week$temp
subset(RPI_Weather_Week, subset=snowed=='T')

help(order)
sorted_snowed <- order(RPI_Weather_Week$snowed) 
#sorted_snowed <-order(RPI_Weather_Week['snowed'])
sorted_snowed
RPI_Weather_Week[sorted_snowed,]

sorted_days<-order(RPI_Weather_Week$days)
sorted_days
RPI_Weather_Week[sorted_days,] #SORTS DAYS BY ALPHABETICAL ORDER AND TEMP AS LOW TO HIGH

desc.snow <- order(-RPI_Weather_Week$temp) #- Descending order
desc.snow
RPI_Weather_Week[desc.snow,]

#Creating an empty data frame
emptyDataFrame<-data.frame()
v1<-1:10
v1
letters
help("letters") #alphabets
v2<-letters[1:10]
v2

df<-data.frame(Col_1=v1,Col_2=v2)
df

#Importing and exporting data
write.csv(df,file='saved_df1.csv')
df2<-read.csv('saved_df1.csv')
df2

#<-------------------------------READING EPI DATA------------------------------->
EPI_data <- read.csv(file.choose(), skip=1,header = TRUE)
View(EPI_data) 
attach(EPI_data) 	# sets the ‘default’ object
fix(EPI_data) 	# launches simple data editor 
EPI #prints values of EPI column from the data set, same as EPI_data$EPI

tf <- is.na(EPI) #records NA values from EPI
a <- EPI[!tf] #filters out NA values 
a
#<----------------------------EXERCISE 1---------------------------------------->
#<---------------------Exploring the Distribution------------------------------->
summary(EPI) #stats
help("fivenum") #summary's alternate, returns 5 stats values 
fivenum(EPI,na.rm = TRUE) #Returns EPI Column's stats where na.rm drops all the NA values

help(stem)
stem(EPI) #stem and leaf plot
hist(EPI)
?hist

hist(EPI, seq(30., 95., 1.0), prob=TRUE) # ask
lines(density(EPI,na.rm=TRUE,bw=1.)) # draws line over the hist
#or bw ="SJ"??
rug(EPI) #connects the gaps btw axis and chart so the values are clearly visible

#<----------------Fitting the Distribution beyond hist-------------------------->
plot(ecdf(EPI), do.points=FALSE, verticals=TRUE) #CDF= cumulative deficiency func
#quantile - quantile
par(pty="s")
?par
qqnorm(EPI)
qqline(EPI)


x<-seq(30,95,1)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for tdsn")
qqline(x)


#<--------------Exe: Fitting the disributions----------------------------------->
View(EPI_data)
hist(DALY)
hist(DALY, seq(0,100,1), prob=TRUE) 
lines(density(DALY,na.rm=TRUE,bw=1))
plot(ecdf(DALY), do.points=FALSE, verticals=TRUE)
qqplot(qt(ppoints(400),df=5),x,xlab = 'Q-Q plot for DALY')
qqnorm(DALY)


boxplot(EPI,DALY)
qqplot(EPI,DALY)

boxplot(EPI,ECOSYSTEM)
qqplot(EPI, ECOSYSTEM)

boxplot(EPI, DALY)
qqplot(EPI, DALY)

boxplot(EPI, AIR_H)
qqplot(EPI, AIR_H)

boxplot(EPI, WATER_H)
qqplot(EPI, WATER_H)

boxplot(EPI, AIR_E)
qqplot(EPI, AIR_E)

boxplot(EPI, WATER_E)
qqplot(EPI, WATER_E)

boxplot(EPI, BIODIVERSITY)
qqplot(EPI, BIODIVERSITY)

help("distributions") #stats package

#<---------------------Exercise 2: Filtering Populations------------------------>
#conditional filtering
EPILand <- EPI[!EPI_data$Landlock] #or simply !Landlock #ask
EPILand
ELand <- EPILand[!is.na(EPILand)]
ELand
hist(ELand)
boxplot(EPILand,ELand)
hist(ELand, seq(30., 95., 1.0), prob=TRUE) #ask seq
plot(ecdf(ELand), do.points=FALSE, verticals=TRUE)

# no surface water
SurfaceWater <- EPI[!EPI_data$No_surface_water]
SWater <- SurfaceWater[!is.na(SurfaceWater)]
hist(SWater)
hist(SWater, seq(30., 95., 1.0), prob=TRUE)
plot(ecdf(SWater), do.points=FALSE, verticals=TRUE)

# desert
Desert <- EPI[!EPI_data$Desert]
Deserted <- Desert[!is.na(Desert)]
hist(Deserted)
hist(Deserted, seq(30., 95., 1.0), prob=TRUE)
plot(ecdf(Deserted), do.points=FALSE, verticals=TRUE)

# high population density
HighPopDensity <- EPI[!EPI_data$High_Population_Density]
PopDensity <- HighPopDensity[!is.na(HighPopDensity)]
hist(PopDensity)
hist(PopDensity, seq(30., 95., 1.0), prob=TRUE)
plot(ecdf(PopDensity), do.points=FALSE, verticals=TRUE)

#Filtering by sub region
EPI_South_Asia<-EPI[EPI_regions=='South Asia'] #or EPI_data$EPI_regions=='South Asia'
EPI_SA<-EPI_South_Asia[!is.na(EPI_South_Asia)]
hist(EPI_SA)
qqnorm(EPI_SA)
plot(ecdf(EPI_SA), do.points=FALSE, verticals=TRUE)






