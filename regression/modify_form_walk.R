# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# modify_form_walk.R -- human-visual walkthrough
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# TYPE:     visual walkthrough (Expected comments; written for Jeff's checking)
# PENDING:  none
# LOCKS:    every runtime message that SUGGESTS a data-changing call teaches
#           modify = TRUE, not the assignment form; the two REPORT sites (the
#           durability note, the jai orientation body) still show both forms.
#           Since S351 also the other LOAD AND SAVE messages (instructions
#           Section 6 [BUILD-TESTING]: this is the walk that owns them):
#           jload()'s and jsave()'s front doors, a path typed with single
#           backslashes, the routes offered a frame holding a text variable
#           with declared missing values, jsave()'s note on a text
#           variable's missing cells (ruling R13), and the layout of
#           jload()'s Loaded line among its notes (ruling R6).
#           Since S352 also jsave() given an expression as the data
#           (Section 19).
# ORIGIN:   S229
# EDITED:   S353 (v0.9.226; Fix Slate 9, the second half). SECTION 5
#           RE-PINNED MECHANICALLY under ruling R5 (the layout of a long
#           printed call; walked once, in missing_convention_walk.R
#           Section 64), so PENDING stays none: the load scan's labelled
#           declaration, 77 characters, breaks before modify = TRUE. The
#           scan's lines now go through the stdout emitter, where they had
#           been printed with cat() and ran on whole. Section 9's long
#           jdeclare_missing() lines break too; its pins describe them, so
#           they did not move. harness.R verify: 42 of 43 Expected blocks
#           found (Section 9's, as before), 19 of 19 sections.
# EDITED:   S352 (v0.9.225; Fix Slate 9, the first half). SECTIONS 4 AND 5
#           RE-PINNED; SECTION 19 ADDED. Every changed Expected FILLED BY
#           RUNNING the file (fill.R).
#           Sections 4 and 5: with no convention selected -- this walk's
#           state -- the load scan's declare line stopped at the
#           choose-first gate; the menu now comes first (ruling R15). Each
#           pin had quoted one line, Section 5's in its pre-S267 commented
#           form; each is now the call's whole output.
#           Section 19: jsave()'s refusals given an expression as the data
#           (the S351 item) -- each block of lines opens on
#           "mydata <- ...".
#           harness.R derive: 42 of 43 Expected blocks found (Section 9's,
#           as before); Section 19 needs no other, every NEEDS line as it
#           was.
# EDITED:   S351 (v0.9.224; Fix Slate 6; WALKED on the workstation the same session).
#           SIX NEW SECTIONS, 13-18, every Expected filled by running the
#           file (fill.R; the Saved lines, which name a temporary folder,
#           then taken out of the pins by script): 13 the front doors of
#           jload() and jsave(); 14 a path typed with single backslashes;
#           15 a frame holding a text variable with declared missing
#           values (the load narrative's Cases 4, 7 and 6, jsave()'s .dta
#           and .sav refusals, the CSV note); 16 a text variable's missing
#           cells across a save (ruling R13) and a CSV file of one column;
#           17 the Loaded line and the notes around it, THE ONE SECTION
#           WALKED FOR RULING R6 (missing_convention_walk.R Sections 4, 6, 8
#           and 51 re-pinned mechanically under it); 18 Case 7's count past
#           three names. Sections 1-3 show R6's blank line under their
#           Loaded lines; none of their pins holds that line, so nothing
#           there moved. harness.R derive: no new section needs another,
#           every NEEDS line as it was; 38 of 39 Expected blocks found in
#           the capture (Section 9's, as before).
#           WALK: Sections 13-18 -- WALKED, see LAST VERIFIED below.
# EXPECTED REVISED: S230 (v0.9.126) -- Sections 2/3/6 Expecteds brought to
#           the S230 message surface (Rule L remedy blocks; Rule E splits
#           in the minimal refusals). PENDING the next actual walk; the
#           LAST VERIFIED line below records runs, not edits.
#           DISCHARGED S259: read end to end at S255 (all ten sections
#           green) and captured against live output at S258, where the
#           only stale block was Section 1's -- Sections 2, 3 and 6
#           matched, so these Expecteds are confirmed.
# EDITED:   S339 (v0.9.213; WALKED on the workstation the same session). Fix
#           Slate 2. TWO NEW SECTIONS, no existing Expected moved (a capture
#           of every section on the 0.9.212 and 0.9.213 builds is the same
#           line for line). Section 11: the durability note on a call with
#           many variables -- vars = as typed, every name when there are
#           three or fewer, otherwise none (the S298 item). Section 12: the
#           data given as an expression or as a place, in jdeclare_missing()
#           and jconvert(), and the no-variables refusal (the S219 item,
#           findings 2 and 5). Every Expected filled from a run of the file.
#           WALK: Sections 11 and 12.
# EDITED:   S319, second build (v0.9.196 PENDING; NOT yet walked on the
#           workstation). SECTION 8's first render RE-PINNED again, to
#           jconvert's long-form report (one row per marker, the range row
#           last), from a whole-file capture diff of the 0.9.195 and
#           0.9.196 masters: the report lines, and nothing else, changed.
# EDITED:   S319 (v0.9.195 PENDING; NOT yet walked on the workstation).
#           SECTION 8 RE-PINNED: jconvert(to = "spss") no longer refuses a
#           column with four markers -- since 0.9.195 it declares the codes
#           as a missing-value RANGE (the S318 ruling; missing_convention_walk
#           Section 43 has the shapes) -- so the first render is a
#           conversion, not a refusal, and its old Expected ("resolution
#           option 1 ... vars = c(...)") no longer applies to it. The
#           section's point stands on the second render: the 26-marker cap
#           still prints the placeholder line, and it is still runnable once
#           filled. The spss-side placeholder survives in the two-problem
#           frame (a collision beside a single-code or zero-reach refusal),
#           which Section 43 of the missing-convention walk renders; not
#           repeated here. Rendered in the sandbox at the pinned 76.
# EDITED:   S269 (v0.9.151) -- annotation only, no Expected changed. The
#           Section 6 DEFECT block records the .xpt minimal tier as FIXED
#           and carries the new render; this run is its live confirmation.
# EDITED:   S268 (v0.9.150; WALKED, dirty entry). THE S267 RE-PIN PASS, two
#           sites, both rebuilt by reading the CURRENT source rather than
#           transcribed from a render -- repaired but UNVERIFIED.
#           (1) Section 6: S267 took all three jsave minimal tiers from
#           the S230 Rule E split to RULE L, so the remedy is now an
#           intro clause plus an indented runnable line rather than two
#           prose sentences. The bullet describing them said Rule E and
#           now says what to check instead -- chiefly that a minimal
#           tier and its standard sibling should look like one message
#           at two lengths.
#           (2) Section 7: the .sav over-cap block was redrafted into the
#           shared over-cap family form (with jconvert's spss-cap and
#           26-cap, both in Section 8). The convert-then-save pair this
#           section exists to protect SURVIVES verbatim and still
#           composes; everything around it is new, including a third
#           alternative (.rds) that now leads. WALKED the same session:
#           the shape confirmed, one correction -- the Expected had
#           omitted the "jsave(): " prefix, which moves the head's wrap.
#           DEFECT FOUND, package-side, logged at Section 6 and NOT
#           fixed here: the .xpt MINIMAL tier says "to drop them" twice
#           in one sentence, the second clause a verbless fragment.
#           Collateral from S267's own Rule L conversion of the three
#           minimal tiers. No assertion reads that string and the
#           standard tier beside it is clean, so nothing but a human
#           reading the six renders together would have caught it.
#           NOT AFFECTED, checked and left alone: the durability note in
#           Section 10, which already carries the S267 blank between its
#           two halves; and the vars = c(...) placeholder in Section 8,
#           which is a REAL jconvert argument and still renders. An
#           earlier reading of this pass flagged that placeholder as
#           stale by confusing it with the durability plural echo, a
#           different site that names its columns -- recorded here
#           because the same confusion is easy to repeat.
#           COVERAGE GAP: CLOSED AT S282. Section 10 now makes a
#           two-column declare (Rating and Contact) directly below the
#           one-column beat, so both echoed lines can be read for the
#           plural. Expected rendered in the sandbox at the pinned 76
#           against the 0.9.158 master, then walked.
# EDITED:   S283 (v0.9.159; WALKED the same session on the workstation,
#           end marker reached; jai rendered v3.7 against the installed
#           0.9.159 and matched the five-point read). The jai section's stamp
#           re-pinned v3.6 -> v3.7 for the S283 orientation rewrite, and
#           its Expected gains a five-point read of the rewrite (the
#           retired UDM sites, the new convention bullet, the scoped
#           mean() clause, the E16 precondition). Nothing else changed:
#           the modify-form beats this file exists to lock are untouched.
# EDITED:   S282 (v0.9.158). Two items, both carried since S268.
#           (1) The durability plural beat above -- the last of the six
#           coverage gaps the S268 pass identified and deferred.
#           (2) The two bare globals this file assigned into the caller's
#           workspace are now dot-prefixed: walk_dir -> .walkdir (six
#           sites) and tmp -> .tmpout (eight). The rename is not cosmetic:
#           the missing-convention walk's WALKDIR clobbered a variable of
#           that name during the S268 capture session, and these two had
#           the same habit in lowercase. .tmpout rather than .tmp because
#           the value is an output PATH STEM, not a directory, and the
#           old name said neither. fx() in the missing-convention walk is
#           still a bare global with ten call sites; left alone.
#           NOT RE-VERIFIED BEYOND THE NEW BEAT: this file was last walked
#           at v0.9.152 (S271), six versions back, so its S282 walk is
#           also its re-stamp and may surface staleness unrelated to
#           either item. Its open jai() finding (retired "UDM" vocabulary
#           in runtime output, source ~404 and ~450) remains a separate
#           to-do and is not addressed here.
# EDITED:   S266 (v0.9.149; not yet re-run). Setup restructured, awaiting
#           this file's next capture -- run DIRTY per the S259 convention
#           (width and convention set to non-default values by hand before
#           sourcing). The width pin is HOISTED above the reset chatter it
#           used to trail, and the S247 "none" convention pin becomes the
#           full record/force/restore shape: entering value captured, the
#           force a silent options() call (no settings echo in Setup), and
#           the foot restoring the entering value instead of hard-clearing
#           to "none". No Expected changes; every fixture jload still runs
#           under the "none" pin exactly as before.
# S294 EDIT (v0.9.167, 2026-09-14): the Setup reset line moved to the
#           clear.all = TRUE forms (S294 NULL flip). This file is the
#           sharpest case for the move: juse(NULL) runs FIRST, so a bare
#           f(NULL) would reach the sole-frame-or-STOP path with no default
#           to resolve against. No Expected touched; confirmed in the walk
#           below.
# LAST VERIFIED: v0.9.225, 2026-10-12 (S352) -- Sections 4, 5 and 19
#           WALKED on the WORKSTATION through receive_all() ("walked, all
#           okay"), GitHub 5c5304e (package), after the SANDBOX run (R
#           4.3.3, UTF-8 locale): every changed Expected filled by running
#           the file (fill.R), 42 of 43 blocks found in the capture
#           (Section 9's, as before), and all 19 sections through rewalk()
#           in file order, reverse order and shuffled, and by prepare =
#           TRUE; Section 19 needs no other.
#           Prior: v0.9.224, 2026-10-11 (S351) -- Sections 13-18 WALKED on
#           the WORKSTATION through receive_all() ("walked, all okay", the
#           tool's default line), GitHub 093763a (package), after the
#           SANDBOX run (R 4.3.3, UTF-8 locale): every new Expected filled
#           by running the file (fill.R), 38 of 39 blocks found in the
#           capture (Section 9's prose block, as on 0.9.223), and all 18
#           sections through rewalk() in file order, reverse order and
#           shuffled, and by prepare = TRUE; no new section needs another.
#           Prior: v0.9.213, 2026-10-05 (S339) -- Sections 11 and 12 WALKED
#           on the WORKSTATION through rewalk() (Jeff: "both walk files are
#           okay"), GitHub eb54a30, after the SANDBOX run (R 4.3.3, UTF-8
#           locale): both sections' Expected blocks found in the capture,
#           and all 12 sections through rewalk() in file order, reverse
#           order and shuffled, and by prepare = TRUE; neither new section
#           needs an earlier one.
#           Prior: v0.9.211, 2026-10-05 (S337) -- Section 1 WALKED
#           on the WORKSTATION through rewalk(), matching its
#           re-pinned Expected; the rest untouched (no package change).
#           Prior: v0.9.167, 2026-09-14 (S294) -- WALKED on the WORKSTATION,
#           end marker reached, every section matching (reset line only;
#           see the S294 EDIT note above).
#           Prior: v0.9.146, 26 August 2026 (S258) -- CAPTURED AND DIFFED
#           rather than read. This file had NO width pin until S258, so
#           its Expecteds had never been comparable between runs; the pin
#           went in first, then a cold run at 76 was diffed block by
#           block. One block was stale (Section 1's closing sentence,
#           which now takes two lines) and is re-pinned from the capture.
#           Three further blocks differ from the output only in the
#           display indent used inside the comment, which is a
#           transcription convention and was deliberately left alone.
#           NOT read for render quality this run.
#
# PRIOR:    v0.9.144, 25 August 2026 (S255) -- read end to end; all
#           ten sections green. First re-stamp since S125. THIS IS THE RUN
#           THAT CAUGHT the S255 hanging-indent regression in the scan
#           legend's bracket-tag branches: no battery reaches that branch
#           and neither does clinic_workflows_walk, so this file was the
#           only thing that would have found it. Re-read after the fix,
#           which renders the tag on its own line with the whole
#           explanation hanging at indent two.
#
# PRIOR:    v0.9.125, 11 Aug 2026 (Jeff, line-by-line + full source();
#           all ten sections green, findings below ledgered at S229)
# RUN:      line-by-line first (read each block of output before moving on).
#           Also source()-safe: deliberate errors are tryCatch-wrapped and
#           every prompting call passes overwrite = TRUE (the S220 traps).
#           Under source(), run WITH echo = TRUE, per the conventions file.
#           By section: source walk_tools.R, then rewalk("modify_form") shows
#           the sections the PENDING line names and
#           rewalk("modify_form", "1") shows one, each from a fresh Setup and
#           its NEEDS. Add prepare = TRUE to run only what the section needs and
#           step through it by hand.
# SECTIONS: independent unless a framing comment says otherwise.
# ENDING:   the file MUST end with the executable end-marker line at the foot
#           (not with comments) -- see the note down there for why.
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# WHAT TO WATCH FOR THROUGHOUT. Every suggested call should read
#
#     jconvert(df, to = "stata", modify = TRUE)          <- prescription
#
# and NOT
#
#     df <- jconvert(df, to = "stata")                   <- the old form
#
# The one exception is Section 10, where BOTH forms are correct and expected.
# A stray assignment-form suggestion anywhere in Sections 1-9 is the defect
# this file exists to catch.
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# --- Setup -------------------------------------------------------------------

