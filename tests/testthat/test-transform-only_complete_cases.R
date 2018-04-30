context("only_complete_cases")

listings <- read_listings() %>%
  extract_digit_variables %>%
  extract_postcode %>% 
  only_complete_cases

test_that("any case with missing values is removed", {
  str(listings)
  expect_equal(length(complete.cases(listings)), nrow(listings))
})