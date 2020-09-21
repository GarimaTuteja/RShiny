# RShiny
Shiny is an R package that makes it easy to build interactive web applications (apps) straight from R. You can do quite a lot with Shiny: think of it as an easy way to make an interactive web page, and that web page can seamlessly interact with R and display R objects (plots, tables, of anything else you do in R). 
Every Shiny app is composed of a two parts:

1. Web page that shows the app to the user
2. Computer that powers the app

The computer that runs the app can either be your own laptop (such as when you’re running an app from RStudio) or a server somewhere else. 
UI is just a web document that the user gets to see, it’s HTML that you write using Shiny’s functions. The UI is responsible for creating the layout of the app and telling Shiny exactly where things go. 
The server is responsible for the logic of the app it’s the set of instructions that tell the web page what to show when the user interacts with the page.

## Data
Data is regarding housing price from the Dallas area that has 25 features (eg LOT SIZE,ZIP CODE,LATITUDE,LONGITUDE etc) and 5000 observations.
Basic preprocessing for the data has been done such finding the missing values, imputing missing values, doing sanity checks such as if the houses exists with feature values given.


Tab 1: A histogram that shows the distribution of home prices in a zip code. Include a drop-down input list that allows a user to choose one or multiple zip codes at a time.
Tab 2: A table that shows the median home price by zip code (row) and property type (column). Sort the table by descending order of “Single Family Residential” home price.
Tab 3: A boxplot for a specific (number of) beds, (number of) baths, square feet, lot size, and year built combination. For each of the above features, include a slider input.
Tab 4: A map that shows the location of the home. When a user hovers over a particular property, s/he should be able to see basic information about the property, such as square feet, lot size, year built, etc.
