# =============================================================================
# jrelabel_check.R -- jrelabel() labels a variable in place; jrecode()'s and
#                     jrelabel()'s type gates
# =============================================================================
# TYPE:     assertion battery (PASS/FAIL; written for Claude's checking)
# LOCKS:    the Session 215 rebuild of jrelabel() (Fork B: the column is
#           labelled IN PLACE and never converted) and jrecode()'s type gate,
#           as they stand today. (A) jrelabel() keeps what it does not
#           replace: SPSS-style declared codes and ranges, Stata-style
#           markers and their labels, value labels under a var.label-only
#           call, and the class -- a Date, a factor and text stay what they
#           are, text with no silent NA. (B) value labels attach by CLASS
#           alone: haven-labelled, plain numeric (gains the labelled class)
#           and logical (stored 1/0); var.label alone leaves a logical or a
#           plain numeric as it was. (C) the refusals, pinned whole: labels =
#           on a factor, text or a date, and jrecode() on the same three,
#           with today's jencode() line where it applies; a type that is
#           none of these, refused by its R type. (D) the regressions: an
#           ordinary numeric and labelled recode. (E) what the S215 visual
#           check looked at: a code that kept its declaration after its
#           value labels were replaced is a Missing row of jfreq(), with no
#           label, and not in Valid %.
# ORIGIN:   S359 (v0.9.232; Scripts Slate B, the S215 item). The 24
#           assertions of S215_jrelabel_verify.R (dev/tests, v0.9.116; the
#           script itself was taken from the Session 215 chat, where it was
#           written), the refusal patterns re-pinned to today's wording,
#           which gained "Convert it to numbers first with jencode()." since.
#           A ninth battery: run_all.R reads every *_check.R in the folder.
#           MUTATION MAP (S359): jrelabel() dropping the declared codes of the
#           column it labels J01 J27; jrecode()'s factor gate off J20.
# LAST VERIFIED: v0.9.232, 2026-10-16 (S359) -- 32/32 on the WORKSTATION
#           through receive_all() ("ALL BATTERIES GREEN (9 run, 2646
#           checks)"), matching the sandbox (R 4.3.3 / haven 2.5.4, plain,
#           under the RStudio-handler stand-in and with a 35-character temp
#           path; entered dirty, plain and under the stand-in: nothing
#           changed); GitHub 6cf15d7 (package).
# RUN:      source()-safe from any working directory. All output is explicit
#           cat(), so echo = TRUE is NOT required. Also runnable via
#           regression/run_all.R, which treats a stop() as FAIL. No dataset:
#           the fixtures are inline, so the template's jload() call is
#           DELETED.
# CONTRACT: one printed line per check, a final "RESULT: PASS (n/n)" line,
#           and stop() if and only if any check failed.
# GUARDS:   the template's five (session handed back; a green run leaves no
#           fixture; work outside check() through run(); the message surface
#           swept; the user's objects put back). Fixtures dotted; working
#           objects in local().
# =============================================================================

# --- Setup -------------------------------------------------------------------

# jstats must be loaded already: devtools::load_all() (development) OR
# library(jstats) (installed) -- never both in one session.
stopifnot(exists("jload", mode = "function"))

# Guard 2: what is in the workspace on entry.
.entry_names <- ls(globalenv(), all.names = TRUE)

# Guard 5 (S359; the S345 item): the VALUES of the workspace's objects on
# entry, so the foot can put back any a run changed. Guard 2 compares
# names only, and a fixture or a working object named like one of the
# user's own -- d, x, s -- replaced it. Held by reference, so nothing is
# copied unless the run changes the object. Dotted names are the harness's
# and are left out.
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

# Neutral pipeline state (state persists across calls and across sessions;
# never assume the prior state is clean). clear.all = TRUE on the three
# per-frame setters: a bare f(NULL) clears only the default frame (S294).
invisible(utils::capture.output(suppressMessages({
  juse(NULL)
  jsubset(clear.all = TRUE); jcomplete(clear.all = TRUE); joutput(NULL)
  jdummy(clear.all = TRUE)
})))

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
# The fixtures are the Session 215 script's, dotted; each check's working
# objects stay in local().

.j_p1 <- data.frame(v = haven::labelled_spss(c(1, 2, 1, -98, 2),
                                             labels = c(Yes = 1, No = 2),
                                             na_values = -98))
.j_p2 <- data.frame(v = haven::labelled_spss(c(1, 2, -99, -97, 1),
                                             labels = c(Yes = 1, No = 2),
                                             na_range = c(-99, -95)))
.j_p3 <- data.frame(v = haven::labelled(c(1, 2, 1, 2), labels = c(Yes = 1, No = 2)))
.j_p4 <- data.frame(dt = as.Date(c("2019-06-01", "2019-10-03", "2018-06-15")))
.j_p5a <- data.frame(w = c("a", "b", "a"), stringsAsFactors = FALSE)
.j_p5b <- data.frame(w = c("1", "2", "unknown", "1"), stringsAsFactors = FALSE)
.j_p6 <- data.frame(f = factor(c("1", "2", "Missing", "1")))
.j_p7 <- data.frame(v = haven::labelled(c(1, 2, haven::tagged_na("a"), 1),
                                        labels = c(Yes = 1, No = 2,
                                                   Refused = haven::tagged_na("a"))))
