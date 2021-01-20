library(httr)
# Get API response --------------------------------------------------------
res <- GET('https://api.worldbank.org/v2/countries/ZA/indicators/SL.UEM.TOTL.ZS?per_page=62&format=JSON')

# Get content -------------------------------------------------------------
content <- content(res)


# Create dataframe --------------------------------------------------------

unemployment_sa <- data.frame()

for(i in 1:61){

  x <- c(content[[2]][[i]]['date'][[1]])

  y <- c(content[[2]][[i]]['value'][[1]])

  check <- length(y)

  if(check == 0){

    y = "Missing"

  } else{

    y

  }
  unemployment_data <- data.frame(Year = as.numeric(x),  "Unemployment_rate" = y)

  unemployment_sa <- rbind(unemployment_sa, unemployment_data)

}

usethis::use_data(unemployment_sa, overwrite = TRUE)
