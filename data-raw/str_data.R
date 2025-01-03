
# fichier 2 structure publiques EPH  probleme incomplet
devtools::load_all(".")
## code to prepare `str` dataset goes here

#### 1-ain defla ####
eph_adf_lit <- yahiatiba::read_ext("aindefla/str/eph_adf_lit.csv")
eph_adf_lit <- read.csv(eph_adf_lit)
eph_atf_lit <- yahiatiba::read_ext("aindefla/str/eph_atf_lit.csv")
eph_atf_lit <- read.csv(eph_atf_lit)
eph_khm_lit <- yahiatiba::read_ext("aindefla/str/eph_khm_lit.csv")
eph_khm_lit <- read.csv(eph_khm_lit)
eph_mln_lit <- yahiatiba::read_ext("aindefla/str/eph_mln_lit.csv")
eph_mln_lit <- read.csv(eph_mln_lit)
aindefla_e_lit <- dplyr::bind_rows(eph_adf_lit,eph_atf_lit,eph_khm_lit,eph_mln_lit)
rm(eph_adf_lit,eph_atf_lit,eph_khm_lit,eph_mln_lit)
aindefla_e_lit <- aindefla_e_lit %>% select(-c(ID))
url <- "D:/R_prgramme/projects/yahiatiba/inst/extdata/aindefla/str/aindefla_e_lit.csv"
write.csv(aindefla_e_lit,url,row.names=FALSE)
aindefla_e_lit <- yahiatiba::read_ext("./aindefla/str/aindefla_e_lit.csv")
aindefla_e_lit <- read.csv(aindefla_e_lit)

#### 2-chlef ####
eph_amr_lit <- yahiatiba::read_ext("chlef/str/eph_amr_lit.csv")
eph_amr_lit <- read.csv(eph_amr_lit)
eph_chr_lit <- yahiatiba::read_ext("chlef/str/eph_chr_lit.csv")
eph_chr_lit <- read.csv(eph_chr_lit)
eph_cht_lit <- yahiatiba::read_ext("chlef/str/eph_cht_lit.csv")
eph_cht_lit <- read.csv(eph_cht_lit)
eph_olm_lit <- yahiatiba::read_ext("chlef/str/eph_olm_lit.csv")
eph_olm_lit <- read.csv(eph_olm_lit)
eph_sbh_lit <- yahiatiba::read_ext("chlef/str/eph_sbh_lit.csv")
eph_sbh_lit <- read.csv(eph_sbh_lit)
eph_srb_lit <- yahiatiba::read_ext("chlef/str/eph_srb_lit.csv")
eph_srb_lit <- read.csv(eph_srb_lit)
eph_tnsa_lit <- yahiatiba::read_ext("chlef/str/eph_tnsa_lit.csv")
eph_tnsa_lit <- read.csv(eph_tnsa_lit)
eph_tnsz_lit <- yahiatiba::read_ext("chlef/str/eph_tnsz_lit.csv")
eph_tnsz_lit <- read.csv(eph_tnsz_lit)
ehs_tns_lit <- yahiatiba::read_ext("chlef/str/ehs_tns_lit.csv")
ehs_tns_lit <- read.csv(ehs_tns_lit)
chlef_e_lit <- dplyr::bind_rows(eph_amr_lit,eph_chr_lit,eph_cht_lit,eph_olm_lit,eph_sbh_lit,
                                eph_srb_lit,eph_tnsa_lit,eph_tnsz_lit,ehs_tns_lit)
rm(eph_amr_lit,eph_chr_lit,eph_cht_lit,eph_olm_lit,eph_sbh_lit,
   eph_srb_lit,eph_tnsa_lit,eph_tnsz_lit,ehs_tns_lit)
chlef_e_lit <- chlef_e_lit %>% select(-c(ID))
url <- "D:/R_prgramme/projects/yahiatiba/inst/extdata/chlef/str/chlef_e_lit.csv"
write.csv(chlef_e_lit,url,row.names=FALSE)
chlef_e_lit <- yahiatiba::read_ext("chlef/str/chlef_e_lit.csv")
chlef_e_lit <- read.csv(chlef_e_lit)

