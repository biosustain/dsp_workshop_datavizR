install.packages(
  c(
    "languageserver",
    "tidyverse",   # dplyr, ggplot2, tidyr, readr, tibble, ... used across the book
    "bookdown",    # to render the course website
    "ggrepel",     # labelled points on the volcano plot
    "plotly"       # interactive figures
  ),
  dependencies = TRUE,
  repos = "https://cloud.r-project.org",
  Ncpus = parallel::detectCores()
)
