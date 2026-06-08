test_that("bridge_repair_cost calculates NPV correctly", {

  # Expectation 1: Check mathematical accuracy against a manual calculation
  expected_npv <- (2 * costperflood) / (1 + discount)^time
  
  actual_npv <- bridge_repair_cost(floods = 2, 
                                     costperflood = costperflood, 
                                     discount = discount, 
                                     time = time)
  
  expect_equal(actual_npv, expected_npv)
  
  
# Expectation 2: Scale check (More floods should mean higher costs) ---
  low_floods  <- bridge_repair_cost(floods = 1, 
                                    costperflood = costperflood, 
                                    discount = discount, 
                                    time = time)
  
  high_floods <- bridge_repair_cost(floods = 5, 
                                    costperflood = costperflood, 
                                    discount = discount, 
                                    time = time)
  
  expect_true(low_floods < high_floods)
  
  
# Expectation 3: Zero handling
# If there are 0 floods, the total repair cost NPV must be exactly 0
  zero_floods <- bridge_repair_cost(floods = 0, 
                                    costperflood = costperflood, 
                                    discount = discount, 
                                    time = time)
  
  expect_equal(zero_floods, 0)
})