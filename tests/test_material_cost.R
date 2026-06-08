#testing material cost function
#Author: Rachel Frost

###################################

test_that("material_cost_works", {

  test_data_no_flood <- data.frame(
    day = seq(1, 10),
    river_ht = rep(5, 10)  # always below threshold
  )

  test_data_with_flood <- data.frame(
    day = seq(1, 10),
    river_ht = c(5, 5, 25, 25, 25, 5, 5, 5, 5, 5)  # 3 flood days
  )

  # No flooding = base cost only
  expect_equal(material_cost(test_data_no_flood, base_material_cost = 2000000,
                             flood_threshold = 20, cost_per_day = 10000), 2000000)

  # 3 flood days = base + (3 * 10000)
  expect_equal(material_cost(test_data_with_flood, base_material_cost = 2000000,
                             flood_threshold = 20, cost_per_day = 10000), 2030000)

})

test_that("material_cost_increases_with_more_floods", {

  few_floods <- data.frame(day = 1:10, river_ht = c(25, 5, 5, 5, 5, 5, 5, 5, 5, 5))
  many_floods <- data.frame(day = 1:10, river_ht = c(25, 25, 25, 25, 25, 5, 5, 5, 5, 5))

  expect_true(material_cost(many_floods) > material_cost(few_floods))

})