# jstats must be loaded already: devtools::load_all() (development) OR
# library(jstats) (installed) -- never both in one session.
stopifnot(exists("jload", mode = "function"))

# No dataset needed: every fixture below is built in-script (fixture
# preference order #1), so this file is immune to dataset rebuilds and runs
# from any RStudio project.

# Session-state pins -- hoisted above the reset chatter at S266, per the
# S259 rule that state blocks precede the first call that produces output:
# the juse/jsubset/... confirmations and the old joptions() echo printed
# before the width pin applied (the S258 capture shows them at the entry
# width).
#
# WIDTH (S258): since v0.9.145 the shipped message.width default is "auto",
# so message output follows the console pane, and every Expected in this
# file is only meaningful at a stated width. Pinned at 76, the width the
# other regression files use; restored at the foot.
#
# CONVENTION (S266): this file has pinned "none" since S247 -- its jload
# narratives are shown in their no-convention-set case, and "none" is the
# factory state, not a fourth convention. What S266 adds is the record and
# the restore: the entering value was never captured, so the old foot's
# hard "none" clear handed every next session a cleared slot regardless of
# what it arrived with. The force is a silent options() call now, so Setup
# no longer echoes a settings panel.
.entry_convention    <- getOption(".jst_options_missing_convention")
.entry_message_width <- getOption(".jst_options_message_width")
.pin_width           <- 76L

options(.jst_options_missing_convention = "none")
options(.jst_options_message_width = .pin_width)

# Neutral pipeline state (never assume the prior state is clean).
juse(NULL); jsubset(clear.all = TRUE); jcomplete(clear.all = TRUE)
joutput(NULL); jdummy(clear.all = TRUE)

# Fixtures -------------------------------------------------------------------
# spss_df   two SPSS-style declared columns (numeric codes)
# stata_df  one Stata-style column (tagged NAs)
# mixed_df  one of each -- the mixed-frame narrative cases
# plain_df  undeclared codes: one labelled, one bare (the scan's two sources)

spss_df <- data.frame(
  Income    = haven::labelled_spss(c(42000, 51000, -99, -98),
                                   labels = c(Refused = -99,
                                              `Don't know` = -98),
                                   na_values = c(-99, -98)),
  Education = haven::labelled_spss(c(12, 16, -99, 14),
                                   labels = c(Refused = -99),
                                   na_values = -99)
)

stata_df <- data.frame(
  Mood = haven::labelled(c(3, 4, haven::tagged_na("a")),
                         labels = c(Refused = haven::tagged_na("a")))
)

mixed_df <- data.frame(
  Income = spss_df$Income,
  Mood   = c(stata_df$Mood, NA)
)

plain_df <- data.frame(
  Rating  = haven::labelled(c(3, 4, -99), labels = c(Refused = -99)),
  Contact = c(2, 5, -99)
)


# Write the fixtures out so the sections below can jload them -- the messages
# under review are LOAD-path messages, and driving them through a real jload
# is better evidence than calling the narrative helper directly.
.walkdir <- file.path(tempdir(), "modify_form_walk")
dir.create(.walkdir, showWarnings = FALSE)
f_spss  <- file.path(.walkdir, "clinic.rds")
f_mixed <- file.path(.walkdir, "mixed.rds")
f_plain <- file.path(.walkdir, "plain.rds")
f_susp  <- file.path(.walkdir, "susp.rds")
invisible(jsave(spss_df,             f_spss,  overwrite = TRUE))
invisible(jsave(mixed_df,            f_mixed, overwrite = TRUE))
invisible(jsave(plain_df,            f_plain, overwrite = TRUE))
invisible(jsave(plain_df["Contact"], f_susp,  overwrite = TRUE))


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 1 -- jload narrative, Case 1: uniform SPSS, no convention set ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The single most-seen suggestion in the package: it fires on essentially
# every load of SPSS-declared data.

joptions(missing.convention = "none")
jload(f_spss, name = "clinic", overwrite = TRUE, missing.notice = TRUE)

# Expected, as the last two lines:
#   To make them missing in base R as well, convert:
#     jconvert(clinic, to = "stata", modify = TRUE)
# RE-PINNED S337 from a capture: the remedy is a head line ending in a colon
# and the call on a line of its own, indented two spaces. This block showed
# the earlier form, one sentence ending in a period ("..., run
# jconvert(...)."); the workstation's own cap_modify.txt already had the
# form above. The head stays ONE line on purpose: a second head line
# separates it from its block and hides the block from the next audit.
# Things to look at:
#   - the line is runnable as printed -- no "clinic <- " scaffold
#   - the call sits on a line of its own, with no period after it
#   - the frame name in the call is the LOADED name (clinic), not the name
#     the fixture had when it was saved
# NOTE the explicit missing.notice = TRUE: the first UDM notice in a session
# uses the full form, later showings go COMPACT and drop exactly this
# guidance tail (S227 E17 design). Without the flag, this section only
# shows its Expected line in a fresh session -- the S229 review's
# full-file re-source hit precisely that.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 2 -- jload narrative, Case 4: uniform SPSS, setting says stata ----
# NEEDS: 1
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Two equal-standing remedies. Only the SECOND is a data-changing call, so
# only the second should carry modify = TRUE; the joptions line is a settings
# call and is untouched by this pass.

joptions(missing.convention = "stata")
jload(f_spss, name = "clinic", overwrite = TRUE)

# Expected, the two remedy blocks (S230 Rule L form):
#   To use SPSS-style missing values, run:
#     joptions(missing.convention = "spss")
#   To use Stata-style missing values, run:
#     jconvert(clinic, to = "stata", modify = TRUE)
# Things to look at:
#   - each runnable call on its own two-space-indented line, no trailing
#     period (Rule L); the joptions call still carries no modify = TRUE
#     (a settings call)
#   - the two blocks still read as equal-standing, neither recommended


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 3 -- jload narrative, Cases 6 and 7: mixed frames ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The align lines carry BOTH the converted call and the joptions rider. Watch
# that adding modify = TRUE did not disturb the line break before "and".

