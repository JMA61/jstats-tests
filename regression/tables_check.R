# =============================================================================
# tables_check.R -- what the table layer reads from a saved result
# =============================================================================
# TYPE:     assertion battery (PASS/FAIL; written for Claude's checking)
# LOCKS:    the fields Capability Slate T's table builders read from the
#           analysis results, and the two internal accessors that read them
#           (.jst_apa_terms(), .jst_apa_model()). Build 0 (S399, v0.9.269):
#           the code and the label beside every display string (jfreq()'s
#           Valid and Missing rows, jt()'s and jaov()'s Group, jcrosstab()'s
#           row and column categories, jaov()'s post-hoc pairs); the
#           statistics kept unrounded where the printed frame is rounded
#           (jt(), jaov(), jalpha(); jcorr()'s M and SD); jdesc(by =)'s
#           descriptives_raw; the jstats_version stamp on every result; an
#           accessor method for every result class, registered. Later
#           Slate T builds add their sections here.
# ORIGIN:   S399 (v0.9.269; Capability Slate T, build 0)
# LAST VERIFIED: v0.9.269, 2026-10-28 (S399) -- 56/56 on the WORKSTATION
#           through receive_all() ("ALL BATTERIES GREEN (12 run, 3407
#           checks)"; R CMD check 0 errors, 0 warnings, 0 notes), matching
#           the sandbox (plain, under the RStudio-handler stand-in, each
#           again with a 35-character temp path, and interactive).
# RUN:      source()-safe from any working directory. All output is explicit
#           cat(), so echo = TRUE is NOT required. Also runnable via
#           regression/run_all.R, which treats a stop() as FAIL.
# CONTRACT: one printed line per check, a final "RESULT: PASS (n/n)" line,
#           and stop() if and only if any check failed.
# GUARDS:   the template's five (_template_check.R): the session handed
#           back, no fixture left by a green run, work outside check() taken
#           through res(), the message surface swept (res() records every
#           condition an analysis raises), the user's objects put back.
#           Setup also forces the missing-value convention UNSET (no call
#           here leans on it) and the diagnostics setting off, both handed
#           back at the foot.
# DATA:     the shipped community dataset (.jst_get_package_dataset()), the
#           standing fixture community_phase2_data.rds, and small frames
#           built here for what neither holds.
# EXPECTED VALUES are computed here from the data, not read from the
#           package: a mean is mean() of the group's cases, a code is the
#           value the cells hold, a label is the value label itself.
# =============================================================================

# --- Setup -------------------------------------------------------------------

stopifnot(exists("jload", mode = "function"))

# Guard 2: what is in the workspace on entry.
.entry_names <- ls(globalenv(), all.names = TRUE)

# Guard 5: the values of the workspace's undotted objects on entry.
.entry_values <- mget(grep("^\\.", .entry_names, value = TRUE, invert = TRUE),
                      envir = globalenv())
.ws_restore <- function() {
  back <- names(.entry_values)[vapply(names(.entry_values), function(nm) {
    !exists(nm, envir = globalenv(), inherits = FALSE) ||
      !identical(get(nm, envir = globalenv(), inherits = FALSE),
                 .entry_values[[nm]])
  }, logical(1))]
  for (nm in back) assign(nm, .entry_values[[nm]], envir = globalenv())
  if (length(back) > 0L) {
    cat("Put back as they were on entry: ", paste(back, collapse = ", "),
        "\n", sep = "")
  }
  invisible(back)
}

# Guard 1: session state to hand back at the foot.
.entry_message_width  <- getOption(".jst_options_message_width")
.entry_default_data   <- getOption(".jst_default_data")
.entry_convention     <- getOption(".jst_options_missing_convention")
.entry_output_level   <- getOption(".jst_output_level")
.entry_output_toggles <- getOption(".jst_output_toggles")
.entry_stores <- lapply(stats::setNames(nm = c(".jst_filter", ".jst_complete",
                                              ".jst_dummy", ".jst_registry",
                                              ".jst_missing_notice_shown")),
                        getOption)

.pin_width <- 76L
options(.jst_options_message_width = .pin_width)
# No call here names or leans on a convention: the slot is forced UNSET.
options(.jst_options_missing_convention = NULL)

# The data. tp2 is the standing fixture; tcm the shipped community dataset.
jload("E:/00 R Projects/00_jstats_test_data/datasets/community_phase2_data.rds",
      name = "tp2", overwrite = TRUE, quiet = TRUE)
tcm <- .jst_get_package_dataset("community")

# Neutral pipeline state; the level at its default and the diagnostics off
# (a level call leaves the diagnostics setting alone, S346).
jsubset(clear.all = TRUE); jcomplete(clear.all = TRUE); joutput(NULL)
jdummy(clear.all = TRUE)
juse(NULL)
invisible(utils::capture.output(suppressMessages(joutput(diagnostics = FALSE))))

# A small frame for what the two datasets do not hold.
#   Pol  labelled numeric: one label over 40 columns, one label no case
#        holds (a zero row), plain NA cells
#   Ctry labelled TEXT: two labelled codes, one unlabelled ("FR"), blank
#        cells (one empty, one of spaces)
#   Txt  plain text with blank cells and an NA
#   Grp  plain text grouping variable; G01 a plain numeric one; Gf a factor
#   Mar  text with declared missing values, one of them the blank
#   Rng  labelled numeric with a declared range, two of its values held and
#        one labelled value inside it that no case holds
#   Y    numeric outcome
.long_lab <- "Agree that the policy should be enforced strictly and fully"
tsy <- data.frame(
  Pol  = haven::labelled(c(1, 1, 2, 3, 3, 3, NA, 2, 1, 3, 2, 1),
                         labels = stats::setNames(c(1, 2, 3, 4),
                                                  c(.long_lab, "Neutral",
                                                    "Disagree", "Never chosen"))),
  Ctry = haven::labelled(c("US", "UK", "US", "FR", "US", "UK", "", "  ",
                           "US", "UK", "FR", "US"),
                         labels = c("United States" = "US",
                                    "United Kingdom" = "UK")),
  Txt  = c("a", "b", "", "  ", "a", NA, "b", "a", "b", "a", "a", "b"),
  Grp  = rep(c("x", "y"), 6),
  G01  = rep(c(1, 2), 6),
  Gf   = factor(rep(c("lo", "mid", "hi"), 4), levels = c("lo", "mid", "hi")),
  Mar  = haven::labelled_spss(c("Single", "Married", "UNKNOWN", "", "Single",
                                "Married", "Single", "UNKNOWN", "Married",
                                "Single", "Married", "Single"),
                              labels = c(Unknown = "UNKNOWN"),
                              na_values = c("UNKNOWN", "")),
  Rng  = haven::labelled_spss(c(1, 2, 1, -95, 2, 1, -93, 2, 1, 2, 1, 2),
                              labels = c(Low = 1, High = 2, "Not asked" = -97),
                              na_range = c(-99, -90)),
  Y    = c(12, 15, 11, 18, 14, 16, 10, 19, 13, 17, 12, 20),
  stringsAsFactors = FALSE)

