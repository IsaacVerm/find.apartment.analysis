#' @import stringr
extract_digits <- function(raw_variable, regex = "\\d+") {
  as.numeric(str_extract(raw_variable, regex))
}

#' @import purrr
extract_digit_variables <- function(listings, digit_variables) {
  digit_variables %>%
    map(~extract_digits(raw_variable = listings[[.]])) %>%
    as.data.frame %>%
    setNames(digit_variables)
}

#' #' @import dplyr
extract_postcode <- function(listings) {
    extract_digits(raw_variable = listings[["address"]],
                                        regex = "\\d{4}") %>%
    as.data.frame %>%
    setNames("postcode")
}
