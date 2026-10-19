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
#           Since S347 (v0.9.220, Sections 20-22): the stop for a model
#           with no more cases than coefficients; one "seems categorical"
#           warning for several predictors; a predictor dummy-coded in the
#           call with one category; the wrapped dummy-names note, the
#           dichotomy note's last line, jlogistic()'s text-outcome
#           refusal, an expression given as the data, "(a dichotomy)";
#           jlm()'s plot list in jlogistic()'s form, the smoother's note,
#           and the fit plot of a squared term.
#           Since S359 (v0.9.232, Section 25): the intercept-only model in
#           both, the term the fit dropped named, one effect plot per
#           variable, the count line and the logistic list as an output's
#           last line, and ggplot2's removed-row warnings in one note.
#           Since S360 (v0.9.233, Section 26): a dummy-coded variable as one
#           variable in jplot() -- one effect plot at its categories, the
#           fit and probability plots' focal variable, the equation note --
#           and the fit equation and ROC axis in ASCII.
#           Since S374 (v0.9.247, Section 27): y ~ . refused with voice Rule
#           AK's template (ruling R24) in jlm(), jaov(), jlogistic(), jt()
#           and jcrosstab().
#           Since S375 (v0.9.248, Sections 28-29): jlogistic()'s Gelman
#           column (std = "gelman", "product", "none"; "regular" refused;
#           jlm()'s notes) and the Exp(b) header; the GVIF row in the VIF
#           table; model.layout; jplot()'s Q-Q plot from a jt() or jaov()
#           result and the line it prints; jdummy()'s whole-number stop.
# ORIGIN:   S320 (v0.9.198). The first walk over jlm()/jlogistic(); the human
#           half of models_check.R sections G and (since S321) H.
# S375 EDIT (v0.9.248; Capability Slate C2): SECTIONS 28 AND 29 ADDED -- 27
#           sections -> 29 -- filled by running (fill.R): jlogistic()'s
#           standardized column (the default Gelman column, std = "product" and
#           "none", the hand-product note, std = "regular" refused); the GVIF
#           row in jlm()'s and jlogistic()'s VIF table, its two lines and the
#           set's line of interpretation; model.layout = "fit" per call and in
#           joutput(); jplot()'s Q-Q plot from a jt() or jaov() result and the
#           line it now prints; jdummy()'s stop on values that are not whole
#           numbers. RE-PINNED, each block filled by running and cut back to
#           the part of the output it showed (fill.R captures a section's whole
#           output): Section 6 (the interaction table's Gelman column and
#           legend; its title, comment and bullets rewritten), Section 17
#           (Render 2's table), Section 19 (Render 4: the Gelman column, the
#           plot list under the VIF table, the stop's longer list; its comment
#           and bullet rewritten) and Section 25 (Render 2's Exp(b) header; one
#           bullet). All six on the PENDING line: the column's place, the plot
#           list's place and the new sections are Claude's calls. A capture of
#           every section of every walk on 0.9.247 and 0.9.248: here Sections
#           6, 17, 19 and 25. harness.R derive: Sections 28 and 29 need no
#           other section; verify: 72 of 73 Expected blocks found (Section 1's,
#           as before), 29 of 29 sections in three orders and by prepare =
#           TRUE. The human half of models_check.R section Y.
# LAST VERIFIED: v0.9.248, 2026-10-19 (S375) -- Sections 6, 17, 19, 25, 28 and
#           29 WALKED on the WORKSTATION by Jeff through receive_all()
#           ("walked, all okay"); R CMD check 0 errors, 0 warnings, 0 notes;
#           ALL BATTERIES GREEN (10 run, 3035 checks).
# S375 SECOND DELIVERY (v0.9.248, the same day): Jeff's ruling on his walk --
#           the plot list's "(use the arrow buttons in RStudio's Plots pane to
#           navigate):" on a line of its own under "N diagnostic plots
#           produced" (it had wrapped mid-phrase), in jlm(), jlogistic() and
#           both jplot() lists. Seven blocks RE-PINNED, each the two lines
#           alone, and each found as a run in a fill of its section on the new
#           build: Section 19 on the PENDING line, showing the form in jlm()'s
#           and jlogistic()'s lists; Sections 22, 25 and 29 RE-PINNED
#           MECHANICALLY under that ruling and kept off it. Four bullets that
#           quote the line rewritten (Sections 19, 22, 29). harness.R verify:
#           72 of 73 Expected blocks found (Section 1's, as before), 29 of 29
#           sections in three orders and by prepare = TRUE.
# LAST VERIFIED: v0.9.248, 2026-10-19 (S375, second delivery) -- Section 19
#           WALKED on the WORKSTATION by Jeff through receive_all() ("walked,
#           all okay"); PENDING back to none; R CMD check 0 errors, 0 warnings,
#           0 notes; ALL BATTERIES GREEN (10 run, 3035 checks).
# S374 EDIT (v0.9.247; Fix Slate 21): SECTION 27 ADDED, four renders --
#           26 sections -> 27 -- filled by running (fill.R, warnings shown at
#           once so an earlier section's pending warning stays there): the
#           dot refused with the Rule AK template (ruling R24) -- jlm() as
#           ruled; jaov(), jt(), jlogistic() and jcrosstab() each with its
#           sentence; a dot beside named terms and on the left; no data frame
#           named. On the PENDING line (the template is ruled; the
#           sentences for jt() and jcrosstab() and the left-side form are
#           Claude's). A capture of every section of every walk on 0.9.246
#           and 0.9.247: here only Section 26's trailing blank (no longer
#           the last section). harness.R derive: Section 27 needs no other;
#           verify: 65 of 66 Expected blocks found (Section 1's, as
#           before), 27 of 27 sections in three orders and by prepare =
#           TRUE. The human half of models_check.R section X.
# LAST VERIFIED: v0.9.247, 2026-10-19 (S374) -- Section 27 WALKED on the
#           WORKSTATION by Jeff through receive_all() ("walked, all okay");
#           PENDING back to none; R CMD check 0 errors, 0 warnings, 0 notes;
#           ALL BATTERIES GREEN (10 run, 3016 checks).
# S360 EDIT (v0.9.233; Fix Slate 11): SECTION 26 ADDED, five renders --
#           25 sections -> 26 -- filled by running (fill.R): a dummy-coded
#           variable as ONE effect plot, its categories along the axis
#           (Jeff's okay of the lean, S360), the predictions printed under
#           the count line; the fit plot's default focal and focal = g, the
#           cases behind the categories, "(means shown at x = 0)" (Jeff:
#           "fix in this build"); the refusal listing variables;
#           jlogistic()'s probability plot at focal = g; the fit equation's
#           hyphen and the ROC axis. On the PENDING line: a design Claude
#           drew. A capture of every section of every walk on 0.9.232 and
#           0.9.233: no other section moved (temporary paths aside).
#           harness.R derive: Section 26 needs no other; verify: 61 of 62
#           Expected blocks found (Section 1's, as before), 26 of 26
#           sections in three orders and by prepare = TRUE. A full run
#           raises the same eight warnings as before Section 26.
#           The human half of models_check.R section W.
# LAST VERIFIED: v0.9.233, 2026-10-16 (S360) -- Section 26 WALKED on the
#           WORKSTATION by Jeff through receive_all() ("walked, all okay");
#           PENDING back to none; GitHub cfbf813 (package).
# S359 EDIT (v0.9.232; Fix Slate 10): SECTION 25 ADDED, seven renders --
#           24 sections -> 25 -- filled by running (fill.R): the
#           intercept-only model in jlm() and jlogistic() (Jeff, S358: "yes,
#           support both"), its diagnostics and jplot() on both; the
#           collinearity warning naming the term the fit dropped, one and
#           two; one effect plot per variable (Jeff's S358 okay), a squared
#           term and a product; the count line laid out as an output's last
#           line; ggplot2's "Removed 1 rows" warnings summed up in one note;
#           the logistic diagnostics list in the count line's layout.
#           SECTIONS 21 AND 22 RE-PINNED, refilled by running after a
#           capture of every section on 0.9.231 and 0.9.232: "jlogistic()
#           models)" (Rule AE), and Section 22's count line "(1 effect plot
#           produced)" for a variable and its square, with nothing above it.
#           All three on the PENDING line: wording and layout Claude chose.
#           harness.R derive: Section 25 needs no other; verify: 55 of 56
#           Expected blocks found (Section 1's, as before), 25 of 25 sections
#           in three orders and by prepare = TRUE. The human half of
#           models_check.R section U.
# LAST VERIFIED: v0.9.232, 2026-10-16 (S359) -- Sections 21, 22 and 25
#           WALKED on the WORKSTATION by Jeff through receive_all(), under
#           the tool's default walk line ("walked, all okay"); PENDING back
#           to none; GitHub 6cf15d7 (package).
# S357 EDIT (v0.9.231; the FRAMES slate, ruling R19): SECTION 24 ADDED,
#           four renders, filled by running (fill.R): a computed term
#           reading a workspace vector of one value per case and an object
#           fetched through $, each stopping with R19's message, the line
#           that adds it and the call; a condition, per call and set with
#           jsubset(); a single vector with a condition on another one
#           ("Put both in a data frame first"); and the value forms still
#           running. SECTION 23 RENDER 3 RE-PINNED (repin.py): the fetched
#           G, which the S356 guard called a computed categorical variable,
#           is R19's stop, added as G2 beside the frame's own G. Both on the
#           PENDING line.
# S356 EDIT (v0.9.229, 2026-10-15): SECTION 23 ADDED, three renders -- 22
#           sections -> 23. The NAMES slate (ruling R18) on the formula
#           functions: a term in quotes (jt(Flourishing ~ "Condition"),
#           jlm(... + "Stress")) stops before the title with the call given
#           without them, where it crashed after it; a bare word where a
#           quoted value goes -- diagnostics = levene, which = effects, std
#           = gelman -- gets the pointer with the call to run, where R
#           looked the word up; and (e) a term written .GlobalEnv$G on a
#           frame holding a G is judged by what it gives, named as written,
#           while d23$G keeps the S322 refusal. The full fit between the
#           renders is run, not shown (#@SKIP). Every Expected FILLED BY
#           RUNNING the file (fill.R). harness.R derive: Section 23 needs
#           no other; verify: 42 of 43 Expected blocks found (Section 1's,
#           as before), 23 of 23 sections in three orders and by prepare =
#           TRUE. The human half of models_check.R section S.
# LAST VERIFIED: v0.9.231, 2026-10-16 (S357) -- Sections 23 and 24
#           WALKED on the WORKSTATION by Jeff through receive_all(), under
#           the tool's default walk line; PENDING back to none; GitHub
#           2a4fcc3 (package). Section 23's Render 3 is ruling R19's stop,
#           as the S356 stamp below said the build would make it.
#           Sandbox: harness.R verify, 24 of 24 sections in three orders
#           and by prepare = TRUE; 46 of 47 Expected blocks under rewalk()
#           (Section 1's, as before).
# LAST VERIFIED: v0.9.229, 2026-10-15 (S356) -- Section 23 WALKED on the
#           WORKSTATION by Jeff through receive_all(). Render 3's stop,
#           jt(Score ~ .GlobalEnv$G, data = d23), was questioned and
#           answered: it is the S172 computed-term guard meeting a fetched
#           factor, correct by the rules as they stand, and the reason its
#           message states ("produces a categorical variable") is folded
#           into ruling R19 (data frames only; the FRAMES slate), whose
#           build RE-PINS this render. PENDING back to none; GitHub fea0b51
#           (package). Sandbox: 42 of 43 Expected blocks found under
#           rewalk() in three orders, as before (Section 1's block is not a
#           contiguous run by design).
# S353 EDIT (v0.9.226, 2026-10-12): SECTION 17 RE-PINNED MECHANICALLY
#           under ruling R5 (the layout of a long printed call; walked
#           once, in missing_convention_walk.R Section 64), so PENDING
#           stays none: the "seems categorical" warning's two refits with
#           the long formula break after its comma, the formula whole on
#           the call's first line (77 characters: a formula is one piece,
#           never broken). Re-pinned from a capture of every section on
#           0.9.225 and 0.9.226. harness.R verify: 39 of 40 Expected blocks
#           found (Section 1's, as before), 22 of 22 sections.
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
# S347 EDIT (v0.9.220): SECTIONS 20-22 ADDED for Fix Slate 8's second
#           half: no more cases than coefficients, one warning for two
#           predictors that seem categorical, and one category of a text
#           predictor dummy-coded in the call (20); the printed lines --
#           the dummy-names note wrapped, the 1/2 dichotomy note's last
#           line (voice Rule X), jlogistic()'s text-outcome refusal and
#           the same given an expression, the formula guard given an
#           expression, a 3/7 outcome's "(a dichotomy)" (21); the plots --
#           the plot list in jlogistic()'s form and the smoother's note
#           under it on a nine-case model, the fit and effect plots of a
#           squared term (22). Inline fixtures (m20, m21, mk21, m22, q22),
#           built and removed inside each section; Sections 20 and 21 set
#           warn = 1 for themselves, as Section 17 does. SECTION 19 RENDER
#           2 RE-PINNED: the plot list's line and its numbering (a layout
#           Claude chose, so walked). Each new Expected FILLED BY RUNNING
#           the file (fill.R), with #@SKIP before each later render of a
#           section. Section 19's "Things to look at" bullet for Render 2
#           follows the new line.
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
# LAST VERIFIED: v0.9.220, 2026-10-10 (S347) -- Sections 19-22 WALKED on the
#           WORKSTATION by Jeff through receive_all(), its closing block's
#           walk line as the tool's default leaves it; PENDING back to
#           none; GitHub 991eb6b. Sandbox: 39 of 40 Expected blocks found
#           under rewalk() in three orders, as before (Section 1's block
#           is not a contiguous run by design).
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
# SECTION 6 -- jlogistic: the same grouping, and its Gelman beta (S375) ----
# NEEDS: 3
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# jlogistic shares the coefficient-table code, so its interaction rows group
# and read the same way. Since S375 (v0.9.248, Capability Slate C2) it has a
# Gelman beta column, the default std = "gelman", from the same refit
# jlm()'s Gelman column uses -- so an interaction brings the same legend,
# pointing to ?jlogistic. Until S375 it had no standardized column and no
# legend.

