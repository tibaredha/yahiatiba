#' Title declaration_ta1
#'
#' @param DF value
#' @param TO value
#' @param BY value
#'
#' @return value
#' @export
#'
#' @examples value
declaration_ta1 <- function(DF,TO,BY){

  data <- DF %>% dplyr::select(AGE,SEXE)
  textlab<-c()
  for(i in 0:19){textlab[i+1]<-paste("]",as.character(i*5),",",as.character((i+1)*5),"]",sep = "")}
  data$catAge <- NULL
  catAge<-cut(data$AGE,breaks = seq(from=-0.01, to=100,by=5),labels = textlab)
  data<-cbind(data,catAge)
  dataPyramide<- as.data.frame(table(data$catAge,data$SEXE))
  dataP<-data.frame(dataPyramide[21:40,3],dataPyramide[1:20,3],dataPyramide[1:20,1])
  pyramid::pyramid( data = dataP,
           main = "Pyramide des âges des Déclarations",
           Laxis = seq(from=0,to=TO,by=BY),
           Llab = "Masculin",
           Clab = "Ages",
           Rlab = "Feminin",
           Lcol = "blue",
           Rcol = "red",
           Csize = 0.8,
           Cgap = 0.3)
}
