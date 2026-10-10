# =============================================================================
# format_check.R -- how numbers print: a column's decimal places come from
#                   what it holds, never from the values that happen to be
#                   in it
# =============================================================================
# TYPE:     assertion battery (PASS/FAIL; written for Claude's checking)
# LOCKS:    the S326 number-format rule (v0.9.202). Statistics print to
#           exactly the digits setting (default 3), trailing zeros kept:
#           0.100, not 0.1; 682.770 beside 682.770, not 682.77. Quantities
#           with a convention of their own keep it, padded: Welch's df at
#           one place (6.0), % Correct at one (75.0), VIF at three (1.000);
#           N and whole-number df print as whole numbers; p-values are not
#           touched. The one exception is jdesc's Min and Max, values of
#           the variables rather than statistics, which keep the decimal
#           places the data carry. A value that rounds to zero from below
#           prints unsigned (0.000). The mechanism is the renderer's
#           digits argument -- fixed places by column name, a column it
#           does not name keeping the old per-column detection, a name that
#           matches no column an error -- plus .jst_fmt_stat() for the two
#           result lines, jaov's "Eta-squared:" (which also lost a trailing
#           space) and jt's "Cohen's d:". The sites, by section:
#             A  .jst_make_fmt(), .jst_fmt_stat(), .jst_print_table(digits =)
#             U  jaov: Games-Howell after Welch; a group of one case (S341)
#             B  jaov: Levene, Group Descriptives, ANOVA, Welch, Tukey, the
#                eta-squared line (both forms), digits = 2 and 0, and the
#                returned values (display only)
#             C  jt: Levene, Group Descriptives, the test table (Student,
#                Welch, paired), the Cohen's d line
#             D  jlogistic: Omnibus, Model Summary, Classification, VIF
#             E  jlm: VIF
#             F  jalpha: Reliability, Item Statistics, Item-Total
#             G  jdesc: Mean and SD (ungrouped and grouped); Min and Max
#                left as the data carry them
#             H  jscreen(stats =): Mean and Median, named only when shown
#             I  controls: p-values and N untouched
#           Since S327 (v0.9.203) also where a value SITS in its column, and
#           the numbers three notes print:
#             J  alignment: the 17 statistics tables (19 call sites) --
#                every jt, jaov and jalpha table, jlogistic's Omnibus, Model
#                Summary and Classification, both VIF tables and jscreen's
#                Variable Types -- block-centered ("bc": the header centered
#                over its column, each value right-justified in a block the
#                width of the widest value, the block centered under the
#                header) with the label column flush left and no line
#                ending in a space (trim = TRUE)
#             K  the notes and two line endings: jcrosstab's
#                expected-frequency note (the minimum to two places, never
#                5.00), the two VIF notes (one place, padded), jaov's two
#                Welch notes ("not applicable", on stdout, wrapped by
#                width), jlogistic's closing blank line, and jscreen's four
#                header lines without a space before the line end
#           Since S328 (v0.9.204) EVERY table is in the form, the form has
#           ONE lean, and every analysis output ends on one blank line:
#             L  the renderer: the lean (where a header or a block cannot
#                be centered exactly, the odd space goes on the LEFT, so
#                the text sits one place right of center -- a one-digit df
#                under the "f" of "df"); the "bd" code, block-centered on
#                the decimal point; trim as the default; and the default
#                alignment (numbers right, text left), kept for listings
#                of data rows
#             M  jfreq: Freq, Total %, Valid % and Cum. % block-centered,
#                no line padded
#             N  jcrosstab: the cells on the decimal point ("bd"), the
#                sub-row labels indented, the chi-square table
#                block-centered, and a count of exactly 100000 printed
#                whole
#             O  the coefficient tables of jlm and jlogistic block-centered
#                (they were decimal-tabbed); the dummy-coding scheme;
#                jcomplete()'s set-time table and jscreen's Missing Data
#                table without padding; jcomplete()'s preview and jcorr's
#                matrix keeping their alignment; jlm's F line printing a
#                df of exactly 100000 whole
#             P  jdesc's Min and Max at each VARIABLE's own decimal places
#                (.jst_data_dp()), the two columns on the decimal point
#             Q  one closing blank line: every analysis function at every
#                output level and legend mode, both streams read; and
#                (Q16) the capture itself, the same under any front end
#           In section J the lean moved five pinned checks (J20, J23-J26)
#           and every aligned() result (ctr() models the renderer); J28a
#           is new; K08 gained the clause S327 missed, the Tukey note
#           ABSENT when no post-hoc test was requested.
#           Since S329 (v0.9.205) the crosstab as Jeff ruled it on the
#           0.9.204 walk:
#             R  jcrosstab and the renderer's gap argument: expected
#                frequencies at TWO places, in the cells as in the note,
#                with the note's guard (a value in [4.995, 5) prints 4.99)
#                and the expected Total from the unrounded cells, unguarded;
#                the note's pointer line, printed only when the expected
#                frequencies are not shown; a blank line between the row
#                groups whenever sub-rows show, none when every category is
#                one line; the columns four spaces apart whenever the table
#                at that gap fits the message width, else two --
#                .jst_print_table(gap =), one number or several in order
#                of preference; and one blank line above the
#                adjusted-residuals note
#             S  jdummy's registration lines: no storage class after the
#                variable's name ("Condition (haven_labelled)"), and the
#                reference category marked "(default; change with ref =)"
#                when the default rule chose it -- on registration, when a
#                registration is shown again, and in the overview
#             W  jt and jaov on groups a test cannot be computed on; the
#                Games-Howell rows below 2 df; no post-hoc table for two
#                groups; a group emptied by missing data (S346)
#             X  diagnostics in jt and jaov, one argument apart from the
#                levels; the Levene note in its three forms (S346)
# ORIGIN:   S326 (v0.9.202): the number-format bundle -- the S220 eta-squared
#           and ANOVA-table items and the Session 171 trailing-zero item --
#           widened at Jeff's call to every table that took its decimals
#           from its values (jlogistic's fit tables, jalpha, jdesc's Mean
#           and SD, the VIF tables, jscreen's stats columns) and to jt's
#           Cohen's d line, which had the eta-squared defect.
# S347 EDIT (v0.9.220, 2026-10-10): Fix Slate 8, second half. SECTION Y
#           ADDED, Y01-Y04 (4 checks): a paired t-test under
#           joutput(diagnostics = TRUE) says nothing of Levene's test (it
#           printed "Levene's test is not applicable for paired samples."
#           on every call); the call's own TRUE or "levene" still says it,
#           with the setting or without; the call's FALSE and no setting
#           print no note; an independent-samples t-test under the setting
#           still prints Levene's table. 287 checks. Sandbox (R 4.3.3,
#           UTF-8 locale, pkgload::load_all): 287/287 plain and under the
#           RStudio-handler stand-in, each also with a Windows-length temp
#           path, and entered dirty. On the 0.9.219 master 1 red: Y01.
#           MUTATION MAP (S347; the mutants of models_check.R's list that
#           red here): the note under the session setting Y01; the note
#           never X16 Y02.
#           LAST VERIFIED: v0.9.220, 2026-10-10 (S347) -- 287/287 on
#           the WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run,
#           2123 checks)") through receive_all(), after a clean R CMD
#           check, matching the sandbox; GitHub 991eb6b.
# S346 EDIT (v0.9.219, 2026-10-08): Fix Slate 8, first cut, and Jeff's
#           diagnostics ruling of that day. SECTIONS W AND X ADDED, W01-W27
#           and X01-X16 (43 checks). W01-W09 jt(): Welch's test with a
#           one-case group stops in the house voice and Student's runs,
#           its Cohen's d from the pooled SD the test used (held to
#           effectsize's number, the one-case group first and second);
#           two groups of one case; no variation to test against.
#           W10-W14 jaov(): every group constant; Welch with a constant
#           group; the standard ANOVA still takes one. W15-W18
#           Games-Howell below 2 df: no "NaNs produced", the row's
#           interval and p blank, one line under the table, in number.
#           W19-W21 two groups: no post-hoc table printed or returned,
#           one line in its place. W22-W27 a group emptied by a missing
#           outcome is not a group of the analysis; a paired test still
#           pairs by position. X01-X09 the Levene note: the two ratios
#           and three verdicts in jaov() and jt(), each zone's edges read
#           from the helper, the two-decimal rule, when no note prints,
#           and not at the minimal level. X10-X16 diagnostics =: no level
#           prints Levene's test, TRUE and "levene" do, joutput()'s
#           setting reaches both functions and a level call keeps it,
#           levene = is refused with the new name, a name that is no
#           diagnostic stops.
#           RE-PINNED: U03 and U12, read from .jst_games_howell() itself
#           (jaov() no longer prints a two-group table, and stops Welch's
#           ANOVA with a constant group), and U19-U22 (the Levene note,
#           rewritten for its new form). Eleven calls take diagnostics = TRUE for levene = TRUE,
#           and ten full = TRUE calls of jt() and jaov() gained
#           diagnostics = TRUE, so the Levene tables sections B, C, I, J,
#           K and Q read still print. 283 checks.
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): 283/283
#           plain and under the RStudio-handler stand-in, each also with a
#           Windows-length temp path, and entered dirty, the session
#           handed back. On the 0.9.218 master 74 red: B01 B04 B05
#           B07-B13 C04-C08 I01 I02 J01-J03 J05 J06 J08-J10 J20 J21 J23
#           J25 J26 K07 K08 Q03 Q04 U13 U19-U22 (their calls name an
#           argument that build does not have), W01 W02 W04 W06-W08
#           W10-W13 W15-W17 W19 W20 W22-W25 and X01-X16.
#           MUTATION MAP (S346; 74 one-change mutants through all eight
#           batteries, 74 red; those that red here): Levene from
#           full = TRUE in jt or in jaov X10; the stored setting not read
#           X12 X13; a level call dropping it X13; an unknown name or a
#           wrong type passing X15; notes at the minimal level X09; the
#           reassuring zone to sizes 1.5 X05, to SDs 2.5 X04 X05; the
#           cautionary zone from sizes 1.25 X02 X06, on either ratio U19
#           X02 X04-X07; the note at p up to .10 X08; never two decimals
#           X04 X07, only near 1 X07; two groups worded as three, equal
#           sizes given a ratio X04 X07; a one-case group not set aside
#           U13 X08; the note under Welch in jt X08 (added after the
#           first round, which this mutant survived), in jaov X08; jt
#           named as the ANOVA X04; a zero SD dividing X07 (added after
#           the first round); the Welch line missing X02 X04; no help
#           pointer X01-X04; groups counted on the data W22 W23 W25; a
#           paired test losing rows W27; two one-case groups W06;
#           Student's stopped for one W03 W04 W08; Welch not stopped W01
#           W02; no zero-SE stop W07 W08; Cohen's d through NA for the
#           first group W04 (added after the first round), the second
#           W04; the missing-outcome line W22; jaov all-constant W10 W11;
#           one flat group stopping the standard ANOVA U13-U15 W12-W14;
#           Welch with a constant group W12 W13, the standard ANOVA too
#           W14; ptukey below 2 df W15 W16; blank below 3 df U12; no note
#           under blank cells W17; two groups' table after Welch or after
#           the standard ANOVA W19 W20.
#           THE SESSION GUARD hands back the stored display settings
#           (.jst_output_toggles) with the output level: the diagnostics
#           setting outlives a level call, so a run entered with
#           joutput(diagnostics = TRUE) left the session without it
#           (found entering dirty; all seven batteries with the guard).
#           LAST VERIFIED: v0.9.219, 2026-10-09 (S346) -- 283/283 on
#           the WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run,
#           2079 checks)") through receive_all(), after a clean R CMD
#           check, matching the sandbox; GitHub 14528c6.
# S342 EDIT (v0.9.216, 2026-10-06): Fix Slate 4. SECTION V ADDED, V01-V15
#           (15 checks); nothing else changed. V01-V06 jdummy() ends on
#           exactly one blank line, written to stdout after its reminder:
#           one call, two in a row, with show = TRUE and when a
#           registration is only shown, at the minimal level, and after
#           the unusual-declaration note at both levels (the S329 item).
#           V07-V10 jscreen()'s star and its legend (the S324 item): a 1/2
#           variable registered with jnumeric() has no star, an empty
#           Sub-class cell beside another variable's, and no legend line;
#           as it comes, and registered with jdummy(), it keeps both.
#           V11-V15 a list column, a raw column and a column that is a
#           data frame are Unsupported rows, the table and the header
#           pinned; a list column's NA cell counts as a missing cell; a
#           frame of nothing else; the single-column form; an ordinary
#           frame's count as it was (the S213 item). 240 checks.
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): 240/240
#           plain and under the RStudio-handler stand-in, each also with a
#           Windows-length temp path, and entered dirty, the session
#           handed back. On the 0.9.215 master 11 red: every V check but
#           the controls V05 V07 V10 V15.
#           MUTATION MAP (S342; the mutants of models_check.R's list that
#           red here): no closing blank line V01 V02 V03 V04 V06; one
#           always V05; the unusual-declaration note not counted V06; the
#           blank line on the message stream V03; the star on a
#           registered-Numeric dichotomy V09, and V08 with it when the
#           legend's own condition is removed as well (alone, that second
#           change is the same program); complete.cases() on the
#           whole frame V11-V14; a list column's NA cells not counted V12
#           V13; a data-frame column read cell by cell V11; a raw column
#           not set aside V11 V12 V13; a list not put in whole on the
#           single-column path V14. The build list holding only the first
#           variable also reds S02 S05 V03 V05, whose calls name two.
# LAST VERIFIED: v0.9.216, R 4.6.1, 2026-10-06 (S342) -- 240/240 on the
#           WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run, 1844
#           checks)") after a clean R CMD check, matching the sandbox
#           plain, under the RStudio-handler stand-in and each again with
#           a Windows-length temp path; GitHub 8737548.
# S341 EDIT (v0.9.215, 2026-10-06): GAMES-HOWELL AFTER WELCH; A GROUP OF
#           ONE CASE. SECTION U ADDED, U01-U22 (22 checks); K08 and K09
#           RE-PINNED. jaov(welch = TRUE, posthoc = TRUE) prints the
#           Games-Howell table where a note said Tukey HSD was not
#           applicable (the S327 item, taken ahead of the fix slates on
#           Jeff's call, for a thesis student). U01-U02 pin the returned
#           comparisons to rstatix::games_howell_test() 0.7.2, run once in
#           the sandbox on f_gh (rstatix is not a dependency: the numbers
#           are in the check); U03 to stats::t.test() for two groups; U04
#           to Tukey's naming and order; U05-U08 the printed table, its
#           alignment, its place and digits; U09 the output level; U10-U11
#           the returned posthoc and Tukey's unchanged table; U12 a pair of
#           constant groups. U13-U18, the Session 105 item: a group of one
#           case prints blank interval cells where R's "NaNs produced"
#           printed, and under Welch stops in the house voice where R's
#           "not enough observations" did. K08 now asserts the table and
#           the ABSENCE of any Tukey note; K09 the one remaining note.
#           U19-U20 (second delivery, the same day): the Levene note one
#           blank line under its table in jaov() and jt() -- Jeff's walk
#           of format_walk.R Section 23; nothing had asserted it, and the
#           first delivery's 221 stayed green on the change.
#           U21-U22 (third delivery): the note's "p < .001", which read
#           "p = <.001", and with it the first sentence on one line.
#           225 checks. Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all):
#           225/225 plain and under the RStudio-handler stand-in, each
#           also with a Windows-length temp path, and entered dirty;
#           run_all.R 1758 across eight. On the 0.9.214 master 18 red: K08
#           and every U but the controls U11, U15, U20 and U22.
#           MUTATION MAP (25 one-change mutants, each through all eight
#           batteries; none reds a check of another file): the standard
#           error halved U01 U02 U03 U05 U08; a df term's n - 1 as n U01
#           U02 U03 U05 U08 U12; ptukey for 2 means U02 U05; qtukey for 2
#           means U01 U05 U08; the sqrt(2) dropped U02 U03 U05; the
#           difference reversed U01 U03 U04 U05 U08 U12; the pair named
#           earlier-later U04 U05 U07 U12; the posthoc guard dropped K08
#           U09 U10; df at the digits setting U05 U08 U12; df rounded whole
#           U05 U08; the caption reworded K08 U05-U09 U12; the 97.5 percent
#           point U01 U03 U05 U08; right-justified columns U06; the blank
#           line above the caption dropped U07; a zero standard error let
#           through U12 (it survived the first round: R returns NaN without
#           a warning and NaN prints blank -- U12 now reads the returned
#           NA); posthoc not returned U01-U04 U10; Tukey's df from the
#           wrong row U10; qt() unguarded U13; the Welch stop off U16 U17
#           U18; the group named by its code U18; "it" for two groups U17;
#           the names left out of the stop U16 U17 U18; the blank line
#           above the Levene note dropped at any one of its four sites U19;
#           "p = " pasted before every p again, in jaov() or in jt(), U21.
# S340 EDIT (v0.9.214, 2026-10-05): Fix Slate 3. SECTION T ADDED, T01-T11
#           (11 checks): color only where it can be drawn (the Session 118
#           item; Jeff's S336 ruling). .jst_use_color() by each signal --
#           the front end, the Console's color report, an active sink, a
#           knitr run -- and options(jstats.color = TRUE / FALSE) over all
#           of them; captured output plain (jfreq, jt, jscreen, joutput,
#           the yellow default-frame note); the option forcing the escapes
#           back, byte for byte what 0.9.213 wrote; the two helpers'
#           text unchanged when color is off. Setup now records the
#           jstats.color option, forces it unset and restores it at the
#           foot. Section T's frame uses column names no workspace holds
#           (zz_t_v, zz_t_g): T06 and T08 type a bare name under a juse()
#           default (the S338 fifth dirty-entry condition). TWO HUNDRED AND
#           THREE checks.
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): 203/203 plain
#           and under the RStudio-handler stand-in, each also with a
#           Windows-length temp path, and entered dirty (joutput("full"),
#           width 110, a juse() default, a stata convention, jstats.color =
#           TRUE, workspace objects named like fixture variables): the
#           width, the default frame, the level, the convention and the
#           color option handed back, nothing left but .results.
#           On the 0.9.213 master 9 red: T01-T06 and T09-T11 (the helper
#           is taken through tryCatch, so the battery does not halt there);
#           T07 and T08 hold there, 0.9.213 having always written the
#           escapes.
#           MUTATION MAP (the S340 mutants that red here; the full list of
#           74 is described in cps_check.R): an active sink ignored, a
#           knitr run ignored, the Console's signal ignored, any front end
#           counted as RStudio, a Console reporting 0 colors counted, each
#           T02; color never drawn T01 T04; any value but FALSE forcing it
#           on T04; the sink count not read from the session T05;
#           jstats.color = TRUE ignored T03 T07 T08; FALSE ignored T03 T10;
#           red always written T06 T09 T10 T11; yellow always written T06
#           T11.
#           LAST VERIFIED: v0.9.214, R 4.6.1, 2026-10-05 (S340) -- 203/203 on
#           the WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run,
#           1734 checks)") after receive_package() and a clean R CMD check,
#           matching the sandbox; GitHub 2d04b68.
# S337 EDIT (v0.9.211, 2026-10-05; no package change): the fixture guard of
#           _template_check.R. A GREEN run now removes everything the battery
#           made (the names in the workspace are recorded at Setup; .results
#           stays, for run_all.R), so a walk that reports on the data frames in
#           the workspace can follow it in one session. A red run keeps its
#           fixtures. No check added or changed: 192/192 in the sandbox, plain,
#           under the RStudio-handler stand-in, and ENTERED DIRTY
#           (joutput("full"), width 90, a juse() default, a stata convention):
#           nothing left but .results, and the width, the default frame, the
#           level and the convention as they were on entry. (Setup still clears
#           stored jsubset(), jcomplete() and registration settings, as it
#           always has.)
# S329 EDIT (v0.9.205): SECTION R ADDED; K01, N01, N05 AND N09 RE-PINNED;
#           N02-N04 MOVED TO A NEW READER. The crosstab build: Jeff's five
#           rulings on format_walk.R Sections 15 and 17 at v0.9.204, and
#           the S328 residual-note rider he okayed at S329 with the pointer
#           line's wording ("keep the draft - shorter is better here").
#           cells() AND tab() STOP AT THE FIRST EMPTY LINE, and a crosstab
#           with sub-rows now has one after every row group: on the new
#           master N04 PASSED through cells(), reading the first category
#           alone. xt_cells() reads to the Total row and drops the empty
#           lines; N04 also counts its rows now. No other section reads a
#           crosstab through cells() or tab().
#           R10a CAME FROM A MUTANT THAT PASSED: the 4.99 guard applied to
#           the expected Total as well (E9) red nothing, and was first
#           read as equivalent -- a row total is a whole number. It is not
#           equivalent: a search of small tables found a row of 5 whose
#           three expected counts sum to 5 - 8.9e-16 in floating point
#           (f_x5t), which the guard would print as 4.99 beside an
#           observed 5. The master was already right; the check now holds
#           it there.
#           Q02 runs two more calls (both notes together; single-line
#           rows): 78 runs, from 52.
#           ONE HUNDRED AND EIGHTY-FIVE checks: the 166 of S328, R01-R18
#           and R10a.
#           SECOND DELIVERY, THE SAME DAY: SECTION S ADDED (S01-S07), 192
#           checks. Jeff's two remarks walking format_walk.R Section 19 on
#           the first delivery: "haven_labelled" on jdummy's Variable line
#           is R's word, not a user's ("drop the parenthetical"; jscreen's
#           opt-in Base R Type column keeps it, S07), and the starred
#           reference read "as if this is the only reference category
#           possible" (the tag, in the one-line form he chose). No battery
#           read either line before this section. Sections A-R are as
#           first delivered.
# S328 EDIT (v0.9.204): SECTIONS L-Q ADDED; THE LEAN REVERSED. Step 2 of
#           the formatting sequence, on Jeff's five rulings: (1) the odd
#           space on the LEFT, in every table and in the Case Processing
#           block ("I think B looks better"); (2) the crosstab's cells on
#           the decimal point, the sub-row indent kept; (3) each call
#           names its columns and trim becomes the renderer's default; (4)
#           exactly one closing blank line; (5) Min and Max per variable.
#           ctr(), this file's model of the renderer's centering, changed
#           with the lean, so aligned() and bc_ok() follow it everywhere;
#           the five J checks that pin whole lines were re-pinned (J20,
#           J23, J24, J25, J26). UNDER THE NEW LEAN "c" AND "bc" PRINT
#           ALIKE wherever a value is ONE character narrower in a column
#           with no spare space or an even one -- the centered cell's odd
#           space now falls where right-justifying would put it -- so a
#           fixture needs values TWO characters apart, or an odd spare:
#           f_mix's second item was multiplied by ten (J29: 3.000 under
#           300.000), and f_v100 (J28a), f_x100 (N06), f_big and f_or
#           (O03a, O03c), f_out (O08a) and f_mm's w (P05) were built for
#           it. The first mutation run found the gap: seven mutants passed
#           every check (C11 C15 C17 C31 C33 D24 JD11) until those
#           fixtures, O03d and P08's grouped clause existed.
#           TWO DEFECTS FOUND PROBING ROUND SAMPLE SIZES, fixed in the same
#           build: jcrosstab printed a count of exactly 100000 as "1e+05"
#           (N09), and jlm's F line a residual df of exactly 100000 the
#           same way (O11). No other function did, at any output level.
#           ONE HUNDRED AND SIXTY-SIX checks: the 96 of S327, J28a,
#           L01-L11, M01-M05, N01-N09, O01-O11 with O03a-O03d and O08a,
#           P01-P09 with P06a, Q01-Q16 with Q12a and Q12b.
#           SECOND DELIVERY, THE SAME DAY: THE CAPTURE REWRITTEN. The first
#           delivery (165 checks) passed in the sandbox and gave 161/165
#           on the workstation: Q02 Q06 Q13 Q15 red. The fault was in THIS
#           FILE, not in the package. both_out() read the message stream
#           through a sink, and RStudio (2025.05 and later) re-emits every
#           message, and every warning under options(warn = 1), through
#           global calling handlers of its own, wrapped in escape
#           sequences -- so each note reached the sink with RStudio's end
#           marker on the line after it, where the checks expect a blank
#           line. The four red checks are the four whose calls put text
#           on the message stream beside a blank line they measure
#           (jcrosstab's residual note at "full", jdesc's refusal note
#           twice, jalpha's warning). both_out() now takes messages and
#           warnings as CONDITIONS, where they are signalled -- grab()'s
#           pattern in _template_check.R, which every battery that reads
#           a message already uses -- and Q16 holds it to that. REPRODUCED
#           AND CONFIRMED in the sandbox by running under those handlers,
#           copied from RStudio's source (rstudio/rstudio, src/cpp/r/R/
#           GlobalCallingHandlers.R): the first delivery gives Jeff's
#           scoreboard line for line; this file gives 166/166 there and in
#           a plain session.
# S327 EDIT (v0.9.203): SECTIONS J AND K ADDED. The S326 alignment item
#           (Jeff's catch on the 0.9.202 walk: in the ANOVA table F sat
#           right-justified and p left-justified) and the S326 round()-notes
#           item, with Jeff's S327 rulings: the 17-table scope; the
#           expected-frequency note at two places, capped below 5, in the
#           "(minimum = 4.96)" form; the Welch notes reworded "not
#           applicable"; jlogistic's closing blank and jscreen's trailing
#           spaces folded in. Sections A-I passed UNCHANGED on the new
#           master: they read cells by position after trimming (tab()), so
#           they cannot see alignment -- section J reads the untrimmed cells
#           (cells()). NINETY-SIX checks: the 54 of S326, J01-J30 and
#           K01-K12.
# FIXTURES: built inline (no dataset file), plus the SHIPPED community and
#           clinic through jload(package = TRUE) for the natural cases --
#           the calls named in the S326 discussion. The inline frames are
#           built so the old detection would strip: f_aov's group means are
#           16, 15 and 14, its sums of squares 8, 24 and 32, its Levene F
#           0 and, with equal group sizes and variances, Welch's df 6.0;
#           f_log's predictors are orthogonal (VIF 1.000) and its outcome
#           balanced over them, so every case is predicted 0 (% Correct
#           100.0, 0.0, 75.0) and the fit statistics are 0.000; f_a2's two
#           items have means 3 and SDs 2 and correlate 0.75; f_a3's three
#           items give Alpha if Item Deleted of 0.5, 0.5 and 0.4.
#           S327: f_far (group means 2.5, 3.0 and 102.5, so one Tukey p is
#           .850 and two are <.001, and its columns mix widths); f_vif (two
#           predictors correlated at sqrt(15/16), so each VIF is 16 and the
#           inflation factor 4, and a third orthogonal to both, VIF 1);
#           f_mix (three items on different scales, means 3, 30 and -3);
#           and four 2 x 2 frames whose smallest expected count is 4.96,
#           4.998, exactly 3, and 1.2 with three cells under 5.
#           S328: f_fq (counts 104, 9 and 7 with five missing, so every
#           jfreq column mixes widths); f_x100 and f_xp (2 x 2 tables whose
#           chi-square rows read 100.644 over 96.590, and <.001 over
#           .001); f_100k (four cells of exactly 100,000 cases); f_mm
#           (four variables: x in tenths with a whole-number maximum, w in
#           whole numbers of three widths, z to three places, h in halves
#           between whole-number extremes) and f_gm (the grouped case,
#           with one groupless row at two places); f_big and f_or
#           (coefficients and bounds two characters apart); f_v100 (VIFs
#           of 100 and 1); f_out (an Outliers column of 100 over 5); f_df
#           (100,002 cases, so 100,000 residual df). f_mix's second item
#           is ten times its S327 self.
#           S329: f_x5 (a 2 x 2 whose smallest expected count is exactly
#           5); f_x3rd (a 2 x 3 with expected counts of 3.333... and
#           6.666..., so the rounded cells of a row do not sum to its
#           total); f_x5t (a row of 5 whose expected counts sum to a hair
#           under 5 in floating point). Section R's renderer checks build
#           their frames from header widths (.r_w()). f_dm (section S): a
#           factor, a text, a logical and a numeric column, one of each
#           kind of variable jdummy() takes beside the labelled one.
# MUTATION MAP (S329): 62 mutants of the 0.9.205 master (second
#           delivery), ONE change each, every one RUN against this file as
#           delivered (192 checks); the first 47 had also run against the
#           first delivery's 185, with the same reds bar G1's S04. 61 red
#           at least one check. The one that reds nothing is EQUIVALENT:
#           D15, the default test reading only the first element of a ref
#           of several values -- such a call stops inside
#           .jst_make_dummy_names() before the line is built. (That stop
#           is a raw R error, "'length = 2' in coercion to 'logical(1)'":
#           ref is not validated. Logged at S329 as a to-do, not fixed
#           here.) Each entry: mutant -> the checks it reds.
#           THE RENDERER'S GAP:
#             G1 the default gap four -> J20 J23-J26 J28a L02 L05 L11 M02
#                M04 N06-N08 O02 O03a-O03d O04-O08 O08a O09 O10 P05 R01 R16
#                R18 S04
#             G2 of several, always the first (no fit test) -> N01 R02-R05
#                R16
#             G3 none fits: the first, not the last -> R02 R05
#             G4 the fit test strict (< for <=) -> R03 R04 R16
#             G5 one gap counted per column, not per space between -> R03
#                R04 R16
#             G6 the indent not counted -> R04
#             G7 indent counted, header.indent ignored -> R04
#             G12 header.indent counted, indent ignored -> R04
#             G8 the ceiling a constant 76, not the setting -> R05 R16
#             G9 the validation removed -> R06
#             G10 of several, the LAST that fits -> N05 N09 R02-R05 R07-R10
#                R12 R13 R15 R16 R18
#             G11 the fit test ignoring the columns' widths -> N01 R02-R05
#                R16
#           THE CROSSTAB'S GAP:
#             X1 the gap argument removed -> N05 N09 R07-R10 R12 R13 R15
#                R16 R18
#             X2 four always, no fallback -> N01 R16
#             X3 c(2, 4) -> as X1
#             X4 c(3, 2) -> as X1
#             X5 the 2 x 2 chi-square table given the gap too -> N06 N07
#                R18
#             X6 the one-row chi-square table given it too -> N08 R16
#           EXPECTED FREQUENCIES:
#             E1 the cells at one place -> K01 K03 K04 N01 R07-R10 R10a R11
#                R17 (the note shares the formatter)
#             E2 the guard removed -> K02 R08
#             E3 the guard catching exactly 5 -> R09
#             E4 the guard on every value below 5 -> K01 K03 K04 N01 R07
#                R10 R10a R11 R17
#             E5 the Total summed from the rounded cells -> R10 R10a
#             E6 the Total at one place -> N01 R07-R10 R10a R11
#             E7 the cells following the digits setting -> K01 K03 K04 N01
#                R07-R10 R10a R11 R17
#             E8 the note's minimum through its own format, unguarded ->
#                K02 R08
#             E9 the Total given the guard too -> R10a
#             E10 trailing zeros dropped -> K03 K04 N01 R08 R09 R10a
#           THE ROW GROUPS:
#             S1 expected counts alone bring no blank lines -> R14
#             S2 row percentages alone bring none -> N09 R13 R14
#             S3 column percentages alone bring none -> R14
#             S4 residuals alone bring none -> R14
#             S5 blank lines always -> R12
#             S6 none before Total -> N01 N09 R07 R13 R14
#             S7 one above the first category too -> N01 N09 R07 R13 R14
#             S8 none between categories -> N01 N09 R07 R13 R14
#             S9 one before the second category only -> R13 R14
#             S10 one between Total and its (Col %) row -> N02 N03 R15
#           THE POINTER LINE:
#             P1 always printed -> R17
#             P2 never printed -> K01 R17 R18
#             P3 the condition inverted -> K01 R17 R18
#             P4 on the line of the sentence before it -> K01 R17 R18
#             P5 the wording ("... to the call.") -> K01 R17 R18
#           THE RESIDUAL NOTE'S BLANK LINE:
#             B1 not printed -> R18
#             B2 printed even when the output ends on a blank line -> Q02
#                R18
#             B3 printed whenever residuals are asked for, note or no note
#                -> Q02
#             B4 printed only when the output already ends on one -> Q02
#                R18
#           jdummy's REGISTRATION LINES:
#             D1 the tag always printed -> S03-S06
#             D2 the tag never printed -> S01 S03-S06
#             D3 every registration recorded as a default -> S03 S04 S05
#             D4 "auto" matched case-sensitively -> S03
#             D5 the overview without the code -> S05
#             D6 the code printed on registration too -> S01 S03 S05
#             D7 the class back on registration -> S01 S02
#             D8 the class back when a registration is shown again -> S04
#             D9 the class back in the overview -> S05
#             D10 shown again: the plain line, untagged -> S04 S06
#             D11 the overview: the plain line, untagged -> S05
#             D12 the tag's wording ("(default)") -> S01 S03-S06
#             D13 the field not stored -> S01 S03-S06
#             D14 the field not stored, the registration's own line still
#                tagged -> S04 S05 S06
#             D15 a ref of several values counted by its first -> nothing
#                (equivalent; see above)
#           THE HARNESS (a mutant of THIS FILE, not of the master): H2
#           N02-N04 reading through cells() again -> N02 N03 N04.
#           Against the UNEDITED 0.9.204 master: 163/192. Red there: K01,
#           N01 N05 N09, every section R check and S01-S06, and none
#           other -- the 29 checks that see this build. (N02-N04 are green
#           on both: they read position, which this build does not move;
#           S07 is a control.)
# MUTATION MAP (S328): 179 mutants of the 0.9.204 master, ONE change each,
#           every one RUN against this file and cps_check.R (the two
#           batteries the build edits); R1, R2, R3 and R5 also against all
#           eight, where the other six stay green -- they pass on the
#           0.9.203 master and on this one alike, so none of them sees
#           where a value sits. (108 of the 179 ran before N09 and O11
#           were added and cannot reach either: they touch neither
#           jcrosstab, jlm, the legend helpers nor the renderer. The other
#           71 ran again afterwards, with no change to a line below. The
#           38 that red a section Q check, and K1, ran once more against
#           the rewritten both_out(), in a plain session and under
#           RStudio's handlers: the same lines both ways.)
#           161 red at least one check. The 18 that red nothing are
#           EQUIVALENT mutants, generated to show it:
#             C at the nine ONE-ROW tables (01 03 04 05 08 12 13 16 23):
#                with one row the block is the value
#             C28: every cell of the scheme is one character
#             D25: with no standardized column every header is narrower
#                than its values, so the decimal tab prints the same table
#             BD4: the "bd" branch centers a header exactly as "c" does
#             DP4 DP6 DP7: shortcuts for speed; the result is the same
#             CN4: the grand total is an integer sum, which as.character()
#                never abbreviates
#             CN6: the renderer trims each cell before it aligns it
#             CN8: a numerator df of 100000 would take 100,000 predictors
#           THE 33 CALL SITES. Letters before a site number: C "c" in place of
#           "bc" (each cell centered on its own), X "r" in place of "bc", A the
#           align argument removed (the renderer's default back), D "d" (the
#           decimal tab) back; at the two "bd" sites B "bc", L "l" and C "c" in
#           place of "bd", and I "l" in place of "ln". Each entry: mutant ->
#           the checks it reds here | cps: those it reds in cps_check.R.
#             01 jt Levene: C -> nothing; X A -> J01
#             02 jt Group Descriptives: C -> J27; X A -> J02 J27 | cps: N53g
#             03 jt's test table with CI: C -> nothing; X A -> J03 J23
#             04 jt's test table without: C -> nothing; X A -> J04
#             05 jaov Levene: C -> nothing; X A -> J05
#             06 jaov Group Descriptives with CI: C -> J27; X A -> J06 J24 J26
#                J27
#             07 jaov Group Descriptives without: C -> J27; X A -> J07 J27
#             08 jaov Welch: C -> nothing; X A -> J08
#             09 jaov ANOVA: C -> J20 J27; X A -> J09 J20 J24-J27
#             10 jaov Tukey: C -> J21 J22 J27; X -> J10 J27; A -> J10 J21 J22
#                J27
#             11 jlm VIF: C -> J28a; X A -> J11 J28 J28a
#             12 jlogistic Omnibus: C -> nothing; X A -> J12 O04
#             13 jlogistic Model Summary: C -> nothing; X A -> J13
#             14 jlogistic Classification: C -> J14 J28; X A -> J14 J25 J28
#             15 jlogistic VIF: C -> J28a; X A -> J15 J28 J28a
#             16 jalpha Reliability: C -> nothing; X A -> J16
#             17 jalpha Item Statistics: C -> J29; X A -> J17 J29
#             18 jalpha Item-Total: C -> J29; X A -> J18 J25 J29
#             19 jscreen Variable Types: C -> J30; X -> J19 J30
#             20 jfreq: C X -> M01 M02 M04 M05 | cps: N53h
#             21 jcrosstab's cells: B L C -> N01 N02 N04 N05 N09; I -> N01 N03
#                N05 N09; A -> N01-N05 N09
#             22 the 2 x 2 chi-square table: C -> N06; X A -> N06 N07
#             23 the one-row chi-square table: C -> nothing; X A -> N08
#             24 jlm's coefficients: C -> O03a; X -> O01 O03a O03d; D -> O03d
#             25 jlm's coefficients, no standardized column: C X -> O03b; D ->
#                nothing
#             26 jlm's CI columns: C -> O03a; X D -> O01 O02 O03a
#             27 jlogistic's coefficients: C -> O03c; X -> O03 O03c O04; D ->
#                O03 O03c
#             28 the dummy-coding scheme: C -> nothing; X A -> O06
#             29 jcomplete()'s set-time table: C -> O07 | cps: N49a N49b N49e;
#                X -> O07 | cps: N49a N49d N49e; A -> O07 | cps: N49a N49b N49d
#                N49e
#             30 jscreen Missing Data, Missing and % Missing: C X -> O08 | cps:
#                N50a N50b N50c
#             31 jscreen Missing Data, Outliers: C -> O08a; X -> O08 O08a |
#                cps: N50a N50b N50c
#             32 jdesc grouped: C -> cps: N53c; X A -> P07 | cps: N53b N53c
#             33 jdesc ungrouped: C -> P05; X -> P04 P05 | cps: N53a; B -> P04
#                P05
#           THE RENDERER:
#             R1 a centered header's lean back -> J02-J04 J06-J09 J13 J17 J20
#                J23 J26-J29 L01 L04 L06 L09 N01 N02 N07 N08 O01 O03 O03a O03b
#                O03d O03c O04 O07 P04 P05 P07 | cps: N49c N49e N53a N53g
#             R2 a "bc" block's lean back -> J03 J04 J10 J12-J14 J16 J18 J20
#                J23-J30 L02 M01 M02 M04 M05 N06-N08 O03 O03a O03c O04 O06-O08
#                O08a P04 | cps: N49a N49d N49e N50a N50b N50c N53a N53b N53c
#                N53h
#             R3 a "bd" block's lean back -> N01 N02 | cps: N53a
#             R4 the Case Processing block's ctr_count() lean back -> cps: N55a
#                N55b N55c
#             R5 trim off by default -> G04 J01-J16 J18-J20 J23-J29 J28a J30
#                L10 M01-M05 N01 N02 N05 N06 N09 O01-O03 O03a O03b O03d O03c
#                O04-O08 O08a O10 P04 P05 P07 | cps: N53e N53f N53h N53i
#             R6 "bc" the default for a numeric column -> L11 O09 | cps: N53i
#             R7 "bc" the default for a text column -> L11 | cps: N53i
#             R8 the header row not trimmed -> G04 J01 J02 J05 J07-J09 J11-J13
#                J15 J20 J26-J28 J28a N06 N09 O03b O03d O04 P04 P05 P07 | cps:
#                N53e
#             R9 the data rows not trimmed -> J03 J04 J06 J09 J10 J14 J16
#                J18-J20 J23-J30 L10 M01-M05 N01 N02 N05 N09 O01-O03 O03a O03c
#                O05-O08 O08a O10 | cps: N53f N53h N53i
#           THE DECIMAL-ALIGNED BLOCK ("bd"):
#             BD1 tails not padded to one width -> L05-L09 N01 N02 N04 N05 N09
#                P04 P05
#             BD2 heads not right-justified -> N01 N02 N04 N09 P05
#             BD3 no cell split (every cell all head) -> L05-L09 N01 N02 N04
#                N05 N09 P04 P05
#             BD4 "bd" left out of the header map -> nothing
#             BD5 the column not widened to its block -> L08 L09 N02 N09 P03
#                P05
#             BD6 the block width left at the widest cell -> L08 L09 N02 N09
#                P03 P05
#             BD7 a cell that is not a number given a tail -> L06
#             BD8 the sign not kept with the whole-number part -> L05 L07-L09
#                N05 P05 P08
#             BD9 the data rows not built from the block cells -> L05-L09 N01
#                N02 N04 N05 N09 P04 P05
#             BD10 a value with no whole-number part not read as a number ->
#                L09
#           .jst_data_dp() (DP) AND jdesc's MIN AND MAX (JD):
#             DP1 whole numbers given one place -> G02 G03 P01 P03 P05 | cps:
#                N53a N53b
#             DP2 the cap not passed on -> P01 P08
#             DP3 only the first batch of 5,000 read -> P02
#             DP4 the early stop removed -> nothing
#             DP5 missing values not dropped -> P01 P03 P04 Q06 | cps: halts
#             DP6 the cap-of-zero shortcut removed -> nothing
#             DP7 the whole-number shortcut removed -> nothing
#             JD1 ungrouped: every row at the column's largest precision (the
#                old form) -> P03 P05
#             JD3 ungrouped: the places taken from the minimum and maximum, not
#                the data -> P05 P06a
#             JD4 ungrouped: the digits setting not capping the places -> P08
#             JD5 grouped: the places taken from the group minimums and
#                maximums -> P07
#             JD6 grouped: cases with no group lending their places -> P07
#             JD7 grouped: Min left to the per-column detection -> P07
#             JD8 grouped: Max left to the per-column detection -> P07
#             JD9 ungrouped: Min left to the per-column detection -> P03 P05
#                P06a
#             JD10 ungrouped: Max left to the per-column detection -> P03 P05
#                P06 P06a
#             JD11 grouped: the digits setting not capping the places -> P08
#           THE CLOSING BLANK LINE AND THE LEGENDS:
#             CB1 jfreq: its second closing blank line back -> Q01
#             CB2 jt: the closing blank printed after a legend too -> Q03 Q12
#                Q12a
#             CB3 jaov: the same -> Q04
#             CB4 jscreen: the same -> Q05
#             CB5 jscreen: the legend with no blank line above it -> Q05
#             CB6 jcrosstab: the crosstab's own blank line not counted -> Q02
#             CB7 jcrosstab: the chi-square table not counted as text -> Q02
#             CB8 jcrosstab: the residual note not counted as text -> Q02
#             CB9 jcrosstab: the legend always led by a blank line -> Q02
#             CB10 jcrosstab: a printed legend not counted -> Q02
#             CB11 jcrosstab: the closing blank always printed -> Q02
#             CB12 jcorr: the legend with no blank line above it -> Q07
#             CB13 jcorr: the Spearman note always led by a blank line -> Q07
#                Q12b
#             CB14 jcorr: the Spearman note never led by one -> Q12b
#             CB15 jcorr: the note not counted as text after a legend -> Q07
#                Q12b
#             CB16 jcorr: the closing blank always printed -> Q07
#             CB17 jlm: the closing legend with no blank line above it -> Q08
#             CB18 jlm: the closing blank printed after a legend too -> Q08
#             CB19 jdesc: a refusal note not counted as text -> Q06 Q13
#             CB20 jdesc: the legend with no blank line above it after a note
#                -> Q06 Q13
#             CB21 jdesc: no closing blank after a note -> Q06
#             CB22 jdesc grouped: a refusal note not counted as text -> Q06
#             CB23 jdesc grouped: the variable legend with no blank line above
#                it after a note -> Q06
#             CB24 jdesc grouped: no closing blank after a note -> Q06
#             CB35 jdesc grouped: the value legend with no blank line above it
#                after a note -> Q06
#             CB25 .print_var_labels(): the lead-in blank never printed ->
#                Q02-Q07 Q12 Q13
#             CB26 .print_var_labels(): reports nothing printed -> Q02-Q07 Q12
#                Q12a Q12b
#             CB27 .print_value_labels(): the lead-in blank never printed ->
#                Q02-Q04 Q06
#             CB28 .print_value_labels(): reports nothing printed -> Q02-Q04
#                Q06
#             CB29 .print_model_var_labels(): the lead-in blank never printed
#                -> Q08
#             CB30 .print_model_var_labels(): reports nothing printed -> Q08
#             CB31 .jst_print_legends(): the second block always led by a blank
#                -> Q02-Q04 Q12
#             CB32 .jst_print_legends(): the first block's report forgotten ->
#                Q12a
#             CB33 .jst_print_legends(): reports nothing printed -> Q02-Q04 Q12
#                Q12a
#             CB34 .jst_print_legends(): the first block with no blank above it
#                -> Q02-Q04 Q12
#             JA1 jalpha: the blank after the warning always printed (the old
#                form) -> Q14
#             JA2 jalpha: the blank after the warning never printed -> Q15
#           THE TUKEY NOTE (the clause K08 gained):
#             K1 jaov: the Tukey note printed without a post-hoc request -> K08
#           WHOLE NUMBERS PRINTED WHOLE:
#             CN1 jcrosstab: the cell counts through as.character() -> N09
#             CN2 jcrosstab: a row total through as.character() -> N09
#             CN3 jcrosstab: the column totals through as.character() -> N09
#             CN4 jcrosstab: the grand total through as.character() -> nothing
#             CN5 jcrosstab: fmt_count() allowed scientific notation -> N01 N04
#                N05 N09
#             CN6 jcrosstab: fmt_count() without trim -> nothing
#             CN7 jlm: the F line's residual df through cat() -> O11
#             CN8 jlm: the F line's numerator df through cat() -> nothing
#           THE HARNESS (a mutant of THIS FILE, not of the master): H1
#           both_out() reading the message stream through a sink again ->
#           Q16 in a plain session; Q02 Q06 Q13 Q15 Q16 under RStudio's
#           handlers.
#           Against the UNEDITED 0.9.203 master: 83/166. Green there:
#           sections A-I and K, J01 J05 J11 J15 J19 J21 J22 J28a, L03 L11,
#           O09, P08 P09, Q09 Q10 Q15 Q16 -- tables the lean does not move
#           (one row, or an exact fit), behavior this build left alone,
#           and the check of the harness itself.
#           The S327 and S326 maps below are records of their own builds;
#           S327's R1 and R2 flipped the tie rule TO the lean S328 adopted.
# MUTATION MAP (S327): 110 mutants of the 0.9.203 master, each RUN against
#           this file; the four renderer mutants (R1-R4) also against all
#           eight batteries, and A02, F1 and N22 against cps_check.R.
#           THE 19 CALL SITES, numbered as J01-J19, four mutants each: A
#           the align/trim line removed (the default alignment back), T
#           trim = TRUE removed, X "r" in place of "bc", C "c" in place of
#           "bc" (each cell centered on its own). A, T and X red:
#             01 jt Levene -> J01; 02 jt Group Descriptives -> J02 J27 (A02
#                also cps_check.R N53g); 03 jt's test table with CI -> J03
#                J23; 04 without -> J04
#             05 jaov Levene -> J05; 06 Group Descriptives with CI -> J06
#                J24 J26 J27; 07 without -> J07 J27; 08 Welch -> J08
#             09 ANOVA -> J09 J20 J25 J26 J27 (A09 and X09 also J24)
#             10 Tukey -> J10 J27 (A10 also J21 J22)
#             11 jlm VIF -> J11 J28
#             12 Omnibus -> J12; 13 Model Summary -> J13; 14 Classification
#                -> J14 J25 J28; 15 jlogistic VIF -> J15 J28
#             16 Reliability -> J16; 17 Item Statistics -> J17 J29 (T17: J17
#                alone); 18 Item-Total -> J18 J25 J29
#             19 jscreen Variable Types -> J19 J30
#           C reds only where a column's values differ in width, which is
#           what J27-J30 are for: C02 C06 C07 C10 -> J27; C09 -> J09 J20
#           J24-J27; C11 C15 -> J28; C14 -> J14 J25 J28; C17 C18 -> J29;
#           C19 -> J30. At the eight ONE-ROW tables (01 03 04 05 08 12 13
#           16) C reds NOTHING and cannot: with one row the block is the
#           value, so "c" and "bc" print the same table (equivalent
#           mutants, generated to show it).
#           Other forms: "d" (the decimal tab) at 03 -> J03 J23, at 09 ->
#           J09 J20 J24-J27, at 10 -> J10 J27; the label column
#           block-centered too at 09 -> J09 J20 J24-J27, at 17 -> J17 J29;
#           jscreen with every column block-centered, or with Unique Values
#           left out of the block-centered ones -> J19 J30.
#           THE RENDERER: R1 the "bc" tie rule flipped (an odd spare space
#           to the left) -> J03 J04 J10 J12-J14 J16 J18 J20 J23-J30, and
#           cps_check.R N49a N49d N49e N50a-c N53a-c; R2 a centered header's
#           tie rule flipped -> J02-J04 J06-J09 J13 J17 J20 J23 J26-J28,
#           and cps_check.R N49c N49e N53a N53g; R3 "bc" made the default
#           for a numeric column -> nothing here, cps_check.R N53i alone;
#           R4 trim on by default -> nothing here, cps_check.R N53f N53h
#           N53i. The other six batteries stay green on all four. F1 jfreq's
#           columns given "bc" -> nothing here, cps_check.R N53h.
#           THE NOTES: N01 the expected-frequency note back to round(x, 1)
#           -> K01-K04; N02 the cap removed -> K02; N03 the "(minimum
#           expected = " wording -> K01-K04; N04 one place -> K01-K04; N05
#           the cap applied to every value -> K01 K03 K04; N06 jlm's VIF
#           note back through round() -> K05; N07 jlogistic's -> K06; N08
#           jlm's inflation factor alone -> K05; N09 both notes at three
#           places -> K05 K06; N10 the Sum of Squares note's old wording ->
#           K07 K08 K09; N11 the Tukey note's -> K08 K09; N12 and N13
#           either note printed with cat() (no wrap by width) -> K09; N14
#           both sent to the message channel -> K07 K08 K09; N15 the
#           pointer line dropped -> K07 K09; N16 jlogistic's closing blank
#           removed, N17 doubled -> K10; N18-N21 one of jscreen's four
#           header lines back on cat()'s default separator -> K11; N22 the
#           Cases line with its Excluded count -> K12 (cps_check.R stays
#           green: its N54g-i read lines with trailing spaces removed).
#           No mutant reds a check in sections A-I.
#           Against the UNEDITED 0.9.202 master: 54/96 -- every J and K
#           check red, sections A-I green.
# MUTATION MAP (S326): 44 mutants of the 0.9.202 master, each RUN against
#           this file; the four marked * also against all eight batteries.
#           M01* .jst_make_fmt's unsigned-zero line removed -> A01 A02 A09
#           M02  .jst_fmt_stat blanks a non-finite value -> A04
#           M03* the renderer's name check removed -> A07
#           M04* the renderer's fixed branch removed -> A05 A09 B05 B06
#                B08-B12 B14 C02-C08 D01-D06 E01 F01-F04 G01 G03 H01 H02
#           M05  jt Levene -> C07; M06 jt Group Descriptives -> C06 C08;
#           M07  jt's t -> C02; M08 jt's Mean Difference -> C05 C08;
#           M09  jt's Welch df -> C04; M10 jt's CI bounds -> C03;
#           M11  jt's d line back to round() -> C01 C09
#           M12  jaov Levene -> B09; M13 jaov Group Descriptives, CI form
#                -> B08 B12; M14 the same, no-CI form -> B14
#           M15  jaov's Welch table -> B10; M16 its df2 alone -> B10
#           M17  the Welch eta line back to round() -> B04; M18 padded, but
#                its trailing space back -> B04
#           M19  the ANOVA table -> B05 B06 B12; M20 Mean Square alone (the
#                S220 item) -> B06
#           M21  the eta line back to round() -> B01 B02 B03; M22 padded,
#                but its trailing space back -> B01; M23 Tukey -> B11 B12
#           M24  jlm VIF -> E01; M25 jlogistic Omnibus -> D02 D04;
#           M26  Model Summary -> D01 D03 D04; M27 Classification -> D05;
#           M28  jlogistic VIF -> D06
#           M29  jalpha's alpha -> F01; M30 Item Statistics -> F02;
#           M31  Item-Total -> F03 F04; M32 Alpha if Item Deleted alone -> F04
#           M33  jdesc grouped -> G03; M34 jdesc ungrouped -> G01;
#           M35  jdesc pads Min and Max too -> G02
#           M36* jscreen names Mean and Median whether shown or not -> H02
#                H03; cps_check.R and missing_convention_check.R halt and
#                filter_check.R reds 17 -- the one mutant other batteries
#                also see
#           M37  jscreen's digits removed -> H01 H02
#           The controls, made checks: M38 the ANOVA df fixed to digits ->
#           B07; M39 jaov's N fixed -> I02; M40 jalpha's N fixed -> F05;
#           M41 jdesc's trim off -> G04; M42 a decimal point kept at
#           digits = 0 -> A02 B13; M43 jaov returning its descriptives as
#           text -> B12 B13 B15; M44 p-values keeping a leading zero -> I01.
#           No mutant reds a check outside its own line above. The other
#           seven batteries stay green on M01, M03 and M04, as they do on
#           the unedited master: before this file nothing asserted how a
#           statistic's decimals print.
#           Against the UNEDITED 0.9.201 master: 9/54. A01-A09, B01-B06,
#           B08-B12, B14, C01-C09, D01-D06, E01, F01-F04, G01, G03, H01 and
#           H02 red; the controls B07 B13 B15 F05 G02 G04 H03 I01 I02 green.
# LAST VERIFIED: v0.9.215, R 4.6.1, 2026-10-06 (S341) -- 225/225 on the
#           WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run, 1758
#           checks)") after a clean R CMD check, matching the sandbox
#           plain, under the RStudio-handler stand-in, each again with a
#           Windows-length temp path, and entered dirty; GitHub da1684a.
#           Prior: v0.9.205 PENDING, 2026-10-03 (S329) -- 192/192 in the
#           SANDBOX (R 4.3.3, UTF-8 locale, pkgload::load_all of the build;
#           run_all.R 1289 across eight), in a plain session AND under
#           RStudio's condition handlers. The WORKSTATION ran the FIRST
#           delivery of this file at 185/185 under run_all.R (ALL BATTERIES
#           GREEN, 8 run, 1282 checks; R 4.6.1, RStudio); its run of this
#           one is pending. Prior: v0.9.204, 2026-10-03
#           (S328) -- 166/166 on the WORKSTATION under run_all.R (ALL
#           BATTERIES GREEN, 8 run, 1263 checks; R 4.6.1, RStudio),
#           matching the sandbox both plain and under RStudio's condition
#           handlers; the first delivery of that file had run there at
#           161/165. Prior: v0.9.203, 2026-10-02
#           (S327) -- 96/96 on the WORKSTATION under run_all.R (ALL
#           BATTERIES GREEN, 8 run, 1190 checks), matching the sandbox;
#           v0.9.202, 2026-10-02 (S326) -- 54/54 on the WORKSTATION (R
#           4.6.1) under run_all.R (8 run, 1146 checks).
# RUN:      source()-safe from any working directory. All output is explicit
#           cat(), so echo = TRUE is NOT required. Also runnable via
#           regression/run_all.R, which treats a stop() as FAIL. Every call
#           is wrapped, so a master that lacks the S326 helpers or the
#           digits argument FAILS its checks inside the verdict instead of
#           halting the battery.
# CONTRACT: one printed line per check, a final "RESULT: PASS (n/n)" line,
#           and stop() if and only if any check failed.
# =============================================================================

