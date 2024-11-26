#' Title  carte_w_c_p
#'
#' @param variables  df
#' @param wilaya  wilaya
#'
#' @return  carte
#' @export
#'
#' @examples yahiatiba::carte_w_c_p (variables,wilaya)
carte_w_c_p <- function(df,wilaya) {
  wilayashp <- df
  mf_theme("candy")
  mf_shadow(wilayashp)
  mf_map(wilayashp,
         type="choro",
         var="POP",
         add = TRUE,#pal = "Blues 3",
         leg_pos = "bottomleft2",
         leg_title = "Pop")
  mf_arrow()
  mf_scale(size = 5)
  mf_credits(txt = paste0("Sources: R.TIBA,DSP Djelfa,","mapsf ", packageVersion("mapsf"),"\n"))
  mf_title(paste("Wilaya de ",wilaya))
  #mf_annotation(wilayashp[1, ],txt = wilaya[nbr])
  mf_label(x = wilayashp,var = "COMMUNE.x",cex = 0.5,col= "black",halo = TRUE,overlap = FALSE, lines = FALSE)
}
