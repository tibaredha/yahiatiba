#' Title str.lit_wil
#'
#' @param DF value
#'
#' @return value
#' @author TIBA   Rdha, \email{tibaredha@@yahoo.fr}
#' @references \url{https://en.wikipedia.org/wiki/List_of_Crayola_crayon_colors}
#' @seealso \code{\link{brocolors}}
#' @keywords hplot
#' ...
#' @importFrom dplyr  summarise
#' @importFrom dplyr  group_by
#' @export
#'
#' @examples value
str_lit_wil <- function(DF) {

  lit1_e <- DF %>% select(WILAYA,ETA,SERVICE,UNITE,LT,LO) %>%
    dplyr::group_by(WILAYA) %>%
    dplyr::summarise(T_SERVICE=n(),T_UNITE=sum(UNITE),T_LT=sum(LT),T_LO=sum(LO)) #%>% view()
  lit2_e <- data.frame(
    WILAYA = paste0("Total: ",nrow(lit1_e)),
    T_SERVICE = sum(lit1_e[,"T_SERVICE"]),
    T_UNITE = sum(lit1_e[,"T_UNITE"]),
    T_LT = sum(lit1_e[,"T_LT"]),
    T_LO = sum(lit1_e[,"T_LO"])
  )
  lit3_e <- rbind(lit1_e,lit2_e)
  rm(lit1_e,lit2_e)
  knitr::kable(lit3_e,
               #align = "lccccrrr",
               caption = paste0(" Nbr de lit par Wilayas "))
}
