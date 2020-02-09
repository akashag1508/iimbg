#Case Study - Manufacturing Coy
install.packages('gsheet')
install.packages('ggplot2')

library(gsheet)
url = "https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=216113907"
sales3 = as.data.frame(gsheet2tbl(url))
str(sales3)
head(sales3)
dim(sales3)
library(dplyr)
names(sales3)
#find out Loyal Customers, Customers who gave high revenue, High Revenue Part Nos, PartNos which give highest Margin; #top n=2 from each region- total revenue
#parts sold in East and china region

#Part no. which give high profit
sales3 %>% group_by(partnum) %>% summarise(MARGIN = sum(margin))
sales3 %>% group_by(partnum) %>% summarise(MARGIN = sum(margin)) %>% arrange(MARGIN)
sales3 %>% group_by(partnum) %>% summarise(MARGIN = sum(margin)) %>% arrange(desc(MARGIN))
sales3 %>% group_by(partnum) %>% summarise(MARGIN = sum(margin)) %>% arrange(desc(MARGIN)) %>% head(5)

#Region with high margin

sales3 %>% group_by(region) %>% summarise(MARGIN = sum(margin)) %>% arrange(desc(MARGIN)) %>% head(2)
sales3 %>% group_by(region, partnum) %>% summarise(MARGIN = sum(margin)) %>% arrange(desc(MARGIN)) %>% head(2)
sales3 %>% group_by(region, partnum) %>% summarise(MARGIN = sum(margin)) %>% top_n(2, MARGIN)
sales3 %>% group_by(region, partnum) %>% summarise(MARGIN = sum(margin)) %>% arrange(region, partnum,MARGIN)
sales3 %>% group_by(region, partnum) %>% summarise(MARGIN = sum(margin)) %>% arrange(region, partnum,MARGIN)%>% top_n(-2, MARGIN)

regionsales = sales3 %>% group_by(region) %>% summarise(MARGIN = sum(margin)) %>% arrange(desc(MARGIN))
barplot(regionsales$MARGIN)

library(ggplot2)
ggplot(data =  regionsales, aes(x= region, y= MARGIN + geom_bar(stat='identity')))

#Loyal Customers - Revenue or Frequency

head(sales3)
sales3 %>% group_by(custname) %>% summarise(REVENUE = sum(revenue, na.rm = T), COUNT= n())
sales3%>% group_by(custname) %>% summarise(revenue = sum(revenue, na.rm = T), COUNT= n()) 
