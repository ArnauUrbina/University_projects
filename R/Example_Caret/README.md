# Breast Cancer Diagnostic Model

## Project Overview

This project focuses on building a predictive model for breast cancer diagnosis using machine learning techniques in R. The primary objective is to classify tumors as either benign or malignant based on a set of features derived from breast tissue samples. The dataset used for this project is the widely available **Breast Cancer Wisconsin (Diagnostic) Dataset**.

The project utilizes the `recipes` package for data preprocessing and the `caret` package to implement a logistic regression model with repeated cross-validation (10-fold CV, repeated 10 times). The data preprocessing steps include removing low variance predictors, handling multicollinearity, centering, and scaling the numeric features.

## Dataset

The dataset contains 569 observations and 32 attributes. The key attributes are:
- **ID**: Unique identifier for each observation (removed during preprocessing)
- **Diagnosis**: The target variable, indicating whether the tumor is benign or malignant
- **Other features**: Various measurements of breast tissue such as radius, texture, perimeter, area, smoothness, etc.

### Target Variable:
- **Benign**: Labeled as 0
- **Malignant**: Labeled as 1

## Project Steps

1. **Data Loading**: The dataset is loaded into R using `readr::read_delim()`. Initial data exploration is performed using `dplyr::glimpse()`.

2. **Data Partitioning**: The dataset is split into training and testing sets using `caret::createDataPartition()`, with 70% of the data allocated for training.

3. **Preprocessing**: The `recipes` package is used to preprocess the training data.
   - **ID Removal**: The ID variable is removed as it does not provide predictive information.
   - **Near Zero Variance Features**: Any features with near-zero variance are identified and removed.
   - **Multicollinearity**: Highly correlated features are identified and removed using a threshold of 0.9.
   - **Centering and Scaling**: All numeric predictors are centered and scaled to normalize the data.

4. **Data Visualization**: Feature relationships are visualized using pair plots to observe the distribution and relationships between predictors and the target variable.

5. **Modeling**: A logistic regression model is trained using the `caret::train()` function with 10-fold cross-validation repeated 10 times for robust performance estimation. The performance of the model is evaluated on the preprocessed test set.

## Model Performance

The performance of the logistic regression model is evaluated using repeated 10-fold cross-validation to estimate its predictive ability. Key metrics used include:
- **Accuracy**
- **Precision**
- **Recall**
- **F1-Score**

The results show that logistic regression provides a reliable model for classifying tumors, with further improvement possible by exploring more complex algorithms.

## Future Work

- **Model Comparison**: Explore other machine learning algorithms such as Random Forest, Support Vector Machines, and K-Nearest Neighbors for performance comparison.
- **Hyperparameter Tuning**: Implement hyperparameter tuning to optimize the performance of more complex models.
- **Feature Selection**: Investigate feature importance to potentially reduce the number of predictors while maintaining accuracy.

## Requirements

The project requires the following R packages:

- `tidyverse`
- `recipes`
- `caret`
- `AppliedPredictiveModeling`
-  `dplyr`

You can install these packages using the following command:

```R
install.packages(c("tidyverse", "recipes", "caret", "AppliedPredictiveModeling", "dplyr"))
```

## How to Run
  1. Clone the repository:
  ```bash
  git clone https://github.com/your-username/breast-cancer-diagnosis.git
  ```

  2. Open the project in RStudio.

  3. Run the `breast_cancer_diagnosis.R` script to reproduce the results.

## Contact us
For any questions or interest in the project, you can contact me through my [LinkedIn](https://www.linkedin.com/in/arnau-urbina-lopez/) profile.


