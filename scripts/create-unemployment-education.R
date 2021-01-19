library(dplyr)
library(readr)

unemployment_education <- read_delim(file.path("data-raw", "unemployment_education.csv"),
                                ";")

usethis::use_data(unemployment_education, overwrite = TRUE)