# --- Setup -------------------------------------------------------------------

# jstats must be loaded already: devtools::load_all() (development) OR
# library(jstats) (installed) -- never both in one session.
stopifnot(exists("jload", mode = "function"))

# What is in the workspace on entry (S337): on a green run everything this
# battery made beyond it is removed at the foot, so a walk that reports on
# the data frames in the workspace can follow a battery in one session.
.entry_names <- ls(globalenv(), all.names = TRUE)

# Session state to hand back at the foot (record / force / restore, S253).
.entry_message_width <- getOption(".jst_options_message_width")
.entry_default_data  <- getOption(".jst_default_data")
.entry_output_level  <- getOption(".jst_output_level")
# The stored display settings too (S346): the diagnostics setting outlives
# a level call, so restoring the level alone would hand back a session
# without it.
.entry_output_toggles <- getOption(".jst_output_toggles")
# The color switch (S340): section T asserts what an UNSET option gives, and
# sets it both ways. Recorded, forced unset, and handed back at the foot.
.entry_color         <- getOption("jstats.color")
options(jstats.color = NULL)

# Message-width pin (mandatory since S253). Sections A-I assert no wrapped
# prose; section K does: the expected-frequency note must fit one line at
# this width, and K09 narrows the width itself to see the Welch notes wrap.
options(.jst_options_message_width = 76L)

# Neutral pipeline state (state persists across calls AND across sessions).
jsubset(clear.all = TRUE); jcomplete(clear.all = TRUE); joutput(NULL)
jdummy(clear.all = TRUE)
juse(NULL)

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

# raw_out(): the printed (stdout) lines of a call, ANSI colour codes removed
# and trailing spaces KEPT; messages and warnings swallowed. A call that
# stops gives its error text instead, so a broken master fails the check
# that reads the lines rather than halting the battery.
raw_out <- function(expr) {
  res <- tryCatch(suppressMessages(suppressWarnings(
                    utils::capture.output(expr))),
                  error = function(e) paste0("[error] ", conditionMessage(e)))
  gsub("\033\\[[0-9;]*[A-Za-z]", "", res)
}

# out(): raw_out() with trailing spaces removed -- the table checks.
out <- function(expr) sub("[ \t]+$", "", raw_out(expr))

# quiet(): a call's VALUE with all its output swallowed, NULL if it stops.
quiet <- function(expr) {
  zz <- textConnection(".junk", "w", local = TRUE)
  sink(zz, type = "output")
  on.exit({ sink(type = "output"); close(zz) }, add = TRUE)
  tryCatch(suppressMessages(suppressWarnings(expr)), error = function(e) NULL)
}

# tab(): the table under a caption (or, with hdr =, the table whose header
# line starts with hdr), as a character matrix of trimmed cells -- one row
# per data line, columns named from the header. Columns are cut at the
# separator line's dash runs, so a cell is read where the renderer put it.
# NULL when the table is absent, which fails any check that reads it.
tab <- function(ln, caption = NULL, hdr = NULL) {
  i <- if (!is.null(caption)) which(ln == caption)[1] + 1L else
         which(startsWith(ln, hdr))[1]
  if (length(i) == 0L || is.na(i) || i + 1L > length(ln)) return(NULL)
  sep <- ln[i + 1L]
  if (!grepl("^-", sep)) return(NULL)
  runs   <- gregexpr("-+", sep)[[1]]
  starts <- as.integer(runs)
  ends   <- starts + attr(runs, "match.length") - 1L
  j <- i + 2L
  rows <- character(0)
  while (j <= length(ln) && nzchar(ln[j])) { rows <- c(rows, ln[j]); j <- j + 1L }
  if (length(rows) == 0L) return(NULL)
  m <- t(vapply(rows, function(r) trimws(substring(r, starts, ends)),
                character(length(starts))))
  colnames(m) <- trimws(substring(ln[i], starts, ends))
  rownames(m) <- NULL
  m
}

# col_of(): one column of a tab(), by header; NULL if absent.
col_of <- function(m, header) {
  if (is.null(m) || !header %in% colnames(m)) return(NULL)
  unname(m[, header])
}

# same(): a column read equals the expected cells exactly.
same <- function(x, want) !is.null(x) && identical(x, want)

# --- Alignment helpers (S327) ------------------------------------------------
# tab() trims its cells, so it cannot say WHERE in a column a value sits.
# These read position.

# cells(): the table under a caption (or, with hdr =, the table whose header
# line starts with hdr) as a character matrix of UNTRIMMED cells -- the
# header row first, then one row per data line -- each cut at the separator
# line's dash runs and padded out to its column's width (a trimmed line stops
# at its last value). Columns are named from the header. The table's own
# printed lines ride along as attribute "lines". NULL when the table is
# absent, which fails any check that reads it. Feed it raw_out() lines.
cells <- function(ln, caption = NULL, hdr = NULL) {
  i <- if (!is.null(caption)) which(ln == caption)[1] + 1L else
         which(startsWith(ln, hdr))[1]
  if (length(i) == 0L || is.na(i) || i + 1L > length(ln)) return(NULL)
  sep <- ln[i + 1L]
  if (!grepl("^-", sep)) return(NULL)
  runs   <- gregexpr("-+", sep)[[1]]
  starts <- as.integer(runs)
  ends   <- starts + attr(runs, "match.length") - 1L
  j <- i + 2L
  while (j <= length(ln) && nzchar(ln[j])) j <- j + 1L
  if (j == i + 2L) return(NULL)
  printed <- ln[i:(j - 1L)]
  rows    <- printed[-2L]                                  # header + data
  rows    <- paste0(rows, strrep(" ", pmax(0L, max(ends) - nchar(rows))))
  m <- t(vapply(rows, function(r) substring(r, starts, ends),
                character(length(starts))))
  colnames(m) <- trimws(m[1L, ])
  rownames(m) <- NULL
  attr(m, "lines") <- printed
  m
}

# ctr(): text centered in a field of width w the way the renderer centers
# it -- the spare space split evenly, an odd space going to the LEFT (so a
# one-digit df sits right of center under "df", where a right-justified
# number would: the lean Jeff chose at S328 for every table. Through
# v0.9.203 the odd space went to the right).
ctr <- function(text, w) {
  pad  <- w - nchar(text)
  left <- pad - pad %/% 2L
  paste0(strrep(" ", left), text, strrep(" ", pad - left))
}

# bc_ok(): TRUE when column `col` of a cells() matrix is block-centered --
# its header centered over the column, and every value right-justified in a
# block the width of the column's widest value, that block centered under
# the header. A blank cell is all spaces.
bc_ok <- function(m, col) {
  if (is.null(m) || !col %in% colnames(m)) return(FALSE)
  x   <- unname(m[, col])
  w   <- nchar(x[1L])
  v   <- trimws(x[-1L])
  blk <- max(nchar(v))
  want <- vapply(v, function(z) {
    if (!nzchar(z)) return(strrep(" ", w))
    ctr(paste0(strrep(" ", blk - nchar(z)), z), w)
  }, character(1), USE.NAMES = FALSE)
  identical(x[1L], ctr(col, w)) && identical(x[-1L], want)
}

# lft_ok(): TRUE when column `col` is flush left -- the header and every
# value start at the column's first character.
lft_ok <- function(m, col) {
  if (is.null(m) || !col %in% colnames(m)) return(FALSE)
  x <- unname(m[, col])
  x <- x[nzchar(trimws(x))]
  length(x) > 1L && !any(startsWith(x, " "))
}

# trimmed(): TRUE when no printed line of the table ends in a space.
trimmed <- function(m) !is.null(m) && !any(grepl(" $", attr(m, "lines")))

# aligned(): one table, whole -- the columns named in `left` flush left,
# every other column block-centered, no line ending in padding.
aligned <- function(ln, caption = NULL, hdr = NULL, left = character(0)) {
  m <- cells(ln, caption = caption, hdr = hdr)
  if (is.null(m) || !all(left %in% colnames(m))) return(FALSE)
  bc <- setdiff(colnames(m), left)
  length(bc) > 0L &&
    all(vapply(left, function(k) lft_ok(m, k), logical(1))) &&
    all(vapply(bc,   function(k) bc_ok(m, k),  logical(1))) &&
    trimmed(m)
}

# run_at(): the lines i .. i + n - 1 of ln starting at the first line equal
# to `first`; character(0) when it is absent.
run_at <- function(ln, first, n) {
  i <- which(ln == first)[1]
  if (is.na(i) || i + n - 1L > length(ln)) return(character(0))
  ln[i:(i + n - 1L)]
}

# --- Step 2 helpers (S328) ---------------------------------------------------

