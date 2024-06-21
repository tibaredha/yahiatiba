#' Title declaration_ta
#'
#' @param DF value
#'
#' @return value
#' @export
#'
#' @examples value
declaration_ta <- function(DF) {

  mdota <- DF %>% dplyr::select(AGE,SEXE) %>%
    dplyr::mutate(AGE = dplyr::coalesce(AGE, 0)) %>%
    #drop_na() %>%
    dplyr::mutate(clage=cut(AGE,
                     c(0, 10,20,30, 40,50, 60,70, 80,90, 200),
                     include.lowest = TRUE,
                     labels = c("00-10 ans",
                                "10-20 ans",
                                "20-30 ans",
                                "30-40 ans",
                                "40-50 ans",
                                "50-60 ans",
                                "60-70 ans",
                                "70-80 ans",
                                "80-90 ans",
                                "90-100 ans"))) %>%
    dplyr::group_by(clage,SEXE) %>%
    dplyr::summarise(nbr=n()) %>%
    tidyr::pivot_wider(names_from = SEXE, values_from = nbr) %>%
    dplyr::mutate(M=tidyr::replace_na(M,0),F=tidyr::replace_na(F,0)) %>%
    dplyr::mutate(TOT=F+M,SRMF=round(M/F,2)) %>%
    dplyr::select(clage,M,F,TOT,SRMF)

  mdota1 <- data.frame(
    clage="Total",
    M=sum(mdota[,"M"]),
    F=sum(mdota[,"F"]),
    TOT=sum(mdota[,"TOT"]),
    SRMF=round(sum(mdota[,"M"])/sum(mdota[,"F"]),2)
  )
  mdota2 <- rbind(mdota,mdota1)
  knitr::kable(mdota2,align = "lcccc",caption = paste0(" Déclaration par tranche d'age et sexe "))
}
