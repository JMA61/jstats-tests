# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# format_walk.R -- how numbers print, seen: every statistic to the digits
#                  setting with its trailing zeros (S326), and every table
#                  block-centered, on one lean (S327, S328)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# TYPE:     visual walkthrough (Expected comments; written for Jeff's checking)
# PENDING:  none
# LOCKS:    the S326 number-format rule (v0.9.202) as it LOOKS in a table.
#           A column's decimal places come from what it holds, never from
#           the values in it: statistics to the digits setting (default 3)
#           with trailing zeros kept, a fixed convention at its own places
#           and padded (Welch's df 6.0, % Correct 75.0, VIF 1.000), whole
#           numbers for N and whole-number df, p-values untouched, and
#           jdesc's Min and Max as the data carry them. The two layouts the
#           to-do items asked a person to judge are Sections 1-2 (the ANOVA
#           table: one precision per column, so a one-df effect's Sum of
#           Squares and Mean Square read alike) and Sections 1 and 4-6 (jt
#           and jaov keeping trailing zeros); Sections 7-11 show the same
#           rule in the tables the scan added (jlogistic, jalpha, jdesc,
#           jscreen) and the digits setting itself.
#           Since S327 (v0.9.203) also the ALIGNMENT of those tables: the 17
#           statistics tables that were on the renderer's default alignment
#           -- every jt, jaov and jalpha table, jlogistic's Omnibus, Model
#           Summary and Classification, both VIF tables, jscreen's Variable
#           Types -- are block-centered, as jdesc's have been since
#           v0.9.192: each header centered over its column, each value
#           right-justified in a block the width of the column's widest
#           value, that block centered under the header, the label column
#           flush left, and no line ending in a space. Sections 1-8, 10 and
#           11 show it on the same calls as before; Sections 12 and 13 show
#           it at ordinary sizes on the shipped clinic; Sections 14 and 15
#           show the three notes that printed a number through round();
#           Section 4 shows the two reworded Welch notes.
#           Since S328 (v0.9.204) EVERY table is in the form, and the form
#           has one lean: where a header or a value cannot be centered
#           exactly, the odd space goes on the LEFT, so the text sits one
#           place right of center -- a one-digit df under the "f" of "df",
#           where a right-justified number would sit (Jeff, S328; the odd
#           space went on the right through v0.9.203, and every Expected
#           below that held one moved). Sections 16-20 show what joined:
#           jfreq; jcrosstab, its cells on the decimal point; jcorr, which
#           keeps its left edge; the coefficient tables and the dummy-coding
#           scheme; and jdesc's Min and Max at each variable's own places.
#           Every analysis output ends on exactly ONE blank line.
#           Since S329 (v0.9.205) the crosstab as Jeff ruled it on this
#           file's 0.9.204 walk: expected counts at two places (a cell
#           under 5 read 5.0 beside a note saying "minimum = 4.96"), the
#           note pointing to expected = TRUE when they are not shown, a
#           blank line between the row groups whenever sub-rows show, the
#           columns four spaces apart where the table fits the message
#           width at that gap, and a blank line above the
#           adjusted-residuals note. Sections 15, 17 and 21. And jdummy's
#           registration lines, from his walk of this file at that build's
#           first delivery: no storage class after the variable's name, and
#           the reference category marked when it is the default. Sections
#           19 and 22.
#           Since S342 (v0.9.216) jdummy's registration ends on one blank
#           line (Sections 19 and 22), and jscreen's Variable Types table
#           has two fixes of its own: the star's legend prints only when a
#           row carries the star, and a list or raw column is an
#           Unsupported row where the call stopped (Section 25). A computed
#           vector given to jfreq, jdesc or jscreen is named as typed
#           (Section 26).
#           Since S346 (v0.9.219) the note under a significant Levene's
#           test in its three forms, in jaov() and in jt() (Sections 27
#           and 28); Games-Howell rows below 2 degrees of freedom and the
#           line that replaces a post-hoc table for two groups (Section
#           29); the stops for groups a test cannot be computed on and for
#           a sample with no case left (Section 30); and the diagnostics
#           setting, apart from the output levels (Section 31).
#           Since S347 (v0.9.220) the group-count stops' line about a
#           subset = that excluded cases, and its absence when a missing
#           outcome took the group; a paired t-test under the diagnostics
#           setting; a box plot's groups labeled as the descriptives label
#           them (Section 32).
#           format_check.R asserts the same surface; this file shows it.
# ORIGIN:   S326 (v0.9.202): the number-format bundle.
# S329 EDIT (v0.9.205): THE CROSSTAB BUILD. Sections 15 and 17
#           RE-CAPTURED (Section 15 gains a third call, with expected =
#           TRUE) and their bullets rewritten; Section 21 NEW (single-line
#           rows, four row groups, the two notes at "full"). Each Expected
#           a capture of its section on the 0.9.205 build, both streams in
#           the order emitted. No other section calls jcrosstab, and the
#           other eighteen Expected blocks are byte for byte what they
#           were.
#           SECOND DELIVERY, THE SAME DAY: jdummy's REGISTRATION LINES.
#           Section 19's two pinned registration lines re-captured and a
#           bullet added; Section 22 NEW (two default registrations, a
#           named reference, the overview). Observations block: Jeff's two
#           remarks on Section 19.
# S328 EDIT (v0.9.204): THE LEAN, THE REST OF THE TABLES, ONE CLOSING BLANK.
#           Step 2 of the formatting sequence, on Jeff's five rulings.
#           Fourteen of the fifteen Expected blocks RE-CAPTURED for the lean
#           (Section 10's jscreen block stands: no column of it has an odd
#           space) -- taken from an ordered diff of this file's own output
#           on the 0.9.203 and 0.9.204 builds, each block then found as a
#           contiguous run in the new capture. Sections 16-20 NEW, each
#           Expected a sink() capture of its section on the 0.9.204 build.
#           Four bullets reworded where they described the old lean or
#           promised "the next build" (Sections 5, 7, 12, 15).
# S327 EDIT (v0.9.203): THE ALIGNMENT SLICE, THE NOTES, TWO LINE ENDINGS.
#           Jeff's two observations on the 0.9.202 walk (the Observations
#           block at the foot records them). Ten of the eleven Expected
#           blocks RE-CAPTURED -- Section 9, jdesc, stands -- and Sections
#           12-15 NEW. Section 4's call gains posthoc = TRUE, so the Tukey
#           note prints under the Sum of Squares note. Section 7's two
#           outputs are now separated by jlogistic's closing blank line, and
#           Section 10's four header lines lost an invisible trailing space
#           (not visible here: an Expected carries no trailing spaces).
# S341 EDIT (v0.9.215): GAMES-HOWELL AFTER WELCH; A GROUP OF ONE CASE.
#           Section 4 RE-PINNED: its call asked for post-hoc tests under
#           Welch and got a note saying Tukey HSD was not applicable; it
#           now gets the Games-Howell table, in the Tukey table's place
#           and form with a df column. Sections 23 and 24 NEW: Games-Howell
#           on groups of unequal size and spread beside Tukey on the same
#           data, and a group of one case (blank cells where R printed
#           "NaNs produced"; Welch's stop). Each Expected FILLED BY RUNNING
#           the file (fill.R, Testing Conventions). A capture of every
#           section of every walk on 0.9.214 and on 0.9.215 differs in
#           this file's Section 4 alone.
#           Second delivery, the same day: Section 23 RE-PINNED. Jeff's
#           walk found the Levene note sitting directly under its table;
#           it is one blank line below it now, in jaov() and jt().
#           Third delivery: re-pinned again for the note's "p < .001".
# S342 EDIT (v0.9.216): FIX SLATE 4. Sections 19 and 22 RE-PINNED: one
#           blank line now follows jdummy's reminder, so each block gained
#           an empty line between jload("cl.rds") and the next call's
#           first line (three places), and Section 22 a bullet. Found by a
#           capture of every section of every walk on 0.9.215 and on
#           0.9.216: this file's Sections 19 and 22 and models_walk.R's
#           3 and 13 differ, the last two outside any pinned block.
#           Sections 25 and 26 NEW: jscreen's star and its legend, a list
#           and a raw column as Unsupported rows with jfreq's stop for
#           one; a computed vector named as typed. Each Expected FILLED BY
#           RUNNING the file (fill.R, Testing Conventions).
# S347 EDIT (v0.9.220): FIX SLATE 8, SECOND HALF. Section 32 NEW (see
#           LOCKS), three renders, inline fixtures built and removed inside
#           the section; each Expected FILLED BY RUNNING the file (fill.R),
#           with #@SKIP before Renders 2 and 3. No existing Expected moved
#           (a capture of every section on 0.9.219 and 0.9.220). The human
#           half of format_check.R Y01-Y04 and models_check.R Q16-Q19 and
#           Q38.
# S348 EDIT (v0.9.221): FIX SLATE 7, FIRST HALF. Section 33 NEW, three
#           renders: jfreq()'s "Total valid" and "Total missing" rows and
#           its zero rows -- rulings R7 and R4 of S345, built together, the
#           ONE section Jeff walks for them ("Can we do one walk section
#           only"). Each Expected FILLED BY RUNNING the file (fill.R).
#           Section 16 RE-PINNED MECHANICALLY under the rulings (a "Total
#           valid" row, the columns it widened), and its first note
#           corrected to the new widths; it stays off the PENDING line. The
#           human half of format_check.R section Z.
# LAST VERIFIED: v0.9.221, 2026-10-10 (S348) -- Section 33 WALKED on the
#           WORKSTATION by Jeff through receive_all(), its closing block's
#           walk line as the tool's default leaves it; PENDING back to none;
#           GitHub 2a49208. Section 16 re-pinned
#           mechanically under rulings R4 and R7 and not walked. Sandbox:
#           every Expected block under rewalk() as in a straight run
#           (harness.R verify).
# S346 EDIT (v0.9.219): FIX SLATE 8, FIRST CUT, AND DIAGNOSTICS. Sections
#           27-31 NEW (see LOCKS), each Expected FILLED BY RUNNING the file
#           (fill.R, Testing Conventions); they are the PENDING sections.
#           RE-PINNED MECHANICALLY under Jeff's ruling of 8 October 2026
#           (diagnostics are one setting, off at every output level;
#           levene = is gone), and kept off the PENDING line: Sections 1,
#           12 and 13, whose calls gained diagnostics = TRUE so that the
#           Levene table their blocks pin still prints under full = TRUE
#           (no Expected changed); Section 21, whose pinned full-level
#           panel lost its levene row and reads "diagnostics: OFF"; and
#           Section 23, whose call takes diagnostics = TRUE for
#           levene = TRUE and whose Levene note is in its new form (one
#           bullet extended). Found by a capture of every section of
#           every walk on 0.9.218 and on 0.9.219: this file's Sections 1,
#           12, 13, 21 and 23, clinic_workflows_walk.R's 10, cps_walk.R's
#           D4, models_walk.R's 8, and two sections that print the
#           settings panel outside any pinned block
#           (missing_convention_walk.R 14, modify_form_walk.R 6).
#           The RUN note no longer says the console drops the message
#           stream's blank lines (found false at S345).
#           SECOND DELIVERY, THE NEXT DAY: Jeff walked Sections 27-31 at
#           the first ("all okay"). Section 30 gains Render 4: a filter
#           that names the grouping variable is named as the cause of its
#           one category in jt(), jaov() and jcrosstab(), as subset = and
#           as a stored jsubset() filter (his walk of models_walk.R Section
#           18); its block FILLED BY RUNNING, Render 3's code no longer
#           removes shown(), and Render 4 removes it. A capture of every
#           section of every walk on the two deliveries differs in this
#           file's Section 30 and models_walk.R's 18 alone.
# LAST VERIFIED: v0.9.220, 2026-10-10 (S347) -- Section 32 WALKED on the
#           WORKSTATION by Jeff through receive_all(), its closing block's
#           walk line as the tool's default leaves it; PENDING back to
#           none; GitHub 991eb6b. Sandbox: 46 of 46 Expected blocks under
#           rewalk() in three orders (harness.R verify).
# LAST VERIFIED: v0.9.219, 2026-10-09 (S346) -- Sections 27-31 WALKED on
#           the WORKSTATION by Jeff through rewalk() at the first delivery
#           ("all okay"), and Section 30 again at the second ("all okay");
#           PENDING back to none; GitHub 14528c6. Sections 1, 12, 13, 21
#           and 23 were re-pinned mechanically under the diagnostics ruling
#           and not walked (the S345 rule for a ruled layout). Sandbox
#           (R 4.3.3, UTF-8 locale, pkgload::load_all of the build): 43 of
#           43 Expected blocks found in a straight run and under rewalk()
#           in three orders (harness.R verify; no section needs another).
#           Prior: v0.9.216, 2026-10-06 (S342) -- Sections 19, 22, 25 and
#           26 WALKED on the WORKSTATION by Jeff through rewalk() ("Both
#           walks look good"); PENDING back to none; GitHub 8737548.
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all of the
#           build): 27 of 27 Expected blocks found in a straight run and
#           under rewalk() in three orders (harness.R derive and verify;
#           no section needs another). Prior:
#           v0.9.215, 2026-10-06 (S341) -- Sections 4, 23 and 24
#           WALKED on the WORKSTATION by Jeff through rewalk(). His one
#           remark, on Section 23 (the Levene note directly under its
#           table, "harder to read"), was fixed in the same version with
#           the note's "p = <.001", and the section walked again ("the
#           walk is now fine"); PENDING back to none; GitHub da1684a.
#           Sandbox: 24 of 24 Expected blocks found in a straight run and
#           under rewalk() in three orders (harness.R verify).
#           Prior: v0.9.205 PENDING, 2026-10-03 (S329) -- SANDBOX (R 4.3.3,
#           UTF-8 locale, pkgload::load_all of the build): the whole file
#           sourced end to end (end marker reached) and every Expected
#           block found as a contiguous run in that capture (22 of 22);
#           against the 0.9.204 build the same check finds 17 -- all but
#           Sections 15, 17, 19, 21 and 22, the five this build moves.
#           WORKSTATION: Jeff walked the first delivery's file (21
#           sections) at S329, raising the two Section 19 remarks; his
#           walk of Sections 19 and 22 on the second delivery is PENDING.
#           Prior: v0.9.204, 2026-10-03 (S328) -- WALKED IN FULL on the
#           workstation (Jeff: "the rest looks good"), his crosstab
#           observations in the Observations block at the foot. In the
#           sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): the whole file
#           sourced end to end (end marker reached) and every Expected
#           block found as a contiguous run in that capture (20 of 20);
#           against the 0.9.203 build the same check finds TWO: Section
#           10's, which this build does not move, and Section 18's, jcorr,
#           whose only change is trailing padding an Expected cannot carry
#           (format_check.R O10 sees it).
#           The 0.9.203 walk the entry below calls pending was completed
#           on the workstation at S327's close (Jeff: "The walk now looks
#           good. I didn't see anything concerning.").
#           Prior: v0.9.203 PENDING, 2026-10-02 (S327) -- built in the SANDBOX
#           (R 4.3.3, UTF-8 locale): every Expected is a sink() capture of
#           its section on the 0.9.203 build, the builder halting on any
#           error a section lets escape (the S289 D5 lesson). The whole file
#           then sourced end to end (end marker reached) and every Expected
#           block found in that capture (15 of 15); against the 0.9.202
#           build the same check finds ONE, Section 9's -- jdesc, the block
#           this build does not touch. WORKSTATION walk PENDING: Jeff began
#           the 0.9.202 walk at S326 and completes it on this file.
# RUN:      line-by-line first (read each block of output before moving on).
#           Also source()-safe: nothing here errors or prompts. Under
#           source(), run WITH echo = TRUE, per the conventions file.
#           Expecteds are sink() captures at 76.
#           By section: source walk_tools.R, then rewalk("format") shows the
#           sections the PENDING line names and rewalk("format", "1") shows
#           one, each from a fresh Setup and its NEEDS. Add prepare = TRUE to
#           run only what the section needs and step through it by hand.
# SECTIONS: independent; each names its data frame.
# ENCODING: UTF-8. Section 7's two pinned Model Summary headers carry the
#           superscript two of "R-squared" and, since S327, Section 14's
#           pinned Coefficients header the beta, as models_walk.R's do;
#           since S328 Section 19's two Coefficients headers carry it too.
#           Everything else is ASCII.
# FIXTURE:  small frames built INLINE (whole-number means and sums of
#           squares, so the old per-column detection would have dropped
#           every trailing zero), plus the SHIPPED community and clinic
#           through jload(package = TRUE) for the calls named in the S326
#           discussion. No dataset file is read. S327 adds f_vif (two
#           predictors whose VIF is exactly 16) and two 2 x 2 tables whose
#           smallest expected count is 4.96 and 4.998.
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

# warn = 1 (conventions file, rule 4, S248): a warning prints where it
# happens under source(), not pooled at the foot.
options(warn = 1)

# Neutral pipeline state (never assume the prior state is clean).
jsubset(clear.all = TRUE); jcomplete(clear.all = TRUE); joutput(NULL)
jdummy(clear.all = TRUE)
juse(NULL)

