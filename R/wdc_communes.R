#' Title wdc_communes
#'
#' @param df  df
#' @param variables wilaya
#'
#' @return  table
#' @export
#'
#' @examples yahiatiba::wdc_communes(wdc,"Djelfa")
wdc_communes <- function(df,variables) {
  communepop <- df %>%
    dplyr::select(WILAYA,COMMUNE,DAIRA,POP,SUP) %>%
    dplyr::filter(WILAYA==variables) %>% # View() acorigé dans csv
    dplyr::mutate(DAIRA = as.factor(DAIRA)) %>%
    dplyr::select(COMMUNE,POP,SUP) %>%
    dplyr::mutate(DENS = round(POP/SUP, digits = 2)) %>%
    dplyr::arrange(COMMUNE) #%>%
  f <- c("POP", "SUP")
  communepopt0  <- data.frame(COMMUNE='Total',DENS="***", t(colSums(communepop[,f])))
  # 3= pop
  # 4= sup

  N=nrow(communepop)
  tiba <- round(communepopt0[3]/communepopt0[4], digits = 2)
  communepopt  <- data.frame(COMMUNE=paste0("Total : ",N),
                             DENS=tiba[,],
                             t(colSums(communepop[,f])))

  df_communepop <- rbind(communepop,communepopt) #sep,
  df_communepop %>%
    dplyr::select(COMMUNE,POP,SUP,DENS) %>%
    knitr::kable(caption = paste0("Démographie par Communes Wilaya de " ,variables),align = "lrrrrrrrr")
}
