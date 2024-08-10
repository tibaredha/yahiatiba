#' Title drh_specialiste_str
#'
#' @param drh value
#'
#' @return value
#' @export
#'
#' @examples value
drh_specialiste_str <- function(drh) {


  spceta1 <- drh %>%
    select(structure,grade,specialité,sexe) %>%
    dplyr::mutate(structure=recode(structure,
                                   "EPH Birine"="BIR",
                                   "EPH Ain Oussera"="AO",
                                   "EPH Hassi Bahbah"="HBB",
                                   "EPH Djelfa"="DJE",
                                   "EHS Kaki Mohamed"="KM",
                                   "EPH Hathat Boubakeur"="HB",
                                   "EH Ophtalmo"="EHO",
                                   "EPH Idrissia"="IDR",
                                   "EPH Messaad"="MES")) %>%
    dplyr::mutate(structure=as.factor(structure)) %>%
    dplyr::filter(structure %in% c("BIR",
                                   "AO",
                                   "HBB",
                                   "DJE",
                                   "HB",
                                   "MES",
                                   "IDR",
                                   "KM",
                                   "EHO"
    )) %>%
    #dplyr::filter(structure %in% str_x) %>%
    mutate(grade=fct_collapse(grade,
                              "Praticien spécialiste"=c(
                                "Praticien spécialiste assistant",
                                "Praticien spécialiste en chef",
                                "Praticien spécialiste principal de sante publique",
                                "Praticien spécialiste assistant de sante publique"))) %>%
    dplyr::filter(grade=="Praticien spécialiste") %>%
    group_by(specialité,structure) %>%
    summarise(tot=n()) %>%
    tidyr::pivot_wider(names_from = structure, values_from = tot) %>%
    replace(is.na(.), 0) %>%
    mutate(TOT=DJE+HB+AO+BIR+HBB+IDR+KM+MES) #%>% knitr::kable()

  spceta2 <- data.frame(
    specialité ="Total",
    BIR=sum(spceta1[,"BIR"]),
    AO=sum(spceta1[,"AO"]),
    HBB=sum(spceta1[,"HBB"]),
    DJE=sum(spceta1[,"DJE"]),
    HB=sum(spceta1[,"HB"]),
    MES=sum(spceta1[,"MES"]),
    IDR=sum(spceta1[,"IDR"]),
    KM=sum(spceta1[,"KM"]),
    #EHO=sum(spceta1[,"EHO"]), ??? prbleme
    TOT=sum(spceta1[,"TOT"])
  )

  spceta3 <- rbind(spceta1,spceta2)
  knitr::kable(spceta3)

}
