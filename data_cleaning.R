# Key packages for the app

#  install.packages("shiny") # For the shiny app
#  install.packages("bslib") # For certain shiny app traits
#  install.packages("readr") # For loading csv
#  install.packages("shinythemes") # For shiny themes
#  install.packages("thematic") # For consistence between layout and plots
#  install.packages("reactable") # For table
#  install.packages("reactablefmtr") # For table
#  install.packages("here") # For file management
#  install.packages("shinylive") # For github optimisation
#  install.packages("htmltools") # For the DOI links
#  install.packages("magrittr") # For the pipe (avoided tidyverse in case it makes it more difficult for shinyserver)
#  install.packages("dplyr") # For the mutate functions 

# Loading the packages

library(shiny) 
library(bslib)
library(readr)
library(shinythemes)
library(thematic)
library(reactable)
library(reactablefmtr)
library(here)
library(shinylive)
library(htmltools)
library(magrittr)
library(dplyr)


# Uploading the table

Table10 <- 
  read_csv(here("Data",
                "Processed Data",
                "Table10.csv"))

# Now I create the colour code I want the classification variable to have:

Table10 <- Table10 %>%
  mutate(
    Classification_colours = case_when(Classification == "High" ~ "darkgreen",
                                       Classification == "Low" ~ "red",
                                       TRUE ~ "orange")
  )

# Creating a tooltip option that will be used in the headers.

with_tooltip <- function(value, tooltip) {
  tags$abbr(style = "text-decoration: underline; text-decoration-style: dotted; cursor: help",
            title = tooltip, value)
}


# I will need a different DOI table for Table 10:

DOITable10 <- data.frame(
  Study_ID = c("6", "14", "20", "25", "2", "7", "30", "20", "14", "2", "30", 
               "14", "2", "7", "30", "6", "14", "20", "2", "7", "30", "6",
               "20", "2", "7", "9"),
  DOI = c("Not available",
          "https://doi.org/10.1037/e734362011-100",
          "Not available",
          "https://doi.org/10.1086/699153",
          "https://doi.org/10.1007/s12310-015-9160-1",
          "https://doi.org/10.3389/fpsyg.2023.1065749",
          "https://doi.org/10.1007/s11121-016-0670-3",
          "Not available",
          "https://doi.org/10.1037/e734362011-100",
          "https://doi.org/10.1007/s12310-015-9160-1",
          "https://doi.org/10.1007/s11121-016-0670-3",
          "https://doi.org/10.1037/e734362011-100",
          "https://doi.org/10.1007/s12310-015-9160-1",
          "https://doi.org/10.3389/fpsyg.2023.1065749",
          "https://doi.org/10.1007/s11121-016-0670-3",
          "Not available",
          "https://doi.org/10.1037/e734362011-100",
          "Not available",
          "https://doi.org/10.1007/s12310-015-9160-1",
          "https://doi.org/10.3389/fpsyg.2023.1065749",
          "https://doi.org/10.1007/s11121-016-0670-3",
          "Not available",
          "Not available",
          "https://doi.org/10.1007/s12310-015-9160-1",
          "https://doi.org/10.3389/fpsyg.2023.1065749",
          "https://doi.org/10.1007/s10212-019-00452-6"))
