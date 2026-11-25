# Install R packages not available as reliable apt binaries.
#
# Use Posit Public Package Manager's binary repo for Ubuntu "noble" so packages arrive
# precompiled: fast, and no "failed to compile / missing system library" surprises.
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

install.packages(c(
  "pheatmap",   # clustered heatmaps (heatmap chapter)
  "here",       # project-root-relative file paths
  "DT"          # interactive tables
))
try(install.packages("languageserver"))  # editor language support, best effort

# Fail the image build loudly if a required package did not install.
need <- c("pheatmap", "here", "DT")
missing <- need[!vapply(need, requireNamespace, logical(1), quietly = TRUE)]
if (length(missing)) {
  stop("These packages failed to install: ", paste(missing, collapse = ", "))
}
