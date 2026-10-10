# =============================================================================
# models_check.R -- dummy expansion in position space; jlogistic pre-fit guards;
#                   absent categories in the analysis sample; the Gelman
#                   column and the interaction rows; computed terms, hand-made
#                   products, std = "product" and bare powers; names inside a
#                   computed term, read as lm() reads them; a workspace
#                   vector a computed term would recycle; the group-count
#                   stops, jcrosstab's title, jplot's box line; the
#                   registration verbs at the front door; a comparison
#                   inside a formula; no more cases than coefficients; one
#                   "seems categorical" warning; the plot lines and the
#                   fit line of a computed term
# =============================================================================
# TYPE:     assertion battery (PASS/FAIL; written for Claude's checking)
# LOCKS:    the S305 AUDIT-037 fix and its riders, the S306 absent-
#           category fix, and (section G, S320) the Gelman column as a
#           refit on rescaled inputs with every 0/1 column centered, the
#           interaction rows' display and regular-beta blank (AUDIT-035),
#           the two-line legend under an interaction model's table, and
#           the legend tiers listing every predictor (AUDIT-036); and
#           (section H, S321) computed powers and products recomputed from
#           the rescaled inputs in both refits, the notes naming only the
#           kinds of term present, a hand-made product or square named,
#           std = "product", and the warning for a single term raised to a
#           power outside I(); and (section I, S323) a name inside a
#           computed term read as lm() reads it -- a constant, a set of codes
#           or a list element from the formula's environment, a named power
#           read as its number -- with a data frame named inside a term
#           refused, a power terms() cannot read refused in house voice,
#           jcrosstab's computed-term refusal ahead of its other checks, the
#           VIF table's " * ", and jplot's formula path refusing a computed
#           term; and (section J, S324) a workspace vector with more than one
#           value but not one per row of the data after filtering, used value
#           by value inside a computed term, refused at the front door in all
#           four functions -- the requirement, or, for a vector with one value
#           per row of the frame as given that a filter has cut down, the
#           add-it-to-the-frame fix, which runs -- while a single value, a set
#           with %in%, a lookup and a summary are accepted, a call on the
#           vector is never run by the check, and a data variable is read
#           from the data.
#           (1) A factor or character predictor's dummy
#           columns are built by matching each case against the
#           registration's CATEGORY VALUES (the `values` field
#           .jst_make_dummy_names() now returns and jdummy() stores), never
#           against the column coerced to numeric -- so a text predictor
#           fits (it crashed: every case listwise-deleted), a factor with an
#           unused MIDDLE level fits (its later dummies were all zero), and
#           digit-string text fits. Numeric, haven-labelled and logical
#           predictors keep the value comparison (section C locks the
#           formula). (2) A registration saved by an earlier version has no
#           `values`; .jst_dummy_category_values() reconstructs them by
#           matching canonical names against the stored labels, so a
#           category absent from the frame in hand cannot shift the later
#           positions. (3) The grouped coefficient rows are labeled from the
#           registration's values, not from the post-filter column, so a
#           filter that removes a category no longer relabels the rows below
#           it. (4) jlogistic() makes jlm()'s three pre-fit checks: the
#           empty-sample stop (R's "Argument mu must be a nonempty numeric
#           vector" leaked before), the zero-variance stop, and the
#           collinearity warning, with the odds-ratio CI aligned to the
#           fitted rows so an aliased predictor no longer crashes the return
#           object. (5) S306, section F: a registered category with no case
#           in the ANALYSIS SAMPLE -- a filter removed it, or listwise
#           deletion on another variable emptied it. An absent reference is
#           replaced for that call by the first present category (its own
#           dummy dropped from the formula; the rest are already the
#           treatment coding against it), so the header, the rows, the
#           coefficients and the returned ref_cats agree, where before the
#           fit silently re-referenced to the LAST category through the
#           aliasing drop under a header naming the registered reference.
#           An absent non-reference category's dummy is dropped, where
#           before the zero-variance guard stopped on its internal column
#           name. Both are reported in one consequential note per variable
#           (approved wording S306; Rule F between variables); fewer than
#           two present categories is a guided stop naming the VARIABLE.
#           The auto path takes the same route with its own note form; the
#           stored registration is untouched; interactions keep their shape.
#           The first regression file over jlm()/jlogistic(); the seed of
#           the models battery the S212 dev-tests item calls for.
# ORIGIN:   S305 (v0.9.176); AUDIT-037 filed S170, root cause S213,
#           re-verified live S300. Section F, D09/D10/D12 re-pinned, the
#           xa and h fixture columns, with_state(), and the error-safe
#           shown(): S306 (v0.9.177), the S305 header item.
# S347 EDIT (v0.9.220, 2026-10-10): Fix Slate 8, second half. SECTION Q
#           ADDED, Q01-Q39 with Q33b (40 checks). Q01-Q07 a model with no
#           more cases than coefficients: one stop under the Case
#           Processing block in jlm() and jlogistic(), both counts named,
#           how the other cases went (a filter, missing data, both; none
#           with "There are only"), the dummy columns counted, no glm()
#           warning ahead of it; one case more fits as lm() fits it.
#           Q08-Q11 one "seems categorical" warning for several
#           predictors, pinned whole, its lines run. Q12-Q15 a predictor
#           dummy-coded in the call with one category: the registered
#           predictor's sentence under the block, the category shown
#           (with its label), the filters' line; a missing value not a
#           category. Q16-Q20 the group-count stops and subset = in jt(),
#           jaov() and jcrosstab(); no filter line when a missing outcome
#           took the group or a setting excluded nothing. Q21-Q28 the
#           printed lines: the dummy-names note wrapped, the 30-character
#           warning retired, the dichotomy notes' last line (Rule X),
#           jlogistic()'s text-outcome refusal (the blank coded 0), an
#           expression named first in jlogistic()'s and the formula
#           guard's lines and "Saved the data to" (an index into a frame
#           kept as typed), each line run; "(a dichotomy)". Q29-Q33b the
#           plot lines: jlm()'s list in jlogistic()'s form, the effect-plot
#           count, the smoother's warnings caught and one note pinned
#           whole, R's default warn = 0 leaving the package's own warning,
#           no note where the smoother raises nothing, another warning
#           passing. Q34-Q39 a term computed from the focal variable on
#           the fit line, the effect plots and jlogistic()'s probability
#           plot (each against a hand computation from the coefficients),
#           the equation's names, a term held as before (scale()), the box
#           plots' groups labeled as the descriptives label them, an
#           aliased term left out of the equation. Fixture dq, inline, 48
#           cases; d9, nine. RE-PINNED: K07 (jcrosstab's filter line), L33
#           L34 (the blank coded 0), P13 (the in-call stop), P19 (the
#           filter line for subset =), and the O section's plot-list
#           reader .o_plots() (numbered "1." since S347). 405 checks.
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): 405/405
#           plain and under the RStudio-handler stand-in, each also with a
#           Windows-length temp path, and entered dirty, the session
#           handed back. On the 0.9.219 master 46 red: K07 L33 L34 O03 O05
#           O10 P13 P19, Q01-Q32 and Q34-Q39 (Q07 only because the helper
#           it calls is new; Q33 and Q33b are controls and hold there).
#           MUTATION MAP (S347; 44 one-change mutants of the 0.9.220
#           master, each run with all eight batteries, every one red; the
#           checks each reds): the too-few stop never Q01-Q06, only below
#           the coefficient count Q01 Q02 Q04-Q06, its cause reversed
#           Q01-Q04, "There are only" never Q04, one other case plural Q04;
#           jlm counting the typed formula's variables Q06; jlogistic with
#           no stop Q02. The warning naming its first predictor only, in
#           jlm Q08 Q09 Q11, in jlogistic Q10; "seem" never plural Q08 Q10
#           Q11; one variable in the jdummy() line Q08-Q11. The in-call
#           stop ahead of the block (categorical =) Q14; without the
#           filters' line P13 Q12 Q14; absent from jlogistic Q12; a
#           missing value counted as a category Q15. jt's filter line gone
#           K01 P19 Q16 Q18; printed when a missing outcome took the group
#           P18 Q19; jcrosstab's gone K07 Q17; jaov's gone K05 Q17. The
#           paired note under the session setting Y01 (format_check.R),
#           never X16 Y02. The dummy-names note by cat() in the models Q21,
#           in jdummy Q22; a long-name warning raised again Q23; jrecode()
#           named again Q24; the blank coded 1 L33 L34 Q25 Q26; an
#           expression pasted into jlogistic's line Q26, into jnumeric()
#           Q27; jsave as typed Q27, an index called "the data" Q27; "(a
#           other dichotomy)" Q28. The old plot-list line O03 O05 O10 Q29
#           Q31; effect plots always plural Q30; the smoother's warnings
#           not muffled Q31 Q32; its note never singular Q32; every
#           warning muffled while a smoothed plot draws Q33b (added after
#           the round, which this mutant survived: no fixture raised
#           another warning in a smoothed plot). Backticks kept Q35; ":"
#           kept Q35; no term computed on the grid Q34 Q36 Q37; computed
#           whatever its functions Q36; a computed term left in the note
#           Q34 Q36; a held variable not read Q36; the box plot from the
#           codes Q38; an aliased term's NA kept Q39.
#           LAST VERIFIED: v0.9.220, 2026-10-10 (S347) -- 405/405 on
#           the WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run,
#           2123 checks)") through receive_all(), after a clean R CMD
#           check, matching the sandbox; GitHub 991eb6b.
# S346 EDIT (v0.9.219, 2026-10-08): Fix Slate 8, first cut, and Jeff's
#           diagnostics ruling of that day. SECTIONS N AND O ADDED, N01-N27
#           and O01-O12 (39 checks). N01-N10 a sample with no case left:
#           one stop in jt(), jaov(), jcrosstab(), jlm(), jlogistic() and
#           jalpha(), under the Case Processing block and ahead of every
#           group count, saying whether a filter, missing data or both
#           took the cases; jdesc() and jcorr() untouched. N11-N15 a
#           predictor with one value: the predictor the subject, the
#           filter line only when a filter excluded cases. N16-N17 a
#           computed outcome in jlogistic(). N18-N27 the "seems
#           categorical" rerun lines, every printed line run: the frame
#           as the call named it, a formula past 60 characters whole,
#           backticks, a juse() default, an expression and a place as
#           the data, the call's own categorical =; jlogistic()'s; and
#           jplot()'s fit line. O01-O12 diagnostics in jlm() and
#           jlogistic(): the resolver, TRUE as the VIF table and five
#           plots, no level bringing them, names, the stops, the lines
#           under a VIF above 10 not printed at minimal.
#           RE-PINNED: E04 E06 H26 K11 K12 (the empty-sample and
#           one-value stops in their new wording; the warning's new
#           lines). 331 checks.
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): 331/331
#           plain and under the RStudio-handler stand-in, each also with a
#           Windows-length temp path, and entered dirty, the session
#           handed back. On the 0.9.218 master 39 red: E04 E06 H26 K11
#           K12, N01-N09 N11-N16 N18-N27, O01 O02 O04-O08 O10 O11.
#           MUTATION MAP (S346; the mutants of format_check.R's list that
#           red here): every call showing its diagnostics G10 G19 H08 H11
#           H16 M30 N25 O01 O02 O04 O10; names not held to the function's
#           set O01 O02 O05; the stored setting not read O02 O10; an
#           unknown name passing O06 O07 O08; no c() stop O07; a wrong
#           type passing O08; full = TRUE bringing them in jlm or in
#           jlogistic O04; notes at minimal O11, in jlm alone or in
#           jlogistic alone O11; jlm's set without its plots O01-O03
#           O05-O08 O10; no empty-sample stop in jt or jaov N01 N02 N05
#           N06, in jcrosstab N01 N02 N05, in jlm E04 K12 N01-N04, in
#           jlogistic E04 K12 N01 N02 N08, in jalpha N01 N02 N07; the
#           cause reversed E04 K12 N01 N02 N04 N06 N08; one case not
#           singular N04; both causes never named N03; the frame never
#           named in the rerun line N18-N21 N23-N26, always named N22; no
#           backticks N20 N21; an expression pasted into jdummy(), no
#           mydata line, or the per-call line naming mydata N23; the
#           call's own categorical dropped N25; the filter line whenever
#           a filter is set N15, never N13 N14; singular always K11 N12;
#           a computed outcome not refused N16; jplot's fit line without
#           the frame N27.
#           THE SESSION GUARD hands back the stored display settings
#           (.jst_output_toggles) with the output level: the diagnostics
#           setting outlives a level call, so a run entered with
#           joutput(diagnostics = TRUE) left the session without it
#           (found entering dirty; all seven batteries with the guard).
#           SECOND DELIVERY, THE NEXT DAY: SECTION P ADDED, P01-P31 with
#           P13b, P13c and P25b (34 checks), on Jeff's walk of
#           models_walk.R Section 18 ("the error message doesn't address
#           the real problem"): a
#           filter whose condition names a variable the analysis needs to
#           vary is named as the cause of its one value, with the way out
#           (and, for a predictor, the second way out: remove it from the
#           formula) -- the one-value predictor in jlm() and jlogistic(),
#           the dummy-coded predictor registered or built in the call, the
#           grouping variable of jt(), jaov() and jcrosstab(), and the
#           outcome of jlm() (R's "0 (non-NA) cases") and jlogistic()
#           ("Use jrecode()" of a 0/1 variable); the hedged and plain forms
#           where no filter names it, or listwise deletion took the rest;
#           one case left, in all six listwise functions. RE-PINNED: F16
#           F17 F30 (subset = gf == "b" names gf: the filter form, the
#           S306 sentence's requirement kept); K01 K05 K07 K09 (.k_on()
#           now filters on gn, so they keep the context form of a stored
#           filter that does not name g); N09 (one case now stops).
#           P13c and P25b were added after the mutant round, which two
#           guards survived. 365 checks.
#           Sandbox: 365/365 plain and under the RStudio-handler
#           stand-in, each also with a Windows-length temp path, and
#           entered dirty. On the first delivery's build 30 red: F16 F17
#           F30, P01 P03 P05-P07 P10-P13 P13b P13c P14-P17 P20-P25 P25b
#           P26-P28 P30 P31.
#           MUTATION MAP (S346, second round; 25 one-change mutants
#           through all eight batteries, 25 red): subset = never counted
#           as naming F16 F17 F30 P01 P05-P07 P10 P11 P13b P14 P16 P17 P20
#           P24 P31; a stored filter never counted P03 P05 P15; a computed
#           term read as one name P07 P30; listwise deletion blamed on the
#           filter, for a predictor P09, a registered predictor P13c (added
#           after the round, which this mutant survived), the outcome P25b
#           (the same); the predictor's filter form never P01 P03 P05-P07
#           P10, and its second way out not naming it, the same; a stored
#           filter told to be removed like subset = P03 P15; two filters
#           still "keeps" P05; the registered form never F16 F17 F30, the
#           in-call form never P11 P13b; jt's, jaov's and jcrosstab's
#           filter form never P14 P15, P16, P17; a missing outcome blamed
#           on the filter P18; jlogistic reading a one-value outcome as
#           before P20-P22 P26, no check after listwise deletion P23; jlm
#           with no outcome stop P24 P25; one case not stopped P26-P28,
#           one other case in the plural P28, a one-row frame told a case
#           is left P28; the registered form's hedged line dropped P12; a
#           labelled value shown without its label P22; a filter set aside
#           counted F16 F17 F30 P31.
#           LAST VERIFIED: v0.9.219, 2026-10-09 (S346) -- 365/365 on
#           the WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run,
#           2079 checks)") through receive_all(), after a clean R CMD
#           check, matching the sandbox; GitHub 14528c6.
# S342 EDIT (v0.9.216, 2026-10-06): Fix Slate 4. SECTION M ADDED, M01-M37
#           (37 checks); nothing else changed. M01-M04 jdummy()'s ref is
#           one value (the S329 item): two codes, two words, an empty one,
#           TRUE, NULL, NA and a missing word each get the stop, pinned
#           whole, before the title; a code, a label and the three words
#           still register. M05-M09 every variable is built before any is
#           registered (the S341 item): jdummy(dm, Grp, Sex, ref = 3)
#           registers nothing and prints nothing; an earlier registration
#           is untouched. M10-M18 what jnumeric(), jcount() and jlikert()
#           take (the S310 item; Jeff's S342 lean 2): a factor, text,
#           numbers as text, a labelled string, a date, a logical and an
#           unsupported type each refused, the wording pinned whole; a
#           call naming one such variable registers none; the refusal
#           before the default-frame line; jdummy() unchanged. M19-M22 a
#           registration of those kinds ALREADY stored on such a variable
#           is passed over by .jst_jstats_class() and .jst_is_count(),
#           jscreen() raises nothing, and remove = TRUE still takes it
#           off. M23-M24 AUDIT-014: with as.numeric() made to stop on a
#           labelled variable (a method defined for the two checks and
#           removed), the classifier's five sites still read the stored
#           numbers. M25-M37 a comparison inside a formula (Jeff's S342
#           ruling, amending AUDIT-023): .jst_comparison_exempt() by its
#           units; fits with NO registration held to lm()'s coefficients
#           and N -- a numeric-coded categorical, a text variable, a
#           factor, a logical, a labelled string, a declared missing
#           value, and as the grouping term of jt() and jaov(); arithmetic
#           still refused, with the jnumeric() line where it will take
#           (and it runs), jencode() for a factor or text, the fact alone
#           for a logical; the other computed-term refusals where they
#           were. Fixture dm, inline, 48 cases. TWO HUNDRED AND NINETY-TWO
#           checks.
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): 292/292
#           plain and under the RStudio-handler stand-in, each also with a
#           Windows-length temp path, and entered dirty (joutput("full"),
#           width 90, a juse() default, a stata convention, jstats.color =
#           TRUE, workspace objects named like fixture variables): the
#           session handed back, nothing left but .results.
#           On the 0.9.215 master 29 red: every M check but the controls
#           M04 M09 M18 M20 M22 M23 M34 M37.
#           MUTATION MAP (S342, sandbox; 77 one-change mutants of the
#           0.9.216 master, each run with all eight batteries; the ones
#           that red here). The ref check removed, or its length test, M01
#           M02 M03; its NA test M02; a logical accepted M02 M03. The build
#           list holding the first variable only M05-M09 M18; the title
#           before the build M06. The type gate removed M10-M17; a logical
#           taking a registration M12 M14 M15 M17 M19 M21 M27 M36; a text
#           variable M11 M14 M15 M17 M19 M21 M27 M35; the gate on the
#           first variable only, or each variable stored before the next
#           is checked, M15 M17; the jencode() line off a factor M10 M14;
#           jnumeric() named whatever the verb M14 M15; "a numeric
#           registration" whatever the kind M14; removal gated too M22.
#           The classifier reading any stored registration M19 M21;
#           .jst_is_count() doing so M19. Each of the five bare
#           as.numeric() sites M24. No comparison exempt M25 M27-M33; a
#           variable inside a call still exempt M25 M33; an order
#           comparison exempting any type M27 M35 M36; a number in a
#           logical position M25; any call a logical expression M26 M33
#           M36; %in% left out M25 M28 M29; a bare logical not exempt M25
#           M30; a labelled string coerced to numbers M30 M33 M35 M36; the
#           guard ignoring the exemption M28-M33; "!" left out M25 M29;
#           "|" left out M25 M28. jnumeric() offered whatever the type M35
#           M36; a logical sent to jencode() M36; a factor given the fact
#           alone M35. Three mutants red nothing and are the same program:
#           building only the first variable inside the loop while the
#           list ahead of it is complete; the legend printed whenever a
#           variable is starred, while the star itself is confined to a
#           Categorical row; and jscreen()'s guard for a frame of nothing
#           but list columns, which complete.cases() serves on R 4.3.3.
#           Two that first red nothing showed gaps, closed: the juse()
#           default not consulted (filter_check.R S11) and a variable
#           compared in one place and transformed in another (M25, M33).
# LAST VERIFIED: v0.9.216, R 4.6.1, 2026-10-06 (S342) -- 292/292 on the
#           WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run, 1844
#           checks)") after a clean R CMD check, matching the sandbox
#           plain, under the RStudio-handler stand-in and each again with
#           a Windows-length temp path; GitHub 8737548.
# S340 EDIT (v0.9.214, 2026-10-05): Fix Slate 3, text variables. SECTION L
#           ADDED, L01-L36 with L20b (37 checks), and B02, C06 and D08
#           RE-PINNED: a blank text cell is a CATEGORY of a predictor
#           (Jeff's S340 ruling, reversing the S305 build's "a blank text
#           cell is missing on every dummy" that those three asserted).
#           L01-L09 a string variable with value labels in the group
#           functions and the models (it stopped jt(), jlm() and
#           jlogistic()); L10-L13 its declared missing values, out of the
#           analysis; L14-L21 and L20b blank cells as one group, <blank>,
#           in jt(), jaov(), jcrosstab() (both margins) and jdesc(by = ),
#           for text and for a factor's blank levels; L22-L31 blank cells
#           in a model -- the row, last, under a named reference; lm()'s
#           and glm()'s coefficients; the word-or-blank predictor, whose
#           reference is the blank; a registration that predates the
#           category; the helpers; L32 jplot(); L33-L36 jlogistic()'s two
#           refusals of a text OUTCOME -- the blank category named, and
#           the fix line a jencode() call that runs (it was a jrecode()
#           call, which stops on text). Fixture dl, inline. TWO HUNDRED
#           AND FIFTY-FIVE checks.
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): 255/255 plain
#           and under the RStudio-handler stand-in, each also with a
#           Windows-length temp path, and entered dirty (joutput("full"),
#           width 110, a juse() default, a stata convention, jstats.color =
#           TRUE, workspace objects named like fixture variables): the
#           width, the default frame, the level, the convention and the
#           color option handed back, nothing left but .results.
#           On the 0.9.213 master 39 red: B02 C06 D08 and all of L but L21,
#           which holds there and is on a mutant's list below.
#           MUTATION MAP (the S340 mutants that red here; the full list of
#           74 is described in cps_check.R): missing_info text arm off, or
#           its text flag FALSE, L03-L06 L10-L12; masking pass text arm
#           off L10-L12; group codes always numeric L01-L07 L10 L11; dummy
#           names: labelled-string arm off L08 L09 L12 L13; a string's
#           labels not used L08 L09; whitespace cells not blank L14-L20
#           L22 L23 L25 L28-L32; the blank level last L14 L16-L19 L21 L30;
#           jt() blank group unlabeled L16 L20; jaov(), jdesc(by = ) and
#           jcrosstab()'s row and column, a factor's blank levels
#           unlabeled, each L20b; dummy names with the blank left out, or
#           first, B02 C06 D08 L22 L23 L25-L28; the word-or-blank
#           reference rule off L25; an old registration's blank cells no
#           longer missing L29; blank cells always missing in the
#           expansion C06 D08 L22-L25 L27 L28; a factor's blanks counted
#           zero L31; jplot() unlabeled, either path, L32; the outcome's
#           category list unlabeled L36; the pair unnamed L33; the fix
#           line jrecode() again, or its spellings untrimmed, L33-L35; one
#           spelling per side of the map L35.
#           LAST VERIFIED: v0.9.214, R 4.6.1, 2026-10-05 (S340) -- 255/255 on
#           the WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run,
#           1734 checks)") after receive_package() and a clean R CMD check,
#           matching the sandbox; GitHub 2d04b68.
# S338 EDIT (v0.9.212, 2026-10-05): SECTION K ADDED, K01-K28 (28 checks), and
#           E06 I08 I09 I10 RE-PINNED to the S338 wording ("This predictor
#           has"; "x9 was not found in the d data frame."). Fix Slate 1.
#           K01-K10 the group-count stops of jt(), jaov() and jcrosstab(): the
#           count in number, a stored setting named as a setting and named
#           whenever it is active for the frame (it was named only under a
#           juse() default), more than 2 categories kept apart from fewer.
#           K11-K12 the two model stops. K13-K17 jcrosstab() prints its title
#           where jt() does (AUDIT-026). K18-K24 jplot()'s box refusal: the
#           line built from what the call gave, RUN, and drawing a boxplot.
#           K25-K28 jplot() and a data frame's column: a tibble's misspelled
#           column stops without the tibble's own warning ahead of it (K25
#           proves the tibble warns). Helpers .k_has, .k_pre, .k_warns,
#           .k_fix, .k_geom, made and removed inside the section. TWO HUNDRED
#           AND EIGHTEEN checks.
#           Sandbox (R 4.3.3, pkgload::load_all): 218/218 plain and under the
#           RStudio-handler stand-in, each also with a Windows-length temp
#           path, and entered dirty. On the 0.9.211 master 27 red: E06 I08 I09
#           I10 and K01-K14 K18-K24 K26 K27, with K15 K16 K17 K25 K28 holding
#           there. Controls, on no mutant's list by design: K17 K25 K28.
#           MUTATION MAP (the S338 mutants that red here; the full map of 54
#           is in filter_check.R): .jst_plural() always plural reds E06 I08
#           I09 I10 K01 K04 K05 K06 K07 K08 K10 K11 K26; .jst_plural() always
#           singular reds K03 K11; not-found: the frame without its article
#           and kind reds I08 I09 I10 K26; not-found: was / were swapped reds
#           I08 I09 I10 K26; not-found: the old second line reds K26; jt: the
#           context only under a juse() default (the old gate) reds K01 K02;
#           context: the old spaced 'jsubset (expr)' reds K01 K05 K07 K09 K10;
#           context: an OFF filter named reds K08; jt: the more-than-2 branch
#           removed reds K03; jt: jaov() suggested for fewer than 2 reds K04
#           K08; jaov: the plain stop's old text reds K06 K10; jcrosstab: the
#           context dropped reds K07; jaov: the context dropped reds K05; jlm:
#           "The following predictor(s) have" restored reds K11; jlogistic:
#           "The following predictor(s) have" restored reds E06 K11; jlm:
#           "which stage(s)" restored reds K12; jlogistic: "which stage(s)"
#           restored reds K12; box line: by = not read as the grouping
#           variable reds K18 K19 K24; box line: type = "box" dropped reds K18
#           K19 K20 K21 K24; box line: by = dropped with two variables reds
#           K21; box line: the MORE distinct variable taken as the group reds
#           K20; box: the no-grouping-variable stop removed reds K22 K23; box
#           line: the numeric variable taken as the group reds K21; jplot
#           generic: forces a frame column again reds K26 K27; jplot.default:
#           reads a frame column again reds K26 K27; jcrosstab: no title
#           before its checks (and none at all) reds K13 K14 K16; jcrosstab:
#           the title printed twice reds K16; jcrosstab: the default-data note
#           dropped reds K14; jcrosstab: a title ahead of the input checks
#           reds K13 K14 K15 K16.
# LAST VERIFIED: v0.9.212, 2026-10-05 (S338) -- 218/218 on the WORKSTATION via
#           run_all.R (ALL BATTERIES GREEN, 8 run, 1571 checks) after
#           receive_package() and a clean R CMD check, GitHub e22427a,
#           matching the sandbox count for count.
# S337 EDIT (v0.9.211, 2026-10-05; no package change): the fixture guard of
#           _template_check.R. A GREEN run now removes everything the battery
#           made (the names in the workspace are recorded at Setup; .results
#           stays, for run_all.R), so a walk that reports on the data frames in
#           the workspace can follow it in one session. A red run keeps its
#           fixtures. No check added or changed: 190/190 in the sandbox, plain,
#           under the RStudio-handler stand-in, and ENTERED DIRTY
#           (joutput("full"), width 90, a juse() default, a stata convention):
#           nothing left but .results, and the width, the default frame, the
#           level and the convention as they were on entry. (Setup still clears
#           stored jsubset(), jcomplete() and registration settings, as it
#           always has.)
# S320 EDIT (v0.9.198): SECTION G ADDED, G01-G22 (22 checks), with its own
#           helpers (.z2/.ctr, the paper's rescalings; .gel_of/.beta_of;
#           lines_of, the printed lines ANSI-stripped; has_note) and two
#           fixture columns added and removed inside the Part (b01, b12).
#           Every numeric oracle is a hand refit on the fixture INSIDE the
#           check -- lm() on .z2()/.ctr() inputs, or on the centered dummy
#           columns -- so no pinned constant. What it locks: the Gelman
#           column equals the paper's refit on a continuous x continuous
#           model and is no longer b * 2 SD or the product column's SD
#           (G01-G02); additive models unchanged (G03); the intercept NA and
#           the regular column untouched (G04); a 0/1 input, a 1/2 input and
#           a four-category registration's dummies all CENTERED, the
#           continuous main effect the sample-average slope, not arm's
#           reference-group slope (G05-G07); the legend at the default and
#           under gelman, its placement (one blank line below the table, its
#           "See ?jlm." pointer on its own line), and its absence without an
#           interaction, under std = "none" and in jlogistic (G08-G12); the
#           " * " row form with the ":" machine key kept (G13); the grouped
#           header and rows, the regular-beta blank, "all" and "gelman"
#           showing them (G14-G16); a 0/1 predictor's row blanked and
#           cleaned "(1)" (G17); jlogistic grouped the same way (G18); the
#           three-way flat row and the two-categorical header (G19); labels
#           mode (G20); the full-tier Predictors list carrying a computed
#           term and an unlabelled variable (G21-G22). ONE HUNDRED AND
#           FIFTEEN checks.
#           MUTATION MAP (S320, sandbox, fifteen mutants of the 0.9.198
#           master, each RUN against this file): binary inputs left at 0/1
#           reds G05 G07; binary inputs 2-SD scaled reds G03 G05 G06 G07;
#           the old b * 2 SD rescale restored reds G01 G02 G05 G06 G07; the
#           legend printed for every standardized model reds G11; printed
#           under std = "none" too (with a fixed header) reds G11; the
#           header fixed to the regular symbol reds G09; the legend moved
#           below the Outcome line reds G10; (rebuild) the blank line above
#           the legend removed reds G10; the pointer run onto the sentence's
#           line reds G10; interaction rows not blanked
#           reds G15 G17; flat rows joined with ":" reds G10 G13 G17 G19;
#           interaction grouping disabled reds G14 G15 G16 G18 G19 G20; the
#           legend's name filter restored reds G21; interaction parts not
#           cleaned reds G17; the grouped header without its reference reds
#           G14 G15 G16 G18 G19 G20; a multi-category variable's dummies
#           left at 0/1 (a single 0/1 still centered) reds G07 alone -- the
#           check that separates the paper's rule from arm's; the Gelman
#           intercept kept reds G04. No check outside G reds under any of
#           them. Against the 0.9.197 master the battery reds seventeen of
#           the twenty-two (G03 G04 G11 G12 G22 hold there by
#           construction: they lock what the build must not change, and
#           their mutants above are what make them checks).
#           S320 REBUILD (0.9.198 kept): the legend reworded to two lines
#           -- the sentence, then "See ?jlm." on its own line (Rule E) --
#           with a blank line above it; .g_note() and G10 re-pinned, the
#           four legend mutants rebuilt on the rebuilt master and the two
#           placement mutants added (seventeen in all, each RUN). Against
#           the first 0.9.198 master the re-pinned battery reds G08 G09 G10
#           alone.
# S321 EDIT (v0.9.199): SECTION H ADDED, H01-H26 plus H14b (27 checks),
#           with its own helpers (.zs, the z-score; .h_beta_note /
#           .h_hand_note / .h_prod_note, the three approved notes flattened;
#           .h_warn, the approved warning; .h_has; .prod_of) and fixture
#           columns x12, x1sq, x12r and x12p added and removed inside the
#           Part. Every numeric oracle a hand refit inside the check. What it
#           locks: (b) I(x1^2)'s regular and Gelman values are refits on
#           rescaled inputs, squared after, and no longer the square's own
#           column rescaled (H01-H03); I(x1 * x2) equals x1 * x2 (H04); a cube
#           and a square alone (H05); log(), a rescaling and a condition keep
#           their own-column rescaling (H06); a constant factor and a log()
#           inside the power recomputed as written (H07); the note naming "a
#           squared term", "a power term", both, or "an interaction", one
#           blank below the table (H08-H10). (a) A hand-made product named,
#           same placement (H11); its values the second convention's (H12);
#           a square, and a product and a square together (H13); not named
#           when rounded, equal only in the 20-row pretest, or a duplicate
#           the fit aliased (H14); the fit dropping x1:x2 for a hand-made
#           twin (H14b); the Gelman header, none under "none", the product
#           note under "product" (H15); computed terms and dummy columns never
#           parts (H16); Product beta's values and header (H17), every row
#           shown (H18), its note's three forms (H19), beta_product on the
#           return and "product" in the choice error (H20). (e) x1^2 fits x1
#           alone and warns, verbatim (H21); cubed, to the power 4, a log()
#           base, parentheses (H22); none for (x1 + x2)^2, I(x1^2) or the
#           outcome's side (H23); one per term (H24); jlogistic (H25); none
#           when the call stops before the fit (H26). 115 -> 142.
#           S321 REBUILD (0.9.199 kept): Jeff's walk reworded the three
#           notes -- the centered-predictors note (S320's interaction note
#           too), the hand-made note ("... entered as its own variable, so beta
#           treats it as an ordinary predictor, not as an interaction") and
#           the std = "product" note ("Product beta treats each interaction as
#           an ordinary predictor, as some other software does"). .g_note()
#           and the three H note helpers re-pinned; the checks that searched
#           for the old words (H11, H14, H15, H16, H19) now search for the
#           new. Against the first 0.9.199 master the re-pinned battery reds
#           G08 G09 H08 H09 H11 H13 H14 H14b H15 H19 alone.
#           MUTATION MAP (S321 rebuild, sandbox, twenty-two mutants of the
#           rebuilt 0.9.199 master, each RUN against this file): the
#           power/product recompute disabled reds H01 H02 H03 H04 H05 H07;
#           every I() term of degree 1 recomputed too reds H06 H10; the note
#           slot fixed to "an interaction" reds H08 H09 H13; the power note
#           suppressed reds H08 H09; detection disabled reds H11 H13 H14 H14b
#           H15 H19; the tolerance loosened to 0.1 reds H14; the pretest
#           taken as proof reds H14; the aliased filter removed reds H14;
#           squares left out of the search reds H13 H19; dummy columns let in
#           reds H16; Product beta taken from the regular column reds H17;
#           the product regime blanking 0/1 rows reds H18; the product branch
#           skipped (the centered note and the hand note under "product")
#           reds H15 H19; bare-power detection disabled reds H21 H22 H24 H25;
#           a power of a sum flagged too reds H23; the power word fixed to
#           "squared" reds H22; the warning emitted before the fit reds H26;
#           the product note's "each" form dropped reds H15 H19; the Gelman
#           recompute z-scoring instead of 2-SD scaling reds H02 H04 H05; the
#           centered note also printed for a hand-made product reds H11 H12
#           H14b; "product" left out of the choice list reds H20; the
#           hand-made note's plural form dropped reds H13. No check outside H
#           reds under any of them. Against the 0.9.198 master the battery
#           reds G08 G09 and 21 of the 27 in H (H06 H10 H12 H16 H23 H26 hold
#           there by construction: they lock what must not change, and their
#           mutants above make them checks).
# S323 EDIT (v0.9.200): SECTION I ADDED, I01-I31 plus I20b (32 checks), with
#           its own helpers (.i_fix, the message's last line when it is an
#           indented call; .i_runs, that line run; .i_has) and constants made
#           and removed inside the Part (cut_i, pw_i, pw3_i, codes_i, par_i,
#           long_i, look_i; e_i inside I20b) plus fixture columns xs1 and xs2
#           (uncentered copies of x1 and x2, so an interaction's VIF passes
#           10). Each constant's name is one nothing else defines -- the
#           first mutant run found I05 (a constant named cc, which
#           cps_check.R leaves in the global environment under run_all.R) and
#           I06 (a list element named cut, base R's cut()) passing on a
#           broken lookup.
#           What it locks: a constant inside a computed term resolves in the
#           formula's environment in jlm, jlogistic, jt and jaov, the row
#           read as typed (I01-I04), in a calling function's frame too (I05);
#           a set of codes and a list element (I06); the Case Processing
#           Summary's variable list without the constant (I07); a mistyped
#           variable or constant, and a bare constant, still not found
#           (I08-I10); a vector of the wrong length (I11); I(x1^pw_i) equal
#           to I(x1^2) in b, beta, Gelman beta and product beta, its note,
#           its row as typed (I12-I14); the data-frame refusal and its fix
#           line, which runs, in all four functions (I15-I17), ahead of the
#           not-found stop, singular for one reference (I18), without a call
#           when the rewrite is incomplete (I19), save-it-first for a summary
#           of the frame or a lookup table (I20), naming the formula's own
#           frame under another default (I20b); the power refusal, both forms
#           (I21-I22); jcrosstab's computed-term refusal reached by a
#           constant and ahead of the two-sides check, and its data-frame
#           refusal (I23-I25); the VIF table and note (I26-I27); jplot's
#           refusals and a control (I28-I31). 142 -> 174.
#           MUTATION MAP (S323, sandbox, seventeen mutants of the 0.9.200
#           master that reach this file, each RUN with all seven batteries):
#           every non-data name inside a term kept as a variable (today's
#           rule) reds I01-I08 I11-I14; the lookup in the helper's own
#           caller instead of the formula's environment reds I05; the name
#           after $ read as a variable reds I06; the frame check skipped in
#           the formula helper reds I15-I20 I20b; the power lookup removed
#           from .jst_poly_term reds I12 I13; the CPS given all.vars() reds
#           I07; the power refusal removed reds I21 I22; jcrosstab's old
#           order reds I23 I24; jcrosstab's frame check removed reds I25;
#           the VIF note left with ":" reds I26 I27; the VIF table left with
#           ":" reds I26; jplot's computed-term refusal removed reds I28 I29;
#           jplot's frame check removed reds I30; the plural always reds I18
#           (and filter_check L01 L04 L05); the summary route removed reds
#           I20 (and filter_check L08); the rewrite called complete with a
#           frame reference left reds I19; the fallback to the formula's own
#           frame removed reds I20b. No check outside I reds under any of
#           them. Against the unedited 0.9.199 master the battery reds 29 of
#           the 32 (I09 I10 I31 hold there by construction: two stops that
#           must not change and a plot that must still draw); every fit is
#           wrapped, so nothing halts.
# S324 EDIT (v0.9.201): SECTION J ADDED, J01-J16 (16 checks), and I11
#           FLIPPED, with two helpers (.j_has, a flattened phrase; .j_req, the
#           requirement message built from its parts) and constants made and
#           removed inside the Part, each ending _j (v3_j, v7_j, v120_j, s_j,
#           set_j, w_j, p2_j, lv_j, l_j, long_j; r_j inside J15); J16 binds
#           and removes a global nm, the name of a fixture COLUMN, on purpose.
#           The S323 item: a name inside a computed term resolves in the
#           formula's environment, and nothing checked its length, so
#           I(x1 * v3_j) fitted on R's recycled values -- with no warning at
#           all, since 3 divides 120. What it locks: the requirement message
#           verbatim (J01); a length R warns about stopped before the warning
#           (J02); a comparison, and jt, jaov, jlogistic, each naming itself
#           (J03); the outcome's side (J04); a single value, a set with %in%, a
#           lookup by a variable and a summary of a vector accepted, each as
#           lm() fits it (J05); one value per row accepted (J06); under
#           subset =, a vector with one value per row of the frame gets the
#           add-it-to-the-frame form, its fix on its own line (J07), and that
#           line RUN lets the call fit as lm() fits it (J08); a stored
#           jsubset() and jcomplete() the same, 80 and 90 left (J09); any other
#           length under a filter the requirement, with the count left after
#           filtering (J10); the vector found inside parentheses, under a
#           unary minus, inside log() and as a power (J11); a literal vector,
#           1:5, a list element by $ and [[ ]], a logical vector with & and !,
#           and a list scalar accepted (J12); ifelse(), pmin(), pmax() (J13);
#           a call on a vector not run by the check, the resolver's count stop
#           still reached (J14); no random number drawn (J15); a data variable
#           read from the data whatever the workspace holds (J16). I11 (S323:
#           a longer vector got the resolver's count stop) now stops at the
#           front door, naming the vector; J14 keeps the count stop reached.
#           174 -> 190.
#           MUTATION MAP (S324, sandbox, seventeen mutants of the 0.9.201
#           master, each RUN with all seven batteries; the eight below reach
#           this file): the stop removed reds I11 J01-J04 J07-J13; %in% read
#           as value by value reds I06 J05; the add-it-to-the-frame branch
#           removed reds J07-J09; ifelse/pmin/pmax left out reds J13; every
#           call evaluated reds J11 J14 J15 (J11 because "v3_j + 1" is then
#           named for the vector); the data-variable test removed reds J08
#           J16; the count after filtering taken from the frame as given reds
#           J10; jlm's front door without the frame's row count reds J07-J10.
#           No check outside I06, I11 and J reds on any of them, and none of
#           the nine filter_check.R mutants reds this file. Against the
#           UNEDITED 0.9.200 master the battery reds I11 J01-J04 J07-J13
#           (178/190); J05 J06 J14 J15 J16 hold there by construction (what
#           the check must accept or leave alone), and their mutants above
#           make them checks, J06 excepted: the control.
# LAST VERIFIED: v0.9.201 PENDING, 2026-10-01 (S324) -- 190/190 in the
#           SANDBOX (R 4.3.3, UTF-8 locale, ::/::: shimmed; run_all.R 1092
#           across seven); WORKSTATION run pending Jeff's receive of the
#           0.9.201 master.
# LAST VERIFIED: v0.9.200, R 4.6.1, 2026-10-01 (S323) -- 174/174 on the
#           WORKSTATION via run_all.R (1056 across seven), GitHub e0ba1ea,
#           matching the sandbox (restamped from PENDING at S324).
# LAST VERIFIED: v0.9.199 (rebuilt), R 4.6.1, 2026-10-01 (S321) -- 142/142 on
#           the WORKSTATION via run_all.R (1013 across seven) at the rebuilt
#           master, GitHub 6f30f3c; the first 0.9.199 master 142/142 (1013)
#           the same night, superseded (restamped from PENDING at S323).
# LAST VERIFIED: v0.9.198 (rebuilt), R 4.6.1, 2026-09-30 (S320) -- 115/115
#           on the WORKSTATION via run_all.R (986 across seven) at the rebuilt
#           master and again at the help-text-only rebuild that shipped
#           (GitHub f41a389); the first 0.9.198 master 115/115 (986) the day
#           before, superseded (restamped from PENDING at S323). Prior: the
#           S306 stamp below (93/93 in every run_all.R since, 964 across
#           seven at v0.9.197).
# LAST VERIFIED: v0.9.177, R 4.6.1, 2026-09-20 (S306): 93/93 on the
#           workstation via run_all.R after a clean devtools::check() (690
#           across seven); sandbox R 4.3.3 (::: shimmed) 93/93 the same day.
#           Previous stamp: v0.9.176, R 4.6.1, 2026-09-20 (S305), 62/62.
#           MUTATION MAP against the unedited 0.9.176 master (S306): 31
#           red, 62 green. D09, D10 and D12 red (re-pinned to the
#           re-referenced fit); F01-F06, F08-F20 and F23-F31 red; F07 green
#           (the registration was always unchanged), F21 green (the auto
#           path under a filter was always right) and F22 green (a clean
#           fit was always clean) by design; A-C and E, and the rest of D,
#           green (unchanged paths). The battery halts nowhere on the old
#           master: every fit is wrapped, so a crash or a stop fails its
#           checks inside the verdict (shape 2's stop on the old master is
#           what made shown() error-safe). The S305 map against 0.9.175
#           (49 red, 13 green, A-E only) is superseded by this one.
# RUN:      source()-safe from any working directory. All output is explicit
#           cat(), so echo = TRUE is NOT required. Also runnable via
#           regression/run_all.R, which treats a stop() as FAIL. No dataset:
#           every fixture is built inline, so the jload() call is DELETED.
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