# --- Check harness -----------------------------------------------------------

.results <- list()
check <- function(desc, expr) {
  ok <- isTRUE(tryCatch(expr, error = function(e) {
    cat("        [error] ", conditionMessage(e), "\n", sep = "")
    FALSE
  }))
  .results[[length(.results) + 1L]] <<- list(desc = desc, ok = ok)
  cat(if (ok) "PASS  " else "FAIL  ", desc, "\n", sep = "")
  invisible(ok)
}

.seen <- list()
.see  <- function(kind, cnd) {
  .seen[[length(.seen) + 1L]] <<- list(
    kind = kind, text = conditionMessage(cnd),
    width = getOption(".jst_options_message_width"))
}

# res() (guards 3 and 4): a result taken outside check(). What the call
# prints is captured; every note, warning and error it raises is recorded
# in .seen for the sweep at the foot and kept off the console; an error
# gives a NULL value, so the checks that read the result go red instead of
# the battery halting.
res <- function(expr) {
  val <- NULL
  txt <- tryCatch(
    paste(utils::capture.output(withCallingHandlers(
      val <- expr,
      message = function(m) { .see("note", m); invokeRestart("muffleMessage") },
      warning = function(w) { .see("warning", w); invokeRestart("muffleWarning") })),
      collapse = "\n"),
    error = function(e) {
      .see("error", e)
      paste0("[error] ", conditionMessage(e))
    })
  list(val = val, txt = txt)
}

# The value labels of a column, as a code -> label lookup.
.labs_of <- function(x) {
  l <- attr(x, "labels", exact = TRUE)
  stats::setNames(names(l), as.character(unname(l)))
}

# =============================================================================
# A. jfreq(): the code and the label beside each printed row
# =============================================================================
cat("\n--- A. jfreq(): Code and Label ---\n")

.a1 <- res(jfreq(tcm, Education))$val
.a1v <- .a1$frequencies$Education$valid
check("A01 a labelled numeric: each Valid row's Code is its value and Label its label, beside the printed Value (value.id both)",
      !is.null(.a1v) && identical(as.numeric(.a1v$Code), c(1, 2, 3, 4, 5)) &&
        identical(.a1v$Label, unname(.labs_of(tcm$Education)[c("1", "2", "3", "4", "5")])) &&
        identical(.a1v$Value, paste0(1:5, ": ", .a1v$Label)))

.a2l <- res(jfreq(tcm, Education, value.id = "labels"))$val$frequencies$Education$valid
.a2v <- res(jfreq(tcm, Education, value.id = "values"))$val$frequencies$Education$valid
check("A02 value.id labels and values change Value only: Code and Label are the same under all three",
      !is.null(.a2l) && !is.null(.a2v) &&
        identical(.a2l$Code, .a1v$Code) && identical(.a2v$Code, .a1v$Code) &&
        identical(.a2l$Label, .a1v$Label) && identical(.a2v$Label, .a1v$Label) &&
        identical(.a2l$Value, .a1v$Label) && identical(.a2v$Value, as.character(1:5)))

.a3 <- res(jfreq(tsy, Pol))$val$frequencies$Pol$valid
check("A03 a label over 40 columns: Value is cut with an ellipsis, Label holds it whole",
      !is.null(.a3) && identical(.a3$Label[1], .long_lab) &&
        nchar(.a3$Value[1]) < nchar(paste0("1: ", .long_lab)) &&
        !grepl(.long_lab, .a3$Value[1], fixed = TRUE))

check("A04 a labelled value no case holds: its zero row carries its code and label",
      !is.null(.a3) && nrow(.a3) == 4L &&
        identical(as.numeric(.a3$Code), c(1, 2, 3, 4)) &&
        identical(.a3$Freq[4], 0L) && identical(.a3$Label[4], "Never chosen"))

.a5 <- res(jfreq(tsy, Ctry))$val$frequencies$Ctry$valid
check("A05 a labelled TEXT variable: Code is the text the cells hold, the blank cells one <blank> row, an unlabelled code's Label NA",
      !is.null(.a5) && is.character(.a5$Code) &&
        setequal(.a5$Code, c("<blank>", "FR", "UK", "US")) &&
        identical(.a5$Label[.a5$Code == "US"], "United States") &&
        identical(.a5$Label[.a5$Code == "UK"], "United Kingdom") &&
        is.na(.a5$Label[.a5$Code == "FR"]) && is.na(.a5$Label[.a5$Code == "<blank>"]) &&
        identical(.a5$Freq[.a5$Code == "<blank>"], 2L))

.a6 <- res(jfreq(tp2, Gender_01, Gender_character, Gender_factor,
                 Veteran_logical))$val$frequencies
check("A06 a plain numeric variable: Code is the number (numeric), Label NA",
      !is.null(.a6) && is.numeric(.a6$Gender_01$valid$Code) &&
        identical(as.numeric(.a6$Gender_01$valid$Code),
                  sort(unique(as.numeric(stats::na.omit(tp2$Gender_01))))) &&
        all(is.na(.a6$Gender_01$valid$Label)))
