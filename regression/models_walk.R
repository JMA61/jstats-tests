# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# models_walk.R -- the coefficient table's interaction rows and the Gelman
#                  column, read rather than asserted
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# TYPE:     visual walkthrough (Expected comments; written for Jeff's checking)
# PENDING:  none
# LOCKS:    the S320 coefficient-table changes as shipped in v0.9.198: the
#           Gelman column as Gelman's (2008) refit -- every predictor
#           centered, a continuous one divided by two SDs, every 0/1 column
#           centered, the outcome untouched -- so an interaction's product is
#           formed from the rescaled inputs; the interaction rows shown with
#           " * ", grouped under a header with the reference when built on a
#           multi-category variable, and blank in the regular beta column
#           when built on a suppressed 0/1 column (AUDIT-035); the two-line
#           legend under an interaction model's table, one blank line below
#           it; and the legend tiers listing every predictor (AUDIT-036).
#           Since S321 (v0.9.199, Sections 9-14): a squared term recomputed
#           from the standardized input, and the note naming only the kinds
#           of term the model has; a product or square computed by hand
#           named in a note of its own; std = "product" (header, every row,
#           its note); and the warning after a model whose formula squared a
#           single variable without I(). Since S340 (v0.9.214, Section 15):
#           a text predictor's blank cells as one category, <blank>,
#           numbered last, and the reference of a word-or-blank predictor.
#           Since S342 (v0.9.216, Section 16): a comparison inside a formula
#           computes on a categorical variable with no registration, and
#           arithmetic on one is refused with a remedy that runs.
#           Since S346 (v0.9.219, Sections 17-19): the "seems categorical"
#           warning's lines to run; the stops for a sample with no case
#           left, a predictor with one value and a computed outcome; and
#           diagnostics (the VIF table and the plots) as one setting,
#           apart from the output levels. And, in Section 18 since the
#           second delivery, a filter that names a variable the model needs
#           to vary named as the cause of its one value.
# ORIGIN:   S320 (v0.9.198). The first walk over jlm()/jlogistic(); the human
#           half of models_check.R sections G and (since S321) H.
# S342 EDIT (v0.9.216): SECTION 16 ADDED, three renders, for Jeff's S342
#           ruling on the formula guard (AUDIT-023 amended): a comparison on
#           a categorical variable computes as lm() computes it; arithmetic
#           on one stays refused. Render 1: I(Condition == 2) on the labelled
#           clinic variable. Render 2: a comparison on a text variable.
#           Render 3: the three stops -- the jnumeric() line where it will
#           take, jencode() for text, and jnumeric() itself refusing a text
#           variable. An inline fixture (tx16), built and removed inside
#           the section. Each Expected FILLED BY RUNNING the file on the
#           0.9.216 build (fill.R), whole. No existing Expected moved: a
#           capture of every section on 0.9.215 and 0.9.216 differs in
#           Sections 3 and 13 by one blank line after jdummy()'s reminder,
#           outside both pinned blocks. Section 16 needs no other section
#           (harness.R derive: NEEDS 4, 5 and 6 on 3, as before). The human
#           half of models_check.R M25-M37.
# S346 EDIT (v0.9.219): SECTIONS 17-19 ADDED for Fix Slate 8's first cut
#           and the diagnostics setting: the "seems categorical" warning
#           and its lines to run (17); no case left, a predictor with one
#           value, a computed outcome in jlogistic() (18); diagnostics in
#           jlm() and jlogistic() (19). Each Expected FILLED BY RUNNING
#           the file (fill.R, Testing Conventions). Section 17 sets
#           warn = 1 for itself and hands the setting back, so its
#           warnings are in its blocks. SECTION 8 CHANGED MECHANICALLY
#           under Jeff's ruling of 8 October 2026 (the full level does not
#           bring diagnostics) and kept off the PENDING line: its call
#           asks for the VIF table its bullet reads, diagnostics = "vif";
#           its pinned block is unchanged.
#           SECOND DELIVERY, THE NEXT DAY: Jeff walked Sections 17-19 at
#           the first ("all okay") but for Section 18's second stop:
#           subset = PriorTherapy == 1 with PriorTherapy in the formula got
#           "Check whether subset = is excluding the other values", and
#           "the error message doesn't address the real problem". Section
#           18 RE-PINNED: Render 2 now shows the filter named as the cause
#           (as subset = and as a stored jsubset() filter), beside the
#           hedged line for a filter on another variable and the plain
#           stop with no filter; Renders 4-6 new (a predictor dummy-coded
#           in the call; an outcome the filter keeps to one value, in
#           jlogistic() and jlm(); one case left). Each block FILLED BY
#           RUNNING, with #@SKIP before Renders 2 and 4 so a block holds
#           its own render alone (the S343 lesson).
# LAST VERIFIED: v0.9.219, 2026-10-09 (S346) -- Sections 17-19 WALKED on the
#           WORKSTATION by Jeff through rewalk() at the first delivery
#           ("all okay") but for Section 18's second stop -- subset =
#           PriorTherapy == 1 with PriorTherapy in the formula got "Check
#           whether subset = is excluding the other values", and "the
#           error message doesn't address the real problem" -- fixed in the
#           second delivery, where Section 18 was walked again ("all
#           okay"); PENDING back to none; GitHub 14528c6. Section 8
#           changed mechanically, not walked. Sandbox: 29 of 30 Expected
#           blocks found under rewalk() in three orders, as before (Section
#           1's block is not a contiguous run by design).
# LAST VERIFIED: v0.9.216, 2026-10-06 (S342) -- Section 16 WALKED on the
#           WORKSTATION by Jeff through rewalk() ("Both walks look good");
#           PENDING back to none; GitHub 8737548. Sandbox (R 4.3.3, UTF-8
#           locale, pkgload::load_all of the build): every section through
#           rewalk() as in a straight run, in three orders and by prepare
#           = TRUE; 16 of 17 Expected blocks found as a run, the
#           seventeenth being Section 1's, elided by design.
# S340 EDIT (v0.9.214): SECTION 15 ADDED, two renders, for Fix Slate 3's
#           blank text cells in a model (Jeff's S340 ruling: a blank is a
#           category in jlm(), jlogistic() and jdummy() too, reversing the
#           S305 build's "an empty text cell is missing on every dummy").
#           Render 1: three categories, <blank> the third, under a named
#           reference. Render 2: a word-or-blank predictor, where the blank
#           is the reference and the one coefficient is the word's. An
#           inline fixture, built and removed inside the section. Both
#           Expected blocks FILLED BY RUNNING the file on the 0.9.214 build
#           (fill.R), whole. No existing Expected moved: Sections 1-14 give
#           the same output on 0.9.213 and 0.9.214. Section 15 needs no
#           other section (harness.R: 15 of 15). The human half of
#           models_check.R L22-L31.
# LAST VERIFIED: v0.9.214, 2026-10-05 (S340) -- Section 15 WALKED on the
#           WORKSTATION by Jeff through rewalk("models") ("All walks done
#           okay"), GitHub 2d04b68, after the SANDBOX run (R 4.3.3, UTF-8
#           locale, pkgload::load_all of the build): every section through
#           rewalk() as in a straight run, in three orders and by prepare =
#           TRUE.
# S328 EDIT (v0.9.204): THE COEFFICIENT TABLES BLOCK-CENTERED, ON THE S328
#           LEAN. The jlm and jlogistic coefficient tables were
#           decimal-tabbed (header centered, values at the column's right
#           edge); they are block-centered now, as every table is, with
#           the odd spare space on the LEFT (Jeff, S328). What moves in
#           the text this file pins: the header line of every coefficient
#           table (a header that cannot be centered exactly sits one place
#           right of where it did) and the values under "Gelman β" and
#           "Product β", which sat at the column's right edge and now sit
#           under the middle of the header. FOURTEEN Expected blocks
#           re-pinned (38 lines), no section added: taken from an ordered
#           diff of this file's own output on the 0.9.203 and 0.9.204
#           builds, each block then found as a contiguous run in the new
#           capture (16 of 16; the S321 file 2). No wording of a note or a
#           legend changed. Section 8's output also carries a table with
#           CI columns and a VIF table, which moved the same way; neither
#           is pinned here (format_walk.R pins a VIF table in Section 7 and
#           the CI columns in Section 19).
# LAST VERIFIED: v0.9.204 PENDING, 2026-10-02 (S328) -- sourced end to end
#           in the SANDBOX (R 4.3.3, UTF-8 locale; end marker reached);
#           WORKSTATION walk PENDING Jeff's receive of the 0.9.204 master.
# S321 EDIT (v0.9.199): SECTIONS 9-14 ADDED. Every new Expected a capture
#           from the 0.9.199 master at width 76 on this file's fixture;
#           Sections 1-8 untouched at the first build -- their output was
#           byte-identical on the 0.9.198 and first 0.9.199 masters; the
#           rebuild below re-pinned Sections 1, 2, 3 and 5 for the reworded
#           interaction note.
#           Self-check (sandbox): all eight new blocks found as contiguous
#           runs in the file's own output (Section 14's warning in a
#           top-level run, as line by line prints it); in 0.9.198's output
#           none of the six Sections 9-13 blocks, nor Section 14's warning --
#           Section 14's table block IS there, by design: the table is
#           unchanged and the warning is the change. The checker reds a
#           changed sentence (Section 11's note) and a changed value
#           (Section 13's 0.807).
#           REBUILD (S321, 0.9.199 kept): Jeff's walk reworded the three
#           notes. The centered-predictors note (S320's interaction note
#           too) now reads "... comes from centered predictors: a beta can
#           have the opposite sign from its b, and other software may report
#           different beta values."; the hand-made note "... entered as its
#           own variable, so beta treats it as an ordinary predictor, not as
#           an interaction."; the product note "Product beta treats each
#           interaction as an ordinary predictor, as some other software
#           does." Ten blocks re-pinned from captures of the rebuilt master
#           (Sections 1, 2, 3, 5, 9, 10, 11 both, 12, 13); Section 11 gains
#           a bullet on the declared missing codes its two lines multiply.
#           Self-check on the rebuild: all 16 blocks in the file's own
#           output; the ten re-pinned blocks absent from the first 0.9.199
#           master's.
#           LAST VERIFIED: v0.9.199 (rebuilt), 2026-10-01 (S321) -- WALKED on
#           the WORKSTATION by Jeff ("Walk looks good now"), after his walk of
#           the first 0.9.199 master reworded the three notes (restamped from
#           PENDING at S323). S323 (v0.9.200): the file's output is
#           byte-identical on the 0.9.199 and 0.9.200 masters in the SANDBOX
#           (UTF-8 locale) -- the build changes no coefficient table -- so it
#           is not re-walked.
# PRIOR:    v0.9.198 (rebuilt), 2026-09-30 (S320) -- WALKED on the WORKSTATION
#           by Jeff at the rebuilt master (the registry's stamp; the
#           header still read PENDING). The S320 text: sourced
#           end to end in the SANDBOX (UTF-8 locale; end marker reached, 8
#           sections); WORKSTATION walk PENDING Jeff's receive of the
#           rebuilt master. Every Expected is a sink() capture from the
#           rebuilt 0.9.198 master at width 76 on this file's fixture,
#           pasted from the capture; trailing spaces are not pinned.
#           Self-check: each block found as a contiguous run in the file's
#           own output (8 of 8); none of the eight in the 0.9.197 master's
#           output -- every section shows something this build changed; and
#           Sections 1, 2, 3 and 5 not in the first 0.9.198 master's output
#           (the rebuild's legend, the only change between the two).
#           REBUILD (S320, 0.9.198 kept): the legend reworded to a sentence
#           plus "See ?jlm." on its own line, a blank line above it;
#           Sections 1, 2, 3 and 5 re-captured, Section 1's notes updated.
# RUN:      line-by-line first (read each block of output before moving on).
#           Also source()-safe: nothing here errors. Under source(), run WITH
#           echo = TRUE, per the conventions file.
#           By section: source walk_tools.R, then rewalk("models") shows the
#           sections the PENDING line names and rewalk("models", "1") shows
#           one, each from a fresh Setup and its NEEDS. Add prepare = TRUE to
#           run only what the section needs and step through it by hand.
# SECTIONS: NOT independent. Section 3 registers Condition and Section 6
#           releases it; Section 8 sets joutput("full") and restores it on
#           the next line. Run Sections 3-6 together, or reset by hand.
#           Section 11 adds two columns to d (SSxS, StressSq), removed at
#           the foot of Section 14; Section 15 builds a frame of its own
#           (tx15) and removes it, and Section 16 likewise (tx16); Section
#           13 registers Condition and releases it on the call's next line.
# PAIR:     models_check.R is the assertion half (sections G, H and L). This
#           file shows the shape; that file proves the numbers against hand
#           refits.
# EXPECTED: each block is pinned from the Coefficients caption (Section 1
#           from the title) through the legend or the last row, then
#           elided. Byte-faithful captures at the pinned width, not
#           transcriptions.
# ENCODING: UTF-8 -- the pinned table headers carry the beta glyph the
#           package prints; every other regression file is plain ASCII.
# ENDING:   the file MUST end with the executable end-marker line at the foot.
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# --- Setup -------------------------------------------------------------------

