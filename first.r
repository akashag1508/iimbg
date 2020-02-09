#IIMBG----
x3 = c(1,5,7,4,9)
y=rnorm(100,mean=60,sd=15)
y
hist(y)
plot(density(y))
print(y)
?hist
install.packages("dplyr")
print(y[seq(1,100,2)])
plot(y[seq(1,100,2)])
hist(y, breaks=10)
hist(y, breaks = c(10,40,80,100))

#matrices----
data= round(rnorm(24, mean = 40, sd = 3))
trunc(34.6)
floor(c(15.4, 16.3, -13.3))
trunc(c(15.4, 16.3, -13.3))
ceiling(c(15.4, 16.3, -13.3))
round(c(15.4, 16.3, -13.3))
(m1 = matrix(data, nrow=4))
colSums(m1)
rowSums(m1)
colMeans(m1)
rowMeans(m1)
m1[,c(1,4)]
m1[c(3,2),c(1,4)]

#DataFrame----
mtcars
str(mtcars)
summary(mtcars)
?mtcars
df = mtcars
names(df)
df$cyl  =factor(df$cyl)
str(df)
df[,c('cyl','vs','am','gear','carb')] = lapply(df[,c('cyl','vs','am','gear','carb')], factor)
str(df)
summary(df)
table(df$cyl)
barplot(table(df$cyl), col=1:3)
table(df$gear, df$am, df$cyl, dnn = c('gear','am','cyl'))
?aggregate
aggregate(. ~cyl, data=df, mean)
aggregate(cbind(mpg, wt) ~cyl, data=df, mean) #mean mpg & wt for each gear and cyl type


#factors----
#without order

set.seed(1234)
(gender = sample(c('M', 'F'), size = 100, replace =T))
table(gender)
(gender = sample(c('M', 'F'), size = 100, replace =T, prob = c(.7,.3))) #as per prob distribution
table(gender)
prop.table(table(gender)) #proportion
pie(table(gender))


#grades----
set.seed(1234)
(grades = sample(c('E', 'G','S','P'), size = 100000, replace =T, prob = c(.4,.3,.2,.1))) #as per prob distribution
table(grades)
prop.table(table(grades)) #proportion
pie(table(grades))
barplot(table(grades))
grades2=factor(grades, ordered = T, levels = c('E','G','S','P'))
barplot(table(grades2))
               
#dplyr----
library(dplyr)
str(df)

#find mean mpg and wt wrt eacg gear and cyl type
df %>% group_by(cyl, gear) %>% summarise(meanwt = mean(wt, na.rm=T), meanMPG = mean(mpg, na.rm = T))
df %>% group_by(cyl, gear) %>% summarise(meanwt = mean(wt, na.rm=T), meanMPG = mean(mpg, na.rm = T), maxHP = max(hp, na.rm=T))
df %>% filter(mpg>25)
df %>% filter(mpg>25 & gear %in% c(4))
