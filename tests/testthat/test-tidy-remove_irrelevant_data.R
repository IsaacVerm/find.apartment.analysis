context("remove_irrelevant_data")

listings <- read_listings()
postcode <- extract_postcode(listings$address)

test_that("extract_postcode", {
  expect_match(postcode[!is.na(postcode)], "^\\d{4}$")
})

test_that("postcode length is the same as address length", {
  expect_equal(length(postcode), length(listings$address))
})

test_that("extract_digits", {
  digit_variables <- c("habitable_area","rent","charges","energy_consumption")
  
  lapply(X = digit_variables,
         FUN = function(var) {
           digits = extract_digits(variable_with_text = listings[[var]])
           expect_match(digits[!is.na(digits)], "^\\d+$")
         })
})

