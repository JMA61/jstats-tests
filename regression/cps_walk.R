# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# cps_walk.R -- the case-processing block, read rather than asserted
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# TYPE:     visual walkthrough (Expected comments; written for Jeff's checking)
# PENDING:  none
# LOCKS:    the S284 CPS visibility redesign as shipped -- when the upper table
#           prints, when the one-line N statement takes its slot instead, which
#           N-line form each layout uses, and the blank lines around the block;
#           since S320 jscreen's place in it (Part J); since S340 a text
#           variable's declared missing strings and its blank cells, in
#           jfreq(), jscreen() and a group function (Part K).
# ORIGIN:   S287 (design S284, code S286 v0.9.161, whitespace S287 v0.9.162)
# S340 EDIT (v0.9.214): PART K ADDED, five sections, for Fix Slate 3's text
#           variables. K1 and K2: a string variable's declared missing
#           values are Missing rows in jfreq() and leave a group function,
#           accounted for in the Case Processing block (they were Valid
#           rows, and groups). K3-K5: a blank text cell -- empty, or only
#           spaces or tabs -- is ONE category, <blank>, counted as valid and
#           said to be (Jeff, S340: reported, never assumed missing):
#           jfreq()'s row and footnote, jscreen()'s header line and its
#           Blank and % Blank columns, a group in jt(). The same rule in
#           jlm() is models_walk.R Section 15. A second fixture, tx (twelve
#           cases, inline), joins Setup. Section count 59 -> 64. Every
#           Expected in Part K was FILLED BY RUNNING the file on the 0.9.214
#           build (fill.R), whole, from the title to the last line; no
#           existing Expected moved -- every one of the 59 earlier sections
#           gives the same output on 0.9.213 and 0.9.214. No section in
#           Part K needs another (harness.R: 64 of 64 isolated runs equal
#           the straight run with the file's own NEEDS lines).
# LAST VERIFIED: v0.9.214, 2026-10-05 (S340) -- K1-K5 WALKED on the
#           WORKSTATION by Jeff through rewalk("cps") ("All walks done
#           okay"), GitHub 2d04b68, after the SANDBOX run (R 4.3.3, UTF-8
#           locale, pkgload::load_all of the build): every section through
#           rewalk() as in a straight run of the file, in three orders and
#           by prepare = TRUE.
# S338 EDIT (v0.9.212): H1 RE-PINNED -- one line added to its Expected block,
#           "Frequencies", and its first note rewritten. jfreq() prints its
#           title before the filters run, as jdesc() does, so the zero-row
#           stop now comes under the title; H1's note had pointed at the
#           missing title as the one place the two orders showed. Nothing else
#           in the file moves: the other 58 sections give the same output on
#           0.9.211 and 0.9.212.
# LAST VERIFIED: v0.9.212, 2026-10-05 (S338) -- H1 WALKED on the WORKSTATION
#           through rewalk("cps") (Jeff: "both walks are clean"), GitHub
#           e22427a, after the SANDBOX run (R 4.3.3, UTF-8 locale): H1's
#           pinned lines match the capture, and every section runs through
#           rewalk() as in a straight run of the file.
# S328 EDIT (v0.9.204): THE LEAN, EVERYWHERE -- the Case Processing block
#           included. Where a count, a value or a header cannot be centered
#           exactly, the odd space now goes on the LEFT (Jeff, S328; in the
#           Case Processing block it had gone on the right since Session
#           52), so the text sits one place right of where it did. In
#           the breakdown: a one-digit count under "Filtered", a two-digit
#           count under "From 70", the "%" header over a four-wide
#           percentage. In jdesc's tables: the "SD" header, a two-digit
#           count under Total or Non_missing, a two-digit Min or Max. In
#           jcomplete()'s set-time table: the "N" header and the
#           percentages under "% Missing".
#           TWENTY-THREE Expected blocks re-pinned (76 lines) in Parts A,
#           B, C, E, F, G, I and J, no section added: taken from an
#           ordered diff of this file's own output on the 0.9.203 and
#           0.9.204 builds, each block then found as a contiguous run in
#           the new capture (59 of 59; the S320 file 36). Two bullets
#           reworded (B4, G1): G1 still said every other table in the
#           package right-justifies. jdesc's Min and Max now print each
#           variable's own decimal places, aligned on the decimal point.
#           B7 is the one table here where that shows -- Stress 0 and 40
#           beside SleepHours 4.8 and 9.7, where it printed 0.0 and 40.0
#           -- and B7 pins only the header line (re-pinned).
# LAST VERIFIED: v0.9.204 PENDING, 2026-10-02 (S328) -- sourced end to end
#           in the SANDBOX (R 4.3.3, UTF-8 locale, pkgload::load_all of the
#           build; end marker reached); WORKSTATION walk of the re-pinned
#           sections PENDING Jeff's receive of the 0.9.204 master.
# S320 EDIT (v0.9.197): PART J ADDED, five sections, for the screening layout
#           (the Session 51 jscreen subset= item, kept; its S316 rider built):
#           jscreen at standard with no filter, unchanged (J1); the table
#           between the title and the header under a jsubset() (J2); three
#           filters with the "(k missing)" note (J3); the excluded count on
#           the Cases line at minimal (J4); the literal table at full (J5).
#           Section count 54 -> 59. Every Expected in Part J is a sink()
#           capture from the 0.9.197 master at width 76 on this file's
#           fixture, pinned from the first line through the header's
#           fourth line; trailing spaces are not pinned (the header lines
#           end in one, invisible in the console). The whole file was
#           sourced end to end on both masters: the diff is Part J and
#           nothing else. Self-check: each Part J block found as a
#           contiguous run in the new output (5 of 5); in the 0.9.196
#           output only J1 is found, by design -- J1 locks what must not
#           change. The human half of cps_check.R N54a-o.
# LAST VERIFIED: v0.9.197 PENDING, 2026-09-29 (S320) -- sourced end to end
#           in the SANDBOX (UTF-8 locale; end marker reached, 59 sections);
#           WORKSTATION walk of Part J PENDING. Prior: v0.9.196, 2026-09-29
#           (S319) -- A2, B7, C2, E8, F4 and G1-G6 WALKED on the WORKSTATION
#           by Jeff, discharging the two S316 PENDING stamps below.
# S316 SECOND EDIT (v0.9.192): JDESC'S TABLES BLOCK-CENTERED AND TRIMMED.
#           Eleven sections re-pinned -- the pinned header line of A2, B7,
#           C2, E8 and F4, and the header and data rows of G1-G6: every
#           numeric column is now block-centered (headers centered over
#           their columns, counts centered under Total and Non_missing on
#           their ones digit, statistics still decimal-aligned) and no line
#           ends in padding. Taken from an ordered diff of this file's own
#           output on the 0.9.191 and 0.9.192 masters (30 distinct changed
#           lines, every one a jdesc table line, no ambiguous mapping)
#           applied wherever pinned, 36 pinned lines in all. Every Expected
#           block then found in the new output, segment by segment (54 of
#           54); the 0.9.191 file against the same output finds 43 -- the
#           checker discriminates. Section count unchanged (54). The human
#           half of cps_check.R N53a-g.
# LAST VERIFIED: v0.9.192 PENDING, 2026-09-27 (S316) -- sourced end to end
#           in the SANDBOX (UTF-8 locale; end marker reached, 54 sections);
#           WORKSTATION walk PENDING. Prior:
# LAST VERIFIED: v0.9.191, 2026-09-27 (S316) -- WALKED on the WORKSTATION
#           by Jeff (source with echo = TRUE, end marker reached, Part G
#           read against its Expecteds), and a sink() capture of the whole
#           file BYTE-IDENTICAL to the sandbox capture (46,610 bytes, 261
#           blank lines) once three platform differences were normalized:
#           Windows CRLF line endings, RStudio's message-stream escapes
#           (ESC G3; ... ESC g), and the sandbox's non-UTF-8 spelling of
#           beta and superscript two. The read produced one finding, the
#           right-heavy jdesc headers -- the S316 second edit above.
# S316 EDIT (v0.9.191): PART G REBUILT for the grouped layout's case
#           accounting (AUDIT-027). G1 and G2 re-pinned in full -- "1
#           Variable Pool" (was 2: the grouping variable counted itself
#           in), and the group table now pinned, with its new Total and
#           Non_missing columns in place of the lone N. G3-G7 ADDED: the
#           by = row on a grouping variable with missing cases at standard
#           (G3), the same at per_code with the grouping variable's rows
#           kept in the breakdown (G4), the N line's grouped count and
#           rider at minimal (G5), the row after a jsubset() row (G6), and
#           the two new stops -- the grouping variable also described, and
#           a grouping variable with no values, plain and after a filter
#           (G7). Section count 49 -> 54. Every Expected in Part G is a
#           sink() capture from the 0.9.191 master at width 76 on this
#           file's fixture, pasted from the capture; the whole file was
#           sourced end to end on both masters, and the diff is Part G and
#           nothing else. Self-check: each Part G block found as a
#           contiguous run in the new output (7 of 7), none of the seven
#           in the old master's output, and the checker reds a changed
#           digit (G6) and a dropped blank (G3). The closing-blank fix (one blank, not two, at the
#           end of grouped output) shows in every Part G block. The human
#           half of cps_check.R N52a-t.
# LAST VERIFIED: v0.9.191 PENDING, 2026-09-27 (S316) -- sourced end to end
#           in the SANDBOX (end marker reached, 54 sections); WORKSTATION
#           walk PENDING Jeff's receive of the 0.9.191 master. Prior:
# S313 EDIT (v0.9.187): BLOCK-CENTERED VALUES in jcomplete()'s set-time
#           table, the "Listwise Case Filter" block that opens B4, I1, I3,
#           I4, I6 and I9 (six blocks, 22 Expected lines: 16 rows and the
#           six header lines). Each count now sits right-justified in a
#           block the width of the column's widest value, the block
#           centered under its header, and "% Missing" -- until v0.9.185 a
#           left-justified string -- sits the same way; the header is
#           centered over the column, so "N" sits over the middle of "70"
#           (the CPS bottom's Session 52 rule, reached through the new
#           .jst_print_table "bc" code). Rules unchanged. Two builds in one
#           session: v0.9.186 (walked on the workstation) kept the header
#           right-justified; Jeff read both forms rendered and chose the
#           centered one, and v0.9.187 re-pinned the six header lines. The
#           lines were taken from an ordered diff of the S312 file's output
#           on the 0.9.185 and 0.9.187 masters (eleven distinct old -> new
#           lines, applied wherever pinned) and each block was then checked
#           as an ORDERED SUBSEQUENCE of the new master's full output (six
#           of six; all 49 sections read the same way, 49 of 49). The
#           checker discriminates: the S312 file's pins against the new
#           output red all six blocks; the 0.9.186 file's pins red all six
#           (the header line); a digit mutant in I4's SleepHours line reds
#           I4; the re-pinned file against the 0.9.185 output reds all six.
#           jscreen's Missing Data & Outliers table changed the same way
#           (all three count columns) but is pinned in no walk (the
#           byte-compare of every walk, 0.9.185 against 0.9.187, found the
#           two tables and nothing else). Section count unchanged (49). The
#           human half of cps_check.R N49-N50.
# LAST VERIFIED: v0.9.187, 2026-09-25 (S313) -- sourced end to end in the
#           SANDBOX (end marker reached, 49 sections); WORKSTATION walk
#           PENDING. Prior: v0.9.186 (S313, the first form) WALKED on the
#           WORKSTATION by Jeff; the S312 file below.
# S312 EDIT (v0.9.185): PART I ADDED -- FILTER ACCOUNTING, nine sections
#           (I1 the student's shape, I2 the jsubset() fold with its note,
#           I3 the clean-analysis face, I4 the collapsed row, I5 the "list"
#           override, I6 per_code on a declared jcomplete()-only variable,
#           I7 the same variable as a condition, I8 a condition that keeps
#           its missing cases, I9 jcomplete()'s "1 case" line); section
#           count 40 -> 49. PARTS A-H RE-PINNED for the breakdown's new
#           form: header "Missing data" (was "Missing-data breakdown"),
#           the Filtered column under a pipeline, the "%" headers centred,
#           and the label column at the rows' own width -- 21 Expected
#           lines across A3, A4, B2-B6, C1 and C2 (A3's rule narrows with
#           its bottom), taken from an ordered diff of the S311 file's
#           output on the old and new masters and applied in file order;
#           every pinned breakdown line in A-H was then confirmed present
#           in the new output (26 lines; a digit mutant is reported
#           absent). Nothing else in A-H changed: no condition there tests
#           a variable with missingness, so no note and no jcomplete()-only
#           row appears. Every Part I Expected is a sink() capture from the
#           edited master at width 76, byte-compared; the Part I self-check
#           (each section's code re-run against its own Expected, 9/9) was
#           mutation-tested (a changed digit reds I4) -- after a first
#           checker that stopped at the first blank line and could not fail
#           was itself caught by the digit mutant. Two earlier S312 forms
#           (v0.9.183, seven sections, "(filter only)" tags and condition-
#           variable rows, walked on the workstation; v0.9.184, nine
#           sections, the note, walked on the workstation) precede this.
# LAST VERIFIED: v0.9.185, 2026-09-25 (S312) -- WALKED on the WORKSTATION
#           (Jeff, confirmed at S313), after the sandbox source (end marker
#           reached, 49 sections). Prior:
# S296 EDIT (v0.9.169): H3's SECOND Expected line re-pinned -- the formula
#           path now names the frame (the S295 defect fixed), so both lines
#           read "the d0 data frame". Capture: sink() to file from the edited
#           master, byte-compared. Section count unchanged (40).
# LAST VERIFIED: v0.9.169, 2026-09-16 (S296) -- WALKED on the WORKSTATION
#           (source with echo = TRUE from Downloads, after a clean
#           devtools::check() on the received S296 master), end marker
#           reached, all 40 sections; H3's two lines read identically and
#           match the re-pinned Expected. Prior:
# S295 EDIT (v0.9.168): PART H re-pinned to the zero-row input guard. H1
#           wrapped in tryCatch (it now stops, and a bare call halts the
#           walk at H1 -- which is what happened on the first S295 run);
#           H1 and H2 re-pinned to the one shared sentence; H3 ADDED for
#           jplot, the only place either regression file covers it. Section
#           count 39 -> 40. The old H1/H2 open item is CLOSED by this.
#           Every Expected block here was CAPTURED from a run, not composed
#           -- but on a synthetic zero-row frame named d0 rather than on
#           clinic, since the guard fires before any column is touched and
#           the message depends only on the frame name and the caller.
#           CONFIRMED identical on the clinic walk, same session.
# LAST VERIFIED: v0.9.168, 2026-09-16 (S295) -- WALKED on the WORKSTATION,
#           end marker reached, all 40 sections, Part H read against its
#           four new Expected blocks. Prior:
# S294 EDIT (v0.9.167, 2026-09-14): the Setup and Restore reset lines moved
#           to the clear.all = TRUE forms, and the four mid-file clears (B2,
#           B3, F3 jsubset; B5 jcomplete) to the named-frame f(d, NULL) --
#           the S294 NULL flip: a bare f(NULL) now clears only the default
#           frame, and this walk sets none. Same messages either way (one
#           frame), confirmed in the walk below; no Expected touched.
#           v0.9.167, 2026-09-14 (S294) -- WALKED on the WORKSTATION,
#           end marker reached, every section matching; the four re-formed
#           clears rendered byte-identically to the bare form they replaced
#           (see the S294 EDIT note above). H1/H2 and the G1/G2 MV candidate
#           remain open as logged below.
#           Prior: v0.9.166, 2026-09-13 (S293) -- WALKED on the WORKSTATION
#           end to end (source with echo), all 39 sections, end marker
#           reached, every block read against its Expected. Five rows
#           re-pinned for the pipeline-row label change: jsubset ->
#           jsubset() in B1, B2, B3 and jcomplete -> jcomplete() in B4, B5.
#           Two padding spaces removed per row, so every count stays in
#           its column (the label field is floored at 15 by the heading,
#           and Auto-listwise is still the widest label). B6's subset =
#           row is unchanged by design. No other pin moves: F3 prints no
#           table, and G-H carry no pipeline row. Each re-pinned row was
#           verified byte-for-byte against a sink capture from the edited
#           master before delivery. The S293 ASCII ellipsis change ("..."
#           for U+2026 in the 40-column cap) touches nothing here -- no
#           pinned line reaches the cap.
#           Prior: v0.9.162, 2026-09-09 (S287) -- WALKED on the WORKSTATION,
#           twice: a line-by-line pass in which a syntax detour after B6
#           leaked jsubset(Condition > 3) into B7-E5 (every divergence in
#           that span was the filter -- the E2/E3 "1 category(ies)" errors
#           included), re-walked clean from B7; then a full source(echo =
#           TRUE) run with all 39 sections matching their pinned blocks.
#           F4 decided KEEP (Jeff, S287). The self-check that built this
#           file (its own code run against its own Expecteds, 39/39) was
#           itself mutation-tested: a changed digit, a dropped blank, a
#           duplicated row and an inserted blank each red their own section.
# RUN:      line-by-line first (read each block of output before moving on).
#           Also source()-safe: the one deliberate error is tryCatch-wrapped.
#           Under source(), run WITH echo = TRUE, per the conventions file.
#           By section: source walk_tools.R, then rewalk("cps") shows the
#           sections the PENDING line names and rewalk("cps", "A1") shows one,
#           each from a fresh Setup and its NEEDS. Add prepare = TRUE to run
#           only what the section needs and step through it by hand.
# SECTIONS: NOT independent. Parts B, D, F, G and J set pipeline or joutput state
#           and clear it a section or two later, exactly as the numbered
#           comments say. Run a Part start to finish, or reset by hand.
# PAIR:     cps_check.R is the assertion half. This file shows the shape; that
#           file proves it. Neither replaces the other.
# EXPECTED: each block is pinned from the analysis title through the FIRST line
#           of the results, then elided. The block is what this file locks; the
#           statistics below it belong to the other regression files. Every
#           pinned block is a byte-faithful capture at the pinned width, not a
#           transcription -- consecutive blank lines are real.
# ENDING:   the file MUST end with the executable end-marker line at the foot.
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# --- Setup -------------------------------------------------------------------

