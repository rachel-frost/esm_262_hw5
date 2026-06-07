labor_cost <- function(river_height_data,
                       workers = 40,
                       daily_wage = 350,
                       flood_threshold = 20,
                       work_days = 365) {
  
  flood_days <- count_flood_days(river_height_data, flood_threshold)  # calls shared module
  non_flood_days <- work_days - flood_days
  total_labor <- workers * daily_wage * non_flood_days
  return(total_labor)
}