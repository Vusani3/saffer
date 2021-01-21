library(readr)

unemployment_gender <- read_delim(
  file.path(
    "data-raw",
    "unemployment-gender.csv"
    ),
  delim = ";",
  comment = "#"
  )

usethis::use_data(unemployment_gender, overwrite = TRUE)
