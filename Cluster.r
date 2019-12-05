# tell R where your file is located
setwd('C:/Users/metl018/Downloads/test')

# tell R what file to use
mydata <- read.csv("Customers4.csv")

# convert to a R data frame
mydata <- data.frame(mydata)

# exclude unimportant variables
exclude <- c("BuysViaMailOrder1", "RespondsToMailOffers1", "OptOutMailings1", "NonUSTravel1", "PrizmCode1","Occupation1","CreditRating")
mydata <- mydata[ , !(names(mydata) %in% exclude)]

# fit the K-means model to mydata
fit <- kmeans(mydata, 6) #6 cluster solution

# get cluster means
means <- aggregate(mydata, by=list(fit$cluster), FUN=mean)

# append cluster assignment
mydata <- data.frame(mydata, fit$cluster)

# write the data back out to Excel
write.csv(mydata, file="Cluster6.csv", row.names=FALSE) # full data file with cluster assignments
write.csv(means, file="ClusterMeans6.csv", row.names=FALSE) # list of means by cluster

