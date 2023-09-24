# Load required libraries
library(dplyr)
library(ggplot2)
library(lmtest)

# Load the dataset (make sure it's available in your working directory or specify the full file path)
heart_data <- read.csv("heart.csv")

# Explore the dataset
head(heart_data)
# Define outcome and predictor variables
outcome_variable <- "chol"  
predictor_variable <- "age"  

ggplot(data = heart_data, aes(x = get(predictor_variable), y = get(outcome_variable))) +
  geom_point() +
  labs(x = predictor_variable, y = outcome_variable) +
  ggtitle(paste("Scatterplot of", predictor_variable, "vs.", outcome_variable))

# Fit a linear regression model
model <- lm(get(outcome_variable) ~ get(predictor_variable), data = heart_data)

# Summary of the linear regression model
summary(model)

# Hypothesis tests on coefficients
coeftest(model)

ggplot(data = heart_data, aes(x = get(predictor_variable), y = get(outcome_variable))) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(x = predictor_variable, y = outcome_variable) +
  ggtitle(paste("Linear Regression:", predictor_variable, "vs.", outcome_variable))
