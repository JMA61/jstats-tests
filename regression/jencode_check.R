# =============================================================================
# jencode_check.R -- assertion battery for jencode() (E12 completion)
# =============================================================================
# TYPE:     assertion battery (PASS/FAIL; written for Claude's checking)
# LOCKS:    jencode()'s full shipped surface -- automatic/map/repair modes,
#           the S238 quoting rule, the word-evidence -99 nudge, M4/M5/M10
#           naming + caps, Rule U widths, the jrecode-shared parse
#           errors rendering identically in both functions, and (S310)
#           factor input: level order, the empty level kept and tagged,
#           the ordered-factor nudge skip, face value of numeric levels,
#           map mode on level text, plus the jencode() remedy line at the
#           six factor/text guards in jrecode(), jrelabel() and
#           jdeclare_missing() (N43a-g), and those two jdeclare_missing()
#           guards' "missing values" wording (N43h, the S310 mv edit).
#           Since S343: the automatic suggestions on categories a
#           map must quote (N45), and the reminder and offered calls when
#           an expression is given as the data, in jrecode(), jencode(),
#           jsum() and javg() (N46).
#           Since S345 (N47): the absent-word note beside an else sweep,
#           every call automatic mode offers run on a variable with blank
#           cells or declared missing strings, the two "declare it" notes
#           with no convention selected, and the declaration line a place
#           is offered.
# ORIGIN:   S237 (core) / S238 (completion; this file)
# S346 EDIT (v0.9.219, 2026-10-08): the session guard hands back the stored
#           display settings (.jst_output_toggles) with the output level.
#           The diagnostics setting outlives a level call since v0.9.219,
#           so a run entered with joutput(diagnostics = TRUE) left the
#           session without it (found entering dirty). No check added.
#           LAST VERIFIED: v0.9.219, 2026-10-09 (S346) -- 111/111 on
#           the WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run,
#           2079 checks)") through receive_all(), after a clean R CMD
#           check, matching the sandbox; GitHub 14528c6.
# S345 EDIT (v0.9.218, 2026-10-06): Fix Slate 5, the second cut. NEW N47
#           section, 19 checks (N47a-s), in four parts. (1) N47a-f, the
#           S304 item: a map word the data do not hold, beside an else
#           rule that swept a data word, is noted at every level under
#           the sweep note (pinned whole), once only at the full level,
#           with the strict error's capitalization line; alone, or with an
#           else rule that swept only blank cells, it stays advisory.
#           (2) N47g-m, the S343 item: every map automatic mode offers
#           names the blank cells and the declared missing strings, each
#           offered call RUN as printed (the first reproduces the
#           automatic result); and the packer counts the closing quote and
#           parenthesis, a fault the longer maps surfaced (a last rule
#           that only just fit made a line of 77 or 78, which the emitter
#           broke again at another indent). (3) N47n-q, the S251 item:
#           the NA rule's note and the face-value note carry the
#           choose-first menu when no convention is selected (pinned), are
#           as they were under each of the three, and the advice is true
#           in both states. (4) N47r-s, the S343 item: a place given as
#           the data gets the assignment form in the offered declaration
#           line, which runs; a name keeps modify = TRUE.
#           RE-PINNED: N27 (the nudge's remedy is "Then declare" here);
#           N44b (the first offered map now sends each declared string to
#           NA, and the call is run); N44e (takes the second offered call
#           through .offered()). SETUP: the missing-value convention is
#           FORCED UNSET and restored at the foot, since two notes' text
#           now depends on it. .offered(), .runs() and .same() moved from
#           N45 up into the harness, above N44, their first caller. The
#           N47 checks' bodies run in local(), so a check that fails
#           leaves nothing in the workspace for the next battery to read
#           (the first mutant round red models_check.R K24 on every
#           mutant for that reason alone). ONE HUNDRED AND ELEVEN checks.
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): 111/111
#           plain and under the RStudio-handler stand-in, each also with a
#           Windows-length temp path, and entered dirty (joutput("full"),
#           width 110, a juse() default, a stata convention, jstats.color
#           = TRUE, with and without workspace objects named like fixture
#           variables): nothing left but .results, the session handed
#           back.
#           On the 0.9.217 master 15 red: N27, N44b, N47a-c, N47g-j,
#           N47l-o, N47r-s. Controls, on no mutant's list by design: N47f
#           (the values do not depend on a note's level), N47k (a variable
#           with neither kind of cell is offered the numbering alone),
#           N47q (the advice is true in each state).
#           MUTATION MAP (S345; 59 one-change mutants, every one red;
#           those that red here). The absent-word note never raised N47a
#           b c; raised by any else rule, or with none, N47d e; the
#           capitalization line dropped, or compared case-sensitively,
#           N47c; the note printed as well as collected N47b; placed
#           ahead of the sweep note N47a c. Automatic mode's first call
#           without the blank rule N47g h i j l, without the declared
#           strings N44b N47i j l; the blank note's call without the
#           declared strings N47i j l; the declared note's call without
#           the blank rule N47i j; the first call's blank rule giving a
#           category N47g h i j. The packer not counting the closing two
#           characters N47i l m. The gate lead always NULL N27 N47n o;
#           ignoring the convention N47p; jencode()'s NA-rule note
#           without it N47n; the face-value note without it N27 N47o.
#           The place rewrite switched off N47r s; a name rewritten too
#           N45b N46a e N47b c s (and 46 checks of
#           missing_convention_check.R).
#           LAST VERIFIED: v0.9.218, 2026-10-07 (S345) -- 111/111 on
#           the WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run,
#           1952 checks)") through receive_all(), after a clean R CMD
#           check, matching the sandbox; GitHub ec82e6b.
# S343 EDIT (v0.9.217, 2026-10-06): the lean-free cut of Fix Slate 5.
#           N45a-j NEW (10 checks; the S249 item and what it rested on):
#           automatic mode's offered map built from RENDERED words, so a
#           category holding a semicolon, a comma or an equals sign, one
#           named like a keyword (else, NA, System, SYSMIS, blank, in any
#           case) and one opening with a quotation mark is quoted; the
#           packer separating rules at the semicolons outside quoted words;
#           each offered call RUN as printed and held to the automatic
#           result; the renderer and the packer by their units; a quoted
#           keyword echoed back quoted in map mode. N46a-n NEW (14 checks;
#           the S339 item's second half): an expression given as the data
#           gets the two-line reminder in jrecode() and jencode() (pinned
#           whole) and mydata in every call the notes offer, each run after
#           the naming line; a subset is an expression; a place and a name
#           keep their one line; jsum() and javg() print the same pattern
#           line and took the same two lines. Fixtures q45, mk46(), lst46,
#           inline. NINETY-TWO checks.
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): 92/92 plain
#           and under the RStudio-handler stand-in, each also with a
#           Windows-length temp path, and entered dirty (joutput("full"),
#           width 110, a juse() default, a stata convention, jstats.color =
#           TRUE, with and without workspace objects named like fixture
#           variables): nothing left but .results, and the width, the
#           default frame, the level, the convention and the color option
#           handed back.
#           On the 0.9.216 master 15 red: N45a-h, N46a-f and N46m.
#           Controls, on no mutant's list by design: N45i (plain words are
#           as they were), N45j and N46k (widths), N46h (a name), N46i (the
#           values do not depend on the data's form), N46j (the minimal
#           level).
#           MUTATION MAP (S343; 46 one-change mutants, every one red; those
#           that red here). The packer splitting at every semicolon again,
#           or quote-aware but after the escape, N45a b h; its pieces not
#           escaped N45a-d h; automatic mode's rules from bare words N45a-e;
#           the renderer not quoting reserved words, matching them
#           case-sensitively, or missing system / sysmis, blank or else
#           from its list N45c d f g; not quoting a leading quotation mark
#           N45c d f; not quoting separators N45a b e f. An expression
#           keeping its text in jrecode()'s offered lines N46e, in
#           jencode()'s N46b c; the expression lead never chosen N46a d,
#           or chosen for a place too N46g l; the two assignment lines
#           never chosen N46a-f m, or chosen for a place too N46g l n; the
#           naming line pasting the line name N46a-f; mydata left out of
#           the pattern call N46a d f m; a place counted as an expression
#           in jrecode() N46l, in jencode() N46g; jsum() or javg() reading
#           its data as a name always N46m.
#           LAST VERIFIED: v0.9.217, 2026-10-06 (S343) -- 92/92 on
#           the WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run,
#           1890 checks)") through receive_all(), after a clean R CMD
#           check, matching the sandbox; GitHub 8a10deb.
# S340 EDIT (v0.9.214, 2026-10-05): Fix Slate 3, text variables. N44a-j
#           and N44c2 NEW (11 checks): a string variable's DECLARED MISSING
#           VALUES. Automatic mode leaves their cells missing instead of
#           numbering them as categories, keeps them out of the listing and
#           its suggested map, and adds a note: how many cells, which
#           values, the map that keeps them declared (run in N44e), and --
#           for two or more declared strings -- that the word "missing"
#           gives them one missing value between them. The singular forms
#           (N44c2, N44d), numbers stored as text (N44f), the two controls
#           (N44g), map mode unchanged (N44h, N44i), widths and breaks
#           (N44j). Fixture e44, inline. SIXTY-EIGHT checks.
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): 68/68 plain
#           and under the RStudio-handler stand-in, each also with a
#           Windows-length temp path, and entered dirty (joutput("full"),
#           width 110, a juse() default, a stata convention, jstats.color =
#           TRUE, workspace objects named like fixture variables): the
#           width, the default frame, the level, the convention and the
#           color option handed back, nothing left but .results.
#           On the 0.9.213 master 7 red: N44a-f and N44c2. Controls: N44g-j.
#           MUTATION MAP (the S340 mutants that red here; the full list of
#           74 is described in cps_check.R): missing_info text arm off, or
#           its text flag FALSE, N44a-f; declared strings numbered again
#           N44a-f; the note dropped N44c-f; its verb always plural, or
#           "those values" always, N44d; the merge not said N44c; "as one
#           missing value" keyed to the cells N44c2.
#           LAST VERIFIED: v0.9.214, R 4.6.1, 2026-10-05 (S340) -- 68/68 on
#           the WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run,
#           1734 checks)") after receive_package() and a clean R CMD check,
#           matching the sandbox; GitHub 2d04b68.
# S337 EDIT (v0.9.211, 2026-10-05; no package change): the two session guards
#           of _template_check.R. A GREEN run now removes everything the
#           battery made (the names in the workspace are recorded at Setup;
#           .results stays, for run_all.R), so a walk that reports on the data
#           frames in the workspace can follow it in one session. A red run
#           keeps its fixtures. The output level and the juse() default are
#           recorded at Setup and handed back at the foot: joutput(NULL) had
#           left the level at the default, and juse(tdat) had left the default
#           naming this file's fixture. No check added or changed: 57/57 in the
#           sandbox, plain, under the RStudio-handler stand-in, and ENTERED
#           DIRTY (joutput("full"), width 90, a juse() default, a stata
#           convention): nothing left but .results, and the width, the default
#           frame, the level and the convention as they were on entry. (Setup
#           still clears stored jsubset(), jcomplete() and registration
#           settings, as it always has.)
# S310 EDIT (v0.9.181, 2026-09-23): jencode() accepts factors. N33 (the
#           factor guard) is REPLACED by N33a-N33h; N34-N36 take the
#           "only text and factor variables" phrase; N43a-N43g are NEW
#           (the six guard sites' remedy line); the N41/N42 sweep gains
#           the two factor-mode notes (15 -> 17 surfaces). 42 -> 56
#           checks. Value-returning factor calls go through .val() so a
#           master that refuses a factor FAILS in the verdict rather than
#           halting the file. MUTATION MAP (S251 rule; SANDBOX, R 4.3.3,
#           ::: shimmed, fixture built in-session): pristine 0.9.180 ->
#           38/56, red at exactly the 18 new/changed checks; six edited
#           masters, each red ONLY where expected -- M1 tag removed
#           (N33c); M2 nudge always printed (N33e); M3 factor levels
#           sorted alphabetically (N33a-d); M4 factor converted through
#           unclass() (N33a, N33c, N33f, N33h -- N33f's fixture has its
#           levels out of sorted order for exactly this); M5 one guard
#           site reverted to the base-R remedy (N43d, N43g); M6 empty
#           level dropped (N33a-d). 56/56 in the SANDBOX on the edited
#           master, then on the WORKSTATION. S310 mv EDIT (same session,
#           after the run): jdeclare_missing()'s two guard first lines
#           "missing-value codes" -> "missing values" ([MISSING-VALUE-
#           TERMS]); NEW N43h locks it; 56 -> 57. Mutant: the 56/56 master
#           (the pre-mv wording) is red at N43h alone.
# S294 EDIT (v0.9.167, 2026-09-14): the Setup reset line moved to the
#           clear.all = TRUE forms (S294 NULL flip); no assertion touched;
#           42/42 on the WORKSTATION after a clean devtools::check(),
#           matching the SANDBOX check for check.
# LAST VERIFIED: v0.9.181 + mv edit PENDING, 2026-09-23 (S310) -- 57/57 in
#           the SANDBOX after the mv edit; WORKSTATION run pending.
#           Prior: v0.9.181, 2026-09-23 (S310) -- 56/56 on the WORKSTATION
#           (sourced with echo = TRUE, then under run_all.R: seven
#           batteries green, 755 checks), matching the 56/56 SANDBOX run
#           check for check (see the S310 EDIT note above for the
#           mutation map).
#           Prior: v0.9.167, 2026-09-14 (S294) -- 42/42 on the WORKSTATION
#           (see the S294 EDIT note above; no assertion changed).
#           Prior: v0.9.165, 2026-09-13 (S292) -- 42/42 on the WORKSTATION
#           (sourced with echo = TRUE from Downloads), after 42/42 in the
#           SANDBOX against the same master (R 4.3.3, ::: shimmed,
#           fixture built in-session from the generator). NEW: N42, the
#           premature-break assertion (the S287 double wrap sat under a
#           green 41/41 because N41 is a ceiling; see the note at N42).
#           Discrimination confirmed the S251 way: 41/42 on the pristine
#           0.9.164 master, red at N42 alone, flagging exactly the two
#           known sites (g_strict and the ReasonDeclined reproducer);
#           0 flags on the other 13 of its 15 surfaces (8 notes, 5
#           errors) on either master. No other check moved between the
#           two masters.
#           Prior: v0.9.150 PENDING, 2026-08-29 (S267) -- 41/41 in the
#           SANDBOX against the edited master (fixture built in-session
#           from the generator), after N40 was re-pinned to the S267
#           assign-or-lose wording ("This call changes tdat only if you
#           assign the result:"). Discrimination confirmed: red on
#           pristine 0.9.149 at N40 alone. WORKSTATION run pending.
#           Prior: v0.9.145, 2026-08-26 (S256) -- 41/41 in a FRESH session,
#           which is the run that counts here (see the warm-session note
#           in the conventions file). S256 rewrote N15 from lines-2+ byte
#           identity to FLATTENED parity: its line alignment had been an
#           accident of both messages breaking line 1 at the same word, and
#           the S256 chrome reserve moved that break. Wording parity is what
#           the S238 B ruling asserts. 41 checks then; 42 since S292.
#           -- update on every green run
# RUN:      source()-safe from any working directory. All output is explicit
#           cat(), so echo = TRUE is NOT required (this sidesteps the S220
#           silent-no-output trap by construction). Also runnable via
#           regression/run_all.R, which treats a stop() as FAIL.
# CONTRACT: one printed line per check, a final "RESULT: PASS (n/n)" line,
#           and stop() if and only if any check failed.
# NOTE:     check N27 asserts the S238 EVIDENCE-CHANNEL ASYMMETRY on purpose:
#           jencode reports a wordlist-licensed -99 that jload's scan does
#           not yet admit. When the scan-side widening ships (the item is
#           coupled to the S237 wordlist-gap decision), N19's framing
#           updates with it.
# =============================================================================

