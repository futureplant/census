library(shinydashboard)
library(shiny)



# Construct the UI argument for the call to the Shiny App in the main.R script
ui <- dashboardPage(
  dashboardHeader(title = "Amfibis Manresa"),
  dashboardSidebar(disable = TRUE),
  dashboardBody(
    fluidRow(column(width = 9,
                    box(width = NULL, solidHeader = TRUE,      #  This constructs a space for the map 
                        leafletOutput("map", height = 500)),
                    box(width = NULL,                          #  This constructs a space for the table
                        uiOutput("overviewTable")
                    )
    ),
    
    column(width = 3,
           
           # Construct box with image and introductory text for the app
           box(HTML("<strong>Valoració de punts d'aigua</strong><br/>
                    <p align='justify'>Benvinguts a l'aplicació per 
                    valorar i registrar punts d'aigua. Aquest és el 
                    primer pas per al Projecte de Seguiment del 
                    Tòtil I Altres Amfibis de Manresa.<br/ > 
                    </p>
                    
                    <strong>Simbologia</strong><br/ >
                    <strong>Blau:</strong> pendent de valoració<br/ >
                    <strong>Taronja:</strong> valoració incompleta<br/ >
                    <strong>Verd:</strong> valoració completa</p>
                  
                    <strong>Com funciona?</strong><br/ >
                    <strong>1-</strong>    Clic a un punt d'aigua.<br/ >
                    <strong>2-</strong>    Clicant a direccions, Google Maps us hi portarà directament.<br/ >
                    <strong>3-</strong>    Cliqueu a 'assessement' per començar la valoració d'un punt.<br/ >
                    <strong>4-</strong>    Si marqueu que no és un punt adequat, o el propietari ens denega l'accés, ja podeu acabar la valoració. EL punt desapareixerà.<br/ >
                    <strong>5-</strong>    Al final cliqueu si la valoració ha quedat completada o si per algun impediment ha faltat registrar informació (p.ex. el propietari no és a casa)<br/ >
                    Si hi ha cap problema amb la connexió, apunteu les dades en un paper i ja emplenareu a casa. Contacteu al Ferran per a qualsevol dubte.<br/ >
                    <br/ ><br/ >
                    Moltes gràcies per la vostra col·laboració,<br/ >
                    <br/ >
                    Ferran 667766497
                    
                    
                    
                    
                    <br/ ><br/ ></p>"), width = NULL, solidHeader = TRUE
                        )
                    )
             )
    )
  )

