test_that("str_split_one() splits a string", {
  expect_equal(
    object = str_split_one("a, b, c", ", "),
    expected = c("a", "b", "c")
  )
})

test_that("str_split_one() errors if input length > 1", {
  expect_error(
    object = str_split_one(string = c("a,b", "c,d"), pattern = "")
  )
})

test_that("str_split_one() exposes features of stringr::str_split()", {
  expect_equal(
    object = str_split_one(string = c("a,b,c"), pattern = ",", n = 2),
    expected = c("a", "b,c")
  )

  expect_equal(
    object = str_split_one(string = "a.b", pattern = stringr::fixed(".")),
    expected = c("a", "b")
  )
})
