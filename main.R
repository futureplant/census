# Main file of the amphibian map project
# testing things

library(shiny)
library(shinydashboard)
library(leaflet)

source("ui.R")
source("scripts/getpoints.R")
source("scripts/geturls.R")
source("scripts/hyperlinks.R")



# server serves information to the user interface that is constructed in scripts/ui.R file
server <- function(input, output, session) {
  
  # Render background map for shiny app
  output$map <- renderLeaflet({
    waterpoints <- getPoints()
    waterlinks <- createFormLinks(waterpoints)
    # Add default OpenStreetMap map tiles
    leaflet(data = waterlinks) %>% setView(lng = 1.8243883, lat = 41.728416, zoom = 11) %>%  #  set view to start extent, area over Schiphol Airport   
      addTiles() %>% 
      addMarkers(label = ~as.character("click me"), 
                 popup =  ~formURL)
    })
}

shinyApp(ui, server)

