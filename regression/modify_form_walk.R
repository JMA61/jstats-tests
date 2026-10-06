# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# modify_form_walk.R -- human-visual walkthrough
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# TYPE:     visual walkthrough (Expected comments; written for Jeff's checking)
# PENDING:  none
# LOCKS:    every runtime message that SUGGESTS a data-changing call teaches
#           modify = TRUE, not the assignment form; the two REPORT sites (the
#           durability note, the jai orientation body) still show both forms.
# ORIGIN:   S229
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
# LAST VERIFIED: v0.9.213, 2026-10-05 (S339) -- Sections 11 and 12 WALKED
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

jload(f_plain, name = "clinic", overwrite = TRUE)

# Expected, under "# To declare one variable's codes as missing:":
#   jdeclare_missing(clinic, Rating, codes = -99, modify = TRUE)
# Things to look at:
#   - the line sits under a # comment header but is itself uncommented and
#     runnable as printed
#   - the label-only variable (Rating) is the example target, not Contact


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 5 -- the scan's commented label-at-the-same-time example ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The second, commented example fires only when the target is a SUSPECTED
# (unlabelled) variable, so this fixture holds only the bare-code column.

jload(f_susp, name = "clinic", overwrite = TRUE)

# Expected, the commented second line:
#   #   jdeclare_missing(clinic, Contact, codes = c("label1" = -99), modify = TRUE)
# Things to look at:
#   - modify = TRUE is INSIDE the comment, i.e. it is part of the example
#     the user uncomments, not stranded after the closing paren


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