joptions(missing.convention = "spss")
cat("--- Case 7 (mixed frame, convention explicitly set) ---\n")
jload(f_mixed, name = "clinic", overwrite = TRUE)

joptions(missing.convention = "none")
cat("\n--- Case 6 (mixed frame, no convention set) ---\n")
jload(f_mixed, name = "clinic", overwrite = TRUE)

# Expected, in both cases, align blocks of the shape (S230 Rule L form --
# the "\nand" break is retired):
#   To use Stata-style missing values throughout, run both:
#     jconvert(clinic, to = "stata", modify = TRUE)
#     joptions(missing.convention = "stata")
# Things to look at:
#   - no line breaks inside any call, at any console width
#   - Case 7's setting-matching block is "run:" with ONE indented call and
#     no rider; every off-setting block is "run both:" with the joptions
#     rider as its second indented call (Case 6 has no setting, so BOTH of
#     its blocks are "run both:")


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 4 -- the scan's declare suggestion (jload's other big surface) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Undeclared codes, so the scan runs rather than the narrative.

# RE-PINNED S352 (v0.9.225; ruling R15, Jeff, S347: "that's what I want").
# With no convention selected -- this walk's state -- the line stopped at
# the choose-first gate, so the menu now comes first ("this code cannot be
# declared yet"), then "Then, to declare one variable's codes as missing:"
# and the line. With a convention selected the block is as it was. The pin
# had quoted the line alone; it is now the call's whole output, filled by
# running.

jload(f_plain, name = "clinic", overwrite = TRUE)

# Expected:
#   Loaded clinic (R native format; 3 cases, 2 variables)
#
#   Missing-value codes detected:
#     Rating:   -99 "Refused" (1)  [label-only -- not formally declared]
#     Contact:  -99 (1)            [suspected -- not formally defined]
#
#   [label-only -- not formally declared]:
#     not automatically treated as NA, but the value labels suggest they mark
#     missing values.
#     Declare them as missing if they are; leave as-is if real.
#   [suspected -- not formally defined]:
#     not automatically treated as NA.
#     Declare them as missing if they are; leave as-is if real.
#
#   No missing-value convention is selected, so this code cannot be
#   declared yet.
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
#   Then, to declare one variable's codes as missing:
#     jdeclare_missing(clinic, Rating, codes = -99, modify = TRUE)
# Things to look at:
#   - the menu, then the line, which runs once a convention is chosen
#   - "this code" in the menu's head, beside the block's "codes" (the
#     wording R15 left to the build)
#   - the label-only variable (Rating) is the example target, not Contact


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 5 -- the scan's commented label-at-the-same-time example ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The second, commented example fires only when the target is a SUSPECTED
# (unlabelled) variable, so this fixture holds only the bare-code column.

# RE-PINNED S352 (v0.9.225; ruling R15): the menu first, as in Section 4.
# The pin quoted the second line in its pre-S267 commented form; it is now
# the call's whole output, filled by running.

jload(f_susp, name = "clinic", overwrite = TRUE)

# Expected:
#   Loaded clinic (R native format; 3 cases, 1 variable)
#
#   Suspected missing-value codes detected:
#     Contact:  -99 (1)
#
#   These codes are not formally defined, so they are not treated as missing.
#   Declare them as missing if they are; leave as-is if real.
#
#   No missing-value convention is selected, so this code cannot be
#   declared yet.
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
#   Then, to declare one variable's codes as missing:
#     jdeclare_missing(clinic, Contact, codes = -99, modify = TRUE)
#   To declare and label them in one call, replacing the placeholder names:
#     jdeclare_missing(clinic, Contact, codes = c("label1" = -99),
#         modify = TRUE)
# Things to look at:
#   - the second line, with placeholder labels, is uncommented and runs
#     as printed once a convention is chosen


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 6 -- jsave pre-flight refusals (.dta, .sav, .xpt) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Three separate builders, each with a minimal and a standard tier. All are
# errors, so all are wrapped.

show <- function(label, expr) {
  cat("\n--- ", label, " ---\n", sep = "")
  tryCatch(expr, error = function(e) cat(conditionMessage(e), "\n", sep = ""))
}

.tmpout <- file.path(tempdir(), "walk_out")

joutput("standard")
show(".dta refusal (SPSS-style codes cannot go to Stata format)",
     jsave(spss_df, paste0(.tmpout, ".dta"), overwrite = TRUE))
show(".sav refusal (Stata-style markers cannot go to SPSS format)",
     jsave(stata_df, paste0(.tmpout, ".sav"), overwrite = TRUE))
show(".xpt refusal (no extended missings in the SAS interchange format)",
     jsave(spss_df, paste0(.tmpout, ".xpt"), overwrite = TRUE))

joutput("minimal")
show(".dta refusal, MINIMAL tier",
     jsave(spss_df, paste0(.tmpout, ".dta"), overwrite = TRUE))
show(".sav refusal, MINIMAL tier",
     jsave(stata_df, paste0(.tmpout, ".sav"), overwrite = TRUE))
show(".xpt refusal, MINIMAL tier",
     jsave(spss_df, paste0(.tmpout, ".xpt"), overwrite = TRUE))
joutput(NULL)

# Expected: each of the six carries a convert recipe in the form
#   jconvert(spss_df, to = "stata", modify = TRUE)
#
# UPDATED S268 for S267, and the change is to the SHAPE of all three
# minimal tiers, not to their words. S230 had split them per Rule E --
# the incompatibility sentence and the remedy sentence each starting
# their own line, as running prose. S267 took all three to RULE L
# instead: the remedy is now an intro clause ending in a colon with the
# runnable call on its own two-space-indented line beneath it. That is
# the same shape the standard tiers already used, so the six renders in
# this section should now differ in DETAIL but not in silhouette.
#
# NOT TRANSCRIBED FROM A RENDER. This section describes its Expected at
# summary level rather than pinning six literal blocks, which is why the
# repair here is a description rather than six re-pins -- but it also
# means the run has more to check than usual.
#
# Things to look at:
#   - THE MAIN CHECK: read a minimal tier and its standard sibling back
#     to back. After S267 they should look like the same message at two
#     lengths. If the minimal one still reads as a different shape
#     rather than a shorter one, the alignment did not land.
#   - the three minimal tiers against EACH OTHER. S267 aligned the
#     refusal trio deliberately; three builders drifting apart again is
#     the failure mode that pass was fixing.
#
# DEFECT FOUND BY THE S268 RUN -- FIXED S269 (v0.9.151), package-side.
# The .xpt MINIMAL tier HAD rendered:
#
#   To drop them, run the conversion below; to drop them, or save as SPSS format
#   (.sav) to preserve them.
#     jconvert(spss_df, to = "baseR", modify = TRUE)
#
# "to drop them" twice in one sentence, the clause after the semicolon
# left verbless. Collateral from S267's own Rule L conversion of the
# three minimal tiers: the edit that lifted the runnable line out of the
# old Rule E prose left the original opening clause standing ahead of
# the rewritten one. S269 checked the OTHER two minimal tiers and both
# were clean -- .xpt alone carried a branching tail written as a
# continuation of the old head, so every one of its three branches was
# affected, not just the one this section renders.
#
# IT NOW RENDERS (transcribed from a render through the real emitter at
# width 76, not predicted):
#
#   jsave(): 2 variables contain missing-value codes, incompatible with
#   the .xpt format.
#   To preserve them, save as SPSS format (.sav). To drop them:
#     jconvert(spss_df, to = "baseR", modify = TRUE)
#
# The preserve advice moved AHEAD of the remedy so the colon sits
# directly above the runnable line -- which is what the .dta and .sav
# minimal tiers already did. The three now share one silhouette, so the
# summary description above is finally true of all three. The 79-column
# overrun was a symptom of the duplication and should be gone with it.
#
# WHAT THIS RUN CONFIRMS. The block above is the has_spss branch. The
# tagged-only branch substitutes Stata format (.dta); the both-forms
# branch reads "To preserve them, convert them to one form with
# jconvert() and save as SPSS format (.sav) or Stata format (.dta). To
# drop them:" and wraps once. This walk is where the fix meets the LIVE
# path: S269's evidence was the builder called through .jst_stop() in a
# sandbox, which cannot prove jsave() reaches it with these arguments.
#
# Note what caught it. No assertion in the suite reads this string, the
# standard tier next to it is fine, and S267's own workstation run did
# not reach here. It surfaced only because a human walkthrough put the
# six renders side by side -- which is the argument for this file.
#   - no wrap ever lands inside a jconvert(...) call
#   - the .xpt message's "convert them to one form with jconvert()" is a BARE
#     reference, not a suggested call, and is correctly left alone


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 7 -- the .sav UDM-limit refusal (a two-step recipe) ----
# NEEDS: 6
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Resolution option 2 is a convert THEN a save. The two lines have to compose:
# if the convert did not carry modify = TRUE, the jsave on the next line would
# silently write the unconverted frame.

over_df <- data.frame(
  X = haven::labelled(c(1, 2, -99, -98, -97, -96),
                      labels = c(a = -99, b = -98, c = -97, d = -96))
)
over_df$X <- haven::labelled_spss(unclass(over_df$X),
                                  labels = c(a = -99, b = -98, c = -97, d = -96),
                                  na_values = c(-99, -98, -97, -96))

show(".sav UDM-limit refusal (4 codes, cap is 3)",
     jsave(over_df, paste0(.tmpout, ".sav"), overwrite = TRUE))

