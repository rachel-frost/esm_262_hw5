material_cost <- function(river_height_data,
                          base_material_cost = 2000000,
                          flood_threshold = 20,
                          cost_per_day = 10000) {
  
  delay_days <- count_flood_days(river_height_data, flood_threshold)
  total_material <- base_material_cost + (delay_days * cost_per_day)
  return(total_material)
}