# =============================================================================
# GENERATOR: generators/community_phase2_data_generator.R
# Home:      E:/00 R Projects/00_jstats_test_data/generators/   (canonical;
#            the project KB holds a reference copy per the capacity rules)
# Output:    <DATASETS_DIR>/community_phase2_data.rds   (200 cases, 52 columns)
# Phase:     Phase 2 of the four-phase community pipeline (S72 relabel)
#            ph1 = community_phase1_data   (renamed from test_data; metadata-stress)
#            ph2 = community_phase2_data   (THIS FILE; realistic-concept variant matrix)
#            ph3 = dev/UX test bench       (testing-code layer over ph2; not shipped)
#            ph4 = community               (the SHIPPED dataset; 103 cases since S179)
# Author:    Jeff Ackerman, May 2026  (S224: absolute-path constants; stale
#            three-phase label fixed per the S72 four-phase relabel)
# =============================================================================
#
# PURPOSE
# -------
# Phase-2 dataset: realistic survey concepts (Age, Income, Gender, Education,
# Region, Environment scale, ...) with each concept appearing in multiple
# metadata/structural variants so analysis-function output can be inspected
# across types in everyday workflows. Not shipped. After ph2 testing settles
# which variants belong in the published example dataset, ph3 (community)
# trims to single-variant-per-concept at ~100 cases.
#
# UDM/NA TEST COVERAGE  (Session 37 expansion)
# --------------------------------------------
# Several columns are intentionally constructed to exercise the package's
# missing-value display and processing paths. Variants for the same
# underlying data:
#
#   Age_categorical_spss      SPSS-form UDMs (na_values declarations).
#                             Renamed from Age_categorical_haven in this
#                             revision. Baseline for fixes (a) row
#                             ordering and (c) percent-column math.
#   Age_categorical_stata     Stata-form UDMs (tagged_na lowercase
#                             ".a" Refused, ".b" Don't know). Exercises
#                             fix (d) per-tag rendering in jfreq.
#   Age_categorical_sas       SAS-form UDMs (tagged_na uppercase
#                             ".A" Refused, ".B" Don't know). Used by
#                             the mixed-case .a/.A export spot-check.
#   Age_categorical_range     SPSS-form with both na_range and na_values.
#                             Exercises the range-row rendering path in
#                             jfreq's Missing block.
#
#   Income_categorical_spss   SPSS-form (renamed from _haven).
#   Income_categorical_partial   SPSS-form where one UDM code is declared
#                                via na_values but NOT given a val_label.
#                                Exercises fix (b) value-as-label artefact
#                                in UDM-row context and fix (e) "(no label)"
#                                rendering format.
#
#   Education_partial         Plain haven_labelled where one valid code
#                             that appears in the data has no val_label
#                             entry. Exercises fix (b) value-as-label
#                             artefact in *valid*-row context (the
#                             "38: 38" pattern from haven::as_factor's
#                             fallback).
#
#   SatisfactionScore_with_udm   Continuous with SPSS-form UDM codes.
#                                Exercises UDM handling on a continuous
#                                variable (jdesc CPS, Cross-cutting 5
#                                auto-conversion) rather than categorical.
#
# Reference: the four-fix bundle from the Session 25 Decision 7 walk-through
# in JStats_Missing_Values_Reference.txt, plus fix (e) row format alignment:
#   (a) Row ordering         — Missing block at bottom (SPSS/Stata convention)
#   (b) Value-as-label       — "(no label)" or bare-code rendering when
#                              no val_label is present
#   (c) Percent-column math  — UDMs excluded from Valid %
#   (d) Per-tag rendering    — Stata-form per-tag rows in jfreq Missing block
#   (e) Row format alignment — `code ["label"]` matching the load-time
#                              narrative format from .jst_format_udm_narrative
#
# TYPE & EDGE-CASE COVERAGE  (Session 46 expansion)
# -------------------------------------------------
# Seventeen columns added to exercise jdesc()'s type classifier
# (.jst_classify_desc_var) and the analysis functions' handling of
# degenerate columns. These have no spine correlations; they are
# independent type/edge probes.
#
#   Date/time concept (jdesc refuses these; future date function will use them):
#     InterviewDate          Date.
#     InterviewTimestamp     POSIXct.
#     InterviewTimestamp_lt  POSIXlt. Assigned POST-ASSEMBLY -- data.frame()
#                            silently coerces POSIXlt to POSIXct, so it can
#                            only retain its class via $<- after the frame
#                            is built. Survives the .rds round-trip.
#     FollowupGap            difftime (days).
#
#   Numbers-as-text (jdesc summarizes these WITH a "stored as text" note):
#     Age_text               as.character(Age_continuous); clean numeric
#                            strings plus NAs.
#     RespondentID_text      Zero-padded "0001".."0200" -- the "looks like an
#                            ID but coerces to a number" case; shows why the
#                            note matters.
#     Income_text_messy      Mostly numeric strings with a few "refused" /
#                            "n/a" / "" entries -- the partial-coercion path.
#
#   Other type variants:
#     Consented_logical      Logical, no missing (jdesc summarizes as 0/1).
#                            Veteran_logical already covers logical-with-NA.
#     Region_factor_num      factor with numeric levels "1".."4" (jdesc
#                            coerces and summarizes).
#     Complex_col            complex -- exercises the generic "other type"
#                            refusal in jdesc.
#
#   Degenerate / edge cases:
#     AllMissing_numeric     All NA (numeric). Summarized, but Min/Max/Mean
#                            degrade to Inf/-Inf/NaN with warnings.
#     AllMissing_character   All NA (character). Refused as text.
#     Constant_numeric       Zero variance (all 42). SD = 0; lm.fit's
#                            misleading "0 (non-NA) cases" trigger.
#     Constant_labelled      haven_labelled, one category present (zero
#                            variance categorical).
#     Constant_factor        Single-level factor.
#     Logical_constant       All TRUE (zero-variance logical).
#     SingleValue_numeric    One non-missing value, rest NA -> N = 1,
#                            SD undefined.
#
# BREAKING CHANGE FROM PRIOR REVISION
# -----------------------------------
# Columns renamed:  Age_categorical_haven    -> Age_categorical_spss
#                   Income_categorical_haven -> Income_categorical_spss
# The _spss suffix now denotes the UDM representation form (matching the
# new _stata and _sas variants), replacing the _haven suffix (which named
# the package rather than the form). Any test scripts or saved .rds files
# referencing the old names need updating. The companion file
# 400_TestJload_Phase2Data.R requires the rename.
#
# SPINE OF CORRELATIONS  (latent-z space; observed values may attenuate)
# ----------------------------------------------------------------------
#   Age          -> Income      r ~ .35
#   Education    -> Income      r ~ .40
#   Education    -> Environment r ~ .25
#   Gender       -> Environment r ~ .15
#   Region       -> Environment small categorical effect
#   Age          -> Children    r ~ .30
#   Income, Age  -> OwnsHome    logistic; OR ~ 1.5 per income SD
# Everything else: mild noise.
#
# HOW TO USE
# ----------
# Runs from ANY working directory (all paths are absolute, via the constants
# below). jstats must be loaded (devtools::load_all() during development OR
# library(jstats) for the installed version -- not both in the same session).
#
#   source("E:/00 R Projects/00_jstats_test_data/generators/community_phase2_data_generator.R")
#
# This writes <DATASETS_DIR>/community_phase2_data.rds. Load in any analysis
# script with
#
#   jload("E:/00 R Projects/00_jstats_test_data/datasets/community_phase2_data.rds")
#       # creates community_phase2_data in globalenv
#
# Re-runnable: every check below is non-destructive and the script silently
# overwrites prior output. Re-sourcing in the same session is safe.
#
# REPRODUCIBILITY
# ---------------
# set.seed() once at the top. Re-running produces identical data.
#
# =============================================================================


