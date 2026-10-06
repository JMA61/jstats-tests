# =============================================================================
# run_all.R -- run every assertion battery in regression/ and report
# =============================================================================
# USAGE: with jstats loaded (devtools::load_all() OR library(jstats), never
# both in one session), source() this file from any working directory.
#
# WHAT RUNS: every *_check.R in this folder whose name does not start with
# "_" (so the templates are excluded). Walkthroughs (*_walk.R) are for human
# eyes and are deliberately NOT run here.
#
# HOW A BATTERY REPORTS: each battery prints its own per-check lines and a
# final "RESULT: PASS (n/n)" line, and calls stop() if and only if a check
# failed -- so this runner needs only to catch the stop. Batteries run in
# the GLOBAL environment (jstats pipeline state and juse() defaults live
# there); each battery's setup block resets pipeline state itself.
#
# SCOREBOARD (S303). The run ends with one line per battery -- its status
# and check count -- with every failed check named beneath its battery, so
# nothing needs scrolling back for. Paste the scoreboard; the rest of the
# output is only needed when a battery halts or fails. The counts are the
# point, not just the colours: at S303 the new count (270, not 263) was
# what proved the new missing_convention_check.R had actually run -- the
# old copy would also have been all green.
#   The runner reads each battery's .results list (the _template_check.R
# harness: one list(desc, ok) per check(), shared by every battery) rather
# than scraping printed text, and clears it before each battery so a
# battery that halts early cannot report the previous one's results. Three
# outcomes are told apart:
#   PASS    the battery finished and every check passed
#   FAIL    a check failed (the battery's own verdict stop)
#   HALTED  the battery stopped for any OTHER reason -- an error outside
#           check(), a missing fixture -- after however many checks it had
#           run. Its checks may all be green; the battery is still not.
# A battery that does not use the .results harness reports its outcome
# with the count shown as "?".
#
# RUNNER NAMES carry a .ra_ prefix (S303) because batteries share this
# global environment: a battery that assigned a top-level f, ok or failed
# would have silently corrupted the old runner's bookkeeping.
#
# PATH GUARD: a REGRESSION_DIR that does not exist is an error, not an empty
# run -- so "no batteries found" always means the folder was read and held
# none.
# =============================================================================

REGRESSION_DIR <- "E:/00 R Projects/00_jstats_test_data/regression"

# A missing folder and an empty one are different problems, and list.files()
# reports neither -- it returns nothing for a bad path just as it does for a
# folder with no batteries in it, so a mistyped or moved REGRESSION_DIR reads
# as a clean run with nothing to do. Fail loudly on the path instead, leaving
# the "no batteries found" message below to mean only what it says.
if (!dir.exists(REGRESSION_DIR)) {
  stop("run_all.R: regression folder not found:\n  ",
       normalizePath(REGRESSION_DIR, winslash = "/", mustWork = FALSE),
       "\nCheck REGRESSION_DIR at the top of this script.",
       call. = FALSE)
}

.ra_batteries <- list.files(REGRESSION_DIR, pattern = "_check\\.R$",
                            full.names = TRUE)
.ra_batteries <- .ra_batteries[!startsWith(basename(.ra_batteries), "_")]

if (length(.ra_batteries) == 0L) {
  cat("No *_check.R batteries found in", REGRESSION_DIR, "\n")
} else {
  .ra_board <- list()
  for (.ra_f in .ra_batteries) {
    .ra_name <- basename(.ra_f)
    cat("\n==== ", .ra_name, " ",
        strrep("=", max(0L, 58L - nchar(.ra_name))), "\n", sep = "")
    if (exists(".results", envir = globalenv(), inherits = FALSE)) {
      rm(".results", envir = globalenv())
    }
    .ra_err <- tryCatch({ source(.ra_f); NULL },
                        error = function(e) {
                          cat("[halted] ", conditionMessage(e), "\n", sep = "")
                          conditionMessage(e)
                        })
    .ra_res <- if (exists(".results", envir = globalenv(),
                          inherits = FALSE)) {
      get(".results", envir = globalenv())
    } else {
      NULL
    }
    .ra_ok  <- if (is.null(.ra_res)) logical(0) else
      vapply(.ra_res, function(r) isTRUE(r$ok), logical(1))
    .ra_bad <- if (is.null(.ra_res)) character(0) else
      vapply(.ra_res[!.ra_ok], function(r) as.character(r$desc), character(1))
    .ra_status <- if (length(.ra_bad) > 0L) {
      "FAIL"
    } else if (!is.null(.ra_err)) {
      "HALTED"
    } else {
      "PASS"
    }
    .ra_board[[.ra_name]] <- list(
      status = .ra_status,
      n_ok   = if (is.null(.ra_res)) NA_integer_ else sum(.ra_ok),
      n      = if (is.null(.ra_res)) NA_integer_ else length(.ra_ok),
      bad    = .ra_bad,
      err    = .ra_err)
  }

  # --- Scoreboard --------------------------------------------------------------
  cat("\n", strrep("=", 64), "\n", "SCOREBOARD\n", sep = "")
  .ra_w <- max(nchar(names(.ra_board)))
  for (.ra_name in names(.ra_board)) {
    .ra_b <- .ra_board[[.ra_name]]
    .ra_count <- if (is.na(.ra_b$n)) "?" else
      paste0(.ra_b$n_ok, "/", .ra_b$n)
    cat("  ", formatC(.ra_name, width = -.ra_w), "  ",
        formatC(.ra_b$status, width = -6), "  ", .ra_count, "\n", sep = "")
    for (.ra_d in .ra_b$bad) {
      cat("      failed: ", gsub("\\s*\n\\s*", " ", .ra_d), "\n", sep = "")
    }
    # The halt reason is shown for any stop OTHER than a battery's own
    # verdict -- including a FAIL battery that also halted before its
    # verdict, where the failed names alone would hide the halt.
    if (!is.null(.ra_b$err) &&
        !identical(.ra_b$err, "assertion battery failed")) {
      cat("      halted: ", gsub("\\s*\n\\s*", " ", .ra_b$err), "\n",
          sep = "")
    }
  }
  .ra_red   <- names(.ra_board)[vapply(.ra_board,
                                       function(b) b$status != "PASS",
                                       logical(1))]
  .ra_total <- sum(vapply(.ra_board, function(b) b$n, integer(1)),
                   na.rm = TRUE)
  cat(strrep("=", 64), "\n", sep = "")
  if (length(.ra_red) == 0L) {
    cat("ALL BATTERIES GREEN (", length(.ra_board), " run, ", .ra_total,
        " checks)\n", sep = "")
  } else {
    cat("NOT GREEN (", length(.ra_red), " of ", length(.ra_board), "): ",
        paste(.ra_red, collapse = ", "), "\n", sep = "")
  }
}
