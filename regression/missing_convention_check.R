# =============================================================================
# missing_convention_check.R -- the SAS-convention foundation, asserted
# =============================================================================
# TYPE:     assertion battery (PASS/FAIL; written for Claude's checking)
# LOCKS:    the SAS-convention foundation -- joptions, the resolver, column
#           detection, the census, and the tag/label helpers all accept "sas"
#           and distinguish it correctly, tagged-column convention is judged
#           by tag CASE while representation stays binary, and a mixed-case
#           tagged column classifies as ambiguous rather than guessing.
# ORIGIN:   S226 (foundation shipped in v0.9.123). Promoted into regression/
#           at S228 from the sandbox battery battery_new.R, rewritten to the
#           _template_check.R shape per the dev/tests boundary rule.
# S374 EDIT (v0.9.247, 2026-10-19): Fix Slate 21. N86m now makes
#           x86.RData before asking for it, since jload() looks for an
#           .RData file first; N86m2 NEW: one that does not exist gets the
#           file-not-found stop, bare and with a folder, and the line for one
#           that exists runs; N86m3 NEW: one in the data.dir folder is named
#           by its path there (relative, so a temp path cannot wrap it,
#           N88s). N87bb-N87bd NEW (the S373 item): the load scan's line on
#           a numeric variable names the codes it already declares and runs;
#           the placeholder line keeps a declared code's label; with no room
#           left, the fact and the way out. N95j2 NEW (the S372 item): when
#           both notes print, jrecode()'s second declare pair names the
#           first's code; N95j3 the control. 900 -> 907.
#           FIRST WORKSTATION RUNS (S374): N86m2 red twice on Windows, the
#           check's fault: normalizePath() completes a missing file's path
#           there, and the long path then wraps onto a line of its own after
#           "found:". The check now reads the message flattened.
#           MUTATION MAP (Fix Slate 21's twenty-three one-change mutants,
#           run detached, each against the battery that owns its surface;
#           all red): the .RData existence check removed N86m2 N86m3; the
#           data.dir path dropped N86m3; jrecode()'s first-note codes not
#           carried N95j2; the scan's declared codes left out N87bb N87bc;
#           the no-room sentence removed N87bd. The others are in the
#           models_check.R, filter_check.R, cps_check.R, format_check.R and
#           import_check.R entries. Sandbox: plain, under the RStudio
#           stand-in, each with a Windows-length temp path, interactive,
#           and entered dirty -- 3016 every way.
#           LAST VERIFIED: v0.9.247, 2026-10-19 (S374) -- 907/907 on the
#           WORKSTATION through receive_all() ("ALL BATTERIES GREEN (10 run,
#           3016 checks)"; R CMD check 0 errors, 0 warnings, 0 notes),
#           matching the sandbox.
# S373 EDIT (v0.9.246, 2026-10-18): NEW N96 section, forty checks
#           (N96a-an), Slate E5: declared missing values on text. Ruling
#           R26: jdeclare_missing() declares quoted values on a text
#           variable SPSS-style under every setting and with none selected,
#           with no menu, and a note under a stata or a sas setting
#           (N96a-c); convention = "stata" or "sas" and a range refused,
#           each with the call without it (N96d e); numbers refused with
#           the call quoted (lean 1; N96f-h); exact matching, and a note
#           naming the values that differ only in letter case or outer
#           spaces, with counts (lean 2; N96j); labels both ways, a value
#           holding = or ; quoted (lean 3; N96k); a value typed without its
#           quotes given ruling R18's pointer (a rider, from the reflex
#           probe; N96m). Ruling R27: codes = "" declares every blank cell
#           -- the masks, jfreq()'s <blank> row, the Case Processing detail,
#           jconvert(to = "baseR"), preserve.declarations = FALSE, a .sav
#           round trip, jsave()'s CSV note and the drop notice (N96n q-u ac
#           ad). Ruling R28: the five new words (N96v). The S372 items:
#           jsave() to .sav refuses a declared text value over 8 bytes
#           before writing (N96w x); jload()'s scan reports a text variable
#           again, its line quoted, no menu (N96y-aa; a CSV file in
#           import_check.R W); jconvert()'s Pattern A reports one again
#           under "spss" and "baseR" (N95e re-pinned) and still not under
#           "stata" or "sas" (N96ab); the full level's equivalent call gone
#           (Jeff: "Ok to your lean."; N81am and N95o re-pinned). SECOND
#           DELIVERY, from Jeff's walk of Section 72 ("why not just treat
#           this just like we would another suspected UDM?"; "Okay on all
#           three."): the note on a value differing from a declared one only
#           in case or outer spaces gives the line that declares it with the
#           declared values, the new value taking the label of the one it
#           matches, or past three values offers jencode() (N96a and N96j
#           re-pinned; N96ae-ah); the load scan reports such a value beside a
#           variable's declared values as suspected, and its line on a text
#           variable names the declared values too, where a line naming the
#           new ones alone dropped them (N96ai-al; checking found it);
#           .jst_text_value_rule() (N96am). One builder,
#           .jst_text_declare_args(). Every offered line RUN, each in an
#           environment of its own. NINE HUNDRED checks. On
#           the 0.9.245 master: nineteen red (N81am, N95e, N95o, N96a-p), and
#           the battery stops at N96q's fixture, a blank declared on text,
#           which the old jdeclare_missing() refuses. On the first delivery
#           twelve red: N96a, N96j and N96ae-an.
#           MUTATION MAP (S373; forty-four one-change mutants of the new
#           code, run detached, through this battery and whichever of
#           jencode_check.R, cps_check.R and import_check.R a mutant
#           reaches, all red): the blank mask without blanks N96q-u ac (cps
#           N58d3); the <blank> row label N96n r s u ad; "not stated" out
#           of the word list N96v y (jencode N27, import W01 W02);
#           "unknown" out N96v y aa; the text route only when a code is
#           text N96e-g l (jencode N43e); the convention refusal N96d f;
#           the range refusal N96e; the numbers line unquoted N96f (jencode
#           N43e); the near-miss note N96a j; the setting note N96c; a
#           fourth value kept N96g l; a value twice kept N96l; a label
#           naming no code kept N96g l; the bare pointer N96m, checked
#           ahead of the codes N96m; the mixed refusal naming every
#           variable N96i; the numeric path's old message N96h; the 8-byte
#           test at 8 N96x, by characters N96x, the refusal off N96w x; the
#           scan skipping text N96y-aa (import W01 W02), by label N96y z,
#           declared values not excluded N96y, its line unquoted N96y-aa
#           (import W01 W02), no cap at three N96aa; Pattern A's text under
#           every target N86ax N96ab, under none N95e, unquoted N86ay N95e;
#           the labels not merged N96b f k n; the blank keyword N96k, a
#           quoted value at a rule's start N96k; exact matching kept in
#           preserve.declarations = FALSE N96t, jconvert(to = "baseR")
#           N96t, the CPS rows N96s, jfreq()'s Missing count N96r (cps
#           N58d3), the masking pass N96r s (cps N58d3); the CSV note's
#           <blank> N96ac; the minimal drop notice's N96ad; the equivalent
#           call back N81am N95o; the shape checks after the numbers
#           refusal N96f g; the quoted line past three codes N96h; and, in
#           the other batteries, jfreq()'s footnote offering
#           jdeclare_missing() for a factor (cps N58d2), the old one-line
#           footnote (cps N58a b d), jencode()'s declared blank (jencode
#           N51a-c). No survivor.
#           SECOND ROUND (twenty-four one-change mutants of the second
#           delivery's code, run detached, all red): the new value's
#           twin label off N96ae af ai-ak; the declared values left out of
#           the line N96a j ae-al; a mixed set named N96af al, its labels =
#           dropped N96af al; the note's line off N96a j ae af ah, given for
#           an expression too N96ah, without modify = TRUE N96a j ae af ah,
#           its name always in backticks N96a j ae af ah; the cap sentence
#           off N96ag; the scan's near misses unreported N96ai-ak; room
#           counted without the declared values N96ak; the old line naming
#           the new values alone N96ai-al; "with the ones it already
#           declares" dropped N96ai ak; the three-declared sentence silent
#           N96ak; the placeholder line off N96al (import W01 W02); "most
#           frequent" and "two most frequent" swapped N96ak;
#           .jst_text_value_rule()'s blank, semicolon, outer-space and word
#           cases N96am. FOUR SURVIVED the first pass, read before recorded,
#           each given a check and run again, red: the builder's own cap
#           (both callers stop short of four first, so only the builder
#           called alone reaches it) N96am; placeholders given to every new
#           value, the twin matched without trimming and a value's own label
#           ignored N96an.
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): run_all.R
#           2993 across ten, plain and under the RStudio-handler stand-in,
#           each again with a 59-character temp path, once with
#           interactive() TRUE: all green; R CMD check --no-manual on the
#           built package, Status OK. Entered dirty as at S372, with
#           objects also named M, R, Marital, Src, W01, W03, held, UNKNOWN,
#           a, b, p, cl, ok, cv, to, Decl, v96, s96, t96r, b18, w72, r17d,
#           tx, u96, u96b, u96c, u96d, lst and d, plain and under the
#           stand-in: green, nothing added,
#           nothing lost, no value changed; the first dirty run found N96r
#           reading jfreq()'s table with the color option on, now read with
#           the color stripped.
#           LAST VERIFIED: v0.9.246, 2026-10-18 (S373) -- 900/900 on the
#           WORKSTATION through receive_all() ("ALL BATTERIES GREEN (10 run, 2993 checks)"; R CMD
#           check 0 errors, 0 warnings, 0 notes), matching the sandbox;
#           GitHub 9d5825f (package).
# S372 EDIT (v0.9.245, 2026-10-18): NEW N95 section, sixteen checks
#           (N95a-p), Fix Slate 20: the missing-value lines from the S371
#           remedy-line audit, each a line a message offered that stopped
#           when run. (A) an unlabelled Stata-style marker made plain NA by
#           jsave(preserve.declarations = FALSE), jload() likewise and
#           jconvert(to = "baseR") (.jst_zap_tags(); the .sav and .xpt
#           refusals' line repeated them); (B) a text variable out of
#           jconvert()'s Pattern A report under every target; (C) the
#           release note's pair under every convention state, and a stray
#           on a column declaring codes of its own; (E) jrecode()'s D1 note
#           with no token where the map leaves the recoded variable no
#           marker; (F) jdeclare_missing()'s mixed codes: haven::tagged_na()
#           in the split, sign-off 3 where no target carries a marker, its
#           line naming every code the variable declares, a code given
#           twice named once, and the full level's equivalent call. (D),
#           jencode()'s note, is jencode_check.R N44k. Every offered line
#           RUN. RE-PINNED: N72x (the declare pair, no token map), N81am
#           (haven::), N86ay (reversed: no Pattern A report for a text
#           variable under to = "spss" either). EIGHT HUNDRED AND SIXTY
#           checks. On the 0.9.244 master 18 red: the three re-pins and
#           fifteen of N95 (N95d, N95i and N95j, controls, pass).
#           MUTATION MAP (S372; seventeen one-change mutants, through this
#           battery and jencode_check.R, all red): the plain-double branch
#           of .jst_zap_tags() N95a b c; .jst_handle_udms() back to
#           zap_missing() N95a b; jconvert()'s back N95c; the S351 text rule
#           back N86ay N95e; the release note's convention = "spss" dropped
#           N95f; its own codes dropped N95g; jencode()'s menu dropped
#           (jencode_check.R N44c c2 d k, N47i); the D1 token route kept
#           N72x N95h; sign-off 4 everywhere N95l m; the split's haven::
#           N95k; the equivalent call's haven:: N81am N95o; the variable's
#           other codes dropped N95l n; every code named, labels or not
#           N95n; the label lead N95l; the closing sentence N95l; a code
#           given twice kept twice N95p; "Then, to keep" (jencode_check.R
#           N44c c2 d, N47i). The pipeline mask's zap was changed and put
#           back in the build: nothing can tell it apart (a plain double's
#           tagged cells are NA to every count, and with no labels
#           as_factor() has nothing to revive).
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): run_all.R
#           2944 across ten, plain and under the RStudio-handler stand-in,
#           each again with a 56-character temp path, once with
#           interactive() TRUE: all green; R CMD check --no-manual on the
#           built package, Status OK. Entered dirty (joutput("full") with
#           diagnostics, width 90, a stata convention, the color option, a
#           juse() default, and objects named Score, Group, Age, Gender,
#           Name, d, e, s, x, X, Q, S, N, B, V, rn, dsp, m, r, Mode, Rating,
#           Income, Education, MS, M1, e44, ld86, g), plain and under the
#           stand-in: green, nothing added, nothing lost, no value changed;
#           the first dirty run found N95 leaving the load narrative's
#           shown-once option set, now put back.
#           LAST VERIFIED: v0.9.245, 2026-10-18 (S372) -- 860/860 on the
#           WORKSTATION through receive_all() ("ALL BATTERIES GREEN (10 run, 2944 checks)"; R CMD
#           check 0 errors, 0 warnings, 0 notes), matching the sandbox;
#           GitHub 03a9ff8 (package).
# S370 EDIT (v0.9.243, 2026-10-18): N81ai AND N81aj RE-PINNED for Fix
#           Slate 18: jdeclare_missing() given a data frame and no variables
#           gives a line on community on a line of its own, "for example:
#           jdeclare_missing(community, Age, codes = -99, convention =
#           "spss")", where its example sat inside the sentence and named
#           MyData beside invented variables; N81aj also asserts the call's
#           data frame is never the example's. The names() lines as they
#           were. No check added; EIGHT HUNDRED AND FORTY-FOUR checks. The
#           new checks are filter_check.R section AF (AF07 pins the stop
#           whole). Found by the sandbox's first full run of the build: a
#           grep for the old stop's first words had missed these two, which
#           pin its example.
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): run_all.R
#           2910 across ten, plain and under the RStudio-handler stand-in,
#           each again with a 38-character temp path, once with
#           interactive() TRUE: all green; R CMD check --no-manual on the
#           built package, Status OK. Entered dirty (joutput("full") with
#           diagnostics, width 90, a stata convention, the color option, a
#           juse() default, and objects named Score, Group, Age, Gender,
#           Name, d, e, s, x, d1, ab1, ad9, g6copy, Nope, h7, af1, g8,
#           OwnsHome, Region, zzdirty), plain and under the stand-in: green,
#           nothing added, nothing lost, no value changed.
#           LAST VERIFIED: v0.9.243, 2026-10-18 (S370) -- 844/844 on the
#           WORKSTATION through receive_all() ("ALL BATTERIES GREEN (10 run,
#           2910 checks)"; R CMD check 0 errors, 0 warnings, 0 notes),
#           matching the sandbox; GitHub 127e63b (package).
# S369 EDIT (v0.9.241, 2026-10-17): N86f, N86bg AND N92i RE-PINNED for
#           Fix Slate 16: jload("") and jload() given a data frame as an
#           expression say "Provide a filename, for example:" and give the
#           call on a line of its own, where the example sat after "e.g." on
#           the sentence's line; jcorr() and jalpha() short of two variables
#           give a line to run under "Provide two or more variable names
#           (item names), for example:". No check added; EIGHT HUNDRED AND
#           FORTY-FOUR checks. The new checks are filter_check.R sections AC
#           and AD. Sandbox: the five ways and entered dirty, plain and under
#           the stand-in, green; N86f, N86bg and N92i red on v0.9.240 and on
#           the mutants that put each old stop back.
#           LAST VERIFIED: v0.9.241, 2026-10-18 (S369) -- 844/844 on the
#           WORKSTATION through receive_all() ("ALL BATTERIES GREEN (10 run,
#           2887 checks)"; R CMD check 0 errors, 0 warnings, 0 notes),
#           matching the sandbox. Unchanged by v0.9.242's Fix Slate 17.
# S368 EDIT (v0.9.240, 2026-10-17): N86i RE-PINNED for Fix Slate 15:
#           jsave() given a vector says "Provide a data frame, for example:"
#           and gives the call on a line of its own, where the example sat
#           after "e.g." on the line of the sentence before it; MyData here,
#           where the workspace holds many data frames. No check added;
#           EIGHT HUNDRED AND FORTY-FOUR checks. The new checks are
#           import_check.R section V (the one-frame case V03) and
#           filter_check.R section AB.
#           LAST VERIFIED: v0.9.240, 2026-10-17 (S368) -- 844/844 on the
#           WORKSTATION through receive_all() ("ALL BATTERIES GREEN (10 run,
#           2871 checks)"; R CMD check 0 errors, 0 warnings, 0 notes),
#           matching the sandbox (the five ways and entered dirty, plain
#           and under the stand-in; N86i red on the example put back on the
#           sentence's line, run as a mutant); GitHub d62f372 (package).
# S367 EDIT (v0.9.239, 2026-10-17): N86g RE-PINNED for Fix Slate 14:
#           jsave() given a file name alone with no default set offers both
#           routes -- the data frame named first, or a default set and the
#           call run again -- where it had offered the first alone; MyData
#           in both lines here, where the workspace holds many data frames.
#           No check added; EIGHT HUNDRED AND FORTY-FOUR checks. The new
#           checks are import_check.R section U (the one-frame case U08).
#           LAST VERIFIED: v0.9.239, 2026-10-17 (S367) -- 844/844 on the
#           WORKSTATION through receive_all() ("ALL BATTERIES GREEN (10 run,
#           2853 checks)"; R CMD check 0 errors, 0 warnings, 0 notes),
#           matching the sandbox (the five ways and entered dirty, plain
#           and under the stand-in; N86g red on v0.9.238's one-route stop,
#           run as a mutant); GitHub 6e35be6 (package).
# S366 EDIT (v0.9.238, 2026-10-17): N86j RE-PINNED for Fix Slate 13: the
#           stop for a file name starting with a digit offers the name the
#           import cleaner gives, X2024zz86, where it had stripped the
#           digits to zz86; the check now pins the offered line, then runs
#           it. No check added; EIGHT HUNDRED AND FORTY-FOUR checks. The
#           new checks are import_check.R section T.
#           LAST VERIFIED: v0.9.238, 2026-10-17 (S366) -- 844/844 on the
#           WORKSTATION through receive_all() ("ALL BATTERIES GREEN (10 run,
#           2841 checks)"; R CMD check 0 errors, 0 warnings, 0 notes),
#           matching the sandbox (the five ways and entered dirty, plain
#           and under the stand-in; N86j red on v0.9.237); GitHub 9ab5efa
#           (package).
# S362 EDIT (v0.9.235, 2026-10-16): N86w RE-PINNED for ruling R9: the CSV
#           file whose quoted header is "a,b" now loads with the variable
#           named a_b, its header the label, where read.csv() had made it
#           a.b; the check reads the name, the label, and the values
#           through as.vector(), the label being on them. No check added;
#           EIGHT HUNDRED AND FORTY-FOUR checks. The import surface's own
#           battery is the new import_check.R.
#           LAST VERIFIED: v0.9.236, 2026-10-17 (S362) -- 844/844 on the
#           WORKSTATION through receive_all() ("ALL BATTERIES GREEN (10 run,
#           2800 checks)"; R CMD check 0 errors, 0 warnings, 0 notes), and
#           on v0.9.235 (2794 across ten), matching the sandbox; GitHub
#           b3e9e2b (package).
# S361 EDIT (v0.9.234, 2026-10-16): NEW N94 section, thirty-six checks
#           (N94a-N94aj), Capability Slate C1's six smaller items where they
#           speak in this battery's surfaces: jconvert()'s return-trip note
#           SPSS to Stata, its prediction held to the trip back run (A); the
#           load scan's convention-matched category, the setting read, the
#           three categories' order, headings and legends, the hidden-row
#           count, the offered lines run (B); jsave(preserve.declarations =
#           FALSE) ahead of the .sav/.dta/.xpt pre-flight -- the refusals'
#           second remedy at both tiers, the saves read back, the note's two
#           forms, the type check still stopping, the offered line run (C);
#           jload() reading the example files by name, package = TRUE, the
#           shadow notes, quiet (D); the T/F advisory note (E). RE-PINNED:
#           N82c (the scan's heading), N86ah N86aj N86ak N86al N86am (each
#           refusal now ends on the save; the lines run are the conversion
#           route alone, .cut86()), N87av N87ax (one more block, its line
#           naming the file as typed, .pdl87()). EIGHT HUNDRED AND
#           FORTY-FOUR checks.
#           MUTATION MAP (40 mutants with format_check.R's, all red): the
#           note's refused case N94h; its gate N94c N94e N94g N94i; the
#           codes' order N94a N94d; several variables N94e; the setting's
#           hits N94j N94l N94m N94p N94q; the category N82c N94j; the
#           heading N94aj; the legends N94j N94l N94m; the hidden count
#           N94p; the placeholder line N94q; the codes read from the setting
#           N94m; the marker count N94u-w; the note's gate N94u-w, its zero
#           form N94w; overwrite riding N94y; the .xpt route N94s N94t; the
#           .dta and .sav second remedies N86ah N86ak N86al N94t; the
#           fallback N94aa N94af; by name alone N94ab; the shadow notes
#           N94ac N94ad; package = TRUE by extension N94ac N94ae; "Reading
#           from" N94aa-ac, under quiet N94af; the T/F note's level N94ag,
#           quiet N94ai, its blank line N94ah; the not-found list N94ae.
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): run_all.R
#           2710 across nine, plain and under the RStudio-handler stand-in,
#           each again with a 35-character temp path (N94u and N94w read
#           the Saved line flattened: a long path wraps it); entered dirty,
#           plain and under the stand-in, both object sets: green, every
#           changed object put back and named.
#           LAST VERIFIED: v0.9.234, 2026-10-16 (S361) -- 844/844 on the
#           WORKSTATION through receive_all() ("ALL BATTERIES GREEN (9 run,
#           2710 checks)"; R CMD check 0 errors, 0 warnings, 0 notes),
#           matching the sandbox; GitHub 88a372e (package).
# S360 EDIT (v0.9.233, 2026-10-16): N54j takes jdeclare_missing()'s call
#           through printed() (Fix Slate 11's rider, the S359 item): its
#           note -- "jdeclare_missing made no change to V. Its markers are
#           already missing values, so a bare marker has nothing to name."
#           -- is printed output, which suppressMessages() let through onto
#           every run's log between N54i and N54j; its working object in
#           local(). No check added; EIGHT HUNDRED AND EIGHT checks.
#           Sandbox: run_all.R 2661 across nine, four ways as at S359, the
#           note gone from every log; entered dirty as at S359: green, every
#           object a run changed put back and named.
#           LAST VERIFIED: v0.9.233, 2026-10-16 (S360) -- 808/808 on the
#           WORKSTATION through receive_all() ("ALL BATTERIES GREEN (9 run,
#           2661 checks)"; R CMD check 0 errors, 0 warnings, 0 notes),
#           matching the sandbox; GitHub cfbf813 (package).
# S359 EDIT (v0.9.232, 2026-10-16): NEW N93 section, ten checks
#           (N93a-N93j), Fix Slate 10's jsave() note for Excel and CSV,
#           raised by Jeff on the walk of missing_convention_walk.R Section
#           30: the labels line only when a variable carries a label (his
#           lean, okayed S357), the metadata line only when one declares
#           missing values, no note for a frame with neither; the variables
#           whose cells hold a declared code named with the codes held, a
#           code no cell holds left out, more than three counted; the call
#           to run with the data's name and the path just written, "mydata
#           <- ..." first for an expression, each run; a declared string in
#           quotes. The offered call is read through .r5_calls(): a long
#           temporary path lays it out over three lines. RE-PINNED: N86av,
#           N86aw and N92j (the note's new sentences). N88s counts a
#           laid-out call's line over the width only when it is not a single
#           piece (ruling R5 keeps a quoted path whole): the first run with a
#           35-character temp path counted the paths in N86's offered jsave()
#           lines, and N93's checks read the Saved line flattened. GUARD 5 (the S345 item, Scripts Slate B): the
#           values of the workspace's objects on entry, put back at the foot
#           when a run changed them, and named ("Put back as they were on
#           entry: ..."), before guard 2's clean-up on a green run and
#           before the stop on a red one.
#           EIGHT HUNDRED AND EIGHT checks.
#           MUTATION MAP: the labels line on every frame N93a N93i; the old
#           "jsave(...)" pointer N93c N93e N93f; codes no cell holds named
#           N86av N86aw N92j N93c N93d N93g N93j.
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
#           LAST VERIFIED: v0.9.232, 2026-10-16 (S359) -- 808/808 on the
#           WORKSTATION through receive_all() ("ALL BATTERIES GREEN (9 run,
#           2646 checks)"; R CMD check 0 errors, 0 warnings, 0 notes),
#           matching the sandbox; GitHub 6cf15d7 (package).
# S357 EDIT (v0.9.230, 2026-10-16): NEW N92 section, thirteen checks
#           (N92a-N92m), Fix Slate W2's load, save and jai() wording: the
#           mixed-frame note opening on the data frame (Rule T); Case 4's
#           note agreeing with its count; "R format" in both menus, the
#           Loaded and Saved lines and .jst_format_label(); the shipped
#           dataset's Loaded line without its period; jai()'s declined
#           writes, run on the real writers with interactive() and the
#           question stubbed (create keeps the folder line, replace says
#           only "Nothing was written."); SKILL.md's paragraph, the
#           standard paragraph's words set to the body's width, version
#           3.8; the .RData redirect in one voice typed and bare, x.RData
#           found on a case-sensitive file system; jcorr() and jalpha()'s
#           minimum one sentence a line; jsave()'s CSV note in each branch
#           ("missing values", the blanked count in number); and
#           jdeclare_missing() given a marker for a variable with none
#           (the family as missing values: a governing convention decides,
#           Decision 13, else the case typed). RE-PINNED: N23a (the
#           refusal reworded; its wrap-stable atoms moved), N82l (the
#           blanked count), N86m (the redirect's voice), N86av (the CSV
#           rider's "missing values"), N86bb-be (the Loaded line's "R
#           format" and its period). SEVEN HUNDRED AND NINETY-EIGHT checks.
#           MUTATION MAP: twenty-three one-change mutants of the 0.9.230
#           master, each run on this battery: the frame's bare name back
#           N92a; Case 4 always plural N92b; "R native format" in the label
#           N86bb N86bc N86bd N92c, in jload()'s menu N92c, in jsave()'s
#           N92c; the Loaded line's period back N86be N92d; the replace
#           decline ignored N92e N92f, SKILL.md's not passed N92f; the
#           prefix stripped alone N92g; version 3.7 N92g; the typed
#           redirect's old voice N86m N92h; the lowercase extensions only
#           N92h; jcorr()'s and jalpha()'s Rule E off N92i (each); the old
#           blanked sentence N82l N92k; "missing-value codes" in the
#           both-forms and SPSS-only branches N92j (each); the Stata-only
#           Rule E off N92j; the typed case before the setting N23a N23b
#           N92m; the typed case ignored N92l; "tokens" back N23a N92l
#           N92m; the blanked count always plural N92k; a per-call
#           convention ignored N92m.
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): 798/798 plain and under
#           the RStudio-handler stand-in, each again with a 35-character
#           temp path, and entered dirty plain and under the stand-in (the
#           workspace's x, s, e, f, m and r overwritten as on 0.9.229, the
#           Scripts Slate B items; nothing else moved). run_all.R 2541
#           across eight, all four ways.
#           LAST VERIFIED: v0.9.231, 2026-10-16 (S357) -- 798/798 on the
#           WORKSTATION through receive_all(), on v0.9.230 and again on
#           v0.9.231 ("ALL BATTERIES GREEN (8 run, 2559 checks)"),
#           matching the sandbox; GitHub 72b0b4e and 2a4fcc3. The first
#           call on v0.9.230 ran the S356 script (777/785, the eight
#           re-pins red): the scripts were not yet in regression\, and
#           receive_all(from = "batteries") once the bridge had written
#           them was green (Jeff: "all green that time"; its block not
#           posted).
# S356 EDIT (v0.9.229, 2026-10-15): NEW N91 section, nineteen checks
#           (N91a-N91s), the NAMES slate at the recode family and ruling
#           R17. A: a bare word where a quoted value goes -- jconvert(to =
#           stata), to = SAS with a variable and modify = TRUE kept,
#           convention = stata / Stata / spss in jrecode(), jencode() and
#           jdeclare_missing() -- the pointer with the call to run, the
#           value spelled as the function takes it; a name holding a value
#           left alone, a name spelled like a value too (stata <- "spss":
#           to = stata converts to SPSS); the lines run. B, ruling R17's
#           parser: a quoted label holds a semicolon; the SPSS and Stata
#           habit 1='Yes' (and double quotes) read without the marks, which
#           the labels carried until v0.9.228; an unquoted label as
#           written, a mark partway through included; an equals sign
#           inside quotes part of the label; a quoted label with text after
#           its closing mark taken as written; an unbalanced mark stops
#           naming the form; the same reading in jrecode(labels =),
#           jdeclare_missing(labels =) and a marker rule. C, the lines the
#           package offers: jdeclare_missing()'s marker refusal quotes a
#           label holding a semicolon (the S353 example, which no string
#           could carry) and the line runs, the label landing whole on .b;
#           a label holding a semicolon and a quotation mark quoted with
#           apostrophes; a label no string can carry left out of the line,
#           the sentence after it saying so; ruling R5's layout breaking a
#           long labels string only between its rules, and a short quoted
#           label whose first word would fit the line above moved down
#           whole; ruling R8's builder passing the user's quoted label
#           through; jlogistic()'s 1/2 line; .jst_label_text(),
#           .jst_split_label_rules() and .jst_unquote_label() as units.
#           Every offered line RUN. SEVEN HUNDRED AND EIGHTY-FIVE checks.
#           On the 0.9.228 master 18 red: N91a-c, N91e-s (N91d, the
#           control, passes).
#           MUTATION MAP (S356; twenty one-change mutants of the 0.9.229
#           master, each run on the four batteries of the build): the word
#           check off N91a N91b N91c; the word matched with regard to case
#           N91b N91c; a name holding a value not exempt N91d; the labels
#           string split at every semicolon N91e N91g N91h N91i N91k N91l
#           N91n N91o N91p N91s; a printed label never quoted N91j N91k N91l
#           N91m N91n N91p N91q N91s; the layout opening a quote only at a
#           word start N91s; a quoted label kept its marks N91e N91f N91g
#           N91i N91k N91l N91n N91o N91p N91r N91s; the left-out label
#           unsaid N91m. The other 12 mutants red elsewhere, green here.
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): 785/785
#           plain and under the RStudio-handler stand-in, each again with a
#           Windows-length temp path, and entered dirty.
#           LAST VERIFIED: v0.9.229, 2026-10-15 (S356) -- 785/785 on the
#           WORKSTATION through receive_all(), which ran every battery
#           green after a clean R CMD check and went on to the walks (the
#           paste-back block was not posted; the walks it showed were
#           walked), matching the sandbox; GitHub fea0b51.
# S355 EDIT (v0.9.228, 2026-10-14): NEW N90 section, fifty-six checks
#           (N90a-N90bd), Fix Slate W1: sixteen conformance-only wording
#           items on the missing-value messages, on a slate Jeff approved
#           (leans 2 and 3 okayed; lean 1 settled as ruling R18, whose (a),
#           the vars = pointer, rides here). Parts A-N, as the section's
#           banner lists them: convention = named where "remove the
#           argument" stood; the codes forms said, no Option letters; the
#           jsave() verb and MyLabel; one vocabulary for mixed markers; the
#           no-target refusal quoted; the parse layer phrased by the setting
#           (SAS-style under sas, "marker", the word missing among the
#           new-value forms, N90bc at the NA rule and jencode()'s text map);
#           finding 3; joptions()' codes-length refusal with a line; the
#           missing-to error's joptions() line alone; "every variable";
#           names typed bare in vars = and named twice (N90bd: a workspace
#           object of a variable's name never read); Pattern A and the
#           load scan in the bracketed form, Pattern A's fix as a line; one
#           note for the map values the data lack; a label holding a
#           quotation mark escaped. Each message pinned whole (27 pins
#           FILLED BY RUNNING, .pins90) or by the sentence that changed,
#           and every offered line RUN. RE-PINNED by running, the wording
#           changed under them: N21, N28b, N38b, N49c, N54e, N59d-f, N70q,
#           N72v, N72w, N81ai, N81aj, N81al, N84a, N84u, N86ay, N87ag
#           (eighteen). N80's carve-out for the joptions() "(or ...)" line
#           is gone: the line now parses. SEVEN HUNDRED AND SIXTY-SIX
#           checks. On the 0.9.227 master 73 red: the eighteen re-pins, N80
#           and 54 of N90 (N90g and N90ap, controls, pass).
#           MUTATION MAP (S355; twenty-eight one-change mutants, m01-m03
#           through all eight batteries and the rest through the three this
#           build touched, all red): "remove the argument" back N90a f; the
#           jplot() stop's old words N90e f; "(Option C)" back N54e N90h j;
#           "contain" back N70q N90k; Refused for MyLabel N81al N90l m; the
#           guard's ".a-.z" range back N21 N90c d n; "markers" in the note
#           N84u N90o; the token unquoted N28b N38b N90p; the phrasing pinned
#           to Stata N90q s u v w y (and jencode_check.R N49b c); the word
#           missing dropped at the NA rule N90bc (green until N90bc was
#           written; run again, red); the ordering clause back N90aa; the
#           codes-length check gone N90ac ae; "(or ...)" back N49c N80 N90af;
#           "column" back N90ag; the jconvert() pointer gone N90ah ai al am
#           aq bd; the named-twice stop gone N90an ao; Pattern A's old row
#           N86ay N90ar; its line gone N90ar as at au; the load scan's old
#           row N90av; the singular gone N72w N90ax; the escape gone N90ay
#           az ba bb; the splice keyed on "To name one:" N59f; the
#           jdeclare_missing() pointer gone N90aj ak; "then run the
#           conversion again" for every target N90ar at; the word missing
#           dropped from jencode()'s text-map sentence N90bc (and
#           jencode_check.R N14 N15 N49b); the frame's names not
#           preferred over the workspace's N90bd.
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): 766/766
#           plain and under the RStudio-handler stand-in, each again with a
#           Windows-length temp path, and entered dirty.
#           Two bugs of the build's own, found before delivery: the
#           bare-marker bulk echo spliced on "To name one:", which the
#           MyLabel sentence no longer ends with (N59f); and the vars =
#           check read workspace objects named A and B when they gave
#           names, passing c(A, B) through -- the very case the S351 item
#           named. Found entering dirty (N90ah ai am aq red); the frame's
#           names now come first, and N90bd holds it. The same dirty run
#           found two of N90's checks overwriting a user's x and s (a
#           check's braces run in the global environment, and the foot
#           removes only NEW names): N90's braced checks now run inside
#           local(), as filter_check.R X05's does.
#           LAST VERIFIED: v0.9.228, 2026-10-15 (S355) -- 766/766 on the
#           WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run,
#           2453 checks)") through receive_all(), after a clean R CMD
#           check, matching the sandbox; GitHub f89e83f.
# S354 EDIT (v0.9.227, 2026-10-13): NEW N89 section, fifteen checks
#           (N89a-N89o), Fix Slate H with the S243 call-form item's ruling
#           A (Jeff, S354: "A"): jconvert(data, ..., to = NULL, vars = NULL,
#           ...) -- `to` behind the dots, the one data-first function that
#           had an option between the data and the variables. A: the
#           second argument is a variable -- one, two, under a juse()
#           default, a workspace twin (the frame's variable wins, ruling
#           R12), a quoted name, a column named stata, a misspelling (the
#           not-found sentence), no convention (the four-target menu, the
#           same as the bare call's), t = "spss" no longer partial-matching
#           (the unused-input stop). B: the pointer the old positional
#           target gets (ruling R16's form, Jeff's lean taken) -- a quoted
#           format name pinned whole, a bare one, a name holding one ("fmt
#           holds \"spss\", which is a target format"); the other variables
#           and modify = TRUE kept in its line; the default frame named;
#           every line RUN (.runs89(), the value returned, since a pointer's
#           line carries no assignment); a name holding a variable's name
#           gets the not-found sentence. RE-PINNED, the seven printed
#           jconvert() lines now putting vars = before to =, the teaching
#           form: N19b, N37b, N37d, N47b, N82g, N82h, N86ah-N86at (eight)
#           and N87an-N87as (six) -- the order of the two arguments in each
#           pinned string swapped, nothing else. SEVEN HUNDRED AND TEN
#           checks. On the 0.9.226 master 33 red: N89a-d, N89f-n and the
#           19 re-pinned (the pins of the old order).
#           MUTATION MAP (S354; ten one-change mutants through all eight
#           batteries, ten red): `to` second again N89a-n and
#           filter_check.R I30; the pointer gone N89j-n; the bare word's
#           branch gone N89k; the held branch gone N89l; the column guard
#           gone N89d N89f; the other variables dropped from the line
#           N89m N89n; modify = TRUE dropped N89m; the "To align" line in
#           the old order N37b N37d; the text route's base line in the old
#           order N86ah-aq (14).
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): 710/710
#           plain and under the RStudio-handler stand-in, each again with a
#           Windows-length temp path, and entered dirty (the first dirty
#           entry lost the user's juse() default to N89c's juse(NULL) and
#           overwrote a user's d89: the fixture is .d89 and the default
#           is handed back, .under89()).
#           LAST VERIFIED: v0.9.227, 2026-10-13 (S354) -- 710/710 on the
#           WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run,
#           2385 checks)") through receive_all(), after a clean R CMD
#           check, matching the sandbox; GitHub 9eacd76.
# S353 EDIT (v0.9.226, 2026-10-12): NEW N88 section, twenty-four checks
#           (N88a-N88x and the N88s sweep), Fix Slate 9, the second half:
#           ruling R5, the one layout of a printed call. A: the layout by
#           its unit at widths 40, 50, 76 and 120 -- one line when it fits,
#           a break after an argument's comma, the fixed indent four spaces
#           in, a map under its first rule with a quoted word whole, a c()
#           at its commas, a first argument broken at the call's indent, a
#           subscript named mydata, a long name or formula kept whole and
#           never cut, the words of the one-line form in order,
#           idempotent. B: what it leaves alone. C: a call a builder broke,
#           or an earlier pass laid out, joined and laid out again; a
#           place's broken modify = TRUE line seen whole; the builder's
#           map call one line. D: real messages, every laid-out call RUN
#           beside its one-line form, the frames identical (jencode()'s
#           offered maps, the D1 pairs, the range recipe, the marker
#           refusal's recodes, the load scan's line, a subscript). E: the
#           riders -- the assign-or-lose reminder with no blank line when
#           it is a call's only output, one after a note; jencode()'s
#           advisory notes one blank line from what follows. N88s sweeps
#           every condition at the pinned width: no call left as one long
#           line, no laid-out line over the width (512 calls, 45 laid out).
#           CHANGED, MECHANICALLY under the ruling: N84d, N84g and N87l,
#           pinned whole, refilled by running; eleven checks that grep a
#           call (N45b, N46a, N47c, N65ag, N66c, N67a, N67h, N68c, N69e,
#           N69h, and N45b's jconvert line) read it through .r5_one(), its
#           one-line form; the runners (.run_lines67, .run_line_k,
#           .run_pair66, .run_pair72, .run87) run each call as printed,
#           laid out over lines (.r5_calls(), with .r5_open(), .r5_flat()
#           and .r5_one(), added to the harness). SIX HUNDRED AND
#           NINETY-FIVE checks. On the 0.9.225 master 22 red: N84d, N84g,
#           N87l and 19 of the 24 new (the five that pass hold what did not
#           change: g, i, j, n -- the retired packer's maps ran too -- and
#           u).
#           MUTATION MAP (S353; 21 one-change mutants through all eight
#           batteries, 19 red): the layout off N88a-f h k m-s w x and the
#           re-pinned checks of this battery and jencode_check.R; the
#           indent two spaces N88b-f h k m p r w x; a first argument hung
#           under itself N88w; a map split at every semicolon N88f n and
#           jencode N45a b h; no join N88k l; the packer kept N88m and
#           jencode N45i; one argument a line N88a-e h k p; the closing
#           characters not counted N88d f s and jencode N47m; a map's rules
#           at the fixed indent N88c d f and jencode N45a i N47l; the
#           reminder always blank N88t, never blank N88u v and 18 more; an
#           advisory not counted N88v; the load scan back on cat() N88r; no
#           subscript N88s x; no c() break N88d f s w; a joined call kept
#           unparsed N88i; the empty-index slice N88x; jencode()'s lead
#           ignoring its notes N88u and 12 in jencode_check.R; jrecode()'s
#           lead always N88t. EQUIVALENT, with their reasons: the width test
#           at the layout's head made strict (the wrapper calls it only on
#           a line wider than the width, and a line that fits lays out as
#           itself, every argument on the first line); the comment test
#           removed (a comment after the call is text after its closing
#           parenthesis, which the next test refuses, and one before it
#           leaves the call unclosed, which does not parse).
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): 695/695
#           plain and under the RStudio-handler stand-in, each again with a
#           Windows-length temp path, and entered dirty.
#           LAST VERIFIED: v0.9.226, 2026-10-12 (S353) -- 695/695 on
#           the WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run,
#           2370 checks)") through receive_all(), after a clean R CMD
#           check, matching the sandbox; GitHub 5ab1062.
# S352 EDIT (v0.9.225, 2026-10-11): NEW N87 section, fifty-two checks
#           (N87a-N87az), Fix Slate 9, the first half; six checks changed.
#           A: ruling R8, part 1 -- the word missing on a variable that
#           already carries its marker is said under stata and sas, with
#           the line that keeps the two apart (a marker the variable does
#           not use: az), run; silent with no such marker, with the
#           marker's own label, and on a labelled INTEGER variable (a-h,
#           az). B: ruling R8, part 2 -- a label for missing that differs
#           from the marker's or code's own is refused under all three
#           conventions, pinned whole, its two lines run; no free code is
#           a sentence (i-p). C: ruling R8's offered declarations --
#           jrecode()'s D1 note on a variable of Stata form, jdeclare_
#           missing()'s refusal under no setting and under spss, the load
#           scan's lines, each run; ruling R15's menu ahead of the load
#           scan's line (q-y). D: the NA rule's pair naming every code the
#           recoded variable declares, and the NA rule sent to a free
#           marker on a variable carrying .a, each run (z-ac). E: ruling
#           R6, jrecode()'s half -- one blank line between notes, none
#           before the first, an advisory counting only where it prints
#           (ad-ah). F: jdeclare_missing() on several variables, nested
#           and wrapped once; modify = TRUE on a place, and jconvert()'s
#           twin, offering the assignment that runs (ai-am). G: the five
#           messages that offered a whole-frame conversion to "stata" on a
#           frame holding a declared string, each offered line run;
#           controls (an-au). H: jsave() given an expression as the data,
#           every block opening on "mydata <- ...", each run (av-ay).
#           CHANGED: N69k and N84o FLIPPED by ruling R8 (the merge is now
#           said); N84m re-pinned to the nested refusal; N84ai to the NA
#           note's pair; N84aj to the gate lead's fourth argument; N84an
#           to the place's assignment line. SIX HUNDRED AND SEVENTY-ONE
#           checks. On the 0.9.224 master 50 red: 43 of the 52 new (the
#           nine that pass pin what did not change: d, e, g, n, t, x, ac,
#           aj, au), the six changed, and N80 (jsave()'s line on an
#           expression did not parse).
#           MUTATION MAP (S352; 39 one-change mutants, every one red; all
#           eight batteries on 38, this battery alone on the jconvert()
#           place mutant and the rerun below): the part-1 note gone N69k N84o N87a b c
#           f h o; the free marker ignoring the variable's own N87az (a
#           SURVIVOR of the first round: N87az was written for it, and it
#           reds there alone); the same label not honored N87e; the
#           part-2 refusal gone N87i-m p; its spss arm gone N87l m p; the
#           labels argument keeping "missing=" N87i-m; the merge line
#           keeping the missing rule N87i-k l m p; the spss free code
#           ignoring a declared one N87l m; no blank line between notes
#           N84ac af N87ad-ah; an advisory always counting N84ad ah N87ag;
#           the labels hint always opening blank N87af ag; jrecode()'s D1
#           marker mode off N87q r s, its setting test ignored N87s; the NA
#           rule's SPSS-form branch off N84ai N87z aa, its marker branch
#           N84ai N87ab; the convention argument always empty N87s u ab
#           (and models R06); no marker clash N87v (and models R05 R06);
#           the load scan's gate lead gone N87w y, its fourth argument
#           ignored N84aj N87w y; the old bulk layout N84m N87ai; the raw
#           message not carried N87ai; the old place lines N84an N87ak al,
#           and for jconvert() N87am; the place line keeping modify N84an
#           N87ak-am; no text route N87an-aq ar as at; the nudge's ordinal
#           always "first" N87as, its exemplar always the first frame
#           N87at, its one-frame route gone N87ar; the D2 route N87aq, the
#           token error's N87an, the ambiguous stop's N87ao, the marker
#           gate's N87ap; jdeclare_missing()'s refusal without its
#           convention argument N87u; jsave()'s expression lines gone N87av
#           aw ax, its file stem ignored N87av aw ay N80, only the first
#           block given its "mydata <-" line N87av aw.
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): 671/671
#           plain and under the RStudio-handler stand-in, each again with
#           a Windows-length temp path, and entered dirty. The first
#           dirty run left .jst_missing_notice_shown set: N87's loads print
#           the narrative, and N87 now hands the flag back at its foot.
#           LAST VERIFIED: v0.9.225, 2026-10-12 (S352) -- 671/671 on
#           the WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run,
#           2346 checks)") through receive_all(), after a clean R CMD
#           check, matching the sandbox; GitHub 5c5304e.
# S351 EDIT (v0.9.224, 2026-10-11): NEW N86 section, fifty-nine checks
#           (N86a-N86bg), Fix Slate 6, load and save. A: jload()'s and
#           jsave()'s front doors -- a file name without quotes, a data
#           frame (a shipped dataset's name; any other), an empty string
#           from a variable or system.file(), jsave() given a file name
#           alone with no default, "'z' is not a data frame", a name
#           starting with a digit (jload(), name =, jcopy()), ".RData files
#           can contain" (a-m, bg). B: a path typed with single backslashes
#           in jload(), jsave() and joptions(data.dir = ), the fixed path
#           read from the message and loaded, what is NOT caught (n-t, bf).
#           C: a CSV file of one column keeps its empty lines (u-w). D:
#           ruling R13's note on a text variable's missing cells in .sav,
#           .dta, .xpt and .csv, a factor in CSV, the count against the
#           round trip (x-ag). E: a frame holding a text variable with
#           declared missing values -- the .dta and .sav refusals, the
#           narrative's Cases 4, 6 and 7, each offered line RUN, the CSV
#           note's rider, jconvert()'s label report under stata and sas
#           (ah-ay). F: Case 7's count past three names; ruling R6's blank
#           line around jload()'s Loaded line (az-be). Fixtures carry a
#           labelled INTEGER variable beside the double one (the S350
#           lesson). SIX HUNDRED AND NINETEEN checks. On the 0.9.223 master
#           49 of the 59 red; the ten that pass pin what did not change
#           (f, h, r, aa, ab, an, au, ay, ba, bd).
#           MUTATION MAP (S351; 49 mutants, every battery on each, then
#           four again on the final master): the path check gone from
#           jload() N86n q s, from jsave() N86o (and N79: the file is then
#           written under a name holding a tab), from joptions() N86p ai ak
#           al (the folder is then made, and later saves land in it); a
#           doubled backslash kept N86bf; an unmappable character given
#           the mapped form N86q bf; always the plural N86p; DEL not
#           caught N86bf; a shipped dataset's name not told apart N86b; a
#           data frame not caught N86b c bg; no system.file() line N86e; a
#           typed "" given the expression form N86f; no unquoted-name
#           check N86a; jsave()'s file-name branch gone N86g, or ignoring
#           the default N86h; "'z' is a <class>" N86i; name = not told
#           apart N86k; jload()'s digit sentence N86j k; jcopy()'s N86l;
#           ".RData files contain" N86m; a one-column CSV skipping its empty
#           lines N86u v w; every CSV keeping them N86w; the header read
#           without quotes N86w; no .xpt note N86y; a factor in CSV not
#           counted N86ac; a factor counted for .sav N86ad; is.na() on the
#           declared string itself N86af; always "them" N86ae; the text
#           note before the label note N86z; no note at all N86x y z ac ad
#           ae af ag; the .dta refusal's second call always N86ak; no
#           jencode() line N86ah ak al; no minimal-tier sentence N86aj;
#           vars as a bare list N86ah-al ao-at; the narrative's old
#           whole-frame line N86ao-at; the over-limit Stata route always
#           N86am; three calls said "run both:" N86ar as; the rider not
#           counted for "the first line" N86at; the second call's test
#           ignoring the convention N86at; the CSV rider ignored N86av aw;
#           "numbers" in the both-forms branch N86aw; the label report kept
#           under stata N86ax, dropped under every target N86ay; a
#           declared text variable read without the SPSS test N86ah ai aj
#           al an aw; Case 7 naming however many N86az, or counting from
#           three N86ba; no blank line before the Loaded line N86bc; the
#           flag not set by it N86bb be; no blank line before the narrative
#           N86bb be. ONE SURVIVOR, "the flag set though quiet": quiet =
#           TRUE mutes every line the flag spaces, so the guard could not
#           differ; it was REMOVED from the master (the S343 rule), not
#           mapped as equivalent. On the final master, whose reworded
#           sentences end their own lines: 'z' N86i, name = N86k, the two
#           digit sentences N86j k and N86l.
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): 619/619
#           plain and under the RStudio-handler stand-in, each again with
#           a Windows-length temp path, and entered dirty (with a Source,
#           an Income and a community of the user's as well). The first
#           dirty run left .jst_missing_notice_shown set: N86's loads print
#           the narrative, and N86 now hands the flag back at its foot.
#           LAST VERIFIED: v0.9.224, 2026-10-11 (S351) -- 619/619 on
#           the WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run,
#           2279 checks)") through receive_all(), after a clean R CMD
#           check, matching the sandbox; GitHub 093763a.
# S350 EDIT (v0.9.223, 2026-10-11): NEW N85 section, five checks (N85a-e):
#           jdeclare_missing(codes = ) on a labelled variable stored as
#           whole numbers, under stata and sas -- the S345 collision check
#           read haven::na_tag() on its INTEGER labels and stopped with
#           haven's "`x` must be a double vector" (0.9.218-0.9.222), found
#           running missing-values.qmd's finished script. Converted with
#           its own labels kept (a, b), uppercase under sas (b), a code no
#           case holds declared ahead (c), with a double in one call (d),
#           and the shipped clinic's Anxiety2 through jfreq() (e). FIVE
#           HUNDRED AND SIXTY checks. On the 0.9.222 master N85a-e red.
#           MUTATION MAP (S350): the label probe without the double test
#           N85a b c d e.
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): 560/560
#           plain and under the RStudio-handler stand-in, each again with
#           a Windows-length temp path, and entered dirty (the workspace
#           and settings handed back as on 0.9.222).
#           LAST VERIFIED: v0.9.223, 2026-10-11 (S350) -- 560/560 on
#           the WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run,
#           2220 checks)") through receive_all(), after a clean R CMD
#           check, matching the sandbox; GitHub 4a0586a.
# S348 EDIT (v0.9.221, 2026-10-10): N65b RE-PINNED under ruling R4: the
#           labelled -70 inside the declared range, which no case holds, is
#           a zero row between the two in-band cells (Freq 1, 0, 1). No
#           check added (555). MUTATION MAP (S348): no zero row for a
#           labelled code inside a range N65b.
#           LAST VERIFIED: v0.9.221, 2026-10-10 (S348) -- 555/555 on
#           the WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run,
#           2177 checks)") through receive_all(), after a clean R CMD
#           check, matching the sandbox; GitHub 2a49208.
# S346 EDIT (v0.9.219, 2026-10-08): the session guard hands back the stored
#           display settings (.jst_output_toggles) with the output level.
#           The diagnostics setting outlives a level call since v0.9.219,
#           so a run entered with joutput(diagnostics = TRUE) left the
#           session without it (found entering dirty). No check added.
#           LAST VERIFIED: v0.9.219, 2026-10-09 (S346) -- 555/555 on
#           the WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run,
#           2079 checks)") through receive_all(), after a clean R CMD
#           check, matching the sandbox; GitHub 14528c6.
# S345 EDIT (v0.9.218, 2026-10-06): Fix Slate 5, the second cut. NEW N84
#           section, 43 checks (N84a-aq), in eight parts. A, N84a-c (the
#           S287 remainder): the map parser names the invalid old value
#           or values alone, so the count agrees; the stop is still bare.
#           B, N84d-o (Jeff's ruling, S345; the S339 item):
#           jdeclare_missing() refuses a code whose letter the variable
#           already carries, in a cell or as a labeled value -- pinned
#           whole for one code and for several; both offered recodes RUN
#           (kept apart; merged on purpose); nothing changed by the
#           refused call; a labeled-only marker and a code no case holds;
#           SAS; no clash, an integer column, and the other case of a
#           letter; a call on several variables; a place and an
#           expression; and N84o, ruling R8's ground untouched (the
#           missing token still joins a column's own .a cells silently).
#           C, N84p-u (the S247 item): on a column holding both letter
#           cases a typed letter names the marker the cells carry, in
#           jdeclare_missing() and in jrecode()'s labels; the helper by
#           its cases; the mixed-marker note counts cells only. D, N84v-aa
#           (the S339 item): a range replaced by one that no longer
#           covers it is reported, a sentence to a line, with the cases
#           that are data again; widened or unchanged, nothing; a case
#           still declared by a code is not counted; with a dropped code,
#           one note; the minimal level. E, N84ab-ac (the S241 item, part
#           (1)): no labels hint after a token-only map under any
#           convention. F, N84ad-aj (the S251 item): jrecode()'s three
#           "declare it" sites carry the choose-first menu with no
#           convention selected (pinned), are as they were under each
#           convention and on a variable that carries a declaration; the
#           helper. G, N84ak-an (the S343 item): .jst_place_lines() by
#           its cases, jrecode()'s pair on a place run as printed, and
#           the stop a hand-typed modify = TRUE still meets. H, N84ao-aq:
#           the riders by their units (.jst_udm_row_label()'s switch,
#           .jst_first_typed_marker(), the range-conflict heads).
#           RE-PINNED: N19a (the mixed-marker note lists the cells'
#           markers), N72v ("Invalid old value '.ab'"). REPLACED: N81m,
#           whose fixture's call is now refused; it holds the refusal,
#           and its comment says why presence-from-the-result can no
#           longer be told apart by any output. Every N84 check that
#           assigns runs its body in local(). FIVE HUNDRED AND FIFTY-FIVE
#           checks.
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): 555/555
#           plain and under the RStudio-handler stand-in, each also with a
#           Windows-length temp path, and entered dirty (as
#           jencode_check.R describes): nothing left but .results, the
#           session handed back. The N79 and N80 sweeps read the new
#           messages with the rest (no early break; every runnable line
#           parses).
#           On the 0.9.217 master 38 red: N19a, N72v, N81m and 35 of N84.
#           Controls, on no mutant's list by design: N84o (R8) and N84aa
#           (the code-only notice as it was).
#           FOUND BY THE WALK, NOT BY A CHECK: the first build of the
#           refusal read haven::na_tag() on an INTEGER column and stopped
#           ("`x` must be a double vector"); no check here converted one.
#           missing_convention_walk.R Section 3 does. N84l holds it now,
#           and the mutant that removes the test reds it.
#           MUTATION MAP (S345; the mutants of jencode_check.R's list that
#           red here). The invalid values not made unique, or the noun
#           never plural, N84b; the whole left side quoted again N84a b c.
#           The collision guard never firing N81m N84d-n; reading cells
#           only N84j, labels only N81m N84g h l; the free letters not
#           cleared of the variable's own N84d e g h i k n; the merge line
#           labeling the clashing marker N84d e g; the cell tags read
#           without the double test N84l; letters compared without regard
#           to case N84l; an expression's naming line dropped N84n; a
#           code's own label not carried N84g. The carried-marker helper
#           never deferring N84p q s t, deferring when the canonical case
#           is carried N84r t; jdeclare_missing() back to the canonical
#           case N84p q; jrecode()'s labels N84s; the note counting
#           labeled markers N19a N84u. The range arm never firing N84v w y
#           z; firing on a widened range N84x; a still-declared case
#           counted N84y; only the upper end compared N84w, only the lower
#           N84v w y z; the count never singular N84w y; the minimal list
#           without the range N84z; the old range's ends swapped N84v w y
#           z. The token's rules counted by the labels hint N84ab; the
#           hint never firing N46h N84ac. The gate lead always NULL
#           N84ad-ag aj; ignoring plain N84ai aj; ignoring the convention
#           N84ah aj; its head never plural N84ag aj; each of jrecode()'s
#           three sites without it N84ae (and ag), N84af, N84ad; the
#           recoded variable always read as plain N84ai. The place
#           rewrite switched off N84am; a name rewritten too N84v al am an
#           and 42 other checks; a named first argument rewritten N84al;
#           the scan
#           ignoring quotes, or brackets, N84ak. The formatter's bare form
#           returning "(no label)" N81b d g h k l m n n2 o q N84g ao; the
#           typed spelling ignored in a rule N42g N65z N84ap, in the
#           labels N42f N84ap; the conflict heads never capitalized N84aq.
#           LAST VERIFIED: v0.9.218, 2026-10-07 (S345) -- 555/555 on
#           the WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run,
#           1952 checks)") through receive_all(), after a clean R CMD
#           check, matching the sandbox; GitHub ec82e6b.
# S343 EDIT (v0.9.217, 2026-10-06): the lean-free cut of Fix Slate 5. NEW
#           N83 section, 11 checks (N83a-k): joptions() on a near miss of
#           a convention VALUE (the S281 item's value half). After the
#           Rule A choice error, which is unchanged and still lists the
#           four values (N2), the nearest value and the call to run:
#           pinned whole for the positional form (N83a), the named form
#           and a call with a second setting (N83b), two tied values
#           (N83c), the offered call run and the refused call having set
#           nothing (N83d), any case (N83e), "none" (N83f). The over-fire
#           guards N83g-j: a string near no value, the half-length rule
#           ("data", "sa", "st"), three edits ("stata_17"), a value that is
#           not one string (a number, two strings, NA, "", TRUE, a
#           function), the slot guard still first, and every other choice
#           error as it was. N83k the builder by its cases. The section
#           hands back the convention. FIVE HUNDRED AND TWELVE checks.
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): 512/512 plain
#           and under the RStudio-handler stand-in, each also with a
#           Windows-length temp path, and entered dirty (as jencode_check.R
#           describes): nothing left but .results, the session handed back.
#           On the 0.9.216 master 7 red: N83a-f and N83k. Controls, on no
#           mutant's list by design: N83i and N83j.
#           MUTATION MAP (S343; the mutants of jencode_check.R's list that
#           red here). No hint passed, or .jst_stop_arg() dropping it,
#           N83a-f; the two call forms swapped N83a-f; the distance limit
#           opened (2 to 99), the half-length rule removed, or loosened by
#           one notch, N83g k; the limit tightened to 1 N83d k; one of two
#           tied values N83c k; compared case-sensitively N83k alone
#           (joptions() lowercases before it asks, so only the unit sees
#           it); the not-one-string guard reduced to is.character N83h k;
#           the is.character test removed N83h (a function value met
#           tolower()'s own error).
#           LAST VERIFIED: v0.9.217, 2026-10-06 (S343) -- 512/512 on
#           the WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run,
#           1890 checks)") through receive_all(), after a clean R CMD
#           check, matching the sandbox; GitHub 8a10deb.
# S340 EDIT (v0.9.214, 2026-10-05): Fix Slate 3, text variables. NEW N82
#           section, 17 checks (N82a-N82q): a STRING variable with value
#           labels, and with declared missing values, through jload()
#           (it ended on a vctrs error after its narrative; the narrative
#           read "NA (no label)"), the scan of suspected codes,
#           preserve.declarations = FALSE in jload() and jsave(),
#           jconvert() to base R (the declared cells become NA) and to
#           Stata and SAS (refused, both messages pinned whole), and
#           jdummy(); N82o-q the narrative's offered conversion, to =
#           "baseR" for a frame holding a declared string and to = "stata"
#           otherwise, the offered call run. Fixture s82 and a temp .sav,
#           removed at the foot; the section hands back the convention and
#           the narrative's shown-this-session flag. FIVE HUNDRED AND ONE
#           checks.
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): 501/501 plain
#           and under the RStudio-handler stand-in, each also with a
#           Windows-length temp path, and entered dirty (joutput("full"),
#           width 110, a juse() default, a stata convention, jstats.color =
#           TRUE, workspace objects named like fixture variables): the
#           width, the default frame, the level, the convention and the
#           color option handed back, nothing left but .results.
#           On the 0.9.213 master 12 red: N82a-h, l, n, o, p. Controls, on
#           no mutant's list by design: N82i, j, k, m (what must not
#           change).
#           MUTATION MAP (the S340 mutants that red here; the full list of
#           74 is described in cps_check.R): missing_info text arm off
#           N82a b d-h l; labels not matched, or declaration order kept,
#           N82b d f; text flag FALSE N82d e g h l; the load scan not
#           skipping a labelled string N82a c; the preserve.declarations =
#           FALSE text arm off N82d l; jconvert baseR text arm off N82e p;
#           the Stata/SAS refusal off N82g h; its lead always plural N82g;
#           its fix line always singular N82h; the plausibility check's
#           bare as.numeric() back N82n; dummy names' labelled-string arm
#           off N82n; the narrative always offering "stata" N82o, always
#           "baseR" N82q.
#           LAST VERIFIED: v0.9.214, R 4.6.1, 2026-10-05 (S340) -- 501/501 on
#           the WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run,
#           1734 checks)") after receive_package() and a clean R CMD check,
#           matching the sandbox; GitHub 2d04b68.
# S339 EDIT (v0.9.213, 2026-10-05): Fix Slate 2, eight to-do items on one
#           surface. NEW N81 section, 44 checks (N81a-N81ao, with N81n2,
#           N81w2 and N81ab2): jdeclare_missing()'s confirmation read from
#           the variable the call PRODUCED. The kept half of a declaration
#           listed and marked "(already declared)" (N81a-c, the S298
#           item); "(no label)" on a code without one and the kept label
#           shown on a bare redeclaration (N81d-g, Session 198 and S241
#           part 3); "(not present in the data)" on a code, a range and a
#           converted code no case holds, never on an in-range label
#           (N81h-m, Session 114 and the S339 leans); one space before
#           every parenthesis (N81j N81k, S220); a bulk call's blocks
#           (N81n-q); the drop notice and the mixed-marker note ahead of
#           the durability reminder, the two other notes still after it
#           (N81r-w2, S267); the reminder's two lines on a bulk call
#           (N81x-ac, S298 and S292 site 1); an expression or a place
#           given as the data (N81ad-am, the S219 item's findings 2 and
#           5); and two sweeps over the section's own stdout (N81an
#           N81ao). No existing check moved: the unedited S337 battery
#           reads 440/440 on the new master, because nothing in it pinned
#           a confirmation's body. FOUR HUNDRED AND EIGHTY-FOUR checks.
#           Sandbox (R 4.3.3, pkgload::load_all): 484/484 on the 0.9.213
#           master; 447/484 on 0.9.212, the 37 red all N81, with N81t
#           N81w2 N81z N81ag N81ah N81an N81ao the controls, green on
#           both. MUTATION MAP (one change each, every battery run): 47
#           mutants, 46 red, every red in N81 and nowhere else. The body:
#           the range never marked kept (B1) N81a N81o; a kept code never
#           marked (B2) N81b N81c; "no label" dropped (B3) N81b d g h n n2 o;
#           the label not read from the column (B4) N81a c e f g p r v; a
#           code never marked absent (B5) N81h N81n; a range never (B6)
#           N81i; an in-range label marked (B7) N81j; two spaces (B8)
#           fifteen checks; a comma for the semicolon (B9) seven;
#           conversion presence read from the result's values (B10) N81k
#           l q, from the markers it ends with (B10b) N81m alone;
#           conversion "no label" dropped (B11) and a converted code
#           never marked (B12) N81k l m q; the range line left out (B13)
#           six; "not present" ahead of the other marks (B14) six; the
#           body read from the column as it arrived (B15) N81b c r v.
#           Bulk: absent when ANY variable lacks the code (K1) N81n n2 o;
#           the first variable's presence for the block (K2) N81n2 alone;
#           the body out of the group key (K3) N81o N81p; presence put
#           INTO the key (K5) N81n n2 o. Order: the reminder back with
#           the block (O1) N81r s u w; between the two notes (O2) N81s;
#           no blank before it (O3) nineteen checks; the drop notice
#           under missing.notice = FALSE (O4) N81w2; the reminder at the
#           minimal level (O5) N81v. The two lines: vars = as typed
#           ignored (S1) N81x N81ac; no cap of three (S2) N81aa; the
#           width ignored (S3) N81ab N81ab2; vars = used whether or not
#           it fits (S4) N81ab; the fixed part of the line uncounted (S5)
#           N81ab N81ab2; every name again (S6) six; a cap of two (S7)
#           N81z aa ab2; a list shown in part (S8) and a stray comma (S9)
#           N81y aa ab ab2. The data argument: always a name in
#           jdeclare_missing() (X1) N81ad af ai al am, in jconvert() (X2)
#           N81ae; a place read as an expression (X3) N81af ag ak; single
#           brackets a place (X4), a call's element a place (X5) N81ak;
#           the modify line for a place (X6) N81af; the example taking
#           the call's data frame (X7) N81ai N81aj; names() always MyData
#           (X8) N81aj, always the call's argument (X9) N81ai; the
#           nothing-to-name line (X10) N81al and the equivalent call
#           (X11) N81am assigning to the expression; the reminder's
#           expression form unused (X12) N81ad af am. TWO SURVIVED THE
#           FIRST RUN. K2 needed the variable that lacks the code named
#           FIRST (N81n2). K4 -- the notes left out of the group key --
#           is EQUIVALENT and recorded as such: within one call a line's
#           notes follow from its text ("already declared" is call-level,
#           "no label" is the text's own missing bracket), so two
#           variables with the same text cannot differ in their notes;
#           the key keeps them against a future note that is a fact of
#           the column. B10 was too blunt for N81m and B10b was written
#           to separate it.
#           LAST VERIFIED: v0.9.213, 2026-10-05 (S339) -- 484/484 on the
#           WORKSTATION via run_all.R (ALL BATTERIES GREEN, 8 run, 1615
#           checks) after receive_package() and a clean R CMD check,
#           GitHub eb54a30, matching the sandbox count for count (plain,
#           under the RStudio-handler stand-in, each again with a
#           Windows-length temp path; entered dirty).
# S337 EDIT (v0.9.211, 2026-10-05; no package change): Scripts Slate A. NEW
#           N78a-f: the jdeclare_missing() convention error quotes the call as
#           typed (the S249 item; the builder had no assertion at all), each
#           check with its own one-change mutant. NEW N79 and N80, swept over
#           every condition grab() takes (kept one by one in .seen): no
#           premature break (the S291 item) and every runnable line parses (the
#           S249 item's guard (3)); N80 takes out, by exact text, jconvert()'s
#           missing-to line, which ends on a call with a note after it
#           (logged). .over76() reads .pin_width (the S256 item). The
#           convention is now FORCED unset at Setup and two mid-file lines that
#           put the ENTERING value back are fixed: entered with a convention
#           set, the S334 battery read 431/432, red at N3d. The output level is
#           handed back. A GREEN run now removes everything the battery made
#           (the names in the workspace are recorded at Setup; .results stays,
#           for run_all.R), so a walk that reports on the data frames in the
#           workspace can follow it in one session. A red run keeps its
#           fixtures. FOUR HUNDRED AND FORTY checks: 440/440 in the sandbox,
#           plain, under the RStudio-handler stand-in, and ENTERED DIRTY
#           (joutput("full"), width 90, a juse() default, a stata convention):
#           nothing left but .results, and the width, the default frame, the
#           level and the convention as they were on entry. (Setup still clears
#           stored jsubset(), jcomplete() and registration settings, as it
#           always has.)
# S334 EDIT (v0.9.211, 2026-10-04): three items of one build. (1) ONE
#           ARROW COLUMN for jconvert's whole report (the S333 item):
#           N73c N73d RE-PINNED (their second variable's arrow moved into
#           line), NEW N76 section (7 checks): a one-value variable
#           between two-value variables, both directions (N76a N76b); a
#           row too long for the message width keeping its own arrow
#           (N76c), setting the column once the width lets it fit
#           (N76d), every row its own when none fits (N76e); the fit
#           judged at the report's widest destination (N76f) and a row
#           exactly at the width fitting (N76g). (2) joptions() ENDS ON
#           ONE BLANK LINE (the S333 "Created" note item, the nudge with
#           it by Jeff's ruling): N74d RE-PINNED, NEW N74v-N74y (a silent
#           nudge adds nothing; the nudge alone; the note and the nudge;
#           the workspace's data frames put back). (3) THE RETURN-TRIP
#           NOTE FIRES WHENEVER A LETTER WOULD CHANGE (the S319 item,
#           found wider than a range): NEW N77 section (12 checks), each
#           claim checked against the trip itself, run both ways. FOUR
#           HUNDRED AND THIRTY-TWO checks.
#           Sandbox (R 4.3.3, pkgload::load_all): 432/432 plain and under
#           the RStudio-handler stand-in; the UNEDITED S332 battery reads
#           406/409 on the new master, red at N73c N73d N74d and nowhere
#           else; this file on the 0.9.210 master 412/432, red at N73c
#           N73d N74d N74w N74x N76a-f N77b N77d-k, with N74v N74y N76g
#           N77a N77c N77l the controls. MUTATION MAP (one change each,
#           every battery run): 27 mutants here, every one red. Arrow:
#           the per-block width back (A1) reds N73c N73d N76a-f; the
#           width ignored (A2) N76c N76e N76f; the row's own destination
#           (A3), the name column left out (A6), the arrow's own width
#           left out (A7) N76f; none-fit falling back to the widest (A4)
#           N76e; a strict < (A5) N76g; the padding unguarded (A8) N73h
#           N76c N76e N76f; arrow-less rows counted (A9) N73a N73b N73e
#           N73f. joptions: no blank after the note (J1), the blank
#           inside the message (J6), the blank before the note (J9) N74d
#           N74x; none after the nudge (J2), the nudge reporting FALSE
#           (J5) N74w N74x; the blank unconditional (J3), the nudge
#           reporting TRUE (J4) N74v; the blank under quiet (J7) N74e;
#           the blank without a folder made (J8) N74l. Return trip: the
#           S314 trigger back (T1) N77b N77d N77f-k; no tie-break (T2),
#           the tie-break reversed (T9) N77j; ascending (T3), no
#           absolute value (T8) nineteen checks from N70e to N77l; the
#           note naming the leading letters (T4) N77b N77d N77e N77h-k;
#           the plural always "different" (T5) N70k N70w N77l, always
#           "leading" (T6) N77f N77g, any-for-all (T7) N77g. TWO SURVIVED
#           THE FIRST RUN: A5, which needed a row exactly at the width
#           (N76g), and T7, which needed one variable whose single
#           marker does come back as the leading letter (N77g's second
#           variable).
#           LAST VERIFIED: v0.9.211 PENDING -- SANDBOX only (1491 across
#           eight, plain and under the RStudio-handler stand-in);
#           WORKSTATION run pending Jeff's receive of the 0.9.211 master.
# S332 EDIT 2 (v0.9.210, 2026-10-04): two rulings of Jeff's the same
#           session. (1) QUIET IS FULLY QUIET: joptions(data.dir = ...,
#           quiet = TRUE) no longer prints the "Created" note (the folder
#           is created all the same). N74e FLIPPED to say so; N74f N74g
#           N74u re-pinned off quiet = TRUE, which they used only to keep
#           the panel out of the way, their meaning unchanged. (2) THE
#           FULL PANEL SHOWS ALL SIX SLOTS under every convention,
#           reversing S267's rule that hid the SPSS codes row off "spss".
#           NEW N75 section (7 checks): the six rows under none, Stata,
#           SAS and SPSS (N75a-d), the joptions(NULL) reset (N75e), and
#           the setting ECHO still leaving the codes out off "spss" and
#           pulling them in under it (N75f N75g). Nothing in this file
#           held the S267 full-panel rule: the 0.9.209 battery is green
#           on the new master except the four N74 checks above. FOUR
#           HUNDRED AND NINE checks.
#           Sandbox (R 4.3.3, pkgload::load_all): 409/409 plain and under
#           the RStudio-handler stand-in; on the 0.9.209 master 404/409,
#           red at N74e N75a N75b N75c N75e, with N75d N75f N75g the
#           controls. MUTATION MAP for this build (the v0.9.209 map below
#           re-run in full against this file, its results the same but
#           for the three lines noted): quiet not silencing the note
#           (D03, its meaning inverted) reds N74e; the note not emitted
#           (D02) N74a N74d N74f N74g N74u; the note before the echo
#           (D04) N74d N74e. The full panel hiding the codes row off
#           "spss" again (P1) reds N75a N75b N75c N75e; the echo pulling
#           the codes in under any setting (P3) N75f; the relatedness map
#           emptied (P4) N75g; the codes row moved to the foot of the
#           panel (P6) N75a-e. D26 still survives, for the reason below;
#           Jeff's workstation run at 0.9.209 (joptions(data.dir =
#           "Trail/") twice: one note, then none) shows the guarded
#           behavior is right on Windows, not that Windows needs the
#           guard.
# S332 EDIT (v0.9.209, 2026-10-04): NEW N74 section (21 checks) locks the
#           two joptions(data.dir) changes; nothing else in the file
#           changed, and the unedited S319 battery reads 381/381 on the
#           new master. (1) THE FOLDER IS CREATED WHEN THE SETTING IS MADE
#           (Session 178): the note, the echo without its first-save
#           annotation, nothing created or said for a folder that exists
#           (N74a-c); the note after the echo, and at this build NOT
#           silenced by quiet (N74d N74e; see EDIT 2); a nested path, an
#           absolute path and the note's
#           two forms (N74f-h); a folder that cannot be created stops in
#           the Rule AH form with no setting changed, and only after every
#           other slot has been validated (N74i-k); jsave() creating a
#           folder gone since, and stopping in the same form (N74r-t); a
#           trailing separator (N74u). (2) AN EXPLICIT NULL CLEARS
#           (Session 181): NULL, a NULL in a variable, "" and a blank
#           string clear and create nothing, an OMITTED data.dir is left
#           alone, and the two refusals name NULL (N74l-q). The section
#           works in a scratch working directory and restores the
#           session's own. FOUR HUNDRED AND TWO checks at this build.
#           Sandbox (R 4.3.3, pkgload::load_all): 402/402 plain and under
#           the RStudio-handler stand-in; on the 0.9.208 master 388/402,
#           red at N74a N74b N74d-j N74l N74n N74q N74t N74u, with N74c
#           N74k N74m N74o N74p N74r N74s the controls, green on both.
#           WORKSTATION: 402/402 at 0.9.209 (run_all.R 1422 across eight).
#           MUTATION MAP (S332, sandbox, twenty-seven mutants, one change
#           each): no folder created at set time (D01) reds N74a N74b
#           N74d-g N74i N74j N74u; the note not emitted (D02) N74a N74d-g
#           N74u; silenced by quiet (D03) N74e-g N74u; before the echo
#           (D04) N74d; the folder created before the other slots are
#           validated (D05) N74k; a failed create not stopping (D06) N74i
#           N74j N74t; joptions' closing sentence dropped (D07) N74i; R's
#           message not relayed (D08) or the path inline (D09) N74i N74t;
#           the setting written before the create (D10) N74j; a named
#           NULL left alone again (D11) N74l N74n; "" no longer clearing
#           (D12) or a blank string not trimmed (D13) N74o; clearing
#           storing "" (D14) N74l N74n N74o; the note always in the
#           relative form (D15) N74g N74h; the absolute test without the
#           drive letter (D16) or the tilde (D17) N74h, without the
#           leading separator (D18) N74g; jsave no longer creating the
#           folder (D19) N74s N74t, or creating it without the note (D20)
#           N74s; each refusal's old text (D21 D22) N74q; an omitted
#           data.dir read as supplied (D23) N74p N74q; an existing folder
#           reported as created (D24) N74c N74u; the first-save
#           annotation removed (D25) N74r; nested paths not created in
#           full (D27) N74f. ONE SURVIVOR, D26 -- the helper's existence
#           test on the name without its trailing separator: R on Linux
#           resolves "Trail/" itself, so the sandbox cannot separate it.
#           N74u is the check that would see it on a platform that does
#           not; it is NOT evidence here.
# S294 EDIT (v0.9.167, 2026-09-14): the two N64 clears moved from the
#           bare jsubset(NULL) / jcomplete(NULL) to the named-frame
#           f(f64, NULL): this file sets no juse() default, so under the S294
#           NULL flip the bare forms would have cleared nothing and N64l-N64p
#           would have run under a live filter. No assertion touched;
#           231/231 on the WORKSTATION after a clean devtools::check(),
#           matching the SANDBOX check for check.
# S302 EDIT (v0.9.173, 2026-09-19): NEW N65 section (32 checks) locks the
#           jrecode band fix -- a range declaration now survives a recode
#           under every else setting -- and the three rulings that rode in
#           its build (the mint collision guard, the marker refusal against a
#           surviving SPSS-style declaration, the labels merge), plus the
#           discrete alignment (an absent declared code carries). No earlier
#           assertion changed. Discrimination and the ten-mutant map are in
#           the N65 header.
# S303 EDIT (v0.9.174, 2026-09-20): NEW N66 section (7 checks) locks the
#           D1 note's second remedy as the recode-then-declare pair on the
#           RESULT column (the S302 D1 remedy item), four of them by
#           paste-and-run of the printed lines. N30a and N55d FLIPPED in
#           place: both pinned the S267 source-column form. Sandbox
#           (R 4.3.3, source()'d, ::: shimmed): 270/270 on the edited
#           master; the pristine 0.9.173 master reds exactly N30a, N55d and
#           N66a-g.
# S304 EDIT (v0.9.175, 2026-09-20): NEW N67 section (10 checks) locks
#           jencode's mint collision guard (the S247 item's jencode half):
#           the three map-target routes, the map-not-cells reading, the
#           face-value route, both remedies by paste-and-run, and two LOCKS
#           (no false alarm; the incomplete-map error first). No earlier
#           assertion changed. Sandbox (R 4.3.3, source()'d, ::: shimmed):
#           280/280 on the edited master; the pristine 0.9.174 master runs
#           the 270 earlier checks clean and reds exactly N67a-h. Six-mutant
#           map in the N67 header.
# S308 EDIT (v0.9.179, 2026-09-21): NEW N68 section (6 checks) locks the
#           D1 note's PLURAL form (the S250 item): the declare pair alone,
#           a prose pointer to the merge, no token line; N68b pastes and
#           runs the pair under stata. NEW N69 section (12 checks) locks
#           the tag collision guard (the S304 item): a map naming the
#           token's own marker stops in jrecode and jencode, both remedy
#           lines run alone, the free-marker search, the map-read rule,
#           and two LOCKS (N69j no false alarm; N69k the source-cells route
#           stays silent, recorded not ruled). N65q RE-PINNED to the
#           modify = TRUE form (the S303 mv item), N65r now RUNS the
#           harvested line, NEW N65ag pins the per-call carry on both guard
#           lines; N67i FLIPPED -- its stata half had locked the unguarded
#           arm. .run_lines67() moved up to the harness (first caller is
#           now N65r); .run_line_k() added beside it. .run_pair66() matches
#           any intro ending "recoded/encoded variable:". Sandbox (R 4.3.3,
#           source()'d, ::: shimmed): 299/299 on the edited master; the new
#           file on the pristine 0.9.178 master reds exactly N65q, N65ag,
#           N68a, N68c-e and N69a-i. Ten-mutant map across the N65, N68 and
#           N69 headers.
# S314 EDIT (v0.9.188 then v0.9.189, 2026-09-25/26): NEW N70 section (22
#           checks) in two builds the same session. 0.9.188 locked
#           AUDIT-051 -- jconvert(to = "spss") declares a marker that only
#           a value label declares (N70a-c: code declared, report line,
#           the stata-spss-stata round trip) -- with the refusal framed by
#           LETTER, under a positional mapping (.a -> codes[1]). Jeff's
#           walk of Section 43 at 0.9.188 reopened Decision 4 Q6: a column
#           carrying .d, .n and .r has three markers, SPSS holds three
#           codes, and jconvert refused it for jstats's own assumption.
#           0.9.189 maps a column's sorted markers onto the codes in
#           LETTER ORDER, refuses only MORE markers than codes (the family's
#           count form: SPSS's limit in the heading, "the maximum SPSS
#           allows" on the widen line, letters listed with " (no cases)"),
#           and adds an always-shown NOTE that a non-leading marker set
#           returns as the leading letters. N70 now: N70d-e the column
#           with no tagged cells and the SAS form (noted); N70f collision
#           through a label-only marker (-98, its code under the new
#           mapping); N70g-h the .e cases CONVERT; N70i mnemonic .d .n .r
#           in letter order; N70j SAS case in the note; N70k plural
#           refusal; N70v " (no cases)"; N70l-o the narrowed setting (the
#           widen gate by count, two markers at two codes convert, the
#           two-problem frame, the singular); N70p na_values in letter
#           order (FLIPPED from 0.9.188's cell-order lock, deliberate);
#           N70q the jsave .sav style rider; N70s the gap set .a .c ->
#           -99, -98 (the accepted change); N70t LOCK no note for leading
#           sets; N70w the plural and mixed-style notes; N70r Rule U width.
#           N62a-c RE-PINNED twice (see the N62 header). Sandbox (R 4.3.3,
#           source()'d, ::: shimmed): 321/321 on the 0.9.189 master; the
#           new file on the 0.9.188 master reds exactly N62a-c, N70d-p,
#           N70s, N70v and N70w (19), leaving N70a-c, N70q, N70r and N70t
#           green, as it should. Fourteen mutants, each red where expected
#           and nowhere in N1-N69:
#             M1  union drops label-only markers -> N70a-b, d-g, j, l, v
#             M2  mapping in cell order          -> N70i, N70t
#             M3  note never emitted             -> N70d-e, g, i-j, m, s, w
#             M4  note singular broken           -> N70d
#             M5  widen whenever narrowed        -> N62b
#             M6  the old count heading, 3 codes -> N62c
#             M7  the rider reads cells only     -> N70q
#             M8  reduce object always plural    -> N62b-c
#             M9  no " (no cases)" mark          -> N70v, N70l
#             M10 plural note loses the and-list -> N70w
#             M11 collision skips label-only     -> N70f
#             M12 two-problem heading lowercase  -> N70n
#             M13 note loses the SAS case        -> N70e, N70j
#             M14 an unwrappable heading token   -> N62c, N70r
#           N62a, N70h, N70k, N70o, N70p and N70s are red only on the
#           0.9.188 master.
# S315 EDIT (v0.9.190, 2026-09-26): NEW N71 section (4 checks) locks the
#           jsave pair from the audit register. N71a/N71b count evaluations
#           of an expression given as jsave's data (AUDIT-052: the pre-check
#           and the resolver each evaluated it) and of a string routed to
#           the file slot under juse() (three evaluations before); N71c is
#           the register's own form, jsave(jconvert(...), ...), printing the
#           conversion notice once; N71d the registration-loss note naming
#           jnumeric/jcount/jlikert/jdummy after a jlikert() registration
#           (AUDIT-053). The section sets and clears its own juse() default
#           and likert registration. THREE HUNDRED AND TWENTY-FIVE checks.
#           MUTATION MAP (S315, sandbox, four mutants): jsave passing no
#           pre_eval reds N71a-c; the file slot evaluating the string again
#           reds N71b alone; the note back to three verbs reds N71d; the
#           resolver ignoring pre_eval reds N71a-c (and H30 H31 in
#           filter_check.R). Against the v0.9.189 master the section reds
#           all four.
# S319 EDIT (v0.9.195, 2026-09-28): NEW N72 section (48 checks) locks the
#           S314 markers item -- jrecode accepting lettered markers as OLD
#           values, jconvert(to = "spss") declaring more markers than codes
#           as a RANGE, the S318 ruling (a declared missing value moved onto
#           a code the missing-code check flags stays declared; onto one it
#           does not flag, a note with the declare pair), the D1 pair's
#           complete codes list, the folded-in mixed-column refusal, and
#           the label repairs that rode with the build. SEVEN checks
#           RE-PINNED to the band: N62a-c (the S281 codes-set refusal is
#           now a conversion at every count above one code), N70k, N70v,
#           N70l and N70n (N70v and N70n keep their "(no cases)" and
#           two-problem assertions at a ONE-code setting, the refusal that
#           remains). The N62 header is rewritten; the section keeps its
#           number and its codes-option hygiene. THREE HUNDRED AND
#           SEVENTY-THREE checks. Sandbox (R 4.3.3, source()'d, :::
#           shimmed): 373/373 on the edited master; the new file on the
#           0.9.194 master reds the seven re-pins and 44 of N72's 48 (the
#           four green there are green BY DESIGN: N72m LOCKS the unchanged
#           three-marker conversion, N72ah and N72ai lock a code that stays
#           valid on both masters, N72as is the width sweep). FIFTEEN
#           MUTANTS, each red where expected and nowhere in N1-N61 or
#           N63-N71:
#             M01 no range ever forms          -> N62a-c, N70k/l/n/v, N72a-g,
#                                                 N72j, N72k, N72n, N72o
#             M02 range direction reversed     -> N62a-c, N70k/l/v, N72a-k,
#                                                 N72n, N72o
#             M04 range note never emitted     -> N62a-c, N70k, N70l, N72b,
#                                                 N72d-f, N72n
#             M05 a range may reach 0          -> N72h, N72i
#             M06 the old widen line           -> N70v, N72l
#             M07 parser refuses marker LHS    -> N72p-u, N72w-z, N72ae, N72ar
#             M08 ruling A never declares      -> N72p, N72t, N72u, N72y,
#                                                 N72y2, N72z, N72z2, N72aa-ab
#             M09 option (b) note dropped      -> N72ac-ag
#             M10 declare lines name new codes -> N72ac, N72ad, N72ak
#             M11 fold-in removed              -> N72al
#             M12 kept markers lose labels     -> N72ap
#             M13 labels stop at a marker      -> N72s, N72aq
#             M15 convention named regardless  -> N72ac, N72ag
#             M16 one-form refusal removed     -> N72y, N72y2, N72al
#             M17 result cap removed           -> N72z
#           (M03 and M14 were planned and dropped: the band is exactly its
#           markers' codes, so a collision check over the whole range and
#           one over the codes cannot differ; and the integer-labels guard
#           has no fixture that reaches it.)
# S319 EDIT 2 (v0.9.196, 2026-09-29): jconvert's report went to the LONG
#           FORM -- one row per missing value, the name on the first row,
#           the rest hung beneath, the arrow aligned within each block, no
#           blank line between blocks -- and every declared value named
#           with its label takes the house form -99 ["Refused"], in the
#           report and in jrecode's notes (which had used -99 ("Refused")).
#           A range reads "range -99 to -95". TWENTY-FOUR checks RE-PINNED
#           to the new text, their meaning unchanged: N62a-b, N70b, N70d,
#           N70e, N70g, N70i, N70j, N70v, N70l, N70m, N70s, N72b, N72e and
#           N72n (the report, flattened), N65e, N65h, N72p, N72u, N72aa,
#           N72ab, N72ac, N72ae and N72af (the notes). N70d loses its
#           !grepl("q ()") conjunct: it guarded the old one-line entry
#           against an empty list, and the re-pinned positive -- the q row
#           with its marker -- cannot match an empty block. NEW N73
#           section (8 checks) locks the layout itself on RAW lines, in
#           all four directions. THREE HUNDRED AND EIGHTY-ONE checks.
#           Sandbox (R 4.3.3, source()'d, ::: shimmed): 381/381 on the
#           0.9.196 master; the new file on the 0.9.195 master reds exactly
#           the 24 re-pins and N73a-h (32), nothing else. EIGHT MUTANTS,
#           each red where expected and nowhere else:
#             M18 report labels back to "Refused"  -> N70b, d, e, g, i, j,
#                                                     v, l, N72b, N72n,
#                                                     N73a-f, N73h
#             M19 arrow not aligned                -> N73a-d
#             M20 one space before the arrow       -> N73a-d, N73f, N73h
#             M21 a blank line after each block    -> N73c-f
#             M22 range rows in [lo, hi] form      -> N62a-b, N70v, N70l,
#                                                     N72b, N72e, N72n,
#                                                     N73a, b, e, f
#             M23 jrecode notes back to ("Refused") -> N65e, N65h, N72p,
#                                                     N72u, N72aa-ac,
#                                                     N72ae-af, N73g
#             M24 continuation rows at a fixed 4   -> N73a-f, N73h
#             M25 "(enumerated)" back to " enumerated" -> N73b, N73f
#           M20 is the wrapper-safety lock: with one space before the arrow
#           the widest row of a block has no interior double space, so a row
#           past the width is word-filled mid-label (N73h).
# LAST VERIFIED: v0.9.196 PENDING, 2026-09-29 (S319) -- 381/381 in the
#           SANDBOX against the edited master (R 4.3.3, source()'d, :::
#           shimmed); WORKSTATION run pending Jeff's receive of the 0.9.196
#           master.
#           Prior: v0.9.195, 2026-09-28 (S319) -- 373/373 on the
#           WORKSTATION under run_all.R after receive_package()'s clean
#           devtools::check() (941 across seven), matching the sandbox.
#           Prior: v0.9.190, 2026-09-26 (S315) -- 325/325 on the WORKSTATION
#           under run_all.R after receive_package()'s clean
#           devtools::check() (846 across seven), matching the sandbox.
#           Prior: v0.9.189, 2026-09-26 (S314) -- 321/321 on the WORKSTATION
#           under run_all.R after a clean devtools::check() (821 across
#           seven), matching the sandbox.
#           Prior: v0.9.188, 2026-09-25 (S314) -- 317/317 on the WORKSTATION
#           under run_all.R after a clean devtools::check() (817 across
#           seven), matching the sandbox.
#           Prior: v0.9.187, 2026-09-25 (S313) -- 299/299 on the WORKSTATION
#           under run_all.R after a clean devtools::check() (confirmed in
#           the registry at S313; this header had lagged at 0.9.179).
#           Prior: v0.9.179 PENDING, 2026-09-21 (S308) -- 299/299 in the
#           SANDBOX against the edited master (see the S308 EDIT note);
#           WORKSTATION run pending Jeff's receive of the 0.9.179 master.
#           Prior: v0.9.175, 2026-09-20 (S304) -- 280/280 on the WORKSTATION
#           under run_all.R after a clean devtools::check(), matching the
#           sandbox.
#           Prior: v0.9.174, 2026-09-20 (S303) -- 270/270 on the WORKSTATION
#           under run_all.R (the new scoreboard) after a clean
#           devtools::check(), matching the sandbox.
#           Prior: v0.9.173, 2026-09-19 (S302) -- 263/263 on the WORKSTATION
#           under run_all.R after a clean devtools::check(), matching the
#           sandbox (R 4.3.3, source()'d, ::: shimmed as below), where the
#           pristine 0.9.172 master had first run 231/231, matching the S294
#           stamp, and the new file on that pristine master redded exactly
#           the 24 N65 checks its header names.
#           Prior: v0.9.167, 2026-09-14 (S294) -- 231/231 on the WORKSTATION
#           (see the S294 EDIT note above; no assertion changed).
#           Prior: v0.9.162, 2026-09-09 (S287) -- 231/231 on the WORKSTATION
#           (sourced from Downloads with echo = TRUE), clearing the S285
#           PENDING in the same run: that workstation pass never happened,
#           so N64 (16) and N60d (1) were both stamped here. Sandbox first,
#           same session: 231/231 on the 0.9.162 master (R 4.3.3,
#           source()'d, ::: shimmed as below); 230/230 on the 0.9.161 master
#           the same way, and 230/230 on 0.9.162 before N60d was added, so
#           the S287 master change (four leading blanks removed in
#           jdesc/jlm/jlogistic, the CPS printer's empty-frame blank) moved
#           nothing this file asserts. NEW N60d pins the S286 Rule F blank
#           on jdeclare_missing's convention-mismatch note -- the S283
#           rider's REMAINING. Discrimination: removing the S286 cat("\n")
#           reds N60d alone.
#           Prior: v0.9.160 PENDING, 2026-09-08 (S285) -- 230/230 in the
#           SANDBOX against the edited master (R 4.3.3, source()'d, :::
#           shimmed as below); the base 0.9.159 master ran 214/214 the same
#           way first, matching the S283 stamp. NEW N64 (16 checks) pins the
#           S217 fix: jfreq's Missing rows now count the pipeline pool
#           (pre_pipeline_data[surviving_ids]) instead of full-frame Step-0
#           counts, so Valid + Missing = Total under jsubset, jcomplete and
#           subset = on SPSS-form and tagged fixtures. Discrimination: the
#           new file on the PRISTINE 0.9.159 master reds exactly the twelve
#           pipeline checks (N64a-d, N64f-g, N64i-j, N64l-o) and nothing
#           else; the four-mutant map is in the N64 header. WORKSTATION
#           re-verification pending Jeff's receive of the 0.9.160 master.
#           Prior: v0.9.159, 2026-09-07 (S283) -- 214/214 on the WORKSTATION
#           (sourced from Downloads with echo = TRUE), receive_package()'s
#           devtools::check() clean. Sandbox first: 214/214 against the
#           edited master (source()'d, ::: shimmed as below). Two
#           runtime-string edits paired: the choose-first gate now echoes
#           the marker AS TYPED (it had read the parser-normalized
#           lowercase letter in all THREE homes -- jrecode, jencode, and
#           jdeclare_missing -- while the spss-conflict refusal quoted it
#           correctly), and the labels side of the raw channel, which
#           jrecode/jencode had stripped at the parse since S249, is now
#           harvested and passed to the refusal builder; plus "Mixing
#           forms is allowed." deleted from the post-declaration mismatch
#           note. N37c re-pinned to the deletion; N42e-h (4) pin the
#           uppercase echo per route; NEW N63 (4) pins the refusal side
#           of the labels channel. Discrimination: the new file on the
#           PRISTINE 0.9.158 master reds exactly N37c, N42e-h, N63a and
#           N63d; N63b and N63c pass on both by design and each reds on
#           its own one-line mutant (labels side upper-cased -> N63b
#           alone; labels overriding the map's spelling -> N63c alone).
#           Prior: v0.9.158, 2026-09-05 (S281) -- 206/206 on the WORKSTATION
#           (sourced from Downloads with echo = TRUE), receive_package()'s
#           devtools::check() clean. Sandbox first: 206/206 against the
#           edited master (source()'d, ::: shimmed to globalenv for jstats
#           and to the real namespace otherwise), after the base 0.9.157
#           master + base file ran 198/198 the same way, matching the
#           registry's S271 stamp. Two sections added: N61 (5 checks) locks the new
#           joptions("slot") mistyped-slot guard, N62 (3 checks) locks
#           jconvert's beyond-codes refusal against the codes-set length.
#           Mutation-tested one mutant per assertion (each section's header
#           records which mutant reddens which check). The new file on the
#           base master reds N61a, N61b, N62a, N62b and nothing else.
#           Registry: JStats_Testing_File_Conventions.txt.
#           Prior: v0.9.152, S271 -- 198/198 green on the WORKSTATION via
#           run_all.R (registry stamp; S277 was a comment-only token patch).
#           Prior: v0.9.150 PENDING, 2026-08-29 (S267) -- 195/195 in the
#           SANDBOX against the edited master (source()'d, ::: shimmed to
#           globalenv for jstats and to the real namespace otherwise).
#           Two passes. First, 16 checks re-pinned to the S267 MV-mvbatch
#           wording: N1a, N1b, N21, N25a, N30a, N40a, N40b, N47b, N50a,
#           N50b, N55d, N55fa-N55fc, N55h, N56b -- discrimination
#           confirmed, the re-pinned file runs RED on pristine 0.9.149 at
#           exactly those checks and nowhere else. Then the WORKSTATION
#           run of that build came back 189/189 green while carrying two
#           real defects, because nothing in the suite could see either
#           one; the N59 section (6 checks) closes both blind spots and
#           the two fixes ride with it.
#           N59 was mutation-tested against four regressions, each
#           reddening a distinct set and none passing all four:
#             M1 the shipped inert order rule (keyed to a variable that
#                is constant on this route)      -> N59b ALONE
#             M2 the pair order reversed outright -> N59a, N59b, N59c
#             M3 the Rule L indent edit reverted  -> N59d, N59e, N59f
#             M4 the intro string edited in the builder but NOT in the
#                two splice keys (the partial-edit trap: the bulk splice
#                stops matching and appends a fragment ending in a
#                literal NA)                      -> N59f ALONE
#           SECOND FOLD-IN, same session: the N60 section (3 checks) pins
#           Rule F on jdeclare_missing's two follow-on notes (drop notice,
#           mixed-marker note), both of which emitted glued to the line
#           above -- pre-existing, and found by reading the leaked stdout
#           of a 195/195 green workstation run. Mutation-tested: removing
#           the drop-notice blank reds N60a and N60c, removing the
#           mixed-note blank reds N60b alone. Suite total 198.
#           WORKSTATION re-verification pending with the 0.9.150 install.
#           Prior: v0.9.146, 2026-08-26 (S257) -- 189/189 green on the
#           WORKSTATION. S257 added the N58 section (3 checks) locking the
#           orphan pull-back's new two-part condition. The section exists
#           because the S257 change re-broke 91 of 250 wrapped units at the
#           pinned width and NONE of the then-186 checks noticed: the suite
#           was blind to the property in both directions. Mutation-tested
#           against four regressions of the condition; every one is caught
#           and no check passes under all four. The rest of the file needed
#           NO repair on that run -- the S240 atom discipline, the S244
#           flatten convention, and the property-style width assertions
#           absorbed the whole change between them.
#           Prior: v0.9.145, 2026-08-26 (S256) -- 186/186 green on the
#           WORKSTATION in a FRESH session after a restart,
#           devtools::check() clean.
#           S256 added N57a/N57b, the first checks here that measure the
#           RENDERED console surface rather than the condition, via the new
#           rendered() capture. The same pass repaired five assertions the
#           S256 chrome reserve broke by moving error line-1 breaks: N21,
#           N26b, N38a and N38c flattened via .fl(), and N38b rewritten
#           (its fits-one-line property died by arithmetic, not by wording
#           drift). .fl() moved into the harness, above all callers.
#           -- update on every green run
#
# PRIOR:    2026-08-24 (S251) -- 181/181 green on the WORKSTATION
#           (v0.9.141, library(jstats): the real namespace). S251 pinned
#           the S250 build: the N55 section (10 checks) covering the pair
#           variant's contiguous head, the prefixed byte-identity
#           contract, the D1 branch unset and set in both homes, and
#           jconvert's Rule H target line. Also FLIPPED N40b, which had
#           been RED since S250 shipped -- it asserted the ", as in SPSS"
#           clause that session's Rule H edit removed, and S250 did not
#           re-run the battery. Every new check was mutation-tested in
#           the sandbox before delivery: flipping the prefixed default
#           reds N55a (alongside N3d, N39a, N39c and N44a, which already
#           covered their own sites); reinstating the dropped clause reds
#           N40b alone; diverging the menu copy inside an if (prefixed)
#           branch reds N55b/N55c alone, and nothing else sees it.
#           Prior: 2026-08-24 (S249) -- 171/171 green on the WORKSTATION
#           (v0.9.140, library(jstats): the real namespace),
#           devtools::check() clean, four regression files run.
#           Prior: 2026-08-23 (S247) -- 171/171 green on the WORKSTATION
#           (v0.9.139, library(jstats)), devtools::check() clean. This is
#           the run that cleared the N54 section; its sandbox-only PENDING
#           note then sat stale in this header until S251 retired it.
#           Prior: 2026-08-23 (S245) -- 153/153 green on the WORKSTATION
#           (v0.9.137, library(jstats): the real namespace), devtools::
#           check() clean; the same session's sandbox run was also
#           153/153 (jstats::: shimmed against a source()'d master,
#           R 4.3.3) -- the two agreed exactly, which is useful
#           calibration for message-surface work. S245 built
#           the truthfulness pair in .jst_jrecode_convention_error: the
#           head and cap-note marker list now QUOTE the user's typed
#           case instead of recasing it, no style word is attached to a
#           quoted token, and the source sentence + remedy fork by
#           whether spss came from the per-call argument or the setting.
#           Flips: N35a/b/c/e/g (the S242 F2 assertions this supersedes
#           -- N35d and N35f unaffected and still green, which is what
#           confirms the quote/prescriptive split). New: the N52 section
#           (11 checks), including N52k, which pins the Rule U property
#           that no rendered line ends on a bare argument name -- the
#           first draft of the per-call remedy split convention from its
#           value, and only a live render caught it.
#           Prior: 2026-08-22 (S244) -- 142/142 green on the WORKSTATION
#           (v0.9.136, library(jstats): the real namespace, which is what
#           exercises jstats::: properly), devtools::check() clean; the
#           same session's earlier sandbox run was also 142/142 (jstats:::
#           shimmed against a source()'d master). This run additionally
#           gave N35-N38 (S242) their first workstation pass -- they had
#           only ever been sandbox-green. S244 built the Decision 11
#           choose-first gate (step (4)), which REPLACES the resolver's
#           level-4 SPSS fallback with a guided error -- so this session
#           both FLIPPED the old checks that asserted fallback behavior
#           and added the N39-N51 gate section. Flips: N3a/b/c/e/f gain
#           the resolver's new required act=/fn= arguments (behavior
#           unchanged at levels 1-3); N3d flips from asserting the spss
#           fallback to asserting the gate; N24a flips (the token under
#           an unset setting now gates -- its own "(spss today)" comment
#           anticipated this); N25d flips (token resolution is
#           setting-only, so an spss COLUMN does not save an unset
#           call); N30b pins an spss setting so its no-D1 intent still
#           tests something; N35f flips (the pre-gate "default render"
#           it pinned no longer exists -- the B pair replaces it). The
#           new N39-N51 section asserts every gate variant and, per the
#           S243 paste-and-rerun criterion, RUNS every offered remedy.
#           Prior: 2026-08-22 (S242) -- 98/98 green in the sandbox
#           (jstats::: shimmed against a source()'d master); workstation
#           re-run pending Jeff's next receive. N35-N38 added this
#           session with the MV read-through (F2's three-way phrasing,
#           the two Rule L recipe rewrites, the reworded no-target
#           refusal). Two harness lessons are baked into the new
#           fixtures: the nudge scans globalenv(), so .nudge() stashes
#           every other global data frame for the duration (otherwise
#           the battery's own fixtures join the scan and change which
#           frame supplies the 3+ exemplar); and the mismatch notice
#           needs THREE spss columns against the declared targets,
#           because the census uses strict plurality and returns NA on
#           a tie.
#           Prior: 2026-08-22 (S241) -- 79/79 green on the workstation
#           (v0.9.134), devtools::check() clean. N24-N34 added this
#           session with the message build bundle (the missing token,
#           D1-D7, the jsave release note); earlier labels untouched.
#           The new checks were written behind three sandbox smoke
#           suites (T1-T12 jrecode, J1-J5 jencode, D2/D5/D6 scenarios)
#           plus an eleven-case edge sweep, then re-run on the
#           workstation against the installed build -- which is what
#           exercises jstats::: through the real namespace rather than
#           a source() shim.
#           Prior: 2026-08-21 (S240) -- 47/47 green on the workstation
#           TWICE: the parity-bundle form, then the same session's mv
#           pass (Rule E/U wraps on the gate messages; N23a/N23b made
#           wrap-stable) re-run green. devtools::check() clean. N11
#           flipped + N17-N23 added this session (the jdeclare_missing
#           parity bundle).
# NOTE:     a devtools::check() run does NOT exercise this file. The S250
#           miss is the demonstration -- a message edit shipped green
#           while N40b sat red for a whole session. Run this battery in
#           the same pass as any message change.
# RUN:      source()-safe from any working directory. All output is explicit
#           cat(), so echo = TRUE is NOT required (this sidesteps the S220
#           silent-no-output trap by construction). Also runnable via
#           regression/run_all.R, which treats a stop() as FAIL.
# CONTRACT: one printed line per check, a final "RESULT: PASS (n/n)" line,
#           and stop() if and only if any check failed.
# -----------------------------------------------------------------------------
# NO DATASET -- the template's jload() call is deliberately deleted. Every
# fixture is built in-script from haven primitives. That departure from the
# S226 fixture preference order (which prefers construction via package
# functions) was originally FORCED: when this battery was written (S228),
# minting an UPPERCASE-tagged column was precisely the capability the
# package did not yet have. As of S240 jdeclare_missing mints uppercase, but the
# haven-primitive fixtures are KEPT deliberately -- a regression battery's
# fixtures should not depend on the surface under test.
#
# INTERNALS ARE CALLED THROUGH jstats::: . The sandbox original could call
# them bare because it source()d the master; a permanent file has to work
# under BOTH devtools::load_all() and library(jstats), and the .jst_* helpers
# are not exported.
#
# CHECK LABELS (N1a ... N23) are carried over verbatim from the sandbox
# battery so its output and this file's can be matched line for line. The
# numbering has gaps (no N8, no N10): those were old-vs-new comparison checks
# from battery_regression.R / battery_diffs.R and have no new-behavior
# counterpart -- the gaps are deliberate and the labels around them are
# stable (N11 is cross-referenced from the MV reference annex, the
# regression/ README, and the changelog, so checks are never renumbered).
# N12-N16 were added at S231 (the jrecode parity bundle), with their own
# sandbox battery behind them. N17-N23 were added at S240 (the jdeclare_missing
# parity bundle), the same session that flipped N11 from its documented-lag
# form to the uppercase-mint assertion. N24-N34 were added at S241 (the
# message-build bundle: the missing token, D1-D7, and the jsave release
# note), behind sandbox smoke suites T1-T12 / J1-J5 / X1-X11. N39-N51 were
# added at S244 (the choose-first gate), behind that session's 54-check
# sandbox battery; the same session flipped N3d/N24a/N25d/N35f (see LAST
# VERIFIED). The S244 section matches long gate phrases against
# newline-collapsed text (the .fl() helper) instead of hand-picking
# wrap-stable atoms -- collapsing makes ANY phrase wrap-proof, so the
# atom discipline is only needed where a check predates the helper.
# N65 (32 checks, labels N65a-N65af) was added at S302 with the jrecode
# band fix; its fixtures are inline haven primitives, since the standing
# na_range-band fixture planned at S224 was never built.
# N66 (7 checks) was added at S303 with the D1 remedy fix; its
# .run_pair66() helper harvests and runs the printed remedy lines.
# N67 (10 checks) was added at S304 with jencode's mint collision guard;
# its .run_lines67() harvests every indented line of the error.
# N68 (6 checks) and N69 (12 checks) were added at S308 with the D1 plural
# fix and the tag collision guard; N65ag rode with the rider.
# N70 (22 checks) was added at S314 with the AUDIT-051 fix (label-only
# markers in jconvert(to = "spss")) and, the same session, the letter-order
# mapping that replaced the positional rule; N62a-c were re-pinned twice.
# N72 (48 checks) was added at S319 with the markers build (markers as old
# values; the range past the codes; the S318 ruling); its Education- and
# Income-shaped fixtures are haven primitives, per the rule above.
# N73 (8 checks) was added at S319's second build (v0.9.196) with
# jconvert's long-form report and the one label form; it asserts RAW lines,
# since the layout is what it locks and .fl() erases layout.
# N81 (44 checks) was added at S339 with the Fix Slate 2 build (v0.9.213):
# jdeclare_missing()'s confirmation as the variable's resulting declaration.
# It reads stdout through printed() and compares whole lines; it sits above
# the N79 / N80 sweeps, which stay the file's last checks.
# =============================================================================

# --- Setup -------------------------------------------------------------------

# jstats must be loaded already: devtools::load_all() (development) OR
# library(jstats) (installed) -- never both in one session.
stopifnot(exists("joptions", mode = "function"))

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

# Session-option hygiene. This battery sets and clears the missing-convention
# option repeatedly. Record the entering value and restore it at the foot, so
# a run leaves the session as it found it -- run_all.R sources batteries in
# sequence, and a leaked setting would contaminate the next one. Note the
# restore is TARGETED rather than a joptions(NULL) reset: NULL resets all six
# slots, which would silently discard whatever else the user had set.
.entry_convention <- getOption(".jst_options_missing_convention")
# FORCED UNSET as well as recorded (S337): the sections below read the unset
# state, and N3d failed in a session entered with a convention set -- two
# mid-file lines put the ENTERING value back where they meant "unset". Found
# by a run entered dirty; the battery had only ever been entered clean.
options(.jst_options_missing_convention = NULL)
# The output level too (S337, the S249 item's guard (4)): sections below set
# it and clear it to the default, so a session entered at joutput("full")
# came back at "standard".
.entry_output_level <- getOption(".jst_output_level")
# The stored display settings too (S346): the diagnostics setting outlives
# a level call, so restoring the level alone would hand back a session
# without it.
.entry_output_toggles <- getOption(".jst_output_toggles")

# Message-width state (S253). The emitter now wraps every message to the
# message.width setting, so message output has become environment-dependent:
# the same message renders differently on a 90-column pane and a 64-column
# one. Every asserted phrase in this file was transcribed at 76, so pin the
# width exactly as the convention is pinned -- record what the session came
# in with, force it, restore at the foot. Belt-and-braces while the shipped
# default is still "medium" (= 76); load-bearing the moment that default
# becomes "auto" at the close of the emitter rollout.
.pin_width           <- 76L
.entry_message_width <- getOption(".jst_options_message_width")
options(.jst_options_message_width = .pin_width)

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
grab <- function(expr) {
  msgs <- character(0)
  withCallingHandlers(
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
  )
  paste(msgs, collapse = "")
}

# .seen (S337): every condition grab() takes, ONE BY ONE, with its kind and the
# message width in force -- the raw material of the sweeps at the foot
# (N79, N80). grab() returns them joined, and in a joined text the
# last line of one message and the first line of the next would read as a
# pair of lines from one wrap.
.seen <- list()
.see  <- function(kind, cnd) {
  .seen[[length(.seen) + 1L]] <<- list(
    kind = kind, text = conditionMessage(cnd),
    width = getOption(".jst_options_message_width"))
}

# printed(): the companion to grab() for output that is cat()ed rather than
# signalled -- the joptions panel is stdout, not a condition, so grab() would
# come back empty. Messages raised along the way are muffled so an incidental
# environment-scan Note cannot break up the battery's own output.
printed <- function(expr) {
  paste(suppressMessages(utils::capture.output(expr)), collapse = "\n")
}

# rendered(): the third capture, for the RENDERED condition routes -- what R
# prints on the message connection, chrome included, rather than what it
# signals. grab() strips R's own "Error : " / "Warning: " prefixes because
# it captures conditions; this helper captures the printed form, which is
# the surface the user reads. warn is forced to 1 so warning chrome lands
# inline on the line being measured. Deliberate caveat: try() renders
# "Error : " (8 columns), one wider than the top-level "Error: " (7), so a
# width assertion through rendered() is one column CONSERVATIVE -- green
# here guarantees green at the REPL. (S256)
#
# ANSI STRIP (S256, found on Jeff's first run). RStudio highlights console
# errors and warnings by wrapping them in its own escape sequences -- the
# observed forms are ESC G2; ESC H2; ... ESC h ... ESC g, which cost 10
# characters on line 1 and 2 at the end. They are ZERO-WIDTH on screen but
# nchar() counts them, so an unstripped measurement over-reads by ~10 and
# fails a line that actually fits (the first N57b run read 82 for a line
# that renders at 72). Only THIS capture is affected: grab() reads
# conditionMessage (no escapes) and printed() reads stdout (not
# highlighted), so the N52k / N56 sweeps never saw them. Under Rscript the
# escapes are absent, which is why the sandbox could not surface this --
# stripping is therefore mandatory for a check that must be true in the
# environment the user actually reads. The pattern covers RStudio's
# letter-first form and standard CSI.
.strip_ansi <- function(x) {
  gsub("\033(\\[[0-9;]*[A-Za-z]|[A-Za-z][0-9;]*)", "", x)
}

rendered <- function(expr) {
  op <- options(warn = 1L)
  on.exit(options(op), add = TRUE)
  out <- utils::capture.output(try(expr, silent = FALSE), type = "message")
  .strip_ansi(paste(out, collapse = "\n"))
}

# .fl(): newline-collapse a captured message so long phrases can be matched
# wrap-proof. Defined here in the harness (S256) rather than at its original
# N53-area site so it sits ABOVE every caller -- the S256 reserve change
# moved error line-1 breaks and turned several raw fixed-string matches into
# straddles; those assertions now flatten first.
.fl <- function(m) gsub("[ ]+", " ", gsub("\n", " ", m, fixed = TRUE))

# --- A call laid out over lines (ruling R5, S353) ----------------------------
# Since v0.9.226 a printed call wider than the message is broken after the
# commas between its arguments and the semicolons between a map's rules,
# its later lines indented four spaces past its first (.jst_layout_call()).
# .r5_open() reads a line as R does -- brackets, strings, escapes, a
# comment -- and says whether it leaves a call open. .r5_calls() gives a
# message's indented lines as the calls they print, a call laid out over
# several lines kept as ONE block of text exactly as printed, so running a
# block runs the laid-out form (the ruling's test: each re-laid call is run
# and its result compared with the one-line form's); with shape, only a
# line of that shape opens a block. .r5_flat() puts a block on one line;
# .r5_one() does it for every call in a message -- the one-line form the
# checks written before S353 pin as fragments. A message is still pinned
# WHOLE as it prints.
.r5_open <- function(s) {
  ch <- strsplit(s, "", fixed = TRUE)[[1]]
  d <- 0L; q <- ""; k <- 1L
  while (k <= length(ch)) {
    c1 <- ch[k]
    if (nzchar(q)) {
      if (c1 == "\\") k <- k + 1L else if (c1 == q) q <- ""
    } else if (c1 %in% c("\"", "'", "`")) {
      q <- c1
    } else if (c1 == "#") {
      break
    } else if (c1 %in% c("(", "[", "{")) {
      d <- d + 1L
    } else if (c1 %in% c(")", "]", "}")) {
      d <- d - 1L
    }
    k <- k + 1L
  }
  d > 0L || nzchar(q)
}
.r5_calls <- function(lines, shape = NULL) {
  out <- character(0); acc <- NULL
  for (ln in lines) {
    if (is.null(acc)) {
      if (!startsWith(ln, "  ")) next
      if (!is.null(shape) && !grepl(shape, ln)) next
      acc <- sub("^ +", "", ln)
    } else {
      acc <- paste(acc, ln, sep = "\n")
    }
    if (!.r5_open(acc)) { out <- c(out, acc); acc <- NULL }
  }
  if (!is.null(acc)) out <- c(out, acc)
  out
}
.r5_flat <- function(b) {
  paste(sub("^ +", "", strsplit(b, "\n", fixed = TRUE)[[1]]), collapse = " ")
}
.r5_one <- function(m) {
  ls <- strsplit(m, "\n", fixed = TRUE)[[1]]
  out <- character(0); i <- 1L
  while (i <= length(ls)) {
    acc <- ls[i]; j <- i
    if (startsWith(acc, "  ")) {
      while (.r5_open(acc) && j < length(ls)) {
        j <- j + 1L
        acc <- paste(acc, sub("^ +", "", ls[j]))
      }
      if (.r5_open(acc)) { acc <- ls[i]; j <- i }
    }
    out <- c(out, acc); i <- j + 1L
  }
  paste(out, collapse = "\n")
}

# .run_lines67(): every line of the message that opens with two spaces --
# a guard's remedies are its only indented lines -- evaluated in a scratch
# environment holding the frame under the name the message uses (REMEDY
# LINES ARE RUN, NOT READ, S303). Returns the frame afterwards, or NULL if
# there are no such lines or one errors. Written for N67 at S304; moved up
# here at S308 when N65r became its first caller (a helper is defined
# above every use).
.run_lines67 <- function(msg, frame_name, frame) {
  tryCatch({
    lines <- strsplit(msg, "\n", fixed = TRUE)[[1]]
    run   <- .r5_calls(lines)
    if (length(run) == 0L) return(NULL)
    e <- new.env(parent = globalenv())
    assign(frame_name, frame, envir = e)
    suppressMessages(utils::capture.output(
      for (ln in run) eval(parse(text = ln), envir = e)))
    get(frame_name, envir = e)
  }, error = function(err) NULL)
}

# .run_line_k(): the k-th indented line alone, the same way. For a message
# whose indented lines are ALTERNATIVES (the S308 tag guard prints two
# rival calls), running them in sequence would only show the last.
.run_line_k <- function(msg, k, frame_name, frame) {
  tryCatch({
    lines <- strsplit(msg, "\n", fixed = TRUE)[[1]]
    run   <- .r5_calls(lines)
    if (length(run) < k) return(NULL)
    e <- new.env(parent = globalenv())
    assign(frame_name, frame, envir = e)
    suppressMessages(utils::capture.output(
      eval(parse(text = run[k]), envir = e)))
    get(frame_name, envir = e)
  }, error = function(err) NULL)
}

# --- Fixture builders --------------------------------------------------------

mk_spss <- function() haven::labelled_spss(
  c(1, 2, -99, 3, -98), labels = c(Refused = -99, DK = -98),
  na_values = c(-99, -98))

mk_tag <- function(tags) {
  x <- c(1, 2, haven::tagged_na(tags[1]), 3, haven::tagged_na(tags[2]))
  haven::labelled(x, labels = stats::setNames(
    c(haven::tagged_na(tags[1]), haven::tagged_na(tags[2])), c("Refused", "DK")))
}

# =============================================================================
# N1 -- joptions accepts sas; panel label; capitalization
# =============================================================================

check("N1a sas accepted, panel says SAS",
      grepl("Missing-value convention: SAS-style",
            printed(joptions(missing.convention = "sas")), fixed = TRUE))

check("N1b capitalization canonicalized",
      grepl("Missing-value convention: SAS-style",
            printed(joptions(missing.convention = "SAS")), fixed = TRUE))

options(.jst_options_missing_convention = NULL)   # the forced state (S337)

# =============================================================================
# N2 -- the choice error lists all four values
# =============================================================================

check("N2 choice error lists all four", {
  e <- grab(joptions(missing.convention = "sass"))
  grepl("none", e) && grepl("spss", e) && grepl("stata", e) && grepl('"sas"', e)
})

# =============================================================================
# N3 -- the resolver ternary (per-call > column > option > default)
# =============================================================================

# S244: the resolver's signature grew required act= / fn= arguments (the
# choose-first gate needs the minting act and the caller's name to render
# its variant). N3a/b/c/e/f assert the same level 1-3 RESOLUTIONS as
# before, through the new signature.
check("N3a per-call sas",
      identical(jstats:::.jst_resolve_convention(
                  "sas", act = "codes", fn = "jdeclare_missing"), "sas"))

check("N3b per-call SAS canonicalized",
      identical(jstats:::.jst_resolve_convention(
                  "SAS", act = "codes", fn = "jdeclare_missing"), "sas"))

check("N3c column sas",
      identical(jstats:::.jst_resolve_convention(
                  NULL, column_convention = "sas",
                  act = "codes", fn = "jdeclare_missing"), "sas"))

# An ambiguous (mixed-case) column carries NA and must fall through the %in%
# without engaging the column level -- Decision 13's "do not reason from
# muddled evidence" rule, at the resolver. FLIPPED at S244: falling all the
# way through no longer lands on an spss default -- it hits the Decision 11
# choose-first gate. (Pre-S244 this check asserted the "spss" fallback.)
check("N3d column NA falls all the way through to the gate",
      grepl("no missing-value convention is selected",
            grab(jstats:::.jst_resolve_convention(
              NULL, column_convention = NA_character_,
              act = "codes", fn = "jdeclare_missing")), fixed = TRUE))

options(.jst_options_missing_convention = "sas")
check("N3e option sas",
      identical(jstats:::.jst_resolve_convention(
                  NULL, act = "codes", fn = "jdeclare_missing"), "sas"))
options(.jst_options_missing_convention = NULL)

check("N3f resolver choice error lists sas",
      grepl('"sas"', grab(jstats:::.jst_resolve_convention(
        "dta", act = "codes", fn = "jdeclare_missing"))))

# =============================================================================
# N4 -- column detection: convention by tag case, representation binary
# =============================================================================
# The architectural keystone (S226): representation stays "spss"/"stata" so
# the whole conversion / UDM-to-NA consumer family is neutralized untouched,
# while the NEW convention field carries the three-way distinction.

i_up  <- jstats:::.jst_missing_info(mk_tag(c("A", "B")))
i_lo  <- jstats:::.jst_missing_info(mk_tag(c("a", "b")))
i_mix <- jstats:::.jst_missing_info(mk_tag(c("a", "B")))
i_sp  <- jstats:::.jst_missing_info(mk_spss())

check("N4a upper -> convention sas", identical(i_up$convention, "sas"))

check("N4b upper -> representation stays stata",
      identical(i_up$representation, "stata"))

check("N4c lower -> stata/stata",
      identical(i_lo$convention, "stata") &&
        identical(i_lo$representation, "stata"))

check("N4d mixed -> representation stata, convention NA",
      identical(i_mix$representation, "stata") && is.na(i_mix$convention))

check("N4e spss -> spss/spss",
      identical(i_sp$convention, "spss") &&
        identical(i_sp$representation, "spss"))

check("N4f upper tags display true case",
      identical(i_up$codes$code, c(".A", ".B")))

# =============================================================================
# N5 -- the convention census: counts, strict plurality, unanimity
# =============================================================================

f_u <- data.frame(a = mk_spss(), b = mk_spss())
f_m <- data.frame(a = mk_spss(), b = mk_spss(), c = mk_tag(c("a", "b")))
f_s <- data.frame(a = mk_tag(c("A", "B")), b = mk_tag(c("A", "C")))
f_t <- data.frame(a = mk_spss(), c = mk_tag(c("a", "b")))
f_x <- data.frame(a = mk_spss(), b = mk_spss(), z = mk_tag(c("a", "B")))

c_u <- jstats:::.jst_convention_census(f_u)
c_m <- jstats:::.jst_convention_census(f_m)
c_s <- jstats:::.jst_convention_census(f_s)
c_t <- jstats:::.jst_convention_census(f_t)
c_x <- jstats:::.jst_convention_census(f_x)

check("N5a uniform spss: predominant+unanimous",
      identical(c_u$predominant, "spss") && isTRUE(c_u$unanimous))

check("N5b mixed majority: predominant, not unanimous",
      identical(c_m$predominant, "spss") && isFALSE(c_m$unanimous))

check("N5c uniform sas frame",
      identical(c_s$predominant, "sas") && isTRUE(c_s$unanimous))

check("N5d tie -> NA", is.na(c_t$predominant))

# The ambiguous column must be INVISIBLE to the verdict -- it counts toward
# neither predominance nor unanimity, so a frame that is otherwise uniform
# still reads as unanimous.
check("N5e mixed-case column invisible: verdict spss AND unanimous",
      identical(c_x$predominant, "spss") && isTRUE(c_x$unanimous))

check("N5f counts named vector",
      identical(c_m$counts, c(spss = 2L, stata = 1L, sas = 0L)))

check("N5g wrapper equals census verdict",
      identical(jstats:::.jst_predominant_convention(f_m), "spss"))

# =============================================================================
# N6 / N7 -- the shared tag-case and label helpers
# =============================================================================
# .jst_canonical_tag shipped deliberately CALLERLESS at S226 (the mint sites
# are must-move-together worklist bundles), so these three checks are its
# only exercise anywhere in the package. Do not drop them on the reasoning
# that nothing calls it.

check("N6a canonical tag sas -> upper",
      identical(jstats:::.jst_canonical_tag(c("a", "B"), "sas"), c("A", "B")))

check("N6b canonical tag stata -> lower",
      identical(jstats:::.jst_canonical_tag(c("A", "b"), "stata"),
                c("a", "b")))

check("N6c canonical tag spss -> lower",
      identical(jstats:::.jst_canonical_tag("A", "spss"), "a"))

check("N7 labels",
      identical(jstats:::.jst_convention_label(c("spss", "stata", "sas")),
                c("SPSS-style", "Stata-style", "SAS-style")) &&
        is.na(jstats:::.jst_convention_label(NA_character_)))

# =============================================================================
# N9 -- jconvert auto-resolve reaches the sas setting
# =============================================================================

options(.jst_options_missing_convention = "sas")
c9 <- jconvert(f_u, to = NULL)
tags9 <- unique(stats::na.omit(haven::na_tag(c9$a)))
check("N9 bare jconvert under sas setting mints uppercase",
      length(tags9) > 0 && all(tags9 %in% LETTERS))
options(.jst_options_missing_convention = NULL)

# =============================================================================
# N11 -- jdeclare_missing sas setting mints UPPERCASE (flipped S240)
# =============================================================================
# Until S240 this check asserted the documented jdeclare_missing LAG (a "sas"
# setting routed down the stata arm and minted lowercase, benignly). The
# S240 parity bundle closed the lag: ticking jdeclare_missing on the SAS PARITY
# WORKLIST annex (Decision 13, JStats_Missing_Values_Reference.txt) and
# flipping this check were the same edit. The label is stable; only the
# expectation flipped.

options(.jst_options_missing_convention = "sas")
f11 <- data.frame(v = c(1, 2, -96, 4, 5), a = mk_spss())
r11 <- tryCatch(jdeclare_missing(f11, v, codes = -96, labels = "-96=NoAnswer"),
                error = function(e) NULL)
check("N11 sas setting mints uppercase through jdeclare_missing",
      !is.null(r11) && {
        tg <- unique(stats::na.omit(haven::na_tag(r11$v)))
        length(tg) > 0 && all(tg %in% LETTERS)
      })
options(.jst_options_missing_convention = NULL)

# =============================================================================
# N12-N16 -- THE JRECODE PARITY BUNDLE (S231). jrecode's sas handling is
# live: per-call "sas", mint case through .jst_canonical_tag (the parsed
# map/labels tags canonicalized once after the convention gate), and the
# three-way convention-error targets. N11's jdeclare_missing lag is UNCHANGED
# by this bundle -- it flips with the jdeclare_missing bundle, not this one.
# =============================================================================

# N12 -- per-call "sas" accepted; else-tag mints uppercase
f12 <- data.frame(v = c(1, 2, 3, -99, 2))
r12 <- jrecode(f12, v, map = "1,2=1; 3=2; else=.a", convention = "sas")
tg12 <- unique(stats::na.omit(haven::na_tag(r12)))
check("N12 per-call sas: else mint uppercase",
      length(tg12) == 1L && identical(tg12, "A"))

# N13 -- sas SETTING: rule mint uppercase AND the tagged label re-mints to
# match (a lowercase label against an uppercase cell would silently fail
# to display -- the labels-attachment half of the mint rule)
options(.jst_options_missing_convention = "sas")
r13 <- jrecode(f12, v, map = "1,2=1; 3=2; -99=.b; else=copy",
               labels = "1=Low; 2=High; .b=Refused")
tg13 <- unique(stats::na.omit(haven::na_tag(r13)))
vl13 <- labelled::val_labels(r13)
lt13 <- haven::na_tag(vl13)
check("N13a sas setting: rule mint uppercase",
      length(tg13) == 1L && identical(tg13, "B"))
check("N13b tagged label re-minted uppercase",
      "Refused" %in% names(vl13) &&
        identical(unname(lt13[names(vl13) == "Refused"]), "B"))

# N14 -- preserve-as-loaded: an ORIGINAL column's lowercase tags survive a
# recode under a sas setting (canonical case governs minting only)
f14 <- data.frame(x = 1:4)
f14$v <- haven::labelled(c(1, 2, haven::tagged_na("a"), 2))
r14 <- jrecode(f14, v, map = "1=10; 2=20")
tg14 <- unique(stats::na.omit(haven::na_tag(r14)))
check("N14 original lowercase tags preserved under sas setting",
      length(tg14) == 1L && identical(tg14, "a"))
options(.jst_options_missing_convention = NULL)

# N15 -- token case rule, mint side: .A INPUT under stata mints lowercase
options(.jst_options_missing_convention = "stata")
r15 <- jrecode(f12, v, map = "1,2=1; 3=2; else=.A")
tg15 <- unique(stats::na.omit(haven::na_tag(r15)))
check("N15 .A input under stata mints lowercase",
      length(tg15) == 1L && identical(tg15, "a"))
options(.jst_options_missing_convention = NULL)

# N16 -- the convention error: three-way switch targets in Rule L form,
# and the Rule G echo-back (assignment to <original>R; jdeclare_missing aimed
# at the new column with modify = TRUE -- the S223 recipe defect, closed
# S231). S244: pinned to an spss SETTING -- the error used to fire under
# the unset-state spss fallback, which the choose-first gate replaced;
# at level 3 spss the render is identical, echo-back included.
options(.jst_options_missing_convention = "spss")
m16 <- grab(jrecode(f12, v, map = "1,2=1; 3=2; else=.a",
                    labels = "1=Low; 2=High; .a=Refused"))
check("N16a error offers stata target",
      grepl('  joptions(missing.convention = "stata")', m16, fixed = TRUE))
check("N16b error offers sas target",
      grepl('  joptions(missing.convention = "sas")', m16, fixed = TRUE))
# FLIPPED at S246 (Rule Y): the echo-back these two pinned is retired, so
# they now lock its ABSENCE. What replaced it is locked positively in N53.
check("N16c no rewritten call is echoed back (S246)",
      !grepl("f12$vR <- jrecode(f12, v", m16, fixed = TRUE) &&
        !grepl("equivalent recode", m16, fixed = TRUE))
check("N16d no jdeclare_missing follow-up is minted (S246)",
      !grepl("jdeclare_missing(", m16, fixed = TRUE))
options(.jst_options_missing_convention = NULL)

# =============================================================================
# N17-N23 -- THE JDECLARE_UDM PARITY BUNDLE (S240). The convention feed is
# $convention (tag-case refined; NA = ambiguous mixed column), mint case
# runs through .jst_canonical_tag per column, D4 carries the resolved
# convention, and the gate messages phrase three-way. Wording asserted
# below is verified against jstats_source.R as of the same session.
# =============================================================================

# N17 -- per-call "sas" accepted; numeric codes mint uppercase
f17 <- data.frame(v = c(1, 2, -99, 4, 5))
r17 <- jdeclare_missing(f17, v, codes = -99, convention = "sas",
                    missing.notice = FALSE)
tg17 <- unique(stats::na.omit(haven::na_tag(r17$v)))
check("N17 per-call sas mints uppercase",
      length(tg17) == 1L && identical(tg17, "A"))

# N18 -- D3 cross-case labeling: a lowercase TOKEN against an UPPERCASE
# column canonicalizes to the column's convention (Level 1 resolves sas),
# so the label lands on .A and no lowercase duplicate marker is minted
f18 <- data.frame(x = 1:5)
f18$v <- mk_tag(c("A", "B"))
r18 <- jdeclare_missing(f18, v, codes = c(Changed = ".a"), missing.notice = FALSE)
vl18 <- labelled::val_labels(r18$v)
lt18 <- haven::na_tag(vl18)
tg18 <- unique(stats::na.omit(haven::na_tag(r18$v)))
check("N18a lowercase token labels the uppercase marker",
      "Changed" %in% names(vl18) &&
        identical(unname(lt18[names(vl18) == "Changed"]), "A"))
check("N18b relabel replaced, no lowercase duplicate minted",
      !"Refused" %in% names(vl18) && all(tg18 %in% LETTERS))

# N19 -- the mixed-marker consequential note: a column that ARRIVED mixed
# completes the call (sign-off 2 skips the ambiguous column) and the note
# names both sides and the collapse remedy in this call's resolved
# convention
f19 <- data.frame(x = 1:4)
f19$v <- haven::labelled(c(1, haven::tagged_na("a"), haven::tagged_na("B"), 2))
out19 <- printed(jdeclare_missing(f19, v, codes = c(New = ".c"),
                              convention = "stata"))
# S345 (the S247 item, part (1)): the note counts CELLS. Until 0.9.218 it
# read the value labels too and listed .c, which this call had only labeled.
check("N19a mixed-marker note names both sides, by the markers the cells carry",
      grepl("carries both Stata-style (.a) and SAS-style (.B)",
            out19, fixed = TRUE))
check("N19b note remedy follows the resolved convention",
      grepl('jconvert(f19, vars = "v", to = "stata", modify = TRUE)',
            out19, fixed = TRUE))

# N20 -- sign-off 2 wording is three-way: an UPPERCASE column refused a
# conflicting per-call convention says SAS-style
f20 <- data.frame(x = 1:5)
f20$v <- mk_tag(c("A", "B"))
m20 <- grab(jdeclare_missing(f20, v, codes = -99, convention = "spss"))
check("N20 conflict gate says SAS-style on an uppercase column",
      grepl("already carries SAS-style missing values", m20, fixed = TRUE))

# N21 -- ambiguous column resolved spss refuses (the both-representations
# guard). S244: pinned to an spss SETTING -- pre-gate, the unset default
# resolved spss and reached this guard; now an unset call gates first
# (see N39/N42), so the guard is reached through a set or per-call spss.
options(.jst_options_missing_convention = "spss")
f21 <- data.frame(x = 1:4)
f21$v <- haven::labelled(c(1, haven::tagged_na("a"), haven::tagged_na("B"), 2))
m21 <- grab(jdeclare_missing(f21, v, codes = -99))
check("N21 spss resolution on a mixed column refuses, naming the markers its cells carry (S355: one vocabulary with the mixed-marker note)",
      grepl("carries both Stata-style (.a) and SAS-style (.B) missing values",
            .fl(m21), fixed = TRUE) &&
        grepl("which SPSS convention cannot act on", .fl(m21),
              fixed = TRUE))
options(.jst_options_missing_convention = NULL)

# N22 -- Tier 2: the D4 cap message is convention-true under sas
options(.jst_options_missing_convention = "sas")
f22 <- data.frame(v = c(1, 2, 3))
m22 <- grab(jdeclare_missing(f22, v, codes = -(100:126)))
check("N22 cap message says SAS convention and .A-.Z",
      grepl("under SAS convention with numeric codes", m22, fixed = TRUE) &&
        grepl("(mapped to .A-.Z)", m22, fixed = TRUE))
options(.jst_options_missing_convention = NULL)

# N23 -- Tier 3: the plain-column token refusal phrases SAS under a sas
# setting, and its remedies are gate-ready (carry an explicit convention).
# Assertions are WRAP-STABLE atoms (single unbreakable words / protected
# quoted phrases): the message is Rule-U width-wrapped at build time, so
# a multi-word phrase can straddle a line break and a fixed-string match
# on it would be fragile to any wording-length change upstream.
options(.jst_options_missing_convention = "sas")
f23 <- data.frame(v = c(1, 2, 3, 4))
m23 <- grab(jdeclare_missing(f23, v, codes = ".a"))
# Re-pinned S357 (Fix Slate W2, the S355 item): the refusal names the
# family as missing values, never "tokens" or "tagged missings", and opens
# on the variable's name alone (Rule T).
check("N23a plain-column refusal names SAS-style missing values (no \"tokens\", no \"tagged missings\")",
      startsWith(m23, "jdeclare_missing(): v has no lettered markers to label.\n") &&
        grepl("SAS-style missing values", .fl(m23), fixed = TRUE) &&
        !grepl("token", m23, fixed = TRUE) &&
        !grepl("tagged missings", m23, fixed = TRUE))
check("N23b remedies carry the convention (gate-ready)",
      grepl('"-99=.A"', m23, fixed = TRUE) &&
        grepl("c(-99),", m23, fixed = TRUE) &&
        grepl('"sas"', m23, fixed = TRUE))
options(.jst_options_missing_convention = NULL)

# =============================================================================
# N24 -- the missing token: one map string, three conventions (S241)
# =============================================================================
# Fixture: a plain numeric column; the token's mint is judged by what lands
# on the result. Wrap-stable atoms throughout (the S240 coupled convention).

f24 <- data.frame(v = c(1, 2, 8, 2, 1, 8, NA))

# FLIPPED at S244: the unset state no longer falls back to spss -- the
# token gates with the full choose-first menu. (The pre-S244 form of this
# check carried "(spss today)" on its own options line, anticipating
# exactly this flip.) The spss MINT itself is asserted under an explicit
# spss setting in N39c below and in the gate section's rerun checks.
options(.jst_options_missing_convention = NULL)
m24a <- grab(jrecode(f24, v, map = "8=missing; else=copy"))
check("N24a token under an unset setting gates (choose-first)",
      grepl("the 'missing' target cannot be applied",
            gsub("\n", " ", m24a, fixed = TRUE), fixed = TRUE))

options(.jst_options_missing_convention = "stata")
r24b <- suppressMessages(jrecode(f24, v, map = "8=missing; else=copy"))
check("N24b token mints .a under a stata setting",
      sum(haven::na_tag(unclass(r24b)) == "a", na.rm = TRUE) == 2L)

options(.jst_options_missing_convention = "sas")
r24c <- suppressMessages(jrecode(f24, v, map = "8=missing; else=copy"))
check("N24c token mints .A under a sas setting",
      sum(haven::na_tag(unclass(r24c)) == "A", na.rm = TRUE) == 2L)

options(.jst_options_missing_convention = "stata")
r24d <- suppressMessages(jrecode(f24, v, map = "8=missing; else=copy",
                                 convention = "spss"))
check("N24d per-call convention beats the setting",
      identical(as.numeric(attr(r24d, "na_values")), -99))

# =============================================================================
# N25 -- the set-but-contradicted teach-gate (D7) and its two escapes
# =============================================================================

f25 <- data.frame(v = haven::labelled_spss(c(1, 2, 8, 2, 1, 8, NA),
                                           na_values = -99))
options(.jst_options_missing_convention = "stata")
m25 <- grab(jrecode(f25, v, map = "8=missing; else=copy"))
check("N25a D7 fires on an spss column under an explicit stata setting",
      grepl("ambiguous", m25, fixed = TRUE) &&
        grepl("SPSS-style", m25, fixed = TRUE) &&
        grepl('setting is "stata"', m25, fixed = TRUE))
check("N25b D7 remedies: per-call escape and the frame conversion",
      grepl('"spss")', m25, fixed = TRUE) &&
        grepl("jconvert(", m25, fixed = TRUE) &&
        grepl('"stata",', m25, fixed = TRUE))
r25c <- suppressMessages(jrecode(f25, v, map = "8=missing; else=copy",
                                 convention = "spss"))
check("N25c the per-call escape runs and follows the column",
      identical(as.numeric(attr(r25c, "na_values")), -99))
# FLIPPED at S244: token resolution is SETTING-ONLY (per-call, then the
# joptions setting) -- the source column's form never silently decides.
# So an spss COLUMN does not save an unset call from the choose-first
# gate: pre-S244 the spss fallback happened to match the column and the
# call minted -99; now the user is asked to choose. (Choosing spss and
# rerunning reproduces the old result; choosing stata leads to the D7
# teach-gate -- two guided errors in sequence, by design.)
options(.jst_options_missing_convention = NULL)
m25d <- grab(jrecode(f25, v, map = "8=missing; else=copy"))
check("N25d an unset setting on an spss column: the choose-first gate",
      grepl("the 'missing' target cannot be applied",
            gsub("\n", " ", m25d, fixed = TRUE), fixed = TRUE))

# =============================================================================
# N26 -- the spss arm: benign reuse and the cap gate (D3)
# =============================================================================

options(.jst_options_missing_convention = "spss")
m26a <- grab(jrecode(f25, v, map = "8=missing; else=copy"))
check("N26a benign reuse: the already-declared variant of the note",
      grepl("already", m26a, fixed = TRUE) &&
        grepl("declaration.", m26a, fixed = TRUE))

f26 <- data.frame(v = haven::labelled_spss(c(1, 2, 8, 2, 1, 8, NA),
                                           na_values = c(-1, -2, -3)))
m26b <- grab(jrecode(f26, v, map = "8=missing; else=copy"))
check("N26b D3 cap error names the slate and the fourth",
      grepl("fourth.", .fl(m26b), fixed = TRUE) &&
        grepl("(-1, -2, -3)", .fl(m26b), fixed = TRUE))
check("N26c D3 remedies: declared-code swap and the re-declare",
      grepl('"8=-1;', m26b, fixed = TRUE) &&
        grepl("c(-1, -2),", m26b, fixed = TRUE))
r26d <- suppressMessages(jrecode(f26, v, map = "8=-1; else=copy"))
check("N26d recoding into a declared code carries the declaration",
      -1 %in% as.numeric(attr(r26d, "na_values")))

# =============================================================================
# N27 -- NA=missing: the row-4 note yields to the token's own note (D4)
# =============================================================================

m27 <- grab(jrecode(f24, v, map = "NA=missing; else=copy"))
check("N27a NA=missing declares the mint and confirms it",
      grepl("missing.convention.codes", m27, fixed = TRUE) &&
        grepl("declared", m27, fixed = TRUE))
check("N27b the row-4 declare-it remedy stays silent for the token",
      !grepl("Declare -99 with jdeclare_missing()", m27, fixed = TRUE))

# =============================================================================
# N28 -- labels missing=Label: attach and the no-target refusal
# =============================================================================

r28 <- suppressMessages(jrecode(f24, v, map = "8=missing; else=copy",
                                labels = "missing=Refused"))
l28 <- labelled::val_labels(r28)
check("N28a labels missing=Refused lands on the minted code",
      identical(as.numeric(l28[names(l28) == "Refused"]), -99))
m28 <- grab(jrecode(f24, v, map = "8=7; else=copy",
                    labels = "missing=Refused"))
check("N28b labels missing without a map target is refused (S355: the token quoted)",
      grepl("labels names 'missing'", m28, fixed = TRUE) &&
        grepl("'8=missing'),", m28, fixed = TRUE))

# =============================================================================
# N29 -- jencode: the token on a fresh column; blank=missing composes
# =============================================================================

f29 <- data.frame(w = c("Yes", "No", "Refused", "Yes", "", NA),
                  stringsAsFactors = FALSE)
r29a <- suppressMessages(jencode(f29, w,
                                 map = "Yes=1; No=0; Refused=missing; blank=9"))
check("N29a jencode token mints and declares on the fresh column",
      identical(as.numeric(attr(r29a, "na_values")), -99) &&
        identical(as.numeric(unclass(r29a))[3], -99))
m29b <- grab(jencode(f29, w, map = "Yes=1; No=0; Refused=missing; blank=9"))
check("N29b jencode D4 says encoded, not recoded",
      grepl("encoded", m29b, fixed = TRUE) &&
        !grepl("recoded variable", m29b, fixed = TRUE))
r29c <- suppressMessages(jencode(f29, w,
                                 map = "Yes=1; No=0; Refused=2; blank=missing"))
check("N29c blank=missing composes",
      identical(as.numeric(unclass(r29c))[5], -99) &&
        identical(as.numeric(attr(r29c, "na_values")), -99))
options(.jst_options_missing_convention = "sas")
r29d <- suppressMessages(jencode(f29, w,
                                 map = "Yes=1; No=0; Refused=missing; blank=9"))
check("N29d jencode token mints .A under a sas setting",
      identical(haven::na_tag(unclass(r29d))[3], "A"))
options(.jst_options_missing_convention = NULL)

# =============================================================================
# N30 -- the map-target mint note (D1) and its token exclusion
# =============================================================================

m30a <- grab(jrecode(f24, v, map = "8=-99; else=copy"))
check("N30a D1 fires on a plain suspicious target, token-first remedy",
      grepl("recoded", m30a, fixed = TRUE) &&
        grepl('"8=missing;', m30a, fixed = TRUE) &&
        grepl("as missing on the recoded variable:", .fl(m30a), fixed = TRUE) &&
        grepl("jdeclare_missing(f24, vR, codes = c(-99), modify = TRUE)",
              m30a, fixed = TRUE))
# S303: the second remedy's pin moved from the S267 assignment form on the
# SOURCE column ("<- jdeclare_missing(" over v) to the pair's declare line
# on the RESULT; N66 covers the pair in full.
# S244: pinned to an spss setting -- under the unset state the token now
# gates before minting, which would make this no-D1 assertion vacuously
# true (the gate error also lacks the D1 phrase). The intent (a
# SUCCESSFUL token mint draws no D1) needs the mint to happen.
options(.jst_options_missing_convention = "spss")
m30b <- grab(jrecode(f24, v, map = "8=missing; else=copy"))
check("N30b no D1 for the token's own mint",
      !grepl("looks like a coded missing value", m30b, fixed = TRUE))
options(.jst_options_missing_convention = NULL)

# =============================================================================
# N31 -- jdeclare_missing's column-vs-option override note (D2)
# =============================================================================

f31 <- data.frame(inc = haven::labelled_spss(c(100, 200, -99, 300),
                                             na_values = -99),
                  age = c(30, 40, 50, 60))
options(.jst_options_missing_convention = "stata")
m31a <- printed(jdeclare_missing(f31, inc, codes = c(-99, -98)))
check("N31a D2 fires when the column form overrode an explicit setting",
      grepl("missing.convention", m31a, fixed = TRUE) &&
        grepl("jconvert(", m31a, fixed = TRUE) &&
        grepl('"spss")', m31a, fixed = TRUE))
options(.jst_options_missing_convention = NULL)
m31b <- printed(jdeclare_missing(f31, inc, codes = c(-99, -98)))
check("N31b D2 silent when no setting was chosen",
      !grepl("missing.convention setting", m31b, fixed = TRUE))
options(.jst_options_missing_convention = "stata")
m31c <- printed(jdeclare_missing(f31, inc, codes = c(-99, -98),
                             convention = "spss"))
check("N31c D2 silent when a per-call convention answered the question",
      !grepl("missing.convention setting", m31c, fixed = TRUE))
options(.jst_options_missing_convention = NULL)

# =============================================================================
# N32 -- jlogistic's suspected-code DV error (D5): two remedies
# =============================================================================

f32 <- data.frame(dv = c(rep(0, 10), rep(1, 10), rep(-99, 3)),
                  x  = c(rnorm(23)))
m32 <- grab(jlogistic(dv ~ x, data = f32))
check("N32a D5 head keeps the 0/1 requirement",
      grepl("coded 0/1.", m32, fixed = TRUE))
check("N32b D5 remedies: declare first, convert second",
      grepl("jdeclare_missing(", m32, fixed = TRUE) &&
        grepl("modify = TRUE)", m32, fixed = TRUE) &&
        grepl('"-99=NA;', m32, fixed = TRUE))

# =============================================================================
# N33 -- jsave's release note (D6): fires and stays silent by design
# =============================================================================

f33 <- data.frame(
  inc = haven::labelled_spss(c(100, 200, -99, 300, 150, 210),
                             na_values = -99),
  edu = c(12, 16, -99, 14, 12, 18),
  age = c(30, 40, 50, 60, 35, 45))
p33 <- file.path(tempdir(), "jstats_n33.sav")
m33a <- grab(jsave(f33, p33, overwrite = TRUE))
check("N33a D6 fires: stray named, evidence cited, resave pair",
      grepl("not declared as missing", m33a, fixed = TRUE) &&
        grepl("ordinary", m33a, fixed = TRUE) &&
        grepl("overwrite = TRUE)", m33a, fixed = TRUE))
f33b <- f33[, c("edu", "age")]
m33b <- grab(jsave(f33b, p33, overwrite = TRUE))
check("N33b D6 silent when the frame declares nothing",
      !grepl("not declared as missing", m33b, fixed = TRUE))
p33c <- file.path(tempdir(), "jstats_n33.csv")
m33c <- grab(jsave(f33, p33c, overwrite = TRUE))
check("N33c D6 silent on a format with no declaration slot",
      !grepl("not declared as missing", m33c, fixed = TRUE))
m33d <- grab(jsave(f33, p33, overwrite = TRUE, preserve.declarations = FALSE))
check("N33d D6 silent under preserve.declarations = FALSE (no evidence as written)",
      !grepl("not declared as missing", m33d, fixed = TRUE))
unlink(c(p33, p33c))

# =============================================================================
# N34 -- the formalize ride-along ([AMERICAN-ENGLISH])
# =============================================================================

check("N34 jconvert carries no British formalise",
      !any(grepl("formalise", deparse(jstats:::jconvert), fixed = TRUE)))

# =============================================================================
# N35-N38 -- THE MV READ-THROUGH (S242). Audit finding F2 (the convention
# error phrases in the user's tagged convention) plus the three accepted mv
# rewrites: the joptions nudge and the post-declaration mismatch notice gain
# runnable Rule L recipes, and the no-target refusal is reworded to survive
# Rule U's orphan pull-back. Wording asserted below is verified against
# jstats_source.R as of the same session. Per the S240 coupled convention,
# assertions use WRAP-STABLE ATOMS -- short fragments no width-wrap can
# straddle -- never multi-word phrases spanning a possible break.
# =============================================================================

# N35 -- F2: the convention error phrases by convention. The reachable path
# is a sas (or stata) SETTING with a per-call convention = "spss" tripping
# the gate.
# SUPERSEDED IN PART at S245. F2 made style word AND token case follow the
# phrasing convention. S245 keeps that for PRESCRIPTIVE positions (the
# rebuilt map's unsubstituted tokens, N35d) but not for QUOTES of the call:
# the head and the cap note's marker list now echo the letter AS TYPED,
# because input case is accepted either way (Decision 13) and recasing a
# quote misreads the call in both directions. The style word is gone from
# the token entirely -- attaching "SAS-style" to a typed '.a' equates two
# spellings a reader sees as different -- and the surface-form contrast
# (lettered markers vs numeric codes) moved to the conflict sentence.
# N35a/b/c/e/g flipped here; N35d and N35f unchanged and still green.
f35 <- data.frame(v = c(1, 2, 3, 3, 2, 1))

options(.jst_options_missing_convention = "sas")
m35s <- grab(jrecode(f35, v, map = "1,2=1; 3=2; else=.a",
                     labels = "1=Low; 2=High; .a=Refused",
                     convention = "spss"))
check("N35a sas setting: no style word on the quoted token (S245)",
      grepl("a missing-value marker.", m35s, fixed = TRUE) &&
        !grepl("-style missing-value", m35s, fixed = TRUE))
check("N35b sas setting: token quotes as typed, not recased (S245)",
      grepl("uses '.a'", m35s, fixed = TRUE) &&
        !grepl("uses '.A'", m35s, fixed = TRUE))

# The cap arithmetic must stay on the lowercase parsed letters while the
# DISPLAY goes uppercase -- including leftover tokens echoed in the map.
m35c <- grab(jrecode(f35, v, map = "1=.a; 2=.b; 3=.c; -99=.d; NA=.e",
                     convention = "spss"))
# FLIPPED at S246: the cap note and the rebuilt map went with the echo-back.
# N35c keeps the S245 quote property, which survives in the head; N35d locks
# the retirement.
check("N35c sas setting: the head still quotes as typed (S245, S246)",
      grepl("uses '.a'", m35c, fixed = TRUE) &&
        !grepl("uses '.A'", m35c, fixed = TRUE))
check("N35d sas setting: no cap note and no rebuilt map survive (S246)",
      !grepl("lettered markers", m35c, fixed = TRUE) &&
        !grepl("-99=.D", m35c, fixed = TRUE))

options(.jst_options_missing_convention = "stata")
m35t <- grab(jrecode(f35, v, map = "1,2=1; 3=2; else=.a", convention = "spss"))
check("N35e stata setting: token unchanged, style word gone (S245)",
      grepl("uses '.a'", m35t, fixed = TRUE) &&
        !grepl("-style missing-value", m35t, fixed = TRUE))

# FLIPPED at S244: the "default render" this check pinned (the
# convention error under the unset-state spss fallback) no longer
# exists -- literal tagged spellings under an unset setting now draw
# the choose-first PAIR (stata/sas, no spss line: the paste-and-rerun
# test fails under spss). The F2 phrasing property itself is still
# locked by N35a-e/g, which reach the convention error through set or
# per-call conventions.
options(.jst_options_missing_convention = NULL)
m35d <- grab(jrecode(f35, v, map = "1,2=1; 3=2; else=.a",
                     labels = "1=Low; 2=High; .a=Refused"))
check("N35f unset tagged spellings draw the choose-first pair",
      grepl("the '.a' marker cannot be applied",
            gsub("\n", " ", m35d, fixed = TRUE), fixed = TRUE) &&
        !grepl('joptions(missing.convention = "spss")', m35d, fixed = TRUE))
check("N35g jencode inherits the S245 quote rule (shared builder)",
      {
        options(.jst_options_missing_convention = "sas")
        f35e <- data.frame(r = c("yes", "no", "maybe"))
        me <- grab(jencode(f35e, r, map = "yes=1; no=0; maybe=.a",
                           convention = "spss"))
        options(.jst_options_missing_convention = NULL)
        grepl("uses '.a'", me, fixed = TRUE) &&
          !grepl("-style missing-value", me, fixed = TRUE)
      })

# N36 -- R1: the joptions nudge carries runnable jconvert() lines, capped at
# two per Rule U's repeated-remedy rule (one / run both / one exemplar).
.mk_spss_df <- function() {
  d <- data.frame(v = c(1, 2, -99))
  d$v <- haven::labelled_spss(d$v, na_values = -99)
  d
}
# The nudge scans globalenv(), so the battery's OWN fixtures would join the
# scan and change which frames are named (and therefore which one supplies
# the 3+ exemplar). Stash every existing global data frame for the duration
# and restore it afterwards, so each case sees only its own frames.
.nudge <- function(frames, target = "stata") {
  g      <- globalenv()
  others <- Filter(function(nm) is.data.frame(get(nm, envir = g,
                                                 inherits = FALSE)),
                   ls(envir = g))
  stash  <- mget(others, envir = g)
  rm(list = others, envir = g)
  on.exit({
    rm(list = intersect(frames, ls(envir = g)), envir = g)
    list2env(stash, envir = g)
    options(.jst_options_missing_convention = NULL)   # the forced state (S337)
  }, add = TRUE)
  for (nm in frames) assign(nm, .mk_spss_df(), envir = g)
  paste(utils::capture.output(joptions(missing.convention = target)),
        collapse = "\n")
}

n36a <- .nudge("zz_one")
check("N36a one frame: 'run:' intro and a single runnable call",
      grepl("run:", n36a, fixed = TRUE) &&
        grepl('  jconvert(zz_one, to = "stata", modify = TRUE)', n36a,
              fixed = TRUE))

n36b <- .nudge(c("zz_a", "zz_b"))
check("N36b two frames: 'run both:' and one call each",
      grepl("run both:", n36b, fixed = TRUE) &&
        grepl('  jconvert(zz_a, to = "stata", modify = TRUE)', n36b,
              fixed = TRUE) &&
        grepl('  jconvert(zz_b, to = "stata", modify = TRUE)', n36b,
              fixed = TRUE))

n36c <- .nudge(c("zz_p", "zz_q", "zz_r"))
check("N36c three frames: the repetition is named, not enumerated",
      grepl("one call per data frame:", n36c, fixed = TRUE) &&
        sum(gregexpr("  jconvert(", n36c, fixed = TRUE)[[1]] > 0) == 1L)
check("N36d three frames: the exemplar uses the first named frame",
      grepl('  jconvert(zz_p, to = "stata", modify = TRUE)', n36c,
            fixed = TRUE))

# N37 -- R2: the post-declaration mismatch notice gains a runnable remedy
# with a vars = argument; singular takes a bare string, plural takes c(...).
# THREE spss columns, not two: the census uses STRICT plurality and returns
# NA on a top-count tie, so a 2-spss / 2-stata frame has no predominant form
# and the notice correctly stays silent. The spss side must outnumber the
# declared targets for the mismatch to exist at all.
.mk_mismatch <- function(vars) {
  d <- data.frame(a = 1:5, b = 1:5, c = 1:5)
  for (nm in c("a", "b", "c")) {
    d[[nm]] <- haven::labelled_spss(as.numeric(d[[nm]]), na_values = -99)
  }
  for (nm in vars) d[[nm]] <- c(1, 2, -99, 4, 5)
  d
}
d37 <- .mk_mismatch("Income")
n37a <- paste(utils::capture.output(
  jdeclare_missing(d37, Income, codes = -99, convention = "stata")),
  collapse = "\n")
check("N37a singular: full locked term on first mention",
      grepl("Income uses Stata-style missing values", n37a, fixed = TRUE))
check("N37b singular: bare vars string, no c() wrapper",
      grepl('vars = "Income", to = "spss", modify = TRUE)', n37a, fixed = TRUE))
# S283: "Mixing forms is allowed." DELETED (Jeff's read at the S282 walk:
# unnecessary). The note now runs straight from the mismatch sentence to
# the remedy intro, so the pin is the adjacency plus the absence of both
# the deleted sentence and the older hedge it once replaced.
check("N37c no reassurance sentence: mismatch runs straight to the remedy",
      !grepl("Mixing forms is allowed.", n37a, fixed = TRUE) &&
        !grepl("if desired", n37a, fixed = TRUE) &&
        grepl("are SPSS-style. To align Income with the rest, run:",
              .fl(n37a), fixed = TRUE))

d37b <- .mk_mismatch(c("Income", "Age"))
n37d <- paste(utils::capture.output(
  jdeclare_missing(d37b, Income, Age, codes = -99, convention = "stata")),
  collapse = "\n")
check("N37d plural: c() vars vector and the plural verb",
      grepl('vars = c("Income", "Age"), to = "spss", modify = TRUE)', n37d,
            fixed = TRUE) &&
        grepl("use Stata-style missing values", n37d, fixed = TRUE))

# N38 -- message 3: the no-target refusal drops the redundant "missing" so
# Rule U's orphan pull-back cannot split "no missing / target", and BOTH
# homes wrap their second sentence (the jencode home ran to 82 characters).
f38 <- data.frame(v = c(1, 2, 8))
m38r <- grab(jrecode(f38, v, map = "8=7; else=copy", labels = "missing=Refused"))
check("N38a jrecode home: the reworded refusal, no stray 'missing target'",
      grepl("no target for it", .fl(m38r), fixed = TRUE) &&
        !grepl("no missing target", .fl(m38r), fixed = TRUE))
# N38b REWRITTEN at S256. The original pinned the whole first sentence to
# LINE 1; the S256 chrome reserve narrows an error's first-line body
# allowance by 8, and at 65 characters the sentence no longer fits it, so
# the fits-one-line form of the property is dead by arithmetic, not by
# wording drift. What the S24x reword actually secured -- the refusal never
# renders the "no missing target" misread -- is N38a's half; this half now
# locks the sentence ARRIVING WHOLE in the render (wrap-proof via .fl).
# S355 (the S256 item, Fix Slate W1): "to label" dropped and the token
# quoted -- the sentence now fits one line under the reserve.
check("N38b jrecode home: the refusal sentence arrives whole",
      grepl("labels names 'missing', but the map has no target for it.",
            .fl(m38r), fixed = TRUE))

f38e <- data.frame(r = c("yes", "no"))
m38e <- grab(jencode(f38e, r, map = "yes=1; no=0", labels = "missing=Refused"))
check("N38c jencode home: same rewording",
      grepl("no target for it", .fl(m38e), fixed = TRUE) &&
        !grepl("no missing target", .fl(m38e), fixed = TRUE))
check("N38d both homes wrap within Rule U's width",
      max(nchar(strsplit(m38e, "\n", fixed = TRUE)[[1]])) <= 78L &&
        max(nchar(strsplit(m38r, "\n", fixed = TRUE)[[1]])) <= 78L)

# =============================================================================
# =============================================================================
# N39-N51 -- THE CHOOSE-FIRST GATE (S244; Decision 11 step (4)). The
# resolver's level-4 spss fallback is replaced by a guided error: with no
# convention selected anywhere, a minting act stops and asks. Variants are
# assigned per SPELLING by the paste-and-rerun test (Rule V, S243): the
# full three-option menu for numeric codes and the missing-token family
# (A), the stata/sas pair for literal tagged spellings (B), the single
# per-call fix line for a range (C); the range-vs-tagged-convention
# conflicts (D setting-level, E per-call) are DATA-AWARE (two-step recipe
# under the 26-value cap, the count line over it); jconvert's to=NULL
# error is harmonized to the same form (F); and jscreen carries the
# SPSS-live-codes steering line (G). Texts are the S243 approved sheet.
# Long phrases are matched against newline-collapsed text via .fl() --
# wrap-proof by construction, superseding atom-picking for this section.
# Per the paste-and-rerun criterion, every offered remedy is also RUN.
# (.fl() itself moved to the check harness at S256, above all callers.)
# =============================================================================

.has_menu3 <- function(m) {
  grepl('joptions(missing.convention = "stata")', m, fixed = TRUE) &&
    grepl('joptions(missing.convention = "spss")', m, fixed = TRUE) &&
    grepl('joptions(missing.convention = "sas")', m, fixed = TRUE) &&
    grepl(".Rprofile", m, fixed = TRUE)
}
.has_pair <- function(m) {
  grepl('joptions(missing.convention = "stata")', m, fixed = TRUE) &&
    grepl('joptions(missing.convention = "sas")', m, fixed = TRUE) &&
    !grepl('joptions(missing.convention = "spss")', m, fixed = TRUE) &&
    grepl(".Rprofile", m, fixed = TRUE)
}

f39  <- data.frame(v = c(1, 2, 8, 2, 1, 8, NA))
f39t <- data.frame(w = c("Yes", "No", "Refused", "Yes", "", NA),
                   stringsAsFactors = FALSE)

# --- N39: variant A, the full menu, across its spellings and homes -----------
options(.jst_options_missing_convention = NULL)

m39a <- grab(jrecode(f39, v, map = "8=missing; else=copy"))
check("N39a jrecode token gates: head + full menu",
      grepl(paste0("jrecode(): no missing-value convention is selected, ",
                   "so the 'missing' target cannot be applied."),
            .fl(m39a), fixed = TRUE) && .has_menu3(m39a))

check("N39b NA=missing and the jencode tokens gate identically",
      .has_menu3(grab(jrecode(f39, v, map = "NA=missing; else=copy"))) &&
        .has_menu3(grab(jencode(f39t, w,
                                map = "Yes=1; No=0; Refused=missing"))) &&
        .has_menu3(grab(jencode(f39t, w,
                                map = "Yes=1; No=0; Refused=2; blank=missing"))))

m39c <- grab(jdeclare_missing(f39, v, codes = c(-99)))
check("N39c jdeclare_missing codes gate: 'these codes cannot be declared'",
      grepl(paste0("jdeclare_missing(): no missing-value convention is ",
                   "selected, so these codes cannot be declared."),
            .fl(m39c), fixed = TRUE) && .has_menu3(m39c))

check("N39d the labels-only numeric form shares the codes head",
      grepl("these codes cannot be declared.",
            .fl(grab(jdeclare_missing(f39, v, labels = "-99=Refused"))),
            fixed = TRUE))

# --- N40: menu anatomy (the S240 drafts, verbatim) ---------------------------
check("N40a stata line carries the recommendation copy",
      grepl("Lowercase markers behave as true NAs in base R.", m39a,
            fixed = TRUE) &&
        grepl("Recommended if you also run base R or AI-generated code.",
              .fl(m39a), fixed = TRUE))
# FLIPPED S251 (Rule H, shipped S250): ", as in SPSS" was dropped -- the
# option line above is joptions(missing.convention = "spss"), so the clause
# echoed a fact two characters old. This check asserted the OLD clause and
# was therefore red from the moment the edit shipped; S250 did not re-run
# the battery. The negative guard is the point of the flip: it fails if the
# clause is ever reinstated.
check("N40b spss line is the contrastive pair (Rule H, S250)",
      grepl("Codes stay visible numbers; jstats treats them as missing.",
            .fl(m39a), fixed = TRUE) &&
        grepl("Base R does not.", m39a, fixed = TRUE) &&
        !grepl("as in SPSS", m39a, fixed = TRUE))
check("N40c sas line brief; permanence line closes; width held",
      grepl("Like Stata, with uppercase markers (.A-.Z).", m39a,
            fixed = TRUE) &&
        grepl("To make the choice permanent, put the same line in your .Rprofile.",
              m39a, fixed = TRUE) &&
        max(nchar(strsplit(m39a, "\n", fixed = TRUE)[[1]])) <= 78L)

# --- N41: A paste-and-rerun -- every offered option unblocks the call --------
f41 <- data.frame(v = c(1, 2, -99, 2, -99, 3))   # -99 cells for the declare
for (.cv in c("spss", "stata", "sas")) {
  options(.jst_options_missing_convention = .cv)
  r1 <- suppressMessages(jrecode(f39, v, map = "8=missing; else=copy"))
  ok1 <- if (.cv == "spss") {
    identical(as.numeric(attr(r1, "na_values")), -99)
  } else {
    sum(!is.na(haven::na_tag(unclass(r1)))) == 2L
  }
  r2 <- suppressMessages(jdeclare_missing(f41, v, codes = c(-99)))
  ok2 <- if (.cv == "spss") {
    identical(as.numeric(attr(r2$v, "na_values")), -99)
  } else {
    sum(!is.na(haven::na_tag(unclass(r2$v)))) == 2L
  }
  check(paste0("N41", letters[match(.cv, c("spss", "stata", "sas"))],
               " rerun under ", .cv, ": token and codes both mint"),
        ok1 && ok2)
}
options(.jst_options_missing_convention = NULL)

# --- N42: variant B, the pair, marker echo -----------------------------------
m42a <- grab(jrecode(f39, v, map = "1,2=1; else=.a"))
check("N42a literal .a gates with the PAIR, marker echoed",
      grepl("so the '.a' marker cannot be applied.", .fl(m42a),
            fixed = TRUE) && .has_pair(m42a))
check("N42b a tagged labels-only spelling echoes ITS marker (.b)",
      grepl("the '.b' marker cannot be applied.",
            .fl(grab(jrecode(f39, v, map = "1,2=1; else=copy",
                             labels = "1=Low; .b=Refused"))), fixed = TRUE))
check("N42c jencode literal tag gates with the pair, jencode prefix",
      { m <- grab(jencode(f39t, w, map = "Yes=1; No=0; Refused=.a"))
        grepl("jencode():", m, fixed = TRUE) &&
          grepl("the '.a' marker cannot be applied.", .fl(m),
                fixed = TRUE) && .has_pair(m) })
# jdeclare_missing's tagged act reaches level 4 only from an ambiguous
# mixed-case column (a clean tagged column resolves itself at level 1;
# tokens on plain/spss columns are refused at sign-off 3 pre-resolution).
f42 <- data.frame(z = haven::labelled(
  c(1, haven::tagged_na("a"), haven::tagged_na("B"), 2)))
m42d <- grab(jdeclare_missing(f42, z, codes = c(Refused = ".a")))
check("N42d mixed-column tokens gate: 'cannot be declared' + pair",
      grepl("the '.a' marker cannot be declared.", .fl(m42d),
            fixed = TRUE) && .has_pair(m42d))

# --- N42e-h: the marker is echoed AS TYPED (S283) ----------------------------
# The gate had read the parser-normalized lowercase letter, so a typed .A
# gated as '.a' while the spss-conflict refusal quoted the same token
# correctly (S282 finding). Uppercase counterparts of N42a-d, one per
# route: N42a-d keep the lowercase side pinned, so an over-correction to
# toupper() reds those while these stay green. N42f is the labels-only
# route, which needed the callers to harvest the labels parser's
# tagged_raw record before stripping it (the fuller fix).
check("N42e jrecode map: a typed .A is echoed as '.A'",
      grepl("so the '.A' marker cannot be applied.",
            .fl(grab(jrecode(f39, v, map = "1,2=1; else=.A"))),
            fixed = TRUE))
check("N42f jrecode labels-only: a typed .B is echoed as '.B'",
      grepl("the '.B' marker cannot be applied.",
            .fl(grab(jrecode(f39, v, map = "1,2=1; else=copy",
                             labels = "1=Low; .B=Refused"))), fixed = TRUE))
check("N42g jencode: a typed .A is echoed as '.A'",
      grepl("the '.A' marker cannot be applied.",
            .fl(grab(jencode(f39t, w, map = "Yes=1; No=0; Refused=.A"))),
            fixed = TRUE))
check("N42h jdeclare_missing mixed column: a typed .A is echoed as '.A'",
      grepl("the '.A' marker cannot be declared.",
            .fl(grab(jdeclare_missing(f42, z, codes = c(Refused = ".A")))),
            fixed = TRUE))

# --- N43: B paste-and-rerun --------------------------------------------------
for (.cv in c("stata", "sas")) {
  options(.jst_options_missing_convention = .cv)
  r1 <- suppressMessages(jrecode(f39, v, map = "1,2=1; else=.a"))
  r2 <- suppressMessages(jdeclare_missing(f42, z, codes = c(Refused = ".a")))
  check(paste0("N43", letters[match(.cv, c("stata", "sas"))],
               " rerun under ", .cv, ": tag map and mixed-column declare run"),
        sum(!is.na(haven::na_tag(unclass(r1)))) > 0L && is.data.frame(r2))
}
options(.jst_options_missing_convention = NULL)

# --- N44: variant C, the never-set range -------------------------------------
m44 <- grab(jdeclare_missing(f39, v, range = c(-99, -51)))
check("N44a never-set range: the single per-call fix line, no menu",
      grepl(paste0("jdeclare_missing(): no missing-value convention is ",
                   "selected, and a missing-value range can exist only ",
                   "under SPSS convention."), .fl(m44), fixed = TRUE) &&
        grepl('To declare it, set convention = "spss" on this call.',
              m44, fixed = TRUE) &&
        !grepl("joptions(", m44, fixed = TRUE))
r44 <- suppressMessages(jdeclare_missing(f39, v, range = c(-99, -51),
                                     convention = "spss"))
check("N44b the fix line pastes and runs",
      identical(as.numeric(attr(r44$v, "na_range")), c(-99, -51)))

# --- N45: variant D (setting-level conflict), fits render --------------------
f45 <- data.frame(Income = c(100, 200, -99, 300, -95, -91, 150))
options(.jst_options_missing_convention = "stata")
m45 <- grab(jdeclare_missing(f45, Income, range = c(-99, -91)))
check("N45a D head: range-only-under-SPSS + the setting named",
      grepl(paste0("a missing-value range can exist only under SPSS ",
                   'convention, and your missing.convention setting is ',
                   '"stata".'), .fl(m45), fixed = TRUE))
check("N45b D fits: stay-in lead and both recipe lines echo the call",
      grepl(paste0("To stay in Stata convention, first declare the range ",
                   "using SPSS convention:"), .fl(m45), fixed = TRUE) &&
        grepl(paste0('  jdeclare_missing(f45, Income, range = c(-99, -91), ',
                     'convention = "spss", modify = TRUE)'), .r5_one(m45),
              fixed = TRUE) &&
        grepl("Then convert the column to Stata convention:", m45,
              fixed = TRUE) &&
        grepl('  jconvert(f45, Income, to = "stata", modify = TRUE)', .r5_one(m45),
              fixed = TRUE))
# paste-and-rerun the two-step recipe: it must end with a Stata-form column
f45b <- f45
invisible(suppressMessages(jdeclare_missing(f45b, Income, range = c(-99, -91),
                                        convention = "spss", modify = TRUE)))
invisible(suppressMessages(jconvert(f45b, Income, to = "stata",
                                    modify = TRUE)))
check("N45c the two-step recipe runs; column ends Stata-form",
      sum(!is.na(haven::na_tag(unclass(f45b$Income)))) > 0L &&
        is.null(attr(f45b$Income, "na_range")))

# --- N46: variant D, over-cap render -----------------------------------------
f46 <- data.frame(Wave = c(-120:-87, 1:5))   # 34 distinct in-band values
m46 <- grab(jdeclare_missing(f46, Wave, range = c(-120, -87)))
check("N46a over-cap: count line, cannot-become, SPSS remedy, Rule X close",
      grepl(paste0("In Wave the range covers 34 values; Stata-style ",
                   "missing values support at most 26 per variable, so ",
                   "this range cannot become Stata-style."), .fl(m46),
            fixed = TRUE) &&
        grepl(paste0('  jdeclare_missing(f46, Wave, range = c(-120, -87), ',
                     'convention = "spss", modify = TRUE)'), .r5_one(m46),
              fixed = TRUE) &&
        grepl(paste0("To use Stata convention with jconvert(), you must ",
                     "first reduce these to 26 or fewer."), .fl(m46),
              fixed = TRUE) &&
        !grepl("Then convert", m46, fixed = TRUE))
f46b <- f46
invisible(suppressMessages(jdeclare_missing(f46b, Wave, range = c(-120, -87),
                                        convention = "spss", modify = TRUE)))
check("N46b the over-cap SPSS remedy pastes and runs",
      identical(as.numeric(attr(f46b$Wave, "na_range")), c(-120, -87)))
options(.jst_options_missing_convention = "sas")
check("N46c a sas setting flips the style words mechanically",
      { m <- .fl(grab(jdeclare_missing(f46, Wave, range = c(-120, -87))))
        grepl('setting is "sas"', m, fixed = TRUE) &&
          grepl("SAS-style missing values support", m, fixed = TRUE) &&
          grepl("To use SAS convention with jconvert()", m, fixed = TRUE) })
options(.jst_options_missing_convention = NULL)

# --- N47: guard D's scope ----------------------------------------------------
options(.jst_options_missing_convention = "stata")
# One declared code only: SPSS allows at most one discrete code beside a
# range, and mk_spss() carries two.
f47 <- data.frame(S = haven::labelled_spss(c(1, 2, -99, -75, 3),
                                           na_values = -99))
r47 <- suppressMessages(jdeclare_missing(f47, S, range = c(-79, -71)))
check("N47a an SPSS-form column under a stata setting: level 1, no guard",
      identical(as.numeric(attr(r47$S, "na_range")), c(-79, -71)))
f47t <- data.frame(Tg = haven::labelled(c(1, haven::tagged_na("a"), 2)))
m47b <- grab(jdeclare_missing(f47t, Tg, range = c(-99, -91)))
check("N47b a tagged column falls to the per-column guard (convert-first)",
      grepl("carries Stata-style missing values", .fl(m47b), fixed = TRUE) &&
        grepl("convert the column to SPSS form first:", .fl(m47b),
              fixed = TRUE) &&
        grepl('  jconvert(f47t, vars = "Tg", to = "spss", modify = TRUE)',
              m47b, fixed = TRUE) &&
        !grepl("your missing.convention setting", m47b, fixed = TRUE))
f47m <- data.frame(A = c(1, -95, 3, 4, 5), B = mk_spss())
m47c <- grab(jdeclare_missing(f47m, A, B, range = c(-99, -91)))
check("N47c one plain target pulls the call to D; recipes echo BOTH vars",
      grepl(paste0('  jdeclare_missing(f47m, A, B, range = c(-99, -91), ',
                   'convention = "spss", modify = TRUE)'), .r5_one(m47c),
            fixed = TRUE) &&
        grepl("Then convert the columns to Stata convention:", .fl(m47c),
              fixed = TRUE) &&
        grepl('  jconvert(f47m, A, B, to = "stata", modify = TRUE)', .r5_one(m47c),
              fixed = TRUE))
options(.jst_options_missing_convention = NULL)

# --- N48: variant E (per-call conflict) --------------------------------------
m48a <- grab(jdeclare_missing(f45, Income, range = c(-99, -91),
                          convention = "stata"))
check("N48a E head: combined clause, per-call value echoed",
      grepl(paste0("a missing-value range can exist only under SPSS ",
                   'convention; it cannot be combined with convention = ',
                   '"stata".'), .fl(m48a), fixed = TRUE))
check("N48b E fits lead says 'use', not 'stay in'",
      grepl(paste0("To use Stata convention, first declare the range ",
                   "using SPSS convention:"), .fl(m48a), fixed = TRUE) &&
        !grepl("stay in", m48a, fixed = TRUE))
check("N48c E over-cap under convention = 'sas': flipped words, count line",
      { m <- .fl(grab(jdeclare_missing(f46, Wave, range = c(-120, -87),
                                   convention = "sas")))
        grepl('combined with convention = "sas"', m, fixed = TRUE) &&
          grepl("In Wave the range covers 34 values", m, fixed = TRUE) &&
          grepl("cannot become SAS-style", m, fixed = TRUE) })
options(.jst_options_missing_convention = "spss")
check("N48d E fires under ANY setting (spss setting, stata per-call)",
      grepl("cannot be combined with",
            .fl(grab(jdeclare_missing(f45, Income, range = c(-99, -91),
                                  convention = "stata"))), fixed = TRUE))
options(.jst_options_missing_convention = NULL)

# --- N49: variant F, jconvert's harmonized target menu -----------------------
f49 <- data.frame(x = mk_spss())
m49 <- grab(jconvert(f49))
check("N49a F head + four targets in order, baseR last",
      grepl(paste0("jconvert(): no target format is selected, so nothing ",
                   "can be converted."), .fl(m49), fixed = TRUE) &&
        { p <- vapply(c('  to = "stata"', '  to = "spss"',
                        '  to = "sas"', '  to = "baseR"'),
                      function(s) regexpr(s, m49, fixed = TRUE)[1],
                      numeric(1))
          all(p > 0) && all(diff(p) > 0) })
check("N49b Rule B terms on the consequence lines",
      grepl("Stata-style missing values (.a-.z)", .fl(m49), fixed = TRUE) &&
        grepl("Stata- or SAS-style missing values (.a-.z, .A-.Z)",
              .fl(m49), fixed = TRUE) &&
        !grepl("tagged markers", m49, fixed = TRUE))
check("N49c no recommendation; the joptions tail teaches the default",
      !grepl("recommended", m49, fixed = TRUE) &&
        grepl(paste0("To set a session default so to = is not needed, ",
                     "choose a convention (\"stata\", \"spss\" or \"sas\"):"),
              .fl(m49), fixed = TRUE) &&
        endsWith(m49, '\n  joptions(missing.convention = "stata")'))
check("N49d every offered to= runs",
      all(vapply(c("stata", "spss", "sas", "baseR"), function(tv) {
        is.data.frame(tryCatch(suppressMessages(jconvert(f49, to = tv)),
                               error = function(e) e))
      }, logical(1))))
options(.jst_options_missing_convention = "stata")
check("N49e the joptions tail makes the bare call work",
      is.data.frame(tryCatch(suppressMessages(jconvert(f49)),
                             error = function(e) e)))
options(.jst_options_missing_convention = NULL)

# --- N50: G, jscreen's SPSS-live-codes line ----------------------------------
f50 <- data.frame(
  Inc = mk_spss(),
  Rng = haven::labelled_spss(c(1, 2, -60, 3, 4), na_range = c(-99, -51)),
  Age = c(30, 40, 50, 60, 70))
o50 <- printed(jscreen(f50))
check("N50a the line fires, names codes AND range columns, states the split",
      grepl("Note: SPSS-style declared missing values on: Inc, Rng.",
            .fl(o50), fixed = TRUE) &&
        grepl("jstats treats these as missing; base R functions do not.",
              .fl(o50), fixed = TRUE))
f50b <- data.frame(Age = c(30, 40, 50),
                   Tg  = haven::labelled(c(1, haven::tagged_na("a"), 2)))
check("N50b silent with no SPSS-form declarations",
      !grepl("SPSS-style declared missing values", printed(jscreen(f50b)),
             fixed = TRUE))

# --- N51: the no-change set --------------------------------------------------
options(.jst_options_missing_convention = NULL)
r51a <- suppressMessages(jrecode(f39, v, map = "8=NA; else=copy"))
check("N51a '8=NA' never gates (plain untagged NA is convention-free)",
      sum(is.na(unclass(r51a))) >= 2L && is.null(attr(r51a, "na_values")))
check("N51b ordinary non-minting recode and encode never gate",
      identical(sum(unclass(suppressMessages(
        jrecode(f39, v, map = "8=7; else=copy"))) == 7, na.rm = TRUE), 2L) &&
        is.numeric(unclass(suppressMessages(
          jencode(f39t, w, map = "Yes=1; No=0; Refused=2; blank=9")))))
f51 <- data.frame(S = mk_spss())
r51c <- suppressMessages(jdeclare_missing(f51, S, codes = c(-97)))
check("N51c a Level-1 spss column + codes declares without a gate",
      identical(as.numeric(attr(r51c$S, "na_values")), -97))
check("N51d an explicit to= never gates",
      is.data.frame(tryCatch(suppressMessages(jconvert(f51, to = "baseR")),
                             error = function(e) e)))
check("N51e a parse-level bad target still errors PRE-gate (no menu)",
      { m <- grab(jrecode(f39, v, map = "8=hello; else=copy"))
        nzchar(m) && !grepl(".Rprofile", m, fixed = TRUE) })
options(.jst_options_missing_convention = "none")
check("N51f an explicit \"none\" gates identically to unset",
      grepl("these codes cannot be declared",
            .fl(grab(jdeclare_missing(f39, v, codes = c(-99)))), fixed = TRUE))
options(.jst_options_missing_convention = NULL)

# =============================================================================
# N52 -- S245: the truthfulness pair in the jrecode convention error
# =============================================================================
# Two corrections, both about telling the truth about the CALL.
#   (1) The head and the cap note's marker list QUOTE the user's spelling
#       instead of recasing it to the phrasing convention. Recasing misread
#       the call in BOTH directions -- '.a' shown as '.A' under a sas
#       setting, '.A' shown as '.a' otherwise. Prescriptive positions are
#       untouched (N35d still locks the uppercase rebuilt map).
#   (2) The source sentence forks. This call site passes no column to the
#       resolver, so exactly two routes reach an spss resolution: the
#       per-call argument (level 2) or the setting (level 3). The old
#       single sentence claimed the SETTING on both, which was false on the
#       per-call route -- and pointed the remedy at joptions(), which a
#       per-call argument outranks. The per-call route now names the call
#       and offers a call-level edit.
# Wording asserted below is verified against jstats_source.R this session
# and against a live render of all four path/tier combinations.

f52 <- data.frame(v = c(1, 2, 3, 3, 2, 1))

# --- (1) the quote, both directions ------------------------------------------

options(.jst_options_missing_convention = "spss")
m52up <- grab(jrecode(f52, v, map = "1,2=1; 3=2; else=.A"))
check("N52a spss setting: an uppercase typed marker is NOT lowercased",
      grepl("uses '.A'", m52up, fixed = TRUE) &&
        !grepl("uses '.a'", m52up, fixed = TRUE))

m52mix <- grab(jrecode(f52, v, map = "1=.a; 2=.B; 3=.c; -99=.D; NA=.e"))
# FLIPPED at S246: the cap note's marker list was the second QUOTE position
# and the rebuilt map was the PRESCRIPTIVE one. Both went with the echo-back,
# leaving the head as the only quote position -- which N52b now pins.
check("N52b the head quotes as typed; the cap-note echo is gone (S246)",
      grepl("uses '.a'", m52mix, fixed = TRUE) &&
        !grepl("(.a, .B, .c, .D, .e)", m52mix, fixed = TRUE))
check("N52c no rebuilt map survives (S246)",
      !grepl("-99=.d; NA=.e", m52mix, fixed = TRUE) &&
        !grepl("equivalent recode", m52mix, fixed = TRUE))

check("N52d no style word survives anywhere in the message",
      !grepl("-style missing-value", .fl(m52mix), fixed = TRUE) &&
        !grepl("Stata-style markers", .fl(m52mix), fixed = TRUE) &&
        !grepl("SAS-style markers", .fl(m52mix), fixed = TRUE))

# --- (2) the source sentence and remedy fork ---------------------------------

m52set <- grab(jrecode(f52, v, map = "1,2=1; 3=2; else=.a"))
check("N52e SETTING route names the setting, not 'the package'",
      grepl('missing.convention setting is "spss"', .fl(m52set), fixed = TRUE) &&
        !grepl("The package is currently set to", .fl(m52set), fixed = TRUE))
check("N52f SETTING route keeps the joptions remedy (it works there)",
      grepl('joptions(missing.convention = "stata")', m52set, fixed = TRUE))

options(.jst_options_missing_convention = "sas")
m52call <- grab(jrecode(f52, v, map = "1,2=1; 3=2; else=.a",
                        convention = "spss"))
check("N52g PER-CALL route blames the call, not the setting",
      grepl('cannot be combined with convention = "spss"',
            .fl(m52call), fixed = TRUE) &&
        !grepl("missing.convention setting is", .fl(m52call), fixed = TRUE))
check("N52h PER-CALL route drops the inert joptions remedy",
      !grepl("joptions(missing.convention", m52call, fixed = TRUE) &&
        grepl('change convention = "spss" on this call',
              .fl(m52call), fixed = TRUE))

# The surface-form contrast that replaced the style word, at both tiers.
check("N52i the conflict sentence carries the lettered/numeric contrast",
      grepl("Lettered markers can exist only under Stata or SAS convention",
            .fl(m52call), fixed = TRUE) &&
        grepl("which uses numeric codes", .fl(m52call), fixed = TRUE))

# --- one form across tiers ---------------------------------------------------
# S246: the tier gate went with the echo-back. What minimal rendered is now
# what every tier renders, so the tiers must be byte-identical -- a stronger
# property than the old "minimal sheds only the rewrite".

options(.jst_output_level = "minimal")
m52min <- grab(jrecode(f52, v, map = "1,2=1; 3=2; else=.a",
                       convention = "spss"))
options(.jst_output_level = NULL)
check("N52j minimal and standard render identically (S246)",
      identical(m52min, m52call) &&
        grepl('change convention = "spss" on this call',
              .fl(m52min), fixed = TRUE) &&
        grepl("uses '.a'", m52min, fixed = TRUE))

# Rule U, swept (S254): no rendered prose line strands an argument name at
# its end, across EVERY message render this file has captured so far -- not
# just m52call. The single-message pin is what let four other instances of
# the same defect through unnoticed at S253 (the atomic-token rule
# protected only dotted names); the sweep is modeled on jencode_check.R's
# N41 and, like the m-variable collect below, extends itself as later
# sessions add renders above this line. Two stranding shapes, both
# asserted: a line ending "name =" (the value pushed down), and a line
# opening "= " (the name split from its own equals -- the shape the S252
# corpus showed was already occurring at hand-wrapped sites). Indented
# lines (two+ leading spaces) are Rule L runnable / listing lines and are
# exempt by design, matching N41.
.sweep52 <- unlist(Filter(is.character,
                          mget(ls(pattern = "^m[0-9]"), inherits = FALSE)))
.l52 <- unlist(strsplit(.sweep52, "\n", fixed = TRUE))
.l52 <- .l52[nzchar(trimws(.l52)) & !grepl("^\\s{2}", .l52)]
check("N52k no rendered prose line strands an argument name (swept)",
      length(.sweep52) >= 40L &&
        !any(grepl("(^| )[A-Za-z][A-Za-z0-9._]* =$", .l52)) &&
        !any(grepl("^= ", .l52)))

options(.jst_options_missing_convention = NULL)

# =============================================================================
# N53 -- RULE Y: THE MISMATCH IS STATED, NOT TRANSLATED (S246). The SPSS-form
# echo-back is retired. It minted codes from joptions("missing.convention.codes"),
# a pool blind to the column, so the recipe it handed back could substitute a
# code already present in the data -- or already a target in the user's own
# map -- silently merging two distinct values and then declaring the result
# missing. f53 below is the verified worked example: with -99 already in the
# column and else=copy carrying it through, the old recipe sent the 1s and the
# -99s to the same code. These checks lock the replacement: the two
# settings-level remedies, one form at every tier, and no minted values.
# =============================================================================

f53 <- data.frame(v = c(1, 1, 2, -99, -99, 5))

options(.jst_options_missing_convention = "spss")
m53 <- grab(jrecode(f53, v, map = "1=.a; 2=.b; else=copy"))

check("N53a the keep-SPSS remedy states the requirement",
      grepl("To keep SPSS convention, restate the markers as numeric codes.",
            .fl(m53), fixed = TRUE))
check("N53b no pool code is minted into the message",
      !grepl("-99=", m53, fixed = TRUE) &&
        !grepl("-98", m53, fixed = TRUE) &&
        !grepl("missing.convention.codes", m53, fixed = TRUE))
check("N53c no rewritten call and no follow-up declaration",
      !grepl("<- jrecode(", m53, fixed = TRUE) &&
        !grepl("jdeclare_missing(", m53, fixed = TRUE))
check("N53d singular agreement when a single marker is used",
      {
        m53s <- grab(jrecode(f53, v, map = "1=.a; else=copy"))
        grepl("restate the marker as a numeric code.", .fl(m53s), fixed = TRUE)
      })
check("N53e jencode inherits the retirement (shared builder)",
      {
        f53e <- data.frame(r = c("yes", "no", "skip"))
        m53e <- grab(jencode(f53e, r, map = "yes=1; no=0; skip=.a"))
        grepl("restate the marker as a numeric code.",
              .fl(m53e), fixed = TRUE) &&
          !grepl("<- jencode(", m53e, fixed = TRUE)
      })
options(.jst_options_missing_convention = NULL)

# =============================================================================
# N54 -- THE LABEL BRANCH REPORTS WHAT IT DID (S247). The stata_canonical
# notification rendered from the CODES ARGUMENT, so it announced acts that had
# not happened: a label attached to a marker in no cell, a bare token that
# changes nothing, and a rename that dropped the old label without a word.
# Each body line now carries what actually became true of that marker, and an
# all-bare call -- which names nothing at all on this branch -- replaces the
# naming header outright rather than annotating it. Forward-declaring a label
# is ALLOWED (Option A, S247): haven accepts it and it survives both a Stata
# and an SPSS round trip, so the message reports the absence instead of
# refusing the call.
# =============================================================================

options(.jst_options_missing_convention = "stata")

# Fixtures from haven primitives (battery convention: fixtures do not depend
# on the surface under test). f54a carries .a labeled, and .b bare.
f54a <- data.frame(V = haven::labelled(
  c(1, 2, haven::tagged_na("a"), haven::tagged_na("b")),
  labels = c(Refused = haven::tagged_na("a"))))

check("N54a a label on a marker in no cell says so",
      {
        m <- printed(jdeclare_missing(f54a, V, codes = c(New = ".c")))
        grepl('.c is now "New" (not present in the data)', m, fixed = TRUE)
      })
check("N54b a clean naming carries NO annotation",
      {
        m <- printed(jdeclare_missing(f54a, V, codes = c(Skipped = ".b")))
        grepl('.b is now "Skipped"', m, fixed = TRUE) &&
          !grepl("(not present", m, fixed = TRUE) &&
          !grepl("(no change", m, fixed = TRUE) &&
          !grepl("(was ", m, fixed = TRUE)
      })
check("N54c a rename reports the label it replaced",
      {
        m <- printed(jdeclare_missing(f54a, V, codes = c(Changed = ".a")))
        grepl('.a is now "Changed" (was "Refused")', m, fixed = TRUE)
      })
check("N54d the same name re-asserted reads as no change",
      {
        m <- printed(jdeclare_missing(f54a, V, codes = c(Refused = ".a")))
        grepl('.a is now "Refused" (no change)', m, fixed = TRUE)
      })
# A bare entry CANNOT coexist with a named one: partially-named codes is
# refused upstream (Option A / Option C are exclusive). So the only bare path
# is the all-bare call below, and the body-line "no change" annotation is
# reachable only via a re-asserted name (N54d). This check pins that, so a
# later relaxation of the partial-naming rule surfaces here rather than
# silently exposing an unexercised branch.
check("N54e bare and named cannot mix, so all-bare is the only bare path",
      {
        m <- tryCatch({ jdeclare_missing(f54a, V, codes = c(New = ".b", ".a")); "" },
                      error = function(e) conditionMessage(e))
        grepl("names some of its codes and not others", m, fixed = TRUE)
      })
check("N54f both facts combine, replacement first",
      {
        f <- data.frame(W = haven::labelled(
          c(1, haven::tagged_na("a")),
          labels = c(New = haven::tagged_na("c"))))
        m <- printed(jdeclare_missing(f, W, codes = c(Newer = ".c")))
        grepl('(was "New"; not present in the data)', m, fixed = TRUE)
      })

# --- The all-bare call: nothing is named, so nothing is announced -----------
check("N54g an all-bare call replaces the naming header entirely",
      {
        m <- printed(jdeclare_missing(f54a, V, codes = ".a"))
        grepl("made no change to V", m, fixed = TRUE) &&
          grepl("a bare marker has nothing to name", .fl(m), fixed = TRUE) &&
          !grepl("Named ", m, fixed = TRUE)
      })
check("N54h an all-bare call emits no durability note",
      {
        m <- printed(jdeclare_missing(f54a, V, codes = ".a"))
        !grepl("jsave(", m, fixed = TRUE) &&
          !grepl("only if you assign", m, fixed = TRUE)
      })
check("N54i the all-bare scaffold follows the call's own modify state",
      {
        m1 <- printed(jdeclare_missing(f54a, V, codes = ".a"))
        m2 <- printed(jdeclare_missing(f54a, V, codes = ".a", modify = TRUE))
        grepl("f54a <- jdeclare_missing(f54a, V,", m1, fixed = TRUE) &&
          grepl("modify = TRUE)", m2, fixed = TRUE) &&
          !grepl("f54a <- ", m2, fixed = TRUE)
      })
check("N54j the all-bare note leaves the column untouched",
      local({
        # Through printed() (Session 360): the note is printed output, which
        # suppressMessages() let through onto every run's log.
        printed(out <- jdeclare_missing(f54a, V, codes = ".a"))
        identical(labelled::val_labels(out$V),
                  labelled::val_labels(f54a$V))
      }))

# --- Bulk: presence is a property of the COLUMN, so it splits the group -----
f54b <- data.frame(
  P = haven::labelled(c(1, haven::tagged_na("a"))),
  Q = haven::labelled(c(1, haven::tagged_na("c"))),
  R = haven::labelled(c(2, haven::tagged_na("a"))))

check("N54k bulk splits when presence differs across columns",
      {
        m <- printed(jdeclare_missing(f54b, P, Q, codes = c(New = ".c")))
        length(gregexpr("Named Stata-style", m)[[1]]) == 2L &&
          grepl("(not present in the data)", m, fixed = TRUE)
      })
check("N54l bulk does NOT split when the signature matches",
      {
        m <- printed(jdeclare_missing(f54b, P, R, codes = c(New = ".c")))
        length(gregexpr("Named Stata-style", m)[[1]]) == 1L &&
          grepl("P, R", m, fixed = TRUE)
      })
check("N54m bulk all-bare pluralizes and lists the variables",
      {
        m <- printed(jdeclare_missing(f54b, P, R, codes = ".a"))
        grepl("made no change to 2 variables", m, fixed = TRUE) &&
          grepl("Their markers are already", .fl(m), fixed = TRUE) &&
          grepl("P, R", m, fixed = TRUE) &&
          !grepl("jsave(", m, fixed = TRUE)
      })

options(.jst_options_missing_convention = NULL)


# =============================================================================
# N55 -- THE TWO EMISSION PATHS STAY ONE MESSAGE (S251, pinning S250)
# =============================================================================
# S250 gave .jst_choose_convention_error() a prefixed argument so the D1
# suspicious-target note can emit the gate's own menu through message()
# instead of .jst_stop(). TRUE is the .jst_stop() contract (lowercase head,
# reserve nchar(fn) + 4); FALSE is the message() contract (capitalized head,
# reserve 0). Everything below the head is meant to be byte-identical --
# that is what stops a note which TEACHES the choice from drifting away from
# the gate that ENFORCES it.
#
# Four properties, ordered by how they would break:
#   (1) the fifth gate call site's head. N39a / N39c / N44a / N49a already
#       match their heads CONTIGUOUSLY behind the "fn(): " prefix, so a flip
#       of the prefixed default fails them today. The pair variant is the
#       one gap: N42a and N42c match the prefix and the tail separately, so
#       a capitalized head would leave both green.
#   (2) the byte-identity contract itself, which no per-site check can see.
#   (3) the D1 branch in both homes, unset and set.
#   (4) the second Rule H edit. The first is N40b, flipped in place above.
# =============================================================================

f55  <- data.frame(v = c(1, 2, 8, 2, 1, 3, NA))
f55t <- data.frame(w = c("Yes", "No", "Refused", "Yes", "Maybe", NA),
                   stringsAsFactors = FALSE)

# --- N55a: the fifth site, prefix and lowercase head in ONE string -----------
check("N55a pair variant: prefix + lowercase head, contiguous",
      grepl(paste0("jrecode(): no missing-value convention is selected, ",
                   "so the '.a' marker cannot be applied."),
            .fl(grab(jrecode(f55, v, map = "1,2=1; else=.a"))), fixed = TRUE))

# --- N55b/c: the contract -- one body, two heads -----------------------------
# Built from the builder rather than from two live calls: the paths wrap the
# head at different reserves, so the only honest comparison is head-stripped.
# A menu edit made inside an if (prefixed) branch is what this catches.
.body_after_head <- function(x) {
  ln <- strsplit(x, "\n", fixed = TRUE)[[1]]
  h  <- match("Choose one for this session:", ln)
  if (is.na(h)) character(0) else ln[h:length(ln)]
}
.ht55 <- "the value cannot be made missing yet."
m55T <- jstats:::.jst_choose_convention_error(
  variant = "menu", fn = "jrecode", head_tail = .ht55, prefixed = TRUE)
m55F <- jstats:::.jst_choose_convention_error(
  variant = "menu", fn = "jrecode", head_tail = .ht55, prefixed = FALSE)

check("N55b the menu body is byte-identical across both emission paths",
      length(.body_after_head(m55T)) > 4L &&
        identical(.body_after_head(m55T), .body_after_head(m55F)))

# Collapsed, the two renders differ in exactly one character: the head's
# leading capital. Collapsing is what makes this wrap-proof -- the reserve
# difference moves line breaks, and only line breaks.
check("N55c the heads differ ONLY in the leading capital",
      startsWith(m55T, "no missing-value convention is selected") &&
        startsWith(m55F, "No missing-value convention is selected") &&
        identical(substring(.fl(m55T), 2L), substring(.fl(m55F), 2L)))

# --- N55d/e: the D1 suspicious-target note, UNSET, in both homes -------------
# Neither home was pinned before S251. The note is a message(), not a stop(),
# so it must carry NO "fn(): " prefix -- that guard is the live half of the
# prefixed = FALSE contract N55b checks structurally.
options(.jst_options_missing_convention = NULL)

m55d <- grab(jrecode(f55, v, map = "8=-99; else=copy"))
check("N55d jrecode D1 unset: menu inline, no prefix, then the map lead",
      grepl("8 was recoded to -99, which looks like a coded missing value.",
            .fl(m55d), fixed = TRUE) &&
        grepl(paste0("No missing-value convention is selected, so the ",
                     "value cannot be made missing yet."),
              .fl(m55d), fixed = TRUE) &&
        .has_menu3(m55d) &&
        grepl("Then map it directly:", m55d, fixed = TRUE) &&
        grepl("Or declare -99 as missing on the recoded variable:",
              .fl(m55d), fixed = TRUE) &&
        !grepl("jrecode():", m55d, fixed = TRUE))

# One flagged VALUE, reached through two words. The plural-FLAGGED case
# (two distinct targets) is deliberately NOT pinned here: it is the open
# S250 merging finding, and a check written today would lock the defect in.
m55e <- grab(jencode(f55t, w, map = "Yes=1; No=0; Refused=-99; Maybe=-99"))
check("N55e jencode D1 unset draws the same menu from its own home",
      grepl(paste0("No missing-value convention is selected, so the ",
                   "value cannot be made missing yet."),
            .fl(m55e), fixed = TRUE) &&
        .has_menu3(m55e) &&
        grepl("Then map it directly:", m55e, fixed = TRUE) &&
        !grepl("jencode():", m55e, fixed = TRUE))

# --- N55f: the SET branch, all three conventions -----------------------------
# .jst_convention_label() supplies the style word; no menu appears, because
# the choice has already been made.
for (.cv in c("spss", "stata", "sas")) {
  options(.jst_options_missing_convention = .cv)
  .m   <- grab(jrecode(f55, v, map = "8=-99; else=copy"))
  .lbl <- c(spss = "SPSS", stata = "Stata", sas = "SAS")[[.cv]]
  check(paste0("N55f", letters[match(.cv, c("spss", "stata", "sas"))],
               " D1 set (", .cv, "): the label renders, no menu"),
        grepl(paste0("To make the value missing under ", .lbl,
                     " convention, map it directly:"), .fl(.m),
              fixed = TRUE) &&
          !grepl("Choose one for this session", .m, fixed = TRUE))
}

# --- N55g: paste-and-rerun the unset note's own remedy -----------------------
# The unset note offers the menu and then a map line using the missing
# token. Choosing an option must make that line run (Rule V).
options(.jst_options_missing_convention = "stata")
.r55 <- suppressMessages(jrecode(f55, v, map = "8=missing; else=copy"))
check("N55g the offered map line runs once a convention is chosen",
      sum(!is.na(haven::na_tag(unclass(.r55)))) == 1L)
options(.jst_options_missing_convention = NULL)

# --- N55h: Rule H edit two -- jconvert's spss target -------------------------
# S250 replaced a clause that PARAPHRASED its first half with the
# consequence its three siblings give. The negative guard pins the
# replacement, not merely the presence of the new words.
m55h <- grab(jconvert(data.frame(x = mk_spss())))
check("N55h Rule H: jconvert's spss target states the base-R asymmetry",
      grepl("become numeric codes; jstats treats them as missing.",
            .fl(m55h), fixed = TRUE) &&
        grepl("Base R does not.", m55h, fixed = TRUE) &&
        !grepl("codes stay visible numbers", .fl(m55h), fixed = TRUE))

options(.jst_options_missing_convention = NULL)

# =============================================================================
# N56 -- THE STDOUT ROUTE HAS ITS OWN WIDTH SWEEP (S254). N52k sweeps the
# m-variables, which are built with grab() -- and grab() captures CONDITIONS.
# jdeclare_missing and jsave sign off through cat(), so their notes are stdout,
# never conditions, and N52k structurally cannot see them however wide it
# sweeps. That blind spot is not hypothetical: the S254 run rendered
# .jst_jdeclare_missing_drop_notice at 139 characters through a 181/181 green
# suite, and a scan then found three more builders in the same position
# (jsave's label-loss and dta-case-correction notes, and the data-dir note,
# whose folder path also had to move to its own line to survive a wrap).
# This section sweeps the printed() route the way N52k sweeps the grab()
# route. Rule L indented lines are exempt, matching N52k and N41.
# =============================================================================

# The ceiling is the PINNED width, not a literal (S337, the S256 item): the
# name records the width the helper was written at.
.over76 <- function(txt) {
  l <- unlist(strsplit(paste(txt, collapse = "\n"), "\n", fixed = TRUE))
  l <- l[nzchar(trimws(l)) & !grepl("^\\s{2}", l)]
  l[nchar(l) > .pin_width]
}

f56  <- data.frame(S = mk_spss())
f56b <- data.frame(Income = c(100, 200, -99, 300), Age = c(20, 30, -99, 40))
p56c <- file.path(tempdir(), "jstats_n56.csv")

# Every stdout render this file can reach, collected as one surface.
.printed56 <- c(
  printed(jdeclare_missing(f56,  S, codes = c(-97))),
  printed(jdeclare_missing(f56,  S, codes = c(-97), convention = "spss")),
  printed(jdeclare_missing(f56b, Income, Age, codes = -99, convention = "spss")),
  printed(jsave(f56, p56c, overwrite = TRUE)),
  printed(jsave(f56, p56c, overwrite = TRUE, preserve.declarations = FALSE)))
unlink(p56c)

check("N56a no stdout prose line exceeds the pinned width",
      length(.printed56) >= 5L && length(.over76(.printed56)) == 0L)

# The drop notice specifically: the S254 defect, pinned at its own site so a
# regression names itself rather than surfacing as an anonymous sweep failure.
.n56b <- printed(jdeclare_missing(f56, S, codes = c(-97)))
check("N56b the replaced-declaration notice wraps (S254 defect)",
      grepl("replaced the existing declared missing values",
            paste(.n56b, collapse = " "), fixed = TRUE) &&
        length(.over76(.n56b)) == 0L)

# A folder path with spaces must reach the console unbroken -- on its own
# line, classified pass. Wrapped inline it splits and stops being copyable.
options(.jst_options_data_dir =
          file.path(tempdir(), "Jeff Ackerman", "00 R Projects", "no_such"))
.n56c <- jstats:::.jst_missing_data_dir_note()
options(.jst_options_data_dir = NULL)
check("N56c a data-dir path with spaces survives on one line",
      grepl("00 R Projects", .n56c, fixed = TRUE) &&
        any(vapply(strsplit(.n56c, "\n", fixed = TRUE)[[1]],
                   function(l) grepl("^  ", l) &&
                     grepl("00 R Projects/no_such", l, fixed = TRUE),
                   logical(1))) &&
        length(.over76(.n56c)) == 0L)

# =============================================================================
# N57 -- THE RENDERED ROUTE (S256). The emitters now reserve for R's own
# inline chrome on top of their own prefix: .jst_stop() reserves
# nchar("fn(): ") + 8 ("Error : " under try(); the top-level "Error: " is
# 7), and .jst_warn() a flat 9 ("Warning: " under warn = 1). So the line
# the console SHOWS -- chrome included -- fits the width. grab()
# structurally cannot verify this: it captures the condition, whose message
# already fit BEFORE the change (the S255 walks read errors at 83-84
# through a green battery). These checks measure the route the user reads,
# via rendered(). Rule L indented lines exempt, matching N52k / N56a.
# =============================================================================

# The S255 measurement case: jrecode's declared-code cap error, which
# rendered at 84 before the reserve. Three declared codes outside the mint
# pool, none consumed by the map, 'missing' forcing a fourth. The column is
# SPSS-form, so the column convention resolves and no session setting is
# needed.
f57 <- data.frame(v = haven::labelled_spss(
  c(1, 2, -1, -2, -3, 5), labels = c(Refused = -1),
  na_values = c(-1, -2, -3)))
options(.jst_options_missing_convention = "spss")
.r57a <- rendered(jrecode(f57, v, map = "5=missing"))
options(.jst_options_missing_convention = NULL)
check("N57a a rendered error fits the pinned width, chrome included",
      nzchar(.r57a) &&
        grepl("Error", .r57a, fixed = TRUE) &&
        grepl("already declares 3 SPSS-style missing values", .r57a,
              fixed = TRUE) &&
        length(.over76(.r57a)) == 0L)

# The warning route under warn = 1 (the clinic walk's setting), driven
# through the emitter directly so the body length is controlled: long
# enough that line 1 fills its allowance, which is exactly when the chrome
# overflows without the reserve.
.r57b <- rendered(jstats:::.jst_warn(
  "this synthetic body exists only to fill the first rendered line ",
  "completely, so that the inline Warning prefix is exercised against ",
  "the pinned width the way jalpha's warning was in the S255 walk read."))
check("N57b a rendered warning fits the pinned width under warn = 1",
      nzchar(.r57b) &&
        grepl("Warning", .r57b, fixed = TRUE) &&
        length(.over76(.r57b)) == 0L)

# =============================================================================
# N58 -- THE ORPHAN PULL-BACK'S CONDITION (S257). The pull-back's test was a
# bare length comparison; S257 replaced it with a two-part condition and a new
# min_tail floor. The change re-broke 91 of 250 wrapped units at the pinned
# width and NOT ONE of this file's 186 checks noticed -- which is the reason
# this section exists. A property the whole suite is blind to is unprotected,
# whichever direction it moves in.
#
# These call .jst_wrap_prose DIRECTLY on synthetic strings rather than through
# a message, deliberately: the subject is the ALGORITHM, so no amount of
# message-wording drift can break them, and no wording change can silently
# stop them testing what they name. Width is passed explicitly for the same
# reason -- these are independent of .pin_width.
#
# Home: this file has been the message-surface battery since N52k (Rule U),
# N56 (the stdout sweep) and N57 (the rendered route), all of which are
# general rather than convention-specific. N58 continues that series.
#
# MUTATION-TESTED (S257, per the S251 rule), against four ways the condition
# could regress -- M1 revert to the bare length test, M2 drop the floor,
# M3 drop the AND branch, M4 disable the pull-back entirely:
#       M1 reds N58b        M2 reds N58a        M3 reds N58c
#       M4 reds N58a + N58c
# Every mutation is caught and every check fails under at least one, so none
# of the three is a check that cannot fail.
# =============================================================================

# Fixtures: ordinary words, chosen so the natural fill point leaves a tail of
# a known shape. .w58 keeps the wrapper's own default out of the assertions.
.s58_two   <- paste("alpha beta gamma delta epsilon zeta eta theta iota",
                    "kappa be so")
.s58_floor <- paste("alpha beta gamma delta epsilon zeta eta theta iota",
                    "kappa xy a")
.s58_one   <- paste("alpha beta gamma delta epsilon zeta eta theta iota",
                    "consequence")
.s58_word  <- paste("alpha beta gamma delta epsilon zeta eta theta iota",
                    "kappa lam")

.tail58 <- function(s, w) {
  l <- strsplit(jstats:::.jst_wrap_prose(s, width = w), "\n", fixed = TRUE)[[1]]
  l[length(l)]
}
.nwords58 <- function(x) length(strsplit(trimws(x), " +")[[1]])

# N58a -- THE FLOOR. No last line falls below min_tail, whatever its word
# count. This is what stops the word test stranding a short multi-word tail
# ("to show."), the failure mode a floor of 0 produced on 8 units at S257.
check("N58a no wrapped tail falls below the min_tail floor",
      all(vapply(list(.s58_two, .s58_floor, .s58_one, .s58_word),
                 function(s) all(vapply(c(50L, 64L, 76L),
                   function(w) nchar(.tail58(s, w)) >= 10L, logical(1))),
                 logical(1))))

# N58b -- THE AND BRANCH, and the one check that separates the new condition
# from the old. A multi-word tail between the floor and min_last is LEFT
# ALONE; the old bare test dragged it back to 20 characters, emptying the
# line above. This is the assertion that would have caught a silent revert.
check("N58b a multi-word tail between floor and min_last survives",
      {
        t <- .tail58(.s58_two, 50L)
        nchar(t) < 20L && .nwords58(t) >= 2L
      })

# N58c -- THE RETAINED GUARANTEE. A SINGLE-word tail under min_last is still
# pulled back, exactly as before S257. The new condition is strictly weaker
# than the old one on a single word, so this must hold unchanged -- and the
# S257 corpus measurement bears it out: one-word tail counts are identical to
# the old condition at 90 / 76 / 64 / 50, not merely close.
check("N58c a single-word tail under min_last is still pulled back",
      {
        t <- .tail58(.s58_one, 50L)
        !(.nwords58(t) == 1L && nchar(t) < 20L)
      })

# =============================================================================
# N59 -- TWO PROPERTIES THE SUITE WAS BLIND TO (S267). Both were shipped in
# S267 and both went green through 189/189 without being seen, because no
# assertion could distinguish the property holding from it failing:
#   N59a-c: the switch pair's ORDER. N16a/N16b assert each joptions line's
#     PRESENCE independently, so either order passes them. The S267 rule
#     (the user's own marker style leads) shipped keyed to a variable that
#     is constant on this route, making it inert; the workstation run
#     caught it by eye. Order is asserted here by character position.
#   N59d-f: the all-bare note's INDENTS. The S267 Rule L sweep moved the
#     runnable to two spaces while its intro was itself indented two,
#     flattening the heading against the call. Nothing pinned either the
#     old form or the new one, singular or bulk.
# =============================================================================

options(.jst_options_missing_convention = "spss")
f59 <- data.frame(v = c(1, 2, 3))
# Position of each joptions line; the pair's order is which comes first.
.order59 <- function(m) {
  fm <- .fl(m)
  c(stata = regexpr('missing.convention = "stata"', fm, fixed = TRUE),
    sas   = regexpr('missing.convention = "sas"',   fm, fixed = TRUE))
}
m59lower <- grab(jrecode(f59, v, map = "1,2=1; 3=2; else=.a"))
m59upper <- grab(jrecode(f59, v, map = "1,2=1; 3=2; else=.A"))
m59mixed <- grab(jrecode(f59, v, map = "1,2=.a; 3=.B"))

check("N59a a typed lowercase marker lists stata first",
      {
        p <- .order59(m59lower)
        all(p > 0L) && p[["stata"]] < p[["sas"]]
      })
# The check that would have caught the S267 defect: it fails for BOTH the
# inert version (stata first) and any future reversal.
check("N59b a typed UPPERCASE marker lists sas first",
      {
        p <- .order59(m59upper)
        all(p > 0L) && p[["sas"]] < p[["stata"]]
      })
check("N59c mixed case keeps the stata-first default",
      {
        p <- .order59(m59mixed)
        all(p > 0L) && p[["stata"]] < p[["sas"]]
      })
options(.jst_options_missing_convention = NULL)

# --- N59d-f: the all-bare note's indents -------------------------------------
# Rule L form: the intro is prose at column 0, the runnable line is indented
# two. Asserted on the RENDERED lines, since the defect was invisible to
# every content-level assertion in N54.
f59b <- data.frame(V = haven::labelled(
  c(1, 2, haven::tagged_na("a"), haven::tagged_na("b")),
  labels = c(Refused = haven::tagged_na("a"))))
f59c <- data.frame(
  P = haven::labelled(c(1, haven::tagged_na("a"))),
  R = haven::labelled(c(2, haven::tagged_na("a"))))
.lines59 <- function(x) strsplit(x, "\n", fixed = TRUE)[[1]]
.indent59 <- function(ln) nchar(ln) - nchar(sub("^ +", "", ln))

check("N59d all-bare singular: intro at column 0, runnable at two",
      {
        ln <- .lines59(printed(jdeclare_missing(f59b, V, codes = ".a")))
        i  <- which(startsWith(ln, "To name one, put its label in place of MyLabel:"))
        length(i) == 1L && .indent59(ln[i]) == 0L &&
          .indent59(ln[i + 1L]) == 2L &&
          grepl("jdeclare_missing(", ln[i + 1L], fixed = TRUE)
      })
check("N59e the same holds under modify = TRUE (scaffold swaps form only)",
      {
        ln <- .lines59(printed(jdeclare_missing(f59b, V, codes = ".a",
                                            modify = TRUE)))
        i  <- which(startsWith(ln, "To name one, put its label in place of MyLabel:"))
        length(i) == 1L && .indent59(ln[i]) == 0L &&
          .indent59(ln[i + 1L]) == 2L
      })
# The bulk path splices the variable echo between the first sentence and the
# intro, keying on the intro string. A partial edit to that string leaves the
# splice unmatched and the echo in the wrong place, so assert the ORDER of the
# three parts, not merely their presence.
check("N59f bulk: variable echo sits between the sentence and the intro",
      {
        ln <- .lines59(printed(jdeclare_missing(f59c, P, R, codes = ".a")))
        i_echo  <- which(grepl("^  P, R$", ln))
        i_intro <- which(startsWith(ln, "To name one, put its label in place of MyLabel:"))
        length(i_echo) == 1L && length(i_intro) == 1L &&
          i_echo < i_intro && .indent59(ln[i_intro]) == 0L &&
          .indent59(ln[i_intro + 1L]) == 2L
      })

# =============================================================================
# N60 -- RULE F ON jdeclare_missing's FOLLOW-ON NOTES (S267). Both notes emitted
# glued to the line above -- in the worst case directly onto a runnable line,
# so the note read as fallout from the code block rather than as its own
# note. Pre-existing (the pristine 0.9.149 render is identical bar wording),
# surfaced by reading the S267 workstation run's leaked stdout, and invisible
# to every existing assertion: N56b checks the drop notice WRAPS, nothing
# checked where it starts. The D2 block a few lines above these two already
# opened with the Rule F blank, so the pattern was established and these two
# simply did not follow it.
# =============================================================================

.blank_before60 <- function(txt, first_words) {
  ln <- strsplit(txt, "\n", fixed = TRUE)[[1]]
  i  <- which(startsWith(ln, first_words))
  length(i) == 1L && i > 1L && !nzchar(ln[i - 1L])
}

options(.jst_options_missing_convention = "spss")
f60a <- data.frame(S = haven::labelled_spss(
  c(1, -99, -98), na_values = c(-99, -98),
  labels = c(Refused = -99, DK = -98)))
check("N60a the drop notice opens on its own blank line",
      .blank_before60(printed(jdeclare_missing(f60a, S, codes = -97)),
                      "Note: jdeclare_missing replaced"))

options(.jst_options_missing_convention = "stata")
f60b <- data.frame(z = haven::labelled(
  c(1, haven::tagged_na("a"), haven::tagged_na("B"))))
check("N60b the mixed-marker note opens on its own blank line",
      .blank_before60(printed(jdeclare_missing(f60b, z,
                                           codes = c(Refused = ".a"))),
                      "Note: z carries both"))
# NOT a both-fire check, though it was written as one first. A stimulus
# firing BOTH follow-on notes in a single call was probed for and not
# reached: the drop notice needs a declaration set replaced, the mixed
# note needs mixed-case tagged markers, and naming a marker is additive
# so it drops nothing. The two staying separated when they do co-occur
# rests on each block owning its own leading blank -- a design property,
# asserted nowhere here. What N60c DOES cover is the labelled branch of
# the drop-notice builder, which renders through a different path than
# N60a's bare codes.
f60c <- data.frame(z = haven::labelled_spss(
  c(1, -99), na_values = -99, labels = c(Refused = -99)))
check("N60c the blank holds when the dropped code carries a label",
      {
        m <- printed(jdeclare_missing(f60c, z, codes = -97))
        .blank_before60(m, "Note: jdeclare_missing replaced") &&
          grepl('-99 ["Refused"]', m, fixed = TRUE)
      })
options(.jst_options_missing_convention = NULL)

# N60d -- the THIRD follow-on note, missed by the S267 pass and by N60a-c:
# the post-declaration convention MISMATCH note ("Note: Income uses
# Stata-style missing values, but other columns ... are SPSS-style"). At the
# S283 workstation walk (Section 3/4) it printed on the very next line after
# the modify = TRUE hint's indented call. S286 (v0.9.161) gave the mismatch
# block its Rule F blank, the same cat("\n") idiom as its two siblings; this
# check pins it. Fixture: N37's d37 (three spss columns, Income declared
# stata), the same call N37 reads. Mutation: removing the S286 cat("\n")
# reds N60d alone (verified S287, sandbox).
check("N60d the convention-mismatch note opens on its own blank line",
      .blank_before60(printed(jdeclare_missing(d37, Income, codes = -99,
                                               convention = "stata")),
                      "Note: Income uses"))

# =============================================================================
# N61 -- joptions("slot") mistyped-slot guard (S281, v0.9.158)
# =============================================================================
# joptions("missing.converntion") used to fall through the query test (an
# exact match on the six slot names) into the positional missing.convention
# slot, and die with the conventions choice error -- an answer to a question
# the user never asked. The guard tests a lone positional string as a near
# miss against the slot names (case-insensitive Levenshtein, at most 2)
# BEFORE the lowercasing step, so the error quotes what was typed (Rule AB).
# The query form itself had walk coverage only (missing_convention_walk.R
# Section 1, S280); the guard is a second path through the same door and
# the more fragile one, so it takes the first machine assertions here.
# Mutation-tested at S281, one mutant per assertion (sandbox, jstats:::
# shimmed against a source()'d master): deleting the guard reddens a-b;
# quoting the lowercased copy reddens b alone; blowing the threshold open
# (2 -> 99, so it fires on anything) reddens c-d; dropping the
# lone_positional condition reddens e alone. c-e are the over-fire guards
# -- green on the base master by design, red only when the guard reaches
# a call it should leave alone.

check("N61a a mistyped slot gets the did-you-mean and the query line",
      {
        m <- .fl(grab(joptions("missing.converntion")))
        grepl(paste0("joptions(): no setting named \"missing.converntion\". ",
                     "Did you mean missing.convention?"), m, fixed = TRUE) &&
          grepl("joptions(\"missing.convention\")", m, fixed = TRUE)
      })

check("N61b Rule AB: the mixed-case original is quoted, not a lowercased copy",
      {
        m <- .fl(grab(joptions("Missing.Converntion")))
        grepl("named \"Missing.Converntion\".", m, fixed = TRUE) &&
          !grepl("named \"missing.converntion\".", m, fixed = TRUE)
      })

check("N61c a string near no slot keeps the conventions choice error",
      {
        m <- .fl(grab(joptions("xyzzy")))
        grepl("`missing.convention` must be \"none\", \"spss\", \"stata\", or \"sas\".",
              m, fixed = TRUE) &&
          !grepl("Did you mean", m, fixed = TRUE)
      })

check("N61d a convention value in the same position still SETS (no guard)",
      {
        m <- grab(joptions("spss", quiet = TRUE))
        ok <- identical(getOption(".jst_options_missing_convention"), "spss") &&
          !grepl("Did you mean", m, fixed = TRUE)
        options(.jst_options_missing_convention = NULL)
        ok
      })

check("N61e a NAMED setting call with a slot name as its value is not a query",
      {
        m <- .fl(grab(joptions(missing.convention = "data.dir")))
        grepl("`missing.convention` must be", m, fixed = TRUE) &&
          !grepl("Did you mean", m, fixed = TRUE)
      })
options(.jst_options_missing_convention = NULL)

# =============================================================================
# N62 -- jconvert to = "spss": more markers than codes (S281; the band, S319)
# =============================================================================
# S281-S314: the beyond-codes REFUSAL. It named "3" in four places while the
# check it reports on is the codes-set length (1 to 3 per joptions); S281
# made the heading name the real limit at a narrowed setting and offer the
# widen remedy only where widening could succeed (the gate); S314 re-pinned
# the three twice (see below).
# S319 RE-PIN: the refusal is gone at every setting of two or three codes.
# A column with more markers than codes is now CONVERTED, its codes declared
# as a missing-value RANGE from the first convention code (the S318 ruling;
# the mechanics and the remaining refusals -- a single code, a range that
# would reach 0 -- are N72's). The three fixtures stand; each now asserts
# the conversion: the range, the report's range entry, and the range note
# naming the setting (N62a-b, two codes) or SPSS's limit (N62c, three).
# S314 RE-PIN, TWICE. At 0.9.188 the three moved to a LETTER framing:
# the mapping was positional (.a -> codes[1]), so a column carrying .a,
# .b and .e had three markers and still could not convert, and "has more:
# 3 codes" was false for it. At 0.9.189, the same session, the mapping
# became LETTER-ORDER (a column's sorted markers take the codes in turn,
# whatever the letters), so that column converts and the limit is a
# COUNT again -- the count these three always tested. What changed for
# good: the default heading names SPSS's limit in the family form (jsave,
# jdeclare_missing and jrecode all state it), the widen line names the
# maximum, each variable lists its markers by letter (with " (no cases)"
# on a label-only one), the last remedy reduces the markers, and Rule AA's
# first-mention qualifier "lettered" is in place. The S281 because-clause
# and count gate are unchanged (N70l is the gate's correctness on .e).
#
# Codes-option hygiene: this section narrows missing.convention.codes, so
# it records the entering value and restores it, targeted, at its foot.
.entry_codes62 <- getOption(".jst_options_missing_convention_codes")
.mk_tags62 <- function(n) {
  x <- c(1, 2, 3, vapply(letters[seq_len(n)], haven::tagged_na, double(1)))
  haven::labelled(x, labels = c(Yes = 1, No = 2))
}
f62_3 <- data.frame(Income = .mk_tags62(3))
f62_4 <- data.frame(Income = .mk_tags62(4))
options(.jst_options_missing_convention = "stata")
options(.jst_options_missing_convention_codes = c(-99, -98))

check("N62a 2-code setting, 3 tags: converted, a range [-99, -97], the note names the setting (S319 re-pin)",
      {
        m <- .fl(grab(jconvert(f62_3, to = "spss")))
        r <- suppressMessages(jconvert(f62_3, to = "spss"))
        identical(as.numeric(attr(r$Income, "na_range")), c(-99, -97)) &&
          is.null(attr(r$Income, "na_values")) &&
          grepl("Income .a -> -99 .b -> -98 .c -> -97 range -99 to -97",
                m, fixed = TRUE) &&
          grepl(paste0("Note: Income has 3 lettered markers, more than the 2 ",
                       "codes in your missing.convention.codes setting, so its ",
                       "codes were declared as a missing-value range."), m,
                fixed = TRUE) &&
          !grepl("can be converted because", m, fixed = TRUE)
      })

check("N62b 2-code setting, 4 tags: converted, a range [-99, -96] (S319 re-pin; the S281 gate is gone)",
      {
        m <- .fl(grab(jconvert(f62_4, to = "spss")))
        r <- suppressMessages(jconvert(f62_4, to = "spss"))
        identical(as.numeric(attr(r$Income, "na_range")), c(-99, -96)) &&
          grepl("Income .a -> -99 .b -> -98 .c -> -97 .d -> -96 range -99 to -96",
                m, fixed = TRUE) &&
          grepl("Note: Income has 4 lettered markers, more than the 2 codes", m,
                fixed = TRUE) &&
          !grepl("To convert a narrower set", m, fixed = TRUE) &&
          !grepl("Or first reduce", m, fixed = TRUE)
      })

options(.jst_options_missing_convention_codes = c(-99, -98, -97))
check("N62c 3-code setting, 4 tags: converted, the note names SPSS's limit (S319 re-pin)",
      {
        m <- .fl(grab(jconvert(f62_4, to = "spss")))
        r <- suppressMessages(jconvert(f62_4, to = "spss"))
        identical(as.numeric(attr(r$Income, "na_range")), c(-99, -96)) &&
          grepl(paste0("Note: Income has 4 lettered markers, more than the 3 ",
                       "separate missing-value codes SPSS allows, so its codes ",
                       "were declared as a missing-value range."), m,
                fixed = TRUE) &&
          !grepl("SPSS allows at most 3 separate missing-value codes per variable, so",
                 m, fixed = TRUE) &&
          !grepl("because your", m, fixed = TRUE)
      })
options(.jst_options_missing_convention_codes = .entry_codes62)
options(.jst_options_missing_convention = NULL)

# =============================================================================
# N63 -- THE LABELS SIDE OF THE RAW CHANNEL (S283). jrecode and jencode
# stripped the labels parser's tagged_raw record at the parse (S249, on the
# reasoning that neither quotes markers back), so a marker seen ONLY in
# labels fell back to the display case in BOTH the gate head and the
# spss-conflict refusal head, and the refusal's own-first pair (N59) could
# not see its case. S283 harvests the record before stripping and passes
# it to the builder. N42f pins the gate half; these pin the refusal half:
# the head quotes the labels-only marker as typed, and the pair order
# follows it. N63b is the discriminating one -- a labels-only lowercase
# marker must STILL lead stata, so a fix that upper-cased the labels side
# reds it. N63c: a letter on both sides takes the map's spelling.
# =============================================================================

options(.jst_options_missing_convention = "spss")
m63u <- grab(jrecode(f59, v, map = "1,2=1; else=copy",
                     labels = "1=Low; .B=Refused"))
m63l <- grab(jrecode(f59, v, map = "1,2=1; else=copy",
                     labels = "1=Low; .b=Refused"))
m63m <- grab(jrecode(f59, v, map = "3=.A; else=copy",
                     labels = "1=Low; .a=Refused"))
m63e <- grab(jencode(f39t, w, map = "Yes=1; No=0; Refused=2",
                     labels = "1=Yes; .B=Refused"))
check("N63a refusal, labels-only UPPERCASE: quoted as typed, sas leads",
      {
        p <- .order59(m63u)
        grepl("the map uses '.B', a missing-value marker.", .fl(m63u),
              fixed = TRUE) && all(p > 0L) && p[["sas"]] < p[["stata"]]
      })
check("N63b refusal, labels-only lowercase: quoted as typed, stata leads",
      {
        p <- .order59(m63l)
        grepl("the map uses '.b', a missing-value marker.", .fl(m63l),
              fixed = TRUE) && all(p > 0L) && p[["stata"]] < p[["sas"]]
      })
check("N63c a letter on both sides takes the map's spelling",
      grepl("the map uses '.A', a missing-value marker.", .fl(m63m),
            fixed = TRUE))
check("N63d jencode's refusal quotes a labels-only marker as typed",
      grepl("jencode():", m63e, fixed = TRUE) &&
        grepl("the map uses '.B', a missing-value marker.", .fl(m63e),
              fixed = TRUE))
options(.jst_options_missing_convention = NULL)

# =============================================================================
# N64 -- jfreq's MISSING ROWS COUNT THE POOL (S285; the S217 defect). Under
# any pipeline stage jfreq's Missing rows came from FULL-frame counts -- the
# Step-0 masking bundle for SPSS-form, the original column for tags -- while
# the Valid rows and the Total counted the filtered pool, so Valid + Missing
# overshot the Total and the Total % column summed past 100; and because the
# System/NA row is derived by subtraction with a max(0, ...) clamp, the
# over-count could swallow a real System/NA row entirely. S285 counts every
# Missing row off pre_pipeline_data[surviving_ids] (the CPS bottom's pool
# column). Every check here runs under an ACTIVE stage -- with no pipeline
# the pool is the whole frame and pre- and post-fix output are identical, so
# a no-pipeline assertion could not fail (the S259 rule). Three stages x two
# representations, asserted on jfreq's returned frequencies: the reconciling
# identity, the per-row pool counts, the surfaced System/NA row, the Total %
# sum, and the row SET (N64n/N64o: a declared code absent from the pool
# prints at 0 -- including an UNLABELLED tag, whose only declaration is its
# cells; the row set is taken from the full column on purpose). N64i/N64j
# read the printed surface for one row each.
#
# MUTATION MAP (S285, sandbox; each mutant a one-line revert in jfreq):
#   M1 SPSS counts off the full column    -> N64b N64c N64i N64k N64l N64n
#   M2 tag counts off the full column     -> N64f N64g N64j N64k N64m N64o
#   M3 pool_col = the full column (both)  -> M1 + M2 + N64a N64d
#   M4 M3 with the invariant stop removed -> the same 12 minus N64k
# Two lessons are in that map. The IDENTITY and percent checks (N64a/d/e/h)
# pass under M1 and M2 on the jsubset route: the over-count there equals the
# pool's true System/NA count, so the max(0, ...) clamp swallows it and the
# table still sums -- exactly the S217 mechanism. The per-row and System/NA
# checks are what see it. And N64k does not pin the catcher's PRESENCE (nothing on the
# public surface can violate the invariant on shipped code); it pins that
# the invariant HOLDS, and it is the check that reds by NAME when the
# catcher fires, so a revert reads as "internal error" rather than as a
# cascade of NULL tables. The catcher's presence is verified by the M3/M4
# pair, not by a check -- re-run the pair if the stop is ever touched.
# =============================================================================

options(.jst_options_missing_convention = "spss")
f64 <- data.frame(
  S  = haven::labelled_spss(
         c(1, 2, -99, -98, 3, NA, 2, -99, 1, -60, -55, -60, 3, 2),
         labels = c(Refused = -99, DK = -98),
         na_values = c(-99, -98), na_range = c(-70, -51)),
  Tg = haven::labelled(
         c(1, 2, haven::tagged_na("a"), 2, haven::tagged_na("b"), 1, NA,
           haven::tagged_na("a"), 3, 1, 2, 3, 1, 2),
         labels = c(Refused = haven::tagged_na("a"))),   # .b UNLABELLED
  P  = c(1, 2, NA, 3, 1, NA, 2, 2, 1, 3, 3, 2, 1, NA),
  G  = c(1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2))
# run64(): jfreq's return AND its printed surface, from one call, with the
# pipeline chatter kept off the battery's own output.
# An error inside the call (the S285 internal-invariant stop is the one
# that matters) is caught and returned as the text, with val NULL: these
# calls sit OUTSIDE check(), so an uncaught stop would halt the battery
# instead of reddening the checks that read the result.
run64 <- function(expr) {
  val <- NULL
  txt <- tryCatch(printed(val <- expr),
                  error = function(e) paste0("[error] ", conditionMessage(e)))
  list(val = val, txt = txt)
}
# reconciles(): the identity every frequency table must satisfy. FALSE on a
# NULL table (the call errored), so the check reds rather than errors.
reconciles <- function(fr) {
  if (is.null(fr)) return(FALSE)
  na_n <- if (is.null(fr$na)) 0L else fr$na$Freq
  sum(fr$valid$Freq) + sum(fr$udm$Freq) + na_n == fr$total &&
    fr$total == fr$valid_count + fr$missing
}
pct_sum <- function(fr) {
  if (is.null(fr)) return(NA_real_)
  na_p <- if (is.null(fr$na)) 0 else fr$na$TotalPct
  sum(fr$valid$TotalPct) + sum(fr$udm$TotalPct) + na_p
}

# -- jsubset G == 1: rows 1-7. Pool holds S: -99 x1, -98 x1, NA x1, no
#    in-band value; Tg: .a x1, .b x1, NA x1.
invisible(printed(jsubset(f64, G == 1)))
r64s <- run64(jfreq(f64, S))
r64t <- run64(jfreq(f64, Tg))
invisible(printed(jsubset(f64, NULL)))
fs <- r64s$val$frequencies$S
ft <- r64t$val$frequencies$Tg
check("N64a jsubset, SPSS-form: Valid + Missing = Total (7)",
      reconciles(fs) && fs$total == 7L)
check("N64b jsubset, SPSS-form: -99 and -98 count the pool (1, 1); band row at 0",
      identical(fs$udm$Freq, c(1L, 1L, 0L)) &&
        grepl("^range -70 to -51", fs$udm$Value[3]))
check("N64c jsubset, SPSS-form: the System/NA row SURFACES (1)",
      !is.null(fs$na) && fs$na$Freq == 1L)
check("N64d jsubset, SPSS-form: Total % sums to 100",
      isTRUE(all.equal(pct_sum(fs), 100)))
check("N64e jsubset, tagged: Valid + Missing = Total (7)",
      reconciles(ft) && ft$total == 7L)
check("N64f jsubset, tagged: .a and the UNLABELLED .b count the pool (1, 1)",
      nrow(ft$udm) == 2L && identical(ft$udm$Freq, c(1L, 1L)) &&
        grepl("^\\.b", ft$udm$Value[2]))
check("N64g jsubset, tagged: the System/NA row SURFACES (1)",
      !is.null(ft$na) && ft$na$Freq == 1L)
check("N64h jsubset, tagged: Total % sums to 100",
      isTRUE(all.equal(pct_sum(ft), 100)))
# The two printed-surface checks match count and percent with \\s+ between
# cells: the Value column is sized by the widest row (the band row here),
# so a fixed padding would pin the layout, not the number.
check("N64i jsubset, SPSS-form: the PRINTED -99 row carries the pool count",
      grepl("-99 \\[\"Refused\"\\]\\s+1\\s+14\\.29\\s+--", r64s$txt))
check("N64j jsubset, tagged: the PRINTED .a row carries the pool count",
      grepl("\\.a \\[\"Refused\"\\]\\s+1\\s+14\\.29\\s+--", r64t$txt))

# -- jcomplete P: drops rows 3, 6, 14. S loses one -99 and its NA; Tg loses
#    one .a. Then subset = G == 2: rows 8-14 -- S keeps one -99 and the two
#    in-band values, loses -98; Tg keeps one .a, loses .b.
invisible(printed(jcomplete(f64, P)))
r64sc <- run64(jfreq(f64, S))
r64tc <- run64(jfreq(f64, Tg))
invisible(printed(jcomplete(f64, NULL)))
r64ss <- run64(jfreq(f64, S,  subset = G == 2))
r64ts <- run64(jfreq(f64, Tg, subset = G == 2))
fsc <- r64sc$val$frequencies$S;  ftc <- r64tc$val$frequencies$Tg
fss <- r64ss$val$frequencies$S;  fts <- r64ts$val$frequencies$Tg
check("N64k the S285 invariant holds on every route (no internal-error stop)",
      !grepl("internal error", r64s$txt,  fixed = TRUE) &&
        !grepl("internal error", r64t$txt,  fixed = TRUE) &&
        !grepl("internal error", r64sc$txt, fixed = TRUE) &&
        !grepl("internal error", r64tc$txt, fixed = TRUE) &&
        !grepl("internal error", r64ss$txt, fixed = TRUE) &&
        !grepl("internal error", r64ts$txt, fixed = TRUE) &&
        !is.null(fsc) && !is.null(ftc) && !is.null(fss) && !is.null(fts))
check("N64l jcomplete, SPSS-form: reconciles at 11; -99 x1, -98 x1; in-band enumerated (default tier)",
      reconciles(fsc) && fsc$total == 11L &&
        identical(fsc$udm$Freq[1:2], c(1L, 1L)) && is.null(fsc$na))
check("N64m jcomplete, tagged: reconciles at 11; .a x1, .b x1, System/NA x1",
      reconciles(ftc) && ftc$total == 11L &&
        identical(ftc$udm$Freq, c(1L, 1L)) && !is.null(ftc$na) &&
        ftc$na$Freq == 1L)
check("N64n subset =, SPSS-form: reconciles at 7; -98 absent from the pool prints at 0",
      reconciles(fss) && fss$total == 7L &&
        identical(fss$udm$Freq[1:2], c(1L, 0L)))
check("N64o subset =, tagged: reconciles at 7; .b absent from the pool prints at 0",
      reconciles(fts) && fts$total == 7L &&
        identical(fts$udm$Freq, c(1L, 0L)))
check("N64p no pipeline: the same tables reconcile at the full N (14) -- the identity, not the fix",
      {
        f0 <- run64(jfreq(f64, S, Tg))$val$frequencies
        reconciles(f0$S) && reconciles(f0$Tg) && f0$S$total == 14L &&
          identical(f0$S$udm$Freq, c(2L, 1L, 2L, 1L)) &&
          identical(f0$Tg$udm$Freq, c(2L, 1L))
      })
options(.jst_options_missing_convention = NULL)

# =============================================================================
# N65 -- a range declaration survives a recode (S302: the S301 HIGH defect)
# =============================================================================
# jrecode() now reads na_range beside na_values. In-band cells are declared
# missing: preserved under every else setting, never in the unmapped error
# or the heuristic, and the band rides onto the result as na_range. The
# same build aligned the discrete path (a declared but ABSENT code carries
# its declaration, as the D3 cap already counted it), gave the missing
# token a band form (mint inside the band = benign reuse; mint beside a
# band = SPSS's range-plus-one cap), guarded the mint against colliding
# with an ordinary value (the S247 item's jrecode half), refused lettered
# markers against a surviving SPSS-style declaration, and merged a
# supplied labels string with the kept codes' labels.
#
# DISCRIMINATION (sandbox, S302). This section on the PRISTINE 0.9.172
# master reds 24 of its 32 checks: N65a-f, N65h-q, N65s, N65v-w, N65y-z,
# N65ab-ac and N65ae. The eight that PASS there do so by design: N65g (see
# below), N65r (declare-first is the pre-existing benign-reuse route),
# N65t (no false alarm), N65u (a remedy that is plain recoding), N65x
# (the migration idiom, which the refusal must leave legal), N65aa (a
# converted column takes a marker either way), N65ad (a user string alone
# satisfies it) and N65af (width is a property of the emitters).
# N65g is a LOCK, not a discriminator: haven defines is.na() on a
# labelled_spss column to include its declared missings, so the heuristic
# never saw an in-band value on either master and the classifier's
# explicit in-band exclusion is belt-and-braces. It reds only if the
# detector ever starts reading through unclass() -- which is what it
# guards. Ten one-line mutants of the edited master, each run here:
#   M1  in-band cells classified as unmapped again     -> N65a-f, N65h
#   M2  the band not attached to the result            -> N65a-d, N65h-j,
#                                                         N65l-m, N65ab
#   M3  surviving codes counted present-only           -> N65n-p, N65w,
#                                                         N65ac, plus the
#                                                         existing N26b-c
#   M5  the D1 in-band exclusion removed               -> N65i alone
#   M6  the in-band benign-reuse branch removed        -> N65j alone
#   M7  the range-plus-one cap removed                 -> N65k alone
#   M8  the collision guard removed                    -> N65q, N65s
#   M9  the marker refusal removed                     -> N65v, N65w,
#                                                         N65y, N65z
#   M10 the labels merge removed (user string as-is)   -> N65ac, N65ae
#   M11 carried labels not filtered against the user's -> N65ad alone
#                                                         (haven refuses
#                                                         the duplicate)
# Every mutant reds a distinct set and none passes all 32.
# -----------------------------------------------------------------------------

mk_band <- function() haven::labelled_spss(
  c(1, 2, 3, -99, -60, 2, 1, 8),
  labels = c(Yes = 1, No = 2, Maybe = 3, Refused = -99, "Not asked" = -60,
             "Absent in band" = -70),
  na_range = c(-99, -51))

f65 <- data.frame(
  B = mk_band(),
  # a range plus the one code SPSS allows beside it
  C = haven::labelled_spss(c(1, 2, 3, -9, -5, -1, 2, 8),
                           labels = c(Skipped = -1),
                           na_values = -1, na_range = c(-9, -2)),
  # a range alone
  D = haven::labelled_spss(c(1, 2, 3, -9, -5, 2, 1, 8), na_range = c(-9, -2)),
  # three discrete codes, -97 declared but absent
  E = haven::labelled_spss(c(1, 2, 3, -99, -98, 2, 1, 8),
                           labels = c(Refused = -99, DK = -98, Skipped = -97),
                           na_values = c(-99, -98, -97)),
  # three discrete codes, one present
  G = haven::labelled_spss(c(1, 2, 3, -1, 2, 1, 8, 7),
                           na_values = c(-1, -2, -3)),
  # one in-band cell, no labels
  H = haven::labelled_spss(c(1, 2, -60, 1, 2, 1, 2, 1), na_range = c(-99, -51)),
  # a real, undeclared -99
  P = haven::labelled(c(1, 2, 3, -99, 2, 1, 8, 7)),
  # no -99 anywhere; 7 is the colliding target
  Q = haven::labelled(c(1, 2, 3, 2, 1, 8, 7, NA)),
  # the discrete migration fixture
  S = mk_spss()[c(1, 2, 3, 4, 5, 1, 2, 3)]
)
vals65 <- function(r) as.numeric(unclass(r))
rng65  <- function(r) { a <- attr(r, "na_range",  exact = TRUE)
                        if (is.null(a)) NULL else as.numeric(a) }
nav65  <- function(r) { a <- attr(r, "na_values", exact = TRUE)
                        if (is.null(a)) NULL else as.numeric(a) }
lab65  <- function(r) attr(r, "labels", exact = TRUE)

options(.jst_options_missing_convention = "spss")

# -- the S301 reproducer, under each else setting ----------------------------
r65a <- suppressMessages(jrecode(f65, B, map = "1=3; 3=1; else=copy"))
check("N65a else=copy: the band rides as na_range; in-band cells kept; no na_values",
      inherits(r65a, "haven_labelled_spss") &&
        identical(rng65(r65a), c(-99, -51)) && is.null(nav65(r65a)) &&
        identical(vals65(r65a)[4:5], c(-99, -60)))
f65b <- f65; f65b$BR <- r65a
fr65 <- run64(jfreq(f65b, BR))$val$frequencies$BR
check("N65b jfreq on the result counts the two in-band cells as Missing (reconciles at 8); the labelled -70 no case holds is a zero row between them (S348, ruling R4)",
      reconciles(fr65) && fr65$total == 8L && fr65$missing == 2L &&
        identical(fr65$udm$Freq, c(1L, 0L, 1L)))
r65c <- tryCatch(suppressMessages(jrecode(f65, B, map = "1=3; 3=1; 2=2; 8=8")),
                 error = function(e) NULL)
check("N65c no else: in-band cells are not unmapped values (no error; kept)",
      !is.null(r65c) && identical(vals65(r65c)[4:5], c(-99, -60)) &&
        identical(rng65(r65c), c(-99, -51)))
r65d <- suppressMessages(jrecode(f65, B, map = "1=3; 3=1; else=NA"))
check("N65d else=NA: in-band cells kept, the ordinary unmapped 8 goes to NA",
      identical(vals65(r65d)[c(4, 5, 8)], c(-99, -60, NA)) &&
        identical(rng65(r65d), c(-99, -51)))

# -- the range form of the kept-values note -----------------------------------
m65e <- grab(jrecode(f65, B, map = "1=3; 3=1; else=copy"))
check("N65e band note: values with labels, the range, and the plural remedy",
      grepl(paste0("-99 [\"Refused\"], -60 [\"Not asked\"] are inside the ",
                   "declared missing-value range (-99 to -51) and were kept ",
                   "on the recoded variable."), .fl(m65e), fixed = TRUE) &&
        grepl(paste0("To convert them to plain NA instead, map them to NA ",
                     "(for example -99=NA)."), .fl(m65e), fixed = TRUE))
m65f <- grab(jrecode(f65, H, map = "1=2; 2=1"))
check("N65f band note, singular form, unlabelled value",
      grepl(paste0("-60 is inside the declared missing-value range ",
                   "(-99 to -51) and was kept on the recoded variable."),
            .fl(m65f), fixed = TRUE) &&
        grepl("To convert it to a plain NA instead, add -60=NA to the map.",
              .fl(m65f), fixed = TRUE))
options(.jst_output_level = "full")
m65g <- grab(jrecode(f65, B, map = "1=3; 3=1; else=copy"))
options(.jst_output_level = NULL)
check("N65g full tier: no heuristic 'looks like a coded missing value' on in-band cells",
      !grepl("look like coded missing values", m65g, fixed = TRUE) &&
        !grepl("looks like a coded missing value", m65g, fixed = TRUE))

# -- a rule naming an in-band value; a target landing inside the band ---------
m65h <- grab(r65h <- jrecode(f65, B, map = "-99=NA; else=copy"))
check("N65h -99=NA converts that value; -60 stays, the band carries whole, the note names -60 only",
      is.na(vals65(r65h)[4]) && vals65(r65h)[5] == -60 &&
        identical(rng65(r65h), c(-99, -51)) &&
        grepl("-60 [\"Not asked\"] is inside", m65h, fixed = TRUE) &&
        !grepl("Refused", m65h, fixed = TRUE))
m65i <- grab(r65i <- jrecode(f65, B, map = "8=-60; else=copy"))
f65i <- f65; f65i$BR <- r65i
fr65i <- run64(jfreq(f65i, BR))$val$frequencies$BR
check("N65i a target inside the band is missing on the result and draws no D1 note",
      vals65(r65i)[8] == -60 && identical(rng65(r65i), c(-99, -51)) &&
        !grepl("looks like a coded missing value", m65i, fixed = TRUE) &&
        reconciles(fr65i) && fr65i$missing == 3L)

# -- the missing token against a band -----------------------------------------
m65j <- grab(r65j <- jrecode(f65, B, map = "8=missing; else=copy"))
check("N65j mint inside the band: benign reuse -- no na_values entry, band kept, D4 range variant",
      vals65(r65j)[8] == -99 && is.null(nav65(r65j)) &&
        identical(rng65(r65j), c(-99, -51)) &&
        grepl(paste0("B already declares -99 as missing through its ",
                     "missing-value range (-99 to -51), so the recoded ",
                     "variable carries the existing declaration."),
              .fl(m65j), fixed = TRUE))
e65k <- grab(jrecode(f65, C, map = "8=missing; else=copy"))
check("N65k mint beside a range plus one code: the composed cap error, both remedies rendered",
      grepl(paste0("C already declares a missing-value range (-9 to -2) and ",
                   "1 SPSS-style missing value (-1), the most a range allows ",
                   "alongside it."), .fl(e65k), fixed = TRUE) &&
        grepl("'missing' would add -99 as a second code.", .fl(e65k),
              fixed = TRUE) &&
        grepl("f65$CR <- jrecode(f65, C, map = \"8=-1; else=copy\")", e65k,
              fixed = TRUE) &&
        grepl("f65$CR <- jrecode(f65, C, map = \"8=-9; else=copy\")", e65k,
              fixed = TRUE))
r65l1 <- suppressMessages(jrecode(f65, C, map = "8=-1; else=copy"))
r65l2 <- suppressMessages(jrecode(f65, C, map = "8=-9; else=copy"))
check("N65l both N65k remedies run and keep range + one code",
      identical(nav65(r65l1), -1) && identical(rng65(r65l1), c(-9, -2)) &&
        vals65(r65l1)[8] == -1 &&
        identical(nav65(r65l2), -1) && identical(rng65(r65l2), c(-9, -2)) &&
        vals65(r65l2)[8] == -9)
m65m <- grab(r65m <- jrecode(f65, D, map = "8=missing; else=copy"))
check("N65m mint beside a range alone: legal -- range + the minted code, standard D4",
      vals65(r65m)[8] == -99 && identical(nav65(r65m), -99) &&
        identical(rng65(r65m), c(-9, -2)) &&
        grepl("declared as a missing value on the recoded variable",
              m65m, fixed = TRUE))

# -- the discrete alignment: absent declared codes carry ----------------------
r65n <- suppressMessages(jrecode(f65, E, map = "1=3; 3=1; else=copy"))
check("N65n else=copy: the absent declared -97 keeps its declaration and label",
      identical(nav65(r65n), c(-99, -98, -97)) &&
        identical(lab65(r65n)[["Skipped"]], -97))
r65o <- suppressMessages(jrecode(f65, E, map = "1=3; 3=1; else=NA"))
check("N65o else=NA: the same -- declaration and label ride, present codes kept",
      identical(nav65(r65o), c(-99, -98, -97)) &&
        identical(lab65(r65o)[["Skipped"]], -97) &&
        identical(vals65(r65o)[4:5], c(-99, -98)))
r65p <- suppressMessages(jrecode(f65, G, map = "8=7; else=copy"))
check("N65p the result carries what the D3 cap counts: all three declared codes, one present",
      identical(nav65(r65p), c(-3, -2, -1)))

# -- the collision guard (S247, jrecode half) ---------------------------------
e65q <- grab(jrecode(f65, P, map = "8=missing; else=copy"))
check("N65q mint equals an ordinary source value kept by else=copy: stops, both remedies",
      grepl(paste0("'missing' would use -99, from the ",
                   "missing.convention.codes default, but P holds -99 as an ",
                   "ordinary value in 1 case, and declaring it would make ",
                   "that case missing too."), .fl(e65q), fixed = TRUE) &&
        grepl("If -99 marks missing data in P, declare it first:", e65q,
              fixed = TRUE) &&
        # S308: the modify = TRUE form (the S303 mv item), no assignment
        grepl("  jdeclare_missing(f65, P, codes = c(-99), modify = TRUE)",
              e65q, fixed = TRUE) &&
        !grepl("<- jdeclare_missing(", e65q, fixed = TRUE) &&
        grepl(paste0("Otherwise map 8 to a code P does not hold, and declare ",
                     "that code after the recode with jdeclare_missing()."),
              .fl(e65q), fixed = TRUE))
# S308: the printed line is harvested and run (it was hand-copied before),
# so a line that does not change f65 -- no modify = TRUE, no assignment --
# leaves P undeclared and the recode below is no longer benign reuse.
f65r <- .run_lines67(e65q, "f65", f65)
m65r <- grab(r65r <- jrecode(f65r, P, map = "8=missing; else=copy"))
check("N65r the declare-first remedy runs as printed: benign reuse, both cells missing",
      !is.null(f65r) && identical(nav65(f65r$P), -99) &&
        identical(vals65(r65r)[c(4, 7)], c(-99, -99)) &&
        identical(nav65(r65r), -99) &&
        grepl("already declares -99 as a missing value", m65r, fixed = TRUE))
e65s <- grab(jrecode(f65, Q, map = "7=-99; 8=missing; else=copy"))
check("N65s mint equals the user's own map target: stops, names the rule, both remedies",
      grepl(paste0("but the map also assigns -99 as an ordinary value ",
                   "(7=-99), and declaring it would make those cases ",
                   "missing too."), .fl(e65s), fixed = TRUE) &&
        grepl("f65$QR <- jrecode(f65, Q, map = \"7=missing; 8=missing; else=copy\")",
              e65s, fixed = TRUE) &&
        grepl("Or give 7 a different code.", e65s, fixed = TRUE))
r65t1 <- tryCatch(suppressMessages(jrecode(f65, P, map = "8=missing; else=NA")),
                  error = function(e) NULL)
r65t2 <- tryCatch(suppressMessages(jrecode(f65, P, map = "-99=NA; 8=missing; else=copy")),
                  error = function(e) NULL)
check("N65t no false alarm: else=NA and an explicit -99=NA both proceed",
      !is.null(r65t1) && is.na(vals65(r65t1)[4]) && vals65(r65t1)[7] == -99 &&
        !is.null(r65t2) && is.na(vals65(r65t2)[4]) && vals65(r65t2)[7] == -99)
r65u <- suppressMessages(jrecode(f65, Q, map = "7=missing; 8=missing; else=copy"))
check("N65u the N65s remedy runs: both rules mint the one code, declared once",
      identical(vals65(r65u)[6:7], c(-99, -99)) && identical(nav65(r65u), -99))

# -- lettered markers against a surviving SPSS-style declaration --------------
options(.jst_options_missing_convention = "stata")
e65v <- grab(jrecode(f65, B, map = "8=.a; else=copy"))
check("N65v band source + marker: refused, jconvert remedy, no map-as-well line",
      grepl(paste0("B carries a missing-value range (-99 to -51), so the ",
                   "marker .a cannot be added to it."), .fl(e65v), fixed = TRUE) &&
        grepl("Convert the data frame first, then recode:", e65v, fixed = TRUE) &&
        grepl("jconvert(f65, to = \"stata\", modify = TRUE)", e65v, fixed = TRUE) &&
        !grepl("Or map", e65v, fixed = TRUE))
e65w <- grab(jrecode(f65, E, map = "8=.a; else=copy"))
check("N65w discrete survivors + marker: refused, names the codes, offers mapping them too",
      grepl(paste0("E carries SPSS-style missing values (-99, -98, -97) that ",
                   "the map leaves in place, so the marker .a cannot be ",
                   "added to it."), .fl(e65w), fixed = TRUE) &&
        grepl(paste0("Or map -99, -98, and -97 as well, so no SPSS-style ",
                     "missing value remains."), .fl(e65w), fixed = TRUE))
r65x <- suppressMessages(jrecode(f65, S, map = "-99=.a; -98=.b; else=copy"))
check("N65x the migration idiom passes: every declared code named, a clean tagged result",
      !inherits(r65x, "haven_labelled_spss") && is.null(nav65(r65x)) &&
        identical(haven::na_tag(vals65(r65x))[c(3, 5)], c("a", "b")))
e65y <- grab(jrecode(f65, E, map = "8=7; else=copy", labels = ".a=Refused"))
check("N65y a marker arriving through labels alone is refused the same way",
      grepl("so the marker .a cannot be added to it.", .fl(e65y), fixed = TRUE))
options(.jst_options_missing_convention = NULL)
e65z <- grab(jrecode(f65, E, map = "8=.A; else=copy", convention = "sas"))
check("N65z per-call sas: the marker quoted as typed, the remedy names sas",
      grepl("so the marker .A cannot be added to it.", .fl(e65z), fixed = TRUE) &&
        grepl("jconvert(f65, to = \"sas\", modify = TRUE)", e65z, fixed = TRUE))
options(.jst_options_missing_convention = "stata")
f65aa <- suppressMessages(jconvert(f65, to = "stata"))
r65aa <- tryCatch(suppressMessages(jrecode(f65aa, B, map = "8=.a; else=copy")),
                  error = function(e) NULL)
check("N65aa the jconvert remedy runs: the converted column takes the marker",
      !is.null(r65aa) && is.null(rng65(r65aa)) && is.null(nav65(r65aa)) &&
        identical(haven::na_tag(vals65(r65aa))[8], "a"))
r65ab <- suppressMessages(jrecode(f65, B, map = "8=7; else=copy"))
check("N65ab a band under a stata setting with no markers in the call: carried, no refusal",
      identical(rng65(r65ab), c(-99, -51)) && vals65(r65ab)[8] == 7)
options(.jst_options_missing_convention = "spss")

# -- a supplied labels string and the kept values' labels ---------------------
r65ac <- suppressMessages(jrecode(f65, E, map = "1=3; 3=1; else=copy",
                                  labels = "3=Yes; 1=Maybe"))
l65ac <- lab65(r65ac)
check("N65ac user labels plus the kept codes' labels: all five present",
      all(c("Yes", "Maybe", "Refused", "DK", "Skipped") %in% names(l65ac)) &&
        identical(l65ac[["Refused"]], -99) && identical(l65ac[["Yes"]], 3))
# tryCatch: an unfiltered carry hands haven two labels on -99, and its
# constructor stops ("labels must be unique") -- outside check() that would
# halt the battery instead of reddening this line (mutant M11).
r65ad <- tryCatch(suppressMessages(jrecode(f65, E, map = "1=3; 3=1; else=copy",
                                           labels = "3=Yes; 1=Maybe; -99=Declined")),
                  error = function(e) NULL)
l65ad <- if (is.null(r65ad)) NULL else lab65(r65ad)
check("N65ad a user label on a kept code wins over the carried one",
      !is.null(l65ad) && identical(l65ad[["Declined"]], -99) &&
        !("Refused" %in% names(l65ad)) && sum(l65ad == -99) == 1L)
r65ae <- suppressMessages(jrecode(f65, B, map = "1=3; 3=1; else=NA",
                                  labels = "3=Yes; 1=Maybe"))
l65ae <- lab65(r65ae)
check("N65ae in-band labels ride with user labels, present or not (-70 absent)",
      all(c("Yes", "Maybe", "Refused", "Not asked", "Absent in band") %in%
            names(l65ae)) &&
        identical(l65ae[["Absent in band"]], -70) && !("No" %in% names(l65ae)))

# -- Rule U on every new message -----------------------------------------------
w65 <- function(x) max(nchar(strsplit(x, "\n", fixed = TRUE)[[1]]))
options(.jst_options_missing_convention = "spss")
r65w1 <- rendered(invisible(jrecode(f65, B, map = "1=3; 3=1; else=copy")))
r65w2 <- rendered(jrecode(f65, C, map = "8=missing; else=copy"))
r65w3 <- rendered(jrecode(f65, P, map = "8=missing; else=copy"))
r65w4 <- rendered(jrecode(f65, Q, map = "7=-99; 8=missing; else=copy"))
options(.jst_options_missing_convention = "stata")
r65w5 <- rendered(jrecode(f65, B, map = "8=.a; else=copy"))
r65w6 <- rendered(jrecode(f65, E, map = "8=.a; else=copy"))
options(.jst_options_missing_convention = NULL)
check("N65af no rendered line of the six new messages exceeds the pinned width",
      all(vapply(list(r65w1, r65w2, r65w3, r65w4, r65w5, r65w6), w65,
                 numeric(1)) <= .pin_width))

# -- S308: the guard's lines carry a per-call convention (S267's rule) -----
# Under an unset setting with convention = "spss" on the call, the old
# lines pasted without it: the declare line then gated, and the map line
# gated on its token. Both routes now carry the argument, as the D1 pair
# and jencode's twin already did (N66c, N67h).
# DISCRIMINATION (sandbox, S308): the pristine 0.9.178 master reds N65q and
# N65ag. Two one-line mutants: M9 modify = TRUE dropped from the declare
# line -> N65q, N65r (the harvested run leaves P undeclared), N65ag;
# M10 the convention carry dropped -> N65ag alone.
options(.jst_options_missing_convention = NULL)
e65ag1 <- grab(jrecode(f65, P, map = "8=missing; else=copy", convention = "spss"))
e65ag2 <- grab(jrecode(f65, Q, map = "7=-99; 8=missing; else=copy",
                       convention = "spss"))
f65ag  <- .run_lines67(e65ag1, "f65", f65)
check("N65ag a per-call convention rides on both guard remedy lines, and the declare line runs unset",
      grepl(paste0("  jdeclare_missing(f65, P, codes = c(-99), ",
                   "convention = \"spss\", modify = TRUE)"), .r5_one(e65ag1),
            fixed = TRUE) &&
        grepl(paste0("f65$QR <- jrecode(f65, Q, map = \"7=missing; ",
                     "8=missing; else=copy\", convention = \"spss\")"),
              .r5_one(e65ag2), fixed = TRUE) &&
        !is.null(f65ag) && identical(nav65(f65ag$P), -99))
options(.jst_options_missing_convention = "spss")

# =============================================================================
# N66 -- the D1 "declare" remedy names the result (S303)
# =============================================================================
# From S267 to S302 the D1 note's second remedy named the SOURCE column, in
# the assignment form. In jrecode that declared a code no source cell holds,
# and the recoded column kept it as a real value unless the recode was
# re-run; in jencode it errored, since a text column cannot carry a
# missing-value code. jrecode cannot see the column the user assigns to
# (Rule S's scope note), so the remedy is now the documented two-step pair:
# the user's own call into <var>R, then jdeclare_missing() on that column
# with modify = TRUE (Rule S, S229 corollary: a suggestion teaches
# modify = TRUE alone). The pair names only what it creates, so it runs
# whatever the user called their own column.
#
# N66d-g PASTE AND RUN the lines the note PRINTS -- harvested from the
# captured message, not hand-copied -- so they fail on a note whose remedy
# does not work (the S259 rule: a hand-copied pair would pass on any
# master). N66g pins only the declare pair's plural, which keeps -99 and
# -98 distinct; the first remedy's plural merge is the open S250 item and
# stays deliberately unpinned (see the N55e comment).
#
# DISCRIMINATION (sandbox, S303). On the PRISTINE 0.9.173 master all seven
# N66 checks red, and so do the two flipped pins (N30a, N55d). Three
# one-line mutants of the edited master:
#   M1  the declare line names the source again (both
#       homes)                                            -> N30a, N66a-g
#   M2  modify = TRUE dropped from the declare line     -> N30a, N66a-g
#   M3  the jencode twin reverted alone                  -> N66b, N66f
# M2 reddening the paste-and-run checks is the point of harvesting: a bare
# jdeclare_missing() line with no assignment and no modify = TRUE changes
# nothing, and only running the printed lines can see that.
# =============================================================================

f66  <- data.frame(v = c(1, 2, 8, 2, 1, 3, NA))
f66t <- data.frame(w = c("Yes", "No", "Refused", "Yes", "Maybe", NA),
                   stringsAsFactors = FALSE)
f66p <- data.frame(v = c(1, 2, 8, 2, 9, 3, NA))

# .run_pair66(): the remedy lines printed under the note's declare intro
# (every following line that opens with two spaces), evaluated in a
# scratch environment that holds the frame under the name the note uses.
# modify = TRUE writes back into that environment, as it would into the
# user's workspace. Returns the frame afterwards, or NULL if the intro is
# missing or a line errors.
.run_pair66 <- function(msg, frame_name, frame) {
  tryCatch({
    lines <- strsplit(msg, "\n", fixed = TRUE)[[1]]
    # S308: the intro is any line ending "recoded/encoded variable:" --
    # "Or declare ..." in the singular note, "... declare them ..." in the
    # plural, where the pair is the only remedy. The plural lead wraps at
    # the pinned width, so only the tail of the phrase is matched.
    i <- grep("(recoded|encoded) variable:$", lines)
    if (length(i) != 1L) return(NULL)
    pair <- character(0)
    j <- i + 1L
    while (j <= length(lines) && startsWith(lines[j], "  ")) {
      pair <- c(pair, lines[j])
      j <- j + 1L
    }
    pair <- .r5_calls(pair)
    e <- new.env(parent = globalenv())
    assign(frame_name, frame, envir = e)
    suppressMessages(utils::capture.output(
      for (ln in pair) eval(parse(text = ln), envir = e)))
    get(frame_name, envir = e)
  }, error = function(err) NULL)
}

options(.jst_options_missing_convention = "spss")
m66a <- grab(jrecode(f66, v, map = "8=-99; else=copy"))
check("N66a jrecode: the declare remedy recodes into vR, then declares on vR",
      grepl("Or declare -99 as missing on the recoded variable:", .fl(m66a),
            fixed = TRUE) &&
        grepl(paste0('  f66$vR <- jrecode(f66, v, map = "8=-99; else=copy")\n',
                     "  jdeclare_missing(f66, vR, codes = c(-99), ",
                     "modify = TRUE)"), m66a, fixed = TRUE) &&
        !grepl("<- jdeclare_missing(", m66a, fixed = TRUE) &&
        !grepl("jdeclare_missing(f66, v,", m66a, fixed = TRUE))

m66b <- grab(jencode(f66t, w, map = "Yes=1; No=0; Refused=-99; Maybe=2"))
check("N66b jencode: the same pair in its own voice, on wR",
      grepl("Or declare -99 as missing on the encoded variable:", .fl(m66b),
            fixed = TRUE) &&
        grepl(paste0("  f66t$wR <- jencode(f66t, w, map = ",
                     '"Yes=1; No=0; Refused=-99; Maybe=2")\n',
                     "  jdeclare_missing(f66t, wR, codes = c(-99), ",
                     "modify = TRUE)"), m66b, fixed = TRUE) &&
        !grepl("jdeclare_missing(f66t, w,", m66b, fixed = TRUE))

options(.jst_options_missing_convention = NULL)
m66c <- grab(jrecode(f66, v, map = "8=-99; else=copy", convention = "stata"))
check("N66c a per-call convention rides on both lines of the pair",
      grepl(paste0('  f66$vR <- jrecode(f66, v, map = "8=-99; else=copy", ',
                   'convention = "stata")\n',
                   "  jdeclare_missing(f66, vR, codes = c(-99), ",
                   'convention = "stata", modify = TRUE)'), .r5_one(m66c),
            fixed = TRUE))

# The pair carries no convention = here (neither did the call), so it runs
# under the setting: spss again, as when m66a was captured. Under the unset
# state the declare line would gate, as the unset note's menu says.
options(.jst_options_missing_convention = "spss")
r66d <- .run_pair66(m66a, "f66", f66)
check("N66d paste-and-run (spss): -99 declared on vR, the source untouched",
      !is.null(r66d) && inherits(r66d$vR, "haven_labelled_spss") &&
        identical(attr(r66d$vR, "na_values"), -99) && is.na(r66d$vR[3]) &&
        identical(r66d$v, f66$v))

options(.jst_options_missing_convention = "stata")
m66e <- grab(jrecode(f66, v, map = "8=-99; else=copy"))
r66e <- .run_pair66(m66e, "f66", f66)
check("N66e paste-and-run (stata): -99 becomes .a on vR, no real -99 left",
      !is.null(r66e) &&
        identical(haven::na_tag(unclass(r66e$vR))[3], "a") &&
        !any(unclass(r66e$vR) == -99, na.rm = TRUE) &&
        identical(r66e$v, f66$v))

options(.jst_options_missing_convention = "spss")
r66f <- .run_pair66(m66b, "f66t", f66t)
check("N66f paste-and-run (jencode): the pair runs and declares -99 on wR",
      !is.null(r66f) && identical(attr(r66f$wR, "na_values"), -99) &&
        is.character(r66f$w))

m66g <- grab(jrecode(f66p, v, map = "8=-99; 9=-98; else=copy"))
r66g <- .run_pair66(m66g, "f66p", f66p)
check("N66g plural: the pair declares -99 and -98 separately, codes intact",
      grepl("jdeclare_missing(f66p, vR, codes = c(-99, -98), modify = TRUE)",
            m66g, fixed = TRUE) &&
        !is.null(r66g) &&
        identical(sort(attr(r66g$vR, "na_values")), c(-99, -98)) &&
        identical(unclass(r66g$vR)[c(3, 5)], c(-99, -98)))

# =============================================================================
# N67 -- jencode's mint collision guard (S304)
# =============================================================================
# The S247 mint-collision item's jencode half. Under spss the missing token
# mints -99 and declares it on the result, so the mint must not equal a
# value the result will hold as an ordinary value. jencode had no guard at
# all: a plain target of the user's own map (a word, the blank rule, or the
# NA rule) or a number stored as text kept at face value under the else-only
# repair reading landed on the declared -99 beside the token's cells. The
# blank-target route was fully silent (no collapse note -- a blank is not a
# word), and the D1 nudge dropped the mint from its flag set, so a
# collision switched off the one note that might have named it -- even
# when no cell reached the token (N67d). The guard is the jrecode S302
# twin: it stops, never advances to the next code, and reads the MAP for
# the target route (N67d), the cells only for the face route.
#
# N67f and N67g PASTE AND RUN the lines the error PRINTS -- harvested from
# the captured message by .run_lines67(), never hand-copied (the S303
# convention, REMEDY LINES ARE RUN, NOT READ). N67i and N67j are LOCKS, not
# discriminators: they pass on both masters, and pin that the guard does
# not fire where it should not (a non-colliding -98 keeps its D1 nudge; the
# stata arm stays unguarded, as jrecode's does) and that the incomplete-map
# error still comes first, so every map the guard prints is complete.
#
# DISCRIMINATION (sandbox, S304). On the PRISTINE 0.9.174 master exactly
# N67a-h red. Six one-line mutants of the edited master:
#   M1  the whole guard removed                          -> N67a-h
#   M2  the face-value check removed                     -> N67e, N67f, N67h
#   M3  the map-target check removed                     -> N67a-d, N67g
#   M4  the NA-rule target not checked                   -> N67c alone
#   M5  the target remedy printed without the swap       -> N67a, N67g
#   M6  the face remedy keeps the token's rules          -> N67e, N67f, N67h
# The G4 removal (the D1 nudge's setdiff of the mint) has no mutant: with
# the guard stopping first it is unreachable, which is why it was removed.
# =============================================================================

f67t <- data.frame(w = c("Yes", "No", "Refused", "Declined", "Yes", "", NA),
                   stringsAsFactors = FALSE)
f67n <- data.frame(w = c("Yes", "No", "Refused", "Yes"),
                   stringsAsFactors = FALSE)
f67f <- data.frame(q = c("-99", "5", "", "3", "-99", "Refused", NA, ""),
                   stringsAsFactors = FALSE)

# .run_lines67() is defined in the harness (moved there at S308, so it sits
# above its first caller, N65r).

options(.jst_options_missing_convention = "spss")

e67a <- grab(jencode(f67t, w, map = "Yes=1; No=0; Declined=missing; Refused=-99; blank=3"))
check("N67a word target equals the mint: stops, names the rule, both remedies",
      grepl(paste0("jencode(): 'missing' would use -99, from the ",
                   "missing.convention.codes default, but the map also ",
                   "assigns -99 as an ordinary value (Refused=-99), and ",
                   "declaring it would make those cases missing too."),
            .fl(e67a), fixed = TRUE) &&
        grepl(paste0('  f67t$wR <- jencode(f67t, w, map = "Yes=1; No=0; ',
                     'Declined=missing; Refused=missing; blank=3")'),
              .r5_one(e67a), fixed = TRUE) &&
        grepl("Or give \"Refused\" a different code.", e67a, fixed = TRUE))

e67b <- grab(jencode(f67t, w, map = "Yes=1; No=0; Declined=missing; Refused=2; blank=-99"))
check("N67b blank-rule target: silent before S304, now stops as blank cells",
      grepl("assigns -99 as an ordinary value (blank=-99), and", .fl(e67b),
            fixed = TRUE) &&
        grepl("Or give blank cells a different code.", e67b, fixed = TRUE))

e67c <- grab(jencode(f67t, w, map = "Yes=1; No=0; Declined=missing; Refused=2; blank=3; NA=-99"))
check("N67c NA-rule target: stops, names NA",
      grepl("assigns -99 as an ordinary value (NA=-99), and", .fl(e67c),
            fixed = TRUE) &&
        grepl("Or give NA a different code.", e67c, fixed = TRUE))

e67d <- grab(jencode(f67n, w, map = "Yes=1; No=0; Refused=-99; NA=missing"))
check("N67d the map is read, not the cells: stops with no NA cell to mint",
      grepl("assigns -99 as an ordinary value (Refused=-99), and",
            .fl(e67d), fixed = TRUE))

e67e <- grab(jencode(f67f, q, map = "blank=missing; else=NA"))
check("N67e face-value route: stops, counts the cells, both remedies",
      grepl(paste0("'missing' would use -99, from the missing.convention.codes ",
                   "default, but 'q' holds \"-99\" in 2 cases, which the ",
                   "encode keeps as -99, and declaring it would make those ",
                   "cases missing too."), .fl(e67e), fixed = TRUE) &&
        grepl(paste0("If -99 marks missing data in 'q', drop missing from ",
                     "the map and declare -99 after the encode:"),
              .fl(e67e), fixed = TRUE) &&
        grepl(paste0('  f67f$qR <- jencode(f67f, q, map = "else=NA")\n',
                     "  jdeclare_missing(f67f, qR, codes = c(-99), ",
                     "modify = TRUE)"), e67e, fixed = TRUE) &&
        grepl(paste0("Otherwise map blank cells to a code 'q' does not hold, ",
                     "and declare that code after the encode with ",
                     "jdeclare_missing()."), .fl(e67e), fixed = TRUE))

r67f <- .run_lines67(e67e, "f67f", f67f)
check("N67f paste-and-run the face pair: -99 declared on qR, blanks NA, source untouched",
      !is.null(r67f) && inherits(r67f$qR, "haven_labelled_spss") &&
        identical(attr(r67f$qR, "na_values"), -99) &&
        identical(unclass(r67f$qR)[c(1, 5)], c(-99, -99)) &&
        all(is.na(unclass(r67f$qR)[c(3, 6, 7, 8)])) &&
        identical(r67f$q, f67f$q))

r67g <- .run_lines67(e67a, "f67t", f67t)
check("N67g paste-and-run the target remedy: both words on -99, declared once",
      !is.null(r67g) && identical(attr(r67g$wR, "na_values"), -99) &&
        identical(unclass(r67g$wR)[3:4], c(-99, -99)) &&
        identical(r67g$w, f67t$w))

options(.jst_options_missing_convention = NULL)
e67h <- grab(jencode(f67f, q, map = "NA=missing; else=NA", convention = "spss"))
check("N67h a per-call convention rides on both face-pair lines; the NA token is named NA",
      grepl(paste0('  f67f$qR <- jencode(f67f, q, map = "else=NA", ',
                   'convention = "spss")\n',
                   "  jdeclare_missing(f67f, qR, codes = c(-99), ",
                   'convention = "spss", modify = TRUE)'), .r5_one(e67h),
            fixed = TRUE) &&
        grepl("Otherwise map NA to a code 'q' does not hold,", .fl(e67h),
              fixed = TRUE))

options(.jst_options_missing_convention = "spss")
m67i <- grab(r67i1 <- jencode(f67t, w, map = "Yes=1; No=0; Declined=missing; Refused=-98; blank=3"))
# S308: the stata half used to pin the UNGUARDED arm (Refused=.a beside
# the token, both on .a). That merge is now the N69 stop, so this lock's
# stata call names a marker the token does not use.
r67i2 <- tryCatch(suppressMessages(jencode(f67t, w,
           map = "Yes=1; No=0; Declined=missing; Refused=.b; blank=3",
           convention = "stata")), error = function(e) NULL)
check("N67i no false alarm: a -98 target proceeds with its D1 nudge; a distinct stata marker proceeds",
      !grepl("'missing' would use", m67i, fixed = TRUE) &&
        grepl("\"Refused\" was encoded as -98, which looks like a coded",
              .fl(m67i), fixed = TRUE) &&
        identical(attr(r67i1, "na_values"), -99) &&
        !is.null(r67i2) &&
        identical(haven::na_tag(unclass(r67i2))[3:4], c("b", "a")))

e67j <- grab(jencode(f67t, w, map = "Declined=missing; Refused=-99"))
check("N67j the incomplete-map error still comes first, so printed maps are complete",
      grepl("contains words not in the map", .fl(e67j), fixed = TRUE) &&
        !grepl("'missing' would use", e67j, fixed = TRUE))

# =============================================================================
# N68 -- the D1 plural note leads with the declare pair (S308: the S250 item)
# =============================================================================
# The missing token mints ONE value per convention (Decision 14), so the
# note's token remedy, rendered from two or more flagged targets
# ("8=missing; 9=missing"), merged distinct codes onto one mint with nothing
# said -- the S250 merging recipe, verified live then and deliberately left
# unpinned since (N55e, N66g). The plural note now carries only the declare
# pair, which keeps every code distinct under every convention (N66g pins
# the pair's plural), under a lead that ends "declare them on the
# recoded/encoded variable:" (unset: the menu, then "Then declare them
# ..."), and closes with a prose pointer to the merge that prints no
# recipe. The singular note is untouched (N68f is a LOCK on it). N68b
# PASTES AND RUNS the plural pair under stata: -99 and -98 become .a and
# .b, distinct.
#
# DISCRIMINATION (sandbox, S308). On the PRISTINE 0.9.178 master N68a, N68c,
# N68d and N68e red; N68b passes there too (the pristine note also prints
# the pair) and N68f passes on both by design. Mutants of the edited master:
#   M7  jrecode's plural branch reverted to the token line -> N68a, N68b,
#       N68d, N68e, and N66g (the lead's two "variable:" lines defeat the
#       harvester, which is the harvester working)
#   M8  jencode's plural branch reverted alone            -> N68c
# =============================================================================

f68  <- data.frame(v = c(1, 2, 8, 2, 9, 3, NA))
f68t <- data.frame(w = c("Yes", "No", "Refused", "Declined", "Yes", NA),
                   stringsAsFactors = FALSE)
f68x <- data.frame(v = c(1, 2, 8, 9, 7, 3, 1))

options(.jst_options_missing_convention = "spss")
m68a <- grab(jrecode(f68, v, map = "8=-99; 9=-98; else=copy"))
check("N68a jrecode plural (spss): declare lead, the pair, the prose pointer, no token line",
      grepl(paste0("To make the values missing under SPSS convention, ",
                   "declare them on the recoded variable:"), .fl(m68a),
            fixed = TRUE) &&
        grepl(paste0('  f68$vR <- jrecode(f68, v, map = "8=-99; 9=-98; else=copy")\n',
                     "  jdeclare_missing(f68, vR, codes = c(-99, -98), ",
                     "modify = TRUE)\n",
                     "To make them one missing value instead, map both to ",
                     "missing."), m68a, fixed = TRUE) &&
        !grepl("=missing", m68a, fixed = TRUE) &&
        !grepl("map them directly", m68a, fixed = TRUE) &&
        !grepl("Or declare", m68a, fixed = TRUE))

options(.jst_options_missing_convention = "stata")
m68b <- grab(jrecode(f68, v, map = "8=-99; 9=-98; else=copy"))
r68b <- .run_pair66(m68b, "f68", f68)
check("N68b paste-and-run the plural pair (stata): -99 -> .a and -98 -> .b, distinct",
      !is.null(r68b) &&
        identical(haven::na_tag(unclass(r68b$vR))[c(3, 5)], c("a", "b")) &&
        !any(unclass(r68b$vR) %in% c(-99, -98)) &&
        identical(r68b$v, f68$v))

options(.jst_options_missing_convention = "spss")
m68c <- grab(jencode(f68t, w, map = "Yes=1; No=0; Refused=-99; Declined=-98"))
check("N68c jencode plural: the same shape in its own voice, on wR",
      grepl(paste0("To make the values missing under SPSS convention, ",
                   "declare them on the encoded variable:"), .fl(m68c),
            fixed = TRUE) &&
        grepl(paste0("  f68t$wR <- jencode(f68t, w, map = ",
                     '"Yes=1; No=0; Refused=-99; Declined=-98")\n',
                     "  jdeclare_missing(f68t, wR, codes = c(-99, -98), ",
                     "modify = TRUE)\n",
                     "To make them one missing value instead, map both to ",
                     "missing."), .r5_one(m68c), fixed = TRUE) &&
        !grepl("=missing", m68c, fixed = TRUE))

options(.jst_options_missing_convention = NULL)
m68d <- grab(jrecode(f68, v, map = "8=-99; 9=-98; else=copy"))
check("N68d unset plural: the menu, then \"Then declare them\", no token line",
      .has_menu3(m68d) &&
        grepl(paste0("the values cannot be made missing yet."), .fl(m68d),
              fixed = TRUE) &&
        grepl("Then declare them on the recoded variable:", m68d,
              fixed = TRUE) &&
        !grepl("Then map them directly", m68d, fixed = TRUE) &&
        !grepl("=missing", m68d, fixed = TRUE))

options(.jst_options_missing_convention = "spss")
m68e <- grab(jrecode(f68x, v, map = "8=-99; 9=-98; 7=-97; else=copy"))
check("N68e three flagged values: the pointer reads \"map them all to missing\"",
      grepl("codes = c(-99, -98, -97), modify = TRUE)", m68e, fixed = TRUE) &&
        grepl("To make them one missing value instead, map them all to missing.",
              m68e, fixed = TRUE))

m68f <- grab(jrecode(f68, v, map = "8=-99; else=copy"))
check("N68f LOCK the singular note keeps its token line and its Or-declare pair",
      grepl(paste0("To make the value missing under SPSS convention, ",
                   "map it directly:"), .fl(m68f), fixed = TRUE) &&
        grepl('  f68$vR <- jrecode(f68, v, map = "8=missing; else=copy")\n',
              m68f, fixed = TRUE) &&
        grepl("Or declare -99 as missing on the recoded variable:", .fl(m68f),
              fixed = TRUE) &&
        !grepl("To make them one missing value", m68f, fixed = TRUE))

# =============================================================================
# N69 -- the tag collision guard (S308: the S304 tag-merge item)
# =============================================================================
# Under a stata or sas resolution the missing token mints .a (.A) -- the
# marker jconvert pairs with codes[1] -- and never advances to .b, for the
# reason the spss mint never advances to codes[2] (S302). A map that also
# names that marker itself (a rule, the NA rule, else=.a) merged two
# distinct missing categories onto it with no message in jrecode and only
# the label-collapse note in jencode. Both now stop through the shared
# .jst_tag_collision_guard(): the head names the map's own rule and the
# sharers, the first remedy re-renders the token's rules to the first
# marker free of the map, the labels and the source column, the second to
# the map's own marker (the merge, on purpose). The map is read, not the
# cells (N69i). N69b and N69h RUN both rival lines, each alone.
#
# LOCKS (pass on both masters): N69j -- a distinct marker beside the token
# proceeds, and a label on the token's own marker is not a collision;
# N69k -- the source column's own .a cells kept by else=copy still absorb
# the token silently: the tag form of the spss arm's benign reuse, RECORDED
# at S308 and not ruled (the S239 silent texture stands until revisited).
#
# DISCRIMINATION (sandbox, S308). On the PRISTINE 0.9.178 master N69a-i red.
# Mutants of the edited master:
#   M1  the guard's stop removed (helper returns early)   -> N69a-i
#   M2  the NA-rule route not checked                     -> N69c
#   M3  the else route not checked                        -> N69d
#   M4  the free-marker search ignores the source's tags  -> N69g
#   M5  the free-marker search ignores the map's tags     -> N69f
#   M6  jencode's call site removed                       -> N69h
# The rider's two mutants live in the N65 section's S308 note (N65q,
# N65r, N65ag).
# =============================================================================

f69  <- data.frame(v = c(1, 2, 8, 9, 1, 8, NA))
f69n <- data.frame(v = c(1, 2, 8, 1, 8))          # no 9: nothing reaches the token
f69s <- data.frame(v = haven::labelled(
  c(1, 2, 8, 9, haven::tagged_na("b"), 8, haven::tagged_na("b")),
  labels = stats::setNames(haven::tagged_na("b"), "Skipped")))
f69a <- data.frame(v = haven::labelled(
  c(1, 2, 8, 9, haven::tagged_na("a"), 8, NA),
  labels = stats::setNames(haven::tagged_na("a"), "Refused")))
f69t <- data.frame(w = c("Yes", "No", "Refused", "Declined", "Yes", NA),
                   stringsAsFactors = FALSE)

options(.jst_options_missing_convention = "stata")
e69a <- grab(jrecode(f69, v, map = "8=.a; 9=missing; else=copy"))
check("N69a rule route: head names 8=.a and the sharers; distinct line to .b; merge line to .a",
      grepl(paste0("jrecode(): 'missing' would use .a under Stata convention, ",
                   "but the map also assigns .a (8=.a), so 8 and 9 would ",
                   "share one missing value."), .fl(e69a), fixed = TRUE) &&
        grepl(paste0("To keep them distinct, give missing a marker the map ",
                     "does not use:"), .fl(e69a), fixed = TRUE) &&
        grepl('  f69$vR <- jrecode(f69, v, map = "8=.a; 9=.b; else=copy")\n',
              e69a, fixed = TRUE) &&
        grepl("Or, if they mean the same thing, use .a for both:", e69a,
              fixed = TRUE) &&
        grepl('  f69$vR <- jrecode(f69, v, map = "8=.a; 9=.a; else=copy")',
              e69a, fixed = TRUE))

r69b1 <- .run_line_k(e69a, 1L, "f69", f69)
r69b2 <- .run_line_k(e69a, 2L, "f69", f69)
check("N69b paste-and-run: the distinct line keeps 8 and 9 apart, the merge line joins them",
      !is.null(r69b1) &&
        identical(haven::na_tag(unclass(r69b1$vR))[3:4], c("a", "b")) &&
        !is.null(r69b2) &&
        identical(haven::na_tag(unclass(r69b2$vR))[3:4], c("a", "a")) &&
        identical(r69b1$v, f69$v))

e69c <- grab(jrecode(f69, v, map = "8=missing; NA=.a; else=copy"))
check("N69c NA route: NA=.a named, NA and 8 share; the token's 8 re-rendered to .b",
      grepl(paste0("but the map also assigns .a (NA=.a), so NA and 8 would ",
                   "share one missing value."), .fl(e69c), fixed = TRUE) &&
        grepl('map = "8=.b; NA=.a; else=copy")', e69c, fixed = TRUE) &&
        grepl('map = "8=.a; NA=.a; else=copy")', e69c, fixed = TRUE))

e69d <- grab(jrecode(f69, v, map = "9=missing; else=.a"))
check("N69d else route: else=.a named, 9 and every other value share; 9=.b; else=.a",
      grepl(paste0("but the map also assigns .a (else=.a), so 9 and every ",
                   "other value would share one missing value."), .fl(e69d),
            fixed = TRUE) &&
        grepl('map = "9=.b; else=.a")', e69d, fixed = TRUE) &&
        grepl('map = "9=.a; else=.a")', e69d, fixed = TRUE))

options(.jst_options_missing_convention = NULL)
e69e <- grab(jrecode(f69, v, map = "8=.A; 9=missing; NA=missing; else=copy",
                     convention = "sas"))
check("N69e per-call sas, three sharers: .A, \"all of them\", convention = on both lines",
      grepl(paste0("'missing' would use .A under SAS convention, but the map ",
                   "also assigns .A (8=.A), so 8, 9, and NA would share one ",
                   "missing value."), .fl(e69e), fixed = TRUE) &&
        grepl(paste0('map = "8=.A; 9=.B; NA=.B; else=copy", ',
                     'convention = "sas")'), .r5_one(e69e), fixed = TRUE) &&
        grepl("Or, if they mean the same thing, use .A for all of them:",
              e69e, fixed = TRUE) &&
        grepl(paste0('map = "8=.A; 9=.A; NA=.A; else=copy", ',
                     'convention = "sas")'), .r5_one(e69e), fixed = TRUE))

options(.jst_options_missing_convention = "stata")
e69f <- grab(jrecode(f69, v, map = "8=.a; 1=.b; 9=missing; else=copy"))
check("N69f the free marker skips one the map uses: .b taken, so 9=.c",
      grepl('map = "8=.a; 1=.b; 9=.c; else=copy")', e69f, fixed = TRUE))

e69g <- grab(jrecode(f69s, v, map = "8=.a; 9=missing; else=copy"))
check("N69g the free marker skips one the source column carries: .b cells present, so 9=.c",
      grepl("(8=.a), so 8 and 9 would share", .fl(e69g), fixed = TRUE) &&
        grepl('map = "8=.a; 9=.c; else=copy")', e69g, fixed = TRUE))

e69h <- grab(jencode(f69t, w, map = "Yes=1; No=0; Refused=.a; Declined=missing; NA=NA"))
r69h1 <- .run_line_k(e69h, 1L, "f69t", f69t)
r69h2 <- .run_line_k(e69h, 2L, "f69t", f69t)
check("N69h jencode twin: words quoted in the head, both lines print and run",
      grepl(paste0("jencode(): 'missing' would use .a under Stata convention, ",
                   "but the map also assigns .a (Refused=.a), so \"Refused\" ",
                   "and \"Declined\" would share one missing value."),
            .fl(e69h), fixed = TRUE) &&
        grepl(paste0('  f69t$wR <- jencode(f69t, w, map = "Yes=1; No=0; ',
                     'Refused=.a; Declined=.b; NA=NA")\n'), .r5_one(e69h),
              fixed = TRUE) &&
        grepl(paste0('  f69t$wR <- jencode(f69t, w, map = "Yes=1; No=0; ',
                     'Refused=.a; Declined=.a; NA=NA")'), .r5_one(e69h),
              fixed = TRUE) &&
        !is.null(r69h1) &&
        identical(haven::na_tag(unclass(r69h1$wR))[3:4], c("a", "b")) &&
        !is.null(r69h2) &&
        identical(haven::na_tag(unclass(r69h2$wR))[3:4], c("a", "a")))

e69i <- grab(jrecode(f69n, v, map = "8=.a; 9=missing; else=copy"))
check("N69i the map is read, not the cells: no 9 in the data, the guard still stops",
      grepl("(8=.a), so 8 and 9 would share one missing value.", .fl(e69i),
            fixed = TRUE))

r69j1 <- tryCatch(suppressMessages(jrecode(f69, v, map = "8=.b; 9=missing; else=copy")),
                  error = function(e) NULL)
r69j2 <- tryCatch(suppressMessages(jrecode(f69, v, map = "9=missing; else=copy",
                                           labels = ".a=Refused")),
                  error = function(e) NULL)
check("N69j LOCK no false alarm: a distinct marker proceeds; a label on the token's own marker is one category",
      !is.null(r69j1) &&
        identical(haven::na_tag(unclass(r69j1))[3:4], c("b", "a")) &&
        !is.null(r69j2) &&
        identical(haven::na_tag(unclass(r69j2))[4], "a"))

m69k <- grab(r69k <- jrecode(f69a, v, map = "9=missing; else=copy"))
# FLIPPED S352 (v0.9.225), by design: ruling R8, part 1 (Jeff, S345). The
# merge stands and is now SAID, with the line that keeps the two apart; it
# asserted the silence from S308 to S351. N87a-h hold the note itself.
check("N69k FLIPPED (ruling R8): the source's own .a cells kept by else=copy still take the token, and the merge is now said",
      !is.null(r69k) &&
        identical(haven::na_tag(unclass(r69k))[4:5], c("a", "a")) &&
        grepl("Note: .a was used for missing, under Stata convention.", m69k, fixed = TRUE) &&
        !grepl("would use .a", m69k, fixed = TRUE))

# Rule U: no PROSE line of the new messages over the pinned width. The
# indented remedy lines are runnable (Rule L) and exempt, as in N65af.
w69 <- function(x) {
  ln <- strsplit(x, "\n", fixed = TRUE)[[1]]
  ln <- ln[!startsWith(ln, "  ")]
  if (length(ln) == 0L) 0 else max(nchar(ln))
}
check("N69l no prose line of the S308 messages exceeds the pinned width",
      all(vapply(list(e69a, e69c, e69d, e69e, e69h, m68a, m68c, m68d, m68e,
                      e65ag1, e65ag2), w69, numeric(1)) <= .pin_width))

# =============================================================================
# N70 -- jconvert to = "spss": label-only markers, letter-order mapping, the
#        return-trip note, and the refusal by count (S314: AUDIT-051, then
#        the Decision 4 Q6 amendment, and the jsave rider)
# =============================================================================
# AUDIT-051 (0.9.188). jdeclare_missing() documents FORWARD-DECLARING a
# marker -- a label on .c before any case carries it -- and .jst_missing_info
# counts such a label as a declaration (the S218 evidence rule). jconvert(to
# = "spss") built its code set from the CELLS alone, so the label moved to a
# code but the code was never declared, and a later recode into it would
# count those cases as valid. The same cause had more faces: a column whose
# only marker is a label declared nothing and reported "q  ()"; a label-only
# marker whose code is a real answer skipped the collision check. One union
# now (.jst_marker_tags: cells, then label-only markers) feeds everything.
# LETTER-ORDER MAPPING (0.9.189, the same session). Until 0.9.188 the mapping
# was positional -- .a -> codes[1], .b -> codes[2] -- so any other letters
# were refused: a column carrying .d, .n and .r (mnemonic Stata markers) had
# three markers, SPSS holds three codes, and jconvert still refused it. Now
# a column's distinct markers, sorted, take the codes in turn; only MORE
# markers than codes is refused, in the family's count form. The positional
# rule preserved nothing this does not: the return direction assigns
# letters by code order either way (N70c, N70s). A column whose markers were
# not the leading letters comes back as the leading letters, and a
# consequential NOTE says so (always shown; the situation is rare, and the
# labels carry over).
# THE RIDER. jsave's .sav error picked "Stata-style" / "SAS-style" from the
# cells alone, so a label-only .C column read "Stata-style" (N70q).
# DISCRIMINATION AND MUTANTS: see the S314 EDIT note at the head of this
# file (filled in from the runs, not from intent).
#
# Codes-option hygiene: N70l-N70o narrow missing.convention.codes, so the
# section records the entering value and restores it, targeted, at its foot.

.entry_codes70 <- getOption(".jst_options_missing_convention_codes")
options(.jst_options_missing_convention_codes = NULL)
options(.jst_options_missing_convention = NULL)

.tn70 <- haven::tagged_na
.mk70 <- function(vals, labs) {
  data.frame(q = haven::labelled(vals, labels = labs))
}
# The label values as strings, a marker shown as ".x" -- compact to assert.
.lv70 <- function(x) {
  vl <- labelled::val_labels(x)
  stats::setNames(ifelse(is.na(vl), paste0(".", haven::na_tag(vl)),
                         as.character(vl)), names(vl))
}
.nav70 <- function(x) as.numeric(attr(x, "na_values"))

fA70  <- .mk70(c(1, 2, .tn70("a"), .tn70("b"), 1),
               c(Yes = 1, No = 2, Missing = .tn70("a"),
                 "Don't know" = .tn70("b"), Refused = .tn70("c")))
fE70  <- .mk70(c(1, 2, 2, 1), c(Yes = 1, No = 2, Refused = .tn70("c")))
fS70  <- .mk70(c(1, .tn70("A"), 2, 1),
               c(Yes = 1, No = 2, Missing = .tn70("A"),
                 Refused = .tn70("C")))
fC70  <- .mk70(c(1, -98, .tn70("a"), 2, 1),
               c(Yes = 1, No = 2, Missing = .tn70("a"),
                 Refused = .tn70("c")))
fB70  <- .mk70(c(1, 2, .tn70("a"), .tn70("b"), 1),
               c(Yes = 1, No = 2, Missing = .tn70("a"),
                 "Don't know" = .tn70("b"),
                 "Not applicable" = .tn70("e")))
fD70  <- .mk70(c(1, .tn70("a"), .tn70("b"), .tn70("e"), 1),
               c(Yes = 1, Missing = .tn70("a"), "Don't know" = .tn70("b"),
                 "Not applicable" = .tn70("e")))
fM70  <- .mk70(c(1, .tn70("d"), .tn70("r"), .tn70("n"), 1),
               c(Yes = 1, "Don't know" = .tn70("d"), Refused = .tn70("r"),
                 "Not applicable" = .tn70("n")))
fQ70  <- .mk70(c(1, .tn70("A"), 2, 1),
               c(Yes = 1, No = 2, Missing = .tn70("A"),
                 Other = .tn70("E")))
fO70  <- .mk70(c(1, .tn70("b"), .tn70("a"), 2), c(Yes = 1, No = 2))
fG70  <- .mk70(c(1, .tn70("a"), .tn70("c"), 2), c(Yes = 1, No = 2))
fR70  <- .mk70(c(1, 2, 1), c(Yes = 1, No = 2, Refused = .tn70("C")))
fL70  <- data.frame(
  q = haven::labelled(c(1, .tn70("a"), .tn70("b"), .tn70("c"), .tn70("e")),
                      labels = c(Yes = 1)),
  r = haven::labelled(c(1, .tn70("a"), .tn70("d"), .tn70("x"), .tn70("z")),
                      labels = c(Yes = 1)))
fV70  <- .mk70(c(1, .tn70("a"), .tn70("b"), .tn70("c")),
               c(Yes = 1, Other = .tn70("e")))
fW70  <- .mk70(c(1, .tn70("a"), .tn70("c"), 1), c(Yes = 1))
fP70  <- data.frame(
  Income    = haven::labelled(c(1, .tn70("a"), .tn70("b"), .tn70("e")),
                              labels = c(Yes = 1)),
  Education = haven::labelled(c(1, -99, .tn70("a"), 2),
                              labels = c(Yes = 1)))
fN70  <- .mk70(c(1, .tn70("a"), .tn70("b")), c(Yes = 1))
fX70  <- data.frame(
  q = haven::labelled(c(1, .tn70("d"), .tn70("e")), labels = c(Yes = 1)),
  r = haven::labelled(c(1, .tn70("a"), .tn70("c")), labels = c(Yes = 1)))
fY70  <- data.frame(
  q = haven::labelled(c(1, .tn70("d"), .tn70("e")), labels = c(Yes = 1)),
  r = haven::labelled(c(1, .tn70("A"), .tn70("C")), labels = c(Yes = 1)))

r70a <- suppressMessages(jconvert(fA70, to = "spss"))
m70a <- .fl(grab(jconvert(fA70, to = "spss")))

check("N70a AUDIT-051: a label-only marker's code is declared, label kept",
      identical(.nav70(r70a$q), c(-99, -98, -97)) &&
        identical(unname(.lv70(r70a$q)[["Refused"]]), "-97"))

check("N70b the report lists the label-only marker beside the others",
      grepl(paste0('q .a ["Missing"] -> -99 .b ["Don\'t know"] -> -98 ',
                   '.c ["Refused"] -> -97'), m70a, fixed = TRUE))

check("N70c round trip: stata -> spss -> stata returns .c \"Refused\"",
      {
        rt <- suppressMessages(jconvert(r70a, to = "stata"))
        identical(haven::na_tag(labelled::val_labels(rt$q)[["Refused"]]),
                  "c")
      })

m70d <- .fl(grab(jconvert(fE70, to = "spss")))
check("N70d a column whose only marker is a label: declared, reported, noted",
      {
        r <- suppressMessages(jconvert(fE70, to = "spss"))
        identical(.nav70(r$q), -99) &&
          grepl('q .c ["Refused"] -> -99', m70d, fixed = TRUE) &&
          grepl(paste0("Note: converting q back to Stata-style missing ",
                       "values would give its marker .a with the same ",
                       "labels, not .c."), m70d, fixed = TRUE)
      })

m70e <- .fl(grab(jconvert(fS70, to = "spss")))
check("N70e SAS-style: label-only .C declared and reported in its own case",
      {
        r <- suppressMessages(jconvert(fS70, to = "spss"))
        identical(.nav70(r$q), c(-99, -98)) &&
          grepl('.A ["Missing"] -> -99 .C ["Refused"] -> -98', m70e,
                fixed = TRUE) &&
          grepl(paste0("Note: converting q back to SAS-style missing ",
                       "values would give its markers .A, .B with the same ",
                       "labels, not .A, .C."), m70e, fixed = TRUE)
      })

e70f <- grab(jconvert(fC70, to = "spss"))
check("N70f collision: a label-only marker whose code is a real answer stops",
      {
        m <- .fl(e70f)
        grepl(paste0("jconvert(): the missing.convention.codes values ",
                     "overlap with real data values."), m, fixed = TRUE) &&
          grepl("This variable in fC70 is affected: q: -98", m,
                fixed = TRUE) &&
          !grepl("Converted to SPSS-style", m, fixed = TRUE)
      })

m70g <- .fl(grab(jconvert(fB70, to = "spss")))
check("N70g a label-only .e past .c converts: third code, noted",
      {
        r <- suppressMessages(jconvert(fB70, to = "spss"))
        identical(.nav70(r$q), c(-99, -98, -97)) &&
          identical(unname(.lv70(r$q)[["Not applicable"]]), "-97") &&
          grepl('.e ["Not applicable"] -> -97', m70g, fixed = TRUE) &&
          grepl(paste0("would give its markers .a, .b, .c with the same ",
                       "labels, not .a, .b, .e."), m70g, fixed = TRUE)
      })

check("N70h case D: cells .a .b .e convert -- three markers, three codes",
      {
        r <- suppressMessages(jconvert(fD70, to = "spss"))
        identical(.nav70(r$q), c(-99, -98, -97)) &&
          identical(unname(.lv70(r$q)[["Not applicable"]]), "-97")
      })

m70i <- .fl(grab(jconvert(fM70, to = "spss")))
check("N70i mnemonic .d .n .r: codes in letter order, report and note",
      {
        r <- suppressMessages(jconvert(fM70, to = "spss"))
        identical(unname(.lv70(r$q)[c("Don't know", "Not applicable",
                                       "Refused")]),
                  c("-99", "-98", "-97")) &&
          grepl(paste0('q .d ["Don\'t know"] -> -99 .n ["Not applicable"] ',
                       '-> -98 .r ["Refused"] -> -97'), m70i, fixed = TRUE) &&
          grepl(paste0("Note: converting q back to Stata-style missing ",
                       "values would give its markers .a, .b, .c with the ",
                       "same labels, not .d, .n, .r."), m70i, fixed = TRUE)
      })

m70j <- .fl(grab(jconvert(fQ70, to = "spss")))
check("N70j SAS-style label-only .E converts; the note keeps its case",
      {
        r <- suppressMessages(jconvert(fQ70, to = "spss"))
        identical(.nav70(r$q), c(-99, -98)) &&
          grepl('.E ["Other"] -> -98', m70j, fixed = TRUE) &&
          grepl(paste0("back to SAS-style missing values would give its ",
                       "markers .A, .B with the same labels, not .A, .E."),
                m70j, fixed = TRUE)
      })

e70k <- grab(jconvert(fL70, to = "spss"))
check("N70k two variables over: both banded, the plural range note AND the plural return-trip note (S319 re-pin)",
      {
        m <- .fl(e70k)
        r <- suppressMessages(jconvert(fL70, to = "spss"))
        identical(.nav70(r$q), numeric(0)) &&
          identical(as.numeric(attr(r$q, "na_range")), c(-99, -96)) &&
          identical(as.numeric(attr(r$r, "na_range")), c(-99, -96)) &&
          grepl(paste0("Note: q and r have more lettered markers than the 3 ",
                       "separate missing-value codes SPSS allows, so their codes ",
                       "were declared as missing-value ranges."), m, fixed = TRUE) &&
          grepl(paste0("Note: converting q and r back to Stata-style missing ",
                       "values would give their markers the leading letters"), m,
                fixed = TRUE)
      })

e70v <- grab(jconvert(fV70, to = "spss"))
options(.jst_options_missing_convention_codes = -99)
e70v1 <- grab(jconvert(fV70, to = "spss"))
options(.jst_options_missing_convention_codes = NULL)
check("N70v a label-only marker: banded at three codes (its label on -96); marked \"(no cases)\" in the one-code refusal (S319 re-pin)",
      {
        r <- suppressMessages(jconvert(fV70, to = "spss"))
        identical(as.numeric(attr(r$q, "na_range")), c(-99, -96)) &&
          grepl('.e ["Other"] -> -96 range -99 to -96', .fl(e70v), fixed = TRUE) &&
          grepl("has more: q: .a, .b, .c, .e (no cases) To allow any number",
                .fl(e70v1), fixed = TRUE)
      })

options(.jst_options_missing_convention_codes = c(-99, -98))

e70l <- grab(jconvert(fB70, to = "spss"))
check("N70l 2 codes, three markers incl. a label-only .e: banded [-99, -97], the note names the setting (S319 re-pin)",
      {
        m <- .fl(e70l)
        r <- suppressMessages(jconvert(fB70, to = "spss"))
        identical(as.numeric(attr(r$q, "na_range")), c(-99, -97)) &&
          grepl('.e ["Not applicable"] -> -97 range -99 to -97', m, fixed = TRUE) &&
          grepl("Note: q has 3 lettered markers, more than the 2 codes in your",
                m, fixed = TRUE) &&
          !grepl("To allow more", m, fixed = TRUE)
      })

m70m <- .fl(grab(jconvert(fW70, to = "spss")))
check("N70m 2 codes, .a and .c: two markers convert to the two codes",
      {
        r <- suppressMessages(jconvert(fW70, to = "spss"))
        identical(.nav70(r$q), c(-99, -98)) &&
          grepl("q .a -> -99 .c -> -98", m70m, fixed = TRUE) &&
          grepl("would give its markers .a, .b with the same labels, not .a, .c.",
                m70m, fixed = TRUE)
      })

e70n2 <- grab(jconvert(fP70, to = "spss"))
options(.jst_options_missing_convention_codes = -99)
e70n <- grab(jconvert(fP70, to = "spss"))
check("N70n two problems at ONE code: capitalized heading, folded fix; at two codes only the collision remains (S319 re-pin)",
      grepl(paste0("jconvert(): cannot convert fP70 to SPSS -- two ",
                   "problems: At most 1 lettered marker per variable can ",
                   "be converted because your missing.convention.codes ",
                   "setting currently has only 1 code. This variable has ",
                   "more: Income: .a, .b, .e The missing.convention.codes ",
                   "values overlap"), .fl(e70n), fixed = TRUE) &&
        grepl("To fix both, set two or three codes that do not overlap:",
              .fl(e70n), fixed = TRUE) &&
        grepl(paste0("jconvert(): the missing.convention.codes values overlap ",
                     "with real data values. This variable in fP70 is affected: ",
                     "Education: -99"), .fl(e70n2), fixed = TRUE) &&
        !grepl("two problems", .fl(e70n2), fixed = TRUE))


e70o <- grab(jconvert(fN70, to = "spss"))
check("N70o 1 code: the singular forms",
      grepl(paste0("jconvert(): at most 1 lettered marker per variable can ",
                   "be converted because your missing.convention.codes ",
                   "setting currently has only 1 code."), .fl(e70o),
            fixed = TRUE))

options(.jst_options_missing_convention_codes = NULL)

check("N70p na_values follow letter order, not the cells' order",
      {
        r <- suppressMessages(jconvert(fO70, to = "spss"))
        identical(.nav70(r$q), c(-99, -98))
      })

e70q <- grab(jsave(fR70, tempfile(fileext = ".sav")))
check("N70q rider: jsave names a label-only .C column SAS-style",
      {
        m <- .fl(e70q)
        grepl("1 variable carries SAS-style missing values", m,
              fixed = TRUE) &&
          !grepl("Stata-style", m, fixed = TRUE)
      })

m70s <- .fl(grab(jconvert(fG70, to = "spss")))
check("N70s gap set .a .c: second code (the accepted change), noted",
      {
        r <- suppressMessages(jconvert(fG70, to = "spss"))
        identical(.nav70(r$q), c(-99, -98)) &&
          grepl("q .a -> -99 .c -> -98", m70s, fixed = TRUE) &&
          grepl("with the same labels, not .a, .c.", m70s, fixed = TRUE)
      })

check("N70t LOCK: leading-letter sets get no note",
      !grepl("Note: converting", m70a, fixed = TRUE) &&
        !grepl("Note: converting",
               .fl(grab(jconvert(fO70, to = "spss"))), fixed = TRUE))

m70w <- .fl(grab(jconvert(fX70, to = "spss")))
m70x <- .fl(grab(jconvert(fY70, to = "spss")))
check("N70w several variables share one note; mixed styles name both",
      grepl(paste0("Note: converting q and r back to Stata-style missing ",
                   "values would give their markers the leading letters ",
                   "(.a, .b, ...) with the same labels, not the letters ",
                   "above."), m70w, fixed = TRUE) &&
        grepl("back to Stata-style or SAS-style missing values", m70x,
              fixed = TRUE))

# Rule U, reusing N69's w69(): no PROSE line of the new refusals or notes
# over the pinned width; indented variable lines and remedies are exempt.
check("N70r no prose line of the S314 messages exceeds the pinned width",
      all(vapply(list(e70f, e70k, e70v, e70l, e70n, e70o,
                      grab(jconvert(fM70, to = "spss")),
                      grab(jconvert(fX70, to = "spss")),
                      grab(jconvert(fY70, to = "spss"))),
                 w69, numeric(1)) <= .pin_width))

options(.jst_options_missing_convention_codes = .entry_codes70)

# =============================================================================
# N71 -- jsave(): THE DATA ARGUMENT EVALUATED ONCE; THE REGISTRATION NOTE
#        NAMES EVERY VERB (S315, v0.9.190; AUDIT-052, AUDIT-053)
# =============================================================================
# jsave's pre-check evaluated its first argument and the shared resolver
# evaluated it again, so jsave(jconvert(...), ...) printed jconvert's notice
# twice -- three evaluations when a string was routed to the file slot. The
# resolver now takes the pre-check's result (pre_eval). And the note on
# saving registrations to a non-rds format named jnumeric/jcount/jdummy but
# not jlikert, whose registrations share the same notebook and are lost the
# same way.
.entry_default71 <- getOption(".jst_default_data")
f71 <- data.frame(
  Q = haven::labelled_spss(c(1, 2, -99, 3, 2), labels = c(Refused = -99),
                           na_values = -99),
  L = haven::labelled(c(1, 2, 3, 4, 5), c(Low = 1, High = 5)))
.n71    <- 0L
.cnt71  <- function() { .n71 <<- .n71 + 1L; f71 }
.path71 <- function() { .n71 <<- .n71 + 1L; tempfile(fileext = ".rds") }
check("N71a jsave(<expression>, file) evaluates the expression once",
      { .n71 <- 0L; invisible(grab(jsave(.cnt71(), tempfile(fileext = ".rds"))))
        identical(.n71, 1L) })
invisible(grab(juse(f71)))
check("N71b ... and once as a file name routed to the file slot under juse()",
      { .n71 <- 0L; invisible(grab(jsave(.path71()))); identical(.n71, 1L) })
invisible(grab(juse(NULL)))
options(.jst_default_data = .entry_default71)
m71c <- grab(jsave(jconvert(f71, to = "stata"), tempfile(fileext = ".dta")))
check("N71c jsave(jconvert(...), ...) prints the conversion notice once",
      lengths(regmatches(m71c, gregexpr("Converted to Stata-style missing values",
                                        m71c, fixed = TRUE))) == 1L)
invisible(grab(jlikert(f71, L)))
m71d <- .fl(grab(jsave(f71, tempfile(fileext = ".sav"))))
invisible(grab(jlikert(f71, L, remove = TRUE)))
check("N71d the registration note names all four verbs, jlikert among them",
      grepl(paste0("Note: classification registrations ",
                   "(jnumeric/jcount/jlikert/jdummy) are not kept in SPSS ",
                   "format (.sav); they persist only in R format (.rds)."),
            m71d, fixed = TRUE))

# =============================================================================
# N72 -- MARKERS AS THINGS YOU CAN MAP (S319, v0.9.195; the S314 bundled item)
# =============================================================================
# Three halves and two riders, one build. (1) jrecode accepts a lettered
# marker as an OLD value: ".a=-99" gives its cells a number, ".a=NA" plain NA,
# ".b=.a" re-letters (merging into an existing .a); a marker the map does not
# name is kept with its label. (2) jconvert(to = "spss") declares a column
# with more markers than codes by a RANGE -- from the first convention code,
# one integer per marker, in the direction the codes run (the defaults give
# five markers -99 to -95) -- instead of refusing it; a single code (no
# direction) and a range that would reach 0 are still refused, with the fix.
# (3) The S318 RULING, option A: a declared missing value moved onto a code
# the missing-code check flags (-88 on a 1-5 scale) comes out declared with
# its label and a note; one moved onto a code the check does not flag (6, or
# -88 among incomes) stays valid, and a companion note (Jeff's option b, S319)
# says the cases now count as data and gives the recode-then-declare pair.
# RIDERS: the D1 pair's declare line lists every code the recoded variable
# already declares (jdeclare_missing REPLACES a column's codes; the line had
# named the flagged code alone since S303 and dropped the rest when pasted);
# and the S318 mixed-column route -- "9=missing" with convention = "spss"
# given in the call on a Stata-style column -- is refused with the new
# one-form error instead of building an SPSS-form column whose markers every
# reader took for plain NA (folded in, Jeff S319).
# Label repairs that rode with (1): a marker's label was dropped unless
# else=copy; a label did not follow a value recoded to a marker; a rule with
# several old values and an NA or marker target stopped with "no such index
# at level 1"; recoding onto a value else=copy also kept, or onto a kept
# declared code, stopped with "`labels` must be unique".
# DISCRIMINATION AND THE FIFTEEN-MUTANT MAP: the S319 EDIT note at the head
# of this file.
#
# NO DATASET (the file's rule): the Education- and Income-shaped fixtures
# below are built from haven primitives, not loaded.
#
# Codes-option and convention hygiene: several checks set the codes slot or
# the convention; the section records the entering values and restores them,
# targeted, at its foot.

.entry_codes72 <- getOption(".jst_options_missing_convention_codes")
.entry_conv72  <- getOption(".jst_options_missing_convention")
options(.jst_options_missing_convention_codes = NULL)
options(.jst_options_missing_convention = NULL)

.tn72  <- haven::tagged_na
.mk72  <- function(vals, labs, nm = "q") {
  d <- data.frame(row.names = seq_along(vals))
  d[[nm]] <- haven::labelled(vals, labels = labs)
  d
}
.nav72 <- function(x) as.numeric(attr(x, "na_values"))
# A fixture result taken OUTSIDE check() is guarded, so a master that stops
# on the call reds the checks that read it instead of halting the battery
# (the S285 lesson; the base 0.9.194 master refuses f72_5 outright).
.try72 <- function(expr) tryCatch(suppressMessages(expr), error = function(e) NULL)
.rng72 <- function(x) as.numeric(attr(x, "na_range"))
# The label values as strings, a marker shown as ".x".
.lv72  <- function(x) {
  vl <- labelled::val_labels(x)
  if (is.null(vl)) return(character(0))
  stats::setNames(ifelse(is.na(vl), paste0(".", haven::na_tag(vl)),
                         as.character(as.numeric(vl))), names(vl))
}
# The cells as strings: a marker ".x", plain NA "NA", a number as printed.
.cl72  <- function(x) {
  v  <- as.numeric(unclass(x)); tg <- haven::na_tag(v)
  ifelse(!is.na(tg), paste0(".", tg), ifelse(is.na(v), "NA", as.character(v)))
}
# Run the recode-then-declare pair a note prints (REMEDY LINES ARE RUN, NOT
# READ): the two indented lines after the intro ending "recoded variable:",
# evaluated in a scratch environment holding the frame under the note's
# name. Returns the result column, or NULL.
.run_pair72 <- function(msg, frame_name, frame, col) {
  tryCatch({
    lines <- strsplit(msg, "\n", fixed = TRUE)[[1]]
    i <- grep("recoded variable:$", lines)
    if (length(i) < 1L) return(NULL)
    i <- max(i)
    j <- i + 1L
    while (j <= length(lines) && startsWith(lines[j], "  ")) j <- j + 1L
    pair <- .r5_calls(lines[seq_len(j - i - 1L) + i])
    if (length(pair) < 2L) return(NULL)
    pair <- pair[1:2]
    e <- new.env(parent = globalenv())
    assign(frame_name, frame, envir = e)
    suppressMessages(utils::capture.output(
      for (ln in pair) eval(parse(text = ln), envir = e)))
    get(frame_name, envir = e)[[col]]
  }, error = function(err) NULL)
}

# --- fixtures: jconvert side ---
f72_5 <- .mk72(c(1, 2, .tn72("a"), .tn72("b"), .tn72("c"), .tn72("d"), .tn72("e")),
               c(Yes = 1, No = 2, Refused = .tn72("a"), DK = .tn72("b"),
                 NAp = .tn72("c"), Skip = .tn72("d"), Lost = .tn72("e")))
f72_m <- .mk72(c(1, 2, .tn72("d"), .tn72("n"), .tn72("r"), .tn72("s")),
               c(Yes = 1, "Don't know" = .tn72("d"), "Not applicable" = .tn72("n"),
                 Refused = .tn72("r"), Skipped = .tn72("s")))
f72_two <- data.frame(
  q = f72_5$q,
  r = haven::labelled(c(1, 2, .tn72("a"), .tn72("b"), .tn72("c"), .tn72("d"),
                        .tn72("e")), labels = c(Yes = 1)))
f72_col <- .mk72(c(1, 2, -96, .tn72("a"), .tn72("b"), .tn72("c"), .tn72("d"),
                   .tn72("e")), c(Yes = 1))
f72_4 <- .mk72(c(1, 2, .tn72("a"), .tn72("b"), .tn72("c"), .tn72("d")), c(Yes = 1))
f72_3 <- .mk72(c(1, 2, .tn72("a"), .tn72("b"), .tn72("c")), c(Yes = 1))
f72_2 <- .mk72(c(1, 2, .tn72("a"), .tn72("b")), c(Yes = 1))
f72_p2 <- data.frame(Q4 = f72_4$q,
                     E = haven::labelled(c(1, -3, .tn72("a"), 2, 1, 2), labels = c(Yes = 1)))
f72_pq <- data.frame(Q2 = f72_2$q,
                     E = haven::labelled(c(1, -99, .tn72("a"), 1), labels = c(Yes = 1)))
f72_sas <- .mk72(c(1, .tn72("A"), .tn72("B"), .tn72("C"), .tn72("D")),
                 c(Yes = 1, Refused = .tn72("A"), Other = .tn72("E")))

# --- (2) THE BAND ---
r72a <- .try72(jconvert(f72_5, to = "spss"))
m72a <- .fl(grab(jconvert(f72_5, to = "spss")))
check("N72a five markers, default codes: a range [-99, -95], no discrete codes, labels on the codes",
      !is.null(r72a) && identical(.rng72(r72a$q), c(-99, -95)) &&
        length(.nav72(r72a$q)) == 0L &&
        identical(unname(.lv72(r72a$q)[c("Refused", "DK", "NAp", "Skip", "Lost")]),
                  c("-99", "-98", "-97", "-96", "-95")) &&
        identical(.cl72(r72a$q), c("1", "2", "-99", "-98", "-97", "-96", "-95")))

check("N72b the report ends its entry with the range, and the range NOTE names SPSS's limit",
      grepl(paste0('q .a ["Refused"] -> -99 .b ["DK"] -> -98 .c ["NAp"] -> -97 ',
                   '.d ["Skip"] -> -96 .e ["Lost"] -> -95 range -99 to -95'),
            m72a, fixed = TRUE) &&
        grepl(paste0("Note: q has 5 lettered markers, more than the 3 separate ",
                     "missing-value codes SPSS allows, so its codes were declared ",
                     "as a missing-value range."), m72a, fixed = TRUE))

check("N72c the return trip gives .a-.e back in order, labels intact",
      {
        rt <- suppressMessages(jconvert(r72a, to = "stata"))
        !is.null(r72a) &&
          identical(.cl72(rt$q), c("1", "2", ".a", ".b", ".c", ".d", ".e")) &&
          identical(haven::na_tag(labelled::val_labels(rt$q)[["Lost"]]), "e")
      })

m72d <- .fl(grab(jconvert(f72_m, to = "spss")))
check("N72d mnemonic .d .n .r .s: letter order, the range note AND the return-trip note",
      {
        r <- suppressMessages(jconvert(f72_m, to = "spss"))
        identical(.rng72(r$q), c(-99, -96)) &&
          identical(unname(.lv72(r$q)[c("Don't know", "Not applicable", "Refused",
                                        "Skipped")]), c("-99", "-98", "-97", "-96")) &&
          grepl("Note: q has 4 lettered markers, more than", m72d, fixed = TRUE) &&
          grepl(paste0("Note: converting q back to Stata-style missing values would ",
                       "give its markers .a, .b, .c, .d with the same labels, not ",
                       ".d, .n, .r, .s."), m72d, fixed = TRUE)
      })

m72e <- .fl(grab(jconvert(f72_two, to = "spss")))
check("N72e two variables banded: one plural note",
      grepl(paste0("Note: q and r have more lettered markers than the 3 separate ",
                   "missing-value codes SPSS allows, so their codes were declared ",
                   "as missing-value ranges."), m72e, fixed = TRUE) &&
        grepl("range -99 to -95", m72e, fixed = TRUE))

options(.jst_options_missing_convention_codes = c(-99, -98))
m72f <- .fl(grab(jconvert(f72_3, to = "spss")))
check("N72f a 2-code setting, three markers: the range, and the note names the setting",
      {
        r <- suppressMessages(jconvert(f72_3, to = "spss"))
        identical(.rng72(r$q), c(-99, -97)) &&
          grepl(paste0("Note: q has 3 lettered markers, more than the 2 codes in ",
                       "your missing.convention.codes setting, so its codes were ",
                       "declared as a missing-value range."), m72f, fixed = TRUE)
      })
options(.jst_options_missing_convention_codes = NULL)

e72g <- grab(jconvert(f72_col, to = "spss"))
check("N72g a real value inside the range is a collision, in the range form",
      {
        m <- .fl(e72g)
        grepl(paste0("jconvert(): the codes these lettered markers would take ",
                     "overlap with real data values."), m, fixed = TRUE) &&
          grepl("This variable in f72_col is affected: q: -96 (range -99 to -95)",
                m, fixed = TRUE) &&
          !grepl("Converted to SPSS-style", m, fixed = TRUE)
      })

options(.jst_options_missing_convention_codes = c(-3, -2, -1))
e72h <- grab(jconvert(f72_4, to = "spss"))
check("N72h a range that would reach 0 is refused, with the codes and the fix",
      {
        m <- .fl(e72h)
        grepl(paste0("jconvert(): with your missing.convention.codes setting ",
                     "(-3, -2, -1), more lettered markers than codes would need ",
                     "codes that reach 0."), m, fixed = TRUE) &&
          grepl("This variable in f72_4 has more: q: .a, .b, .c, .d", m, fixed = TRUE) &&
          grepl("To allow more, set codes that run away from 0: joptions(missing.convention.codes = c(...))",
                m, fixed = TRUE) &&
          grepl("Or first reduce its markers to 3 or fewer.", m, fixed = TRUE)
      })
e72i <- grab(jconvert(f72_p2, to = "spss"))
check("N72i zero reach beside a collision: the two-problem frame folds both fixes",
      {
        m <- .fl(e72i)
        grepl("jconvert(): cannot convert f72_p2 to SPSS -- two problems:", m,
              fixed = TRUE) &&
          grepl("With your missing.convention.codes setting (-3, -2, -1), more",
                m, fixed = TRUE) &&
          grepl("This variable is affected: E: -3", m, fixed = TRUE) &&
          grepl("To fix both, set codes that run away from 0 and do not overlap:",
                m, fixed = TRUE)
      })
options(.jst_options_missing_convention_codes = c(-1, -2, -3))
check("N72j codes running away from 0 (-1, -2, -3): four markers take -1 to -4, range [-4, -1]",
      {
        r <- suppressMessages(jconvert(f72_4, to = "spss"))
        identical(.rng72(r$q), c(-4, -1)) &&
          identical(.cl72(r$q), c("1", "2", "-1", "-2", "-3", "-4"))
      })
options(.jst_options_missing_convention_codes = c(-99, -88, -77))
check("N72k non-consecutive codes: three markers keep them discrete; four take the range from the first",
      {
        r3 <- suppressMessages(jconvert(f72_3, to = "spss"))
        r4 <- suppressMessages(jconvert(f72_4, to = "spss"))
        identical(.nav72(r3$q), c(-99, -88, -77)) && length(.rng72(r3$q)) == 0L &&
          identical(.rng72(r4$q), c(-99, -96)) &&
          identical(.cl72(r4$q), c("1", "2", "-99", "-98", "-97", "-96"))
      })
options(.jst_options_missing_convention_codes = -99)
e72l <- grab(jconvert(f72_2, to = "spss"))
check("N72l a single code gives no direction: refused, and the widen line no longer names a maximum",
      {
        m <- .fl(e72l)
        grepl(paste0("jconvert(): at most 1 lettered marker per variable can be ",
                     "converted because your missing.convention.codes setting ",
                     "currently has only 1 code."), m, fixed = TRUE) &&
          grepl("To allow any number, set two or three codes: joptions(missing.convention.codes = c(...))",
                m, fixed = TRUE) &&
          !grepl("maximum SPSS allows", m, fixed = TRUE) &&
          !grepl("Or first reduce", m, fixed = TRUE)
      })
e72l2 <- grab(jconvert(f72_pq, to = "spss"))
check("N72l2 a single code beside a collision: the two-problem frame, the changed fold line",
      grepl("To fix both, set two or three codes that do not overlap:", .fl(e72l2),
            fixed = TRUE) &&
        grepl("At most 1 lettered marker per variable can be converted", .fl(e72l2),
              fixed = TRUE))
options(.jst_options_missing_convention_codes = NULL)

m72m <- .fl(grab(jconvert(f72_3, to = "spss")))
check("N72m LOCK three markers at the default codes: discrete, no range, no range note",
      {
        r <- suppressMessages(jconvert(f72_3, to = "spss"))
        identical(.nav72(r$q), c(-99, -98, -97)) && length(.rng72(r$q)) == 0L &&
          !grepl("missing-value range", m72m, fixed = TRUE) &&
          !grepl("range [", m72m, fixed = TRUE)
      })

m72n <- .fl(grab(jconvert(f72_sas, to = "spss")))
check("N72n SAS-style, four cells plus a label-only .E: the range, reported in the column's own case",
      {
        r <- suppressMessages(jconvert(f72_sas, to = "spss"))
        identical(.rng72(r$q), c(-99, -95)) &&
          grepl('.A ["Refused"] -> -99 .B -> -98 .C -> -97 .D -> -96 .E ["Other"] -> -95 range -99 to -95',
                m72n, fixed = TRUE) &&
          grepl("Note: q has 5 lettered markers", m72n, fixed = TRUE)
      })

check("N72o the range survives a .sav round trip (read with user_na = TRUE)",
      {
        tf <- tempfile(fileext = ".sav")
        if (is.null(r72a)) stop("no banded result to save")
        invisible(grab(jsave(r72a, tf)))
        back <- haven::read_sav(tf, user_na = TRUE)
        identical(as.numeric(attr(back$q, "na_range")), c(-99, -95)) &&
          is.null(attr(back$q, "na_values")) &&
          identical(unname(.lv72(back$q)[["Lost"]]), "-95")
      })

# --- fixtures: jrecode side ---
st72 <- .mk72(c(1, 2, 1, 2, .tn72("a"), .tn72("b"), 1, NA, .tn72("a")),
              c(Yes = 1, No = 2, Refused = .tn72("a"), "Don't know" = .tn72("b")),
              nm = "Q")
st72_4 <- .mk72(c(1, 2, .tn72("a"), .tn72("b"), .tn72("c"), .tn72("d")),
                c(Yes = 1, No = 2, Refused = .tn72("a"), DK = .tn72("b"),
                  NAp = .tn72("c"), Skip = .tn72("d")), nm = "Q")
stx72 <- .mk72(c(1, 2, 1, 2, -99, .tn72("a"), 1),
               c(Yes = 1, No = 2, Refused = .tn72("a")), nm = "Q")
sas72 <- .mk72(c(1, 2, .tn72("A"), .tn72("B"), 1),
               c(Yes = 1, No = 2, Refused = .tn72("A"), DK = .tn72("B")), nm = "Q")
stm72 <- .mk72(c(1, 2, 1, 2, .tn72("a"), .tn72("b"), 1, 9, .tn72("a"), 2),
               c(Yes = 1, No = 2, "Not asked" = 9, Refused = .tn72("a"),
                 "Don't know" = .tn72("b")), nm = "Q")
.ed_labs72 <- c("Some high school" = 1, "High school graduate" = 2,
                "Some college" = 3, "Bachelor's degree" = 4,
                "Graduate degree" = 5, Refused = -99, "Don't know" = -98)
ed72 <- data.frame(Education = haven::labelled_spss(
  c(1, 2, 3, 4, 5, -99, -98, 3, -99, 2, 4, -98, 1, 5),
  labels = .ed_labs72, na_values = c(-99, -98)))
ed72n <- ed72; ed72n$Education[c(1, 3)] <- NA
ed72x <- data.frame(Education = haven::labelled_spss(
  c(1, 2, 3, 4, 5, -99, -98, 3, -88, 2, 4, -98, 1, 5),
  labels = .ed_labs72, na_values = c(-99, -98)))
inc72 <- data.frame(Income = haven::labelled_spss(
  c(14000, 25000, 30000, -99, -98, 45000, 52000, -99, 38000, 61000),
  labels = c(Refused = -99, "Don't know" = -98), na_values = c(-99, -98)))
bd72 <- data.frame(B = haven::labelled_spss(
  c(1, 2, 3, 4, 5, -95, -1, 2),
  labels = c(Low = 1, High = 5, Refused = -95, Skip = -1),
  na_values = -1, na_range = c(-99, -90)))

# --- (1) MARKERS AS OLD VALUES ---
m72p <- grab(jrecode(st72, Q, map = ".a=-99; .b=-98; else=copy"))
r72p <- .try72(jrecode(st72, Q, map = ".a=-99; .b=-98; else=copy"))
check("N72p .a=-99; .b=-98: the cells take the codes, declared, with the labels (ruling A)",
      !is.null(r72p) &&
        identical(.cl72(r72p), c("1", "2", "1", "2", "-99", "-98", "1", "NA", "-99")) &&
        identical(.nav72(r72p), c(-99, -98)) &&
        identical(unname(.lv72(r72p)[c("Refused", "Don't know")]), c("-99", "-98")) &&
        grepl(paste0("Note: -99 and -98 were declared as missing values on the ",
                     "recoded variable, as .a [\"Refused\"] and .b [\"Don't know\"] ",
                     "are on Q."), .fl(m72p), fixed = TRUE))

check("N72q .a=NA: the .a cells become plain NA; .b is kept with its label",
      {
        r <- suppressMessages(jrecode(st72, Q, map = ".a=NA; else=copy"))
        identical(.cl72(r)[c(5, 6, 9)], c("NA", ".b", "NA")) &&
          identical(unname(.lv72(r)[["Don't know"]]), ".b") &&
          !("Refused" %in% names(.lv72(r)))
      })

check("N72r .b=.a re-letters into an existing marker; .a keeps its own label",
      {
        r <- suppressMessages(jrecode(st72, Q, map = ".b=.a; else=copy",
                                      convention = "stata"))
        identical(.cl72(r)[5:6], c(".a", ".a")) &&
          identical(unname(.lv72(r)[["Refused"]]), ".a") &&
          !("Don't know" %in% names(.lv72(r)))
      })

check("N72s .b=.c re-letters onto a free marker; the label moves with it",
      {
        r <- suppressMessages(jrecode(st72, Q, map = ".b=.c; else=copy",
                                      convention = "stata"))
        identical(.cl72(r)[6], ".c") &&
          identical(unname(.lv72(r)[["Don't know"]]), ".c") &&
          identical(unname(.lv72(r)[["Refused"]]), ".a")
      })

check("N72t case: .A names a SAS-style marker, and so does .a",
      {
        r1 <- suppressMessages(jrecode(sas72, Q, map = ".A=-99; .B=-98; else=copy"))
        r2 <- suppressMessages(jrecode(sas72, Q, map = ".a=-99; .b=-98; else=copy"))
        identical(.cl72(r1), c("1", "2", "-99", "-98", "1")) &&
          identical(.cl72(r2), .cl72(r1)) &&
          identical(.nav72(r2), c(-99, -98))
      })

m72u <- .fl(grab(jrecode(stm72, Q, map = "9,.a=-99; .b=-98; else=copy")))
check("N72u a marker and a number share one rule (9,.a=-99): both recode; the code stays VALID (an ordinary 9 joined it) and the D1 note names both",
      {
        r <- suppressMessages(jrecode(stm72, Q, map = "9,.a=-99; .b=-98; else=copy"))
        identical(.cl72(r)[c(5, 6, 8, 9)], c("-99", "-98", "-99", "-99")) &&
          identical(.nav72(r), -98) &&
          grepl("Note: 9 and .a were recoded to -99, which looks like a coded missing value.",
                m72u, fixed = TRUE) &&
          grepl("Note: -98 was declared as a missing value on the recoded variable, as .b [\"Don't know\"] is on Q.",
                m72u, fixed = TRUE)
      })

e72v <- grab(jrecode(st72, Q, map = ".ab=1; else=copy"))
check("N72v a malformed old value: the refusal now names the marker form",
      # S345: "value(s)" went with the S287 remainder (N84a-c).
      grepl(paste0("Invalid old value '.ab' in map rule '.ab=1'. Old values must ",
                   "be numeric, a system-NA alias (NA, System, or SYSMIS), or a ",
                   "Stata-style missing-value marker (.a through .z)."), .fl(e72v),
            fixed = TRUE))

.entry_level72 <- getOption(".jst_output_level")
options(.jst_output_level = "full")
m72w <- .fl(grab(jrecode(st72, Q, map = ".c=-97; else=copy")))
options(.jst_output_level = .entry_level72)
check("N72w a marker no cell carries draws the absent-values advisory (full tier)",
      grepl("Note: 'Q' did not contain the map value .c -- nothing was recoded for it.",
            m72w, fixed = TRUE))

options(.jst_options_missing_convention = "spss")
m72x <- .fl(grab(jrecode(stx72, Q, map = ".a=-99; else=copy")))
options(.jst_options_missing_convention = NULL)
# S372 (Fix Slate 20; the S371 remedy-line audit): the token map
# ".a=missing; else=copy" stopped under spss ("'missing' is ambiguous": the
# source is Stata-form). The map leaves the recoded variable no marker, so
# the note offers the declare pair alone (N95h runs it in every state).
check("N72x D1: a marker old value whose code the column also holds as data -- the note names .a and offers the declare pair, no token map",
      grepl("Note: .a was recoded to -99, which looks like a coded missing value.",
            m72x, fixed = TRUE) &&
        grepl("To make the value missing under SPSS convention, declare it on the recoded variable:",
              .fl(m72x), fixed = TRUE) &&
        !grepl("=missing", m72x, fixed = TRUE) &&
        grepl('stx72$QR <- jrecode(stx72, Q, map = ".a=-99; else=copy")', m72x,
              fixed = TRUE) &&
        grepl("jdeclare_missing(stx72, QR, codes = c(-99), modify = TRUE)", m72x,
              fixed = TRUE))

e72y <- grab(jrecode(st72, Q, map = ".a=-99; else=copy"))
check("N72y one form per variable: a kept marker beside a code the rule declares is refused",
      {
        m <- .fl(e72y)
        grepl(paste0("jrecode(): the recoded variable would hold the marker .b ",
                     "beside -99, a declared missing value from .a, and a variable ",
                     "holds SPSS-style missing values or lettered markers, not both."),
              m, fixed = TRUE) &&
          grepl("Convert the data frame first, then recode: jconvert(st72, to = \"spss\", modify = TRUE)",
                m, fixed = TRUE) &&
          grepl("Or map .b as well, so no lettered marker remains.", m, fixed = TRUE)
      })
e72y2 <- grab(jrecode(st72, Q, map = ".a=-99; .b=.c; else=copy", convention = "stata"))
check("N72y2 ... and a marker the map PRODUCES beside it, with the recode-only remedy",
      grepl("would hold the marker .c beside -99", .fl(e72y2), fixed = TRUE) &&
        grepl("Or recode to numbers or NA only, so no lettered marker remains.",
              .fl(e72y2), fixed = TRUE))

e72z <- grab(jrecode(st72_4, Q, map = ".a=-99; .b=-98; .c=-97; .d=-96; else=copy"))
check("N72z four markers to four codes: SPSS's cap stops the result",
      grepl(paste0("jrecode(): SPSS allows at most 3 separate missing-value codes ",
                   "per variable, but the recoded variable would declare 4 (-99, -98, ",
                   "-97, and -96). Recode the declared missing values onto 3 or fewer ",
                   "codes."), .fl(e72z), fixed = TRUE))
e72z2 <- grab(jrecode(bd72, B, map = "-95=-200; else=copy"))
check("N72z2 a range plus more than one code stops the result",
      grepl(paste0("jrecode(): a missing-value range allows at most 1 separate code ",
                   "beside it, but the recoded variable would declare 2 beside its ",
                   "range (-99 to -90): -200 and -1."), .fl(e72z2), fixed = TRUE))

# --- (3) THE RULING, both halves ---
m72aa <- grab(jrecode(ed72, Education, map = "-99=-88; else=copy"))
r72aa <- .try72(jrecode(ed72, Education, map = "-99=-88; else=copy"))
check("N72aa ruling A: -99=-88 on a 1-5 scale declares -88, carries the label, releases -99",
      !is.null(r72aa) && identical(.nav72(r72aa), c(-98, -88)) &&
        identical(unname(.lv72(r72aa)[["Refused"]]), "-88") &&
        grepl(paste0("Note: -88 was declared as a missing value on the recoded ",
                     "variable, as -99 [\"Refused\"] is on Education."), .fl(m72aa),
              fixed = TRUE))

m72ab <- .fl(grab(jrecode(ed72, Education, map = "-99,-98=-88; else=copy")))
check("N72ab two declared codes onto one: declared, both sources named, then the collapse note",
      {
        r <- suppressMessages(jrecode(ed72, Education, map = "-99,-98=-88; else=copy"))
        identical(.nav72(r), -88) &&
          grepl(paste0("Note: -88 was declared as a missing value on the recoded ",
                       "variable, as -99 [\"Refused\"] and -98 [\"Don't know\"] are on ",
                       "Education."), m72ab, fixed = TRUE) &&
          grepl("Note: Categories were collapsed.", m72ab, fixed = TRUE)
      })

options(.jst_options_missing_convention = "spss")
m72ac <- grab(jrecode(ed72, Education, map = "-99=6; else=copy"))
options(.jst_options_missing_convention = NULL)
check("N72ac option b: -99=6 stays valid; the note says so and gives the pair with EVERY code",
      {
        r <- suppressMessages(jrecode(ed72, Education, map = "-99=6; else=copy"))
        m <- .fl(m72ac)
        identical(.nav72(r), -98) &&
          grepl(paste0("Note: -99 [\"Refused\"] is a declared missing value on ",
                       "Education, but its new code, 6, is not declared, so those ",
                       "cases now count as data."), m, fixed = TRUE) &&
          grepl("To keep those cases missing, declare 6 on the recoded variable:", m,
                fixed = TRUE) &&
          grepl("jdeclare_missing(ed72, EducationR, codes = c(-98, 6), modify = TRUE)",
                m, fixed = TRUE) &&
          !grepl("under SPSS convention, declare 6", m, fixed = TRUE)
      })

m72ad <- grab(jrecode(inc72, Income, map = "-99=-88; else=copy"))
check("N72ad option b among incomes: -88 unflagged, note fires; the pasted pair declares -98 and -88",
      {
        r  <- suppressMessages(jrecode(inc72, Income, map = "-99=-88; else=copy"))
        rp <- .run_pair72(m72ad, "inc72", inc72, "IncomeR")
        identical(.nav72(r), -98) &&
          grepl("its new code, -88, is not declared", .fl(m72ad), fixed = TRUE) &&
          !is.null(rp) && identical(.nav72(rp), c(-98, -88)) &&
          identical(unname(.lv72(rp)[["Refused"]]), "-88")
      })

m72ae <- .fl(grab(jrecode(st72, Q, map = ".a=6; else=copy")))
check("N72ae option b where a marker remains: the fact only, no remedy line",
      grepl(paste0("Note: .a [\"Refused\"] is a declared missing value on Q, but its ",
                   "new code, 6, is not declared, so those cases now count as data."),
            m72ae, fixed = TRUE) &&
        !grepl("To keep those cases missing", m72ae, fixed = TRUE) &&
        !grepl("jdeclare_missing", m72ae, fixed = TRUE))

m72af <- grab(jrecode(ed72, Education, map = "-99=6; -98=7; else=copy"))
check("N72af option b, plain result, no convention: the menu leads, then the pair; the pair runs once a convention is set",
      {
        m <- .fl(m72af)
        options(.jst_options_missing_convention = "spss")
        rp <- .run_pair72(m72af, "ed72", ed72, "EducationR")
        options(.jst_options_missing_convention = NULL)
        grepl(paste0("Note: -99 [\"Refused\"] and -98 [\"Don't know\"] are declared ",
                     "missing values on Education, but their new codes, 6 and 7, are ",
                     "not declared, so those cases now count as data."), m,
              fixed = TRUE) &&
          grepl("No missing-value convention is selected, so those cases cannot be kept missing yet.",
                m, fixed = TRUE) &&
          grepl("Then declare 6 and 7 on the recoded variable:", m, fixed = TRUE) &&
          !is.null(rp) && identical(.nav72(rp), c(6, 7))
      })

options(.jst_options_missing_convention = "stata")
m72ag  <- .fl(grab(jrecode(inc72, Income, map = "-99=-88; else=copy")))
m72ag2 <- .fl(grab(jrecode(ed72, Education, map = "-99=6; -98=7; else=copy")))
options(.jst_options_missing_convention = NULL)
check("N72ag the lead names the convention only where the setting decides (a plain result)",
      grepl("To keep those cases missing, declare -88 on the recoded variable:", m72ag,
            fixed = TRUE) &&
        grepl("To keep those cases missing under Stata convention, declare 6 and 7 on the recoded variable:",
              m72ag2, fixed = TRUE))

options(.jst_options_missing_convention = "spss")
m72ah <- .fl(grab(jrecode(ed72, Education, map = "-99,5=-88; else=copy")))
m72ai <- .fl(grab(jrecode(ed72x, Education, map = "-99=-88; else=copy")))
options(.jst_options_missing_convention = NULL)
check("N72ah a flagged code that also receives ordinary values stays valid; the D1 note speaks",
      {
        r <- suppressMessages(jrecode(ed72, Education, map = "-99,5=-88; else=copy"))
        identical(.nav72(r), -98) &&
          !grepl("was declared as a missing value on the recoded variable", m72ah,
                 fixed = TRUE) &&
          grepl("which looks like a coded missing value", m72ah, fixed = TRUE)
      })
check("N72ai ... and so does one the column already holds as data under else=copy",
      {
        r <- suppressMessages(jrecode(ed72x, Education, map = "-99=-88; else=copy"))
        identical(.nav72(r), -98) &&
          !grepl("was declared as a missing value on the recoded variable", m72ai,
                 fixed = TRUE)
      })

m72aj <- .fl(grab(jrecode(ed72n, Education, map = "NA=-99; else=copy")))
check("N72aj the NA rule onto a declared code: the note reports the declaration, no declare remedy",
      grepl(paste0("Note: 2 NA values in 'Education' were recoded to -99, a declared ",
                   "missing value on the recoded variable."), m72aj, fixed = TRUE) &&
        !grepl("Declare -99 with jdeclare_missing()", m72aj, fixed = TRUE))

options(.jst_options_missing_convention = "spss")
m72ak <- grab(jrecode(ed72, Education, map = "5=-88; else=copy"))
r72ak <- .run_pair72(m72ak, "ed72", ed72, "EducationR")
options(.jst_options_missing_convention = NULL)
check("N72ak RIDER: the D1 pair's declare line lists every code; pasted, it keeps -99 and -98",
      grepl("jdeclare_missing(ed72, EducationR, codes = c(-99, -98, -88), modify = TRUE)",
            .fl(m72ak), fixed = TRUE) &&
        !is.null(r72ak) && identical(.nav72(r72ak), c(-99, -98, -88)))

e72al <- grab(jrecode(stm72, Q, map = "9=missing; else=copy", convention = "spss"))
check("N72al RIDER (fold-in): 'missing' under a per-call spss on a Stata-style column is refused",
      {
        m <- .fl(e72al)
        grepl(paste0("jrecode(): the recoded variable would hold the markers .a and ",
                     ".b beside -99, which 'missing' declares under SPSS convention, ",
                     "and a variable holds SPSS-style missing values or lettered ",
                     "markers, not both."), m, fixed = TRUE) &&
          grepl("jconvert(stm72, to = \"spss\", modify = TRUE)", m, fixed = TRUE) &&
          grepl("Or map .a and .b as well, so no lettered marker remains.", m,
                fixed = TRUE)
      })

# --- label repairs ---
check("N72am -99,-98=NA no longer stops: the other labels are kept",
      {
        r <- suppressMessages(jrecode(ed72, Education, map = "-99,-98=NA; else=copy"))
        identical(sum(is.na(unclass(r))), 4L) &&
          identical(unname(.lv72(r)[["Some college"]]), "3") &&
          length(.nav72(r)) == 0L
      })
m72an <- .fl(grab(jrecode(ed72, Education, map = "5=4; else=copy")))
check("N72an 5=4; else=copy is a collapse (no longer a stop): the note, and the kept codes' labels",
      {
        r <- suppressMessages(jrecode(ed72, Education, map = "5=4; else=copy"))
        grepl("Note: Categories were collapsed.", m72an, fixed = TRUE) &&
          identical(unname(.lv72(r)[["Refused"]]), "-99") &&
          !("Bachelor's degree" %in% names(.lv72(r)))
      })
check("N72ao -99=-98; else=copy no longer stops: -98 keeps its own label",
      {
        r <- suppressMessages(jrecode(ed72, Education, map = "-99=-98; else=copy"))
        identical(.nav72(r), -98) &&
          identical(unname(.lv72(r)[["Don't know"]]), "-98") &&
          !("Refused" %in% names(.lv72(r)))
      })
check("N72ap a Stata-style column's marker labels survive a recode with no else and with labels =",
      {
        r1 <- suppressMessages(jrecode(st72, Q, map = "1=1; 2=0"))
        r2 <- suppressMessages(jrecode(st72, Q, map = "1=1; 2=0", labels = "1=Yes; 0=No"))
        identical(unname(.lv72(r1)[c("Refused", "Don't know")]), c(".a", ".b")) &&
          identical(unname(.lv72(r2)[c("Refused", "Don't know")]), c(".a", ".b")) &&
          identical(unname(.lv72(r2)[["No"]]), "0")
      })
check("N72aq labels follow values recoded to markers (the migration idiom keeps Refused and Don't know)",
      {
        r <- suppressMessages(jrecode(ed72, Education, map = "-99=.a; -98=.b; else=copy",
                                      convention = "stata"))
        identical(unname(.lv72(r)[c("Refused", "Don't know")]), c(".a", ".b")) &&
          identical(.cl72(r)[c(6, 7)], c(".a", ".b"))
      })

# --- the tag collision guard reads a marker old value ---
e72ar <- grab(jrecode(stm72, Q, map = "9=missing; .b=.a; else=copy", convention = "stata"))
check("N72ar the tag collision guard renders a marker old value in the map's rule (.b=.a)",
      grepl("but the map also assigns .a (.b=.a), so .b and 9 would share one missing value.",
            .fl(e72ar), fixed = TRUE))

# Rule U: no PROSE line of the new messages over the pinned width.
check("N72as no prose line of the S319 messages exceeds the pinned width",
      all(vapply(list(m72p, m72aa, m72ac, m72ad, m72af, m72ak, e72g, e72h, e72i,
                      e72l, e72l2, e72v, e72y, e72y2, e72z, e72z2, e72al, e72ar,
                      grab(jconvert(f72_5, to = "spss")),
                      grab(jconvert(f72_m, to = "spss")),
                      grab(jconvert(f72_two, to = "spss"))),
                 w69, numeric(1)) <= .pin_width))

options(.jst_options_missing_convention_codes = .entry_codes72)
options(.jst_options_missing_convention = .entry_conv72)

# =============================================================================
# N73 -- THE LONG-FORM REPORT AND ONE LABEL FORM (S319, v0.9.196)
# =============================================================================
# jconvert's report became one row per missing value: the column's name on
# its first row, the rest hanging beneath it, the arrow aligned within each
# column's block (ONE arrow column for the whole report since v0.9.211,
# S334: N73c N73d re-pinned, N76 the new section), and no blank line between
# blocks. A declared value with a
# label prints in the house form jfreq's Missing section, jload's narrative
# and jdeclare_missing() use -- -99 ["Refused"] -- as does every jrecode note
# that names one (they had used -99 ("Refused")). A range is "range -99 to
# -95", as jfreq shows it; the return trip annotates its range row with two
# spaces and a parenthesis. All four directions take the shape.
#
# These checks read RAW lines (.rep73(): the message up to its first blank
# line), because the layout is the thing locked and .fl() erases it. Each
# expected block is the reviewed render, typed as literal lines.
# DISCRIMINATION AND MUTANTS: the S319 EDIT 2 note at the head of this file.
#
# Codes-option and convention hygiene as N72: recorded, cleared, restored.

.entry_codes73 <- getOption(".jst_options_missing_convention_codes")
.entry_conv73  <- getOption(".jst_options_missing_convention")
options(.jst_options_missing_convention_codes = NULL)
options(.jst_options_missing_convention = NULL)

# The report: a message's lines up to its first blank line.
.rep73 <- function(msg) {
  l <- strsplit(msg, "\n", fixed = TRUE)[[1]]
  b <- which(!nzchar(l))
  if (length(b)) l[seq_len(b[1] - 1L)] else l
}

f73_two <- data.frame(
  Income = haven::labelled(c(1, .tn72("a"), .tn72("b")),
                           labels = c(Refused = .tn72("a"),
                                      "Don't know" = .tn72("b"))),
  Q      = haven::labelled(c(1, .tn72("a"), .tn72("c")),
                           labels = c(Yes = 1, Refused = .tn72("a"))))
f73_spss <- data.frame(
  A = haven::labelled_spss(c(1, -99, -98), labels = c(Refused = -99),
                           na_values = c(-99, -98)),
  B = haven::labelled_spss(c(1, -60, 2), labels = c("Not asked" = -60),
                           na_range = c(-99, -51)))
f73_band <- data.frame(
  B = f73_spss$B,
  C = haven::labelled_spss(c(1, 2, 3), labels = c(Low = 1),
                           na_range = c(-99, -51)))
f73_ed <- data.frame(
  E = haven::labelled_spss(c(1, 2, 3, -99, -98),
                           labels = c(Low = 1, Refused = -99,
                                      "Don't know" = -98),
                           na_values = c(-99, -98)))
.long73 <- "Refused to answer because the question did not apply to this person"
f73_long <- .mk72(c(1, .tn72("a"), .tn72("b")),
                  stats::setNames(c(1, .tn72("a"), .tn72("b")),
                                  c("Yes", "Refused", .long73)))

m73a <- grab(jconvert(f72_5, to = "spss"))
check("N73a to spss: one row per marker, the name on the first, the arrow aligned, the range row last",
      identical(.rep73(m73a), c(
        "Converted to SPSS-style missing values in 1 variable:",
        '  q  .a ["Refused"]  -> -99',
        '     .b ["DK"]       -> -98',
        '     .c ["NAp"]      -> -97',
        '     .d ["Skip"]     -> -96',
        '     .e ["Lost"]     -> -95',
        "     range -99 to -95")))

m73b <- grab(jconvert(.try72(jconvert(f72_5, to = "spss")), to = "stata"))
check("N73b the return trip: value -> marker rows, the range row annotated (enumerated)",
      identical(.rep73(m73b), c(
        "Converted to Stata-style missing values in 1 variable:",
        '  q  -99 ["Refused"]  -> .a',
        '     -98 ["DK"]       -> .b',
        '     -97 ["NAp"]      -> .c',
        '     -96 ["Skip"]     -> .d',
        '     -95 ["Lost"]     -> .e',
        "     range -99 to -95  (enumerated)")))

m73c <- grab(jconvert(f73_two, to = "spss"))
check("N73c two columns: the names padded, the rows hung beneath, ONE arrow column for both (S334 re-pin), no blank between",
      identical(.rep73(m73c), c(
        "Converted to SPSS-style missing values in 2 variables:",
        '  Income  .a ["Refused"]     -> -99',
        '          .b ["Don\'t know"]  -> -98',
        '  Q       .a ["Refused"]     -> -99',
        "          .c                 -> -98")))

m73d <- grab(jconvert(f73_two, to = "sas"))
check("N73d the case flip takes the same shape (S334 re-pin)",
      identical(.rep73(m73d), c(
        "Converted to SAS-style missing values in 2 variables:",
        '  Income  .a ["Refused"]     -> .A',
        '          .b ["Don\'t know"]  -> .B',
        '  Q       .a ["Refused"]     -> .A',
        "          .c                 -> .C")))

m73e <- grab(jconvert(f73_spss, to = "baseR"))
check("N73e to baseR: what was stripped, one row each, no arrow",
      identical(.rep73(m73e), c(
        "Stripped the missing-value declarations from 2 variables:",
        '  A  -99 ["Refused"]',
        "     -98",
        "  B  range -99 to -51")))

m73f <- grab(jconvert(f73_band, to = "stata"))
check("N73f a range enumerated and a range with nothing to translate",
      identical(.rep73(m73f), c(
        "Converted to Stata-style missing values in 2 variables:",
        '  B  -60 ["Not asked"]  -> .a',
        "     range -99 to -51  (enumerated)",
        "  C  range -99 to -51  (no values found; declaration dropped)")))

m73g <- grab(jrecode(f73_ed, E, map = "1=3; 3=1; else=copy"))
check("N73g jrecode's kept-code note names the codes in the same form",
      grepl(paste0('Note: -99 ["Refused"], -98 ["Don\'t know"] are declared ',
                   "missing values and were kept on the recoded variable."),
            .fl(m73g), fixed = TRUE))

m73h <- grab(jconvert(f73_long, to = "spss"))
check("N73h a row past the width is not word-filled: the long label's row prints whole",
      any(.rep73(m73h) == paste0('     .b ["', .long73, '"]  -> -98')))

options(.jst_options_missing_convention_codes = .entry_codes73)
options(.jst_options_missing_convention = .entry_conv73)

# =============================================================================
# N74 -- joptions(data.dir): THE FOLDER CREATED WHEN SET; NULL CLEARS (S332,
#        v0.9.209)
# =============================================================================
# Two changes to one slot. (1) joptions(data.dir = "Data") creates the folder
# when the setting is made and says so (Jeff, Session 178); through v0.9.208
# it only recorded the name and jsave() created the folder at the first save.
# The note follows the echo, and quiet = TRUE silences it with the rest (Jeff,
# S332, v0.9.210: a quiet call is fully quiet; at v0.9.209 the note printed
# under quiet). A folder that cannot be created stops the call with nothing
# changed, R's own message relayed (Rule AH). jsave() still creates a folder
# that has gone since, through the same helper and with the same note.
# (2) An explicit data.dir = NULL clears the folder, as "" does (Session 181):
# NULL is this slot's default, and it was the one slot that could not be reset
# by passing its default. An OMITTED data.dir is still left alone.
# The section works in a scratch working directory of its own, with a space in
# its name, and puts the session's directory and setting back at its foot.
.entry_dd74 <- getOption(".jst_options_data_dir")
.entry_cl74 <- getOption(".jst_options_corr_layout")
.wd74 <- getwd()
.td74 <- file.path(tempdir(), "jstats n74")
unlink(.td74, recursive = TRUE); dir.create(.td74); setwd(.td74)
options(.jst_options_data_dir = NULL, .jst_options_corr_layout = NULL)
# both74(): stdout and the message stream as ONE ordered vector of lines, the
# messages taken as CONDITIONS (never through a sink: RStudio re-emits a
# message through handlers of its own) and marked "[msg] ".
both74 <- function(expr) {
  utils::capture.output(withCallingHandlers(expr, message = function(m) {
    cat(paste0("[msg] ", strsplit(sub("\n$", "", conditionMessage(m)), "\n",
                                  fixed = TRUE)[[1L]]), sep = "\n")
    invokeRestart("muffleMessage")
  }))
}
.note74 <- function(dir) paste0("Created '", dir, "' folder in working directory.\n")

m74a <- grab(joptions(data.dir = "Data"))
check("N74a setting a folder that does not exist creates it, with the note",
      identical(m74a, .note74("Data")) && dir.exists("Data") &&
      identical(getOption(".jst_options_data_dir"), "Data"))
check("N74b ... and the echo names it with no first-save annotation",
      { p <- printed(joptions("data.dir"))
        grepl("Data folder: Data\n", p, fixed = TRUE) &&
          !grepl("will be created", p, fixed = TRUE) })
check("N74c setting a folder that exists creates nothing and says nothing",
      identical(grab(joptions(data.dir = "Data")), ""))
.o74d <- both74(joptions(data.dir = "Second"))
check("N74d the note follows the echo, after its closing blank line, and is followed by one of its own (S334 re-pin)",
      identical(.strip_ansi(.o74d),
                c("Options Settings", "Data folder: Second",
                  "Run joptions() to see all settings.", "",
                  "[msg] Created 'Second' folder in working directory.", "")))
.o74e <- both74(joptions(data.dir = "Quiet", quiet = TRUE))
check("N74e quiet = TRUE prints nothing at all -- no panel, no note -- and still creates the folder",
      identical(.o74e, character(0)) && dir.exists("Quiet") &&
      identical(getOption(".jst_options_data_dir"), "Quiet"))
m74f <- grab(joptions(data.dir = "Deep/Wave 1/Clean"))
check("N74f a nested path is created in full",
      identical(m74f, .note74("Deep/Wave 1/Clean")) && dir.exists("Deep/Wave 1/Clean"))
.abs74 <- file.path(.td74, "Abs Folder")
m74g <- grab(joptions(data.dir = .abs74))
check("N74g an absolute path is not 'in working directory': its own note, the path on a line of its own",
      identical(m74g, paste0("Created the data folder:\n  ", .abs74, "\n")) &&
      dir.exists(.abs74))
check("N74h ... the note's two forms by the shape of the name",
      identical(jstats:::.jst_data_dir_created_note("C:/Study/Data"),
                "Created the data folder:\n  C:/Study/Data") &&
      identical(jstats:::.jst_data_dir_created_note("~/Data"),
                "Created the data folder:\n  ~/Data") &&
      identical(jstats:::.jst_data_dir_created_note("Data/Wave1"),
                "Created 'Data/Wave1' folder in working directory."))

# A folder that cannot be created: a FILE of that name is in the way.
writeLines("x", "afile")
invisible(grab(joptions(data.dir = "Data", corr.layout = "wide", quiet = TRUE)))
m74i <- grab(joptions(data.dir = "afile", corr.layout = "stacked"))
check("N74i a folder that cannot be created stops: what failed, the path on its own line, R's message, nothing changed",
      startsWith(m74i, "joptions(): the data folder could not be created:\n  afile\nR reported:\n  ") &&
      endsWith(m74i, "\nNo setting was changed.") &&
      identical(length(strsplit(m74i, "\n", fixed = TRUE)[[1L]]), 5L))
check("N74j ... and no setting in the call was changed, the other slot included",
      identical(getOption(".jst_options_data_dir"), "Data") &&
      identical(getOption(".jst_options_corr_layout"), "wide"))
m74k <- grab(joptions(data.dir = "Never", corr.layout = "bogus"))
check("N74k every other check runs first: a bad value elsewhere in the call creates no folder",
      grepl("`corr.layout` must be \"wide\" or \"stacked\".", .fl(m74k), fixed = TRUE) &&
      !dir.exists("Never"))

# NULL clears.
.dirs74 <- list.dirs(".", recursive = FALSE)
.o74l <- both74(joptions(data.dir = NULL))
check("N74l an explicit data.dir = NULL clears the folder, and the echo says so",
      is.null(getOption(".jst_options_data_dir")) &&
      identical(.strip_ansi(.o74l),
                c("Options Settings", "Data folder: Working directory",
                  "Run joptions() to see all settings.", "")))
check("N74m ... creating nothing",
      identical(list.dirs(".", recursive = FALSE), .dirs74))
invisible(grab(joptions(data.dir = "Data", quiet = TRUE)))
.x74 <- NULL
invisible(grab(joptions(data.dir = .x74, quiet = TRUE)))
check("N74n ... as does a NULL held in a variable",
      is.null(getOption(".jst_options_data_dir")))
invisible(grab(joptions(data.dir = "Data", quiet = TRUE)))
invisible(grab(joptions(data.dir = "", quiet = TRUE)))
.e74o <- is.null(getOption(".jst_options_data_dir"))
invisible(grab(joptions(data.dir = "Data", quiet = TRUE)))
invisible(grab(joptions(data.dir = "   ", quiet = TRUE)))
check("N74o \"\" still clears, and so does a blank string",
      .e74o && is.null(getOption(".jst_options_data_dir")) &&
      identical(list.dirs(".", recursive = FALSE), .dirs74))
invisible(grab(joptions(data.dir = "Data", quiet = TRUE)))
invisible(grab(joptions(corr.layout = "stacked", quiet = TRUE)))
check("N74p an OMITTED data.dir is left alone",
      identical(getOption(".jst_options_data_dir"), "Data"))
check("N74q the two refusals name NULL as the way to clear",
      identical(.fl(grab(joptions(data.dir = "NULL"))),
                paste0("joptions(): data.dir = \"NULL\" looks like a typo. To clear the data ",
                       "folder back to the working directory, use data.dir = NULL (no quotes) ",
                       "or data.dir = \"\" (empty quotes).")) &&
      identical(.fl(grab(joptions(data.dir = NA))),
                paste0("joptions(): data.dir must be a single character string, NULL, or ",
                       "\"\". (NULL or \"\" clears the folder.)")) &&
      identical(getOption(".jst_options_data_dir"), "Data"))

# jsave(): the folder gone since it was set.
d74 <- data.frame(a = 1:3)
invisible(grab(joptions(data.dir = "Gone", quiet = TRUE)))
unlink("Gone", recursive = TRUE)
check("N74r a folder removed after it was set shows the first-save annotation",
      grepl("Data folder: Gone (will be created on first save)\n",
            printed(joptions("data.dir")), fixed = TRUE))
m74s <- grab(jsave(d74, "d74.rds"))
check("N74s ... and jsave() creates it again, with the same note, and saves",
      startsWith(m74s, .note74("Gone")) && file.exists("Gone/d74.rds"))
options(.jst_options_data_dir = "afile/x")
m74t <- grab(jsave(d74, "d74b.rds"))
check("N74t jsave() stops in the same form when the folder cannot be created",
      startsWith(m74t, "jsave(): the data folder could not be created:\n  afile/x\nR reported:\n  ") &&
      !grepl("No setting was changed", m74t, fixed = TRUE) &&
      identical(length(strsplit(m74t, "\n", fixed = TRUE)[[1L]]), 4L))
check("N74u a name written with a trailing separator is the folder it names: nothing created twice",
      { a <- grab(joptions(data.dir = "Trail/"))
        b <- grab(joptions(data.dir = "Trail/"))
        identical(a, .note74("Trail/")) && identical(b, "") && dir.exists("Trail") })


# S334 (v0.9.211): THE CALL ENDS ON ONE BLANK LINE WHATEVER IT PRINTED LAST.
# The folder note and the environment-scan nudge print after the echo's
# closing blank line and had none of their own, so each sat against the next
# prompt, and against each other when both printed. The blank line is on
# STDOUT (it carries no "[msg] " mark below): the RStudio console does not
# display a blank line on the message stream. N74d above is the note alone.
# The nudge names whatever data frames the workspace holds, and this
# battery's holds dozens, so .frames74() sets every data frame aside for
# the length of one call -- leaving the one named, if any -- and puts them
# back; the nudge's presence is then the check's own.
.frames74 <- function(keep, expr) {
  nms  <- ls(globalenv(), all.names = TRUE)
  isdf <- vapply(nms, function(n) is.data.frame(get(n, envir = globalenv())),
                 logical(1))
  hold <- mget(setdiff(nms[isdf], keep), envir = globalenv())
  rm(list = names(hold), envir = globalenv())
  on.exit(list2env(hold, envir = globalenv()), add = TRUE)
  force(expr)
}
.entry_mc74 <- getOption(".jst_options_missing_convention")
n74_st <- data.frame(q = haven::labelled(c(1, 2, haven::tagged_na("a")),
                                         labels = c(Refused = haven::tagged_na("a"))))
.echo74 <- c("Options Settings", "Missing-value convention: SPSS-style",
             "SPSS-style missing value codes: -99, -98, -97")
.nudge74 <- c("Note: the n74_st data frame uses Stata-style missing values.",
              "To convert it to match this setting, run:",
              "  jconvert(n74_st, to = \"spss\", modify = TRUE)")
.n_df74 <- sum(vapply(ls(globalenv(), all.names = TRUE), function(n)
  is.data.frame(get(n, envir = globalenv())), logical(1)))
.o74v <- .frames74(character(0), both74(joptions(missing.convention = "spss")))
check("N74v a nudge with nothing to say adds nothing: the echo's own closing blank line is the only one",
      identical(.strip_ansi(.o74v),
                c(.echo74, "Run joptions() to see all settings.", "")))
.o74w <- .frames74("n74_st", both74(joptions(missing.convention = "spss")))
check("N74w the nudge alone: after the echo's blank line, and closed by one of its own",
      identical(.strip_ansi(.o74w),
                c(.echo74, "Run joptions() to see all settings.", "",
                  .nudge74, "")))
.o74x <- .frames74("n74_st", both74(joptions(missing.convention = "spss",
                                             data.dir = "Both")))
check("N74x the note and the nudge together: a blank line between them and one after",
      identical(.strip_ansi(.o74x),
                c(.echo74, "Data folder: Both",
                  "Run joptions() to see all settings.", "",
                  "[msg] Created 'Both' folder in working directory.", "",
                  .nudge74, "")))
check("N74y ... and every data frame set aside for those calls is back",
      identical(sum(vapply(ls(globalenv(), all.names = TRUE), function(n)
        is.data.frame(get(n, envir = globalenv())), logical(1))), .n_df74) &&
        .n_df74 > 10L)
options(.jst_options_missing_convention = .entry_mc74)

setwd(.wd74); unlink(.td74, recursive = TRUE)
options(.jst_options_data_dir = .entry_dd74, .jst_options_corr_layout = .entry_cl74)
rm(d74, both74, .note74, .x74, .frames74, n74_st, .echo74, .nudge74, .n_df74,
   .entry_mc74)

# =============================================================================
# N75 -- THE FULL PANEL SHOWS ALL SIX SLOTS (S332, v0.9.210; reverses S267)
# =============================================================================
# From S267 the full panel -- a bare joptions(), and the joptions(NULL) reset
# -- left the "SPSS-style missing value codes" row out unless the setting
# was "spss". Jeff reversed that at S332: jconvert(to = "spss") and a per-call
# convention = "spss" use the codes under any setting, the pointer under every
# partial panel promises "all settings", and five rows of six read as a
# missing option. NOTHING in this battery held the S267 rule (the unedited
# file is green on both sides of the change for these calls), so these are
# the first assertions on the full panel's rows. What S267 left in place: a
# setting call's ECHO still pulls the codes in only under "spss".
.entry75 <- options(.jst_options_missing_convention = NULL,
                    .jst_options_missing_convention_codes = NULL,
                    .jst_options_data_dir = NULL,
                    .jst_options_corr_layout = NULL,
                    .jst_options_missing_detail = NULL)
.rows75 <- function(conv) c(
  "Options Settings",
  paste0("Missing-value convention: ", conv),
  "SPSS-style missing value codes: -99, -98, -97",
  "Data folder: Working directory",
  "Correlation layout: wide",
  "Missing-value detail: per_code",
  "Message width: 76",
  "")
.pan75 <- function(expr) .strip_ansi(suppressMessages(utils::capture.output(expr)))
# .echo75(): the panel block alone -- its lines through the closing blank.
# A setting call's environment-scan notice prints after that blank, and this
# battery's workspace is full of frames for it to name.
.echo75 <- function(x) x[seq_len(match("", x))]
check("N75a with no convention chosen the full panel has six rows, the codes row second",
      identical(.pan75(joptions()), .rows75("None selected")))
options(.jst_options_missing_convention = "stata")
check("N75b ... under a Stata-style setting",
      identical(.pan75(joptions()), .rows75("Stata-style")))
options(.jst_options_missing_convention = "sas")
check("N75c ... under a SAS-style setting",
      identical(.pan75(joptions()), .rows75("SAS-style")))
options(.jst_options_missing_convention = "spss")
check("N75d ... and under an SPSS-style setting, as before",
      identical(.pan75(joptions()), .rows75("SPSS-style")))
options(.jst_options_missing_convention = "stata")
.p75e <- .pan75(joptions(NULL))
options(.jst_options_message_width = .pin_width)   # the reset cleared the pin
check("N75e the joptions(NULL) reset prints the six rows too",
      identical(.p75e[1:6], .rows75("None selected")[1:6]) &&
      startsWith(.p75e[7], "Message width: ") && identical(length(.p75e), 8L))
check("N75f a setting call's echo still leaves the codes out under a Stata-style setting",
      identical(.echo75(.pan75(joptions(missing.convention = "stata"))),
                c("Options Settings", "Missing-value convention: Stata-style",
                  "Run joptions() to see all settings.", "")))
check("N75g ... and pulls them in under an SPSS-style setting",
      identical(.echo75(.pan75(joptions(missing.convention = "spss"))),
                c("Options Settings", "Missing-value convention: SPSS-style",
                  "SPSS-style missing value codes: -99, -98, -97",
                  "Run joptions() to see all settings.", "")))
options(.entry75)
rm(.entry75, .rows75, .pan75, .echo75, .p75e)

# =============================================================================
# N76 -- ONE ARROW COLUMN FOR THE WHOLE REPORT (S334, v0.9.211)
# =============================================================================
# From 0.9.196 the arrow aligned within each column's block, so a one-value
# column's arrow sat out of line with its neighbors' (seen in three guide
# boxes at S333). Now every source is padded to ONE width, the widest among
# the rows that fit the message width; a row too long to fit -- at the arrow
# column it would set, with the report's widest destination -- keeps its
# arrow directly after its own label and moves nobody else, which is what
# the per-block form was for. N73c and N73d are the two-column re-pins; this
# section is the one-value column, the long row, and the width that decides.
# Raw lines through .rep73(), as N73; option hygiene as N73.
.entry_codes76 <- getOption(".jst_options_missing_convention_codes")
.entry_conv76  <- getOption(".jst_options_missing_convention")
options(.jst_options_missing_convention_codes = NULL)
options(.jst_options_missing_convention = NULL)

f76_mix <- data.frame(
  Income = haven::labelled(c(1, .tn72("a"), .tn72("b")),
                           labels = c(Refused = .tn72("a"),
                                      "Don't know" = .tn72("b"))),
  Smoker = haven::labelled(c(1, .tn72("a"), 2),
                           labels = c(Refused = .tn72("a"))),
  Q      = haven::labelled(c(1, .tn72("a"), .tn72("c")),
                           labels = c(Yes = 1, No = .tn72("a"))))
m76a <- grab(jconvert(f76_mix, to = "spss"))
check("N76a a one-value column between two-value columns: its arrow in the same column as theirs",
      identical(.rep73(m76a), c(
        "Converted to SPSS-style missing values in 3 variables:",
        '  Income  .a ["Refused"]     -> -99',
        '          .b ["Don\'t know"]  -> -98',
        '  Smoker  .a ["Refused"]     -> -99',
        '  Q       .a ["No"]          -> -99',
        "          .c                 -> -98")))
m76b <- grab(jconvert(.try72(jconvert(f76_mix, to = "spss")), to = "stata"))
check("N76b the return direction takes the same shape",
      identical(.rep73(m76b), c(
        "Converted to Stata-style missing values in 3 variables:",
        '  Income  -99 ["Refused"]     -> .a',
        '          -98 ["Don\'t know"]  -> .b',
        '  Smoker  -99 ["Refused"]     -> .a',
        '  Q       -99 ["No"]          -> .a',
        "          -98                 -> .b")))

f76_long <- data.frame(
  Income = f76_mix$Income,
  L      = haven::labelled(c(1, .tn72("a"), .tn72("b")),
                           labels = stats::setNames(
                             c(.tn72("a"), .tn72("b")),
                             c("Refused", .long73))))
m76c <- grab(jconvert(f76_long, to = "spss"))
check("N76c a row too long for the message width keeps its own arrow, and the other rows are not moved out to it",
      identical(.rep73(m76c), c(
        "Converted to SPSS-style missing values in 2 variables:",
        '  Income  .a ["Refused"]     -> -99',
        '          .b ["Don\'t know"]  -> -98',
        '  L       .a ["Refused"]     -> -99',
        paste0('          .b ["', .long73, '"]  -> -98'))))
options(.jst_options_message_width = 120L)
m76d <- grab(jconvert(f76_long, to = "spss"))
options(.jst_options_message_width = .pin_width)
.w76 <- nchar(paste0('.b ["', .long73, '"]'))
.pad76 <- function(x) paste0(x, strrep(" ", .w76 - nchar(x)))
check("N76d at a message width the long row fits, it sets the arrow column for every row",
      identical(.rep73(m76d), c(
        "Converted to SPSS-style missing values in 2 variables:",
        paste0("  Income  ", .pad76('.a ["Refused"]'), "  -> -99"),
        paste0("          ", .pad76('.b ["Don\'t know"]'), "  -> -98"),
        paste0("  L       ", .pad76('.a ["Refused"]'), "  -> -99"),
        paste0('          .b ["', .long73, '"]  -> -98'))))
.long76 <- "Did not answer because the interview ended before this question"
f76_none <- .mk72(c(1, .tn72("a"), .tn72("b")),
                  stats::setNames(c(1, .tn72("a"), .tn72("b")),
                                  c("Yes", .long76, .long73)))
m76e <- grab(jconvert(f76_none, to = "spss"))
check("N76e when no row fits, each keeps its own arrow",
      identical(.rep73(m76e), c(
        "Converted to SPSS-style missing values in 1 variable:",
        paste0('  q  .a ["', .long76, '"]  -> -99'),
        paste0('     .b ["', .long73, '"]  -> -98'))) &&
        nchar(.long76) != nchar(.long73))
# The widest DESTINATION decides whether a row fits: with codes -8, -9, -10
# the first row would fit at 76 with its own two-character code, and not at
# the three the column must allow for.
options(.jst_options_missing_convention_codes = c(-8, -9, -10))
.lab76f <- strrep("x", 57L)
f76_dst <- .mk72(c(1, .tn72("a"), .tn72("b"), .tn72("c")),
                 stats::setNames(c(1, .tn72("a"), .tn72("b"), .tn72("c")),
                                 c("Yes", .lab76f, "DK", "NAp")))
m76f <- grab(jconvert(f76_dst, to = "spss"))
options(.jst_options_missing_convention_codes = NULL)
check("N76f a row is judged at the report's widest destination: 76 wide with its own code, 77 at the widest, so it keeps its own arrow",
      identical(.rep73(m76f), c(
        "Converted to SPSS-style missing values in 1 variable:",
        paste0('  q  .a ["', .lab76f, '"]  -> -8'),
        '     .b ["DK"]   -> -9',
        '     .c ["NAp"]  -> -10')) &&
        identical(nchar(paste0('  q  .a ["', .lab76f, '"]  -> -8')), 76L))

# ... and a row exactly AT the width, with the widest destination, fits: it
# sets the column for the rows beside it.
options(.jst_options_missing_convention_codes = c(-8, -9, -10))
.lab76g <- strrep("x", 56L)
f76_at <- .mk72(c(1, .tn72("a"), .tn72("b"), .tn72("c")),
                stats::setNames(c(1, .tn72("a"), .tn72("b"), .tn72("c")),
                                c("Yes", .lab76g, "DK", "NAp")))
m76g <- grab(jconvert(f76_at, to = "spss"))
options(.jst_options_missing_convention_codes = NULL)
check("N76g a row exactly at the width (76, at the widest destination) fits, and sets the arrow column",
      identical(.rep73(m76g), c(
        "Converted to SPSS-style missing values in 1 variable:",
        paste0('  q  .a ["', .lab76g, '"]  -> -8'),
        paste0('     .b ["DK"]', strrep(" ", 54L), '  -> -9'),
        paste0('     .c ["NAp"]', strrep(" ", 53L), '  -> -10'))) &&
        identical(nchar(paste0('     .c ["NAp"]', strrep(" ", 53L), '  -> -10')), 76L))

options(.jst_options_missing_convention_codes = .entry_codes76)
options(.jst_options_missing_convention = .entry_conv76)
rm(f76_mix, f76_long, f76_none, f76_dst, f76_at, .lab76g,
   .w76, .pad76, .long76, .lab76f,
   .entry_codes76, .entry_conv76)

# =============================================================================
# N77 -- THE RETURN-TRIP NOTE FIRES WHENEVER A LETTER WOULD CHANGE (S334,
#        v0.9.211; the S319 reversed-return item, found wider than a range)
# =============================================================================
# The SPSS-to-Stata direction letters a column's codes by absolute value,
# largest first, the more negative first on a tie. The S314 note covered a
# marker set other than the leading letters. It stayed silent when the
# letters were the leading ones and the CODES did not run that way: with
# missing.convention.codes = c(-1, -2, -3), .a .b .c go out as -1 -2 -3 and
# come back as .c .b .a -- "Refused" on .c -- though ?jconvert says the
# notification covers a letter change. Not only a range (the S319 item's
# case): three plain codes do it. The trip is now worked out, and the note
# fires exactly when a letter would change. One variable keeps the S314
# sentence; several share one, which says "the leading letters" only when
# that is true of all of them. Every claim below is checked against the
# trip itself, run both ways (.back77()).
.entry_codes77 <- getOption(".jst_options_missing_convention_codes")
.entry_conv77  <- getOption(".jst_options_missing_convention")
options(.jst_options_missing_convention_codes = NULL)
options(.jst_options_missing_convention = NULL)
.note77 <- function(m) {
  l <- .fl(m)
  if (!grepl("Note: converting ", l, fixed = TRUE)) return("")
  sub("^.*(Note: converting .*?(labels\\.|letters above\\.|not [.A-Za-z, ]+\\.)).*$", "\\1", l,
      perl = TRUE)
}
# The letters the labels sit on after spss and back, under the current codes.
.back77 <- function(f, col = "q", to = "stata") {
  b <- .try72(jconvert(.try72(jconvert(f, to = "spss")), to = to))
  .lv72(b[[col]])
}
f77_3 <- .mk72(c(1, 2, .tn72("a"), .tn72("b"), .tn72("c")),
               c(Yes = 1, No = 2, Refused = .tn72("a"), DK = .tn72("b"),
                 NAp = .tn72("c")))
check("N77a control: under the default codes the leading letters come back as themselves, and nothing is said",
      identical(.note77(grab(jconvert(f77_3, to = "spss"))), "") &&
        identical(.note77(grab(jconvert(f72_5, to = "spss"))), "") &&
        identical(unname(.back77(f77_3)[c("Refused", "DK", "NAp")]), c(".a", ".b", ".c")))
options(.jst_options_missing_convention_codes = c(-1, -2, -3))
m77b <- grab(jconvert(f77_3, to = "spss"))
check("N77b codes -1, -2, -3 and three markers: the note names the letters each would come back with, in the S314 sentence",
      identical(.note77(m77b), paste0(
        "Note: converting q back to Stata-style missing values would give its ",
        "markers .c, .b, .a with the same labels, not .a, .b, .c.")))
check("N77c ... and the trip is as the note says: Refused comes back on .c",
      identical(unname(.back77(f77_3)[c("Refused", "DK", "NAp")]), c(".c", ".b", ".a")))
m77d <- grab(jconvert(f72_5, to = "spss"))
check("N77d the S319 item's case, a range running away from zero: five letters, reversed, and the trip agrees",
      identical(.note77(m77d), paste0(
        "Note: converting q back to Stata-style missing values would give its ",
        "markers .e, .d, .c, .b, .a with the same labels, not .a, .b, .c, .d, .e.")) &&
        identical(.rng72(.try72(jconvert(f72_5, to = "spss"))$q), c(-5, -1)) &&
        identical(unname(.back77(f72_5)[c("Refused", "DK", "NAp", "Skip", "Lost")]),
                  c(".e", ".d", ".c", ".b", ".a")))
f77_ce <- .mk72(c(1, 2, 1, .tn72("c"), .tn72("e")),
                c(Yes = 1, Refused = .tn72("c"), DK = .tn72("e")))
m77e <- grab(jconvert(f77_ce, to = "spss"))
check("N77e other letters AND codes away from zero: the letters each really comes back with (.c as .b, .e as .a)",
      identical(.note77(m77e), paste0(
        "Note: converting q back to Stata-style missing values would give its ",
        "markers .b, .a with the same labels, not .c, .e.")) &&
        identical(unname(.back77(f77_ce)[c("Refused", "DK")]), c(".b", ".a")))
f77_two <- data.frame(q = f77_3$q, r = f77_3$q)
m77f <- grab(jconvert(f77_two, to = "spss"))
check("N77f two variables whose letters come back in another order: one note, 'different letters from those above' -- not 'the leading letters', which they have",
      identical(.note77(m77f), paste0(
        "Note: converting q and r back to Stata-style missing values would ",
        "give their markers different letters from those above, with the same ",
        "labels.")) &&
        !grepl("leading letters", m77f, fixed = TRUE))
# r has ONE marker, .d: it comes back as .a -- the leading letter -- while q's
# three come back reordered. "The leading letters" is true of r alone.
f77_mixd <- data.frame(q = f77_3$q,
                       r = haven::labelled(c(1, 2, 1, 2, .tn72("d")),
                                           labels = c(Yes = 1, Refused = .tn72("d"))))
check("N77g one such variable beside one whose single marker does come back as the leading letter: still 'different letters', true of both",
      identical(.note77(grab(jconvert(f77_mixd, to = "spss"))), paste0(
        "Note: converting q and r back to Stata-style missing values would ",
        "give their markers different letters from those above, with the same ",
        "labels.")))
options(.jst_options_missing_convention_codes = c(-97, -98, -99))
check("N77h codes -97, -98, -99: the same reversal, noted, and the trip agrees",
      identical(.note77(grab(jconvert(f77_3, to = "spss"))), paste0(
        "Note: converting q back to Stata-style missing values would give its ",
        "markers .c, .b, .a with the same labels, not .a, .b, .c.")) &&
        identical(unname(.back77(f77_3)[c("Refused", "DK", "NAp")]), c(".c", ".b", ".a")))
options(.jst_options_missing_convention_codes = c(99, 98, 97))
.n77i <- .note77(grab(jconvert(f77_3, to = "spss")))
.b77i <- unname(.back77(f77_3)[c("Refused", "DK", "NAp")])
options(.jst_options_missing_convention_codes = c(97, 98, 99))
check("N77i positive codes: largest first says nothing and comes back the same; smallest first is noted and reversed",
      identical(.n77i, "") && identical(.b77i, c(".a", ".b", ".c")) &&
        grepl("would give its markers .c, .b, .a with the same labels, not .a, .b, .c.",
              .note77(grab(jconvert(f77_3, to = "spss"))), fixed = TRUE) &&
        identical(unname(.back77(f77_3)[c("Refused", "DK", "NAp")]), c(".c", ".b", ".a")))
f77_2 <- .mk72(c(1, 2, .tn72("a"), .tn72("b")),
               c(Yes = 1, Refused = .tn72("a"), DK = .tn72("b")))
options(.jst_options_missing_convention_codes = c(-9, 9))
.n77j <- .note77(grab(jconvert(f77_2, to = "spss")))
.b77j <- unname(.back77(f77_2)[c("Refused", "DK")])
options(.jst_options_missing_convention_codes = c(9, -9))
check("N77j a tie on size goes to the more negative code: -9 then 9 is silent, 9 then -9 is noted, and the trips agree",
      identical(.n77j, "") && identical(.b77j, c(".a", ".b")) &&
        identical(.note77(grab(jconvert(f77_2, to = "spss"))), paste0(
          "Note: converting q back to Stata-style missing values would give its ",
          "markers .b, .a with the same labels, not .a, .b.")) &&
        identical(unname(.back77(f77_2)[c("Refused", "DK")]), c(".b", ".a")))
options(.jst_options_missing_convention_codes = c(-1, -2, -3))
f77_sas <- .mk72(c(1, 2, .tn72("A"), .tn72("B"), .tn72("C")),
                 c(Yes = 1, Refused = .tn72("A"), DK = .tn72("B"), NAp = .tn72("C")))
check("N77k SAS-style markers: the note keeps their case and names the style, and the trip to SAS form agrees",
      identical(.note77(grab(jconvert(f77_sas, to = "spss"))), paste0(
        "Note: converting q back to SAS-style missing values would give its ",
        "markers .C, .B, .A with the same labels, not .A, .B, .C.")) &&
        identical(unname(.back77(f77_sas, to = "sas")[c("Refused", "DK", "NAp")]),
                  c(".C", ".B", ".A")))
options(.jst_options_missing_convention_codes = NULL)
f77_dn <- data.frame(
  q = haven::labelled(c(1, .tn72("d"), .tn72("n")),
                      labels = c(Yes = 1, DK = .tn72("d"), NAp = .tn72("n"))),
  r = haven::labelled(c(1, .tn72("r"), .tn72("s")),
                      labels = c(Yes = 1, Refused = .tn72("r"), Skip = .tn72("s"))))
check("N77l control: under the default codes two variables with other letters keep the S314 plural, 'the leading letters (.a, .b, ...)'",
      identical(.note77(grab(jconvert(f77_dn, to = "spss"))), paste0(
        "Note: converting q and r back to Stata-style missing values would ",
        "give their markers the leading letters (.a, .b, ...) with the same ",
        "labels, not the letters above.")))

options(.jst_options_missing_convention_codes = .entry_codes77)
options(.jst_options_missing_convention = .entry_conv77)
rm(f77_3, f77_ce, f77_two, f77_mixd, f77_2, f77_sas, f77_dn, .note77, .back77,
   m77b, m77d, m77e, m77f, .n77i, .b77i, .n77j, .b77j,
   .entry_codes77, .entry_conv77)

# =============================================================================
# N78 -- THE jdeclare_missing() CONVENTION ERROR QUOTES THE CALL AS TYPED
# (S337; the S249 item). The builder had no assertion at all: N35a-g test
# the jrecode sibling only. Under a sas setting, on a column that carries
# SPSS-style declarations, a marker typed in lowercase is quoted in
# lowercase (S249 applied the S245 split here: QUOTE what was typed,
# PRESCRIBE in the convention), with no style word on the quoted token, while
# the jconvert() remedy stays in the setting's convention. The message names
# the argument the markers arrived in.
# =============================================================================
.entry_conv78 <- getOption(".jst_options_missing_convention")
f78 <- data.frame(S = mk_spss())
options(.jst_options_missing_convention = "sas")
m78  <- grab(jdeclare_missing(f78, S, codes = c(Refused = ".a")))
m78u <- grab(jdeclare_missing(f78, S, codes = c(Refused = ".A")))
m78l <- grab(jdeclare_missing(f78, S, labels = ".a=Refused"))
check("N78a sas setting, '.a' typed: the head quotes '.a', not '.A'",
      grepl("contains '.a'", m78, fixed = TRUE) &&
        !grepl("'.A'", m78, fixed = TRUE))
check("N78b ... with no style word on the quoted token",
      grepl("a missing-value", m78, fixed = TRUE) &&
        !grepl("-style missing-value", .fl(m78), fixed = TRUE) &&
        !grepl("SAS-style marker,", .fl(m78), fixed = TRUE))
check("N78c ... and the remedy stays in the setting's convention: to = \"sas\"",
      grepl("  jconvert(f78, to = \"sas\", modify = TRUE)", m78, fixed = TRUE) &&
        grepl("To use SAS-style markers instead", .fl(m78), fixed = TRUE))
check("N78d the quote follows the call in the other direction: '.A' typed reads '.A'",
      grepl("contains '.A'", m78u, fixed = TRUE) &&
        !grepl("'.a'", m78u, fixed = TRUE))
check("N78e the head names the argument used: 'codes for S' and, on the labels form, 'labels for S'",
      startsWith(m78, "jdeclare_missing(): codes for S contains") &&
        startsWith(m78l, "jdeclare_missing(): labels for S contains") &&
        !grepl("codes for S", m78l, fixed = TRUE))
options(.jst_options_missing_convention = "stata")
m78t <- grab(jdeclare_missing(f78, S, codes = c(Refused = ".a")))
check("N78f control: under a stata setting the same call prescribes to = \"stata\"",
      grepl("contains '.a'", m78t, fixed = TRUE) &&
        grepl("  jconvert(f78, to = \"stata\", modify = TRUE)", m78t, fixed = TRUE))
options(.jst_options_missing_convention = .entry_conv78)

# N81 -- THE CONFIRMATION STATES THE RESULTING DECLARATION (S339, v0.9.213;
# Fix Slate 2). jdeclare_missing()'s SPSS-form confirmation was rendered
# from the call's ARGUMENTS, and under keep-what-is-omitted (Decision 12
# part 3) the arguments are not the declaration. Eight to-do items, one
# surface:
#   (S298)        a code added to a range column printed the code alone, so
#                 the kept range read as replaced                  N81a-c
#   (Session 198) a code declared with no label said nothing of labels
#   (S241 pt 3)   a label that survived a bare redeclaration went
#                 unreported                                       N81d-g
#   (Session 114) a code no case holds declared without a word; the same
#                 of a range, and of a code converted to a marker  N81h-m
#   (S220)        two spaces before "(in range)" and "(from -99)"  N81j N81k
#   bulk          one block per resulting declaration; a code is marked
#                 absent only when no variable of the block holds it
#                                                                  N81n-q
#   (S267)        the drop notice and the mixed-marker note trailed the
#                 durability reminder                              N81r-w
#   (S298, S292)  the reminder's two lines listed every variable of a bulk
#                 call                                             N81x-ac
#   (S219 2, 5)   a reassignment line pasted an expression on both sides of
#                 the arrow                                        N81ad-am
# The confirmation is stdout, so every check reads printed(); jconvert()'s
# report is a condition and is read through grab(). Lines are compared
# WHOLE, since the layout is what the section locks. Fixtures are haven
# primitives and plain vectors; every name carries 81.
# =============================================================================

.entry_conv81 <- getOption(".jst_options_missing_convention")
options(.jst_options_missing_convention = "spss")

.l81 <- function(txt) strsplit(paste(txt, collapse = "\n"), "\n", fixed = TRUE)[[1]]
# The body: the lines under the header (the first line ending in ":") down to
# the first empty line.
.body81 <- function(txt) {
  l <- .l81(txt)
  h <- which(grepl(":$", l))[1L]
  e <- which(!nzchar(l)); e <- e[e > h]
  l[seq(h + 1L, if (length(e) > 0L) e[1L] - 1L else length(l))]
}
.at81 <- function(txt, start) which(startsWith(.l81(txt), start))[1L]

v81 <- c(1, 2, 3, -99, -98, -60, 8, 1, 2, 3)
d81 <- data.frame(V = v81, W = c(1, 2, -99, 3, 4, 5, 6, 7, 8, 9),
                  X = c(5, 4, 3, 2, 1, -99, -98, 1, 2, 3))

# --- the kept half of the declaration is shown (S298) ------------------------
r81 <- data.frame(V = haven::labelled_spss(v81, na_range = c(-99, -51)))
p81a <- printed(o81a <- jdeclare_missing(r81, V, codes = c(Widowed = 8)))
check("N81a a code added to a range column: the range is listed, marked (already declared)",
      identical(.body81(p81a), c("  range -99 to -51 (already declared)",
                                 "  8 [\"Widowed\"]")) &&
        identical(as.numeric(attr(o81a$V, "na_range")), c(-99, -51)) &&
        identical(as.numeric(attr(o81a$V, "na_values")), 8))
c81 <- data.frame(V = haven::labelled_spss(v81, na_values = 8))
check("N81b a range added to a column with a code: the code is listed, marked (no label; already declared)",
      identical(.body81(printed(jdeclare_missing(c81, V, range = c(-99, -51)))),
                c("  range -99 to -51", "  8 (no label; already declared)")))
check("N81c a range REPLACED: the new range unmarked, the kept code marked, its label shown",
      identical(.body81(printed(jdeclare_missing(o81a, V, range = c(-99, -90)))),
                c("  range -99 to -90", "  8 [\"Widowed\"] (already declared)")))

# --- labels: said when absent, shown when kept (Session 198; S241 part 3) ----
check("N81d bare codes on a plain column: each reads (no label)",
      identical(.body81(printed(jdeclare_missing(d81, V, codes = c(-99, -98)))),
                c("  -99 (no label)", "  -98 (no label)")))
l81 <- data.frame(V = haven::labelled_spss(
  v81, na_values = c(-99, -98), labels = c(Refused = -99, DK = -98)))
p81e <- printed(o81e <- jdeclare_missing(l81, V, codes = c(-99, -98)))
check("N81e a bare redeclaration: the labels the column kept are shown, with no mark",
      identical(.body81(p81e), c("  -99 [\"Refused\"]", "  -98 [\"DK\"]")) &&
        identical(unname(labelled::val_labels(o81e$V)), c(-99, -98)))
u81 <- data.frame(V = haven::labelled(v81, labels = c(Refused = -99)))
check("N81f a bare code whose value label was never a declaration: the label is shown",
      identical(.body81(printed(jdeclare_missing(u81, V, codes = -99))),
                "  -99 [\"Refused\"]"))
check("N81g one code labelled in the call and one not: only the second reads (no label)",
      identical(.body81(printed(jdeclare_missing(d81, V, codes = c(-99, -98),
                                                 labels = "-99=Refused"))),
                c("  -99 [\"Refused\"]", "  -98 (no label)")))

# --- a code no case holds (Session 114), and its neighbours ------------------
check("N81h a code no case holds reads (not present in the data); a code a case holds does not",
      identical(.body81(printed(jdeclare_missing(d81, V, codes = c(-99, -77)))),
                c("  -99 (no label)",
                  "  -77 (no label; not present in the data)")))
check("N81i a range no case falls in is marked; a range holding a case is not",
      identical(.body81(printed(jdeclare_missing(d81, V, range = c(-9, -5)))),
                "  range -9 to -5 (not present in the data)") &&
        identical(.body81(printed(jdeclare_missing(d81, V, range = c(-99, -51)))),
                  "  range -99 to -51"))
check("N81j an in-range label: one space before (in range), and never marked absent (-70 is in no case)",
      identical(.body81(printed(jdeclare_missing(
                  d81, V, range = c(-99, -51),
                  labels = "-60=Skipped; -70=Never asked"))),
                c("  range -99 to -51", "  -60 [\"Skipped\"] (in range)",
                  "  -70 [\"Never asked\"] (in range)")))
p81k <- printed(o81k <- jdeclare_missing(
  d81, V, codes = c(-99, -98, -77), labels = "-98=DK", convention = "stata"))
check("N81k codes converted to markers: (from <code>) after one space, (no label), and the absent code marked",
      identical(.body81(p81k),
                c("  .a (from -99; no label)", "  .b [\"DK\"] (from -98)",
                  "  .c (from -77; no label; not present in the data)")) &&
        identical(sort(unique(haven::na_tag(o81k$V))), c("a", "b")))
check("N81l the same under SAS convention, in uppercase",
      identical(.body81(printed(jdeclare_missing(d81, V, codes = c(-99, -77),
                                                 convention = "sas"))),
                c("  .A (from -99; no label)",
                  "  .B (from -77; no label; not present in the data)")))
# N81m held presence to the column as it ARRIVED, on a column that already
# carried .a cells: -77 became .a too, so presence read from the result
# would have called -77 present. Since v0.9.218 that call is REFUSED (a code
# landing on a marker the variable carries: Jeff's S345 ruling, N84d-o), so
# no call reaches the confirmation with a marker's cells already in the
# column, and a build reading presence from the result can no longer be told
# from this one by any output. N81m now holds the refusal on its fixture;
# N81k and N81l still pin "not present in the data" on a clean column.
t81 <- data.frame(V = haven::labelled(c(1, 2, haven::tagged_na("a"), 3)))
check("N81m a code that would land on a marker the column carries is refused, whether or not a case holds the code (was: its confirmation read \"not present\")",
      { m <- .fl(grab(jdeclare_missing(t81, V, codes = -77, convention = "stata")))
        grepl("jdeclare_missing(): -77 would become .a under Stata convention, but V already carries .a, so the two would share one missing value.",
              m, fixed = TRUE) })

# --- a call on several variables ---------------------------------------------
# -98 is in V and X and not in W; -77 is in none.
p81n <- printed(jdeclare_missing(d81, V, W, X, codes = c(-99, -98, -77)))
check("N81n bulk: ONE block; a code some variables hold is unmarked, a code none holds is marked",
      sum(startsWith(.l81(p81n), "Declared ")) == 1L &&
        identical(.l81(p81n)[1:5],
                  c("Declared SPSS-style missing values on 3 variables:",
                    "  V, W, X", "  -99 (no label)", "  -98 (no label)",
                    "  -77 (no label; not present in the data)")))
# The same with the variable that lacks -98 named FIRST: the block speaks for
# all three, not for the first of them.
check("N81n2 bulk: a code the FIRST variable lacks and another holds is still unmarked",
      identical(.l81(printed(jdeclare_missing(d81, W, V, X,
                                              codes = c(-99, -98))))[2:4],
                c("  W, V, X", "  -99 (no label)", "  -98 (no label)")))
b81 <- data.frame(V = haven::labelled_spss(v81, na_range = c(-99, -51)),
                  W = d81$W, X = d81$X)
p81o <- printed(jdeclare_missing(b81, V, W, X, codes = 8))
check("N81o bulk: a variable keeping a range gets a block of its own, the range marked (already declared)",
      identical(.l81(p81o)[1:8],
                c("Declared SPSS-style missing values on 1 variable:",
                  "  V", "  range -99 to -51 (already declared)",
                  "  8 (no label)", "",
                  "Declared SPSS-style missing values on 2 variables:",
                  "  W, X", "  8 (no label)")))
g81 <- data.frame(V = haven::labelled(v81, labels = c(Refused = -99)),
                  W = haven::labelled(d81$W, labels = c(Refused = -99)),
                  X = haven::labelled(d81$X, labels = c(`No answer` = -99)))
p81p <- printed(jdeclare_missing(g81, V, W, X, codes = -99))
check("N81p bulk: variables whose kept labels differ are reported apart, each with its own",
      identical(.l81(p81p)[1:7],
                c("Declared SPSS-style missing values on 2 variables:",
                  "  V, W", "  -99 [\"Refused\"]", "",
                  "Declared SPSS-style missing values on 1 variable:",
                  "  X", "  -99 [\"No answer\"]")))
p81q <- printed(jdeclare_missing(d81, V, W, X, codes = c(-99, -77),
                                 convention = "stata"))
check("N81q bulk conversion: one block, and the absent code marked for the block",
      sum(startsWith(.l81(p81q), "Declared and converted")) == 1L &&
        identical(.l81(p81q)[3:4],
                  c("  .a (from -99; no label)",
                    "  .b (from -77; no label; not present in the data)")))

# --- the consequence comes before the reminder (S267) ------------------------
p81r <- printed(jdeclare_missing(l81, V, codes = -99))
check("N81r the drop notice sits between the declaration and the reminder, a blank line each side",
      identical(.l81(p81r)[1:6],
                c("Declared SPSS-style missing values on V:",
                  "  -99 [\"Refused\"]", "",
                  "Note: jdeclare_missing replaced the existing declared missing values for V.",
                  "Previously declared codes dropped: -98 [\"DK\"].", "")) &&
        identical(.l81(p81r)[7], "This call changes l81 only if you assign the result:"))
options(.jst_options_missing_convention = "stata")
m81 <- data.frame(z = haven::labelled(
  c(1, haven::tagged_na("a"), haven::tagged_na("B"))))
p81s <- printed(jdeclare_missing(m81, z, codes = c(Refused = ".a")))
check("N81s the mixed-marker note sits before the reminder too",
      !is.na(.at81(p81s, "Note: z carries both")) &&
        .at81(p81s, "Note: z carries both") <
          .at81(p81s, "This call changes m81") &&
        !nzchar(.l81(p81s)[.at81(p81s, "This call changes m81") - 1L]))
options(.jst_options_missing_convention = "spss")
# The two notes that are not consequences of the call keep their place after
# the reminder: their remedy lines name the data frame, which holds the
# declaration only once the result is assigned.
x81 <- data.frame(A = haven::labelled_spss(c(1, -99), na_values = -99),
                  B = haven::labelled_spss(c(2, -99), na_values = -99),
                  C = haven::labelled_spss(c(3, -99), na_values = -99),
                  Income = c(10, -99))
p81t <- printed(jdeclare_missing(x81, Income, codes = -99, convention = "stata"))
check("N81t the convention-mismatch note still follows the reminder",
      .at81(p81t, "Note: Income uses") > .at81(p81t, "To change x81 directly"))
options(.jst_options_missing_convention = "stata")
p81u <- printed(jdeclare_missing(l81, V, codes = -99))
check("N81u the setting-override note follows the reminder, the drop notice precedes it",
      .at81(p81u, "Note: jdeclare_missing replaced") <
        .at81(p81u, "This call changes l81") &&
        .at81(p81u, "Note: V uses SPSS-style") >
          .at81(p81u, "To change l81 directly"))
options(.jst_options_missing_convention = "spss")
.lvl81 <- getOption(".jst_output_level")
options(.jst_output_level = "minimal")
p81v <- printed(jdeclare_missing(l81, V, codes = -99))
options(.jst_output_level = .lvl81)
check("N81v at the minimal level: the declaration, a blank line, the drop notice, and no reminder",
      identical(.l81(p81v)[1:3],
                c("Declared SPSS-style missing values on V:",
                  "  -99 [\"Refused\"]", "")) &&
        startsWith(.l81(p81v)[4], "Note: jdeclare_missing replaced") &&
        !any(grepl("only if you assign", .l81(p81v), fixed = TRUE)))
w81 <- l81
p81w <- printed(jdeclare_missing(w81, V, codes = -99, modify = TRUE))
check("N81w modify = TRUE: the header names the data frame, the drop notice, then the save tip",
      identical(.l81(p81w)[1], "Declared SPSS-style missing values on V in w81:") &&
        .at81(p81w, "Note: jdeclare_missing replaced") <
          .at81(p81w, "To keep it across sessions") &&
        identical(.l81(p81w)[length(.l81(p81w))], "  jsave(w81, \"w81.rds\")") &&
        identical(as.numeric(attr(w81$V, "na_values")), -99))
check("N81w2 missing.notice = FALSE prints nothing, with a code dropped",
      identical(printed(jdeclare_missing(l81, V, codes = -99,
                                         missing.notice = FALSE)), ""))

# --- the reminder's two lines on a bulk call (S298; S292 site 1) -------------
decl81 <- c("V", "W", "X")
p81x <- printed(jdeclare_missing(d81, vars = decl81, range = c(-99, -51)))
check("N81x vars = given as a name: both lines show vars = as typed",
      "  d81 <- jdeclare_missing(d81, vars = decl81, ...)" %in% .l81(p81x) &&
        "  jdeclare_missing(d81, vars = decl81, ..., modify = TRUE)" %in% .l81(p81x))
q81 <- as.data.frame(stats::setNames(
  replicate(14, c(1, 2, -99), simplify = FALSE),
  sprintf("questionnaire_item_%02d", 1:14)))
p81y <- printed(jdeclare_missing(
  q81, questionnaire_item_01, questionnaire_item_02, questionnaire_item_03,
  questionnaire_item_04, questionnaire_item_05, questionnaire_item_06,
  questionnaire_item_07, questionnaire_item_08, questionnaire_item_09,
  questionnaire_item_10, questionnaire_item_11, questionnaire_item_12,
  questionnaire_item_13, questionnaire_item_14, codes = -99))
.sc81 <- function(p) { l <- .l81(p); l[grepl("jdeclare_missing(", l, fixed = TRUE)] }
check("N81y fourteen names: the two lines leave the variables to the template's ..., none shown in part",
      identical(.sc81(p81y),
                c("  q81 <- jdeclare_missing(q81, ...)",
                  "  jdeclare_missing(q81, ..., modify = TRUE)")) &&
        all(nchar(.sc81(p81y)) <= .pin_width) &&
        # the declaration block above them still names all fourteen
        sum(grepl("questionnaire_item_14", .l81(p81y), fixed = TRUE)) == 1L)
check("N81z three names: all three shown, as before",
      "  d81 <- jdeclare_missing(d81, V, W, X, ...)" %in%
        .l81(printed(jdeclare_missing(d81, V, W, X, codes = -99))))
s81 <- as.data.frame(stats::setNames(replicate(5, c(1, -99), simplify = FALSE),
                                     c("a1", "a2", "a3", "a4", "a5")))
check("N81aa four short names that would fit: still none shown (three is the most); three are",
      "  s81 <- jdeclare_missing(s81, ...)" %in%
        .l81(printed(jdeclare_missing(s81, a1, a2, a3, a4, codes = -99))) &&
        "  s81 <- jdeclare_missing(s81, a1, a2, a3, ...)" %in%
          .l81(printed(jdeclare_missing(s81, a1, a2, a3, codes = -99))))
check("N81ab vars = typed as a long vector does not fit, nor do its names: none shown",
      identical(.sc81(printed(jdeclare_missing(
                  q81, vars = c("questionnaire_item_01", "questionnaire_item_02",
                                "questionnaire_item_03"),
                  codes = -99))),
                c("  q81 <- jdeclare_missing(q81, ...)",
                  "  jdeclare_missing(q81, ..., modify = TRUE)")))
options(.jst_options_message_width = 120L)
p81ab2 <- printed(jdeclare_missing(
  q81, questionnaire_item_01, questionnaire_item_02, questionnaire_item_03,
  codes = -99))
options(.jst_options_message_width = .pin_width)
check("N81ab2 three long names do not fit at the pin and are left out; at a width of 120 they are shown",
      "  q81 <- jdeclare_missing(q81, ...)" %in%
        .l81(printed(jdeclare_missing(
          q81, questionnaire_item_01, questionnaire_item_02,
          questionnaire_item_03, codes = -99))) &&
        paste0("  q81 <- jdeclare_missing(q81, questionnaire_item_01, ",
               "questionnaire_item_02, questionnaire_item_03, ...)") %in%
          .l81(p81ab2))
options(.jst_options_message_width = 100L)
p81ac <- printed(jdeclare_missing(
  q81, vars = sprintf("questionnaire_item_%02d", 1:14), codes = -99))
options(.jst_options_message_width = .pin_width)
check("N81ac the fit follows the message width: at 100 the same call's lines carry vars = as typed",
      "  q81 <- jdeclare_missing(q81, vars = sprintf(\"questionnaire_item_%02d\", 1:14), ...)" %in%
        .l81(p81ac))

# --- an expression given as the data (S219, findings 2 and 5) ----------------
mk81 <- function() d81
p81ad <- printed(jdeclare_missing(mk81(), V, codes = -99))
check("N81ad jdeclare_missing(mk81(), ...): the line assigns to a new name, and no modify = TRUE line",
      identical(.l81(p81ad)[4:5],
                c("The result is kept only if you assign it to a name:",
                  "  mydata <- jdeclare_missing(mk81(), V, ...)")) &&
        !any(grepl("mk81() <-", .l81(p81ad), fixed = TRUE)) &&
        !any(grepl("modify = TRUE", .l81(p81ad), fixed = TRUE)))
mkb81 <- function() r81
m81ae <- sub("\n+$", "", grab(jconvert(mkb81(), to = "baseR")))
check("N81ae jconvert(mkb81(), ...): the same, on its own report",
      endsWith(m81ae, paste0(
        "\nThe result is kept only if you assign it to a name:\n",
        "  mydata <- jconvert(mkb81(), ...)")) &&
        !grepl("mkb81() <-", m81ae, fixed = TRUE) &&
        !grepl("modify = TRUE", m81ae, fixed = TRUE))
lst81 <- list(d = d81)
p81af <- printed(jdeclare_missing(lst81$d, V, codes = -99))
check("N81af a place (lst81$d): the assignment line as typed, and no modify = TRUE line",
      identical(.l81(p81af)[4:5],
                c("This call changes lst81$d only if you assign the result:",
                  "  lst81$d <- jdeclare_missing(lst81$d, V, ...)")) &&
        length(.l81(p81af)) == 5L)
# The printed line RUNS once the template's ... is filled with the call's
# own argument, and lands the declaration in the place it names.
check("N81ag ... and that line, its ... filled in, runs and declares in place",
      {
        e <- new.env(parent = globalenv()); assign("lst81", lst81, envir = e)
        suppressMessages(utils::capture.output(eval(parse(
          text = sub("...", "codes = -99", trimws(.l81(p81af)[5]), fixed = TRUE)),
          envir = e)))
        identical(as.numeric(attr(get("lst81", envir = e)$d$V, "na_values")), -99)
      })
p81ah <- printed(jdeclare_missing(d81, V, codes = -99))
check("N81ah control: a plain name keeps both lines",
      identical(.l81(p81ah)[4:8],
                c("This call changes d81 only if you assign the result:",
                  "  d81 <- jdeclare_missing(d81, V, ...)", "",
                  "To change d81 directly, rerun with modify = TRUE:",
                  "  jdeclare_missing(d81, V, ..., modify = TRUE)")))
m81ai <- .fl(grab(jdeclare_missing(mk81(), codes = -99)))
m81aj <- .fl(grab(jdeclare_missing(d81, codes = -99)))
# N81ai and N81aj RE-PINNED S370 (Fix Slate 18): the example is a line on
# community, on a line of its own (filter_check.R AF07 pins the stop whole);
# it had read "(for example jdeclare_missing(MyData, Age, Income, codes =
# c(-99)))" inside the sentence. The names() line is as it was.
.ex81 <- "for example: jdeclare_missing(community, Age, codes = -99, convention = \"spss\")"
check("N81ai no variables, data an expression: the example is community's line, the names() line reads MyData",
      grepl(.ex81, m81ai, fixed = TRUE) &&
        grepl("use vars = names(MyData).", m81ai, fixed = TRUE) &&
        !grepl("mk81()", m81ai, fixed = TRUE))
check("N81aj no variables, data a name: the example is community's line, never the call's data frame; the names() line keeps it",
      grepl(.ex81, m81aj, fixed = TRUE) &&
        !grepl("jdeclare_missing(d81", m81aj, fixed = TRUE) &&
        grepl("use vars = names(d81).", m81aj, fixed = TRUE))
rm(.ex81)
check("N81ak .jst_data_arg_kind(): a name, no argument, two places, and three expressions",
      identical(vapply(list(quote(d), NULL, quote(l$d), quote(l[["d"]]$e),
                            quote(mk()), quote(d[1:3, ]), quote(mk()$d)),
                       jstats:::.jst_data_arg_kind, character(1)),
                c("name", "name", "place", "place",
                  "expression", "expression", "expression")))
options(.jst_options_missing_convention = "stata")
mkt81 <- function() t81
p81al <- printed(jdeclare_missing(mkt81(), V, codes = ".a"))
check("N81al the nothing-to-name note's line assigns to a new name as well",
      "  mydata <- jdeclare_missing(mkt81(), V, codes = c(MyLabel = \".a\"))" %in%
        .l81(p81al))
options(.jst_output_level = "full")
p81am <- printed(jdeclare_missing(mk81(), V, codes = -99))
options(.jst_output_level = .lvl81)
# S373 (Slate E5, the S372 item): the full level's "Equivalent Stata-style
# call for future use" is gone -- it labelled markers the call's data did
# not carry, so it stopped when run on them -- and no line assigns to mk81().
check("N81am at the full level no equivalent call is printed, and no line assigns to the expression",
      !any(grepl("Equivalent", .l81(p81am), fixed = TRUE)) &&
        !any(grepl("tagged_na", .l81(p81am), fixed = TRUE)) &&
        !any(grepl("mk81() <-", .l81(p81am), fixed = TRUE)))
options(.jst_options_missing_convention = "spss")

# Every line a confirmation printed in this section that has the shape of a
# call or an assignment parses (N80 reads conditions; these are stdout).
.p81 <- unlist(lapply(
  list(p81a, p81e, p81k, p81n, p81o, p81p, p81q, p81r, p81s, p81t, p81u,
       p81v, p81w, p81x, p81y, p81ac, p81ad, p81af, p81ah, p81al, p81am),
  .l81))
.c81 <- .p81[grepl("^  [A-Za-z.][A-Za-z0-9._$]*(\\(| <- )", .p81)]
check(paste0("N81an every runnable line the section printed parses (",
             length(.c81), " lines)"),
      length(.c81) >= 30L &&
        all(vapply(.c81, function(l) !inherits(
          try(parse(text = l), silent = TRUE), "try-error"), logical(1))))
check("N81ao and no prose line of them passes the pinned width",
      length(.over76(.p81)) == 0L)

options(.jst_options_missing_convention = .entry_conv81)

# =============================================================================
# N82 -- A STRING VARIABLE: VALUE LABELS, AND DECLARED MISSING VALUES, THROUGH
#        jload(), jconvert(), jsave() AND jdummy() (S340, v0.9.214)
# =============================================================================
# A .sav file's string variable reads, through haven, as a character-backed
# labelled column: Sex "M" / "F" with labels, or MARITAL with MISSING VALUES
# ('UNKNOWN') as a character na_values. Until 0.9.214:
#   - jload() assigned the frame and then STOPPED in its scan of suspected
#     codes, on vctrs' "Can't convert `vec_data(x)` <character> to <double>",
#     for any labelled string variable, declared missing values or none;
#   - its narrative listed a declared string as "NA (no label)";
#   - preserve.declarations = FALSE (jload and jsave) and jconvert(to =
#     "baseR") stripped the declaration and left its cells in the data;
#   - jconvert(to = "stata" / "sas") met vctrs' "Can't convert `labels`
#     <character> to match type of `x` <double>";
#   - jdummy() registered the variable and then met the first vctrs error.
# The numeric declaration on Inc rides in every call, as the control.
s82 <- data.frame(Age = c(21, 34, 45, 23, 36, 52, 41, 29, 33, 40))
s82$Sx  <- haven::labelled(rep(c("M", "F"), 5),
                           labels = c(Male = "M", Female = "F"), label = "Sex")
s82$MS  <- haven::labelled_spss(
  c("UNKNOWN", "Married", "Single", "Married", "UNKNOWN", "Single", "Married",
    "Single", "REF", "Single"),
  labels = c(Refused = "REF"), na_values = c("UNKNOWN", "REF"),
  label = "Marital status")
s82$Inc <- haven::labelled_spss(c(1, 2, -99, 3, 4, 5, -99, 2, 1, 3),
                                labels = c(Refused = -99), na_values = -99)
.f82 <- file.path(tempdir(), "s82_strings.sav")
haven::write_sav(s82, .f82)
.entry_conv82 <- getOption(".jst_options_missing_convention")
options(.jst_options_missing_convention = "spss")
# jload()'s narrative records that it has been shown this session; no check
# before this section printed one, so the flag is handed back here.
.entry_shown82 <- getOption(".jst_missing_notice_shown")
.chr82 <- function(x) as.character(unclass(x))

# missing.notice = TRUE: the full narrative, whatever this session has loaded
# before (a repeat load drops the guidance pair that N82o reads).
m82a <- grab(jload(.f82, name = "l82", overwrite = TRUE, missing.notice = TRUE))
check("N82a jload() reads a .sav with labelled string variables to the end: no error, and the frame as haven read it",
      !grepl("Can't convert", m82a, fixed = TRUE) && exists("l82") &&
        identical(.chr82(l82$Sx), rep(c("M", "F"), 5)) &&
        identical(attr(l82$MS, "na_values"), c("UNKNOWN", "REF")) &&
        startsWith(m82a, "Loaded l82 (SPSS format; 10 cases, 4 variables)"))
check("N82b the narrative names each declared string, with its label, in the form a numeric code takes (it read \"NA (no label)\")",
      grepl(paste0("2 variables have SPSS-style missing values:\n",
                   "  MS: REF [\"Refused\"], UNKNOWN (no label)\n",
                   "  Inc: -99 [\"Refused\"]\n"), m82a, fixed = TRUE))
check("N82c the scan of suspected codes skips a labelled string variable and still reads the numeric ones",
      { e <- data.frame(Sx = s82$Sx, Q = c(1, 2, 3, 4, 5, 1, 2, 3, -99, -99))
        g <- file.path(tempdir(), "s82_scan.sav"); haven::write_sav(e, g)
        # The scan's report is printed, not signalled: printed(), not grab().
        p <- tryCatch(printed(jload(g, name = "l82s", overwrite = TRUE)),
                      error = function(err) paste0("[error] ", conditionMessage(err)))
        ok <- !startsWith(p, "[error]") &&
          # -99 is a missing.convention.codes value: convention-matched
          # since v0.9.234, under the neutral heading (N94).
          grepl("Missing-value codes detected:\n  Q:  -99 (2)\n", p,
                fixed = TRUE) &&
          !grepl("Sx", p, fixed = TRUE)
        unlink(g); ok })
m82d <- grab(jload(.f82, name = "l82d", overwrite = TRUE,
                   preserve.declarations = FALSE))
check("N82d jload(preserve.declarations = FALSE): a declared string's cells become NA with the declaration (the cells stayed, as text)",
      exists("l82d") && is.null(attr(l82d$MS, "na_values")) &&
        identical(is.na(.chr82(l82d$MS)),
                  c(TRUE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, TRUE, FALSE)) &&
        identical(.chr82(l82d$MS)[2:4], c("Married", "Single", "Married")) &&
        grepl("  MS: was REF [\"Refused\"], UNKNOWN (no label)\n", m82d, fixed = TRUE))
r82e <- NULL
m82e <- grab(r82e <- jconvert(s82, to = "baseR"))
check("N82e jconvert(to = \"baseR\"): the declared strings are NA, the other cells and the value label kept, the declaration gone",
      !is.null(r82e) && is.null(attr(r82e$MS, "na_values")) &&
        identical(.chr82(r82e$MS),
                  c(NA, "Married", "Single", "Married", NA, "Single", "Married",
                    "Single", NA, "Single")) &&
        identical(names(attr(r82e$MS, "labels")), "Refused") &&
        identical(sum(is.na(r82e$Inc)), 2L))
check("N82f ... and its report lists them in the declared-value form",
      startsWith(m82e, paste0(
        "Stripped the missing-value declarations from 2 variables:\n",
        "  MS   REF [\"Refused\"]\n",
        "       UNKNOWN\n",
        "  Inc  -99 [\"Refused\"]\n")))
m82g <- grab(jconvert(s82, to = "stata"))
check("N82g jconvert(to = \"stata\"): refused before anything is converted, the message pinned whole",
      identical(m82g, paste0(
        "jconvert(): Stata-style missing values need a numeric variable.\n",
        "\n",
        "This variable in s82 is text, with declared missing values:\n",
        "  MS\n",
        "\n",
        "To convert a narrower set, leaving out the variable above:\n",
        "  jconvert(s82, vars = c(...), to = \"stata\", modify = TRUE)\n",
        "Or turn it into a numeric variable first with jencode().")))
check("N82h to = \"sas\", two text variables: the style word, the count's number and the fix lines follow",
      { e <- s82; e$M2 <- e$MS
        m <- grab(jconvert(e, to = "sas"))
        identical(m, paste0(
          "jconvert(): SAS-style missing values need a numeric variable.\n",
          "\n",
          "These variables in e are text, with declared missing values:\n",
          "  MS\n",
          "  M2\n",
          "\n",
          "To convert a narrower set, leaving out the variables above:\n",
          "  jconvert(e, vars = c(...), to = \"sas\", modify = TRUE)\n",
          "Or turn each into a numeric variable first with jencode().")) })
check("N82i the narrower set the message offers converts: vars = \"Inc\" gives Inc its marker and leaves MS as it was",
      { r <- NULL; invisible(grab(r <- jconvert(s82, to = "stata", vars = "Inc")))
        !is.null(r) && identical(sum(haven::is_tagged_na(r$Inc, "a")), 2L) &&
          identical(r$MS, s82$MS) })
check("N82j a labelled string with NO declaration is no obstacle to a conversion",
      { e <- s82[, c("Age", "Sx", "Inc")]
        r <- NULL; m <- grab(r <- jconvert(e, to = "stata"))
        !is.null(r) && identical(r$Sx, e$Sx) &&
          startsWith(m, "Converted to Stata-style missing values in 1 variable:") })
check("N82k to = \"spss\" has nothing to do for a string variable's declaration",
      grepl("already in spss-form", .fl(grab(jconvert(s82, to = "spss"))), fixed = TRUE))
.g82 <- file.path(tempdir(), "s82_out.csv")
m82l <- grab(jsave(s82, .g82, overwrite = TRUE, preserve.declarations = FALSE))
check("N82l jsave(preserve.declarations = FALSE): the declared strings are blanked with the numeric codes (5 cells; the 3 text cells were written as text)",
      grepl("5 cells holding declared missing values were blanked (preserve.declarations = FALSE).",
            .fl(m82l), fixed = TRUE) &&
        { x <- utils::read.csv(.g82, stringsAsFactors = FALSE, na.strings = "")
          identical(is.na(x$MS), c(TRUE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE,
                                   FALSE, TRUE, FALSE)) &&
            identical(sum(is.na(x$Inc)), 2L) })
unlink(.g82)
check("N82m a .sav round trip through jsave() and jload() keeps a string variable's declaration and labels",
      { h <- file.path(tempdir(), "s82_rt.sav")
        m1 <- grab(jsave(s82, h, overwrite = TRUE))
        m2 <- grab(jload(h, name = "l82m", overwrite = TRUE, quiet = TRUE))
        ok <- exists("l82m") && identical(attr(l82m$MS, "na_values"), c("UNKNOWN", "REF")) &&
          identical(.chr82(l82m$MS), .chr82(s82$MS)) &&
          identical(unname(attr(l82m$Sx, "labels")), c("M", "F"))
        unlink(h); ok })
check("N82n jdummy() on a string variable with declared missing values registers and ends (it met the vctrs error after printing)",
      { p <- printed(jdummy(s82, MS)); m <- grab(jdummy(s82, MS))
        invisible(printed(jdummy(s82, NULL)))
        grepl("  Dummy variables: MS_Single\n  Cases: 10 (3 missing)", p, fixed = TRUE) &&
          !grepl("Can't convert", m, fixed = TRUE) &&
          startsWith(m, "Note: this registration is stored for this session only.") })
check("N82o the load narrative offers a conversion that runs: to = \"baseR\" for a frame holding a declared string (to = \"stata\" would stop on it)",
      grepl("To make them missing in base R as well, convert:\n  jconvert(l82, to = \"baseR\", modify = TRUE)",
            m82a, fixed = TRUE) &&
        !grepl("to = \"stata\"", m82a, fixed = TRUE))
check("N82p ... and that call, run, leaves no declared string in the data",
      { e <- new.env(parent = globalenv()); assign("l82", l82, envir = e)
        ok <- tryCatch({
          suppressMessages(eval(parse(text = "jconvert(l82, to = \"baseR\", modify = TRUE)"), e))
          x <- get("l82", envir = e)
          sum(is.na(.chr82(x$MS))) == 3L && !any(.chr82(x$MS) %in% c("UNKNOWN", "REF"))
        }, error = function(err) FALSE)
        ok })
check("N82q a frame whose declared values are all numeric is still offered to = \"stata\"",
      { e <- s82[, c("Age", "Inc")]
        g <- file.path(tempdir(), "s82_num.sav"); haven::write_sav(e, g)
        m <- grab(jload(g, name = "l82m", overwrite = TRUE, missing.notice = TRUE))
        unlink(g)
        grepl("  jconvert(l82m, to = \"stata\", modify = TRUE)", m, fixed = TRUE) &&
          !grepl("baseR", m, fixed = TRUE) })
options(.jst_options_missing_convention = .entry_conv82)
options(.jst_missing_notice_shown = .entry_shown82)
unlink(.f82)
rm(list = intersect(c("s82", "l82", "l82s", "l82d", "l82m", ".f82", ".g82",
                      ".chr82", ".entry_conv82", ".entry_shown82", "m82a", "m82d", "m82e", "m82g",
                      "m82l", "r82e"), ls(all.names = TRUE)))

# =============================================================================
# N83 -- joptions(): A NEAR MISS OF A CONVENTION VALUE GETS A DID-YOU-MEAN
#        (S343, v0.9.217; the value half the S281 slot guard left out)
# =============================================================================
# N61 holds the slot guard: a lone positional string near a SETTING NAME.
# A mistyped VALUE -- joptions("spps") -- still got the bare choice error.
# It now gets that error (Rule A, unchanged, so the four values are still
# listed -- N2), then the value it is nearest to and the call to run. Near
# is .jst_near_choice_hint()'s test: Levenshtein distance, case-insensitive,
# of at most 2 AND of less than half the typed string's length. The second
# half is what keeps a short string out: "sa" is one edit from "sas" and
# "data" two from "stata", and neither is a near miss. Values tied for
# nearest are all offered. The line keeps the call's form: a lone
# positional string, or the argument by name. The hint is joptions()'s
# alone; every other choice error is as it was (N83j).
.entry_conv83 <- getOption(".jst_options_missing_convention")
.m83a <- grab(joptions("spps"))
check("N83a joptions(\"spps\"): the choice error, then the nearest value and the call, in the positional form (pinned whole)",
      identical(.m83a, paste0(
        "joptions(): `missing.convention` must be \"none\", \"spss\",\n",
        "\"stata\", or \"sas\".\n",
        "Did you mean \"spss\"?\n",
        "  joptions(\"spss\")")))
.m83b <- grab(joptions(missing.convention = "spps"))
check("N83b the argument given by name: the call keeps the name; so does a call with a second setting",
      grepl("\nDid you mean \"spss\"?\n  joptions(missing.convention = \"spss\")", .m83b, fixed = TRUE) &&
        !grepl("  joptions(\"spss\")", .m83b, fixed = TRUE) &&
        grepl("\n  joptions(missing.convention = \"stata\")",
              grab(joptions("statta", corr.layout = "wide")), fixed = TRUE))
check("N83c two values tied for nearest are both offered, in the choices' order, each with its line",
      grepl(paste0("\nDid you mean \"spss\" or \"sas\"?\n",
                   "  joptions(missing.convention = \"spss\")\n",
                   "  joptions(missing.convention = \"sas\")"),
            grab(joptions(missing.convention = "sass")), fixed = TRUE))
check("N83d the offered call runs as printed and sets the convention; the refused call had set nothing",
      { options(.jst_options_missing_convention = NULL)
        m  <- grab(joptions("staat"))
        nothing <- is.null(getOption(".jst_options_missing_convention"))
        ln <- strsplit(m, "\n", fixed = TRUE)[[1]]
        ln <- ln[grepl("^  joptions\\(", ln)]
        ok <- nothing && identical(ln, "  joptions(\"stata\")") &&
          !inherits(try(suppressMessages(utils::capture.output(
            eval(parse(text = ln)))), silent = TRUE), "try-error") &&
          identical(getOption(".jst_options_missing_convention"), "stata")
        options(.jst_options_missing_convention = NULL)
        ok })
check("N83e the comparison is case-insensitive, and a value in any case still SETS without a hint",
      { m <- grab(joptions("SPPS"))
        s <- grab(joptions("SPSS", quiet = TRUE))
        ok <- grepl("\nDid you mean \"spss\"?\n  joptions(\"spss\")", m, fixed = TRUE) &&
          identical(getOption(".jst_options_missing_convention"), "spss") &&
          !grepl("Did you mean", s, fixed = TRUE)
        options(.jst_options_missing_convention = NULL)
        ok })
check("N83f \"none\" is a value like the others",
      grepl("\nDid you mean \"none\"?\n  joptions(\"none\")", grab(joptions("nonne")), fixed = TRUE))
check("N83g over-fire: a string near no value keeps the bare choice error (\"xyzzy\"; \"stata_17\", three edits; \"data\", two edits from stata; \"sa\" and \"st\", one and two from sas)",
      all(vapply(c("xyzzy", "stata_17", "data", "sa", "st", "s", "no", "census"), function(v) {
        m <- .fl(grab(eval(bquote(joptions(.(v))))))
        grepl("`missing.convention` must be \"none\", \"spss\", \"stata\", or \"sas\".", m, fixed = TRUE) &&
          !grepl("Did you mean", m, fixed = TRUE)
      }, logical(1))))
check("N83h over-fire: a value that is not one string gets the choice error and nothing else (a number, two strings, NA, an empty string, TRUE, a function)",
      all(vapply(list(5, c("spps", "sass"), NA_character_, "", TRUE, mean), function(v) {
        m <- .fl(grab(eval(bquote(joptions(missing.convention = .(v))))))
        identical(m, "joptions(): `missing.convention` must be \"none\", \"spss\", \"stata\", or \"sas\".")
      }, logical(1))))
check("N83i the slot guard is first and unchanged: a string near a setting name gets its message, with no value hint",
      { m <- grab(joptions("missing.converntion"))
        grepl("no setting named \"missing.converntion\". Did you", m, fixed = TRUE) &&
          !grepl("must be", m, fixed = TRUE) })
check("N83j the hint is joptions()'s alone: the other choice errors are as they were, and .jst_stop_arg() without a hint is unchanged",
      identical(.fl(grab(jdeclare_missing(data.frame(Age = 1:3), Age, codes = 3, convention = "spps"))),
                "jdeclare_missing(): `convention` must be \"spss\", \"stata\", or \"sas\".") &&
        identical(grab(joutput("standrd")),
                  "joutput(): `level` must be \"minimal\", \"standard\", or \"full\".") &&
        identical(grab(joptions(corr.layout = "wid")),
                  "joptions(): `corr.layout` must be \"wide\" or \"stacked\".") &&
        identical(grab(.jst_stop_arg("f", "x", choices = c("a", "b"))),
                  "f(): `x` must be \"a\" or \"b\"."))
check("N83k the builder, by its cases: one edit; two edits in a long string; a tie; any case; three edits; the half-length rule; nothing near; not one string",
      { h  <- .jst_near_choice_hint
        ch <- c("none", "spss", "stata", "sas")
        identical(h("spps", ch, "f(\""), "\nDid you mean \"spss\"?\n  f(\"spss\")") &&
          identical(h("sttaa", ch, "f(\""), "\nDid you mean \"stata\"?\n  f(\"stata\")") &&
          identical(h("sps", ch, "f(\""),
                    "\nDid you mean \"spss\" or \"sas\"?\n  f(\"spss\")\n  f(\"sas\")") &&
          identical(h("SPPS", ch, "f(\""), "\nDid you mean \"spss\"?\n  f(\"spss\")") &&
          is.null(h("stata_17", ch, "f(\"")) &&
          is.null(h("data", ch, "f(\"")) && is.null(h("sa", ch, "f(\"")) &&
          is.null(h("xyzzy", ch, "f(\"")) && is.null(h(5, ch, "f(\"")) &&
          is.null(h(c("spps", "spps"), ch, "f(\"")) &&
          is.null(h(NA_character_, ch, "f(\"")) && is.null(h("", ch, "f(\"")) })
options(.jst_options_missing_convention = .entry_conv83)
rm(list = intersect(c(".entry_conv83", ".m83a", ".m83b"), ls(all.names = TRUE)))

# =============================================================================
# N84 -- FIX SLATE 5, THE SECOND CUT (S345, v0.9.218): the marker a code or a
#        typed letter lands on; what a narrowed range dropped; "declare it"
#        with no convention selected; a place in an offered modify = TRUE
#        line; the invalid old value named alone
# =============================================================================
# Eight things, lettered by part.
#  A  (the S287 remainder) The map parser's "Invalid old value(s)" quoted a
#     rule's whole left side: on "1, abc = 9" two values were shown and one
#     was invalid. It names the invalid values alone, so the count agrees.
#  B  (Jeff's ruling, S345; the S339 item) jdeclare_missing() converting a
#     code to a marker took its letters from the start of the alphabet
#     whatever the variable held: codes = c(Refused = -99) on a variable
#     whose .a cells were "Skipped" gave two labels on .a and a jfreq() row
#     reading .a ["Skipped"] 2. It stops, with the two recodes that run.
#     jrecode()'s missing token joining a column's own .a cells is NOT this
#     (Decision 14; ruling R8; N69k holds its silence).
#  C  (the S247 item) On a column holding markers in both letter cases, a
#     typed letter names the marker the CELLS carry before the other case
#     is minted: .a under a sas resolution landed on .A, in no cell. And the
#     mixed-marker note counts cells only (N19a moved with it).
#  D  (the S339 item) A range replaced by one that no longer covers all of
#     it is reported as a dropped code is, with the cases that went back to
#     being data. A range that only widened drops nothing.
#  E  (the S241 item, part (1)) The labels hint after "8=missing; else=copy"
#     fired under spss (the token mints a number) and not under stata or
#     sas: one map, two answers. The token's own rules no longer count.
#  F  (the S251 item) jrecode()'s three "declare it" sites carry the
#     choose-first menu when no convention is selected and the variable has
#     no declaration of its own for jdeclare_missing() to follow.
#  G  (the S343 item) .jst_place_lines(): an offered modify = TRUE line
#     whose data is a place takes the assignment form. jencode_check.R
#     N47r-s run jencode()'s; here the unit, and jrecode()'s pair.
#  H  the riders, by their units.
.conv84 <- function(cv, expr) {
  old <- getOption(".jst_options_missing_convention")
  options(.jst_options_missing_convention = cv)
  on.exit(options(.jst_options_missing_convention = old), add = TRUE)
  force(expr)
}
.menu84 <- paste0(
  "No missing-value convention is selected, so the value cannot be\n",
  "declared yet.\n",
  "Choose one for this session:\n",
  "  joptions(missing.convention = \"stata\")\n",
  "      Lowercase markers behave as true NAs in base R.\n",
  "      Recommended if you also run base R or AI-generated code.\n",
  "  joptions(missing.convention = \"spss\")\n",
  "      Codes stay visible numbers; jstats treats them as missing.\n",
  "      Base R does not.\n",
  "  joptions(missing.convention = \"sas\")\n",
  "      Like Stata, with uppercase markers (.A-.Z).\n",
  "To make the choice permanent, put the same line in your .Rprofile.")
.tags84 <- function(x) haven::na_tag(x)
.ltag84 <- function(x) {
  vl <- labelled::val_labels(x)
  stats::setNames(haven::na_tag(vl), names(vl))
}

# --- A: the invalid old value, named alone -----------------------------------
d84 <- data.frame(v = c(1, 2, 8, 2, 1, 3, 8))
check("N84a one invalid old value among valid ones is named alone, in the singular (pinned whole)",
      identical(grab(jrecode(d84, v, map = "1, abc = 9; else=copy")), paste0(
        "jrecode(): Error in map argument: Invalid old value 'abc' in map\n",
        "rule '1, abc = 9'. Old values must be numeric, a system-NA alias (NA,\n",
        "System, or SYSMIS), or a Stata-style missing-value marker (.a through .z).")))
check("N84b two invalid values: the plural, joined by and; a repeated one is named once; the rule is still quoted whole",
      local({ m2 <- .fl(grab(jrecode(d84, v, map = "1, abc, x y = 9; else=copy")))
        m3 <- .fl(grab(jrecode(d84, v, map = "abc, abc, 2 = 9; else=copy")))
        grepl("Invalid old values 'abc' and 'x y' in map rule '1, abc, x y = 9'.", m2, fixed = TRUE) &&
          grepl("Invalid old value 'abc' in map rule 'abc, abc, 2 = 9'.", m3, fixed = TRUE) &&
          !grepl("value(s)", paste(m2, m3), fixed = TRUE) }))
check("N84c the parser's stop is still bare, for jrecode() to frame: no function prefix of its own",
      local({ e <- tryCatch(.jst_parse_map("1, abc = 9"), error = function(e) conditionMessage(e))
        startsWith(e, "Invalid old value 'abc' in map rule '1, abc = 9'.") }))

# --- B: a code converted onto a marker the variable already carries ----------
t84 <- data.frame(V = haven::labelled(
  c(1, 2, haven::tagged_na("a"), -99, 3),
  labels = c(Skipped = haven::tagged_na("a"))))
.m84d <- .conv84("stata", grab(jdeclare_missing(t84, V, codes = c(Refused = -99))))
check("N84d the refusal: what would merge, and the two recodes (pinned whole)",
      identical(.m84d, paste0(
        "jdeclare_missing(): -99 would become .a under Stata convention, but\n",
        "V already carries .a [\"Skipped\"], so the two would share one missing value.\n",
        "To keep them distinct, recode -99 to a marker V does not use:\n",
        "  t84$VR <- jrecode(t84, V, map = \"-99=.b; else=copy\",\n",
        "      labels = \".b=Refused\")\n",
        "Or, if they mean the same thing, recode -99 to .a:\n",
        "  t84$VR <- jrecode(t84, V, map = \"-99=.a; else=copy\")")))
check("N84e the first line runs and keeps the two kinds apart, each with its label; the second runs and merges them under the label the variable had",
      local({ r1 <- .conv84("stata", .run_line_k(.m84d, 1L, "t84", t84))
        r2 <- .conv84("stata", .run_line_k(.m84d, 2L, "t84", t84))
        !is.null(r1) && !is.null(r2) &&
          identical(.tags84(r1$VR), c(NA, NA, "a", "b", NA)) &&
          identical(.ltag84(r1$VR)[c("Skipped", "Refused")], c(Skipped = "a", Refused = "b")) &&
          identical(.tags84(r2$VR), c(NA, NA, "a", "a", NA)) &&
          identical(.ltag84(r2$VR), c(Skipped = "a")) }))
check("N84f nothing was changed by the refused call, with modify = TRUE as without",
      local({ d <- t84
        .conv84("stata", grab(jdeclare_missing(d, V, codes = c(Refused = -99), modify = TRUE)))
        identical(d, t84) }))
u84 <- data.frame(V = haven::labelled(
  c(1, 2, haven::tagged_na("b"), haven::tagged_na("a"), -99, -98, 3),
  labels = c(Skipped = haven::tagged_na("b"), DK = -98)))
.m84g <- .conv84("stata", grab(jdeclare_missing(u84, V, codes = c(-99, -98), labels = "-99=Refused")))
check("N84g several codes: every clash named, an unlabeled marker bare, and each code's label -- the call's, else the one the code has -- carried into the first line (pinned whole)",
      identical(.m84g, paste0(
        "jdeclare_missing(): -99 and -98 would become .a and .b under Stata\n",
        "convention, but V already carries .a and .b [\"Skipped\"], so different kinds\n",
        "of missing data would share a missing value.\n",
        "To keep them distinct, recode the codes to markers V does not use:\n",
        "  u84$VR <- jrecode(u84, V, map = \"-99=.c; -98=.d; else=copy\",\n",
        "      labels = \".c=Refused; .d=DK\")\n",
        "Or, if they mean the same thing, recode the codes to the markers they would\n",
        "have taken:\n",
        "  u84$VR <- jrecode(u84, V, map = \"-99=.a; -98=.b; else=copy\")")))
check("N84h ... and both lines run: four markers kept apart; or the two codes on .a and .b",
      local({ r1 <- .conv84("stata", .run_line_k(.m84g, 1L, "u84", u84))
        r2 <- .conv84("stata", .run_line_k(.m84g, 2L, "u84", u84))
        !is.null(r1) && !is.null(r2) &&
          identical(.tags84(r1$VR), c(NA, NA, "b", "a", "c", "d", NA)) &&
          identical(.ltag84(r1$VR)[c("Refused", "DK", "Skipped")],
                    c(Refused = "c", DK = "d", Skipped = "b")) &&
          identical(.tags84(r2$VR), c(NA, NA, "b", "a", "a", "b", NA)) }))
check("N84i only the clashing code is named when one of two clashes; the lines still carry both codes",
      local({ w <- data.frame(V = haven::labelled(c(1, haven::tagged_na("b"), -99, -98),
                                            labels = c(Skipped = haven::tagged_na("b"))))
        m <- .conv84("stata", grab(jdeclare_missing(w, V, codes = c(-99, -98))))
        grepl("jdeclare_missing(): -98 would become .b under Stata convention, but V already carries .b [\"Skipped\"], so the two would share one missing value.",
              .fl(m), fixed = TRUE) &&
          grepl("  w$VR <- jrecode(w, V, map = \"-99=.a; -98=.c; else=copy\")\n", m, fixed = TRUE) &&
          grepl("  w$VR <- jrecode(w, V, map = \"-99=.a; -98=.b; else=copy\")", m, fixed = TRUE) }))
check("N84j a marker that is only LABELED on the variable clashes too, and so does a code no case holds: the call is read, not the cells",
      local({ w <- data.frame(V = haven::labelled(c(1, 2, -99, 3), labels = c(Skipped = haven::tagged_na("a"))))
        m1 <- .conv84("stata", grab(jdeclare_missing(w, V, codes = c(-99))))
        m2 <- .conv84("stata", grab(jdeclare_missing(t84, V, codes = c(-77))))
        grepl("V already carries .a [\"Skipped\"]", .fl(m1), fixed = TRUE) &&
          grepl("-77 would become .a under Stata convention", .fl(m2), fixed = TRUE) }))
check("N84k SAS convention: uppercase letters throughout, and the lines run",
      local({ w <- data.frame(V = haven::labelled(c(1, haven::tagged_na("A"), -99, 3),
                                            labels = c(Skipped = haven::tagged_na("A"))))
        m <- .conv84("sas", grab(jdeclare_missing(w, V, codes = c(-99))))
        r <- .conv84("sas", .run_line_k(m, 1L, "w", w))
        grepl("-99 would become .A under SAS convention, but V already carries .A [\"Skipped\"]", .fl(m), fixed = TRUE) &&
          grepl("  w$VR <- jrecode(w, V, map = \"-99=.B; else=copy\")\n", m, fixed = TRUE) &&
          !is.null(r) && identical(.tags84(r$VR), c(NA, "A", "B", NA)) }))
check("N84l no clash, no refusal: a variable holding .c takes .a for its code, and an INTEGER column converts as it did (the first build stopped on it)",
      local({ w <- data.frame(V = haven::labelled(c(1, haven::tagged_na("c"), -99, 3),
                                            labels = c(Skipped = haven::tagged_na("c"))),
                        I = c(1L, 2L, -99L, 3L))
        o <- .conv84("stata", suppressMessages(jdeclare_missing(w, V, I, codes = c(-99),
                                                               missing.notice = FALSE)))
        # the other CASE of a letter is another marker. Only a column holding
        # both cases reaches the setting (one case resolves by its own form):
        # under sas -99 takes .A beside the .a and .B cells, no clash; under
        # stata it would take .a, which the column carries.
        y <- data.frame(V = haven::labelled(c(1, haven::tagged_na("a"),
                                              haven::tagged_na("B"), -99)))
        o2 <- .conv84("sas", suppressMessages(jdeclare_missing(y, V, codes = c(-99),
                                                              missing.notice = FALSE)))
        m3 <- .conv84("stata", grab(jdeclare_missing(y, V, codes = c(-99))))
        identical(.tags84(o$V), c(NA, "c", "a", NA)) &&
          identical(.tags84(o$I), c(NA, NA, "a", NA)) &&
          identical(.tags84(o2$V), c(NA, "a", "B", "A")) &&
          grepl("-99 would become .a under Stata convention", .fl(m3), fixed = TRUE) }))
check("N84m a call on several variables: the clash stops the whole call, named under its variable, and no variable is changed",
      local({ w <- data.frame(V = t84$V, W = c(1, 2, 3, -99, 3))
        m <- .conv84("stata", grab(jdeclare_missing(w, V, W, codes = c(-99), modify = TRUE)))
        # RE-PINNED S352: the variable's name on a line of its own and its
        # refusal under it at four (the S345 item; N87ai pins it whole).
        grepl("cannot declare on 1 of 2 variables; no variable was changed:", .fl(m), fixed = TRUE) &&
          grepl("\n  V:\n    -99 would become .a under Stata convention", m, fixed = TRUE) &&
          identical(w$W, c(1, 2, 3, -99, 3)) }))
check("N84n a place and an expression as the data: the place is named in lines that run; the expression gets mydata, named first under each lead",
      local({ l84 <- list(d = t84); mk84 <- function() t84
        mp <- .conv84("stata", grab(jdeclare_missing(l84$d, V, codes = c(-99))))
        me <- .conv84("stata", grab(jdeclare_missing(mk84(), V, codes = c(-99))))
        e  <- new.env(parent = globalenv()); assign("l84", l84, envir = e)
        ln <- trimws(grep("^  l84", strsplit(mp, "\n", fixed = TRUE)[[1]], value = TRUE))
        ok <- length(ln) == 2L && .conv84("stata", tryCatch({
          suppressMessages(eval(parse(text = ln[1]), e)); TRUE }, error = function(err) FALSE)) &&
          identical(.tags84(get("l84", envir = e)$d$VR), c(NA, NA, "a", "b", NA))
        ok && grepl(paste0("does not use:\n  mydata <- mk84()\n",
                           "  mydata$VR <- jrecode(mydata, V, map = \"-99=.b; else=copy\")\n",
                           "Or, if they mean the same thing, recode -99 to .a:\n",
                           "  mydata <- mk84()\n",
                           "  mydata$VR <- jrecode(mydata, V, map = \"-99=.a; else=copy\")"),
                    me, fixed = TRUE) }))
# FLIPPED S352 (v0.9.225), by design: ruling R8 is built. The token still
# joins the column's own .a cells -- not this section's refusal, which is
# for a CODE -- and the merge is now said.
check("N84o FLIPPED (ruling R8): jrecode()'s missing token still joins the column's own .a cells, not refused, and the merge is now said",
      local({ g <- .conv84("stata", grab(r <- jrecode(t84, V, map = "-99=missing; else=copy")))
        identical(.tags84(r), c(NA, NA, "a", "a", NA)) &&
          !grepl("would", g, fixed = TRUE) &&
          grepl("so the recoded cases share that missing value", .fl(g), fixed = TRUE) }))

# --- C: a typed letter on a column holding both letter cases -----------------
x84 <- data.frame(z = haven::labelled(
  c(1, haven::tagged_na("a"), haven::tagged_na("B"), 2)))
check("N84p under a sas resolution a typed .a names the .a cells (it landed on .A, a marker in no cell), and the confirmation no longer says \"not present\"",
      local({ p <- .conv84("sas", printed(o <- jdeclare_missing(x84, z, codes = c(Refused = ".a"))))
        identical(.ltag84(o$z), c(Refused = "a")) &&
          grepl("\n  .a is now \"Refused\"\n", p, fixed = TRUE) &&
          !grepl("not present in the data", p, fixed = TRUE) }))
check("N84q the mirror: under a stata resolution a typed .B names the .B cells; a typed .b too (input case carries no meaning)",
      local({ o1 <- .conv84("stata", suppressMessages(jdeclare_missing(x84, z, codes = c(Refused = ".B"), missing.notice = FALSE)))
        o2 <- .conv84("stata", suppressMessages(jdeclare_missing(x84, z, codes = c(Refused = ".b"), missing.notice = FALSE)))
        identical(.ltag84(o1$z), c(Refused = "B")) && identical(.ltag84(o2$z), c(Refused = "B")) }))
check("N84r a letter no cell carries in either case keeps the convention's case (forward declaration), and a letter carried in BOTH cases does too",
      local({ o1 <- .conv84("sas", suppressMessages(jdeclare_missing(x84, z, codes = c(New = ".c"), missing.notice = FALSE)))
        y  <- data.frame(z = haven::labelled(c(1, haven::tagged_na("a"), haven::tagged_na("A"), 2)))
        o2 <- .conv84("sas", suppressMessages(jdeclare_missing(y, z, codes = c(Both = ".a"), missing.notice = FALSE)))
        o3 <- .conv84("stata", suppressMessages(jdeclare_missing(y, z, codes = c(Both = ".A"), missing.notice = FALSE)))
        identical(.ltag84(o1$z), c(New = "C")) && identical(.ltag84(o2$z), c(Both = "A")) &&
          identical(.ltag84(o3$z), c(Both = "a")) }))
check("N84s jrecode()'s labels follow the same rule: on a mixed source a label for .a under a sas setting lands on the .a cells the result keeps",
      local({ r <- .conv84("sas", suppressMessages(jrecode(x84, z, map = "1=5; else=copy", labels = ".a=Refused")))
        identical(.tags84(r), c(NA, "a", "B", NA)) && identical(.ltag84(r), c(Refused = "a")) }))
check("N84t the helper by its cases: canonical when carried, the other case when only that is carried, canonical when neither or both; vectorized; NA cells ignored",
      local({ h <- .jst_carried_tag
        identical(h("a", "sas", c(NA, "a", "B")), "a") &&
          identical(h("b", "stata", c(NA, "a", "B")), "B") &&
          identical(h("c", "sas", c("a", "B")), "C") &&
          identical(h("a", "sas", c("a", "A")), "A") &&
          identical(h("A", "stata", c("a", "A")), "a") &&
          identical(h(c("a", "b", "c"), "sas", c("a", "B", NA)), c("a", "B", "C")) &&
          identical(h("a", "stata", character(0)), "a") &&
          identical(h(character(0), "sas", "a"), character(0)) }))
check("N84u the mixed-marker note counts cells only: a marker this very call only labeled is not listed as carried (N19a is the same note, on N19's fixture)",
      local({ p <- .conv84("stata", printed(jdeclare_missing(x84, z, codes = c(Refused = ".a", Other = ".c"))))
        grepl("Note: z carries both Stata-style (.a) and SAS-style (.B) missing values.\n", p, fixed = TRUE) &&
          grepl("\n  .c is now \"Other\" (not present in the data)\n", p, fixed = TRUE) }))

# --- D: a range the call replaced with a narrower one ------------------------
e84 <- data.frame(V = haven::labelled_spss(
  c(1, 2, 3, -60, -95, -99, 2, -70), na_range = c(-99, -51)))
.tail84 <- function(nm) paste0(
  "\n\nThis call changes ", nm, " only if you assign the result:\n",
  "  ", nm, " <- jdeclare_missing(", nm, ", V, ...)\n\n",
  "To change ", nm, " directly, rerun with modify = TRUE:\n",
  "  jdeclare_missing(", nm, ", V, ..., modify = TRUE)")
check("N84v a narrowed range: the note names the range as it was and counts the cases that are data again, a sentence to a line, between the confirmation and the reminder (pinned whole)",
      identical(printed(jdeclare_missing(e84, V, range = c(-99, -90))), paste0(
        "Declared SPSS-style missing values on V:\n",
        "  range -99 to -90\n\n",
        "Note: jdeclare_missing replaced the declared missing-value range for V.\n",
        "Previously declared range: -99 to -51.\n",
        "2 cases it covered are no longer missing.", .tail84("e84"))))
check("N84w one case: the singular throughout; a range cut at its upper end, at its lower end, and at both: each end counted",
      grepl("\nPreviously declared range: -99 to -51.\n1 case it covered is no longer missing.\n\n",
            printed(jdeclare_missing(e84, V, range = c(-99, -65))), fixed = TRUE) &&
        # -99 below the new range and -60 above it; -70 and -95 stay inside
        grepl("\n2 cases it covered are no longer missing.\n",
              printed(jdeclare_missing(e84, V, range = c(-96, -65))), fixed = TRUE) &&
        grepl("\n3 cases it covered are no longer missing.\n",
              printed(jdeclare_missing(e84, V, range = c(-99, -96))), fixed = TRUE) &&
        # the lower end alone: -99 falls out, the upper end is where it was
        grepl("\nPreviously declared range: -99 to -51.\n1 case it covered is no longer missing.\n\n",
              printed(jdeclare_missing(e84, V, range = c(-96, -51))), fixed = TRUE))
check("N84x a range that only widened, and the same range again, get no note",
      !grepl("replaced", printed(jdeclare_missing(e84, V, range = c(-999, -51))), fixed = TRUE) &&
        !grepl("replaced", printed(jdeclare_missing(e84, V, range = c(-99, -51))), fixed = TRUE) &&
        !grepl("replaced", printed(jdeclare_missing(e84, V, range = c(-99, -1))), fixed = TRUE))
check("N84y a case the narrower call still declares as a CODE is not counted, and a range no case fell out of says only what the range was",
      local({ a <- .fl(printed(jdeclare_missing(e84, V, range = c(-99, -90), codes = c(-60))))
        f <- data.frame(V = haven::labelled_spss(c(1, 2, -95, -99), na_range = c(-99, -51)))
        b <- printed(jdeclare_missing(f, V, range = c(-99, -90)))
        grepl("Previously declared range: -99 to -51. 1 case it covered is no longer missing.", a, fixed = TRUE) &&
          grepl("\n\nNote: jdeclare_missing replaced the declared missing-value range for V.\nPreviously declared range: -99 to -51.\n\n",
                b, fixed = TRUE) && !grepl("no longer missing", b, fixed = TRUE) }))
e84b <- data.frame(V = haven::labelled_spss(
  c(1, 2, 3, -60, -95, -99, 2, -70), labels = c(DK = -9), na_values = -9,
  na_range = c(-99, -51)))
check("N84z a dropped code and a narrowed range in one call: one note, the code sentence then the range sentence (pinned); at the minimal level, one Dropped list",
      local({ p  <- printed(jdeclare_missing(e84b, V, range = c(-99, -90), codes = c(-8)))
        lv <- getOption(".jst_output_level"); options(.jst_output_level = "minimal")
        mn <- printed(jdeclare_missing(e84b, V, range = c(-99, -90), codes = c(-8)))
        options(.jst_output_level = lv)
        grepl(paste0(
          "\n\nNote: jdeclare_missing replaced the existing declared missing values for V.\n",
          "Previously declared codes dropped: -9 [\"DK\"].\n",
          "Previously declared range: -99 to -51.\n",
          "2 cases it covered are no longer missing.\n\n"), p, fixed = TRUE) &&
          endsWith(mn, paste0(
            "\n\nNote: jdeclare_missing replaced the existing declared missing values on V.\n",
            "Dropped: -9, range -99 to -51.")) }))
check("N84aa the code-only notice is as it was (a dropped code on a variable with no range), and a codes-only call leaves a range in place without a word",
      local({ f <- data.frame(V = haven::labelled_spss(c(1, -9, -8), labels = c(DK = -9), na_values = c(-9, -8)))
        a <- printed(jdeclare_missing(f, V, codes = c(-8)))
        b <- printed(jdeclare_missing(e84, V, codes = c(-60)))
        grepl("\n\nNote: jdeclare_missing replaced the existing declared missing values for V.\nPreviously declared codes dropped: -9 [\"DK\"].\n\n",
              a, fixed = TRUE) &&
          !grepl("replaced", b, fixed = TRUE) && grepl("  range -99 to -51 (already declared)\n", b, fixed = TRUE) }))

# --- E: the labels hint and the missing token --------------------------------
check("N84ab \"8=missing; else=copy\": no labels hint under any convention (under spss it fired, on the token's own -99)",
      all(vapply(c("spss", "stata", "sas"), function(cv) {
        !grepl("No value labels assigned", .conv84(cv, grab(jrecode(d84, v, map = "8=missing; else=copy"))), fixed = TRUE)
      }, logical(1))))
check("N84ac the hint still fires when the map makes another category of its own, with or without the token, and for a plain recode",
      grepl("\n\nNote: No value labels assigned. To add labels, use jrelabel().\n",
            .conv84("spss", grab(jrecode(d84, v, map = "8=missing; 1=0; else=copy"))), fixed = TRUE) &&
        grepl("No value labels assigned", .conv84("stata", grab(jrecode(d84, v, map = "8=missing; 1=0; else=copy"))), fixed = TRUE) &&
        grepl("No value labels assigned", grab(jrecode(d84, v, map = "1=0; else=copy")), fixed = TRUE))

# --- F: "declare it" with no convention selected (jrecode) -------------------
k84 <- data.frame(v = c(1, 2, -99, 2, 1, 2, 1, NA, 2, 1, 1, 2))
.rem84 <- function(nm) paste0(
  "\n\nNote: This call changes ", nm, " only if you assign the result:\n",
  "  ", nm, "$<name> <- jrecode(...)\n",
  "To check the recode landed correctly, compare jfreq() on the original and\n",
  "the new column.\n")
check("N84ad the NA rule's note: the menu, then the remedy (pinned whole)",
      identical(grab(jrecode(k84, v, map = "NA=-98; else=copy")), paste0(
        "Note: 1 NA value in 'v' was recoded to -98.\n", .menu84, "\n",
        "Then declare -98 with jdeclare_missing() so analyses exclude it.", .rem84("k84"))))
check("N84ae the incomplete-map error: its three lines as they were, then the menu (pinned whole)",
      identical(grab(jrecode(k84, v, map = "1=0; 2=1")), paste0(
        "jrecode(): Value -99 in 'v' was not in the map.\n",
        "-99 looks like a coded missing value; declare it with jdeclare_missing() so\n",
        "analyses exclude it, or map it (for example -99=NA).\n",
        "To leave unmapped values unchanged, add else=copy to the map.\n", .menu84)))
check("N84af the carried-through note (the full level): the menu, then the conditional remedy (pinned to the next note)",
      local({ lv <- getOption(".jst_output_level"); options(.jst_output_level = "full")
        g <- grab(jrecode(k84, v, map = "1=0; 2=1; else=copy"))
        options(.jst_output_level = lv)
        startsWith(g, paste0(
          "Note: -99 in 'v' looks like a coded missing value and was carried\n",
          "through unchanged.\n", .menu84, "\n",
          "Then, if it represents missing data, declare it with jdeclare_missing() so\n",
          "analyses exclude it.\n\n")) }))
check("N84ag two flagged values: the menu's head and the remedies in the plural",
      local({ k2 <- data.frame(v = c(1, 2, -99, 2, 1, 2, 1, -98, 2, 1, 1, 2))
        m  <- .fl(grab(jrecode(k2, v, map = "1=0; 2=1")))
        grepl("so the values cannot be declared yet.", m, fixed = TRUE) &&
          grepl("declare them with jdeclare_missing() so analyses exclude them, or map them.", m, fixed = TRUE) }))
check("N84ah under each convention all three are as they were: no menu",
      all(vapply(c("spss", "stata", "sas"), function(cv) .conv84(cv, {
        lv <- getOption(".jst_output_level")
        a <- grab(jrecode(k84, v, map = "NA=-98; else=copy"))
        b <- grab(jrecode(k84, v, map = "1=0; 2=1"))
        options(.jst_output_level = "full")
        c3 <- grab(jrecode(k84, v, map = "1=0; 2=1; else=copy"))
        options(.jst_output_level = lv)
        identical(a, paste0("Note: 1 NA value in 'v' was recoded to -98.\n",
                            "Declare -98 with jdeclare_missing() so analyses exclude it.",
                            .rem84("k84"))) &&
          endsWith(b, "To leave unmapped values unchanged, add else=copy to the map.") &&
          grepl("through unchanged.\nIf it represents missing data, declare it with jdeclare_missing() so\nanalyses exclude it.\n",
                c3, fixed = TRUE) &&
          !grepl("Choose one", paste(a, b, c3), fixed = TRUE) }), logical(1))))
check("N84ai a variable that carries a declaration of its own meets no gate, so gets no menu: an SPSS-style code on the source (the error, the NA rule) and a lettered marker",
      local({ ks <- data.frame(v = haven::labelled_spss(c(1, 2, -99, 2, 1, -7, 1, NA, 2, 1, 1, 2), na_values = -7))
        kt <- data.frame(v = haven::labelled(c(1, 2, 2, 1, haven::tagged_na("a"), 1, NA, 2, 1, 1, 2)))
        g <- c(grab(jrecode(ks, v, map = "1=0; 2=1")), grab(jrecode(ks, v, map = "NA=-98; else=copy")),
               grab(jrecode(kt, v, map = "NA=-98; else=copy")))
        # RE-PINNED S352: the NA note on a variable with declarations of its
        # own now offers the lines that run (the S345 "Declare -98" item):
        # the pair naming -7 and -98 on ks; on kt, which carries .a, the NA
        # rule sent to .b (the declaration would be refused).
        !any(grepl("Choose one", g, fixed = TRUE)) &&
          grepl("jdeclare_missing()", g[1], fixed = TRUE) &&
          grepl("  jdeclare_missing(ks, vR, codes = c(-7, -98), modify = TRUE)", g[2], fixed = TRUE) &&
          grepl("  kt$vR <- jrecode(kt, v, map = \"NA=.b; else=copy\"", g[3], fixed = TRUE) &&
          # and the advice is true there: the declare meets no gate
          { o <- ks; o$vR <- suppressMessages(jrecode(ks, v, map = "NA=-98; else=copy"))
            !grepl("no missing-value convention", grab(jdeclare_missing(o, vR, codes = c(-7, -98))), fixed = TRUE) } }))
check("N84aj the helper: NULL under a convention or for a variable that is not plain; the menu otherwise, its head agreeing in number; a per-call convention is not read",
      local({ h <- .jst_declare_gate_lead
        is.null(.conv84("stata", h("jrecode"))) && is.null(h("jrecode", plain = FALSE)) &&
          identical(.fl(h("jrecode")), .fl(.menu84)) &&
          startsWith(.fl(h("jrecode", n = 2L)),
                     "No missing-value convention is selected, so the values cannot be declared yet.") &&
          identical(names(formals(h)), c("fn", "n", "plain", "what")) &&
          # S352: what = names what cannot be declared (the load scan's codes)
          startsWith(.fl(h("jload", what = "these codes")),
                     "No missing-value convention is selected, so these codes cannot be declared yet.") }))

# --- G: a place in an offered modify = TRUE line -----------------------------
check("N84ak .jst_place_lines(): a place first and modify = TRUE last takes the assignment form; brackets, quotes and a comma inside the place are copied as typed; the indent is kept",
      identical(.jst_place_lines(c(
        "  jdeclare_missing(lst$d, wR, codes = c(-99), modify = TRUE)",
        "  jconvert(lst[[\"d, e\"]], to = \"stata\", modify = TRUE)",
        "  jconvert(obj@d, vars = c(...), to = \"stata\", modify = TRUE)",
        "  jconvert(lst[[c(1, 2)]], to = \"sas\", modify = TRUE)",
        "  jconvert(lst$`a, b`, to = \"sas\", modify = TRUE)",
        "      jconvert(lst$d$e, to = \"stata\", modify = TRUE)")),
        c("  lst$d <- jdeclare_missing(lst$d, wR, codes = c(-99))",
          "  lst[[\"d, e\"]] <- jconvert(lst[[\"d, e\"]], to = \"stata\")",
          "  obj@d <- jconvert(obj@d, vars = c(...), to = \"stata\")",
          "  lst[[c(1, 2)]] <- jconvert(lst[[c(1, 2)]], to = \"sas\")",
          "  lst$`a, b` <- jconvert(lst$`a, b`, to = \"sas\")",
          "      lst$d$e <- jconvert(lst$d$e, to = \"stata\")")))
check("N84al ... and every other line is returned untouched: a name, the mydata template, prose, an expression, an assignment, a named first argument, a line with no modify, an empty input",
      local({ keep <- c("  jdeclare_missing(d, wR, codes = c(-99), modify = TRUE)",
                  "  jdeclare_missing(mydata, ..., modify = TRUE)",
                  "Name the data first, then rerun with modify = TRUE)",
                  "  jdeclare_missing(mk()$d, V, codes = 1, modify = TRUE)",
                  "  x <- jconvert(lst$d, to = \"stata\", modify = TRUE)",
                  "  jconvert(data = lst$d, to = \"stata\", modify = TRUE)",
                  "  jconvert(lst$d, to = \"stata\")",
                  "  jconvert(lst$d, to = \"stata\", modify = TRUE) # then save",
                  "  jconvert(lst$d, to = \"sta, modify = TRUE)", "")
        identical(.jst_place_lines(keep), keep) &&
          identical(.jst_place_lines(character(0)), character(0)) }))
check("N84am jrecode()'s pair on a place: the declaration is the assignment form and the pair runs as printed; a name keeps modify = TRUE",
      local({ l84 <- list(d = data.frame(Age = c(1, 2, 3, 1, 2, 3)))
        g  <- .conv84("spss", grab(jrecode(l84$d, Age, map = "1=-99; else=copy")))
        ln <- strsplit(g, "\n", fixed = TRUE)[[1]]
        i  <- grep("^Or declare -99 as missing", ln)
        e  <- new.env(parent = globalenv()); assign("l84", l84, envir = e)
        ok <- identical(ln[i + 2L], "  l84$d <- jdeclare_missing(l84$d, AgeR, codes = c(-99))") &&
          .conv84("spss", tryCatch({
            suppressMessages(utils::capture.output({
              eval(parse(text = ln[i + 1L]), e); eval(parse(text = ln[i + 2L]), e) })); TRUE },
            error = function(err) FALSE)) &&
          identical(attr(get("l84", envir = e)$d$AgeR, "na_values"), -99)
        d  <- l84$d
        ok && grepl("\n  jdeclare_missing(d, AgeR, codes = c(-99), modify = TRUE)\n",
                    .conv84("spss", grab(jrecode(d, Age, map = "1=-99; else=copy"))), fixed = TRUE) }))
# RE-PINNED S352 (the S345 item, point 2): the stop for a place typed by
# hand offers the call assigned back to the place, which changes it; the
# two mydata lines changed a copy. N87ak-am hold the rest.
check("N84an a call typed by hand with modify = TRUE on a place: refused, offering the call assigned back to the place",
      local({ l84 <- list(d = data.frame(V = c(1, -99)))
        m <- .conv84("spss", grab(jdeclare_missing(l84$d, V, codes = c(-99), modify = TRUE)))
        grepl("modify = TRUE can only change a data frame that has a name.", .fl(m), fixed = TRUE) &&
          grepl("\n  l84$d <- jdeclare_missing(l84$d, V, codes = c(-99))", m, fixed = TRUE) &&
          !grepl("mydata", m, fixed = TRUE) }))

# --- H: the riders, by their units -------------------------------------------
check("N84ao .jst_udm_row_label(): the bracketed form; \"(no label)\" by default and the value alone on request; NA, an empty string, NULL and a zero-length label are all none",
      local({ f <- .jst_udm_row_label
        identical(f("-99", "Refused"), "-99 [\"Refused\"]") &&
          identical(f(".a", "Skipped", unlabelled = "bare"), ".a [\"Skipped\"]") &&
          identical(f("-99", NA), "-99 (no label)") && identical(f("-99", ""), "-99 (no label)") &&
          identical(f("-99", NA, unlabelled = "bare"), "-99") &&
          identical(f(".a", NULL, unlabelled = "bare"), ".a") &&
          identical(f(".a", character(0), unlabelled = "bare"), ".a") &&
          identical(f(-99, "", unlabelled = "bare"), "-99") }))
check("N84ap .jst_first_typed_marker(): the first marker in map order, then the else target, the NA rule's, the labels'; as typed; NULL when the call names none",
      local({ f  <- .jst_first_typed_marker
        pm <- function(m) .jst_parse_map(m)
        pl <- .jst_parse_labels("1=Low; .B=Refused")
        identical(f(pm("1=.A; 2=.b; else=.c")), ".A") &&
          identical(f(pm("1=2; else=.C")), ".C") &&
          identical(f(pm("NA=.d; 1=2; else=copy")), ".d") &&
          identical(f(pm("1=2; else=copy"), pl, attr(pl, "tagged_raw", exact = TRUE)), ".B") &&
          identical(f(pm("1=2; else=copy"), pl, NULL), ".b") &&
          is.null(f(pm("1=2; else=copy"))) &&
          is.null(f(pm("1=2; else=copy"), .jst_parse_labels("1=Low"), NULL)) }))
check("N84aq the range-conflict heads capitalize for a message() caller, as the menu's does; prefixed they are as they were",
      local({ f <- function(v, p) .jst_choose_convention_error(
          variant = v, fn = "jdeclare_missing", conv = "stata", fits = TRUE,
          data_name = "d", var_names = "V", range = c(-99, -51), prefixed = p)
        startsWith(f("conflict_setting", FALSE), "A missing-value range can exist only under SPSS convention, and your") &&
          startsWith(f("conflict_call", FALSE), "A missing-value range can exist only under SPSS convention; it cannot") &&
          startsWith(f("conflict_setting", TRUE), "a missing-value range") &&
          startsWith(f("conflict_call", TRUE), "a missing-value range") &&
          identical(sub("^A", "a", f("conflict_call", FALSE)), f("conflict_call", TRUE)) }))
rm(list = intersect(c("d84", "t84", "u84", "x84", "e84", "e84b", "k84", ".m84d", ".m84g",
                      ".conv84", ".menu84", ".tags84", ".ltag84", ".tail84", ".rem84"),
                    ls(all.names = TRUE)))

# =============================================================================
# N85 -- A LABELLED VARIABLE STORED AS WHOLE NUMBERS (S350, v0.9.223)
# =============================================================================
# The S345 marker-collision check (N84 part B) reads haven::na_tag() on the
# variable's value labels as well as on its cells, and guarded only the cells
# with is.double(). A labelled variable stored as whole numbers has integer
# labels too, and haven refuses an integer: from 0.9.218 to 0.9.222 every
# jdeclare_missing(codes = ) on one under a stata or sas resolution stopped
# with haven's own "`x` must be a double vector". Six columns in each shipped
# dataset are such variables, and missing-values.qmd's closing exercise
# declares one (clinic's Anxiety2). N84l's integer column carries no labels,
# so the label probe was never reached. Found running that page's finished
# script (S350). An integer vector cannot hold a marker, so it carries none.
.conv85 <- function(cv, expr) {
  old <- getOption(".jst_options_missing_convention")
  options(.jst_options_missing_convention = cv)
  on.exit(options(.jst_options_missing_convention = old), add = TRUE)
  force(expr)
}
f85 <- data.frame(L = haven::labelled(c(1L, 2L, -99L, 3L, -98L, 2L),
                                      labels = c(Low = 1L, High = 3L)),
                  D = c(1, 2, -99, 3, 4, 5))
check("N85a stata: codes on a labelled variable stored as whole numbers convert to markers, its own labels kept",
      local({ m <- .conv85("stata", printed(o <- jdeclare_missing(f85, L,
                  codes = c(Refused = -99, "Don't know" = -98))))
        vl <- labelled::val_labels(o$L)
        is.integer(f85$L) && is.integer(labelled::val_labels(f85$L)) &&
          grepl("Declared and converted to Stata-style missing values on L:\n  .a [\"Refused\"] (from -99)\n  .b [\"Don't know\"] (from -98)\n", m, fixed = TRUE) &&
          identical(haven::na_tag(o$L), c(NA, NA, "a", NA, "b", NA)) &&
          identical(as.numeric(unclass(o$L))[c(1, 2, 4, 6)], c(1, 2, 3, 2)) &&
          identical(names(vl), c("Low", "High", "Refused", "Don't know")) &&
          identical(haven::na_tag(vl), c(NA, NA, "a", "b")) }))
check("N85b sas: the same variable takes uppercase markers",
      local({ o <- .conv85("sas", suppressMessages(jdeclare_missing(f85, L,
                  codes = c(Refused = -99, "Don't know" = -98), missing.notice = FALSE)))
        identical(haven::na_tag(o$L), c(NA, NA, "A", NA, "B", NA)) &&
          identical(haven::na_tag(labelled::val_labels(o$L)), c(NA, NA, "A", "B")) }))
check("N85c a code no case holds: declared ahead as a labeled marker, the cells untouched",
      local({ m <- .conv85("sas", printed(o <- jdeclare_missing(f85, L, codes = c(Skipped = -97))))
        grepl(".A [\"Skipped\"] (from -97; not present in the data)", m, fixed = TRUE) &&
          all(is.na(haven::na_tag(o$L))) &&
          identical(as.numeric(unclass(o$L)), c(1, 2, -99, 3, -98, 2)) }))
check("N85d one call on that variable and a double: both converted, nothing refused",
      local({ m <- .conv85("stata", printed(o <- jdeclare_missing(f85, L, D, codes = c(-99))))
        grepl("Declared and converted to Stata-style missing values on 2 variables:", m, fixed = TRUE) &&
          identical(haven::na_tag(o$L), c(NA, NA, "a", NA, NA, NA)) &&
          identical(haven::na_tag(o$D), c(NA, NA, "a", NA, NA, NA)) }))
check("N85e the shipped clinic's Anxiety2 takes the page's exercise call, and jfreq() lists the two markers",
      local({ o <- .conv85("stata", suppressMessages(jdeclare_missing(clinic, Anxiety2,
                  codes = c(Refused = -99, "Don't know" = -98), missing.notice = FALSE)))
        p <- .conv85("stata", printed(jfreq(o, Anxiety2)))
        is.integer(clinic$Anxiety2) &&
          grepl("\n\\.a \\[\"Refused\"\\] +3 ", p) &&
          grepl("\n\\.b \\[\"Don't know\"\\] +3 ", p) &&
          grepl("\nTotal missing +6 ", p) }))
rm(list = intersect(c("f85", ".conv85"), ls(all.names = TRUE)))

# =============================================================================
# N86 -- FIX SLATE 6, LOAD AND SAVE (S351, v0.9.224)
# =============================================================================
# Twelve items on jload(), jsave() and the load narrative, and two defects
# found on the same surface. Six parts, each lettered within N86:
#   A  the front doors: a file name typed without quotes; a data frame (a
#      shipped dataset's name, any other frame); an expression that came
#      out empty (a variable, system.file()); jsave() given a file name
#      alone with no default; 'z' is not a data frame; a name starting with
#      a digit (jload(), with name =, jcopy()); .RData "can contain".
#   B  a path typed with single backslashes, in jload(), jsave() and
#      joptions(data.dir = ): stopped, the path written with forward
#      slashes where every character R made maps back (S343, Jeff's
#      decision); what is NOT caught; the offered path loads the file.
#   C  a CSV file of one column keeps its empty lines (the S345 item):
#      every case saved is loaded; two columns unchanged.
#   D  ruling R13: jsave() notes a text variable's missing cells that
#      .sav, .dta, .xpt and .csv save as blank text (.xpt and a factor in
#      a CSV file on Jeff's lean, S351); none for .rds, .xlsx or a number.
#   E  a frame holding a text variable with declared missing values (the
#      S340 item): the .dta refusal, the .sav over-limit refusal, the load
#      narrative's Cases 4, 6 and 7 offer what runs, and every offered
#      line is RUN; the CSV note's rider; jconvert()'s label report leaves
#      a text variable out under to = "stata" or "sas".
#   F  the load narrative's layout: Case 7's count past three names (the
#      S294 item); ruling R6, a blank line between jload()'s "Loaded"
#      line and a note on either side.
# Fixtures that read value labels carry a labelled INTEGER variable beside
# the double one (the S350 lesson). The section works in a scratch folder of
# its own and puts the working directory, the data folder, the convention,
# the output level and the default frame back at its foot. Calls that load
# run inside local(), so what they load stays out of the workspace.
.wd86 <- getwd()
.td86 <- file.path(tempdir(), "jstats n86")
unlink(.td86, recursive = TRUE); dir.create(.td86); setwd(.td86)
.entry_dd86  <- getOption(".jst_options_data_dir")
.entry_def86 <- getOption(".jst_default_data")
# The section's loads print the narrative, which records
# .jst_missing_notice_shown; it is handed back at the foot (the S340 rule:
# a flag a section sets is handed back by that section; the S351 dirty run).
.entry_shown86 <- getOption(".jst_missing_notice_shown")
options(.jst_options_data_dir = NULL)
.conv86 <- function(cv, expr) {
  old <- getOption(".jst_options_missing_convention")
  options(.jst_options_missing_convention = cv)
  on.exit(options(.jst_options_missing_convention = old), add = TRUE)
  force(expr)
}
.lvl86 <- function(lv, expr) {
  old <- getOption(".jst_output_level")
  options(.jst_output_level = lv)
  on.exit(options(.jst_output_level = old), add = TRUE)
  force(expr)
}
.def86 <- function(nm, expr) {
  old <- getOption(".jst_default_data")
  options(.jst_default_data = nm)
  on.exit(options(.jst_default_data = old), add = TRUE)
  force(expr)
}
# .last86(): the message's last indented line, trimmed -- the line it offers.
.last86 <- function(m) {
  ls <- strsplit(m, "\n", fixed = TRUE)[[1]]
  trimws(utils::tail(ls[startsWith(ls, "  ")], 1L))
}
# .ends86(): does the message end with this text, exactly?
.ends86 <- function(m, tail) endsWith(m, tail)
# .pd86(): the alternative every refusal has ended on since v0.9.234 (N94):
# the save that makes every declared missing value plain NA, the file as
# typed, relative to the working directory.
.pd86 <- function(nm, file) {
  paste0("\nOr save every declared missing value as plain NA instead:\n",
         "  jsave(", nm, ", \"", file, "\", preserve.declarations = FALSE)")
}
# .cut86(): the message before that alternative, so the lines run are the
# conversion route alone -- the two are alternatives, not one sequence.
.cut86 <- function(m) {
  i <- regexpr("\nOr save every declared missing value as plain NA", m, fixed = TRUE)
  if (i < 0L) m else substring(m, 1L, i - 1L)
}
# .after86(): the message after the first occurrence of a marker line.
.after86 <- function(m, marker) {
  i <- regexpr(marker, m, fixed = TRUE)
  if (i < 0L) "" else substring(m, i + nchar(marker))
}
# .run86(): run the indented CALLS a message offers (lines of call shape;
# a variable list such as "  S, A, L" is not one), in order, on a copy of
# the frame under the name the message uses; the frame afterwards, or NULL
# if there is no call or one errors. .run_lines67() runs every indented
# line, which a refusal's variable list would break.
.run86 <- function(msg, nm, frame) {
  tryCatch({
    ls <- strsplit(msg, "\n", fixed = TRUE)[[1]]
    run <- trimws(ls[grepl("^  [A-Za-z.][A-Za-z0-9._]*\\(", ls)])
    if (length(run) == 0L) return(NULL)
    e <- new.env(parent = globalenv())
    assign(nm, frame, envir = e)
    suppressMessages(utils::capture.output(
      for (ln in run) eval(parse(text = ln), envir = e)))
    get(nm, envir = e)
  }, error = function(err) NULL)
}

# --- A: the front doors --------------------------------------------------------
writeLines(c("x", "1", "2"), "zz86.csv")
m86a <- grab(jload(zz86.csv))
check("N86a jload() given a file name without its quotes: the name as the subject, and the call with quotes, which runs",
      identical(m86a, paste0("jload(): zz86.csv is not in quotes.\n",
                             "A file name goes in quotes:\n",
                             "  jload(\"zz86.csv\")")) &&
        local({ invisible(grab(eval(parse(text = .last86(m86a)))))
                exists("zz86", inherits = FALSE) && nrow(zz86) == 2L }))
m86b <- grab(jload(community))
check("N86b ... a shipped dataset's name without quotes: the call with them, which loads it",
      identical(m86b, paste0("jload(): the name of the community dataset goes in quotes:\n",
                             "  jload(\"community\")")) &&
        local({ invisible(grab(eval(parse(text = .last86(m86b)))))
                exists("community", inherits = FALSE) &&
                  nrow(community) == 103L }))
d86 <- data.frame(a = 1:3)
m86c <- grab(jload(d86))
check("N86c ... a data frame of the workspace: already loaded, and the jsave() call, which writes it",
      identical(m86c, paste0("jload(): the d86 data frame is already loaded.\n",
                             "To save it to a file:\n",
                             "  jsave(d86, \"d86.rds\")")) &&
        local({ invisible(grab(eval(parse(text = .last86(m86c)))))
                file.exists("d86.rds") }))
p86 <- ""
check("N86d ... a variable holding an empty string: the variable as the subject",
      identical(grab(jload(p86)), "jload(): p86 is \"\", an empty file name."))
m86e <- grab(jload(system.file("extdata", "zz86.csv", package = "jstats")))
check("N86e ... system.file() finding no file: the call as the subject, and what system.file() gives",
      identical(.fl(m86e), .fl(paste0(
        "jload(): system.file(\"extdata\", \"zz86.csv\", package = \"jstats\") ",
        "is \"\", an empty file name.\n",
        "system.file() gives \"\" when the file is not in the package."))) &&
        .ends86(m86e, "\nsystem.file() gives \"\" when the file is not in the package."))
check("N86f an empty string typed as such keeps the generic stop (re-pinned S369, v0.9.241: the example on a line of its own, Rules E and L)",
      identical(grab(jload("")), "jload(): Provide a filename, for example:\n  jload(\"mydata.sav\")"))
m86g <- .def86(NULL, grab(jsave("t86.rds")))
check("N86g jsave() given a file name alone, with no default set: the file named, both routes offered -- the data frame named first, or a default set -- and nothing written (re-pinned S367, v0.9.239: it had offered the first route alone; MyData in both here, where the workspace holds many data frames; the one-frame case is import_check.R U08)",
      identical(.fl(m86g), .fl(paste0(
        "jsave(): \"t86.rds\" is a file name, and no data frame was given to save.\n",
        "Name the data frame first:\n",
        "  jsave(MyData, \"t86.rds\")\n",
        "Or set a default first, then run the call:\n",
        "  juse(MyData)\n",
        "  jsave(\"t86.rds\")"))) &&
        .ends86(m86g, "\nOr set a default first, then run the call:\n  juse(MyData)\n  jsave(\"t86.rds\")") &&
        !grepl("variable name", m86g) && !file.exists("t86.rds"))
check("N86h ... with a default set, the same call saves the default, as before",
      local({ invisible(.def86("d86", grab(jsave("t86.rds")))); file.exists("t86.rds") }))
z86 <- 1:3
m86i <- grab(jsave(z86, "x86.rds"))
check("N86i jsave() given a vector: 'z86' is not a data frame, with no article and no class, and the example on a line of its own (re-pinned S368, v0.9.240: the example sat after \"e.g.\" on the line of the sentence before it; MyData here, where the workspace holds many data frames; the one-frame case is import_check.R V03)",
      identical(m86i, paste0("jsave(): 'z86' is not a data frame.\n",
                             "Provide a data frame, for example:\n",
                             "  jsave(MyData, \"mydata.sav\")")) &&
        !grepl("integer", m86i))
writeLines(c("x", "1"), "2024zz86.csv")
m86j <- grab(jload("2024zz86.csv"))
check("N86j a file name starting with a digit: the rule stated of a data frame's name, and the offered call runs (re-pinned S366, v0.9.238: it offers the cleaner's name, X2024zz86, where it had stripped the digits to zz86)",
      grepl("R does not allow a data frame's name to start with a digit.",
            .fl(m86j), fixed = TRUE) &&
        !grepl("variable", m86j) &&
        identical(.last86(m86j), "jload(\"2024zz86.csv\", name = \"X2024zz86\")") &&
        local({ invisible(grab(eval(parse(text = .last86(m86j)))))
                exists("X2024zz86", inherits = FALSE) }))
check("N86k ... a name given with name = is the name the message names, not the file",
      startsWith(.fl(grab(jload("zz86.csv", name = "2b"))),
                 "jload(): The name '2b' starts with a number. R does not allow a data frame's"))
check("N86l jcopy() to a name starting with a digit says the same of a data frame's name",
      grepl("R does not allow a data frame's name to start with a digit.",
            .fl(grab(jcopy(d86, 2))), fixed = TRUE))
# Re-pinned S357 (the S219 item's finding 6): the typed-extension redirect
# takes the bare-name redirect's voice -- the fact, then the base R line on
# its own -- and says nothing of how many objects the file holds.
# S374 (v0.9.247; the S371 item): the file is looked for first, as for
# every other format. N86m now makes x86.RData before asking for it; a
# file that does not exist gets the file-not-found stop (it was offered a
# load() line that failed with "cannot open the connection"); one found in
# the data.dir folder is named by its path there; the line runs.
save(d86, file = "x86.RData")
check("N86m an .RData file name: the bare-name redirect's voice, the base R line on its own",
      identical(grab(jload("x86.RData")),
                paste0("jload(): x86.RData is an .RData file, which jstats does not load.\n",
                       "Load it with base R:\n",
                       "  load(\"x86.RData\")")))
check("N86m2 ... an .RData file that does not exist: the file-not-found stop, bare and with a folder, no load() line (S374); the line for one that exists runs",
      local({ a <- grab(jload("nofile86.RData")); b <- grab(jload("sub86/nofile86.rda"))
              e <- new.env(parent = globalenv())
              ln <- sub("^  ", "", tail(strsplit(grab(jload("x86.RData")), "\n", fixed = TRUE)[[1]], 1L))
              ran <- !inherits(tryCatch(eval(parse(text = ln)[[1L]], e), error = function(err) err), "error")
              startsWith(a, "jload(): File 'nofile86.RData' not found.\nSearched in: working directory") &&
                # The path as the stop normalizes it: relative here, absolute on
                # Windows, where normalizePath() completes a missing file's path
                # and the long path wraps onto a line of its own after "found:"
                # (the workstation's first two runs of this check, S374).
                startsWith(.fl(b), "jload(): File not found: ") && endsWith(.fl(b), "sub86/nofile86.rda") &&
                !grepl("  load(", paste(a, b), fixed = TRUE) && ran && exists("d86", envir = e, inherits = FALSE) }))
check("N86m3 ... one found in the data.dir folder: the line names its path there, and runs from the working directory",
      local({ dd <- "dd86"; dir.create(dd, showWarnings = FALSE)   # relative: a temp path's length would make the line wrap (N88s)
              save(d86, file = file.path(dd, "y86.RData"))
              old <- getOption(".jst_options_data_dir")
              options(.jst_options_data_dir = dd)
              on.exit(options(.jst_options_data_dir = old), add = TRUE)
              m <- grab(jload("y86.RData"))
              ln <- sub("^  ", "", tail(strsplit(m, "\n", fixed = TRUE)[[1]], 1L))
              e <- new.env(parent = globalenv())
              ran <- !inherits(tryCatch(eval(parse(text = ln)[[1L]], e), error = function(err) err), "error")
              identical(ln, "load(\"dd86/y86.RData\")") &&
                ran && exists("d86", envir = e, inherits = FALSE) }))

# --- B: a path typed with single backslashes ------------------------------------
m86n <- grab(jload("V:\temp\new.csv"))
check("N86n jload(): the path as R holds it, what each backslash made, and the path with forward slashes",
      identical(.fl(m86n), .fl(paste0(
        "jload(): R read the single backslashes in \"V:\\temp\\new.csv\" as ",
        "special characters (\\t as a tab, \\n as a new line).\n",
        "Write the path with forward slashes:\n",
        "  \"V:/temp/new.csv\""))) &&
        .ends86(m86n, "\nWrite the path with forward slashes:\n  \"V:/temp/new.csv\""))
m86o <- grab(jsave(d86, "V:\temp\new.csv"))
check("N86o jsave(): the same stop, before anything is written",
      .ends86(m86o, "\nWrite the path with forward slashes:\n  \"V:/temp/new.csv\"") &&
        startsWith(m86o, "jsave(): R read the single backslashes in ") &&
        length(list.files(all.files = TRUE, pattern = "emp")) == 0L)
m86p <- grab(joptions(data.dir = "Proj\temp"))
check("N86p joptions(data.dir = ): one backslash in the singular, the folder with forward slashes, nothing set or made",
      identical(.fl(m86p), .fl(paste0(
        "joptions(): R read the single backslash in \"Proj\\temp\" as a ",
        "special character (\\t as a tab).\n",
        "Write the folder with forward slashes:\n",
        "  \"Proj/temp\""))) &&
        is.null(getOption(".jst_options_data_dir")) &&
        length(list.files(pattern = "^Proj")) == 0L)
m86q <- grab(jload("C:\1data.csv"))
check("N86q a character no letter maps back to: the path as R holds it, and the instruction alone",
      identical(.fl(m86q), .fl(paste0(
        "jload(): R read a single backslash in \"C:\\001data.csv\" as a ",
        "special character.\n",
        "Type the path again with forward slashes in place of the backslashes."))) &&
        !grepl("\n  ", m86q, fixed = TRUE))
check("N86r spaces, a UNC path and doubled backslashes are not caught: each reaches the file search",
      all(vapply(c("C:/a b/zz86.csv", "\\\\server\\share\\zz86.csv",
                   "C:\\temp\\zz86.csv"), function(p) {
        m <- grab(jload(p))
        grepl("not found", m, fixed = TRUE) && !grepl("special character", m)
      }, logical(1))))
dir.create("zz"); writeLines(c("x", "1"), file.path("zz", "temp86.csv"))
m86s <- grab(jload("zz\temp86.csv"))
check("N86s ... the path it offers is the file meant: read from the message, it loads",
      local({ p <- eval(parse(text = .last86(m86s)))
              invisible(grab(jload(p, name = "zt86")))
              identical(p, "zz/temp86.csv") && exists("zt86", inherits = FALSE) }))
check("N86t .jst_check_path_chars(): a backspace, a form feed and a carriage return map back too; a clean path passes",
      local({ m <- grab(jstats:::.jst_check_path_chars("a\bc\fd\re"))
        .ends86(m, "\n  \"a/bc/fd/re\"") &&
          grepl("(\\b as a backspace, \\f as a form feed, \\r as a carriage return)",
                .fl(m), fixed = TRUE) &&
          is.null(jstats:::.jst_check_path_chars("C:/Data/Wave 1/x.sav")) }))

check("N86bf ... a doubled backslash in the same path becomes a slash too; DEL is caught, with the instruction alone",
      local({ m1 <- grab(jstats:::.jst_check_path_chars("C:\\data\temp.csv"))
        m2 <- grab(jstats:::.jst_check_path_chars("a\177b"))
        .ends86(m1, "\n  \"C:/data/temp.csv\"") &&
          grepl("(\\t as a tab)", m1, fixed = TRUE) &&
          grepl("Type the path again with forward slashes", .fl(m2), fixed = TRUE) }))
check("N86bg jload() given a data frame as an expression: the expression named, and the generic line (re-pinned S369: the example on a line of its own)",
      identical(.fl(grab(jload(d86[1:2, , drop = FALSE]))),
                .fl(paste0("jload(): d86[1:2, , drop = FALSE] is a data frame, not a file name.\n",
                           "Provide a filename, for example:\n",
                           "  jload(\"mydata.sav\")"))) &&
        endsWith(grab(jload(d86[1:2, , drop = FALSE])),
                 "\nProvide a filename, for example:\n  jload(\"mydata.sav\")"))

# --- C: a CSV file of one column ------------------------------------------------
v86 <- data.frame(Source = c("web", "phone", NA, "web", "mail", NA, "web", "phone"))
n86 <- data.frame(x = c(1, NA, 3, NA))
writeLines(c("a,b", "1,2", "", "3,4"), "two86.csv")
writeLines(c("x", "a", ""), "last86.csv")
writeLines(c("\"a,b\"", "1", "", "2"), "q86.csv")
check("N86u a CSV file of one text column: every case saved is loaded, its missing cells back as blank text",
      local({ invisible(grab(jsave(v86, "v86.csv")))
              invisible(grab(jload("v86.csv", name = "b86")))
              nrow(b86) == 8L &&
                identical(b86$Source, c("web", "phone", "", "web", "mail", "",
                                        "web", "phone")) }))
check("N86v ... one numeric column: every case, the missing ones NA",
      local({ invisible(grab(jsave(n86, "n86.csv")))
              invisible(grab(jload("n86.csv", name = "b86")))
              identical(b86$x, c(1L, NA, 3L, NA)) }))
check("N86w ... the last case missing is kept; a quoted name holding a comma is one column (since S362 named a_b, its header the label); two columns still drop an empty line",
      local({ invisible(grab(jload("last86.csv", name = "l86")))
              invisible(grab(jload("q86.csv", name = "q86")))
              invisible(grab(jload("two86.csv", name = "t86")))
              identical(l86$x, c("a", "")) &&
                identical(names(q86), "a_b") &&
                identical(attr(q86[[1]], "label"), "a,b") &&
                identical(as.vector(q86[[1]]), c(1L, NA, 2L)) &&
                nrow(t86) == 2L }))

# --- D: ruling R13, a text variable's missing cells ---------------------------
tx86 <- data.frame(
  S = c("a", NA, "b", NA),
  L = haven::labelled(c(1L, 2L, NA, 1L), labels = c(Low = 1L, High = 2L)),
  D = haven::labelled(c(1, NA, 2, 2), labels = c(Low = 1, High = 2)),
  stringsAsFactors = FALSE)
.note86 <- function(fmt, kind = "a text variable") {
  paste0("Note: ", fmt, " cannot store a missing value in ", kind, ".\n",
         "2 missing cells in S were saved as blank text.\n",
         "R format (.rds) and Excel format (.xlsx) keep them missing.")
}
.save86 <- function(fr, file) grab(jsave(fr, file, overwrite = TRUE))
m86x <- .save86(tx86, "tx86.sav")
check("N86x .sav: the note -- the format, the cells, the two formats that keep them -- ahead of the Saved line",
      startsWith(m86x, paste0(.note86("SPSS format (.sav)"), "\nSaved fr to")))
check("N86y ... .dta and .xpt say the same of their format",
      grepl(.fl(.note86("Stata format (.dta)")), .fl(.save86(tx86, "tx86.dta")), fixed = TRUE) &&
        grepl(.fl(.note86("SAS interchange format (.xpt)")), .fl(.save86(tx86, "tx86.xpt")),
              fixed = TRUE))
m86z <- .save86(tx86, "tx86.csv")
check("N86z ... .csv: after the label note, a blank line between them",
      grepl(paste0("value labels.\n\n", .note86("CSV format (.csv)"), "\nSaved"),
            m86z, fixed = TRUE))
check("N86aa ... none for .rds or .xlsx, which keep them, nor for a missing number",
      !grepl("blank text", .save86(tx86, "tx86.rds"), fixed = TRUE) &&
        !grepl("blank text", .save86(tx86, "tx86.xlsx"), fixed = TRUE) &&
        !grepl("blank text", .save86(tx86[, c("L", "D")], "num86.sav"), fixed = TRUE))
check("N86ab ... the count is the round trip's: the blanks read back from the .sav file",
      local({ invisible(grab(jload("tx86.sav", name = "r86")))
              identical(sum(r86$S == ""), 2L) && !anyNA(r86$S) &&
                identical(sum(is.na(r86$L)), 1L) }))
fc86 <- data.frame(G = factor(c("a", NA, "b")), S = c(NA, "x", NA),
                   stringsAsFactors = FALSE)
m86ac <- .save86(fc86, "fc86.csv")
check("N86ac ... a factor in a CSV file: \"text or categorical\", each variable with its count",
      grepl(paste0("Note: CSV format (.csv) cannot store a missing value in a text or ",
                   "categorical variable. 3 missing cells in G (1) and S (2) were saved ",
                   "as blank text. R format (.rds) and Excel format (.xlsx) keep them missing."),
            .fl(m86ac), fixed = TRUE))
check("N86ad ... the same frame to .sav: the factor keeps its NA, so only S is named",
      grepl("2 missing cells in S were saved as blank text.",
            .save86(fc86, "fc86.sav"), fixed = TRUE))
check("N86ae ... one cell: the singular, and \"keep it missing\"",
      grepl(paste0("1 missing cell in S was saved as blank text.\n",
                   "R format (.rds) and Excel format (.xlsx) keep it missing."),
            .save86(data.frame(S = c("a", NA)), "one86.sav"), fixed = TRUE))
dsn86 <- data.frame(S = haven::labelled_spss(c("a", "X", NA, "b"),
                                             labels = c(Refused = "X"),
                                             na_values = "X"))
check("N86af ... a declared string: its NA is counted, its declared code is not (.sav keeps it)",
      grepl("1 missing cell in S was saved as blank text.",
            .save86(dsn86, "dsn86.sav"), fixed = TRUE))
check("N86ag ... and with preserve.declarations = FALSE to CSV, the declared code blanked is counted too",
      grepl("2 missing cells in S were saved as blank text.",
            grab(jsave(dsn86, "dsn86.csv", overwrite = TRUE,
                       preserve.declarations = FALSE)), fixed = TRUE))

# --- E: a frame holding a text variable with declared missing values ----------
ds86 <- data.frame(
  S = haven::labelled_spss(c("web", "phone", "X", "web", "Y", "mail"),
                           labels = c(Refused = "X", DK = "Y"),
                           na_values = c("X", "Y")),
  A = haven::labelled_spss(c(1, 2, -99, 3, -98, 1),
                           labels = c(Refused = -99, DK = -98),
                           na_values = c(-99, -98)),
  L = haven::labelled_spss(c(1L, 2L, -99L, 3L, 2L, 1L),
                           labels = c(Low = 1L, Refused = -99L),
                           na_values = -99L))
.route86 <- function(nm, to = "stata") {
  paste0("  jconvert(", nm, ", vars = \"S\", to = \"baseR\", modify = TRUE)\n",
         "  jconvert(", nm, ", to = \"", to, "\", modify = TRUE)\n",
         "S is text, so the first line makes its declared values plain NA.")
}
# .runsave86(): run every indented line the message offers on a copy of the
# frame under the name the message uses (.run_lines67()), then save the
# result as the format the message was about.
.runsave86 <- function(msg, nm, frame, file) {
  r <- .run86(msg, nm, frame)
  if (is.null(r)) return(FALSE)
  e <- new.env(); assign(nm, r, envir = e)
  invisible(grab(eval(parse(text = paste0("jsave(", nm, ", \"", file,
                                          "\", overwrite = TRUE)")), envir = e)))
  file.exists(file)
}
m86ah <- grab(jsave(ds86, "ds86.dta"))
check("N86ah the .dta refusal on a frame holding a declared string: the text variable made plain NA, then the rest, and jencode() for the other way",
      .ends86(m86ah, paste0("\n\nBefore saving to Stata format, run both:\n",
                            .route86("ds86"), "\n",
                            "Or turn it into a numeric variable first with jencode().",
                            .pd86("ds86", "ds86.dta"))) &&
        startsWith(m86ah, "jsave(): 3 variables carry SPSS-style missing values,"))
check("N86ai ... its two lines run, and the frame then saves as .dta (the integer variable converted too)",
      local({ r <- .run86(.cut86(m86ah), "ds86", ds86)
              !is.null(r) && identical(haven::na_tag(r$A), c(NA, NA, "a", NA, "b", NA)) &&
                identical(haven::na_tag(r$L), c(NA, NA, "a", NA, NA, NA)) &&
                is.null(attr(r$S, "na_values")) && sum(is.na(r$S)) == 2L &&
                .runsave86(m86ah, "ds86", ds86, "ds86.dta") }))
m86aj <- .lvl86("minimal", grab(jsave(ds86, "ds86min.dta")))
check("N86aj ... the minimal tier: the same two lines and the sentence, no jencode() line",
      .ends86(m86aj, paste0("the .dta format.\n",
                            "Convert first, then save again:\n", .route86("ds86"),
                            .pd86("ds86", "ds86min.dta"))) &&
        !grepl("jencode", m86aj, fixed = TRUE))
ds1_86 <- ds86["S"]
m86ak <- grab(jsave(ds1_86, "ds1_86.dta"))
check("N86ak ... the text variable the only one declared: one line, \"run:\", \"this makes\", and the frame then saves",
      .ends86(m86ak, paste0("\n\nBefore saving to Stata format, run:\n",
                            "  jconvert(ds1_86, vars = \"S\", to = \"baseR\", modify = TRUE)\n",
                            "S is text, so this makes its declared values plain NA.\n",
                            "Or turn it into a numeric variable first with jencode().",
                            .pd86("ds1_86", "ds1_86.dta"))) &&
        .runsave86(.cut86(m86ak), "ds1_86", ds1_86, "ds1_86.dta"))
ds2_86 <- ds86; ds2_86$T <- ds86$S
m86al <- grab(jsave(ds2_86, "ds2_86.dta"))
check("N86al ... two text variables: vars = c(), \"S and T are text\", \"their\", \"Or turn each\", and the frame then saves",
      grepl("vars = c(\"S\", \"T\"), to = \"baseR\", modify = TRUE)\n", m86al, fixed = TRUE) &&
        grepl("\nS and T are text, so the first line makes their declared values plain NA.\n",
              m86al, fixed = TRUE) &&
        .ends86(m86al, paste0("\nOr turn each into a numeric variable first with jencode().",
                              .pd86("ds2_86", "ds2_86.dta"))) &&
        .runsave86(.cut86(m86al), "ds2_86", ds2_86, "ds2_86.dta"))
oc86 <- data.frame(S = ds86$S,
                   X = haven::labelled_spss(c(1, 2, -99, -98, -97, -96),
                                            labels = c(a = -99, b = -98, c = -97, d = -96),
                                            na_values = c(-99, -98, -97, -96)))
m86am <- grab(jsave(oc86, "oc86.sav"))
m86an <- .lvl86("minimal", grab(jsave(oc86, "oc86.sav")))
check("N86am the .sav over-limit refusal on such a frame: the .rds route and \"reduce\", no Stata route",
      .ends86(m86am, paste0("To save in R format (.rds) instead, keeping all the codes:\n",
                            "  jsave(oc86, \"oc86.rds\")\n",
                            "To save as SPSS format (.sav) with every declared missing value as plain NA:\n",
                            "  jsave(oc86, \"oc86.sav\", preserve.declarations = FALSE)\n",
                            "Or reduce each variable's declared missing values to fit.")) &&
        !grepl("Stata", m86am, fixed = TRUE) &&
        .ends86(m86an, paste0("\nSave as R format (.rds) to keep all the codes, or reduce them first.",
                              .pd86("oc86", "oc86.sav"))))
ocx86 <- oc86["X"]
check("N86an ... without a declared string the Stata route is offered, as before",
      grepl("To convert to Stata and save as Stata format (.dta), also keeping all the codes:",
            .fl(grab(jsave(ocx86, "ocx86.sav"))), fixed = TRUE))
saveRDS(ds86, "ds86.rds")
m86ao <- .conv86("stata", grab(jload("ds86.rds", overwrite = TRUE, name = "ld86", missing.notice = TRUE)))
check("N86ao the load narrative, Case 4 under \"stata\": the setting's route made of the two lines, and the sentence",
      .ends86(m86ao, paste0("To use SPSS-style missing values, run:\n",
                            "  joptions(missing.convention = \"spss\")\n",
                            "To use Stata-style missing values, run both:\n",
                            .route86("ld86"), "\n")))
check("N86ap ... its lines run",
      local({ r <- .run86(.after86(m86ao, "To use Stata-style missing values, run both:\n"),
                          "ld86", ds86)
              !is.null(r) && is.null(attr(r$S, "na_values")) &&
                identical(haven::na_tag(r$A), c(NA, NA, "a", NA, "b", NA)) }))
m86aq <- .conv86("sas", grab(jload("ds86.rds", overwrite = TRUE, name = "ld86", missing.notice = TRUE)))
check("N86aq ... under \"sas\" the same route to SAS-style",
      .ends86(m86aq, paste0("To use SAS-style missing values, run both:\n",
                            .route86("ld86", "sas"), "\n")))
mx86 <- data.frame(S = ds86$S, A = ds86$A,
                   M = haven::labelled(c(3, 4, haven::tagged_na("a"), 1, 2, 3),
                                       labels = c(Refused = haven::tagged_na("a"))))
saveRDS(mx86, "mx86.rds")
m86ar <- .conv86("spss", grab(jload("mx86.rds", overwrite = TRUE, name = "lm86", missing.notice = TRUE)))
check("N86ar Case 7 under \"spss\": the off-setting Stata route runs all three, the sentence after them",
      .ends86(m86ar, paste0("To use Stata-style missing values throughout, run all three:\n",
                            "  jconvert(lm86, vars = \"S\", to = \"baseR\", modify = TRUE)\n",
                            "  jconvert(lm86, to = \"stata\", modify = TRUE)\n",
                            "  joptions(missing.convention = \"stata\")\n",
                            "S is text, so the first line makes its declared values plain NA.\n")))
m86as <- .conv86("none", grab(jload("mx86.rds", overwrite = TRUE, name = "lm86", missing.notice = TRUE)))
check("N86as Case 6: the SPSS route unchanged, the Stata route of three lines; the three lines run",
      grepl(paste0("To use SPSS-style throughout, run both:\n",
                   "  jconvert(lm86, to = \"spss\", modify = TRUE)\n",
                   "  joptions(missing.convention = \"spss\")\n",
                   "To use Stata-style throughout, run all three:\n"), m86as, fixed = TRUE) &&
        .conv86("none", local({
          r <- .run86(.after86(m86as, "To use Stata-style throughout, run all three:\n"),
                      "lm86", mx86)
          !is.null(r) && identical(getOption(".jst_options_missing_convention"), "stata") &&
            is.null(attr(r$S, "na_values")) &&
            identical(haven::na_tag(r$A), c(NA, NA, "a", NA, "b", NA)) })))
m2_86 <- data.frame(S = ds86$S, M = mx86$M)
saveRDS(m2_86, "m2_86.rds")
m86at <- .conv86("none", grab(jload("m2_86.rds", overwrite = TRUE, name = "lm2", missing.notice = TRUE)))
check("N86at ... nothing left for a second conversion: one jconvert() line and the rider, \"the first line\" still",
      .ends86(m86at, paste0("To use Stata-style throughout, run both:\n",
                            "  jconvert(lm2, vars = \"S\", to = \"baseR\", modify = TRUE)\n",
                            "  joptions(missing.convention = \"stata\")\n",
                            "S is text, so the first line makes its declared values plain NA.\n")))
m86au <- .conv86(NULL, grab(jload("ds86.rds", overwrite = TRUE, name = "ld86", missing.notice = TRUE)))
check("N86au Case 1 is as v0.9.214 made it: to = \"baseR\" for the frame, no sentence",
      .ends86(m86au, paste0("To make them missing in base R as well, convert:\n",
                            "  jconvert(ld86, to = \"baseR\", modify = TRUE)\n")))
m86av <- grab(jsave(ds86, "ds86.csv"))
check("N86av the CSV note's rider: over a declared string, \"ordinary values\", the strings named in quotes (S359: the variables and codes named, where it said \"Any SPSS-style missing values\")",
      grepl(paste0("The declared missing values of S (\"X\" and \"Y\"), A (-99 and -98), and L (-99) ",
                   "are written as ordinary values and will read back as valid data."), .fl(m86av), fixed = TRUE) &&
        !grepl("literal numbers", m86av, fixed = TRUE))
check("N86aw ... with a Stata-style variable beside it, \"ordinary values\" too; a numeric frame says \"ordinary numbers\", the codes named",
      grepl("written as ordinary values and", .fl(grab(jsave(mx86, "mx86.csv"))), fixed = TRUE) &&
        grepl("A's declared missing values -99 and -98 are written as ordinary numbers and will read back as valid data.",
              .fl(grab(jsave(ds86["A"], "a86.csv"))), fixed = TRUE))
check("N86ax jconvert(to = \"stata\") after the first line: no label report on the text variable (it was one before)",
      local({ ld86 <- ds86
              invisible(grab(jconvert(ld86, vars = "S", to = "baseR", modify = TRUE)))
              m <- grab(jconvert(ld86, to = "stata", modify = TRUE))
              !grepl("Skipped (value labels suggest", m, fixed = TRUE) &&
                grepl("Converted to Stata-style missing values in 2 variables:", m,
                      fixed = TRUE) }))
# S372 (Fix Slate 20; the S371 remedy-line audit): reversed. Its line,
# jdeclare_missing(ld86, S, codes = X, ...), stopped -- R's "object 'X' not
# found", or quoted "Invalid code 'X'": jdeclare_missing() declares on
# numeric variables only -- so the S351 rule above now holds under every
# target (N95e).
check("N86ay ... and under to = \"spss\": no label report on the text variable, and no line naming it",
      local({ ld86 <- ds86
              invisible(grab(jconvert(ld86, vars = "S", to = "baseR", modify = TRUE)))
              m <- grab(jconvert(ld86, to = "spss", vars = "S"))
              !grepl("S: X", m, fixed = TRUE) && !grepl("codes = X", m, fixed = TRUE) }))

# --- F: the narrative's layout --------------------------------------------------
w86 <- data.frame(A = ds86$A)
for (i in 1:4) w86[[paste0("V", i)]] <- mx86$M
saveRDS(w86, "w86.rds"); saveRDS(w86[1:4], "w3_86.rds")
check("N86az Case 7 past three off-setting variables: a count, not the names",
      grepl(paste0("Note: 4 variables are Stata-style, but your missing.convention ",
                   "setting is \"spss\"."),
            .fl(.conv86("spss", grab(jload("w86.rds", overwrite = TRUE, name = "lw86")))), fixed = TRUE))
check("N86ba ... three or fewer: the names, as before",
      grepl("Note: V1, V2, and V3 are Stata-style, but your missing.convention",
            .fl(.conv86("spss", grab(jload("w3_86.rds", overwrite = TRUE, name = "lw86")))), fixed = TRUE))
check("N86bb ruling R6: a blank line between the Loaded line and the narrative under it",
      grepl("^Loaded ld86 \\(R format; 6 cases, 3 variables\\)\n\n3 variables have SPSS-style",
            m86au))
check("N86bc ... and between notes above it and the Loaded line; the notes keep their own blank line",
      local({ m <- grab(jload("ds86.rds", name = "ld86", use = TRUE, missing.notice = FALSE))
              identical(m, paste0("Default data frame set to: ld86\n", "\n",
                                  "Loaded ld86 (R format; 6 cases, 3 variables)\n")) }))
check("N86bd ... the Loaded line alone has no blank line after it; quiet = TRUE prints nothing",
      identical(grab(jload("ds86.rds", name = "ld86", overwrite = TRUE,
                           missing.notice = FALSE)),
                "Loaded ld86 (R format; 6 cases, 3 variables)\n") &&
        identical(grab(jload("ds86.rds", name = "ld86", overwrite = TRUE,
                           quiet = TRUE)), ""))
check("N86be ... the shipped dataset's Loaded line takes the same blank line",
      grepl("^Loaded the jstats example dataset 'community'\n\n5 variables have",
            .conv86(NULL, grab(jload("community", name = "lc86", package = TRUE,
                                     overwrite = TRUE, missing.notice = TRUE)))))

setwd(.wd86)
unlink(.td86, recursive = TRUE)
options(.jst_options_data_dir = .entry_dd86, .jst_default_data = .entry_def86,
        .jst_missing_notice_shown = .entry_shown86)
rm(list = intersect(c("m86a", "m86b", "m86c", "m86e", "m86g", "m86i", "m86j",
                      "m86n", "m86o", "m86p", "m86q", "m86s", "m86x", "m86z",
                      "m86ac", "m86ah", "m86aj", "m86ak", "m86al", "m86am",
                      "m86an", "m86ao", "m86aq", "m86ar", "m86as", "m86at",
                      "m86au", "m86av", "d86", "p86", "z86", "v86", "n86",
                      "tx86", "fc86", "dsn86", "ds86", "ds1_86", "ds2_86",
                      "oc86", "ocx86", "mx86", "m2_86", "w86", "ld86", "lm86", "lm2",
                      "lw86", "lc86", "zt86", "zz86",
                      ".wd86", ".td86", ".entry_dd86", ".entry_def86", ".entry_shown86", ".conv86",
                      ".lvl86", ".def86", ".last86", ".ends86", ".note86", ".save86",
                      ".route86", ".runsave86", ".after86", ".run86", "i", "r86", "b86",
                      "l86", "q86", "t86"),
                    ls(all.names = TRUE)))

# =============================================================================
# N87 -- FIX SLATE 9, FIRST HALF (S352, v0.9.225)
# =============================================================================
# The slate's message items, ruling R5 (the layout of a long printed call)
# left to the second half. Eight parts, each lettered within N87:
#   A  ruling R8, part 1: under stata or sas the word missing on a variable
#      that already carries its marker is SAID, as D4 says it under spss,
#      with the line that keeps the two apart; silent with no such marker
#      (the S239 texture) and with the marker's own label.
#   B  ruling R8, part 2: a label for missing that differs from the one the
#      marker or code already has is REFUSED under all three conventions,
#      with the two lines (kept apart; merged on purpose), each RUN.
#   C  ruling R8's offered declarations: jrecode()'s D1 note on a variable
#      of Stata or SAS form, jdeclare_missing()'s refusal under no setting
#      and under spss, and the load scan's lines, each RUN (jencode() and
#      jlogistic() in their own batteries); ruling R15's menu ahead of the
#      load scan's line.
#   D  the NA rule's "Declare -98" (the S345 item): the pair naming every
#      code the recoded variable declares, and on a Stata-form variable
#      carrying .a the NA rule sent to a free marker; both RUN.
#   E  ruling R6, jrecode()'s half: one blank line between notes, none
#      before the first, an advisory counting only where it prints.
#   F  jdeclare_missing(): the refusal on several variables nested under
#      each name, wrapped once; modify = TRUE on a place (and jconvert()'s
#      twin) offering the assignment that runs.
#   G  the five messages that offered a whole-frame jconvert(to = "stata")
#      on a frame holding a text variable with declared missing values (the
#      S351 item), each offered line RUN; controls without one.
#   H  jsave() given an expression as the data (the S351 item): every
#      block of lines opens on "mydata <- ...", and each block RUNS.
# Fixtures that read value labels carry a labelled INTEGER variable beside
# the double one (the S350 lesson). The section puts the convention and the
# output level back at its foot and works in a scratch folder for H.
.conv87 <- function(cv, expr) {
  old <- getOption(".jst_options_missing_convention")
  options(.jst_options_missing_convention = cv)
  on.exit(options(.jst_options_missing_convention = old), add = TRUE)
  force(expr)
}
.lvl87 <- function(lv, expr) {
  old <- getOption(".jst_output_level")
  options(.jst_output_level = lv)
  on.exit(options(.jst_output_level = old), add = TRUE)
  force(expr)
}
# .lines87(): the indented lines of a message with the shape of a call or an
# assignment (a subscripted name included) -- the lines it offers to run --
# trimmed, in order. S353: each a call, in its one-line form; .blocks87()
# gives the same calls as printed, laid out over lines where they are wider
# than the message (ruling R5), and .run87() runs those.
.shape87 <- "^ {2,}[A-Za-z.][A-Za-z0-9._$]*(\\[[^]]*\\])* *(\\(|<- )"
.blocks87 <- function(m) {
  .r5_calls(strsplit(m, "\n", fixed = TRUE)[[1]], shape = .shape87)
}
.lines87 <- function(m) vapply(.blocks87(m), .r5_flat, "", USE.NAMES = FALSE)
# .run87(): run the offered lines numbered k (all by default), in order, in a
# scratch environment holding the frame under its name, under convention cv;
# the environment afterwards, or NULL if a line errors. The convention is
# the one the user would be in when pasting.
# .pdl87(): the jsave() line with preserve.declarations = FALSE a refusal
# offers since v0.9.234 (N94): the file as typed, slashes swapped.
.pdl87 <- function(f) {
  paste0("jsave(mydata, \"", gsub("\\", "/", file.path(.td87, f), fixed = TRUE),
         "\", preserve.declarations = FALSE)")
}
.run87 <- function(m, nm, frame, k = NULL, cv = NULL) {
  ln <- .blocks87(m)
  if (!is.null(k)) ln <- ln[k]
  if (length(ln) == 0L || anyNA(ln)) return(NULL)
  e <- new.env(parent = globalenv())
  assign(nm, frame, envir = e)
  ok <- .conv87(cv, tryCatch({
    suppressMessages(utils::capture.output(
      for (l in ln) eval(parse(text = l), envir = e)))
    TRUE }, error = function(err) FALSE))
  if (isTRUE(ok)) e else NULL
}
.tg87 <- function(x) haven::na_tag(unclass(x))
.lt87 <- function(x) {
  vl <- labelled::val_labels(x)
  if (is.double(vl)) stats::setNames(ifelse(is.na(haven::na_tag(vl)),
                                            as.character(unclass(vl)),
                                            paste0(".", haven::na_tag(vl))),
                                     names(vl))
  else stats::setNames(as.character(vl), names(vl))
}

# The section's loads print the narrative, which records
# .jst_missing_notice_shown; it is handed back at the foot (the S340 rule;
# found by the S352 dirty run, as N86's was at S351).
.entry_shown87 <- getOption(".jst_missing_notice_shown")

# --- A: ruling R8, part 1 -------------------------------------------------------
f87 <- data.frame(
  V = haven::labelled(c(1, 2, 9, 9, haven::tagged_na("a")),
                      labels = c(Skipped = haven::tagged_na("a"))),
  I = haven::labelled(c(1L, 2L, 9L, 9L, 3L), labels = c(Low = 1L)))
m87a <- .conv87("stata", grab(r87a <- jrecode(f87, V, map = "9=missing; else=copy")))
check("N87a stata: the word missing on a variable that carries .a [\"Skipped\"] is said -- the marker, its label, and the line that keeps them apart",
      startsWith(m87a, paste0(
        "Note: .a was used for missing, under Stata convention.\n",
        "V already carries .a [\"Skipped\"], so the recoded cases share that\n",
        "missing value.\n",
        "To keep them apart, give missing a marker V does not use:\n",
        "  f87$VR <- jrecode(f87, V, map = \"9=.b; else=copy\")\n",
        "\nNote: This call changes f87")) &&
        identical(.tg87(r87a), c(NA, NA, "a", "a", "a")) &&
        identical(.lt87(r87a), c(Skipped = ".a")))
check("N87b ... the offered line runs, and keeps the two apart: the 9s on .b, the Skipped case on .a",
      local({ e <- .run87(m87a, "f87", f87, cv = "stata")
        !is.null(e) && identical(.tg87(e$f87$VR), c(NA, NA, "b", "b", "a")) &&
          identical(.lt87(e$f87$VR), c(Skipped = ".a")) }))
F87S <- data.frame(V = haven::labelled(c(1, 2, 9, 9, haven::tagged_na("A")),
                                       labels = c(Skipped = haven::tagged_na("A"))))
m87c <- .conv87("sas", grab(jrecode(F87S, V, map = "9=missing; else=copy")))
check("N87c sas: the same note in the convention's case (.A, .B), and its line runs",
      grepl(paste0("Note: .A was used for missing, under SAS convention. V already ",
                   "carries .A [\"Skipped\"], so the recoded cases share that missing value."),
            .fl(m87c), fixed = TRUE) &&
        grepl("\n  F87S$VR <- jrecode(F87S, V, map = \"9=.B; else=copy\")\n", m87c, fixed = TRUE) &&
        local({ e <- .run87(m87c, "F87S", F87S, cv = "sas")
          !is.null(e) && identical(.tg87(e$F87S$VR), c(NA, NA, "B", "B", "A")) }))
check("N87d silent, as S239 ruled, where the variable carries no .a: a plain variable, and one carrying .b",
      local({ p <- data.frame(V = c(1, 2, 9, 9, 3))
        b <- data.frame(V = haven::labelled(c(1, 2, 9, 9, haven::tagged_na("b")),
                                            labels = c(Skipped = haven::tagged_na("b"))))
        g <- .conv87("stata", c(grab(jrecode(p, V, map = "9=missing; else=copy")),
                                grab(jrecode(b, V, map = "9=missing; else=copy"))))
        !any(grepl("was used for missing", g, fixed = TRUE)) &&
          all(grepl("This call changes", g, fixed = TRUE)) }))
check("N87e silent where labels = names the marker's own label: the merge on purpose, the label unchanged",
      local({ g <- .conv87("stata", grab(r <- jrecode(f87, V, map = "9=missing; else=copy",
                                                      labels = "missing=Skipped")))
        !grepl("was used for missing", g, fixed = TRUE) &&
          identical(.tg87(r), c(NA, NA, "a", "a", "a")) &&
          identical(.lt87(r), c(Skipped = ".a")) }))
check("N87f the NA rule's token (NA=missing) is said the same way, its line naming the NA rule",
      local({ n <- data.frame(V = haven::labelled(c(1, NA, haven::tagged_na("a")),
                                                  labels = c(Skipped = haven::tagged_na("a"))))
        g <- .conv87("stata", grab(jrecode(n, V, map = "NA=missing; else=copy")))
        grepl("Note: .a was used for missing, under Stata convention.", g, fixed = TRUE) &&
          grepl("\n  n$VR <- jrecode(n, V, map = \"NA=.b; else=copy\")\n", g, fixed = TRUE) }))
check("N87g a labelled INTEGER variable carries no marker: no note, and no error (the S350 lesson)",
      local({ g <- .conv87("stata", grab(r <- jrecode(f87, I, map = "9=missing; else=copy")))
        !grepl("was used for missing", g, fixed = TRUE) &&
          !grepl("Error|must be", g) && identical(.tg87(r)[3:4], c("a", "a")) }))
check("N87h N69k's ground FLIPPED by design (ruling R8): the source's own .a absorbing the token is now said",
      grepl("so the recoded cases share that missing value", .fl(m87a), fixed = TRUE))
check("N87az the marker offered is one the variable does not use: carrying .a and .b, the line gives .c, and it runs",
      local({ ab <- data.frame(V = haven::labelled(
                c(1, 9, haven::tagged_na("a"), haven::tagged_na("b")),
                labels = c(Skipped = haven::tagged_na("a"), Refused = haven::tagged_na("b"))))
        g <- .conv87("stata", grab(jrecode(ab, V, map = "9=missing; else=copy")))
        e <- .run87(g, "ab", ab, cv = "stata")
        grepl("\n  ab$VR <- jrecode(ab, V, map = \"9=.c; else=copy\")\n", g, fixed = TRUE) &&
          !is.null(e) && identical(.tg87(e$ab$VR), c(NA, "c", "a", "b")) }))

# --- B: ruling R8, part 2 -------------------------------------------------------
m87i <- .conv87("stata", grab(r87i <- jrecode(f87, V, map = "9=missing; else=copy",
                                              labels = "missing=Refused")))
check("N87i stata: a label for missing that differs from the marker's own is refused, pinned whole, and nothing is returned",
      identical(m87i, paste0(
        "jrecode(): 'missing' would use .a under Stata convention, but V\n",
        "already carries .a [\"Skipped\"], so the two would share one missing value.\n",
        "The label \"Refused\" would also rename the cases already at .a.\n",
        "To keep them distinct, give missing a marker V does not use:\n",
        "  f87$VR <- jrecode(f87, V, map = \"9=.b; else=copy\", labels = \".b=Refused\")\n",
        "Or, if they mean the same thing, use .a for both, keeping its label:\n",
        "  f87$VR <- jrecode(f87, V, map = \"9=.a; else=copy\")")) &&
        !exists("r87i", inherits = FALSE))
check("N87j ... each line runs alone: kept apart (.b \"Refused\", .a still \"Skipped\"); merged (the 9s on .a, still \"Skipped\")",
      local({ e1 <- .run87(m87i, "f87", f87, k = 1L, cv = "stata")
        e2 <- .run87(m87i, "f87", f87, k = 2L, cv = "stata")
        !is.null(e1) && !is.null(e2) &&
          identical(.tg87(e1$f87$VR), c(NA, NA, "b", "b", "a")) &&
          identical(sort(.lt87(e1$f87$VR)), sort(c(Skipped = ".a", Refused = ".b"))) &&
          identical(.tg87(e2$f87$VR), c(NA, NA, "a", "a", "a")) &&
          identical(.lt87(e2$f87$VR), c(Skipped = ".a")) }))
m87k <- .conv87("sas", grab(jrecode(F87S, V, map = "9=missing; else=copy",
                                    labels = "1=One; missing=Refused")))
check("N87k sas: the same refusal in the convention's case; the user's other labels kept in both lines; each runs",
      grepl("'missing' would use .A under SAS convention, but V already carries .A [\"Skipped\"]",
            .fl(m87k), fixed = TRUE) &&
        identical(.lines87(m87k), c(
          "F87S$VR <- jrecode(F87S, V, map = \"9=.B; else=copy\", labels = \"1=One; .B=Refused\")",
          "F87S$VR <- jrecode(F87S, V, map = \"9=.A; else=copy\", labels = \"1=One\")")) &&
        !is.null(.run87(m87k, "F87S", F87S, k = 1L, cv = "sas")) &&
        !is.null(.run87(m87k, "F87S", F87S, k = 2L, cv = "sas")))
q87 <- data.frame(Q = haven::labelled_spss(c(1, 2, 9, 9, -99), labels = c(Refused = -99),
                                           na_values = -99))
m87l <- .conv87("spss", grab(jrecode(q87, Q, map = "9=missing; else=copy",
                                     labels = "missing=Skipped")))
check("N87l spss: a label for missing that differs from the declared code's own is refused, pinned whole",
      identical(m87l, paste0(
        "jrecode(): 'missing' would use -99, from the\n",
        "missing.convention.codes default, but Q already declares -99 [\"Refused\"], so\n",
        "the two would share one missing value.\n",
        "The label \"Skipped\" would also rename the cases already at -99.\n",
        "To keep them distinct, give missing a code Q does not use, and declare it on\n",
        "the recoded variable:\n",
        "  q87$QR <- jrecode(q87, Q, map = \"9=-98; else=copy\",\n",
        "      labels = \"-98=Skipped\")\n",
        "  jdeclare_missing(q87, QR, codes = c(-99, -98), modify = TRUE)\n",
        "Or, if they mean the same thing, use -99 for both, keeping its label:\n",
        "  q87$QR <- jrecode(q87, Q, map = \"9=-99; else=copy\")")))
check("N87m ... the pair runs (QR declares -99 and -98, -98 \"Skipped\", -99 still \"Refused\"); the merge runs alone (the 9s at -99, declared)",
      local({ e1 <- .run87(m87l, "q87", q87, k = 1:2, cv = "spss")
        e2 <- .run87(m87l, "q87", q87, k = 3L, cv = "spss")
        !is.null(e1) && !is.null(e2) &&
          identical(sort(as.numeric(attr(e1$q87$QR, "na_values"))), c(-99, -98)) &&
          identical(.lt87(e1$q87$QR)[c("Refused", "Skipped")], c(Refused = "-99", Skipped = "-98")) &&
          identical(as.numeric(unclass(e2$q87$QR)), c(1, 2, -99, -99, -99)) &&
          identical(as.numeric(attr(e2$q87$QR, "na_values")), -99) }))
check("N87n the marker's or code's own label proceeds, under stata and under spss (D4's note), the label unchanged",
      local({ g1 <- .conv87("stata", grab(r1 <- jrecode(f87, V, map = "9=missing; else=copy",
                                                         labels = "missing=Skipped")))
        g2 <- .conv87("spss", grab(r2 <- jrecode(q87, Q, map = "9=missing; else=copy",
                                                 labels = "missing=Refused")))
        !grepl("would share", paste(g1, g2), fixed = TRUE) &&
          grepl("already declares -99 as a missing value", .fl(g2), fixed = TRUE) &&
          identical(.lt87(r2), c(Refused = "-99")) }))
check("N87o a marker the variable carries WITHOUT a label takes a label for missing: no refusal, the merge said",
      local({ u <- data.frame(V = haven::labelled(c(1, 9, haven::tagged_na("a"))))
        g <- .conv87("stata", grab(r <- jrecode(u, V, map = "9=missing; else=copy",
                                                labels = "missing=Refused")))
        !grepl("would share", g, fixed = TRUE) &&
          grepl("V already carries .a, so the recoded cases share", .fl(g), fixed = TRUE) &&
          identical(.lt87(r), c(Refused = ".a")) }))
check("N87p spss with no free convention code: the keep-apart line is a sentence; the merge line still runs",
      local({ q <- data.frame(Q = haven::labelled_spss(c(1, 9, -99, -98, -97), labels = c(Refused = -99),
                                                       na_values = c(-99, -98, -97)))
        m <- .conv87("spss", grab(jrecode(q, Q, map = "9=missing; else=copy", labels = "missing=Skipped")))
        grepl("give missing a code of its own; Q has no free code to offer here.", .fl(m), fixed = TRUE) &&
          length(.lines87(m)) == 1L && !is.null(.run87(m, "q", q, cv = "spss")) }))

# --- C: the offered declarations; ruling R15 at the load scan ----------------
w87 <- data.frame(W = haven::labelled(c(1, 2, 3, 4, 5, 5, haven::tagged_na("a"), 2, 3, 1),
                                      labels = c(Skipped = haven::tagged_na("a"))))
m87q <- .conv87("stata", grab(jrecode(w87, W, map = "5=-88; else=copy")))
check("N87q the D1 note on a Stata-form variable carrying .a: the value sent to a free marker, no declaration (it would be refused), and the line runs",
      startsWith(m87q, paste0(
        "Note: 5 was recoded to -88, which looks like a coded missing value.\n",
        "To make the value missing, map it to a Stata-style marker the recoded\n",
        "variable does not use:\n",
        "  w87$WR <- jrecode(w87, W, map = \"5=.b; else=copy\")\n\n")) &&
        !grepl("jdeclare_missing", m87q, fixed = TRUE) &&
        local({ e <- .run87(m87q, "w87", w87, cv = "stata")
          !is.null(e) && identical(.tg87(e$w87$WR)[c(5, 6, 7)], c("b", "b", "a")) }))
m87r <- .conv87("stata", grab(jrecode(w87, W, map = "4=-88; 5=-77; else=copy")))
check("N87r ... two values: each to a marker of its own (.b, .c), the merge named in prose as .b; the line runs",
      grepl("\n  w87$WR <- jrecode(w87, W, map = \"4=.b; 5=.c; else=copy\")\n", m87r, fixed = TRUE) &&
        grepl("To make them one missing value instead, map both to .b.", m87r, fixed = TRUE) &&
        local({ e <- .run87(m87r, "w87", w87, cv = "stata")
          !is.null(e) && identical(.tg87(e$w87$WR)[4:7], c("b", "c", "c", "a")) }))
w87b <- data.frame(W = haven::labelled(c(1, 2, 3, 4, 5, 5, haven::tagged_na("b"), 2, 3, 1),
                                       labels = c(Skipped = haven::tagged_na("b"))))
check("N87s under an spss setting on a Stata-form variable (the word missing would stop as ambiguous): the free marker with convention = \"stata\", which runs under spss",
      local({ m <- .conv87("spss", grab(jrecode(w87b, W, map = "5=-88; else=copy")))
        grepl("\n  w87b$WR <- jrecode(w87b, W, map = \"5=.a; else=copy\", convention = \"stata\")\n",
              m, fixed = TRUE) &&
          !is.null(.run87(m, "w87b", w87b, cv = "spss")) }))
check("N87t control: under stata on a variable carrying .b only, the D1 note is as before -- the word missing and the pair -- and both run",
      local({ m <- .conv87("stata", grab(jrecode(w87b, W, map = "5=-88; else=copy")))
        grepl("To make the value missing under Stata convention, map it directly:", .fl(m), fixed = TRUE) &&
          identical(.lines87(m)[c(1, 3)], c(
            "w87b$WR <- jrecode(w87b, W, map = \"5=missing; else=copy\")",
            "jdeclare_missing(w87b, WR, codes = c(-88), modify = TRUE)")) &&
          !is.null(.run87(m, "w87b", w87b, k = 1L, cv = "stata")) &&
          !is.null(.run87(m, "w87b", w87b, k = 2:3, cv = "stata")) }))
u87 <- data.frame(V = haven::labelled(c(1, 2, -99, haven::tagged_na("a")),
                                      labels = c(Skipped = haven::tagged_na("a"))))
check("N87u jdeclare_missing()'s marker refusal under no setting and under spss: both lines carry convention = \"stata\" (they stopped at the gate since v0.9.218), and each runs there",
      all(vapply(list(NULL, "spss"), function(cv) {
        m <- .conv87(cv, grab(jdeclare_missing(u87, V, codes = -99)))
        identical(.lines87(m), c(
          "u87$VR <- jrecode(u87, V, map = \"-99=.b; else=copy\", convention = \"stata\")",
          "u87$VR <- jrecode(u87, V, map = \"-99=.a; else=copy\", convention = \"stata\")")) &&
          !is.null(.run87(m, "u87", u87, k = 1L, cv = cv)) &&
          !is.null(.run87(m, "u87", u87, k = 2L, cv = cv))
      }, logical(1))) &&
        # under the variable's own convention the lines carry none, as before
        identical(.lines87(.conv87("stata", grab(jdeclare_missing(u87, V, codes = -99))))[1],
                  "u87$VR <- jrecode(u87, V, map = \"-99=.b; else=copy\")"))
.td87 <- file.path(tempdir(), "jstats n87")
unlink(.td87, recursive = TRUE); dir.create(.td87)
saveRDS(data.frame(y = haven::labelled(c(1, 2, 3, 4, 5, -99, -99, 2, 3, 4, 1, haven::tagged_na("a")),
                                       labels = c(Skipped = haven::tagged_na("a")))),
        file.path(.td87, "pd87.rds"))
saveRDS(data.frame(y = c(1, 2, 3, 4, 5, -99, -99, 2, 3, 4, 1, 2)), file.path(.td87, "pp87.rds"))
# The load scan prints to stdout: printed() takes it (messages muffled).
m87v <- local(.conv87("stata", printed(jload(file.path(.td87, "pd87.rds")))))
check("N87v the load scan on a variable of Stata form carrying .a: the two lines recode -99 to a free marker (the declaration would be refused), and each runs",
      local({ ln <- .lines87(m87v)
        identical(ln, c(
          "pd87$yR <- jrecode(pd87, y, map = \"-99=.b; else=copy\")",
          "pd87$yR <- jrecode(pd87, y, map = \"-99=.b; else=copy\", labels = \".b=label1\")")) &&
          grepl("\nTo recode one variable's codes to markers it does not use:\n", m87v, fixed = TRUE) &&
          { pd87 <- readRDS(file.path(.td87, "pd87.rds"))
            e1 <- .run87(m87v, "pd87", pd87, k = 1L, cv = "stata")
            e2 <- .run87(m87v, "pd87", pd87, k = 2L, cv = "stata")
            !is.null(e1) && !is.null(e2) &&
              identical(.tg87(e1$pd87$yR)[c(6, 7, 12)], c("b", "b", "a")) &&
              setequal(names(labelled::val_labels(e2$pd87$yR)), c("Skipped", "label1")) } }))
m87w <- local(.conv87(NULL, printed(jload(file.path(.td87, "pp87.rds")))))
check("N87w ruling R15: with no convention selected the load scan gives the choose-first menu first (\"this code\"), then the line, which runs once a convention is chosen",
      grepl(paste0("\nNo missing-value convention is selected, so this code cannot be\n",
                   "declared yet.\nChoose one for this session:\n"), m87w, fixed = TRUE) &&
        grepl(paste0("To make the choice permanent, put the same line in your .Rprofile.\n",
                     "Then, to declare one variable's codes as missing:\n",
                     "  jdeclare_missing(pp87, y, codes = -99, modify = TRUE)\n"), m87w, fixed = TRUE) &&
        !is.null(.run87(sub(".*Then, to declare", "", m87w), "pp87",
                        readRDS(file.path(.td87, "pp87.rds")), k = 1L, cv = "stata")))
check("N87x ... with a convention selected, the block as before: no menu",
      local({ m <- local(.conv87("spss", printed(jload(file.path(.td87, "pp87.rds")))))
        !grepl("Choose one", m, fixed = TRUE) &&
          grepl("\n\nTo declare one variable's codes as missing:\n  jdeclare_missing(pp87, y, codes = -99, modify = TRUE)\n",
                m, fixed = TRUE) }))
check("N87y ... and two codes take \"these codes\"",
      local({ saveRDS(data.frame(y = c(1, 2, 3, 4, 5, -99, -99, -98, -98, 4, 1, 2)),
                      file.path(.td87, "pq87.rds"))
        m <- local(.conv87(NULL, printed(jload(file.path(.td87, "pq87.rds")))))
        grepl("so these codes cannot be declared yet.", .fl(m), fixed = TRUE) }))
# S374 (v0.9.247; the S373 item, Jeff's lean "all yours"): a declaration
# replaces a variable's codes, so on a variable that already declares codes
# the scan's line names those too -- offered codes = -98 alone, a file
# declaring -99 lost it, counted as valid. Run, the line keeps both.
saveRDS(data.frame(Age = haven::labelled_spss(c(34, -99, 41, -98, 55, 61, -98),
                                              labels = c(Refused = -99, "Not stated" = -98),
                                              na_values = -99)),
        file.path(.td87, "pn87.rds"))
m87bb <- local(.conv87(NULL, printed(jload(file.path(.td87, "pn87.rds")))))
check("N87bb a variable declaring -99 and labelling -98 \"Not stated\": the line names both codes, with the ones it already declares (it offered codes = -98, which dropped -99); run, both are declared, the labels kept",
      local({ e <- .run87(m87bb, "pn87", readRDS(file.path(.td87, "pn87.rds")),
                          k = which(startsWith(.lines87(m87bb), "jdeclare_missing(")))
        grepl(paste0("To declare one variable's codes as missing, with the ones it already declares: ",
                     "jdeclare_missing(pn87, Age, codes = c(-99, -98), modify = TRUE)"), .fl(m87bb), fixed = TRUE) &&
          grepl("\n  jdeclare_missing(pn87, Age, codes = c(-99, -98), modify = TRUE)\n", paste0(m87bb, "\n"), fixed = TRUE) &&
          !grepl("Choose one", m87bb, fixed = TRUE) &&
          !is.null(e) && setequal(attr(e$pn87$Age, "na_values"), c(-99, -98)) &&
          setequal(names(labelled::val_labels(e$pn87$Age)), c("Refused", "Not stated")) }))
saveRDS(data.frame(Age = haven::labelled_spss(c(34, -99, 41, 999, 55, 61, 999),
                                              labels = c(Refused = -99), na_values = -99)),
        file.path(.td87, "pr87.rds"))
m87bc <- local(.conv87(NULL, printed(jload(file.path(.td87, "pr87.rds")))))
check("N87bc ... a suspected code beside a declared one: both lines name the declared code, the placeholder line keeping its label; each runs",
      local({ ln <- .lines87(m87bc)
        e1 <- .run87(m87bc, "pr87", readRDS(file.path(.td87, "pr87.rds")), k = 1L)
        e2 <- .run87(m87bc, "pr87", readRDS(file.path(.td87, "pr87.rds")), k = 2L)
        identical(ln, c("jdeclare_missing(pr87, Age, codes = c(-99, 999), modify = TRUE)",
                        "jdeclare_missing(pr87, Age, codes = c(\"Refused\" = -99, \"label1\" = 999), modify = TRUE)")) &&
          !is.null(e1) && setequal(attr(e1$pr87$Age, "na_values"), c(-99, 999)) &&
          !is.null(e2) && setequal(names(labelled::val_labels(e2$pr87$Age)), c("Refused", "label1")) }))
saveRDS(data.frame(Age = haven::labelled_spss(c(34, -99, 41, -98, -97, 999, 999),
                                              na_values = c(-99, -98, -97))),
        file.path(.td87, "pt87.rds"))
m87bd <- local(.conv87(NULL, printed(jload(file.path(.td87, "pt87.rds")))))
check("N87bd ... a variable already declaring three codes: no line, the fact and the way out (a fourth code would have stopped the line)",
      grepl(paste0("\nAge already declares 3 missing values, the most SPSS-style missing\n",
                   "values allow.\nTo declare more, use a range or Stata-style missing values.\n"),
            paste0(m87bd, "\n"), fixed = TRUE) &&
        !any(startsWith(.lines87(m87bd), "jdeclare_missing(")))

# --- D: the NA rule's "Declare -98" ---------------------------------------------
d87 <- data.frame(Q = haven::labelled_spss(c(1, 2, -7, NA, 2), labels = c(Refused = -7),
                                           na_values = -7),
                  I = haven::labelled(c(1L, 2L, 2L, NA, 1L), labels = c(Low = 1L)))
m87z <- .conv87("spss", grab(jrecode(d87, Q, map = "NA=-98; else=copy")))
check("N87z a recoded variable that declares codes of its own: the NA note's declaration names them with the new one, as a pair that runs",
      grepl(paste0("\nNote: 1 NA value in 'Q' was recoded to -98.\n",
                   "To make that case missing, declare -98 on the recoded variable:\n",
                   "  d87$QR <- jrecode(d87, Q, map = \"NA=-98; else=copy\")\n",
                   "  jdeclare_missing(d87, QR, codes = c(-7, -98), modify = TRUE)\n"),
            m87z, fixed = TRUE) &&
        local({ e <- .run87(m87z, "d87", d87, cv = "spss")
          !is.null(e) && identical(sort(as.numeric(attr(e$d87$QR, "na_values"))), c(-98, -7)) &&
            identical(.lt87(e$d87$QR), c(Refused = "-7")) }))
check("N87aa ... followed as the old note said (codes = -98 alone), -7 \"Refused\" would go: the drop notice (what the pair avoids)",
      local({ e <- .run87(m87z, "d87", d87, k = 1L, cv = "spss")
        d <- e$d87
        g <- .conv87("spss", printed(jdeclare_missing(d, QR, codes = -98)))
        grepl("Previously declared codes dropped: -7", .fl(g), fixed = TRUE) }))
z87 <- data.frame(Q = haven::labelled(c(1, 2, NA, 2, haven::tagged_na("a")),
                                      labels = c(Skipped = haven::tagged_na("a"))))
check("N87ab a Stata-form variable carrying .a: the NA rule sent to a free marker (the declaration would be refused), with convention = \"stata\" under an spss setting; both run",
      local({ m1 <- .conv87("stata", grab(jrecode(z87, Q, map = "NA=-98; else=copy")))
        m2 <- .conv87("spss", grab(jrecode(z87, Q, map = "NA=-98; else=copy")))
        identical(.lines87(m1)[1], "z87$QR <- jrecode(z87, Q, map = \"NA=.b; else=copy\")") &&
          identical(.lines87(m2)[1],
                    "z87$QR <- jrecode(z87, Q, map = \"NA=.b; else=copy\", convention = \"stata\")") &&
          { e <- .run87(m1, "z87", z87, k = 1L, cv = "stata")
            !is.null(e) && identical(.tg87(e$z87$QR)[c(3, 5)], c("b", "a")) } &&
          !is.null(.run87(m2, "z87", z87, k = 1L, cv = "spss")) }))
check("N87ac control: a plain recoded variable keeps the one-line advice (and under no convention the menu first)",
      local({ p <- data.frame(Q = c(1, 2, NA, 2))
        a <- .conv87("spss", grab(jrecode(p, Q, map = "NA=-98; else=copy")))
        b <- .conv87(NULL, grab(jrecode(p, Q, map = "NA=-98; else=copy")))
        grepl("Note: 1 NA value in 'Q' was recoded to -98.\nDeclare -98 with jdeclare_missing() so analyses exclude it.\n",
              a, fixed = TRUE) &&
          grepl("Then declare -98 with jdeclare_missing() so analyses exclude it.", .fl(b), fixed = TRUE) }))

# --- E: ruling R6, jrecode()'s half --------------------------------------------
check("N87ad one blank line between the kept-code note and the NA note (they ran together until v0.9.225), and before the reminder",
      local({ m <- m87z
        grepl("To convert it to a plain NA instead, add -7=NA to the map.\n\nNote: 1 NA value", m, fixed = TRUE) &&
          !grepl("\n\n\n", m, fixed = TRUE) }))
e87 <- data.frame(E = haven::labelled_spss(c(1, 2, 3, 4, 5, -99, -98, 1, 2, 3),
                                           labels = c(Refused = -99, `Don't know` = -98),
                                           na_values = c(-99, -98)))
m87ae <- .conv87("spss", grab(jrecode(e87, E, map = "4,5=-88; else=copy")))
check("N87ae ... between the D1 note and \"Categories were collapsed.\" (they ran together), and the kept-code note above them",
      grepl("  jdeclare_missing(e87, ER, codes = c(-99, -98, -88), modify = TRUE)\n\nNote: Categories were collapsed.\n",
            m87ae, fixed = TRUE) &&
        grepl("(for example -99=NA).\n\nNote: 4 and 5 were recoded", m87ae, fixed = TRUE))
check("N87af the labels hint as the call's first note opens with no blank line (Rule F: none before the first); after a note, one",
      local({ a <- grab(jrecode(data.frame(x = c(1, 2, 3, 2)), x, map = "1=0; 2=1; else=copy"))
        b <- .conv87("spss", grab(jrecode(data.frame(x = haven::labelled_spss(c(1, 2, -99, 2), na_values = -99)),
                                          x, map = "1=0; 2=1; else=copy")))
        startsWith(a, "Note: No value labels assigned.") &&
          grepl("to the map.\n\nNote: No value labels assigned.", b, fixed = TRUE) }))
check("N87ag advisory notes count only where they print: at \"full\" each is set off by a blank line; at \"standard\" the next note opens the output",
      local({ x <- data.frame(x = c(1, 2, 3, 2))
        f <- .lvl87("full", grab(jrecode(x, x, map = "1=0; 7=1; 8=2; 2=1; else=copy")))
        s <- .lvl87("standard", grab(jrecode(x, x, map = "1=0; 7=1; 8=2; 2=1; else=copy")))
        # S355: the absent map values are one note now (the S352 item), so
        # the pair at "full" is that note and the labels note after it.
        grepl("recoded for them.\n\nNote: No value labels assigned.", f, fixed = TRUE) &&
          startsWith(f, "Note: 'x' contained none of the map values 7 and 8") &&
          startsWith(s, "Note: No value labels assigned.") }))
check("N87ah no two notes in this section's jrecode() captures run together",
      !any(grepl("[^\n]\nNote: ", c(m87a, m87c, m87q, m87r, m87z, m87ae))))

# --- F: jdeclare_missing(): the refusal on several variables; a place ----------
v87 <- data.frame(V = u87$V, W = c(1, 2, 3, -99))
m87ai <- .conv87("stata", grab(jdeclare_missing(v87, V, W, codes = c(-99), modify = TRUE)))
check("N87ai the refusal on several variables: each variable's name on its line, its refusal under it at four, wrapped once (it broke mid-phrase); pinned whole",
      identical(m87ai, paste0(
        "jdeclare_missing(): cannot declare on 1 of 2 variables; no variable\n",
        "was changed:\n",
        "  V:\n",
        "    -99 would become .a under Stata convention, but V already carries .a\n",
        "    [\"Skipped\"], so the two would share one missing value.\n",
        "    To keep them distinct, recode -99 to a marker V does not use:\n",
        "      v87$VR <- jrecode(v87, V, map = \"-99=.b; else=copy\")\n",
        "    Or, if they mean the same thing, recode -99 to .a:\n",
        "      v87$VR <- jrecode(v87, V, map = \"-99=.a; else=copy\")")) &&
        identical(v87$W, c(1, 2, 3, -99)))
check("N87aj ... no line over the width, and the nested lines run",
      max(nchar(strsplit(m87ai, "\n", fixed = TRUE)[[1]])) <= .pin_width &&
        !is.null(.run87(m87ai, "v87", v87, k = 1L, cv = "stata")) &&
        !is.null(.run87(m87ai, "v87", v87, k = 2L, cv = "stata")))
l87 <- list(d = data.frame(V = c(1, 2, -99)))
m87ak <- .conv87("spss", grab(jdeclare_missing(l87$d, V, codes = c(-99), modify = TRUE)))
check("N87ak modify = TRUE on a place: the call assigned back to the place, without modify (the mydata lines changed a copy); pinned",
      identical(m87ak, paste0(
        "jdeclare_missing(): modify = TRUE can only change a data frame that\n",
        "has a name.\n",
        "To change l87$d itself, assign the result to it:\n",
        "  l87$d <- jdeclare_missing(l87$d, V, codes = c(-99))")))
check("N87al ... the line runs and changes the place itself",
      local({ e <- .run87(m87ak, "l87", l87, cv = "spss")
        !is.null(e) && identical(as.numeric(attr(e$l87$d$V, "na_values")), -99) }))
check("N87am ... jconvert()'s twin, and an expression keeps the mydata lines",
      local({ l <- list(d = q87)
        a <- .conv87("stata", grab(jconvert(l$d, to = "stata", modify = TRUE)))
        b <- .conv87("stata", grab(jconvert(data.frame(q87), to = "stata", modify = TRUE)))
        identical(.lines87(a), "l$d <- jconvert(l$d, to = \"stata\")") &&
          !is.null(.run87(a, "l", l, cv = "stata")) &&
          grepl("\n  mydata <- data.frame(q87)\n  jconvert(mydata, ..., modify = TRUE)", b, fixed = TRUE) }))

# --- G: the five jconvert() offers on a frame holding a declared string ------
mk87 <- function() data.frame(
  S = haven::labelled_spss(c("a", "b", "x", "a", ""), labels = c(Refused = "x"), na_values = "x"),
  N = haven::labelled_spss(c(1, 2, -99, 2, 1), labels = c(Refused = -99), na_values = -99),
  I = haven::labelled_spss(c(1L, 2L, -99L, 2L, 1L), labels = c(Refused = -99L), na_values = -99L),
  stringsAsFactors = FALSE)
s87 <- mk87()
.route87 <- paste0(
  "  jconvert(s87, vars = \"S\", to = \"baseR\", modify = TRUE)\n",
  "  jconvert(s87, to = \"stata\", modify = TRUE)\n",
  "S is text, so the first line makes its declared values plain NA.")
.ok87 <- function(m) {
  e <- .run87(m, "s87", s87, k = which(grepl("^jconvert\\(", .lines87(m))), cv = "stata")
  !is.null(e) && all(is.na(e$s87$S[3])) && identical(.tg87(e$s87$N)[3], "a")
}
m87an <- .conv87("stata", grab(jdeclare_missing(s87, N, codes = c(Refused = ".a"))))
check("N87an the marker error on a column of SPSS-style missing values: its convert-first remedy is the route that runs, at standard and at minimal",
      grepl(paste0("To use Stata-style markers instead, convert the column first:\n", .route87), m87an, fixed = TRUE) &&
        .ok87(m87an) &&
        local({ m <- .lvl87("minimal", .conv87("stata", grab(jdeclare_missing(s87, N, codes = c(Refused = ".a")))))
          grepl(paste0("Name the numeric codes directly, or convert first:\n", .route87), m, fixed = TRUE) }))
check("N87ao jrecode()'s ambiguous-missing stop: its convert line is the route",
      local({ m <- .conv87("stata", grab(jrecode(s87, N, map = "1=missing; else=copy")))
        grepl(paste0("Or convert the data frame to match your setting first:\n", .route87), m, fixed = TRUE) &&
          .ok87(m) }))
check("N87ap jrecode()'s marker refusal: \"Convert the data frame first\" is the route, the map-them-too line after it",
      local({ m <- .conv87("stata", grab(jrecode(s87, N, map = "1=.b; else=copy")))
        grepl(paste0("Convert the data frame first, then recode:\n", .route87,
                     "\nOr map -99 as well, so no SPSS-style missing value remains."), m, fixed = TRUE) &&
          .ok87(m) }))
check("N87aq jdeclare_missing()'s note on a setting the variable does not use: \"run both:\" and the route",
      local({ t <- mk87(); t$M <- haven::labelled_spss(c(1, 2, 3, -98, -99), na_values = -99)
        p <- .conv87("stata", printed(jdeclare_missing(t, M, codes = c(-99, -98))))
        grepl(paste0("To convert the data frame, run both:\n",
                     gsub("s87", "t", .route87, fixed = TRUE)), p, fixed = TRUE) }))
# .nudge87(): the nudge names whatever data frames the workspace holds, and
# this battery's holds dozens, so every data frame is set aside for one call
# (N74's .frames74() pattern) and the frames given are put there under their
# own names (nz87*, so no fixture is removed with them); joptions() runs with
# no convention set; then all is put back as it was.
.nudge87 <- function(frames) {
  force(frames)     # before the workspace is emptied
  nms  <- ls(globalenv(), all.names = TRUE)
  isdf <- vapply(nms, function(n) is.data.frame(get(n, envir = globalenv())),
                 logical(1))
  hold <- mget(nms[isdf], envir = globalenv())
  rm(list = names(hold), envir = globalenv())
  on.exit({
    rm(list = intersect(names(frames), ls(globalenv(), all.names = TRUE)),
       envir = globalenv())
    list2env(hold, envir = globalenv())
  }, add = TRUE)
  for (nm in names(frames)) assign(nm, frames[[nm]], envir = globalenv())
  .conv87(NULL, printed(joptions(missing.convention = "stata")))
}
check("N87ar joptions()'s workspace check, one frame holding a declared string: \"run both:\" and the route",
      local({ p <- .nudge87(list(nz87s = s87))
        grepl(paste0("To convert it to match this setting, run both:\n",
                     gsub("s87", "nz87s", .route87, fixed = TRUE)), p, fixed = TRUE) }))
check("N87as ... two frames, one holding it: each frame's lines, the sentence naming its line by place (first, second)",
      local({ p <- .nudge87(list(nz87s = s87, nz87t = data.frame(N = s87$N)))
        grepl(paste0("To convert them to match this setting, run these lines:\n",
                     "  jconvert(nz87s, vars = \"S\", to = \"baseR\", modify = TRUE)\n",
                     "  jconvert(nz87s, to = \"stata\", modify = TRUE)\n",
                     "  jconvert(nz87t, to = \"stata\", modify = TRUE)\n",
                     "S in nz87s is text, so the first line makes its declared values plain NA."),
              p, fixed = TRUE) &&
          # the routed frame second (the nudge lists frames in name order):
          # its sentence names the second line
          grepl("S in nz87z is text, so the second line makes its declared values plain NA.",
                .fl(.nudge87(list(nz87a = data.frame(N = s87$N), nz87z = s87))), fixed = TRUE) }))
check("N87at ... three frames: the exemplar is one whose one call runs; with no declared string anywhere, as before",
      local({ p <- .nudge87(list(nz87s = s87, nz87t = data.frame(N = s87$N),
                                 nz87u = data.frame(N = s87$N)))
        q <- .nudge87(list(nz87t = data.frame(N = s87$N)))
        grepl("run one call per data frame:\n  jconvert(nz87t, to = \"stata\", modify = TRUE)", p, fixed = TRUE) &&
          grepl("To convert it to match this setting, run:\n  jconvert(nz87t, to = \"stata\", modify = TRUE)\n", q, fixed = TRUE) }))
check("N87au controls: a frame with no declared string keeps the one line at each site",
      local({ n <- data.frame(N = s87$N)
        a <- .conv87("stata", grab(jrecode(n, N, map = "1=missing; else=copy")))
        b <- .conv87("stata", grab(jrecode(n, N, map = "1=.b; else=copy")))
        grepl("first:\n  jconvert(n, to = \"stata\", modify = TRUE)", a, fixed = TRUE) &&
          grepl("recode:\n  jconvert(n, to = \"stata\", modify = TRUE)\nOr map", b, fixed = TRUE) }))

# --- H: jsave() given an expression as the data ----------------------------------
oc87 <- data.frame(X = haven::labelled_spss(c(1, -1, -2, -3, -4), na_values = c(-1, -2, -3, -4)),
                   Y = c(1L, 2L, 3L, 4L, 5L))
m87av <- grab(jsave(oc87["X"], file.path(.td87, "oc87.sav")))
check("N87av the .sav over-limit refusal on oc87[\"X\"]: each block of lines opens on \"mydata <- oc87[\\\"X\\\"]\", the files named mydata (it printed jsave(oc87[\"X\"], \"oc87[\"X\"].rds\"))",
      identical(.lines87(m87av), c(
        "mydata <- oc87[\"X\"]", "jsave(mydata, \"mydata.rds\")",
        "mydata <- oc87[\"X\"]", "jconvert(mydata, to = \"stata\", modify = TRUE)",
        "jsave(mydata, \"mydata.dta\")",
        # v0.9.234 (N94): the save that blanks them, its own block.
        "mydata <- oc87[\"X\"]", .pdl87("oc87.sav"))) &&
        grepl("This variable in oc87[\"X\"] has more:", m87av, fixed = TRUE))
check("N87aw ... every line parses, and each block runs",
      local({ ln <- .lines87(m87av)
        all(vapply(ln, function(l) !inherits(try(parse(text = l), silent = TRUE), "try-error"), logical(1))) &&
          { wd <- setwd(.td87); on.exit(setwd(wd))
            !is.null(.run87(m87av, "oc87", oc87, k = 1:2)) &&
              !is.null(.run87(m87av, "oc87", oc87, k = 3:5, cv = "stata")) &&
              file.exists(file.path(.td87, "mydata.rds")) && file.exists(file.path(.td87, "mydata.dta")) } }))
check("N87ax the .dta refusal and the combined refusal on an expression: mydata named first, lines that run",
      local({ a <- grab(jsave(oc87["X"], file.path(.td87, "oc87.dta")))
        cx <- oc87; cx$Z <- I(list(1, 2, 3, 4, 5))
        b <- grab(jsave(cx[c("X", "Z")], file.path(.td87, "oc87.dta")))
        identical(.lines87(a), c("mydata <- oc87[\"X\"]", "jconvert(mydata, to = \"stata\", modify = TRUE)",
                                 "mydata <- oc87[\"X\"]", .pdl87("oc87.dta"))) &&
          !is.null(.run87(a, "oc87", oc87, k = 1:2, cv = "stata")) &&
          grepl("cx[c(\"X\", \"Z\")] cannot be saved to Stata format (.dta) yet", .fl(b), fixed = TRUE) &&
          all(c("mydata <- cx[c(\"X\", \"Z\")]", "mydata[c(\"Z\")] <- NULL") %in% .lines87(b)) }))
check("N87ay controls: a name keeps its own lines and file names; a place's files take its last part",
      local({ a <- grab(jsave(oc87, file.path(.td87, "oc87.sav")))
        l <- list(d = oc87)
        b <- grab(jsave(l$d, file.path(.td87, "oc87.sav")))
        "jsave(oc87, \"oc87.rds\")" %in% .lines87(a) && !any(grepl("mydata", a, fixed = TRUE)) &&
          "jsave(l$d, \"d.rds\")" %in% .lines87(b) }))

unlink(.td87, recursive = TRUE)
options(.jst_missing_notice_shown = .entry_shown87)
rm(list = intersect(c("f87", "r87a", "m87a", "F87S", "m87c", "m87i", "m87k", "q87",
                      "m87l", "w87", "m87q", "m87r", "w87b", "u87", "m87v", "m87w",
                      "d87", "m87z", "z87", "e87", "m87ae", "v87", "m87ai", "l87",
                      "m87ak", "mk87", "s87", "m87an", "oc87", "m87av",
                      ".conv87", ".lvl87", ".lines87", ".run87", ".tg87", ".lt87",
                      ".td87", ".route87", ".ok87", ".nudge87", ".entry_shown87"),
                    ls(all.names = TRUE)))

# =============================================================================
# N88 -- FIX SLATE 9, SECOND HALF: RULING R5, A PRINTED CALL'S LAYOUT (S353, v0.9.226)
# =============================================================================
# Ruling R5 (Jeff, S345: "Yes to your lean of one rule for all calls"):
# every call the package prints for pasting has ONE layout. Within the
# message width, one line. Wider, broken where R allows -- after a comma
# between the call's arguments, as many on a line as fit, each later line
# four spaces in from the call's own -- and an argument too long for a line
# of its own broken inside: a map or labels string after the semicolons
# between its rules, set under its first rule; a c() after its commas, set
# under its first element. Never one long line, never shortened with
# "...", never broken by the prose wrapper. One helper does it, in the
# wrapper layer (.jst_layout_call(), called by .jst_wrap_message()), so it
# holds for every emitter; .jst_jencode_map_call()'s packer, which hung its
# maps under the parenthesis at a fixed 76 columns, retired into it.
# Jeff, S345: "This is mechanical and I don't think that I need to look at
# every instance of the change" -- so the batteries hold the substance:
# every re-laid call is RUN and its result compared with the one-line
# form's, and one walk section shows the form (missing_convention_walk.R
# Section 64). Parts:
#   A  the layout by its unit, at widths 40, 76 and 120: one line when it
#      fits; the break; the fixed indent; a map under its first rule, a
#      quoted word whole; a c() at its commas; a long name or formula kept
#      whole, never cut; the words of the one-line form, in order;
#      idempotent.
#   B  what it leaves alone: prose that opens with a call, two calls on a
#      line, a comment, a call with text after it.
#   C  a call broken by a builder, or by an earlier pass, joined and laid
#      out again; a broken modify = TRUE line on a place seen whole.
#   D  real messages: every call laid out over lines is RUN, and its result
#      is identical to the one-line form's (jencode()'s offered maps, the
#      D1 pairs of jrecode() and jencode(), jdeclare_missing()'s range
#      recipe and marker refusal, the load scan's line, now through the
#      stdout emitter).
#   E  the riders: the assign-or-lose reminder opens with a blank line only
#      when a note printed above it; jencode()'s advisory notes one blank
#      line from what follows them; jsum() and javg() as they were.
# The sweep at the foot (N88s) holds every condition the battery took.
.wm88  <- function(x, w = 76L) .jst_wrap_message(x, width = w)
.conv88 <- function(cv, expr) {
  old <- getOption(".jst_options_missing_convention")
  options(.jst_options_missing_convention = cv)
  on.exit(options(.jst_options_missing_convention = old), add = TRUE)
  force(expr)
}
.lvl88 <- function(lv, expr) {
  old <- getOption(".jst_output_level")
  options(.jst_output_level = lv)
  on.exit(options(.jst_output_level = old), add = TRUE)
  force(expr)
}
.ln88  <- function(x) strsplit(x, "\n", fixed = TRUE)[[1]]
.ws88  <- function(x) gsub("[[:space:]]+", " ", trimws(x))
.max88 <- function(x) max(nchar(.ln88(x)))
# The samples: one line each, as a builder makes them.
.s88 <- c(
  map  = paste0("  tdat$ReasonDeclinedR <- jencode(tdat, ReasonDeclined, map = ",
                "\"Refused=missing; Don't know=missing; No answer=missing; ",
                "\\\"Not applicable; other\\\"=1\")"),
  conv = "  wc$StatusR <- jrecode(wc, Status, map = \"8=missing; else=copy\", convention = \"spss\")",
  lab  = "  u84$VR <- jrecode(u84, V, map = \"-99=.c; -98=.d; else=copy\", labels = \".c=Refused; .d=DK\")",
  big  = paste0("  big <- jdeclare_missing(big, questionnaire_item_01, ",
                "questionnaire_item_02, questionnaire_item_03, questionnaire_item_04, ",
                "codes = c(-99, -98, -97, -96, -95, -94, -93, -92, -91, -90, -89, ",
                "-88, -87, -86, -85), modify = TRUE)"),
  frm  = paste0("  jlm(Flourishing ~ scale(Stress, scale = FALSE) * SocialSupport + ",
                "Condition, d[d$SocialSupport > 5, ], categorical = \"Condition\")"),
  plc  = "  lst$d <- jdeclare_missing(lst$d, Status, codes = c(-99, -98), convention = \"stata\")")

# --- A: the layout by its unit -------------------------------------------------
check("N88a one line when it fits: a call of exactly the width is unchanged, and one character more breaks it",
      local({ x76 <- paste0("  dd$vR <- jrecode(dd, v, map = \"", strrep("1=1; ", 7),
                            "else=copy\", labels = \"1=A\")")
        x76 <- paste0(substr(x76, 1, 76 - nchar("\")")), "\")")
        ok76 <- nchar(x76) == 76L && .jst_parses_once(trimws(x76))
        x77  <- sub("^  dd", "  ddd", sub("\\(dd,", "(ddd,", x76))
        ok76 && identical(.wm88(x76), x76) && identical(.jst_layout_call(x76, 76L), x76) &&
          nchar(x77) == 78L &&
          length(.ln88(.wm88(x77))) == 2L }))
check("N88b wider: broken after an argument's comma, the next line four spaces in from the call's own, as many arguments on a line as fit (pinned)",
      identical(.wm88(.s88[["conv"]]), paste0(
        "  wc$StatusR <- jrecode(wc, Status, map = \"8=missing; else=copy\",\n",
        "      convention = \"spss\")")) &&
        identical(.wm88(.s88[["lab"]]), paste0(
          "  u84$VR <- jrecode(u84, V, map = \"-99=.c; -98=.d; else=copy\",\n",
          "      labels = \".c=Refused; .d=DK\")")))
check("N88c a map too long for a line of its own: broken after its semicolons, its rules set under the first, a quoted word holding a semicolon kept whole (pinned; the ruling's sketch)",
      identical(.wm88(.s88[["map"]]), paste0(
        "  tdat$ReasonDeclinedR <- jencode(tdat, ReasonDeclined,\n",
        "      map = \"Refused=missing; Don't know=missing; No answer=missing;\n",
        "             \\\"Not applicable; other\\\"=1\")")))
check("N88d a c() too long for a line of its own: broken after its commas, set under its first element; the arguments around it packed as they fit (pinned at 76 and at 40)",
      identical(.wm88(.s88[["big"]]), paste0(
        "  big <- jdeclare_missing(big, questionnaire_item_01, questionnaire_item_02,\n",
        "      questionnaire_item_03, questionnaire_item_04,\n",
        "      codes = c(-99, -98, -97, -96, -95, -94, -93, -92, -91, -90, -89, -88,\n",
        "                -87, -86, -85), modify = TRUE)")) &&
        identical(.ln88(.wm88(.s88[["big"]], 40L)), c(
          "  big <- jdeclare_missing(big,",
          "      questionnaire_item_01,",
          "      questionnaire_item_02,",
          "      questionnaire_item_03,",
          "      questionnaire_item_04,",
          "      codes = c(-99, -98, -97, -96, -95,",
          "                -94, -93, -92, -91, -90,",
          "                -89, -88, -87, -86,",
          "                -85), modify = TRUE)")))
check("N88e what cannot break is kept whole, past the width, never cut: a formula as the first argument, a long name, a one-rule map",
      local({ f <- .wm88(.s88[["frm"]])
        n <- .wm88(paste0("  ", strrep("v", 60), "$xR <- jrecode(", strrep("v", 60),
                          ", x, map = \"1=2\")"))
        o <- .wm88(paste0("  dd$xR <- jrecode(dd, x, map = \"", strrep("9", 70), "=1\")"))
        identical(.ln88(f), c(
          "  jlm(Flourishing ~ scale(Stress, scale = FALSE) * SocialSupport + Condition,",
          "      d[d$SocialSupport > 5, ], categorical = \"Condition\")")) &&
          grepl(paste0(strrep("v", 60), "$xR <- jrecode(", strrep("v", 60), ","), n, fixed = TRUE) &&
          grepl(paste0("map = \"", strrep("9", 70), "=1\")"), o, fixed = TRUE) &&
          !grepl("...", paste(f, n, o), fixed = TRUE) }))
check("N88f at widths 40, 50, 76 and 120: every laid-out call holds the words of its one-line form in order and parses; the only lines over the width are single pieces -- one map rule, and the line of a formula that is the first argument (pinned)",
      local({ over <- character(0); ok <- TRUE
        for (w in c(40L, 50L, 76L, 120L)) for (x in .s88) {
          y  <- .wm88(x, w); ls <- .ln88(y)
          ok <- ok && identical(.ws88(gsub("\n *", " ", y)), .ws88(x)) &&
            .jst_parses_once(trimws(y))
          if (any(nchar(ls) > w)) over <- c(over, paste0(w, ": ", ls[nchar(ls) > w]))
        }
        jl <- "  jlm(Flourishing ~ scale(Stress, scale = FALSE) * SocialSupport + Condition,"
        ok && identical(over, c(
          "40:              \\\"Not applicable; other\\\"=1\")",
          paste0("40: ", jl), paste0("50: ", jl), paste0("76: ", jl))) &&
          identical(.wm88(.s88[["conv"]], 120L), .s88[["conv"]]) }))
check("N88g idempotent: laying out a laid-out message changes nothing, at every width",
      all(vapply(c(40L, 76L, 120L), function(w) all(vapply(.s88, function(x) {
        identical(.wm88(.wm88(x, w), w), .wm88(x, w)) }, logical(1))), logical(1))))
check("N88w a first argument too long for the call's first line is broken inside, its later lines at the call's fixed indent, not under the argument (an expression named mydata; pinned)",
      local({ g <- grab(jrecode(data.frame(x = haven::labelled(c(1, 2, 3, 2),
                                                             labels = c(A = 1, B = 2, C = 3))),
                                x, map = "1=10; else=copy"))
        grepl(paste0("\n  mydata <- data.frame(x = haven::labelled(c(1, 2, 3, 2),\n",
                     "      labels = c(A = 1, B = 2, C = 3)))\n"), g, fixed = TRUE) }))
check("N88x a subscript given as the data, named mydata in the reminder: broken after the commas inside its brackets, at the fixed indent, and it runs as its one-line form does; an empty first index kept",
      local({ hh88 <- data.frame(NumberOfAdultsInHousehold = c(1, 2, 8, 2),
                                 IncomeBeforeTaxInDollars = c(10, 20, 30, 40))
        g <- grab(jrecode(hh88[hh88$NumberOfAdultsInHousehold < 8,
                               c("NumberOfAdultsInHousehold", "IncomeBeforeTaxInDollars")],
                          NumberOfAdultsInHousehold, map = "1=10; else=copy"))
        b <- .r5_calls(.ln88(g), shape = "^  mydata <- hh88")
        e1 <- new.env(parent = globalenv()); assign("hh88", hh88, envir = e1)
        e2 <- new.env(parent = globalenv()); assign("hh88", hh88, envir = e2)
        eval(parse(text = b), envir = e1); eval(parse(text = .r5_flat(b)), envir = e2)
        identical(b, paste0("mydata <- hh88[hh88$NumberOfAdultsInHousehold < 8,\n",
                            "      c(\"NumberOfAdultsInHousehold\", \"IncomeBeforeTaxInDollars\")]")) &&
          identical(e1$mydata, e2$mydata) && nrow(e1$mydata) == 3L &&
          identical(.wm88(paste0("  mydata <- hh88[, c(\"NumberOfAdultsInHousehold\", ",
                                 "\"IncomeBeforeTaxInDollars\", \"Another\")]")),
                    paste0("  mydata <- hh88[,\n",
                           "      c(\"NumberOfAdultsInHousehold\", \"IncomeBeforeTaxInDollars\", \"Another\")]")) }))
check("N88h the fixed indent follows the call's own: an exhibit at four spaces continues at eight",
      identical(.ln88(.wm88(paste0("  ", .s88[["conv"]])))[2],
                "        convention = \"spss\")"))

# --- B: what it leaves alone ---------------------------------------------------
check("N88i prose that opens with a call and an open bracket is wrapped as prose, line by line, never joined into a call",
      local({ x <- paste0("  mean() do not and return wrong answers with no warning. (\"sas\" is\n",
                          "  Stata with uppercase markers.) With no convention chosen, and more words to wrap")
        identical(.wm88(x), paste(vapply(.ln88(x), .wm88, ""), collapse = "\n")) &&
          length(.ln88(.wm88(x))) == 3L }))
check("N88j a line that is not one call is passed whole: two calls, a call with a comment, a call with text after it",
      all(vapply(c(
        paste0("  jsubset(survey_responses_long, off); jcomplete(survey_responses_long, off)"),
        paste0("  jdeclare_missing(survey_responses_long, Income, codes = -99)   # the code"),
        paste0("  joptions(missing.convention = \"stata\")    (or \"spss\", \"sas\") or ",
               "another value of the setting")),
        function(x) identical(.wm88(x), x), logical(1))))

# --- C: a call already broken over lines ---------------------------------------
check("N88k a call a builder broke (the retired packer's form) is joined and laid out again, as its one-line form is",
      local({ old <- paste0("  q45$WhyR <- jencode(q45, Why,\n",
                            "                      map = \"Don't know=1;\n",
                            "                            \\\"Moved away, address unknown\\\"=2; No answer=3;\n",
                            "                            \\\"Other = see notes\\\"=4\")")
        one <- paste0("  q45$WhyR <- jencode(q45, Why, map = \"Don't know=1; ",
                      "\\\"Moved away, address unknown\\\"=2; No answer=3; ",
                      "\\\"Other = see notes\\\"=4\")")
        identical(.wm88(old), .wm88(one)) &&
          identical(.wm88(old, 120L), .wm88(one, 120L)) &&
          identical(.ln88(.wm88(old, 120L))[2],
                    paste0("      map = \"Don't know=1; \\\"Moved away, address unknown\\\"=2; ",
                           "No answer=3; \\\"Other = see notes\\\"=4\")")) }))
check("N88l a modify = TRUE line on a place, broken over lines, is seen whole and given the assignment form that runs",
      identical(.wm88(paste0("To declare it:\n  jdeclare_missing(lst$d, Status,\n",
                             "      codes = c(-99), modify = TRUE)")),
                "To declare it:\n  lst$d <- jdeclare_missing(lst$d, Status, codes = c(-99))"))
check("N88m the builder's map call is one line; the wrapper lays it out (the packer is retired)",
      local({ r <- .jst_jencode_map_call("survey_responses", "ReasonForDeclining",
                                         "Refused=1; Don't know=2; No answer=3; \"A; b\"=4")
        length(.ln88(r)) == 1L && .jst_parses_once(trimws(r)) &&
          identical(.ln88(.wm88(r)), c(
            "  survey_responses$ReasonForDecliningR <- jencode(survey_responses,",
            "      ReasonForDeclining,",
            "      map = \"Refused=1; Don't know=2; No answer=3; \\\"A; b\\\"=4\")")) }))

# --- D: real messages, each laid-out call run beside its one-line form ---------
# .cmp88(): run every call a message offers, in order, twice -- as printed
# (a call laid out over lines kept whole) and in its one-line form -- each
# in a scratch environment holding the frame; TRUE when both ran, at least
# one call was laid out over lines, and the frames come out identical.
.cmp88 <- function(m, nm, frame, cv = NULL, k = NULL) {
  bl <- .r5_calls(.ln88(m), shape = "^ {2,}[A-Za-z.][A-Za-z0-9._$]*(\\[[^]]*\\])* *(\\(|<- )")
  bl <- bl[!grepl("<[A-Za-z][A-Za-z ]*>", bl)]   # a pattern, not a call
  if (!is.null(k)) bl <- bl[k]
  if (!length(bl) || !any(grepl("\n", bl, fixed = TRUE))) return(FALSE)
  run <- function(codes) {
    e <- new.env(parent = globalenv()); assign(nm, frame, envir = e)
    old <- getOption(".jst_options_missing_convention")
    options(.jst_options_missing_convention = cv)
    on.exit(options(.jst_options_missing_convention = old), add = TRUE)
    ok <- tryCatch({ suppressMessages(utils::capture.output(
      for (b in codes) eval(parse(text = b), envir = e))); TRUE },
      error = function(err) FALSE)
    if (ok) get(nm, envir = e) else NULL
  }
  a <- run(bl); b <- run(vapply(bl, .r5_flat, "", USE.NAMES = FALSE))
  !is.null(a) && !is.null(b) && identical(a, b)
}
survey_responses88 <- data.frame(
  ReasonForDeclining = c("Don't know", "Moved away, address unknown", "No answer",
                         "Other = see notes", "Refused",
                         "Skipped; respondent was not asked this question", ""),
  stringsAsFactors = FALSE)
check("N88n jencode()'s offered maps, laid out: each runs, and gives what its one-line form gives",
      local({ m <- grab(jencode(survey_responses88, ReasonForDeclining))
        n <- length(.r5_calls(.ln88(m), shape = "^  survey_responses88\\$Reason"))
        n == 2L && .cmp88(m, "survey_responses88", survey_responses88, k = 1L) &&
          .cmp88(m, "survey_responses88", survey_responses88, k = 2L) }))
household_income88 <- data.frame(
  NumberOfAdultsInHousehold = c(1, 2, 8, 2, 1, 3, NA),
  ReasonForNonResponse      = c("Yes", "No", "Refused", "Yes", "Unknown", "No", "Yes"),
  stringsAsFactors = FALSE)
check("N88o the D1 pairs of jrecode() and jencode() under spss, laid out: recode and declare run, as the one-line pair does",
      local({ m1 <- .conv88("spss", grab(jrecode(household_income88, NumberOfAdultsInHousehold,
                                                  map = "8=-99; else=copy")))
        m2 <- .conv88("spss", grab(jencode(household_income88, ReasonForNonResponse,
                                           map = "Yes=1; No=2; Refused=-99; Unknown=-98")))
        .cmp88(m1, "household_income88", household_income88, cv = "spss") &&
          .cmp88(m2, "household_income88", household_income88, cv = "spss") }))
household_wave88 <- data.frame(MonthlyIncomeBeforeTax = haven::labelled(
  c(1200, -99, 3400, -95, 2100), labels = c(Refused = -99)))
check("N88p jdeclare_missing()'s range recipe under stata (variant D), laid out: declare under spss, then convert -- the same frame as the one-line pair",
      local({ m <- .conv88("stata", grab(jdeclare_missing(household_wave88,
                                                          MonthlyIncomeBeforeTax,
                                                          range = c(-99, -91))))
        grepl("\n      range = c(-99, -91), convention = \"spss\", modify = TRUE)\n",
              m, fixed = TRUE) &&
          .cmp88(m, "household_wave88", household_wave88, cv = "stata") }))
household_marks88 <- data.frame(SatisfactionWithServices = haven::labelled(
  c(1, 2, haven::tagged_na("a"), -99, 3), labels = c(Skipped = haven::tagged_na("a"))))
check("N88q the marker refusal's two recodes, laid out: each runs alone, as its one-line form does",
      local({ m <- .conv88("stata", grab(jdeclare_missing(household_marks88,
                                                          SatisfactionWithServices,
                                                          codes = c(Refused = -99))))
        length(.r5_calls(.ln88(m), shape = "^  household")) == 2L &&
          .cmp88(m, "household_marks88", household_marks88, cv = "stata", k = 1L) &&
          .cmp88(m, "household_marks88", household_marks88, cv = "stata", k = 2L) }))
.td88 <- file.path(tempdir(), "jstats n88")
unlink(.td88, recursive = TRUE); dir.create(.td88)
saveRDS(data.frame(PrimaryCaregiverEmploymentHoursPerWeek = c(1, 2, 3, 4, 5, -99, -99,
                                                              2, 3, 4, 1, 2)),
        file.path(.td88, "caregiver_survey_wave_two88.rds"))
check("N88r the load scan's line goes through the stdout emitter: wider than the message it is laid out, and it runs as its one-line form does",
      local({ m <- .conv88("spss", printed(jload(file.path(.td88, "caregiver_survey_wave_two88.rds"))))
        b <- .r5_calls(.ln88(m), shape = "^  jdeclare_missing")
        d <- readRDS(file.path(.td88, "caregiver_survey_wave_two88.rds"))
        length(b) == 2L && all(grepl("\n      ", b, fixed = TRUE)) &&
          all(nchar(.ln88(m)) <= .pin_width) &&
          .cmp88(m, "caregiver_survey_wave_two88", d, cv = "spss", k = 1L) }))
unlink(.td88, recursive = TRUE)

# --- E: the riders -------------------------------------------------------------
l88 <- data.frame(x = haven::labelled(c(1, 2, 3, 2), labels = c(A = 1, B = 2, C = 3)),
                  w = c("Yes", "No", "Yes", "No"), stringsAsFactors = FALSE)
check("N88t the assign-or-lose reminder alone opens on its own line, no blank line before it (jrecode(), jencode(); Rule F, the S352 item)",
      startsWith(grab(jrecode(l88, x, map = "1=1; 2=2; 3=3")),
                 "Note: This call changes l88 only if you assign the result:\n") &&
        startsWith(grab(jencode(l88, w, map = "Yes=1; No=0")),
                   "Note: This call changes l88 only if you assign the result:\n"))
check("N88u after a note the reminder keeps its one blank line (jrecode(), jencode(), jsum(), javg())",
      local({ p88 <- data.frame(p = c(1, 2, 3), q = c(2, 3, 4))
        a <- grab(jrecode(p88, p, map = "1=10; else=copy"))
        b <- grab(jencode(l88, w))
        s <- grab(jsum(p88, p, q))
        v <- grab(javg(p88, p, q))
        grepl("^Note: No value labels assigned\\.", a) &&
          grepl("\n\nNote: This call changes p88 only", a, fixed = TRUE) &&
          grepl("\n\nNote: This call changes l88 only", b, fixed = TRUE) &&
          !startsWith(b, "\n") &&
          grepl("\n\nNote: jsum() returns the totals", s, fixed = TRUE) &&
          grepl("\n\nNote: javg() returns", v, fixed = TRUE) }))
check("N88v jencode() at the full level: an advisory note one blank line from the next advisory, from the notes block and from the reminder (they ran together)",
      .lvl88("full", local({
        d <- data.frame(R = c("Yes", "No", "Refused", NA, "Yes"), stringsAsFactors = FALSE)
        a <- .conv88("spss", grab(jencode(d, R, map = "Yes=1; No=2; Refused=3; Maybe=4; NA=-98")))
        b <- grab(jencode(l88, w, map = "Yes=1; No=0; Maybe=2"))
        c2 <- grab(jencode(l88, w, map = "Yes=1; No=0; Maybe=2; NA=9"))
        grepl("  \"Maybe\"\n\nNote: 1 NA value in 'R' was encoded as -98.", a, fixed = TRUE) &&
          grepl("  \"Maybe\"\n\nNote: This call changes l88", b, fixed = TRUE) &&
          grepl("  \"Maybe\"\n\nNote: 'w' contained no NA values", c2, fixed = TRUE) &&
          !startsWith(a, "\n") && !startsWith(b, "\n") })))
rm(list = intersect(c(".s88", ".wm88", ".conv88", ".lvl88", ".ln88", ".ws88", ".max88", ".cmp88",
                      "survey_responses88", "household_income88", "household_wave88",
                      "household_marks88", ".td88", "l88"),
                    ls(all.names = TRUE)))


# N79 (S337) -- NO PREMATURE BREAK, swept over every condition grab() took.
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
check(paste0("N79 no premature break: a line's first unit never fit on the ",
             "line above (", length(.sw), " conditions)"),
      length(.sw) >= 200L && length(.pb) == 0L)
if (length(.pb) > 0L) for (l in .pb) cat("        early: ", l, "\n")

# N80 (S337) -- EVERY RUNNABLE LINE PARSES (the S249 item's guard (3)).
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
# S355: the one line taken out here since S337 -- jconvert()'s missing-to
# error, a call with a note after it on the same line -- is the call alone
# now (the S337 item, Fix Slate W1), and the carve-out is gone.
check(paste0("N80 every runnable line in a message parses (", .un,
             " lines)"),
      .un >= 100L && length(.ub) == 0L)
if (length(.ub) > 0L) for (l in .ub) cat("        does not parse: ", l, "\n")

# =============================================================================
# N89 (S354) -- jconvert(): THE TARGET BEHIND THE DOTS. Fix Slate H, ruling A
# of the (S243) call-form item (Jeff, S354: "A"). Until v0.9.226 `to` was
# jconvert()'s second formal, the one data-first function with an option
# between the data and the variables, so jconvert(d, Education) bound
# Education to `to` -- R's "object 'Education' not found" -- and a workspace
# object of that name went in as the target, the whole frame converted in
# silence. Now jconvert(data, ..., to = NULL, vars = NULL, ...): the second
# argument is a variable, as in every data-first function, and the target is
# always named, as every printed line names it. A format name where a
# variable goes -- "stata", bare stata, or a name holding one -- stops with
# the line to run (ruling R16's pointer, Jeff's lean taken), keeping the other
# variables and modify = TRUE; a name the frame has is a variable whatever it
# is called. The frame-column rebuild names a positional target to = (filter_
# check.R I30). The six printed jconvert() lines put vars = before to =, the
# teaching form (N19b, N47b, N82g-h, N86ah-at, N87an-as re-pinned). Parts:
#   A  the variable forms: one, two, the juse() default, a workspace twin,
#      a quoted name, a column named like a format, a misspelling, no
#      convention (the four-target menu, as the bare call's), a misnamed to.
#   B  the pointer: quoted, bare, held in a name; the other variables and
#      modify = TRUE kept; the default frame named; every line run.
# =============================================================================
.d89 <- data.frame(Education = mk_spss(), Income = mk_spss(), Age = c(1, 2, 3, 4, 5))
# .under89(): the frame as the juse() default for one call, the entry default
# handed back (never juse(NULL), which would clear the user's own).
.under89 <- function(expr) {
  old <- getOption(".jst_default_data")
  options(.jst_default_data = ".d89")
  on.exit(options(.jst_default_data = old), add = TRUE)
  force(expr)
}
.conv89 <- function(cv, expr) {
  old <- getOption(".jst_options_missing_convention")
  options(.jst_options_missing_convention = cv)
  on.exit(options(.jst_options_missing_convention = old), add = TRUE)
  force(expr)
}
.c89 <- function(expr) .conv89("stata", grab(expr))
.ws89 <- function(x) gsub("[[:space:]]+", " ", x)
# .runs89(): the message's last indented line, run under a stata setting in a
# scratch environment holding .d89, and its VALUE returned (a pointer's line
# carries no assignment, so the frame it returns is what the user would
# keep); NULL if it errors.
.runs89 <- function(m) tryCatch({
  ln <- .r5_calls(strsplit(m, "\n", fixed = TRUE)[[1]])
  e  <- new.env(parent = globalenv()); assign(".d89", .d89, envir = e)
  .conv89("stata", suppressMessages(eval(parse(text = ln[length(ln)]), envir = e)))
}, error = function(err) NULL)
.tagged89 <- function(fr, v) !is.null(fr) && any(haven::is_tagged_na(fr[[v]]))

# --- A: the variable forms ---------------------------------------------------
check("N89a jconvert(.d89, Education): the second argument is a variable; Education alone converts, named in the notice, Income untouched",
      { m <- .c89(jconvert(.d89, Education))
        grepl("Converted to Stata-style missing values in 1 variable:\n  Education  -99", m, fixed = TRUE) &&
          !grepl("Income", m, fixed = TRUE) })
check("N89b jconvert(.d89, Education, Income): both convert",
      { m <- .c89(jconvert(.d89, Education, Income))
        grepl("in 2 variables:\n  Education  -99", m, fixed = TRUE) &&
          grepl("\n  Income     -99", m, fixed = TRUE) })
check("N89c under a juse() default, jconvert(Education, Income): both convert in the default frame",
      { m <- .under89(.c89(jconvert(Education, Income)))
        grepl("in 2 variables:", m, fixed = TRUE) && grepl(".d89 <- jconvert(.d89, ...)", m, fixed = TRUE) })
check("N89d a workspace object named Education holding \"spss\": the frame's variable wins (ruling R12), Education converts to the setting",
      { m <- local({ Education <- "spss"; .c89(jconvert(.d89, Education)) })
        grepl("in 1 variable:\n  Education  -99", m, fixed = TRUE) && !grepl("spss-form", m, fixed = TRUE) })
check("N89e jconvert(.d89, \"Education\"): a quoted variable name converts it",
      grepl("in 1 variable:\n  Education", .c89(jconvert(.d89, "Education")), fixed = TRUE))
check("N89f a column named stata is a variable, never a target",
      { .d89s <- .d89; .d89s$stata <- mk_spss()
        grepl("in 1 variable:\n  stata  -99", .c89(jconvert(.d89s, stata)), fixed = TRUE) })
check("N89g a misspelled variable gets the not-found sentence, as every data-first function gives it",
      identical(.c89(jconvert(.d89, Educaton)),
                "jconvert(): Educaton was not found in the .d89 data frame.\nCheck the spelling."))
check("N89h with no convention selected, jconvert(.d89, Education) gives the four-target menu, the same as jconvert(.d89)",
      { a <- .conv89("none", grab(jconvert(.d89, Education))); b <- .conv89("none", grab(jconvert(.d89)))
        grepl("no target format is selected, so nothing can be converted.", .ws89(a), fixed = TRUE) &&
          identical(a, b) })
check("N89i a misnamed to (t = \"spss\") no longer partial-matches: the unused-input stop",
      identical(.c89(jconvert(.d89, Education, t = "spss")), "jconvert(): unused input: t"))

# --- B: the pointer ----------------------------------------------------------
check("N89j jconvert(.d89, \"stata\"): the pointer, pinned whole, and its line converts the frame",
      { m <- .c89(jconvert(.d89, "stata"))
        identical(m, paste0("jconvert(): \"stata\" is a target format, not a variable.\n",
                            "Name the target with to =:\n",
                            "  jconvert(.d89, to = \"stata\")")) &&
          .tagged89(.runs89(m), "Income") })
check("N89k jconvert(.d89, stata), the bare word: the same pointer, the word unquoted",
      { m <- .c89(jconvert(.d89, stata))
        grepl("jconvert(): stata is a target format, not a variable.\nName the target with to =:\n  jconvert(.d89, to = \"stata\")", m, fixed = TRUE) &&
          .tagged89(.runs89(m), "Education") })
check("N89l a name holding a format, fmt <- \"spss\": \"fmt holds \\\"spss\\\", which is a target format\", the line to spss",
      { m <- local({ fmt <- "spss"; .c89(jconvert(.d89, fmt)) })
        grepl("jconvert(): fmt holds \"spss\", which is a target format, not\na variable.\nName the target with to =:\n  jconvert(.d89, to = \"spss\")", m, fixed = TRUE) &&
          is.data.frame(.runs89(m)) })
check("N89m the other variables and modify = TRUE are kept: jconvert(.d89, Education, \"sas\", modify = TRUE)",
      { m <- .c89(jconvert(.d89, Education, "sas", modify = TRUE))
        grepl("\n  jconvert(.d89, Education, to = \"sas\", modify = TRUE)", m, fixed = TRUE) &&
          .tagged89(.runs89(m), "Education") })
check("N89n under a juse() default the line names the frame: jconvert(Income, \"spss\") offers jconvert(.d89, Income, to = \"spss\")",
      { m <- .under89(.c89(jconvert(Income, "spss")))
        grepl("\n  jconvert(.d89, Income, to = \"spss\")", m, fixed = TRUE) })
check("N89o a name holding a variable's name is not a pointer: fmt <- \"Education\" gets the not-found sentence",
      identical(local({ fmt <- "Education"; .c89(jconvert(.d89, fmt)) }),
                "jconvert(): fmt was not found in the .d89 data frame.\nCheck the spelling."))
rm(.d89, .conv89, .under89, .c89, .ws89, .runs89, .tagged89)

# =============================================================================
# N90 (S355) -- FIX SLATE W1: THE MISSING-VALUE MESSAGES, REWORDED. Sixteen
# conformance-only items on a slate Jeff approved (leans 2 and 3 okayed at the
# start; lean 1 settled as ruling R18 in the session's names discussion), each
# message pinned whole or by the sentence that changed, and every line a
# message now offers RUN. Parts:
#   A  "argument" (S282, voice Rule B): convention = named where "remove the
#      argument" stood, in jdeclare_missing()'s four guards; jplot()'s
#      extra-inputs stop names the inputs.
#   B  "(Option C)" / "(Option A ...)" (S282): each form said for what it is.
#   C  the jsave() refusals' verb, "carries" (S282); the bare-marker note's
#      placeholder, MyLabel, said as one (S282).
#   D  one vocabulary for the mixed-marker guard and note (S267).
#   E  the no-target refusal, its token quoted (S256).
#   F  the parse layer phrased by the setting (S240, lean 2): SAS-style and .A
#      through .Z under sas or a per-call sas; "marker", never "token"; no
#      "lowercase"; the word missing among the new-value forms.
#   G  finding 3 (S219): no jconvert() internals in the SPSS-column refusal.
#   H  joptions()' codes-length refusal: the reason and a line (S314).
#   I  jconvert()'s missing-to error: the joptions() line alone (S337; N80's
#      carve-out is gone).
#   J  "every variable" (S339).
#   K  names typed bare in vars = (S351; ruling R18): the call rebuilt with the
#      names after the data frame, a workspace object of a variable's name
#      never read; named twice, once.
#   L  one form for a value and its label (S319): jconvert()'s Pattern A list
#      and the load scan's label-only rows; Pattern A's fix as a line.
#   M  the map values the data lack, one note (S352).
#   N  a label holding a quotation mark, escaped in every printed labels
#      string (S353).
# jencode_check.R N49 holds jencode()'s twins (the no-target refusal, its
# parse layer, its NA note on a marked variable); filter_check.R section X the
# resolver's no-frame message.
# =============================================================================
.spd90  <- data.frame(V = haven::labelled_spss(c(1, 2, -99, 3), labels = c(Refused = -99), na_values = -99))
.spd90b <- data.frame(V = haven::labelled_spss(c(1, -98, -99, 3), labels = c(Refused = -99, DK = -98),
                                               na_values = c(-99, -98)))
.mix90  <- data.frame(V = c(1, 2, haven::tagged_na("a"), haven::tagged_na("B"), 3, -99))
.hb90   <- data.frame(P = c(1, haven::tagged_na("a"), 2))
.x90    <- data.frame(x = c(1, 2, 3, 2))
.pa90   <- data.frame(Q = haven::labelled(c(1, 2, 9, 9, 3), labels = c("Not asked" = 9)),
                      A = haven::labelled_spss(c(1, -99, 3, 4, 5), na_values = -99),
                      B = haven::labelled_spss(c(2, 3, -99, 1, 1), na_values = -99))
.qd90   <- data.frame(V = haven::labelled(c(1, 2, haven::tagged_na("a"), -99, 3),
                      labels = c(Skipped = haven::tagged_na("a"), "Said \"no\"" = -99)))
.fd90   <- data.frame(y = c(1, 3, 2, 5, 4), x = c(2, 1, 4, 3, 5))
.fe90   <- .fd90
.conv90 <- function(cv, expr) {
  old <- getOption(".jst_options_missing_convention")
  options(.jst_options_missing_convention = cv)
  on.exit(options(.jst_options_missing_convention = old), add = TRUE)
  force(expr)
}
.lvl90 <- function(lv, expr) {
  old <- getOption(".jst_output_level")
  options(.jst_output_level = lv)
  on.exit(options(.jst_output_level = old), add = TRUE)
  force(expr)
}
# .under90(): a frame as the juse() default for one call, the entry default
# handed back (never juse(NULL), which would clear the user's own).
.under90 <- function(nm, expr) {
  old <- getOption(".jst_default_data")
  options(.jst_default_data = nm)
  on.exit(options(.jst_default_data = old), add = TRUE)
  force(expr)
}
.calls90 <- function(m) .r5_calls(strsplit(m, "\n", fixed = TRUE)[[1]])
# .run90(): a printed line run in an environment holding the fixtures, under a
# convention; its value, or NULL if it errors.
.run90 <- function(ln, cv = "stata", env = new.env(parent = globalenv())) {
  for (nm in c(".spd90", ".pa90", ".qd90", ".hb90", ".x90"))
    if (!exists(nm, envir = env, inherits = FALSE)) assign(nm, get(nm), envir = env)
  tryCatch(.conv90(cv, suppressMessages(eval(parse(text = ln), envir = env))),
           error = function(err) NULL)
}
# .pin90(): a message pinned whole. The pins were FILLED BY RUNNING the
# section on v0.9.228 (n90/fill), never typed.
.pin90 <- function(id, got) identical(got, .pins90[[id]])
.pins90 <- list(
  N90a = paste0(
    "jdeclare_missing(): 'V' already carries SPSS-style missing values;\n",
    "cannot use convention = \"stata\" here.\n",
    "To follow the column's form, drop convention = \"stata\":\n",
    "  jdeclare_missing(.spd90, V, codes = c(-98))\n",
    "Or convert the column first:\n",
    "  jconvert(.spd90, vars = \"V\", to = \"stata\", modify = TRUE)"),
  N90b = paste0(
    "jdeclare_missing(): 'V' already carries SPSS-style missing values;\n",
    "cannot use convention = \"stata\" here.\n",
    "To follow the column's form, drop convention = \"stata\" from the call.\n",
    "Or convert the column first:\n",
    "  jconvert(.spd90, vars = \"V\", to = \"stata\", modify = TRUE)"),
  N90c = paste0(
    "jdeclare_missing(): 'V' carries both Stata-style (.a) and SAS-style\n",
    "(.B) missing values, which SPSS convention cannot act on.\n",
    "This call sets convention = \"spss\", but your missing.convention setting is\n",
    "\"stata\". To use the setting, drop convention = \"spss\":\n",
    "  jdeclare_missing(.mix90, V, codes = c(-99))"),
  N90d = paste0(
    "jdeclare_missing(): 'V' carries both Stata-style (.a) and SAS-style\n",
    "(.B) missing values, which SPSS convention cannot act on.\n",
    "This call sets convention = \"spss\", but your missing.convention setting is\n",
    "\"stata\". To use the setting, drop convention = \"spss\" from the call."),
  N90e = paste0(
    "jplot(): only one data frame goes after the formula, and this call\n",
    "gives .fd90 and .fe90.\n",
    "Specify the data frame once, after the formula."),
  N90h = paste0(
    "jdeclare_missing(): `codes` names some of its codes and not others.\n",
    "Name every code, as in codes = c(Refused = -99, Unknown = -98), or name none\n",
    "and give the labels with labels =."),
  N90i = paste0(
    "jdeclare_missing(): the codes are labeled twice: by their names in\n",
    "`codes` and by `labels`. Use one: the names, as in codes = c(Refused = -99),\n",
    "or labels = with codes that carry no names."),
  N90l = paste0(
    "Note: jdeclare_missing made no change to P. Its markers are already missing\n",
    "values, so a bare marker has nothing to name.\n",
    "To name one, put its label in place of MyLabel:\n",
    "  .hb90 <- jdeclare_missing(.hb90, P, codes = c(MyLabel = \".a\"))"),
  N90n = paste0(
    "jdeclare_missing(): 'V' carries both Stata-style (.a) and SAS-style\n",
    "(.B) missing values, which SPSS convention cannot act on.\n",
    "Set convention = \"stata\" or convention = \"sas\" on this call."),
  N90p = paste0(
    "jrecode(): labels names 'missing', but the map has no target for it.\n",
    "Add 'missing' to the map (for example '8=missing'), or label the\n",
    "value directly."),
  N90q = paste0(
    "jrecode(): Error in map argument: Invalid new value '.AA' in map\n",
    "rule '1=.AA'. SAS-style missing-value markers are '.A' through '.Z' (one\n",
    "letter after a period). The NA(a) longhand is not supported in the\n",
    "map argument."),
  N90r = paste0(
    "jrecode(): Error in map argument: Invalid else action '.zz' in map\n",
    "argument. Stata-style missing-value markers are '.a' through '.z' (one\n",
    "letter after a period). The NA(a) longhand is not supported in the\n",
    "map argument."),
  N90s = paste0(
    "jrecode(): Error in map argument: Invalid else action 'foo' in map\n",
    "argument. Use 'else=NA', 'else=copy', or a SAS-style missing-value marker\n",
    "such as 'else=.A' (Stata or SAS convention only)."),
  N90t = paste0(
    "jrecode(): Error in map argument: Invalid new value 'foo' in map\n",
    "rule '1=foo'. New values must be numeric, the word missing, a system-NA\n",
    "alias (NA, System, or SYSMIS), or a Stata-style missing-value marker (.a\n",
    "through .z)."),
  N90u = paste0(
    "jrecode(): Error in map argument: Invalid old value 'foo' in map\n",
    "rule 'foo=1'. Old values must be numeric, a system-NA alias (NA, System, or\n",
    "SYSMIS), or a SAS-style missing-value marker (.A through .Z)."),
  N90v = paste0(
    "jdeclare_missing(): Invalid code 'abc'. Codes must be numbers (for\n",
    "example -99) or SAS-style markers (.A through .Z)."),
  N90w = paste0(
    "jrelabel(): Error in labels argument: Invalid value '.AB' in label\n",
    "rule '.AB=Skip'. SAS-style missing-value markers are '.A' through '.Z' (one\n",
    "letter after a period). The NA(a) longhand is not supported in the\n",
    "labels argument."),
  N90x = paste0(
    "jrelabel(): Error in labels argument: Invalid value 'foo' in label\n",
    "rule 'foo=Skip'. The left side of each label rule must be numeric or a\n",
    "Stata-style missing-value marker (.a through .z)."),
  N90ac = paste0(
    "joptions(): missing.convention.codes takes at most 3 codes, the most\n",
    "SPSS allows on a variable, and this call gives 4.\n",
    "To keep the first three:\n",
    "  joptions(missing.convention.codes = c(-99, -98, -97))"),
  N90ad = paste0(
    "joptions(): missing.convention.codes needs at least one code,\n",
    "for example:\n",
    "  joptions(missing.convention.codes = c(-99, -98, -97))"),
  N90ah = paste0(
    "jconvert(): vars = takes names in quotes. To name the variables\n",
    "without quotes, list them after the data frame:\n",
    "  jconvert(.pa90, A, B, to = \"stata\", modify = TRUE)"),
  N90aj = paste0(
    "jdeclare_missing(): vars = takes names in quotes.\n",
    "To name the variables without quotes, list them after the data frame:\n",
    "  jdeclare_missing(.pa90, A, codes = -99)"),
  N90al = paste0(
    "jconvert(): Zed was not found in the .pa90 data frame.\n",
    "Check the spelling."),
  N90am = paste0(
    "jconvert(): vars = takes names in quotes. To name the variables\n",
    "without quotes, list them first:\n",
    "  jconvert(A, B, to = \"stata\")"),
  N90an = paste0(
    "jconvert(): the variables are named twice: after the data frame and\n",
    "in vars =. Name them in one place:\n",
    "  jconvert(.pa90, A, B, to = \"stata\")"),
  N90ar = paste0(
    "Skipped (value labels suggest missingness but not formally declared):\n",
    "  Q: 9 [\"Not asked\"]\n",
    "\n",
    "To declare it as missing:\n",
    "  jdeclare_missing(.pa90, Q, codes = 9, convention = \"stata\", modify = TRUE)\n",
    "To leave it as ordinary data, no action is needed.\n",
    ""),
  N90aw = paste0(
    "Note: 'x' contained none of the map values 7 and 8 -- nothing was\n",
    "recoded for them.\n",
    "\n",
    "Note: No value labels assigned. To add labels, use jrelabel().\n",
    "\n",
    "Note: This call changes .x90 only if you assign the result:\n",
    "  .x90$<name> <- jrecode(...)\n",
    "To check the recode landed correctly, compare jfreq() on the original and\n",
    "the new column.\n",
    "")
)

# --- A: "argument" (S282, voice Rule B) ---------------------------------------
.m90a <- .conv90("spss", grab(jdeclare_missing(.spd90, V, codes = -98, convention = "stata")))
.m90b <- .conv90("spss", grab(jdeclare_missing(.spd90, V, codes = -98, labels = "-98=Skip", convention = "stata")))
.m90c <- .conv90("stata", grab(jdeclare_missing(.mix90, V, codes = -99, convention = "spss")))
.m90d <- .conv90("stata", grab(jdeclare_missing(.mix90, V, codes = -99, labels = "-99=R", convention = "spss")))
.m90e <- grab(jplot(y ~ x, .fd90, .fe90))
check("N90a per-call convention against the column's form, the call echoed: the convention named where \"remove the argument\" stood (pinned whole)",
      .pin90("N90a", .m90a))
check("N90b ... the prose fallback, labels given: \"drop convention = ... from the call\" (pinned whole)",
      .pin90("N90b", .m90b))
check("N90c the mixed-marker guard, a stata setting and convention = \"spss\", echoed: \"To use the setting, drop convention = \"spss\":\" (pinned whole)",
      .pin90("N90c", .m90c))
check("N90d ... and its prose fallback (pinned whole)",
      .pin90("N90d", .m90d))
check("N90e jplot() given two data frames after the formula names both, where it said \"Extra positional arguments were supplied\" (pinned whole)",
      .pin90("N90e", .m90e))
check("N90f none of the five says \"argument\"",
      !any(grepl("argument", c(.m90a, .m90b, .m90c, .m90d, .m90e), fixed = TRUE)))
check("N90g the echoed call runs: the column keeps its own form and declares -98",
      local({ r <- .run90(.calls90(.m90a)[1], "spss")
        is.data.frame(r) && -98 %in% attr(r$V, "na_values") }))

# --- B: "(Option C)" / "(Option A ...)" (S282) ----------------------------------------
.m90h <- .conv90("spss", grab(jdeclare_missing(.spd90, V, codes = c(Refused = -99, -98))))
.m90i <- .conv90("spss", grab(jdeclare_missing(.spd90, V, codes = c(Refused = -99), labels = "-99=Refused")))
check("N90h codes partly named: each form said for what it is (pinned whole)",
      .pin90("N90h", .m90h))
check("N90i names and labels = both: the two forms said (pinned whole)",
      .pin90("N90i", .m90i))
check("N90j no help-page option names in either",
      !any(grepl("Option", c(.m90h, .m90i), fixed = TRUE)))

# --- C: the jsave() verbs; the invented label (S282) ---------------------------------
.m90k <- c(.conv90("stata", grab(jsave(.spd90, tempfile(fileext = ".dta")))),
           grab(jsave(.hb90, tempfile(fileext = ".sav"))),
           grab(jsave(.hb90, tempfile(fileext = ".xpt"))))
check("N90k the three jsave() refusals share one verb: .dta, .sav and .xpt each say \"1 variable carries\"",
      length(.m90k) == 3L && all(grepl("1 variable carries ", .m90k, fixed = TRUE)) &&
        !any(grepl("contain", .m90k, fixed = TRUE)))
# The no-change note is printed (stdout), not signalled: printed(), not grab().
.m90l <- .conv90("stata", printed(jdeclare_missing(.hb90, P, codes = ".a")))
check("N90l a bare marker: the scaffold's placeholder is MyLabel, said to be one (pinned whole)",
      .pin90("N90l", .m90l))
check("N90m ... and the scaffold runs: .a is named MyLabel",
      local({ e <- new.env(parent = globalenv()); .run90(.calls90(.m90l)[1], "stata", e)
        lab <- labelled::val_labels(get(".hb90", envir = e)$P)
        identical(names(lab), "MyLabel") && identical(haven::na_tag(unname(lab)), "a") }))

# --- D: one vocabulary for the mixed-marker guard and note (S267) ---------------------
check("N90n the mixed-marker guard names the markers the cells carry, as the note does (pinned whole)",
      .pin90("N90n", .conv90("spss", grab(jdeclare_missing(.mix90, V, codes = -99)))))
check("N90o the mixed-marker note says \"missing values\", the guard's words, not \"missing-value markers\"",
      local({ m <- .conv90("stata", printed(jdeclare_missing(.mix90, V, codes = -99, convention = "sas")))
        grepl("Note: V carries both Stata-style (.a) and SAS-style (.A, .B) missing values.", .fl(m), fixed = TRUE) &&
          !grepl("missing-value markers", m, fixed = TRUE) }))

# --- E: the no-target refusal (S256) ---------------------------------------------------
check("N90p jrecode(): labels names 'missing' and the map has no target: the token quoted three times, \"to label\" gone (pinned whole)",
      .pin90("N90p", grab(jrecode(.x90, x, map = "1=0; else=copy", labels = "missing=Refused"))))

# --- F: the parse layer, phrased by the setting (S240, lean 2) -------------------------
.parse90 <- function(cv) .conv90(cv, c(
  grab(jrecode(.x90, x, map = "1=.AA; else=copy")),
  grab(jrecode(.x90, x, map = "1=.a; else=.zz")),
  grab(jrecode(.x90, x, map = "1=1; else=foo")),
  grab(jrecode(.x90, x, map = "1=foo; else=copy")),
  grab(jrecode(.x90, x, map = "foo=1; else=copy")),
  grab(jdeclare_missing(.x90, x, codes = ".1")),
  grab(jdeclare_missing(.x90, x, codes = "abc")),
  grab(jrelabel(.x90, x, labels = ".AB=Skip")),
  grab(jrelabel(.x90, x, labels = "foo=Skip"))))
.p90sas <- .parse90("sas")
.p90st  <- .parse90("stata")
check("N90q under sas a malformed marker in a rule is SAS-style, '.A' through '.Z' (pinned whole)",
      .pin90("N90q", .p90sas[1]))
check("N90r under stata the same sentence is Stata-style, '.a' through '.z' (pinned whole)",
      .pin90("N90r", .p90st[2]))
check("N90s an else word that is no action: the marker example in the setting's case, \"(Stata or SAS convention only)\" (pinned whole)",
      .pin90("N90s", .p90sas[3]))
check("N90t a new value that is no value: the forms listed include the word missing (pinned whole)",
      .pin90("N90t", .p90st[4]))
check("N90u an old value that is no value, under sas (pinned whole)",
      .pin90("N90u", .p90sas[5]))
check("N90v a code that is neither, under sas: numbers or SAS-style markers (pinned whole)",
      .pin90("N90v", .p90sas[7]))
check("N90w jrelabel(), a malformed marker on a label's left side, under sas (pinned whole)",
      .pin90("N90w", .p90sas[8]))
check("N90x jrelabel(), a left side that is neither, under stata (pinned whole)",
      .pin90("N90x", .p90st[9]))
check("N90y a per-call convention = \"sas\" over a stata setting phrases a bad code SAS-style",
      grepl("SAS-style missing-value markers are '.A' through '.Z' (one letter after a period).",
            .fl(.conv90("stata", grab(jdeclare_missing(.x90, x, codes = ".1", convention = "sas")))), fixed = TRUE))
check("N90z no parse-layer error says \"token\" or \"lowercase\", under any setting; with none, Stata-style as before",
      local({ m <- c(.parse90("none"), .parse90("spss"), .p90st, .p90sas)
        length(m) == 36L && all(nzchar(m)) && !any(grepl("token|lowercase", m)) &&
          grepl("Stata-style missing-value markers are '.a' through '.z'", .fl(.parse90("none")[1]), fixed = TRUE) }))
check("N90bc the same new-value list at the NA rule (jrecode, 'NA=foo') and in jencode()'s text map ('Yes=foo'): the word missing, the setting's marker style",
      local({ s <- "New values must be numeric, the word missing, a system-NA alias (NA, System, or SYSMIS), or a "
        a <- .fl(.conv90("stata", grab(jrecode(.x90, x, map = "NA=foo; else=copy"))))
        b <- .fl(.conv90("sas", grab(jencode(data.frame(s = c("Yes", "No"), stringsAsFactors = FALSE),
                                                s, map = "Yes=foo; No=0"))))
        grepl("rule 'NA=foo'.", a, fixed = TRUE) &&
          grepl(paste0(s, "Stata-style missing-value marker (.a through .z)."), a, fixed = TRUE) &&
          grepl("rule 'Yes=foo'.", b, fixed = TRUE) &&
          grepl(paste0(s, "SAS-style missing-value marker (.A through .Z)."), b, fixed = TRUE) }))

# --- G: finding 3 (S219) ------------------------------------------------------------
check("N90aa one code: \"The numeric code above is V's declared missing value.\", nothing on ordering",
      local({ m <- .fl(.conv90("stata", grab(jdeclare_missing(.spd90, V, codes = ".a"))))
        grepl("The numeric code above is V's declared missing value.", m, fixed = TRUE) &&
          !grepl("jconvert() uses", m, fixed = TRUE) && !grepl("magnitude", m, fixed = TRUE) }))
check("N90ab two codes: the pairing said for what it is, with no jconvert() internals",
      local({ m <- .fl(.conv90("stata", grab(jdeclare_missing(.spd90b, V, codes = c(Refused = ".a", DK = ".b")))))
        grepl("are V's declared missing values, paired with the markers in order of magnitude, largest first.", m, fixed = TRUE) &&
          !grepl("jconvert() uses", m, fixed = TRUE) }))

# --- H: joptions()' codes-length refusal (S314) -----------------------------------------
.m90ac <- grab(joptions(missing.convention.codes = c(-99, -98, -97, -96)))
check("N90ac four codes: SPSS's limit given as the reason, and the first three offered (pinned whole)",
      .pin90("N90ac", .m90ac))
check("N90ad no codes: at least one, with an example (pinned whole)",
      .pin90("N90ad", grab(joptions(missing.convention.codes = numeric(0)))))
check("N90ae the offered line runs and sets the three codes",
      local({ old <- getOption(".jst_options_missing_convention_codes")
        on.exit(options(.jst_options_missing_convention_codes = old), add = TRUE)
        invisible(.run90(.calls90(.m90ac)[1]))
        identical(as.numeric(getOption(".jst_options_missing_convention_codes")), c(-99, -98, -97)) }))

# --- I: jconvert()'s missing-to error (S337) ---------------------------------------------
check("N90af the joptions() line stands alone as the message's last line, and parses; the choices are in the sentence",
      local({ m <- .conv90("none", grab(jconvert(.spd90)))
        endsWith(m, '\n  joptions(missing.convention = "stata")') &&
          endsWith(.fl(m), 'choose a convention ("stata", "spss" or "sas"): joptions(missing.convention = "stata")') &&
          !inherits(try(parse(text = 'joptions(missing.convention = "stata")'), silent = TRUE), "try-error") }))

# --- J: every variable (S339) -------------------------------------------------------------
check("N90ag jdeclare_missing() given no variables: \"every variable\" and \"use vars = names(...)\", with no \"column\", \"pass\" or \"explicitly\"",
      local({ m <- .fl(.conv90("spss", grab(jdeclare_missing(.spd90, codes = -99))))
        grepl("To apply one declaration to every variable, use vars = names(.spd90).", m, fixed = TRUE) &&
          !grepl("every column|pass |explicitly", m) }))

# --- K: names typed bare in vars = (S351; ruling R18) -------------------------------------
.m90ah <- .conv90("stata", grab(jconvert(.pa90, to = "stata", vars = c(A, B), modify = TRUE)))
check("N90ah jconvert(vars = c(A, B)) bare: the call rebuilt with the names after the data frame, every other argument kept (pinned whole)",
      .pin90("N90ah", .m90ah))
check("N90ai ... and the line runs: A and B convert, Q is left as it was",
      local({ r <- .run90(.calls90(.conv90("stata", grab(jconvert(.pa90, to = "stata", vars = c(A, B)))))[1], "stata")
        is.data.frame(r) && identical(r$Q, .pa90$Q) &&
          any(haven::is_tagged_na(r$A)) && any(haven::is_tagged_na(r$B)) }))
.m90aj <- .conv90("spss", grab(jdeclare_missing(.pa90, vars = A, codes = -99)))
check("N90aj jdeclare_missing(vars = A): one bare name, the same stop (pinned whole)",
      .pin90("N90aj", .m90aj))
check("N90ak ... and its line runs: -99 declared on A",
      local({ r <- .run90(.calls90(.m90aj)[1], "spss")
        is.data.frame(r) && -99 %in% attr(r$A, "na_values") }))
check("N90al a bare name the data frame lacks gets the not-found sentence (pinned whole)",
      .pin90("N90al", .conv90("stata", grab(jconvert(.pa90, to = "stata", vars = c(A, Zed))))))
check("N90am under a juse() default the names go first (pinned whole)",
      .pin90("N90am", .under90(".pa90", .conv90("stata", grab(jconvert(to = "stata", vars = c(A, B)))))))
.m90an <- .conv90("stata", grab(jconvert(.pa90, A, vars = "B", to = "stata")))
check("N90an named both ways: said, and the call given with each variable named once after the data frame (pinned whole)",
      .pin90("N90an", .m90an))
check("N90ao ... and that line runs",
      is.data.frame(.run90(.calls90(.m90an)[1], "stata")))
check("N90ap a stored list of names still works: vars = .vars90 holding \"A\" and \"B\" declares on both",
      local({ assign(".vars90", c("A", "B"), envir = globalenv())
        on.exit(rm(".vars90", envir = globalenv()), add = TRUE)
        r <- .conv90("spss", suppressMessages(jdeclare_missing(.pa90, vars = .vars90, codes = -99)))
        -99 %in% attr(r$A, "na_values") && -99 %in% attr(r$B, "na_values") }))
check("N90bd a workspace object named like a variable is never read: with A and B in the caller's environment holding names, vars = c(A, B) and vars = A get the same stops (ruling R18; found entering dirty)",
      local({ A <- "Q"; B <- c("Q", "A")
        identical(.conv90("stata", grab(jconvert(.pa90, to = "stata", vars = c(A, B), modify = TRUE))), .m90ah) &&
          identical(.conv90("spss", grab(jdeclare_missing(.pa90, vars = A, codes = -99))), .m90aj) }))
check("N90aq data given as an expression: the rebuilt line names mydata, after the line that makes it",
      local({ .mk90 <- function() .pa90
        m <- .conv90("stata", grab(jconvert(.mk90(), to = "stata", vars = c(A, B))))
        grepl('\n  mydata <- .mk90()\n  jconvert(mydata, A, B, to = "stata")', m, fixed = TRUE) }))

# --- L: one form for a value and its label; Pattern A's fix (S319) -----------------------
.m90ar <- .conv90("none", grab(jconvert(.pa90, Q, to = "stata")))
check("N90ar jconvert()'s Pattern A list in the bracketed form, and the line that declares it, convention = in it when no setting is chosen (pinned whole)",
      .pin90("N90ar", .m90ar))
check("N90as under to = \"baseR\" the lead says to run the conversion again; with no setting the line declares under spss",
      grepl('To declare it as missing, then run the conversion again:\n  jdeclare_missing(.pa90, Q, codes = 9, convention = "spss", modify = TRUE)',
            .conv90("none", grab(jconvert(.pa90, Q, to = "baseR"))), fixed = TRUE))
check("N90at a setting that is the target: the line carries no convention =",
      grepl("To declare it as missing:\n  jdeclare_missing(.pa90, Q, codes = 9, modify = TRUE)",
            .conv90("stata", grab(jconvert(.pa90, Q, to = "stata"))), fixed = TRUE))
check("N90au the line runs: Q's 9 becomes a marker, its label kept",
      local({ e <- new.env(parent = globalenv())
        .run90(grep("^jdeclare_missing\\(", .calls90(.m90ar), value = TRUE)[1], "none", e)
        q <- get(".pa90", envir = e)$Q
        any(haven::is_tagged_na(q)) && "Not asked" %in% names(labelled::val_labels(q)) }))
check("N90av the load scan's label-only rows take the same form: -99 [\"Refused\"] (2)",
      local({ f <- tempfile(fileext = ".sav")
        haven::write_sav(data.frame(Q = haven::labelled(c(1, 2, -99, -99, 3), labels = c(Refused = -99))), f)
        m <- .conv90("none", paste(utils::capture.output(invisible(grab(jload(f, name = ".ld90")))), collapse = "\n"))
        if (exists(".ld90", envir = globalenv())) rm(".ld90", envir = globalenv())
        grepl('Q:  -99 ["Refused"] (2)', m, fixed = TRUE) && !grepl('-99 "Refused"', m, fixed = TRUE) }))

# --- M: the map values the data lack (S352) -------------------------------------------------
check("N90aw two map values the data lack: one note naming both, at full (pinned whole)",
      .pin90("N90aw", .lvl90("full", grab(jrecode(.x90, x, map = "1=0; 7=1; 8=2; 2=1; else=copy")))))
check("N90ax one: in the singular, \"the map value 7\" and \"for it\"",
      grepl("Note: 'x' did not contain the map value 7 -- nothing was recoded for it.",
            .fl(.lvl90("full", grab(jrecode(.x90, x, map = "1=0; 7=1; else=copy")))), fixed = TRUE))

# --- N: a label holding a quotation mark (S353) ----------------------------------------------
.m90ay <- .conv90("stata", grab(jdeclare_missing(.qd90, V, codes = -99)))
check("N90ay jdeclare_missing()'s marker refusal offers a labels string with the quotation marks escaped",
      grepl('labels = ".b=Said \\"no\\""', .m90ay, fixed = TRUE))
check("N90az ... and the line runs, .b labeled as the label was: Said \"no\"",
      local({ e <- new.env(parent = globalenv()); .run90(.calls90(.m90ay)[1], "stata", e)
        lab <- labelled::val_labels(get(".qd90", envir = e)$VR)
        'Said "no"' %in% names(lab) && identical(haven::na_tag(unname(lab[names(lab) == 'Said "no"'])), "b") }))
check("N90ba .jst_dq_escape(): a quotation mark and a backslash both survive the parser",
      local({ x <- c('Said "no"', "a\\b", "plain")
        identical(eval(parse(text = paste0("c(", paste0('"', .jst_dq_escape(x), '"', collapse = ", "), ")"))), x) }))
check("N90bb .jst_marker_recode_line() escapes a label it is given",
      grepl('labels = ".b=Said \\"no\\""', .jst_marker_recode_line(".qd90", "V", -99, "stata", "a", labels = 'Said "no"'), fixed = TRUE))
rm(.spd90, .spd90b, .mix90, .hb90, .x90, .pa90, .qd90, .fd90, .fe90, .conv90, .lvl90,
   .under90, .calls90, .run90, .pin90, .pins90, .parse90, .p90sas, .p90st,
   list = ls(pattern = "^\\.m90", all.names = TRUE))

# =============================================================================
# N91 (S356) -- THE NAMES SLATE AT THE RECODE FAMILY, AND RULING R17: A LABEL
# HOLDING A SEMICOLON. Parts:
#   A  ruling R18 (c): a bare word where a quoted value goes -- to = stata,
#      convention = spss -- gets jload()'s form with the call to run; a name
#      holding a value still works.
#   B  ruling R17 (Jeff, S356), the parser: a label may be quoted, with
#      either mark, right after its equals sign, and a semicolon or an
#      equals sign inside the quotes is part of the label; the SPSS and
#      Stata habit, 1='Yes', gives Yes where it gave 'Yes' with the marks;
#      an unquoted label reads as it is written, a quotation mark partway
#      through included; a quote opened and never closed stops.
#   C  the lines the package offers: a label holding a semicolon is quoted
#      in every printed labels string (with the mark it lacks), and the
#      line runs; a label no string can carry is left out, with the
#      sentence that says so; a user's quoted label passes through ruling
#      R8's builder whole; ruling R5's layout never breaks inside a quoted
#      label.
# jencode_check.R N50 holds jencode()'s twins. Fixtures dotted; working
# objects in local().
# =============================================================================
.spd91 <- data.frame(V = haven::labelled_spss(c(1, 2, -99, 3), labels = c(Refused = -99), na_values = -99))
.x91   <- data.frame(x = c(1, 2, 3, 2))
.e91   <- data.frame(Q = c(1, 2, 9, 1))
.qd91  <- data.frame(V = haven::labelled(c(1, 2, haven::tagged_na("a"), -99, 3),
                     labels = c(Skipped = haven::tagged_na("a"), "Refused; not asked" = -99)))
.qe91  <- data.frame(V = haven::labelled(c(1, 2, haven::tagged_na("a"), -99, 3),
                     labels = c(Skipped = haven::tagged_na("a"), "Refused; \"no\"" = -99)))
.qf91  <- data.frame(V = haven::labelled(c(1, 2, haven::tagged_na("a"), -99, -98, 3),
                     labels = c(Skipped = haven::tagged_na("a"), "Don't; \"no\"" = -99, Refused = -98)))
.qg91  <- data.frame(V = haven::labelled(c(1, 2, haven::tagged_na("a"), -99, -98, -97, 3),
                     labels = c(Skipped = haven::tagged_na("a"),
                                "Refused to answer; interviewer moved on" = -99,
                                "Not applicable; skipped by design" = -98, "Don't know" = -97)))
.hb91  <- data.frame(P = c(1, haven::tagged_na("a"), 2, -99))
.qh91  <- data.frame(V = haven::labelled(c(1, 2, haven::tagged_na("a"), -99, -98, -97, 3),
                     labels = c(Skipped = haven::tagged_na("a"),
                                "Refused to answer; interviewer moved on" = -99,
                                "Other; specify" = -98, "Don't know" = -97)))
.conv91 <- function(cv, expr) {
  old <- getOption(".jst_options_missing_convention")
  options(.jst_options_missing_convention = cv)
  on.exit(options(.jst_options_missing_convention = old), add = TRUE)
  force(expr)
}
.calls91 <- function(m) .r5_calls(strsplit(m, "\n", fixed = TRUE)[[1]])
.run91 <- function(ln, cv = "stata") {
  e <- new.env(parent = globalenv())
  for (nm in c(".qd91", ".qe91", ".qf91", ".qg91", ".qh91", ".hb91", ".spd91"))
    assign(nm, get(nm), envir = e)
  ok <- tryCatch(.conv91(cv, { suppressMessages(eval(parse(text = ln), envir = e)); TRUE }),
                 error = function(err) FALSE)
  list(ok = ok, env = e)
}
.labs91 <- function(expr) names(labelled::val_labels(suppressMessages(expr)))
# --- A: a bare word where a quoted value goes ----------------------------------
check("N91a jconvert(d, to = stata): the pointer with the call to run (pinned whole); it was R's \"object 'stata' not found\"",
      identical(grab(jconvert(.spd91, to = stata)),
                "jconvert(): stata is not in quotes.\nto = takes a format name in quotes:\n  jconvert(.spd91, to = \"stata\")"))
check("N91b ... the value spelled as the function takes it, the other arguments kept: to = SAS with a variable and modify = TRUE",
      identical(grab(jconvert(.spd91, V, to = SAS, modify = TRUE)),
                "jconvert(): SAS is not in quotes.\nto = takes a format name in quotes:\n  jconvert(.spd91, V, to = \"sas\", modify = TRUE)"))
check("N91c convention = stata in jrecode(), Stata in jencode(), spss in jdeclare_missing() (pinned whole)",
      identical(grab(jrecode(.x91, x, map = "1=.a; else=copy", convention = stata)),
                "jrecode(): stata is not in quotes.\nconvention = takes a convention name in quotes:\n  jrecode(.x91, x, map = \"1=.a; else=copy\", convention = \"stata\")") &&
        identical(grab(jencode(.e91, Q, convention = Stata)),
                  "jencode(): Stata is not in quotes.\nconvention = takes a convention name in quotes:\n  jencode(.e91, Q, convention = \"stata\")") &&
        identical(grab(jdeclare_missing(.spd91, V, codes = -98, convention = spss)),
                  "jdeclare_missing(): spss is not in quotes.\nconvention = takes a convention name in quotes:\n  jdeclare_missing(.spd91, V, codes = -98, convention = \"spss\")"))
check("N91d a name holding a value still works -- a name spelled like a value too (stata <- \"spss\"; to = stata converts to SPSS, no pointer) -- and the printed lines run",
      local({ fmt <- "spss"
              ok1 <- !inherits(try(suppressMessages(jdeclare_missing(.spd91, V, codes = -98, convention = fmt)), silent = TRUE), "try-error")
              ok2 <- !inherits(try(suppressMessages(.conv91("stata", jconvert(.spd91, to = "stata"))), silent = TRUE), "try-error")
              ok3 <- !inherits(try(suppressMessages(jrecode(.x91, x, map = "1=.a; else=copy", convention = "stata")), silent = TRUE), "try-error")
              stata <- "spss"
              ok4 <- local({ t <- data.frame(V = haven::labelled(c(1, 2, haven::tagged_na("a")), c(Skipped = haven::tagged_na("a"))))
                             r <- try(suppressMessages(.conv91("stata", jconvert(t, to = stata))), silent = TRUE)
                             !inherits(r, "try-error") && inherits(r$V, "haven_labelled_spss") })
              ok1 && ok2 && ok3 && ok4 }))
# --- B: ruling R17, the parser ----------------------------------------------------
check("N91e a quoted label holds a semicolon: labels = \"1=Yes; 2=No; 9=\\\"Refused; not asked\\\"\" gives three labels",
      identical(.labs91(jrelabel(.e91, Q, labels = "1=Yes; 2=No; 9=\"Refused; not asked\"")),
                c("Yes", "No", "Refused; not asked")))
check("N91f the SPSS and Stata habit, 1='Yes'; 2='No' (and double quotes): the labels without the marks, which they carried until v0.9.228",
      identical(.labs91(jrelabel(.e91, Q, labels = "1='Yes'; 2='No'")), c("Yes", "No")) &&
        identical(.labs91(jrelabel(.e91, Q, labels = '1="Yes"; 2="No"')), c("Yes", "No")))
check("N91g an unquoted label reads as written, a quotation mark partway through included; an equals sign inside quotes is part of the label; a quoted label with text after its closing mark is taken as written",
      identical(.labs91(jrelabel(.e91, Q, labels = "1=Don't know; 2=Said \"no\"; 9='Refused; \"no\"'")),
                c("Don't know", "Said \"no\"", "Refused; \"no\"")) &&
        identical(.labs91(jrelabel(.e91, Q, labels = "1=\"a=b; c\"; 2=\"Yes\" or so")), c("a=b; c", "\"Yes\" or so")))
check("N91h a quote opened and never closed stops, naming the form (pinned by phrase)",
      grepl("Unbalanced quotation mark in the labels argument. A quoted label must open and close with the same mark, as in 9=\"Refused; not asked\".",
            .fl(grab(jrelabel(.e91, Q, labels = "1=\"Yes; 2=No"))), fixed = TRUE))
check("N91i the same reading in jrecode(labels =), jdeclare_missing(labels =) and a labels string on a marker rule",
      local({ r <- suppressMessages(.conv91("stata", jrecode(.e91, Q, map = "9=.a; else=copy", labels = ".a=\"Refused; not asked\"")))
              dcl <- suppressMessages(jdeclare_missing(.e91, Q, labels = "9='Refused; not asked'", convention = "spss"))
              "Refused; not asked" %in% names(labelled::val_labels(r)) &&
                identical(names(labelled::val_labels(dcl$Q)), "Refused; not asked") }))
# --- C: the lines the package offers ---------------------------------------------
.m91j <- .conv91("stata", grab(jdeclare_missing(.qd91, V, codes = -99)))
check("N91j jdeclare_missing()'s marker refusal: the label holding a semicolon quoted in the labels string (the S353 example, which could be written in no string)",
      grepl("labels = \".b=\\\"Refused; not asked\\\"\"", .m91j, fixed = TRUE))
check("N91k ... and the line runs, the label landing whole on .b",
      local({ r <- .run91(.calls91(.m91j)[1])
              lab <- labelled::val_labels(get(".qd91", envir = r$env)$VR)
              r$ok && "Refused; not asked" %in% names(lab) &&
                identical(haven::na_tag(unname(lab[names(lab) == "Refused; not asked"])), "b") }))
.m91l <- .conv91("stata", grab(jdeclare_missing(.qe91, V, codes = -99)))
check("N91l a label holding a semicolon and a quotation mark is quoted with apostrophes, and the line runs",
      grepl("labels = \".b='Refused; \\\"no\\\"'\"", .m91l, fixed = TRUE) &&
        local({ r <- .run91(.calls91(.m91l)[1])
                r$ok && "Refused; \"no\"" %in% names(labelled::val_labels(get(".qe91", envir = r$env)$VR)) }))
.m91m <- .conv91("stata", grab(jdeclare_missing(.qf91, V, codes = c(-99, -98))))
check("N91m a label no string can carry (a semicolon and both marks) is left out of the line, which keeps the other label, and the sentence says so after the line",
      grepl("labels = \".c=Refused\")\nThe label Don't; \"no\" cannot be written in a labels string, so the line\nleaves it out.\n", .m91m, fixed = TRUE) &&
        !grepl("Don't; \\\"no\\\"", .m91m, fixed = TRUE) &&
        .run91(.calls91(.m91m)[1])$ok)
.m91n <- .conv91("stata", grab(jdeclare_missing(.qg91, V, codes = c(-99, -98, -97))))
check("N91n ruling R5's layout breaks a long labels string only between its rules, never inside a quoted label; the laid-out line runs",
      grepl("labels = \".b=\\\"Refused to answer; interviewer moved on\\\";\n", .m91n, fixed = TRUE) &&
        grepl("\n                .c=\\\"Not applicable; skipped by design\\\"; .d=Don't know\")", .m91n, fixed = TRUE) &&
        local({ r <- .run91(.calls91(.m91n)[1])
                r$ok && all(c("Refused to answer; interviewer moved on", "Not applicable; skipped by design", "Don't know") %in%
                              names(labelled::val_labels(get(".qg91", envir = r$env)$VR))) }))
.m91o <- .conv91("stata", grab(jrecode(.hb91, P, map = "-99=missing; else=copy", labels = "missing=\"Refused; not asked\"")))
check("N91o ruling R8's builder reads the user's labels string quote-aware: the quoted label passes through whole, and its line runs",
      grepl("labels = \".b=\\\"Refused; not asked\\\"\"", .m91o, fixed = TRUE) &&
        local({ r <- .run91(.calls91(.m91o)[1])
                r$ok && "Refused; not asked" %in% names(labelled::val_labels(get(".hb91", envir = r$env)$PR)) }))
check("N91p jlogistic()'s 1/2 recode line quotes a label holding a semicolon, and the line runs",
      local({ g <- data.frame(Y = haven::labelled(c(1, 2, 1, 2, 1, 2, 2, 1), c("No; never" = 1, Yes = 2)), X = 1:8)
              m <- grab(jlogistic(Y ~ X, g))
              e <- new.env(parent = globalenv()); assign("g", g, envir = e)
              ok <- tryCatch({ suppressMessages(eval(parse(text = .calls91(m)[1]), envir = e)); TRUE }, error = function(err) FALSE)
              grepl("labels = \"0=\\\"No; never\\\"; 1=Yes\")", m, fixed = TRUE) && ok &&
                identical(names(labelled::val_labels(get("g", envir = e)$YR)), c("No; never", "Yes")) }))
check("N91q .jst_label_text(): plain as it is; a semicolon quoted; a label opening with a mark quoted with the other; both marks NA",
      identical(.jst_label_text(c("plain", "a; b", "\"Yes\" or so", "a; \"b\"", "Don't; \"no\"")),
                c("plain", "\\\"a; b\\\"", "'\\\"Yes\\\" or so'", "'a; \\\"b\\\"'", NA)))
check("N91r .jst_split_label_rules() and .jst_unquote_label(): the rules of a string, the quotes kept for the unquoting",
      identical(.jst_split_label_rules("1=Yes; 2=\"a; b\" ; 3='c'"), c("1=Yes", "2=\"a; b\"", "3='c'")) &&
        identical(.jst_unquote_label(" \"a; b\" "), "a; b") && identical(.jst_unquote_label("'c'"), "c") &&
        identical(.jst_unquote_label("\"Yes\" or so"), "\"Yes\" or so"))
.m91s <- .conv91("stata", grab(jdeclare_missing(.qh91, V, codes = c(-99, -98, -97))))
check("N91s a short quoted label whose first word would fit on the line above (.c=\"Other; specify\") moves down whole: a cut at its semicolon would have left the first line ending .c=\"Other; -- and the line runs, every label landing as written",
      grepl("labels = \".b=\\\"Refused to answer; interviewer moved on\\\";\n                .c=\\\"Other; specify\\\"; .d=Don't know\")", .m91s, fixed = TRUE) &&
        local({ r <- .run91(.calls91(.m91s)[1])
                r$ok && identical(sort(names(labelled::val_labels(get(".qh91", envir = r$env)$VR))),
                                  sort(c("Skipped", "Refused to answer; interviewer moved on",
                                         "Other; specify", "Don't know"))) }))
rm(.spd91, .x91, .e91, .qd91, .qe91, .qf91, .qg91, .qh91, .hb91, .conv91, .calls91, .run91, .labs91,
   list = ls(pattern = "^\\.m91", all.names = TRUE))

# =============================================================================
# N92 (S357) -- FIX SLATE W2: THE LOAD, SAVE AND jai() WORDING. Eight logged
# conformance items, each the message as it now reads:
#   A  Rule T: the mixed-frame note (Case 6) opens "the d data frame mixes",
#      never on a bare frame name (the S230 item).
#   B  the Case 4 note agrees with its count: "this variable is" after
#      "1 variable has ..." (the S347 item).
#   C  "R format" for .rds, the name the save reminders have used since
#      Session 91: the jload() and jsave() menus, the Loaded and Saved lines
#      (the Session 91 item; Jeff, S357: "Rename to R format").
#   D  the shipped dataset's Loaded line ends as the file branch and jsave()'s
#      Saved line do, with no period (the S206 item, candidate 2).
#   E  jai(): after a declined REPLACE (an AGENTS.md block, a SKILL.md) the
#      note says only that nothing was written; a declined CREATE keeps the
#      line about another folder (the S206 item, candidate 3). Run on the
#      real writers with interactive() and the question stubbed.
#   F  SKILL.md's AI-assistant paragraph is set to the body's width without
#      its prefix -- the same words, a first line no longer 24 characters
#      short (the S207 item); the orientation version is 3.8.
#   G  the .RData redirect in one voice, typed or bare, and a bare name
#      finds x.RData on a case-sensitive file system (the S219 item's
#      finding 6, and a defect on the same surface found building it).
#   H  Rule E and the term: jcorr() and jalpha()'s minimum, one sentence a
#      line; jsave()'s label-loss note, one sentence a line, "missing
#      values" where it said "missing-value codes", the blanked count in
#      number (the Session 123 sweep).
#   I  jdeclare_missing() given a marker for a variable with none: the
#      family named as missing values, never "tokens" or "tagged missings";
#      a governing convention decides it (Decision 13), else the case typed
#      (Jeff, S357: a typed .A gets SAS-style advice).
# Fixtures dotted, in a folder of their own; working objects in local().
# =============================================================================
.wd92 <- getwd()
.ns92 <- getOption(".jst_missing_notice_shown")   # the loads below set it
.td92 <- file.path(tempdir(), "jstats n92")
unlink(.td92, recursive = TRUE); dir.create(.td92); setwd(.td92)
.S92 <- haven::labelled_spss(c(1, 2, -99, 3), labels = c(Refused = -99),
                             na_values = -99)
.T92 <- haven::labelled(c(1, 2, haven::tagged_na("a"), 3),
                        labels = c(Skipped = haven::tagged_na("a")))
saveRDS(data.frame(S = .S92, T = .T92), "mx92.rds")
saveRDS(data.frame(S = .S92), "one92.rds")
saveRDS(data.frame(S = .S92, S2 = .S92), "two92.rds")
.conv92 <- function(cv, expr) {
  old <- getOption(".jst_options_missing_convention")
  options(.jst_options_missing_convention = cv)
  on.exit(options(.jst_options_missing_convention = old), add = TRUE)
  force(expr)
}
# One of jai()'s writers, run as it runs at the console: interactive, the
# question answered `answer`, and SKILL.md's folder pointed at `skill_dir`.
.jai92 <- function(fn, answer, skill_dir = NULL) {
  f <- get(fn)
  e <- new.env(parent = environment(f))
  e$interactive <- function() TRUE
  e$.jst_jai_confirm <- function(info) answer
  if (!is.null(skill_dir)) e$.jst_skill_default_dir <- function() skill_dir
  environment(f) <- e
  f
}
# --- A, B: the load narrative's notes -------------------------------------------
check("N92a the mixed-frame note opens on the data frame, not its bare name (Rule T)",
      local({ m <- .conv92(NULL, grab(jload("mx92.rds", name = ".l92", overwrite = TRUE,
                                            missing.notice = TRUE)))
              grepl("Note: the .l92 data frame mixes SPSS-style and Stata-style missing values.",
                    .fl(m), fixed = TRUE) && !grepl("Note: .l92 mixes", .fl(m), fixed = TRUE) }))
check("N92b the Case 4 note agrees with its count: \"this variable is\" of one, \"these variables are\" of two",
      local({ m1 <- .conv92("stata", grab(jload("one92.rds", name = ".l92", overwrite = TRUE,
                                               missing.notice = TRUE)))
              m2 <- .conv92("stata", grab(jload("two92.rds", name = ".l92", overwrite = TRUE,
                                               missing.notice = TRUE)))
              grepl("Note: this variable is SPSS-style, but your missing.convention setting is \"stata\".",
                    .fl(m1), fixed = TRUE) && !grepl("these variables", m1, fixed = TRUE) &&
                grepl("Note: these variables are SPSS-style, but your missing.convention setting is \"stata\".",
                      .fl(m2), fixed = TRUE) }))
# --- C, D: the format's name and the Loaded line ---------------------------------
check("N92c \"R format\": both menus end on \".rds  R\", the Loaded and Saved lines read \"(R format; ...\", and \"native\" is nowhere",
      local({ ml <- grab(jload("x92.zzz")); ms <- grab(jsave(data.frame(a = 1), "x92.zzz"))
              mo <- grab(jload("one92.rds", name = ".l92", overwrite = TRUE, missing.notice = FALSE))
              mv <- grab(jsave(data.frame(a = 1:2), "a92.rds"))
              endsWith(ml, "\n  .rds       R") && endsWith(ms, "\n  .rds       R") &&
                identical(mo, "Loaded .l92 (R format; 4 cases, 1 variable)\n") &&
                endsWith(mv, "\n(R format; 2 cases, 1 variable)\n") &&
                identical(.jst_format_label("rds"), "R format") &&
                !any(grepl("native", c(ml, ms, mo, mv), fixed = TRUE)) }))
check("N92d the shipped dataset's Loaded line has no closing period, like the file branch's",
      local({ invisible(utils::capture.output(   # the scan's offered lines are stdout
                m <- .conv92(NULL, grab(jload("clinic", name = ".c92", package = TRUE,
                                              overwrite = TRUE, missing.notice = FALSE)))))
              identical(m, "Loaded the jstats example dataset 'clinic'\n") }))
# --- E: jai()'s declined writes ----------------------------------------------------
check("N92e jai(\"project\") declined: a new AGENTS.md keeps the line about another folder; a block to replace gets \"Nothing was written.\" alone",
      local({ pd <- file.path(.td92, "proj"); dir.create(pd); od <- setwd(pd)
              on.exit(setwd(od), add = TRUE)
              m1 <- grab(.jai92(".jst_jai_project", FALSE)())
              made <- file.exists("AGENTS.md")
              invisible(grab(.jai92(".jst_jai_project", TRUE)()))
              m2 <- grab(.jai92(".jst_jai_project", FALSE)())
              !made && file.exists("AGENTS.md") &&
                identical(m1, paste0("Nothing was written.\n",
                                     "To write to a different folder, rerun with path = \"<folder>\".\n")) &&
                identical(m2, "Nothing was written.\n") }))
check("N92f jai(\"machine\") declined: a new SKILL.md keeps the line about another folder; one to overwrite gets \"Nothing was written.\" alone",
      local({ sd <- file.path(.td92, "skill"); dir.create(sd)
              m1 <- grab(.jai92(".jst_jai_machine", FALSE, sd)())
              made <- file.exists(file.path(sd, "SKILL.md"))
              writeLines("old", file.path(sd, "SKILL.md"))
              m2 <- grab(.jai92(".jst_jai_machine", FALSE, sd)())
              !made && identical(readLines(file.path(sd, "SKILL.md")), "old") &&
                grepl("To write to a different folder", m1, fixed = TRUE) &&
                identical(m2, "Nothing was written.\n") }))
# --- F: SKILL.md's paragraph ---------------------------------------------------------
check("N92g SKILL.md's AI-assistant paragraph: the standard paragraph's words without the prefix, set to the body's width (first line 60+, none over 76); the standard text keeps the prefix; version 3.8",
      local({ std <- .jst_orientation_body(); i <- grep("^Note for AI assistants: ", std)
              j <- min(which(std == "")[which(std == "") > i]) - 1L
              mac <- .jst_orientation_text("STAMP", "machine")
              k <- grep("^jstats is newer than your training data", mac)
              para <- mac[k:(k + length(.jst_orientation_machine_note) - 1L)]
              identical(para, .jst_orientation_machine_note) &&
                identical(paste(para, collapse = " "),
                          sub("^Note for AI assistants: ", "", paste(std[i:j], collapse = " "))) &&
                nchar(para[1]) >= 60L && all(nchar(para) <= 76L) &&
                identical(mac[k + length(para)], "") &&
                !any(grepl("Note for AI assistants", mac, fixed = TRUE)) &&
                any(grepl("^Note for AI assistants: jstats is newer",
                          .jst_orientation_text("STAMP", "standard"))) &&
                identical(.jst_orientation_version, "3.8") }))
# --- G: the .RData redirect -----------------------------------------------------------
save(.S92, file = "y92.RData"); save(.S92, file = "z92.rda")
check("N92h the .RData redirect in one voice: typed (pinned whole) and bare -- the bare name finds y92.RData, as typed on a case-sensitive file system",
      identical(grab(jload("y92.RData")),
                paste0("jload(): y92.RData is an .RData file, which jstats does not load.\n",
                       "Load it with base R:\n", "  load(\"y92.RData\")")) &&
        endsWith(grab(jload("y92")),
                 paste0("\ny92.RData is an .RData file, which jstats does not load.\n",
                        "Load it with base R:\n", "  load(\"y92.RData\")")) &&
        endsWith(grab(jload("z92")), "\n  load(\"z92.rda\")"))
# --- H: Rule E and the term -------------------------------------------------------------
check("N92i jcorr() and jalpha()'s minimum: one sentence a line (pinned whole; re-pinned S369, v0.9.241: a line to run under \"for example:\", filter_check.R AD05)",
      local({ d <- data.frame(a = 1:5, b = c(2, 4, 3, 5, 1))
              identical(grab(jcorr(d, a)), paste0(
                "jcorr(): At least 2 variables are required.\nOnly 1 was provided.\n",
                "Provide two or more variable names, for example:\n",
                "  jcorr(community, Income, Age, WellbeingScore)")) &&
                identical(grab(jalpha(d, a)), paste0(
                  "jalpha(): At least 2 items are required.\nOnly 1 was provided.\n",
                  "Provide two or more item names, for example:\n",
                  "  jalpha(community, Environment1, Environment3, Environment4)")) }))
check("N92j jsave()'s CSV note: one sentence a line, \"missing values\" where it said \"missing-value codes\", in each branch (re-pinned S359: the code named)",
      local({ ms <- grab(jsave(data.frame(S = .S92), "s92.csv"))
              mt <- grab(jsave(data.frame(T = .T92), "t92.csv"))
              mb <- grab(jsave(data.frame(S = .S92, T = .T92), "b92.csv"))
              grepl("missing-value metadata.\nS's declared missing value -99 is written as an ordinary number", ms, fixed = TRUE) &&
                grepl("missing-value metadata.\nStata-style missing values (.a, .b, ...) are", mt, fixed = TRUE) &&
                grepl("S's declared missing value -99 is written as an ordinary number", .fl(mb), fixed = TRUE) &&
                grepl("Stata-style missing values (.a, .b, ...) are written as blank cells", .fl(mb), fixed = TRUE) &&
                !any(grepl("missing-value codes", c(ms, mt, mb), fixed = TRUE)) }))
check("N92k ... the blanked count in number: \"1 cell holding a declared missing value was blanked\", the labels sentence on a line of its own",
      local({ m <- grab(jsave(data.frame(S = .S92), "p92.csv", preserve.declarations = FALSE))
              grepl("does not store variable labels or value labels.\n1 cell holding", m, fixed = TRUE) &&
                grepl("1 cell holding a declared missing value was blanked (preserve.declarations = FALSE).",
                      .fl(m), fixed = TRUE) }))
# --- I: jdeclare_missing() given a marker for a variable with none ---------------------
.r92 <- function(cv, codes, ...) {
  .conv92(cv, grab(jdeclare_missing(data.frame(Income = c(1, 2, -99, 4)), Income,
                                    codes = codes, ...)))
}
.fam92 <- function(m, fam, tag) {
  startsWith(m, "jdeclare_missing(): Income has no lettered markers to label.\n") &&
    grepl(paste0("To turn numeric codes into ", fam, "-style missing values, use jrecode() ",
                 "(for example map = \"-99=.", tag, "\", convention = \"", tolower(fam),
                 "\"); or declare the numbers directly with codes = c(-99), convention = \"",
                 tolower(fam), "\"."), .fl(m), fixed = TRUE) &&
    !grepl("token", m, fixed = TRUE) && !grepl("tagged missings", m, fixed = TRUE)
}
check("N92l a typed .A with no tagged convention governing (spss, or none selected) gets SAS-style advice; a typed .a, Stata-style",
      .fam92(.r92("spss", ".A"), "SAS", "A") && .fam92(.r92(NULL, ".A"), "SAS", "A") &&
        .fam92(.r92("spss", ".a"), "Stata", "a") && .fam92(.r92(NULL, ".a"), "Stata", "a"))
check("N92m ... a governing convention decides, as it decides the case of what is produced (Decision 13): .A under stata, and with convention = \"stata\", is Stata-style; .a under sas, SAS-style",
      .fam92(.r92("stata", ".A"), "Stata", "a") &&
        .fam92(.r92("spss", ".A", convention = "stata"), "Stata", "a") &&
        .fam92(.r92("sas", ".a"), "SAS", "A"))
setwd(.wd92)
unlink(.td92, recursive = TRUE)
options(.jst_missing_notice_shown = .ns92)
rm(.wd92, .ns92, .td92, .S92, .T92, .conv92, .jai92, .r92, .fam92)
suppressWarnings(rm(list = intersect(c(".l92", ".c92"), ls(globalenv(), all.names = TRUE)),
                    envir = globalenv()))

# =============================================================================
# N93 (S359) -- FIX SLATE 10: jsave()'S EXCEL/CSV NOTE SAYS WHAT THE FRAME HAD
# TO LOSE. Raised by Jeff on the walk of missing_convention_walk.R Section 30
# (v0.9.231; the S357 item): (1) the labels line printed on a frame with no
# labels -- it now prints only when a variable carries a variable label or
# value labels (Jeff's lean: as the registration note fires only on
# registrations), and the metadata line only when a variable declares
# missing values; a frame with neither gets no note; (2) "Any SPSS-style
# missing values (e.g. -99) are written as literal numbers" hedged what the
# package knows -- the variables and the declared codes their cells hold are
# named, a code no cell holds is not; (3) "jsave(..., preserve.declarations =
# FALSE)" did not run as printed -- the line is the call to run, with the
# data's name and the path just written ("mydata <- ..." first for an
# expression), and N93e runs it. Fixtures dotted, in a folder of their own;
# working objects in local().
# =============================================================================
.wd93 <- getwd()
.td93 <- file.path(tempdir(), "jstats n93")
unlink(.td93, recursive = TRUE); dir.create(.td93); setwd(.td93)
.p93 <- function(m) gsub(normalizePath(.td93, winslash = "/", mustWork = FALSE),
                         "<dir>", m, fixed = TRUE)
.W93 <- data.frame(a = 1:3, b = c(2.5, 3, 1))
.I93 <- haven::labelled_spss(c(100, -99, 300), na_values = c(-99, -98))
check("N93a a frame with no labels and no declarations: no note at all (it said \"CSV format (.csv) does not store variable labels or value labels.\")",
      local({ m <- grab(jsave(.W93, "w93.csv"))
              !grepl("Note:", m, fixed = TRUE) && startsWith(.fl(m), "Saved .W93 to ") }))
check("N93b a variable label alone: the labels line alone, in both formats",
      local({ wl <- .W93; attr(wl$a, "label") <- "Age"
              a <- grab(jsave(wl, "wl93.csv")); b <- grab(jsave(wl, "wl93.xlsx"))
              startsWith(.fl(a), "Note: CSV format (.csv) does not store variable labels or value labels. Saved wl to ") &&
                startsWith(.fl(b), "Note: Excel format (.xlsx) does not store variable labels or value labels. Saved wl to ") }))
check("N93c a declared code and no labels: the metadata line, the variable and its code named, the call to run -- the whole note",
      local({ wv <- data.frame(Income = .I93, b = 1:3)
              m <- .p93(grab(jsave(wv, "wv93.csv")))
              cl <- .r5_calls(strsplit(m, "\n", fixed = TRUE)[[1]], shape = "^  jsave\\(")
              startsWith(m, paste0(
                "Note: CSV format (.csv) does not store missing-value metadata.\n",
                "Income's declared missing value -99 is written as an ordinary number and\n",
                "will read back as valid data.\n",
                "To write it as an empty cell instead, save with:\n  jsave(wv,")) &&
                identical(vapply(cl, .r5_flat, "", USE.NAMES = FALSE),
                          "jsave(wv, \"<dir>/wv93.csv\", overwrite = TRUE, preserve.declarations = FALSE)") &&
                grepl(")\nSaved wv to", m, fixed = TRUE) }))
check("N93d several variables, with labels: each named with the codes its cells hold, a range's held values among them, the labels line first",
      local({ wv <- data.frame(
                Income = haven::labelled_spss(c(100, -99, -98), labels = c(Refused = -99),
                                              na_values = c(-99, -98)),
                Q2 = haven::labelled_spss(c(-97, 2, 3), na_range = c(-99, -90)), b = 1:3)
              m <- grab(jsave(wv, "wv93d.xlsx"))
              grepl(paste0("Note: Excel format (.xlsx) does not store variable labels, value labels, or missing-value metadata. ",
                           "The declared missing values of Income (-99 and -98) and Q2 (-97) are written as ordinary ",
                           "numbers and will read back as valid data. To write them as empty cells instead, save with: "),
                    gsub("\\s+", " ", m), fixed = TRUE) }))
check("N93e the printed line runs: it rewrites the file with the declared code as an empty cell, which reads back missing",
      local({ wv <- data.frame(Income = .I93, b = 1:3)
              m <- grab(jsave(wv, "wv93e.csv"))
              code <- .r5_calls(strsplit(m, "\n", fixed = TRUE)[[1]], shape = "^  jsave\\(wv,")
              invisible(grab(eval(parse(text = code[1]))))
              back <- utils::read.csv("wv93e.csv")
              length(code) == 1L && identical(back$Income, c(100L, NA, 300L)) }))
check("N93f an expression given as the data: the block opens on \"mydata <- ...\", and the two lines run",
      local({ wv <- data.frame(Income = .I93, b = 1:3); mk93 <- function() wv
              m <- .p93(grab(jsave(mk93(), "mk93.csv")))
              cl <- .r5_calls(strsplit(m, "\n", fixed = TRUE)[[1]], shape = "^  (mydata <- |jsave\\()")
              grepl("save with:\n  mydata <- mk93()\n  jsave(mydata,", m, fixed = TRUE) &&
                identical(vapply(cl, .r5_flat, "", USE.NAMES = FALSE),
                          c("mydata <- mk93()",
                            "jsave(mydata, \"<dir>/mk93.csv\", overwrite = TRUE, preserve.declarations = FALSE)")) &&
                local({ cr <- .r5_calls(strsplit(grab(jsave(mk93(), "mk93.csv", overwrite = TRUE)), "\n", fixed = TRUE)[[1]],
                                        shape = "^  (mydata <- |jsave\\()")
                        e <- new.env(); e$mk93 <- mk93
                        invisible(grab(eval(parse(text = paste(cr, collapse = "\n")), e)))
                        length(cr) == 2L && is.na(utils::read.csv("mk93.csv")$Income[2]) }) }))
check("N93g a declared code no cell holds is not named; with none held, no sentence and no line -- the metadata line alone",
      local({ ga <- data.frame(Income = haven::labelled_spss(c(1, -99, 3), na_values = c(-99, -98)))
              gb <- data.frame(Income = haven::labelled_spss(c(1, 2, 3), na_values = -99))
              a <- grab(jsave(ga, "g93a.csv")); b <- grab(jsave(gb, "g93b.csv"))
              grepl("declared missing value -99 is written", gsub("\\s+", " ", a), fixed = TRUE) &&
                !grepl("-98", a, fixed = TRUE) &&
                startsWith(b, "Note: CSV format (.csv) does not store missing-value metadata.\nSaved ") }))
check("N93h more than three variables: their count and the first three named",
      local({ many <- as.data.frame(lapply(1:5, function(i) haven::labelled_spss(c(1, -99), na_values = -99)))
              names(many) <- paste0("V", 1:5)
              grepl("The declared missing values of 5 variables (V1, V2, V3, ... and 2 more) are written as ordinary numbers",
                    gsub("\\s+", " ", grab(jsave(many, "many93.csv"))), fixed = TRUE) }))
check("N93i preserve.declarations = FALSE with no labels: the blanked count alone (it said \"does not store variable labels or value labels\" first)",
      local({ wv <- data.frame(Income = .I93, b = 1:3)
              m <- grab(jsave(wv, "p93.csv", preserve.declarations = FALSE))
              startsWith(.fl(m), "Note: 1 cell holding a declared missing value was blanked (preserve.declarations = FALSE). Saved wv to ") }))
check("N93j a declared string: its code in quotes, \"an ordinary value\"",
      local({ tx <- data.frame(t = haven::labelled_spss(c("a", "Refused", "b"), na_values = "Refused"))
              grepl("t's declared missing value \"Refused\" is written as an ordinary value and will read back as valid data.",
                    gsub("\\s+", " ", grab(jsave(tx, "tx93.csv"))), fixed = TRUE) }))
setwd(.wd93)
unlink(.td93, recursive = TRUE)
rm(.wd93, .td93, .p93, .W93, .I93)

# =============================================================================
# N94 (S361) -- CAPABILITY SLATE C1, ITS SIX SMALLER ITEMS (v0.9.234). Five of
# them speak in this battery's surfaces: (A) jconvert()'s return-trip note in
# the SPSS-to-Stata direction, the mirror of the S314 note (the S354 item);
# (B) the load scan's convention-matched category, a value in the
# missing.convention.codes setting found whatever its size (the Session 23
# item, Decision 5A); (C) jsave(preserve.declarations = FALSE) ahead of the
# .sav/.dta/.xpt pre-flight, the refusals' second remedy and the note after
# the write (the S218 item); (D) jload() reading the example files shipped in
# inst/extdata by name, and package = TRUE forcing one (the Session 74 item's
# second half); (E) the advisory note on a variable named T or F (the S289
# item). The sixth, jscreen()'s "date (unparsed)", is format_check.R's
# section AA. Fixtures dotted, in a folder of their own; working objects in
# local().
# =============================================================================
.wd94 <- getwd()
.td94 <- file.path(tempdir(), "jstats n94")
unlink(.td94, recursive = TRUE); dir.create(.td94); setwd(.td94)
.cv94 <- getOption(".jst_options_missing_convention")
.cc94 <- getOption(".jst_options_missing_convention_codes")
.ns94 <- getOption(".jst_missing_notice_shown")
options(.jst_options_missing_convention = "spss",
        .jst_options_missing_convention_codes = NULL)
.S94 <- data.frame(
  Score = haven::labelled_spss(c(1, 2, 9, -1, 3), labels = c("Not asked" = 9, Refused = -1),
                               na_values = c(-1, 9)),
  Mood  = haven::labelled_spss(c(1, -99, -98, 2, 3), na_values = c(-99, -98)),
  Age   = haven::labelled_spss(c(30, -97, 40, -99, 50), na_values = c(-97, -99)))

# --- A: the return-trip note, SPSS to Stata --------------------------------------
check("N94a one variable whose codes are not the setting's: the note names the codes the trip back gives, in the report's order",
      local({ m <- grab(jconvert(.S94, Score, to = "stata"))
              grepl(paste0("  Score  9 [\"Not asked\"]  -> .a\n         -1 [\"Refused\"]   -> .b\n\n",
                           "Note: converting Score back"), m, fixed = TRUE) &&
                grepl("Note: converting Score back to SPSS-style missing values would give its codes -99, -98, not 9, -1. ",
                      .fl(m), fixed = TRUE) }))
check("N94b ... and it is so: converted back, the codes are -99 and -98, each with the label its code had",
      local({ s <- suppressMessages(jconvert(.S94, Score, to = "stata"))
              b <- suppressMessages(jconvert(s, Score, to = "spss"))
              identical(as.numeric(attr(b$Score, "na_values")), c(-99, -98)) &&
                identical(attr(b$Score, "labels")[["Not asked"]], -99) &&
                identical(attr(b$Score, "labels")[["Refused"]], -98) }))
check("N94c the setting's own codes come back as they went: no note",
      !grepl("back to SPSS", grab(jconvert(.S94, Mood, to = "stata")), fixed = TRUE))
check("N94d codes in another order than the setting's: the note (-97 and -99 come back as -98 and -99)",
      grepl("would give its codes -99, -98, not -99, -97.", .fl(grab(jconvert(.S94, Age, to = "stata"))),
            fixed = TRUE))
check("N94e several variables share one note, to = \"sas\" as to = \"stata\"",
      local({ a <- .fl(grab(jconvert(.S94, to = "sas"))); b <- .fl(grab(jconvert(.S94, to = "stata")))
              s <- "Note: converting Score and Age back to SPSS-style missing values would give them other codes than those above."
              grepl(s, a, fixed = TRUE) && grepl(s, b, fixed = TRUE) && !grepl("Mood back", a, fixed = TRUE) }))
check("N94f missing.notice = FALSE: nothing",
      identical(grab(jconvert(.S94, Score, to = "stata", missing.notice = FALSE)), ""))
check("N94g the setting is what the trip back reads: with codes c(9, -1) Score comes back as it went",
      local({ options(.jst_options_missing_convention_codes = c(9, -1))
              on.exit(options(.jst_options_missing_convention_codes = NULL))
              m <- grab(jconvert(.S94, Score, to = "stata"))
              grepl("-> .b", m, fixed = TRUE) && !grepl("back to SPSS", m, fixed = TRUE) }))
check("N94h a trip back that would be refused (one code, two markers) is not predicted: no note, and the trip back does refuse",
      local({ options(.jst_options_missing_convention_codes = -99)
              on.exit(options(.jst_options_missing_convention_codes = NULL))
              m <- grab(jconvert(.S94, Score, to = "stata"))
              s <- suppressMessages(jconvert(.S94, Score, to = "stata"))
              !grepl("back to SPSS", m, fixed = TRUE) &&
                inherits(tryCatch(suppressMessages(jconvert(s, Score, to = "spss")),
                                  error = function(e) e), "error") }))
check("N94i a range whose values come back as they were: the range note, no return-trip note",
      local({ r <- data.frame(Q = haven::labelled_spss(c(1, -99, -98, -97, 2), na_range = c(-99, -95)))
              m <- .fl(grab(jconvert(r, to = "stata")))
              grepl("have no range concept", m, fixed = TRUE) && !grepl("back to SPSS", m, fixed = TRUE) }))

# --- B: the load scan's convention-matched category --------------------------------
.ages94 <- c(18, 25, 33, 41, 52, 60, 67, 74, 80, 29, 38, 45)
.csv94 <- function(df, f) { utils::write.csv(df, f, row.names = FALSE); f }
check("N94j -99 beside ages of 18 to 80 (which the heuristic leaves alone): convention-matched, under the neutral heading, with the setting's codes in the legend",
      local({ f <- .csv94(data.frame(Age = c(.ages94, -99, -99)), "age94.csv")
              p <- printed(jload(f, overwrite = TRUE))
              grepl("Missing-value codes detected:\n  Age:  -99 (2)\n\nThese codes match", p, fixed = TRUE) &&
                grepl(paste0("These codes match the missing.convention.codes setting (-99, -98, -97) but are ",
                             "not formally declared, so they are not treated as missing. Declare them as ",
                             "missing if they are; leave as-is if real."), .fl(p), fixed = TRUE) }))
check("N94k a missing-suggestive label wins: -99 \"Refused\", undeclared, is label-only",
      local({ g <- data.frame(Q = haven::labelled(c(1, 2, 3, 4, -99, 5), labels = c(Refused = -99)))
              f <- "lab94.sav"; haven::write_sav(g, f)
              p <- printed(jload(f, overwrite = TRUE))
              grepl("  Q:  -99 [\"Refused\"] (1)\n", p, fixed = TRUE) &&
                grepl("the value labels suggest they mark missing values", .fl(p), fixed = TRUE) &&
                !grepl("convention", p, fixed = TRUE) }))
check("N94l the three categories together: one row each, tagged, and a legend for each in the order label-only, convention-matched, suspected",
      local({ g <- data.frame(L = haven::labelled(c(1, 2, 3, -98, 4, 5), labels = c("Don't know" = -98)),
                              C = c(30, 41, 52, -97, 66, 77), S = c(1, 2, 3, 99, 4, 5))
              f <- "mix94.sav"; haven::write_sav(g, f)
              p <- printed(jload(f, overwrite = TRUE))
              grepl("  C:  -97 (1)                 [convention-matched -- not formally declared]\n", p, fixed = TRUE) &&
                grepl("  S:  99 (1)                  [suspected -- not formally defined]\n", p, fixed = TRUE) &&
                grepl("[label-only -- not formally declared]:", p, fixed = TRUE) &&
                regexpr("[label-only", p, fixed = TRUE) < regexpr("[convention-matched -- not formally declared]:", p, fixed = TRUE) &&
                regexpr("[convention-matched -- not formally declared]:", p, fixed = TRUE) < regexpr("[suspected -- not formally defined]:", p, fixed = TRUE) &&
                grepl("but they match the missing.convention.codes setting (-99, -98, -97).", .fl(p), fixed = TRUE) &&
                startsWith(sub("^\n", "", p), "Missing-value codes detected:") }))
check("N94m a changed setting is the one read: with codes -9 and -8, -9 is convention-matched and -99 beside ages is not flagged",
      local({ options(.jst_options_missing_convention_codes = c(-9, -8))
              on.exit(options(.jst_options_missing_convention_codes = NULL))
              f <- .csv94(data.frame(Age = c(.ages94, -99, -99), Q = c(1:5, -9, 1:5, 2, 3, 4)), "set94.csv")
              p <- printed(jload(f, overwrite = TRUE))
              grepl("  Q:  -9 (1)\n", p, fixed = TRUE) && !grepl("Age:", p, fixed = TRUE) &&
                grepl("setting (-9, -8)", p, fixed = TRUE) }))
check("N94n a declared code is the narrative's, never the scan's",
      local({ g <- data.frame(Age = haven::labelled_spss(c(.ages94, -99), na_values = -99))
              f <- "dec94.sav"; haven::write_sav(g, f)
              !grepl("codes detected", printed(jload(f, overwrite = TRUE)), fixed = TRUE) }))
check("N94o only heuristic findings: the \"Suspected\" heading and its legend, as before",
      local({ f <- .csv94(data.frame(S = c(1, 2, 3, 99, 4, 5)), "sus94.csv")
              p <- printed(jload(f, overwrite = TRUE))
              grepl("Suspected missing-value codes detected:\n  S:  99 (1)\n\nThese codes are not formally defined", p, fixed = TRUE) }))
check("N94aj convention-matched and suspected, no label-only: the neutral heading, with the two bracketed legends (\"Suspected\" is for a scan of suspected values alone)",
      local({ f <- .csv94(data.frame(C = c(30, 41, 52, -97, 66, 77), S = c(1, 2, 3, 99, 4, 5)), "cs94.csv")
              p <- printed(jload(f, overwrite = TRUE))
              startsWith(sub("^\n", "", p), "Missing-value codes detected:\n") &&
                grepl("[convention-matched -- not formally declared]:", p, fixed = TRUE) &&
                grepl("[suspected -- not formally defined]:", p, fixed = TRUE) }))
check("N94p past ten rows the hidden ones are counted by category, convention-matched among them",
      local({ cv <- function(i) c(30, 41, 52, -99, 66, 77); sv <- function(i) c(1, 2, 3, 99, 4, 5)
              g <- as.data.frame(c(setNames(lapply(1:5, cv), paste0("C", 1:5)),
                                   setNames(lapply(1:5, sv), paste0("S", 1:5)),
                                   list(C6 = cv(6), S6 = sv(6))))
              p <- printed(jload(.csv94(g, "many94.csv"), overwrite = TRUE))
              grepl(paste0("  ... and 2 more:\n",
                           "    1 with [convention-matched -- not formally declared]\n",
                           "    1 with [suspected -- not formally defined]\n"), p, fixed = TRUE) }))
check("N94q the offered lines for a convention-matched target: declare, and declare with placeholder labels -- each runs",
      local({ f <- .csv94(data.frame(Age = c(.ages94, -99, -98)), "off94.csv")
              p <- printed(jload(f, name = "o94", overwrite = TRUE))
              cl <- .r5_calls(strsplit(p, "\n", fixed = TRUE)[[1]], shape = "^  jdeclare_missing\\(")
              fl <- vapply(cl, .r5_flat, "", USE.NAMES = FALSE)
              e <- new.env(); e$o94 <- o94
              ok <- vapply(fl, function(l) !inherits(try(suppressMessages(eval(parse(text = l), e)), silent = TRUE),
                                                       "try-error"), logical(1))
              identical(fl, c("jdeclare_missing(o94, Age, codes = c(-99, -98), modify = TRUE)",
                              "jdeclare_missing(o94, Age, codes = c(\"label1\" = -99, \"label2\" = -98), modify = TRUE)")) &&
                all(ok) && identical(as.numeric(attr(e$o94$Age, "na_values")), c(-99, -98)) }))
suppressWarnings(rm(list = intersect(c("o94", "age94", "lab94", "mix94", "set94", "dec94", "sus94", "many94", "off94", "cs94"),
                                     ls(globalenv())), envir = globalenv()))

# --- C: jsave(preserve.declarations = FALSE) ahead of the pre-flight -------------
.D94 <- data.frame(
  A  = haven::labelled_spss(c(1, -99, 2, -98, 3), labels = c(Refused = -99), na_values = c(-99, -98)),
  Mk = haven::labelled(c(1, haven::tagged_na("a"), 3, 4, 5), labels = c(Refused = haven::tagged_na("a"))))
check("N94r .dta: the refusal ends on the save that blanks them, beside the conversion",
      endsWith(grab(jsave(.D94["A"], "r94.dta")),
               paste0("Before saving to Stata format, convert with:\n",
                      "  jconvert(.D94[\"A\"], to = \"stata\", modify = TRUE)\n",
                      "Or save every declared missing value as plain NA instead:\n",
                      "  jsave(.D94[\"A\"], \"r94.dta\", preserve.declarations = FALSE)\n")) ||
        local({ m <- grab(jsave(.D94["A"], "r94.dta"))
                grepl("Or save every declared missing value as plain NA instead:\n  mydata <- .D94[\"A\"]\n  jsave(mydata, \"r94.dta\", preserve.declarations = FALSE)", m, fixed = TRUE) }))
check("N94s .sav with a marker: the same second remedy after the conversion; .xpt: the save that blanks them is its drop route, the jconvert(to = \"baseR\") line gone",
      local({ d <- .D94
              a <- grab(jsave(d, "s94.sav")); b <- grab(jsave(d, "s94.xpt"))
              grepl("  jconvert(d, to = \"spss\", modify = TRUE)\nOr save every declared missing value as plain NA instead:\n  jsave(d, \"s94.sav\", preserve.declarations = FALSE)", a, fixed = TRUE) &&
                grepl("To save as .xpt with every declared missing value as plain NA, run:\n  jsave(d, \"s94.xpt\", preserve.declarations = FALSE)\n", b, fixed = TRUE) &&
                !grepl("baseR", b, fixed = TRUE) }))
check("N94t minimal tier: the second remedy at .dta and .sav, and .xpt's drop line is the save",
      local({ d <- .D94; old <- getOption(".jst_output_level"); options(.jst_output_level = "minimal")
              on.exit(options(.jst_output_level = old))
              a <- grab(jsave(d["A"], "t94.dta")); b <- grab(jsave(d, "t94.xpt"))
              c2 <- grab(jsave(d["Mk"], "t94.sav"))
              endsWith(c2, paste0("Convert first, then save again:\n",
                                  "  mydata <- d[\"Mk\"]\n  jconvert(mydata, to = \"spss\", modify = TRUE)\n",
                                  "Or save every declared missing value as plain NA instead:\n",
                                  "  mydata <- d[\"Mk\"]\n  jsave(mydata, \"t94.sav\", preserve.declarations = FALSE)")) &&
                endsWith(a, paste0("Or save every declared missing value as plain NA instead:\n",
                                 "  mydata <- d[\"A\"]\n  jsave(mydata, \"t94.dta\", preserve.declarations = FALSE)")) &&
                grepl("To drop them:\n  jsave(d, \"t94.xpt\", preserve.declarations = FALSE)", b, fixed = TRUE) }))
check("N94u preserve.declarations = FALSE to .dta: saved, every declared value plain NA in the file, the count in a note, the data frame unchanged",
      local({ d <- .D94
              m <- grab(jsave(d, "u94.dta", preserve.declarations = FALSE))
              back <- haven::read_dta("u94.dta")
              # Flattened: the Saved line's path wraps where a temp path is long.
              startsWith(.fl(m), "Note: 3 cells holding declared missing values were blanked (preserve.declarations = FALSE). Saved d to ") &&
                identical(as.numeric(back$A), c(1, NA, 2, NA, 3)) && all(is.na(haven::na_tag(back$Mk))) &&
                identical(attr(d$A, "na_values"), c(-99, -98)) && identical(haven::na_tag(d$Mk)[2], "a") }))
check("N94v ... to .sav and .xpt too, where both forms had stopped the save",
      local({ d <- .D94
              a <- grab(jsave(d, "v94.sav", preserve.declarations = FALSE))
              b <- grab(jsave(d, "v94.xpt", preserve.declarations = FALSE))
              sv <- haven::read_sav("v94.sav", user_na = TRUE)
              file.exists("v94.sav") && file.exists("v94.xpt") &&
                is.null(attr(sv$A, "na_values")) && identical(as.numeric(sv$A), c(1, NA, 2, NA, 3)) &&
                grepl("3 cells holding declared missing values were blanked", .fl(a), fixed = TRUE) &&
                grepl("3 cells holding declared missing values were blanked", .fl(b), fixed = TRUE) }))
check("N94w ... to .rds: the note, where it was silent; no cell holding one: the declarations dropped, said so",
      local({ d <- .D94; z <- data.frame(Q = haven::labelled_spss(c(1, 2, 3), na_values = -99))
              a <- grab(jsave(d, "w94.rds", preserve.declarations = FALSE))
              b <- grab(jsave(z, "z94.rds", preserve.declarations = FALSE))
              startsWith(a, "Note: 3 cells holding declared missing values were blanked") &&
                startsWith(.fl(b), "Note: no cell held a declared missing value; the declarations were dropped (preserve.declarations = FALSE). Saved z to ") }))
check("N94x the type check still stops a column a format cannot store, with no missing-value section under FALSE",
      local({ d <- .D94; d$L <- I(list(1, 2, 3, 4, 5))
              m <- grab(jsave(d, "x94.dta", preserve.declarations = FALSE))
              grepl("is of a type that Stata format (.dta) cannot store", .fl(m), fixed = TRUE) &&
                !grepl("missing values", m, fixed = TRUE) && !file.exists("x94.dta") }))
check("N94y the offered line runs: it saves the file the refusal stopped, with the values blanked; overwrite = TRUE rides when given",
      local({ d <- .D94
              m <- grab(jsave(d, "y94.sav"))
              cl <- .r5_calls(strsplit(m, "\n", fixed = TRUE)[[1]], shape = "^  jsave\\(")
              invisible(grab(eval(parse(text = .r5_flat(cl[1])))))
              file.create("y94b.sav")
              m2 <- grab(jsave(d, "y94b.sav", overwrite = TRUE))
              cl2 <- .r5_calls(strsplit(m2, "\n", fixed = TRUE)[[1]], shape = "^  jsave\\(")
              length(cl) == 1L && file.exists("y94.sav") &&
                is.null(attr(haven::read_sav("y94.sav", user_na = TRUE)$A, "na_values")) &&
                identical(.r5_flat(cl2[1]),
                          "jsave(d, \"y94b.sav\", overwrite = TRUE, preserve.declarations = FALSE)") }))

# --- D: the example files shipped in inst/extdata ----------------------------------
.ex94 <- system.file("extdata", "community_spss.sav", package = "jstats")
check("N94z the example files are found: three of them, the .sav where system.file() finds it",
      identical(.jst_extdata_files(), c("community_excel.xlsx", "community_spss.sav", "community_stata.dta")) &&
        nzchar(.ex94) && identical(.jst_extdata_path("community_spss.sav"), .ex94))
check("N94aa jload(\"community_spss.sav\") with no such file on disk: read from the example files, said so, the frame as haven reads the file",
      local({ m <- grab(jload("community_spss.sav", overwrite = TRUE, missing.notice = FALSE, check.missing = FALSE))
              h <- haven::read_sav(.ex94, user_na = TRUE)
              startsWith(m, "Reading from the jstats example files\nLoaded community_spss (SPSS format; ") &&
                identical(dim(community_spss), dim(h)) &&
                identical(attr(community_spss$Income, "na_values"), attr(h$Income, "na_values")) }))
check("N94ab its name alone reads it too: jload(\"community_stata\") gives the .dta",
      startsWith(grab(jload("community_stata", overwrite = TRUE, missing.notice = FALSE, check.missing = FALSE)),
                 "Reading from the jstats example files\nLoaded community_stata (Stata format; "))
check("N94ac a file of that name on disk is read instead, with the note and the call that reads the shipped one -- which runs",
      local({ file.copy(.ex94, "community_spss.sav", overwrite = TRUE)
              m <- grab(jload("community_spss.sav", overwrite = TRUE, missing.notice = FALSE, check.missing = FALSE))
              cl <- .r5_calls(strsplit(m, "\n", fixed = TRUE)[[1]], shape = "^  jload\\(")
              r <- grab(eval(parse(text = sub(")$", ", overwrite = TRUE, missing.notice = FALSE, check.missing = FALSE)", .r5_flat(cl[1])))))
              startsWith(m, paste0("A local file and a jstats example file are both named 'community_spss.sav'.\n",
                                   "The local file was loaded.\nTo load the example file instead, use:\n",
                                   "  jload(\"community_spss.sav\", package = TRUE)\nLoaded community_spss")) &&
                startsWith(r, "Reading from the jstats example files\nLoaded community_spss") }))
check("N94ad ... and by its name alone, the same note naming it so",
      local({ m <- grab(jload("community_spss", overwrite = TRUE, missing.notice = FALSE, check.missing = FALSE))
              unlink("community_spss.sav")
              grepl(paste0("A local file and a jstats example file are both named 'community_spss'.\n",
                           "The local file was loaded.\nTo load the example file instead, use:\n",
                           "  jload(\"community_spss\", package = TRUE)\n"), m, fixed = TRUE) }))
check("N94ae package = TRUE: a name that is neither lists both; a dataset with an extension, and a path, get the line that runs",
      local({ a <- grab(jload("nothing.sav", package = TRUE))
              b <- grab(jload("community.rds", package = TRUE))
              cc <- grab(jload("x/community_spss.sav", package = TRUE))
              identical(.fl(a), paste0("jload(): No jstats example dataset or file named 'nothing.sav'. ",
                                       "Shipped datasets: clinic, community. ",
                                       "Example files: community_excel.xlsx, community_spss.sav, community_stata.dta.")) &&
                grepl("Drop the extension:\n  jload(\"community\", package = TRUE)", b, fixed = TRUE) &&
                grepl("Drop the path:\n  jload(\"community_spss.sav\", package = TRUE)", cc, fixed = TRUE) &&
                startsWith(.fl(b), "jload(): package = TRUE loads a jstats example dataset by its name alone.") &&
                startsWith(.fl(cc), "jload(): package = TRUE loads a jstats example dataset or file by its name alone.") }))
check("N94af quiet = TRUE: no \"Reading from\" line; a dataset's name is still the dataset",
      local({ a <- grab(jload("community_excel.xlsx", overwrite = TRUE, quiet = TRUE, check.missing = FALSE))
              b <- grab(jload("clinic", overwrite = TRUE, missing.notice = FALSE, check.missing = FALSE))
              identical(a, "") && exists("community_excel") &&
                startsWith(b, "Loaded the jstats example dataset 'clinic'") }))
suppressWarnings(rm(list = intersect(c("community_spss", "community_stata", "community_excel", "clinic"),
                                     ls(globalenv())), envir = globalenv()))

# --- E: a variable named T or F ------------------------------------------------------
check("N94ag standard output: no note on a variable named T",
      local({ f <- .csv94(data.frame(T = 1:3, y = 4:6), "tf94.csv")
              # Nothing but the Loaded line: no note, and no blank line set
              # for one.
              identical(grab(jload(f, overwrite = TRUE)), "Loaded tf94 (CSV format; 3 cases, 2 variables)\n") }))
check("N94ah joutput(\"full\"): the note, one blank line below the Loaded line, and its rename line runs",
      local({ old <- getOption(".jst_output_level"); options(.jst_output_level = "full")
              on.exit(options(.jst_output_level = old))
              f <- .csv94(data.frame(T = 1:3, y = 4:6), "tf94.csv")
              m <- grab(jload(f, overwrite = TRUE))
              e <- new.env(); e$tf94 <- tf94
              cl <- .r5_calls(strsplit(m, "\n", fixed = TRUE)[[1]], shape = "^  names\\(")
              eval(parse(text = .r5_flat(cl[1])), e)
              grepl(" variables)\n\nNote: T is a variable in tf94.\njstats reads", m, fixed = TRUE) &&
                endsWith(.fl(m), paste0("Note: T is a variable in tf94. jstats reads it as the variable, but in base R T ",
                                        "also stands for TRUE, and code run inside tf94 (with(), subset()) reads the ",
                                        "variable in its place. To rename it, replacing newname: ",
                                        "names(tf94)[names(tf94) == \"T\"] <- \"newname\" ")) &&
                identical(names(e$tf94), c("newname", "y")) }))
check("N94ai two of them: one note, both named, a rename line each; quiet = TRUE: none",
      local({ old <- getOption(".jst_output_level"); options(.jst_output_level = "full")
              on.exit(options(.jst_output_level = old))
              f <- .csv94(data.frame(T = 1:3, F = 3:1), "tf94b.csv")
              m <- .fl(grab(jload(f, overwrite = TRUE)))
              q <- grab(jload(f, overwrite = TRUE, quiet = TRUE))
              grepl("Note: T and F are variables in tf94b. jstats reads them as the variables, but in base R T and F also stand for TRUE and FALSE", m, fixed = TRUE) &&
                grepl("names(tf94b)[names(tf94b) == \"F\"] <- \"newname2\"", m, fixed = TRUE) && identical(q, "") }))
suppressWarnings(rm(list = intersect(c("tf94", "tf94b"), ls(globalenv())), envir = globalenv()))

setwd(.wd94)
unlink(.td94, recursive = TRUE)
options(.jst_options_missing_convention = .cv94, .jst_options_missing_convention_codes = .cc94,
        .jst_missing_notice_shown = .ns94)
rm(.wd94, .td94, .cv94, .cc94, .ns94, .S94, .ages94, .csv94, .D94, .ex94)

# =============================================================================
# N95 (S372) -- FIX SLATE 20: THE MISSING-VALUE LINES. Five items from the
# S371 remedy-line audit, each a line a message offered that stopped when
# run, with two defects found building them. (A) jsave(preserve.declarations
# = FALSE) left an UNLABELLED Stata-style marker in place -- haven's
# zap_missing() returns a plain double unchanged -- so the .sav and .xpt
# refusals' own line repeated them; jload(preserve.declarations = FALSE) and
# jconvert(to = "baseR") left it too (.jst_zap_tags()). (B) jconvert()'s
# Pattern A report offered codes = X for a text code; jdeclare_missing()
# declares on numeric variables only, so a text variable leaves the report
# under every target. (C) jsave()'s release note offered a declaration that
# stopped with no convention selected, and under stata or sas made the code
# a marker the .sav save then refused: convention = "spss" rides; and on a
# column declaring a code of its own it named the stray alone, dropping the
# rest. (D) jencode()'s note on a declared string offered a missing-token
# map that stopped with no convention selected: the menu leads. (E) jrecode()'s
# D1 note offered the missing token where the source carries markers and the
# map leaves the recoded variable none: the declare pair alone. (F)
# jdeclare_missing()'s mixed-codes split printed tagged_na() without haven::,
# and on a variable carrying no marker both of its lines stopped: sign-off
# 3's message there, whose line now names every code the variable declares.
# Every offered line RUN, under the convention states that matter. Fixtures
# dotted, in a folder of their own; working objects in local().
# =============================================================================
.wd95 <- getwd()
.td95 <- file.path(tempdir(), "jstats n95")
unlink(.td95, recursive = TRUE); dir.create(.td95); setwd(.td95)
.cv95 <- getOption(".jst_options_missing_convention")
.lv95 <- getOption(".jst_output_level")
.ns95 <- getOption(".jst_missing_notice_shown")   # N95b's load shows the narrative
options(.jst_options_missing_convention = NULL)
# .run95(): run, in env, every indented call of msg whose first line matches
# shape (a call laid out over lines kept whole), in order; TRUE when each ran
# with no error and no warning. pre: code run in env first (a menu line).
.run95 <- function(msg, env, shape, pre = NULL) {
  cl <- .r5_calls(strsplit(msg, "\n", fixed = TRUE)[[1]], shape = shape)
  if (length(cl) == 0L) return(FALSE)
  tryCatch({
    withCallingHandlers({
      if (!is.null(pre)) eval(parse(text = pre), env)
      suppressMessages(utils::capture.output(
        for (b in cl) eval(parse(text = b), env)))
      TRUE
    }, warning = function(w) stop("warning: ", conditionMessage(w)))
  }, error = function(e) { cat("        [run95] ", conditionMessage(e), "\n", sep = ""); FALSE })
}
.conv95 <- function(cv, expr) {
  old <- getOption(".jst_options_missing_convention")
  options(.jst_options_missing_convention = cv)
  on.exit(options(.jst_options_missing_convention = old), add = TRUE)
  force(expr)
}
.U95 <- data.frame(id = 1:4, x = c(1, 2, haven::tagged_na("a"), 4))

# --- A: an unlabelled Stata-style marker made plain NA ----------------------------
check("N95a .sav and .xpt: the refusal's preserve.declarations = FALSE line runs and saves, the marker plain NA in the file, the note counting it (it repeated the refusal)",
      local({ d <- .U95
              a <- grab(jsave(d, "a95.sav")); b <- grab(jsave(d, "a95.xpt"))
              e <- new.env(parent = globalenv()); e$d <- d
              ra <- .run95(a, e, "^  jsave\\("); rb <- .run95(b, e, "^  jsave\\(")
              sv <- haven::read_sav("a95.sav", user_na = TRUE)
              xp <- haven::read_xpt("a95.xpt")
              ra && rb && identical(as.numeric(sv$x), c(1, 2, NA, 4)) &&
                is.null(attr(sv$x, "na_values")) && all(is.na(haven::na_tag(sv$x))) &&
                identical(as.numeric(xp$x), c(1, 2, NA, 4)) &&
                startsWith(.fl(grab(jsave(d, "c95.sav", preserve.declarations = FALSE))),
                           "Note: 1 cell holding a declared missing value was blanked (preserve.declarations = FALSE). Saved d to ") &&
                identical(haven::na_tag(d$x)[3], "a") }))
check("N95b jload(preserve.declarations = FALSE) of a .dta holding an unlabelled marker: the loaded variable holds none; a labelled one as before",
      local({ haven::write_dta(data.frame(x = c(1, haven::tagged_na("b"), 3),
                                          y = haven::labelled(c(1, haven::tagged_na("a"), 2),
                                                              labels = c(Refused = haven::tagged_na("a")))),
                               "b95.dta")
              invisible(grab(jload("b95.dta", name = "b95", overwrite = TRUE,
                                   preserve.declarations = FALSE)))
              r <- b95
              identical(as.numeric(r$x), c(1, NA, 3)) && all(is.na(haven::na_tag(r$x))) &&
                all(is.na(haven::na_tag(unclass(r$y)))) && is.na(unclass(r$y)[2]) }))
check("N95c jconvert(to = \"baseR\"): an unlabelled marker plain NA in the result, as a labelled one (it reported \"Stripped\" over a marker still in the cell)",
      local({ d <- .U95
              d$y <- haven::labelled(c(1, haven::tagged_na("a"), 2, 3),
                                     labels = c(Refused = haven::tagged_na("a")))
              m <- grab(r <- jconvert(d, to = "baseR"))
              grepl("Stripped the missing-value declarations from 2 variables:", m, fixed = TRUE) &&
                all(is.na(haven::na_tag(r$x))) && all(is.na(haven::na_tag(unclass(r$y)))) &&
                identical(sum(is.na(r$x)), 1L) && identical(haven::na_tag(d$x)[3], "a") }))
check("N95d an analysis still shows the unlabelled marker in the Missing block and counts it missing",
      local({ d <- .U95
              m <- printed(jfreq(d, x))
              grepl("\nMissing\n.a (no label) ", m, fixed = TRUE) &&
                grepl("Total valid      3 ", m, fixed = TRUE) }))

# --- B: a text variable in jconvert()'s Pattern A report ---------------------------
# S373 (Slate E5, the S372 item, lean 6): back in under "spss" and "baseR",
# its values quoted, no convention =; N96ab holds "stata" and "sas" out.
.P95 <- data.frame(
  S = haven::labelled(c("web", "X", "phone", "web"), labels = c(Refused = "X")),
  N = haven::labelled(c(1, -99, 2, 3), labels = c(Refused = -99)))
check("N95e to = \"spss\" and \"baseR\": a text variable whose label suggests missingness is reported, its value quoted and its line quoted with no convention =; the numeric beside it too; both lines run under every convention state",
      local({ ok <- TRUE
              for (to in c("spss", "baseR")) for (cv in list(NULL, "spss", "stata", "sas")) {
                m <- .conv95(cv, grab(jconvert(.P95, to = to)))
                e <- new.env(parent = globalenv()); e$.P95 <- .P95
                ok <- ok && grepl("  S: \"X\" [\"Refused\"]", m, fixed = TRUE) &&
                  grepl("  jdeclare_missing(.P95, S, codes = \"X\", modify = TRUE)", m, fixed = TRUE) &&
                  grepl("  N: -99 [\"Refused\"]", m, fixed = TRUE) &&
                  .conv95(cv, .run95(m, e, "^  jdeclare_missing\\(")) &&
                  (identical(as.numeric(attr(e$.P95$N, "na_values")), -99) ||
                     !is.na(haven::na_tag(unclass(e$.P95$N))[2])) &&
                  identical(attr(e$.P95$S, "na_values"), "X")
              }
              ok }))

# --- C: jsave()'s release note ----------------------------------------------------
.R95 <- function() data.frame(
  A = haven::labelled_spss(c(1, 2, -99, 3), labels = c(Refused = -99), na_values = -99),
  B = c(4, -99, 5, 6))
check("N95f the release note's pair runs in sequence under every convention state, the file declaring B's -99; convention = \"spss\" in the line unless the setting is spss",
      local({ ok <- TRUE
              for (cv in list(NULL, "spss", "stata", "sas")) {
                rn <- .R95()
                m <- .conv95(cv, grab(jsave(rn, "f95.sav", overwrite = TRUE)))
                e <- new.env(parent = globalenv()); e$rn <- rn
                ran <- .conv95(cv, .run95(m, e, "^  (jdeclare_missing|jsave)\\("))
                sv <- haven::read_sav("f95.sav", user_na = TRUE)
                carg <- grepl("codes = -99, convention = \"spss\", modify = TRUE)", m, fixed = TRUE)
                ok <- ok && grepl("To declare it and save again, run both:", m, fixed = TRUE) &&
                  ran && identical(as.numeric(attr(sv$B, "na_values")), -99) &&
                  identical(carg, !identical(cv, "spss"))
              }
              ok }))
check("N95g a stray on a column declaring a code of its own: the line names both, and run, the column keeps both, with no drop notice",
      local({ rn <- .R95()
              rn$B <- haven::labelled_spss(c(4, -99, -98, 6), labels = c(DK = -98), na_values = -98)
              m <- .conv95("spss", grab(jsave(rn, "g95.sav", overwrite = TRUE)))
              e <- new.env(parent = globalenv()); e$rn <- rn
              cl <- .r5_calls(strsplit(m, "\n", fixed = TRUE)[[1]], shape = "^  jdeclare_missing\\(")
              d2 <- .conv95("spss", grab(eval(parse(text = cl[1]), e)))
              length(cl) == 1L &&
                identical(.r5_flat(cl[1]), "jdeclare_missing(rn, B, codes = c(-98, -99), modify = TRUE)") &&
                identical(sort(as.numeric(attr(e$rn$B, "na_values"))), c(-99, -98)) &&
                !grepl("dropped", d2, fixed = TRUE) }))

# --- D: jencode()'s note on a declared string: jencode_check.R N44c-N44k ----------

# --- E: jrecode()'s D1 note where the map leaves the recoded variable no marker ---
.Q95 <- data.frame(Q = haven::labelled(c(1, 2, 5, 5, haven::tagged_na("a"), 3),
                                       labels = c(DK = haven::tagged_na("a"))))
check("N95h a marker sent to a number or to NA, the recoded value flagged: no missing token offered; the declare pair runs under every convention state (none after the menu's first line), the recoded variable declaring it",
      local({ ok <- TRUE
              for (map in c(".a=0; 5=-99; else=copy", ".a=NA; 5=-99; else=copy")) {
                for (cv in list(NULL, "spss", "stata", "sas")) {
                  m <- .conv95(cv, grab(jrecode(.Q95, Q, map = map)))
                  # The D1 note alone: under .a=0 a second note (S319) offers
                  # a pair of its own, run on its own by the user.
                  m <- grep("looks like a coded missing value",
                            strsplit(m, "\n\n", fixed = TRUE)[[1]], value = TRUE, fixed = TRUE)
                  e <- new.env(parent = globalenv()); e$.Q95 <- .Q95
                  pre <- if (is.null(cv)) "joptions(missing.convention = \"stata\", quiet = TRUE)"
                  ran <- .conv95(cv, .run95(m, e, "^  (\\.Q95\\$QR <- jrecode|jdeclare_missing)\\(", pre = pre))
                  x <- e$.Q95$QR
                  decl <- identical(as.numeric(attr(x, "na_values")), -99) ||
                    sum(!is.na(haven::na_tag(unclass(x)))) >= 2L
                  ok <- ok && !grepl("=missing", m, fixed = TRUE) &&
                    grepl("declare it on the recoded variable:", .fl(m), fixed = TRUE) &&
                    ran && decl
                }
              }
              ok }))
check("N95i control: a source carrying no marker keeps \"map it directly\", and the token map runs under a convention",
      local({ d <- data.frame(Q = c(1, 2, 5, 5, 3))
              m <- .conv95("spss", grab(jrecode(d, Q, map = "5=-99; else=copy")))
              e <- new.env(parent = globalenv()); e$d <- d
              cl <- .r5_calls(strsplit(m, "\n", fixed = TRUE)[[1]], shape = "^  d\\$QR <- ")
              grepl("map it directly:", m, fixed = TRUE) &&
                identical(.r5_flat(cl[1]), "d$QR <- jrecode(d, Q, map = \"5=missing; else=copy\")") &&
                .conv95("spss", { suppressMessages(eval(parse(text = cl[1]), e)); TRUE }) &&
                identical(as.numeric(attr(e$d$QR, "na_values")), -99) }))
check("N95j control: a source whose marker survives gets ruling R8's marker line, as before",
      local({ m <- .conv95("spss", grab(jrecode(.Q95, Q, map = "5=-99; else=copy")))
              grepl("map it to a Stata-style marker the recoded variable does not use:", .fl(m), fixed = TRUE) &&
                grepl("map = \"5=.b; else=copy\", convention = \"stata\")", m, fixed = TRUE) }))

# S374 (v0.9.247; the S372 item, Jeff's lean "all yours"): when both notes
# print, the S319 note's pair names the D1 note's code too -- each pair
# rebuilds the recoded variable and a declaration replaces its codes, so
# running both in turn left 0 alone declared.
check("N95j2 \".a=0; 5=-99; else=copy\": the second note's pair declares the first note's -99 beside its own 0; run alone, the recoded variable declares both (it declared 0 alone), under spss and under stata",
      local({ ok <- TRUE
              for (cv in c("spss", "stata")) {
                m <- .conv95(cv, grab(jrecode(.Q95, Q, map = ".a=0; 5=-99; else=copy")))
                parts <- strsplit(m, "\n\n", fixed = TRUE)[[1]]
                rel <- grep("is a declared missing value on Q", parts, value = TRUE, fixed = TRUE)
                d1  <- grep("looks like a coded missing value", parts, value = TRUE, fixed = TRUE)
                cl  <- .r5_calls(strsplit(rel, "\n", fixed = TRUE)[[1]], shape = "^  jdeclare_missing\\(")
                cl1 <- .r5_calls(strsplit(d1, "\n", fixed = TRUE)[[1]], shape = "^  jdeclare_missing\\(")
                e <- new.env(parent = globalenv()); e$.Q95 <- .Q95
                ran <- .conv95(cv, .run95(rel, e, "^  (\\.Q95\\$QR <- jrecode|jdeclare_missing)\\("))
                x <- e$.Q95$QR
                both <- if (cv == "spss") setequal(as.numeric(attr(x, "na_values")), c(-99, 0))
                        else length(unique(stats::na.omit(haven::na_tag(unclass(x))))) == 2L
                ok <- ok && length(cl) == 1L && length(cl1) == 1L &&
                  identical(.r5_flat(cl1[1]), "jdeclare_missing(.Q95, QR, codes = c(-99), modify = TRUE)") &&
                  identical(.r5_flat(cl[1]), "jdeclare_missing(.Q95, QR, codes = c(-99, 0), modify = TRUE)") &&
                  ran && both
              }
              ok }))
check("N95j3 control: the S319 note alone (no D1 note) names its own code and the declared ones, as before",
      local({ m <- .conv95("spss", grab(jrecode(.Q95, Q, map = ".a=0; else=copy")))
              cl <- .r5_calls(strsplit(m, "\n", fixed = TRUE)[[1]], shape = "^  jdeclare_missing\\(")
              !grepl("looks like a coded missing value", m, fixed = TRUE) && length(cl) == 1L &&
                identical(.r5_flat(cl[1]), "jdeclare_missing(.Q95, QR, codes = c(0), modify = TRUE)") }))

# --- F: jdeclare_missing()'s mixed codes ------------------------------------------
check("N95k on a Stata-form variable the split's lines print haven::tagged_na(), never bare, and both run in sequence",
      local({ d <- data.frame(X = c(1, 2, -99, haven::tagged_na("b"), 3))
              m <- grab(jdeclare_missing(d, X, codes = c(-99, ".b"), convention = "stata"))
              e <- new.env(parent = globalenv()); e$d <- d
              grepl("For your input, that would be:", m, fixed = TRUE) &&
                grepl("codes = haven::tagged_na(\"b\")", .fl(m), fixed = TRUE) &&
                !grepl("[^:]tagged_na\\(", gsub("haven::tagged_na", "", m)) &&
                .run95(m, e, "^  jdeclare_missing\\(") &&
                identical(sort(haven::na_tag(e$d$X)[!is.na(haven::na_tag(e$d$X))]), c("a", "b")) }))
.S95 <- function() data.frame(X = haven::labelled_spss(c(1, 2, -99, -98, -97, 3),
                                                     labels = c(Refused = -99), na_values = c(-99, -98)))
check("N95l on an SPSS-declared variable: sign-off 3's advice, not the split -- the typed number, the code the marker takes and the variable's other code in one line, which runs and drops nothing; the jconvert() line runs",
      local({ dsp <- .S95()
              m <- grab(jdeclare_missing(dsp, X, codes = c(-97, ".a")))
              e <- new.env(parent = globalenv()); e$dsp <- dsp
              cl <- .r5_calls(strsplit(m, "\n", fixed = TRUE)[[1]], shape = "^  jdeclare_missing\\(")
              d2 <- grab(r <- eval(parse(text = cl[1]), e))
              e2 <- new.env(parent = globalenv()); e2$dsp <- dsp
              !grepl("For your input", m, fixed = TRUE) &&
                grepl("but X carries SPSS-style missing values (na_values: -99, -98).", .fl(m), fixed = TRUE) &&
                grepl("To declare the codes as SPSS-style missing values, name them directly:", m, fixed = TRUE) &&
                identical(.r5_flat(cl[1]), "jdeclare_missing(dsp, X, codes = c(-97, -99, -98))") &&
                grepl("X's declared missing value -99 takes the place of '.a'.", .fl(m), fixed = TRUE) &&
                identical(sort(as.numeric(attr(r$X, "na_values"))), c(-99, -98, -97)) &&
                !grepl("dropped", d2, fixed = TRUE) &&
                .run95(m, e2, "^  jconvert\\(") }))
check("N95p a typed number the marker also takes is named once, and the line runs",
      local({ dsp <- .S95()
              m <- grab(jdeclare_missing(dsp, X, codes = c(-99, ".a")))
              cl <- .r5_calls(strsplit(m, "\n", fixed = TRUE)[[1]], shape = "^  jdeclare_missing\\(")
              e <- new.env(parent = globalenv()); e$dsp <- dsp
              g <- grab(r <- eval(parse(text = cl[1]), e))
              identical(.r5_flat(cl[1]), "jdeclare_missing(dsp, X, codes = c(-99, -98))") &&
                identical(sort(as.numeric(attr(r$X, "na_values"))), c(-99, -98)) &&
                !grepl("dropped", g, fixed = TRUE) }))
check("N95m on a variable declaring nothing: sign-off 3's \"no lettered markers to label\", not the split",
      local({ d <- data.frame(X = c(1, 2, -99, -98, 3))
              m <- grab(jdeclare_missing(d, X, codes = c(-99, ".b")))
              !grepl("For your input", m, fixed = TRUE) &&
                startsWith(m, "jdeclare_missing(): X has no lettered markers to label.") }))
check("N95n one marker on an SPSS variable declaring two codes: the line names both and drops nothing; named, an unlabelled kept code moves the names to labels =",
      local({ dsp <- .S95()
              a <- grab(jdeclare_missing(dsp, X, codes = ".a"))
              b <- grab(jdeclare_missing(dsp, X, codes = c(Refused = ".a")))
              ca <- .r5_calls(strsplit(a, "\n", fixed = TRUE)[[1]], shape = "^  jdeclare_missing\\(")
              cb <- .r5_calls(strsplit(b, "\n", fixed = TRUE)[[1]], shape = "^  jdeclare_missing\\(")
              e <- new.env(parent = globalenv()); e$dsp <- dsp
              ga <- grab(ra <- eval(parse(text = ca[1]), e))
              gb <- grab(rb <- eval(parse(text = cb[1]), e))
              identical(.r5_flat(ca[1]), "jdeclare_missing(dsp, X, codes = c(-99, -98))") &&
                identical(.r5_flat(cb[1]), "jdeclare_missing(dsp, X, codes = c(-99, -98), labels = \"-99=Refused\")") &&
                identical(sort(as.numeric(attr(ra$X, "na_values"))), c(-99, -98)) &&
                identical(sort(as.numeric(attr(rb$X, "na_values"))), c(-99, -98)) &&
                !grepl("dropped", paste(ga, gb), fixed = TRUE) &&
                grepl("To label the declared numeric codes, name them directly:", a, fixed = TRUE) }))
# S373 (Slate E5; Jeff: "Ok to your lean."): the equivalent call is gone.
# Run on the data the call was given it stopped ("V has no lettered markers
# to label"); every line the full level prints now runs.
check("N95o the full level prints no equivalent call, and every line it prints that has a call's shape runs",
      local({ d <- data.frame(V = c(1, 2, -99, 3))
              options(.jst_output_level = "full"); on.exit(options(.jst_output_level = .lv95))
              p <- .conv95("stata", printed(jdeclare_missing(d, V, codes = -99)))
              e <- new.env(parent = globalenv()); e$d <- d
              !grepl("Equivalent", p, fixed = TRUE) && !grepl("tagged_na", p, fixed = TRUE) &&
                grepl("Declared and converted to Stata-style missing values on V:", p, fixed = TRUE) &&
                grepl("  d <- jdeclare_missing(d, V, ...)", p, fixed = TRUE) }))

setwd(.wd95)
unlink(.td95, recursive = TRUE)
options(.jst_options_missing_convention = .cv95, .jst_output_level = .lv95,
        .jst_missing_notice_shown = .ns95)
rm(.wd95, .td95, .cv95, .lv95, .ns95, .run95, .conv95, .U95, .P95, .R95, .Q95, .S95)

# =============================================================================
# N96 (S373) -- SLATE E5: DECLARED MISSING VALUES ON TEXT. Rulings R26, R27
# and R28 (Jeff, S372) and the three (S372) items they carry. (A) R26:
# jdeclare_missing() declares on a text variable, quoted codes, SPSS-style
# under every setting and with none selected, no choose-first menu; a note
# under a stata or sas setting; convention = "stata" / "sas" and a range
# refused with the call to run; numbers refused with the call, quoted (lean
# 1); exact matching and the note on values differing only in case or outer
# spaces (lean 2); labels both ways, a value holding = or ; quoted (lean 3);
# a value typed without quotes gets ruling R18's pointer. (B) R27: codes = ""
# declares every blank cell, empty or spaces only -- one <blank> row in the
# Missing block -- and every reader of a declared string covers both kinds.
# (C) R28: the word list gains five terms. (D) jsave() to .sav refuses a
# declared text value over 8 bytes (the .sav keeps 8). (E) the load scan
# reports a text variable's values by label and by wording; jconvert()'s
# Pattern A takes text back under "spss" and "baseR" (N95e re-pinned).
# Every offered line RUN. Fixtures dotted, in a folder of their own;
# working objects in local().
# =============================================================================
.wd96 <- getwd()
.td96 <- file.path(tempdir(), "jstats n96")
unlink(.td96, recursive = TRUE); dir.create(.td96); setwd(.td96)
.cv96 <- getOption(".jst_options_missing_convention")
.ns96 <- getOption(".jst_missing_notice_shown")
options(.jst_options_missing_convention = NULL)
.run96 <- function(msg, env, shape = "^  jdeclare_missing\\(") {
  cl <- .r5_calls(strsplit(msg, "\n", fixed = TRUE)[[1]], shape = shape)
  if (length(cl) == 0L) return(FALSE)
  tryCatch({
    withCallingHandlers({
      suppressMessages(utils::capture.output(
        for (b in cl) eval(parse(text = b), env)))
      TRUE
    }, warning = function(w) stop("warning: ", conditionMessage(w)))
  }, error = function(e) { cat("        [run96] ", conditionMessage(e), "\n", sep = ""); FALSE })
}
# .r96(): the first offered call of msg evaluated in env, its value returned
# (a line without modify = TRUE changes nothing in env; its value is the
# data frame it declares on).
.r96 <- function(msg, env, shape = "^  jdeclare_missing\\(") {
  cl <- .r5_calls(strsplit(msg, "\n", fixed = TRUE)[[1]], shape = shape)
  suppressMessages(utils::capture.output(v <- eval(parse(text = cl[1]), env)))
  v
}
.conv96 <- function(cv, expr) {
  old <- getOption(".jst_options_missing_convention")
  options(.jst_options_missing_convention = cv)
  on.exit(options(.jst_options_missing_convention = old), add = TRUE)
  force(expr)
}
.T96 <- data.frame(M = c("Married", "UNKNOWN", "Unknown", "UNKNOWN",
                         "Refused to provide information", "", "  ", NA),
                   R = c(1, 2, -99, 3, 4, 5, 6, NA), stringsAsFactors = FALSE)
.reminder96 <- paste0(
  "This call changes .T96 only if you assign the result:\n",
  "  .T96 <- jdeclare_missing(.T96, M, ...)\n\n",
  "To change .T96 directly, rerun with modify = TRUE:\n",
  "  jdeclare_missing(.T96, M, ..., modify = TRUE)")

# --- A: R26, declaring on a text variable -------------------------------------
check("N96a no convention selected: the declaration is SPSS-style with no menu, and the note names the value that differs only in case, with the line that declares it too (pinned whole)",
      identical(printed(jdeclare_missing(.T96, M, codes = "UNKNOWN")), paste0(
        "Declared SPSS-style missing values on M:\n",
        "  UNKNOWN (no label)\n\n",
        "Note: M also holds a value that differs from a declared value only in letter\n",
        "case or outer spaces:\n",
        "  \"Unknown\" (1)\n",
        "It is not declared, so it counts as valid data.\n",
        "If it also marks missing data, declare it too:\n",
        "  jdeclare_missing(.T96, M, codes = c(\"UNKNOWN\", \"Unknown\"), modify = TRUE)\n\n",
        .reminder96)) &&
        !grepl("convention is selected", grab(jdeclare_missing(.T96, M, codes = "UNKNOWN")), fixed = TRUE))
check("N96b the column: character-backed haven_labelled_spss, the string declared, every cell as it was, the variable label kept",
      local({ d <- .T96; attr(d$M, "label") <- "Marital status"
              r <- suppressMessages(jdeclare_missing(d, M, codes = c(Unknown = "UNKNOWN")))$M
              inherits(r, "haven_labelled_spss") && is.character(unclass(r)) &&
                identical(attr(r, "na_values"), "UNKNOWN") &&
                identical(labelled::val_labels(r), c(Unknown = "UNKNOWN")) &&
                identical(as.vector(unclass(r)), .T96$M) &&
                identical(attr(r, "label", exact = TRUE), "Marital status") }))
check("N96c under a stata and a sas setting: still SPSS-style, with a note naming the setting's style; under spss, no note",
      local({ st <- .conv96("stata", printed(jdeclare_missing(.T96, M, codes = "UNKNOWN")))
              sa <- .conv96("sas", printed(jdeclare_missing(.T96, M, codes = "UNKNOWN")))
              sp <- .conv96("spss", printed(jdeclare_missing(.T96, M, codes = "UNKNOWN")))
              note <- function(s) paste0(
                "\n\nNote: M is a text variable, so its missing values are declared SPSS-style.\n",
                s, " missing values exist only on numeric variables.\n\n")
              startsWith(st, "Declared SPSS-style missing values on M:") &&
                grepl(note("Stata-style"), st, fixed = TRUE) &&
                grepl(note("SAS-style"), sa, fixed = TRUE) &&
                !grepl("Note: M is a text variable", sp, fixed = TRUE) &&
                identical(attr(.conv96("sas", suppressMessages(jdeclare_missing(.T96, M, codes = "UNKNOWN")))$M,
                               "na_values"), "UNKNOWN") }))
check("N96d convention = \"stata\" or \"sas\" refused with the call without it (pinned whole), and the line runs; convention = \"SPSS\" passes with no note",
      local({ a <- grab(jdeclare_missing(.T96, M, codes = "UNKNOWN", convention = "stata"))
              b <- grab(jdeclare_missing(.T96, M, codes = "UNKNOWN", convention = "SAS", modify = TRUE))
              e <- new.env(parent = globalenv()); e$.T96 <- .T96
              identical(a, paste0(
                "jdeclare_missing(): M is a text variable, and Stata-style missing\n",
                "values exist only for numbers.\n",
                "Its missing values are declared SPSS-style; drop convention = \"stata\":\n",
                "  jdeclare_missing(.T96, M, codes = \"UNKNOWN\")")) &&
                identical(b, paste0(
                  "jdeclare_missing(): M is a text variable, and SAS-style missing\n",
                  "values exist only for numbers.\n",
                  "Its missing values are declared SPSS-style; drop convention = \"sas\":\n",
                  "  jdeclare_missing(.T96, M, codes = \"UNKNOWN\", modify = TRUE)")) &&
                .run96(b, e) && identical(attr(e$.T96$M, "na_values"), "UNKNOWN") &&
                !grepl("Note: M is a text", printed(jdeclare_missing(.T96, M, codes = "UNKNOWN",
                                                                     convention = "SPSS")), fixed = TRUE) }))
check("N96e a range refused: with codes, the call without it (pinned whole), which runs; a range alone, no line",
      local({ a <- grab(jdeclare_missing(.T96, M, codes = "UNKNOWN", range = c(-99, -90)))
              b <- grab(jdeclare_missing(.T96, M, range = c(-99, -90)))
              e <- new.env(parent = globalenv()); e$.T96 <- .T96
              identical(a, paste0(
                "jdeclare_missing(): M is a text variable, and a missing-value range\n",
                "exists only for numbers.\n",
                "Declare its values without range =:\n",
                "  jdeclare_missing(.T96, M, codes = \"UNKNOWN\")")) &&
                identical(b, paste0(
                  "jdeclare_missing(): M is a text variable, and a missing-value range\n",
                  "exists only for numbers.\n",
                  "Name its values with codes =, for example codes = \"UNKNOWN\".")) &&
                .run96(a, e) }))
check("N96f numbers for a text variable (lean 1): the call with the codes quoted, names and labels kept (pinned whole); it runs and declares the strings",
      local({ a <- grab(jdeclare_missing(.T96, M, codes = c(Refused = -99)))
              b <- grab(jdeclare_missing(.T96, M, codes = -99, labels = "-99=Refused",
                                         convention = "stata"))
              e <- new.env(parent = globalenv()); e$.T96 <- .T96
              identical(a, paste0(
                "jdeclare_missing(): M is a text variable, so its codes go in quotes:\n",
                "  jdeclare_missing(.T96, M, codes = c(Refused = \"-99\"))")) &&
                grepl("drop convention = \"stata\":\n  jdeclare_missing(.T96, M, codes = \"-99\", labels = \"-99=Refused\")",
                      b, fixed = TRUE) &&
                identical(attr(.r96(a, e)$M, "na_values"), "-99") &&
                identical(labelled::val_labels(.r96(a, e)$M), c(Refused = "-99")) }))
check("N96g ... the numbers line is checked as text first: partial names, a fourth code and a label naming no code each get their own stop, never a line that stops",
      grepl("names some of its codes and not others",
            grab(jdeclare_missing(.T96, M, codes = c(Refused = -99, -98))), fixed = TRUE) &&
        grepl("at most 3 declared missing values (the SPSS limit); the call names 4.",
              .fl(grab(jdeclare_missing(.T96, M, codes = c(-99, -98, -97, -96)))), fixed = TRUE) &&
        grepl("not among the\ncodes: -98=Refused.",
              grab(jdeclare_missing(.T96, M, codes = -99, labels = "-98=Refused")), fixed = TRUE))
check("N96h text and numeric variables, numbers given: the text variable refused in the bulk form with its quoted line (pinned whole), nothing changed; past three codes, no line",
      local({ a <- grab(r <- jdeclare_missing(.T96, M, R, codes = -99, convention = "spss"))
              b <- grab(jdeclare_missing(.T96, M, R, codes = c(-99, -98, -97, -96),
                                         convention = "stata"))
              identical(a, paste0(
                "jdeclare_missing(): cannot declare on 1 of 2 variables; no variable\n",
                "was changed:\n",
                "  M:\n",
                "    M is a text variable, so its codes go in quotes:\n",
                "      jdeclare_missing(.T96, M, codes = \"-99\")")) &&
                endsWith(b, "    M is a text variable, so its codes go in quotes.") &&
                !exists("r", inherits = FALSE) }))
check("N96i text and numeric variables, words given: the numeric one refused, the call on the text variable offered (pinned whole), which runs",
      local({ a <- grab(jdeclare_missing(.T96, vars = c("M", "R"), codes = c("UNKNOWN", "")))
              e <- new.env(parent = globalenv()); e$.T96 <- .T96
              identical(a, paste0(
                "jdeclare_missing(): the codes are text, and R is not a\n",
                "text variable.\n",
                "To declare them on the text variable, run:\n",
                "  jdeclare_missing(.T96, M, codes = c(\"UNKNOWN\", \"\"))")) &&
                identical(attr(.r96(a, e)$M, "na_values"), c("UNKNOWN", "")) }))
check("N96j exact matching (lean 2): a value given in the wrong case declares nothing, marked not present, and the note lists the values it missed, most cases first, with the line (pinned whole)",
      identical(printed(jdeclare_missing(.T96, M, codes = "unknown")), paste0(
        "Declared SPSS-style missing values on M:\n",
        "  unknown (no label; not present in the data)\n\n",
        "Note: M also holds values that differ from a declared value only in letter\n",
        "case or outer spaces:\n",
        "  \"UNKNOWN\" (2)\n",
        "  \"Unknown\" (1)\n",
        "They are not declared, so they count as valid data.\n",
        "If they also mark missing data, declare them too:\n",
        "  jdeclare_missing(.T96, M, codes = c(\"unknown\", \"UNKNOWN\", \"Unknown\"),\n",
        "      modify = TRUE)\n\n",
        .reminder96)))
check("N96k labels both ways (lean 3): codes = c(Refused = ...) and labels = \"...=Refused\" give the same variable; a quoted value holds = and ;, and blank names the blank cells",
      local({ a <- suppressMessages(jdeclare_missing(.T96, M,
                     codes = c(Refused = "Refused to provide information")))$M
              b <- suppressMessages(jdeclare_missing(.T96, M,
                     labels = "\"Refused to provide information\"=Refused"))$M
              c3 <- suppressMessages(jdeclare_missing(.T96, M,
                     labels = "'a=b;c'=Odd; blank=\"No answer; none\""))$M
              identical(a, b) &&
                identical(sort(attr(c3, "na_values")), c("", "a=b;c")) &&
                identical(labelled::val_labels(c3)[["No answer; none"]], "") }))
check("N96l the codes' other refusals: a label naming no code, the same value twice (\"\" and \"  \" are one), a fourth value, NA, a TRUE",
      grepl("labels names a value that is not among the\ncodes: REF=Refused.",
            grab(jdeclare_missing(.T96, M, codes = "UNKNOWN", labels = "REF=Refused")), fixed = TRUE) &&
        grepl("the same value more than\nonce: <blank>.",
              grab(jdeclare_missing(.T96, M, codes = c("", "  "))), fixed = TRUE) &&
        grepl("at most 3 declared missing values",
              .fl(grab(jdeclare_missing(.T96, M, codes = c("a", "b", "c", "d")))), fixed = TRUE) &&
        grepl("`codes` holds NA.",
              grab(jdeclare_missing(.T96, M, codes = NA_character_)), fixed = TRUE) &&
        grepl("must be quoted text",
              grab(jdeclare_missing(.T96, M, codes = TRUE)), fixed = TRUE))
check("N96m a value typed without quotes: ruling R18's pointer, the call with it quoted (pinned whole), which runs; a name holding a value passes; a call whose quoted form would stop gets that stop instead",
      local({ # The calls run where no object named UNKNOWN can be seen --
              # the workspace's included -- since a name holding a value is
              # read as one (ruling R18).
              eb <- new.env(parent = baseenv())
              eb$jdeclare_missing <- jdeclare_missing; eb$.T96 <- .T96
              a <- grab(eval(quote(jdeclare_missing(.T96, M, codes = c(UNKNOWN, ""),
                                                    modify = TRUE)), eb))
              e <- new.env(parent = globalenv()); e$.T96 <- .T96
              held <- "UNKNOWN"
              b <- grab(eval(quote(jdeclare_missing(.T96, M, codes = c(Unknown = UNKNOWN, ""))), eb))
              cc <- grab(eval(quote(jdeclare_missing(.T96, M, codes = UNKNOWN,
                                                     convention = "stata")), eb))
              startsWith(b, "jdeclare_missing(): `codes` names some of its codes and not others.") &&
                endsWith(cc, "  jdeclare_missing(.T96, M, codes = \"UNKNOWN\")") &&
                identical(a, paste0(
                "jdeclare_missing(): UNKNOWN is not in quotes.\n",
                "A text variable's value goes in quotes:\n",
                "  jdeclare_missing(.T96, M, codes = c(\"UNKNOWN\", \"\"), modify = TRUE)")) &&
                .run96(a, e) && identical(attr(e$.T96$M, "na_values"), c("UNKNOWN", "")) &&
                identical(attr(suppressMessages(jdeclare_missing(.T96, M, codes = held))$M,
                               "na_values"), "UNKNOWN") }))
check("N96n a second call replaces: the drop notice names what went, a blank as <blank>; a value given bare keeps its label",
      local({ d <- suppressMessages(jdeclare_missing(.T96, M, codes = c("UNKNOWN", ""),
                                                     labels = "UNKNOWN=Not known"))
              p <- printed(r <- jdeclare_missing(d, M, codes = c("UNKNOWN", "Married")))
              grepl("Note: jdeclare_missing replaced the existing declared missing values for M.\nPreviously declared codes dropped: <blank>.",
                    p, fixed = TRUE) &&
                grepl("  UNKNOWN [\"Not known\"]\n", p, fixed = TRUE) &&
                identical(sort(attr(r$M, "na_values")), c("Married", "UNKNOWN")) }))
check("N96o modify = TRUE writes back, and under a juse() default the variable alone is enough",
      local({ e <- new.env(parent = globalenv()); e$d96 <- .T96
              suppressMessages(eval(quote(jdeclare_missing(d96, M, codes = "UNKNOWN", modify = TRUE)), e))
              ok1 <- identical(attr(e$d96$M, "na_values"), "UNKNOWN")
              .d96g <- .T96
              suppressMessages(juse(.d96g)); on.exit(suppressMessages(juse(NULL)))
              suppressMessages(jdeclare_missing(M, codes = "", modify = TRUE))
              ok1 && identical(attr(.d96g$M, "na_values"), "") }))
check("N96p two text variables: one block naming both (pinned whole)",
      local({ .d2 <- data.frame(A = c("x", "UNKNOWN"), B = c("UNKNOWN", "y"))
              identical(printed(jdeclare_missing(.d2, A, B, codes = "UNKNOWN")), paste0(
                "Declared SPSS-style missing values on 2 variables:\n",
                "  A, B\n",
                "  UNKNOWN (no label)\n\n",
                "This call changes .d2 only if you assign the result:\n",
                "  .d2 <- jdeclare_missing(.d2, A, B, ...)\n\n",
                "To change .d2 directly, rerun with modify = TRUE:\n",
                "  jdeclare_missing(.d2, A, B, ..., modify = TRUE)")) }))

# --- B: R27, codes = "" ------------------------------------------------------------
.D96 <- suppressMessages(jdeclare_missing(.T96, M, codes = c("UNKNOWN", "")))
check("N96q the masks: a declared blank covers the empty, the spaces and the tab cells; any other value only its exact cells",
      identical(jstats:::.jst_text_codes_mask(c("", "  ", "\t", "a", NA, " a"), ""),
                c(TRUE, TRUE, TRUE, FALSE, FALSE, FALSE)) &&
        identical(jstats:::.jst_text_codes_mask(c("a", " a", "A", NA), "a"),
                  c(TRUE, FALSE, FALSE, FALSE)))
check("N96r jfreq(): one <blank> row in the Missing block counting both kinds, before UNKNOWN; the valid base without them; no blank footnote (pinned whole)",
      identical(.strip_ansi(printed(jfreq(.D96, M))), paste0(
        "Frequencies\n\n8 Cases in the 1 Variable Pool\n\nM\n\n",
        "                                Freq  Total %  Valid %  Cum. %\n",
        "------------------------------  ----  -------  -------  ------\n",
        "Valid\n",
        "Married                           1     12.50    33.33   33.33\n",
        "Refused to provide information    1     12.50    33.33   66.67\n",
        "Unknown                           1     12.50    33.33  100.00\n",
        "Total valid                       3     37.50   100.00\n\n",
        "Missing\n",
        "<blank> (no label)                2     25.00       --      --\n",
        "UNKNOWN (no label)                2     25.00       --      --\n",
        "System/NA                         1     12.50       --      --\n",
        "Total missing                     5     62.50\n\n",
        "Total                             8    100.00\n")))
check("N96s the Case Processing detail counts the declared blank as one row of both kinds",
      local({ old <- getOption(".jst_output_level"); options(.jst_output_level = "full")
              on.exit(options(.jst_output_level = old))
              p <- printed(jcrosstab(M ~ R, .D96))
              grepl("      <blank> (no label)     2    25.0\n", p, fixed = TRUE) &&
                grepl("    Auto-listwise         5          3\n", p, fixed = TRUE) }))
check("N96t jconvert(to = \"baseR\") and preserve.declarations = FALSE make every declared cell NA, the spaces cell too",
      local({ r <- suppressMessages(jconvert(.D96, to = "baseR"))
              jsave(.D96, "t96.rds", preserve.declarations = FALSE, overwrite = TRUE)
              s <- readRDS("t96.rds")
              exp <- c("Married", NA, "Unknown", NA, "Refused to provide information", NA, NA, NA)
              identical(as.vector(unclass(r$M)), exp) && is.null(attr(r$M, "na_values")) &&
                identical(as.vector(unclass(s$M)), exp) }))
check("N96u a .sav round trip keeps both declarations, and the cell of spaces reads back missing",
      local({ suppressMessages(jsave(.D96, "t96.sav", overwrite = TRUE))
              invisible(grab(jload("t96.sav", name = "t96r", overwrite = TRUE)))
              r <- t96r
              # 3, not 2: the NA cell comes back an empty string, as a text
              # NA does from every .sav (ruling R13; jsave() says so), and is
              # a blank the declaration covers.
              ok <- identical(sort(attr(r$M, "na_values")), c("", "UNKNOWN")) &&
                grepl("<blank> (no label)                3     37.50", printed(jfreq(r, M)), fixed = TRUE)
              ok }))

check("N96ac jsave()'s CSV note names the declared blank as <blank>, beside the other declared value",
      grepl("M's declared missing values <blank> and \"UNKNOWN\" are written as ordinary values",
            .fl(grab(jsave(.D96, "ac96.csv", overwrite = TRUE))), fixed = TRUE))
check("N96ad at the minimal level the drop notice names a dropped blank as <blank>",
      local({ old <- getOption(".jst_output_level"); options(.jst_output_level = "minimal")
              on.exit(options(.jst_output_level = old))
              grepl("Dropped: <blank>.", printed(jdeclare_missing(.D96, M, codes = "UNKNOWN")),
                    fixed = TRUE) }))

# --- C: R28, the word list -----------------------------------------------------------
check("N96v the word list gains not stated, not known, not recorded, withheld, unknown; whole values only, case and outer spaces ignored",
      all(vapply(c("Not stated", "NOT KNOWN", " not recorded ", "Withheld", "Unknown"),
                 jstats:::.jst_label_suggests_missing, logical(1))) &&
        !jstats:::.jst_label_suggests_missing("Refused to provide information") &&
        !jstats:::.jst_label_suggests_missing("Unknown offender"))

# --- D: jsave() to .sav, a declared text value over 8 bytes ------------------------
.L96 <- data.frame(M = haven::labelled_spss(
  c("Married", "UNKNOWN", "Refused to provide information", "x"),
  na_values = c("UNKNOWN", "Refused to provide information")),
  stringsAsFactors = FALSE)
check("N96w the refusal names the variable and the value, then the four ways out (pinned whole); nothing is written",
      local({ m <- grab(jsave(.L96, "l96.sav"))
              identical(m, paste0(
                "jsave(): SPSS format (.sav) keeps only 8 characters (8 bytes) of a\n",
                "text variable's declared missing value, so a longer one would read back as\n",
                "ordinary data.\n\n",
                "This variable in .L96 declares a longer value:\n",
                "  M: \"Refused to provide information\"\n\n",
                "To save in R format (.rds) instead, keeping it:\n",
                "  jsave(.L96, \".L96.rds\")\n",
                "To save as SPSS format (.sav) with every declared missing value as plain NA:\n",
                "  jsave(.L96, \"l96.sav\", preserve.declarations = FALSE)\n",
                "To make M numbers first, whose missing values SPSS format keeps in full,\n",
                "use jencode().\n",
                "Or shorten the value in the data to 8 characters or fewer, and declare the\n",
                "shorter one.")) && !file.exists("l96.sav") }))
check("N96x ... the preserve.declarations = FALSE line runs and saves; a value of exactly 8 bytes saves and reads back declared; one of 8 characters and 9 bytes is refused",
      local({ m <- grab(jsave(.L96, "l96.sav"))
              e <- new.env(parent = globalenv()); e$.L96 <- .L96
              ran <- .run96(m, e, "^  jsave\\(.*preserve")
              d8 <- data.frame(M = haven::labelled_spss(c("ABCDEFGH", "a"), na_values = "ABCDEFGH"))
              suppressMessages(jsave(d8, "e96.sav", overwrite = TRUE))
              back <- haven::read_sav("e96.sav", user_na = TRUE)
              d9 <- data.frame(M = haven::labelled_spss(c("D\u00e9sol\u00e9!!", "a"),
                                                        na_values = "D\u00e9sol\u00e9!!"))
              ran && file.exists("l96.sav") &&
                identical(attr(back$M, "na_values"), "ABCDEFGH") &&
                grepl("declares a longer value", grab(jsave(d9, "n96.sav")), fixed = TRUE) }))

# --- E: the load scan and Pattern A ----------------------------------------------
.S96 <- data.frame(
  Mode    = haven::labelled(c("X", "A", "B", "X", "A"), labels = c(Refused = "X", Phone = "A")),
  Marital = c("Married", "UNKNOWN", "Unknown", "Not stated", "UNKNOWN"),
  Decl    = haven::labelled_spss(c("a", "Refused", "b", "", "a"), na_values = "Refused"),
  stringsAsFactors = FALSE)
haven::write_sav(.S96, "s96.sav")
check("N96y the load scan reports a text variable by its labels (label-only) and by its wording (suspected), values quoted; a declared value and a blank are not reported; the line is quoted, with no menu (pinned)",
      local({ p <- printed(jload("s96.sav", name = "s96", overwrite = TRUE))
              grepl(paste0(
                "Missing-value codes detected:\n",
                "  Mode:     \"X\" [\"Refused\"] (2)                             [label-only -- not formally declared]\n",
                "  Marital:  \"Not stated\" (1), \"UNKNOWN\" (2), \"Unknown\" (1)  [suspected -- not formally defined]\n"),
                p, fixed = TRUE) &&
                !grepl("Decl:", p, fixed = TRUE) &&
                grepl("To declare one variable's values as missing:\n  jdeclare_missing(s96, Mode, codes = c(Refused = \"X\"), modify = TRUE)",
                      p, fixed = TRUE) &&
                !grepl("convention is selected", p, fixed = TRUE) }))
check("N96z ... the line runs, under no convention and under stata",
      local({ p <- printed(jload("s96.sav", name = "s96", overwrite = TRUE))
              ok <- TRUE
              for (cv in list(NULL, "stata")) {
                e <- new.env(parent = globalenv()); e$s96 <- s96
                ok <- ok && .conv96(cv, .run96(p, e)) && identical(attr(e$s96$Mode, "na_values"), "X")
              }
              ok }))
check("N96aa ... a text variable with more than three such values: the three most frequent, said so, and the line runs",
      local({ d <- data.frame(V = c(rep("UNKNOWN", 4), rep("Refused", 3), rep("N/A", 2), "Unknown", "x"),
                              stringsAsFactors = FALSE)
              haven::write_sav(d, "v96.sav")
              p <- printed(jload("v96.sav", name = "v96", overwrite = TRUE))
              e <- new.env(parent = globalenv()); e$v96 <- v96
              grepl("To declare the three most frequent of one variable's values as missing (a\ntext variable takes at most three):\n  jdeclare_missing(v96, V, codes = c(\"N/A\", \"Refused\", \"UNKNOWN\"),\n      modify = TRUE)",
                    p, fixed = TRUE) && .run96(p, e) &&
                identical(sort(attr(e$v96$V, "na_values")), c("N/A", "Refused", "UNKNOWN")) }))
check("N96ab jconvert(to = \"stata\" or \"sas\"): a text variable is still left out of Pattern A (its values cannot take a marker)",
      local({ ok <- TRUE
              for (to in c("stata", "sas")) {
                m <- grab(jconvert(.S96[, c("Mode", "Marital")], to = to))
                ok <- ok && !grepl("Mode:", m, fixed = TRUE)
              }
              ok }))

# --- F: a value that differs only in case, treated as suspected (S373) -------
# Jeff, S373 ("Okay on all three"): jdeclare_missing()'s note offers the
# line that declares such a value with the values declared -- a declaration
# replaces a variable's values -- and the load scan reports one beside a
# variable's declared values as suspected, its line naming the declared
# values too. One builder, .jst_text_declare_args(). .nb96(): the note's
# block of a printed output, so the tail's "..." lines are not run.
.nb96 <- function(p) {
  b <- strsplit(p, "\n\n", fixed = TRUE)[[1]]
  paste(b[grepl("also holds", b, fixed = TRUE)], collapse = "\n")
}
check("N96ae the note's line on a labelled value: the new value takes the label of the value it differs from (pinned whole); run, the variable declares both, each labelled Unknown",
      local({ p <- printed(jdeclare_missing(.T96, M, codes = c(Unknown = "UNKNOWN")))
              e <- new.env(parent = globalenv()); e$.T96 <- .T96
              ran <- .run96(.nb96(p), e)
              lab <- attr(e$.T96$M, "labels")
              identical(p, paste0(
                "Declared SPSS-style missing values on M:\n",
                "  UNKNOWN [\"Unknown\"]\n\n",
                "Note: M also holds a value that differs from a declared value only in letter\n",
                "case or outer spaces:\n",
                "  \"Unknown\" (1)\n",
                "It is not declared, so it counts as valid data.\n",
                "If it also marks missing data, declare it too:\n",
                "  jdeclare_missing(.T96, M,\n",
                "      codes = c(Unknown = \"UNKNOWN\", Unknown = \"Unknown\"), modify = TRUE)\n\n",
                .reminder96)) && ran &&
                setequal(attr(e$.T96$M, "na_values"), c("UNKNOWN", "Unknown")) &&
                identical(unname(names(lab)[match(c("UNKNOWN", "Unknown"), lab)]),
                          c("Unknown", "Unknown")) }))
check("N96af ... some values labelled and some not: bare codes with labels = for the labelled (pinned whole); run, the blank stays declared, both labels set",
      local({ d <- suppressMessages(jdeclare_missing(.T96, M, codes = c(Unknown = "UNKNOWN")))
              p <- printed(jdeclare_missing(d, M, codes = c("UNKNOWN", "")))
              e <- new.env(parent = globalenv()); e$d <- d
              ran <- .run96(.nb96(p), e)
              lab <- attr(e$d$M, "labels")
              grepl(paste0(
                "It is not declared, so it counts as valid data.\n",
                "If it also marks missing data, declare it too:\n",
                "  jdeclare_missing(d, M, codes = c(\"UNKNOWN\", \"\", \"Unknown\"),\n",
                "      labels = \"UNKNOWN=Unknown; Unknown=Unknown\", modify = TRUE)\n\n"),
                p, fixed = TRUE) && ran &&
                setequal(attr(e$d$M, "na_values"), c("UNKNOWN", "", "Unknown")) &&
                identical(unname(names(lab)[match(c("UNKNOWN", "Unknown"), lab)]),
                          c("Unknown", "Unknown")) &&
                sum(is.na(e$d$M) | e$d$M %in% c("", "  ", "UNKNOWN", "Unknown")) == 6L }))
check("N96ag ... past a text variable's three values: no line, and the way to make it missing (pinned whole)",
      identical(printed(jdeclare_missing(.T96, M,
                  codes = c("UNKNOWN", "Refused to provide information", ""))), paste0(
        "Declared SPSS-style missing values on M:\n",
        "  <blank> (no label)\n",
        "  Refused to provide information (no label)\n",
        "  UNKNOWN (no label)\n\n",
        "Note: M also holds a value that differs from a declared value only in letter\n",
        "case or outer spaces:\n",
        "  \"Unknown\" (1)\n",
        "It is not declared, so it counts as valid data.\n",
        "A text variable can have at most 3 declared missing values, so it cannot be\n",
        "declared too.\n",
        "To make it missing as well, encode M with jencode(), whose map can send each\n",
        "value to missing.\n\n",
        .reminder96)))
check("N96ah ... the data as given: an expression gets no line; a place the assignment form, which runs; under a juse() default the line names the frame and runs",
      local({ d <- data.frame(M = c("UNKNOWN", "Unknown", "REF"), stringsAsFactors = FALSE)
              p1 <- printed(jdeclare_missing(d[1:3, , drop = FALSE], M, codes = "UNKNOWN"))
              lst <- list(d = d)
              p2 <- printed(jdeclare_missing(lst$d, M, codes = "UNKNOWN"))
              e2 <- new.env(parent = globalenv()); e2$lst <- lst
              ran2 <- .run96(.nb96(p2), e2, "^  lst\\$d <- jdeclare_missing\\(")
              .d96h <- d
              suppressMessages(juse(.d96h)); on.exit(suppressMessages(juse(NULL)))
              p3 <- printed(jdeclare_missing(M, codes = "UNKNOWN"))
              e3 <- new.env(parent = globalenv()); e3$.d96h <- d
              ran3 <- .run96(.nb96(p3), e3)
              grepl("also holds", p1, fixed = TRUE) &&
                !grepl("declare it too", p1, fixed = TRUE) &&
                grepl("  lst$d <- jdeclare_missing(lst$d, M,", p2, fixed = TRUE) && ran2 &&
                setequal(attr(e2$lst$d$M, "na_values"), c("UNKNOWN", "Unknown")) &&
                grepl("  jdeclare_missing(.d96h, M, codes = c(\"UNKNOWN\", \"Unknown\"),",
                      p3, fixed = TRUE) && ran3 &&
                setequal(attr(e3$.d96h$M, "na_values"), c("UNKNOWN", "Unknown")) }))
.mk96 <- function(x, labs, na) {
  data.frame(Marital = haven::labelled_spss(x, labels = labs, na_values = na),
             stringsAsFactors = FALSE)
}
haven::write_sav(.mk96(c("Married", "UNKNOWN", "REF", "ref", "ref", "Single"),
                       c(Unknown = "UNKNOWN", Refused = "REF"), c("UNKNOWN", "REF")),
                 "u96.sav")
check("N96ai the load scan reports a value that differs from a declared one only in case as suspected, and its line names the declared values too (pinned)",
      grepl(paste0(
        "Suspected missing-value codes detected:\n",
        "  Marital:  \"ref\" (2)\n\n",
        "These codes are not formally defined, so they are not treated as missing.\n",
        "Declare them as missing if they are; leave as-is if real.\n\n",
        "To declare one variable's values as missing, with the ones it\n",
        "already declares:\n",
        "  jdeclare_missing(u96, Marital,\n",
        "      codes = c(Unknown = \"UNKNOWN\", Refused = \"REF\", Refused = \"ref\"),\n",
        "      modify = TRUE)"),
        printed(jload("u96.sav", name = "u96", overwrite = TRUE)), fixed = TRUE))
check("N96aj ... the line runs, nothing dropped: the three declared, each labelled; before S373 a line naming the new value alone dropped the others",
      local({ p <- printed(jload("u96.sav", name = "u96", overwrite = TRUE))
              e <- new.env(parent = globalenv()); e$u96 <- u96
              m <- NULL
              ran <- tryCatch({
                cl <- .r5_calls(strsplit(p, "\n", fixed = TRUE)[[1]], "^  jdeclare_missing\\(")
                m <- printed(eval(parse(text = cl[1]), e)); TRUE },
                error = function(err) FALSE)
              lab <- attr(e$u96$Marital, "labels")
              ran && !grepl("dropped", m, fixed = TRUE) &&
                setequal(attr(e$u96$Marital, "na_values"), c("UNKNOWN", "REF", "ref")) &&
                identical(unname(names(lab)[match(c("UNKNOWN", "REF", "ref"), lab)]),
                          c("Unknown", "Refused", "Refused")) }))
check("N96ak ... room for one more: the most frequent, said so, with the declared values, and it runs; three declared: no line, and the way to make more missing",
      local({ haven::write_sav(.mk96(c("Married", "UNKNOWN", "Unknown", "REF", "ref", "ref", "Single"),
                                     c(Unknown = "UNKNOWN", Refused = "REF"), c("UNKNOWN", "REF")),
                               "u96b.sav")
              p1 <- printed(jload("u96b.sav", name = "u96b", overwrite = TRUE))
              e <- new.env(parent = globalenv()); e$u96b <- u96b
              ran <- .run96(p1, e)
              haven::write_sav(.mk96(c("Married", "UNKNOWN", "REF", "DK", "Not stated", "Single"),
                                     c(Unknown = "UNKNOWN", Refused = "REF"), c("UNKNOWN", "REF", "DK")),
                               "u96c.sav")
              p2 <- printed(jload("u96c.sav", name = "u96c", overwrite = TRUE))
              grepl(paste0("To declare the most frequent of one variable's values as missing, with the\n",
                           "ones it already declares (a text variable takes at most three):\n",
                           "  jdeclare_missing(u96b, Marital,\n",
                           "      codes = c(Unknown = \"UNKNOWN\", Refused = \"REF\", Refused = \"ref\"),"),
                    p1, fixed = TRUE) && ran &&
                setequal(attr(e$u96b$Marital, "na_values"), c("UNKNOWN", "REF", "ref")) &&
                grepl(paste0("Marital already declares 3 missing values, the most a text\n",
                             "variable can have.\n",
                             "To make more of its values missing, encode it with jencode(), whose map can\n",
                             "send each one to missing."), p2, fixed = TRUE) &&
                !grepl("jdeclare_missing(", p2, fixed = TRUE) }))
check("N96al ... a declared value with no label beside a suspected one: bare codes, and the placeholder line with labels =; both run, the declared value kept",
      local({ haven::write_sav(data.frame(Marital = haven::labelled_spss(
                                 c("Married", "UNKNOWN", "Not stated", "Single"),
                                 labels = c(Married = "Married"), na_values = "UNKNOWN"),
                                 stringsAsFactors = FALSE), "u96d.sav")
              p <- printed(jload("u96d.sav", name = "u96d", overwrite = TRUE))
              cl <- .r5_calls(strsplit(p, "\n", fixed = TRUE)[[1]], "^  jdeclare_missing\\(")
              e1 <- new.env(parent = globalenv()); e1$u96d <- u96d
              e2 <- new.env(parent = globalenv()); e2$u96d <- u96d
              suppressMessages(utils::capture.output(eval(parse(text = cl[1]), e1),
                                                     eval(parse(text = cl[2]), e2)))
              lab2 <- attr(e2$u96d$Marital, "labels")
              length(cl) == 2L &&
                grepl("codes = c(\"UNKNOWN\", \"Not stated\"),\n      modify = TRUE)", p, fixed = TRUE) &&
                grepl("labels = \"Not stated=label1\", modify = TRUE)", p, fixed = TRUE) &&
                setequal(attr(e1$u96d$Marital, "na_values"), c("UNKNOWN", "Not stated")) &&
                setequal(attr(e2$u96d$Marital, "na_values"), c("UNKNOWN", "Not stated")) &&
                identical(unname(names(lab2)[match("Not stated", lab2)]), "label1") }))
check("N96am .jst_text_value_rule(): a value holding ; or =, opening with a mark, with outer spaces or spelled blank is quoted in the mark it lacks; a blank is blank; the labels string parses back to the values. .jst_text_declare_args() gives no argument past three values",
      local({ v <- c("", "REF", "A;B", "x=y", " pad", "Blank", "say \"no\"")
              r <- vapply(v, .jst_text_value_rule, character(1), USE.NAMES = FALSE)
              s <- eval(parse(text = paste0("\"",
                     paste0(r, "=L", seq_along(r), collapse = "; "), "\"")))
              back <- .jst_parse_text_labels(s)
              col3 <- haven::labelled_spss(c("A", "B", "C", "x"), na_values = c("A", "B", "C"))
              a4 <- .jst_text_declare_args(col3, "x")
              a3 <- .jst_text_declare_args(col3[1:3], character(0))
              identical(r[1:2], c("blank", "REF")) &&
                identical(unname(back), v) && identical(names(back), paste0("L", seq_along(v))) &&
                is.null(a4$arg) && identical(a4$n, 4L) &&
                identical(a3$arg, "codes = c(\"A\", \"B\", \"C\")") }))
check("N96an the labels the line gives: a value with outer spaces takes its twin's label; a value with a label of its own keeps it; the scan's placeholders go only to the values with none; each line runs",
      local({ d1 <- data.frame(M = c("UNKNOWN", " unknown ", "x"), stringsAsFactors = FALSE)
              p1 <- printed(jdeclare_missing(d1, M, codes = c(Unknown = "UNKNOWN")))
              d2 <- data.frame(M = haven::labelled(c("UNKNOWN", "Unknown", "x"),
                                 labels = c(Unknown = "UNKNOWN", "Not known" = "Unknown")),
                               stringsAsFactors = FALSE)
              p2 <- printed(jdeclare_missing(d2, M, codes = "UNKNOWN"))
              e2 <- new.env(parent = globalenv()); e2$d2 <- d2
              ran2 <- .run96(.nb96(p2), e2)
              haven::write_sav(.mk96(c("Married", "UNKNOWN", "Unknown", "Not stated", "Single"),
                                     c(Unknown = "UNKNOWN"), "UNKNOWN"), "u96e.sav")
              p3 <- printed(jload("u96e.sav", name = "u96e", overwrite = TRUE))
              cl <- .r5_calls(strsplit(p3, "\n", fixed = TRUE)[[1]], "^  jdeclare_missing\\(")
              e3 <- new.env(parent = globalenv()); e3$u96e <- u96e
              suppressMessages(utils::capture.output(eval(parse(text = cl[2]), e3)))
              lab3 <- attr(e3$u96e$Marital, "labels")
              grepl("codes = c(Unknown = \"UNKNOWN\", Unknown = \" unknown \"), modify = TRUE)",
                    .fl(p1), fixed = TRUE) &&
                grepl("codes = c(Unknown = \"UNKNOWN\", \"Not known\" = \"Unknown\"), modify = TRUE)",
                      .fl(p2), fixed = TRUE) && ran2 &&
                identical(unname(names(attr(e2$d2$M, "labels"))[match("Unknown", attr(e2$d2$M, "labels"))]),
                          "Not known") &&
                length(cl) == 2L &&
                grepl("codes = c(Unknown = \"UNKNOWN\", label1 = \"Not stated\", Unknown = \"Unknown\"), modify = TRUE)",
                      .fl(p3), fixed = TRUE) &&
                identical(unname(names(lab3)[match(c("UNKNOWN", "Unknown", "Not stated"), lab3)]),
                          c("Unknown", "Unknown", "label1")) }))
rm(.nb96, .mk96)
if (exists("u96", inherits = FALSE)) rm(u96)
if (exists("u96b", inherits = FALSE)) rm(u96b)
if (exists("u96c", inherits = FALSE)) rm(u96c)
if (exists("u96d", inherits = FALSE)) rm(u96d)
if (exists("u96e", inherits = FALSE)) rm(u96e)

setwd(.wd96)
unlink(.td96, recursive = TRUE)
options(.jst_options_missing_convention = .cv96, .jst_missing_notice_shown = .ns96)
rm(.wd96, .td96, .cv96, .ns96, .run96, .r96, .conv96, .T96, .D96, .L96, .S96, .reminder96)
if (exists("t96r", inherits = FALSE)) rm(t96r)
if (exists("s96", inherits = FALSE)) rm(s96)
if (exists("v96", inherits = FALSE)) rm(v96)

# N88s (S353) -- RULING R5 OVER EVERY CONDITION THE BATTERY TOOK. Each call a
# message printed at the pinned width (an indented line with the shape of a
# call or an assignment, a call laid out over lines kept whole): one whose
# one-line form is wider than the width is laid out over lines, never left
# as one long line; and a laid-out call's lines fit the width, the lines
# over it listed by text below, each a single piece that cannot break. A
# line holding a <placeholder> is a pattern, not a call, and is left out.
.r5s <- list(n = 0L, laid = 0L, long = character(0), over = character(0))
for (.s in .sw) {
  .b5 <- .r5_calls(strsplit(.s$text, "\n", fixed = TRUE)[[1]],
                   shape = "^ {2,}[A-Za-z.][A-Za-z0-9._$]*(\\[[^]]*\\])* *(\\(|<- )")
  for (.b in .b5[!grepl("<[A-Za-z][A-Za-z ]*>", .b5)]) {
    .r5s$n <- .r5s$n + 1L
    .l <- strsplit(.b, "\n", fixed = TRUE)[[1]]
    if (length(.l) > 1L) .r5s$laid <- .r5s$laid + 1L
    if (length(.l) == 1L && nchar(.l) + 2L > .pin_width)
      .r5s$long <- c(.r5s$long, .l)
    # A single piece -- a quoted path, a long name -- is kept whole past the
    # width (ruling R5); since S359 one is not counted over it. A temporary
    # path in jsave()'s offered line reached it on a long temp folder.
    if (length(.l) > 1L) .r5s$over <- c(.r5s$over, .l[nchar(.l) > .pin_width &
                                         !grepl("^ *(\"[^\"]*\"|'[^']*'|[^ \"']+)[,)]*$", .l)])
  }
}
check(paste0("N88s every call in a message, at the pinned width: none left as one long line, and a laid-out call over the width only in a single piece (",
             .r5s$n, " calls, ", .r5s$laid, " laid out)"),
      .r5s$n >= 300L && .r5s$laid >= 20L && length(.r5s$long) == 0L &&
        length(unique(.r5s$over)) == 0L)
if (length(.r5s$long) > 0L) for (l in unique(.r5s$long)) cat("        one long line: ", l, "\n")
if (length(.r5s$over) > 0L) for (l in unique(.r5s$over)) cat("        over the width: ", l, "\n")
rm(.r5s, .s, .b5, .b, .l)

options(.jst_options_missing_convention = NULL)
# Placed ABOVE the verdict so a failing run still leaves the session clean.

options(.jst_options_missing_convention = .entry_convention)
options(.jst_options_message_width = .entry_message_width)
options(.jst_output_level = .entry_output_level)
options(.jst_output_toggles = .entry_output_toggles)

# --- Verdict -----------------------------------------------------------------

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
