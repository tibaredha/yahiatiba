mdo <- read.csv(here::here("data-raw","mdo.csv"))
# write data in correct format to data folder ----
usethis::use_data(mdo, overwrite = TRUE)

x <- 3
y <- 10
usethis::use_data(x,y, internal = TRUE)