# --- Setup -------------------------------------------------------------------

# jstats must be loaded already: devtools::load_all() (development) OR
# library(jstats) (installed) -- never both in one session.
stopifnot(exists("jload", mode = "function"))

# What is in the workspace on entry (S337): on a green run everything this
# battery made beyond it is removed at the foot, so a walk that reports on
# the data frames in the workspace can follow a battery in one session.
.entry_names <- ls(globalenv(), all.names = TRUE)

# The output level too (S337; the S249 item's guard (4)): joutput(NULL) below
# forces the default, and without this line the session came back there.
.entry_output_level  <- getOption(".jst_output_level")
# The stored display settings too (S346): the diagnostics setting outlives
# a level call, so restoring the level alone would hand back a session
# without it.
.entry_output_toggles <- getOption(".jst_output_toggles")
# And the juse() default (S337): juse(tdat) below replaces it, and the foot
# removes tdat, which would leave the default naming a frame that is gone.
.entry_default_data  <- getOption(".jst_default_data")

# And the missing-value convention (S345): FORCED UNSET as well as recorded.
# Since v0.9.218 a note that says "declare it" carries the choose-first menu
# when no convention is selected, so its text depends on the setting; N27 and
# N47 read the unset form. Until then no check here read the setting, and a
# session entered with one set gave the same 92 greens.
.entry_convention <- getOption(".jst_options_missing_convention")
options(.jst_options_missing_convention = NULL)

# Load what THIS file needs from the standing test-data folder -- jload(),
# never readRDS(); absolute path per JStats_Testing_File_Conventions.txt.
jload("E:/00 R Projects/00_jstats_test_data/datasets/text_columns_data.rds",
      name = "tdat", overwrite = TRUE, quiet = TRUE)

# Neutral pipeline state (state persists across calls and across sessions;
# never assume the prior state is clean).
juse(tdat)
jsubset(clear.all = TRUE); jcomplete(clear.all = TRUE); joutput(NULL)
jdummy(clear.all = TRUE)

# Message-width state (S253). The emitter now wraps every message to the
# message.width setting, so message output has become environment-dependent:
# the same message renders differently on a 90-column pane and a 64-column
# one. Every asserted phrase in this file was transcribed at 76, so pin the
# width exactly as the convention is pinned -- record what the session came
# in with, force it, restore at the foot. Belt-and-braces while the shipped
# default is still "medium" (= 76); load-bearing the moment that default
# becomes "auto" at the close of the emitter rollout.
.pin_width           <- 76L
.entry_message_width <- getOption(".jst_options_message_width")
options(.jst_options_message_width = .pin_width)

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

# grab(): run a call and return every message / warning / error text it
# emits, concatenated -- so wording can be asserted without the call
# halting the battery. Verify any asserted wording against SOURCE, not
# memory, when writing a check.
grab <- function(expr) {
  msgs <- character(0)
  withCallingHandlers(
    tryCatch(expr,
             error = function(e) msgs <<- c(msgs, conditionMessage(e))),
    message = function(m) {
      msgs <<- c(msgs, conditionMessage(m)); invokeRestart("muffleMessage")
    },
    warning = function(w) {
      msgs <<- c(msgs, conditionMessage(w)); invokeRestart("muffleWarning")
    }
  )
  paste(msgs, collapse = "")
}

# flat(): collapse all whitespace to single spaces, so a phrase can be
# asserted across Rule U wrap points without pinning where the breaks fall.
flat <- function(x) gsub("[[:space:]]+", " ", x)

# quiet(): the encoded vector with all messages muffled.
quiet <- function(expr) {
  withCallingHandlers(expr,
    message = function(m) invokeRestart("muffleMessage"))
}

# .offered(): every call a message offers of the form "  <x> <- fn(", each
# taken whole (a call packed over several lines is joined until it parses);
# a pattern line holding <name> is left out. .runs(): evaluate one of them
# in an environment, TRUE when it ran. .same(): two encoded vectors alike in
# values and value labels. Written for N45 at S343 (offered lines are RUN,
# never read: the S303 rule); moved up here at S345, when N44 became their
# first caller.
.offered <- function(txt, fn = "jencode") {
  ln <- strsplit(txt, "\n", fixed = TRUE)[[1]]
  i  <- grep(paste0("^  \\S+ <- ", fn, "\\("), ln)
  i  <- i[!grepl("<name>", ln[i], fixed = TRUE)]
  lapply(i, function(s) {
    j <- s; code <- ln[j]
    while (inherits(try(parse(text = code), silent = TRUE), "try-error") &&
           j < length(ln)) {
      j <- j + 1L; code <- paste(code, ln[j], sep = "\n")
    }
    code
  })
}
.runs <- function(code, env) {
  tryCatch({ suppressMessages(eval(parse(text = code), env)); TRUE },
           error = function(e) FALSE)
}
.same <- function(x, y) {
  identical(as.numeric(unclass(x)), as.numeric(unclass(y))) &&
    identical(labelled::val_labels(x), labelled::val_labels(y))
}

# --- N01-N02: fixture shape --------------------------------------------------

check("N01 fixture loads at its documented shape (80 x 9)",
      identical(dim(tdat), c(80L, 9L)))

check("N02 every column except id is character",
      identical(vapply(tdat[-1], is.character, logical(1)),
                setNames(rep(TRUE, 8L), names(tdat)[-1])))

# --- N03-N07: automatic mode -------------------------------------------------

v_auto <- quiet(jencode(tdat, Status))

check("N03 automatic mode assigns alphabetically (Bail=1 Parole=2 Remand=3)",
      identical(as.numeric(unclass(v_auto)),
                as.numeric(factor(tdat$Status,
                                  levels = c("Bail", "Parole", "Remand")))))

