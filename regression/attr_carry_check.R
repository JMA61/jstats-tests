# =============================================================================
# attr_carry_check.R -- passenger attributes survive every column rebuild
# =============================================================================
# TYPE:     assertion battery (PASS/FAIL; written for Claude's checking)
# LOCKS:    .jst_carry_col_attrs() and its ten call sites (S299): a haven
#           display format (format.spss, format.stata) and Data Editor width
#           (display_width) survive jdeclare_missing() on every branch
#           (codes / range, single and vars =, spss / stata / sas),
#           jrelabel(labels =), jrecode(), jconvert() in every direction,
#           and jsave()'s .dta pre-write -- while the declaration, the
#           labels and the values those rebuilds SET are untouched, and a
#           plain column gains nothing. jencode() is the deliberate
#           NON-carry (section G): its text source's "A<n>" format must
#           NOT reach the numeric result. Section F is the S298 field
#           finding 2 itself: a declared column's .sav round trip reads
#           back its delivered format, not the writer's F8.2.
# ORIGIN:   S299 (v0.9.171); field finding 2 at S298 (jstats 0.9.170 on
#           the field corpus, 52 declared columns read back F8.2)
# S337 EDIT (v0.9.211, 2026-10-05; no package change): the two session guards
#           of _template_check.R. A GREEN run now removes everything the
#           battery made (the names in the workspace are recorded at Setup;
#           .results stays, for run_all.R), so a walk that reports on the data
#           frames in the workspace can follow it in one session. A red run
#           keeps its fixtures. The output level is recorded at Setup and
#           handed back at the foot (joutput(NULL) had left the session at the
#           default). No check added or changed: 52/52 in the sandbox, plain,
#           under the RStudio-handler stand-in, and ENTERED DIRTY
#           (joutput("full"), width 90, a juse() default, a stata convention):
#           nothing left but .results, and the width, the default frame, the
#           level and the convention as they were on entry. (Setup still clears
#           stored jsubset(), jcomplete() and registration settings, as it
#           always has.)
# LAST VERIFIED: v0.9.171, 2026-09-18 (S299) -- sandbox, R 4.3.3 /
#           haven 2.5.4; needs its WORKSTATION stamp. Mutation run against
#           the unedited 0.9.170 master: A, B, C, D, E, F fail (helper
#           absent; tags dropped), the keeps-checks and G pass.
# RUN:      source()-safe from any working directory. All output is explicit
#           cat(), so echo = TRUE is NOT required. Also runnable via
#           regression/run_all.R, which treats a stop() as FAIL. No dataset:
#           the fixture is inline, so the jload() call is DELETED.
# CONTRACT: one printed line per check, a final "RESULT: PASS (n/n)" line,
#           and stop() if and only if any check failed.
# =============================================================================

# --- Setup -------------------------------------------------------------------

# jstats must be loaded already: devtools::load_all() (development) OR
# library(jstats) (installed) -- never both in one session.
stopifnot(exists("jload", mode = "function"))

# What is in the workspace on entry (S337): on a green run everything this
# battery made beyond it is removed at the foot, so a walk that reports on
# the data frames in the workspace can follow a battery in one session.
.entry_names <- ls(globalenv(), all.names = TRUE)

# Session state to hand back at the foot (record / force / restore, S253).
.entry_message_width <- getOption(".jst_options_message_width")
.entry_default_data  <- getOption(".jst_default_data")
.entry_convention    <- getOption(".jst_options_missing_convention")
# The output level too (S337; the S249 item's guard (4)): joutput(NULL) below
# forces the default, and without this line the session came back there.
.entry_output_level  <- getOption(".jst_output_level")

# Message-width pin (mandatory since S253). Nothing here asserts wording,
# but the pin keeps the run environment-independent all the same.
.pin_width <- 76L
options(.jst_options_message_width = .pin_width)

# Every jdeclare_missing() / jconvert() call below names its convention,
# so the session slot is forced UNSET to prove that nothing leans on it.
options(.jst_options_missing_convention = NULL)

