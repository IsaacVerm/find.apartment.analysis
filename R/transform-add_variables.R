#' @import here
read_muncipalities_by_postcode <- function() {
  muncipalities_by_postcode <- read.csv(file = paste0(here(), "/data/muncipalities_by_postcode.csv"), sep = ";")

  return(muncipalities_by_postcode)
}

#' @import dplyr
add_muncipality <- function(listings) {
  muncipalities_by_postcode <- read_muncipalities_by_postcode()

  listings <- muncipalities_by_postcode %>%
    mutate(postcode = factor(postcode)) %>%
    right_join(listings, by = "postcode") %>%
    mutate(postcode = factor(postcode)) # avoid automatic conversion factor to character for listings

}

#' @import dplyr
add_total_cost <- function(listings) {
  listings %>%
    mutate(total_cost = rent + charges)
}

add_price_per_square_m <- function(listings) {
  listings %>%
    mutate(price_per_square_m = total_cost / habitable_area)
}