# --- Setup -------------------------------------------------------------------

# 1. Required packages (already jstats dependencies). These are
#    accessed via fully-qualified haven:: / labelled:: calls below, so we
#    only need them installed -- not attached. requireNamespace() is
#    idempotent: returns TRUE on re-runs without doing anything.
required_pkgs <- c("haven", "labelled")
for (.pkg in required_pkgs) {
  if (!requireNamespace(.pkg, quietly = TRUE)) {
    stop(
      "Package '", .pkg, "' is required but is not installed.\n",
      "  Install with: install.packages(\"", .pkg, "\")",
      call. = FALSE
    )
  }
}
rm(.pkg)

# 2. jstats must be loaded (load_all() during dev OR library() for
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

# 3. Locations (S224). The ONLY place paths live: on a folder move, edit
#    here and nothing else.
TEST_DATA_ROOT <- "E:/00 R Projects/00_jstats_test_data"
DATASETS_DIR   <- file.path(TEST_DATA_ROOT, "datasets")

# 4. Reproducibility.
set.seed(20260507)

n <- 200L


# --- 1. Spine: independent latent z-scores ----------------------------------

# z_age, z_edu drive everything continuous in the spine.
# gender_z is binary (0 = Male, 1 = Female latent).
# region_codes is a 4-category nominal driver for Environment scale.

z_age        <- rnorm(n)
z_edu        <- rnorm(n)
gender_z     <- rbinom(n, 1, 0.5)              # 0 = Male, 1 = Female
region_codes <- sample.int(4, n, replace = TRUE)


# --- 2. Age variants --------------------------------------------------------

# Age_continuous: range 16-75, centred ~38 with SD ~14. ~5% plain NA.
Age_continuous <- as.integer(pmin(pmax(round(38 + 14 * z_age), 16), 75))
age_na_idx     <- sample.int(n, round(n * 0.05))
Age_continuous[age_na_idx] <- NA_integer_

# Age_ordered: 5-level ordered factor cut from Age_continuous.
age_breaks <- c(0, 17.5, 25.5, 35.5, 50.5, Inf)
age_levels <- c("<18", "18-25", "26-35", "36-50", "51+")
Age_ordered <- factor(
  cut(Age_continuous, breaks = age_breaks, labels = age_levels, right = TRUE),
  levels  = age_levels,
  ordered = TRUE
)

# Base codes for the categorical Age variants (codes 1-5; NA where
# Age_continuous was NA). Used by the SPSS / Stata / SAS / range variants
# below.
age_cat_codes_base <- as.integer(cut(
  Age_continuous, breaks = age_breaks, labels = FALSE, right = TRUE
))

# UDM-cell positions shared across the SPSS, Stata, and SAS variants so the
# three are parallel views of the same data. ~3% combined UDMs
# (1.5% "Refused", 1.5% "Don't know").
age_non_na <- which(!is.na(age_cat_codes_base))
udm_n      <- round(n * 0.03)
udm_ix     <- sample(age_non_na, udm_n)
udm_a_ix   <- udm_ix[seq_len(udm_n %/% 2)]                    # "Refused" cells
udm_b_ix   <- udm_ix[(udm_n %/% 2 + 1):udm_n]                 # "Don't know" cells

