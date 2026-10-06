# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# clinic_workflows_walk.R -- visual walkthrough of the `clinic` dataset
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# TYPE:     visual walkthrough (Expected comments; written for Jeff's checking)
# PENDING:  none
# LOCKS:    that clinic's built-in data problems still SHOW UP in output the
#           way the dataset was designed to make them show up -- and that the
#           standard cleaning workflow still visibly resolves them.
# ORIGIN:   pre-S117 try-out script (clinic_workflows_tryout.R), rewritten and
#           un-staled at S224 as the first regression/ walkthrough.
# S294 EDIT (v0.9.167, 2026-09-14): the Setup's jsubset(NULL) /
#           jcomplete(NULL) / jdummy(NULL) moved to the clear.all = TRUE
#           forms -- the S294 NULL flip plus the S247 neutral-state item.
#           jdummy(NULL) had already been frame-scoped since the
#           registration verbs unified, so the preamble did not clear what
#           it claimed; it does now. No Expected touched; confirmed in the
#           walk below.
# S321 EDIT (v0.9.199, 2026-10-01): Section 6's first and third bullets
#           rewritten for the v0.9.198 display -- the row reads
#           "Stress * SocialSupport", and the note under the table now
#           states the b / beta sign split the third bullet explained.
#           Bullet text only: no Expected touched, not re-walked. Its
#           output on the 0.9.199 rebuild differs from 0.9.198 only in the
#           reworded interaction note in Sections 6 and 10, which nothing
#           here pins; nothing it LOCKS changed (sandbox diff). The
#           S320 to-do item named "Sections 6 and 6b": 6b fits Stress +
#           SleepHours, no interaction, and needed nothing; the other
#           interaction fit is Section 10, whose bullets still stand.
# LAST VERIFIED: v0.9.167, 2026-09-14 (S294) -- WALKED on the WORKSTATION,
#           end marker reached, every section matching (reset lines only;
#           see the S294 EDIT note above). The ten workflows still surface
#           clinic's built-in problems as designed: the MoodRating and
#           Anxiety2 suspected-code scan, the -4.943 mean before the
#           declaration, and the alpha climbing .002 -> .189 -> .828.
#           Prior: v0.9.149, 28 August 2026 (S266) -- RUN DIRTY on the
#           workstation (entry width 120, convention "spss") and READ from
#           the capture. All three forces proved themselves in the render:
#           the load narrative opened in its no-convention-set case
#           despite the "spss" entry, every prose line wrapped at 76
#           despite the 120, and jalpha's warnings printed inline in their
#           sections (warn = 1) -- the 8 -> 8b -> 8c arc landing as
#           designed (two items flagged, then one, then none). Every beat
#           unchanged: the alpha arc 0.002 -> 0.189 -> 0.828, MoodRating
#           -4.943 -> 5.46 across 63 of 70, N=66 vs N=62, the full-tier
#           per-code -99/-98 split. The S261 reroutes confirmed live: the
#           VIF note and the diagnostic-plots line both wrap at 76 now --
#           closing the over-width claim in the S259 entry below
#           (annotated there). EDITED same session, from this capture:
#           Sections 4 and 5's bullets corrected -- both promised a CPS
#           that AUTO correctly hides when nothing is excluded; the
#           absence is now taught as the point, with Section 6 as the
#           contrast. Findings carried to the session log, none owned by
#           this file: jalpha's "item(s)" hardcode (the Rule O sibling of
#           S261's jcrosstab fix) and jscreen's blank empty cells against
#           the CPS "--" convention.
#           [BOTH CLOSED S267 -- annotated S268. jalpha's "item(s)" went
#           to Rule O and jscreen's Table 2 empty cells now render "--",
#           in the same mvbatch. Do NOT re-log either on the next walk:
#           they are recorded above as OPEN because that is what they
#           were when written, and this file's evidence is prose, so
#           nothing else in it would have caught the change. What the
#           next walk should do instead is CONFIRM both fixes live --
#           the alpha arc in Sections 8/8b/8c reads jalpha warnings as
#           its evidence, so the singular/plural wording passes under
#           the eye there anyway, and jscreen renders in Section 1.]
# EDITED:   S287 (v0.9.162; WALKED on the workstation the same session, a
#           full source(echo = TRUE) run, end marker reached, every beat
#           matching: the alpha arc 0.002 -> 0.189 -> 0.828, MoodRating
#           -4.943 -> 5.46 across 63 of 70, listwise 66 vs 62, the
#           full-tier per-code split, and one blank at each of the six
#           whitespace sites. THE S266 CONFIRMATIONS the entry below asked
#           for are both DONE here: jalpha's Rule O plural reads "items
#           are ... Anxiety1, Anxiety3" in Section 8 and "item is ...
#           Anxiety1" in 8b; jscreen's empty cells render "--" in Section
#           1.) Two bullets re-pinned for the S284 CPS visibility rule (shipped
#           S286, v0.9.161): Sections 4 and 5 taught the ABSENCE of any
#           case-processing block as the point when nothing is excluded;
#           a one-line "Analysis N: 70" statement now stands in the
#           table's slot there, and both bullets say so. Sections 6, 6b
#           and 7 keep their tables (an Auto-listwise row is an exclusion
#           row) and their bullets stand as written. ALSO reaching this
#           file, silently: the v0.9.162 whitespace fix. jdesc (Sections
#           2, 2b), jlm (6, 6b, 8c) and jlogistic (7) each printed a
#           leading blank of their own ahead of their results, doubling
#           the blank the block already closes with. Sandbox-rendered end
#           to end on 0.9.161 and on 0.9.162 (R 4.3.3, clinic built from
#           its generator in a SEALED environment -- the generator leaves
#           its column vectors behind otherwise, and a global MoodRating
#           shadows the default frame's column on the bare-symbol path),
#           the two renders differ by exactly six removed blank lines
#           and nothing else. No bullet described the doubled blank, so
#           nothing here pins it either way; read for ONE blank between
#           the N line (or the closing rule) and the results.
# EDITED:   S268 (v0.9.150; annotation only, not re-run). NO Expected
#           blocks were touched, because this file has none -- its
#           evidence is prose and numeric beats, so the ~50 runtime
#           strings S267 reworded left its pinned content untouched.
#           The S267 to-do listed this file among the four stale walks;
#           that listing was over-broad, and the only S267 work owed
#           here was the closure annotation above. Recorded so the next
#           reader does not go looking for re-pins that were never
#           needed.
# PRIOR:    v0.9.147, 26 August 2026 (S259) -- WALKED END TO END and
#           READ FOR RENDER QUALITY, discharging the reading pass S258
#           left owed. Three runs: one on the S258 file, which is what
#           exposed the misplaced pin; one on the reordered file; and one
#           WARM PROBE entered deliberately dirty (.jst_missing_notice_shown
#           = TRUE, missing.convention = "stata"). The probe is what
#           PROVES the Setup forces rather than merely being consistent
#           with them -- a cold run shows the same output whether the
#           forces fire or not. Under the dirty entry the load narrative
#           still opened in its full first-showing form AND in its
#           no-convention-set case, Setup's own "spss" still reached the
#           declaring sections, and both entry values were handed back
#           unchanged at the foot. (Walked against the 0.9.146 build; the
#           only change between 0.9.146 and 0.9.147 is a roxygen block, so
#           the walk is not stale.)
#           RENDER: every prose line inside the pin. The two narrative
#           lines that had rendered at 90 and 116 characters now break at
#           43 + 46 and 73 + 57. Every beat unchanged from the S258
#           numbers -- the alpha arc 0.002 -> 0.189 -> 0.828, MoodRating's
#           mean -4.943 -> 5.46 across 63 of 70, the N=66 vs N=62
#           non-overlap, the full-tier per-code -99/-98 split. The reorder
#           moved output, not results.
#           TWO OVER-WIDTH PROSE SITES remain, neither owned by this file,
#           both carried to the width pile: jlm's VIF headline (78) and
#           its diagnostic-plots line (80). [Both CLOSED at S261 -- the
#           S266 entry above confirms the wrapped renders live.] Correct
#           and exempt: the jcorr
#           matrix header (89, a table) and the commented jdeclare_missing
#           example (94, Rule L).
#
# PRIOR:    v0.9.146, 26 August 2026 (S258) -- CAPTURED at a pinned
#           76 for the first time: this file had no width pin until S258,
#           so its warning-based evidence had never been comparable
#           between runs. Ran cold, end marker reached, nothing changed in
#           the file beyond the pin. It carries no literal Expected blocks
#           -- its evidence is prose -- so the S258 Expected audit had
#           nothing to diff here; what it needed was the pin. NOT read for
#           render quality this run, so the reading pass the beats depend
#           on is still owed.
#
# PRIOR:    v0.9.144, 25 August 2026 (S255) -- WALKED END TO END TWICE
#           in one session, before and after the scan-legend shape fix.
#           Every beat still lands: the alpha arc 0.002 -> 0.189 -> 0.828,
#           MoodRating's mean -4.943 -> 5.46 across 63 of 70, the N=66 vs
#           N=62 non-overlap, the full-tier per-code -99/-98 split. This
#           discharges the re-stamp S248 left pending after its two
#           post-run edits (warn = 1; four juse re-points removed).
#           FOUND BY THE TWO RUNS, not yet fixed (S255 to-do): this file
#           does NOT reset .jst_missing_notice_shown in Setup, so its first
#           beat renders differently cold versus warm -- run it after
#           another walk and the jload guidance pair is suppressed by the
#           once-per-session compact form. missing_convention_walk.R
#           already resets the flag.
#           FIXED at S259: the record/force sits at the head of Setup,
#           above the jload it protects, with the restore at the foot.
#           THE SAME RUN EXPOSED A BIGGER ONE. The S258 width pin sat
#           BELOW the jload, so the load narrative -- Section 1's own
#           evidence -- rendered at the console's width, not the pin:
#           measured lines of 90, 94 and 116 characters before Setup
#           finished, against 66-73 everywhere after it. So the S258
#           "captured at a pinned 76" stamp was true of the body and
#           false of the opening. A third knob was missing outright: the
#           entering missing convention, which selects WHICH load
#           narrative case renders. All four knobs are now recorded and
#           forced in one block above the jload, and restored at the
#           foot. NEEDS one confirming run to re-stamp -- and the load
#           narrative will render NARROWER than in any previous capture,
#           which is the fix working, not a regression.
#
# PRIOR:    v0.9.139, 23 August 2026 (S248) -- WALKED END TO END on the
#           workstation. EVERY described beat still lands: the alpha arc
#           0.002 -> 0.189 -> 0.828, MoodRating's mean -4.943 -> 5.46
#           across 63 of 70, the N=66 vs N=62 non-overlap, and the
#           full-tier per-code -99/-98 split. The file had been carried
#           as "stale at v0.9.122" pending a rebuild; two clean runs
#           (S247, S248) downgrade that to a verify-and-re-stamp, which
#           is what this line is.
#           The S247 run made a missing.convention line necessary (the
#           S244 choose-first gate), added to the Setup block with the
#           other state resets so re-running Setup restores it.
#           TWO FIXES at S248, both from reading the S248 run rather than
#           from any package change. (1) options(warn = 1) in Setup: under
#           source() R deferred every warning to the foot and pooled them,
#           so Section 8c's "the negative-correlation warning is gone"
#           could only be inferred by counting entries in a list two
#           hundred lines later. (2) The redundant juse(clinic) re-points
#           are REMOVED -- FOUR of them, not the three first counted --
#           along with their comments ("re-point the default at the
#           updated frame"), which taught a step that does not exist.
#           juse() stores the frame's NAME in .jst_default_data and
#           .jst_resolve_data get()s it fresh on every call, so a rebound
#           frame is picked up with no re-pointing; confirmed by running a
#           declare-then-describe without one. Setup's juse(clinic) stays:
#           that one sets the default in the first place.
#           NEEDS A RE-RUN at S249+ to re-stamp: the beats are unchanged
#           (no analysis call was touched), but the console now carries
#           four fewer "Default data frame set to" lines and its warnings
#           in different places.
#           Prior: v0.9.122, 9 August 2026.
# RUN:      line-by-line first (read each block of output before moving on).
#           Also source()-safe. Under source(), run WITH echo = TRUE, per the
#           conventions file.
#           By section: source walk_tools.R, then rewalk("clinic_workflows")
#           shows the sections the PENDING line names and
#           rewalk("clinic_workflows", "1") shows one, each from a fresh
#           Setup and its NEEDS. Add prepare = TRUE to run only what the section
#           needs and step through it by hand.
# SECTIONS: mostly independent -- see "Section independence" below.
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
# WHAT THIS FILE IS FOR
# - - - - - - - - - - -
# `clinic` is the package's deliberately MESSY example dataset -- the
# declare-and-clean companion to `community`, which stays clean. Every one of
# clinic's data problems was put there on purpose, to give teaching material a
# place where a realistic mess can be shown and then cleaned up.
#
# This file is the standing check that those problems still behave. It walks
# the dataset through ten common analysis workflows, and each section was
# chosen because clinic's output DIFFERS there in a way that a reader is
# supposed to notice. It is the human half of the regression pair: it does not
# compute a verdict, because what it is checking cannot be reduced to one --
# whether the output still READS the way it should to a person who does not
# already know the answer.
#
# The four built-in problems, and where each surfaces:
#
#   1. Undeclared missing-value codes (MoodRating, Anxiety2). The -99/-98
#      cells are present but never declared, so the package treats them as
#      real data until told otherwise. Surfaces in Sections 1, 2, 2b, 8, 8b.
#   2. A 1/2 dichotomy needing recoding (PriorTherapy). Arrives coded
#      1 = Yes, 2 = No, so it cannot serve as a logistic outcome as-is.
#      Surfaces in Sections 1, 3, 7.
#   3. Non-overlapping missingness (Stress and SleepHours). Their declared
#      codes sit on DIFFERENT cases, so a model using both loses more rows
#      than either loses alone. Surfaces in Sections 6, 6b, 9.
#   4. A Likert battery with one flaw per item (Anxiety1-5): reverse-keyed,
#      undeclared codes, stripped labels, properly declared codes, and a
#      weak item. Surfaces in Sections 1, 8, 8b, 8c.
#
# WHAT TO DO IF SOMETHING LOOKS WRONG
# - - - - - - - - - - - - - - - - - -
# Log it in the Observations block at the foot of this file. A wording problem
# is an mv candidate (see the message-voice reference); a number that moved is
# a package question. Either way, note it here first -- this file's value is
# that the same ten workflows get looked at the same way each time.
#
# HOW TO USE
# - - - - -
# 1. Load the package first -- development OR installed, never both in one
#    session:
#       devtools::load_all()   # development
#       library(jstats)        # installed
# 2. `clinic` ships WITH the package, so nothing needs building or
#    downloading: the Setup section below loads the shipped copy directly.
#    (To rebuild it from scratch, the generator is
#     E:/00 R Projects/00_jstats_test_data/generators/clinic_data_generator.R
#     -- but a rebuild is a coupled event and is not needed to run this file.)
# 3. Run section by section and read each block of output.
#
# SECTION INDEPENDENCE
# - - - - - - - - - -
# Most sections are independent. Sections 2b, 3, 8b and 8c MODIFY the clinic
# copy in your session (declaring codes / adding a recoded column). Running top
# to bottom accumulates those changes harmlessly, and is the intended order --
# the cleaning story only reads properly in sequence. To reset to the raw dirty
# state at any point, re-run the Setup section.
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =


