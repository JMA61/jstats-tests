# =============================================================================
# GENERATOR: generators/clinic_data_generator.R
# Home:      E:/00 R Projects/00_jstats_test_data/generators/   (canonical;
#            the project KB holds a reference copy per the capacity rules)
# Output:    <PKG_ROOT>/data/clinic.rda               (shipped, lazy-loaded)
#            <DATASETS_DIR>/clinic.rds                (derived fixture copy)
# Dataset:   clinic  --  70 cases, 16 columns
# Author:    Jeff Ackerman, June 2026  (S224: absolute-path constants)
# =============================================================================
#
# REGENERATION IS A COUPLED EVENT. This script rebuilds the SHIPPED dataset;
# changes ripple into roxygen @examples (jdeclare_missing's MoodRating demo),
# guide passages, and book material. Fixture needs belong in a NEW generator
# in this folder, not in edits here.
#
# PURPOSE
# -------
# `clinic` is the package's SECOND shipped example dataset: a deliberately
# messy mental-health & wellbeing intervention sample, independent of
# `community`. Where `community` is the clean default, `clinic` is the
# declare-and-clean sandbox -- it carries the undeclared missing-value codes,
# the stripped labels, and the imperfect scale items that the data-cleaning
# teaching beats need, so a routine jload("community") no longer fires the
# suspected-codes scan. The columns echo `community`'s pedagogical structure
# in psychology clothing (a buffering interaction, a null variable, non-
# overlapping missingness, a recode dichotomy, a clean logistic DV, a labelled
# categorical, a dirty single item, and a five-item battery) so the two
# datasets teach the same skills on different content.
#
# COLUMN SLATE (16)
# -----------------
#   ClientID        character ID ("C001"..)
#   Stress          0-40 perceived-stress score, SPSS-form UDMs (-99/-98)
#   SocialSupport   0-24 social-support score, clean (interaction partner)
#   SleepHours      nightly sleep hours, SPSS-form UDMs (-99/-98), on cells
#                   that do NOT overlap Stress's -> listwise N drops further
#   Flourishing       clean 0-100 DV; carries a Stress x SocialSupport interaction
#   ScreenTime      clean daily screen hours; ~.05 with everything (null demo)
#   PriorTherapy    1/2 labelled dichotomy (recode to 0/1 before jlogistic DV)
#   SoughtHelp      0/1 labelled dichotomy (clean -- direct jlogistic DV)
#   Medication      0/1 labelled dichotomy, SPSS-form UDM (-99 Refused)
#   Condition       4-level labelled categorical (Control/CBT/Mindfulness/
#                   Support group); modest effect on Flourishing
#   MoodRating      1-10 integer arriving "dirty": literal -99/-98 codes with
#                   NO missing-value declaration (the jdeclare_missing demo)
#   Anxiety1-5      5-point Likert battery, ONE problem per item:
#                     1  reverse-keyed (" R" label; jalpha flags it, you reverse-code)
#                     2  undeclared UDM (-99/-98 present, NOT declared)
#                     3  value labels stripped on import (plain numeric)
#                     4  properly-declared UDM (clean contrast to item 2)
#                     5  weakly loaded (jalpha drop candidate)
#
# CORRELATION SPINE  (realized values at the locked seed; see verification tail)
# -----------------------------------------------------------------------------
#   Stress        <-> SocialSupport   mild negative
#   Stress        <-> Flourishing       negative
#   SocialSupport <-> Flourishing       positive
#   Stress x SocialSupport interaction on Flourishing: significant (buffering)
#   ScreenTime: deliberately near-independent (|r| <= ~.10) for a null result
# All moderate; nothing high enough to raise multicollinearity in jlm/jlogistic.
#
# UDM / MISSING-VALUE COVERAGE
# ----------------------------
#   Stress, SleepHours    SPSS-form UDMs on NON-OVERLAPPING cells, so a model
#                         using both drops more cases than either alone.
#   Medication            SPSS-form UDM on a dichotomy.
#   Anxiety2              literal -99/-98 with NO declaration (in-battery scan
#                         trigger); Anxiety4 carries the same codes DECLARED.
#   MoodRating            literal -99/-98 codes with NO declaration (the dirty-
#                         arrival single item; the jdeclare_missing before/after).
#   Anxiety2 + MoodRating are the two suspected-codes-scan triggers on load.
#
# FORMAT
# ------
# .rda ONLY. No .sav/.dta/.xlsx companions: those formats would faithfully
# PRESERVE the very missing-value flags whose ABSENCE is the teaching point.
# The dirtiness lives in the in-memory object; jload("clinic") presents it.
#
# HOW TO USE
# ----------
# Runs from ANY working directory (all paths are absolute, via the constants
# below). jstats must be loaded (S224: the datasets/ fixture copy is written
# with jsave() -- devtools::load_all() during development OR library(jstats)
# for the installed version, not both in the same session):
#
#   source("E:/00 R Projects/00_jstats_test_data/generators/clinic_data_generator.R")
#
# Reproducible: set.seed() once at the top; re-running produces identical data.
#
# RNG NOTE: random draws occur in a FIXED order (spine latents, then observed-
# column UDM/binomial draws, then the battery). Any column added later must
# draw strictly AFTER the existing draws, or the locked data shifts.
# =============================================================================