# The shipped datasets. quiet = TRUE keeps the load narrative out; clinic's
# suspected-codes note still prints -- it belongs to clinic, not this walk.
jload("community", name = "cm", package = TRUE, overwrite = TRUE, quiet = TRUE)
jload("clinic", name = "cl", package = TRUE, overwrite = TRUE, quiet = TRUE)

# Three groups of four, equal sizes and equal variances: means 16, 15, 14,
# sums of squares 8 / 24 / 32, Levene's F 0, Welch's df 6.0. Every one of
# those printed without its decimals before S326.
f_aov <- data.frame(g = rep(c("a", "b", "c"), each = 4),
                    y = c(14, 16, 18, 16,  13, 15, 17, 15,  12, 14, 16, 14),
                    stringsAsFactors = FALSE)
f_t2  <- f_aov[f_aov$g != "c", ]                 # the first two groups, for jt

# Three pairs whose post - pre differences are -1, -2, -3: mean -2, dz -2.
f_pair <- data.frame(time  = rep(c("pre", "post"), each = 3),
                     score = c(10, 12, 14,  9, 10, 11),
                     stringsAsFactors = FALSE)

# Orthogonal predictors (VIF exactly 1) and an outcome balanced over both, so
# every case is predicted 0 and the fit statistics are 0.
f_log <- data.frame(x1 = rep(c(-3, -1, 1, 3), 12),
                    x2 = rep(rep(c(-3, -1, 1, 3), each = 4), 3))
f_log$yb <- 0
f_log$yb[c(1, 6, 11, 16, 17, 22, 27, 32, 33, 38, 43, 48)] <- 1

# Three items with means 3 whose Alpha if Item Deleted is 0.5, 0.5 and 0.4.
f_a3 <- data.frame(i1 = c(3, 3, 2, 2, 3, 5), i2 = c(1, 1, 2, 5, 4, 5),
                   i3 = c(4, 1, 3, 3, 3, 4))

# S327. Two predictors correlated at sqrt(15/16): e is orthogonal to x1 and
# to the constant, with x1's sum of squares, so each VIF is exactly 16 and
# the standard-error inflation exactly 4.
f_vif <- local({
  x1 <- rep(c(-3, -1, 1, 3), 6)
  e  <- rep(c(1, -1, -1, 1), 6) * sqrt(5)
  r  <- sqrt(15 / 16)
  x2 <- r * x1 + sqrt(1 - r^2) * e
  data.frame(x1 = x1, x2 = x2,
             y = x1 + x2 + rep(c(0.5, -0.5, -0.5, 0.5, -1, 1), 4))
})

# S327. Two 2 x 2 tables by cell count. The smallest expected count is
# 31 * 16 / 100 = 4.96 in the first and 51 * 98 / 1000 = 4.998 in the second.
f_x496  <- data.frame(r = rep(c(1, 1, 2, 2), c(6, 25, 10, 59)),
                      k = rep(c(1, 2, 1, 2), c(6, 25, 10, 59)))
f_x4998 <- data.frame(r = rep(c(1, 1, 2, 2), c(10, 41, 88, 861)),
                      k = rep(c(1, 2, 1, 2), c(10, 41, 88, 861)))


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 1 -- jaov, the whole output, on whole-number results ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Every table jaov prints, on f_aov. Before S326 each numeric column
# took its decimals from its own values, so this call printed the
# means as 16 / 15 / 14, the sums of squares as 8 / 24 / 32, Levene's
# F as 0, F as 1.5, eta-squared as 0.25 and the Tukey differences
# as -1 / -2 / -1.

jaov(y ~ g, data = f_aov, full = TRUE, diagnostics = TRUE)

# Expected:
#   One-Way ANOVA
#
#   Analysis N: 12
#
#   Levene's Test for Homogeneity of Variance
#     F    df1  df2    p
#   -----  ---  ---  -----
#   0.000   2    9   1.000
#
#   Group Descriptives: y by g
#   Group  N   Mean     SD   95% CI Lower  95% CI Upper
#   -----  -  ------  -----  ------------  ------------
#   a      4  16.000  1.633     13.402        18.598
#   b      4  15.000  1.633     12.402        17.598
#   c      4  14.000  1.633     11.402        16.598
#
#   ANOVA: y by g
#   Source    df  Sum of Squares  Mean Square    F      p
#   --------  --  --------------  -----------  -----  ----
#   g          2       8.000         4.000     1.500  .274
#   Residual   9      24.000         2.667
#   Total     11      32.000
#
#   Eta-squared: 0.250
#
#   Tukey HSD Post-Hoc Comparisons
#   Comparison  Mean Difference  95% CI Lower  95% CI Upper  p (adjusted)
#   ----------  ---------------  ------------  ------------  ------------
#   b-a              -1.000         -4.224         2.224         .674
#   c-a              -2.000         -5.224         1.224         .246
#   c-b              -1.000         -4.224         2.224         .674
#
# Things to look at:
#   - Every statistic carries three places: Levene's F 0.000, the means
#     16.000 / 15.000 / 14.000, Sum of Squares 8.000 / 24.000 / 32.000,
#     Mean Square 4.000 / 2.667, F 1.500, the Tukey differences.
#   - The df and N columns are whole numbers, and the p column reads as
#     before (.274; 1.000 for Levene's p of 1).
#   - Eta-squared: 0.250, with no space after it (there was one).
#   - ALIGNMENT (S327): every header sits centered over its column and
#     every value under its header's middle -- F and p in the Levene and
#     ANOVA tables (F was flush right, p flush left), the means under
#     Mean, the CI bounds under their headers, the adjusted p-values under
#     "p (adjusted)". The label columns (Group, Source, Comparison) stay
#     flush left.
#   - The Residual and Total rows end at their last value.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 2 -- the S220 case: one number at two precisions ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# With one df the between-groups Sum of Squares and Mean Square are
# the same number. Per-column detection printed 1193.850 beside
# 1193.85 (the Mean Square column needed only two places), and the
# Residual Mean Square as 124.53.

jaov(Age ~ Volunteer, data = cm)

# Expected:
#   One-Way ANOVA
#
#   Analysis N: 103
#
#   Group Descriptives: Age by Volunteer
#   Group    N   Mean     SD    95% CI Lower  95% CI Upper
#   ------  --  ------  ------  ------------  ------------
#   0: No   54  37.407  11.238     34.340        40.475
#   1: Yes  49  44.224  11.072     41.044        47.405
#
#   ANOVA: Age by Volunteer
#   Source      df  Sum of Squares  Mean Square    F      p
#   ---------  ---  --------------  -----------  -----  ----
#   Volunteer    1      1193.850      1193.850   9.587  .003
#   Residual   101     12577.568       124.530
#   Total      102     13771.417
#
#   Eta-squared: 0.087
#
# Things to look at:
#   - Volunteer reads 1193.850 in both columns; Residual's Mean Square
#     124.530.
#   - The means and SDs needed three places already.
#   - ALIGNMENT (S327): N sits over 54 and 49, "df" over 101 and 102; the
#     sums of squares stay lined up on the decimal point under "Sum of
#     Squares".


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 3 -- eta-squared at the edges: 0.100 and 0.000 ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Two shipped-data calls from the S326 discussion. The first
# eta-squared is 0.09991, which printed as 0.1; the second is
# 0.000187, which printed as 0 -- as if there were no effect at all.

jaov(ScreenTime ~ SoughtHelp, data = cl, effect.size = TRUE)
jaov(SocialSupport ~ PriorTherapy, data = cl, effect.size = TRUE)

# Expected:
#   One-Way ANOVA
#
#   Analysis N: 70
#
#   Group Descriptives: ScreenTime by SoughtHelp
#   Group    N   Mean    SD   95% CI Lower  95% CI Upper
#   ------  --  -----  -----  ------------  ------------
#   0: No   49  4.529  1.965      3.964         5.093
#   1: Yes  21  3.162  1.762      2.360         3.964
#
#   ANOVA: ScreenTime by SoughtHelp
#   Source      df  Sum of Squares  Mean Square    F      p
#   ----------  --  --------------  -----------  -----  ----
#   SoughtHelp   1       27.456        27.456    7.548  .008
#   Residual    68      247.350         3.637
#   Total       69      274.806
#
#   Eta-squared: 0.100
#
#   One-Way ANOVA
#
#   Analysis N: 70
#
#   Group Descriptives: SocialSupport by PriorTherapy
#   Group    N   Mean     SD   95% CI Lower  95% CI Upper
#   ------  --  ------  -----  ------------  ------------
#   1: Yes  39  14.103  5.088     12.453        15.752
#   2: No   31  13.968  4.820     12.200        15.736
#
#   ANOVA: SocialSupport by PriorTherapy
#   Source        df  Sum of Squares  Mean Square    F      p
#   ------------  --  --------------  -----------  -----  ----
#   PriorTherapy   1        0.314         0.314    0.013  .911
#   Residual      68     1680.557        24.714
#   Total         69     1680.871
#
#   Eta-squared: 0.000
#
# Things to look at:
#   - Eta-squared: 0.100 and Eta-squared: 0.000.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 4 -- Welch's ANOVA: F to three places, df2 to one; Games-Howell ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Welch's df keeps its one-place convention, padded: equal group sizes
# and variances make it exactly 6, which printed as 6.
# S327: the note said Sum of Squares was "not available", which read as
# a gap in jstats; Welch's F is not a ratio of two mean squares, so it
# is not applicable.
# S341: post-hoc tests are requested too. A second note used to say
# that Tukey HSD was not applicable to Welch's ANOVA, and offered
# nothing. The request is now answered with Games-Howell, the pairwise
# test that does not assume equal variances.

jaov(y ~ g, data = f_aov, welch = TRUE, posthoc = TRUE)

# Expected:
#   Welch's One-Way ANOVA
#
#   Analysis N: 12
#
#   Group Descriptives: y by g
#   Group  N   Mean     SD   95% CI Lower  95% CI Upper
#   -----  -  ------  -----  ------------  ------------
#   a      4  16.000  1.633     13.402        18.598
#   b      4  15.000  1.633     12.402        17.598
#   c      4  14.000  1.633     11.402        16.598
#
#   Welch's ANOVA: y by g
#     F    df1  df2    p
#   -----  ---  ---  ----
#   1.350   2   6.0  .328
#
#   Note: Sum of Squares and Mean Square are not applicable to Welch's ANOVA.
#   For the standard ANOVA table, run jaov() without welch = TRUE.
#
#   Eta-squared: 0.250
#   (Note: Eta-squared is calculated from the traditional SS decomposition.)
#
#   Games-Howell Post-Hoc Comparisons
#   Comparison  Mean Difference  95% CI Lower  95% CI Upper   df  p (adjusted)
#   ----------  ---------------  ------------  ------------  ---  ------------
#   b-a              -1.000         -4.543         2.543     6.0      .679
#   c-a              -2.000         -5.543         1.543     6.0      .269
#   c-b              -1.000         -4.543         2.543     6.0      .679
#
# Things to look at:
#   - F 1.350; df1 2 (a whole number); df2 6.0 -- each under the middle
#     of its header.
#   - The note: "Sum of Squares and Mean Square are not applicable to
#     Welch's ANOVA", and its second line points to the standard ANOVA
#     table. It does not say "not available".
#   - No note about Tukey HSD. The last table is headed "Games-Howell
#     Post-Hoc Comparisons": the Tukey table's columns, with df before
#     p (adjusted). Each comparison has its own df, to one place.
#   - With equal sizes and equal spreads every df is 6.0 and the
#     differences are the same -1.000 / -2.000 / -1.000 that Section 1's
#     Tukey table shows.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 5 -- jt, Student's and Welch's ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The Mean Difference is exactly 1, which printed as 1 beside two
# three-place CI bounds; Welch's df is exactly 6.

jt(y ~ g, data = f_t2, effect.size = TRUE)
jt(y ~ g, data = f_t2, welch = TRUE, effect.size = TRUE)

# Expected:
#   Independent Samples T-Test
#
#   Analysis N: 8
#
#   Group Descriptives: y by g
#   Group  N   Mean     SD
#   -----  -  ------  -----
#   a      4  16.000  1.633
#   b      4  15.000  1.633
#
#   Independent Samples T-Test Results (equal variances assumed)
#     t    df    p   Mean Difference  95% CI Lower  95% CI Upper
#   -----  --  ----  ---------------  ------------  ------------
#   0.866   6  .420       1.000          -1.825         3.825
#
#   Cohen's d: 0.612
#
#   Welch's Independent Samples T-Test
#
#   Analysis N: 8
#
#   Group Descriptives: y by g
#   Group  N   Mean     SD
#   -----  -  ------  -----
#   a      4  16.000  1.633
#   b      4  15.000  1.633
#
#   Welch's T-Test Results (equal variances not assumed)
#     t     df    p   Mean Difference  95% CI Lower  95% CI Upper
#   -----  ---  ----  ---------------  ------------  ------------
#   0.866  6.0  .420       1.000          -1.825         3.825
#
#   Cohen's d: 0.612
#
# Things to look at:
#   - Group Descriptives: 16.000 / 15.000.
#   - Mean Difference 1.000 in both; df 6 for Student's, 6.0 for
#     Welch's.
#   - Cohen's d: 0.612 (it needed three places already; jt's d line had
#     the same defect as eta-squared -- see Section 6).
#   - ALIGNMENT (S328): where a column has one spare space the value
#     takes the RIGHT of it -- the df of 6 sits under the "f" of "df",
#     where a right-justified number would. Through v0.9.203 it took
#     the left; Jeff chose the right at S328, for every table. Welch's
#     6.0 fills its column.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 6 -- jt, paired: Cohen's dz to three places ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The differences are -1, -2 and -3, so the mean difference is -2
# and dz exactly -2.000; both printed as -2.

jt(score ~ time, data = f_pair, paired = TRUE, effect.size = TRUE)

# Expected:
#   Paired Samples T-Test
#
#   Analysis N: 6
#
#   Group Descriptives: score by time
#   Group  N   Mean     SD
#   -----  -  ------  -----
#   post   3  10.000  1.000
#   pre    3  12.000  2.000
#
#   Paired Samples T-Test Results
#      t    df    p   Mean Difference  95% CI Lower  95% CI Upper
#   ------  --  ----  ---------------  ------------  ------------
#   -3.464   2  .074       -2.000         -4.484         0.484
#
#   Cohen's dz (paired): -2.000
#
# Things to look at:
#   - Mean Difference -2.000; df 2; the means 10.000 / 12.000.
#   - Cohen's dz (paired): -2.000.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 7 -- jlogistic: the fit tables, the classification table and VIF ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The coefficient table always padded; the two fit tables below it
# did not. Each is a one-row table, so each column took its decimals
# from one value: about one jlogistic call in three on the shipped
# data showed a short one. The first call's -2 Log Likelihood is
# 141.17; f_log's fit statistics are all zero and its percentages
# and VIFs whole.

jlogistic(Volunteer ~ CommuteTime, data = cm)
jlogistic(yb ~ x1 + x2, data = f_log, classification = TRUE,
          diagnostics = TRUE)

# Expected:
#   Logistic Regression
#
#   Analysis N: 103
#
#   Coefficients
#                   b      SE    Wald  df    p   Exp(B)
#   -----------  ------  -----  -----  --  ----  ------
#   (Intercept)  -0.666  0.529  1.588   1  .208   0.514
#   CommuteTime   0.018  0.016  1.355   1  .244   1.019
#
#   Outcome: Volunteer
#
#   Omnibus Test of Model Coefficients
#   Chi-Square  df    p
#   ----------  --  ----
#      1.376     1  .241
#
#   Model Summary
#   -2 Log Likelihood  Cox & Snell R²  Nagelkerke R²    AIC
#   -----------------  --------------  -------------  -------
#        141.170            0.013          0.018      145.170
#
#   Dependent Variable Encoding
#     Modeled (1):   Yes
#     Reference (0): No
#
#   Logistic Regression
#
#   Analysis N: 48
#
#   Coefficients
#                   b      SE    Wald   df    p    Exp(B)
#   -----------  ------  -----  ------  --  -----  ------
#   (Intercept)  -1.099  0.333  10.863   1  <.001   0.333
#   x1            0.000  0.149   0.000   1  1.000   1.000
#   x2            0.000  0.149   0.000   1  1.000   1.000
#
#   Outcome: yb
#
#   Omnibus Test of Model Coefficients
#   Chi-Square  df    p
#   ----------  --  -----
#      0.000     2  1.000
#
#   Model Summary
#   -2 Log Likelihood  Cox & Snell R²  Nagelkerke R²    AIC
#   -----------------  --------------  -------------  ------
#         53.984            0.000          0.000      59.984
#
#   Classification Table (cutoff = 0.50)
#   Observed  Predicted 0  Predicted 1  % Correct
#   --------  -----------  -----------  ---------
#   0              36           0         100.0
#   1              12           0           0.0
#   Overall                                75.0
#
#   VIF (Variance Inflation Factors)
#   Variable   VIF
#   --------  -----
#   x1        1.000
#   x2        1.000
#
#   Dependent Variable Encoding
#     Modeled (1):   1
#     Reference (0): 0
#
# Things to look at:
#   - -2 Log Likelihood 141.170 and AIC 145.170 beside R-squared 0.013.
#   - f_log: Chi-Square, Cox & Snell and Nagelkerke all 0.000 (unsigned);
#     % Correct 100.0 / 0.0 / 75.0; VIF 1.000 / 1.000.
#   - ALIGNMENT (S327, S328): the Omnibus, Model Summary, Classification
#     and VIF tables are block-centered, and since v0.9.204 so is the
#     Coefficients table. Its df of 1 and the Omnibus table's df now
#     follow one rule, each under the "f" of "df"; at v0.9.203 the two
#     disagreed inside this one output.
#   - Each output ends on a blank line (S327): the second call's title
#     no longer sits directly under "Reference (0): No".


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 8 -- jalpha: alpha, the item statistics, alpha if deleted ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# community's Environment1 and Environment5 have an alpha of 0.57;
# f_a3's items have means of 3 and Alpha if Item Deleted of 0.5,
# 0.5 and 0.4.

