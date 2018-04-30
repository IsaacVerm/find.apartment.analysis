context("state_to_english")

listings <- read_raw_listings() %>%
  state_to_english

test_that("returns state of building in English", {
  expect_equal(levels(listings$current_state), c("good","to be renovated", "excellent", "renovated"))
})