# Expected -- the WHOLE block, redrafted S267 into the shared over-cap
# family form:
#   jsave(): SPSS format (.sav) allows at most 3 declared missing values
#   per variable, or a range plus one code.
#
#   This variable in over_df has more:
#     X: 4 codes
#
#   To save in R format (.rds) instead, keeping all the codes:
#     jsave(over_df, "over_df.rds")
#   To convert to Stata and save as Stata format (.dta), also keeping all
#   the codes:
#     jconvert(over_df, to = "stata", modify = TRUE)
#     jsave(over_df, "over_df.dta")
#   Or reduce each variable's declared missing values to fit.
#
# RE-PINNED S268 for S267. The two lines this section was built to watch
# SURVIVE verbatim -- they are still adjacent, still in that order, and
# still compose. What changed is everything around them. The old
# Expected pinned the pair alone; the block now opens with a generic
# capability sentence, names the offending variables in an indented
# list, and offers THREE alternatives rather than two, each with its own
# intro. The .rds route is new here and leads, because it is the one
# option that loses nothing.
#
# One of three blocks S267 brought to a single family form (the other
# two are jconvert's spss-cap and 26-cap, exercised in Section 8). The
# point of the family treatment is that a user who meets one of them and
# later meets another should recognize the shape.
#
# SHAPE CONFIRMED by the S268 run, with ONE correction. The blank
# lines, the singular "This variable in over_df has more:" lead, the
# indented "X: 4 codes", the three remedies and their order, and the
# two-line "To convert to Stata" intro all render as assembled. What was
# wrong was the first line: the predicted Expected omitted the
# "jsave(): " prefix, and with those nine columns back in place the head
# wraps after "missing values" rather than after "per". Same root cause
# as the five mispredicted breaks in missing_convention_walk -- the
# prefix reserve was not counted.
#
# Things to look at:
#   - read the convert-then-save pair as a user would: run line 1, then
#     line 2. They compose, and that is the property this section has
#     always existed to protect -- confirm S267's redraft did not break
#     it while rearranging everything around it.
#   - three alternatives now, not two. Does the .rds option leading read
#     as the obvious first answer, or does its arriving first bury the
#     .dta route most users actually want?
#   - the closing "Or reduce ..." states a requirement and names no
#     method (Rule X). Is that a helpful boundary or a dead end?


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 8 -- jconvert's own pre-flight refusals (the placeholder lines) ----
# NEEDS: 6
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# These are the "leave as shapes or make them runnable" sites (sub-question 2,
# settled S229: make them runnable). The c(...) stays a blank the user fills;
# everything around it is now correct.

# S319: a column with more markers than codes is CONVERTED, its codes
# declared as a range from the first convention code, so this render is no
# longer a refusal. It stays as the section's contrast: the same fixture
# that met the cap for five sessions now converts, and the range note says
# why a range was used.
tag4 <- c("a", "b", "c", "d")
over_stata_df <- data.frame(
  X = haven::labelled(
    c(1, 2, vapply(tag4, haven::tagged_na, numeric(1))),
    labels = stats::setNames(vapply(tag4, haven::tagged_na, numeric(1)),
                             paste0("code_", tag4)))
)
show("jconvert to SPSS, four markers (a range since S319; was the 3-UDM cap refusal)",
     jconvert(over_stata_df, to = "spss"))

# The Stata cap is 26 markers (.a-.z), so this fixture declares 27.
codes27 <- seq(-99, by = -1, length.out = 27)
many_df <- data.frame(Y = c(1:3, codes27))
many_df$Y <- haven::labelled_spss(
  many_df$Y,
  labels = stats::setNames(codes27, paste0("c", seq_along(codes27))),
  na_values = codes27)
show("jconvert to Stata, over the 26-marker cap",
     jconvert(many_df, to = "stata"))

# Expected, first render (S319): a conversion, one row per marker, the range
# row last, and the note:
#   Converted to SPSS-style missing values in 1 variable:
#     X  .a ["code_a"]  -> -99
#        .b ["code_b"]  -> -98
#        .c ["code_c"]  -> -97
#        .d ["code_d"]  -> -96
#        range -99 to -96
#
#   Note: X has 4 lettered markers, more than the 3 separate missing-value codes
#   SPSS allows, so its codes were declared as a missing-value range.
#
#   This call changes over_stata_df only if you assign the result:
#     over_stata_df <- jconvert(over_stata_df, ...)
#
#   To change over_stata_df directly, rerun with modify = TRUE:
#     jconvert(over_stata_df, ..., modify = TRUE)
#
# Expected, second render, resolution option 1:
#   jconvert(many_df, to = "stata", vars = c(...), modify = TRUE)
# Things to look at:
#   - c(...) is still plainly a blank to fill -- that is deliberate
#   - but everything else is correct, so filling it yields a working call
#   - the first render's durability note shows both forms (a REPORT on a
#     call that ran, Rule S's S229 corollary), as Section 10 explains


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 9 -- the two jdeclare_missing errors and the jrecode convention ----
#              error
# NEEDS: 8
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

joptions(missing.convention = "spss")

show("jdeclare_missing: Stata token against an SPSS-declared column",
     jdeclare_missing(spss_df, Income, codes = c(Refused = haven::tagged_na("a"))))

show("jdeclare_missing: codes mixes tagged and numeric (two suggested calls)",
     jdeclare_missing(spss_df, Income,
                  codes = c(Refused = haven::tagged_na("a"), DK = -98)))

show("jrecode: map uses a Stata marker under SPSS convention",
     jrecode(spss_df, Income, map = "42000=.a"))

# S247: the "none" reset that used to sit here is GONE, and the Section 9
# setting above carries through to Section 10. Nothing runs between here and
# there, so the reset had nothing to protect -- while Section 10 needs a
# chosen convention (its plain_df fixture is deliberately undeclared, so the
# S244 gate would stop both declares before they reach the durability note
# they exist to show). Re-setting "spss" in Section 10 instead would work but
# would fire a second frame-scan nudge block directly above the output a
# reader is meant to be studying.

# Expected:
#   - error 1 ends with:  jconvert(spss_df, to = "stata", modify = TRUE)
#   - error 2 shows TWO jdeclare_missing lines, both with modify = TRUE, read as
#     "run this, then run that" -- they now compose, as in Section 7
#   - error 3's jrecode( recipe line is UNCHANGED (jrecode returns a vector
#     and is outside the modify family); only its jdeclare_missing follow-up line
#     gained modify = TRUE
# Things to look at:
#   - error 3 is the mixed case worth reading closely: one line without
#     modify = TRUE (jrecode, correct) directly above one with it
#     (jdeclare_missing, correct). That juxtaposition is intentional.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 10 -- THE TWO SITES THAT KEEP BOTH FORMS ----
# NEEDS: 9
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Everything above should show modify = TRUE alone. These two should NOT --
# they are reports, not prescriptions, and both forms are correct here.

cat("--- the durability note, default branch (the call already ran) ---\n")
d1 <- jdeclare_missing(plain_df, Rating, codes = c(Refused = -99))

# Expected: BOTH forms, in this order:
#   This call changes plain_df only if you assign the result:
#     plain_df <- jdeclare_missing(plain_df, Rating, ...)
#
#   To change plain_df directly, rerun with modify = TRUE:
#     jdeclare_missing(plain_df, Rating, ..., modify = TRUE)
# Why: the assignment line rescues THIS call; the modify line is the better
# next one. Removing either would leave the user without a way to keep the
# work just done.

cat("\n--- the durability note, TWO columns (the plural echo) ---\n")
d1b <- jdeclare_missing(plain_df, Rating, Contact, codes = c(Refused = -99))

# ADDED S282, closing the COVERAGE GAP this file's header has recorded since
# S268: the echoed call rebuilds the variables the user named, and no
# section here named more than one, so the plural render had never been
# seen. The S267 change it witnesses is that BOTH echoed lines list every
# column rather than only the first.
#
# Expected: the same two forms, both echoing BOTH columns:
#   Declared SPSS-style missing values on 2 variables:
#     Rating, Contact
#     -99 ["Refused"]
#
#   This call changes plain_df only if you assign the result:
#     plain_df <- jdeclare_missing(plain_df, Rating, Contact, ...)
#
#   To change plain_df directly, rerun with modify = TRUE:
#     jdeclare_missing(plain_df, Rating, Contact, ..., modify = TRUE)
#
# (Sandbox-rendered against the v0.9.158 master at S282, at the pinned 76,
# then confirmed by the S282 workstation walk.)
#
# Things to look at:
#   - THE POINT OF THE BEAT: "Rating, Contact" appears in BOTH echoed lines.
#     If either shows only Rating, the echo has dropped back to the first
#     variable and a user pasting it would silently declare one column of
#     the two they asked for -- a wrong result that looks like a right one.
#   - The status line above the note switches to the counted form ("on 2
#     variables:" with the names on their own line) while the note keeps
#     the columns inline. Two different renderings of the same list, three
#     lines apart. Judge whether that reads as each doing its own job or as
#     an inconsistency.
#   - Contact is a PLAIN numeric column and Rating is already labelled, so
#     this also quietly shows the declare applying across both kinds in one
#     call. Nothing in the note distinguishes them; check that it should
#     not have to.

cat("\n--- the durability note, modify branch ---\n")
plain_df2 <- plain_df
invisible(jdeclare_missing(plain_df2, Rating, codes = c(Refused = -99),
                       modify = TRUE))

# Expected: NEITHER form -- just the cross-session jsave tip. The change has
# already landed on the frame, so saving is the only next rung.

cat("\n--- the jai orientation body (v3.7) ---\n")
jai()

# Expected, in the bullet beginning "Analysis functions print their results":
#   ... take `modify = TRUE` to apply the change directly
#   (`jdeclare_missing(df, ..., modify = TRUE)`) -- the form jstats teaches.
#   They also return the changed data frame, so assigning back
#   (`df <- jdeclare_missing(df, ...)`) works as well.
# Things to look at:
#   - modify = TRUE now comes FIRST and is marked as the taught form
#   - the assignment form is still present (an assistant has to recognize it
#     in your code) but is now clearly secondary
#   - the version stamp reads v3.7, not v3.6. If it still says 3.6, the
#     orientation bump did not land.
#
# S283 (v3.7): the retired-vocabulary finding this file carried since S268
# is CLOSED. Read the body for these, all in the S283 rewrite:
#   - "UDM" appears NOWHERE (it stood twice: the intro's "user-defined
#     missing values (UDM)" and the stray-codes bullet's "declared UDM
#     codes"); the intro now says "declared missing values".
#   - a NEW bullet precedes the stray-codes one: choose a convention once
#     per session, stata recommended WITH its reason (the P6 rationale the
#     choose-first gate's menu already carries: markers are true NAs in
#     base R, so base R and AI-generated code get right answers). Before
#     S283 jai() never mentioned the setting, so its own recommended
#     jdeclare_missing() call gated in a fresh session.
#   - the "base functions such as mean() ... wrong answers" clause is now
#     scoped to SPSS convention; it was stated unconditionally, and is
#     false under stata/sas.
#   - the stray-codes bullet carries the E16 precondition: the codes must
#     already be present in the data, and NA itself cannot be declared.
#   - "argument" still appears (this bullet and two others): whether Rule B
#     reaches jai() is an open scope question, deliberately not taken here.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 11 -- the durability note on a call with many variables ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S339 (v0.9.213; the S298 item, with S292 site 1). The note's two
# lines listed EVERY variable of the call. The field project's bulk call --
# vars = decl, 52 names -- got two lines of some 1,300 characters each,
# with the 52 names where the user had typed vars = decl. The lines end in
# the template's "..." and are never wrapped, so they were correct and
# unusable. Three forms now, the first that applies:
#     vars = as the call typed it      when the call gave vars = and it fits
#     every name                       three or fewer, and they fit
#     nothing: f(d, ...)               otherwise
# A list is never shown IN PART. Section 10's plural beat is the reason:
# a line naming the first few of fourteen variables, completed and run,
# would declare on those few and look like it had done the job.
joptions(missing.convention = "spss", quiet = TRUE)

