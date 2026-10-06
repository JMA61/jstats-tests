# =============================================================================
# GENERATOR: generators/community_data_generator.R
# Home:      E:/00 R Projects/00_jstats_test_data/generators/   (canonical;
#            the project KB holds a reference copy per the capacity rules)
# Output:    <PKG_ROOT>/data/community.rda               (shipped, lazy-loaded)
#            <PKG_ROOT>/inst/extdata/community_spss.sav  (SPSS-form UDMs)
#            <PKG_ROOT>/inst/extdata/community_stata.dta (Stata-form, jconvert)
#            <PKG_ROOT>/inst/extdata/community_excel.xlsx (no UDM metadata)
#            <DATASETS_DIR>/community.rds                (derived fixture copy)
# Dataset:   community  --  103 cases, 15 columns
# Author:    Jeff Ackerman, June 2026  (S224: absolute-path constants)
# =============================================================================
#
# REGENERATION IS A COUPLED EVENT. This script rebuilds the SHIPPED dataset.
# Changing the seed, N, loadings, or columns ripples into roxygen @examples,
# the guides' static outputs, community_demo_presenter.R, and book passages
# (the S179 regen shows the scale of the coupling). Fixture needs belong in
# a NEW generator in this folder, not in edits here.
#
# PURPOSE
# -------
# `community` is the package's shipped example dataset. It serves three roles
# at once: runnable roxygen @examples for every user-facing function, a
# realistic teaching dataset for new users, and the colleague demonstration
# of cross-platform save/load behaviour. The columns are deliberately chosen
# so a short script can exercise the whole package on data of the kinds the
# audience actually has (Likert items, dichotomies, a labelled categorical,
# SPSS-style user-defined missing values).
#
# COLUMN SLATE (15)
# -----------------
#   RespondentID    character ID ("R001"..)
#   Income          continuous USD, SPSS-form UDMs (-99 Refused, -98 Don't know)
#   Education       5-level categorical, SPSS-form UDMs (-99, -98)
#   Age             clean integer years
#   WellbeingScore  clean 0-100 DV; carries an Income x Age interaction
#   Volunteer       0/1 labelled dichotomy (clean -- direct jlogistic DV)
#   OwnsHome        1/2 labelled dichotomy (recode to 0/1 before jlogistic DV)
#   Smoker          0/1 labelled dichotomy, SPSS-form UDM (-99 Refused)
#   CommuteTime     clean integer minutes; ~.05 with everything (null demo)
#   Region          4-level labelled categorical (North/South/East/West)
#   Environment1-5  5-point Likert scale; item 2 reverse-keyed (" R" label),
#                   item 5 weakly loaded (jalpha drop candidate),
#                   items 1 & 3 carry SPSS-form UDMs (jsum/javg min.valid demo)
#
# (The dirty undeclared-codes single item that formerly lived here as
# JobSatisfaction now lives in the `clinic` dataset as MoodRating; `community`
# is the clean default and no longer triggers the suspected-codes scan on load.)
#
# CORRELATION SPINE  (realized values at the locked seed; the income and
# WellbeingScore loadings in steps 2 and 5 are calibrated to hold this spine
# at N = 103; see verification tail)
# -----------------------------------------------------------------------------
#   Income    <-> Education      r ~ .53
#   Income    <-> Age            r ~ .29
#   Income    <-> WellbeingScore r ~ .62
#   Education <-> WellbeingScore r ~ .51
#   Age       <-> WellbeingScore r ~ .34
#   Income x Age interaction on WellbeingScore: significant (p ~ .001)
#   CommuteTime: deliberately near-independent (|r| <= ~.10) for a null result
# All moderate; nothing high enough to raise multicollinearity in jlm/jlogistic.
#
# UDM / MISSING-VALUE COVERAGE
# ----------------------------
#   Income, Education     SPSS-form UDMs on INDEPENDENT cells (partial overlap)
#                         so listwise N visibly drops below per-variable N.
#   Smoker                SPSS-form UDM on a dichotomy.
#   Environment1, 3       SPSS-form UDMs with a forced 4-row overlap, so a
#                         jsum()/javg(min.valid = 3) over the 4 retained items
#                         leaves several cases below the cutoff (returns NA).
#
# DEMO ARC (runs on a machine with jstats loaded)
# -------------------------------------------------------
#   Reverse-code Environment2 with jrecode("5=1; 4=2; 3=3; 2=4; 1=5"); run
#   jalpha on the five items (Environment5 shows the lowest item-total r and
#   the highest alpha-if-deleted -> drop it); build the scale with jsum()/
#   javg(min.valid = 3) over the four retained items. Then: load `community`,
#   jsave to community_spss.sav, jconvert(to = "stata") + jsave to
#   community_stata.dta (the SPSS na_values cannot write to .dta directly --
#   the conversion is required), jsave to community_excel.xlsx (Excel drops
#   the missing flag; -99/-98 reload as literal numbers), reload all three and
#   compare. The bundled inst/extdata/community_spss.sav is the capstone
#   "real received file".
#
# HOW TO USE
# ----------
# Runs from ANY working directory (all paths are absolute, via the constants
# below). jstats must be loaded (devtools::load_all() during development OR
# library(jstats) for the installed version -- not both in the same session):
#
#   source("E:/00 R Projects/00_jstats_test_data/generators/community_data_generator.R")
#
# Reproducible: set.seed() once at the top; re-running produces identical data.
# =============================================================================