# --- Setup -------------------------------------------------------------------

# --- Borrowed session state: record, then force, ABOVE the jload -------------
# S259. Every knob this file borrows is recorded and forced HERE, before the
# jload below, because the jload IS the first beat: its narrative and its
# suspected-codes scan are Section 1's evidence. A knob forced after that call
# does not govern it. The S259 run proved the point -- the width pin sat below
# the jload, so the load narrative rendered at the console's own width (lines
# of 90, 94 and 116 characters) while everything after Setup rendered at 76.
#
# (1) LOAD-NARRATIVE FLAG. The jload guidance pair renders in full only on its
#     FIRST showing in a session; thereafter the once-per-session flag
#     collapses it to the compact form, so running this walk after any other
#     walk opened Section 1 differently from the way it reads. Found by
#     running this file twice in one session at S255.
# (2) MISSING CONVENTION. The load narrative's CASE depends on it: with no
#     convention set the loader offers the single base-R guidance pair, and
#     with one set it offers the two-remedy form instead. This file never
#     recorded the entering value, so which narrative Section 1 opened with
#     depended on what the previous walk left behind. Forced to unset here,
#     which is the case the file has always shown; the "spss" setting the
#     declaring sections need is still set below, after the load.
# (3) WARNINGS. Under R's default (warn = 0) a source() run DEFERS every
#     warning to the end and pools them, which is fatal to this file's
#     strongest beat: Section 8b's flagged item and Section 8c's "the warning
#     is gone" both live in jalpha warnings, and pooled at the foot the reader
#     cannot see one disappear -- they have to count entries in a list two
#     hundred lines later and reason backwards. That is an inference, and a
#     visual walkthrough exists to avoid inferences. Changes nothing when
#     stepping line by line; it repairs the source() mode the RUN block
#     recommends. (S248)
# (4) MESSAGE WIDTH. Since v0.9.145 the shipped message.width default is
#     "auto", so message output follows the console pane -- the same warning
#     renders differently on a 90-column window and a 64-column one. This
#     file reads jalpha and jscreen WARNINGS as its evidence, so an unpinned
#     run is not comparable with the last one. 76 is the width every other
#     regression file pins. (S258; moved above the jload at S259)
#
# All four are restored at the foot, so the walk leaves the session as it
# found it.

