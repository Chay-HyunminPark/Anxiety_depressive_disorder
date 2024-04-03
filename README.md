# Anxiety Depressive Disorder

## Overview

This repository focuses on analyzing and visualizing data related to anxiety or depressive disorder rates in US. Through an analysis of trends spanning from 2020 to 2024, we investigate variations in anxiety or  depressive disorder rates among different age groups, race/ethnicity, sex, and education levels. Moreover, this paper uncovers additional factors contributing to this trend. Lastly, this paper reveals the correlation between lack of social connection and depressive disorder rates during the first quarter of the year, 2024. 

To use this folder, click the green "Code" button", then "Download ZIP". Move the downloaded folder to where you want to work on your own computer, and then modify it to suit.

## File Structure

The repo is structured as:

-   `input/data` contains the data sources used in analysis including the raw data.
-   `outputs/data` contains the cleaned dataset that was constructed.
-   `outputs/paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download, clean and test data.

## Reproducibility

### Downloading Data

#### Procedure ####
Step 1) Type the following url 'data.cdc.gov' on your web browser
Step 2) Search "Indicators of Anxiety or Depression Based on Reported Frequency of Symptoms During Last 7 Days"
Step 3) Make sure to check the data set is sort by Most Relevant
Step 4) Click a data set with a title "Indicators of Anxiety or Depression Based on Reported Frequency of Symptoms During Last 7 Days"
Step 5) Double check the data is provided by NCHS/DHIS and the publisher is National Center for Health Statistics
Step 6) Click Export button on the top right to export dataset. Before downloading the data, make sure it's set to download file and export format is in CSV.
Step 7) Search "Lack of Social Connection" 
Step 8) Click the dataset and check the data is provided by NCHS/DHIS and the publisher is National Center for Health Statistics
Step 9) Download the dataset by exporting it in CSV format

### Dependencies
To reproduce the analysis, ensure you have the following R packages installed:

- `ggplot2`
- 'gridExtra'
- 'dplyr'
- 'tidyr'

You can install these packages using the following command:

```R
install.packages(c("ggplot2", "gridExtra","dplyr","tidyr"))
```

### Code Execution
The analysis is performed in R, and the code is available in the `analysis` directory. To execute the code, follow these steps:

1. Load the required libraries.
2. Read the cleaned data from the CSV file.
3. Perform data filtering and manipulation for specific analyses.
4. Generate tables and graphs to visualize trends.
  

## Code and Data Availability

The entire codebase and datasets used for this analysis are available in this repository. You can reproduce the analysis by following the instructions provided in the README.

For any questions or clarifications, feel free to reach out to the repository owner.

*Code and data supporting this analysis is available at: https://github.com/Chay-HyunminPark/Anxiety_depressive_disorder

## Statement on LLM Usage
Certain sections of the code were generated with the assistance of ChatGPT4. The complete chat history is available in `inputs/llms/usage.txt`. 