jalpha(cm, Environment1, Environment5)
jalpha(f_a3, i1, i2, i3)

# Expected:
#   Reliability Analysis
#
#   Case Processing    Excluded  Remaining
#       Original             --        103
#       Auto-listwise        12         91
#       Analysis N           --         91
#
#   Missing data   From 103    %
#       Environment1
#         Missing     12     11.7
#   --------------------------------------
#
#   Reliability Statistics
#   Cronbach's Alpha  N of Items
#   ----------------  ----------
#         0.570            2
#
#   Item Statistics
#   Item           Mean    SD    N
#   ------------  -----  -----  --
#   Environment1  3.176  1.160  91
#   Environment5  2.703  1.449  91
#
#   Item-Total Statistics
#   Item          Corrected Item-Total r  Alpha if Item Deleted
#   ------------  ----------------------  ---------------------
#   Environment1           0.408
#   Environment5           0.408
#
#   Reliability Analysis
#
#   Analysis N: 6
#
#   Reliability Statistics
#   Cronbach's Alpha  N of Items
#   ----------------  ----------
#         0.562            3
#
#   Item Statistics
#   Item   Mean    SD   N
#   ----  -----  -----  -
#   i1    3.000  1.095  6
#   i2    3.000  1.897  6
#   i3    3.000  1.095  6
#
#   Item-Total Statistics
#   Item  Corrected Item-Total r  Alpha if Item Deleted
#   ----  ----------------------  ---------------------
#   i1             0.361                  0.500
#   i2             0.412                  0.500
#   i3             0.447                  0.400
#
# Things to look at:
#   - Cronbach's Alpha 0.570.
#   - f_a3: Mean 3.000 for each item; Alpha if Item Deleted 0.500 /
#     0.500 / 0.400. N and N of Items stay whole.
#   - ALIGNMENT (S327): 0.570 and 2 sit under the middle of "Cronbach's
#     Alpha" and "N of Items"; the item-total correlations under theirs.
#     With two items there is no Alpha if Item Deleted, so those rows end
#     at 0.408.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 9 -- jdesc: Mean and SD to three places; Min and Max as the data ----
#              carry them
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Flourishing's mean is 49.6. Min and Max are values of the variable,
# not statistics, so they keep the data's precision: whole numbers
# here, where a variable with a decimal place would show one.

jdesc(cl, Flourishing)
jdesc(f_aov, y, by = g)

# Expected:
#   Descriptive Statistics
#
#   70 Cases in the 1 Variable Pool
#
#   Variable     Total  Non_missing  Min  Max   Mean     SD
#   -----------  -----  -----------  ---  ---  ------  ------
#   Flourishing    70        70       0    75  49.600  13.865
#
#   Descriptive Statistics by g (3 levels)
#
#   12 Cases in the 1 Variable Pool
#
#   y
#
#   g  Total  Non_missing  Min  Max   Mean     SD
#   -  -----  -----------  ---  ---  ------  -----
#   a    4         4        14   18  16.000  1.633
#   b    4         4        13   17  15.000  1.633
#   c    4         4        12   16  14.000  1.633
#
# Things to look at:
#   - Mean 49.600 beside SD 13.865; Min 0 and Max 75.
#   - The grouped table: Mean 16.000 / 15.000 / 14.000; Min and Max whole.
#   - The columns are still block-centered, the lines still unpadded.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 10 -- jscreen(stats = TRUE): Mean and Median to three places ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# jscreen's opt-in statistics columns take the digits setting too.

jscreen(f_aov, stats = TRUE)

# Expected:
#   Data Screening
#     Cases: 12
#     Variables: 2
#     Cases with missing data: 0
#     Variables with outliers: 0
#
#   Variable Types
#   Variable  jstats Class  Sub-class   Unique Values   Mean   Median
#   --------  ------------  ----------  -------------  ------  ------
#   g         Categorical   3-category        3
#   y         Numeric                         7        15.000  15.000
#
# Things to look at:
#   - y: Mean 15.000, Median 15.000; Unique Values 7 (a count, whole).
#   - ALIGNMENT (S327): 3 and 7 sit under the middle of "Unique Values";
#     Mean and Median under centered headers. The text columns stay flush
#     left, and g's row ends at its last value.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 11 -- the digits setting: two places, then none ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# digits = 2 keeps trailing zeros at two places; digits = 0 prints
# whole numbers with no decimal point, as the help page says.

jaov(y ~ g, data = f_aov, effect.size = TRUE, digits = 2)
jaov(y ~ g, data = f_aov, effect.size = TRUE, digits = 0)

# Expected:
#   One-Way ANOVA
#
#   Analysis N: 12
#
#   Group Descriptives: y by g
#   Group  N   Mean   SD   95% CI Lower  95% CI Upper
#   -----  -  -----  ----  ------------  ------------
#   a      4  16.00  1.63      13.40         18.60
#   b      4  15.00  1.63      12.40         17.60
#   c      4  14.00  1.63      11.40         16.60
#
#   ANOVA: y by g
#   Source    df  Sum of Squares  Mean Square    F     p
#   --------  --  --------------  -----------  ----  ----
#   g          2        8.00          4.00     1.50  .274
#   Residual   9       24.00          2.67
#   Total     11       32.00
#
#   Eta-squared: 0.25
#
#   One-Way ANOVA
#
#   Analysis N: 12
#
#   Group Descriptives: y by g
#   Group  N  Mean  SD  95% CI Lower  95% CI Upper
#   -----  -  ----  --  ------------  ------------
#   a      4   16    2       13            19
#   b      4   15    2       12            18
#   c      4   14    2       11            17
#
#   ANOVA: y by g
#   Source    df  Sum of Squares  Mean Square  F    p
#   --------  --  --------------  -----------  -  ----
#   g          2         8             4       2  .274
#   Residual   9        24             3
#   Total     11        32
#
#   Eta-squared: 0
#
# Things to look at:
#   - At two places: 16.00, 8.00, 1.50 and Eta-squared: 0.25.
#   - At none: 16, 8, 2 (F of 1.5 rounds to 2) and Eta-squared: 0.
#   - p-values keep three places in both.
#   - ALIGNMENT (S327): at no places every value is narrower than its
#     header and sits under its middle (13 under "95% CI Lower", 8 under
#     "Sum of Squares").


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 12 -- the alignment at ordinary sizes: jt on the shipped clinic ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Sections 1-11 use small frames built to land on trailing zeros. This
# is an ordinary call: two-digit group sizes, a two-digit df, means in
# the tens. diagnostics = TRUE adds Levene's table, which jt prints too.

jt(Flourishing ~ Medication, data = cl, full = TRUE, diagnostics = TRUE)

# Expected:
#   Independent Samples T-Test
#
#   Case Processing    Excluded  Remaining
#       Original             --         70
#       Auto-listwise         5         65
#       Analysis N           --         65
#
#   Missing data   From 70   %
#       Medication
#         Missing     5     7.1
#   --------------------------------------
#
#   Levene's Test for Homogeneity of Variance
#     F    df1  df2    p
#   -----  ---  ---  ----
#   1.242   1    63  .269
#
#   Group Descriptives: Flourishing by Medication
#   Group    N   Mean     SD
#   ------  --  ------  ------
#   0: No   39  51.564  11.553
#   1: Yes  26  44.000  15.367
#
#   Independent Samples T-Test Results (equal variances assumed)
#     t    df    p   Mean Difference  95% CI Lower  95% CI Upper
#   -----  --  ----  ---------------  ------------  ------------
#   2.263  63  .027       7.564           0.886        14.242
#
#   Cohen's d: 0.573
#
# Things to look at:
#   - Levene's table: F, df1, df2 and p each under a centered header;
#     the df2 of 63 has one spare space under "df2" and takes the right
#     (S328), so 63 ends under the "2".
#   - Group Descriptives: N over 39 and 26, Mean and SD over their values.
#   - The test table: the df of 63 fills its column; the Mean Difference
#     and both CI bounds sit under the middle of their headers.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 13 -- a p column whose values differ in width: Tukey on clinic ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The call from the S326 discussion. Five of the six adjusted p-values
# are four characters wide and one is 1.000. Left-justified, as text
# was, .976 sat over 1.000 with the decimal points out of line.

jaov(Stress ~ Condition, data = cl, full = TRUE, diagnostics = TRUE)

# Expected:
#   One-Way ANOVA
#
#   Case Processing    Excluded  Remaining
#       Original             --         70
#       Auto-listwise         4         66
#       Analysis N           --         66
#
#   Missing data   From 70   %
#       Stress
#         Missing     4     5.7
#   --------------------------------------
#
#   Levene's Test for Homogeneity of Variance
#     F    df1  df2    p
#   -----  ---  ---  ----
#   0.115   3    62  .951
#
#   Group Descriptives: Stress by Condition
#   Group              N   Mean     SD   95% CI Lower  95% CI Upper
#   ----------------  --  ------  -----  ------------  ------------
#   1: Control        18  15.667  8.931     11.225        20.108
#   2: CBT            13  14.538  6.591     10.556        18.521
#   3: Mindfulness    15  16.133  6.812     12.361        19.906
#   4: Support group  20  14.450  7.258     11.053        17.847
#
#   ANOVA: Stress by Condition
#   Source     df  Sum of Squares  Mean Square    F      p
#   ---------  --  --------------  -----------  -----  ----
#   Condition   3       33.904        11.301    0.199  .897
#   Residual   62     3527.914        56.902
#   Total      65     3561.818
#
#   Eta-squared: 0.010
#
#   Tukey HSD Post-Hoc Comparisons
#   Comparison                 Mean Difference  95% CI Lower  95% CI Upper  p (adjusted)
#   -------------------------  ---------------  ------------  ------------  ------------
#   CBT-Control                     -1.128         -8.377         6.120          .976
#   Mindfulness-Control              0.467         -6.496         7.429          .998
#   Support group-Control           -1.217         -7.687         5.254          .960
#   Mindfulness-CBT                  1.595         -5.952         9.141          .944
#   Support group-CBT               -0.088         -7.183         7.007         1.000
#   Support group-Mindfulness       -1.683         -8.486         5.119          .914
#
# Things to look at:
#   - The ANOVA table: F and p under centered headers; 33.904, 3527.914
#     and 3561.818 lined up on the decimal point under "Sum of Squares".
#   - The Tukey table: the p column's decimal points in one line, 1.000
#     one character further left than the rest; the differences and CI
#     bounds lined up on their decimal points under centered headers.
#   - The Case Processing block above the tables is unchanged.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 14 -- the VIF note: both numbers to one place ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# f_vif's two predictors have a VIF of exactly 16, so the standard
# error inflation is exactly 4. The note under the table printed them
# through round() -- "VIF = 16 ... a factor of 4" beside a table
# showing 16.000.

jlm(y ~ x1 + x2, data = f_vif, diagnostics = "vif")

# Expected:
#   Linear Regression
#
#   Analysis N: 24
#
#   Coefficients
#                  b      SE     t      β      p
#   -----------  -----  -----  -----  -----  -----
#   (Intercept)  0.000  0.151  0.000         1.000
#   x1           1.067  0.270  3.953  0.514  <.001
#   x2           1.000  0.270  3.706  0.482   .001
#
#   Outcome: y
#
#   R-squared: 0.978    Adjusted R-squared: 0.976
#   Residual Standard Error: 0.739
#
#   F-statistic: 461.882 on 2 and 21 DF, p-value: <.001
#   Sum of Squares:
#     Regression: 504.404
#     Residual:   11.467
#     Total:      515.871
#
#   VIF (Variance Inflation Factors)
#   Variable    VIF
#   --------  ------
#   x1        16.000
#   x2        16.000
#
#   x1 (VIF = 16.0): standard error inflated by a factor of 4.0.
#     If you need to interpret this coefficient specifically, consider whether
#     the collinearity is a concern for your research question.
#   x2 (VIF = 16.0): standard error inflated by a factor of 4.0.
#     If you need to interpret this coefficient specifically, consider whether
#     the collinearity is a concern for your research question.
#
# Things to look at:
#   - The VIF table: 16.000 / 16.000 under a centered "VIF".
#   - Each note: "(VIF = 16.0): standard error inflated by a factor of
#     4.0." jlogistic's VIF note is the same code and reads the same.
#   - The Coefficients table and the lines under it are as before.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 15 -- the expected-frequency note: two places, and a pointer ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The smallest expected count is 4.96 in the first table and 4.998 in
# the second. Through round() to one place both notes read "less than
# 5 (minimum expected = 5)". Two places show 4.96; a minimum that
# would round up to 5.00 prints 4.99. Since v0.9.205 the note closes
# with a pointer to expected = TRUE, because it speaks of expected
# frequencies the table above it does not show; the third call adds
# expected = TRUE, and the cell itself reads 4.96 (it read 5.0).

jcrosstab(r ~ k, data = f_x496, chisq = TRUE)
jcrosstab(r ~ k, data = f_x4998, chisq = TRUE)
jcrosstab(r ~ k, data = f_x496, chisq = TRUE, expected = TRUE)

# Expected:
#   Cross-Tabulation
#
#   Analysis N: 100
#
#   Crosstab: r by k
#   r              1        2       Total
#   ---------    -----    -----    ------
#   1             6       25        31
#     (Row %)    19.4%    80.6%    100.0%
#
#   2            10       59        69
#     (Row %)    14.5%    85.5%    100.0%
#
#   Total        16       84       100
#
#   Chi-Square Test of Independence
#   Test                   Chi-Square  df    p    N
#   ---------------------  ----------  --  ----  ---
#   Pearson                   0.376     1  .540  100
#   Continuity Correction     0.101     1  .750  100
#
#   Note: 1 cell has an expected frequency less than 5 (minimum = 4.96).
#   Chi-square results may not be reliable.
#   To see the expected frequencies, add expected = TRUE.
#
#   Cross-Tabulation
#
#   Analysis N: 1000
#
#   Crosstab: r by k
#   r              1         2       Total
#   ---------    -----    ------    -------
#   1            10        41         51
#     (Row %)    19.6%     80.4%     100.0%
#
#   2            88       861        949
#     (Row %)     9.3%     90.7%     100.0%
#
#   Total        98       902       1000
#
#   Chi-Square Test of Independence
#   Test                   Chi-Square  df    p     N
#   ---------------------  ----------  --  ----  ----
#   Pearson                   5.848     1  .016  1000
#   Continuity Correction     4.737     1  .030  1000
#
#   Note: 1 cell has an expected frequency less than 5 (minimum = 4.99).
#   Chi-square results may not be reliable.
#   To see the expected frequencies, add expected = TRUE.
#
#   Cross-Tabulation
#
#   Analysis N: 100
#
#   Crosstab: r by k
#   r                 1        2       Total
#   ------------    -----    -----    ------
#   1                6       25        31
#     (Expected)     4.96    26.04     31.00
#     (Row %)       19.4%    80.6%    100.0%
#
#   2               10       59        69
#     (Expected)    11.04    57.96     69.00
#     (Row %)       14.5%    85.5%    100.0%
#
#   Total           16       84       100
#
#   Chi-Square Test of Independence
#   Test                   Chi-Square  df    p    N
#   ---------------------  ----------  --  ----  ---
#   Pearson                   0.376     1  .540  100
#   Continuity Correction     0.101     1  .750  100
#
#   Note: 1 cell has an expected frequency less than 5 (minimum = 4.96).
#   Chi-square results may not be reliable.
#
# Things to look at:
#   - The first note: "less than 5 (minimum = 4.96)."
#   - The second: "(minimum = 4.99)", never 5.00.
#   - Each note keeps to one line, with "Chi-square results may not be
#     reliable." beneath it, and under that the pointer: "To see the
#     expected frequencies, add expected = TRUE."
#   - The third call HAS expected = TRUE, so its note has no pointer
#     line: two lines, then the blank.
#   - In the third table the first cell's expected count reads 4.96,
#     the number the note gives as the minimum. Expected counts print
#     to two places; the Total column reads 31.00 and 69.00.
#   - Each table: a blank line between the two categories and before
#     Total, and the columns four spaces apart. Sections 17 and 21
#     show both at other sizes.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 16 -- jfreq: the four columns block-centered, no line padded ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# jfreq's table was the last one outside the form: its columns
# right-justified under right-justified headers, and its section rows
# and spacer rows padded out to the table's width. A variable with
# missing rows, then one without.

