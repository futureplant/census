# This file will provide the points to turn into markers
# Starting with dummy points
library(sf)

# getPoints <- function(){
#   # Create a dataframe with dummy points
#   my.df <- structure(list(pointID = c("401","402"),
#                           latitude = c(41.720844, 41.748060),
#                           longitude = c(1.8256178, 1.844315)),
# 
#                      .Names = c("pointID","latitude", "longitude"), class = "data.frame", row.names = c(NA, -2L))
# 
# 
#   # waterpoints <- st_as_sf(my.df, coords =c("longitude","latitude"), crs = 4326)
#   return (my.df)
# }


getPoints <- function(){
  waterpoints <- st_read("data/waterpoints.shp")
  return (waterpoints)
}

