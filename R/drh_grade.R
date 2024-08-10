#' Title drh_grade
#'
#' @param df value
#'
#' @return value
#' @export
#'
#' @examples value
drh_grade <- function(df) {

  grd1s <- df %>%
    mutate(grade=fct_collapse(grade,"Biologiste" = bio)) %>%
    mutate(grade=fct_collapse(grade,"ATS" = ats)) %>%
    mutate(grade=fct_collapse(grade,"ISP" = isp)) %>%
    mutate(grade=fct_collapse(grade,"Administrateur" = adm)) %>%
    mutate(grade=fct_collapse(grade,"Médecin spécialiste" = msp)) %>%
    mutate(grade=fct_collapse(grade,"Médecin généraliste" = mg)) %>%
    mutate(grade=fct_collapse(grade,"Pharmacien généraliste" = phg)) %>%
    mutate(grade=fct_collapse(grade,"Dentiste généraliste" = dg)) %>%
    mutate(grade=fct_collapse(grade,"Sage Femme" = sgf)) %>%
    mutate(grade=fct_collapse(grade,"Technicien Rx"=trd)) %>%
    mutate(grade=fct_collapse(grade,"Laborantin" = lbrt)) %>%
    mutate(grade=fct_collapse(grade,"AMAR" = amar)) %>%
    mutate(grade=fct_other(grade,keep = c("Administrateur",
                                          "Biologiste",
                                          "ATS",
                                          "ISP",
                                          "Médecin spécialiste",
                                          "Médecin généraliste",
                                          "Pharmacien généraliste",
                                          "Dentiste généraliste",
                                          "Sage Femme",
                                          "AMAR",
                                          "Laborantin",
                                          "Technicien Rx"))) %>%
    mutate(grade=fct_relevel(grade,c("Administrateur",
                                     "Médecin spécialiste",
                                     "Médecin généraliste",
                                     "Pharmacien généraliste",
                                     "Dentiste généraliste",
                                     "ATS",
                                     "ISP",
                                     "Sage Femme",
                                     "AMAR",
                                     "Technicien Rx",
                                     "Biologiste",
                                     "Laborantin"))) %>%
    dplyr::select(grade,sexe) %>%
    dplyr::group_by(grade,sexe) %>%
    summarise(tot=n()) %>%
    tidyr::pivot_wider(names_from = sexe, values_from = tot) %>%
    dplyr::mutate(
      homme=replace_na(homme,0),
      femme=replace_na(femme,0),
      TOT=femme+homme,
      SR=round(homme/femme,2)) %>%
    select(grade,homme,femme,TOT,SR) %>% arrange(grade)


  grd2s <- data.frame(
    grade="Total",
    homme=sum(grd1s[,"homme"]),
    femme=sum(grd1s[,"femme"]),
    TOT=sum(grd1s[,"TOT"]),
    SR=round(sum(grd1s[,"homme"])/sum(grd1s[,"femme"]),2)
  )
  #
  grd3s <- rbind(grd1s,grd2s)
  knitr::kable(grd3s,caption = "Répartition du Personnel par Grade Simple")

}