# --- Setup -------------------------------------------------------------------

# haven / labelled are package dependencies; accessed fully-qualified here.
for (.pkg in c("haven", "labelled")) {
  if (!requireNamespace(.pkg, quietly = TRUE)) {
    stop("Package '", .pkg, "' is required but not installed.", call. = FALSE)
  }
}
rm(.pkg)

# jstats must be loaded (jsave / jload / jconvert are dogfooded below).
if (!all(vapply(c("jsave", "jload", "jconvert"),
                exists, logical(1), mode = "function"))) {
  stop("jsave()/jload()/jconvert() not found. Load jstats first:\n",
       "  devtools::load_all()      # development\n",
       "  library(jstats)   # installed", call. = FALSE)
}

# --- Locations (S224) --------------------------------------------------------
# The ONLY place paths live. On a folder move, edit here and nothing else.
PKG_ROOT       <- "E:/00 R Projects/jstats"                # package project
TEST_DATA_ROOT <- "E:/00 R Projects/00_jstats_test_data"   # test-data folder
DATASETS_DIR   <- file.path(TEST_DATA_ROOT, "datasets")

set.seed(20260605L)
n <- 103L


# --- 1. Spine: independent latent drivers ------------------------------------

z_age        <- rnorm(n)
z_edu        <- rnorm(n)
region_codes <- sample.int(4, n, replace = TRUE)
region_eff   <- c(0.18, -0.12, 0.05, -0.11)[region_codes]   # small region effect


# --- 2. Income (continuous USD, SPSS-form UDMs) ------------------------------

# Income latent ~ f(age, education). Roughly-linear dollar scale (mild
# truncation skew), deliberately NOT heavy log-normal, so the Income x Age
# interaction on WellbeingScore stays clean and recoverable.
b_age_inc <- 0.45
b_edu_inc <- 0.53
income_z  <- b_age_inc * z_age + b_edu_inc * z_edu +
             sqrt(1 - b_age_inc^2 - b_edu_inc^2) * rnorm(n)
income_dollars <- pmax(round((48000 + 19000 * income_z) / 1000) * 1000, 14000L)

# Inject SPSS-form UDMs on 6 cells (3 Refused, 3 Don't know).
inc_udm   <- sample.int(n, 6L)
inc_codes <- income_dollars
inc_codes[inc_udm[1:3]] <- -99L
inc_codes[inc_udm[4:6]] <- -98L

Income <- haven::labelled_spss(
  inc_codes,
  labels    = c("Refused" = -99, "Don't know" = -98),
  na_values = c(-99, -98),
  label     = "Annual income (USD)"
)


# --- 3. Education (5-level categorical, SPSS-form UDMs) ----------------------

edu_cuts  <- c(-Inf, qnorm(c(0.20, 0.45, 0.70, 0.90)), Inf)
edu_codes <- as.integer(cut(z_edu, breaks = edu_cuts, labels = FALSE))

# UDMs on 6 INDEPENDENT cells (not the Income cells) -> partial overlap, so
# listwise deletion on Income + Education drops more than either alone.
edu_udm  <- sample.int(n, 6L)
edu_full <- edu_codes
edu_full[edu_udm[1:3]] <- -99L
edu_full[edu_udm[4:6]] <- -98L

Education <- haven::labelled_spss(
  edu_full,
  labels    = c("Some high school" = 1, "High school graduate" = 2,
                "Some college" = 3, "Bachelor's degree" = 4,
                "Graduate degree" = 5,
                "Refused" = -99, "Don't know" = -98),
  na_values = c(-99, -98),
  label     = "Highest education level"
)


