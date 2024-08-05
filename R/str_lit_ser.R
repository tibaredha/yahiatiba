#' Title str.lit_ser
#'
#' @param DF  value
#'
#' @return value
#' @export
#'
#' @examples value
str_lit_ser <- function(DF) {

  lit1_s <- DF %>% select(ETA,SERVICE,UNITE,LT,LO) %>%
    group_by(SERVICE) %>%
    summarise(T_SERVICE=n(),T_UNITE=sum(UNITE),T_LT=sum(LT),T_LO=sum(LO)) #%>% view()
  lit2_s <- data.frame(
    SERVICE = paste0("Total: ",nrow(lit1_s)),
    T_SERVICE = sum(lit1_s[,"T_SERVICE"]),
    T_UNITE = sum(lit1_s[,"T_UNITE"]),
    T_LT = sum(lit1_s[,"T_LT"]),
    T_LO = sum(lit1_s[,"T_LO"]))
  lit3_s <- rbind(lit1_s,lit2_s)
  rm(lit1_s,lit2_s)
  knitr::kable(lit3_s,
               #align = "lccccrrr",
               caption = paste0(" Nbr de lit par service "))
}
