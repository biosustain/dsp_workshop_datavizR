install.packages(
  c(
    "languageserver"
  ),
  dependencies = TRUE,
  repos = "https://cloud.r-project.org",
  Ncpus = parallel::detectCores()
)