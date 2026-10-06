# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# jencode_walk.R -- visual walkthrough for jencode() (E12 completion)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# TYPE:     visual walkthrough (Expected comments; written for Jeff's checking)
# PENDING:  none
# LOCKS:    the LOOK of jencode()'s message surface after the S238 completion
#           pass: the alphabetical listing, the blank / trim / face-value
#           notes, the word-evidence -99 nudge, M4/M5/M10 naming, the S238
#           quoting rule, the Rule L error remedies, and (S310, Section 8)
#           the factor renders: the level-order listing with its "(no
#           cases)" tag, the ordered factor without the nudge, and the
#           jencode() remedy at a jrecode() factor guard. The numbers
#           behind these are locked by jencode_check.R; this file is for
#           judging wording, layout, and coherence by eye.
#           Since S340 (Section 9): a text variable's declared missing
#           values -- left missing in automatic mode, with the note that
#           counts the cells and gives the map that keeps them declared.
#           Since S343 (Sections 10 and 11): the automatic suggestion on
#           categories a map must quote (a semicolon, a comma, an equals
#           sign, a keyword's name), and the reminder and offered calls
#           when an expression is given as the data.
# ORIGIN:   S237 (core) / S238 (completion; this file)
# S343 EDIT (v0.9.217, 2026-10-06): SECTIONS 10 AND 11 ADDED, for the cut
#           of Fix Slate 5. Section 10, four renders: automatic mode on
#           categories holding a comma, an equals sign and a semicolon
#           (the offered call quoted and packed, the long quoted word on a
#           line of its own); that call pasted and run, with the two
#           encodings compared; and categories named blank, else and
#           system. Section 11, three renders: jencode() and jrecode() on
#           what a function returns (the calls name mydata, and the
#           reminder gives the naming line), and a place, which keeps its
#           one line. Inline fixtures, removed at the foot of each section.
#           All seven Expected blocks FILLED BY RUNNING the file on the
#           0.9.217 build (fill.R); the call Render 2 of Section 10 runs
#           was harvested from Render 1's output, not typed. No existing
#           Expected moved: Sections 1-9 give the same output on 0.9.216
#           and 0.9.217. Neither new section needs another (harness.R: 11
#           of 11). The human half of jencode_check.R N45 and N46.
#           LAST VERIFIED v0.9.217, 2026-10-06 (S343) -- Sections 10 and
#           11 WALKED on the WORKSTATION by Jeff through receive_all(),
#           its block pasted back with the walk line as the tool writes
#           it ("walked, all okay"), no remark added; GitHub 8a10deb;
#           after the SANDBOX run.
# S340 EDIT (v0.9.214, 2026-10-05): SECTION 9 ADDED, two renders, for Fix
#           Slate 3: automatic mode on a string variable with declared
#           missing values (the words numbered, the declared strings left
#           missing, the new note), and the map that note prints, run under
#           the SPSS convention. An inline fixture, removed at the foot of
#           the section; the convention it sets is cleared there. All four
#           Expected blocks FILLED BY RUNNING the file on the 0.9.214 build
#           (fill.R). No existing Expected moved: Sections 1-8 give the same
#           output on 0.9.213 and 0.9.214. Section 9 needs no other section
#           (harness.R: 9 of 9). The human half of jencode_check.R N44a-j.
#           LAST VERIFIED v0.9.214, 2026-10-05 (S340) -- Section 9 WALKED
#           on the WORKSTATION by Jeff through rewalk("jencode") ("All
#           walks done okay"), GitHub 2d04b68, after the SANDBOX run (every
#           section through rewalk() as in a straight run, three orders,
#           and by prepare = TRUE).
# S337 EDIT (v0.9.211, 2026-10-05; no package change): Section 5's exact
#           Expected RE-PINNED to the emission, a blank line between its
#           three notes (a capture of both streams), and the false S268
#           mechanism under it replaced. Sections 2 and 7: the line breaks
#           of the choose-first note re-pinned ("cannot be made" on the
#           upper line), stale since the S292 wrap fix and present in the
#           workstation's own cap_jencode.txt. The file also gained the PENDING
#           line, the " ----" section titles and the spaced rules that
#           rewalk() and RStudio's outline read; nothing else moved.
# S310 EDIT (v0.9.181, 2026-09-23): jencode() accepts factors. Section 7's
#           type-guard Expected RE-PINNED ("only text and factor variables");
#           Section 8 is NEW (three renders, all Expecteds captured with
#           sink() in the SANDBOX at the 76 pin, convention unset), then
#           walked on the workstation.
# S294 EDIT (v0.9.167, 2026-09-14): the Setup reset line moved to the
#           clear.all = TRUE forms (S294 NULL flip); no Expected touched.
#           This file sets juse(tdat) BEFORE the reset, so under the flip a
#           bare f(NULL) would have resolved to tdat rather than clearing
#           every frame -- the clear.all forms keep the preamble meaning
#           what it says. Confirmed in the walk below.
# LAST VERIFIED: v0.9.211, 2026-10-05 (S337) -- Sections 2, 5 and 7 WALKED
#           on the WORKSTATION through rewalk(), each matching its
#           re-pinned Expected; the rest untouched (no package change).
#           Prior: v0.9.181, 2026-09-23 (S310) -- WALKED on the WORKSTATION,
#           end marker reached; Sections 7 and 8 matching their Expecteds
#           line for line (the rest untouched by this build). Captured
#           mechanically in the SANDBOX first.
#           Prior: v0.9.167, 2026-09-14 (S294) -- WALKED on the WORKSTATION,
#           end marker reached, every section matching (reset line only;
#           see the S294 EDIT note above).
#           Prior: v0.9.165, 2026-09-13 (S292) -- WALKED on the workstation
#           against the received 0.9.165 master; Section 4 rendered
#           exactly as the S292 capture below (both errors), every other
#           block unchanged. Sandbox first: the whole walk run on the
#           0.9.164 and 0.9.165 masters under sink() and byte-diffed --
#           stdout differs only at the two Section 4 errors, the message
#           stream (151 lines) is identical.
# S303 EDIT (v0.9.174; WALKED on the workstation the same session, the
#           re-pinned sections reading as Expected). Both D1
#           renders (Sections 2 and 7) re-pinned at their tails. From
#           S267 the second remedy was a jdeclare_missing() on the TEXT
#           source column -- a call that stops with an error, since a text
#           column cannot carry a missing-value code -- and both Expecteds
#           had shown it since S268 without anyone pasting it. It is now
#           the encode-then-declare pair on the result column. Each block
#           is a sandbox capture of this file run end to end against the
#           edited master (text_columns_data built from its generator);
#           the old-vs-new diff is those two tails and nothing else, and
#           both pairs were paste-run on the built fixture.
# EDITED:   S292 (v0.9.165). THE S287 DOUBLE-WRAP FIX. Section 4's strict-default Expected
#           was prose ("the error NAMES the missing words") and could not
#           see the defect; it is now a MECHANICAL capture of the fixed
#           error -- sink() at a pinned 76 on the S292 master, the word
#           list whole on one line. The near-miss block's pinned sentence
#           ("differs from the map's ...") did NOT move: it is line 4 of
#           that error, reserve 0 either way, and the S292 capture
#           matches it byte for byte; only its unpinned first lines
#           changed (the list now whole). No other Expected in this file
#           changed on the S292 master -- the other 30 strips and the four
#           cat() conversions are byte-neutral by the S291 property tests.
# EDITED:   S268 (v0.9.150; not yet re-run). THE S267 RE-PIN PASS. Both
#           D1 renders in this file (Sections 2 and 7) rebuilt by reading
#           the CURRENT source against the old text, NOT transcribed from
#           a render -- repaired but UNVERIFIED until the next capture.
#           Two changes at each site, both in shared machinery rather
#           than in anything this file owns: the gate menu's stata and
#           spss descriptors, now built as pre-broken two-line pairs so
#           the wrapper can no longer sever the locked term "base R"
#           across the break; and the D1 tail, where the call-less
#           "Or declare -99 with jdeclare_missing() so analyses exclude it."
#           became an intro plus a pasteable jdeclare_missing line. The
#           plural count (Section 2) and the three-word minting head
#           (Section 7) -- the things these sections are actually FOR --
#           are untouched.
#           A THIRD site was claimed and WITHDRAWN. S268 re-pinned the
#           AgeAtRelease block (Section 5) to carry blank lines between
#           its three notes, inferring that from jencode's
#           collapse = "\n\n"; the S268 run showed no blank lines and
#           the re-pin was reverted the same session. message() itself
#           collapses a doubled newline, so that literal has never
#           produced a break. See the note at that block: it leaves a
#           real question for the next MV pass, which is more useful
#           than the false finding it replaced.
#           TWO of the three S268 sites are therefore live, both derived
#           from CHANGED SOURCE STRINGS (read, not inferred). The
#           withdrawn one was derived from assumed BEHAVIOUR. That is
#           the line to hold when reading the rest of this pass.
#           WHAT THE NEXT RUN SHOULD TEST BEYOND THE TEXT: the pre-broken
#           descriptors should NOT reflow at a different console width.
#           Resize and rerun; if either re-wraps into a new shape, the
#           pre-breaking has been lost. That property, not the wording,
#           is what S267 actually bought.
# EDITED:   S266 (v0.9.149; not yet re-run). Two changes, both awaiting this
#           file's next capture -- which per the S259 convention is run
#           DIRTY (width and convention set to non-default values by hand
#           before sourcing), the one run shape that can distinguish a
#           working force from an absent one. (1) The two Setup state
#           blocks (convention hygiene, width pin) are HOISTED above the
#           jload: the load narrative, juse echo, and reset confirmations
#           used to render before either force applied. (2) The Section 4
#           near-miss Expected is re-pinned to the S261 " -- " sweep; its
#           new break position is derived from the wrapper, not yet seen
#           live.
# PRIOR:    v0.9.146, 2026-08-26 (S258) -- CAPTURED AND DIFFED rather
#           than read: run cold under sink() at a pinned 76, every
#           Expected compared against the captured output. Five of eight
#           were stale, all pure wrap drift from the S257 pull-back
#           condition, and are re-pinned from that capture. Worth noting
#           against the S255 stamp below, which recorded that nothing
#           S255 changed reaches this file: that was true of the chrome
#           reserve, because every message here is note-routed at reserve
#           0, but the S257 condition is route-blind and moved five of
#           the eight.
#           RESOLVED, the S255 open item: the missing-convention restore
#           IS present at the foot and DID run -- both it and the force
#           use a silent options() call, so neither echoes. No leak.
#           NOT read for render quality this run.
#
# PRIOR:    v0.9.144, 2026-08-25 (S255) -- WALKED IN FULL on the
#           workstation; every Expected matched. Nothing S255 changed
#           reaches this file: jencode's wrap sites are all note-routed
#           and were deliberately left as STRIP-OPTIONAL.
#           OPEN, from the S255 read (own to-do item): the Setup declares
#           missing-convention hygiene as record / force / restore, but
#           only the FORCE echoed and no matching restore appeared at the
#           foot, where the width restore did. If the restore is absent
#           this walk leaks an unset convention -- the leak S251 added it
#           to prevent. Read the Setup and the foot before the next run.
#
# PRIOR:    v0.9.141, 2026-08-24 (S251) -- WALKED IN FULL on the
#           workstation. Every Expected matched, including the two
#           re-pinned at S251.
#           S251 changes: the Setup gained missing-convention hygiene
#           (see the note there) -- this file forks on that setting and
#           never used to control it. SECTION 7's two Expecteds were
#           re-pinned; SECTION 2's was re-pinned after the walk, having
#           been missed on the first pass. Both are D1 sites and both
#           had gone stale at S250 in the same way, stopping at a
#           pre-S250 three-liner while the note now teaches the choice
#           inline. Section 2's replacement is transcribed from the
#           workstation render, so it has been SEEN but not re-walked;
#           the next pass confirms it.
#           Logged, not fixed: Section 5's -99 nudge offers a remedy
#           that gates under the unset convention this file now forces.
#           Details in that section's things-to-look-at.
# RUN:      line-by-line first (read each block of output before moving on).
#           Also source()-safe: deliberate errors are tryCatch-wrapped and
#           every prompting call passes overwrite = TRUE (the S220 traps).
#           Under source(), run WITH echo = TRUE, per the conventions file.
#           By section: source walk_tools.R, then rewalk("jencode") shows the
#           sections the PENDING line names and rewalk("jencode", "1") shows
#           one, each from a fresh Setup and its NEEDS. Add prepare = TRUE to
#           run only what the section needs and step through it by hand.
# SECTIONS: independent unless a framing comment says otherwise.
# ENDING:   the file MUST end with the executable end-marker line at the foot
#           (not with comments) -- see the note down there for why.
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# --- Setup -------------------------------------------------------------------