# Message-width pin (mandatory since S253). The wording checks below flatten
# whitespace before matching, so the pin is belt-and-braces here.
.pin_width <- 76L
options(.jst_options_message_width = .pin_width)

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

# grab(): run a call and return every message / warning / error text it
# emits, concatenated -- so wording can be asserted without the call
# halting the battery. Console output is swallowed. Verify any asserted
# wording against SOURCE, not memory, when writing a check.
grab <- function(expr) {
  msgs <- character(0)
  zz <- textConnection(".junk", "w", local = TRUE)
  sink(zz, type = "output")
  on.exit({ sink(type = "output"); close(zz) }, add = TRUE)
  withCallingHandlers(
    tryCatch(expr,
             error = function(e) msgs <<- c(msgs, conditionMessage(e))),
    message = function(m) {
      msgs <<- c(msgs, conditionMessage(m)); invokeRestart("muffleMessage")
    },
    warning = function(w) {
      msgs <<- c(msgs, conditionMessage(w)); invokeRestart("muffleWarning")
    }
  )
  paste(msgs, collapse = "")
}

# flat(): collapse runs of whitespace (including the wrapper's newlines) so
# a phrase can be matched whatever line it broke on.
flat <- function(x) gsub("\\s+", " ", x)

# quiet(): run a call with its console output, messages and warnings
# swallowed, and return its VALUE -- or NULL if it errors, so a fit that
# stops on a broken master fails its checks instead of halting the
# battery outside its verdict. Used for the fitted objects.
quiet <- function(expr) {
  zz <- textConnection(".junk", "w", local = TRUE)
  sink(zz, type = "output")
  on.exit({ sink(type = "output"); close(zz) }, add = TRUE)
  tryCatch(suppressMessages(suppressWarnings(expr)), error = function(e) NULL)
}

# shown(): the printed output of a call as one string, messages and
# warnings swallowed. Used for the coefficient-table LABEL checks. A call
# that stops gives its error text instead (S306), so a fit that stops on
# a broken master fails its label checks inside the verdict rather than
# halting the battery (section F's shape 2 stopped on the 0.9.176 master).
shown <- function(expr) {
  res <- tryCatch(suppressMessages(suppressWarnings(capture.output(expr))),
                  error = function(e) paste0("[error] ", conditionMessage(e)))
  paste(res, collapse = "\n")
}

# near(): numeric agreement with base R's fit, order-independent by name.
near <- function(a, b, tol = 1e-8) {
  if (anyNA(a) || anyNA(b)) return(FALSE)   # two failed fits never agree
  isTRUE(all.equal(unname(a), unname(b), tolerance = tol))
}

# b_of(): the raw b for a named term on a jlm()/jlogistic() return; a
# NULL (failed) fit or an absent term gives NA, which no near() accepts.
b_of <- function(m, term) {
  if (is.null(m$coefficients_raw)) return(NA_real_)
  v <- m$coefficients_raw$b[m$coefficients_raw$term == term]
  if (length(v) == 1L) v else NA_real_
}

# --- Fixtures ----------------------------------------------------------------
# All built in place. Seeds fixed so the numbers below are reproducible.
set.seed(305)
.nrow <- 120
d <- data.frame(g = rep(c("a", "b", "c", "d"), length.out = .nrow),
                stringsAsFactors = FALSE)
d$y  <- rnorm(.nrow) + c(a = 0, b = 1, c = 2, d = 4)[d$g]
d$yb <- rbinom(.nrow, 1, stats::plogis(c(a = -1.5, b = -0.5, c = 0.5,
                                       d = 1.5)[d$g]))
d$gf <- factor(d$g)                                # factor, all levels used
d$gz <- factor(d$g, levels = c("a", "z", "b", "c", "d"))  # unused MIDDLE level
d$gn <- ifelse(d$g == "a", "5", "10")              # digit strings as text
d$gb <- d$g; d$gb[c(1, 6, 11, 16)] <- ""            # four blank text cells
d$gm <- d$g; d$gm[c(2, 7)] <- NA                   # two NA text cells
d$x1 <- rnorm(.nrow); d$x2 <- rnorm(.nrow); d$x3 <- d$x1 + d$x2   # x3 aliased
d$k  <- 7                                          # a constant predictor
d$hv <- haven::labelled(rep(c(1, 2, 3), length.out = .nrow),
                        labels = c(Low = 1, Mid = 2, High = 3))
d$lg <- d$x1 > 0
d$nm <- rep(c(10, 20, 30), length.out = .nrow)
# S306 (section F). Drawn AFTER the columns above so their values are
# unchanged: xa is missing for every "a" case, so listwise deletion alone
# removes gf's reference category; h is a second three-category text
# variable for the two-notes (Rule F) check.
d$xa <- rnorm(.nrow); d$xa[d$g == "a"] <- NA
d$h  <- rep(c("p", "q", "r"), length.out = .nrow)

# The truths, from base R on the same rows.
.lm_g   <- stats::lm(y ~ g, data = d)
.glm_g  <- stats::glm(yb ~ g, data = d, family = stats::binomial)

# =============================================================================
# A. .jst_dummy_category_values() -- stored, and reconstructed
# =============================================================================
cat("\n--- A. .jst_dummy_category_values() ---\n")

.regf <- .jst_make_dummy_names(d$gf, "gf")
.regf$var_name <- "gf"
.rego <- .regf; .rego$values <- NULL      # an OLD-version registration

check("A01 a stored values field is returned as-is",
      identical(.jst_dummy_category_values(.regf, d$gf), c("a", "b", "c", "d")))
check("A02 old factor registration: reconstructed in code order",
      identical(.jst_dummy_category_values(.rego, d$gf), c("a", "b", "c", "d")))
check("A03 old factor registration, a category absent from the column: its slot is NA, the LATER positions do not shift", {
  col <- droplevels(d$gf[d$gf != "b"])
  identical(.jst_dummy_category_values(.rego, col), c("a", NA, "c", "d"))
})
check("A04 old factor registration, an unused level in the column: ignored, not positioned", {
  col <- factor(d$g, levels = c("a", "z", "b", "c", "d"))
  identical(.jst_dummy_category_values(.rego, col), c("a", "b", "c", "d"))
})
.regc <- .jst_make_dummy_names(d$g, "g"); .regc$var_name <- "g"
.regco <- .regc; .regco$values <- NULL
check("A05 old character registration: reconstructed from the sorted values",
      identical(.jst_dummy_category_values(.regco, d$g), c("a", "b", "c", "d")))
check("A06 old character registration, a category absent: NA slot, no shift",
      identical(.jst_dummy_category_values(.regco, d$g[d$g != "c"]),
                c("a", "b", NA, "d")))
check("A07 old character registration: a blank cell is not a candidate",
      identical(.jst_dummy_category_values(.regco, d$gb), c("a", "b", "c", "d")))
check("A08 old registration whose label needed the anti-stutter step still matches", {
  col <- c("g_one", "g_two", "g_one", "g_two")
  r   <- .jst_make_dummy_names(col, "g"); r$var_name <- "g"; r$values <- NULL
  identical(.jst_dummy_category_values(r, col), c("g_one", "g_two"))
})
check("A09 old registration: a value whose canonical name is empty stays NA rather than mis-positioning", {
  col <- c("***", "b", "***", "b")
  r   <- .jst_make_dummy_names(col, "g"); r$var_name <- "g"; r$values <- NULL
  identical(.jst_dummy_category_values(r, col), c(NA, "b"))
})
.regn <- .jst_make_dummy_names(d$nm, "nm"); .regn$var_name <- "nm"
.regno <- .regn; .regno$values <- NULL
check("A10 numeric registration: the codes ARE the values (old form too)",
      identical(.jst_dummy_category_values(.regno, d$nm), .regn$codes))
.regh <- .jst_make_dummy_names(d$hv, "hv"); .regh$var_name <- "hv"
.regho <- .regh; .regho$values <- NULL
check("A11 haven registration: the codes are the values (old form too)",
      identical(.jst_dummy_category_values(.regho, d$hv), .regh$codes))

# =============================================================================
# B. .jst_make_dummy_names() returns values for every input type
# =============================================================================
cat("\n--- B. .jst_make_dummy_names() values ---\n")

check("B01 factor: values are the droplevels() levels, in code order",
      identical(.jst_make_dummy_names(d$gz, "gz")$values, c("a", "b", "c", "d")))
# RE-PINNED S340 (v0.9.214): a blank cell is a category, placed last (it
# was left out of the values, and its cases out of the model).
check("B02 character: values are the sorted uniques, the blank category last",
      identical(.jst_make_dummy_names(d$gb, "gb")$values,
                c("a", "b", "c", "d", "<blank>")))
check("B03 character digit strings: string order, as the codes are assigned",
      identical(.jst_make_dummy_names(d$gn, "gn")$values, c("10", "5")))
check("B04 numeric: values equal codes",
      identical(.jst_make_dummy_names(d$nm, "nm")$values, c(10, 20, 30)))
check("B05 haven-labelled: values equal codes",
      identical(.jst_make_dummy_names(d$hv, "hv")$values, c(1, 2, 3)))
check("B06 logical: values equal codes (0/1)",
      identical(.jst_make_dummy_names(d$lg, "lg")$values, c(0, 1)))
check("B07 values and codes are always the same length",
      all(vapply(list(d$gz, d$gb, d$gn, d$nm, d$hv, d$lg), function(x) {
        r <- .jst_make_dummy_names(x, "v"); length(r$values) == length(r$codes)
      }, logical(1))))

# =============================================================================
# C. .jst_expand_one_dummy() -- the cell values
# =============================================================================
cat("\n--- C. .jst_expand_one_dummy() ---\n")

.expand <- function(col, name) {
  reg <- .jst_make_dummy_names(col, name); reg$var_name <- name
  df  <- data.frame(y = d$y); df[[name]] <- col
  .jst_expand_one_dummy(df, y ~ x, reg)$data
}
.truth <- function(col, value) {
  ifelse(is.na(col) | !nzchar(as.character(col)), NA_integer_,
         as.integer(as.character(col) == value))
}

.ec <- .expand(d$g, "g")
check("C01 character: g_b marks the b cases",  identical(.ec$g_b, .truth(d$g, "b")))
check("C02 character: g_c marks the c cases",  identical(.ec$g_c, .truth(d$g, "c")))
check("C03 character: g_d marks the d cases",  identical(.ec$g_d, .truth(d$g, "d")))
check("C04 character: no dummy is all-NA (the AUDIT-037 crash shape)",
      !any(vapply(.ec[c("g_b", "g_c", "g_d")], function(x) all(is.na(x)), logical(1))))
.em <- .expand(d$gm, "gm")
check("C05 character: an NA cell is NA on every dummy, and only there",
      all(is.na(.em$gm_b[c(2, 7)])) && all(is.na(.em$gm_c[c(2, 7)])) &&
      !anyNA(.em$gm_b[-c(2, 7)]) && !anyNA(.em$gm_c[-c(2, 7)]))
.eb <- .expand(d$gb, "gb")
# RE-PINNED S340 (v0.9.214): a blank cell is its own category -- 1 on the
# blank dummy and 0 on the others, never NA (it was NA on every dummy).
check("C06 character: a blank cell is 1 on gb_blank and 0 on every other dummy, and no dummy holds an NA",
      identical(.eb$gb_blank[c(1, 6, 11, 16)], rep(1L, 4)) &&
      sum(.eb$gb_blank) == 4L &&
      identical(.eb$gb_b[c(1, 6, 11, 16)], rep(0L, 4)) &&
      identical(.eb$gb_d[c(1, 6, 11, 16)], rep(0L, 4)) &&
      !anyNA(.eb$gb_b) && !anyNA(.eb$gb_c) && !anyNA(.eb$gb_d) && !anyNA(.eb$gb_blank))
check("C07 character: the non-blank cells are unaffected by the blanks",
      identical(.eb$gb_c[-c(1, 6, 11, 16)], .truth(d$gb, "c")[-c(1, 6, 11, 16)]))
.en <- .expand(d$gn, "gn")
check("C08 digit-string text: gn_5 marks the \"5\" cases (was all zero)",
      identical(.en$gn_5, .truth(d$gn, "5")) && sum(.en$gn_5) == 30L)
.ez <- .expand(d$gz, "gz")
check("C09 factor, unused middle level: gz_b marks the b cases (was all zero)",
      identical(.ez$gz_b, .truth(d$gz, "b")) && sum(.ez$gz_b) == 30L)
check("C10 factor, unused middle level: gz_c and gz_d mark their own cases",
      identical(.ez$gz_c, .truth(d$gz, "c")) && identical(.ez$gz_d, .truth(d$gz, "d")))
check("C11 a text value the registration does not know is zero on every dummy (as an unregistered numeric code is)", {
  reg <- .jst_make_dummy_names(d$g, "g"); reg$var_name <- "g"
  df  <- data.frame(y = d$y, g = d$g); df$g[1] <- "q"
  e   <- .jst_expand_one_dummy(df, y ~ x, reg)$data
  identical(c(e$g_b[1], e$g_c[1], e$g_d[1]), c(0L, 0L, 0L))
})
check("C12 factor: an NA cell is NA on every dummy, and only there", {
  col <- d$gf; col[c(3, 8)] <- NA
  e <- .expand(col, "gf")
  all(is.na(e$gf_b[c(3, 8)])) && all(is.na(e$gf_c[c(3, 8)])) &&
    !anyNA(e$gf_b[-c(3, 8)]) && !anyNA(e$gf_c[-c(3, 8)])
})
# The unchanged path: numeric, haven and logical keep the value comparison
# (the S213 commitment: byte-identical for these types).
.enm <- .expand(d$nm, "nm")
check("C13 numeric: nm_20 == as.integer(nm == 20)",
      identical(.enm$nm_20, ifelse(is.na(d$nm), NA_integer_, as.integer(d$nm == 20))))
check("C14 numeric: nm_30 == as.integer(nm == 30)",
      identical(.enm$nm_30, ifelse(is.na(d$nm), NA_integer_, as.integer(d$nm == 30))))
check("C15 numeric: an NA cell is NA", {
  col <- d$nm; col[4] <- NA
  is.na(.expand(col, "nm")$nm_20[4])
})
.ehv <- .expand(d$hv, "hv")
check("C16 haven-labelled: dummies compare the underlying codes",
      identical(.ehv$hv_Mid, as.integer(unclass(d$hv) == 2)) &&
      identical(.ehv$hv_High, as.integer(unclass(d$hv) == 3)))
check("C17 haven-labelled: an NA cell is NA", {
  col <- d$hv; col[5] <- NA
  is.na(.expand(col, "hv")$hv_Mid[5])
})
.elg <- .expand(d$lg, "lg")
check("C18 logical: lg_TRUE == as.integer(lg)",
      identical(.elg$lg_TRUE, as.integer(d$lg)))
check("C19 logical: an NA cell is NA", {
  col <- d$lg; col[2] <- NA
  is.na(.expand(col, "lg")$lg_TRUE[2])
})
check("C20 every dummy column is integer typed on every path",
      all(vapply(c(.ec[-(1:2)], .enm[-(1:2)], .ehv[-(1:2)], .elg[-(1:2)]),
                 is.integer, logical(1))))

# =============================================================================
# D. jlm() live -- the exported function, every categorical pathway
# =============================================================================
cat("\n--- D. jlm() ---\n")

.m1 <- quiet(jlm(y ~ g, data = d))
check("D01 character IV, auto-categorical: the model fits (it crashed)",
      inherits(.m1, "jst_lm") || !is.null(.m1$model))
check("D02 character IV: coefficients equal lm() on the factor",
      near(b_of(.m1, "g_b"), coef(.lm_g)[["gb"]]) &&
      near(b_of(.m1, "g_c"), coef(.lm_g)[["gc"]]) &&
      near(b_of(.m1, "g_d"), coef(.lm_g)[["gd"]]))
check("D03 character IV: N is the full sample (no auto-listwise sweep)",
      .m1$n == .nrow && stats::nobs(.m1$model) == .nrow)
.m2 <- quiet(jlm(y ~ gz, data = d))
check("D04 factor with an unused MIDDLE level: coefficients equal lm() on droplevels()",
      near(b_of(.m2, "gz_b"), coef(.lm_g)[["gb"]]) &&
      near(b_of(.m2, "gz_c"), coef(.lm_g)[["gc"]]) &&
      near(b_of(.m2, "gz_d"), coef(.lm_g)[["gd"]]))
.m3 <- quiet(jlm(y ~ gn, data = d))
check("D05 digit-string text \"5\"/\"10\": the slope is the group mean difference",
      near(b_of(.m3, "gn_5"), mean(d$y[d$gn == "5"]) - mean(d$y[d$gn == "10"])))
check("D06 character IV, categorical = : same coefficients as the auto path", {
  m <- quiet(jlm(y ~ g, data = d, categorical = "g"))
  near(b_of(m, "g_c"), b_of(.m1, "g_c"))
})
check("D07 jdummy()-registered character IV: fits and agrees with lm()", {
  quiet(jdummy(d, g))
  m <- quiet(jlm(y ~ g, data = d))
  quiet(jdummy(d, g, remove = TRUE))
  near(b_of(m, "g_d"), coef(.lm_g)[["gd"]])
})
# RE-PINNED S340 (v0.9.214): blank cells stay in the model as a category
# (N dropped by the blank count before).
check("D08 blank text cells are a category: N is every case, and the fit is lm()'s with the blank as a level", {
  m  <- quiet(jlm(y ~ gb, data = d))
  lv <- factor(ifelse(nzchar(d$gb), d$gb, "zblank"))
  tr <- coef(stats::lm(d$y ~ lv))
  stats::nobs(m$model) == .nrow &&
    near(b_of(m, "gb_d"), tr[["lvd"]]) && near(b_of(m, "gb_blank"), tr[["lvzblank"]])
})
check("D09 a jdummy()-REGISTERED factor under a filter that drops the REFERENCE category: rows labeled from the registration", {
  # Before S305 the labels were rebuilt from the post-filter column, so
  # with 'a' filtered out the row for b read "2: c" and the row for c read
  # "3: d". S305 fixed the labels but left the fit re-referenced to d by
  # the aliasing drop, under a header still naming a. Since S306 the
  # absent reference is replaced by b (section F), so the rows are c and
  # d, each labeled from the registration; b, the new reference, has no
  # row. RE-PINNED S306.
  quiet(jdummy(d, gf))
  out <- shown(jlm(y ~ gf, data = d, subset = gf != "a"))
  quiet(jdummy(d, gf, remove = TRUE))
  grepl("\n\\s+3: c\\s", out) && grepl("\n\\s+4: d\\s", out) &&
    !grepl("\n\\s+2: b\\s", out) && !grepl("\n\\s+3: d\\s", out)
})
check("D10 ... and the coefficients on those rows are the c-vs-b and d-vs-b differences", {
  # RE-PINNED S306 (were b-vs-d and c-vs-d under the aliasing drop).
  quiet(jdummy(d, gf))
  m  <- quiet(jlm(y ~ gf, data = d, subset = gf != "a"))
  quiet(jdummy(d, gf, remove = TRUE))
  dd <- d[d$gf != "a", ]
  near(b_of(m, "gf_c"), mean(dd$y[dd$g == "c"]) - mean(dd$y[dd$g == "b"])) &&
    near(b_of(m, "gf_d"), mean(dd$y[dd$g == "d"]) - mean(dd$y[dd$g == "b"]))
})
check("D11 an OLD-version registration (no values) on a character IV: fits through the reconstruction", {
  quiet(jdummy(d, g))
  ds <- .jst_get_dummy("d"); ds[[1]]$values <- NULL; .jst_set_dummy("d", ds)
  m <- quiet(jlm(y ~ g, data = d))
  quiet(jdummy(d, g, remove = TRUE))
  near(b_of(m, "g_c"), coef(.lm_g)[["gc"]])
})
check("D12 an OLD-version factor registration under a filter that drops the reference: rows labeled right, header re-referenced", {
  # RE-PINNED S306: the reconstruction pins each present value to its
  # registered code, so the rows are c and d under a header naming b.
  # The absent a's value cannot be reconstructed from the filtered
  # frame, so the note shows its bare code (1) -- the same fallback the
  # header used for it before S306.
  quiet(jdummy(d, gf))
  ds <- .jst_get_dummy("d"); ds[[1]]$values <- NULL; .jst_set_dummy("d", ds)
  out <- shown(jlm(y ~ gf, data = d, subset = gf != "a"))
  quiet(jdummy(d, gf, remove = TRUE))
  grepl("gf (ref = 2: b)", out, fixed = TRUE) &&
    grepl("\n\\s+3: c\\s", out) && grepl("\n\\s+4: d\\s", out)
})
check("D13 numeric and haven IVs: unchanged (agree with lm() on factors of the codes)", {
  m1 <- quiet(jlm(y ~ nm, data = d, categorical = "nm"))
  m2 <- quiet(jlm(y ~ hv, data = d, categorical = "hv"))
  t1 <- coef(stats::lm(y ~ factor(nm), data = d))
  t2 <- coef(stats::lm(y ~ factor(unclass(hv)), data = d))
  near(b_of(m1, "nm_30"), t1[["factor(nm)30"]]) &&
    near(b_of(m2, "hv_High"), t2[["factor(unclass(hv))3"]])
})

# =============================================================================
# E. jlogistic() live -- the same pathways, plus the pre-fit guards
# =============================================================================
cat("\n--- E. jlogistic() ---\n")

.l1 <- quiet(jlogistic(yb ~ g, data = d))
check("E01 character IV: the model fits and equals glm() on the factor",
      near(b_of(.l1, "g_b"), coef(.glm_g)[["gb"]], 1e-6) &&
      near(b_of(.l1, "g_d"), coef(.glm_g)[["gd"]], 1e-6))
.l2 <- quiet(jlogistic(yb ~ gz, data = d))
check("E02 factor with an unused MIDDLE level: equals glm() (it printed a wrong table, then crashed)",
      near(b_of(.l2, "gz_b"), coef(.glm_g)[["gb"]], 1e-6) &&
      near(b_of(.l2, "gz_c"), coef(.glm_g)[["gc"]], 1e-6) &&
      near(b_of(.l2, "gz_d"), coef(.glm_g)[["gd"]], 1e-6))
check("E03 haven IV: unchanged (equals glm() on the factor of the codes)", {
  m <- quiet(jlogistic(yb ~ hv, data = d, categorical = "hv"))
  t <- coef(stats::glm(yb ~ factor(unclass(hv)), data = d, family = stats::binomial))
  near(b_of(m, "hv_Mid"), t[["factor(unclass(hv))2"]], 1e-6)
})
.dna <- d; .dna$x1[] <- NA_real_
# The wording is the shared stop's since S346 (section N pins it whole).
check("E04 every case excluded: jlogistic stops with jlm's wording (R's 'Argument mu' leaked before)",
      grepl("No cases are left to analyze. All 120 cases were excluded because of missing data.",
            flat(grab(jlogistic(yb ~ x1, data = .dna))), fixed = TRUE) &&
        identical(sub("^jlogistic", "jlm", grab(jlogistic(yb ~ x1, data = .dna))),
                  grab(jlm(y ~ x1, data = .dna))))
check("E05 ... and the stop names the function",
      grepl("jlogistic():", grab(jlogistic(yb ~ x1, data = .dna)), fixed = TRUE))
check("E06 a constant predictor: jlogistic stops with jlm's zero-variance wording",
      grepl("k has only one value in the analysis sample, so its coefficient cannot be estimated.",
            flat(grab(jlogistic(yb ~ x1 + k, data = d))), fixed = TRUE) &&
        identical(flat(sub("^jlogistic\\(\\): ", "", grab(jlogistic(yb ~ x1 + k, data = d)))),
                  flat(sub("^jlm\\(\\): ", "", grab(jlm(y ~ x1 + k, data = d))))))
check("E07 an aliased predictor: the collinearity warning fires (x3 = x1 + x2)",
      grepl("One or more variables have been removed from the model due to collinearity.",
            flat(grab(jlogistic(yb ~ x1 + x2 + x3, data = d))), fixed = TRUE))
.l3 <- quiet(jlogistic(yb ~ x1 + x2 + x3, data = d, ci = TRUE))
check("E08 an aliased predictor: the call returns (it crashed building the return object)",
      !is.null(.l3$coefficients_raw) && nrow(.l3$coefficients_raw) == 3L)
check("E09 ... the CI columns are aligned to the fitted rows, none NA",
      identical(.l3$coefficients_raw$term, c("(Intercept)", "x1", "x2")) &&
      !any(is.na(.l3$coefficients_raw$exp_ci_lower)) &&
      !any(is.na(.l3$coefficients_raw$exp_ci_upper)))
check("E10 ... and equal glm()'s profile CI on the same fit", {
  fit <- stats::glm(yb ~ x1 + x2 + x3, data = d, family = stats::binomial)
  ci  <- suppressMessages(stats::confint(fit))
  near(.l3$coefficients_raw$exp_ci_lower, exp(ci[c("(Intercept)", "x1", "x2"), 1]), 1e-6)
})
check("E11 the guards do not fire on a clean fit (no stop, no collinearity warning)",
      !grepl("excluded|no variation|collinearity", grab(jlogistic(yb ~ x1 + x2, data = d))))

# =============================================================================
# F. Absent categories in the analysis sample (S306)
# =============================================================================
# A registered category with no case among the analysis rows. Absent
# REFERENCE: the first present category becomes the reference for that
# call (its own dummy is dropped; the rest are already the treatment
# coding against it), the header and rows follow, and a consequential
# note says so. Absent NON-reference: its dummy is dropped, with a note.
# Fewer than two present: a guided stop naming the VARIABLE. Presence is
# judged on the model frame, so a category emptied by listwise deletion
# is caught as well as one a filter removed; the auto path takes the
# same route with its own note form. The stored registration is never
# touched. REMEDY LINES ARE RUN, NOT READ: the wording asserted below is
# copied from the source builder, and the fits are checked against base R
# on the same rows.
cat("\n--- F. absent categories ---\n")

# The three approved strings (S306), as the builder emits them.
.f_note_ref <- paste0(
  "Note: gf's registered reference category, 1: a, has no cases in the analysis sample.\n",
  "2: b is the reference category for this model.\n",
  "The registration is unchanged.")
.f_note_nonref <- paste0(
  "Note: gf's registered category 4: d has no cases in the analysis sample and is left out of this model.\n",
  "The registration is unchanged.")
# Since S346 a filter that names the variable is named as the cause, with
# both ways out (section P); the S306 sentence's requirement is kept.
.f_stop_one <- paste0(
  "subset = gf == \"b\" keeps only one category of gf (2: b), and a dummy-coded predictor requires at least two.\n",
  "To estimate its coefficients, remove the filter.\n",
  "To analyze only those cases, remove gf from the formula.")

# with_state(): run expr between a setup and a teardown that runs whatever
# happens, so a failing check cannot leak registrations or filters into
# the next one. with_reg() is the common case: gf registered on d.
with_state <- function(setup, expr, teardown) {
  force(setup)
  on.exit(teardown, add = TRUE)
  force(expr)
}
with_reg <- function(expr) {
  with_state(quiet(jdummy(d, gf)), expr, quiet(jdummy(d, gf, remove = TRUE)))
}
.dd_no_a <- d[d$gf != "a", ]; .dd_no_a$gf <- droplevels(.dd_no_a$gf)
.dd_no_d <- d[d$gf != "d", ]; .dd_no_d$gf <- droplevels(.dd_no_d$gf)
.lm_no_a  <- stats::lm(y ~ gf, data = .dd_no_a)     # b is the reference
.lm_no_d  <- stats::lm(y ~ gf, data = .dd_no_d)     # a still is
.glm_no_a <- stats::glm(yb ~ gf, data = .dd_no_a, family = stats::binomial)

# -- Shape 1: the registered reference category filtered out --------------
.f1_out <- with_reg(shown(jlm(y ~ gf, data = d, subset = gf != "a")))
.f1_msg <- with_reg(grab(jlm(y ~ gf, data = d, subset = gf != "a")))
.f1_m   <- with_reg(quiet(jlm(y ~ gf, data = d, subset = gf != "a")))
check("F01 reference filtered out: the header names the new reference, 2: b (it named 1: a)",
      grepl("gf (ref = 2: b)", .f1_out, fixed = TRUE) &&
      !grepl("ref = 1: a", .f1_out, fixed = TRUE))
