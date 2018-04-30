#' @import here
save_tidy_listings <- function(tidy_listings) {
  save(tidy_listings, file = paste0(here(), "/data/tidy_listings.RData"))
}