check("N04 automatic mode attaches the words as value labels",
      identical(labelled::val_labels(v_auto),
                c(Bail = 1, Parole = 2, Remand = 3)))

g_auto <- grab(jencode(tdat, Status))
check("N05 assignment listing announced (\"was encoded alphabetically\")",
      grepl("'Status' was encoded alphabetically", g_auto, fixed = TRUE))

check("N06 rerun-with-a-map suggestion carries the runnable map line",
      grepl("map = \"Bail=1; Parole=2; Remand=3\"", g_auto, fixed = TRUE))

g_blank <- grab(jencode(tdat, Outcome))
check("N07 M11 blank note: count + left-missing + blank= teaching line",
      grepl("6 blank cells in 'Outcome' were", g_blank, fixed = TRUE) &&
      grepl("left missing (NA)", g_blank, fixed = TRUE) &&
      grepl("blank=0", g_blank, fixed = TRUE))

# --- N08-N12: map mode and the S238 quoting rule -----------------------------

v_map <- quiet(jencode(tdat, Status, map = "Remand=1; Parole=2; Bail=3"))
check("N08 explicit map overrides alphabetical order",
      identical(as.numeric(unclass(v_map)),
                as.numeric(factor(tdat$Status,
                                  levels = c("Remand", "Parole", "Bail")))))

v_apos <- quiet(jencode(tdat, ReasonDeclined,
                        map = paste0("Refused=1; Don't know=2; ",
                                     "\"Not applicable; other\"=3; ",
                                     "No answer=4")))
check("N09 apostrophe word parses UNQUOTED (S238 token-start quote rule)",
      identical(sum(unclass(v_apos) == 2, na.rm = TRUE),
                sum(tdat$ReasonDeclined == "Don't know")))

check("N10 double-quoted word carries its embedded semicolon",
      identical(sum(unclass(v_apos) == 3, na.rm = TRUE),
                sum(tdat$ReasonDeclined == "Not applicable; other")))

v_squo <- quiet(jencode(tdat, ReasonDeclined,
                        map = "'Refused'=9; else=NA"))
check("N11 single-quoted word still accepted",
      identical(sum(unclass(v_squo) == 9, na.rm = TRUE),
                sum(tdat$ReasonDeclined == "Refused")))

check("N12 genuinely unbalanced quote still errors",
      grepl("Unbalanced quotation mark",
            grab(jencode(tdat, Status, map = "\"Bail=1; Parole=2"))))

# --- N13-N15: shared parse errors, jrecode parity (the S238 B ruling) --------

g_comma_e <- grab(jencode(tdat, Status, map = "Bail=1, Parole=2"))
check("N13 comma diagnosis carries the Rule L map line",
      grepl("Use semicolons instead:", g_comma_e, fixed = TRUE) &&
      grepl("\n  map = ", g_comma_e, fixed = TRUE))

g_rhs_e <- grab(jencode(tdat, Status, map = "Bail=oops"))
# S253: flattened. The emitter wraps this message now, and the break falls
# between "must" and "be". The assertion is about what the error SAYS, so it
# must not pin where the line happens to break -- unlike N13 just above,
# which pins a Rule L line on purpose and is deliberately NOT flattened.
check("N14 invalid-target error keeps the shared sentence",
      grepl("New values must be numeric, a system-NA alias", flat(g_rhs_e),
            fixed = TRUE))

.strip_fn <- function(x) sub("^j(en|re)code\\(\\): ", "", x)
.dfj <- data.frame(V = c(1, 2, 3))
g_rhs_r <- grab(jrecode(.dfj, V, map = "1=oops"))
check("N15 jencode and jrecode render the shared error identically",
      {
        a <- .strip_fn(g_rhs_e); b <- .strip_fn(g_rhs_r)
        a2 <- sub("'Bail=oops'", "'1=oops'", a, fixed = TRUE)
        # Same wording once the rule text is aligned. S256: the comparison
        # moved from lines-2+ byte-identity to flattened identity. The old
        # line match held only because both messages happened to break line
        # 1 at the same word; the S256 chrome reserve moved that break, and
        # the fill no longer re-synchronizes across the differing rule
        # strings. Line alignment was an accident of the arithmetic --
        # wording parity is the S238 B-ruling property, and flat() asserts
        # exactly that, wrap-proof.
        identical(flat(a2), flat(b))
      })

# --- N16-N18: strict default, caps, else forms -------------------------------

many <- data.frame(W = c("Alpha", "Bravo", "Charlie", "Delta", "Echo",
                         "Foxtrot", "Golf", "Hotel", "Yes"),
                   stringsAsFactors = FALSE)
g_strict <- grab(jencode(many, W, map = "Yes=1"))
check("N16 strict-default error caps the word list at 5 + \"and 3 more\"",
      grepl("\"Echo\", and 3 more", g_strict, fixed = TRUE) &&
      !grepl("Foxtrot", g_strict, fixed = TRUE))

check("N17 strict-default remedy is the Rule L line",
      grepl("\n  map = \"...; else=NA\"", g_strict, fixed = TRUE))

g_case <- grab(jencode(data.frame(Q = c("Refused", "Yes"),
                                  stringsAsFactors = FALSE),
                       Q, map = "refused=1; Yes=2"))
check("N18 case near-miss diagnosis names both spellings",
      grepl("differs from the map's \"refused\" only in capitalization",
            g_case, fixed = TRUE))

g_m5 <- grab(jencode(many, W, map = "Yes=1; else=NA"))
check("N19 M5 names the swept words on their own line, capped",
      grepl("The unmapped words were \"Alpha\", \"Bravo\", \"Charlie\",",
            g_m5, fixed = TRUE) &&
      grepl("and 3 more", g_m5, fixed = TRUE))

big <- data.frame(Q = c(rep("Not stated", 900), rep("Unknown", 640),
                        rep("Yes", 50)), stringsAsFactors = FALSE)
check("N20 counts in prose take the house separator (1,540 cells)",
      grepl("(1,540 cells)", grab(jencode(big, Q, map = "Yes=1; else=NA")),
            fixed = TRUE))

v_tag <- quiet(jencode(tdat, ReasonDeclined, map = "Refused=1; else=.a",
                       convention = "stata"))
check("N21 else=.a mints lowercase Stata-style tagged NA",
      all(haven::is_tagged_na(unclass(v_tag)[tdat$ReasonDeclined !=
                                             "Refused"], "a")))

check("N22 else=copy refused with the two-line remedy",
      grepl("else=copy cannot be used here",
            grab(jencode(tdat, Status, map = "Bail=1; else=copy")),
            fixed = TRUE))

# --- N23-N27: face value, repair mode, the evidence nudge --------------------

g_age <- grab(jencode(tdat, AgeText))
v_age <- quiet(jencode(tdat, AgeText))
check("N23 all-numeric column converts by FACE VALUE, never rank",
      identical(as.numeric(unclass(v_age)), as.numeric(tdat$AgeText)))

check("N24 all-numeric note: never-renumbered example + no-labels line",
      grepl("is a number stored as text", g_age, fixed = TRUE) &&
      grepl("never renumbered", g_age, fixed = TRUE) &&
      grepl("No value labels were attached", g_age, fixed = TRUE) &&
      is.null(labelled::val_labels(v_age)))

v_rep <- quiet(jencode(tdat, AgeAtRelease, map = "else=NA"))
num_mask <- !is.na(suppressWarnings(as.numeric(tdat$AgeAtRelease)))
check("N25 repair mode keeps numbers at face value, sweeps words + blanks",
      identical(as.numeric(unclass(v_rep))[num_mask],
                suppressWarnings(as.numeric(tdat$AgeAtRelease))[num_mask]) &&
      all(is.na(unclass(v_rep)[!num_mask])))

g_rep <- grab(jencode(tdat, AgeAtRelease, map = "else=NA"))
check("N26 face-value repair note counts the kept cells (70 values)",
      grepl("Note: 70 values in 'AgeAtRelease' stored as text were kept",
            g_rep, fixed = TRUE))

check("N27 word-evidence -99 nudge fires and CITES its evidence (S238)",
      grepl("-99 in 'AgeAtRelease' looks like a coded missing value",
            flat(g_rep), fixed = TRUE) &&
      grepl("the column also contained the word \"Refused\"", flat(g_rep),
            fixed = TRUE) &&
      # S345: with no convention selected the remedy follows the menu
      # ("Then declare"); N47k-m hold both forms.
      grepl("\nThen declare -99 with jdeclare_missing()", g_rep, fixed = TRUE))

neg_ctrl <- data.frame(V = c("1", "2", "3", "-5", "Other", "2"),
                       stringsAsFactors = FALSE)
check("N28 no nudge without evidence (kept negative, no wordlist word)",
      !grepl("coded missing value",
             grab(jencode(neg_ctrl, V, map = "else=NA")), fixed = TRUE))

mag_only <- data.frame(V = c("1", "2", "3", "-999", "2", "1"),
                       stringsAsFactors = FALSE)
g_mag <- grab(jencode(mag_only, V))
check("N29 magnitude channel alone still fires, with no evidence clause",
      grepl("-999 in 'V' looks like a coded missing value", g_mag,
            fixed = TRUE) &&
      !grepl("also contained", g_mag, fixed = TRUE))

# --- N30-N32: M10 minting note (both S238 defect fixes) ----------------------

coll <- data.frame(Q = c("Yes", "No", "Refused", "Don't know", "Skipped"),
                   stringsAsFactors = FALSE)
g_coll <- grab(jencode(coll, Q,
                       map = paste0("Yes=1; No=0; Refused=-99; ",
                                    "Don't know=-99; Skipped=-99")))
check("N30 M10 names ALL words collapsing to a flagged code",
      grepl(paste0("\"Refused\", \"Don't know\", and \"Skipped\" were ",
                   "encoded as -99"), g_coll, fixed = TRUE))

g_mblank <- grab(jencode(tdat, Outcome,
                         map = "Reoffended=1; No reoffence=0; blank=-99"))
check("N31 M10 blank form counts the cells (was hardcoded singular)",
      grepl("6 blank cells were encoded as -99", g_mblank, fixed = TRUE))

g_one <- grab(jencode(coll, Q,
                      map = "Yes=1; No=0; Refused=-99; else=NA"))
check("N32 M10 singular form keeps its singular verb",
      grepl("\"Refused\" was encoded as -99", g_one, fixed = TRUE))

# --- N33a-N33h: a factor is accepted (S310) ----------------------------------
# A factor is text with a declared order: encoded in LEVEL order, a level
# with no cases keeps its code and label (tagged in the listing), an
# ordered factor skips the rerun nudge, numeric levels convert by face
# value of the level TEXT (never the internal integer code), and map mode
# names the level text. N33 was the factor GUARD until S310; the guard is
# gone, so the letter series replaces it.

