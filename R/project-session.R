

# Exercise:make the code more readable ---------------------------------------------



# Object names

day_one
not_TRUE <- FALSE
dont_overwrite_existing_stuff<- 9
why_redefine_an_existing_function <- function(x) sum(x)

# Spacing
x[, 1]

mean(x, na.rm = TRUE)
function(x) {

}

height <- feet * 12 + inches
mean(x, na.rm = 10)
sqrt(x^2 + y^2)
df$z
x <- 1:10

# Indenting
if (y < 0 && debug)
  message("Y is negative")

# Object names
DayOne
dayone
T <- FALSE
c <- 9
mean <- function(x)
  sum(x)

# Spacing
x[, 1]
x[, 1]
x[, 1]
mean (x, na.rm = TRUE)
mean(x, na.rm = TRUE)
function (x) {
}
function(x) {
}
height <- feet * 12 + inches
mean(x, na.rm = 10)
sqrt(x ^ 2 + y ^ 2)
df$z
x <- 1:10

# Indenting
if (y < 0 && debug)
  message("Y is negative")

# functions ---------------------------------------------------------------


add_two <- function(x, y) {
  added <- x + y
  return(added)
}

add_two(1, 2)


# packages ----------------------------------------------------------------

source(here::here("R/package-loading.R"))


# Save data ---------------------------------------------------------------

write_csv(iris, here::here("data/iris.csv"))
imported_iris <- read_csv(here::here("data/iris.csv"))
glimpse(imported_iris)