# --- 4. Age (clean integer years) -------------------------------------------

Age <- as.integer(pmin(pmax(round(40 + 13 * z_age), 18), 80))


# --- 5. WellbeingScore (clean 0-100 DV with an Income x Age interaction) -----

# Built from standardized Income and Age plus their product. Because Income
# is roughly linear in income_z, jlm(WellbeingScore ~ Income * Age) recovers
# the interaction (significant at the locked seed; see verification tail).
zi <- as.numeric(scale(income_z))
za <- as.numeric(scale(z_age))
wb_latent <- 0.46 * zi + 0.32 * za + 0.32 * (zi * za) +
             0.28 * z_edu + region_eff + sqrt(0.48) * rnorm(n)
WellbeingScore <- as.integer(pmin(pmax(round(50 + 11 * wb_latent), 0), 100))


# --- 6. Dichotomies ----------------------------------------------------------

# Volunteer: 0/1, clean -- a direct jlogistic DV (no recode) and clean predictor.
Volunteer <- haven::labelled(
  rbinom(n, 1, plogis(-0.2 + 0.7 * z_edu + 0.3 * za)),
  labels = c(No = 0, Yes = 1),
  label  = "Volunteered in past year"
)

# OwnsHome: 1/2 (Yes/No), the SPSS-import convention -- recode to 0/1 before
# using as a jlogistic DV; auto-categorical as a predictor.
OwnsHome <- haven::labelled(
  ifelse(rbinom(n, 1, plogis(-0.3 + 0.9 * zi + 0.5 * za + 0.4 * z_edu)) == 1,
         1L, 2L),
  labels = c(Yes = 1, No = 2),
  label  = "Owns home"
)

# Smoker: 0/1 with an SPSS-form UDM (-99 Refused) on 5 cells. UDM-on-a-dichotomy.
smk_udm  <- sample.int(n, 5L)
smk_full <- rbinom(n, 1, plogis(-0.6 - 0.5 * z_edu))
smk_full[smk_udm] <- -99L
Smoker <- haven::labelled_spss(
  smk_full,
  labels    = c(No = 0, Yes = 1, "Refused" = -99),
  na_values = -99,
  label     = "Current smoker"
)


# --- 7. CommuteTime (clean minutes; near-independent null variable) ----------

commute_z   <- 0.05 * z_age + sqrt(1 - 0.05^2) * rnorm(n)
CommuteTime <- as.integer(pmax(round(32 + 13 * commute_z), 5))


# --- 8. Region (4-level labelled categorical) -------------------------------

Region <- haven::labelled(
  region_codes,
  labels = c(North = 1, South = 2, East = 3, West = 4),
  label  = "Region of residence"
)


# --- 9. Environment scale (5 Likert items) ----------------------------------

# Latent driven by education + region. Items 1, 3, 4 plain (well-loaded);
# item 2 reverse-keyed (generated from -latent, " R" label, reverse-code before
# scaling); item 5 weakly loaded (high item noise -> jalpha drop candidate).
env_latent <- 0.5 * z_edu + (region_eff / 0.18) * 0.5 + sqrt(0.55) * rnorm(n)

.likert_item <- function(latent, noise_sd) {
  as.integer(pmin(pmax(round(latent + rnorm(n, 0, noise_sd) + 3), 1L), 5L))
}
e1 <- .likert_item( env_latent, 0.75)
e2 <- .likert_item(-env_latent, 0.75)   # reverse-keyed (retained after flip)
e3 <- .likert_item( env_latent, 0.80)
e4 <- .likert_item( env_latent, 0.80)
e5 <- .likert_item( env_latent, 1.85)   # weak -> drop candidate

# SPSS-form UDMs on items 1 and 3, with a forced 4-row overlap so several
# cases fall below a 3-of-4 min.valid cutoff over the retained items.
ov  <- sample.int(n, 4L)
e1u <- union(ov, sample(setdiff(seq_len(n), ov), 8L))
e3u <- union(ov, sample(setdiff(seq_len(n), ov), 8L))
e1f <- e1; e1f[e1u[seq_len(length(e1u) %/% 2)]] <- -99L
e1f[e1u[(length(e1u) %/% 2 + 1):length(e1u)]]   <- -98L
e3f <- e3; e3f[e3u[seq_len(length(e3u) %/% 2)]] <- -99L
e3f[e3u[(length(e3u) %/% 2 + 1):length(e3u)]]   <- -98L

