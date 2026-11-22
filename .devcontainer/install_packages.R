# Install the R packages the workshop needs.
#
# Use Posit Public Package Manager's binary repo for Ubuntu "noble" so packages
# arrive precompiled: fast, and no "failed to compile, missing system library"
# surprises (that was why tidyverse/bookdown silently failed to install before).
# The HTTPUserAgent header is what makes the manager serve binaries, not source.
options(
  repos = c(CRAN = "https://packagemanager.posit.co/cran/__linux__/noble/latest"),
  HTTPUserAgent = sprintf(
    "R/%s R (%s)",
    getRversion(),
    paste(getRversion(), R.version["platform"], R.version["arch"], R.version["os"])
  ),
  Ncpus = parallel::detectCores()
)

install.packages(
  c(
    "tidyverse",     # dplyr, ggplot2, tidyr, readr, tibble, ... used across the book
    "bookdown",      # to render the course website
    "plotly",        # interactive figures
    "ggrepel",       # labelled points on the volcano plot
    "languageserver" # R language support in the editor
  )
)

# Fail the image build loudly if anything did not actually install.
need <- c("tidyverse", "bookdown", "plotly", "ggrepel")
missing <- need[!vapply(need, requireNamespace, logical(1), quietly = TRUE)]
if (length(missing)) {
  stop("These packages failed to install: ", paste(missing, collapse = ", "))
}
