library(dplyr)
library(readr)

unemployment_gender <- read_delim(file.path("data-raw",
                                            "unemployment_gender.csv"),
                                ";")

usethis::use_data(unemployment_gender, overwrite = TRUE)
