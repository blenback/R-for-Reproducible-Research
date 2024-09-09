########################################################################
## Script name: 01_data_analysis.R
## Purpose of script: This script reads in the raw data, summarizes it
## and saves the processed data
## Author: Jane Doe
## Date Created: 2024-08-09
########################################################################

# Load required packages
library(stringr)

# Raw data dir
raw_dir <- "Data/Raw"

# vector and create processed data save dir
save_dir <- "Data/Processed"
dir.create(save_dir,
           showWarnings = FALSE,
           recursive = TRUE)

# Load csv file of data
rice_data <- read.csv(file.path(raw_dir, "RiceFarms.csv"))

# summarise data into size of farms by rice type (varieties)
#according to different regions
rice_data_summary <- aggregate(rice_data$size,
                               by=list(rice_data$region, rice_data$varieties),
                               FUN=sum)

# rename columns
colnames(rice_data_summary) <- c("region", "varieties", "size")

# clean the names of the rice varieties
# "high" = High Yield
# "mixed" = Mixed crop
# "trad" = Traditional
rice_data_summary$varieties <- gsub("high", "High Yield", rice_data_summary$varieties)
rice_data_summary$varieties <- gsub("mixed", "Mixed Crop", rice_data_summary$varieties)
rice_data_summary$varieties <- gsub("trad", "Traditional", rice_data_summary$varieties)

# Capitalize the first letter of the region names
rice_data_summary$region <- str_to_title(rice_data_summary$region)

# Save summary of data
write.csv(rice_data_summary,
          file.path(save_dir, "RiceFarms_summary.csv"),
          row.names=FALSE)


