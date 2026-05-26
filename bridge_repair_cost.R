#' Cost of Bridge Repairs due to flooding 
#'
#' This function calculates the total cost of bridge repairs based on the extent of local flooding.
#' @param spent estimated cost of repairs needed per flooding event ($USD) default = $1 million
#' @param  floods number of flooding events per year based on data
#' @return cost (annual) ($USD)
#'
# function definition
bridge_repair_cost = function(floods, spent = 1000000) {
  # calculate annual repair cost
  result = rho * height * flow * g * Keff
  return(result)
}

