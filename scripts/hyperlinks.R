# adds hyperlinks to df

#&entry.844325190=99999&entry.166518206=888888


createFormLinks <- function(dataframe){
  basicFormURL <- "https://docs.google.com/forms/d/e/1FAIpQLSdbR4tkWnGNy8Ar6KmDggd4l6AKd2aClEzz9RnJ4QGwLunvPg/viewform?"
  basicMapURL <- "https://www.google.com/maps/search/?api=1&query="
  basicReserveURL <- "https://docs.google.com/forms/d/e/1FAIpQLSe60Lb25b7aM7jdVnS_Fcpe-5yNXW8S5SFDR3eseXElCEo1BQ/viewform?"
  urlobs <- 'https://docs.google.com/spreadsheets/d/12UrAPu96rbjzFuqlTIaklLiFUNPFxCYOxtTmAbL786A/edit?usp=sharing'
  obsdtf <- read.csv(text=gsheet2text(urlobs, format='csv'), stringsAsFactors=FALSE,fileEncoding = "UTF-8",encoding = "UTF-8")[,1]
  dataframe$Observations <- lapply(dataframe$OBJECTID,FUN=function(x) sum(obsdtf == x))

  
  dataframe$formURL <- paste0(
                        
                        '<strong>Point ',
                        dataframe$OBJECTID,
                        '</strong><br />',
                        '<br /><a href ="',
                        basicMapURL,
                        st_coordinates(dataframe)[,'Y'],
                        ",",
                        st_coordinates(dataframe)[,'X'],
                        '"',
                        "> Directions </a><br /><br />",
                       '<a href ="',
                       basicFormURL,
                       "&entry.844325190=",
                       dataframe$OBJECTID,
                       "&entry.166518206=",
                       st_coordinates(dataframe)[,'Y'],
                       ",",
                       st_coordinates(dataframe)[,'X'],
                       '"',
                       "> Observation </a> <br /><br />    ",
                       '<a href ="',
                       basicReserveURL,
                       "&entry.1777380478=",
                       dataframe$OBJECTID,
                       "&entry.130099811=",
                       st_coordinates(dataframe)[,'Y'],
                       ",",
                       st_coordinates(dataframe)[,'X'],
                       '"',
                       "> Reserva </a>"
                       #dataframe$Observations,
                       # ")"
                       
                       
        
                       )
  

  
  dataframe <- st_as_sf(dataframe, coords =c("longitude","latitude"), crs = 4326)
  return (dataframe)
}