.entry_notice_shown  <- getOption(".jst_missing_notice_shown")
.entry_convention    <- getOption(".jst_options_missing_convention")
.entry_warn          <- getOption("warn")
.entry_message_width <- getOption(".jst_options_message_width")
.pin_width           <- 76L

options(.jst_missing_notice_shown = NULL)
options(.jst_options_missing_convention = NULL)
options(warn = 1)
options(.jst_options_message_width = .pin_width)

# jload() the shipped dataset (rather than touching it as lazy data directly)
# so the loader's diagnostics run. Watch the load-time output: the
# suspected-codes scan should flag MoodRating and Anxiety2 (see Section 1).
#
# package = TRUE forces the SHIPPED copy by bare name. Without it, a disk file
# named clinic.rds in the working directory would win the lookup -- and there
# now IS one in the standing test-data folder, so being explicit here keeps
# this file reading the dataset it means to read.
jload("clinic", package = TRUE, overwrite = TRUE)

juse(clinic)
# Set ONCE, here. Sections 2b, 3, 8b and 8c each rebind clinic (a declaration
# or a new column assigned back), and none of them re-points: juse() stores
# the NAME, and the analysis functions get() the frame fresh on every call,
# so a rebound frame is picked up by itself. Four re-point calls sat in those
# sections until S248 -- harmless no-ops, but their comments taught a step
# that does not exist. Do not put them back.
jsubset(clear.all = TRUE)
jcomplete(clear.all = TRUE)
joutput(NULL)