# jstats must be loaded already: devtools::load_all() (development) OR
# library(jstats) (installed) -- never both in one session.
stopifnot(exists("jload", mode = "function"))

# Session-state pins -- hoisted above the jload at S266, per the S259 rule
# that state blocks precede the first call that produces output: the jload
# narrative, the juse echo, and the reset confirmations all rendered before
# either force applied (the S258 capture shows them at the entry width).

# Missing-convention state (S251). One more piece of session state this
# file depends on and never used to control. jencode's D1 suspicious-target
# note FORKS on the setting: unset, it inlines the whole choose-first menu;
# set, it collapses to a single line naming the convention (Section 7 is
# where this shows). Whichever way the session happened to be left, the
# Expected there could only match one of them -- so pin it. Record what the
# session came in with, force UNSET (the state a first-time user is in, and
# the fuller of the two renders), restore at the foot. Same shape as
# missing_convention_check.R's hygiene block, and a TARGETED restore rather
# than joptions(NULL), which would reset all six option slots.
.entry_convention <- getOption(".jst_options_missing_convention")
options(.jst_options_missing_convention = NULL)

# Message-width state (S253). The emitter now wraps every message to the
# message.width setting, so message output has become environment-dependent:
# the same message renders differently on a 90-column pane and a 64-column
# one. Every Expected in this file was transcribed at 76, so pin the
# width exactly as the convention is pinned -- record what the session came
# in with, force it, restore at the foot. Load-bearing since v0.9.145,
# when the shipped default became "auto" (message output follows the
# console pane unless pinned).
.pin_width           <- 76L
.entry_message_width <- getOption(".jst_options_message_width")
options(.jst_options_message_width = .pin_width)

