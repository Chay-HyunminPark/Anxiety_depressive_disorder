#### Preamble ####
# Purpose: Cleans the raw plane data recorded by National Center for Health Statistics
# Author: Chay Park
# Date: 2 April 2024
# Contact: chay.park@mail.utoronto.ca
# License: MIT
# Pre-requisites: Install package 'tidyverse'

# Load the necessary library
library(tidyverse)

# Define the path to the raw data file
raw_data_path <- "inputs/data/Indicators_of_Anxiety_or_Depression_Based_on_Reported_Frequency_of_Symptoms_During_Last_7_Days_20240401.csv"

# Load the raw data file
raw_data <- read_csv(raw_data_path)

#### Overall_trends #### 

# Filter the dataset for 'National Estimate' group
national_estimate_data <- raw_data %>%
  filter(Group == "National Estimate" & 
           Indicator %in% c("Symptoms of Anxiety Disorder or Depressive Disorder",
                            "Symptoms of Depressive Disorder", 
                            "Symptoms of Anxiety Disorder"))

# Save the 'National Estimate' data to a new CSV file in the specified directory
write_csv(national_estimate_data, "outputs/data/Overall_trends.csv")

#### Subgroup trends - by age group cleaned dataset ####

# Filter the dataset for 'By Age' group
by_age_data <- raw_data %>%
  filter(Group == "By Age")

# Save the 'By Age' data to a new CSV file in the specified directory
write_csv(by_age_data, "outputs/data/Age_subgroup_trends.csv")

#### Subgroup trends - by sex group cleaned dataset ####

# Filter the dataset for 'By Sex' group
by_sex_data <- raw_data %>%
  filter(Group == "By Sex")

# Save the 'By Age' data to a new CSV file in the specified directory
write_csv(by_sex_data, "outputs/data/Sex_subgroup_trends.csv")


#### Subgroup trends - by race/hispanic ethnicity group cleaned dataset ####

# Filter the dataset for 'By Race/Hispanic ethnicity' group
by_race_data <- raw_data %>%
  filter(Group == "By Race/Hispanic ethnicity")

# Save the 'By Age' data to a new CSV file in the specified directory
write_csv(by_race_data, "outputs/data/Race_subgroup_trends.csv")

#### Subgroup trends - by education group cleaned dataset ####

# Filter the dataset for 'By Education' group
by_educ_data <- raw_data %>%
  filter(Group == "By Education")

# Save the 'By Age' data to a new CSV file in the specified directory
write_csv(by_educ_data, "outputs/data/Educ_subgroup_trends.csv")

