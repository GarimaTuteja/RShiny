pacman::p_load(shiny,ggplot2,dplyr,tidyverse,leaflet,VIM)
options(scipen = 999)
housing <- read_csv("Housing_2020.csv")
sapply(housing ,function(x) sum(is.na(x)))

## Our dataset has total 5000 observations and from above we can see that SOLD DATE has 5000 observations missing  NEXT OPEN HOUSE START TIME and
NEXT OPEN HOUSE END TIME have 4867 values missing which is 97% of the data,also these columns won't be used in the further analysis, 
so will be removing these columns

housing <- housing[,-c(2,18,19)]

## But we still have some values that are missing and that can be used in the analysis , so will use KNN imputation, to impute these missing values
housingkNN <- kNN(housing,variable= c("BEDS","BATHS","SQUARE FEET","LOT SIZE","YEAR BUILT","$/SQUARE FEET","HOA/MONTH"),k=3)
housingKNN <- subset(housingkNN,select = `SALE TYPE`:LONGITUDE)
housing <-housingKNN