check("F02 ... the rows are 3: c and 4: d; the new reference has no row",
      grepl("\n\\s+3: c\\s", .f1_out) && grepl("\n\\s+4: d\\s", .f1_out) &&
      !grepl("\n\\s+2: b\\s", .f1_out))
check("F03 ... the coefficients equal lm() on the filtered frame with b as reference",
      near(b_of(.f1_m, "gf_c"), coef(.lm_no_a)[["gfc"]]) &&
      near(b_of(.f1_m, "gf_d"), coef(.lm_no_a)[["gfd"]]) &&
      near(b_of(.f1_m, "(Intercept)"), coef(.lm_no_a)[["(Intercept)"]]))
check("F04 ... the note fires with the approved three-line wording",
      grepl(flat(.f_note_ref), flat(.f1_msg), fixed = TRUE))
check("F05 ... and the collinearity warning no longer fires (it was the only hint)",
      !grepl("collinearity", .f1_msg, fixed = TRUE))
check("F06 ... the returned ref_cats and dummy_coef_names describe the fitted model",
      identical(.f1_m$ref_cats, "gf = gf_b") &&
      identical(.f1_m$dummy_coef_names, c("gf_c", "gf_d")))
check("F07 ... and the stored registration is unchanged after the call", {
  quiet(jdummy(d, gf))
  before <- .jst_get_dummy("d")[[1]][c("ref_idx", "dummy_names", "non_ref_idx")]
  quiet(jlm(y ~ gf, data = d, subset = gf != "a"))
  after  <- .jst_get_dummy("d")[[1]][c("ref_idx", "dummy_names", "non_ref_idx")]
  quiet(jdummy(d, gf, remove = TRUE))
  identical(before, after) && identical(before$dummy_names, c("gf_b", "gf_c", "gf_d"))
})
check("F08 ... a persistent jsubset() filter takes the same route", {
  m <- with_state(quiet(jsubset(d, gf != "a")),
                  with_reg(quiet(jlm(y ~ gf, data = d))),
                  quiet(jsubset(d, off)))
  identical(m$ref_cats, "gf = gf_b") &&
    near(b_of(m, "gf_d"), coef(.lm_no_a)[["gfd"]])
})

# -- Shape 2: a NON-reference category filtered out -----------------------
.f2_out <- with_reg(shown(jlm(y ~ gf, data = d, subset = gf != "d")))
.f2_msg <- with_reg(grab(jlm(y ~ gf, data = d, subset = gf != "d")))
.f2_m   <- with_reg(quiet(jlm(y ~ gf, data = d, subset = gf != "d")))
check("F09 a non-reference category filtered out: the model fits (it stopped on gf_d)",
      !is.null(.f2_m$coefficients_raw) &&
      !grepl("no variation", .f2_msg, fixed = TRUE))
check("F10 ... the header keeps 1: a and the rows are 2: b and 3: c",
      grepl("gf (ref = 1: a)", .f2_out, fixed = TRUE) &&
      grepl("\n\\s+2: b\\s", .f2_out) && grepl("\n\\s+3: c\\s", .f2_out) &&
      !grepl("\n\\s+4: d\\s", .f2_out))
check("F11 ... the coefficients equal lm() on the filtered frame",
      near(b_of(.f2_m, "gf_b"), coef(.lm_no_d)[["gfb"]]) &&
      near(b_of(.f2_m, "gf_c"), coef(.lm_no_d)[["gfc"]]))
check("F12 ... the note fires with the approved wording",
      grepl(flat(.f_note_nonref), flat(.f2_msg), fixed = TRUE))
check("F13 ... and dummy_coef_names lacks the dropped dummy",
      identical(.f2_m$dummy_coef_names, c("gf_b", "gf_c")))

# -- Both at once: the reference and a non-reference category absent ------
.f3_msg <- with_reg(grab(jlm(y ~ gf, data = d, subset = gf %in% c("b", "c"))))
.f3_m   <- with_reg(quiet(jlm(y ~ gf, data = d, subset = gf %in% c("b", "c"))))
check("F14 reference AND a non-reference absent: one note, the left-out line between the reference line and the closing line",
      grepl(flat(paste0(
        "2: b is the reference category for this model.\n",
        "4: d is left out of this model.\n",
        "The registration is unchanged.")), flat(.f3_msg), fixed = TRUE))
check("F15 ... one dummy remains, c-vs-b, and the fit equals lm() on the two categories", {
  dd <- d[d$gf %in% c("b", "c"), ]
  identical(.f3_m$dummy_coef_names, "gf_c") &&
    near(b_of(.f3_m, "gf_c"), mean(dd$y[dd$g == "c"]) - mean(dd$y[dd$g == "b"]))
})

# -- Fewer than two categories present: the guided stop -------------------
.f4_msg <- with_reg(grab(jlm(y ~ gf, data = d, subset = gf == "b")))
check("F16 one category left: the stop names the VARIABLE (it named gf_b, gf_c, gf_d) and, since S346, the filter that kept it",
      grepl(flat(.f_stop_one), flat(.f4_msg), fixed = TRUE) &&
      !grepl("gf_b", .f4_msg, fixed = TRUE))
check("F17 ... and the stop names the function",
      grepl("jlm(): subset = gf == \"b\" keeps only one category of gf", flat(.f4_msg), fixed = TRUE))

# -- The listwise route: no filter, the reference lost to deletion --------
.f5_out <- with_reg(shown(jlm(y ~ gf + xa, data = d)))
.f5_msg <- with_reg(grab(jlm(y ~ gf + xa, data = d)))
check("F18 reference emptied by listwise deletion on ANOTHER variable, registered: caught, header 2: b, registered note",
      grepl("gf (ref = 2: b)", .f5_out, fixed = TRUE) &&
      grepl(flat(.f_note_ref), flat(.f5_msg), fixed = TRUE))
.f6_out <- shown(jlm(y ~ gf + xa, data = d))
.f6_msg <- grab(jlm(y ~ gf + xa, data = d))
check("F19 the same through the AUTO path (no registration): caught, header re-referenced", {
  # An in-flight registration's codes are per-call positions in the
  # frame it was built from (a b c d here), so b is its code 2.
  grepl("gf (ref = 2: b)", .f6_out, fixed = TRUE) &&
    !grepl("collinearity", .f6_msg, fixed = TRUE)
})
check("F20 ... the auto note drops \"registered\" and has no registration line",
      grepl(flat(paste0(
        "Note: gf's reference category, 1: a, has no cases in the analysis sample.\n",
        "2: b is the reference category for this model.")), flat(.f6_msg), fixed = TRUE) &&
      !grepl("registered", .f6_msg, fixed = TRUE) &&
      !grepl("registration is unchanged", .f6_msg, fixed = TRUE))
check("F21 the auto path under a FILTER is untouched: its in-flight registration is built from the filtered frame, so no note",
      !grepl("has no cases", grab(jlm(y ~ gf, data = d, subset = gf != "a")), fixed = TRUE))
check("F22 no note and no drop on a clean registered fit",
      !grepl("has no cases", with_reg(grab(jlm(y ~ gf, data = d))), fixed = TRUE) &&
      identical(with_reg(quiet(jlm(y ~ gf, data = d)))$dummy_coef_names,
                c("gf_b", "gf_c", "gf_d")))

# -- Interactions, value-space registrations, two variables ---------------
check("F23 an interaction keeps its shape: x1 * gf under the filter drops gf_b and x1:gf_b only", {
  m <- with_reg(quiet(jlm(y ~ x1 * gf, data = d, subset = gf != "a")))
  t <- coef(stats::lm(y ~ x1 * gf, data = .dd_no_a))
  identical(m$coefficients_raw$term,
            c("(Intercept)", "x1", "gf_c", "gf_d", "x1:gf_c", "x1:gf_d")) &&
    near(b_of(m, "x1:gf_d"), t[["x1:gfd"]])
})
check("F24 a haven-labelled registration (VALUE space): absent reference 1: Low gives header 2: Mid and the value-labelled note", {
  r <- with_state(quiet(jdummy(d, hv)), list(
         out = shown(jlm(y ~ hv, data = d, subset = hv != 1)),
         msg = grab(jlm(y ~ hv, data = d, subset = hv != 1)),
         m   = quiet(jlm(y ~ hv, data = d, subset = hv != 1))),
       quiet(jdummy(d, hv, remove = TRUE)))
  out <- r$out; msg <- r$msg; m <- r$m
  dd  <- d[d$hv != 1, ]
  # Two categories remain, so the one dummy prints as a flat row.
  grepl("hv_High", out, fixed = TRUE) &&
    grepl("hv's registered reference category, 1: Low, has no cases", flat(msg), fixed = TRUE) &&
    grepl("2: Mid is the reference category for this model.", flat(msg), fixed = TRUE) &&
    identical(m$ref_cats, "hv = hv_Mid") &&
    near(b_of(m, "hv_High"),
         mean(dd$y[unclass(dd$hv) == 3]) - mean(dd$y[unclass(dd$hv) == 2]))
})
check("F25 two variables pruned in one call: two notes, a blank line between (Rule F)", {
  msg <- with_state({ quiet(jdummy(d, gf)); quiet(jdummy(d, h)) },
           grab(jlm(y ~ gf + h, data = d, subset = !(gf == "a" | h == "p"))),
           { quiet(jdummy(d, gf, remove = TRUE)); quiet(jdummy(d, h, remove = TRUE)) })
  grepl("The registration is unchanged.\n\nNote: h's registered reference category, 1: p, has no cases",
        msg, fixed = TRUE)
})

# -- jlogistic: the same route -------------------------------------------
.f7_out <- with_reg(shown(jlogistic(yb ~ gf, data = d, subset = gf != "a")))
.f7_msg <- with_reg(grab(jlogistic(yb ~ gf, data = d, subset = gf != "a")))
.f7_m   <- with_reg(quiet(jlogistic(yb ~ gf, data = d, subset = gf != "a")))
check("F26 jlogistic, reference filtered out: header 2: b, rows 3: c and 4: d",
      grepl("gf (ref = 2: b)", .f7_out, fixed = TRUE) &&
      grepl("\n\\s+3: c\\s", .f7_out) && grepl("\n\\s+4: d\\s", .f7_out))
check("F27 ... the note fires and the collinearity warning does not",
      grepl(flat(.f_note_ref), flat(.f7_msg), fixed = TRUE) &&
      !grepl("collinearity", .f7_msg, fixed = TRUE))
check("F28 ... the coefficients equal glm() with b as reference, and ref_cats follows",
      near(b_of(.f7_m, "gf_c"), coef(.glm_no_a)[["gfc"]], 1e-6) &&
      near(b_of(.f7_m, "gf_d"), coef(.glm_no_a)[["gfd"]], 1e-6) &&
      identical(.f7_m$ref_cats, "gf = gf_b"))
check("F29 jlogistic, a non-reference category filtered out: fits, with the note (it stopped on gf_d)", {
  m   <- with_reg(quiet(jlogistic(yb ~ gf, data = d, subset = gf != "d")))
  msg <- with_reg(grab(jlogistic(yb ~ gf, data = d, subset = gf != "d")))
  !is.null(m$coefficients_raw) && identical(m$dummy_coef_names, c("gf_b", "gf_c")) &&
    grepl(flat(.f_note_nonref), flat(msg), fixed = TRUE)
})
check("F30 jlogistic, one category left: the stop names the variable and the function",
      grepl("jlogistic(): subset = gf == \"b\" keeps only one category of gf (2: b)",
            flat(with_reg(grab(jlogistic(yb ~ gf, data = d, subset = gf == "b")))), fixed = TRUE))

# -- The formula walker on its own ----------------------------------------
check("F31 .jst_drop_formula_terms() removes a dummy from a parenthesized block inside an interaction",
      identical(deparse(.jst_drop_formula_terms(y ~ x * (a + b + c), "b")),
                "y ~ x * (a + c)") &&
      identical(deparse(.jst_drop_formula_terms(y ~ (a + b + c) + z, c("a", "c"))),
                "y ~ (b) + z"))

# =============================================================================
# G. The Gelman column, interaction rows, the legend (S320)
# =============================================================================
# Three S320 items on the coefficient table. (1) The Gelman column is a
# REFIT on rescaled inputs -- every predictor centered, a continuous one
# also divided by two SDs, a binary one (0/1 variable or dummy column) left
# on its one-unit scale, the outcome untouched -- so an interaction's
# product is formed from the rescaled inputs, as Gelman (2008) does. It was
# read off the original fit as b * 2 * SD(x), the same number without an
# interaction and a wrong one with. Every 0/1 column is centered, the
# dummies of a three-or-more-category variable included (arm::standardize()
# leaves those at 0/1; the paper's rule is applied to all of them). (2)
# Interaction rows display with " * " for R's ":"; one built on a
# multi-category variable is grouped under a header naming both variables
# and the reference, with one indented category row per dummy; in the
# regular regime a row built on any suppressed 0/1 column is blanked with
# it (AUDIT-035). A two-line legend prints under the table, one blank line
# below it, whenever a model with an interaction shows a standardized
# column: a sentence naming the column, then "See ?jlm." on its own line
# (Rule E). (3) The legend tiers list
# every predictor, a computed term as its bare text (AUDIT-036). The
# oracles are hand refits on the fixture inside each check, so no number
# below is a pinned constant.
cat("\n--- G. Gelman column, interaction rows, legend ---\n")

# Hand rescalings, Gelman (2008): (x - mean) / (2 sd) for a continuous
# input; x - mean for a binary one.
.z2  <- function(x) (x - mean(x)) / (2 * stats::sd(x))
.ctr <- function(x) x - mean(x)
.gel_of <- function(m, term) {
  if (is.null(m$coefficients_raw)) return(NA_real_)
  v <- m$coefficients_raw$beta_gelman[m$coefficients_raw$term == term]
  if (length(v) == 1L) v else NA_real_
}
.beta_of <- function(m, term) {
  if (is.null(m$coefficients_raw)) return(NA_real_)
  v <- m$coefficients_raw$beta[m$coefficients_raw$term == term]
  if (length(v) == 1L) v else NA_real_
}
# lines_of(): the printed lines, ANSI stripped, trailing space trimmed.
lines_of <- function(expr) {
  txt <- tryCatch(suppressMessages(suppressWarnings(capture.output(expr))),
                  error = function(e) paste0("[error] ", conditionMessage(e)))
  sub("[ \t]+$", "", gsub("\033\\[[0-9;]*[A-Za-z]", "", txt))
}
# The legend flattened: the wrapped sentence rejoined with spaces, then the
# pointer line.
.g_note <- function(hdr) paste0(
  "In a model with an interaction, ", hdr, " comes from centered ",
  "predictors: a ", hdr, " can have the opposite sign from its b, and ",
  "other software may report different ", hdr, " values. See ?jlm.")
has_note <- function(ln, hdr) grepl(.g_note(hdr), paste(ln, collapse = " "), fixed = TRUE)
# Fixture columns for this Part: a 0/1 predictor and a 1/2-coded one.
d$b01 <- as.integer(d$x2 > 0)
d$b12 <- d$b01 + 1L

# -- The refit: continuous x continuous, and the additive control ----------
.g1 <- quiet(jlm(y ~ x1 * x2, data = d, std = "gelman"))
.g1_hand <- coef(stats::lm(y ~ .z2(x1) * .z2(x2), data = d))
check("G01 continuous x continuous: the Gelman column equals a refit on 2-SD inputs, product formed after",
      near(c(.gel_of(.g1, "x1"), .gel_of(.g1, "x2"), .gel_of(.g1, "x1:x2")),
           unname(.g1_hand[2:4])))
check("G02 ... which is NOT the old b * 2 SD on the main effects, nor the product column's own SD",
      { b <- .g1$coefficients_raw$b
        !near(.gel_of(.g1, "x1"), b[2] * 2 * stats::sd(d$x1)) &&
        !near(.gel_of(.g1, "x1:x2"), b[4] * 2 * stats::sd(d$x1 * d$x2)) })
.g3 <- quiet(jlm(y ~ x1 + x2 + b01, data = d, std = "gelman"))
check("G03 no interaction: unchanged -- b * 2 SD for a continuous predictor, b for a 0/1 one",
      { b <- .g3$coefficients_raw$b
        near(.gel_of(.g3, "x1"), b[2] * 2 * stats::sd(d$x1)) &&
        near(.gel_of(.g3, "x2"), b[3] * 2 * stats::sd(d$x2)) &&
        near(.gel_of(.g3, "b01"), b[4]) })
check("G04 the intercept's Gelman cell is NA, and the regular beta column is untouched by the refit",
      is.na(.g1$coefficients_raw$beta_gelman[1]) &&
      near(.beta_of(.g1, "x1:x2"),
           coef(stats::lm(scale(y) ~ scale(x1) * scale(x2), data = d))[[4]]))

# -- Binary inputs are centered ------------------------------------------
.g5 <- quiet(jlm(y ~ x1 * b01, data = d, std = "gelman"))
check("G05 continuous x 0/1: the 0/1 input is centered, so the continuous main effect is the sample-average slope",
      near(c(.gel_of(.g5, "x1"), .gel_of(.g5, "b01"), .gel_of(.g5, "x1:b01")),
           unname(coef(stats::lm(y ~ .z2(x1) * .ctr(b01), data = d))[2:4])) &&
      !near(.gel_of(.g5, "x1"), coef(stats::lm(y ~ .z2(x1) * b01, data = d))[[2]]))
check("G06 a 1/2-coded dichotomy is centered too, not 2-SD scaled: its coefficient is the group difference",
      { m <- quiet(jlm(y ~ x1 * b12, data = d, std = "gelman"))
        near(.gel_of(m, "b12"), coef(stats::lm(y ~ .z2(x1) * .ctr(b12), data = d))[[3]]) &&
        near(.gel_of(m, "b12"), .gel_of(.g5, "b01")) })
.g7 <- with_reg(quiet(jlm(y ~ x1 * gf, data = d, std = "gelman")))
.g7_D <- scale(stats::model.matrix(~ gf, d)[, -1], scale = FALSE)
.g7_dd <- data.frame(y = d$y, zx = .z2(d$x1), .g7_D)
.g7_hand <- coef(stats::lm(y ~ zx * (gfb + gfc + gfd), data = .g7_dd))
check("G07 continuous x four-category registration: the DUMMIES are centered (the paper's rule; arm leaves a factor's at 0/1)",
      near(c(.gel_of(.g7, "x1"), .gel_of(.g7, "gf_b"), .gel_of(.g7, "x1:gf_d")),
           unname(.g7_hand[c("zx", "gfb", "zx:gfd")])) &&
      !near(.gel_of(.g7, "x1"),
            coef(stats::lm(y ~ .z2(x1) * gf, data = d))[[2L]]))

# -- The legend line under the table -------------------------------------
check("G08 an interaction model at the default prints the legend, naming the regular column",
      has_note(lines_of(jlm(y ~ x1 * x2, data = d)), "\u03b2"))
check("G09 ... under std = \"gelman\" it names the Gelman column",
      has_note(lines_of(jlm(y ~ x1 * x2, data = d, std = "gelman")), "Gelman \u03b2"))
check("G10 ... one blank line below the table, \"See ?jlm.\" on its own line, then the blank before the Outcome line",
      { ln <- lines_of(jlm(y ~ x1 * x2, data = d))
        i <- grep("^x1 \\* x2 ", ln); j <- grep("^In a model with an interaction", ln)
        k <- which(ln == "See ?jlm.")
        length(i) == 1L && length(j) == 1L && length(k) == 1L &&
          j == i + 2L && !nzchar(ln[i + 1L]) &&
          k > j && k <= j + 3L && all(nzchar(ln[j:k])) &&
          !nzchar(ln[k + 1L]) && grepl("^Outcome:", ln[k + 2L]) })
check("G11 no legend without an interaction, and none under std = \"none\"",
      !any(grepl("In a model with an interaction", lines_of(jlm(y ~ x1 + x2, data = d)), fixed = TRUE)) &&
      !any(grepl("In a model with an interaction", lines_of(jlm(y ~ x1 * x2, data = d, std = "none")), fixed = TRUE)))
check("G12 jlogistic has no standardized column, so no legend",
      !any(grepl("In a model with an interaction", lines_of(jlogistic(yb ~ x1 * x2, data = d)), fixed = TRUE)))

# -- Interaction rows: naming and the regular-beta blank -------------------
check("G13 a continuous x continuous row reads \"x1 * x2\"; the machine key keeps R's \"x1:x2\"",
      any(grepl("^x1 \\* x2 ", lines_of(jlm(y ~ x1 * x2, data = d)))) &&
      "x1:x2" %in% .g1$coefficients_raw$term)
.g14 <- with_reg(lines_of(jlm(y ~ x1 * gf, data = d)))
check("G14 continuous x registered categorical: grouped under \"x1 * gf (ref = 1: a)\", one indented row per category",
      { h <- grep("^x1 \\* gf \\(ref = 1: a\\)$", .g14)
        length(h) == 1L && identical(sub(" .*$", "", .g14[h + 1:3]), c("", "", "")) &&
          all(startsWith(.g14[h + 1:3], c("  2: b ", "  3: c ", "  4: d "))) })
check("G15 ... in the regular regime the interaction rows' beta cells are blank (the dummy rows' are)",
      { m <- with_reg(quiet(jlm(y ~ x1 * gf, data = d)))
        h <- grep("^x1 \\* gf \\(ref", .g14)
        # 6 tokens per row: code, label, b, SE, t, p -- no beta token
        tok <- if (length(h) == 1L)
                 vapply(.g14[h + 1:3], function(l) length(strsplit(trimws(l), " +")[[1]]), integer(1))
               else -1L
        all(tok == 6L) && !is.na(.beta_of(m, "x1:gf_b")) })
check("G16 ... std = \"all\" shows those betas, and std = \"gelman\" shows every row's",
      { la <- with_reg(lines_of(jlm(y ~ x1 * gf, data = d, std = "all")))
        lg <- with_reg(lines_of(jlm(y ~ x1 * gf, data = d, std = "gelman")))
        tok <- function(ln) { h <- grep("^x1 \\* gf \\(ref", ln)
          if (length(h) != 1L) return(-1L)   # no grouped block: cannot pass vacuously
          vapply(ln[h + 1:3], function(l) length(strsplit(trimws(l), " +")[[1]]), integer(1)) }
        all(tok(la) == 7L) && all(tok(lg) == 7L) })
check("G17 a 0/1 predictor's interaction row is blanked with it, and carries the cleaned \"(1)\" form",
      { ln <- lines_of(jlm(y ~ x1 * b01, data = d))
        i <- grep("^x1 \\* b01 \\(1\\) ", ln)
        length(i) == 1L && length(strsplit(trimws(ln[i]), " +")[[1]]) == 8L })
check("G18 jlogistic groups the same way, with no beta column",
      { ln <- with_reg(lines_of(jlogistic(yb ~ x1 * gf, data = d)))
        length(grep("^x1 \\* gf \\(ref = 1: a\\)$", ln)) == 1L &&
          any(startsWith(ln, "  2: b ")) })
check("G19 three-way: a flat row naming the category, no header; two categoricals: both named in the header",
      { d19 <- d; d19$h3 <- factor(d19$h)
        l3 <- with_reg(lines_of(jlm(y ~ x1 * x2 * gf, data = d)))
        l2 <- with_reg(lines_of(jlm(y ~ gf * h3, data = d19)))
        any(grepl("^x1 \\* x2 \\* 2: b ", l3)) && !any(grepl("^x1 \\* x2 \\* gf", l3)) &&
          any(grepl("^gf \\* h3 \\(ref = 1: a \\* 1: p\\)$", l2)) &&
          any(startsWith(l2, "  2: b * 2: q ")) })
check("G20 variable.id = \"labels\": the header and a flat row's parts take the variable labels",
      { d20 <- d; labelled::var_label(d20$x1) <- "First score"; labelled::var_label(d20$gf) <- "Group"
        ln <- with_state(quiet(jdummy(d20, gf)), lines_of(jlm(y ~ x1 * gf, data = d20, variable.id = "labels")),
                         quiet(jdummy(d20, gf, remove = TRUE)))
        any(grepl("^First score \\* Group \\(ref = 1: a\\)$", ln)) })

# -- The legend tiers list every predictor (AUDIT-036) --------------------
check("G21 at full, a computed term is listed under Predictors as its bare text, beside the labelled variable",
      { d21 <- d; labelled::var_label(d21$x2) <- "Second score"
        ln <- with_state(quiet(joutput("full", quiet = TRUE)),
                         lines_of(jlm(y ~ I(x1 > 0) + x2, data = d21)),
                         quiet(joutput(NULL, quiet = TRUE)))
        i <- grep("^Predictors:$", ln)
        length(i) == 1L && identical(ln[i + 1L], "  I(x1 > 0)") &&
          identical(ln[i + 2L], "  x2 = Second score") })
check("G22 ... and so is an unlabelled plain variable (the \"=\" column sizes to the labelled names)",
      { d22 <- d; labelled::var_label(d22$x2) <- "Second score"
        ln <- with_state(quiet(joutput("full", quiet = TRUE)),
                         lines_of(jlm(y ~ x1 + x2, data = d22)),
                         quiet(joutput(NULL, quiet = TRUE)))
        i <- grep("^Predictors:$", ln)
        identical(ln[i + 1L], "  x1") && identical(ln[i + 2L], "  x2 = Second score") })
d$b01 <- NULL; d$b12 <- NULL

# =============================================================================
# H. Computed terms, hand-made products, std = "product", bare powers (S321)
# =============================================================================
# Four S321 items. (b) A computed term that is a power or a product of
# variables -- I(x^2), I(x^3), I(x * z) -- is recomputed from the rescaled
# inputs in both standardized refits (the square of the z-score, not the
# z-score of the square; Gelman 2008, section 3.1), where until v0.9.199 it
# was rescaled as its own column; any other computed term (log(), a
# rescaling, a condition) stays an input of its own. The note under the
# table names only what the model has: "an interaction", "a squared term"
# ("a power term" above 2), or both. (a) A predictor variable that equals the
# product of two others, or the square of one, is named in a note of its
# own; std = "product" shows each column standardized as it stands, every
# row included, with its own note, and beta_product rides on the return.
# (e) A single term raised to a power outside I() -- x1^2 -- is R's
# formula operator and enters as x1 alone; jlm() and jlogistic() warn once
# the model is fitted. The oracles are hand refits inside each check.
cat("\n--- H. Computed terms, hand-made products, std = \"product\", bare powers ---\n")

.zs <- function(x) (x - mean(x)) / stats::sd(x)
# The three notes, flattened (a wrapped sentence rejoined with spaces, then
# the pointer), built from the approved wordings.
.h_beta_note <- function(slot, hdr = "\u03b2") paste0(
  "In a model with ", slot, ", ", hdr, " comes from centered predictors: a ",
  hdr, " can have the opposite sign from its b, and other software may ",
  "report different ", hdr, " values. See ?jlm.")
.h_hand_note <- function(what, slot, hdr = "\u03b2", one = TRUE) paste0(
  what,
  if (one) " entered as its own variable, so " else ", each entered as its own variable, so ",
  hdr,
  if (one) " treats it as an ordinary predictor, not as " else " treats them as ordinary predictors, not as ",
  slot, ". See ?jlm.")
.h_prod_note <- function(slot_each) paste0(
  "Product \u03b2 treats ", slot_each, " as an ordinary predictor, as some ",
  "other software does. See ?jlm.")
.h_has <- function(ln, txt) grepl(txt, paste(ln, collapse = " "), fixed = TRUE)
.h_warn <- function(typed, base, what, pw) paste0(
  typed, " entered the model as ", base, ", not as ", base, " ", what,
  ". To include ", base, " ", what, ", write I(", base, "^", pw,
  ") in the formula.")
.prod_of <- function(m, term) {
  if (is.null(m$coefficients_raw)) return(NA_real_)
  v <- m$coefficients_raw$beta_product[m$coefficients_raw$term == term]
  if (length(v) == 1L) v else NA_real_
}
# Fixture columns for this Part: a hand-made product and square, the same
# product rounded to two decimals, and one equal to the product in the
# first 20 rows only.
d$x12  <- d$x1 * d$x2
d$x1sq <- d$x1^2
d$x12r <- round(d$x1 * d$x2, 2)
d$x12p <- d$x12; d$x12p[60] <- d$x12p[60] + 1
.zx <- .zs(d$x1); .gx <- .z2(d$x1); .zy <- .zs(d$y)

# -- (b) Power and product terms recomputed from the rescaled inputs -------
.h1 <- quiet(jlm(y ~ x1 + I(x1^2), data = d))
check("H01 I(x1^2): the regular beta is the refit on z-scored inputs, squared after",
      near(c(.beta_of(.h1, "x1"), .beta_of(.h1, "I(x1^2)")),
           unname(coef(stats::lm(.zy ~ .zx + I(.zx^2)))[2:3])))
check("H02 ... and the Gelman column the refit on 2-SD inputs, squared after (the outcome in its own units)",
      near(c(.gel_of(.h1, "x1"), .gel_of(.h1, "I(x1^2)")),
           unname(coef(stats::lm(d$y ~ .gx + I(.gx^2)))[2:3])))
check("H03 ... which is NOT the square's column rescaled as its own (the rule until v0.9.199), in either column",
      !near(.beta_of(.h1, "I(x1^2)"),
            coef(stats::lm(.zy ~ .zx + .zs(d$x1^2)))[[3]]) &&
      !near(.gel_of(.h1, "I(x1^2)"),
            coef(stats::lm(d$y ~ .gx + .z2(d$x1^2)))[[3]]))
check("H04 I(x1 * x2) gives the same beta and Gelman beta as x1 * x2, every row",
      { a <- quiet(jlm(y ~ x1 + x2 + I(x1 * x2), data = d))
        b <- quiet(jlm(y ~ x1 * x2, data = d))
        near(c(.beta_of(a, "x1"), .beta_of(a, "x2"), .beta_of(a, "I(x1 * x2)")),
             c(.beta_of(b, "x1"), .beta_of(b, "x2"), .beta_of(b, "x1:x2"))) &&
          near(c(.gel_of(a, "x1"), .gel_of(a, "I(x1 * x2)")),
               c(.gel_of(b, "x1"), .gel_of(b, "x1:x2"))) })
check("H05 a cube, and a square with no main effect, are recomputed the same way",
      { a <- quiet(jlm(y ~ I(x1^3) + x1, data = d))
        b <- quiet(jlm(y ~ I(x1^2), data = d))
        ha <- coef(stats::lm(.zy ~ I(.zx^3) + .zx))
        near(c(.beta_of(a, "I(x1^3)"), .beta_of(a, "x1")), unname(ha[2:3])) &&
          near(.beta_of(b, "I(x1^2)"), coef(stats::lm(.zy ~ I(.zx^2)))[[2]]) &&
          near(.gel_of(b, "I(x1^2)"), coef(stats::lm(d$y ~ I(.gx^2)))[[2]]) })
check("H06 a term that is an input of its own -- log(), a rescaling, a condition -- keeps its own-column rescaling",
      { m  <- quiet(jlm(y ~ log(x1 + 10) + I(2 * x2) + I(x1 > 0), data = d))
        lg <- log(d$x1 + 10); tw <- 2 * d$x2; cn <- as.numeric(d$x1 > 0)
        near(c(.beta_of(m, "log(x1 + 10)"), .beta_of(m, "I(2 * x2)"),
               .beta_of(m, "I(x1 > 0)")),
             unname(coef(stats::lm(.zy ~ .zs(lg) + .zs(tw) + .zs(cn)))[2:4])) &&
          near(c(.gel_of(m, "log(x1 + 10)"), .gel_of(m, "I(2 * x2)"),
                 .gel_of(m, "I(x1 > 0)")),
               unname(coef(stats::lm(d$y ~ .z2(lg) + .z2(tw) + .ctr(cn)))[2:4])) })
check("H07 the term is recomputed as written: a constant factor stays, and a log() inside the power is rescaled whole",
      { a <- quiet(jlm(y ~ x1 + I(2 * x1^2), data = d))
        b <- quiet(jlm(y ~ log(x1 + 10) + I(log(x1 + 10)^2), data = d))
        lz <- .zs(log(d$x1 + 10))
        near(.beta_of(a, "I(2 * x1^2)"), coef(stats::lm(.zy ~ .zx + I(2 * .zx^2)))[[3]]) &&
          near(.beta_of(b, "I(log(x1 + 10)^2)"), coef(stats::lm(.zy ~ lz + I(lz^2)))[[3]]) })

# -- (b) The note names what the model has --------------------------------
check("H08 a squared term: the note reads \"a squared term\", one blank below the table, the pointer on its own line",
      { ln <- lines_of(jlm(y ~ x1 + I(x1^2), data = d))
        i <- grep("^I\\(x1\\^2\\) ", ln); j <- grep("^In a model with", ln)
        k <- which(ln == "See ?jlm.")
        .h_has(ln, .h_beta_note("a squared term")) &&
          length(i) == 1L && length(j) == 1L && length(k) == 1L &&
          j == i + 2L && !nzchar(ln[i + 1L]) && all(nzchar(ln[j:k])) &&
          !nzchar(ln[k + 1L]) && grepl("^Outcome:", ln[k + 2L]) })
check("H09 a cube reads \"a power term\"; an interaction and a square read both; I(x1 * x2) alone reads \"an interaction\"; the Gelman header",
      .h_has(lines_of(jlm(y ~ x1 + I(x1^3), data = d)), .h_beta_note("a power term")) &&
      .h_has(lines_of(jlm(y ~ x1 * x2 + I(x1^2), data = d)),
             .h_beta_note("an interaction and a squared term")) &&
      .h_has(lines_of(jlm(y ~ x1 + x2 + I(x1 * x2), data = d)), .h_beta_note("an interaction")) &&
      .h_has(lines_of(jlm(y ~ x1 + I(x1^2), data = d, std = "gelman")),
             .h_beta_note("a squared term", "Gelman \u03b2")))
check("H10 no note when the only computed terms are inputs of their own, and none under std = \"none\"",
      !any(grepl("In a model with", lines_of(jlm(y ~ log(x1 + 10) + I(x1 > 0), data = d)), fixed = TRUE)) &&
      !any(grepl("In a model with", lines_of(jlm(y ~ x1 + I(x1^2), data = d, std = "none")), fixed = TRUE)))

# -- (a) A hand-made product or square is named ------------------------------
check("H11 a hand-made product: the note names it, one blank below the table, the pointer on its own line",
      { ln <- lines_of(jlm(y ~ x1 + x2 + x12, data = d))
        i <- grep("^x12 {2,}", ln); j <- grep("^x12 is x1 \\* x2", ln)
        k <- which(ln == "See ?jlm.")
        .h_has(ln, .h_hand_note("x12 is x1 * x2", "an interaction")) &&
          length(i) == 1L && length(j) == 1L && length(k) == 1L &&
          j == i + 2L && !nzchar(ln[i + 1L]) && all(nzchar(ln[j:k])) &&
          !nzchar(ln[k + 1L]) && grepl("^Outcome:", ln[k + 2L]) })
check("H12 ... its betas are the second convention's (each column standardized as it stands), and the centered-predictors note is absent",
      { m <- quiet(jlm(y ~ x1 + x2 + x12, data = d)); f <- stats::lm(y ~ x1 + x2 + x12, data = d)
        near(.beta_of(m, "x12"), coef(f)[["x12"]] * stats::sd(d$x12) / stats::sd(d$y)) &&
          !any(grepl("In a model with", lines_of(jlm(y ~ x1 + x2 + x12, data = d)), fixed = TRUE)) })
check("H13 a hand-made square is named as a square; a product and a square together, joined, with both kinds named",
      .h_has(lines_of(jlm(y ~ x1 + x1sq, data = d)),
             .h_hand_note("x1sq is x1 squared", "a squared term")) &&
      .h_has(lines_of(jlm(y ~ x1 + x2 + x12 + x1sq, data = d)),
             .h_hand_note("x12 is x1 * x2 and x1sq is x1 squared",
                          "an interaction and a squared term", one = FALSE)))