# S247: a missing-value convention must be chosen before Sections 2b and 8b
# can declare (the S244 choose-first gate replaced the old silent SPSS
# fallback, so an unset convention now STOPS rather than assuming). SPSS
# convention is what this walk's declare-and-clean story has always shown --
# codes stay visible numbers -- so this line restores the prior behavior
# explicitly rather than changing what the sections demonstrate. It stays
# BELOW the jload on purpose (S259): the load narrative is shown in its
# no-convention-set case, and the entering value is recorded above and
# restored at the foot.
joptions(missing.convention = "spss")
jdummy(clear.all = TRUE)



# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 1 -- First look: how a messy dataset screens ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The load message already printed during Setup (the suspected-codes scan for
# MoodRating and Anxiety2). This section reads the screening table.

jscreen()

# Things to look at:
#   - The Variable Types table encodes each item's deliberate flaw:
#       Anxiety1 -> Likert (clean labels)
#       Anxiety2 -> Numeric (undeclared -99/-98 push it out of the Likert range)
#       Anxiety3 -> 5-category (value labels were stripped, so no Likert detect)
#       Anxiety4 -> Likert (codes declared, labels intact)
#   - PriorTherapy carries the dichotomy* marker ("coded other than 0/1").
#   - SoughtHelp / Medication as 0/1 dichotomies; Condition as 4-category.
#   - The Missing/Outliers table: Stress, SleepHours, Medication, Anxiety4 show
#     DECLARED missing; Anxiety2's UNDECLARED -99/-98 show up as outliers, not
#     missing (they are still being treated as real values at this point) --
#     6 of them, one per dirty cell.
#   - Stress and Flourishing each show a single outlier as well. Those are
#     ORDINARY extreme values in clean data, not planted flaws: real datasets
#     have them, and the header line ("Variables with outliers: 3") counts
#     them alongside Anxiety2's. Nothing to fix.
#   - MoodRating shows NO missing and NO outliers at this stage, even though it
#     is the dirtiest column in the set: its -99/-98 sit far enough out to
#     wreck the mean (Section 2) but the column's own SD is so inflated by them
#     that nothing falls 3 SD from it. Undeclared codes can hide from an
#     outlier scan -- which is why the load-time suspected-codes note matters.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 2 -- A dirty single item: descriptives BEFORE declaring the codes ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