#### 3-medea ####
eph_abcf_lit <- yahiatiba::read_ext("medea/str/eph_abcf_lit.csv")
eph_abcf_lit <- read.csv(eph_abcf_lit)
eph_brg_lit <- yahiatiba::read_ext("medea/str/eph_brg_lit.csv")
eph_brg_lit <- read.csv(eph_brg_lit)
eph_bslm_lit <- yahiatiba::read_ext("medea/str/eph_bslm_lit.csv")
eph_bslm_lit <- read.csv(eph_bslm_lit)
eph_chl_lit <- yahiatiba::read_ext("medea/str/eph_chl_lit.csv")
eph_chl_lit <- read.csv(eph_chl_lit)
eph_kbk_lit <- yahiatiba::read_ext("medea/str/eph_kbk_lit.csv")
eph_kbk_lit <- read.csv(eph_kbk_lit)
eph_mda_lit <- yahiatiba::read_ext("medea/str/eph_mda_lit.csv")
eph_mda_lit <- read.csv(eph_mda_lit)
eph_tblt_lit <- yahiatiba::read_ext("medea/str/eph_tblt_lit.csv")
eph_tblt_lit <- read.csv(eph_tblt_lit)
medea_e_lit <- dplyr::bind_rows(eph_abcf_lit,eph_brg_lit,eph_bslm_lit,eph_chl_lit,
                                eph_kbk_lit,eph_mda_lit,eph_tblt_lit)
rm(eph_abcf_lit,eph_brg_lit,eph_bslm_lit,eph_chl_lit,
   eph_kbk_lit,eph_mda_lit,eph_tblt_lit)
medea_e_lit <- medea_e_lit %>% select(-c(ID))
url <- "D:/R_prgramme/projects/yahiatiba/inst/extdata/medea/str/medea_e_lit.csv"
write.csv(medea_e_lit,url,row.names=FALSE)
medea_e_lit <- yahiatiba::read_ext("./medea/str/medea_e_lit.csv")
medea_e_lit <- read.csv(medea_e_lit)

#### 4-djelfa ####
eph_bi_lit <- yahiatiba::read_ext("djelfa/str/eph/eph_bi_lit.csv")
eph_bi_lit <- read.csv(eph_bi_lit)
eph_ao_lit <- yahiatiba::read_ext("djelfa/str/eph/eph_ao_lit.csv")
eph_ao_lit <- read.csv(eph_ao_lit)
eph_hbb_lit <- yahiatiba::read_ext("djelfa/str/eph/eph_hbb_lit.csv")
eph_hbb_lit <- read.csv(eph_hbb_lit)
eph_dje_lit <- yahiatiba::read_ext("djelfa/str/eph/eph_dje_lit.csv")
eph_dje_lit <- read.csv(eph_dje_lit)
eph_mi_lit <- yahiatiba::read_ext("djelfa/str/eph/eph_mi_lit.csv")
eph_mi_lit <- read.csv(eph_mi_lit)
eph_ma_lit <- yahiatiba::read_ext("djelfa/str/eph/eph_ma_lit.csv")
eph_ma_lit <- read.csv(eph_ma_lit)
eph_id_lit <- yahiatiba::read_ext("djelfa/str/eph/eph_id_lit.csv")
eph_id_lit <- read.csv(eph_id_lit)

ehs_me_lit <- yahiatiba::read_ext("djelfa/str/ehs/ehs_me_lit.csv")
ehs_me_lit <- read.csv(ehs_me_lit)
ehs_oph_lit <- yahiatiba::read_ext("djelfa/str/ehs/ehs_oph_lit.csv")
ehs_oph_lit <- read.csv(ehs_oph_lit)
ehs_cac_lit <- yahiatiba::read_ext("djelfa/str/ehs/ehs_cac_lit.csv")
ehs_cac_lit <- read.csv(ehs_cac_lit)

