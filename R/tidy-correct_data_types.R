#' @import dplyr
correct_data_types <- function(listings) {
  numeric_variables <- c("construction_year","floors", "habitable_area", "rent", "charges", "energy_consumption")
  factor_variables <- c("current_state","postcode")
  date_variables <- "availability_date"

  listings %>%
    mutate_at(numeric_variables, funs(as.numeric)) %>%
    mutate_at(factor_variables, funs(factor)) %>%
    mutate_at(date_variables, funs(as.Date(., format = "%d/%m/%Y")))
}
