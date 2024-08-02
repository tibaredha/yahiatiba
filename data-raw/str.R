## code to prepare `str` dataset goes here

file <- yahiatiba::read_ext("djelfa_e_lit.csv")
str <- read.csv(file)
glimpse(str)
usethis::use_data(str, overwrite = TRUE)