# Neutral pipeline state (state persists across calls AND across sessions).
jsubset(clear.all = TRUE); jcomplete(clear.all = TRUE); joutput(NULL)
jdummy(clear.all = TRUE)
juse(NULL)

# --- Fixture -----------------------------------------------------------------
# Eight rows, built in place (no .sav on disk, so no user_na trap). Each
# column carries the tag family a haven read would attach:
#   num     labelled_spss, no declaration yet -- format.spss F2.0, width 5
#   num2    an identical twin: the CONTROL in single-column calls, the
#           second target in vars = calls
#   decl    labelled_spss with -99 DECLARED -- F3.0; the source for the
#           spss -> stata / sas and the baseR strip legs
#   tagged  labelled with lowercase .a cells and a label on .a --
#           format.stata %8.2f; the stata -> spss source and the .dta leg
#   upper   labelled with UPPERCASE .A cells (SAS-form) -- %9.0g; the
#           case-flip and the .dta pre-write source
#   txt     character with format.spss A8 -- jencode's source (section G)
#   plain   bare double, no attributes -- the no-op lock
tag_spss <- function(x, fmt, width = 5L) {
  attr(x, "format.spss")   <- fmt
  attr(x, "display_width") <- width
  x
}
tag_stata <- function(x, fmt) { attr(x, "format.stata") <- fmt; x }

d <- data.frame(id = 1:8)
d$num  <- tag_spss(haven::labelled_spss(c(1, 2, 3, -99, 2, 1, 3, -55),
                                        labels = c(Refused = -99)), "F2.0")
d$num2 <- d$num
d$decl <- tag_spss(haven::labelled_spss(c(1, 2, -99, 3, 2, -99, 1, 3),
                                        labels = c(Refused = -99),
                                        na_values = -99), "F3.0", 6L)
d$tagged <- tag_stata(haven::labelled(
  c(1, 2, haven::tagged_na("a"), 3, 2, haven::tagged_na("a"), 1, 3),
  labels = c(Refused = haven::tagged_na("a"))), "%8.2f")
d$upper <- tag_stata(haven::labelled(
  c(1, 2, haven::tagged_na("A"), 3, 2, haven::tagged_na("A"), 1, 3),
  labels = c(Refused = haven::tagged_na("A"))), "%9.0g")
d$txt <- c("Yes", "No", "Yes", "", "No", "Yes", "No", "Yes")
attr(d$txt, "format.spss") <- "A8"
d$plain <- c(1, 2, 3, 4, 3, 2, 1, 4)

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

# quiet(): run a call with its console output and messages swallowed, and
# return its value. Every check here reads the RESULT, never the wording.
quiet <- function(expr) {
  zz <- textConnection(".junk", "w", local = TRUE)
  sink(zz, type = "output")
  on.exit({ sink(type = "output"); close(zz) }, add = TRUE)
  suppressMessages(suppressWarnings(expr))
}

# Tag readers. NULL-safe by construction: a NULL column reads as
# "<null>", which matches nothing, so a check cannot pass by reading
# attributes off a value that is not a column (the S299 false-positive
# lesson: three registration verbs returned invisible(NULL) and "passed").
fspss <- function(x) { if (is.null(x)) return("<null>")
  a <- attr(x, "format.spss",  exact = TRUE); if (is.null(a)) "<none>" else a }
fstat <- function(x) { if (is.null(x)) return("<null>")
  a <- attr(x, "format.stata", exact = TRUE); if (is.null(a)) "<none>" else a }
dwid  <- function(x) { if (is.null(x)) return(-1L)
  a <- attr(x, "display_width", exact = TRUE); if (is.null(a)) -1L else a }

# =============================================================================
# A. The helper itself
# =============================================================================
cat("\n--- A. .jst_carry_col_attrs() unit ---\n")

.from <- d$num
.to   <- haven::labelled_spss(c(1, 2, 3, NA, 2, 1, 3, NA),
                              labels = c(Refused = -99), na_values = -99)

check("A01 fills a format.spss the rebuilt column lacks",
      identical(fspss(.jst_carry_col_attrs(.from, .to)), "F2.0"))