epsp_ao_lit <- yahiatiba::read_ext("djelfa/str/epsp/epsp_ao.csv")
epsp_ao_lit <- read.csv(epsp_ao_lit)
epsp_hbb_lit <- yahiatiba::read_ext("djelfa/str/epsp/epsp_hbb.csv")
epsp_hbb_lit <- read.csv(epsp_hbb_lit)
epsp_dje_lit <- yahiatiba::read_ext("djelfa/str/epsp/epsp_dje.csv")
epsp_dje_lit <- read.csv(epsp_dje_lit)
epsp_ma_lit <- yahiatiba::read_ext("djelfa/str/epsp/epsp_ma.csv")
epsp_ma_lit <- read.csv(epsp_ma_lit)
epsp_gt_lit <- yahiatiba::read_ext("djelfa/str/epsp/epsp_gt.csv")
epsp_gt_lit <- read.csv(epsp_gt_lit)

djelfa_e_lit <- dplyr::bind_rows(
  eph_ao_lit,eph_bi_lit,eph_hbb_lit,eph_dje_lit,eph_mi_lit,eph_ma_lit,eph_id_lit,
  ehs_me_lit,ehs_oph_lit,ehs_cac_lit)

djelfa_epsp_lit <- dplyr::bind_rows(
  epsp_ao_lit,epsp_hbb_lit,epsp_dje_lit,epsp_ma_lit,epsp_gt_lit)

rm(
  epsp_ao_lit,epsp_hbb_lit,epsp_dje_lit,epsp_ma_lit,epsp_gt_lit,
  eph_ao_lit,eph_bi_lit,eph_hbb_lit,eph_dje_lit,eph_mi_lit,eph_ma_lit,eph_id_lit,
  ehs_me_lit,ehs_oph_lit,ehs_cac_lit)

djelfa_e_lit <- djelfa_e_lit %>% select(-c(ID))
url <- yahiatiba::read_ext("djelfa/str/djelfa_e_lit.csv")
#url <- "D:/R_prgramme/projects/yahiatiba/inst/extdata/djelfa/str/djelfa_e_lit.csv"
write.csv(djelfa_e_lit,url,row.names=FALSE)
djelfa_e_lit <- yahiatiba::read_ext("./djelfa/str/djelfa_e_lit.csv")
djelfa_e_lit <- read.csv(djelfa_e_lit)

#### 5-laghouat ####  probleme données ?????

eph_lgt_lit <- yahiatiba::read_ext("laghouat/str/eph_lgt_lit.csv")
eph_lgt_lit <- read.csv(eph_lgt_lit)
eph_mxt_lit <- yahiatiba::read_ext("laghouat/str/eph_mxt_lit.csv")
eph_mxt_lit <- read.csv(eph_mxt_lit)
eph_afl_lit <- yahiatiba::read_ext("laghouat/str/eph_afl_lit.csv")
eph_afl_lit <- read.csv(eph_afl_lit)
eph_ksh_lit <- yahiatiba::read_ext("laghouat/str/eph_ksh_lit.csv")
eph_ksh_lit <- read.csv(eph_ksh_lit)
ehs_mel_lit <- yahiatiba::read_ext("laghouat/str/ehs_mel_lit.csv")
ehs_mel_lit <- read.csv(ehs_mel_lit)
ehs_mea_lit <- yahiatiba::read_ext("laghouat/str/ehs_mea_lit.csv")
ehs_mea_lit <- read.csv(ehs_mea_lit)
laghouat_e_lit <- dplyr::bind_rows(eph_lgt_lit,eph_mxt_lit,eph_afl_lit,eph_ksh_lit,
                                   ehs_mel_lit,ehs_mea_lit)
rm(eph_lgt_lit,eph_mxt_lit,eph_afl_lit,eph_ksh_lit,
   ehs_mel_lit,ehs_mea_lit)
