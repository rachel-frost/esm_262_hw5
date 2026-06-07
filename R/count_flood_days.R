count_flood_days <- function(river_height_data, flood_threshold = 20) {
  flood_days <- 0
  for (i in 1:nrow(river_height_data)) {
    if (river_height_data$river_ht[i] > flood_threshold) {
      flood_days <- flood_days + 1
    }
  }
  return(flood_days)
}