# jstats must be loaded already: devtools::load_all() (development) OR
# library(jstats) (installed) -- never both in one session.
stopifnot(exists("jload", mode = "function"))

# Session state to hand back at the foot (record / force / restore, S253).
.entry_message_width <- getOption(".jst_options_message_width")
.entry_default_data  <- getOption(".jst_default_data")

# Message-width pin: every block below was captured at 76. MANDATORY -- since
# v0.9.142 the emitter wraps to this setting, and since S256 the shipped
# default follows the console pane, so without the pin the Expecteds compare
# against whatever size the window happens to be.
.pin_width <- 76L
options(.jst_options_message_width = .pin_width)

# Neutral pipeline state (never assume the prior state is clean).
jsubset(clear.all = TRUE); jcomplete(clear.all = TRUE); joutput(NULL)
jdummy(clear.all = TRUE)

# --- Fixture -----------------------------------------------------------------
# The SHIPPED clinic (package = TRUE: a bare jload("clinic") can be shadowed
# by the derived .rds in the test-data folder), plus two edits so every
# missingness form the visibility rules care about is present in one frame:
#
#   SocialSupport rows 1-3 -> plain NA   a System/NA source, no declaration
#   StressClean            -> Stress with its four code cells set to 16, i.e.
#                             DECLARED but clean: na_values kept, no cell uses
#                             one. This is the state the old rule printed a
#                             block for and the new rule does not.
#
# Stress and SleepHours carry their declared -99/-98 cells on DIFFERENT rows,
# which is what Part B's discrepancy sections need.

jload("clinic", name = "d", package = TRUE, overwrite = TRUE, quiet = TRUE)
d$SocialSupport[1:3] <- NA
d$StressClean <- d$Stress
d$StressClean[c(6L, 16L, 25L, 44L)] <- 16L

# The text fixture for Part K (S340): twelve cases, inline, no dataset.
#
#   Source    text: two empty cells, one of three spaces, one of a tab, one NA
#   Flag      text: "Y" or empty -- a tick-box column as an export writes it
#   Score     a number to analyze
#   Marital   a string variable with DECLARED MISSING STRINGS, as haven reads
#             one from a .sav: "UNKNOWN" (no label) and "REF" ("Refused"),
#             and one NA cell
tx <- data.frame(
  Source = c("Adult", "Adult", "Juvenile", "", "   ", NA, "Adult", "",
             "Juvenile", "Adult", "\t", "Adult"),
  Flag   = c("Y", "", "Y", "", "Y", "", "", "Y", "", "", "Y", ""),
  Score  = c(21, 34, 27, 45, 23, 36, 52, 41, 29, 33, 38, 47),
  stringsAsFactors = FALSE)
tx$Marital <- haven::labelled_spss(
  c("UNKNOWN", "Married", "Single", "Married", "UNKNOWN", "Single",
    "Married", NA, "REF", "Single", "Married", "Single"),
  labels = c(Refused = "REF"), na_values = c("UNKNOWN", "REF"),
  label = "Marital status")


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART A -- STANDARD MODE, NO PIPELINE STEP ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The upper table prints only when it has an EXCLUSION ROW (rule 1). With no
# pipeline step active, the only thing that can supply one is an Auto-listwise
# row with a nonzero count. Every other state gets the one-line N statement in
# the block's slot instead (rule 3). Missingness no longer enters this gate at
# all: a declaration on its own no longer produces a block.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# A1 -- jfreq on a variable with declared codes present ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jfreq(d, Stress)

# Expected:
#   Frequencies
#
#   70 Cases in the 1 Variable Pool
#
#   Stress
#   [... results not pinned here ...]
#
# Things to look at:
#   - No upper table. Nothing was excluded, so there is no exclusion row and
#     the N line takes the slot (rules 1, 3).
#   - This is the redundancy Jeff raised at the S282 walk: the old two-row
#     block said 70, and the frequency table's Total row below it said 70.
#   - Pool form with the variable count (rule 5). The singular reads '1
#     Variable Pool'.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# A2 -- jdesc on a code-bearing variable and a plain-NA variable ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jdesc(d, Stress, SocialSupport)

# Expected:
#   Descriptive Statistics
#
#   70 Cases in the 2 Variable Pool; 63 Complete on All
#
#   Note: Listwise deletion using jcomplete() first would leave 63 cases.
#
#   Variable       Total  Non_missing  Min  Max   Mean     SD
#   [... results not pinned here ...]
#
# Things to look at:
#   - Per-variable Ns differ (66 and 67), so the N line adds the complete-on-
#     all count -- which is the discrepancy note's own fact (rule 5).
#   - The note still prints at standard, on its own line below the N line.
#   - ONE blank between the note and the table, not two. Until v0.9.162 jdesc
#     printed a leading blank of its own here.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# A3 -- jcorr: no upper table, but a bottom that carries counts ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jcorr(d, Stress, SocialSupport, Flourishing)

# Expected:
#   Pearson Bivariate Correlations
#
#   70 Cases in the 3 Variable Pool; 63 Complete on All
#
#   Missing data   From 70   %
#       Stress
#         Missing     4     5.7
#       SocialSupport
#         Missing     3     4.3
#   ---------------------------
#
#   Bivariate Correlations (Pearson)
#   [... results not pinned here ...]
#
# Things to look at:
#   - The bottom breakdown prints beneath the N LINE when there is no upper
#     table (rule 4). It is not tied to the table.
#   - jcorr's per-pair Ns live in the correlation matrix below, not in the
#     block -- the pairwise variant of the three-variant lens.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# A4 -- jlm: the Auto-listwise row makes the table informative ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jlm(Flourishing ~ Stress + SocialSupport, d)