jlogistic(SoughtHelp ~ SocialSupport * Condition, data = d)
jdummy(d, Condition, remove = TRUE)

# Expected:
#   Coefficients
#                                                    b      SE    Wald  df    p   Gelman β  Exp(b)
#   --------------------------------------------  ------  -----  -----  --  ----  --------  ------
#   (Intercept)                                    0.917  1.608  0.325   1  .569             2.501
#   SocialSupport                                 -0.131  0.110  1.416   1  .234    1.040    0.877
#   Condition (ref = 1: Control)
#     2: CBT                                      -4.839  3.500  1.911   1  .167    0.002    0.008
#     3: Mindfulness                              -7.105  3.801  3.493   1  .062   -0.786    0.001
#     4: Support group                            -2.406  2.034  1.399   1  .237    0.330    0.090
#   SocialSupport * Condition (ref = 1: Control)
#     2: CBT                                       0.345  0.222  2.421   1  .120    3.403    1.412
#     3: Mindfulness                               0.450  0.232  3.750   1  .053    4.442    1.568
#     4: Support group                             0.195  0.142  1.876   1  .171    1.923    1.215
#
#   In a model with an interaction, Gelman β comes from centered predictors: a
#   Gelman β can have the opposite sign from its b, and other software may
#   report different Gelman β values.
#   See ?jlogistic.
#
#   Outcome: SoughtHelp
#
# Things to look at:
#   - The Gelman beta column sits between p and Exp(b), as the beta column
#     sits between t and p in jlm(): the statistics of the fit first, then
#     the standardized one, then the odds ratio. The intercept row's cell is
#     blank.
#   - The headers read b and Exp(b), lower case, as jlm()'s b does (they
#     read Exp(B) until S375).
#   - Under the table, one blank line and the interaction legend, word for
#     word jlm()'s with ?jlogistic in place of ?jlm; then the blank line and
#     the Outcome line.
#   - The Condition rows' Gelman betas are their log-odds differences at
#     average support, as in jlm() (Section 5), so CBT's 0.002 is near zero
#     while its b, at zero support, is -4.839.
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
#                   b      SE    Wald  df    p   Gelman β  Exp(b)
#   -----------  ------  -----  -----  --  ----  --------  ------
#   (Intercept)  -1.727  0.925  3.489   1  .062             0.178
#   Stress        0.039  0.038  1.052   1  .305    0.572    1.039
#   Condition     0.084  0.233  0.131   1  .718    0.201    1.088
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
#     jlm(Flourishing ~ scale(Stress, scale = FALSE) * SocialSupport + Condition,
#         mydata)
#
#   Or, for this call only:
#     jlm(Flourishing ~ scale(Stress, scale = FALSE) * SocialSupport + Condition,
#         d[d$SocialSupport > 5, ], categorical = "Condition")
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
#   5 diagnostic plots produced
#   (use the arrow buttons in RStudio's Plots pane to navigate):
#     1. Residuals vs Fitted
#     2. Normal Q-Q
#     3. Scale-Location
#     4. Cook's Distance
#     5. Residuals vs Leverage

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

# Render 4 -- jlogistic(diagnostics = TRUE): the VIF table and, since S375,
# three plots; and two names that are refused.
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
#                     b      SE    Wald  df    p   Gelman β  Exp(b)
#   -------------  ------  -----  -----  --  ----  --------  ------
#   (Intercept)    -2.256  1.206  3.500   1  .061             0.105
#   Stress          0.045  0.039  1.332   1  .248    0.663    1.046
#   SocialSupport   0.046  0.060  0.585   1  .444    0.444    1.047
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
#   3 diagnostic plots produced
#   (use the arrow buttons in RStudio's Plots pane to navigate):
#     1. Binned Residuals
#     2. Cook's Distance
#     3. Residuals vs Leverage
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
#   `diagnostics` must be TRUE, FALSE, or one or more of "vif", "binned",
#   "cooks", and "leverage".
#
# Things to look at:
#   - RENDER 1: the coefficient table has its two interval columns, and
#     the output ends at the Sum of Squares block. No VIF table, no line
#     about plots, and nothing drawn in the Plots pane.
#   - RENDER 2: no interval columns (the call did not ask for them); the VIF
#     table, then "5 diagnostic plots produced", "(use the arrow buttons
#     ...)" on the line under it, and the five names (S347: jplot()'s line
#     for jlogistic(), word for word; the parenthesis on a line of its own
#     since S375, Jeff's ruling). Five plots are in the Plots pane.
#   - RENDER 3, first output: the VIF table, the two lines under the VIF
#     of 11.358, and "(Diagnostic plot produced: Normal Q-Q)": one plot.
#   - Second output, at the minimal level: the VIF table and no lines
#     under it. A diagnostic's brief interpretation prints at the
#     standard and full levels only, as the Levene note does.
#   - RENDER 4: jlogistic()'s VIF table sits where it always has, above the
#     Dependent Variable Encoding block; under it, since S375, the plot list
#     in jlm()'s form -- "3 diagnostic plots produced", "(use the arrow
#     buttons ...)" under it, and Binned Residuals, Cook's Distance and
#     Residuals vs Leverage -- with three plots in the Plots pane. Then the
#     two stops: a name that is no diagnostic of jlm() (it was ignored: the
#     table printed, no plot, and nothing was said), and a jlm() name given
#     to jlogistic(), whose stop now lists its four.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 20 -- no more cases than coefficients; one warning for several ----
#               predictors; one category dummy-coded in the call (S347)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Fix Slate 8's second half (v0.9.220). Three stops and a warning, beside
# Section 18's:
#   - a model with no more cases than coefficients printed NaN standard
#     errors and a blank p column (jlm), or dozens of "fitted probabilities
#     numerically 0 or 1" warnings and an Exp(B) of 62 digits (jlogistic):
#     one stop now, under the Case Processing block;
#   - two predictors that seem categorical got a warning each, each with
#     its own jdummy() line and the same refit line: one warning now;
#   - a predictor dummy-coded in the call (a text variable here) left one
#     category by a filter on another variable stopped AHEAD of the block,
#     "'grp' has fewer than 2 categories. Cannot create dummy variables.",
#     where a registered one gets Section 18's sentence under the block:
#     that sentence now, in both.
# The stops are shown through shown20(), so the file runs end to end. The
# assertion side is models_check.R Q01-Q15.
# warn = 1 for this section, as in Section 17.

.warn20 <- options(warn = 1)
shown20 <- function(expr) tryCatch(expr, error = function(e)
  cat("Error: ", conditionMessage(e), "\n\n", sep = ""))
m20 <- data.frame(y  = c(2.1, 3.4, 1.9, 4.2, 3.3, 2.8, 3.9, 4.4,
                         2.6, 3.1, 1.7, 3.8, 4.0, 2.2, 3.6, 2.9),
                  x1 = c(1.2, 2.3, 0.8, 3.1, 2.2, 1.9, 2.8, 3.5,
                         1.4, 2.0, 0.6, 2.9, 3.3, 1.1, 2.4, 1.8),
                  x2 = c(5.2, 3.1, 6.4, 2.3, 4.6, 5.5, 3.3, 1.2,
                         6.1, 4.4, 7.0, 2.8, 1.5, 6.6, 3.9, 4.2),
                  b  = rep(0:1, 8),
                  k  = rep(1:4, 4),
                  m  = rep(c(1, 2, 3, 5), each = 4),
                  grp = rep(c("a", "b"), each = 8),
                  id = 1:16, stringsAsFactors = FALSE)

# Render 1 -- three cases left for three coefficients: jlm(), then
# jlogistic().
shown20(jlm(y ~ x1 + x2, data = m20, subset = id > 13))
shown20(jlogistic(b ~ x1 + x2, data = m20, subset = id > 13))

# Expected:
#   Linear Regression
#
#   Case Processing  Excluded  Remaining
#       Original           --         16
#       subset =           13          3  id > 13
#       Analysis N         --          3
#   ---------------------------------------------
#
#   Error: jlm(): Only 3 cases are left to analyze, and the model has
#   3 coefficients.
#   A regression needs more cases than coefficients.
#   The other 13 cases were excluded by a filter.
#
#   Logistic Regression
#
#   Case Processing  Excluded  Remaining
#       Original           --         16
#       subset =           13          3  id > 13
#       Analysis N         --          3
#   ---------------------------------------------
#
#   Error: jlogistic(): Only 3 cases are left to analyze, and the model has
#   3 coefficients.
#   A logistic regression needs more cases than coefficients.
#   The other 13 cases were excluded by a filter.

