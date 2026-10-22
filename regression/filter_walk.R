# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# filter_walk.R -- walkthrough of the filter-validation surface (S289, S290,
#                  S330, S331, S338)
# TYPE:     visual walkthrough (Expected comments; written for Jeff's checking)
# PENDING:  none
# LOCKS:    what each guided filter error LOOKS like, rendered once apiece:
#           the set-time syntax errors (single =; NOT(...) in the Rule AD
#           shape), the set-time dry-run refusals (single value, numeric,
#           text, wrong count, the unchanged-filter line -- all with the
#           S290 plain-verb leads "is a single value" / "is numeric" / "is
#           text" / "has 3 values for 12 rows" -- and the bare numeric
#           name with its own three-line message), the per-call subset =
#           errors (shape, and
#           since S290 the same two syntax errors in the subset = form), a
#           bare TRUE/FALSE column accepted on both routes, the real xor()
#           accepted, the stored filter that went stale (both exits), the
#           per-frame grammar (jsubset(d, off / on / NULL), leading-comma
#           forms, clear.all), since S330 a filter that cannot be applied
#           STOPPING when set (B8-B10) and when used (D5, D9, D11), a stored
#           jcomplete() whose variable has left the frame stopping too
#           (D10), and a condition naming the frame with no default (C4);
#           since S331 a stale setting that on refuses to turn back on (C5,
#           C7), the status displays and the overview saying a setting
#           cannot be applied (C5-C8), the preview of a stale jcomplete()
#           stopping (C7), and a vector holding one value per case behind
#           jcomplete() or a stored filter, with the line that adds it to
#           the frame (D12-D14); since S338 a fix line that keeps the
#           data frame the call named (A2, A5), off, on or NULL typed with
#           a condition refused with both calls (C9), jfreq()'s title above
#           a subset = stop (D2), and "unused input" in number (E3);
#           since S348 the default frame's variable (F1); since S349 a
#           filter on a one-row frame, an input jsubset() does not have,
#           and a setting made on an expression (G1-G3); since S352
#           quiet = TRUE with no data frame in hand (G4); since S355 a
#           condition, and a bare name, with no data frame in hand (G5);
#           since S368 a call with no data frame and no default, given both
#           routes (G6);
#           since S370 the recode family, jconvert(), the registration
#           verbs and jsubset() given no variable or no condition (G8);
#           since S371 a line that would stop again replaced by ruling
#           R22's stop (ruling R23), the default's route naming its
#           arguments, the lines when what is given as the data is no data
#           frame, and the recode family's map and labels stops (G9);
#           since S391 a data frame's name typed wrong, offered as the one
#           data frame holding the variables typed after it (G10);
#           since S392 an expression given as the data that cannot be
#           evaluated, said in the house voice, its data frame offered
#           where ruling R36's conditions hold (G11);
#           since S359 the shape check counting cases and naming the
#           workspace object a wrong count came from (I1), and the vector
#           path's refusal of a condition on another variable (I2);
#           and Part E, the named-item detector: a
#           top-level single = in jsubset() and in a variable list, the
#           misspelled-input case it is told apart from, and the no-subset
#           form. filter_check.R asserts the same surface; this file shows it.
# ORIGIN:   S289 (design S284 / S288; code S289 v0.9.163); Sections A4-A6,
#           D6-D8 and Part E (E1-E4), the A1 rewrite and the Under40 fixture
#           column S290 (v0.9.164); B8 and D5 flipped, B9, B10, C4 and
#           D9-D11 added S330 (v0.9.206); C5-C8 and D12-D14 added S331
#           (v0.9.207); C9 added, A2 A5 D2 E3 re-pinned S338 (v0.9.212)
# S392 EDIT (v0.9.265; the (S391) expression-typo item and the (S282)
#           item, Jeff's okay of the leans: "Okay for all defaults."): NEW
#           SECTION G11 -- 61 sections -> 62 -- and SECTION G9 RE-PINNED.
#           G11, four renders, each in a stand-in workspace holding one data
#           frame, g11: an expression where the data frame goes with that
#           frame's name typed wrong inside it is "not found", with ruling
#           R36's offer -- the expression with g11 in its place, every other
#           input kept -- in the formula functions, which had given R's own
#           "object 'g1' not found", and in the data-first functions, jsave()
#           and jcopy(); jsubset() and a registration verb, which take no
#           expression as their data, and two names found nowhere, "not
#           found" alone; a column g11 lacks, after $ (where the expression
#           gives no rows rather than stopping) and in subset(), the
#           not-found sentence; any other failure R's own words under "R
#           reported:". G9's Render 3: the named-arguments stop in Rule B's
#           form, "when the data frame is omitted, every input after the
#           variable must be named." G11 and G9's two blocks FILLED BY
#           RUNNING the file (fill.R). Both on the PENDING line: the wording
#           and the riders are Claude's. A capture of every section of every
#           walk on 0.9.264 and on the build (the temporary paths aside):
#           here only G9 moved. Sandbox: 98 of 98 Expected blocks found in a
#           straight run; harness.R derive gives G11 no NEEDS; verify: 62 of
#           62 sections in three orders and by prepare = TRUE. The human
#           half of filter_check.R sections AN and P04.
# LAST VERIFIED: v0.9.265, 2026-10-23 (S392) -- G9 and G11 WALKED on the
#           WORKSTATION by Jeff through receive_all() ("walked, all okay");
#           PENDING back to none; R CMD check 0 errors, 0 warnings, 0 notes;
#           ALL BATTERIES GREEN (11 run, 3316 checks); GitHub 319d995
#           (package).
# S391 EDIT (v0.9.264; ruling R36): NEW SECTION G10 -- 60 sections -> 61.
#           Four renders: a first name that is no object and no variable,
#           when one data frame holds every variable typed after it and its
#           name is within two letters (not every letter changed), is
#           offered as that data frame -- "If you meant the data frame g10:"
#           and the call as typed with it -- in the data-first functions and
#           in the five formula functions, which had given R's own "object
#           'g1' not found"; a line that would stop again for want of its
#           map gets ruling R23's stop; a name three letters off, a variable
#           no data frame holds and a name with no letter of the frame's keep
#           R23's two routes, the formula functions stopping in the house
#           voice. Filled by running the file. A capture of every section of
#           every walk on 0.9.263 and on the new build: no section of this
#           walk moved. Sandbox: 94 of 94 Expected blocks found in a straight
#           run; harness.R derive gives G10 no NEEDS. The human half of
#           filter_check.R section AM.
# LAST VERIFIED: v0.9.264, 2026-10-22 (S391) -- G10 WALKED on the
#           WORKSTATION by Jeff through receive_all() ("walked, all okay");
#           PENDING back to none; R CMD check 0 errors, 0 warnings, 0 notes;
#           ALL BATTERIES GREEN (11 run, 3299 checks); GitHub 78709ca
#           (package).
# S379 EDIT (v0.9.253; Scripts Slate D, the (S378) item): E1 AND G4 GAIN
#           "# NEEDS: C2". Each offers jsubset(MyData, Gender == 1), and
#           since S371 (ruling R23) that line names MyData only because two
#           data frames hold Gender -- d, and e, which C2 makes (e <- d);
#           with d alone it names d. Run one section at a time through
#           rewalk(), neither had e. Derived by running (harness.R derive:
#           E1 and G4 each need C2 and nothing else); harness.R verify
#           then matched all 60 sections in file order, reversed, shuffled
#           and after prepare = TRUE. No Expected moved; not on the
#           PENDING line.
# LAST VERIFIED: v0.9.253, 2026-10-20 (S379) -- E1 and G4 gained "# NEEDS:
#           C2", derived by running; no section walked or re-pinned (not on
#           the PENDING line); ALL BATTERIES GREEN (10 run, 3102 checks); R
#           CMD check 0 errors, 0 warnings, 0 notes.
# S378 EDIT (v0.9.252; Capability Slate C3): SECTION G7 RE-PINNED, by
#           running (fill.R), mechanically: jplot()'s stop for three
#           variables reads "To show a variable by the groups of another,
#           add by = to the call, for example:", Jeff's wording (S378; the
#           old "use by =, for example" read as a typo). Not on the PENDING
#           line. A capture of every section of every walk on 0.9.251 and
#           0.9.252: here only G7 moved.
# LAST VERIFIED: v0.9.252, 2026-10-20 (S378) -- G7 re-pinned by running to
#           Jeff's wording, not walked (not on the PENDING line); ALL
#           BATTERIES GREEN (10 run, 3090 checks); R CMD check 0 errors, 0
#           warnings, 0 notes.
# S371 EDIT (v0.9.244; Fix Slate 19): NEW SECTION G9 -- 59 sections -> 60.
#           Seven renders: ruling R23 (Jeff, S371) -- a call naming a
#           variable and no data frame that also lacks an input it needs
#           gets ruling R22's one stop, saying what is missing (a map,
#           labels, codes, a convention, a second variable); the two routes
#           kept where only the data frame is missing, the default's route
#           naming the arguments after the variable; the named-arguments
#           stop under a default; a quoted name, a value, a single value and
#           an expression given as the data; a condition typed with one =
#           and no data frame or default naming one; the generic examples
#           and the status notes' lines set on community; the recode
#           family's map and labels stops. Filled by running the file.
#           RE-PINNED by running, the moved lines found by capturing every
#           walk whole on 0.9.243 and on 0.9.244 and comparing (36 lines,
#           all in this walk): B1-B4, B6, B7 and I1 (the generic example
#           set on community), E1 and G4 (the single-= line naming the data
#           frame, ruling R23), G5, G6 and H4 (the variable-name question on
#           a line of its own); I1's and G4's notes amended. All on the
#           PENDING line: the community example and the question's line are
#           layouts Claude chose. Sandbox: 90 of 90 Expected blocks found in
#           a straight run (70 of 90 on 0.9.243 -- the 13 re-pinned blocks
#           and G9's 7 -- so the check discriminates); G9 run with the Setup
#           alone, 7 of 7, so it NEEDS none. The human half of
#           filter_check.R section AG.
# LAST VERIFIED: v0.9.244, 2026-10-18 (S371) -- B1-B4, B6, B7, E1, G4-G6,
#           G9, H4 and I1 WALKED on the WORKSTATION by Jeff through
#           receive_all() ("walked, all okay"); PENDING back to none; R CMD
#           check 0 errors, 0 warnings, 0 notes; ALL BATTERIES GREEN (10
#           run, 2927 checks); GitHub 1a533d8 (package).
# S370 EDIT (v0.9.243; Fix Slate 18): NEW SECTION G8 -- 58 sections -> 59.
#           Five renders: ruling R22's one stop in jrecode(), jencode(),
#           jrelabel(), jdeclare_missing() and jconvert() given nothing
#           (jconvert()'s naming the target format); jconvert(to = "stata")
#           and jconvert() under a session convention keeping G6's two
#           routes; the four given a data frame alone, "no variable
#           specified." with the same example (it said "Variable names
#           cannot be blank."); the registration verbs' stops, the example
#           on a line of its own; jsubset() given no condition, and the
#           riders, jsubset() and jnumeric() given an expression and nothing
#           else. Filled by running the file (fill.R). No other section of
#           this walk moved (harness.R dump of every section of every walk
#           on 0.9.242 and 0.9.243: only modify_form_walk.R Section 12, the
#           old jdeclare_missing() stop, re-pinned there). On the PENDING
#           line: wording Claude drafted to the two leans okayed at S369
#           ("ok on all recommendations"). harness.R derive: the six NEEDS
#           lines as they were, G8 needing none; verify: 83 of 83 Expected
#           blocks found, 59 of 59 sections in three orders and by prepare =
#           TRUE. The human half of filter_check.R section AF.
# LAST VERIFIED: v0.9.243, 2026-10-18 (S370) -- G8 WALKED on the
#           WORKSTATION by Jeff through receive_all() ("walked, all okay");
#           PENDING back to none; R CMD check 0 errors, 0 warnings, 0 notes;
#           ALL BATTERIES GREEN (10 run, 2910 checks); GitHub 127e63b (package).
#           Sandbox: harness.R verify, 59 of 59 sections in three orders and
#           by prepare = TRUE.
# S369 EDIT 2 (v0.9.242; Fix Slate 17): SECTION G6 EXTENDED AGAIN, Render 3
#           RE-PINNED and Renders 3b and 3c NEW -- ruling R22's one stop
#           when neither a data frame nor variables are named, in the seven
#           functions that need variables, and both routes keeping the whole
#           call when the variables are named; NEW SECTION G7 -- 57 sections
#           -> 58 -- the six riders laid out one sentence a line. Filled by
#           running the file (fill.R, "#@SKIP" ahead of Render 3). No other
#           section moved (harness.R dump of every section of every walk on
#           0.9.241 and 0.9.242: only G6 and G7 here, and the date in
#           modify_form_walk.R Section 10's jai() line). On the PENDING
#           line: R22's wording as Jeff okayed it, the riders Claude's.
#           harness.R derive: the six NEEDS lines as they were, G7 needing
#           none; verify: 78 of 78 Expected blocks found, 58 of 58 sections
#           in three orders and by prepare = TRUE. The human half of
#           filter_check.R section AE.
# LAST VERIFIED: v0.9.242, 2026-10-18 (S369) -- G6 and G7 WALKED on the
#           WORKSTATION by Jeff through receive_all() ("walked, all okay");
#           PENDING back to none; R CMD check 0 errors, 0 warnings, 0 notes;
#           ALL BATTERIES GREEN (10 run, 2898 checks); GitHub fbeb84d
#           (package). Sandbox: harness.R verify, 58 of 58 sections in three
#           orders and by prepare = TRUE.
# LAST VERIFIED: v0.9.241, 2026-10-18 (S369) -- G6 WALKED on the
#           WORKSTATION by Jeff through receive_all() ("walked, all okay");
#           R CMD check 0 errors, 0 warnings, 0 notes; ALL BATTERIES GREEN
#           (10 run, 2887 checks).
# S369 EDIT (v0.9.241; Fix Slate 16): SECTION G6 EXTENDED, three renders
#           (4-6): the no-variables stops of jcorr(), jalpha(), jsum() and
#           javg() give a line to run on community's own columns; jcopy()
#           with no default gives the two routes, its one name the
#           destination; a default whose data frame has gone gives the
#           resolver's stop one sentence a line, in jcopy() as in jdesc().
#           Filled by running the file (fill.R, "#@SKIP" ahead of Render 4).
#           On the PENDING line: wording Claude drafted (Fix Slate 16's
#           items 3 and 4). No existing Expected moved (harness.R dump of
#           every section of every walk on 0.9.240 and 0.9.241: none
#           differed). harness.R derive: the six NEEDS lines as they were,
#           G6 needing none; verify: 73 of 73 Expected blocks found, 57 of
#           57 sections in three orders and by prepare = TRUE. The human
#           half of filter_check.R section AD.
# S368 EDIT (v0.9.240; Fix Slate 15): SECTION G6 ADDED -- 56 sections -> 57.
#           A call that names no data frame, with no juse() default, gets
#           both routes, as G5's stops do (the lean okayed at S367), where
#           it had "No data frame specified and no default set. Use juse()
#           to set a default.": the data frame named after the formula in a
#           formula call, first in any other -- the one holding the
#           formula's variables, or the one data frame in the workspace for
#           a call with no variable to match, else MyData. Three renders: a
#           formula only g6 holds; jscreen() in the walk's workspace
#           (MyData); jcorr(method = "spearman") in .ws_g6, a stand-in
#           workspace holding one data frame. Filled by running the file
#           (fill.R). No existing Expected moved (harness.R dump of every
#           section of every walk on 0.9.239 and 0.9.240: no section of this
#           walk differed). On the PENDING line: wording Claude drafted to
#           the lean. harness.R derive: the six NEEDS lines as they were, G6
#           needing none; verify: 70 of 70 Expected blocks found, 57 of 57
#           sections in three orders and by prepare = TRUE. The human half
#           of filter_check.R section AB.
# LAST VERIFIED: v0.9.240, 2026-10-17 (S368) -- G6 WALKED on the
#           WORKSTATION by Jeff through receive_all() ("walked, all okay");
#           PENDING back to none; GitHub d62f372 (package). Sandbox: every
#           section through rewalk() as in a straight run, in three orders
#           and by prepare = TRUE (harness.R verify).
# S359 EDIT (v0.9.232; Fix Slate 10 and Scripts Slate B): PART I ADDED,
#           SECTIONS I1-I2 -- 54 sections -> 56; B1-B7, D3, D4 and G1
#           RE-PINNED. The filter shape check counts CASES where it counted
#           rows ("not one TRUE or FALSE for every case"), and a result of
#           the wrong length that came from a workspace object names the
#           object as ruling R19's stop does, keeping its own fix line (the
#           S357 item; Jeff, S358: "okay on your default"): I1 per call,
#           bare, after jcomplete() and a literal with no object to name.
#           I2: the vector path's refusal of a condition naming another
#           variable of the column's frame no longer hangs on a workspace
#           object of that name (found by the S342 dirty entry, Scripts
#           Slate B). I1 and I2 filled by running (fill.R); B1-B7, D3, D4
#           and G1 refilled the same way after a capture of every section
#           on 0.9.231 and 0.9.232 -- B1-B5, B7, D3 and G1 change one word,
#           "row" to "case"; B6 and D4 name the object. All eleven on the
#           PENDING line: wording Claude drafted to the lean. harness.R
#           derive: I1 and I2 need no other section; verify: 67 of 67
#           Expected blocks found, 56 of 56 sections in three orders and by
#           prepare = TRUE. The assertion side is filter_check.R section AA.
# LAST VERIFIED: v0.9.232, 2026-10-16 (S359) -- B1-B7, D3, D4, G1, I1 and I2
#           WALKED on the WORKSTATION by Jeff through receive_all(), under
#           the tool's default walk line ("walked, all okay"); PENDING back
#           to none; GitHub 6cf15d7 (package).
# S357 EDIT (v0.9.231; the FRAMES slate, ruling R19): NINE SECTIONS RE-PINNED
#           OR RE-BUILT, no section added (models_walk.R Section 24 shows
#           R19's shapes). C5, C6, D4, D5 and D12 set their stored filter
#           on a workspace vector of one value per case, which R19 now
#           refuses when it is set: each now sets it on a workspace VALUE
#           (keepc <- 35, keep12 <- TRUE, keepv <- TRUE), and D4 and D12
#           turn the value into a vector after it is set, so the stale and
#           the R19 stored forms are still reached; the Expected blocks
#           refilled by running (fill.R). B10 and D11 (the recycling stop,
#           opening as R19's message does, "add the values to the data
#           frame as a variable"), D13 (set behind jcomplete(): R19's
#           set-time form) and D14 (per call behind a stored filter: R19's
#           form with the call) re-pinned from captures of every section on
#           0.9.230 and 0.9.231 (repin.py). All nine on the PENDING line:
#           wording and fixtures Claude chose.
# S356 EDIT (v0.9.229): PART H ADDED, SECTIONS H1-H5 -- 49 sections -> 54;
#           F1 RE-PINNED. The NAMES slate (ruling R18's four remaining
#           items and riders A and B) on the data-first functions: H1 a
#           c() of names, bare or quoted, in a variable list, a range
#           still not found, a c() of several at jrecode()'s single slot;
#           H2 a data frame's name in quotes at jdesc(), juse() and the
#           formula front door, each call given without them; H3 the
#           vector path's two lines under the title when a data frame in
#           the workspace holds a variable of the name read, and no line
#           when none does; H4 the not-a-data-frame stops naming the one
#           frame that has the variable; H5 a bare word where a quoted
#           value goes at jdesc(), joutput(), joptions() and jload(name =).
#           F1's third render reads Tenure, a name only f1 holds (the new
#           line names every frame holding the variable, and Age sat in
#           six of the walk's), the fixture gaining a Tenure column and
#           vector. Every Expected FILLED BY RUNNING the file (fill.R).
#           harness.R derive: H4 needs H3 (the fixture frame); verify: 61
#           of 61 Expected blocks found, 54 of 54 sections in three orders
#           and by prepare = TRUE. The human half of filter_check.R
#           section Y.
# LAST VERIFIED: v0.9.231, 2026-10-16 (S357) -- B10, C5, C6, D4, D5, D11,
#           D12, D13 and D14 WALKED on the WORKSTATION by Jeff through
#           receive_all(), under the tool's default walk line; his two
#           questions on D13 (a vector of another length; a single value)
#           answered, an item logged for Fix Slate 10 (the shape check's
#           "rows"); PENDING back to none; GitHub 2a4fcc3 (package).
#           Sandbox: harness.R verify, 54 of 54 sections in three orders
#           and by prepare = TRUE, 61 of 61 Expected blocks under
#           rewalk().
# LAST VERIFIED: v0.9.229, 2026-10-15 (S356) -- F1 and H1-H5 WALKED on the
#           WORKSTATION by Jeff through receive_all() ("I've walked all
#           sections"; "most good", the one question raised in
#           models_walk.R Section 23); PENDING back to none; GitHub fea0b51
#           (package). Sandbox: every section through rewalk() as in a
#           straight run, in three orders and by prepare = TRUE (harness.R
#           verify).
# S355 EDIT (v0.9.228): SECTION G5 ADDED -- 48 sections -> 49. Fix Slate
#           W1 (the S352 item, met writing G4's notes): with no frame named
#           and no juse() default, the resolver called a condition a name
#           "not found" and asked whether it was a variable name, both fixes
#           inline after colons. A condition is now said to need a data
#           frame; a bare name keeps its question; each call is on a line
#           of its own, the default's two lines in the order they run.
#           Filled by running the file (fill.R). No existing Expected
#           moved. harness.R verify: 56 of 56 Expected blocks found, 49 of
#           49 sections in three orders and by prepare = TRUE; G5 needs no
#           other section. The human half of filter_check.R section X.
# LAST VERIFIED: v0.9.228, 2026-10-15 (S355) -- G5 WALKED on the
#           WORKSTATION by Jeff through receive_all() ("walked, all okay");
#           PENDING back to none; GitHub f89e83f (package). Sandbox: every
#           section through rewalk() as in a straight run, in three orders
#           and by prepare = TRUE (harness.R verify).
# S352 EDIT (v0.9.225): SECTION G4 ADDED -- 47 sections -> 48. Fix Slate 9,
#           the first half (the S349 item): with no data frame named and no
#           juse() default, quiet = TRUE beside a condition was still read
#           as a condition typed with one =; it is now an unused input, as
#           in G2. Filled by running the file (fill.R). No existing
#           Expected moved. harness.R derive: 55 of 55 Expected blocks
#           found; G4 needs no other section. The human half of
#           filter_check.R section W.
# LAST VERIFIED: v0.9.225, 2026-10-12 (S352) -- G4 WALKED on the
#           WORKSTATION by Jeff through receive_all() ("walked, all okay");
#           PENDING back to none; GitHub 5c5304e. Sandbox: every section
#           through rewalk() as in a straight run, in three orders and by
#           prepare = TRUE (harness.R verify).
# S349 EDIT (v0.9.222): PART G ADDED, three sections -- 44 sections -> 47.
#           Fix Slate 7, second half: G1 a filter on a one-row frame runs
#           (it was refused as "a single value"), and a condition that
#           names no variable is still refused there; G2 quiet = TRUE beside
#           a condition is an unused input (it was read as a condition typed
#           with one =, and offered jsubset(d, quiet == TRUE)), while a
#           variable typed with one = keeps the single-= stop; G3 jsubset()
#           and jcomplete() given an expression as the data refuse it, with
#           two lines that run, and their off form gives the status call.
#           Each Expected FILLED BY RUNNING the file (fill.R). No existing
#           Expected moved (a capture of every section of every walk on
#           0.9.221 and 0.9.222). The human half of filter_check.R section V.
# LAST VERIFIED: v0.9.222, 2026-10-11 (S349) -- G1-G3 WALKED on the
#           WORKSTATION by Jeff through receive_all() ("walked, all okay");
#           PENDING back to none; GitHub 4243886. Sandbox: every section
#           through rewalk() as in a straight run, in three orders and by
#           prepare = TRUE (harness.R verify).
# S348 EDIT (v0.9.221): PART F ADDED, one section -- 43 sections -> 44.
#           Ruling R12 (Jeff, S345): under a juse() default, a name the
#           default frame has is the frame's variable in jdesc(), jfreq()
#           and jscreen(), and a second line under "Using default data
#           frame" says so when a separate vector of that name exists. F1's
#           three Expected blocks FILLED BY RUNNING the file (fill.R), with
#           #@SKIP after the two juse() calls. No existing Expected moved (a
#           capture of every section on 0.9.220 and 0.9.221). The human
#           half of filter_check.R section U.
# LAST VERIFIED: v0.9.221, 2026-10-10 (S348) -- F1 WALKED on the WORKSTATION
#           by Jeff through receive_all(), its closing block's walk line as
#           the tool's default leaves it; PENDING back to none; GitHub
#           2a49208. Sandbox: every Expected block under rewalk() as in a
#           straight run (harness.R verify).
# S338 EDIT (v0.9.212): C9 ADDED; A2, A5, D2 AND E3 RE-PINNED -- 42 sections
#           -> 43. Fix Slate 1. A2 and A5: the corrected call keeps the data
#           frame the call named (one line each). C9, new: off, on or NULL
#           typed with a condition -- three calls, each refused with the call
#           that sets the filter and the call that acts on the stored one. D2:
#           "Frequencies" above the stop (one line added). E3: "unused input"
#           (one word). C9's Expected block was filled from the harness's
#           capture of the section, which halts on an uncaught error; the 42
#           others were found in the same run. C9 needs no earlier section
#           (derived by running; the five NEEDS lines are unchanged).
# S346 EDIT (no package change): the header's note that the console drops
#           the message stream's blank lines removed, found false at S345
#           (format_walk.R's the same, at S346). No section changed.
# LAST VERIFIED: v0.9.212, 2026-10-05 (S338) -- A2, A5, C9, D2 and E3 WALKED
#           on the WORKSTATION through rewalk("filter") (Jeff: "both walks are
#           clean"), GitHub e22427a, after the SANDBOX run (R 4.3.3, UTF-8
#           locale): 43 of 43 Expected blocks found in the capture, and every
#           section through rewalk() in file order, reverse order and
#           shuffled, and by prepare = TRUE, plain and under the
#           RStudio-handler stand-in.
# S331 EDIT (v0.9.207): C5, C6, C7, C8, D12, D13 AND D14 ADDED -- 35
#           sections -> 42. The two S330 reactivation items and Jeff's two
#           S331 riders. C5: jsubset(d, on) refused for a filter whose
#           object is gone -- "The filter stays off." and the delete exit
#           alone -- and the status display's second line. C6: the status
#           display for a filter that is ON (the third line: analyses will
#           stop), and on typed for it (both exits). C7: jcomplete(kc, on)
#           refused, the status line naming the variable, the preview
#           stopping. C8: the same setting while it is on, and the
#           overview's tag. D12: a stored filter on a one-value-per-case
#           vector behind an active jcomplete() -- the cause, the line that
#           adds the vector to the frame, and the analysis after it. D13:
#           the same filter refused when set. D14: subset = with such a
#           vector behind a stored filter. The seven Expected blocks were
#           filled by a builder that runs the code above each block and
#           HALTS on an uncaught error; the 35 others were found unchanged
#           in the same run. No existing section moves.
# LAST VERIFIED: v0.9.207 PENDING, 2026-10-03 (S331) -- sourced end to end
#           in the SANDBOX (R 4.3.3, UTF-8 locale; end marker reached), 42
#           of 42 Expected blocks found in the capture; against the
#           0.9.206 build the same file finds 35. WORKSTATION walk of C5,
#           C6, C7, C8, D12, D13 and D14 PENDING.
# S330 EDIT (v0.9.206): B8 AND D5 FLIPPED; B9, B10, C4, D9, D10 AND D11
#           ADDED -- 29 sections -> 35. Jeff's S329 rulings, made walking
#           D5, and the two S324 partners. B8 showed an evaluation failure
#           stored in silence; it shows the set-time refusal for a name
#           that is not found. D5 showed the warning and an analysis of
#           every row; it shows the stop, in D4's form. New: B9 (any other
#           error when set: "R reported:"), B10 (a workspace vector that
#           would be recycled), C4 (a condition naming the frame, with no
#           default), D9 (a stored filter that stops for another reason),
#           D10 (a stored jcomplete() whose variable has left the frame),
#           D11 (B10's message in the subset = form). The eight Expected
#           blocks were filled by a builder that runs the code above each
#           block and HALTS on an uncaught error; the 27 others were
#           found unchanged in the same run.
# LAST VERIFIED: v0.9.206, 2026-10-03 (S330) -- B8, B9, B10, C4, D5, D9,
#           D10 and D11 WALKED on the WORKSTATION (Jeff: "walk is done, no
#           problems"), after the SANDBOX run (R 4.3.3, UTF-8 locale; 35
#           of 35 Expected blocks found; 26 against the 0.9.205 build).
#           Restamped from PENDING at S331.
# S328 EDIT (v0.9.204): THE LEAN. The jdesc tables in D4 (both tables), D5
#           and D8 re-pinned (three Expected blocks, six lines): where a
#           value or a header cannot be centered exactly the odd space
#           goes on the LEFT now, in every table (Jeff, S328), so the
#           two-digit Min and Max, the two-digit counts under Total and
#           Non_missing and the "SD" header sit one place right of where
#           they did. Nothing this file is about changed. Taken from an
#           ordered diff of this file's own output on the 0.9.203 and
#           0.9.204 builds; every Expected then found as a contiguous run
#           in the new capture (29 of 29; the S326 file 26).
# LAST VERIFIED: v0.9.204 PENDING, 2026-10-02 (S328) -- sourced end to end
#           in the SANDBOX (R 4.3.3, UTF-8 locale; end marker reached);
#           WORKSTATION walk of D4, D5 and D8 PENDING (they were pending
#           from S326 as well: one walk now covers both edits).
# S326 EDIT (v0.9.202): the jdesc tables in D4 (the second block), D5 and
#           D8 re-pinned for the number-format rule: Mean and SD print to
#           the digits setting with trailing zeros kept (42.8 -> 42.800,
#           31.4 -> 31.400), so the Mean column widens and both headers
#           re-center; Min and Max are unchanged. Taken from an ordered diff
#           of this file's own output on the 0.9.201 and 0.9.202 masters
#           (three changed blocks, every one a jdesc table) applied wherever
#           pinned, nine lines in all. Every Expected block then found in
#           the new output (29 of 29); the S316 file against the same output
#           finds 26 -- the checker discriminates. Nothing else moves.
# LAST VERIFIED: v0.9.202 PENDING, 2026-10-01 (S326) -- sourced end to end
#           in the SANDBOX (end marker reached), every Expected block found
#           in a sink() capture; WORKSTATION walk PENDING. Prior:
# S316 EDIT (v0.9.192): the jdesc descriptive tables in D4 (both blocks),
#           D5 and D8 re-pinned for the form jdesc's tables take at
#           v0.9.192 -- headers centered over their columns, counts
#           block-centered under Total and Non_missing, no line ending in
#           padding. Taken from an ordered diff of this file's own output on
#           the 0.9.191 and 0.9.192 masters (six distinct changed lines,
#           every one a jdesc table line) applied wherever pinned, eight
#           pinned lines in all. Every Expected block then found in the new
#           output (29 of 29); the S312 file against the same output finds
#           26 -- the checker discriminates. Nothing else in the file moves.
# LAST VERIFIED: v0.9.192 PENDING, 2026-09-27 (S316) -- sourced end to end
#           in the SANDBOX (end marker reached); WORKSTATION walk PENDING.
#           Prior:
# S312 EDIT (v0.9.184): two Expecteds re-pinned (the keep12 == TRUE
#           jsubset() block and the Under40 subset = block). Each fixture
#           condition is NA for one case, and a jsubset() / subset = row now
#           carries "(k missing)" after its expression when the condition
#           evaluated to NA for k cases (the CPS filter accounting;
#           cps_walk.R Part I shows it). The row and the rule beneath it
#           change; nothing else in the file does (the S294 file rendered
#           on the new master differs on exactly those four lines).
# LAST VERIFIED: v0.9.184, 2026-09-24 (S312) -- the two re-pinned blocks
#           byte-compared against a sink() capture in the SANDBOX;
#           WORKSTATION walk PENDING. Prior:
# LAST VERIFIED: v0.9.167, 2026-09-14 (S294) -- WALKED on the WORKSTATION,
#           all 29 sections matching, end marker reached. Two edits this
#           session: the D4 and D5 CPS rows re-pinned to the S293 row label
#           ("jsubset()" -- stale since S293, when the re-pin was deferred
#           to ride with S289 stage 2), both confirmed live in this walk;
#           and the Setup reset line moved to the clear.all = TRUE forms
#           (S294: a bare jsubset(NULL) / jcomplete(NULL) now clears only
#           the default frame).
#           Prior: v0.9.164, 2026-09-13 (S290) -- WALKED on the WORKSTATION
#           (source(echo = TRUE) on the received final S290 master), all
#           29 sections matching, end marker reached; reviewed against the
#           Expecteds by Claude section by section. Built in the SANDBOX
#           (R 4.3.3, source()'d, ::: shimmed): all 29 sections re-run
#           against their own Expected; 6 of the 18 S289 Expecteds
#           unchanged on the S290 master (A1 B1-B7 D1-D4 recaptured after
#           the shape check's messages were redrafted on Jeff's review:
#           the bare-name case given its own message, the "gives <what>"
#           leads replaced by plain verbs) and the 11 new ones captured
#           mechanically (the builder halts on any error a section lets
#           escape, per the S289 D5 lesson). Expecteds are sink() captures
#           at 76.
# RUN:      line-by-line first (read each block of output before moving on).
#           Also source()-safe: every deliberate error is wrapped in
#           caught(), which prints the message after "Caught: ". Under
#           source(), run WITH echo = TRUE, per the conventions file.
#           An UNwrapped error under a plain try() prints "Error : " with a
#           space -- that spacing is the wrapper, not a message defect.
#           By section: source walk_tools.R, then rewalk("filter") shows the
#           sections the PENDING line names and rewalk("filter", "A1") shows
#           one, each from a fresh Setup and its NEEDS. Add prepare = TRUE to
#           run only what the section needs and step through it by hand.
# SECTIONS: NOT independent within a Part -- Parts B, C and D set state and
#           clear it a section or two later; run a Part whole.
# FIXTURE:  built INLINE (twelve rows, one NA, one haven-labelled column);
#           no dataset is loaded, so the file runs identically anywhere.
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

