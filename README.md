
# yahiatiba <a href="https://tibaredha.com"><img src="man/figures/logo.png" align="right" height="138" alt="yahiatiba website" /></a>



<!-- badges: start -->

<a href="https://lifecycle.r-lib.org/articles/stages.html#experimental">
<img src=".//man//figures//lifecycle-experimental.svg" ></img></a>


<!-- badges: end -->

The goal of yahiatiba is to ...

## Installation

You can install the development version of yahiatiba like so:

``` r
# FILL THIS IN! HOW CAN PEOPLE INSTALL YOUR DEV PACKAGE?
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(yahiatiba)


# materiel
mat <- yahiatiba::mat

wil <- "chlef"
mat1 <- mat %>% dplyr::filter(WILAYA==wil)
mat_chlef (mat1,wil)

epsp <- unique(mat1$STRUCTURE)
for (i in epsp) {
  cat("\\newpage")
  cat(paste0("## Structure Sanitaire : ",i))
  print(knitr::kable(
    mat_repartition(mat,wil,i),  #mat_repartition (mat,wil,"EPH_AIN_MERANE")
    caption = paste0("Structure Sanitaire ",i)
  ))
  cat('\n\n<!-- -->\n\n')
}

wil <- "aindefla"
mat1 <- mat %>% dplyr::filter(WILAYA==wil)
mat_aindefla (mat1,wil)

wil <- "djelfa"
mat1 <- mat %>% dplyr::filter(WILAYA==wil)
mat_djelfa (mat1,wil)


wil <- "laghouat"
mat1 <- mat %>% dplyr::filter(WILAYA==wil)
mat_laghouat (mat1,wil)

wil <- "msila"
mat1 <- mat %>% dplyr::filter(WILAYA==wil)
mat_msila (mat1,wil)




mat_region (mat,"wil")








## basic example code
```

