---
title: "Is an automatic or manual transmission better for MPG?"
author: "Sergey Bushmanov"
date: "08/21/2014"
output: pdf_document
---



### Executive summary
To answer the question "Is an automatic or manual transmission better for MPG?" we
should go out and collect MPG measures on all brands existing (population). 
However, with the help of regression analysis we can answer this question approximately,
with a stated precision, by analyzing a sample. The results obtained by analizing
`mtcars` sample in R show that Automobiles with automatic transmission appear to deliver much
less MPG. On average, given sample at hand and developed regression model, autos with automatic
transmission have x MPG with 95% CI wrapping this average at ... values, and autos
with manual transmission have y MPG with 95% CI. Prediction 95% ranges are ... 
and ... respectively. However, this simple regression model with single predictor
is not very efficient in predicting MPG and an alternative linear model is shown.

### Exploratory analysis
![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 






















Executive summary

1. Boxplot of MPG on two states of am and exploratory data analysis:  
- mean and median, CI, summary by transmission type.

2. Fitting LS linear regreeion: preliminary diagnostics, interpretation of coeff
icients and residual plot. ggplot with additional dimensions, caret::featurePlot

3. Alternative models. Comparison among models.

4. Uncertainty in the best-fit model.
