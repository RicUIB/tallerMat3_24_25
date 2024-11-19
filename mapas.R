# maps

# Download to a temporary file
tmp_geojson <- tempfile(fileext = ".geojson")
download.file(
  "https://raw.githubusercontent.com/gregoiredavid/france-geojson/master/communes.geojson",
  tmp_geojson
)

# Let's read the downloaded geoJson file with the sf library:
library(sf)
my_sf <- read_sf("data/mallorca/2024-09-13/neighbourhoods.geojson")

Select only the region #6 as you would do with a data frame
my_sf_region_6 <- my_sf[substr(my_sf$code, 1, 2) == "06", ]

par(mar = c(0, 0, 0, 0))
plot(my_sf$geometry, col = "grey")

my_sf_arta = my_sf %>% filter(neighbourhood == "Artà")
plot(my_sf_arta$geometry, col = "red")


## ggplot 2

# Plot it
library(ggplot2)
ggplot(my_sf) +
  geom_sf(fill = "#69b3a2", color = "white") +
  theme_void()