# Expected:
#   Linear Regression
#
#   Case Processing    Excluded  Remaining
#       Original             --         70
#       Auto-listwise         7         63
#       Analysis N           --         63
#
#   Missing data   From 70   %
#       Stress
#         Missing     4     5.7
#       SocialSupport
#         Missing     3     4.3
#   --------------------------------------
#
#   Coefficients
#   [... results not pinned here ...]
#
# Things to look at:
#   - Auto-listwise 7 is a nonzero exclusion row, so the upper table prints
#     (rule 1) and its Analysis N row IS the N statement (rule 3). There is
#     never both.
#   - Rule 8 whitespace: NO blank between the last breakdown row and the
#     closing rule; exactly one blank after the rule.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# A5 -- jt on two clean variables: where nothing printed before ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jt(Flourishing ~ SoughtHelp, d)

# Expected:
#   Independent Samples T-Test
#
#   Analysis N: 70
#
#   Group Descriptives: Flourishing by SoughtHelp
#   [... results not pinned here ...]
#
# Things to look at:
#   - Nothing excluded and nothing declared. Before the redesign this call
#     printed no block at all; now the N line prints.
#   - The blank under the title is the N LINE's own leading blank, and it now
#     appears under every function's title in every mode. That is what
#     resolved the S284 jt() title-blank item without a jt() edit.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# A6 -- jfreq on a DECLARED-but-clean variable ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jfreq(d, StressClean)

# Expected:
#   Frequencies
#
#   70 Cases in the 1 Variable Pool
#
#   StressClean
#   [... results not pinned here ...]
#
# Things to look at:
#   - Codes are declared on this column but no cell carries one. Under the
#     pre-S284 rule the declaration ALONE printed a block; it no longer does.
#   - Scroll into the frequency table: the 0-count rows for the declared-but-
#     absent values are still there (rule 9). The zero row is the only visible
#     evidence that a declaration exists.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# A7 -- jlm on the declared-but-clean variable: Auto-listwise would be 0 ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jlm(Flourishing ~ StressClean + ScreenTime, d)

# Expected:
#   Linear Regression
#
#   Analysis N: 70
#
#   Coefficients
#   [... results not pinned here ...]
#
# Things to look at:
#   - Auto-listwise is suppressed at 0 (rule 2), which removes the table's
#     only exclusion row, which suppresses the table (rule 1). The N line
#     follows.
#   - The zero is recoverable: Analysis N equals Original, so nothing was
#     dropped.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART B -- PIPELINE STEPS AT STANDARD ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# A filter the user set -- jcomplete(), jsubset(), or the per-call subset =
# argument -- is an exclusion row EVEN AT 0 EXCLUDED, as the reminder that a
# filter is active. So any active pipeline step brings the upper table back.
# Sections here leave state set and clear it a section later; read the calls.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# B1 -- jsubset with a real drop, then jlm ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jsubset(d, Condition != 3)
jlm(Flourishing ~ Stress + SocialSupport, d)

# Expected:
#   jsubset activated for d: Condition != 3
#   Linear Regression
#
#   Case Processing    Excluded  Remaining
#       Original             --         70
#       jsubset()            17         53  Condition != 3
#       Auto-listwise         4         49
#       Analysis N           --         49
#
#   Missing data   From 70   %   Filtered  From 53   %
#       Stress
#         Missing     4     5.7      2        2     3.8
#       SocialSupport
#         Missing     3     4.3      1        2     3.8
#   ------------------------------------------------------
#
#   Coefficients
#   [... results not pinned here ...]
#
# Things to look at:
#   - Both kinds of exclusion row at once: jsubset 17 (user-set) and Auto-
#     listwise 4 (the analysis).
#   - The bottom gains its second column pair, From 53 -- the post-filter
#     pool.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# B2 -- the same jsubset, then jfreq: where jfreq's block earns a row ----
# NEEDS: B1
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# State from B1 is still active. This section clears it.

jfreq(d, Stress)
jsubset(d, NULL)

# Expected:
#   Frequencies
#
#   Case Processing  Excluded  Remaining
#       Original           --         70
#       jsubset()          17         53  Condition != 3
#       Remaining N        --         53
#   ----------------------------------------------------
#
#   Stress
#   [... results not pinned here ...]
#
# Things to look at:
#   - jfreq has no bottom breakdown in any tier (its base default is off and
#     the refinement layer cannot promote it), so the block is the top table
#     alone.
#   - Read the Remaining N (53) and the frequency table's Total (53) as one
#     population -- that is the S217 denominator fix holding under a filter.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# B3 -- a jsubset that excludes NOTHING, then jlm ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jsubset(d, Condition > 0)
jlm(Flourishing ~ Stress + SocialSupport, d)
jsubset(d, NULL)

# Expected:
#   jsubset activated for d: Condition > 0
#   Linear Regression
#
#   Case Processing    Excluded  Remaining
#       Original             --         70
#       jsubset()             0         70  Condition > 0
#       Auto-listwise         7         63
#       Analysis N           --         63
#
#   Missing data   From 70   %   Filtered  From 70   %
#       Stress
#         Missing     4     5.7      0        4     5.7
#       SocialSupport
#         Missing     3     4.3      0        3     4.3
#   -----------------------------------------------------
#
#   Coefficients
#   [... results not pinned here ...]
#
# Things to look at:
#   - The jsubset row prints at 0 EXCLUDED. That is deliberate: a user-set
#     filter is shown whether or not it removed anything, as the reminder that
#     it is active (rule 1).
#   - Contrast with Auto-listwise, which is suppressed at 0. The asymmetry is
#     the point: one is the user's doing, the other is the analysis's.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# B4 -- jcomplete on the model variables, then jlm ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jcomplete(d, Stress, SocialSupport)
jlm(Flourishing ~ Stress + SocialSupport, d)

# Expected:
#   Listwise Case Filter
#   Variable        N  Missing  % Missing
#   -------------  --  -------  ---------
#   Stress         70     4        5.7%
#   SocialSupport  70     3        4.3%
#
#     Complete cases: 63 of 70 (90.0%)
#     Listwise filter activated -- 7 cases will be excluded from
#     subsequent analyses.
#   Linear Regression
#
#   Case Processing  Excluded  Remaining
#       Original           --         70
#       jcomplete()         7         63  Stress, SocialSupport
#       Analysis N         --         63
#
#   Missing data   From 70   %   Filtered  From 63   %
#       Stress
#         Missing     4     5.7      4        0     0.0
#       SocialSupport
#         Missing     3     4.3      3        0     0.0
#   -----------------------------------------------------------
#
#   Coefficients
#   [... results not pinned here ...]
#
# Things to look at:
#   - The Listwise Case Filter block at the top is jcomplete talking, not the
#     CPS block. The CPS block starts under the Linear Regression title.
#   - Its three count columns are block-centered since v0.9.186: the 4 and
#     the 3 sit under the middle of "Missing", and "5.7%" / "4.3%" under the
#     middle of "% Missing" (until v0.9.185 the counts hugged the right edge
#     and the percents the left), and since v0.9.187 the "N" header sits
#     over the middle of "70". Same rule as the breakdown's counts below.
#     Where the middle cannot be exact the odd space goes on the LEFT
#     since v0.9.204 (S328): "N" sits over the 0 of 70, where it sat over
#     the 7.
#   - NO Auto-listwise row: jcomplete already removed those seven cases, so
#     the analysis dropped none and the row is suppressed (rule 2). This
#     REVERSES the pre-S284 behaviour, where the row printed at 0 as
#     confirmation.
#   - The zero is still readable -- Analysis N equals the jcomplete row's
#     Remaining, and the bottom's second column pair reads 0.0 throughout.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# B5 -- jcomplete still active, then jfreq ----
# NEEDS: B2, B4
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# State from B4 is still active. This section clears it.

jfreq(d, Stress)
jcomplete(d, NULL)

# Expected:
#   Frequencies
#
#   Case Processing  Excluded  Remaining
#       Original           --         70
#       jcomplete()         7         63  Stress, SocialSupport
#       Remaining N        --         63
#   -----------------------------------------------------------
#
#   Stress
#   [... results not pinned here ...]
#
# Things to look at:
#   - The jcomplete row carries its variable list in the trailing column, the
#     same way the jsubset row carries its expression.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# B6 -- the per-call subset = argument (no session state) ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jlm(Flourishing ~ Stress + SocialSupport, d, subset = Condition != 3)

# Expected:
#   Linear Regression
#
#   Case Processing    Excluded  Remaining
#       Original             --         70
#       subset =             17         53  Condition != 3
#       Auto-listwise         4         49
#       Analysis N           --         49
#
#   Missing data   From 70   %   Filtered  From 53   %
#       Stress
#         Missing     4     5.7      2        2     3.8
#       SocialSupport
#         Missing     3     4.3      1        2     3.8
#   ------------------------------------------------------
#
#   Coefficients
#   [... results not pinned here ...]
#
# Things to look at:
#   - subset = is a user-set filter like the two session-state steps, and gets
#     a row labelled 'subset =' on the same terms.
#   - Compare B1: same numbers, different label, no state left behind.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# B7 -- the discrepancy note on non-overlapping codes ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jdesc(d, Stress, SleepHours)

# Expected:
#   Descriptive Statistics
#
#   70 Cases in the 2 Variable Pool
#
#   Note: Listwise deletion using jcomplete() first would leave 62 cases.
#
#   Variable    Total  Non_missing  Min   Max   Mean     SD
#   [... results not pinned here ...]
#
# Things to look at:
#   - Per-variable Ns are EQUAL here (66 and 66), so rule 5 gives the plain
#     pool form with no complete-on-all count -- even though listwise would
#     leave 62, because the two variables' missing cells sit on different
#     rows.
#   - The note carries the 62. This is the state where the alternative rule-5
#     trigger was considered at S286 and declined.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART C -- THE DETAIL TIER ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# case.processing.detail changes the BOTTOM breakdown only. It cannot bring
# back an upper table the visibility rule suppressed, and it cannot turn on a
# bottom whose base default is off.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# C1 -- per_code detail on jlm at standard ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jlm(Flourishing ~ Stress + SocialSupport, d,
    case.processing.detail = "per_code")

# Expected:
#   Linear Regression
#
#   Case Processing    Excluded  Remaining
#       Original             --         70
#       Auto-listwise         7         63
#       Analysis N           --         63
#
#   Missing data              From 70   %
#       Stress
#         -99 ["Refused"]        2     2.9
#         -98 ["Don't know"]     2     2.9
#       SocialSupport
#         System/NA              3     4.3
#   --------------------------------------
#
#   Coefficients
#   [... results not pinned here ...]
#
# Things to look at:
#   - Compare A4: same upper table, but the bottom now names each code rather
#     than totalling them. Stress splits into -99 and -98; SocialSupport's
#     plain NAs read System/NA.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# C2 -- per_code detail on jdesc: its bottom appears only at this tier ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jdesc(d, Stress, SocialSupport, case.processing.detail = "per_code")

# Expected:
#   Descriptive Statistics
#
#   70 Cases in the 2 Variable Pool; 63 Complete on All
#
#   Missing data              From 70   %
#       Stress
#         -99 ["Refused"]        2     2.9
#         -98 ["Don't know"]     2     2.9
#       SocialSupport
#         System/NA              3     4.3
#   --------------------------------------
#
#   Note: Listwise deletion using jcomplete() first would leave 63 cases.
#
#   Variable       Total  Non_missing  Min  Max   Mean     SD
#   [... results not pinned here ...]
#
# Things to look at:
#   - Compare A2, which had no bottom at all. jdesc's bottom is on by base
#     default but suppressed by the refinement layer below per_code.
#   - Order: N line, bottom breakdown, closing rule, THEN the discrepancy
#     note. The note sits outside the block's rule, not inside it.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# C3 -- per_code detail on jfreq: a documented no-op ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jfreq(d, Stress, case.processing.detail = "per_code")