check("A07 plain text, a factor, TRUE/FALSE: Code is the row's own text, Label NA",
      !is.null(.a6) &&
        identical(.a6$Gender_character$valid$Code, .a6$Gender_character$valid$Value) &&
        identical(.a6$Gender_factor$valid$Code, levels(tp2$Gender_factor)) &&
        identical(.a6$Veteran_logical$valid$Code, c("FALSE", "TRUE")) &&
        all(is.na(c(.a6$Gender_character$valid$Label,
                    .a6$Gender_factor$valid$Label,
                    .a6$Veteran_logical$valid$Label))))

.a8 <- res(jfreq(tsy, Txt))$val$frequencies$Txt$valid
check("A08 plain text with blank cells: the <blank> row's Code is <blank>, as its Value",
      !is.null(.a8) && identical(.a8$Code, .a8$Value) &&
        "<blank>" %in% .a8$Code && identical(.a8$Freq[.a8$Code == "<blank>"], 2L))

.a9 <- .a1$frequencies$Education$udm
check("A09 SPSS-style declared codes: each Missing row's Code is the number and Label its label, Value as printed",
      !is.null(.a9) && nrow(.a9) == 2L && is.numeric(.a9$Code) &&
        setequal(.a9$Code, c(-99, -98)) &&
        identical(.a9$Label[.a9$Code == -99], "Refused") &&
        identical(.a9$Label[.a9$Code == -98], "Don't know") &&
        identical(.a9$Value[.a9$Code == -99], "-99 [\"Refused\"]"))

.a10 <- res(jfreq(tp2, Age_categorical_stata, Age_categorical_sas))$val$frequencies
check("A10 Stata-style and SAS-style markers: Code is the marker as written (.a, .B), Label its label",
      !is.null(.a10) &&
        identical(.a10$Age_categorical_stata$udm$Code, c(".a", ".b")) &&
        identical(.a10$Age_categorical_stata$udm$Label, c("Refused", "Don't know")) &&
        identical(.a10$Age_categorical_sas$udm$Code, c(".A", ".B")) &&
        identical(.a10$Age_categorical_sas$udm$Label, c("Refused", "Don't know")))

.a11 <- res(jfreq(tp2, Age_categorical_range, missing.detail = "totals"))$val
.a11u <- .a11$frequencies$Age_categorical_range$udm
check("A11 a declared range shown as one row: no code and no label (NA, NA); the discrete code keeps its own",
      !is.null(.a11u) && any(grepl("^range ", .a11u$Value)) &&
        all(is.na(.a11u$Code[grepl("^range ", .a11u$Value)])) &&
        all(is.na(.a11u$Label[grepl("^range ", .a11u$Value)])) &&
        identical(.a11u$Code[!grepl("^range ", .a11u$Value)], -1) &&
        identical(.a11u$Label[!grepl("^range ", .a11u$Value)], "Outlier"))

.a12 <- res(jfreq(tp2, Age_categorical_range, missing.detail = "all"))$val
.a12u <- .a12$frequencies$Age_categorical_range$udm
.a12in <- local({
  x <- unclass(tp2$Age_categorical_range); attributes(x) <- NULL
  sort(unique(x[!is.na(x) & x >= -99 & x <= -90]))
})
check("A12 a range listed value by value: each value's row carries it as Code, Label NA where the value has none",
      !is.null(.a12u) && identical(sort(.a12u$Code[.a12u$Code != -1]), as.numeric(.a12in)) &&
        all(is.na(.a12u$Label[.a12u$Code != -1])))

.a13 <- res(jfreq(tsy, Mar))$val$frequencies$Mar$udm
check("A13 declared text values: Code is the value as stored, a declared blank the one <blank> category; Label its label or NA",
      !is.null(.a13) && is.character(.a13$Code) &&
        setequal(.a13$Code, c("UNKNOWN", "<blank>")) &&
        identical(.a13$Label[.a13$Code == "UNKNOWN"], "Unknown") &&
        is.na(.a13$Label[.a13$Code == "<blank>"]))

.a15 <- res(jfreq(tsy, Rng, missing.detail = "all"))$val$frequencies$Rng$udm
check("A15 a labelled value inside a declared range that no case holds: its zero row carries its code and label",
      !is.null(.a15) && identical(.a15$Code, c(-97, -95, -93)) &&
        identical(.a15$Freq, c(0L, 1L, 1L)) &&
        identical(.a15$Label[1], "Not asked") && all(is.na(.a15$Label[2:3])))

check("A14 Code and Label are the last two columns of the Valid and Missing frames; the printed columns keep their names and order",
      !is.null(.a1v) && !is.null(.a9) &&
        identical(names(.a1v), c("Value", "Freq", "TotalPct", "ValidPct", "CumPct",
                                 "Code", "Label")) &&
        identical(names(.a9), c("Value", "Freq", "TotalPct", "Code", "Label")))

# =============================================================================
# B. jt() and jaov(): each group's code and label; the statistics unrounded
# =============================================================================
cat("\n--- B. jt() and jaov() ---\n")

.grp <- function(y, g) {
  ok <- !is.na(y) & !is.na(g)
  split(as.numeric(y[ok]), g[ok])
}
.b_wv <- .grp(tcm$WellbeingScore, as.numeric(unclass(tcm$Volunteer)))
.b1 <- res(jt(WellbeingScore ~ Volunteer, tcm, diagnostics = FALSE))$val
check("B01 jt(): Code and Label beside the printed Group column, the printed columns unchanged",
      !is.null(.b1) &&
        identical(names(.b1$descriptives), c("Group", "N", "Mean", "SD", "Code", "Label")) &&
        identical(as.numeric(.b1$descriptives$Code), c(0, 1)) &&
        identical(.b1$descriptives$Label, c("No", "Yes")) &&
        identical(.b1$descriptives$Group, c("0: No", "1: Yes")))

