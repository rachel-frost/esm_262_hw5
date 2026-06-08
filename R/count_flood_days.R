#' Count flood days from river height data
#'
#' @description Counts the number of days where river height exceeds a flood threshold
#' @param river_height_data A data frame with a river_ht containing daily river heights.
#' @param flood_threshold River height above which a day counts as a flood. Default is 20.
#' @return Numeric: The number of days where river height exceeded the threshold.

count_flood_days <- function(river_height_data, flood_threshold = 20) {
  flood_days <- sum(river_height_data$river_ht > flood_threshold)
  return(flood_days)
}