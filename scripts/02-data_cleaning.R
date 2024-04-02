#### Preamble ####
# Purpose: Cleans the raw plane data recorded by National Center for Health Statistics
# Author: Chay Park
# Date: 2 April 2024
# Contact: chay.park@mail.utoronto.ca
# License: MIT
# Pre-requisites: Pre-install package called janitor

#### Workspace setup ####
library(tidyverse)

# Rename the CSV files

#### Clean data ####
raw_data <- read_csv("inputs/data/Indicators_of_Anxiety_or_Depression_Based_on_Reported.csv")

# eliminate the rows subdivided By State, eliminate the columns Phase, Time Period, Time Period Label


#### Save data ####
write_csv(cleaned_data, "outputs/data/analysis_data.csv")
