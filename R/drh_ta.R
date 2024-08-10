#' Title drh_ta
#'
#' @param df  value
#' @param wilaya value
#'
#' @return value
#' @export
#'
#' @examples value
drh_ta <- function(df,wilaya) {

  df %>%
    dplyr::select(age,sexe) %>%
    ggplot(aes(x = age)) +
    geom_histogram(binwidth = 5, color = "white",aes(fill = sexe))+
    labs(title = "Répartition du personnel par tranches d'ages et sexe",
         subtitle = wilaya,
         x = "Age",
         y = "Total",
         caption = "Dr TIBA")
}
