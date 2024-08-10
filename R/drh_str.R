#' Title drh_str
#'
#' @param df value
#'
#' @return value
#' @export
#'
#' @examples value
drh_str <- function(df) {

  str1 <- df %>%
    select(structure,sexe,age) %>%
    group_by(structure,sexe) %>%
    summarise(tot=n()) %>%
    # ungroup() %>%
    tidyr::pivot_wider(names_from = sexe, values_from = tot) %>%
    dplyr::mutate(TOT=femme+homme,
                  SR=round(homme/femme,2)) %>% #View()
    select(structure,homme,femme,TOT,SR) %>%
    arrange(TOT)
  str2 <- data.frame(
    structure="Total",
    homme=sum(str1[,"homme"]),
    femme=sum(str1[,"femme"]),
    TOT=sum(str1[,"TOT"]),
    SR=round(sum(str1[,"homme"])/sum(str1[,"femme"]),2)
  )
  str3 <- rbind(str1,str2)
  knitr::kable(str3,caption = paste0(" Répartition par Structure et Sexe"))

}
