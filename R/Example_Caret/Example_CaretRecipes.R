# CREATION OF A DIAGNOSTIC MODEL FOR BREAST CANCER 

breast <- readr::read_delim("breast.csv", delim=",")

#You can use the caret library or recipes, in this case we will use recipes.

#Step 1: View the information and see if the variables are in the correct format. 
dplyr::glimpse(breast)#All are continuous except diagnosi which is a character, we change it to a factor.
breast <- mutate(breast, diagnosis=as.factor(diagnosis))

#Step 2: As we do not have train and test data, we will create it ourselves. 
library(caret)
set.seed(123)
train <- createDataPartition(y = breast$diagnosis, p = 0.7, 
                             list = FALSE, times = 1)
breast_train <- breast[train, ]
breast_test  <- breast[-train, ]

#Step 3: Create a recipes object with the response var and predictors 
library(recipes)
objeto_recipe <- recipe(formula = diagnosis ~ . ,
                        data =  breast_train)
# we must remove the variable id which is irrelevant for predicting
objeto_recipe <- objeto_recipe %>% step_rm(id)
objeto_recipe

#Step 4: Check for missing data. 
any(is.na(breast))

#Step 5: Since there are none, we move on to the next step of eliminating variables with variance close to 0.
breast_train %>% nearZeroVar(saveMetrics = TRUE)#We see that we don't have to remove any
objeto_recipe <- objeto_recipe %>% step_nzv(all_predictors())#Some variables need to be removed

#Step 6: Eliminate highly correlated variables
objeto_recipe <- objeto_recipe %>% step_corr(all_predictors())#threshold allows us to choose the default correlation degree 0.9

#Step 7: Centre and normalise the data, you can also transform the data to ensure normality.
objeto_recipe <- objeto_recipe %>% step_center(all_numeric())
objeto_recipe <- objeto_recipe %>% step_scale(all_numeric())

#Step 8: Binarisation of variables is not necessary, as they are all continuous. Quantitative. 

#Step 9: Learning the preprocessing transformations and applying them to the data
trained_recipe <- prep(objeto_recipe, training = breast_train);trained_recipe

breast_train_prep <- bake(trained_recipe, new_data = breast_train)
breast_test_prep  <- bake(trained_recipe, new_data = breast_test)
glimpse(breast_train_prep)

#Step 10: Visualisation 
library(AppliedPredictiveModeling)
transparentTheme(trans = .4)
featurePlot(x = select(breast_train_prep, 1:6), 
            y = breast_train_prep$diagnosis, 
            plot = "pairs",
            ## Add a key at the top
            auto.key = list(columns = 2))

##CREATION OF A PREDICTIVE MODEL

#An estimate of the predictive ability of the model with a 10-fold CV, we repeat it 10 times to ensure randomness.
fitControl <- trainControl(## 10-fold CV
  method = "repeatedcv",
  number = 10,
  ## repeated ten times
  repeats = 10)

set.seed(123)
suppressMessages(fit <- train(diagnosis ~ ., data = breast_train_prep, 
                              method = "glm", 
                              trControl = fitControl))
fit
