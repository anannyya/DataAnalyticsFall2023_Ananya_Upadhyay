data("Titanic")
require(rpart)
require(party)
require(randomForest)
Titanic

# rpart
titanic_rpart <- rpart(Survived~., data=Titanic)
plot(titanic_rpart)
text(titanic_rpart)

# ctree
titanic_tree <- ctree(Survived ~ ., data=Titanic)
plot(titanic_tree)

# hclust
t <- as.data.frame(Titanic)
dist_mat <- dist(t, method = 'euclidean')
hclust_avg <- hclust(dist_mat, method = 'average')
plot(hclust_avg)

# randomforest
titanic.rf <- randomForest(Survived ~ ., data=Titanic, importance=TRUE, proximity=TRUE)
print(titanic.rf)