# The consolidated text fixture (S238; generator
# generators/text_columns_data_generator.R, seed 20260818). Every column
# except id is character by construction.
jload("E:/00 R Projects/00_jstats_test_data/datasets/text_columns_data.rds",
      name = "tdat", overwrite = TRUE)

# Neutral pipeline state (never assume the prior state is clean).
juse(tdat)
jsubset(clear.all = TRUE); jcomplete(clear.all = TRUE); joutput(NULL)
jdummy(clear.all = TRUE)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 1 -- automatic mode: the alphabetical listing ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# No map: jencode assigns numbers alphabetically and SHOWS the assignment,
# then teaches the rerun-with-a-map form for ordered categories.

tdat$StatusR <- jencode(tdat, Status)

# Expected (exact):
#   Note: 'Status' was encoded alphabetically:
#     "Bail"   -> 1
#     "Parole" -> 2
#     "Remand" -> 3
#   If these categories have a natural order (like Low/Medium/High), rerun with
#   a map to choose the numbers:
#     tdat$StatusR <- jencode(tdat, Status, map = "Bail=1; Parole=2; Remand=3")
# ...followed by the assign-or-lose reminder. Things to look at:
#   - the listing's aligned arrow column;
#   - the suggestion line is runnable as printed (copy/paste it and it works);
#   - the reminder's example uses THIS data frame's name (tdat$<name>).

jfreq(tdat, StatusR)

# Things to look at: the words ride along as value labels -- Bail/Parole/
# Remand label 1/2/3 in the frequency table without a jrelabel() step.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 2 -- blanks: left missing by default, mappable by rule ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Outcome has 6 blank cells ("") among its words.

tdat$OutcomeR <- jencode(tdat, Outcome)

# Expected (exact, after the alphabetical listing):
#   Note: 6 blank cells in 'Outcome' were left missing (NA).
#   To give blank cells their own category, rerun with a map naming them:
#     tdat$OutcomeR <- jencode(tdat, Outcome,
#                              map = "No reoffence=1; Reoffended=2; blank=0")

tdat$OutcomeM <- jencode(tdat, Outcome,
                         map = "Reoffended=1; No reoffence=0; blank=-99")

