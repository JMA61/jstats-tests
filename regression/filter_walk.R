# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# filter_walk.R -- walkthrough of the filter-validation surface (S289, S290,
#                  S330, S331, S338)
# TYPE:     visual walkthrough (Expected comments; written for Jeff's checking)
# PENDING:  none
# LOCKS:    what each guided filter error LOOKS like, rendered once apiece:
#           the set-time syntax errors (single =; NOT(...) in the Rule AD
#           shape), the set-time dry-run refusals (single value, numeric,
#           text, wrong count, the unchanged-filter line -- all with the
#           S290 plain-verb leads "is a single value" / "is numeric" / "is
#           text" / "has 3 values for 12 rows" -- and the bare numeric
#           name with its own three-line message), the per-call subset =
#           errors (shape, and
#           since S290 the same two syntax errors in the subset = form), a
#           bare TRUE/FALSE column accepted on both routes, the real xor()
#           accepted, the stored filter that went stale (both exits), the
#           per-frame grammar (jsubset(d, off / on / NULL), leading-comma
#           forms, clear.all), since S330 a filter that cannot be applied
#           STOPPING when set (B8-B10) and when used (D5, D9, D11), a stored
#           jcomplete() whose variable has left the frame stopping too
#           (D10), and a condition naming the frame with no default (C4);
#           since S331 a stale setting that on refuses to turn back on (C5,
#           C7), the status displays and the overview saying a setting
#           cannot be applied (C5-C8), the preview of a stale jcomplete()
#           stopping (C7), and a vector holding one value per case behind
#           jcomplete() or a stored filter, with the line that adds it to
#           the frame (D12-D14); since S338 a fix line that keeps the
#           data frame the call named (A2, A5), off, on or NULL typed with
#           a condition refused with both calls (C9), jfreq()'s title above
#           a subset = stop (D2), and "unused input" in number (E3);
#           and Part E, the named-item detector: a
#           top-level single = in jsubset() and in a variable list, the
#           misspelled-input case it is told apart from, and the no-subset
#           form. filter_check.R asserts the same surface; this file shows it.
# ORIGIN:   S289 (design S284 / S288; code S289 v0.9.163); Sections A4-A6,
#           D6-D8 and Part E (E1-E4), the A1 rewrite and the Under40 fixture
#           column S290 (v0.9.164); B8 and D5 flipped, B9, B10, C4 and
#           D9-D11 added S330 (v0.9.206); C5-C8 and D12-D14 added S331
#           (v0.9.207); C9 added, A2 A5 D2 E3 re-pinned S338 (v0.9.212)
# S348 EDIT (v0.9.221): PART F ADDED, one section -- 43 sections -> 44.
#           Ruling R12 (Jeff, S345): under a juse() default, a name the
#           default frame has is the frame's variable in jdesc(), jfreq()
#           and jscreen(), and a second line under "Using default data
#           frame" says so when a separate vector of that name exists. F1's
#           three Expected blocks FILLED BY RUNNING the file (fill.R), with
#           #@SKIP after the two juse() calls. No existing Expected moved (a
#           capture of every section on 0.9.220 and 0.9.221). The human
#           half of filter_check.R section U.
# LAST VERIFIED: v0.9.221, 2026-10-10 (S348) -- F1 WALKED on the WORKSTATION
#           by Jeff through receive_all(), its closing block's walk line as
#           the tool's default leaves it; PENDING back to none; GitHub
#           2a49208. Sandbox: every Expected block under rewalk() as in a
#           straight run (harness.R verify).
# S338 EDIT (v0.9.212): C9 ADDED; A2, A5, D2 AND E3 RE-PINNED -- 42 sections
#           -> 43. Fix Slate 1. A2 and A5: the corrected call keeps the data
#           frame the call named (one line each). C9, new: off, on or NULL
#           typed with a condition -- three calls, each refused with the call
#           that sets the filter and the call that acts on the stored one. D2:
#           "Frequencies" above the stop (one line added). E3: "unused input"
#           (one word). C9's Expected block was filled from the harness's
#           capture of the section, which halts on an uncaught error; the 42
#           others were found in the same run. C9 needs no earlier section
#           (derived by running; the five NEEDS lines are unchanged).
# S346 EDIT (no package change): the header's note that the console drops
#           the message stream's blank lines removed, found false at S345
#           (format_walk.R's the same, at S346). No section changed.
# LAST VERIFIED: v0.9.212, 2026-10-05 (S338) -- A2, A5, C9, D2 and E3 WALKED
#           on the WORKSTATION through rewalk("filter") (Jeff: "both walks are
#           clean"), GitHub e22427a, after the SANDBOX run (R 4.3.3, UTF-8
#           locale): 43 of 43 Expected blocks found in the capture, and every
#           section through rewalk() in file order, reverse order and
#           shuffled, and by prepare = TRUE, plain and under the
#           RStudio-handler stand-in.
# S331 EDIT (v0.9.207): C5, C6, C7, C8, D12, D13 AND D14 ADDED -- 35
#           sections -> 42. The two S330 reactivation items and Jeff's two
#           S331 riders. C5: jsubset(d, on) refused for a filter whose
#           object is gone -- "The filter stays off." and the delete exit
#           alone -- and the status display's second line. C6: the status
#           display for a filter that is ON (the third line: analyses will
#           stop), and on typed for it (both exits). C7: jcomplete(kc, on)
#           refused, the status line naming the variable, the preview
#           stopping. C8: the same setting while it is on, and the
#           overview's tag. D12: a stored filter on a one-value-per-case
#           vector behind an active jcomplete() -- the cause, the line that
#           adds the vector to the frame, and the analysis after it. D13:
#           the same filter refused when set. D14: subset = with such a
#           vector behind a stored filter. The seven Expected blocks were
#           filled by a builder that runs the code above each block and
#           HALTS on an uncaught error; the 35 others were found unchanged
#           in the same run. No existing section moves.
# LAST VERIFIED: v0.9.207 PENDING, 2026-10-03 (S331) -- sourced end to end
#           in the SANDBOX (R 4.3.3, UTF-8 locale; end marker reached), 42
#           of 42 Expected blocks found in the capture; against the
#           0.9.206 build the same file finds 35. WORKSTATION walk of C5,
#           C6, C7, C8, D12, D13 and D14 PENDING.
# S330 EDIT (v0.9.206): B8 AND D5 FLIPPED; B9, B10, C4, D9, D10 AND D11
#           ADDED -- 29 sections -> 35. Jeff's S329 rulings, made walking
#           D5, and the two S324 partners. B8 showed an evaluation failure
#           stored in silence; it shows the set-time refusal for a name
#           that is not found. D5 showed the warning and an analysis of
#           every row; it shows the stop, in D4's form. New: B9 (any other
#           error when set: "R reported:"), B10 (a workspace vector that
#           would be recycled), C4 (a condition naming the frame, with no
#           default), D9 (a stored filter that stops for another reason),
#           D10 (a stored jcomplete() whose variable has left the frame),
#           D11 (B10's message in the subset = form). The eight Expected
#           blocks were filled by a builder that runs the code above each
#           block and HALTS on an uncaught error; the 27 others were
#           found unchanged in the same run.
# LAST VERIFIED: v0.9.206, 2026-10-03 (S330) -- B8, B9, B10, C4, D5, D9,
#           D10 and D11 WALKED on the WORKSTATION (Jeff: "walk is done, no
#           problems"), after the SANDBOX run (R 4.3.3, UTF-8 locale; 35
#           of 35 Expected blocks found; 26 against the 0.9.205 build).
#           Restamped from PENDING at S331.
# S328 EDIT (v0.9.204): THE LEAN. The jdesc tables in D4 (both tables), D5
#           and D8 re-pinned (three Expected blocks, six lines): where a
#           value or a header cannot be centered exactly the odd space
#           goes on the LEFT now, in every table (Jeff, S328), so the
#           two-digit Min and Max, the two-digit counts under Total and
#           Non_missing and the "SD" header sit one place right of where
#           they did. Nothing this file is about changed. Taken from an
#           ordered diff of this file's own output on the 0.9.203 and
#           0.9.204 builds; every Expected then found as a contiguous run
#           in the new capture (29 of 29; the S326 file 26).
# LAST VERIFIED: v0.9.204 PENDING, 2026-10-02 (S328) -- sourced end to end
#           in the SANDBOX (R 4.3.3, UTF-8 locale; end marker reached);
#           WORKSTATION walk of D4, D5 and D8 PENDING (they were pending
#           from S326 as well: one walk now covers both edits).
# S326 EDIT (v0.9.202): the jdesc tables in D4 (the second block), D5 and
#           D8 re-pinned for the number-format rule: Mean and SD print to
#           the digits setting with trailing zeros kept (42.8 -> 42.800,
#           31.4 -> 31.400), so the Mean column widens and both headers
#           re-center; Min and Max are unchanged. Taken from an ordered diff
#           of this file's own output on the 0.9.201 and 0.9.202 masters
#           (three changed blocks, every one a jdesc table) applied wherever
#           pinned, nine lines in all. Every Expected block then found in
#           the new output (29 of 29); the S316 file against the same output
#           finds 26 -- the checker discriminates. Nothing else moves.
# LAST VERIFIED: v0.9.202 PENDING, 2026-10-01 (S326) -- sourced end to end
#           in the SANDBOX (end marker reached), every Expected block found
#           in a sink() capture; WORKSTATION walk PENDING. Prior:
# S316 EDIT (v0.9.192): the jdesc descriptive tables in D4 (both blocks),
#           D5 and D8 re-pinned for the form jdesc's tables take at
#           v0.9.192 -- headers centered over their columns, counts
#           block-centered under Total and Non_missing, no line ending in
#           padding. Taken from an ordered diff of this file's own output on
#           the 0.9.191 and 0.9.192 masters (six distinct changed lines,
#           every one a jdesc table line) applied wherever pinned, eight
#           pinned lines in all. Every Expected block then found in the new
#           output (29 of 29); the S312 file against the same output finds
#           26 -- the checker discriminates. Nothing else in the file moves.
# LAST VERIFIED: v0.9.192 PENDING, 2026-09-27 (S316) -- sourced end to end
#           in the SANDBOX (end marker reached); WORKSTATION walk PENDING.
#           Prior:
# S312 EDIT (v0.9.184): two Expecteds re-pinned (the keep12 == TRUE
#           jsubset() block and the Under40 subset = block). Each fixture
#           condition is NA for one case, and a jsubset() / subset = row now
#           carries "(k missing)" after its expression when the condition
#           evaluated to NA for k cases (the CPS filter accounting;
#           cps_walk.R Part I shows it). The row and the rule beneath it
#           change; nothing else in the file does (the S294 file rendered
#           on the new master differs on exactly those four lines).
# LAST VERIFIED: v0.9.184, 2026-09-24 (S312) -- the two re-pinned blocks
#           byte-compared against a sink() capture in the SANDBOX;
#           WORKSTATION walk PENDING. Prior:
# LAST VERIFIED: v0.9.167, 2026-09-14 (S294) -- WALKED on the WORKSTATION,
#           all 29 sections matching, end marker reached. Two edits this
#           session: the D4 and D5 CPS rows re-pinned to the S293 row label
#           ("jsubset()" -- stale since S293, when the re-pin was deferred
#           to ride with S289 stage 2), both confirmed live in this walk;
#           and the Setup reset line moved to the clear.all = TRUE forms
#           (S294: a bare jsubset(NULL) / jcomplete(NULL) now clears only
#           the default frame).
#           Prior: v0.9.164, 2026-09-13 (S290) -- WALKED on the WORKSTATION
#           (source(echo = TRUE) on the received final S290 master), all
#           29 sections matching, end marker reached; reviewed against the
#           Expecteds by Claude section by section. Built in the SANDBOX
#           (R 4.3.3, source()'d, ::: shimmed): all 29 sections re-run
#           against their own Expected; 6 of the 18 S289 Expecteds
#           unchanged on the S290 master (A1 B1-B7 D1-D4 recaptured after
#           the shape check's messages were redrafted on Jeff's review:
#           the bare-name case given its own message, the "gives <what>"
#           leads replaced by plain verbs) and the 11 new ones captured
#           mechanically (the builder halts on any error a section lets
#           escape, per the S289 D5 lesson). Expecteds are sink() captures
#           at 76.
# RUN:      line-by-line first (read each block of output before moving on).
#           Also source()-safe: every deliberate error is wrapped in
#           caught(), which prints the message after "Caught: ". Under
#           source(), run WITH echo = TRUE, per the conventions file.
#           An UNwrapped error under a plain try() prints "Error : " with a
#           space -- that spacing is the wrapper, not a message defect.
#           By section: source walk_tools.R, then rewalk("filter") shows the
#           sections the PENDING line names and rewalk("filter", "A1") shows
#           one, each from a fresh Setup and its NEEDS. Add prepare = TRUE to
#           run only what the section needs and step through it by hand.
# SECTIONS: NOT independent within a Part -- Parts B, C and D set state and
#           clear it a section or two later; run a Part whole.
# FIXTURE:  built INLINE (twelve rows, one NA, one haven-labelled column);
#           no dataset is loaded, so the file runs identically anywhere.
# ENDING:   the file MUST end with the executable end-marker line at the foot
#           (not with comments) -- see the note down there for why.
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# --- Setup -------------------------------------------------------------------

