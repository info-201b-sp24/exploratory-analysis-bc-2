library(ggplot2)
library(maps)
library(mapdata)
library(dplyr)
library(readr)
library(viridis)

county_data <- read.csv("county_demographics.csv")

wa_county_map <- map_data("county", region = "washington")

county_data <- county_data %>%
  mutate(subregion = tolower(County)) %>%
  select(subregion, Total)

wa_county_map <- wa_county_map %>%
  left_join(county_data, by = "subregion")

ggplot(data = wa_county_map, aes(x = long, y = lat, group = group, fill = Total)) +
  geom_polygon(color = "black") +
  coord_fixed(1.3) +
  theme_minimal() +
  labs(title = "Voting Distribution by County in WA",
       x = "Longitude",
       y = "Latitude",
       fill = "Total Population") +
  scale_fill_viridis_c()