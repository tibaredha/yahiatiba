rm(list=ls())
wc_algeria <- yahiatiba::wc_algeria

df <- yahiatiba::mdo
#df <- yahiatiba::mdo %>% dplyr::filter(PATHOLOGIE=="Brucellose")
#df <- yahiatiba::mdo %>% dplyr::filter(PATHOLOGIE=="Tuberculose")
#df <- yahiatiba::mdo %>% dplyr::filter(PATHOLOGIE=="Leishmaniose Cutanee")

#df <- yahiatiba::mdo %>% dplyr::filter(PATHOLOGIE=="Rougeole")

yahiatiba::declaration_a(df)

yahiatiba::declaration_e(df)
yahiatiba::declaration_c(df)
yahiatiba::sigmdo(wc_algeria,df)

yahiatiba::declaration_ta(df)
yahiatiba::declaration_ta1(df,900,300)

yahiatiba::declaration_p(df)