# warn = 1 (conventions file, rule 4, S248): a source() run would otherwise
# defer a warning to the foot of the file, hundreds of lines from the output
# it belongs to. No section warns by design since S330 (D5's warning became
# a stop); kept so that an unexpected one shows where it is raised. Changes
# nothing for a line-by-line run.
options(warn = 1)

# Neutral pipeline state (never assume the prior state is clean).
jsubset(clear.all = TRUE); jcomplete(clear.all = TRUE); joutput(NULL)
jdummy(clear.all = TRUE)
juse(NULL)

# The fixture. Age has one NA (row 8); Keep01 is a 0/1 indicator with six 1s;
# Condition is haven-labelled; Under40 is logical (five TRUE, six FALSE, one NA).
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
d$Under40 <- d$Age < 40                  # a genuine TRUE/FALSE column (S290)

# caught(): run a call that is EXPECTED to error and print the message after
# "Caught: ", so source() survives it and the Expected can show the text.
caught <- function(expr) {
  tryCatch(expr, error = function(e) cat("Caught: ", conditionMessage(e),
                                          "\n", sep = ""))
}


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART A -- SET-TIME SYNTAX ERRORS (.jst_check_filter_syntax) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION A1 -- a bare NUMERIC name reaches the dry run (S290) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Before S290 the syntax check refused any lone name as "a variable name, not
# a condition". That branch is gone: the name is judged by what it produces,
# so a numeric column is refused by the dry run -- with a message that, since
# S290, mirrors the single-= error (A2): the mistake, the two equals signs,
# the corrected call, and nothing about what the variable holds. The earlier
# "Gender gives numbers" lead read as a non sequitur to the FILTER BY user it
# is for.