jdesc(MoodRating)

# Things to look at:
#   - The mean is implausible (about -4.9, far below the 1-10 range) because
#     the -99/-98 codes are being treated as real data. The SD of about 31 on
#     a 10-point scale is the other giveaway.
#   - Non-missing shows all 70 cases: nothing has been excluded yet.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 2b -- Declare the codes, then re-describe  [jdeclare_missing] ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Follows Section 2. Declaring the codes is non-destructive: the values stay
# in the data but are now flagged as missing.

clinic <- jdeclare_missing(clinic, MoodRating,
                       codes = c("Refused" = -99, "Don't know" = -98))
jdesc(MoodRating)

#   SPSS equivalent:
#     MISSING VALUES MoodRating (-99, -98).
#     FREQUENCIES MoodRating.   /* or DESCRIPTIVES */

# Things to look at:
#   - The mean is now sensible (about 5.5, mid-scale) and the SD drops to
#     about 1.7; Min/Max become 1 and 9.
#   - Non-missing falls from 70 to 63 -- the seven declared cells are now
#     excluded rather than counted as data.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 3 -- Recoding a 1/2 dichotomy to 0/1  [jrecode] ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PriorTherapy arrives coded 1 = Yes, 2 = No. A 0/1 coding is what you want
# before using it as (say) a logistic-regression outcome. Non-destructive:
# we write a new column and keep the original.