# Render 2 -- two predictors that seem categorical.
jlm(y ~ k + m + x1, data = m20)

# Expected:
#   Linear Regression
#   Warning: k and m seem categorical.
#   To treat them that way, register them with jdummy() and rerun:
#
#     jdummy(m20, k, m)
#     jlm(y ~ k + m + x1, m20)
#
#   Or, for this call only:
#     jlm(y ~ k + m + x1, m20, categorical = c("k", "m"))
#
#   Analysis N: 16
#
#   Coefficients
#                   b      SE      t       β      p
#   -----------  ------  -----  ------  ------  -----
#   (Intercept)   1.116  0.118   9.433          <.001
#   k             0.032  0.031   1.021   0.043   .328
#   m            -0.001  0.022  -0.033  -0.001   .974
#   x1            0.925  0.040  23.180   0.977  <.001
#
#   Outcome: y
#
#   R-squared: 0.980    Adjusted R-squared: 0.976
#   Residual Standard Error: 0.133
#
#   F-statistic: 200.498 on 3 and 12 DF, p-value: <.001
#   Sum of Squares:
#     Regression: 10.593
#     Residual:   0.211
#     Total:      10.804

# Render 3 -- a text predictor that a filter on another variable leaves
# with one category; then the same with no filter at all.
shown20(jlm(y ~ x1 + grp, data = m20, subset = id <= 8))
shown20(jlm(y ~ x1 + grp, data = m20[m20$grp == "a", ]))

# Expected:
#   Linear Regression
#
#   Case Processing  Excluded  Remaining
#       Original           --         16
#       subset =            8          8  id <= 8
#       Analysis N         --          8
#   ---------------------------------------------
#
#   Error: jlm(): grp has only one category in the analysis sample (a); a
#   dummy-coded predictor requires at least two.
#   Check whether subset = is excluding the other categories.
#
#   Linear Regression
#
#   Analysis N: 8
#
#   Error: jlm(): grp has only one category in the analysis sample (a); a
#   dummy-coded predictor requires at least two.

options(.warn20)
rm(m20, shown20, .warn20)

# Things to look at:
#   - RENDER 1: each stop comes under the Case Processing block, which
#     shows the filter. It names both counts -- 3 cases, 3 coefficients
#     -- says what is needed, and how the other 13 cases went. No table,
#     and no warning of glm()'s ahead of jlogistic()'s stop.
#   - RENDER 2: ONE warning naming k and m ("seem categorical"), one
#     jdummy() call registering both, one refit line, and both in
#     categorical = c("k", "m").
#   - RENDER 3, first: the stop under the block, in Section 18's words
#     for a registered predictor -- the one category in parentheses,
#     then the line pointing at subset =. Second, with no filter: the
#     sentence alone, under the "Analysis N" line.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 21 -- the printed lines: a note, a refusal, an expression ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Fix Slate 8's second half (v0.9.220), the wording:
#   - the note on dummy names built from numeric codes was one line of
#     some 300 characters: it is wrapped now, a sentence a line;
#   - the dichotomy notes ended "Or recode to a permanent 0/1 variable
#     with jrecode()." -- a method, where voice Rule X asks for the state
#     to reach;
#   - jlogistic()'s refusal of a text outcome ran two sentences on one
#     line, said "Recode" over a jencode() call, and coded the blank 1,
#     so for a tick-box outcome the map modeled the blank;
#   - an expression given as the data was pasted into a line that is not
#     R ("mk()$tickR <- jencode(mk(), ...)") and into a jnumeric() call the
#     registration verbs refuse;
#   - a two-valued outcome coded other than 0/1 or 1/2 was "(a other
#     dichotomy)".
# The assertion side is models_check.R Q21-Q28.

.warn21 <- options(warn = 1)
shown21 <- function(expr) tryCatch(expr, error = function(e)
  cat("Error: ", conditionMessage(e), "\n\n", sep = ""))
m21 <- data.frame(y    = c(2.1, 3.4, 1.9, 4.2, 3.3, 2.8, 3.9, 4.4,
                           2.6, 3.1, 1.7, 3.8),
                  x1   = c(1.2, 2.3, 0.8, 3.1, 2.2, 1.9, 2.8, 3.5,
                           1.4, 2.0, 0.6, 2.9),
                  k    = rep(1:3, 4),
                  s    = rep(1:2, 6),
                  t    = rep(c(3, 7), 6),
                  tick = rep(c("Y", ""), 6),
                  stringsAsFactors = FALSE)
m21$lev <- haven::labelled(rep(1:3, 4), labels = c(Low = 1, Mid = 2, High = 3))
mk21 <- function() m21

# Render 1 -- the note on dummy names built from numeric codes.
jlm(y ~ x1 + k, data = m21, categorical = "k")

# Expected:
#   Linear Regression
#   (Note: One or more dummy names for 'k' were built from numeric codes because
#   descriptive value labels were not available.
#   If these names aren't ideal, use jrelabel() to set value labels, or
#   jrecode() to change the underlying values, then re-register with jdummy().)
#
#   Analysis N: 12
#
#   Coefficients
#                   b      SE      t      β      p
#   -----------  ------  -----  ------  -----  -----
#   (Intercept)   1.140  0.109  10.457         <.001
#   x1            0.960  0.040  23.916  0.987  <.001
#   k (ref = 1)
#     2          -0.005  0.084  -0.059          .955
#     3          -0.046  0.087  -0.528          .612
#
#   Outcome: y
#
#   R-squared: 0.987    Adjusted R-squared: 0.982
#   Residual Standard Error: 0.119
#
#   F-statistic: 206.269 on 3 and 8 DF, p-value: <.001
#   Sum of Squares:
#     Regression: 8.786
#     Residual:   0.114
#     Total:      8.900

# Render 2 -- a 1/2 dichotomy as a predictor.
jlm(y ~ s + x1, data = m21)

# Expected:
#   Linear Regression
#   Note: s is a 1/2 dichotomy. The model runs correctly, but registering s as a
#   dummy can help interpret the intercept:
#     jdummy(m21, s)
#   Or make it a 0/1 variable in the data frame.
#
#   Analysis N: 12
#
#   Coefficients
#                   b      SE      t      β      p
#   -----------  ------  -----  ------  -----  -----
#   (Intercept)   1.169  0.102  11.513         <.001
#   s (2)        -0.075  0.082  -0.926          .379
#   x1            0.993  0.046  21.575  1.021  <.001
#
#   Outcome: y
#
#   R-squared: 0.988    Adjusted R-squared: 0.985
#   Residual Standard Error: 0.110
#
#   F-statistic: 366.158 on 2 and 9 DF, p-value: <.001
#   Sum of Squares:
#     Regression: 8.792
#     Residual:   0.108
#     Total:      8.900

# Render 3 -- a word-or-blank outcome; then the same frame given as an
# expression.
shown21(jlogistic(tick ~ x1, data = m21))
shown21(jlogistic(tick ~ x1, data = mk21()))

# Expected:
#   Logistic Regression
#   Error: jlogistic(): 'tick' has text categories Y/<blank>.
#   Encode it as a 0/1 variable, so that the modeled category is explicit:
#     m21$tickR <- jencode(m21, tick, map = "blank=0; Y=1")
#   Then use tickR as your dependent variable (the category mapped to 1 is the
#   one jlogistic() models).
#
#   Logistic Regression
#   Error: jlogistic(): 'tick' has text categories Y/<blank>.
#   Encode it as a 0/1 variable, so that the modeled category is explicit:
#     mydata <- mk21()
#     mydata$tickR <- jencode(mydata, tick, map = "blank=0; Y=1")
#   Then use tickR as your dependent variable (the category mapped to 1 is the
#   one jlogistic() models).

# Render 4 -- arithmetic on a labelled categorical variable, the frame
# given as an expression.
shown21(jlm(x1 ~ log(lev), data = mk21()))

# Expected:
#   Linear Regression
#   Error: jlm(): lev is a categorical variable, so the formula term log(lev)
#   cannot be computed.
#   If lev should be treated as numeric, register it first:
#     mydata <- mk21()
#     jnumeric(mydata, lev)

# Render 5 -- an outcome with the two values 3 and 7.
jlm(t ~ x1, data = m21)

# Expected:
#   Linear Regression
#   Warning: 't' is the outcome variable but looks categorical (a dichotomy).
#   Linear regression expects an interval outcome.
#
#   Analysis N: 12
#
#   Coefficients
#                  b      SE     t      β      p
#   -----------  -----  -----  -----  -----  ----
#   (Intercept)  2.069  1.242  1.665         .127
#   x1           1.424  0.554  2.569  0.631  .028
#
#   Outcome: t
#
#   R-squared: 0.398    Adjusted R-squared: 0.337
#   Residual Standard Error: 1.700
#
#   F-statistic: 6.600 on 1 and 10 DF, p-value: .028
#   Sum of Squares:
#     Regression: 19.084
#     Residual:   28.916
#     Total:      48.000

options(.warn21)
rm(m21, mk21, shown21, .warn21)

# Things to look at:
#   - RENDER 1: the note, under the title, in three or four lines inside
#     the width, its second sentence starting a line of its own.
#   - RENDER 2: the note's last line, "Or make it a 0/1 variable in the
#     data frame." -- what to reach, with no function chosen for it.
#   - RENDER 3: the category list on a line of its own; "Encode it" over
#     the jencode() call; the map "blank=0; Y=1", so Y is the modeled
#     category. Given mk21(), the frame is named first, "mydata <-
#     mk21()", and the jencode() line is written on mydata.
#   - RENDER 4: "mydata <- mk21()" over "jnumeric(mydata, lev)" -- two
#     lines that run, where it printed "jnumeric(mk21(), lev)".
#   - RENDER 5: "(a dichotomy)".


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 22 -- the plots: the list, the smoother, a squared term ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Fix Slate 8's second half (v0.9.220), the plots. LOOK AT THE PLOTS PANE
# after each render.
#   - jlm()'s line over its plot list now reads as jplot()'s for
#     jlogistic() does, word for word.
#   - On a few cases R's smoother cannot draw a reliable trend line and
#     warns, four times a plot -- "pseudoinverse used at -0.47261",
#     "neighborhood radius 0.43668" -- twelve raw warnings on this
#     nine-case model, which at R's default printed after everything else
#     and, past ten, as "There were 13 warnings (use warnings() to see
#     them)", the thirteenth being the package's own. They are caught
#     where the plots are drawn, and one note under the list says which
#     trend lines they concern (Jeff's lean B, S347).
#   - jplot()'s fit plot held a squared term at 0 while its variable moved
#     along the axis: for y ~ x + I(x^2) it drew the straight line
#     b0 + b1 x under "(line shown at I(x^2) = 0)". It draws the curve
#     now. Its equation printed `I(x^2)` in backticks.
#   - "(1 effect plots produced, one per predictor)" is in number.
# The assertion side is models_check.R Q29-Q39.

m22 <- data.frame(y = c(0.1, -0.4, 0.3, 0.9, 0.2, -0.1, 1.3, 0.8, NA),
                  x = c(1, 1, 1, 2, 2, 2, 3, 3, 3))
q22 <- data.frame(xc = round(seq(-2, 2, length.out = 25), 3))
q22$yc <- round(1 + q22$xc + 2 * q22$xc^2 +
                  c(0.3, -0.2, 0.1, -0.4, 0.2, 0.0, -0.1, 0.3, -0.3, 0.2,
                    0.1, -0.2, 0.0, 0.2, -0.1, 0.3, -0.2, 0.1, -0.3, 0.2,
                    0.0, -0.1, 0.2, -0.2, 0.1), 3)

