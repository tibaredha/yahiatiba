#' Title str.ser_lit
#'
#' @param DF value
#' @param XSERVICE  value
#'
#' @return value
#' @export
#'
#' @examples value
str_ser_lit <- function(DF,XSERVICE) {

  ser_l1 <- DF %>% select(ETA,SERVICE,UNITE,LT,LO) %>%
    dplyr::filter(SERVICE==XSERVICE) %>%
    group_by(ETA) %>%
    summarise(T_SERVICE=n(),T_UNITE=sum(UNITE),T_LT=sum(LT),T_LO=sum(LO)) %>%
    select(ETA,T_UNITE,T_LT,T_LO) #%>%view()

  ser_l2 <- data.frame(
    ETA = paste0("Total: ",nrow(ser_l1)),
    T_UNITE = sum(ser_l1[,"T_UNITE"]),
    T_LT = sum(ser_l1[,"T_LT"]),
    T_LO = sum(ser_l1[,"T_LO"]))

  ser_l3 <- rbind(ser_l1,ser_l2)
  rm(ser_l1,ser_l2)
  knitr::kable(ser_l3,
               #align = "lccccrrr",
               caption = paste0(" Nbr de lit par service : ",XSERVICE))
}
