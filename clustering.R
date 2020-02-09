#clustering

set.seed(1234)
subject1 = trunc(rnorm(30, mean = 60, sd = 15))
range(subject1)
subject1
marks = data.frame(subject1)
head(marks)
k2 = kmeans(marks, centers = 2)
k2
k2$size
length(marks[k2$cluster==1, ])
marks[k2$cluster==2,]
marks[k2$cluster==1,]

mean()