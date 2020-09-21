server <- function(input, output) 
{
  
  output$histogram <- renderPlot({
    housing1<- housing %>% filter(`ZIP OR POSTAL CODE`== input$zip)
    ggplot(data=housing1, aes(housing1$PRICE)) + geom_histogram(fill='#B92D79',color="#e9ecef",alpha=0.9)+ggtitle("Price Distribution by Zip Code") +xlab("House Prices")+ ylab("Frequency")+
      theme(plot.title = element_text(size=15) )
  })
  
  
  output$medianprices <-  renderTable(
    pivottable <- housing %>%filter(`PROPERTY TYPE`== "Single Family Residential"|`PROPERTY TYPE`== 'Townhouse') %>%group_by(`ZIP OR POSTAL CODE`,`PROPERTY TYPE`)%>%summarise(Median_Value = median(PRICE)) %>% pivot_wider(names_from = `PROPERTY TYPE`, values_from = Median_Value)%>% arrange(desc(`Single Family Residential`)),digits = 0)
  

  output$boxplot <-renderPlot({
    housing2 <- housing %>% filter((`PROPERTY TYPE`== "Single Family Residential" | `PROPERTY TYPE`== 'Townhouse'))%>% filter((`BEDS` >= min(input$Beds)  &  `BEDS` <= max(input$Beds) ) & (`BATHS`>=min(input$Baths) & `BATHS`<= max(input$Baths))& (`LOT SIZE`>= min(input$Lot_Size) & `LOT SIZE`<= max(input$Lot_Size)) &  (`YEAR BUILT`>= min(input$Year_Built) & `YEAR BUILT`<= max(input$Year_Built)))
   ggplot(data=housing2, aes(housing2$PRICE,y=housing2$`PROPERTY TYPE`)) +
      geom_boxplot(outlier.colour="#900C3F", outlier.shape=16,outlier.size=2, notch=FALSE)+ggtitle(" Price Distribution by Various Factors ") +xlab("Price")+ylab("Property Type")
  })
  
  temp.housing.df <- mutate(housing , content = paste0("Latitude:",housing$`LATITUDE`,"<br>","Longitude:",housing$`LONGITUDE`,"<br>", "SQUARE FEET:",housing$`SQUARE FEET`,"<br>", "LOT SIZE:",housing$`LOT SIZE`,"<br>","Year Built:",housing$`YEAR BUILT`)
   
  )
  
  output$mymap <- renderLeaflet(
    {
      leaflet(housing) %>%
      addTiles()%>%  
      addMarkers(lng=housing$LONGITUDE, lat=housing$LATITUDE,label=lapply(temp.housing.df$content,HTML)
      )})
  }
