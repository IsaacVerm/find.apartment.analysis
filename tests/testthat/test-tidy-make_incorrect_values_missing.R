context("make_incorrect_values_missing")

listings <- read_listings() %>%
  extract_digit_variables %>%
  extract_postcode %>% 
  correct_data_types

test_that("corrects rent", {
  nr_incorrect_values <- listings %>% 
    correct_rent %>%
    filter(rent < 500 | rent > 1500) %>%
    nrow
    
  expect_equal(nr_incorrect_values, 0)
})

test_that("corrects energy consumption", {
  nr_incorrect_values <- listings %>% 
    correct_energy_consumption %>%
    filter(energy_consumption < 10) %>%
    nrow
  
  expect_equal(nr_incorrect_values, 0)
})

test_that("corrects postcode", {
  nr_incorrect_values <- listings %>% 
    correct_postcode %>%
    filter(!(postcode %in% existing_postcodes) & !(is.na(postcode))) %>%
    nrow
  
  expect_equal(nr_incorrect_values, 0)
})