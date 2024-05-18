library(dplyr)
library(ggplot2)

voter_table <- read.csv("county demographics.csv")

filtered_data <- voter_table %>%
  filter(!is.na(County) & County != "")
filtered_data <- filtered_data[-nrow(filtered_data), ]

filtered_data <- filtered_data %>%
  mutate(Ratio = Other / Grand.Total)

ggplot(filtered_data) +
  geom_point(mapping = aes(
    x = Grand.Total, 
    y = Ratio
  )) +
  labs(
    title ="Total County Population vs Percent of Population Identifying as 'Other'", 
    x = "County Population",
    y = "Percentage Identifying as 'Other'"
  )