clinic$PriorTherapyR <- jrecode(PriorTherapy, map = "1=1; 2=0")
jfreq(PriorTherapy, PriorTherapyR)

#   SPSS equivalent:
#     RECODE PriorTherapy (1=1) (2=0) INTO PriorTherapyR.
#     VALUE LABELS PriorTherapyR 0 'No' 1 'Yes'.

# Things to look at:
#   - jfreq shows the two side by side; the value labels follow the recode
#     (old 1 "Yes" stays at 1; old 2 "No" moves to 0).
#   - The original PriorTherapy is untouched.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 4 -- Group comparison across treatment arms  [jaov] ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

jaov(Flourishing ~ Condition)

# Things to look at:
#   - An "Analysis N: 70" line stands where a Case Processing table would,
#     and its being ONE line is the point: Flourishing and Condition are
#     both clean, nothing was excluded, and the S284 visibility rule
#     (shipped S286, v0.9.161) prints the one-line N statement whenever
#     there is no exclusion row to show. Section 6, where Stress's UDM
#     cells drop four cases, is the contrast: an Auto-listwise row, so a
#     table. (Corrected S287. The S266 bullet taught the ABSENCE of any
#     block as the point; before that it promised a listwise table. The
#     block has now had three shapes here in as many redesigns.)
#   - The omnibus F and its p-value (Condition should be significant).
#   - The group means: Control lowest, the active arms higher (face-valid).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 5 -- Two-group comparison  [jt] ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

jt(Flourishing ~ SoughtHelp)

