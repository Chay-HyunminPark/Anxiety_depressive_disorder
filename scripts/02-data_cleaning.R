#### Preamble ####
# Purpose: Cleans the raw plane datas recorded by National Center for Health Statistics
# Author: Chay Park
# Date: 4 April 2024
# Contact: chay.park@mail.utoronto.ca
# License: MIT
# Pre-requisites: 00-install_packages, 01-download_data

#### Workplace setup ####

# Load the necessary library
library(tidyverse)
library(dplyr)
library(janitor)
library(arrow)

#### Main dataset cleaning ####

# Define the path to the raw data file
raw_data_path <- "inputs/data/Indicators_of_Anxiety_or_Depression_Based_on_Reported_Frequency_of_Symptoms_During_Last_7_Days_20240401.csv"

# Load the raw data file
raw_data <- read_csv(raw_data_path)

# Convert 'Time Period End Date' from string to date format in the raw_data dataframe
raw_data$`Time Period End Date` <- as.Date(raw_data$`Time Period End Date`, format="%m/%d/%Y")

# Filter out rows where 'Value' column is empty
nonempty_data <- raw_data %>%
  filter(!is.na(Value) & Value != "")

# Rename 'Time Period End Date' to 'Date'
cleaned_data <- rename(nonempty_data, Date = `Time Period End Date`)

#### Overall_trends #### 

# Filter the dataset for 'National Estimate' group
national_estimate_data <- cleaned_data %>%
  filter(Group == "National Estimate" & 
           Indicator %in% c("Symptoms of Anxiety Disorder or Depressive Disorder",
                            "Symptoms of Depressive Disorder", 
                            "Symptoms of Anxiety Disorder"))

# Save the 'National Estimate' data to a new parquet file in the specified directory
write_parquet(national_estimate_data, "outputs/data/Overall_trends.parquet")


#### Subgroup trends - by age group cleaned dataset ####

# Filter the dataset to keep only rows where the 'Indicator' column is "Symptoms of Depressive Disorder"
dep_data <- filter(cleaned_data, Indicator == "Symptoms of Depressive Disorder")

# Filter the dataset for 'By Age' group
by_age_data <- dep_data %>%
  filter(Group == "By Age")

# Save the 'By Age' data to a new parquet file in the specified directory
write_parquet(by_age_data, "outputs/data/Age_subgroup_trends.parquet")

#### Subgroup trends - by sex group cleaned dataset ####

# Filter the dataset for 'By Sex' group
by_sex_data <- dep_data %>%
  filter(Group == "By Sex")

# Save the 'By Age' data to a new parquet file in the specified directory
write_parquet(by_sex_data, "outputs/data/Sex_subgroup_trends.parquet")


#### Subgroup trends - by race/hispanic ethnicity group cleaned dataset ####

# Filter the dataset for 'By Race/Hispanic ethnicity' group
by_race_data <- dep_data %>%
  filter(Group == "By Race/Hispanic ethnicity")

# Save the 'By Age' data to a new parquet file in the specified directory
write_parquet(by_race_data, "outputs/data/Race_subgroup_trends.parquet")

#### Subgroup trends - by education group cleaned dataset ####

# Filter the dataset for 'By Education' group
by_educ_data <- dep_data %>%
  filter(Group == "By Education")

# Save the 'By Age' data to a new parquet file in the specified directory
write_parquet(by_educ_data, "outputs/data/Educ_subgroup_trends.parquet")




#### Second dataset cleaning ####

# Define the path to the raw data file
soc_raw_data_path <- "inputs/data/Lack_of_Social_Connection.csv"

# Load the raw data file
soc_raw_data <- read_csv(soc_raw_data_path)

# Convert 'Time Period End Date' from string to date format in the raw_data dataframe
soc_raw_data$`Time Period End Date` <- as.Date(soc_raw_data$`Time Period End Date`, format="%m/%d/%Y")

# Filter out rows where 'Value' column is empty
soc_nonempty_data <- soc_raw_data %>%
  filter(!is.na(Value) & Value != "")

# Rename 'Time Period End Date' to 'Date'
soc_cleaned_data <- rename(soc_nonempty_data, Date = `Time Period End Date`)

#### Overall_trends #### 

# Filter the dataset for 'National Estimate' group
social_national_estimate_data <- cleaned_data %>%
  filter(Group == "National Estimate" & 
           Indicator %in% c("Adults who sometimes, rarely, or never get the social and emotional support they need",
                            "Adults who usually or always feel lonely"))

# Save the 'National Estimate' data to a new parquet file in the specified directory
write_parquet(social_national_estimate_data, "outputs/data/us_lonely_trends.parquet")


#### Subgroup trends - by age group cleaned dataset ####

# Filter the dataset to keep only rows where the 'Indicator' column is "Symptoms of Depressive Disorder"
dep_data <- filter(cleaned_data, Indicator == "Symptoms of Depressive Disorder")

# Filter the dataset for 'By Age' group
by_age_data <- dep_data %>%
  filter(Group == "By Age")

# Save the 'By Age' data to a new parquet file in the specified directory
write_parquet(by_age_data, "outputs/data/Age_subgroup_trends.parquet")

#### Subgroup trends - by sex group cleaned dataset ####

# Filter the dataset for 'By Sex' group
by_sex_data <- dep_data %>%
  filter(Group == "By Sex")

# Save the 'By Age' data to a new parquet file in the specified directory
write_parquet(by_sex_data, "outputs/data/Sex_subgroup_trends.parquet")


#### Subgroup trends - by race/hispanic ethnicity group cleaned dataset ####

# Filter the dataset for 'By Race/Hispanic ethnicity' group
by_race_data <- dep_data %>%
  filter(Group == "By Race/Hispanic ethnicity")

# Save the 'By Age' data to a new parquet file in the specified directory
write_parquet(by_race_data, "outputs/data/Race_subgroup_trends.parquet")

#### Subgroup trends - by education group cleaned dataset ####

# Filter the dataset for 'By Education' group
by_educ_data <- dep_data %>%
  filter(Group == "By Education")

# Save the 'By Age' data to a new parquet file in the specified directory
write_parquet(by_educ_data, "outputs/data/Educ_subgroup_trends.parquet")
