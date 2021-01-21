library(dplyr)
library(readr)

unemployment_gender <- read_delim(
  file.path(
    "data-raw",
    "unemployment_gender.csv"
    ),
  ";",
  skip = 2,
  )

usethis::use_data(unemployment_gender, overwrite = TRUE)
