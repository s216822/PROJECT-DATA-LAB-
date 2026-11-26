# go to https://api.stat.gov.pl/Home/BdlApi?lang=en
# Get an API key
# You need an API key if you want to download a lot of data from the BDL service.

# my_api_key <- "YOUR KEY HERE"

# install.packages("bdl")

library(bdl)
options(bdl.api_private_key = my_api_key)
vars_list <- bdl::get_variables("P3244", lang="en")
vars_to_get <- vars_list[vars_list$n1 %in% c("persons employed", 
                              "gross wages and salaries"),]
