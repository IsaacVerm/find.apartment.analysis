#' @import dplyr
correct_data_types <- function(listings) {
  numeric_variables <- c("postcode","construction_year","floors", "habitable_area", "rent", "charges", "energy_consumption")
  factor_variables <- "current_state"
  date_variables <- "availability_date"

  listings %>%
    mutate_at(numeric_variables, funs(as.numeric)) %>%
    mutate_at(factor_variables, funs(factor)) %>%
    mutate_at(date_variables, funs(as.Date))
}