# --- Age_categorical_spss (SPSS-form UDMs via na_values; renamed from
#     Age_categorical_haven) ------------------------------------------------
age_cat_codes_spss <- age_cat_codes_base
age_cat_codes_spss[udm_a_ix] <- -99L
age_cat_codes_spss[udm_b_ix] <- -98L

Age_categorical_spss <- haven::labelled_spss(
  age_cat_codes_spss,
  labels    = c("<18" = 1, "18-25" = 2, "26-35" = 3,
                "36-50" = 4, "51+" = 5,
                "Refused" = -99, "Don't know" = -98),
  na_values = c(-99, -98),
  label     = "Age category"
)

# --- Age_categorical_stata (Stata-form UDMs via tagged_na lowercase) ------
# Underlying vector cast to double so tagged_na values can be assigned.
age_cat_codes_stata <- as.numeric(age_cat_codes_base)
age_cat_codes_stata[udm_a_ix] <- haven::tagged_na("a")
age_cat_codes_stata[udm_b_ix] <- haven::tagged_na("b")

Age_categorical_stata <- haven::labelled(
  age_cat_codes_stata,
  labels = c("<18" = 1, "18-25" = 2, "26-35" = 3,
             "36-50" = 4, "51+" = 5,
             "Refused"    = haven::tagged_na("a"),
             "Don't know" = haven::tagged_na("b")),
  label  = "Age category (Stata-form UDMs)"
)

# --- Age_categorical_sas (SAS-form UDMs via tagged_na uppercase) ----------
age_cat_codes_sas <- as.numeric(age_cat_codes_base)
age_cat_codes_sas[udm_a_ix] <- haven::tagged_na("A")
age_cat_codes_sas[udm_b_ix] <- haven::tagged_na("B")

Age_categorical_sas <- haven::labelled(
  age_cat_codes_sas,
  labels = c("<18" = 1, "18-25" = 2, "26-35" = 3,
             "36-50" = 4, "51+" = 5,
             "Refused"    = haven::tagged_na("A"),
             "Don't know" = haven::tagged_na("B")),
  label  = "Age category (SAS-form UDMs)"
)

# --- Age_categorical_range (SPSS-form with na_range + na_values) ----------
# Independent UDM cells from the SPSS/Stata/SAS triple -- exercises the
# range declaration shape (uncommon but supported by SPSS and by the
# package's .jst_missing_info abstraction).
age_cat_codes_range <- age_cat_codes_base
range_n  <- round(n * 0.04)
range_ix <- sample(age_non_na, range_n)
# Spread the range-UDM cells across values inside the declared range -99..-90
range_vals <- sample(-99:-90, range_n, replace = TRUE)
age_cat_codes_range[range_ix] <- range_vals
# Plus a small number of cells with a discrete UDM (-1, declared via na_values)
discrete_pool <- setdiff(age_non_na, range_ix)
discrete_ix   <- sample(discrete_pool, 4L)
age_cat_codes_range[discrete_ix] <- -1L

Age_categorical_range <- haven::labelled_spss(
  age_cat_codes_range,
  labels    = c("<18" = 1, "18-25" = 2, "26-35" = 3,
                "36-50" = 4, "51+" = 5,
                "Outlier" = -1),
  na_values = -1,
  na_range  = c(-99, -90),
  label     = "Age category (range UDM)"
)

# --- Age_dichotomy (1 = Juvenile (<18), 0 = Adult) ------------------------
Age_dichotomy <- ifelse(Age_continuous < 18, 1L, 0L)


# --- 3. Income variants -----------------------------------------------------

# Income latent z-score: f(z_age, z_edu) + noise. Calibrated to give
# r(z_age, income_z) ~ .35 and r(z_edu, income_z) ~ .40 in z-space; the
# observed Pearson correlations on the dollar scale will be slightly
# attenuated by the log-normal transform.
b_age_inc <- 0.35
b_edu_inc <- 0.40
sigma_inc <- sqrt(1 - b_age_inc^2 - b_edu_inc^2)
income_z  <- b_age_inc * z_age + b_edu_inc * z_edu + sigma_inc * rnorm(n)

# Income_continuous: log-normal mapped to USD 0-200000.
Income_continuous <- as.integer(pmin(
  pmax(round(exp(11.0 + 0.5 * income_z)), 0L),
  200000L
))

# Income_ordered: 5 brackets as ordered factor.
income_breaks <- c(-1, 25000, 50000, 75000, 100000, Inf)
income_levels <- c("0-25k", "25-50k", "50-75k", "75-100k", "100k+")
Income_ordered <- factor(
  cut(Income_continuous, breaks = income_breaks,
      labels = income_levels, right = TRUE),
  levels  = income_levels,
  ordered = TRUE
)

# Base codes 1-5 (same brackets) with UDMs (~5%). Shared by the SPSS and
# partial variants -- they're parallel views of the same data, differing
# only in label completeness.
inc_cat_codes <- as.integer(cut(
  Income_continuous, breaks = income_breaks, labels = FALSE, right = TRUE
))
udm_n_inc  <- round(n * 0.05)
udm_ix_inc <- sample.int(n, udm_n_inc)
inc_cat_codes[udm_ix_inc[seq_len(udm_n_inc %/% 2)]]            <- -99L
inc_cat_codes[udm_ix_inc[(udm_n_inc %/% 2 + 1):udm_n_inc]]     <- -98L

