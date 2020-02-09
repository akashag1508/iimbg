#mtcars : proportion of am to be maintained
#train_MTC - 70%
#test_MTC - 70%


library(caTools)
set.seed(2000)

mtcars1 = mtcars
split = sample.split(mtcars1$am, SplitRatio = 0.70)
split
table(split)
training_set = subset(mtcars1, split == TRUE)
test_set = subset(mtcars1, split == FALSE)

dim(training_set); dim(test_set)
table(training_set$am)
table(test_set$am)

prop.table(table(training_set$am))
prop.table(table(test_set$am))


#another method for partition
#install.packages('caret')
library(ggplot2)
library(caret)
intrain <- createDataPartition(y = factor(mtcars$am), p=0.7, list = F)
intrain
mtcars[-intrain, ]
train = mtcars [ intrain, ]
test = mtcars[ -intrain, ]
train
test
table(train$am)
table(test$am)
prop.table(table(train$am))
prop.table(table(test$am))


#simple method

s1 <- sample(1:nrow(mtcars), size = .7 *nrow(mtcars))
mtT1 <- mtcars[s1, ]
mtT2 <- mtcars[-s1, ]
dim(mtT1)
dim(mtT2)


#4th method
library(dplyr)
mtcars %>% sample_n(22)
mtcars %>% sample_frac(.7)
sample_frac(mtcars, .7)
