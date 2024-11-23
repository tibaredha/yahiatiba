# fichier 5  MORTALITY


## code to prepare `deces` dataset goes here

# methode 1 inst/extdata
file <- yahiatiba::read_ext("deces.csv")
deces <- read.csv(file,encoding = "UTF-8")
glimpse(deces)
#mdo <- mdo %>% mutate(DATE=as.Date(DATE),DATE_DECL_Y=as.character(DATE_DECL_Y))
#glimpse(mdo)

usethis::use_data(deces, overwrite = TRUE)
