#' mat creance
#'
#' @param wil value
#' @param creance value
#'
#' @return value
#' @export
#'
#' @examples mat_creance (wil,creance)
mat_creance <- function(wil,creance) {

  wilaya_creance0 <- creance %>%
    dplyr::filter(WILAYA==wil) %>%
    select(STRUCTURE,EXERCICE,FOURNISSEUR,MONTANT) %>%
    dplyr::filter(MONTANT>0) %>%
    dplyr::arrange(EXERCICE)

  wilaya_creance1 <- data.frame(
    STRUCTURE="Total créances",
    EXERCICE="",
    FOURNISSEUR="",
    MONTANT=sum(wilaya_creance0[,"MONTANT"])
  )
  wilaya_creance2 <- rbind(wilaya_creance0,wilaya_creance1)
  knitr::kable(wilaya_creance2,caption = paste0(" Créances Wilaya : ",wilaya))

}