# Expected:
#   Frequencies
#
#   70 Cases in the 1 Variable Pool
#
#   Stress
#   [... results not pinned here ...]
#
# Things to look at:
#   - Identical to A1. jfreq's bottom base default is OFF, and the refinement
#     layer can suppress an 'on' default but cannot promote an 'off' one, so
#     no detail tier reaches it. Documented, not a defect.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART D -- THE THREE MODES ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Auto (standard's default) applies rules 1-4. Minimal never prints the table
# and always prints the N line. Full, and the joutput(case.processing = TRUE)
# override, are LITERAL: the table prints even when its only rows are Original
# and the endpoint -- though rule 2 still applies inside it.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# D1 -- MINIMAL: jlm ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

joutput("minimal", quiet = TRUE)
jlm(Flourishing ~ Stress + SocialSupport, d)

# Expected:
#   Linear Regression
#
#   Analysis N: 63 (7 Excluded)
#
#   Coefficients
#   [... results not pinned here ...]
#
# Things to look at:
#   - Minimal never prints the table and always prints the N line (rule 6).
#     The excluded count rides along whenever exclusions occurred (rule 5).
#   - Nothing here teaches: no output text points at joutput() (rule 7). The
#     explanation lives in the roxygen.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# D2 -- MINIMAL: jt -- the clean case ----
# NEEDS: D1
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Minimal is still active from D1.

jt(Flourishing ~ SoughtHelp, d)

# Expected:
#   Independent Samples T-Test
#
#   Analysis N: 70
#
#   Group Descriptives: Flourishing by SoughtHelp
#   [... results not pinned here ...]
#
# Things to look at:
#   - No exclusions, so the bare Analysis N form with no parenthetical.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# D3 -- FULL: jfreq -- the empty block is forced ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# This section switches to full.

joutput("full", quiet = TRUE)
jfreq(d, Stress)

# Expected:
#   Frequencies
#
#   Case Processing  Excluded  Remaining
#       Original           --         70
#       Remaining N        --         70
#   ------------------------------------
#
#   Stress
#   [... results not pinned here ...]
#
# Things to look at:
#   - Full is LITERAL: the table prints even though its only rows are Original
#     and the endpoint, and even though nothing was excluded. This is the
#     block that auto now suppresses -- A1 is the same call at standard.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# D4 -- FULL: jt on clean variables -- rule 2 still applies inside ----
# NEEDS: D3
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Full is still active. This section restores the default.

jt(Flourishing ~ SoughtHelp, d)
joutput(NULL, quiet = TRUE)

# Expected:
#   Independent Samples T-Test
#
#   Case Processing  Excluded  Remaining
#       Original           --         70
#       Analysis N         --         70
#   ------------------------------------
#
#   Levene's Test for Homogeneity of Variance
#   [... results not pinned here ...]
#
# Things to look at:
#   - The table is forced, but there is still NO Auto-listwise row: rule 2
#     suppresses it at 0 in every state, including inside a literal mode.
#   - So 'literal' means the table is not suppressed -- it does not mean every
#     row is shown.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# D5 -- STANDARD with the case.processing = TRUE override ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

joutput(case.processing = TRUE, quiet = TRUE)
jfreq(d, ScreenTime)
joutput(NULL, quiet = TRUE)

# Expected:
#   Frequencies
#
#   Case Processing  Excluded  Remaining
#       Original           --         70
#       Remaining N        --         70
#   ------------------------------------
#
#   ScreenTime
#   [... results not pinned here ...]
#
# Things to look at:
#   - The toggle set to TRUE is the always-mode, and behaves exactly as full
#     does for this block -- on a completely clean variable.
#   - Its opposite, case.processing = FALSE, is Part F.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART E -- THE N INVENTORY: all nine functions at minimal ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Rule 3 makes the N line the mechanism for every function, which is why the
# "Number of obs" line proposed for jlm and jlogistic was NOT taken. Read this
# Part as an inventory: nine titles, nine N lines, three distinct forms.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# E1 -- jt ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Minimal for the whole of Part E.

joutput("minimal", quiet = TRUE)
jt(Flourishing ~ SoughtHelp, d)

# Expected:
#   Independent Samples T-Test
#
#   Analysis N: 70
#
#   Group Descriptives: Flourishing by SoughtHelp
#   [... results not pinned here ...]
#
# Things to look at:
#   - Analysis N form, listwise layout.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# E2 -- jaov ----
# NEEDS: E1
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jaov(Flourishing ~ Condition, d)

# Expected:
#   One-Way ANOVA
#
#   Analysis N: 70
#
#   Group Descriptives: Flourishing by Condition
#   [... results not pinned here ...]

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# E3 -- jcrosstab ----
# NEEDS: E1
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jcrosstab(SoughtHelp ~ Condition, d)

# Expected:
#   Cross-Tabulation
#
#   Analysis N: 70
#
#   Crosstab: SoughtHelp by Condition
#   [... results not pinned here ...]

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# E4 -- jlm ----
# NEEDS: E1
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jlm(Flourishing ~ Stress + SocialSupport, d)

# Expected:
#   Linear Regression
#
#   Analysis N: 63 (7 Excluded)
#
#   Coefficients
#   [... results not pinned here ...]
#
# Things to look at:
#   - The excluded count appears because these two carry missing cells.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# E5 -- jlogistic ----
# NEEDS: E1
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jlogistic(SoughtHelp ~ Stress + SocialSupport, d)

# Expected:
#   Logistic Regression
#
#   Analysis N: 63 (7 Excluded)
#
#   Coefficients
#   [... results not pinned here ...]
#
# Things to look at:
#   - One blank between the N line and Coefficients, not two -- jlogistic
#     printed a leading blank of its own until v0.9.162.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# E6 -- jalpha ----
# NEEDS: E1
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jalpha(d, Anxiety3, Anxiety4, Anxiety5)

# Expected:
#   Reliability Analysis
#
#   Analysis N: 64 (6 Excluded)
#
#   Reliability Statistics
#   [... results not pinned here ...]
#
# Things to look at:
#   - jalpha is a LISTWISE layout, so it takes the Analysis N form, not the
#     pool form its data-first syntax might suggest.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# E7 -- jcorr ----
# NEEDS: E1
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jcorr(d, Stress, SocialSupport, Flourishing)

# Expected:
#   Pearson Bivariate Correlations
#
#   70 Cases in the 3 Variable Pool; 63 Complete on All
#
#   Bivariate Correlations (Pearson)
#   [... results not pinned here ...]
#
# Things to look at:
#   - Pairwise takes the POOL form -- and the complete-on-all count, because
#     the per-variable Ns differ.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# E8 -- jdesc ----
# NEEDS: E1
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jdesc(d, Stress, SocialSupport)

# Expected:
#   Descriptive Statistics
#
#   70 Cases in the 2 Variable Pool; 63 Complete on All
#
#   Variable       Total  Non_missing  Min  Max   Mean     SD
#   [... results not pinned here ...]
#
# Things to look at:
#   - Pool form. No discrepancy note at minimal (rule 7), so the fact it
#     carries has to ride on the N line -- which is why rule 5 puts it there.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# E9 -- jfreq ----
# NEEDS: E1
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# This section restores the default output level.

jfreq(d, Condition)
joutput(NULL, quiet = TRUE)

# Expected:
#   Frequencies
#
#   70 Cases in the 1 Variable Pool
#
#   Condition
#   [... results not pinned here ...]
#
# Things to look at:
#   - Pool form, singular. Nine functions, three forms: Analysis N for the six
#     listwise ones, pool for jcorr/jdesc/jfreq, with the complete-on-all
#     variant where the per-variable Ns differ.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART F -- NEVER-MODE: joutput(case.processing = FALSE) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The toggle set to FALSE is never-mode for the WHOLE block: no upper table
# and no bottom breakdown, in any detail tier, but the N line still prints
# (Table 1, confirmed S286). Note that never-mode is INVISIBLE in the states
# where auto already suppresses the table -- F1 and F2 render exactly as their
# standard-mode counterparts. F3 and F4 are where it bites.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# F1 -- never-mode, jfreq: indistinguishable from auto here ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Never-mode for the whole of Part F.

joutput(case.processing = FALSE, quiet = TRUE)
jfreq(d, Stress)

# Expected:
#   Frequencies
#
#   70 Cases in the 1 Variable Pool
#
#   Stress
#   [... results not pinned here ...]
#
# Things to look at:
#   - Identical to A1. Auto already suppressed the table in this state, so
#     turning the block off changes nothing visible.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# F2 -- never-mode, jcorr: the BOTTOM is what goes ----
# NEEDS: F1
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jcorr(d, Stress, SocialSupport, Flourishing)

# Expected:
#   Pearson Bivariate Correlations
#
#   70 Cases in the 3 Variable Pool; 63 Complete on All
#
#   Bivariate Correlations (Pearson)
#   [... results not pinned here ...]
#
# Things to look at:
#   - Compare A3, the same call at standard: the bottom breakdown was there
#     and is now gone. Never-mode is the whole block, not just the table.
#   - Note this one is NOT identical to its standard counterpart -- unlike F1.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# F3 -- never-mode, jlm under an ACTIVE FILTER: the table still goes ----
# NEEDS: F1
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jsubset(d, Condition != 3)
jlm(Flourishing ~ Stress + SocialSupport, d)
jsubset(d, NULL)

# Expected:
#   jsubset activated for d: Condition != 3
#   Linear Regression
#
#   Analysis N: 49 (21 Excluded)
#
#   Coefficients
#   [... results not pinned here ...]
#
# Things to look at:
#   - A jsubset row is an exclusion row, so auto would print the full table
#     here (that is B1). Never-mode drops it anyway -- Table 1 reads 'any' in
#     the exclusion-row column for the never row.
#   - The N line survives and carries the filter's effect: 49, 21 excluded.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# F4 -- never-mode, jdesc at per_code: the bottom goes, the NOTE stays ----
# NEEDS: F1
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# This section restores the default.

jdesc(d, Stress, SocialSupport, case.processing.detail = "per_code")
joutput(NULL, quiet = TRUE)

# Expected:
#   Descriptive Statistics
#
#   70 Cases in the 2 Variable Pool; 63 Complete on All
#
#   Note: Listwise deletion using jcomplete() first would leave 63 cases.
#
#   Variable       Total  Non_missing  Min  Max   Mean     SD
#   [... results not pinned here ...]
#
# Things to look at:
#   - Compare C2, the same call at standard: the bottom breakdown is gone, in
#     the detail tier that exists to show it. Never-mode outranks the tier.
#   - The listwise-discrepancy note is still here, and that is DECIDED
#     (Jeff, S287: keep). It is gated on output LEVEL (silent at minimal)
#     rather than on the case.processing toggle: turning the block off
#     removes the accounting, not the remedy suggestion.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART G -- THE GROUPED LAYOUT: jdesc(by = ) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# jdesc's grouped path is a SECOND CPS call site, and until S287 it printed
# its own blank line above the block, doubling the one the block already opens
# with. Nothing observed it before this file: the S284 grid had no by =
# section.
# S316 (v0.9.191, AUDIT-027): the grouped layout now accounts for its cases.
# jdesc(by =) describes the cases that HAVE a group -- a case missing on the
# grouping variable is in no table -- and until this build nothing said so:
# the block read "70 Cases in the 2 Variable Pool" over groups summing to 65,
# and a variable's own missing cases hid inside a lone per-group N. Now the
# cases missing on the grouping variable are a "by =" row in the upper table
# (the layout's counterpart of Auto-listwise: nonzero only, an exclusion row
# for Table 1, labeled the way the pipeline rows are); the N line counts the
# described variables, not the grouping variable (the S287 mv candidate,
# closed); and every group table carries the ungrouped table's Total and
# Non_missing, so the Totals sum to the N above and each row states its own
# missing count. G1-G2 re-pinned in full (the table is now part of what
# they lock); G3-G7 added. Every Expected is a sink() capture at 76.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# G1 -- jdesc grouped, at standard: a CLEAN grouping variable ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jdesc(d, Stress, by = Condition)

