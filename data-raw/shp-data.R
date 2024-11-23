
# fichier 0  SIG wilaya dairas commune
devtools::load_all(".")
# methode 1 inst/extdata
filesig <- yahiatiba::read_ext("shp/gadm41_DZA_2.shp")
wc_algeria<- read_sf(filesig)
wc_algeria<- wc_algeria %>% dplyr::select(CC_2,NAME_1,NAME_2)
usethis::use_data(wc_algeria, overwrite = TRUE)

# methode 2 locale
# wc_algeria <- read_sf(here::here("data-raw","gadm41_DZA_2.shp"))
# wc_algeria <- wc_algeria %>% dplyr::select(CC_2,NAME_1,NAME_2)
# usethis::use_data(wc_algeria, overwrite = TRUE)

# methode 3 internal
# nom <- "TIBA"
# prenom <- "REDHA"
# usethis::use_data(nom,prenom, internal = TRUE, overwrite = TRUE)

devtools::load_all(".")
yahiatiba::wc_algeria