check("H14 not named: a product rounded to 2 decimals; one equal only in the first 20 rows; a duplicate the fit dropped as aliased",
      { lr <- lines_of(jlm(y ~ x1 + x2 + x12r, data = d))
        lp <- lines_of(jlm(y ~ x1 + x2 + x12p, data = d))
        d$x12b <- d$x12
        lb <- lines_of(jlm(y ~ x1 + x2 + x12 + x12b, data = d))
        d$x12b <- NULL
        !.h_has(lr, "its own variable") && !.h_has(lp, "its own variable") &&
          .h_has(lb, .h_hand_note("x12 is x1 * x2", "an interaction")) &&
          !.h_has(lb, "x12b is") })
check("H14b the same product also entered as x1 * x2: the fit drops the x1:x2 column, and the note names the hand-made one",
      { la <- lines_of(jlm(y ~ x1 * x2 + x12, data = d))
        !any(grepl("^x1 \\* x2 ", la)) &&
          .h_has(la, .h_hand_note("x12 is x1 * x2", "an interaction")) &&
          !any(grepl("In a model with", la, fixed = TRUE)) })
check("H15 the note names the Gelman column under gelman; there is none under \"none\", and \"product\" prints its own note instead",
      { lg <- lines_of(jlm(y ~ x1 + x2 + x12, data = d, std = "gelman"))
        ln <- lines_of(jlm(y ~ x1 + x2 + x12, data = d, std = "none"))
        lp <- lines_of(jlm(y ~ x1 + x2 + x12, data = d, std = "product"))
        .h_has(lg, .h_hand_note("x12 is x1 * x2", "an interaction", "Gelman \u03b2")) &&
          !.h_has(ln, "its own variable") &&
          !.h_has(lp, "its own variable") && .h_has(lp, .h_prod_note("each interaction")) })
check("H16 a computed term and a registered categorical's dummy columns are never a product's parts, so no internal name is shown",
      { d$gbx <- (d$g == "b") * d$x1
        la <- lines_of(jlm(y ~ x1 + x2 + I(x1 * x2), data = d))
        lb <- with_reg(lines_of(jlm(y ~ x1 + gf + gbx, data = d)))
        d$gbx <- NULL
        !.h_has(la, "its own variable") && !.h_has(lb, "its own variable") &&
          !any(grepl("gf_b", lb, fixed = TRUE)) })

# -- (a) std = "product" --------------------------------------------------
.h17 <- quiet(jlm(y ~ x1 * x2, data = d, std = "product"))
check("H17 Product beta is b times the design column's SD over the outcome's, every predictor row; the header reads \"Product beta\"",
      { f <- stats::lm(y ~ x1 * x2, data = d); mm <- stats::model.matrix(f)
        hand <- coef(f)[-1] * apply(mm[, -1, drop = FALSE], 2, stats::sd) / stats::sd(d$y)
        near(c(.prod_of(.h17, "x1"), .prod_of(.h17, "x2"), .prod_of(.h17, "x1:x2")),
             unname(hand)) &&
          any(grepl("Product \u03b2", lines_of(jlm(y ~ x1 * x2, data = d, std = "product")), fixed = TRUE)) })
check("H18 ... every row shown, a registered categorical's grouped rows and their interaction rows included",
      { la <- with_reg(lines_of(jlm(y ~ x1 * gf, data = d, std = "product")))
        tok <- function(ln, pat) { h <- grep(pat, ln)
          if (length(h) != 1L) return(-1L)
          vapply(ln[h + 1:3], function(l) length(strsplit(trimws(l), " +")[[1]]), integer(1)) }
        all(tok(la, "^gf \\(ref = 1: a\\)$") == 7L) && all(tok(la, "^x1 \\* gf \\(ref") == 7L) })
check("H19 the product note names what the model has; none for an additive model",
      .h_has(lines_of(jlm(y ~ x1 * x2, data = d, std = "product")), .h_prod_note("each interaction")) &&
      .h_has(lines_of(jlm(y ~ x1 + I(x1^2), data = d, std = "product")), .h_prod_note("each squared term")) &&
      .h_has(lines_of(jlm(y ~ x1 * x2 + I(x1^2), data = d, std = "product")),
             .h_prod_note("each interaction and squared term")) &&
      .h_has(lines_of(jlm(y ~ x1 + x1sq, data = d, std = "product")), .h_prod_note("each squared term")) &&
      !.h_has(lines_of(jlm(y ~ x1 + x2, data = d, std = "product")), "Product \u03b2 treats"))
check("H20 beta_product rides on the return at the default std; std_displayed records \"product\"; the choice error lists it",
      { m <- quiet(jlm(y ~ x1 * x2, data = d))
        near(.prod_of(m, "x1:x2"), .prod_of(.h17, "x1:x2")) &&
          identical(attr(.h17$coefficients_raw, "std_displayed"), "product") &&
          grepl("\"product\"", grab(jlm(y ~ x1, data = d, std = "beta")), fixed = TRUE) })

# -- (e) A single term raised to a power outside I() ---------------------
check("H21 y ~ x1 + x1^2 fits x1 alone and warns, naming what was typed and the rewrite",
      { m <- quiet(jlm(y ~ x1 + x1^2, data = d))
        identical(m$coefficients_raw$term, c("(Intercept)", "x1")) &&
          grepl(.h_warn("x1^2", "x1", "squared", 2L), flat(grab(jlm(y ~ x1 + x1^2, data = d))), fixed = TRUE) })
check("H22 the power word follows the power; the base is any single term, parentheses stripped",
      grepl(.h_warn("x1^3", "x1", "cubed", 3L), flat(grab(jlm(y ~ x1^3, data = d))), fixed = TRUE) &&
      grepl(.h_warn("x1^4", "x1", "to the power 4", 4L), flat(grab(jlm(y ~ x1^4, data = d))), fixed = TRUE) &&
      grepl(.h_warn("log(x2 + 10)^2", "log(x2 + 10)", "squared", 2L),
            flat(grab(jlm(y ~ log(x2 + 10)^2, data = d))), fixed = TRUE) &&
      grepl(.h_warn("(x1)^2", "x1", "squared", 2L), flat(grab(jlm(y ~ (x1)^2, data = d))), fixed = TRUE))
check("H23 no warning for (x1 + x2)^2, for I(x1^2), or for a power on the outcome's side",
      { a <- grab(jlm(y ~ (x1 + x2)^2, data = d)); m <- quiet(jlm(y ~ (x1 + x2)^2, data = d))
        !grepl("entered the model as", a, fixed = TRUE) && "x1:x2" %in% m$coefficients_raw$term &&
          !grepl("entered the model as", grab(jlm(y ~ x1 + I(x1^2), data = d)), fixed = TRUE) &&
          !grepl("entered the model as", grab(jlm(y^2 ~ x1, data = d)), fixed = TRUE) })
check("H24 one warning per term",
      { w <- flat(grab(jlm(y ~ x1^2 + x2^2, data = d)))
        grepl(.h_warn("x1^2", "x1", "squared", 2L), w, fixed = TRUE) &&
          grepl(.h_warn("x2^2", "x2", "squared", 2L), w, fixed = TRUE) })
check("H25 jlogistic warns the same way and fits x1 alone",
      { m <- quiet(jlogistic(yb ~ x1 + x1^2, data = d))
        identical(m$coefficients_raw$term, c("(Intercept)", "x1")) &&
          grepl(.h_warn("x1^2", "x1", "squared", 2L), flat(grab(jlogistic(yb ~ x1 + x1^2, data = d))), fixed = TRUE) })
check("H26 the warning is given only once a model is fitted: a call that stops first does not give it",
      { g <- grab(jlm(y ~ k^2, data = d))
        grepl("has only one value in the analysis sample", flat(g), fixed = TRUE) &&
          !grepl("entered the model as", g, fixed = TRUE) })
d$x12 <- NULL; d$x1sq <- NULL; d$x12r <- NULL; d$x12p <- NULL

# =============================================================================
# I. Names inside a computed term, as lm() reads them (S323)
# =============================================================================
# The S322 rulings, built at S323. jt(), jaov(), jlm() and jlogistic() read a
# name inside a computed term the way lm() does: in the data first, then in
# the formula's environment, whatever its shape -- a single value
# (I(x1 > cut_i)), a set of codes (I(nm %in% codes_i)), a list element
# (par_i$thr), a power (I(x1^pw_i)) -- where until v0.9.200 every such name
# stopped "Variable(s) not found". A bare name is still a variable, a name
# found nowhere still stops, and the variable list the Case Processing
# Summary receives leaves the constant out. The one exception to parity: a
# data frame named inside a term (d$y ~ d$x1) is refused with the variables
# on their own, since the resolver would read it from the raw frame. A power
# terms() cannot read (y ~ x1^pw_i) stops in house voice. I(x1^pw_i) is
# recomputed from the rescaled input like I(x1^2), and its row keeps the
# typed text. Riders: jcrosstab lets a constant reach its computed-term
# refusal, now ahead of the two-sides check; the VIF table and its notes
# read " * "; jplot's formula path refuses a computed term. Every oracle is
# base R or the literal form of the same call; every printed fix line RUNS.
cat("\n--- I. Names inside a computed term, as lm() reads them ---\n")

# Constants for this Part (the fixture has a COLUMN named k, so none is k).
# Each name is one nothing else defines: a mutant run at S323 found I05 (a
# constant named cc, which cps_check.R leaves in the global environment under
# run_all.R) and I06 (a list element named cut, base R's cut()) passing on a
# broken lookup, because those names resolved somewhere else.
cut_i   <- 0
pw_i    <- 2
pw3_i   <- 3
codes_i <- c(10, 20)
par_i   <- list(thr = 0)
long_i  <- seq_len(.nrow + 5L)
look_i  <- data.frame(cut = 0)
# Uncentered copies of x1 and x2, so the interaction's VIF passes 10.
d$xs1 <- d$x1 + 10; d$xs2 <- d$x2 + 10
# .i_fix(): the message's last line, which must be an indented call;
# .i_runs(): that line evaluated, output swallowed -- FALSE when it errors
# or when the message has no such line (the S303 rule: remedy lines are
# run, not read).
.i_fix  <- function(msg) {
  ln <- strsplit(msg, "\n", fixed = TRUE)[[1]]
  if (length(ln) && grepl("^  j[a-z]+\\(", ln[length(ln)])) trimws(ln[length(ln)]) else ""
}
.i_runs <- function(msg) {
  fx <- .i_fix(msg)
  nzchar(fx) && !is.null(quiet({ eval(parse(text = fx)); TRUE }))
}
.i_term_b <- function(m, term) b_of(m, term)
.i_has    <- function(txt, needle) isTRUE(grepl(needle, txt, fixed = TRUE))

# -- The constant rule, the four functions --------------------------------
check("I01 jlm(): a constant inside a computed term resolves in the formula's environment, as in lm(); the row reads as typed",
      { m <- quiet(jlm(y ~ I(x1 > cut_i), data = d))
        f <- stats::lm(y ~ I(x1 > cut_i), data = d)
        identical(m$coefficients_raw$term, c("(Intercept)", "I(x1 > cut_i)")) &&
          near(.i_term_b(m, "I(x1 > cut_i)"), coef(f)[["I(x1 > cut_i)TRUE"]]) })
check("I02 jlogistic() the same",
      { m <- quiet(jlogistic(yb ~ I(x1 > cut_i), data = d))
        f <- stats::glm(yb ~ I(x1 > cut_i), data = d, family = stats::binomial)
        near(.i_term_b(m, "I(x1 > cut_i)"), coef(f)[["I(x1 > cut_i)TRUE"]]) })
check("I03 jt(): the t of the literal threshold, and of base R's t.test",
      { a <- quiet(jt(y ~ I(x1 > cut_i), data = d))$t
        b <- quiet(jt(y ~ I(x1 > 0), data = d))$t
        near(a, b) &&
          near(abs(a), abs(unname(stats::t.test(y ~ I(x1 > 0), data = d,
                                                 var.equal = TRUE)$statistic))) })
check("I04 jaov(): the F of the literal threshold",
      near(quiet(jaov(y ~ I(x1 > cut_i), data = d))$f,
           quiet(jaov(y ~ I(x1 > 0), data = d))$f))
check("I05 a constant in the CALLING function's frame resolves there (environment(formula))",
      { fit <- function() { cut_f <- 0; jlm(y ~ I(x1 > cut_f), data = d) }
        near(.i_term_b(quiet(fit()), "I(x1 > cut_f)"),
             .i_term_b(quiet(jlm(y ~ I(x1 > cut_i), data = d)), "I(x1 > cut_i)")) })
check("I06 a set of codes (%in%) and a list element resolve too; the name after $ is not looked up",
      { a <- quiet(jlm(y ~ I(nm %in% codes_i), data = d))
        b <- quiet(jlm(y ~ I(x1 > par_i$thr), data = d))
        near(.i_term_b(a, "I(nm %in% codes_i)"),
             coef(stats::lm(y ~ I(nm %in% codes_i), data = d))[[2]]) &&
          near(.i_term_b(b, "I(x1 > par_i$thr)"),
               coef(stats::lm(y ~ I(x1 > 0), data = d))[[2]]) })
check("I07 the constant is left out of the variable list the Case Processing Summary receives",
      identical(quiet(jlm(y ~ I(x1 > cut_i), data = d))$sample_info$analysis_vars,
                c("y", "x1")) &&
        identical(quiet(jt(y ~ I(x1 > cut_i), data = d))$sample_info$analysis_vars,
                  c("y", "x1")))

# -- What still stops ------------------------------------------------------
check("I08 a mistyped variable inside a term keeps the not-found stop, naming it",
      .i_has(flat(grab(jlm(y ~ I(x9 > cut_i), data = d))),
          "jlm(): x9 was not found in the d data frame."))
check("I09 a mistyped constant is found nowhere and stops the same way",
      .i_has(flat(grab(jlm(y ~ I(x1 > cut_x), data = d))),
          "jlm(): cut_x was not found in the d data frame."))
check("I10 a BARE name stays a variable: a workspace constant on its own is refused as before",
      .i_has(flat(grab(jlm(y ~ cut_i, data = d))),
          "jlm(): cut_i was not found in the d data frame."))
# I11 FLIPPED at S324: a workspace vector of the wrong length now stops at
# the front door, ahead of the resolver's count stop, which section J's J13
# keeps reachable through a call the check does not run (rev()).
check("I11 a workspace vector of the wrong length stops at the front door (S324), naming it",
      .i_has(flat(grab(jlm(y ~ I(x1 * long_i), data = d))),
          "jlm(): In I(x1 * long_i), long_i has 125 values for the 120 cases in the d data frame."))

# -- A named power: I(x1^pw_i) reads as I(x1^2) ----------------------------
.i12a <- quiet(jlm(y ~ x1 + I(x1^pw_i), data = d))
.i12b <- quiet(jlm(y ~ x1 + I(x1^2), data = d))
check("I12 I(x1^pw_i) equals I(x1^2) in b and in every standardized column (beta, Gelman, product)",
      { ra <- .i12a$coefficients_raw; rb <- .i12b$coefficients_raw
        cols <- c("b", "beta", "beta_gelman", "beta_product")
        !is.null(ra) && !is.null(rb) &&
          near(unlist(ra[2:3, cols]), unlist(rb[2:3, cols])) })
check("I13 ... and the note names a squared term; a named cube, a power term",
      .h_has(lines_of(jlm(y ~ x1 + I(x1^pw_i), data = d)), .h_beta_note("a squared term")) &&
        .h_has(lines_of(jlm(y ~ x1 + I(x1^pw3_i), data = d)), .h_beta_note("a power term")))
check("I14 the row reads as typed, I(x1^pw_i), never the value",
      { ln <- lines_of(jlm(y ~ x1 + I(x1^pw_i), data = d))
        any(startsWith(ln, "I(x1^pw_i) ")) && !any(grepl("I(x1^2)", ln, fixed = TRUE)) })

# -- The data-frame exception ----------------------------------------------
.i15 <- grab(jlm(d$y ~ d$x1, data = d))
check("I15 a data frame named inside a term is refused, the term first, with the corrected call",
      .i_has(.i15, paste0("jlm(): d$y names the d data frame inside the formula.\n",
                       "Name each variable on its own, and the data frame after ",
                       "the formula:\n  jlm(y ~ x1, data = d)")))
check("I16 ... and the corrected call runs",
      .i_runs(.i15))
.i17 <- list(grab(jt(d$y ~ d$lg, data = d)),
             grab(jaov(d$y ~ d$g, data = d)),
             grab(jlogistic(d$yb ~ d$x1, data = d)))
check("I17 jt, jaov and jlogistic refuse it too, each naming itself in the lead and the fix, which runs",
      .i_has(.i17[[1]], "jt(): d$y names the d data frame") &&
        identical(.i_fix(.i17[[1]]), "jt(y ~ lg, data = d)") &&
        .i_has(.i17[[2]], "jaov(): d$y names the d data frame") &&
        identical(.i_fix(.i17[[2]]), "jaov(y ~ g, data = d)") &&
        .i_has(.i17[[3]], "jlogistic(): d$yb names the d data frame") &&
        identical(.i_fix(.i17[[3]]), "jlogistic(yb ~ x1, data = d)") &&
        all(vapply(.i17, .i_runs, logical(1))))
check("I18 the refusal comes before the not-found stop; one reference takes the singular",
      { a <- grab(jlm(d$y ~ x9, data = d))
        b <- grab(jlm(y ~ log(d$x2 + 10), data = d))
        .i_has(a, "d$y names the d data frame") && !.i_has(a, "not found") &&
          .i_has(b, paste0("Name the variable on its own, and the data frame after ",
                        "the formula:\n  jlm(y ~ log(x2 + 10), data = d)")) })
check("I19 a reference the fix cannot rewrite (d[1, \"x1\"]) gets the sentence without a call, alone or beside one it can",
      { a <- grab(jlm(y ~ I(x1 > d[1, "x1"]), data = d))
        b <- grab(jlm(y ~ I(x1 > d[1, "x1"]) + d$x2, data = d))
        .i_has(flat(a), paste0("Name each variable on its own, and the data frame ",
                            "after the formula.")) && !.i_has(a, "data = d") &&
          .i_has(flat(b), "and the data frame after the formula.") &&
          !.i_has(b, "data = d") })
check("I20 a summary of the frame (mean(d$x1)) and a lookup table get the save-it-first form",
      .i_has(flat(grab(jlm(y ~ I(x1 > mean(d$x1)), data = d))),
          "Save what you need from the d data frame under a new name, and use that name in the formula.") &&
        .i_has(flat(grab(jlm(y ~ I(x1 > look_i$cut), data = d))),
            "Save what you need from the look_i data frame under a new name, and use that name in the formula."))

check("I20b under a juse() default of ANOTHER frame, the fix names the frame the formula used",
      { e_i <- data.frame(z = 1:3)
        a <- with_state(quiet(juse(e_i)), grab(jlm(d$y ~ d$x1)), quiet(juse(NULL)))
        identical(.i_fix(a), "jlm(y ~ x1, data = d)") })

# -- A power terms() cannot read -------------------------------------------
check("I21 y ~ x1^pw_i is refused in house voice, with the I() form",
      .i_has(flat(grab(jlm(y ~ x1^pw_i, data = d))),
          paste0("jlm(): x1^pw_i is not a valid power in a formula. To include ",
                 "x1 to the power pw_i, write I(x1^pw_i) in the formula.")))
check("I22 a power of a sum gets the whole-number form; jlogistic refuses the same way",
      .i_has(flat(grab(jlm(y ~ (x1 + x2)^pw_i, data = d))),
          paste0("(x1 + x2)^pw_i is not a valid power in a formula. Use a whole ",
                 "number after ^, as in (x1 + x2)^2.")) &&
        .i_has(flat(grab(jlogistic(yb ~ x1^pw_i, data = d))),
            "jlogistic(): x1^pw_i is not a valid power in a formula."))

# -- jcrosstab ---------------------------------------------------------------
check("I23 jcrosstab(): a constant reaches the computed-term refusal, not a not-found stop",
      { a <- flat(grab(jcrosstab(g ~ I(x1 > cut_i), data = d)))
        .i_has(a, "The formula applies a function to a variable") &&
          .i_has(a, "I(x1 > cut_i)") && !.i_has(a, "not found") })
check("I24 ... and that refusal comes ahead of the two-sides check",
      { a <- flat(grab(jcrosstab(I(x1 > cut_i) ~ I(x2 > cut_i), data = d)))
        .i_has(a, "The formula applies a function to a variable") &&
          !.i_has(a, "appears on both sides") })
check("I25 jcrosstab refuses a data frame named inside a term, with the corrected call, which runs",
      { a <- grab(jcrosstab(d$g ~ d$h, data = d))
        .i_has(a, "jcrosstab(): d$g names the d data frame") &&
          identical(.i_fix(a), "jcrosstab(g ~ h, data = d)") && .i_runs(a) })

# -- The VIF table reads " * " ----------------------------------------------
.i26 <- lines_of(jlm(y ~ xs1 * xs2, data = d, diagnostics = "vif"))
.i26l <- lines_of(jlogistic(yb ~ xs1 * xs2, data = d, diagnostics = "vif"))
.vif_rows <- function(ln) {
  i <- grep("^VIF \\(Variance Inflation Factors\\)$", ln)
  if (length(i) != 1L) return(character(0))
  ln[(i + 3L):(i + 5L)]
}
check("I26 the VIF table's Variable column reads xs1 * xs2, in jlm and jlogistic; the returned vif keeps R's name",
      any(startsWith(.vif_rows(.i26), "xs1 * xs2 ")) &&
        any(startsWith(.vif_rows(.i26l), "xs1 * xs2 ")) &&
        !any(grepl("xs1:xs2", c(.i26, .i26l), fixed = TRUE)) &&
        "xs1:xs2" %in% names(quiet(jlm(y ~ xs1 * xs2, data = d, diagnostics = "vif"))$vif))
check("I27 ... and so does its VIF > 10 note",
      .i_has(paste(.i26, collapse = " "), "xs1 * xs2 (VIF = ") &&
        .i_has(paste(.i26l, collapse = " "), "xs1 * xs2 (VIF = "))

# -- jplot's formula path ----------------------------------------------------
check("I28 jplot(y ~ I(x1 > 0), d) is refused as a computed term (it plotted raw x1)",
      .i_has(flat(grab(jplot(y ~ I(x1 > 0), d))),
          "jplot(): The formula applies a function to a variable: I(x1 > 0)."))
check("I29 ... and with a constant gives that reason, not the variable count",
      { a <- flat(grab(jplot(y ~ I(x1 > cut_i), d)))
        .i_has(a, "The formula applies a function to a variable") &&
          !.i_has(a, "Only one independent variable") })
check("I30 jplot refuses a data frame named inside a term, with the corrected call, which plots",
      { a <- grab(jplot(d$y ~ d$x1, d))
        .i_has(a, "jplot(): d$y names the d data frame") &&
          identical(.i_fix(a), "jplot(y ~ x1, data = d)") &&
          inherits(quiet(eval(parse(text = .i_fix(a)))), "ggplot") })
check("I31 control: jplot(y ~ x1, d) still plots",
      inherits(quiet(jplot(y ~ x1, d)), "ggplot"))

d$xs1 <- NULL; d$xs2 <- NULL
rm(list = intersect(c("cut_i", "pw_i", "pw3_i", "codes_i", "par_i", "long_i",
                      "look_i", "e_i"), ls()))

# =============================================================================
# J. A workspace vector a computed term would recycle (S324)
# =============================================================================
# The S323 item, built at S324: the second deliberate departure from lm()
# parity. A name inside a computed term resolves in the formula's environment
# (section I), and nothing checked its length, so I(x1 * v3_j) with three
# values fitted on R's recycled 1, 2, 3, 1, 2, 3, ... -- behind a "longer
# object length" warning, or none when the row count divides by the length.
# It now stops at the front door (.jst_check_formula_vars) when such a
# vector -- more than one value, not one per row of the data after filtering
# -- is combined value by value: arithmetic, a comparison, & | !, ifelse(),
# pmin(), pmax(). A single value, a set used with %in%, a lookup indexed by a
# variable and a summary are accepted. A vector with one value per row of the
# frame as given, cut down by a filter, gets the add-it-to-the-frame fix,
# which RUNS; any other length the requirement. The check looks operands up
# and never runs a call, so it draws no random number. Every constant's name
# ends _j, a name nothing else defines (the S323 convention).
cat("\n--- J. A workspace vector a computed term would recycle ---\n")

v3_j   <- c(1, 2, 3)                  # 120 rows divide by 3: R would not warn
v7_j   <- seq_len(7)                  # 120 %% 7 = 1: R would warn
v120_j <- seq_len(.nrow) / 10         # one value per row of d
s_j    <- 0
set_j  <- c(10, 20)
w_j    <- c(0.5, 1, 2)                # a lookup by nm / 10 (nm is 10, 20, 30)
p2_j   <- c(2, 3)
lv_j   <- c(TRUE, FALSE, TRUE)
l_j    <- list(w = c(1, 2, 3), s = 2)
long_j <- seq_len(.nrow + 5L)
.j_has <- function(txt, needle) isTRUE(grepl(needle, flat(txt), fixed = TRUE))
.j_req <- function(fn, term, op, n, where) {
  paste0(fn, "(): In ", term, ", ", op, " has ", n, " values for the ", where,
         ". Use a single value, or one value for each case.")
}
.j_in_d <- "120 cases in the d data frame"

check("J01 jlm(): a vector of 3 values used value by value stops, naming the term, the vector and its length",
      identical(flat(grab(jlm(y ~ I(x1 * v3_j), data = d))),
                .j_req("jlm", "I(x1 * v3_j)", "v3_j", 3, .j_in_d)))
check("J02 a length R would warn about stops the same way, before R's warning",
      { m <- grab(jlm(y ~ I(x1 * v7_j), data = d))
        .j_has(m, .j_req("jlm", "I(x1 * v7_j)", "v7_j", 7, .j_in_d)) &&
          !.j_has(m, "longer object length") })
check("J03 a comparison stops, in jt, jaov and jlogistic too, each naming itself",
      .j_has(grab(jlm(y ~ I(x1 > v3_j), data = d)),
             .j_req("jlm", "I(x1 > v3_j)", "v3_j", 3, .j_in_d)) &&
        .j_has(grab(jt(y ~ I(x1 > v3_j), data = d)), "jt(): In I(x1 > v3_j), v3_j has 3 values") &&
        .j_has(grab(jaov(I(y * v3_j) ~ g, data = d)), "jaov(): In I(y * v3_j), v3_j has 3 values") &&
        .j_has(grab(jlogistic(yb ~ I(x1 * v3_j), data = d)),
               "jlogistic(): In I(x1 * v3_j), v3_j has 3 values"))
check("J04 the outcome's side is checked too",
      .j_has(grab(jt(I(y * v3_j) ~ lg, data = d)), "jt(): In I(y * v3_j), v3_j has 3 values"))
check("J05 a single value, a set with %in%, a lookup by a variable and a summary of a vector are accepted, each fitting as lm() does",
      { fmls <- list(quote(y ~ I(x1 > s_j)), quote(y ~ I(nm %in% set_j)),
                     quote(y ~ I(x1 * w_j[nm / 10])), quote(y ~ I(x1 - max(v3_j))))
        all(vapply(fmls, function(p) {
          f <- stats::as.formula(p, env = globalenv())
          m <- quiet(jlm(f, data = d))
          !is.null(m) && near(m$coefficients_raw$b[2],
                              unname(coef(stats::lm(f, data = d))[2]))
        }, logical(1))) })
check("J06 a vector with one value per row is accepted, and fits as lm() does",
      near(b_of(quiet(jlm(y ~ I(x1 * v120_j), data = d)), "I(x1 * v120_j)"),
           coef(stats::lm(y ~ I(x1 * v120_j), data = d))[[2]]))
.j07 <- grab(jlm(y ~ I(x1 * v120_j), data = d, subset = nm > 10))
check("J07 under subset =, a vector with one value per row of the frame stops with the add-it-to-the-frame form, its fix on its own line",
      .j_has(.j07, paste0("jlm(): In I(x1 * v120_j), v120_j has 120 values, one for ",
                          "each case in the d data frame, but filtering leaves 80. ",
                          "Add v120_j to the d data frame as a variable: ",
                          "d$v120_j <- v120_j")) &&
        endsWith(.j07, "80.\nAdd v120_j to the d data frame as a variable:\n  d$v120_j <- v120_j"))
check("J08 ... and that line, run as printed, lets the same call fit, as lm() fits it",
      { ln <- strsplit(.j07, "\n", fixed = TRUE)[[1]]
        fx <- if (length(ln)) ln[length(ln)] else ""
        ok <- grepl("^  d\\$v120_j <- ", fx)
        if (ok) eval(parse(text = trimws(fx)), envir = globalenv())
        m  <- quiet(jlm(y ~ I(x1 * v120_j), data = d, subset = nm > 10))
        r  <- ok && "v120_j" %in% names(d) &&
          near(b_of(m, "I(x1 * v120_j)"),
               coef(stats::lm(y ~ I(x1 * v120_j), data = d, subset = nm > 10))[[2]])
        d$v120_j <- NULL
        r })
check("J09 a stored jsubset() and a stored jcomplete() cut the frame down the same way",
      { a <- with_state(quiet(jsubset(d, nm > 10)),
                        grab(jlm(y ~ I(x1 * v120_j), data = d)),
                        quiet(jsubset(d, NULL)))
        b <- with_state(quiet(jcomplete(d, xa)),
                        grab(jlm(y ~ I(x1 * v120_j), data = d)),
                        quiet(jcomplete(d, NULL)))
        .j_has(a, "v120_j has 120 values, one for each case in the d data frame, but filtering leaves 80.") &&
          .j_has(b, "v120_j has 120 values, one for each case in the d data frame, but filtering leaves 90.") })
check("J10 any other length under a filter takes the requirement, with the count left after filtering",
      identical(flat(grab(jlm(y ~ I(x1 * v3_j), data = d, subset = nm > 10))),
                .j_req("jlm", "I(x1 * v3_j)", "v3_j", 3, "80 cases left after filtering")))
check("J11 inside parentheses, under a unary minus, inside log() and as a power, the vector is found and named",
      .j_has(grab(jlm(y ~ I(x1 * (v3_j + 1)), data = d)), "In I(x1 * (v3_j + 1)), v3_j has 3 values") &&
        .j_has(grab(jlm(y ~ I(x1 * -v3_j), data = d)), "In I(x1 * -v3_j), v3_j has 3 values") &&
        .j_has(grab(jlm(y ~ log(abs(x1) + v3_j), data = d)), "In log(abs(x1) + v3_j), v3_j has 3 values") &&
        .j_has(grab(jlm(y ~ I(x1^p2_j), data = d)), "In I(x1^p2_j), p2_j has 2 values"))
check("J12 a literal vector, 1:5, a list element by $ and by [[ ]], and a logical vector with & and ! stop too",
      .j_has(grab(jlm(y ~ I(x1 * c(1, 2, 3)), data = d)), "c(1, 2, 3) has 3 values") &&
        .j_has(grab(jlm(y ~ I(x1 * 1:5), data = d)), "In I(x1 * 1:5), 1:5 has 5 values") &&
        .j_has(grab(jlm(y ~ I(x1 * l_j$w), data = d)), "l_j$w has 3 values") &&
        .j_has(grab(jlm(y ~ I(x1 * l_j[["w"]]), data = d)), "l_j[[\"w\"]] has 3 values") &&
        .j_has(grab(jlm(y ~ I(x1 > 0 & lv_j), data = d)), "lv_j has 3 values") &&
        .j_has(grab(jlm(y ~ I(x1 > 0 & !lv_j), data = d)), "lv_j has 3 values") &&
        !is.null(quiet(jlm(y ~ I(x1 * l_j$s), data = d))))
check("J13 ifelse(), pmin() and pmax() combine value by value",
      .j_has(grab(jlm(y ~ I(ifelse(x1 > 0, v3_j, 0)), data = d)), "v3_j has 3 values") &&
        .j_has(grab(jlm(y ~ I(pmin(x1, v3_j)), data = d)), "In I(pmin(x1, v3_j)), v3_j has 3 values") &&
        .j_has(grab(jlm(y ~ I(pmax(v3_j, x1)), data = d)), "In I(pmax(v3_j, x1)), v3_j has 3 values"))
check("J14 a call on a vector is not run by the check: rev() reaches the resolver, whose count stop still fires",
      { m <- grab(jlm(y ~ I(x1 * rev(long_j)), data = d))
        .j_has(m, "The formula term I(x1 * rev(long_j)) produces 125 values for 120 cases.") &&
          !.j_has(m, "has 125 values") })
check("J15 the check draws no random number: I(x1 + rnorm(120)) fits as the same draw saved first",
      { set.seed(324); a <- quiet(jlm(y ~ I(x1 + rnorm(120)), data = d))
        set.seed(324); r_j <- rnorm(120)
        b <- quiet(jlm(y ~ I(x1 + r_j), data = d))
        near(a$coefficients_raw$b, b$coefficients_raw$b) })
check("J16 a name that is a variable of the data is read from the data, whatever the workspace holds",
      { assign("nm", c(1, 2, 3), envir = globalenv())
        m <- quiet(jlm(y ~ I(x1 * nm), data = d))
        rm("nm", envir = globalenv())
        near(b_of(m, "I(x1 * nm)"), coef(stats::lm(y ~ I(x1 * nm), data = d))[[2]]) })

rm(list = intersect(c("v3_j", "v7_j", "v120_j", "s_j", "set_j", "w_j", "p2_j",
                      "lv_j", "l_j", "long_j", "r_j"), ls()))

# =============================================================================
# SECTION K -- THE GROUP-COUNT STOPS; jcrosstab()'s TITLE; jplot()'s BOX LINE
#              AND A DATA FRAME'S COLUMN (S338, v0.9.212)
# =============================================================================
# Fix Slate 1. (1) jt(), jaov() and jcrosstab() stop when a grouping variable
# is left with too few categories. The count agrees in number (it read
# "1 category(ies)"); a stored setting that is active is named as a setting
# -- "after applying the jcomplete setting and the jsubset filter (g ==
# "a")", where it read "after applying jcomplete and jsubset (g == "a")" --
# and is named whenever it is active for the frame, not only when the frame
# came from juse(): with the frame named, jt() said "has 1 categories ...
# Use jaov() for more than 2 categories". (2) The two model stops:
# "This predictor has" / "These predictors have"; "for where the cases were
# excluded". (3) jcrosstab() prints its title where jt() does (AUDIT-026).
# (4) jplot()'s box refusal builds its line from what the call gave, and the
# line runs. (5) jplot() reads a data frame's column from the call, so a
# tibble's misspelled column no longer warns ahead of the stop.
.k_has <- function(txt, needle) grepl(needle, txt, fixed = TRUE)
# .k_pre(): what a call PRINTS before it stops, colour stripped and empty
# lines dropped (the colour reset after a title's newline leaves one).
.k_pre <- function(expr) {
  out <- utils::capture.output(suppressMessages(suppressWarnings(
    tryCatch(expr, error = function(e) invisible(NULL)))))
  out <- gsub("\033\\[[0-9;]*[A-Za-z]", "", out)
  out[nzchar(out)]
}
# .k_warns(): the warnings a call raises, whether or not it then stops.
.k_warns <- function(expr) {
  w <- character(0)
  zz <- textConnection(".junk", "w", local = TRUE)
  sink(zz, type = "output")
  on.exit({ sink(type = "output"); close(zz) }, add = TRUE)
  withCallingHandlers(
    tryCatch(expr, error = function(e) NULL),
    warning = function(x) {
      w <<- c(w, conditionMessage(x)); invokeRestart("muffleWarning")
    })
  w
}
# .k_fix(): the first indented jplot(...) line of a message, as typed.
.k_fix <- function(msg) {
  ln <- strsplit(msg, "\n", fixed = TRUE)[[1]]
  trimws(ln[grepl("^  jplot\\(", ln)])[1L]
}
# .k_geom(): the geometry of the first layer of the plot a line draws, the
# line run in an environment that can hold a data frame of its own.
.k_geom <- function(line, env = globalenv()) {
  p <- quiet(eval(parse(text = line), envir = env))
  if (inherits(p, "ggplot")) class(p$layers[[1L]]$geom)[1L] else NA_character_
}
# Since S346 the filter names gn, not g: a filter that names the grouping
# variable is the cause and gets a stop of its own (section P), and K01-K10
# hold the context form, a stored filter that leaves one category of g
# through another variable (gn is "5" exactly where g is "a").
.k_on  <- function() quiet(jsubset(d, gn == "5"))
.k_off <- function() quiet(jsubset(d, NULL))

