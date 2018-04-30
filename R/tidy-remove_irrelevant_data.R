#' @import stringr
extract_digits <- function(raw_variable, regex = "\\d+") {
  as.numeric(str_extract(raw_variable, regex))
}

#' @import dplyr
#' @import purrr
extract_digit_variables <- function(listings,
                                    digit_variables = c("habitable_area","rent","charges","energy_consumption")) {
  df_digit_variables <- digit_variables %>%
    map(~extract_digits(raw_variable = listings[[.]])) %>%
    as.data.frame %>%
    setNames(digit_variables)

  cbind(select(listings, -one_of(digit_variables)),
        df_digit_variables)
}

#' @import dplyr
extract_postcode <- function(listings) {
  listings %>%
    mutate(postcode = extract_digits(raw_variable = listings[["address"]],
                                     regex = "\\d{4}")) %>%
    select(-address)
}
