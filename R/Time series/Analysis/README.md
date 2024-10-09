# Time Series Analysis - University Assignment

This repository contains the analysis and modeling of time series data for two different datasets: the **Ibex35 stock index** and the **wholesale electricity prices in Spain (2021)**. The analysis was conducted as part of a university assignment for a course in time series analysis.

## Project Overview

The project is divided into two main exercises:

### Exercise 1: Analysis of the Ibex35 Stock Index (2006 - Present)
In this exercise, we analyze the log-returns of the Ibex35 stock index, focusing on key aspects such as stationarity, model selection, and volatility clustering. The steps include:

1. **Data Preparation:** We calculated the log-returns of the stock index from 2006 to the present.
2. **Visualization and Stationarity Test:** The series is plotted and tested for stationarity using the Dickey-Fuller test.
3. **Model Selection:** Based on the ACF, PACF, and the auto.arima() function, several ARMA models were proposed and evaluated.
4. **Residual Analysis:** We analyze the residuals of the fitted model to detect volatility clustering.
5. **GARCH Model Fitting:** Given the presence of volatility, a GARCH(1,1) model was fitted to the residuals to capture the time-varying volatility.
6. **Model Comparison:** Multiple GARCH models of different orders were tested and compared using the AIC.
7. **Prediction and Confidence Intervals:** Predictions were made using the GARCH model, and the predict() function from the tseries package was used to generate confidence intervals.

### Exercise 2: Analysis of Wholesale Electricity Prices in Spain (2021)
This exercise involves the time series of daily wholesale electricity prices in Spain for the year 2021. Key points include:

1. **Data Exploration:** The series is visualized to detect trends and seasonality. The series contains 362 observations.
2. **Linear Trend Analysis:** A linear regression model was proposed to capture the trend, but residual analysis showed that it was not sufficient.
3. **Model Selection:** Based on the ACF, PACF, and auto.arima(), a suitable ARMA model was chosen. The presence of ARCH effects indicated the need for a GARCH model.
4. **Predictions:** The model was used to predict the last quarter of 2021. The predictions were compared against the actual values, and the goodness of fit was analyzed.

## Key Results

- The **Ibex35 log-returns** were found to be stationary, and an **ARMA(0,2)** model was selected. However, due to volatility clustering, a **GARCH(1,1)** model provided a better fit for the data.
- For the **electricity price data**, an **ARMA + GARCH** model was chosen due to the presence of both trend and volatility in the residuals. The model provided good predictions for the last quarter of 2021.

## Technologies Used

- **R:** For data analysis and modeling (`forecast`, `tseries`, `fGarch`, `TSA`).
- **RMarkdown:** For reporting and code documentation.
- **Libraries:**
        - Time series analysis: `forecast`, `tseries`, `TSA`, `fGarch`
        - Data manipulation: `tidyverse`, `lubridate`
        - Visualization: `ggplot2`

## Contact us

For any questions or interest in the project, you can contact me through my [LinkedIn](https://www.linkedin.com/in/arnau-urbina-lopez/) profile.

  