# jstats must be loaded already: devtools::load_all() (development) OR
# library(jstats) (installed) -- never both in one session.
stopifnot(exists("jload", mode = "function"))

# Session state to hand back at the foot (record / force / restore, S253).
.entry_message_width <- getOption(".jst_options_message_width")
.entry_default_data  <- getOption(".jst_default_data")
.entry_warn          <- getOption("warn")

# Message-width pin (S253): every Expected below was captured at 76.
options(.jst_options_message_width = 76L)

# warn = 1 (conventions file, rule 4, S248): a source() run would otherwise
# defer a warning to the foot of the file, hundreds of lines from the output
# it belongs to. No section warns by design since S330 (D5's warning became
# a stop); kept so that an unexpected one shows where it is raised. Changes
# nothing for a line-by-line run.
options(warn = 1)

# Neutral pipeline state (never assume the prior state is clean).
jsubset(clear.all = TRUE); jcomplete(clear.all = TRUE); joutput(NULL)
jdummy(clear.all = TRUE)
juse(NULL)

# The fixture. Age has one NA (row 8); Keep01 is a 0/1 indicator with six 1s;
# Condition is haven-labelled; Under40 is logical (five TRUE, six FALSE, one NA).
d <- data.frame(
  Name   = c("Ann", "bob", "Al", "Cy", "Abe", "Di",
             "Ed", "Flo", "Gus", "Hal", "Ivy", "Jo"),
  Age    = c(30, 45, 50, 38, 62, 27, 41, NA, 55, 33, 48, 29),
  Keep01 = c(1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0),
  Gender = c(1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2),
  stringsAsFactors = FALSE
)
d$Condition <- haven::labelled(c(1L, 2L, 1L, 3L, 2L, 1L,
                                 3L, 2L, 1L, 2L, 3L, 1L),
                               c(A = 1L, B = 2L, C = 3L))
