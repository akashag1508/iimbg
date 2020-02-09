
women
head(women)
plot(women)
cor(women)
cov(women)
model = lm(weight ~ height, data = women)
model
summary(model)
range(women$height)
residuals(model)

predict(model, new=data.frame(height=77))

-87+77*3.45

#mtcars
head(mtcars)
model2 = lm(mpg ~ wt + hp + qsec, data =mtcars)
summary(model2)
model3 = lm(mpg ~ wt , data =mtcars)
summary(model3)

#library(olsrr)
install.packages('olsrr')

fit = lm(mpg ~ disp+hp+)


# Load the data
# Missing values
# Correlation between IV
# Form Linear Model
# Check for model summary - F stat, R2, coeff p value
# Check for assumptions
# Predict and find the accuracy