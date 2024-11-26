#' Title carte_w_c_pv
#'
#' @param df   df
#' @param wilaya_x wilaya_x
#'
#' @return  value
#' @export
#'
#' @examples yahiatiba::carte_w_c_pv
carte_w_c_pv <- function(df,wilaya_x) {

  # filec <- yahiatiba::read_ext_data("yahiatiba","shp/gadm41_DZA_2.shp")
  # dzc <- read_sf(filec) %>%
  #   dplyr::select(CC_2,NAME_1,NAME_2) %>%
  #   dplyr::rename("CC"= CC_2,"WILAYA"= NAME_1,"COMMUNE"= NAME_2) %>%
  #   dplyr::mutate("CC"= as.numeric(CC)) %>%
  #   dplyr::mutate(WILAYA = recode(WILAYA,
  #                                 "Médéa"="Medea",
  #                                 "Aïn Defla"="Aindefla",
  #                                 "M'Sila"="Msila")) %>%
  #
  #   dplyr::filter(WILAYA %in%  c("Chlef","Aindefla","Medea","Djelfa","Laghouat","Msila")) %>%
  dzc <- df %>%
    dplyr::filter(WILAYA == wilaya_x) %>%
    dplyr::arrange(CC)
  #unique(dzc$WILAYA)
  demographie <- yahiatiba::wdc %>%
    dplyr::filter(WILAYA == wilaya_x)

  sigf <- merge(x = dzc, y = demographie, by.x = "CC", by.y = "IDC")
  sigf <- sigf %>% dplyr::select(CC,POP,COMMUNE.x)
  #rm(filec,dzc,demographie)
  rm(dzc,demographie)

  mf_theme("candy")
  mf_shadow(sigf)
  mf_map(sigf,
         type="choro",
         var="POP",
         add = TRUE,#pal = "Blues 3",
         leg_pos = "topright",  #leg_pos = "bottomleft",
         leg_title = "Pop")
  mf_arrow()
  mf_scale(size = 5)
  mf_credits(txt = paste0("Sources: R.TIBA,DSP Djelfa,","mapsf ", packageVersion("mapsf"),"\n"))
  mf_title(paste("Wilaya de ",wilaya_x))
  #mf_annotation(sigf[1, ],txt = "wilaya")
  mf_label(x = sigf,var = "COMMUNE.x",cex = 0.5,col= "black", halo = TRUE,overlap = FALSE,lines = FALSE)
}