check("A02 fills a display_width the rebuilt column lacks",
      identical(dwid(.jst_carry_col_attrs(.from, .to)), 5L))
check("A03 never overrides an attribute the rebuilt column already has", {
  .to2 <- .to; attr(.to2, "format.spss") <- "F8.2"
  identical(fspss(.jst_carry_col_attrs(.from, .to2)), "F8.2")
})
check("A04 owned set: from's labels are not carried (to keeps its own)", {
  .to3 <- .to; attr(.to3, "labels") <- c(Other = -55)
  identical(attr(.jst_carry_col_attrs(.from, .to3), "labels"),
            c(Other = -55))
})
check("A05 owned set: from's na_values do not land on a to without them", {
  .to4 <- haven::labelled(c(1, 2, 3, 4, 2, 1, 3, 4))
  is.null(attr(.jst_carry_col_attrs(d$decl, .to4), "na_values"))
})
check("A06 structural set: to keeps its own class", {
  .to5 <- haven::labelled(c(1, 2, 3, 4, 2, 1, 3, 4))
  identical(class(.jst_carry_col_attrs(.from, .to5)), class(.to5))
})
check("A07 a bare from adds nothing (to returned identical)",
      identical(.jst_carry_col_attrs(d$plain, .to), .to))
check("A08 to gains exactly the passenger set and nothing else", {
  gained <- setdiff(names(attributes(.jst_carry_col_attrs(.from, .to))),
                    names(attributes(.to)))
  setequal(gained, c("format.spss", "display_width"))
})

# =============================================================================
# B. jdeclare_missing() -- every branch
# =============================================================================
cat("\n--- B. jdeclare_missing() ---\n")

.b1 <- quiet(jdeclare_missing(d, num, codes = c(-99, -55),
                              convention = "spss", missing.notice = FALSE))
check("B01 codes, single: format.spss survives",
      identical(fspss(.b1$num), "F2.0"))
check("B02 codes, single: display_width survives",
      identical(dwid(.b1$num), 5L))
check("B03 codes, single: the declaration still lands (na_values -99, -55)",
      setequal(attr(.b1$num, "na_values"), c(-99, -55)))
check("B04 codes, single: value labels untouched",
      identical(attr(.b1$num, "labels"), c(Refused = -99)))
check("B05 codes, single: the control column is untouched",
      identical(.b1$num2, d$num2))

.b2 <- quiet(jdeclare_missing(d, num, range = c(-99, -51),
                              convention = "spss", missing.notice = FALSE))
check("B06 range, single: format.spss survives",
      identical(fspss(.b2$num), "F2.0"))
check("B07 range, single: the band still lands (na_range -99 to -51)",
      identical(as.numeric(attr(.b2$num, "na_range")), c(-99, -51)))

.b3 <- quiet(jdeclare_missing(d, vars = c("num", "num2"), range = c(-99, -51),
                              convention = "spss", missing.notice = FALSE))
check("B08 range, vars = bulk: both columns keep format.spss",
      identical(fspss(.b3$num), "F2.0") && identical(fspss(.b3$num2), "F2.0"))
check("B09 range, vars = bulk: both columns keep display_width",
      identical(dwid(.b3$num), 5L) && identical(dwid(.b3$num2), 5L))

.b4 <- quiet(jdeclare_missing(d, num, codes = c(-99, -55),
                              convention = "stata", missing.notice = FALSE))
check("B10 stata convert (cells -> tagged NA): format.spss survives",
      identical(fspss(.b4$num), "F2.0"))
check("B11 stata convert: the cells are tagged (two markers present)",
      sum(!is.na(haven::na_tag(.b4$num))) == 2L)

.b5 <- quiet(jdeclare_missing(d, num, codes = c(-99, -55),
                              convention = "sas", missing.notice = FALSE))
check("B12 sas convert: format.spss survives",
      identical(fspss(.b5$num), "F2.0"))

.b6 <- quiet(jdeclare_missing(d, tagged, codes = c("Not asked" = ".a"),
                              convention = "stata", missing.notice = FALSE))
check("B13 stata canonical (label existing .a cells): format.stata survives",
      identical(fstat(.b6$tagged), "%8.2f"))
