# fichier 4 MDO

# methode 1 inst/extdata

# mat base
mat0 <- yahiatiba::read_ext("mat.csv")
mat0 <- read.csv(mat0,encoding = "UTF8")

# function base
mat1 <- function(idw,wilaya,etablissement) {
  file0 <- paste0(wilaya,"/mat/",etablissement,".csv")
  file1 <- yahiatiba::read_ext(file0)
  eta0 <- read_delim(file1,
                     delim = ",",#delim = "\t",
                     escape_double = FALSE,show_col_types = FALSE,
                     trim_ws = TRUE)
  eta0 <- eta0 %>% mutate(IDW=idw,
                          WILAYA=wilaya,
                          STRUCTURE=etablissement) %>%
                   select(IDW,WILAYA,STRUCTURE,ID,NBR)
  return(eta0)
}


# wilaya de chlef
idw=2
wilaya="chlef"
eta1 <- mat1(idw,wilaya,"EHS_TENES")
eta2 <- mat1(idw,wilaya,"EPH_A_BOURAS_TENES")
eta3 <- mat1(idw,wilaya,"EPH_AIN_MERANE")
eta4 <- mat1(idw,wilaya,"EPH_CHETTIA")
eta5 <- mat1(idw,wilaya,"EPH_CHORFA")
eta6 <- mat1(idw,wilaya,"EPH_OULED_MOHAMED")
eta7 <- mat1(idw,wilaya,"EPH_SOBHA")
eta8 <- mat1(idw,wilaya,"EPH_SOEURS_BEDJ")
eta9 <- mat1(idw,wilaya,"EPH_ZIGHOUD_Y_TENES")
eta10 <- mat1(idw,wilaya,"EPSP_BENI_HAOUA")
eta11 <- mat1(idw,wilaya,"EPSP_BOUKADER")
eta12 <- mat1(idw,wilaya,"EPSP_OUED_FODDA")
eta13 <- mat1(idw,wilaya,"EPSP_OULED_FARES")
eta14 <- mat1(idw,wilaya,"EPSP_TAOUGRIT")
eta15 <- mat1(idw,wilaya,"EPSP_TENES")
wilaya_mat <- dplyr::bind_rows(eta1,
                               eta2,
                               eta3,
                               eta4,
                               eta5,
                               eta6,
                               eta7,
                               eta8,
                               eta9,
                               eta10,
                               eta11,
                               eta12,
                               eta13,
                               eta14,
                               eta15)
chlef_mat <- merge(x = wilaya_mat , y = mat0, by.x = "ID", by.y = "ID")
rm(wilaya_mat,
   eta1,
   eta2,
   eta3,
   eta4,
   eta5,
   eta6,
   eta7,
   eta8,
   eta9,
   eta10,
   eta11,
   eta12,
   eta13,
   eta14,
   eta15)
# wilaya de aindefla
idw=44
wilaya="aindefla"

eta1 <- mat1(idw,wilaya,"EPH_AIN_DEFLA")
eta2 <- mat1(idw,wilaya,"EPH_attaf")
eta3 <- mat1(idw,wilaya,"EPH_KHEMIS_MILIANA")
eta4 <- mat1(idw,wilaya,"EPH_MILIANA")
eta5 <- mat1(idw,wilaya,"EPSP_ain_lechiakhe")
eta6 <- mat1(idw,wilaya,"EPSP_BOUMADFAA")
eta7 <- mat1(idw,wilaya,"EPSP_djelida")
eta8 <- mat1(idw,wilaya,"EPSP_EL_ABADIA")
wilaya_mat <- dplyr::bind_rows(eta1,
                               eta2,
                               eta3,
                               eta4,
                               eta5,
                               eta6,
                               eta7,
                               eta8)

aindefla_mat <- merge(x = wilaya_mat , y = mat0, by.x = "ID", by.y = "ID")
rm(wilaya_mat,
   eta1,
   eta2,
   eta3,
   eta4,
   eta5,
   eta6,
   eta7,
   eta8)


# wilaya de djelfa
idw <- 17
wilaya <- "djelfa"
eta1 <- mat1(idw,wilaya,"eph_aioussera")
eta2 <- mat1(idw,wilaya,"eph_hbb")
eta3 <- mat1(idw,wilaya,"eph_djelfa")
eta4 <- mat1(idw,wilaya,"eph_messaad")
eta5 <- mat1(idw,wilaya,"eph_idrissia")
eta6 <- mat1(idw,wilaya,"eph_mixte")
eta7 <- mat1(idw,wilaya,"eph_birine")
eta8 <- mat1(idw,wilaya,"ehs_djelfa")
eta9 <- mat1(idw,wilaya,"ehs_oph")
eta10 <- mat1(idw,wilaya,"epsp_ainoussera")
eta11 <- mat1(idw,wilaya,"epsp_hbb")
eta12 <- mat1(idw,wilaya,"epsp_djelfa")
eta13 <- mat1(idw,wilaya,"epsp_messaad")
eta14 <- mat1(idw,wilaya,"epsp_guettara")
wilaya_mat <- dplyr::bind_rows(eta1,
                               eta2,
                               eta3,
                               eta4,
                               eta5,
                               eta6,
                               eta7,
                               eta8,
                               eta9,
                               eta10,
                               eta11,
                               eta12,
                               eta13,
                               eta14)