d$Under40 <- d$Age < 40                  # a genuine TRUE/FALSE column (S290)

# caught(): run a call that is EXPECTED to error and print the message after
# "Caught: ", so source() survives it and the Expected can show the text.
caught <- function(expr) {
  tryCatch(expr, error = function(e) cat("Caught: ", conditionMessage(e),
                                          "\n", sep = ""))
}


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART A -- SET-TIME SYNTAX ERRORS (.jst_check_filter_syntax) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION A1 -- a bare NUMERIC name reaches the dry run (S290) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Before S290 the syntax check refused any lone name as "a variable name, not
# a condition". That branch is gone: the name is judged by what it produces,
# so a numeric column is refused by the dry run -- with a message that, since
# S290, mirrors the single-= error (A2): the mistake, the two equals signs,
# the corrected call, and nothing about what the variable holds. The earlier
# "Gender gives numbers" lead read as a non sequitur to the FILTER BY user it
# is for.

caught(jsubset(d, Gender))

# Expected:
#   Caught: jsubset(): Gender on its own is a variable name, which does not
#   select rows in R.
#   Use == (two equals signs) to compare it to a value:
#     jsubset(d, Gender == 1)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION A2 -- a single = inside parentheses (the form R's parser lets ----
#               through)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The corrected call is built from what was typed: each operator = becomes ==,
# nothing else moves. Without the check this would run as 1 & (Age < 40) and
# silently drop the Gender test.
# S338: the corrected call keeps the data frame the call named. It read
# jsubset((Gender == 1) & (Age < 40)), which with no juse() default is a
# call that cannot run; A1's line already kept the frame.

caught(jsubset(d, (Gender = 1) & (Age < 40)))

