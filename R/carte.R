#' carte
#'
#' `r lifecycle::badge("stable")`
#'
#' @return carte djelfa
#' @export
#'
#' @examples carte
carte <- function() {
  #pkgtiba::read_ext()
  #file <- yahiatiba::read_ext("djelfa.shp")
  file <- yahiatiba::read_ext_data("yahiatiba","djelfa.shp")

  #require package s2  wk
  # library(sf)
  # library(mapsf)
  djelfa <- sf::read_sf(file)
  mapsf::mf_theme("candy")                                        # select a theme
  mapsf::mf_shadow(djelfa)                                        # display the shadow of a polygon layer
  mapsf::mf_map(djelfa,type="choro",var="POP",add = TRUE)         # display polygons
  mapsf::mf_arrow()                                               # display north arrow
  mapsf::mf_scale(size = 5)                                       # display scale bar
  mapsf::mf_credits(txt = "R. TIBA, 2022 - mapsf 0.1.1 \n ")      # display credits
  mapsf::mf_title("Wilaya de djelfa")                             # display title
  mapsf::mf_annotation(djelfa[5, ],txt = "   Ain-oussera")        # display an annotation
  # plot labels
  # mapsf::mf_label(
  #   x = djelfa,
  #   var = "COMMUNE",
  #   col = "black",
  #   cex = 0.7,
  #   font = 4,
  #   halo = TRUE,
  #   bg = "white",
  #   r = 0.1,
  #   overlap = FALSE,
  #   lines = FALSE
  # )

}



# library(mapsf)
# file <- yahiatiba::read_ext_data("yahiatiba","djelfa.shp")
# djelfa <- sf::read_sf(file)
# djelfa$POPDENS <- 1e6 * djelfa$POP / sf::st_area(djelfa)
# mf_theme("green")
# mf_map(
#   x = djelfa,
#   var = "POPDENS",
#   type = "choro",
#   breaks = "geom",
#   nbreaks = 5,
#   pal = "Greens",
#   border = "white",
#   lwd = 0.5,
#   leg_pos = "topright",
#   leg_title = "Population Density\n(people per km2)"
# )
# mf_layout(
#   title = "Population Distribution in Djelfa",
#   credits = paste0(
#     "Sources: DSP Djelfa, 2024\n",
#     "mapsf ",
#     packageVersion("mapsf")
#   )
# )