# --- Setup -------------------------------------------------------------------

for (.pkg in c("haven", "labelled")) {
  if (!requireNamespace(.pkg, quietly = TRUE)) {
    stop("Package '", .pkg, "' is required but not installed.", call. = FALSE)
  }
}
rm(.pkg)

# jstats must be loaded (jsave / jload are dogfooded for the datasets/
# fixture copy below).
if (!exists("jsave", mode = "function") ||
    !exists("jload", mode = "function")) {
  stop("jsave()/jload() not found. Load jstats first:\n",
       "  devtools::load_all()      # development\n",
       "  library(jstats)   # installed", call. = FALSE)
}

# --- Locations (S224) --------------------------------------------------------
# The ONLY place paths live. On a folder move, edit here and nothing else.
PKG_ROOT       <- "E:/00 R Projects/jstats"                # package project
TEST_DATA_ROOT <- "E:/00 R Projects/00_jstats_test_data"   # test-data folder
DATASETS_DIR   <- file.path(TEST_DATA_ROOT, "datasets")

set.seed(20260614L)
n <- 70L


# --- 1. Spine: independent latent drivers ------------------------------------

z_support       <- rnorm(n)
condition_codes <- sample.int(4, n, replace = TRUE)
condition_eff   <- c(-0.18, 0.30, 0.22, 0.08)[condition_codes]   # modest tx effect

# Stress latent: mild negative dependence on support (more support -> less stress)
stress_z <- -0.30 * z_support + sqrt(1 - 0.30^2) * rnorm(n)

# Sleep latent: mild negative dependence on stress
sleep_z  <- -0.25 * stress_z + sqrt(1 - 0.25^2) * rnorm(n)


# --- 2. Flourishing (clean 0-100 DV with a Stress x SocialSupport interaction) -

# Standardized continuous drivers. Observed Stress / SocialSupport are affine
# in these latents, so jlm(Flourishing ~ Stress * SocialSupport) recovers the
# buffering interaction (significant at the locked seed; see verification tail).
zs <- as.numeric(scale(stress_z))
zp <- as.numeric(scale(z_support))

wb_latent <- -0.34 * zs + 0.30 * zp + 0.32 * (zs * zp) +
             condition_eff + sqrt(0.55) * rnorm(n)
Flourishing <- as.integer(pmin(pmax(round(50 + 15 * wb_latent), 0), 100))


# --- 3. ScreenTime (clean hours; near-independent null variable) -------------

screen_z   <- 0.05 * z_support + sqrt(1 - 0.05^2) * rnorm(n)
ScreenTime <- round(pmin(pmax(4 + 2 * screen_z, 0), 12), 1)


# --- 4. Stress (0-40 score, SPSS-form UDMs) ----------------------------------

stress_obs  <- as.integer(pmin(pmax(round(16 + 7 * stress_z), 0), 40))
stress_udm  <- sample.int(n, 4L)
stress_full <- stress_obs
stress_full[stress_udm[1:2]] <- -99L
stress_full[stress_udm[3:4]] <- -98L
Stress <- haven::labelled_spss(
  stress_full,
  labels    = c("Refused" = -99, "Don't know" = -98),
  na_values = c(-99, -98),
  label     = "Perceived stress (0-40)"
)


# --- 5. SleepHours (nightly hours, SPSS-form UDMs on NON-overlapping cells) ---

