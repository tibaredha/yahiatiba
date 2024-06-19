wc_algeria <- read_sf(here::here("data-raw","gadm41_DZA_2.shp"))
# write data in correct format to data folder ----
usethis::use_data(wc_algeria, overwrite = TRUE)