.f1 <- data.frame(id = 1:6)
.f1$V <- factor(c("Low", "High", "Low", "High", "Low", "High"),
                levels = c("Low", "Medium", "High"))
# Value-returning calls are wrapped so a master that still refuses a
# factor FAILS inside the verdict instead of halting the battery.
.val <- function(expr) tryCatch(suppressMessages(expr), error = function(e) NULL)
g_f1 <- grab(jencode(.f1, V))
v_f1 <- .val(jencode(.f1, V))
check("N33a factor: encoded in level order, not alphabetically (High=3)",
      grepl("'V' was encoded in its level order:", g_f1, fixed = TRUE) &&
      !is.null(v_f1) && identical(as.numeric(v_f1), c(1, 3, 1, 3, 1, 3)))
check("N33b factor: a level with no cases keeps its code and label",
      !is.null(v_f1) &&
      identical(unname(labelled::val_labels(v_f1)), c(1, 2, 3)) &&
      identical(names(labelled::val_labels(v_f1)),
                c("Low", "Medium", "High")))
check("N33c factor: the empty level is tagged (no cases); others are not",
      grepl("\"Medium\" -> 2  (no cases)", g_f1, fixed = TRUE) &&
      !grepl("\"Low\"    -> 1  (no cases)", g_f1, fixed = TRUE))
check("N33d factor: the rerun nudge names every level in level order",
      grepl("rerun with a map", flat(g_f1), fixed = TRUE) &&
      grepl("map = \"Low=1; Medium=2; High=3\"", g_f1, fixed = TRUE))

.f2 <- data.frame(id = 1:4)
.f2$V <- factor(c("Low", "High", "Low", "High"), levels = c("Low", "High"),
                ordered = TRUE)
g_f2 <- grab(jencode(.f2, V))
check("N33e ordered factor: level order kept, rerun nudge not printed",
      grepl("'V' was encoded in its level order:", g_f2, fixed = TRUE) &&
      !grepl("rerun with a map", flat(g_f2), fixed = TRUE))

# Levels deliberately NOT in sorted order, so the internal integer codes
# (1, 2, 3) differ from the face values (3, 1, 2): an unclass() slip
# would pass a sorted-levels fixture.
.f3 <- data.frame(id = 1:3)
.f3$V <- factor(c("3", "1", "2"), levels = c("3", "1", "2"))
g_f3 <- grab(jencode(.f3, V))
check("N33f numeric levels: face value of the level text, not the code",
      identical(as.numeric(.val(jencode(.f3, V))), c(3, 1, 2)) &&
      grepl(paste0("every level of 'V' is a number; each was converted ",
                   "to its own value"), flat(g_f3), fixed = TRUE))

.f4 <- data.frame(id = 1:3); .f4$V <- factor(c("1", "2", "Refused"))
check("N33g mixed levels: the refusal says numeric levels, not text",
      grepl("'V' mixes numeric levels with words: \"Refused\".",
            flat(grab(jencode(.f4, V))), fixed = TRUE))

v_f5 <- .val(jencode(.f1, V, map = "Low=1; High=2"))
g_f5 <- grab(jencode(.f1, V, map = "Low=1; High=2"))
check("N33h map mode: an empty level absent from the map is not unmapped",
      !is.null(v_f5) &&
      identical(names(labelled::val_labels(v_f5)), c("Low", "High")) &&
      identical(as.numeric(v_f5), c(1, 2, 1, 2, 1, 2)) &&
      !grepl("not in the map", g_f5, fixed = TRUE))

# --- N34-N36: the three remaining type guards (phrase updated S310) ---------

.g2 <- data.frame(id = 1:2); .g2$V <- as.Date(c("2020-01-01", "2021-01-01"))
check("N34 date/time guard",
      grepl("is a date/time variable; only text and factor",
            flat(grab(jencode(.g2, V))), fixed = TRUE))

.g3 <- data.frame(id = 1:2); .g3$V <- c(1, 2)
check("N35 numeric guard points back at jrecode()",
      grepl("is a numeric variable; only text and factor",
            flat(grab(jencode(.g3, V))), fixed = TRUE) &&
      grepl("use jrecode()", grab(jencode(.g3, V)), fixed = TRUE))

.g4 <- data.frame(id = 1:2); .g4$V <- c(TRUE, FALSE)
check("N36 logical guard",
      grepl("is a logical variable; only text and factor",
            flat(grab(jencode(.g4, V))), fixed = TRUE))

# --- N37: trim notes ---------------------------------------------------------

g_trim_a <- grab(jencode(tdat, SupervisionType))
g_trim_m <- grab(jencode(tdat, SupervisionType,
                         map = "Community=1; Custody=2"))
check("N37 trim notes, automatic + map mode, count the 9 spaced cells",
      grepl("9 cells in 'SupervisionType' had outer spaces removed",
            g_trim_a, fixed = TRUE) &&
      grepl("9 cells in 'SupervisionType' matched the map only after",
            g_trim_m, fixed = TRUE))

# --- N38-N39: the Qualtrics pair ---------------------------------------------

v_qt <- quiet(jencode(tdat, Q_AgreeText,
                      map = paste0("Strongly disagree=1; Disagree=2; ",
                                   "Neither agree nor disagree=3; ",
                                   "Agree=4; Strongly agree=5")))
check("N38 choice-text export recovers the numeric-export values",
      identical(as.numeric(unclass(v_qt)), as.numeric(tdat$Q_AgreeNum)))

v_qn <- quiet(jencode(tdat, Q_AgreeNum))
check("N39 numeric-export-as-text converts by face value (1..5 stay 1..5)",
      identical(as.numeric(unclass(v_qn)), as.numeric(tdat$Q_AgreeNum)))

# --- N40-N42: hygiene --------------------------------------------------------

check("N40 assign-or-lose reminder present (returns-values contract)",
      grepl("This call changes tdat only if you assign the result:",
            grab(jencode(tdat, Status)), fixed = TRUE))

# Rule U: sweep the surface and assert NO non-indented emitted line exceeds
# 76 columns. Indented lines (two+ leading spaces) are Rule L runnable /
# listing lines and are exempt by design.
.sweep <- c(
  grab(jencode(tdat, Status)),          grab(jencode(tdat, Outcome)),
  grab(jencode(tdat, AgeText)),         grab(jencode(tdat, AgeAtRelease,
                                                     map = "else=NA")),
  grab(jencode(tdat, SupervisionType)), g_strict, g_case, g_m5, g_coll,
  g_mblank, g_comma_e, g_rhs_e,
  grab(jencode(tdat, Status, map = "Bail=1; else=copy")),
  grab(jencode(many, W, map = "Yes=1; No=copy")),
  g_f1, g_f3)                              # S310: the two factor-mode notes
.lines <- unlist(strsplit(.sweep, "\n", fixed = TRUE))
.lines <- .lines[nzchar(trimws(.lines)) & !grepl("^\\s{2}", .lines)]
# S253: the ceiling is the PINNED width, not a literal. Adaptive width made
# a hardcoded 76 an assertion about the pane rather than about the package,
# and it would pass or fail on where the file happened to be run.
.over  <- .lines[nchar(.lines) > .pin_width]
check(paste0("N41 Rule U: no emitted prose line exceeds ", .pin_width,
             " columns"),
      length(.over) == 0L)
if (length(.over) > 0L) for (l in .over) cat("        over: ", l, "\n")

# N42 (S292): the check N41 cannot make. N41 is a CEILING -- it sees a long
# line and is blind to a SHORT one, which is how the S287 jencode double
# wrap (the word list landing as 15 and 24 columns when one line held it)
# sat under a green 41/41. The runtime counterpart of the dev script's
# wrap gate: for each pair of consecutive unindented prose lines, the
# lower line's first word must NOT have fit on the line above. Two
# exemptions, both breaks the wrapper makes on purpose: (1) the line
# above ends a sentence and the line below opens one (Rule 2 relocates a
# break to the sentence boundary); (2) the line below is a paragraph's
# last line (the orphan pull-back moves a word DOWN by design). An
# error's first line is measured at width - 8: the emitter reserved that
# for R's "Error : " chrome, which conditionMessage() does not carry.
# Per-surface, not over the joined sweep, so "first line" means the
# surface's first line. Own helper, per this file's conventions.
pbreaks <- function(txt, width, first_line_slack = 0L) {
  ls  <- strsplit(txt, "\n", fixed = TRUE)[[1]]
  out <- character(0)
  for (i in seq_len(max(0L, length(ls) - 1L))) {
    a <- ls[i]; b <- ls[i + 1L]
    if (!nzchar(a) || !nzchar(b) || grepl("^ ", a) || grepl("^ ", b)) next
    w <- strsplit(b, " ", fixed = TRUE)[[1]][1L]
    # (1) sentence end above (not an initialism like "e.g.") + sentence
    #     start below -> Rule 2 relocation, exempt
    if (grepl("[.!?]$", a) &&
        !grepl("^([A-Za-z]\\.)+$", sub(".*\\s", "", a)) &&
        grepl("^[A-Z0-9\"]", b)) next
    # (2) last line of a paragraph below -> orphan pull-back, exempt
    if (grepl("[.!?:]$", b)) next
    budget <- width - if (i == 1L) first_line_slack else 0L
    if (nchar(a) + 1L + nchar(w) <= budget)
      out <- c(out, sprintf("[%d] %s | %s", i, a, w))
  }
  out
}
# The reproducer Jeff saw at the S287 walk: two unmapped words, both quoted
# phrases; on the 0.9.164 master its list broke "\"No answer\" and" /
# "\"Not applicable; other\"." after one wrap would have held it.
g_repro <- grab(jencode(tdat, ReasonDeclined, map = "Refused=1; Don't know=2"))
.surfaces <- c(.sweep, g_repro)
# An error surface carries the "jencode(): " prefix; its first line was
# wrapped at reserve nchar(prefix) + 8, so the chrome slack applies. Every
# other surface is a note at reserve 0.
.pb <- unlist(lapply(.surfaces, function(s) {
  slack <- if (grepl("^jencode\\(\\): ", s)) 8L else 0L
  pbreaks(s, .pin_width, slack)
}))
check(paste0("N42 no premature break: a line's first word never fit on ",
             "the line above (", length(.surfaces), " surfaces)"),
      length(.pb) == 0L)
if (length(.pb) > 0L) for (l in .pb) cat("        early: ", l, "\n")

# --- N43a-N43g: the editing functions send a factor or text variable to
#     jencode() (S310) ---------------------------------------------------------
# One remedy line for both types at all six sites -- jrecode(), jrelabel()
# and jdeclare_missing(), character and factor -- replacing the base-R
# advice (as.numeric(), as.numeric(as.character())) that returned all NA
# on words. N43g locks that the base-R line is gone from every site.

