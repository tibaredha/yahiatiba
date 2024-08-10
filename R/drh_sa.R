#' Title drh_sa
#'
#' @param drh  value
#' @param wilaya value
#'
#' @return value
#' @export
#'
#' @examples value
drh_sa <- function(drh,wilaya) {

  drh %>%
    ggplot(aes(structure,age,fill=structure))+
    geom_boxplot(show.legend = FALSE,
                 outlier.shape = NA)+ylim(20,70)+
    coord_flip()+
    labs(title = "Répartition du Personnel par Structure et Age",
         subtitle = wilaya,
         x = "Structure",
         y = "Age ",
         caption = "Dr TIBA")

}