# Things to look at:
#   - Student's t is the package default (not Welch).
#   - Group means/SDs; "Analysis N: 70" here too, for Section 4's reason --
#     both variables are clean, so there is no exclusion row and the N
#     line takes the table's slot. SoughtHelp is a clean 0/1 grouping
#     variable. (Corrected S287, with Section 4.)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 6 -- Regression with an interaction  [jlm] ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The headline relationship: social support BUFFERS the effect of stress on
# flourishing (a Stress x SocialSupport interaction).

jlm(Flourishing ~ Stress * SocialSupport)

# Things to look at:
#   - The Stress * SocialSupport interaction row (should be significant).
#     Since v0.9.198 the row reads with " * "; before, it read
#     Stress:SocialSupport.
#   - The CPS: listwise N is 66 of 70 -- Stress carries UDM cells that are
#     excluded from the model frame. SocialSupport is clean.
#   - SocialSupport's raw b is negative while its standardized Beta is
#     positive, and the note under the table says why: Beta comes from
#     centered predictors, so it is the slope at mean stress, while b is
#     the slope at Stress = 0 (an extrapolation). Expected in an uncentered
#     interaction model, not an error (a Book 2 centering / simple-slopes
#     point).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 6b -- Non-overlapping missingness widens the listwise drop  [jlm] ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Follows Section 6. Stress and SleepHours carry their UDM codes on DIFFERENT
# cases, so a model using both loses more rows than either loses alone.

jlm(Flourishing ~ Stress + SleepHours)

# Things to look at:
#   - The CPS listwise N is 62, against 66 in Section 6 -- the Stress-missing
#     and SleepHours-missing cases barely overlap, so the deletions stack
#     instead of coinciding.
#   - Compare that 62 against the per-variable valid counts from jscreen:
#     neither variable alone loses anything like eight cases.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 7 -- Logistic regression on a clean 0/1 outcome  [jlogistic] ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

jlogistic(SoughtHelp ~ Stress + SocialSupport)

# Things to look at:
#   - SoughtHelp is already 0/1, so no recode is needed (contrast PriorTherapy,
#     which would need the Section 3 recode before serving as an outcome).
#   - The coefficient/odds-ratio table and the CPS.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 8 -- Scale reliability on the RAW battery  [jalpha] ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The Anxiety battery has one deliberate flaw per item: Anxiety1 is reverse-
# keyed (label ends " R"), Anxiety2 has undeclared -99/-98 codes, Anxiety3 lost
# its labels, Anxiety4 has the same codes but properly declared, Anxiety5 is a
# weak item. Run it dirty first.

jalpha(Anxiety1, Anxiety2, Anxiety3, Anxiety4, Anxiety5)

# Things to look at:
#   - Alpha is near zero (~.00): Anxiety2's undeclared -99/-98 are in as real
#     values and destroy the covariance structure -- its item Mean of about
#     -4.9 and SD of about 27 give it away in the item table.
#   - jalpha flags negatively-correlated items. Here it names BOTH Anxiety1 and
#     Anxiety3: Anxiety1 because it is genuinely reverse-keyed, Anxiety3 only
#     because Anxiety2's wreckage has scrambled the correlations. The Anxiety3
#     flag disappears in 8b once the codes are declared -- worth watching, as
#     it shows how one dirty item can implicate a clean one.
#   - jalpha does NOT auto-reverse a reverse-keyed item (the " R" label is a
#     flag for you, not a trigger jalpha acts on). You reverse it in 8c.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 8b -- Declare the in-battery codes, then re-run [jdeclare_missing ----
#               + jalpha]
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Follows Section 8. Anxiety4 is already declared; Anxiety2 is the one still
# dirty. Declaring it fixes the covariance damage -- but alpha is still low,
# because Anxiety1 is reverse-keyed and not yet reversed (Section 8c).

clinic <- jdeclare_missing(clinic, Anxiety2,
                       codes = c("Refused" = -99, "Don't know" = -98))
jalpha(Anxiety1, Anxiety2, Anxiety3, Anxiety4, Anxiety5)