.r1 <- data.frame(id = 1:4, Txt = c("a", "b", "a", "b"),
                  stringsAsFactors = FALSE)
.r1$Fac <- factor(c("a", "b", "a", "b"))
.remedy <- "Convert it to numbers first with jencode()."
.g43 <- list(
  jrecode_txt = grab(jrecode(.r1, Txt, map = "1=2")),
  jrecode_fac = grab(jrecode(.r1, Fac, map = "1=2")),
  jrelabel_txt = grab(jrelabel(.r1, Txt, labels = "1=A")),
  jrelabel_fac = grab(jrelabel(.r1, Fac, labels = "1=A")),
  jdeclare_txt = grab(jdeclare_missing(.r1, Txt, codes = -99)),
  jdeclare_fac = grab(jdeclare_missing(.r1, Fac, codes = -99)))
check("N43a jrecode(): a text variable is sent to jencode()",
      grepl(.remedy, .g43$jrecode_txt, fixed = TRUE) &&
      grepl("is a character (text) variable", flat(.g43$jrecode_txt),
            fixed = TRUE))
check("N43b jrecode(): a factor is sent to jencode()",
      grepl(.remedy, .g43$jrecode_fac, fixed = TRUE) &&
      grepl("is a factor", .g43$jrecode_fac, fixed = TRUE))
check("N43c jrelabel(): a text variable is sent to jencode()",
      grepl(.remedy, .g43$jrelabel_txt, fixed = TRUE))
check("N43d jrelabel(): a factor is sent to jencode()",
      grepl(.remedy, .g43$jrelabel_fac, fixed = TRUE))
check("N43e jdeclare_missing(): a text variable is sent to jencode()",
      grepl(.remedy, .g43$jdeclare_txt, fixed = TRUE))
check("N43f jdeclare_missing(): a factor is sent to jencode()",
      grepl(.remedy, .g43$jdeclare_fac, fixed = TRUE))
# N43h (S310 mv): the two jdeclare_missing() guards use the house generic
# "missing values", not "missing-value codes" -- [MISSING-VALUE-TERMS]
# reserves that term for the .xpt messages.
check("N43h jdeclare_missing() guards say \"missing values can only be declared\"",
      all(vapply(.g43[c("jdeclare_txt", "jdeclare_fac")], function(g)
        grepl("missing values can only be declared on numeric variables",
              flat(g), fixed = TRUE) &&
        !grepl("missing-value codes", flat(g), fixed = TRUE), logical(1))))
check("N43g no site still offers the base-R conversion",
      !any(grepl("as.numeric(", unlist(.g43), fixed = TRUE)) &&
      !any(grepl("as.character(", unlist(.g43), fixed = TRUE)))

# --- N44a-N44j: a string variable's declared missing values (S340) -----------
# A .sav file can declare some of a string variable's values missing
# (MISSING VALUES MARITAL ('UNKNOWN')); haven carries them as a character
# na_values. Until 0.9.214 automatic mode numbered a declared string as an
# ordinary category -- the declaration lost without a word, by the route
# every "Convert it to numbers first with jencode()" message recommends. Its
# cells are now left missing and a note gives the map that keeps them
# declared (the blank rule's treatment). Map mode is unchanged: the user's
# rules decide.
e44 <- data.frame(id = 1:10)
e44$MS <- haven::labelled_spss(
  c("UNKNOWN", "Married", "Single", "Married", "UNKNOWN", "Single", "Married",
    "Single", "REF", "Single"),
  labels = c(Refused = "REF"), na_values = c("UNKNOWN", "REF"),
  label = "Marital status")
e44$M1 <- haven::labelled_spss(
  c("UNKNOWN", rep(c("Married", "Single"), 4), "Married"), na_values = "UNKNOWN")
e44$Nm <- haven::labelled_spss(c("1", "2", "-99", "3", "1", "2", "-99", "3", "1", "2"),
                               na_values = "-99")
e44$Pl <- haven::labelled(rep(c("Low", "High"), 5), labels = c(Lo = "Low"))
.g44 <- grab(.r44 <- jencode(e44, MS))
check("N44a automatic mode: a declared missing string is not numbered; its cells are NA and the words keep their numbers",
      identical(as.numeric(unclass(.r44)), c(NA, 1, 2, 1, NA, 2, 1, 2, NA, 2)) &&
        identical(names(attr(.r44, "labels")), c("Married", "Single")))
# S345: the suggested map NAMES the declared strings, each sent to NA. Until
# 0.9.218 it left them out, and the call it offered stopped ("contains words
# not in the map"): in map mode a declared string is a word like any other.
check("N44b ... the listing leaves the declared strings out, and the suggested map sends each to NA, so the call runs",
      grepl("  \"Married\" -> 1\n  \"Single\"  -> 2\nIf these", .g44, fixed = TRUE) &&
        grepl(paste0("  e44$MSR <- jencode(e44, MS,\n",
                     "                     map = \"Married=1; Single=2; REF=NA; UNKNOWN=NA\")\n\n"),
              .g44, fixed = TRUE) &&
        { e <- new.env(parent = globalenv()); assign("e44", e44, envir = e)
          .runs(.offered(.g44)[[1]], e) && .same(get("e44", envir = e)$MSR, .r44) })
check("N44c ... and the note says how many cells, which values, that the two strings will share one missing value, and gives the map that keeps them declared (pinned whole)",
      grepl(paste0(
        "\n\nNote: 3 cells in 'MS' holding a declared missing value (\"REF\", \"UNKNOWN\")\n",
        "were left missing (NA).\n",
        "To keep them declared, as one missing value, rerun with a map sending those\n",
        "values to missing:\n",
        "  e44$MSR <- jencode(e44, MS,\n",
        "                     map = \"Married=1; Single=2; REF=missing;\n",
        "                           UNKNOWN=missing\")\n\n",
        "Note: This call changes e44 only if you assign the result:"),
        .g44, fixed = TRUE))
check("N44c2 one declared string in several cells: the cells are plural, the value singular, and no \"as one missing value\" (nothing is merged)",
      { e <- e44; e$M2 <- haven::labelled_spss(
          c("UNKNOWN", "UNKNOWN", rep(c("Married", "Single"), 4)), na_values = "UNKNOWN")
        g <- flat(grab(jencode(e, M2)))
        grepl("Note: 2 cells in 'M2' holding a declared missing value (\"UNKNOWN\") were left missing (NA). To keep them as declared missing values, rerun with a map sending that value to missing:",
              g, fixed = TRUE) })
check("N44d one cell, one value: the singular throughout",
      grepl(paste0(
        "Note: 1 cell in 'M1' holding a declared missing value (\"UNKNOWN\") was left\n",
        "missing (NA).\n",
        "To keep it as a declared missing value, rerun with a map sending that value\n",
        "to missing:\n",
        "  e44$M1R <- jencode(e44, M1, map = \"Married=1; Single=2; UNKNOWN=missing\")\n"),
        grab(jencode(e44, M1)), fixed = TRUE))
check("N44e the map the note offers runs, and the cells come back declared missing under the convention in force",
      { .c44 <- getOption(".jst_options_missing_convention")
        options(.jst_options_missing_convention = "spss")
        e <- new.env(parent = globalenv()); assign("e44", e44, envir = e)
        # S345: the note's call is the SECOND the output offers (the first,
        # under the listing, now spans three lines too); .offered() takes
        # each whole.
        ok <- tryCatch({
          suppressMessages(eval(parse(text = .offered(.g44)[[2]]), e))
          x <- get("e44", envir = e)$MSR
          identical(attr(x, "na_values"), -99) &&
            identical(as.numeric(unclass(x)), c(-99, 1, 2, 1, -99, 2, 1, 2, -99, 2))
        }, error = function(err) FALSE)
        options(.jst_options_missing_convention = .c44)
        ok })
check("N44f numbers stored as text with a declared string: the numbers keep face value, the declared cells are NA, and the note's map names every number",
      { g <- grab(r <- jencode(e44, Nm))
        identical(as.numeric(r), c(1, 2, NA, 3, 1, 2, NA, 3, 1, 2)) &&
          grepl("Note: 2 cells in 'Nm' holding a declared missing value (\"-99\") were left",
                g, fixed = TRUE) &&
          grepl("  e44$NmR <- jencode(e44, Nm, map = \"1=1; 2=2; 3=3; -99=missing\")",
                g, fixed = TRUE) })
check("N44g a labelled string with no declaration, and a plain text variable: no such note",
      { a <- grab(jencode(e44, Pl)); b <- grab(jencode(tdat, Status))
        grepl("was encoded alphabetically", a, fixed = TRUE) &&
          grepl("was encoded alphabetically", b, fixed = TRUE) &&
          !grepl("declared missing", a, fixed = TRUE) &&
          !grepl("declared missing", b, fixed = TRUE) })
check("N44h map mode is the user's: a declared string left out of the map is reported as a word not in it",
      grepl("'MS' contains words not in the map: \"REF\" and \"UNKNOWN\".",
            grab(jencode(e44, MS, map = "Married=1; Single=2")), fixed = TRUE))
check("N44i ... and one the map numbers is numbered, with no note about the declaration",
      { g <- grab(r <- jencode(e44, MS, map = "Married=1; Single=2; REF=8; UNKNOWN=9"))
        identical(as.numeric(unclass(r)), c(9, 1, 2, 1, 9, 2, 1, 2, 8, 2)) &&
          !grepl("declared missing", g, fixed = TRUE) })
check("N44j the new notes hold the pinned width and break nowhere early",
      { s  <- c(.g44, grab(jencode(e44, M1)), grab(jencode(e44, Nm)))
        ln <- unlist(strsplit(s, "\n", fixed = TRUE))
        ln <- ln[nzchar(ln) & !grepl("^\\s{2}", ln)]
        !any(nchar(ln) > .pin_width) &&
          length(unlist(lapply(s, pbreaks, width = .pin_width))) == 0L })
rm(e44, .g44, .r44)

# --- N45a-N45j: the automatic suggestions on words a map must quote (S343) ---
# Automatic mode offers its result back as a map -- "rerun with a map to
# choose the numbers" -- and until v0.9.217 built that map from BARE words.
# A category holding a semicolon made the offered call stop ("Invalid rule
# 'Not applicable'"), one holding a comma or an equals sign was read as two
# words or as a target, and a category named else, NA or blank was read as
# the keyword. The words now go through .jst_jencode_lhs_render(), which
# quotes a word holding a separator, a reserved word and a word that opens
# with a quotation mark; and the builder that packs a long map across lines
# separates its rules at the semicolons OUTSIDE quoted words (the S249
# item: a plain split would cut "Skipped; respondent ..." in two).
# Every offered line is RUN as printed (harvested from the captured text,
# the S303 rule) and held to the automatic result. Category names begin
# with different letters so that the listing's order is the same in every
# locale; where a fixture mixes case (Kw) nothing asserts an order.
# (.offered(), .runs() and .same() are in the harness since S345: N44 uses
# them, and a helper is defined above every use.)
q45 <- data.frame(
  Why = rep(c("Don't know", "Moved away, address unknown", "No answer",
              "Other = see notes", "Refused",
              "Skipped; respondent was not asked this question"), 3),
  Kw  = rep(c("else", "NA", "blank", "System", "Yes", "'tis"), 3),
  Bl  = rep(c("A; b", "", "C"), 6),
  stringsAsFactors = FALSE)