djelfa_mat <- merge(x = wilaya_mat , y = mat0, by.x = "ID", by.y = "ID")
rm(wilaya_mat,
   eta1,
   eta2,
   eta3,
   eta4,
   eta5,
   eta6,
   eta7,
   eta8,
   eta9,
   eta10,
   eta11,
   eta12,
   eta13,
   eta14)

# wilaya de msila
idw=28
wilaya="msila"

eta1 <- mat1(idw,wilaya,"ehs_me_msila")
eta2 <- mat1(idw,wilaya,"ehs_psy")
eta3 <- mat1(idw,wilaya,"eph_ain_elmalh")
eta4 <- mat1(idw,wilaya,"eph_bensrour")
eta5 <- mat1(idw,wilaya,"eph_bousaada")
eta6 <- mat1(idw,wilaya,"eph_magra")
eta7 <- mat1(idw,wilaya,"eph_msila")
eta8 <- mat1(idw,wilaya,"eph_sidi_aissa")
eta9 <- mat1(idw,wilaya,"epsp_ain_elmalh")
eta10 <- mat1(idw,wilaya,"epsp_bensrour")
eta11 <- mat1(idw,wilaya,"epsp_bousaada")
eta12 <- mat1(idw,wilaya,"epsp_magra")
eta13 <- mat1(idw,wilaya,"epsp_msila")
eta14 <- mat1(idw,wilaya,"epsp_sidi_aissa")
wilaya_mat <- dplyr::bind_rows(eta1,
                               eta2,
                               eta3,
                               eta4,
                               eta5,
                               eta6,
                               eta7,
                               eta8,
                               eta9,
                               eta10,
                               eta11,
                               eta12,
                               eta13,
                               eta14)

msila_mat <- merge(x = wilaya_mat , y = mat0, by.x = "ID", by.y = "ID")
rm(wilaya_mat,
   eta1,
   eta2,
   eta3,
   eta4,
   eta5,
   eta6,
   eta7,
   eta8,
   eta9,
   eta10,
   eta11,
   eta12,
   eta13,
   eta14)

# wilaya de laghouat
idw=3
wilaya="laghouat"
eta1 <- mat1(idw,wilaya,"ehs_aflou")
eta2 <- mat1(idw,wilaya,"ehs_laghouat")
eta3 <- mat1(idw,wilaya,"eph_aflou")
eta4 <- mat1(idw,wilaya,"eph_kasrelhirane")
eta5 <- mat1(idw,wilaya,"eph_laghouat")
eta6 <- mat1(idw,wilaya,"eph_mixte")
eta7 <- mat1(idw,wilaya,"epsp_aflou")
eta8 <- mat1(idw,wilaya,"epsp_ainmadhi")
eta9 <- mat1(idw,wilaya,"epsp_brida")
eta10 <- mat1(idw,wilaya,"epsp_gss")
eta11 <- mat1(idw,wilaya,"epsp_hassidalaa")
eta12 <- mat1(idw,wilaya,"epsp_ksarelhirane")
eta13 <- mat1(idw,wilaya,"epsp_laghouat")
wilaya_mat <- dplyr::bind_rows(eta1,
                               eta2,
                               eta3,
                               eta4,
                               eta5,
                               eta6,
                               eta7,
                               eta8,
                               eta9,
                               eta10,
                               eta11,
                               eta12,
                               eta13)

laghouat_mat <- merge(x = wilaya_mat , y = mat0, by.x = "ID", by.y = "ID")
rm(wilaya_mat,
   eta1,
   eta2,
   eta3,
   eta4,
   eta5,
   eta6,
   eta7,
   eta8,
   eta9,
   eta10,
   eta11,
   eta12,
   eta13)

mat <- dplyr::bind_rows(chlef_mat,
                        aindefla_mat,
                        djelfa_mat,
                        msila_mat,
                        laghouat_mat)
rm(chlef_mat,
   aindefla_mat,
   djelfa_mat,
   msila_mat,
   laghouat_mat)

rm(mat0,idw,wilaya)

usethis::use_data(mat, overwrite = TRUE)

rm(mat,mat1)

devtools::load_all(".")

mat <- yahiatiba::mat

view(mat)
# methode 2 locale
#mdo <- read.csv(here::here("data-raw","mdo.csv"))
#usethis::use_data(mdo1, overwrite = TRUE)

# methode 3 internal
#x <- 3
#y <- 10
#usethis::use_data(x,y, internal = TRUE)