# --- Income_categorical_spss (renamed from Income_categorical_haven) -----
Income_categorical_spss <- haven::labelled_spss(
  inc_cat_codes,
  labels    = c("0-25k" = 1, "25-50k" = 2, "50-75k" = 3,
                "75-100k" = 4, "100k+" = 5,
                "Refused" = -99, "Don't know" = -98),
  na_values = c(-99, -98),
  label     = "Income bracket"
)

# --- Income_categorical_partial -------------------------------------------
# Same codes as Income_categorical_spss but only one UDM code carries a
# val_label. The -98 cells are declared as UDMs via na_values but have no
# entry in `labels`, so jfreq's Missing block should render the -98 row as
# `-98 (no label)` per the locked row-format convention.
Income_categorical_partial <- haven::labelled_spss(
  inc_cat_codes,
  labels    = c("0-25k" = 1, "25-50k" = 2, "50-75k" = 3,
                "75-100k" = 4, "100k+" = 5,
                "Refused" = -99),     # -98 declared via na_values but unlabelled
  na_values = c(-99, -98),
  label     = "Income bracket (partial UDM labels)"
)

# Income_log: log of the continuous version (+1 to avoid log(0)).
Income_log <- log(Income_continuous + 1)


# --- 4. Gender variants -----------------------------------------------------

# haven coding follows SampleData: 1 = Male, 2 = Female.
Gender_haven_codes <- ifelse(gender_z == 0, 1L, 2L)
Gender_haven       <- haven::labelled(
  Gender_haven_codes,
  labels = c(Male = 1, Female = 2),
  label  = "Gender"
)

# 0/1 plain numeric: 0 = Male, 1 = Female (recoded form, ready for jlogistic).
Gender_01 <- as.integer(gender_z)

# Unordered factor.
Gender_factor <- factor(
  ifelse(gender_z == 0, "Male", "Female"),
  levels = c("Male", "Female")
)

# Plain character.
Gender_character <- ifelse(gender_z == 0, "Male", "Female")


# --- 5. Education variants --------------------------------------------------

# Cut z_edu into 5 levels using fixed cumulative probabilities (not empirical
# quantiles, which would distort the spine correlations).
edu_cuts <- c(-Inf, qnorm(c(0.20, 0.45, 0.70, 0.90)), Inf)
edu_codes <- as.integer(cut(z_edu, breaks = edu_cuts, labels = FALSE))

# Education_haven: full val_labels for all five codes.
Education_haven <- haven::labelled(
  edu_codes,
  labels = c("Some HS" = 1, "HS grad" = 2, "Some college" = 3,
             "Bachelor" = 4, "Graduate" = 5),
  label  = "Highest level of education"
)

# Education_partial: same codes but val_labels omit code 3 ("Some college")
# even though the value appears in the data. Exercises fix (b) in *valid*-
# row context -- haven::as_factor's fallback turns the unlabelled code 3
# into the string "3", producing the "3: 3" value-as-label artefact in
# jfreq's current Valid section.
Education_partial <- haven::labelled(
  edu_codes,
  labels = c("Some HS" = 1, "HS grad" = 2,
             "Bachelor" = 4, "Graduate" = 5),  # code 3 deliberately unlabelled
  label  = "Highest level of education (label gap)"
)


# --- 6. OwnsHome (logistic outcome) ----------------------------------------

# OR ~ 1.5 per income SD => slope on income_z = log(1.5) ~ 0.405.
# Smaller positive Age effect; intercept tuned for ~50% Yes overall.
b_inc_oh <- log(1.5)
b_age_oh <- 0.30
ownhome_logit <- b_inc_oh * income_z + b_age_oh * z_age
ownhome_yes   <- rbinom(n, 1, plogis(ownhome_logit)) == 1

# Coded 1 = Yes, 2 = No (SampleData Group 4 convention).
OwnsHome_codes <- ifelse(ownhome_yes, 1L, 2L)
OwnsHome_haven <- haven::labelled(
  OwnsHome_codes,
  labels = c(Yes = 1, No = 2),
  label  = "Owns current residence"
)


# --- 7. Veteran (logical) --------------------------------------------------

Veteran_logical <- sample(
  c(TRUE, FALSE, NA),
  size    = n,
  replace = TRUE,
  prob    = c(0.10, 0.85, 0.05)
)


# --- 8. Cohort (haven; jdummy anti-stutter case) ---------------------------

cohort_codes <- sample.int(4, n, replace = TRUE)
Cohort_stutter <- haven::labelled(
  cohort_codes,
  labels = c(`Cohort 1` = 1, `Cohort 2` = 2, `Cohort 3` = 3, `Cohort 4` = 4),
  label  = "Sample cohort"
)


# --- 9. Region variants ----------------------------------------------------

# Same underlying codes (region_codes from spine), two label flavors.

Region_descriptive <- haven::labelled(
  region_codes,
  labels = c(North = 1, South = 2, East = 3, West = 4),
  label  = "Region of residence"
)

Region_codes_var <- haven::labelled(
  region_codes,                      # same numeric codes, different labels
  labels = c(`1` = 1, `2` = 2, `3` = 3, `4` = 4),
  label  = "Region (uninformative labels)"
)


# --- 10. EmployerCategory (plain numeric, NO labels, NO class) -------------

# Tests the structural-categorical detection in the unified classifier
# (.jst_is_discrete_integer): whole-number 1-6, no haven labels, no factor.
# Should auto-categorical in jlm/jlogistic without registration.
EmployerCategory <- sample.int(6, n, replace = TRUE)


# --- 11. Environment scale (6 items; item 3 reverse-coded) ----------------

