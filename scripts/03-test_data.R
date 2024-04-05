#### Preamble ####
# Purpose: Tests the codes on the cleaned dataset 
# Author: Chay Park
# Date: 4 April 2024
# Contact: chay.park@mail.utoronto.ca
# License: MIT
# Pre-requisites: 00-install_packages, 01-download_data

#### Test data ####
# Load the necessary library
library(testthat)
library(readr)
library(arrow)

# Load the dataset from the parquet file
data <- read_parquet(file = here::here("inputs/data/Overall_trends.parquet"))

# Convert Date to Date type and other necessary type conversions
data$Date <- as.Date(data$Date, format="%Y-%m-%d")
data$AgeGroup <- as.factor(data$AgeGroup)
data$RaceEthnicity <- as.factor(data$RaceEthnicity)
data$EducationLevel <- as.factor(data$EducationLevel)
data$Sex <- as.factor(data$Sex)

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

# Since the file does not contain aggregated data, this part might need adjustment
# Assuming we create a summary (aggregated data) similar to the previous structure
monthly_data <- data %>%
  group_by(Date, AgeGroup) %>%
  summarise(
    AvgAnxiety = mean(AnxietyLevel, na.rm = TRUE),
    AvgDepression = mean(DepressionLevel, na.rm = TRUE),
    .groups = 'drop'
  )

# Test the aggregated data
test_that("Aggregated data has correct structure and values", {
  expect_true("Date" %in% names(monthly_data) && "AgeGroup" %in% names(monthly_data))
  expect_true("AvgAnxiety" %in% names(monthly_data) && "AvgDepression" %in% names(monthly_data))
  expect_true(all(monthly_data$AvgAnxiety >= 20 & monthly_data$AvgAnxiety <= 80))
  expect_true(all(monthly_data$AvgDepression >= 20 & monthly_data$AvgDepression <= 80))
})
