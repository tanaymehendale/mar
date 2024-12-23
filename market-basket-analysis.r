#Loading dataset
setwd("D:/GITHUB PROJECTS/market-basket-analysis") #Input your own local file path here or fetch the file directly from GitHub # nolint
newdata_input <- read.csv("groceries.csv", header = FALSE)
summary(newdata_input)
dim(newdata_input)
str(newdata_input)
View(newdata_input)

#Create Transaction list using Association rules
library(arules)
transactiondata <- read.transactions("groceries.csv", sep = ",")
dim(transactiondata)
summary(transactiondata)

#Top 20 sold items
itemFreq <- itemFrequency(transactiondata, type = "absolute") # nolint
print(itemFreq)
itemFreq <- sort(itemFreq, decreasing = TRUE) # nolint
top20items <- head(itemFreq, n = 20)
View(top20items)
itemFrequencyPlot(transactiondata, topN = 20, type = "absolute", col = rainbow(20)) # nolint

#Total sales of the top 20 items sold
quantityofitems <- itemFrequency(transactiondata, type = "absolute")
den <- sum(quantityofitems)
quantitytop20 <- sort(quantityofitems, decreasing = TRUE)
quantitytop20 <- head(quantitytop20, n = 20)
num <- sum(quantitytop20)
salestop20 <- (num / den) * 100
print(salestop20)

#Generate rules based on Apriori Algorithm
relations_data <- apriori(transactiondata, parameter = list(support = 0.001, confidence = 0.80, minlen = 2, maxlen = 3)) # nolint
inspect(relations_data)
relations_data <- sort(relations_data, by = "lift")
inspect(relations_data)

#Visualizing rules
library(arulesViz)
plot(relations_data, method = "graph", engine = "interactive")