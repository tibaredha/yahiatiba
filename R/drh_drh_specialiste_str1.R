#' Title drh_specialiste_str1
#'
#' @param drh value
#'
#' @return value
#' @export
#'
#' @examples value
drh_specialiste_str1 <- function(drh) {

  drh %>%
    select(structure,grade,specialité,sexe) %>%
    dplyr::mutate(structure=recode(structure,
                                   "EPSP Ain Ouassara"="AO",
                                   "EPSP Hassi Bahbah"="HBB",
                                   "EPSP Djelfa"="DJE",
                                   "EPSP Messaad"="MES",
                                   "EPSP Guettara"="GUE")) %>%
    dplyr::mutate(structure=as.factor(structure)) %>%
    dplyr::filter(structure %in% c("AO",
                                   "HBB",
                                   "DJE",
                                   "MES",
                                   "GUE")) %>%
    mutate(grade=fct_collapse(grade,
                              "Praticien spécialiste"=c(
                                "Praticien spécialiste assistant",
                                "Praticien spécialiste en chef",
                                "Praticien spécialiste principal de sante publique",
                                "Praticien spécialiste assistant de sante publique"))) %>%
    dplyr::filter(grade=="Praticien spécialiste") %>%
    dplyr::mutate(specialité=recode(specialité,
                                   "Physiologie Clinique et Exploration Fonctionnelle Cardio Respiratoire de l'exercice"="Physiologie Clinique et Exploration Fonctionnelle")) %>%
    group_by(specialité,structure) %>%
    summarise(tot=n()) %>%
    tidyr::pivot_wider(names_from = structure, values_from = tot) %>%
    replace(is.na(.), 0) %>%
    mutate(TOT=AO+HBB+DJE+MES) %>%
    knitr::kable()

}

