# =============================================================================
# _template_check.R -- TEMPLATE for machine-oriented assertion batteries
# =============================================================================
# Copy to <topic>_check.R (e.g. E11_na_map_check.R) and fill in. Keep the
# header fields; run_all.R and the regression index rely on the shape.
# -----------------------------------------------------------------------------
# TYPE:     assertion battery (PASS/FAIL; written for Claude's checking)
# LOCKS:    <one line: the shipped behavior this file keeps locked>
# ORIGIN:   S<NNN> (<the session that shipped / verified the behavior>)
# LAST VERIFIED: v0.9.xxx, <date>   -- update on every green run
# RUN:      source()-safe from any working directory. All output is explicit
#           cat(), so echo = TRUE is NOT required (this sidesteps the S220
#           silent-no-output trap by construction). Also runnable via
#           regression/run_all.R, which treats a stop() as FAIL.
# CONTRACT: one printed line per check, a final "RESULT: PASS (n/n)" line,
#           and stop() if and only if any check failed.
# GUARDS:   four things every battery carries, each of which caught a whole
#           class where a per-item assertion did not (the S249, S285 and
#           S291 items, built in at S337). Keep them when filling in:
#           1. THE SESSION IS HANDED BACK. Setup records what it is about
#              to force (the message width, the juse() default, the output
#              level) and the foot restores it, ABOVE the verdict so a red
#              run restores too. Add a line for any other setting the
#              battery forces.
#           2. A GREEN RUN LEAVES NO FIXTURE. Setup records the names in
#              the workspace; the verdict's PASS branch removes everything
#              made since, except .results (run_all.R reads it). A walk
#              that reports on the data frames in the workspace can then
#              follow a battery in one session. A red run keeps its
#              fixtures.
#           3. WORK DONE OUTSIDE check() IS GUARDED. A fixture call or a
#              capture that stops outside check() HALTS the battery -- no
#              verdict, and a mutation run reads as "no discrimination".
#              Take a result through run(), which returns the error text
#              with a NULL value, and make each predicate FALSE on NULL.
#           4. THE MESSAGE SURFACE IS SWEPT. grab() keeps every condition
#              it takes in .seen, and three checks at the foot read all of
#              them: no prose line over the pin, no premature break, every
#              runnable line parses. A message nobody wrote an assertion
#              for is still swept.
# =============================================================================

# --- Setup -------------------------------------------------------------------

# jstats must be loaded already: devtools::load_all() (development) OR
# library(jstats) (installed) -- never both in one session.
stopifnot(exists("jload", mode = "function"))

# Guard 2: what is in the workspace on entry.
.entry_names <- ls(globalenv(), all.names = TRUE)

# Guard 1: session state to hand back at the foot (record / force / restore).
.entry_message_width <- getOption(".jst_options_message_width")
.entry_default_data  <- getOption(".jst_default_data")
.entry_output_level  <- getOption(".jst_output_level")
# The stored display settings too (S346): the diagnostics setting outlives
# a level call, so restoring the level alone would hand back a session
# without it.
.entry_output_toggles <- getOption(".jst_output_toggles")

# Message-width pin. MANDATORY (S253): the emitter wraps to this setting and
# the shipped default follows the console pane, so an unpinned battery
# asserts against whatever size the window happens to be.
.pin_width <- 76L
options(.jst_options_message_width = .pin_width)

# Load what THIS file needs from the standing test-data folder -- jload(),
# never readRDS(); absolute path per JStats_Testing_File_Conventions.txt.
# quiet = TRUE keeps load-time notes out of the battery output. A file that
# needs no dataset DELETES this call and says so in the header.
jload("E:/00 R Projects/00_jstats_test_data/datasets/community_phase2_data.rds",
      name = "tdat", overwrite = TRUE, quiet = TRUE)

# Neutral pipeline state (state persists across calls and across sessions;
# never assume the prior state is clean). clear.all = TRUE on the three
# per-frame setters: a bare f(NULL) clears only the default frame (S294).
juse(tdat)
jsubset(clear.all = TRUE); jcomplete(clear.all = TRUE); joutput(NULL)
jdummy(clear.all = TRUE)

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

# .seen (guard 4): every condition grab() takes, ONE BY ONE, with its kind
# and the message width in force. grab() returns them joined, and in a
# joined text the last line of one message and the first line of the next
# would read as a pair of lines from one wrap.
.seen <- list()
.see  <- function(kind, cnd) {
  .seen[[length(.seen) + 1L]] <<- list(
    kind = kind, text = conditionMessage(cnd),
    width = getOption(".jst_options_message_width"))
}

# grab(): run a call and return every message / warning / error text it
# emits, concatenated -- so wording can be asserted without the call
# halting the battery. Verify any asserted wording against SOURCE, not
# memory, when writing a check. Conditions are taken where they are
# signalled, never read from a sink of the message stream: RStudio re-emits
# that stream decorated (conventions file, S328).
grab <- function(expr) {
  msgs <- character(0)
  withCallingHandlers(
    tryCatch(expr,
             error = function(e) {
               .see("error", e); msgs <<- c(msgs, conditionMessage(e))
             }),
    message = function(m) {
      .see("note", m)
      msgs <<- c(msgs, conditionMessage(m)); invokeRestart("muffleMessage")
    },
    warning = function(w) {
      .see("warning", w)
      msgs <<- c(msgs, conditionMessage(w)); invokeRestart("muffleWarning")
    }
  )
  paste(msgs, collapse = "")
}