# Latent score driven by z_edu, gender, and region effect.
b_edu_env    <- 0.25
b_gender_env <- 0.15
region_effect_env <- c(0.20, -0.20, -0.10, 0.10)[region_codes]
sigma_env <- sqrt(max(0,
                       1 - b_edu_env^2
                         - b_gender_env^2
                         - var(region_effect_env)))
env_latent <- b_edu_env    * z_edu                  +
              b_gender_env * (gender_z - 0.5) * 2   +
                              region_effect_env     +
              sigma_env    * rnorm(n)

# Helper: latent + item-specific noise -> integer 1-5.
# item_noise_sd ~ 0.7 calibrated to give Cronbach's alpha around .75.
.build_likert_item <- function(latent, item_noise_sd = 0.7) {
  z <- latent + rnorm(length(latent), 0, item_noise_sd)
  as.integer(pmin(pmax(round(z + 3), 1L), 5L))
}

# Items 1, 2, 4, 5, 6 are phrased pro-environment (high = pro).
# Item 3 is phrased anti-environment (high = anti) -- reverse-coded.
# To realise that, generate item 3 from -env_latent so its 1-5 distribution
# moves opposite to the others. After jrecode (5=1; 4=2; 3=3; 2=4; 1=5)
# it aligns with items 1, 2, 4, 5, 6.

env_codes <- list(
  Environment1 = .build_likert_item( env_latent),
  Environment2 = .build_likert_item( env_latent),
  Environment3 = .build_likert_item(-env_latent),   # reverse direction
  Environment4 = .build_likert_item( env_latent),
  Environment5 = .build_likert_item( env_latent),
  Environment6 = .build_likert_item( env_latent)
)

# 5-point Likert value labels (shared across all 6 items).
likert_labels <- c(
  "Strongly Disagree" = 1,
  "Disagree"          = 2,
  "Neutral"           = 3,
  "Agree"             = 4,
  "Strongly Agree"    = 5
)

# Variable labels = the actual survey question texts. Item 3's label ends
# with " R" to flag reverse-coding (SampleData convention -- jalpha picks
# this up via .jst_detect_missing_labels-style scanning of var labels).
#
# These are PLACEHOLDER question texts that mirror the structure of
# SampleData's Environment items. To use SampleData's actual question text
# instead, run in your local R session:
#
#   for (k in 1:6) cat(sprintf("Environment%d: %s\n", k,
#     labelled::var_label(SampleData[[paste0("Environment", k)]])))
#
# and paste the printed labels in below, preserving Environment3's " R".

env_var_labels <- c(
  Environment1 = "Climate change is a serious threat to humanity.",
  Environment2 = "Governments should do more to protect the environment.",
  Environment3 = "Concern about the environment is overstated. R",
  Environment4 = "I am willing to pay more for environmentally friendly products.",
  Environment5 = "Industrial pollution is a major cause of public health problems.",
  Environment6 = "Future generations will face serious environmental hardship."
)

# Apply value labels and variable labels to each item.
env_items <- mapply(
  function(codes, varlbl) {
    haven::labelled(codes, labels = likert_labels, label = varlbl)
  },
  codes  = env_codes,
  varlbl = env_var_labels[names(env_codes)],
  SIMPLIFY = FALSE
)


# --- 12. Children_count (count, depends on Age) ----------------------------

b_age_ch  <- 0.30
sigma_ch  <- sqrt(1 - b_age_ch^2)
children_z <- b_age_ch * z_age + sigma_ch * rnorm(n)
Children_count <- as.integer(pmin(pmax(round(2 + 1.5 * children_z), 0L), 8L))

# Ensure at least one case > 5 so the count classifier (Rule 6) treats this
# as continuous rather than categorical.
if (max(Children_count, na.rm = TRUE) <= 5L) {
  Children_count[which.max(Children_count)] <- 6L
}


# --- 13. SatisfactionScore variants ---------------------------------------

# SatisfactionScore: clean continuous, no metadata.
SatisfactionScore <- as.integer(pmin(pmax(round(70 + 15 * rnorm(n)), 0L), 100L))

# SatisfactionScore_with_udm: same scale, but ~4% of cells overwritten with
# -99 / -98 and declared as SPSS-form UDMs. Tests UDM handling on a
# continuous variable -- jdesc CPS counts, Cross-cutting 5 auto-conversion,
# jfreq behaviour on a continuous-style column with declared UDMs.
sat_udm_n  <- round(n * 0.04)
sat_udm_ix <- sample.int(n, sat_udm_n)
sat_with_udm_codes <- SatisfactionScore
sat_with_udm_codes[sat_udm_ix[seq_len(sat_udm_n %/% 2)]]          <- -99L
sat_with_udm_codes[sat_udm_ix[(sat_udm_n %/% 2 + 1):sat_udm_n]]   <- -98L

SatisfactionScore_with_udm <- haven::labelled_spss(
  sat_with_udm_codes,
  labels    = c("Refused" = -99, "Don't know" = -98),
  na_values = c(-99, -98),
  label     = "Life satisfaction (with UDM codes)"
)


# --- 14. Notes (free-text character; includes empty strings) ---------------

note_pool <- c(
  "agreed to follow-up",
  "moved out of area",
  "translator needed",
  "completed in person",
  "no comment",
  "rushed through survey",
  "expressed interest in study results",
  ""    # empty string -- common real-world artifact
)
Notes <- sample(
  note_pool, n, replace = TRUE,
  prob = c(.15, .10, .05, .15, .15, .05, .15, .20)
)


