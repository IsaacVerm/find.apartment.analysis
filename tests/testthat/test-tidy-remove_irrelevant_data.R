listings <- read_raw_listings()

context("extract_digits")

test_that("extracts digits from variables with text", {
  habitable_area <- extract_digits(listings$habitable_area)

  expect_is(habitable_area, "numeric")
})

context("extract_digit_variables")

digit_variables <- c("habitable_area","rent","charges","energy_consumption")
extracted_digits <- extract_digit_variables(listings, digit_variables)

test_that("returns dataframe", {
  expect_is(extracted_digits, "data.frame")
})

test_that("contains the same variables as the input listings", {
  expect_equal(names(listings), names(extracted_digits))
})

test_that("all digit variables are numeric", {
  type_of_variables <- extracted_digits %>%
    select(one_of(digit_variables)) %>%
    summarise_all(typeof) %>%
    gather %>%
    pull(value) %>%
    table

  expect_named(type_of_variables, c("double"))
})

context("extract_postcode")

listings_with_postcode <- extract_postcode(listings)

test_that("returns dataframe", {
  expect_is(listings_with_postcode, "data.frame")
})

test_that("contains the same variables as the input listings except for postcode", {
  expect_equal(names(listings),
               recode(names(extracted_digits), "postcode" = "address"))
})

test_that("postcode is 4 digits", {
  postcode <- listings_with_postcode %>%
    na.omit %>%
    pull(postcode) %>%
    as.character

  expect_match(postcode, "^\\d{4}$")
})



