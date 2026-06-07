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