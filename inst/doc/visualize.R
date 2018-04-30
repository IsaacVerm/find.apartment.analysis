## ----setup, include=FALSE------------------------------------------------

library(knitr)
library(ggplot2)
library(dplyr)

opts_chunk$set(echo=TRUE,
               warning=FALSE,
               message=FALSE,
               cache=FALSE)

devtools::load_all(here::here())


## ----load----------------------------------------------------------------

read_tidy_listings()


## ----influence_energy_consumption----------------------------------------

ggplot(data = tidy_listings,
       aes(x = energy_consumption, y = price_per_square_m)) +
  geom_point()


## ----influence_construction_year-----------------------------------------

ggplot(data = tidy_listings,
       aes(x = construction_year, y = price_per_square_m)) +
  geom_point()


## ----influence_current_state---------------------------------------------

df_influence_current_state <- tidy_listings %>%
  filter(!is.na(current_state)) %>% 
  group_by(current_state) %>% 
  summarise(avg_price_per_square_m = mean(price_per_square_m, na.rm = TRUE))

ggplot(data = df_influence_current_state,
       aes(x = current_state, y = avg_price_per_square_m)) +
  geom_col()

## ----influence_muncipality-----------------------------------------------

df_influence_muncipality <- tidy_listings %>%
  filter(!is.na(muncipality)) %>% 
  group_by(muncipality) %>% 
  summarise(avg_price_per_square_m = mean(price_per_square_m, na.rm = TRUE)) %>% 
  arrange(avg_price_per_square_m) %>% 
  mutate(muncipality = factor(x = muncipality, levels = muncipality)) # so muncipality is displayed in order of price

ggplot(data = df_influence_muncipality,
       aes(x = muncipality, y = avg_price_per_square_m)) +
  geom_col() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