# jstats must be loaded already: devtools::load_all() (development) OR
# library(jstats) (installed) -- never both in one session.
stopifnot(exists("jload", mode = "function"))

# Session state to hand back at the foot (record / force / restore, S253).
.entry_message_width <- getOption(".jst_options_message_width")
.entry_default_data  <- getOption(".jst_default_data")

# Message-width pin: every block below was captured at 76. MANDATORY -- the
# legend under the coefficient table wraps to this setting.
.pin_width <- 76L
options(.jst_options_message_width = .pin_width)

# Neutral pipeline state (never assume the prior state is clean).
jsubset(clear.all = TRUE); jcomplete(clear.all = TRUE); joutput(NULL)
jdummy(clear.all = TRUE)
juse(NULL)

# --- Fixture -----------------------------------------------------------------
# The SHIPPED clinic (package = TRUE: a bare jload("clinic") can be shadowed
# by the derived .rds in the test-data folder), as loaded. Condition is a
# four-category treatment variable (1: Control, 2: CBT, 3: Mindfulness,
# 4: Support group), registered as categorical for Sections 3-6 and
# released again after them; SoughtHelp is 0/1.

jload("clinic", name = "d", package = TRUE, overwrite = TRUE, quiet = TRUE)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 1 -- continuous x continuous, the default column ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Two things to see: the interaction row reads "SocialSupport * Stress" (R's
# colon form until v0.9.198), and the legend under the table, because
# SocialSupport's b and its beta disagree in sign. Both standardized columns
# come from a refit on centered predictors, so a main effect's beta is its
# effect at the average of the predictor it interacts with; b is the effect
# at that predictor's 0, where nobody in these data sits.

jlm(Flourishing ~ SocialSupport * Stress, data = d)

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
#                              b      SE       t       β      p
#   ----------------------  ------  ------  ------  ------  -----
#   (Intercept)             78.089  11.164   6.995          <.001
#   SocialSupport           -1.573   0.740  -2.126   0.285   .037
#   Stress                  -2.576   0.588  -4.385  -0.176  <.001
#   SocialSupport * Stress   0.159   0.041   3.873   0.400  <.001
#
#   In a model with an interaction, β comes from centered predictors: a β can
#   have the opposite sign from its b, and other software may report
#   different β values.
#   See ?jlm.
#
#   Outcome: Flourishing
#   [... fit statistics not pinned here ...]
#
# Things to look at:
#   - SocialSupport: b -1.573 (at Stress = 0), beta 0.285 (at average
#     stress). Opposite signs on one row; the legend flags it, and ?jlm's
#     "Comparing with other software" section explains it.
#   - The legend sits one blank line below the table: its sentence, then
#     "See ?jlm." on a line of its own, then the blank and the Outcome
#     line.
#   - The interaction row's beta is the standardize-then-multiply solution
#     (Aiken and West): SPSS's Beta on a COMPUTE'd product column would read
#     1.320 here, and its main effects -0.536 and -1.337.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 2 -- the same model, std = "gelman" ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The Gelman column is now a refit on the paper's inputs (each predictor
# centered and divided by two SDs). Until v0.9.198 it was read off the
# original fit as b * 2 * SD, which here gave -15.3, -38.1 and 37.7 -- the
# main effects at the other predictor's 0 and the product row scaled by the
# product column's own SD. arm::standardize() gives exactly these.

jlm(Flourishing ~ SocialSupport * Stress, data = d, std = "gelman")

# Expected:
#   Coefficients
#                              b      SE       t    Gelman β    p
#   ----------------------  ------  ------  ------  --------  -----
#   (Intercept)             78.089  11.164   6.995            <.001
#   SocialSupport           -1.573   0.740  -2.126    8.132    .037
#   Stress                  -2.576   0.588  -4.385   -5.033   <.001
#   SocialSupport * Stress   0.159   0.041   3.873   22.855   <.001
#
#   In a model with an interaction, Gelman β comes from centered predictors: a
#   Gelman β can have the opposite sign from its b, and other software may
#   report different Gelman β values.
#   See ?jlm.
#
# Things to look at:
#   - A two-SD move in SocialSupport, at average Stress, is worth 8.1 points
#     of Flourishing; the interaction is 22.9 for a two-SD move in both.
#   - The legend names the column it is about.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 3 -- continuous x a four-category variable: the grouped block ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Condition registered as categorical. The interaction rows were three raw
# names ("SocialSupport:Condition_CBT" ...) carrying betas under a labelled,
# grouped Condition block whose own betas were blank (AUDIT-035). They now
# group like the main-effect block, under a header naming both variables
# and the reference, and their betas are blank with the dummy rows' -- the
# product's beta is scaled by the dummy's prevalence too.

jdummy(d, Condition)
jlm(Flourishing ~ SocialSupport * Condition, data = d)

# Expected:
#   Coefficients
#                                                    b      SE       t      β      p
#   --------------------------------------------  ------  ------  ------  -----  ----
#   (Intercept)                                   21.144   9.146   2.312         .024
#   SocialSupport                                  1.408   0.584   2.413  0.359  .019
#   Condition (ref = 1: Control)
#     2: CBT                                      27.788  16.957   1.639         .106
#     3: Mindfulness                              17.570  13.287   1.322         .191
#     4: Support group                            14.774  11.245   1.314         .194
#   SocialSupport * Condition (ref = 1: Control)
#     2: CBT                                      -0.936   1.081  -0.866         .390
#     3: Mindfulness                              -0.249   0.866  -0.288         .775
#     4: Support group                            -0.503   0.762  -0.660         .512
#
#   In a model with an interaction, β comes from centered predictors: a β can
#   have the opposite sign from its b, and other software may report
#   different β values.
#   See ?jlm.
#
# Things to look at:
#   - The interaction block mirrors the Condition block: same header form,
#     same indented category rows, same value labels.
#   - Only SocialSupport carries a beta. The " * " reads as the interaction
#     operator commercial statistical software uses.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 4 -- the same model, std = "all" ----
# NEEDS: 3
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Nothing suppressed: the dummy rows and the interaction rows show their
# prevalence-scaled betas, for the reader who wants them.

jlm(Flourishing ~ SocialSupport * Condition, data = d, std = "all")

# Expected:
#   Coefficients
#                                                    b      SE       t       β      p
#   --------------------------------------------  ------  ------  ------  ------  ----
#   (Intercept)                                   21.144   9.146   2.312          .024
#   SocialSupport                                  1.408   0.584   2.413   0.359  .019
#   Condition (ref = 1: Control)
#     2: CBT                                      27.788  16.957   1.639   0.425  .106
#     3: Mindfulness                              17.570  13.287   1.322   0.438  .191
#     4: Support group                            14.774  11.245   1.314   0.257  .194
#   SocialSupport * Condition (ref = 1: Control)
#     2: CBT                                      -0.936   1.081  -0.866  -0.134  .390
#     3: Mindfulness                              -0.249   0.866  -0.288  -0.038  .775
#     4: Support group                            -0.503   0.762  -0.660  -0.083  .512
#
# Things to look at:
#   - The same rows as Section 3 with the beta cells filled.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 5 -- the same model, std = "gelman": every dummy centered ----
# NEEDS: 3
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The paper's rule applied to every 0/1 column, the three Condition dummies
# included. SocialSupport's Gelman beta, 9.967, is its two-SD effect averaged
# over the four conditions. arm::standardize() leaves a factor's dummies at
# 0/1 and would print 13.901 here -- the effect in the Control group -- so
# this is the one model shape where jstats and arm part; ?jlm says so.

jlm(Flourishing ~ SocialSupport * Condition, data = d, std = "gelman")

# Expected:
#   Coefficients
#                                                    b      SE       t    Gelman β    p
#   --------------------------------------------  ------  ------  ------  --------  ----
#   (Intercept)                                   21.144   9.146   2.312            .024
#   SocialSupport                                  1.408   0.584   2.413    9.967   .019
#   Condition (ref = 1: Control)
#     2: CBT                                      27.788  16.957   1.639   14.637   .106
#     3: Mindfulness                              17.570  13.287   1.322   14.074   .191
#     4: Support group                            14.774  11.245   1.314    7.715   .194
#   SocialSupport * Condition (ref = 1: Control)
#     2: CBT                                      -0.936   1.081  -0.866   -9.244   .390
#     3: Mindfulness                              -0.249   0.866  -0.288   -2.457   .775
#     4: Support group                            -0.503   0.762  -0.660   -4.962   .512
#
#   In a model with an interaction, Gelman β comes from centered predictors: a
#   Gelman β can have the opposite sign from its b, and other software may
#   report different Gelman β values.
#   See ?jlm.
#
# Things to look at:
#   - Every row has a Gelman beta: a 0/1 contrast is the benchmark the
#     scaling is built on, so nothing is suppressed in this column.
#   - The Condition rows' Gelman betas are their raw group differences at
#     average support (14.637 for CBT), not the b's 27.788 at zero support.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 6 -- jlogistic: the same grouping, no standardized column ----
# NEEDS: 3
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# jlogistic shares the coefficient-table code, so its interaction rows group
# and read the same way. It has no beta column, so there is no legend.

jlogistic(SoughtHelp ~ SocialSupport * Condition, data = d)
jdummy(d, Condition, remove = TRUE)

# Expected:
#   Coefficients
#                                                    b      SE    Wald  df    p   Exp(B)
#   --------------------------------------------  ------  -----  -----  --  ----  ------
#   (Intercept)                                    0.917  1.608  0.325   1  .569   2.501
#   SocialSupport                                 -0.131  0.110  1.416   1  .234   0.877
#   Condition (ref = 1: Control)
#     2: CBT                                      -4.839  3.500  1.911   1  .167   0.008
#     3: Mindfulness                              -7.105  3.801  3.493   1  .062   0.001
#     4: Support group                            -2.406  2.034  1.399   1  .237   0.090
#   SocialSupport * Condition (ref = 1: Control)
#     2: CBT                                       0.345  0.222  2.421   1  .120   1.412
#     3: Mindfulness                               0.450  0.232  3.750   1  .053   1.568
#     4: Support group                             0.195  0.142  1.876   1  .171   1.215
#
#   Outcome: SoughtHelp
#
# Things to look at:
#   - The blank line and the Outcome line follow the table directly: no
#     legend here.
#   - "jdummy ... removed" prints after the model: the section's clean-up.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 7 -- a 0/1 predictor in the interaction ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SoughtHelp is 0/1, so its row is annotated "(1)" and its beta suppressed
# (the Session-128 rule); the interaction row carries the same annotation and
# the same blank.

jlm(Flourishing ~ SocialSupport * SoughtHelp, data = d)

# Expected:
#   Coefficients
#                                      b       SE       t      β      p
#   ------------------------------  -------  ------  ------  -----  -----
#   (Intercept)                      39.974   5.578   7.167         <.001
#   SocialSupport                     0.738   0.385   1.914  0.376   .060
#   SoughtHelp (1)                  -18.338  10.233  -1.792          .078
#   SocialSupport * SoughtHelp (1)    1.066   0.667   1.599          .115
#
# Things to look at:
#   - The interaction row names its 0/1 part the way the main-effect row
#     does.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 8 -- the legend tiers list every predictor (AUDIT-036) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# At full, variable.id is "legend": a computed term such as I(ScreenTime > 4)
# is not a column of the data frame, so it has no label; it was left out of
# the Predictors block, which then disagreed with the VIF table below it.
# It is now listed as its bare text.

joutput("full", quiet = TRUE)
jlm(Flourishing ~ I(ScreenTime > 4) + SocialSupport, data = d,
    diagnostics = "vif")
joutput(NULL, quiet = TRUE)

# Expected:
#   Outcome:
#     Flourishing   = Flourishing score (0-100)
#   Predictors:
#     I(ScreenTime > 4)
#     SocialSupport = Perceived social support (0-24)
#
# Things to look at:
#   - Two predictors listed, two rows in the VIF table further down.
#     (Since v0.9.219 the full level does not bring the VIF table, so
#     the call asks for it: diagnostics = "vif".)

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 9 -- a squared term: the default column and its note (S321) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# I(Stress^2) is now recomputed from the standardized Stress in the refit
# -- the square of the z-score, not the z-score of the square -- as the
# interaction's product already was. Until v0.9.199 the square's own column
# was standardized, which gave 0.369 and -0.723 here; std = "product" now
# gives those numbers on request (Section 12 shows it on an interaction).

jlm(Flourishing ~ Stress + I(Stress^2), data = d)

# Expected:
#   Coefficients
#                   b      SE      t       β      p
#   -----------  ------  -----  ------  ------  -----
#   (Intercept)  50.111  5.210   9.618          <.001
#   Stress        0.711  0.607   1.171  -0.262   .246
#   I(Stress^2)  -0.040  0.017  -2.296  -0.154   .025
#
#   In a model with a squared term, β comes from centered predictors: a β can
#   have the opposite sign from its b, and other software may report
#   different β values.
#   See ?jlm.
#
# Things to look at:
#   - Stress: b 0.711 is the slope at Stress = 0, beta -0.262 the slope at
#     average stress. Opposite signs on one row, as in Section 1, and the
#     note says so -- naming "a squared term", the only kind of term this
#     model has.
#   - These are the betas effectsize's default refit gives. The Gelman
#     column (std = "gelman") would read -7.472 and -8.774, arm's numbers.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 10 -- an interaction and a squared term, std = "gelman" (S321) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Both kinds in one model: the note names both. The Gelman column is the
# paper's refit with the square formed after the rescaling; arm::standardize()
# gives exactly these four numbers.

jlm(Flourishing ~ SocialSupport * Stress + I(Stress^2), data = d, std = "gelman")

# Expected:
#   Coefficients
#                              b      SE       t    Gelman β    p
#   ----------------------  ------  ------  ------  --------  -----
#   (Intercept)             78.751  16.153   4.875            <.001
#   SocialSupport           -1.604   0.918  -1.748    8.121    .086
#   Stress                  -2.639   1.251  -2.109   -5.048    .039
#   I(Stress^2)              0.001   0.020   0.057    0.250    .955
#   SocialSupport * Stress   0.161   0.053   3.005   23.135    .004
#
#   In a model with an interaction and a squared term, Gelman β comes from
#   centered predictors: a Gelman β can have the opposite sign from its b, and
#   other software may report different Gelman β values.
#   See ?jlm.
#
# Things to look at:
#   - "an interaction and a squared term": the note names what is there.
#     Section 1's model, with an interaction only, still reads "an
#     interaction" alone.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 11 -- a product and a square computed by hand (S321) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The product computed by hand and entered as its own variable fits the same
# model as SocialSupport * Stress -- b, SE, t and p match Section 1 -- but
# jlm cannot see its parts, so its beta treats it as an ordinary predictor.
# A note now says so, naming the variable. The second call adds a square
# made the same way.

d$SSxS     <- d$SocialSupport * d$Stress
d$StressSq <- d$Stress^2
jlm(Flourishing ~ SocialSupport + Stress + SSxS, data = d)
jlm(Flourishing ~ SocialSupport + Stress + SSxS + StressSq, data = d)

# Expected (first call):
#   Coefficients
#                     b      SE       t       β      p
#   -------------  ------  ------  ------  ------  -----
#   (Intercept)    78.089  11.164   6.995          <.001
#   SocialSupport  -1.573   0.740  -2.126  -0.536   .037
#   Stress         -2.576   0.588  -4.385  -1.337  <.001
#   SSxS            0.159   0.041   3.873   1.320  <.001
#
#   SSxS is SocialSupport * Stress entered as its own variable, so β treats it
#   as an ordinary predictor, not as an interaction.
#   See ?jlm.
#
# Expected (second call):
#   Coefficients
#                     b      SE       t       β      p
#   -------------  ------  ------  ------  ------  -----
#   (Intercept)    78.751  16.153   4.875          <.001
#   SocialSupport  -1.604   0.918  -1.748  -0.547   .086
#   Stress         -2.639   1.251  -2.109  -1.369   .039
#   SSxS            0.161   0.053   3.005   1.337   .004
#   StressSq        0.001   0.020   0.057   0.021   .955
#
#   SSxS is SocialSupport * Stress and StressSq is Stress squared, each entered
#   as its own variable, so β treats them as ordinary predictors, not as an
#   interaction and a squared term.
#   See ?jlm.
#
# Things to look at:
#   - First call: -0.536, -1.337 and 1.320 are the numbers Section 1's notes
#     said SPSS REGRESSION would print for a COMPUTE'd product -- the same
#     model, the second convention. Until v0.9.199 they printed with no
#     word.
#   - Second call: both variables named in one note, and both kinds of term.
#   - Stress carries declared missing values (-99, -98) on four cases, and
#     the two lines above multiply and square those codes: SSxS holds -784
#     and the like there. The models drop the four cases only because
#     Stress itself is in them -- a model with SSxS but not Stress would
#     keep them. (A Book 2 point: compute a product from variables whose
#     missing values are already declared, and check its missing cases.)

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 12 -- Section 1's model, std = "product" (S321) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The second convention on request: each predictor standardized as it
# stands, the product included, under a header that says so.

jlm(Flourishing ~ SocialSupport * Stress, data = d, std = "product")

# Expected:
#   Coefficients
#                              b      SE       t    Product β    p
#   ----------------------  ------  ------  ------  ---------  -----
#   (Intercept)             78.089  11.164   6.995             <.001
#   SocialSupport           -1.573   0.740  -2.126    -0.536    .037
#   Stress                  -2.576   0.588  -4.385    -1.337   <.001
#   SocialSupport * Stress   0.159   0.041   3.873     1.320   <.001
#
#   Product β treats each interaction as an ordinary predictor, as some other
#   software does.
#   See ?jlm.
#
# Things to look at:
#   - The same three numbers as Section 11's first call, and the product's
#     1.320 is the one Section 1's notes predicted.
#   - "Product β" in the header: the column says which convention it is.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 13 -- std = "product" on the four-category model: every row ----
#               (S321)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Condition registered again. Under "product" nothing is suppressed: the
# dummy rows and the interaction rows carry values, where Section 3's default
# column left them blank.

jdummy(d, Condition)
jlm(Flourishing ~ SocialSupport * Condition, data = d, std = "product")
jdummy(d, Condition, remove = TRUE)

# Expected:
#   Coefficients
#                                                    b      SE       t    Product β    p
#   --------------------------------------------  ------  ------  ------  ---------  ----
#   (Intercept)                                   21.144   9.146   2.312             .024
#   SocialSupport                                  1.408   0.584   2.413     0.501   .019
#   Condition (ref = 1: Control)
#     2: CBT                                      27.788  16.957   1.639     0.807   .106
#     3: Mindfulness                              17.570  13.287   1.322     0.547   .191
#     4: Support group                            14.774  11.245   1.314     0.492   .194
#   SocialSupport * Condition (ref = 1: Control)
#     2: CBT                                      -0.936   1.081  -0.866    -0.430   .390
#     3: Mindfulness                              -0.249   0.866  -0.288    -0.119   .775
#     4: Support group                            -0.503   0.762  -0.660    -0.232   .512
#
#   Product β treats each interaction as an ordinary predictor, as some other
#   software does.
#   See ?jlm.
#
# Things to look at:
#   - Every row has a value, the grouped rows included.
#   - SocialSupport reads 0.501 here and 0.359 in Section 3: under the
#     second convention its beta is the slope in the Control group (the
#     dummies' 0), not averaged over the four conditions.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 14 -- a squared term written without I() (S321) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# In a formula, ^ on a single variable is R's operator for interactions up
# to that order, so Stress^2 is Stress alone: the model below has no square
# in it, and R says nothing. jlm fits the model as written, then warns.

jlm(Flourishing ~ Stress + Stress^2, data = d)

# Expected (the table: one Stress row, no square):
#   Coefficients
#                   b      SE      t       β      p
#   -----------  ------  -----  ------  ------  -----
#   (Intercept)  58.424  3.870  15.096          <.001
#   Stress       -0.587  0.229  -2.557  -0.304   .013
#
# Expected (after the output, run line by line):
#   Warning message:
#   Stress^2 entered the model as Stress, not as Stress squared.
#   To include Stress squared, write I(Stress^2) in the formula.
#
# Things to look at:
#   - The warning follows the whole output: the model ran, and the warning
#     says what it ran. Under source() R holds warnings until the file
#     finishes, so it prints after the end marker instead.
#   - The table itself is what 0.9.198 printed; the warning is the change.
d$SSxS <- NULL; d$StressSq <- NULL


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 15 -- a text predictor's blank cells are a category (S340) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Fix Slate 3 (v0.9.214). A blank cell of a text variable -- empty, or
# holding only spaces or tabs -- is reported, never assumed missing: it is
# one category, shown as <blank> (cps_walk.R Part K has jfreq(), jscreen()
# and the group functions). Jeff's S340 ruling carried the rule into the
# models, reversing the S305 build's "an empty text cell is missing on every
# dummy". The assertion side is models_check.R L22-L31.
#
# An inline fixture, twelve cases. Source holds two empty cells, one of
# three spaces, one of a tab and one NA; Flag is "Y" or empty, the shape a
# tick-box column takes in an export.
tx15 <- data.frame(
  Source = c("Adult", "Adult", "Juvenile", "", "   ", NA, "Adult", "",
             "Juvenile", "Adult", "\t", "Adult"),
  Flag   = c("Y", "", "Y", "", "Y", "", "", "Y", "", "", "Y", ""),
  Score  = c(21, 34, 27, 45, 23, 36, 52, 41, 29, 33, 38, 47),
  stringsAsFactors = FALSE)

# Render 1 -- three categories, one of them blank.
jlm(Score ~ Source, data = tx15)

# Expected:
#   Linear Regression
#
#   Case Processing    Excluded  Remaining
#       Original             --         12
#       Auto-listwise         1         11
#       Analysis N           --         11
#
#   Missing data   From 12   %
#       Source
#         Missing     1     8.3
#   --------------------------------------
#
#   Coefficients
#                               b      SE      t    β    p
#   -----------------------  ------  -----  ------  -  -----
#   (Intercept)              37.400  4.701   7.956     <.001
#   Source (ref = 1: Adult)
#     2: Juvenile            -9.400  8.795  -1.069      .316
#     3: <blank>             -0.650  7.051  -0.092      .929
#
#   Outcome: Score
#
#   R-squared: 0.134    Adjusted R-squared: -0.083
#   Residual Standard Error: 10.512
#
#   F-statistic: 0.619 on 2 and 8 DF, p-value: .562
#   Sum of Squares:
#     Regression: 136.777
#     Residual:   883.950
#     Total:      1020.727

# Render 2 -- a word or nothing.
jlm(Score ~ Flag, data = tx15)

# Expected:
#   Linear Regression
#
#   Analysis N: 12
#
#   Coefficients
#                   b      SE      t    β    p
#   -----------  ------  -----  ------  -  -----
#   (Intercept)  39.429  3.299  11.953     <.001
#   Flag_Y       -9.429  5.110  -1.845      .095
#
#   Outcome: Score
#
#   R-squared: 0.254    Adjusted R-squared: 0.179
#   Residual Standard Error: 8.728
#
#   F-statistic: 3.404 on 1 and 10 DF, p-value: .095
#   Sum of Squares:
#     Regression: 259.286
#     Residual:   761.714
#     Total:      1021.000
rm(tx15)

# Things to look at:
#   - RENDER 1: "3: <blank>" is a row of the model. Until 0.9.214 an EMPTY
#     cell was missing on every dummy while a cell of spaces or of a tab was
#     a category of its own: this call ran on 9 cases, with the tab as its
#     reference category and a second row with no name.
#   - Analysis N is 11: only the NA cell is excluded, and the Case
#     Processing block names it. jfreq() counts the same 11 as valid, so
#     the two functions now agree about the four blank cells.
#   - <blank> is numbered LAST, so the default reference is a category with
#     a name (Adult), and a variable that gains a blank cell keeps its
#     reference. jlogistic() and jdummy() follow the same rule.
#   - RENDER 2: one row, Flag_Y -- the effect of the tick. Until 0.9.214
#     this call stopped ("'Flag' has fewer than 2 categories"), the empty
#     cells being missing.
#   - With only two categories and one of them blank, the blank IS the
#     reference: the one case in which <blank> is a default reference. The
#     other choice would print a coefficient named for the cases with
#     nothing in them. Is that the right exception?
#   - A registration made before 0.9.214 has no <blank> among its
#     categories, and keeps treating blank cells as missing until the
#     variable is registered again (models_check.R L29).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 16 -- a comparison inside a formula (S342) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Fix Slate 4 (v0.9.216), on Jeff's ruling in that session. Since v0.9.98
# EVERY computed term on a categorical variable was refused, because
# arithmetic on category codes -- log() of a 1/2/3/4 code -- fits a
# meaningless predictor without a word; the way through was the one the
# stop named, jnumeric(). A comparison is not arithmetic on codes: it asks
# which cases are in a category and gives TRUE or FALSE, as lm() reads it.
# It computes now with no registration. Arithmetic on a categorical
# variable is refused as before. The assertion side is models_check.R
# M25-M37, each fit held to lm()'s.

# Render 1 -- a comparison on a value-labelled variable: CBT (code 2)
# against the other three conditions.
jlm(Flourishing ~ SocialSupport + I(Condition == 2), data = d)

# Expected:
#   Linear Regression
#
#   Analysis N: 70
#
#   Coefficients
#                             b      SE     t      β      p
#   ---------------------  ------  -----  -----  -----  -----
#   (Intercept)            34.315  4.628  7.415         <.001
#   SocialSupport           0.994  0.313  3.172  0.354   .002
#   I(Condition == 2) (1)   6.634  3.839  1.728          .089
#
#   Outcome: Flourishing
#
#   R-squared: 0.180    Adjusted R-squared: 0.155
#   Residual Standard Error: 12.744
#
#   F-statistic: 7.337 on 2 and 67 DF, p-value: .001
#   Sum of Squares:
#     Regression: 2383.163
#     Residual:   10881.637
#     Total:      13264.800

# Render 2 -- on a text variable, which jnumeric() cannot register.
tx16 <- data.frame(
  Source = c("Adult", "Adult", "Juvenile", "Adult", "Juvenile", "Adult",
             "Adult", "Juvenile", "Juvenile", "Adult", "Juvenile", "Adult"),
  Score  = c(21, 34, 27, 45, 23, 36, 52, 41, 29, 33, 38, 47),
  stringsAsFactors = FALSE)
jlm(Score ~ I(Source == "Juvenile"), data = tx16)

# Expected:
#   Linear Regression
#
#   Analysis N: 12
#
#   Coefficients
#                                   b      SE      t    β    p
#   ---------------------------  ------  -----  ------  -  -----
#   (Intercept)                  38.286  3.567  10.733     <.001
#   I(Source == "Juvenile") (1)  -6.686  5.526  -1.210      .254
#
#   Outcome: Score
#
#   R-squared: 0.128    Adjusted R-squared: 0.040
#   Residual Standard Error: 9.437
#
#   F-statistic: 1.464 on 1 and 10 DF, p-value: .254
#   Sum of Squares:
#     Regression: 130.371
#     Residual:   890.629
#     Total:      1021.000

# Render 3 -- what is still refused, and what each stop offers. The stops
# are shown through tryCatch(), so the file still runs end to end.
tryCatch(jlm(Flourishing ~ log(Condition), data = d),
         error = function(e) cat("Error: ", conditionMessage(e), "\n", sep = ""))
tryCatch(jlm(Score ~ log(Source), data = tx16),
         error = function(e) cat("Error: ", conditionMessage(e), "\n", sep = ""))
tryCatch(jnumeric(tx16, Source),
         error = function(e) cat("Error: ", conditionMessage(e), "\n", sep = ""))
rm(tx16)

# Expected:
#   Linear Regression
#   Error: jlm(): Condition is a categorical variable, so the formula term
#   log(Condition) cannot be computed.
#   If Condition should be treated as numeric, register it first:
#     jnumeric(d, Condition)
#   Linear Regression
#   Error: jlm(): Source is a categorical variable, so the formula term
#   log(Source) cannot be computed.
#   Convert it to numbers first with jencode().
#   Error: jnumeric(): 'Source' is a character (text) variable; a numeric
#   registration applies only to numeric variables.
#   Convert it to numbers first with jencode().
#
# Things to look at:
#   - RENDER 1 fits, with no jnumeric() call before it. The row is named
#     for the term as typed, "I(Condition == 2)", and carries "(1)": the
#     coefficient is for the cases where the comparison is TRUE. Until
#     0.9.216 this call stopped ("Condition is a categorical variable, so
#     the formula term I(Condition == 2) cannot be computed").
#   - RENDER 2 fits on a text variable: the coefficient is Juvenile
#     against Adult.
#   - RENDER 3, first stop: arithmetic on a labelled categorical variable
#     is refused as before, and the jnumeric() line is offered, because
#     Condition holds numbers and the registration will take.
#   - Second stop: Source is text, so the line offered is jencode()'s.
#     Until 0.9.216 this stop offered jnumeric(tx16, Source).
#   - Third stop: that call itself, which is now refused. It used to
#     print "Numeric registration set for 'Source' in tx16." and change
#     nothing jdesc() or jscreen() could use.



# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 17 -- the "seems categorical" warning and its lines to run (S346) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Fix Slate 8 (v0.9.219). A numeric predictor with a few labelled values
# is fitted as a number, with a warning that offers two ways to treat it
# as categories. The lines it offered were rebuilt from the formula 60
# characters at a time, so a long formula printed cut off; a call that
# named its data frame was offered a line without it; and the two calls
# ran together on one line. Condition is the four-category treatment
# variable, not registered here. The assertion side is models_check.R
# N18-N27, where every printed line is run.
# warn = 1 for this section, so each warning prints where it is raised,
# under the title; at R's default it prints after the output, headed
# "Warning message:".

.warn17 <- options(warn = 1)

# Render 1 -- the data frame named in the call.
jlm(Flourishing ~ Stress + Condition, data = d)

# Expected:
#   Linear Regression
#   Warning: Condition seems categorical.
#   To treat it that way, register it with jdummy() and rerun:
#
#     jdummy(d, Condition)
#     jlm(Flourishing ~ Stress + Condition, d)
#
#   Or, for this call only:
#     jlm(Flourishing ~ Stress + Condition, d, categorical = "Condition")
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
#                   b      SE      t       β      p
#   -----------  ------  -----  ------  ------  -----
#   (Intercept)  55.505  5.440  10.202          <.001
#   Stress       -0.580  0.230  -2.515  -0.301   .014
#   Condition     1.097  1.432   0.766   0.092   .446
#
#   Outcome: Flourishing
#
#   R-squared: 0.101    Adjusted R-squared: 0.073
#   Residual Standard Error: 13.740
#
#   F-statistic: 3.542 on 2 and 63 DF, p-value: .035
#   Sum of Squares:
#     Regression: 1337.376
#     Residual:   11893.109
#     Total:      13230.485

# Render 2 -- jlogistic(), on the default data frame.
juse(d)
jlogistic(SoughtHelp ~ Stress + Condition)
juse(NULL)

# Expected:
#   Default data frame set to: d
#   Logistic Regression
#   Using default data frame: d
#   Warning: Condition seems categorical.
#   To treat it that way, register it with jdummy() and rerun:
#
#     jdummy(d, Condition)
#     jlogistic(SoughtHelp ~ Stress + Condition)
#
#   Or, for this call only:
#     jlogistic(SoughtHelp ~ Stress + Condition, categorical = "Condition")
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
#                   b      SE    Wald  df    p   Exp(B)
#   -----------  ------  -----  -----  --  ----  ------
#   (Intercept)  -1.727  0.925  3.489   1  .062   0.178
#   Stress        0.039  0.038  1.052   1  .305   1.039
#   Condition     0.084  0.233  0.131   1  .718   1.088
#
#   Outcome: SoughtHelp
#
#   Omnibus Test of Model Coefficients
#   Chi-Square  df    p
#   ----------  --  ----
#      1.170     2  .557
#
#   Model Summary
#   -2 Log Likelihood  Cox & Snell R²  Nagelkerke R²    AIC
#   -----------------  --------------  -------------  ------
#         78.062            0.018          0.025      84.062
#
#   Dependent Variable Encoding
#     Modeled (1):   Yes
#     Reference (0): No
#
#   Default data frame cleared.

# Render 3 -- a long formula, and the data given as an expression.
jlm(Flourishing ~ scale(Stress, scale = FALSE) * SocialSupport + Condition,
    data = d[d$SocialSupport > 5, ])
options(.warn17); rm(.warn17)

# Expected:
#   Linear Regression
#   Warning: Condition seems categorical.
#   To treat it that way, register it with jdummy() and rerun:
#
#     mydata <- d[d$SocialSupport > 5, ]
#     jdummy(mydata, Condition)
#     jlm(Flourishing ~ scale(Stress, scale = FALSE) * SocialSupport + Condition, mydata)
#
#   Or, for this call only:
#     jlm(Flourishing ~ scale(Stress, scale = FALSE) * SocialSupport + Condition, d[d$SocialSupport > 5, ], categorical = "Condition")
#
#   Case Processing    Excluded  Remaining
#       Original             --         65
#       Auto-listwise         4         61
#       Analysis N           --         61
#
#   Missing data   From 65   %
#       Stress
#         Missing     4     6.2
#   --------------------------------------
#
#   Coefficients
#                                                    b      SE      t       β      p
#   --------------------------------------------  ------  -----  ------  ------  -----
#   (Intercept)                                   33.348  7.126   4.680          <.001
#   scale(Stress, scale = FALSE)                  -2.465  0.637  -3.870  -0.100  <.001
#   SocialSupport                                  1.018  0.393   2.587   0.287   .012
#   Condition                                      1.093  1.337   0.817   0.090   .417
#   scale(Stress, scale = FALSE) * SocialSupport   0.153  0.044   3.469   0.328   .001
#
#   In a model with an interaction, β comes from centered predictors: a β can
#   have the opposite sign from its b, and other software may report
#   different β values.
#   See ?jlm.
#
#   Outcome: Flourishing
#
#   R-squared: 0.361    Adjusted R-squared: 0.315
#   Residual Standard Error: 11.870
#
#   F-statistic: 7.913 on 4 and 56 DF, p-value: <.001
#   Sum of Squares:
#     Regression: 4459.095
#     Residual:   7889.692
#     Total:      12348.787
#
# Things to look at:
#   - RENDER 1: "Condition seems categorical.", then two blocks. The
#     first registers the variable and reruns the call, one line each;
#     the second is the call with categorical = added, under "Or, for
#     this call only:". Both name d, as the call did.
#   - RENDER 2: the call named no data frame, so its two rerun lines name
#     none. The jdummy() line names d, which it must.
#   - RENDER 3: the formula is whole in both lines, scale(Stress, scale =
#     FALSE) and all. The data was an expression, so the first block
#     opens with "mydata <- d[d$SocialSupport > 5, ]" and its two lines name
#     mydata: a registration is stored under a data frame's name. The
#     second block repeats the call as typed, which runs as it is.
#   - The model under each warning is the numeric fit: one Condition row.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 18 -- no case left; a predictor with one value; a computed ----
#               outcome (S346)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Fix Slate 8 (v0.9.219). Three stops, shown through tryCatch(), so the
# file still runs end to end.

shown <- function(expr) tryCatch(expr, error = function(e)
  cat("Error: ", conditionMessage(e), "\n\n", sep = ""))

# Render 1 -- a filter that leaves no case, in jlm() and in jlogistic().
shown(jlm(Flourishing ~ SocialSupport + ScreenTime, data = d,
          subset = Flourishing > 200))
shown(jlogistic(SoughtHelp ~ SocialSupport + ScreenTime, data = d,
                subset = ScreenTime > 200))

# Expected:
#   Linear Regression
#
#   Case Processing  Excluded  Remaining
#       Original           --         70
#       subset =           70          0  Flourishing > 200
#       Analysis N         --          0
#   -------------------------------------------------------
#
#   Error: jlm(): No cases are left to analyze.
#   All 70 cases were excluded by a filter.
#
#   Logistic Regression
#
#   Case Processing  Excluded  Remaining
#       Original           --         70
#       subset =           70          0  ScreenTime > 200
#       Analysis N         --          0
#   ------------------------------------------------------
#
#   Error: jlogistic(): No cases are left to analyze.
#   All 70 cases were excluded by a filter.

# Render 2 -- a predictor with one value among the cases analyzed: a
# filter that names it, as subset = and as a stored jsubset() filter; a
# filter on another variable that leaves it one value (Arm is 1 in the
# Control condition and 0 elsewhere); and the data as they are.
shown(jlm(Flourishing ~ SocialSupport + PriorTherapy, data = d,
          subset = PriorTherapy == 1))
jsubset(d, PriorTherapy == 1)
shown(jlm(Flourishing ~ SocialSupport + PriorTherapy, data = d))
jsubset(d, NULL)
d$Arm <- as.numeric(d$Condition == 1)
shown(jlm(Flourishing ~ SocialSupport + Arm, data = d,
          subset = Condition == 1))
d$Site <- 1
shown(jlm(Flourishing ~ SocialSupport + Site, data = d))
d$Arm <- NULL; d$Site <- NULL

# Expected:
#   Linear Regression
#
#   Case Processing  Excluded  Remaining
#       Original           --         70
#       subset =           31         39  PriorTherapy == 1
#       Analysis N         --         39
#   -------------------------------------------------------
#
#   Error: jlm(): subset = PriorTherapy == 1 keeps only one value of
#   PriorTherapy, so its coefficient cannot be estimated.
#   To estimate it, remove the filter.
#   To analyze only those cases, remove PriorTherapy from the formula.
#
#   jsubset activated for d: PriorTherapy == 1
#   Linear Regression
#
#   Case Processing  Excluded  Remaining
#       Original           --         70
#       jsubset()          31         39  PriorTherapy == 1
#       Analysis N         --         39
#   -------------------------------------------------------
#
#   Error: jlm(): Your jsubset() filter (PriorTherapy == 1) keeps only one
#   value of PriorTherapy, so its coefficient cannot be estimated.
#   To estimate it, set the filter aside:
#     jsubset(d, off)
#   To analyze only those cases, remove PriorTherapy from the formula.
#
#   jsubset cleared for d (had: PriorTherapy == 1).
#   Linear Regression
#
#   Case Processing  Excluded  Remaining
#       Original           --         70
#       subset =           52         18  Condition == 1
#       Analysis N         --         18
#   ----------------------------------------------------
#
#   Error: jlm(): Arm has only one value in the analysis sample, so its
#   coefficient cannot be estimated.
#   Check whether subset = is excluding the other values.
#
#   Linear Regression
#
#   Analysis N: 70
#
#   Error: jlm(): Site has only one value in the analysis sample, so its
#   coefficient cannot be estimated.

# Render 3 -- a computed outcome in jlogistic().
shown(jlogistic(I(Flourishing > 50) ~ SocialSupport, data = d))

# Expected:
#   Logistic Regression
#   Error: jlogistic(): I(Flourishing > 50) is a computed term, and the outcome
#   of a logistic regression must be a variable in the data.
#   Create a 0/1 variable first, then use it as the outcome.

# Render 4 -- a categorical predictor the filter keeps to one category.
shown(jlm(Flourishing ~ SocialSupport + Condition, data = d,
          categorical = "Condition", subset = Condition == 2))

# Expected:
#   Linear Regression
#   Error: jlm(): subset = Condition == 2 keeps only one category of Condition
#   (2: CBT), and a dummy-coded predictor requires at least two.
#   To estimate its coefficients, remove the filter.
#   To analyze only those cases, remove Condition from the formula.

# Render 5 -- an outcome the filter keeps to one value, in jlogistic()
# and in jlm() (five clients score 42).
shown(jlogistic(SoughtHelp ~ SocialSupport, data = d, subset = SoughtHelp == 1))
shown(jlm(Flourishing ~ SocialSupport, data = d, subset = Flourishing == 42))

# Expected:
#   Logistic Regression
#
#   Case Processing  Excluded  Remaining
#       Original           --         70
#       subset =           49         21  SoughtHelp == 1
#       Analysis N         --         21
#   -----------------------------------------------------
#
#   Error: jlogistic(): subset = SoughtHelp == 1 keeps only one value of
#   SoughtHelp, and the outcome of a logistic regression needs two.
#   To model SoughtHelp, remove the filter.
#
#   Linear Regression
#
#   Case Processing  Excluded  Remaining
#       Original           --         70
#       subset =           65          5  Flourishing == 42
#       Analysis N         --          5
#   -------------------------------------------------------
#
#   Error: jlm(): subset = Flourishing == 42 keeps only one value of
#   Flourishing, and a regression needs an outcome that varies.
#   To model Flourishing, remove the filter.

# Render 6 -- one case left.
shown(jlm(Flourishing ~ SocialSupport, data = d, subset = ClientID == "C001"))
rm(shown)

# Expected:
#   Linear Regression
#
#   Case Processing  Excluded  Remaining
#       Original           --         70
#       subset =           69          1  ClientID == "C001"
#       Analysis N         --          1
#   --------------------------------------------------------
#
#   Error: jlm(): Only 1 case is left to analyze.
#   The other 69 cases were excluded by a filter.
#
# Things to look at:
#   - RENDER 1: "No cases are left to analyze." under the Case Processing
#     block, which shows the filter taking all 70, and a second line
#     saying how they went. The same two lines in both functions, and in
#     jt(), jaov(), jcrosstab() and jalpha() (format_walk.R Section 30).
#   - RENDER 2, first stop (Jeff's S346 walk: the hedged line "doesn't
#     address the real problem"): the filter names PriorTherapy, so the
#     stop says what it did -- "subset = PriorTherapy == 1 keeps only one
#     value of PriorTherapy" -- and gives both ways out, one to a line:
#     remove the filter to estimate the coefficient, or remove
#     PriorTherapy to analyze only those cases.
#   - Second stop: the same filter stored with jsubset(). It is named as
#     the filter, and the way to set it aside is the line jsubset() itself
#     prints, jsubset(d, off).
#   - Third stop: the filter names Condition, not Arm, so the link is for
#     the user to see, and the hedged line stays: "Check whether subset =
#     is excluding the other values."
#   - Fourth stop: no filter, so no line about filters.
#   - RENDER 3: the stop names the term as typed and says what to do. It
#     read "'I(Flourishing > 50)' has values: ." The title prints above
#     it and nothing else.
#   - RENDER 4: a predictor dummy-coded in the call, the same form: the
#     category kept, "(2: CBT)", and the two ways out. It said "'Condition'
#     has fewer than 2 categories. Cannot create dummy variables."
#   - RENDER 5: the outcome the filter names. jlogistic() said "'SoughtHelp'
#     has values: 1 ... Use jrecode() to create a 0/1 coded version" of a
#     variable coded 0/1; jlm() fitted the model and stopped on R's "0
#     (non-NA) cases". Both stops come under the Case Processing block,
#     which shows the filter.
#   - RENDER 6: "Only 1 case is left to analyze." and how the others went.
#     It said "SocialSupport has only one value in the analysis sample":
#     true of every variable in one case.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 19 -- diagnostics in jlm() and jlogistic() (S346) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# On Jeff's ruling of 8 October 2026 (v0.9.219). The VIF table and the
# five regression plots are diagnostics, asked for with diagnostics =
# and with nothing else: full = TRUE and joutput("full") printed the
# table and drew the plots until this build. TRUE is everything the
# function has; names pick among them. The plots open in the Plots pane.
# format_walk.R Section 31 shows the setting in joutput().

# Render 1 -- full = TRUE: the confidence interval, and no diagnostic.
jlm(Flourishing ~ Stress + SocialSupport, data = d, full = TRUE)

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

# Render 2 -- diagnostics = TRUE: the VIF table and five plots.
jlm(Flourishing ~ Stress + SocialSupport, data = d, diagnostics = TRUE)

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
#                     b      SE      t       β      p
#   -------------  ------  -----  ------  ------  -----
#   (Intercept)    41.495  6.575   6.311          <.001
#   Stress         -0.436  0.221  -1.974  -0.226   .053
#   SocialSupport   1.039  0.336   3.090   0.354   .003
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
#   VIF (Variance Inflation Factors)
#   Variable        VIF
#   -------------  -----
#   Stress         1.051
#   SocialSupport  1.051
#
#   (5 diagnostic plots produced -- use the back arrow in the Plots pane
#   to view all)
#     1: Residuals vs Fitted
#     2: Normal Q-Q
#     3: Scale-Location
#     4: Cook's Distance
#     5: Residuals vs Leverage

# Render 3 -- two names; a VIF above 10 and the lines under it; then the
# VIF table alone at the minimal level.
jlm(Flourishing ~ Stress * SocialSupport, data = d,
    diagnostics = c("vif", "qq"))
joutput("minimal", quiet = TRUE)
jlm(Flourishing ~ Stress * SocialSupport, data = d, diagnostics = "vif")
joutput(NULL, quiet = TRUE)

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
#                              b      SE       t       β      p
#   ----------------------  ------  ------  ------  ------  -----
#   (Intercept)             78.089  11.164   6.995          <.001
#   Stress                  -2.576   0.588  -4.385  -0.176  <.001
#   SocialSupport           -1.573   0.740  -2.126   0.285   .037
#   Stress * SocialSupport   0.159   0.041   3.873   0.400  <.001
#
#   In a model with an interaction, β comes from centered predictors: a β can
#   have the opposite sign from its b, and other software may report
#   different β values.
#   See ?jlm.
#
#   Outcome: Flourishing
#
#   R-squared: 0.366    Adjusted R-squared: 0.335
#   Residual Standard Error: 11.635
#
#   F-statistic: 11.911 on 3 and 62 DF, p-value: <.001
#   Sum of Squares:
#     Regression: 4837.188
#     Residual:   8393.297
#     Total:      13230.485
#
#   VIF (Variance Inflation Factors)
#   Variable                  VIF
#   ----------------------  ------
#   Stress                   9.084
#   SocialSupport            6.219
#   Stress * SocialSupport  11.358
#
#   Stress * SocialSupport (VIF = 11.4): standard error inflated by a
#   factor of 3.4.
#     If you need to interpret this coefficient specifically, consider whether
#     the collinearity is a concern for your research question.
#
#   (Diagnostic plot produced: Normal Q-Q)
#
#   Linear Regression
#
#   Analysis N: 66 (4 Excluded)
#
#   Coefficients
#                              b      SE       t       β      p
#   ----------------------  ------  ------  ------  ------  -----
#   (Intercept)             78.089  11.164   6.995          <.001
#   Stress                  -2.576   0.588  -4.385  -0.176  <.001
#   SocialSupport           -1.573   0.740  -2.126   0.285   .037
#   Stress * SocialSupport   0.159   0.041   3.873   0.400  <.001
#
#   In a model with an interaction, β comes from centered predictors: a β can
#   have the opposite sign from its b, and other software may report
#   different β values.
#   See ?jlm.
#
#   Outcome: Flourishing
#
#   R-squared: 0.366    Adjusted R-squared: 0.335
#   Residual Standard Error: 11.635
#
#   F-statistic: 11.911 on 3 and 62 DF, p-value: <.001
#   Sum of Squares:
#     Regression: 4837.188
#     Residual:   8393.297
#     Total:      13230.485
#
#   VIF (Variance Inflation Factors)
#   Variable                  VIF
#   ----------------------  ------
#   Stress                   9.084
#   SocialSupport            6.219
#   Stress * SocialSupport  11.358

# Render 4 -- jlogistic(), whose one diagnostic is the VIF table; and two
# names that are refused.
jlogistic(SoughtHelp ~ Stress + SocialSupport, data = d, diagnostics = TRUE)
tryCatch(jlm(Flourishing ~ Stress + SocialSupport, data = d,
             diagnostics = c("vif", "qqplot")),
         error = function(e) cat("Error: ", conditionMessage(e), "\n\n", sep = ""))
tryCatch(jlogistic(SoughtHelp ~ Stress + SocialSupport, data = d,
                   diagnostics = "qq"),
         error = function(e) cat("Error: ", conditionMessage(e), "\n", sep = ""))

# Expected:
#   Logistic Regression
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
#                     b      SE    Wald  df    p   Exp(B)
#   -------------  ------  -----  -----  --  ----  ------
#   (Intercept)    -2.256  1.206  3.500   1  .061   0.105
#   Stress          0.045  0.039  1.332   1  .248   1.046
#   SocialSupport   0.046  0.060  0.585   1  .444   1.047
#
#   Outcome: SoughtHelp
#
#   Omnibus Test of Model Coefficients
#   Chi-Square  df    p
#   ----------  --  ----
#      1.641     2  .440
#
#   Model Summary
#   -2 Log Likelihood  Cox & Snell R²  Nagelkerke R²    AIC
#   -----------------  --------------  -------------  ------
#         77.591            0.025          0.035      83.591
#
#   VIF (Variance Inflation Factors)
#   Variable        VIF
#   -------------  -----
#   Stress         1.051
#   SocialSupport  1.051
#
#   Dependent Variable Encoding
#     Modeled (1):   Yes
#     Reference (0): No
#
#   Error: jlm(): "qqplot" is not a diagnostic of jlm().
#   `diagnostics` must be TRUE, FALSE, or one or more of "vif", "residuals",
#   "qq", "scale", "cooks", and "leverage".
#
#   Error: jlogistic(): "qq" is not a diagnostic of jlogistic().
#   `diagnostics` must be TRUE, FALSE, or "vif".
#
# Things to look at:
#   - RENDER 1: the coefficient table has its two interval columns, and
#     the output ends at the Sum of Squares block. No VIF table, no line
#     about plots, and nothing drawn in the Plots pane.
#   - RENDER 2: no interval columns (the call did not ask for them); the
#     VIF table, then "(5 diagnostic plots produced ...)" and the five
#     names. Five plots are in the Plots pane.
#   - RENDER 3, first output: the VIF table, the two lines under the VIF
#     of 11.358, and "(Diagnostic plot produced: Normal Q-Q)": one plot.
#   - Second output, at the minimal level: the VIF table and no lines
#     under it. A diagnostic's brief interpretation prints at the
#     standard and full levels only, as the Levene note does.
#   - RENDER 4: jlogistic()'s VIF table sits where it always has, above
#     the Dependent Variable Encoding block, and no plot is drawn. Then
#     the two stops: a name that is no diagnostic of jlm() (it was
#     ignored: the table printed, no plot, and nothing was said), and a
#     jlm() name given to jlogistic().


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

cat("\n--- End of models_walk.R ---\n")