# bd_ok(): TRUE when column `col` of a cells() matrix is aligned on the
# decimal point (the renderer's "bd") -- every cell split where its
# whole-number part ends, the heads right-justified and the tails
# left-justified in one block, the block centered under the header. A cell
# that does not start with a number is all head; a blank cell is all spaces.
bd_ok <- function(m, col) {
  if (is.null(m) || !col %in% colnames(m)) return(FALSE)
  x    <- unname(m[, col])
  w    <- nchar(x[1L])
  v    <- trimws(x[-1L])
  num  <- grepl("^[-+]?[0-9]*[.]?[0-9]", v)
  head <- ifelse(num, sub("^([-+]?[0-9]*)(.*)$", "\\1", v), v)
  tail <- ifelse(num, sub("^([-+]?[0-9]*)(.*)$", "\\2", v), "")
  hw   <- max(nchar(head))
  tw   <- max(nchar(tail))
  blk  <- paste0(strrep(" ", hw - nchar(head)), head,
                 tail, strrep(" ", tw - nchar(tail)))
  want <- vapply(blk, function(z) ctr(z, w), character(1), USE.NAMES = FALSE)
  want[!nzchar(v)] <- strrep(" ", w)
  identical(x[1L], ctr(col, w)) && identical(x[-1L], want)
}

# dots_at(): the positions of the decimal point in the cells of one column
# of a cells() matrix that carry one, header left out.
dots_at <- function(m, col) {
  x <- unname(m[-1L, col])
  p <- as.integer(regexpr(".", x, fixed = TRUE))
  p[p > 0L]
}

# fq_cells(): jfreq's table as cells() would give it. jfreq prints no
# caption, and its spacer rows are EMPTY lines since the trim, where cells()
# stops reading; so this reads from the header line to the Total row, drops
# the empty lines, and cuts the rest at the separator's dash runs. The
# label column's header is blank and is named "(label)" here.
fq_cells <- function(ln) {
  i <- grep("Freq +Total % +Valid % +Cum[.] %$", ln)[1]
  j <- which(startsWith(ln, "Total "))
  j <- j[j > i][1]
  if (is.na(i) || is.na(j)) return(NULL)
  printed <- ln[i:j]
  sep     <- printed[2L]
  if (!grepl("^-", sep)) return(NULL)
  runs   <- gregexpr("-+", sep)[[1]]
  starts <- as.integer(runs)
  ends   <- starts + attr(runs, "match.length") - 1L
  rows   <- printed[-2L]
  rows   <- rows[nzchar(rows)]
  rows   <- paste0(rows, strrep(" ", pmax(0L, max(ends) - nchar(rows))))
  m <- t(vapply(rows, function(r) substring(r, starts, ends),
                character(length(starts))))
  colnames(m) <- c("(label)", trimws(m[1L, -1L]))
  rownames(m) <- NULL
  attr(m, "lines") <- printed
  m
}

# --- Crosstab helpers (S329) -------------------------------------------------

# xt_cells(): jcrosstab's crosstab as cells() would give it. Since v0.9.205
# a blank line separates the row groups whenever sub-rows show, and cells()
# stops reading at the first empty line -- so on a crosstab it returned the
# first category alone, and a check that read it passed on a third of the
# table. This reads from the header line to the Total row (and the "(Col %)"
# row under it, when there is one), drops the empty lines, and cuts the rest
# at the separator's dash runs. The printed lines, empty ones included, ride
# along as attribute "lines".
xt_cells <- function(ln, caption) {
  i <- which(ln == caption)[1] + 1L
  if (is.na(i) || i + 1L > length(ln)) return(NULL)
  j <- which(startsWith(ln, "Total"))
  j <- j[j > i][1]
  if (is.na(j)) return(NULL)
  if (j < length(ln) && startsWith(ln[j + 1L], "  (")) j <- j + 1L
  printed <- ln[i:j]
  sep     <- printed[2L]
  if (!grepl("^-", sep)) return(NULL)
  runs   <- gregexpr("-+", sep)[[1]]
  starts <- as.integer(runs)
  ends   <- starts + attr(runs, "match.length") - 1L
  rows   <- printed[-2L]
  rows   <- rows[nzchar(rows)]
  rows   <- paste0(rows, strrep(" ", pmax(0L, max(ends) - nchar(rows))))
  m <- t(vapply(rows, function(r) substring(r, starts, ends),
                character(length(starts))))
  colnames(m) <- trimws(m[1L, ])
  rownames(m) <- NULL
  attr(m, "lines") <- printed
  m
}

# xt_after_blank(): the row label of every crosstab line that follows an
# empty line -- where the spacers are. character(0) when the table has none;
# NULL when the table is absent, the line under the separator is empty (a
# spacer above the FIRST category), or two empty lines run together.
xt_after_blank <- function(ln, caption) {
  m <- xt_cells(ln, caption)
  if (is.null(m)) return(NULL)
  p <- attr(m, "lines")
  b <- which(!nzchar(p))
  if (!nzchar(p[3L]) || any(diff(b) == 1L)) return(NULL)
  sub(" {2,}.*$", "", p[b + 1L])
}

# gap_of(): the number of spaces between the columns of a printed table,
# read off its separator line (the second line of `ln`, or the line under
# `caption`'s header). NA when the gaps of one table differ.
gap_of <- function(ln, caption = NULL) {
  i <- if (is.null(caption)) 2L else which(ln == caption)[1] + 2L
  if (is.na(i) || i > length(ln)) return(NA_integer_)
  g <- nchar(strsplit(trimws(ln[i]), "-+")[[1]])
  g <- g[g > 0L]
  if (length(g) == 0L || length(unique(g)) != 1L) return(NA_integer_)
  g[1L]
}

# above(): the n lines above the first line of ln equal to `first`;
# character(0) when it is absent or has fewer than n lines above it.
above <- function(ln, first, n = 2L) {
  i <- which(ln == first)[1]
  if (is.na(i) || i <= n) return(character(0))
  ln[(i - n):(i - 1L)]
}

# both_out(): the lines a call emits on BOTH streams -- stdout and the
# message stream -- in the order it emits them, ANSI colour codes removed.
# raw_out() swallows messages, so it cannot say whether a note is the last
# thing a call prints.
#   Messages and warnings are taken AS CONDITIONS, where they are signalled
# (grab()'s pattern in _template_check.R, which every battery that reads a
# message uses), and written into the capture in the form base R prints
# them. They are NOT read back from the message stream, because a front
# end may rewrite that stream: RStudio (2025.05 and later) re-emits every
# message, and every warning under options(warn = 1), through global
# calling handlers of its own, wrapped in escape sequences ("\033G3;" ...
# "\033g"), and it is that text a sink(type = "message") receives. The
# first S328 version of this helper sank both streams: 165/165 in the
# sandbox, and Q02 Q06 Q13 Q15 red on the workstation, where each note
# arrived with RStudio's end marker on the line after it. A handler set
# here runs before a global one and muffles the condition, so the capture
# is the same under any front end; Q16 holds it to that. (jstats writes to
# the message stream only through message() and warning(), so the
# conditions are all of it.)
#   Warnings are written where they happen, as options(warn = 1) prints
# them ("Warning: ..."), unless deferred = TRUE, which runs the call as R's
# default does: warn = 0, the warnings not printed inside the call at all.
# "[error]" when the call stops.
both_out <- function(expr, deferred = FALSE) {
  op  <- options(warn = if (deferred) 0L else 1L)
  tf  <- tempfile()
  con <- file(tf, open = "wt")
  sink(con)
  ok <- tryCatch({
    withCallingHandlers(
      force(expr),
      message = function(m) {
        cat(conditionMessage(m), file = con, sep = "")
        invokeRestart("muffleMessage")
      },
      warning = function(w) {
        if (!deferred) {
          cl <- conditionCall(w)
          cat(if (is.null(cl)) "Warning: " else
                paste0("Warning in ", deparse(cl)[1L], " : "),
              conditionMessage(w), "\n", file = con, sep = "")
        }
        invokeRestart("muffleWarning")
      })
    TRUE
  }, error = function(e) FALSE,
  finally = { sink(); close(con); options(op) })
  res <- readLines(tf, warn = FALSE)
  unlink(tf)
  if (!ok) return("[error]")
  gsub("\033\\[[0-9;]*[A-Za-z]", "", res)
}

# tail_blanks(): how many blank lines end a capture. dbl_blanks(): how many
# times two blank lines run together BEFORE that closing run.
tail_blanks <- function(ln) {
  n <- 0L
  i <- length(ln)
  while (i > 0L && !nzchar(trimws(ln[i]))) { n <- n + 1L; i <- i - 1L }
  n
}
dbl_blanks <- function(ln) {
  i <- length(ln)
  while (i > 0L && !nzchar(trimws(ln[i]))) i <- i - 1L
  if (i < 2L) return(0L)
  b <- !nzchar(trimws(ln[seq_len(i)]))
  sum(b[-1L] & b[-length(b)])
}

# one_blank(): run each call under each output level and each id mode the
# call accepts, both streams captured, and name every run that does not end
# on EXACTLY ONE blank line, that prints two blank lines together, or whose
# legend block is not set off by one blank line. Each
# call is a string with one %s where further arguments go. A call form the
# function refuses (jcorr takes no value.id) is skipped; a run that stops
# for any other reason is named. character(0) means every run passed; the
# number of runs made rides along as attribute "n".
one_blank <- function(calls,
                      modes  = c("", ", variable.id = \"legend\"",
                                 ", variable.id = \"legend.bottom\"",
                                 ", value.id = \"legend\"",
                                 ", variable.id = \"labels\"",
                                 ", variable.id = \"legend\", value.id = \"legend\""),
                      levels = c("minimal", "standard", "full")) {
  bad <- character(0)
  n   <- 0L
  on.exit(quiet(joutput(NULL)), add = TRUE)
  for (cl in calls) for (md in modes) for (lv in levels) {
    # The minimal level is run in the plain form only: it differs from
    # standard in the Case Processing block, not in how an output ends.
    if (identical(lv, "minimal") && nzchar(md)) next
    txt <- sprintf(cl, md)
    quiet(joutput(lv))
    o <- both_out(eval(parse(text = txt), envir = globalenv()))
    if (identical(o, "[error]")) {
      # A refused call form: say nothing. Anything else that stops is a
      # finding, and the plain form of every call must run.
      if (!nzchar(md)) bad <- c(bad, paste0("[stopped] ", lv, ": ", txt))
      next
    }
    n <- n + 1L
    if (tail_blanks(o) != 1L) {
      bad <- c(bad, paste0("[ends on ", tail_blanks(o), "] ", lv, ": ", txt))
    }
    if (dbl_blanks(o) > 0L) {
      bad <- c(bad, paste0("[two blank lines together] ", lv, ": ", txt))
    }
    # A legend block is set off by ONE blank line: the line above its
    # heading is blank and the line above that is not.
    lg <- which(o %in% c("Variable Labels:", "Value Labels:", "Outcome:"))
    lg <- lg[lg > 2L]
    if (any(nzchar(o[lg - 1L]) | !nzchar(o[lg - 2L]))) {
      bad <- c(bad, paste0("[legend not set off by one blank line] ", lv,
                           ": ", txt))
    }
  }
  attr(bad, "n") <- n
  bad
}

# ok_runs(): a one_blank() result that found nothing AND made at least `at
# least` runs -- so a helper that skipped everything cannot pass.
ok_runs <- function(bad, at_least) {
  if (length(bad) > 0L) {
    cat(paste0("        ", utils::head(bad, 6L)), sep = "\n")
  }
  length(bad) == 0L && isTRUE(attr(bad, "n") >= at_least)
}

# --- Fixtures ----------------------------------------------------------------

# Three groups of four, equal sizes and equal variances. Means 16, 15, 14;
# within-group SD 1.633; SS 8 / 24 / 32; Levene F 0; Welch df 6.0.
f_aov <- data.frame(g = rep(c("a", "b", "c"), each = 4),
                    y = c(14, 16, 18, 16,  13, 15, 17, 15,  12, 14, 16, 14),
                    stringsAsFactors = FALSE)
f_t2  <- f_aov[f_aov$g != "c", ]                 # the first two groups, for jt

# A paired design of three pairs: post - pre differences -1, -2, -3, so the
# mean difference is -2 and dz exactly -2 (SD 1).
f_pair <- data.frame(time  = rep(c("pre", "post"), each = 3),
                     score = c(10, 12, 14,  9, 10, 11),
                     stringsAsFactors = FALSE)

# Orthogonal four-level predictors (VIF exactly 1). yb has 12 ones in 48,
# balanced over x1 and over x2, so both slopes are 0 and every case is
# predicted 0; y is x1 + x2 plus a pattern orthogonal to both.
f_log <- data.frame(x1 = rep(c(-3, -1, 1, 3), 12),
                    x2 = rep(rep(c(-3, -1, 1, 3), each = 4), 3))
f_log$yb <- 0
f_log$yb[c(1, 6, 11, 16, 17, 22, 27, 32, 33, 38, 43, 48)] <- 1
f_log$y  <- f_log$x1 + f_log$x2 + rep(c(0.5, -0.5, -0.5, 0.5), 12)

# Two items: means 3, SDs 2, r = 0.75 (alpha 0.857).
f_a2 <- data.frame(i1 = c(1, 1, 3, 5, 5), i2 = c(1, 3, 1, 5, 5))
# Three items: means 3; Alpha if Item Deleted 0.5, 0.5, 0.4.
f_a3 <- data.frame(i1 = c(3, 3, 2, 2, 3, 5), i2 = c(1, 1, 2, 5, 4, 5),
                   i3 = c(4, 1, 3, 3, 3, 4))

# S327. Three groups of four with means 2.5, 3.0 and 102.5: one Tukey p is
# .850 and two are <.001, so the adjusted-p column holds two widths.
f_far <- data.frame(g = rep(c("a", "b", "c"), each = 4),
                    y = c(1, 2, 3, 4,  1.5, 2.5, 3.5, 4.5,  101, 102, 103, 104),
                    stringsAsFactors = FALSE)

# S327. Two predictors correlated at sqrt(15/16): e is orthogonal to x1 and
# to the constant with x1's sum of squares, so cor(x1, x2) is r exactly and
# each VIF is 1 / (1 - r^2) = 16 -- its square root, the standard-error
# inflation, 4. x3 is orthogonal to both, so its VIF is 1: the VIF column
# then holds two widths (16.000 over 1.000). y and yb are outcomes for jlm
# and jlogistic.
f_vif <- local({
  x1 <- rep(c(-3, -1, 1, 3), 6)
  e  <- rep(c(1, -1, -1, 1), 6) * sqrt(5)
  r  <- sqrt(15 / 16)
  x2 <- r * x1 + sqrt(1 - r^2) * e
  x3 <- rep(c(1, 1, 1, 1, -1, -1, -1, -1), 3)
  data.frame(x1 = x1, x2 = x2, x3 = x3,
             y  = x1 + x2 + x3 + rep(c(0.5, -0.5, -0.5, 0.5, -1, 1), 4),
             yb = rep(c(0, 1, 1, 0, 1, 0, 0, 1), 3))
})

# S327. Three items on different scales, one of them negative: means 3, 300
# and -3, so the Item Statistics and Item-Total columns hold values of
# different widths (a mixed-width column is what tells "bc" from "c").
# S328: the second item times ten (its mean was 30). Under the S328 lean a
# value ONE character narrower, in a column with no spare space, lands in
# the same place centered as right-justified; 3.000 under 300.000 is two.
f_mix <- data.frame(i1 = c(3, 3, 2, 2, 3, 5),
                    i2 = c(100, 100, 200, 500, 400, 500),
                    i3 = c(-4, -1, -3, -3, -3, -4))

# S327. 2 x 2 tables by cell count (row 1: a, b; row 2: c, d). The smallest
# expected count is 31 * 16 / 100 = 4.96; 51 * 98 / 1000 = 4.998; 10 * 30 /
# 100 = 3 exactly; and 6 * 6 / 30 = 1.2 with three cells under 5.
.mk22 <- function(a, b, c, d) {
  data.frame(r = rep(c(1, 1, 2, 2), c(a, b, c, d)),
             k = rep(c(1, 2, 1, 2), c(a, b, c, d)))
}
f_x496  <- .mk22(6, 25, 10, 59)
f_x4998 <- .mk22(10, 41, 88, 861)
f_x3    <- .mk22(3, 7, 27, 63)
f_xpl   <- .mk22(1, 5, 5, 19)

# S328. A frequency column whose counts and percentages mix widths: 104, 9
# and 7 with five missing -- 83.20 over 7.20, a cumulative 86.67 under
# 100.00.
f_fq <- data.frame(q = c(rep(1, 104), rep(2, 9), rep(3, 7), rep(NA, 5)))

# S328. 2 x 2 tables for the chi-square table's two rows. f_x100: Pearson
# 100.644 over a continuity-corrected 96.590 -- two widths with an ODD spare
# space in the column, which is what separates "bc" from "c" under the S328
# lean (with an even spare, a value one character narrower lands in the same
# place either way). f_xp: Pearson 11.605, p <.001, over 10.110, p .001.
f_x100 <- .mk22(40, 1, 1, 67)
f_xp   <- .mk22(31, 9, 16, 24)

# S328. A 2 x 2 table whose four cells are exactly 100,000 cases each, so
# every count in it is a round number: cells of 100000, margins of 200000.
# as.character() prints those as "1e+05" and "2e+05".
f_100k <- .mk22(100000, 100000, 100000, 100000)

# S329. f_x5: a 2 x 2 whose smallest expected count is EXACTLY 5 (10 * 50 /
# 100) -- not below the threshold, so it prints 5.00 and no note. f_x3rd: a
# 2 x 3 with column totals of 10 each and row totals of 10 and 20, so the
# expected counts are 3.333... and 6.666...: three cells of 3.33 sum to 9.99
# where the row's expected total is 10.
f_x5   <- .mk22(5, 5, 45, 45)
f_x3rd <- data.frame(r = rep(c(1, 2), c(10, 20)),
                     k = c(rep(1:3, c(4, 3, 3)), rep(1:3, c(6, 7, 7))))
# f_x5t: a 2 x 3 of 44 cases whose first row holds 5 and whose column totals
# are 1, 37 and 6. Its three expected counts (5/44, 185/44, 30/44) sum in
# floating point to 5 - 8.9e-16: a row TOTAL just under 5, which the 4.99
# guard -- written for cells -- would print as 4.99 beside an observed 5.
f_x5t  <- data.frame(r = rep(c(1, 2), c(5, 39)),
                     k = c(rep(1:3, c(0, 4, 1)), rep(1:3, c(1, 33, 5))))

# S328. Min and Max. x is measured to a tenth and its maximum is a whole
# number (10); w is whole numbers of three widths, large enough that its
# Mean and SD (430.000, 714.283) are two characters wider than x's (7.125,
# 2.211); z runs to three places and is negative at its minimum; h moves in
# halves and BOTH its minimum and its maximum are whole (1 and 4), so only
# the data, not the two values printed, say it has a decimal place.
f_mm <- data.frame(x = c(4.8, 7.5, 10, 6.2), w = c(30, 120, 1500, 70),
                   z = c(0.125, 2.5, 3.375, -1.25), h = c(1, 2.5, 3.5, 4))

# S328. A variable that moves in halves, every group minimum and maximum a
# whole number (4 and 5; 6 and 7), and one case with no group whose value
# runs to two places (2.25): the grouped table must show one place -- the
# precision of the cases it describes.
f_gm <- data.frame(g = c("a", "a", "a", "b", "b", "b", NA),
                   y = c(4, 4.5, 5, 6, 6.5, 7, 2.25), stringsAsFactors = FALSE)

# S328. Coefficient tables whose columns mix widths by TWO characters, which
# is what separates "bc" from "c" under the S328 lean. f_big: an intercept of
# 110 beside slopes of 0.545 and 11.682, with confidence bounds to match.
# f_or: a strong predictor, so one upper bound on the odds ratio is 117.535
# beside 5.330 and 1.555.
f_big <- data.frame(x1 = rep(c(-3, -1, 1, 3), 6),
                    x2 = rep(c(1, 1, -1, -1, 1, -1), 4))
f_big$y <- 110 + 0.5 * f_big$x1 + 12 * f_big$x2 +
  rep(c(0.5, -0.5, -0.5, 0.5, -1, 1), 4)
f_or <- data.frame(x1 = rep(c(-3, -1, 1, 3), 12),
                   x2 = rep(rep(c(-3, -1, 1, 3), each = 4), 3))
f_or$yb <- as.integer(f_or$x1 > 0)
f_or$yb[c(6, 43)] <- 1L - f_or$yb[c(6, 43)]

# S328. A VIF of exactly 100 beside a VIF of 1 (the f_vif construction at
# r = sqrt(99 / 100)): 100.000 over 1.000 is TWO characters apart, which the
# S328 lean needs to tell "bc" from "c" -- f_vif's 16.000 over 1.000, one
# character apart in a column with no spare space, lands in the same place
# either way.
f_v100 <- local({
  x1 <- rep(c(-3, -1, 1, 3), 6)
  e  <- rep(c(1, -1, -1, 1), 6) * sqrt(5)
  r  <- sqrt(99 / 100)
  x2 <- r * x1 + sqrt(1 - r^2) * e
  x3 <- rep(c(1, 1, 1, 1, -1, -1, -1, -1), 3)
  data.frame(x1 = x1, x2 = x2, x3 = x3,
             y  = x1 + x2 + x3 + rep(c(0.5, -0.5, -0.5, 0.5, -1, 1), 4),
             yb = rep(c(0, 1, 1, 0, 1, 0, 0, 1), 3))
})

# S328. A thousand rows with 100 outliers in one variable (a hundred values
# at +/-50 among nine hundred zeros) and five in another: an Outliers
# column holding 100 over 5.
f_out <- data.frame(a = c(rep(0, 900), rep(c(-50, 50), 50)),
                    b = c(rep(c(1, 2, 3, 4, 5), 199), rep(1000, 5)),
                    c = rep(1:10, 100))

# S328. 100,002 cases and one predictor, so the model has exactly 100,000
# residual degrees of freedom -- the number cat() abbreviates to "1e+05".
f_df <- data.frame(x = rep(c(-1, 1), 50001),
                   y = rep(c(0, 1, 1, 0, 2, 3), 16667))

# The shipped datasets, for the calls named in the S326 discussion.
invisible(quiet(jload("community", name = "cm_f", package = TRUE,
                      overwrite = TRUE, quiet = TRUE)))
invisible(quiet(jload("clinic", name = "cl_f", package = TRUE,
                      overwrite = TRUE, quiet = TRUE)))

# =============================================================================
# A. THE FORMATTER AND THE RENDERER
# =============================================================================
cat("\n--- A. .jst_make_fmt(), .jst_fmt_stat(), .jst_print_table(digits =) ---\n")

check("A01 .jst_make_fmt(3): padded, NA blank, a negative zero unsigned",
      identical(jstats:::.jst_make_fmt(3)(c(0.1, 12, NA, round(-0.0004, 3))),
                c("0.100", "12.000", "", "0.000")))
check("A02 .jst_make_fmt(0): whole numbers, no decimal point, -0.3 prints 0",
      identical(jstats:::.jst_make_fmt(0)(c(16.4, -0.3)), c("16", "0")))
check("A03 .jst_fmt_stat(): rounded, then padded (0.100, 0.000, -0.230, 0.250; 0.10 at two)",
      identical(vapply(c(0.099912, 0.000187, -0.230116, 0.25),
                       jstats:::.jst_fmt_stat, character(1), digits = 3L),
                c("0.100", "0.000", "-0.230", "0.250")) &&
        identical(jstats:::.jst_fmt_stat(0.099912, 2L), "0.10"))
check("A04 .jst_fmt_stat(): a non-finite value prints as R prints it, never blank",
      identical(jstats:::.jst_fmt_stat(NaN, 3L), "NaN") &&
        identical(jstats:::.jst_fmt_stat(Inf, 3L), "Inf"))

.a_df <- data.frame(Name = c("p", "q"), N = c(4, 4), Mean = c(16, 15.5),
                    x = c(1.5, 2), stringsAsFactors = FALSE)
check("A05 renderer: a named column prints to its digits; an unnamed one keeps the detection",
      { m <- tab(out(jstats:::.jst_print_table(.a_df, row.names = FALSE,
                                                digits = c(Mean = 3L))),
                 hdr = "Name")
        same(col_of(m, "Mean"), c("16.000", "15.500")) &&
          same(col_of(m, "x"), c("1.5", "2.0")) &&
          same(col_of(m, "N"), c("4", "4")) })
check("A06 renderer: digits = NULL prints exactly what the call without it prints",
      identical(raw_out(jstats:::.jst_print_table(.a_df, row.names = FALSE,
                                                   digits = NULL)),
                raw_out(jstats:::.jst_print_table(.a_df, row.names = FALSE))) &&
        same(col_of(tab(out(jstats:::.jst_print_table(.a_df, row.names = FALSE)),
                        hdr = "Name"), "Mean"), c("16.0", "15.5")))
check("A07 renderer: a digits name that matches no column stops, naming it",
      { o <- raw_out(jstats:::.jst_print_table(.a_df, row.names = FALSE,
                                                digits = c(Maen = 3L)))
        any(grepl("every digits entry must name a column of df", o)) &&
          any(grepl("Maen", o)) })
check("A08 renderer: a digits entry naming a text column is ignored",
      same(col_of(tab(out(jstats:::.jst_print_table(.a_df, row.names = FALSE,
                                                     digits = c(Name = 3L))),
                      hdr = "Name"), "Name"), c("p", "q")))
check("A09 renderer: a fixed column prints a negative zero unsigned",
      same(col_of(tab(out(jstats:::.jst_print_table(
                    data.frame(k = c("a", "b"), v = c(round(-0.0004, 3), 1.25),
                               stringsAsFactors = FALSE),
                    row.names = FALSE, digits = c(v = 3L))), hdr = "k"), "v"),
           c("0.000", "1.250")))

# =============================================================================
# B. jaov
# =============================================================================
cat("\n--- B. jaov() ---\n")

.b_full  <- raw_out(jaov(y ~ g, data = f_aov, full = TRUE, diagnostics = TRUE))
.b_welch <- raw_out(jaov(y ~ g, data = f_aov, welch = TRUE, full = TRUE, diagnostics = TRUE))
.b_fl    <- sub("[ \t]+$", "", .b_full)
.b_wl    <- sub("[ \t]+$", "", .b_welch)

check("B01 the eta-squared line pads (0.250) and ends with no space",
      any(.b_full == "Eta-squared: 0.250"))
check("B02 eta-squared 0.09991 prints 0.100 (clinic ScreenTime ~ SoughtHelp)",
      any(out(jaov(ScreenTime ~ SoughtHelp, data = cl_f, effect.size = TRUE)) ==
            "Eta-squared: 0.100"))
check("B03 eta-squared 0.000187 prints 0.000, not 0 (clinic SocialSupport ~ PriorTherapy)",
      any(out(jaov(SocialSupport ~ PriorTherapy, data = cl_f,
                   effect.size = TRUE)) == "Eta-squared: 0.000"))
check("B04 the Welch form's eta-squared line pads and ends with no space",
      any(.b_welch == "Eta-squared: 0.250"))
check("B05 ANOVA table: Sum of Squares 8.000 / 24.000 / 32.000, F 1.500",
      { m <- tab(.b_fl, "ANOVA: y by g")
        same(col_of(m, "Sum of Squares"), c("8.000", "24.000", "32.000")) &&
          same(col_of(m, "F"), c("1.500", "", "")) })
check("B06 a one-df effect's SS and MS read alike: 1193.850 and 1193.850; MS 124.530 (community Age ~ Volunteer)",
      { m <- tab(out(jaov(Age ~ Volunteer, data = cm_f)), "ANOVA: Age by Volunteer")
        same(col_of(m, "Sum of Squares"), c("1193.850", "12577.568", "13771.417")) &&
          same(col_of(m, "Mean Square"), c("1193.850", "124.530", "")) })
check("B07 ANOVA df stays whole (2, 9, 11)",
      same(col_of(tab(.b_fl, "ANOVA: y by g"), "df"), c("2", "9", "11")))
check("B08 Group Descriptives: Mean 16.000 / 15.000 / 14.000, SD and both CI bounds to three places",
      { m <- tab(.b_fl, "Group Descriptives: y by g")
        same(col_of(m, "Mean"), c("16.000", "15.000", "14.000")) &&
          same(col_of(m, "SD"), rep("1.633", 3)) &&
          same(col_of(m, "95% CI Lower"), c("13.402", "12.402", "11.402")) &&
          same(col_of(m, "95% CI Upper"), c("18.598", "17.598", "16.598")) })
check("B09 Levene's F 0.000; its df whole",
      { m <- tab(.b_fl, "Levene's Test for Homogeneity of Variance")
        same(col_of(m, "F"), "0.000") && same(col_of(m, "df1"), "2") &&
          same(col_of(m, "df2"), "9") })
check("B10 Welch's ANOVA: F 1.350, df1 2, df2 6.0 (one place, padded)",
      { m <- tab(.b_wl, "Welch's ANOVA: y by g")
        same(col_of(m, "F"), "1.350") && same(col_of(m, "df1"), "2") &&
          same(col_of(m, "df2"), "6.0") })
check("B11 Tukey: Mean Difference -1.000 / -2.000 / -1.000",
      same(col_of(tab(.b_fl, "Tukey HSD Post-Hoc Comparisons"), "Mean Difference"),
           c("-1.000", "-2.000", "-1.000")))
check("B12 digits = 2: eta 0.25, SS 8.00, Mean 16.00, Tukey -1.00",
      { o <- out(jaov(y ~ g, data = f_aov, full = TRUE, diagnostics = TRUE, digits = 2))
        any(o == "Eta-squared: 0.25") &&
          same(col_of(tab(o, "ANOVA: y by g"), "Sum of Squares"),
               c("8.00", "24.00", "32.00")) &&
          same(col_of(tab(o, "Group Descriptives: y by g"), "Mean"),
               c("16.00", "15.00", "14.00")) &&
          same(col_of(tab(o, "Tukey HSD Post-Hoc Comparisons"), "Mean Difference"),
               c("-1.00", "-2.00", "-1.00")) })
check("B13 digits = 0: whole numbers with no decimal point (SS 8, Mean 16, eta 0)",
      { o <- out(jaov(y ~ g, data = f_aov, full = TRUE, diagnostics = TRUE, digits = 0))
        any(o == "Eta-squared: 0") &&
          same(col_of(tab(o, "ANOVA: y by g"), "Sum of Squares"), c("8", "24", "32")) &&
          same(col_of(tab(o, "Group Descriptives: y by g"), "Mean"), c("16", "15", "14")) })
check("B14 ci = FALSE: the Group Descriptives table without the CI columns pads too",
      { m <- tab(out(jaov(y ~ g, data = f_aov, ci = FALSE)), "Group Descriptives: y by g")
        same(col_of(m, "Mean"), c("16.000", "15.000", "14.000")) &&
          is.null(col_of(m, "95% CI Lower")) })
check("B15 display only: the returned descriptives stay numeric and eta_squared keeps full precision",
      { r <- quiet(jaov(Age ~ Volunteer, data = cm_f))
        !is.null(r) && is.numeric(r$descriptives$Mean) &&
          isTRUE(all.equal(r$descriptives$Mean, c(37.407, 44.224))) &&
          isTRUE(all.equal(r$eta_squared, 1193.8495 / 13771.417, tolerance = 1e-5)) &&
          r$eta_squared != round(r$eta_squared, 3) })

# =============================================================================
# C. jt
# =============================================================================
cat("\n--- C. jt() ---\n")

.c_st <- out(jt(y ~ g, data = f_t2, full = TRUE, diagnostics = TRUE))
.c_we <- out(jt(y ~ g, data = f_t2, welch = TRUE, full = TRUE, diagnostics = TRUE))
.c_pa <- out(jt(score ~ time, data = f_pair, paired = TRUE, full = TRUE, diagnostics = TRUE))

check("C01 Cohen's d -0.230116 prints -0.230, not -0.23 (community CommuteTime ~ Volunteer)",
      any(raw_out(jt(CommuteTime ~ Volunteer, data = cm_f, effect.size = TRUE)) ==
            "Cohen's d: -0.230"))
check("C02 t -0.76 prints -0.760 (clinic ScreenTime ~ PriorTherapy)",
      same(col_of(tab(out(jt(ScreenTime ~ PriorTherapy, data = cl_f)),
                      "Independent Samples T-Test Results (equal variances assumed)"),
                  "t"), "-0.760"))
check("C03 a CI bound 3.67 prints 3.670 (community WellbeingScore ~ Smoker, ci = TRUE)",
      same(col_of(tab(out(jt(WellbeingScore ~ Smoker, data = cm_f, ci = TRUE)),
                      "Independent Samples T-Test Results (equal variances assumed)"),
                  "95% CI Upper"), "3.670"))
