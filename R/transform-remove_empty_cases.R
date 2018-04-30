indices_empty_cases <- function(listings) {
  ind_empty_cases <- which(rowSums(!is.na(listings)) == 0)
}

#' @import dplyr
remove_empty_cases <- function(listings) {
  listings <- listings %>%
    slice(-indices_empty_cases(listings))
}