jfreq(cl, Medication)
jfreq(cl, Condition)

# Expected:
#   Frequencies
#
#   70 Cases in the 1 Variable Pool
#
#   Medication
#
#                    Freq  Total %  Valid %  Cum. %
#   ---------------  ----  -------  -------  ------
#   Valid
#   0: No             39     55.71    60.00   60.00
#   1: Yes            26     37.14    40.00  100.00
#   Total valid       65     92.86   100.00
#
#   Missing
#   -99 ["Refused"]    5      7.14       --      --
#
#   Total             70    100.00
#
#   Frequencies
#
#   70 Cases in the 1 Variable Pool
#
#   Condition
#
#                     Freq  Total %  Valid %  Cum. %
#   ----------------  ----  -------  -------  ------
#   1: Control         18     25.71   25.71    25.71
#   2: CBT             14     20.00   20.00    45.71
#   3: Mindfulness     17     24.29   24.29    70.00
#   4: Support group   21     30.00   30.00   100.00
#
#   Total              70    100.00
#
# Things to look at:
#   - Each header sits over the middle of its column. The counts sit
#     one place in from each edge of "Freq"; "Total %" and "Valid %"
#     each have one spare space, which goes on the LEFT (the S328 lean);
#     100.00 fills "Cum. %". (Re-pinned S348: the "Total valid" row of
#     ruling R7 puts 100.00 under "Valid %", which widened its block.)
#   - Counts on their ones digit (39, 26, 5, 70), percentages on the
#     decimal point, "--" at the right of its block.
#   - One blank line, not two, between the first call's Total row and
#     the second call's title: every analysis function now ends on
#     exactly one (S328). jfreq always ended on two.
#   - The second table is flat -- no Valid or Missing row -- and
#     aligned the same way.
#   - NOT visible here: "Valid", "Missing" and the two spacer rows carry
#     no trailing spaces (format_check.R M03 sees it).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 17 -- jcrosstab: the cells on the decimal point; the chi-square ----
#               table
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Every cell of a crosstab is text, so the renderer's default left-
# justified them all and trimmed the indent the sub-row labels are
# built with. The cells are aligned on the decimal point now, and the
# chi-square table is block-centered (each of its cells was centered
# on its own). Since v0.9.205 expected counts print to two places, a
# blank line separates the row groups, and a table with room sets its
# columns four spaces apart: the first table here is too wide for
# that (it would be 84 characters, against a message width of 76) and
# keeps two; the second takes four.

jcrosstab(SoughtHelp ~ Condition, data = cl, expected = TRUE, chisq = TRUE)
jcrosstab(Volunteer ~ OwnsHome, data = cm, chisq = TRUE,
          residuals = "adjusted")

# Expected:
#   Cross-Tabulation
#
#   Analysis N: 70
#
#   Crosstab: SoughtHelp by Condition
#   SoughtHelp    1: Control  2: CBT  3: Mindfulness  4: Support group   Total
#   ------------  ----------  ------  --------------  ----------------  ------
#   0: No            13         9          13               14           49
#     (Expected)     12.60      9.80       11.90            14.70        49.00
#     (Row %)        26.5%     18.4%       26.5%            28.6%       100.0%
#
#   1: Yes            5         5           4                7           21
#     (Expected)      5.40      4.20        5.10             6.30        21.00
#     (Row %)        23.8%     23.8%       19.0%            33.3%       100.0%
#
#   Total            18        14          17               21           70
#
#   Chi-Square Test of Independence
#   Chi-Square  df    p    N
#   ----------  --  ----  --
#      0.710     3  .871  70
#
#   Note: 1 cell has an expected frequency less than 5 (minimum = 4.20).
#   Chi-square results may not be reliable.
#
#   Cross-Tabulation
#
#   Analysis N: 103
#
#   Crosstab: Volunteer by OwnsHome
#   Volunteer       1: Yes     2: No     Total
#   ------------    ------    ------    ------
#   0: No           19        35         54
#     (Row %)       35.2%     64.8%     100.0%
#     (Adj.Res.)    -2.438     2.438
#
#   1: Yes          29        20         49
#     (Row %)       59.2%     40.8%     100.0%
#     (Adj.Res.)     2.438    -2.438
#
#   Total           48        55        103
#
#   Chi-Square Test of Independence
#   Test                   Chi-Square  df    p    N
#   ---------------------  ----------  --  ----  ---
#   Pearson                   5.946     1  .015  103
#   Continuity Correction     5.020     1  .025  103
#
# Things to look at:
#   - In each cell the count's ones digit sits over the ones digit of
#     the expected count and of the percentage: 13 over 12.60 over
#     26.5%; 5 over 5.40 over 23.8%. The observed and expected counts
#     read straight down.
#   - The expected counts have two places, and the one cell under 5
#     reads 4.20 -- the minimum the note gives.
#   - The (Expected), (Row %) and (Adj.Res.) labels are indented two
#     spaces under their row label; the row labels and Total are flush
#     left.
#   - Each column's block sits under the middle of its header; "Total"
#     is over 49 / 49.00 / 100.0%.
#   - A blank line before "1: Yes" and before "Total", in both tables.
#   - The first table's columns are two spaces apart, the second's
#     four. The chi-square tables keep two under either.
#   - The residuals stay on the decimal point with or without a minus
#     sign: -2.438 over 2.438 under "1: Yes". (At joutput("full")
#     their * markers trail the number.)
#   - The chi-square tables: 0.710 under the middle of "Chi-Square", the
#     df of 3 under the "f" of "df"; in the 2 x 2 table the two rows
#     share a right edge in every column.
#   - The first call's note has no pointer line (expected = TRUE is in
#     the call) and ends on ONE blank line.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 18 -- jcorr: the matrix keeps its left edge and loses its padding ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# jcorr's cells are text -- a correlation with its p-value, an N -- and
# they stay flush left under flush-left headers, the sign slot keeping
# the decimal points in line (the S328 ruling left this table's
# alignment alone). What changed is invisible: every line was padded
# to the table's width.

jcorr(cl, Stress, SocialSupport, Flourishing)
jcorr(cl, Stress, SocialSupport, Flourishing, layout = "stacked")

# Expected:
#   Pearson Bivariate Correlations
#
#   70 Cases in the 3 Variable Pool; 66 Complete on All
#
#   Missing data   From 70   %
#       Stress
#         Missing     4     5.7
#   ---------------------------
#
#   Bivariate Correlations (Pearson)
#                  Stress          SocialSupport   Flourishing
#   -------------  --------------  --------------  -----------
#   Stress          1
#
#   SocialSupport  -.221 (p=.075)   1
#                  N=66
#
#   Flourishing    -.304 (p=.013)   .378 (p=.001)   1
#                  N=66            N=70
#
#   Pearson Bivariate Correlations
#
#   70 Cases in the 3 Variable Pool; 66 Complete on All
#
#   Missing data   From 70   %
#       Stress
#         Missing     4     5.7
#   ---------------------------
#
#   Bivariate Correlations (Pearson)
#                  Stress  SocialSupport  Flourishing
#   -------------  ------  -------------  -----------
#   Stress          1
#
#   SocialSupport  -.221    1
#                  p=.075
#                  N=66
#
#   Flourishing    -.304    .378           1
#                  p=.013  p=.001
#                  N=66    N=70
#
# Things to look at:
#   - Both layouts read as they did at v0.9.203: each column's cells
#     start under the first letter of its header, a positive r one
#     place in so its decimal point sits under a negative r's.
#   - NOT visible here: no line ends in a space, and the spacer rows
#     between variables are empty lines (format_check.R O10 sees it).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 19 -- the coefficient tables and the dummy-coding scheme ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The jlm and jlogistic coefficient tables were decimal-tabbed: header
# centered, values at the column's right edge, so "95% CI Lower" sat
# off its values. They are block-centered now, like every other
# statistics table. The dummy-coding scheme took the renderer's
# default, its 0s and 1s at the right edge of headers twenty
# characters wide.

jlm(Flourishing ~ Stress + SocialSupport, data = cl, ci = TRUE)
jdummy(cl, Condition, show = TRUE)
jlm(Flourishing ~ Stress + Condition, data = cl)
jdummy(clear.all = TRUE)

# Expected:
#   Linear Regression
#
#   Case Processing    Excluded  Remaining
#       Original             --         70
#       Auto-listwise         4         66
#       Analysis N           --         66
#
#   Missing data   From 70   %
#       Stress
#         Missing     4     5.7
#   --------------------------------------
#
#   Coefficients
#                     b      SE      t       β      p    95% CI Lower  95% CI Upper
#   -------------  ------  -----  ------  ------  -----  ------------  ------------
#   (Intercept)    41.495  6.575   6.311          <.001     28.355        54.634
#   Stress         -0.436  0.221  -1.974  -0.226   .053     -0.878         0.005
#   SocialSupport   1.039  0.336   3.090   0.354   .003      0.367         1.711
#
#   Outcome: Flourishing
#
#   R-squared: 0.212    Adjusted R-squared: 0.187
#   Residual Standard Error: 12.863
#
#   F-statistic: 8.480 on 2 and 63 DF, p-value: <.001
#   Sum of Squares:
#     Regression: 2806.260
#     Residual:   10424.225
#     Total:      13230.485
#
#   Dummy Variable Registration
#     Variable: Condition
#     Reference category: Condition_Control (default; change with ref =)
#     Dummy variables: Condition_CBT, Condition_Mindfulness, Condition_Support_group
#     Cases: 70 (0 missing)
#
#     Dummy Coding Scheme:
#
#                                   Condition_Control*  Condition_CBT  Condition_Mindfulness  Condition_Support_group
#       --------------------------  ------------------  -------------  ---------------------  -----------------------
#       1: Condition_Control*                1                0                  0                       0
#       2: Condition_CBT                     0                1                  0                       0
#       3: Condition_Mindfulness             0                0                  1                       0
#       4: Condition_Support_group           0                0                  0                       1
#
#       * Reference category
#
#   Note: this registration is stored for this session only.
#   To keep it across sessions, save the data frame in R format (.rds):
#     jsave(cl, "cl.rds")
#
#   Next session, load that file to restore the registration:
#     jload("cl.rds")
#
#   Linear Regression
#
#   Case Processing    Excluded  Remaining
#       Original             --         70
#       Auto-listwise         4         66
#       Analysis N           --         66
#
#   Missing data   From 70   %
#       Stress
#         Missing     4     5.7
#   --------------------------------------
#
#   Coefficients
#                                    b      SE      t       β      p
#   ----------------------------  ------  -----  ------  ------  -----
#   (Intercept)                   51.430  4.421  11.632          <.001
#   Stress                        -0.595  0.210  -2.827  -0.309   .006
#   Condition (ref = 1: Control)
#     2: CBT                      13.987  4.555   3.070           .003
#     3: Mindfulness              14.100  4.371   3.226           .002
#     4: Support group             3.815  4.069   0.938           .352
#
#   Outcome: Flourishing
#
#   R-squared: 0.280    Adjusted R-squared: 0.233
#   Residual Standard Error: 12.499
#
#   F-statistic: 5.923 on 4 and 61 DF, p-value: <.001
#   Sum of Squares:
#     Regression: 3701.084
#     Residual:   9529.401
#     Total:      13230.485
#
#   Dummy registrations cleared across all data frames (cl).
#
# Things to look at:
#   - The first table: 28.355, -0.878 and 0.367 under the middle of
#     "95% CI Lower", lined up on the decimal point; the same under
#     "95% CI Upper". The values under b, SE, t, the standardized
#     column and p sit where they did; the headers b, SE, t and the
#     beta are one place right of where they were (the S328 lean).
#   - The scheme: each 0 and 1 under the middle of its category name.
#   - The registration block (v0.9.205): "Variable: Condition" with
#     nothing after the name, and the reference category marked
#     "(default; change with ref =)". Section 22 shows the other forms.
#   - The grouped predictor: "Condition (ref = 1: Control)" on a row of
#     its own, its three categories indented two spaces, their
#     standardized cells blank.
#   - jlogistic's coefficient table is in Section 7: its df of 1 now
#     sits under the "f" of "df", as the Omnibus table's does.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 20 -- jdesc: Min and Max at each variable's own places ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Min and Max are values of the variable, so they keep the data's
# precision (S326). With several variables in one table the two
# columns took ONE precision from the values in them, and a
# whole-number variable printed 0.0 and 75.0 beside another's 4.8 and
# 9.7. Each variable now shows the places its own data carry.

jdesc(cl, Flourishing, SleepHours, ScreenTime, Stress)

# Expected:
#   Descriptive Statistics
#
#   70 Cases in the 4 Variable Pool; 62 Complete on All
#
#   Note: Listwise deletion using jcomplete() first would leave 62 cases.
#
#   Variable     Total  Non_missing  Min   Max   Mean     SD
#   -----------  -----  -----------  ---  ----  ------  ------
#   Flourishing    70        70      0    75    49.600  13.865
#   SleepHours     70        66      4.8   9.7   7.182   1.291
#   ScreenTime     70        70      0.0   8.1   4.119   1.996
#   Stress         70        66      0    40    15.182   7.403
#
# Things to look at:
#   - Flourishing 0 and 75, and Stress 0 and 40: whole numbers, as the
#     data are. SleepHours 4.8 and 9.7.
#   - ScreenTime 0.0 and 8.1: it is measured to a tenth, and its
#     minimum happens to be exactly zero. The places come from the
#     variable's data, not from the two values printed.
#   - The two columns line up on the decimal point: 0 over the 4 of
#     4.8, the 5 of 75 over the 9 of 9.7.
#   - Mean and SD are statistics and keep three places throughout.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 21 -- jcrosstab: the row groups, the column gap, the residual ----
#               note
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Three things from the v0.9.205 build that Sections 15 and 17 do not
# show. (1) With row.pct = FALSE and nothing else asked for, every
# category is a single line, so NO blank lines are added. (2) Four
# categories with row percentages: a blank line before each category
# after the first, and before Total. (3) At joutput("full") the
# adjusted-residuals note has one blank line above it; it sat directly
# under the chi-square table.

jcrosstab(Volunteer ~ OwnsHome, data = cm, row.pct = FALSE)
jcrosstab(Condition ~ SoughtHelp, data = cl)
joutput("full")
jcrosstab(r ~ k, data = f_x496, chisq = TRUE, residuals = "adjusted")
joutput(NULL)

# Expected:
#   Cross-Tabulation
#
#   Analysis N: 103
#
#   Crosstab: Volunteer by OwnsHome
#   Volunteer    1: Yes    2: No    Total
#   ---------    ------    -----    -----
#   0: No          19        35       54
#   1: Yes         29        20       49
#   Total          48        55      103
#
#   Cross-Tabulation
#
#   Analysis N: 70
#
#   Crosstab: Condition by SoughtHelp
#   Condition           0: No    1: Yes     Total
#   ----------------    -----    ------    ------
#   1: Control          13         5        18
#     (Row %)           72.2%     27.8%    100.0%
#
#   2: CBT               9         5        14
#     (Row %)           64.3%     35.7%    100.0%
#
#   3: Mindfulness      13         4        17
#     (Row %)           76.5%     23.5%    100.0%
#
#   4: Support group    14         7        21
#     (Row %)           66.7%     33.3%    100.0%
#
#   Total               49        21        70
#
#   Output Settings
#   Level: full
#     effect.size: ON
#     regression.ci: ON
#     means.ci: ON
#     posthoc: ON
#     diagnostics: OFF
#     case.processing: ON
#     case.processing.detail: PER_CODE
#     case.processing.filter: LIST
#     variable.id: LEGEND
#     value.id: BOTH
#     ref.categories: ON
#     missing.notice: ON
#     digits: 3
#
#   Cross-Tabulation
#
#   Case Processing  Excluded  Remaining
#       Original           --        100
#       Analysis N         --        100
#   ------------------------------------
#
#   Crosstab: r by k
#   r                  1         2       Total
#   ------------    ------    ------    ------
#   1                6        25         31
#     (Row %)       19.4%     80.6%     100.0%
#     (Adj.Res.)     0.613    -0.613
#
#   2               10        59         69
#     (Row %)       14.5%     85.5%     100.0%
#     (Adj.Res.)    -0.613     0.613
#
#   Total           16        84        100
#
#   Chi-Square Test of Independence
#   Test                   Chi-Square  df    p    N
#   ---------------------  ----------  --  ----  ---
#   Pearson                   0.376     1  .540  100
#   Continuity Correction     0.101     1  .750  100
#
#   Note: 1 cell has an expected frequency less than 5 (minimum = 4.96).
#   Chi-square results may not be reliable.
#   To see the expected frequencies, add expected = TRUE.
#
#   Note: Adjusted residuals are approximately normal under independence.
#   A value beyond +/-1.96 (marked *) departs from expected at p < .05.
#   With 4 cells, a Bonferroni-adjusted cutoff is +/-2.50 (marked **).
#
#   Output Settings
#   Reset to defaults (standard, no toggle overrides).
#
# Things to look at:
#   - The first table: three lines under the separator and no blank
#     line among them. Its columns are four spaces apart.
#   - The second: four row groups, each a category and its (Row %)
#     line, a blank line between each pair and one before Total. No
#     blank line between the separator and "1: Control".
#   - The third, at joutput("full"): the expected-frequency note with
#     its pointer line, ONE blank line, then the adjusted-residuals
#     note, then ONE blank line. Under a chi-square table with no
#     expected-frequency note the residual note is set off the same
#     way.
#   - The Case Processing block in the third output belongs to the
#     "full" level, not to this build.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 22 -- jdummy: the registration lines ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Two changes from Jeff's walk of Section 19. The Variable line named
# R's storage class after the name ("Condition (haven_labelled)"); it
# is gone. And the Reference category line now says when the category
# was chosen by default, and names the argument that changes it; a
# reference the user names carries nothing. Two variables registered
# by default, then one re-registered with a named reference, then the
# overview.