many_q <- as.data.frame(stats::setNames(
  replicate(14, c(3, 4, -99), simplify = FALSE),
  sprintf("item_%02d", 1:14)))

cat("--- vars = given as a name: shown as typed ---\n")
q_names <- names(many_q)
d11a <- jdeclare_missing(many_q, vars = q_names, codes = c(Refused = -99))

# Expected:
#   Declared SPSS-style missing values on 14 variables:
#     item_01, item_02, item_03, item_04, item_05, item_06, item_07, item_08,
#     item_09, item_10, item_11, item_12, item_13, item_14
#     -99 ["Refused"]
#
#   This call changes many_q only if you assign the result:
#     many_q <- jdeclare_missing(many_q, vars = q_names, ...)
#
#   To change many_q directly, rerun with modify = TRUE:
#     jdeclare_missing(many_q, vars = q_names, ..., modify = TRUE)

cat("\n--- four names typed out: none shown ---\n")
d11b <- jdeclare_missing(many_q, item_01, item_02, item_03, item_04,
                         codes = c(Refused = -99))

# Expected:
#   Declared SPSS-style missing values on 4 variables:
#     item_01, item_02, item_03, item_04
#     -99 ["Refused"]
#
#   This call changes many_q only if you assign the result:
#     many_q <- jdeclare_missing(many_q, ...)
#
#   To change many_q directly, rerun with modify = TRUE:
#     jdeclare_missing(many_q, ..., modify = TRUE)

cat("\n--- three names typed out: all three, as in Section 10 ---\n")
d11c <- jdeclare_missing(many_q, item_01, item_02, item_03,
                         codes = c(Refused = -99))

# Expected:
#   Declared SPSS-style missing values on 3 variables:
#     item_01, item_02, item_03
#     -99 ["Refused"]
#
#   This call changes many_q only if you assign the result:
#     many_q <- jdeclare_missing(many_q, item_01, item_02, item_03, ...)
#
#   To change many_q directly, rerun with modify = TRUE:
#     jdeclare_missing(many_q, item_01, item_02, item_03, ..., modify = TRUE)

options(.jst_options_missing_convention = "none")
rm(many_q, q_names, d11a, d11b, d11c)

# Things to look at:
#   - The declaration block still names every variable (it is wrapped
#     prose); only the two runnable lines are short.
#   - "many_q <- jdeclare_missing(many_q, ...)": the "..." now stands for
#     the whole call. Does it read as "run your call again, assigned", or
#     does a line with no variable in it read as incomplete?
#   - Three names shown and four not is a cliff. The alternative was a
#     list cut at three with "..." after it, which is the line Section 10
#     warns about. Right trade?
#   - With vars = typed as a name the line is one the user could complete
#     and run as it stands, which the 52-name version was not.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 12 -- the data given as an expression, or as a place ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S339 (v0.9.213; the S219 item, findings 2 and 5). The note builds
# its assignment line by putting the data argument on both sides of an
# arrow. With a data frame's name that is a line to run. With a call it was
# not R at all:
#     mk12() <- jconvert(mk12(), ...)
# and the modify = TRUE line under it named a call the function refuses
# (modify = TRUE needs a name). Three cases now:
#     a name (or the juse() default)   both lines, as before
#     a place: lst12$d                 the assignment line alone -- a result
#                                      CAN be assigned to it, but modify =
#                                      TRUE cannot write to it
#     any other expression: mk12()     one line, assigning to a new name
joptions(missing.convention = "spss", quiet = TRUE)
mk12  <- function() plain_df
lst12 <- list(d = plain_df)

cat("--- jdeclare_missing() on a call ---\n")
d12a <- jdeclare_missing(mk12(), Rating, codes = c(Refused = -99))

# Expected:
#   Declared SPSS-style missing values on Rating:
#     -99 ["Refused"]
#
#   The result is kept only if you assign it to a name:
#     mydata <- jdeclare_missing(mk12(), Rating, ...)

cat("\n--- jconvert() on a call ---\n")
mkc12 <- function() spss_df
d12b <- jconvert(mkc12(), to = "baseR")

# Expected:
#   Stripped the missing-value declarations from 2 variables:
#     Income     -99 ["Refused"]
#                -98 ["Don't know"]
#     Education  -99 ["Refused"]
#
#   The result is kept only if you assign it to a name:
#     mydata <- jconvert(mkc12(), ...)

cat("\n--- a place: an element of a list ---\n")
d12c <- jdeclare_missing(lst12$d, Rating, codes = c(Refused = -99))

# Expected:
#   Declared SPSS-style missing values on Rating:
#     -99 ["Refused"]
#
#   This call changes lst12$d only if you assign the result:
#     lst12$d <- jdeclare_missing(lst12$d, Rating, ...)

# The refusal for a call that names no variables (finding 5). Its example
# line named the call's data frame beside two invented variables; an
# example names MyData (voice Rule AC). The names() line is built from the
# call and keeps the data frame it named, unless that was an expression --
# names(mk12()) would run the call a second time for a throwaway copy's
# names.
cat("\n--- no variables: a name, then a call ---\n")
try(jdeclare_missing(plain_df, codes = -99))
try(jdeclare_missing(mk12(), codes = -99))

# Expected:
#   Error : jdeclare_missing(): specify at least one variable to declare on:
#   unquoted names (for example jdeclare_missing(MyData, Age, Income,
#   codes = c(-99))) or quoted names via vars = c(...).
#   To apply one declaration to every column, pass
#   vars = names(plain_df) explicitly.
#   Error : jdeclare_missing(): specify at least one variable to declare on:
#   unquoted names (for example jdeclare_missing(MyData, Age, Income,
#   codes = c(-99))) or quoted names via vars = c(...).
#   To apply one declaration to every column, pass
#   vars = names(MyData) explicitly.

options(.jst_options_missing_convention = "none")
rm(mk12, mkc12, lst12, d12a, d12b, d12c)

# Things to look at:
#   - "The result is kept only if you assign it to a name:" over
#     "mydata <- jdeclare_missing(mk12(), Rating, ...)". mydata is the
#     name the modify = TRUE refusal already uses for the same advice.
#     Does it read as a placeholder to replace?
#   - No modify = TRUE line follows either of the first two: there is no
#     name for it to write to.
#   - THE PLACE: lst12$d gets its own assignment line and no modify line.
#     Running that line with the "..." filled in does land the declaration
#     in the list (missing_convention_check.R N81ag runs it).
#   - THE REFUSAL, both runs: "MyData" in the example; "names(plain_df)" in
#     the first and "names(MyData)" in the second. Two different rules on
#     neighbouring lines -- does the second run's pair read as consistent?


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 13 -- jload() and jsave() given something that is not a file ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S351 (v0.9.224; Fix Slate 6). What each front door says when the
# argument it reads first is not a file name. Before 0.9.224:
#     jload(mydata.sav)         R's own "object 'mydata.sav' not found"
#     jload(community)          "Provide a filename, e.g. jload("mydata.sav")"
#     jload(d13)                the same, of a data frame already loaded
#     jload(system.file(...))   the same, of a call that found no file
#     jsave("t13.rds")          "... Did you mean to use it as a variable
#                               name?" (no default set)
#     jsave(z13, "x13.rds")     "'z13' is a integer, not a data frame."
#     a file name starting      "R does not allow variable names to start
#       with a digit            with a digit" (said of the DATA FRAME's name)
#     jload("x.RData")          ".RData files contain multiple named objects"
.wd13 <- getwd(); setwd(.walkdir)
writeLines(c("x", "1", "2"), "zz13.csv")
writeLines(c("x", "1"), "2024zz13.csv")
d13 <- data.frame(a = 1:3)
p13 <- ""
z13 <- 1:3
.def13 <- getOption(".jst_default_data"); options(.jst_default_data = NULL)

cat("--- a file name without its quotes ---\n")
try(jload(zz13.csv))
# Expected:
#   Error : jload(): zz13.csv is not in quotes.
#   A file name goes in quotes:
#     jload("zz13.csv")

cat("\n--- a shipped dataset's name without its quotes ---\n")
try(jload(community))
# Expected:
#   Error : jload(): the name of the community dataset goes in quotes:
#     jload("community")

cat("\n--- a data frame already in the workspace ---\n")
try(jload(d13))
# Expected:
#   Error : jload(): the d13 data frame is already loaded.
#   To save it to a file:
#     jsave(d13, "d13.rds")

cat("\n--- an empty string from a variable, then from system.file() ---\n")
try(jload(p13))
try(jload(system.file("extdata", "zz13.csv", package = "jstats")))
# Expected:
#   Error : jload(): p13 is "", an empty file name.
#   Error : jload(): system.file("extdata", "zz13.csv", package = "jstats") is
#   "", an empty file name.
#   system.file() gives "" when the file is not in the package.

cat("\n--- jsave() given a file name alone, no default set ---\n")
try(jsave("t13.rds"))
# Expected:
#   Error : jsave(): "t13.rds" is a file name, and no data frame was
#   given to save.
#   Name the data frame first:
#     jsave(MyData, "t13.rds")

cat("\n--- jsave() given a vector ---\n")
try(jsave(z13, "x13.rds"))
# Expected:
#   Error : jsave(): 'z13' is not a data frame.
#   Provide a data frame, e.g. jsave(MyData, "mydata.sav")

cat("\n--- a name starting with a digit: the file's, then one given with name = ---\n")
try(jload("2024zz13.csv"))
try(jload("zz13.csv", name = "2b"))
# Expected:
#   Error : jload(): The filename '2024zz13.csv' starts with a number.
#   R does not allow a data frame's name to start with a digit.
#   Provide a name, e.g.:
#     jload("2024zz13.csv", name = "zz13")
#   Error : jload(): The name '2b' starts with a number.
#   R does not allow a data frame's name to start with a digit.
#   Provide a name, e.g.:
#     jload("zz13.csv", name = "b")