check("C04 Student's df stays whole (6); Welch's keeps one place, padded (6.0)",
      same(col_of(tab(.c_st, "Independent Samples T-Test Results (equal variances assumed)"),
                  "df"), "6") &&
        same(col_of(tab(.c_we, "Welch's T-Test Results (equal variances not assumed)"),
                    "df"), "6.0"))
check("C05 Mean Difference 1.000 in both forms",
      same(col_of(tab(.c_st, "Independent Samples T-Test Results (equal variances assumed)"),
                  "Mean Difference"), "1.000") &&
        same(col_of(tab(.c_we, "Welch's T-Test Results (equal variances not assumed)"),
                    "Mean Difference"), "1.000"))
check("C06 Group Descriptives: Mean 16.000 / 15.000",
      same(col_of(tab(.c_st, "Group Descriptives: y by g"), "Mean"),
           c("16.000", "15.000")))
check("C07 Levene's F: 0.000 on the fixture, 0.020 on community Income ~ Volunteer",
      same(col_of(tab(.c_st, "Levene's Test for Homogeneity of Variance"), "F"),
           "0.000") &&
        same(col_of(tab(out(jt(Income ~ Volunteer, data = cm_f, diagnostics = TRUE)),
                        "Levene's Test for Homogeneity of Variance"), "F"), "0.020"))
check("C08 paired: Mean Difference -2.000, df 2, means 10.000 / 12.000",
      { m <- tab(.c_pa, "Paired Samples T-Test Results")
        same(col_of(m, "Mean Difference"), "-2.000") && same(col_of(m, "df"), "2") &&
          same(col_of(tab(.c_pa, "Group Descriptives: score by time"), "Mean"),
               c("10.000", "12.000")) })
check("C09 the Cohen's dz line pads too: -2.000, not -2",
      any(raw_out(jt(score ~ time, data = f_pair, paired = TRUE,
                     effect.size = TRUE)) == "Cohen's dz (paired): -2.000"))

# =============================================================================
# D. jlogistic
# =============================================================================
cat("\n--- D. jlogistic() ---\n")

.d_fl <- out(jlogistic(yb ~ x1 + x2, data = f_log, classification = TRUE,
                       diagnostics = TRUE))

check("D01 Model Summary: -2 Log Likelihood 141.170 and AIC 145.170 (community Volunteer ~ CommuteTime)",
      { m <- tab(out(jlogistic(Volunteer ~ CommuteTime, data = cm_f)), "Model Summary")
        same(col_of(m, "-2 Log Likelihood"), "141.170") &&
          same(col_of(m, "AIC"), "145.170") })
check("D02 Omnibus Chi-Square 10.280 (community Volunteer ~ Age + CommuteTime)",
      same(col_of(tab(out(jlogistic(Volunteer ~ Age + CommuteTime, data = cm_f)),
                      "Omnibus Test of Model Coefficients"), "Chi-Square"), "10.280"))
check("D03 Nagelkerke R-squared 0.100 (community Volunteer ~ Age + Smoker)",
      same(col_of(tab(out(jlogistic(Volunteer ~ Age + Smoker, data = cm_f)),
                      "Model Summary"), "Nagelkerke R\u00b2"), "0.100"))
check("D04 a null fit: Chi-Square, Cox & Snell and Nagelkerke all 0.000, unsigned",
      same(col_of(tab(.d_fl, "Omnibus Test of Model Coefficients"), "Chi-Square"),
           "0.000") &&
        same(col_of(tab(.d_fl, "Model Summary"), "Cox & Snell R\u00b2"), "0.000") &&
        same(col_of(tab(.d_fl, "Model Summary"), "Nagelkerke R\u00b2"), "0.000"))
check("D05 % Correct keeps one place: 100.0 / 0.0 / 75.0",
      same(col_of(tab(.d_fl, "Classification Table (cutoff = 0.50)"), "% Correct"),
           c("100.0", "0.0", "75.0")))
check("D06 VIF keeps three places: 1.000 / 1.000",
      same(col_of(tab(.d_fl, "VIF (Variance Inflation Factors)"), "VIF"),
           c("1.000", "1.000")))

# =============================================================================
# E. jlm
# =============================================================================
cat("\n--- E. jlm() ---\n")

check("E01 VIF keeps three places: 1.000 / 1.000",
      same(col_of(tab(out(jlm(y ~ x1 + x2, data = f_log, diagnostics = "vif")),
                      "VIF (Variance Inflation Factors)"), "VIF"),
           c("1.000", "1.000")))

# =============================================================================
# F. jalpha
# =============================================================================
cat("\n--- F. jalpha() ---\n")

.f_a2 <- out(jalpha(f_a2, i1, i2))
.f_a3 <- out(jalpha(f_a3, i1, i2, i3))

check("F01 Cronbach's alpha 0.57 prints 0.570 (community Environment1, Environment5)",
      same(col_of(tab(out(jalpha(cm_f, Environment1, Environment5)),
                      "Reliability Statistics"), "Cronbach's Alpha"), "0.570"))
check("F02 Item Statistics: Mean 3.000, SD 2.000",
      { m <- tab(.f_a2, "Item Statistics")
        same(col_of(m, "Mean"), c("3.000", "3.000")) &&
          same(col_of(m, "SD"), c("2.000", "2.000")) })
check("F03 Item-Total: Corrected Item-Total r 0.750",
      same(col_of(tab(.f_a2, "Item-Total Statistics"), "Corrected Item-Total r"),
           c("0.750", "0.750")))
check("F04 Item-Total: Alpha if Item Deleted 0.500 / 0.500 / 0.400",
      same(col_of(tab(.f_a3, "Item-Total Statistics"), "Alpha if Item Deleted"),
           c("0.500", "0.500", "0.400")))
check("F05 the counts stay whole (N of Items 2; N 5)",
      same(col_of(tab(.f_a2, "Reliability Statistics"), "N of Items"), "2") &&
        same(col_of(tab(.f_a2, "Item Statistics"), "N"), c("5", "5")))

# =============================================================================
# G. jdesc
# =============================================================================
cat("\n--- G. jdesc() ---\n")

.g_one <- raw_out(jdesc(cl_f, Flourishing))
.g_grp <- raw_out(jdesc(f_aov, y, by = g))

check("G01 Mean 49.6 prints 49.600 beside SD 13.865 (clinic Flourishing)",
      { m <- tab(sub("[ \t]+$", "", .g_one), hdr = "Variable")
        same(col_of(m, "Mean"), "49.600") && same(col_of(m, "SD"), "13.865") })
check("G02 Min and Max keep the data's precision: 0 and 75, not 0.000 and 75.000",
      { m <- tab(sub("[ \t]+$", "", .g_one), hdr = "Variable")
        same(col_of(m, "Min"), "0") && same(col_of(m, "Max"), "75") })
check("G03 grouped: Mean 16.000 / 15.000 / 14.000; Min and Max whole",
      { m <- tab(sub("[ \t]+$", "", .g_grp), hdr = "g  ")
        same(col_of(m, "Mean"), c("16.000", "15.000", "14.000")) &&
          same(col_of(m, "Min"), c("14", "13", "12")) &&
          same(col_of(m, "Max"), c("18", "17", "16")) })
check("G04 both jdesc tables still end every line without padding (trim = TRUE kept)",
      !any(grepl(" $", .g_one)) && !any(grepl(" $", .g_grp)))

# =============================================================================
# H. jscreen(stats =)
# =============================================================================
cat("\n--- H. jscreen() ---\n")

check("H01 stats = TRUE: Mean and Median 15.000; Unique Values whole",
      { m <- tab(out(jscreen(f_aov, stats = TRUE)), "Variable Types")
        same(col_of(m, "Mean"), c("", "15.000")) &&
          same(col_of(m, "Median"), c("", "15.000")) &&
          same(col_of(m, "Unique Values"), c("3", "7")) })
check("H02 stats = \"median\": the Median column alone, padded -- no stop for the absent Mean",
      { m <- tab(out(jscreen(f_aov, stats = "median")), "Variable Types")
        same(col_of(m, "Median"), c("", "15.000")) && is.null(col_of(m, "Mean")) })
check("H03 stats = FALSE (the default): no statistics columns, and the table prints",
      { m <- tab(out(jscreen(f_aov)), "Variable Types")
        !is.null(m) && is.null(col_of(m, "Mean")) && is.null(col_of(m, "Median")) })

# =============================================================================
# I. CONTROLS -- what the rule leaves alone
# =============================================================================
cat("\n--- I. controls ---\n")

check("I01 p-values keep their own form (.274; 1.000 for p = 1)",
      same(col_of(tab(.b_fl, "ANOVA: y by g"), "p"), c(".274", "", "")) &&
        same(col_of(tab(.b_fl, "Levene's Test for Homogeneity of Variance"), "p"),
             "1.000"))
check("I02 N columns stay whole (4 / 4 / 4)",
      same(col_of(tab(.b_fl, "Group Descriptives: y by g"), "N"), c("4", "4", "4")))

# =============================================================================
# J. ALIGNMENT -- the 17 statistics tables, block-centered and trimmed (S327)
# =============================================================================
# Through v0.9.202 these tables passed no align, so the renderer's default
# applied: a numeric column right-justified, header included, and a text
# column -- every p column -- left-justified. In the ANOVA table F sat flush
# right beside a flush-left p, and a p column of several rows fell out of
# line (.976 over 1.000). Each call site now names its columns: the label
# column "l", every other column "bc", with trim = TRUE. J01-J19 take the 19
# call sites one at a time; J20-J26 pin the forms a person judged; J27-J30
# read columns whose values differ in width.
cat("\n--- J. alignment ---\n")

.j_tst <- raw_out(jt(y ~ g, data = f_t2, full = TRUE, diagnostics = TRUE))
.j_tnc <- raw_out(jt(y ~ g, data = f_t2, ci = FALSE))
.j_anc <- raw_out(jaov(y ~ g, data = f_aov, ci = FALSE))
.j_lgs <- raw_out(jlogistic(yb ~ x1 + x2, data = f_log, classification = TRUE,
                            diagnostics = TRUE))
.j_lm  <- raw_out(jlm(y ~ x1 + x2, data = f_log, diagnostics = "vif"))
.j_al  <- raw_out(jalpha(cm_f, Environment1, Environment5))
.j_a3  <- raw_out(jalpha(f_a3, i1, i2, i3))
.j_scr <- raw_out(jscreen(f_aov, stats = TRUE))
.j_cl  <- raw_out(jaov(Stress ~ Condition, data = cl_f, full = TRUE, diagnostics = TRUE))
.j_far <- raw_out(jaov(y ~ g, data = f_far, posthoc = TRUE))
.j_d0  <- raw_out(jaov(y ~ g, data = f_aov, digits = 0))

check("J01 jt, Levene's table: every column block-centered, no line ending in a space",
      aligned(.j_tst, "Levene's Test for Homogeneity of Variance"))
check("J02 jt, Group Descriptives: Group flush left; N, Mean and SD block-centered",
      aligned(.j_tst, "Group Descriptives: y by g", left = "Group"))
check("J03 jt, the test table with its CI columns: all six block-centered",
      { cap <- "Independent Samples T-Test Results (equal variances assumed)"
        m <- cells(.j_tst, cap)
        !is.null(m) && ncol(m) == 6L && aligned(.j_tst, cap) })
check("J04 jt, the test table without them (ci = FALSE): all four block-centered",
      { cap <- "Independent Samples T-Test Results (equal variances assumed)"
        m <- cells(.j_tnc, cap)
        !is.null(m) && ncol(m) == 4L && aligned(.j_tnc, cap) })
check("J05 jaov, Levene's table",
      aligned(.b_full, "Levene's Test for Homogeneity of Variance"))
check("J06 jaov, Group Descriptives with the CI columns: Group flush left, five columns block-centered",
      { m <- cells(.b_full, "Group Descriptives: y by g")
        !is.null(m) && ncol(m) == 6L &&
          aligned(.b_full, "Group Descriptives: y by g", left = "Group") })
check("J07 jaov, Group Descriptives without them (ci = FALSE)",
      { m <- cells(.j_anc, "Group Descriptives: y by g")
        !is.null(m) && ncol(m) == 4L &&
          aligned(.j_anc, "Group Descriptives: y by g", left = "Group") })
check("J08 jaov, Welch's table",
      aligned(.b_welch, "Welch's ANOVA: y by g"))
check("J09 jaov, the ANOVA table: Source flush left; df, the statistics and p block-centered",
      aligned(.b_full, "ANOVA: y by g", left = "Source"))
check("J10 jaov, the Tukey table: Comparison flush left, the rest block-centered",
      aligned(.b_full, "Tukey HSD Post-Hoc Comparisons", left = "Comparison"))
check("J11 jlm, the VIF table: Variable flush left, VIF block-centered",
      aligned(.j_lm, "VIF (Variance Inflation Factors)", left = "Variable"))
check("J12 jlogistic, the Omnibus table",
      aligned(.j_lgs, "Omnibus Test of Model Coefficients"))
check("J13 jlogistic, Model Summary",
      aligned(.j_lgs, "Model Summary"))
check("J14 jlogistic, the Classification table: Observed flush left",
      aligned(.j_lgs, "Classification Table (cutoff = 0.50)", left = "Observed"))
check("J15 jlogistic, the VIF table",
      aligned(.j_lgs, "VIF (Variance Inflation Factors)", left = "Variable"))
check("J16 jalpha, Reliability Statistics",
      aligned(.j_al, "Reliability Statistics"))
check("J17 jalpha, Item Statistics: Item flush left",
      aligned(.j_al, "Item Statistics", left = "Item"))
check("J18 jalpha, Item-Total Statistics: with every Alpha if Item Deleted shown, and with none (two items)",
      aligned(.j_a3, "Item-Total Statistics", left = "Item") &&
        aligned(.j_al, "Item-Total Statistics", left = "Item"))
check("J19 jscreen, Variable Types: the text columns flush left; Unique Values, Mean and Median block-centered",
      aligned(.j_scr, "Variable Types",
              left = c("Variable", "jstats Class", "Sub-class")) &&
        aligned(raw_out(jscreen(f_aov)), "Variable Types",
                left = c("Variable", "jstats Class", "Sub-class")) &&
        aligned(raw_out(jscreen(f_aov, r.type = TRUE, stats = "median")),
                "Variable Types",
                left = c("Variable", "Base R Type", "jstats Class", "Sub-class")))

check("J20 the ANOVA table on clinic, pinned whole: F and p under centered headers, Sum of Squares over its values",
      identical(run_at(.j_cl, "ANOVA: Stress by Condition", 6L),
                c("ANOVA: Stress by Condition",
                  "Source     df  Sum of Squares  Mean Square    F      p",
                  "---------  --  --------------  -----------  -----  ----",
                  "Condition   3       33.904        11.301    0.199  .897",
                  "Residual   62     3527.914        56.902",
                  "Total      65     3561.818")))
check("J21 a p column of two widths lines up on the decimal point: 1.000 among .976 ... .914 (clinic Tukey)",
      { m <- cells(.j_cl, "Tukey HSD Post-Hoc Comparisons")
        p <- if (is.null(m)) NULL else unname(m[-1L, "p (adjusted)"])
        identical(trimws(p), c(".976", ".998", ".960", ".944", "1.000", ".914")) &&
          length(unique(as.integer(regexpr(".", p, fixed = TRUE)))) == 1L })
check("J22 ... and <.001 beside .850: one right edge down the column (f_far Tukey)",
      { m <- cells(.j_far, "Tukey HSD Post-Hoc Comparisons")
        p <- if (is.null(m)) NULL else unname(m[-1L, "p (adjusted)"])
        identical(trimws(p), c(".850", "<.001", "<.001")) &&
          length(unique(nchar(sub(" +$", "", p)))) == 1L &&
          length(unique(as.integer(regexpr(".", p, fixed = TRUE)))) == 1L })
check("J23 the tie rule: with one spare space the value sits RIGHT of center -- a one-digit df under the f of \"df\" (S328; it sat left through v0.9.203)",
      identical(run_at(.j_tst,
                       "Independent Samples T-Test Results (equal variances assumed)",
                       4L)[c(2L, 4L)],
                c("  t    df    p   Mean Difference  95% CI Lower  95% CI Upper",
                  "0.866   6  .420       1.000          -1.825         3.825")))
check("J24 digits = 0: values narrower than every header sit under its middle",
      any(.j_d0 == "Group  N  Mean  SD  95% CI Lower  95% CI Upper") &&
        any(.j_d0 == "a      4   16    2       13            19") &&
        any(.j_d0 == "g          2         8             4       2  .274"))
check("J25 a row with blank cells ends at its last value: ANOVA's Residual and Total, a two-item Item-Total, Classification's Overall",
      any(.b_full == "Residual   9      24.000         2.667") &&
        any(.b_full == "Total     11      32.000") &&
        any(.j_al   == "Environment1           0.408") &&
        any(.j_lgs  == "Overall                                75.0"))
check("J26 values wider than their header: N over 18, F over 7960.200 -- the header centered over a full-width block",
      any(.j_cl  == "Group              N   Mean     SD   95% CI Lower  95% CI Upper") &&
        any(.j_cl  == "1: Control        18  15.667  8.931     11.225        20.108") &&
        any(.j_far == "Source    df  Sum of Squares  Mean Square      F       p") &&
        any(.j_far == "g          2     26534.000     13267.000   7960.200  <.001"))

# J27-J30 -- values of DIFFERENT widths in one column keep one right edge.
# "bc" right-justifies each value in the column's block; centering each cell
# on its own ("c", the form Session 62 retired in the coefficient tables)
# would stagger them. A column whose values share a width cannot tell the two
# apart, and a one-row table never can, so these read the multi-row tables on
# frames built to mix widths.
.j_t2f <- raw_out(jt(y ~ g, data = f_far[f_far$g != "b", ]))
.j_fnc <- raw_out(jaov(y ~ g, data = f_far, ci = FALSE))
.j_vlm <- raw_out(jlm(y ~ x1 + x2 + x3, data = f_vif, diagnostics = "vif"))
.j_vlg <- raw_out(jlogistic(yb ~ x1 + x2 + x3, data = f_vif,
                            classification = TRUE, diagnostics = "vif"))
.j_mix <- raw_out(jalpha(f_mix, i1, i2, i3))
.j_scl <- raw_out(jscreen(cl_f, stats = TRUE))

check("J27 jt and jaov, mixed widths: 2.500 under 102.500, 15.000 under 26534.000, 0.500 under 100.000",
      aligned(.j_t2f, "Group Descriptives: y by g", left = "Group") &&
        aligned(.j_far, "Group Descriptives: y by g", left = "Group") &&
        aligned(.j_fnc, "Group Descriptives: y by g", left = "Group") &&
        aligned(.j_far, "ANOVA: y by g", left = "Source") &&
        aligned(.j_far, "Tukey HSD Post-Hoc Comparisons", left = "Comparison") &&
        same(col_of(tab(.j_far, "Tukey HSD Post-Hoc Comparisons"), "Mean Difference"),
             c("0.500", "100.000", "99.500")))
check("J28 the VIF tables, mixed widths: 1.000 under 16.000 in jlm and jlogistic; a classification table's 0.0 under 100.0",
      aligned(.j_vlm, "VIF (Variance Inflation Factors)", left = "Variable") &&
        aligned(.j_vlg, "VIF (Variance Inflation Factors)", left = "Variable") &&
        same(col_of(tab(.j_vlm, "VIF (Variance Inflation Factors)"), "VIF"),
             c("16.000", "16.000", "1.000")) &&
        aligned(.j_vlg, "Classification Table (cutoff = 0.50)", left = "Observed"))
check("J29 jalpha, mixed widths: means 3.000, 300.000 and -3.000; a negative item-total r",
      aligned(.j_mix, "Item Statistics", left = "Item") &&
        aligned(.j_mix, "Item-Total Statistics", left = "Item") &&
        same(col_of(tab(.j_mix, "Item Statistics"), "Mean"),
             c("3.000", "300.000", "-3.000")))
.j_v1m <- raw_out(jlm(y ~ x1 + x2 + x3, data = f_v100, diagnostics = "vif"))
.j_v1g <- raw_out(jlogistic(yb ~ x1 + x2 + x3, data = f_v100,
                            diagnostics = "vif"))
check("J28a ... and two characters apart: a VIF of 1.000 under 100.000 on the decimal point (S328)",
      aligned(.j_v1m, "VIF (Variance Inflation Factors)", left = "Variable") &&
        aligned(.j_v1g, "VIF (Variance Inflation Factors)", left = "Variable") &&
        identical(run_at(.j_v1m, "VIF (Variance Inflation Factors)", 6L)[-1L],
                  c("Variable    VIF", "--------  -------", "x1        100.000",
                    "x2        100.000", "x3          1.000")))
# jscreen prints its star legend on the line directly under the table, with
# no blank line between them, so J30 reads the table from the lines without
# it (and says the legend was there to leave out).
.j_sct <- .j_scl[!startsWith(.j_scl, "* coded other than 0/1")]
check("J30 jscreen on clinic, mixed widths: Unique Values 70 over 2; a negative Mean; rows with no Mean or Median",
      length(.j_sct) == length(.j_scl) - 1L &&
        aligned(.j_sct, "Variable Types",
                left = c("Variable", "jstats Class", "Sub-class")) &&
        identical(col_of(tab(.j_sct, "Variable Types"), "Unique Values")[c(1L, 7L)],
                  c("70", "2")) &&
        identical(col_of(tab(.j_sct, "Variable Types"), "Mean")[c(1L, 2L, 11L)],
                  c("", "15.182", "-4.943")))

# =============================================================================
# K. THE NOTES AND TWO LINE ENDINGS (S327)
# =============================================================================
# Three notes printed a number through round(): jcrosstab's expected-frequency
# note could read "less than 5 (minimum expected = 5)", and the two VIF notes
# read "VIF = 16 ... a factor of 4" beside a table showing 16.000. jaov's two
# Welch notes said Sum of Squares and Tukey HSD were "not available", which
# read as a gap in jstats; they are not applicable to Welch's test. jlogistic
# was the one analysis function whose output ended without a blank line, and
# jscreen's four header lines each ended in a space.
cat("\n--- K. notes and line endings ---\n")

.k_x <- function(d) raw_out(jcrosstab(r ~ k, data = d, chisq = TRUE))

check("K01 expected-frequency note: a minimum of 4.96 prints 4.96, on one line (it read \"minimum expected = 5\"); since S329 a pointer line closes the note when the expected frequencies are not shown",
      identical(run_at(.k_x(f_x496),
                       "Note: 1 cell has an expected frequency less than 5 (minimum = 4.96).",
                       4L)[-1L],
                c("Chi-square results may not be reliable.",
                  "To see the expected frequencies, add expected = TRUE.",
                  "")))
check("K02 ... a minimum of 4.998 prints 4.99, never 5.00",
      any(.k_x(f_x4998) ==
            "Note: 1 cell has an expected frequency less than 5 (minimum = 4.99)."))
check("K03 ... exactly 3 prints 3.00",
      any(.k_x(f_x3) ==
            "Note: 1 cell has an expected frequency less than 5 (minimum = 3.00)."))
check("K04 ... the plural form: 3 cells, minimum 1.20, still one line",
      any(.k_x(f_xpl) ==
            "Note: 3 cells have expected frequencies less than 5 (minimum = 1.20)."))

# The VIF notes, read off section J's two f_vif captures: x1 and x2 have a
# VIF of 16 and a note each; x3, at 1, has none.
check("K05 jlm's VIF note: both numbers to one place, padded -- VIF = 16.0, a factor of 4.0 -- under a table showing 16.000",
      same(col_of(tab(.j_vlm, "VIF (Variance Inflation Factors)"), "VIF"),
           c("16.000", "16.000", "1.000")) &&
        any(.j_vlm == "x1 (VIF = 16.0): standard error inflated by a factor of 4.0.") &&
        any(.j_vlm == "x2 (VIF = 16.0): standard error inflated by a factor of 4.0.") &&
        !any(startsWith(.j_vlm, "x3 (VIF")))
check("K06 jlogistic's VIF note: the same",
      same(col_of(tab(.j_vlg, "VIF (Variance Inflation Factors)"), "VIF"),
           c("16.000", "16.000", "1.000")) &&
        any(.j_vlg == "x1 (VIF = 16.0): standard error inflated by a factor of 4.0.") &&
        any(.j_vlg == "x2 (VIF = 16.0): standard error inflated by a factor of 4.0.") &&
        !any(startsWith(.j_vlg, "x3 (VIF")))

check("K07 Welch: the Sum of Squares note reads \"not applicable\" and points to the standard table",
      identical(run_at(.b_welch,
                       "Note: Sum of Squares and Mean Square are not applicable to Welch's ANOVA.",
                       2L)[2L],
                "For the standard ANOVA table, run jaov() without welch = TRUE."))
# Until 0.9.215 a Tukey note answered a request for post-hoc tests under
# Welch ("not applicable", S327) and offered nothing; the request is now
# answered with the Games-Howell table (Session 341, section U). The note is
# gone in both forms, and a call that asked for no post-hoc test prints no
# post-hoc table (S328: a mutant dropping that guard once passed everything).
.k_nop <- raw_out(jaov(y ~ g, data = f_aov, welch = TRUE, posthoc = FALSE))
check("K08 Welch with post-hoc tests requested: the Games-Howell table, and no Tukey note; neither form says \"not available\"; with none requested, no post-hoc table and no mention of either test",
      any(.b_welch == "Games-Howell Post-Hoc Comparisons") &&
        !any(grepl("Tukey", .b_welch, fixed = TRUE)) &&
        !any(grepl("not available", .b_welch, fixed = TRUE)) &&
        any(startsWith(.k_nop, "Note: Sum of Squares and Mean Square")) &&
        !any(grepl("Tukey", .k_nop, fixed = TRUE)) &&
        !any(grepl("Games-Howell", .k_nop, fixed = TRUE)) &&
        !any(grepl("Post-Hoc", .k_nop, fixed = TRUE)))

# K09 -- the note goes through the stdout emitter, so it wraps by width. The
# width is narrowed for this one call and handed back; a note printed with
# cat() keeps its 73-character first line whatever the setting.
.k_nar <- local({
  op <- options(.jst_options_message_width = 50L)
  on.exit(options(op), add = TRUE)
  raw_out(jaov(y ~ g, data = f_aov, welch = TRUE, posthoc = TRUE))
})
check("K09 the Welch note wraps by width: at width 50 no line of it passes 50, and every word is there",
      { para <- function(ln, start) {
          i <- grep(start, ln)[1]
          if (is.na(i)) return(character(0))
          j <- i
          while (j <= length(ln) && nzchar(ln[j])) j <- j + 1L
          ln[i:(j - 1L)]
        }
        a <- para(.k_nar, "^Note: Sum of Squares")
        length(a) > 2L && max(nchar(a)) <= 50L &&
          identical(paste(a, collapse = " "),
                    paste("Note: Sum of Squares and Mean Square are not applicable",
                          "to Welch's ANOVA. For the standard ANOVA table, run",
                          "jaov() without welch = TRUE.")) })

check("K10 jlogistic ends on exactly one blank line, after the Dependent Variable Encoding block",
      { o <- raw_out(jlogistic(yb ~ x1 + x2, data = f_log))
        n <- length(o)
        n > 3L && identical(o[(n - 2L):n],
                            c("  Modeled (1):   1", "  Reference (0): 0", "")) })

.k_scr <- raw_out(jscreen(f_aov))
.k_exc <- local({
  quiet(joutput("minimal"))
  on.exit(quiet(joutput(NULL)), add = TRUE)
  raw_out(jscreen(f_aov, subset = g != "c"))
})
check("K11 jscreen's four header lines end at their value, with no space before the line end",
      identical(run_at(.k_scr, "Data Screening", 5L)[-1L],
                c("  Cases: 12", "  Variables: 2", "  Cases with missing data: 0",
                  "  Variables with outliers: 0")))
check("K12 ... and so does the Cases line carrying its Excluded count (minimal level, subset =)",
      identical(run_at(.k_exc, "Data Screening", 2L)[2L], "  Cases: 8 (4 Excluded)"))

# =============================================================================
# L. THE RENDERER: THE LEAN, THE DECIMAL-ALIGNED BLOCK, THE DEFAULTS (S328)
# =============================================================================
# Three things changed in .jst_print_table() at v0.9.204. These checks read
# them on the renderer itself, with trim = FALSE wherever the padding is the
# evidence.
#   THE LEAN. Where a header or a block cannot be centered exactly, the odd
# space goes on the LEFT, so the text sits one place right of center: a
# one-digit df under the "f" of "df", where a right-justified number would
# sit (Jeff, S328). Through v0.9.203 the odd space went on the right.
#   "bd". A column aligned on the decimal point: each cell split where its
# whole-number part ends, the heads right-justified, the tails
# left-justified, the block centered under the header.
#   THE DEFAULTS. trim is on unless a caller turns it off; with no align a
# number is still right-justified and text flush left, the form a listing of
# data rows keeps.
cat("\n--- L. the renderer: the lean, decimal-aligned blocks, the defaults ---\n")

pt   <- function(...) raw_out(.jst_print_table(..., row.names = FALSE))
.l_c <- function(...) data.frame(..., stringsAsFactors = FALSE)

check("L01 the lean, a header: of three spare spaces two go LEFT -- \"p\" over .897",
      identical(pt(.l_c(v = c(".897", ".120")), col.names = "p", align = "bc",
                   trim = FALSE),
                c("  p ", "----", ".897", ".120")))
check("L02 the lean, a block: with one spare space the value sits RIGHT of center (6 under the f of \"df\"); with three, two go left (70 under \"Total\")",
      identical(pt(.l_c(a = c("6", "3"), b = c("70", "8")),
                   col.names = c("df", "Total"), align = c("bc", "bc"),
                   trim = FALSE),
                c("df  Total", "--  -----", " 6    70 ", " 3     8 ")))
check("L03 an even spare splits evenly: 3 under the middle of \"df1\"",
      identical(pt(.l_c(a = c("3", "7")), col.names = "df1", align = "bc",
                   trim = FALSE),
                c("df1", "---", " 3 ", " 7 ")))
check("L04 the lean in plain \"c\", each cell on its own: 6 and 12 under \"abcd\"",
      identical(pt(.l_c(a = c("6", "12")), col.names = "abcd", align = "c",
                   trim = FALSE),
                c("abcd", "----", "  6 ", " 12 ")))
check("L05 \"bd\": 13 over 12.6 over 26.5% over -0.522 over 5 -- one decimal point down the column, the block centered under its header",
      identical(pt(.l_c(lab = c("n", "e", "p", "r", "m"),
                        x = c("13", "12.6", "26.5%", "-0.522", "5")),
                   col.names = c("", "1: Control"), align = c("l", "bd"),
                   trim = FALSE),
                c("   1: Control", "-  ----------", "n    13      ",
                  "e    12.6    ", "p    26.5%   ", "r    -0.522  ",
                  "m     5      ")))
check("L06 \"bd\": a cell that is not a number sits with the whole-number parts (-- over 12.5)",
      identical(pt(.l_c(x = c("--", "12.5", "7")), col.names = "Min",
                   align = "bd", trim = FALSE),
                c(" Min", "----", "--  ", "12.5", " 7  ")))
check("L07 \"bd\": a blank cell stays blank, and a marker trails its number (2.438 * over -2.438 **)",
      identical(pt(.l_c(x = c("2.438 *", "", "-2.438 **", "0.100")),
                   col.names = "Adj", align = "bd", trim = FALSE),
                c("   Adj   ", "---------", " 2.438 * ", "         ",
                  "-2.438 **", " 0.100   ")))
check("L08 \"bd\": the block is wider than any one cell (100.0% with -0.522), and the column widens to hold it",
      identical(pt(.l_c(x = c("100.0%", "-0.522")), col.names = "Tot",
                   align = "bd", trim = FALSE),
                c("  Tot  ", "-------", "100.0% ", " -0.522")))
check("L09 \"bd\": values with no whole-number part line up on the point (.45, -.5, 1)",
      identical(pt(.l_c(x = c(".45", "-.5", "1")), col.names = "r",
                   align = "bd", trim = FALSE),
                c("  r ", "----", " .45", "-.5 ", "1   ")))

.l_tn <- pt(data.frame(Name = c("a", "b"), Value = c(1, 22)),
            align = c("l", "bc"), trim = FALSE)
.l_tt <- pt(data.frame(Name = c("a", "b"), Value = c(1, 22)),
            align = c("l", "bc"))
check("L10 trim is the default: no line ends in a space; trim = FALSE brings the padding back, and nothing else differs",
      any(grepl(" $", .l_tn)) && !any(grepl(" $", .l_tt)) &&
        identical(sub(" +$", "", .l_tn), .l_tt))