# Render 1 -- nine cases, diagnostics = TRUE: five plots in the pane.
jlm(y ~ x, data = m22, diagnostics = TRUE, numeric = "x")

# Expected:
#   Linear Regression
#
#   Case Processing    Excluded  Remaining
#       Original             --          9
#       Auto-listwise         1          8
#       Analysis N           --          8
#
#   Missing data   From 9    %
#       y
#         Missing     1    11.1
#   --------------------------------------
#
#   Coefficients
#                   b      SE      t      β      p
#   -----------  ------  -----  ------  -----  ----
#   (Intercept)  -0.569  0.372  -1.532         .177
#   x             0.510  0.183   2.788  0.751  .032
#
#   Outcome: y
#
#   R-squared: 0.564    Adjusted R-squared: 0.492
#   Residual Standard Error: 0.404
#
#   F-statistic: 7.775 on 1 and 6 DF, p-value: .032
#   Sum of Squares:
#     Regression: 1.269
#     Residual:   0.979
#     Total:      2.249
#
#   5 diagnostic plots produced
#   (use the arrow buttons in RStudio's Plots pane to navigate):
#     1. Residuals vs Fitted
#     2. Normal Q-Q
#     3. Scale-Location
#     4. Cook's Distance
#     5. Residuals vs Leverage
#
#   Note: The trend lines in Residuals vs Fitted, Scale-Location, and Residuals
#   vs Leverage may not be reliable.
#   R's smoother reported 12 numerical problems while drawing them.

# Render 2 -- a squared term: the fit plot, then the effect plots.
r22 <- jlm(yc ~ xc + I(xc^2), data = q22)
jplot(r22, which = "fit")
jplot(r22, which = "effects")

# Expected:
#   Linear Regression
#
#   Analysis N: 25
#
#   Coefficients
#                  b      SE      t      β      p
#   -----------  -----  -----  ------  -----  -----
#   (Intercept)  1.005  0.065  15.404         <.001
#   xc           0.998  0.036  27.612  0.421  <.001
#   I(xc^2)      2.002  0.034  59.387  1.035  <.001
#
#   In a model with a squared term, β comes from centered predictors: a β can
#   have the opposite sign from its b, and other software may report
#   different β values.
#   See ?jlm.
#
#   Outcome: yc
#
#   R-squared: 0.995    Adjusted R-squared: 0.994
#   Residual Standard Error: 0.217
#
#   F-statistic: 2144.644 on 2 and 22 DF, p-value: <.001
#   Sum of Squares:
#     Regression: 202.404
#     Residual:   1.038
#     Total:      203.443
#
#   (1 effect plot produced)

rm(m22, q22, r22)

# Things to look at:
#   - RENDER 1: "5 diagnostic plots produced" and, on the line under it,
#     "(use the arrow buttons in RStudio's Plots pane to navigate):" (a line
#     of its own since S375; it had wrapped mid-phrase), over the five
#     names, "1." to "5." -- jplot()'s form for jlogistic(). Then a blank
#     line and the note: the three plots with a trend line named, and the
#     count of the smoother's problems. No "Warning:" line anywhere. In the
#     pane, the trend lines of those three plots are the ones to distrust.
#   - RENDER 2: the fit plot (the first of the two drawn) is a curve
#     through the points; its subtitle is the equation, "yc = ... +
#     ...·I(xc^2)", with no backticks and no "(line shown at ...)" line.
#     The effect plot: one, Effect: xc, the same curve -- one plot per
#     variable since v0.9.232, so the Effect: I(xc^2) that held xc at 0 is
#     gone. The console says "(1 effect plot produced)", with the jlm()
#     output's one blank line above it and none of its own (S359: it
#     opened on a blank line of its own, so two stood together).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 23 -- how a name is read: ruling R18's names slate (S356) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# v0.9.229. Ruling R18 (Jeff, S355): a variable is named without quotes,
# and anything that is not a variable goes in quotes. Three things on the
# formula functions. (b) A variable in quotes inside a formula --
# jt(Flourishing ~ "Condition", d) -- printed its title and stopped on R's
# "missing value where TRUE/FALSE needed"; it is the sibling of "The
# formula should not be in quotes" now, before the title, with the call as
# typed and the quotes gone. (c) A bare word where a quoted value goes --
# diagnostics = levene, which = effects -- met R's lookup of the word
# ("object 'levene' not found"; for effects, a function R has, "'match'
# requires vector arguments"); each gets jload()'s form with the call to
# run. (e) jt(Score ~ .GlobalEnv$G, dd) with the data frame holding a G was
# refused for the FRAME's G, with a registration offered that changed
# nothing about the term; the guard reads the names a term reads, never
# the component after $, so the term is judged by what it gives. The
# assertion side is models_check.R section S. The stops are shown through
# shown23(), so the file still runs end to end.
shown23 <- function(expr) tryCatch(expr, error = function(e)
  cat("Error: ", conditionMessage(e), "\n", sep = ""))

# Render 1 -- a variable in quotes inside the formula, in jt() and jlm().
shown23(jt(Flourishing ~ "Condition", data = d))
shown23(jlm(Flourishing ~ SocialSupport + "Stress", data = d))

# Expected:
#   Error: jt(): "Condition" is in quotes.
#   A variable in a formula is named without quotes:
#     jt(Flourishing ~ Condition, data = d)
#   Error: jlm(): "Stress" is in quotes.
#   A variable in a formula is named without quotes:
#     jlm(Flourishing ~ SocialSupport + Stress, data = d)

# Render 2 -- a bare word where a quoted value goes.
m23 <- jlm(Flourishing ~ SocialSupport + Stress, data = d)
shown23(jaov(Flourishing ~ Condition, data = d, diagnostics = levene))
shown23(jplot(m23, which = effects))
shown23(jlm(Flourishing ~ SocialSupport, data = d, std = gelman))

# Expected:
#   Error: jaov(): levene is not in quotes.
#   diagnostics = takes a diagnostic name in quotes:
#     jaov(Flourishing ~ Condition, data = d, diagnostics = "levene")
#   Error: jplot(): effects is not in quotes.
#   which = takes a plot name in quotes:
#     jplot(m23, which = "effects")
#   Error: jlm(): gelman is not in quotes.
#   std = takes a choice in quotes:
#     jlm(Flourishing ~ SocialSupport, data = d, std = "gelman")

# Render 3 -- a term that reads a workspace object through $, with the
# data frame holding a variable of that name.
d23 <- data.frame(Score = c(10, 14, 12, 18, 11, 20, 13, 16),
                  G = factor(c("x", "y", "x", "y", "x", "y", "x", "y")))
G <- factor(c("p", "p", "p", "p", "q", "q", "q", "q"))
shown23(jt(Score ~ .GlobalEnv$G, data = d23))
shown23(jt(Score ~ d23$G, data = d23))
rm(m23, d23, G, shown23)

# Expected:
#   Independent Samples T-Test
#   Error: jt(): .GlobalEnv$G is not in the d23 data frame; it is a separate
#   object in your workspace.
#   jstats analyzes the variables of a data frame.
#   Add it to the data frame first, then name the column:
#     d23$G2 <- .GlobalEnv$G
#     jt(Score ~ G2, data = d23)
#   Independent Samples T-Test
#   Error: jt(): d23$G names the d23 data frame inside the formula.
#   Name the variable on its own, and the data frame after the formula:
#     jt(Score ~ G, data = d23)

# Things to look at:
#   - RENDER 1: no title; the quoted term named, and the call as typed with
#     the quotes gone -- "Condition" in jt(), "Stress" beside the bare
#     SocialSupport in jlm();
#   - RENDER 2: the word as typed, what the argument takes, and the call
#     with the word in quotes: diagnostics = "levene", which = "effects",
#     std = "gelman";
#   - RENDER 3 (re-pinned S357, ruling R19): the first stop names the
#     term as written, .GlobalEnv$G, as an object outside the d23 data
#     frame, with the line that adds it as G2 -- the frame has a G of its
#     own -- and the call naming G2; nothing about the frame's G, no
#     jnumeric() or jencode() line. (At S356 it said the term produces a
#     categorical variable; Jeff's walk of that render raised R19.) The
#     second, d23$G, keeps the S322 refusal: the frame named inside the
#     formula, and the call with G on its own.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 24 -- data frames only: ruling R19 (S357) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# v0.9.231. Ruling R19 (Jeff, S356): "jstats analyzes the variables of a
# data frame; a single vector can be described with jdesc(), jfreq() or
# jscreen(); anything else is added to the data frame first." A workspace
# object of one value per case read by a computed term or a condition --
# w24 below, made from d$Stress, raw -99 and -98 included, where the frame
# declares them missing -- was read as lm() reads it (S324), and behind a
# filter got the S331 count and the add-it line. It now stops with one
# message: not in the data frame, a separate object, the line that adds it
# and the call. An object fetched through $ is added under its last name
# (Section 23's Render 3, re-pinned, has the frame-has-a-G form). A single
# vector is still described on its own; a condition there reading another
# one gets the lines that put both in a data frame. A VALUE still runs: a
# cutoff, a set of codes, a summary. The assertion side is models_check.R
# section T and filter_check.R section Z. The stops are shown through
# shown24(), so the file still runs end to end.
shown24 <- function(expr) tryCatch(expr, error = function(e)
  cat("Error: ", conditionMessage(e), "\n", sep = ""))
w24   <- d$Stress / 10                     # one value for each case of d
G24   <- factor(rep(c("p", "q"), length.out = nrow(d)))
cut24 <- 20; codes24 <- c(1, 2)

# Render 1 -- a computed term reading w24, and an object fetched through $.
shown24(jlm(Flourishing ~ SocialSupport + I(Stress * w24), data = d))
shown24(jt(Flourishing ~ .GlobalEnv$G24, data = d))
# Expected:
#   Linear Regression
#   Error: jlm(): In I(Stress * w24), w24 is not in the d data frame; it is a
#   separate object in your workspace.
#   jstats analyzes the variables of a data frame.
#   Add it to the data frame first:
#     d$w24 <- w24
#     jlm(Flourishing ~ SocialSupport + I(Stress * w24), data = d)
#   Independent Samples T-Test
#   Error: jt(): .GlobalEnv$G24 is not in the d data frame; it is a separate
#   object in your workspace.
#   jstats analyzes the variables of a data frame.
#   Add it to the data frame first, then name the column:
#     d$G24 <- .GlobalEnv$G24
#     jt(Flourishing ~ G24, data = d)

# Render 2 -- a condition: per call, and set with jsubset().
shown24(jdesc(d, Flourishing, subset = w24 > 2))
shown24(jsubset(d, w24 > 2))
# Expected:
#   Descriptive Statistics
#   Error: jdesc(): In subset = w24 > 2, w24 is not in the d data frame; it is
#   a separate object in your workspace.
#   jstats analyzes the variables of a data frame.
#   Add it to the data frame first:
#     d$w24 <- w24
#     jdesc(d, Flourishing, subset = w24 > 2)
#   Error: jsubset(): In w24 > 2, w24 is not in the d data frame; it is a
#   separate object in your workspace.
#   jstats analyzes the variables of a data frame.
#   Add it to the data frame first:
#     d$w24 <- w24
#     jsubset(d, w24 > 2)