laghouat_e_lit <- laghouat_e_lit %>% select(-c(ID))
url <- "D:/R_prgramme/projects/yahiatiba/inst/extdata/laghouat/str/laghouat_e_lit.csv"
write.csv(laghouat_e_lit,url,row.names=FALSE)
laghouat_e_lit <- yahiatiba::read_ext("./laghouat/str/laghouat_e_lit.csv")
laghouat_e_lit <- read.csv(laghouat_e_lit)



#### 6-msila ####  probleme données
eph_alm_lit <- yahiatiba::read_ext("msila/str/eph_alm_lit.csv")
eph_alm_lit <- read.csv(eph_alm_lit)
eph_bns_lit <- yahiatiba::read_ext("msila/str/eph_bns_lit.csv")
eph_bns_lit <- read.csv(eph_bns_lit)
eph_sda_lit <- yahiatiba::read_ext("msila/str/eph_sda_lit.csv")
eph_sda_lit <- read.csv(eph_sda_lit)
eph_bsd_lit <- yahiatiba::read_ext("msila/str/eph_bsd_lit.csv")
eph_bsd_lit <- read.csv(eph_bsd_lit)
eph_mgr_lit <- yahiatiba::read_ext("msila/str/eph_mgr_lit.csv")
eph_mgr_lit <- read.csv(eph_mgr_lit)
eph_msl_lit <- yahiatiba::read_ext("msila/str/eph_msl_lit.csv")
eph_msl_lit <- read.csv(eph_msl_lit)
ehs_me_lit <- yahiatiba::read_ext("msila/str/ehs_me_lit.csv")
ehs_me_lit <- read.csv(ehs_me_lit)
ehs_psc_lit <- yahiatiba::read_ext("msila/str/ehs_psc_lit.csv")
ehs_psc_lit <- read.csv(ehs_psc_lit)
msila_e_lit <- dplyr::bind_rows(eph_alm_lit,eph_bns_lit,eph_sda_lit,eph_bsd_lit,
                                eph_mgr_lit,eph_msl_lit,ehs_me_lit,ehs_psc_lit)
rm(eph_alm_lit,eph_bns_lit,eph_sda_lit,eph_bsd_lit,
   eph_mgr_lit,eph_msl_lit,ehs_me_lit,ehs_psc_lit)
msila_e_lit <- msila_e_lit %>% select(-c(ID))
url <- "D:/R_prgramme/projects/yahiatiba/inst/extdata/msila/str/msila_e_lit.csv"
write.csv(msila_e_lit,url,row.names=FALSE)
msila_e_lit <- yahiatiba::read_ext("./msila/str/msila_e_lit.csv")
msila_e_lit <- read.csv(msila_e_lit)

#### 7-region ####
region_e_lit <- dplyr::bind_rows(aindefla_e_lit,
                                 chlef_e_lit,
                                 medea_e_lit,
                                 djelfa_e_lit,
                                 msila_e_lit,
                                 laghouat_e_lit)
url <- "D:/R_prgramme/projects/yahiatiba/inst/extdata/region/str/region_e_lit.csv"
write.csv(region_e_lit,url,row.names=FALSE)
rm(aindefla_e_lit,
   chlef_e_lit,
   medea_e_lit,
   djelfa_e_lit,
   msila_e_lit,
   laghouat_e_lit)


region_e_lit <- yahiatiba::read_ext("./region/str/region_e_lit.csv")
region_e_lit <- read.csv(region_e_lit)
region_e_lit <- region_e_lit %>% mutate(
  WILAYA=as.factor(WILAYA),
  DAIRA=as.factor(DAIRA),
  COMMUNE=as.factor(COMMUNE),
  CS=as.factor(CS),
  ETA=as.factor(ETA),
  TYPE=as.factor(TYPE),
  SERVICE=as.factor(SERVICE))
glimpse(region_e_lit)
usethis::use_data(region_e_lit, overwrite = TRUE)
rm(region_e_lit)
