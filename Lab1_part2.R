multivariate<-read.csv("/Users/ananya/Desktop/DA/Lab1/multivariate.csv")
head(multivariate)
attach(multivariate)

?lm #formula?
mm<-lm(Homeowners~Immigrant) #Homeowners-> y(dependant variable), Immigrant-> x(indepandant variable)
mm #mm here is a R object

summary(mm) #provides residuals, coeff
summary(mm)$coef #coeff in depth
# The output above shows the estimate of the regression beta coefficients (column Estimate) and
# their significance levels (column Pr(>||).
# The intercept is 107494.898 and the coefficient of Immigrant variable is -6656.839.
# The estimated regression equation can be written as follow:
# Homeowners = 107494.898 + (-6656.839)*Immigrant
# We can rewrite it as:
# Homeowners = 107494.898 - 6656.839*Immigrant.

library(dplyr)
library(ggplot2)
View(multivariate) #7 values

plot(Homeowners~Immigrant) #plots 7 dots
?abline #adds one or more straight lines through the current plot.
abline(mm) 
abline(mm,col=2,lwd=3) #color red and line width

# Using this formula, for each new value in Immigrant, you can predict the value for Homeowners.
# As an example:
# For Immigrant value = 0, we will get: Homeowners = 107494.898 - 6656.839*0 = 107494.898
# for Immigrant value = 20, we will get: Homeowners = 107494.898 - 6656.839*20 = -25641.88

# Predictions can be easily made using the R function predict().

# In the following example, we predict Homeowners for two Immigrant values: 0 and 20.
# you can pass the 0 and 20 values as a concatenated list for Immigrants as follows:

newlmmigrantdata <- data.frame (Immigrant = c(0, 20))
mm %>% predict(newlmmigrantdata) #%>%? on the basis of Immgirant(x) it predicts 'new Immigrant'

abline(mm)
abline(mm,col=3,lwd=3) #color green line width=3

attributes(mm)
mm$coefficients
View(mm)

#<-------------------Creating plots:CHAP 2, R graphics COOKBOOK------------------------->
head(mtcars)
View(mtcars)

plot (mtcars$wt,mtcars$mpg)
library(ggplot2)
qplot(mtcars$wt,mtcars$mpg)
qplot(wt,mpg, data = mtcars) #1
ggplot(mtcars, aes(x=wt,y=mpg))+ geom_point() #2, same results for 1,2

plot(pressure$temperature,pressure$pressure, type = "l")
points (pressure$temperature,pressure$pressure)

lines(pressure$temperature,pressure$pressure/2, col="red")
points(pressure$temperature,pressure$pressure/2, col="blue")

#library(ggplot2)
qplot (pressure$temperature, pressure$pressure, geom="line")
qplot(temperature, pressure, data = pressure,geom = "line") #data= pressure, means data set pressure, it's in-built
ggplot (pressure, aes(x=temperature,y=pressure)) + geom_line() + geom_point() 


qplot(Homeowners,Immigrant)
ggplot(multivariate, aes(x= Homeowners, y= Immigrant)) +geom_line(color='pink') +geom_point() #didn't work without y

#BAR GRAPHS
barplot(BOD$demand, names.arg = BOD$Time)
table(mtcars$cyl)
barplot(table(mtcars$cyl)) 
qplot(mtcars$cyl) #cyl is continous here.
qplot(factor(mtcars$cyl)) #treats cyl as discrete

#bar graph of counts, doing the same thing with ggplot,i.e making bar with ggplot
qplot(factor(cyl), data = mtcars)
ggplot(mtcars, aes(x=factor(cyl))) + geom_bar()


# Creating Histogram
# View the distribution of one-dimentional data with a histogram.
hist(mtcars$mpg)
hist(mtcars$mpg, breaks = 10) # specify approximate number of bins with breaks.
hist(mtcars$mpg, breaks = 5)
hist(mtcars$mpg, breaks = 12)
qplot(mpg, data = mtcars, binwidth=4)
ggplot(mtcars,aes(x=mpg)) + geom_histogram(binwidth = 4)
ggplot(mtcars,aes(x=mpg)) + geom_histogram(binwidth = 5)


# box plots
boxplot(Homeowners ~ Immigrant, data=multivariate) #ask
qplot(multivariate$Homeowners, multivariate$Immigrant, geom = "boxplot")


plot(ToothGrowth$supp, ToothGrowth$len) # using plot() function and pass it a factor of x-values and a vector of y-values.
#Formula Syntax
boxplot(len ~ supp, data = ToothGrowth) # if the tow vectors are in the same dataframe, you can use the formula syntax. With

# this syntax you can combine two variables on the x-axis.
# put interaction of two variables on x-axis
boxplot(len ~ supp + dose, data = ToothGrowth)

# with ggplot2 you can get the same results above.
#library(ggplot2)
qplot(ToothGrowth$supp, ToothGrowth$len, geom = "boxplot")
# if the two vectors are in the same dataframe, you can use the following syntax
qplot(supp, len, data = ToothGrowth, geom = "boxplot")
# in ggplot2, the above is equvalent to:
ggplot(ToothGrowth, aes(x=supp, y=len)) + geom_boxplot()

# Using three seperate vectors
qplot (interaction(ToothGrowth$supp, ToothGrowth$dose), ToothGrowth$len, geom = "boxplot")
# You can write the samething above, get the columns from the dataframe
qplot(interaction(supp, dose), len, data = ToothGrowth, geom = "boxplot")
# Using ggplot() you can do the samething and it is equivalent to:
ggplot (ToothGrowth, aes(x=interaction(supp, dose), y=len)) + geom_boxplot()
#Plotting a function curve