# Render 3 -- a single vector with a condition on another one.
fl24 <- d$Flourishing
shown24(jdesc(fl24, subset = w24 > 2))
# Expected:
#   Error: jdesc(): In subset = w24 > 2, w24 is a separate object in
#   your workspace.
#   jstats analyzes the variables of a data frame.
#   Put both in a data frame first:
#     mydata <- data.frame(fl24, w24)
#     jdesc(mydata, fl24, subset = w24 > 2)

# Render 4 -- values still run (TRUE: the analysis ran).
ran24 <- function(expr) !inherits(try(utils::capture.output(suppressMessages(expr)),
                                      silent = TRUE), "try-error")
print(c(cutoff  = ran24(jlm(Flourishing ~ I(Stress > cut24), data = d)),
        codes   = ran24(jdesc(d, Flourishing, subset = Condition %in% codes24)),
        summary = ran24(jlm(Flourishing ~ I(Stress > mean(w24, na.rm = TRUE)), data = d)),
        vector  = ran24(jdesc(fl24))))
# Expected:
#    cutoff   codes summary  vector 
#      TRUE    TRUE    TRUE    TRUE 
rm(shown24, w24, G24, cut24, codes24, fl24, ran24)

# Things to look at:
#   - RENDER 1: "w24 is not in the d data frame; it is a separate object
#     in your workspace." on two lines, then "jstats analyzes the variables
#     of a data frame." and the two lines to run; .GlobalEnv$G24 is added
#     as G24 and the formula names it ("then name the column");
#   - RENDER 2: the same message, "In subset = w24 > 2, ..." and "In w24 >
#     2, ...", each with its own call; nothing is stored;
#   - RENDER 3: "Put both in a data frame first:" and two lines that put
#     fl24 and w24 in mydata and describe fl24 there;
#   - RENDER 4: four TRUEs.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 25 -- Fix Slate 10: the intercept-only model, the dropped term, the plots (S359) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# v0.9.232. jlm(y ~ 1) and jlogistic(y ~ 1) stopped with R's error after the
# title; Jeff's lean at S358 ("yes, support both"): one coefficient row, one
# line in place of the F test or the Omnibus Test, R-squared 0. The plots
# that need a predictor, or are drawn against the fitted values or the
# leverage, are left out with one note. The collinearity warning names the
# term the fit dropped. jplot() draws one effect plot per variable (a term
# computed from a variable in that variable's plot; Jeff's S358 okay) and
# lays its count line out as an output's last line -- none above, one
# blank below -- as the logistic diagnostics list now is. ggplot2's own
# "Removed 1 rows" warnings are caught where each plot is drawn and summed
# up in one note under the plot list. The assertion side is models_check.R
# sections U and V. The fixtures are inline; warn = 1, so each warning
# prints where it is raised.
.warn25 <- options(warn = 1)
set.seed(2)
y25 <- data.frame(Y = stats::rbinom(60, 1, 0.3), X = round(stats::rnorm(60, 50, 10), 1))

# Render 1 -- jlm(X ~ 1): the coefficient is the mean of X; no beta column.
jlm(X ~ 1, data = y25)
# Expected:
#   Linear Regression
#
#   Analysis N: 60
#
#   Coefficients
#                   b      SE      t      p
#   -----------  ------  -----  ------  -----
#   (Intercept)  48.595  1.439  33.768  <.001
#
#   Outcome: X
#
#   R-squared: 0.000    Adjusted R-squared: 0.000
#   Residual Standard Error: 11.147
#
#   F-statistic: none (the model has no predictors to test)
#   Sum of Squares:
#     Regression: 0.000
#     Residual:   7331.408
#     Total:      7331.409

# Render 2 -- jlogistic(Y ~ 1): B is the log odds of a 1 (22 of 60).
jlogistic(Y ~ 1, data = y25)
# Expected:
#   Logistic Regression
#
#   Analysis N: 60
#
#   Coefficients
#                   b      SE    Wald  df    p   Exp(b)
#   -----------  ------  -----  -----  --  ----  ------
#   (Intercept)  -0.547  0.268  4.162   1  .041   0.579
#
#   Outcome: Y
#
#   Omnibus Test of Model Coefficients
#   None: the model has no predictors to test.
#
#   Model Summary
#   -2 Log Likelihood  Cox & Snell R²  Nagelkerke R²    AIC
#   -----------------  --------------  -------------  ------
#         78.859            0.000          0.000      80.859
#
#   Dependent Variable Encoding
#     Modeled (1):   1
#     Reference (0): 0

# Render 3 -- the diagnostics of jlm(X ~ 1), and jplot() on both results.
grDevices::pdf(NULL)
jlm(X ~ 1, data = y25, diagnostics = TRUE)
# Expected:
#   Linear Regression
#
#   Analysis N: 60
#
#   Coefficients
#                   b      SE      t      p
#   -----------  ------  -----  ------  -----
#   (Intercept)  48.595  1.439  33.768  <.001
#
#   Outcome: X
#
#   R-squared: 0.000    Adjusted R-squared: 0.000
#   Residual Standard Error: 11.147
#
#   F-statistic: none (the model has no predictors to test)
#   Sum of Squares:
#     Regression: 0.000
#     Residual:   7331.408
#     Total:      7331.409
#
#   2 diagnostic plots produced
#   (use the arrow buttons in RStudio's Plots pane to navigate):
#     1. Normal Q-Q
#     2. Cook's Distance
#
#   Note: The model has no predictors, so Residuals vs Fitted, Scale-Location,
#   and Residuals vs Leverage are not drawn.
r25a <- jlm(X ~ 1, data = y25)
r25b <- jlogistic(Y ~ 1, data = y25)
p25a <- jplot(r25a)
p25b <- jplot(r25b)
# Expected:
#   Note: The model has no predictors, so the fit plot and Residuals vs Fitted
#   are not drawn.
#   Note: The model has no predictors, so the probability plot, ROC Curve, and
#   Calibration Plot are not drawn.
#   (Diagnostic plot produced: Cook's Distance)

# Render 4 -- a predictor that is an exact linear combination of others.
c25 <- data.frame(y = c(2.1, 3.4, 1.9, 4.2, 3.3, 2.8, 3.9, 4.4, 2.6, 3.1, 1.7, 3.8),
                  x = c(1.2, 2.3, 0.8, 3.1, 2.2, 1.9, 2.8, 3.5, 1.4, 2.0, 0.6, 2.9),
                  z = c(5.1, 3.2, 6.3, 2.4, 4.5, 4.6, 3.7, 1.8, 5.9, 4.1, 6.2, 2.3))
c25$x2 <- 2 * c25$x
c25$w  <- c25$x + c25$z
r25c <- jlm(y ~ x + x2 + z, data = c25)
# Expected:
#   Linear Regression
#
#   Analysis N: 12
#
#   Warning: x2 was removed from the model: it is an exact linear combination of
#   the other predictors, so its coefficient cannot be estimated.
#   Coefficients
#                  b      SE      t      β      p
#   -----------  -----  -----  ------  -----  -----
#   (Intercept)  0.312  0.507   0.616          .553
#   x            1.137  0.112  10.135  1.169  <.001
#   z            0.107  0.067   1.595  0.184   .145
#
#   Outcome: y
#
#   R-squared: 0.990    Adjusted R-squared: 0.987
#   Residual Standard Error: 0.101
#
#   F-statistic: 429.559 on 2 and 9 DF, p-value: <.001
#   Sum of Squares:
#     Regression: 8.808
#     Residual:   0.092
#     Total:      8.900
invisible(utils::capture.output(r25d <- jlm(y ~ x + z + x2 + w, data = c25)))
p25c <- jplot(r25c, which = c("fit", "effects"))
# Expected:
#   Warning: x2 and w were removed from the model: each is an exact linear
#   combination of the other predictors, so their coefficients cannot
#   be estimated.
#   (2 effect plots produced, one per variable; none for x2, which was removed
#   from the model)

# Render 5 -- one effect plot per variable: a squared term in its
# variable's plot, a product in both of its variables' plots.
q25 <- data.frame(xc = round(seq(-2, 2, length.out = 25), 3))
q25$yc <- round(1 + q25$xc + 2 * q25$xc^2 + rep(c(0.3, -0.2, 0.1, -0.4, 0.2), 5), 3)
q25$zc <- round(rep(c(1.5, -0.5, 2.5, 0.5, -1.5), 5), 3)
r25e <- jlm(yc ~ xc + I(xc^2), data = q25)
r25f <- jlm(yc ~ xc + zc + I(xc * zc), data = q25)
p25e <- jplot(r25e, which = "effects")
print(p25e$labels$title)
p25f <- jplot(r25f, which = "effects")
print(vapply(p25f, function(p) p$labels$title, character(1)))
# Expected:
#   (1 effect plot produced)
#
#   [1] "Effect: xc"
#   (2 effect plots produced, one per variable)
#
#      effect_xc    effect_zc 
#   "Effect: xc" "Effect: zc" 

# Render 6 -- a one-case category: ggplot2's warnings, caught; one note.
set.seed(3472)
z25 <- data.frame(y = stats::rnorm(30), x = stats::rnorm(30),
                  g = c(rep("a", 15), rep("b", 14), "c"), stringsAsFactors = FALSE)
jlm(y ~ x + g, data = z25, diagnostics = c("residuals", "scale", "leverage"))
# Expected:
#   Linear Regression
#
#   Analysis N: 30
#
#   Coefficients
#                      b      SE      t      β      p
#   --------------  ------  -----  ------  -----  ----
#   (Intercept)      0.513  0.313   1.640         .113
#   x                0.043  0.227   0.191  0.038  .850
#   g (ref = 1: a)
#     2: b          -0.309  0.435  -0.710         .484
#     3: c          -0.071  1.172  -0.060         .952
#
#   Outcome: y
#
#   R-squared: 0.019    Adjusted R-squared: -0.094
#   Residual Standard Error: 1.135
#
#   F-statistic: 0.170 on 3 and 26 DF, p-value: .916
#   Sum of Squares:
#     Regression: 0.655
#     Residual:   33.486
#     Total:      34.141
#
#   3 diagnostic plots produced
#   (use the arrow buttons in RStudio's Plots pane to navigate):
#     1. Residuals vs Fitted
#     2. Scale-Location
#     3. Residuals vs Leverage
#
#   Note: Scale-Location and Residuals vs Leverage leave out 1 case with a
#   leverage of 1, whose standardized residual is undefined.

# Render 7 -- jplot()'s logistic diagnostics list.
c25$yb <- c(0, 1, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0)
r25g <- jlogistic(yb ~ x + z, data = c25)
p25g <- jplot(r25g, which = c("calibration", "cooks"))
# Expected:
#   2 diagnostic plots produced
#   (use the arrow buttons in RStudio's Plots pane to navigate):
#     1. Calibration Plot
#     2. Cook's Distance
grDevices::dev.off()
options(.warn25)
rm(.warn25, y25, c25, q25, z25, r25a, r25b, r25c, r25d, r25e, r25f,
   r25g, p25a, p25b, p25c, p25e, p25f, p25g)