cat("\n--- an .RData file ---\n")
try(jload("x13.RData"))
# Expected:
#   Error : jload(): .RData files can contain multiple named objects.
#   Use load("x13.RData") to load these directly.

options(.jst_default_data = .def13)
setwd(.wd13)
rm(.wd13, .def13, d13, p13, z13)

# Things to look at:
#   - EACH LINE THAT IS OFFERED RUNS (missing_convention_check.R N86a-c and
#     N86j run them): jload("zz13.csv") loads the file, jload("community")
#     the shipped dataset, jsave(d13, "d13.rds") writes the frame.
#   - The subject of each first line is what was typed: zz13.csv, p13,
#     the system.file() call (voice Rules AD and T: a data frame is "the
#     d13 data frame", never a bare name opening the sentence).
#   - jsave("t13.rds") with a default set still saves the default, as it
#     always did (N86h); this message is for no default only.
#   - "jload(""): Provide a filename" -- an empty string TYPED as such --
#     is unchanged (N86f); only an expression that came out empty is named.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 14 -- a path typed with single backslashes ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S351 (v0.9.224; the S343 item, Jeff's decision: "Let's do the
# version 1", the forward-slash form alone). Inside quoted text R reads a
# backslash and the letter after it as one special character, so
# "V:\temp\new.csv" reaches jload() holding a tab and a new line, and was
# reported as a file not found -- under a name the user never typed. Now
# jload(), jsave() and joptions(data.dir = ) stop first. An ILLEGAL escape
# (a backslash before 5, U or J) stops R itself before any function runs;
# that is the guides' Troubleshooting entry.
.wd14 <- getwd(); setwd(.walkdir)
dir.create("zz14", showWarnings = FALSE)
writeLines(c("x", "1"), file.path("zz14", "temp14.csv"))

cat("--- jload(), then jsave(), then joptions(data.dir = ) ---\n")
try(jload("V:\temp\new.csv"))
try(jsave(spss_df, "V:\temp\new.csv"))
try(joptions(data.dir = "Proj\temp"))
# Expected:
#   Error : jload(): R read the single backslashes in "V:\temp\new.csv" as
#   special characters (\t as a tab, \n as a new line).
#   Write the path with forward slashes:
#     "V:/temp/new.csv"
#   Error : jsave(): R read the single backslashes in "V:\temp\new.csv" as
#   special characters (\t as a tab, \n as a new line).
#   Write the path with forward slashes:
#     "V:/temp/new.csv"
#   Error : joptions(): R read the single backslash in "Proj\temp" as a special
#   character (\t as a tab).
#   Write the folder with forward slashes:
#     "Proj/temp"

cat("\n--- a character no letter maps back to ---\n")
try(jload("C:\1data.csv"))
# Expected:
#   Error : jload(): R read a single backslash in "C:\001data.csv" as a
#   special character.
#   Type the path again with forward slashes in place of the backslashes.

cat("\n--- the path it offers is the file meant ---\n")
try(jload("zz14\temp14.csv"))
jload("zz14/temp14.csv", name = "t14", overwrite = TRUE)
# Expected:
#   Error : jload(): R read the single backslash in "zz14\temp14.csv" as a
#   special character (\t as a tab).
#   Write the path with forward slashes:
#     "zz14/temp14.csv"
#   Loaded t14 (CSV format; 1 case, 1 variable)

setwd(.wd14)
rm(.wd14, t14)

# Things to look at:
#   - The path inside the first sentence is the path as R HOLDS it, written
#     back with its escapes ("V:\temp\new.csv"), which is what was typed;
#     the parenthesis says what each made of it.
#   - The second line offers the path alone, quoted, not a whole call: the
#     call's other arguments are the user's to keep.
#   - joptions(): "the single backslash ... a special character" -- one
#     backslash, the singular. Nothing was set, no folder was made (N86p).
#   - "C:\1data.csv": a backslash before a digit is an octal escape, and
#     \1, \01 and \001 make the same character, so no path can be offered;
#     the instruction alone.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 15 -- a frame holding a text variable with declared missing values ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S351 (v0.9.224; the S340 item). jconvert(to = "stata") refuses a
# text variable with declared missing values since v0.9.214 -- a marker is
# a kind of NA in a NUMERIC variable -- so every message that offered the
# whole-frame conversion printed a line that stopped: the load narrative's
# Cases 4, 6 and 7, jsave()'s .dta refusal (both tiers) and its .sav
# over-limit refusal. Each now offers what runs: the text variable's
# declared values made plain NA, then the rest converted, with one sentence
# saying so (the Case 1 line has offered to = "baseR" since v0.9.214); the
# .dta refusal adds jencode(), which keeps them; the over-limit refusal
# drops its Stata route, whose "also keeping all the codes" would be false.
# Visits is a labelled INTEGER (the S350 lesson).
ds15 <- data.frame(
  Source = haven::labelled_spss(c("web", "phone", "X", "web", "Y", "mail"),
                                labels = c(Refused = "X", `Don't know` = "Y"),
                                na_values = c("X", "Y")),
  Income = haven::labelled_spss(c(42000, 51000, -99, 38000, -98, 61000),
                                labels = c(Refused = -99, `Don't know` = -98),
                                na_values = c(-99, -98)),
  Visits = haven::labelled_spss(c(2L, 4L, -99L, 1L, 3L, 2L),
                                labels = c(Refused = -99L), na_values = -99L))
mx15 <- ds15
mx15$Mood <- haven::labelled(c(3, 4, haven::tagged_na("a"), 2, 1, 3),
                             labels = c(Refused = haven::tagged_na("a")))
oc15 <- data.frame(Source = ds15$Source,
                   Rating = haven::labelled_spss(c(1, 2, -99, -98, -97, -96),
                                                 labels = c(a = -99, b = -98, c = -97, d = -96),
                                                 na_values = c(-99, -98, -97, -96)))
f15  <- file.path(.walkdir, "ds15.rds"); saveRDS(ds15, f15)
fm15 <- file.path(.walkdir, "mx15.rds"); saveRDS(mx15, fm15)

cat("--- Case 4: the setting says \"stata\" ---\n")
joptions(missing.convention = "stata", quiet = TRUE)
jload(f15, name = "ds15", overwrite = TRUE, missing.notice = TRUE)
# Expected:
#   Loaded ds15 (R native format; 6 cases, 3 variables)
#
#   3 variables have SPSS-style missing values:
#     Source: X ["Refused"], Y ["Don't know"]
#     Income: -99 ["Refused"], -98 ["Don't know"]
#     Visits: -99 ["Refused"]
#   Note: these variables are SPSS-style, but your missing.convention setting
#   is "stata".
#   To use SPSS-style missing values, run:
#     joptions(missing.convention = "spss")
#   To use Stata-style missing values, run both:
#     jconvert(ds15, to = "baseR", vars = "Source", modify = TRUE)
#     jconvert(ds15, to = "stata", modify = TRUE)
#   Source is text, so the first line makes its declared values plain NA.

cat("\n--- ... and its two lines, run ---\n")
jconvert(ds15, to = "baseR", vars = "Source", modify = TRUE)
jconvert(ds15, to = "stata", modify = TRUE)
# Expected:
#   Stripped the missing-value declarations from 1 variable:
#     Source  X ["Refused"]
#             Y ["Don't know"]
#
#   To keep it across sessions, save the data frame:
#     jsave(ds15, "ds15.rds")
#   Converted to Stata-style missing values in 2 variables:
#     Income  -99 ["Refused"]     -> .a
#             -98 ["Don't know"]  -> .b
#     Visits  -99 ["Refused"]     -> .a
#
#   To keep it across sessions, save the data frame:
#     jsave(ds15, "ds15.rds")

cat("\n--- Case 7: the setting says \"spss\", the frame holds a Stata-style variable ---\n")
joptions(missing.convention = "spss", quiet = TRUE)
jload(fm15, name = "mx15", overwrite = TRUE, missing.notice = TRUE)
# Expected:
#   Loaded mx15 (R native format; 6 cases, 4 variables)
#
#   4 variables have missing values (3 SPSS-style, 1 Stata-style):
#     Source: X ["Refused"], Y ["Don't know"]
#     Income: -99 ["Refused"], -98 ["Don't know"]
#     Visits: -99 ["Refused"]
#     Mood: .a ["Refused"]
#   Note: Mood is Stata-style, but your missing.convention setting is "spss".
#   To use SPSS-style missing values throughout, run:
#     jconvert(mx15, to = "spss", modify = TRUE)
#   To use Stata-style missing values throughout, run all three:
#     jconvert(mx15, to = "baseR", vars = "Source", modify = TRUE)
#     jconvert(mx15, to = "stata", modify = TRUE)
#     joptions(missing.convention = "stata")
#   Source is text, so the first line makes its declared values plain NA.

cat("\n--- Case 6: no setting ---\n")
joptions(missing.convention = "none", quiet = TRUE)
jload(fm15, name = "mx15", overwrite = TRUE, missing.notice = TRUE)
# Expected:
#   Loaded mx15 (R native format; 6 cases, 4 variables)
#
#   4 variables have missing values (3 SPSS-style, 1 Stata-style):
#     Source: X ["Refused"], Y ["Don't know"]
#     Income: -99 ["Refused"], -98 ["Don't know"]
#     Visits: -99 ["Refused"]
#     Mood: .a ["Refused"]
#   Note: mx15 mixes SPSS-style and Stata-style missing values.
#   To use SPSS-style throughout, run both:
#     jconvert(mx15, to = "spss", modify = TRUE)
#     joptions(missing.convention = "spss")
#   To use Stata-style throughout, run all three:
#     jconvert(mx15, to = "baseR", vars = "Source", modify = TRUE)
#     jconvert(mx15, to = "stata", modify = TRUE)
#     joptions(missing.convention = "stata")
#   Source is text, so the first line makes its declared values plain NA.

cat("\n--- jsave() to Stata format, standard then minimal ---\n")
ds15 <- readRDS(f15)
try(jsave(ds15, file.path(.walkdir, "ds15.dta")))
joutput("minimal", quiet = TRUE)
try(jsave(ds15, file.path(.walkdir, "ds15.dta")))
joutput(NULL, quiet = TRUE)
# Expected:
#   Error : jsave(): 3 variables carry SPSS-style missing values, incompatible
#   with the .dta format:
#     Source, Income, Visits
#
#   Before saving to Stata format, run both:
#     jconvert(ds15, to = "baseR", vars = "Source", modify = TRUE)
#     jconvert(ds15, to = "stata", modify = TRUE)
#   Source is text, so the first line makes its declared values plain NA.
#   Or turn it into a numeric variable first with jencode().
#   Error : jsave(): 3 variables carry SPSS-style missing values, incompatible
#   with the .dta format.
#   Convert first, then save again:
#     jconvert(ds15, to = "baseR", vars = "Source", modify = TRUE)
#     jconvert(ds15, to = "stata", modify = TRUE)
#   Source is text, so the first line makes its declared values plain NA.

