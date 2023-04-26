install.packages('tidyverse')
library(tidyverse)
unicef_indicator_1 <- read.csv("/cloud/project/unicef_indicator_1.csv")unicef_bar <- select(unicef_indicator_1, time_period, obs_value)
ggplot(data = unicef_indicator_1) + aes(x = time_period, y = obs_value) + geom_col() + labs(y = "Infant Immunoisation", x = "Time Period")
unicef_Angola <- filter(unicef_metadata, country == 'Angola')
ggplot(data = unicef_metadata.) + aes(x = GDP_per_capita, y = LifeExp, color = country) +labs(x = "GDP per capita", y = "Life Expectancy", title = "Life Expectancy vs GDP per capita") + geom_point() + guides(color = "none")
colnames(unicef_metadata.)[11] ="LifeExp"
colnames(unicef_metadata.)[8] ="GDP_per_capita"
colnames(unicef_metadata.)[7] = "Pop_total" 
print(unicef_metadata.)
ggplot(unicef_Angola) + aes(x = year, y = Life.expectancy.at.birth..total..years.) + geom_line(color = 'red') + labs(
  x = "Year (from 1960 -2021)",
  y = "Life Expectancy",
  title = substitute(paste(bold("Evolution of Angola's Life Expectancy from 1960 to 2021.")))
) + geom_smooth() + theme_classic()
install.packages("maps")
pop_2021 <- unicef_metadata. %>%
  filter(year == 2021)
map_world <- map_data("world")
map_pop_2021 <- full_join(map_world, pop_2021, by = c("region" = "country"))
ggplot(data = map_pop_2021) + aes( x = long, y = lat, group = group, fill = Pop_total) + geom_polygon()
vaccine_2021 <- unicef_indicator_1 %>%
  filter(time_period == 2021)
map_world <- map_data("world")
map_vaccine_2021 <- full_join(map_world, vaccine_2021, by = c("region" = "country"))
ggplot(data = map_vaccine_2021) + aes( x = long, y = lat, group = group, fill = obs_value) + geom_polygon() + scale_fill_gradient(low = "red", high = "green", na.value = "grey") + labs(
  title = substitute(paste(bold("Differences between countries regarding yellow flu vaccine uptake rates."))),
  subtitle = substitute(paste(italic("Countries in grey have had a mismatch with their names hence have no data."))),
  x = "Longitude",
  y = "Latitude",
  fill = "% Vaccine uptake"
) + theme_classic()
