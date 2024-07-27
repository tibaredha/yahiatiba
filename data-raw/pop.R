## code to prepare `pop` dataset goes here
# methode 1 inst/extdata
file <- yahiatiba::read_ext("pop.csv")
pop  <- read.csv(file)
usethis::use_data(pop, overwrite = TRUE)