jdummy(cl, Condition, Medication)
jdummy(cl, Condition, ref = "CBT")
jdummy()
jdummy(clear.all = TRUE)

# Expected:
#   Dummy Variable Registration
#     Variable: Condition
#     Reference category: Condition_Control (default; change with ref =)
#     Dummy variables: Condition_CBT, Condition_Mindfulness, Condition_Support_group
#     Cases: 70 (0 missing)
#
#     Variable: Medication
#     Reference category: Medication_No (default; change with ref =)
#     Dummy variables: Medication_Yes
#     Cases: 70 (5 missing)
#
#   Note: registrations are stored for this session only.
#   To keep them across sessions, save the data frame in R format (.rds):
#     jsave(cl, "cl.rds")
#
#   Next session, load that file to restore the registrations:
#     jload("cl.rds")
#
#   Dummy Variable Registration
#     Variable: Condition
#     Reference category: Condition_CBT
#     Dummy variables: Condition_Control, Condition_Mindfulness, Condition_Support_group
#     Cases: 70 (0 missing)
#
#   Note: this registration is stored for this session only.
#   To keep it across sessions, save the data frame in R format (.rds):
#     jsave(cl, "cl.rds")
#
#   Next session, load that file to restore the registration:
#     jload("cl.rds")
#
#   Dummy Variable Registrations
#   Data frame: cl
#
#     Variable: Condition
#     Reference category: 2: Condition_CBT
#     Dummy variables: Condition_Control, Condition_Mindfulness, Condition_Support_group
#     Cases: 70 (0 missing)
#
#     Variable: Medication
#     Reference category: 0: Medication_No (default; change with ref =)
#     Dummy variables: Medication_Yes
#     Cases: 70 (5 missing)
#
#   Dummy registrations cleared across all data frames (cl).
#
# Things to look at:
#   - The first call: both Variable lines are the name alone, and both
#     Reference category lines end "(default; change with ref =)".
#     Medication's default is its "No" category (a two-category
#     variable models the affirmative one).
#   - The second call names the reference: "Reference category:
#     Condition_CBT" with nothing after it.
#   - The overview prints each reference with its code ("2:
#     Condition_CBT", "0: Medication_No") and tags only Medication,
#     the one still on its default.
#   - Nowhere does "haven_labelled" appear.
#   - Since v0.9.216 each registration ends on ONE blank line, so the next
#     call's title is set off from the reminder above it (it sat directly
#     under jload("cl.rds")). The overview, which prints no reminder,
#     ended on one already.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 23 -- Games-Howell beside Tukey: unequal sizes and spreads ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Three groups of 6, 8 and 4 cases with means 5, 7 and 11; group b is
# far more spread out than the other two. First the standard ANOVA
# with Tukey HSD, then Welch's with Games-Howell, on the same data.

f_gh <- data.frame(g = c(rep("a", 6), rep("b", 8), rep("c", 4)),
                   y = c(4, 5, 6, 5, 4, 6,  2, 9, 4, 11, 6, 13, 1, 10,
                         10, 11, 12, 11),
                   stringsAsFactors = FALSE)

jaov(y ~ g, data = f_gh, posthoc = TRUE, diagnostics = TRUE)
jaov(y ~ g, data = f_gh, welch = TRUE, posthoc = TRUE)

# Expected:
#   One-Way ANOVA
#
#   Analysis N: 18
#
#   Levene's Test for Homogeneity of Variance
#      F    df1  df2    p
#   ------  ---  ---  -----
#   12.823   2    15  <.001
#
#   Note: Levene's test is significant (p < .001).
#   The largest group is 2.0 times the smallest, and the largest SD is 5.4 times
#   the smallest.
#   Both are beyond the usual guidelines, so the p-value of the standard ANOVA
#   may not be reliable.
#   Welch's ANOVA does not assume equal variances: welch = TRUE.
#   See ?jaov.
#
#   Group Descriptives: y by g
#   Group  N   Mean     SD   95% CI Lower  95% CI Upper
#   -----  -  ------  -----  ------------  ------------
#   a      6   5.000  0.894      4.061         5.939
#   b      8   7.000  4.408      3.315        10.685
#   c      4  11.000  0.816      9.701        12.299
#
#   ANOVA: y by g
#   Source    df  Sum of Squares  Mean Square    F      p
#   --------  --  --------------  -----------  -----  ----
#   g          2       87.111        43.556    4.601  .028
#   Residual  15      142.000         9.467
#   Total     17      229.111
#
#   Eta-squared: 0.380
#
#   Tukey HSD Post-Hoc Comparisons
#   Comparison  Mean Difference  95% CI Lower  95% CI Upper  p (adjusted)
#   ----------  ---------------  ------------  ------------  ------------
#   b-a              2.000          -2.316         6.316         .469
#   c-a              6.000           0.841        11.159         .022
#   c-b              4.000          -0.894         8.894         .119
#
#   Welch's One-Way ANOVA
#
#   Analysis N: 18
#
#   Group Descriptives: y by g
#   Group  N   Mean     SD   95% CI Lower  95% CI Upper
#   -----  -  ------  -----  ------------  ------------
#   a      6   5.000  0.894      4.061         5.939
#   b      8   7.000  4.408      3.315        10.685
#   c      4  11.000  0.816      9.701        12.299
#
#   Welch's ANOVA: y by g
#      F    df1  df2    p
#   ------  ---  ---  -----
#   56.095   2   9.4  <.001
#
#   Note: Sum of Squares and Mean Square are not applicable to Welch's ANOVA.
#   For the standard ANOVA table, run jaov() without welch = TRUE.
#
#   Eta-squared: 0.380
#   (Note: Eta-squared is calculated from the traditional SS decomposition.)
#
#   Games-Howell Post-Hoc Comparisons
#   Comparison  Mean Difference  95% CI Lower  95% CI Upper   df  p (adjusted)
#   ----------  ---------------  ------------  ------------  ---  ------------
#   b-a              2.000          -2.604         6.604     7.8       .461
#   c-a              6.000           4.388         7.612     7.0      <.001
#   c-b              4.000          -0.615         8.615     7.9       .087
#
# Things to look at:
#   - Group b's SD is several times the others', and Levene's test in
#     the first output is significant, with its note pointing to
#     welch = TRUE. One blank line separates the note from the table
#     (Jeff's S341 walk: with none it was "harder to read"), the note
#     reads "p < .001", not "p = <.001", and its first sentence is on
#     one line. Since v0.9.219 the note states the two ratios and gives
#     one of three verdicts (Section 27); this is the third, "beyond the
#     usual guidelines".
#   - The two post-hoc tables list the same three pairs in the same
#     order, with the same mean differences 2.000, 6.000 and 4.000.
#   - Tukey's table has no df column (every pair is judged on the
#     ANOVA's one error df). Games-Howell's has one, and its three
#     values differ: 7.8, 7.0, 7.9.
#   - The intervals and p-values differ between the tables. For c-a,
#     the two tight groups, Games-Howell's interval is much the
#     narrower and its p much smaller: Tukey judges that pair on a
#     pooled variance that group b inflates.
#   - These Games-Howell numbers are the ones rstatix's
#     games_howell_test() gives for the same data (format_check.R U01).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 24 -- a group of one case ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The same data with one more group holding a single case. The standard
# ANOVA runs, since it pools the variance; until 0.9.215 R's own
# "Warning in stats::qt(0.975, df = n - 1) : NaNs produced" printed
# above the descriptives. Welch's ANOVA cannot run -- one case has no
# variance -- and stopped on R's "not enough observations" after the
# descriptives had printed. The stop is shown through tryCatch(), so
# the file still runs end to end.

f_solo <- rbind(data.frame(g = c(rep("a", 6), rep("b", 8), rep("c", 4)),
                           y = c(4, 5, 6, 5, 4, 6,  2, 9, 4, 11, 6, 13, 1, 10,
                                 10, 11, 12, 11),
                           stringsAsFactors = FALSE),
                data.frame(g = "solo", y = 9.5, stringsAsFactors = FALSE))

jaov(y ~ g, data = f_solo, posthoc = TRUE)
tryCatch(jaov(y ~ g, data = f_solo, welch = TRUE, posthoc = TRUE),
         error = function(e) cat("Error: ", conditionMessage(e), "\n", sep = ""))

# Expected:
#   One-Way ANOVA
#
#   Analysis N: 19
#
#   Group Descriptives: y by g
#   Group  N   Mean     SD   95% CI Lower  95% CI Upper
#   -----  -  ------  -----  ------------  ------------
#   a      6   5.000  0.894      4.061         5.939
#   b      8   7.000  4.408      3.315        10.685
#   c      4  11.000  0.816      9.701        12.299
#   solo   1   9.500
#
#   ANOVA: y by g
#   Source    df  Sum of Squares  Mean Square    F      p
#   --------  --  --------------  -----------  -----  ----
#   g          3       92.026        30.675    3.240  .052
#   Residual  15      142.000         9.467
#   Total     18      234.026
#
#   Eta-squared: 0.393
#
#   Tukey HSD Post-Hoc Comparisons
#   Comparison  Mean Difference  95% CI Lower  95% CI Upper  p (adjusted)
#   ----------  ---------------  ------------  ------------  ------------
#   b-a               2.000          -2.789        6.789         .634
#   c-a               6.000           0.276       11.724         .038
#   solo-a            4.500          -5.078       14.078         .545
#   c-b               4.000          -1.430        9.430         .191
#   solo-b            2.500          -6.906       11.906         .868
#   solo-c           -1.500         -11.414        8.414         .971
#
#   Welch's One-Way ANOVA
#
#   Analysis N: 19
#
#   Error: jaov(): 'g' has 1 category with only 1 case (solo).
#   Welch's ANOVA requires at least 2 cases in every category.
#   The standard ANOVA can include it: run jaov() without welch = TRUE.
#
# Things to look at:
#   - No warning above the first Group Descriptives table.
#   - The solo row: N 1 and its mean, then nothing under SD or either
#     end of the interval. The other rows are complete.
#   - Tukey's table includes the three solo pairs.
#   - The Welch call prints its title and N line, then stops: the
#     category is named, the requirement is on the second line, and the
#     third line gives the way out. No descriptives table is printed
#     under it.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 25 -- jscreen: the star and its legend; a column that holds no ----
#               values (S342)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Two things in jscreen()'s Variable Types table (v0.9.216). A variable
# coded 1/2 is a dichotomy with a star, and a one-line legend under the
# table says what the star means. Registered with jnumeric() it is
# Numeric and has no sub-class, so there is no cell to carry the star --
# but the legend went on printing, and beside another variable's
# sub-class the cell held "*" and nothing else. And a frame with a list
# column (a tibble's, or the geometry column of a spatial data frame)
# stopped after the title on R's "invalid 'type' (list) of argument".

f_st <- data.frame(Sex = rep(1:2, 10), Grp = rep(1:4, 5))
jscreen(f_st)
jnumeric(f_st, Sex)
jscreen(f_st)
jnumeric(clear.all = TRUE)

# Expected:
#   Data Screening
#     Cases: 20
#     Variables: 2
#     Cases with missing data: 0
#     Variables with outliers: 0
#
#   Variable Types
#   Variable  jstats Class  Sub-class   Unique Values
#   --------  ------------  ----------  -------------
#   Sex       Categorical   dichotomy*        2
#   Grp       Categorical   4-category        4
#   * coded other than 0/1; mean is not a proportion
#
#   Numeric registration set for 'Sex' in f_st.
#   Note: this registration is stored for this session only.
#   To keep it across sessions, save the data frame in R format (.rds):
#     jsave(f_st, "f_st.rds")
#
#   Next session, load that file to restore the registration:
#     jload("f_st.rds")
#   Data Screening
#     Cases: 20
#     Variables: 2
#     Cases with missing data: 0
#     Variables with outliers: 0
#
#   Variable Types
#   Variable  jstats Class  Sub-class   Source         Unique Values
#   --------  ------------  ----------  -------------  -------------
#   Sex       Numeric                   User-declared        2
#   Grp       Categorical   4-category                       4
#
#   Numeric registrations cleared across all data frames (f_st).
#
# Things to look at:
#   - The first table: Sex is "dichotomy*", and the legend line sits
#     directly under the table.
#   - The second, after jnumeric(): Sex is Numeric and User-declared,
#     its Sub-class cell is EMPTY, and no legend line prints.

f_un <- data.frame(id = 1:4, x = c(2.5, NA, 4, 8))
f_un$geom <- list(1:2, 1:3, "a", NA)
f_un$raw  <- as.raw(c(1, 1, 2, 3))
jscreen(f_un)
tryCatch(jfreq(f_un, geom),
         error = function(e) cat("Error: ", conditionMessage(e), "\n", sep = ""))

# Expected:
#   Data Screening
#     Cases: 4
#     Variables: 4
#     Cases with missing data: 2
#     Variables with outliers: 0
#
#   Variable Types
#   Variable  jstats Class  Sub-class   Unique Values
#   --------  ------------  ----------  -------------
#   id        Categorical   4-category        4
#   x         Numeric                         3
#   geom      Unsupported                     3
#   raw       Unsupported                     3
#
#   Missing Data & Outliers (outliers > 3 SD from mean)
#   Variable  Missing  % Missing
#   --------  -------  ---------
#   x            1        25.0
#   geom         1        25.0
#
#   Error: 'geom' is of type list and cannot be used in a frequency table.
#
# Things to look at:
#   - jscreen() runs: geom and raw are Unsupported rows, with a count of
#     distinct values and nothing else. The other two rows are what they
#     would be without them.
#   - "Cases with missing data: 2": x is missing in the second case and
#     geom's fourth cell is NA.
#   - jfreq() on the list column stops before its title, in the words
#     the analysis functions use for a type they cannot take. It printed
#     its title and "4 Cases in the 1 Variable Pool", then R's "all
#     arguments must have the same length".


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 26 -- a computed vector is named as typed (S342) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# jfreq(), jdesc() and jscreen() take a single variable in place of a
# data frame. A column of a data frame is named for the column
# (f_aov$y is y). Anything computed was named with whatever followed
# the last dollar sign of the text, so the first table below was titled
# "y > 14]" and the second row read "y)"; and the fix line built from
# the same split, for a second variable, read
# jfreq(f_aov$g[f_aov, y > 14], y).

jfreq(f_aov$g[f_aov$y > 14])
jdesc(log(f_aov$y))
tryCatch(jfreq(f_aov$g[f_aov$y > 14], y),
         error = function(e) cat("Error: ", conditionMessage(e), "\n", sep = ""))

# Expected:
#   Frequencies
#
#   7 Cases in the 1 Variable Pool
#
#   f_aov$g[f_aov$y > 14]
#
#          Freq  Total %  Valid %  Cum. %
#   -----  ----  -------  -------  ------
#   a        3     42.86   42.86    42.86
#   b        3     42.86   42.86    85.71
#   c        1     14.29   14.29   100.00
#
#   Total    7    100.00
#
#   Descriptive Statistics
#
#   12 Cases in the 1 Variable Pool
#
#   Variable      Total  Non_missing   Min    Max    Mean    SD
#   ------------  -----  -----------  -----  -----  -----  -----
#   log(f_aov$y)    12        12      2.485  2.890  2.702  0.115
#
#   Error: jfreq(): y needs the data frame, not the single column
#   f_aov$g[f_aov$y > 14].
#   Name the data frame first, and each variable on its own.
#
# Things to look at:
#   - The frequency table's title is the expression as typed.
#   - jdesc()'s row is named log(f_aov$y), and the Variable column is
#     as wide as that name.
#   - The stop gives the sentence and no fix line: a computed vector has
#     no data frame to name in one.
#   - A plain column is named as before: jfreq(f_aov$g) is titled "g".


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 27 -- the note under a significant Levene's test, in jaov() ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Session 346 (v0.9.219), on Jeff's ruling of 8 October 2026. Until then
# the note said "the standard test remains appropriate" whenever the
# largest group was within 1.5 times the smallest, whatever the SDs, and
# "consider welch = TRUE" otherwise. It now states the two ratios that
# decide how much a significant test matters and gives one of three
# verdicts, because the textbooks draw the line in different places.
# groups() builds groups of the sizes, SDs and means it is given, so each
# frame sits where it is meant to.

