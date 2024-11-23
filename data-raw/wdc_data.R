
# fichier 1 wilaya dairas commune
## code to prepare `wdc` dataset goes here
# methode 1 inst/extdata

devtools::load_all(".")

wilayax <- function(wilaya) {
  url1 <- yahiatiba::read_ext( paste0(wilaya,"/communes.csv")) # sep="," ,,fileEncoding = "latin1"
  communes  <- read.csv(url1)
  url2 <- yahiatiba::read_ext(paste0(wilaya,"/dairas.csv"))
  dairas  <- read.csv(url2)
  wilaya <- merge(x = communes , y = dairas, by.x = "IDD", by.y = "ID")
  wilaya <- wilaya %>% select(IDC,IDD,IDW,COMMUNE,DAIRA,SUP,POP) %>%
                       arrange(COMMUNE)
}

chlef <- wilayax("chlef")
chlef <- chlef %>% mutate(WILAYA="Chlef")%>% select(IDC,IDD,IDW,WILAYA,COMMUNE,DAIRA,SUP,POP)

aindefla <- wilayax("aindefla")
aindefla <- aindefla %>% mutate(WILAYA="Aindefla")%>% select(IDC,IDD,IDW,WILAYA,COMMUNE,DAIRA,SUP,POP)

medea <- wilayax("medea")
medea <- medea %>% mutate(WILAYA="Medea")%>% select(IDC,IDD,IDW,WILAYA,COMMUNE,DAIRA,SUP,POP)

djelfa <- wilayax("djelfa")
djelfa <- djelfa %>% mutate(WILAYA="Djelfa")%>% select(IDC,IDD,IDW,WILAYA,COMMUNE,DAIRA,SUP,POP)

laghouat <- wilayax("laghouat")
laghouat <- laghouat %>% mutate(WILAYA="Laghouat")%>% select(IDC,IDD,IDW,WILAYA,COMMUNE,DAIRA,SUP,POP)

msila <- wilayax("msila")
msila <- msila %>% mutate(WILAYA="Msila")%>% select(IDC,IDD,IDW,WILAYA,COMMUNE,DAIRA,SUP,POP)

wdc <- dplyr::bind_rows(chlef,aindefla,medea,djelfa,laghouat,msila)#
rm(chlef,aindefla,medea,djelfa,laghouat,msila)
usethis::use_data(wdc, overwrite = TRUE)

devtools::load_all(".")
yahiatiba::wdc
