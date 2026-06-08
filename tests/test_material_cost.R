#testing material cost function
###################################
test_that("material_cost works", {
  
  # Define what isn't in .qmd
  threshold     <- 20  
  base_cost     <- 2000000
  cost_per_day  <- 10000
  test_flood    <- data.frame(day = 1:10,
                              river_ht = c(25, 25, 25, 5, 5, 5, 5, 5, 5, 5))
  test_no_flood <- data.frame(day = 1:10,
                              river_ht = c(5, 5, 5, 5, 5, 5, 5, 5, 5, 5))
  
  #Expectation 1: Manual math check
  expected <- base_cost + (3 * cost_per_day)  # 3 flood days
  actual <- material_cost(test_flood,
                          base_material_cost = base_cost,
                          flood_threshold = threshold,
                          cost_per_day = cost_per_day)
  expect_equal(actual, expected)
  
  #Expectation 2: Scale check (more floods = higher cost)
  few_floods  <- data.frame(day = 1:10, river_ht = c(25, 5, 5, 5, 5, 5, 5, 5, 5, 5))
  many_floods <- data.frame(day = 1:10, river_ht = c(25, 25, 25, 25, 25, 5, 5, 5, 5, 5))
  
  low  <- material_cost(few_floods,  base_material_cost = base_cost,
                        flood_threshold = threshold, cost_per_day = cost_per_day)
  high <- material_cost(many_floods, base_material_cost = base_cost,
                        flood_threshold = threshold, cost_per_day = cost_per_day)
  expect_true(low < high)
  
  #Expectation 3: Zero flood days = base cost only
  no_floods <- material_cost(test_no_flood,
                             base_material_cost = base_cost,
                             flood_threshold = threshold,
                             cost_per_day = cost_per_day)
  expect_equal(no_floods, base_cost) })