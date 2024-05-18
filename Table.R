library(knitr)
library(dplyr)
library(tidyr)

voterDemographics <- read.csv("county demographics.csv")

#Cleaning up the dataset
dataClean <- voterDemographics %>% filter(County != "Grand Total")
dataClean <- dataClean %>% select(-City)
dataClean[dataClean == ""] <- NA
cleaned_data <- dataClean %>% drop_na()

#Grouping the dataset
county_summary <- cleaned_data %>%
  group_by(County) %>%
  summarise(
    total_male_voters = sum(as.numeric(Male)),
    total_female_voters = sum(as.numeric(Female)),
    total_other_voters = sum(as.numeric(Other))
  )

kable(county_summary)