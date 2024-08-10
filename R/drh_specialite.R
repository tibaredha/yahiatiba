#' Title drh_specialite
#'
#' @param drh  value
#'
#' @return value
#' @export
#'
#' @examples value
drh_specialite <- function(drh) {
  spe1 <- drh %>%
    select(grade,specialité,sexe) %>%
    mutate(grade=fct_collapse(grade,
                              "Praticien spécialiste"=c(
                                "Praticien spécialiste assistant étrangé",
                                "Praticien spécialiste en chef",
                                "Praticien spécialiste principal de sante publique",
                                "Praticien spécialiste assistant de sante publique"))) %>%
    dplyr::filter(grade=="Praticien spécialiste") %>%
    group_by(specialité,sexe) %>%
    summarise(tot=n()) %>%
    tidyr::pivot_wider(names_from = sexe, values_from = tot) %>%
    dplyr::mutate(homme=replace_na(homme,0),femme=replace_na(femme,0),TOT=femme+homme)%>%
    select(specialité,homme,femme,TOT) %>%
    arrange(specialité)


  spe2 <- data.frame(
    specialité="Total",
    homme=sum(spe1[,"homme"]),
    femme=sum(spe1[,"femme"]),
    TOT=sum(spe1[,"TOT"])
  )
  spe3 <- rbind(spe1,spe2)
  knitr::kable(spe3)
}
