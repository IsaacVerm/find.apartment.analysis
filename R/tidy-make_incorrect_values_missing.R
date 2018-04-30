existing_postcodes <- c(1000,1020,1030,1040,1050,1060,1070,1080,1081,1082,1083,1090,1120,
                        1130,1140,1150,1160,1170,1180,1190,1930,1200,1210)

#' @import dplyr
make_incorrect_values_missing <- function(listings) {
  listings %>% 
    correct_rent %>% 
    correct_energy_consumption %>% 
    correct_postcode
}

correct_rent <- function(listings) {
  rent <- listings$rent
  listings$rent[rent < 500 | rent > 1500] <- NA
  
  return(listings)
}

correct_energy_consumption <- function(listings) {
  energy_consumption <- listings$energy_consumption
  listings$energy_consumption[energy_consumption < 10] <- NA
  
  return(listings)
}

correct_postcode <- function(listings) {
  postcode <- listings$postcode
  listings$postcode[!(postcode %in% existing_postcodes)] <- NA
  
  return(listings)
}

