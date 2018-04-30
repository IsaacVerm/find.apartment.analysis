#' @import dplyr
state_to_english <- function(listings) {
  listings %>%
    mutate(current_state = recode(current_state,
                                  "Goede staat" = "good",
                                  "Op te frissen" = "to be renovated",
                                  "Uitstekende staat" = "excellent",
                                  "Vernieuwd" = "renovated"))
}
