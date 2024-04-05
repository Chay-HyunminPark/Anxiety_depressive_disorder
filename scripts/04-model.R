#### Preamble ####
# Purpose: Models ....
# Author: Chay Park
# Date: 4 April 2024
# Contact: chay.park@mail.utoronto.ca
# License: MIT
# Pre-requisites: 00-install_packages

#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(arrow)

#### Set seed for reproducibility ####
set.seed(853)

#### Read data ####
age_data <- read_parquet(file = here::here("outputs/data/Age_subgroup_trends.parquet"))

### Model data ####
age_model <-
  stan_glm(
    formula = Value_time ~ length + width,
    data = age_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 853
  )


#### Save model ####
saveRDS(
  age_model,
  file = "outputs/models/age_model.rds"
)