# Things to look at:
#   - RENDER 1: one row, (Intercept), with b, SE, t and p and no beta
#     column; "F-statistic: none (the model has no predictors to test)";
#     R-squared and Adjusted R-squared 0.000; Regression SS 0.000;
#   - RENDER 2: one row, b -0.547 and Exp(b) 0.579 (22/38), and no Gelman
#     beta column; under "Omnibus
#     Test of Model Coefficients" the line "None: the model has no
#     predictors to test." where the table was; both pseudo R-squared 0.000;
#   - RENDER 3: "2 diagnostic plots produced", Normal Q-Q and Cook's
#     Distance, then one blank line and the note naming the three left out;
#     jplot()'s two notes;
#   - RENDER 4: "x2 was removed from the model: it is an exact linear
#     combination of the other predictors, so its coefficient cannot be
#     estimated." under "Analysis N" (warn = 1 prints it there), and the
#     two-term form "x2 and w were removed ... each is ... their
#     coefficients"; jplot() on the first: no R warning, and the count line
#     "(2 effect plots produced, one per variable; none for x2, which was
#     removed from the model)" with nothing above it and one blank line
#     below;
#   - RENDER 5: the squared-term model has one plot, "Effect: xc"; the
#     product model two, "Effect: xc" and "Effect: zc" -- no plot is titled
#     with I( );
#   - RENDER 6: no "Removed 1 rows" warnings; one blank line under the plot
#     list, then "Note: Scale-Location and Residuals vs Leverage leave out 1
#     case with a leverage of 1, whose standardized residual is undefined.";
#   - RENDER 7: the list with nothing above it and one blank line after it.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 26 -- Fix Slate 11: a dummy-coded variable is one variable in jplot() (S360) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# v0.9.233. LOOK AT THE PLOTS PANE after each render.
#   - The effect plots drew a dummy-coded variable as one plot per dummy
#     column -- Effect: g_b, g_c and g_d, each a line across 0 to 1 -- under
#     "(4 effect plots produced, one per variable)". Jeff's okay of the lean
#     at S360: ONE plot, its categories along the axis, labeled as the
#     coefficient table labels them, the predicted outcome at each as a
#     point with its 95% interval as a bar, the other variables held as at
#     = sets them (at 0 by default, as for every effect plot).
#   - The fit plot took the first predictor in the formula as its default
#     focal variable, so jlm(y ~ g + x) drew g_b along the axis, and focal
#     = g was refused with g_b, g_c, g_d and x listed (Jeff: "fix in this
#     build"). focal names a variable now; the default is the first
#     predictor that is not dummy-coded; focal = g draws the categories,
#     the cases behind them, "(means shown at x = 0)". jlogistic()'s
#     probability plot the same, "(probabilities shown at x = 0)".
#   - The equation note counted the dummy columns as predictors ("model
#     has 4 predictors" for x and g); where the two counts differ it says
#     "more than 3 terms".
#   - The fit equation's minus sign and the ROC axis's en dash are plain
#     hyphens: pdf() on macOS and Linux dropped both, with a warning each
#     (Jeff's run on Windows drew both).
# The assertion side is models_check.R section W. The fixture is inline;
# the stop is shown through shown26(), so the file still runs end to end.
shown26 <- function(expr) tryCatch(expr, error = function(e)
  cat("Error: ", conditionMessage(e), "\n", sep = ""))
set.seed(360)
d26 <- data.frame(x = round(stats::rnorm(48, 50, 10), 1),
                  g = rep(c("a", "b", "c", "d"), 12), stringsAsFactors = FALSE)
d26$y <- round(10 + 0.3 * d26$x + c(a = 0, b = 2, c = 4, d = 1)[d26$g] +
                 stats::rnorm(48), 2)
d26$o <- stats::rbinom(48, 1, stats::plogis((d26$y - mean(d26$y)) / 6))

# Render 1 -- the model, then its effect plots: Effect: x, a line; Effect:
# g, four categories. The predictions at x = 0 printed under the count line
# are the intercept plus each category's b.
r26a <- jlm(y ~ x + g, data = d26)
# Expected:
#   Linear Regression
#
#   Analysis N: 48
#
#   Coefficients
#                     b      SE      t      β      p
#   --------------  -----  -----  ------  -----  -----
#   (Intercept)     9.836  0.851  11.560         <.001
#   x               0.299  0.015  19.918  0.901  <.001
#   g (ref = 1: a)
#     2: b          2.818  0.417   6.759         <.001
#     3: c          4.463  0.424  10.532         <.001
#     4: d          1.487  0.416   3.573         <.001
#
#   Outcome: y
#
#   R-squared: 0.919    Adjusted R-squared: 0.912
#   Residual Standard Error: 1.017
#
#   F-statistic: 122.580 on 4 and 43 DF, p-value: <.001
#   Sum of Squares:
#     Regression: 507.351
#     Residual:   44.493
#     Total:      551.845
p26a <- jplot(r26a, which = "effects")
print(p26a$effect_g$layers[[1]]$data, digits = 4)
# Expected:
#   (2 effect plots produced, one per variable)
#
#        x    fit    lwr   upr
#   1 1: a  9.836  8.120 11.55
#   2 2: b 12.655 10.867 14.44
#   3 3: c 14.299 12.741 15.86
#   4 4: d 11.323  9.659 12.99

# Render 2 -- the fit plot with g first in the formula: x by default, then
# focal = g, then focal = g with x held at its mean. Each plot's subtitle
# printed under it.
invisible(utils::capture.output(r26b <- jlm(y ~ g + x, data = d26)))
p26b <- jplot(r26b, which = "fit")
cat(p26b$labels$subtitle, "\n", sep = "")
p26c <- jplot(r26b, which = "fit", focal = g)
cat(p26c$labels$subtitle, "\n", sep = "")
p26g <- jplot(r26b, which = "fit", focal = g, at = "mean")
cat(p26g$labels$subtitle, "\n", sep = "")
# Expected:
#   R² = 0.919
#   (line shown at g_b = 0, g_c = 0, g_d = 0)
#   (equation omitted: more than 3 terms; see jlm() output for coefficients)
#   R² = 0.919
#   (means shown at x = 0)
#   (equation omitted: more than 3 terms; see jlm() output for coefficients)
#   R² = 0.919
#   (means shown at x = 51.92)
#   (equation omitted: more than 3 terms; see jlm() output for coefficients)

# Render 3 -- a name that is not a variable of the model.
shown26(jplot(r26b, which = "fit", focal = q))
# Expected:
#   Error: jplot(): `focal` must be one of the independent variables in the
#   model: g, x

# Render 4 -- jlogistic(): the probability plot at focal = g, x held at its
# mean (at x = 0 every probability is near 0).
invisible(utils::capture.output(r26c <- jlogistic(o ~ g + x, data = d26)))
p26d <- jplot(r26c, which = "probability", focal = g, at = "mean")
cat(p26d$labels$subtitle, "\n", sep = "")
# Expected:
#   (probabilities shown at x = 51.92)

# Render 5 -- a negative slope's equation, and the ROC axis.
z26 <- data.frame(x = 1:20, y = 40 - 2 * (1:20) + rep(c(0.5, -0.5), 10),
                  o = rep(c(1, 1, 0, 1, 0, 0, 0, 1, 0, 0), 2))
invisible(utils::capture.output(r26d <- jlm(y ~ x, data = z26)))
invisible(utils::capture.output(r26e <- jlogistic(o ~ x, data = z26)))
p26e <- jplot(r26d, which = "fit")
cat(p26e$labels$subtitle, "\n", sep = "")
p26f <- jplot(r26e, which = "roc")
cat(p26f$labels$x, "\n", sep = "")
# Expected:
#   y = 40.08 - 2.01·x    R² = 0.998
#   (Diagnostic plot produced: ROC Curve)
#
#   False Positive Rate (1 - Specificity)
rm(shown26, d26, z26, r26a, r26b, r26c, r26d, r26e, p26a, p26b, p26c, p26d,
   p26e, p26f, p26g)

# Things to look at:
#   - RENDER 1: in the pane, Effect: x is a line with its band as before;
#     Effect: g has the four categories "1: a" to "4: d" along the axis,
#     each a point with a bar, no line between them. Under the table, "(2
#     effect plots produced, one per variable)" with one blank line after
#     it, and the four predictions: 1: a is the intercept, each other the
#     intercept plus its b;
#   - RENDER 2: the first plot has x along the axis, its line drawn with g
#     at its reference ("(line shown at g_b = 0, g_c = 0, g_d = 0)"); the
#     second has g's four categories, the cases spread a little sideways
#     over each so they can be seen, the predicted mean and its bar in
#     front, "(means shown at x = 0)" -- x is about 50 in these data, so at
#     x = 0 the means sit well below the cases, as a fitted line held at 0
#     sits away from its points; the third, at = "mean", puts the means
#     among the cases, "(means shown at x = 51.92)". All three say
#     "(equation omitted: more than 3 terms; see jlm() output for
#     coefficients)";
#   - RENDER 3: the refusal lists the model's variables, g and x;
#   - RENDER 4: the predicted probability at each category with its bar,
#     the cases at 0 and 1 behind them, "(probabilities shown at x =
#     51.92)";
#   - RENDER 5: the equation reads "y = 40.08 - 2.01..." with a plain
#     hyphen, and the ROC axis "False Positive Rate (1 - Specificity)".

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 27 -- Fix Slate 21: the dot refused, ruling R24 (S374) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# v0.9.247. Ruling R24 (Jeff, S371: "I'm leaning toward refusing the dot";
# on the template, "That looks good."). y ~ . printed its title and
# stopped: "jlm(): . was not found in the wb data frame." / "Check the
# spelling." Voice Rule AK's template now, in every formula function: the
# fixed first line, the formula as typed on a line of its own, one sentence
# on what jstats takes -- the only line that changes from case to case --
# and the function's own example on community, which runs. It comes before
# the title, and before the data frame is looked for. jt() and jcrosstab()
# had the same ". was not found", so they take the template too (a defect
# on the slate's surface; flagged at the S374 delivery). The assertion side
# is models_check.R section X; filter_check.R AB04 (re-pinned).

# Render 1 -- jlm(), the ruling's own case.
try(jlm(WellbeingScore ~ ., data = community))
# Expected:
#   Error : jlm(): this formula is not a form jstats reads:
#     WellbeingScore ~ .
#   Name each predictor in the formula, for example:
#     jlm(WellbeingScore ~ Age + Income, data = community)

# Render 2 -- jaov() and jt() name the grouping variable; jlogistic() each
# predictor; jcrosstab() each variable.
try(jaov(WellbeingScore ~ ., data = community))
try(jt(WellbeingScore ~ ., data = community))
try(jlogistic(Volunteer ~ ., data = community))
try(jcrosstab(Education ~ ., data = community))
# Expected:
#   Error : jaov(): this formula is not a form jstats reads:
#     WellbeingScore ~ .
#   Name the grouping variable in the formula, for example:
#     jaov(WellbeingScore ~ Region, data = community)
#   Error : jt(): this formula is not a form jstats reads:
#     WellbeingScore ~ .
#   Name the grouping variable in the formula, for example:
#     jt(WellbeingScore ~ Volunteer, data = community)
#   Error : jlogistic(): this formula is not a form jstats reads:
#     Volunteer ~ .
#   Name each predictor in the formula, for example:
#     jlogistic(Volunteer ~ Income + Age, data = community)
#   Error : jcrosstab(): this formula is not a form jstats reads:
#     Education ~ .
#   Name each variable in the formula, for example:
#     jcrosstab(Education ~ Volunteer, data = community)