.b1r <- .b1$descriptives_raw
check("B02 jt(): descriptives_raw holds each group's N, mean and SD unrounded, and the printed frame rounds them",
      !is.null(.b1r) &&
        identical(as.numeric(.b1r$group_code), c(0, 1)) &&
        identical(.b1r$group_label, c("No", "Yes")) &&
        identical(as.integer(.b1r$n), unname(vapply(.b_wv, length, integer(1)))) &&
        isTRUE(all.equal(.b1r$mean, unname(vapply(.b_wv, mean, numeric(1))))) &&
        isTRUE(all.equal(.b1r$sd, unname(vapply(.b_wv, stats::sd, numeric(1))))) &&
        identical(round(.b1r$mean, 3), .b1$descriptives$Mean) &&
        any(.b1r$mean != .b1$descriptives$Mean))

check("B03 jt(): the outcome and the grouping variable ride as attributes, name and label",
      !is.null(.b1r) &&
        identical(attr(.b1r, "outcome", exact = TRUE),
                  c(name = "WellbeingScore", label = attr(tcm$WellbeingScore, "label", exact = TRUE))) &&
        identical(attr(.b1r, "group", exact = TRUE),
                  c(name = "Volunteer", label = attr(tcm$Volunteer, "label", exact = TRUE))))

.b4 <- res(jt(WellbeingScore ~ Volunteer, tcm, digits = 1, diagnostics = FALSE))$val
check("B04 jt(digits = 1): the printed Mean rounds to one place, descriptives_raw does not move",
      !is.null(.b4) && identical(.b4$descriptives$Mean, round(.b1r$mean, 1)) &&
        isTRUE(all.equal(.b4$descriptives_raw$mean, .b1r$mean)))

.b5t <- res(jt(Y ~ Grp, tsy, diagnostics = FALSE))$val
.b5n <- res(jt(Y ~ G01, tsy, diagnostics = FALSE))$val
check("B05 a text grouping variable's Code is its text; a plain numeric one's is the number; Label NA",
      !is.null(.b5t) && !is.null(.b5n) &&
        identical(.b5t$descriptives$Code, c("x", "y")) &&
        identical(.b5n$descriptives$Code, c(1, 2)) &&
        all(is.na(c(.b5t$descriptives$Label, .b5n$descriptives$Label))) &&
        identical(.b5n$descriptives_raw$group_code, c(1, 2)))

.b6 <- res(jt(Y ~ Grp, tsy, paired = TRUE, diagnostics = FALSE))$val
check("B06 a paired jt(): descriptives_raw counts the complete pairs, as the printed N does",
      !is.null(.b6) && identical(as.integer(.b6$descriptives_raw$n),
                                 as.integer(.b6$descriptives$N)) &&
        isTRUE(all.equal(.b6$descriptives_raw$mean,
                         unname(vapply(split(tsy$Y, tsy$Grp), mean, numeric(1))))))

.b_wr <- .grp(tcm$WellbeingScore, as.numeric(unclass(tcm$Region)))
.b7 <- res(jaov(WellbeingScore ~ Region, tcm, posthoc = TRUE, diagnostics = FALSE))$val
.b7r <- .b7$descriptives_raw
.b7ci <- vapply(.b_wr, function(v) mean(v) + c(-1, 1) * stats::qt(0.975, length(v) - 1) *
                  stats::sd(v) / sqrt(length(v)), numeric(2))
check("B07 jaov(): Code and Label beside Group; descriptives_raw unrounded, each mean's 95% interval with it",
      !is.null(.b7r) &&
        identical(as.numeric(.b7$descriptives$Code), c(1, 2, 3, 4)) &&
        identical(.b7$descriptives$Label, c("North", "South", "East", "West")) &&
        isTRUE(all.equal(.b7r$mean, unname(vapply(.b_wr, mean, numeric(1))))) &&
        isTRUE(all.equal(.b7r$ci_lower, unname(.b7ci[1, ]))) &&
        isTRUE(all.equal(.b7r$ci_upper, unname(.b7ci[2, ]))))

.ph_ok <- function(ph, r) {
  if (is.null(ph) || is.null(r)) return(FALSE)
  k  <- nrow(r)
  ij <- which(lower.tri(matrix(0, k, k)), arr.ind = TRUE)
  nrow(ph) == nrow(ij) &&
    identical(as.numeric(ph$group1_code), as.numeric(r$group_code[ij[, 1]])) &&
    identical(as.numeric(ph$group2_code), as.numeric(r$group_code[ij[, 2]])) &&
    identical(ph$group1_label, r$group_label[ij[, 1]]) &&
    identical(ph$group2_label, r$group_label[ij[, 2]]) &&
    isTRUE(all.equal(ph$diff, r$mean[ij[, 1]] - r$mean[ij[, 2]]))
}
check("B08 jaov()'s Tukey pairs: each pair's two groups by code and label, the difference the first minus the second",
      .ph_ok(.b7$posthoc, .b7r) && identical(unique(.b7$posthoc$test), "Tukey HSD"))

.b9 <- res(jaov(WellbeingScore ~ Region, tcm, welch = TRUE, posthoc = TRUE,
                diagnostics = FALSE))$val
check("B09 ... the Games-Howell pairs under Welch the same",
      .ph_ok(.b9$posthoc, .b9$descriptives_raw) &&
        identical(unique(.b9$posthoc$test), "Games-Howell"))

.b10 <- tryCatch(local({
  tb <- data.frame(comparison = c("b-a", "c-a", "c-b"), diff = 1:3)
  gm <- data.frame(level = c("a", "b", "c"), code = c(10, 20, 30),
                   label = c("A", "B", "C"), stringsAsFactors = FALSE)
  list(good = .jst_posthoc_codes(tb, gm),
       bad  = .jst_posthoc_codes(transform(tb, comparison = c("a-b", "c-a", "c-b")), gm))
}), error = function(e) NULL)
check("B10 a comparison column in another order gets NA codes, never a guess",
      !is.null(.b10) && identical(.b10$good$group1_code, c(20, 30, 30)) &&
        identical(.b10$good$group2_label, c("A", "A", "B")) &&
        all(is.na(.b10$bad$group1_code)) && all(is.na(.b10$bad$group2_label)))

