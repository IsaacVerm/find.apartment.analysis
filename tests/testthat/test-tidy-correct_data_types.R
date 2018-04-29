context("correct_data_types")

listings <- read_listings()

test_that("some variables are numeric", {
  numeric_variables <- c("postcode","construction_year","floors", "habitable_area", "rent", "charges", "energy_consumption")
  
  parsed_listings <- correct_data_types(listings)
  str(parsed_listings)
})