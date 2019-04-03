# census app file

# Main file of the amphibian map project

# import libraries
library(shiny)
library(shinydashboard)
library(leaflet)

# source files
source("ui.R",encoding = "Latin1")
source("scripts/getpoints.R")
source("scripts/hyperlinks.R")
source("scripts/readgsheets.R",encoding = "Latin1")



# server serves information to the user interface that is constructed in scripts/ui.R file
server <- function(input, output, session) {
  

  
  # url of gsheet which contains form answers
  url <- 'https://docs.google.com/spreadsheets/d/1rHUTv2m6N1cmx4gP0zwKxRBQok9Zr-FEBmf90Ksp7eU'
  dtf <- read.csv(text=gsheet2text(url, format='csv'), stringsAsFactors=FALSE,fileEncoding = "UTF-8",encoding = "UTF-8") # dataframe with answers
  
  # url of gsheet which contains reservations
  reserveurl <- "https://docs.google.com/spreadsheets/d/1-9aMhycVqXRKXatoge41vxlHY2tHalr00P3u_L-s-ck/edit?usp=sharing"
  reservedtf <- read.csv(text=gsheet2text(reserveurl, format='csv'), stringsAsFactors=FALSE,fileEncoding = "UTF-8",encoding = "UTF-8") # dataframe with answers
  
  # url of gsheet which contains census records
  censusurl <- "https://docs.google.com/spreadsheets/d/1WBVlX_fYvf_EuFFo2Y-nruf2Du6e8_Jo-dFmxFsGxbU/edit?usp=sharing"
  censusdtf <- read.csv(text=gsheet2text(censusurl, format='csv'), stringsAsFactors=FALSE,fileEncoding = "UTF-8",encoding = "UTF-8")  # dataframe with answers

  
  pools <- getPools(dtf)
  # forbidden <- getNoAccess(dtf)
  incompletes <- getIncomplete(dtf) # assessment app code
  impossibles <- getImpossibles(dtf) # assessment app code
  completes   <- getCompletes(dtf) # assesment app code
  
  adequates   <- getAdequates(dtf)
  inadequates <- getInAdequates(dtf)
  accessibles <- getAccessibles(dtf) # out of use
  askpermissions <- getAskPermissions(dtf)
  
  
  reserved    <- getReserved(reservedtf)
  censussed   <- getCensussed(censusdtf)
  
  
  
  
  waterpoints <- getPoints()

  
  #waterpoints = waterpoints[!waterpoints$OBJECTID %in% pools,]   THIS IS ASSESMENT APP CODE
  #waterpoints = waterpoints[!waterpoints$OBJECTID %in% impossibles,] THIS IS ASSESSMENT APP CODE
  
  waterpoints = waterpoints[waterpoints$OBJECTID %in% adequates,]       #  filter adequate points
  waterpoints = waterpoints[!waterpoints$OBJECTID %in% inadequates,]    #  filter out inadequate points
  waterpoints = waterpoints[!waterpoints$OBJECTID %in% impossibles,]    #  filter out records that are impossible to census
  waterpoints = waterpoints[!waterpoints$OBJECTID %in% askpermissions,] #  filter out records for which permission has to be asked in order to enter
  
  

  # funtion that determines colors of markers based on census and reservation records
  getColor <- function(samples,waterpoints) {
    sapply(waterpoints$OBJECTID, function(OBJECTID) {
      if(OBJECTID %in% censussed) {     #  green if a census record exists
        "green"} 
      else if(OBJECTID %in% reserved)   #  orange if point is reserved  
      { "orange"
        } 
      else {                            #  blue if still available for census
        "blue"
      } 
      })
  }
  
  # Construct icons
  icons <- awesomeIcons(
    icon = 'ios-close',
    iconColor = 'black',
    library = 'ion',
    markerColor = getColor(samples,waterpoints)
  )
  
  # Render background map for shiny app
  output$map <- renderLeaflet({
    
    waterlinks <- createFormLinks(waterpoints)
    # Add default OpenStreetMap map tiles
    leaflet(data = waterlinks) %>% setView(lng = 1.8243883, lat = 41.728416, zoom = 13) %>%  
      addTiles() %>% 
      addAwesomeMarkers(
                  icon = icons,
                  popup = ~formURL
                 )
    
    })
}

shinyApp(ui, server)

