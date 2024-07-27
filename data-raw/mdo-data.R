# methode 1 inst/extdata
file <- yahiatiba::read_ext("mdof.csv")
mdo <- read.csv(file)
glimpse(mdo)
mdo <- mdo %>% mutate(DATE=as.Date(DATE),DATE_DECL_Y=as.character(DATE_DECL_Y))
glimpse(mdo)
usethis::use_data(mdo, overwrite = TRUE)

# methode 2 locale
#mdo <- read.csv(here::here("data-raw","mdo.csv"))
#usethis::use_data(mdo1, overwrite = TRUE)

# methode 3 internal
#x <- 3
#y <- 10
#usethis::use_data(x,y, internal = TRUE)