# Expected: the blank rule routes the 6 blanks to -99, and the minting note
# counts them in the PLURAL (the S238 fix -- this read "a blank cell"
# whatever the count before).
#
# RE-PINNED S251, from a workstation render. This is the file's SECOND D1
# site (Section 7 is the other), and its Expected had gone stale the same
# way: it stopped at the pre-S250 three-liner while the note now teaches
# the choice inline. The plural count is still the thing this section is
# FOR -- the menu below it is shared machinery, verified structurally by
# missing_convention_check.R N55b and read for tone in Section 7.
#   Note: 6 blank cells were encoded as -99, which looks like a coded
#   missing value.
#   No missing-value convention is selected, so the value cannot be made
#   missing yet.
#   Choose one for this session:
#     joptions(missing.convention = "stata")
#         Lowercase markers behave as true NAs in base R.
#         Recommended if you also run base R or AI-generated code.
#     joptions(missing.convention = "spss")
#         Codes stay visible numbers; jstats treats them as missing.
#         Base R does not.
#     joptions(missing.convention = "sas")
#         Like Stata, with uppercase markers (.A-.Z).
#   To make the choice permanent, put the same line in your .Rprofile.
#   Then map it directly:
#     tdat$OutcomeR <- jencode(tdat, Outcome, map = "Reoffended=1; No reoffence=0; blank=missing")
#   Or declare -99 as missing on the encoded variable:
#     tdat$OutcomeR <- jencode(tdat, Outcome, map = "Reoffended=1; No reoffence=0; blank=-99")
#     jdeclare_missing(tdat, OutcomeR, codes = c(-99), modify = TRUE)
#
# RE-PINNED S303: the tail. It was a jdeclare_missing() on Outcome, the
# TEXT source, which errors when pasted; it is now the pair that encodes
# into OutcomeR and declares there. The pair names only what it creates,
# so it runs whatever the user called their own column (this call named
# it OutcomeM).
#
# RE-PINNED S268 for S267, two changes, both in the shared machinery
# rather than in anything this section owns. (1) The stata and spss
# descriptors are rewritten and each is now built as TWO pre-broken
# lines, so the break above is structural and fires at every width --
# the wrapper used to be able to sever the locked term "base R" across
# it. (2) The tail was a call-less pointer ("Or declare -99 with
# jdeclare_missing() so analyses exclude it.") and is now an intro plus a
# pasteable call, so both alternatives can be run.
#
# The plural count is still what this section is FOR, and it is
# untouched. Rationale for the menu rewrite lives at
# missing_convention_walk.R Section 31 and is not repeated here.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 3 -- quoting: apostrophes unquoted, semicolons quoted ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ReasonDeclined holds "Don't know" (apostrophe) and
# "Not applicable; other" (embedded semicolon). Under the S238 token-start
# quote rule the apostrophe word parses AS TYPED; the semicolon word needs
# the double-quoted form, since a bare semicolon separates rules.

tdat$ReasonR <- jencode(tdat, ReasonDeclined,
                        map = paste0("Refused=1; Don't know=2; ",
                                     "\"Not applicable; other\"=3; ",
                                     "No answer=4"))

# Expected: no error, no quoting complaint; four categories encoded 1-4
# with the words as labels. (Before S238, Don't know needed quotes or the
# call died on an unbalanced-quote error.)

# A genuinely unbalanced quote still errors:

tryCatch(jencode(tdat, Status, map = "\"Bail=1; Parole=2"),
         error = function(e) cat("Caught: ", conditionMessage(e), "\n",
                                 sep = ""))

# Expected (exact):
#   Caught: jencode(): Error in map argument: Unbalanced quotation mark in the
#   map argument. A quoted word must open and close with the same mark, as
#   in "Not stated"=9.

# Commas between rules get the specific diagnosis, remedy on its own line:

tryCatch(jencode(tdat, Status, map = "Bail=1, Parole=2"),
         error = function(e) cat("Caught: ", conditionMessage(e), "\n",
                                 sep = ""))

# Expected (exact; the runnable map line sits alone, never wrapped):
#   Caught: jencode(): Error in map argument: It looks like commas were used to
#   separate rules in the map string. Use semicolons instead:
#     map = "Bail=1; Parole=2; Remand=3"


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 4 -- strict default, the near-miss, and else=NA naming ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# An incomplete map ERRORS by default (nothing silently dropped).

tryCatch(jencode(tdat, ReasonDeclined, map = "Refused=1; Don't know=2"),
         error = function(e) cat("Caught: ", conditionMessage(e), "\n",
                                 sep = ""))

# Expected (exact, a sink() capture at 76 on the S292 master; the whole
# word list sits on ONE line -- the S287 double wrap put "\"No answer\"
# and" and "\"Not applicable; other\"." on two -- and the runnable map
# line sits alone, never wrapped):
#   Caught: jencode(): 'ReasonDeclined' contains words not in the map:
#   "No answer" and "Not applicable; other".
#   Add these words to the map, or add an else rule to send unmapped words
#   to missing:
#     map = "...; else=NA"
# Things to look at: the break after "map:" is the wrapper's, not a
# double wrap -- "\"No answer\"" would put the rendered first line at 70,
# past the 68 (76 less R's 8-column error chrome) the emitter reserves.

# Capitalization near-miss gets its own diagnosis:

# (Strict path on purpose: with an else rule present the unmatched word
# would simply sweep, and the diagnosis has nothing to do.)

tryCatch(jencode(tdat, ReasonDeclined, map = "refused=1"),
         error = function(e) cat("Caught: ", conditionMessage(e), "\n",
                                 sep = ""))

# Expected: the error names the unmatched words (all four, on one line
# under the S292 fix; the "in the / map:" break of the double wrap is
# gone here too), then:
# "Refused" differs from the map's "refused" only in capitalization --
# matching is case-sensitive.
# (Re-pinned S266 for the S261 dash sweep. The extra character pushes
# "matching" off the first line, so the break now falls after the dash --
# derived from the wrapper at 76; this run confirms it live.)

# With else=NA, the sweep is allowed -- and the S238 naming line says WHICH
# words went (capped at five, then "and N more"):

tdat$ReasonS <- jencode(tdat, ReasonDeclined,
                        map = "Refused=1; Don't know=2; else=NA")

# Expected:
#   Note: else=NA converted 2 unmapped words (29 cells) in 'ReasonDeclined' to
#   missing (NA).
#   The unmapped words were "No answer" and "Not applicable; other".
# Things to look at: the quoted phrase "Not applicable; other" never
# splits across a wrap -- a quoted word travels as one token (S238).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 5 -- numbers-as-text, the poisoned column, and the -99 nudge ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# AgeText is ALL numbers stored as text: face-value conversion, one worked
# example, and the no-labels note.

tdat$Age <- jencode(tdat, AgeText)

# Expected: "is a number stored as text; each was converted to its own
# value" with a ("NN" -> NN, never renumbered) example (the example is the
# column's LARGEST value), then: No value labels were attached. To add
# labels, use jrelabel().

# AgeAtRelease is the poisoned column: ages + "-99" + "Refused" +
# "Not stated" + blanks. map = "else=NA" is the one-line repair -- and the
# swept word "Refused" is the EVIDENCE that licenses the -99 nudge (S238):
# -99 sits inside the plausible-age range, so the magnitude heuristic
# alone would stay silent.