.j_p8 <- data.frame(b = c(TRUE, FALSE, TRUE, TRUE))
.j_p9 <- data.frame(n = c(1, 2, 1))
.j_d  <- data.frame(f  = factor(c("10", "20", "10")),
                    ch = c("1", "2", "x"),
                    dt = as.Date(c("2020-01-01", "2020-01-02", "2020-01-03")),
                    n  = c(1, 2, 1), stringsAsFactors = FALSE)
.j_d2 <- data.frame(v = haven::labelled(c(1, 2, 1), labels = c(Yes = 1, No = 2)))

# --- A. Preservation (the S215 defect fixes) -------------------------------
.j_r1 <- run(jrelabel(.j_p1, v, labels = "1=Yes; 2=No", var.label = "Test variable"))
check("J01 I-S19-2: labels = and var.label = keep the SPSS-style declared code",
      identical(attr(.j_r1$val, "na_values"), -98))
check("J02 ... and the haven_labelled_spss class",
      inherits(.j_r1$val, "haven_labelled_spss"))
check("J03 the range face: var.label alone keeps a declared range",
      identical(attr(run(jrelabel(.j_p2, v, var.label = "Range test"))$val, "na_range"),
                c(-99, -95)))
.j_r3 <- run(jrelabel(.j_p3, v, var.label = "Description only"))
check("J04 probe 3: var.label alone keeps the value labels",
      identical(names(attr(.j_r3$val, "labels")), c("Yes", "No")))
check("J05 ... and applies the variable label",
      identical(attr(.j_r3$val, "label"), "Description only"))
.j_r4 <- run(jrelabel(.j_p4, dt, var.label = "Index: release date"))
check("J06 I-S21-1: a Date stays a Date",
      inherits(.j_r4$val, "Date"))
check("J07 ... and carries the label",
      identical(attr(.j_r4$val, "label"), "Index: release date"))
check("J08 I-S19-1: a text variable takes a var.label and stays text",
      local({ r <- run(jrelabel(.j_p5a, w, var.label = "Character test"))$val
              is.character(r) && identical(attr(r, "label"), "Character test") }))
check("J09 probe 5b: text holding numbers and words keeps its words (no silent NA)",
      local({ r <- run(jrelabel(.j_p5b, w, var.label = "Mixed character test"))$val
              !is.null(r) && identical(as.vector(unclass(r))[3], "unknown") }))
check("J10 probe 6: a factor stays a factor, its levels intact",
      local({ r <- run(jrelabel(.j_p6, f, var.label = "Mixed factor test"))$val
              is.factor(r) && identical(levels(r), c("1", "2", "Missing")) }))
.j_r7 <- run(jrelabel(.j_p7, v, var.label = "Tagged NA test"))
check("J11 probe 7: a Stata-style marker survives",
      !is.null(.j_r7$val) && identical(haven::na_tag(.j_r7$val)[3], "a"))
check("J12 ... and so do its value labels, the marker's included",
      identical(names(attr(.j_r7$val, "labels")), c("Yes", "No", "Refused")))

# --- B. Value labels by class alone ------------------------------------------
check("J13 a logical with labels =: stored 1/0, haven-labelled",
      local({ r <- run(jrelabel(.j_p8, b, labels = "1=Yes; 0=No", var.label = "Logical test"))$val
              inherits(r, "haven_labelled") && identical(as.vector(unclass(r)), c(1, 0, 1, 1)) }))
check("J14 ... with var.label alone it stays logical",
      is.logical(run(jrelabel(.j_p8, b, var.label = "Still logical"))$val))
check("J15 a plain numeric with labels = gains the labelled class",
      inherits(run(jrelabel(.j_p9, n, labels = "1=Yes; 2=No"))$val, "haven_labelled"))
check("J16 ... with var.label alone it stays plain numeric",
      local({ r <- run(jrelabel(.j_p9, n, var.label = "Plain"))$val
              is.numeric(r) && !inherits(r, "haven_labelled") }))

# --- C. The refusals, pinned whole --------------------------------------------
check("J17 jrelabel() refuses labels = on a factor, with the jencode() line",
      identical(grab(jrelabel(.j_p6, f, labels = "1=Yes")),
                paste0("jrelabel(): 'f' is a factor; value labels can only be applied to\n",
                       "numeric variables.\n",
                       "Convert it to numbers first with jencode().")))
check("J18 ... on a text variable",
      identical(grab(jrelabel(.j_p5a, w, labels = "1=Yes")),
                paste0("jrelabel(): 'w' is a character (text) variable; value labels can\n",
                       "only be applied to numeric variables.\n",
                       "Convert it to numbers first with jencode().")))
