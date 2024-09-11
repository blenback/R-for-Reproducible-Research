########################################################################
## Script name: RiceFarm_master.R
## Purpose of script: This script recreates the environment of the project
## and sources the sub-scripts to perform the different steps of the analysis
## Author: Jane Doe
## Date Created: 2024-08-09
########################################################################

# Restore the project package environment with renv
#renv::restore()

### =========================================================================
### 01- Data analysis
### =========================================================================

# Source the data analysis script
source("Scripts/01_data_analysis.R")

### =========================================================================
### 02- Data visualization
### =========================================================================

# Source the data visualization script
source("Scripts/02_data_visualisation.R")
