# RShiny
Shiny is an R package that makes it easy to build interactive web applications (apps) straight from R. You can do quite a lot with Shiny: think of it as an easy way to make an interactive web page, and that web page can seamlessly interact with R and display R objects (plots, tables, of anything else you do in R). 
Every Shiny app is composed of a two parts:
1. Web page that shows the app to the user
2. computer that powers the app. 
The computer that runs the app can either be your own laptop (such as when you’re running an app from RStudio) or a server somewhere else. 
UI is just a web document that the user gets to see, it’s HTML that you write using Shiny’s functions. The UI is responsible for creating the layout of the app and telling Shiny exactly where things go. 
The server is responsible for the logic of the app; it’s the set of instructions that tell the web page what to show when the user interacts with the page.
