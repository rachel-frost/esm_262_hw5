#' Compare costs between two bridge options
#'
#' @description Compares total costs of two bridge options and recommends the cheaper one.
#' @param op1 Numeric: Total cost of option 1 (keeping existing bridge) in dollars.
#' @param op2 Numeric: Total cost of option 2 (building new bridge) in dollars.
#' @return A named list with option costs, difference, recommendation, and savings.

compare_costs <- function(op1, op2) {
  
  diff <- abs(op1 - op2)
  
  if (op1 < op2) {
    recommendation <- "Keep existing bridge"
    savings <- diff
  } else {
    recommendation <- "Build new bridge"
    savings <- diff
  }
  
  return(list(
    option1_cost   = op1,
    option2_cost   = op2,
    difference     = diff,
    recommendation = recommendation,
    savings        = savings
  ))
}