# tidyverse, bookdown, plotly and ggrepel are installed as apt binaries in the
# Dockerfile (reliable, no compilation). Here we add only the editor language
# server — best effort, so a hiccup here never breaks the image build.
options(
  repos = c(CRAN = "https://packagemanager.posit.co/cran/__linux__/noble/latest"),
  HTTPUserAgent = sprintf(
    "R/%s R (%s)",
    getRversion(),
    paste(getRversion(), R.version["platform"], R.version["arch"], R.version["os"])
  ),
  Ncpus = parallel::detectCores()
)

try(install.packages("languageserver"))
