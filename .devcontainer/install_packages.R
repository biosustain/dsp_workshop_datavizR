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

install.packages("pheatmap")                # clustered heatmaps (heatmap chapter)
try(install.packages("languageserver"))     # editor language support, best effort

# Fail the image build loudly if pheatmap did not actually install.
if (!requireNamespace("pheatmap", quietly = TRUE)) {
  stop("pheatmap failed to install")
}
