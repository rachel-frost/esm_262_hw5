test_that("labor_cost calculates correctly", {
  
  #Expectation 1: Manual check for no flooding
  expected_no_flood <- workers * daily_wage * work_days  # 40 * 350 * 365 = 5,110,000
  actual_no_flood <- labor_cost(test_no_flood,
                                workers = workers,
                                daily_wage = daily_wage,
                                flood_threshold = threshold,
                                work_days = work_days)
  expect_equal(actual_no_flood, expected_no_flood)
  
  #Expectation 2: Manual math check for 3 flood days
  expected_flood <- workers * daily_wage * (work_days - 3)  # 40 * 350 * 362 = 5,068,000
  actual_flood <- labor_cost(test_flood,
                             workers = workers,
                             daily_wage = daily_wage,
                             flood_threshold = threshold,
                             work_days = work_days)
  expect_equal(actual_flood, expected_flood)
  
  #Expectation 3: Scale check — more floods = lower labor cost
  few_floods  <- data.frame(day = 1:10, river_ht = c(25, 5, 5, 5, 5, 5, 5, 5, 5, 5))
  many_floods <- data.frame(day = 1:10, river_ht = c(25, 25, 25, 25, 25, 5, 5, 5, 5, 5))
  
  low_floods_cost  <- labor_cost(few_floods,  workers = workers, daily_wage = daily_wage,
                                 flood_threshold = threshold, work_days = work_days)
  high_floods_cost <- labor_cost(many_floods, workers = workers, daily_wage = daily_wage,
                                 flood_threshold = threshold, work_days = work_days)
  expect_true(high_floods_cost < low_floods_cost)
  
})