# Expected:
#   Descriptive Statistics by Condition (4 levels)
#
#   70 Cases in the 1 Variable Pool
#
#   Stress
#
#   Condition         Total  Non_missing  Min  Max   Mean     SD
#   ----------------  -----  -----------  ---  ---  ------  -----
#   1: Control          18        18       0    40  15.667  8.931
#   2: CBT              14        13       6    29  14.538  6.591
#   3: Mindfulness      17        15       5    32  16.133  6.812
#   4: Support group    21        20       0    23  14.450  7.258
#
# Things to look at:
#   - ONE blank between the title and the N line. Until v0.9.162 there were
#     two: the grouped path printed its own blank above a block that already
#     opens with one.
#   - The block renders ONCE for the whole grouped output, not once per group.
#   - "1 Variable Pool" for a one-variable call (S316 re-pin; it read "2"
#     from S287 to v0.9.190, the grouping variable counting itself in). No
#     table and no "by =" row: nobody is missing on Condition, and a row
#     that would read 0 is suppressed on the same terms as Auto-listwise 0.
#   - THE TABLE (new). Total is the group's size, Non_missing its cases
#     with a Stress value: 18 + 14 + 17 + 21 = 70, the N above, and the
#     four missing on Stress sit in CBT (1), Mindfulness (2) and Support
#     group (1) -- readable per group for the first time. Until v0.9.190
#     the table had one N column (the Non_missing count) and the four were
#     nowhere.
#   - ONE blank line closes the output (S316). It was two: the grouped path
#     printed a closing blank after the last table's own.
#   - COLUMN CENTRING (v0.9.192, Jeff's catch on the 0.9.191 walk). Each
#     header sits over the middle of its column -- "SD" over the middle of
#     8.931, not flush right -- the counts sit centered under Total and
#     Non_missing, aligned on their ones digit, and Mean and SD keep their
#     decimal alignment. The ungrouped table (A2, E8) reads the same way,
#     and since v0.9.204 so does every table in the package, with the odd
#     spare space on the LEFT (S328): 21 and 20 sit one place right of
#     where they did under Total and Non_missing.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# G2 -- jdesc grouped, at minimal ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

joutput("minimal", quiet = TRUE)
jdesc(d, Stress, by = Condition)
joutput(NULL, quiet = TRUE)

# Expected:
#   Descriptive Statistics by Condition (4 levels)
#
#   70 Cases in the 1 Variable Pool
#
#   Stress
#
#   Condition      Total  Non_missing  Min  Max   Mean     SD
#   -------------  -----  -----------  ---  ---  ------  -----
#   Control          18        18       0    40  15.667  8.931
#   CBT              14        13       6    29  14.538  6.591
#   Mindfulness      17        15       5    32  16.133  6.812
#   Support group    21        20       0    23  14.450  7.258
#
# Things to look at:
#   - The pinned block is IDENTICAL to G1 down to the table -- minimal and
#     auto agree here because auto already had no exclusion row. The
#     difference between the two sections is in the group column's value
#     labels (minimal's value.id is "labels").
#   - What this locks is that the grouped path prints the N line at minimal
#     too, rather than falling silent.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# G3 -- a grouping variable WITH missing cases: the by = row (S316) ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Medication declares -99 ["Refused"] on 5 of the 70. Until v0.9.191 this
# call printed "70 Cases in the 2 Variable Pool" over groups of 39 and 26.

jdesc(d, Flourishing, by = Medication)

# Expected:
#   Descriptive Statistics by Medication (2 levels)
#
#   Case Processing  Excluded  Remaining
#       Original           --         70
#       by =                5         65  Medication
#       Remaining N        --         65
#   ------------------------------------------------
#
#   Flourishing
#
#   Medication  Total  Non_missing  Min  Max   Mean     SD
#   ----------  -----  -----------  ---  ---  ------  ------
#   0: No         39        39       25   75  51.564  11.553
#   1: Yes        26        26        0   72  44.000  15.367
#
# Things to look at:
#   - The "by =" row is the grouped layout's Auto-listwise: the cases the
#     ANALYSIS excluded after the pipeline, here because they have no group.
#     Same slot, same terms (nonzero only), the variable in the detail
#     column the way jsubset() shows its expression. Compare jt(Flourishing
#     ~ Medication, d), whose Auto-listwise row carries the same 5.
#   - Original 70, by = 5, Remaining N 65, and the table's Totals 39 + 26 =
#     65. Every number on the screen now ties to another.
#   - No bottom at standard: jdesc reaches its breakdown only at per_code
#     (G4). The row is what makes the table print at all here -- before it
#     the standard tier had no exclusion row and showed the N line.
#   - The rule closes on the endpoint row with no blank before it (rule 8).

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# G4 -- the same grouping variable at per_code, two variables ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jdesc(d, Flourishing, Stress, by = Medication, case.processing.detail = "per_code")

# Expected:
#   Descriptive Statistics by Medication (2 levels)
#
#   Case Processing  Excluded  Remaining
#       Original           --         70
#       by =                5         65  Medication
#       Remaining N        --         65
#
#   Missing data              From 70   %
#       Stress
#         -99 ["Refused"]        2     2.9
#         -98 ["Don't know"]     2     2.9
#       Medication
#         -99 ["Refused"]        5     7.1
#   ------------------------------------------------
#
#   Flourishing
#
#   Medication  Total  Non_missing  Min  Max   Mean     SD
#   ----------  -----  -----------  ---  ---  ------  ------
#   0: No         39        39       25   75  51.564  11.553
#   1: Yes        26        26        0   72  44.000  15.367
#
#   Stress
#
#   Medication  Total  Non_missing  Min  Max   Mean     SD
#   ----------  -----  -----------  ---  ---  ------  -----
#   0: No         39        35       0    29  14.229  6.730
#   1: Yes        26        26       0    40  16.385  8.462
#
# Things to look at:
#   - The grouping variable KEEPS its breakdown rows (a decision, S316):
#     the by = row says 5 were excluded, the breakdown says which code
#     they carried. Contrast the S312 rule for a jsubset() / subset =
#     condition variable, which gets no rows because its count sits on the
#     filter row -- here the code detail is the reason to keep them.
#   - The breakdown counts across the whole pool (From 70), as it does for
#     every layout: Stress's four missing include any case also missing on
#     Medication. The tables count among the grouped cases: Stress's
#     Non_missing 35 + 26 = 61 of a Total 65, so 4 missing there too --
#     the two surfaces agree here because no case is missing on both.
#   - The rule sits under the breakdown and the by = row above it; one
#     rule closes the block, as everywhere.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# G5 -- the same call at minimal: the N line states the grouped count ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

joutput("minimal", quiet = TRUE)
jdesc(d, Flourishing, Stress, by = Medication)
joutput(NULL, quiet = TRUE)

# Expected:
#   Descriptive Statistics by Medication (2 levels)
#
#   65 Cases in the 2 Variable Pool (5 Excluded)
#
#   Flourishing
#
#   Medication  Total  Non_missing  Min  Max   Mean     SD
#   ----------  -----  -----------  ---  ---  ------  ------
#   No            39        39       25   75  51.564  11.553
#   Yes           26        26        0   72  44.000  15.367
#
#   Stress
#
#   Medication  Total  Non_missing  Min  Max   Mean     SD
#   ----------  -----  -----------  ---  ---  ------  -----
#   No            39        35       0    29  14.229  6.730
#   Yes           26        26       0    40  16.385  8.462
#
# Things to look at:
#   - Never-mode: no table, so the N line carries the by = row's fact in
#     its rider -- "65 Cases ... (5 Excluded)", the same way jlm at minimal
#     reads "Analysis N: 63 (7 Excluded)" (Part D). Until v0.9.191 this line
#     read "70 Cases in the 3 Variable Pool" here.
#   - "2 Variable Pool": Flourishing and Stress, the described variables.
#     The grouping variable no longer counts itself in.
#   - Whether "Cases in the Variable Pool" still reads right once the by =
#     exclusion has been applied is an mv question, logged S316; the
#     numbers are the design.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# G6 -- under a jsubset(): the by = row follows the pipeline row ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Condition != 3 keeps 53 of the 70; 2 of the 53 are missing on Medication.
# This section clears its own filter.

jsubset(d, Condition != 3)
jdesc(d, Flourishing, Stress, by = Medication)
jsubset(d, NULL)

# Expected:
#   jsubset activated for d: Condition != 3
#   Descriptive Statistics by Medication (2 levels)
#
#   Case Processing  Excluded  Remaining
#       Original           --         70
#       jsubset()          17         53  Condition != 3
#       by =                2         51  Medication
#       Remaining N        --         51
#   ----------------------------------------------------
#
#   Flourishing
#
#   Medication  Total  Non_missing  Min  Max   Mean     SD
#   ----------  -----  -----------  ---  ---  ------  ------
#   0: No         29        29       25   71  49.793  11.524
#   1: Yes        22        22        0   72  43.818  15.960
#
#   Stress
#
#   Medication  Total  Non_missing  Min  Max   Mean     SD
#   ----------  -----  -----------  ---  ---  ------  -----
#   0: No         29        27       0    29  14.407  7.324
#   1: Yes        22        22       0    40  15.273  8.373
#
#   jsubset cleared for d (had: Condition != 3).
#
# Things to look at:
#   - Row order: Original, the pipeline row(s), by =, the endpoint -- the
#     analysis's own exclusion comes after the user's, where Auto-listwise
#     sits on the listwise layouts (B1).
#   - The chain reads straight down: 70 - 17 = 53, 53 - 2 = 51, and the
#     Totals 29 + 22 = 51. Until v0.9.191 the endpoint read 53 over groups
#     summing to 51 -- the shape this Part exists to catch.
#   - Stress: 27 + 22 = 49 with a value, 2 missing among the 51 grouped
#     cases, both in "No". This is the ungrouped jdesc's "Total 53 /
#     Non_missing 51", per group.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# G7 -- the two stops (S316): what used to be two raw states ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Until v0.9.191 the first call described Medication as two empty groups (N
# 0, blank statistics: the column had been converted to group labels before
# it was summarized), and the other two fell through to a raw base R error
# under a "(0 levels)" title. All three are tryCatch-wrapped so the walk can
# run under source().

tryCatch(jdesc(d, Flourishing, Medication, by = Medication),
         error = function(e) cat("Error: ", conditionMessage(e), "\n", sep = ""))
d7 <- d; d7$Empty <- NA_real_
tryCatch(jdesc(d7, Flourishing, by = Empty),
         error = function(e) cat("Error: ", conditionMessage(e), "\n", sep = ""))
jsubset(d, Medication == 5)
tryCatch(jdesc(d, Flourishing, by = Medication),
         error = function(e) cat("Error: ", conditionMessage(e), "\n", sep = ""))
jsubset(d, NULL)

