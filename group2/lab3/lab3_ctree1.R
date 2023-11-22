require(rpart)
Swiss_rpart <- rpart(Fertility ~ Agriculture + Education + Catholic, data = swiss)
plot(swiss_rpart) 
text(swiss_rpart) 

require(party)

treeSwiss<-ctree(Species ~ ., data=iris)
plot(treeSwiss)

cforest(Species ~ ., data=iris, controls=cforest_control(mtry=2, mincriterion=0))

treeFert<-ctree(Fertility ~ Agriculture + Education + Catholic, data = swiss)

cforest(Fertility ~ Agriculture + Education + Catholic, data = swiss, controls=cforest_control(mtry=2, mincriterion=0))


library(tree)
tr <- tree(Species ~ ., data=iris)
tr
tr$frame
plot(tr)
text(tr)