check("L11 with no align a number is right-justified under a right-justified header and text is flush left",
      identical(pt(data.frame(Name = c("a", "bb"), Value = c(1, 22),
                              Text = c("x", "yy"), stringsAsFactors = FALSE),
                   trim = FALSE),
                c("Name  Value  Text", "----  -----  ----",
                  "a         1  x   ", "bb       22  yy  ")))

# =============================================================================
# M. jfreq (S328)
# =============================================================================
# jfreq passed an explicit "r" for its four numeric columns, so a header sat
# flush right over its values and the section and spacer rows were padded to
# the table's width. The columns are block-centered now: counts on their
# ones digit, percentages on the decimal point, "--" at the right of its
# block.
cat("\n--- M. jfreq() ---\n")

.m_fq  <- raw_out(jfreq(f_fq, q))
.m_med <- raw_out(jfreq(cl_f, Medication))
.m_con <- raw_out(jfreq(cl_f, Condition))
.m_num <- c("Freq", "Total %", "Valid %", "Cum. %")

check("M01 with missing rows: Freq, Total %, Valid % and Cum. % block-centered, the labels flush left",
      { m <- fq_cells(.m_fq)
        !is.null(m) && nrow(m) == 8L &&
          all(vapply(.m_num, function(k) bc_ok(m, k), logical(1))) &&
          lft_ok(m, "(label)") })
check("M02 ... values of different widths keep one right edge: 104 over 9; 86.67 over 100.00; \"--\" at the right of its block",
      any(.m_fq == "1           104    83.20   86.67    86.67") &&
        any(.m_fq == "2             9     7.20    7.50    94.17") &&
        any(.m_fq == "3             7     5.60    5.83   100.00") &&
        any(.m_fq == "System/NA     5     4.00      --       --") &&
        any(.m_fq == "Total       125   100.00"))
check("M03 ... no line is padded: \"Valid\" and \"Missing\" end at their last letter and the two spacer rows are empty lines",
      { i <- which(.m_fq == "Missing")
        k <- which(startsWith(.m_fq, "Total "))
        m <- fq_cells(.m_fq)
        !is.null(m) && trimmed(m) && any(.m_fq == "Valid") &&
          length(i) == 1L && length(k) == 1L &&
          identical(.m_fq[i - 1L], "") && identical(.m_fq[k - 1L], "") })
check("M04 clinic's Medication, pinned whole",
      identical(run_at(.m_med,
                       "                 Freq  Total %  Valid %  Cum. %", 10L),
                c("                 Freq  Total %  Valid %  Cum. %",
                  "---------------  ----  -------  -------  ------",
                  "Valid",
                  "0: No             39     55.71   60.00    60.00",
                  "1: Yes            26     37.14   40.00   100.00",
                  "",
                  "Missing",
                  "-99 [\"Refused\"]    5      7.14      --       --",
                  "",
                  "Total             70    100.00")))
check("M05 without missing rows the table is flat -- no Valid or Missing row -- and aligned the same way",
      { m <- fq_cells(.m_con)
        !is.null(m) && nrow(m) == 6L && !any(.m_con == "Valid") &&
          all(vapply(.m_num, function(k) bc_ok(m, k), logical(1))) &&
          lft_ok(m, "(label)") && trimmed(m) })

# =============================================================================
# N. jcrosstab (S328)
# =============================================================================
# Every cell of the crosstab is text -- a count, an expected count, a
# percentage, a residual with its markers -- so the renderer's default left-
# justified them all. They are aligned on the decimal point now ("bd"), the
# sub-row labels keep the two-space indent they are built with, and the
# chi-square table is block-centered where each cell was centered on its own.
#   S329 (v0.9.205) re-pinned N01, N05 and N09 -- expected counts at two
# places, a blank line between the row groups, the columns four spaces apart
# where the table has room -- and moved N02, N03 and N04 from cells() to
# xt_cells(): cells() stops at the first empty line, so on the new table it
# read the first category alone (N04 PASSED that way on the new master,
# seeing a third of what it claims). N04 now counts its rows. Section R
# asserts the new behavior itself.
cat("\n--- N. jcrosstab() ---\n")

.n_cl  <- raw_out(jcrosstab(SoughtHelp ~ Condition, cl_f, expected = TRUE))
.n_all <- raw_out(jcrosstab(SoughtHelp ~ Condition, cl_f, expected = TRUE,
                            col.pct = TRUE, residuals = "adjusted"))
.n_res <- local({
  quiet(joutput("full"))
  on.exit(quiet(joutput(NULL)), add = TRUE)
  raw_out(jcrosstab(Volunteer ~ OwnsHome, cm_f, residuals = "adjusted"))
})
.n_chw <- raw_out(jcrosstab(r ~ k, data = f_x100, chisq = TRUE))
.n_chp <- raw_out(jcrosstab(r ~ k, data = f_xp, chisq = TRUE))
.n_ch4 <- raw_out(jcrosstab(SoughtHelp ~ Condition, cl_f, chisq = TRUE))
.n_cap <- "Crosstab: SoughtHelp by Condition"

check("N01 clinic with expected counts, pinned whole: 13 over 12.60 over 26.5% on the decimal point, the sub-rows indented, a blank line between the row groups, the two-space gap of a table too wide for four",
      identical(run_at(.n_cl, .n_cap, 13L),
                c("Crosstab: SoughtHelp by Condition",
                  "SoughtHelp    1: Control  2: CBT  3: Mindfulness  4: Support group   Total",
                  "------------  ----------  ------  --------------  ----------------  ------",
                  "0: No            13         9          13               14           49",
                  "  (Expected)     12.60      9.80       11.90            14.70        49.00",
                  "  (Row %)        26.5%     18.4%       26.5%            28.6%       100.0%",
                  "",
                  "1: Yes            5         5           4                7           21",
                  "  (Expected)      5.40      4.20        5.10             6.30        21.00",
                  "  (Row %)        23.8%     23.8%       19.0%            33.3%       100.0%",
                  "",
                  "Total            18        14          17               21           70",
                  "")))
check("N02 every cell column is aligned on the decimal point and centered under its header, with all five kinds of row; nothing padded",
      { m <- xt_cells(.n_all, .n_cap)
        !is.null(m) && nrow(m) == 13L &&
          all(vapply(colnames(m)[-1L], function(k) bd_ok(m, k), logical(1))) &&
          all(vapply(colnames(m)[-1L],
                     function(k) length(unique(dots_at(m, k))) == 1L,
                     logical(1))) &&
          trimmed(m) })
check("N03 the label column: row labels and Total flush left, every sub-row label indented two spaces",
      { m <- xt_cells(.n_all, .n_cap)
        !is.null(m) &&
          identical(sub(" +$", "", unname(m[, 1L])),
                    c("SoughtHelp", "0: No", "  (Expected)", "  (Row %)",
                      "  (Col %)", "  (Adj.Res.)", "1: Yes", "  (Expected)",
                      "  (Row %)", "  (Col %)", "  (Adj.Res.)", "Total",
                      "  (Col %)")) })
check("N04 a count's ones digit sits over the ones digit of the expected count and of the percentage beneath it, in all seven rows",
      { m <- xt_cells(.n_cl, .n_cap)
        !is.null(m) && nrow(m) == 8L &&
          all(vapply(colnames(m)[-1L], function(k) {
            x    <- unname(m[-1L, k])
            dot  <- as.integer(regexpr(".", x, fixed = TRUE))
            last <- nchar(sub(" +$", "", x))
            whole <- dot < 0L
            any(whole) && any(!whole) &&
              length(unique(c(last[whole] + 1L, dot[!whole]))) == 1L
          }, logical(1))) })
check("N05 at joutput(\"full\") a marked residual keeps the decimal point, its marker trailing; the Total cell stays blank",
      any(.n_res == "0: No           19          35           54") &&
        any(.n_res == "  (Row %)       35.2%       64.8%       100.0%") &&
        any(.n_res == "  (Adj.Res.)    -2.438 *     2.438 *") &&
        any(.n_res == "  (Adj.Res.)     2.438 *    -2.438 *"))
check("N06 the 2 x 2 chi-square table is block-centered: 96.590 under 100.644 on the decimal point",
      identical(run_at(.n_chw, "Chi-Square Test of Independence", 5L),
                c("Chi-Square Test of Independence",
                  "Test                   Chi-Square  df    p     N",
                  "---------------------  ----------  --  -----  ---",
                  "Pearson                  100.644    1  <.001  109",
                  "Continuity Correction     96.590    1  <.001  109")) &&
        aligned(.n_chw, "Chi-Square Test of Independence", left = "Test"))
check("N07 ... and <.001 over .001 share a right edge in the p column",
      any(.n_chp == "Pearson                  11.605     1  <.001  80") &&
        any(.n_chp == "Continuity Correction    10.110     1   .001  80") &&
        aligned(.n_chp, "Chi-Square Test of Independence", left = "Test"))
check("N08 the one-row chi-square table of a larger crosstab: every column block-centered",
      identical(run_at(.n_ch4, "Chi-Square Test of Independence", 4L),
                c("Chi-Square Test of Independence",
                  "Chi-Square  df    p    N",
                  "----------  --  ----  --",
                  "   0.710     3  .871  70")) &&
        aligned(.n_ch4, "Chi-Square Test of Independence"))

# A count is a whole number and prints as one. The cells were built with
# as.character(), which abbreviates a double of exactly 100000 to "1e+05":
# the margins of a 200,000-case table split evenly printed that way (found
# S328, probing round sample sizes; jcrosstab was the one function that did
# it). On the decimal point the abbreviation also split at its "e".
.n_big <- raw_out(jcrosstab(r ~ k, data = f_100k))
check("N09 a count of exactly 100000 prints whole, never as 1e+05: the cells and both margins of a 400,000-case table",
      !any(grepl("e+", .n_big, fixed = TRUE)) &&
        identical(run_at(.n_big, "Crosstab: r by k", 10L),
                  c("Crosstab: r by k",
                    "r                1            2          Total",
                    "---------    ---------    ---------    ---------",
                    "1            100000       100000       200000",
                    "  (Row %)        50.0%        50.0%       100.0%",
                    "",
                    "2            100000       100000       200000",
                    "  (Row %)        50.0%        50.0%       100.0%",
                    "",
                    "Total        200000       200000       400000")))

# =============================================================================
# O. THE COEFFICIENT TABLES AND THE REST OF THE RENDERER'S CALLERS (S328)
# =============================================================================
# The jlm and jlogistic coefficient tables were decimal-tabbed ("d": header
# centered, values at the column's right edge), which left "95% CI Lower"
# off its values and jlogistic's df disagreeing with the Omnibus table's.
# They are block-centered now. The dummy-scheme table took the default (its
# 0s and 1s at the right edge of headers twenty characters wide) and is
# block-centered; jcomplete()'s set-time table and jscreen's Missing Data
# table were block-centered already but padded; jcomplete()'s preview and
# jcorr's matrix keep their alignment and lose only their padding.
cat("\n--- O. coefficient tables and the remaining callers ---\n")

.o_lm  <- raw_out(jlm(Flourishing ~ Stress + SocialSupport, cl_f, ci = TRUE))
.o_lg  <- raw_out(jlogistic(SoughtHelp ~ Stress + SocialSupport, cl_f,
                            ci = TRUE))
.o_lg0 <- raw_out(jlogistic(SoughtHelp ~ Stress + SocialSupport, cl_f))
.o_grp <- local({
  quiet(jdummy(cl_f, Condition))
  on.exit(quiet(jdummy(clear.all = TRUE)), add = TRUE)
  list(lm  = raw_out(jlm(Flourishing ~ Stress + Condition, cl_f)),
       sch = raw_out(jdummy(cl_f, Condition, show = TRUE)))
})
.o_d3 <- cl_f
.o_d3$SleepHours[1:17] <- NA
.o_cmp <- local({
  on.exit(quiet(jcomplete(clear.all = TRUE)), add = TRUE)
  raw_out(jcomplete(.o_d3, Stress, SleepHours, Medication, console = 3))
})
.o_scr <- raw_out(jscreen(.o_d3, Stress, SleepHours, Flourishing, Anxiety4))
.o_cor <- raw_out(jcorr(cl_f, Stress, SocialSupport, Flourishing))

# coef_ok(): a Coefficients table whole -- its label column (whose header is
# blank, so it is read by position) flush left, every other column
# block-centered, no line padded, and `k` columns in all.
coef_ok <- function(ln, k) {
  m <- cells(ln, "Coefficients")
  if (is.null(m) || ncol(m) != k) return(FALSE)
  lab <- unname(m[-1L, 1L])
  colnames(m)[1L] <- "(label)"
  all(vapply(colnames(m)[-1L], function(j) bc_ok(m, j), logical(1))) &&
    !any(startsWith(lab, " ")) && trimmed(m)
}

check("O01 jlm's coefficient table: the labels flush left, every other column block-centered, nothing padded",
      coef_ok(.o_lm, 8L))
check("O02 ... 28.355 over -0.878 over 0.367 under the middle of \"95% CI Lower\" (they sat at the column's right edge)",
      any(.o_lm == "(Intercept)    41.495  6.575   6.311          <.001     28.355        54.634") &&
        any(.o_lm == "Stress         -0.436  0.221  -1.974  -0.226   .053     -0.878         0.005") &&
        any(.o_lm == "SocialSupport   1.039  0.336   3.090   0.354   .003      0.367         1.711"))
check("O03 jlogistic's coefficient table: the same form, with and without its CI columns",
      coef_ok(.o_lg, 9L) && coef_ok(.o_lg0, 7L))
.o_big <- raw_out(jlm(y ~ x1 + x2, data = f_big, ci = TRUE))
.o_non <- raw_out(jlm(y ~ x1 + x2, data = f_big, std = "none"))
.o_or  <- raw_out(jlogistic(yb ~ x1 + x2, data = f_or, ci = TRUE))
check("O03a values two characters apart keep one right edge: 0.545 under 110.000, and 0.419 under 109.721 (jlm, f_big)",
      coef_ok(.o_big, 8L) &&
        any(.o_big == "(Intercept)  110.000  0.134  819.038         <.001     109.721       110.279") &&
        any(.o_big == "x1             0.545  0.061    8.980  0.105  <.001       0.419         0.672"))
check("O03b ... with no standardized column (std = \"none\"): four columns, the same form",
      coef_ok(.o_non, 5L) &&
        any(.o_non == "x1             0.545  0.061    8.980  <.001"))
.o_gel <- raw_out(jlm(Flourishing ~ Stress + SocialSupport, cl_f,
                      std = "gelman"))
check("O03d a header WIDER than its values: under std = \"gelman\" the standardized column sits under the middle of its header, not at the column's right edge",
      coef_ok(.o_gel, 6L) &&
        any(.o_gel == "Stress         -0.436  0.221  -1.974   -6.459    .053") &&
        any(.o_gel == "SocialSupport   1.039  0.336   3.090   10.108    .003"))
check("O03c ... and in jlogistic: an upper bound of 5.330 under 117.535 (f_or)",
      coef_ok(.o_or, 9L) &&
        any(.o_or == "x1            2.531  0.795  10.144   1   .001  12.567      3.823        117.535") &&
        any(.o_or == "x2           -0.232  0.358   0.421   1   .516   0.793      0.328          1.555"))
check("O04 ... its df column and the Omnibus table's follow one rule: 1 and 2 both under the f of \"df\"",
      identical(run_at(.o_lg0, "Coefficients", 4L)[c(2L, 4L)],
                c("                  b      SE    Wald  df    p   Exp(B)",
                  "(Intercept)    -2.256  1.206  3.500   1  .061   0.105")) &&
        identical(run_at(.o_lg0, "Omnibus Test of Model Coefficients", 4L)[-1L],
                  c("Chi-Square  df    p", "----------  --  ----",
                    "   1.641     2  .440")))
check("O05 a grouped predictor: its header row ends at its text, the category rows keep their two-space indent and their blank standardized cell",
      any(.o_grp$lm == "Condition (ref = 1: Control)") &&
        any(.o_grp$lm == "  2: CBT                      13.987  4.555   3.070           .003") &&
        any(.o_grp$lm == "  4: Support group             3.815  4.069   0.938           .352") &&
        any(.o_grp$lm == "Stress                        -0.595  0.210  -2.827  -0.309   .006"))
check("O06 the dummy-scheme table: each 0 and 1 under the middle of its category name",
      identical(run_at(.o_grp$sch,
                       "                                Condition_Control*  Condition_CBT  Condition_Mindfulness  Condition_Support_group",
                       6L)[-(1:2)],
                c("    1: Condition_Control*                1                0                  0                       0",
                  "    2: Condition_CBT                     0                1                  0                       0",
                  "    3: Condition_Mindfulness             0                0                  1                       0",
                  "    4: Condition_Support_group           0                0                  0                       1")))
check("O07 jcomplete()'s set-time table: block-centered as before, and no line ends in a space now",
      identical(run_at(.o_cmp, "Variable     N  Missing  % Missing", 5L),
                c("Variable     N  Missing  % Missing",
                  "----------  --  -------  ---------",
                  "Stress      70      4       5.7%",
                  "SleepHours  70     19      27.1%",
                  "Medication  70      5       7.1%")))
check("O08 jscreen's Missing Data table: the same",
      identical(run_at(.o_scr,
                       "Missing Data & Outliers (outliers > 3 SD from mean)",
                       7L)[-1L],
                c("Variable     Missing  % Missing  Outliers",
                  "-----------  -------  ---------  --------",
                  "Stress           4        5.7        1",
                  "SleepHours      19       27.1       --",
                  "Flourishing     --         --        1",
                  "Anxiety4         6        8.6       --")))
.o_out <- raw_out(jscreen(f_out))
check("O08a ... a three-digit count over a one-digit count in Outliers: 100 over 5 on the ones digit",
      identical(run_at(.o_out,
                       "Missing Data & Outliers (outliers > 3 SD from mean)",
                       5L)[-1L],
                c("Variable  Outliers", "--------  --------",
                  "a            100", "b              5")))
check("O09 jcomplete()'s preview keeps the renderer's default: data values right-justified under right-justified headers, no line padded",
      identical(run_at(.o_cmp,
                       "Row  Stress  SleepHours  Medication  DeletionCheck", 5L),
                c("Row  Stress  SleepHours  Medication  DeletionCheck",
                  "---  ------  ----------  ----------  -------------",
                  "  1      14                       0              1",
                  "  2      17                       0              1",
                  "  3      19                       0              1")))
check("O10 jcorr's matrix keeps its cells flush left under flush-left headers, and loses its padding",
      identical(run_at(.o_cor, "Bivariate Correlations (Pearson)", 10L)[-1L],
                c("               Stress          SocialSupport   Flourishing",
                  "-------------  --------------  --------------  -----------",
                  "Stress          1",
                  "",
                  "SocialSupport  -.221 (p=.075)   1",
                  "               N=66",
                  "",
                  "Flourishing    -.304 (p=.013)   .378 (p=.001)   1",
                  "               N=66            N=70")))

# A whole-number df prints whole (the S326 rule's own words). jlm's F line
# is built with cat(), which abbreviates a double of exactly 100000: with
# 100,000 residual degrees of freedom it read "on 1 and 1e+05 DF" (found
# S328 with N09's, probing round sample sizes; the tables were never
# affected -- the renderer formats a numeric column itself).
.o_df <- raw_out(jlm(y ~ x, data = f_df, diagnostics = FALSE))
check("O11 jlm's F line prints a residual df of exactly 100000 whole, never as 1e+05",
      any(.o_df == "F-statistic: 2500.000 on 1 and 100000 DF, p-value: <.001") &&
        !any(grepl("e+", .o_df, fixed = TRUE)))

# =============================================================================
# P. jdesc: MIN AND MAX AT THE VARIABLE'S OWN PRECISION (S328)
# =============================================================================
# The S326 rule says Min and Max are values of the variable and keep the
# data's precision. Both columns took ONE precision from the minimums and
# maximums in them, so a whole-number variable printed 0.0 and 75.0 beside
# another's 4.8 and 9.7, and a variable measured to a tenth printed a
# maximum of 10 beside a minimum of 4.8. Each variable now shows the places
# its own data carry (up to digits), and the two columns line up on the
# decimal point.
cat("\n--- P. jdesc(): Min and Max ---\n")

.p_cl  <- raw_out(jdesc(cl_f, Flourishing, SleepHours, ScreenTime, Stress))
.p_mm  <- raw_out(jdesc(f_mm, x, w, z, h))
.p_x   <- raw_out(jdesc(f_mm, x))
.p_grp <- raw_out(jdesc(f_gm, y, by = g))
.p_d1  <- raw_out(jdesc(f_mm, z, digits = 1))

check("P01 .jst_data_dp(): whole numbers 0; tenths 1; the most any value needs; never past the cap; nothing to read 0",
      identical(.jst_data_dp(c(1, 2, 3)), 0L) &&
        identical(.jst_data_dp(c(4.8, 10)), 1L) &&
        identical(.jst_data_dp(c(0.125, 2.5)), 3L) &&
        identical(.jst_data_dp(c(0.125, 2.5), 2L), 2L) &&
        identical(.jst_data_dp(c(NA, NA)), 0L) &&
        identical(.jst_data_dp(numeric(0)), 0L) &&
        identical(.jst_data_dp(c(1.5, 2.25), 0L), 0L))
check("P02 ... arithmetic noise is not precision (0.1 + 0.2 needs one place), and a value past the first batch of 5,000 still counts",
      identical(.jst_data_dp(0.1 + 0.2), 1L) &&
        identical(.jst_data_dp(c(seq_len(6000), 0.25)), 2L) &&
        identical(.jst_data_dp(c(seq_len(6000) + 0.5, 0.125), 3L), 3L))
check("P03 several variables, each at its own places: Flourishing 0 and 75, SleepHours 4.8 and 9.7, ScreenTime 0.0 and 8.1, Stress 0 and 40",
      { m <- tab(.p_cl, hdr = "Variable")
        same(col_of(m, "Min"), c("0", "4.8", "0.0", "0")) &&
          same(col_of(m, "Max"), c("75", "9.7", "8.1", "40")) })
check("P04 ... the two columns are aligned on the decimal point and centered under their headers; the rest block-centered; nothing padded",
      { m <- cells(.p_cl, hdr = "Variable")
        !is.null(m) && bd_ok(m, "Min") && bd_ok(m, "Max") &&
          all(vapply(c("Total", "Non_missing", "Mean", "SD"),
                     function(k) bc_ok(m, k), logical(1))) &&
          lft_ok(m, "Variable") && trimmed(m) })
check("P05 three precisions in one table, pinned: 4.8 and 10.0, 30 and 1500, -1.250 and 3.375, 1.0 and 4.0; a Mean of 7.125 under 430.000",
      identical(run_at(.p_mm,
                       "Variable  Total  Non_missing    Min      Max      Mean      SD",
                       6L)[-(1:2)],
                c("x           4         4        4.8      10.0      7.125    2.211",
                  "w           4         4       30      1500      430.000  714.283",
                  "z           4         4       -1.250     3.375    1.188    2.127",
                  "h           4         4        1.0       4.0      2.750    1.323")) &&
        { m <- cells(.p_mm, hdr = "Variable")
          !is.null(m) && bd_ok(m, "Min") && bd_ok(m, "Max") &&
            bc_ok(m, "Mean") && bc_ok(m, "SD") })
check("P06 one variable measured to a tenth: its whole-number maximum prints 10.0, not 10",
      { m <- tab(.p_x, hdr = "Variable")
        same(col_of(m, "Min"), "4.8") && same(col_of(m, "Max"), "10.0") })
.p_h <- raw_out(jdesc(f_mm, h))
check("P06a the places come from the DATA, not from the two values printed: a variable in halves whose minimum and maximum are whole shows 1.0 and 4.0",
      { m <- tab(.p_h, hdr = "Variable")
        same(col_of(m, "Min"), "1.0") && same(col_of(m, "Max"), "4.0") })
check("P07 grouped: every group minimum and maximum a whole number, the variable in halves -- 4.0 and 5.0, 6.0 and 7.0; a case with no group does not lend its places",
      { m <- tab(.p_grp, hdr = "g  ")
        same(col_of(m, "Min"), c("4.0", "6.0")) &&
          same(col_of(m, "Max"), c("5.0", "7.0")) &&
          aligned(.p_grp, hdr = "g  ", left = "g") })
check("P08 the digits setting caps the places: at digits = 1 a three-place variable shows -1.2 and 3.4, and at digits = 0 a grouped variable in halves shows whole numbers",
      { m <- tab(.p_d1, hdr = "Variable")
        g <- tab(raw_out(jdesc(f_gm, y, by = g, digits = 0)), hdr = "g  ")
        same(col_of(m, "Min"), "-1.2") && same(col_of(m, "Max"), "3.4") &&
          same(col_of(g, "Min"), c("4", "6")) &&
          same(col_of(g, "Max"), c("5", "7")) })
check("P09 display only: the returned Min and Max are the numbers they were",
      { r <- quiet(jdesc(f_mm, x, w, z))
        !is.null(r) && is.numeric(r$descriptives$Min) &&
          identical(r$descriptives$Min, c(4.8, 30, -1.25)) &&
          identical(r$descriptives$Max, c(10, 1500, 3.375)) })

# =============================================================================
# Q. EVERY ANALYSIS OUTPUT ENDS ON EXACTLY ONE BLANK LINE (S328)
# =============================================================================
# Through v0.9.203 the closing differed by function and by level: jfreq
# always ended on two blank lines; jcrosstab on two without a chi-square
# table; jt, jaov, jscreen, a three-variable jcorr and jlm on two whenever a
# legend printed (the legend block ends on a blank line of its own, and the
# function added another); and jdesc on NONE when a variable was refused,
# its note being the last line. One rule now (Jeff, S328): exactly one, at
# every level and in every legend mode -- and nowhere two blank lines
# together. Read on BOTH streams, in the order the package emits them: a
# note printed through the message stream is part of what the user sees.
cat("\n--- Q. closing blank lines ---\n")

check("Q01 jfreq: every form ends on exactly one blank line (it ended on two)",
      ok_runs(one_blank(c("jfreq(cl_f, Condition%s)",
                          "jfreq(cl_f, Medication%s)",
                          "jfreq(cl_f, Condition, Medication%s)")), 39L))
check("Q02 jcrosstab: with and without the chi-square table, the residual note and a legend; since S329 with both notes together and with single-line rows",
      ok_runs(one_blank(c("jcrosstab(SoughtHelp ~ Condition, cl_f%s)",
                          "jcrosstab(SoughtHelp ~ Condition, cl_f, chisq = TRUE%s)",
                          "jcrosstab(Volunteer ~ OwnsHome, cm_f, chisq = TRUE, residuals = \"adjusted\"%s)",
                          "jcrosstab(Volunteer ~ OwnsHome, cm_f, residuals = \"adjusted\"%s)",
                          "jcrosstab(r ~ k, f_x496, chisq = TRUE, residuals = \"adjusted\"%s)",
                          "jcrosstab(Volunteer ~ OwnsHome, cm_f, row.pct = FALSE%s)")),
              78L))
check("Q03 jt",
      ok_runs(one_blank(c("jt(Flourishing ~ SoughtHelp, cl_f%s)",
                          "jt(Flourishing ~ SoughtHelp, cl_f, diagnostics = TRUE, effect.size = TRUE%s)",
                          "jt(Flourishing ~ SoughtHelp, cl_f, welch = TRUE%s)")), 39L))
check("Q04 jaov",
      ok_runs(one_blank(c("jaov(Stress ~ Condition, cl_f%s)",
                          "jaov(Stress ~ Condition, cl_f, posthoc = TRUE, effect.size = TRUE, diagnostics = TRUE%s)",
                          "jaov(Stress ~ Condition, cl_f, welch = TRUE, posthoc = TRUE%s)")),
              39L))
check("Q05 jscreen",
      ok_runs(one_blank(c("jscreen(cl_f%s)", "jscreen(cm_f, stats = TRUE%s)",
                          "jscreen(cl_f, Stress, Flourishing%s)")), 21L))
check("Q06 jdesc, ungrouped and grouped, and with a variable it refuses (the note ended the output with no blank line)",
      ok_runs(one_blank(c("jdesc(cl_f, Stress, SocialSupport%s)",
                          "jdesc(cl_f, Flourishing, by = Medication%s)",
                          "jdesc(cl_f, Flourishing, ClientID%s)",
                          "jdesc(cl_f, Flourishing, ClientID, by = Medication%s)")),
              52L))
check("Q07 jcorr: two variables and three, Pearson and Spearman (its note after a legend)",
      ok_runs(one_blank(c("jcorr(cl_f, Stress, SocialSupport, Flourishing%s)",
                          "jcorr(cl_f, Stress, SocialSupport%s)",
                          "jcorr(cl_f, Stress, SocialSupport, Flourishing, method = \"spearman\"%s)",
                          "jcorr(cl_f, Stress, SocialSupport, method = \"spearman\"%s)")),
              28L))
check("Q08 jlm (a closing legend ended it on two)",
      ok_runs(one_blank(c("jlm(Flourishing ~ Stress + SocialSupport, cl_f%s)",
                          "jlm(Flourishing ~ Stress + SocialSupport, cl_f, diagnostics = \"vif\"%s)",
                          "jlm(Flourishing ~ Stress * SocialSupport, cl_f, ci = TRUE%s)")),
              27L))
check("Q09 jlogistic",
      ok_runs(one_blank(c("jlogistic(SoughtHelp ~ Stress + SocialSupport, cl_f%s)",
                          "jlogistic(SoughtHelp ~ Stress + SocialSupport, cl_f, classification = TRUE, diagnostics = \"vif\"%s)")),
              18L))
check("Q10 jalpha",
      ok_runs(one_blank(c("jalpha(cl_f, Anxiety1, Anxiety3, Anxiety5%s)",
                          "jalpha(cl_f, Anxiety1, Anxiety2, Anxiety3, Anxiety4, Anxiety5%s)",
                          "jalpha(cm_f, Environment2, Environment4%s)")), 21L))

# Q11-Q15 -- the pieces behind the rule, one at a time.
.q_leg <- both_out(jt(y ~ g, data = f_t2, variable.id = "legend",
                      value.id = "legend"))
check("Q11 a legend mode with nothing to list prints no stray blank line: one closing blank, none doubled",
      !any(.q_leg == "Variable Labels:") && tail_blanks(.q_leg) == 1L &&
        dbl_blanks(.q_leg) == 0L)
.q_two <- both_out(jt(Flourishing ~ SoughtHelp, cl_f, variable.id = "legend",
                      value.id = "legend"))
check("Q12 two legend blocks: one blank line before the first, one between them, one after the second",
      { i <- which(.q_two == "Variable Labels:")
        j <- which(.q_two == "Value Labels:")
        length(i) == 1L && length(j) == 1L && j > i &&
          identical(.q_two[i - 1L], "") && nzchar(.q_two[i - 2L]) &&
          identical(.q_two[j - 1L], "") && nzchar(.q_two[j - 2L]) &&
          tail_blanks(.q_two) == 1L })
.q_cl <- cl_f
.q_cl$grp <- as.integer(cl_f$SoughtHelp)        # a grouping variable with no labels
.q_one <- both_out(jt(Flourishing ~ grp, .q_cl, variable.id = "legend",
                      value.id = "legend"))
check("Q12a one block of two: the variable legend prints, the value legend has nothing to list -- still one closing blank line",
      any(.q_one == "Variable Labels:") && !any(.q_one == "Value Labels:") &&
        tail_blanks(.q_one) == 1L && dbl_blanks(.q_one) == 0L)
.q_sp3 <- both_out(jcorr(cl_f, Stress, SocialSupport, Flourishing,
                         method = "spearman", variable.id = "legend"))
.q_sp2 <- both_out(jcorr(cl_f, Stress, SocialSupport, Flourishing,
                         method = "spearman"))
check("Q12b jcorr's Spearman note has one blank line above it, after a legend and after the matrix alike",
      all(vapply(list(.q_sp3, .q_sp2), function(o) {
        i <- grep("^Note: Spearman p-values", o)
        length(i) == 1L && identical(o[i - 1L], "") && nzchar(o[i - 2L]) &&
          tail_blanks(o) == 1L
      }, logical(1))) &&
        any(.q_sp3 == "Variable Labels:") && !any(.q_sp2 == "Variable Labels:"))
.q_ref <- both_out(jdesc(cl_f, Flourishing, ClientID, variable.id = "legend"))
check("Q13 jdesc's refusal note is followed by one blank line, then the legend -- the legend sat directly under it",
      { i <- grep("ClientID", .q_ref)
        j <- which(.q_ref == "Variable Labels:")
        length(j) == 1L && length(i) > 0L && max(i[i < j]) < j - 1L &&
          identical(.q_ref[j - 1L], "") && nzchar(.q_ref[j - 2L]) })

