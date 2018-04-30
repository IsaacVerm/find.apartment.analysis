context("remove_empty_cases")

listings <- read_raw_listings() %>%
  extract_digit_variables %>%
  extract_postcode%>%
  remove_empty_cases

test_that("any case with only missing values is removed", {
  expect_length(indices_empty_cases(listings), 0)
})
