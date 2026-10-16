# =============================================================================
# filter_check.R -- assertion battery for filter validation and the front
#                   doors (S289-S349)
# =============================================================================
# TYPE:     assertion battery (PASS/FAIL; written for Claude's checking)
# LOCKS:    the S288-decided / S289-shipped filter-validation surface -- the
#           set-time syntax check (the "=" branch keyed to a parsed "=" call,
#           so named arguments and quoted "=" no longer false-fire; T/F no
#           longer exempt), the set-time dry run (strict on shape and, since
#           S330, on evaluation failure too; warnings muffled not caught),
#           the apply-time shape check that ALWAYS stops (per-call and
#           stored), the stored-filter error's two exits, the
#           per-frame grammar (jsubset(d, NULL / off / on), the leading-comma
#           forms, clear.all = TRUE, the combine guard), the S294 NULL flip
#           (bare jsubset(NULL) / jcomplete(NULL) clear the DEFAULT frame:
#           default, else the sole frame, else STOP naming both exits) and
#           jcomplete()'s S294 grammar (clear.all = TRUE, per-frame off /
#           on / NULL, the leading-comma forms) -- PLUS the S290 subset=
#           surface: the
#           bare-name branch REMOVED on both routes (a lone numeric name
#           reaches the dry run / shape check; a lone TRUE/FALSE column is
#           accepted), the keyword branch in the Rule AD shape with the fix
#           built from the input and the real xor() exempt, the same syntax
#           check run on a per-call subset = (origin = "call": the subset =
#           lead and fix form), and the named-item detector
#           .jst_check_named_variables() at all fifteen enquos() sites and
#           in jsubset() (which gained ...): a column name -> the single-=
#           message in one of three fix forms; any other name -> "unused
#           input(s)" -- PLUS (S296, section H) the STORED settings
#           reaching jplot's FORMULA path: .jst_jplot_formula() recovers
#           the frame's name from the captured call, so jsubset() /
#           jcomplete() apply to jplot(y ~ x, d) as they do to jplot(d, y),
#           the false "not active for this dataset" note is gone, and the
#           formula path's messages name the frame -- PLUS (S300,
#           H09-H14) the frame given as data = on that path: read before
#           the juse() default (no false "No data frame specified", no
#           default frame plotted in its place), named in messages and in
#           the stored-setting lookups, and a frame given BOTH positionally
#           and as data = stopped, in either order -- PLUS (S307,
#           H15-H29) the same on the VARIABLE-LIST form, through the jplot()
#           GENERIC: the bare-column fallback rebuilds the call AS TYPED
#           (data = moved to the front, x and a positional which unnamed)
#           and evaluates it in a frame carrying jplot.default itself --
#           so data = h plots h, not the default; the second variable of
#           jplot(Gender, Condition) under a default is a variable, not
#           `which`; the method is reached where a registered-not-exported
#           method is invisible (library(jstats)); a frame given both ways
#           stops; and a call forwarded through ... still arrives --
#           PLUS (S315, H30-H31) jplot reading its first argument ONCE on
#           both routes (AUDIT-052's sibling), and (section I) the vector
#           path: jdesc() / jfreq() on a bare column carry every argument
#           to the re-call and refuse more variables, by = and a condition
#           naming another variable, with a data-frame fix that runs
#           (AUDIT-008) -- PLUS (S317, section J) the stored settings
#           reaching jscreen()'s VARIABLE LIST: the pipeline gets the whole
#           frame and the narrowing to the named variables follows it, so a
#           jsubset() or jcomplete() on a column the call does not name
#           applies (no "could not be evaluated" warning, no silent skip),
#           under the juse() default too, and a per-call subset = no longer
#           adds its variables to the screen -- PLUS (S318, section K) a
#           stored jcomplete() whose columns have LEFT the frame: Step 1
#           STOPS (S330; it warned from S318), once per call in every
#           pipeline entrant, naming the frame and the absent columns with
#           the two remedies; a partly stale setting stops too; a complete
#           setting and an inactive one stay quiet; the printed remedy runs
#           -- PLUS (S323, section L and
#           I11) a data frame named in a condition (subset = fl$Inc < 45,
#           jsubset(fl, fl$Inc < 45), and on the vector path jdesc(d$Age,
#           subset = d$Keep01 == 1)) refused with the variables on their own,
#           since it would be read from the raw frame past its declared
#           missing values; a lookup table and a summary of the frame get the
#           save-it-first form; a list of settings stays a value -- PLUS
#           (S324, I15-I34) a single column analyzed in its FRAME: jdesc(),
#           jfreq() and now jscreen() re-call d$Age (or d[["Age"]]) as
#           fn(d, Age), so d's stored jsubset() / jcomplete() settings and
#           its registrations apply and no line says they are "not active";
#           a plain vector still wrapped; jscreen()'s refusals the vector
#           path's; a misspelled column (d$Agee, and d$Ag, no longer
#           partial-matched) the not-found message on every function; and
#           the data-first functions that take no single column refusing
#           one truthfully -- "d$Age is a single variable, not a data
#           frame." -- with the user's own call rebuilt frame-first, or the
#           sentence alone when the rebuild cannot be complete -- PLUS
#           (S330, section M) A FILTER THAT CANNOT BE APPLIED STOPS, WHEN SET
#           AND WHEN USED: jsubset() refuses a filter naming something found
#           nowhere ("names Agee, which was not found in the d data frame")
#           and one that stops with an error of R's own ("R reported:"),
#           storing nothing; a stored filter that can no longer be evaluated
#           stops every pipeline entrant with both exits ("keep no longer
#           exists", or R's message), where it warned and ran on every row;
#           a workspace vector a condition would recycle is refused at set
#           time, per call and for a stored filter; and a condition naming
#           the frame, typed where the frame goes with no juse() default,
#           gets the frame-first refusal in place of "not found" -- PLUS
#           (S331, section N) A STALE SETTING CANNOT BE TURNED BACK ON:
#           jsubset(d, on) and jcomplete(d, on) check the stored setting
#           first ("The filter stays off." / "The setting stays off."; the
#           analysis-time stop for a setting that was never off; the
#           default-not-found stop when the juse() frame is gone); the
#           status displays say "It cannot be applied: ..." and, for an
#           active setting, that analyses will stop, and the overview tags
#           the frame; jcomplete()'s preview of a stale setting stops; and
#           a workspace vector holding one value per case of the frame as
#           given, in a condition that runs on fewer cases, gets the
#           add-it-to-the-frame fix at analysis time, when set, at on, in
#           the status display and per call, whatever it is compared with
#           -- PLUS (S334, section O) A NAME THAT IS NOT A DATA FRAME: the
#           named off and NULL act on the setting stored under a name that
#           has been removed or now holds something else, on is refused
#           ("cannot be applied: z is no longer a data frame" / "z no
#           longer exists", "stays off" when it is off), and a name that
#           carries no setting is refused as one; the shared resolver's
#           first sentence says "is not a data frame" for an input that
#           evaluated to something else and keeps "not found" for one that
#           did not; MORE THAN ONE CONDITION in jsubset() is refused with
#           the joined call, where a second was dropped without a word
#           under a juse() default and a third met R's own error; and the
#           stored shape error's "1 row" -- PLUS (S338, sections Q and R)
#           A COUNT AGREES IN NUMBER: .jst_plural() and the sites that
#           hedged with "(s)" -- the not-found message in its S338 form
#           ("Agee was not found in the d data frame." / "Agee and Gendr
#           were ..."), "unused input" / "unused inputs", jdeclare_missing's
#           repeated names, the plot names -- with P03 sweeping every
#           message the battery takes for a surviving shortcut; and THE
#           FRONT DOORS: jfreq() and jdesc() given no variables stop; an
#           empty vector is refused as typed, never as "temp_df"; off, on
#           or NULL given with a condition is refused with both calls; a
#           fix line keeps the data frame the call named; and jfreq()
#           prints its title before the filters run, as jdesc() does.
# ORIGIN:   S289 (design S284 / S288; code S289 v0.9.163); sections F and
#           G, the A rewrite, the Under40 fixture column, and the bare-name
#           message re-assertions (A01 A02 D01-D03 F06) S290 (v0.9.164);
#           the C18 rewrite, C13 narrowed, C18b-C18d and the jcomplete
#           grammar block C20-C34 S294 (v0.9.167); section H S296
#           (v0.9.169); H09-H14 S300 (v0.9.172); H15-H29 and the H13/H14
#           re-pin ("Specify", the parity wording) S307 (v0.9.178); H30-H31
#           and section I S315 (v0.9.190); section J S317 (v0.9.193);
#           section K S318 (v0.9.194); section L, I11 flipped and I11b
#           S323 (v0.9.200); I15-I34 S324 (v0.9.201); section M, B10 D16
#           D17 flipped, D18 and section K re-pinned S330 (v0.9.206);
#           section N, M18 flipped, K08 moved to k3 S331 (v0.9.207);
#           section O S334 (v0.9.211); sections Q and R, P03, and A07
#           A15 C34 G03 G08 H05 H21 H25 I23 I24 I32 O19 re-pinned, O36
#           flipped S338 (v0.9.212)
# S359 EDIT (v0.9.232, 2026-10-16): Fix Slate 10 and Scripts Slate B. NEW
#           SECTION AA, ten checks (AA01-AA10): (1) the vector path's
#           refusal of a condition naming another variable of the column's
#           frame is the same whatever the workspace holds -- a separate
#           Keep01 of three values, or of one per case, had let jdesc()
#           analyze d's own Keep01 (found by the S342 dirty entry; it was
#           this battery's I07 I08 I22 reds entered dirty) (AA01-AA03);
#           (2) the shape check counts CASES and names the workspace object
#           a wrong count came from, as ruling R19's stop names one, its
#           own fix line kept (the S357 item; Jeff, S358: "okay on your
#           default"), per call, bare, after jcomplete() and as a unit
#           (AA04-AA07); (3) the pipeline masks declared missing values only
#           in the analysis variables and the columns its settings read, a
#           column only a condition reads still read with its codes missing,
#           and every column when a variable is not in the frame (the S217
#           item's fix 2) (AA08-AA10). NEW B08b and D09b: a wrong count with
#           no object to name, the plain form in cases. RE-PINNED to the
#           case wording and the named object: B01, B08, D08, D09, N06, N30,
#           O38, O39, V04. S26 runs its two calls with no Keep01, Gender or
#           Name in the workspace (a computed vector has no frame, so a
#           workspace object of that name is what its condition reads), put
#           back after. GUARD 5 (the S345 item, Scripts Slate B): the
#           values of the workspace's objects on entry, put back at the foot
#           when a run changed them, and named ("Put back as they were on
#           entry: ..."), before guard 2's clean-up on a green run and
#           before the stop on a red one.
#           FIVE HUNDRED AND FIFTY-TWO checks.
#           MUTATION MAP: twenty-four one-change mutants of the 0.9.232
#           master, each run on the batteries it bears on: the object never
#           named B08 D08 D09 N06 N30 O38 O39 AA04-AA07; "rows" in the plain
#           form B08b D09b; the filters' columns not masked L02 AA08 AA09
#           (and cps_check.R N41b N44c N44d N54d N57n); the fallback to every
#           column dropped AA10; the vector path reading the workspace AA01
#           AA02.
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): run_all.R
#           2646 across nine, plain and under the RStudio-handler stand-in,
#           each again with a 35-character temp path; every battery entered
#           dirty, plain and under the stand-in (joutput("full"), width 100,
#           diagnostics on, a stata convention, the color option, a juse()
#           default, and objects named Age, Gender, Keep01, Name, d, x, s,
#           y, g, e, f, m, r and a; again plain with n, v, w and z): all
#           green, the width, level, default
#           frame and convention as on entry, and every object a run changed
#           put back by guard 5 and named; the four stores (.jst_filter,
#           .jst_complete, .jst_dummy, .jst_registry) left empty where they
#           were NULL, as at S357.
#           LAST VERIFIED: v0.9.232, 2026-10-16 (S359) -- 552/552 on the
#           WORKSTATION through receive_all() ("ALL BATTERIES GREEN (9 run,
#           2646 checks)"; R CMD check 0 errors, 0 warnings, 0 notes),
#           matching the sandbox; GitHub 6cf15d7 (package).
# S357 EDIT (v0.9.231, 2026-10-16): the FRAMES slate, ruling R19 -- data
#           frames only. NEW SECTION Z, eight checks (Z01-Z08): jsubset()
#           set on a one-per-case object refused with the line that adds it
#           and the call, nothing stored, the lines run; a bare name, a
#           comparison and an object reached through $ per call; a stored
#           filter whose value became a vector (R19's stored form, the
#           status display, on staying off); values in a condition still
#           passing; the vector path's lines that put both vectors in a data
#           frame (run), under its last name through $, jfreq() and
#           jscreen() the same, the single vector alone still described; a
#           column of a frame in its frame's words. RE-WRITTEN: N33-N49,
#           behind jcomplete() -- the S331 count and add-it line are R19's
#           one message now, filtered or not (N33-N37 the stored form,
#           status, on and the fix run; N38-N46 set and per call, refused
#           where they were set or ran; N47 the count jcomplete() leaves,
#           said of an object of one value per case LEFT; N49 the recycling
#           control). RE-PINNED to the recycling stop's R19 opening ("is not
#           in the d data frame; it is a separate object in your workspace",
#           "add the values to the data frame as a variable"): M24-M29,
#           M32, N07, N30; M30-M31 to R19's form. FIXTURES MOVED to
#           workspace VALUES where a stored filter read a one-per-case
#           vector, which R19 refuses when set: D07-D17 (keep12 one TRUE,
#           then twelve; flag choosing what the condition gives), E03,
#           M14-M22 (Age > m_keep), N01-N32, O38-O39, R24; the shape stops
#           they hold are unchanged. M16 counts on the flattened text (a
#           longer condition moved a break). M33's per-row control removed
#           (Z holds its stop). FIVE HUNDRED AND FORTY checks.
#           MUTATION MAP: eighteen one-change mutants of the 0.9.231
#           master, each run on this battery and its partner (models_check.R
#           / filter_check.R): %in%'s right side not a value position T03
#           T10 Z05; summaries not exempt T03 T10 Z05; the lookup table not
#           exempt T10; a fetch not judged S12-S14 T04 T06 T10 N41 Z03 Z07;
#           per case of the frame only T08 N47; a bare name never visited
#           T10 N38 N39 N45 Z03; the formula check not called J06-J09
#           S12-S14 T01 T02 T04 T05 T08 T09; jcrosstab()'s and jplot()'s
#           check removed T06 (each); the filter mask's check off M30 M31
#           N33-N41 N43-N47 Z01-Z04 Z08; the vector path's check off Z06
#           Z07; no free name S12-S14; the call line omitted J06 J07
#           S12-S14 T02 T04 T06 T09 M30 N38-N41 N44 N45 Z01-Z03 Z08; the
#           recycling stop's old wording I11 J01-J04 J10-J13 M37 M24-M29
#           N42; the after-filter requirement dropped T08 N47; "The filter
#           stays off." dropped N36 Z04; a literal judged as an object J12;
#           the stored recycling reason's old form M32 N07 N30 N49.
#           Sandbox: R 4.3.3, UTF-8 locale, pkgload::load_all: run_all.R 2559 across
#           eight plain and under the RStudio-handler stand-in, each again
#           with a 35-character temp path; R CMD check Status OK on a
#           roxygenised copy. Entered dirty, plain and under the stand-in,
#           beside the same entry on 0.9.230: filter_check.R reds I07 I08
#           I22 S26 (the Scripts Slate B items) as before and models_check.R
#           nothing; the workspace objects changed are 0.9.230's; the filter
#           store is left an empty list where it was NULL (jsubset(d, NULL)
#           on the last filter, which section Z runs; empty either way).
#           LAST VERIFIED: v0.9.231, 2026-10-16 (S357) -- 540/540 on the
#           WORKSTATION through receive_all(from = "batteries") ("ALL
#           BATTERIES GREEN (8 run, 2559 checks)"), matching the sandbox;
#           GitHub 2a4fcc3. The first call ran the S356 script
#           (78/78, HALTED at a stored filter on a one-per-case
#           vector, which ruling R19 refuses):
#           the scripts were not yet in regression\.
# S356 EDIT (v0.9.229, 2026-10-15): the NAMES slate -- ruling R18's four
#           remaining items (b)-(e) and riders A and B -- on the data-first
#           front doors. SECTION Y NEW, thirty-seven checks (Y01-Y37). (b)
#           A c() of names, bare or quoted, in every variable list (the
#           thirteen enquos() sites, jconvert(), jdeclare_missing(),
#           jplot(); Y04 runs each) and at the single-variable slots of
#           jrecode(), jrelabel(), jencode() and by =, where a c() of
#           several stops naming them; a misspelled name inside the c()
#           named alone; a range and a helper still not found, as decided;
#           under a juse() default a c() of names the frame has is the
#           frame's variables, R12's line saying so, where the workspace
#           holds one of the names and where it holds both (R's c() would
#           have joined the two vectors); with no frame in hand a c() keeps
#           R's meaning. (Rider A) A data frame's name in quotes gets the
#           call without them, at jdesc(), the formula front door, juse(),
#           jsave(), jsubset(), jcomplete() and jplot(); a string naming no
#           frame stays a one-case text variable. (d) On the vector path,
#           the two lines under the title when a data frame in the
#           workspace holds a variable of the name read: (x) and
#           .GlobalEnv$x read as the same object, jfreq() and jscreen()
#           naming their own calls, no line when no frame has it, both
#           frames named and MyData in the line when two do, a juse()
#           default that lacks the variable, a column typed with its frame
#           exempt, the line run, every output level, the message width.
#           (Lean 4) The not-a-data-frame stops name the one frame that has
#           the variable, MyData when none or two do, and the named lines
#           run. (c) A bare word where a quoted value goes: jdesc()'s
#           variable.id, jfreq(missing.detail =), jscreen(stats =),
#           jcorr(method =, layout =), jalpha(case.processing.detail =),
#           joutput() (a level or setting name positional in the sentence
#           form, a diagnostic, a row form, a display mode), joptions()
#           (the convention named or positional, the line always naming
#           missing.convention; a layout; a detail level) and, rider B, the
#           free-text slots data.dir =, jdata_dir(), jload(name =, sheet =)
#           and jdummy(ref =), whose category is matched without regard to
#           case; the word matched without regard to case and the line
#           spelling the value as the function takes it; a name holding a
#           value left alone, a word that is not a value left to R; every
#           call line parsing, three run. .y_pl() takes the two captures
#           outside check() (guard 3). FIVE HUNDRED AND THIRTY-TWO checks.
#           On the 0.9.228 master 29 red: Y01-Y05, Y07, Y09-Y13, Y15-Y17,
#           Y19, Y20, Y22-Y26, Y29-Y35, Y37.
#           MUTATION MAP (S356; twenty one-change mutants of the 0.9.229
#           master, each run on the four batteries of the build): the word
#           check off Y29 Y30 Y31 Y32 Y35 Y37; the word matched with regard
#           to case Y35; a c() of names not expanded Y01 Y02 Y03 Y04 Y05 Y07;
#           the single slot taking a c() of several Y09 Y10 Y11; the vector
#           path's collision lines off Y15 Y16 Y17 Y19 Y20 Y22 Y23; the frame
#           that has the variable never named Y24 Y25 Y26; the quoted-frame
#           stop off Y12 Y13; ref matched with regard to case Y34; the
#           free-text check off Y32 Y33 Y34 Y37; a c() under a default not
#           read as names Y07; the frames unsorted Y19. The other 9 mutants
#           red elsewhere, green here.
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): 532/532
#           plain and under the RStudio-handler stand-in, each again with a
#           Windows-length temp path, and entered dirty.
#           LAST VERIFIED: v0.9.229, 2026-10-15 (S356) -- 532/532 on the
#           WORKSTATION through receive_all(), which ran every battery
#           green after a clean R CMD check and went on to the walks (the
#           paste-back block was not posted; the walks it showed were
#           walked), matching the sandbox; GitHub fea0b51.
# S355 EDIT (v0.9.228, 2026-10-14): Fix Slate W1, the S352 item. SECTION X
#           NEW, five checks (X01-X05): with no data frame named and no
#           juse() default, a condition -- jsubset(Agee > 40) -- is said to
#           need a data frame, where the resolver called it "not found" and
#           asked whether it was meant as a variable name; a bare name keeps
#           its question; in both, each call is on a line of its own, the
#           default's two lines in the order they run; another function's
#           computed input says the same; every call line parses (X05
#           inside local(), so its working name never reaches the user's
#           workspace). M39 and
#           O23 RE-PINNED by running (the same message reached from section
#           M's condition and section O's workspace vector). FOUR HUNDRED
#           AND NINETY-FIVE checks. On the 0.9.227 master 7 red: M39, O23,
#           X01-X05.
#           MUTATION MAP (S355): the symbol test forced true (a condition
#           read as a name again) M39 X01 X02 X04.
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): 495/495
#           plain and under the RStudio-handler stand-in, each again with a
#           Windows-length temp path, and entered dirty.
#           LAST VERIFIED: v0.9.228, 2026-10-15 (S355) -- 495/495 on the
#           WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run,
#           2453 checks)") through receive_all(), after a clean R CMD
#           check, matching the sandbox; GitHub f89e83f.
# S354 EDIT (v0.9.227, 2026-10-13): Fix Slate H, with the S243 call-form
#           item's ruling A (jconvert's `to` behind the dots). I30
#           REWRITTEN: jconvert(d$Age, "stata") -- a format name given
#           positionally -- is rebuilt as jconvert(d, Age, to = "stata"),
#           the target named, and the line runs; the named form's rebuilt
#           call is unchanged. Until 0.9.226 the positional form got the
#           sentence without a call, since the rebuild would have put
#           "stata" in `to`'s slot. FOUR HUNDRED AND NINETY checks, as
#           before. On the 0.9.226 master I30 red.
#           MUTATION MAP (S354): the rebuild's target naming gone I30.
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): 490/490
#           plain and under the RStudio-handler stand-in, each again with
#           a Windows-length temp path, and entered dirty.
#           LAST VERIFIED: v0.9.227, 2026-10-13 (S354) -- 490/490 on
#           the WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run,
#           2385 checks)") through receive_all(), after a clean R CMD
#           check, matching the sandbox; GitHub 9eacd76.
# S352 EDIT (v0.9.225, 2026-10-11): Fix Slate 9, the first half. SECTION W
#           ADDED, W01-W04 (4 checks; the S349 item): with no data frame in
#           hand -- none named, no juse() default -- quiet = TRUE beside a
#           condition, typed or given by name, is an unused input (it
#           offered jsubset(quiet == TRUE)); a named input on its own keeps
#           the single-= stop; nothing is stored. FOUR HUNDRED AND NINETY
#           checks. On the 0.9.224 master W01 and W02 red.
#           MUTATION MAP (S352): the no-frame test gone W01 W02.
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): 490/490
#           plain and under the RStudio-handler stand-in, each again with
#           a Windows-length temp path, and entered dirty.
#           LAST VERIFIED: v0.9.225, 2026-10-12 (S352) -- 490/490 on
#           the WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run,
#           2346 checks)") through receive_all(), after a clean R CMD
#           check, matching the sandbox; GitHub 5c5304e.
# S349 EDIT (v0.9.222, 2026-10-10): Fix Slate 7, second half. SECTION V
#           ADDED, V01-V28 (28 checks): a filter on a ONE-ROW frame runs --
#           one TRUE is one for every row -- in jfreq(), jdesc() and
#           jsubset(), while a condition that names no variable is refused
#           there as anywhere (the S346 item); jsubset(d, cond, quiet =
#           TRUE) is an unused input and stores nothing, a variable typed
#           with one = keeps the single-= stop, under a juse() default too
#           (the S346 item); jsubset() and jcomplete() given an expression
#           as the data refuse it, with two lines that run, store nothing,
#           give the status call for off and NULL, and accept a place (the
#           S341 item); the error prefix names the jstats call, never a
#           user's own j-named wrapper (AUDIT-015); a frame's own
#           .jst_row_id column is analyzed (AUDIT-018); an sf frame -- a
#           STAND-IN with sf's `[`, so the battery runs where sf is not
#           installed -- in jscreen(), jdesc(), jt(), jsubset() and
#           jcomplete(), its geometry an Unsupported row, the user's frame
#           left an sf frame (the S213 item). 486 checks. Sandbox (R 4.3.3,
#           UTF-8 locale, pkgload::load_all): 486/486 plain and under the
#           RStudio-handler stand-in, each also with a Windows-length temp
#           path, and entered dirty -- green; with an Age, a Gender, a Keep01 and a
#           Name in the workspace as well, M39, I07, I08, I22 and S26 red,
#           as on 0.9.221: the (S342) [META] item's five, none of section V. On the 0.9.221 master
#           V01-V03, V06, V08, V10-V16, V18-V22 and V24-V26 read red; V04,
#           V05, V07, V09, V17, V23, V27 and V28 are controls and premises.
#           MUTATION MAP (S349): a one-row frame refused as before V01 V02
#           V03; a single value passed on one row whatever it names V04;
#           jsubset() given no frame for its named-input check V06 V08;
#           the typed frame alone, not the default V08; the expression
#           check gone from jsubset() V10-V14, from jcomplete() V15 V16;
#           jsubset()'s off form treated as setting V13; a place refused
#           V17; a user's wrapper counted in the prefix V18 V19 V20; the
#           row id under its fixed name V21 V22; the sf frame passed
#           through V24 V25 V26; left sf in jcomplete()'s set path V26, in
#           its status display V26, in .jst_complete_kept() V26.
#           LAST VERIFIED: v0.9.222, 2026-10-11 (S349) -- 486/486 on
#           the WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run,
#           2215 checks)") through receive_all(), after a clean R CMD
#           check, matching the sandbox; GitHub 4243886.
# S348 EDIT (v0.9.221, 2026-10-10): Fix Slate 7, first half. SECTION U
#           ADDED, U01-U18 (18 checks): ruling R12 -- under a juse()
#           default, a name the default frame has is the frame's variable
#           in jdesc(), jfreq() and jscreen(), and a second line under
#           "Using default data frame" says so when a separate vector or
#           factor of that name exists: singular and plural, wrapped, at
#           every level, a grouped call's by = named too; nothing said of a
#           function, a list, a data frame or an object only a package
#           supplies; the workspace vector still read with no default, or
#           when the frame has no such variable; a column typed with its
#           frame and a computed vector read as typed; jcorr() unchanged.
#           Fixture names no workspace is likely to hold (zz_u*); objects a
#           check needs are made inside local(). 458 checks. Sandbox: 458/458
#           plain and under the RStudio-handler stand-in, each also with a
#           Windows-length temp path. Entered dirty with an Age and a Gender
#           in the workspace (the fifth condition), J08, K09 and M22 now
#           hold -- three of the four checks of the (S342) [META] item,
#           cleared by R12 -- and M39 still goes red (jsubset(Age > 40) with
#           no default: no frame to prefer, so not R12's); with a Keep01 and
#           a Name as well, I07, I08, I22 and S26 go red as at S343 (a
#           condition naming another variable, on the single-column path).
#           Both are the battery's own exposure, left to Scripts Slate B.
#           MUTATION MAP (S348): the resolver as it was U01-U08 U12-U14 U16
#           U18 P03; the second line never U02-U08 U12-U14 U16; a function
#           or a list counted as a separate object U08; the caller's
#           environment searched alone U07 U08; the line unwrapped U05 U13;
#           a grouped call's by = not named U14; base R's objects counted
#           U18.
#           LAST VERIFIED: v0.9.221, 2026-10-10 (S348) -- 458/458 on
#           the WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run,
#           2177 checks)") through receive_all(), after a clean R CMD
#           check, matching the sandbox; GitHub 2a49208.
# S346 EDIT (v0.9.219, 2026-10-08): the session guard hands back the stored
#           display settings (.jst_output_toggles) with the output level.
#           The diagnostics setting outlives a level call since v0.9.219,
#           so a run entered with joutput(diagnostics = TRUE) left the
#           session without it (found entering dirty). No check added.
#           LAST VERIFIED: v0.9.219, 2026-10-09 (S346) -- 440/440 on
#           the WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run,
#           2079 checks)") through receive_all(), after a clean R CMD
#           check, matching the sandbox; GitHub 14528c6.
# S345 EDIT (v0.9.218, 2026-10-06): P03 RE-PINNED; no check added (440).
#           The sweep for a count hedged with "(s)" left one message out
#           by name, the map parser's "Invalid old value(s)". That stop
#           names the invalid values alone since v0.9.218 (the S287
#           remainder; missing_convention_check.R N84a-c), so the
#           carve-out is gone, and P03 now puts the message in front of
#           the sweep itself (one invalid value, and two). On the 0.9.217
#           master P03 is red. Sandbox: 440/440 plain and under the
#           RStudio-handler stand-in, each also with a Windows-length temp
#           path, and entered dirty.
#           LAST VERIFIED: v0.9.218, 2026-10-07 (S345) -- 440/440 on
#           the WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run,
#           1952 checks)") through receive_all(), after a clean R CMD
#           check, matching the sandbox; GitHub ec82e6b.
# S343 EDIT (v0.9.217, 2026-10-06): SECTION T ADDED (T01-T11, 11 checks),
#           the lean-free cut of Fix Slate 5; nothing else changed. The
#           S338 not-found sentence at the four sites that built an older
#           one of their own (the S338 item): jrecode(), jrelabel() and
#           jencode(), each message pinned whole (T01-T03); a range's start
#           and its end in jalpha(), jsum() and javg() (T04), and both
#           endpoints missing in one message (T05); the juse() default hint
#           at all six, which none of them gave (T06), and no hint when the
#           frame is named (T07); no site keeping "Variable '", a quoted
#           frame or "capitalization" (T08); the variable left out
#           altogether, which read "Variable '' not found in 'd'." and is
#           now the blank-name stop (T09); the resolver's default_used
#           argument (T11). T10 is the control: a found variable recoded,
#           relabeled and encoded as before, a range resolved, the order
#           stop unchanged. FOUR HUNDRED AND FORTY checks.
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): 440/440
#           plain and under the RStudio-handler stand-in, each also with a
#           Windows-length temp path, and entered dirty. The dirty entry
#           with a Keep01 and a Name in the workspace reds I07 I08 I22 and
#           S26, on the 0.9.216 master and the S342 file as well: the
#           to-do's ruling R12 again (S342 met it through Age and Gender),
#           not this build; without those names, 440/440 and the session
#           handed back.
#           On the 0.9.216 master 9 red: every T check but the controls
#           T07 and T10.
#           MUTATION MAP (S343; the mutants of jencode_check.R's list that
#           red here). jrecode()'s old message back T01 T06 T08 T09;
#           jencode()'s T03 T06 T08 T09; jrelabel()'s T02 T06 T08 T09; a
#           range's old message T04 T05 T06 T08 T11; only the first
#           missing endpoint reported T05; the resolver not forwarding
#           default_used T06 T11; jalpha(), jsum() or javg() not passing
#           it T06; jrecode() never giving the hint T06; jencode() always
#           giving it T03 T07; jrelabel() giving it in the bare-default
#           mode alone T06.
#           LAST VERIFIED: v0.9.217, 2026-10-06 (S343) -- 440/440 on
#           the WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run,
#           1890 checks)") through receive_all(), after a clean R CMD
#           check, matching the sandbox; GitHub 8a10deb.
# S342 EDIT (v0.9.216, 2026-10-06): SECTION S ADDED (S01-S34, 34 checks),
#           Fix Slate 4; nothing else changed. S01-S12 a named clear or
#           removal whose name is not a data frame, in the four
#           registration verbs (the S334 item; Jeff's S342 lean 3):
#           jdummy(zs, NULL) and jdummy(zs, v, remove = TRUE) act on what
#           is stored under the name; a named clear with nothing stored is
#           refused as a name, the message pinned whole and its status
#           call run; REGISTERING under such a name stays the resolver's
#           refusal; under a juse() default a name that carries nothing is
#           read as a variable, as before. S13-S22 an expression given as
#           the data (the S339 item; lean 1): refused, the message pinned
#           whole, its two lines run in an environment of their own; a
#           clear or removal on one gets the status call; a place is
#           accepted and its file named for the last part
#           (.jst_data_file_stem() by its units), and the save and load
#           lines run in a folder of their own, the registration restored.
#           S23-S28 a computed vector named as typed, its three refusals
#           the sentence without a fix line, a data frame held in a list
#           and a plain name as before (the S338 item). S29 takes
#           models_check.R section M's stops once, so that P01-P03 read
#           them. S30-S34 jfreq() on a list column, a raw column and a
#           column that is a data frame: the analysis functions' type
#           stop, before the title, through the single-column form too;
#           jdesc()'s own refusal there; other types still tabulated (the
#           S213 item; lean 4). Fixtures built in the section, their names
#           carrying its letter. FOUR HUNDRED AND TWENTY-NINE checks.
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): 429/429
#           plain and under the RStudio-handler stand-in, each also with a
#           Windows-length temp path, and entered dirty. The dirty entry
#           with an Age and a Gender in the workspace reds J08 K09 M22 and
#           M39, on the 0.9.215 master and the S338 file as well: the
#           to-do's ruling R12 (a workspace object named like a variable
#           of the juse() default is analyzed in its place), not this
#           build; without those two names, 429/429 and the session
#           handed back.
#           On the 0.9.215 master 28 red: every S check but the controls
#           S07 S08 S09 S12 S22 S28 S34, and P02 -- the sweep reads the
#           old jload("s_lst[["s_dd"]].rds") line, which does not parse.
#           MUTATION MAP (S342; the mutants of models_check.R's list that
#           red here). The by-name step never serving S01-S06 S10 S11 S14
#           S16; a named clear with nothing stored left to the resolver
#           S05 S06; a removal served with nothing stored S09; removal by
#           name not served S03-S06 S10 S11 S14 S16; registering served as
#           a removal S08; the stored names read for every kind S11; the
#           juse() default not consulted S11; jlikert()'s step dropped S02
#           S03 S04 S06; jdummy()'s S01 S03-S06 S10 S16; "was not found"
#           for a name that holds something S06. jnumeric()'s expression
#           refusal dropped S13 S14 S17; jdummy()'s S16 S17; a place
#           refused S18 S21; a clear given the registering form S17; the
#           second line keeping the expression S13 S15 S16; the file named
#           for the argument as typed S18 S19 S21 P02; the double-bracket
#           form not read S19 S20; a last part that is no name used S20;
#           the three intent verbs passing no file stem S18 S19 S21;
#           jdummy() passing none S19 P02. jfreq() with no type stop
#           S30-S32; a raw column let through S31; a complex column
#           stopped S34; the stop given the function prefix S30-S32. A
#           computed vector named after its last dollar sign S23 S24; none
#           marked computed S25 S26; a plain name marked computed S28; a
#           list not put in whole S32 S33; a place's last part not read
#           S27. The section M mutants on the refusals' wording red S29.
# LAST VERIFIED: v0.9.216, R 4.6.1, 2026-10-06 (S342) -- 429/429 on the
#           WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run, 1844
#           checks)") after a clean R CMD check, matching the sandbox
#           plain, under the RStudio-handler stand-in and each again with
#           a Windows-length temp path; GitHub 8737548.
# S338 EDIT (v0.9.212, 2026-10-05): SECTIONS Q AND R AND P03 ADDED (Q01-Q10;
#           R01-R28 with R23b-R23d; 42 checks); A07 A15 C34 G03 G08 H05 H21
#           H25 I23 I24 I32 O19 RE-PINNED; A17 widened; O36 FLIPPED. Fix Slate
#           1, the front doors. Q: .jst_plural() and the strings that hedged a
#           count -- the not-found message in its S338 form, "unused input",
#           jdeclare_missing's repeated names, the plot names. R: jfreq() and
#           jdesc() given no variables stop (R01-R05); an empty vector is
#           refused as typed (R06-R10); off, on or NULL given with a condition
#           is refused with both calls, each of which is RUN (R11-R19); the
#           three jsubset() fix lines keep the frame the call named, and run
#           (R20-R23); a single-= condition typed where the frame goes is
#           checked before it is evaluated (R23b-R23d) -- the refused call had
#           left Gender <- 1 in the workspace, found by this file's own S337
#           guard, which counts what a green run leaves behind; jfreq() prints
#           its title before the filters run (R24-R28). P03 sweeps every
#           condition for a surviving "(s)". THREE HUNDRED AND NINETY-FIVE
#           checks.
#           Sandbox (R 4.3.3, pkgload::load_all): 395/395 plain and under the
#           RStudio-handler stand-in, each also with a Windows-length temp
#           path, and ENTERED DIRTY (joutput("full"), width 90, a juse()
#           default, a stata convention): nothing left but .results. On the
#           0.9.211 master the file HALTS at section Q (.jst_plural() does not
#           exist there) after 13 reds, the twelve re-pinned checks and O36.
#           Controls, on no mutant's list by design: R04 R19 R23 R23d.
#           MUTATION MAP (one change each to the 0.9.212 master, every battery
#           run; 54 mutants across this file and models_check.R, every one red
#           -- the ones that red here): .jst_plural() always plural reds C34
#           G08 H05 H21 H25 I23 I24 I32 Q01 Q02 Q05 Q07 Q08 Q09 Q10;
#           .jst_plural() always singular reds O19 Q01 Q03 Q04 Q06 Q08 Q09
#           Q10; not-found: the frame without its article and kind reds C34
#           H05 H21 I23 I24 I32 O19 Q02 Q03 Q04 Q05 Q07; not-found: was / were
#           swapped reds C34 H05 H21 I23 I24 I32 O19 Q02 Q03 Q04 Q05 Q06 Q07;
#           not-found: the names comma-joined reds O19 Q03 Q04 Q06; not-found:
#           the old second line reds Q02 Q03 Q05 Q06 Q07; unused input(s)
#           restored reds G08 H25 Q08 P03; jdeclare_missing: name(s) restored
#           reds Q09 P03; plot name(s) restored reds Q10 P03; jdesc: the
#           no-variables stop removed reds R02 R03 R05; jfreq: the
#           no-variables stop removed reds R01 R03 R05 R27; jfreq: the title
#           after the pipeline again reds R24 R25 R26; jfreq: the default-data
#           note dropped reds R26; jfreq: the title printed twice reds R28;
#           vector path: the empty-vector stop removed reds R06 R07 R08 R10;
#           vector path: a frame's column refused too reds R09; third input of
#           off / on / NULL: the helper declines again reds O36 R11 R12 R13
#           R14 R15 R16 R17 R18; word stop: the first line drops the frame
#           reds R11 R12 R13 R14 R16; word stop: the second line drops the
#           frame reds R11 R12 R13 R14 R15; joined conditions: the | one not
#           parenthesized reds O29 R16; word stop: the verbs of on and off
#           swapped reds R11 R13 R15; word stop: the word recased reds R14
#           R15; word stop: two words and no condition not handled reds R17;
#           syntax fix line: the frame dropped reds A07 A15 R20 R21; syntax
#           fix line: the generic example given the user's frame reds A17;
#           named-item fix line: the frame dropped reds G03 R21; jsubset: the
#           typed frame never read reds G03 R21; jsubset: a single-= condition
#           evaluated before it is checked reds R23b R23c; syntax fix line:
#           the default frame named though it was not typed reds R22; jfreq: a
#           title ahead of the variable-list stops reds R01 R24 R25 R26 R27
#           R28.
# LAST VERIFIED: v0.9.212, 2026-10-05 (S338) -- 395/395 on the WORKSTATION via
#           run_all.R (ALL BATTERIES GREEN, 8 run, 1571 checks) after
#           receive_package() and a clean R CMD check, GitHub e22427a,
#           matching the sandbox count for count.
# S337 EDIT (v0.9.211, 2026-10-05; no package change): SECTION P ADDED (P01,
#           P02), and the two session guards of _template_check.R. grab() now
#           keeps every condition it takes in .seen, one by one, and section P
#           sweeps them all: P01 no premature break (jencode_check.R N42
#           brought here, the S291 item; own helper), P02 every runnable line
#           parses (the S249 item's guard (3)). A GREEN run now removes
#           everything the battery made (the names in the workspace are
#           recorded at Setup; .results stays, for run_all.R), so a walk that
#           reports on the data frames in the workspace can follow it in one
#           session. A red run keeps its fixtures. The output level is recorded
#           and handed back. THREE HUNDRED AND FIFTY-THREE checks: 353/353 in
#           the sandbox, plain, under the RStudio-handler stand-in, and ENTERED
#           DIRTY (joutput("full"), width 90, a juse() default, a stata
#           convention): nothing left but .results, and the width, the default
#           frame, the level and the convention as they were on entry. (Setup
#           still clears stored jsubset(), jcomplete() and registration
#           settings, as it always has.) Mutants: a builder newline inside a
#           sentence reds P01, a remedy line without its closing parenthesis
#           reds P02, and every message wrapped 12 columns early reds P01.
# S334 EDIT (v0.9.211): SECTION O ADDED (O01-O39, 39 checks); nothing else
#           in the file changed, and the unedited S331 battery reads
#           312/312 on the new master -- no existing check pinned the
#           resolver's "not found" for a name that holds something else,
#           the dropped second condition, or "1 rows". O01-O13 jsubset()
#           by name (on refused, stored and not; the printed delete line
#           run; off and NULL acting; a name gone; a name with no filter;
#           the same under a juse() default; the default frame removed; a
#           real frame as before); O14-O22 jcomplete() the same, plus its
#           pass-through (with a default and nothing stored the items are
#           variables, and a variable really named on is one); O23-O25
#           the resolver's sentence; O26-O37 more than one condition (two
#           under a default, the printed line run, an earlier filter
#           kept, the | parenthesized and run, a named frame, three, the
#           leading comma, a condition before on / off / NULL, controls,
#           the helper declining a third input of on, the widths);
#           O38-O39 "1 row" and "2 rows". THREE HUNDRED AND FIFTY-ONE
#           checks.
#           Sandbox (R 4.3.3, pkgload::load_all): 351/351 plain and under
#           the RStudio-handler stand-in; on the 0.9.210 master 320/351,
#           red at O01 O03-O12 O14-O18 O21 O23 O25-O36 O38, with O02 O13
#           O19 O20 O22 O24 O37 O39 the controls. MUTATION MAP (one
#           change each, every battery run): 36 mutants here, every one
#           red. By name: the default pass-through dropped (S1) reds O19
#           O20; jsubset() passing the default (S2) O11; the two states
#           swapped (S3) O01 O04 O07 O09-O11 O14 O16 O18 O21; stored
#           never read (S4) fourteen of O01-O21; off not acting (S5, S14)
#           O05 O08 O11 / O17 O21; NULL not acting (S6, S15) O03 O06 O08
#           O11 O12 / O15 O17 O21; "stays off" always (S7) O04 O16, never
#           (S8) O01 O07 O14; the exit verbs swapped (S9) O01 O03 O04 O07
#           O14-O16; the status remedies swapped (S10) O09 O10 O18;
#           either interception off (S11, S12) O01 O03-O12 / O14-O18 O21;
#           a real frame intercepted (S13) HALTS the battery at its
#           first jsubset(d, ...) setup line; the cause texts swapped
#           (S16, S17) O01 O04 O07 O14 O16 O21 / O09-O11 O18; active
#           ignored (S18, S19) O04 / O16; "the z data frame" (S20) O01
#           O04 O07 O14 O16 O21. Resolver: "not found" always (C1) O23
#           O25; "is not a data frame" always (C2) O24 and M39.
#           Conditions: the two-condition check removed (K1) O26-O29; the
#           third-input check removed (K2) O30-O32; no parentheses (K3)
#           O29, always (K4) and joined with | (K5) O26-O32; the frame
#           left out (K6, K12) O30; the on / off / NULL corner removed
#           (K7) O33 O34, its word fixed (K8) O34; "two" always (K9) O31;
#           the leading comma not skipped (K10) O32; a third input of on
#           counted (K11) O36. "rows" always (R1) O38; "row" always (R2)
#           O39 and B08 D08 N06 N30.
# LAST VERIFIED: v0.9.211 PENDING, 2026-10-04 (S334) -- 351/351 in the
#           SANDBOX (R 4.3.3, UTF-8 locale, pkgload::load_all; 1491 across
#           eight, plain and under the RStudio-handler stand-in);
#           WORKSTATION run pending Jeff's receive of the 0.9.211 master.
# S331 EDIT (v0.9.207): SECTION N ADDED (N01-N49, 49 checks); M18 FLIPPED;
#           K08 MOVED TO k3; ONE SETUP LINE REMOVED. The two S330
#           reactivation items, and the two riders Jeff added at S331 (the
#           jsubset() status display and the overviews; a one-value-per-
#           case vector behind jcomplete()). M18: it held "reactivating a
#           stale filter brings the stop back" as a control; on REFUSES the
#           stale filter, which stays off, and the analysis still runs.
#           K08: an inactive stale jcomplete() stays quiet -- on k3 now,
#           because k1's setting can no longer be turned back on for K09
#           and K10. Section D: the line that turned the stale filter back
#           on after D12 is gone (the next line deleted the filter anyway).
#           Section N: N01-N13 jsubset(d, on) (object gone, the delete
#           line run, the default-scoped forms, R's message, the shape
#           error, a recycled vector, a filter never off, the default frame
#           gone, off needing no frame, a good filter, the filter's own
#           warning and message dropped, an empty frame); N14-N18
#           jcomplete(d, on); N19-N25 jcomplete()'s status line, preview
#           and overview; N26-N32 jsubset()'s status line and overview;
#           N33-N46 the vector behind jcomplete() -- at analysis time, in
#           the status display, at on, the printed fix run, a plain
#           variable and a bare name, when set, with an earlier filter, an
#           operand that is not a plain name, controls, and per call
#           behind a stored filter and behind jcomplete() alone; N47 a
#           declared missing value counted as missing; N48 a stale
#           jcomplete() beside a filter; N49 a vector of another length
#           keeping the S330 form. Fixtures nf, nk, ne, nm, ns, nz (copies
#           of d); workspace objects carry an n_ prefix. TWO HUNDRED AND
#           SIXTY-THREE -> THREE HUNDRED AND TWELVE.
#           MUTATION MAP (S331, sandbox, 57 one-change mutants of the
#           0.9.207 master, each RUN with all eight batteries; every one
#           reds at least one check, one of them as a halt). The UNEDITED
#           0.9.206 master reds M18 N01-N09 N14 N15 N17-N22 N24-N26
#           N28-N30 N32-N42 N44-N47 (273/312). jsubset(d, on): the check
#           removed reds M18 N01-N08 N36; always the reactivation form
#           N08; always the analysis-time form N01 N04-N07 N36; run on the
#           frame as given N36; n_frame not passed N36; quiet not passed
#           N12, the quiet argument ignored N12; the empty-frame guard
#           removed N13; "The filter stays off." dropped N01 N04-N07 (in
#           the vector form: N36); both exits at on N01 N04-N07; the
#           default frame fetched without the resolver N09; the filter set
#           active before the check M18 N02 N04-N06 N36; the shape check
#           without its reactivation form N06. The status display: the
#           shape check without its status form N30; never a fault N26
#           N28-N30 N32 N35; the consequence line for an inactive filter
#           N28, never N26 N35; the check not quiet N31; run on the frame
#           as given N35; no overview tag N32; the tag ahead of the
#           default tag N25 N32; the reason dropped N26 N28-N30 (in the
#           vector form: N35); R's lines dropped M21 N05 N29; a fault
#           turning the filter off N27; an unreachable frame an error N31.
#           jcomplete(): on unchecked N14 N15 N17 N18; always "stays off"
#           N17, never N14; the sentence dropped N14; the default frame
#           fetched without the resolver N18; set active before the check
#           N15 N16 N18; the preview's stop removed, or the remaining
#           variables previewed again, N21 N22; the count on the remaining
#           variables again N19 N20 N22; no consequence line N19; an
#           inactive stale setting saying nothing N20 N22; no overview tag
#           N24 N25. The vector: never found reds N33-N42 N44-N47; a bare
#           name not looked up N38 N45; any recycled length N49; asked
#           after the shape check N33-N38 N44-N46; the set-time test
#           removed, or given the frame as given, N39-N42 N47; "filtering"
#           always N33-N35 N38 N39 N41 N47, "jcomplete()" always M30
#           N44-N46; the two exits appended N33; n_frame not passed to the
#           stored filter N33 N34 N37 N38; an inactive jcomplete() applied
#           HALTS this file at 300 (N38's setup; N43 is its check);
#           declared missing values not masked N47; a stale jcomplete()
#           not passed over N48; every case returned N35 N36 N39-N42 N47;
#           never a line to run M30 M31 N33 N36-N40 N44 N45 (and
#           models_check J07 J08), always one N41; the unchanged line
#           dropped N40; the stored recycling form reworded M32 N07 N30
#           N49. TWO SURVIVED THE FIRST RUN: "reactivation not quiet" was
#           dead code (jsubset() always passes quiet; the default no longer
#           lists it), and "any recycled length" had no input -- N49.
#           N10 N11 N23 N43 are controls, on no red list by design.
# LAST VERIFIED: v0.9.207 PENDING, 2026-10-03 (S331) -- 312/312 in the
#           SANDBOX (R 4.3.3, UTF-8 locale, pkgload::load_all; 1377 across
#           eight, plain and under the RStudio-handler stand-in);
#           WORKSTATION run pending Jeff's receive of the 0.9.207 master.
# S330 EDIT (v0.9.206): SECTION M ADDED (M01-M39, 39 checks); B10, D16 AND
#           D17 FLIPPED; D18 AND SECTION K RE-PINNED. Jeff's three S329
#           rulings (walking filter_walk.R D5) and the two S324 partners.
#           B10: an evaluation failure at set time is REFUSED and nothing is
#           stored (it asserted "SILENT, and the filter is stored"). D16,
#           D17: a stored filter that cannot be evaluated is an ERROR with
#           both exits (they asserted the warning and the "0 11" Case
#           Processing row). D18: .jst_apply_mask()'s arguments -- on_error
#           and stage_label gone, n_frame added. K01-K06, K09, K10: the
#           stale jcomplete() STOPS (K03 was "still runs on every case", K04
#           "the rest still applies: 11 cases"; .kw() counts the stop's
#           lead; K10 also asserts the analysis runs after the remedy).
#           Section M: M01-M13 when set (the not-found form, its plural, the
#           default hint, the unchanged line; R's message for any other
#           error, on one line without color codes; a name never looked up
#           not blamed; the missing-name test in other languages; a message
#           dropped at set time); M14-M23 when used (the stored form and
#           both exits, in all thirteen entrants; the printed exits run;
#           two names; R's message; the default frame; a held warning given
#           back once); M24-M33 a workspace vector a condition would
#           recycle (set, silent case, labelled variable, unchanged line,
#           subset =, the vector path, the add-to-the-frame fix and its
#           run, the stored form, controls); M34-M39 jsubset(mf$Age > 40)
#           with no default. Fixture mf (a copy of d); workspace objects
#           carry an m_ prefix. TWO HUNDRED AND TWENTY-FOUR -> TWO HUNDRED
#           AND SIXTY-THREE.
#           MUTATION MAP (S330, sandbox, 55 one-change mutants of the
#           0.9.206 master, each RUN with all eight batteries; every one
#           reds at least one check). The UNEDITED 0.9.205 master reds B10
#           D16-D18 K01-K06 K09 M01-M22 M24-M32 M34-M38 (216/263). The set
#           time: errors swallowed again reds B10 M01-M11 M13; "were" never
#           M03; the default hint dropped M05, always M02 M06; the unchanged
#           line dropped M06 (everywhere: M06 M27); R's lines left out
#           M07-M11; color codes kept M09; R's message not on one line M09;
#           the shape check skipped A01-A04 B01-B11 B13 B15 B16. The
#           missing-name test: R's message not consulted M10-M12; the name
#           anywhere in it M11 M12; one quotation mark enough (after) M12,
#           (before) M12; a space as a mark M12; the frame's own variables
#           not excluded M03 M04 M20. When used: the stored failure warning
#           again reds D16 D17 M14-M22; "exist" never M20; the exits
#           swapped D17 M15 M21 M22 M32; the delete exit dropped D17 M15
#           M19 M21 M22 M32; R's lines left out M21; warnings not given
#           back M23, given back at set time B14, not held M28; messages
#           not dropped at set time M13, dropped when used M13; the
#           per-call evaluation message reworded D06. Recycling: the check
#           removed M24-M32; not run after a successful evaluation M24 M25
#           M27-M29 M32; not run when the evaluation fails M26 M30 M31; run
#           BEFORE the evaluation (this session's first build) B08 D08 D09;
#           the stored form dropped M32; n_frame not passed M30 M31; the
#           unchanged line M27; the subset = lead M28-M30; %in% read as
#           value-by-value M33 (and models_check F14 F15 I06 J05); one
#           value per row no longer passing HALTS this file at 78 (and
#           models_check J06 J15). jcomplete(): the warning back K01 K10;
#           stopping only when no variable is left K04; every variable
#           named K04; the remedy without NULL K02 K09 K10; an inactive
#           setting stopping K08. Frame first: the refusal removed M34-M38;
#           given whether or not a frame is named M39; the fix withheld
#           M34-M36; the fix for any function M38; the only-argument,
#           one-frame, summary, clean-rewrite and variable-present tests
#           removed, M37 each; "each variable" always M34, "the variable"
#           always M36. Two mutants of the refactored formula path red
#           models_check alone (n_frame not passed: J07-J10; only the first
#           term walked: I11 J01-J03 J07-J13). THREE SURVIVED THE FIRST RUN
#           and each was a missing input, added: a name with a mark on one
#           side only (M12's "no Agee, none"), a one-argument call of
#           another function (M38), a column reached by position (M37).
#           K03 K05 K06 and D18 are on the base's red list only; K07, M23
#           (red on one mutant), M33 and M39 are controls on the base.
# LAST VERIFIED: v0.9.206, R 4.6.1, 2026-10-03 (S330) -- 263/263 on the
#           WORKSTATION under run_all.R (1328 across eight), matching the
#           sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all; plain and
#           under the RStudio-handler stand-in). Restamped from PENDING at
#           S331.
# S324 EDIT (v0.9.201): I15-I34 added to SECTION I, 20 checks, with two
#           helpers (.scr_same, two calls printing the same lines;
#           .safe_lines, plines() giving the error text instead of halting,
#           for a statement outside check()). The S322 jscreen/jcorr item and
#           the probe that found the bypass. (A) I15-I17 jscreen() takes a
#           single column -- d$Age, with subset =, a plain c() vector; I18
#           a stored jsubset() on d reaches jdesc(d$Age), jfreq(d$Gender) and
#           jscreen(d$Age), each the data-frame form line for line, with no
#           "not active" line (on 0.9.200 they analyzed all twelve cases);
#           I19 d[["Age"]] the same; I20 a stored jcomplete(); I21 a jnumeric()
#           registration (Source "User-declared"); I22 jscreen()'s refusals,
#           their fixes run. (Rider) I23 a misspelled column is "Variable(s)
#           not found in d: Agee." on jdesc, jfreq and jscreen (it was
#           "exists but contains nothing (it is NULL)"); I24 d$Ag no longer
#           partial-matched, on jdesc and jcorr. (B) I25 jcorr(d$Age,
#           d$Keep01) verbatim, its fix run; I26 the same under a juse()
#           default (it said "Variable(s) not found in d: d$Age, d$Keep01");
#           I27 a named argument and a plain variable kept; I28 jrecode's
#           variable in its slot; I29 another frame's column, or a summary of
#           the frame, the sentence alone; I30 jconvert's positional `to`, the
#           sentence alone, named, the call; I31 d[["Age"]] rebuilt as Age;
#           I32 a misspelled column on jcorr; I33 jplot through the generic,
#           its fix plotting; I34 control, the leading comma omitted under a
#           default. TWO HUNDRED AND FOUR -> TWO HUNDRED AND TWENTY-FOUR.
#           MUTATION MAP (S324, sandbox, seventeen mutants of the 0.9.201
#           master, each RUN with all seven batteries; the nine below reach
#           this file): the in-frame re-call disabled reds I18-I21; the
#           frame not passed on by .jst_vector_frame reds I18-I21; jscreen's
#           accept_vector left FALSE reds I15-I18 I21 I22; the misspelled-
#           column branch removed reds I23 I24 I32; the data-first refusal
#           removed (the old Case 5) reds I25-I31 I33; its rebuilt call
#           withheld (the sentence always) reds I25 I27 I28 I30 I31 I33; the
#           slot rule removed reds I30; the frame-reference completeness
#           test removed reds I29; the summary test removed reds I29. No
#           check outside I15-I33 reds on any of them, and none of the eight
#           models_check.R mutants reds this file. Against the UNEDITED
#           0.9.200 master the battery reds I15-I33 (205/224); I34 is the
#           control, on no red list by design.
# S323 EDIT (v0.9.200): SECTION L (L01-L10) and I11b added, I11 FLIPPED, 11
#           checks. The S322 subset-condition item: a condition is evaluated
#           with the analysis copy as data and the caller's frame as
#           enclosure, so subset = fl$Inc < 45 read Inc from the raw frame and
#           KEPT the declared -99 cases that subset = Inc < 45 counts as
#           missing. L01 the apply-time refusal and its fix line; L02 that
#           fix, run, excludes 6, keeps 6 and counts the two -99 cases as
#           missing; L03 two references, the plural; L04-L06 the set-time
#           refusal (named frame, juse() default, an earlier filter reported
#           unchanged and kept); L07 the printed jsubset() fix run; L08 a
#           lookup table and a summary of the frame, save-it-first; L09 a
#           list of settings is a value; L10 control. I11 (S315: a column
#           reached as d$Keep01 on the vector path is SERVED) flipped by
#           Jeff's S323 ruling to a refusal with the data-frame form, which
#           runs; I11b keeps the S315 exemption's other half, a list element
#           served. Fixture fl (d plus Inc, SPSS-style, -99 declared on rows
#           3 and 7), look_l and lim_l, removed at the section's foot. ONE
#           HUNDRED AND NINETY-THREE -> TWO HUNDRED AND FOUR.
#           MUTATION MAP (S323, sandbox, nine mutants of the 0.9.200 master
#           that reach this file, each RUN with all seven batteries): the
#           UNEDITED 0.9.199 master reds I11 L01 L03-L08 (196/204); the
#           apply-time check removed reds L01 L03 L08; the set-time check
#           removed reds L04-L07; the vector-path check removed reds I11; the
#           "unchanged" line dropped reds L06; the named frame left out of
#           the jsubset() fix reds L04 L06 L07; the plural always reds L01
#           L04 L05 (and models_check I18); the summary route removed reds
#           L08 (and models_check I20); the vector path's $ exemption
#           removed (the S315 mutant) reds I11b. No check outside I11, I11b
#           and L reds on any of them; L02 L09 L10 are controls on the
#           unedited master, and every other new check is on at least one
#           mutant's red list.
# S318 EDIT (v0.9.194): SECTION K (K01-K10) added, 10 checks. Step 1 of
#           .jst_apply_pipeline() skipped a stored jcomplete()'s absent
#           columns without a word (the CPS row read 0 when none was left);
#           it now warns. K01-K02 the warning's text and layout (Rules E,
#           L); K03 the analysis still runs on every case; K04 a partly
#           stale setting names only the absent column and still applies
#           the rest (11 cases); K05 two absent columns, and-joined, "them";
#           K06 once per call in all twelve pipeline entrants; K07 and K08
#           controls (every column present; the setting off); K09 the
#           juse() default names the frame in both places; K10 the printed
#           remedy line, run as printed, clears the setting and ends the
#           warning. ONE HUNDRED AND NINETY-THREE checks.
#           MUTATION MAP (S318, sandbox, nine mutants): the UNEDITED 0.9.193
#           master reds K01 K02 K04-K06 K09 K10 (186/193); a warning with
#           nothing absent reds K07; a warning for an inactive setting reds
#           K08; the pronoun fixed at "it" reds K05; every variable in the
#           setting named reds K04; the remedy without NULL reds K02 K09
#           K10; the Rule E break dropped reds K02; the warning emitted
#           twice reds K06 K09; the presence filter removed reds K01-K06
#           K09 K10. No check outside section K reds on any of the nine; K03
#           K07 K08 are controls on the unedited master, and every K check
#           is on at least one mutant's red list.
# LAST VERIFIED: v0.9.201 PENDING, 2026-10-01 (S324) -- 224/224 in the
#           SANDBOX (R 4.3.3, UTF-8 locale, ::/::: shimmed; 1092 across
#           seven); WORKSTATION run pending Jeff's receive of the 0.9.201
#           master.
# LAST VERIFIED: v0.9.200, R 4.6.1, 2026-10-01 (S323) -- 204/204 on the
#           WORKSTATION under run_all.R (1056 across seven), matching the
#           sandbox (restamped from PENDING at S324). Prior: v0.9.194,
#           2026-09-28 (S318) -- 193/193 on the
#           WORKSTATION under run_all.R (893 across seven), matching the
#           sandbox (restamped from PENDING at S323; green in every run_all.R
#           since, 1013 across seven at v0.9.199). Prior: v0.9.193,
#           2026-09-27 (S317) -- 183/183 on the WORKSTATION under run_all.R
#           (883 across seven).
# S317 EDIT (v0.9.193): SECTION J (J01-J10) added, 10 checks. jscreen()
#           narrowed its frame to the named variables before the pipeline,
#           so a stored setting on an unnamed column was skipped: jsubset()
#           with a warning that blamed the expression, jcomplete() without
#           a word. J01-J03 a stored jsubset() (6 cases, no warning, only
#           the named variables screened); J04 and J05 controls (the
#           filter's column named as well; nothing named); J06-J07 a stored
#           jcomplete(), alone and with a jsubset(); J08 the juse()
#           default's leading-comma form; J09-J10 a per-call subset = on an
#           unnamed column (it still applies; its column is no longer
#           screened). .scr() returns empty parts on an error, so a broken
#           build fails inside the verdict. ONE HUNDRED AND EIGHTY-THREE
#           checks.
#           MUTATION MAP (S317, sandbox, five mutants): the UNEDITED 0.9.192
#           master reds J01 J02 J06 J07 J08 J10 (177/183); the per-call
#           auto-include restored reds J10 alone; the narrowing removed
#           (every column screened) reds J03 J04 J10; the narrowing moved
#           back above the pipeline, without the auto-include, reds J01 J02
#           J06-J10; the pipeline keyed on no frame name reds J01 J04-J08.
#           No check outside section J reds on any of the five. J05 and J09
#           are controls on the unedited master; every J check is on at
#           least one mutant's red list.
# S315 EDIT (v0.9.190): H30-H31 and SECTION I (I01-I14) added, 16 checks.
#           H30/H31 count evaluations of an expression given to jplot()
#           positionally and as data =. Section I: subset = (I01 jdesc, I02
#           jfreq), digits = (I03) and case.processing.detail = (I04) reach
#           the re-call, each against the data-frame form; the three new
#           refusals with their fix lines RUN (I05-I09); a condition using
#           an object in a calling function's frame (I10) or a column
#           reached as d$Keep01 (I11) is served, not refused; a named item
#           gets the S290 single-= message (I12); a bare column alone is
#           unchanged (I13); nothing names the internal frame (I14). ONE
#           HUNDRED AND SEVENTY-THREE checks.
#           MUTATION MAP (S315, sandbox, twelve mutants): jplot passing no
#           pre_eval reds H30 H31; the re-call without subset reds I01 I02
#           I10 I11; without digits reds I03; without
#           case.processing.detail reds I04; evaluated in the helper's own
#           frame instead of the caller's reds I10 alone; the by = guard
#           removed reds I05 I06; the condition scan removed reds I07 I08;
#           the frame$column exemption removed reds I11; the further-
#           variables guard removed reds I09; the named-item detector
#           dropped from jdesc's branch reds I12; the refusal naming the
#           internal frame reds I07 I08 I14; the resolver ignoring pre_eval
#           reds H30 H31 (and N71a-c in missing_convention_check.R). I13 is
#           a control -- a bare column alone, unchanged -- and on no red
#           list by design. Against the v0.9.189 master the battery reds
#           H30 H31 I01-I12 (14).
# LAST VERIFIED: v0.9.190 PENDING, 2026-09-26 (S315) -- 173/173 in the
#           SANDBOX (R 4.3.3, ::/::: shimmed); WORKSTATION run pending
#           Jeff's receive of the 0.9.190 master. Prior: v0.9.189,
#           2026-09-26 (S314) -- 157/157 on the WORKSTATION under run_all.R
#           (821 across seven), which also confirms the S312 stamp below.
# S312 EDIT (v0.9.184): E01 and F07 re-pinned. The fixture's Age holds one
#           NA, and a jsubset() / subset = row now carries "(k missing)"
#           after its expression when the condition evaluated to NA for
#           k cases (the CPS filter accounting; cps_check.R N39-N45 own the
#           rule), so both rows read "... (1 missing)". Two assertions,
#           wording only; count unchanged at 157.
# LAST VERIFIED: v0.9.184, 2026-09-24 (S312) -- 157/157 in the SANDBOX
#           (E01/F07 re-pinned); WORKSTATION run PENDING. Prior:
# LAST VERIFIED: v0.9.178, 2026-09-20 (S307) -- 157/157 on the WORKSTATION
#           (sourced from the regression folder with echo = TRUE, after
#           receive_package()'s clean devtools::check()), matching the
#           SANDBOX (R 4.3.3, source()'d, ::: shimmed) check for check.
#           MUTATION MAP (S307,
#           sandbox, five mutants): M29 the UNEDITED 0.9.177 generic (with
#           the parity wording applied, so the H13/H14 re-pin does not
#           confound; the true 0.9.177 master reds H13 H14 as well) reds
#           H15-H24 H26 H27 H29 (144/157); M30 `which` left NAMED in the
#           rebuilt call reds H18 H24; M31 the method resolved by NAME in
#           the caller's frame (the old evaluation) reds H26 H27; M32 the
#           both-ways stop disabled reds H22 H23; M33 data = left in place
#           (not moved to the front) reds H15-H21 H27 H29. Not on any
#           mutant's red list BY DESIGN: H25 and H28, the controls (a typed
#           which = still an unused input; result-object dispatch).
#           Prior: v0.9.172, 2026-09-19 (S300) -- 142/142 on the WORKSTATION
#           (run_all.R, after receive_package()'s clean devtools::check()),
#           matching the SANDBOX (R 4.3.3, source()'d, ::: shimmed) check
#           for check. MUTATION MAP (S300, sandbox, three
#           mutants): M26 the UNEDITED 0.9.171 master reds exactly H09-H14
#           (136/142); M27 the data = branch with its name recovery removed
#           reds H11 H12 (the plot reads the right frame; the lookups and
#           messages do not); M28 the both-ways stop disabled reds H13 H14.
#           H01-H08 green on all three.
#           Prior: v0.9.169, 2026-09-16 (S296) -- 136/136 on the WORKSTATION
#           (sourced from Downloads with echo = TRUE, after a clean
#           devtools::check() on the received S296 master), matching the
#           SANDBOX (R 4.3.3, source()'d, ::: shimmed) check for check.
#           MUTATION MAP
#           (S296, sandbox, two mutants): M24 the UNEDITED 0.9.168 master
#           (the pre-fix code, ">= 2" / [[2]]) reds H01 H02 H04 H05 H06
#           H08; M25 the pipeline call keyed on NULL with the name still
#           recovered reds H01 H02 H04 H07 H08 (H05 H06 stay green: the
#           messages read the name, the lookups read the pipeline's key).
#           Not on any mutant's red list BY DESIGN: H03, the default-path
#           control -- it asserts the path the fix does not touch, so a
#           red there would mean the fixture, not the fix.
#           Prior: v0.9.167, 2026-09-14 (S294) -- 128/128 on the WORKSTATION
#           (sourced from Downloads with echo = TRUE, after a clean
#           devtools::check() on the received S294 master), matching the
#           SANDBOX (R 4.3.3, source()'d, ::: shimmed) check for check.
#           MUTATION MAP (S294, sandbox, six mutants): M18 jsubset's bare
#           NULL routed back to clear_every() (the pre-S294 global) reds
#           C18 C18b C18d;
#           M19 jcomplete's named-frame interception removed reds C20-C24
#           then HALTS at C25's setup quiet(jcomplete(e, NULL)) (a stop() is
#           FAIL under the run_all contract); M20 .jst_pipeline_clear_target()
#           returning frames[1] instead of stopping reds C18d C33; M21
#           jcomplete's clear.all branch disabled reds C28 C29 and, by
#           knock-on through reset(), E01 E02 F07 -- the demonstration that
#           the reset lines had to move to clear.all = TRUE; M22 the
#           leading-comma detection disabled reds C26 C27 C32; M23
#           jcomplete's bare NULL routed back to clear_every() reds C30 C31
#           C33. The re-pinned D07 D17 E01 (the S293 "jsubset()" row label;
#           stale since S293, 107/110 on the unedited 0.9.166 master) are
#           on the S289 map's M1 list. Not on any mutant's red list: C23
#           C25 C34 and the C13 remainder (each asserts a message or state
#           the S289 map's M7 / M8 cover in jsubset's copy of the same
#           closure).
#           Prior: v0.9.164, 2026-09-12 (S290) -- 110/110 on the WORKSTATION
#           (sourced from Downloads with echo = TRUE, after a clean
#           devtools::check()) on the first S290 master, matching the
#           sandbox exactly; THEN the shape check's messages were
#           redrafted after Jeff's review (the bare-name case given its
#           own three-line message on both forms; the "gives <what>" lead
#           of the four siblings and the stored form replaced by plain
#           verbs -- "is a single value", "is numeric", "is text", "has 3
#           values for 12 rows") and twenty checks re-asserted (A01-A04,
#           B01-B04 B07 B08 B13, D01-D05 D08 D13 D14, F06) -- 110/110 on
#           the WORKSTATION again on the final S290 master (2026-09-13,
#           after receive_package() + devtools::check() clean, and
#           cps_check.R 67/67 on the same master), matching the sandbox
#           (R 4.3.3, source()'d, ::: shimmed) check for check.
#           MUTATION MAP (S290, sandbox, seven mutants, on the 110-check
#           file): M9 the detector body replaced by return(invisible(NULL))
#           reds G01-G03 G05-G09 and all thirteen G11 lines (G04 G10 G12
#           stay green -- they assert absence or an unnamed list); M10
#           origin forced to "set" inside the checker reds F01-F04 F10;
#           M11 the xor exemption removed reds A18 then HALTS at F08's
#           plines() (a stop() is FAIL under the run_all contract); M12
#           the bare-name branch restored on both routes reds A01 A02
#           A05b D01 D02 then HALTS at F07's plines() (D03 and F06 assert
#           only the corrected line, which that branch also builds); M13
#           ONE site's
#           detector call dropped (jconvert) reds exactly that site's G11
#           line; M14 the pipeline call site removed reds F01-F05 F10
#           (F06-F09 green: the shape check and acceptance were never the
#           syntax check's); M15 has_subset forced FALSE reds G06 G07 and
#           the five with-subset G11 lines; M16 the bare-name message's
#           set-form branch disabled (the generic "is numeric" lead returns)
#           reds A01 A02; M17 its call-form branch disabled reds D01-D03
#           F06. Every S290 check is on at least one mutant's red list.
#           MUTATION MAP (S289, sandbox, eight mutants): M1 shape check
#           removed from .jst_apply_mask reds D01-D05 D08 D09 D11 D13 D14
#           (D10 stays green there because a stale mask still dies inside
#           haven -- D10's mutant is M5); M2 T/F bypass the dry run reds
#           A03 A04 only; M3 the deparsed-string "=" regex restored reds
#           A08 A10-A13 and B02 (na.rm = TRUE inside mean() false-fires);
#           M4 dry run removed reds A03 A04 B01-B11 B13 B15 B16; M5 shape
#           check made to honour on_error = "warn" reds D08-D11 D13 D14
#           and leaves every per-call check green; M6 dry run catching
#           warnings with tryCatch instead of muffling reds B13 alone (B14
#           cannot see it -- a caught warning also stores silently); M7
#           named-frame NULL / off / on removed HALTS the battery at the
#           first quiet(jsubset(d, NULL)) setup line (a stop() is FAIL
#           under the run_all contract, so the red is the verdict line,
#           not a check); M8 clear_one() forgetting to delete reds C04-C07
#           C09 directly and B12 B14 E02 by knock-on (they clear with the
#           named form). Knock-on reds were removed from A10-A13 and B14
#           by clearing before each; every remaining red is either direct
#           or listed here.
# RUN:      source()-safe from any working directory. All output is explicit
#           cat(), so echo = TRUE is NOT required. Also runnable via
#           regression/run_all.R, which treats a stop() as FAIL.
# CONTRACT: one printed line per check, a final "RESULT: PASS (n/n)" line,
#           and stop() if and only if any check failed.
# PAIR:     filter_walk.R is the human half: it renders every guided error
#           once; this file asserts what must be true of them.
# FIXTURE:  built INLINE (twelve rows, one NA, one haven-labelled column), so
#           the file needs no dataset and runs identically in the sandbox and
#           on the workstation. The filter surface is about SHAPES, not
#           data; nothing here depends on a shipped dataset's values.
# WHY IT EXISTS: before S289 no regression file took filtering as its
#           subject -- the cps pair uses jsubset() as a vehicle to reach CPS
#           rows. The S287 subset= item landed here at S290 (sections F, G).
# =============================================================================

# --- Setup -------------------------------------------------------------------

# jstats must be loaded already: devtools::load_all() (development) OR
# library(jstats) (installed) -- never both in one session.
stopifnot(exists("jload", mode = "function"))

# What is in the workspace on entry (S337): on a green run everything this
# battery made beyond it is removed at the foot, so a walk that reports on
# the data frames in the workspace can follow a battery in one session.
.entry_names <- ls(globalenv(), all.names = TRUE)

# Guard 5 (S359; the S345 item): the VALUES of the workspace's objects on
# entry, so the foot can put back any a run changed. Guard 2 compares
# names only, and a fixture or a working object named like one of the
# user's own -- d, x, s -- replaced it. Held by reference, so nothing is
# copied unless the run changes the object. Dotted names are the harness's
# and are left out.
.entry_values <- mget(grep("^\\.", .entry_names, value = TRUE, invert = TRUE),
                      envir = globalenv())
.ws_restore <- function() {
  back <- names(.entry_values)[vapply(names(.entry_values), function(nm) {
    !exists(nm, envir = globalenv(), inherits = FALSE) ||
      !identical(get(nm, envir = globalenv(), inherits = FALSE),
                 .entry_values[[nm]])
  }, logical(1))]
  for (nm in back) assign(nm, .entry_values[[nm]], envir = globalenv())
  if (length(back) > 0L) {
    cat("Put back as they were on entry: ", paste(back, collapse = ", "),
        "\n", sep = "")
  }
  invisible(back)
}

# Session state to hand back at the foot (record / force / restore, S253).
.entry_message_width <- getOption(".jst_options_message_width")
.entry_default_data  <- getOption(".jst_default_data")
# The output level too (S337; the S249 item's guard (4)): joutput(NULL) below
# forces the default, and without this line the session came back there.
.entry_output_level  <- getOption(".jst_output_level")
# The stored display settings too (S346): the diagnostics setting outlives
# a level call, so restoring the level alone would hand back a session
# without it.
.entry_output_toggles <- getOption(".jst_output_toggles")

# Message-width pin. MANDATORY: the emitter wraps to this setting and since
# S256 the shipped default follows the console pane, so an unpinned battery
# asserts against whatever size the window happens to be.
.pin_width <- 76L
options(.jst_options_message_width = .pin_width)

# Neutral pipeline state (state persists across calls AND across sessions).
# clear.all = TRUE on the three per-frame setters: since S294 a bare
# jsubset(NULL) / jcomplete(NULL) clears only the default frame (C18 locks
# it), as jdummy(NULL) has since the registration verbs unified.
jsubset(clear.all = TRUE); jcomplete(clear.all = TRUE); joutput(NULL)
jdummy(clear.all = TRUE)
juse(NULL)

# --- Fixture -----------------------------------------------------------------
# Twelve rows. Age carries one NA (row 8). Keep01 is a 0/1 indicator (six 1s:
# rows 1, 3, 5, 7, 9, 11 -- ages 30, 50, 62, 41, 55, 48). Condition is
# haven-labelled, so the numeric-mask path is exercised on the class the
# cryptic haven error used to surface on. Under40 is logical, the column a
# bare-name filter (jsubset(d, Under40)) must now ACCEPT (S290).
d <- data.frame(
  Name   = c("Ann", "bob", "Al", "Cy", "Abe", "Di",
             "Ed", "Flo", "Gus", "Hal", "Ivy", "Jo"),
  Age    = c(30, 45, 50, 38, 62, 27, 41, NA, 55, 33, 48, 29),
  Keep01 = c(1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0),
  Gender = c(1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2),
  stringsAsFactors = FALSE
)
d$Condition <- haven::labelled(c(1L, 2L, 1L, 3L, 2L, 1L,
                                 3L, 2L, 1L, 2L, 3L, 1L),
                               c(A = 1L, B = 2L, C = 3L))
d$Under40 <- d$Age < 40                  # a genuine TRUE/FALSE column (S290):
                                         # five TRUE, six FALSE, one NA (row 8)
e <- d                                   # a second frame for the two-frame checks

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
# halting the battery. Verify any asserted wording against SOURCE, not
# memory, when writing a check.
# Stdout is swallowed as well: an analysis that errors at apply time has
# already printed its title, and that title would break the one-line-per-
# check contract.
grab <- function(expr) {
  msgs <- character(0)
  invisible(utils::capture.output(withCallingHandlers(
    tryCatch(expr,
             error = function(e) {
               .see("error", e); msgs <<- c(msgs, conditionMessage(e))
             }),
    message = function(m) {
      .see("note", m)
      msgs <<- c(msgs, conditionMessage(m)); invokeRestart("muffleMessage")
    },
    warning = function(w) {
      .see("warning", w)
      msgs <<- c(msgs, conditionMessage(w)); invokeRestart("muffleWarning")
    }
  )))
  paste(msgs, collapse = "")
}

# .seen (S337): every condition grab() takes, ONE BY ONE, with its kind and the
# message width in force -- the raw material of the sweeps at the foot
# (P01, P02). grab() returns them joined, and in a joined text the
# last line of one message and the first line of the next would read as a
# pair of lines from one wrap.
.seen <- list()
.see  <- function(kind, cnd) {
  .seen[[length(.seen) + 1L]] <<- list(
    kind = kind, text = conditionMessage(cnd),
    width = getOption(".jst_options_message_width"))
}

# flat(): the emitter wraps at the pin, so a sentence longer than ~70
# columns arrives with a newline where a space was typed. Assert prose
# through flat(); assert LAYOUT (the indented code lines, the Rule E
# breaks) on the raw text, where the newlines are the claim.
flat <- function(txt) gsub("\n", " ", txt, fixed = TRUE)

# errs(): TRUE if the call raised an error (as opposed to warning and
# running on). The always-stops rule is asserted with this, not with grab(),
# because grab() concatenates a warning and an error indistinguishably.
errs <- function(expr) {
  tryCatch({ suppressWarnings(suppressMessages(utils::capture.output(expr)))
             FALSE },
           error = function(e) TRUE)
}

# plines(): printed stdout as a character vector, ANSI colour stripped. Same
# name and same return type as cps_check.R's plines(), deliberately -- a
# same-named helper with a DIFFERENT return type is the S256 warm-session
# trap, and identical semantics are the safe way to share a name.
plines <- function(expr) {
  txt <- suppressWarnings(suppressMessages(utils::capture.output(expr)))
  sub("[ \t]+$", "", gsub("\033\\[[0-9;]*[A-Za-z]", "", txt))
}
quiet  <- function(expr) invisible(plines(expr))
# row_of(): plain-text matching, as in cps_check.R since S293 -- as a regex
# the S293 label "jsubset()" is jsubset plus an EMPTY GROUP, which matches
# the OLD row and never the new one.
row_of <- function(ln, label) {
  any(startsWith(ln, " ") &
      startsWith(trimws(ln, which = "left"), paste0(label, " ")))
}
has    <- function(txt, needle) grepl(needle, txt, fixed = TRUE)
fs_of  <- function(frame) jstats:::.jst_get_filter(frame)
cs_of  <- function(frame) jstats:::.jst_get_complete(frame)
widest <- function(txt) max(nchar(strsplit(txt, "\n", fixed = TRUE)[[1]]))

reset <- function() {
  quiet(jsubset(clear.all = TRUE)); quiet(jcomplete(clear.all = TRUE))
  quiet(joutput(NULL, quiet = TRUE)); quiet(juse(NULL))
}

# =============================================================================
# A -- THE SET-TIME SYNTAX CHECK (.jst_check_filter_syntax)
# =============================================================================

# S290: the bare-name branch is GONE. A lone name reaches the dry run and is
# judged by what it produces -- a genuine TRUE/FALSE column is ACCEPTED (the
# old branch refused it), and a numeric column gets the shape check's
# bare-name message, which since S290 mirrors the single-= error (the
# mistake, the two equals signs, the corrected call) and says nothing about
# what the variable holds. A05 keeps its S289 meaning (T is a single value).
reset()
.a01 <- grab(jsubset(d, Gender))
check("A01 bare numeric name: the variable-name message, nothing about 'numbers'",
      has(flat(.a01), "Gender on its own is a variable name, which does not select rows in R.") &&
      !has(.a01, "is numeric"))
check("A02 ... with the two-equals fix line and the corrected call, frame kept",
      has(.a01, "Use == (two equals signs) to compare it to a value:\n  jsubset(d, Gender == 1)"))
check("A03 T is refused as a single value (not exempt, not a 'variable')",
      has(grab(jsubset(d, T)), "T is a single value (TRUE)"))
check("A04 F likewise",
      has(grab(jsubset(d, F)), "F is a single value (FALSE)"))
check("A05 T does NOT get the variable-name wording",
      !has(grab(jsubset(d, T)), "variable name"))
quiet(jsubset(d, NULL))
check("A05b bare LOGICAL name: accepted (activates), not refused (S290)",
      has(grab(jsubset(d, Under40)), "jsubset activated for d"))

.a06 <- grab(jsubset(d, (Gender = 1) & (Age < 40)))
check("A06 operator = inside parentheses: the single-= error",
      has(.a06, "(Gender = 1) & (Age < 40) uses a single ="))
check("A07 ... and the corrected call rewrites each = to ==, keeping the frame the call named (S338)",
      has(.a06, "\n  jsubset(d, (Gender == 1) & (Age < 40))"))
check("A08 operator = inside braces: caught too",
      has(grab(jsubset(d, {Gender = 1})), "uses a single ="))
.a09 <- grab(jsubset(d, (Gender = 1) & grepl("^A", Name, ignore.case = TRUE)))
check("A09 = beside a named argument: the rewrite touches only the operator",
      has(.a09, "(Gender == 1) & grepl(\"^A\", Name, ignore.case = TRUE)"))

# The S288 third face: none of these may fire the "=" branch. Each starts
# from a cleared frame so "activated" (not "replaced") is the expected note
# regardless of what an earlier check left behind.
quiet(jsubset(d, NULL))
check("A10 named argument in a call: NOT the = error (activates)",
      has(grab(jsubset(d, grepl("^A", Name, ignore.case = TRUE))),
          "jsubset activated for d"))
quiet(jsubset(d, NULL))
check("A11 named argument, arithmetic call: activates",
      has(grab(jsubset(d, round(Age, digits = 0) < 40)),
          "jsubset activated for d"))
quiet(jsubset(d, NULL))
check("A12 = inside a quoted string: activates",
      has(grab(jsubset(d, Name == "A=B")), "jsubset activated for d"))
quiet(jsubset(d, NULL))
check("A13 na.rm = TRUE inside a nested call: activates",
      has(grab(jsubset(d, rowMeans(cbind(Age, Age), na.rm = TRUE) > 3)),
          "jsubset activated for d"))
.a14 <- grab(jsubset(d, NOT(Age < 40)))
check("A14 the keyword branch: NOT(...) caught, in the Rule AD shape (S290)",
      has(flat(.a14), "NOT(Age < 40) uses NOT, which R does not recognize.") &&
      !has(.a14, "You wrote"))
check("A15 ... the fix built from the input, NOT's operand parenthesized, the frame kept (S338)",
      has(.a14, "Use ! (exclamation mark):\n  jsubset(d, !(Age < 40))"))
check("A16 lowercase not(...) is caught too, and echoed as typed (Rule AB)",
      has(flat(grab(jsubset(d, not(Age < 40) & Gender == 1))),
          "uses not, which R does not recognize"))
check("A17 a keyword that is not a call head falls back to a generic example, which takes no frame: its variables are not the user's",
      has(grab(jsubset(d, Age < 40 & AND)), "\n  jsubset(Age < 40 & Volunteer == 1)"))
quiet(jsubset(d, NULL))
check("A18 the real xor() is ACCEPTED at set time (was refused before S290)",
      has(grab(jsubset(d, xor(Age < 40, Gender == 1))), "jsubset activated for d"))
reset()

# =============================================================================
# B -- THE SET-TIME DRY RUN (jsubset() runs the filter once)
# =============================================================================

reset()
.b01 <- grab(jsubset(d, TRUE))
check("B01 TRUE: a single value, no parenthetical for the literal",
      has(flat(.b01), "TRUE is a single value, not one TRUE or FALSE for every case."))
check("B02 an aggregate: a single value WITH the computed value shown",
      has(grab(jsubset(d, mean(Age, na.rm = TRUE) > 40)),
          "is a single value (TRUE)"))
check("B03 numeric: the arithmetic form",
      has(grab(jsubset(d, Keep01 * 1)), "Keep01 * 1 is numeric"))
.b04 <- grab(jsubset(d, "null"))
check("B04 a quoted null: text, and the unquoted NULL form back",
      has(.b04, "\"null\" is text") &&
      has(.b04, "To clear the filter, use NULL without quotes:\n  jsubset(d, NULL)"))
check("B05 a quoted off: the unquoted off form back",
      has(grab(jsubset(d, "off")), "  jsubset(d, off)"))
check("B06 a quoted ON (any case): the unquoted on form back",
      has(grab(jsubset(d, "ON")), "use on without quotes:\n  jsubset(d, on)"))
check("B07 an empty result: 'no values at all'",
      has(grab(jsubset(d, character(0))), "has no values at all"))
keep3 <- c(TRUE, FALSE, TRUE)
.b08 <- grab(jsubset(d, keep3 == TRUE))
check("B08 wrong count from a workspace object: named as ruling R19's stop names one, counted in cases, and the own-columns fix (S359; it said '3 values for 12 rows')",
      has(flat(.b08), paste0("jsubset(): In keep3 == TRUE, keep3 is not in the d data frame; it is a separate object in your workspace. ",
                             "It has 3 values for the 12 cases in the d data frame, not one TRUE or FALSE for every case.")) &&
      has(.b08, "\nBuild the filter from the data frame's own columns, for example:\n  jsubset(Age < 40)"))
check("B08b wrong count with no object to name: the plain form, counted in cases",
      has(flat(grab(jsubset(d, c(TRUE, FALSE)))),
          "jsubset(): c(TRUE, FALSE) has 2 values for 12 cases, not one TRUE or FALSE for every case.") &&
        is.null(fs_of("d")))
check("B09 nothing is stored after a refused set",
      is.null(fs_of("d")))
check("B10 an evaluation failure is REFUSED (S330; it was silent, and the filter stored), and nothing is stored",
      { .b10 <- grab(jsubset(d, nonexistent_obj > 3))
        has(flat(.b10), "nonexistent_obj > 3 names nonexistent_obj, which was not found in the d data frame.") &&
          !has(.b10, "activated") && is.null(fs_of("d")) })
quiet(jsubset(d, NULL)); quiet(jsubset(d, Age < 40))
.b11 <- grab(jsubset(d, TRUE))
check("B11 with a prior filter: the unchanged line, and the prior survives",
      has(.b11, "Your earlier filter for the d data frame is unchanged.") &&
      identical(fs_of("d")$expr_str, "Age < 40"))
quiet(jsubset(d, NULL))
check("B12 without a prior filter: no unchanged line",
      !has(grab(jsubset(d, TRUE)), "unchanged"))
check("B13 a warning during the dry run is MUFFLED, not caught -- the shape\n      check still runs (a scalar NA is refused)",
      has(grab(jsubset(d, as.numeric("x") > 0)), "is a single value (NA)"))
quiet(jsubset(d, NULL))
check("B14 ... and a warning on a well-shaped filter neither blocks nor leaks",
      { .g <- grab(jsubset(d, as.numeric(Name) > 0))
        has(.g, "jsubset activated for d") && !has(.g, "NAs introduced") })
quiet(jsubset(d, NULL))
quiet(juse(d))
check("B15 default-frame form: the example carries no frame",
      has(grab(jsubset(TRUE)), "\n  jsubset(Age < 40)"))
check("B16 default-frame quoted null: jsubset(NULL) without a frame",
      has(grab(jsubset("null")), "  jsubset(NULL)"))
reset()

# =============================================================================
# C -- THE GRAMMAR: per-frame NULL / off / on, leading-comma, clear.all
# =============================================================================
# C01-C19 jsubset(); C20-C34 jcomplete(), which took the same grammar at
# S294. The bare f(NULL) resolves as the registration verbs' does since
# S294: the juse() default frame, else the sole frame carrying a setting,
# else a STOP that names both exits (C18-C18d, C30-C33).

reset()
quiet(jsubset(d, Age < 40))
check("C01 jsubset(d, off) deactivates by name",
      has(grab(jsubset(d, off)), "jsubset deactivated for d.") &&
      isFALSE(fs_of("d")$active))
check("C02 ... an analysis then runs with the inactive note",
      any(grepl("(jsubset set but inactive)", plines(jdesc(d, Age)),
                fixed = TRUE)))
check("C03 jsubset(d, on) reactivates by name",
      has(grab(jsubset(d, on)), "jsubset reactivated for d: Age < 40") &&
      isTRUE(fs_of("d")$active))
check("C04 jsubset(d, NULL) clears that frame only, reporting what it had",
      has(grab(jsubset(d, NULL)), "jsubset cleared for d (had: Age < 40).") &&
      is.null(fs_of("d")))
check("C05 ... again: nothing to clear",
      has(grab(jsubset(d, NULL)), "No jsubset set for d. Nothing to clear."))
check("C06 jsubset(d, off) with none set",
      has(grab(jsubset(d, off)), "No jsubset set for d. Nothing to deactivate."))
check("C07 jsubset(d, on) with none set names the named-frame set form",
      has(grab(jsubset(d, on)),
          "No jsubset set for d. Use jsubset(d, expression) to set one."))

quiet(jsubset(d, Age < 40)); quiet(jsubset(e, Gender == 1))
quiet(jsubset(d, off))
check("C08 two frames: off on d leaves e active",
      isFALSE(fs_of("d")$active) && isTRUE(fs_of("e")$active))
quiet(jsubset(e, NULL))
check("C09 two frames: NULL on e leaves d's entry",
      is.null(fs_of("e")) && identical(fs_of("d")$expr_str, "Age < 40"))
quiet(jsubset(d, NULL))

quiet(juse(d)); quiet(jsubset(Age < 40))
check("C10 leading-comma jsubset(, off) reaches the default frame",
      has(grab(jsubset(, off)), "jsubset deactivated for d."))
check("C11 leading-comma jsubset(, on)",
      has(grab(jsubset(, on)), "jsubset reactivated for d: Age < 40"))
check("C12 leading-comma jsubset(, NULL) clears the default frame",
      has(grab(jsubset(, NULL)), "jsubset cleared for d (had: Age < 40)."))
quiet(juse(NULL))
check("C13 leading-comma off with no default: the no-default note",
      has(grab(jsubset(, off)), "No default data frame set."))

quiet(jsubset(d, Age < 40)); quiet(jsubset(e, Gender == 1))
.c14 <- grab(jsubset(clear.all = TRUE))
check("C14 clear.all = TRUE clears every frame",
      has(.c14, "jsubset cleared (2 data frames):") &&
      is.null(fs_of("d")) && is.null(fs_of("e")))
check("C15 clear.all = TRUE with nothing set",
      has(grab(jsubset(clear.all = TRUE)), "No jsubset settings to clear."))
check("C16 clear.all beside a filter is refused",
      has(grab(jsubset(d, Age < 40, clear.all = TRUE)),
          "`clear.all` cannot be combined with a filter"))
check("C17 clear.all must be TRUE or FALSE",
      has(grab(jsubset(clear.all = "yes")), "`clear.all` must be TRUE or FALSE."))
quiet(jsubset(d, Age < 40)); quiet(jsubset(e, Gender == 1))
quiet(juse(d))
.c18 <- grab(jsubset(NULL))
check("C18 bare jsubset(NULL) clears the DEFAULT frame only (flipped S294)",
      has(.c18, "jsubset cleared for d (had: Age < 40).") &&
      is.null(fs_of("d")) && identical(fs_of("e")$expr_str, "Gender == 1"))
quiet(juse(NULL))
check("C18b no default, one frame carries a setting: that frame is cleared",
      has(grab(jsubset(NULL)), "jsubset cleared for e (had: Gender == 1).") &&
      is.null(fs_of("e")))
check("C18c no default, nothing set: nothing to clear (bare and leading-comma)",
      has(grab(jsubset(NULL)), "No jsubset settings to clear.") &&
      has(grab(jsubset(, NULL)), "No jsubset settings to clear."))
quiet(jsubset(d, Age < 40)); quiet(jsubset(e, Gender == 1))
.c18d <- flat(grab(jsubset(NULL)))
check("C18d no default, two frames: STOP naming both frames and both exits; nothing cleared",
      has(.c18d, "jsubset(): more than one data frame carries a jsubset setting: d, e.") &&
      has(.c18d, "e.g. jsubset(d, NULL), or clear them all with jsubset(clear.all = TRUE).") &&
      !is.null(fs_of("d")) && !is.null(fs_of("e")))
quiet(jsubset(clear.all = TRUE))
quiet(juse(d)); quiet(jsubset(Age < 40)); quiet(jsubset(e, Gender == 1))
quiet(jsubset(off))
check("C19 bare jsubset(off) is default-scoped (e untouched)",
      isFALSE(fs_of("d")$active) && isTRUE(fs_of("e")$active))
reset()

# -- jcomplete: the same grammar (S294) ----------------------------------------
# jcomplete() gained clear.all = TRUE and the per-frame off / on / NULL at
# S294 on jsubset()'s closure pattern, and its bare NULL flipped with
# jsubset()'s. Same fixture: Age carries one NA, so jcomplete(d, Age) is a
# real one-variable filter; e is d's copy.
reset()
quiet(jcomplete(d, Age))
check("C20 jcomplete(d, off) deactivates by name",
      has(grab(jcomplete(d, off)), "jcomplete deactivated for d.") &&
      isFALSE(cs_of("d")$active))
check("C21 jcomplete(d, on) reactivates by name",
      has(grab(jcomplete(d, on)), "jcomplete reactivated for d: Age") &&
      isTRUE(cs_of("d")$active))
check("C22 jcomplete(d, NULL) clears that frame only, reporting what it had",
      has(grab(jcomplete(d, NULL)), "jcomplete cleared for d (had: Age).") &&
      is.null(cs_of("d")))
check("C23 ... again: nothing to clear",
      has(grab(jcomplete(d, NULL)),
          "No jcomplete filter set for d. Nothing to clear."))
check("C24 jcomplete(d, off) / (d, on) with none set; on names the named-frame set form",
      has(grab(jcomplete(d, off)), "No jcomplete filter set for d.") &&
      has(flat(grab(jcomplete(d, on))),
          "No jcomplete filter set for d. Use jcomplete(d, var1, var2, ...) to set one."))
quiet(jcomplete(d, Age)); quiet(jcomplete(e, Age))
quiet(jcomplete(e, NULL))
check("C25 two frames: NULL on e leaves d's entry",
      is.null(cs_of("e")) && identical(unname(cs_of("d")$vars), "Age"))
quiet(juse(d))
check("C26 leading-comma jcomplete(, off) / (, on) reach the default frame",
      has(grab(jcomplete(, off)), "jcomplete deactivated for d.") &&
      has(grab(jcomplete(, on)), "jcomplete reactivated for d: Age"))
check("C27 leading-comma jcomplete(, NULL) clears the default frame",
      has(grab(jcomplete(, NULL)), "jcomplete cleared for d (had: Age).") &&
      is.null(cs_of("d")))
quiet(jcomplete(d, Age)); quiet(jcomplete(e, Age))
.c28 <- grab(jcomplete(clear.all = TRUE))
check("C28 jcomplete(clear.all = TRUE) clears every frame",
      has(.c28, "jcomplete cleared (2 data frames):") &&
      is.null(cs_of("d")) && is.null(cs_of("e")))
check("C29 clear.all with nothing set; beside variables refused; must be TRUE or FALSE",
      has(grab(jcomplete(clear.all = TRUE)), "No jcomplete settings to clear.") &&
      has(flat(grab(jcomplete(d, Age, clear.all = TRUE))),
          "`clear.all` cannot be combined with variables") &&
      has(grab(jcomplete(clear.all = "yes")), "`clear.all` must be TRUE or FALSE."))
quiet(jcomplete(d, Age)); quiet(jcomplete(e, Age))      # default is still d
.c30 <- grab(jcomplete(NULL))
check("C30 bare jcomplete(NULL) clears the DEFAULT frame only (flipped S294)",
      has(.c30, "jcomplete cleared for d (had: Age).") &&
      is.null(cs_of("d")) && identical(unname(cs_of("e")$vars), "Age"))
quiet(juse(NULL))
check("C31 no default, one frame carries a setting: that frame is cleared",
      has(grab(jcomplete(NULL)), "jcomplete cleared for e (had: Age).") &&
      is.null(cs_of("e")))
check("C32 no default, nothing set: nothing to clear (bare and leading-comma)",
      has(grab(jcomplete(NULL)), "No jcomplete settings to clear.") &&
      has(grab(jcomplete(, NULL)), "No jcomplete settings to clear."))
quiet(jcomplete(d, Age)); quiet(jcomplete(e, Age))
.c33 <- flat(grab(jcomplete(NULL)))
check("C33 no default, two frames: STOP naming both frames and both exits; nothing cleared",
      has(.c33, "jcomplete(): more than one data frame carries a jcomplete setting: d, e.") &&
      has(.c33, "e.g. jcomplete(d, NULL), or clear them all with jcomplete(clear.all = TRUE).") &&
      !is.null(cs_of("d")) && !is.null(cs_of("e")))
check("C34 a variable named off listed WITH others is a variable, not the command",
      has(flat(grab(jcomplete(d, off, Age))),
          "jcomplete(): off was not found in the d data frame."))
reset()

# =============================================================================
# D -- APPLY TIME (.jst_apply_mask): per-call and stored
# =============================================================================

reset()
.d01 <- grab(jdesc(d, Age, subset = Keep01))
check("D01 per-call bare name: the variable-name message in the subset = shape",
      startsWith(flat(.d01), "jdesc(): subset = Keep01 on its own is a variable name, which does not select rows in R."))
check("D02 ... with the two-equals fix line and the corrected subset =",
      has(.d01, "Use == (two equals signs) to compare it to a value:\n  subset = Keep01 == 1"))
check("D03 per-call bare name on a haven-labelled column: same message, jfreq prefix",
      has(grab(jfreq(d, Condition, subset = Condition)),
          "\n  subset = Condition == 1"))
.d04 <- grab(jdesc(d, Age, subset = TRUE))
check("D04 per-call single value: the generic prose fix",
      has(flat(.d04), "subset = TRUE is a single value, not one TRUE") &&
      has(flat(.d04), "In your jdesc() call, compare a variable to a value, for example subset = Age < 40."))
check("D05 per-call text",
      has(grab(jdesc(d, Age, subset = "null")), "subset = \"null\" is text"))
check("D06 per-call evaluation failure: unchanged text, now prefixed",
      startsWith(grab(jdesc(d, Age, subset = nonexistent_obj > 3)),
                 "jdesc(): Subset expression could not be evaluated: "))

# A stored filter that goes stale: accepted at 12 rows, applied at 11.
# Re-built S357 (ruling R19): a workspace vector of one value per case is
# refused when it is set, so the filter reads a frame variable and a
# workspace VALUE -- keep12, one TRUE -- which later becomes 12 values for
# the 11 rows left. The shape stops these checks hold are unchanged.
s <- d
keep12 <- TRUE
quiet(jsubset(s, Age > 35 & keep12))
check("D07 the stale-to-be filter applies cleanly while the counts match",
      row_of(plines(jdesc(s, Age)), "jsubset()"))
s <- s[-1, ]
keep12 <- rep(TRUE, 12)
.d08 <- grab(jdesc(s, Age))
check("D08 stored, gone stale: names the frame, the filter, the object and the counts, in cases (S359; it said 'has 12 values for 11 rows')",
      has(flat(.d08), paste0("jdesc(): the jsubset filter for the s data frame, Age > 35 & keep12, cannot be applied: ",
                             "keep12 is not in the s data frame; it is a separate object in your workspace, with 12 values for 11 cases.")))
check("D09 ... and BOTH exits, off first",
      has(.d08, "11 cases.\nTo set it aside, run:\n  jsubset(s, off)\nTo delete it, run:\n  jsubset(s, NULL)"))
check("D09b a stale count with no object to name: the plain stored form, the requirement in cases, both exits (S359)",
      { ds <- d
        quiet(jsubset(ds, rep(Age > 35, length.out = 12))); ds <- ds[-1, ]
        m <- grab(jdesc(ds, Age)); quiet(jsubset(ds, NULL)); rm(ds)
        has(flat(m), "jdesc(): the jsubset filter for the ds data frame, rep(Age > 35, length.out = 12), has 12 values for 11 cases.") &&
          has(m, "11 cases.\nA filter must give one TRUE or FALSE for every case.\nTo set it aside, run:\n  jsubset(ds, off)") })
check("D10 ... and it is an ERROR despite on_error = \"warn\" (always stops)",
      errs(jdesc(s, Age)))
check("D11 ... the same on another analysis function",
      has(grab(jfreq(s, Condition)), "jfreq(): the jsubset filter for the s data frame"))
quiet(jsubset(s, off))
check("D12 the named exit works: analysis runs with the inactive note",
      !errs(jdesc(s, Age)))
# (Until S331 the filter was turned back on here, stale as it is; on refuses
# that now -- section N -- and the next line deletes the filter anyway.)
# A stored filter that stays well-shaped at set time but changes KIND later:
# the workspace value flag picks what the condition gives, so the dry run
# passes (11 logicals for 11 rows) and a later flag does not. (Until S357
# the parenthesized vector (keep12) did this; R19 refuses it when set.)
quiet(jsubset(s, NULL)); flag <- TRUE
quiet(jsubset(s, if (flag) Age > 35 else FALSE))
flag <- FALSE
check("D13 stored filter that became a single value: stored wording",
      has(flat(grab(jdesc(s, Age))),
          "the jsubset filter for the s data frame, if (flag) Age > 35 else FALSE, is a single value (FALSE). A filter must give"))
quiet(jsubset(s, NULL)); flag <- TRUE
quiet(jsubset(s, if (flag) Age > 35 else Age))
flag <- FALSE
check("D14 stored filter that became numeric: stored wording",
      has(flat(grab(jdesc(s, Age))), "if (flag) Age > 35 else Age, is numeric. A filter must give"))
rm(flag, keep12)
.d16 <- grab(jdesc(s, Age))
check("D16 stored evaluation failure: an ERROR since S330 (it warned and ran every row), naming the frame, the filter and what is gone",
      has(flat(.d16), "jdesc(): the jsubset filter for the s data frame, if (flag) Age > 35 else Age, cannot be applied: flag no longer exists.") &&
      !has(.d16, "could not be evaluated") &&
      errs(jdesc(s, Age)))
check("D17 ... with BOTH exits, off first, as the shape error has them",
      has(.d16, "no longer exists.\nTo set it aside, run:\n  jsubset(s, off)\nTo delete it, run:\n  jsubset(s, NULL)"))
check("D18 .jst_apply_mask's arguments: on_error and stage_label are gone (both origins stop), n_frame added",
      identical(names(formals(jstats:::.jst_apply_mask)),
                c("data", "expr", "envir", "origin", "expr_str",
                  "data_name", "n_frame")))
reset()

# =============================================================================
# E -- A GOOD FILTER IS UNCHANGED, AND THE MESSAGES FIT THE WIDTH
# =============================================================================

reset()
quiet(jsubset(d, Age < 40))
.e01 <- plines(jdesc(d, Age))
check("E01 a good stored filter: 7 excluded (six over 40 plus the NA), 5 kept; the row says '(1 missing)' (S312)",
      any(grepl("^ +jsubset\\(\\) +7 +5 +Age < 40 \\(1 missing\\)$", .e01)))
quiet(jsubset(d, NULL))
.e02 <- plines(jdesc(d, Age, subset = Keep01 == 1))
check("E02 a good per-call filter: 6 kept, Age runs 30 to 62",
      any(grepl("^ +subset = +6 +6 +Keep01 == 1$", .e02)) &&
      any(grepl("^Age +6 +6 +30 +62 ", .e02)))
check("E03 the widest new message wraps inside the 76 pin (stored form)",
      { s2 <- d; k <- TRUE; quiet(jsubset(s2, Age > 35 & k)); s2 <- s2[-1, ]
        k <- rep(TRUE, 12)   # a value when set (R19, S357), 12 values now
        w <- widest(grab(jdesc(s2, Age))); quiet(jsubset(s2, NULL)); w <= 76L })
check("E04 the widest set-time message wraps inside the pin too",
      widest(grab(jsubset(d, (Gender = 1) & grepl("^A", Name, ignore.case = TRUE)))) <= 76L)
reset()

# =============================================================================
# F -- PER-CALL subset = GETS THE SAME SYNTAX CHECK (S290)
# =============================================================================
# .jst_apply_pipeline() now calls .jst_check_filter_syntax(origin = "call")
# before .jst_apply_mask(). One call site, so one function stands in for
# the thirteen entries; jplot is asserted once because it is the eleventh
# function and was not in the item's count of ten.

reset()
.f01 <- grab(jdesc(d, Age, subset = NOT(Age < 40)))
check("F01 subset = NOT(...): the keyword error, prefixed by the analysis function",
      has(flat(.f01), "jdesc(): subset = NOT(Age < 40) uses NOT, which R does not recognize."))
check("F02 ... with the fix in the subset = form, not jsubset(...)",
      has(.f01, "\n  subset = !(Age < 40)") && !has(.f01, "jsubset("))
.f03 <- grab(jdesc(d, Age, subset = (Gender = 1) & (Age < 40)))
check("F03 subset = (Gender = 1) & ...: the single-= error (used to RUN silently)",
      has(flat(.f03), "subset = (Gender = 1) & (Age < 40) uses a single ="))
check("F04 ... corrected in the subset = form",
      has(.f03, "\n  subset = (Gender == 1) & (Age < 40)"))
check("F05 the silent-wrong result is gone: no analysis output escaped",
      errs(jdesc(d, Age, subset = (Gender = 1) & (Age < 40))))
check("F06 subset = Gender (bare numeric): the bare-name message, not the generic lead",
      { .f <- grab(jdesc(d, Age, subset = Gender))
        has(.f, "\n  subset = Gender == 1") && !has(.f, "is numeric") })
.f07 <- plines(jdesc(d, Age, subset = Under40))
check("F07 subset = Under40 (bare logical): accepted, 5 kept, the NA case noted on the row (S312)",
      any(grepl("^ +subset = +7 +5 +Under40 \\(1 missing\\)$", .f07)))
.f08 <- plines(jdesc(d, Age, subset = xor(Age < 40, Gender == 1)))
check("F08 subset = xor(...): accepted per call too",
      any(grepl("^ +subset = ", .f08)))
check("F09 a named argument inside a per-call filter does not false-fire",
      !errs(jdesc(d, Age, subset = grepl("^A", Name, ignore.case = TRUE))))
check("F10 jplot (the eleventh function) routes through the same check",
      has(flat(grab(jplot(d, Age, subset = NOT(Age < 40)))),
          "jplot(): subset = NOT(Age < 40) uses NOT"))
check("F11 the widest per-call message wraps inside the pin",
      widest(grab(jdesc(d, Age, subset = (Gender = 1) & grepl("^A", Name, ignore.case = TRUE)))) <= 76L)
reset()

# =============================================================================
# G -- A NAMED ITEM IN A VARIABLE LIST (.jst_check_named_variables, S290)
# =============================================================================
# A top-level single = is turned into a NAMED argument by R's parser before
# jstats runs. The detector reads the name: a column of the frame is a
# condition typed in the wrong place; anything else is a misspelled input.
# Wired at all fifteen enquos() sites and in jsubset() (which gained ...).

reset()
.g01 <- grab(jsubset(Gender = 1))
check("G01 jsubset(Gender = 1): caught by jstats (R used to say 'unused argument')",
      has(flat(.g01), "jsubset(): Gender = 1 uses a single =, which does not test equality in R."))
check("G02 ... with the jsubset(...) fix form",
      has(.g01, "\n  jsubset(Gender == 1)"))
check("G03 jsubset(d, Gender = 1): the frame form is caught the same way, and its fix line keeps the frame (S338)",
      has(grab(jsubset(d, Gender = 1)), "\n  jsubset(d, Gender == 1)"))
check("G04 jsubset's own grammar is intact: jsubset(d, Age < 40) still activates",
      has(grab(jsubset(d, Age < 40)), "jsubset activated for d"))
quiet(jsubset(d, NULL))

.g05 <- grab(jdesc(d, Age, Gender = 1))
check("G05 jdesc(d, Age, Gender = 1): the variable-list message (was 'not found: 1')",
      has(flat(.g05), "jdesc(): Gender = 1 uses a single =, and the variable list takes names, not conditions.") &&
      !has(.g05, "not found"))
check("G06 ... pointing at subset = because jdesc has one",
      has(.g05, "in subset =:\n  subset = Gender == 1"))
check("G07 a text value is echoed as typed",
      has(grab(jfreq(d, Gender = "a")), "  subset = Gender == \"a\""))
check("G08 a name that is NOT a column: the unused-input message, not the = one",
      { .g <- grab(jdesc(d, Age, digit = 2))
        has(.g, "jdesc(): unused input: digit") && !has(.g, "single =") })
check("G09 jsum (no subset input): the list-the-variable form",
      has(grab(jsum(d, Gender = 1)), "List the variable on its own:\n  Gender"))
check("G10 ... and never points at subset =",
      !has(grab(jsum(d, Gender = 1)), "subset ="))

# One check per remaining site. Each call is the simplest form that reaches
# the enquos() line; the assertion is the S290 wording, so a site whose
# detector call is missing reds here with the old 'not found' text (or, for
# jplot / jconvert, whatever else the value-as-name lookup produced).
.sites <- list(
  jfreq            = quote(jfreq(d, Gender = 1)),
  jscreen          = quote(jscreen(d, Gender = 1)),
  jcorr            = quote(jcorr(d, Age, Gender = 1)),
  jalpha           = quote(jalpha(d, Age, Gender = 1)),
  jplot            = quote(jplot(d, Age, Gender = 1)),
  javg             = quote(javg(d, Gender = 1)),
  jcomplete        = quote(jcomplete(d, Gender = 1)),
  jdummy           = quote(jdummy(d, Gender = 1)),
  jnumeric         = quote(jnumeric(d, Gender = 1)),
  jcount           = quote(jcount(d, Gender = 1)),
  jlikert          = quote(jlikert(d, Gender = 1)),
  jdeclare_missing = quote(jdeclare_missing(d, Gender = 1, codes = -99)),
  jconvert         = quote(jconvert(d, to = "stata", Gender = 1))
)
.with_subset <- c("jfreq", "jscreen", "jcorr", "jalpha", "jplot")
for (.nm in names(.sites)) {
  .txt <- grab(eval(.sites[[.nm]]))
  .fix <- if (.nm %in% .with_subset) "\n  subset = Gender == 1" else "\n  Gender"
  check(paste0("G11 ", format(.nm, width = 16), " named item caught; fix form ",
               if (.nm %in% .with_subset) "subset =" else "bare name"),
        has(.txt, paste0(.nm, "(): Gender = 1 uses a single =")) && has(.txt, .fix))
}
check("G12 an UNNAMED variable list is untouched: jdesc(d, Age, Gender) runs",
      !errs(jdesc(d, Age, Gender)))
reset()

# =============================================================================
# H -- STORED SETTINGS REACH jplot's FORMULA PATH (S296)
# =============================================================================
# .jst_jplot_formula() recovers the frame's name from the captured call, and
# that name keys the stored-setting lookups (.jst_get_filter, .jst_get_complete,
# .jst_get_dummy) as well as every message. Until S296 it took the SECOND
# unnamed element of the call, which no formula call has -- match.call() binds
# the formula to `x` -- so the name stayed NULL: jplot(y ~ x, d) plotted the
# unfiltered frame under an active jsubset()/jcomplete() and printed a false
# "(jsubset not active for this dataset)" note, while jplot(d, y) honoured
# them. A jplot that drops NA rows from the PLOTTED variables itself cannot
# show a jcomplete on one of them, so H04 sets the filter on a column the plot
# does not use. Own frame h (d plus a numeric Score, for a numeric DV that is
# not Age); nothing here touches d.
# pval(): the plot object with its printed title swallowed (the one-line-per-
# check contract). No harness helper returns a VALUE -- grab() and plines()
# return text, quiet() returns nothing -- so this one is local to H.

pval <- function(expr) {
  invisible(utils::capture.output(.v <- suppressWarnings(suppressMessages(expr))))
  .v
}

reset()
h <- d
h$Score <- c(11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22)
quiet(jsubset(h, Age < 40))
.h01 <- plines(.p <- jplot(Age ~ Gender, h))
check("H01 stored jsubset reaches the formula path: 5 of 12 rows plotted",
      identical(nrow(.p$data), 5L))
check("H02 ... and the false 'jsubset not active for this dataset' note is gone",
      !any(grepl("not active for this dataset", .h01, fixed = TRUE)))
check("H03 control: the default path plots the same 5 rows",
      identical(nrow(pval(jplot(h, Age))$data), 5L))
quiet(jsubset(h, NULL))
quiet(jcomplete(h, Age))
check("H04 stored jcomplete on a column the plot does not use: 11 of 12 rows",
      identical(nrow(pval(jplot(Score ~ Gender, h))$data), 11L))
quiet(jcomplete(h, NULL))
check("H05 a formula-path message names the frame",
      has(grab(jplot(Age ~ Nope, h)), "jplot(): Nope was not found in the h data frame."))
check("H06 ... identically to the default path's message",
      identical(grab(jplot(Age ~ Nope, h)), grab(jplot(h, Nope))))
quiet(jsubset(h, Age < 40))
quiet(juse(h))
check("H07 control: the juse() default branch still honours the filter (5 rows)",
      identical(nrow(pval(jplot(Age ~ Gender))$data), 5L))
quiet(juse(NULL)); quiet(jsubset(h, NULL))
h0 <- h[0L, , drop = FALSE]
check("H08 the S295 zero-row guard names the frame on the formula path too",
      has(grab(jplot(Age ~ Gender, h0)), "jplot(): the h0 data frame has no rows"))
reset()

# H09-H14 (S300): the frame given as data = . `data` is not a formal of
# jplot.default, so data = h arrives in the NAMED dots, which the formula
# path read nothing from until S300: with no default the call stopped with a
# false "No data frame specified", and with a default set the DEFAULT frame
# was plotted in place of h, silently. Score ~ Gender throughout H09-H10,
# because Score has no NA -- the 12 rows are all plotted -- and h5 (5 rows)
# is the default, so a plot of the wrong frame shows as 5, not 12.
h5 <- h[1:5, , drop = FALSE]
check("H09 data = with no juse() default plots the named frame (12 rows)",
      identical(nrow(pval(jplot(Score ~ Gender, data = h))$data), 12L))
quiet(juse(h5))
check("H10 data = with a juse() default plots the NAMED frame, not the default",
      identical(nrow(pval(jplot(Score ~ Gender, data = h))$data), 12L))
quiet(juse(NULL))
quiet(jsubset(h, Age < 40))
check("H11 stored jsubset reaches the data = form: 5 of 12 rows plotted",
      identical(nrow(pval(jplot(Age ~ Gender, data = h))$data), 5L))
quiet(jsubset(h, NULL))
check("H12 a data = message names the frame, identically to the positional form",
      identical(grab(jplot(Age ~ Nope, data = h)), grab(jplot(Age ~ Nope, h))))
.both <- paste0("jplot(): data = e is a second data frame alongside h.\n",
                "Specify the data frame once, after the formula.")
check("H13 a frame given both ways stops, naming both as typed (Rule E break)",
      errs(jplot(Score ~ Gender, h, data = e)) &&
      has(grab(jplot(Score ~ Gender, h, data = e)), .both))
check("H14 ... in either order, and ahead of the extra-positional stop",
      has(grab(jplot(Score ~ Gender, data = e, h)), .both) &&
      has(grab(jplot(Score ~ Gender, h, d, data = e)), .both))
reset()

# H15-H29 (S307): the frame given as data = on the VARIABLE-LIST form, and
# the two siblings the same rewrite of the jplot() GENERIC fixed. The generic
# reaches jplot.default by a fallback whenever its first argument is a bare
# column name; until S307 that fallback re-issued match.call(), so (i)
# jplot(data = h, Score) bound Score to `x` and left data = h in the named
# dots -- a false "'Score' not found" with no default, "unused input(s):
# data" with one; (ii) jplot(Gender, Condition) under a default bound the
# second variable to the generic's `which` formal -- "unused input(s):
# which"; and (iii) the rebuilt call named jplot.default and was evaluated in
# the CALLER's frame, where a registered-not-exported method is invisible
# under library(jstats) -- "could not find function", on the very call the
# resolver's own message recommends. The rewrite rebuilds the call as typed
# (x and a positional which unnamed, data = moved to the front) and
# evaluates it in a child frame that carries the method itself. Score has
# no NA (12 rows plotted); h5 is the 5-row default, as in H09-H14.
.both_vl <- paste0("jplot(): data = e is a second data frame alongside h.\n",
                   "Specify the data frame once, before the variable names.")
check("H15 data = with no juse() default plots the named frame (12 rows)",
      identical(nrow(pval(jplot(data = h, Score))$data), 12L))
check("H16 ... and with data = after the variable",
      identical(nrow(pval(jplot(Score, data = h))$data), 12L))
quiet(juse(h5))
check("H17 data = with a juse() default plots the NAMED frame, not the default",
      identical(nrow(pval(jplot(data = h, Score))$data), 12L))
quiet(juse(NULL))
check("H18 two variables with data =: a grouped bar chart (fill mapped), 12 rows",
      { .p <- pval(jplot(data = h, Gender, Condition,
                         categorical = c("Gender", "Condition")))
        identical(nrow(.p$data), 12L) && "fill" %in% names(.p$mapping) })
check("H19 an object sharing the column's name in the caller's frame: the COLUMN wins",
      identical(local({ Score <- 1:3
                        nrow(pval(jplot(data = h, Score))$data) }), 12L))
quiet(jsubset(h, Age < 40))
check("H20 stored jsubset reaches the data = variable-list form: 5 of 12 rows",
      identical(nrow(pval(jplot(data = h, Score))$data), 5L))
quiet(jsubset(h, NULL))
check("H21 a data = message names the frame, identically to the positional form",
      has(grab(jplot(data = h, Nope)), "jplot(): Nope was not found in the h data frame.") &&
      identical(grab(jplot(data = h, Nope)), grab(jplot(h, Nope))))
check("H22 a frame given both ways stops, naming both as typed (Rule E break)",
      errs(jplot(h, Score, data = e)) &&
      has(grab(jplot(h, Score, data = e)), .both_vl))
check("H23 ... in either order",
      has(grab(jplot(data = e, h, Score)), .both_vl) &&
      has(grab(jplot(h, data = e, Score)), .both_vl))
# (ii) the which-binding sibling.
quiet(juse(h))
check("H24 two variables under a default: the second is a variable, not `which`",
      !has(grab(jplot(Gender, Condition, categorical = c("Gender", "Condition"))),
           "unused input") &&
      { .p <- pval(jplot(Gender, Condition, categorical = c("Gender", "Condition")))
        identical(nrow(.p$data), 12L) && "fill" %in% names(.p$mapping) })
check("H25 control: a which = TYPED by name is still an unused input, not a variable",
      has(grab(jplot(Gender, which = "core")), "jplot(): unused input: which"))
# (iii) the method-resolution sibling. A DECOY jplot.default in the calling
# frame is what the old fallback found there -- the name, evaluated in the
# caller's frame -- so on the old master both calls die on the decoy; the
# rewrite carries the real method in a frame of its own, ahead of the caller.
check("H26 the fallback reaches the package's jplot.default, not one in the caller's frame",
      identical(local({ jplot.default <- function(...) stop("decoy reached")
                        nrow(pval(jplot(Score))$data) }), 12L))
check("H27 ... on the data = route too",
      identical(local({ jplot.default <- function(...) stop("decoy reached")
                        nrow(pval(jplot(data = h, Score))$data) }), 12L))
quiet(juse(NULL))
check("H28 control: the result-object form still dispatches (which = \"coef\")",
      !errs(jplot(pval(jlm(Score ~ Age, h)), which = "coef")))
.wrap <- function(...) jplot(...)
check("H29 a call forwarded through a wrapper's ... still reaches the variable-list form",
      identical(nrow(pval(.wrap(data = h, Score))$data), 12L))
# AUDIT-052's jplot sibling (S315): jplot reads its first argument ONCE. The
# generic forces it to choose a method and the resolver evaluated the
# expression again, so an argument that prints -- jplot(jconvert(...), Age)
# -- printed twice. .cnt_h() counts its own calls.
.n_eval <- 0L
.cnt_h  <- function() { .n_eval <<- .n_eval + 1L; h }
check("H30 jplot(<expression>, Score) evaluates the expression once",
      { .n_eval <- 0L; quiet(jplot(.cnt_h(), Score)); identical(.n_eval, 1L) })
check("H31 ... and once when it arrives as data =, which the generic rebuilds",
      { .n_eval <- 0L; quiet(jplot(data = .cnt_h(), Score))
        identical(.n_eval, 1L) })
reset()

# =============================================================================
# SECTION I -- THE VECTOR PATH CARRIES EVERY ARGUMENT (S315, AUDIT-008)
# =============================================================================
# jdesc() and jfreq() given a bare column wrap it in a one-column frame and
# call themselves again. The re-call passed only some arguments, so subset =
# was silently IGNORED -- statistics from the whole sample, no message -- and
# digits and case.processing.detail with it. Every argument now reaches the
# re-call, evaluated where the caller's own objects are visible. What a single
# column cannot serve -- more variables, by =, a condition naming another
# variable -- stops with the data-frame form, and that fix line is RUN, not
# read (S303). Fixture: d, whose Age has one NA (row 8).
reset()
# .fix_runs(): the message's LAST line must be an indented j...() call, and
# it must run -- so an absent message (no fix line at all) is a FAIL, not a
# vacuous pass.
.fix_runs <- function(msg) {
  ln <- strsplit(msg, "\n", fixed = TRUE)[[1]]
  length(ln) > 0L && grepl("^  j[a-z]+\\(", ln[length(ln)]) &&
    !errs(eval(parse(text = trimws(ln[length(ln)]))))
}
.age_line <- function(ln) grep("^Age ", ln, value = TRUE)
dv04 <- haven::labelled_spss(c(1:9, -99, -99, 5), labels = c(Refused = -99),
                             na_values = -99)
check("I01 jdesc(d$Age, subset = Age > 40) is the data-frame form, line for line",
      identical(plines(jdesc(d$Age, subset = Age > 40)),
                plines(jdesc(d, Age, subset = Age > 40))))
check("I02 ... and jfreq(d$Gender, subset = Gender == 1) likewise",
      identical(plines(jfreq(d$Gender, subset = Gender == 1)),
                plines(jfreq(d, Gender, subset = Gender == 1))))
check("I03 digits = reaches the re-call",
      identical(plines(jdesc(d$Age, digits = 0)), plines(jdesc(d, Age, digits = 0))))
check("I04 case.processing.detail = reaches it too: per_code brings the breakdown",
      any(startsWith(plines(jdesc(dv04, case.processing.detail = "per_code")),
                     "Missing data")) &&
        !any(startsWith(plines(jdesc(dv04)), "Missing data")))
.m05 <- grab(jdesc(d$Age, by = Gender))
check("I05 by = on a bare column stops, what was typed first, with the frame form",
      has(flat(.m05), paste0("jdesc(): by = Gender needs the data frame, not ",
                             "the single column d$Age.")) &&
        has(.m05, "\nName the data frame first:\n  jdesc(d, Age, by = Gender)"))
check("I06 ... and that fix line runs", .fix_runs(.m05))
.m07 <- grab(jdesc(d$Age, subset = Keep01 == 1))
check("I07 a condition naming another variable stops, naming it; the fix runs",
      has(flat(.m07), paste0("jdesc(): subset = Keep01 == 1 refers to Keep01, ",
                             "which the single column d$Age does not contain.")) &&
        has(.m07, "\nName the data frame first:\n  jdesc(d, Age, subset = Keep01 == 1)") &&
        .fix_runs(.m07))
.m08 <- grab(jfreq(d$Gender, subset = Keep01 == 1))
check("I08 ... on jfreq too",
      has(flat(.m08), paste0("jfreq(): subset = Keep01 == 1 refers to Keep01, ",
                             "which the single column d$Gender does not contain.")) &&
        has(.m08, "\n  jfreq(d, Gender, subset = Keep01 == 1)") && .fix_runs(.m08))
.m09 <- grab(jdesc(d$Age, Keep01))
check("I09 a second variable stops with the frame form, which runs",
      has(flat(.m09), "jdesc(): Keep01 needs the data frame, not the single column d$Age.") &&
        has(.m09, "\nName the data frame first:\n  jdesc(d, Age, Keep01)") &&
        .fix_runs(.m09))
# Both forms inside a function, so the CPS row prints the same typed text
# (Age > k) on each side.
.f10 <- function(k) plines(jdesc(d$Age, subset = Age > k))
.g10 <- function(k) plines(jdesc(d, Age, subset = Age > k))
check("I10 a condition may use an object in the caller's own frame",
      identical(.f10(40), .g10(40)))
# I11 FLIPPED at S323: a column reached through its frame (d$Keep01) was
# served from S315; the re-call read it from the user's raw frame, past its
# declared missing values, so it is refused now, as the data-frame form's
# subset = refuses it (section L), with that form as the fix. I11b keeps the
# S315 exemption's other half: the name after $ on an object that is NOT a
# data frame (a list of settings) is not a variable, and is served.
.m11 <- grab(jdesc(d$Age, subset = d$Keep01 == 1))
check("I11 ... but a column reached through its frame (d$Keep01) is refused (S323), with the data-frame form, which runs",
      has(.m11, paste0("jdesc(): subset = d$Keep01 == 1 names the d data frame.\n",
                       "Name the data frame first:\n",
                       "  jdesc(d, Age, subset = Keep01 == 1)")) &&
        .fix_runs(.m11))
lim_i <- list(age = 40)
check("I11b ... while a list element (lim_i$age) is a value, not a variable, and is served",
      identical(.age_line(plines(jdesc(d$Age, subset = Age < lim_i$age))),
                .age_line(plines(jdesc(d, Age, subset = Age < 40)))))
rm(lim_i)
.m12 <- grab(jdesc(d$Age, Age = 40))
check("I12 a named item is the single-= typo, fixed toward subset =",
      has(flat(.m12), "jdesc(): Age = 40 uses a single =") &&
        has(.m12, "\n  subset = Age == 40"))
check("I13 control: a bare column alone is the data-frame form, line for line",
      identical(plines(jdesc(d$Age)), plines(jdesc(d, Age))))
check("I14 no output or message names the internal frame",
      !any(grepl("temp_df", c(plines(jdesc(d$Age, subset = Age > 100)),
                              grab(jdesc(d$Age, subset = Age > 100)),
                              .m05, .m07, .m08, .m09, .m11, .m12), fixed = TRUE)))
reset()

# -- S324: a column is analyzed in its frame; jscreen joins; the data-first
# functions refuse a column truthfully; a misspelled column is not found ----
# (A) jscreen() takes a single column as jdesc() and jfreq() do. A column of
# a data frame (d$Age, d[["Age"]]) is re-called IN that frame, so its stored
# jsubset() / jcomplete() settings and its registrations apply -- before
# S324 the re-call ran on a one-column copy under an internal name, and a
# stored filter was skipped behind "(jsubset not active for this dataset)".
# A plain vector is still wrapped. (B) A function that does not take a single
# column said "'d$Age' not found" for one; it is found, and not a data frame,
# and the fix is the user's own call rebuilt with the frame first. (Rider) A
# misspelled column was "exists but contains nothing (it is NULL)"; it is
# the not-found message, and d$Ag is no longer partial-matched to Age.
.scr_same <- function(a, b) identical(plines(a), plines(b))
# .safe_lines(): plines() for a statement OUTSIDE check(), giving the error
# text instead of halting, so an old master fails inside the verdict.
.safe_lines <- function(expr) {
  tryCatch(plines(expr), error = function(e) paste0("[error] ", conditionMessage(e)))
}
check("I15 jscreen(d$Age) is jscreen(d, Age), line for line",
      .scr_same(jscreen(d$Age), jscreen(d, Age)))
check("I16 ... and with subset = Age > 40, the data-frame form likewise",
      .scr_same(jscreen(d$Age, subset = Age > 40),
                jscreen(d, Age, subset = Age > 40)))
check("I17 a plain vector is screened on its own: three cases, one missing",
      { ln <- plines(jscreen(c(30, 45, NA)))
        "  Cases: 3" %in% ln && "  Cases with missing data: 1" %in% ln })
quiet(jsubset(d, Keep01 == 1))
.p18 <- list(.safe_lines(jdesc(d$Age)), .safe_lines(jfreq(d$Gender)),
             .safe_lines(jscreen(d$Age)))
check("I18 a stored jsubset() on d reaches jdesc(d$Age), jfreq(d$Gender) and jscreen(d$Age): each is the data-frame form, and nothing says it is not active",
      identical(.p18[[1]], plines(jdesc(d, Age))) &&
        identical(.p18[[2]], plines(jfreq(d, Gender))) &&
        identical(.p18[[3]], plines(jscreen(d, Age))) &&
        any(row_of(.p18[[1]], "jsubset()")) &&
        !any(grepl("not active", unlist(.p18), fixed = TRUE)))
check("I19 d[[\"Age\"]] is d$Age: the data-frame form under the same filter",
      identical(plines(jdesc(d[["Age"]])), plines(jdesc(d, Age))))
reset()
quiet(jcomplete(d, Under40))
check("I20 a stored jcomplete() on d reaches the single column too",
      { ln <- plines(jfreq(d$Gender))
        identical(ln, plines(jfreq(d, Gender))) && any(row_of(ln, "jcomplete()")) })
reset()
quiet(jnumeric(d, Gender))
check("I21 a registration on d reaches it: jscreen(d$Gender) shows Gender user-declared Numeric, as jscreen(d, Gender) does",
      { ln <- plines(jscreen(d$Gender))
        identical(ln, plines(jscreen(d, Gender))) &&
          any(grepl("^Gender +Numeric +User-declared", ln)) })
quiet(jnumeric(d, NULL))
.m22a <- grab(jscreen(d$Age, Keep01))
.m22b <- grab(jscreen(d$Age, subset = Keep01 == 1))
check("I22 jscreen() on a single column refuses a second variable, and a condition naming another, each with the frame form, which runs",
      has(flat(.m22a), "jscreen(): Keep01 needs the data frame, not the single column d$Age.") &&
        has(.m22a, "\nName the data frame first:\n  jscreen(d, Age, Keep01)") &&
        .fix_runs(.m22a) &&
        has(flat(.m22b), paste0("jscreen(): subset = Keep01 == 1 refers to Keep01, ",
                                "which the single column d$Age does not contain.")) &&
        .fix_runs(.m22b))
.m23 <- c(grab(jdesc(d$Agee)), grab(jfreq(d$Gendr)), grab(jscreen(d$Agee)))
check("I23 a misspelled column is not found, in the frame named: jdesc(), jfreq() and jscreen()",
      has(.m23[1], "jdesc(): Agee was not found in the d data frame.\n") &&
        has(.m23[2], "jfreq(): Gendr was not found in the d data frame.\n") &&
        has(.m23[3], "jscreen(): Agee was not found in the d data frame.\n") &&
        !any(grepl("contains nothing", .m23, fixed = TRUE)))
check("I24 ... and d$Ag is not partial-matched to Age, on jdesc() or on jcorr()",
      has(grab(jdesc(d$Ag)), "jdesc(): Ag was not found in the d data frame.") &&
        has(grab(jcorr(d$Ag, d$Keep01)), "jcorr(): Ag was not found in the d data frame."))
.m25 <- grab(jcorr(d$Age, d$Keep01))
check("I25 jcorr(d$Age, d$Keep01): a single variable, not a data frame, with the frame form, which runs",
      identical(.m25, paste0("jcorr(): d$Age is a single variable, not a data frame.\n",
                             "Name the data frame first:\n",
                             "  jcorr(d, Age, Keep01)")) &&
        .fix_runs(.m25))
check("I26 ... the same under a juse() default (it said Variable(s) not found in d: d$Age, d$Keep01)",
      { quiet(juse(d)); m <- grab(jcorr(d$Age, d$Keep01)); quiet(juse(NULL))
        identical(m, .m25) })
check("I27 a named argument keeps its name, and a variable typed on its own stays as typed",
      { m <- grab(jcorr(d$Age, Keep01, method = "spearman"))
        has(m, "\n  jcorr(d, Age, Keep01, method = \"spearman\")") && .fix_runs(m) })
check("I28 on a function that takes one variable the variable takes its slot: jrecode(d$Age, \"30=31; else=copy\")",
      { m <- grab(jrecode(d$Age, "30=31; else=copy"))
        has(m, "jrecode(): d$Age is a single variable, not a data frame.") &&
          has(m, "\n  jrecode(d, Age, \"30=31; else=copy\")") && .fix_runs(m) })
check("I29 another frame's column, or a summary of the frame, gives the sentence without a call",
      { a <- grab(jcorr(d$Age, e$Keep01)); b <- grab(jcorr(d$Age, mean(d$Age)))
        tail_ok <- function(m) has(m, paste0("not a data frame.\nName the data frame ",
                                             "first, and each variable on its own.")) &&
          !has(m, "  jcorr(")
        tail_ok(a) && tail_ok(b) })
check("I30 a format name given positionally is named to = in the rebuilt call; named, the call stays (S354: to behind the dots)",
      { a <- grab(jconvert(d$Age, "stata")); b <- grab(jconvert(d$Age, to = "stata"))
        has(a, "\n  jconvert(d, Age, to = \"stata\")") && .fix_runs(a) &&
          has(b, "\n  jconvert(d, Age, to = \"stata\")") && .fix_runs(b) })
check("I31 d[[\"Age\"]] reads as Age from d in the rebuilt call",
      has(grab(jcorr(d[["Age"]], d[["Keep01"]])),
          "d[[\"Age\"]] is a single variable, not a data frame.\nName the data frame first:\n  jcorr(d, Age, Keep01)"))
check("I32 a misspelled column on a data-frame function is the not-found message",
      { m <- grab(jcorr(d$Agee, d$Keep01))
        has(m, "jcorr(): Agee was not found in the d data frame.") && !has(m, "contains nothing") })
check("I33 jplot(d$Age), through the generic: the frame form, which plots",
      { m  <- grab(jplot(d$Age))
        fx <- trimws(tail(strsplit(m, "\n", fixed = TRUE)[[1]], 1L))
        has(m, "jplot(): d$Age is a single variable, not a data frame.\nName the data frame first:\n  jplot(d, Age)") &&
          inherits(pval(eval(parse(text = fx))), "ggplot") })
check("I34 control: under a default a bare name is still a variable (the leading comma omitted)",
      { quiet(juse(d)); ok <- !errs(jcorr(Age, Keep01)); quiet(juse(NULL)); ok })
reset()

# =============================================================================
# SECTION J -- STORED SETTINGS REACH jscreen's VARIABLE LIST (S317)
# =============================================================================
# jscreen() cut its frame down to the named variables BEFORE the pipeline
# ran, so a stored setting on a column the call did not name had nothing to
# act on: jsubset() warned that its expression could not be evaluated,
# jcomplete() was skipped without a word, and every case was screened. The
# pipeline now gets the whole frame and the narrowing follows it. A per-call
# subset = had its variables ADDED to the screen to keep it evaluable; it
# needs no such help now, so only the named variables are screened (Jeff's
# call, S317). Fixture: d. Keep01 is 1 on the six odd rows; Age is NA on row
# 8, a Keep01 == 0 row -- so Keep01 == 1 keeps 6 cases, jcomplete() on Age
# keeps 11, and the two with Keep01 == 0 keep 5.
reset()
# .scr(): the printed lines (ANSI stripped, as plines()) AND the variables
# of the invisible screening table. An error returns empty parts, so a
# broken build FAILS the check that reads them instead of halting the
# battery (the S307 contract).
.scr <- function(expr) {
  val <- NULL
  ln  <- tryCatch(suppressWarnings(suppressMessages(
                    utils::capture.output(val <- expr))),
                  error = function(e) character(0))
  list(lines = sub("[ \t]+$", "", gsub("\033\\[[0-9;]*[A-Za-z]", "", ln)),
       vars  = if (is.data.frame(val)) as.character(val$Variable) else NULL)
}
.cases <- function(s) {
  sub("^  Cases: ", "", grep("^  Cases: ", s$lines, value = TRUE))
}
quiet(jsubset(d, Keep01 == 1))
check("J01 a stored jsubset() on a column the call does not name applies: 6 cases",
      identical(.cases(.scr(jscreen(d, Age, Gender))), "6"))
check("J02 ... with no 'could not be evaluated' warning",
      !has(grab(jscreen(d, Age, Gender)), "could not be evaluated"))
check("J03 ... and only the named variables are screened, not the filter's column",
      identical(.scr(jscreen(d, Age, Gender))$vars, c("Age", "Gender")))
check("J04 control: the filter's column named as well -- 6 cases, three screened",
      { .s <- .scr(jscreen(d, Age, Gender, Keep01))
        identical(.cases(.s), "6") &&
          identical(.s$vars, c("Age", "Gender", "Keep01")) })
check("J05 control: nothing named -- every column screened, 6 cases",
      { .s <- .scr(jscreen(d))
        identical(.cases(.s), "6") && identical(.s$vars, names(d)) })
reset()
quiet(jcomplete(d, Age))
check("J06 a stored jcomplete() on a column the call does not name applies: 11 cases",
      identical(.cases(.scr(jscreen(d, Gender, Keep01))), "11"))
quiet(jsubset(d, Keep01 == 0))
check("J07 ... and with a stored jsubset() as well, both apply: 5 cases",
      identical(.cases(.scr(jscreen(d, Gender))), "5"))
reset()
quiet(juse(d)); quiet(jsubset(d, Keep01 == 1))
check("J08 under the juse() default, jscreen(Age, Gender) applies the filter: 6 cases",
      identical(.cases(.scr(jscreen(Age, Gender))), "6"))
reset()
.j09 <- function() .scr(jscreen(d, Age, Gender, subset = Keep01 == 1))
check("J09 a per-call subset = on a column the call does not name applies: 6 cases",
      identical(.cases(.j09()), "6"))
check("J10 ... and its column is no longer added to the screen: two variables",
      { .s <- .j09()
        identical(.s$vars, c("Age", "Gender")) && "  Variables: 2" %in% .s$lines })
reset()

# =============================================================================
# SECTION K -- A STORED jcomplete() WHOSE COLUMNS HAVE LEFT THE FRAME (S318;
#              a STOP since S330)
# =============================================================================
# Step 1 of .jst_apply_pipeline() kept the setting's names still in the frame
# and skipped the rest without a word: a column dropped or renamed after
# jcomplete() was set left the Case Processing row reading 0 (or counting the
# remaining variables only), and nothing said why. From S318 Step 1 warned,
# naming the frame and the absent columns, and applied the rest. Since S330
# (Jeff's ruling, with the stored jsubset() of section M) it STOPS, with the
# same two remedies: the warning repeated on every call and was scrolled
# past, while the analysis ran on cases the setting was meant to remove; a
# partly stale setting stops as well. Fixtures: k1-k3 are copies
# of d given a column Tmp (NA on row 1; k3 also Tmp2, NA on row 2), set, then
# dropped; k4 keeps its column. Age is NA on row 8, so jcomplete() on Age
# keeps 11 cases.
reset()
# .kw(): every message / warning / error text a call emits (grab()) and how
# many times the stop's lead appears in it.
.kw <- function(expr) {
  txt <- grab(expr)
  list(raw = txt,
       n   = lengths(regmatches(txt, gregexpr("the jcomplete setting for the",
                                              txt, fixed = TRUE))))
}
k1 <- d; k1$Tmp <- c(NA, 2:12)
k2 <- k1
k3 <- k1; k3$Tmp2 <- c(1, NA, 3:12)
k4 <- d
quiet(jcomplete(k1, Tmp)); quiet(jcomplete(k2, Age, Tmp))
quiet(jcomplete(k3, Tmp, Tmp2)); quiet(jcomplete(k4, Age))
k1$Tmp <- NULL; k2$Tmp <- NULL; k3$Tmp <- NULL; k3$Tmp2 <- NULL
.k1 <- .kw(jdesc(k1, Age))
check("K01 a stored jcomplete() whose only column has left the frame STOPS, naming both",
      has(flat(.k1$raw), paste0("jdesc(): the jcomplete setting for the k1 data ",
          "frame names Tmp, which the data frame no longer has.")) &&
        errs(jdesc(k1, Age)))
check("K02 ... one sentence per line, the clear command on its own line (Rules E, L)",
      has(.k1$raw, paste0("no longer has.\nRun jcomplete() again with the current ",
          "variable names, or clear the setting:\n  jcomplete(k1, NULL)")))
check("K03 ... nothing is said about cases 'removed', and no warning stands in for the stop",
      !has(.k1$raw, "no cases were removed") &&
        !has(.k1$raw, "The jcomplete setting") && errs(jscreen(k1, Age)))
.k2 <- .kw(jdesc(k2, Age))
check("K04 a partly stale setting names only the absent column, and stops as well",
      has(flat(.k2$raw), paste0("for the k2 data frame names Tmp, which the ",
                                "data frame no longer has.")) &&
        !has(.k2$raw, "names Age") && errs(jscreen(k2, Gender)))
.k3 <- .kw(jdesc(k3, Age))
check("K05 two absent columns are and-joined",
      has(flat(.k3$raw), paste0("names Tmp and Tmp2, which the data frame no ",
          "longer has.")))
.kfns <- list(
  function() jfreq(k1, Gender),
  function() jdesc(k1, Age, Keep01),
  function() jcorr(k1, Age, Keep01),
  function() jalpha(k1, Age, Keep01, Gender),
  function() jt(Age ~ Gender, k1),
  function() jaov(Age ~ Condition, k1),
  function() jcrosstab(Keep01 ~ Gender, k1),
  function() jlm(Age ~ Keep01, k1),
  function() jlogistic(Keep01 ~ Age, k1),
  function() jscreen(k1, Age),
  function() jplot(k1, Age),
  function() jplot(Age ~ Gender, k1)
)
.k06 <- vapply(.kfns, function(f) .kw(f())$n, integer(1))
check("K06 every pipeline entrant stops, with the message exactly once (12 functions, both jplot forms)",
      all(.k06 == 1L) && all(vapply(.kfns, function(f) errs(f()), logical(1))))
check("K07 control: a setting whose columns are all present says nothing",
      .kw(jdesc(k4, Gender))$n == 0L)
# K08 is on k3 since S331: a stale setting cannot be turned back on (section
# N), and K09 and K10 need k1's setting active.
quiet(jcomplete(k3, off))
check("K08 control: an inactive setting stays quiet, whatever its columns",
      .kw(jdesc(k3, Age))$n == 0L)
quiet(juse(k1))
.k09 <- .kw(jdesc(Age))
check("K09 under the juse() default the stop names the default frame, in both places",
      .k09$n == 1L &&
        has(flat(.k09$raw), "for the k1 data frame names Tmp") &&
        has(.k09$raw, "\n  jcomplete(k1, NULL)"))
quiet(juse(NULL))
# The remedy as PRINTED, not as expected: K10 runs whatever line follows
# "clear the setting:", so a wrong remedy fails here as well as in K02.
.kfix <- sub(".*clear the setting:\n  ([^\n]*).*", "\\1", .k1$raw)
check("K10 the printed remedy runs and ends the stop",
      { quiet(eval(parse(text = .kfix)))
        .kw(jdesc(k1, Age))$n == 0L && !errs(jdesc(k1, Age)) &&
          is.null(cs_of("k1")) })
reset()
rm(k1, k2, k3, k4, .kfns)

# =============================================================================
# SECTION L -- A DATA FRAME NAMED IN A CONDITION IS REFUSED (S323)
# =============================================================================
# The S322 subset-condition item. A condition is evaluated with the analysis
# copy as data and the caller's frame as enclosure, so subset = fl$Inc < 45
# read Inc from the user's RAW frame: a declared -99 is a number below 45
# there, and the case was KEPT, where subset = Inc < 45 sets it aside as
# missing. Refused since S323 at apply time (subset =) and at set time
# (jsubset), with the variables on their own as the fix; the vector path's
# form is I11. Fixture fl: d with Inc, an SPSS-style column declaring -99
# (rows 3 and 7). Inc < 45 on the masked copy keeps rows 1, 4, 6, 8, 10 and
# 11 and drops the two -99 cases as missing.
reset()
fl <- d
fl$Inc <- haven::labelled_spss(c(30, 50, -99, 40, 60, 35, -99, 44, 70, 20,
                                 41, 52),
                               labels = c(Refused = -99), na_values = -99)
look_l <- data.frame(cut = 45)
lim_l  <- list(inc = 45)
.l01 <- grab(jdesc(fl, Age, subset = fl$Inc < 45))
check("L01 subset = fl$Inc < 45 is refused at apply time, what was typed first, with the variable on its own",
      has(.l01, paste0("jdesc(): subset = fl$Inc < 45 names the fl data frame.\n",
                       "Name the variable on its own:\n",
                       "  subset = Inc < 45")))
.l02 <- plines(jdesc(fl, Age, subset = Inc < 45))
check("L02 ... and the condition it prints, run, excludes 6, keeps 6, and counts the two declared -99 cases as missing",
      any(grepl("^ +subset = +6 +6 +Inc < 45 \\(2 missing\\)$", .l02)))
check("L03 two references: each variable on its own",
      has(grab(jdesc(fl, Age, subset = fl$Inc < 45 & fl$Age > 20)),
          paste0("Name each variable on its own:\n",
                 "  subset = Inc < 45 & Age > 20")))
.l04 <- grab(jsubset(fl, fl$Inc < 45))
check("L04 jsubset() refuses it at set time, in the named-frame form, and stores nothing",
      has(.l04, paste0("jsubset(): fl$Inc < 45 names the fl data frame.\n",
                       "Name the variable on its own:\n",
                       "  jsubset(fl, Inc < 45)")) &&
        is.null(fs_of("fl")))
quiet(juse(fl))
check("L05 ... in the default-frame form under juse()",
      has(grab(jsubset(fl$Inc < 45)),
          "Name the variable on its own:\n  jsubset(Inc < 45)") &&
        is.null(fs_of("fl")))
quiet(juse(NULL))
quiet(jsubset(fl, Age > 20))
.l06 <- grab(jsubset(fl, fl$Inc < 45))
check("L06 an earlier filter for the frame is reported unchanged, and kept",
      has(.l06, "  jsubset(fl, Inc < 45)\nYour earlier filter for the fl data frame is unchanged.") &&
        identical(fs_of("fl")$expr_str, "Age > 20"))
reset()
# The fix as PRINTED: the indented line after "on its own:".
.lfix <- sub(".*on its own:\n  ([^\n]*).*", "\\1", .l04)
check("L07 the printed jsubset() fix runs and stores the bare condition",
      { quiet(eval(parse(text = .lfix)))
        identical(fs_of("fl")$expr_str, "Inc < 45") })
reset()
check("L08 a lookup table, and a summary of the frame, get the save-it-first form",
      has(flat(grab(jdesc(fl, Age, subset = Inc < look_l$cut))),
          paste0("subset = Inc < look_l$cut names the look_l data frame. ",
                 "Save what you need from the look_l data frame under a new ",
                 "name, and use that name in the condition.")) &&
        has(flat(grab(jdesc(fl, Age, subset = Inc < mean(fl$Inc)))),
            "Save what you need from the fl data frame under a new name"))
check("L09 a list of settings is not a data frame: subset = Inc < lim_l$inc runs as Inc < 45 does",
      identical(.age_line(plines(jdesc(fl, Age, subset = Inc < lim_l$inc))),
                .age_line(plines(jdesc(fl, Age, subset = Inc < 45)))))
check("L10 control: no frame named, nothing refused -- the stored and per-call bare forms both run",
      { quiet(jsubset(fl, Inc < 45))
        ok1 <- !errs(jdesc(fl, Age))
        reset()
        ok1 && !errs(jdesc(fl, Age, subset = Inc < 45)) })
reset()
rm(fl, look_l, lim_l)

# =============================================================================
# SECTION M -- A FILTER THAT CANNOT BE APPLIED STOPS, WHEN SET AND WHEN USED
#              (S330)
# =============================================================================
# Jeff's three S329 rulings, walking filter_walk.R D5, and the two S324
# partners. Until S330 jsubset()'s dry run swallowed an evaluation error and
# stored the filter (jsubset(d, Agee > 30) reported "activated"; B10 held it
# there), and a stored filter that could not be evaluated WARNED, kept every
# row and printed a Case Processing row reading "jsubset()  0" (D16, D17) --
# ordinary-looking output for the wrong sample, identically on every call.
# Now every failure stops, through one evaluator, .jst_filter_mask():
#   set time       a name found nowhere ("names Agee, which was not found in
#                  the mf data frame"); any other error of R's ("R
#                  reported:"); nothing is stored
#   analysis time  the stored form with both exits: "<name> no longer
#                  exists", or R's message
#   recycling      a workspace vector combined value by value that holds more
#                  than one value but not one per case (the S324 formula stop,
#                  on a condition): at set time, per call, and stored
#   frame first    jsubset(mf$Age > 40) with no juse() default: the S323
#                  refusal with the frame first, where Case 5 said "not found"
# Fixture mf: a copy of d. Every workspace object carries an m_ prefix, so
# that a name a check needs to be MISSING (Agee, m_cutof, m_code, m_isna) is
# one nothing else in a run_all.R session defines.
reset()
mf <- d

# ---- M01-M13: when set ------------------------------------------------------
.fm01 <- grab(jsubset(mf, Agee > 30))
check("M01 a misspelled variable is refused when set: what was typed, the name, the frame, then the fix",
      has(flat(.fm01), "jsubset(): Agee > 30 names Agee, which was not found in the mf data frame.") &&
        has(.fm01, "data frame.\nCheck the spelling."))
check("M02 ... nothing is stored, nothing says 'activated', and a named frame gets no default hint",
      is.null(fs_of("mf")) && !has(.fm01, "activated") &&
        !has(.fm01, "juse() default"))
check("M03 two names found nowhere are and-joined, with 'were'",
      has(flat(grab(jsubset(mf, Agee > 30 & Gender == m_code))),
          "Agee > 30 & Gender == m_code names Agee and m_code, which were not found in the mf data frame."))
check("M04 a workspace object that does not exist is refused the same way",
      has(flat(grab(jsubset(mf, Age > m_cutof))),
          "Age > m_cutof names m_cutof, which was not found in the mf data frame.") &&
        is.null(fs_of("mf")))
quiet(juse(mf))
.fm05 <- grab(jsubset(Agee > 30))
check("M05 under the juse() default the hint line follows the fix, as jcomplete()'s does",
      has(.fm05, "Check the spelling.\nmf is the juse() default -- if you meant a different data frame, name it") &&
        is.null(fs_of("mf")))
quiet(juse(NULL))
quiet(jsubset(mf, Age < 40))
.fm06 <- grab(jsubset(mf, Agee > 30))
check("M06 an earlier filter for the frame is reported unchanged, and kept",
      has(.fm06, "Check the spelling.\nYour earlier filter for the mf data frame is unchanged.") &&
        identical(fs_of("mf")$expr_str, "Age < 40"))
reset()
m_lim <- function() stop("the limit file is not loaded")
.fm07 <- grab(jsubset(mf, Age > m_lim()))
check("M07 a filter that stops for any other reason is refused with R's message, and claims nothing was 'not found'",
      identical(.fm07, paste0("jsubset(): Age > m_lim() cannot be applied to the mf data frame.\n",
                              "R reported:\n",
                              "  the limit file is not loaded")) &&
        is.null(fs_of("mf")))
.fm08 <- grab(jsubset(mf, m_isna(Age)))
check("M08 a function that does not exist: the same form, R naming the function",
      has(.fm08, "jsubset(): m_isna(Age) cannot be applied to the mf data frame.\nR reported:\n  ") &&
        has(.fm08, "m_isna") && !has(.fm08, "which was not found") &&
        is.null(fs_of("mf")))
m_lim2 <- function() stop("\033[31mline one\033[39m\n   line two")
.fm09 <- grab(jsubset(mf, Age > m_lim2()))
check("M09 R's message arrives on one line, without the color codes a package may add",
      has(.fm09, "R reported:\n  line one line two") && !has(.fm09, "\033"))
rm(m_lim2)
# A name the evaluation never looked up is unbound too (the element a with()
# call reads from a list), but the filter stopped for another reason: R's
# message decides. M11's element is a WORD of that message, unquoted.
m_p <- list(m_inner = 5, loaded = 5)
.fm10 <- grab(jsubset(mf, Age > m_lim() & with(m_p, m_inner > 3)))
check("M10 a name never looked up is not blamed when the filter stopped for another reason",
      has(.fm10, "R reported:\n  the limit file is not loaded") &&
        !has(.fm10, "names m_inner"))
.fm11 <- grab(jsubset(mf, Age > m_lim() & with(m_p, loaded > 3)))
check("M11 ... nor is one that happens to be a word of R's message",
      has(.fm11, "R reported:\n  the limit file is not loaded") &&
        !has(.fm11, "names loaded"))
.fu <- function(msg) {
  jstats:::.jst_filter_unbound(quote(Agee > 30), mf, globalenv(), msg)
}
check("M12 the missing-name test reads R's message in any language: the name between quotation marks of any kind, never as part of a word",
      identical(.fu("object 'Agee' not found"), "Agee") &&
        identical(.fu("objet 'Agee' introuvable"), "Agee") &&
        identical(.fu("Objekt \u201eAgee\u201c nicht gefunden"), "Agee") &&
        identical(.fu("object \u2018Agee\u2019 not found"), "Agee") &&
        identical(.fu("no Agee here"), character(0)) &&
        identical(.fu("no Agee, none"), character(0)) &&
        identical(.fu("'Ageement'"), character(0)) &&
        identical(.fu("something else entirely"), character(0)))
rm(m_p, .fu)
m_talk <- function(x) { message("m_talk spoke"); x > 40 }
.fm13 <- grab(jsubset(mf, m_talk(Age)))
check("M13 a message the filter prints is dropped when set, as a warning is (B14), and passes when the filter is used",
      !has(.fm13, "m_talk spoke") && has(.fm13, "jsubset activated for mf") &&
        has(grab(jdesc(mf, Age)), "m_talk spoke"))
reset()
rm(m_talk)

# ---- M14-M23: when used -----------------------------------------------------
# The object a stored filter reads, then removed. A workspace VALUE since
# S357 (ruling R19): the vector m_keep <- mf$Age > 35 these checks used is
# refused when it is set.
m_keep <- 35
quiet(jsubset(mf, Age > m_keep))
rm(m_keep)
.fm14 <- grab(jdesc(mf, Age))
check("M14 a stored filter whose object is gone STOPS: the frame, the filter, what no longer exists",
      has(flat(.fm14), "jdesc(): the jsubset filter for the mf data frame, Age > m_keep, cannot be applied: m_keep no longer exists.") &&
        errs(jdesc(mf, Age)))
check("M15 ... then both exits, off first, each command on its own line (Rules E, L)",
      has(.fm14, "no longer exists.\nTo set it aside, run:\n  jsubset(mf, off)\nTo delete it, run:\n  jsubset(mf, NULL)") &&
        !has(.fm14, "R reported"))
.mfns <- list(
  function() jfreq(mf, Gender),
  function() jdesc(mf, Age, Keep01),
  function() jcorr(mf, Age, Keep01),
  function() jalpha(mf, Age, Keep01, Gender),
  function() jt(Age ~ Gender, mf),
  function() jaov(Age ~ Condition, mf),
  function() jcrosstab(Keep01 ~ Gender, mf),
  function() jlm(Age ~ Keep01, mf),
  function() jlogistic(Keep01 ~ Age, mf),
  function() jscreen(mf, Age),
  function() jplot(mf, Age),
  function() jplot(Age ~ Gender, mf),
  function() jdesc(mf$Age)
)
.fm16 <- vapply(.mfns, function(f) {
  g <- flat(grab(f()))   # flattened since S357: the longer condition moved a break
  lengths(regmatches(g, gregexpr("cannot be applied: m_keep no longer exists.",
                                 g, fixed = TRUE)))
}, integer(1))
check("M16 every pipeline entrant stops, with the message exactly once (12 functions, both jplot forms, the vector path)",
      all(.fm16 == 1L) && all(vapply(.mfns, function(f) errs(f()), logical(1))))
# The exits as PRINTED: each line after its "run:" is evaluated.
.mexit <- function(txt, lead) {
  sub(paste0(".*", lead, ", run:\n  ([^\n]*).*"), "\\1", txt)
}
check("M17 the printed 'set it aside' line runs: the analysis runs again and the filter is kept, inactive",
      { quiet(eval(parse(text = .mexit(.fm14, "To set it aside"))))
        !errs(jdesc(mf, Age)) && identical(fs_of("mf")$active, FALSE) &&
          identical(fs_of("mf")$expr_str, "Age > m_keep") })
check("M18 an inactive filter is not evaluated, and a stale one cannot be turned back on (S331; on reactivated it, and the next analysis stopped): it stays off, and the analysis still runs",
      { g <- grab(jsubset(mf, on))
        has(flat(g), "jsubset(): the jsubset filter for the mf data frame, Age > m_keep, cannot be applied: m_keep no longer exists.") &&
          identical(fs_of("mf")$active, FALSE) && !errs(jdesc(mf, Age)) })
check("M19 the printed 'delete it' line runs and removes the filter",
      { quiet(eval(parse(text = .mexit(.fm14, "To delete it"))))
        is.null(fs_of("mf")) && !errs(jdesc(mf, Age)) })
mf$Keep <- mf$Age > 35
m_cut <- 40
quiet(jsubset(mf, Keep == TRUE & Age > m_cut))
mf$Keep <- NULL
rm(m_cut)
check("M20 a dropped variable and a removed object: both named, 'no longer exist'",
      has(flat(grab(jfreq(mf, Gender))),
          "jfreq(): the jsubset filter for the mf data frame, Keep == TRUE & Age > m_cut, cannot be applied: Keep and m_cut no longer exist."))
reset()
m_lim <- function() 40
quiet(jsubset(mf, Age > m_lim()))
m_lim <- function() stop("the limit file is not loaded")
.fm21 <- grab(jt(Age ~ Gender, mf))
check("M21 a stored filter that stops for another reason: R's message between the lead and the exits, nothing claimed gone",
      has(flat(.fm21), "jt(): the jsubset filter for the mf data frame, Age > m_lim(), cannot be applied. R reported:") &&
        has(.fm21, "R reported:\n  the limit file is not loaded\nTo set it aside, run:\n  jsubset(mf, off)\nTo delete it, run:\n  jsubset(mf, NULL)") &&
        !has(.fm21, "no longer") && errs(jt(Age ~ Gender, mf)))
reset()
m_keep <- 35
quiet(juse(mf)); quiet(jsubset(Age > m_keep))
rm(m_keep)
.fm22 <- grab(jdesc(Age))
check("M22 under the juse() default the stop names the default frame, in the lead and in both exits",
      has(flat(.fm22), "the jsubset filter for the mf data frame, Age > m_keep, cannot be applied") &&
        has(.fm22, "\n  jsubset(mf, off)\n") && has(.fm22, "\n  jsubset(mf, NULL)"))
reset()
# A warning the filter itself raises is held while the checks run and given
# back when the filter passes: once, and still a warning.
m_noisy <- function(x) { warning("m_noisy spoke"); x > 40 }
quiet(jsubset(mf, m_noisy(Age)))
.fm23 <- grab(jdesc(mf, Age))
check("M23 a warning from a filter that runs still reaches the user, once, and the analysis runs",
      lengths(regmatches(.fm23, gregexpr("m_noisy spoke", .fm23, fixed = TRUE))) == 1L &&
        !errs(jdesc(mf, Age)))
reset()
rm(m_noisy, m_lim)

# ---- M24-M33: a workspace vector a condition would recycle ------------------
m_v5 <- c(30, 40, 50, 60, 70)
m_v3 <- c(1, 2, 3)
.fm24 <- grab(jsubset(mf, Age > m_v5))
check("M24 a workspace vector that would be recycled is refused when set: 5 values, 12 cases",
      has(flat(.fm24), "jsubset(): In Age > m_v5, m_v5 is not in the mf data frame; it is a separate object in your workspace. It has 5 values for the 12 cases in the mf data frame.") &&
        has(.fm24, "data frame.\nUse a single value, or add the values to the data frame as a variable.") &&
        is.null(fs_of("mf")))
check("M25 ... the SILENT case too: 3 values divide 12 rows, and R says nothing",
      has(flat(grab(jsubset(mf, Gender > m_v3))),
          "In Gender > m_v3, m_v3 is not in the mf data frame; it is a separate object in your workspace. It has 3 values for the 12 cases in the mf data frame.") &&
        is.null(fs_of("mf")))
.fm26 <- grab(jsubset(mf, Condition > m_v3))
check("M26 ... and against a labelled variable: the same message, not the class's own error relayed",
      has(flat(.fm26), "In Condition > m_v3, m_v3 is not in the mf data frame; it is a separate object in your workspace. It has 3 values for the 12 cases in the mf data frame.") &&
        !has(.fm26, "recycle") && !has(.fm26, "R reported"))
quiet(jsubset(mf, Age < 40))
.fm27 <- grab(jsubset(mf, Age > m_v5))
check("M27 ... with an earlier filter in place: reported unchanged, and kept",
      has(.fm27, "as a variable.\nYour earlier filter for the mf data frame is unchanged.") &&
        identical(fs_of("mf")$expr_str, "Age < 40"))
reset()
.fm28 <- grab(jdesc(mf, Age, subset = Age > m_v5))
check("M28 subset = : the per-call form, and R's own 'longer object length' warning does not print ahead of it",
      has(flat(.fm28), "jdesc(): In subset = Age > m_v5, m_v5 is not in the mf data frame; it is a separate object in your workspace. It has 5 values for the 12 cases in the mf data frame. Use a single value, or add the values to the data frame as a variable.") &&
        !has(.fm28, "longer object length"))
check("M29 ... on the vector path as well",
      has(flat(grab(jdesc(mf$Age, subset = Age > m_v5))),
          "jdesc(): In subset = Age > m_v5, m_v5 is not in the mf data frame; it is a separate object in your workspace. It has 5 values for the 12 cases in the mf data frame."))
quiet(jsubset(mf, Gender == 1))
m_per <- rep(c(1, 3), 6)
.fm30 <- grab(jdesc(mf, Age, subset = Condition >= m_per))
# Re-pinned S357 (ruling R19): the S331 add-it form is now the stop for one
# value per case everywhere, filtered or not -- its count gone, the call
# given after the line that adds it.
check("M30 one value per case of the frame, behind a stored filter: ruling R19's stop, the line that adds it to the frame and the call",
      has(flat(.fm30), "jdesc(): In subset = Condition >= m_per, m_per is not in the mf data frame; it is a separate object in your workspace. jstats analyzes the variables of a data frame.") &&
        has(.fm30, "Add it to the data frame first:\n  mf$m_per <- m_per\n  jdesc(mf, Age, subset = Condition >= m_per)"))
check("M31 ... and that fix, run as printed, lets the condition through",
      { eval(parse(text = sub(".*data frame first:\n  ([^\n]*).*", "\\1", .fm30)))
        ok <- !errs(jdesc(mf, Age, subset = Condition >= m_per))
        mf$m_per <- NULL
        ok })
reset()
m_vv <- 40   # a value when set: R19 (S357) refuses rep(40, 12), which this used
quiet(jsubset(mf, Age >= m_vv))
m_vv <- c(30, 40, 50)
.fm32 <- grab(jdesc(mf, Age))
check("M32 a stored filter whose vector has changed since: the stored form and both exits, without R's warning",
      has(flat(.fm32), "jdesc(): the jsubset filter for the mf data frame, Age >= m_vv, cannot be applied: m_vv is not in the mf data frame; it is a separate object in your workspace, with 3 values for 12 cases.") &&
        has(.fm32, "12 cases.\nTo set it aside, run:\n  jsubset(mf, off)\nTo delete it, run:\n  jsubset(mf, NULL)") &&
        !has(.fm32, "longer object length") && errs(jdesc(mf, Age)))
reset()
m_cut <- 40; m_codes <- c(1, 2); m_lims <- c(30, 50); m_by <- c(35, 45)
m_keep <- mf$Age > 35; m_p <- list(lo = 30)
.mok <- function(expr) {
  g <- grab(expr)
  ok <- has(g, "jsubset activated for mf")
  quiet(jsubset(mf, NULL))
  ok
}
# S357 (ruling R19): one value per row is no longer among them; the R19
# checks in section Z hold its stop.
check("M33 controls: a cutoff, a set with %in%, an element, a lookup by a variable, a list element and a summary are all accepted",
      .mok(jsubset(mf, Age > m_cut)) &&
        .mok(jsubset(mf, Gender %in% m_codes)) &&
        .mok(jsubset(mf, Age > m_lims[1] & Age < m_lims[2])) &&
        .mok(jsubset(mf, Age > m_by[Gender])) &&
        .mok(jsubset(mf, Age > m_p$lo)) &&
        .mok(jsubset(mf, Age > max(m_lims))))
reset()
rm(m_v5, m_v3, m_per, m_vv, m_cut, m_codes, m_lims, m_by, m_keep, m_p)

# ---- M34-M39: a condition naming the frame, typed where the frame goes ------
# No juse() default from here to the foot of the section.
.fm34 <- grab(jsubset(mf$Age > 40))
check("M34 jsubset(mf$Age > 40) with no default: the frame-first refusal, verbatim (it said \"'mf$Age > 40' not found\")",
      identical(.fm34, paste0("jsubset(): mf$Age > 40 names the mf data frame.\n",
                              "Name the data frame first, and the variable on its own:\n",
                              "  jsubset(mf, Age > 40)")))
check("M35 ... the printed fix runs and stores the bare condition",
      { quiet(eval(parse(text = sub(".*on its own:\n  ([^\n]*).*", "\\1", .fm34))))
        ok <- identical(fs_of("mf")$expr_str, "Age > 40")
        reset()
        ok })
check("M36 two variables: 'each variable', both rewritten",
      has(grab(jsubset(mf$Age > 40 & mf$Gender == 1)),
          "Name the data frame first, and each variable on its own:\n  jsubset(mf, Age > 40 & Gender == 1)"))
check("M37 a rewrite that cannot be complete gets the sentence alone: a misspelled variable, a second frame, a summary of the frame, a second input, a column reached by position",
      all(vapply(list(grab(jsubset(mf$Agee > 40)),
                      grab(jsubset(mf$Age > e$Age)),
                      grab(jsubset(mf$Age > mean(mf$Age))),
                      grab(jsubset(mf$Age > 40, Gender == 1)),
                      grab(jsubset(mf[, "Age"] > 40))),
                 function(g) {
                   has(g, " names the mf data frame.\nName the data frame first, and each variable on its own.") &&
                     !has(g, "\n  jsubset(")
                 }, logical(1))) &&
        is.null(fs_of("mf")))
check("M38 another data-first function, the same kind of input its only one: the sentence, under its own name, and no jsubset() call",
      identical(grab(jcorr(mf$Age + 1)),
                paste0("jcorr(): mf$Age + 1 names the mf data frame.\n",
                       "Name the data frame first, and each variable on its own.")))
check("M39 control: a condition naming no frame says it needs one -- not \"not found\", no variable-name question (S355, the S352 item) -- with the two forms, each call on a line of its own",
      { g <- grab(jsubset(Age > 40))
        has(flat(g), "jsubset(): Age > 40 needs a data frame, and none was named or set as the default.") &&
          !has(g, "not found") && !has(g, "variable name?") &&
          has(g, "Name the data frame first:\n  jsubset(MyData, Age > 40)\n") &&
          has(g, "Or set a default first, then run the call:\n  juse(MyData)\n  jsubset(Age > 40)") })
reset()
rm(mf, .mfns)

# =============================================================================
# SECTION N -- A STALE SETTING CANNOT BE TURNED BACK ON; THE STATUS DISPLAYS
#              SAY SO; A ONE-VALUE-PER-CASE VECTOR BEHIND jcomplete() (S331)
# =============================================================================
# The two S330 reactivation items and the two riders Jeff added at S331.
# Until S331 jsubset(d, on) and jcomplete(d, on) set the stored setting
# active unchecked -- "reactivated" printed for a filter that could no longer
# run and the next analysis stopped -- jcomplete()'s status line counted
# complete cases on the variables that REMAINED, and its preview showed the
# rows those would drop. Now:
#   on         the stored setting is checked first. A filter that is off
#              stays off, and says so, with the delete exit alone ("set it
#              aside" would name the state it is in); one that was never off
#              gets the analysis-time stop exactly. With the juse() default
#              frame gone, the default-not-found stop.
#   status     jsubset() and jcomplete() say "It cannot be applied: ..." in
#              the stop's own words, and for an ACTIVE setting what follows
#              (it stays active on purpose: jstats never widens the sample
#              on its own -- Jeff, S331, keeping the S329 ruling). With two
#              or more frames, a ", cannot be applied" tag.
#   preview    jcomplete(preview = TRUE) / console = on a stale setting is
#              the analysis-time stop.
#   vector     a workspace vector with one value per case of the frame AS
#              GIVEN, in a condition that runs on fewer cases -- a jsubset()
#              filter behind an active jcomplete(), a subset = behind either
#              -- gets the S330 add-it-to-the-frame fix whatever it is
#              compared with (until S331 only a labelled variable reached
#              it; a plain variable or a constant gave "has 12 values for 11
#              rows", for a frame the user had removed nothing from): at
#              analysis time, when set, at on, and in the status display.
# Fixtures nf (a copy of d; jcomplete() on Age keeps 11 of its 12 cases), nk
# (d plus Tmp, dropped once it is in a setting); workspace objects carry an
# n_ prefix. No juse() default unless a check sets one.
reset()
nf <- d
# .n_count(): how many times a fixed string appears in a text.
.n_count <- function(txt, needle) {
  lengths(regmatches(txt, gregexpr(needle, txt, fixed = TRUE)))
}

# ---- N01-N13: jsubset(d, on) ------------------------------------------------
# (S357, ruling R19: the object a stored filter reads here is a workspace VALUE,
# 35 or one TRUE -- a vector of one value per case is refused when set.)
n_keep <- 35
quiet(jsubset(nf, Age > n_keep)); quiet(jsubset(nf, off)); rm(n_keep)
.fn01 <- grab(jsubset(nf, on))
check("N01 jsubset(nf, on) refuses a filter whose object is gone: the stored lead, 'The filter stays off.', the delete exit alone",
      has(flat(.fn01), "jsubset(): the jsubset filter for the nf data frame, Age > n_keep, cannot be applied: n_keep no longer exists.") &&
        has(.fn01, "no longer exists.\nThe filter stays off.\nTo delete it, run:\n  jsubset(nf, NULL)") &&
        !has(.fn01, "To set it aside") && !has(.fn01, "reactivated"))
check("N02 ... the filter is still stored, still off, and the analysis still runs",
      identical(fs_of("nf")$active, FALSE) &&
        identical(fs_of("nf")$expr_str, "Age > n_keep") && !errs(jdesc(nf, Age)))
check("N03 ... and the printed delete line runs and removes it",
      { quiet(eval(parse(text = sub(".*To delete it, run:\n  ([^\n]*).*", "\\1", .fn01))))
        is.null(fs_of("nf")) })
nf$Keep <- nf$Age > 35
quiet(juse(nf)); quiet(jsubset(Keep == TRUE & Age > 20)); quiet(jsubset(off))
nf$Keep <- NULL
check("N04 the default-scoped forms, jsubset(on) and jsubset(, on), refuse a dropped variable the same way, naming the default frame",
      { a <- grab(jsubset(on)); b <- grab(jsubset(, on))
        identical(a, b) &&
          has(flat(a), "the jsubset filter for the nf data frame, Keep == TRUE & Age > 20, cannot be applied: Keep no longer exists.") &&
          has(a, "The filter stays off.\nTo delete it, run:\n  jsubset(nf, NULL)") &&
          identical(fs_of("nf")$active, FALSE) })
reset()
n_lim <- function() 40
quiet(jsubset(nf, Age > n_lim())); quiet(jsubset(nf, off))
n_lim <- function() stop("the limit file is not loaded")
.fn05 <- grab(jsubset(nf, on))
check("N05 a filter that stops with an error of R's own: R's message, then the same close",
      has(flat(.fn05), "jsubset(): the jsubset filter for the nf data frame, Age > n_lim(), cannot be applied. R reported:") &&
        has(.fn05, "R reported:\n  the limit file is not loaded\nThe filter stays off.\nTo delete it, run:\n  jsubset(nf, NULL)") &&
        !has(.fn05, "no longer") && identical(fs_of("nf")$active, FALSE))
reset()
ns <- nf; n_keep <- TRUE
quiet(jsubset(ns, Age > 35 & n_keep)); quiet(jsubset(ns, off)); ns <- ns[-1, ]; n_keep <- rep(TRUE, 12)
.fn06 <- grab(jsubset(ns, on))
check("N06 a filter that no longer matches the frame's rows: the shape error, with the same close",
      has(flat(.fn06), paste0("jsubset(): the jsubset filter for the ns data frame, Age > 35 & n_keep, cannot be applied: ",
                              "n_keep is not in the ns data frame; it is a separate object in your workspace, with 12 values for 11 cases.")) &&
        has(.fn06, "11 cases.\nThe filter stays off.\nTo delete it, run:\n  jsubset(ns, NULL)") &&
        !has(.fn06, "To set it aside") && identical(fs_of("ns")$active, FALSE))
reset()
n_vv <- 40   # a value when set (R19, S357)
quiet(jsubset(nf, Age >= n_vv)); quiet(jsubset(nf, off)); n_vv <- c(30, 40, 50)
.fn07 <- grab(jsubset(nf, on))
check("N07 a vector that would now be recycled: the stored form, the same close, and R's own warning does not print",
      has(flat(.fn07), "the jsubset filter for the nf data frame, Age >= n_vv, cannot be applied: n_vv is not in the nf data frame; it is a separate object in your workspace, with 3 values for 12 cases.") &&
        has(.fn07, "12 cases.\nThe filter stays off.\nTo delete it, run:\n  jsubset(nf, NULL)") &&
        !has(.fn07, "longer object length"))
reset()
n_keep <- 35
quiet(jsubset(nf, Age > n_keep)); rm(n_keep)
.fn08 <- grab(jsubset(nf, on))
check("N08 on for a filter that was never off: the analysis-time stop exactly -- both exits, nothing 'stays off' -- and it stays active",
      has(flat(.fn08), "jsubset(): the jsubset filter for the nf data frame, Age > n_keep, cannot be applied: n_keep no longer exists.") &&
        has(.fn08, "no longer exists.\nTo set it aside, run:\n  jsubset(nf, off)\nTo delete it, run:\n  jsubset(nf, NULL)") &&
        !has(.fn08, "stays off") && isTRUE(fs_of("nf")$active))
reset()
nf2 <- nf
quiet(juse(nf2)); quiet(jsubset(Age < 40)); quiet(jsubset(off)); rm(nf2)
check("N09 the juse() default frame gone: jsubset(on) is the default-not-found stop, and the filter stays off",
      has(flat(grab(jsubset(on))),
          "jsubset(): Default data frame nf2 not found. It may have been removed or renamed.") &&
        identical(fs_of("nf2")$active, FALSE))
check("N10 ... while off needs no frame, and still answers",
      has(grab(jsubset(off)), "jsubset deactivated for nf2."))
reset()
quiet(jsubset(nf, Age < 40)); quiet(jsubset(nf, off))
check("N11 control: a filter that can be applied is reactivated, as before",
      identical(grab(jsubset(nf, on)), "jsubset reactivated for nf: Age < 40\n") &&
        isTRUE(fs_of("nf")$active))
reset()
n_noisy <- function(x) { warning("n_noisy warned"); message("n_noisy spoke"); x > 40 }
quiet(jsubset(nf, n_noisy(Age))); quiet(jsubset(nf, off))
.fn12a <- grab(jsubset(nf, on))
.fn12b <- grab(jsubset(nf, on))
check("N12 a warning or message of the filter's own is dropped by on, as when it was set -- from a filter that was off, and from one already on",
      identical(.fn12a, "jsubset reactivated for nf: n_noisy(Age)\n") &&
        identical(.fn12b, .fn12a))
reset()
rm(n_noisy)
nz <- nf
quiet(jsubset(nz, Age < 40)); quiet(jsubset(nz, off)); nz <- nz[0, ]
check("N13 a frame with no rows gives on nothing to check: reactivated (the analysis has its own stop for an empty frame)",
      has(grab(jsubset(nz, on)), "jsubset reactivated for nz: Age < 40"))
reset()
rm(nz, ns, n_lim, n_vv)

# ---- N14-N18: jcomplete(d, on) ----------------------------------------------
nk <- d; nk$Tmp <- c(NA, 2:12)
quiet(jcomplete(nk, Age, Tmp)); quiet(jcomplete(nk, off)); nk$Tmp <- NULL
.fn14 <- grab(jcomplete(nk, on))
check("N14 jcomplete(nk, on) refuses a setting naming a variable the frame no longer has: the stop, with 'The setting stays off.' before its remedies",
      has(flat(.fn14), "jcomplete(): the jcomplete setting for the nk data frame names Tmp, which the data frame no longer has.") &&
        has(.fn14, paste0("no longer has.\nThe setting stays off.\nRun jcomplete() again with the ",
                          "current variable names, or clear the setting:\n  jcomplete(nk, NULL)")) &&
        !has(.fn14, "reactivated"))
check("N15 ... the setting is still stored, still off, and the analysis still runs",
      identical(cs_of("nk")$active, FALSE) &&
        identical(unname(cs_of("nk")$vars), c("Age", "Tmp")) && !errs(jdesc(nk, Age)))
quiet(juse(nk))
check("N16 the default-scoped forms, jcomplete(on) and jcomplete(, on), refuse it the same way",
      { a <- grab(jcomplete(on))
        identical(a, .fn14) && identical(grab(jcomplete(, on)), a) })
quiet(juse(NULL))
reset()
nk$Tmp <- c(NA, 2:12); quiet(jcomplete(nk, Age, Tmp)); nk$Tmp <- NULL
.fn17 <- grab(jcomplete(nk, on))
check("N17 on for a setting that was never off: the analysis-time stop exactly, nothing 'stays off', and it stays active",
      has(.fn17, paste0("no longer has.\nRun jcomplete() again with the current variable names, ",
                        "or clear the setting:\n  jcomplete(nk, NULL)")) &&
        !has(.fn17, "stays off") && isTRUE(cs_of("nk")$active))
reset()
nk2 <- d
quiet(juse(nk2)); quiet(jcomplete(Age)); quiet(jcomplete(off)); rm(nk2)
check("N18 the juse() default frame gone: jcomplete(on) is the default-not-found stop; a setting that can be applied is reactivated as before",
      has(flat(grab(jcomplete(on))),
          "jcomplete(): Default data frame nk2 not found. It may have been removed or renamed.") &&
        identical(cs_of("nk2")$active, FALSE) &&
        { reset(); quiet(jcomplete(nf, Age)); quiet(jcomplete(nf, off))
          identical(grab(jcomplete(nf, on)), "jcomplete reactivated for nf: Age\n") &&
            isTRUE(cs_of("nf")$active) })
reset()

# ---- N19-N25: jcomplete()'s status line, overview and preview ---------------
nk$Tmp <- c(NA, 2:12); quiet(jcomplete(nk, Age, Tmp)); nk$Tmp <- NULL
.fn19 <- grab(jcomplete())
check("N19 the status of an ACTIVE setting naming a variable that is gone: no count; 'It cannot be applied', the variable, and what follows",
      has(.fn19, "jcomplete active for nk: Age, Tmp\nIt cannot be applied: the nk data frame no longer has Tmp.\n") &&
        has(flat(.fn19), "no longer has Tmp. Analyses of the nk data frame will stop until it is turned off, cleared or set again.") &&
        !has(.fn19, "complete cases"))
quiet(jcomplete(nk, off))
check("N20 ... of an INACTIVE one: the same second line, and no third (nothing stops while it is off)",
      identical(grab(jcomplete()),
                "jcomplete set but inactive for nk: Age, Tmp\nIt cannot be applied: the nk data frame no longer has Tmp.\n"))
.fn21 <- c(grab(jcomplete(console = TRUE)), grab(jcomplete(preview = TRUE)))
check("N21 a preview of the set filter stops as the analysis does (it showed the rows the REMAINING variables would drop); nothing 'stays off'",
      errs(jcomplete(console = TRUE)) && identical(.fn21[1], .fn21[2]) &&
        has(flat(.fn21[1]), "jcomplete(): the jcomplete setting for the nk data frame names Tmp, which the data frame no longer has.") &&
        has(.fn21[1], "or clear the setting:\n  jcomplete(nk, NULL)") &&
        !has(.fn21[1], "stays off") &&
        !any(grepl("Preview", plines(tryCatch(jcomplete(console = TRUE), error = function(e) NULL)))))
nk$Age <- NULL
check("N22 every variable gone: both are named, in the status line and in the preview's stop (it was the note 'None of the registered variables are present')",
      has(grab(jcomplete()), "It cannot be applied: the nk data frame no longer has Age and Tmp.") &&
        has(flat(grab(jcomplete(console = TRUE))), "names Age and Tmp, which the data frame no longer has.") &&
        !has(grab(jcomplete(console = TRUE)), "None of the registered"))
reset()
quiet(jcomplete(nf, Age))
check("N23 controls: a setting that can be applied keeps its count, and its preview; off, the plain line; a frame that cannot be reached, no count and no fault",
      identical(grab(jcomplete()), "jcomplete active for nf: Age (11 of 12 complete cases)\n") &&
        any(grepl("jcomplete Preview", plines(jcomplete(console = TRUE)), fixed = TRUE)) &&
        { quiet(jcomplete(nf, off))
          identical(grab(jcomplete()), "jcomplete set but inactive for nf: Age\n") } &&
        { reset(); nu <- d; quiet(jcomplete(nu, Age)); rm(nu)
          identical(grab(jcomplete()), "jcomplete active for nu: Age\n") })
reset()
ne <- d
nk <- d; nk$Tmp <- c(NA, 2:12); quiet(jcomplete(nk, Age, Tmp)); nk$Tmp <- NULL
quiet(jcomplete(ne, Age)); quiet(jcomplete(ne, off))
check("N24 two frames: the overview tags the setting that cannot be applied, and no other",
      identical(grab(jcomplete()),
                paste0("jcomplete settings (2 data frames):\n",
                       "  - nk: Age, Tmp  [active, cannot be applied]\n",
                       "  - ne: Age  [inactive]\n")))
quiet(juse(nk))
check("N25 ... after the default tag",
      has(grab(jcomplete()), "  - nk: Age, Tmp  [active, default, cannot be applied]\n"))
reset()

# ---- N26-N32: jsubset()'s status line and overview --------------------------
n_keep <- 35
quiet(jsubset(nf, Age > n_keep)); rm(n_keep)
.fn26 <- grab(jsubset())
check("N26 jsubset()'s status of an ACTIVE filter whose object is gone: 'It cannot be applied', the reason in the stop's words, and what follows",
      has(.fn26, "jsubset active for nf: Age > n_keep\nIt cannot be applied: n_keep no longer exists.\n") &&
        has(flat(.fn26), "no longer exists. Analyses of the nf data frame will stop until it is turned off, deleted or fixed."))
check("N27 ... the status display stops nothing and changes nothing: the filter is still active, the analysis still stops",
      isTRUE(fs_of("nf")$active) && errs(jdesc(nf, Age)))
quiet(jsubset(nf, off))
check("N28 ... of an INACTIVE one: the same second line, and no third",
      identical(grab(jsubset()),
                "jsubset set but inactive for nf: Age > n_keep\nIt cannot be applied: n_keep no longer exists.\n"))
reset()
n_lim <- function() 40
quiet(jsubset(nf, Age > n_lim()))
n_lim <- function() stop("the limit file is not loaded")
check("N29 an error of R's own: 'It cannot be applied.', then R's message",
      has(grab(jsubset()), "jsubset active for nf: Age > n_lim()\nIt cannot be applied.\nR reported:\n  the limit file is not loaded\n"))
reset()
ns <- nf; n_keep <- TRUE
quiet(jsubset(ns, Age > 35 & n_keep)); ns <- ns[-1, ]; n_keep <- rep(TRUE, 12)
n_vv <- 40; quiet(jsubset(nf, Age >= n_vv)); n_vv <- c(30, 40, 50)   # a value when set (S357)
check("N30 a wrong shape, and a vector that would be recycled, each in a line of its own; two frames, so the overview tags both",
      { quiet(jsubset(nf, off)); a <- grab(jsubset(ns, off)); quiet(jsubset(nf, NULL))
        s1 <- grab(jsubset())
        quiet(jsubset(ns, NULL)); n_vv <- 40; quiet(jsubset(nf, Age >= n_vv))
        n_vv <- c(30, 40, 50)
        s2 <- grab(jsubset())
        has(flat(s1), "jsubset set but inactive for ns: Age > 35 & n_keep It cannot be applied: n_keep is not in the ns data frame; it is a separate object in your workspace, with 12 values for 11 cases. ") &&
          has(flat(s2), "jsubset active for nf: Age >= n_vv It cannot be applied: n_vv is not in the nf data frame; it is a separate object in your workspace, with 3 values for 12 cases. ") })
reset()
n_noisy <- function(x) { warning("n_noisy warned"); message("n_noisy spoke"); x > 40 }
quiet(jsubset(nf, Age < 40))
check("N31 controls: a filter that can be applied prints the plain line; one that warns or speaks is checked in silence; a frame that cannot be reached, no fault",
      identical(grab(jsubset()), "jsubset active for nf: Age < 40\n") &&
        { quiet(jsubset(nf, n_noisy(Age)))
          identical(grab(jsubset()), "jsubset active for nf: n_noisy(Age)\n") } &&
        { reset(); nu <- d; quiet(jsubset(nu, Age < 40)); rm(nu)
          identical(grab(jsubset()), "jsubset active for nu: Age < 40\n") })
reset()
rm(n_noisy)
n_keep <- 35
quiet(jsubset(nf, Age > n_keep)); quiet(jsubset(ne, Gender == 1)); rm(n_keep)
quiet(juse(nf))
check("N32 two frames: the overview tags the filter that cannot be applied, after the default tag, and no other",
      identical(grab(jsubset()),
                paste0("jsubset settings (2 data frames):\n",
                       "  - nf: Age > n_keep  [active, default, cannot be applied]\n",
                       "  - ne: Gender == 1  [active]\n")))
reset()
rm(ns, n_lim, n_vv)

# ---- N33-N49: one value per case of the frame, behind jcomplete() -----------
# RE-WRITTEN S357 (ruling R19). Until then a workspace vector of one value
# per case passed when nothing cut the frame, and got the S331 add-it line
# when jcomplete() or a stored filter did ("n_keep has 12 values, one for
# each case in the nf data frame, but jcomplete() leaves 11"). Now it stops
# everywhere, filtered or not, with R19's one message: not in the data
# frame, a separate object, the line that adds it and the call. These
# checks keep what the section held that still applies: the stored form,
# the status display, on, the printed fix run, the controls, and the count
# of cases jcomplete() leaves -- now said only of a vector that holds one
# value for each of THEM (N47). A stored filter reads such a vector only
# when the object behind it changed since it was set: n_keep is one TRUE
# when the filter is set, and twelve values afterwards.
n_keep <- TRUE
quiet(jsubset(nf, Age > 0 & n_keep)); quiet(jcomplete(nf, Age))
n_keep <- nf$Age > 35 | is.na(nf$Age)
n_per  <- rep(c(35, 45), 6)
.fn33 <- grab(jdesc(nf, Gender))
check("N33 a stored filter reading a one-value-per-case object, behind an active jcomplete(): R19's stored form -- the cause, and the line that adds it to the frame, no exits",
      has(flat(.fn33), "jdesc(): the jsubset filter for the nf data frame, Age > 0 & n_keep, cannot be applied: n_keep is not in the nf data frame; it is a separate object in your workspace.") &&
        has(.fn33, "\njstats analyzes the variables of a data frame.\nAdd it to the data frame first:\n  nf$n_keep <- n_keep") &&
        !has(.fn33, "To set it aside") && !has(.fn33, "has 12 values for 11 rows") &&
        errs(jdesc(nf, Gender)))
check("N34 ... on other analysis functions too, once each",
      all(vapply(list(grab(jfreq(nf, Gender)), grab(jt(Age ~ Gender, nf)),
                      grab(jdesc(nf$Gender))),
                 function(g) .n_count(flat(g), "n_keep is not in the nf data frame") == 1L,
                 logical(1))))
.fn35 <- grab(jsubset())
check("N35 ... and in the status display, in the same words",
      has(flat(.fn35), "It cannot be applied: n_keep is not in the nf data frame; it is a separate object in your workspace. Analyses of the nf data frame will stop"))
quiet(jsubset(nf, off))
.fn36 <- grab(jsubset(nf, on))
check("N36 ... and at on: the cause, 'The filter stays off.', then the same fix",
      has(flat(.fn36), "jsubset(): the jsubset filter for the nf data frame, Age > 0 & n_keep, cannot be applied: n_keep is not in the nf data frame; it is a separate object in your workspace.") &&
        has(.fn36, "\nThe filter stays off.\njstats analyzes the variables of a data frame.\nAdd it to the data frame first:\n  nf$n_keep <- n_keep") &&
        identical(fs_of("nf")$active, FALSE))
check("N37 the printed fix, run, lets the SAME stored filter through: on reactivates it, and the analysis excludes 1 case, then 4, and keeps 7",
      { eval(parse(text = sub(".*data frame first:\n  ([^\n]*).*", "\\1", .fn33)))
        ok <- has(grab(jsubset(nf, on)), "jsubset reactivated for nf: Age > 0 & n_keep")
        ln <- plines(jdesc(nf, Age))
        nf$n_keep <- NULL
        ok && any(grepl("^ +jcomplete\\(\\) +1 +11 +Age$", ln)) &&
          any(grepl("^ +jsubset\\(\\) +4 +7 +Age > 0 & n_keep$", ln)) })
quiet(jsubset(nf, NULL)); quiet(jcomplete(nf, off))
check("N38 a bare name as the whole condition, and one compared with a plain variable, are refused when set, with the call (each was set before S357)",
      { a <- grab(jsubset(nf, n_keep))
        b <- grab(jsubset(nf, Age >= n_per))
        has(flat(a), "jsubset(): n_keep is not in the nf data frame; it is a separate object in your workspace.") &&
          has(a, "\n  nf$n_keep <- n_keep\n  jsubset(nf, n_keep)") &&
          has(flat(b), "jsubset(): In Age >= n_per, n_per is not in the nf data frame; it is a separate object in your workspace.") &&
          has(b, "\n  nf$n_per <- n_per\n  jsubset(nf, Age >= n_per)") &&
          is.null(fs_of("nf")) })
quiet(jcomplete(nf, Age))
.fn39 <- grab(jsubset(nf, n_keep == TRUE))
check("N39 SET behind an active jcomplete(), the same set-time form and nothing stored (until S357 the S331 form, with jcomplete()'s count)",
      has(flat(.fn39), "jsubset(): In n_keep == TRUE, n_keep is not in the nf data frame; it is a separate object in your workspace.") &&
        endsWith(.fn39, "\njstats analyzes the variables of a data frame.\nAdd it to the data frame first:\n  nf$n_keep <- n_keep\n  jsubset(nf, n_keep == TRUE)") &&
        !has(.fn39, "leaves 11") && is.null(fs_of("nf")))
quiet(jsubset(nf, Gender == 1))
.fn40 <- grab(jsubset(nf, Age >= n_per))
check("N40 ... with an earlier filter in place: reported unchanged, and kept",
      has(.fn40, "  jsubset(nf, Age >= n_per)\nYour earlier filter for the nf data frame is unchanged.") &&
        identical(fs_of("nf")$expr_str, "Gender == 1"))
quiet(jsubset(nf, NULL))
n_l <- list(per = n_per)
check("N41 an object reached through $ is added under its last name, the condition naming that column; the lines run, and the filter is set",
      { g <- grab(jsubset(nf, Age >= n_l$per))
        lns <- strsplit(g, "\n", fixed = TRUE)[[1]]
        fix <- trimws(lns[grepl("^  ", lns)])
        ok <- length(fix) == 2L &&
          identical(fix, c("nf$per <- n_l$per", "jsubset(nf, Age >= per)"))
        if (ok) for (f in fix) quiet(eval(parse(text = f), envir = globalenv()))
        set <- identical(fs_of("nf")$expr_str, "Age >= per")
        quiet(jsubset(nf, NULL)); nf$per <- NULL
        has(flat(g), "In Age >= n_l$per, n_l$per is not in the nf data frame; it is a separate object in your workspace.") &&
          has(g, "Add it to the data frame first, then name the column:") && ok && set })
n_v5 <- c(30, 40, 50, 60, 70); n_k11 <- rep(c(TRUE, FALSE), 6)[-1]
check("N42 controls behind an active jcomplete(): a filter on the frame's own variables is set and runs; a vector of any other length takes the recycling form, opening as R19's does -- one value per case jcomplete() LEAVES included",
      { ok1 <- has(grab(jsubset(nf, Gender == 1)), "jsubset activated for nf") &&
               !errs(jdesc(nf, Age))
        quiet(jsubset(nf, NULL))
        ok2 <- has(flat(grab(jsubset(nf, Age > n_v5))),
                   "In Age > n_v5, n_v5 is not in the nf data frame; it is a separate object in your workspace. It has 5 values for the 12 cases in the nf data frame.")
        ok3 <- has(flat(grab(jsubset(nf, Age > n_k11))),
                   "In Age > n_k11, n_k11 is not in the nf data frame; it is a separate object in your workspace. It has 11 values for the 12 cases in the nf data frame.")
        ok1 && ok2 && ok3 && is.null(fs_of("nf")) })
quiet(jcomplete(nf, off))
check("N43 with jcomplete() off, or dropping no case, the same filter is refused too (it was set and ran before S357)",
      { ok1 <- has(flat(grab(jsubset(nf, n_keep == TRUE))), "n_keep is not in the nf data frame") &&
               is.null(fs_of("nf"))
        reset()
        quiet(jcomplete(nf, Gender))
        ok2 <- has(flat(grab(jsubset(nf, n_keep == TRUE))), "n_keep is not in the nf data frame") &&
               is.null(fs_of("nf"))
        ok1 && ok2 })
reset()
quiet(jsubset(nf, Gender == 1))
.fn44 <- grab(jdesc(nf, Age, subset = Age >= n_per))
check("N44 per call, behind a stored filter: compared with a plain variable, R19's form with the call (it said 'has 12 values, one for each case ... but filtering leaves 6')",
      has(flat(.fn44), "jdesc(): In subset = Age >= n_per, n_per is not in the nf data frame; it is a separate object in your workspace.") &&
        has(.fn44, "Add it to the data frame first:\n  nf$n_per <- n_per\n  jdesc(nf, Age, subset = Age >= n_per)") &&
        !has(.fn44, "not one TRUE or FALSE") && !has(.fn44, "leaves 6"))
check("N45 ... compared with a constant, and as a bare name, likewise; and the printed fix, run, lets the condition through",
      { a <- grab(jdesc(nf, Age, subset = n_keep == TRUE))
        b <- grab(jdesc(nf, Age, subset = n_keep))
        eval(parse(text = sub(".*data frame first:\n  ([^\n]*).*", "\\1", b)))
        ok <- !errs(jdesc(nf, Age, subset = n_keep)) &&
              !errs(jdesc(nf, Age, subset = n_keep == TRUE))
        nf$n_keep <- NULL
        has(flat(a), "In subset = n_keep == TRUE, n_keep is not in the nf data frame; it is a separate object in your workspace.") &&
          has(flat(b), "In subset = n_keep, n_keep is not in the nf data frame; it is a separate object in your workspace.") &&
          has(b, "\n  nf$n_keep <- n_keep\n  jdesc(nf, Age, subset = n_keep)") && ok })
reset()
check("N46 per call with no stored setting, and behind jcomplete() alone, the same stop (with no setting the condition ran until S357)",
      has(flat(grab(jdesc(nf, Gender, subset = n_keep == TRUE))),
          "In subset = n_keep == TRUE, n_keep is not in the nf data frame") &&
        { quiet(jcomplete(nf, Age))
          has(flat(grab(jdesc(nf, Gender, subset = n_keep == TRUE))),
              "In subset = n_keep == TRUE, n_keep is not in the nf data frame") })
reset()
# A vector of any OTHER length behind jcomplete() keeps the S330 stored form
# and both exits, opening as R19's message does.
n_vv <- 40
quiet(jsubset(nf, Age >= n_vv)); quiet(jcomplete(nf, Age)); n_vv <- c(30, 40, 50)
.fn49 <- grab(jdesc(nf, Gender))
check("N49 control: behind jcomplete(), a stored filter whose vector has some other length keeps the recycling form and both exits",
      has(flat(.fn49), "the jsubset filter for the nf data frame, Age >= n_vv, cannot be applied: n_vv is not in the nf data frame; it is a separate object in your workspace, with 3 values for 11 cases.") &&
        has(.fn49, "11 cases.\nTo set it aside, run:\n  jsubset(nf, off)\nTo delete it, run:\n  jsubset(nf, NULL)") &&
        !has(.fn49, "Add it to the data frame"))
reset()
rm(n_vv)
# The cases jcomplete() keeps are counted as the analysis counts them: a
# declared missing value is missing. Inc has no NA, and -99 declared on
# rows 3 and 7. Since S357 the count is said of an object holding one value
# for each case jcomplete() leaves -- the one length R19 cannot add to the
# frame as it is.
nm <- d
nm$Inc <- haven::labelled_spss(c(30, 50, -99, 40, 60, 35, -99, 44, 70, 20,
                                 41, 52),
                               labels = c(Refused = -99), na_values = -99)
quiet(jcomplete(nm, Inc))
n_k10 <- TRUE
quiet(jsubset(nm, Age > 0 & n_k10))
n_k10 <- rep(TRUE, 10)
check("N47 the cases jcomplete() leaves are counted with declared missing values as missing: an object of 10 values is one per case left ('the nm data frame has 12'), and the analysis agrees",
      { g <- grab(jdesc(nm, Age))
        quiet(jsubset(nm, NULL))
        has(flat(g), "n_k10 is not in the nm data frame; it is a separate object in your workspace. jstats analyzes the variables of a data frame. It has 10 values, one for each case left after filtering; the nm data frame has 12. Use a single value, or add the values to the data frame as a variable.") &&
          any(grepl("^ +jcomplete\\(\\) +2 +10 +Inc$", plines(jdesc(nm, Age)))) })
reset()
rm(n_k10)
# A stale jcomplete() setting beside a filter: the filter's own checks say
# nothing about it (the analysis stops on the jcomplete() setting first).
nk <- d; nk$Tmp <- c(NA, 2:12); quiet(jcomplete(nk, Age, Tmp)); nk$Tmp <- NULL
check("N48 beside a jcomplete() setting that is itself stale, a filter is still set, shown and turned back on; the analysis stops on the jcomplete() setting",
      has(grab(jsubset(nk, Age < 40)), "jsubset activated for nk") &&
        identical(grab(jsubset()), "jsubset active for nk: Age < 40\n") &&
        { quiet(jsubset(nk, off))
          has(grab(jsubset(nk, on)), "jsubset reactivated for nk: Age < 40") } &&
        has(flat(grab(jdesc(nk, Age))), "the jcomplete setting for the nk data frame names Tmp"))
reset()
rm(nf, nk, ne, nm, n_keep, n_per, n_l, n_v5, n_k11)

# =============================================================================
# SECTION O -- A NAME THAT IS NOT A DATA FRAME; MORE THAN ONE CONDITION; "1 row"
#              (S334)
# =============================================================================
# Four items in one build (v0.9.211).
#   by name    A setting is stored under its data frame's NAME, so the named
#              off and NULL act on it without the frame: jsubset(z, off) and
#              jsubset(z, NULL) -- and the jcomplete() forms -- work after z
#              has been removed, or given to something that is not a data
#              frame. Until 0.9.211 every such call met the resolver's "'z'
#              not found. Did you mean to use it as a variable name?", so
#              the named form could not reach the setting stored for it. on
#              is refused, because the setting cannot be checked without its
#              frame: "cannot be applied: z is no longer a data frame" (or
#              "z no longer exists"), "stays off" when it is off, and the way
#              to remove it. A name that carries no setting is refused as
#              one, with the status call. jsubset() does this whatever the
#              juse() default; jcomplete() leaves the call alone when a
#              default is set and nothing is stored under the name, since
#              jcomplete(v1, on) may be two variables of the default frame.
#   resolver   The shared first sentence: an input that EVALUATED to
#              something other than a data frame "is not a data frame"; one
#              that did not evaluate is still "not found".
#   conditions jsubset() takes one. A second after a comma was DROPPED
#              without a word under a juse() default (jsubset(Age < 40,
#              Gender == 1) stored Age < 40 and said "activated"), and a
#              third positional input met R's own "object not found" from
#              clear.all. Refused, with the joined call, which runs.
#   one row    The stored shape error said "for 1 rows".
# Workspace objects carry an o_ prefix (o_z, o_y, o_g, o_n: names nothing
# else defines); no juse() default unless a check sets one.
reset()

# ---- O01-O13: jsubset(), a name that is not a data frame --------------------
o_z <- d
quiet(jsubset(o_z, Age < 40)); quiet(jsubset(o_z, off)); o_z <- 1:3
.fo01 <- grab(jsubset(o_z, on))
check("O01 jsubset(o_z, on), o_z now a vector: the stored lead with no 'data frame' after the name, the cause, 'The filter stays off.', the delete exit",
      has(flat(.fo01), "jsubset(): the jsubset filter for o_z, Age < 40, cannot be applied: o_z is no longer a data frame.") &&
        has(.fo01, "data frame.\nThe filter stays off.\nTo delete it, run:\n  jsubset(o_z, NULL)") &&
        !has(.fo01, "not found") && !has(.fo01, "for the o_z data frame"))
check("O02 ... the filter is still stored and still off",
      identical(fs_of("o_z")$active, FALSE) &&
        identical(fs_of("o_z")$expr_str, "Age < 40"))
check("O03 ... and the printed delete line runs and removes it",
      { quiet(eval(parse(text = sub(".*To delete it, run:\n  ([^\n]*).*", "\\1", .fo01))))
        is.null(fs_of("o_z")) })
o_y <- d
quiet(jsubset(o_y, Age < 40)); o_y <- "text"
.fo04 <- grab(jsubset(o_y, on))
check("O04 an ACTIVE filter under a name that is not a data frame: the same lead, no 'stays off'",
      has(flat(.fo04), "the jsubset filter for o_y, Age < 40, cannot be applied: o_y is no longer a data frame.") &&
        has(.fo04, "data frame.\nTo delete it, run:\n  jsubset(o_y, NULL)") &&
        !has(.fo04, "stays off") && isTRUE(fs_of("o_y")$active))
check("O05 jsubset(o_y, off) turns the stored filter off by name, with the usual line",
      identical(grab(jsubset(o_y, off)), "jsubset deactivated for o_y.\n") &&
        identical(fs_of("o_y")$active, FALSE))
check("O06 jsubset(o_y, NULL) clears it by name, reporting what it had",
      identical(grab(jsubset(o_y, NULL)), "jsubset cleared for o_y (had: Age < 40).\n") &&
        is.null(fs_of("o_y")))
o_g <- d
quiet(jsubset(o_g, Age < 40)); quiet(jsubset(o_g, off)); rm(o_g)
.fo07 <- grab(jsubset(o_g, on))
check("O07 the name gone altogether: 'o_g no longer exists', stays off, the delete exit",
      has(flat(.fo07), "jsubset(): the jsubset filter for o_g, Age < 40, cannot be applied: o_g no longer exists.") &&
        has(.fo07, "exists.\nThe filter stays off.\nTo delete it, run:\n  jsubset(o_g, NULL)") &&
        !has(.fo07, "Did you mean"))
check("O08 ... off and NULL reach it by name all the same",
      identical(grab(jsubset(o_g, off)), "jsubset deactivated for o_g.\n") &&
        identical(grab(jsubset(o_g, NULL)), "jsubset cleared for o_g (had: Age < 40).\n") &&
        is.null(fs_of("o_g")))
o_n <- c(2.5, 3.5)
.fo09 <- grab(jsubset(o_n, off))
check("O09 a name that holds something else and carries NO filter: the name the subject, the status call the remedy -- the same for off, on and NULL",
      has(flat(.fo09), "jsubset(): o_n is not a data frame, and no jsubset filter is stored under that name.") &&
        has(.fo09, "name.\nTo see the filters that are set, run:\n  jsubset()") &&
        identical(grab(jsubset(o_n, on)), .fo09) &&
        identical(grab(jsubset(o_n, NULL)), .fo09) &&
        !has(.fo09, "Did you mean"))
.fo10 <- grab(jsubset(o_nowhere, off))
check("O10 a name found nowhere that carries no filter: 'was not found', the same remedy",
      has(flat(.fo10), "jsubset(): o_nowhere was not found, and no jsubset filter is stored under that name.") &&
        has(.fo10, "To see the filters that are set, run:\n  jsubset()") &&
        identical(grab(jsubset(o_nowhere, NULL)), .fo10))
quiet(juse(d))
o_z <- d; quiet(jsubset(o_z, Age < 40)); o_z <- 1:3
check("O11 the same under a juse() default: by-name off acts, and a name with no filter is refused as one (not read as a condition)",
      identical(grab(jsubset(o_z, off)), "jsubset deactivated for o_z.\n") &&
        identical(grab(jsubset(o_z, NULL)), "jsubset cleared for o_z (had: Age < 40).\n") &&
        has(flat(grab(jsubset(o_n, on))), "o_n is not a data frame, and no jsubset filter is stored under that name.") &&
        is.null(fs_of("d")))
reset()
o_d2 <- d; quiet(juse(o_d2)); quiet(jsubset(Age < 40)); rm(o_d2)
check("O12 the juse() default frame removed: the NAMED jsubset(o_d2, NULL) clears its filter (it said 'Default data frame o_d2 not found')",
      identical(grab(jsubset(o_d2, NULL)), "jsubset cleared for o_d2 (had: Age < 40).\n") &&
        is.null(fs_of("o_d2")))
reset()
quiet(jsubset(d, Age < 40)); quiet(jsubset(d, off))
check("O13 control: a name that IS a data frame takes the frame route as before",
      identical(grab(jsubset(d, on)), "jsubset reactivated for d: Age < 40\n") &&
        identical(grab(jsubset(e, off)), "No jsubset set for e. Nothing to deactivate.\n"))
reset()

# ---- O14-O22: jcomplete(), the same ------------------------------------------
o_z <- d
quiet(jcomplete(o_z, Age, Gender)); quiet(jcomplete(o_z, off)); o_z <- 1:3
.fo14 <- grab(jcomplete(o_z, on))
check("O14 jcomplete(o_z, on), o_z now a vector: the setting named by its variables, the cause, 'The setting stays off.', the clear exit",
      has(flat(.fo14), "jcomplete(): the jcomplete setting for o_z, Age, Gender, cannot be applied: o_z is no longer a data frame.") &&
        has(.fo14, "data frame.\nThe setting stays off.\nTo clear it, run:\n  jcomplete(o_z, NULL)") &&
        !has(.fo14, "not found") && identical(cs_of("o_z")$active, FALSE))
check("O15 ... the printed clear line runs and removes it",
      { quiet(eval(parse(text = sub(".*To clear it, run:\n  ([^\n]*).*", "\\1", .fo14))))
        is.null(cs_of("o_z")) })
o_y <- d
quiet(jcomplete(o_y, Age)); rm(o_y)
.fo16 <- grab(jcomplete(o_y, on))
check("O16 an ACTIVE setting whose name is gone: 'o_y no longer exists', no 'stays off'",
      has(flat(.fo16), "the jcomplete setting for o_y, Age, cannot be applied: o_y no longer exists.") &&
        has(.fo16, "exists.\nTo clear it, run:\n  jcomplete(o_y, NULL)") &&
        !has(.fo16, "stays off"))
check("O17 jcomplete(o_y, off) and jcomplete(o_y, NULL) act by name",
      identical(grab(jcomplete(o_y, off)), "jcomplete deactivated for o_y.\n") &&
        identical(cs_of("o_y")$active, FALSE) &&
        identical(grab(jcomplete(o_y, NULL)), "jcomplete cleared for o_y (had: Age).\n") &&
        is.null(cs_of("o_y")))
.fo18 <- grab(jcomplete(o_n, off))
check("O18 no default, a name with no setting: refused as one, the status call the remedy -- off, on and NULL alike",
      has(flat(.fo18), "jcomplete(): o_n is not a data frame, and no jcomplete setting is stored under that name.") &&
        has(.fo18, "name.\nTo see the settings that are stored, run:\n  jcomplete()") &&
        identical(grab(jcomplete(o_n, on)), .fo18) &&
        identical(grab(jcomplete(o_n, NULL)), .fo18) &&
        has(flat(grab(jcomplete(o_nowhere, off))), "jcomplete(): o_nowhere was not found, and no jcomplete setting is stored under that name."))
quiet(juse(d))
check("O19 WITH a default and nothing stored under the name, the call is left alone: the two items are read as variables of the default frame",
      has(flat(grab(jcomplete(o_n, on))), "jcomplete(): o_n and on were not found in the d data frame."))
o_on <- d; o_on$on <- o_on$Age; quiet(juse(o_on))
check("O20 ... so a variable really named on is still a variable: jcomplete(Age, on) sets both",
      { quiet(jcomplete(Age, on))
        identical(unname(cs_of("o_on")$vars), c("Age", "on")) })
reset(); quiet(juse(d))
o_z <- d; quiet(jcomplete(o_z, Age)); o_z <- 1:3
check("O21 with a default and a setting stored under the name, the by-name forms act",
      identical(grab(jcomplete(o_z, off)), "jcomplete deactivated for o_z.\n") &&
        has(flat(grab(jcomplete(o_z, on))), "the jcomplete setting for o_z, Age, cannot be applied: o_z is no longer a data frame.") &&
        identical(grab(jcomplete(o_z, NULL)), "jcomplete cleared for o_z (had: Age).\n"))
reset()
quiet(jcomplete(d, Age)); quiet(jcomplete(d, off))
check("O22 control: a name that IS a data frame takes the frame route as before",
      identical(grab(jcomplete(d, on)), "jcomplete reactivated for d: Age\n") &&
        identical(grab(jcomplete(e, off)), "No jcomplete filter set for e.\n"))
reset()

# ---- O23-O25: the resolver's first sentence ---------------------------------
.fo23 <- grab(jcorr(o_n))
check("O23 jcorr(o_n), o_n a workspace vector, no default: 'is not a data frame', the question, and both fixes with each call on a line of its own (S355)",
      has(flat(.fo23), "jcorr(): 'o_n' is not a data frame. Did you mean to use it as a variable name?") &&
        has(.fo23, "name?\nIf so, name the data frame first:\n  jcorr(MyData, o_n)\nOr set a default first, then run the call:\n  juse(MyData)\n  jcorr(o_n)") &&
        !has(.fo23, "not found"))
.fo24 <- grab(jcorr(o_nowhere))
check("O24 a name found nowhere is still 'not found'",
      has(flat(.fo24), "jcorr(): 'o_nowhere' not found. Did you mean to use it as a variable name?") &&
        !has(.fo24, "is not a data frame"))
check("O25 the sentence is the shared resolver's: jalpha(), jdummy(), jsubset() and jcomplete() say it too",
      has(grab(jalpha(o_n)), "jalpha(): 'o_n' is not a data frame. Did you mean") &&
        has(grab(jdummy(o_n)), "jdummy(): 'o_n' is not a data frame. Did you mean") &&
        has(grab(jsubset(o_n, Age < 30)), "jsubset(): 'o_n' is not a data frame. Did you mean") &&
        has(grab(jcomplete(o_n, Age)), "jcomplete(): 'o_n' is not a data frame. Did you mean"))

# ---- O26-O37: more than one condition ---------------------------------------
reset(); quiet(juse(d))
.fo26 <- grab(jsubset(Age < 40, Gender == 1))
check("O26 two conditions under a default: named, refused, the joined call offered -- and NOTHING stored (it stored Age < 40 and said 'activated')",
      identical(.fo26, paste0(
        "jsubset(): two conditions were given, Age < 40 and Gender == 1, and\n",
        "jsubset() takes one.\n",
        "Join them with & (and) or | (or):\n",
        "  jsubset(Age < 40 & Gender == 1)")) &&
        is.null(fs_of("d")))
.fix_o <- function(msg) sub(".*\n  (jsubset\\([^\n]*)$", "\\1", msg)
check("O27 ... the printed line runs and stores the joined filter: 1 of the 12 rows kept (Ann, 30)",
      { quiet(eval(parse(text = .fix_o(.fo26))))
        identical(fs_of("d")$expr_str, "Age < 40 & Gender == 1") &&
          any(grepl("^ +jsubset\\(\\) +11 +1 +Age < 40 & Gender == 1", plines(jdesc(d, Age)))) })
check("O28 an earlier filter is left as it was by a refused call",
      { quiet(grab(jsubset(Age > 50, Gender == 2)))
        identical(fs_of("d")$expr_str, "Age < 40 & Gender == 1") && isTRUE(fs_of("d")$active) })
reset(); quiet(juse(d))
.fo29 <- grab(jsubset(Age < 30 | Age > 50, Gender == 1))
check("O29 a condition joined inside by | is parenthesized in the offered call, which runs: & binds tighter",
      has(.fo29, "\n  jsubset((Age < 30 | Age > 50) & Gender == 1)") &&
        { quiet(eval(parse(text = .fix_o(.fo29))))
          identical(fs_of("d")$expr_str, "(Age < 30 | Age > 50) & Gender == 1") &&
            identical(sum(with(d, (Age < 30 | Age > 50) & Gender == 1), na.rm = TRUE), 2L) &&
            any(grepl("^ +jsubset\\(\\) +10 +2 ", plines(jdesc(d, Age)))) })
reset()
.fo30 <- grab(jsubset(d, Age < 40, Gender == 1))
check("O30 a named frame and two conditions: the frame leads the offered call (R's own \"object 'Gender' not found\" answered)",
      identical(.fo30, paste0(
        "jsubset(): two conditions were given, Age < 40 and Gender == 1, and\n",
        "jsubset() takes one.\n",
        "Join them with & (and) or | (or):\n",
        "  jsubset(d, Age < 40 & Gender == 1)")) &&
        is.null(fs_of("d")) &&
        { quiet(eval(parse(text = .fix_o(.fo30))))
          identical(fs_of("d")$expr_str, "Age < 40 & Gender == 1") })
reset(); quiet(juse(d))
.fo31 <- grab(jsubset(Age < 40, Gender == 1, Keep01 == 1))
check("O31 three conditions: counted in words, and-joined, all three in the offered call",
      has(flat(.fo31), "jsubset(): three conditions were given, Age < 40, Gender == 1, and Keep01 == 1, and jsubset() takes one.") &&
        has(.fo31, "\n  jsubset(Age < 40 & Gender == 1 & Keep01 == 1)") &&
        is.null(fs_of("d")))
.fo32 <- grab(jsubset(, Age < 40, Gender == 1))
check("O32 the leading-comma form with two conditions: the same refusal",
      has(flat(.fo32), "two conditions were given, Age < 40 and Gender == 1, and jsubset() takes one.") &&
        has(.fo32, "\n  jsubset(Age < 40 & Gender == 1)") && is.null(fs_of("d")))
.fo33 <- grab(jsubset(Age < 40, on))
check("O33 a condition where the frame goes, then on: not two conditions -- the word acts on a data frame's filter, with the default form",
      has(flat(.fo33), "jsubset(): on acts on a data frame's stored filter, and Age < 40 is not a data frame.") &&
        has(.fo33, "data frame.\nFor the juse() default data frame, run:\n  jsubset(on)") &&
        !has(.fo33, "conditions were given") && is.null(fs_of("d")))
check("O34 ... and the same for off and NULL",
      has(grab(jsubset(Age < 40, off)), "jsubset(): off acts on a data frame's stored filter") &&
        has(grab(jsubset(Age < 40, off)), "\n  jsubset(off)") &&
        has(grab(jsubset(Age < 40, NULL)), "jsubset(): NULL acts on a data frame's stored filter") &&
        has(grab(jsubset(Age < 40, NULL)), "\n  jsubset(NULL)"))
check("O35 controls: one condition, with and without the frame, is stored as typed; clear.all = TRUE still clears; a single = is still the single-= message",
      has(grab(jsubset(Age < 40 & Gender == 1)), "jsubset activated for d: Age < 40 & Gender == 1") &&
        has(grab(jsubset(e, Age > 50)), "jsubset activated for e: Age > 50") &&
        has(grab(jsubset(clear.all = TRUE)), "jsubset cleared") &&
        is.null(fs_of("d")) && is.null(fs_of("e")) &&
        has(flat(grab(jsubset(Gender = 1))), "uses a single =, which does not test equality in R."))
# O36 FLIPPED at S338: the helper declined a third input of off, on or NULL
# and the call went on to R's own "object 'on' not found"; it is refused now
# (section R holds the message). An EMPTY input is still left alone.
check("O36 a third input of off, on or NULL is refused, not left to R (S338; the helper declined); an empty input is still passed over",
      errs(jstats:::.jst_extra_conditions_stop(
        list(quote(d), quote(Age < 40), quote(on)), globalenv())) &&
        errs(jstats:::.jst_extra_conditions_stop(
          list(quote(d), quote(Age < 40), NULL), globalenv())) &&
        is.null(jstats:::.jst_extra_conditions_stop(
          list(quote(d), quote(expr = ), quote(on)), globalenv())))
check("O37 the new messages wrap inside the 76 pin",
      all(vapply(list(.fo01, .fo04, .fo07, .fo09, .fo10, .fo14, .fo16, .fo18,
                      .fo23, .fo26, .fo30, .fo31, .fo33), widest, numeric(1)) <= 76L))
reset()

# ---- O38-O39: "1 row" -------------------------------------------------------
# o_v3 is one TRUE when the filter is set (ruling R19, S357, refuses a
# vector of one value per case), and three values once the frame is cut.
o_m <- d[1:3, ]; o_v3 <- TRUE
quiet(jsubset(o_m, Age > 0 & o_v3)); o_m <- o_m[1, , drop = FALSE]
o_v3 <- c(TRUE, FALSE, TRUE)
.fo38 <- grab(jdesc(o_m, Age))
check("O38 a stored filter on a frame cut to ONE row: '3 values for 1 case.' (S359; it said '1 row')",
      has(flat(.fo38), "the jsubset filter for the o_m data frame, Age > 0 & o_v3, cannot be applied: o_v3 is not in the o_m data frame; it is a separate object in your workspace, with 3 values for 1 case.") &&
        !has(.fo38, "1 cases"))
o_m <- d[1:2, ]
check("O39 control: two are 'cases'",
      has(flat(grab(jdesc(o_m, Age))), "with 3 values for 2 cases."))
reset()
rm(list = intersect(c("o_z", "o_y", "o_g", "o_n", "o_on", "o_m", "o_v3", "o_d2"), ls()))

# =============================================================================
# Q -- A COUNT AGREES IN NUMBER (S338; the S287 plural item)
# =============================================================================
# Eleven runtime strings hedged a count with "(s)" or "(ies)". Each now
# agrees with its count through .jst_plural(). The four group-count sites
# (jt, jaov twice, jcrosstab) and the two model stops are models_check.R's,
# section K; the rest are here, with the not-found message, which took its
# S338 form in the same build: what was typed is the subject, the verb
# agrees, and the frame takes its article and kind. P03, at the foot, sweeps
# every message this battery takes for a shortcut that survived.
reset()
.pl <- jstats:::.jst_plural
check("Q01 .jst_plural(): one is singular; zero, two, a fraction and NA are plural; the default plural adds s; a phrase carries its verb",
      identical(.pl(1, "category", "categories"), "category") &&
        identical(.pl(1L, "input"), "input") &&
        identical(.pl(0, "category", "categories"), "categories") &&
        identical(.pl(2L, "input"), "inputs") &&
        identical(.pl(1.5, "input"), "inputs") &&
        identical(.pl(NA, "input"), "inputs") &&
        identical(.pl(1, "This predictor has", "These predictors have"),
                  "This predictor has") &&
        identical(.pl(3, "This predictor has", "These predictors have"),
                  "These predictors have"))
.q02 <- grab(jdesc(d, Agee))
check("Q02 one variable not found: it is the subject, with 'was' -- the whole message (it read 'Variable(s) not found in d: Agee.')",
      identical(.q02, paste0("jdesc(): Agee was not found in the d data frame.\n",
                             "Check the spelling.")))
.q03 <- grab(jdesc(d, Agee, Gendr))
check("Q03 two: and-joined, with 'were'",
      identical(.q03, paste0("jdesc(): Agee and Gendr were not found in the d data frame.\n",
                             "Check the spelling.")))
check("Q04 three: the Oxford comma, and a variable the frame has is not listed",
      has(grab(jdesc(d, Agee, Age, Gendr, Nope)),
          "jdesc(): Agee, Gendr, and Nope were not found in the d data frame.\n"))
quiet(juse(d))
.q05 <- grab(jdesc(Agee))
check("Q05 under the juse() default the hint still closes the message, on a line of its own",
      has(.q05, "jdesc(): Agee was not found in the d data frame.\nCheck the spelling.\nd is the juse() default") &&
        has(flat(.q05), "d is the juse() default -- if you meant a different data frame, name it in the call."))
quiet(juse(NULL))
check("Q06 with no name for the data frame: 'the data frame', the article not doubled",
      { m <- grab(jstats:::.jst_check_vars(d, c("Agee", "Gendr"), NULL))
        has(m, "Agee and Gendr were not found in the data frame.\nCheck the spelling.") &&
          !has(m, "the the") })
check("Q07 the same message from a formula function and from a column typed with $",
      has(grab(jt(Age ~ Gendr, d)),
          "jt(): Gendr was not found in the d data frame.\nCheck the spelling.") &&
        has(grab(jfreq(d$Gendr)),
            "jfreq(): Gendr was not found in the d data frame.\nCheck the spelling."))
check("Q08 one unused input; two unused inputs",
      identical(grab(jdesc(d, Age, digit = 2)), "jdesc(): unused input: digit") &&
        identical(grab(jdesc(d, Age, digit = 2, foo = 1)),
                  "jdesc(): unused inputs: digit, foo"))
check("Q09 jdeclare_missing(): one variable name given twice; two names given twice",
      has(flat(grab(jdeclare_missing(d, Age, Age, codes = -99, convention = "spss"))),
          "jdeclare_missing(): variable name given more than once: 'Age'.") &&
        has(flat(grab(jdeclare_missing(d, Age, Age, Gender, Gender, codes = -99,
                                       convention = "spss"))),
            "jdeclare_missing(): variable names given more than once: 'Age', 'Gender'."))
check("Q10 one invalid plot name; two",
      has(grab(jstats:::.jst_resolve_which("zzz", "fit", c("fit", "qq"), "jst_lm")),
          "Invalid plot name for class 'jst_lm': 'zzz'.\n") &&
        has(grab(jstats:::.jst_resolve_which(c("zzz", "yyy"), "fit",
                                             c("fit", "qq"), "jst_lm")),
            "Invalid plot names for class 'jst_lm': 'zzz', 'yyy'.\n"))
rm(.pl)
reset()

# =============================================================================
# R -- THE FRONT DOORS (S338): no variables; an empty vector; off, on or NULL
#      given with a condition; the frame kept in a fix line; jfreq()'s title
# =============================================================================
# pre(): what a call PRINTS before it stops (stdout, colour stripped, empty
# lines dropped -- the colour reset after a title's newline leaves one). The
# title claims are about this, and grab() swallows it.
pre <- function(expr) {
  ln <- plines(tryCatch(expr, error = function(e) invisible(NULL)))
  ln[nzchar(ln)]
}
# .fix_all(): every indented jsubset(...) line of a message, as typed.
.fix_all <- function(msg) {
  ln <- strsplit(msg, "\n", fixed = TRUE)[[1]]
  trimws(ln[grepl("^  jsubset\\(", ln)])
}

# ---- R01-R05: no variables (the Session 74 item) ----------------------------
reset()
.r01 <- grab(jfreq(d)); .r02 <- grab(jdesc(d))
check("R01 jfreq(d) with no variables stops, the whole message, and prints nothing first (it printed its title and '12 Cases in the 0 Variable Pool')",
      identical(.r01, paste0("jfreq(): no variables specified.\n",
                             "Provide one or more variable names, for example:\n",
                             "  jfreq(community, Region)")) &&
        identical(pre(jfreq(d)), character(0)))
check("R02 jdesc(d) likewise (it stopped over an empty bullet), and with by = alone",
      identical(.r02, paste0("jdesc(): no variables specified.\n",
                             "Provide one or more variable names, for example:\n",
                             "  jdesc(community, Age, Income)")) &&
        identical(grab(jdesc(d, by = Gender)), .r02) &&
        identical(pre(jdesc(d)), character(0)))
quiet(juse(d))
check("R03 the bare calls under a juse() default: the same two stops (jfreq() printed '12 Cases in the 0 Variable Pool'), with subset = alone too",
      has(grab(jfreq()), "jfreq(): no variables specified.\n") &&
        has(grab(jdesc()), "jdesc(): no variables specified.\n") &&
        identical(grab(jfreq()), .r01) && identical(grab(jdesc()), .r02) &&
        identical(grab(jfreq(subset = Age < 40)), .r01) &&
        identical(grab(jdesc(subset = Age < 40)), .r02))
check("R04 controls under the default: a variable still runs, and jscreen() with none still screens every variable",
      !errs(jfreq(Gender)) && !errs(jdesc(Age)) &&
        any(grepl("^ +Variables: 6$", plines(jscreen()))))
quiet(juse(NULL))
# The example lines name the shipped community data frame. They are run in
# an environment of their own that holds it, so a community data frame in
# the workspace is neither read nor replaced.
check("R05 each example line names real variables of the shipped data, and runs",
      { env <- new.env(parent = globalenv())
        env$community <- jstats:::.jst_get_package_dataset("community")
        last <- function(m) trimws(tail(strsplit(m, "\n", fixed = TRUE)[[1]], 1L))
        is.data.frame(env$community) &&
          identical(last(.r01), "jfreq(community, Region)") &&
          !errs(eval(parse(text = last(.r01)), envir = env)) &&
          identical(last(.r02), "jdesc(community, Age, Income)") &&
          !errs(eval(parse(text = last(.r02)), envir = env)) })

# ---- R06-R10: an empty vector (the S324 item) -------------------------------
reset()
x0 <- numeric(0)
.r06 <- c(grab(jdesc(numeric(0))), grab(jfreq(numeric(0))), grab(jscreen(numeric(0))))
check("R06 an empty vector is refused as typed, by jdesc(), jfreq() and jscreen() (each named the internal frame: 'the temp_df data frame has no rows')",
      identical(flat(.r06), paste0(c("jdesc", "jfreq", "jscreen"),
                                   "(): numeric(0) has no values, so there is nothing to analyze.")))
check("R07 ... a name and a computed vector are echoed as typed",
      identical(grab(jdesc(x0)),
                "jdesc(): x0 has no values, so there is nothing to analyze.") &&
        has(flat(grab(jfreq(d$Gender[d$Gender > 100]))),
            "jfreq(): d$Gender[d$Gender > 100] has no values, so there is nothing to analyze."))
check("R08 ... ahead of the title, and ahead of the single-column refusals (a subset = naming another variable)",
      identical(pre(jdesc(numeric(0))), character(0)) &&
        identical(pre(jscreen(numeric(0))), character(0)) &&
        identical(grab(jdesc(x0, subset = Gender == 1)),
                  "jdesc(): x0 has no values, so there is nothing to analyze."))
r_e0 <- d[0L, , drop = FALSE]
check("R09 a column of a data frame with no rows keeps the frame's own stop, under the title",
      has(flat(grab(jdesc(r_e0$Age))),
          "jdesc(): the r_e0 data frame has no rows, so there is nothing to analyze.") &&
        identical(pre(jdesc(r_e0$Age)), "Descriptive Statistics"))
check("R10 controls: no message names temp_df, and a vector with values is analyzed as before",
      !any(grepl("temp_df", c(.r06, grab(jdesc(x0)), grab(jdesc(r_e0$Age))), fixed = TRUE)) &&
        !errs(jdesc(c(1, 2, 3))) && !errs(jfreq(c(1, 2, 2))))
rm(x0, r_e0)

# ---- R11-R19: off, on or NULL given with a condition (the S334 item) --------
reset()
.r11 <- grab(jsubset(d, Age < 40, on))
check("R11 jsubset(d, Age < 40, on): the whole message (R said \"object 'on' not found\"), and nothing stored",
      identical(.r11, paste0(
        "jsubset(): on turns a stored filter back on and takes no condition.\n",
        "Age < 40 was given with it.\n",
        "To set the filter, run:\n",
        "  jsubset(d, Age < 40)\n",
        "To turn the stored filter back on, run:\n",
        "  jsubset(d, on)")) &&
        is.null(fs_of("d")))
check("R12 ... both printed lines run, in order: the first stores the filter, the second finds it on",
      { fx <- .fix_all(.r11)
        length(fx) == 2L &&
          has(grab(eval(parse(text = fx[1L]))), "jsubset activated for d: Age < 40") &&
          has(grab(eval(parse(text = fx[2L]))), "jsubset reactivated for d: Age < 40") &&
          isTRUE(fs_of("d")$active) })
reset()
.r13 <- grab(jsubset(d, Age < 40, off))
check("R13 off: its own verb in the sentence and over the second line",
      identical(.r13, paste0(
        "jsubset(): off turns a stored filter off and takes no condition.\n",
        "Age < 40 was given with it.\n",
        "To set the filter, run:\n",
        "  jsubset(d, Age < 40)\n",
        "To turn the stored filter off, run:\n",
        "  jsubset(d, off)")))
.r14 <- grab(jsubset(d, Age < 40, NULL))
check("R14 NULL: 'deletes', and jsubset(d, NULL) as the second line (it said `clear.all` must be TRUE or FALSE)",
      identical(.r14, paste0(
        "jsubset(): NULL deletes a stored filter and takes no condition.\n",
        "Age < 40 was given with it.\n",
        "To set the filter, run:\n",
        "  jsubset(d, Age < 40)\n",
        "To delete the stored filter, run:\n",
        "  jsubset(d, NULL)")) &&
        !has(.r14, "clear.all"))
check("R15 the word first and the condition after it: the same message; a word typed in capitals is echoed as typed, and its line runs",
      identical(grab(jsubset(d, on, Age < 40)), .r11) &&
        { m <- grab(jsubset(d, Age < 40, ON)); fx <- .fix_all(m)
          has(m, "jsubset(): ON turns a stored filter back on") &&
            identical(fx[2L], "jsubset(d, ON)") &&
            !errs(eval(parse(text = fx[2L]))) })
reset()
.r16 <- grab(jsubset(d, Age < 30 | Age > 50, Gender == 1, off))
check("R16 two conditions and a word: both named, and joined in the first line with the | one parenthesized; that line runs",
      has(.r16, "condition.\nAge < 30 | Age > 50 and Gender == 1 were given with it.\n") &&
        has(.r16, "\n  jsubset(d, (Age < 30 | Age > 50) & Gender == 1)\n") &&
        { quiet(eval(parse(text = .fix_all(.r16)[1L])))
          identical(fs_of("d")$expr_str, "(Age < 30 | Age > 50) & Gender == 1") })
reset()
check("R17 two words and no condition: one sentence, no line to run",
      identical(flat(grab(jsubset(d, off, on))),
                "jsubset(): off and on were given together, and jsubset() takes one of them at a time."))
quiet(juse(d))
.r18 <- grab(jsubset(, Age < 40, on))
check("R18 the leading-comma form, with no frame named: the lines name none",
      has(.r18, "\n  jsubset(Age < 40)\n") && has(.r18, "\n  jsubset(on)") &&
        !has(.r18, "jsubset(d,"))
check("R19 control: the S334 sibling is unchanged -- a condition where the frame goes, then on",
      has(flat(grab(jsubset(Age < 40, on))),
          "jsubset(): on acts on a data frame's stored filter, and Age < 40 is not a data frame."))
quiet(juse(NULL))

# ---- R20-R23: a fix line keeps the frame the call named (the S290 item) -----
# A07, A15 and G03 hold the three lines as printed. Here: each one RUNS, and
# the default forms still name no frame.
reset()
check("R20 the single-= line with the frame runs, and stores the corrected filter for d",
      { fx <- .fix_all(grab(jsubset(d, (Gender = 1) & (Age < 40))))
        identical(fx, "jsubset(d, (Gender == 1) & (Age < 40))") &&
          !errs(eval(parse(text = fx))) &&
          identical(fs_of("d")$expr_str, "(Gender == 1) & (Age < 40)") })
reset()
check("R21 the named-item line and the NOT line with the frame run too",
      { a <- .fix_all(grab(jsubset(d, Gender = 1)))
        b <- .fix_all(grab(jsubset(d, NOT(Age < 40))))
        identical(a, "jsubset(d, Gender == 1)") && !errs(eval(parse(text = a))) &&
          identical(b, "jsubset(d, !(Age < 40))") && !errs(eval(parse(text = b))) &&
          identical(fs_of("d")$expr_str, "!(Age < 40)") })
reset(); quiet(juse(d))
check("R22 under a juse() default, with no frame typed, the three lines name none (as before)",
      identical(.fix_all(grab(jsubset((Gender = 1) & (Age < 40)))),
                "jsubset((Gender == 1) & (Age < 40))") &&
        identical(.fix_all(grab(jsubset(Gender = 1))), "jsubset(Gender == 1)") &&
        identical(.fix_all(grab(jsubset(NOT(Age < 40)))), "jsubset(!(Age < 40))"))
quiet(juse(NULL))
check("R23 without a default, the line that drops the frame cannot run -- which is why it is kept",
      errs(jsubset((Gender == 1) & (Age < 40))) &&
        !errs(jsubset(d, (Gender == 1) & (Age < 40))))
# A refused call runs nothing (found S338). The resolver evaluated a
# condition typed where the frame goes, to see whether it was a data frame;
# evaluating (Gender = 1) & (Age < 40) ran the assignment, so the refusal
# left Gender <- 1 in the workspace. The fixture's variable has a name no
# workspace holds, so the check cannot be satisfied by an object that was
# already there.
reset()
r_w <- data.frame(zz_r_grp = c(1, 2, 1, 2), Age = c(30, 45, 50, 38))
quiet(juse(r_w))
.r23b <- grab(jsubset((zz_r_grp = 1) & (Age < 40)))
check("R23b jsubset((zz_r_grp = 1) & (Age < 40)) under a default: the single-= refusal, and no zz_r_grp left in the workspace (the refused call assigned it)",
      has(flat(.r23b), "jsubset(): (zz_r_grp = 1) & (Age < 40) uses a single =, which does not test equality in R.") &&
        has(.r23b, "\n  jsubset((zz_r_grp == 1) & (Age < 40))") &&
        !exists("zz_r_grp", envir = globalenv(), inherits = FALSE) &&
        is.null(fs_of("r_w")))
quiet(juse(NULL))
check("R23c with no default: the same refusal (it said 'not found' and offered the call with its single = still in it), and nothing assigned",
      identical(grab(jsubset((zz_r_grp = 1) & (Age < 40))), .r23b) &&
        !exists("zz_r_grp", envir = globalenv(), inherits = FALSE))
check("R23d control: a condition with no single = is evaluated and set as before",
      { quiet(juse(r_w))
        ok <- has(grab(jsubset((zz_r_grp == 1) & (Age < 40))),
                  "jsubset activated for r_w: (zz_r_grp == 1) & (Age < 40)")
        quiet(juse(NULL)); ok })
rm(r_w)

# ---- R24-R28: jfreq() prints its title before the filters run (S334 item) ---
reset()
r_s <- d; r_k <- 30; quiet(jsubset(r_s, Age > r_k)); rm(r_k)   # a value (R19, S357)
check("R24 a stored filter that can no longer be applied: jfreq() stops under its title (it stopped bare), as the other four do under theirs",
      identical(pre(jfreq(r_s, Gender)), "Frequencies") &&
        identical(pre(jdesc(r_s, Age)), "Descriptive Statistics") &&
        identical(pre(jscreen(r_s, Age)), "Data Screening") &&
        identical(pre(jcorr(r_s, Age, Keep01)), "Pearson Bivariate Correlation") &&
        identical(pre(jcorr(r_s, Age, Keep01, Gender)), "Pearson Bivariate Correlations") &&
        identical(pre(jalpha(r_s, Age, Keep01, Gender)), "Reliability Analysis") &&
        has(flat(grab(jfreq(r_s, Gender))),
            "jfreq(): the jsubset filter for the r_s data frame, Age > r_k, cannot be applied: r_k no longer exists."))
quiet(jsubset(r_s, NULL))
check("R25 a subset = that is refused, and a data frame with no rows: under the title too",
      identical(pre(jfreq(d, Gender, subset = Keep01)), "Frequencies") &&
        identical(pre(jfreq(d[0L, ], Gender)), "Frequencies"))
# Its own frame, with variable names no workspace holds: under a juse()
# default jfreq(Gender) describes a workspace object named Gender, when
# there is one, in place of the default frame's variable (found S338 by
# entering this battery with such an object; logged as a to-do item).
r_t <- data.frame(zz_r_g = c(1, 2, 1, 2), zz_r_k = c(1, 0, 1, 0))
quiet(juse(r_t))
check("R26 under a juse() default the default-data line follows the title, ahead of the stop",
      identical(pre(jfreq(zz_r_g, subset = zz_r_k)),
                c("Frequencies", "Using default data frame: r_t")))
quiet(juse(NULL)); rm(r_t)
check("R27 the variable-list stops still come before the title: not found, a named item, no variables",
      identical(pre(jfreq(d, Gendr)), character(0)) &&
        identical(pre(jfreq(d, Gender, digit = 2)), character(0)) &&
        identical(pre(jfreq(d)), character(0)))
check("R28 a run that succeeds prints the title once, first, as before",
      { ln <- plines(jfreq(d, Gender))
        identical(ln[1L], "Frequencies") && sum(ln == "Frequencies") == 1L })
rm(r_s, pre, .fix_all)
reset()

# =============================================================================
# S -- THE REGISTRATION VERBS' FRONT DOOR; A COMPUTED VECTOR; A LIST COLUMN
#      (S342, Fix Slate 4)
# =============================================================================
# (1) jdummy(z, NULL) and jdummy(z, v, remove = TRUE), and the jnumeric(),
# jcount() and jlikert() forms, act on the registrations stored under a NAME
# whose data frame is gone, as jsubset() and jcomplete() have since v0.9.211
# (the S334 item; Jeff's lean 3). (2) An expression given as the data is
# refused, with two lines that run; a place such as lst$d is accepted, and
# the note's file is named for its last part (the S339 item; lean 1). (3) A
# computed vector's table is titled with the expression as typed, and its
# refusals give the sentence without a fix line (the S338 item). (4) jfreq()
# takes the analysis functions' type stop for a list or raw column, before
# its title (the S213 item; lean 4). The type refusals and jdummy()'s ref
# stop are pinned in models_check.R, section M; S29 takes each once here so
# that the sweeps at the foot read them. Fixture names carry the section's
# letter (zs, s_mk, s_lst, s_L), so that none can be a user's own object.
reset()
quiet(jdummy(clear.all = TRUE)); quiet(jnumeric(clear.all = TRUE))
quiet(jcount(clear.all = TRUE)); quiet(jlikert(clear.all = TRUE))
.s_dummy <- function(nm) {
  ds <- jstats:::.jst_get_dummy(nm)
  if (is.null(ds)) character(0) else
    vapply(ds, function(r) r$var_name, character(1))
}
.s_reg <- function(nm) {
  r <- jstats:::.jst_get_registry(nm)
  if (is.null(r)) character(0) else
    vapply(r, function(x) paste0(x$var_name, ":", x$kind), character(1),
           USE.NAMES = FALSE)
}
.s_code <- function(msg) {
  ln <- strsplit(msg, "\n", fixed = TRUE)[[1]]
  sub("^  ", "", ln[grepl("^  ", ln)])
}
# .s_pre(): what a call prints before it stops (section R's pre(), removed
# with that section's helpers).
.s_pre <- function(expr) {
  ln <- plines(tryCatch(expr, error = function(e) invisible(NULL)))
  ln[nzchar(ln)]
}
.s_set <- function() {
  assign("zs", d, envir = globalenv())
  quiet(jdummy(zs, Condition)); quiet(jnumeric(zs, Gender))
  quiet(jcount(zs, Age));       quiet(jlikert(zs, Keep01))
}

# ---- S01-S09: a named clear or removal whose name is not a data frame -------
.s_set(); zs <- 1:3
.s01 <- grab(jdummy(zs, NULL))
check("S01 jdummy(zs, NULL) with zs no longer a data frame clears the registrations stored under zs (it stopped: \"'zs' is not a data frame. Did you mean to use it as a variable name?\")",
      identical(.s01, "Dummy registrations cleared for zs: Condition.\n") &&
        length(.s_dummy("zs")) == 0L)
check("S02 jnumeric(), jcount() and jlikert() the same, each clearing its own kind and leaving the others",
      identical(grab(jnumeric(zs, NULL)),
                "Numeric registrations cleared for zs: Gender.\n") &&
        setequal(.s_reg("zs"), c("Age:count", "Keep01:likert")) &&
        identical(grab(jcount(zs, NULL)),
                  "Count registrations cleared for zs: Age.\n") &&
        identical(grab(jlikert(zs, NULL)),
                  "Likert registrations cleared for zs: Keep01.\n") &&
        length(.s_reg("zs")) == 0L)
.s_set(); rm(zs)
check("S03 with zs removed altogether: remove = TRUE takes one registration off by name, in all four verbs",
      identical(grab(jdummy(zs, Condition, remove = TRUE)),
                "Dummy registration removed for 'Condition' in zs.\n") &&
        identical(grab(jnumeric(zs, Gender, remove = TRUE)),
                  "Numeric registration removed for 'Gender' in zs.\n") &&
        identical(grab(jlikert(zs, Keep01, remove = TRUE)),
                  "Likert registration removed for 'Keep01' in zs.\n") &&
        identical(.s_reg("zs"), "Age:count") && length(.s_dummy("zs")) == 0L)
check("S04 ... a variable that carries none is said to, and the one that does is left",
      identical(grab(jcount(zs, Gender, remove = TRUE)),
                "No count registration to remove for 'Gender' in zs.\n") &&
        identical(.s_reg("zs"), "Age:count"))
quiet(jcount(clear.all = TRUE))
.s05 <- grab(jdummy(zs, NULL))
check("S05 a named clear with nothing stored under the name is refused as a name -- the whole message (zs removed: \"was not found\")",
      identical(flat(.s05),
                paste0("jdummy(): zs was not found, and no dummy registrations ",
                       "are stored under that name. To see the registrations ",
                       "that are stored, run:   jdummy()")) &&
        identical(.s_code(.s05), "jdummy()"))
zs <- 1:3
check("S06 ... \"is not a data frame\" when the name holds something else, and each verb names its own kind and its own status call",
      has(flat(grab(jnumeric(zs, NULL))),
          paste0("jnumeric(): zs is not a data frame, and no numeric ",
                 "registrations are stored under that name.")) &&
        identical(.s_code(grab(jnumeric(zs, NULL))), "jnumeric()") &&
        has(flat(grab(jlikert(zs, NULL))),
            "no Likert registrations are stored under that name.") &&
        identical(.s_code(grab(jcount(zs, NULL))), "jcount()"))
rm(zs)
check("S07 the status call the stop offers runs",
      !errs(eval(parse(text = .s_code(.s05)))))
.s_set(); rm(zs)
check("S08 REGISTERING under a name that is not a data frame stays refused, by the resolver as before, and adds nothing (Jeff's lean 3)",
      has(flat(grab(jdummy(zs, Gender))),
          "jdummy(): 'zs' not found. Did you mean to use it as a variable name?") &&
        has(flat(grab(jnumeric(zs, Age))),
            "jnumeric(): 'zs' not found. Did you mean to use it as a variable name?") &&
        identical(.s_dummy("zs"), "Condition") &&
        setequal(.s_reg("zs"), c("Gender:numeric", "Age:count", "Keep01:likert")))
quiet(jdummy(clear.all = TRUE)); quiet(jnumeric(clear.all = TRUE))
quiet(jcount(clear.all = TRUE)); quiet(jlikert(clear.all = TRUE))
check("S09 a removal with nothing stored under the name is left to the resolver: the variable-name reading, as before",
      has(flat(grab(jdummy(zs, Gender, remove = TRUE))),
          "jdummy(): 'zs' not found. Did you mean to use it as a variable name?"))
.s_set(); rm(zs); quiet(juse(d))
check("S10 under a juse() default a name that carries registrations is still served by name, clear and removal",
      identical(grab(jnumeric(zs, Gender, remove = TRUE)),
                "Numeric registration removed for 'Gender' in zs.\n") &&
        identical(grab(jdummy(zs, NULL)),
                  "Dummy registrations cleared for zs: Condition.\n"))
check("S11 ... and one that carries none is read as before, as a variable of the default data frame: the removal, and the named clear too (no dummy registration is left under zs)",
      has(grab(jdummy(zs, Gender, remove = TRUE)),
          "jdummy(): zs was not found in the d data frame.") &&
        has(flat(grab(jdummy(zs, NULL))),
            "jdummy(): zs and NULL were not found in the d data frame.") &&
        setequal(.s_reg("zs"), c("Age:count", "Keep01:likert")))
quiet(juse(NULL))
quiet(jcount(clear.all = TRUE)); quiet(jlikert(clear.all = TRUE))
check("S12 control: a name that holds a data frame goes the ordinary way",
      identical(grab(jdummy(e, NULL)), "No dummy registrations to clear for e.\n") &&
        identical(grab(jnumeric(e, Age, remove = TRUE)),
                  "No numeric registration to remove for 'Age' in e.\n"))

# ---- S13-S22: an expression given as the data (the S339 item) ---------------
s_mk <- function() d
s_lst <- list(s_dd = d)
.s13 <- grab(jnumeric(s_mk(), Age))
check("S13 jnumeric(s_mk(), Age) is refused -- the whole message: what was typed is the subject, then two lines (it registered under the name \"s_mk()\" and printed jsave(s_mk(), \"s_mk().rds\"))",
      identical(flat(.s13),
                paste0("jnumeric(): s_mk() is not a name, and a registration is ",
                       "stored under its data frame's name. Give the data ",
                       "frame a name first, then register:   mydata <- s_mk()   ",
                       "jnumeric(mydata, Age)")) &&
        identical(.s_code(.s13), c("mydata <- s_mk()", "jnumeric(mydata, Age)")))
check("S14 ... nothing is stored, under any name",
      length(.s_reg("s_mk()")) == 0L &&
        length(getOption(".jst_registry", list())) == 0L)
# .s_run2(): the lines a stop offers, run in order in an environment of
# their own -- "mydata" is the message's name, and a user may have one.
.s_run2 <- function(lines) {
  e <- new.env(parent = globalenv())
  !errs(for (ln in lines) eval(parse(text = ln), e))
}
check("S15 ... and the two lines run, in order, and register Age under the new name",
      { ok <- .s_run2(.s_code(.s13)) && identical(.s_reg("mydata"), "Age:numeric")
        quiet(jnumeric(clear.all = TRUE))
        ok && !exists("mydata", envir = globalenv(), inherits = FALSE) })
.s16 <- grab(jdummy(d[d$Age > 30, ], Condition, ref = "last", show = TRUE))
check("S16 a subset typed as the data, with further inputs: the call is given back whole on the new name, in the other three verbs too",
      identical(.s_code(.s16),
                c("mydata <- d[d$Age > 30, ]",
                  "jdummy(mydata, Condition, ref = \"last\", show = TRUE)")) &&
        identical(.s_code(grab(jcount(subset(d, Age > 30), Age)))[2L],
                  "jcount(mydata, Age)") &&
        identical(.s_code(grab(jlikert(s_mk(), Condition, Keep01)))[2L],
                  "jlikert(mydata, Condition, Keep01)") &&
        length(getOption(".jst_dummy", list())) == 0L)
.s17 <- grab(jdummy(s_mk(), NULL))
check("S17 a clear or a removal on an expression: refused with the status call, since nothing is stored under an expression -- the whole message",
      identical(flat(.s17),
                paste0("jdummy(): s_mk() is not a name, and registrations are ",
                       "stored under a data frame's name. To see the ",
                       "registrations that are stored, run:   jdummy()")) &&
        identical(.s_code(grab(jnumeric(s_mk(), Age, remove = TRUE))), "jnumeric()"))
.s18 <- grab(jnumeric(s_lst$s_dd, Age))
check("S18 a PLACE is accepted (Jeff's lean 1): jnumeric(s_lst$s_dd, Age) registers under \"s_lst$s_dd\", and the note's file is named for the last part",
      identical(.s_reg("s_lst$s_dd"), "Age:numeric") &&
        identical(.s_code(.s18), c("jsave(s_lst$s_dd, \"s_dd.rds\")", "jload(\"s_dd.rds\")")))
check("S19 ... the double-bracket form gives the same file (its line read jload(\"s_lst[[\"s_dd\"]].rds\"), which does not parse); a place reached by position gets the placeholder",
      identical(.s_code(grab(jdummy(s_lst[["s_dd"]], Condition))),
                c("jsave(s_lst[[\"s_dd\"]], \"s_dd.rds\")", "jload(\"s_dd.rds\")")) &&
        identical(.s_code(grab(jcount(s_lst[[1]], Age))),
                  c("jsave(s_lst[[1]], \"mydata.rds\")", "jload(\"mydata.rds\")")))
check("S20 .jst_data_file_stem(): a name gives itself; $, [[\"\"]] and @ give the last part; a position, a computed name and a last part that is no name give the placeholder",
      { st <- jstats:::.jst_data_file_stem
        identical(st(quote(d), "d"), "d") && identical(st(NULL, "d"), "d") &&
          identical(st(quote(a$b$c), "a$b$c"), "c") &&
          identical(st(quote(a[["b"]]), "x"), "b") &&
          identical(st(quote(a@b), "x"), "b") &&
          identical(st(quote(a[[2]]), "x"), "mydata") &&
          identical(st(quote(a[[i]]), "x"), "mydata") &&
          identical(st(quote(a$`my frame`), "x"), "mydata") })
# .s_trip(): the save line and the load line of a registration note, run in
# a folder of their own. TRUE when the file was written and the load put the
# registration back under the name the file loads as. A function, so that
# on.exit() restores the working directory whatever happens.
.s_trip <- function(lines, file, reg_name, want) {
  td  <- tempfile("jst_s21_"); dir.create(td); owd <- setwd(td)
  on.exit({ setwd(owd); unlink(td, recursive = TRUE)
            if (exists(reg_name, envir = globalenv(), inherits = FALSE))
              rm(list = reg_name, envir = globalenv()) })
  ok1 <- !errs(eval(parse(text = lines[1L]), globalenv())) && file.exists(file)
  quiet(jnumeric(clear.all = TRUE))
  ok2 <- !errs(eval(parse(text = lines[2L]), globalenv())) &&
    identical(.s_reg(reg_name), want)
  ok1 && ok2
}
check("S21 ... the two lines run: the file is written, and loading it restores the registration under the name it loads as",
      .s_trip(.s_code(.s18), "s_dd.rds", "s_dd", "Age:numeric"))
quiet(jdummy(clear.all = TRUE)); quiet(jnumeric(clear.all = TRUE))
quiet(jcount(clear.all = TRUE))
check("S22 control: a name, and the juse() default, are saved under the name as before",
      identical(.s_code(grab(jnumeric(e, Age))),
                c("jsave(e, \"e.rds\")", "jload(\"e.rds\")")) &&
        { quiet(juse(d)); r <- .s_code(grab(jcount(Age))); quiet(juse(NULL))
          identical(r, c("jsave(d, \"d.rds\")", "jload(\"d.rds\")")) })
quiet(jnumeric(clear.all = TRUE)); quiet(jcount(clear.all = TRUE))
rm(s_mk)

# ---- S23-S28: a computed vector is named as typed (the S338 item) -----------
check("S23 jfreq(d$Gender[d$Age > 40]): the table is titled with the expression (it was titled \"Age > 40]\", the text after the last dollar sign)",
      { ln <- plines(jfreq(d$Gender[d$Age > 40]))
        "d$Gender[d$Age > 40]" %in% ln && !("Age > 40]" %in% ln) })
check("S24 jdesc(log(d$Age)) and jscreen(log(d$Age)): the row is named log(d$Age) (it read \"Age)\")",
      any(startsWith(plines(jdesc(log(d$Age))), "log(d$Age) ")) &&
        any(startsWith(plines(jscreen(log(d$Age))), "log(d$Age) ")) &&
        !any(startsWith(plines(jdesc(log(d$Age))), "Age) ")))
.s25 <- grab(jfreq(d$Gender[d$Age > 40], Keep01))
check("S25 a second variable beside a computed vector: the sentence, and NO fix line (it printed jfreq(d$Gender[d, Age > 40], Keep01)) -- the whole message",
      identical(flat(.s25),
                paste0("jfreq(): Keep01 needs the data frame, not the single ",
                       "column d$Gender[d$Age > 40]. Name the data frame ",
                       "first, and each variable on its own.")) &&
        length(.s_code(.s25)) == 0L)
check("S26 ... by = and a condition naming another variable likewise",
      { # The two calls run with no Keep01, Gender or Name in the workspace
        # (Scripts Slate B, the S342 dirty entry): a computed vector has no
        # frame, so a workspace object of that name is what its condition
        # would read, and the expected refusal is for none.
        aside <- intersect(c("Keep01", "Gender", "Name"), ls(globalenv()))
        held  <- mget(aside, envir = globalenv())
        rm(list = aside, envir = globalenv())
        b <- grab(jdesc(log(d$Age), by = Gender))
        s <- grab(jfreq(d$Gender[d$Age > 40], subset = Keep01 == 1))
        list2env(held, envir = globalenv())
        has(flat(b), "jdesc(): by = Gender needs the data frame, not the single column log(d$Age).") &&
          endsWith(b, "Name the data frame first, and each variable on its own.") &&
          length(.s_code(b)) == 0L &&
          has(flat(s), "refers to Keep01, which the single column d$Gender[d$Age > 40] does not contain.") &&
          endsWith(s, "Name the data frame first, and each variable on its own.") &&
          length(.s_code(s)) == 0L })
.s27 <- grab(jfreq(s_lst$s_dd$Gender, Keep01))
check("S27 control: a data frame held in a list keeps its last part as the name, and its fix line, which runs",
      "Gender" %in% plines(jfreq(s_lst$s_dd$Gender)) &&
        "Gender" %in% plines(jfreq(s_lst$s_dd[["Gender"]])) &&
        identical(.s_code(.s27), "jfreq(s_lst$s_dd, Gender, Keep01)") &&
        .fix_runs(.s27))
check("S28 control: a plain name keeps the placeholder frame in its fix line, and a data frame's own column its frame",
      { x_s <- d$Age
        identical(.s_code(grab(jdesc(x_s, Keep01))), "jdesc(MyData, x_s, Keep01)") &&
          identical(.s_code(grab(jdesc(d$Age, Keep01))), "jdesc(d, Age, Keep01)") })
rm(s_lst)

# ---- S29: the section M stops, taken once for the sweeps ---------------------
s_f <- d; s_f$Fac <- factor(rep(c("lo", "mid", "hi"), 4)); s_f$When <- as.Date("2026-01-01") + 0:11
check("S29 the type refusals and jdummy()'s ref stop (pinned in models_check.R, section M) are taken here, so P01-P03 read them",
      has(grab(jnumeric(s_f, Fac)), "jnumeric(): 'Fac' is a factor") &&
        has(grab(jcount(s_f, Name)), "jcount(): 'Name' is a character (text) variable") &&
        has(grab(jlikert(s_f, Under40)), "jlikert(): 'Under40' is a logical (TRUE/FALSE) variable") &&
        has(grab(jnumeric(s_f, When)), "jnumeric(): 'When' is a date/time variable") &&
        has(grab(jdummy(s_f, Gender, ref = c(1, 2))), "jdummy(): `ref` must be a single value") &&
        has(grab(jlm(Age ~ log(Fac), data = s_f)), "Convert it to numbers first with jencode().") &&
        has(grab(jlm(Age ~ I(Under40 * 2), data = s_f)), "jlm(): Under40 is a categorical variable"))
rm(s_f)

# ---- S30-S34: jfreq() and a list or raw column (the S213 item) --------------
s_L <- data.frame(id = 1:4, x = c(2.5, NA, 4, 8))
# geom's cells differ in length (2, 3, 1, 1), as a geometry column's do: it
# is that which data.frame() cannot spread into a column.
s_L$geom <- list(1:2, 1:3, "a", NA); s_L$rw <- as.raw(1:4)
s_L$fr   <- data.frame(a = 1:4, b = 4:1)
check("S30 jfreq() on a list column: the analysis functions' type stop, the whole message, and nothing printed first (the title and the N line printed, then R's \"all arguments must have the same length\")",
      identical(grab(jfreq(s_L, geom)),
                "'geom' is of type list and cannot be used in a frequency table.") &&
        identical(.s_pre(jfreq(s_L, geom)), character(0)))
check("S31 a raw column and a column that is itself a data frame likewise (R's \"unimplemented type 'raw'\" and \"arguments imply differing number of rows\")",
      identical(grab(jfreq(s_L, rw)),
                "'rw' is of type raw and cannot be used in a frequency table.") &&
        identical(grab(jfreq(s_L, fr)),
                  "'fr' is of type list and cannot be used in a frequency table.") &&
        identical(.s_pre(jfreq(s_L, rw)), character(0)))
check("S32 ... the stop comes before any table when the list column is one of several, and through the single-column form",
      identical(.s_pre(jfreq(s_L, id, geom)), character(0)) &&
        identical(grab(jfreq(s_L$geom)),
                  "'geom' is of type list and cannot be used in a frequency table."))
check("S33 jdesc()'s own refusal of the same column is as it was, through the single-column form too (it met R's \"differing number of rows\" there)",
      has(grab(jdesc(s_L, geom)), "jdesc(): 'geom' is a list and can't be summarized numerically.") &&
        has(grab(jdesc(s_L$geom)), "jdesc(): 'geom' is a list and can't be summarized numerically."))
check("S34 control: every other type is still tabulated -- a complex column, a date, a matrix column",
      { L2 <- data.frame(id = 1:4); L2$cx <- complex(real = c(1, 1, 2, 2), imaginary = 1)
        L2$dt <- as.Date("2026-01-01") + c(0, 0, 1, 2); L2$m <- scale(c(1, 2, 3, 9))
        all(vapply(c("cx", "dt", "m"), function(v) {
          ln <- plines(eval(bquote(jfreq(L2, .(as.name(v))))))
          identical(ln[1L], "Frequencies") && any(startsWith(ln, "Total"))
        }, logical(1))) })
rm(s_L)
rm(list = intersect(c(".s_dummy", ".s_reg", ".s_code", ".s_set", ".s_pre", ".s_run2", ".s_trip", ".s01", ".s05",
                      ".s13", ".s16", ".s17", ".s18", ".s25", ".s27"),
                    ls(all.names = TRUE)))
reset()

# =============================================================================
# T -- THE NOT-FOUND SENTENCE AT THE FOUR SITES THAT BUILT THEIR OWN (S343)
# =============================================================================
# Section Q holds the S338 sentence where .jst_check_vars() writes it. Four
# sites built an older one themselves -- jrecode() and jencode() ("Variable
# 'Agee' not found in 'd'."), jrelabel() ("... not found in d.") and a
# range's two endpoints in .jst_resolve_varrange(), the jalpha() / jsum() /
# javg() path ("Variable 'Agee' not found in d." / "Check spelling and
# capitalization.") -- and none of them gave the juse() default hint. All
# four now call .jst_check_vars(), so the sentence, the count agreement and
# the hint are the package's one (the S338 item, Fix Slate 5).
reset()
.t_nf <- "was not found in the d data frame.\nCheck the spelling."
check("T01 jrecode(): the whole message (it read \"Variable 'Agee' not found in 'd'.\")",
      identical(grab(jrecode(d, Agee, map = "1=2")), paste0("jrecode(): Agee ", .t_nf)))
check("T02 jrelabel(): the whole message (it read \"Variable 'Agee' not found in d.\")",
      identical(grab(jrelabel(d, Agee, labels = "1=x")), paste0("jrelabel(): Agee ", .t_nf)))
check("T03 jencode(): the whole message",
      identical(grab(jencode(d, Nam)), paste0("jencode(): Nam ", .t_nf)))
check("T04 a range's start, and a range's end, in jalpha(), jsum() and javg() (it read \"Check spelling and capitalization.\")",
      identical(grab(jalpha(d, Agee:Gender)), paste0("jalpha(): Agee ", .t_nf)) &&
        identical(grab(jsum(d, Age:Gendr)), paste0("jsum(): Gendr ", .t_nf)) &&
        identical(grab(javg(d, Agee:Gender)), paste0("javg(): Agee ", .t_nf)))
check("T05 both endpoints missing: one message naming both, with 'were' (the first alone was reported)",
      identical(grab(jalpha(d, Agee:Gendr)),
                paste0("jalpha(): Agee and Gendr were not found in the d data frame.\n",
                       "Check the spelling.")))
quiet(juse(d))
.t06 <- list(grab(jrecode(Agee, map = "1=2")), grab(jrelabel(Agee, labels = "1=x")),
             grab(jencode(Nam)), grab(jalpha(Agee:Gender)), grab(jsum(Age:Gendr)),
             grab(javg(Agee:Gender)))
check("T06 under the juse() default every one of them closes on the hint, on a line of its own (none gave it)",
      all(vapply(.t06, function(m) {
        has(m, " not found in the d data frame.\nCheck the spelling.\nd is the juse() default") &&
          has(flat(m), "d is the juse() default -- if you meant a different data frame, name it in the call.")
      }, logical(1))) &&
        identical(vapply(.t06, function(m) sub("\\(\\).*$", "", m), ""),
                  c("jrecode", "jrelabel", "jencode", "jalpha", "jsum", "javg")))
quiet(juse(NULL))
check("T07 ... and with the data frame named in the call there is no hint",
      !has(paste(grab(jrecode(d, Agee, map = "1=2")), grab(jrelabel(d, Agee, labels = "1=x")),
                 grab(jencode(d, Nam)), grab(jalpha(d, Agee:Gender))), "juse() default"))
check("T08 no site keeps the older form: no \"Variable '\", no quoted frame, no \"capitalization\"",
      { m <- paste(c(grab(jrecode(d, Agee, map = "1=2")), grab(jrelabel(d, Agee, labels = "1=x")),
                     grab(jencode(d, Nam)), grab(jalpha(d, Agee:Gender)),
                     grab(jsum(d, Age:Gendr)), unlist(.t06)), collapse = "\n")
        !has(m, "Variable '") && !has(m, "in 'd'") && !has(m, "capitalization") })
check("T09 the variable left out altogether gets the blank-name stop (it read \"Variable '' not found in 'd'.\")",
      { want <- "Variable names cannot be blank.\nCheck for a stray comma or period in the call."
        identical(grab(jrecode(d, map = "1=2")), paste0("jrecode(): ", want)) &&
          identical(grab(jencode(d)), paste0("jencode(): ", want)) &&
          identical(grab(jrelabel(d, labels = "1=x")), paste0("jrelabel(): ", want)) })
check("T10 controls: a variable that is found is recoded, relabeled and encoded as before; a range resolves; the order stop is as it was",
      { r <- suppressMessages(jrecode(d, Gender, map = "1=0; 2=1"))
        l <- suppressMessages(jrelabel(d, Gender, labels = "1=M; 2=F"))
        n <- suppressMessages(jencode(d, Name))
        v <- jstats:::.jst_resolve_varrange(rlang::quos(Age:Gender, Name), d, "jsum", "d")
        identical(as.numeric(r), rep(c(0, 1), 6)) &&
          identical(labelled::val_labels(l), c(M = 1, F = 2)) &&
          length(unique(as.numeric(n))) == 12L &&
          identical(v$var_names, c("Age", "Keep01", "Gender", "Name")) &&
          identical(v$label_parts, c("Age to Gender", "Name")) &&
          has(flat(grab(jalpha(d, Gender:Age))),
              "jalpha(): In Gender:Age, 'Gender' comes after 'Age' in the column order of d. Reverse the order: Age:Gender") })
check("T11 the resolver takes default_used, FALSE unless told (a caller that does not pass it gets no hint)",
      { f <- formals(jstats:::.jst_resolve_varrange)
        identical(f$default_used, FALSE) &&
          !has(grab(jstats:::.jst_resolve_varrange(rlang::quos(Agee:Gender), d, "jsum", "d")),
               "juse() default") &&
          has(grab(jstats:::.jst_resolve_varrange(rlang::quos(Agee:Gender), d, "jsum", "d",
                                                 default_used = TRUE)),
              "d is the juse() default") })
rm(.t_nf, .t06)
reset()

# =============================================================================
# U -- UNDER A juse() DEFAULT, THE FRAME'S VARIABLE IS READ (S348, v0.9.221)
# =============================================================================
# Ruling R12 (Jeff, S345): with a default set, a bare name that the default
# frame has is the frame's variable in jdesc(), jfreq() and jscreen(), as in
# every other function. Through 0.9.220 those three -- the ones that take a
# single column -- read a separate vector of that name in the workspace and
# said nothing ("3 Cases in the 1 Variable Pool"), and jdesc(Age, Gender)
# was refused as needing a data frame. A workspace object is read only when
# the default frame has no such variable, or when no default is set. When a
# separate vector or factor shares a name the call uses, a second line under
# "Using default data frame" says which was read. Names no workspace is
# likely to hold (zz_u*), as the fifth dirty-entry condition asks; an object
# a check needs for itself is made inside local(), where the call that
# reads it runs too.
reset()
.u_prior_default <- getOption(".jst_default_data")
zz_u <- data.frame(zz_ua = c(20, 30, 40, 50, NA, 60),
                   zz_ub = c(1, 2, 1, 2, 1, 2))
quiet(juse(zz_u))
zz_ua <- c(1, 2, 3)
zz_ub <- factor(c("m", "f"))
.u_one <- "zz_ua is the variable in zz_u, not the separate object with that name."
.u_two <- "zz_ua and zz_ub are variables in zz_u, not the separate objects with those names."
# u_line(): the text under "Using default data frame", up to a blank line or
# an indented one, joined -- the emitter wraps it at the pin. NA when the
# note is absent; "" when it stands alone.
u_line <- function(v) {
  i <- which(startsWith(v, "Using default data frame: "))
  if (length(i) != 1L) return(NA_character_)
  j <- i + 1L; got <- character(0)
  while (j <= length(v) && nzchar(v[j]) && !startsWith(v[j], " ")) {
    got <- c(got, v[j]); j <- j + 1L
  }
  paste(got, collapse = " ")
}
# .u_pl(): plines() for a capture taken outside check() (guard 3): a call
# that stops gives its error text, and the checks reading it go red where
# the battery would have halted (as the old resolver's refusal of
# jdesc(zz_ua, zz_ub) did, on the first mutant run).
.u_pl <- function(expr) tryCatch(plines(expr),
                                 error = function(e) paste0("[error] ", conditionMessage(e)))
.u01 <- .u_pl(jdesc(zz_ua))
check("U01 jdesc(): the default frame's variable (6 cases, 5 with a value), not the 3-value workspace vector",
      any(.u01 == "6 Cases in the 1 Variable Pool") &&
        any(grepl("^zz_ua +6 +5 +20 +60 ", .u01)))
check("U02 ... under \"Using default data frame\", the line that says which object was read",
      identical(u_line(.u01), .u_one) &&
        identical(.u01[which(.u01 == "Using default data frame: zz_u") + 1L], .u_one))
.u03 <- .u_pl(jfreq(zz_ub))
check("U03 jfreq(): the frame's 1/2 variable, six cases, not the two-level factor",
      any(.u03 == "6 Cases in the 1 Variable Pool") &&
        any(grepl("^Total +6 +100\\.00$", .u03)) && !any(grepl("^(m|f) ", .u03)) &&
        identical(u_line(.u03),
                  "zz_ub is the variable in zz_u, not the separate object with that name."))
.u04 <- .u_pl(jscreen(zz_ua))
check("U04 jscreen(): the frame's variable -- \"Cases: 6\" -- and the line",
      any(.u04 == "  Cases: 6") && identical(u_line(.u04), .u_one))
.u05 <- .u_pl(jdesc(zz_ua, zz_ub))
check("U05 two variables, both shared: no false refusal, both described from the frame, the plural line, wrapped",
      any(.u05 == "6 Cases in the 2 Variable Pool; 5 Complete on All") &&
        identical(u_line(.u05), .u_two) &&
        all(nchar(.u05) <= .pin_width))
check("U06 jscreen() on the two: the plural line",
      identical(u_line(plines(jscreen(zz_ua, zz_ub))), .u_two))
check("U07 a variable the workspace does not share: only the one that is shared is named",
      local({ f <- zz_u; f$zz_uc <- 1:6
              quiet(juse(f)); v <- plines(jdesc(zz_ub, zz_uc)); quiet(juse(zz_u))
              identical(u_line(v),
                        "zz_ub is the variable in f, not the separate object with that name.") }))
check("U08 the line only when a vector or factor shares the name: a function, a list and a data frame of that name say nothing",
      local({ zz_ua <- function(x) x; a <- plines(jdesc(zz_ua))
              zz_ua <- list(1, 2);     b <- plines(jdesc(zz_ua))
              zz_ua <- data.frame(q = 1); c3 <- plines(jfreq(zz_ub, zz_ua))
              any(a == "6 Cases in the 1 Variable Pool") && identical(u_line(a), "") &&
                any(b == "6 Cases in the 1 Variable Pool") && identical(u_line(b), "") &&
                identical(u_line(c3),
                          "zz_ub is the variable in zz_u, not the separate object with that name.") }))
check("U09 no object shares the name: the default note alone, as before",
      local({ f <- data.frame(zz_ue = 1:4); quiet(juse(f))
              v <- plines(jdesc(zz_ue)); quiet(juse(zz_u))
              identical(u_line(v), "") }))
check("U10 the default frame has no such variable: the workspace vector is read, as before, and no default note",
      local({ zz_ud <- c(7, 8, 9); v <- plines(jdesc(zz_ud))
              any(v == "3 Cases in the 1 Variable Pool") && is.na(u_line(v)) }))
check("U11 a column typed with its frame, and a computed vector, are read as typed: zz_u$zz_ua is the frame's column, a vector of three the workspace's",
      { a <- plines(jdesc(zz_u$zz_ua)); b <- plines(jdesc(rev(zz_ua)))
        any(a == "6 Cases in the 1 Variable Pool") &&
          any(b == "3 Cases in the 1 Variable Pool") &&
          !any(grepl("separate object", c(a, b))) })
check("U12 the line prints at every output level, as the default note does",
      { quiet(joutput("minimal", quiet = TRUE)); v <- plines(jfreq(zz_ua))
        quiet(joutput(NULL, quiet = TRUE))
        identical(u_line(v), .u_one) })
check("U13 the line is wrapped at the message width, and only there",
      { o <- getOption(".jst_options_message_width")
        options(.jst_options_message_width = 50L)
        v <- plines(jdesc(zz_ua, zz_ub))
        options(.jst_options_message_width = o)
        i <- which(v == "Using default data frame: zz_u")
        length(i) == 1L && all(nchar(v[i + 1:2]) <= 50L) &&
          identical(u_line(v), .u_two) })
check("U14 a grouped jdesc names its grouping variable too",
      identical(u_line(plines(jdesc(zz_ua, by = zz_ub))), .u_two))
check("U15 with no default the workspace vector is read, as before",
      { quiet(juse(NULL)); v <- plines(jdesc(zz_ua)); quiet(juse(zz_u))
        any(v == "3 Cases in the 1 Variable Pool") && is.na(u_line(v)) })
check("U16 a function of the user's own: its local vector is not read in the frame's place, and the line names it",
      local({ f <- function() { zz_ua <- c(100, 200); jdesc(zz_ua) }
              v <- plines(f())
              any(v == "6 Cases in the 1 Variable Pool") && identical(u_line(v), .u_one) }))
check("U17 the functions that never took a single column are unchanged: jcorr() reads the frame's two variables and prints no second line",
      { v <- plines(jcorr(zz_ua, zz_ub))
        any(grepl("N = 5", v)) && identical(u_line(v), "") })
check("U18 an object only a package supplies is no one's separate object: a frame variable named pi, read from code whose environment encloses base R's, gets no line",
      local({ f <- data.frame(pi = c(1, 2, 3)); quiet(juse(f))
              g <- function() jstats::jdesc(pi)
              environment(g) <- new.env(parent = baseenv())
              assign("f", f, envir = environment(g))
              v <- plines(g()); quiet(juse(zz_u))
              any(v == "3 Cases in the 1 Variable Pool") && identical(u_line(v), "") }))
options(.jst_default_data = .u_prior_default)
rm(zz_u, zz_ua, zz_ub, .u_prior_default, .u_one, .u_two, .u01, .u03, .u04,
   .u05, u_line, .u_pl)
reset()

# =============================================================================
# V -- THE FRONT DOOR: ONE ROW, AN INPUT jsubset() DOES NOT HAVE, AN EXPRESSION
#      AS THE DATA, A USER'S OWN WRAPPER, A .jst_row_id COLUMN, AN sf FRAME
#      (S349, v0.9.222)
# =============================================================================
# Fix Slate 7, second half. (1) A filter on a ONE-ROW frame was refused as "a
# single value (TRUE), not one TRUE or FALSE for every row" -- one is one for
# every row (the S346 item); a condition that names no variable is still
# refused there. (2) jsubset(d, cond, quiet = TRUE) read quiet = TRUE as a
# condition typed with one = and offered jsubset(d, quiet == TRUE), a line
# that does not run (the S346 item): with a frame in hand a named input that
# is not one of its variables is an unused input, as in every variable list
# since S290. (3) jsubset(mk(), ...) and jcomplete(mk(), ...) stored a
# setting under the text "mk()", which no later call reached (the S341 item):
# refused, as the registration verbs refuse one, a place (lst$d) accepted.
# (4) The error prefix named a user's own j-named wrapper (AUDIT-015). (5) A
# frame's own .jst_row_id column was overwritten and stripped by the
# pipeline (AUDIT-018). (6) An sf frame stopped jscreen(), jdesc() and jt()
# on R's "invalid 'type' (list) of argument" (the S213 item): read as an
# ordinary data frame, its geometry an Unsupported row.
# The sf frame is a STAND-IN, so the battery runs where sf is not
# installed: a data frame of class c("sf", "data.frame") with a list column
# named in its sf_column attribute, and a `[.sf` that keeps that column
# whatever columns are asked for, as sf's own does -- the one behavior that
# broke the analyses. The method is defined in the workspace for the
# section and removed at its end. On 0.9.221 the stand-in stops all three
# functions with R's error, as a real sf frame did (sf 1.0-15, S342 and
# S349, sandbox).
reset()
zz_v1 <- data.frame(y = 5, g = 1)
zz_v2 <- data.frame(x3 = 1:6, g = c(1, 1, 2, 2, 1, 2))
zz_vmk <- function() zz_v2
.v_pl <- function(expr) tryCatch(plines(expr),
                                 error = function(e) paste0("[error] ", conditionMessage(e)))

# -- (1) one row --
.v01 <- .v_pl(jfreq(zz_v1, g, subset = y > 1))
check("V01 a filter on a one-row frame: one TRUE is one for every row, and the analysis runs",
      !any(startsWith(.v01, "[error]")) && row_of(.v01, "subset =") &&
        any(grepl("^Total +1 +100\\.00$", .v01)))
check("V02 ... jdesc() the same, and a condition that leaves no row excludes the one case",
      { a <- .v_pl(jdesc(zz_v1, y, subset = y > 1))
        b <- grab(jdesc(zz_v1, y, subset = y > 9))
        any(grepl("^y +1 +1 +5 +5 +5\\.000", a)) &&
          !has(b, "single value") })
check("V03 jsubset() on a one-row frame sets the filter, and an analysis applies it",
      { a <- grab(jsubset(zz_v1, y > 1))
        b <- .v_pl(jdesc(zz_v1, y)); quiet(jsubset(zz_v1, NULL))
        identical(a, "jsubset activated for zz_v1: y > 1\n") && row_of(b, "jsubset()") })
check("V04 a condition that names no variable is refused on one row as anywhere: TRUE, and a workspace comparison",
      { a <- grab(jfreq(zz_v1, g, subset = TRUE))
        b <- local({ zz_vk <- 3; grab(jfreq(zz_v1, g, subset = zz_vk > 1)) })
        has(flat(a), "subset = TRUE is a single value, not one TRUE or FALSE for every case.") &&
          has(flat(b), "subset = zz_vk > 1 is a single value (TRUE), not one TRUE or FALSE for every case.") })
check("V05 control: on two rows a single value is still refused",
      has(flat(grab(jfreq(zz_v2, g, subset = mean(x3) > 1))),
          "subset = mean(x3) > 1 is a single value (TRUE)"))

# -- (2) an input jsubset() does not have --
check("V06 jsubset(d, cond, quiet = TRUE): an unused input, and nothing is stored",
      identical(grab(jsubset(zz_v2, x3 <= 4, quiet = TRUE)),
                "jsubset(): unused input: quiet") &&
        is.null(fs_of("zz_v2")))
check("V07 a variable of the frame typed with one = keeps the single-= stop, and its line runs",
      { m <- grab(jsubset(zz_v2, g = 1))
        ln <- sub("^  ", "", tail(strsplit(m, "\n", fixed = TRUE)[[1L]], 1L))
        quiet(eval(parse(text = ln))); ok <- identical(fs_of("zz_v2")$expr_str, "g == 1")
        quiet(jsubset(zz_v2, NULL))
        identical(m, paste0("jsubset(): g = 1 uses a single =, which does not test equality in R.\n",
                            "Use == (two equals signs):\n  jsubset(zz_v2, g == 1)")) && ok })
check("V08 under a juse() default the default frame is the frame in hand: quiet = TRUE is unused, g = 1 a condition",
      { quiet(juse(zz_v2))
        a <- grab(jsubset(x3 <= 4, quiet = TRUE)); b <- grab(jsubset(g = 1))
        quiet(juse(NULL))
        identical(a, "jsubset(): unused input: quiet") &&
          has(b, "g = 1 uses a single =") && has(b, "  jsubset(g == 1)") })
check("V09 two named inputs, a variable and not: the variable's single-= stop, as before",
      has(grab(jsubset(zz_v2, g = 1, quiet = TRUE)), "g = 1 uses a single ="))

# -- (3) an expression as the data --
.v10 <- grab(jsubset(zz_vmk(), x3 > 3))
check("V10 jsubset(mk(), cond): refused -- a filter is stored under a name -- with two lines that run",
      identical(.v10, paste0(
        "jsubset(): zz_vmk() is not a name, and a jsubset filter is stored\n",
        "under its data frame's name.\n",
        "Give the data frame a name first, then set it:\n",
        "  mydata <- zz_vmk()\n",
        "  jsubset(mydata, x3 > 3)")))
check("V11 ... nothing is stored, under the expression or anywhere",
      length(getOption(".jst_filter", default = list())) == 0L)
check("V12 ... and the two lines, run, set the filter under the name",
      local({ ls2 <- sub("^  ", "", tail(strsplit(.v10, "\n", fixed = TRUE)[[1L]], 2L))
              quiet(eval(parse(text = ls2[1L]))); quiet(eval(parse(text = ls2[2L])))
              ok <- identical(fs_of("mydata")$expr_str, "x3 > 3")
              quiet(jsubset(clear.all = TRUE)); ok }))
check("V13 jsubset(mk(), off), (mk(), NULL): nothing is stored under an expression, and the status call is given",
      { want <- paste0("jsubset(): zz_vmk() is not a name, and jsubset filters are stored\n",
                       "under a data frame's name.\n",
                       "To see the jsubset filters that are stored, run:\n  jsubset()")
        identical(grab(jsubset(zz_vmk(), off)), want) &&
          identical(grab(jsubset(zz_vmk(), NULL)), want) })
check("V14 a subset of a frame is an expression too, named as typed",
      has(grab(jsubset(zz_v2[zz_v2$x3 > 1, ], x3 > 3)), "  mydata <- zz_v2[zz_v2$x3 > 1, ]"))
.v15 <- grab(jcomplete(zz_vmk(), x3))
check("V15 jcomplete(mk(), vars): refused in the same form, nothing stored",
      identical(.v15, paste0(
        "jcomplete(): zz_vmk() is not a name, and a jcomplete setting is\n",
        "stored under its data frame's name.\n",
        "Give the data frame a name first, then set it:\n",
        "  mydata <- zz_vmk()\n",
        "  jcomplete(mydata, x3)")) &&
        length(getOption(".jst_complete", default = list())) == 0L)
check("V16 ... its lines run, and its off form gives the status call",
      local({ ls2 <- sub("^  ", "", tail(strsplit(.v15, "\n", fixed = TRUE)[[1L]], 2L))
              quiet(eval(parse(text = ls2[1L]))); quiet(eval(parse(text = ls2[2L])))
              ok <- identical(unname(cs_of("mydata")$vars), "x3")
              quiet(jcomplete(clear.all = TRUE))
              ok && has(grab(jcomplete(zz_vmk(), off)),
                        "To see the jcomplete settings that are stored, run:\n  jcomplete()") }))
check("V17 a place is accepted: jsubset(lst$d, ...) and jcomplete(lst$d, ...) set, and an analysis of lst$d applies them",
      local({ zz_vl <- list(d = zz_v2)
              a <- grab(jsubset(zz_vl$d, x3 > 3)); b <- grab(jcomplete(zz_vl$d, x3))
              v <- plines(jdesc(zz_vl$d, x3))
              quiet(jsubset(clear.all = TRUE)); quiet(jcomplete(clear.all = TRUE))
              identical(a, "jsubset activated for zz_vl$d: x3 > 3\n") &&
                !has(b, "is not a name") && row_of(v, "jsubset()") && row_of(v, "jcomplete()") }))

# -- (4) a user's own wrapper (AUDIT-015) --
check("V18 a user's j-named wrapper is not named in the prefix: the jstats call is",
      local({ justify_data <- function() jt(Y ~ Nope, zz_v2)
              startsWith(grab(justify_data()), "jt(): ") }))
check("V19 ... over a data-first function, and through jstats::",
      local({ join_scores <- function(dd) jdesc(dd, Nope)
              jot <- function(dd) jstats::jfreq(dd, Nope)
              identical(grab(join_scores(zz_v2)),
                        "jdesc(): Nope was not found in the dd data frame.\nCheck the spelling.") &&
                startsWith(grab(jot(zz_v2)), "jfreq(): ") }))
check("V20 ... and a message that names the function inside its text names the jstats one",
      local({ jsummary <- function(dd) jfreq(dd, g, subset = TRUE)
              has(flat(grab(jsummary(zz_v2))), "In your jfreq() call") }))

# -- (5) a column named .jst_row_id (AUDIT-018) --
check("V21 a frame's own .jst_row_id column is analyzed, not overwritten and stripped",
      { zz_vr <- data.frame(.jst_row_id = c(101, 102, 103, 104), z = 1:4,
                            check.names = FALSE)
        a <- plines(jdesc(zz_vr, .jst_row_id))
        b <- plines(jdesc(zz_vr, .jst_row_id, subset = z > 1))
        rm(zz_vr)
        any(grepl("^\\.jst_row_id +4 +4 +101 +104 +102\\.500", a)) &&
          any(grepl("^\\.jst_row_id +3 +3 +102 +104 +103\\.000", b)) })
check("V22 ... and beside a .jst_row_id_ column, both",
      { zz_vr <- data.frame(.jst_row_id = c(1, 2, 3), .jst_row_id_ = c(7, 8, 9),
                            check.names = FALSE)
        a <- plines(jdesc(zz_vr, .jst_row_id, .jst_row_id_)); rm(zz_vr)
        any(grepl("^\\.jst_row_id +3 +3 +1 +3 +2\\.000", a)) &&
          any(grepl("^\\.jst_row_id_ +3 +3 +7 +9 +8\\.000", a)) })

# -- (6) an sf frame (the stand-in) --
`[.sf` <- function(x, i, j, ..., drop = FALSE) {
  geom <- attr(x, "sf_column"); cls <- class(x)
  y <- x; class(y) <- "data.frame"
  r <- if (nargs() == 2L) {
    y[union(names(y[i]), geom)]
  } else if (missing(j)) {
    if (missing(i)) y else y[i, , drop = FALSE]
  } else {
    cols <- union(names(y[j]), geom)
    if (missing(i)) y[, cols, drop = FALSE] else y[i, cols, drop = FALSE]
  }
  attr(r, "sf_column") <- geom; class(r) <- cls; r
}
zz_vp <- data.frame(Age   = c(NA, 22, 35, 41, 58, 30, 27, 49, 33, 61, 44, 38),
                    Score = c(50, 61, 44, 52, 70, 48, 39, 58, 55, 63, 47, 51),
                    Sex   = rep(1:2, 6))
zz_vs <- zz_vp
zz_vs$geometry <- lapply(1:12, function(k) c(x = k, y = k))
attr(zz_vs, "sf_column") <- "geometry"
class(zz_vs) <- c("sf", "data.frame")
check("V23 premise: the stand-in's `[` keeps the geometry column, as sf's does (if red, V24-V28 prove nothing)",
      identical(names(zz_vs[, c("Age", "Score")]), c("Age", "Score", "geometry")))
.v24 <- .v_pl(jscreen(zz_vs))
check("V24 jscreen(): the screen prints, its geometry an Unsupported row",
      !any(startsWith(.v24, "[error]")) && any(.v24 == "  Cases: 12") &&
        any(grepl("^geometry +Unsupported +12$", .v24)))
check("V25 jdesc() and jt() on the sf frame give what they give on the frame without geometry",
      { a <- .v_pl(jdesc(zz_vs, Age, Score)); a0 <- plines(jdesc(zz_vp, Age, Score))
        b <- .v_pl(jt(Score ~ Sex, zz_vs));   b0 <- plines(jt(Score ~ Sex, zz_vp))
        identical(a, a0) && identical(b, b0) })
check("V26 jcomplete() and then jsubset() set on it, their status displays read it, a filter turned back on is checked on it, and an analysis applies both",
      { b <- grab(jcomplete(zz_vs, Age)); a <- grab(jsubset(zz_vs, Age > 30))
        s1 <- grab(jsubset()); s2 <- grab(jcomplete())
        quiet(jsubset(zz_vs, off)); r <- grab(jsubset(zz_vs, on))
        v <- .v_pl(jdesc(zz_vs, Score))
        quiet(jsubset(clear.all = TRUE)); quiet(jcomplete(clear.all = TRUE))
        identical(a, "jsubset activated for zz_vs: Age > 30\n") &&
          !has(b, "invalid") && identical(s1, "jsubset active for zz_vs: Age > 30\n") &&
          identical(r, "jsubset reactivated for zz_vs: Age > 30\n") &&
          identical(s2, "jcomplete active for zz_vs: Age (11 of 12 complete cases)\n") &&
          row_of(v, "jsubset()") && row_of(v, "jcomplete()") })
check("V27 the geometry named in an analysis is refused as any list column is",
      has(grab(jt(geometry ~ Sex, zz_vs)),
          "'geometry' is of type list and cannot be used in a t-test."))
check("V28 the user's frame is not changed: it is still an sf frame afterwards",
      identical(class(zz_vs), c("sf", "data.frame")) &&
        identical(attr(zz_vs, "sf_column"), "geometry"))
rm(`[.sf`, zz_vs, zz_vp, zz_v1, zz_v2, zz_vmk, .v_pl, .v01, .v10, .v15, .v24)
reset()

# =============================================================================
# W -- jsubset() WITH NO DATA FRAME IN HAND (S352, v0.9.225; the S349 item)
# =============================================================================
# Since v0.9.222 a named input that is not a variable of the frame in hand is
# an unused input. With NO frame in hand -- none named, no juse() default --
# every named input was still read as a condition typed with one =, so
# jsubset(x > 1, quiet = TRUE) offered jsubset(quiet == TRUE), a line that
# does not run. A named input BESIDE a condition is now an unused input there
# too; a named input on its own (jsubset(Gender = 1)) is still the condition
# it most likely is. Run with no default set; the default is put back after.
.w_def <- getOption(".jst_default_data")
options(.jst_default_data = NULL)
check("W01 no frame in hand, a condition and quiet = TRUE: an unused input (it offered jsubset(quiet == TRUE))",
      identical(grab(jsubset(x3 > 1, quiet = TRUE)), "jsubset(): unused input: quiet"))
check("W02 ... the same beside a condition given by name (expr =)",
      identical(grab(jsubset(expr = x3 > 1, quiet = TRUE)), "jsubset(): unused input: quiet"))
check("W03 a named input on its own is still read as a condition typed with one =, its line as before",
      identical(grab(jsubset(Gender = 1)),
                paste0("jsubset(): Gender = 1 uses a single =, which does not test\n",
                       "equality in R.\nUse == (two equals signs):\n  jsubset(Gender == 1)")))
check("W04 nothing is stored by any of them",
      length(getOption(".jst_filter", default = list())) == 0L ||
        all(vapply(getOption(".jst_filter"), is.null, logical(1))))
options(.jst_default_data = .w_def)
rm(.w_def)
reset()

# =============================================================================
# X -- NO DATA FRAME IN HAND: THE RESOLVER'S MESSAGE (S355, v0.9.228; the
#      S352 item, Fix Slate W1)
# =============================================================================
# With no frame named and no juse() default, the shared resolver read a
# condition -- jsubset(Agee > 40) -- as a name that was "not found" and asked
# whether it was meant as a variable name, and both of its fixes sat inline
# after colons. A condition is now said to need a data frame; a bare name keeps
# its question; and in both, each call runs on a line of its own (Rule L), the
# default's two lines in the order they are run. Names the workspace cannot
# hold (.x90_nowhere) keep the calls clear of a user's objects. Run with no
# default set; the default is put back after.
.x_def <- getOption(".jst_default_data")
options(.jst_default_data = NULL)
.gx1 <- grab(jsubset(.x90_nowhere > 40))
.gx2 <- grab(jcorr(.x90_nowhere))
check("X01 a condition and no frame: it needs a data frame, the two ways given, each call on a line of its own (pinned whole)",
      identical(.gx1, paste0(
        "jsubset(): .x90_nowhere > 40 needs a data frame, and none was named\n",
        "or set as the default.\n",
        "Name the data frame first:\n",
        "  jsubset(MyData, .x90_nowhere > 40)\n",
        "Or set a default first, then run the call:\n",
        "  juse(MyData)\n",
        "  jsubset(.x90_nowhere > 40)")))
check("X02 ... no \"not found\" and no variable-name question for a condition",
      !has(.gx1, "not found") && !has(.gx1, "variable name"))
check("X03 a bare name found nowhere keeps its question, and its fixes take lines of their own (pinned whole)",
      identical(.gx2, paste0(
        "jcorr(): '.x90_nowhere' not found. Did you mean to use it as a\n",
        "variable name?\n",
        "If so, name the data frame first:\n",
        "  jcorr(MyData, .x90_nowhere)\n",
        "Or set a default first, then run the call:\n",
        "  juse(MyData)\n",
        "  jcorr(.x90_nowhere)")))
check("X04 another function's computed input says the same: jdesc(.x90_nowhere + 1) needs a data frame",
      has(flat(grab(jdesc(.x90_nowhere + 1))),
          "jdesc(): .x90_nowhere + 1 needs a data frame, and none was named or set as the default."))
check("X05 every call line in both parses",
      local({ ls <- grep("^  ", c(strsplit(.gx1, "\n", fixed = TRUE)[[1]], strsplit(.gx2, "\n", fixed = TRUE)[[1]]), value = TRUE)
        length(ls) == 6L && all(vapply(ls, function(l) !inherits(try(parse(text = l), silent = TRUE), "try-error"), logical(1))) }))
options(.jst_default_data = .x_def)
rm(.x_def, .gx1, .gx2)
reset()

# =============================================================================
# Y -- HOW A NAME IS READ: RULING R18'S NAMES SLATE (S356, v0.9.229)
# =============================================================================
# Ruling R18 (Jeff, S355): "Name a variable without quotes, after its data
# frame. jstats always reads the data frame's variable, never a separate
# object with the same name. Anything that is not a variable -- a format, a
# convention, a map, a file name -- goes in quotes." The slate's four items
# and two riders, on the data-first front doors (models_check.R and
# missing_convention_check.R take the formula functions' and the recode
# family's). (b) A quoted name is accepted wherever a variable is named:
# jrecode(), jrelabel() and jencode() strip the quotes as the other slots
# do; a variable list, and the single-variable slots, take a c() of names,
# bare or quoted (no ranges, no helpers). (c) A bare word where a quoted
# value goes gets jload()'s pointer with the call to run, at every argument
# that takes a fixed word, and (rider B) at the free-text slots -- a name,
# a sheet, a folder, a category. (d) On the vector path, when a data frame
# in the workspace has a variable of the name read, two lines under the
# title say so and give the call that reads the variable. Lean 4: the
# not-a-data-frame stops name the one frame that has the variable where
# they printed MyData. Rider A: a data frame's name in quotes gets the call
# without them. Fixture names no workspace is likely to hold (zz_y*, .y*);
# a check's working objects are made inside local().
reset()
.y_def <- getOption(".jst_default_data")
options(.jst_default_data = NULL)
.y_row <- function(v, name) any(grepl(paste0("^", name, " +[0-9]"), v))
# .y_pl(): plines() for a capture taken outside check() (guard 3), as .u_pl()
# in section U: a call that stops gives its error text, and the checks
# reading it go red where the battery would have halted (the m04 mutant of
# the S356 round halted here, on jdesc(d, c(Age, Gender)) refused).
.y_pl <- function(expr) tryCatch(plines(expr),
                                 error = function(e) paste0("[error] ", conditionMessage(e)))
# -- (b) a c() of names, bare or quoted, in every list --------------------
.y01 <- .y_pl(jdesc(d, c(Age, Gender)))
check("Y01 jdesc(d, c(Age, Gender)): the two variables, not \"c(Age, Gender) was not found\"",
      any(.y01 == "12 Cases in the 2 Variable Pool; 11 Complete on All") &&
        .y_row(.y01, "Age") && .y_row(.y01, "Gender"))
check("Y02 the quoted form and the mixed form read the same",
      identical(plines(jdesc(d, c("Age", "Gender"))), .y01) &&
        identical(plines(jdesc(d, c(Age, "Gender"))), .y01))
check("Y03 a c() beside other names, in order: jdesc(d, Keep01, c(Age, Gender), \"Name\")",
      local({ v <- plines(jdesc(d, Keep01, c(Age, Gender)))
              i <- c(which(grepl("^Keep01 ", v)), which(grepl("^Age ", v)),
                     which(grepl("^Gender ", v)))
              length(i) == 3L && all(diff(i) > 0L) &&
                any(v == "12 Cases in the 3 Variable Pool; 11 Complete on All") }))
check("Y04 every list takes it: jfreq(), jscreen(), jcorr(), jalpha(), jsum(), javg(), jcomplete(), the four registration verbs, jconvert(), jdeclare_missing(), jplot()",
      local({
        f <- plines(jfreq(d, c(Gender, Keep01)))
        s <- plines(jscreen(d, c("Age", Keep01)))
        r <- plines(jcorr(d, c(Age, Keep01)))
        a <- !errs(jalpha(d, c(Age, Keep01, Gender)))
        su <- jsum(d, c(Age, Keep01)); av <- javg(d, c("Age", "Keep01"))
        cm <- plines(jcomplete(d, c(Age, Keep01))); quiet(jcomplete(d, off))
        dm <- plines(jdummy(d, c(Condition))); quiet(jdummy(d, Condition, remove = TRUE))
        nu <- grab(jnumeric(d, c(Keep01, Gender))); quiet(jnumeric(d, NULL))
        co <- grab(jcount(d, c(Keep01, Gender)));   quiet(jcount(d, NULL))
        li <- grab(jlikert(d, c(Keep01, Gender)));  quiet(jlikert(d, NULL))
        cv <- grab(jconvert(d, c(Age, Keep01), to = "stata"))
        dc <- grab(jdeclare_missing(d, c(Age, Keep01), codes = -99, convention = "spss"))
        pl <- !errs(jplot(d, c(Age)))
        any(f == "Gender") && any(f == "Keep01") &&
          any(s == "  Variables: 2") && any(grepl("Age & Keep01", r)) && a &&
          length(su) == 12L && length(av) == 12L &&
          any(grepl("Age", cm)) && any(grepl("Keep01", cm)) &&
          any(grepl("Variable: Condition", dm)) &&
          grepl("Keep01", nu) && grepl("Gender", nu) && !has(nu, "not found") &&
          grepl("Keep01", co) && grepl("Gender", co) && !has(co, "not found") &&
          grepl("Keep01", li) && grepl("Gender", li) && !has(li, "not found") &&
          !grepl("not found", cv, fixed = TRUE) &&
          !has(dc, "not found") && pl }))
check("Y05 a misspelled name inside the c() is the one named: \"Agee was not found in the d data frame.\"",
      identical(grab(jdesc(d, c(Age, Agee))),
                "jdesc(): Agee was not found in the d data frame.\nCheck the spelling."))
check("Y06 a range and a helper keep the not-found stop, as decided",
      identical(grab(jdesc(d, Age:Gender)),
                "jdesc(): Age:Gender was not found in the d data frame.\nCheck the spelling.") &&
        identical(grab(jdesc(d, c(Age, starts_with("G")))),
                  "jdesc(): c(Age, starts_with(\"G\")) was not found in the d data frame.\nCheck the spelling."))
check("Y07 under a juse() default a c() of names the frame has is the frame's variables, with R12's line when the workspace shares a name -- and still the frame's when the workspace holds both names, where R's c() would have joined the two vectors",
      local({ .y7 <- data.frame(zz_ya = c(1, 2, 3, 4, 5, 6), zz_yb = c(1, 2, 1, 2, 1, 2))
              quiet(juse(.y7)); zz_ya <- c(9, 9)
              v <- plines(jdesc(c(zz_ya, zz_yb)))
              zz_yb <- c(8, 8)
              w <- plines(jdesc(c(zz_ya, zz_yb))); quiet(juse(NULL))
              any(v == "Using default data frame: .y7") &&
                any(v == "zz_ya is the variable in .y7, not the separate object with that name.") &&
                any(v == "6 Cases in the 2 Variable Pool") &&
                any(w == "6 Cases in the 2 Variable Pool") && .y_row(w, "zz_ya") && .y_row(w, "zz_yb") &&
                grepl("zz_ya and zz_yb are variables in .y7, not the separate objects with those names.",
                      paste(w, collapse = " "), fixed = TRUE) }))
check("Y08 with no frame in hand a c() keeps R's meaning: the joined vector, named as typed",
      local({ zz_ya <- c(1, 2, 3); zz_yb <- c(4, 5, 6)
              v <- plines(jdesc(c(zz_ya, zz_yb)))
              any(v == "6 Cases in the 1 Variable Pool") && any(grepl("^c\\(zz_ya, zz_yb\\) +6 ", v)) }))
# -- (b) the single-variable slots -----------------------------------------
check("Y09 jrecode(d, \"Gender\", ...), jrelabel(d, \"Gender\", ...) and jencode(d, \"Name\") read the variable, as the bare form does",
      local({ r1 <- suppressMessages(jrecode(d, "Gender", map = "1=0; 2=1"))
              r2 <- suppressMessages(jrecode(d, Gender, map = "1=0; 2=1"))
              l1 <- suppressMessages(jrelabel(d, "Gender", labels = "1=M; 2=F"))
              l2 <- suppressMessages(jrelabel(d, Gender, labels = "1=M; 2=F"))
              e1 <- suppressMessages(jencode(d, "Name"))
              e2 <- suppressMessages(jencode(d, Name))
              identical(r1, r2) && identical(l1, l2) && identical(e1, e2) }))
check("Y10 a c() of one is the variable in the three; a c() of several stops, naming them (pinned whole)",
      local({ ok1 <- identical(suppressMessages(jrecode(d, c(Gender), map = "1=0; 2=1")),
                               suppressMessages(jrecode(d, Gender, map = "1=0; 2=1")))
              g <- grab(jrecode(d, c(Age, Gender), map = "1=0"))
              ok1 && identical(g, paste0(
                "jrecode(): only one variable goes after the data frame, and this\n",
                "call gives Age and Gender.\n",
                "Name one variable, and run the call once for each.")) &&
                identical(grab(jencode(d, c(Name, Age))), paste0(
                  "jencode(): only one variable goes after the data frame, and this\n",
                  "call gives Name and Age.\n",
                  "Name one variable, and run the call once for each.")) &&
                has(grab(jrelabel(d, c(Age, Gender), labels = "1=x")),
                    "jrelabel(): only one variable goes after the data frame") }))
check("Y11 by = c(Gender) groups; by = c(Gender, Keep01) stops (pinned whole)",
      !errs(jdesc(d, Age, by = c(Gender))) &&
        identical(grab(jdesc(d, Age, by = c(Gender, Keep01))), paste0(
          "jdesc(): by = takes one variable, and this call gives Gender\n",
          "and Keep01.\nName one variable.")))
# -- rider A: a data frame's name in quotes ---------------------------------
zz_y12 <- grab(jdesc("d", Age))
check("Y12 jdesc(\"d\", Age): the name in quotes, and the call without them (pinned whole); it read \"Age needs the data frame, not the single column \"d\"\"",
      identical(zz_y12, "jdesc(): \"d\" is in quotes.\nA data frame's name goes without them:\n  jdesc(d, Age)"))
check("Y13 the same at the formula front door, juse(), jsave(), jsubset(), jcomplete() and jplot(), each with its own call",
      identical(grab(jt(Age ~ Gender, "d")), "jt(): \"d\" is in quotes.\nA data frame's name goes without them:\n  jt(Age ~ Gender, d)") &&
        identical(grab(juse("d")), "juse(): \"d\" is in quotes.\nA data frame's name goes without them:\n  juse(d)") &&
        identical(grab(jsave("d", "x.rds")), "jsave(): \"d\" is in quotes.\nA data frame's name goes without them:\n  jsave(d, \"x.rds\")") &&
        identical(grab(jsubset("d", Age > 40)), "jsubset(): \"d\" is in quotes.\nA data frame's name goes without them:\n  jsubset(d, Age > 40)") &&
        identical(grab(jcomplete("d", Age)), "jcomplete(): \"d\" is in quotes.\nA data frame's name goes without them:\n  jcomplete(d, Age)") &&
        identical(grab(jplot("d", Age)), "jplot(): \"d\" is in quotes.\nA data frame's name goes without them:\n  jplot(d, Age)"))
check("Y14 a string that names no data frame is what it is: a one-case text variable",
      local({ v <- plines(jfreq("zz_ynothing"))
              any(v == "1 Cases in the 1 Variable Pool") && !any(grepl("in quotes", v)) }))
# -- (d) the vector path's collision line -----------------------------------
zz_y1 <- data.frame(zz_ya = c(20, 30, 40, 50, NA, 60), zz_yb = c(1, 2, 1, 2, 1, 2))
zz_ya <- c(1, 2, 3)
.y_l1 <- "zz_ya is a separate object in your workspace, not the variable in zz_y1."
.y_l2 <- "To analyze the variable, name the data frame:"
# .y_under(): the three things under the title -- the sentence (wrapped at
# the pin, so joined), the "To analyze" line, the call line.
.y_under <- function(v, title) {
  i <- which(v == title)
  if (length(i) != 1L) return(character(0))
  j <- which(v == "To analyze the variable, name the data frame:")
  if (length(j) != 1L || j <= i + 1L) return(character(0))
  c(paste(v[(i + 1L):(j - 1L)], collapse = " "), v[j], v[j + 1L])
}
zz_y15 <- .y_pl(jdesc(zz_ya))
check("Y15 jdesc(zz_ya) with zz_y1 holding zz_ya: the three lines under the title, and the vector still analyzed",
      identical(.y_under(zz_y15, "Descriptive Statistics"), c(.y_l1, .y_l2, "  jdesc(zz_y1, zz_ya)")) &&
        any(zz_y15 == "3 Cases in the 1 Variable Pool"))
check("Y16 (zz_ya) and .GlobalEnv$zz_ya are the same object, read by name: the lines fire, the row as typed",
      local({ a <- plines(jdesc((zz_ya))); b <- plines(jdesc(.GlobalEnv$zz_ya))
              identical(.y_under(a, "Descriptive Statistics"), c(.y_l1, .y_l2, "  jdesc(zz_y1, zz_ya)")) &&
                identical(.y_under(b, "Descriptive Statistics"), c(.y_l1, .y_l2, "  jdesc(zz_y1, zz_ya)")) &&
                any(grepl("^\\(zz_ya\\) +3 ", a)) && any(grepl("^zz_ya +3 ", b)) }))
check("Y17 jfreq() and jscreen() print the same lines, each naming its own call",
      identical(.y_under(plines(jfreq(zz_ya)), "Frequencies"), c(.y_l1, .y_l2, "  jfreq(zz_y1, zz_ya)")) &&
        identical(.y_under(plines(jscreen(zz_ya)), "Data Screening"), c(.y_l1, .y_l2, "  jscreen(zz_y1, zz_ya)")))
check("Y18 no data frame holds the name: no line (zz_yx)",
      local({ zz_yx <- c(4, 5, 6); v <- plines(jdesc(zz_yx))
              !any(grepl("separate object", v)) && identical(v[2L], "") }))
check("Y19 two frames hold it: both named, and the line keeps MyData",
      local({ zz_y2 <- zz_y1; v <- plines(jdesc(zz_ya))
              identical(.y_under(v, "Descriptive Statistics"),
                        c("zz_ya is a separate object in your workspace, not the variable in zz_y1 or zz_y2.",
                          .y_l2, "  jdesc(MyData, zz_ya)")) }))
check("Y20 under a juse() default that lacks the variable the lines fire; under one that has it, R12's line instead",
      local({ f <- data.frame(zz_yq = 1:3); quiet(juse(f))
              a <- plines(jdesc(zz_ya))
              quiet(juse(zz_y1)); b <- plines(jdesc(zz_ya)); quiet(juse(NULL))
              identical(.y_under(a, "Descriptive Statistics"), c(.y_l1, .y_l2, "  jdesc(zz_y1, zz_ya)")) &&
                !any(grepl("separate object in your workspace", b)) &&
                any(b == "zz_ya is the variable in zz_y1, not the separate object with that name.") }))
check("Y21 a column typed with its frame, and a copy under another name, get no line",
      local({ zz_yc <- zz_y1$zz_ya; a <- plines(jdesc(zz_y1$zz_ya)); b <- plines(jdesc(zz_yc))
              !any(grepl("separate object", c(a, b))) }))
check("Y22 the line runs: jdesc(zz_y1, zz_ya) is the frame's variable, six cases",
      local({ ln <- .y_under(zz_y15, "Descriptive Statistics")[3L]
              v <- plines(eval(parse(text = ln)[[1]]))
              any(v == "6 Cases in the 1 Variable Pool") }))
check("Y23 the lines print at every output level, and are wrapped at the message width",
      local({ quiet(joutput("minimal", quiet = TRUE)); v <- plines(jfreq(zz_ya)); quiet(joutput(NULL, quiet = TRUE))
              identical(.y_under(v, "Frequencies"), c(.y_l1, .y_l2, "  jfreq(zz_y1, zz_ya)")) &&
                all(nchar(v) <= .pin_width) }))
# -- lean 4: the not-a-data-frame stops name the frame ----------------------
check("Y24 jplot(zz_ya): the two fix lines name zz_y1, the one frame that has the variable (pinned whole)",
      identical(grab(jplot(zz_ya)), paste0(
        "jplot(): 'zz_ya' is not a data frame. Did you mean to use it as a\n",
        "variable name?\n",
        "If so, name the data frame first:\n",
        "  jplot(zz_y1, zz_ya)\n",
        "Or set a default first, then run the call:\n",
        "  juse(zz_y1)\n",
        "  jplot(zz_ya)")))
check("Y25 jcorr() and jalpha() the same; a name found nowhere that a frame has names it too",
      has(grab(jcorr(zz_ya)), "  jcorr(zz_y1, zz_ya)\n") && has(grab(jalpha(zz_ya)), "  juse(zz_y1)\n") &&
        has(grab(jdesc(zz_yb)), "'zz_yb' not found. Did you mean") && has(grab(jdesc(zz_yb)), "  jdesc(zz_y1, zz_yb)\n"))
check("Y26 on the vector path, the refusal of a second variable names the frame that has both; MyData when none has them",
      local({ zz_yb <- c(1, 2, 3)
              a <- grab(jdesc(zz_ya, zz_yb)); zz_yz <- 1; b <- grab(jdesc(zz_ya, zz_yz))
              has(a, "Name the data frame first:\n  jdesc(zz_y1, zz_ya, zz_yb)") &&
                has(b, "Name the data frame first:\n  jdesc(MyData, zz_ya, zz_yz)") }))
check("Y27 two frames hold the variable: the stops keep MyData",
      local({ zz_y2 <- zz_y1; has(grab(jplot(zz_ya)), "  jplot(MyData, zz_ya)\n") }))
check("Y28 the named lines run: jplot(zz_y1, zz_ya) draws, juse(zz_y1) sets the default",
      local({ ok <- !errs(jplot(zz_y1, zz_ya)); quiet(juse(zz_y1))
              d0 <- getOption(".jst_default_data"); quiet(juse(NULL))
              ok && identical(d0, "zz_y1") }))
rm(zz_y1, zz_ya, .y_l1, .y_l2, .y_under, zz_y15)
# -- (c) a bare word where a quoted value goes: the data-first doors ---------
check("Y29 jdesc(d, Age, variable.id = labels): the pointer, the call to run (pinned whole); it was R's \"object 'labels' not found\"",
      identical(grab(jdesc(d, Age, variable.id = labels)), paste0(
        "jdesc(): labels is not in quotes.\n",
        "variable.id = takes a display mode in quotes:\n",
        "  jdesc(d, Age, variable.id = \"labels\")")))
.y30 <- list(
  f  = grab(jfreq(d, Gender, missing.detail = totals)),
  s  = grab(jscreen(d, Age, stats = median)),
  cm = grab(jcorr(d, Age, Keep01, method = spearman)),
  cl = grab(jcorr(d, Age, Keep01, layout = stacked)),
  a  = grab(jalpha(d, Age, Keep01, Gender, case.processing.detail = totals)))
check("Y30 jfreq(missing.detail =), jscreen(stats =), jcorr(method =, layout =), jalpha(case.processing.detail =): each the pointer with its noun (pinned whole)",
      identical(.y30$f, "jfreq(): totals is not in quotes.\nmissing.detail = takes a detail level in quotes:\n  jfreq(d, Gender, missing.detail = \"totals\")") &&
        identical(.y30$s, "jscreen(): median is not in quotes.\nstats = takes a statistic name in quotes:\n  jscreen(d, Age, stats = \"median\")") &&
        identical(.y30$cm, "jcorr(): spearman is not in quotes.\nmethod = takes a method name in quotes:\n  jcorr(d, Age, Keep01, method = \"spearman\")") &&
        identical(.y30$cl, "jcorr(): stacked is not in quotes.\nlayout = takes a layout name in quotes:\n  jcorr(d, Age, Keep01, layout = \"stacked\")") &&
        identical(.y30$a, "jalpha(): totals is not in quotes.\ncase.processing.detail = takes a detail level in quotes:\n  jalpha(d, Age, Keep01, Gender, case.processing.detail = \"totals\")"))
check("Y31 joutput(): a level or a setting name in first position, a diagnostic, a row form and a display mode; a positional word gets the sentence form, a named one names the argument (pinned whole)",
      identical(grab(joutput(full)), "joutput(): full is not in quotes.\nA level or setting name goes in quotes:\n  joutput(\"full\")") &&
        identical(grab(joutput(digits)), "joutput(): digits is not in quotes.\nA level or setting name goes in quotes:\n  joutput(\"digits\")") &&
        identical(grab(joutput(diagnostics = levene)), "joutput(): levene is not in quotes.\ndiagnostics = takes a diagnostic name in quotes:\n  joutput(diagnostics = \"levene\")") &&
        identical(grab(joutput(case.processing.filter = list)), "joutput(): list is not in quotes.\ncase.processing.filter = takes a row form in quotes:\n  joutput(case.processing.filter = \"list\")") &&
        identical(grab(joutput(variable.id = labels, quiet = TRUE)), "joutput(): labels is not in quotes.\nvariable.id = takes a display mode in quotes:\n  joutput(variable.id = \"labels\", quiet = TRUE)"))
check("Y32 joptions(): the convention named or positional -- the line always names missing.convention -- a layout, a detail level; and data.dir = typed bare (rider B)",
      identical(grab(joptions(missing.convention = spss)), "joptions(): spss is not in quotes.\nmissing.convention = takes a convention name in quotes:\n  joptions(missing.convention = \"spss\")") &&
        identical(grab(joptions(spss)), "joptions(): spss is not in quotes.\nA convention name goes in quotes:\n  joptions(missing.convention = \"spss\")") &&
        identical(grab(joptions(corr.layout = stacked)), "joptions(): stacked is not in quotes.\ncorr.layout = takes a layout name in quotes:\n  joptions(corr.layout = \"stacked\")") &&
        identical(grab(joptions(missing.detail = per_code)), "joptions(): per_code is not in quotes.\nmissing.detail = takes a detail level in quotes:\n  joptions(missing.detail = \"per_code\")") &&
        identical(grab(joptions(data.dir = Data)), "joptions(): Data is not in quotes.\ndata.dir = takes a folder name in quotes:\n  joptions(data.dir = \"Data\")"))
check("Y33 rider B at jdata_dir(), jload(name =) and jload(sheet =): a bare symbol that resolves to nothing, before the file is looked for",
      identical(grab(jdata_dir(Data)), "jdata_dir(): Data is not in quotes.\nA folder name goes in quotes:\n  jdata_dir(\"Data\")") &&
        identical(grab(jload("nofile.rds", name = mydata)), "jload(): mydata is not in quotes.\nname = takes a name in quotes:\n  jload(\"nofile.rds\", name = \"mydata\")") &&
        identical(grab(jload("nofile.xlsx", sheet = Data)), "jload(): Data is not in quotes.\nsheet = takes a sheet name in quotes:\n  jload(\"nofile.xlsx\", sheet = \"Data\")"))
check("Y34 jdummy(ref =): a category typed bare, as typed; and the line runs whatever its case, the match made without regard to it",
      local({ zz_yr <- data.frame(zz_yg = haven::labelled(c(1, 2, 1, 2, 1, 2), c(North = 1, South = 2)))
              a <- grab(jdummy(zz_yr, zz_yg, ref = South)); b <- grab(jdummy(zz_yr, zz_yg, ref = south))
              v <- plines(jdummy(zz_yr, zz_yg, ref = "south")); quiet(jdummy(zz_yr, zz_yg, remove = TRUE))
              identical(a, "jdummy(): South is not in quotes.\nref = takes a category's code or label in quotes:\n  jdummy(zz_yr, zz_yg, ref = \"South\")") &&
                identical(b, "jdummy(): south is not in quotes.\nref = takes a category's code or label in quotes:\n  jdummy(zz_yr, zz_yg, ref = \"south\")") &&
                any(v == "  Reference category: zz_yg_South") }))
check("Y35 the word is matched without regard to case and the line spells the value as the function takes it",
      identical(grab(joutput(Full)), "joutput(): Full is not in quotes.\nA level or setting name goes in quotes:\n  joutput(\"full\")") &&
        has(grab(jcorr(d, Age, Keep01, method = Spearman)), "  jcorr(d, Age, Keep01, method = \"spearman\")"))
check("Y36 a name holding a value still works, and a word that is not one of the values is left to R",
      local({ fmt <- "spearman"; ok <- !errs(jcorr(d, Age, Keep01, method = fmt))
              ok && identical(grab(jdesc(d, Age, variable.id = label)), "object 'label' not found") }))
check("Y37 every pointer's call line parses, and three of them run",
      local({ g <- c(grab(jdesc(d, Age, variable.id = labels)), unlist(.y30),
                     grab(joutput(full)), grab(joptions(spss)), grab(jdata_dir(Data)),
                     grab(jload("nofile.rds", name = mydata)), grab(jdummy(d, Condition, ref = zz_ynot)))
              ls <- grep("^  ", unlist(strsplit(g, "\n", fixed = TRUE)), value = TRUE)
              length(ls) == 11L &&
                all(vapply(ls, function(l) !inherits(try(parse(text = l), silent = TRUE), "try-error"), logical(1))) &&
                !errs(jdesc(d, Age, variable.id = "labels")) &&
                !errs(jcorr(d, Age, Keep01, method = "spearman")) &&
                identical(jdata_dir("Data"), "Data") }))
rm(.y30, zz_y12, .y01, .y_row, .y_pl)
options(.jst_default_data = .y_def)
rm(.y_def)
reset()

# =============================================================================
# Z -- RULING R19, DATA FRAMES ONLY: CONDITIONS AND THE VECTOR PATH (S357)
# =============================================================================
# A condition -- jsubset() when set, subset = per call, a stored filter --
# that reads a workspace object of one value per case stops with R19's one
# message, filtered or not (until S357 it passed unless jcomplete() or a
# stored filter had cut the frame, and then got the S331 add-it line).
# A bare name is read too. A stored filter meets one only when the object
# behind it changed after it was set. The vector path keeps the single
# vector (jdesc(x), jfreq(x), jscreen(x)); a condition there reading
# another one gets the lines that put both in a data frame, and a column of
# a frame (d$Age) is analyzed in its frame, in the frame's words. Values
# still pass. models_check.R section T holds the formula side. Fixtures
# dotted; working objects in local().
# =============================================================================
reset()
.z_fix <- function(txt) {
  lns <- strsplit(txt, "\n", fixed = TRUE)[[1]]
  trimws(lns[grepl("^  ", lns)])
}
.z_obj <- function(fn, op, typed = NULL, frame = "d") {
  paste0(fn, "(): ", if (!is.null(typed)) paste0("In ", typed, ", "), op,
         " is not in the ", frame, " data frame; it is a separate object in ",
         "your workspace. jstats analyzes the variables of a data frame.")
}
check("Z01 jsubset() SET on a one-per-case object, nothing cutting the frame: refused with the line that adds it and the call, and nothing stored (it was set)",
      local({ k12 <- d$Age > 35 | is.na(d$Age)
              m <- grab(jsubset(d, k12 == TRUE))
              has(flat(m), .z_obj("jsubset", "k12", "k12 == TRUE")) &&
                identical(.z_fix(m), c("d$k12 <- k12", "jsubset(d, k12 == TRUE)")) &&
                is.null(fs_of("d")) }))
check("Z02 ... the two lines, run, set the filter on the frame's new column",
      local({ k12 <- d$Age > 35 | is.na(d$Age); dz <- d
              m <- grab(jsubset(dz, k12 == TRUE))
              for (f in .z_fix(m)) quiet(eval(parse(text = f)))
              ok <- identical(fs_of("dz")$expr_str, "k12 == TRUE") && "k12" %in% names(dz)
              quiet(jsubset(dz, NULL)); ok }))
check("Z03 a bare name, a comparison and an object reached through $, per call with subset =: each stops, with the call as typed (the fetched one under its last name)",
      local({ k12 <- d$Age > 35 | is.na(d$Age); l12 <- list(w = d$Keep01 * 2)
              a <- grab(jdesc(d, Age, subset = k12))
              b <- grab(jfreq(d, Gender, subset = k12 == TRUE))
              cc <- grab(jdesc(d, Age, subset = l12$w > 0))
              has(flat(a), .z_obj("jdesc", "k12", "subset = k12")) &&
                identical(.z_fix(a), c("d$k12 <- k12", "jdesc(d, Age, subset = k12)")) &&
                has(flat(b), .z_obj("jfreq", "k12", "subset = k12 == TRUE")) &&
                has(flat(cc), .z_obj("jdesc", "l12$w", "subset = l12$w > 0")) &&
                identical(.z_fix(cc), c("d$w <- l12$w", "jdesc(d, Age, subset = w > 0)")) }))
check("Z04 a stored filter whose value became one value per case: R19's stored form with the line that adds it, no exits; the status display says the same; on refuses and it stays off",
      local({ z_v <- 35
              quiet(jsubset(d, Age > z_v)); z_v <- d$Age
              assign("z_v", z_v, envir = globalenv())
              on.exit({ rm("z_v", envir = globalenv()); quiet(jsubset(d, NULL)) }, add = TRUE)
              a <- grab(jdesc(d, Age)); st <- grab(jsubset())
              quiet(jsubset(d, off)); o <- grab(jsubset(d, on))
              has(flat(a), "jdesc(): the jsubset filter for the d data frame, Age > z_v, cannot be applied: z_v is not in the d data frame; it is a separate object in your workspace.") &&
                identical(.z_fix(a), "d$z_v <- z_v") && !has(a, "To set it aside") &&
                has(flat(st), "It cannot be applied: z_v is not in the d data frame; it is a separate object in your workspace.") &&
                has(o, "\nThe filter stays off.\njstats analyzes the variables of a data frame.\n") &&
                identical(fs_of("d")$active, FALSE) }))
check("Z05 values in a condition still pass: one value, a set of one-per-case length with %in%, a summary of a one-per-case vector, a lookup by a variable",
      local({ z_cut <- 35; z_set <- rep(c(1, 3), 6); z_w <- d$Age; z_by <- c(35, 45)
              ok <- function(expr) { g <- grab(expr); r <- has(g, "jsubset activated for d"); quiet(jsubset(d, NULL)); r }
              ok(jsubset(d, Age > z_cut)) && ok(jsubset(d, Condition %in% z_set)) &&
                ok(jsubset(d, Age > mean(z_w, na.rm = TRUE))) && ok(jsubset(d, Age > z_by[Gender])) }))
check("Z06 the vector path: a condition reading another one-per-case object stops with the lines that put both in a data frame; the lines run and describe the vector",
      local({ zx <- d$Age; zw <- d$Keep01
              m <- grab(jdesc(zx, subset = zw == 1))
              fix <- .z_fix(m)
              ok <- identical(fix, c("mydata <- data.frame(zx, zw)", "jdesc(mydata, zx, subset = zw == 1)"))
              for (f in fix) if (ok) quiet(eval(parse(text = f)))
              has(flat(m), "jdesc(): In subset = zw == 1, zw is a separate object in your workspace. jstats analyzes the variables of a data frame.") &&
                has(m, "Put both in a data frame first:") && ok && exists("mydata", inherits = FALSE) }))
check("Z07 ... reached through $: under its last name; jfreq() and jscreen() the same; the single vector alone still described by all three",
      local({ zx <- d$Gender; zl <- list(w = d$Keep01)
              a <- grab(jfreq(zx, subset = zl$w == 1))
              b <- grab(jscreen(zx, subset = zl$w == 1))
              identical(.z_fix(a), c("mydata <- data.frame(zx, w = zl$w)", "jfreq(mydata, zx, subset = w == 1)")) &&
                has(flat(b), "jscreen(): In subset = zl$w == 1, zl$w is a separate object in your workspace.") &&
                !errs(jdesc(zx)) && !errs(jfreq(zx)) && !errs(jscreen(zx)) }))
check("Z08 a column of a frame is analyzed in its frame: the frame's form, its name in the line",
      local({ zw <- d$Keep01
              m <- grab(jdesc(d$Age, subset = zw == 1))
              has(flat(m), .z_obj("jdesc", "zw", "subset = zw == 1")) &&
                identical(.z_fix(m), c("d$zw <- zw", "jdesc(d$Age, subset = zw == 1)")) }))
rm(.z_fix, .z_obj)
reset()

# =============================================================================
# AA -- FIX SLATE 10 AND SCRIPTS SLATE B AT THE FILTERS (S359, v0.9.232)
# =============================================================================
# (1) The vector path's refusal of a condition naming another variable of
# the column's frame no longer depends on the workspace (the S342 dirty
# entry): with a separate Keep01 in the workspace, jdesc(d$Age, subset =
# Keep01 == 1) passed the check and was analyzed on d's own Keep01 (ruling
# R18: the frame's variable is the one read), where with none it was
# refused. (2) The filter shape check counts CASES and names the workspace
# object a wrong-length result came from, as ruling R19's stop names one
# (the S357 item; Jeff's S358 okay), keeping its own fix line. (3) The
# pipeline masks declared missing values only in the analysis variables and
# the columns its settings read (the S217 item's fix 2): a column only a
# condition reads is still read with its declared codes missing. Fixtures
# dotted; working objects in local(); a workspace name set for a check is
# put back as it was by .aa_ws().
# =============================================================================
reset()
# .aa_ws(): run expr with a workspace name set to val (NULL: absent), and
# put the name back as it was.
.aa_ws <- function(nm, val, expr) {
  had <- exists(nm, envir = globalenv(), inherits = FALSE)
  old <- if (had) get(nm, envir = globalenv()) else NULL
  if (is.null(val)) {
    if (had) rm(list = nm, envir = globalenv())
  } else {
    assign(nm, val, envir = globalenv())
  }
  on.exit({
    if (had) assign(nm, old, envir = globalenv())
    else if (exists(nm, envir = globalenv(), inherits = FALSE)) rm(list = nm, envir = globalenv())
  }, add = TRUE)
  expr
}
check("AA01 the vector path refuses a condition on another variable of the column's frame whatever the workspace holds: a separate Keep01 of 3 values, or of one value per case, gives the same refusal as none (it analyzed d's own Keep01)",
      local({ clean <- .aa_ws("Keep01", NULL, grab(jdesc(d$Age, subset = Keep01 == 1)))
              k3  <- .aa_ws("Keep01", c(1, 0, 1), grab(jdesc(d$Age, subset = Keep01 == 1)))
              k12 <- .aa_ws("Keep01", rep(1, 12), grab(jdesc(d$Age, subset = Keep01 == 1)))
              has(flat(clean), "jdesc(): subset = Keep01 == 1 refers to Keep01, which the single column d$Age does not contain.") &&
                identical(k3, clean) && identical(k12, clean) }))
check("AA02 ... jfreq() and jscreen() alike",
      local({ f0 <- .aa_ws("Keep01", NULL, grab(jfreq(d$Gender, subset = Keep01 == 1)))
              f1 <- .aa_ws("Keep01", c(1, 0, 1), grab(jfreq(d$Gender, subset = Keep01 == 1)))
              s0 <- .aa_ws("Keep01", NULL, grab(jscreen(d$Age, subset = Keep01 == 1)))
              s1 <- .aa_ws("Keep01", rep(0, 12), grab(jscreen(d$Age, subset = Keep01 == 1)))
              has(f0, "refers to Keep01") && identical(f1, f0) &&
                has(s0, "refers to Keep01") && identical(s1, s0) }))
check("AA03 control: a workspace value a condition names is still read on the vector path (a cutoff), and a column of a frame is analyzed in its frame",
      .aa_ws("zz_aa_cut", 40, !errs(jdesc(d$Age, subset = Age > zz_aa_cut))) &&
        identical(.aa_ws("zz_aa_cut", 40, plines(jdesc(d$Age, subset = Age > zz_aa_cut))),
                  .aa_ws("zz_aa_cut", 40, plines(jdesc(d, Age, subset = Age > zz_aa_cut)))))
check("AA04 the shape check per call names the object a wrong count came from, counts cases, and keeps its own fix line (it said 'has 5 values for 12 rows')",
      local({ keep5 <- c(TRUE, FALSE, TRUE, TRUE, FALSE)
              m <- grab(jfreq(d, Gender, subset = keep5 == TRUE))
              identical(m, paste0(
                "jfreq(): In subset = keep5 == TRUE, keep5 is not in the d data\n",
                "frame; it is a separate object in your workspace.\n",
                "It has 5 values for the 12 cases in the d data frame, not one TRUE or FALSE\n",
                "for every case.\n",
                "In your jfreq() call, compare a variable to a value, for example\n",
                "subset = Age < 40.")) }))
check("AA05 ... a frame cut by jcomplete() first: 'the 11 cases left after filtering'",
      local({ keep5 <- c(TRUE, FALSE, TRUE, TRUE, FALSE)
              quiet(jcomplete(d, Age))
              m <- grab(jdesc(d, Gender, subset = keep5 == TRUE)); quiet(jcomplete(d, NULL))
              has(flat(m), "It has 5 values for the 11 cases left after filtering, not one TRUE or FALSE for every case.") }))
check("AA06 ... a bare name of the wrong length is the object itself: no 'In keep5,' before it",
      local({ keep5 <- c(TRUE, FALSE, TRUE, TRUE, FALSE)
              m <- grab(jsubset(d, keep5))
              startsWith(m, "jsubset(): keep5 is not in the d data frame; it is a separate") &&
                has(flat(m), "It has 5 values for the 12 cases in the d data frame, not one TRUE or FALSE for every case.") &&
                is.null(fs_of("d")) }))
check("AA07 .jst_check_mask_shape() as a unit: the stored and reactivate forms with an object read as the stored recycling stop does -- 'cannot be applied: keep5 is not in ..., with 5 values for 12 cases.' -- and close on their exits",
      local({ ob <- list(operand = quote(keep5), n = 5L)
              f  <- function(origin) tryCatch(
                jstats:::.jst_check_mask_shape(rep(TRUE, 5), 12L, quote(keep5 == TRUE),
                                               "keep5 == TRUE", origin, data_name = "d",
                                               object = ob),
                error = function(e) conditionMessage(e))
              a <- f("stored"); b <- f("reactivate")
              has(flat(a), "the jsubset filter for the d data frame, keep5 == TRUE, cannot be applied: keep5 is not in the d data frame; it is a separate object in your workspace, with 5 values for 12 cases.") &&
                has(a, "12 cases.\nTo set it aside, run:\n  jsubset(d, off)") &&
                has(b, "12 cases.\nThe filter stays off.\nTo delete it, run:\n  jsubset(d, NULL)") }))
.aa_m <- local({
  set.seed(359); n <- 40
  data.frame(
    y = round(stats::rnorm(n, 50, 10)),
    f = haven::labelled_spss(ifelse(seq_len(n) %% 5 == 0, -99, rep(1:4, 10)),
                             labels = c(Refused = -99), na_values = -99),
    k = haven::labelled_spss(ifelse(seq_len(n) %% 8 == 0, -98, seq_len(n)),
                             labels = c(DK = -98), na_values = -98))
})
check("AA08 a column only a per-call condition reads is masked for it: its 8 declared cells are missing to subset = f > 1, as before the narrowing (the Filtered column's '(8 missing)')",
      local({ ln <- plines(jdesc(.aa_m, y, subset = f > 1))
              any(grepl("subset = +[0-9]+ +[0-9]+ +f > 1 \\(8 missing\\)$", ln)) }))
check("AA09 ... and for a stored jsubset() on it, and a jcomplete() on a third column: 5 cases excluded for k's declared code",
      local({ quiet(jsubset(.aa_m, f > 1)); a <- plines(jdesc(.aa_m, y)); quiet(jsubset(.aa_m, NULL))
              quiet(jcomplete(.aa_m, k)); b <- plines(jdesc(.aa_m, y)); quiet(jcomplete(.aa_m, NULL))
              any(grepl("jsubset\\(\\) +[0-9]+ +[0-9]+ +f > 1 \\(8 missing\\)$", a)) &&
                any(grepl("^ *jcomplete\\(\\) +5 +35", b)) }))
check("AA10 .jst_apply_pipeline() as a unit: given vars, only those columns and the columns a setting reads are masked; a name that is not a column, or none, masks every column",
      local({ dat <- .aa_m
              p1 <- jstats:::.jst_apply_pipeline(dat, ".aa_m", FALSE, vars = "y")$data
              p2 <- jstats:::.jst_apply_pipeline(dat, ".aa_m", FALSE, vars = "y",
                                                  subset_expr = quote(f > 0))$data
              p3 <- jstats:::.jst_apply_pipeline(dat, ".aa_m", FALSE, vars = c("y", "zz_cut"))$data
              p4 <- jstats:::.jst_apply_pipeline(dat, ".aa_m", FALSE)$data
              -99 %in% unclass(p1$f) && -98 %in% unclass(p1$k) &&
                !(-99 %in% unclass(p2$f)) && -98 %in% unclass(p2$k) &&
                !(-99 %in% unclass(p3$f)) && !(-98 %in% unclass(p3$k)) &&
                !(-99 %in% unclass(p4$f)) && !(-98 %in% unclass(p4$k)) }))
rm(.aa_ws, .aa_m)
reset()

# =============================================================================
# P -- THE MESSAGE SURFACE, SWEPT (S337)
# =============================================================================
# P01 (S337) -- NO PREMATURE BREAK, swept over every condition grab() took.
# jencode_check.R N42 brought to this file (the S291 item): a width CEILING
# sees a long line and is blind to a SHORT one, which is how the S287 double
# wrap sat under a green battery. For each pair of consecutive unindented
# prose lines, the lower line's first unit must NOT have fit on the line
# above. The unit is the first word, widened to what the wrapper will not
# split: an argument with its value (map = "..."), a call to its closing
# parenthesis, a quoted phrase to its closing quote. Exempt, each a break
# made on purpose: the line above ends a sentence (Rule 2, or a line the
# builder ended itself); the line below opens with a capitalized word (a new
# sentence under a line that ends in code), with "(" (jsave's format line)
# or with a file path (one unit whatever spaces it holds: on the workstation
# a temp path is long enough to take its own line, which a sandbox path is
# not -- the S337 first run); the line below is a paragraph's last line (the
# orphan pull-back moves a word DOWN). The first line is measured short by the emitter's own
# reserve for R's chrome, which conditionMessage() does not carry: 8 for an
# error ("Error : "), 9 for a warning ("Warning: "), 0 for a note. A
# condition taken while the width was not the pin is left out. Own helper,
# per the S287 convention; the count is a floor, so an emptied .seen fails.
pbreaks <- function(txt, width, first_line_slack = 0L) {
  ls   <- strsplit(txt, "\n", fixed = TRUE)[[1]]
  out  <- character(0)
  unit <- function(b) {
    tk <- strsplit(b, " ", fixed = TRUE)[[1]]
    n  <- if (length(tk) >= 3L && identical(tk[2L], "=")) 3L else 1L
    is_open <- function(x) {
      ch <- strsplit(x, "", fixed = TRUE)[[1]]
      sum(ch == "(") > sum(ch == ")") || sum(ch == "\"") %% 2L == 1L
    }
    while (n < length(tk) && is_open(paste(tk[seq_len(n)], collapse = " "))) {
      n <- n + 1L
    }
    paste(tk[seq_len(n)], collapse = " ")
  }
  for (i in seq_len(max(0L, length(ls) - 1L))) {
    a <- ls[i]; b <- ls[i + 1L]
    if (!nzchar(a) || !nzchar(b) || grepl("^ ", a) || grepl("^ ", b)) next
    if (grepl("[.!?]$", a) &&
        !grepl("^([A-Za-z]\\.){2,}$", sub(".*\\s", "", a))) next
    if (grepl("^[A-Z][a-z]+[ ,]", b) || grepl("^\\(", b)) next
    if (grepl("^([A-Za-z]:[\\\\/]|/|~|\\\\\\\\)", b)) next      # a file path
    if (grepl("[.!?:][)\"']?$", b)) next
    budget <- width - if (i == 1L) first_line_slack else 0L
    if (nchar(a) + 1L + nchar(unit(b)) <= budget)
      out <- c(out, sprintf("[%d] %s | %s", i, a, unit(b)))
  }
  out
}
.sw <- Filter(function(s) identical(as.numeric(s$width), as.numeric(.pin_width)),
              .seen)
.sw <- .sw[!duplicated(vapply(.sw, function(s) paste(s$kind, s$text), ""))]
.pb <- unlist(lapply(.sw, function(s) {
  pbreaks(s$text, .pin_width, switch(s$kind, error = 8L, warning = 9L, 0L))
}))
check(paste0("P01 no premature break: a line's first unit never fit on the ",
             "line above (", length(.sw), " conditions)"),
      length(.sw) >= 200L && length(.pb) == 0L)
if (length(.pb) > 0L) for (l in .pb) cat("        early: ", l, "\n")

# P02 (S337) -- EVERY RUNNABLE LINE PARSES (the S249 item's guard (3)).
# The width sweeps exempt indented lines by design, as Rule L runnable
# lines -- which leaves the one line class that most needs to RUN as the
# class no sweep reads; an unparseable jencode remedy went unseen that way
# (S249). An indented line with the shape of a call or an assignment is
# parsed, joined with the indented lines under it while it is incomplete. A
# line holding a <placeholder> is a pattern to fill in, not a line to run,
# and is left out. The count is a floor.
unparsed <- function(txt) {
  ls    <- strsplit(txt, "\n", fixed = TRUE)[[1]]
  shape <- "^ {2,}[A-Za-z.][A-Za-z0-9._]*(\\$[A-Za-z0-9._]+)* *(\\(|<- )"
  bad <- character(0); n <- 0L; i <- 1L
  while (i <= length(ls)) {
    if (grepl(shape, ls[i]) && !grepl("<[A-Za-z][A-Za-z ]*>", ls[i])) {
      n <- n + 1L; j <- i
      repeat {
        ok <- !inherits(try(parse(text = paste(ls[i:j], collapse = "\n")),
                            silent = TRUE), "try-error")
        if (ok || j >= length(ls) || !grepl("^ {2,}", ls[j + 1L])) break
        j <- j + 1L
      }
      if (!ok) bad <- c(bad, ls[i])
      i <- j + 1L
    } else i <- i + 1L
  }
  list(n = n, bad = bad)
}
.up <- lapply(.sw, function(s) unparsed(s$text))
.un <- sum(vapply(.up, function(u) u$n, integer(1)))
.ub <- unlist(lapply(.up, function(u) u$bad))
check(paste0("P02 every runnable line in a message parses (", .un,
             " lines)"),
      .un >= 100L && length(.ub) == 0L)
if (length(.ub) > 0L) for (l in .ub) cat("        does not parse: ", l, "\n")

# P03 (S338) -- NO MESSAGE HEDGES A COUNT. Every condition grab() took, at
# any width, is read for a noun carrying "(s)", "(es)" or "(ies)" -- the
# shortcut the S287 item removed from eleven runtime strings. The twelfth,
# the map parser's "Invalid old value(s)", kept it until v0.9.218 and was
# left out of this sweep by name; it names the invalid values alone now
# (S345), so the carve-out is gone and its message is put in front of the
# sweep here (missing_convention_check.R N84a-c pin its text). The count is
# a floor.
.g_p03 <- c(grab(jrecode(d, Age, map = "1, abc = 9; else=copy")),
            grab(jrecode(d, Age, map = "1, abc, x y = 9; else=copy")))
.ps <- Filter(function(s) grepl("[A-Za-z]\\((s|es|ies)\\)", s$text), .seen)
check(paste0("P03 no message hedges a count with (s) or (ies), the map parser's among them (",
             length(.seen), " conditions)"),
      length(.seen) >= 300L && length(.ps) == 0L &&
        all(grepl("Invalid old value", .g_p03, fixed = TRUE)))
if (length(.ps) > 0L) for (s in .ps) cat("        hedged: ", s$text, "\n")

# --- Verdict -----------------------------------------------------------------

reset()
options(.jst_options_message_width = .entry_message_width)
options(.jst_default_data = .entry_default_data)
options(.jst_output_level = .entry_output_level)
options(.jst_output_toggles = .entry_output_toggles)

.n_ok <- sum(vapply(.results, `[[`, logical(1), "ok"))
.n    <- length(.results)
if (.n_ok == .n) {
  cat("\nRESULT: PASS (", .n_ok, "/", .n, ")\n", sep = "")
  # Fixture cleanup (S337, the S249 item): a green run leaves nothing behind
  # but .results, which run_all.R reads. A red run keeps its fixtures, for
  # a look at what failed.
  .ws_restore()   # guard 5, ahead of guard 2's cleanup
  rm(list = setdiff(ls(globalenv(), all.names = TRUE),
                    c(.entry_names, ".results")), envir = globalenv())
} else {
  cat("\nRESULT: FAIL (", .n_ok, "/", .n, " passed)\n", sep = "")
  for (r in .results) if (!r$ok) cat("  failed: ", r$desc, "\n", sep = "")
  .ws_restore()   # guard 5: the user's objects back, a red run's fixtures kept
  stop("assertion battery failed", call. = FALSE)
}
