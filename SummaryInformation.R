library(dplyr)
library(tidyr)

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
#Finding the county with the highest/lowest votes pertaining to genders
most_male_voters <- county_summary %>%
  filter(total_male_voters == max(total_male_voters, na.rm = TRUE)) %>%
  select(County, total_male_voters)

least_male_voters <- county_summary %>%
  filter(total_male_voters == min(total_male_voters, na.rm = TRUE)) %>%
  select(County, total_male_voters)

most_female_voters <- county_summary %>%
  filter(total_female_voters == max(total_female_voters, na.rm = TRUE)) %>%
  select(County, total_female_voters)

least_female_voters <- county_summary %>%
  filter(total_female_voters == min(total_female_voters, na.rm = TRUE)) %>%
  select(County, total_female_voters)

most_unspecified_voters <- county_summary %>%
  filter(total_other_voters == max(total_other_voters, na.rm = TRUE)) %>%
  select(County, total_other_voters)

least_unspecified_voters <- county_summary %>%
  filter(total_other_voters == min(total_other_voters, na.rm = TRUE)) %>%
  select(County, total_other_voters)

