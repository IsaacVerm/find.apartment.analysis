## ----setup, include=FALSE------------------------------------------------

library(knitr)

opts_chunk$set(echo=TRUE,
               warning=FALSE,
               message=FALSE,
               cache=FALSE)

devtools::load_all(here::here())


## ------------------------------------------------------------------------

listings <- read_raw_listings()