.g45 <- grab(.a45 <- jencode(q45, Why))
check("N45a a category holding a semicolon, a comma or an equals sign: the offered call is quoted and packed whole (pinned)",
      grepl(paste0(
        "  q45$WhyR <- jencode(q45, Why,\n",
        "                      map = \"Don't know=1;\n",
        "                            \\\"Moved away, address unknown\\\"=2; No answer=3;\n",
        "                            \\\"Other = see notes\\\"=4; Refused=5;\n",
        "                            \\\"Skipped; respondent was not asked this question\\\"=6\")\n"),
        .g45, fixed = TRUE))
check("N45b ... and it runs as printed, giving the automatic result (it stopped: Invalid rule)",
      { e <- new.env(parent = globalenv()); assign("q45", q45, envir = e)
        o <- .offered(.g45)
        length(o) == 1L && .runs(o[[1]], e) && .same(e$q45$WhyR, .a45) })
.k45 <- grab(.b45 <- jencode(q45, Kw))
check("N45c a category named like a keyword (else, NA, blank, System) or opening with a quotation mark is quoted; an ordinary one is not",
      all(vapply(c("\\\"else\\\"=", "\\\"NA\\\"=", "\\\"blank\\\"=",
                   "\\\"System\\\"=", "\\\"'tis\\\"=", " Yes="),
                 function(s) grepl(s, .k45, fixed = TRUE), logical(1))) &&
        !grepl("\\\"Yes\\\"", .k45, fixed = TRUE))
check("N45d ... and that call runs as printed, giving the automatic result (else=3 was read as the else rule)",
      { e <- new.env(parent = globalenv()); assign("q45", q45, envir = e)
        o <- .offered(.k45)
        length(o) == 1L && .runs(o[[1]], e) && .same(e$q45$KwR, .b45) })
.l45 <- grab(jencode(q45, Bl))
check("N45e the blank note's call carries the quoted word too, and runs: the blank cells get their code",
      { e <- new.env(parent = globalenv()); assign("q45", q45, envir = e)
        o <- .offered(.l45)
        length(o) == 2L &&
          grepl("map = \"\\\"A; b\\\"=1; C=2; blank=0\")", o[[2]], fixed = TRUE) &&
          .runs(o[[2]], e) &&
          identical(as.numeric(unclass(e$q45$BlR)), rep(c(1, 0, 2), 6)) })
check("N45f the renderer, word by word: separators, keywords in any case and a leading quote mark are quoted; blank cells are the blank token",
      identical(
        unname(vapply(c("Yes", "else", "Else", "NA", "na", "System", "SYSMIS",
                        "blank", "Blank", "a;b", "a=b", "a,b", "'x", "\"y", "",
                        "missing", "Elsewhere", "Nan", "Don't know"),
                      .jst_jencode_lhs_render, character(1))),
        c("Yes", "\"else\"", "\"Else\"", "\"NA\"", "\"na\"", "\"System\"",
          "\"SYSMIS\"", "\"blank\"", "\"Blank\"", "\"a;b\"", "\"a=b\"",
          "\"a,b\"", "\"'x\"", "\"\"y\"", "blank", "missing", "Elsewhere",
          "Nan", "Don't know")))
check("N45g map mode: a quoted keyword in the user's map is quoted in the map a note echoes back (it came back bare: else=3)",
      { g <- grab(jencode(q45, Kw, map = paste0(
          "\"else\"=1; \"NA\"=2; \"blank\"=3; \"System\"=4; Yes=-99; ",
          "\"'tis\"=6")))
        grepl("\\\"else\\\"=1; \\\"NA\\\"=2; \\\"blank\\\"=3; \\\"System\\\"=4;",
              flat(g), fixed = TRUE) })
check("N45h the packer keeps a quoted word whole when the break would fall inside it (a unit on the builder)",
      { r <- .jst_jencode_map_call("d", "v", paste0(
          "Alpha=1; \"Bravo; a long second half that will not fit on the line\"=2; ",
          "Charlie=3"))
        ln <- strsplit(r, "\n", fixed = TRUE)[[1]]
        any(grepl("\\\"Bravo; a long second half that will not fit on the line\\\"=2;",
                  ln, fixed = TRUE)) &&
          identical(trimws(strsplit(eval(parse(text = sub(
            "^  d\\$vR <- jencode\\(d, v,", "c(", r)))[["map"]], "\n", fixed = TRUE)[[1]]),
            c("Alpha=1;",
              "\"Bravo; a long second half that will not fit on the line\"=2;",
              "Charlie=3")) })
check("N45i controls: a map of plain words is as it was, on one line and packed",
      grepl("  tdat$StatusR <- jencode(tdat, Status, map = \"Bail=1; Parole=2; Remand=3\")",
            grab(jencode(tdat, Status)), fixed = TRUE) &&
        identical(.jst_jencode_map_call("d", "v", paste(paste0(
          "Category number ", 1:6, "=", 1:6), collapse = "; ")),
          paste0("  d$vR <- jencode(d, v,\n",
                 "                  map = \"Category number 1=1; Category number 2=2;\n",
                 "                        Category number 3=3; Category number 4=4;\n",
                 "                        Category number 5=5; Category number 6=6\")")))
check("N45j the new notes hold the pinned width outside their code lines and break nowhere early",
      { s  <- c(.g45, .k45, .l45)
        ln <- unlist(strsplit(s, "\n", fixed = TRUE))
        ln <- ln[nzchar(ln) & !grepl("^\\s{2}", ln)]
        !any(nchar(ln) > .pin_width) &&
          length(unlist(lapply(s, pbreaks, width = .pin_width))) == 0L })

# --- N46a-N46n: an expression given as the data (S343) -----------------------
# jrecode() and jencode() return the new values and change nothing, and
# their closing reminder shows the assignment that keeps them. With an
# expression in the data's place -- jencode(mk46(), w) -- that line read
# "mk46()$<name> <- jencode(...)", which is not R, and every call the notes
# offered pasted the expression the same way ("mk46()$wR <- jencode(mk46(),
# ..."). The lines now name mydata, and the reminder says how mydata is
# made. A place (lst46$d) and a name keep what they had. The offered lines
# are run as printed. jsum() and javg() print the same pattern line under
# their own reminder and took the same two lines (N46m, N46n).
mk46  <- function() data.frame(w = rep(c("a", "b"), 3), Age = c(1, 2, 3, 1, 2, 3),
                               stringsAsFactors = FALSE)
lst46 <- list(d = mk46())
.g46  <- grab(jencode(mk46(), w))
check("N46a jencode(): the reminder names the data frame first, then assigns (pinned whole)",
      grepl(paste0(
        "\n\nNote: The result is kept only if you assign it.\n",
        "Name the data frame first, then assign the result to a variable in it:\n",
        "  mydata <- mk46()\n",
        "  mydata$<name> <- jencode(mydata, ...)\n",
        "To check the encoding landed correctly, compare jfreq() on the original and\n",
        "the new column."), .g46, fixed = TRUE))
check("N46b ... the call the listing offers names mydata, and the expression is pasted nowhere but on the naming line",
      grepl("  mydata$wR <- jencode(mydata, w, map = \"a=1; b=2\")", .g46, fixed = TRUE) &&
        identical(grep("mk46()", strsplit(.g46, "\n", fixed = TRUE)[[1]], fixed = TRUE, value = TRUE),
                  "  mydata <- mk46()"))
check("N46c ... and the two lines run as printed: the naming line, then the offered call",
      { e  <- new.env(parent = globalenv())
        ln <- strsplit(.g46, "\n", fixed = TRUE)[[1]]
        .runs(ln[grep("^  mydata <- ", ln)], e) &&
          .runs(.offered(.g46)[[1]], e) &&
          identical(as.numeric(unclass(e$mydata$wR)), rep(c(1, 2), 3)) })
.r46 <- grab(jrecode(mk46(), Age, map = "1=-99; else=copy"))
check("N46d jrecode(): the same reminder, with its own function and noun (pinned whole)",
      grepl(paste0(
        "\n\nNote: The result is kept only if you assign it.\n",
        "Name the data frame first, then assign the result to a variable in it:\n",
        "  mydata <- mk46()\n",
        "  mydata$<name> <- jrecode(mydata, ...)\n",
        "To check the recode landed correctly, compare jfreq() on the original and\n",
        "the new column."), .r46, fixed = TRUE))
check("N46e ... and every call its notes offer names mydata: the recode pair and the declaration with modify = TRUE, which run after the naming line",
      { e  <- new.env(parent = globalenv())
        ln <- strsplit(.r46, "\n", fixed = TRUE)[[1]]
        dl <- ln[grep("^  jdeclare_missing\\(mydata, AgeR, ", ln)]
        cv <- getOption(".jst_options_missing_convention")
        options(.jst_options_missing_convention = "spss")
        ok <- identical(grep("mk46()", ln, fixed = TRUE, value = TRUE), "  mydata <- mk46()") &&
          length(dl) == 1L &&
          .runs(ln[grep("^  mydata <- ", ln)], e) &&
          .runs(.offered(.r46, "jrecode")[[2]], e) && .runs(dl, e) &&
          identical(attr(e$mydata$AgeR, "na_values"), -99)
        options(.jst_options_missing_convention = cv)
        ok })
check("N46f a subset in the data's place is an expression too, quoted as typed",
      grepl("  mydata <- tdat[1:10, ]\n  mydata$<name> <- jencode(mydata, ...)\n",
            grab(jencode(tdat[1:10, ], Status)), fixed = TRUE))
check("N46g a place (lst46$d) keeps the one line, which runs once <name> is given, and its offered call names the place",
      { g <- grab(jencode(lst46$d, w))
        grepl("Note: This call changes lst46$d only if you assign the result:\n  lst46$d$<name> <- jencode(...)\n",
              g, fixed = TRUE) &&
          grepl("  lst46$d$wR <- jencode(lst46$d, w, map = \"a=1; b=2\")", g, fixed = TRUE) &&
          !grepl("mydata", g, fixed = TRUE) })
