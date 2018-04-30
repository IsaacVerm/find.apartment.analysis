context("add_variables")

listings <- read_raw_listings() %>%
  extract_digit_variables %>% 
  extract_postcode %>% 
  state_to_english %>% 
  correct_data_types %>% 
  make_incorrect_values_missing # completely tidied state

test_that("add_muncipality", {
  muncipality <- listings %>%
    add_muncipality %>% 
    pull(muncipality)

  expect_is(muncipality, "factor")
})