count_flood_days <- function(river_height_data, flood_threshold = 20) {
  flood_days <- sum(river_height_data$river_ht > flood_threshold)
  return(flood_days)
}