.b11 <- res(jaov(Y ~ Gf, tsy, diagnostics = FALSE))$val
check("B11 a factor grouping variable: Code is the level itself, Label NA",
      !is.null(.b11) && identical(.b11$descriptives$Code, c("lo", "mid", "hi")) &&
        all(is.na(.b11$descriptives$Label)))

# =============================================================================
# C. jcrosstab(): each row and column category's code and label
# =============================================================================
cat("\n--- C. jcrosstab() ---\n")

.c1 <- res(jcrosstab(Region ~ Volunteer, tcm, chisq = TRUE))$val
check("C01 row_categories and col_categories: the stored tables' level names, each with its code and label, in their order",
      !is.null(.c1) &&
        identical(.c1$row_categories$level, rownames(.c1$observed)) &&
        identical(.c1$col_categories$level, colnames(.c1$observed)) &&
        identical(as.numeric(.c1$row_categories$code), c(1, 2, 3, 4)) &&
        identical(.c1$row_categories$label, c("North", "South", "East", "West")) &&
        identical(as.numeric(.c1$col_categories$code), c(0, 1)) &&
        identical(.c1$col_categories$label, c("No", "Yes")))
check("C02 ... each variable's name and label ride as the attribute variable",
      !is.null(.c1) &&
        identical(attr(.c1$row_categories, "variable", exact = TRUE),
                  c(name = "Region", label = attr(tcm$Region, "label", exact = TRUE))) &&
        identical(attr(.c1$col_categories, "variable", exact = TRUE),
                  c(name = "Volunteer", label = attr(tcm$Volunteer, "label", exact = TRUE))))

.c3 <- res(jcrosstab(Grp ~ G01, tsy))$val
check("C03 a text variable's codes are its text, a plain numeric one's its numbers; no labels",
      !is.null(.c3) && identical(.c3$row_categories$code, c("x", "y")) &&
        identical(.c3$col_categories$code, c(1, 2)) &&
        all(is.na(c(.c3$row_categories$label, .c3$col_categories$label))))

.c4 <- res(jcrosstab(Ctry ~ Grp, tsy))$val
check("C04 a labelled text variable with blank cells: codes as the cells hold them, <blank> one category",
      !is.null(.c4) && setequal(.c4$row_categories$code, c("<blank>", "FR", "UK", "US")) &&
        identical(.c4$row_categories$label[.c4$row_categories$code == "US"], "United States"))

# =============================================================================
# D. jdesc(by =): descriptives_raw, per variable and group
# =============================================================================
cat("\n--- D. jdesc(by =) ---\n")

.d1 <- res(jdesc(tcm, Age, WellbeingScore, by = Region))$val
.d1r <- .d1$descriptives_raw
.d_age <- .grp(tcm$Age, as.numeric(unclass(tcm$Region)))
check("D01 jdesc(by =) fills descriptives_raw: one row per variable and group, in the order printed, each group's code and label",
      !is.null(.d1r) && nrow(.d1r) == 8L &&
        identical(.d1r$variable, rep(c("Age", "WellbeingScore"), each = 4)) &&
        identical(as.numeric(.d1r$group_code), rep(c(1, 2, 3, 4), 2)) &&
        identical(.d1r$group_label, rep(c("North", "South", "East", "West"), 2)))
check("D02 ... the statistics unrounded: N, min, max, mean and SD of each group's cases",
      !is.null(.d1r) &&
        identical(as.integer(.d1r$n_valid[1:4]), unname(vapply(.d_age, length, integer(1)))) &&
        isTRUE(all.equal(.d1r$mean[1:4], unname(vapply(.d_age, mean, numeric(1))))) &&
        isTRUE(all.equal(.d1r$sd[1:4], unname(vapply(.d_age, stats::sd, numeric(1))))) &&
        isTRUE(all.equal(.d1r$min[1:4], unname(vapply(.d_age, min, numeric(1))))) &&
        isTRUE(all.equal(.d1r$max[1:4], unname(vapply(.d_age, max, numeric(1))))) &&
        identical(.d1r$total - .d1r$n_valid, .d1r$n_missing))
check("D03 ... the variables' labels as the ungrouped frame keys them, the grouping variable as the attribute by",
      !is.null(.d1r) &&
        identical(attr(.d1r, "labels", exact = TRUE),
                  c(Age = attr(tcm$Age, "label", exact = TRUE),
                    WellbeingScore = attr(tcm$WellbeingScore, "label", exact = TRUE))) &&
        identical(attr(.d1r, "by", exact = TRUE),
                  c(name = "Region", label = attr(tcm$Region, "label", exact = TRUE))))

.d4 <- res(jdesc(tsy, Y, by = Grp))$val$descriptives_raw
check("D04 a text grouping variable: group_code its text, group_label NA",
      !is.null(.d4) && identical(.d4$group_code, c("x", "y")) && all(is.na(.d4$group_label)))

# =============================================================================
# E. jcorr(): each variable's M and SD
# =============================================================================
cat("\n--- E. jcorr() ---\n")

.num <- function(x) as.numeric(haven::zap_missing(x))
.e1 <- res(jcorr(tcm, Age, WellbeingScore, Income))$val
.e1r <- .e1$descriptives_raw
check("E01 jcorr() stores each variable's N, mean and SD, unrounded, declared missing values out",
      !is.null(.e1r) && identical(.e1r$variable, c("Age", "WellbeingScore", "Income")) &&
        identical(as.integer(.e1r$n_valid),
                  c(sum(!is.na(tcm$Age)), sum(!is.na(tcm$WellbeingScore)),
                    sum(!is.na(.num(tcm$Income))))) &&
        isTRUE(all.equal(.e1r$mean[3], mean(.num(tcm$Income), na.rm = TRUE))) &&
        isTRUE(all.equal(.e1r$sd[3], stats::sd(.num(tcm$Income), na.rm = TRUE))))