# Render 3 -- a dot beside named terms, and a dot on the left.
try(jlm(WellbeingScore ~ Age + ., data = community))
try(jlm(. ~ Age, data = community))
# Expected:
#   Error : jlm(): this formula is not a form jstats reads:
#     WellbeingScore ~ Age + .
#   Name each predictor in the formula, for example:
#     jlm(WellbeingScore ~ Age + Income, data = community)
#   Error : jlm(): this formula is not a form jstats reads:
#     . ~ Age
#   Name each variable in the formula, for example:
#     jlm(WellbeingScore ~ Age + Income, data = community)

# Render 4 -- no data frame named and no default: the template first. The
# no-data-frame stop had offered jlm(WellbeingScore ~ ., MyData), a line
# that then stopped on the dot.
.def27 <- getOption(".jst_default_data"); options(.jst_default_data = NULL)
try(jlm(WellbeingScore ~ .))
# Expected:
#   Error : jlm(): this formula is not a form jstats reads:
#     WellbeingScore ~ .
#   Name each predictor in the formula, for example:
#     jlm(WellbeingScore ~ Age + Income, data = community)
options(.jst_default_data = .def27); rm(.def27)

# Things to look at:
#   - RENDER 1: four lines, no title above them; the example runs as
#     printed;
#   - RENDER 2: the third line is the only one that changes -- "the
#     grouping variable" for jaov() and jt(), "each predictor" for
#     jlogistic(), "each variable" for jcrosstab(), which has no outcome
#     or predictors in its formula. Is "each variable" right there?
#   - RENDER 3: the formula as typed, Age kept; a dot on the left says
#     "each variable", since what it stands for there is the outcome;
#   - RENDER 4: the template, not the no-data-frame stop.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 28 -- jlogistic's standardized column (S375) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Capability Slate C2 (v0.9.248). jlogistic() had no standardized column;
# Jeff prefers to show one. It is built as jlm()'s Gelman column is:
# Gelman's (2008) refit -- each continuous predictor centered and divided
# by two SDs, each 0/1 column centered, a power or product recomputed from
# the rescaled inputs, the outcome untouched -- on the log-odds scale. The
# column is headed "Gelman β", as jlm()'s, and sits between p and Exp(b);
# the odds-ratio header reads Exp(b), lower case as jlm()'s b is (the two
# leans the item recorded, okayed at S375). std = "product" gives the
# product-first column and std = "none" leaves it out; std = "regular",
# jlm()'s third choice, has no logistic form and is refused. The notes
# under the table are jlm()'s, pointing to ?jlogistic. Section 6 shows the
# column under an interaction. The assertion side is models_check.R
# Y12-Y15.

# Render 1 -- the default column, a 0/1 predictor among the continuous
# ones; then a four-category predictor dummy-coded in the call.
jlogistic(SoughtHelp ~ Stress + SocialSupport + PriorTherapy, data = d)
jlogistic(SoughtHelp ~ Stress + Condition, data = d, categorical = "Condition")
# Expected:
#   Logistic Regression
#   Note: PriorTherapy is a 1/2 dichotomy. The model runs correctly, but
#   registering PriorTherapy as a dummy can help interpret the intercept:
#     jdummy(d, PriorTherapy)
#   Or make it a 0/1 variable in the data frame.
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
#                        b      SE    Wald  df    p   Gelman β  Exp(b)
#   ----------------  ------  -----  -----  --  ----  --------  ------
#   (Intercept)       -4.534  1.755  6.673   1  .010             0.011
#   Stress             0.068  0.042  2.659   1  .103    1.014    1.071
#   SocialSupport      0.057  0.062  0.839   1  .360    0.557    1.059
#   PriorTherapy (2)   1.189  0.605  3.864   1  .049    1.189    3.284
#
#   Outcome: SoughtHelp
#
#   Omnibus Test of Model Coefficients
#   Chi-Square  df    p
#   ----------  --  ----
#      5.717     3  .126
#
#   Model Summary
#   -2 Log Likelihood  Cox & Snell R²  Nagelkerke R²    AIC
#   -----------------  --------------  -------------  ------
#         73.515            0.083          0.119      81.515
#
#   Dependent Variable Encoding
#     Modeled (1):   Yes
#     Reference (0): No
#
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
#                                    b      SE    Wald  df    p   Gelman β  Exp(b)
#   ----------------------------  ------  -----  -----  --  ----  --------  ------
#   (Intercept)                   -1.642  0.834  3.871   1  .049             0.194
#   Stress                         0.042  0.038  1.223   1  .269    0.623    1.043
#   Condition (ref = 1: Control)
#     2: CBT                       0.206  0.810  0.065   1  .799    0.206    1.229
#     3: Mindfulness              -0.446  0.841  0.281   1  .596   -0.446    0.640
#     4: Support group             0.400  0.716  0.312   1  .576    0.400    1.492
#
#   Outcome: SoughtHelp
#
#   Omnibus Test of Model Coefficients
#   Chi-Square  df    p
#   ----------  --  ----
#      2.257     4  .689
#
#   Model Summary
#   -2 Log Likelihood  Cox & Snell R²  Nagelkerke R²    AIC
#   -----------------  --------------  -------------  ------
#         76.975            0.034          0.048      86.975
#
#   Dependent Variable Encoding
#     Modeled (1):   Yes
#     Reference (0): No

# Render 2 -- std = "product" under an interaction; std = "none".
jlogistic(SoughtHelp ~ Stress * SocialSupport, data = d, std = "product")
jlogistic(SoughtHelp ~ Stress + SocialSupport, data = d, std = "none")
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
#                              b      SE    Wald  df    p   Product β  Exp(b)
#   ----------------------  ------  -----  -----  --  ----  ---------  ------
#   (Intercept)             -3.681  2.296  2.571   1  .109              0.025
#   Stress                   0.124  0.115  1.172   1  .279     1.841    1.132
#   SocialSupport            0.147  0.147  0.990   1  .320     1.426    1.158
#   Stress * SocialSupport  -0.006  0.008  0.562   1  .453    -1.394    0.994
#
#   Product β treats each interaction as an ordinary predictor, as some other
#   software does.
#   See ?jlogistic.
#
#   Outcome: SoughtHelp
#
#   Omnibus Test of Model Coefficients
#   Chi-Square  df    p
#   ----------  --  ----
#      2.217     3  .529
#
#   Model Summary
#   -2 Log Likelihood  Cox & Snell R²  Nagelkerke R²    AIC
#   -----------------  --------------  -------------  ------
#         77.015            0.033          0.047      85.015
#
#   Dependent Variable Encoding
#     Modeled (1):   Yes
#     Reference (0): No
#
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
#                     b      SE    Wald  df    p   Exp(b)
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
#   Dependent Variable Encoding
#     Modeled (1):   Yes
#     Reference (0): No

# Render 3 -- a product computed by hand; then std = "regular", refused.
d$StressSupport <- d$Stress * d$SocialSupport
jlogistic(SoughtHelp ~ Stress + SocialSupport + StressSupport, data = d)
d$StressSupport <- NULL
try(jlogistic(SoughtHelp ~ Stress + SocialSupport, data = d, std = "regular"))
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
#                     b      SE    Wald  df    p   Gelman β  Exp(b)
#   -------------  ------  -----  -----  --  ----  --------  ------
#   (Intercept)    -3.681  2.296  2.571   1  .109             0.025
#   Stress          0.124  0.115  1.172   1  .279    1.841    1.132
#   SocialSupport   0.147  0.147  0.990   1  .320    1.426    1.158
#   StressSupport  -0.006  0.008  0.562   1  .453   -1.394    0.994
#
#   StressSupport is Stress * SocialSupport entered as its own variable, so
#   Gelman β treats it as an ordinary predictor, not as an interaction.
#   See ?jlogistic.
#
#   Outcome: SoughtHelp
#
#   Omnibus Test of Model Coefficients
#   Chi-Square  df    p
#   ----------  --  ----
#      2.217     3  .529
#
#   Model Summary
#   -2 Log Likelihood  Cox & Snell R²  Nagelkerke R²    AIC
#   -----------------  --------------  -------------  ------
#         77.015            0.033          0.047      85.015
#
#   Dependent Variable Encoding
#     Modeled (1):   Yes
#     Reference (0): No
#
#   Error : jlogistic(): std = "regular" is not available in a logistic
#   regression: its outcome has no standard deviation to standardize by.
#   Use std = "gelman" (the default), "product" or "none".

# Things to look at:
#   - RENDER 1: "Gelman β" between p and Exp(b), its intercept cell blank.
#     PriorTherapy is a 1/2 dichotomy (its row "PriorTherapy (2)"), and a
#     two-valued predictor is centered, not scaled, so its Gelman beta is
#     its b, 1.189; Stress's and SocialSupport's are their b times two SDs.
#     Is the column's place, after p and before the odds ratio, right for a
#     reader of SPSS's table, which has no such column?
#   - The second output: Condition's three rows grouped under its header
#     with the reference, each with a Gelman beta, as in jlm() (Section 5).
#   - No note under either table: neither model has a power or a product.
#   - RENDER 2: "Product β" in the same place, then the interaction note in
#     its product-first words; the second output has no standardized column
#     at all, b, SE, Wald, df, p and Exp(b) only.
#   - RENDER 3: the note naming StressSupport as the product of two other
#     predictors, as jlm()'s does, ending "See ?jlogistic."; then the stop
#     for std = "regular", saying why and naming the two that are taken.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 29 -- the GVIF row, model.layout, jplot()'s Q-Q plot, jdummy() (S375) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Capability Slate C2 (v0.9.248), four items.
#   - The VIF table gave each dummy column a VIF of its own, which changes
#     with the reference category; car::vif() gives the set one generalized
#     VIF (Fox and Monette, 1992). A multi-category predictor -- and an
#     interaction's columns built on one -- now gets ONE row: its GVIF, Df
#     and GVIF^(1/(2*Df)), as car prints them, beside the other predictors'
#     VIF on 1 Df. Two lines under the table say what the rows are, and a
#     set whose GVIF^(1/(2*Df)) squared passes 10 gets the line of
#     interpretation. A table with no such set is as it was. jlm()'s
#     numbers are car's; jlogistic()'s come from the predictors'
#     correlations, as its VIF does.
#   - model.layout = "fit", in the call or in joutput(), prints the fit
#     block -- jlm()'s R-squared lines and F test, jlogistic()'s Omnibus
#     Test and Model Summary -- above the Coefficients table.
#     "coefficients", the default, keeps the order.
#   - jplot(which = "qq") on a jt() or jaov() result draws the normal Q-Q
#     plot of the residuals (ruling R14, part 2), which the result now
#     holds; the default stays the box plot. LOOK AT THE PLOTS PANE after
#     Render 4.
#   - jdummy() refuses a variable whose values are not whole numbers.
# The assertion side is models_check.R Y03-Y11 and Y18.

# Render 1 -- a four-category predictor in jlm()'s VIF table; the same
# predictor in an interaction in jlogistic().
jlm(Flourishing ~ Stress + SocialSupport + Condition, data = d,
    categorical = "Condition", diagnostics = "vif")