# --- 15. RespondentID (integer, all-unique) --------------------------------

RespondentID <- seq_len(n)


# --- 15B. Additional type & edge-case columns (Session 46 expansion) -------
#
# Independent type/edge probes (no spine correlation). These exercise
# jdesc()'s type classifier and the analysis functions' handling of
# degenerate columns. Constructed after all spine variables are realized,
# so inserting them here does not perturb any existing variable's values.

# -- Date/time concept: interview & follow-up dates -------------------------
# Fielding window: 2026-01-01 to 2026-03-31 (90 days).
field_start   <- as.Date("2026-01-01")
InterviewDate <- field_start + (sample.int(90, n, replace = TRUE) - 1L)
date_na_idx   <- sample.int(n, round(n * 0.05))
InterviewDate[date_na_idx] <- NA            # ~5% missing

# POSIXct: same day plus a random time-of-day. NA dates propagate to NA.
InterviewTimestamp <- as.POSIXct(InterviewDate, tz = "UTC") +
  runif(n, 0, 24 * 60 * 60)

# POSIXlt: list-backed variant of the same instants. Assigned to the data
# frame POST-ASSEMBLY (data.frame() coerces POSIXlt -> POSIXct).
InterviewTimestamp_lt <- as.POSIXlt(InterviewTimestamp, tz = "UTC")

# difftime (days): fielding start to interview date.
FollowupGap <- InterviewDate - field_start  # class "difftime", units "days"

# -- Numbers stored as text -------------------------------------------------
# Clean numeric strings (NAs preserved as NA_character_).
Age_text <- as.character(Age_continuous)

# Zero-padded IDs: look like an identifier but coerce cleanly to numbers --
# the case the "stored as text" note is designed to flag.
RespondentID_text <- sprintf("%04d", RespondentID)

# Mostly numeric strings with a few non-numeric tokens and empty strings:
# exercises the partial-coercion path (non-numeric entries -> NA on summary).
Income_text_messy <- as.character(Income_continuous)
messy_ix <- sample.int(n, round(n * 0.08))
Income_text_messy[messy_ix] <- sample(c("refused", "n/a", ""),
                                       length(messy_ix), replace = TRUE)

# -- Other type variants ----------------------------------------------------
# Logical with no missing (Veteran_logical already covers logical-with-NA).
Consented_logical <- sample(c(TRUE, FALSE), n, replace = TRUE,
                            prob = c(0.9, 0.1))

# Factor whose levels are numeric strings ("1".."4") -- jdesc coerces these.
Region_factor_num <- factor(region_codes, levels = 1:4)

# Complex -- exercises jdesc's generic "other type" refusal.
Complex_col <- complex(real = rnorm(n), imaginary = rnorm(n))

# -- Degenerate / edge cases ------------------------------------------------
AllMissing_numeric   <- rep(NA_real_, n)              # all NA (numeric)
AllMissing_character <- rep(NA_character_, n)         # all NA (character)
Constant_numeric     <- rep(42L, n)                   # zero variance
Constant_labelled    <- haven::labelled(              # zero-variance categorical
  rep(1L, n),
  labels = c(Yes = 1, No = 2),
  label  = "Constant labelled (one category present)"
)
Constant_factor      <- factor(rep("OnlyLevel", n))   # single level
Logical_constant     <- rep(TRUE, n)                  # zero-variance logical
SingleValue_numeric  <- c(7, rep(NA_real_, n - 1L))   # N = 1, SD undefined


# --- 16. Assemble data frame -----------------------------------------------

# Order: ID first, then concept-grouped columns. Within each concept the
# UDM/structural variants are adjacent so jfreq/jdesc output is easy to
# compare side-by-side during testing. Session 46 type/edge columns follow
# the original concept columns.

community_phase2_data <- data.frame(
  RespondentID                = RespondentID,
  Age_continuous              = Age_continuous,
  Age_ordered                 = Age_ordered,
  Age_categorical_spss        = Age_categorical_spss,
  Age_categorical_stata       = Age_categorical_stata,
  Age_categorical_sas         = Age_categorical_sas,
  Age_categorical_range       = Age_categorical_range,
  Age_dichotomy               = Age_dichotomy,
  Income_continuous           = Income_continuous,
  Income_ordered              = Income_ordered,
  Income_categorical_spss     = Income_categorical_spss,
  Income_categorical_partial  = Income_categorical_partial,
  Income_log                  = Income_log,
  Gender_haven                = Gender_haven,
  Gender_01                   = Gender_01,
  Gender_factor               = Gender_factor,
  Gender_character            = Gender_character,
  OwnsHome_haven              = OwnsHome_haven,
  Education_haven             = Education_haven,
  Education_partial           = Education_partial,
  Veteran_logical             = Veteran_logical,
  Cohort_stutter              = Cohort_stutter,
  Region_descriptive          = Region_descriptive,
  Region_codes                = Region_codes_var,
  EmployerCategory            = EmployerCategory,
  Environment1                = env_items$Environment1,
  Environment2                = env_items$Environment2,
  Environment3                = env_items$Environment3,
  Environment4                = env_items$Environment4,
  Environment5                = env_items$Environment5,
  Environment6                = env_items$Environment6,
  Children_count              = Children_count,
  SatisfactionScore           = SatisfactionScore,
  SatisfactionScore_with_udm  = SatisfactionScore_with_udm,
  Notes                       = Notes,
  # -- Session 46: date/time concept --------------------------------------
  InterviewDate               = InterviewDate,
  InterviewTimestamp          = InterviewTimestamp,
  FollowupGap                 = FollowupGap,
  # -- Session 46: numbers-as-text ----------------------------------------
  Age_text                    = Age_text,
  RespondentID_text           = RespondentID_text,
  Income_text_messy           = Income_text_messy,
  # -- Session 46: other type variants ------------------------------------
  Consented_logical           = Consented_logical,
  Region_factor_num           = Region_factor_num,
  Complex_col                 = Complex_col,
  # -- Session 46: degenerate / edge cases --------------------------------
  AllMissing_numeric          = AllMissing_numeric,
  AllMissing_character        = AllMissing_character,
  Constant_numeric            = Constant_numeric,
  Constant_labelled           = Constant_labelled,
  Constant_factor             = Constant_factor,
  Logical_constant            = Logical_constant,
  SingleValue_numeric         = SingleValue_numeric,
  stringsAsFactors            = FALSE
)

