#' Calculate total labor cost for bridge construction
#'
#' @description Computes total labor cost based on the number of non-flood working
#' days, since workers cannot work on flood days. More flood days means fewer
#' billable days and lower total labor cost.
#'
#' @param river_height_data A data frame with columns {day} and {river_ht}
#' @param workers Numeric. Number of workers on the project. Default is 40.
#' @param daily_wage Numeric. Daily wage per worker in dollars. Default is 350.
#' @param flood_threshold Numeric. River height (in ft) above which a day counts as a flood. Default is 20.
#' @param work_days Numeric. Total planned working days in the project. Default is 365.
#'
#' @return Numeric. Total labor cost in dollars.
#'
#' @examples
#' river_data <- data.frame(day = 1:10, river_ht = c(5, 5, 25, 25, 5, 5, 5, 5, 5, 5))
#' labor_cost(river_data, workers = 40, daily_wage = 350, flood_threshold = 20, work_days = 365)

source("R/count_flood_days.R")

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