.e2 <- res(jcorr(tcm, Age, Income))$val
check("E02 ... a correlation of two variables stores them too",
      !is.null(.e2$descriptives_raw) &&
        isTRUE(all.equal(.e2$descriptives_raw$mean,
                         c(mean(tcm$Age), mean(.num(tcm$Income), na.rm = TRUE)))))

# =============================================================================
# F. jalpha(): alpha and the item statistics unrounded
# =============================================================================
cat("\n--- F. jalpha() ---\n")

.f_items <- c("Environment1", "Environment2", "Environment3", "Environment4",
              "Environment5")
.f_x <- as.data.frame(lapply(tcm[.f_items], .num))
.f_x <- .f_x[stats::complete.cases(.f_x), ]
.f_k <- ncol(.f_x)
.f_alpha <- .f_k / (.f_k - 1) * (1 - sum(vapply(.f_x, stats::var, numeric(1))) /
                                 stats::var(rowSums(.f_x)))
.f1 <- res(jalpha(tcm, Environment1, Environment2, Environment3, Environment4,
                  Environment5))$val
check("F01 jalpha(): alpha_raw is Cronbach's alpha on the complete cases, unrounded; the stored alpha is it rounded",
      !is.null(.f1$alpha_raw) && isTRUE(all.equal(.f1$alpha_raw, .f_alpha)) &&
        identical(.f1$alpha, round(.f1$alpha_raw, 3)) && .f1$alpha != .f1$alpha_raw)
.f_r <- vapply(seq_len(.f_k), function(i) stats::cor(.f_x[[i]], rowSums(.f_x[-i])),
               numeric(1))
check("F02 items_raw: each item's N, mean, SD and corrected item-total r unrounded; the printed tables round them",
      !is.null(.f1$items_raw) && identical(.f1$items_raw$item, .f_items) &&
        identical(as.integer(.f1$items_raw$n), rep(nrow(.f_x), .f_k)) &&
        isTRUE(all.equal(.f1$items_raw$mean, unname(colMeans(.f_x)))) &&
        isTRUE(all.equal(.f1$items_raw$item_total_r, .f_r)) &&
        identical(round(.f1$items_raw$mean, 3), .f1$item_statistics$Mean) &&
        identical(round(.f1$items_raw$item_total_r, 3),
                  .f1$item_total_statistics$Corrected_Item_Total_r) &&
        identical(round(.f1$items_raw$alpha_if_deleted, 3),
                  .f1$item_total_statistics$Alpha_If_Deleted))
check("F03 ... each item's label whole",
      !is.null(.f1$items_raw) &&
        identical(.f1$items_raw$label,
                  unname(vapply(.f_items, function(v) attr(tcm[[v]], "label", exact = TRUE),
                                character(1)))))

# =============================================================================
# G. The version stamp
# =============================================================================
cat("\n--- G. The version stamp ---\n")

.ver <- as.character(utils::packageVersion("jstats"))
.g_all <- list(
  jdesc     = res(jdesc(tcm, Age))$val,
  jdesc_by  = .d1,
  jfreq     = .a1,
  jscreen   = res(jscreen(tcm))$val,
  jt        = .b1,
  jaov      = .b7,
  jcrosstab = .c1,
  jcorr2    = .e2,
  jcorr3    = .e1,
  jlm       = res(jlm(WellbeingScore ~ Age, tcm))$val,
  jlogistic = res(jlogistic(Volunteer ~ Age, tcm))$val,
  jalpha    = .f1)
.g_bad <- names(.g_all)[!vapply(.g_all, function(r)
  identical(attr(r, "jstats_version", exact = TRUE), .ver), logical(1))]
check(paste0("G01 every result the ten analysis functions make carries jstats_version, the version that made it (",
             length(.g_all), " results)"),
      length(.g_bad) == 0L)
if (length(.g_bad)) cat("        unstamped: ", paste(.g_bad, collapse = ", "), "\n", sep = "")

.g2 <- local({
  f <- tempfile(fileext = ".rds"); on.exit(unlink(f))
  saveRDS(.b7, f); readRDS(f)
})
check("G02 the stamp survives a save to disk and a read back",
      identical(attr(.g2, "jstats_version", exact = TRUE), .ver))
.g3 <- res(jsum(tcm, Environment1, Environment2))$val
check("G03 jsum()'s value goes into the data frame and carries no stamp",
      !is.null(.g3) && is.null(attr(.g3, "jstats_version", exact = TRUE)))

# =============================================================================
# H. The accessors: a method for every class, and what each reads
# =============================================================================
cat("\n--- H. The accessors ---\n")

.h_cls <- c("jst_lm", "jst_logistic", "jst_freq", "jst_desc", "jst_corr",
            "jst_ttest", "jst_anova", "jst_crosstab", "jst_alpha")
# Registration is read off the namespace's S3 methods table, where
# registerS3method() puts it: getS3method() also finds a method by its name
# in the namespace, so it cannot tell a registered method from one .onLoad
# never registered (the zzz.R mutant passed it).
.h_tab <- get(".__S3MethodsTable__.", envir = asNamespace("jstats"))
.h_reg <- vapply(.h_cls, function(cls) {
  exists(paste0(".jst_apa_terms.", cls), envir = .h_tab, inherits = FALSE) &&
    exists(paste0(".jst_apa_model.", cls), envir = .h_tab, inherits = FALSE)
}, logical(1))
check("H01 every result class has both accessor methods registered, and is in .jst_apa_classes",
      all(.h_reg) && all(.h_cls %in% .jst_apa_classes))

.h_res <- list(jst_lm = .g_all$jlm, jst_logistic = .g_all$jlogistic,
               jst_freq = .a1, jst_desc = .d1, jst_corr = .e1,
               jst_ttest = .b1, jst_anova = .b7, jst_crosstab = .c1,
               jst_alpha = .f1)
