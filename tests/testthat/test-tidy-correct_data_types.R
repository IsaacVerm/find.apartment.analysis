context("correct_data_types")

listings <- read_listings() %>%
  extract_digit_variables %>%
  extract_postcode %>%
  correct_data_types

test_that("some variables are numeric", {
  numeric_variables <- c("postcode","construction_year","floors", "habitable_area", "rent", "charges", "energy_consumption")

  nr_of_numeric_variables <- listings %>%
    select(one_of(numeric_variables)) %>%
    summarise_all(typeof) %>%
    gather %>%
    pull(value) %>%
    table

  expect_equal(first(nr_of_numeric_variables), length(numeric_variables))
})

test_that("current_state is a factor", {
  expect_is(listings$current_state, "factor")
})

test_that("availability_date is a date", {
  expect_is(listings$availability_date, "Date")
})