check("N46h a name, and the juse() default, are as they were",
      { a <- grab(jencode(tdat, Status)); b <- grab(jencode(Status))
        want <- "\n\nNote: This call changes tdat only if you assign the result:\n  tdat$<name> <- jencode(...)\n"
        grepl(want, a, fixed = TRUE) && grepl(want, b, fixed = TRUE) &&
          !grepl("mydata", paste(a, b), fixed = TRUE) &&
          grepl("\n\nNote: This call changes tdat only if you assign the result:\n  tdat$<name> <- jrecode(...)\nTo check the recode landed correctly,",
                grab(jrecode(tdat, id, map = "1=1; else=copy")), fixed = TRUE) })
check("N46i the result is the same whatever the data's form: an expression, a place and a name encode alike",
      { d46 <- mk46()
        .same(quiet(jencode(mk46(), w)), quiet(jencode(d46, w))) &&
          .same(quiet(jencode(lst46$d, w)), quiet(jencode(d46, w))) })
check("N46j at the minimal level there is no reminder, for any form of the data",
      { lv <- getOption(".jst_output_level"); options(.jst_output_level = "minimal")
        g <- paste(grab(jencode(mk46(), w)), grab(jrecode(mk46(), Age, map = "1=1; else=copy")))
        options(.jst_output_level = lv)
        !grepl("only if you assign", g, fixed = TRUE) && !grepl("mydata <-", g, fixed = TRUE) })
check("N46k the new reminder holds the pinned width outside its code lines and breaks nowhere early",
      { s  <- c(.g46, .r46)
        ln <- unlist(strsplit(s, "\n", fixed = TRUE))
        ln <- ln[nzchar(ln) & !grepl("^\\s{2,}", ln)]
        !any(nchar(ln) > .pin_width) &&
          length(unlist(lapply(s, pbreaks, width = .pin_width))) == 0L })
check("N46l jrecode(): a place keeps its lines too -- the reminder, the recode pair and the declaration all name lst46$d",
      { g <- grab(jrecode(lst46$d, Age, map = "1=-99; else=copy"))
        grepl("Note: This call changes lst46$d only if you assign the result:\n  lst46$d$<name> <- jrecode(...)\n",
              g, fixed = TRUE) &&
          grepl("  lst46$d$AgeR <- jrecode(lst46$d, Age, map = \"1=missing; else=copy\")", g, fixed = TRUE) &&
          !grepl("mydata", g, fixed = TRUE) })
.s46 <- grab(jsum(mk46(), Age, Age))
check("N46m jsum() and javg() print the same pattern line: an expression gets the naming line and mydata (pinned whole; it read mk46()$<name> <- jsum(...))",
      grepl(paste0(
        "\n\nNote: jsum() returns the totals; assign them to a column to keep them:\n",
        "  mydata <- mk46()\n",
        "  mydata$<name> <- jsum(mydata, ...)\n",
        "For the full distribution (min, max, SD), run jdesc() on the new column."),
        .s46, fixed = TRUE) &&
        grepl(paste0(
          "\n\nNote: javg() returns the scores; assign them to a column to keep them:\n",
          "  mydata <- mk46()\n",
          "  mydata$<name> <- javg(mydata, ...)\n",
          "For the full distribution (min, max, SD), run jdesc() on the new column."),
          grab(javg(mk46(), Age, Age)), fixed = TRUE))
check("N46n ... a place and a name keep the one line they had, in both",
      { d46 <- mk46()
        grepl("to keep them:\n  lst46$d$<name> <- jsum(...)\nFor the full", grab(jsum(lst46$d, Age, Age)), fixed = TRUE) &&
          grepl("to keep them:\n  lst46$d$<name> <- javg(...)\nFor the full", grab(javg(lst46$d, Age, Age)), fixed = TRUE) &&
          grepl("to keep them:\n  d46$<name> <- jsum(...)\nFor the full", grab(jsum(d46, Age, Age)), fixed = TRUE) &&
          grepl("to keep them:\n  d46$<name> <- javg(...)\nFor the full", grab(javg(d46, Age, Age)), fixed = TRUE) &&
          grepl("to keep them:\n  tdat$<name> <- jsum(...)\nFor the full", grab(jsum(id, id)), fixed = TRUE) })
rm(q45, .g45, .a45, .k45, .b45, .l45, mk46, lst46, .g46, .r46, .s46)

# --- N47a-N47s: Fix Slate 5, the second cut (S345, v0.9.218) -----------------
# Four things on jencode()'s surface.
# (1) THE ABSENT-WORD NOTE (the S304 item). A map word the data do not hold
#     is legitimate alone -- a category no case has yet -- and its note is
#     advisory (the full level only). Beside an else rule that swept a data
#     word in the same call it is the signature of a mistyped map word:
#     "Parol=2; else=NA" sends every Parole to missing. There the note is
#     now consequential and sits under the sweep note it explains, with the
#     strict error's own line when the two words differ only in case.
# (2) AUTOMATIC MODE'S OFFERED CALLS RUN (the S343 item). A map must account
#     for every cell, so the numbering alone stopped on a variable with
#     blank cells or declared missing strings. Each offered map now carries
#     the rule that leaves them missing (NA: no convention needed). Every
#     offered call is RUN as printed.
# (3) "DECLARE IT" UNDER NO CONVENTION (the S251 item). jdeclare_missing()
#     stops at the choose-first gate there, so the two notes that close on
#     that advice carry the gate's menu first, as the D1 note has since S250.
# (4) A PLACE IN AN OFFERED modify = TRUE LINE (the S343 item).
#     jdeclare_missing(lst$d, ..., modify = TRUE) stops; the line a place is
#     offered is the assignment form, and it runs.
.rem47 <- function(nm) paste0(
  "\n\nNote: This call changes ", nm, " only if you assign the result:\n",
  "  ", nm, "$<name> <- jencode(...)\n",
  "To check the encoding landed correctly, compare jfreq() on the original and\n",
  "the new column.\n")
.menu47 <- paste0(
  "No missing-value convention is selected, so the value cannot be\n",
  "declared yet.\n",
  "Choose one for this session:\n",
  "  joptions(missing.convention = \"stata\")\n",
  "      Lowercase markers behave as true NAs in base R.\n",
  "      Recommended if you also run base R or AI-generated code.\n",
  "  joptions(missing.convention = \"spss\")\n",
  "      Codes stay visible numbers; jstats treats them as missing.\n",
  "      Base R does not.\n",
  "  joptions(missing.convention = \"sas\")\n",
  "      Like Stata, with uppercase markers (.A-.Z).\n",
  "To make the choice permanent, put the same line in your .Rprofile.\n")
.at47 <- function(level, expr) {
  lv <- getOption(".jst_output_level"); options(.jst_output_level = level)
  on.exit(options(.jst_output_level = lv), add = TRUE)
  grab(expr)
}
.conv47 <- function(cv, expr) {
  old <- getOption(".jst_options_missing_convention")
  options(.jst_options_missing_convention = cv)
  on.exit(options(.jst_options_missing_convention = old), add = TRUE)
  force(expr)
}

# (1) ---------------------------------------------------------------------------
s47 <- data.frame(s = c(rep("Bail", 3), rep("Parole", 4), rep("Remand", 3)),
                  stringsAsFactors = FALSE)
.g47a <- grab(jencode(s47, s, map = "Bail=1; Parol=2; Remand=3; else=NA"))
check("N47a a map word the data lack, beside an else rule that swept a data word: the note shows at the standard level, under the sweep note (pinned whole)",
      identical(.g47a, paste0(
        "Note: else=NA converted 1 unmapped word (4 cells) in 's' to missing (NA).\n",
        "The unmapped word was \"Parole\".\n\n",
        "Note: 's' contained none of these map words -- nothing was encoded for them:\n",
        "  \"Parol\"", .rem47("s47"))))
check("N47b ... at the minimal level too, and once only at the full level",
      local({ mn <- .at47("minimal", jencode(s47, s, map = "Bail=1; Parol=2; Remand=3; else=NA"))
        fl <- .at47("full", jencode(s47, s, map = "Bail=1; Parol=2; Remand=3; else=NA"))
        hit <- function(x) lengths(regmatches(x, gregexpr("contained none of these map words", x, fixed = TRUE)))
        hit(mn) == 1L && hit(fl) == 1L && identical(fl, .g47a) }))
check("N47c the swept word and the absent word differing only in capitalization: the strict error's line follows the words (pinned)",
      grepl(paste0(
        "\n\nNote: 's' contained none of these map words -- nothing was encoded for them:\n",
        "  \"bail\"\n",
        "\"Bail\" differs from the map's \"bail\" only in capitalization -- matching\n",
        "is case-sensitive.\n\n",
        "Note: This call changes s47 only"),
        grab(jencode(s47, s, map = "bail=1; Parole=2; Remand=3; else=NA")), fixed = TRUE))
check("N47d alone the note stays advisory: no else rule, or an else rule that swept no word -- absent at the standard level, present at the full level",
      local({ m1 <- "Bail=1; Parole=2; Remand=3; Other=4"
        m2 <- "Bail=1; Parole=2; Remand=3; Other=4; else=NA"
        !grepl("contained none", grab(jencode(s47, s, map = m1)), fixed = TRUE) &&
          !grepl("contained none", grab(jencode(s47, s, map = m2)), fixed = TRUE) &&
          grepl("contained none of these map words", .at47("full", jencode(s47, s, map = m1)), fixed = TRUE) &&
          grepl("contained none of these map words", .at47("full", jencode(s47, s, map = m2)), fixed = TRUE) }))
check("N47e an else rule that swept only BLANK cells is not a swept word: still advisory, and at the full level the note leads as it did",
      local({ b <- data.frame(s = c("Bail", "Parole", "", " "), stringsAsFactors = FALSE)
        m <- "Bail=1; Parole=2; Other=4; else=NA"
        st <- grab(jencode(b, s, map = m)); fl <- .at47("full", jencode(b, s, map = m))
        !grepl("contained none", st, fixed = TRUE) &&
          grepl("else=NA converted 2 blank cells in 's' to missing (NA).", st, fixed = TRUE) &&
          startsWith(fl, "Note: 's' contained none of these map words") }))
check("N47f the encoded values are what they were: the level of a note changes nothing in the result",
      identical(as.numeric(unclass(quiet(jencode(s47, s, map = "Bail=1; Parol=2; Remand=3; else=NA")))),
                c(1, 1, 1, NA, NA, NA, NA, 3, 3, 3)))

# (2) ---------------------------------------------------------------------------
b47 <- data.frame(w = c("yes", "no", "", "yes", " ", "maybe", "no"),
                  stringsAsFactors = FALSE)
.g47g <- grab(.r47g <- jencode(b47, w))
check("N47g blank cells: the first offered map ends in blank=NA, the blank note's in blank=0 (both lines pinned)",
      grepl("\na map to choose the numbers:\n  b47$wR <- jencode(b47, w, map = \"maybe=1; no=2; yes=3; blank=NA\")\n\n",
            .g47g, fixed = TRUE) &&
        grepl("naming them:\n  b47$wR <- jencode(b47, w, map = \"maybe=1; no=2; yes=3; blank=0\")\n\n",
              .g47g, fixed = TRUE))