# InterviewTimestamp_lt is added post-assembly: data.frame() silently coerces
# a POSIXlt column to POSIXct, so it can only retain its class when assigned
# after the frame is built. (It survives the .rds round-trip; verified below.)
community_phase2_data$InterviewTimestamp_lt <- InterviewTimestamp_lt


# --- 17. Variable labels for non-haven columns -----------------------------

# haven_labelled columns already carry their var label (set inline above).
# The remaining columns get their var label here via labelled::var_label<-.

labelled::var_label(community_phase2_data$RespondentID)      <- "Respondent ID"
labelled::var_label(community_phase2_data$Age_continuous)    <- "Age in years"
labelled::var_label(community_phase2_data$Age_ordered)       <- "Age category (ordered)"
labelled::var_label(community_phase2_data$Age_dichotomy)     <- "Adult/juvenile (1 = Juvenile)"
labelled::var_label(community_phase2_data$Income_continuous) <- "Annual income (USD)"
labelled::var_label(community_phase2_data$Income_ordered)    <- "Income bracket (ordered)"
labelled::var_label(community_phase2_data$Income_log)        <- "Log of income"
labelled::var_label(community_phase2_data$Gender_01)         <- "Gender (0 = Male, 1 = Female)"
labelled::var_label(community_phase2_data$Gender_factor)     <- "Gender (factor)"
labelled::var_label(community_phase2_data$Gender_character)  <- "Gender (character)"
labelled::var_label(community_phase2_data$Veteran_logical)   <- "Veteran status (logical)"
labelled::var_label(community_phase2_data$EmployerCategory)  <- "Employer category code"
labelled::var_label(community_phase2_data$Children_count)    <- "Number of children"
labelled::var_label(community_phase2_data$SatisfactionScore) <- "Life satisfaction (0-100)"
labelled::var_label(community_phase2_data$Notes)             <- "Field notes (free text)"

# Session 46 type & edge-case columns.
labelled::var_label(community_phase2_data$InterviewDate)         <- "Interview date"
labelled::var_label(community_phase2_data$InterviewTimestamp)    <- "Interview timestamp (POSIXct)"
labelled::var_label(community_phase2_data$InterviewTimestamp_lt) <- "Interview timestamp (POSIXlt)"
labelled::var_label(community_phase2_data$FollowupGap)           <- "Days from fielding start to interview"
labelled::var_label(community_phase2_data$Age_text)              <- "Age stored as text"
labelled::var_label(community_phase2_data$RespondentID_text)     <- "Respondent ID stored as text (zero-padded)"
labelled::var_label(community_phase2_data$Income_text_messy)     <- "Income stored as text (some non-numeric entries)"
labelled::var_label(community_phase2_data$Consented_logical)     <- "Consented (logical, no missing)"
labelled::var_label(community_phase2_data$Region_factor_num)     <- "Region (numeric-coded factor)"
labelled::var_label(community_phase2_data$Complex_col)           <- "Complex number (unsupported type)"
labelled::var_label(community_phase2_data$AllMissing_numeric)    <- "All missing (numeric)"
labelled::var_label(community_phase2_data$AllMissing_character)  <- "All missing (character)"
labelled::var_label(community_phase2_data$Constant_numeric)      <- "Constant value (zero variance)"
labelled::var_label(community_phase2_data$Constant_factor)       <- "Constant factor (single level)"
labelled::var_label(community_phase2_data$Logical_constant)      <- "Constant logical (all TRUE)"
labelled::var_label(community_phase2_data$SingleValue_numeric)   <- "Single non-missing value (N = 1)"


# --- 18. Save via jsave() (dogfoods the package's I/O) ---------------------

# Ensure datasets/ exists before writing.
if (!dir.exists(DATASETS_DIR)) {
  dir.create(DATASETS_DIR, recursive = TRUE)
}

target_path <- file.path(DATASETS_DIR, "community_phase2_data.rds")

if (file.exists(target_path)) {
  message("Existing file at '", target_path, "' will be overwritten.")
}

jsave(community_phase2_data, target_path, overwrite = TRUE)


# --- 19. Round-trip verification -------------------------------------------

# Load it back and confirm shape + key column types are preserved.
# overwrite = TRUE on jload prevents the interactive prompt when
# community_phase2_data already exists in globalenv from a prior run.
jload(target_path, name = "verified", overwrite = TRUE)

