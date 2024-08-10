#' Title drh_grade1
#'
#' @param drh  value
#' @param wilaya  value
#'
#' @return value
#' @export
#'
#' @examples value
drh_grade1 <- function(drh,wilaya) {

  drh %>%
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
    #dplyr::mutate(grade=as.factor(grade)) %>%
    dplyr::group_by(grade,sexe) %>%
    summarise(tot=n()) %>%
    tidyr::pivot_wider(names_from = sexe, values_from = tot) %>%
    dplyr::mutate(
      homme=replace_na(homme,0),
      femme=replace_na(femme,0),
      TOT=femme+homme) %>%
    select(grade,homme,femme,TOT) %>%
    arrange(grade)%>%
    #ggplot(aes(TOT,grade)) +
    ggplot(aes(y =  fct_rev(fct_reorder(grade, TOT)), x = TOT)) +
    geom_col(just = 0.8, fill = 4)+
    labs(title = "Répartition du Personnel par Grade",
         subtitle = wilaya,
         x = "Total",
         y = "Grade",
         caption = "Dr TIBA")

}