# ---- K01-K10: the group-count stops -----------------------------------------
.k01 <- with_state(.k_on(), grab(jt(y ~ g, data = d)), .k_off())
check("K01 jt(), a stored filter on a NAMED frame: 1 category, in number, the filter named as a setting, a sentence a line (it said 'has 1 categories ... Use jaov() for more than 2 categories')",
      identical(flat(.k01), paste0(
        "jt(): 'g' has 1 category after applying the jsubset filter (gn == \"5\"). ",
        "A t-test requires exactly 2. ",
        "Check whether your jsubset or jcomplete settings are excluding one of the groups.")) &&
        .k_has(.k01, ".\nA t-test requires exactly 2.\nCheck whether your") &&
        !.k_has(.k01, "jaov()"))
check("K02 ... and the same message, to the letter, when the frame comes from juse()",
      identical(with_state({ .k_on(); quiet(juse(d)) }, grab(jt(y ~ g)),
                           { quiet(juse(NULL)); .k_off() }), .k01))
check("K03 MORE than 2 categories is jaov()'s case, with or without a stored filter, and blames no setting",
      { want <- paste0("jt(): 'g' has 4 categories.\nA t-test requires exactly 2.\n",
                       "Use jaov() for more than 2 categories.")
        a <- grab(jt(y ~ g, data = d))
        b <- with_state(quiet(jsubset(d, x1 > -100)), grab(jt(y ~ g, data = d)), .k_off())
        identical(a, want) && identical(b, want) })
check("K04 one category and no stored setting: two lines, and no jaov()",
      identical(grab(jt(y ~ k, data = d)),
                "jt(): 'k' has 1 category.\nA t-test requires exactly 2."))
.k05 <- with_state({ quiet(jcomplete(d, x1)); .k_on() }, grab(jaov(y ~ g, data = d)),
                   { .k_off(); quiet(jcomplete(d, NULL)) })
check("K05 jaov(), a stored jcomplete() and a stored jsubset(): both named as settings, and-joined",
      identical(flat(.k05), paste0(
        "jaov(): 'g' has 1 category after applying the jcomplete setting and ",
        "the jsubset filter (gn == \"5\"). An ANOVA requires at least 2. ",
        "Check whether your jsubset or jcomplete settings are excluding one or more groups.")) &&
        .k_has(.k05, ".\nAn ANOVA requires at least 2.\nCheck whether your"))
check("K06 jaov(), no stored setting: two lines",
      identical(grab(jaov(y ~ k, data = d)),
                "jaov(): 'k' has 1 category.\nAn ANOVA requires at least 2 groups."))
.k07 <- with_state(.k_on(), grab(jcrosstab(g ~ lg, data = d)), .k_off())
# RE-PINNED S347 (v0.9.220): jcrosstab() takes the filters' line jt() and
# jaov() have (the S346 group-count item); it had none.
check("K07 jcrosstab(), with a stored filter and without",
      identical(flat(.k07), paste0(
        "jcrosstab(): 'g' has 1 category after applying the jsubset filter (gn == \"5\"). ",
        "A cross-tabulation requires at least 2 categories for each variable. ",
        "Check whether your jsubset or jcomplete settings are excluding the other categories.")) &&
        identical(grab(jcrosstab(k ~ g, data = d)), paste0(
          "jcrosstab(): 'k' has 1 category.\n",
          "A cross-tabulation requires at least 2 categories for each variable.")))
check("K08 a stored filter that is turned OFF is not named",
      identical(with_state({ .k_on(); quiet(jsubset(d, off)) }, grab(jt(y ~ k, data = d)),
                           .k_off()),
                "jt(): 'k' has 1 category.\nA t-test requires exactly 2."))
check("K09 .jst_settings_context(): no name, a name of two parts and a frame with no setting give nothing",
      identical(jstats:::.jst_settings_context(NULL), "") &&
        identical(jstats:::.jst_settings_context(c("d", "e")), "") &&
        identical(jstats:::.jst_settings_context("no_such_frame_k"), "") &&
        identical(with_state(.k_on(), jstats:::.jst_settings_context("d"), .k_off()),
                  " after applying the jsubset filter (gn == \"5\")"))
check("K10 none of them carries the shortcut, 'categories' for one, or the spaced 'jsubset ('",
      { all_k <- c(.k01, .k05, .k07, grab(jt(y ~ k, data = d)), grab(jaov(y ~ k, data = d)))
        !any(grepl("(ies)", all_k, fixed = TRUE)) &&
          !any(grepl("1 categories", all_k, fixed = TRUE)) &&
          !any(grepl("jsubset (", all_k, fixed = TRUE)) })

# ---- K11-K12: the two model stops --------------------------------------------
.dk <- d; .dk$k2 <- 2
# Reworded at S346 with the predictor as the subject (section N pins the
# stop whole); the agreement in number is what K11 holds.
check("K11 one constant predictor: 'has ... its coefficient'; two: 'have ... each ... their coefficients' -- in jlm() and in jlogistic()",
      .k_has(flat(grab(jlm(y ~ x1 + k, data = .dk))),
             "jlm(): k has only one value in the analysis sample, so its coefficient cannot be estimated.") &&
        .k_has(flat(grab(jlm(y ~ x1 + k + k2, data = .dk))),
               "jlm(): k and k2 have only one value each in the analysis sample, so their coefficients cannot be estimated.") &&
        .k_has(flat(grab(jlogistic(yb ~ x1 + k + k2, data = .dk))),
               "jlogistic(): k and k2 have only one value each in the analysis sample, so their coefficients cannot be estimated."))
.dna_k <- d; .dna_k$x1[] <- NA_real_
check("K12 every case excluded: the closing sentence carries no 'stage(s)', in jlm() and in jlogistic()",
      { a <- flat(grab(jlm(y ~ x1, data = .dna_k)))
        b <- flat(grab(jlogistic(yb ~ x1, data = .dna_k)))
        want <- "All 120 cases were excluded because of missing data."
        .k_has(a, want) && .k_has(b, want) && !.k_has(a, "(s)") && !.k_has(b, "(s)") })
rm(.dk, .dna_k)

# ---- K13-K17: jcrosstab() prints its title where jt() does (AUDIT-026) ------
check("K13 a variable not found, a computed term and one variable on both sides: each stop comes under the title (each came bare)",
      identical(.k_pre(jcrosstab(g ~ nope, data = d)), "Cross-Tabulation") &&
        identical(.k_pre(jcrosstab(log(x1) ~ g, data = d)), "Cross-Tabulation") &&
        identical(.k_pre(jcrosstab(g ~ g, data = d)), "Cross-Tabulation"))
check("K14 under a juse() default the default-data line follows the title, ahead of the stop",
      identical(with_state(quiet(juse(d)), .k_pre(jcrosstab(g ~ nope)), quiet(juse(NULL))),
                c("Cross-Tabulation", "Using default data frame: d")))
check("K15 the front door and the input checks still come before it: a data frame first, a bad residuals =",
      identical(.k_pre(jcrosstab(d, g ~ lg)), character(0)) &&
        identical(.k_pre(jcrosstab(g ~ lg, data = d, residuals = "x")), character(0)))
check("K16 a table that prints carries the title once, on its first line",
      { ln <- .k_pre(jcrosstab(g ~ lg, data = d))
        identical(ln[1L], "Cross-Tabulation") && sum(ln == "Cross-Tabulation") == 1L &&
          length(ln) > 5L })
check("K17 the same stops under jt()'s title, as before: the two functions now agree",
      identical(.k_pre(jt(y ~ nope, data = d)), "Independent Samples T-Test") &&
        identical(.k_pre(jt(y ~ y, data = d)), "Independent Samples T-Test"))

# ---- K18-K24: jplot()'s box refusal (the S316 item) -------------------------
.k18 <- grab(jplot(d, y, by = hv, type = "box"))
check("K18 the grouping variable given as by =: the line names it and carries type = \"box\" (it printed 'jplot(y ~ NA, d)')",
      .k_has(.k18, "\n  jplot(y ~ hv, d, type = \"box\")\n") && !.k_has(.k18, "~ NA") &&
        .k_has(flat(.k18), "jplot(): For boxplots, use formula syntax to make the outcome and grouping variable explicit (consistent with jaov):"))
check("K19 that line draws a boxplot; the same formula without type = \"box\" draws points, which is why the line carries it",
      identical(.k_geom(.k_fix(.k18)), "GeomBoxplot") &&
        identical(.k_geom("jplot(y ~ hv, d)"), "GeomPoint"))
check("K20 type = \"box\" forced on two numeric variables: the one with fewer distinct values is the grouping variable, in either order",
      identical(.k_fix(grab(jplot(d, y, nm, type = "box"))), "jplot(y ~ nm, d, type = \"box\")") &&
        identical(.k_fix(grab(jplot(d, nm, y, type = "box"))), "jplot(y ~ nm, d, type = \"box\")") &&
        identical(.k_geom("jplot(y ~ nm, d, type = \"box\")"), "GeomBoxplot"))
check("K21 one numeric and one categorical variable: the categorical one on the right, and a by = kept",
      identical(.k_fix(grab(jplot(d, y, g))), "jplot(y ~ g, d, type = \"box\")") &&
        identical(.k_fix(grab(jplot(d, g, y))), "jplot(y ~ g, d, type = \"box\")") &&
        identical(.k_fix(grab(jplot(d, y, g, by = hv))),
                  "jplot(y ~ g, d, by = hv, type = \"box\")") &&
        identical(.k_geom("jplot(y ~ g, d, by = hv, type = \"box\")"), "GeomBoxplot"))
.k22 <- grab(jplot(d, y, type = "box"))
check("K22 no grouping variable at all: said so, with an example on the shipped data (it printed 'jplot(y ~ NA, d)')",
      .k_has(flat(.k22), paste0(
        "jplot(): a boxplot needs a grouping variable, and only y was given. ",
        "Use formula syntax, with the outcome on the left of ~ and the grouping variable on the right, for example: ")) &&
        .k_has(.k22, "\n  jplot(WellbeingScore ~ Region, community, type = \"box\")") &&
        !.k_has(.k22, "~ NA"))
check("K23 the example line runs on the shipped data and draws a boxplot",
      { env <- new.env(parent = globalenv())
        env$community <- jstats:::.jst_get_package_dataset("community")
        is.data.frame(env$community) &&
          identical(.k_geom(.k_fix(.k22), env), "GeomBoxplot") })
check("K24 under a juse() default the line still names the frame",
      identical(with_state(quiet(juse(d)), .k_fix(grab(jplot(y, by = hv, type = "box"))),
                           quiet(juse(NULL))),
                "jplot(y ~ hv, d, type = \"box\")"))

# ---- K25-K28: jplot() and a data frame's column (the S324 item) -------------
tb_k <- tibble::as_tibble(d[, c("y", "x1")])
check("K25 the instrument: a tibble warns when a column it does not have is evaluated",
      length(.k_warns(tb_k$yy)) == 1L)
check("K26 jplot(tb_k$yy): the not-found stop, and no warning ahead of it (the tibble's own warning printed first)",
      length(.k_warns(jplot(tb_k$yy))) == 0L &&
        identical(grab(jplot(tb_k$yy)),
                  "jplot(): yy was not found in the tb_k data frame.\nCheck the spelling."))
check("K27 ... the same with x = named, with [[ ]], and under a juse() default",
      length(.k_warns(jplot(x = tb_k$yy))) == 0L &&
        identical(grab(jplot(x = tb_k$yy)), grab(jplot(tb_k$yy))) &&
        identical(grab(jplot(tb_k[["yy"]])), grab(jplot(tb_k$yy))) &&
        with_state(quiet(juse(tb_k)), length(.k_warns(jplot(tb_k$yy))) == 0L,
                   quiet(juse(NULL))))
check("K28 a column the frame HAS is still refused as a single variable, with the frame form, which plots; a data.frame reads the same",
      { mk <- grab(jplot(tb_k$y)); md <- grab(jplot(d$y))
        identical(mk, paste0("jplot(): tb_k$y is a single variable, not a data frame.\n",
                             "Name the data frame first:\n  jplot(tb_k, y)")) &&
          identical(md, paste0("jplot(): d$y is a single variable, not a data frame.\n",
                               "Name the data frame first:\n  jplot(d, y)")) &&
          identical(.k_geom(.k_fix(mk)), "GeomBar") })
rm(tb_k)
rm(list = intersect(c(".k_has", ".k_pre", ".k_warns", ".k_fix", ".k_geom", ".k_on",
                      ".k_off", ".k01", ".k05", ".k07", ".k18", ".k22"),
                    ls(all.names = TRUE)))

# =============================================================================
# SECTION L -- TEXT GROUPING VARIABLES AND PREDICTORS: A STRING VARIABLE WITH
#              VALUE LABELS OR DECLARED MISSING VALUES; BLANK CELLS
#              (S340, v0.9.214)
# =============================================================================
# Fix Slate 3. (1) A string variable carrying value labels -- a .sav stores
# Sex "M" / "F" this way, and haven reads it as a character-backed labelled
# column -- stopped jt() with R's "arguments imply differing number of rows",
# stopped jlm() and jlogistic() with "Cannot create unique dummy names ...
# 'NA' and 'NA'", and left jaov(), jcrosstab() and jdesc(by = ) printing
# every category label empty, each behind "NAs introduced by coercion".
# (2) A string variable's declared missing values (MISSING VALUES MARITAL
# ('UNKNOWN')) were analyzed as a category. (3) A blank text cell -- empty,
# or holding only spaces or tabs -- is one category, <blank>, in every
# function (Jeff's S340 ruling, "A"): jt(), jaov(), jcrosstab() and
# jdesc(by = ) printed a blank group with no label and kept the empty and
# the whitespace cells apart; jlm() and jlogistic() dropped the empty cells
# as missing, uncounted, and made the whitespace cells a category.
cat("\n--- L. Text variables: labelled strings, declared missing strings, blank cells ---\n")

set.seed(340)
dl <- data.frame(y = rnorm(40), g2 = rep(1:2, 20), stringsAsFactors = FALSE)
dl$sx  <- rep(c("M", "F", "F", "M", "F"), 8)
dl$sxl <- haven::labelled(dl$sx, labels = c(Male = "M", Female = "F"))
dl$ms  <- rep(c("Married", "Single", "UNK", "Married", "Single"), 8)
dl$msd <- haven::labelled_spss(dl$ms, labels = c(Unknown = "UNK"),
                               na_values = "UNK")
dl$bl  <- rep(c("Y", "", "Y", " ", "Y", "", "\t", "Y"), 5)     # a word or blank
dl$b3  <- rep(c("a", "b", "", "a", "b", "  ", "a", "b"), 5)    # two words and blank
dl$bf  <- factor(dl$bl)                                        # a factor's blank levels
dl$yb  <- rep(c(0, 1, 1, 0, 1, 0, 0, 1, 1, 1), 4)
.l_blank <- !nzchar(trimws(dl$b3))
.l_has   <- function(txt, needle) grepl(needle, txt, fixed = TRUE)
# .l_rows(): the first cell of each line of a printed table that follows a
# line matching `after`, up to the first empty line -- the group labels.
.l_rows <- function(txt, after) {
  ln <- strsplit(txt, "\n", fixed = TRUE)[[1]]
  i  <- grep(after, ln, fixed = TRUE)
  if (!length(i)) return(character(0))
  ln <- ln[-seq_len(i[1L] + 2L)]                   # caption, header, rule
  ln <- ln[seq_len(max(0L, which(!nzchar(ln))[1L] - 1L))]
  trimws(sub("\\s{2,}.*$", "", ln))
}

# ---- L01-L09: a string variable with value labels ---------------------------
check("L01 .jst_group_codes(): numbers for a numeric-backed variable, as before; the strings themselves for a character-backed one; a declared missing string left out",
      identical(.jst_group_codes(d$hv), c(1, 2, 3)) &&
        identical(.jst_group_codes(dl$sxl), c("F", "M")) &&
        identical(.jst_group_codes(dl$msd), c("Married", "Single")))
.l02 <- shown(jt(y ~ sxl, data = dl))
check("L02 jt() on a labelled string: runs, and the groups read value and label (it stopped with R's \"differing number of rows\")",
      !startsWith(.l02, "[error]") &&
        identical(.l_rows(.l02, "Group Descriptives: y by sxl"),
                  c("F: Female", "M: Male")))
check("L03 ... the test is t.test()'s on the plain strings, and no coercion warning is raised",
      { m <- quiet(jt(y ~ sxl, data = dl))
        tr <- stats::t.test(y ~ sx, data = dl, var.equal = TRUE)
        !is.null(m) && near(m$t, tr$statistic) && near(m$p, tr$p.value) &&
          identical(grab(jt(y ~ sxl, data = dl)), "") })
.l04 <- shown(jaov(y ~ sxl, data = dl))
check("L04 jaov(): the group labels (they printed empty), no warning",
      identical(.l_rows(.l04, "Group Descriptives: y by sxl"),
                c("F: Female", "M: Male")) &&
        identical(grab(jaov(y ~ sxl, data = dl)), ""))
.l05 <- shown(jcrosstab(sxl ~ g2, data = dl))
check("L05 jcrosstab(): the row labels, and the column labels when the string variable is on the right",
      .l_has(.l05, "\nF: Female ") && .l_has(.l05, "\nM: Male ") &&
        { o <- shown(jcrosstab(g2 ~ sxl, data = dl))
          .l_has(o, "F: Female") && .l_has(o, "M: Male") } &&
        identical(grab(jcrosstab(sxl ~ g2, data = dl)), ""))
.l06 <- shown(jdesc(dl, y, by = sxl))
check("L06 jdesc(by = ): the group labels, no warning",
      .l_has(.l06, "\nF: Female ") && .l_has(.l06, "\nM: Male ") &&
        identical(grab(jdesc(dl, y, by = sxl)), ""))
check("L07 value.id = \"labels\" and \"values\" reach a string variable's groups",
      identical(.l_rows(shown(jt(y ~ sxl, data = dl, value.id = "labels")),
                        "Group Descriptives"), c("Female", "Male")) &&
        identical(.l_rows(shown(jt(y ~ sxl, data = dl, value.id = "values")),
                          "Group Descriptives"), c("F", "M")))
check("L08 .jst_make_dummy_names() on a labelled string: a character registration, the strings as values, the value labels as the names",
      { r <- .jst_make_dummy_names(dl$sxl, "sxl")
        identical(r$var_type, "character") && identical(r$values, c("F", "M")) &&
          identical(r$labels, c("sxl_Female", "sxl_Male")) })
check("L09 jlm() and jlogistic() on a labelled string: lm()'s and glm()'s coefficient (each stopped with \"Cannot create unique dummy names\")",
      { m  <- quiet(jlm(y ~ sxl, data = dl))
        ml <- quiet(jlogistic(yb ~ sxl, data = dl))
        near(b_of(m, "sxl_Male"), coef(stats::lm(y ~ sx, data = dl))[["sxM"]]) &&
          near(b_of(ml, "sxl_Male"),
               coef(stats::glm(yb ~ sx, data = dl, family = stats::binomial))[["sxM"]]) })

# ---- L10-L13: a string variable's declared missing values -------------------
.l10 <- shown(jaov(y ~ msd, data = dl))
check("L10 jaov(): the declared string is no group, and its 8 cases are excluded",
      identical(.l_rows(.l10, "Group Descriptives: y by msd"),
                c("Married", "Single")) &&
        { m <- quiet(jaov(y ~ msd, data = dl)); !is.null(m) && m$n == 32L })
check("L11 jt() and jcrosstab(): two categories, 32 cases",
      { m <- quiet(jt(y ~ msd, data = dl)); x <- quiet(jcrosstab(msd ~ g2, data = dl))
        !is.null(m) && m$n == 32L && !is.null(x) && x$n == 32L &&
          identical(rownames(x$observed), c("Married", "Single")) })
check("L12 jlm(): the declared cases are out of the model, and the dummy is lm()'s on the rest",
      { m  <- quiet(jlm(y ~ msd, data = dl))
        tr <- coef(stats::lm(y ~ ms, data = dl[dl$ms != "UNK", ]))
        !is.null(m) && stats::nobs(m$model) == 32L &&
          near(b_of(m, "msd_Single"), tr[["msSingle"]]) })
check("L13 .jst_make_dummy_names(): a declared missing string is not a category",
      identical(.jst_make_dummy_names(dl$msd, "msd")$values, c("Married", "Single")))

# ---- L14-L21: blank cells as a group ----------------------------------------
.l14 <- shown(jaov(y ~ b3, data = dl))
check("L14 jaov(): the empty and the whitespace cells are ONE group, labeled <blank>, listed first (they were two groups with no label)",
      identical(.l_rows(.l14, "Group Descriptives: y by b3"),
                c("<blank>", "a", "b")) &&
        { m <- quiet(jaov(y ~ b3, data = dl))
          !is.null(m) && identical(as.integer(m$descriptives$N), c(10L, 15L, 15L)) &&
            m$n == 40L })
check("L15 ... the ANOVA is aov()'s with the blank cells as one level",
      { m  <- quiet(jaov(y ~ b3, data = dl))
        tr <- summary(stats::aov(dl$y ~ factor(ifelse(.l_blank, "zb", dl$b3))))[[1]]
        !is.null(m) && near(m$f, tr[["F value"]][1L]) && m$df1 == 2 })
.l16 <- shown(jt(y ~ bl, data = dl))
check("L16 jt() on a word-or-blank variable: two groups, <blank> and Y, the three kinds of blank cell together",
      identical(.l_rows(.l16, "Group Descriptives: y by bl"), c("<blank>", "Y")) &&
        { m <- quiet(jt(y ~ bl, data = dl))
          tr <- stats::t.test(dl$y ~ factor(!nzchar(trimws(dl$bl)), c(TRUE, FALSE)),
                              var.equal = TRUE)
          !is.null(m) && near(m$t, tr$statistic) })
.l17 <- shown(jcrosstab(b3 ~ g2, data = dl))
check("L17 jcrosstab(): one <blank> row, first, and no stray tab in the table",
      { x <- quiet(jcrosstab(b3 ~ g2, data = dl))
        !is.null(x) && identical(rownames(x$observed), c("<blank>", "a", "b")) &&
          identical(as.integer(x$observed["<blank>", ]), c(5L, 5L)) &&
          .l_has(.l17, "\n<blank> ") && !.l_has(.l17, "\t") })
check("L18 jcrosstab(): a blank category as the COLUMN variable",
      { x <- quiet(jcrosstab(g2 ~ bl, data = dl))
        !is.null(x) && identical(colnames(x$observed), c("<blank>", "Y")) })
.l19 <- shown(jdesc(dl, y, by = b3))
check("L19 jdesc(by = ): the <blank> group, first, with its 10 cases",
      grepl("\n<blank>\\s+10\\s+10\\s", .l19) &&
        regexpr("\n<blank>", .l19) < regexpr("\na ", .l19))
check("L20 a factor's blank levels are one group, <blank>, in jt()",
      identical(.l_rows(shown(jt(y ~ bf, data = dl)), "Group Descriptives: y by bf"),
                c("<blank>", "Y")))
check("L20b ... and in jaov(), jdesc(by = ) and both margins of jcrosstab(): the factor's three blank levels are one group",
      identical(.l_rows(shown(jaov(y ~ bf, data = dl)), "Group Descriptives: y by bf"),
                c("<blank>", "Y")) &&
        grepl("\n<blank>\\s+20\\s+20\\s", shown(jdesc(dl, y, by = bf))) &&
        { x <- quiet(jcrosstab(bf ~ g2, data = dl)); z <- quiet(jcrosstab(g2 ~ bf, data = dl))
          !is.null(x) && !is.null(z) &&
            identical(rownames(x$observed), c("<blank>", "Y")) &&
            identical(colnames(z$observed), c("<blank>", "Y")) &&
            identical(as.integer(x$observed["<blank>", ]), c(5L, 15L)) })
check("L21 a filter still reads the cells as stored: subset = b3 != \"\" removes the 5 empty cells and leaves the 5 whitespace cells as the <blank> group",
      { m <- quiet(jaov(y ~ b3, data = dl, subset = b3 != ""))
        !is.null(m) && m$n == 35L &&
          identical(as.integer(m$descriptives$N), c(5L, 15L, 15L)) })

# ---- L22-L31: blank cells in a model ----------------------------------------
.l22 <- shown(jlm(y ~ b3, data = dl))
check("L22 jlm(): every case is in the model, and the blank category has a row of its own, last, under a named reference",
      { m <- quiet(jlm(y ~ b3, data = dl))
        !is.null(m) && stats::nobs(m$model) == 40L &&
          .l_has(.l22, "b3 (ref = 1: a)") &&
          grepl("\n  2: b\\s", .l22) && grepl("\n  3: <blank>\\s", .l22) })
check("L23 ... its coefficients are lm()'s with the blank cells as one level (the empty cells were dropped, the whitespace cells a category)",
      { m  <- quiet(jlm(y ~ b3, data = dl))
        tr <- coef(stats::lm(dl$y ~ factor(ifelse(.l_blank, "zb", dl$b3))))
        near(b_of(m, "b3_b"), tr[[2L]]) && near(b_of(m, "b3_blank"), tr[[3L]]) })
check("L24 the Case Processing block reconciles: with one outcome missing, one case is excluded and one is explained",
      { e <- dl; e$y[3] <- NA                       # a blank-b3 case
        m <- quiet(jlm(y ~ b3, data = e))
        !is.null(m) && m$n == 39L && stats::nobs(m$model) == 39L &&
          identical(as.integer(m$sample_info$n_excluded_missing), 1L) })
check("L25 a word-or-blank predictor models the word: the blank category is the reference, and the dummy is named for the word",
      { r <- .jst_make_dummy_names(dl$bl, "bl")
        m <- quiet(jlm(y ~ bl, data = dl))
        identical(r$values, c("Y", "<blank>")) && identical(r$ref_idx, 2L) &&
          identical(r$dummy_names, "bl_Y") &&
          near(b_of(m, "bl_Y"), mean(dl$y[dl$bl == "Y"]) - mean(dl$y[dl$bl != "Y"])) })
check("L26 with three or more categories the default reference is the first NAMED one; ref = \"last\" takes the blank category",
      identical(.jst_make_dummy_names(dl$b3, "b3")$ref_idx, 1L) &&
        identical(.jst_make_dummy_names(dl$b3, "b3", ref = "last")$ref_label,
                  "b3_blank"))
check("L27 jlogistic(): glm()'s coefficients with the blank cells as one level, every case in",
      { m  <- quiet(jlogistic(yb ~ b3, data = dl))
        tr <- coef(stats::glm(dl$yb ~ factor(ifelse(.l_blank, "zb", dl$b3)),
                              family = stats::binomial))
        !is.null(m) && stats::nobs(m$model) == 40L &&
          near(b_of(m, "b3_b"), tr[[2L]]) && near(b_of(m, "b3_blank"), tr[[3L]]) })
check("L28 jdummy() registers the blank category, and the registered fit is the unregistered one",
      { reg <- with_state(quiet(jdummy(dl, b3)),
                          list(v = .jst_get_dummy("dl")[[1L]]$values,
                               b = b_of(quiet(jlm(y ~ b3, data = dl)), "b3_blank")),
                          quiet(jdummy(dl, b3, remove = TRUE)))
        identical(reg$v, c("a", "b", "<blank>")) &&
          near(reg$b, b_of(quiet(jlm(y ~ b3, data = dl)), "b3_blank")) })
check("L29 a registration made BEFORE the blank category existed keeps a blank cell missing on every dummy",
      { old <- list(var_name = "b3", var_type = "character", codes = 1:2,
                    labels = c("b3_a", "b3_b"), values = c("a", "b"),
                    non_ref_idx = 2L, dummy_names = "b3_b")
        x <- .jst_expand_one_dummy(dl[, c("y", "b3")], y ~ b3, old)$data$b3_b
        all(is.na(x[.l_blank])) && !anyNA(x[!.l_blank]) &&
          identical(x[!.l_blank], as.integer(dl$b3[!.l_blank] == "b")) })
check("L30 .jst_label_blanks() and .jst_text_factor(): one label for the three kinds of blank cell, NA left alone, the blank level first, nothing done to numbers",
      { x <- c("b", "", " ", "\t", NA, "a", " a ")
        identical(.jst_label_blanks(x), c("b", "<blank>", "<blank>", "<blank>", NA, "a", " a ")) &&
          identical(levels(.jst_text_factor(x)), c("<blank>", " a ", "a", "b")) &&
          identical(.jst_label_blanks(c(1, NA)), c(1, NA)) &&
          identical(levels(.jst_label_blanks(factor(c("", "x", " ")))), c("<blank>", "x")) })
check("L31 .jst_blank_counts(): the empty and the whitespace cells counted apart; zero for a number",
      identical(.jst_blank_counts(dl$bl), list(n = 20L, empty = 10L, space = 10L)) &&
        identical(.jst_blank_counts(dl$bf)$n, 20L) &&
        identical(.jst_blank_counts(dl$y), list(n = 0L, empty = 0L, space = 0L)))
check("L32 jplot(): the blank cells plot as one category, <blank>, on both paths (a bar per spelling before)",
      { p <- quiet(jplot(dl, b3)); q <- quiet(jplot(y ~ b3, data = dl))
        inherits(p, "ggplot") && inherits(q, "ggplot") &&
          setequal(levels(p$data$x), c("<blank>", "a", "b")) &&
          sum(p$data$x == "<blank>") == 10L &&
          setequal(levels(q$data$x), c("<blank>", "a", "b")) })

# ---- L33-L36: a text OUTCOME in jlogistic() ---------------------------------
# The two refusals a text outcome can meet. Both printed a blank category as
# nothing ("Y/", "(a, b, ,  )"), and the first offered a jrecode() call, which
# stops on any text variable and sends the user to jencode().
.l33 <- grab(jlogistic(bl ~ y, data = dl))
# RE-PINNED S347 (v0.9.220): the map codes a blank category 0, so the word
# is the modeled category (it read "Y=0; blank=1", modeling the blank).
check("L33 a word-or-blank outcome: the blank category is named, and the fix line is a jencode() call with jencode()'s word for a blank, coded 0",
      .l_has(.l33, "'bl' has text categories Y/<blank>.") &&
        .l_has(.l33, "\n  dl$blR <- jencode(dl, bl, map = \"blank=0; Y=1\")\n") &&
        !.l_has(.l33, "jrecode"))
# .l_fix(): run the indented line a message printed, in a copy of the frame.
.l_fix <- function(txt, frame) {
  ln <- grep("^  dl\\$", strsplit(txt, "\n", fixed = TRUE)[[1]], value = TRUE)
  e  <- new.env(parent = globalenv()); assign("dl", frame, envir = e)
  tryCatch({ suppressMessages(eval(parse(text = ln), e)); get("dl", envir = e) },
           error = function(err) NULL)
}
check("L34 ... that line runs, and its 0/1 result is an outcome jlogistic() accepts: glm()'s fit of the word against blank",
      { d2 <- .l_fix(.l33, dl)
        m  <- if (is.null(d2)) NULL else quiet(jlogistic(blR ~ y, data = d2))
        tr <- coef(stats::glm(as.integer(nzchar(trimws(dl$bl))) ~ dl$y,
                              family = stats::binomial))
        !is.null(m) && identical(as.numeric(unclass(d2$blR)),
                                 as.numeric(nzchar(trimws(dl$bl)))) &&
          near(b_of(m, "y"), tr[[2L]]) })
check("L35 two words in several spellings: each side of the map lists every spelling folded into the category, and the line runs",
      { f <- dl
        g <- local({ dl <- f; dl$pet <- rep(c("Cat", "cat ", "Dog", " Dog", "DOG"), 8)
                     f <<- dl; grab(jlogistic(pet ~ y, data = dl)) })
        d2 <- .l_fix(g, f)
        .l_has(g, "'pet' has text categories Cat/Dog.") &&
          .l_has(g, "\n  dl$petR <- jencode(dl, pet, map = \"Cat,cat=0; Dog,DOG=1\")\n") &&
          !is.null(d2) &&
          identical(as.numeric(unclass(d2$petR)), rep(c(0, 0, 1, 1, 1), 8)) })
check("L36 three categories, one of them blank: listed once, as <blank> (it read \"(a, b, ,   )\")",
      .l_has(grab(jlogistic(b3 ~ y, data = dl)), "'b3' has 3 categories (a, b, <blank>).\n"))
rm(dl)
rm(list = intersect(c(".l33", ".l_fix", ".l_blank", ".l_has", ".l_rows", ".l02", ".l04", ".l05", ".l06",
                      ".l10", ".l14", ".l16", ".l17", ".l19", ".l22"),
                    ls(all.names = TRUE)))

# =============================================================================
# SECTION M -- THE REGISTRATION VERBS AT THE FRONT DOOR; A COMPARISON INSIDE A
#              FORMULA (S342, v0.9.216)
# =============================================================================
# Fix Slate 4. (1) jdummy()'s ref was not checked: two codes registered under
# R's "longer object length" warning, two words and an empty one met R's own
# errors after the title, and TRUE, NULL and NA took the first category. (2)
# jdummy(d, A, B, ref = 2) registered A, printed its block, then stopped at B:
# every variable is now built before the title prints and before any is
# registered. (3) jnumeric(), jcount() and jlikert() accepted any variable
# and confirmed a registration that changed nothing (a factor), or that made
# jscreen() call a text variable Numeric; they take a numeric variable or a
# haven-labelled one that holds numbers, and refuse the rest (Jeff's lean 2),
# and a registration of those kinds already stored on another kind of
# variable is passed over by the classifier. (4) AUDIT-014: the classifier's
# bare as.numeric() calls on a labelled variable. (5) The formula guard
# refused EVERY computed term on a categorical variable and named jnumeric()
# as the way through, which (3) closed for a text variable, a factor and a
# logical; Jeff's ruling in the same session: a comparison computes with no
# registration, as lm() computes it, and arithmetic on a categorical
# variable stays refused.
cat("\n--- M. The registration verbs at the front door; comparisons in a formula ---\n")

set.seed(342)
dm <- data.frame(y = round(rnorm(48, 50, 10)), Age = round(runif(48, 20, 60)),
                 Grp = rep(1:4, 12), Sex = rep(1:2, 24), One = 1,
                 Fac = factor(rep(c("lo", "mid", "hi", "lo"), 12)),
                 Txt = rep(c("web", "", "phone", "web", NA, "web"), 8),
                 Flag = rep(c(TRUE, FALSE, TRUE, TRUE), 12),
                 stringsAsFactors = FALSE)
dm$When <- as.Date("2026-01-01") + 0:47
dm$NumT <- as.character(rep(1:6, 8))
dm$Cx   <- complex(real = rep(1:4, 12), imaginary = 1)
dm$Mood <- haven::labelled_spss(rep(c(1, 2, 3, -99, 2, 3), 8),
                                labels = c(Low = 1, Mid = 2, High = 3,
                                           Refused = -99), na_values = -99)
dm$Sx   <- haven::labelled(rep(c("M", "F"), 24),
                           labels = c(Male = "M", Female = "F"))
dm$Edu  <- haven::labelled(rep(1:6, 8),
                           labels = c(None = 1, Some = 2, HS = 3, Dip = 4,
                                      Uni = 5, Post = 6))
