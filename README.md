# Data Visualization with R Workshop: Data Science Platform

We are pleased to invite you to our **Introduction to Data Visualization using R**
workshop — a hands-on session where you turn raw data into clear, insightful
visuals by *doing*, not just watching.

You'll work with a real RNA-seq dataset (*S. aureus*, biofilm vs planktonic) and
build your own plots in R — from your first chart to a publication-ready volcano —
always starting from a **biological question**. You'll use **ggplot2**,
**dplyr/tidyr** and **Plotly**, and you're welcome to use an **AI assistant**
(Claude, ChatGPT, Copilot) as a coding partner. The day finishes with a **1-hour
hands-on challenge**.

Whether you're completely new to R or already comfortable, the workshop builds up
from zero, and the final challenge will stretch the more experienced.

**Setup — your choice:** run everything in the cloud (nothing to install), or
locally on your own laptop.

## Agenda

| Time          | Session                                                              |
|---------------|---------------------------------------------------------------------|
| 9:00 – 9:10   | Welcome & pick your setup (cloud · your computer · AI)              |
| 9:10 – 9:30   | Get the data — the experiment and the questions we'll answer        |
| 9:30 – 10:00  | Your first plot — the grammar of graphics, on our own data          |
| 10:00 – 10:10 | Break                                                              |
| 10:10 – 11:00 | Answer the questions — distributions · PCA · one gene               |
| 11:00 – 11:10 | Short break                                                        |
| 11:10 – 12:00 | What changed? Volcano & heatmap, then your challenge (AI allowed)   |

## Repository layout

```
dsp_workshop_datavizR/
├── README.md               ← you are here (info + agenda)
└── project/                ← everything for the workshop
    ├── index.Rmd           website home: welcome, setup, agenda
    ├── 01…08_*.Rmd         website chapters — the reference, WITH the answers
    ├── data/               ← INPUT FILES (the dataset)
    │   ├── gene_counts.tsv                    gene × sample counts
    │   ├── metadata.tsv                       sample → lifestyle / timepoint
    │   └── DE_biofilm_vs_planktonic_24h.tsv   differential-expression results
    ├── notebooks/          ← WHERE STUDENTS WORK (one .Rmd per chapter, blanks)
    ├── assets/             css, logo, header/footer
    └── _bookdown.yml       book configuration
```

- **Input data:** `project/data/`
- **Work here:** `project/notebooks/` (run the chunks, fill in the "Your turn" blanks)
- **Read / reference (with answers):** the rendered website (link below)

## Practical information

- **Prerequisites:** Bring your laptop. No prior experience with R required.
- **Material:** https://biosustain.github.io/dsp_workshop_datavizR/
- **Date:** Wednesday, 2 December 2026, 9:00–12:00
- **Location:** Building 208 – room 011 – ALC2 _(to confirm)_
- **Capacity:** 60 people _(to confirm)_
