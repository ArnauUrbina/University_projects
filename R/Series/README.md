## Study of the Evolution of the Price of New Housing in the Balearic Islands (2007-2021)

## Objective of the project
The aim of this project is to carry out a temporal analysis of the quarterly evolution of the price of new housing in the autonomous community of the Balearic Islands, from the first quarter of 2007 to the second quarter of 2021. The study focuses on analysing trends, significant variations and making a forecast for the first quarter of 2022.

## Description of the Analysis
1. **Visualisation and Temporal Comparison:**

    - Two time series are presented: one corresponding to prices in the Balearic Islands and the other to the national average, which allows the evolution of the local market to be visualised in comparison with the national market.

2. **Moving Average and Global Average:**

    - The four-quarter moving average and the global average of the series are calculated to analyse the trend and seasonality in the Balearic Islands.

3. **Analysis of Price Variations:**

    - The highest and lowest peaks and troughs of the series are identified, calculating the percentage variation between them, as well as the largest quarterly increases and decreases.

4. **Series Modelling for Price Forecasting:**

    - An adjusted series since 2014 is used to perform a simple linear regression model, which explains the general behaviour of house prices as a function of time.

    - In addition, a Holt-Winters exponential smoothing model is implemented to capture both trend and seasonality.

    - The stationarity of the series is assessed, applying differencing to stabilise the trend, and ARIMA models are fitted using R's auto.arima() function for forecasting.

5. **Forecast for the First Quarter of 2022:**

    - The results of the models (linear regression, Holt-Winters and ARIMA) provide a point estimate of house prices in the Balearic Islands for the first quarter of 2022, together with confidence intervals.

## Models Used

  - **Linear Regression:** Explains the general trend in house prices over time.

  - **Holt-Winters:** Exponential smoothing model to capture trend and seasonality, generating a forecast with confidence intervals.
  - 
  - **ARIMA:** Integrated autoregressive moving average model, with automatic parameter selection to model the time series.
  - 
## Requirements

  - R 4.0 or higher
  - Libraries used:
    - `stats`
    - `TSA`
    - `lmtest`
    - `fpp`
    - `readxl`
    - `quantmod`

## Conclusions

This analysis allows us to visualise how the real estate market in the Balearic Islands has followed a recovery trend after the 2008 crisis, with a performance that sometimes exceeds the national average. The predictive models offer estimates for the price in 2022, indicating an upward trend in the prices of new homes.
