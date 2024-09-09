########################################################################
## Script name: 02_data_visualisation.R
## Purpose of script: This script reads in the summarized data,
## creates a bar chart and saves it
## Author: Jane Doe
## Date Created: 2024-08-09
########################################################################

# Load required packages
library(ggplot2)

# vector and create to dir to save plots
plot_dir <- "Output/Visualisations"
dir.create(plot_dir,
           showWarnings = FALSE,
           recursive = TRUE)

# load the summarized data
rice_data_summary <- read.csv("Data/Processed/RiceFarms_summary.csv")

# plot summary data as grouped bar chart
summary_plot <- ggplot(rice_data_summary, aes(x=region, y=size, fill=varieties)) +
  geom_bar(stat="identity", position="dodge") +
  labs(title="Total size of farms by region and rice varieties",
       x="Region",
       y="Total size of farms",
       fill="Rice varieties") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Save plot
ggsave(file.path(plot_dir, "Regional_size_summary_bar.png"),
       plot=summary_plot,
       width=29,
       height=21,
       units="cm",
       dpi=300)
