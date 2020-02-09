install.packages('wordcloud2')
library(wordcloud2)
df = data.frame(word = c('IIM', 'MDI', 'IMT'), freq=c(25,20,15))
df
par(mar=c(0,0,0,0))
wordcloud2(df)
dim(demoFreq)
wordcloud2(demoFreq, size = 2, color = "random-light", backgroundColor = grey)
wordcloud2(demoFreq)
           
           