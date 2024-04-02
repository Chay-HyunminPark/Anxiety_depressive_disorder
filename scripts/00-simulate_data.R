#### Preamble ####
# Purpose: Simulates the scenario, creates the dataset, plots the data, runs the tests code based on the simulated data
# Author: Chay Park
# Date: 2 April 2024
# Contact: chay.park@mail.utoronto.ca
# License: MIT
# Pre-requisites: Pre-install necessary packages 


#### Workspace setup ####

# Load necessary libraries
library(tidyverse)
library(lubridate)
library(testthat)

#### Simulate data ####
set.seed(123)  # For reproducibility
data <- expand.grid(
  Date = seq(ymd('2020-01-01'), ymd('2024-12-31'), by="1 month"),
  AgeGroup = c('18-29', '30-39', '40-49', '50-59', '60-69', '70-79', '80+'),
  RaceEthnicity = c('White', 'Black', 'Hispanic', 'Asian', 'Other'),
  EducationLevel = c('Less than HS', 'HS Graduate', 'Some College', 'Bachelor’s', 'Graduate'),
  Sex = c('Male', 'Female')
)

# Generate random anxiety and depression levels
data$AnxietyLevel <- round(runif(nrow(data), 20, 80), 0)
data$DepressionLevel <- round(runif(nrow(data), 20, 80), 0)

# View the first few rows of the dataset
head(data)

# Aggregate data for plotting
monthly_data <- data %>%
  group_by(Date, AgeGroup) %>%
  summarise(
    AvgAnxiety = mean(AnxietyLevel),
    AvgDepression = mean(DepressionLevel),
    .groups = 'drop'  # To avoid grouping-related warnings in summarise
  )

# Test the structure of the dataset
test_that("Data structure is correct", {
  expect_true(all(c("Date", "AgeGroup", "RaceEthnicity", "EducationLevel", "Sex", "AnxietyLevel", "DepressionLevel") %in% names(data)))
  expect_type(data$Date, "Date")
  expect_type(data$AgeGroup, "factor")
  expect_type(data$AnxietyLevel, "numeric")
  expect_type(data$DepressionLevel, "numeric")
})

# Test that anxiety and depression levels are within the expected range
test_that("Anxiety and depression levels are within range", {
  expect_true(all(data$AnxietyLevel >= 20 & data$AnxietyLevel <= 80))
  expect_true(all(data$DepressionLevel >= 20 & data$DepressionLevel <= 80))
})

# Test the aggregated data
test_that("Aggregated data has correct structure and values", {
  expect_true("Date" %in% names(monthly_data) && "AgeGroup" %in% names(monthly_data))
  expect_true("AvgAnxiety" %in% names(monthly_data) && "AvgDepression" %in% names(monthly_data))
  expect_true(all(monthly_data$AvgAnxiety >= 20 & monthly_data$AvgAnxiety <= 80))
  expect_true(all(monthly_data$AvgDepression >= 20 & monthly_data$AvgDepression <= 80))
})

# Plot the data
ggplot(monthly_data, aes(x = Date)) +
  geom_line(aes(y = AvgAnxiety, color = AgeGroup), size = 1) +
  geom_line(aes(y = AvgDepression, linetype = AgeGroup), size = 1) +
  labs(
    title = "Trends of Anxiety and Depression Levels from 2020 to 2024",
    x = "Date",
    y = "Average Level (%)"
  ) +
  theme_minimal() +
  scale_color_brewer(palette = "Set1") +
  facet_wrap(~AgeGroup, scales = 'free_y')
