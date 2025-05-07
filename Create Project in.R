# Create new project R
# File > New Project > Version Control > https://github.com/VoidPerx/unalbsfec

# Setting up Git in R
library(usethis)
use_git_config(
  user.name = "jmontilla",
  user.email = "jmontilla@unal.edu.co"
)

# Configure work environment
.First <- function() {
  options(
    repos = c(CRAN = "https://cloud.r-project.org"),
    browserNLdisabled = TRUE,
    deparse.max.lines = 2
  )
}
