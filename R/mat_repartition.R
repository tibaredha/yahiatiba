#' mat_repartition
#'
#' @param mat value
#' @param wil value
#' @param str value
#'
#' @return value
#' @export
#'
#' @examples mat_repartition (mat,wil,str)
mat_repartition <- function(mat,wil,str) {

  mat0 <- mat %>%
    select(WILAYA,STRUCTURE,ID,DESIGNATION,NBR) %>%
    dplyr::filter(WILAYA==wil) %>%
    dplyr::filter(STRUCTURE==str) %>%
    arrange(DESIGNATION) %>%
    select(ID,DESIGNATION,NBR) #%>% View()

  mat1 <- data.frame(
    ID="",
    DESIGNATION="TOTAL",
    NBR=sum(mat0[,"NBR"])
  )

  mat2 <- rbind(mat0,mat1)

  return(mat2)
}

# wil <- "chlef"
# str <- "EHS_TENES"
# glimpse(mat)
#
# mat_repartition (mat,wil,str)
#