check("N47h ... and both run as printed: the first gives the automatic result, the second the blanks their own category",
      local({ o  <- .offered(.g47g)
        e1 <- new.env(parent = globalenv()); assign("b47", b47, envir = e1)
        e2 <- new.env(parent = globalenv()); assign("b47", b47, envir = e2)
        length(o) == 2L && .runs(o[[1]], e1) && .runs(o[[2]], e2) &&
          .same(get("b47", envir = e1)$wR, .r47g) &&
          identical(as.numeric(unclass(get("b47", envir = e2)$wR)), c(3, 2, 0, 3, 0, 1, 2)) }))
m47 <- data.frame(id = 1:8)
m47$MS <- haven::labelled_spss(
  c("UNKNOWN", "Married", "Single", "", "Married", "REF", "Single", " "),
  labels = c(Refused = "REF"), na_values = c("UNKNOWN", "REF"))
.g47i <- grab(.r47i <- jencode(m47, MS))
check("N47i declared missing strings AND blank cells: three offered calls, each naming both kinds, each packed within the width (pinned whole)",
      identical(.g47i, paste0(
        "Note: 'MS' was encoded alphabetically:\n",
        "  \"Married\" -> 1\n",
        "  \"Single\"  -> 2\n",
        "If these categories have a natural order (like Low/Medium/High), rerun with\n",
        "a map to choose the numbers:\n",
        "  m47$MSR <- jencode(m47, MS,\n",
        "                     map = \"Married=1; Single=2; REF=NA; UNKNOWN=NA;\n",
        "                           blank=NA\")\n\n",
        "Note: 2 cells in 'MS' holding a declared missing value (\"REF\", \"UNKNOWN\")\n",
        "were left missing (NA).\n",
        "To keep them declared, as one missing value, rerun with a map sending those\n",
        "values to missing:\n",
        "  m47$MSR <- jencode(m47, MS,\n",
        "                     map = \"Married=1; Single=2; REF=missing;\n",
        "                           UNKNOWN=missing; blank=NA\")\n\n",
        "Note: 2 blank cells in 'MS' were left missing (NA).\n",
        "To give blank cells their own category, rerun with a map naming them:\n",
        "  m47$MSR <- jencode(m47, MS,\n",
        "                     map = \"Married=1; Single=2; REF=NA; UNKNOWN=NA;\n",
        "                           blank=0\")", .rem47("m47"))))
check("N47j ... and all three run as printed (the second under a convention, which the missing token needs): automatic result; declared cells declared; blanks a category",
      local({ o  <- .offered(.g47i)
        ev <- lapply(1:3, function(i) {
          e <- new.env(parent = globalenv()); assign("m47", m47, envir = e); e })
        ok <- length(o) == 3L && .runs(o[[1]], ev[[1]]) &&
          .conv47("spss", .runs(o[[2]], ev[[2]])) && .runs(o[[3]], ev[[3]])
        ok && .same(get("m47", envir = ev[[1]])$MSR, .r47i) &&
          identical(as.numeric(unclass(get("m47", envir = ev[[2]])$MSR)),
                    c(-99, 1, 2, NA, 1, -99, 2, NA)) &&
          identical(attr(get("m47", envir = ev[[2]])$MSR, "na_values"), -99) &&
          identical(as.numeric(unclass(get("m47", envir = ev[[3]])$MSR)),
                    c(NA, 1, 2, 0, 1, NA, 2, 0)) }))
check("N47k control: a variable with neither blank cells nor declared strings is offered the numbering alone, as before",
      grepl("  tdat$StatusR <- jencode(tdat, Status, map = \"Bail=1; Parole=2; Remand=3\")\n", g_auto, fixed = TRUE) &&
        !grepl("=NA", g_auto, fixed = TRUE))
check("N47l the packer counts the closing quote and parenthesis: no offered line passes the width, and a map's second line sits six columns right of \"map\", never under it",
      local({ ln   <- unlist(strsplit(c(.g47g, .g47i), "\n", fixed = TRUE))
        ind  <- function(x) nchar(x) - nchar(sub("^ +", "", x))
        i    <- grep("^ +map = \"", ln)
        open <- i[!grepl("\"\\)$", ln[i])]          # a map that runs on
        !any(nchar(ln) > .pin_width) && length(open) == 3L &&
          all(ind(ln[open + 1L]) == ind(ln[open]) + 6L) &&
          all(grepl("\"\\)$", ln[open + 1L])) }))
check("N47m the packer by its unit: a last rule that fits only without the closing two characters goes to the next line (it made a line of 77 or 78)",
      local({ mk <- function(n) .jst_jencode_map_call("d", "v", paste0(strrep("a", n), "=1; bb=2; cc=3"))
        w  <- vapply(18:44, function(n) max(nchar(strsplit(mk(n), "\n", fixed = TRUE)[[1]])), integer(1))
        all(w <= 76L) && sum(w == 76L) >= 3L }))

# (3) ---------------------------------------------------------------------------
n47 <- data.frame(w = c("Yes", "No", NA, "Yes", "No", "Yes"),
                  n = c("1", "2", "-99", "2", "1", "3"), stringsAsFactors = FALSE)
check("N47n the NA rule's note with no convention selected: the choose-first menu, then the remedy (pinned whole)",
      identical(grab(jencode(n47, w, map = "Yes=1; No=0; NA=-98")), paste0(
        "Note: 1 NA value in 'w' was encoded as -98.\n", .menu47,
        "Then declare -98 with jdeclare_missing() so analyses exclude it.",
        .rem47("n47"))))
check("N47o ... and the face-value note (pinned from the note's head to the reminder)",
      grepl(paste0(
        "\n\nNote: -99 in 'n' looks like a coded missing value.\n", .menu47,
        "Then declare -99 with jdeclare_missing() so analyses exclude it.\n\n",
        "Note: This call changes n47 only"), grab(jencode(n47, n)), fixed = TRUE))
check("N47p under each convention both notes are as they were: one remedy sentence, no menu",
      all(vapply(c("spss", "stata", "sas"), function(cv) .conv47(cv, {
        a <- grab(jencode(n47, w, map = "Yes=1; No=0; NA=-98"))
        b <- grab(jencode(n47, n))
        identical(a, paste0("Note: 1 NA value in 'w' was encoded as -98.\n",
                            "Declare -98 with jdeclare_missing() so analyses exclude it.",
                            .rem47("n47"))) &&
          grepl("looks like a coded missing value.\nDeclare -99 with jdeclare_missing() so analyses exclude it.\n\n",
                b, fixed = TRUE) &&
          !grepl("Choose one", paste(a, b), fixed = TRUE) }), logical(1))))
check("N47q the advice is true in each state: with none selected jdeclare_missing() stops at the gate, and after a menu line is run it declares",
      local({ d <- n47; d$wR <- quiet(jencode(n47, w, map = "Yes=1; No=0; NA=-98"))
        gate <- grab(jdeclare_missing(d, wR, codes = c(-98)))
        ln   <- strsplit(.menu47, "\n", fixed = TRUE)[[1]]
        ln   <- trimws(ln[grepl("^  joptions\\(", ln)])
        ok <- grepl("no missing-value convention is selected", gate, fixed = TRUE) &&
          length(ln) == 3L &&
          all(vapply(ln, function(l) {
            old <- getOption(".jst_options_missing_convention")
            on.exit(options(.jst_options_missing_convention = old), add = TRUE)
            suppressMessages(utils::capture.output(eval(parse(text = l))))
            r <- suppressMessages(utils::capture.output(
              o <- jdeclare_missing(d, wR, codes = c(-98))))
            sum(is.na(as.numeric(unclass(o$wR))) |
                  as.numeric(unclass(o$wR)) %in% attr(o$wR, "na_values")) == 1L
          }, logical(1)))
        ok && is.null(getOption(".jst_options_missing_convention")) }))

# (4) ---------------------------------------------------------------------------
l47 <- list(d = data.frame(w = c("Yes", "No", "Refused", "Yes", "No", "Yes", "No", "Yes"),
                           stringsAsFactors = FALSE))
.g47r <- .conv47("spss", grab(jencode(l47$d, w, map = "Yes=1; No=0; Refused=-99")))
check("N47r a place given as the data: the declaration line is the assignment form, with no modify = TRUE (pinned)",
      grepl(paste0(
        "Or declare -99 as missing on the encoded variable:\n",
        "  l47$d$wR <- jencode(l47$d, w, map = \"Yes=1; No=0; Refused=-99\")\n",
        "  l47$d <- jdeclare_missing(l47$d, wR, codes = c(-99))\n\n"), .g47r, fixed = TRUE) &&
        !grepl("modify = TRUE", .g47r, fixed = TRUE))
check("N47s ... and the pair runs as printed and declares -99 on the place; a name keeps its modify = TRUE line, which runs too",
      local({ ln <- strsplit(.g47r, "\n", fixed = TRUE)[[1]]
        i  <- grep("^Or declare -99 as missing", ln)
        e  <- new.env(parent = globalenv()); assign("l47", l47, envir = e)
        ok1 <- .conv47("spss", .runs(ln[i + 1L], e) && .runs(ln[i + 2L], e)) &&
          identical(attr(get("l47", envir = e)$d$wR, "na_values"), -99)
        d47 <- l47$d
        g   <- .conv47("spss", grab(jencode(d47, w, map = "Yes=1; No=0; Refused=-99")))
        ln2 <- strsplit(g, "\n", fixed = TRUE)[[1]]
        j   <- grep("^Or declare -99 as missing", ln2)
        e2  <- new.env(parent = globalenv()); assign("d47", d47, envir = e2)
        ok1 && identical(ln2[j + 2L], "  jdeclare_missing(d47, wR, codes = c(-99), modify = TRUE)") &&
          .conv47("spss", .runs(ln2[j + 1L], e2) && .runs(ln2[j + 2L], e2)) &&
          identical(attr(get("d47", envir = e2)$wR, "na_values"), -99) }))
rm(list = intersect(c("s47", "b47", "m47", "n47", "l47", ".g47a", ".g47g", ".r47g",
                      ".g47i", ".r47i", ".g47r", ".rem47", ".menu47", ".at47", ".conv47"),
                    ls(all.names = TRUE)))

# --- Restore session state ---------------------------------------------------
# Placed ABOVE the verdict so a failing run still leaves the session clean.

options(.jst_options_message_width = .entry_message_width)
options(.jst_output_level = .entry_output_level)
options(.jst_output_toggles = .entry_output_toggles)
options(.jst_default_data = .entry_default_data)
options(.jst_options_missing_convention = .entry_convention)

# --- Verdict -----------------------------------------------------------------

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