cat("\n--- jsave() to SPSS format, more codes than it allows, standard then minimal ---\n")
try(jsave(oc15, file.path(.walkdir, "oc15.sav")))
joutput("minimal", quiet = TRUE)
try(jsave(oc15, file.path(.walkdir, "oc15.sav")))
joutput(NULL, quiet = TRUE)
# Expected:
#   Error : jsave(): SPSS format (.sav) allows at most 3 declared missing values
#   per variable, or a range plus one code.
#
#   This variable in oc15 has more:
#     Rating: 4 codes
#
#   To save in R format (.rds) instead, keeping all the codes:
#     jsave(oc15, "oc15.rds")
#   Or reduce each variable's declared missing values to fit.
#   Error : jsave(): 1 variable has more declared missing values than SPSS
#   format (.sav) allows (at most 3, or a range plus one).
#   Save as R format (.rds) to keep all the codes, or reduce them first.

cat("\n--- jsave() to CSV format ---\n")
.wd15 <- getwd(); setwd(.walkdir)
jsave(ds15, "ds15.csv", overwrite = TRUE)
setwd(.wd15)
# Expected:
#   Note: CSV format (.csv) does not store variable labels, value labels, or
#   missing-value metadata.
#   Any SPSS-style missing-value codes are written as ordinary values and will
#   read back as valid data.
#   Alternatively, use jsave(..., preserve.declarations = FALSE) to blank them
#   to empty cells instead.

options(.jst_options_missing_convention = "none")
rm(ds15, mx15, oc15, f15, fm15, .wd15)

# The Saved line names a temporary folder, which differs on every run, so
# no Expected above pins it.
#
# Things to look at:
#   - CASE 4: the SPSS remedy is unchanged; the Stata one is the two lines
#     and the sentence under them. Read them as a pair, as Section 2 asks:
#     does the sentence read as belonging to the Stata route only?
#   - THE TWO LINES, RUN: the first strips Source's declarations, the
#     second converts Income and Visits (the integer converts too). No
#     "Skipped (value labels suggest missingness ...)" report on Source:
#     under to = "stata" or "sas" jconvert() leaves a text variable out of
#     that report now, since declaring it would only lead back to the
#     refusal (N86ax; under to = "spss" it still reports, N86ay).
#   - CASE 7 and CASE 6: "run all three:" -- the two lines and the
#     joptions() rider. Three different calls in sequence, so all three
#     are listed (voice Rule U's repeated-remedy cap is for ONE call
#     repeated).
#   - THE .dta REFUSAL ends on "Or turn it into a numeric variable first
#     with jencode()." at the standard tier only.
#   - THE .sav REFUSAL offers .rds and "reduce": no Stata route.
#   - THE CSV NOTE says "ordinary values ... valid data" -- Source's
#     declared codes are words, not -99. A frame of numbers keeps "(e.g.
#     -99) ... literal numbers" (N86aw).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 16 -- a text variable's missing cells across a save (ruling R13) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S351 (v0.9.224). Ruling R13 (Jeff, S345: "yes to your
# recommendations for R13"): SPSS, Stata and CSV formats have no missing
# value for text, so a text variable's NA is saved as blank text and comes
# back as the <blank> category, counted valid; jsave() says so, jload() does
# not change. The SAS interchange format (.xpt) and a factor in a CSV file
# lose the same way (Jeff's lean, S351). And a CSV file of ONE column lost
# its missing rows altogether (the S345 item): an empty cell there is an
# empty line, which read.csv() skips -- 8 cases saved, 6 loaded. jload()
# now keeps the empty lines of a one-column file.
.wd16 <- getwd(); setwd(.walkdir)
tx16 <- data.frame(Source = c("web", NA, "mail", NA),
                   Visits = haven::labelled(c(1L, 2L, NA, 1L), labels = c(Once = 1L)),
                   Score  = c(1.5, NA, 2, 3),
                   stringsAsFactors = FALSE)
fc16 <- data.frame(Group = factor(c("a", NA, "b")), Source = c(NA, "x", NA),
                   stringsAsFactors = FALSE)
v16  <- data.frame(Source = c("web", "phone", NA, "web", "mail", NA, "web", "phone"))

cat("--- SPSS, Stata and SAS interchange formats ---\n")
jsave(tx16, "tx16.sav", overwrite = TRUE)
# Expected:
#   Note: SPSS format (.sav) cannot store a missing value in a text variable.
#   2 missing cells in Source were saved as blank text.
#   R format (.rds) and Excel format (.xlsx) keep them missing.
jsave(tx16, "tx16.dta", overwrite = TRUE)
# Expected:
#   Note: Stata format (.dta) cannot store a missing value in a text variable.
#   2 missing cells in Source were saved as blank text.
#   R format (.rds) and Excel format (.xlsx) keep them missing.
jsave(tx16, "tx16.xpt", overwrite = TRUE)
# Expected:
#   Note: SAS interchange format (.xpt) cannot store a missing value in a
#   text variable.
#   2 missing cells in Source were saved as blank text.
#   R format (.rds) and Excel format (.xlsx) keep them missing.

cat("\n--- CSV format, a factor beside the text variable ---\n")
jsave(fc16, "fc16.csv", overwrite = TRUE)
# Expected:
#   Note: CSV format (.csv) does not store variable labels or value labels.
#
#   Note: CSV format (.csv) cannot store a missing value in a text or
#   categorical variable.
#   3 missing cells in Group (1) and Source (2) were saved as blank text.
#   R format (.rds) and Excel format (.xlsx) keep them missing.

cat("\n--- one cell ---\n")
jsave(data.frame(Source = c("web", NA)), "one16.sav", overwrite = TRUE)
# Expected:
#   Note: SPSS format (.sav) cannot store a missing value in a text variable.
#   1 missing cell in Source was saved as blank text.
#   R format (.rds) and Excel format (.xlsx) keep it missing.

cat("\n--- the .sav file read back ---\n")
jload("tx16.sav", name = "b16", overwrite = TRUE)
jfreq(b16, Source)
# Expected:
#   Loaded b16 (SPSS format; 4 cases, 3 variables)
#   Frequencies
#
#   4 Cases in the 1 Variable Pool
#
#   Source
#
#            Freq  Total %  Valid %  Cum. %
#   -------  ----  -------  -------  ------
#   <blank>    2     50.00   50.00    50.00
#   mail       1     25.00   25.00    75.00
#   web        1     25.00   25.00   100.00
#
#   Total      4    100.00
#   <blank>: 2 cells with no text.
#   They are counted as valid values, not as missing.
#   To give them a code or make them missing, use jencode().

cat("\n--- a CSV file of one column, saved and read back ---\n")
jsave(v16, "v16.csv", overwrite = TRUE)
jload("v16.csv", name = "c16", overwrite = TRUE)
jfreq(c16, Source)
# Expected:
#   Loaded c16 (CSV format; 8 cases, 1 variable)
#   Frequencies
#
#   8 Cases in the 1 Variable Pool
#
#   Source
#
#            Freq  Total %  Valid %  Cum. %
#   -------  ----  -------  -------  ------
#   <blank>    2     25.00   25.00    25.00
#   mail       1     12.50   12.50    37.50
#   phone      2     25.00   25.00    62.50
#   web        3     37.50   37.50   100.00
#
#   Total      8    100.00
#   <blank>: 2 cells with no text.
#   They are counted as valid values, not as missing.
#   To give them a code or make them missing, use jencode().

setwd(.wd16)
rm(.wd16, tx16, fc16, v16, b16, c16)

# The Saved lines name a temporary folder and are not pinned.
#
# Things to look at:
#   - THE NOTE, three lines: the format and what it cannot store; the
#     cells, and in which variable; the two formats that keep them.
#     Visits and Score lose nothing -- a missing NUMBER survives every
#     format -- and are not named.
#   - CSV: the label note, a blank line, then this note; Group (1) and
#     Source (2) with their counts, and "a text or categorical variable".
#   - ONE CELL: "1 missing cell ... was saved", "keep it missing".
#   - READ BACK: jfreq() shows Source's two cells as <blank>, valid, with
#     its footnote -- jload() unchanged, as the ruling says; the note at
#     the save is where the user learns why.
#   - THE ONE-COLUMN FILE: "8 cases" (it read 6 before 0.9.224), the two
#     empty lines back as <blank>.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 17 -- jload()'s Loaded line and the notes around it (ruling R6) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S351 (v0.9.224). THE ONE SECTION WALKED FOR RULING R6 (Jeff, S345:
# a LEADING status line gets a blank line before the first note; the
# Console shows the message stream's blank lines). The Loaded line now sits
# a blank line from a note on either side; the other sections that show a
# load (here 1-3 and 15; missing_convention_walk.R 4-11, 17, 51) changed
# that one way and were re-pinned mechanically. Shown: the narrative under
# it; a registration note and the default-frame note above it; the line
# alone; the shipped dataset's form.
.wd17 <- getwd(); setwd(.walkdir)
reg17 <- spss_df
suppressMessages(jnumeric(reg17, Education))
suppressMessages(jsave(reg17, "reg17.rds", overwrite = TRUE))

cat("--- the narrative under it ---\n")
jload("clinic.rds", name = "r17", overwrite = TRUE, missing.notice = TRUE)
# Expected:
#   Loaded r17 (R native format; 4 cases, 2 variables)
#
#   2 variables have SPSS-style missing values:
#     Income: -99 ["Refused"], -98 ["Don't know"]
#     Education: -99 ["Refused"]
#   jstats analyses treat these codes as missing. Base R functions do not.
#   To make them missing in base R as well, convert:
#     jconvert(r17, to = "stata", modify = TRUE)

cat("\n--- notes above it: a registration restored, the default set ---\n")
jload("reg17.rds", name = "s17", overwrite = TRUE, use = TRUE, missing.notice = FALSE)
# Expected:
#   Restored the classification registrations saved with this file (saved
#   under 'reg17').
#
#   Default data frame set to: s17
#
#   Loaded s17 (R native format; 4 cases, 2 variables)