# jalpha's negative-correlation warning (the S327 item). The blank line that
# spaces it off Item-Total belongs to the warning, so it prints only when
# the warning prints there.
.q_a1 <- both_out(jalpha(cl_f, Anxiety1, Anxiety2, Anxiety3, Anxiety4, Anxiety5))
.q_a0 <- both_out(jalpha(cl_f, Anxiety1, Anxiety2, Anxiety3, Anxiety4, Anxiety5),
                  deferred = TRUE)
check("Q14 jalpha, warnings deferred (R's default): ONE blank line between Item Statistics and Item-Total (it printed two)",
      { j <- which(.q_a0 == "Item-Total Statistics")
        length(j) == 1L && !any(grepl("^Warning", .q_a0)) &&
          identical(.q_a0[j - 1L], "") && nzchar(.q_a0[j - 2L]) &&
          dbl_blanks(.q_a0) == 0L })
check("Q15 ... with options(warn = 1) the warning sits between the tables with one blank line on each side",
      { i <- grep("^Warning", .q_a1)[1]
        j <- which(.q_a1 == "Item-Total Statistics")
        length(j) == 1L && !is.na(i) && i < j &&
          identical(.q_a1[i - 1L], "") && nzchar(.q_a1[i - 2L]) &&
          identical(.q_a1[j - 1L], "") && nzchar(.q_a1[j - 2L]) &&
          dbl_blanks(.q_a1) == 0L })

# Q16 -- the instrument, not the package. both_out() must read the same
# lines whatever front end is listening on the message stream. The outer
# handlers below do what RStudio's global calling handlers do (2025.05 and
# later; rstudio/rstudio, src/cpp/r/R/GlobalCallingHandlers.R): re-emit a
# message, or a warning under options(warn = 1), on stderr() wrapped in
# RStudio's own escape sequences, and muffle it. A capture that reads the
# message STREAM comes back with those sequences in it, a note's closing
# marker on the line after the note, where a blank line should be -- which
# is how Q02, Q06, Q13 and Q15 failed on the workstation at v0.9.204 while
# passing in the sandbox. A capture that takes the CONDITIONS never lets
# the outer handlers see them. (A battery cannot install global handlers
# itself: globalCallingHandlers() refuses with handlers on the stack, and
# run_all.R's tryCatch is one. Local handlers set outside the capture stand
# in the same place -- after the capture's own.)
.q_fe <- function(expr) {
  withCallingHandlers(
    expr,
    message = function(m) {
      cat("\033G3;", conditionMessage(m), "\033g", file = stderr(), sep = "")
      invokeRestart("muffleMessage")
    },
    warning = function(w) {
      writeLines(paste0("\033G2;\033H2;Warning\033h: ", conditionMessage(w),
                        "\033g"), con = stderr())
      invokeRestart("muffleWarning")
    })
}
.q_p1 <- both_out(jdesc(cl_f, Flourishing, ClientID))
.q_f1 <- .q_fe(both_out(jdesc(cl_f, Flourishing, ClientID)))
.q_f2 <- .q_fe(both_out(jalpha(cl_f, Anxiety1, Anxiety2, Anxiety3, Anxiety4,
                               Anxiety5)))
check("Q16 the instrument: a front end that rewrites the message stream, as RStudio does, changes nothing both_out() reads -- a message (jdesc's refusal) and an immediate warning (jalpha's)",
      identical(.q_f1, .q_p1) && identical(.q_f2, .q_a1) &&
        any(grepl("ClientID", .q_p1, fixed = TRUE)) &&
        any(grepl("^Warning: ", .q_a1)) &&
        !any(grepl("\033", c(.q_p1, .q_a1, .q_f1, .q_f2), fixed = TRUE)))

# =============================================================================
# R. THE CROSSTAB BUILD (S329)
# =============================================================================
# Six changes to jcrosstab, the first five ruled by Jeff walking
# format_walk.R Sections 15 and 17 at v0.9.204:
#   (1) the expected-frequency note closes with a pointer to expected = TRUE
#       when the expected frequencies it speaks of are not in the table;
#   (2) expected frequencies print to TWO places, in the cells as in the
#       note (a cell read 5.0 beside "minimum = 4.96"), with the note's
#       guard: a value in [4.995, 5) prints 4.99, never 5.00;
#   (3) the expected Total cell is the sum of the UNROUNDED cells;
#   (4) a blank line before each category after the first, and before
#       Total, whenever the categories carry sub-rows; none when every
#       category is one line;
#   (5) the columns four spaces apart whenever the table at that gap fits
#       the message width, two otherwise -- .jst_print_table(gap =), which
#       takes one number or several in order of preference;
#   (6) one blank line above the adjusted-residuals note (the S328 rider).
cat("\n--- R. the crosstab build ---\n")

# -- the renderer's gap argument ----------------------------------------------
.r_w <- function(...) {                       # headers of the given widths
  w  <- c(...)
  df <- as.data.frame(as.list(rep("x", length(w))), stringsAsFactors = FALSE)
  names(df) <- vapply(seq_along(w),
                      function(j) strrep(letters[j], w[j]), character(1))
  df
}
.r_at <- function(width, expr) {              # a call at another message width
  op <- options(.jst_options_message_width = width)
  on.exit(options(op), add = TRUE)
  expr
}

check("R01 gap: one number is used as given -- four spaces in the header, the separator and every row; with none, the two every table has had",
      identical(pt(.l_c(a = c("1", "22"), b = c("x", "yy")),
                   align = c("l", "l"), gap = 4),
                c("a     b", "--    --", "1     x", "22    yy")) &&
        identical(pt(.l_c(a = c("1", "22"), b = c("x", "yy")),
                     align = c("l", "l")),
                  c("a   b", "--  --", "1   x", "22  yy")))
check("R02 gap: of several, the FIRST at which the table fits the message width (20 does not, 4 does); when none fits, the LAST",
      identical(gap_of(pt(.r_w(30, 30), gap = c(20, 4, 3))), 4L) &&
        identical(gap_of(pt(.r_w(40, 40), gap = c(4, 3))), 3L))
check("R03 gap: the boundary -- a table exactly as wide as the message width fits (36 + 4 + 36 = 76), one column wider does not; three columns have two gaps",
      identical(gap_of(pt(.r_w(36, 36), gap = c(4, 2))), 4L) &&
        identical(gap_of(pt(.r_w(36, 37), gap = c(4, 2))), 2L) &&
        identical(gap_of(pt(.r_w(24, 24, 20), gap = c(4, 2))), 4L) &&
        identical(gap_of(pt(.r_w(24, 24, 21), gap = c(4, 2))), 2L))
check("R04 gap: the indent counts toward the table's width, whichever of the two is larger",
      identical(gap_of(pt(.r_w(36, 36), gap = c(4, 2), indent = 1)), 2L) &&
        identical(gap_of(pt(.r_w(36, 36), gap = c(4, 2), header.indent = 1)),
                  2L) &&
        identical(gap_of(pt(.r_w(35, 36), gap = c(4, 2), indent = 1,
                            header.indent = 1)), 4L))
check("R05 gap: the ceiling is the message width SETTING -- at 100 a table of 80 takes four, at 76 two",
      identical(.r_at(100L, gap_of(pt(.r_w(40, 40), gap = c(4, 2)))), 4L) &&
        identical(gap_of(pt(.r_w(40, 40), gap = c(4, 2))), 2L))
check("R06 gap: zero, a word, NA and nothing are refused by name",
      all(vapply(list(0, "x", NA, integer(0), c(4, 0)), function(g) {
        identical(pt(.r_w(3, 3), gap = g),
                  "[error] .jst_print_table(): gap must be one or more whole numbers of spaces, each at least 1")
      }, logical(1))))

# -- the crosstab -------------------------------------------------------------
.r_e496  <- raw_out(jcrosstab(r ~ k, data = f_x496, chisq = TRUE,
                              expected = TRUE))
.r_e4998 <- raw_out(jcrosstab(r ~ k, data = f_x4998, chisq = TRUE,
                              expected = TRUE))
.r_e5    <- raw_out(jcrosstab(r ~ k, data = f_x5, chisq = TRUE,
                              expected = TRUE))
.r_3rd   <- raw_out(jcrosstab(r ~ k, data = f_x3rd, expected = TRUE,
                              row.pct = FALSE))
.r_5t    <- raw_out(jcrosstab(r ~ k, data = f_x5t, expected = TRUE,
                              row.pct = FALSE))
.r_one   <- raw_out(jcrosstab(Volunteer ~ OwnsHome, cm_f, row.pct = FALSE))
.r_cond  <- raw_out(jcrosstab(Condition ~ SoughtHelp, cl_f))
.r_colp  <- raw_out(jcrosstab(Condition ~ SoughtHelp, cl_f, row.pct = FALSE,
                              col.pct = TRUE))
.r_ccap  <- "Crosstab: Condition by SoughtHelp"

check("R07 Jeff's table, pinned whole: the cell under 5 reads 4.96, as the note does (it read 5.0); 31.00 in the Total; a blank line between the groups; four spaces between the columns",
      identical(run_at(.r_e496, "Crosstab: r by k", 13L),
                c("Crosstab: r by k",
                  "r                 1        2       Total",
                  "------------    -----    -----    ------",
                  "1                6       25        31",
                  "  (Expected)     4.96    26.04     31.00",
                  "  (Row %)       19.4%    80.6%    100.0%",
                  "",
                  "2               10       59        69",
                  "  (Expected)    11.04    57.96     69.00",
                  "  (Row %)       14.5%    85.5%    100.0%",
                  "",
                  "Total           16       84       100",
                  "")) &&
        any(.r_e496 ==
              "Note: 1 cell has an expected frequency less than 5 (minimum = 4.96)."))
check("R08 the guard, in the cell: an expected count of 4.998 prints 4.99, never 5.00 -- the number the note gives",
      any(.r_e4998 == "  (Expected)     4.99     46.00      51.00") &&
        any(.r_e4998 ==
              "Note: 1 cell has an expected frequency less than 5 (minimum = 4.99).") &&
        !any(grepl("5.00", .r_e4998, fixed = TRUE)))
check("R09 ... and an expected count of EXACTLY 5 prints 5.00, with no note: the guard is for values below 5",
      any(.r_e5 == "  (Expected)     5.00     5.00     10.00") &&
        any(.r_e5 == "  (Expected)    45.00    45.00     90.00") &&
        !any(grepl("4.99", .r_e5, fixed = TRUE)) &&
        !any(startsWith(.r_e5, "Note:")))
check("R10 the expected Total is the sum of the unrounded cells: three cells of 3.33 beside 10.00, not 9.99; 6.67 three times beside 20.00, not 20.01",
      any(.r_3rd == "  (Expected)     3.33     3.33     3.33    10.00") &&
        any(.r_3rd == "  (Expected)     6.67     6.67     6.67    20.00"))
check("R10a ... and it takes no 4.99 guard: a row of 5 whose expected counts sum to a hair under 5 in floating point reads 5.00, as its observed total reads 5",
      isTRUE(sum(quiet(jcrosstab(r ~ k, data = f_x5t))$expected[1L, ]) < 5) &&
        any(grepl("^  \\(Expected\\) +0[.]11 +4[.]20 +0[.]68 +5[.]00$", .r_5t)) &&
        !any(grepl("4.99", .r_5t, fixed = TRUE)))
check("R11 two places is a fixed convention: digits = 1 and digits = 5 move the residuals and leave the expected counts alone",
      { d1 <- raw_out(jcrosstab(r ~ k, data = f_x496, expected = TRUE,
                                residuals = "adjusted", digits = 1))
        d5 <- raw_out(jcrosstab(r ~ k, data = f_x496, expected = TRUE,
                                residuals = "adjusted", digits = 5))
        e  <- function(ln) trimws(sub("^  \\(Expected\\)", "",
                                      grep("^  \\(Expected\\)", ln,
                                           value = TRUE)))
        identical(gsub(" +", " ", e(d1)),
                  c("4.96 26.04 31.00", "11.04 57.96 69.00")) &&
          identical(gsub(" +", " ", e(d5)),
                    c("4.96 26.04 31.00", "11.04 57.96 69.00")) &&
          any(grepl("^  \\(Adj[.]Res[.]\\) +0[.]6 +-0[.]6$", d1)) &&
          any(grepl("^  \\(Adj[.]Res[.]\\) +0[.]61338 +-0[.]61338$", d5)) })

check("R12 no sub-rows, no blank lines: with row.pct = FALSE every category is one line, pinned whole (and the table takes the wider gap)",
      identical(run_at(.r_one, "Crosstab: Volunteer by OwnsHome", 7L),
                c("Crosstab: Volunteer by OwnsHome",
                  "Volunteer    1: Yes    2: No    Total",
                  "---------    ------    -----    -----",
                  "0: No          19        35       54",
                  "1: Yes         29        20       49",
                  "Total          48        55      103",
                  "")) &&
        identical(xt_after_blank(.r_one, "Crosstab: Volunteer by OwnsHome"),
                  character(0)))
check("R13 four categories, pinned whole: a blank line before each category after the first and before Total, none under the separator, one closing the table",
      identical(run_at(.r_cond, .r_ccap, 17L),
                c("Crosstab: Condition by SoughtHelp",
                  "Condition           0: No    1: Yes     Total",
                  "----------------    -----    ------    ------",
                  "1: Control          13         5        18",
                  "  (Row %)           72.2%     27.8%    100.0%",
                  "",
                  "2: CBT               9         5        14",
                  "  (Row %)           64.3%     35.7%    100.0%",
                  "",
                  "3: Mindfulness      13         4        17",
                  "  (Row %)           76.5%     23.5%    100.0%",
                  "",
                  "4: Support group    14         7        21",
                  "  (Row %)           66.7%     33.3%    100.0%",
                  "",
                  "Total               49        21        70",
                  "")))
.r_sp <- c("2: CBT", "3: Mindfulness", "4: Support group", "Total")
check("R14 each kind of sub-row brings the blank lines on its own: expected counts alone, row percentages alone, column percentages alone, residuals alone",
      identical(xt_after_blank(
                  raw_out(jcrosstab(Condition ~ SoughtHelp, cl_f,
                                    row.pct = FALSE, expected = TRUE)),
                  .r_ccap), .r_sp) &&
        identical(xt_after_blank(.r_cond, .r_ccap), .r_sp) &&
        identical(xt_after_blank(.r_colp, .r_ccap), .r_sp) &&
        identical(xt_after_blank(
                    raw_out(jcrosstab(Condition ~ SoughtHelp, cl_f,
                                      row.pct = FALSE,
                                      residuals = "adjusted")),
                    .r_ccap), .r_sp))
check("R15 with column percentages the Total row keeps its (Col %) row directly beneath it, and one blank line closes the table",
      identical(run_at(.r_colp, "Total                49        21        70",
                       3L),
                c("Total                49        21        70",
                  "  (Col %)           100.0%    100.0%    100.0%",
                  "")))

.r_clx <- function() raw_out(jcrosstab(SoughtHelp ~ Condition, cl_f,
                                       expected = TRUE, chisq = TRUE))
check("R16 the crosstab's gap follows the message width: the clinic table is 84 wide at four spaces -- four at a width of 84, two at 83 -- and the chi-square table under it keeps two at any width",
      { a <- .r_at(84L, .r_clx())
        b <- .r_at(83L, .r_clx())
        identical(gap_of(a, .n_cap), 4L) && identical(gap_of(b, .n_cap), 2L) &&
          identical(nchar(a[which(a == .n_cap)[1] + 2L]), 84L) &&
          identical(gap_of(a, "Chi-Square Test of Independence"), 2L) &&
          identical(gap_of(b, "Chi-Square Test of Independence"), 2L) })

# -- the two notes ------------------------------------------------------------
.r_ptr <- "To see the expected frequencies, add expected = TRUE."
check("R17 the pointer line prints only when the expected frequencies are NOT shown: with expected = TRUE the note is its two lines and a blank",
      identical(run_at(.r_e496,
                       "Note: 1 cell has an expected frequency less than 5 (minimum = 4.96).",
                       3L)[-1L],
                c("Chi-square results may not be reliable.", "")) &&
        !any(.r_e496 == .r_ptr) && !any(.r_e4998 == .r_ptr) &&
        sum(.k_x(f_x496) == .r_ptr) == 1L &&
        sum(.k_x(f_xpl) == .r_ptr) == 1L)

.r_full <- function(expr) {
  quiet(joutput("full"))
  on.exit(quiet(joutput(NULL)), add = TRUE)
  both_out(expr)
}
.r_adj <- "Note: Adjusted residuals are approximately normal under independence."
.r_f1 <- .r_full(jcrosstab(Volunteer ~ OwnsHome, cm_f, chisq = TRUE,
                           residuals = "adjusted"))
.r_f2 <- .r_full(jcrosstab(r ~ k, f_x496, chisq = TRUE,
                           residuals = "adjusted"))
.r_f3 <- .r_full(jcrosstab(Volunteer ~ OwnsHome, cm_f,
                           residuals = "adjusted"))
check("R18 the adjusted-residuals note has ONE blank line above it: under the chi-square table (it sat directly beneath), under the expected-frequency note, and under the crosstab when no test is asked for",
      identical(above(.r_f1, .r_adj),
                c("Continuity Correction     5.020     1  .025  103", "")) &&
        identical(above(.r_f2, .r_adj), c(.r_ptr, "")) &&
        identical(above(.r_f3, .r_adj),
                  c("Total           48          55          103", "")))

# =============================================================================
# S. jdummy's REGISTRATION LINES (S329)
# =============================================================================
# Two changes Jeff asked for walking format_walk.R Section 19 at v0.9.205's
# first delivery. (1) "Variable: Condition (haven_labelled)" named R's
# storage class, a word a user of the package need never meet; the
# parenthetical is gone for every kind of variable (jscreen's opt-in "Base R
# Type" column keeps the word: that is where R's own type is asked for).
# (2) The "Reference category:" line ends "(default; change with ref =)"
# when the default rule chose the reference, and carries nothing when the
# user named it -- on registration, when a registration is shown again, and
# in the jdummy() overview, which prints the code before the label. The
# registration records which (ref_default); one made before the field
# existed prints no tag.
cat("\n--- S. jdummy(): the registration lines ---\n")

.s_tag  <- " (default; change with ref =)"
.s_ref  <- function(ln) grep("^  Reference category: ", ln, value = TRUE)
.s_var  <- function(ln) grep("^  Variable: ", ln, value = TRUE)
.s_dm   <- function(...) raw_out(jdummy(...))
f_dm <- data.frame(fac = factor(c("a", "b", "c", "a")),
                   chr = c("x", "y", "z", "x"),
                   lgl = c(TRUE, FALSE, TRUE, FALSE),
                   num = c(1, 2, 3, 1), stringsAsFactors = FALSE)
quiet(jdummy(clear.all = TRUE))

.s_new <- .s_dm(cl_f, Condition)
check("S01 a default registration, pinned: the name alone on the Variable line (it read \"Condition (haven_labelled)\"), and the reference marked as the default",
      identical(run_at(.s_new, "Dummy Variable Registration", 5L),
                c("Dummy Variable Registration",
                  "  Variable: Condition",
                  "  Reference category: Condition_Control (default; change with ref =)",
                  "  Dummy variables: Condition_CBT, Condition_Mindfulness, Condition_Support_group",
                  "  Cases: 70 (0 missing)")))
check("S02 no storage class after the name for any kind of variable: labelled, factor, text, logical, numeric",
      { o <- c(.s_new, .s_dm(f_dm, fac, chr, lgl, num))
        identical(.s_var(o), c("  Variable: Condition", "  Variable: fac",
                               "  Variable: chr", "  Variable: lgl",
                               "  Variable: num")) &&
          !any(grepl("haven_labelled|\\((factor|character|logical|numeric)\\)",
                     o)) })
check("S03 a reference the user names carries no tag -- a label, a code, \"last\", \"first\" -- and \"auto\" typed in any case is still the default",
      identical(.s_ref(.s_dm(cl_f, Condition, ref = "CBT")),
                "  Reference category: Condition_CBT") &&
        identical(.s_ref(.s_dm(cl_f, Condition, ref = 3)),
                  "  Reference category: Condition_Mindfulness") &&
        identical(.s_ref(.s_dm(cl_f, Condition, ref = "last")),
                  "  Reference category: Condition_Support_group") &&
        identical(.s_ref(.s_dm(cl_f, Condition, ref = "first")),
                  "  Reference category: Condition_Control") &&
        identical(.s_ref(.s_dm(cl_f, Condition, ref = "AUTO")),
                  paste0("  Reference category: Condition_Control", .s_tag)))
check("S04 a registration shown again says what it said: the default one tagged, the named one not, the name alone on the Variable line",
      { quiet(jdummy(cl_f, Condition))
        a <- .s_dm(cl_f, Condition, show = TRUE)
        quiet(jdummy(cl_f, Condition, ref = "CBT"))
        b <- .s_dm(cl_f, Condition, show = TRUE)
        identical(.s_var(a), "  Variable: Condition") &&
          identical(.s_ref(a),
                    paste0("  Reference category: Condition_Control", .s_tag)) &&
          identical(.s_var(b), "  Variable: Condition") &&
          identical(.s_ref(b), "  Reference category: Condition_CBT") &&
          any(b == "    2: Condition_CBT*                   0                 1                  0                       0") })
check("S05 the jdummy() overview: the code before the label, the tag on the default registration only; two variables in one call each take the tag",
      { quiet(jdummy(clear.all = TRUE))
        two <- .s_dm(cl_f, Condition, Medication)
        quiet(jdummy(cl_f, Condition, ref = "CBT"))
        o <- .s_dm()
        identical(.s_ref(two),
                  c(paste0("  Reference category: Condition_Control", .s_tag),
                    paste0("  Reference category: Medication_No", .s_tag))) &&
          identical(.s_var(o), c("  Variable: Condition",
                                 "  Variable: Medication")) &&
          identical(.s_ref(o),
                    c("  Reference category: 2: Condition_CBT",
                      paste0("  Reference category: 0: Medication_No",
                             .s_tag))) })
check("S06 the tag is the registration's own record: it survives jsave() and jload(), and a registration without the field (an older file) prints no tag",
      { quiet(jdummy(clear.all = TRUE))
        quiet(jdummy(cl_f, Condition))
        tf <- file.path(tempdir(), "format_check_s06.rds")
        on.exit(unlink(tf), add = TRUE)
        quiet(jsave(cl_f, tf, overwrite = TRUE))
        quiet(jdummy(clear.all = TRUE))
        quiet(jload(tf, name = ".s_back", overwrite = TRUE, quiet = TRUE))
        back <- .s_dm(.s_back, Condition, show = TRUE)
        o <- getOption(".jst_dummy")
        o[[".s_back"]][[1L]]$ref_default <- NULL
        options(.jst_dummy = o)
        old <- .s_dm(.s_back, Condition, show = TRUE)
        identical(.s_ref(back),
                  paste0("  Reference category: Condition_Control", .s_tag)) &&
          identical(.s_ref(old), "  Reference category: Condition_Control") })
check("S07 control: jscreen's opt-in Base R Type column still names R's class -- the one place it is asked for",
      { m <- tab(raw_out(jscreen(cl_f, Condition, Stress, r.type = TRUE)),
                 "Variable Types")
        same(col_of(m, "Base R Type"), c("haven_labelled", "haven_labelled")) })
quiet(jdummy(clear.all = TRUE))

# =============================================================================
# SECTION T -- COLOR ONLY WHERE IT CAN BE DRAWN (S340, v0.9.214)
# =============================================================================
# The red titles and the yellow notes are ANSI escape sequences, which the
# RStudio Console draws as color and nearly everything else prints raw:
# "<ESC>[31mCross-Tabulation" in RGui, in a sink() capture, in a rendered
# document. Until 0.9.214 they were written unconditionally (the Session 118
# item). Jeff's S336 ruling: color in the RStudio Console, plain text
# everywhere else, by a check of the package's own. The Console is four
# things at once -- R is RStudio's own session process, the Console says it
# draws color, no sink() is diverting the output, no knitr run is in
# progress -- because a capture and a render both START inside RStudio.
# options(jstats.color = TRUE / FALSE) overrides the rule (documented in
# ?joutput). .jst_use_color() takes each signal as an argument, so every arm
# is tested here whatever front end runs the battery; the workstation's
# Console reading at S340 was GUI "RStudio", RSTUDIO_CONSOLE_COLOR "256".
cat("\n--- T. color only where it can be drawn ---\n")

# Taken through tryCatch (guard 3): on a master without the helper the
# checks below go red, where a bare lookup would halt the battery.
.t_use <- tryCatch(jstats:::.jst_use_color, error = function(e) function(...) NA)
# .t_raw(): a call's printed lines with NOTHING stripped (raw_out() strips).
.t_raw <- function(expr) suppressMessages(suppressWarnings(utils::capture.output(expr)))
.t_esc <- function(x) any(grepl("\033", x, fixed = TRUE))
# Column names no workspace is likely to hold: T06 and T08 call jfreq(zz_t_v) on
# the default frame, and a workspace object of the same name would be read
# in its place (the S338 dirty-entry lesson; a red cps_check.R leaves an x).
f_col  <- data.frame(zz_t_v = c(1, 2, 2, 3), zz_t_g = c(1, 1, 2, 2))

check("T01 the RStudio Console -- RStudio's own R process, the Console drawing color, no sink, no knitr run -- gets color",
      identical(.t_use(NULL, "RStudio", "256", 0L, FALSE), TRUE))
check("T02 each signal alone turns it off: a sink (capture.output is one), a knitr run, a Console that says it draws no color (unset, or 0), and R running outside RStudio's own process (a render, RGui, a terminal)",
      identical(.t_use(NULL, "RStudio", "256", 1L, FALSE), FALSE) &&
        identical(.t_use(NULL, "RStudio", "256", 0L, TRUE), FALSE) &&
        identical(.t_use(NULL, "RStudio", "", 0L, FALSE), FALSE) &&
        identical(.t_use(NULL, "RStudio", "0", 0L, FALSE), FALSE) &&
        identical(.t_use(NULL, "RTerm", "256", 0L, FALSE), FALSE) &&
        identical(.t_use(NULL, "Rgui", "", 0L, FALSE), FALSE) &&
        identical(.t_use(NULL, "X11", "", 0L, FALSE), FALSE))
check("T03 the switch overrides every signal, both ways: TRUE where nothing draws color, FALSE in the Console",
      identical(.t_use(TRUE, "Rgui", "", 3L, TRUE), TRUE) &&
        identical(.t_use(FALSE, "RStudio", "256", 0L, FALSE), FALSE))
check("T04 a value that is neither TRUE nor FALSE is no override: the rule decides",
      identical(.t_use("yes", "RStudio", "256", 0L, FALSE), TRUE) &&
        identical(.t_use(NA, "Rgui", "", 0L, FALSE), FALSE))
check("T05 the sink count is read from the session: inside a capture, with every other signal saying Console, it is FALSE (and with nothing passed at all)",
      { v <- w <- NULL
        invisible(utils::capture.output({
          v <- .t_use(NULL, "RStudio", "256", knitting = FALSE); w <- .t_use() }))
        identical(v, FALSE) && identical(w, FALSE) })
.t_off <- .t_raw(jfreq(f_col, zz_t_v))
check("T06 captured output is plain: no escape in a title, a note or a table (jfreq, jt, jscreen, joutput, and a yellow default-frame note)",
      !.t_esc(.t_off) && identical(.t_off[1], "Frequencies") &&
        !.t_esc(.t_raw(jt(zz_t_v ~ zz_t_g, data = f_col))) &&
        !.t_esc(.t_raw(jscreen(f_col))) && !.t_esc(.t_raw(joutput())) &&
        { quiet(juse(f_col)); v <- .t_raw(jfreq(zz_t_v)); quiet(juse(NULL))
          !.t_esc(v) && identical(v[2], "Using default data frame: f_col") })
options(jstats.color = TRUE)
.t_on <- .t_raw(jfreq(f_col, zz_t_v))
check("T07 options(jstats.color = TRUE) forces color into a capture: the title in red, exactly as it was always written",
      identical(.t_on[1], "\033[31mFrequencies") &&
        identical(.t_on[2], "\033[0m"))
check("T08 ... and the yellow note with it",
      { quiet(juse(f_col)); v <- .t_raw(jfreq(zz_t_v)); quiet(juse(NULL))
        identical(v[2], "\033[0m\033[33mUsing default data frame: f_col") })
check("T09 color adds the escapes and nothing else: with them removed, the two outputs are the same lines",
      identical(gsub("\033\\[[0-9;]*m", "", .t_on), .t_off))
options(jstats.color = FALSE)
check("T10 options(jstats.color = FALSE): plain, and the helper says so whatever the signals",
      !.t_esc(.t_raw(jfreq(f_col, zz_t_v))) &&
        identical(.t_use(gui = "RStudio", console_color = "256", sinks = 0L,
                         knitting = FALSE), FALSE))
options(jstats.color = NULL)
check("T11 the two helpers print their text unchanged when color is off, newline included",
      identical(utils::capture.output(jstats:::.cat_red("Title\n")), "Title") &&
        identical(utils::capture.output(jstats:::.cat_yellow("a note\n")), "a note"))

# =============================================================================
# SECTION U -- GAMES-HOWELL AFTER WELCH; A ONE-CASE GROUP (S341, v0.9.215)
# =============================================================================
# jaov(welch = TRUE, posthoc = TRUE) printed "Tukey HSD post-hoc tests are
# not applicable to Welch's ANOVA." and offered nothing (the S327 item). It
# now prints Games-Howell: each pair on the two groups' own variances and
# its own Welch-Satterthwaite df, p and the interval adjusted through the
# studentized range for k groups. The table takes the Tukey table's form
# and place plus a df column. The oracle is rstatix::games_howell_test()
# (0.7.2), run once in the sandbox on f_gh and pinned here as numbers --
# rstatix is not a dependency -- and, for two groups, stats::t.test(), whose
# Welch test the comparison then equals.
# With it, the Session 105 item: a group of ONE case. The standard ANOVA
# runs (the variance is pooled) and printed R's own "NaNs produced" above
# the descriptives, from qt() at 0 df for that group's interval; the cells
# are blank now, as its SD always was. Welch's ANOVA cannot run (one case
# has no variance) and stopped on R's own "not enough observations" after
# the descriptives; it is a house stop before them.
cat("\n--- U. Games-Howell; a one-case group ---\n")

# Unequal sizes and unequal spreads; group means 5, 7 and 11.
f_gh <- data.frame(g = c(rep("a", 6), rep("b", 8), rep("c", 4)),
                   y = c(4, 5, 6, 5, 4, 6,  2, 9, 4, 11, 6, 13, 1, 10,
                         10, 11, 12, 11),
                   stringsAsFactors = FALSE)
.u_ret <- quiet(jaov(y ~ g, data = f_gh, welch = TRUE, posthoc = TRUE))
.u_out <- raw_out(jaov(y ~ g, data = f_gh, welch = TRUE, posthoc = TRUE))
.u_ph  <- if (is.list(.u_ret)) .u_ret$posthoc else NULL
.u_cap <- "Games-Howell Post-Hoc Comparisons"
near   <- function(x, want, tol = 1e-8) {
  is.numeric(x) && length(x) == length(want) && all(abs(x - want) < tol)
}

check("U01 the returned comparisons equal rstatix's Games-Howell: differences 2, 6, 4, each interval and each df",
      is.data.frame(.u_ph) &&
        near(.u_ph$diff,  c(2, 6, 4)) &&
        near(.u_ph$lower, c(-2.603819178141, 4.388217238476, -0.614665915298)) &&
        near(.u_ph$upper, c(6.60381917814, 7.61178276152, 8.61466591530)) &&
        near(.u_ph$df,    c(7.75699317298, 7.02312138728, 7.90686103629)))
check("U02 ... and its adjusted p-values, to the three figures rstatix reports (.461, .0000292, .087)",
      is.data.frame(.u_ph) &&
        identical(signif(.u_ph$p, 3), c(0.461, 2.92e-05, 0.0874)) &&
        identical(unique(.u_ph$test), "Games-Howell"))
# Read from the helper since S346: jaov() prints and returns no post-hoc
# table for two groups (W18-W20).
check("U03 with two groups the comparison IS Welch's t-test: stats::t.test()'s p, df and interval",
      { d2 <- f_gh[f_gh$g != "c", ]
        r  <- jstats:::.jst_games_howell(d2$y, factor(d2$g))
        tt <- stats::t.test(y ~ g, data = d2)
        nrow(r) == 1L && near(r$p, tt$p.value, 1e-9) &&
          near(r$df, unname(tt$parameter)) &&
          near(c(r$lower, r$upper), -rev(as.numeric(tt$conf.int)), 1e-6) })