.h_null <- names(.h_res)[vapply(names(.h_res), function(cls) {
  r <- .h_res[[cls]]
  !inherits(r, cls) || is.null(.jst_apa_terms(r)) ||
    (cls != "jst_desc" && is.null(.jst_apa_model(r)))
}, logical(1))]
check("H02 each class's own methods answer: .jst_apa_terms() gives rows for every class, .jst_apa_model() a row for all but jst_desc",
      length(.h_null) == 0L)
if (length(.h_null)) cat("        no answer: ", paste(.h_null, collapse = ", "), "\n", sep = "")

.h3 <- .jst_apa_terms(.a1)
check("H03 frequencies: block valid then missing, each row's code and label from the result, the counts as stored",
      !is.null(.h3) &&
        identical(.h3$block, c(rep("valid", 5), rep("missing", 2))) &&
        identical(as.numeric(.h3$code), c(as.numeric(.a1v$Code), as.numeric(.a9$Code))) &&
        identical(.h3$label, c(.a1v$Label, .a9$Label)) &&
        identical(.h3$count, c(.a1v$Freq, .a9$Freq)) &&
        all(is.na(.h3$valid_pct[.h3$block == "missing"])))

.h4 <- .jst_apa_terms(.d1)
check("H04 grouped descriptives: identifiers first -- variable, var_label, group_code, group_label -- then the statistics",
      !is.null(.h4) &&
        identical(names(.h4), c("variable", "var_label", "group_code", "group_label",
                                "total", "n_valid", "n_missing", "min", "max",
                                "mean", "sd")) &&
        identical(.h4$var_label[1], attr(tcm$Age, "label", exact = TRUE)) &&
        identical(attr(.h4, "by", exact = TRUE), attr(.d1r, "by", exact = TRUE)))

.h5 <- attr(.jst_apa_terms(.e1), "variables", exact = TRUE)
check("H05 correlations: the variables' N, mean and SD ride beside the pairs as the attribute variables",
      !is.null(.h5) && identical(.h5$variable, .e1r$variable) &&
        isTRUE(all.equal(.h5$mean, .e1r$mean)) && isTRUE(all.equal(.h5$sd, .e1r$sd)))

.h6m <- .jst_apa_model(.b1)
.h6l <- res(jt(WellbeingScore ~ Volunteer, tcm, diagnostics = "levene"))$val
.h6lm <- .jst_apa_model(.h6l)
check("H06 jt(): one model row, the statistic, df and p as returned; Levene's columns NA unless it was run, then its F and p",
      !is.null(.h6m) && !is.null(.h6lm) &&
        identical(.h6m$t, .b1$t) && identical(.h6m$p, .b1$p) &&
        identical(.h6m$ci_lower, unname(.b1$ci["lower"])) &&
        is.na(.h6m$levene_f) && is.na(.h6m$levene_p) &&
        identical(.h6lm$levene_f, unname(.h6l$levene$F)) &&
        identical(.h6lm$levene_p, unname(.h6l$levene$p)))

.h7 <- .jst_apa_terms(.b7)
check("H07 jaov(): the group rows, the post-hoc table as the attribute posthoc, the model row's F and eta-squared",
      !is.null(.h7) && identical(attr(.h7, "posthoc", exact = TRUE), .b7$posthoc) &&
        identical(.jst_apa_model(.b7)$f, .b7$f) &&
        identical(.jst_apa_model(.b7)$eta_squared, .b7$eta_squared))

.h8 <- .jst_apa_terms(.c1)
.h8o <- unclass(.c1$observed)
check("H08 crosstab: one row per cell, row by row; counts, expected counts and residuals as stored; row percentages sum to 100",
      !is.null(.h8) && nrow(.h8) == length(.h8o) &&
        identical(.h8$count, as.numeric(t(.h8o))) &&
        isTRUE(all.equal(.h8$expected, as.numeric(t(.c1$expected)))) &&
        isTRUE(all.equal(.h8$adjusted_residual, as.numeric(t(.c1$adjusted_residuals)))) &&
        isTRUE(all.equal(as.numeric(tapply(.h8$row_pct, .h8$row_level, sum)), rep(100, 4))) &&
        identical(.h8$row_label[1], "North") && identical(as.numeric(.h8$col_code[2]), 1))

.h9 <- res(jcrosstab(Region ~ Volunteer, tcm))$val
check("H09 crosstab model: the chi-square columns as returned with chisq = TRUE, NA without it",
      !is.null(.h9) &&
        identical(.jst_apa_model(.c1)$chi_square, unname(as.numeric(.c1$chi_square))) &&
        identical(.jst_apa_model(.c1)$cramers_v, unname(as.numeric(.c1$cramers_v))) &&
        is.na(.jst_apa_model(.h9)$chi_square) && is.na(.jst_apa_model(.h9)$p))

check("H10 reliability: the item rows from items_raw, the model row's alpha unrounded",
      !is.null(.f1$items_raw) && !is.null(.f1$alpha_raw) &&
        identical(.jst_apa_terms(.f1), `rownames<-`(.f1$items_raw, NULL)) &&
        identical(.jst_apa_model(.f1)$alpha, .f1$alpha_raw))

.h11 <- local({
  old_f <- .a1; old_f$frequencies$Education$valid$Code <- NULL
  old_f$frequencies$Education$valid$Label <- NULL
  old_t <- .b1; old_t$descriptives_raw <- NULL
  old_x <- .c1; old_x$row_categories <- NULL; old_x$col_categories <- NULL
  old_a <- .f1; old_a$items_raw <- NULL; old_a$alpha_raw <- NULL
  list(f = tryCatch(.jst_apa_terms(old_f), error = function(e) "error"),
       t = tryCatch(.jst_apa_terms(old_t), error = function(e) "error"),
       x = tryCatch(.jst_apa_terms(old_x), error = function(e) "error"),
       a = tryCatch(.jst_apa_model(old_a), error = function(e) "error"))
})
check("H11 a result made before the build reads without an error: NA codes and labels, or NULL where the field is missing",
      is.data.frame(.h11$f) && all(is.na(.h11$f$code[.h11$f$block == "valid"])) &&
        is.null(.h11$t) && is.data.frame(.h11$x) && all(is.na(.h11$x$row_code)) &&
        is.null(.h11$a))