tdat$AgeRel <- jencode(tdat, AgeAtRelease, map = "else=NA")

# Expected (exact):
#   Note: 70 values in 'AgeAtRelease' stored as text were kept at their own
#   value ("71" -> 71, never renumbered).
#
#   Note: -99 in 'AgeAtRelease' looks like a coded missing value; the column
#   also contained the word "Refused".
#   Declare -99 with jdeclare_missing() so analyses exclude it.
#
#   Note: else=NA converted 2 unmapped words (7 cells) and 3 blank cells in
#   'AgeAtRelease' to missing (NA).
#   The unmapped words were "Not stated" and "Refused".
#
# RE-PINNED S337 to what the package emits: a blank line between the three
# notes, taken from a capture of both streams (the S269 item's rule: judge
# a block against a capture, never against the Console). The RStudio
# Console does not display a blank line on the message stream, so THERE
# the three notes arrive with no line between them -- which is what this
# block pinned from S268 to S336. The S268 commentary that stood here gave
# a mechanism for it, "message() itself collapses a doubled newline". S269
# found that false: the blank lines are emitted, and it is the Console
# that drops them. Whether a blank line on the message stream is worth
# emitting at all is the to-do's ruling R6.
#
# Things to look at:
#   - in the Console, three notes about one column arrive as a wall. Judge
#     it as it stands there: does the reader parse three findings, or one
#     undifferentiated block? (That is ruling R6's question.)
#   - the nudge CITES its evidence (the word), not just a conclusion;
#   - "Not stated" is swept but not cited as evidence -- it is absent from
#     the missing-label wordlist (the open S237 gap item, on purpose here).
#   - (S251) the nudge closes on "Declare -99 with jdeclare_missing() so
#     analyses exclude it." Under an UNSET convention -- which this file
#     now forces -- that remedy GATES: jdeclare_missing() refuses and prints
#     the choose-first menu instead, so the note sends the reader to a
#     second message rather than to a result. It is the shape S250
#     rejected for the D1 note ("run this to get another message"),
#     surviving in a sibling that session did not touch. Milder, since
#     the gate is guided and act-shaped, but it is a round trip. Logged
#     for the MV mvbatch; five other sites share the phrasing.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 6 -- the Qualtrics pair: choice text vs numeric export ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Q_AgreeText and Q_AgreeNum are the SAME latent answers in Qualtrics's two
# export shapes (S224 recon): the clicked answer text, and numeric recode
# values poisoned to text by the three-row header. Encoding the text with
# an ordered map must land exactly where the numeric export already is --
# and the reminder's own advice ("compare jfreq() on the original and the
# new column") is the check.

tdat$Agree <- jencode(tdat, Q_AgreeText,
                      map = paste0("Strongly disagree=1; Disagree=2; ",
                                   "Neither agree nor disagree=3; ",
                                   "Agree=4; Strongly agree=5"))

jfreq(tdat, Agree)

tdat$AgreeNum <- jencode(tdat, Q_AgreeNum)

jfreq(tdat, AgreeNum)

# Expected: the two frequency tables carry IDENTICAL counts per code 1-5;
# the first wears the answer text as labels, the second is bare numbers
# (face-value conversion attaches no labels).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 7 -- trim, the collapse naming, and a type guard ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

tdat$Superv <- jencode(tdat, SupervisionType)

# Expected: the alphabetical listing FIRST, showing TWO categories with the
# spaced variants reunited, and the trim note after it:
#   Note: 9 cells in 'SupervisionType' had outer spaces removed before encoding
#   (e.g. " Custody" was read as "Custody").

tdat$ReasonC <- jencode(tdat, ReasonDeclined,
                        map = paste0("Refused=-99; Don't know=-99; ",
                                     "No answer=-99; ",
                                     "\"Not applicable; other\"=1"))

# RE-PINNED S251, against the live render, under the UNSET convention the
# Setup now forces. The old Expected predated S250 and was short by the
# whole middle of the message.
#
# Expected, TWO notes in order. First the no-label collapse note:
#   Note: Some numbers combine two or more words, so no label could be
#   chosen for them:
#     -99 <- "Refused", "Don't know", "No answer"
#   The other numbers keep their original words as labels.
#   Name each combined number with the labels argument, or later
#   with jrelabel().
#
# Then the minting note, which names ALL THREE collapsing words in MAP
# order (the S238 fix -- only the first was named before) and, because no
# convention is selected, teaches the choice before offering the remedy:
#   Note: "Refused", "Don't know", and "No answer" were encoded as -99, which
#   looks like a coded missing value.
#   No missing-value convention is selected, so the value cannot be made
#   missing yet.
#   Choose one for this session:
#     joptions(missing.convention = "stata")
#         Lowercase markers behave as true NAs in base R.
#         Recommended if you also run base R or AI-generated code.
#     joptions(missing.convention = "spss")
#         Codes stay visible numbers; jstats treats them as missing.
#         Base R does not.
#     joptions(missing.convention = "sas")
#         Like Stata, with uppercase markers (.A-.Z).
#   To make the choice permanent, put the same line in your .Rprofile.
#   Then map it directly:
#     tdat$ReasonDeclinedR <- jencode(tdat, ReasonDeclined, map = "Refused=missing; Don't know=missing; No answer=missing; \"Not applicable; other\"=1")
#   Or declare -99 as missing on the encoded variable:
#     tdat$ReasonDeclinedR <- jencode(tdat, ReasonDeclined, map = "Refused=-99; Don't know=-99; No answer=-99; \"Not applicable; other\"=1")
#     jdeclare_missing(tdat, ReasonDeclinedR, codes = c(-99), modify = TRUE)
#
# RE-PINNED S303: the tail, as in Section 2 (the old line errored on the
# text source). The pair's encode line is escaped exactly as the first
# remedy's, so the quoted phrase survives the paste.
#
# RE-PINNED S268 for S267 -- the same two shared-machinery changes as
# Section 2: pre-broken stata and spss descriptors, and the call-less
# tail replaced by an intro plus a pasteable call. The three-word
# minting head above is untouched, which is what this section is for.
#
# Note the tail change interacts with the unwrapped-map bullet below.
# The block now ends on a SECOND runnable line, a short one, directly
# beneath the ~150-column map line. Read those two together: the short
# line may make the long one look worse, or may give the eye somewhere
# to land after it. Either reading is useful for the logged item.
#
# Things to look at:
#   - That map line is ONE UNWRAPPED LINE, about 150 columns. The D1
#     remedy does not route through the packer that wraps the automatic
#     and blank suggestions, so nothing holds it to 76. Pre-existing,
#     logged S251, not fixed here -- but judge how badly it reads.
#   - The suggestion keeps the quoted "Not applicable; other" intact and
#     escaped, which is the S249 fix still holding.
#   - Set a convention (joptions(missing.convention = "stata")) and rerun
#     this call to see the other branch: the menu collapses to one line.
#     Restore with options(.jst_options_missing_convention = NULL) before
#     moving on, or the rest of the file drifts from its Expecteds.