check("B14 stata canonical: the label lands on .a",
      identical(names(attr(.b6$tagged, "labels")), "Not asked"))

# =============================================================================
# C. jrelabel()
# =============================================================================
cat("\n--- C. jrelabel() ---\n")

.c1 <- quiet(jrelabel(d, num, labels = "-99=Refused; -55=Not asked"))
check("C01 labels =: format.spss survives (the labelled::val_labels<- drop)",
      identical(fspss(.c1), "F2.0"))
check("C02 labels =: display_width survives",
      identical(dwid(.c1), 5L))
check("C03 labels =: the labels land",
      setequal(names(attr(.c1, "labels")), c("Refused", "Not asked")))
.c2 <- quiet(jrelabel(d, num, var.label = "A label"))
check("C04 var.label =: still keeps format.spss (in-place path, unchanged)",
      identical(fspss(.c2), "F2.0"))
.c3 <- quiet(jrelabel(d, tagged, labels = ".a=Not asked"))
check("C05 labels = on a Stata-form column: format.stata survives",
      identical(fstat(.c3), "%8.2f"))

# =============================================================================
# D. jrecode()
# =============================================================================
cat("\n--- D. jrecode() ---\n")

.d1 <- quiet(jrecode(d, num, map = "1,2=1; 3=2; else=copy"))
check("D01 map: format.spss survives",
      identical(fspss(.d1), "F2.0"))
check("D02 map: display_width survives",
      identical(dwid(.d1), 5L))
check("D03 map: the values are recoded (1,2 -> 1; 3 -> 2)",
      identical(as.numeric(unclass(.d1))[1:3], c(1, 1, 2)))
.d2 <- quiet(jrecode(d, num, map = "1,2=1; 3=2; else=copy",
                     labels = "1=Low; 2=High"))
check("D04 map + labels: format.spss survives",
      identical(fspss(.d2), "F2.0"))
check("D05 map + labels: the labels land",
      identical(attr(.d2, "labels"), c(Low = 1, High = 2)))
.d3 <- quiet(jrecode(d, plain, map = "1,2=1; 3,4=2"))
check("D06 a bare original: the result carries no format (nothing invented)",
      identical(fspss(.d3), "<none>") && identical(dwid(.d3), -1L))
.d4 <- quiet(jrecode(d, tagged, map = "1,2=1; 3=2; else=copy"))
check("D07 a Stata-form original: format.stata survives",
      identical(fstat(.d4), "%8.2f"))

# =============================================================================
# E. jconvert() -- every direction
# =============================================================================
cat("\n--- E. jconvert() ---\n")

.e1 <- quiet(jconvert(d, decl, to = "stata", missing.notice = FALSE))
check("E01 spss -> stata: format.spss survives",
      identical(fspss(.e1$decl), "F3.0"))
check("E02 spss -> stata: display_width survives",
      identical(dwid(.e1$decl), 6L))
check("E03 spss -> stata: the -99 cells are now tagged",
      sum(!is.na(haven::na_tag(.e1$decl))) == 2L)
.e2 <- quiet(jconvert(d, decl, to = "sas", missing.notice = FALSE))
check("E04 spss -> sas: format.spss survives",
      identical(fspss(.e2$decl), "F3.0"))
.e3 <- quiet(jconvert(d, tagged, to = "spss", missing.notice = FALSE))
check("E05 stata -> spss: format.stata survives",
      identical(fstat(.e3$tagged), "%8.2f"))
check("E06 stata -> spss: a numeric code is now declared",
      length(attr(.e3$tagged, "na_values")) == 1L)
.e4 <- quiet(jconvert(d, upper, to = "stata", missing.notice = FALSE))
check("E07 sas -> stata (case flip): format.stata survives",
      identical(fstat(.e4$upper), "%9.0g"))
check("E08 sas -> stata: the markers are now lowercase",
      all(haven::na_tag(.e4$upper)[!is.na(haven::na_tag(.e4$upper))] == "a"))
.e5 <- quiet(jconvert(d, decl, to = "baseR", missing.notice = FALSE))
check("E09 baseR strip (in-place path, unchanged): format.spss still kept",
      identical(fspss(.e5$decl), "F3.0"))
