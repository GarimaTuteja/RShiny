ui <- fluidPage(
  tabsetPanel(
    tabPanel(" Home Prices Distribution",fluid=TRUE,
             sidebarLayout(
               sidebarPanel(selectInput("zip",
                                        label = "ZIP CODE",
                                        choices = unique(housing["ZIP OR POSTAL CODE"]),
                                        selected = 75234,
                                        multiple = TRUE)),
               mainPanel(plotOutput(outputId = "histogram"))
                 )
             ),
    tabPanel("Median House Prices",h2("Zip Code Property Type Median Prices"), fluid=TRUE,
               mainPanel(tableOutput(outputId = "medianprices"))),
    tabPanel(" Factors Based Price Distribution",fluid=TRUE,
             sidebarLayout(
               sidebarPanel(
                sliderInput("Beds",
                            label="Beds",
                            min=min(housing[,"BEDS"],na.rm=T),
                            max=max(housing[,"BEDS"],na.rm=T),
                            value = c(min,max)
                            ),
               sliderInput("Baths",
                           label="Baths",
                           min=min(housing[,"BATHS"],na.rm=T),
                           max=max(housing[,"BATHS"],na.rm=T),
                           value = c(min,max),
                           step=0.5,
                           round= TRUE
                           ),
               sliderInput("Lot_Size",
                           label="Lot Size",
                           min=min(housing[,"LOT SIZE"],na.rm=T),
                           max=max(housing[,"LOT SIZE"],na.rm=T),
                           value = c(min,max)
                           ),
               sliderInput("Year_Built",
                           label="Year Built",
                           min=min(housing[,"YEAR BUILT"],na.rm=T),
                           max=max(housing[,"YEAR BUILT"],na.rm=T),
                           value = c(min,max)
                           )
               ),
               mainPanel(
                 plotOutput(outputId = "boxplot")
                 )
             )    
         ),
    tabPanel("Home Locations",h2("View Home Locations"),leafletOutput(outputId = "mymap",height="600"))
    )
  )