groups <- function(n, sd, mean) {
  y <- unlist(Map(function(k, s, m) {
    z <- stats::qnorm(stats::ppoints(k))
    m + s * z / stats::sd(z)
  }, n, sd, mean))
  data.frame(g = rep(letters[seq_along(n)], n), y = round(y, 3))
}

# Render 1 -- sizes within 1.25 of each other and SDs within 2.
f_in <- groups(n = c(30, 30, 26), sd = c(1, 1.4, 1.9), mean = c(5, 6, 7))
jaov(y ~ g, data = f_in, diagnostics = TRUE)

# Expected:
#   One-Way ANOVA
#
#   Analysis N: 86
#
#   Levene's Test for Homogeneity of Variance
#     F    df1  df2    p
#   -----  ---  ---  ----
#   4.803   2    83  .011
#
#   Note: Levene's test is significant (p = .011).
#   The largest group is 1.2 times the smallest, and the largest SD is 1.9 times
#   the smallest.
#   Both are within the usual guidelines, so the standard ANOVA is usually
#   still acceptable.
#   See ?jaov.
#
#   Group Descriptives: y by g
#   Group   N   Mean    SD   95% CI Lower  95% CI Upper
#   -----  --  -----  -----  ------------  ------------
#   a      30  5.000  1.000      4.627         5.373
#   b      30  6.000  1.400      5.477         6.523
#   c      26  7.000  1.900      6.233         7.767
#
#   ANOVA: y by g
#   Source    df  Sum of Squares  Mean Square     F      p
#   --------  --  --------------  -----------  ------  -----
#   g          2       55.814        27.907    13.153  <.001
#   Residual  83      176.099         2.122
#   Total     85      231.913
#
#   Eta-squared: 0.241

# Render 2 -- between the guidelines: sizes 1.5 apart, SDs 2.1 apart.
f_mid <- groups(n = c(30, 24, 20), sd = c(1, 1, 2.1), mean = c(5, 6, 7))
jaov(y ~ g, data = f_mid, diagnostics = TRUE)

# Expected:
#   One-Way ANOVA
#
#   Analysis N: 74
#
#   Levene's Test for Homogeneity of Variance
#     F    df1  df2    p
#   -----  ---  ---  -----
#   8.367   2    71  <.001
#
#   Note: Levene's test is significant (p < .001).
#   The largest group is 1.5 times the smallest, and the largest SD is 2.1 times
#   the smallest.
#   Guidelines differ on whether the standard ANOVA is acceptable at
#   these values.
#   Welch's ANOVA does not assume equal variances: welch = TRUE.
#   See ?jaov.
#
#   Group Descriptives: y by g
#   Group   N   Mean    SD   95% CI Lower  95% CI Upper
#   -----  --  -----  -----  ------------  ------------
#   a      30  5.000  1.000      4.627         5.373
#   b      24  6.000  1.000      5.578         6.422
#   c      20  7.000  2.100      6.017         7.983
#
#   ANOVA: y by g
#   Source    df  Sum of Squares  Mean Square     F      p
#   --------  --  --------------  -----------  ------  -----
#   g          2       48.649        24.324    12.718  <.001
#   Residual  71      135.791         1.913
#   Total     73      184.440
#
#   Eta-squared: 0.264

# Render 3 -- beyond every guideline: sizes 2 apart, SDs 2.6 apart.
f_out <- groups(n = c(40, 20, 20), sd = c(1, 1, 2.6), mean = c(5, 6, 7))
jaov(y ~ g, data = f_out, diagnostics = TRUE)
rm(groups, f_in, f_mid, f_out)

# Expected:
#   One-Way ANOVA
#
#   Analysis N: 80
#
#   Levene's Test for Homogeneity of Variance
#      F    df1  df2    p
#   ------  ---  ---  -----
#   14.378   2    77  <.001
#
#   Note: Levene's test is significant (p < .001).
#   The largest group is 2.0 times the smallest, and the largest SD is 2.6 times
#   the smallest.
#   Both are beyond the usual guidelines, so the p-value of the standard ANOVA
#   may not be reliable.
#   Welch's ANOVA does not assume equal variances: welch = TRUE.
#   See ?jaov.
#
#   Group Descriptives: y by g
#   Group   N   Mean    SD   95% CI Lower  95% CI Upper
#   -----  --  -----  -----  ------------  ------------
#   a      40  5.000  1.000      4.680         5.320
#   b      20  6.000  1.000      5.532         6.468
#   c      20  7.000  2.600      5.783         8.217
#
#   ANOVA: y by g
#   Source    df  Sum of Squares  Mean Square     F      p
#   --------  --  --------------  -----------  ------  -----
#   g          2       55.000        27.500    11.357  <.001
#   Residual  77      186.453         2.421
#   Total     79      241.453
#
#   Eta-squared: 0.228
#
# Things to look at:
#   - All three notes open the same way: the test is significant, then
#     the two ratios, read from the Group Descriptives table below (30
#     over 26 is 1.2; 1.900 over 1.000 is 1.9).
#   - RENDER 1: "Both are within the usual guidelines, so the standard
#     ANOVA is usually still acceptable." No welch = TRUE line: nothing
#     here calls for it.
#   - RENDER 2: "Guidelines differ on whether the standard ANOVA is
#     acceptable at these values.", then the line naming Welch's ANOVA
#     and the argument that runs it.
#   - RENDER 3: "Both are beyond the usual guidelines, so the p-value of
#     the standard ANOVA may not be reliable.", then the same Welch line.
#   - Each note ends "See ?jaov.": the help page's "Unequal variances"
#     section names the textbooks and gives the figures behind the three
#     verdicts.
#   - One blank line above the note and one below it, as in Section 23.
#   - Each call asks for the test with diagnostics = TRUE. levene = TRUE,
#     the argument until this build, is gone (Section 31).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 28 -- the same note in jt(), and when it does not print ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# jt() gives the same three verdicts with its own test names. With two
# groups the note says "larger" and "smaller", and when the groups are the
# same size it says so in place of a ratio.

groups <- function(n, sd, mean) {
  y <- unlist(Map(function(k, s, m) {
    z <- stats::qnorm(stats::ppoints(k))
    m + s * z / stats::sd(z)
  }, n, sd, mean))
  data.frame(g = rep(letters[seq_along(n)], n), y = round(y, 3))
}

# Render 1 -- the same size, SDs 1.9 apart.
t_in <- groups(n = c(40, 40), sd = c(1, 1.9), mean = c(5, 6))
jt(y ~ g, data = t_in, diagnostics = TRUE)

# Expected:
#   Independent Samples T-Test
#
#   Analysis N: 80
#
#   Levene's Test for Homogeneity of Variance
#      F    df1  df2    p
#   ------  ---  ---  -----
#   12.619   1    78  <.001
#
#   Note: Levene's test is significant (p < .001).
#   The groups are the same size, and the larger SD is 1.9 times the smaller.
#   Both are within the usual guidelines, so Student's t-test is usually
#   still acceptable.
#   See ?jt.
#
#   Group Descriptives: y by g
#   Group   N   Mean    SD
#   -----  --  -----  -----
#   a      40  5.000  1.000
#   b      40  6.000  1.900
#
#   Independent Samples T-Test Results (equal variances assumed)
#      t    df    p   Mean Difference  95% CI Lower  95% CI Upper
#   ------  --  ----  ---------------  ------------  ------------
#   -2.946  78  .004       -1.000         -1.676        -0.324
#
#   Cohen's d: -0.659

# Render 2 -- nearly the same size, SDs 2.4 apart.
t_mid <- groups(n = c(42, 40), sd = c(1, 2.4), mean = c(5, 6))
jt(y ~ g, data = t_mid, diagnostics = TRUE)

# Expected:
#   Independent Samples T-Test
#
#   Analysis N: 82
#
#   Levene's Test for Homogeneity of Variance
#      F    df1  df2    p
#   ------  ---  ---  -----
#   21.697   1    80  <.001
#
#   Note: Levene's test is significant (p < .001).
#   The larger group is 1.05 times the smaller, and the larger SD is 2.4 times
#   the smaller.
#   Guidelines differ on whether Student's t-test is acceptable at these values.
#   Welch's t-test does not assume equal variances: welch = TRUE.
#   See ?jt.
#
#   Group Descriptives: y by g
#   Group   N   Mean    SD
#   -----  --  -----  -----
#   a      42  5.000  1.000
#   b      40  6.000  2.400
#
#   Independent Samples T-Test Results (equal variances assumed)
#      t    df    p   Mean Difference  95% CI Lower  95% CI Upper
#   ------  --  ----  ---------------  ------------  ------------
#   -2.484  80  .015       -1.000         -1.801        -0.199
#
#   Cohen's d: -0.549

# Render 3 -- sizes 2 apart, SDs 2.6 apart; then the same call with
# welch = TRUE; then the first call again at the minimal level.
t_out <- groups(n = c(40, 20), sd = c(1, 2.6), mean = c(5, 6))
jt(y ~ g, data = t_out, diagnostics = TRUE)
jt(y ~ g, data = t_out, diagnostics = TRUE, welch = TRUE)
joutput("minimal", quiet = TRUE)
jt(y ~ g, data = t_out, diagnostics = TRUE)
joutput(NULL, quiet = TRUE)
rm(groups, t_in, t_mid, t_out)

# Expected:
#   Independent Samples T-Test
#
#   Analysis N: 60
#
#   Levene's Test for Homogeneity of Variance
#      F    df1  df2    p
#   ------  ---  ---  -----
#   21.377   1    58  <.001
#
#   Note: Levene's test is significant (p < .001).
#   The larger group is 2.0 times the smaller, and the larger SD is 2.6 times
#   the smaller.
#   Both are beyond the usual guidelines, so the p-value of Student's t-test may
#   not be reliable.
#   Welch's t-test does not assume equal variances: welch = TRUE.
#   See ?jt.
#
#   Group Descriptives: y by g
#   Group   N   Mean    SD
#   -----  --  -----  -----
#   a      40  5.000  1.000
#   b      20  6.000  2.600
#
#   Independent Samples T-Test Results (equal variances assumed)
#      t    df    p   Mean Difference  95% CI Lower  95% CI Upper
#   ------  --  ----  ---------------  ------------  ------------
#   -2.149  58  .036       -1.000         -1.931        -0.069
#
#   Cohen's d: -0.589
#
#   Welch's Independent Samples T-Test
#
#   Analysis N: 60
#
#   Levene's Test for Homogeneity of Variance
#      F    df1  df2    p
#   ------  ---  ---  -----
#   21.377   1    58  <.001
#
#   Group Descriptives: y by g
#   Group   N   Mean    SD
#   -----  --  -----  -----
#   a      40  5.000  1.000
#   b      20  6.000  2.600
#
#   Welch's T-Test Results (equal variances not assumed)
#      t     df     p   Mean Difference  95% CI Lower  95% CI Upper
#   ------  ----  ----  ---------------  ------------  ------------
#   -1.660  21.9  .111       -1.000         -2.250         0.250
#
#   Cohen's d: -0.589
#
#   Independent Samples T-Test
#
#   Analysis N: 60
#
#   Levene's Test for Homogeneity of Variance
#      F    df1  df2    p
#   ------  ---  ---  -----
#   21.377   1    58  <.001
#
#   Group Descriptives: y by g
#   Group   N   Mean    SD
#   -----  --  -----  -----
#   a      40  5.000  1.000
#   b      20  6.000  2.600
#
#   Independent Samples T-Test Results (equal variances assumed)
#      t    df    p   Mean Difference
#   ------  --  ----  ---------------
#   -2.149  58  .036       -1.000
#
# Things to look at:
#   - RENDER 1: "The groups are the same size, and the larger SD is 1.9
#     times the smaller.", and the verdict names Student's t-test.
#   - RENDER 2: the size ratio reads 1.05, with two decimals: at one it
#     would read 1.0 beside a sentence saying one group is larger. The
#     verdict is "Guidelines differ", on the SDs alone.
#   - RENDER 3, first output: "Both are beyond the usual guidelines, so
#     the p-value of Student's t-test may not be reliable.", then
#     "Welch's t-test does not assume equal variances: welch = TRUE."
#   - Second output, Welch's test: Levene's table and NO note under it.
#     The note is about whether Student's test can be relied on, and it
#     was not the test run. Its p is .111 where Student's was .036.
#   - Third output, at the minimal level: the table and no note. A
#     diagnostic's brief interpretation prints at the standard and full
#     levels only.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 29 -- Games-Howell below 2 df; no post-hoc table for two groups ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Session 346 (v0.9.219). A Games-Howell pair with fewer than 2 degrees
# of freedom has no studentized-range value: R printed "NaNs produced"
# four times above the table. And with two groups the post-hoc table held
# one row repeating the test above it.

# Render 1 -- group b has two cases: b-a and d-b fall below 2 df.
f_few <- data.frame(g = c(rep("a", 6), rep("b", 2), rep("c", 8), rep("d", 3)),
                    y = c(4, 5, 6, 5, 4, 6,  7, 9,
                          2, 9, 4, 11, 6, 13, 1, 10,  10, 11, 12),
                    stringsAsFactors = FALSE)
jaov(y ~ g, data = f_few, welch = TRUE, posthoc = TRUE)

# Expected:
#   Welch's One-Way ANOVA
#
#   Analysis N: 19
#
#   Group Descriptives: y by g
#   Group  N   Mean     SD   95% CI Lower  95% CI Upper
#   -----  -  ------  -----  ------------  ------------
#   a      6   5.000  0.894      4.061         5.939
#   b      2   8.000  1.414     -4.706        20.706
#   c      8   7.000  4.408      3.315        10.685
#   d      3  11.000  1.000      8.516        13.484
#
#   Welch's ANOVA: y by g
#      F    df1  df2    p
#   ------  ---  ---  ----
#   19.550   3   3.9  .008
#
#   Note: Sum of Squares and Mean Square are not applicable to Welch's ANOVA.
#   For the standard ANOVA table, run jaov() without welch = TRUE.
#
#   Eta-squared: 0.339
#   (Note: Eta-squared is calculated from the traditional SS decomposition.)
#
#   Games-Howell Post-Hoc Comparisons
#   Comparison  Mean Difference  95% CI Lower  95% CI Upper   df  p (adjusted)
#   ----------  ---------------  ------------  ------------  ---  ------------
#   b-a               3.000                                  1.3
#   c-a               2.000         -3.163         7.163     7.8      .616
#   d-a               6.000          3.097         8.903     3.7      .004
#   c-b              -1.000         -7.291         5.291     6.4      .946
#   d-b               3.000                                  1.7
#   d-c               4.000         -1.251         9.251     8.5      .149
#
#   Note: 2 comparisons have fewer than 2 degrees of freedom, so their
#   confidence intervals and p-values cannot be computed.

# Render 2 -- two groups, after the standard ANOVA and after Welch's.
f_two <- data.frame(g = c(rep("a", 6), rep("b", 8)),
                    y = c(4, 5, 6, 5, 4, 6,  2, 9, 4, 11, 6, 13, 1, 10),
                    stringsAsFactors = FALSE)
jaov(y ~ g, data = f_two, posthoc = TRUE)
jaov(y ~ g, data = f_two, welch = TRUE, posthoc = TRUE)
rm(f_few, f_two)

# Expected:
#   One-Way ANOVA
#
#   Analysis N: 14
#
#   Group Descriptives: y by g
#   Group  N   Mean    SD   95% CI Lower  95% CI Upper
#   -----  -  -----  -----  ------------  ------------
#   a      6  5.000  0.894      4.061         5.939
#   b      8  7.000  4.408      3.315        10.685
#
#   ANOVA: y by g
#   Source    df  Sum of Squares  Mean Square    F      p
#   --------  --  --------------  -----------  -----  ----
#   g          1       13.714        13.714    1.176  .300
#   Residual  12      140.000        11.667
#   Total     13      153.714
#
#   Eta-squared: 0.089
#
#   Note: Post-hoc comparisons are not shown for 2 groups: the test above is the
#   only comparison.
#
#   Welch's One-Way ANOVA
#
#   Analysis N: 14
#
#   Group Descriptives: y by g
#   Group  N   Mean    SD   95% CI Lower  95% CI Upper
#   -----  -  -----  -----  ------------  ------------
#   a      6  5.000  0.894      4.061         5.939
#   b      8  7.000  4.408      3.315        10.685
#
#   Welch's ANOVA: y by g
#     F    df1  df2    p
#   -----  ---  ---  ----
#   1.561   1   7.8  .248
#
#   Note: Sum of Squares and Mean Square are not applicable to Welch's ANOVA.
#   For the standard ANOVA table, run jaov() without welch = TRUE.
#
#   Eta-squared: 0.089
#   (Note: Eta-squared is calculated from the traditional SS decomposition.)
#
#   Note: Post-hoc comparisons are not shown for 2 groups: the test above is the
#   only comparison.
#
# Things to look at:
#   - RENDER 1: the rows b-a and d-b keep their mean difference and
#     their df (1.3 and 1.7); the interval and p cells are blank. One
#     note under the table says why, and counts the rows: "2 comparisons
#     have fewer than 2 degrees of freedom". No "NaNs produced" line
#     anywhere.
#   - The other four rows are complete, and the note sits one blank line
#     below the table.
#   - RENDER 2, both outputs: no post-hoc table. One note, one blank line
#     below the eta-squared lines: "Post-hoc comparisons are not shown
#     for 2 groups: the test above is the only comparison."
#   - Each output ends on one blank line.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 30 -- groups a test cannot be computed on ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Session 346 (v0.9.219). Each of these calls stopped on an error of R's
# own after part of the output had printed ("not enough 'y'
# observations", "data are essentially constant", "grouping factor must
# have exactly 2 levels"), or printed a table that could not be right (an
# F of 27815876027865139260134097158144.000; blank F and p cells). Each
# is a stop of jstats's own now, under the title and the N line. The
# stops are shown through tryCatch(), so the file still runs end to end.

