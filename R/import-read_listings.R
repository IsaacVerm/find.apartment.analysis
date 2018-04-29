#' @import here
read_listings <- function() {
  read.csv(file = paste0(here(), "/data/listings.csv"))
}