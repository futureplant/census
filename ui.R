library(shinydashboard)
library(shiny)



# Construct the UI argument for the call to the Shiny App in the main.R script
ui <- dashboardPage(
  dashboardHeader(title = "Nit dels Amfibis"),
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
           box(HTML("<strong>Censos Audio-Visuals</strong><br/>
                    <p align='justify'>Benvinguts a l'aplicació per 
                    entrar les dades dels censos d'amfibis.<br/ > 
                    </p>
                    
                    <strong>Simbologia</strong><br/ >
                    <strong>Blau:</strong> Punt d'aigua lliure, pendent de visitar<br/ >
                    <strong>Taronja:</strong> Reservat<br/ >
                    <strong>Verd:</strong> Cens realitzat</p>
                  
                    <strong>Com funciona?</strong><br/ >
                    <strong>1-</strong>    Clic a un punt d'aigua lliure (blau).<br/ >
                    <strong>2-</strong>    Clicant a reserva, podeu entrar el nom del grup i el punt es tornarà taronja.<br/ >
                    <strong>3-</strong>    Clicant a directions, Google Maps us hi portarà a prop. <br/ >
                    <strong>4-</strong>    Deixeu el termòmetre a l'aire lliure i comenceu el cens auditiu de 7 minuts.<br/ > 
                    <strong>5-</strong>    En acabar apunteu les condicions ambientals i reviseu els voltants del punt d'aigua.<br/ > 
                    <strong>6-</strong>    Cliqueu a 'observation' per entrar els detalls del cens audio-visual.<br/ > 

                    <br/ >
                    
                    Si hi ha cap problema amb la connexió, apunteu les dades en un paper i ja emplenareu a casa. Contacteu al Ferran per a qualsevol dubte.<br/ >
                    <br/ ><br/ >
                    Bona sort a tots i totes! <br/ >
                    <br/ >
                    Ferran 667766497
                    
                    
                    
                    
                    <br/ ><br/ ></p>"), width = NULL, solidHeader = TRUE
                        )
                    )
             )
    )
  )