sleep_obs  <- round(pmin(pmax(7 + 1.3 * sleep_z, 3), 11), 1)
sleep_udm  <- sample(setdiff(seq_len(n), stress_udm), 4L)
sleep_full <- sleep_obs
sleep_full[sleep_udm[1:2]] <- -99
sleep_full[sleep_udm[3:4]] <- -98
SleepHours <- haven::labelled_spss(
  sleep_full,
  labels    = c("Refused" = -99, "Don't know" = -98),
  na_values = c(-99, -98),
  label     = "Average nightly sleep (hours)"
)


# --- 6. SocialSupport (0-24 score, clean) ------------------------------------

SocialSupport <- as.integer(pmin(pmax(round(14 + 5 * z_support), 0), 24))


# --- 7. Dichotomies ----------------------------------------------------------

# PriorTherapy: 1/2 (Yes/No), the SPSS-import convention -- recode to 0/1.
pt <- rbinom(n, 1, plogis(-0.3 + 0.5 * zs))
PriorTherapy <- haven::labelled(
  ifelse(pt == 1, 1L, 2L),
  labels = c(Yes = 1, No = 2),
  label  = "Received therapy before the study"
)

# SoughtHelp: 0/1, clean -- direct jlogistic DV. Stress+ and Support+ raise it.
sh <- rbinom(n, 1, plogis(-0.4 + 0.6 * zs + 0.4 * zp))
SoughtHelp <- haven::labelled(
  sh,
  labels = c(No = 0, Yes = 1),
  label  = "Sought professional help during study"
)

# Medication: 0/1 with an SPSS-form UDM (-99 Refused) on 5 cells.
med     <- rbinom(n, 1, plogis(-0.5 + 0.4 * zs))
med_udm <- sample.int(n, 5L)
med[med_udm] <- -99L
Medication <- haven::labelled_spss(
  med,
  labels    = c(No = 0, Yes = 1, "Refused" = -99),
  na_values = -99,
  label     = "Currently taking medication"
)


# --- 8. Condition (4-level labelled categorical) -----------------------------

Condition <- haven::labelled(
  condition_codes,
  labels = c(Control = 1, CBT = 2, Mindfulness = 3, "Support group" = 4),
  label  = "Treatment condition"
)


# --- 9. MoodRating (1-10; UNDECLARED -99/-98 codes) --------------------------

# The "dirty arrival" single item: literal -99 (Refused) / -98 (Don't know)
# sit as ordinary numbers with NO missing-value declaration -- the state after
# a CSV/Excel import. The jdeclare_missing() demonstration variable: summary
# statistics are visibly poisoned until the codes are declared. Plain integer.
mood_latent <- 0.55 * wb_latent + sqrt(1 - 0.55^2) * rnorm(n)
mood_vals   <- as.integer(pmin(pmax(round(5.5 + 1.9 * mood_latent), 1L), 10L))
mood_udm    <- sample.int(n, 7L)
mood_vals[mood_udm[1:4]] <- -99L
mood_vals[mood_udm[5:7]] <- -98L
MoodRating  <- mood_vals


# --- 10. Anxiety scale (5 Likert items; one problem per item) ----------------

# Latent driven by Stress. Item 1 reverse-keyed (generated from -latent); item
# 5 weakly loaded (high item noise -> jalpha drop candidate).
anx_latent <- 0.60 * zs + sqrt(1 - 0.60^2) * rnorm(n)

.likert_item <- function(latent, noise_sd)
  as.integer(pmin(pmax(round(latent + rnorm(n, 0, noise_sd) + 3), 1L), 5L))

a1 <- .likert_item(-anx_latent, 0.75)   # reverse-keyed
a2 <- .likert_item( anx_latent, 0.75)   # undeclared UDM
a3 <- .likert_item( anx_latent, 0.80)   # labels stripped on import
a4 <- .likert_item( anx_latent, 0.80)   # declared UDM
a5 <- .likert_item( anx_latent, 1.85)   # weak -> drop candidate

likert_labels <- c("Not at all" = 1, "A little" = 2, "Moderately" = 3,
                   "Quite a bit" = 4, "Extremely" = 5)
anx_udm       <- c("Refused" = -99, "Don't know" = -98)

# Item 1: reverse-keyed, clean. The " R" suffix is a reader cue, not something
# jalpha reads; jalpha flags the item by its negative item-total r.
Anxiety1 <- haven::labelled(a1, labels = likert_labels,
  label = "I felt calm and relaxed. R")