tryCatch(jencode(tdat, id),
         error = function(e) cat("Caught: ", conditionMessage(e), "\n",
                                 sep = ""))

# Expected (exact; RE-PINNED S310 -- a factor is no longer refused, so the
# guard now names both accepted types):
#   Caught: jencode(): 'id' is a numeric variable; only text and factor
#   variables can be encoded.
#   To change numeric values, use jrecode().


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 8 -- a factor is text with a declared order (S310) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# jencode() accepts a factor as text that already carries an order: the
# listing follows the LEVEL order, a level with no cases keeps its code and
# label and is tagged, and an ordered factor (which has declared its order)
# does not get the rerun nudge. This is also the one-call route from a
# factor into jrecode(), jrelabel() and jdeclare_missing(), whose guards
# now name it. Deterministic fixture (rep, not sample) so the Expecteds
# are exact.

tdat$Sev <- factor(rep(c("Low", "High"), length.out = nrow(tdat)),
                   levels = c("Low", "Medium", "High"))
tdat$SevR <- jencode(tdat, Sev)

# Expected (exact):
#   Note: 'Sev' was encoded in its level order:
#     "Low"    -> 1
#     "Medium" -> 2  (no cases)
#     "High"   -> 3
#   If these categories have a natural order (like Low/Medium/High), rerun with
#   a map to choose the numbers:
#     tdat$SevR <- jencode(tdat, Sev, map = "Low=1; Medium=2; High=3")
# ...followed by the assign-or-lose reminder. Things to look at:
#   - "High" is 3, not 1: the level order won, not the alphabet;
#   - the Medium line carries "(no cases)": the level is kept, with its code
#     and label, so the numbering matches the factor's declaration;
#   - the rerun suggestion lists all three levels, in level order.

jfreq(tdat, SevR)

# Things to look at: Low and High label 1 and 3. The empty Medium=2 is NOT
# shown -- jfreq() lists a labelled column's observed values -- which is
# why the listing above tagged it.

tdat$SevO <- factor(rep(c("Low", "High"), length.out = nrow(tdat)),
                    levels = c("Low", "High"), ordered = TRUE)
tdat$SevOR <- jencode(tdat, SevO)

# Expected (exact):
#   Note: 'SevO' was encoded in its level order:
#     "Low"  -> 1
#     "High" -> 2
# ...followed by the assign-or-lose reminder. Things to look at: no "If
# these categories have a natural order" line -- an ordered factor has
# already declared its order, so the nudge would be noise.

tryCatch(jrecode(tdat, Sev, map = "3=2"),
         error = function(e) cat("Caught: ", conditionMessage(e), "\n",
                                 sep = ""))

# Expected (exact):
#   Caught: jrecode(): 'Sev' is a factor; values can only be recoded on
#   numeric variables.
#   Convert it to numbers first with jencode().
# Things to look at: one remedy line, one call, the same for a factor and
# for a text variable (jrelabel() and jdeclare_missing() say it too). The
# advice it replaces, as.numeric(as.character(...)), returned all NA on
# word levels.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 9 -- a text variable's declared missing values (S340) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# An SPSS string variable can declare missing values --
#     MISSING VALUES Marital ('UNKNOWN', 'REF').
# -- and haven reads it as text whose declared values are text. Since
# 0.9.214 jstats counts those cells as missing everywhere (cps_walk.R Part
# K), and jencode() is the one-call route from such a variable to a numeric
# one, so it has to say what became of them. Until this build it numbered
# "REF" and "UNKNOWN" beside the words: two declared missing values came
# out as categories 2 and 4, with nothing said. Inline fixture, ten cases.
# The assertion side is jencode_check.R N44a-N44j.

ms9 <- data.frame(id = 1:10)
ms9$Marital <- haven::labelled_spss(
  c("UNKNOWN", "Married", "Single", "Married", "UNKNOWN", "Single",
    "Married", "Single", "REF", "Single"),
  labels = c(Refused = "REF"), na_values = c("UNKNOWN", "REF"))

# Render 1 -- automatic mode: the words are numbered, the declared strings
# are not.
ms9$MaritalR <- jencode(ms9, Marital)

# Expected:
#   Note: 'Marital' was encoded alphabetically:
#     "Married" -> 1
#     "Single"  -> 2
#   If these categories have a natural order (like Low/Medium/High), rerun with
#   a map to choose the numbers:
#     ms9$MaritalR <- jencode(ms9, Marital, map = "Married=1; Single=2")
#
#   Note: 3 cells in 'Marital' holding a declared missing value ("REF",
#   "UNKNOWN") were left missing (NA).
#   To keep them declared, as one missing value, rerun with a map sending those
#   values to missing:
#     ms9$MaritalR <- jencode(ms9, Marital,
#                             map = "Married=1; Single=2; REF=missing;
#                                   UNKNOWN=missing")
#
#   Note: This call changes ms9 only if you assign the result:
#     ms9$<name> <- jencode(...)
#   To check the encoding landed correctly, compare jfreq() on the original and
#   the new column.