likert_labels <- c("Strongly Disagree" = 1, "Disagree" = 2, "Neutral" = 3,
                   "Agree" = 4, "Strongly Agree" = 5)
env_udm       <- c("Refused" = -99, "Don't know" = -98)

# Placeholder survey-question wordings. Item 2's label ends with " R" as a
# reader cue that it is reverse-keyed; jalpha does not read the label -- it
# flags the item by its negative item-total r.
Environment1 <- haven::labelled_spss(e1f, labels = c(likert_labels, env_udm),
  na_values = c(-99, -98), label = "Climate change is a serious threat.")
Environment2 <- haven::labelled(e2, labels = likert_labels,
  label = "Concern about the environment is exaggerated. R")
Environment3 <- haven::labelled_spss(e3f, labels = c(likert_labels, env_udm),
  na_values = c(-99, -98), label = "Government should do more for the environment.")
Environment4 <- haven::labelled(e4, labels = likert_labels,
  label = "I would pay more for environmentally friendly products.")
Environment5 <- haven::labelled(e5, labels = likert_labels,
  label = "Pollution is a major cause of public health problems.")


# RNG NOTE: the Environment section above (the e3u sample) holds the LAST
# random draws in this generator. Columns 1-15 are locked at the seed; any new
# column added later must draw strictly AFTER that point so the existing
# columns continue to reproduce byte-identically.


# --- 10. Assemble ------------------------------------------------------------

community <- data.frame(
  RespondentID   = sprintf("R%03d", seq_len(n)),
  Income         = Income,
  Education      = Education,
  Age            = Age,
  WellbeingScore = WellbeingScore,
  Volunteer      = Volunteer,
  OwnsHome       = OwnsHome,
  Smoker         = Smoker,
  CommuteTime    = CommuteTime,
  Region         = Region,
  Environment1   = Environment1,
  Environment2   = Environment2,
  Environment3   = Environment3,
  Environment4   = Environment4,
  Environment5   = Environment5,
  stringsAsFactors = FALSE,
  check.names      = FALSE
)

# Variable labels for the plain (unlabelled-class) columns.
labelled::var_label(community$RespondentID)   <- "Respondent ID"
labelled::var_label(community$Age)            <- "Age (years)"
labelled::var_label(community$WellbeingScore) <- "Wellbeing score (0-100)"
labelled::var_label(community$CommuteTime)    <- "Daily commute time (minutes)"


# --- 11. Materialize ---------------------------------------------------------

# (a) Shipped dataset: data/community.rda, lazy-loaded by name with
#     LazyData: true. (save() to .rda is the lazy-load mechanism; usethis::
#     use_data(community, overwrite = TRUE) is the equivalent modern idiom.)
pkg_data <- file.path(PKG_ROOT, "data")
if (!dir.exists(pkg_data)) dir.create(pkg_data, recursive = TRUE)
save(community, file = file.path(pkg_data, "community.rda"), version = 2)

# (b)-(d) Bundled examples in inst/extdata, dogfooding the package's I/O.
pkg_extdata <- file.path(PKG_ROOT, "inst/extdata")
if (!dir.exists(pkg_extdata)) dir.create(pkg_extdata, recursive = TRUE)

# SPSS format (.sav): SPSS-style na_values write natively.
jsave(community, file.path(pkg_extdata, "community_spss.sav"), overwrite = TRUE)

# Stata format (.dta): SPSS na_values cannot write to .dta, so convert first.
# jconvert maps the enumerated SPSS codes to Stata-style tagged NAs.
community_stata <- jconvert(community, to = "stata")
jsave(community_stata, file.path(pkg_extdata, "community_stata.dta"),
      overwrite = TRUE)

# Excel format (.xlsx): no missing-value metadata -- the -99/-98 codes are
# written as literal numbers (the cautionary reload case).
jsave(community, file.path(pkg_extdata, "community_excel.xlsx"),
      overwrite = TRUE)

# (e) Derived fixture copy for the standing test-data folder. Regression
#     scripts jload() this .rds so they never touch the package tree.
#     Derived, never edited there; a re-run of this script refreshes it.
if (!dir.exists(DATASETS_DIR)) dir.create(DATASETS_DIR, recursive = TRUE)
jsave(community, file.path(DATASETS_DIR, "community.rds"), overwrite = TRUE)


# --- 12. Round-trip verification ---------------------------------------------

