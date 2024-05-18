library(ggplot2)
library(dplyr)
library(tidyr)

last_row <- voterDemographics %>% slice(n())

last_values <- last_row %>% select(Female, Male, Other, `Grand.Total`)

graph_data <- last_values %>%
  gather(key = "gender", value = "number_of_voters")

graph_data$gender <- factor(graph_data$gender, levels = c("Female", "Male", "Other", "Grand.Total"))


ggplot(graph_data, aes(x = gender, y = number_of_voters)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  ggtitle("Aggregate Voter Demograhics by Gender") +
  labs(x = "Gender", y = "Number of Voters")