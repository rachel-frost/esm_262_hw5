#' Cost of Loss of Human Life
#'
#' This function determines the total cost of human life from bridge overtopping
#' @param vsl value of a statistical life (USD) default = 13000000 
#' @param crashcount number of fatalities per year due to flooding (count)
#' @param discount discount rate (no unit) default = 7%
#' @return npv (USD) net present value
#'
# function definition
fatal_cost = function(crashcount, 
                      vsl = 7400000, 
                      discount = 0.07) {
  # calculate net present value
  npv = ((crashcount * vsl) / discount) 
  return(npv)
}