# --- The message surface, swept (guard 4) ------------------------------------
# The analyses above raise notes and warnings of their own (a seems-
# categorical warning, the load scan, jalpha()'s reverse-coded item); every
# one res() recorded is swept here.

.sw <- Filter(function(s) identical(as.numeric(s$width), as.numeric(.pin_width)),
              .seen)
.sw <- .sw[!duplicated(vapply(.sw, function(s) paste(s$kind, s$text), ""))]

.ln <- unlist(lapply(.sw, function(s) strsplit(s$text, "\n", fixed = TRUE)[[1]]))
.ln <- .ln[nzchar(trimws(.ln)) & !grepl("^\\s{2}", .ln)]
.ln <- .ln[!grepl("^([A-Za-z]:[\\\\/]|/|~|\\\\\\\\)", .ln)]
check(paste0("Z01 no prose line of a message exceeds ", .pin_width,
             " columns (", length(.sw), " conditions)"),
      length(.sw) >= 2L && !any(nchar(.ln, type = "width") > .pin_width))

pbreaks <- function(txt, width, first_line_slack = 0L) {
  ls   <- strsplit(txt, "\n", fixed = TRUE)[[1]]
  out  <- character(0)
  unit <- function(b) {
    tk <- strsplit(b, " ", fixed = TRUE)[[1]]
    n  <- if (length(tk) >= 3L && identical(tk[2L], "=")) 3L else 1L
    is_open <- function(x) {
      ch <- strsplit(x, "", fixed = TRUE)[[1]]
      sum(ch == "(") > sum(ch == ")") || sum(ch == "\"") %% 2L == 1L
    }
    while (n < length(tk) && is_open(paste(tk[seq_len(n)], collapse = " "))) {
      n <- n + 1L
    }
    paste(tk[seq_len(n)], collapse = " ")
  }
  for (i in seq_len(max(0L, length(ls) - 1L))) {
    a <- ls[i]; b <- ls[i + 1L]
    if (!nzchar(a) || !nzchar(b) || grepl("^ ", a) || grepl("^ ", b)) next
    if (grepl("[.!?]$", a) &&
        !grepl("^([A-Za-z]\\.){2,}$", sub(".*\\s", "", a))) next
    if (grepl("^[A-Z][a-z]+[ ,]", b) || grepl("^\\(", b)) next
    if (grepl("^([A-Za-z]:[\\\\/]|/|~|\\\\\\\\)", b)) next      # a file path
    if (grepl("[.!?:][)\"']?$", b)) next
    budget <- width - if (i == 1L) first_line_slack else 0L
    if (nchar(a, type = "width") + 1L + nchar(unit(b), type = "width") <= budget)
      out <- c(out, sprintf("[%d] %s | %s", i, a, unit(b)))
  }
  out
}
.pb <- unlist(lapply(.sw, function(s) {
  pbreaks(s$text, .pin_width, switch(s$kind, error = 8L, warning = 9L, 0L))
}))
check("Z02 no premature break: a line's first unit never fit on the line above",
      length(.sw) >= 2L && length(.pb) == 0L)
if (length(.pb) > 0L) for (l in .pb) cat("        early: ", l, "\n")

unparsed <- function(txt) {
  ls    <- strsplit(txt, "\n", fixed = TRUE)[[1]]
  shape <- "^ {2,}[A-Za-z.][A-Za-z0-9._]*(\\$[A-Za-z0-9._]+)* *(\\(|<- )"
  bad <- character(0); n <- 0L; i <- 1L
  while (i <= length(ls)) {
    if (grepl(shape, ls[i]) && !grepl("<[A-Za-z][A-Za-z ]*>", ls[i])) {
      n <- n + 1L; j <- i
      repeat {
        ok <- !inherits(try(parse(text = paste(ls[i:j], collapse = "\n")),
                            silent = TRUE), "try-error")
        if (ok || j >= length(ls) || !grepl("^ {2,}", ls[j + 1L])) break
        j <- j + 1L
      }
      if (!ok) bad <- c(bad, ls[i])
      i <- j + 1L
    } else i <- i + 1L
  }
  list(n = n, bad = bad)
}
.up <- lapply(.sw, function(s) unparsed(s$text))
.ub <- unlist(lapply(.up, function(u) u$bad))
check("Z03 every runnable line in a message parses",
      length(.ub) == 0L)
if (length(.ub) > 0L) for (l in .ub) cat("        does not parse: ", l, "\n")

# --- Restore session state ---------------------------------------------------
# Guard 1, above the verdict so a failing run hands the session back too.

options(.jst_options_message_width      = .entry_message_width)
options(.jst_default_data               = .entry_default_data)
options(.jst_options_missing_convention = .entry_convention)
options(.jst_output_level               = .entry_output_level)
options(.jst_output_toggles             = .entry_output_toggles)
options(.entry_stores)

# --- Verdict -----------------------------------------------------------------

.n_ok <- sum(vapply(.results, `[[`, logical(1), "ok"))
.n    <- length(.results)
if (.n_ok == .n) {
  cat("\nRESULT: PASS (", .n_ok, "/", .n, ")\n", sep = "")
  .ws_restore()   # guard 5, ahead of guard 2's cleanup
  rm(list = setdiff(ls(globalenv(), all.names = TRUE),
                    c(.entry_names, ".results")), envir = globalenv())
} else {
  cat("\nRESULT: FAIL (", .n_ok, "/", .n, " passed)\n", sep = "")
  for (r in .results) if (!r$ok) cat("  failed: ", r$desc, "\n", sep = "")
  .ws_restore()   # guard 5: the user's objects back, a red run's fixtures kept
  stop("assertion battery failed", call. = FALSE)
}