stopifnot(
  identical(dim(community_phase2_data),   dim(verified)),
  identical(names(community_phase2_data), names(verified)),
  # SPSS-form UDM columns retain class
  inherits(verified$Age_categorical_spss,       "haven_labelled_spss"),
  inherits(verified$Age_categorical_range,      "haven_labelled_spss"),
  inherits(verified$Income_categorical_spss,    "haven_labelled_spss"),
  inherits(verified$Income_categorical_partial, "haven_labelled_spss"),
  inherits(verified$SatisfactionScore_with_udm, "haven_labelled_spss"),
  # Stata-/SAS-form tagged_na columns are plain haven_labelled
  inherits(verified$Age_categorical_stata,      "haven_labelled"),
  inherits(verified$Age_categorical_sas,        "haven_labelled"),
  # Tagged NAs survive the .rds round-trip with their tag letters intact
  any(haven::na_tag(verified$Age_categorical_stata) == "a", na.rm = TRUE),
  any(haven::na_tag(verified$Age_categorical_stata) == "b", na.rm = TRUE),
  any(haven::na_tag(verified$Age_categorical_sas)   == "A", na.rm = TRUE),
  any(haven::na_tag(verified$Age_categorical_sas)   == "B", na.rm = TRUE),
  # Education_partial has code 3 in data but no val_label for it
  3 %in% as.numeric(verified$Education_partial),
  !(3 %in% unname(labelled::val_labels(verified$Education_partial))),
  # Income_categorical_partial: -98 declared but not labelled
  -98 %in% attr(verified$Income_categorical_partial, "na_values", exact = TRUE),
  !(-98 %in% unname(labelled::val_labels(verified$Income_categorical_partial))),
  inherits(verified$Age_ordered,                "ordered"),
  inherits(verified$Gender_factor,              "factor"),
  is.logical(verified$Veteran_logical),
  is.character(verified$Notes),
  # --- Session 46 type & edge-case columns -------------------------------
  ncol(verified) == 52L,
  # Date/time classes preserved through the round-trip (incl. POSIXlt)
  inherits(verified$InterviewDate,         "Date"),
  inherits(verified$InterviewTimestamp,    "POSIXct"),
  inherits(verified$InterviewTimestamp_lt, "POSIXlt"),
  inherits(verified$FollowupGap,           "difftime"),
  # Numbers-as-text stay character
  is.character(verified$Age_text),
  is.character(verified$RespondentID_text),
  is.character(verified$Income_text_messy),
  # Other type variants
  is.logical(verified$Consented_logical),
  is.factor(verified$Region_factor_num),
  is.complex(verified$Complex_col),
  # Degenerate / edge cases
  all(is.na(verified$AllMissing_numeric)),
  all(is.na(verified$AllMissing_character)),
  length(unique(verified$Constant_numeric)) == 1L,
  nlevels(verified$Constant_factor) == 1L,
  all(verified$Logical_constant),
  sum(!is.na(verified$SingleValue_numeric)) == 1L
)

cat("\nGenerated and verified:", target_path, "\n")
cat("N =", nrow(community_phase2_data),
    " columns =", ncol(community_phase2_data), "\n\n")

cat("UDM-bearing column summary:\n")
cat("  Age_categorical_spss     SPSS-form, na_values c(-99, -98):",
    sum(verified$Age_categorical_spss %in% c(-99, -98)), "UDM cells\n")
cat("  Age_categorical_stata    Stata-form, tagged_na 'a'/'b':   ",
    sum(!is.na(haven::na_tag(verified$Age_categorical_stata))),
    "tagged-NA cells\n")
cat("  Age_categorical_sas      SAS-form, tagged_na 'A'/'B':     ",
    sum(!is.na(haven::na_tag(verified$Age_categorical_sas))),
    "tagged-NA cells\n")
cat("  Age_categorical_range    SPSS-form, na_range -99:-90:     ",
    sum(verified$Age_categorical_range >= -99L &
        verified$Age_categorical_range <= -90L, na.rm = TRUE) +
    sum(verified$Age_categorical_range == -1L, na.rm = TRUE),
    "UDM cells (range + discrete)\n")
cat("  Income_categorical_spss  SPSS-form, na_values c(-99, -98):",
    sum(verified$Income_categorical_spss %in% c(-99, -98)), "UDM cells\n")
cat("  Income_categorical_partial  SPSS-form, only -99 labelled:",
    sum(verified$Income_categorical_partial %in% c(-99, -98)), "UDM cells\n")
cat("  SatisfactionScore_with_udm  SPSS-form, na_values c(-99, -98):",
    sum(verified$SatisfactionScore_with_udm %in% c(-99, -98)), "UDM cells\n")

cat("\nType & edge-case coverage (Session 46):\n")
cat("  dates:  InterviewDate (Date), InterviewTimestamp (POSIXct),\n")
cat("          InterviewTimestamp_lt (POSIXlt), FollowupGap (difftime)\n")
cat("  text-numbers: Age_text, RespondentID_text, Income_text_messy\n")
cat("  other types:  Consented_logical, Region_factor_num, Complex_col\n")
cat("  edge:   AllMissing_numeric/character, Constant_numeric/labelled/factor,\n")
cat("          Logical_constant, SingleValue_numeric\n")

cat("\nCronbach's alpha rough check on Environment1-6 (after item-3 reverse):\n")
env_mat <- sapply(paste0("Environment", 1:6), function(v) {
  x <- as.numeric(verified[[v]])
  if (v == "Environment3") 6L - x else x
})
cat("  alpha ~",
    round({
      k    <- ncol(env_mat)
      vsum <- var(rowSums(env_mat))
      vits <- sum(apply(env_mat, 2, var))
      (k / (k - 1)) * (1 - vits / vsum)
    }, 3),
    "(target: .70 - .85)\n")
