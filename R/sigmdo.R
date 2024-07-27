#' Title sigmdo
#'
#' @param wc_algeria value
#' @param df value
#'
#' @return value
#' @export
#'
#' @examples value
sigmdo <- function(wc_algeria,df) {

  br <- df %>% dplyr::select(IDC) %>%
    dplyr::group_by(IDC) %>%
    dplyr::summarise(nbr=n()) %>%
    dplyr::rename("CC_2"="IDC") %>%
    dplyr::mutate(CC_2=as.character(CC_2))

  mdo_c_djelfa <- dplyr::left_join(wc_algeria, br, by='CC_2')
  #library(viridis) a activer avec viridis
  library(sf)
  cdjelfamdo <- mdo_c_djelfa %>%
    dplyr::filter(NAME_1=="Djelfa") %>%
    dplyr::select(NAME_1,NAME_2,CC_2,nbr) #%>% mutate(nbr = log(nbr))
  ggplot2::ggplot()+
    ggplot2::geom_sf(data=cdjelfamdo,aes(fill= nbr), color = "black", lwd = 0.05) +
    ggplot2::geom_sf_text(data = cdjelfamdo, aes(label = nbr),size=1.5,family="sans")+
    #scale_fill_viridis_c(option = "magma", name = "Nbr cas",direction = -1) +
    #scale_fill_viridis(direction = -1) +
    #scale_fill_gradient2(midpoint = 275) +
    #scale_fill_viridis_c(option = "D")+
    #scale_fill_gradient(low = "#56B1F7", high = "#132B43")+
    ggplot2::scale_fill_gradient(low = "seashell", high = "tan3")+

    ggthemes::theme_map() +
    ggplot2::theme(legend.direction = "vertical",legend.position="right") +
    #legend.direction="horizontal"
    #scale_fill_viridis_d(direction = -1)+
    ggplot2::labs(title = "Répartition des cas par communes de résidence",
         subtitle = "Wilaya de Djelfa",
         caption = "Dr Rédha TIBA")+
    ggplot2::coord_sf(crs = "+proj=robin")

}
