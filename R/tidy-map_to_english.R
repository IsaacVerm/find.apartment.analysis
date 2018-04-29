#' @import dplyr
state_to_english <- function(state_in_dutch) {
  recode(state_in_dutch,
         "Goede staat" = "good",
         "Op te frissen" = "to be renovated",
         "Uitstekende staat" = "excellent",
         "Vernieuwd" = "renovated")
}
