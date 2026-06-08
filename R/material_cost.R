#' Calculate total material cost for bridge construction
#'
#' @name material_cost calculates the total material cost of bridge construction,
#' accounting for delays caused by flooding events.
#'
#' @param river_height_data A data frame with columns `day` and `river_ht`
#' containing daily river height measurements in meters.
#' @param base_material_cost Numeric. The baseline material cost in dollars.
#' Default is 2000000.
#' @param flood_threshold Numeric. The river height in meters at which flooding
#' occurs and construction halts. Default is 20.
#' @param cost_per_day Numeric. The additional material cost per flood delay
#' day in dollars. Default is 10000.
#'
#' @return numeric. The total material cost in dollars, including base cost
#' plus costs from flood delays.
#'
#' @examples
#' river_data <- data.frame(day = 1:10, river_ht = c(25, 25, 5, 5, 5, 5, 5, 5, 5, 5))
#' material_cost(river_data, base_material_cost = 2000000, flood_threshold = 20)

source("R/count_flood_days.R")

material_cost <- function(river_height_data,
                          base_material_cost = 2000000,
                          flood_threshold = 20,
                          cost_per_day = 10000) {

  delay_days <- count_flood_days(river_height_data, flood_threshold)
  total_material <- base_material_cost + (delay_days * cost_per_day)
  return(total_material)
}