# Expected:
#   Error: jdesc(): Medication is the grouping variable (by = Medication) and
#   cannot also be described.
#   Error: jdesc(): Empty has no non-missing values, so there are no groups
#   to describe.
#   jsubset activated for d: Medication == 5
#   Error: jdesc(): Medication has no non-missing values after jsubset(), so
#   there are no groups to describe.
#   jsubset cleared for d (had: Medication == 5).
#
# Things to look at:
#   - Each stop fires BEFORE the title prints: nothing above the error line.
#   - The third names the step the way the Case Processing rows do
#     (jsubset(); jcomplete() and subset = take the same slot, joined with
#     "and" when several are active), so a reader who forgot a standing
#     filter is told where the cases went.
#   - Both wordings are new at S316 and are listed verbatim in the delivery
#     for the clarity check; mv is the channel for any reword.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART H -- THE DEGENERATE FRAME ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# RE-PINNED S295 (v0.9.168). A zero-row INPUT frame now STOPS at the pipeline
# entry, in every function that has one. What Part H used to show -- jfreq
# rendering a table of zeros while jlm stopped with a different message -- is
# gone; the point of the three sections below is now that they all read ALIKE.
#
# Each call is wrapped so source() survives. H2 already was; H1 needed it once
# jfreq started stopping, and without it the walk halts here and nothing after
# Part H is read.
#
# The block's own empty-frame branch (no table, no N line, but the closing
# blank still emitted) is unchanged and still correct -- no public call can
# reach it any more, so it is asserted directly in cps_check.R N34a-d rather
# than seen here.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# H1 -- a zero-row frame reaching jfreq ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

d0 <- d[0L, , drop = FALSE]
tryCatch(jfreq(d0, Stress),
         error = function(e) cat("Caught: ", conditionMessage(e), "\n",
                                 sep = ""))

# Expected:
#   Frequencies
#   Caught: jfreq(): the d0 data frame has no rows, so there is nothing
#   to analyze.
#
# Things to look at:
#   - The "Frequencies" title, with the error against it, as in H2 (S338,
#     v0.9.212). Until then jfreq printed its title AFTER the pipeline call,
#     so the stop pre-empted it and came with no title -- the one analysis
#     function whose pipeline stops did.
#   - The frame is named as the user typed it, with an article and its kind
#     noun (Rule T): "the d0 data frame", never a bare lowercase "d0" opening
#     the sentence.
#   - The wrap after "nothing" is the orphan pull-back, not the width: the
#     line has room for "to", but leaving "analyze." alone on the last line
#     falls under the tail floor, so "to" is pulled down with it.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# H2 -- a zero-row frame reaching jlm ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

d0 <- d[0L, , drop = FALSE]
tryCatch(jlm(Flourishing ~ Stress + SocialSupport, d0),
         error = function(e) cat("Caught: ", conditionMessage(e), "\n",
                                 sep = ""))

# Expected:
#   Linear Regression
#   Caught: jlm(): the d0 data frame has no rows, so there is nothing
#   to analyze.
#
# Things to look at:
#   - One sentence, differing from H1 only in the prefix. Before S295 this
#     said "All cases were excluded by the pipeline and/or listwise deletion"
#     and sent the reader to a Case Processing Summary -- untrue on this path
#     (nothing was excluded; the frame arrived empty) and unhelpful (no
#     summary prints). That message still exists and is still right for the
#     case it describes: a filter that empties a frame that HAD rows.
#   - NO blank line between the title and the error. There used to be one,
#     and it was the block's closing blank, emitted as the printer passed
#     through on its way to jlm's own late guard. With the stop moved earlier
#     the printer never runs. This is not a regression: every error in this
#     window sits against the title the same way -- a variable-not-found
#     error on a NON-empty frame reads identically (verified S295).

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# H3 -- the same guard in jplot, both paths (S295) ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# jplot enters through the same pipeline helper, so it inherited the guard.
# cps_check.R N33 asserts both paths (its two jplot legs, since S295); this
# section shows what they look like.

d0 <- d[0L, , drop = FALSE]
tryCatch(jplot(d0, Stress),
         error = function(e) cat("Caught: ", conditionMessage(e), "\n",
                                 sep = ""))
tryCatch(jplot(Flourishing ~ Stress, d0),
         error = function(e) cat("Caught: ", conditionMessage(e), "\n",
                                 sep = ""))

# Expected:
#   Caught: jplot(): the d0 data frame has no rows, so there is nothing
#   to analyze.
#   Caught: jplot(): the d0 data frame has no rows, so there is nothing
#   to analyze.
#
# Things to look at:
#   - The two lines are IDENTICAL (S296). Before S296 the second read "the
#     data frame has no rows" on one line: jplot's formula branch never
#     recovered .jst_data_name from the positional frame, so it had no
#     name to give -- and, worse, no key for the stored-setting lookups,
#     so jplot(y ~ x, d) silently skipped an active jsubset()/jcomplete()
#     on d. Fixed S296 (v0.9.169); asserted in filter_check.R section H.
#     This walk keeps only the naming parity, because that is what Part H
#     is about.
#   - If the second line ever reads "the data frame" again, the formula
#     path has lost the name -- that is a regression, not a wording choice.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Observations
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# <Free-form notes from the most recent walk: anything that looked off,
# wording worth an mv review, follow-ups. Dated entries, newest first.>
#
# S287 (built, then walked on the workstation the same session):
#   - F4 DECIDED KEEP (Jeff). Never-mode drops the upper table and the
#     bottom breakdown but KEEPS the listwise-discrepancy note: the note is
#     gated on output LEVEL (silent at minimal, rule 7), not on the
#     case.processing toggle. The CPS reference records it as a third
#     S286-style gap-fill. F4's Expected stands as pinned.
#   - MV CANDIDATE at G1/G2 (logged S287, LOW). jdesc(d, Stress, by =
#     Condition) reports "2 Variable Pool": the grouping variable counts in
#     the listwise pool, so a one-variable call reads as two. Arithmetic
#     correct, wording arguable.
#     CLOSED S316 (v0.9.191): the N line counts the described variables;
#     G1/G2 re-pinned to "1 Variable Pool" with the AUDIT-027 build.
#   - H1/H2 LOGGED S287 under one LOW item: a zero-row INPUT frame will
#     stop in all ten pipeline functions (Jeff's call, for consistency with
#     the five that already do), which retires H1's "Total 0 100.00" and
#     H2's "See the Case Processing Summary above" when none printed. Part
#     H re-pins to the new error when that lands.
#     CLOSED S295 (v0.9.168): the guard shipped at the shared pipeline
#     entry, scope extended to jplot's two paths, and Part H re-pinned.
#
# S295:
#   - JPLOT'S FORMULA PATH DOES NOT NAME THE FRAME (new, see H3). Every
#     message from jplot(y ~ x, d) says "the data frame" where jplot(d, x)
#     and jlm(y ~ x, d) say "d": .jst_jplot_formula sets .jst_data_name to
#     NULL and only fills it on the juse-default branch, never from the
#     positional frame. Pre-existing and NOT caused by the guard -- it also
#     shows on the variable-not-found message -- but invisible until jplot
#     gained a message that names the frame. H3's second line pins the
#     defect; re-pin it when the fix lands.
#     CLOSED S296 (v0.9.169): the name is recovered from the first unnamed
#     element of the captured call (the old code looked for a SECOND one,
#     which no formula call has). H3 re-pinned; the row-count consequence
#     -- stored filters skipped on this path -- is locked in
#     filter_check.R section H.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART I -- FILTER ACCOUNTING: jcomplete()-ONLY ROWS, THE "(k missing)" ----
#           NOTE, AND THE Filtered COLUMN
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Three things the Case Processing Summary could not say before S312. (1) A
# variable in jcomplete()'s list that the analysis does not use -- a
# jcomplete()-ONLY variable -- had no row in the breakdown, so a case missing
# on it was excluded unshown (the S311 field report, a student's jlm:
# jcomplete() excluded 12, the breakdown accounted for 11), and when the
# analysis variables were clean no breakdown printed at all. Such a variable
# now gets its own rows, tagged "(jcomplete() only)", after the analysis
# variables; the joutput() slot case.processing.filter (auto / list / collapse)
# sets whether four or more are named or collapsed into one row. (2) A
# jsubset() or subset = row folded the cases its condition could not evaluate
# into the cases the condition ruled out. The row now says "(k missing)" after
# the expression when k > 0. Condition variables get NO breakdown rows: the
# count lives on the row, once. (3) Under a pipeline, each breakdown row left
# the reader to subtract pool from source to learn how many of a variable's
# missing cases the filter had already removed; the Filtered column (v0.9.185)
# states it, the header is "Missing data", and the "%" headers are centred.
# Sections set state and clear it on the next line, as Part B does.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# I1 -- the student's shape: a jcomplete()-only variable, and a condition ----
#       on it
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jcomplete(d, Flourishing, Stress, SocialSupport)
jlm(Flourishing ~ Stress, d, subset = SocialSupport > 5)
jcomplete(d, NULL)

# Expected:
#   Listwise Case Filter
#   Variable        N  Missing  % Missing
#   -------------  --  -------  ---------
#   Flourishing    70     0        0.0%
#   Stress         70     4        5.7%
#   SocialSupport  70     3        4.3%
#
#     Complete cases: 63 of 70 (90.0%)
#     Listwise filter activated -- 7 cases will be excluded from
#     subsequent analyses.
#   Linear Regression
#
#   Case Processing  Excluded  Remaining
#       Original           --         70
#       jcomplete()         7         63  Flourishing, Stress, +1 more
#       subset =            4         59  SocialSupport > 5
#       Analysis N         --         59
#
#   Missing data   From 70   %   Filtered  From 59   %
#       Stress
#         Missing     4     5.7      4        0     0.0
#       SocialSupport (jcomplete() only)
#         Missing     3     4.3      3        0     0.0
#   ------------------------------------------------------------------
#
#   Coefficients
#   [... results not pinned here ...]
#
# Things to look at:
#   - The Listwise Case Filter block is jcomplete talking; the CPS block
#     starts under the Linear Regression title. Its counts are block-centered
#     (v0.9.186; see B4).
#   - jcomplete() excluded 7. The breakdown's From 70 column now accounts for
#     all seven: Stress 4 + SocialSupport 3. Before S312 the SocialSupport
#     rows were absent and the column summed to 4 -- the student's "12 vs 11".
#   - "(jcomplete() only)" is the whole tag: SocialSupport is in jcomplete()'s
#     list and not in the model, and nothing else in the output says so.
#   - Read each row left to right as its own small pipeline: 4 missing in
#     the original, 4 Filtered (all four left at jcomplete()), 0 in the pool.
#     The Filtered column is source minus pool, stated so that nobody
#     subtracts; the pool cell is a computed 0, not a dash (the transform
#     row's dash marks an UNKNOWABLE count).
#   - The subset = row carries NO "(k missing)" note: jcomplete() removed the
#     three missing cases before the condition ran, so its 4 are all cases
#     with SocialSupport at 5 or below. Each excluded case has exactly one
#     stated reason.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# I2 -- the fold: jsubset() on a variable outside the model ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jsubset(d, SocialSupport > 5)
jlm(Flourishing ~ Stress, d)
jsubset(d, NULL)

# Expected:
#   Linear Regression
#
#   Case Processing    Excluded  Remaining
#       Original             --         70
#       jsubset()             7         63  SocialSupport > 5 (3 missing)
#       Auto-listwise         4         59
#       Analysis N           --         59
#
#   Missing data   From 70   %   Filtered  From 63   %
#       Stress
#         Missing     4     5.7      0        4     6.3
#   ---------------------------------------------------------------------
#
#   Coefficients
#   [... results not pinned here ...]
#
# Things to look at:
#   - jsubset() excluded 7, and the row says "(3 missing)": 3 of the 7 were
#     MISSING on SocialSupport (NA > 5 is NA, and a filter drops NA), so 4
#     were actually at 5 or below. Before v0.9.184 the row read plain and
#     all 7 looked like out-of-range cases.
#   - SocialSupport gets no breakdown row. Its count lives on the row it
#     belongs to, once; a second copy in the breakdown was the first S312
#     form, and it was redundant.
#   - Stress is an analysis variable: 4 missing of 70, 0 Filtered (none of
#     the four had SocialSupport at 5 or below), 4 in the pool of 63, and
#     those four leave at Auto-listwise -- the row's 4 is the Auto-listwise
#     row's 4.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# I3 -- clean analysis variables: the bottom that used to be absent ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jcomplete(d, Flourishing, SocialSupport)
jt(Flourishing ~ SoughtHelp, d)
jcomplete(d, NULL)

