#' @import here
read_raw_listings <- function() {
  read.csv(file = paste0(here(), "/data/raw_listings.csv"), na.strings= "")
}

#' @import here
read_tidy_listings <- function() {
  load(paste0(here(), "/data/tidy_listings.RData"), .GlobalEnv)
}
