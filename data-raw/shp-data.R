
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

filesig1 <- yahiatiba::read_ext("shp/gadm41_DZA_2.shp")
wc_region <- read_sf(filesig1)
wc_region <-wc_region %>% dplyr::select(CC_2,NAME_1,NAME_2) %>%
                     dplyr::rename("CC"= CC_2,"WILAYA"= NAME_1,"COMMUNE"= NAME_2) %>%
                     dplyr::mutate("CC"= as.numeric(CC)) %>%
                     dplyr::mutate(WILAYA = recode(WILAYA,
                                                   "Médéa"="Medea",
                                                   "Aïn Defla"="Aindefla",
                                                   "M'Sila"="Msila")) %>%
                     dplyr::filter(WILAYA %in%  c("Chlef","Aindefla","Medea","Djelfa","Laghouat","Msila"))
usethis::use_data(wc_region, overwrite = TRUE)
devtools::load_all(".")
yahiatiba::wc_region



