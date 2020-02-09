x
mean(x)
x1=c(4,5, ,6)
x2=c(4,5,NA,6)
mean(x2)
mean(x2, na.rm = T)
is.na(x2)
sum(is.na(x2))


install.packages("VIM")
library(VIM)
data(sleep)
str(sleep)
summary(sleep)
names(sleep)
is.na(sleep$Dream)
sum(is.na(sleep))
colSums(is.na(sleep))
rowSums(is.na(sleep))
complete.cases(sleep)
sleep(complete.cases(sleep)) #extract data from filled rows only