shown <- function(expr) tryCatch(expr, error = function(e)
  cat("Error: ", conditionMessage(e), "\n\n", sep = ""))

# Render 1 -- a group of one case: Welch's t-test stops, Student's runs.
f_one <- data.frame(g = c(rep("a", 6), "b"), y = c(4, 5, 6, 5, 4, 6, 9),
                    stringsAsFactors = FALSE)
shown(jt(y ~ g, data = f_one, welch = TRUE))
jt(y ~ g, data = f_one)

# Expected:
#   Welch's Independent Samples T-Test
#
#   Analysis N: 7
#
#   Error: jt(): 'g' has 1 category with only 1 case (b).
#   Welch's t-test requires at least 2 cases in both categories.
#   Student's t-test can include it: run jt() without welch = TRUE.
#
#   Independent Samples T-Test
#
#   Analysis N: 7
#
#   Group Descriptives: y by g
#   Group  N   Mean    SD
#   -----  -  -----  -----
#   a      6  5.000  0.894
#   b      1  9.000
#
#   Independent Samples T-Test Results (equal variances assumed)
#      t    df    p   Mean Difference  95% CI Lower  95% CI Upper
#   ------  --  ----  ---------------  ------------  ------------
#   -4.140   5  .009       -4.000         -6.483        -1.517
#
#   Cohen's d: -4.472

# Render 2 -- one case in each group; then no variation inside any group,
# in jt() and in jaov(); then one group with no variation, under Welch.
f_flat <- data.frame(g = rep(c("a", "b", "c"), each = 4),
                     y = rep(c(3, 5, 8), each = 4), stringsAsFactors = FALSE)
f_flat1 <- data.frame(g = rep(c("a", "b", "c"), c(6, 5, 6)),
                      y = c(4, 5, 6, 5, 4, 6,  7, 7, 7, 7, 7,
                            9, 11, 10, 12, 9, 10),
                      stringsAsFactors = FALSE)
shown(jt(y ~ g, data = f_one[c(1, 7), ]))
shown(jt(y ~ g, data = f_flat[f_flat$g != "c", ]))
shown(jaov(y ~ g, data = f_flat))
shown(jaov(y ~ g, data = f_flat1, welch = TRUE))

# Expected:
#   Independent Samples T-Test
#
#   Analysis N: 2
#
#   Error: jt(): 'g' has 2 categories with only 1 case in each.
#   A t-test requires at least one category with 2 or more cases.
#
#   Independent Samples T-Test
#
#   Analysis N: 8
#
#   Error: jt(): 'y' has the same value for every case in each category of 'g'.
#   A t-test requires variation within at least one category.
#
#   One-Way ANOVA
#
#   Analysis N: 12
#
#   Error: jaov(): 'y' has the same value for every case in each
#   category of 'g'.
#   An ANOVA requires variation within at least one category.
#
#   Welch's One-Way ANOVA
#
#   Analysis N: 17
#
#   Error: jaov(): 'g' has 1 category in which 'y' does not vary (b).
#   Welch's ANOVA requires variation within every category.
#   The standard ANOVA can include it: run jaov() without welch = TRUE.

# Render 3 -- a category whose cases are all missing on the outcome is
# not a group of the analysis; and a filter that leaves no case.
f_gone <- data.frame(g = rep(c("p", "q", "r"), each = 5),
                     y = c(4, 6, 5, 7, 5,  8, 9, 7, 10, 9,  NA, NA, NA, NA, NA),
                     stringsAsFactors = FALSE)
jt(y ~ g, data = f_gone)
shown(jaov(y ~ g, data = f_flat1, subset = y > 50))
rm(f_one, f_flat, f_flat1, f_gone)

# Expected:
#   Independent Samples T-Test
#
#   Case Processing    Excluded  Remaining
#       Original             --         15
#       Auto-listwise         5         10
#       Analysis N           --         10
#
#   Missing data   From 15    %
#       y
#         Missing     5     33.3
#   --------------------------------------
#
#   Group Descriptives: y by g
#   Group  N   Mean    SD
#   -----  -  -----  -----
#   p      5  5.400  1.140
#   q      5  8.600  1.140
#
#   Independent Samples T-Test Results (equal variances assumed)
#      t    df    p   Mean Difference  95% CI Lower  95% CI Upper
#   ------  --  ----  ---------------  ------------  ------------
#   -4.438   8  .002       -3.200         -4.863        -1.537
#
#   Cohen's d: -2.807
#
#   One-Way ANOVA
#
#   Case Processing  Excluded  Remaining
#       Original           --         17
#       subset =           17          0  y > 50
#       Analysis N         --          0
#   --------------------------------------------
#
#   Error: jaov(): No cases are left to analyze.
#   All 17 cases were excluded by a filter.
#
# Render 4 -- a filter that names the grouping variable, as subset = and
# as a stored jsubset() filter, keeps one of its categories (S346, the
# second delivery).
f_cat <- data.frame(g = rep(c("a", "b", "c"), each = 4),
                    y = c(4, 6, 5, 7,  8, 9, 7, 10,  3, 5, 4, 6),
                    k = rep(c(1, 2), 6), stringsAsFactors = FALSE)
shown(jt(y ~ g, data = f_cat, subset = g == "a"))
shown(jaov(y ~ g, data = f_cat, subset = g == "b"))
shown(jcrosstab(g ~ k, data = f_cat, subset = k == 1))
jsubset(f_cat, g == "c")
shown(jt(y ~ g, data = f_cat))
jsubset(f_cat, NULL)
rm(shown, f_cat)

# Expected:
#   Independent Samples T-Test
#
#   Case Processing  Excluded  Remaining
#       Original           --         12
#       subset =            8          4  g == "a"
#       Analysis N         --          4
#   ----------------------------------------------
#
#   Error: jt(): subset = g == "a" keeps only 1 category of 'g', and a t-test
#   requires exactly 2.
#   To compare the categories, remove the filter.
#
#   One-Way ANOVA
#
#   Case Processing  Excluded  Remaining
#       Original           --         12
#       subset =            8          4  g == "b"
#       Analysis N         --          4
#   ----------------------------------------------
#
#   Error: jaov(): subset = g == "b" keeps only 1 category of 'g', and an ANOVA
#   requires at least 2.
#   To compare the categories, remove the filter.
#
#   Cross-Tabulation
#
#   Case Processing  Excluded  Remaining
#       Original           --         12
#       subset =            6          6  k == 1
#       Analysis N         --          6
#   --------------------------------------------
#
#   Error: jcrosstab(): subset = k == 1 keeps only 1 category of 'k', and a
#   cross-tabulation requires at least 2 for each variable.
#   To cross-tabulate it, remove the filter.
#
#   jsubset activated for f_cat: g == "c"
#   Independent Samples T-Test
#
#   Case Processing  Excluded  Remaining
#       Original           --         12
#       jsubset()           8          4  g == "c"
#       Analysis N         --          4
#   ----------------------------------------------
#
#   Error: jt(): Your jsubset() filter (g == "c") keeps only 1 category of 'g',
#   and a t-test requires exactly 2.
#   To compare the categories, set the filter aside:
#     jsubset(f_cat, off)
#
#   jsubset cleared for f_cat (had: g == "c").
#
# Things to look at:
#   - RENDER 1: Welch's stop names the category with one case, says what
#     Welch's test requires, and gives the way on: Student's test, which
#     then runs. Its Cohen's d is a number (-4.472, from the pooled SD
#     the test itself used); it printed "Cohen's d: NA".
#   - RENDER 2: four stops, each under its title and N line and before
#     any table. Each names the variable or the category, then states
#     what the test requires. The Welch ANOVA stop names the category
#     that does not vary (b) and offers the standard ANOVA.
#   - RENDER 3, first output: g has three categories and jt() runs, on p
#     and q. The five cases of r are in the Case Processing block as
#     missing. It stopped "'g' has 3 categories".
#   - Second output: "No cases are left to analyze.", under the Case
#     Processing block that shows where they went, and a second line
#     saying how: "All 17 cases were excluded by a filter." The same stop
#     prints in jt(), jcrosstab(), jlm(), jlogistic() and jalpha()
#     (models_walk.R Section 18).
#   - RENDER 4: each filter names the variable it leaves with one
#     category, so each stop says so -- "subset = g == "a" keeps only 1
#     category of 'g'" -- with the way out, where it said "'g' has 1
#     category" and nothing of the filter. The stored filter is named as
#     the filter, and set aside with the line jsubset() itself prints.
#     Where a filter does NOT name the variable the stop is as it was
#     (models_check.R P19).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 31 -- diagnostics: one setting, apart from the output levels ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Session 346 (v0.9.219), on Jeff's ruling of 8 October 2026. Levene's
# test, the VIF table and the regression plots are DIAGNOSTICS, asked for
# with one argument, diagnostics =, in joutput(), jt(), jaov(), jlm() and
# jlogistic(): TRUE (everything the function has), FALSE, or names. No
# output level turns them on. Until this build joutput("full") and
# full = TRUE printed Levene's table, and jt() and jaov() took
# levene = TRUE. f_gh is Section 23's frame.

f_gh <- data.frame(g = c(rep("a", 6), rep("b", 8), rep("c", 4)),
                   y = c(4, 5, 6, 5, 4, 6,  2, 9, 4, 11, 6, 13, 1, 10,
                         10, 11, 12, 11),
                   stringsAsFactors = FALSE)

# Render 1 -- the full level: the panel, then an ANOVA.
joutput("full")
jaov(y ~ g, data = f_gh)

# Expected:
#   Output Settings
#   Level: full
#     effect.size: ON
#     regression.ci: ON
#     means.ci: ON
#     posthoc: ON
#     diagnostics: OFF
#     case.processing: ON
#     case.processing.detail: PER_CODE
#     case.processing.filter: LIST
#     variable.id: LEGEND
#     value.id: BOTH
#     ref.categories: ON
#     missing.notice: ON
#     digits: 3
#
#   One-Way ANOVA
#
#   Case Processing  Excluded  Remaining
#       Original           --         18
#       Analysis N         --         18
#   ------------------------------------
#
#   Group Descriptives: y by g
#   Group  N   Mean     SD   95% CI Lower  95% CI Upper
#   -----  -  ------  -----  ------------  ------------
#   a      6   5.000  0.894      4.061         5.939
#   b      8   7.000  4.408      3.315        10.685
#   c      4  11.000  0.816      9.701        12.299
#
#   ANOVA: y by g
#   Source    df  Sum of Squares  Mean Square    F      p
#   --------  --  --------------  -----------  -----  ----
#   g          2       87.111        43.556    4.601  .028
#   Residual  15      142.000         9.467
#   Total     17      229.111
#
#   Eta-squared: 0.380
#
#   Tukey HSD Post-Hoc Comparisons
#   Comparison  Mean Difference  95% CI Lower  95% CI Upper  p (adjusted)
#   ----------  ---------------  ------------  ------------  ------------
#   b-a              2.000          -2.316         6.316         .469
#   c-a              6.000           0.841        11.159         .022
#   c-b              4.000          -0.894         8.894         .119

# Render 2 -- the setting turned on, an ANOVA, then back to the standard
# level.
joutput(diagnostics = TRUE)
jaov(y ~ g, data = f_gh)
joutput("standard")

# Expected:
#   Output Settings
#     diagnostics: ON
#   Run joutput() to see all settings.
#
#   One-Way ANOVA
#
#   Case Processing  Excluded  Remaining
#       Original           --         18
#       Analysis N         --         18
#   ------------------------------------
#
#   Levene's Test for Homogeneity of Variance
#      F    df1  df2    p
#   ------  ---  ---  -----
#   12.823   2    15  <.001
#
#   Note: Levene's test is significant (p < .001).
#   The largest group is 2.0 times the smallest, and the largest SD is 5.4 times
#   the smallest.
#   Both are beyond the usual guidelines, so the p-value of the standard ANOVA
#   may not be reliable.
#   Welch's ANOVA does not assume equal variances: welch = TRUE.
#   See ?jaov.
#
#   Group Descriptives: y by g
#   Group  N   Mean     SD   95% CI Lower  95% CI Upper
#   -----  -  ------  -----  ------------  ------------
#   a      6   5.000  0.894      4.061         5.939
#   b      8   7.000  4.408      3.315        10.685
#   c      4  11.000  0.816      9.701        12.299
#
#   ANOVA: y by g
#   Source    df  Sum of Squares  Mean Square    F      p
#   --------  --  --------------  -----------  -----  ----
#   g          2       87.111        43.556    4.601  .028
#   Residual  15      142.000         9.467
#   Total     17      229.111
#
#   Eta-squared: 0.380
#
#   Tukey HSD Post-Hoc Comparisons
#   Comparison  Mean Difference  95% CI Lower  95% CI Upper  p (adjusted)
#   ----------  ---------------  ------------  ------------  ------------
#   b-a              2.000          -2.316         6.316         .469
#   c-a              6.000           0.841        11.159         .022
#   c-b              4.000          -0.894         8.894         .119
#
#   Output Settings
#   Level: standard
#     effect.size: ON
#     regression.ci: OFF
#     means.ci: ON
#     posthoc: OFF
#     diagnostics: ON
#     case.processing: AUTO
#     case.processing.detail: TOTALS
#     case.processing.filter: AUTO
#     variable.id: NAMES
#     value.id: BOTH
#     ref.categories: ON
#     missing.notice: ON
#     digits: 3

# Render 3 -- one call turning it off; then a setting that names only
# the VIF table, which is not one of jaov()'s.
jaov(y ~ g, data = f_gh, diagnostics = FALSE)
joutput(diagnostics = "vif")
jaov(y ~ g, data = f_gh)
joutput(NULL)

# Expected:
#   One-Way ANOVA
#
#   Analysis N: 18
#
#   Group Descriptives: y by g
#   Group  N   Mean     SD   95% CI Lower  95% CI Upper
#   -----  -  ------  -----  ------------  ------------
#   a      6   5.000  0.894      4.061         5.939
#   b      8   7.000  4.408      3.315        10.685
#   c      4  11.000  0.816      9.701        12.299
#
#   ANOVA: y by g
#   Source    df  Sum of Squares  Mean Square    F      p
#   --------  --  --------------  -----------  -----  ----
#   g          2       87.111        43.556    4.601  .028
#   Residual  15      142.000         9.467
#   Total     17      229.111
#
#   Eta-squared: 0.380
#
#   Output Settings
#     diagnostics: VIF
#   Run joutput() to see all settings.
#
#   One-Way ANOVA
#
#   Analysis N: 18
#
#   Group Descriptives: y by g
#   Group  N   Mean     SD   95% CI Lower  95% CI Upper
#   -----  -  ------  -----  ------------  ------------
#   a      6   5.000  0.894      4.061         5.939
#   b      8   7.000  4.408      3.315        10.685
#   c      4  11.000  0.816      9.701        12.299
#
#   ANOVA: y by g
#   Source    df  Sum of Squares  Mean Square    F      p
#   --------  --  --------------  -----------  -----  ----
#   g          2       87.111        43.556    4.601  .028
#   Residual  15      142.000         9.467
#   Total     17      229.111
#
#   Eta-squared: 0.380
#
#   Output Settings
#   Reset to defaults (standard, no toggle overrides).

# Render 4 -- what is refused, and a setting of two names.
shown <- function(expr) tryCatch(expr, error = function(e)
  cat("Error: ", conditionMessage(e), "\n\n", sep = ""))
shown(jaov(y ~ g, data = f_gh, diagnostics = "qq"))
shown(jaov(y ~ g, data = f_gh, levene = TRUE))
shown(joutput(diagnostics = "leven"))
shown(joutput(diagnostics = "levene + vif"))
joutput(diagnostics = c("levene", "vif"))
joutput(NULL, quiet = TRUE)
rm(shown, f_gh)

