test_that("fatal_cost calculates NPV correctly and handles edge cases", {
  
# Expectation 1: Check that a higher crash count yields a higher cost
  short_cost <- fatal_cost(crashcount = 2, 
                           vsl = vsl, 
                           discount = discount, 
                           time = time)
  
  long_cost  <- fatal_cost(crashcount = 200, 
                           vsl = vsl, 
                           discount = discount, 
                           time = time)
  
  expect_true(short_cost < long_cost)
  
  
# Expectation 2: Check the edge case where crashcount is exactly 0
# The function should return exactly 0 without running the NPV formula
  zero_cost <- fatal_cost(crashcount = 0, 
                          vsl = vsl, 
                          discount = discount, 
                          time = time)
  
  expect_equal(zero_cost, 0)
  
  
# Expectation 3: Check manual calculation for mathematical accuracy
  expected_npv <- (1 * vsl) / (1 + discount)^time
  
  actual_npv   <- fatal_cost(crashcount = 1, 
                             vsl = vsl, 
                             discount = discount, 
                             time = time)
  
  expect_equal(actual_npv, expected_npv)
})