# Shipped .rda reloads identically.
loaded_env <- new.env()
load(file.path(pkg_data, "community.rda"), envir = loaded_env)
stopifnot(identical(community, loaded_env$community))

# The datasets/ fixture copy reloads with shape and UDM metadata intact.
jload(file.path(DATASETS_DIR, "community.rds"), name = "rt_fixture",
      overwrite = TRUE)
stopifnot(
  identical(dim(community),   dim(rt_fixture)),
  identical(names(community), names(rt_fixture)),
  inherits(rt_fixture$Income, "haven_labelled_spss"),
  all(c(-99, -98) %in% attr(rt_fixture$Income, "na_values", exact = TRUE))
)

# .sav preserves SPSS-form UDMs through the package loader.
jload(file.path(pkg_extdata, "community_spss.sav"), name = "rt_sav",
      overwrite = TRUE)
stopifnot(
  inherits(rt_sav$Income,    "haven_labelled_spss"),
  inherits(rt_sav$Education, "haven_labelled_spss"),
  all(c(-99, -98) %in% attr(rt_sav$Income, "na_values", exact = TRUE)),
  ncol(rt_sav) == 15L
)

# .dta carries Stata-form tagged NAs after the conversion.
jload(file.path(pkg_extdata, "community_stata.dta"), name = "rt_dta",
      overwrite = TRUE)
stopifnot(any(!is.na(haven::na_tag(rt_dta$Income))))

# .xlsx has dropped the missing flag: the codes reload as ordinary numbers.
jload(file.path(pkg_extdata, "community_excel.xlsx"), name = "rt_xlsx",
      overwrite = TRUE)
stopifnot(
  is.null(attr(rt_xlsx$Income, "na_values", exact = TRUE)),
  any(rt_xlsx$Income %in% c(-99, -98))
)


# --- 13. Design confirmation (printed) ---------------------------------------

cat("\nGenerated: community  (N =", nrow(community),
    " columns =", ncol(community), ")\n")
cat("  <PKG_ROOT>/data/community.rda\n",
    " <PKG_ROOT>/inst/extdata/community_spss.sav\n",
    " <PKG_ROOT>/inst/extdata/community_stata.dta\n",
    " <PKG_ROOT>/inst/extdata/community_excel.xlsx\n",
    " <DATASETS_DIR>/community.rds\n", sep = "")

# Spine + interaction, computed on the analysis view (UDMs -> NA).
av <- data.frame(
  Income         = labelled::remove_val_labels(haven::zap_missing(community$Income)),
  Education      = haven::zap_missing(community$Education),
  Age            = community$Age,
  WellbeingScore = community$WellbeingScore,
  CommuteTime    = community$CommuteTime
)
cat("\nSpine correlations (UDMs as NA):\n")
print(round(cor(av, use = "pairwise.complete.obs"), 3))

m_int <- lm(WellbeingScore ~ Income * Age, data = av)
cat(sprintf("\nIncome x Age interaction: p = %.4f, listwise N = %d\n",
            summary(m_int)$coefficients["Income:Age", "Pr(>|t|)"],
            sum(stats::complete.cases(av[c("WellbeingScore","Income","Age")]))))
cat(sprintf("Listwise N for WellbeingScore ~ Income + Education: %d (of %d)\n",
            sum(stats::complete.cases(av[c("WellbeingScore","Income","Education")])), n))

# Environment scale: reverse item 2, rough Cronbach's alpha + item-total r.
env <- sapply(paste0("Environment", 1:5),
              function(v) as.numeric(haven::zap_missing(community[[v]])))
env[, "Environment2"] <- 6 - env[, "Environment2"]
.alpha <- function(M) {
  k <- ncol(M)
  (k / (k - 1)) * (1 - sum(apply(M, 2, var, na.rm = TRUE)) /
                       var(rowSums(M), na.rm = TRUE))
}
it <- sapply(1:5, function(j)
  cor(env[, j], rowSums(env[, -j]), use = "complete.obs"))
cat(sprintf("\nEnvironment alpha (item 2 reversed): 5 items %.3f -> 4 items %.3f\n",
            .alpha(env), .alpha(env[, 1:4])))
cat("Item-total r:", paste(sprintf("%.2f", it), collapse = " "),
    " (Environment5 is the drop candidate)\n")

ret <- env[, c("Environment1", "Environment2", "Environment3", "Environment4")]
cat(sprintf("min.valid demo: %d cases below 3-of-4 non-missing on retained items\n\n",
            sum(rowSums(!is.na(ret)) < 3)))