quiet(jdummy(clear.all = TRUE)); quiet(jnumeric(clear.all = TRUE))
quiet(jcount(clear.all = TRUE)); quiet(jlikert(clear.all = TRUE))
# .m_out(): what a call PRINTS, when it stops as well -- the title a refused
# call must not have printed.
.m_out <- function(expr) {
  paste(utils::capture.output(tryCatch(suppressMessages(suppressWarnings(expr)),
                                       error = function(e) invisible(NULL))),
        collapse = "\n")
}
.m_dreg <- function(nm = "dm") {
  ds <- .jst_get_dummy(nm)
  if (is.null(ds)) character(0) else
    vapply(ds, function(r) r$var_name, character(1))
}
# .l_rows_m(): section L's reader of a printed table's first column (its own
# copy was removed with that section's fixtures).
.l_rows_m <- function(txt, after) {
  ln <- strsplit(txt, "\n", fixed = TRUE)[[1]]
  i  <- grep(after, ln, fixed = TRUE)
  if (!length(i)) return(character(0))
  ln <- ln[-seq_len(i[1L] + 2L)]
  ln <- ln[seq_len(max(0L, which(!nzchar(ln))[1L] - 1L))]
  trimws(sub("\\s{2,}.*$", "", ln))
}
.m_ireg <- function(nm = "dm") {
  r <- .jst_get_registry(nm)
  if (is.null(r)) character(0) else
    vapply(r, function(x) paste0(x$var_name, ":", x$kind), character(1),
           USE.NAMES = FALSE)
}

# ---- M01-M04: jdummy()'s ref is one value (the S329 item) -------------------
.m_ref <- paste0("jdummy(): `ref` must be a single value: a category's code ",
                 "or label, or \"first\", \"last\", or \"auto\".")
check("M01 two codes as ref: the stop, pinned whole, and no warning of R's with it (it registered under \"longer object length is not a multiple\")",
      identical(flat(grab(jdummy(dm, Grp, ref = c(1, 2)))), .m_ref))
check("M02 the same stop for two words, an empty one, TRUE, NULL, NA and a missing word (two met R's own errors; four took the first category in silence)",
      all(vapply(list(quote(c("first", "last")), quote(character(0)), TRUE,
                      NULL, NA, NA_character_), function(r) {
        identical(flat(grab(eval(bquote(jdummy(dm, Grp, ref = .(r)))))), .m_ref)
      }, logical(1))))
check("M03 ... nothing is registered by any of them, and nothing is printed: the check comes before the title",
      length(.m_dreg()) == 0L &&
        identical(.m_out(jdummy(dm, Grp, ref = c(1, 2))), "") &&
        identical(.m_out(jdummy(dm, Grp, ref = TRUE)), ""))
check("M04 control: a code, a label, the three words in any case, and a whole number stored as an integer still register, each with the reference asked for",
      { rc <- function(...) { quiet(jdummy(dm, Grp, ...))
                              .jst_get_dummy("dm")[[1L]]$ref_code }
        ok <- identical(rc(ref = 3), 3L) && identical(rc(ref = "Grp_2"), 2L) &&
          identical(rc(ref = "LAST"), 4L) && identical(rc(ref = "First"), 1L) &&
          identical(rc(ref = "auto"), 1L) && identical(rc(ref = 2L), 2L)
        quiet(jdummy(clear.all = TRUE)); ok })

# ---- M05-M08: every variable is checked before any is registered (S341) -----
check("M05 jdummy(dm, Grp, Sex, ref = 3): the stop names Sex, and Grp is NOT registered (it was, and its block had printed)",
      grepl("Reference code 3 not found in 'Sex'",
            flat(grab(jdummy(dm, Grp, Sex, ref = 3))), fixed = TRUE) &&
        length(.m_dreg()) == 0L)
check("M06 ... and nothing prints before the stop: no title, no block",
      identical(.m_out(jdummy(dm, Grp, Sex, ref = 3)), ""))
check("M07 the same for a variable with one category, and for one over max.categories: no variable of the call is registered",
      grepl("'One' has fewer than 2 categories",
            flat(grab(jdummy(dm, Grp, One))), fixed = TRUE) &&
        grepl("'Edu' has 6 categories, the default limit is 5",
              flat(grab(jdummy(dm, Sex, Edu, max.categories = 5))),
              fixed = TRUE) &&
        length(.m_dreg()) == 0L)
check("M08 a registration made earlier is left as it was by a call that stops (Grp keeps reference 2)",
      { quiet(jdummy(dm, Grp, ref = 2))
        g  <- grab(jdummy(dm, Grp, Sex, ref = 4))
        ok <- grepl("Reference code 4 not found in 'Sex'", flat(g), fixed = TRUE) &&
          identical(.m_dreg(), "Grp") &&
          identical(.jst_get_dummy("dm")[[1L]]$ref_code, 2L)
        quiet(jdummy(clear.all = TRUE)); ok })
check("M09 control: a call that does not stop registers every variable, in the order typed, each block under the one title",
      { o  <- .m_out(jdummy(dm, Sex, Grp))
        ok <- identical(.m_dreg(), c("Sex", "Grp")) &&
          lengths(regmatches(o, gregexpr("Dummy Variable Registration", o))) == 1L &&
          regexpr("Variable: Sex", o) < regexpr("Variable: Grp", o)
        quiet(jdummy(clear.all = TRUE)); ok })

# ---- M10-M19: what jnumeric(), jcount() and jlikert() take (S310, lean 2) ---
.m_only <- function(fn, what, kind, tail = "") {
  paste0(fn, "(): ", what, "; a ", kind,
         " registration applies only to numeric variables.", tail)
}
.m_enc <- " Convert it to numbers first with jencode()."
check("M10 a factor: refused, pinned whole, with the jencode() line (it printed \"Numeric registration set\" and changed nothing)",
      identical(flat(grab(jnumeric(dm, Fac))),
                .m_only("jnumeric", "'Fac' is a factor", "numeric", .m_enc)))
check("M11 a text variable, numbers stored as text and a string variable with value labels: one wording, with the jencode() line",
      all(vapply(c("Txt", "NumT", "Sx"), function(v) {
        identical(flat(grab(eval(bquote(jnumeric(dm, .(as.name(v))))))),
                  .m_only("jnumeric",
                          paste0("'", v, "' is a character (text) variable"),
                          "numeric", .m_enc))
      }, logical(1))))
check("M12 a date and a logical: refused with the fact alone, no remedy line (jstats has no conversion for either)",
      identical(flat(grab(jnumeric(dm, When))),
                .m_only("jnumeric", "'When' is a date/time variable", "numeric")) &&
        identical(flat(grab(jnumeric(dm, Flag))),
                  .m_only("jnumeric", "'Flag' is a logical (TRUE/FALSE) variable",
                          "numeric")))
check("M13 an unsupported type: named by R's type, in jrelabel()'s form",
      identical(flat(grab(jnumeric(dm, Cx))),
                "jnumeric(): 'Cx' is of type complex and cannot be registered."))
check("M14 jcount() and jlikert() refuse the same types, each naming its own registration and itself",
      identical(flat(grab(jcount(dm, Txt))),
                .m_only("jcount", "'Txt' is a character (text) variable",
                        "count", .m_enc)) &&
        identical(flat(grab(jlikert(dm, Fac))),
                  .m_only("jlikert", "'Fac' is a factor", "Likert", .m_enc)) &&
        identical(flat(grab(jcount(dm, Flag))),
                  .m_only("jcount", "'Flag' is a logical (TRUE/FALSE) variable",
                          "count")))
check("M15 a call naming a variable it takes and one it refuses registers NEITHER, whichever comes first, and says nothing but the stop",
      { g1 <- grab(jnumeric(dm, Age, Fac)); g2 <- grab(jlikert(dm, Txt, Edu))
        startsWith(g1, "jnumeric(): 'Fac' is a factor") &&
          !grepl("registration set", g1, fixed = TRUE) &&
          startsWith(g2, "jlikert(): 'Txt' is a character") &&
          length(.m_ireg()) == 0L })
check("M16 under a juse() default the refusal comes before the \"Using default data frame\" line",
      { juse(dm)
        o  <- .m_out(jnumeric(Fac)); g <- grab(jnumeric(Fac))
        juse(NULL)
        identical(o, "") && startsWith(g, "jnumeric(): 'Fac' is a factor") })
check("M17 control: a numeric variable and a haven-labelled one that holds numbers are registered by all three verbs, a declared missing value making no difference",
      { quiet(jnumeric(dm, Grp, Edu)); a <- .m_ireg()
        quiet(jcount(dm, Age));        quiet(jlikert(dm, Mood, Edu))
        b <- .m_ireg()
        quiet(jnumeric(clear.all = TRUE)); quiet(jcount(clear.all = TRUE))
        quiet(jlikert(clear.all = TRUE))
        identical(a, c("Grp:numeric", "Edu:numeric")) &&
          setequal(b, c("Grp:numeric", "Edu:likert", "Age:count", "Mood:likert")) })
check("M18 control: jdummy() is unchanged -- a factor, a text variable, a labelled string and a logical all register (a date stays refused there, as before)",
      { quiet(jdummy(dm, Fac, Txt, Sx, Flag))
        r <- .m_dreg(); quiet(jdummy(clear.all = TRUE))
        identical(r, c("Fac", "Txt", "Sx", "Flag")) &&
          grepl("unsupported type for dummy coding",
                grab(jdummy(dm, When)), fixed = TRUE) })
# A registration saved before the refusal: put in the notebook directly, as
# jload() restores one from an older .rds file.
.m_stale <- function() {
  options(.jst_registry = list(dm = list(
    Txt  = list(var_name = "Txt",  kind = "numeric"),
    Fac  = list(var_name = "Fac",  kind = "likert"),
    Flag = list(var_name = "Flag", kind = "count"),
    Sx   = list(var_name = "Sx",   kind = "count"),
    Edu  = list(var_name = "Edu",  kind = "numeric"),
    Age  = list(var_name = "Age",  kind = "count"))))
}
check("M19 a numeric, count or Likert registration ALREADY stored on a text variable, a factor, a labelled string or a logical is passed over: the variable is classified by its structure",
      { .m_stale()
        cl <- function(v) .jst_jstats_class(dm[[v]], v, "dm")
        ok <- all(vapply(c("Txt", "Fac", "Flag", "Sx"), function(v) {
          r <- cl(v); identical(r$class, "Categorical") &&
            identical(r$source, "structural")
        }, logical(1))) &&
          !.jst_is_count(dm$Flag, "Flag", "dm") && !.jst_is_count(dm$Sx, "Sx", "dm")
        ok })
check("M20 ... control: on a variable that can carry it the registration is read as before (Edu numeric, Age a count)",
      { r <- .jst_jstats_class(dm$Edu, "Edu", "dm")
        a <- .jst_jstats_class(dm$Age, "Age", "dm")
        identical(r$class, "Numeric") && identical(r$source, "registered") &&
          identical(a$subclass, "Count") && .jst_is_count(dm$Age, "Age", "dm") })
check("M21 ... jscreen() on them raises nothing (it gave \"NAs introduced by coercion\" twice) and shows no text variable as Numeric",
      { g <- grab(jscreen(dm, Txt, Fac, Flag, Edu))
        t <- quiet(jscreen(dm, Txt, Fac, Flag, Edu))
        identical(g, "") && !is.null(t) &&
          identical(t$Class, c("Categorical", "Categorical", "Categorical",
                               "Numeric")) &&
          identical(t$Source, c("structural", "structural", "structural",
                                "registered")) })
check("M22 ... and remove = TRUE is not gated by type: the stored registration can still be taken off a text variable",
      { g <- grab(jnumeric(dm, Txt, remove = TRUE))
        ok <- identical(g, "Numeric registration removed for 'Txt' in dm.\n") &&
          !("Txt:numeric" %in% .m_ireg())
        quiet(jnumeric(clear.all = TRUE)); quiet(jcount(clear.all = TRUE))
        quiet(jlikert(clear.all = TRUE)); ok })

# ---- M23-M24: AUDIT-014, the classifier's coercion of a labelled variable ---
# The failure the audit names is a session where R cannot turn a labelled
# variable into numbers through as.numeric(). It is made here: a method for
# the labelled class that stops, defined for the two checks and removed.
.m_lab <- haven::labelled(rep(c(1, 2), 6), labels = c(Yes = 1, No = 2))
.m_cast <- function(expr) {
  assign("as.double.haven_labelled",
         function(x, ...) stop("Can't convert <haven_labelled> to <double>."),
         envir = globalenv())
  on.exit(rm("as.double.haven_labelled", envir = globalenv()))
  tryCatch(expr, error = function(e) paste0("[error] ", conditionMessage(e)))
}
check("M23 the stand-in is real: with it in place as.numeric() on a labelled variable stops",
      identical(.m_cast(as.numeric(.m_lab)),
                "[error] Can't convert <haven_labelled> to <double>."))
check("M24 ... and the classifier does not: .jst_is_dichotomy(), both rules of .jst_is_discrete_integer(), the plausibility check and the suspected-codes scan read the stored numbers",
      identical(.m_cast(.jst_is_dichotomy(.m_lab)$coding), "1/2") &&
        isTRUE(.m_cast(.jst_is_discrete_integer(.m_lab))) &&
        isTRUE(.m_cast(.jst_is_discrete_integer(
          haven::labelled(rep(0:5, 2), labels = c(Refused = 99))))) &&
        identical(.m_cast(.jst_declaration_plausibility(.m_lab, "count")),
                  "declared as a count, but it has only two distinct values") &&
        !startsWith(paste(.m_cast(shown(
          .jst_scan_coded_missing(data.frame(v = .m_lab), "mdf"))), collapse = ""),
          "[error]"))

# ---- M25-M36: a comparison inside a formula (Jeff's S342 ruling) ------------
# .m_plain: the frame as base R should see it -- labels off, a declared
# missing value NA -- for the lm() each jlm() fit is held to.
.m_plain <- dm
.m_plain$Mood <- { z <- as.numeric(unclass(dm$Mood)); z[z == -99] <- NA; z }
.m_plain$Sx   <- as.character(unclass(dm$Sx))
.m_plain$Edu  <- as.numeric(unclass(dm$Edu))
.m_same <- function(f) {
  m <- quiet(jlm(f, data = dm))
  l <- stats::lm(f, data = .m_plain)
  !is.null(m) && near(sort(m$coefficients_raw$b), sort(stats::coef(l))) &&
    identical(as.integer(m$n), as.integer(stats::nobs(l)))
}
check("M25 .jst_comparison_exempt(): a variable standing bare as one side of a comparison is passed over; one inside a call, or used as a number in a logical position, is not",
      { ex <- function(e) .jst_comparison_exempt(e, dm)
        identical(ex(quote(I(Sex == 1))), "Sex") &&
          identical(ex(quote(Txt %in% c("web", "phone"))), "Txt") &&
          setequal(ex(quote(I(Flag & (Sex == 1 | Grp != 2)))),
                   c("Flag", "Sex", "Grp")) &&
          identical(ex(quote(I(!(Fac == "lo")))), "Fac") &&
          identical(ex(quote(I(log(Grp) > 1))), character(0)) &&
          identical(ex(quote(I(Sex == 1 & log(Grp) > 0))), "Sex") &&
          identical(ex(quote(I(Grp & Sex == 1))), "Sex") &&
          identical(ex(quote(I(Grp == 1 & Grp))), character(0)) &&
          identical(ex(quote(I(Grp == 1 & log(Grp) > 0))), character(0)) })
check("M26 ... a term that is not a logical expression exempts nothing: arithmetic on a comparison, ifelse(), a power, a function call",
      all(vapply(list(quote(I((Sex == 1) * Age)), quote(ifelse(Sex == 1, 0, 1)),
                      quote(I(Grp^2)), quote(log(Grp)), quote(I(Sex == 1) + 0),
                      quote(as.numeric(Sex == 1))),
                 function(e) length(.jst_comparison_exempt(e, dm)) == 0L,
                 logical(1))))
check("M27 ... an order comparison exempts a variable that holds numbers, and not a factor, a text variable or a labelled string; a logical is exempt in == and in a logical position, not in <",
      { ex <- function(e) .jst_comparison_exempt(e, dm)
        identical(ex(quote(I(Grp >= 2))), "Grp") &&
          identical(ex(quote(I(Edu < 4))), "Edu") &&
          identical(ex(quote(I(Fac > "lo"))), character(0)) &&
          identical(ex(quote(I(Txt < "m"))), character(0)) &&
          identical(ex(quote(I(Sx <= "M"))), character(0)) &&
          identical(ex(quote(I(Flag == TRUE))), "Flag") &&
          identical(ex(quote(I(Flag > 0))), character(0)) })
check("M28 a comparison on a numeric-coded categorical fits with NO registration, to lm()'s coefficients: ==, %in%, |, an order comparison, a constant from the workspace (each stopped, pointing to jnumeric())",
      { cut_m <- 2
        .m_same(y ~ I(Sex == 1) + Age) && .m_same(y ~ I(Grp %in% c(1, 3))) &&
          .m_same(y ~ I(Grp == 1 | Grp == 3) + Age) &&
          .m_same(y ~ I(Edu >= 4)) && .m_same(y ~ I(Grp >= cut_m)) &&
          length(.m_ireg()) == 0L })
check("M29 ... on a text variable and on a factor, where no registration is possible any more: ==, !=, %in%, a blank cell, with an interaction",
      .m_same(y ~ I(Txt == "web")) && .m_same(y ~ I(Txt == "")) &&
        .m_same(y ~ I(!(Txt %in% c("web")))) &&
        .m_same(y ~ I(Fac %in% c("lo", "hi"))) &&
        .m_same(y ~ I(Fac != "mid") * Age))
check("M30 ... on a logical, bare and compared; on a string variable with value labels, read as text; and written without I()",
      .m_same(y ~ I(Flag & Sex == 1)) && .m_same(y ~ I(Flag == FALSE)) &&
        .m_same(y ~ I(Sx == "M")) && .m_same(y ~ (Txt == "web") + Age) &&
        identical(grab(jlm(y ~ I(Sx == "M"), data = dm)), ""))
check("M31 ... a declared missing value is missing to the comparison: the 8 Refused cases leave the model, as lm() leaves an NA",
      { m <- quiet(jlm(y ~ I(Mood == 3), data = dm))
        .m_same(y ~ I(Mood == 3)) && !is.null(m) && identical(as.integer(m$n), 40L) })
check("M32 ... as the grouping term of jt() and jaov(): the groups are FALSE and TRUE and the test is base R's",
      { t  <- quiet(jt(y ~ I(Sex == 1), data = dm))
        a  <- quiet(jaov(y ~ I(Fac == "lo"), data = dm))
        tr <- stats::t.test(y ~ I(Sex == 1), data = dm, var.equal = TRUE)
        ar <- summary(stats::aov(y ~ I(Fac == "lo"), data = dm))[[1L]]
        !is.null(t) && !is.null(a) && near(abs(t$t), abs(tr$statistic)) &&
          near(t$p, tr$p.value) && near(a$f, ar[["F value"]][1L]) &&
          identical(.l_rows_m(shown(jt(y ~ I(Sex == 1), data = dm)),
                              "Group Descriptives"), c("FALSE", "TRUE")) })
.m_cat <- function(v, term) {
  paste0("jlm(): ", v, " is a categorical variable, so the formula term ",
         term, " cannot be computed.")
}
check("M33 arithmetic on a categorical variable is still refused, the jnumeric() line offered where it will take: log(), a power, a product with a comparison, ifelse(), arithmetic inside a comparison, a variable compared in one place and transformed in another",
      all(vapply(list(
        list(y ~ log(Grp), "Grp", "log(Grp)"),
        list(y ~ I(Grp^2), "Grp", "I(Grp^2)"),
        list(y ~ I((Sex == 1) * Age), "Sex", "I((Sex == 1) * Age)"),
        list(y ~ ifelse(Sex == 1, 0, 1), "Sex", "ifelse(Sex == 1, 0, 1)"),
        list(y ~ I(log(Grp) > 1), "Grp", "I(log(Grp) > 1)"),
        list(y ~ I(Sex == 1 & log(Grp) > 0), "Grp", "I(Sex == 1 & log(Grp) > 0)"),
        list(y ~ I(Grp & Sex == 1), "Grp", "I(Grp & Sex == 1)"),
        list(y ~ I(Grp == 2 & log(Grp) > 0), "Grp", "I(Grp == 2 & log(Grp) > 0)")),
        function(s) {
          identical(flat(grab(jlm(s[[1L]], data = dm))),
                    paste0(.m_cat(s[[2L]], s[[3L]]), " If ", s[[2L]],
                           " should be treated as numeric, register it first: ",
                           "jnumeric(dm, ", s[[2L]], ")"))
        }, logical(1))))
check("M34 ... that line runs, and the term then computes, to lm()'s coefficient on the codes",
      { quiet(jnumeric(dm, Grp))
        m  <- quiet(jlm(y ~ log(Grp), data = dm))
        ok <- !is.null(m) && near(b_of(m, "log(Grp)"),
                                  stats::coef(stats::lm(y ~ log(Grp), data = dm))[[2L]])
        quiet(jnumeric(clear.all = TRUE)); ok })
check("M35 ... a factor, a text variable and a labelled string are sent to jencode(), since jnumeric() refuses them (the line it used to offer now stops): arithmetic, and an order comparison",
      all(vapply(list(
        list(y ~ log(Fac), "Fac", "log(Fac)"),
        list(y ~ sqrt(Txt), "Txt", "sqrt(Txt)"),
        list(y ~ I(Fac > "lo"), "Fac", "I(Fac > \"lo\")"),
        list(y ~ I(Txt < "m"), "Txt", "I(Txt < \"m\")"),
        list(y ~ I(Sx < "M"), "Sx", "I(Sx < \"M\")")),
        function(s) {
          identical(flat(grab(jlm(s[[1L]], data = dm))),
                    paste0(.m_cat(s[[2L]], s[[3L]]), .m_enc))
        }, logical(1))))
check("M36 ... and a logical gets the fact alone: no line it could not run",
      identical(flat(grab(jlm(y ~ I(Flag * 2), data = dm))),
                .m_cat("Flag", "I(Flag * 2)")) &&
        identical(flat(grab(jlm(y ~ I(Flag > 0), data = dm))),
                  .m_cat("Flag", "I(Flag > 0)")))
check("M37 the other refusals of a computed term are where they were: a data frame named inside it, a workspace vector it would recycle, and jcrosstab()'s",
      { v3_m <- c(1, 2, 1)
        grepl("names the dm data frame inside the formula",
              flat(grab(jlm(y ~ I(dm$Sex == 1), data = dm))), fixed = TRUE) &&
          grepl("v3_m has 3 values for the 48 cases",
                flat(grab(jlm(y ~ I(Sex == v3_m), data = dm))), fixed = TRUE) &&
          grepl("The formula applies a function to a variable: I(Grp >= 3).",
                flat(grab(jcrosstab(Sex ~ I(Grp >= 3), data = dm))), fixed = TRUE) })
rm(dm)
rm(list = intersect(c(".m_out", ".m_dreg", ".m_ireg", ".m_ref", ".m_only",
                      ".m_enc", ".m_stale", ".m_lab", ".m_cast", ".m_plain",
                      ".m_same", ".m_cat", ".l_rows_m"),
                    ls(all.names = TRUE)))

# =============================================================================
# SECTION N -- NO CASE LEFT TO ANALYZE; A PREDICTOR WITH ONE VALUE; A COMPUTED
#              OUTCOME; THE "seems categorical" RERUN LINES (S346, v0.9.219)
# =============================================================================
# Fix Slate 8, first cut. (1) An analysis sample emptied by a filter or by
# missing data got five answers: jlm()'s and jlogistic()'s house stop, "'g3'
# has 0 categories", R's "grouping factor must have exactly 2 levels" and
# "contrasts can be applied only to factors with 2 or more levels" under
# empty tables, "'yb' has values: ." ahead of the Case Processing block, and
# in jalpha() blank tables under a warning naming items "NA, NA, NA". One
# stop now, under the block, ahead of every group count (the S338 item).
# (2) The zero-variance stop names its predictor as the subject and points
# at the filters only when a filter excluded cases (the S338 wording item).
# (3) jlogistic() with a computed outcome stopped "'I(yb > 0)' has values:
# ." (the S342 item). (4) The "seems categorical" warning's rerun lines were
# built from the rewritten formula through deparse(), 60 characters at a
# time: a longer formula printed cut off, a name that needs backticks lost
# them, and a call that named its frame was offered a line without it (the
# S345 item). Every printed line is run here.
cat("\n--- N. No case left; a constant predictor; a computed outcome; the rerun lines ---\n")

.n_fns <- list(jt        = quote(jt(y ~ nb, data = dn)),
               jaov      = quote(jaov(y ~ g, data = dn)),
               jcrosstab = quote(jcrosstab(g ~ nb, data = dn)),
               jlm       = quote(jlm(y ~ x1, data = dn)),
               jlogistic = quote(jlogistic(yb ~ x1, data = dn)),
               jalpha    = quote(jalpha(dn, x1, x2, y)))
dn <- d[, c("g", "y", "yb", "x1", "x2", "k", "hv")]
dn$nb <- rep(c("u", "u", "v", "u", "v"), length.out = nrow(dn))
.n_with <- function(cl, extra) { cl[names(extra)] <- extra; cl }
# What a call prints before it stops, and the warnings it raises: section
# K's two helpers, which that section removes at its end.
.n_pre <- function(expr) {
  out <- utils::capture.output(suppressMessages(suppressWarnings(
    tryCatch(expr, error = function(e) invisible(NULL)))))
  out <- gsub("\033\\[[0-9;]*[A-Za-z]", "", out)
  out[nzchar(out)]
}
.n_warns <- function(expr) {
  w <- character(0)
  zz <- textConnection(".junk", "w", local = TRUE)
  sink(zz, type = "output")
  on.exit({ sink(type = "output"); close(zz) }, add = TRUE)
  withCallingHandlers(
    tryCatch(expr, error = function(e) NULL),
    warning = function(x) {
      w <<- c(w, conditionMessage(x)); invokeRestart("muffleWarning")
    })
  w
}
.n_empty <- function(how) paste0("(): No cases are left to analyze.\n",
                                 "All 120 cases were excluded ", how, ".")
check("N01 emptied by a filter: jt(), jaov(), jcrosstab(), jlm(), jlogistic() and jalpha() give one stop, pinned whole",
      all(vapply(names(.n_fns), function(f) {
        identical(grab(eval(.n_with(.n_fns[[f]], list(subset = quote(x1 > 99))))),
                  paste0(f, .n_empty("by a filter")))
      }, logical(1))))
check("N02 emptied by missing data: the same stop, saying so",
      { dn_na <- dn; dn_na$x1[] <- NA_real_; dn_na$y[] <- NA_real_; dn_na$g[] <- NA
        # Each call is run where dn is the emptied frame.
        all(vapply(names(.n_fns), function(f) {
          identical(grab(eval(.n_fns[[f]], list(dn = dn_na), globalenv())),
                    paste0(f, .n_empty("because of missing data")))
        }, logical(1))) })
check("N03 some cases gone to a filter and the rest to missing data: both are named",
      { d2 <- dn; d2$y[d2$x1 > 0] <- NA
        identical(grab(jlm(y ~ x2, data = d2, subset = x1 > 0)),
                  paste0("jlm", .n_empty("by a filter or because of missing data"))) })
check("N04 the count agrees in number and is grouped at a thousand: 'The 1 case was', 'All 1,200 cases were'",
      { one <- grab(jlm(y ~ x1, data = data.frame(y = NA_real_, x1 = 1.5)))
        big <- tryCatch(jstats:::.jst_stop_empty_sample(list(
          n_analysis = 0L, n_original = 1200L, n_after_pipeline = 1200L)),
          error = function(e) conditionMessage(e))
        identical(one, paste0("jlm(): No cases are left to analyze.\n",
                              "The 1 case was excluded because of missing data.")) &&
          identical(big, paste0("No cases are left to analyze.\n",
                                "All 1,200 cases were excluded because of missing data.")) })
check("N05 the stop comes under the Case Processing block and ahead of the group count: no '0 categories', no empty descriptives, in jt(), jaov() and jcrosstab()",
      all(vapply(c("jt", "jaov", "jcrosstab"), function(f) {
        cl <- .n_with(.n_fns[[f]], list(subset = quote(x1 > 99)))
        p  <- .n_pre(eval(cl))
        g  <- grab(eval(cl))
        any(grepl("Analysis N", p, fixed = TRUE)) &&
          !any(grepl("Group Descriptives", p, fixed = TRUE)) &&
          !grepl("categor", g, fixed = TRUE)
      }, logical(1))))
check("N06 ... at the minimal level, where the block is one line, and under a stored jsubset(), which the group-count stop used to name",
      { quiet(joutput("minimal"))
        a <- grab(jt(y ~ nb, data = dn, subset = x1 > 99))
        p <- .n_pre(jt(y ~ nb, data = dn, subset = x1 > 99))
        quiet(joutput(NULL))
        b <- with_state(quiet(jsubset(dn, x1 > 99)), grab(jaov(y ~ g, data = dn)),
                        quiet(jsubset(dn, NULL)))
        identical(a, paste0("jt", .n_empty("by a filter"))) &&
          any(p == "Analysis N: 0 (120 Excluded)") &&
          identical(b, paste0("jaov", .n_empty("by a filter"))) })
check("N07 jalpha(): no warning that items 'NA, NA, NA' are negatively correlated, and no table printed",
      { w <- .n_warns(jalpha(dn, x1, x2, y, subset = x1 > 99))
        p <- .n_pre(jalpha(dn, x1, x2, y, subset = x1 > 99))
        length(w) == 0L && !any(grepl("Reliability Statistics", p, fixed = TRUE)) })
check("N08 jlogistic(): the Case Processing block prints before the stop, for a filter and for an outcome missing in every case (it answered \"'yb' has values: .\" ahead of the block)",
      { p1 <- .n_pre(jlogistic(yb ~ x1, data = dn, subset = x1 > 99))
        d2 <- dn; d2$yb[] <- NA
        p2 <- .n_pre(jlogistic(yb ~ x1, data = d2))
        g2 <- grab(jlogistic(yb ~ x1, data = d2))
        any(grepl("Analysis N", p1, fixed = TRUE)) && any(grepl("Analysis N", p2, fixed = TRUE)) &&
          identical(g2, paste0("jlogistic", .n_empty("because of missing data"))) &&
          !grepl("has values", g2, fixed = TRUE) })
check("N09 control: the helper returns for two cases or more (since S346 one case stops: section P)",
      is.null(jstats:::.jst_stop_empty_sample(list(n_analysis = 2L, n_original = 120L,
                                                   n_after_pipeline = 2L))) &&
        is.null(jstats:::.jst_stop_empty_sample(list(n_analysis = 120L, n_original = 120L,
                                                     n_after_pipeline = 120L))) &&
        !grepl("No cases are left", grab(jaov(y ~ g, data = dn, subset = x1 > 0)),
               fixed = TRUE))
check("N10 control: jdesc() and jcorr() are not listwise and keep their own output on an empty sample -- no stop",
      { a <- tryCatch({ quiet(jdesc(dn, x1, subset = x1 > 99)); "ran" },
                      error = function(e) "stopped")
        b <- tryCatch({ quiet(jcorr(dn, x1, x2, subset = x1 > 99)); "ran" },
                      error = function(e) "stopped")
        identical(a, "ran") && identical(b, "ran") })

# ---- N11-N15: a predictor with one value ------------------------------------
.n_one <- paste0("k has only one value in the analysis sample, so its\n",
                 "coefficient cannot be estimated.")
check("N11 no filter of any kind: the fact, one sentence, the predictor its subject -- and no guess at jsubset() (it ended 'This often happens when jsubset() restricts the sample ...')",
      identical(grab(jlm(y ~ x1 + k, data = dn)), paste0("jlm(): ", .n_one)) &&
        identical(flat(grab(jlogistic(yb ~ x1 + k, data = dn))),
                  flat(paste0("jlogistic(): ", .n_one))) &&
        !grepl("jsubset", grab(jlm(y ~ x1 + k, data = dn)), fixed = TRUE))
check("N12 two predictors: 'have only one value each ... their coefficients', the names joined with 'and'",
      { d2 <- dn; d2$k2 <- 2
        identical(flat(grab(jlm(y ~ x1 + k + k2, data = d2))),
                  paste0("jlm(): k and k2 have only one value each in the analysis ",
                         "sample, so their coefficients cannot be estimated.")) })
check("N13 a subset = that excluded cases: a second line, naming it",
      identical(grab(jlm(y ~ x1 + k, data = dn, subset = x1 > 0)),
                paste0("jlm(): ", .n_one, "\n",
                       "Check whether subset = is excluding the other values.")))
check("N14 a stored setting that excluded cases: the settings named as settings; with subset = as well, both",
      { a <- with_state(quiet(jsubset(dn, x1 > 0)), grab(jlm(y ~ x1 + k, data = dn)),
                        quiet(jsubset(dn, NULL)))
        b <- with_state(quiet(jsubset(dn, x1 > 0)),
                        grab(jlogistic(yb ~ x1 + k, data = dn, subset = x2 > 0)),
                        quiet(jsubset(dn, NULL)))
        identical(flat(a), flat(paste0("jlm(): ", .n_one, " Check whether your jsubset or ",
                                       "jcomplete settings are excluding the other values."))) &&
          identical(flat(b), flat(paste0("jlogistic(): ", .n_one, " Check whether your jsubset ",
                                         "or jcomplete settings, or subset =, are excluding ",
                                         "the other values."))) })
check("N15 control: a stored setting, or a subset =, that excludes NO case adds no line",
      { a <- with_state(quiet(jsubset(dn, x1 > -99)), grab(jlm(y ~ x1 + k, data = dn)),
                        quiet(jsubset(dn, NULL)))
        b <- grab(jlm(y ~ x1 + k, data = dn, subset = x1 > -99))
        identical(a, paste0("jlm(): ", .n_one)) && identical(b, paste0("jlm(): ", .n_one)) })

# ---- N16-N17: a computed outcome --------------------------------------------
check("N16 jlogistic() with a computed outcome: the term named for what it is and the state to reach (it stopped \"'I(yb > 0)' has values: .\" and suggested jrecode())",
      identical(flat(grab(jlogistic(I(y > 0) ~ x1, data = dn))),
                paste0("jlogistic(): I(y > 0) is a computed term, and the outcome of a ",
                       "logistic regression must be a variable in the data. ",
                       "Create a 0/1 variable first, then use it as the outcome.")) &&
        grepl("I(g == \"a\") is a computed term", flat(grab(jlogistic(I(g == "a") ~ x1, data = dn))),
              fixed = TRUE) &&
        !grepl("has values", grab(jlogistic(I(y > 0) ~ x1, data = dn)), fixed = TRUE))
check("N17 control: a computed PREDICTOR still fits, as glm() fits it, and jlm() takes a computed outcome as it did",
      { m <- quiet(jlogistic(yb ~ I(x1 > 0), data = dn))
        t <- stats::glm(yb ~ I(x1 > 0), data = dn, family = stats::binomial)
        l <- quiet(jlm(log(abs(y) + 1) ~ x1, data = dn))
        is.list(m) && near(m$coefficients_raw$b, unname(stats::coef(t)), 1e-6) &&
          is.list(l) && near(l$coefficients_raw$b,
                             unname(stats::coef(stats::lm(log(abs(y) + 1) ~ x1, data = dn)))) })

# ---- N18-N26: the "seems categorical" rerun lines ---------------------------
# .n_code(): a message's indented lines, as lines of R.
.n_code <- function(msg) {
  ln <- strsplit(msg, "\n", fixed = TRUE)[[1]]
  trimws(ln[startsWith(ln, "  ")])
}
# .n_terms(): the coefficient terms of the fit a printed line gives, the line
# run in an environment of its own that can see the workspace.
.n_run <- function(lines, env = new.env(parent = globalenv())) {
  r <- NULL
  for (ln in lines) r <- quiet(eval(parse(text = ln), envir = env))
  r
}
.n_seem <- function(fn, f, dat, cat = "\"hv\"", pre = NULL, reg = dat) paste0(
  "hv seems categorical.\n",
  "To treat it that way, register it with jdummy() and rerun:\n\n",
  pre,
  "  jdummy(", reg, ", hv)\n",
  "  ", fn, "(", f, if (nzchar(reg)) paste0(", ", reg), ")\n\n",
  "Or, for this call only:\n",
  "  ", fn, "(", f, if (nzchar(dat)) paste0(", ", dat), ", categorical = ", cat, ")")
