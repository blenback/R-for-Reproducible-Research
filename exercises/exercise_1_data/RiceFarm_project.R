# set working directory
setwd("C:/Users/bblack/switchdrive/Private/git_laptop/R-for-Reproducible-Research/exercises/exercise_data")

# Load required packages
library(ggplot2)
library(stringr)

# Load csv file of data
rice_data <- read.csv("RiceFarms.csv")


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
ggsave("Regional_size_summary_bar.png", plot=summary_plot, width=29, height=21, units="cm", dpi=300)