# Expected:
#   Error: jaov(): "qq" is not a diagnostic of jaov().
#   `diagnostics` must be TRUE, FALSE, or "levene".
#
#   Error: jaov(): 'levene' is not valid. Did you mean `diagnostics`?
#
#   Error: joutput(): "leven" is not a diagnostic.
#   `diagnostics` must be TRUE, FALSE, or one or more of "levene", "vif",
#   "residuals", "qq", "scale", "cooks", and "leverage".
#
#   Error: joutput(): "levene + vif" is not a diagnostic.
#   To ask for more than one, combine them with c():
#     diagnostics = c("levene", "vif")
#
#   Output Settings
#     diagnostics: LEVENE, VIF
#   Run joutput() to see all settings.
#
# Things to look at:
#   - RENDER 1: the panel has ONE row for this, "diagnostics: OFF", at
#     the full level (the levene row is gone). The ANOVA under it has the
#     full level's Case Processing block and post-hoc table and NO
#     Levene's table.
#   - RENDER 2: the echo reads "diagnostics: ON"; the ANOVA now has
#     Levene's table and its note. The level call after it shows
#     "diagnostics: ON" still: a level call does not change the setting.
#   - RENDER 3: diagnostics = FALSE in the call wins over the setting.
#     The echo for one name reads "diagnostics: VIF", and jaov() under
#     that setting prints no Levene's table: each function takes the
#     names that are its own.
#   - RENDER 4, in order: a name that is another function's diagnostic
#     is refused in the call, with what jaov() takes; the old argument is
#     refused with the new one named; a misspelled name is refused with
#     every name joutput() takes; two names typed in one string get the
#     c() form to type. The last line shows that form accepted:
#     "diagnostics: LEVENE, VIF".
#   - jlm() and jlogistic() under the same setting: models_walk.R
#     Section 19.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 32 -- the group-count stops and subset =; a paired test; the box ----
#               plot's groups (S347)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Session 347 (v0.9.220), Fix Slate 8's second half.
#   - jt(), jaov() and jcrosstab() stopped on one group with a line about a
#     stored jsubset() filter, and said nothing of a subset = that had
#     excluded cases in the same way; jcrosstab() had no line at all. The
#     line now names either, as the one-value stops in models_walk.R
#     Section 18 do. It is not printed when a missing outcome took the
#     group the filters left: the line above it says so.
#   - A paired t-test has no Levene's test, and under
#     joutput(diagnostics = TRUE) every paired jt() said so. It says so
#     only when the call asks.
#   - jplot() of a jt() or jaov() result labeled its boxes 1, 2, 3, where
#     the Group Descriptives of the same result read "1: Control". LOOK AT
#     THE PLOTS PANE after Render 3.

shown32 <- function(expr) tryCatch(expr, error = function(e)
  cat("Error: ", conditionMessage(e), "\n\n", sep = ""))
f32 <- data.frame(g  = rep(c("a", "b", "c"), each = 4),
                  h  = rep(c("u", "v"), 6),
                  y  = c(4, 5, 6, 5, 7, 8, 6, 9, 3, 4, 2, 5),
                  id = 1:12, stringsAsFactors = FALSE)

# Render 1 -- subset = on another variable leaves one group: jt(), jaov(),
# jcrosstab(); then a missing outcome takes the second group the filter
# left.
shown32(jt(y ~ g, data = f32, subset = id <= 4))
shown32(jaov(y ~ g, data = f32, subset = id <= 4))
shown32(jcrosstab(g ~ h, data = f32, subset = id <= 4))
f32m <- f32; f32m$y[f32m$g == "b"] <- NA
shown32(jt(y ~ g, data = f32m, subset = id <= 8))

# Expected:
#   Independent Samples T-Test
#
#   Case Processing  Excluded  Remaining
#       Original           --         12
#       subset =            8          4  id <= 4
#       Analysis N         --          4
#   ---------------------------------------------
#
#   Error: jt(): 'g' has 1 category.
#   A t-test requires exactly 2.
#   Check whether subset = is excluding one of the groups.
#
#   One-Way ANOVA
#
#   Case Processing  Excluded  Remaining
#       Original           --         12
#       subset =            8          4  id <= 4
#       Analysis N         --          4
#   ---------------------------------------------
#
#   Error: jaov(): 'g' has 1 category.
#   An ANOVA requires at least 2 groups.
#   Check whether subset = is excluding one or more groups.
#
#   Cross-Tabulation
#
#   Case Processing  Excluded  Remaining
#       Original           --         12
#       subset =            8          4  id <= 4
#       Analysis N         --          4
#   ---------------------------------------------
#
#   Error: jcrosstab(): 'g' has 1 category.
#   A cross-tabulation requires at least 2 categories for each variable.
#   Check whether subset = is excluding the other categories.
#
#   Independent Samples T-Test
#
#   Case Processing    Excluded  Remaining
#       Original             --         12
#       subset =              4          8  id <= 8
#       Auto-listwise         4          4
#       Analysis N           --          4
#
#   Missing data   From 12    %   Filtered  From 8    %
#       y
#         Missing     4     33.3      0        4    50.0
#   ----------------------------------------------------
#
#   Error: jt(): 'g' has 1 category.
#   A t-test requires exactly 2.
#   Cases with a missing 'y' are not counted.

# Render 2 -- a paired test under joutput(diagnostics = TRUE); then the
# call asking for Levene's test.
f32p <- data.frame(t = factor(rep(c("pre", "post"), each = 5),
                              levels = c("pre", "post")),
                   y = c(4.5, 5.5, 6.5, 5.5, 4.5,  5.5, 9.5, 8.5, 6.5, 6.5))
joutput(diagnostics = TRUE, quiet = TRUE)
jt(y ~ t, data = f32p, paired = TRUE)
jt(y ~ t, data = f32p, paired = TRUE, diagnostics = TRUE)
joutput(NULL, quiet = TRUE)

# Expected:
#   Paired Samples T-Test
#
#   Analysis N: 10
#
#   Group Descriptives: y by t
#   Group  N   Mean    SD
#   -----  -  -----  -----
#   pre    5  5.300  0.837
#   post   5  7.300  1.643
#
#   Paired Samples T-Test Results
#      t    df    p   Mean Difference  95% CI Lower  95% CI Upper
#   ------  --  ----  ---------------  ------------  ------------
#   -3.651   4  .022       -2.000         -3.521        -0.479
#
#   Cohen's dz (paired): -1.633
#
#   Paired Samples T-Test
#
#   Analysis N: 10
#
#   Note: Levene's test is not applicable for paired samples.
#
#   Group Descriptives: y by t
#   Group  N   Mean    SD
#   -----  -  -----  -----
#   pre    5  5.300  0.837
#   post   5  7.300  1.643
#
#   Paired Samples T-Test Results
#      t    df    p   Mean Difference  95% CI Lower  95% CI Upper
#   ------  --  ----  ---------------  ------------  ------------
#   -3.651   4  .022       -2.000         -3.521        -0.479
#
#   Cohen's dz (paired): -1.633

# Render 3 -- jplot() of a jaov() result, the groups labelled: the box
# plot in the Plots pane.
f32b <- data.frame(cond = haven::labelled(rep(1:3, each = 5),
                                          labels = c(Control = 1, CBT = 2,
                                                     Mindfulness = 3)),
                   y = c(4, 5, 6, 5, 4,  7, 8, 6, 9, 8,  5, 6, 7, 6, 5))
r32 <- jaov(y ~ cond, data = f32b)
jplot(r32)

# Expected:
#   One-Way ANOVA
#
#   Analysis N: 15
#
#   Group Descriptives: y by cond
#   Group           N   Mean    SD   95% CI Lower  95% CI Upper
#   --------------  -  -----  -----  ------------  ------------
#   1: Control      5  4.800  0.837      3.761         5.839
#   2: CBT          5  7.600  1.140      6.184         9.016
#   3: Mindfulness  5  5.800  0.837      4.761         6.839
#
#   ANOVA: y by cond
#   Source    df  Sum of Squares  Mean Square     F      p
#   --------  --  --------------  -----------  ------  ----
#   cond       2      20.133         10.067    11.185  .002
#   Residual  12      10.800          0.900
#   Total     14      30.933
#
#   Eta-squared: 0.651

rm(shown32, f32, f32m, f32p, f32b, r32)

# Things to look at:
#   - RENDER 1: each stop ends "Check whether subset = is excluding ...",
#     in its function's words -- "one of the groups", "one or more
#     groups", "the other categories". The fourth: the filter left two
#     groups and a missing y took one, so the stop says "Cases with a
#     missing 'y' are not counted." and points at no filter.
#   - RENDER 2: the first paired test says nothing of Levene's test (the
#     setting is the session's); the second, which asks in the call, has
#     the note under its N line.
#   - RENDER 3: the boxes in the Plots pane read "1: Control", "2: CBT"
#     and "3: Mindfulness", as the Group Descriptives above them do.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 33 -- jfreq(): the subtotal rows and the zero rows (S348) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Session 348 (v0.9.221), Jeff's rulings R7 and R4 of S345, built together.
#   - R7: "Total valid" under the Valid block whenever the table has a
#     Missing block -- the valid N, the denominator of every Valid %, stated
#     rather than left to addition -- and "Total missing" under the Missing
#     block when it has more than one row, as SPSS FREQUENCIES prints them.
#   - R4: a labelled value no case holds gets a zero row, as a factor's
#     empty level always had: a valid value, and a labelled code inside a
#     declared range when the range is spelled out. Past ten in one table
#     none prints, and one line under the table says how many.
# Every other jfreq() table in the walks was re-pinned by running, under
# the ruling; this is the one section to read.

f33 <- data.frame(
  q = haven::labelled_spss(c(1, 2, 3, 2, 1, -99, 3, 2, 1, 2, NA),
        labels = c(Low = 1, Mid = 2, High = 3, Top = 4, Refused = -99,
                   "Don't know" = -98, Skipped = -97),
        na_values = c(-99, -98, -97)),
  r = haven::labelled_spss(c(1, 2, 3, 2, 1, -60, 3, 2, 1, NA, 2),
        labels = c(Low = 1, Mid = 2, High = 3, Refused = -99,
                   "Don't know" = -98),
        na_range = c(-99, -51)),
  s = c(1, 2, 1, 2, 2, 1, 1, 2, 1, NA, 2))
f33w <- data.frame(
  x = haven::labelled(c(1, 2, 1, 2, 1),
        labels = stats::setNames(1:13, paste0("Offence ", 1:13))))

# Render 1 -- both subtotals, and a zero row on each side: Top is a valid
# value no case holds; -98 and -97 are declared codes no case holds.
jfreq(f33, q)

# Expected:
#   Frequencies
#
#   11 Cases in the 1 Variable Pool
#
#   q
#
#                       Freq  Total %  Valid %  Cum. %
#   ------------------  ----  -------  -------  ------
#   Valid
#   1: Low                3     27.27    33.33   33.33
#   2: Mid                4     36.36    44.44   77.78
#   3: High               2     18.18    22.22  100.00
#   4: Top                0      0.00     0.00  100.00
#   Total valid           9     81.82   100.00
#
#   Missing
#   -99 ["Refused"]       1      9.09       --      --
#   -98 ["Don't know"]    0      0.00       --      --
#   -97 ["Skipped"]       0      0.00       --      --
#   System/NA             1      9.09       --      --
#   Total missing         2     18.18
#
#   Total                11    100.00

# Render 2 -- one Missing row: "Total valid" alone. A declared range
# spelled out: -60 is the one value in it, and -99 and -98, labelled codes
# inside it that no case holds, print at 0 beside it.
jfreq(f33, s, r)

# Expected:
#   Frequencies
#
#   11 Cases in the 2 Variable Pool; 9 Complete on All
#
#   s
#
#                Freq  Total %  Valid %  Cum. %
#   -----------  ----  -------  -------  ------
#   Valid
#   1              5     45.45    50.00   50.00
#   2              5     45.45    50.00  100.00
#   Total valid   10     90.91   100.00
#
#   Missing
#   System/NA      1      9.09       --      --
#
#   Total         11    100.00
#
#   r
#
#                       Freq  Total %  Valid %  Cum. %
#   ------------------  ----  -------  -------  ------
#   Valid
#   1: Low                3     27.27    33.33   33.33
#   2: Mid                4     36.36    44.44   77.78
#   3: High               2     18.18    22.22  100.00
#   Total valid           9     81.82   100.00
#
#   Missing
#   -99 ["Refused"]       0      0.00       --      --
#   -98 ["Don't know"]    0      0.00       --      --
#   -60 (no label)        1      9.09       --      --
#   System/NA             1      9.09       --      --
#   Total missing         2     18.18
#
#   Total                11    100.00

# Render 3 -- thirteen labels, two of them used: eleven empty, past the
# limit, so none prints and the line under the table says how many.
jfreq(f33w, x)

# Expected:
#   Frequencies
#
#   5 Cases in the 1 Variable Pool
#
#   x
#
#                 Freq  Total %  Valid %  Cum. %
#   ------------  ----  -------  -------  ------
#   1: Offence 1    3     60.00   60.00    60.00
#   2: Offence 2    2     40.00   40.00   100.00
#
#   Total           5    100.00
#   11 labelled values have no cases and are not listed.

rm(f33, f33w)

# Things to look at:
#   - RENDER 1: "Total valid  9" is 3 + 4 + 2 + 0, and its 81.82 the Total %
#     of the valid rows; 100.00 under Valid %, nothing under Cum. %.
#     "Total missing  2" is the -99 case and the system-missing one; 9 + 2
#     = 11, the Total. Each subtotal sits directly under its block, before
#     the blank line.
#   - RENDER 1: "4: Top" at 0, in its place among the valid values, its
#     Cum. % the row above's 100.00; -98 and -97 at 0 in the Missing block
#     as declared codes always were.
#   - RENDER 2: s has one Missing row, so no "Total missing" -- one row is
#     its own total. r spells out its range: -99 and -98 at 0, sorted with
#     -60; an unlabelled number in the range never gets a row.
#   - RENDER 3: the line under the Total, "11 labelled values have no cases
#     and are not listed." A factor's empty levels count the same way, in
#     "categories" (format_check.R Z17).
#   - Every column of each table is in the S328 form; "Valid %" now holds
#     100.00, so its block is as wide as "Cum. %".

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Observations
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# <Free-form notes from the most recent walk: anything that looked off,
# wording worth an mv review, follow-ups. Dated entries, newest first.>
#
# 2026-10-08/09 (S346), Jeff, walking Sections 27-31 at v0.9.219's first
# delivery and Section 30 at its second: "all okay". His one remark that
# session was on models_walk.R Section 18 (a filter that names the
# predictor) and moved Section 30 too: Render 4, the second delivery.
#
# 2026-10-06 (S341), Jeff, walking Sections 4, 23 and 24 at v0.9.215's
# first delivery ("format walk only shows one minor cosmetic thing"):
#   - on Section 23: "there is no blank line between the table and the
#     note - this make things harder to read." -> one blank line above
#     the Levene note in jaov() and jt(), and, at his word ("Fix those
#     now"), the note's "p = <.001" as "p < .001", which also put its
#     first sentence on one line; v0.9.215, the third delivery.
#
# 2026-10-03 (S329), Jeff, walking this file at v0.9.205's first delivery
# ("All looks pretty good so far"), on Section 19:
#   - "We're using the term 'haven_labelled' ... One of the point of the
#     jstats package is the ability to keep haven as a dependency and not
#     have the users need to refer to it directly." -> the parenthetical
#     dropped from jdummy's Variable line; jscreen's opt-in Base R Type
#     column keeps the word ("different context where it's
#     appropriate"), v0.9.205 second delivery (Sections 19 and 22).
#   - "The asterisks with the reference category almost reads as if this
#     is the only reference category possible." -> "(default; change with
#     ref =)" on the Reference category line when the default rule chose
#     it, v0.9.205 second delivery (Sections 19 and 22).
#
# 2026-10-02 (S328), Jeff, walking this file at v0.9.204 (completed: "the
# rest looks good"), on Sections 15 and 17:
#   - "The note speaks about expected frequencies but we're not showing
#     the expected frequencies in this output." -> the pointer line,
#     v0.9.205 (Section 15).
#   - "(minimum = 4.96). This is the only place where the value 4.96 is
#     shown ... I get 5.0 as the expected due to rounding. This might
#     confuse a new user." -> expected counts at two places, with the
#     note's 4.99 guard, v0.9.205 (Sections 15 and 17).
#   - the crosstab hard to read, its row groups running together and its
#     narrow columns crowded -> a blank line between the row groups and
#     the wider column gap where the table fits, v0.9.205 (Sections 15,
#     17 and 21).
#
# 2026-10-02 (S326-S327), Jeff, walking this file at v0.9.202 (begun, not
# completed; the walk completes on this re-pinned file):
#   - "in the anova tables the F and p headers aren't centered over the
#     columns. F is right justified and p is left justified" -> the
#     alignment slice, v0.9.203 (Sections 1-8, 10-13).
#   - the note under the Welch table, which said Sum of Squares and Mean
#     Squares "are not available": "There is a difference between not
#     available and not applicable ... I suspect that not applicable is
#     the most correct. I think we should reword or users will interpret
#     this as a defect." -> both Welch notes reworded, the wording
#     approved by Jeff, v0.9.203 (Section 4).


# --- Restore -----------------------------------------------------------------

options(.jst_options_message_width = .entry_message_width)
options(.jst_default_data          = .entry_default_data)
options(warn                       = .entry_warn)


# --- End marker --------------------------------------------------------------
# A real statement, deliberately last: stepping through with Ctrl+Enter, RStudio
# keeps expanding the selection when only comments remain, echoing the tail of
# the file back repeatedly. Ending on executable code gives it somewhere to
# stop. Keep this line at the foot of every walkthrough, below the Observations
# block.

cat("\n--- End of format_walk.R ---\n")