.n_w1 <- grab(jlm(y ~ x1 + hv, data = dn))
check("N18 jlm(), the frame named: the warning pinned whole -- a sentence a line, the rerun with the frame, the second call on a line of its own",
      identical(.n_w1, .n_seem("jlm", "y ~ x1 + hv", "dn")))
check("N19 ... each printed line runs: the first route registers hv and refits with it categorical, the second fits the same model in one call",
      { cd <- .n_code(.n_w1)
        a  <- with_state(NULL, .n_run(cd[1:2]), quiet(jdummy(dn, hv, remove = TRUE)))
        b  <- .n_run(cd[3L])
        length(cd) == 3L && is.list(a) && is.list(b) &&
          identical(a$coefficients_raw$term, c("(Intercept)", "x1", "hv_Mid", "hv_High")) &&
          near(a$coefficients_raw$b, b$coefficients_raw$b) })
# Names that need backticks, and two long enough to carry a formula of
# plain names past 60 characters (N27).
dn_w <- local({ z <- dn; z$`Wave 2 score` <- z$y; z$`my grp` <- z$hv
                z$FinancialLiteracyMeanScore <- z$x1
                z$RelationshipSatisfactionIndex <- z$x2; z })
.n_long <- grab(jlm(`Wave 2 score` ~ scale(x1, scale = FALSE) * x2 + I(x1^2) +
                      log(abs(x2) + 1) + `my grp`, data = dn_w))
check("N20 a formula longer than 60 characters prints whole, on one line, with the backticks its names need (it was cut at 60 and ended ' + )')",
      { cd <- .n_code(.n_long)
        f  <- "`Wave 2 score` ~ scale(x1, scale = FALSE) * x2 + I(x1^2) + log(abs(x2) + 1) + `my grp`"
        identical(cd, c("jdummy(dn_w, `my grp`)",
                        paste0("jlm(", f, ", dn_w)"),
                        paste0("jlm(", f, ", dn_w, categorical = \"my grp\")"))) &&
          startsWith(.n_long, "my grp seems categorical.\n") })
check("N21 ... and those lines run, a computed term and a name with a space in it included",
      { cd <- .n_code(.n_long)
        a  <- with_state(NULL, .n_run(cd[1:2]), quiet(jdummy(dn_w, `my grp`, remove = TRUE)))
        b  <- .n_run(cd[3L])
        is.list(a) && is.list(b) && nrow(a$coefficients_raw) == 8L &&
          near(a$coefficients_raw$b, b$coefficients_raw$b) })
check("N22 under a juse() default the lines carry no data frame, and run under it",
      with_state(quiet(juse(dn)),
                 { w  <- grab(jlm(y ~ x1 + hv))
                   cd <- .n_code(w)
                   b  <- .n_run(cd[3L])
                   identical(cd, c("jdummy(dn, hv)", "jlm(y ~ x1 + hv)",
                                   "jlm(y ~ x1 + hv, categorical = \"hv\")")) &&
                     is.list(b) && nrow(b$coefficients_raw) == 4L },
                 quiet(juse(NULL))))
check("N23 an expression given as the data: it is named first, since a registration needs a name; the second route keeps the call as typed; every line runs",
      { mk_n <- function() dn
        w  <- grab(jlm(y ~ x1 + hv, mk_n()))
        cd <- .n_code(w)
        e  <- new.env(parent = globalenv()); assign("mk_n", mk_n, envir = e)
        a  <- .n_run(cd[1:3], e)
        quiet(jdummy(clear.all = TRUE))
        b  <- .n_run(cd[4L], e)
        identical(cd, c("mydata <- mk_n()", "jdummy(mydata, hv)",
                        "jlm(y ~ x1 + hv, mydata)",
                        "jlm(y ~ x1 + hv, mk_n(), categorical = \"hv\")")) &&
          is.list(a) && is.list(b) && near(a$coefficients_raw$b, b$coefficients_raw$b) })
check("N24 a place given as the data keeps it in every line, and they run",
      { lst_n <- list(dd = dn)
        w  <- grab(jlm(y ~ x1 + hv, lst_n$dd))
        cd <- .n_code(w)
        e  <- new.env(parent = globalenv()); assign("lst_n", lst_n, envir = e)
        a  <- .n_run(cd[1:2], e)
        quiet(jdummy(clear.all = TRUE))
        identical(cd, c("jdummy(lst_n$dd, hv)", "jlm(y ~ x1 + hv, lst_n$dd)",
                        "jlm(y ~ x1 + hv, lst_n$dd, categorical = \"hv\")")) &&
          is.list(a) && nrow(a$coefficients_raw) == 4L })
check("N25 the call's own categorical = is kept in the second route, and a variable registered with jdummy() shows as typed, not as its dummy columns",
      { w  <- with_state(quiet(jdummy(dn, g)),
                         grab(jlm(y ~ g + nb + hv, data = dn, categorical = "nb")),
                         quiet(jdummy(dn, g, remove = TRUE)))
        cd <- .n_code(w)
        identical(cd[2:3], c("jlm(y ~ g + nb + hv, dn)",
                             "jlm(y ~ g + nb + hv, dn, categorical = c(\"nb\", \"hv\"))")) })
check("N26 jlogistic() prints the same warning under its own name, and its lines run",
      { w  <- grab(jlogistic(yb ~ x1 + hv, data = dn))
        cd <- .n_code(w)
        b  <- .n_run(cd[3L])
        identical(w, .n_seem("jlogistic", "yb ~ x1 + hv", "dn")) &&
          is.list(b) && identical(b$coefficients_raw$term,
                                  c("(Intercept)", "x1", "hv_Mid", "hv_High")) })
check("N27 jplot()'s refusal of two predictors prints the formula whole and the frame the call named, and the fit line runs (it printed '<data>')",
      { g  <- grab(jplot(`Wave 2 score` ~ FinancialLiteracyMeanScore +
                           RelationshipSatisfactionIndex, dn_w))
        cd <- .n_code(g)
        m  <- .n_run(sub("^m <- ", "", cd[1L]))
        u  <- with_state(quiet(juse(dn)), .n_code(grab(jplot(y ~ x1 + x2)))[1L],
                         quiet(juse(NULL)))
        !grepl("<data>", g, fixed = TRUE) &&
          identical(cd, c(paste0("m <- jlm(`Wave 2 score` ~ FinancialLiteracyMeanScore + ",
                                 "RelationshipSatisfactionIndex, dn_w)"),
                          "jplot(m)")) &&
          is.list(m) && nrow(m$coefficients_raw) == 3L &&
          identical(u, "m <- jlm(y ~ x1 + x2)") })
rm(dn, dn_w)
rm(list = intersect(c(".n_fns", ".n_with", ".n_empty", ".n_one", ".n_code",
                      ".n_run", ".n_seem", ".n_w1", ".n_long", ".n_pre",
                      ".n_warns"),
                    ls(all.names = TRUE)))

# =============================================================================
# SECTION O -- DIAGNOSTICS IN jlm() AND jlogistic(): APART FROM THE LEVELS; A
#              NAME THAT IS NOT A DIAGNOSTIC STOPS (S346, v0.9.219)
# =============================================================================
# Jeff's ruling of 8 October 2026. diagnostics = is TRUE (every diagnostic
# the function has: jlm()'s VIF table and five plots, jlogistic()'s VIF
# table), FALSE, or names combined with c(); joutput() stores the same
# setting, each function taking what applies to it. No level turns it on:
# joutput("full") and full = TRUE printed the VIF table and drew the plots
# until v0.9.219. A name that is not one of the function's diagnostics
# stops, where jlm(diagnostics = c("vif", "qqq")) printed the VIF table and
# no plot and said nothing. The lines under a VIF above 10 are the table's
# interpretation and print with it except at the minimal level.
cat("\n--- O. Diagnostics in jlm() and jlogistic() ---\n")
do <- d[, c("y", "yb", "x1", "x2")]
do$x4 <- do$x1 + do$x2 / 12                  # nearly x1: a VIF far above 10
.o_out <- function(expr) {
  grDevices::pdf(NULL); on.exit(grDevices::dev.off(), add = TRUE)
  res <- tryCatch(suppressMessages(suppressWarnings(utils::capture.output(expr))),
                  error = function(e) paste0("[error] ", conditionMessage(e)))
  gsub("\033\\[[0-9;]*[A-Za-z]", "", res)
}
.o_vif   <- function(o) any(o == "VIF (Variance Inflation Factors)")
# The list under "N diagnostic plots produced" numbers "1." since S347
# (jlogistic()'s form; it was "1:").
.o_plots <- function(o) sub("^  [0-9]\\. ", "", grep("^  [0-9]\\. ", o, value = TRUE))
.o_all5  <- c("Residuals vs Fitted", "Normal Q-Q", "Scale-Location",
              "Cook's Distance", "Residuals vs Leverage")
.o_err <- function(expr) {
  grDevices::pdf(NULL); on.exit(grDevices::dev.off(), add = TRUE)
  grab(expr)
}

check("O01 the resolver: TRUE is the function's own set, FALSE and no setting are nothing, names are taken in the set's order, another function's name is not this one's",
      { r <- jstats:::.jst_resolve_diagnostics
        identical(r(TRUE, "jlm"), c("vif", "residuals", "qq", "scale", "cooks", "leverage")) &&
          identical(r(TRUE, "jlogistic"), "vif") && identical(r(TRUE, "jaov"), "levene") &&
          identical(r(TRUE, "jt"), "levene") &&
          identical(r(FALSE, "jlm"), character(0)) && identical(r(NULL, "jlm"), character(0)) &&
          identical(r(c("qq", "vif"), "jlm"), c("vif", "qq")) })
check("O02 ... and with no argument it reads joutput()'s setting, each function taking what applies to it",
      with_state(quiet(joutput(diagnostics = c("levene", "qq", "vif"), quiet = TRUE)),
                 { r <- jstats:::.jst_resolve_diagnostics
                   identical(r(NULL, "jlm"), c("vif", "qq")) &&
                     identical(r(NULL, "jlogistic"), "vif") &&
                     identical(r(NULL, "jaov"), "levene") &&
                     identical(r(FALSE, "jlm"), character(0)) &&
                     identical(r("cooks", "jlm"), "cooks") },
                 quiet(joutput(NULL, quiet = TRUE))))
check("O03 jlm(diagnostics = TRUE): the VIF table and all five plots, at the standard level",
      { o <- .o_out(jlm(y ~ x1 + x2, data = do, diagnostics = TRUE))
        .o_vif(o) && identical(.o_plots(o), .o_all5) })
check("O04 no level brings them: joutput(\"full\") and full = TRUE print no VIF table and draw no plot (both did until v0.9.219), and full = TRUE still adds the interval",
      { quiet(joutput("full", quiet = TRUE))
        a <- .o_out(jlm(y ~ x1 + x2, data = do))
        b <- .o_out(jlogistic(yb ~ x1 + x2, data = do))
        quiet(joutput(NULL, quiet = TRUE))
        f <- .o_out(jlm(y ~ x1 + x2, data = do, full = TRUE))
        g <- .o_out(jlogistic(yb ~ x1 + x2, data = do, full = TRUE))
        !.o_vif(a) && length(.o_plots(a)) == 0L && !.o_vif(b) &&
          !.o_vif(f) && length(.o_plots(f)) == 0L && !.o_vif(g) &&
          any(grepl("95% CI Lower", f, fixed = TRUE)) &&
          any(grepl("Classification Table", g, fixed = TRUE)) })
check("O05 names show the ones named, in the set's own order whatever order they were typed in",
      { a <- .o_out(jlm(y ~ x1 + x2, data = do, diagnostics = c("vif", "qq")))
        b <- .o_out(jlm(y ~ x1 + x2, data = do, diagnostics = c("cooks", "residuals")))
        .o_vif(a) && any(a == "(Diagnostic plot produced: Normal Q-Q)") &&
          !.o_vif(b) && identical(.o_plots(b), c("Residuals vs Fitted", "Cook's Distance")) })
check("O06 a name that is not one of jlm()'s stops, pinned whole (it was ignored: the table printed, the plot did not, nothing was said)",
      identical(.o_err(jlm(y ~ x1 + x2, data = do, diagnostics = c("vif", "qqq"))),
                paste0("jlm(): \"qqq\" is not a diagnostic of jlm().\n",
                       "`diagnostics` must be TRUE, FALSE, or one or more of \"vif\", \"residuals\",\n",
                       "\"qq\", \"scale\", \"cooks\", and \"leverage\".")) &&
        identical(.o_err(jlm(y ~ x1 + x2, data = do, diagnostics = "levene")),
                  paste0("jlm(): \"levene\" is not a diagnostic of jlm().\n",
                         "`diagnostics` must be TRUE, FALSE, or one or more of \"vif\", \"residuals\",\n",
                         "\"qq\", \"scale\", \"cooks\", and \"leverage\".")) &&
        identical(.o_err(jlogistic(yb ~ x1 + x2, data = do, diagnostics = "qq")),
                  paste0("jlogistic(): \"qq\" is not a diagnostic of jlogistic().\n",
                         "`diagnostics` must be TRUE, FALSE, or \"vif\".")))
check("O07 several names in one string get the c() form, and the argument it shows runs in the call",
      { e  <- .o_err(jlm(y ~ x1 + x2, data = do, diagnostics = "vif + qq"))
        ln <- trimws(strsplit(e, "\n", fixed = TRUE)[[1L]][3L])
        o  <- .o_out(eval(parse(text = paste0("jlm(y ~ x1 + x2, data = do, ", ln, ")"))))
        identical(e, paste0("jlm(): \"vif + qq\" is not a diagnostic.\n",
                            "To ask for more than one, combine them with c():\n",
                            "  diagnostics = c(\"vif\", \"qq\")")) &&
          .o_vif(o) && any(o == "(Diagnostic plot produced: Normal Q-Q)") &&
          grepl("combine them with c()", .o_err(jlm(y ~ x1 + x2, data = do,
                                                    diagnostics = "residuals,cooks")), fixed = TRUE) })
check("O08 the stop comes before the title, and a value that is neither TRUE, FALSE nor names is refused",
      { o <- .o_out(jlm(y ~ x1 + x2, data = do, diagnostics = "qqq"))
        length(o) == 1L &&
          startsWith(o, "[error] jlm(): \"qqq\" is not a diagnostic of jlm().\n") } &&
        startsWith(.o_err(jlm(y ~ x1 + x2, data = do, diagnostics = 2)),
                   "jlm(): `diagnostics` must be TRUE, FALSE, or one or more of") &&
        startsWith(.o_err(jlogistic(yb ~ x1 + x2, data = do, diagnostics = NA)),
                   "jlogistic(): `diagnostics` must be TRUE, FALSE, or \"vif\"."))
check("O09 jlogistic(diagnostics = TRUE) is its VIF table, the predictors' ordinary VIF: 1 / (1 - R-squared) of each on the other",
      { o <- .o_out(jlogistic(yb ~ x1 + x2, data = do, diagnostics = TRUE))
        m <- quiet(jlogistic(yb ~ x1 + x2, data = do, diagnostics = "vif"))
        v <- 1 / (1 - stats::cor(do$x1, do$x2)^2)
        .o_vif(o) && is.list(m) && near(m$vif, c(v, v)) })
check("O10 joutput(diagnostics = ) reaches both functions; a set naming only Levene's test leaves them alone; the call's own FALSE wins",
      { quiet(joutput(diagnostics = TRUE, quiet = TRUE))
        a <- .o_out(jlm(y ~ x1 + x2, data = do))
        b <- .o_out(jlogistic(yb ~ x1 + x2, data = do))
        f <- .o_out(jlm(y ~ x1 + x2, data = do, diagnostics = FALSE))
        quiet(joutput(diagnostics = c("levene", "vif"), quiet = TRUE))
        k <- .o_out(jlm(y ~ x1 + x2, data = do))
        quiet(joutput(diagnostics = "levene", quiet = TRUE))
        n <- .o_out(jlm(y ~ x1 + x2, data = do))
        quiet(joutput(NULL, quiet = TRUE))
        .o_vif(a) && identical(.o_plots(a), .o_all5) && .o_vif(b) &&
          !.o_vif(f) && length(.o_plots(f)) == 0L &&
          .o_vif(k) && length(.o_plots(k)) == 0L &&
          !any(grepl("Diagnostic plot", k, fixed = TRUE)) &&
          !.o_vif(n) && length(.o_plots(n)) == 0L })
check("O11 the lines under a VIF above 10 print with the table at the standard and full levels and not at minimal, where the table still prints -- in jlm() and in jlogistic()",
      { got <- lapply(c("minimal", "standard", "full"), function(lv) {
          quiet(joutput(lv, quiet = TRUE))
          a <- .o_out(jlm(y ~ x1 + x4, data = do, diagnostics = "vif"))
          b <- .o_out(jlogistic(yb ~ x1 + x4, data = do, diagnostics = "vif"))
          c(.o_vif(a), any(grepl("standard error inflated by a factor of", a, fixed = TRUE)),
            .o_vif(b), any(grepl("standard error inflated by a factor of", b, fixed = TRUE)))
        })
        quiet(joutput(NULL, quiet = TRUE))
        identical(got, list(c(TRUE, FALSE, TRUE, FALSE), c(TRUE, TRUE, TRUE, TRUE),
                            c(TRUE, TRUE, TRUE, TRUE))) })
check("O12 control: which =, plots = and show = given to jlm() are still pointed at diagnostics",
      identical(.o_err(jlm(y ~ x1 + x2, data = do, which = "qq")),
                "jlm(): 'which' is not valid. Did you mean `diagnostics`?"))
rm(do)
rm(list = intersect(c(".o_out", ".o_vif", ".o_plots", ".o_all5", ".o_err"),
                    ls(all.names = TRUE)))

# =============================================================================
# SECTION P -- A FILTER THAT NAMES THE VARIABLE; ONE CASE LEFT; AN OUTCOME
#              WITH ONE VALUE (S346, v0.9.219, second delivery)
# =============================================================================
# Jeff, walking models_walk.R Section 18 at v0.9.219's first delivery, on
# jlm(Flourishing ~ SocialSupport + PriorTherapy, subset = PriorTherapy ==
# 1) and its "Check whether subset = is excluding the other values": "the
# error message doesn't address the real problem". When a variable an
# analysis needs to vary has one value and a filter's condition names that
# variable, the filter is the cause: the stop says what the filter did and
# gives the way out -- remove subset =, or set the jsubset() filter aside --
# and, for a predictor, the other way out: remove it from the formula. jt(),
# jaov() and jcrosstab() said "'g' has 1 category" and nothing of the
# filter; jlogistic() said "'yb' has values: 1 ... Use jrecode()" of an
# outcome coded 0/1; jlm() with a constant outcome stopped on R's "0
# (non-NA) cases"; and one case left was answered with whichever variable
# was checked first. Where no filter names the variable the stops are as
# they were, but for the outcome (no stop of its own until now) and the
# dummy-coded predictor, whose guess "This often happens when jsubset()
# restricts the sample ..." is gone.
cat("\n--- P. A filter that names the variable; one case left; an outcome with one value ---\n")

dp <- d[, c("y", "yb", "g", "gn", "gf", "x1", "x2")]
dp$t01  <- rep(c(0, 1), length.out = nrow(dp))
dp$t02  <- rep(c(0, 0, 1, 1), length.out = nrow(dp))
dp$a01  <- as.integer(dp$g == "a")                  # one value when g is "a"
dp$xm   <- dp$x1; dp$xm[dp$t01 == 0] <- NA          # missing wherever t01 is 0
dp$yb1  <- ifelse(dp$g == "a", 1, dp$yb)            # all 1 when g is "a"
dp$xq   <- dp$x1; dp$xq[dp$yb == 0] <- NA           # missing wherever yb is 0
dp$ybl1 <- haven::labelled(dp$yb1, labels = c(No = 0, Yes = 1))
dp$y5   <- dp$y; dp$y5[dp$g == "a"] <- 5            # 5 for every "a" case
dp$id   <- seq_len(nrow(dp))
.p_on  <- function(cond) eval(bquote(quiet(jsubset(dp, .(cond)))))
.p_off <- function() quiet(jsubset(dp, NULL))
.p_kept <- function(f, pred) paste0(
  f, " keeps only one value of ", pred, ", so its coefficient cannot be ",
  "estimated. To estimate it, remove the filter. To analyze only those ",
  "cases, remove ", pred, " from the formula.")

# ---- P01-P10: a predictor --------------------------------------------------
.p01 <- grab(jlm(y ~ x1 + t01, data = dp, subset = t01 == 1))
check("P01 jlm(), subset = on a predictor: what the filter did, and both ways out, a sentence a line (it said 'Check whether subset = is excluding the other values')",
      identical(flat(.p01), paste0("jlm(): ", .p_kept("subset = t01 == 1", "t01"))) &&
        grepl("\nTo estimate it, remove the filter.\nTo analyze only those cases, remove t01 from the formula.$",
              .p01) && !grepl("Check whether", .p01, fixed = TRUE))
check("P02 ... and each way out runs: the call without the filter fits t01, the call without t01 fits the cases the filter keeps",
      { a <- quiet(jlm(y ~ x1 + t01, data = dp))
        b <- quiet(jlm(y ~ x1, data = dp, subset = t01 == 1))
        is.list(a) && "t01" %in% names(stats::coef(a$model)) &&
          is.list(b) && near(stats::coef(b$model),
                             stats::coef(stats::lm(y ~ x1, data = dp[dp$t01 == 1, ]))) })
.p03 <- with_state(.p_on(quote(t01 == 1)), grab(jlm(y ~ x1 + t01, data = dp)), .p_off())
check("P03 a stored jsubset() filter on the predictor: named as the filter, and set aside with the line jsubset() itself prints",
      identical(flat(.p03), paste0(
        "jlm(): Your jsubset() filter (t01 == 1) keeps only one value of t01, so its ",
        "coefficient cannot be estimated. To estimate it, set the filter aside: ",
        "jsubset(dp, off) To analyze only those cases, remove t01 from the formula.")) &&
        grepl("set the filter aside:\n  jsubset(dp, off)\nTo analyze", .p03, fixed = TRUE))
check("P04 ... and that line runs: with the filter set aside the same call fits",
      { r <- with_state(.p_on(quote(t01 == 1)),
                        { quiet(eval(parse(text = "jsubset(dp, off)"))); quiet(jlm(y ~ x1 + t01, data = dp)) },
                        .p_off())
        is.list(r) && "t01" %in% names(stats::coef(r$model)) })
.p05 <- with_state(.p_on(quote(t01 == 1)),
                   grab(jlm(y ~ x1 + t01, data = dp, subset = t01 > 0)), .p_off())
check("P05 both filters naming it: both named, 'keep', and both ways to remove them",
      identical(flat(.p05), paste0(
        "jlm(): Your jsubset() filter (t01 == 1) and subset = t01 > 0 keep only one value ",
        "of t01, so its coefficient cannot be estimated. To estimate it, remove subset = ",
        "and set the filter aside: jsubset(dp, off) To analyze only those cases, remove ",
        "t01 from the formula.")))
.p06 <- grab(jlm(y ~ x1 + t01 + t02, data = dp, subset = t01 == 1 & t02 == 1))
check("P06 two predictors the filter names: in number, 'each of', 'their coefficients', both removed",
      identical(flat(.p06), paste0(
        "jlm(): subset = t01 == 1 & t02 == 1 keeps only one value of each of t01 and t02, ",
        "so their coefficients cannot be estimated. To estimate them, remove the filter. ",
        "To analyze only those cases, remove t01 and t02 from the formula.")))
check("P07 a computed term built from the variable the filter names is named as typed",
      identical(flat(grab(jlm(y ~ x2 + I(x1 > 0), data = dp, subset = x1 > 0.5))),
                paste0("jlm(): ", .p_kept("subset = x1 > 0.5", "I(x1 > 0)"))))
check("P08 control: a filter on ANOTHER variable that leaves the predictor one value keeps the hedged line (the form Jeff said fits that case)",
      identical(flat(grab(jlm(y ~ x1 + a01, data = dp, subset = g == "a"))), flat(paste0(
        "jlm(): a01 has only one value in the analysis sample, so its coefficient ",
        "cannot be estimated. ",
        "Check whether subset = is excluding the other values."))))
check("P09 control: a filter that names the predictor but keeps both its values, where listwise deletion took the rest, is not blamed",
      identical(flat(grab(jlm(y ~ t01 + xm, data = dp, subset = t01 >= 0))), flat(paste0(
        "jlm(): t01 has only one value in the analysis sample, so its coefficient ",
        "cannot be estimated."))))
check("P10 jlogistic(): the same stop, under its own name",
      identical(flat(grab(jlogistic(yb ~ x1 + t01, data = dp, subset = t01 == 1))),
                paste0("jlogistic(): ", .p_kept("subset = t01 == 1", "t01"))))

# ---- P11-P13: a dummy-coded predictor --------------------------------------
check("P11 a dummy-coded predictor the filter keeps to one category: what the filter did, the S306 sentence's requirement, both ways out (F16 F17 F30 hold the registered form)",
      identical(flat(grab(jlm(y ~ x1 + gf, data = dp, subset = gf == "c"))), paste0(
        "jlm(): subset = gf == \"c\" keeps only one category of gf (c), and a ",
        "dummy-coded predictor requires at least two. To estimate its coefficients, ",
        "remove the filter. To analyze only those cases, remove gf from the formula.")))
# A registered gf reaches the S306 stop; an unregistered factor is
# dummy-coded in the call, by a builder with a stop of its own.
.p_reg <- function(expr) with_state(quiet(jdummy(dp, gf)), expr,
                                    quiet(jdummy(dp, gf, remove = TRUE)))
.p12 <- .p_reg(grab(jlm(y ~ x1 + gf, data = dp, subset = gn == "5")))
check("P12 a registered predictor left one category by a filter on another variable: the S306 sentence, then the hedged line -- and no guess at jsubset()",
      identical(flat(.p12), paste0(
        "jlm(): gf has only one category in the analysis sample (1: a); a dummy-coded ",
        "predictor requires at least two. Check whether subset = is excluding the ",
        "other categories.")) &&
        grepl("\nCheck whether subset = is excluding the other categories.$", .p12) &&
        !grepl("This often happens", .p12, fixed = TRUE))
# RE-PINNED S347 (v0.9.220): a factor dummy-coded in the call takes the
# registered predictor's sentence and the filters' line, under the block (it
# stopped "'gf' has fewer than 2 categories. Cannot create dummy variables."
# ahead of it).
check("P13 ... with no filter, where listwise deletion left one category, the S306 sentence alone; and an unregistered factor gets the same sentence, with the filters' line, when no filter names it",
      { z <- dp; z$xb <- z$x1; z$xb[z$g != "b"] <- NA
        a <- with_state(quiet(jdummy(z, gf)), grab(jlm(y ~ xb + gf, data = z)),
                        quiet(jdummy(z, gf, remove = TRUE)))
        b <- grab(jlm(y ~ x1 + gf, data = dp, subset = gn == "5"))
        identical(flat(a), paste0(
          "jlm(): gf has only one category in the analysis sample (2: b); a dummy-coded ",
          "predictor requires at least two.")) &&
          identical(flat(b), paste0(
            "jlm(): gf has only one category in the analysis sample (a); a dummy-coded ",
            "predictor requires at least two. Check whether subset = is excluding the ",
            "other categories.")) })
check("P13b a text predictor the filter names, dummy-coded in the call: the same form, in jlm() and in jlogistic()",
      identical(flat(grab(jlm(y ~ x1 + g, data = dp, subset = g == "d"))), paste0(
        "jlm(): subset = g == \"d\" keeps only one category of g (d), and a ",
        "dummy-coded predictor requires at least two. To estimate its coefficients, ",
        "remove the filter. To analyze only those cases, remove g from the formula.")) &&
        grepl("^jlogistic\\(\\): subset = g == \"d\" keeps only one category of g \\(d\\)",
              grab(jlogistic(yb ~ x1 + g, data = dp, subset = g == "d"))))

check("P13c control: a filter that names a registered predictor but keeps two of its categories, where listwise deletion took one, is not blamed",
      { z <- dp; z$xa <- d$xa                     # xa is missing for every "a" case
        a <- with_state(quiet(jdummy(z, gf)),
                        grab(jlm(y ~ xa + gf, data = z, subset = gf %in% c("a", "b"))),
                        quiet(jdummy(z, gf, remove = TRUE)))
        identical(flat(a), paste0(
          "jlm(): gf has only one category in the analysis sample (2: b); a dummy-coded ",
          "predictor requires at least two. Check whether subset = is excluding the ",
          "other categories.")) })

# ---- P14-P19: the group-count stops ----------------------------------------
check("P14 jt(), subset = on the grouping variable: the filter named as the cause, with the way out (it said 'g' has 1 category and nothing of the filter)",
      identical(flat(grab(jt(y ~ g, data = dp, subset = g == "a"))), flat(paste0(
        "jt(): subset = g == \"a\" keeps only 1 category of 'g', and a t-test ",
        "requires exactly 2. ",
        "To compare the categories, remove the filter."))))
check("P15 ... a stored jsubset() filter: set aside with its line, which runs",
      { a <- with_state(.p_on(quote(g == "a")), grab(jt(y ~ g, data = dp)), .p_off())
        r <- with_state(.p_on(quote(g %in% c("a", "b"))),
                        { quiet(eval(parse(text = "jsubset(dp, off)"))); quiet(jt(y ~ g, data = dp, subset = g %in% c("a", "b"))) },
                        .p_off())
        identical(flat(a), paste0(
          "jt(): Your jsubset() filter (g == \"a\") keeps only 1 category of 'g', and a ",
          "t-test requires exactly 2. To compare the categories, set the filter aside: ",
          "jsubset(dp, off)")) && is.list(r) })
check("P16 jaov(): the same, in an ANOVA's words",
      identical(flat(grab(jaov(y ~ g, data = dp, subset = g == "b"))), flat(paste0(
        "jaov(): subset = g == \"b\" keeps only 1 category of 'g', and an ANOVA ",
        "requires at least 2. ",
        "To compare the categories, remove the filter."))))
check("P17 jcrosstab(): the row variable and the column variable",
      identical(flat(grab(jcrosstab(g ~ t01, data = dp, subset = g == "c"))), paste0(
        "jcrosstab(): subset = g == \"c\" keeps only 1 category of 'g', and a ",
        "cross-tabulation requires at least 2 for each variable. To cross-tabulate it, ",
        "remove the filter.")) &&
        identical(flat(grab(jcrosstab(g ~ t01, data = dp, subset = t01 == 0))), paste0(
          "jcrosstab(): subset = t01 == 0 keeps only 1 category of 't01', and a ",
          "cross-tabulation requires at least 2 for each variable. To cross-tabulate it, ",
          "remove the filter.")))
check("P18 control: a filter that names the grouping variable but keeps two of its categories, one emptied by a missing outcome, gets the missing-data line, not the filter's",
      { z <- dp; z$y[z$g == "b"] <- NA
        identical(flat(grab(jt(y ~ g, data = z, subset = g %in% c("a", "b")))), flat(paste0(
          "jt(): 'g' has 1 category. ",
          "A t-test requires exactly 2. ",
          "Cases with a missing 'y' are not counted."))) })
# RE-PINNED S347 (v0.9.220): a subset = that excluded cases gets the
# filters' line, as a stored filter did (the S346 group-count item).
check("P19 a filter on another variable: the count stop, and the line pointing at subset = (K01 holds the stored form)",
      identical(grab(jt(y ~ g, data = dp, subset = gn == "5")),
                paste0("jt(): 'g' has 1 category.\nA t-test requires exactly 2.\n",
                       "Check whether subset = is excluding one of the groups.")))

# ---- P20-P25: an outcome with one value ------------------------------------
.p20o <- utils::capture.output(.p20 <- grab(jlogistic(yb ~ x1, data = dp, subset = yb == 1)))
check("P20 jlogistic(), subset = on the outcome: the filter named, and the way out (it said \"'yb' has values: 1 ... Use jrecode() to create a 0/1 coded version\")",
      identical(flat(.p20), paste0(
        "jlogistic(): subset = yb == 1 keeps only one value of yb, and the outcome of ",
        "a logistic regression needs two. To model yb, remove the filter.")) &&
        grepl("\nTo model yb, remove the filter.$", .p20))
check("P21 ... and it stops under the Case Processing block, which shows the filter",
      { o <- utils::capture.output(suppressMessages(suppressWarnings(
          tryCatch(jlogistic(yb ~ x1, data = dp, subset = yb == 1), error = function(e) NULL))))
        o <- gsub("\033\\[[0-9;]*[A-Za-z]", "", o)
        any(grepl("^ *subset = +[0-9]+ +[0-9]+ +yb == 1$", o)) })
check("P22 an outcome left one value by a filter on another variable: the value, and the hedged line -- no jrecode()",
      identical(flat(grab(jlogistic(yb1 ~ x1, data = dp, subset = g == "a"))), flat(paste0(
        "jlogistic(): yb1 has only one value (1) in the analysis sample, and the ",
        "outcome of a logistic regression needs two. ",
        "Check whether subset = is excluding the other value."))) &&
        identical(flat(grab(jlogistic(ybl1 ~ x1, data = dp, subset = g == "a"))), paste0(
          "jlogistic(): ybl1 has only one value (1: Yes) in the analysis sample, and the ",
          "outcome of a logistic regression needs two. Check whether subset = is ",
          "excluding the other value.")))
check("P23 an outcome left one value by listwise deletion on a predictor: the value, no filter line (glm() was fitted on it)",
      identical(flat(grab(jlogistic(yb ~ xq, data = dp))), flat(paste0(
        "jlogistic(): yb has only one value (1) in the analysis sample, and the ",
        "outcome of a logistic regression needs two."))))
.p_err <- function(expr) tryCatch({ quiet(expr); NA_character_ },
                                   error = function(e) conditionMessage(e))
.p_err2 <- function(expr) {
  zz <- textConnection(".junk", "w", local = TRUE); sink(zz, type = "output")
  on.exit({ sink(type = "output"); close(zz) }, add = TRUE)
  tryCatch({ suppressMessages(suppressWarnings(expr)); NA_character_ },
           error = function(e) conditionMessage(e))
}
check("P24 jlm(), subset = on the outcome: the filter named (it stopped on R's \"0 (non-NA) cases\" under summary.lm()'s \"essentially perfect fit\")",
      identical(flat(.p_err2(jlm(y5 ~ x1, data = dp, subset = y5 == 5))), flat(paste0(
        "jlm(): subset = y5 == 5 keeps only one value of y5, and a regression needs an ",
        "outcome that varies. ",
        "To model y5, remove the filter."))))
check("P25 ... a filter on another variable: the value, and the hedged line",
      identical(flat(.p_err2(jlm(y5 ~ x1, data = dp, subset = g == "a"))), flat(paste0(
        "jlm(): y5 has only one value (5) in the analysis sample, and a regression ",
        "needs an outcome that varies. ",
        "Check whether subset = is excluding the other values."))))

check("P25b control: a filter that names the outcome but keeps its values, where listwise deletion left one, is not blamed",
      { z <- dp; z$xa5 <- z$x1; z$xa5[z$g != "a"] <- NA    # only the y5 == 5 cases
        identical(flat(.p_err2(jlm(y5 ~ xa5, data = z, subset = y5 > -100))), paste0(
          "jlm(): y5 has only one value (5) in the analysis sample, and a regression ",
          "needs an outcome that varies.")) })

# ---- P26-P29: one case left ------------------------------------------------
.p26 <- list(jt        = grab(jt(y ~ g, data = dp, subset = id == 1)),
             jaov      = grab(jaov(y ~ g, data = dp, subset = id == 1)),
             jcrosstab = grab(jcrosstab(g ~ t01, data = dp, subset = id == 1)),
             jlm       = grab(jlm(y ~ x1, data = dp, subset = id == 1)),
             jlogistic = grab(jlogistic(yb ~ x1, data = dp, subset = id == 1)),
             jalpha    = grab(jalpha(dp, x1, x2, y, subset = id == 1)))