check("J19 ... on a date, with no jencode() line",
      identical(grab(jrelabel(.j_p4, dt, labels = "1=Yes")),
                paste0("jrelabel(): 'dt' is a date/time variable; value labels can only be\n",
                       "applied to numeric variables.")))
check("J20 jrecode() refuses a factor (it recoded the internal codes, so 10/20 recoded as 1/2)",
      identical(grab(jrecode(.j_d, f, map = "10=0; 20=1")),
                paste0("jrecode(): 'f' is a factor; values can only be recoded on\n",
                       "numeric variables.\n",
                       "Convert it to numbers first with jencode().")))
check("J21 ... a text variable",
      identical(grab(jrecode(.j_d, ch, map = "1=0; 2=1")),
                paste0("jrecode(): 'ch' is a character (text) variable; values can only be\n",
                       "recoded on numeric variables.\n",
                       "Convert it to numbers first with jencode().")))
check("J22 ... a date",
      identical(grab(jrecode(.j_d, dt, map = "1=0")),
                paste0("jrecode(): 'dt' is a date/time variable; values can only be recoded\n",
                       "on numeric variables.")))
check("J23 a type that is none of these is refused by its R type: a list by jrelabel(), complex numbers by jrecode()",
      identical(grab(jrelabel(data.frame(z = I(list(1, 2))), z, labels = "1=Yes")),
                "jrelabel(): 'z' is of type list and cannot carry value labels.") &&
        identical(grab(jrecode(data.frame(z = as.complex(1:2)), z, map = "1=0")),
                  "jrecode(): 'z' is of type complex and cannot be recoded."))
check("J24 a refused call returns nothing to assign",
      is.null(run(jrelabel(.j_p6, f, labels = "1=Yes"))$val) &&
        is.null(run(jrecode(.j_d, f, map = "10=0; 20=1"))$val))

# --- D. The regressions ---------------------------------------------------------
check("J25 an ordinary numeric recode is unchanged",
      identical(as.vector(unclass(run(jrecode(.j_d, n, map = "1=0; 2=1"))$val)), c(0, 1, 0)))
check("J26 ... and a labelled recode with new labels",
      identical(as.vector(unclass(run(jrecode(.j_d2, v, map = "1=0; 2=1",
                                              labels = "0=No; 1=Yes"))$val)), c(0, 1, 0)))

# --- E. What the S215 visual check looked at -----------------------------------
# p1's value labels were REPLACED by "1=Yes; 2=No" and its -98 declaration
# survived WITHOUT a label (the label lived in the set the call replaced):
# -98 is a Missing row with no label, outside Valid %.
check("J27 a code that kept its declaration after its labels were replaced: a Missing row of jfreq(), '(no label)', no Valid %",
      local({ p <- .j_p1; p$v <- .j_r1$val
              ln <- run(jfreq(p, v))$txt
              ln <- strsplit(ln, "\n", fixed = TRUE)[[1]]
              i <- which(ln == "Missing")
              length(i) == 1L &&
                grepl("^-98 \\(no label\\) +1 +20\\.00 +-- +--$", ln[i + 1L]) &&
                any(grepl("^Total valid +4 +80\\.00 +100\\.00$", ln)) }))
check("J28 control: the frame is untouched -- jrelabel() returns the column, the call assigns it",
      inherits(.j_p1$v, "haven_labelled_spss") && is.null(attr(.j_p1$v, "label", exact = TRUE)) &&
        identical(names(attr(.j_p1$v, "labels")), c("Yes", "No")))
check("J29 control: labels = with no new codes keeps the declaration on a range variable as well",
      identical(attr(run(jrelabel(.j_p2, v, labels = "1=Yes; 2=No"))$val, "na_range"),
                c(-99, -95)))
rm(list = intersect(c(".j_p1", ".j_p2", ".j_p3", ".j_p4", ".j_p5a", ".j_p5b",
                      ".j_p6", ".j_p7", ".j_p8", ".j_p9", ".j_d", ".j_d2",
                      ".j_r1", ".j_r3", ".j_r4", ".j_r7"), ls(all.names = TRUE)))

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
check(paste0("J30 no prose line of a message exceeds ", .pin_width,
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
check("J31 no premature break: a line's first unit never fit on the line above",
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
check("J32 every runnable line in a message parses",
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
  .ws_restore()   # guard 5, ahead of guard 2's cleanup
  rm(list = setdiff(ls(globalenv(), all.names = TRUE),
                    c(.entry_names, ".results")), envir = globalenv())
} else {
  cat("\nRESULT: FAIL (", .n_ok, "/", .n, " passed)\n", sep = "")
  for (r in .results) if (!r$ok) cat("  failed: ", r$desc, "\n", sep = "")
  .ws_restore()   # guard 5: the user's objects back, a red run's fixtures kept
  stop("assertion battery failed", call. = FALSE)
}
