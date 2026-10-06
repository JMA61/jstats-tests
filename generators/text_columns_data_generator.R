# =============================================================================
# GENERATOR: generators/text_columns_data_generator.R
# Home:      E:/00 R Projects/00_jstats_test_data/generators/   (canonical;
#            the project KB holds a reference copy per the capacity rules)
# Output:    <DATASETS_DIR>/text_columns_data.rds   (80 cases, 9 columns)
# Author:    Jeff Ackerman, August 2026 (S238)
# =============================================================================
#
# PURPOSE
# -------
# The CONSOLIDATED TEXT FIXTURE (the S224 parked item, filled at jencode's
# completion session per the S225 design record): every text-column shape
# jencode() must handle, in one dataset, so the jencode regression pair
# (jencode_check.R / jencode_walk.R) exercises the function on stable data
# rather than ad-hoc frames. All columns are CHARACTER by construction --
# that is the point.
#
# COLUMN SLATE (9 columns; each earns its place against a jencode surface)
# ------------------------------------------------------------------------
#   id              Integer spine, 1..80. The one non-character column.
#   Status          Clean 3-category words (Bail / Parole / Remand), no
#                   blanks. Automatic mode's happy path: alphabetical
#                   assignment listing, rerun-with-a-map suggestion.
#   Outcome         Words + BLANK cells ("" x 6). Automatic mode's blank
#                   note (M11) and the map-mode blank= rule.
#   ReasonDeclined  QUOTING column: an apostrophe word ("Don't know"),
#                   an embedded-semicolon word ("Not applicable; other"),
#                   plus plain words. The S238 token-start quote rule
#                   (apostrophes parse unquoted) and the quoted-word form.
#   SupervisionType Words wearing OUTER SPACES (" Community", "Custody ").
#                   The trim notes, automatic and map mode.
#   AgeText         Pure NUMBERS-AS-TEXT (ages 19-64). The all-numeric
#                   face-value conversion and its no-labels note.
#   AgeAtRelease    The POISONED column (S237 addition): ages + "-99"
#                   sentinels + word codes ("Refused", "Not stated") +
#                   blanks. Repair mode (map = "else=NA"), the face-value
#                   note, and the S238 word-evidence -99 nudge.
#   Q_AgreeText     Qualtrics-shaped variant 1: CHOICE TEXT export of a
#                   5-point Likert item (the answer text respondents
#                   clicked -- a standard Qualtrics toggle; S224 recon).
#   Q_AgreeNum      Qualtrics-shaped variant 2: the SAME answers as
#                   numeric recode values stored as text ("1".."5") --
#                   the shape a numeric export takes when the three-row
#                   Qualtrics header poisons every column to character.
#
# Q_AgreeText and Q_AgreeNum are derived from ONE latent response vector,
# so encoding either column should yield distributions a jfreq() on the
# other confirms.
#
# USAGE
# -----
#   jload("E:/00 R Projects/00_jstats_test_data/datasets/text_columns_data.rds")
#       # creates text_columns_data in globalenv
#
# Re-runnable: the script silently overwrites prior output. Re-sourcing in
# the same session is safe.
#
# REPRODUCIBILITY
# ---------------
# set.seed() once at the top. Re-running produces identical data.
#
# =============================================================================


# --- Setup -------------------------------------------------------------------

# 1. jstats must be loaded (load_all() during dev OR library() for
#    installed). Check by looking for jsave / jload functions.
if (!exists("jsave", mode = "function") ||
    !exists("jload", mode = "function")) {
  stop(
    "jsave()/jload() not found. Load jstats first:\n",
    "  devtools::load_all()      # development\n",
    "  library(jstats)   # installed",
    call. = FALSE
  )
}

# 2. Locations (S224 pattern). The ONLY place paths live: on a folder move,
#    edit here and nothing else.
TEST_DATA_ROOT <- "E:/00 R Projects/00_jstats_test_data"
DATASETS_DIR   <- file.path(TEST_DATA_ROOT, "datasets")

# 3. Reproducibility.
set.seed(20260818)

n <- 80L


# --- 1. Spine ----------------------------------------------------------------

id <- seq_len(n)