check("P26 one case left: one stop in all six listwise functions, the cause said (each named a variable: 'x1 has only one value', \"'g' has 1 category\")",
      all(vapply(names(.p26), function(fn) identical(.p26[[fn]], paste0(
        fn, "(): Only 1 case is left to analyze.\n",
        "The other ", nrow(dp) - 1L, " cases were excluded by a filter.")), logical(1))))
check("P27 ... by missing data, and by both",
      { z <- dp; z$x2[-1] <- NA
        identical(grab(jlm(y ~ x1 + x2, data = z)), paste0(
          "jlm(): Only 1 case is left to analyze.\n",
          "The other ", nrow(z) - 1L, " cases were excluded because of missing data.")) &&
          identical(grab(jlm(y ~ x1 + x2, data = z, subset = id < 10)), paste0(
            "jlm(): Only 1 case is left to analyze.\n",
            "The other ", nrow(z) - 1L,
            " cases were excluded by a filter or because of missing data.")) })
check("P28 ... in number for one other case, and a frame of one row says so without 'left'",
      identical(flat(grab(jlm(y ~ x1, data = dp[1:2, ], subset = id == 1))), flat(paste0(
        "jlm(): Only 1 case is left to analyze. ",
        "The other case was excluded by a filter."))) &&
        identical(grab(jlm(y ~ x1, data = dp[1, ])),
                  "jlm(): There is only 1 case to analyze."))
check("P29 control: two cases left is not this stop",
      !grepl("case is left", grab(jlm(y ~ x1, data = dp, subset = id <= 2)), fixed = TRUE))

# ---- P30-P31: the helpers --------------------------------------------------
check("P30 .jst_term_vars(): a name, the names in a computed term, a name that does not parse",
      { tv <- jstats:::.jst_term_vars
        identical(tv("t01"), "t01") && identical(tv("I(x1 > 0)"), "x1") &&
          identical(tv("scale(x1, scale = FALSE) * x2"), c("x1", "x2")) &&
          identical(tv("my grp"), "my grp") && identical(tv("`my grp`"), "my grp") })
check("P31 .jst_filters_naming(): a filter set aside, a frame with no filter and no name do not count",
      { fnm <- jstats:::.jst_filters_naming
        si  <- list(subset_expr = NULL, n_original = 10L, n_after_pipeline = 10L)
        a <- with_state({ .p_on(quote(t01 == 1)); quiet(jsubset(dp, off)) },
                        fnm("t01", si, "dp"), .p_off())
        b <- fnm("t01", si, "no_such_frame_p")
        c <- fnm("t01", list(subset_expr = "t01 == 1"), NULL)
        !a$stored && !a$per && !b$stored && c$per && identical(c$vars, "t01") })

rm(dp)
rm(list = intersect(c(".p_on", ".p_off", ".p_kept", ".p01", ".p03", ".p05", ".p06",
                      ".p12", ".p20", ".p20o", ".p26", ".p_reg", ".p_err", ".p_err2"),
                    ls(all.names = TRUE)))

# =============================================================================
# SECTION Q -- FIX SLATE 8, SECOND HALF: NO MORE CASES THAN COEFFICIENTS; ONE
#              "seems categorical" WARNING; A PREDICTOR DUMMY-CODED IN THE
#              CALL WITH ONE CATEGORY; THE GROUP-COUNT STOPS AND subset =;
#              THE PRINTED LINES; THE PLOTS (S347, v0.9.220)
# =============================================================================
# (1) A model with no more cases than coefficients printed NaN standard
# errors and a blank p column (jlm) or dozens of glm.fit warnings and an
# Exp(B) of 62 digits (jlogistic): one stop now, under the Case Processing
# block. (2) Several predictors that seem categorical get one warning. (3) A
# predictor dummy-coded in the call with one category stopped ahead of the
# block, "'gf' has fewer than 2 categories. Cannot create dummy variables.";
# it takes the registered predictor's sentence under the block. (4) The
# group-count stops point at a subset = that excluded cases, as at a stored
# filter, and jcrosstab() too. (5) The printed lines: the dummy-names note
# wrapped, the 30-character warning retired, the dichotomy notes' last line
# (voice Rule X), jlogistic()'s text-outcome refusal, an expression given as
# the data, "(a dichotomy)". (6) The plots: jlm()'s plot list in
# jlogistic()'s form, the effect-plot count, the smoother's warnings caught
# and one note printed, the equation's names, a term computed from the
# focal variable following it, and a box plot's groups labeled as the
# descriptives label them. Every printed line to run is run.
cat("\n--- Q. Fix Slate 8, second half ---\n")

set.seed(347)
.q_n <- 48L
dq <- data.frame(y = round(rnorm(.q_n), 3), x1 = round(rnorm(.q_n), 3),
                 x2 = round(rnorm(.q_n), 3), id = seq_len(.q_n),
                 b = rep(0:1, length.out = .q_n), stringsAsFactors = FALSE)
dq$k4  <- rep(1:4, length.out = .q_n)                  # seems categorical
dq$m4  <- rep(c(1, 2, 3, 5), each = .q_n / 4)          # seems categorical
dq$gq  <- rep(c("a", "b", "c"), each = .q_n / 3)        # a only where id <= 16
dq$gn  <- rep(c("u", "v"), length.out = .q_n)
dq$s12 <- rep(1:2, length.out = .q_n)                  # a 1/2 dichotomy
dq$t37 <- rep(c(3, 7), length.out = .q_n)              # a 3/7 dichotomy
dq$bl  <- rep(c("Y", ""), length.out = .q_n)            # a word or blank
dq$gh  <- haven::labelled(rep(1:3, length.out = .q_n),
                          labels = c(Low = 1, Mid = 2, High = 3))
# .q_pre(): what a call prints before it stops, ANSI codes removed.
.q_pre <- function(expr) {
  out <- utils::capture.output(suppressMessages(suppressWarnings(
    tryCatch(expr, error = function(e) invisible(NULL)))))
  out <- gsub("\033\\[[0-9;]*[A-Za-z]", "", out)
  out[nzchar(out)]
}
# .q_both(): the printed lines with messages and warnings written where they
# happen, as options(warn = 1) prints them (format_check.R's both_out()).
# The conditions are taken, never the message stream.
.q_both <- function(expr) {
  op  <- options(warn = 1L)
  tf  <- tempfile(); con <- file(tf, open = "wt"); sink(con)
  grDevices::pdf(NULL)
  ok <- tryCatch({
    withCallingHandlers(force(expr),
      message = function(m) {
        cat(conditionMessage(m), file = con, sep = ""); invokeRestart("muffleMessage")
      },
      warning = function(w) {
        cat("Warning: ", conditionMessage(w), "\n", file = con, sep = "")
        invokeRestart("muffleWarning")
      })
    TRUE
  }, error = function(e) FALSE,
  finally = { grDevices::dev.off(); sink(); close(con); options(op) })
  res <- readLines(tf, warn = FALSE); unlink(tf)
  if (!ok) return("[error]")
  gsub("\033\\[[0-9;]*[A-Za-z]", "", res)
}
# .q_warns(): the warnings a call raises, its printing swallowed.
.q_warns <- function(expr) {
  w <- character(0)
  zz <- textConnection(".junk", "w", local = TRUE); sink(zz, type = "output")
  grDevices::pdf(NULL)
  on.exit({ grDevices::dev.off(); sink(type = "output"); close(zz) }, add = TRUE)
  withCallingHandlers(
    tryCatch(suppressMessages(expr), error = function(e) NULL),
    warning = function(x) { w <<- c(w, conditionMessage(x)); invokeRestart("muffleWarning") })
  w
}
# .q_code(): a message's indented lines, as lines of R.
.q_code <- function(msg) {
  ln <- strsplit(msg, "\n", fixed = TRUE)[[1]]
  trimws(ln[startsWith(ln, "  ")])
}

# ---- Q01-Q07: no more cases than coefficients -------------------------------
.q01 <- grab(jlm(y ~ x1 + x2, data = dq, subset = id > 45))
check("Q01 jlm() with as many cases as coefficients: one stop naming both counts and how the others went, a sentence a line (it printed NaN standard errors and a blank p)",
      identical(flat(.q01), paste0(
        "jlm(): Only 3 cases are left to analyze, and the model has 3 coefficients. ",
        "A regression needs more cases than coefficients. ",
        "The other 45 cases were excluded by a filter.")) &&
        grepl("\nA regression needs more cases than coefficients.\nThe other 45 cases were excluded by a filter.$",
              .q01))
check("Q02 jlogistic(): the same stop in its own words, and no warning of glm()'s ahead of it (it raised 'fitted probabilities numerically 0 or 1' dozens of times)",
      identical(flat(grab(jlogistic(b ~ x1 + x2, data = dq, subset = id > 45))), paste0(
        "jlogistic(): Only 3 cases are left to analyze, and the model has 3 coefficients. ",
        "A logistic regression needs more cases than coefficients. ",
        "The other 45 cases were excluded by a filter.")) &&
        length(.q_warns(jlogistic(b ~ x1 + x2, data = dq, subset = id > 45))) == 0L)
check("Q03 fewer cases than coefficients, the others gone to missing data, and to both",
      local({ z <- dq; z$x2[3:.q_n] <- NA
        # Two cases leave x2 two values, so its dichotomy note prints first:
        # the stop is read from its prefix on.
        a <- sub("^.*(jlm\\(\\): Only)", "\\1", grab(jlm(y ~ x1 + x2, data = z)))
        b <- sub("^.*(jlm\\(\\): Only)", "\\1",
                 grab(jlm(y ~ x1 + x2, data = z, subset = id != 3)))
        identical(flat(a), paste0(
          "jlm(): Only 2 cases are left to analyze, and the model has 3 coefficients. ",
          "A regression needs more cases than coefficients. ",
          "The other 46 cases were excluded because of missing data.")) &&
          identical(flat(b), paste0(
            "jlm(): Only 2 cases are left to analyze, and the model has 3 coefficients. ",
            "A regression needs more cases than coefficients. ",
            "The other 46 cases were excluded by a filter or because of missing data.")) }))
check("Q04 a frame of exactly as many rows: 'There are only', and no line about the others; one other case in the singular",
      identical(flat(grab(jlm(y ~ x1 + x2, data = dq[1:3, ]))), paste0(
        "jlm(): There are only 3 cases to analyze, and the model has 3 coefficients. ",
        "A regression needs more cases than coefficients.")) &&
        grepl("The other case was excluded by a filter.$",
              grab(jlm(y ~ x1 + x2, data = dq[1:4, ], subset = id > 1))))
check("Q05 the stop comes under the Case Processing block, and no table follows it",
      local({ p <- .q_pre(jlm(y ~ x1 + x2, data = dq, subset = id > 45))
        any(grepl("Analysis N", p, fixed = TRUE)) &&
          !any(grepl("Coefficients", p, fixed = TRUE)) }))
check("Q06 a dummy-coded predictor's columns are counted: four cases, an intercept, a slope and two dummies, four coefficients (three terms would not have stopped)",
      grepl("^jlm\\(\\): Only 4 cases are left to analyze, and the model has\\s+4 coefficients\\.",
            grab(jlm(y ~ x1 + gq, data = dq, subset = id %in% c(1, 2, 17, 33)))))
check("Q07 control: one case more than the coefficients fits, as lm() fits it",
      local({ m <- quiet(jlm(y ~ x1 + x2, data = dq, subset = id > 44))
        is.list(m) && near(m$coefficients_raw$b,
                           unname(stats::coef(stats::lm(y ~ x1 + x2, data = dq[dq$id > 44, ])))) &&
          is.null(jstats:::.jst_stop_too_few_cases(list(n_analysis = 4L, n_original = 4L,
                                                        n_after_pipeline = 4L), 3L, "A regression")) }))

# ---- Q08-Q11: one "seems categorical" warning --------------------------------
.q08 <- grab(jlm(y ~ k4 + m4 + x1, data = dq))
check("Q08 two predictors that seem categorical: ONE warning, pinned whole -- both named, one jdummy() call, one refit line, both in categorical = (each had a warning of its own)",
      identical(.q08, paste0(
        "k4 and m4 seem categorical.\n",
        "To treat them that way, register them with jdummy() and rerun:\n\n",
        "  jdummy(dq, k4, m4)\n",
        "  jlm(y ~ k4 + m4 + x1, dq)\n\n",
        "Or, for this call only:\n",
        "  jlm(y ~ k4 + m4 + x1, dq, categorical = c(\"k4\", \"m4\"))")))
check("Q09 ... each printed line runs: the first route registers both and refits, the second fits the same model in one call",
      local({ cd <- .q_code(.q08)
        e  <- new.env(parent = globalenv())
        a  <- with_state(NULL, { for (ln in cd[1:2]) r <- quiet(eval(parse(text = ln), envir = e)); r },
                         quiet(jdummy(dq, k4, m4, remove = TRUE)))
        b  <- quiet(eval(parse(text = cd[3L]), envir = e))
        length(cd) == 3L && is.list(a) && is.list(b) &&
          nrow(a$coefficients_raw) == 8L && near(a$coefficients_raw$b, b$coefficients_raw$b) }))
check("Q10 jlogistic() the same, under its own name",
      identical(grab(jlogistic(b ~ k4 + m4 + x1, data = dq)), paste0(
        "k4 and m4 seem categorical.\n",
        "To treat them that way, register them with jdummy() and rerun:\n\n",
        "  jdummy(dq, k4, m4)\n",
        "  jlogistic(b ~ k4 + m4 + x1, dq)\n\n",
        "Or, for this call only:\n",
        "  jlogistic(b ~ k4 + m4 + x1, dq, categorical = c(\"k4\", \"m4\"))")))
check("Q11 three of them: named 'a, b, and c', and one warning raised in all",
      local({ z <- dq; z$k5 <- rep(1:3, length.out = .q_n)
        w <- .q_warns(jlm(y ~ k4 + m4 + k5, data = z))
        length(w) == 1L && startsWith(w, "k4, m4, and k5 seem categorical.\n") &&
          grepl("  jdummy(z, k4, m4, k5)\n", w, fixed = TRUE) }))

# ---- Q12-Q15: a predictor dummy-coded in the call with one category ----------
.q_cat1 <- paste0("gq has only one category in the analysis sample (a); a dummy-coded ",
                  "predictor requires at least two.")
check("Q12 text dummy-coded in the call, one category left by a filter on another variable: the registered predictor's sentence and the filters' line (it said \"'gq' has fewer than 2 categories. Cannot create dummy variables.\")",
      identical(flat(grab(jlm(y ~ x1 + gq, data = dq, subset = id <= 16))),
                paste0("jlm(): ", .q_cat1, " Check whether subset = is excluding the ",
                       "other categories.")) &&
        identical(flat(grab(jlogistic(b ~ x1 + gq, data = dq, subset = id <= 16))),
                  paste0("jlogistic(): ", .q_cat1, " Check whether subset = is excluding ",
                         "the other categories.")))
check("Q13 ... under the Case Processing block, where it stopped ahead of it",
      local({ p <- .q_pre(jlm(y ~ x1 + gq, data = dq, subset = id <= 16))
        any(grepl("Analysis N", p, fixed = TRUE)) }))
check("Q14 a labelled variable named in categorical = shows its category with its label; a stored filter gets the stored line",
      local({ a <- grab(jlm(y ~ x1 + gh, data = dq, subset = id %% 3 == 1, categorical = "gh"))
        b <- with_state(quiet(jsubset(dq, id %% 3 == 1)),
                        grab(jlm(y ~ x1 + gh, data = dq, categorical = "gh")),
                        quiet(jsubset(dq, NULL)))
        identical(flat(a), paste0(
          "jlm(): gh has only one category in the analysis sample (1: Low); a ",
          "dummy-coded predictor requires at least two. Check whether subset = is ",
          "excluding the other categories.")) &&
          grepl("Check whether your jsubset or jcomplete settings are excluding the other categories.",
                flat(b), fixed = TRUE) }))
check("Q15 no filter: the sentence alone, a missing value not counted as a category; a filter that names the variable keeps its own form (P11, P13b)",
      identical(flat(grab(jlm(y ~ x1 + gq, data = dq[dq$gq == "a", ]))),
                paste0("jlm(): ", .q_cat1)) &&
        { z <- dq[dq$gq == "a", ]; z$gq[1:2] <- NA
          identical(flat(grab(jlm(y ~ x1 + gq, data = z))), paste0("jlm(): ", .q_cat1)) } &&
        grepl("keeps only one category of gq",
              grab(jlm(y ~ x1 + gq, data = dq, subset = gq == "a")), fixed = TRUE))

# ---- Q16-Q20: the group-count stops and subset = -----------------------------
check("Q16 jt(), a subset = on another variable that left one group: the line pointing at it (it said nothing of subset =)",
      identical(grab(jt(y ~ gq, data = dq, subset = id <= 16)),
                paste0("jt(): 'gq' has 1 category.\nA t-test requires exactly 2.\n",
                       "Check whether subset = is excluding one of the groups.")))
check("Q17 jaov() and jcrosstab() the same, each in its own words",
      identical(grab(jaov(y ~ gq, data = dq, subset = id <= 16)),
                paste0("jaov(): 'gq' has 1 category.\nAn ANOVA requires at least 2 groups.\n",
                       "Check whether subset = is excluding one or more groups.")) &&
        identical(grab(jcrosstab(gq ~ gn, data = dq, subset = id <= 16)),
                  paste0("jcrosstab(): 'gq' has 1 category.\n",
                         "A cross-tabulation requires at least 2 categories for each variable.\n",
                         "Check whether subset = is excluding the other categories.")))
check("Q18 a stored filter and a subset =: both named in the one line",
      local({ a <- with_state(quiet(jsubset(dq, id <= 16)),
                        grab(jt(y ~ gq, data = dq, subset = x1 > -99)),
                        quiet(jsubset(dq, NULL)))
        identical(flat(a), paste0(
          "jt(): 'gq' has 1 category after applying the jsubset filter (id <= 16). ",
          "A t-test requires exactly 2. Check whether your jsubset or jcomplete settings, ",
          "or subset =, are excluding one of the groups.")) }))
check("Q19 control: a missing outcome took the group the filters left -- the missing-data line and no filter line, with subset = or a stored filter",
      local({ z <- dq; z$y[z$gq == "b"] <- NA
        want <- paste0("jt(): 'gq' has 1 category.\nA t-test requires exactly 2.\n",
                       "Cases with a missing 'y' are not counted.")
        a <- grab(jt(y ~ gq, data = z, subset = id <= 32))
        b <- with_state(quiet(jsubset(z, id <= 32)), grab(jaov(y ~ gq, data = z)),
                        quiet(jsubset(z, NULL)))
        identical(a, want) && !grepl("Check whether", b, fixed = TRUE) &&
          grepl("Cases with a missing 'y' are not counted.$", b) }))
check("Q20 control: a stored setting that excludes no case adds no line (it was printed whenever a setting was active)",
      local({ z <- dq[dq$gq == "a", ]
        a <- with_state(quiet(jsubset(z, x1 > -99)), grab(jt(y ~ gq, data = z)),
                        quiet(jsubset(z, NULL)))
        identical(flat(a), paste0("jt(): 'gq' has 1 category after applying the jsubset ",
                                  "filter (x1 > -99). A t-test requires exactly 2.")) }))

# ---- Q21-Q27: the printed lines ---------------------------------------------
check("Q21 the dummy-names note prints wrapped at the message width, a sentence a line (it was one line of some 300 characters)",
      local({ o <- .q_both(jlm(y ~ x1 + k4, data = dq, categorical = "k4"))
        i <- which(startsWith(o, "(Note: One or more dummy names for 'k4' were built"))
        length(i) == 1L && all(nchar(o[i:(i + 3L)]) <= .pin_width) &&
          endsWith(o[i + 1L], "descriptive value labels were not available.") &&
          startsWith(o[i + 2L], "If these names aren't ideal, use jrelabel()") &&
          endsWith(o[i + 3L], "then re-register with jdummy().)") &&
          identical(flat(paste(o[i:(i + 3L)], collapse = " ")), paste0(
            "(Note: One or more dummy names for 'k4' were built from numeric codes ",
            "because descriptive value labels were not available. If these names ",
            "aren't ideal, use jrelabel() to set value labels, or jrecode() to change ",
            "the underlying values, then re-register with jdummy().)")) }))
check("Q22 ... and in jdummy()'s registration, the same way",
      local({ o <- .q_both(with_state(NULL, jdummy(dq, k4), quiet(jdummy(dq, k4, remove = TRUE))))
        any(endsWith(o, "descriptive value labels were not available.")) &&
          any(startsWith(o, "If these names aren't ideal")) &&
          all(nchar(o) <= .pin_width) }))
check("Q23 the 30-character warning is retired: a long variable name and a long label register and fit with no warning (it said 'coefficient tables may look awkward')",
      local({ z <- data.frame(y = dq$y, DetailedRelationshipTrajectoryVariable =
                          haven::labelled(rep(1:3, length.out = .q_n),
                                          labels = c("Stable never partnered" = 1,
                                                     "A rather long trajectory label here" = 2,
                                                     Other = 3)))
        w1 <- .q_warns(jdummy(z, DetailedRelationshipTrajectoryVariable))
        w2 <- .q_warns(jlm(y ~ DetailedRelationshipTrajectoryVariable, data = z))
        quiet(jdummy(z, DetailedRelationshipTrajectoryVariable, remove = TRUE))
        length(w1) == 0L && length(w2) == 0L &&
          !("name.length.warn" %in% names(formals(jstats:::.jst_make_dummy_names))) }))
check("Q24 the dichotomy notes end on the state to reach, not a method (voice Rule X): in jlm() and jlogistic(), 1/2 and other codes",
      local({ a <- grab(jlm(y ~ s12 + x1, data = dq))
        b <- grab(jlogistic(b ~ t37 + x1, data = dq))
        grepl("  jdummy(dq, s12)\nOr make it a 0/1 variable in the data frame.\n", a, fixed = TRUE) &&
          grepl("  jdummy(dq, t37)\nOr make it a 0/1 variable in the data frame.\n", b, fixed = TRUE) &&
          !grepl("jrecode", paste(a, b), fixed = TRUE) }))
.q25 <- grab(jlogistic(bl ~ x1, data = dq))
check("Q25 jlogistic()'s text-outcome refusal: a sentence a line, 'Encode' over the jencode() call, the blank coded 0 so the word is modeled (it said 'Recode' and offered \"Y=0; blank=1\")",
      identical(flat(.q25), paste0(
        "jlogistic(): 'bl' has text categories Y/<blank>. ",
        "Encode it as a 0/1 variable, so that the modeled category is explicit: ",
        "dq$blR <- jencode(dq, bl, map = \"blank=0; Y=1\") ",
        "Then use blR as your dependent variable (the category mapped to 1 is the one ",
        "jlogistic models).")) &&
        grepl("^jlogistic\\(\\): 'bl' has text categories Y/<blank>\\.\nEncode it", .q25) &&
        identical(flat(grab(jlogistic(gn ~ x1, data = dq))), paste0(
          "jlogistic(): 'gn' has text categories u/v. ",
          "Encode it as a 0/1 variable, so that the modeled category is explicit: ",
          "dq$gnR <- jencode(dq, gn, map = \"u=0; v=1\") ",
          "Then use gnR as your dependent variable (the category mapped to 1 is the one ",
          "jlogistic models).")))
check("Q26 an expression given as the data: named first, and the lines run to an outcome jlogistic() fits (the line was \"mk()$blR <- jencode(mk(), ...)\")",
      local({ mk_q <- function() dq
        e  <- new.env(parent = globalenv()); assign("mk_q", mk_q, envir = e)
        cd <- .q_code(grab(jlogistic(bl ~ x1, data = mk_q())))
        for (ln in cd) suppressMessages(eval(parse(text = ln), envir = e))
        m  <- quiet(jlogistic(blR ~ x1, data = get("mydata", envir = e)))
        identical(cd, c("mydata <- mk_q()",
                        "mydata$blR <- jencode(mydata, bl, map = \"blank=0; Y=1\")")) &&
          is.list(m) && identical(m$predicts, "Y") }))
check("Q27 the formula guard and jsave(): an expression is named first in the line to run, and jsave() says 'the data' of a call, keeping a name and an index into a frame as typed (they printed \"jnumeric(mk(), gh)\" and \"Saved mk() to\")",
      local({ mk_q <- function() dq
        e  <- new.env(parent = globalenv()); assign("mk_q", mk_q, envir = e)
        g  <- grab(jlm(x1 ~ log(gh), data = mk_q()))
        cd <- .q_code(g)
        for (ln in cd) quiet(eval(parse(text = ln), envir = e))
        m  <- with_state(NULL, quiet(eval(quote(jlm(x1 ~ log(gh), data = mydata)), envir = e)),
                         quiet(jnumeric(clear.all = TRUE)))
        f  <- file.path(tempdir(), "q27_models.rds")
        s1 <- grab(jsave(mk_q(), f, overwrite = TRUE))
        s2 <- grab(jsave(dq, f, overwrite = TRUE))
        s3 <- grab(jsave(dq[, c("y", "x1")], f, overwrite = TRUE))
        unlink(f)
        identical(cd, c("mydata <- mk_q()", "jnumeric(mydata, gh)")) && is.list(m) &&
          startsWith(flat(s1), "Saved the data to ") && startsWith(flat(s2), "Saved dq to ") &&
          startsWith(flat(s3), "Saved dq[, c(\"y\", \"x1\")] to ") &&
          identical(.q_code(grab(jlm(x1 ~ log(gh), data = dq))), "jnumeric(dq, gh)") }))
check("Q28 a two-valued outcome coded neither 0/1 nor 1/2: '(a dichotomy)' (it read '(a other dichotomy)')",
      local({ w <- .q_warns(jlm(t37 ~ x1, data = dq))
        any(flat(w) == paste0("'t37' is the outcome variable but looks categorical (a dichotomy). ",
                              "Linear regression expects an interval outcome.")) &&
          any(grepl("(a 1/2 dichotomy)", flat(.q_warns(jlm(s12 ~ x1, data = dq))), fixed = TRUE)) }))

# ---- Q29-Q33: the plot lines and the smoother's note -------------------------
check("Q29 jlm()'s plot list takes jlogistic()'s form, word for word: the count, the arrow buttons, the list numbered '1.' (it read '(5 diagnostic plots produced -- use the back arrow ...)')",
      local({ o <- .q_both(jlm(y ~ x1 + x2, data = dq, diagnostics = TRUE))
        i <- which(o == "5 diagnostic plots produced (use the arrow buttons in RStudio's Plots pane")
        length(i) == 1L &&
          identical(o[i + 0:6], c(
            "5 diagnostic plots produced (use the arrow buttons in RStudio's Plots pane",
            "to navigate):", "  1. Residuals vs Fitted", "  2. Normal Q-Q",
            "  3. Scale-Location", "  4. Cook's Distance", "  5. Residuals vs Leverage")) &&
          identical(o[i - 1L], "") }))
check("Q30 jplot()'s effect plots counted in number: '(1 effect plot produced)' (it read '1 effect plots')",
      local({ m1 <- quiet(jlm(y ~ x1, data = dq)); m2 <- quiet(jlm(y ~ x1 + x2, data = dq))
        any(.q_both(jplot(m1, which = "effects")) == "(1 effect plot produced)") &&
          any(.q_both(jplot(m2, which = "effects")) ==
                "(2 effect plots produced, one per predictor)") }))
d9 <- data.frame(y = c(0.1, -0.4, 0.3, 0.9, 0.2, -0.1, 1.3, 0.8, NA),
                 x = c(1, 1, 1, 2, 2, 2, 3, 3, 3))
check("Q31 the smoother's warnings are caught where the plots are drawn: no warning of R's own, one note under the plot list, pinned whole (twelve raw loess warnings printed)",
      local({ o <- .q_both(jlm(y ~ x, data = d9, diagnostics = TRUE, numeric = "x"))
        i <- which(o == "  5. Residuals vs Leverage")
        length(.q_warns(jlm(y ~ x, data = d9, diagnostics = TRUE, numeric = "x"))) == 0L &&
          length(i) == 1L &&
          identical(o[i + 1:4], c(
            "",
            "Note: The trend lines in Residuals vs Fitted, Scale-Location, and Residuals",
            "vs Leverage may not be reliable.",
            "R's smoother reported 12 numerical problems while drawing them.")) &&
          identical(o[i + 5L], "") && length(o) == i + 5L }))
check("Q32 ... at R's default warn = 0 the package's own warning is the one left (it was the thirteenth of 13, out of sight); one plot by name gets the note in the singular",
      local({ w <- .q_warns(jlm(y ~ x, data = d9, diagnostics = TRUE))
        o <- .q_both(jlm(y ~ x, data = d9, diagnostics = "residuals", numeric = "x"))
        length(w) == 1L && startsWith(w, "x seems categorical.") &&
          any(o == "Note: The trend line in Residuals vs Fitted may not be reliable.") &&
          any(o == "R's smoother reported 4 numerical problems while drawing it.") }))
check("Q33 control: a model whose smoother raises nothing gets no note, by jlm() and by jplot()",
      local({ o <- .q_both(jlm(y ~ x1 + x2, data = dq, diagnostics = TRUE))
        m <- quiet(jlm(y ~ x1 + x2, data = dq))
        p <- .q_both(jplot(m, which = c("residuals", "scale", "leverage")))
        !any(grepl("trend line", c(o, p), fixed = TRUE)) &&
          length(.q_warns(jplot(m, which = c("residuals", "scale", "leverage")))) == 0L }))

check("Q33b control: a warning that is not the smoother's still passes -- a one-case category's leverage of 1 leaves a standardized residual missing, and ggplot2's own warnings about the removed row reach the user",
      local({ set.seed(3472)
        z <- data.frame(y = stats::rnorm(30), x = stats::rnorm(30),
                        g = c(rep("a", 15), rep("b", 14), "c"), stringsAsFactors = FALSE)
        w <- .q_warns(jlm(y ~ x + g, data = z,
                          diagnostics = c("residuals", "scale", "leverage")))
        length(w) > 0L && !any(grepl("pseudoinverse|neighborhood|singularit", w)) }))

# ---- Q34-Q38: the fit plot, the equation, the box plots ----------------------
dq$xc <- round(seq(-2, 2, length.out = .q_n), 3)
dq$yc <- round(1 + dq$xc + 2 * dq$xc^2 + rnorm(.q_n, sd = 0.3), 3)
dq$`my var` <- dq$x2
.q_fit <- function(m, ...) {
  grDevices::pdf(NULL); on.exit(grDevices::dev.off(), add = TRUE)
  p <- suppressMessages(suppressWarnings(jplot(m, which = "fit", ...)))
  b <- ggplot2::ggplot_build(p)
  list(sub = p$labels$subtitle, line = b$data[[3L]][, c("x", "y")])
}
check("Q34 a squared term follows its variable along the axis: the line is the curve b0 + b1 x + b2 x^2, and no longer 'shown at I(x^2) = 0' (it was the straight line b0 + b1 x)",
      local({ m  <- quiet(jlm(yc ~ xc + I(xc^2), data = dq))
        f  <- .q_fit(m)
        cf <- unname(stats::coef(stats::lm(yc ~ xc + I(xc^2), data = dq)))
        near(f$line$y, cf[1] + cf[2] * f$line$x + cf[3] * f$line$x^2, 1e-6) &&
          !grepl("line shown at", f$sub, fixed = TRUE) }))
check("Q35 the equation names the terms as the table does: no backticks, ' * ' for an interaction (it printed `I(xc^2)` and x1:x2)",
      local({ a <- .q_fit(quiet(jlm(yc ~ xc + I(xc^2), data = dq)))$sub
        b <- .q_fit(quiet(jlm(y ~ `my var` + x1, data = dq)))$sub
        c <- .q_fit(quiet(jlm(y ~ x1 * x2, data = dq)))$sub
        grepl("·I(xc^2)", a, fixed = TRUE) && !grepl("`", paste(a, b, c), fixed = TRUE) &&
          grepl("·my var", b, fixed = TRUE) && grepl("·x1 * x2", c, fixed = TRUE) }))
check("Q36 a term built from the focal variable and a held one is computed at the held value, and the held one stays in the note; a term built on the whole sample (scale()) is held as before",
      local({ m  <- quiet(jlm(y ~ x1 + x2 + I(x1 * x2), data = dq))
        f  <- .q_fit(m, at = list(x2 = 1))
        cf <- unname(stats::coef(stats::lm(y ~ x1 + x2 + I(x1 * x2), data = dq)))
        s  <- .q_fit(quiet(jlm(y ~ x1 + I(scale(x1)^2), data = dq)))$sub
        near(f$line$y, cf[1] + cf[2] * f$line$x + cf[3] * 1 + cf[4] * f$line$x * 1, 1e-6) &&
          grepl("(line shown at x2 = 1)", f$sub, fixed = TRUE) &&
          grepl("line shown at I(scale(x1)^2) = 0", s, fixed = TRUE) }))
check("Q37 the effect plots and jlogistic()'s probability plot follow a squared term the same way",
      local({ m  <- quiet(jlm(yc ~ xc + I(xc^2), data = dq))
        grDevices::pdf(NULL)
        pl <- suppressMessages(suppressWarnings(jplot(m, which = "effects")))
        grDevices::dev.off()
        ln <- ggplot2::ggplot_build(pl$effect_xc)$data[[2L]]
        set.seed(3471)
        dq$bc <- stats::rbinom(.q_n, 1, stats::plogis(-1 + 1.5 * dq$xc^2))
        g  <- quiet(jlogistic(bc ~ xc + I(xc^2), data = dq))
        grDevices::pdf(NULL)
        pg <- suppressMessages(suppressWarnings(jplot(g, which = "probability")))
        grDevices::dev.off()
        pp <- if (inherits(pg, "ggplot")) pg else pg[[1L]]
        lg <- ggplot2::ggplot_build(pp)$data
        lg <- lg[[which(vapply(lg, nrow, integer(1)) == 120L)[1L]]]
        dq$bc <- NULL
        ok_e <- abs(stats::sd(diff(diff(ln$y)))) < 1e-8 && abs(mean(diff(diff(ln$y)))) > 1e-6
        ok_g <- any(diff(lg$y) < -1e-8) && any(diff(lg$y) > 1e-8)
        ok_e && ok_g }))
check("Q38 a box plot's groups are labeled as the Group Descriptives label them, following value.id: jaov() and jt() (the axis read 1, 2, 3, 4)",
      local({ lab <- function(r) {
          grDevices::pdf(NULL); on.exit(grDevices::dev.off(), add = TRUE)
          p <- suppressMessages(jplot(r))
          ggplot2::ggplot_build(p)$layout$panel_params[[1L]]$x$get_labels()
        }
        a  <- quiet(jaov(Flourishing ~ Condition, data = clinic))
        a2 <- quiet(jaov(Flourishing ~ Condition, data = clinic, value.id = "labels"))
        t1 <- quiet(jt(Flourishing ~ PriorTherapy, data = clinic))
        tb <- quiet(jt(y ~ bl, data = dq))
        identical(lab(a), c("1: Control", "2: CBT", "3: Mindfulness", "4: Support group")) &&
          identical(lab(a2), c("Control", "CBT", "Mindfulness", "Support group")) &&
          identical(lab(t1), c("1: Yes", "2: No")) &&
          identical(lab(tb), c("<blank>", "Y")) && identical(lab(tb), tb$descriptives$Group) &&
          identical(lab(quiet(jaov(y ~ k4, data = dq))), c("1", "2", "3", "4")) }))
check("Q39 a term the fit drops as aliased is left out of the equation, and the fit plot draws (it stopped on \"missing value where TRUE/FALSE needed\")",
      local({ m <- quiet(jlm(y ~ x1 + scale(x1), data = dq))
        f <- tryCatch(.q_fit(m)$sub, error = function(e) "[error]")
        startsWith(f, "y = ") && !grepl("scale", sub("\n.*$", "", f), fixed = TRUE) }))
rm(dq, d9)
rm(list = intersect(c(".q_n", ".q_pre", ".q_both", ".q_warns", ".q_code", ".q01",
                      ".q08", ".q_cat1", ".q25", ".q_fit"),
                    ls(all.names = TRUE)))

# --- Verdict -----------------------------------------------------------------

quiet(jdummy(clear.all = TRUE))
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
