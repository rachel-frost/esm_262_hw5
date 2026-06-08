test_that("fatal_cost calculates NPV correctly and handles edge cases", {
  
# Expectation 1: Check that a higher crash count yields a higher cost
  short_cost <- fatal_cost(crashcount = 2, 
                           vsl = vsl_test, 
                           discount = discount_test, 
                           time = time_test)
  
  long_cost  <- fatal_cost(crashcount = 200, 
                           vsl = vsl_test, 
                           discount = discount_test, 
                           time = time_test)
  
  expect_true(short_cost < long_cost)
  
  
#Expectation 2: Check the edge case where crashcount is exactly 0
# The function should return exactly 0 without running the NPV formula
  zero_cost <- fatal_cost(crashcount = 0, 
                          vsl = vsl_test, 
                          discount = discount_test, 
                          time = time_test)
  
  expect_equal(zero_cost, 0)
  
  
# Expectation 3: Check manual calculation for mathematical accuracy ---
# Formula: (1 * 7,400,000) / (1 + 0.07)^30 = 972111.7 (approx)
  expected_npv <- (1 * vsl_test) / (1 + discount_test)^time_test
  
  actual_npv   <- fatal_cost(crashcount = 1, 
                             vsl = vsl_test, 
                             discount = discount_test, 
                             time = time_test)
  
  expect_equal(actual_npv, expected_npv)
})