# --- 2. Status: clean automatic-mode column ----------------------------------
# Three categories, deliberately supplied in NON-alphabetical prevalence
# order so the alphabetical assignment listing visibly reorders them
# (Bail=1, Parole=2, Remand=3).

Status <- sample(c("Parole", "Bail", "Remand"), n, replace = TRUE,
                 prob = c(0.45, 0.35, 0.20))


# --- 3. Outcome: words + blanks ----------------------------------------------
# Exactly 6 blank cells, fixed positions, so counts in the blank notes are
# stable across runs and quotable in Expected blocks.

Outcome <- sample(c("Reoffended", "No reoffence"), n, replace = TRUE,
                  prob = c(0.4, 0.6))
Outcome[c(7L, 19L, 33L, 48L, 61L, 74L)] <- ""


# --- 4. ReasonDeclined: the quoting column -----------------------------------
# One apostrophe word, one embedded-semicolon word, two plain words. The
# semicolon word REQUIRES the quoted form in a map; the apostrophe word
# parses unquoted under the S238 token-start quote rule.

ReasonDeclined <- sample(
  c("Refused", "Don't know", "Not applicable; other", "No answer"),
  n, replace = TRUE, prob = c(0.35, 0.30, 0.15, 0.20))


# --- 5. SupervisionType: outer spaces ----------------------------------------
# Two categories; a fixed subset of cells wears a leading or trailing
# space. Trimming reunites them (Community, Custody), and the trim notes
# report exactly 9 affected cells.

SupervisionType <- sample(c("Community", "Custody"), n, replace = TRUE,
                          prob = c(0.6, 0.4))
SupervisionType[c(3L, 11L, 26L)]       <- paste0(" ", SupervisionType[c(3L, 11L, 26L)])
SupervisionType[c(38L, 52L, 67L)]      <- paste0(SupervisionType[c(38L, 52L, 67L)], " ")
SupervisionType[c(14L, 44L, 71L)]      <- paste0(" ", SupervisionType[c(14L, 44L, 71L)], " ")


# --- 6. AgeText: pure numbers-as-text ----------------------------------------

AgeText <- as.character(sample(19:64, n, replace = TRUE))


# --- 7. AgeAtRelease: the poisoned column ------------------------------------
# Numbers + "-99" sentinels + word codes + blanks, all in one character
# column -- the shape of a delivered administrative file. Fixed
# positions again for stable counts: 5 x "-99", 4 x "Refused",
# 3 x "Not stated", 3 x blank, 65 x true ages.

AgeAtRelease <- as.character(sample(18:71, n, replace = TRUE))
AgeAtRelease[c(5L, 21L, 40L, 58L, 77L)] <- "-99"
AgeAtRelease[c(9L, 30L, 49L, 66L)]      <- "Refused"
AgeAtRelease[c(13L, 36L, 70L)]          <- "Not stated"
AgeAtRelease[c(24L, 53L, 79L)]          <- ""


# --- 8. The Qualtrics pair: one latent response, two export shapes -----------

likert_text <- c("Strongly disagree", "Disagree",
                 "Neither agree nor disagree", "Agree", "Strongly agree")
latent <- sample(1:5, n, replace = TRUE, prob = c(0.08, 0.17, 0.25, 0.32, 0.18))

Q_AgreeText <- likert_text[latent]      # choice-text export
Q_AgreeNum  <- as.character(latent)     # numeric export, poisoned to text


# --- 9. Assemble and save ----------------------------------------------------

text_columns_data <- data.frame(
  id              = id,
  Status          = Status,
  Outcome         = Outcome,
  ReasonDeclined  = ReasonDeclined,
  SupervisionType = SupervisionType,
  AgeText         = AgeText,
  AgeAtRelease    = AgeAtRelease,
  Q_AgreeText     = Q_AgreeText,
  Q_AgreeNum      = Q_AgreeNum,
  stringsAsFactors = FALSE
)

jsave(text_columns_data,
      file.path(DATASETS_DIR, "text_columns_data.rds"),
      overwrite = TRUE)

cat("text_columns_data built: ", nrow(text_columns_data), " cases, ",
    ncol(text_columns_data), " columns.\n", sep = "")
cat("Saved to: ", file.path(DATASETS_DIR, "text_columns_data.rds"), "\n",
    sep = "")
