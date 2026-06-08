#' Cost of Loss of Human Life
#'
#' This function determines the total cost of human life from bridge overtopping
#' @param vsl value of a statistical life (USD) default = 7400000 
#' @param crashcount number of fatalities per year due to flooding (count)
#' @param discount discount rate (no unit) default = 7%
#' @param time number of years evaluation default = 30 years
#' @return npv (USD) net present value
#' 
#'
# function definition
fatal_cost = function(crashcount, 
                      vsl, 
                      discount,
                      time) {
  if (crashcount == 0) {
    return(0)
  }
  # calculate net present value
  npv = ((crashcount * vsl) / (1 + discount)**time) 
  return(npv)
}
