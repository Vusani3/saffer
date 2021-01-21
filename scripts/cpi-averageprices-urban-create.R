library(dplyr)
library(readr)
library(tidyverse)

cpi_averageprices_allurban <- read.csv(
  file.path(
    "data-raw",
    "CPI_averageprices_allurban.csv"
    ),
  sep=";",
  dec=",",
  na.strings='..',
  comment = "#")

cpi_averageprices_allurban <- cpi_averageprices_allurban[complete.cases(cpi_averageprices_allurban$H04), ]

cpi_averageprices_urban <- select(cpi_averageprices_allurban,
                                  -c("H01","H02","H03","H05","H06","H07"))

cpi_averageprices_urban <- cpi_averageprices_urban %>%
  unite("product",H04:H08, remove = TRUE)

cpi_averageprices <- cpi_averageprices_urban %>%
  pivot_longer(-product,
               names_to = "date", values_to = "price")

usethis::use_data(cpi_averageprices, overwrite = TRUE)