# Expected:
#   Listwise Case Filter
#   Variable        N  Missing  % Missing
#   -------------  --  -------  ---------
#   Flourishing    70     0        0.0%
#   SocialSupport  70     3        4.3%
#
#     Complete cases: 67 of 70 (95.7%)
#     Listwise filter activated -- 3 cases will be excluded from
#     subsequent analyses.
#   Independent Samples T-Test
#
#   Case Processing  Excluded  Remaining
#       Original           --         70
#       jcomplete()         3         67  Flourishing, SocialSupport
#       Analysis N         --         67
#
#   Missing data   From 70   %   Filtered  From 67   %
#       SocialSupport (jcomplete() only)
#         Missing     3     4.3      3        0     0.0
#   ----------------------------------------------------------------
#
#   Group Descriptives: Flourishing by SoughtHelp
#   [... results not pinned here ...]
#
# Things to look at:
#   - Flourishing and SoughtHelp are clean. Before S312 this call printed the
#     upper table and NO breakdown: Table 3's "Has UDMs" and "Has system NAs"
#     read the analysis variables alone, so the printer saw no missingness.
#     Both coordinates now read the jcomplete()-only variables too, and the
#     breakdown prints with only that row in it.
#   - The rule under it is the block's closing rule, hugging the last row
#     (rule 8): unchanged.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# I4 -- auto with FOUR jcomplete()-only variables: collapsed ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# State set here is cleared at the end of I5.

jcomplete(d, Flourishing, Stress, SleepHours, Medication, Anxiety4)
jt(Flourishing ~ SoughtHelp, d)

# Expected:
#   Listwise Case Filter
#   Variable      N  Missing  % Missing
#   -----------  --  -------  ---------
#   Flourishing  70     0        0.0%
#   Stress       70     4        5.7%
#   SleepHours   70     4        5.7%
#   Medication   70     5        7.1%
#   Anxiety4     70     6        8.6%
#
#     Complete cases: 53 of 70 (75.7%)
#     Listwise filter activated -- 17 cases will be excluded from
#     subsequent analyses.
#   Independent Samples T-Test
#
#   Case Processing  Excluded  Remaining
#       Original           --         70
#       jcomplete()        17         53  Flourishing, Stress, +3 more
#       Analysis N         --         53
#
#   Missing data          From 70    %   Filtered  From 53    %
#       jcomplete()-only variables (4)
#         Missing on any     17    24.3     17        0      0.0
#   ------------------------------------------------------------------
#
#   Group Descriptives: Flourishing by SoughtHelp
#   [... results not pinned here ...]
#
# Things to look at:
#   - Four jcomplete()-only variables carry missingness (Stress, SleepHours,
#     Medication, Anxiety4), one more than the three that "auto" names, so
#     they collapse into ONE row. The (4) is the number collapsed.
#   - "Missing on any" counts CASES missing on at least one of the four: 17,
#     which is the jcomplete() row's 17, all 17 Filtered, 0 in the pool. A
#     per-variable sum would read 19 (4 + 4 + 5 + 6), because two cases are
#     missing on two of them. This is the one row in the table that is built
#     not to over-count.
#   - The percent is of 70, as every source-column percent is.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# I5 -- the same call under joutput(case.processing.filter = "list") ----
# NEEDS: I4
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

joutput(case.processing.filter = "list", quiet = TRUE)
jt(Flourishing ~ SoughtHelp, d)
joutput(NULL, quiet = TRUE)
jcomplete(d, NULL)

# Expected:
#   Independent Samples T-Test
#
#   Case Processing  Excluded  Remaining
#       Original           --         70
#       jcomplete()        17         53  Flourishing, Stress, +3 more
#       Analysis N         --         53
#
#   Missing data   From 70   %   Filtered  From 53   %
#       Stress (jcomplete() only)
#         Missing     4     5.7      4        0     0.0
#       SleepHours (jcomplete() only)
#         Missing     4     5.7      4        0     0.0
#       Medication (jcomplete() only)
#         Missing     5     7.1      5        0     0.0
#       Anxiety4 (jcomplete() only)
#         Missing     6     8.6      6        0     0.0
#   ------------------------------------------------------------------
#
#   Group Descriptives: Flourishing by SoughtHelp
#   [... results not pinned here ...]
#
# Things to look at:
#   - The four are named, in jcomplete()'s order, each with its own count.
#     These are the 19 cells the collapsed row's 17 cases stood for; each
#     row's Filtered equals its source count, since jcomplete() took them all.
#   - joutput("full") gives this form by default; "collapse" gives I4's form
#     from two variables up. A lone jcomplete()-only variable is always named
#     under every setting (a group of one is the variable).
#   - The label column narrowed by seven: "Missing on any" was the widest
#     label in I4; "Missing" is here, and the header "Missing data" is
#     narrower than either. Same rule width, because the top table's detail
#     column sets it.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# I6 -- per_code on a DECLARED jcomplete()-only variable ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jcomplete(d, Flourishing, Stress)
jt(Flourishing ~ SoughtHelp, d, case.processing.detail = "per_code")
jcomplete(d, NULL)

# Expected:
#   Listwise Case Filter
#   Variable      N  Missing  % Missing
#   -----------  --  -------  ---------
#   Flourishing  70     0        0.0%
#   Stress       70     4        5.7%
#
#     Complete cases: 66 of 70 (94.3%)
#     Listwise filter activated -- 4 cases will be excluded from
#     subsequent analyses.
#   Independent Samples T-Test
#
#   Case Processing  Excluded  Remaining
#       Original           --         70
#       jcomplete()         4         66  Flourishing, Stress
#       Analysis N         --         66
#
#   Missing data              From 70   %   Filtered  From 66   %
#       Stress (jcomplete() only)
#         -99 ["Refused"]        2     2.9      2        0     0.0
#         -98 ["Don't know"]     2     2.9      2        0     0.0
#   --------------------------------------------------------------
#
#   Group Descriptives: Flourishing by SoughtHelp
#   [... results not pinned here ...]
#
# Things to look at:
#   - Stress is in jcomplete()'s list and not in the analysis, and at
#     per_code its row breaks out by code exactly as an analysis variable's
#     would: -99 ["Refused"] 2, -98 ["Don't know"] 2, each 2 Filtered.
#   - The analysis variables are clean, so this per_code bottom exists only
#     because "Has UDMs" now reads the jcomplete()-only variables (I3's
#     widening, on the declaration side).
#   - A collapsed row (I4) stays ONE flat line at per_code: variables with
#     different declarations share no code structure to break out -- the
#     transform row's precedent.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# I7 -- the same declared variable as a CONDITION: counted on the row ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jt(Flourishing ~ SoughtHelp, d, subset = Stress > 10, case.processing.detail = "per_code")

# Expected:
#   Independent Samples T-Test
#
#   Case Processing  Excluded  Remaining
#       Original           --         70
#       subset =           18         52  Stress > 10 (4 missing)
#       Analysis N         --         52
#   -------------------------------------------------------------
#
#   Group Descriptives: Flourishing by SoughtHelp
#   [... results not pinned here ...]
#
# Things to look at:
#   - Stress > 10 excludes 18, and the row says "(4 missing)": the four
#     declared-code cells. The pipeline evaluates the condition on the
#     masked copy, so a declared code is missing there too, and -99 > 10 is
#     not FALSE but NA.
#   - No breakdown, even at per_code: the analysis variables are clean, and
#     a condition variable earns no bottom row. Compare I6, where the same
#     variable, in jcomplete()'s list instead, breaks out by code below.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# I8 -- a condition that keeps its missing cases: no note ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jt(Flourishing ~ SoughtHelp, d, subset = SocialSupport > 5 | is.na(SocialSupport))

# Expected:
#   Independent Samples T-Test
#
#   Case Processing  Excluded  Remaining
#       Original           --         70
#       subset =            4         66  SocialSupport > 5 | is.na(SocialSupport)
#       Analysis N         --         66
#   ------------------------------------------------------------------------------
#
#   Group Descriptives: Flourishing by SoughtHelp
#   [... results not pinned here ...]
#
# Things to look at:
#   - The expression keeps the three missing cases on purpose, so the
#     condition is TRUE for them, not NA: 4 excluded, all at 5 or below, and
#     no "(k missing)" note. The note counts conditions that evaluated to
#     NA, nothing else.
#   - For the same reason a case missing on one variable but ruled out by
#     another (x > 10 & y == 1, with x missing and y 2) is "not met", not
#     missing: NA & FALSE is FALSE in R. cps_check.R N44c pins that case.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# I9 -- jcomplete()'s set-time line agrees in number (Rule O) ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Not a CPS section: the jcomplete() block itself, on a frame with exactly one
# incomplete case. It read "1 cases will be excluded" until v0.9.183. The
# human half of cps_check.R N47.

d1 <- d[, c("Flourishing", "MoodRating")]
d1$MoodRating[7L] <- NA
jcomplete(d1, Flourishing, MoodRating)
jcomplete(d1, NULL)
rm(d1)

# Expected:
#   Listwise Case Filter
#   Variable      N  Missing  % Missing
#   -----------  --  -------  ---------
#   Flourishing  70     0        0.0%
#   MoodRating   70     1        1.4%
#
#     Complete cases: 69 of 70 (98.6%)
#     Listwise filter activated -- 1 case will be excluded from
#     subsequent analyses.
#
# Things to look at:
#   - "1 case", not "1 cases". I1's "7 cases" is the plural form of the same
#     line; the count is in hand, so the noun follows it (Rule O).

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART J -- THE SCREENING LAYOUT: jscreen() (S320) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# jscreen() joined the framework at v0.9.197 as the fifth layout. It follows
# the visibility rules every analysis function follows -- an active filter
# brings the table, joutput()'s case.processing setting governs it -- but it
# has no N line of its own: its header already opens with a Cases line, so
# where jfreq would print "70 Cases in the 3 Variable Pool" jscreen prints
# nothing, and in never-mode that Cases line carries the excluded count.
# The human half of cps_check.R N54a-o. J2-J5 leave state set and clear it a
# section later, as Part B does; read the calls.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# J1 -- standard, no filter: nothing added ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jscreen(d, Stress, SocialSupport, Flourishing)

# Expected:
#   Data Screening
#     Cases: 70
#     Variables: 3
#     Cases with missing data: 7
#     Variables with outliers: 2
#   [... tables not pinned here ...]
#
# Things to look at:
#   - No table and no N line. With no filter there is no exclusion row, and
#     the header's Cases line is the N statement.
#   - The Cases line sits directly under the title, as it always has: this
#     is jscreen's usual moment, a first look at a fresh data frame, and its
#     output is unchanged from v0.9.196.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# J2 -- a jsubset(): the table between the title and the header ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jsubset(d, Condition != 3)
jscreen(d, Stress, SocialSupport, Flourishing)

# Expected:
#   jsubset activated for d: Condition != 3
#   Data Screening
#
#   Case Processing  Excluded  Remaining
#       Original           --         70
#       jsubset()          17         53  Condition != 3
#       Remaining N        --         53
#   ----------------------------------------------------
#
#     Cases: 53
#     Variables: 3
#     Cases with missing data: 4
#     Variables with outliers: 2
#   [... tables not pinned here ...]
#
# Things to look at:
#   - The table jfreq prints under the same filter (B2), in the same slot:
#     under the title, above everything else.
#   - The Cases line repeats the table's Remaining N. Until v0.9.197 this
#     call printed "Cases: 53" with no sign a filter had run; the only
#     record was jsubset's own line, printed back when the filter was set.
#   - One blank above the table, the rule hugging Remaining N, one blank
#     before the Cases line (rule 8).

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# J3 -- three filters at once: jcomplete(), jsubset() and subset = ----
# NEEDS: J2
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# The jsubset() from J2 is still active.

