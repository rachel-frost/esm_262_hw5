#testing labor cost function
#Author: Rachel Frost

###################################

test_that("labor_cost_works", {

  test_data_no_flood <- data.frame(
    day = seq(1, 10),
    river_ht = rep(5, 10)  # no flooding
  )

  test_data_with_flood <- data.frame(
    day = seq(1, 10),
    river_ht = c(25, 25, 25, 5, 5, 5, 5, 5, 5, 5)  # 3 flood days
  )

  # No flooding: workers * daily_wage * work_days
  expect_equal(labor_cost(test_data_no_flood, workers = 40, daily_wage = 350,
                          flood_threshold = 20, work_days = 365), 5110000)

  # 3 flood days: workers * daily_wage * (work_days - 3)
  expect_equal(labor_cost(test_data_with_flood, workers = 40, daily_wage = 350,
                          flood_threshold = 20, work_days = 365), 5068000)

})

test_that("labor_cost_decreases_with_more_floods", {

  few_floods <- data.frame(day = 1:10, river_ht = c(25, 5, 5, 5, 5, 5, 5, 5, 5, 5))
  many_floods <- data.frame(day = 1:10, river_ht = c(25, 25, 25, 25, 25, 5, 5, 5, 5, 5))

  # More flood days = fewer working days = lower labor cost
  expect_true(labor_cost(many_floods) < labor_cost(few_floods))

})
