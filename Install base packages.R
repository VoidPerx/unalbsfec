# Install base packages
install.packages(c(
  "tidyverse",     # Data manipulation
  "rmarkdown",     # Documentation
  "knitr",         # Reports
  "ggplot2",       # Visualizations
  "readxl",        # Read Excel
  "writexl",       # Write Excel
  "here",          # Route management
  "devtools",      # Development Tools
  "usethis",       # R Utilities
  "testthat",      # Testing
  "roxygen2"       # Documentation
))

# Upload Packages
library(tidyverse)
library(rmarkdown)
library(here)

# Verify installation
sessionInfo()