# Things to look at:
#   - Anxiety2's item statistics now look like the other items' (Mean ~3.0,
#     SD ~1.2), and the N drops to 59 as its cells become missing.
#   - Alpha rises but is still low (~.19), and Anxiety1 alone is now flagged:
#     the un-reversed reverse-keyed item is what remains. Its corrected
#     item-total r of about -.77 is the size of the problem, and "alpha if
#     item deleted" of about .75 shows what the scale would be without it.
#   - Anxiety3 is no longer flagged. Section 8c resolves the rest.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 8c -- Reverse the flagged item, then re-run  [jrecode + jalpha] ----
# NEEDS: 8b
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Follows Section 8b. Reverse-code Anxiety1 into a new column (non-destructive),
# then run jalpha on the reversed item in place of the original.

clinic$Anxiety1R <- jrecode(Anxiety1, map = "1=5; 2=4; 3=3; 4=2; 5=1")
jalpha(Anxiety1R, Anxiety2, Anxiety3, Anxiety4, Anxiety5)

#   SPSS equivalent:
#     RECODE Anxiety1 (1=5)(2=4)(3=3)(4=2)(5=1) INTO Anxiety1R.

# Things to look at:
#   - Alpha jumps to about .83; Anxiety1R's item-total r flips from about -.77
#     to about +.77 (same magnitude, opposite sign -- the reversal did exactly
#     what it should), and the negative-correlation warning is gone.
#   - Anxiety5 is now the clear drop candidate: lowest corrected item-total r
#     (about .42) and the highest "alpha if item deleted" (about .86).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 9 -- Correlations across the continuous spine  [jcorr] ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

jcorr(Stress, SocialSupport, SleepHours, Flourishing, ScreenTime)

# Things to look at:
#   - The per-pair Ns in the matrix vary, because Stress and SleepHours carry
#     UDMs (pairwise, not listwise -- jcorr's own convention).
#   - Moderate relationships among Stress/SocialSupport/SleepHours/Flourishing.
#   - ScreenTime correlates near zero with everything (the built-in null).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 10 -- Same call, fuller output tier  [joutput] ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# joutput controls how much the analysis functions print. The "full" tier
# surfaces advisory notes and case-processing detail that the standard tier
# keeps quiet.

joutput("full")
jlm(Flourishing ~ Stress * SocialSupport)
joutput(NULL)       # restore the standard tier

# Things to look at:
#   - The per-code missing breakdown (-99 / -98 split out), variable labels,
#     CIs, and the VIF block, compared with Section 6's standard-tier run.
#   - The interaction's high VIF is expected in an uncentered interaction model
#     (same centering point as Section 6).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Observations
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Dated entries, newest first. Log anything that looked off as you walked
# through: wording worth an mv review, a number that moved, a section that no
# longer reads the way it should.
#
# 2026-08-09 (S224, v0.9.122): rewritten from the pre-S117 try-out script.
#   Wellbeing -> Flourishing throughout (renamed S117), package name corrected
#   to jstats, Setup switched to jload(package = TRUE). Walked green.


# --- Restore session state ---------------------------------------------------
# The four knobs recorded at the head of Setup: the warning setting, the
# message width, the load-narrative flag, and the missing convention.
# Everything else this file sets (juse, joutput, the frame itself) is
# deliberately left in place, since a walk is meant to leave the frame
# sitting there to be poked at afterwards. These four are environment knobs
# rather than demonstration state -- the file borrowed them to make its
# output readable and comparable, so it hands them back. The convention
# restore is TARGETED rather than a joptions(NULL) reset, which would discard
# the other slots too.

options(warn = .entry_warn)
options(.jst_options_message_width = .entry_message_width)
options(.jst_missing_notice_shown = .entry_notice_shown)
options(.jst_options_missing_convention = .entry_convention)
rm(.entry_warn, .pin_width, .entry_message_width, .entry_notice_shown,
   .entry_convention)


# --- End marker --------------------------------------------------------------
# A real statement, deliberately last: stepping through with Ctrl+Enter, RStudio
# keeps expanding the selection when only comments remain, echoing the tail of
# the file back repeatedly. Ending on executable code gives it somewhere to
# stop. Keep this line at the foot of the file.

cat("\n--- End of clinic_workflows_walk.R ---\n")