# Expected:
#   Caught: jsubset(): (Gender = 1) & (Age < 40) uses a single =, which does not
#   test equality in R.
#   Use == (two equals signs):
#     jsubset(d, (Gender == 1) & (Age < 40))


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION A3 -- the S288 third face: a named argument no longer false-fires ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Before S289 this call errored with the single-= message (reproduced on the
# workstation S289). It is a legitimate filter and now activates.

jsubset(d, grepl("^A", Name, ignore.case = TRUE))
jsubset(d, NULL)

# Expected:
#   jsubset activated for d: grepl("^A", Name, ignore.case = TRUE)
#   jsubset cleared for d (had: grepl("^A", Name, ignore.case = TRUE)).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION A4 -- a bare LOGICAL column is a valid filter and is ACCEPTED ----
#               (S290)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The same call the removed branch used to refuse. Under40 is TRUE/FALSE for
# every row, which is all a filter needs to be.

jsubset(d, Under40)
jsubset(d, NULL)

# Expected:
#   jsubset activated for d: Under40
#   jsubset cleared for d (had: Under40).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION A5 -- NOT(...) written as in SPSS: caught, and rewritten (S290) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The message opens with what was typed (Rule AD; the old "You wrote:" tail
# and the three-line example menu are gone) and the fix is built from it:
# the keyword becomes its R operator and NOT's operand is parenthesized.
# S338: the line keeps the data frame the call named, as in A2.

caught(jsubset(d, NOT(Age < 40)))

# Expected:
#   Caught: jsubset(): NOT(Age < 40) uses NOT, which R does not recognize.
#   Use ! (exclamation mark):
#     jsubset(d, !(Age < 40))


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION A6 -- the real xor() is accepted (S290; it was refused before, ----
#               with a message recommending xor())
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

jsubset(d, xor(Age < 40, Gender == 1))
jsubset(d, NULL)

# Expected:
#   jsubset activated for d: xor(Age < 40, Gender == 1)
#   jsubset cleared for d (had: xor(Age < 40, Gender == 1)).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART B -- THE SET-TIME DRY RUN (jsubset() runs the filter once) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION B1 -- TRUE: a single value cannot select rows ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# No parenthetical when the expression IS the literal.

caught(jsubset(d, TRUE))

# Expected:
#   Caught: jsubset(): TRUE is a single value, not one TRUE or FALSE for
#   every row.
#   Compare a variable to a value, for example:
#     jsubset(Age < 40)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION B2 -- T: no longer exempt, and refused as a single value, not as ----
#               a "variable name"
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

caught(jsubset(d, T))

# Expected:
#   Caught: jsubset(): T is a single value (TRUE), not one TRUE or FALSE for
#   every row.
#   Compare a variable to a value, for example:
#     jsubset(Age < 40)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION B3 -- an aggregate inside a filter: the computed value is shown ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

caught(jsubset(d, mean(Age, na.rm = TRUE) > 40))

# Expected:
#   Caught: jsubset(): mean(Age, na.rm = TRUE) > 40 is a single value (TRUE),
#   not one TRUE or FALSE for every row.
#   Compare a variable to a value, for example:
#     jsubset(Age < 40)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION B4 -- numeric (an arithmetic expression) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

caught(jsubset(d, Keep01 * 1))

# Expected:
#   Caught: jsubset(): Keep01 * 1 is numeric, not one TRUE or FALSE for
#   every row.
#   Compare a variable to a value, for example:
#     jsubset(Age < 40)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION B5 -- a reset typed with quotes (the S284 face (a)) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

caught(jsubset(d, "null"))

# Expected:
#   Caught: jsubset(): "null" is text, not one TRUE or FALSE for every row.
#   To clear the filter, use NULL without quotes:
#     jsubset(d, NULL)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION B6 -- the wrong number of values (an outside object of length 3) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

keep3 <- c(TRUE, FALSE, TRUE)
caught(jsubset(d, keep3 == TRUE))

# Expected:
#   Caught: jsubset(): keep3 == TRUE has 3 values for 12 rows, not one TRUE or
#   FALSE for every row.
#   Build the filter from the data frame's own columns, for example:
#     jsubset(Age < 40)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION B7 -- with an earlier filter in place: refused, and the earlier ----
#               one is reported unchanged
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

jsubset(d, Age < 40)
caught(jsubset(d, TRUE))
jsubset()

# Expected:
#   jsubset activated for d: Age < 40
#   Caught: jsubset(): TRUE is a single value, not one TRUE or FALSE for
#   every row.
#   Compare a variable to a value, for example:
#     jsubset(Age < 40)
#   Your earlier filter for the d data frame is unchanged.
#   jsubset active for d: Age < 40


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION B8 -- a filter naming something that is not found is REFUSED when ----
#               set (S330; it was stored, and reported "activated")
# NEEDS: B7
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# A misspelled variable. Until S330 the dry run swallowed the error and the
# filter was stored; every analysis then warned and ran on every row (D5).
# The message names what was typed, the name and the frame; B7's filter is
# still in place, so the unchanged line shows as well.

caught(jsubset(d, Agee > 30))
jsubset(d, NULL)

# Expected:
#   Caught: jsubset(): Agee > 30 names Agee, which was not found in the d
#   data frame.
#   Check the spelling.
#   Your earlier filter for the d data frame is unchanged.
#   jsubset cleared for d (had: Age < 40).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION B9 -- a filter that stops for any other reason is refused too, ----
#               with R's own message (S330)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Nothing is "not found" here, so the message claims nothing of the kind: it
# says the filter cannot be applied and relays what R reported.

lim <- function() stop("the limit file is not loaded")
caught(jsubset(d, Age > lim()))

# Expected:
#   Caught: jsubset(): Age > lim() cannot be applied to the d data frame.
#   R reported:
#     the limit file is not loaded


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION B10 -- a workspace vector that would be recycled is refused ----
#                (S330)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Five values against twelve cases: R would repeat the five (30, 40, 50, 60,
# 70, 30, 40, ...) and compare case by case -- with a warning here, with none
# at all when the row count divides by the length. The wording is the S324
# formula message's.

v5 <- c(30, 40, 50, 60, 70)
caught(jsubset(d, Age > v5))

# Expected:
#   Caught: jsubset(): In Age > v5, v5 has 5 values for the 12 cases in the d
#   data frame.
#   Use a single value, or one value for each case.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART C -- THE GRAMMAR ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION C1 -- per-frame off / on / NULL ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

jsubset(d, Age < 40)
jsubset(d, off)
jsubset(d, on)
jsubset(d, NULL)
jsubset(d, NULL)

# Expected:
#   jsubset activated for d: Age < 40
#   jsubset deactivated for d.
#   jsubset reactivated for d: Age < 40
#   jsubset cleared for d (had: Age < 40).
#   No jsubset set for d. Nothing to clear.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION C2 -- two frames: named off leaves the other alone; clear.all ----
#               clears both
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

e <- d
jsubset(d, Age < 40)
jsubset(e, Gender == 1)
jsubset(d, off)
jsubset()
jsubset(clear.all = TRUE)

# Expected:
#   jsubset activated for d: Age < 40
#   jsubset activated for e: Gender == 1
#   jsubset deactivated for d.
#   jsubset settings (2 data frames):
#     - d: Age < 40  [inactive]
#     - e: Gender == 1  [active]
#   jsubset cleared (2 data frames):
#     - d (had: Age < 40)
#     - e (had: Gender == 1)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION C3 -- the leading-comma forms reach the default frame (tolerated, ----
#               not advertised)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

juse(d)
jsubset(Age < 40)
jsubset(, off)
jsubset(, on)
jsubset(, NULL)
juse(NULL)

# Expected:
#   Default data frame set to: d
#   jsubset activated for d: Age < 40
#   jsubset deactivated for d.
#   jsubset reactivated for d: Age < 40
#   jsubset cleared for d (had: Age < 40).
#   Default data frame cleared.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION C4 -- a condition naming the frame, typed where the frame goes, ----
#               with no juse() default (S330)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Before S330: "'d$Age > 40' not found. Did you mean to use it as a variable
# name?", with a suggested call that named the frame twice. With a default
# set, the same input has had the S323 refusal since v0.9.200.

caught(jsubset(d$Age > 40))

# Expected:
#   Caught: jsubset(): d$Age > 40 names the d data frame.
#   Name the data frame first, and the variable on its own:
#     jsubset(d, Age > 40)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION C5 -- on checks the filter before turning it back on (S331; it ----
#               printed "reactivated", and the next analysis stopped)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The object the filter names is removed while the filter is off. The filter
# is off already, so the message says it stays off and gives the delete exit
# alone -- "set it aside" would name the state it is in. The status display
# then says the same thing in a line of its own.

keepc <- d$Age > 35
jsubset(d, keepc == TRUE)
jsubset(d, off)
rm(keepc)
caught(jsubset(d, on))
jsubset()
jsubset(d, NULL)

# Expected:
#   jsubset activated for d: keepc == TRUE
#   jsubset deactivated for d.
#   Caught: jsubset(): the jsubset filter for the d data frame, keepc == TRUE,
#   cannot be applied: keepc no longer exists.
#   The filter stays off.
#   To delete it, run:
#     jsubset(d, NULL)
#   jsubset set but inactive for d: keepc == TRUE
#   It cannot be applied: keepc no longer exists.
#   jsubset cleared for d (had: keepc == TRUE).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION C6 -- the status display for a filter that is ON and cannot be ----
#               applied; on typed for it (S331)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The filter was never turned off. It stays active on purpose -- jstats does
# not widen the sample on its own -- so the status display adds what follows:
# analyses of the frame stop. on, typed here, is the analysis-time stop
# exactly, with both exits.

keepc <- d$Age > 35
jsubset(d, keepc == TRUE)
rm(keepc)
jsubset()
caught(jsubset(d, on))
jsubset(d, NULL)

# Expected:
#   jsubset activated for d: keepc == TRUE
#   jsubset active for d: keepc == TRUE
#   It cannot be applied: keepc no longer exists.
#   Analyses of the d data frame will stop until it is turned off,
#   deleted or fixed.
#   Caught: jsubset(): the jsubset filter for the d data frame, keepc == TRUE,
#   cannot be applied: keepc no longer exists.
#   To set it aside, run:
#     jsubset(d, off)
#   To delete it, run:
#     jsubset(d, NULL)
#   jsubset cleared for d (had: keepc == TRUE).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION C7 -- jcomplete(): on, the status line and the preview for a ----
#               setting whose variable has left the frame (S331)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Until S331 on printed "reactivated", the status line counted complete cases
# on the variables that remained, and the preview showed the rows those would
# drop. on is refused and the setting stays off; the status line names the
# variable in place of a count; the preview is the analysis-time stop.

kc <- d
kc$Tmp <- c(NA, 2:12)
jcomplete(kc, Age, Tmp)
jcomplete(kc, off)
kc$Tmp <- NULL
caught(jcomplete(kc, on))
jcomplete()
caught(jcomplete(console = TRUE))
jcomplete(kc, NULL)

# Expected:
#   Listwise Case Filter
#   Variable   N  Missing  % Missing
#   --------  --  -------  ---------
#   Age       12     1        8.3%
#   Tmp       12     1        8.3%
#
#     Complete cases: 10 of 12 (83.3%)
#     Listwise filter activated -- 2 cases will be excluded from
#     subsequent analyses.
#   jcomplete deactivated for kc.
#   Caught: jcomplete(): the jcomplete setting for the kc data frame names Tmp,
#   which the data frame no longer has.
#   The setting stays off.
#   Run jcomplete() again with the current variable names, or clear the setting:
#     jcomplete(kc, NULL)
#   jcomplete set but inactive for kc: Age, Tmp
#   It cannot be applied: the kc data frame no longer has Tmp.
#   Caught: jcomplete(): the jcomplete setting for the kc data frame names Tmp,
#   which the data frame no longer has.
#   Run jcomplete() again with the current variable names, or clear the setting:
#     jcomplete(kc, NULL)
#   jcomplete cleared for kc (had: Age, Tmp).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION C8 -- the same setting while it is ON: the status line, and with ----
#               a second frame the overview's tag (S331)
# NEEDS: C2, C7
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# e is the second frame from C2. Its setting can be applied, so only kc's
# line is tagged.

kc$Tmp <- c(NA, 2:12)
jcomplete(kc, Age, Tmp)
kc$Tmp <- NULL
jcomplete()
jcomplete(e, Age)
jcomplete()
jcomplete(clear.all = TRUE)

# Expected:
#   Listwise Case Filter
#   Variable   N  Missing  % Missing
#   --------  --  -------  ---------
#   Age       12     1        8.3%
#   Tmp       12     1        8.3%
#
#     Complete cases: 10 of 12 (83.3%)
#     Listwise filter activated -- 2 cases will be excluded from
#     subsequent analyses.
#   jcomplete active for kc: Age, Tmp
#   It cannot be applied: the kc data frame no longer has Tmp.
#   Analyses of the kc data frame will stop until it is turned off, cleared or
#   set again.
#   Listwise Case Filter
#   Variable   N  Missing  % Missing
#   --------  --  -------  ---------
#   Age       12     1        8.3%
#
#     Complete cases: 11 of 12 (91.7%)
#     Listwise filter activated -- 1 case will be excluded from
#     subsequent analyses.
#   jcomplete settings (2 data frames):
#     - kc: Age, Tmp  [active, cannot be applied]
#     - e: Age  [active]
#   jcomplete cleared (2 data frames):
#     - kc (had: Age, Tmp)
#     - e (had: Age)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION C9 -- off, on or NULL typed with a condition is refused, with ----
#               both calls (S338)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# off, on and NULL act on the filter a data frame already has, and take no
# condition. Before S338 the third input landed in clear.all: R answered
# "object 'on' not found" for the first call below, and jstats said
# "`clear.all` must be TRUE or FALSE" for the third. What was meant cannot be
# told from the call -- set this filter, or act on the stored one -- so both
# calls are given, the one that sets the filter first. The second call has
# two conditions: they are joined in the line, the | one in parentheses.

caught(jsubset(d, Age < 40, on))
caught(jsubset(d, Age < 30 | Age > 50, Gender == 1, off))
caught(jsubset(d, Age < 40, NULL))

# Expected:
#   Caught: jsubset(): on turns a stored filter back on and takes no condition.
#   Age < 40 was given with it.
#   To set the filter, run:
#     jsubset(d, Age < 40)
#   To turn the stored filter back on, run:
#     jsubset(d, on)
#   Caught: jsubset(): off turns a stored filter off and takes no condition.
#   Age < 30 | Age > 50 and Gender == 1 were given with it.
#   To set the filter, run:
#     jsubset(d, (Age < 30 | Age > 50) & Gender == 1)
#   To turn the stored filter off, run:
#     jsubset(d, off)
#   Caught: jsubset(): NULL deletes a stored filter and takes no condition.
#   Age < 40 was given with it.
#   To set the filter, run:
#     jsubset(d, Age < 40)
#   To delete the stored filter, run:
#     jsubset(d, NULL)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART D -- APPLY TIME ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION D1 -- per-call subset = on a 0/1 column (the SPSS FILTER BY ----
#               habit)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Before S289 this printed a case-processing table that added up (3 kept) over
# statistics for row 1 three times (Min = Max = Mean = 30, SD 0) -- R read the
# 1s as row positions. Reproduced on the workstation S289.
# S290: the same three-line bare-name message as A1, in the subset = shape.

caught(jdesc(d, Age, subset = Keep01))

# Expected:
#   Descriptive Statistics
#   Caught: jdesc(): subset = Keep01 on its own is a variable name, which does
#   not select rows in R.
#   Use == (two equals signs) to compare it to a value:
#     subset = Keep01 == 1


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION D2 -- per-call subset = on a haven-labelled column ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Before S289: "Can't convert <logical> to <labelled<integer>>".
# S338: the "Frequencies" title now prints above the stop, as "Descriptive
# Statistics" does in D1 -- jfreq() printed its title after the filters ran,
# so its stops alone came with no title.

caught(jfreq(d, Condition, subset = Condition))

# Expected:
#   Frequencies
#   Caught: jfreq(): subset = Condition on its own is a variable name, which
#   does not select rows in R.
#   Use == (two equals signs) to compare it to a value:
#     subset = Condition == 1


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION D3 -- per-call single value ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

caught(jdesc(d, Age, subset = TRUE))

# Expected:
#   Descriptive Statistics
#   Caught: jdesc(): subset = TRUE is a single value, not one TRUE or FALSE for
#   every row.
#   In your jdesc() call, compare a variable to a value, for example
#   subset = Age < 40.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION D4 -- a stored filter that went stale: accepted at 12 rows, ----
#               applied at 11. The error names the frame, the filter, the
#               counts and BOTH exits; the first exit is then taken.
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

s <- d
keep12 <- s$Age > 35
jsubset(s, keep12 == TRUE)
jdesc(s, Age)
s <- s[-1, ]
caught(jdesc(s, Age))
jsubset(s, off)
jdesc(s, Age)
jsubset(s, NULL)

# Expected:
#   jsubset activated for s: keep12 == TRUE
#   Descriptive Statistics
#
#   Case Processing  Excluded  Remaining
#       Original           --         12
#       jsubset()           5          7  keep12 == TRUE (1 missing)
#       Remaining N        --          7
#   ----------------------------------------------------------------
#
#   Variable  Total  Non_missing  Min  Max   Mean     SD
#   --------  -----  -----------  ---  ---  ------  -----
#   Age         7         7        38   62  48.429  8.223
#
#   Descriptive Statistics
#   Caught: jdesc(): the jsubset filter for the s data frame, keep12 == TRUE,
#   has 12 values for 11 rows.
#   A filter must give one TRUE or FALSE for every row.
#   To set it aside, run:
#     jsubset(s, off)
#   To delete it, run:
#     jsubset(s, NULL)
#   jsubset deactivated for s.
#   Descriptive Statistics
#
#   (jsubset set but inactive)
#
#   11 Cases in the 1 Variable Pool
#
#   Variable  Total  Non_missing  Min  Max   Mean     SD
#   --------  -----  -----------  ---  ---  ------  ------
#   Age         11        10       27   62  42.800  11.371
#
#   jsubset cleared for s (had: keep12 == TRUE).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION D5 -- a stored filter that cannot be EVALUATED stops (S330; it ----
#               warned, and ran on every row)
# NEEDS: D4
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The object the filter names is removed after the filter is set. Until S330
# this printed a warning and then a full analysis of all 11 cases, with a
# Case Processing row reading "jsubset()  0  11" as if the filter had run.
# Now it is D4's error: the frame, the filter, what is gone, and both exits.

keep12 <- s$Age > 35                     # rebuilt for the 11-row s (D4 left 12)
jsubset(s, keep12 == TRUE)
rm(keep12)
caught(jdesc(s, Age))
jsubset(s, NULL)

# Expected:
#   jsubset activated for s: keep12 == TRUE
#   Descriptive Statistics
#   Caught: jdesc(): the jsubset filter for the s data frame, keep12 == TRUE,
#   cannot be applied: keep12 no longer exists.
#   To set it aside, run:
#     jsubset(s, off)
#   To delete it, run:
#     jsubset(s, NULL)
#   jsubset cleared for s (had: keep12 == TRUE).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION D6 -- per-call subset = NOT(...): the syntax check now runs on ----
#               the per-call route too (S290; before: R's own "could not find
#               function NOT", wrapped)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Same message as A5, in the subset = form: the lead and the fix line show
# what the caller can actually type.

caught(jdesc(d, Age, subset = NOT(Age < 40)))

# Expected:
#   Descriptive Statistics
#   Caught: jdesc(): subset = NOT(Age < 40) uses NOT, which R does
#   not recognize.
#   Use ! (exclamation mark):
#     subset = !(Age < 40)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION D7 -- per-call subset = (Gender = 1) & (Age < 40): the ----
#               silent-wrong case (S290)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Before S290 this call RAN: R evaluated (Gender = 1) as an assignment, the
# filter became 1 & (Age < 40), and jdesc reported 5 remaining -- everyone
# under 40, both genders -- with the typed filter printed in the CPS row as
# if it had been honoured. Observed live in the sandbox at S290. Now refused.

caught(jdesc(d, Age, subset = (Gender = 1) & (Age < 40)))

# Expected:
#   Descriptive Statistics
#   Caught: jdesc(): subset = (Gender = 1) & (Age < 40) uses a single =, which
#   does not test equality in R.
#   Use == (two equals signs):
#     subset = (Gender == 1) & (Age < 40)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION D8 -- per-call subset = on a logical column: accepted (S290) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The per-call counterpart of A4. Five under 40 kept; the NA row is excluded.

jdesc(d, Age, subset = Under40)

# Expected:
#   Descriptive Statistics
#
#   Case Processing  Excluded  Remaining
#       Original           --         12
#       subset =            7          5  Under40 (1 missing)
#       Remaining N        --          5
#   ---------------------------------------------------------
#
#   Variable  Total  Non_missing  Min  Max   Mean     SD
#   --------  -----  -----------  ---  ---  ------  -----
#   Age         5         5        27   38  31.400  4.278


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION D9 -- a stored filter that stops for another reason: R's message, ----
#               and both exits (S330)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The filter ran when it was set; the function it calls stops now. Nothing
# "no longer exists", so the message says only that the filter cannot be
# applied, and what R reported.

lim <- function() 40
jsubset(d, Age > lim())
lim <- function() stop("the limit file is not loaded")
caught(jdesc(d, Age))
jsubset(d, NULL)

# Expected:
#   jsubset activated for d: Age > lim()
#   Descriptive Statistics
#   Caught: jdesc(): the jsubset filter for the d data frame, Age > lim(),
#   cannot be applied.
#   R reported:
#     the limit file is not loaded
#   To set it aside, run:
#     jsubset(d, off)
#   To delete it, run:
#     jsubset(d, NULL)
#   jsubset cleared for d (had: Age > lim()).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION D10 -- a stored jcomplete() whose variable has left the frame ----
#                stops (S330; it warned from S318, and applied the rest)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Tmp is in the setting and then dropped from the frame. Age is still there,
# and until S330 the analysis ran with listwise deletion on Age alone, behind
# a warning.

k <- d
k$Tmp <- c(NA, 2:12)
jcomplete(k, Age, Tmp)
k$Tmp <- NULL
caught(jdesc(k, Age))
jcomplete(k, NULL)

# Expected:
#   Listwise Case Filter
#   Variable   N  Missing  % Missing
#   --------  --  -------  ---------
#   Age       12     1        8.3%
#   Tmp       12     1        8.3%
#
#     Complete cases: 10 of 12 (83.3%)
#     Listwise filter activated -- 2 cases will be excluded from
#     subsequent analyses.
#   Descriptive Statistics
#   Caught: jdesc(): the jcomplete setting for the k data frame names Tmp, which
#   the data frame no longer has.
#   Run jcomplete() again with the current variable names, or clear the setting:
#     jcomplete(k, NULL)
#   jcomplete cleared for k (had: Age, Tmp).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION D11 -- per-call subset = with a vector that would be recycled ----
#                (S330)
# NEEDS: B8, B10
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# B10's message in the subset = form. Before S330 this analysis RAN, on the
# 4 cases the recycled comparison happened to keep, behind R's "longer
# object length" warning.

caught(jdesc(d, Age, subset = Age > v5))

# Expected:
#   Descriptive Statistics
#   Caught: jdesc(): In subset = Age > v5, v5 has 5 values for the 12 cases in
#   the d data frame.
#   Use a single value, or one value for each case.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION D12 -- a filter on a vector holding one value per case, behind an ----
#                active jcomplete() (S331)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# keepv has one value for each of d's twelve cases. jcomplete() on Age drops
# the case whose Age is missing, so the filter is handed eleven. Until S331
# this said "has 12 values for 11 rows", with two exits, for a frame nothing
# had been removed from. The message names the cause and gives the line that
# adds the vector to the frame, where the stored filter finds it: the same
# analysis then runs.

keepv <- d$Age > 35 | is.na(d$Age)
jsubset(d, keepv == TRUE)
jcomplete(d, Age)
caught(jdesc(d, Age))
d$keepv <- keepv
jdesc(d, Age)
d$keepv <- NULL
jsubset(d, NULL)

# Expected:
#   jsubset activated for d: keepv == TRUE
#   Listwise Case Filter
#   Variable   N  Missing  % Missing
#   --------  --  -------  ---------
#   Age       12     1        8.3%
#
#     Complete cases: 11 of 12 (91.7%)
#     Listwise filter activated -- 1 case will be excluded from
#     subsequent analyses.
#   Descriptive Statistics
#   Caught: jdesc(): the jsubset filter for the d data frame, keepv == TRUE,
#   cannot be applied: keepv has 12 values, one for each case in the d data
#   frame, but jcomplete() leaves 11.
#   Add keepv to the d data frame as a variable:
#     d$keepv <- keepv
#   Descriptive Statistics
#
#   Case Processing  Excluded  Remaining
#       Original           --         12
#       jcomplete()         1         11  Age
#       jsubset()           4          7  keepv == TRUE
#       Remaining N        --          7
#   ---------------------------------------------------
#
#   Variable  Total  Non_missing  Min  Max   Mean     SD
#   --------  -----  -----------  ---  ---  ------  -----
#   Age         7         7        38   62  48.429  8.223
#
#   jsubset cleared for d (had: keepv == TRUE).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION D13 -- the same filter SET while jcomplete() is active is refused ----
#                (S331; it reported "activated")
# NEEDS: D12
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# D12's jcomplete() is still in place.

caught(jsubset(d, keepv == TRUE))
jcomplete(d, NULL)

# Expected:
#   Caught: jsubset(): In keepv == TRUE, keepv has 12 values, one for each case
#   in the d data frame, but jcomplete() leaves 11.
#   Add keepv to the d data frame as a variable:
#     d$keepv <- keepv
#   jcomplete cleared for d (had: Age).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION D14 -- per-call subset = with such a vector, behind a stored ----
#                filter (S331)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The S330 add-it-to-the-frame message, which until S331 appeared only when
# the vector was compared with a labelled variable; compared with a plain
# one, as here, the message was "has 12 values for 6 rows".

per <- rep(c(35, 45), 6)
jsubset(d, Gender == 1)
caught(jdesc(d, Age, subset = Age >= per))
jsubset(d, NULL)

# Expected:
#   jsubset activated for d: Gender == 1
#   Descriptive Statistics
#   Caught: jdesc(): In subset = Age >= per, per has 12 values, one for each
#   case in the d data frame, but filtering leaves 6.
#   Add per to the d data frame as a variable:
#     d$per <- per
#   jsubset cleared for d (had: Gender == 1).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART E -- A NAMED ITEM IN A VARIABLE LIST (.jst_check_named_variables, ----
#           S290)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION E1 -- jsubset(Gender = 1): a top-level single = ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# R's parser turns Gender = 1 into an argument NAMED Gender before jstats
# runs. jsubset() had no ... until S290, so R itself refused the call with
# "unused argument (Gender = 1)". Now the named item lands in ... and is
# read as the condition it was meant to be.

caught(jsubset(Gender = 1))

# Expected:
#   Caught: jsubset(): Gender = 1 uses a single =, which does not test
#   equality in R.
#   Use == (two equals signs):
#     jsubset(Gender == 1)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION E2 -- jdesc(d, Age, Gender = 1): the same mistake in a variable ----
#               list
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Before S290: "Variable(s) not found in d: 1." -- the value was looked up
# as a name. Gender == 1 would not be a variable either, so the fix points
# at subset =, which jdesc has.

caught(jdesc(d, Age, Gender = 1))

# Expected:
#   Caught: jdesc(): Gender = 1 uses a single =, and the variable list takes
#   names, not conditions.
#   To select rows, use == (two equals signs) in subset =:
#     subset = Gender == 1


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION E3 -- jdesc(d, Age, digit = 2): a misspelled input, told apart by ----
#               the name
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# digit is not a column, so this is not a condition; it is digits misspelled,
# which R cannot partial-match because it sits after the variable list.
# Before S290: "Variable(s) not found in d: 2."
# S338: "unused input", in number -- it read "unused input(s)". Two of them
# read "unused inputs: digit, foo".

caught(jdesc(d, Age, digit = 2))

# Expected:
#   Caught: jdesc(): unused input: digit


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION E4 -- jsum(d, Gender = 1): a function with no subset = input ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Nothing to point at, so the fix is the variable on its own. jsum() and
# javg() compute for every row by design (they ignore filters), which is
# why the message must not suggest one.

caught(jsum(d, Gender = 1))

# Expected:
#   Caught: jsum(): Gender = 1 uses a single =, and the variable list takes
#   names, not conditions.
#   List the variable on its own:
#     Gender


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART F -- UNDER A juse() DEFAULT, THE FRAME'S VARIABLE (S348) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Ruling R12 (Jeff, S345). With a default set, a bare name the default frame
# has is the frame's variable in jdesc(), jfreq() and jscreen() -- the three
# functions that also take a single column -- as it already was in every
# other function. Through v0.9.220 those three read a separate vector of the
# same name in the workspace and said nothing: jdesc(Age) described three
# made-up values, and jdesc(Age, Gender) was refused. The assertion side is
# filter_check.R section U.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION F1 -- the frame's variable, and the line that says so ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# f1 is a twelve-case frame; Age and Gender, made in the workspace for some
# other purpose, share its variables' names.

f1 <- data.frame(Age    = c(21, 34, 45, 23, 36, 52, 41, 29, 33, 40, 38, NA),
                 Gender = c(1, 2, 1, 2, 2, 1, 1, 2, 1, 2, 2, 1))
juse(f1)
Age    <- c(1, 2, 3)
Gender <- factor(c("m", "f", "f"))
jdesc(Age)

# Expected:
#   Descriptive Statistics
#   Using default data frame: f1
#   Age is the variable in f1, not the separate object with that name.
#
#   12 Cases in the 1 Variable Pool
#
#   Variable  Total  Non_missing  Min  Max   Mean     SD
#   --------  -----  -----------  ---  ---  ------  -----
#   Age         12        11       21   52  35.636  9.146

jdesc(Age, Gender)

# Expected:
#   Descriptive Statistics
#   Using default data frame: f1
#   Age and Gender are variables in f1, not the separate objects with
#   those names.
#
#   12 Cases in the 2 Variable Pool; 11 Complete on All
#
#   Warning: Gender seems categorical. Descriptive statistics may not
#   be meaningful.
#   Variable  Total  Non_missing  Min  Max   Mean     SD
#   --------  -----  -----------  ---  ---  ------  -----
#   Age         12        11       21   52  35.636  9.146
#   Gender      12        12        1    2   1.500  0.522

juse(NULL)
jdesc(Age)

# Expected:
#   Descriptive Statistics
#
#   3 Cases in the 1 Variable Pool
#
#   Warning: Age seems categorical. Descriptive statistics may not
#   be meaningful.
#   Variable  Total  Non_missing  Min  Max   Mean    SD
#   --------  -----  -----------  ---  ---  -----  -----
#   Age         3         3        1    3   2.000  1.000

rm(f1, Age, Gender)

# Things to look at:
#   - Render 1: twelve cases, eleven with an age, from 21 to 52 -- the
#     frame's Age, not the workspace's 1, 2, 3. Under "Using default data
#     frame: f1", one line says which object was read.
#   - Render 2: both names are shared, so the line names both, in the
#     plural. Through v0.9.220 this call stopped: "Gender needs the data
#     frame, not the single column Age."
#   - Render 3: with no default there is no frame to read, so the
#     workspace vector is described, as before, and no default note.
#   - Not shown: a function, a list or a data frame sharing the name gets
#     no line (filter_check.R U08); the line prints at every output level.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Observations
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# 2026-10-05 (S338): the last note of the S289 entry below is no longer
# true. Since v0.9.212 jfreq() prints its title before the filters run, as
# jdesc() does, so D2 shows "Frequencies" above its error as D1 and D3 show
# "Descriptive Statistics".
# 2026-09-12 (S289, first workstation walk): Section D5 was DEFECTIVE in
# the first delivered version -- D4 had left s at 11 rows but keep12 at 12
# values, so D5's first line was refused by the dry run instead of storing
# the filter, the section showed nothing of the eval-failure warning its
# heading promised, and the unwrapped error would have halted a source()
# run. The builder that fills these Expecteds had recorded the error text
# AS the Expected, and the self-check passed because it compares the file
# to a re-run of the same code: a section whose CODE is wrong verifies
# against itself. Three repairs: D5 rebuilds keep12 for the 11-row frame;
# the builder now HALTS on any uncaught error rather than recording one;
# and the file gained the S248 warn = 1 rule (conventions file, walk rule
# 4), which the first version had missed and which is why D5's warning now
# renders in place. Instance of instructions
# [A-CHECK-THAT-CANNOT-FAIL-PROVES-NOTHING].
# Also real behavior, not a defect: jfreq() raises the per-call shape error
# before printing its title (D2), while jdesc() prints "Descriptive
# Statistics" first (D1, D3) -- the title is emitted at a different point
# in the two functions.


# --- Restore and end marker --------------------------------------------------
# A real statement, deliberately last: stepping through with Ctrl+Enter, RStudio
# keeps expanding the selection when only comments remain, echoing the tail of
# the file back repeatedly. Ending on executable code gives it somewhere to
# stop.

options(.jst_options_message_width = .entry_message_width)
options(.jst_default_data = .entry_default_data)
options(warn = .entry_warn)
cat("\n--- End of filter_walk.R ---\n")
