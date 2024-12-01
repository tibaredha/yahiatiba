
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



# 0 load packages ----
devtools::load_all(".")
# 1 sig algerie ----
shp_dz <- yahiatiba::read_ext("shp/gadm41_DZA_0.shp")
shp_dz <- read_sf(shp_dz)
usethis::use_data(shp_dz, overwrite = TRUE)
# 2 sig wilaya algerie
shp_dzw <- yahiatiba::read_ext("shp/gadm41_DZA_1.shp")
shp_dzw <- read_sf(shp_dzw) %>%
  dplyr::select(CC_1,NAME_1) %>%
  dplyr::rename("CW"= CC_1,"WILAYA"= NAME_1) %>%
  dplyr::mutate("CW"= as.numeric(CW)) %>%
  dplyr::mutate(WILAYA = recode(WILAYA,
                                "Médéa"="Medea",
                                "Aïn Defla"="Aindefla",
                                "M'Sila"="Msila")) %>%
  dplyr::arrange(CW)
usethis::use_data(shp_dzw, overwrite = TRUE)
# 3 sig commune algerie
shp_dzc <- yahiatiba::read_ext("shp/gadm41_DZA_2.shp")
shp_dzc <- read_sf(shp_dzc) %>%
  dplyr::select(CC_2,NAME_1,NAME_2) %>%
  dplyr::rename("CC"= CC_2,"WILAYA"= NAME_1,"COMMUNE"= NAME_2) %>%
  dplyr::mutate("CC"= as.numeric(CC)) %>%
  dplyr::mutate(WILAYA = recode(WILAYA,
                                "Médéa"="Medea",
                                "Aïn Defla"="Aindefla",
                                "M'Sila"="Msila")) %>%
  dplyr::arrange(CC)
usethis::use_data(shp_dzc, overwrite = TRUE)
# 4 sig region medea wilaya ----
shp_dzrw <- yahiatiba::read_ext("shp/gadm41_DZA_1.shp")
shp_dzrw <- read_sf(shp_dzrw) %>%
  dplyr::select(CC_1,NAME_1) %>%
  dplyr::rename("CW"= CC_1,"WILAYA"= NAME_1) %>%
  dplyr::mutate("CW"= as.numeric(CW)) %>%
  dplyr::mutate(WILAYA = recode(WILAYA,
                                "Médéa"="Medea",
                                "Aïn Defla"="Aindefla",
                                "M'Sila"="Msila")) %>%
  dplyr::filter(WILAYA %in%  c("Chlef","Aindefla","Medea","Djelfa","Laghouat","Msila"))
usethis::use_data(shp_dzrw, overwrite = TRUE)

# 5 sig region medea commune ----
shp_dzrc <- yahiatiba::read_ext("shp/gadm41_DZA_2.shp")
shp_dzrc <- read_sf(shp_dzrc)
shp_dzrc <- shp_dzrc %>% dplyr::select(CC_2,NAME_1,NAME_2) %>%
  dplyr::rename("CC"= CC_2,"WILAYA"= NAME_1,"COMMUNE"= NAME_2) %>%
  dplyr::mutate("CC"= as.numeric(CC)) %>%
  dplyr::mutate(WILAYA = recode(WILAYA,
                                "Médéa"="Medea",
                                "Aïn Defla"="Aindefla",
                                "M'Sila"="Msila")) %>%
  dplyr::filter(WILAYA %in%  c("Chlef","Aindefla","Medea","Djelfa","Laghouat","Msila"))
usethis::use_data(shp_dzrc, overwrite = TRUE)

# 5 sig region medea commune  bis ----
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

# 6 exemple ----
devtools::load_all(".")

?yahiatiba::shp_dz
yahiatiba::shp_dz

?yahiatiba::shp_dzw
yahiatiba::shp_dzw
?yahiatiba::shp_dzc
yahiatiba::shp_dzc

?yahiatiba::shp_dzrw
yahiatiba::shp_dzrw
?yahiatiba::shp_dzrc
yahiatiba::shp_dzrc









