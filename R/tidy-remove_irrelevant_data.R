#' @import stringr
extract_digits <- function(variable_with_text, regex = "\\d+") {
  str_extract(variable_with_text, regex)
}

extract_postcode <- function(address) {
  extract_digits(address, "\\d{4}")
}
