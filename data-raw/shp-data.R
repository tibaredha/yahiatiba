wc_algeria <- read_sf(here::here("data-raw","gadm41_DZA_2.shp"))
wc_algeria <- wc_algeria %>% dplyr::select(CC_2,NAME_1,NAME_2)
# write data in correct format to data folder ----
usethis::use_data(wc_algeria, overwrite = TRUE)
