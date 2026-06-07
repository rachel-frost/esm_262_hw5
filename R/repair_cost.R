repair_cost <- function(river_height_data,
                        flood_threshold = 20,
                        cost_per_flood = 50000) { #default 50,000
  
  flood_days <- 0  # counter for number of flood events
  
  for (i in 1:nrow(river_height_data)) {
    if (river_height_data$river_ht[i] > flood_threshold) {
      flood_days <- flood_days + 1
    }
  }
  
  total_repair <- flood_days * cost_per_flood
  
  return(total_repair)
}