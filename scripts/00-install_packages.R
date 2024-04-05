#### Preamble ####
# Purpose: Installs packages needed to run scripts and Quarto document
# Author: Chay Park
# Date: 4 April 2024
# Contact: chay.park@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
## Installing packages (only needs to be done once per computer)
install.packages("tidyverse") # Contains data-related packages
install.packages("knitr") # To make tables
install.packages("janitor") # To clean datasets
install.packages("dplyr")
install.packages("ggplot2") # To make graphs
install.packages("usethis") 
install.packages("arrow") # To allow Parquet files to be create
install.packages("testthat") # To test
install.packages("patchwork")
install.packages("extrafont")

# For models
install.packages("beepr")
install.packages("broom")
install.packages("broom.mixed")
install.packages("purrr")
install.packages("rstanarm")
install.packages("modelsummary")