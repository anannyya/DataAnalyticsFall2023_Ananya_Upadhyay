require(mlbench)
data(Titanic)
mdl <- naiveBayes(Survived ~ ., data = Titanic)
mdl
predict(mdl, as.data.frame(Titanic)[,1:3])