check("U04 the pairs are named and ordered as Tukey's are, later-earlier, so the two tables read alike",
      { tk <- quiet(jaov(y ~ g, data = f_gh, posthoc = TRUE))$posthoc
        identical(.u_ph$comparison, c("b-a", "c-a", "c-b")) &&
          identical(.u_ph$comparison, tk$comparison) &&
          near(.u_ph$diff, tk$diff) })
check("U05 the table: the Tukey table's five columns with df before p; statistics to three places, df to one, p as p",
      { m <- tab(.u_out, .u_cap)
        !is.null(m) &&
          identical(colnames(m), c("Comparison", "Mean Difference", "95% CI Lower",
                                   "95% CI Upper", "df", "p (adjusted)")) &&
          same(col_of(m, "Comparison"),      c("b-a", "c-a", "c-b")) &&
          same(col_of(m, "Mean Difference"), c("2.000", "6.000", "4.000")) &&
          same(col_of(m, "95% CI Lower"),    c("-2.604", "4.388", "-0.615")) &&
          same(col_of(m, "95% CI Upper"),    c("6.604", "7.612", "8.615")) &&
          same(col_of(m, "df"),              c("7.8", "7.0", "7.9")) &&
          same(col_of(m, "p (adjusted)"),    c(".461", "<.001", ".087")) })
check("U06 ... Comparison flush left, the rest block-centered, no line ending in padding",
      aligned(.u_out, .u_cap, left = "Comparison"))
check("U07 ... in the Tukey table's place: after the Welch table, its note and the eta-squared lines, one blank line above the caption, and the output ends one blank line after the last row",
      { o  <- both_out(jaov(y ~ g, data = f_gh, welch = TRUE, posthoc = TRUE))
        i  <- which(o == .u_cap)[1]
        e  <- which(startsWith(o, "(Note: Eta-squared is calculated"))[1]
        w  <- which(startsWith(o, "Welch's ANOVA:"))[1]
        !is.na(i) && !is.na(e) && !is.na(w) && w < e && i == e + 2L &&
          !nzchar(o[i - 1L]) && tail_blanks(o) == 1L && dbl_blanks(o) == 0L &&
          startsWith(o[length(o) - 1L], "c-b") })
check("U08 digits = 2 reaches the three statistics and leaves df at one place",
      { m <- tab(raw_out(jaov(y ~ g, data = f_gh, welch = TRUE, posthoc = TRUE,
                              digits = 2)), .u_cap)
        same(col_of(m, "Mean Difference"), c("2.00", "6.00", "4.00")) &&
          same(col_of(m, "95% CI Upper"),  c("6.60", "7.61", "8.61")) &&
          same(col_of(m, "df"),            c("7.8", "7.0", "7.9")) })
check("U09 post-hoc tests come from the output level too: at joutput(\"full\") a Welch call with no posthoc = prints the table; at standard it does not",
      { quiet(joutput("full"))
        a <- raw_out(jaov(y ~ g, data = f_gh, welch = TRUE))
        quiet(joutput(NULL))
        b <- raw_out(jaov(y ~ g, data = f_gh, welch = TRUE))
        any(a == .u_cap) && !any(b == .u_cap) })
check("U10 the returned posthoc: NULL when none was asked for; Tukey's own numbers, unrounded, for the standard ANOVA",
      { none <- quiet(jaov(y ~ g, data = f_gh, welch = TRUE, posthoc = FALSE))
        tk   <- quiet(jaov(y ~ g, data = f_gh, posthoc = TRUE))$posthoc
        ref  <- as.data.frame(stats::TukeyHSD(stats::aov(y ~ g, data = f_gh))[[1]])
        is.list(none) && is.null(none$posthoc) &&
          identical(unique(tk$test), "Tukey HSD") &&
          near(tk$diff, ref$diff) && near(tk$lower, ref$lwr) &&
          near(tk$upper, ref$upr) && near(tk$p, ref$`p adj`) &&
          near(tk$df, rep(15, 3)) })
check("U11 the standard post-hoc table is Tukey's still, five columns and no df",
      { m <- tab(raw_out(jaov(y ~ g, data = f_gh, posthoc = TRUE)),
                 "Tukey HSD Post-Hoc Comparisons")
        identical(colnames(m), c("Comparison", "Mean Difference", "95% CI Lower",
                                 "95% CI Upper", "p (adjusted)")) })
# Two constant groups: their pair has a standard error of 0, so no df, p or
# interval; the cells are blank and R says nothing.
f_gh0 <- data.frame(g = rep(c("a", "b", "c"), each = 3),
                    y = c(10.5, 10.5, 10.5,  11.5, 11.5, 11.5,  12.5, 13.5, 14.5),
                    stringsAsFactors = FALSE)
# Read from the helper since S346: jaov(welch = TRUE) stops for a group in
# which the outcome does not vary (W12), so no call reaches this pair.
check("U12 a pair of constant groups, in the helper: its difference is kept, its interval, df and p are NA, never NaN, and R says nothing",
      { w <- character(0)
        r <- withCallingHandlers(
          jstats:::.jst_games_howell(f_gh0$y, factor(f_gh0$g)),
          warning = function(c) { w <<- c(w, conditionMessage(c))
                                  invokeRestart("muffleWarning") })
        length(w) == 0L && identical(r$comparison, c("b-a", "c-a", "c-b")) &&
          near(r$diff[1L], 1) && near(r$df[2L], 2) &&
          all(is.na(unlist(r[1L, c("lower", "upper", "df", "p")]))) &&
          !any(is.nan(unlist(r[1L, c("lower", "upper", "df", "p")]))) &&
          !anyNA(unlist(r[2:3, c("lower", "upper", "df", "p")])) })

# The Levene note set off from its table (Jeff's S341 walk of format_walk.R
# Section 23: with no blank line between them "this makes things harder to
# read"), in jaov() and in jt(). Since S346 the note has three forms and
# five or six lines (section X pins the wording); f_gh and f_lv give the
# cautionary form, f_lvb, with two groups of one size, the middle one.
f_lv  <- data.frame(g = rep(c("a", "b"), c(6, 12)),
                    y = c(4.5, 5.5, 6.5, 5.5, 4.5, 6.5,
                          1.5, 9.5, 2.5, 12.5, 0.5, 13.5, 1.5, 10.5, 3.5, 11.5, 0.5, 14.5),
                    stringsAsFactors = FALSE)
f_lvb <- data.frame(g = rep(c("a", "b"), each = 8),
                    y = c(4.5, 5.5, 6.5, 5.5, 4.5, 6.5, 5.5, 5.5,
                          1.5, 9.5, 2.5, 12.5, 0.5, 13.5, 1.5, 10.5),
                    stringsAsFactors = FALSE)
.u_lev <- function(o, second) {
  i <- which(startsWith(o, "Note: Levene's test is significant"))[1]
  cap <- which(o == "Levene's Test for Homogeneity of Variance")[1]
  !is.na(i) && !is.na(cap) && i == cap + 5L && !nzchar(o[i - 1L]) &&
    nzchar(o[i - 2L]) && any(grepl(second, o[i:(i + 5L)], fixed = TRUE)) &&
    dbl_blanks(o) == 0L && tail_blanks(o) == 1L
}
check("U19 the Levene note has one blank line between it and its table, in jaov() and jt(), in both of its forms; nowhere two blank lines together",
      .u_lev(both_out(jaov(y ~ g, data = f_gh, diagnostics = TRUE)), "Both are beyond the usual guidelines") &&
        .u_lev(both_out(jaov(y ~ g, data = f_lvb, diagnostics = TRUE)), "Guidelines differ") &&
        .u_lev(both_out(jt(y ~ g, data = f_lv, diagnostics = TRUE)), "Both are beyond the usual guidelines") &&
        .u_lev(both_out(jt(y ~ g, data = f_lvb, diagnostics = TRUE)), "Guidelines differ"))
check("U20 control: a Levene's test that is not significant prints no note, and one blank line follows its table",
      { o <- both_out(jaov(y ~ g, data = f_aov, diagnostics = TRUE))
        cap <- which(o == "Levene's Test for Homogeneity of Variance")[1]
        !any(startsWith(o, "Note: Levene")) && !nzchar(o[cap + 4L]) &&
          nzchar(o[cap + 5L]) })

# The note's p-value (Session 341, the same walk): "p < .001", where the
# formatter's "<.001" pasted after "p = " read "p = <.001"; a larger p keeps
# "p = .008". Since S346 the first sentence states the test's result and
# nothing else, on a line of its own.
f_lv8 <- data.frame(g = rep(c("a", "b"), c(6, 12)),
                    y = c(4.5, 5.5, 6.5, 5.5, 4.5, 6.5,
                          3.5, 7.5, 4.5, 8.5, 2.5, 9.5, 3.5, 8.5, 4.5, 7.5, 5.5, 6.5),
                    stringsAsFactors = FALSE)
check("U21 the Levene note writes a p below .001 as \"p < .001\", never \"p = <.001\", in jaov() and jt(), and its first sentence is one line",
      { a <- both_out(jaov(y ~ g, data = f_gh, diagnostics = TRUE))
        b <- both_out(jt(y ~ g, data = f_lvb, diagnostics = TRUE))
        any(a == "Note: Levene's test is significant (p < .001).") &&
          any(b == "Note: Levene's test is significant (p < .001).") &&
          !any(grepl("= <", c(a, b), fixed = TRUE)) })
check("U22 ... and a p of .001 or more as \"p = \" and the value the table shows",
      { o <- both_out(jt(y ~ g, data = f_lv8, diagnostics = TRUE))
        m <- tab(o, "Levene's Test for Homogeneity of Variance")
        i <- which(startsWith(o, "Note: Levene's test is significant"))[1]
        !is.na(i) && !is.null(m) && !startsWith(m[1L, "p"], "<") &&
          identical(o[i], paste0("Note: Levene's test is significant (p = ",
                                 m[1L, "p"], ").")) })

# --- a group of one case ---
f_solo <- rbind(f_gh, data.frame(g = "solo", y = 9.5, stringsAsFactors = FALSE))
.u_err <- function(expr) tryCatch({ quiet(expr); "[no error]" },
                                  error = function(e) conditionMessage(e))
.u_stop <- function(expr) {
  # quiet() swallows a stop; take the condition where it is signalled.
  zz <- textConnection(".junk_u", "w", local = TRUE)
  sink(zz, type = "output")
  on.exit({ sink(type = "output"); close(zz) }, add = TRUE)
  tryCatch({ suppressMessages(suppressWarnings(expr)); "[no error]" },
           error = function(e) conditionMessage(e))
}
check("U13 the standard ANOVA with a one-case group: no warning of R's own (it printed \"NaNs produced\"), at the standard level and at full",
      { a <- both_out(jaov(y ~ g, data = f_solo))
        b <- both_out(jaov(y ~ g, data = f_solo, full = TRUE, diagnostics = TRUE))
        !identical(a, "[error]") && !identical(b, "[error]") &&
          !any(grepl("Warning", c(a, b), fixed = TRUE)) &&
          !any(grepl("NaN", c(a, b), fixed = TRUE)) })
check("U14 ... its row shows N and the mean, and blank cells for SD and both ends of the interval; the other rows keep theirs",
      { m <- tab(raw_out(jaov(y ~ g, data = f_solo, ci = TRUE)),
                 "Group Descriptives: y by g")
        !is.null(m) && nrow(m) == 4L &&
          identical(unname(m[4L, ]), c("solo", "1", "9.500", "", "", "")) &&
          all(nzchar(m[1:3, ])) })
check("U15 ... and Tukey's table includes it (the pooled variance serves a group of one)",
      { m <- tab(raw_out(jaov(y ~ g, data = f_solo, posthoc = TRUE)),
                 "Tukey HSD Post-Hoc Comparisons")
        !is.null(m) && nrow(m) == 6L && all(nzchar(m)) &&
          sum(startsWith(m[, "Comparison"], "solo-")) == 3L })
check("U16 Welch with a one-case group stops in the house voice, the group named, with the way out (it stopped on R's \"not enough observations\")",
      identical(.u_stop(jaov(y ~ g, data = f_solo, welch = TRUE)),
                paste0("jaov(): 'g' has 1 category with only 1 case (solo).\n",
                       "Welch's ANOVA requires at least 2 cases in every category.\n",
                       "The standard ANOVA can include it: run jaov() without ",
                       "welch = TRUE.")))
check("U17 ... in number for two such groups, and before the descriptives print",
      { d2 <- rbind(f_solo, data.frame(g = "uno", y = 1, stringsAsFactors = FALSE))
        e  <- .u_stop(jaov(y ~ g, data = d2, welch = TRUE, posthoc = TRUE))
        o  <- raw_out(jaov(y ~ g, data = d2, welch = TRUE))
        startsWith(e, "jaov(): 'g' has 2 categories with only 1 case (solo and uno).\n") &&
          grepl("The standard ANOVA can include them:", e, fixed = TRUE) &&
          !any(startsWith(o, "Group Descriptives")) })
check("U18 a labelled group is named by its label, as the comparison tables name it",
      { d3 <- f_solo
        d3$g <- haven::labelled(match(d3$g, c("a", "b", "c", "solo")),
                                c(Alpha = 1, Beta = 2, Gamma = 3, Lone = 4))
        startsWith(.u_stop(jaov(y ~ g, data = d3, welch = TRUE)),
                   "jaov(): 'g' has 1 category with only 1 case (Lone).\n") })

# =============================================================================
# SECTION V -- jdummy() ENDS ON ONE BLANK LINE; jscreen(): THE STAR AND ITS
#              LEGEND, AND A COLUMN R CANNOT TREAT AS VALUES (S342, v0.9.216)
# =============================================================================
# Fix Slate 4. (1) jdummy()'s registration ended on its reminder's last
# line, so a second call's title sat directly under it; it ends on one
# blank line now, written to stdout as joptions()'s is (the S329 item). (2)
# jscreen() printed "* coded other than 0/1; mean is not a proportion" for
# a 1/2 variable registered with jnumeric(), which has no Sub-class cell to
# carry the star -- the legend alone, or beside another variable's sub-class
# a cell holding "*" and nothing else (the S324 item). (3) jscreen() on a
# frame with a list column stopped on R's "invalid 'type' (list) of
# argument"; a list column, a raw one and a column that is itself a data
# frame are Unsupported rows now (the S213 item).
cat("\n--- V. jdummy()'s closing blank line; jscreen(): the star, unsupported columns ---\n")

f_v <- data.frame(Sex = rep(1:2, 10), Grp = rep(1:4, 5),
                  y = c(3, 5, 4, 8, 9, 7, 6, 2, 5, 9, 4, 6, 1, 8, 7, 3, 5, 6, 2, 9))
f_v15 <- data.frame(V = 1:15)
quiet(jdummy(clear.all = TRUE)); quiet(jnumeric(clear.all = TRUE))

.v_one <- both_out(jdummy(f_v, Grp))
check("V01 jdummy(): a registration ends on exactly one blank line, after its reminder (it ended on the reminder's last line), and no blank line is doubled",
      !identical(.v_one, "[error]") && tail_blanks(.v_one) == 1L &&
        dbl_blanks(.v_one) == 0L &&
        identical(.v_one[length(.v_one) - 1L], "  jload(\"f_v.rds\")"))
.v_two <- both_out({ jdummy(f_v, Grp); jdummy(f_v, Sex) })
check("V02 ... two calls in a row: one blank line between the first call's last line and the second's title",
      { i <- which(.v_two == "Dummy Variable Registration")
        length(i) == 2L && identical(.v_two[i[2L] - 1L], "") &&
          identical(.v_two[i[2L] - 2L], "  jload(\"f_v.rds\")") })
check("V03 ... the blank line is on stdout, not in the reminder: the printed lines alone end on two, the block's and the call's",
      { o <- raw_out(jdummy(f_v, Grp, Sex))
        tail_blanks(o) == 2L && identical(o[length(o) - 2L], "  Cases: 20 (0 missing)") })
check("V04 ... with show = TRUE, and when an existing registration is only shown: one closing blank line each, none doubled",
      { a <- both_out(jdummy(f_v, Grp, ref = 2, show = TRUE))
        b <- both_out(jdummy(f_v, Grp, show = TRUE))
        tail_blanks(a) == 1L && dbl_blanks(a) == 0L &&
          tail_blanks(b) == 1L && dbl_blanks(b) == 0L &&
          !any(startsWith(b, "Note: ")) })
check("V05 ... at the minimal level, where no reminder prints, the block's own blank line is the last: one, not two",
      { quiet(joutput("minimal", quiet = TRUE))
        a <- both_out(jdummy(f_v, Grp, Sex))
        quiet(joutput(NULL, quiet = TRUE))
        tail_blanks(a) == 1L && !any(startsWith(a, "Note: ")) })
check("V06 ... and after the unusual-declaration note, which follows the reminder: one; at the minimal level too, where that note is the only one",
      { a <- both_out(jdummy(f_v15, V))
        quiet(joutput("minimal", quiet = TRUE))
        b <- both_out(jdummy(f_v15, V))
        quiet(joutput(NULL, quiet = TRUE))
        last <- "  V declared as a dummy, but it has 15 categories"
        tail_blanks(a) == 1L && identical(a[length(a) - 1L], last) &&
          tail_blanks(b) == 1L && identical(b[length(b) - 1L], last) &&
          !any(startsWith(b, "Note: ")) })
quiet(jdummy(clear.all = TRUE))

.v_leg <- "* coded other than 0/1; mean is not a proportion"
.v_plain <- out(jscreen(f_v, Sex, Grp))
check("V07 control: a 1/2 variable as it comes is a dichotomy with the star, and the legend prints once, directly under the table",
      { m <- tab(.v_plain[.v_plain != .v_leg], "Variable Types")
        i <- which(.v_plain == .v_leg)
        same(col_of(m, "Sub-class"), c("dichotomy*", "4-category")) &&
          length(i) == 1L && startsWith(.v_plain[i - 1L], "Grp ") })
quiet(jnumeric(f_v, Sex))
.v_reg  <- out(jscreen(f_v, Sex))
.v_reg2 <- out(jscreen(f_v, Sex, Grp))
check("V08 registered with jnumeric() it is Numeric, has no sub-class, and the legend does NOT print (it printed with no starred row)",
      { m <- tab(.v_reg, "Variable Types")
        same(col_of(m, "jstats Class"), "Numeric") &&
          is.null(col_of(m, "Sub-class")) && !any(.v_reg == .v_leg) &&
          !any(grepl("*", .v_reg, fixed = TRUE)) })
check("V09 ... beside a variable that has a sub-class its cell is EMPTY (it held the star alone), and no legend prints; with stats = TRUE too",
      { m <- tab(.v_reg2, "Variable Types")
        s <- out(jscreen(f_v, Sex, Grp, stats = TRUE))
        same(col_of(m, "Sub-class"), c("", "4-category")) &&
          !any(.v_reg2 == .v_leg) && !any(s == .v_leg) &&
          same(col_of(tab(s, "Variable Types"), "Sub-class"), c("", "4-category")) })
quiet(jnumeric(clear.all = TRUE))
check("V10 control: registered with jdummy() it is still a dichotomy, starred, with the legend; and the returned table never carries the star",
      { quiet(jdummy(f_v, Sex))
        o <- out(jscreen(f_v, Sex, Grp)); r <- quiet(jscreen(f_v, Sex, Grp))
        quiet(jdummy(clear.all = TRUE))
        same(col_of(tab(o[o != .v_leg], "Variable Types"), "Sub-class"),
             c("dichotomy*", "4-category")) && sum(o == .v_leg) == 1L &&
          identical(r$SubClass, c("dichotomy", "4-category")) &&
          is.null(r$Star) })

f_un <- data.frame(id = 1:4, x = c(2.5, NA, 4, 8))
f_un$geom <- list(1:2, 1:3, "a", NA)        # cells of unequal length; NA in row 4
f_un$rw   <- as.raw(c(1, 1, 2, 3))
f_un$fr   <- data.frame(a = c(1, 1, 2, 3), b = c(4, 4, 2, 1))
.v_un <- out(jscreen(f_un))
check("V11 jscreen() on a frame with a list column, a raw column and a column that is a data frame runs (it stopped after its title on R's \"invalid 'type' (list) of argument\"), and each is an Unsupported row -- the table pinned",
      identical(run_at(.v_un, "Variable Types", 7L),
                c("Variable Types",
                  "Variable  jstats Class  Sub-class   Unique Values",
                  "--------  ------------  ----------  -------------",
                  "id        Categorical   4-category        4",
                  "x         Numeric                         3",
                  "geom      Unsupported                     3",
                  "rw        Unsupported                     3")) &&
        any(.v_un == "fr        Unsupported                     3"))
check("V12 ... the header counts: a list column's NA cell is a missing cell (row 4 here; x's is row 2, so two cases), a raw column and a data-frame column add none",
      identical(run_at(.v_un, "Data Screening", 5L),
                c("Data Screening", "  Cases: 4", "  Variables: 5",
                  "  Cases with missing data: 2", "  Variables with outliers: 0")) &&
        { r <- quiet(jscreen(f_un))
          !is.null(r) && identical(r$Missing, c(0L, 1L, 1L, 0L, 0L)) &&
            identical(r$Class, c("Categorical", "Numeric", "Unsupported",
                                 "Unsupported", "Unsupported")) })
check("V13 ... a frame of nothing else is screened too, the list column's own missing cell counted; and r.type names R's class for each",
      { o <- out(jscreen(f_un, geom, rw, fr, r.type = TRUE))
        m <- tab(o, "Variable Types")
        any(o == "  Cases with missing data: 1") &&
          same(col_of(m, "Base R Type"), c("list", "raw", "data.frame")) &&
          same(col_of(m, "jstats Class"), rep("Unsupported", 3L)) })
check("V14 ... through the single-column form as well (the wrapper stopped on R's \"arguments imply differing number of rows\")",
      { o <- out(jscreen(f_un$geom))
        same(col_of(tab(o, "Variable Types"), "jstats Class"), "Unsupported") })
check("V15 control: an ordinary frame's header is what it was -- cases with a missing value in any variable, a matrix column read by row",
      { f <- data.frame(a = c(1, NA, 3, 4), b = c("u", "v", NA, "w"),
                        stringsAsFactors = FALSE)
        f$m <- scale(c(1, 2, 3, 9))
        any(out(jscreen(f)) == "  Cases with missing data: 2") })
rm(list = intersect(c("f_v", "f_v15", "f_un", ".v_one", ".v_two", ".v_leg",
                      ".v_plain", ".v_reg", ".v_reg2", ".v_un"),
                    ls(all.names = TRUE)))


# =============================================================================
# SECTION W -- GROUPS A TEST CANNOT BE COMPUTED ON; GAMES-HOWELL BELOW 2 DF;
#              NO POST-HOC TABLE FOR TWO GROUPS; A GROUP EMPTIED BY MISSING
#              DATA (S346, v0.9.219)
# =============================================================================
# Fix Slate 8, first cut. (1) jt() with a group of one case: Welch's test
# stopped on R's "not enough 'y' observations" after the descriptives, and
# Student's printed "Cohen's d: NA"; two groups of one case each stopped on
# R's "not enough observations"; two groups with no variation between them
# on R's "data are essentially constant". Each is a house stop before any
# table, and Cohen's d is computed from the pooled SD the test used (the
# S341 item). (2) jaov() with every group constant printed an F of
# 27815876027865139260134097158144.000, and Welch's ANOVA with one constant
# group printed a table with blank F, df2 and p cells: both stop (the S341
# item). (3) Games-Howell with a pair below 2 degrees of freedom printed R's
# "NaNs produced" four times; the pair keeps its difference and df, its
# other cells are blank, and one line under the table says why. With two
# GROUPS no post-hoc table is printed or returned, after either ANOVA (the
# S344 item and its rider). (4) A group whose cases are all missing on the
# outcome was counted as a group: R's "grouping factor must have exactly 2
# levels" and "contrasts can be applied only to factors with 2 or more
# levels", a descriptives row with N 0, and a three-group refusal of a test
# that had two groups to compare. Groups are counted on the cases the test
# can use; a paired test keeps its rows, which it pairs by position.
cat("\n--- W. Groups a test cannot use; Games-Howell below 2 df; two groups ---\n")

# A group of one case, b.
f_w1 <- data.frame(g = c(rep("a", 6), "b"),
                   y = c(4.5, 5.5, 6.5, 5.5, 4.5, 6.5, 9.5),
                   stringsAsFactors = FALSE)
check("W01 jt(welch = TRUE) with a one-case group stops in the house voice, the group named, with the way out (it stopped on R's \"not enough 'y' observations\")",
      identical(.u_stop(jt(y ~ g, data = f_w1, welch = TRUE)),
                paste0("jt(): 'g' has 1 category with only 1 case (b).\n",
                       "Welch's t-test requires at least 2 cases in both categories.\n",
                       "Student's t-test can include it: run jt() without ",
                       "welch = TRUE.")))
check("W02 ... before the descriptives print, and a labelled group is named by its label",
      { d <- f_w1
        d$g <- haven::labelled(match(d$g, c("a", "b")), c(Many = 1, Lone = 2))
        !any(startsWith(raw_out(jt(y ~ g, data = f_w1, welch = TRUE)),
                        "Group Descriptives")) &&
          startsWith(.u_stop(jt(y ~ g, data = d, welch = TRUE)),
                     "jt(): 'g' has 1 category with only 1 case (Lone).\n") })
check("W03 Student's test runs with it, as stats::t.test() does: t, df and p; its row shows N and the mean and a blank SD",
      { o  <- raw_out(jt(y ~ g, data = f_w1))
        r  <- quiet(jt(y ~ g, data = f_w1))
        tt <- stats::t.test(y ~ g, data = f_w1, var.equal = TRUE)
        m  <- tab(o, "Group Descriptives: y by g")
        is.list(r) && near(r$t, unname(tt$statistic)) && near(r$df, 5) &&
          near(r$p, tt$p.value) && !is.null(m) &&
          identical(unname(m[2L, ]), c("b", "1", "9.500", "")) })
# effectsize::cohens_d(y ~ g, data = f_w1) (0.8.6), run once in the sandbox:
# -4.47213595499958. effectsize is not a dependency; the number is here.
check("W04 Cohen's d is computed from the pooled SD the test used -- the other group's -- and equals effectsize::cohens_d() (it printed \"Cohen's d: NA\")",
      { o <- raw_out(jt(y ~ g, data = f_w1))
        r <- quiet(jt(y ~ g, data = f_w1))
        a <- f_w1$y[f_w1$g == "a"]
        # The one-case group FIRST in the group order: the same d, the
        # other sign (the first group's term is the one that would be NA).
        z <- f_w1; z$g <- ifelse(z$g == "a", "z", "b")
        rz <- quiet(jt(y ~ g, data = z))
        any(o == "Cohen's d: -4.472") && is.list(r) &&
          near(r$cohens_d, -4.47213595499958, 1e-10) &&
          near(r$cohens_d, (mean(a) - 9.5) / stats::sd(a), 1e-10) &&
          is.list(rz) && near(rz$cohens_d, 4.47213595499958, 1e-10) })
check("W05 control: with two or more cases in each group the pooled d is what it was",
      { r <- quiet(jt(y ~ g, data = f_gh[f_gh$g != "c", ]))
        a <- f_gh$y[f_gh$g == "a"]; b <- f_gh$y[f_gh$g == "b"]
        sp <- sqrt((5 * stats::var(a) + 7 * stats::var(b)) / 12)
        is.list(r) && near(r$cohens_d, (mean(a) - mean(b)) / sp, 1e-10) })
check("W06 two groups of one case each: one stop, whichever test was asked for (R's \"not enough observations\")",
      { d <- data.frame(g = c("a", "b"), y = c(1.5, 2.5), stringsAsFactors = FALSE)
        want <- paste0("jt(): 'g' has 2 categories with only 1 case in each.\n",
                       "A t-test requires at least one category with 2 or more cases.")
        identical(.u_stop(jt(y ~ g, data = d)), want) &&
          identical(.u_stop(jt(y ~ g, data = d, welch = TRUE)), want) })

# No variation inside either group.
f_w0 <- data.frame(g = rep(c("a", "b"), each = 4),
                   y = rep(c(1.5, 2.5), each = 4), stringsAsFactors = FALSE)
.w_flat_t <- paste0("jt(): 'y' has the same value for every case in each ",
                    "category of 'g'.\n",
                    "A t-test requires variation within at least one category.")
check("W07 two constant groups: a house stop before any table, for Student's test and for Welch's (R's \"data are essentially constant\")",
      identical(.u_stop(jt(y ~ g, data = f_w0)), .w_flat_t) &&
        identical(.u_stop(jt(y ~ g, data = f_w0, welch = TRUE)), .w_flat_t) &&
        !any(startsWith(raw_out(jt(y ~ g, data = f_w0)), "Group Descriptives")))
check("W08 ... and the same stop for a constant group beside a group of one case, where the pooled variance is zero",
      identical(.u_stop(jt(y ~ g, data = data.frame(
        g = c(rep("a", 4), "b"), y = c(1.5, 1.5, 1.5, 1.5, 5.5),
        stringsAsFactors = FALSE))), .w_flat_t))
check("W09 control: ONE constant group is a test that can be computed, and both tests equal stats::t.test()",
      { d  <- data.frame(g = rep(c("a", "b"), each = 4),
                         y = c(1.5, 1.5, 1.5, 1.5, 2.5, 3.5, 4.5, 5.5),
                         stringsAsFactors = FALSE)
        s  <- quiet(jt(y ~ g, data = d)); w <- quiet(jt(y ~ g, data = d, welch = TRUE))
        is.list(s) && is.list(w) &&
          near(s$t, unname(stats::t.test(y ~ g, data = d, var.equal = TRUE)$statistic)) &&
          near(w$t, unname(stats::t.test(y ~ g, data = d)$statistic)) &&
          near(w$df, unname(stats::t.test(y ~ g, data = d)$parameter)) })

# jaov(): every group constant; one group constant.
f_w00 <- data.frame(g = rep(c("a", "b", "c"), each = 4),
                    y = rep(c(1.5, 2.5, 3.5), each = 4), stringsAsFactors = FALSE)
# At the pinned width the first sentence takes two lines under "jaov(): ".
.w_flat_a <- paste0("jaov(): 'y' has the same value for every case in each\n",
                    "category of 'g'.\n",
                    "An ANOVA requires variation within at least one category.")
check("W10 jaov() with every group constant stops, for the standard ANOVA and for Welch's, before any table (it printed F = 27815876027865139260134097158144.000)",
      identical(.u_stop(jaov(y ~ g, data = f_w00)), .w_flat_a) &&
        identical(.u_stop(jaov(y ~ g, data = f_w00, welch = TRUE)), .w_flat_a) &&
        !any(startsWith(raw_out(jaov(y ~ g, data = f_w00)), "Group Descriptives")))
check("W11 ... and so does a mix of constant groups and groups of one case, which leaves no variation either",
      identical(.u_stop(jaov(y ~ g, data = rbind(f_w00, data.frame(
        g = "solo", y = 9.5, stringsAsFactors = FALSE)))), .w_flat_a))
# b is constant; a and c vary.
f_w01 <- data.frame(g = rep(c("a", "b", "c"), c(6, 5, 6)),
                    y = c(4.5, 5.5, 6.5, 5.5, 4.5, 6.5,  3.5, 3.5, 3.5, 3.5, 3.5,
                          7.5, 8.5, 7.5, 9.5, 8.5, 7.5), stringsAsFactors = FALSE)
check("W12 Welch's ANOVA with one constant group stops in the form of the one-case stop, the group named (its table printed with blank F, df2 and p cells)",
      identical(.u_stop(jaov(y ~ g, data = f_w01, welch = TRUE)),
                paste0("jaov(): 'g' has 1 category in which 'y' does not vary (b).\n",
                       "Welch's ANOVA requires variation within every category.\n",
                       "The standard ANOVA can include it: run jaov() without ",
                       "welch = TRUE.")))