# Item 2: undeclared UDM -- codes present, NO na_values (in-battery scan trigger).
a2f    <- a2
a2_udm <- sample.int(n, 6L)
a2f[a2_udm[1:3]] <- -99L
a2f[a2_udm[4:6]] <- -98L
Anxiety2 <- haven::labelled(a2f, labels = likert_labels,
  label = "I worried about many different things.")

# Item 3: value labels stripped on import -- plain numeric, no value labels.
Anxiety3 <- a3

# Item 4: properly-declared UDM (clean contrast to item 2).
a4f    <- a4
a4_udm <- sample.int(n, 6L)
a4f[a4_udm[1:3]] <- -99L
a4f[a4_udm[4:6]] <- -98L
Anxiety4 <- haven::labelled_spss(a4f, labels = c(likert_labels, anx_udm),
  na_values = c(-99, -98),
  label = "I had trouble controlling my worry.")

# Item 5: weakly loaded, clean -- the jalpha drop candidate.
Anxiety5 <- haven::labelled(a5, labels = likert_labels,
  label = "I felt restless or on edge.")


# --- 11. Assemble ------------------------------------------------------------

clinic <- data.frame(
  ClientID      = sprintf("C%03d", seq_len(n)),
  Stress        = Stress,
  SocialSupport = SocialSupport,
  SleepHours    = SleepHours,
  Flourishing     = Flourishing,
  ScreenTime    = ScreenTime,
  PriorTherapy  = PriorTherapy,
  SoughtHelp    = SoughtHelp,
  Medication    = Medication,
  Condition     = Condition,
  MoodRating    = MoodRating,
  Anxiety1      = Anxiety1,
  Anxiety2      = Anxiety2,
  Anxiety3      = Anxiety3,
  Anxiety4      = Anxiety4,
  Anxiety5      = Anxiety5,
  stringsAsFactors = FALSE,
  check.names      = FALSE
)

# Variable labels for the plain (unlabelled-class) columns.
labelled::var_label(clinic$ClientID)      <- "Client ID"
labelled::var_label(clinic$SocialSupport) <- "Perceived social support (0-24)"
labelled::var_label(clinic$Flourishing)     <- "Flourishing score (0-100)"
labelled::var_label(clinic$ScreenTime)    <- "Daily screen time (hours)"
labelled::var_label(clinic$MoodRating)    <- "Mood rating (1-10)"
labelled::var_label(clinic$Anxiety3)      <- "I felt afraid for no clear reason."


# --- 12. Materialize ---------------------------------------------------------

pkg_data <- file.path(PKG_ROOT, "data")
if (!dir.exists(pkg_data)) dir.create(pkg_data, recursive = TRUE)
save(clinic, file = file.path(pkg_data, "clinic.rda"), version = 2)

loaded_env <- new.env()
load(file.path(pkg_data, "clinic.rda"), envir = loaded_env)
stopifnot(identical(clinic, loaded_env$clinic))

# Derived fixture copy for the standing test-data folder (jsave / jload
# dogfooded). Regression scripts jload() this .rds so they never touch the
# package tree. Derived, never edited there; a re-run refreshes it.
if (!dir.exists(DATASETS_DIR)) dir.create(DATASETS_DIR, recursive = TRUE)
jsave(clinic, file.path(DATASETS_DIR, "clinic.rds"), overwrite = TRUE)
jload(file.path(DATASETS_DIR, "clinic.rds"), name = "rt_fixture",
      overwrite = TRUE)
stopifnot(
  identical(dim(clinic),   dim(rt_fixture)),
  identical(names(clinic), names(rt_fixture)),
  inherits(rt_fixture$Stress, "haven_labelled_spss")
)


# --- 13. Design confirmation (printed) ---------------------------------------

cat("\nGenerated: clinic  (N =", nrow(clinic),
    " columns =", ncol(clinic), ")\n")
cat("  <PKG_ROOT>/data/clinic.rda\n",
    " <DATASETS_DIR>/clinic.rds\n", sep = "")

# Spine + interaction on the analysis view (UDMs -> NA).
av <- data.frame(
  Stress        = haven::zap_missing(clinic$Stress),
  SocialSupport = clinic$SocialSupport,
  SleepHours    = haven::zap_missing(clinic$SleepHours),
  Flourishing     = clinic$Flourishing,
  ScreenTime    = clinic$ScreenTime
)
cat("\nSpine correlations (UDMs as NA):\n")
print(round(cor(av, use = "pairwise.complete.obs"), 3))