.e6 <- quiet(jconvert(d, tagged, to = "baseR", missing.notice = FALSE))
check("E10 baseR strip via zap_missing (unchanged): format.stata still kept",
      identical(fstat(.e6$tagged), "%8.2f"))

# =============================================================================
# F. Round trips through jsave() -- the field finding itself
# =============================================================================
cat("\n--- F. jsave() round trips ---\n")

.sav <- tempfile(fileext = ".sav")
.dta <- tempfile(fileext = ".dta")
.f0  <- quiet(jdeclare_missing(d, num, range = c(-99, -51),
                               convention = "spss", missing.notice = FALSE))
.f0  <- .f0[, c("id", "num", "num2")]   # jsave rightly refuses tagged
                                        # columns for .sav; keep it clean
quiet(jsave(.f0, .sav, overwrite = TRUE))
.f1  <- haven::read_sav(.sav, user_na = TRUE)   # BINDING FIXTURE RULE
check("F01 FIELD FINDING 2: the declared column reads back F2.0, not F8.2",
      identical(fspss(.f1$num), "F2.0"))
check("F02 the undeclared twin reads back F2.0 (writer honors the tag)",
      identical(fspss(.f1$num2), "F2.0"))
check("F03 the declaration survived the round trip too (na_range)",
      identical(as.numeric(attr(.f1$num, "na_range")), c(-99, -51)))
check("F04 net of the declaration itself, declared and control are equal", {
  # The declaration legitimately adds na_range and the labelled_spss class;
  # everything else (labels, format, width) must be identical.
  a <- attributes(.f1$num); b <- attributes(.f1$num2)
  a$na_range <- NULL; a$class <- NULL; b$class <- NULL
  identical(a[order(names(a))], b[order(names(b))])
})

# .dta: the pre-write helper lowercases uppercase markers through
# labelled::val_labels<-, on the column's way to write_dta(). A .dta read
# has no user_na switch; tagged NAs and formats come back as written.
.f5 <- d[, c("id", "upper")]
quiet(jsave(.f5, .dta, overwrite = TRUE))
.f6 <- haven::read_dta(.dta)
check("F05 .dta: a column the pre-write rewrote reads back its format.stata",
      identical(fstat(.f6$upper), "%9.0g"))
check("F06 .dta: its markers were lowercased for the writer",
      all(haven::na_tag(.f6$upper)[!is.na(haven::na_tag(.f6$upper))] == "a"))
unlink(c(.sav, .dta))

# =============================================================================
# G. jencode() -- the deliberate NON-carry
# =============================================================================
cat("\n--- G. jencode() does not carry ---\n")

.g1 <- quiet(jencode(d, txt))
check("G01 jencode: the text source's A8 does NOT reach the numeric result",
      identical(fspss(.g1), "<none>"))
check("G02 jencode: the result is a labelled numeric",
      haven::is.labelled(.g1) && is.double(unclass(.g1)))

# --- Verdict -----------------------------------------------------------------

options(.jst_options_message_width       = .entry_message_width)
options(.jst_default_data                = .entry_default_data)
options(.jst_options_missing_convention  = .entry_convention)
options(.jst_output_level                = .entry_output_level)

.n_ok <- sum(vapply(.results, `[[`, logical(1), "ok"))
.n    <- length(.results)
if (.n_ok == .n) {
  cat("\nRESULT: PASS (", .n_ok, "/", .n, ")\n", sep = "")
  # Fixture cleanup (S337, the S249 item): a green run leaves nothing behind
  # but .results, which run_all.R reads. A red run keeps its fixtures, for
  # a look at what failed.
  rm(list = setdiff(ls(globalenv(), all.names = TRUE),
                    c(.entry_names, ".results")), envir = globalenv())
} else {
  cat("\nRESULT: FAIL (", .n_ok, "/", .n, " passed)\n", sep = "")
  for (r in .results) if (!r$ok) cat("  failed: ", r$desc, "\n", sep = "")
  stop("assertion battery failed", call. = FALSE)
}
