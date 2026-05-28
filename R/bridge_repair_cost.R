#' Cost of Bridge Repairs due to flooding 
#'
#' This function calculates the total cost of bridge repairs based on the extent of local flooding.
#' @param costperflood estimated cost of repairs needed per flooding event ($USD) default = $1 million
#' @param  floods number of flooding events per year based on data
#' @param discount discount rate (no unit) default = 7%
#' @param time number of years evaluation default = 30 years
#' @return npv (USD) net present value
#'
# function definition
bridge_repair_cost = function(floods, 
                              costperflood = 1000000, 
                              discount = 0.07,
                              time = 30) {
  # calculate annual repair cost
  npv = ((floods * costperflood) / (1 + discount)**time)
  return(npv)
}

