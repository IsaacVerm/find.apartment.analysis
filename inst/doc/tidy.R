## ----setup, include=FALSE------------------------------------------------

library(knitr)

opts_chunk$set(echo=TRUE,
               warning=FALSE,
               message=FALSE,
               cache=FALSE)

devtools::load_all(here::here())


## ----load----------------------------------------------------------------

listings <- read_raw_listings()


## ----tidying-------------------------------------------------------------

listings <- listings %>%
  extract_digit_variables %>% 
  extract_postcode %>% 
  state_to_english %>% 
  correct_data_types %>% 
  make_incorrect_values_missing %>% 
  remove_empty_cases
  


## ----transforming--------------------------------------------------------

listings <- listings %>% 
  add_muncipality %>% 
  add_total_cost %>% 
  add_price_per_square_m


## ----save----------------------------------------------------------------

save_tidy_listings(listings)