# run() (guard 3): a result AND what the call printed, for work done outside
# check(). An error is caught and returned as the text, with val NULL, so
# the checks that read the result go red instead of the battery halting.
# Write each predicate to be FALSE on a NULL val.
run <- function(expr) {
  val <- NULL
  txt <- tryCatch(paste(suppressMessages(utils::capture.output(val <- expr)),
                        collapse = "\n"),
                  error = function(e) paste0("[error] ", conditionMessage(e)))
  list(val = val, txt = txt)
}

# --- Checks ------------------------------------------------------------------
# One check() per assertion. Group with banner comments as they multiply.
# The three below are ILLUSTRATIVE -- replace them.

check("fixture loads at its documented shape (200 x 52)",
      identical(dim(tdat), c(200L, 52L)))

check("error path fires with expected wording (verified at source)",
      grepl("Provide a filename", grab(jload(""))))

.r1 <- run(jfreq(tdat, Gender_01))
check("a result taken outside check() is read through run()",
      !is.null(.r1$val) && !startsWith(.r1$txt, "[error]"))

# --- The message surface, swept (guard 4) ------------------------------------
# Keep these three at the foot, below every grab(), and number them into the
# file's own series. The counts are floors: raise each to a little under
# what the finished battery sees, so an emptied .seen fails.

.sw <- Filter(function(s) identical(as.numeric(s$width), as.numeric(.pin_width)),
              .seen)
.sw <- .sw[!duplicated(vapply(.sw, function(s) paste(s$kind, s$text), ""))]

# Rule U: no prose line over the pinned width. Indented lines are Rule L
# runnable or listing lines and are exempt by design.
.ln <- unlist(lapply(.sw, function(s) strsplit(s$text, "\n", fixed = TRUE)[[1]]))
.ln <- .ln[nzchar(trimws(.ln)) & !grepl("^\\s{2}", .ln)]
check(paste0("Z01 no prose line of a message exceeds ", .pin_width,
             " columns (", length(.sw), " conditions)"),
      length(.sw) >= 1L && !any(nchar(.ln) > .pin_width))

# No premature break: for each pair of consecutive unindented prose lines,
# the lower line's first unit must NOT have fit on the line above. A width
# ceiling is blind to a SHORT line, which is how a double wrap sits under a
# green battery (S287). The unit is the first word, widened to what the
# wrapper will not split: an argument with its value, a call to its closing
# parenthesis, a quoted phrase to its closing quote. Exempt, each a break
# made on purpose: the line above ends a sentence; the line below opens
# with a capitalized word, with "(" or with a file path (one unit whatever
# spaces it holds); the line below is a paragraph's last line (the orphan
# pull-back). The first line is measured short by the
# emitter's reserve for R's chrome: 8 for an error, 9 for a warning.
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
    if (nchar(a) + 1L + nchar(unit(b)) <= budget)
      out <- c(out, sprintf("[%d] %s | %s", i, a, unit(b)))
  }
  out
}
.pb <- unlist(lapply(.sw, function(s) {
  pbreaks(s$text, .pin_width, switch(s$kind, error = 8L, warning = 9L, 0L))
}))
check("Z02 no premature break: a line's first unit never fit on the line above",
      length(.sw) >= 1L && length(.pb) == 0L)
if (length(.pb) > 0L) for (l in .pb) cat("        early: ", l, "\n")

# Every runnable line parses: the width sweeps exempt indented lines, which
# leaves the one line class that most needs to RUN as the class no sweep
# reads. An indented line with the shape of a call or an assignment is
# parsed, joined with the indented lines under it while it is incomplete; a
# line holding a <placeholder> is a pattern to fill in and is left out.
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
# Guard 1. Placed ABOVE the verdict so a failing run still hands the session
# back.

options(.jst_options_message_width = .entry_message_width)
options(.jst_default_data          = .entry_default_data)
options(.jst_output_level          = .entry_output_level)
options(.jst_output_toggles = .entry_output_toggles)

# --- Verdict -----------------------------------------------------------------

.n_ok <- sum(vapply(.results, `[[`, logical(1), "ok"))
.n    <- length(.results)
if (.n_ok == .n) {
  cat("\nRESULT: PASS (", .n_ok, "/", .n, ")\n", sep = "")
  # Guard 2: a green run leaves nothing behind but .results. A red run keeps
  # its fixtures, for a look at what failed.
  rm(list = setdiff(ls(globalenv(), all.names = TRUE),
                    c(.entry_names, ".results")), envir = globalenv())
} else {
  cat("\nRESULT: FAIL (", .n_ok, "/", .n, " passed)\n", sep = "")
  for (r in .results) if (!r$ok) cat("  failed: ", r$desc, "\n", sep = "")
  stop("assertion battery failed", call. = FALSE)
}