m_int <- lm(Flourishing ~ Stress * SocialSupport, data = av)
cat(sprintf("\nStress x SocialSupport interaction: p = %.4f, listwise N = %d\n",
            summary(m_int)$coefficients["Stress:SocialSupport", "Pr(>|t|)"],
            sum(stats::complete.cases(av[c("Flourishing","Stress","SocialSupport")]))))
cat("  coefs: Stress = ", sprintf("%.3f", coef(m_int)["Stress"]),
    ", SocialSupport = ", sprintf("%.3f", coef(m_int)["SocialSupport"]),
    ", interaction = ", sprintf("%.4f", coef(m_int)["Stress:SocialSupport"]), "\n", sep = "")
cat(sprintf("Listwise N for Flourishing ~ Stress + SleepHours: %d (of %d)\n",
            sum(stats::complete.cases(av[c("Flourishing","Stress","SleepHours")])), n))

# Condition effect on Flourishing.
m_cond <- lm(Flourishing ~ factor(Condition), data = data.frame(
  Flourishing = clinic$Flourishing, Condition = as.integer(clinic$Condition)))
cat(sprintf("\nCondition -> Flourishing: F = %.2f, p = %.4f\n",
            summary(m_cond)$fstatistic[1],
            pf(summary(m_cond)$fstatistic[1], summary(m_cond)$fstatistic[2],
               summary(m_cond)$fstatistic[3], lower.tail = FALSE)))
cond_means <- tapply(clinic$Flourishing, as.integer(clinic$Condition), mean)
cat("  cell means:", paste(sprintf("%.1f", cond_means), collapse = " "),
    "(Control/CBT/Mindfulness/Support)\n")

# Logistic DV check.
m_log <- glm(SoughtHelp ~ Stress + SocialSupport, family = binomial,
             data = data.frame(SoughtHelp = as.integer(clinic$SoughtHelp),
                               Stress = av$Stress, SocialSupport = av$SocialSupport))
cat("\nSoughtHelp ~ Stress + SocialSupport (logit coefs):",
    paste(sprintf("%.3f", coef(m_log)[-1]), collapse = " "),
    sprintf("(events: %d of %d)\n", sum(as.integer(clinic$SoughtHelp)), n))

# Anxiety battery: reverse item 1, UDMs -> NA, alpha + item-total r.
anx <- cbind(
  Anxiety1 = 6 - a1,                              # reverse-keyed -> aligned
  Anxiety2 = ifelse(a2f %in% c(-99, -98), NA, a2f),
  Anxiety3 = a3,
  Anxiety4 = ifelse(a4f %in% c(-99, -98), NA, a4f),
  Anxiety5 = a5
)
.alpha <- function(M) {
  k <- ncol(M)
  (k / (k - 1)) * (1 - sum(apply(M, 2, var, na.rm = TRUE)) /
                       var(rowSums(M), na.rm = TRUE))
}
it <- sapply(1:5, function(j)
  cor(anx[, j], rowSums(anx[, -j]), use = "complete.obs"))
cat(sprintf("\nAnxiety alpha (item 1 reversed): 5 items %.3f -> drop item 5 %.3f\n",
            .alpha(anx), .alpha(anx[, 1:4])))
cat("Item-total r:", paste(sprintf("%.2f", it), collapse = " "),
    " (Anxiety5 is the drop candidate)\n")

# Scan triggers + MoodRating dirty cells.
cat(sprintf("\nMoodRating dirty cells: %d x -99, %d x -98 (UNDECLARED)\n",
            sum(clinic$MoodRating == -99), sum(clinic$MoodRating == -98)))
mood_clean <- clinic$MoodRating[clinic$MoodRating > 0]
cat(sprintf("  mean with codes in: %.2f   mean once excluded: %.2f\n",
            mean(clinic$MoodRating), mean(mood_clean)))
cat(sprintf("Anxiety2 undeclared cells: %d x -99, %d x -98\n",
            sum(a2f == -99), sum(a2f == -98)))
cat(sprintf("Anxiety4 declared cells:   %d x -99, %d x -98\n\n",
            sum(a4f == -99), sum(a4f == -98)))

# Class spot-check (data.frame must preserve haven classes).
cat("Class check: Stress", class(clinic$Stress)[1],
    "| Anxiety2", class(clinic$Anxiety2)[1],
    "| Anxiety3", class(clinic$Anxiety3)[1],
    "| Anxiety4", class(clinic$Anxiety4)[1], "\n\n")