jcomplete(d, Stress)
jscreen(d, Stress, SocialSupport, Flourishing, subset = Medication == 1)
jcomplete(d, NULL)

# Expected:
#   Listwise Case Filter
#   Variable   N  Missing  % Missing
#   --------  --  -------  ---------
#   Stress    70     4        5.7%
#
#     Complete cases: 66 of 70 (94.3%)
#     Listwise filter activated -- 4 cases will be excluded from
#     subsequent analyses.
#   Data Screening
#
#   Case Processing  Excluded  Remaining
#       Original           --         70
#       jcomplete()         4         66  Stress
#       jsubset()          15         51  Condition != 3
#       subset =           29         22  Medication == 1 (2 missing)
#       Remaining N        --         22
#   -----------------------------------------------------------------
#
#     Cases: 22
#     Variables: 3
#     Cases with missing data: 0
#     Variables with outliers: 0
#   [... tables not pinned here ...]
#
# Things to look at:
#   - Three rows in the order the pipeline applies them: jcomplete(), then
#     jsubset(), then subset =. The table does not care that jscreen screens
#     three variables and the filters name two others.
#   - "(2 missing)" on the subset = row: Medication declares -99 on two of
#     the 51 cases left, so the condition could not be evaluated for them
#     (the S312 note, as on any other layout).
#   - The line "jcomplete cleared for d (had: Stress)." follows the output;
#     it is J3's own clean-up, not part of the block.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# J4 -- minimal: the table's count moves onto the Cases line ----
# NEEDS: J2
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# The jsubset() from J2 is still active; the jcomplete() is gone.

joutput("minimal", quiet = TRUE)
jscreen(d, Stress, SocialSupport, Flourishing)
joutput(NULL, quiet = TRUE)
jsubset(d, NULL)

# Expected:
#   Data Screening
#     Cases: 53 (17 Excluded)
#     Variables: 3
#     Cases with missing data: 4
#     Variables with outliers: 2
#   [... tables not pinned here ...]
#
# Things to look at:
#   - Minimal never prints the table. The count it would have shown rides
#     on the Cases line, in the form every other function's N line takes
#     at minimal ("Analysis N: 63 (7 Excluded)", D1).
#   - joutput(case.processing = FALSE) gives the same line at standard
#     (cps_check.R N54h). With no filter, or one that excluded nothing, the
#     line is the plain "Cases: 70" -- never "(0 Excluded)".
#   - "jsubset cleared for d (had: Condition != 3)." follows the output: the
#     section's clean-up.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# J5 -- full, no filter: the literal table ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

joutput("full", quiet = TRUE)
jscreen(d, Stress, SocialSupport, Flourishing)
joutput(NULL, quiet = TRUE)

# Expected:
#   Data Screening
#
#   Case Processing  Excluded  Remaining
#       Original           --         70
#       Remaining N        --         70
#   ------------------------------------
#
#     Cases: 70
#     Variables: 3
#     Cases with missing data: 7
#     Variables with outliers: 2
#   [... tables not pinned here ...]
#
# Things to look at:
#   - Full is literal: the table prints with nothing to exclude, Original
#     and Remaining N only, as jfreq's does at full (D3).
#   - joutput(case.processing = TRUE) gives the same table at standard.
#   - Full also turns on the variable-label legend, which prints after the
#     tables (not pinned).

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART K -- TEXT VARIABLES: DECLARED STRINGS AND BLANK CELLS (S340) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Fix Slate 3 (v0.9.214). Two things a text variable can hold that the
# missing-data machinery did not see until this build:
#
#   a DECLARED MISSING STRING -- a .sav string variable with
#       MISSING VALUES Marital ('UNKNOWN', 'REF').
#     reads, through haven, as a text variable whose na_values are text.
#     jstats read the declaration as numbers, got NA for each, and counted
#     the cells as valid: 'UNKNOWN' was a category, with a row of its own.
#
#   a BLANK CELL -- empty, or holding only spaces or tabs. It is not NA to R,
#     and SPSS itself treats a blank string as a valid value unless it is
#     declared. jstats printed it as a category with no name: an empty row
#     label, an empty group, a dummy called "Source_".
#
# The rule for a blank (Jeff, S340): jstats REPORTS it and never ASSUMES it
# is missing. Every blank cell of a variable is one category, shown as
# <blank>, counted among the valid values, and said to be so; jencode() is
# the way to give it a code or to make it missing. The rule for a declared
# string is the one a declared number follows: it is missing.
#
# The fixture is tx, built in Setup. The assertion side is cps_check.R N57
# and N58, and models_check.R section L. No section here sets state. The
# same rule in jlm() is models_walk.R Section 15, where the coefficient
# table lives.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# K1 -- jfreq(): a string's declared missing values are Missing rows ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jfreq(tx, Marital)

# Expected:
#   Frequencies
#
#   12 Cases in the 1 Variable Pool
#
#   Marital
#
#                       Freq  Total %  Valid %  Cum. %
#   ------------------  ----  -------  -------  ------
#   Valid
#   Married               4     33.33   50.00    50.00
#   Single                4     33.33   50.00   100.00
#
#   Missing
#   REF ["Refused"]       1      8.33      --       --
#   UNKNOWN (no label)    2     16.67      --       --
#   System/NA             1      8.33      --       --
#
#   Total                12    100.00
#
# Things to look at:
#   - REF and UNKNOWN sit under Missing, with no Valid % -- until 0.9.214
#     both were Valid rows, the percentages of Married and Single were
#     taken out of 11, not 8, and the Missing block held two rows reading
#     "NA (no label)" with a count of 0.
#   - The rows take the form a declared NUMBER takes: the value as stored,
#     then its label in brackets, or "(no label)". REF ["Refused"] carries
#     the label the file gave it.
#   - Their order is the alphabet's, whatever order the file declared them
#     in (it declared UNKNOWN first).
#   - The one NA cell is its own row, System/NA, as on a numeric variable.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# K2 -- a group function: the declared strings leave the analysis ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jt(Score ~ Marital, tx)

# Expected:
#   Independent Samples T-Test
#
#   Case Processing    Excluded  Remaining
#       Original             --         12
#       Auto-listwise         4          8
#       Analysis N           --          8
#
#   Missing data   From 12    %
#       Marital
#         Missing     4     33.3
#   --------------------------------------
#
#   Group Descriptives: Score by Marital
#   Group    N   Mean     SD
#   -------  -  ------  -----
#   Married  4  42.250  7.932
#   Single   4  35.750  8.382
#
#   Independent Samples T-Test Results (equal variances assumed)
#     t    df    p   Mean Difference  95% CI Lower  95% CI Upper
#   -----  --  ----  ---------------  ------------  ------------
#   1.127   6  .303       6.500          -7.618        20.618
#
#   Cohen's d: 0.797
#
# Things to look at:
#   - Two groups, Married and Single. Until 0.9.214 this call stopped --
#     "Marital has 4 categories" -- because UNKNOWN and REF counted as
#     groups.
#   - The Case Processing block accounts for them as it does for a declared
#     number: 4 cases under Auto-listwise (two UNKNOWN, one REF, one NA),
#     named under "Missing data".

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# K3 -- jfreq(): blank cells are one <blank> row, and the table says so ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Source holds two empty cells, one of three spaces and one of a tab.

jfreq(tx, Source)

# Expected:
#   Frequencies
#
#   12 Cases in the 1 Variable Pool
#
#   Source
#
#              Freq  Total %  Valid %  Cum. %
#   ---------  ----  -------  -------  ------
#   Valid
#   <blank>      4     33.33   36.36    36.36
#   Adult        5     41.67   45.45    81.82
#   Juvenile     2     16.67   18.18   100.00
#
#   Missing
#   System/NA    1      8.33      --       --
#
#   Total       12    100.00
#   <blank>: 4 cells with no text (2 empty, 2 holding only spaces or tabs).
#   They are counted as valid values, not as missing.
#   To give them a code or make them missing, use jencode().
#
# Things to look at:
#   - ONE <blank> row for all four cells. Until 0.9.214 the table had three
#     rows with nothing, or nothing visible, in the label column: the empty
#     cells, the spaces and the tab each counted apart.
#   - <blank> is a Valid row, first among them, and the percentages count
#     it. The three lines under the table say that in words, say what the
#     cells hold, and name the function that changes it.
#   - The footnote sits directly under the table, before the closing blank
#     line: it is the table's own footnote, not a note about the call.
#   - Is "<blank>" the right label? It is the one word of this output that
#     is not in the data.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# K4 -- jscreen(): blank text is counted beside missing data ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

jscreen(tx)

# Expected:
#   Data Screening
#     Cases: 12
#     Variables: 4
#     Cases with missing data: 5
#     Cases with blank text: 10
#     Variables with outliers: 0
#
#   Variable Types
#   Variable  jstats Class  Sub-class   Unique Values
#   --------  ------------  ----------  -------------
#   Source    Categorical   3-category         3
#   Flag      Categorical   dichotomy          2
#   Score     Numeric                         12
#   Marital   Categorical   dichotomy          2
#
#   Missing Data & Outliers (outliers > 3 SD from mean)
#   Variable  Missing  % Missing  Blank  % Blank
#   --------  -------  ---------  -----  -------
#   Source        1        8.3       4     33.3
#   Flag         --         --       7     58.3
#   Marital       4       33.3      --       --
#
#   Note: SPSS-style declared missing values on: Marital.
#   jstats treats these as missing; base R functions do not.
#
# Things to look at:
#   - "Cases with blank text: 10", between the missing-data line and the
#     outlier line. The line prints only when the count is above zero, so a
#     frame with no blank text screens exactly as it did.
#   - The lower table gains Blank and % Blank, on the same condition. Flag
#     has no missing data and seven blanks: until 0.9.214 it was not in the
#     table at all, and nothing in jscreen()'s output said that more than
#     half of it was empty.
#   - Marital's 4 under Missing is unchanged: jscreen() already counted a
#     declared string as missing. K1 and K2 are jfreq() and the group
#     functions coming into line with it.
#   - Variable Types counts <blank> as ONE category: Source is 3-category
#     (it read 5-category, the empty cells, the spaces and the tab each
#     counted), Flag a dichotomy.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# K5 -- a group function: the blank cells are a group ----
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Flag is "Y" or blank -- the shape a tick-box column takes in an export.

jt(Score ~ Flag, tx)

# Expected:
#   Independent Samples T-Test
#
#   Analysis N: 12
#
#   Group Descriptives: Score by Flag
#   Group    N   Mean     SD
#   -------  -  ------  -----
#   <blank>  7  39.429  8.541
#   Y        5  30.000  9.000
#
#   Independent Samples T-Test Results (equal variances assumed)
#     t    df    p   Mean Difference  95% CI Lower  95% CI Upper
#   -----  --  ----  ---------------  ------------  ------------
#   1.845  10  .095       9.429          -1.958        20.815
#
#   Cohen's d: 1.080
#
# Things to look at:
#   - The comparison a tick-box column asks for: the cases that ticked
#     against the cases that did not. Until 0.9.214 the same two groups
#     printed, the first with an empty name.
#   - "Analysis N: 12": no case is excluded. A blank is not missing.
#   - The same label in jaov(), jcrosstab(), jdesc(by = ) and jplot(); in
#     jlm() and jlogistic() the blank cells are a category of the predictor
#     (models_walk.R Section 15).


# --- Restore session state ---------------------------------------------------

jsubset(clear.all = TRUE); jcomplete(clear.all = TRUE)
joutput(NULL, quiet = TRUE); jdummy(clear.all = TRUE)
options(.jst_options_message_width = .entry_message_width)
options(.jst_default_data = .entry_default_data)


# --- End marker --------------------------------------------------------------
# A real statement, deliberately last: stepping through with Ctrl+Enter, RStudio
# keeps expanding the selection when only comments remain, echoing the tail of
# the file back repeatedly. Ending on executable code gives it somewhere to
# stop.

cat("\n--- End of cps_walk.R ---\n")