jfreq(ms9, MaritalR)

# Expected:
#   Frequencies
#
#   10 Cases in the 1 Variable Pool
#
#   MaritalR
#
#               Freq  Total %  Valid %  Cum. %
#   ----------  ----  -------  -------  ------
#   Valid
#   1: Married    3     30.00   42.86    42.86
#   2: Single     4     40.00   57.14   100.00
#
#   Missing
#   System/NA     3     30.00      --       --
#
#   Total        10    100.00

# Render 2 -- the map the note printed, run. The word "missing" makes the
# convention's own missing value (set here, so the map has one to use).
joptions(missing.convention = "spss", quiet = TRUE)
ms9$MaritalD <- jencode(
  ms9, Marital, map = "Married=1; Single=2; REF=missing; UNKNOWN=missing")

# Expected:
#   Note: Some numbers combine two or more words, so no label could be
#   chosen for them:
#     -99 <- "REF", "UNKNOWN"
#   The other numbers keep their original words as labels.
#   Name each combined number with the labels argument, or later
#   with jrelabel().
#
#   Note: -99 was used for missing, from the missing.convention.codes default,
#   and declared as a missing value on the encoded variable.
#
#   Note: This call changes ms9 only if you assign the result:
#     ms9$<name> <- jencode(...)
#   To check the encoding landed correctly, compare jfreq() on the original and
#   the new column.

jfreq(ms9, MaritalD)

# Expected:
#   Frequencies
#
#   10 Cases in the 1 Variable Pool
#
#   MaritalD
#
#                   Freq  Total %  Valid %  Cum. %
#   --------------  ----  -------  -------  ------
#   Valid
#   1: Married        3     30.00   42.86    42.86
#   2: Single         4     40.00   57.14   100.00
#
#   Missing
#   -99 (no label)    3     30.00      --       --
#
#   Total            10    100.00
options(.jst_options_missing_convention = NULL)
rm(ms9)

