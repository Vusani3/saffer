# Loading Packages --------------------------------------------------------
library(dplyr)
library(readr)
library(tidyverse)
cpi_averageprices_allurban <- read.csv(file.path("data-raw",
                                                   "CPI_averageprices_allurban.csv"),
                                       sep=";",dec=",",na.strings='..')

# Removing rows with missing product name-------------------------------
cpi_averageprices_allurban <- cpi_averageprices_allurban[complete.cases(cpi_averageprices_allurban$H04), ]

# Removing unnecessary columns --------------------------------------------
cpi_averageprices_urban <- select(cpi_averageprices_allurban,
                                  -c("H01","H02","H03","H05","H06","H07"))

# Combining column for quantity and product -----------------------------------
cpi_averageprices_urban <- cpi_averageprices_urban %>% unite("Product",
                                                             H04:H08, remove = TRUE)

# Pivot -------------------------------------------------------------------
cpi_averageprices <- cpi_averageprices_urban %>%
  pivot_longer(-Product,
                  names_to = "Date", values_to = "Price (Rand)")

usethis::use_data(cpi_averageprices, overwrite = TRUE)
