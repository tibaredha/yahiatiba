#' @keywords internal
"_PACKAGE"

## usethis namespace: start
## usethis namespace: end
NULL


#' Points aleatoires
#'
#' Coordonnes en deux dimensions de 10 points aleatoires.
#'
#' @format Une matrice contenant 10 points designes par les
#' coordonnees suivantes.
#' \describe{
#' \item{\code{X}}{ coordonnee en X }
#' \item{\code{Y}}{ coordonnee en Y }
#' }
#' @examples
#' dist_manhattan(point1 = points[4, ], point2 = points[8, ])
#'
#' # Note : Ces donnees ont ete crees par les instructions suivantes
#' points <- matrix(sample(1:10, size = 20, replace = TRUE),
#' nrow = 10, ncol = 2)
#' colnames(points) <- c("X", "Y")
"mdo"