# Things to look at:
#   - RENDER 1: the listing and its suggested map hold the two words only.
#     The second note counts the cells left missing, names the values, and
#     prints the map that keeps them declared. Does the order read right --
#     what was encoded, then what was not?
#   - "as one missing value": the word "missing" makes one value, so REF
#     and UNKNOWN sent to it come back as one. The note says so before the
#     rerun does. With a single declared string the line reads "To keep
#     them as declared missing values" (jencode_check.R N44c2, N44d).
#   - Its jfreq(): three cells under System/NA. They are missing, but which
#     of them refused is no longer in the variable.
#   - RENDER 2: the three cells are -99, declared, and the first note names
#     the two strings that now share it. Keeping them APART is a map with a
#     number for each (REF=-98; UNKNOWN=-99): jencode() then prints the
#     jdeclare_missing() call that declares both, the note Section 7 shows.
#     Should the Render 1 note offer that map instead of the merged one?


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 10 -- the automatic suggestion on words a map must quote (S343) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Automatic mode hands its result back as a map ("rerun with a map to choose
# the numbers"). A map separates its rules with semicolons, its words with
# commas and a word from its number with an equals sign, and it reads else,
# NA and blank as keywords -- so a category holding one of those characters,
# or named like a keyword, has to be quoted, as in "Not stated; other"=9.
# Until 0.9.217 the suggestion was built from the bare words: its call
# stopped ("Invalid rule 'Skipped' in map argument") on a semicolon, read a
# comma as two words, and sent a category named else to the else rule.
# Inline fixture, eighteen cases. The assertion side is jencode_check.R
# N45a-N45j.

qw10 <- data.frame(
  Why = rep(c("Don't know", "Moved away, address unknown", "No answer",
              "Other = see notes", "Refused",
              "Skipped; respondent was not asked this question"), 3),
  Kw  = rep(c("blank", "else", "system", "yes"), c(5, 4, 5, 4)),
  stringsAsFactors = FALSE)

# Render 1 -- a comma, an equals sign and a semicolon inside categories.
qw10$WhyR <- jencode(qw10, Why)

# Expected:
#   Note: 'Why' was encoded alphabetically:
#     "Don't know"                                      -> 1
#     "Moved away, address unknown"                     -> 2
#     "No answer"                                       -> 3
#     "Other = see notes"                               -> 4
#     "Refused"                                         -> 5
#     "Skipped; respondent was not asked this question" -> 6
#   If these categories have a natural order (like Low/Medium/High), rerun with
#   a map to choose the numbers:
#     qw10$WhyR <- jencode(qw10, Why,
#                          map = "Don't know=1;
#                                \"Moved away, address unknown\"=2; No answer=3;
#                                \"Other = see notes\"=4; Refused=5;
#                                \"Skipped; respondent was not asked this question\"=6")
#
#   Note: This call changes qw10 only if you assign the result:
#     qw10$<name> <- jencode(...)
#   To check the encoding landed correctly, compare jfreq() on the original and
#   the new column.

# Render 2 -- the call that note printed, pasted here and run (to WhyR2, so
# the two results can be compared). It stopped before 0.9.217.
qw10$WhyR2 <- jencode(qw10, Why,
                      map = "Don't know=1;
                            \"Moved away, address unknown\"=2; No answer=3;
                            \"Other = see notes\"=4; Refused=5;
                            \"Skipped; respondent was not asked this question\"=6")

# Expected:
#   Note: This call changes qw10 only if you assign the result:
#     qw10$<name> <- jencode(...)
#   To check the encoding landed correctly, compare jfreq() on the original and
#   the new column.

identical(as.numeric(qw10$WhyR), as.numeric(qw10$WhyR2))

# Expected:
#   [1] TRUE

# Render 3 -- categories named like the map's keywords.
qw10$KwR <- jencode(qw10, Kw)

# Expected:
#   Note: 'Kw' was encoded alphabetically:
#     "blank"  -> 1
#     "else"   -> 2
#     "system" -> 3
#     "yes"    -> 4
#   If these categories have a natural order (like Low/Medium/High), rerun with
#   a map to choose the numbers:
#     qw10$KwR <- jencode(qw10, Kw,
#                         map = "\"blank\"=1; \"else\"=2; \"system\"=3; yes=4")
#
#   Note: This call changes qw10 only if you assign the result:
#     qw10$<name> <- jencode(...)
#   To check the encoding landed correctly, compare jfreq() on the original and
#   the new column.
rm(qw10)

# Things to look at:
#   - RENDER 1: the listing shows every category in quotation marks, as it
#     always has. The offered call quotes only the three that need it, and
#     each of those marks carries a backslash, because the whole map sits
#     inside quotation marks of its own. Does \"Other = see notes\"=4 read
#     as something to paste, or as noise?
#   - The long category takes a line to itself and runs past the 76-column
#     width. A quoted word is never broken: a break inside it would put a
#     line end and spaces into the word, which would then match no cell.
#     (That is the S249 item; the packer split at every semicolon.)
#   - RENDER 2 is Render 1's call run as printed, and the last line says
#     the two encodings agree. Its only note is the reminder: a map that
#     names every category has nothing else to report.
#   - RENDER 3: blank, else and system are quoted, because a map reads the
#     bare words as its blank token, its else rule and SPSS's name for a
#     plain NA; yes is not.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 11 -- an expression given as the data (S343) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# jencode() and jrecode() return the new values and change nothing; the
# closing reminder shows the assignment that keeps them. Given a function
# call or a subset where the data frame goes, that line read
# "mk11()$<name> <- jencode(...)", which is not R, and every call the notes
# offered pasted the expression the same way. The lines now name mydata and
# the reminder says how mydata is made -- the form jdeclare_missing() and
# the registration verbs took at S339 and S342. The assertion side is
# jencode_check.R N46a-N46k.

mk11 <- function() {
  data.frame(id = 1:6, Grp = rep(c("ctl", "trt"), 3),
             Score = c(1, 2, 3, 1, 2, 3), stringsAsFactors = FALSE)
}

# Render 1 -- jencode() on what a function returns.
g11 <- jencode(mk11(), Grp)

# Expected:
#   Note: 'Grp' was encoded alphabetically:
#     "ctl" -> 1
#     "trt" -> 2
#   If these categories have a natural order (like Low/Medium/High), rerun with
#   a map to choose the numbers:
#     mydata$GrpR <- jencode(mydata, Grp, map = "ctl=1; trt=2")
#
#   Note: The result is kept only if you assign it.
#   Name the data frame first, then assign the result to a variable in it:
#     mydata <- mk11()
#     mydata$<name> <- jencode(mydata, ...)
#   To check the encoding landed correctly, compare jfreq() on the original and
#   the new column.

# Render 2 -- jrecode(), the same reminder with its own function name.
r11 <- jrecode(mk11(), Score, map = "1=10; 2=20; 3=30")

# Expected:
#   Note: No value labels assigned. To add labels, use jrelabel().
#
#   Note: The result is kept only if you assign it.
#   Name the data frame first, then assign the result to a variable in it:
#     mydata <- mk11()
#     mydata$<name> <- jrecode(mydata, ...)
#   To check the recode landed correctly, compare jfreq() on the original and
#   the new column.

# Render 3 -- a place (a data frame inside a list) is not an expression: a
# result can be assigned into it, so it keeps the one line it had.
lst11 <- list(d = mk11())
p11 <- jencode(lst11$d, Grp)

# Expected:
#   Note: 'Grp' was encoded alphabetically:
#     "ctl" -> 1
#     "trt" -> 2
#   If these categories have a natural order (like Low/Medium/High), rerun with
#   a map to choose the numbers:
#     lst11$d$GrpR <- jencode(lst11$d, Grp, map = "ctl=1; trt=2")
#
#   Note: This call changes lst11$d only if you assign the result:
#     lst11$d$<name> <- jencode(...)
#   To check the encoding landed correctly, compare jfreq() on the original and
#   the new column.
rm(mk11, g11, r11, lst11, p11)

# Things to look at:
#   - RENDER 1: the first note's call names mydata before the reminder has
#     said what mydata is. Read top to bottom, does that land, or should
#     the naming line come first?
#   - The reminder's two code lines: "mydata <- mk11()" runs as printed;
#     the line under it is the pattern it has always been (<name> and ...
#     are yours to fill in), now with mydata inside the call as well.
#   - "Name the data frame first, then assign the result to a variable in
#     it:" -- one sentence for two steps. Clear enough?
#   - RENDER 3: lst11$d on both lines, as before this build. Nothing here
#     should have moved.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Observations
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# <Free-form notes from the most recent walk: anything that looked off,
# wording worth an mv review, follow-ups. Dated entries, newest first.>
#
# 2026-08-18 (S238, first full walk -- Jeff; PASSED). Six Expected blocks
#   re-pinned afterward to the verbatim renders: the originals were drawn
#   by hand and mispredicted wrap points (and, in Section 7, the word
#   order -- the minting note names collapsing words in MAP order, not
#   alphabetically). Function output was correct throughout; only the
#   comments changed. Latent observation, no defect seen: the four type
#   guards do not route through .jst_wrap_prose, so a very long variable
#   name could push their first line past 76 columns -- log for a future
#   message pass.


# --- Restore session state ---------------------------------------------------
# Targeted restore of the one option the Setup forced (S251). Placed above
# the end marker so it runs on every completed pass. The walk's data frames
# are deliberately left behind for poking at afterwards.

options(.jst_options_missing_convention = .entry_convention)
options(.jst_options_message_width = .entry_message_width)


# --- End marker --------------------------------------------------------------
# A real statement, deliberately last: stepping through with Ctrl+Enter, RStudio
# keeps expanding the selection when only comments remain, echoing the tail of
# the file back repeatedly. Ending on executable code gives it somewhere to
# stop. Keep this line at the foot of every walkthrough, below the Observations
# block, and rename it to match the file.

cat("\n--- End of jencode_walk.R ---\n")
