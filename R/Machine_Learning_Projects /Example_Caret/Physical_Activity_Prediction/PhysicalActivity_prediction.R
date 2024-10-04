
library(caret);library(tidyverse);library(recipes)
library(MASS)

load('actividad_fisica.Rdata')

glimpse(train)

train <- mutate(train, device=as.factor(device))
train <- mutate(train, activity=as.factor(activity))

library(leaps)#It can be used to choose a model with fewer variables and that is also good.
plot(regsubsets(activity ~ ., data = train[,-1], method = "exhaustive", nbest = 1))

objeto_recipe <- recipe(formula = activity ~ . ,data =  train)

objeto_recipe <- objeto_recipe %>% step_rm(id);objeto_recipe

any(is.na(train)) #No missing data 

train %>% nearZeroVar(saveMetrics = TRUE)#We see that we don't have to remove any

objeto_recipe <- objeto_recipe %>% step_corr(all_numeric())

#objeto_recipe <- objeto_recipe %>% step_BoxCox(all_numeric())  
objeto_recipe <- objeto_recipe %>% step_YeoJohnson(all_numeric())
objeto_recipe <- objeto_recipe %>% step_center(all_numeric())
objeto_recipe <- objeto_recipe %>% step_scale(all_numeric())

objeto_recipe <- objeto_recipe %>% step_dummy(all_nominal(),
                                              -all_outcomes())

trained_recipe <- prep(objeto_recipe, training = train);trained_recipe

train_prep <- bake(trained_recipe, new_data = train)
test_prep <- bake(trained_recipe, new_data = test)

glimpse(train_prep)

#LDA 
fit.lda <- lda(activity ~ . ,data= train_prep);fit.lda

pred <- predict(fit.lda, train_prep)$class

library(ggord)
ggord(fit.lda, train_prep$activity, ylim = c(-5, 5 ))

tt <- table(predict=pred, Actual=train_prep$activity);tt
sum(diag(tt)/sum(tt))*100

#10-fold CV
fitControl <- trainControl(
  method = "repeatedcv",
  number = 10,
  repeats = 10)

train(activity ~ ., 
      data=train_prep,
      method="lda",
      trControl = fitControl)

#KNN
#yeo+scale+centre 82.7-83% 
#yeo+scale 82,8-83,3% 
grid <- expand.grid(k=c(1,5,10,30,100))
fitControl1 <- trainControl(method = "cv")#better with cv which is faster 

fit.knn <- train(activity ~ ., 
                  data=train_prep,
                  method="knn",
                  trControl = fitControl1,
                  tuneGrid=grid)
                  #tuneLength=8)
plot(fit.knn)
fit.knn

prueba <- predict(fit.knn, newdata=train_prep) 
modknn <- table(prueba,train_prep$activity)
sum(diag(modknn)/sum(modknn))*100
confusionMatrix(prueba, train_prep$activity)

knnPredict <- predict(fit.knn,test_prep)
obs <- test$id
predicciones <- cbind(obs,knnPredict)
head(predicciones)
write.table(predicciones,'1571685',sep='\t',row.names = FALSE,col.names = TRUE)

#KNN in another way 
hiperparametros <- data.frame(k = c(1, 2, 5, 10, 15, 20, 30, 50))

control_train <- trainControl(method = "repeatedcv", number = 10, #partitions
                              repeats = 5,
                              returnResamp = "final", verboseIter = FALSE,
                              allowParallel = TRUE)

modelo_knn <- train(activity ~ ., data = train_prep,
                    method = "knn",
                    tuneGrid = hiperparametros,
                    metric = "Accuracy",
                    trControl = control_train)
plot(modelo_knn)
modelo_knn
