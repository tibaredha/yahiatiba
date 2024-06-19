rm(list=ls())
wc_algeria <- yahiatiba::wc_algeria

#df <- yahiatiba::mdo
#df <- yahiatiba::mdo %>% dplyr::filter(PATHOLOGIE=="Brucellose")
#df <- yahiatiba::mdo %>% dplyr::filter(PATHOLOGIE=="Tuberculose")
#df <- yahiatiba::mdo %>% dplyr::filter(PATHOLOGIE=="Leishmaniose Cutanee")

df <- yahiatiba::mdo %>% dplyr::filter(PATHOLOGIE=="Rougeole")

yahiatiba::declaration_e (df)
yahiatiba::declaration_c(df)
yahiatiba::declaration(df)
yahiatiba::decpta(df)
yahiatiba::sigmdo(wc_algeria,df)
yahiatiba::maladie(df)
yahiatiba::tranche_age(df,900,300)
