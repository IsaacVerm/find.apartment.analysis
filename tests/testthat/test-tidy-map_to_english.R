context("state_to_english")

listings <- read_listings()
state_in_english <- state_to_english(listings$current_state)

test_that("returns state of building in English", {
  expect_equal(levels(state_in_english), c("", "good","to be renovated", "excellent", "renovated"))
})