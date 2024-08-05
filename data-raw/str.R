## code to prepare `str` dataset goes here

file <- yahiatiba::read_ext("./str/region_e_lit.csv")
str <- read.csv(file)
str <- str %>% mutate(
  WILAYA=as.factor(WILAYA),
  DAIRA=as.factor(DAIRA),
  COMMUNE=as.factor(COMMUNE),
  CS=as.factor(CS),
  ETA=as.factor(ETA),
  TYPE=as.factor(TYPE),
  SERVICE=as.factor(SERVICE))
glimpse(str)
usethis::use_data(str, overwrite = TRUE)
