# Physical Activity Prediction with Machine Learning Models

This repository contains the code and results of the physical activity prediction project developed in R, using the caret, tidyverse and recipes libraries. The main objective of this work is to build a model capable of predicting physical activity from a dataset with multiple variables related to health and physical performance.

## Project description

In this project, we worked with two datasets:

  - **Train dataset:** 4384 observations.
  - **Test dataset:** 1880 observations.

### Variables in the datasets:
- `Id`: Unique identifier.
- `Age`: Age.
- `Gender`: Gender.
- `Height`: Height.
- `Weight`: Weight.
- `Steps`: Number of steps.
- `Heart_rate`: Heart rate.
- `Calories`: Calories burned.
- `Distance`: Distance covered.
- `Entropy_heart`: Entropy of heart rate.
- `Entropy_steps`: Entropy of the number of steps.
- `Resting_heart`: Resting heart rate.
- `Corr_heart_steps`: Correlation between heart rate and steps.
- `Normalised_heart`: Normalised heart rate.
- `Intensity_karvonen`: Exercise intensity using the Karvonen formula.
- `SD_norm_heart`: Standard deviation of normalised heart rate.
- `Steps_times_distance`: Multiplication of steps and distance.
- `Device`: Measuring device.
- `Activity`: Type of physical activity (only in the training set).

### Objective

The main objective is to predict the variable `Activity`, which represents the physical activity performed, using several Machine Learning models for the test dataset.

### Preprocessing Process

The pre-processing of the data was a crucial part of the project and was carried out as follows:

1. **Removal of irrelevant variables**: The variable `Id`, which does not have an impact on the prediction, was removed.
2. 2. **Normalisation and scaling**: Transformations such as `Yeo-Johnson`, centring and scaling were applied to normalise the numerical variables.
3. **Coding of categorical variables**: Dummy variables were created for the categorical columns.
4. **Detection of variables with variance close to zero**: It was not necessary to eliminate any variables for this criterion.
5. **Elimination of collinearities**: A correlation filter was used to eliminate collinearities between numerical variables.
   
### Models Used

Three main Machine Learning models were tested to predict physical activity:

1. **Linear Discriminant Analysis (LDA)**

2. **10-fold cross-validation (10-fold CV)**

A model with 10-fold repeated cross-validation was implemented to improve the robustness of the predictions.
3. **k-Nearest Neighbors (KNN)**:
  - Different hyperparameter settings (k values) were used to optimise the model.
  - Several tests and evaluations were performed to select the best k.

## Results

Once I did several tests with different strategies in the preprocessing and these strategies in the three models. I decided to make the prediction with the Yeo-Johnson preprocessing and centred and scaled data and the KNN model with a k = 1, which is the preprocessing and model with the best `accuracy` of all the combinations I had tested. The final predictions on the test data set were stored in a `.txt` file, which contains the `id` of the test examples and their corresponding predictions.

# Contact us
For any questions or interest in the project, you can contact me through my [LinkedIn](https://www.linkedin.com/in/arnau-urbina-lopez/) profile.