cat("\n--- the line alone ---\n")
jload("clinic.rds", name = "r17", overwrite = TRUE, missing.notice = FALSE)
# Expected:
#   Loaded r17 (R native format; 4 cases, 2 variables)

cat("\n--- the shipped dataset ---\n")
jload("community", name = "c17", package = TRUE, overwrite = TRUE,
      missing.notice = TRUE)
# Expected:
#   Loaded the jstats example dataset 'community'.
#
#   5 variables have SPSS-style missing values:
#     Income: -99 ["Refused"], -98 ["Don't know"]
#     Education: -99 ["Refused"], -98 ["Don't know"]
#     Smoker: -99 ["Refused"]
#     Environment1: -99 ["Refused"], -98 ["Don't know"]
#     Environment3: -99 ["Refused"], -98 ["Don't know"]
#   jstats analyses treat these codes as missing. Base R functions do not.
#   To make them missing in base R as well, convert:
#     jconvert(c17, to = "stata", modify = TRUE)

options(.jst_default_data = NULL)
suppressMessages(jnumeric(reg17, NULL)); suppressMessages(jnumeric(s17, NULL))
setwd(.wd17)
rm(.wd17, reg17, r17, s17, c17)

# Things to look at:
#   - ONE blank line between the Loaded line and the narrative's first
#     line, and one between each note above it and the next. Between the
#     narrative's inventory and its own Note: block there is still none
#     (S237): that is one message, not two.
#   - The line alone ends the output: no blank line after it.
#   - Is the gap above the Loaded line right as well? The ruling spoke of
#     a LEADING status line; with notes above it, this build treats it the
#     same way on both sides.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 18 -- Case 7 on a wider frame: a count past three names ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S351 (v0.9.224; the S294 item). Case 7's note named every
# off-setting variable ahead of its verb, ten and "... and 2 more" on a wide
# frame. Past three it now gives a count, as Case 4's "these variables"
# leans on the inventory just above; three or fewer keep their names
# (three is the durability reminder's limit, S339).
w18 <- data.frame(Income = spss_df$Income)
for (v18 in c("Q1", "Q2", "Q3", "Q4")) {
  w18[[v18]] <- haven::labelled(c(3, 4, haven::tagged_na("a"), 2),
                                labels = c(Refused = haven::tagged_na("a")))
}
fw18  <- file.path(.walkdir, "w18.rds");  saveRDS(w18, fw18)
fw18b <- file.path(.walkdir, "w18b.rds"); saveRDS(w18[1:4], fw18b)
joptions(missing.convention = "spss", quiet = TRUE)

cat("--- four Stata-style variables ---\n")
jload(fw18, name = "w18", overwrite = TRUE, missing.notice = TRUE)
# Expected:
#   Loaded w18 (R native format; 4 cases, 5 variables)
#
#   5 variables have missing values (1 SPSS-style, 4 Stata-style):
#     Income: -99 ["Refused"], -98 ["Don't know"]
#     Q1: .a ["Refused"]
#     Q2: .a ["Refused"]
#     Q3: .a ["Refused"]
#     Q4: .a ["Refused"]
#   Note: 4 variables are Stata-style, but your missing.convention setting
#   is "spss".
#   To use SPSS-style missing values throughout, run:
#     jconvert(w18, to = "spss", modify = TRUE)
#   To use Stata-style missing values throughout, run both:
#     jconvert(w18, to = "stata", modify = TRUE)
#     joptions(missing.convention = "stata")

cat("\n--- three ---\n")
jload(fw18b, name = "w18b", overwrite = TRUE, missing.notice = TRUE)
# Expected:
#   Loaded w18b (R native format; 4 cases, 4 variables)
#
#   4 variables have missing values (1 SPSS-style, 3 Stata-style):
#     Income: -99 ["Refused"], -98 ["Don't know"]
#     Q1: .a ["Refused"]
#     Q2: .a ["Refused"]
#     Q3: .a ["Refused"]
#   Note: Q1, Q2, and Q3 are Stata-style, but your missing.convention setting
#   is "spss".
#   To use SPSS-style missing values throughout, run:
#     jconvert(w18b, to = "spss", modify = TRUE)
#   To use Stata-style missing values throughout, run both:
#     jconvert(w18b, to = "stata", modify = TRUE)
#     joptions(missing.convention = "stata")

options(.jst_options_missing_convention = "none")
rm(w18, w18b, v18, fw18, fw18b)

# Things to look at:
#   - "4 variables are Stata-style": the inventory above lists them.
#   - "Q1, Q2, and Q3 are Stata-style": the names, as before.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 19 -- jsave() given an expression as the data (S352) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S352 (v0.9.225; the S351 item). jsave()'s pre-flight refusals pasted
# the data as typed into their lines: given oc19["X"], the .sav over-limit
# refusal printed jsave(oc19["X"], "oc19["X"].rds"), which does not parse,
# and jconvert(oc19["X"], ..., modify = TRUE), which stops. Each block of
# lines now names mydata and opens on "mydata <- oc19["X"]" -- the S339
# form of every other message given an expression -- and its files are
# named mydata. Section 12 has jdeclare_missing() and jconvert() given an
# expression. The assertion side is missing_convention_check.R N87av-ay.

oc19 <- data.frame(
  X = haven::labelled_spss(c(1, -1, -2, -3, -4), na_values = c(-1, -2, -3, -4)),
  Y = c(1L, 2L, 3L, 4L, 5L))
cx19 <- oc19; cx19$Z <- I(list(1, 2, 3, 4, 5))

# Render 1 -- the .sav over-limit refusal: two blocks, each opening on
# mydata.
try(jsave(oc19["X"], file.path(.walkdir, "oc19.sav")))
# Expected:
#   Error : jsave(): SPSS format (.sav) allows at most 3 declared missing values
#   per variable, or a range plus one code.
#
#   This variable in oc19["X"] has more:
#     X: 4 codes
#
#   To save in R format (.rds) instead, keeping all the codes:
#     mydata <- oc19["X"]
#     jsave(mydata, "mydata.rds")
#   To convert to Stata and save as Stata format (.dta), also keeping all
#   the codes:
#     mydata <- oc19["X"]
#     jconvert(mydata, to = "stata", modify = TRUE)
#     jsave(mydata, "mydata.dta")
#   Or reduce each variable's declared missing values to fit.

# Render 2 -- two problems at once (a list column and SPSS-style missing
# values) in a .dta file.
try(jsave(cx19[c("X", "Z")], file.path(.walkdir, "oc19.dta")))
# Expected:
#   Error : jsave(): cx19[c("X", "Z")] cannot be saved to Stata format (.dta)
#   yet -- 2 things to fix:
#
#   [1] 1 column is of a type that Stata format (.dta) cannot store:
#     Z (list)
#
#   complex/list/raw columns have no Stata format (.dta) representation and no
#   sensible automatic conversion. Drop it before saving with:
#     mydata <- cx19[c("X", "Z")]
#     mydata[c("Z")] <- NULL
#
#   [2] 1 variable carries SPSS-style missing values, incompatible with the
#   .dta format:
#     X
#
#   Before saving to Stata format, convert with:
#     mydata <- cx19[c("X", "Z")]
#     jconvert(mydata, to = "stata", modify = TRUE)
#
#   Fix the above, then run jsave() again.
rm(oc19, cx19)

# Things to look at:
#   - each block runs on its own, so each opens on "mydata <- ...";
#   - the sentences above the lines keep the expression as typed
#     ("This variable in oc19["X"] has more:"), as the header does.



# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Observations
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# <Free-form notes from the most recent walk: anything that looked off,
# wording worth an mv review, follow-ups. Dated entries, newest first.>
#
# 11 Aug 2026 (S230 closeout note; Expecteds revised, NOT a walk). All four
# ledgered S229 findings SHIPPED at S230 / v0.9.126: the plural fix (all
# three status emitters), the break family (Rule U: .jst_wrap_prose +
# Rule L "run:"/"run both:" blocks -- see the revised Section 2/3
# Expecteds), and the minimal-refusal Rule E splits with the
# combined-error newline join (revised Section 6). The deparsed-name echo
# stays an open observation. Fitness question (a) below is now live for
# the next walk; the Saved lines in Setup render two-line with correct
# number agreement from 0.9.126.
#
# 11 Aug 2026 (S229, first full walk, Jeff): the modify-form conversion
# itself verified green -- every suggestion site in modify form, both
# keep-sites intact. Findings, all ledgered at S229:
#   - "1 variables" / "1 cases" plural in jsave's Saved line (new defect,
#     seen on the susp.rds fixture save in Setup).
#   - jsave echoes a deparsed expression as the frame name
#     (Saved plain_df["Contact"] to ...) -- observation, not a defect call.
#   - Hardcoded mid-sentence line breaks land oddly with short names: the
#     Case 7/Case 4 convention note ("...convention is set / to \"spss\"")
#     and, worse, the jrecode convention error in Section 9 ("set to SPSS /
#     convention"). Family-wide judgment call, deliberately NOT auto-fixed.
#   - The three minimal-tier jsave refusals (Section 6) run two sentences
#     on one line -- Rule E gap, surfaced by the longer modify-form calls.
#     The .xpt one has a two-clause second sentence; sub-question for mv.
#   - Section 1's guidance tail only prints on the session's FIRST UDM
#     notice (compact-form design, S227); fixed in-file this session with
#     missing.notice = TRUE on that jload.
#   - The walk leaves its objects in the global environment, so joptions
#     census notes in a re-run list leftovers from the prior run (d1,
#     many_df, ...). Output therefore varies with session history; harmless
#     but worth remembering when reading a re-walk's console.
# Fitness questions for the NEXT walk: (a) do the minimal-tier refusals
# still read as prose once the Rule E split lands, and (b) does Section 9's
# bare jrecode( line above a modify = TRUE jdeclare_missing line read as
# deliberate or as an inconsistency?


# --- End marker --------------------------------------------------------------
# A real statement, deliberately last: stepping through with Ctrl+Enter, RStudio
# keeps expanding the selection when only comments remain, echoing the tail of
# the file back repeatedly. Ending on executable code gives it somewhere to
# stop. Keep this line at the foot of every walkthrough, below the Observations
# block, and rename it to match the file.

# Hand back the two knobs recorded in Setup (S266). This supersedes the
# S247 hard "none" clear: restoring the ENTERING value is what "does not
# leave a setting behind" actually requires -- the old clear left a
# cleared slot behind instead, whatever the session arrived with.
options(.jst_options_missing_convention = .entry_convention)
options(.jst_options_message_width = .entry_message_width)

cat("\n--- End of modify_form_walk.R ---\n")