check("W13 ... in number for two such groups, named by their labels, before the descriptives",
      { d <- f_w01; d$y[d$g == "c"] <- 8.5
        d <- rbind(d, data.frame(g = "d", y = c(1.5, 2.5, 4.5), stringsAsFactors = FALSE))
        d$g <- haven::labelled(match(d$g, c("a", "b", "c", "d")),
                               c(Alpha = 1, Beta = 2, Gamma = 3, Delta = 4))
        e <- .u_stop(jaov(y ~ g, data = d, welch = TRUE, posthoc = TRUE))
        startsWith(e, "jaov(): 'g' has 2 categories in which 'y' does not vary (Beta\nand Gamma).\n") &&
          grepl("The standard ANOVA can include them:", e, fixed = TRUE) &&
          !any(startsWith(raw_out(jaov(y ~ g, data = d, welch = TRUE)),
                          "Group Descriptives")) })
check("W14 control: the standard ANOVA includes a constant group, and its F is stats::aov()'s",
      { r <- quiet(jaov(y ~ g, data = f_w01))
        f <- summary(stats::aov(y ~ g, data = f_w01))[[1]]$`F value`[1]
        is.list(r) && near(r$f, f) })

# Games-Howell with a group of two cases: b-a and d-b fall below 2 df.
f_w3 <- data.frame(g = c(rep("a", 6), rep("b", 2), rep("c", 8), rep("d", 3)),
                   y = c(4, 5, 6, 5, 4, 6,   9, 12,   2, 9, 4, 11, 6, 13, 1, 10,
                         7.5, 8, 9.5), stringsAsFactors = FALSE)
.w_o3 <- both_out(jaov(y ~ g, data = f_w3, welch = TRUE, posthoc = TRUE))
.w_r3 <- quiet(jaov(y ~ g, data = f_w3, welch = TRUE, posthoc = TRUE))
check("W15 a pair below 2 degrees of freedom: no warning of R's own and no NaN (it printed \"NaNs produced\" four times)",
      !identical(.w_o3, "[error]") && !any(grepl("Warning", .w_o3, fixed = TRUE)) &&
        !any(grepl("NaN", .w_o3, fixed = TRUE)))
check("W16 ... the pair keeps its difference and its df; its interval and p cells are blank, NA in the returned table; the other pairs keep theirs",
      { m <- tab(.w_o3, .u_cap)
        r <- if (is.list(.w_r3)) .w_r3$posthoc else NULL
        !is.null(m) && is.data.frame(r) &&
          identical(unname(m[1L, ]), c("b-a", "5.500", "", "", "1.1", "")) &&
          identical(unname(m[5L, ]), c("d-b", "-2.167", "", "", "1.3", "")) &&
          all(nzchar(m[c(2L, 3L, 4L, 6L), ])) &&
          all(is.na(unlist(r[c(1L, 5L), c("lower", "upper", "p")]))) &&
          !any(is.nan(unlist(r[c(1L, 5L), c("lower", "upper", "p")]))) &&
          near(r$df[c(1L, 5L)], c(1.12124269375, 1.32962154842), 1e-9) &&
          !anyNA(unlist(r[c(2L, 3L, 4L, 6L), c("lower", "upper", "df", "p")])) })
check("W17 ... and one line under the table says why, in number, one blank line above it, the output ending one blank line after it",
      { i <- which(.w_o3 == paste0("Note: 2 comparisons have fewer than 2 degrees of freedom, ",
                                   "so their"))[1]
        o1 <- both_out(jaov(y ~ g, data = f_w3[f_w3$g != "d", ], welch = TRUE,
                            posthoc = TRUE))
        j <- which(o1 == paste0("Note: 1 comparison has fewer than 2 degrees of freedom, ",
                                "so its confidence"))[1]
        !is.na(i) && identical(.w_o3[i + 1L], "confidence intervals and p-values cannot be computed.") &&
          !nzchar(.w_o3[i - 1L]) && startsWith(.w_o3[i - 2L], "d-c") &&
          tail_blanks(.w_o3) == 1L && dbl_blanks(.w_o3) == 0L &&
          i + 2L == length(.w_o3) &&
          !is.na(j) && identical(o1[j + 1L], "interval and p-value cannot be computed.") })
check("W18 control: with 2 or more degrees of freedom in every pair there is no such line",
      !any(grepl("degrees of freedom", .u_out, fixed = TRUE)) &&
        !any(grepl("degrees of freedom",
                   both_out(jaov(y ~ g, data = f_gh, posthoc = TRUE)), fixed = TRUE)))

# Two groups: the ANOVA is the only comparison.
f_w2 <- f_gh[f_gh$g != "c", ]
.w_two <- c("Note: Post-hoc comparisons are not shown for 2 groups: the test above is the",
            "only comparison.")
.w_has2 <- function(o) {
  i <- which(o == .w_two[1L])[1]
  !is.na(i) && identical(o[i + 1L], .w_two[2L]) && !nzchar(o[i - 1L]) &&
    nzchar(o[i - 2L]) && tail_blanks(o) == 1L && dbl_blanks(o) == 0L &&
    i + 2L == length(o) && !any(grepl("Post-Hoc Comparisons", o, fixed = TRUE))
}
check("W19 two groups and posthoc = TRUE: no post-hoc table after the standard ANOVA or after Welch's, and one line in its place (each printed a one-row table whose p repeated the test's)",
      .w_has2(both_out(jaov(y ~ g, data = f_w2, posthoc = TRUE))) &&
        .w_has2(both_out(jaov(y ~ g, data = f_w2, welch = TRUE, posthoc = TRUE))))
check("W20 ... nothing is returned as posthoc, and at joutput(\"full\") the line stands in for the table the level would print",
      { a <- quiet(jaov(y ~ g, data = f_w2, posthoc = TRUE))
        b <- quiet(jaov(y ~ g, data = f_w2, welch = TRUE, posthoc = TRUE))
        quiet(joutput("full"))
        o <- both_out(jaov(y ~ g, data = f_w2))
        quiet(joutput(NULL))
        is.list(a) && is.null(a$posthoc) && is.list(b) && is.null(b$posthoc) &&
          sum(o == .w_two[1L]) == 1L &&
          !any(grepl("Post-Hoc Comparisons", o, fixed = TRUE)) })
check("W21 control: three groups keep their table and get no such line; two groups with no post-hoc test asked for get neither",
      { a <- both_out(jaov(y ~ g, data = f_gh, posthoc = TRUE))
        b <- both_out(jaov(y ~ g, data = f_w2))
        any(a == "Tukey HSD Post-Hoc Comparisons") && !any(a == .w_two[1L]) &&
          !any(b == .w_two[1L]) && !any(grepl("Post-Hoc", b, fixed = TRUE)) })

# A group whose cases are all missing on the outcome is not a group of the
# analysis. Groups p, q, r; every case of r is missing y.
f_wm <- data.frame(g = rep(c("p", "q", "r"), each = 5),
                   y = c(4.5, 5.5, 6.5, 5.5, 4.5,  7.5, 9.5, 8.5, 7.5, 9.5,
                         rep(NA, 5)), stringsAsFactors = FALSE)
check("W22 jt(), two groups in the data and one with no case to use: a house stop that says why the count is 1 (R's \"grouping factor must have exactly 2 levels\", under a descriptives row with N 0)",
      identical(.u_stop(jt(y ~ g, data = f_wm[f_wm$g != "p", ])),
                paste0("jt(): 'g' has 1 category.\n",
                       "A t-test requires exactly 2.\n",
                       "Cases with a missing 'y' are not counted.")))
check("W23 jt(), three groups in the data and two with cases: the test is those two groups' -- stats::t.test() on the cases with an outcome -- with two descriptives rows (it was refused as an ANOVA's)",
      { r  <- quiet(jt(y ~ g, data = f_wm))
        m  <- tab(raw_out(jt(y ~ g, data = f_wm)), "Group Descriptives: y by g")
        tt <- stats::t.test(y ~ g, data = f_wm[!is.na(f_wm$y), ], var.equal = TRUE)
        is.list(r) && near(r$t, unname(tt$statistic)) && near(r$df, 8) &&
          !is.null(m) && identical(unname(m[, "Group"]), c("p", "q")) &&
          identical(unname(m[, "N"]), c("5", "5")) })
check("W24 jaov(): the emptied group has no descriptives row and F is stats::aov()'s; with one group left, the stop (R's \"contrasts can be applied only to factors with 2 or more levels\")",
      { r <- quiet(jaov(y ~ g, data = f_wm))
        m <- tab(raw_out(jaov(y ~ g, data = f_wm)), "Group Descriptives: y by g")
        f <- summary(stats::aov(y ~ g, data = f_wm))[[1]]$`F value`[1]
        is.list(r) && near(r$f, f) && near(r$df1, 1) && !is.null(m) &&
          identical(unname(m[, "Group"]), c("p", "q")) &&
          identical(.u_stop(jaov(y ~ g, data = f_wm[f_wm$g != "p", ])),
                    paste0("jaov(): 'g' has 1 category.\n",
                           "An ANOVA requires at least 2 groups.\n",
                           "Cases with a missing 'y' are not counted.")) })
check("W25 a labelled group keeps each remaining row beside its own label and mean when a MIDDLE group is the one emptied",
      { d <- f_wm
        d$g <- haven::labelled(match(d$g, c("p", "r", "q")),
                               c(First = 1, Emptied = 2, Third = 3))
        m <- tab(raw_out(jaov(y ~ g, data = d)), "Group Descriptives: y by g")
        s <- tab(raw_out(jt(y ~ g, data = d)), "Group Descriptives: y by g")
        !is.null(m) && !is.null(s) &&
          identical(unname(m[, "Group"]), c("1: First", "3: Third")) &&
          identical(unname(m[, "Mean"]), c("5.300", "8.500")) &&
          identical(unname(s[, "Group"]), c("1: First", "3: Third")) &&
          identical(unname(s[, "Mean"]), c("5.300", "8.500")) })
check("W26 control: with no group emptied the count stops say nothing of missing data",
      { d <- f_wm; d$y[11:15] <- c(1.5, 2.5, 3.5, 2.5, 1.5); d$y[3L] <- NA
        e <- .u_stop(jt(y ~ g, data = d))
        identical(e, paste0("jt(): 'g' has 3 categories.\nA t-test requires exactly 2.\n",
                            "Use jaov() for more than 2 categories.")) })
check("W27 control: a paired test still pairs by position before it drops a pair with a missing value -- the pair, not the one case, is removed",
      { d <- data.frame(g = rep(c("pre", "post"), each = 5),
                        y = c(4.5, NA, 6.5, 5.5, 4.5,  5.5, 9.5, 8.5, 6.5, 6.5),
                        stringsAsFactors = FALSE)
        d$g <- factor(d$g, levels = c("pre", "post"))
        r  <- quiet(jt(y ~ g, data = d, paired = TRUE))
        tt <- stats::t.test(c(4.5, 6.5, 5.5, 4.5), c(5.5, 8.5, 6.5, 6.5), paired = TRUE)
        is.list(r) && near(r$t, unname(tt$statistic)) && near(r$df, 3) })
rm(list = intersect(c("f_w1", "f_w0", "f_w00", "f_w01", "f_w3", "f_w2", "f_wm",
                      ".w_flat_t", ".w_flat_a", ".w_o3", ".w_r3", ".w_two",
                      ".w_has2"),
                    ls(all.names = TRUE)))


# =============================================================================
# SECTION X -- DIAGNOSTICS IN jt() AND jaov(): ONE ARGUMENT, APART FROM THE
#              LEVELS; THE LEVENE NOTE IN THREE FORMS (S346, v0.9.219)
# =============================================================================
# Jeff's ruling of 8 October 2026, amending ruling R14. Levene's test is one
# of the diagnostics: jt() and jaov() take diagnostics = (TRUE, FALSE or
# "levene") in place of levene =, joutput() stores the same setting for
# every call, and no output level turns it on -- joutput("full") and
# full = TRUE printed Levene's table until v0.9.219. Under a significant
# test the note states the two ratios that decide how much it matters and
# then one of three verdicts, because the textbooks give different cutoffs:
# "usually still acceptable" (sizes within 1.25 and SDs within 2), "the
# p-value ... may not be reliable" (sizes beyond 1.5 and SDs beyond 2),
# "guidelines differ" between them. It printed "the standard test remains
# appropriate" whenever the sizes were within 1.5, whatever the SDs. The
# note is the table's interpretation and prints with it, except at the
# minimal level.
cat("\n--- X. Diagnostics in jt() and jaov(); the Levene note ---\n")

# .x_mk(): groups of the given sizes, SDs and means, the SDs exact to three
# places, so a fixture sits where it is meant to between the note's zones.
.x_mk <- function(n, s, m) {
  y <- unlist(Map(function(k, sd, mu) {
    z <- stats::qnorm(stats::ppoints(k))
    mu + sd * z / stats::sd(z)
  }, n, s, m))
  data.frame(g = rep(letters[seq_along(n)], n), y = round(y, 3),
             stringsAsFactors = FALSE)
}
# .x_note(): the note as printed, from its first line to the line before
# the descriptives' caption, the blank line after it dropped.
.x_note <- function(o) {
  i <- which(startsWith(o, "Note: Levene's test is significant"))[1]
  j <- which(startsWith(o, "Group Descriptives"))[1]
  if (is.na(i) || is.na(j)) return(character(0))
  o[i:(j - 2L)]
}
.x_lev <- "Levene's Test for Homogeneity of Variance"
f_x1 <- .x_mk(c(30, 30, 26), c(1, 1.4, 1.9), c(5, 6, 7))   # 1.2 and 1.9
f_x2 <- .x_mk(c(30, 24, 20), c(1, 1, 2.1),   c(5, 6, 7))   # 1.5 and 2.1
f_x3 <- .x_mk(c(40, 20, 20), c(1, 1, 2.6),   c(5, 6, 7))   # 2.0 and 2.6
f_y1 <- .x_mk(c(40, 40), c(1, 1.9), c(5, 6))               # same size, 1.9
f_y2 <- .x_mk(c(42, 40), c(1, 2.4), c(5, 6))               # 1.05 and 2.4
f_y3 <- .x_mk(c(40, 20), c(1, 2.6), c(5, 6))               # 2.0 and 2.6

check("X01 jaov(), sizes within 1.25 and SDs within 2: the two ratios, then \"usually still acceptable\", then the help page -- pinned whole",
      identical(.x_note(both_out(jaov(y ~ g, data = f_x1, diagnostics = TRUE))),
                c("Note: Levene's test is significant (p = .011).",
                  "The largest group is 1.2 times the smallest, and the largest SD is 1.9 times",
                  "the smallest.",
                  "Both are within the usual guidelines, so the standard ANOVA is usually",
                  "still acceptable.",
                  "See ?jaov.")))
check("X02 ... between the two: \"Guidelines differ\", and Welch's ANOVA named with its argument (it read \"the standard test remains appropriate\" at any SD ratio)",
      identical(.x_note(both_out(jaov(y ~ g, data = f_x2, diagnostics = TRUE))),
                c("Note: Levene's test is significant (p < .001).",
                  "The largest group is 1.5 times the smallest, and the largest SD is 2.1 times",
                  "the smallest.",
                  "Guidelines differ on whether the standard ANOVA is acceptable at",
                  "these values.",
                  "Welch's ANOVA does not assume equal variances: welch = TRUE.",
                  "See ?jaov.")))
check("X03 ... sizes beyond 1.5 and SDs beyond 2: the p-value \"may not be reliable\", with no word on which way it errs",
      identical(.x_note(both_out(jaov(y ~ g, data = f_x3, diagnostics = TRUE))),
                c("Note: Levene's test is significant (p < .001).",
                  "The largest group is 2.0 times the smallest, and the largest SD is 2.6 times",
                  "the smallest.",
                  "Both are beyond the usual guidelines, so the p-value of the standard ANOVA",
                  "may not be reliable.",
                  "Welch's ANOVA does not assume equal variances: welch = TRUE.",
                  "See ?jaov.")))
check("X04 jt() has the same three forms in its own words: Student's and Welch's t-test, a larger and a smaller group, ?jt",
      identical(.x_note(both_out(jt(y ~ g, data = f_y1, diagnostics = TRUE))),
                c("Note: Levene's test is significant (p < .001).",
                  "The groups are the same size, and the larger SD is 1.9 times the smaller.",
                  "Both are within the usual guidelines, so Student's t-test is usually",
                  "still acceptable.",
                  "See ?jt.")) &&
        identical(.x_note(both_out(jt(y ~ g, data = f_y2, diagnostics = TRUE))),
                  c("Note: Levene's test is significant (p < .001).",
                    "The larger group is 1.05 times the smaller, and the larger SD is 2.4 times",
                    "the smaller.",
                    "Guidelines differ on whether Student's t-test is acceptable at these values.",
                    "Welch's t-test does not assume equal variances: welch = TRUE.",
                    "See ?jt.")) &&
        identical(.x_note(both_out(jt(y ~ g, data = f_y3, diagnostics = TRUE))),
                  c("Note: Levene's test is significant (p < .001).",
                    "The larger group is 2.0 times the smaller, and the larger SD is 2.6 times",
                    "the smaller.",
                    "Both are beyond the usual guidelines, so the p-value of Student's t-test may",
                    "not be reliable.",
                    "Welch's t-test does not assume equal variances: welch = TRUE.",
                    "See ?jt.")))
# The zones, read from the helper on groups a hair inside and outside each
# edge. .x_form(): which verdict the note gives for these sizes and SDs.
.x_form <- function(n, s) {
  d <- .x_mk(n, s, rep(5, length(n)))
  o <- paste(utils::capture.output(
    jstats:::.jst_levene_note(0.01, d$y, factor(d$g), "jaov")), collapse = " ")
  if (grepl("usually still acceptable", o, fixed = TRUE)) "within"
  else if (grepl("Guidelines differ", o, fixed = TRUE)) "differ"
  else if (grepl("may not be reliable", o, fixed = TRUE)) "beyond"
  else "none"
}
check("X05 the reassuring form needs BOTH: sizes at 1.25 with SDs at 1.99 give it; sizes at 1.3, or SDs at 2.05, do not",
      identical(.x_form(c(25, 20), c(1, 1.99)), "within") &&
        identical(.x_form(c(26, 20), c(1, 1.99)), "differ") &&
        identical(.x_form(c(25, 20), c(1, 2.05)), "differ") &&
        identical(.x_form(c(20, 20, 20), c(1, 1.5, 1.99)), "within"))
check("X06 the cautionary form needs BOTH beyond: sizes at 1.55 with SDs at 2.05 give it; sizes at 1.5, or SDs at 1.99, do not, however far the other is",
      identical(.x_form(c(31, 20), c(1, 2.05)), "beyond") &&
        identical(.x_form(c(30, 20), c(1, 4)), "differ") &&
        identical(.x_form(c(60, 20), c(1, 1.99)), "differ") &&
        identical(.x_form(c(20, 20), c(1, 5)), "differ"))
check("X07 a ratio is shown to one place, and to two where one would mislead: \"1.05 times\" for groups of 21 and 20, \"2.03 times\" over a verdict that 2.0 would contradict; a constant group is \"the smallest SD is 0\"",
      { a <- utils::capture.output(jstats:::.jst_levene_note(
               0.01, c(.x_mk(c(21, 20), c(1, 1.5), c(5, 5))$y),
               factor(rep(c("a", "b"), c(21, 20))), "jt"))
        e <- .x_mk(c(31, 20), c(1, 2.03), c(5, 5))
        e <- paste(utils::capture.output(jstats:::.jst_levene_note(
               0.01, e$y, factor(e$g), "jt")), collapse = " ")
        b <- utils::capture.output(jstats:::.jst_levene_note(
               0.01, c(rep(3.5, 5), 1.5, 2.5, 3.5, 4.5, 5.5, 4.5, 2.5, 6.5, 0.5, 3.5),
               factor(rep(c("a", "b", "c"), each = 5)), "jaov"))
        # Every group constant never reaches the note from jt() or jaov(),
        # which stop first; the helper still answers, with no 0 / 0.
        z <- tryCatch(utils::capture.output(jstats:::.jst_levene_note(
               0.01, rep(c(3, 5, 8), each = 4),
               factor(rep(c("a", "b", "c"), each = 4)), "jaov")),
             error = function(e) "error")
        any(grepl("The groups are the same size, and the smallest SD is 0.", z, fixed = TRUE)) &&
          any(grepl("The larger group is 1.05 times the smaller", a, fixed = TRUE)) &&
          grepl("The larger group is 1.6 times the smaller, and the larger SD is 2.03 times the smaller.",
                e, fixed = TRUE) &&
          grepl("Both are beyond the usual guidelines", e, fixed = TRUE) &&
          any(grepl("The groups are the same size, and the smallest SD is 0.", b, fixed = TRUE)) &&
          any(grepl("Guidelines differ", b, fixed = TRUE)) })
check("X08 no note: a test that is not significant, Welch's test run, or a group of one case (no SD to compare)",
      { ns <- utils::capture.output(jstats:::.jst_levene_note(0.05, f_x3$y, factor(f_x3$g), "jaov"))
        w  <- both_out(jaov(y ~ g, data = f_x3, welch = TRUE, diagnostics = TRUE))
        s1 <- utils::capture.output(jstats:::.jst_levene_note(
                0.01, c(f_y3$y, 9.5), factor(c(f_y3$g, "c")), "jaov"))
        wt <- both_out(jt(y ~ g, data = f_y3, welch = TRUE, diagnostics = TRUE))
        length(ns) == 0L && length(s1) == 0L &&
          any(w == .x_lev) && !any(startsWith(w, "Note: Levene")) &&
          any(wt == .x_lev) && !any(startsWith(wt, "Note: Levene")) })
check("X09 the note is the table's interpretation: with it at the standard and full levels, without it at minimal, where the table still prints",
      { got <- lapply(c("minimal", "standard", "full"), function(lv) {
          quiet(joutput(lv))
          o <- both_out(jaov(y ~ g, data = f_x3, diagnostics = TRUE))
          c(table = any(o == .x_lev), note = any(startsWith(o, "Note: Levene")))
        })
        quiet(joutput(NULL))
        identical(got, list(c(table = TRUE, note = FALSE), c(table = TRUE, note = TRUE),
                            c(table = TRUE, note = TRUE))) })
.x_has <- function(expr) any(both_out(expr) == .x_lev)
check("X10 no level prints Levene's test: not joutput(\"full\"), not full = TRUE, in jt() or jaov() (both printed it until v0.9.219)",
      { quiet(joutput("full"))
        a <- .x_has(jaov(y ~ g, data = f_x3)); b <- .x_has(jt(y ~ g, data = f_y3))
        quiet(joutput(NULL))
        !a && !b && !.x_has(jaov(y ~ g, data = f_x3, full = TRUE)) &&
          !.x_has(jt(y ~ g, data = f_y3, full = TRUE)) &&
          # ... and full = TRUE is otherwise what it was: post-hoc tests, the interval.
          any(both_out(jaov(y ~ g, data = f_x3, full = TRUE)) == "Tukey HSD Post-Hoc Comparisons") })
check("X11 diagnostics = TRUE and diagnostics = \"levene\" print it at any level; FALSE and no argument do not",
      .x_has(jaov(y ~ g, data = f_x3, diagnostics = TRUE)) &&
        .x_has(jaov(y ~ g, data = f_x3, diagnostics = "levene")) &&
        .x_has(jt(y ~ g, data = f_y3, diagnostics = TRUE)) &&
        .x_has(jt(y ~ g, data = f_y3, diagnostics = "levene")) &&
        !.x_has(jaov(y ~ g, data = f_x3, diagnostics = FALSE)) &&
        !.x_has(jaov(y ~ g, data = f_x3)) && !.x_has(jt(y ~ g, data = f_y3)))
check("X12 joutput(diagnostics = ) sets it for every call: TRUE, or a set naming \"levene\"; a set naming only the models' diagnostics leaves these two alone; the call's own FALSE wins",
      { quiet(joutput(diagnostics = TRUE))
        a <- .x_has(jaov(y ~ g, data = f_x3)) && .x_has(jt(y ~ g, data = f_y3)) &&
             !.x_has(jaov(y ~ g, data = f_x3, diagnostics = FALSE))
        quiet(joutput(diagnostics = c("vif", "levene")))
        b <- .x_has(jaov(y ~ g, data = f_x3))
        quiet(joutput(diagnostics = c("vif", "qq")))
        c <- !.x_has(jaov(y ~ g, data = f_x3)) && .x_has(jaov(y ~ g, data = f_x3, diagnostics = TRUE))
        quiet(joutput(NULL))
        a && b && c && !.x_has(jaov(y ~ g, data = f_x3)) })
check("X13 a level call leaves the setting as it was, in both directions",
      { quiet(joutput(diagnostics = TRUE)); quiet(joutput("minimal")); quiet(joutput("full"))
        a <- .x_has(jt(y ~ g, data = f_y3))
        quiet(joutput(diagnostics = FALSE)); quiet(joutput("full"))
        b <- .x_has(jt(y ~ g, data = f_y3))
        quiet(joutput(NULL))
        a && !b })
check("X14 levene = is refused with the name that replaced it, before any output (R's own \"unused argument\" otherwise)",
      identical(.u_stop(jaov(y ~ g, data = f_x3, levene = TRUE)),
                "jaov(): 'levene' is not valid. Did you mean `diagnostics`?") &&
        identical(.u_stop(jt(y ~ g, data = f_y3, levene = TRUE)),
                  "jt(): 'levene' is not valid. Did you mean `diagnostics`?") &&
        identical(raw_out(jaov(y ~ g, data = f_x3, levene = TRUE))[1L],
                  "[error] jaov(): 'levene' is not valid. Did you mean `diagnostics`?"))
check("X15 a name that is not one of the function's diagnostics stops, pinned whole: another function's, a misspelling, a number",
      identical(.u_stop(jaov(y ~ g, data = f_x3, diagnostics = "vif")),
                paste0("jaov(): \"vif\" is not a diagnostic of jaov().\n",
                       "`diagnostics` must be TRUE, FALSE, or \"levene\".")) &&
        identical(.u_stop(jt(y ~ g, data = f_y3, diagnostics = "leven")),
                  paste0("jt(): \"leven\" is not a diagnostic of jt().\n",
                         "`diagnostics` must be TRUE, FALSE, or \"levene\".")) &&
        identical(.u_stop(jt(y ~ g, data = f_y3, diagnostics = 1)),
                  "jt(): `diagnostics` must be TRUE, FALSE, or \"levene\"."))
check("X16 control: a paired test has no Levene's test and says so when diagnostics are asked for, as it did",
      { d <- data.frame(g = factor(rep(c("pre", "post"), each = 5), levels = c("pre", "post")),
                        y = c(4.5, 5.5, 6.5, 5.5, 4.5,  5.5, 9.5, 8.5, 6.5, 6.5))
        o <- both_out(jt(y ~ g, data = d, paired = TRUE, diagnostics = TRUE))
        any(o == "Note: Levene's test is not applicable for paired samples.") &&
          !any(o == .x_lev) })
rm(list = intersect(c(".x_mk", ".x_note", ".x_lev", ".x_form", ".x_has",
                      "f_x1", "f_x2", "f_x3", "f_y1", "f_y2", "f_y3"),
                    ls(all.names = TRUE)))



# =============================================================================
# SECTION Y -- A PAIRED t-TEST AND THE DIAGNOSTICS SETTING (S347, v0.9.220)
# =============================================================================
# A paired t-test has no Levene's test. Under joutput(diagnostics = TRUE)
# every paired jt() printed "Note: Levene's test is not applicable for paired
# samples." -- about a test the call had not asked for. The note is said when
# the call asks for Levene's test, and not when the setting is the session's
# (the S346 item).
cat("\n--- Y. A paired t-test and the diagnostics setting ---\n")
f_y <- data.frame(g = factor(rep(c("pre", "post"), each = 5), levels = c("pre", "post")),
                  y = c(4.5, 5.5, 6.5, 5.5, 4.5,  5.5, 9.5, 8.5, 6.5, 6.5))
.y_note <- "Note: Levene's test is not applicable for paired samples."
check("Y01 joutput(diagnostics = TRUE): a paired t-test says nothing of Levene's test (it printed the note on every call)",
      local({ quiet(joutput(diagnostics = TRUE, quiet = TRUE))
        o <- both_out(jt(y ~ g, data = f_y, paired = TRUE))
        quiet(joutput(NULL))
        !any(o == .y_note) && !any(o == "Levene's Test for Homogeneity of Variance") &&
          any(startsWith(o, "Paired Samples T-Test Results")) }))
check("Y02 ... while the call's own diagnostics = TRUE or \"levene\" still says it, under the setting or without",
      local({ a <- both_out(jt(y ~ g, data = f_y, paired = TRUE, diagnostics = "levene"))
        quiet(joutput(diagnostics = TRUE, quiet = TRUE))
        b <- both_out(jt(y ~ g, data = f_y, paired = TRUE, diagnostics = TRUE))
        quiet(joutput(NULL))
        any(a == .y_note) && any(b == .y_note) }))
check("Y03 control: the setting with the call's own FALSE, and no setting at all, print no note",
      local({ quiet(joutput(diagnostics = TRUE, quiet = TRUE))
        a <- both_out(jt(y ~ g, data = f_y, paired = TRUE, diagnostics = FALSE))
        quiet(joutput(NULL))
        b <- both_out(jt(y ~ g, data = f_y, paired = TRUE))
        !any(a == .y_note) && !any(b == .y_note) }))
check("Y04 control: an independent-samples t-test under the setting still prints Levene's test",
      local({ quiet(joutput(diagnostics = TRUE, quiet = TRUE))
        o <- both_out(jt(y ~ g, data = f_y))
        quiet(joutput(NULL))
        any(o == "Levene's Test for Homogeneity of Variance") }))
rm(list = intersect(c("f_y", ".y_note"), ls(all.names = TRUE)))


# --- Verdict -----------------------------------------------------------------

options(jstats.color = .entry_color)
rm(list = intersect(c("f_col", ".t_use", ".t_raw", ".t_esc", ".t_off", ".t_on"),
                    ls(all.names = TRUE)))
rm(list = intersect(c("f_aov", "f_t2", "f_pair", "f_log", "f_a2", "f_a3",
                      "cm_f", "cl_f", ".a_df", ".b_full", ".b_welch", ".b_fl",
                      ".b_wl", ".c_st", ".c_we", ".c_pa", ".d_fl", ".f_a2",
                      ".f_a3", ".g_one", ".g_grp",
                      "f_far", "f_vif", "f_mix", ".mk22", "f_x496", "f_x4998",
                      "f_x3", "f_xpl", ".j_tst", ".j_tnc", ".j_anc", ".j_lgs",
                      ".j_lm", ".j_al", ".j_a3", ".j_scr", ".j_cl", ".j_far",
                      ".j_d0", ".j_t2f", ".j_fnc", ".j_vlm", ".j_vlg", ".j_mix",
                      ".j_scl", ".j_sct", ".k_x", ".k_nar", ".k_scr",
                      ".k_exc", ".k_nop",
                      "f_fq", "f_x100", "f_xp", "f_mm", "f_gm", "f_big",
                      "f_or", "pt", ".l_c", ".l_tn", ".l_tt", ".m_fq",
                      ".m_med", ".m_con", ".m_num", ".n_cl", ".n_all",
                      ".n_res", ".n_chw", ".n_chp", ".n_ch4", ".n_cap",
                      ".o_lm", ".o_lg", ".o_lg0", ".o_grp", ".o_d3", ".o_cmp",
                      ".o_scr", ".o_cor", "coef_ok", ".o_big", ".o_non",
                      ".o_or", ".p_cl", ".p_mm", ".p_x", ".p_grp", ".p_d1",
                      ".p_h", "f_v100", "f_out", "f_100k", ".n_big", "f_df",
                      ".o_df", ".j_v1m",
                      ".j_v1g", ".o_gel",
                      ".o_out", ".q_leg", ".q_two", ".q_cl", ".q_one", ".q_sp3",
                      ".q_sp2", ".q_ref", ".q_a1", ".q_a0", ".q_fe", ".q_p1",
                      ".q_f1", ".q_f2",
                      "f_x5", "f_x3rd", "f_x5t", ".r_5t", ".r_w", ".r_at", ".r_e496",
                      ".r_e4998", ".r_e5", ".r_3rd", ".r_one", ".r_cond",
                      ".r_colp", ".r_ccap", ".r_sp", ".r_clx", ".r_ptr",
                      ".r_full", ".r_adj", ".r_f1", ".r_f2", ".r_f3",
                      ".s_tag", ".s_ref", ".s_var", ".s_dm", "f_dm",
                      ".s_new", ".s_back"),
                    ls(all.names = TRUE)))
options(.jst_options_message_width = .entry_message_width)
options(.jst_default_data          = .entry_default_data)
options(.jst_output_level          = .entry_output_level)
options(.jst_output_toggles = .entry_output_toggles)

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
