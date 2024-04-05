#### Preamble ####
# Purpose: Models ....
# Author: Chay Park
# Date: 4 April 2024
# Contact: chay.park@mail.utoronto.ca
# License: MIT
# Pre-requisites: [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(arrow)

#### Set seed for reproducibility ####
set.seed(853)

#### Read data ####
analysis_data <- read_parquet("outputs/data/analysis_data.csv")

age_data <- read.csv(file = here::here("outputs/data/Age_subgroup_trends.csv"))

### Model data ####
first_model <-
  stan_glm(
    formula = flying_time ~ length + width,
    data = analysis_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 853
  )


#### Save model ####
saveRDS(
  first_model,
  file = "outputs/models/first_model.rds"
)


