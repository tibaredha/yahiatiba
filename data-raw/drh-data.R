# methode 1 inst/extdata
file <- yahiatiba::read_ext("drh.csv")
drh <- read.csv(file,sep = ";")
usethis::use_data(drh, overwrite = TRUE)

# methode 2 locale
drh1 <- read.csv(here::here("data-raw","drh.csv"),sep = ";")
usethis::use_data(drh1, overwrite = TRUE)

# methode 3 internal
x <- 3
y <- 10
usethis::use_data(x,y, internal = TRUE)