jlogistic(SoughtHelp ~ Stress * Condition, data = d,
          categorical = "Condition", diagnostics = "vif")
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
#                                    b      SE      t       β      p
#   ----------------------------  ------  -----  ------  ------  -----
#   (Intercept)                   34.038  6.849   4.970          <.001
#   Stress                        -0.437  0.202  -2.161  -0.227   .035
#   SocialSupport                  1.002  0.315   3.181   0.342   .002
#   Condition (ref = 1: Control)
#     2: CBT                      14.362  4.251   3.379           .001
#     3: Mindfulness              14.049  4.077   3.446           .001
#     4: Support group             6.502  3.888   1.672           .100
#
#   Outcome: Flourishing
#
#   R-squared: 0.384    Adjusted R-squared: 0.332
#   Residual Standard Error: 11.658
#
#   F-statistic: 7.470 on 5 and 60 DF, p-value: <.001
#   Sum of Squares:
#     Regression: 5076.026
#     Residual:   8154.459
#     Total:      13230.485
#
#   VIF (Variance Inflation Factors)
#   Variable        GVIF  Df  GVIF^(1/(2*Df))
#   -------------  -----  --  ---------------
#   Stress         1.074   1       1.036
#   SocialSupport  1.124   1       1.060
#   Condition      1.079   3       1.013
#
#   A row with Df above 1 is a set of dummy variables, with one generalized VIF
#   (GVIF) for the set.
#   GVIF^(1/(2*Df)) squared is on the scale of an ordinary VIF.
#
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
#                                             b      SE    Wald  df    p   Gelman β  Exp(b)
#   -------------------------------------  ------  -----  -----  --  ----  --------  ------
#   (Intercept)                            -2.623  1.417  3.425   1  .064             0.073
#   Stress                                  0.099  0.075  1.761   1  .185    0.589    1.104
#   Condition (ref = 1: Control)
#     2: CBT                                1.439  2.082  0.478   1  .489    0.320    4.217
#     3: Mindfulness                        0.355  2.297  0.024   1  .877   -0.352    1.426
#     4: Support group                      2.200  1.762  1.559   1  .212    0.489    9.028
#   Stress * Condition (ref = 1: Control)
#     2: CBT                               -0.074  0.120  0.377   1  .539   -1.091    0.929
#     3: Mindfulness                       -0.047  0.122  0.145   1  .703   -0.689    0.955
#     4: Support group                     -0.113  0.099  1.286   1  .257   -1.669    0.893
#
#   In a model with an interaction, Gelman β comes from centered predictors: a
#   Gelman β can have the opposite sign from its b, and other software may
#   report different Gelman β values.
#   See ?jlogistic.
#
#   Outcome: SoughtHelp
#
#   Omnibus Test of Model Coefficients
#   Chi-Square  df    p
#   ----------  --  ----
#      3.690     7  .815
#
#   Model Summary
#   -2 Log Likelihood  Cox & Snell R²  Nagelkerke R²    AIC
#   -----------------  --------------  -------------  ------
#         75.541            0.054          0.078      91.541
#
#   VIF (Variance Inflation Factors)
#   Variable              GVIF   Df  GVIF^(1/(2*Df))
#   ------------------  -------  --  ---------------
#   Stress                2.627   1       1.621
#   Condition           180.524   3       2.377
#   Stress * Condition  233.737   3       2.482
#
#   A row with Df above 1 is a set of dummy variables, with one generalized VIF
#   (GVIF) for the set.
#   GVIF^(1/(2*Df)) squared is on the scale of an ordinary VIF.
#
#   Dependent Variable Encoding
#     Modeled (1):   Yes
#     Reference (0): No

# Render 2 -- a set of dummy variables that another predictor nearly
# reproduces: the line of interpretation.
set.seed(29)
d29 <- d
d29$Z <- (d29$Condition == 2) + 2 * (d29$Condition == 3) +
  stats::rnorm(nrow(d29), 0, 0.02)
jlm(Flourishing ~ Z + Condition, data = d29, categorical = "Condition",
    diagnostics = "vif")
rm(d29)
# Expected:
#   Linear Regression
#
#   Analysis N: 70
#
#   Coefficients
#                                     b        SE       t       β       p
#   ----------------------------  --------  -------  ------  -------  -----
#   (Intercept)                     40.975    3.009  13.616           <.001
#   Z                             -165.107   78.529  -2.102  -10.064   .039
#   Condition (ref = 1: Control)
#     2: CBT                       180.019   79.075   2.277            .026
#     3: Mindfulness               344.917  157.810   2.186            .032
#     4: Support group               6.428    4.100   1.568            .122
#
#   Outcome: Flourishing
#
#   R-squared: 0.227    Adjusted R-squared: 0.179
#   Residual Standard Error: 12.560
#
#   F-statistic: 4.771 on 4 and 65 DF, p-value: .002
#   Sum of Squares:
#     Regression: 3010.774
#     Residual:   10254.026
#     Total:      13264.800
#
#   VIF (Variance Inflation Factors)
#   Variable     GVIF    Df  GVIF^(1/(2*Df))
#   ---------  --------  --  ---------------
#   Z          1926.662   1       43.894
#   Condition  1926.662   3        3.528
#
#   A row with Df above 1 is a set of dummy variables, with one generalized VIF
#   (GVIF) for the set.
#   GVIF^(1/(2*Df)) squared is on the scale of an ordinary VIF.
#
#   Z (VIF = 1926.7): standard error inflated by a factor of 43.9.
#     If you need to interpret this coefficient specifically, consider whether
#     the collinearity is a concern for your research question.
#   Condition (GVIF = 1926.7 on 3 df): standard errors inflated by a factor of
#   about 3.5.
#     If you need to interpret these coefficients specifically, consider whether
#     the collinearity is a concern for your research question.

# Render 3 -- model.layout = "fit" in each call; then in joutput(), and
# the level call that puts the default back.
jlm(Flourishing ~ Stress + SocialSupport, data = d, model.layout = "fit")
jlogistic(SoughtHelp ~ Stress + SocialSupport, data = d, model.layout = "fit")
joutput(model.layout = "fit")
jlm(Flourishing ~ Stress, data = d)
joutput("standard")
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
#   R-squared: 0.212    Adjusted R-squared: 0.187
#   Residual Standard Error: 12.863
#
#   F-statistic: 8.480 on 2 and 63 DF, p-value: <.001
#   Sum of Squares:
#     Regression: 2806.260
#     Residual:   10424.225
#     Total:      13230.485
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
#   Coefficients
#                     b      SE    Wald  df    p   Gelman β  Exp(b)
#   -------------  ------  -----  -----  --  ----  --------  ------
#   (Intercept)    -2.256  1.206  3.500   1  .061             0.105
#   Stress          0.045  0.039  1.332   1  .248    0.663    1.046
#   SocialSupport   0.046  0.060  0.585   1  .444    0.444    1.047
#
#   Outcome: SoughtHelp
#
#   Dependent Variable Encoding
#     Modeled (1):   Yes
#     Reference (0): No
#
#   Output Settings
#     model.layout: FIT (override)
#   Run joutput() to see all settings.
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
#   R-squared: 0.093    Adjusted R-squared: 0.079
#   Residual Standard Error: 13.695
#
#   F-statistic: 6.540 on 1 and 64 DF, p-value: .013
#   Sum of Squares:
#     Regression: 1226.581
#     Residual:   12003.903
#     Total:      13230.485
#
#   Coefficients
#                   b      SE      t       β      p
#   -----------  ------  -----  ------  ------  -----
#   (Intercept)  58.424  3.870  15.096          <.001
#   Stress       -0.587  0.229  -2.557  -0.304   .013
#
#   Outcome: Flourishing
#
#   Output Settings
#   Level: standard
#     effect.size: ON
#     regression.ci: OFF
#     means.ci: ON
#     posthoc: OFF
#     diagnostics: OFF
#     case.processing: AUTO
#     case.processing.detail: TOTALS
#     case.processing.filter: AUTO
#     variable.id: NAMES
#     value.id: BOTH
#     ref.categories: ON
#     model.layout: COEFFICIENTS
#     missing.notice: ON
#     digits: 3

# Render 4 -- the Q-Q plot from a jaov() and a jt() result, and both of
# jaov()'s plots; then jdummy() and categorical = on a variable that is
# not categorical.
invisible(utils::capture.output(r29a <- jaov(Stress ~ Condition, data = d)))
invisible(utils::capture.output(r29b <- jt(Flourishing ~ SoughtHelp, data = d)))
p29a <- jplot(r29a, which = "qq")
p29b <- jplot(r29b, which = "qq")
p29c <- jplot(r29a, which = "all")
try(jdummy(d, SleepHours))
try(jlm(Flourishing ~ SleepHours, data = d, categorical = "SleepHours"))
rm(r29a, r29b, p29a, p29b, p29c)
# Expected:
#   (Diagnostic plot produced: Normal Q-Q)
#
#   (Diagnostic plot produced: Normal Q-Q)
#
#   2 plots produced
#   (use the arrow buttons in RStudio's Plots pane to navigate):
#     1. Box Plot
#     2. Normal Q-Q
#
#   Error : jdummy(): SleepHours has values that are not whole numbers (4.8,
#   5.1, 5.2, ...), so it cannot be dummy-coded.
#   Dummy coding makes one indicator for each category. If these values are
#   categories, recode them to whole-number codes first with jrecode().
#   Linear Regression
#   Error : jlm(): SleepHours has values that are not whole numbers (4.8, 5.1,
#   5.2, ...), so it cannot be dummy-coded.
#   Dummy coding makes one indicator for each category. If these values are
#   categories, recode them to whole-number codes first with jrecode().

# Things to look at:
#   - RENDER 1, jlm(): the VIF table has three columns now -- GVIF, Df and
#     GVIF^(1/(2*Df)) -- and Condition is ONE row on 3 Df. Stress's and
#     SocialSupport's GVIF on 1 Df is their ordinary VIF, the last column
#     its square root. Two lines under the table say what a row with Df
#     above 1 is.
#   - jlogistic(): the interaction's three columns are one row, "Stress *
#     Condition" on 3 Df, under Condition's. GVIFs of 180.5 and 233.7 are
#     the size an interaction's columns usually have beside their own
#     variable's: on the VIF scale (the last column squared) 5.6 and 6.2, so
#     no line of interpretation. The table sits where jlogistic()'s VIF table
#     always has, above the Dependent Variable Encoding block.
#   - RENDER 2: Z nearly reproduces Condition's dummy variables. Two lines
#     of interpretation under the table, Z's in the ordinary form ("VIF =
#     ...") and Condition's in the set's ("GVIF = ... on 3 df"). In a model
#     of two terms their GVIFs are one number.
#   - RENDER 3: in each model the fit block comes first, then one blank
#     line and the Coefficients table with the Outcome line under it, as
#     always; jlogistic()'s Dependent Variable Encoding stays last. The
#     joutput() echo reads "model.layout: FIT (override)", the jlm() under
#     it takes the order from the setting, and the level call's panel reads
#     "model.layout: COEFFICIENTS" again: a level call puts it back.
#   - RENDER 4: one Q-Q plot from each of the first two calls, then the box
#     plot and the Q-Q plot from the third. jplot() says what it drew, in
#     its words for a model: "(Diagnostic plot produced: Normal Q-Q)" for
#     each of the first two, then "2 plots produced", "(use the arrow
#     buttons ...)" under it and the two names, the box plot being behind
#     the Q-Q plot in the pane; one blank line after each. The box plot
#     alone, jplot()'s default here, still prints nothing (format_walk.R
#     Section 32).
#   - The jdummy() stop names SleepHours, its first values that are not
#     whole, and what to do; jlm(categorical = ) gives the same stop under
#     its title. Nothing is registered.


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