caught(jsubset(d, Gender))

# Expected:
#   Caught: jsubset(): Gender on its own is a variable name, which does not
#   select rows in R.
#   Use == (two equals signs) to compare it to a value:
#     jsubset(d, Gender == 1)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION A2 -- a single = inside parentheses (the form R's parser lets ----
#               through)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The corrected call is built from what was typed: each operator = becomes ==,
# nothing else moves. Without the check this would run as 1 & (Age < 40) and
# silently drop the Gender test.
# S338: the corrected call keeps the data frame the call named. It read
# jsubset((Gender == 1) & (Age < 40)), which with no juse() default is a
# call that cannot run; A1's line already kept the frame.

caught(jsubset(d, (Gender = 1) & (Age < 40)))

# Expected:
#   Caught: jsubset(): (Gender = 1) & (Age < 40) uses a single =, which does not
#   test equality in R.
#   Use == (two equals signs):
#     jsubset(d, (Gender == 1) & (Age < 40))


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION A3 -- the S288 third face: a named argument no longer false-fires ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Before S289 this call errored with the single-= message (reproduced on the
# workstation S289). It is a legitimate filter and now activates.

jsubset(d, grepl("^A", Name, ignore.case = TRUE))
jsubset(d, NULL)

# Expected:
#   jsubset activated for d: grepl("^A", Name, ignore.case = TRUE)
#   jsubset cleared for d (had: grepl("^A", Name, ignore.case = TRUE)).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION A4 -- a bare LOGICAL column is a valid filter and is ACCEPTED ----
#               (S290)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The same call the removed branch used to refuse. Under40 is TRUE/FALSE for
# every row, which is all a filter needs to be.

jsubset(d, Under40)
jsubset(d, NULL)

# Expected:
#   jsubset activated for d: Under40
#   jsubset cleared for d (had: Under40).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION A5 -- NOT(...) written as in SPSS: caught, and rewritten (S290) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The message opens with what was typed (Rule AD; the old "You wrote:" tail
# and the three-line example menu are gone) and the fix is built from it:
# the keyword becomes its R operator and NOT's operand is parenthesized.
# S338: the line keeps the data frame the call named, as in A2.

caught(jsubset(d, NOT(Age < 40)))

# Expected:
#   Caught: jsubset(): NOT(Age < 40) uses NOT, which R does not recognize.
#   Use ! (exclamation mark):
#     jsubset(d, !(Age < 40))


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION A6 -- the real xor() is accepted (S290; it was refused before, ----
#               with a message recommending xor())
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

jsubset(d, xor(Age < 40, Gender == 1))
jsubset(d, NULL)

# Expected:
#   jsubset activated for d: xor(Age < 40, Gender == 1)
#   jsubset cleared for d (had: xor(Age < 40, Gender == 1)).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART B -- THE SET-TIME DRY RUN (jsubset() runs the filter once) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION B1 -- TRUE: a single value cannot select rows ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# No parenthetical when the expression IS the literal.

caught(jsubset(d, TRUE))

# Expected:
#   Caught: jsubset(): TRUE is a single value, not one TRUE or FALSE for
#   every case.
#   Compare a variable to a value, for example:
#     jsubset(community, Age < 40)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION B2 -- T: no longer exempt, and refused as a single value, not as ----
#               a "variable name"
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

caught(jsubset(d, T))

# Expected:
#   Caught: jsubset(): T is a single value (TRUE), not one TRUE or FALSE for
#   every case.
#   Compare a variable to a value, for example:
#     jsubset(community, Age < 40)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION B3 -- an aggregate inside a filter: the computed value is shown ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

caught(jsubset(d, mean(Age, na.rm = TRUE) > 40))

# Expected:
#   Caught: jsubset(): mean(Age, na.rm = TRUE) > 40 is a single value (TRUE),
#   not one TRUE or FALSE for every case.
#   Compare a variable to a value, for example:
#     jsubset(community, Age < 40)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION B4 -- numeric (an arithmetic expression) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

caught(jsubset(d, Keep01 * 1))

# Expected:
#   Caught: jsubset(): Keep01 * 1 is numeric, not one TRUE or FALSE for
#   every case.
#   Compare a variable to a value, for example:
#     jsubset(community, Age < 40)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION B5 -- a reset typed with quotes (the S284 face (a)) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

caught(jsubset(d, "null"))

# Expected:
#   Caught: jsubset(): "null" is text, not one TRUE or FALSE for every case.
#   To clear the filter, use NULL without quotes:
#     jsubset(d, NULL)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION B6 -- the wrong number of values (an outside object of length 3) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

keep3 <- c(TRUE, FALSE, TRUE)
caught(jsubset(d, keep3 == TRUE))

# Expected:
#   Caught: jsubset(): In keep3 == TRUE, keep3 is not in the d data frame; it is
#   a separate object in your workspace.
#   It has 3 values for the 12 cases in the d data frame, not one TRUE or FALSE
#   for every case.
#   Build the filter from the data frame's own columns, for example:
#     jsubset(community, Age < 40)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION B7 -- with an earlier filter in place: refused, and the earlier ----
#               one is reported unchanged
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

jsubset(d, Age < 40)
caught(jsubset(d, TRUE))
jsubset()

# Expected:
#   jsubset activated for d: Age < 40
#   Caught: jsubset(): TRUE is a single value, not one TRUE or FALSE for
#   every case.
#   Compare a variable to a value, for example:
#     jsubset(community, Age < 40)
#   Your earlier filter for the d data frame is unchanged.
#   jsubset active for d: Age < 40


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION B8 -- a filter naming something that is not found is REFUSED when ----
#               set (S330; it was stored, and reported "activated")
# NEEDS: B7
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# A misspelled variable. Until S330 the dry run swallowed the error and the
# filter was stored; every analysis then warned and ran on every row (D5).
# The message names what was typed, the name and the frame; B7's filter is
# still in place, so the unchanged line shows as well.

caught(jsubset(d, Agee > 30))
jsubset(d, NULL)

# Expected:
#   Caught: jsubset(): Agee > 30 names Agee, which was not found in the d
#   data frame.
#   Check the spelling.
#   Your earlier filter for the d data frame is unchanged.
#   jsubset cleared for d (had: Age < 40).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION B9 -- a filter that stops for any other reason is refused too, ----
#               with R's own message (S330)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Nothing is "not found" here, so the message claims nothing of the kind: it
# says the filter cannot be applied and relays what R reported.

lim <- function() stop("the limit file is not loaded")
caught(jsubset(d, Age > lim()))

# Expected:
#   Caught: jsubset(): Age > lim() cannot be applied to the d data frame.
#   R reported:
#     the limit file is not loaded


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION B10 -- a workspace vector that would be recycled is refused ----
#                (S330)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Five values against twelve cases: R would repeat the five (30, 40, 50, 60,
# 70, 30, 40, ...) and compare case by case -- with a warning here, with none
# at all when the row count divides by the length. The wording is the S324
# formula message's.

v5 <- c(30, 40, 50, 60, 70)
caught(jsubset(d, Age > v5))

# Expected:
#   Caught: jsubset(): In Age > v5, v5 is not in the d data frame; it is a
#   separate object in your workspace.
#   It has 5 values for the 12 cases in the d data frame.
#   Use a single value, or add the values to the data frame as a variable.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART C -- THE GRAMMAR ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION C1 -- per-frame off / on / NULL ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

jsubset(d, Age < 40)
jsubset(d, off)
jsubset(d, on)
jsubset(d, NULL)
jsubset(d, NULL)

# Expected:
#   jsubset activated for d: Age < 40
#   jsubset deactivated for d.
#   jsubset reactivated for d: Age < 40
#   jsubset cleared for d (had: Age < 40).
#   No jsubset set for d. Nothing to clear.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION C2 -- two frames: named off leaves the other alone; clear.all ----
#               clears both
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

e <- d
jsubset(d, Age < 40)
jsubset(e, Gender == 1)
jsubset(d, off)
jsubset()
jsubset(clear.all = TRUE)

# Expected:
#   jsubset activated for d: Age < 40
#   jsubset activated for e: Gender == 1
#   jsubset deactivated for d.
#   jsubset settings (2 data frames):
#     - d: Age < 40  [inactive]
#     - e: Gender == 1  [active]
#   jsubset cleared (2 data frames):
#     - d (had: Age < 40)
#     - e (had: Gender == 1)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION C3 -- the leading-comma forms reach the default frame (tolerated, ----
#               not advertised)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

juse(d)
jsubset(Age < 40)
jsubset(, off)
jsubset(, on)
jsubset(, NULL)
juse(NULL)

# Expected:
#   Default data frame set to: d
#   jsubset activated for d: Age < 40
#   jsubset deactivated for d.
#   jsubset reactivated for d: Age < 40
#   jsubset cleared for d (had: Age < 40).
#   Default data frame cleared.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION C4 -- a condition naming the frame, typed where the frame goes, ----
#               with no juse() default (S330)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Before S330: "'d$Age > 40' not found. Did you mean to use it as a variable
# name?", with a suggested call that named the frame twice. With a default
# set, the same input has had the S323 refusal since v0.9.200.

caught(jsubset(d$Age > 40))

# Expected:
#   Caught: jsubset(): d$Age > 40 names the d data frame.
#   Name the data frame first, and the variable on its own:
#     jsubset(d, Age > 40)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION C5 -- on checks the filter before turning it back on (S331; it ----
#               printed "reactivated", and the next analysis stopped)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The object the filter names is removed while the filter is off. The filter
# is off already, so the message says it stays off and gives the delete exit
# alone -- "set it aside" would name the state it is in. The status display
# then says the same thing in a line of its own.

keepc <- 35                  # a value: R19 (S357) refuses a vector of one per case
jsubset(d, Age > keepc)
jsubset(d, off)
rm(keepc)
caught(jsubset(d, on))
jsubset()
jsubset(d, NULL)

# Expected:
#   jsubset activated for d: Age > keepc
#   jsubset deactivated for d.
#   Caught: jsubset(): the jsubset filter for the d data frame, Age > keepc,
#   cannot be applied: keepc no longer exists.
#   The filter stays off.
#   To delete it, run:
#     jsubset(d, NULL)
#   jsubset set but inactive for d: Age > keepc
#   It cannot be applied: keepc no longer exists.
#   jsubset cleared for d (had: Age > keepc).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION C6 -- the status display for a filter that is ON and cannot be ----
#               applied; on typed for it (S331)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The filter was never turned off. It stays active on purpose -- jstats does
# not widen the sample on its own -- so the status display adds what follows:
# analyses of the frame stop. on, typed here, is the analysis-time stop
# exactly, with both exits.

keepc <- 35                  # a value (R19, S357)
jsubset(d, Age > keepc)
rm(keepc)
jsubset()
caught(jsubset(d, on))
jsubset(d, NULL)

# Expected:
#   jsubset activated for d: Age > keepc
#   jsubset active for d: Age > keepc
#   It cannot be applied: keepc no longer exists.
#   Analyses of the d data frame will stop until it is turned off,
#   deleted or fixed.
#   Caught: jsubset(): the jsubset filter for the d data frame, Age > keepc,
#   cannot be applied: keepc no longer exists.
#   To set it aside, run:
#     jsubset(d, off)
#   To delete it, run:
#     jsubset(d, NULL)
#   jsubset cleared for d (had: Age > keepc).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION C7 -- jcomplete(): on, the status line and the preview for a ----
#               setting whose variable has left the frame (S331)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Until S331 on printed "reactivated", the status line counted complete cases
# on the variables that remained, and the preview showed the rows those would
# drop. on is refused and the setting stays off; the status line names the
# variable in place of a count; the preview is the analysis-time stop.

kc <- d
kc$Tmp <- c(NA, 2:12)
jcomplete(kc, Age, Tmp)
jcomplete(kc, off)
kc$Tmp <- NULL
caught(jcomplete(kc, on))
jcomplete()
caught(jcomplete(console = TRUE))
jcomplete(kc, NULL)

# Expected:
#   Listwise Case Filter
#   Variable   N  Missing  % Missing
#   --------  --  -------  ---------
#   Age       12     1        8.3%
#   Tmp       12     1        8.3%
#
#     Complete cases: 10 of 12 (83.3%)
#     Listwise filter activated -- 2 cases will be excluded from
#     subsequent analyses.
#   jcomplete deactivated for kc.
#   Caught: jcomplete(): the jcomplete setting for the kc data frame names Tmp,
#   which the data frame no longer has.
#   The setting stays off.
#   Run jcomplete() again with the current variable names, or clear the setting:
#     jcomplete(kc, NULL)
#   jcomplete set but inactive for kc: Age, Tmp
#   It cannot be applied: the kc data frame no longer has Tmp.
#   Caught: jcomplete(): the jcomplete setting for the kc data frame names Tmp,
#   which the data frame no longer has.
#   Run jcomplete() again with the current variable names, or clear the setting:
#     jcomplete(kc, NULL)
#   jcomplete cleared for kc (had: Age, Tmp).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION C8 -- the same setting while it is ON: the status line, and with ----
#               a second frame the overview's tag (S331)
# NEEDS: C2, C7
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# e is the second frame from C2. Its setting can be applied, so only kc's
# line is tagged.

kc$Tmp <- c(NA, 2:12)
jcomplete(kc, Age, Tmp)
kc$Tmp <- NULL
jcomplete()
jcomplete(e, Age)
jcomplete()
jcomplete(clear.all = TRUE)

# Expected:
#   Listwise Case Filter
#   Variable   N  Missing  % Missing
#   --------  --  -------  ---------
#   Age       12     1        8.3%
#   Tmp       12     1        8.3%
#
#     Complete cases: 10 of 12 (83.3%)
#     Listwise filter activated -- 2 cases will be excluded from
#     subsequent analyses.
#   jcomplete active for kc: Age, Tmp
#   It cannot be applied: the kc data frame no longer has Tmp.
#   Analyses of the kc data frame will stop until it is turned off, cleared or
#   set again.
#   Listwise Case Filter
#   Variable   N  Missing  % Missing
#   --------  --  -------  ---------
#   Age       12     1        8.3%
#
#     Complete cases: 11 of 12 (91.7%)
#     Listwise filter activated -- 1 case will be excluded from
#     subsequent analyses.
#   jcomplete settings (2 data frames):
#     - kc: Age, Tmp  [active, cannot be applied]
#     - e: Age  [active]
#   jcomplete cleared (2 data frames):
#     - kc (had: Age, Tmp)
#     - e (had: Age)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION C9 -- off, on or NULL typed with a condition is refused, with ----
#               both calls (S338)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# off, on and NULL act on the filter a data frame already has, and take no
# condition. Before S338 the third input landed in clear.all: R answered
# "object 'on' not found" for the first call below, and jstats said
# "`clear.all` must be TRUE or FALSE" for the third. What was meant cannot be
# told from the call -- set this filter, or act on the stored one -- so both
# calls are given, the one that sets the filter first. The second call has
# two conditions: they are joined in the line, the | one in parentheses.

caught(jsubset(d, Age < 40, on))
caught(jsubset(d, Age < 30 | Age > 50, Gender == 1, off))
caught(jsubset(d, Age < 40, NULL))

# Expected:
#   Caught: jsubset(): on turns a stored filter back on and takes no condition.
#   Age < 40 was given with it.
#   To set the filter, run:
#     jsubset(d, Age < 40)
#   To turn the stored filter back on, run:
#     jsubset(d, on)
#   Caught: jsubset(): off turns a stored filter off and takes no condition.
#   Age < 30 | Age > 50 and Gender == 1 were given with it.
#   To set the filter, run:
#     jsubset(d, (Age < 30 | Age > 50) & Gender == 1)
#   To turn the stored filter off, run:
#     jsubset(d, off)
#   Caught: jsubset(): NULL deletes a stored filter and takes no condition.
#   Age < 40 was given with it.
#   To set the filter, run:
#     jsubset(d, Age < 40)
#   To delete the stored filter, run:
#     jsubset(d, NULL)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART D -- APPLY TIME ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION D1 -- per-call subset = on a 0/1 column (the SPSS FILTER BY ----
#               habit)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Before S289 this printed a case-processing table that added up (3 kept) over
# statistics for row 1 three times (Min = Max = Mean = 30, SD 0) -- R read the
# 1s as row positions. Reproduced on the workstation S289.
# S290: the same three-line bare-name message as A1, in the subset = shape.

caught(jdesc(d, Age, subset = Keep01))

# Expected:
#   Descriptive Statistics
#   Caught: jdesc(): subset = Keep01 on its own is a variable name, which does
#   not select rows in R.
#   Use == (two equals signs) to compare it to a value:
#     subset = Keep01 == 1


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION D2 -- per-call subset = on a haven-labelled column ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Before S289: "Can't convert <logical> to <labelled<integer>>".
# S338: the "Frequencies" title now prints above the stop, as "Descriptive
# Statistics" does in D1 -- jfreq() printed its title after the filters ran,
# so its stops alone came with no title.

caught(jfreq(d, Condition, subset = Condition))

# Expected:
#   Frequencies
#   Caught: jfreq(): subset = Condition on its own is a variable name, which
#   does not select rows in R.
#   Use == (two equals signs) to compare it to a value:
#     subset = Condition == 1


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION D3 -- per-call single value ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

caught(jdesc(d, Age, subset = TRUE))

# Expected:
#   Descriptive Statistics
#   Caught: jdesc(): subset = TRUE is a single value, not one TRUE or FALSE for
#   every case.
#   In your jdesc() call, compare a variable to a value, for example
#   subset = Age < 40.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION D4 -- a stored filter that went stale: accepted at 12 rows, ----
#               applied at 11. The error names the frame, the filter, the
#               counts and BOTH exits; the first exit is then taken.
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

s <- d
keep12 <- TRUE               # one TRUE when set: R19 (S357) refuses a vector of
jsubset(s, Age > 35 & keep12)    # one per case; twelve values once s has 11 rows
jdesc(s, Age)
s <- s[-1, ]
keep12 <- rep(TRUE, 12)
caught(jdesc(s, Age))
jsubset(s, off)
jdesc(s, Age)
jsubset(s, NULL)

# Expected:
#   jsubset activated for s: Age > 35 & keep12
#   Descriptive Statistics
#
#   Case Processing  Excluded  Remaining
#       Original           --         12
#       jsubset()           5          7  Age > 35 & keep12 (1 missing)
#       Remaining N        --          7
#   -------------------------------------------------------------------
#
#   Variable  Total  Non_missing  Min  Max   Mean     SD
#   --------  -----  -----------  ---  ---  ------  -----
#   Age         7         7        38   62  48.429  8.223
#
#   Descriptive Statistics
#   Caught: jdesc(): the jsubset filter for the s data frame, Age > 35 & keep12,
#   cannot be applied: keep12 is not in the s data frame; it is a separate
#   object in your workspace, with 12 values for 11 cases.
#   To set it aside, run:
#     jsubset(s, off)
#   To delete it, run:
#     jsubset(s, NULL)
#   jsubset deactivated for s.
#   Descriptive Statistics
#
#   (jsubset set but inactive)
#
#   11 Cases in the 1 Variable Pool
#
#   Variable  Total  Non_missing  Min  Max   Mean     SD
#   --------  -----  -----------  ---  ---  ------  ------
#   Age         11        10       27   62  42.800  11.371
#
#   jsubset cleared for s (had: Age > 35 & keep12).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION D5 -- a stored filter that cannot be EVALUATED stops (S330; it ----
#               warned, and ran on every row)
# NEEDS: D4
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The object the filter names is removed after the filter is set. Until S330
# this printed a warning and then a full analysis of all 11 cases, with a
# Case Processing row reading "jsubset()  0  11" as if the filter had run.
# Now it is D4's error: the frame, the filter, what is gone, and both exits.

keep12 <- 35                 # a value (R19, S357); D4 left twelve TRUEs
jsubset(s, Age > keep12)
rm(keep12)
caught(jdesc(s, Age))
jsubset(s, NULL)

# Expected:
#   jsubset activated for s: Age > keep12
#   Descriptive Statistics
#   Caught: jdesc(): the jsubset filter for the s data frame, Age > keep12,
#   cannot be applied: keep12 no longer exists.
#   To set it aside, run:
#     jsubset(s, off)
#   To delete it, run:
#     jsubset(s, NULL)
#   jsubset cleared for s (had: Age > keep12).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION D6 -- per-call subset = NOT(...): the syntax check now runs on ----
#               the per-call route too (S290; before: R's own "could not find
#               function NOT", wrapped)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Same message as A5, in the subset = form: the lead and the fix line show
# what the caller can actually type.

caught(jdesc(d, Age, subset = NOT(Age < 40)))

# Expected:
#   Descriptive Statistics
#   Caught: jdesc(): subset = NOT(Age < 40) uses NOT, which R does
#   not recognize.
#   Use ! (exclamation mark):
#     subset = !(Age < 40)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION D7 -- per-call subset = (Gender = 1) & (Age < 40): the ----
#               silent-wrong case (S290)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Before S290 this call RAN: R evaluated (Gender = 1) as an assignment, the
# filter became 1 & (Age < 40), and jdesc reported 5 remaining -- everyone
# under 40, both genders -- with the typed filter printed in the CPS row as
# if it had been honoured. Observed live in the sandbox at S290. Now refused.

caught(jdesc(d, Age, subset = (Gender = 1) & (Age < 40)))

# Expected:
#   Descriptive Statistics
#   Caught: jdesc(): subset = (Gender = 1) & (Age < 40) uses a single =, which
#   does not test equality in R.
#   Use == (two equals signs):
#     subset = (Gender == 1) & (Age < 40)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION D8 -- per-call subset = on a logical column: accepted (S290) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The per-call counterpart of A4. Five under 40 kept; the NA row is excluded.

jdesc(d, Age, subset = Under40)

# Expected:
#   Descriptive Statistics
#
#   Case Processing  Excluded  Remaining
#       Original           --         12
#       subset =            7          5  Under40 (1 missing)
#       Remaining N        --          5
#   ---------------------------------------------------------
#
#   Variable  Total  Non_missing  Min  Max   Mean     SD
#   --------  -----  -----------  ---  ---  ------  -----
#   Age         5         5        27   38  31.400  4.278


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION D9 -- a stored filter that stops for another reason: R's message, ----
#               and both exits (S330)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The filter ran when it was set; the function it calls stops now. Nothing
# "no longer exists", so the message says only that the filter cannot be
# applied, and what R reported.

lim <- function() 40
jsubset(d, Age > lim())
lim <- function() stop("the limit file is not loaded")
caught(jdesc(d, Age))
jsubset(d, NULL)

# Expected:
#   jsubset activated for d: Age > lim()
#   Descriptive Statistics
#   Caught: jdesc(): the jsubset filter for the d data frame, Age > lim(),
#   cannot be applied.
#   R reported:
#     the limit file is not loaded
#   To set it aside, run:
#     jsubset(d, off)
#   To delete it, run:
#     jsubset(d, NULL)
#   jsubset cleared for d (had: Age > lim()).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION D10 -- a stored jcomplete() whose variable has left the frame ----
#                stops (S330; it warned from S318, and applied the rest)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Tmp is in the setting and then dropped from the frame. Age is still there,
# and until S330 the analysis ran with listwise deletion on Age alone, behind
# a warning.

k <- d
k$Tmp <- c(NA, 2:12)
jcomplete(k, Age, Tmp)
k$Tmp <- NULL
caught(jdesc(k, Age))
jcomplete(k, NULL)

# Expected:
#   Listwise Case Filter
#   Variable   N  Missing  % Missing
#   --------  --  -------  ---------
#   Age       12     1        8.3%
#   Tmp       12     1        8.3%
#
#     Complete cases: 10 of 12 (83.3%)
#     Listwise filter activated -- 2 cases will be excluded from
#     subsequent analyses.
#   Descriptive Statistics
#   Caught: jdesc(): the jcomplete setting for the k data frame names Tmp, which
#   the data frame no longer has.
#   Run jcomplete() again with the current variable names, or clear the setting:
#     jcomplete(k, NULL)
#   jcomplete cleared for k (had: Age, Tmp).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION D11 -- per-call subset = with a vector that would be recycled ----
#                (S330)
# NEEDS: B8, B10
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# B10's message in the subset = form. Before S330 this analysis RAN, on the
# 4 cases the recycled comparison happened to keep, behind R's "longer
# object length" warning.

caught(jdesc(d, Age, subset = Age > v5))

# Expected:
#   Descriptive Statistics
#   Caught: jdesc(): In subset = Age > v5, v5 is not in the d data frame; it is
#   a separate object in your workspace.
#   It has 5 values for the 12 cases in the d data frame.
#   Use a single value, or add the values to the data frame as a variable.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION D12 -- a filter on a vector holding one value per case, behind an ----
#                active jcomplete() (S331)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# keepv has one value for each of d's twelve cases. jcomplete() on Age drops
# the case whose Age is missing, so the filter is handed eleven. Until S331
# this said "has 12 values for 11 rows", with two exits, for a frame nothing
# had been removed from; from S331 it named the count jcomplete() left and
# gave the line that adds the vector to the frame. Since S357 (ruling R19)
# a vector of one value per case stops wherever a filter reads it, so the
# filter is set while keepv is one TRUE, and keepv becomes the vector after:
# R19's stored form, with the line that adds it to the frame, where the
# stored filter finds it -- the same analysis then runs.

keepv <- TRUE
jsubset(d, Age > 0 & keepv)
jcomplete(d, Age)
keepv <- d$Age > 35 | is.na(d$Age)
caught(jdesc(d, Age))
d$keepv <- keepv
jdesc(d, Age)
d$keepv <- NULL
jsubset(d, NULL)

# Expected:
#   jsubset activated for d: Age > 0 & keepv
#   Listwise Case Filter
#   Variable   N  Missing  % Missing
#   --------  --  -------  ---------
#   Age       12     1        8.3%
#
#     Complete cases: 11 of 12 (91.7%)
#     Listwise filter activated -- 1 case will be excluded from
#     subsequent analyses.
#   Descriptive Statistics
#   Caught: jdesc(): the jsubset filter for the d data frame, Age > 0 & keepv,
#   cannot be applied: keepv is not in the d data frame; it is a separate object
#   in your workspace.
#   jstats analyzes the variables of a data frame.
#   Add it to the data frame first:
#     d$keepv <- keepv
#   Descriptive Statistics
#
#   Case Processing  Excluded  Remaining
#       Original           --         12
#       jcomplete()         1         11  Age
#       jsubset()           4          7  Age > 0 & keepv
#       Remaining N        --          7
#   -----------------------------------------------------
#
#   Variable  Total  Non_missing  Min  Max   Mean     SD
#   --------  -----  -----------  ---  ---  ------  -----
#   Age         7         7        38   62  48.429  8.223
#
#   jsubset cleared for d (had: Age > 0 & keepv).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION D13 -- the same filter SET while jcomplete() is active is refused ----
#                (S331; it reported "activated")
# NEEDS: D12
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# D12's jcomplete() is still in place.

caught(jsubset(d, keepv == TRUE))
jcomplete(d, NULL)

# Expected:
#   Caught: jsubset(): In keepv == TRUE, keepv is not in the d data frame; it is
#   a separate object in your workspace.
#   jstats analyzes the variables of a data frame.
#   Add it to the data frame first:
#     d$keepv <- keepv
#     jsubset(d, keepv == TRUE)
#   jcomplete cleared for d (had: Age).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION D14 -- per-call subset = with such a vector, behind a stored ----
#                filter (S331)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The S330 add-it-to-the-frame message, which until S331 appeared only when
# the vector was compared with a labelled variable; compared with a plain
# one, as here, the message was "has 12 values for 6 rows". Since S357
# (ruling R19) it is R19's message, the same with or without the stored
# filter, the call after the line that adds the vector.

per <- rep(c(35, 45), 6)
jsubset(d, Gender == 1)
caught(jdesc(d, Age, subset = Age >= per))
jsubset(d, NULL)

# Expected:
#   jsubset activated for d: Gender == 1
#   Descriptive Statistics
#   Caught: jdesc(): In subset = Age >= per, per is not in the d data frame; it
#   is a separate object in your workspace.
#   jstats analyzes the variables of a data frame.
#   Add it to the data frame first:
#     d$per <- per
#     jdesc(d, Age, subset = Age >= per)
#   jsubset cleared for d (had: Gender == 1).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART E -- A NAMED ITEM IN A VARIABLE LIST (.jst_check_named_variables, ----
#           S290)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION E1 -- jsubset(Gender = 1): a top-level single = ----
# NEEDS: C2
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# R's parser turns Gender = 1 into an argument NAMED Gender before jstats
# runs. jsubset() had no ... until S290, so R itself refused the call with
# "unused argument (Gender = 1)". Now the named item lands in ... and is
# read as the condition it was meant to be.

caught(jsubset(Gender = 1))

# Expected:
#   Caught: jsubset(): Gender = 1 uses a single =, which does not test
#   equality in R.
#   Use == (two equals signs), and name the data frame:
#     jsubset(MyData, Gender == 1)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION E2 -- jdesc(d, Age, Gender = 1): the same mistake in a variable ----
#               list
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Before S290: "Variable(s) not found in d: 1." -- the value was looked up
# as a name. Gender == 1 would not be a variable either, so the fix points
# at subset =, which jdesc has.

caught(jdesc(d, Age, Gender = 1))

# Expected:
#   Caught: jdesc(): Gender = 1 uses a single =, and the variable list takes
#   names, not conditions.
#   To select rows, use == (two equals signs) in subset =:
#     subset = Gender == 1


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION E3 -- jdesc(d, Age, digit = 2): a misspelled input, told apart by ----
#               the name
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# digit is not a column, so this is not a condition; it is digits misspelled,
# which R cannot partial-match because it sits after the variable list.
# Before S290: "Variable(s) not found in d: 2."
# S338: "unused input", in number -- it read "unused input(s)". Two of them
# read "unused inputs: digit, foo".

caught(jdesc(d, Age, digit = 2))

# Expected:
#   Caught: jdesc(): unused input: digit


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION E4 -- jsum(d, Gender = 1): a function with no subset = input ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Nothing to point at, so the fix is the variable on its own. jsum() and
# javg() compute for every row by design (they ignore filters), which is
# why the message must not suggest one.

caught(jsum(d, Gender = 1))

# Expected:
#   Caught: jsum(): Gender = 1 uses a single =, and the variable list takes
#   names, not conditions.
#   List the variable on its own:
#     Gender


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART F -- UNDER A juse() DEFAULT, THE FRAME'S VARIABLE (S348) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Ruling R12 (Jeff, S345). With a default set, a bare name the default frame
# has is the frame's variable in jdesc(), jfreq() and jscreen() -- the three
# functions that also take a single column -- as it already was in every
# other function. Through v0.9.220 those three read a separate vector of the
# same name in the workspace and said nothing: jdesc(Age) described three
# made-up values, and jdesc(Age, Gender) was refused. The assertion side is
# filter_check.R section U.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION F1 -- the frame's variable, and the line that says so ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# f1 is a twelve-case frame; Age, Gender and Tenure, made in the workspace
# for some other purpose, share its variables' names. (S356: Render 3 reads
# Tenure, a name only f1 holds, since the vector path's new line names
# every data frame that has the variable -- the Setup's d and e hold Age.)

f1 <- data.frame(Age    = c(21, 34, 45, 23, 36, 52, 41, 29, 33, 40, 38, NA),
                 Gender = c(1, 2, 1, 2, 2, 1, 1, 2, 1, 2, 2, 1),
                 Tenure = c(3, 5, 8, 2, 6, 9, 7, 4, 5, 6, 5, 1))
juse(f1)
Age    <- c(1, 2, 3)
Gender <- factor(c("m", "f", "f"))
Tenure <- c(1, 2, 3)
jdesc(Age)

# Expected:
#   Descriptive Statistics
#   Using default data frame: f1
#   Age is the variable in f1, not the separate object with that name.
#
#   12 Cases in the 1 Variable Pool
#
#   Variable  Total  Non_missing  Min  Max   Mean     SD
#   --------  -----  -----------  ---  ---  ------  -----
#   Age         12        11       21   52  35.636  9.146

jdesc(Age, Gender)

# Expected:
#   Descriptive Statistics
#   Using default data frame: f1
#   Age and Gender are variables in f1, not the separate objects with
#   those names.
#
#   12 Cases in the 2 Variable Pool; 11 Complete on All
#
#   Warning: Gender seems categorical. Descriptive statistics may not
#   be meaningful.
#   Variable  Total  Non_missing  Min  Max   Mean     SD
#   --------  -----  -----------  ---  ---  ------  -----
#   Age         12        11       21   52  35.636  9.146
#   Gender      12        12        1    2   1.500  0.522

juse(NULL)
jdesc(Tenure)

# Expected:
#   Descriptive Statistics
#   Tenure is a separate object in your workspace, not the variable in f1.
#   To analyze the variable, name the data frame:
#     jdesc(f1, Tenure)
#
#   3 Cases in the 1 Variable Pool
#
#   Warning: Tenure seems categorical. Descriptive statistics may not
#   be meaningful.
#   Variable  Total  Non_missing  Min  Max   Mean    SD
#   --------  -----  -----------  ---  ---  -----  -----
#   Tenure      3         3        1    3   2.000  1.000

rm(f1, Age, Gender, Tenure)

# Things to look at:
#   - Render 1: twelve cases, eleven with an age, from 21 to 52 -- the
#     frame's Age, not the workspace's 1, 2, 3. Under "Using default data
#     frame: f1", one line says which object was read.
#   - Render 2: both names are shared, so the line names both, in the
#     plural. Through v0.9.220 this call stopped: "Gender needs the data
#     frame, not the single column Age."
#   - Render 3: with no default there is no frame to read, so the
#     workspace vector is described, as before, and no default note --
#     and since v0.9.229 (ruling R18) two lines under the title say that
#     Tenure is a separate object, not f1's variable, and give the call
#     that reads the variable (Part H shows this on its own).
#   - Not shown: a function, a list or a data frame sharing the name gets
#     no line (filter_check.R U08); the line prints at every output level.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART G -- THE FRONT DOOR: ONE ROW, AN INPUT jsubset() DOES NOT HAVE, AN ----
#           EXPRESSION AS THE DATA (S349)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Fix Slate 7, second half (v0.9.222). Three things the filter functions got
# wrong at the door: a filter on a one-row frame was refused as "a single
# value"; quiet = TRUE beside a condition was read as a condition typed with
# one =, and offered a line that does not run; and a setting made on an
# expression -- jsubset(mk(), ...) -- was stored under the text "mk()",
# where no later call reached it. The assertion side is filter_check.R
# section V.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION G1 -- a filter on a one-row frame ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# one has a single row, so y > 1 gives one TRUE: one value for every row.

one <- data.frame(y = 5, g = 1)
jfreq(one, g, subset = y > 1)

# Expected:
#   Frequencies
#
#   Case Processing  Excluded  Remaining
#       Original           --          1
#       subset =            0          1  y > 1
#       Remaining N        --          1
#   -------------------------------------------
#
#   g
#
#          Freq  Total %  Valid %  Cum. %
#   -----  ----  -------  -------  ------
#   1        1    100.00   100.00  100.00
#
#   Total    1    100.00

caught(jfreq(one, g, subset = TRUE))

# Expected:
#   Frequencies
#   Caught: jfreq(): subset = TRUE is a single value, not one TRUE or FALSE for
#   every case.
#   In your jfreq() call, compare a variable to a value, for example
#   subset = Age < 40.
#
# Things to look at:
#   - Render 1: the table, with its subset = row. Through v0.9.221 this call
#     stopped: "subset = y > 1 is a single value (TRUE), not one TRUE or
#     FALSE for every row."
#   - Render 2: a condition that names no variable is still refused on one
#     row, as anywhere: TRUE selects nothing in particular.

rm(one)

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION G2 -- quiet = TRUE beside a condition ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# quiet = is an argument of joutput() and joptions(), not of jsubset().

caught(jsubset(d, Age > 40, quiet = TRUE))

# Expected:
#   Caught: jsubset(): unused input: quiet

caught(jsubset(d, Gender = 1))

# Expected:
#   Caught: jsubset(): Gender = 1 uses a single =, which does not test
#   equality in R.
#   Use == (two equals signs):
#     jsubset(d, Gender == 1)
#
# Things to look at:
#   - Render 1: "unused input", the message every variable list gives a
#     named input that is not one of the frame's variables (E3). Through
#     v0.9.221 it read "quiet = TRUE uses a single =" and offered
#     jsubset(d, quiet == TRUE), a line that does not run.
#   - Render 2: a variable of the frame typed with one = keeps the single-=
#     stop and its line (A2's form): Gender is a variable of d, so the named
#     input is the condition it was meant to be.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION G3 -- a setting made on an expression ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# mk() returns d. A setting is stored under its data frame's name, and mk()
# is not one.

mk <- function() d
caught(jsubset(mk(), Age > 40))

# Expected:
#   Caught: jsubset(): mk() is not a name, and a jsubset filter is stored under
#   its data frame's name.
#   Give the data frame a name first, then set it:
#     mydata <- mk()
#     jsubset(mydata, Age > 40)

caught(jsubset(mk(), off))

# Expected:
#   Caught: jsubset(): mk() is not a name, and jsubset filters are stored under
#   a data frame's name.
#   To see the jsubset filters that are stored, run:
#     jsubset()

caught(jcomplete(mk(), Age))

# Expected:
#   Caught: jcomplete(): mk() is not a name, and a jcomplete setting is stored
#   under its data frame's name.
#   Give the data frame a name first, then set it:
#     mydata <- mk()
#     jcomplete(mydata, Age)
#
# Things to look at:
#   - Render 1: the two lines run: the first names the data frame, the
#     second sets the filter on that name. Through v0.9.221 this call
#     printed "jsubset activated for mk(): Age > 40", for a filter no later
#     call reached unless it typed mk() again.
#   - Render 2: off, on and NULL act on a stored setting, and nothing is
#     stored under an expression, so the line shows what is stored.
#   - Render 3: jcomplete() the same. Both take the form the registration
#     verbs have given since v0.9.216 (jdummy(mk(), Grp)).
#   - Not shown: a place, lst$d, is accepted by both (filter_check.R V17).

rm(mk)

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION G4 -- quiet = TRUE with no data frame in hand (S352) ----
# NEEDS: C2
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S352 (v0.9.225; the S349 item). G2's rule, where no data frame is in
# hand -- none named and no juse() default. A named input beside a
# condition was still read as a condition typed with one =, and
# jsubset(Age > 40, quiet = TRUE) offered jsubset(quiet == TRUE). It is
# now an unused input there too; a named input on its own is still read
# as the condition it most likely is. The assertion side is filter_check.R
# section W.
.def_g4 <- getOption(".jst_default_data")
options(.jst_default_data = NULL)

caught(jsubset(Age > 40, quiet = TRUE))

# Expected:
#   Caught: jsubset(): unused input: quiet

caught(jsubset(Gender = 1))

# Expected:
#   Caught: jsubset(): Gender = 1 uses a single =, which does not test
#   equality in R.
#   Use == (two equals signs), and name the data frame:
#     jsubset(MyData, Gender == 1)
options(.jst_default_data = .def_g4)
rm(.def_g4)

# Things to look at:
#   - Render 1: "unused input", as in G2. Without quiet =, the same call
#     meets the stop for a condition with no data frame (no default is set
#     here).
#   - Render 2: unchanged: a named input on its own keeps the single-= stop.
#     Since S371 (ruling R23) its line names a data frame, there being no
#     default: MyData here, since d and e both hold Gender (G9 Render 5).

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# G5 -- a condition with no data frame in hand (S355) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# v0.9.228 (Fix Slate W1; the S352 item, met writing G4's notes). With no
# frame named and no juse() default, the shared resolver called a condition
# a name that was "not found" and asked whether it was meant as a variable
# name, its two fixes inline after colons:
#   jsubset(): 'Age > 40' not found. Did you mean to use it as a variable
#   name?
#   If so, provide the data frame: jsubset(MyData, Age > 40)
#   Or set a default first with juse(MyData), then: jsubset(Age > 40)
# A condition is now said to need a data frame; a bare name keeps its
# question; each call is on a line of its own. The assertion side is
# filter_check.R section X. Names the workspace cannot hold keep the calls
# clear of the walker's own objects.
.def_g5 <- getOption(".jst_default_data")
options(.jst_default_data = NULL)

caught(jsubset(.g5_Age > 40))
caught(jcorr(.g5_Age))
# Expected:
#   Caught: jsubset(): .g5_Age > 40 needs a data frame, and none was named or
#   set as the default.
#   Name the data frame first:
#     jsubset(MyData, .g5_Age > 40)
#   Or set a default first, then run the call:
#     juse(MyData)
#     jsubset(.g5_Age > 40)
#   Caught: jcorr(): '.g5_Age' not found.
#   Did you mean to use it as a variable name?
#   If so, name the data frame first:
#     jcorr(MyData, .g5_Age)
#   Or set a default first, then run the call:
#     juse(MyData)
#     jcorr(.g5_Age)
options(.jst_default_data = .def_g5)
rm(.def_g5)

# Things to look at:
#   - Render 1: "needs a data frame", no "not found" and no variable-name
#     question; the two ways out, each call on a line of its own, the
#     default's two lines in the order they are run;
#   - Render 2: a bare name keeps "not found" and its question, with the
#     same lines.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# G6 -- no data frame and no default: both routes (S368) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# v0.9.240 (Fix Slate 15; the lean okayed at S367). A call that names no data
# frame, with no juse() default, stopped in every function that reached the
# resolver this way with one route, two sentences on one line:
#   jt(): No data frame specified and no default set. Use juse() to set
#   a default.
# It now offers both, as G5's stops do: the call with the data frame named
# -- after the formula in a formula call, first in any other -- or a default
# set and the call run again. The data frame named is the one in the
# workspace holding every variable the formula names; a call with no
# variable to match counts any one data frame; MyData with none or several.
# Render 1 is a formula whose variables only g6 holds; Render 2 a call with
# no variable to match, in the walk's workspace, which holds several data
# frames; Render 3 the same with an argument, in .ws_g6, a stand-in for a
# console session whose workspace holds one data frame. The assertion side
# is filter_check.R section AB.
.def_g6 <- getOption(".jst_default_data")
options(.jst_default_data = NULL)
g6 <- data.frame(Score6 = c(4, 7, 5, 8, 6, 9), Group6 = rep(1:2, 3))

caught(jt(Score6 ~ Group6))
# Expected:
#   Caught: jt(): no data frame was named or set as the default.
#   Name the data frame after the formula:
#     jt(Score6 ~ Group6, g6)
#   Or set a default first, then run the call:
#     juse(g6)
#     jt(Score6 ~ Group6)

caught(jscreen())
# Expected:
#   Caught: jscreen(): no data frame was named or set as the default.
#   Name the data frame first:
#     jscreen(MyData)
#   Or set a default first, then run the call:
#     juse(MyData)
#     jscreen()

.ws_g6 <- new.env(parent = baseenv())
.ws_g6$g6 <- g6; .ws_g6$jcorr <- jcorr
caught(evalq(jcorr(method = "spearman"), .ws_g6))
# Expected:
#   Caught: jcorr(): no data frame and no variables were named.
#   Name a data frame and two or more of its variables, for example:
#     jcorr(community, Income, Age, WellbeingScore, method = "spearman")

# Render 3b (S369, ruling R22): the other six functions that need variables,
# given nothing, in .ws_g6; jsum() with min.valid =, which depends on the
# variables and is left out of the example.
.ws_g6$jdesc <- jdesc; .ws_g6$jfreq <- jfreq; .ws_g6$jalpha <- jalpha
.ws_g6$jsum <- jsum; .ws_g6$javg <- javg; .ws_g6$jplot <- jplot
caught(evalq(jdesc(), .ws_g6))
caught(evalq(jfreq(), .ws_g6))
caught(evalq(jalpha(), .ws_g6))
caught(evalq(jsum(min.valid = 1), .ws_g6))
caught(evalq(javg(), .ws_g6))
caught(evalq(jplot(), .ws_g6))
# Expected:
#   Caught: jdesc(): no data frame and no variables were named.
#   Name a data frame and one or more of its variables, for example:
#     jdesc(community, Age, Income)
#   Caught: jfreq(): no data frame and no variables were named.
#   Name a data frame and one or more of its variables, for example:
#     jfreq(community, Region)
#   Caught: jalpha(): no data frame and no variables were named.
#   Name a data frame and two or more of its variables, for example:
#     jalpha(community, Environment1, Environment3, Environment4)
#   Caught: jsum(): no data frame and no variables were named.
#   Name a data frame and two or more of its variables, for example:
#     community$EnvTotal <- jsum(community, Environment1, Environment3)
#   Caught: javg(): no data frame and no variables were named.
#   Name a data frame and two or more of its variables, for example:
#     community$EnvAvg <- javg(community, Environment1, Environment3)
#   Caught: jplot(): no data frame and no variables were named.
#   Name a data frame and one or two of its variables, for example:
#     jplot(community, Age)

# Render 3c (S369): the variables named, the data frame not -- both routes
# keep the whole call.
caught(evalq(jcorr(Score6, Group6, method = "spearman"), .ws_g6))
# Expected:
#   Caught: jcorr(): 'Score6' not found.
#   Did you mean to use it as a variable name?
#   If so, name the data frame first:
#     jcorr(g6, Score6, Group6, method = "spearman")
#   Or set a default first, then run the call:
#     juse(g6)
#     jcorr(Score6, Group6, method = "spearman")

# Render 4 (S369): short of two variables, each of these stops gives a line
# to run, as jdesc()'s no-variables stop does. jcorr() and jsum() given
# none; jalpha() and javg() given one.
caught(jcorr(g6))
caught(jalpha(g6, Score6))
caught(jsum(g6))
caught(javg(g6, Score6))
# Expected:
#   Caught: jcorr(): At least 2 variables are required.
#   None were provided.
#   Provide two or more variable names, for example:
#     jcorr(community, Income, Age, WellbeingScore)
#   Caught: jalpha(): At least 2 items are required.
#   Only 1 was provided.
#   Provide two or more item names, for example:
#     jalpha(community, Environment1, Environment3, Environment4)
#   Caught: jsum(): At least 2 variables are required.
#   Provide two or more variable names, for example:
#     community$EnvTotal <- jsum(community, Environment1, Environment3)
#   Caught: javg(): At least 2 variables are required.
#   Provide two or more variable names, for example:
#     community$EnvAvg <- javg(community, Environment1, Environment3)

# Render 5 (S369): jcopy() with no default, in .ws_g6: the same two routes,
# its one name the copy's destination.
.ws_g6$jcopy <- jcopy
caught(evalq(jcopy(g6copy), .ws_g6))
# Expected:
#   Caught: jcopy(): no data frame was named or set as the default.
#   Name the data frame first:
#     jcopy(g6, g6copy)
#   Or set a default first, then run the call:
#     juse(g6)
#     jcopy(g6copy)

# Render 6 (S369): a default whose data frame has gone, in jdesc() and in
# jcopy().
options(.jst_default_data = "g6_gone")
caught(jdesc(Score6))
caught(jcopy(g6copy))
# Expected:
#   Caught: jdesc(): the default data frame g6_gone was not found.
#   It may have been removed or renamed.
#   Caught: jcopy(): the default data frame g6_gone was not found.
#   It may have been removed or renamed.
options(.jst_default_data = .def_g6)
rm(.def_g6, .ws_g6, g6)

# Things to look at:
#   - RULING R22 (S369, v0.9.242; Fix Slate 17; Jeff: "all recommendations
#     are good including the suggested wording"): Render 3 had given the
#     two routes -- jcorr(g6, method = "spearman"), or juse(g6) and the call
#     -- and either, run, stopped again for want of variables. One stop
#     now: neither a data frame nor variables were named, and the
#     function's own example on community, method = "spearman" kept.
#     Render 3b: the same in jdesc(), jfreq(), jalpha(), jsum(), javg() and
#     jplot(), each its own count and example; a display option such as
#     method = or digits = is kept, an argument that names or depends on
#     your variables (by =, subset =, min.valid =) is not. jscreen()
#     (Render 2) keeps the two routes: it screens every column of a data
#     frame given alone (filter_check.R AE01-AE06).
#   - Render 3c (S369, found building Fix Slate 17): jcorr(Score6, Group6,
#     method = "spearman") had been offered jcorr(g6, Score6) and
#     jcorr(Score6) -- the second variable and method = dropped, so the
#     first line stopped again. Both routes now keep the whole call
#     (filter_check.R AE11).
#   - Render 1: the lead on a line of its own, "Name the data frame after
#     the formula:" and jt(Score6 ~ Group6, g6), then juse(g6) and the call
#     as typed. Does "after the formula" read naturally beside G5's "Name
#     the data frame first:"?
#   - Render 2: MyData in both routes, since the walk's workspace holds
#     several data frames and jscreen() has no variable to match.
#   - jdesc(), jfreq(), jcorr(), jalpha() and jsum() given nothing get the
#     same two routes, and their first line, run, then stops for want of
#     variables, with that function's own message (filter_check.R AB03 and
#     AB07) -- since S369 a message with a line to run in each (Render 4).
#   - Render 4 (S369, v0.9.241; Fix Slate 16, Claude's call): "At least 2
#     variables are required." and, where it said so, how many were given,
#     then "Provide two or more variable names, for example:" ("item names"
#     for jalpha()) and a line on community's own columns -- never the
#     call's data frame (S338) -- which runs as printed (filter_check.R AD05-
#     AD07). jsum() and javg() show the assignment, as their help pages do.
#     Does the lead read well under "At least 2 ... are required."?
#   - Render 5 (S369): jcopy(g6copy) had said "No source given and no juse()
#     default set. Either name the source -- jcopy(mydata, g6copy) -- or set
#     a default with juse(mydata).", two sentences run together and the
#     calls inline. It now gives the two routes, naming g6, the one data
#     frame in .ws_g6; g6copy is the destination, so it is not a variable
#     to match (filter_check.R AD03-AD04).
#   - Render 6 (S369): one sentence a line, "the default data frame g6_gone"
#     (voice Rule T) where it said "Default data frame g6_gone not found.
#     It may have been removed or renamed." on one line. jcopy() gives the
#     resolver's own stop: it had turned every resolver error into "no
#     juse() default set", untrue here (filter_check.R AD02).

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# G7 -- six stops laid out: jcomplete(), jplot() and jcopy() (S369) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# v0.9.242 (Fix Slate 17's riders, Claude's call). Six stops gave their
# example after "e.g." inside a sentence; each now has one sentence a line
# and the call on a line of its own (voice Rules E and L). Render 1 is
# jcomplete() and jplot() given a data frame and no variables; Render 2
# jplot() given three; Render 3 jcopy() with no name for the copy, a source
# that is not a data frame, and a source found nowhere, in .ws_g7, a
# stand-in for a console session holding one data frame. The assertion side
# is filter_check.R AE07-AE10.
g7 <- data.frame(Score7 = c(4, 7, 5, 8, 6, 9), Group7 = rep(1:2, 3), Age7 = 31:36)

caught(jcomplete(g7))
caught(jplot(g7))
# Expected:
#   Caught: jcomplete(): no variables specified.
#   Provide one or more variable names, for example:
#     jcomplete(community, Age, Income)
#   Caught: jplot(): no variables specified.
#   Provide one or more variable names, for example:
#     jplot(community, Age)

caught(jplot(g7, Score7, Group7, Age7))
# Expected:
#   Caught: jplot(): only 1 or 2 variables can be plotted at once.
#   To show a variable by the groups of another, add by = to the call,
#   for example:
#     jplot(community, Age, by = Region)
#   Or call jplot() once for each variable.

.ws_g7 <- new.env(parent = baseenv())
.ws_g7$g7 <- g7; .ws_g7$jcopy <- jcopy
caught(evalq(jcopy(), .ws_g7))
caught(evalq(jcopy(1:3, g7copy), .ws_g7))
caught(evalq(jcopy(g7x, g7copy), .ws_g7))
# Expected:
#   Caught: jcopy(): no name was given for the copy.
#   Name the data frame, then the copy, for example:
#     jcopy(g7, newdata)
#   Caught: jcopy(): 1:3 is not a data frame.
#   Name a data frame to copy, for example:
#     jcopy(g7, g7copy)
#   Caught: jcopy(): 'g7x' not found.
#   Name a data frame to copy, for example:
#     jcopy(g7, g7copy)
rm(.ws_g7, g7)

# Things to look at:
#   - Render 1: "no variables specified." then "Provide one or more
#     variable names, for example:" and a line on community, as jdesc()'s
#     and jfreq()'s stops have; jcomplete() had said "Provide at least one
#     variable name, e.g. jcomplete(DV, IV1, IV2).", a line that does not
#     run. jcomplete(community, Age, Income), run, sets a setting on
#     community: is that acceptable for an example, or would a placeholder
#     (MyData, DV, IV1) read better here?
#   - Render 2: the old example, jplot(community, Age, Income, by =
#     Region), itself stopped (two numeric variables want the formula
#     form). The new one, jplot(community, Age, by = Region), draws Age by
#     region.
#   - Render 3: what was typed is the subject (voice Rule AD) -- 1:3, g7x --
#     the copy's name kept, g7 named as the one data frame in .ws_g7. The
#     third had been R's own "object 'g7x' not found".

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# G8 -- the recode family and the registration verbs given no variable (S370) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# v0.9.243 (Fix Slate 18; its two leans okayed at S369, "ok on all
# recommendations", the wording Claude's). Render 1: ruling R22's one stop
# reaches jrecode(), jencode(), jrelabel(), jdeclare_missing() and
# jconvert() given nothing, with no default and no convention: they gave
# G6's two routes, jrecode(MyData) and juse(MyData) with jrecode(), and
# either, run, stopped again for want of a variable or a target. Render 2:
# a call that names its target (or variable) by argument lacks only the
# data frame and keeps the two routes, as jconvert() does under a session
# convention, which supplies the target; in .ws_g8, a stand-in for a
# console session holding one data frame. Render 3: the same four given a
# data frame alone, where jrecode(), jencode() and jrelabel() had said
# "Variable names cannot be blank." / "Check for a stray comma or period
# in the call." Render 4: the registration verbs' stops, the example on a
# line of its own. Render 5: jsubset() given no condition, and the riders
# -- jsubset() and jnumeric() given an expression and nothing else. The
# assertion side is filter_check.R section AF.
.def_g8 <- getOption(".jst_default_data")
.conv_g8 <- getOption(".jst_options_missing_convention")
options(.jst_default_data = NULL, .jst_options_missing_convention = "none")
g8 <- data.frame(Score8 = c(4, 7, 5, 8, 6, 9), Group8 = rep(1:2, 3),
                 Name8 = c("a", "b", "c", "d", "e", "f"))

# Render 1: nothing given.
caught(jrecode())
caught(jencode())
caught(jrelabel())
caught(jdeclare_missing())
caught(jconvert())
# Expected:
#   Caught: jrecode(): no data frame and no variables were named.
#   Name a data frame and one of its variables, for example:
#     community$OwnsHome01 <- jrecode(community, OwnsHome, map = "1=1; 2=0")
#   Caught: jencode(): no data frame and no variables were named.
#   Name a data frame and one of its text variables, for example:
#     community$IDNumber <- jencode(community, RespondentID)
#   Caught: jrelabel(): no data frame and no variables were named.
#   Name a data frame and one of its variables, for example:
#     community$Age <- jrelabel(community, Age, var.label = "Age in years")
#   Caught: jdeclare_missing(): no data frame and no variables were named.
#   Name a data frame and one or more of its variables, for example:
#     jdeclare_missing(community, Age, codes = -99, convention = "spss")
#   Caught: jconvert(): no data frame and no target format were named.
#   Name a data frame and a target format, for example:
#     jconvert(community, to = "stata")

# Render 2: the target named, then a convention set, in .ws_g8.
.ws_g8 <- new.env(parent = baseenv())
.ws_g8$g8 <- g8; .ws_g8$jconvert <- jconvert
caught(evalq(jconvert(to = "stata"), .ws_g8))
options(.jst_options_missing_convention = "stata")
caught(evalq(jconvert(), .ws_g8))
options(.jst_options_missing_convention = "none")
# Expected:
#   Caught: jconvert(): no data frame was named or set as the default.
#   Name the data frame first:
#     jconvert(g8, to = "stata")
#   Or set a default first, then run the call:
#     juse(g8)
#     jconvert(to = "stata")
#   Caught: jconvert(): no data frame was named or set as the default.
#   Name the data frame first:
#     jconvert(g8)
#   Or set a default first, then run the call:
#     juse(g8)
#     jconvert()

# Render 3: a data frame alone.
caught(jrecode(g8))
caught(jencode(g8))
caught(jrelabel(g8))
caught(jdeclare_missing(g8))
# Expected:
#   Caught: jrecode(): no variable specified.
#   Provide the variable to recode, for example:
#     community$OwnsHome01 <- jrecode(community, OwnsHome, map = "1=1; 2=0")
#   Caught: jencode(): no variable specified.
#   Provide the text variable to encode, for example:
#     community$IDNumber <- jencode(community, RespondentID)
#   Caught: jrelabel(): no variable specified.
#   Provide the variable to label, for example:
#     community$Age <- jrelabel(community, Age, var.label = "Age in years")
#   Caught: jdeclare_missing(): no variables specified.
#   Provide one or more variable names, for example:
#     jdeclare_missing(community, Age, codes = -99, convention = "spss")
#   To apply one declaration to every variable, use vars = names(g8).

# Render 4: the registration verbs.
caught(jnumeric(g8))
caught(jcount(g8))
caught(jlikert(g8))
caught(jdummy(g8))
# Expected:
#   Caught: jnumeric(): no variables specified.
#   Provide one or more variable names, for example:
#     jnumeric(community, Environment2)
#   Caught: jcount(): no variables specified.
#   Provide one or more variable names, for example:
#     jcount(MyData, Arrests)
#   Caught: jlikert(): no variables specified.
#   Provide one or more variable names, for example:
#     jlikert(community, Environment1, Environment2)
#   Caught: jdummy(): no variables specified.
#   Provide one or more variable names, for example:
#     jdummy(community, Region)

# Render 5: jsubset() given no condition; an expression and nothing else.
mk8 <- function() g8
caught(jsubset(g8))
caught(jsubset(mk8()))
caught(jnumeric(mk8()))
# Expected:
#   Caught: jsubset(): no condition specified.
#   Provide a condition, for example:
#     jsubset(community, Age < 40)
#   Caught: jsubset(): no condition specified.
#   Provide a condition, for example:
#     jsubset(community, Age < 40)
#   Caught: jnumeric(): no variables specified.
#   Provide one or more variable names, for example:
#     jnumeric(community, Environment2)
options(.jst_default_data = .def_g8, .jst_options_missing_convention = .conv_g8)
rm(.def_g8, .conv_g8, .ws_g8, g8, mk8)

# Things to look at:
#   - Render 1: R22's wording, as G6 Render 3 has it, with each function's
#     own count -- "one of its variables", "one of its text variables",
#     "one or more of its variables" -- and jconvert()'s "no target format"
#     in place of variables, since it converts a whole data frame given a
#     target. The example is the one each function's own stop gives
#     (Render 3), so the two agree (filter_check.R AF01-AF03, AF08).
#   - The examples are lines on community that run as printed with no
#     convention set and under spss, stata and sas (AF09). jrecode(),
#     jencode() and jrelabel() return a variable, so their lines assign it
#     to a column, as jsum()'s and javg()'s do. jdeclare_missing()'s names
#     convention = "spss": a declaration on a plain variable needs a
#     convention, and community's declared values are SPSS-style, so the
#     line runs whatever the session's setting.
#   - jencode()'s example: community's one text variable is RespondentID,
#     so the line encodes the IDs -- it runs, and lists 103 codes. The
#     alternative is the help page's placeholder, MyData$StatusR <-
#     jencode(MyData, Status), which reads better and does not run. Which?
#   - Render 2: jconvert(to = "stata") and jconvert() under a stata
#     setting lack only the data frame, so they keep the two routes, g8
#     named (AF04).
#   - Render 3: "no variable specified." (one variable) and "no variables
#     specified." (jdeclare_missing()), as jdesc()'s and jfreq()'s stops
#     have since S338; jdeclare_missing()'s vars = names(g8) line kept from
#     its old stop, which had its example inside a sentence (AF06, AF07).
#   - Render 4: one sentence a line, the example on a line of its own --
#     community's columns, except jcount()'s: community holds no count, so
#     its line is a placeholder, MyData and Arrests (voice Rule AC). They
#     had given jnumeric(g8, <var1>, <var2>) inline after "e.g.". jdummy()
#     had given four calls in one sentence -- jdummy(VarName),
#     jdummy(VarName, remove = TRUE), jdummy(VarName = NULL) and
#     jdummy(clear.all = TRUE) -- the third not a call jdummy() takes; it
#     now gives the one form the call was missing, as the other three
#     verbs do, the remove and clear forms left to its help page and its
#     status display (voice Rule D). Is anything lost by that?
#   - Render 5: jsubset(g8) had said "the condition must be a logical
#     expression. Example: jsubset(g8, Age < 40)" -- g8 has no Age. It now
#     says what is missing and gives a line on community (AF12). The two
#     riders, both defects on these surfaces found building the slate:
#     jsubset(mk8()) had offered "mydata <- mk8()" and "jsubset(mydata, Age
#     < 40)", inventing the condition, and jnumeric(mk8()) "jnumeric(mydata)",
#     which stopped for want of variables. Both now get the stop for what
#     is missing; with a condition or a variable named, the expression's
#     refusal and its two lines are as before (AF11, AF12).

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# G9 -- a line that would stop again, and the front doors' lines (S371) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# v0.9.244 (Fix Slate 19; ruling R23, Jeff at S371, and the slate's leans,
# "All yours including the ruling."). Ruling R22 says a remedy never leads
# to another stop; the S371 audit ran every line the package's messages
# offer, in the state the message was raised, and found lines that did.
# Render 1, ruling R23: a call naming a variable and no data frame, which
# also lacks an input it needs -- jrecode(Score9) has no map -- offered the
# call with the data frame named, jrecode(g9, Score9), which stopped again
# for the map; it now gets R22's one stop, saying what is missing. Render
# 2: with nothing lacking but the data frame, the two routes stay, and the
# default's route names the arguments after the variable, as these
# functions require with no data frame (it gave jrecode(Score9, "1=2"),
# which stopped on that rule); a name no data frame holds keeps the
# not-found stop. Render 3: under a default, the named-arguments stop
# checks the first name first, and gives the call with its map named.
# Render 4: what was given as the data is no data frame -- a quoted name,
# a value that names no variable, a single value, an expression -- and the
# lines leave it out. Render 5: a condition typed with one = and no data
# frame or default names the data frame. Render 6: the generic examples
# and the status notes' lines are set on community. Render 7: the recode
# family's map and labels stops, the example on a line of its own. Renders
# 1, 2 and 4 run in .ws_g9, a stand-in for a console session whose
# workspace holds one data frame. The assertion side is filter_check.R
# section AG.
.def_g9 <- getOption(".jst_default_data")
.conv_g9 <- getOption(".jst_options_missing_convention")
options(.jst_default_data = NULL, .jst_options_missing_convention = "none")
g9 <- data.frame(Score9 = c(4, 7, 5, 8, 6, 9), Group9 = rep(1:2, 3),
                 Name9 = c("a", "b", "c", "d", "e", "f"))
.ws_g9 <- new.env(parent = baseenv())
.ws_g9$g9 <- g9
for (.f in c("jrecode", "jencode", "jrelabel", "jdeclare_missing", "jcorr",
             "jdesc", "jplot", "jcomplete"))
  assign(.f, get(.f), envir = .ws_g9)
rm(.f)

# Render 1: a variable named, the data frame not, and an input lacking.
caught(evalq(jrecode(Score9), .ws_g9))
caught(evalq(jrelabel(Score9), .ws_g9))
caught(evalq(jdeclare_missing(Score9), .ws_g9))
caught(evalq(jdeclare_missing(vars = "Score9", codes = -99), .ws_g9))
caught(evalq(jcorr(Score9, method = "spearman"), .ws_g9))
# Expected:
#   Caught: jrecode(): no data frame and no map were named.
#   Name a data frame, one of its variables and a map, for example:
#     community$OwnsHome01 <- jrecode(community, OwnsHome, map = "1=1; 2=0")
#   Caught: jrelabel(): no data frame and no labels were named.
#   Name a data frame, one of its variables and a label, for example:
#     community$Age <- jrelabel(community, Age, var.label = "Age in years")
#   Caught: jdeclare_missing(): no data frame and no codes were named.
#   Name a data frame, one or more of its variables and the codes, for example:
#     jdeclare_missing(community, Age, codes = -99, convention = "spss")
#   Caught: jdeclare_missing(): no data frame and no convention were named.
#   Name a data frame, one or more of its variables, the codes and a convention,
#   for example:
#     jdeclare_missing(community, Age, codes = -99, convention = "spss")
#   Caught: jcorr(): no data frame and no second variable were named.
#   Name a data frame and two or more of its variables, for example:
#     jcorr(community, Income, Age, WellbeingScore, method = "spearman")

# Render 2: nothing lacking but the data frame; then a name no frame holds.
caught(evalq(jrecode(Score9, "1=2; else=copy"), .ws_g9))
caught(evalq(jrelabel(Score9, "1=One"), .ws_g9))
caught(evalq(jrecode(Scorx), .ws_g9))
# Expected:
#   Caught: jrecode(): 'Score9' not found.
#   Did you mean to use it as a variable name?
#   If so, name the data frame first:
#     jrecode(g9, Score9, "1=2; else=copy")
#   Or set a default first, then run the call:
#     juse(g9)
#     jrecode(Score9, map = "1=2; else=copy")
#   Caught: jrelabel(): 'Score9' not found.
#   Did you mean to use it as a variable name?
#   If so, name the data frame first:
#     jrelabel(g9, Score9, "1=One")
#   Or set a default first, then run the call:
#     juse(g9)
#     jrelabel(Score9, labels = "1=One")
#   Caught: jrecode(): 'Scorx' not found.
#   Did you mean to use it as a variable name?
#   If so, name the data frame first:
#     jrecode(MyData, Scorx)
#   Or set a default first, then run the call:
#     juse(MyData)
#     jrecode(Scorx)

# Render 3: under a default.
juse(g9)
caught(jrecode(Score9, "1=2; else=copy"))
caught(jrecode(Score9, Group9, map = "1=2"))
caught(jencode(Nam9, Name9, map = "a=1"))
juse(NULL)
# Expected:
#   Default data frame set to: g9
#   Caught: jrecode(): when the data frame is omitted, every input after the
#   variable must be named.
#   Name the map:
#     jrecode(Score9, map = "1=2; else=copy")
#   Caught: jrecode(): when the data frame is omitted, every input after the
#   variable must be named.
#   Caught: jencode(): Nam9 was not found in the g9 data frame.
#   Check the spelling.
#   g9 is the juse() default -- if you meant a different data frame, name it
#   in the call.
#   Default data frame cleared.

# Render 4: no data frame given as the data.
.ws_g9$nofr <- 5
.ws_g9$mk9 <- function() g9
caught(evalq(jdesc("g9"), .ws_g9))
caught(evalq(jplot(1:3), .ws_g9))
caught(evalq(jplot(1:3, Score9), .ws_g9))
caught(evalq(jdesc(nofr, Score9), .ws_g9))
caught(evalq(jcomplete(mk9()), .ws_g9))
# Expected:
#   Caught: jdesc(): "g9" is in quotes, and no variables were named.
#   Name a data frame without quotes and one or more of its variables,
#   for example:
#     jdesc(community, Age, Income)
#   Caught: jplot(): 1:3 is not a data frame, and no variables were named.
#   Name a data frame and one or two of its variables, for example:
#     jplot(community, Age)
#   Caught: jplot(): 1:3 is not a data frame.
#   Name the data frame first:
#     jplot(g9, Score9)
#   Or set a default first, then run the call:
#     juse(g9)
#     jplot(Score9)
#   Caught: jdesc(): nofr is a single value, not a data frame.
#   Name the data frame first:
#     jdesc(g9, Score9)
#   Caught: jcomplete(): no variables specified.
#   Provide one or more variable names, for example:
#     jcomplete(community, Age, Income)

# Render 5: a condition typed with one =, no data frame and no default.
caught(jsubset((Group9 = 1) & (Score9 < 6)))
# Expected:
#   Caught: jsubset(): (Group9 = 1) & (Score9 < 6) uses a single =, which does
#   not test equality in R.
#   Use == (two equals signs), and name the data frame:
#     jsubset(g9, (Group9 == 1) & (Score9 < 6))

# Render 6: the generic examples, and the status notes with nothing set.
caught(jsubset(g9, Score9 + 1))
caught(jsubset(g9, Score9 < 6 & AND))
jsubset(g9, on)
jcomplete(g9, on)
# Expected:
#   Caught: jsubset(): Score9 + 1 is numeric, not one TRUE or FALSE for
#   every case.
#   Compare a variable to a value, for example:
#     jsubset(community, Age < 40)
#   Caught: jsubset(): Score9 < 6 & AND uses AND, which R does not recognize.
#   Use & (single ampersand):
#     jsubset(community, Age < 40 & Volunteer == 1)
#   No jsubset set for g9.
#   To set one, give a condition, for example:
#     jsubset(community, Age < 40)
#   No jcomplete filter set for g9.
#   To set one, name its variables, for example:
#     jcomplete(community, Age, Income)

# Render 7: the map and the labels.
caught(jrecode(g9, Score9))
caught(jrecode(g9, Score9, map = 1))
caught(jencode(g9, Name9, map = 2))
caught(jrecode(g9, Score9, map = "1=2; else=copy", labels = 1))
caught(jrelabel(g9, Score9, labels = 1))
caught(jdeclare_missing(g9, Score9, codes = -99, labels = 1,
                        convention = "spss"))
# Expected:
#   Caught: jrecode(): no map specified.
#   Provide a map in quotes, for example:
#     community$OwnsHome01 <- jrecode(community, OwnsHome, map = "1=1; 2=0")
#   Caught: jrecode(): the map must be one quoted string, for example:
#     map = "1=1; 2=0"
#   Caught: jencode(): the map must be one quoted string, for example:
#     map = "Bail=1; Parole=2"
#   Caught: jrecode(): the labels must be one quoted string, for example:
#     labels = "1=Male; 0=Female"
#   Caught: jrelabel(): the labels must be one quoted string, for example:
#     labels = "1=Yes; 0=No"
#   Caught: jdeclare_missing(): the labels must be one quoted string,
#   for example:
#     labels = "-99=Refused; -98=Don't know"
options(.jst_default_data = .def_g9, .jst_options_missing_convention = .conv_g9)
rm(.def_g9, .conv_g9, .ws_g9, g9)

# Things to look at:
#   - Render 1, ruling R23: each had given the not-found stop and its two
#     routes, jrecode(g9, Score9) and juse(g9) with jrecode(Score9), and
#     either, run, stopped again for the map (jdeclare_missing(vars = ...,
#     codes = -99) for a convention; jcorr() for a second variable). The lead
#     now says what is missing beside the data frame -- "no map", "no
#     labels", "no codes", "no convention", "no second variable" -- and the
#     example is the function's own, on community, as R22's stop gives it
#     (G6 Render 3, G8 Render 1), jcorr()'s keeping method = (AG06, AG07).
#   - jrelabel() asks for "a label": it takes labels = or var.label =, and
#     the example gives a variable label. Does "and a label" read right
#     beside "no labels were named"?
#   - jdeclare_missing() given codes is asked for a convention only when no
#     session convention is set and the variable declares nothing yet:
#     under a convention, or on a variable already declaring missing values,
#     it lacks only the data frame and keeps the two routes (AG07's
#     controls).
#   - Render 2: the first route keeps the call as typed with g9 put first --
#     the map third, unnamed, where jrecode() takes it; the default's route
#     now names map = and labels =, which jrecode() and jrelabel() require
#     once the data frame is left out: it gave jrecode(Score9, "1=2;
#     else=copy"), which stopped on that rule (AG02, AG03). Scorx, which no
#     data frame holds, keeps "not found" and both routes, MyData named: the
#     name may be a data frame's typed wrong, which R22's lead would not say
#     (AG08).
#   - "Did you mean to use it as a variable name?" is now a line of its
#     own, one sentence a line, here and in G5, G6 and H4, re-pinned there
#     (X03, Y24).
#   - Render 3: the named-arguments stop had a line inline after "Use",
#     and built it by position: jrecode(Score9, Group9, map = "1=2") was
#     offered jrecode(Score9, map = Group9), its map dropped, and
#     jencode(Nam9, Name9, map = "a=1") jencode(Nam9, map = Name9). Now the
#     first name is checked first, so Nam9 gets the not-found sentence with
#     the default hint; a variable of the default with ONE unnamed argument
#     after it gets the call with that argument named, on a line of its
#     own; with two unnamed, the sentence alone, since which is the map
#     cannot be told (AG04, AG05). RE-PINNED S392 (the (S282) item, voice
#     Rule B): "when the data frame is omitted, every input after the
#     variable must be named." where it said "when the data argument is
#     omitted, all subsequent arguments must be named."
#   - Render 4: "g9" in quotes with no variable had been offered jdesc(g9),
#     which stopped for want of variables; jplot(1:3) "needs a data frame"
#     and jplot(MyData, 1:3), the value taken for a variable; nofr, a single
#     value, "Score9 needs the data frame, not the single column nofr." and
#     jdesc(MyData, nofr, Score9); jcomplete(mk9()) mydata <- mk9() and
#     jcomplete(mydata), which stopped for want of variables. Each line now
#     leaves out what is not a data frame and names g9, the data frame
#     holding Score9, or gives the stop for what is missing (AG09-AG12).
#   - Render 5: with no default, the line names the data frame holding
#     Group9 and Score9 -- "and name the data frame" -- where it gave
#     jsubset((Group9 == 1) & (Score9 < 6)), which stopped for want of one;
#     MyData when two hold them, as E1 and G4 show; under a default, as
#     before (AG13).
#   - Render 6: the generic examples are set on community, never the
#     call's frame (S338), where they named no data frame and stopped with
#     no default; B1-B4, B6, B7 and I1 re-pinned the same way. The status
#     notes had given "Use jsubset(g9, expression) to set one." and
#     "Use jcomplete(g9, var1, var2, ...) to set one.", placeholders that do
#     not run (AG14, AG17).
#   - Render 7: jrecode() with no map had said the map "must be a single
#     quoted string", as if one had been given wrongly; it now says none was
#     given, with jrecode()'s own example. The quoted-string stops say "the
#     map" and "the labels" and give the example on a line of its own, where
#     each had "e.g." inline (jrelabel()'s without "labels ="). (AG15.)

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# G10 -- a data frame's name typed wrong (ruling R36; S391) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# v0.9.264 (ruling R36, Jeff at S391: "yes to your recommendation and the
# three conditions necessary"). The first name in a call matched nothing,
# and every variable typed after it was in one data frame: the not-found
# stop read the name as a variable, both its routes keeping that reading
# (MyData put in front; under the default's route the variable moved into
# labels =, map = or var.label =), and the five formula functions answered
# in R's own words, "object 'g1' not found", with no prefix. Now, when the
# name is no object and no variable of any data frame, exactly one data
# frame holds every variable typed after it, and its name is within two
# letters of what was typed -- and, Claude's at the build, not every letter
# changed -- the stop gives the call as typed with that data frame. Render
# 1, the data-first functions; Render 2, the formula functions, their other
# arguments kept; Render 3, a line that would stop again for want of an
# input gets ruling R23's stop; Render 4, what keeps R23's two routes, and
# the formula functions' stop with nothing to offer. Each runs in .ws_g10,
# a stand-in for a console session whose workspace holds one data frame,
# g10. The assertion side is filter_check.R section AM.
.def_g10 <- getOption(".jst_default_data")
options(.jst_default_data = NULL)
g10 <- data.frame(Score10 = c(4, 7, 5, 8, 6, 9), Group10 = rep(1:2, 3),
                  Name10 = c("a", "b", "a", "c", "b", "a"))
.ws_g10 <- new.env(parent = baseenv())
.ws_g10$g10 <- g10
for (.f in c("jdesc", "jfreq", "jrecode", "jencode", "jsubset", "jt", "jaov",
             "jcrosstab", "jlm"))
  assign(.f, get(.f), envir = .ws_g10)
rm(.f)

# Render 1: the data-first functions, the name one letter short.
caught(evalq(jdesc(g1, Score10), .ws_g10))
caught(evalq(jrecode(g1, Group10, map = "1=0; 2=1"), .ws_g10))
caught(evalq(jsubset(g1, Score10 > 5), .ws_g10))
# Expected:
#   Caught: jdesc(): 'g1' not found.
#   If you meant the data frame g10:
#     jdesc(g10, Score10)
#   Caught: jrecode(): 'g1' not found.
#   If you meant the data frame g10:
#     jrecode(g10, Group10, map = "1=0; 2=1")
#   Caught: jsubset(): 'g1' not found.
#   If you meant the data frame g10:
#     jsubset(g10, Score10 > 5)

# Render 2: the formula functions, where R had answered; the data = form,
# subset = and a name with a letter too many.
caught(evalq(jt(Score10 ~ Group10, g1), .ws_g10))
caught(evalq(jaov(Score10 ~ Group10, data = g1), .ws_g10))
caught(evalq(jlm(Score10 ~ Group10, gg10, subset = Score10 > 4), .ws_g10))
# Expected:
#   Caught: jt(): 'g1' not found.
#   If you meant the data frame g10:
#     jt(Score10 ~ Group10, g10)
#   Caught: jaov(): 'g1' not found.
#   If you meant the data frame g10:
#     jaov(Score10 ~ Group10, data = g10)
#   Caught: jlm(): 'gg10' not found.
#   If you meant the data frame g10:
#     jlm(Score10 ~ Group10, g10, subset = Score10 > 4)

# Render 3: the line offered would stop again, for want of its map.
caught(evalq(jrecode(g1, Group10), .ws_g10))
# Expected:
#   Caught: jrecode(): 'g1' not found, and no map was named.
#   Name a data frame, one of its variables and a map, for example:
#     community$OwnsHome01 <- jrecode(community, OwnsHome, map = "1=1; 2=0")

# Render 4: R23's two routes stay -- a name three letters off; a variable no
# data frame holds -- and with nothing to offer the formula functions stop
# in the house voice.
caught(evalq(jdesc(abc, Score10), .ws_g10))
caught(evalq(jdesc(g1, Nope10), .ws_g10))
caught(evalq(jt(Score10 ~ Group10, zz), .ws_g10))
# Expected:
#   Caught: jdesc(): 'abc' not found.
#   Did you mean to use it as a variable name?
#   If so, name the data frame first:
#     jdesc(MyData, abc, Score10)
#   Or set a default first, then run the call:
#     juse(MyData)
#     jdesc(abc, Score10)
#   Caught: jdesc(): 'g1' not found.
#   Did you mean to use it as a variable name?
#   If so, name the data frame first:
#     jdesc(MyData, g1, Nope10)
#   Or set a default first, then run the call:
#     juse(MyData)
#     jdesc(g1, Nope10)
#   Caught: jt(): 'zz' not found.
options(.jst_default_data = .def_g10)
rm(.def_g10, .ws_g10, g10)

# Things to look at:
#   - Render 1: "'g1' not found." then "If you meant the data frame g10:"
#     and the call as typed, g10 in g1's place. Each had given "Did you
#     mean to use it as a variable name?" and the two routes, jdesc(MyData,
#     g1, Score10) and juse(MyData) with jdesc(g1, Score10). Each line runs
#     as printed (AM01, AM02).
#   - Render 2: the formula functions had printed R's own "Error: object
#     'g1' not found", no jt(): in front; now the same offer, data = and
#     subset = kept. The check comes after the formula's own refusals (the
#     dot, a term in quotes), so no line offered stops on them (AM03, AM06).
#   - Render 3: jrecode(g10, Group10) would stop again for its map, so
#     ruling R23's stop is given, its lead naming both: "'g1' not found, and
#     no map was named." (AM04).
#   - Render 4: abc is three letters from g10; Nope10 is in no data frame,
#     so no frame holds every variable named; zz has no letter of g10's.
#     Each keeps what it gave before -- the data-first stop's two routes,
#     and for the formula functions, now, "jt(): 'zz' not found." (AM05,
#     AM06). Is "If you meant the data frame g10:" the right lead, and does
#     the zz rule (no offer when every letter differs) match how you would
#     read a typo?

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# G11 -- an expression given as the data that cannot be evaluated (S392) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# v0.9.265 (the (S391) item; Jeff at S392: "Okay for all defaults."). An
# expression where the data frame goes -- g11[g11$Age11 > 40, ],
# subset(g11, Age11 > 30), head(g11) -- with the data frame's name typed
# wrong inside it: the five formula functions printed R's own "Error:
# object 'g1' not found", no prefix, and the data-first functions read the
# expression as a variable, offering jdesc(MyData, <the expression>) with
# the call's other inputs dropped. Now a name found nowhere is "not found",
# with ruling R36's offer -- the expression with the data frame in its
# place, every other input kept -- where R36's conditions hold and that
# expression gives a data frame (Render 1, the formula functions; Render 2,
# the data-first functions, jsave() and jcopy()). jsubset() and the
# registration verbs, which take no expression as their data, and two names
# found nowhere get "not found" alone (Render 3). A column the data frame
# lacks gets the not-found sentence -- where the expression stops, and
# where it gives no rows for want of the column -- and any other failure
# R's own words under "R reported:" (Render 4). Each runs in .ws_g11, a
# stand-in for a console session whose workspace holds one data frame,
# g11. The assertion side is filter_check.R section AN.
.def_g11 <- getOption(".jst_default_data")
options(.jst_default_data = NULL)
g11 <- data.frame(Score11 = c(4, 7, 5, 8, 6, 9, 5, 7),
                  Group11 = rep(1:2, 4),
                  Age11   = c(35, 52, 41, 60, 28, 47, 39, 55))
.ws_g11 <- new.env(parent = baseenv())
.ws_g11$g11 <- g11
for (.f in c("jdesc", "jfreq", "jsave", "jcopy", "jsubset", "jnumeric", "jt",
             "jaov", "jlm"))
  assign(.f, get(.f), envir = .ws_g11)
assign("head", utils::head, envir = .ws_g11)
rm(.f)

# Render 1: the formula functions, where R had answered; the data = form
# and subset = kept.
caught(evalq(jt(Score11 ~ Group11, g1[g1$Age11 > 40, ]), .ws_g11))
caught(evalq(jaov(Score11 ~ Group11, data = subset(g1, Age11 > 30)), .ws_g11))
caught(evalq(jlm(Score11 ~ Age11, head(g1), subset = Group11 == 1), .ws_g11))
# Expected:
#   Caught: jt(): 'g1' not found.
#   If you meant the data frame g11:
#     jt(Score11 ~ Group11, g11[g11$Age11 > 40, ])
#   Caught: jaov(): 'g1' not found.
#   If you meant the data frame g11:
#     jaov(Score11 ~ Group11, data = subset(g11, Age11 > 30))
#   Caught: jlm(): 'g1' not found.
#   If you meant the data frame g11:
#     jlm(Score11 ~ Age11, head(g11), subset = Group11 == 1)

# Render 2: the data-first functions, jsave() and jcopy(), their other
# inputs kept.
caught(evalq(jdesc(g1[g1$Age11 > 40, ], Score11), .ws_g11))
caught(evalq(jfreq(g1$Group11), .ws_g11))
caught(evalq(jsave(subset(g1, Age11 > 40), "older11.sav"), .ws_g11))
caught(evalq(jcopy(g1[g1$Age11 > 40, ], older11), .ws_g11))
# Expected:
#   Caught: jdesc(): 'g1' not found.
#   If you meant the data frame g11:
#     jdesc(g11[g11$Age11 > 40, ], Score11)
#   Caught: jfreq(): 'g1' not found.
#   If you meant the data frame g11:
#     jfreq(g11$Group11)
#   Caught: jsave(): 'g1' not found.
#   If you meant the data frame g11:
#     jsave(subset(g11, Age11 > 40), "older11.sav")
#   Caught: jcopy(): 'g1' not found.
#   If you meant the data frame g11:
#     jcopy(g11[g11$Age11 > 40, ], older11)

# Render 3: "not found" alone -- jsubset() and a registration verb, which
# take no expression as their data, and two names found nowhere, named
# together.
caught(evalq(jsubset(g1[g1$Age11 > 40, ], Score11 > 5), .ws_g11))
caught(evalq(jnumeric(g1[g1$Age11 > 40, ], Score11), .ws_g11))
caught(evalq(jt(Score11 ~ Group11, merge(aa, bb)), .ws_g11))
# Expected:
#   Caught: jsubset(): 'g1' not found.
#   Caught: jnumeric(): 'g1' not found.
#   Caught: jt(): 'aa' and 'bb' not found.

# Render 4: the data frame's name right, a column's wrong -- after $, and
# in subset()'s condition -- then an expression that fails for another
# reason (a condition on rows where the columns are picked).
caught(evalq(jt(Score11 ~ Group11, g11[g11$Agee11 > 40, ]), .ws_g11))
caught(evalq(jfreq(subset(g11, Agee11 > 40), Group11), .ws_g11))
caught(evalq(jfreq(g11[g11$Age11 > 40], Group11), .ws_g11))
# Expected:
#   Caught: jt(): Agee11 was not found in the g11 data frame.
#   Check the spelling.
#   Caught: jfreq(): Agee11 was not found in the g11 data frame.
#   Check the spelling.
#   Caught: jfreq(): g11[g11$Age11 > 40] could not be evaluated.
#   R reported:
#     undefined columns selected
options(.jst_default_data = .def_g11)
rm(.def_g11, .ws_g11, g11)

# Things to look at:
#   - Render 1: the formula functions had printed R's own "Error: object
#     'g1' not found", no jt(): in front. Now "'g1' not found." then "If
#     you meant the data frame g11:" and the call as typed, g11 in g1's
#     place inside the expression, data = and subset = kept (AN01).
#   - Render 2: jdesc() and jfreq() had read the expression as a variable
#     -- "... needs a data frame, and none was named or set as the
#     default." with jdesc(MyData, g1[g1$Age11 > 40, ]) and the default's
#     route; jsave() said "'subset(g1, Age11 > 40)' could not be
#     evaluated." and offered jsave(g11, "mydata.sav"), its file name
#     replaced; jcopy() gave R's own "object 'g1' not found". Now the same
#     offer as Render 1, jsave()'s file and jcopy()'s name kept (AN03).
#   - Render 3: jsubset() and jnumeric() refuse an expression as their
#     data, so a line offering one would stop again: "not found" alone.
#     merge(aa, bb) names two things found nowhere, named together (AN05).
#   - Render 4: Agee11 is a column g11 lacks: the not-found sentence the
#     variable lists give. After $ the expression does not stop -- a data
#     frame's $ gives NULL for a name it lacks, so g11[g11$Agee11 > 40, ]
#     has no rows -- and jt() had printed its title, then "the
#     g11[g11$Agee11 > 40, ] data frame has no rows, so there is nothing to
#     analyze." (AN09; jsave() saved an empty file). In subset() it stops,
#     and jfreq() had said the expression "names the g11 data frame" (AN06).
#     The last is no typo: g11[g11$Age11 > 40] picks COLUMNS by a condition
#     on rows, and R's own words are relayed under "R reported:" (AN07).
#     Does "could not be evaluated." read right over R's message?

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART H -- HOW A NAME IS READ: RULING R18'S NAMES SLATE (S356) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# v0.9.229. Ruling R18 (Jeff, S355): "Name a variable without quotes, after
# its data frame. jstats always reads the data frame's variable, never a
# separate object with the same name. Anything that is not a variable -- a
# format, a convention, a map, a file name -- goes in quotes." The five
# sections show the slate on the data-first functions; models_walk.R
# Section 23 and missing_convention_walk.R Section 67 show it on the
# formula functions and the recode family. The assertion side is
# filter_check.R section Y.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION H1 -- a c() of names, bare or quoted, in a variable list ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# A variable list takes a c() of names, as the tidyverse does; until v0.9.228
# jdesc(d, c(Age, Gender)) was "c(Age, Gender) was not found". A range and
# a helper are still not found, as decided. The three single-variable
# functions take a quoted name now (jrecode(d, "Gender", ...) was refused);
# a c() of several there stops, naming them.

jdesc(d, c(Age, "Gender"))
caught(jdesc(d, Age:Gender))
caught(jrecode(d, c(Age, Gender), map = "1=0"))

# Expected:
#   Descriptive Statistics
#
#   12 Cases in the 2 Variable Pool; 11 Complete on All
#
#   Warning: Gender seems categorical. Descriptive statistics may not
#   be meaningful.
#   Variable  Total  Non_missing  Min  Max   Mean     SD
#   --------  -----  -----------  ---  ---  ------  ------
#   Age         12        11       27   62  41.636  11.457
#   Gender      12        12        1    2   1.500   0.522
#
#   Caught: jdesc(): Age:Gender was not found in the d data frame.
#   Check the spelling.
#   Caught: jrecode(): only one variable goes after the data frame, and this
#   call gives Age and Gender.
#   Name one variable, and run the call once for each.

# Things to look at:
#   - Render 1: both variables described, Age then Gender, from a c() that
#     mixes a bare name and a quoted one;
#   - Render 2: the range keeps the not-found stop;
#   - Render 3: jrecode() names the two variables and says what to do.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION H2 -- a data frame's name in quotes ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# jdesc("d", Age) read the string as a single column ("Age needs the data
# frame, not the single column "d""); juse("d") said '"d" not found.' When
# the string names a data frame in the workspace, the call is given back
# without the quotes.

caught(jdesc("d", Age))
caught(juse("d"))
caught(jt(Age ~ Gender, "d"))

# Expected:
#   Caught: jdesc(): "d" is in quotes.
#   A data frame's name goes without them:
#     jdesc(d, Age)
#   Caught: juse(): "d" is in quotes.
#   A data frame's name goes without them:
#     juse(d)
#   Caught: jt(): "d" is in quotes.
#   A data frame's name goes without them:
#     jt(Age ~ Gender, d)

# Things to look at:
#   - the same two sentences in each, and the call as typed with the
#     quotes gone -- the formula function's too, which said "(passed as a
#     character string)".

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION H3 -- the vector path: a workspace object a data frame shares a name with ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# jdesc(zz_hv) with no data frame named and none set reads the workspace
# object zz_hv and said nothing, while the data frame zz_h holds a variable
# of that name (ruling R12's other half). Two lines under the title now say
# which object was read and give the call that reads the variable. A
# workspace object no frame shares a name with gets no line.

zz_h  <- data.frame(zz_hv = c(20, 30, 40, 50, NA, 60), zz_hw = c(1, 2, 1, 2, 1, 2))
zz_hv <- c(1.5, 2.5, 3.5, 4.5, 5.5, 6.5, 7.5)
zz_hx <- c(4, 5, 6)
jdesc(zz_hv)
jfreq(zz_hx)

# Expected:
#   Descriptive Statistics
#   zz_hv is a separate object in your workspace, not the variable in zz_h.
#   To analyze the variable, name the data frame:
#     jdesc(zz_h, zz_hv)
#
#   7 Cases in the 1 Variable Pool
#
#   Variable  Total  Non_missing  Min  Max   Mean    SD
#   --------  -----  -----------  ---  ---  -----  -----
#   zz_hv       7         7       1.5  7.5  4.500  2.160
#
#   Frequencies
#
#   3 Cases in the 1 Variable Pool
#
#   zz_hx
#
#          Freq  Total %  Valid %  Cum. %
#   -----  ----  -------  -------  ------
#   4        1     33.33   33.33    33.33
#   5        1     33.33   33.33    66.67
#   6        1     33.33   33.33   100.00
#
#   Total    3    100.00

# Things to look at:
#   - Render 1: the seven cases of the workspace vector are described, and
#     the two lines under the title name zz_h and give jdesc(zz_h, zz_hv);
#   - Render 2: no line for zz_hx, which no data frame holds.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION H4 -- the not-a-data-frame stops name the frame that has the variable ----
# NEEDS: H3
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# jplot(zz_hv) stops, as it did, but its lines name zz_h, the one data frame
# that has the variable, where they printed MyData; so does the vector
# path's refusal of a second variable. With no frame, or several, MyData
# stays.

caught(jplot(zz_hv))
caught(jdesc(zz_hv, zz_hw))
rm(zz_h, zz_hv, zz_hx)

# Expected:
#   Caught: jplot(): 'zz_hv' is not a data frame.
#   Did you mean to use it as a variable name?
#   If so, name the data frame first:
#     jplot(zz_h, zz_hv)
#   Or set a default first, then run the call:
#     juse(zz_h)
#     jplot(zz_hv)
#   Caught: jdesc(): zz_hw needs the data frame, not the single column zz_hv.
#   Name the data frame first:
#     jdesc(zz_h, zz_hv, zz_hw)

# Things to look at:
#   - Render 1: jplot(zz_h, zz_hv) and juse(zz_h), not MyData;
#   - Render 2: jdesc(zz_h, zz_hv, zz_hw), the frame that has both.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION H5 -- a bare word where a quoted value goes ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# jdesc(d, Age, variable.id = labels), joutput(full), joptions(spss),
# jload("f.rds", name = mydata): R looked the word up as an object ("object
# 'labels' not found"). Each gets jload()'s form -- the word, that it is not
# in quotes, what the argument takes, the call to run -- at every argument
# that takes a fixed word, and at the free-text slots. A positional word
# gets the sentence form; a named one names the argument.

caught(jdesc(d, Age, variable.id = labels))
caught(joutput(full))
caught(joptions(spss))
caught(jload("nofile.rds", name = mydata))

# Expected:
#   Caught: jdesc(): labels is not in quotes.
#   variable.id = takes a display mode in quotes:
#     jdesc(d, Age, variable.id = "labels")
#   Caught: joutput(): full is not in quotes.
#   A level or setting name goes in quotes:
#     joutput("full")
#   Caught: joptions(): spss is not in quotes.
#   A convention name goes in quotes:
#     joptions(missing.convention = "spss")
#   Caught: jload(): mydata is not in quotes.
#   name = takes a name in quotes:
#     jload("nofile.rds", name = "mydata")

# Things to look at:
#   - the word as typed, then what the argument takes, then the call as
#     typed with the word in quotes; joptions(spss) is given the named
#     form, since its first position is read several ways.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART I -- FIX SLATE 10 AND SCRIPTS SLATE B AT THE FILTERS (S359) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# v0.9.232. The filter shape check counts CASES, where it counted rows, and
# names the workspace object a result of the wrong length came from, as
# ruling R19's stop names one (the S357 item; Jeff, S358: "okay on your
# default") -- keeping its own fix line, since a vector of the wrong length
# cannot be added to the data frame. Sections B1-B7, D3, D4 and G1 are
# re-pinned for the same change. And the vector path's refusal of a
# condition naming another variable of the column's frame no longer
# depends on the workspace (the S342 dirty entry). The assertion side is
# filter_check.R section AA.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION I1 -- a wrong count from a workspace object, per call, bare, after jcomplete() ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# keep5 holds five values for d's twelve cases. Render 1 is per call;
# Render 2 the bare name, which is the object itself; Render 3 the same
# per-call condition after jcomplete() has cut d to the 11 cases with an
# Age, and Render 4 a literal of the wrong length, which has no object to
# name and keeps the plain form.

keep5 <- c(TRUE, FALSE, TRUE, TRUE, FALSE)
caught(jfreq(d, Gender, subset = keep5 == TRUE))
# Expected:
#   Frequencies
#   Caught: jfreq(): In subset = keep5 == TRUE, keep5 is not in the d data
#   frame; it is a separate object in your workspace.
#   It has 5 values for the 12 cases in the d data frame, not one TRUE or FALSE
#   for every case.
#   In your jfreq() call, compare a variable to a value, for example
#   subset = Age < 40.
caught(jsubset(d, keep5))
# Expected:
#   Caught: jsubset(): keep5 is not in the d data frame; it is a separate object
#   in your workspace.
#   It has 5 values for the 12 cases in the d data frame, not one TRUE or FALSE
#   for every case.
#   Build the filter from the data frame's own columns, for example:
#     jsubset(community, Age < 40)
jcomplete(d, Age)
caught(jdesc(d, Gender, subset = keep5 == TRUE))
# Expected:
#   Descriptive Statistics
#   Caught: jdesc(): In subset = keep5 == TRUE, keep5 is not in the d data
#   frame; it is a separate object in your workspace.
#   It has 5 values for the 11 cases left after filtering, not one TRUE or FALSE
#   for every case.
#   In your jdesc() call, compare a variable to a value, for example
#   subset = Age < 40.
jcomplete(d, NULL)
caught(jsubset(d, c(TRUE, FALSE)))
# Expected:
#   Caught: jsubset(): c(TRUE, FALSE) has 2 values for 12 cases, not one TRUE or
#   FALSE for every case.
#   Build the filter from the data frame's own columns, for example:
#     jsubset(community, Age < 40)
rm(keep5)

# Things to look at:
#   - Render 1: "In subset = keep5 == TRUE, keep5 is not in the d data
#     frame; it is a separate object in your workspace." then "It has 5
#     values for the 12 cases in the d data frame, not one TRUE or FALSE
#     for every case." and jfreq()'s own fix line;
#   - Render 2: "keep5 is not in ..." with no "In keep5," before it, and
#     the own-columns fix with jsubset(community, Age < 40) (S371: it was
#     jsubset(Age < 40), which stopped with no default);
#   - Render 3: "the 11 cases left after filtering";
#   - Render 4: "c(TRUE, FALSE) has 2 values for 12 cases" -- "cases", and
#     no object named.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION I2 -- the vector path: a workspace object named like a variable of the column's frame ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# d$Age is analyzed in its frame, d, where Keep01 is d's variable (ruling
# R18), so a condition naming Keep01 is refused, with the frame form as the
# fix. Until v0.9.232 a separate Keep01 in the workspace let the call
# through, and it was then analyzed on d's own Keep01 (the Scripts Slate B
# dirty entry). Render 1 is with no Keep01 in the workspace; Render 2 with
# one; the two are the same.

caught(jdesc(d$Age, subset = Keep01 == 1))
# Expected:
#   Caught: jdesc(): subset = Keep01 == 1 refers to Keep01, which the single
#   column d$Age does not contain.
#   Name the data frame first:
#     jdesc(d, Age, subset = Keep01 == 1)
Keep01 <- c(1, 0, 1)
caught(jdesc(d$Age, subset = Keep01 == 1))
# Expected:
#   Caught: jdesc(): subset = Keep01 == 1 refers to Keep01, which the single
#   column d$Age does not contain.
#   Name the data frame first:
#     jdesc(d, Age, subset = Keep01 == 1)
rm(Keep01)

# Things to look at:
#   - Render 1 and Render 2: the same three lines -- "refers to Keep01,
#     which the single column d$Age does not contain.", "Name the data
#     frame first:" and jdesc(d, Age, subset = Keep01 == 1).

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Observations
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# 2026-10-05 (S338): the last note of the S289 entry below is no longer
# true. Since v0.9.212 jfreq() prints its title before the filters run, as
# jdesc() does, so D2 shows "Frequencies" above its error as D1 and D3 show
# "Descriptive Statistics".
# 2026-09-12 (S289, first workstation walk): Section D5 was DEFECTIVE in
# the first delivered version -- D4 had left s at 11 rows but keep12 at 12
# values, so D5's first line was refused by the dry run instead of storing
# the filter, the section showed nothing of the eval-failure warning its
# heading promised, and the unwrapped error would have halted a source()
# run. The builder that fills these Expecteds had recorded the error text
# AS the Expected, and the self-check passed because it compares the file
# to a re-run of the same code: a section whose CODE is wrong verifies
# against itself. Three repairs: D5 rebuilds keep12 for the 11-row frame;
# the builder now HALTS on any uncaught error rather than recording one;
# and the file gained the S248 warn = 1 rule (conventions file, walk rule
# 4), which the first version had missed and which is why D5's warning now
# renders in place. Instance of instructions
# [A-CHECK-THAT-CANNOT-FAIL-PROVES-NOTHING].
# Also real behavior, not a defect: jfreq() raises the per-call shape error
# before printing its title (D2), while jdesc() prints "Descriptive
# Statistics" first (D1, D3) -- the title is emitted at a different point
# in the two functions.


# --- Restore and end marker --------------------------------------------------
# A real statement, deliberately last: stepping through with Ctrl+Enter, RStudio
# keeps expanding the selection when only comments remain, echoing the tail of
# the file back repeatedly. Ending on executable code gives it somewhere to
# stop.

options(.jst_options_message_width = .entry_message_width)
options(.jst_default_data = .entry_default_data)
options(warn = .entry_warn)
cat("\n--- End of filter_walk.R ---\n")
