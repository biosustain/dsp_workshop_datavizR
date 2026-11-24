#!/usr/bin/env Rscript
# Generate the student notebooks from the website chapters.
#
# One source of truth: the chapters in project/. Each student notebook is the
# chapter with the <details> answer blocks removed (left as a blank chunk to fill)
# and an R Notebook header added. Content stays identical to the website — only the
# answers are missing.
#
# Run from the repo root:   Rscript make_notebooks.R

chapters_dir <- "project"
out_dir      <- "notebooks"
dir.create(out_dir, showWarnings = FALSE)

files <- list.files(chapters_dir, pattern = "^[0-9]{2}_.*\\.Rmd$", full.names = TRUE)

for (f in files) {
  one <- paste(readLines(f, warn = FALSE), collapse = "\n")

  # 1. drop HTML comments (maintainer notes)
  one <- gsub("(?s)<!--.*?-->\\s*", "", one, perl = TRUE)

  # 2. replace each <details>...</details> answer with a blank chunk to fill in
  blank <- "```{r}\n# your code here\n\n```"
  one <- gsub("(?s)<details>.*?</details>", blank, one, perl = TRUE)

  lines <- strsplit(one, "\n", fixed = TRUE)[[1]]

  # 3. use the first level-1 heading as the notebook title, then drop that line
  h <- grep("^# ", lines)[1]
  title <- sub("^#\\s*", "", lines[h])
  lines <- lines[-h]
  while (length(lines) && !nzchar(trimws(lines[1]))) lines <- lines[-1]

  header <- c(
    "---",
    sprintf('title: "%s"', title),
    "output: html_notebook",
    "---",
    "",
    "> Work through this notebook: run each chunk (click ▶). The full explanations",
    "> and the **answers** to the \"\U0001F449 Your turn\" tasks are on the course website.",
    ""
  )

  out <- file.path(out_dir, basename(f))
  writeLines(c(header, lines), out)
  cat("wrote", out, "\n")
}

cat("\nDone. Generated", length(files), "notebooks in", out_dir, "/\n")
