context("read_listings")

listings <- read_listings()

test_that("reads as dataframe", {
  expect_is(listings, "data.frame")
})

test_that("contains correct column names", {
  expect_named(listings, c("address","availability_date","construction_year","floors","current_state","habitable_area",
                           "rent","charges","energy_consumption"))
})

test_that("contains rows", {
  expect_gt(nrow(listings), 0)
})
