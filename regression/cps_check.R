# =============================================================================
# cps_check.R -- assertion battery for the CPS visibility redesign
# =============================================================================
# TYPE:     assertion battery (PASS/FAIL; written for Claude's checking)
# LOCKS:    the S284 CPS visibility rules as shipped -- Table 1's four
#           visibility rows, rule 2's Auto-listwise suppression at zero,
#           Table 4's three N-line forms, rule 4's bottom placement, and the
#           blank-line contract the analysis functions depend on; since S312
#           the filter accounting: the breakdown's jcomplete()-only rows and
#           the case.processing.filter slot, the "(k missing)" note on the
#           jsubset() and subset = rows, and the breakdown's Filtered column
#           and "Missing data" header; since S313 the block-centered values
#           in jcomplete()'s set-time table and jscreen's Missing Data table;
#           since S315 a range-only declaration's breakdown and the shared
#           system-NA count (AUDIT-007); since S316 the grouped layout's
#           case accounting (AUDIT-027): the by = row, the N line's grouped
#           count and described-variable count, the group tables' Total and
#           Non_missing columns, the two stops, and the closing blank;
#           (v0.9.192) jdesc's two tables block-centered and trimmed; and
#           since S320 the screening layout: jscreen()'s table when a filter
#           is active, nothing added when none is, and the excluded count on
#           its Cases line in never-mode; since S327 jt's Group Descriptives
#           table in jdesc's form; and since S328 the ONE LEAN -- where a
#           header or a value cannot be centered exactly, the odd space on
#           the LEFT -- in those tables and in the Case Processing block
#           itself, jfreq's table in the form (the scope lock retired), and
#           the renderer's defaults with trim on; and since S332 joutput()'s
#           setting echo -- the first thing here that is not a table: a
#           setting call prints what it touched, a level call the full
#           panel, a setting name in first position is a query.
# ORIGIN:   S287 (design S284, code S286 v0.9.161, whitespace S287 v0.9.162)
# S348 EDIT (v0.9.221, 2026-10-10): Fix Slate 7, first half. N60a-m NEW
#           (13 checks): a grouped jdesc's listwise note and its count,
#           taken among the cases with a group (58, where the pool's is
#           63); at minimal "Grouped Cases" and the complete-on-all count,
#           none for one variable, the plain "Cases" when the grouping
#           variable excludes no case, the ungrouped call unchanged; the
#           note under a jcomplete() that covers some of the analysis
#           variables, naming those it does not cover, in jdesc() and
#           jfreq(), silent when it covers them all; "--" for a pool
#           percent of no cases, in jt() and jcorr(), and numbers where
#           the filter leaves rows. N52i RE-PINNED (the grouped line now
#           "65 Grouped Cases in the 2 Variable Pool; 61 Complete on All
#           (5 Excluded)"); N57f, N57h, N58a and N58b RE-PINNED under
#           rulings R4 and R7 (jfreq()'s "Total valid" and "Total missing"
#           rows, and the columns they widened); n_line() reads "Grouped
#           Cases". 244 checks. Captures outside check() go through .pl60(),
#           which returns a stop's text (guard 3). Sandbox (R 4.3.3, UTF-8
#           locale, pkgload::load_all): 244/244 plain and under the
#           RStudio-handler stand-in, each also with a Windows-length temp
#           path, and entered dirty.
#           MUTATION MAP (S348): the grouped call given no data N52i N60a
#           N60c N60f; given every case, not the grouped ones N52i N60a
#           N60c; the grouping variable counted in the pool N30d N60e;
#           "Grouped Cases" whenever by = is used N30d N52j N60f; never
#           N52i N60c N60e; a covered variable named N60j; the note silent
#           under any jcomplete() N60h N60i N60j; the pool percent "NaN"
#           again N60l; always "--" N38c N39c N41a N42b N42d N43b N45a N48b
#           N48e N52m N55c N60m; jfreq()'s "Total valid" never N57f N57h
#           N58a N58b, always N53h N58h N58i; "Total missing" at one row
#           N58a N58b. Equivalent, kept: the column-width input left at
#           "NaN" (C08) -- it only sizes the column, and a source percent
#           is at least "0.0", as wide.
#           LAST VERIFIED: v0.9.221, 2026-10-10 (S348) -- 244/244 on
#           the WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run,
#           2177 checks)") through receive_all(), after a clean R CMD
#           check, matching the sandbox; GitHub 2a49208.
# S346 EDIT (v0.9.219, 2026-10-08): joutput()'s DIAGNOSTICS SETTING, on
#           Jeff's ruling of that day. N59a-k NEW (11 checks): the echo
#           with no "(override)", names stored and shown in capitals, OFF
#           in the panel at every level, a level call keeping the
#           setting, joutput(NULL) clearing it, a named NULL and a query,
#           no levene line or setting, the stops for a name that is no
#           diagnostic and for a wrong type, and the c() form for several
#           names typed in one string. N56b f h i j k l m o w MOVED from
#           the levene setting, which is gone, to regression.ci, and the
#           panel they count is 16 lines for 17. 231 checks.
#           Sandbox: 231/231 plain and under the RStudio-handler
#           stand-in, each also with a Windows-length temp path, and
#           entered dirty. On the 0.9.218 master 13 red: N56j N56k N56l,
#           N59a-e N59g-k. MUTATION MAP (S346; the mutants of
#           format_check.R's list that red here): the full level turning
#           diagnostics on N59c; a level call dropping the setting N59d;
#           the panel's "(override)" N59a N59b N59d N59e N59g; an unknown
#           name passing N59i N59j N59k; no c() stop N59j; a wrong type
#           passing N59i; joutput() not checking the value N59i-k; jlm's
#           set without its plots N59b N59i-k; one flat group stopping
#           the standard ANOVA N58j.
#           THE SESSION GUARD hands back the stored display settings
#           (.jst_output_toggles) with the output level: the diagnostics
#           setting outlives a level call, so a run entered with
#           joutput(diagnostics = TRUE) left the session without it
#           (found entering dirty; all seven batteries with the guard).
#           LAST VERIFIED: v0.9.219, 2026-10-09 (S346) -- 231/231 on
#           the WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run,
#           2079 checks)") through receive_all(), after a clean R CMD
#           check, matching the sandbox; GitHub 14528c6.
# S340 EDIT (v0.9.214, 2026-10-05): Fix Slate 3, text variables. TWO NEW
#           SECTIONS, 31 checks. N57a-n (14): a STRING variable's declared
#           missing values -- .jst_missing_info()'s text arm (the declared
#           strings as the codes, in a fixed order, labeled; no coercion
#           warning; a stray range declares nothing), the masking pass,
#           jfreq()'s Missing rows and percentages, the Case Processing
#           rows, a group function, jscreen(). N58a-q (17): BLANK text
#           cells as one category, <blank> -- jfreq()'s row (first among
#           the valid rows in every collation, N58q), its footnote in four
#           forms and its return value; jscreen()'s header line, Blank and
#           % Blank columns, class and distinct count, and return value.
#           Fixtures t57 and b58, inline, removed at each section's foot.
#           TWO HUNDRED AND TWENTY checks.
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): 220/220 plain
#           and under the RStudio-handler stand-in, each also with a
#           Windows-length temp path, and entered dirty (joutput("full"),
#           width 110, a juse() default, a stata convention, jstats.color =
#           TRUE, workspace objects named like fixture variables): the
#           width, the default frame, the level, the convention and the
#           color option handed back, nothing left but .results.
#           On the 0.9.213 master 27 red: N57a-l, N57n and every N58 but
#           N58f, N58j and N58n. Controls, on no mutant's list by design:
#           N57c, N57m, N58f, N58j, N58n (what must not change).
#           MUTATION MAP -- 74 one-change mutants of the 0.9.214 source,
#           each run against all eight batteries, each red. Those that red
#           here (the other files list their own):
#             missing_info: text arm off N57a b d-l n; labels not matched
#             N57a f h i; declaration order kept N57a e f; text flag FALSE
#             N57a e f h-l n; a stray range returned as declared N57d;
#             masking pass text arm off N57e (jfreq then halts on its own
#             internal check); jfreq Missing rows counted as numbers N57f
#             h; CPS rows the same N57i; group codes always numeric N57j;
#             whitespace cells not blank N58a b c d h k l m p; the blank
#             level last N58a c h; the footnote dropped N58a b d g h i;
#             blank cells not labeled, or the labelled-string blank row
#             last N58i; footnote line 2 always plural N58d; the
#             whitespace-only form gone N58d h; jscreen header line dropped
#             N58k l o; Blank columns never shown N58l o; class and count
#             on unlabeled cells N58m; blank cases counted with AND N58k l
#             o; % Blank at no decimals N58l o; jfreq return without the
#             blank count N58c e; a factor's blanks counted zero N58i;
#             plain text not through the blank-first factor N58q.
#           One mutant was DROPPED as equivalent and its code removed: a
#           labeling step in jlm() and jlogistic() that the dummy expansion
#           already performs (no battery and no probe told the two apart).
#           LAST VERIFIED: v0.9.214, R 4.6.1, 2026-10-05 (S340) -- 220/220 on
#           the WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run,
#           1734 checks)") after receive_package() and a clean R CMD check,
#           matching the sandbox; GitHub 2d04b68.
# S337 EDIT (v0.9.211, 2026-10-05; no package change): the two session guards
#           of _template_check.R. A GREEN run now removes everything the
#           battery made (the names in the workspace are recorded at Setup;
#           .results stays, for run_all.R), so a walk that reports on the data
#           frames in the workspace can follow it in one session. A red run
#           keeps its fixtures. The output level is recorded at Setup and
#           handed back at the foot (the S327 finding: entered at
#           joutput("full") the file returned the session at the default). NO
#           message sweep was added (the S291 item named this file): every
#           condition it raises is a one- or two-line paragraph, on which a
#           premature-break assertion cannot fail, and a mutant wrapping every
#           message 12 columns early left one green. No check added or changed:
#           189/189 in the sandbox, plain, under the RStudio-handler stand-in,
#           and ENTERED DIRTY (joutput("full"), width 90, a juse() default, a
#           stata convention): nothing left but .results, and the width, the
#           default frame, the level and the convention as they were on entry.
#           (Setup still clears stored jsubset(), jcomplete() and registration
#           settings, as it always has.)
# S332 EDIT (v0.9.208): joutput()'s SETTING ECHO. N56a-x NEW, TWENTY-FOUR
#           checks, one section before LOCKSTEP; nothing else in the file
#           changed, and the unedited S328 battery reads 165/165 on the new
#           master (the build moves nothing this file already held). A
#           setting call echoes the title, the lines it named and the
#           pointer (N56a N56b); the three Case Processing settings echo
#           together when one is WRITTEN (N56c-e); a named NULL echoes its
#           current value, writes nothing and pulls no partner (N56f-h);
#           quiet silences a setting call (N56i); a level call and a bare
#           call keep the full panel (N56j-l); a setting name in first
#           position is a query, whatever quiet says, pulling no partner
#           (N56m-p); a NAMED level = "digits" stays the level error
#           (N56q); a near miss names the setting, at two edits and not
#           three (N56r-t); joutput(digits = 3) is no override (N56u,
#           Session 181); joutput(NULL) keeps its lines (N56v); a setting
#           call adds to the overrides and a level call clears them
#           (N56w N56x). ONE HUNDRED AND EIGHTY-NINE checks.
#           MUTATION MAP (S332, sandbox, thirty mutants, one change each,
#           every one red): the partial panel forced off (M01) reds N56a-h
#           N56m N56o N56p N56u; the pointer dropped (M02) or the closing
#           blank line dropped (M26) the same less N56u; the Level line
#           left in a partial echo (M03) as M01. The related map emptied
#           (M04) reds N56c N56d N56e; each of its three entries cut to one
#           partner (M23 M24 M25) reds its own of N56d N56c N56e; partners
#           pulled by a NAMED setting rather than a written one (M05) N56g.
#           The echo built from the written settings only (M06) N56f N56g
#           N56h; a named NULL alone read as a bare query (M07) N56f N56g
#           N56i; quiet ignored on a setting call (M08) N56i. A query that
#           respects quiet (M09) N56m N56n; that pulls partners (M10) N56p;
#           that takes one name only (M27) N56o; the panel in the caller's
#           order (M28) N56c N56e N56o. The lone-argument test ignoring the
#           argument name (M11), or dropped from the query test (M22),
#           N56q; quiet = counted in the shape (M21) N56m N56n. The
#           near-miss branch off (M12) N56r N56s; its threshold at 1 (M13)
#           or 3 (M14) N56s; case-sensitive (M15) N56r; the error quoting a
#           lowercased copy (M16) N56r. The override test back to
#           identical() (M17) N56u. A level call echoing its settings alone
#           (M18) N56k, or a partial panel of everything (M19) N56j N56k;
#           keeping the earlier overrides (M29) N56x -- M29 SURVIVED the
#           first twenty-two checks, and N56w N56x were written for it. A
#           setting call starting from an empty override list (M30) N56w.
#           The setting echoed but not written (M20) reds N56a-e N56h N56i
#           N56m N56o N56u N56w and eleven older checks that set a
#           Case Processing setting (N05 N06a-c N13 N27 N42c N42d N43b
#           N54f N54h).
#           Against the unedited 0.9.207 master: 173/189 -- N56a-i N56m-p
#           N56r N56s N56u red; N56j-l N56q N56t N56v-x are the controls,
#           green on both.
# S328 EDIT (v0.9.204): THE LEAN, AND THE SCOPE LOCK RETIRED. Step 2 of the
#           formatting sequence; format_check.R sections L-Q carry the build.
#           Here: ELEVEN checks RE-PINNED for the lean -- the odd space on
#           the LEFT now (Jeff, S328), so the text sits one place right of
#           where it did: N49a N49c N49d N49e (jcomplete()'s set-time
#           table), N50a N50b N50c (jscreen's Missing Data table), N53a
#           N53b N53c (jdesc's two tables) and N53g (jt's Group Descriptives
#           header). N53f turned over: trim is ON by default. N53h, the
#           scope lock, RETIRED as a lock and kept as jfreq's entry -- its
#           table takes the form. N53i re-pinned: the renderer's defaults
#           keep numbers right and text left, their lines trimmed. N55a-c
#           NEW: the lean in the Case Processing block itself, which nothing
#           here could see -- the breakdown's counts are read as numbers and
#           the pinned header lines center exactly. ONE HUNDRED AND
#           SIXTY-FIVE checks.
#           MUTATION MAP (S328, sandbox; the mutants are format_check.R's,
#           179 in all, every one run against this file -- these are the
#           ones it sees). THE RENDERER: a centered header's lean back (R1)
#           reds N49c N49e N53a N53g; a "bc" block's (R2) N49a N49d N49e
#           N50a N50b N50c N53a N53b N53c N53h; a "bd" block's (R3) N53a;
#           the Case Processing block's ctr_count() (R4) N55a N55b N55c,
#           and NOTHING in format_check.R; trim off by default (R5) N53e
#           N53f N53h N53i; "bc" the default for a numeric column (R6) or
#           a text column (R7) N53i; the header row not trimmed (R8) N53e;
#           the data rows not trimmed (R9) N53f N53h N53i. THE CALL SITES,
#           with "c" / with "r" / with no align argument, in place of
#           "bc" ("--" where the mutant reds nothing here): jt's Group
#           Descriptives -- / N53g / N53g; jfreq N53h / N53h (it has no
#           third form); jcomplete()'s set-time table N49a N49b N49e /
#           N49a N49d N49e / N49a N49b N49d N49e; jscreen's Missing and %
#           Missing N50a N50b N50c / the same; its Outliers -- / N50a N50b
#           N50c; jdesc grouped N53c / N53b N53c / N53b N53c; jdesc
#           ungrouped -- / N53a. .jst_data_dp() giving whole numbers one
#           place (DP1) reds N53a N53b; not dropping missing values (DP5)
#           HALTS the battery.
#           Against the unedited 0.9.203 master: 148/165 -- the eleven
#           re-pinned checks, N53f N53h N53i and N55a-c red.
# S327 EDIT (v0.9.203): THE SCOPE LOCK MOVED. The first slice of the S316
#           package-wide item gave jdesc's form ("bc" and trim = TRUE) to
#           the 17 statistics tables still on the default alignment;
#           format_check.R section J asserts them. Here: N53g, the S316
#           scope lock ("jt's Group Descriptives table is unchanged"), is
#           RE-PINNED to jt's new header line (the data row did not move:
#           every value fills its column); N53h NEW, the scope lock moved
#           to a table still outside the change, jfreq's (its explicit "r"
#           columns and padded lines, read untrimmed); N53i NEW, the
#           renderer's own defaults (no align: numbers right, text left,
#           lines padded), which the old N53g guarded only through jt's
#           table. ONE HUNDRED AND SIXTY-TWO checks.
#           MUTATION MAP (S327, sandbox; the mutants are format_check.R's
#           -- these are the ones this file sees): jt's Group Descriptives
#           back on the default alignment (A02) reds N53g; jfreq's columns
#           given "bc" (F1) reds N53h; "bc" made the renderer's default for
#           a numeric column (R3) reds N53i ALONE in eight batteries --
#           before N53i it red NOTHING: three calls still pass no align,
#           the Crosstab table's columns are text, and no check reads the
#           other two (jcomplete()'s preview, the dummy-scheme table); trim
#           on by default (R4) reds N53f N53h N53i; the "bc" tie rule
#           flipped (R1) reds N49a N49d N49e N50a-c N53a-c; a centered
#           header's tie rule flipped (R2) reds N49c N49e N53a N53g.
#           jscreen's Cases line with its Excluded count put back on cat()'s
#           default separator (a trailing space) reds nothing here -- N54g-i
#           read lines with trailing spaces removed -- and format_check.R
#           K12 holds it.
#           Against the unedited 0.9.202 master: 161/162, N53g red (N53h
#           and N53i hold there by construction: they lock what the build
#           must NOT change, and F1, R3 and R4 are what make them checks).
# LAST VERIFIED: v0.9.204 PENDING, 2026-10-02 (S328) -- 165/165 in the
#           SANDBOX (R 4.3.3, UTF-8 locale, pkgload::load_all of the build;
#           run_all.R 1262 across eight); WORKSTATION run pending Jeff's
#           receive of the 0.9.204 master. Prior: v0.9.203, 2026-10-02
#           (S327) -- 162/162 on the WORKSTATION under run_all.R (1190
#           across eight), matching the sandbox; v0.9.202, 2026-10-02
#           (S326) -- 160/160 on the WORKSTATION under run_all.R (1146
#           across eight), which also confirms the S320 stamp below.
# S320 EDIT (v0.9.197): THE SCREENING LAYOUT (the Session 51 jscreen
#           subset= item, kept; its S316 rider built). N54a-o added (15
#           checks) in one Part with two local helpers (cases_line -- the
#           header's Cases line, or NA -- and has_run -- a block of lines
#           found consecutively, in order); N35c and N35e re-pinned to the
#           frames' new shape (five layouts, jscreen's bottom off too; Table
#           4's four rows). Fixture: d as above, plus a copy d54o for the
#           other-frame reminder. jscreen() is Table 2's fifth layout: an
#           active filter prints the table between the title and the
#           header; with none, the block prints NOTHING -- its N-line family
#           "header" has the one form "none", and the one-blank contract
#           does not apply to a block that printed nothing -- and in
#           never-mode the header's Cases line carries "(k Excluded)".
#           Locks: no filter at standard leaves the output as it was
#           (N54a); the table pinned whole and placed between title and
#           header with the rule-8 blanks (N54b-c); three filters in
#           pipeline order with the "(k missing)" note (N54d); a filter at 0
#           still shows (N54e); full and case.processing = TRUE literal
#           (N54f); the rider at minimal, under case.processing = FALSE,
#           from subset =, and summed across three filters (N54g-i); no
#           rider when nothing was excluded (N54j); the other-frame reminder
#           (N54k); never an N line, a bottom or the discrepancy note
#           (N54l); the printer's silent state and returned count, driven
#           directly (N54m-n); the frames' screening rows (N54o).
#           ONE HUNDRED AND SIXTY checks.
#           MUTATION MAP (S320, sandbox, twelve mutants, each RUN against
#           this file): jscreen not calling the printer reds N54b-i; the
#           header family given the pool form reds N54a N54g-i N54l N54m
#           N54o; the rider dropped reds N54g-i; the rider shown in the
#           table state too reds N54b-d; the closing blank printed in the
#           silent state reds N54a N54g N54m; "(0 Excluded)" allowed reds
#           N54a-f N54j N54k; screening's bottom default "on" reds N35c
#           N54o alone (the bottom frame's FALSE row still keeps the bottom
#           off, so only the frame checks see it); screening given the
#           analysis family reds N54a N54g-i N54l N54m N54o; the table
#           printed after the header reds N54c N54f; the printer returning
#           the count in every state reds N54b-d N54n. The printer's new
#           input skip (the pool copy and missing-value scan built only for
#           a layout whose bottom can render): removed, it reds NOTHING, by
#           design -- it is output-neutral, and its evidence is timing
#           (jfreq on a 200,000 x 60 frame 0.40 -> 0.27 s); applied to every
#           layout, it reds 28 existing checks (N24a to N52m), so the key it
#           reads is guarded. No existing check reds under the first ten
#           mutants: before this Part nothing here reached jscreen's block.
#           Against the v0.9.196 master the battery reds N35c N35e and
#           eleven of the fifteen (N54a N54j N54k N54l hold there by
#           construction: they lock what the build must NOT change, and
#           their mutants above are what make them checks).
# LAST VERIFIED: v0.9.197 PENDING, 2026-09-29 (S320) -- 160/160 in the
#           SANDBOX (R 4.3.3, UTF-8 locale, ::/::: shimmed, clinic and
#           community from the staged datasets copies); WORKSTATION run
#           pending Jeff's receive of the 0.9.197 master. Prior: v0.9.192,
#           2026-09-27 (S316) -- 145/145 on the WORKSTATION (run_all.R
#           green, 873 across seven), confirmed after the PENDING stamp
#           below was written; 145/145 in every run_all.R since (949 across
#           seven at v0.9.196).
# S316 SECOND EDIT (v0.9.192): JDESC'S TABLES BLOCK-CENTERED AND TRIMMED.
#           N53a-g added (7 checks), one Part with its own helpers
#           (raw_lines -- plines() strips trailing spaces, which N53e-f
#           must see -- and col_cells, which reads a column by the span of
#           its dashes rather than by splitting on spaces); in-script
#           fixture d53 (groups of 12 and 3). Both jdesc tables give every
#           numeric column the S313 "bc" code and pass .jst_print_table()'s
#           new trim = TRUE: headers centered over their columns, counts
#           block-centered under Total and Non_missing on their ones digit,
#           statistics still decimal-aligned, no line ending in padding.
#           Locks: the two tables' header and first row pinned whole
#           (N53a-b); ones-digit alignment with the block centered (N53c);
#           decimal alignment in a column of mixed widths (N53d); no
#           trailing space on any jdesc table line, including a digits = 0
#           data row whose value is narrower than its header (N53e); trim
#           opt-in on the helper and removing only padding (N53f); and the
#           SCOPE -- jt's Group Descriptives table unchanged (N53g).
#           ONE HUNDRED AND FORTY-FIVE checks.
#           MUTATION MAP (S316, sandbox, nine mutants, each RUN against this
#           file): the grouped call reverted to auto-align reds N53b N53c;
#           the ungrouped call reverted reds N53a; the trim ignored reds
#           N53e N53f; the trim applied to the header only reds N53e N53f;
#           the grouped columns given "d" (right-justified, centered header)
#           reds N53b N53c; "bc" made the numeric default for EVERY table
#           reds N53g alone; trim on by default reds N53f alone; the grouped
#           call without trim reds N53e alone; the ungrouped cells centered
#           ("c", no block) reds N53d alone. N53d holds on right-justified
#           cells by construction -- it locks what the change must keep, and
#           the "c" mutant is what makes it a check. Against the v0.9.191
#           master the battery reds N53a-c and N53f (the argument is absent;
#           the call is made inside the check, so it fails there rather than
#           halting the battery).
# LAST VERIFIED: v0.9.192 PENDING, 2026-09-27 (S316) -- 145/145 in the
#           SANDBOX (R 4.3.3, UTF-8 locale, ::/::: shimmed, clinic and
#           community built from their generators); WORKSTATION run pending
#           Jeff's receive of the 0.9.192 master. Prior: v0.9.191 below.
# S316 EDIT (v0.9.191): THE GROUPED LAYOUT (AUDIT-027). N52a-t added (20
#           checks) in one Part with its own helpers (group_rows, col_sum,
#           trailing_blanks, endpoint_of); N30d re-pinned to the exact N
#           line ("^70 Cases in the 1 Variable Pool$" -- it matched only the
#           line's head, so the S287 "2 Variable Pool" re-pin would have
#           passed it unchanged). Fixture: the shipped clinic as loaded
#           (Medication declares -99 on 5 of 70), plus d52 = d with an
#           all-NA column for the no-groups stop. What the Part locks:
#           jdesc(by =) with cases missing on the grouping variable prints
#           the upper table at standard with a "by =" row -- excluded,
#           remaining, the variable as detail -- between Original and the
#           endpoint, which is the grouped count (N52a-e); the group tables
#           carry Total and Non_missing, the Totals summing to the endpoint
#           and a variable's own missing cases showing as Non_missing below
#           Total (N52f-h); at minimal the N line states the grouped count
#           with the rider, and on a clean grouping variable the pool counts
#           the described variable only, with no row (N52i-k); under
#           jsubset() the by = row follows the pipeline row and the grouping
#           variable keeps its per_code breakdown rows (N52l-m); the two
#           stops and the pipeline-aware wording (N52n-p); sample_info's
#           n_analysis / n_excluded_missing / by_var, the ungrouped NULL,
#           the one closing blank, and the frame's by_row column (N52q-t).
#           ONE HUNDRED AND THIRTY-EIGHT checks.
#           MUTATION MAP (S316, sandbox, seventeen mutants, each RUN against
#           this file): the by = row dropped from the exclusion-row test
#           reds N52a-c N52e; the row shown at zero reds N30d N52j N52k;
#           the pool count including the grouping variable reds N30d N52i
#           N52j; the N line stating the pool instead of the grouped count
#           reds N52i alone; the Total column absent (the old table) reds
#           N52f-h N52l; Total computed as Non_missing reds N52h N52l; the
#           grouped n_analysis reverted to nrow(data) reds N52a-c N52e
#           N52i N52l N52q; the row placed before the pipeline rows reds
#           N52l alone; Auto-listwise made eligible on per_var_desc reds
#           N52b N52d N52l N35d; each stop removed reds its own check (N52n;
#           N52o N52p); the step clause dropped from the no-groups stop
#           reds N52p alone; the closing blank restored reds N52s alone;
#           by_var not carried reds N30d N52b N52i N52j N52l N52q; by_var
#           carried for every caller reds N30d N52j N52r; the grouping
#           variable left out of analysis_vars reds N52m alone; by_row made
#           eligible on pairwise too reds N52t alone. Against the v0.9.190
#           master the battery reds N30d and sixteen of the twenty (N52d
#           N52k N52m N52r hold there by construction: they lock what the
#           build must NOT change, and their mutants above are what make
#           them checks).
# LAST VERIFIED: v0.9.191, 2026-09-27 (S316) -- 138/138 on the WORKSTATION
#           under run_all.R (ALL BATTERIES GREEN, 7 run, 866 checks), after
#           a clean devtools::check(); 138/138 in the SANDBOX the same day.
#           Prior: the S315 stamp below.
# S315 EDIT (v0.9.190): RANGE-ONLY DECLARATIONS (AUDIT-007). N51a-e added
#           (5 checks), in-script fixture d51 (twelve scores, -97 and -95
#           inside a declared band -99 to -90, no discrete codes): jdesc at
#           per_code renders the breakdown (N51a) as the ONE range row of
#           [RANGE-COLLAPSE-RETAINED] (N51b), so does joutput "full" (N51c),
#           and jt keeps per_code for it instead of degrading to totals
#           (N51d); .jst_system_na_count(), which Table 3's "Has system NAs"
#           flag now shares with the System/NA row, leaves out declared
#           codes, range cells and SAS markers (N51e). ONE HUNDRED AND
#           EIGHTEEN checks.
#           MUTATION MAP (S315, sandbox, three mutants, each RUN against
#           this file): the flag reverted to the codes table reds N51a-d;
#           the count reverted to is.na() on the live column reds N51e and
#           six existing checks (N39c N42d N48a-d -- the System/NA row's
#           move onto the helper was already covered); the helper's marker
#           branch disabled reds N51e alone, the only check over a Stata-
#           or SAS-form system-NA count. Against the v0.9.189 master the
#           battery reds all five.
# LAST VERIFIED: v0.9.190 PENDING, 2026-09-26 (S315) -- 118/118 in the
#           SANDBOX (R 4.3.3, ::/::: shimmed, clinic and community built
#           from their generators); WORKSTATION run pending Jeff's receive
#           of the 0.9.190 master. Prior: v0.9.189, 2026-09-26 (S314) --
#           113/113 on the WORKSTATION under run_all.R (821 across seven),
#           which also confirms the S313 stamp below.
# S313 EDIT (v0.9.187): BLOCK-CENTERED VALUES. N49a-e and N50a-c added
#           (8 checks): jcomplete()'s set-time table and jscreen's Missing
#           Data & Outliers table through the new .jst_print_table "bc"
#           code -- each value right-justified in a block the width of the
#           column's widest value, the block centered under its header,
#           the header centered over the column (the CPS bottom's Session
#           52 rule, outside the CPS for the first time). Two builds in
#           one session: v0.9.186 kept a right-justified header and left
#           jscreen's Outliers at "r"; Jeff read both alternatives rendered
#           and chose the centered header and the whole-table rule, so
#           v0.9.187 re-pinned N49c, N49d and N50a-c (the 0.9.186 file
#           against the 0.9.187 master reds exactly those six). Fixture d3
#           = d with SleepHours[1:17] NA, so a one-digit and a two-digit
#           count share a column; the community frame for a header
#           narrower than its values. ONE HUNDRED AND THIRTEEN checks.
#           MUTATION MAP (S313, sandbox, seven mutants, each RUN against
#           the 0.9.187 file): the "bc" data cells rendered as plain "c"
#           reds N49a N49b N49e N50a N50b N50c (the 4-char "0.0%" and the
#           "--" drift one column left); rendered as plain "r" (the "d"
#           form) reds N49a N49d N49e N50a N50b N50c (N49b PASSES:
#           right-justified values align on the ones digit and the decimal
#           too -- the property is necessary, not sufficient, and N49a /
#           N49e carry the centering); the "bc" header right-justified
#           (the 0.9.186 form) reds N49c N49d N49e; the block measured on
#           the header too (bc collapsing to r) reds the same six as "r";
#           jcomplete()'s call site left at auto-align reds N49a-e;
#           jscreen's pair left at "r" reds N50a N50b N50c; Outliers alone
#           left at "r" (the 0.9.186 form) reds N50a N50b N50c. N49e and
#           N50c locate their rows by the exact bc string, so they red
#           whenever N49a / N50a do -- the sub-property they add (block
#           short of the right edge) is only tested on a correct row.
#           Against the v0.9.185 master the battery reds all eight.
# LAST VERIFIED: v0.9.187, 2026-09-25 (S313) -- 113/113 in the SANDBOX (R
#           4.3.3, ::: shimmed, clinic and community built from their
#           generators); WORKSTATION run PENDING. Prior: v0.9.186 (S313,
#           the first form) 113/113 WORKSTATION-confirmed (run_all 799);
#           the S312 file below.
# S312 EDIT (v0.9.185, same session): THE Filtered COLUMN AND THE HEADER.
#           N48a-e added (5 checks): the header line under a pipeline with
#           its centred "%" headers, source-minus-pool on Jeff's example
#           (Stress 4 / 5.7 / 2 / 2 / 3.8), the one-pair form without a
#           pipeline, the label column at the rows' own width, and the
#           transform row's dash in the new cell. ONE HUNDRED AND FIVE
#           checks. has_bottom() now keys on "Missing data"; counts_under()
#           returns every count after the label (two without a pipeline,
#           five with one) and skips a label's own leading number
#           (-99 ["Refused"]); the S312 five-number rows re-pinned (N38c
#           N39c N41a N42b N43b N45a). MUTATION MAP additions (sandbox):
#           Filtered computed as pool minus source reds N38c N41a N42b N43b
#           N45a N48b; the "%" headers right-justified again reds N48a N48c;
#           the old header text reds N48a N48c; the transform row's
#           Filtered cell not dashed reds N48e. Against the v0.9.184 master
#           the battery reds N24a-b N25b (has_bottom on the new header)
#           N38a N38c N39b-c N41a N42b N43b N45a N48a-e (16).
# S312 EDIT (v0.9.184): FILTER ACCOUNTING. N38-N47 added (30 checks), one
#           Part with its own helpers (var_line, counts_under, n_headings,
#           top_row, tagged): the clean-analysis face (N38), the jsubset()
#           fold with the note and no duplicate row (N39), the subset =
#           form (N40), declared codes on each surface (N41), the collapse
#           at four and the "list" override (N42), the threshold and the
#           lone variable (N43), the note's mechanics -- pass-through,
#           clean condition, NA & FALSE, the capped expression (N44) --
#           the pairwise and per-variable layouts (N45), the slot's
#           defaults, panel line and error (N46), and jcomplete()'s Rule O
#           line (N47). ONE HUNDRED checks. N37's fixture moved from Stress
#           to StressClean: on Stress the row now carries "(4 missing)"
#           after the ellipsis (the behaviour N44d asserts), and N37 is
#           about the cap alone. A first S312 build (v0.9.183, same day)
#           drew the condition variables into the breakdown too and tagged
#           the rows "(filter only)"; the count then printed twice, and
#           this build is its revision -- the checks N39b/N40b lock the
#           revision (no row for a condition variable).
#           MUTATION MAP (S312, sandbox, ten mutants): the note suppressed
#           reds N39a N40a N41b N44c N44d N45b N45c (7); the NA count taken
#           AFTER the NA-to-FALSE line reds the same seven; the note
#           counting FALSE instead of NA reds those plus N37 N44a N44b (10);
#           the condition variables drawn back into the breakdown reds N39b
#           N40b N41b; the jcomplete()-only list emptied reds N38a-c N41a
#           N42a-d N43a-c N45a (12); the Table 3 coordinates left on the
#           analysis variables reds the same twelve; the threshold ">="
#           reds N43a ONLY; the collapsed count as a cell sum reds N42b
#           ONLY (N43b's three variables share no case, so it reads 13
#           either way -- N42b is the discriminator, by design); the lone
#           variable collapsed reds N43c; the plural reverted reds N47b.
#           Against the v0.9.183 master the battery reds N38b-c N39a-b
#           N40a-b N41a-b N42a-d N43a-c N44c-d N45a-c (20); against 0.9.182
#           it reds N38a-c N39a N40a N41a-b and then HALTS at N42's
#           joutput(case.processing.filter =) setup line (unused argument)
#           -- a halt is a FAIL under run_all.R.
# LAST VERIFIED: v0.9.185, 2026-09-25 (S312) -- 105/105 in the SANDBOX (R
#           4.3.3, ::: shimmed, clinic built from its generator); WORKSTATION
#           run PENDING. Prior: v0.9.184 (S312) 100/100 and v0.9.183 (S312,
#           the first form) 95/95, both WORKSTATION-confirmed; the S311 file
#           below.
# S295 EDIT (v0.9.168): THE DEGENERATE FRAME re-pinned to the zero-row input
#           guard. N32a-b assert the stop and its wording; N32c retired (it
#           pinned a render that no longer happens); N33 widened from four
#           functions to twelve (the nine analysis functions, jscreen, and
#           both jplot paths -- the only assertion of jplot's guard
#           anywhere); the old single N34 retired and NOT re-pinned -- the
#           blank it checked came from the CPS printer, not the title, so it
#           passed by accident (every error in that window glues to the
#           title; a variable-not-found error does the same). N34a-d added,
#           driving .jst_print_case_processing() DIRECTLY, because the guard
#           leaves no public route to the printer's empty-frame branch and the
#           S287 blank contract would otherwise go unwatched. New helper
#           emsg(). SEVENTY checks.
# LAST VERIFIED: v0.9.168, 2026-09-16 (S295) -- 70/70 on the WORKSTATION,
#           sourced with echo = TRUE, after a clean receive_package().
#           Run TWICE: first at ten N33 legs, then again with the two
#           jplot legs added, 70/70 both times. The same session also ran
#           filter_check.R 128/128, jencode_check.R 42/42 and
#           missing_convention_check.R 231/231 -- the guard sits in the
#           helper every analysis function enters, so a red in any of
#           those would have meant a zero-row fixture the S295 scan
#           missed. None appeared.
# S294 EDIT (v0.9.167, 2026-09-14): the Setup reset line and reset() moved
# S294 EDIT (v0.9.167, 2026-09-14): the Setup reset line and reset() moved
#           to the clear.all = TRUE forms (a bare jsubset(NULL) / jcomplete
#           (NULL) clears only the default frame since S294); no assertion
#           touched; 68/68 on the WORKSTATION after a clean devtools::check(),
#           matching the SANDBOX check for check.
# LAST VERIFIED: v0.9.167, 2026-09-14 (S294) -- 68/68 on the WORKSTATION
#           (see the S294 EDIT note above; no assertion changed).
#           Prior: v0.9.166, 2026-09-13 (S293) -- 68/68 on the WORKSTATION
#           (sourced from Downloads with echo = TRUE), matching the sandbox
#           run (R 4.3.3, ::: shimmed, clinic built from its generator).
#           THE PIPELINE-ROW LABEL RE-PIN, three changes: (1) N03b and N10b
#           re-pinned to jsubset() / jcomplete(); (2) row_of() matches its
#           label as PLAIN TEXT -- as a regex "jcomplete()" is jcomplete
#           plus an empty group, matching the OLD row and never the new
#           one, so a string-only re-pin read 66/68 on correct output;
#           (3) N37 added, the first assertion in any battery to reach the
#           40-column cap, locking the S293 ASCII "..." marker. SIXTY-EIGHT
#           checks. MUTATION MAP additions (S293, sandbox): the label
#           parentheses removed reds N03b N10b; the Unicode ellipsis
#           restored reds N37 only; the S287 battery against the new
#           master reads 65/67, red at N03b N10b.
#           Prior: v0.9.162, 2026-09-09 (S287) -- 67/67 on the WORKSTATION
#           (sourced from Downloads with echo = TRUE), matching the sandbox
#           run exactly (R 4.3.3, source()'d, ::: shimmed, clinic built from
#           its generator in a sealed environment). MUTATION MAP (S287,
#           sandbox, eleven mutants): rule 1 forced always-table reds 9;
#           rule 2 shown-at-0 reds N10a N11b N12; rule 3 N-line-off reds 25;
#           Table 4 family swap reds 15; Table 2 endpoint swap reds N36a-d
#           (those four exist BECAUSE the swap first passed the whole
#           battery); jfreq bottom ON reds N26 N29b N35c ONLY when both
#           frame gates flip (render_bottom is an AND -- one gate alone
#           looks like a check that cannot fail; see N26); each of the five
#           S287 whitespace sites restored reds its own N30/N32-34 check.
# RUN:      source()-safe from any working directory. All output is explicit
#           cat(), so echo = TRUE is NOT required. Also runnable via
#           regression/run_all.R, which treats a stop() as FAIL.
# CONTRACT: one printed line per check, a final "RESULT: PASS (n/n)" line,
#           and stop() if and only if any check failed.
# PAIR:     cps_walk.R is the human half. It shows the same states (54
#           sections since S316; six Expected blocks re-pinned at S313);
#           this file asserts what must be true of them.
# WHY IT EXISTS: before S287 NO regression file asserted CPS visibility at
#           all, so the S284 redesign shipped at S286 with only a
#           design-observation script behind it. Every assertion here is new.
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
jsubset(clear.all = TRUE); jcomplete(clear.all = TRUE); joutput(NULL)
jdummy(clear.all = TRUE)

# --- Fixture -----------------------------------------------------------------
# Same construction as cps_walk.R: the SHIPPED clinic (package = TRUE guards
# against the derived .rds in the test-data folder shadowing it), plus a
# plain-NA column and a DECLARED-but-clean column.
jload("clinic", name = "d", package = TRUE, overwrite = TRUE, quiet = TRUE)
d$SocialSupport[1:3] <- NA
d$StressClean <- d$Stress
d$StressClean[c(6L, 16L, 25L, 44L)] <- 16L

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

# plines(): the CPS block is cat()ed to stdout, not signalled, so grab() would
# come back empty. Returns the printed lines as a character VECTOR with ANSI
# colour stripped (.cat_red wraps every analysis title, and those escapes are
# zero-width on screen but not to nchar() or to startsWith()).
#
# DELIBERATELY NOT NAMED printed(). missing_convention_check.R defines a
# printed() that returns ONE collapsed string; a same-named helper with a
# different return type is the S256 warm-session trap waiting to happen. This
# file borrows no helper from a sibling battery.
# Warnings are suppressed too: this battery asserts the STRUCTURE of stdout,
# and the degenerate-frame checks raise expected warnings that would otherwise
# pile up after the verdict line. Condition TEXT is not this file's business.
plines <- function(expr) {
  txt <- suppressWarnings(suppressMessages(utils::capture.output(expr)))
  sub("[ \t]+$", "", gsub("\033\\[[0-9;]*[A-Za-z]", "", txt))
}

has_top    <- function(ln) any(startsWith(ln, "Case Processing"))
has_bottom <- function(ln) any(startsWith(ln, "Missing data"))
has_rule   <- function(ln) any(grepl("^-{4,}$", ln))
n_line     <- function(ln) {
  i <- grep("^(Analysis N:|[0-9]+ (Grouped )?Cases in the )", ln)
  if (length(i) == 1L) ln[i] else NA_character_
}
has_n_line <- function(ln) !is.na(n_line(ln))
# row_of(): a row is an indented line whose label is followed by a space.
# The label is matched as PLAIN TEXT, not as a pattern (S293): as a regex,
# "jcomplete()" is "jcomplete" plus an EMPTY GROUP, which matches the OLD
# row "jcomplete " and never the new "jcomplete()" -- a re-pin by string
# edit alone would have failed on correct output.
row_of     <- function(ln, label) {
  any(startsWith(ln, " ") &
      startsWith(trimws(ln, which = "left"), paste0(label, " ")))
}

# blanks_before(): how many consecutive blank lines sit immediately above the
# first line matching pattern. NA when the pattern is absent -- which fails a
# check rather than passing it silently, since NA is not TRUE.
blanks_before <- function(ln, pattern) {
  i <- grep(pattern, ln)[1]
  if (is.na(i)) return(NA_integer_)
  k <- 0L
  while (i - k - 1L >= 1L && !nzchar(ln[i - k - 1L])) k <- k + 1L
  k
}

# quiet(): run a state-setting call for its effect only. jcomplete() cat()s a
# whole Listwise Case Filter block to STDOUT, which suppressMessages does not
# touch, so a bare setup call would break the one-line-per-check contract.
# Defined ABOVE its caller reset(), per the S253 rule.
quiet <- function(expr) invisible(plines(expr))

# reset(): every check starts from neutral. Sections that set state clear it
# on the NEXT line, not at the end of a block, so an unexpected stop cannot
# leak a filter into the checks below (the trap that produced a bogus
# finding while this file was being written).
reset <- function() {
  quiet(jsubset(clear.all = TRUE)); quiet(jcomplete(clear.all = TRUE))
  quiet(joutput(NULL, quiet = TRUE))
}

# =============================================================================
# TABLE 1 -- THE VISIBILITY LAYER: which of the two prints
# =============================================================================
# Exactly one of the upper table and the one-line N statement occupies the
# block's slot. Mode comes from the case.processing toggle when set, else from
# the output level. An exclusion row is a user-set filter (shown even at zero)
# or a shown Auto-listwise row.

reset()
.v01 <- plines(jfreq(d, Stress))
check("N01a auto, no exclusion row: NO upper table",        !has_top(.v01))
check("N01b auto, no exclusion row: the N line takes it",    has_n_line(.v01))

.v02 <- plines(jlm(Flourishing ~ Stress + SocialSupport, d))
check("N02a auto, Auto-listwise nonzero: upper table prints", has_top(.v02))
check("N02b ... and NO separate N line (the endpoint row is it)",
      !has_n_line(.v02))

reset(); quiet(jsubset(d, Condition > 0))
.v03 <- plines(jlm(Flourishing ~ Stress + SocialSupport, d))
reset()
check("N03a auto, user filter at 0 excluded: upper table prints",
      has_top(.v03))
check("N03b ... and the filter row is shown at 0",
      row_of(.v03, "jsubset()"))

reset(); quiet(joutput("full", quiet = TRUE))
.v04 <- plines(jfreq(d, Stress))
reset()
check("N04a always (full), nothing excluded: upper table forced",
      has_top(.v04))
check("N04b ... and no N line alongside it", !has_n_line(.v04))

reset(); quiet(joutput(case.processing = TRUE, quiet = TRUE))
.v05 <- plines(jfreq(d, ScreenTime))
reset()
check("N05  always via case.processing = TRUE: upper table forced",
      has_top(.v05))

reset(); quiet(joutput(case.processing = FALSE, quiet = TRUE))
quiet(jsubset(d, Condition != 3))
.v06 <- plines(jlm(Flourishing ~ Stress + SocialSupport, d))
reset()
check("N06a never, WITH an active filter: no upper table", !has_top(.v06))
check("N06b never: the N line still prints",                has_n_line(.v06))
check("N06c never: and it carries the filter's effect",
      grepl("49", n_line(.v06), fixed = TRUE))

reset(); quiet(joutput("minimal", quiet = TRUE))
.v07 <- plines(jlm(Flourishing ~ Stress + SocialSupport, d))
reset()
check("N07a minimal: never the upper table",  !has_top(.v07))
check("N07b minimal: always the N line",       has_n_line(.v07))

# N08 -- the exclusive-or, swept. Written as a SWEEP because a single state
# cannot fail it: pick any one call and both halves agree by construction.
reset()
.states <- list(
  function() jfreq(d, Stress),
  function() jdesc(d, Stress, SocialSupport),
  function() jcorr(d, Stress, SocialSupport, Flourishing),
  function() jlm(Flourishing ~ Stress + SocialSupport, d),
  function() jt(Flourishing ~ SoughtHelp, d),
  function() jlm(Flourishing ~ StressClean + ScreenTime, d),
  function() jlm(Flourishing ~ Stress + SocialSupport, d,
                 subset = Condition != 3)
)
.xor <- vapply(.states, function(f) {
  ln <- plines(f()); xor(has_top(ln), has_n_line(ln))
}, logical(1))
check(
  paste0("N08  table XOR N line holds in all 7 swept states -- never both,\n",
  "      never neither"),
      all(.xor))

# =============================================================================
# RULE 2 -- THE AUTO-LISTWISE ROW IS SUPPRESSED AT ZERO
# =============================================================================
# Reverses the S44-S285 rule, under which the row printed at 0 as explicit
# confirmation that listwise deletion ran.

reset()
check("N09  Auto-listwise row SHOWN when its count is nonzero",
      row_of(plines(jlm(Flourishing ~ Stress + SocialSupport, d)),
             "Auto-listwise"))

reset(); quiet(jcomplete(d, Stress, SocialSupport))
.r10 <- plines(jlm(Flourishing ~ Stress + SocialSupport, d))
reset()
check("N10a under jcomplete the analysis drops nothing: row SUPPRESSED",
      !row_of(.r10, "Auto-listwise"))
check("N10b ... but the jcomplete row is still there, so the table prints",
      has_top(.r10) && row_of(.r10, "jcomplete()"))

reset(); quiet(joutput("full", quiet = TRUE))
.r11 <- plines(jt(Flourishing ~ SoughtHelp, d))
reset()
check("N11a rule 2 applies INSIDE a literal mode: table forced at full",
      has_top(.r11))
check("N11b ... and the zero Auto-listwise row is still suppressed",
      !row_of(.r11, "Auto-listwise"))

reset()
.r12 <- plines(jlm(Flourishing ~ StressClean + ScreenTime, d))
check(
  paste0("N12  rules 1+2 compose: a declared-but-clean listwise\n",
         "      call loses its only exclusion row, and so the table"),
      !has_top(.r12) && has_n_line(.r12))

# N13 -- mode resolution: the case.processing toggle outranks the output
# level. N06 proves it in the FALSE direction (never beats standard); this is
# the TRUE direction, where always must beat minimal.
reset(); quiet(joutput("minimal", quiet = TRUE))
quiet(joutput(case.processing = TRUE, quiet = TRUE))
.v13 <- plines(jfreq(d, Stress))
reset()
check(
  paste0("N13  the toggle outranks the output level: case.processing = TRUE\n",
  "      forces the table even at minimal"), has_top(.v13))

# =============================================================================
# TABLE 4 -- THE THREE N-LINE FORMS
# =============================================================================
# The form is variant-aware, not function-fixed: analysis for the six listwise
# functions, pool for jcorr/jdesc/jfreq, pool+complete-on-all where the
# per-variable Ns differ. Wording is mv-governed; these check the FORM.

reset(); quiet(joutput("minimal", quiet = TRUE))
check("N14  listwise form is 'Analysis N: <n>'",
      grepl("^Analysis N: 63", n_line(plines(
        jlm(Flourishing ~ Stress + SocialSupport, d)))))
check("N15  ... with the excluded count when exclusions occurred",
      grepl("\\(7 Excluded\\)$", n_line(plines(
        jlm(Flourishing ~ Stress + SocialSupport, d)))))
check("N16  ... and NO parenthetical when none did",
      identical(n_line(plines(jt(Flourishing ~ SoughtHelp, d))),
                "Analysis N: 70"))
check("N17  pool form carries the variable count",
      grepl("^70 Cases in the 2 Variable Pool",
            n_line(plines(jdesc(d, Stress, SocialSupport)))))
check("N18  pool form goes singular at one variable",
      identical(n_line(plines(jfreq(d, Condition))),
                "70 Cases in the 1 Variable Pool"))
check("N19  unequal per-variable Ns add the complete-on-all count",
      identical(n_line(plines(jdesc(d, Stress, SocialSupport))),
                "70 Cases in the 2 Variable Pool; 63 Complete on All"))
check(
  paste0("N20  EQUAL per-variable Ns take the plain pool form, even though\n",
  "      listwise would leave fewer (rule 5 as written, confirmed S286)"),
      identical(n_line(plines(jdesc(d, Stress, SleepHours))),
                "70 Cases in the 2 Variable Pool"))
check("N21  jalpha is a LISTWISE layout despite its data-first syntax",
      grepl("^Analysis N:",
            n_line(plines(jalpha(d, Anxiety3, Anxiety4, Anxiety5)))))
check("N22a jcorr (pairwise) takes the pool family",
      grepl("Variable Pool",
            n_line(plines(jcorr(d, Stress, SocialSupport, Flourishing)))))
check("N22b jcrosstab (listwise) takes the analysis family",
      grepl("^Analysis N:",
            n_line(plines(jcrosstab(SoughtHelp ~ Condition, d)))))
check("N22c jaov (listwise) takes the analysis family",
      grepl("^Analysis N:",
            n_line(plines(jaov(Flourishing ~ Condition, d)))))
check("N22d jlogistic (listwise) takes the analysis family",
      grepl("^Analysis N:",
            n_line(plines(jlogistic(SoughtHelp ~ Stress + SocialSupport, d)))))
reset()

# N23 -- all nine at minimal produce exactly one N line and no table. The
# per-function checks above cover the FORM; this covers the INVENTORY.
quiet(joutput("minimal", quiet = TRUE))
.nine <- list(
  function() jfreq(d, Condition),
  function() jdesc(d, Stress, SocialSupport),
  function() jcorr(d, Stress, SocialSupport, Flourishing),
  function() jt(Flourishing ~ SoughtHelp, d),
  function() jaov(Flourishing ~ Condition, d),
  function() jcrosstab(SoughtHelp ~ Condition, d),
  function() jlm(Flourishing ~ Stress + SocialSupport, d),
  function() jlogistic(SoughtHelp ~ Stress + SocialSupport, d),
  function() jalpha(d, Anxiety3, Anxiety4, Anxiety5)
)
.inv <- vapply(.nine, function(f) {
  ln <- plines(f()); has_n_line(ln) && !has_top(ln)
}, logical(1))
check(
  paste0("N23  all NINE analysis functions print an N line and no table at\n",
  "      minimal (rule 3 is the mechanism for every function)"), all(.inv))
reset()

# =============================================================================
# RULE 4 -- WHERE THE BOTTOM BREAKDOWN GOES
# =============================================================================

reset()
.b24 <- plines(jcorr(d, Stress, SocialSupport, Flourishing))
check("N24a the bottom prints with NO upper table above it",
      has_bottom(.b24) && !has_top(.b24))
check("N24b ... beneath the N line, which is in the table's slot",
      has_n_line(.b24) &&
      grep("^Missing data", .b24)[1] >
      grep("^(Analysis N:|[0-9]+ Cases in the )", .b24)[1])

check("N25a jdesc has no bottom below per_code",
      !has_bottom(plines(jdesc(d, Stress, SocialSupport))))
check("N25b jdesc gains it at per_code",
      has_bottom(plines(jdesc(d, Stress, SocialSupport,
                              case.processing.detail = "per_code"))))
# N26 -- MUTATION NOTE: render_bottom is an AND of THREE conditions (mode,
# the LAYOUT frame's bottom_default, and the BOTTOM_RULES frame's flag), so a
# mutant that flips only one frame leaves this check green and looks like a
# check that cannot fail. It is not: flip both frames and it reds. Verified
# S287.
check(paste0("N26  jfreq NEVER has a bottom: an 'off' base default cannot be\n",
             "      promoted, so per_code is a documented no-op"),
      !has_bottom(plines(jfreq(d, Stress,
                               case.processing.detail = "per_code"))))

quiet(joutput(case.processing = FALSE, quiet = TRUE))
.b27 <- plines(jdesc(d, Stress, SocialSupport,
                     case.processing.detail = "per_code"))
reset()
check("N27  never-mode outranks the detail tier: no bottom even at per_code",
      !has_bottom(.b27) && has_n_line(.b27))

# =============================================================================
# RULE 8 AND THE BLANK-LINE CONTRACT
# =============================================================================
# The contract the analysis functions depend on: the block is followed by
# EXACTLY ONE blank line, in every mode. None of the nine prints a leading
# blank of its own -- four did until v0.9.162 and doubled it.

reset()
.w28 <- plines(jlm(Flourishing ~ Stress + SocialSupport, d))
check("N28a rule 8: NO blank between the last breakdown row and the rule",
      identical(blanks_before(.w28, "^-{4,}$"), 0L))
check("N28b rule 8: exactly one blank after the rule",
      identical(blanks_before(.w28, "^Coefficients$"), 1L))

.w29 <- plines(jfreq(d, Stress))
check("N29a a bare N line takes exactly one blank after it",
      identical(blanks_before(.w29, "^Stress$"), 1L))
check("N29b ... and NO closing rule (S286 confirmation)", !has_rule(.w29))
check("N29c ... with exactly one blank above it, under the title",
      identical(blanks_before(.w29, "^70 Cases in the "), 1L))

# N30 -- the doubled blank, per function. These are the four S287 sites: three
# named in the S286 finding plus jdesc's grouped path, found by scanning.
reset(); quiet(joutput("minimal", quiet = TRUE))
check("N30a jlm: one blank between the N line and Coefficients, not two",
      identical(blanks_before(plines(
        jlm(Flourishing ~ Stress + SocialSupport, d)), "^Coefficients$"), 1L))
check("N30b jlogistic: same",
      identical(blanks_before(plines(
        jlogistic(SoughtHelp ~ Stress + SocialSupport, d)),
        "^Coefficients$"), 1L))
check("N30c jdesc: same, ahead of the descriptives table",
      identical(blanks_before(plines(jdesc(d, Stress, SocialSupport)),
                              "^Variable +Total"), 1L))
reset()
check(paste0("N30d jdesc GROUPED (by =): the second CPS call site, one blank\n",
             "      between the title and the N line"),
      identical(blanks_before(plines(jdesc(d, Stress, by = Condition)),
                              "^70 Cases in the 1 Variable Pool$"), 1L))
check("N30e jdesc grouped prints the N line at minimal too",
      { quiet(joutput("minimal", quiet = TRUE))
        r <- has_n_line(plines(jdesc(d, Stress, by = Condition)))
        reset(); r })

# N31 -- the discrepancy note sits OUTSIDE the block's rule, not inside it.
check("N31  at per_code the order is N line, bottom, rule, THEN the note",
      { ln <- plines(jdesc(d, Stress, SocialSupport,
                           case.processing.detail = "per_code"))
        grep("^Note: Listwise", ln)[1] > grep("^-{4,}$", ln)[1] })

# =============================================================================
# THE DEGENERATE FRAME
# =============================================================================
# RE-PINNED S295 (v0.9.168). A zero-row INPUT frame now stops at the pipeline
# entry: the guard in .jst_apply_pipeline() reads nrow() before jcomplete,
# jsubset or subset = runs, so it fires only when the frame ARRIVED empty. A
# filter that empties a non-empty frame is a different path and is untouched --
# there the upper table prints with its exclusion row and a Remaining N of 0,
# which Table 1 already covers.
#
# What this section used to pin: the four functions that RENDERED on a zero-row
# frame, and the S287 closing blank they relied on. None of the four can reach
# the printer's empty-frame branch any more, so that contract is asserted
# DIRECTLY at N35 instead of through them -- otherwise the branch would keep
# working with nothing watching it.
#
# The old N34 is GONE rather than re-pinned, and the reason is worth recording:
# it checked for a blank line between the title and the error, and that blank
# was never the title's. It came from the printer's empty-frame cat("\n"),
# emitted on the way past before jlm's own late guard fired. With the stop
# moved earlier the printer never runs and the error sits against the title --
# which is what EVERY error in that window does (a variable-not-found error
# glues identically, verified S295). The old check passed by accident, not by
# contract, so re-pinning it would pin the accident.

reset()
.d0 <- d[0L, , drop = FALSE]

# emsg(): these checks read the error, not the output. Returns the condition
# message with the emitter's width wraps flattened to single spaces -- the
# wrap position moves with the calling function's name length, so a literal
# comparison would pin the prefix rather than the sentence. Returns NA when the
# call did NOT stop, which is what lets the N33 sweep fail if a function loses
# its guard. Defined above its callers (S253).
#
# The capture.output() wrapper is NOT decoration: every one of these functions
# cat()s its red title BEFORE reaching the pipeline, so a bare tryCatch would
# leak nine titles into the battery's output and break the one-line-per-check
# contract quiet() exists to protect. Same reasoning as quiet(); it cannot
# BE quiet(), which returns the lines and swallows the error.
emsg <- function(expr) {
  m <- NA_character_
  invisible(suppressWarnings(suppressMessages(utils::capture.output(
    tryCatch(force(expr),
             error = function(e) m <<- gsub("[ \t\n]+", " ",
                                            conditionMessage(e)))))))
  m
}

.g32 <- emsg(jfreq(.d0, Stress))
check("N32a a zero-row input frame STOPS jfreq", !is.na(.g32))
check("N32b ... in Rule T's article form, naming the frame as the user typed",
      identical(.g32, paste0("jfreq(): the .d0 data frame has no rows, ",
                             "so there is nothing to analyze.")))

# N33 -- swept across every function that enters the pipeline helper: the nine
# analysis functions, jscreen, and BOTH jplot paths (default and formula), for
# thirteen call sites across twelve functions. Before S295 these split three
# ways on one condition: four rendered, five stopped late with a message naming
# pipeline stages that had not run, and jplot handed ggplot an empty frame. The
# fixed pattern opens at "(): " so it matches whichever name the emitter
# detected while still proving a prefix is there. MUTATION NOTE: emsg()
# returning NA on a non-stopping call is what makes this fail if any one guard
# is lost -- without it a silent render would grepl to FALSE anyway, but for
# the wrong reason. The two jplot legs are the ONLY assertion of jplot's guard
# anywhere; cps_walk.R H3 is its visual counterpart.
.z33 <- vapply(list(
  function() jfreq(.d0, Stress),
  function() jdesc(.d0, Stress, SocialSupport),
  function() jcorr(.d0, Stress, SocialSupport),
  function() jalpha(.d0, Anxiety3, Anxiety4, Anxiety5),
  function() jt(Flourishing ~ SoughtHelp, .d0),
  function() jaov(Flourishing ~ Condition, .d0),
  function() jcrosstab(SoughtHelp ~ Condition, .d0),
  function() jlm(Flourishing ~ Stress + SocialSupport, .d0),
  function() jlogistic(SoughtHelp ~ Stress + SocialSupport, .d0),
  function() jscreen(.d0, Stress, SocialSupport),
  function() jplot(.d0, Stress),
  function() jplot(Flourishing ~ Stress, .d0)
), function(f) {
  m <- emsg(f())
  !is.na(m) && grepl("(): the", m, fixed = TRUE) &&
    grepl("data frame has no rows, so there is nothing to analyze.", m,
          fixed = TRUE)
}, logical(1))
check(
  paste0("N33  every pipeline entrant stops on a zero-row input frame, with\n",
  "      one sentence and the caller's own prefix (12 functions)"), all(.z33))

# N34 -- the printer's empty-frame branch, driven DIRECTLY. This is the
# coverage the guard took away: no public call can reach the branch now, but
# the S287 contract still binds it (one blank after the block in every mode,
# no exception for this path). Internals are reached the same way Table 1's
# frame checks reach theirs.
.z34 <- plines(jstats:::.jst_print_case_processing(
  list(n_original = 0L, n_analysis = 0L)))
check("N34a printer, empty frame: the closing blank IS still emitted",
      identical(length(.z34), 1L) && !nzchar(.z34))
check("N34b ... and neither the table nor the N line",
      !has_top(.z34) && !has_n_line(.z34))
check("N34c ... on the NULL n_original trigger too (the branch's other half)",
      { z <- plines(jstats:::.jst_print_case_processing(
               list(n_original = NULL, n_analysis = NULL)))
        identical(length(z), 1L) && !nzchar(z) })

# N34d -- the discriminating control for N34a-c. A sample_info that is NOT
# degenerate must take the ordinary path, or those three would read the same
# whether the branch existed or not. (Numbered into the N34 family rather than
# taken as N35: this file already has an N35a-f, sitting further down after
# N37.)
check("N34d a non-degenerate sample_info does NOT take the empty branch",
      { z <- plines(jstats:::.jst_print_case_processing(
               list(n_original = 70L, n_analysis = 63L),
               analysis_type = "listwise"))
        length(z) > 1L && has_n_line(z) })

# =============================================================================
# TABLE 2 -- THE ENDPOINT LABEL
# =============================================================================
# Set entirely by the layout and unaffected by the other layers. When the
# upper table prints, this row IS the N statement, so its wording is the
# only place the N is stated. ADDED S287: a mutant that swapped the two
# labels passed the whole battery, which meant nothing asserted them.

reset()
check("N36a listwise endpoint row reads 'Analysis N'",
      row_of(plines(jlm(Flourishing ~ Stress + SocialSupport, d)),
             "Analysis N"))
quiet(jsubset(d, Condition != 3))
.e36 <- plines(jfreq(d, Stress))
.e37 <- plines(jcorr(d, Stress, SocialSupport, Flourishing))
.e38 <- plines(jdesc(d, Stress, SocialSupport))
reset()
check("N36b per-variable Frequencies endpoint reads 'Remaining N'",
      row_of(.e36, "Remaining N") && !row_of(.e36, "Analysis N"))
check("N36c pairwise endpoint reads 'Remaining N'",
      row_of(.e37, "Remaining N") && !row_of(.e37, "Analysis N"))
check("N36d per-variable Descriptives endpoint reads 'Remaining N'",
      row_of(.e38, "Remaining N") && !row_of(.e38, "Analysis N"))

# =============================================================================
# THE 40-COLUMN CAP -- the detail column's truncation marker is ASCII (S293)
# =============================================================================
# .jst_truncate_ellipsis caps every in-table label surface at 40 display
# columns: the CPS detail column, jfreq value labels, jdesc/jcorr/jalpha
# identifiers, jcrosstab's row heading. Before S293 nothing in any battery
# reached the cap, so its change from the Unicode ellipsis (U+2026, one
# column) to "..." (three ASCII periods) would have shipped unwitnessed.
# A subset = expression 79 columns wide reaches it. The detail must occupy
# EXACTLY 40 columns, end in the three periods, and contain no non-ASCII
# byte. The extraction strips the label and the two counts, so a missing
# row yields NA and fails rather than passing silently. The condition is on
# StressClean (declared but clean) since S312: on Stress, whose four code
# cells are missing under the condition, the row now carries "(4 missing)"
# AFTER the ellipsis -- the behaviour N44d asserts -- and the detail is no
# longer 40 columns. This check is about the cap alone.

reset()
.v37 <- plines(jlm(Flourishing ~ Stress + SocialSupport, d,
                   subset = StressClean > 1 & StressClean < 100 &
                            StressClean != 999 & StressClean != 998))
reset()
.l37   <- grep("^ +subset = ", .v37, value = TRUE)[1]
.det37 <- trimws(sub("^ +subset = +[0-9]+ +[0-9]+", "", .l37))
check("N37 a subset = expression past 40 columns is cut to 40, ending in ASCII \"...\"",
      identical(nchar(.det37, type = "width"), 40L) &&
      endsWith(.det37, "...") && !grepl("[^ -~]", .det37))

# =============================================================================
# FILTER ACCOUNTING -- the two mechanisms, each on its own surface (S312)
# =============================================================================
# Two things the Case Processing Summary could not say before v0.9.184. (1) A
# variable in jcomplete()'s list that the analysis does not use -- a
# jcomplete()-ONLY variable -- got no row in the breakdown, so a case missing
# on it was excluded unshown (the S311 field report: jcomplete() 12, the
# breakdown 11), and when the analysis variables were clean no breakdown
# printed at all, because Table 3's coordinates read the analysis variables
# alone. Now such a variable gets its own rows, tagged "(jcomplete() only)",
# after the analysis variables; under case.processing.filter = "auto" up to
# three are named and four or more collapse into one "jcomplete()-only
# variables (k)" row whose count is CASES missing on at least one of them.
# (2) A jsubset() or subset = row folded the cases its condition could not
# evaluate (missing in the condition's variables) into the cases the
# condition ruled out. Now the row says "(k missing)" after the expression
# when k > 0, so 7 excluded with 3 missing reads as 4 not met. Condition
# variables get NO breakdown rows: the count lives on the row, once.
# Helpers below are local to this Part.

# var_line(): a variable heading is an indent-4 line carrying only the label
# (a row line carries counts after it); matched as plain text.
var_line <- function(ln, label) any(ln == paste0("    ", label))
# counts_under(): the numbers of the first row beneath a heading -- source
# count and percent, then (under a pipeline) filtered count, pool count and
# percent, five in all -- or NA when the heading is absent, so a check fails
# rather than passing silently. A dash cell is dropped, so a transform row
# under a pipeline yields two numbers (see N48e).
counts_under <- function(ln, label) {
  i <- match(paste0("    ", label), ln)
  if (is.na(i) || i == length(ln)) return(NA_real_)
  toks <- strsplit(trimws(ln[i + 1L]), " +")[[1]]
  vals <- suppressWarnings(as.numeric(toks))
  # The row label may itself start with a number (-99 ["Refused"]), so the
  # counts are the numeric tokens AFTER the last non-numeric one (the
  # label's last word, or a dash cell).
  last_lab <- max(which(is.na(vals)))
  vals <- vals[seq_along(vals) > last_lab]
  if (length(vals) == 0L) NA_real_ else vals
}
n_headings <- function(ln) sum(grepl("^    [A-Za-z]", ln) & !grepl("^    [A-Za-z].* [0-9-]", ln))
# top_row(): the upper-table row carrying a pipeline label, or NA.
top_row <- function(ln, label) { i <- grep(paste0("^    ", label, " "), ln); if (length(i)) ln[i[1]] else NA_character_ }
tagged <- function(ln) sum(grepl("\\(jcomplete\\(\\) only\\)$", ln))

# N38 -- the clean-analysis face: nothing missing on the analysis variables,
# three plain NAs on a jcomplete()-only variable. Before S312 this call
# printed the upper table and NO bottom. StressClean is declared but clean,
# so it earns no row.
reset(); quiet(jcomplete(d, Flourishing, SocialSupport, StressClean))
.v38 <- plines(jt(Flourishing ~ SoughtHelp, d))
reset()
check("N38a clean analysis variables, a jcomplete()-only variable with NAs: bottom PRINTS",
      has_bottom(.v38))
check("N38b ... its one variable line is 'SocialSupport (jcomplete() only)'",
      var_line(.v38, "SocialSupport (jcomplete() only)") && n_headings(.v38) == 1L)
check("N38c ... source 3 / 4.3, filtered 3, pool 0 / 0.0 (the pool column is computed, not dashed)",
      identical(counts_under(.v38, "SocialSupport (jcomplete() only)"), c(3, 4.3, 3, 0, 0)))
check("N38d ... and the declared-but-clean StressClean earns no row",
      !any(grepl("StressClean", .v38)))

# N39 -- the fold, jsubset() form: SocialSupport > 5 excludes 7, of which 3
# were missing. The row says so; the breakdown does NOT repeat it.
reset(); quiet(jsubset(d, SocialSupport > 5))
.v39 <- plines(jlm(Flourishing ~ Stress, d))
reset()
check("N39a jsubset() row: '7  63  SocialSupport > 5 (3 missing)'",
      identical(trimws(top_row(.v39, "jsubset\\(\\)")), "jsubset()             7         63  SocialSupport > 5 (3 missing)"))
check("N39b ... the condition variable gets NO breakdown row (the count lives on the row, once)",
      has_bottom(.v39) && !any(grepl("SocialSupport", .v39[grep("^Missing data", .v39):length(.v39)])) &&
      tagged(.v39) == 0L)
check("N39c ... the analysis variable's own row is the old row plus its Filtered 0 (4 / 5.7 / 0 / 4 / 6.3)",
      identical(counts_under(.v39, "Stress"), c(4, 5.7, 0, 4, 6.3)))

# N40 -- the per-call subset = form: the same note, on its own row label.
reset()
.v40 <- plines(jlm(Flourishing ~ Stress, d, subset = SocialSupport > 5))
check("N40a subset = row: '7  63  SocialSupport > 5 (3 missing)'",
      identical(trimws(top_row(.v40, "subset =")), "subset =              7         63  SocialSupport > 5 (3 missing)"))
check("N40b ... and no breakdown row for SocialSupport",
      tagged(.v40) == 0L && !any(grepl("^    SocialSupport", .v40)))

# N41 -- declared codes, on each surface. As a jcomplete()-only variable,
# Stress breaks out by code at per_code under the tagged heading (the
# has_udms coordinate reads the jcomplete()-only variables). As a condition
# variable its four code cells are counted on the row -- the condition is
# evaluated on the masked copy, so a declared code is missing there too --
# and it gets no bottom row even at per_code.
reset(); quiet(jcomplete(d, Flourishing, Stress))
.v41a <- plines(jt(Flourishing ~ SoughtHelp, d, case.processing.detail = "per_code"))
reset()
.v41b <- plines(jt(Flourishing ~ SoughtHelp, d, subset = Stress > 10, case.processing.detail = "per_code"))
check("N41a per_code, jcomplete()-only Stress: 'Stress (jcomplete() only)' carries its two code rows",
      var_line(.v41a, "Stress (jcomplete() only)") &&
      row_of(.v41a, "-99 [\"Refused\"]") && row_of(.v41a, "-98 [\"Don't know\"]") &&
      identical(counts_under(.v41a, "Stress (jcomplete() only)"), c(2, 2.9, 2, 0, 0)))
check("N41b per_code, Stress > 10 as the condition: '(4 missing)' on the row, no bottom at all",
      grepl("Stress > 10 \\(4 missing\\)$", top_row(.v41b, "subset =")) && !has_bottom(.v41b))

# N42 -- "auto" with FOUR jcomplete()-only variables collapses them. The count
# is 17 CASES missing on at least one of Stress, SleepHours, Medication,
# Anxiety4 -- NOT the 19 cells a per-row sum would give.
reset(); quiet(jcomplete(d, Flourishing, Stress, SleepHours, Medication, Anxiety4))
.v42a <- plines(jt(Flourishing ~ SoughtHelp, d))
quiet(joutput(case.processing.filter = "list", quiet = TRUE))
.v42b <- plines(jt(Flourishing ~ SoughtHelp, d))
reset()
check("N42a auto, four jcomplete()-only variables: ONE 'jcomplete()-only variables (4)' row",
      var_line(.v42a, "jcomplete()-only variables (4)") && n_headings(.v42a) == 1L && tagged(.v42a) == 0L)
check("N42b ... 'Missing on any' counts 17 CASES (a cell sum would read 19)",
      row_of(.v42a, "Missing on any") &&
      identical(counts_under(.v42a, "jcomplete()-only variables (4)"), c(17, 24.3, 17, 0, 0)))
check("N42c joutput(case.processing.filter = 'list') names all four",
      tagged(.v42b) == 4L && !any(grepl("jcomplete\\(\\)-only variables", .v42b)))
check("N42d ... in jcomplete()'s order, each with its own count (4, 4, 5, 6)",
      identical(counts_under(.v42b, "Stress (jcomplete() only)")[1], 4) &&
      identical(counts_under(.v42b, "SleepHours (jcomplete() only)")[1], 4) &&
      identical(counts_under(.v42b, "Medication (jcomplete() only)")[1], 5) &&
      identical(counts_under(.v42b, "Anxiety4 (jcomplete() only)")[1], 6) &&
      match("    Stress (jcomplete() only)", .v42b) < match("    Anxiety4 (jcomplete() only)", .v42b))

# N43 -- the threshold and the lone variable. Exactly three are still named
# under auto; "collapse" collapses three; a single variable is named under
# every setting (a group of one is the variable).
reset(); quiet(jcomplete(d, Flourishing, Stress, SleepHours, Medication))
.v43a <- plines(jt(Flourishing ~ SoughtHelp, d))
quiet(joutput(case.processing.filter = "collapse", quiet = TRUE))
.v43b <- plines(jt(Flourishing ~ SoughtHelp, d))
quiet(jcomplete(clear.all = TRUE)); quiet(jcomplete(d, Flourishing, Stress))
.v43c <- plines(jt(Flourishing ~ SoughtHelp, d))
reset()
check("N43a auto, exactly three jcomplete()-only variables: all three NAMED",
      tagged(.v43a) == 3L && !any(grepl("jcomplete\\(\\)-only variables", .v43a)))
check("N43b 'collapse' with three: one 'jcomplete()-only variables (3)' row of 13 cases",
      var_line(.v43b, "jcomplete()-only variables (3)") &&
      identical(counts_under(.v43b, "jcomplete()-only variables (3)"), c(13, 18.6, 13, 0, 0)))
check("N43c 'collapse' with ONE jcomplete()-only variable: still named",
      var_line(.v43c, "Stress (jcomplete() only)") && !any(grepl("jcomplete\\(\\)-only variables", .v43c)))

# N44 -- the note is a count of conditions that evaluated to NA, nothing
# else. An expression that keeps missing cases on purpose produces none; a
# clean condition produces none; NA & FALSE is FALSE in R, so a case missing
# on one variable but ruled out by another is NOT counted (d2 forces one of
# Stress's four code cases into Condition 1, where NA & TRUE is NA); and the
# note follows the capped expression.
reset()
.v44a <- plines(jt(Flourishing ~ SoughtHelp, d, subset = SocialSupport > 5 | is.na(SocialSupport)))
.v44b <- plines(jt(Flourishing ~ SoughtHelp, d, subset = Condition != 3))
d2 <- d; .i <- which(unclass(d2$Stress) %in% c(-99L, -98L)); d2$Condition[.i[1]] <- 1L
.v44c <- plines(jt(Flourishing ~ SoughtHelp, d2, subset = Stress > 10 & Condition == 1))
.v44d <- plines(jt(Flourishing ~ SoughtHelp, d, subset = SocialSupport > 5 & ScreenTime < 9 & Flourishing >= 0 & SleepHours > 0))
rm(d2, .i)
check("N44a a pass-through expression: 4 excluded, NO '(missing)' note",
      grepl("^subset =            4         66  SocialSupport > 5 \\| is.na\\(SocialSupport\\)$", trimws(top_row(.v44a, "subset ="))))
check("N44b a clean condition: the row exactly as before S312",
      identical(trimws(top_row(.v44b, "subset =")), "subset =           17         53  Condition != 3"))
check("N44c NA & FALSE is FALSE: one of Stress's four code cases sits in Condition 1, so '(1 missing)'",
      grepl("Condition == 1 \\(1 missing\\)$", top_row(.v44c, "subset =")))
check("N44d the note follows the capped expression: '... (7 missing)'",
      grepl("& \\.\\.\\. \\(7 missing\\)$", top_row(.v44d, "subset =")))

# N45 -- across the layouts. Pairwise carries the jcomplete()-only row at
# totals; the per-variable layouts (jdesc, jfreq) carry the note on their
# rows and still grow no bottom for it.
reset(); quiet(jcomplete(d, Flourishing, ScreenTime, SocialSupport))
.v45a <- plines(jcorr(d, Flourishing, ScreenTime))
reset()
.v45b <- plines(jfreq(d, Condition, subset = SocialSupport > 5))
.v45c <- plines(jdesc(d, Flourishing, ScreenTime, subset = SocialSupport > 5))
check("N45a pairwise (jcorr) carries the jcomplete()-only row at totals",
      var_line(.v45a, "SocialSupport (jcomplete() only)") &&
      identical(counts_under(.v45a, "SocialSupport (jcomplete() only)"), c(3, 4.3, 3, 0, 0)))
check("N45b per-variable Frequencies: the note on its row, still NO bottom",
      grepl("SocialSupport > 5 \\(3 missing\\)$", top_row(.v45b, "subset =")) && has_top(.v45b) && !has_bottom(.v45b))
check("N45c per-variable Descriptives: the note on its row, still NO bottom",
      grepl("SocialSupport > 5 \\(3 missing\\)$", top_row(.v45c, "subset =")) && has_top(.v45c) && !has_bottom(.v45c))

# N46 -- the slot itself: the three level defaults, the panel line, the
# validation error in the house choice form.
reset()
check("N46a level defaults: minimal collapse / standard auto / full list",
      identical(jstats:::.jst_output_defaults$minimal$case.processing.filter,  "collapse") &&
      identical(jstats:::.jst_output_defaults$standard$case.processing.filter, "auto") &&
      identical(jstats:::.jst_output_defaults$full$case.processing.filter,     "list"))
check("N46b joutput() panel shows 'case.processing.filter: AUTO' at standard",
      any(plines(joutput()) == "  case.processing.filter: AUTO"))
.e46 <- tryCatch(joutput(case.processing.filter = "sometimes"),
                 error = function(e) conditionMessage(e))
check("N46c an invalid value stops in the choice form, naming the three settings",
      is.character(.e46) && startsWith(.e46, "joutput(): `case.processing.filter` must be") &&
      all(vapply(c("\"auto\"", "\"list\"", "\"collapse\""), grepl, logical(1), x = .e46,
                 fixed = TRUE)))
reset()

# N47 -- the jcomplete() set-time line agrees in number (Rule O): it read
# "1 cases" until v0.9.183. Two counts, so a hardcoded singular fails too.
reset()
.v47a <- plines(jcomplete(d, Flourishing, Medication))
quiet(jcomplete(clear.all = TRUE))
d1 <- d[, c("Flourishing", "MoodRating")]; d1$MoodRating[7L] <- NA   # exactly one
.v47b <- plines(jcomplete(d1, Flourishing, MoodRating))
reset(); rm(d1)
check("N47a jcomplete() with 5 excluded: '5 cases will be excluded'",
      any(grepl("-- 5 cases will be excluded", .v47a, fixed = TRUE)))
check("N47b ... with 1 excluded: '1 case will be excluded', not '1 cases'",
      any(grepl("-- 1 case will be excluded", .v47b, fixed = TRUE)) &&
      !any(grepl("1 cases", .v47b, fixed = TRUE)))


# N48 -- the "Filtered" column and the header (S312, v0.9.185). Each row
# states how many of its missing cases a filter removed before the pool,
# source minus pool, so the reader no longer subtracts (Jeff's S312
# example: Stress 4 in the original, 2 out with the 17 filtered cases, 2
# in the pool). The column appears exactly when the pool pair does; the
# header is "Missing data" (was "Missing-data breakdown"); the "%" headers
# are centred over their columns; a transform row's dash reaches the new
# cell too.
reset(); quiet(jsubset(d, Condition != 3))
.v48a <- plines(jlm(Flourishing ~ Stress + SocialSupport, d))
.v48e <- plines(jlm(Flourishing ~ log(Stress) + SocialSupport, d))
reset()
.v48c <- plines(jlm(Flourishing ~ Stress + SocialSupport, d))
check("N48a header, under a pipeline: 'Missing data   From 70   %   Filtered  From 53   %' (centred %)",
      any(.v48a == "Missing data   From 70   %   Filtered  From 53   %"))
check("N48b Stress 4 / 5.7 / 2 / 2 / 3.8 and SocialSupport 3 / 4.3 / 1 / 2 / 3.8: source minus pool",
      identical(counts_under(.v48a, "Stress"),        c(4, 5.7, 2, 2, 3.8)) &&
      identical(counts_under(.v48a, "SocialSupport"), c(3, 4.3, 1, 2, 3.8)))
check("N48c no pipeline: one pair, no Filtered column, header 'Missing data   From 70   %'",
      any(.v48c == "Missing data   From 70   %") && !any(grepl("Filtered", .v48c)) &&
      identical(counts_under(.v48c, "Stress"), c(4, 5.7)))
check("N48d the label column is the rows' own width at totals: 'Missing' rows start at column 7",
      any(grepl("^      Missing +4 +5\\.7", .v48a)) && !any(grepl("^Missing-data", .v48a)))
check("N48e a transform row under a pipeline: dash in the Filtered cell as in the source cells",
      { r <- .v48e[match("    log(Stress)", .v48e) + 1L]
        grepl("^      Could not be computed +-- +-- +-- +2 +3\\.8$", r) })

# =============================================================================
# BLOCK-CENTERED VALUES -- two tables outside the CPS block (S313, v0.9.186)
# =============================================================================
# jcomplete()'s set-time table and jscreen's Missing Data & Outliers table
# borrow the CPS bottom table's Session 52 rule through a new .jst_print_table
# align code, "bc": each value right-justified in a block the width of the
# column's widest value, the block centered under the header, and the header
# centered over the column (as for "d"). jcomplete() applies it to N / Missing
# / % Missing; jscreen to Missing / % Missing / Outliers. Until v0.9.185 the
# counts were right-justified and "% Missing", a formatted string, left-
# justified, so the tables read right-heavy with one column pulling left
# (Jeff, S312). A first build (v0.9.186) kept the header right-justified and
# Outliers "r"; Jeff's reading of both alternatives chose the centered header
# and the whole-table rule (v0.9.187, same session).
# The natural mutants: plain "c" (a 4-char "0.0%" drifts one column left of
# "27.1%", and a "--" one left of "5.7"), and plain "d" (values back at the
# right edge). Exact-line pins; plines() strips trailing whitespace, so the
# pinned lines end at the last value.
reset()
d3 <- d; d3$SleepHours[1:17] <- NA               # a one-digit and a two-digit count
.v49a <- plines(jcomplete(d3, Flourishing, SleepHours))
quiet(jcomplete(clear.all = TRUE))
jload("community", name = "cm", package = TRUE, overwrite = TRUE, quiet = TRUE)
.v49d <- plines(jcomplete(cm, Volunteer, Education))
quiet(jcomplete(clear.all = TRUE)); rm(cm)
check("N49a jcomplete() set-time table: 0 and 19 share a ones column, 0.0% and 27.1% a decimal",
      any(.v49a == "Flourishing  70      0       0.0%") &&
      any(.v49a == "SleepHours   70     19      27.1%"))
check("N49b ... stated as a property: the last digit of each count and the '.' of each percent sit in one column",
      { # past "Flourishing  70" / "SleepHours   70" (15 chars) the Missing
        # count is the first digit run; its LAST digit is where a one-digit
        # and a two-digit count must agree.
        r0 <- substring(.v49a[startsWith(.v49a, "Flourishing  70")], 16L)
        r1 <- substring(.v49a[startsWith(.v49a, "SleepHours   70")], 16L)
        last_digit <- function(r) { m <- regexpr("[0-9]+ ", r)
                                    as.integer(m) + attr(m, "match.length") - 2L }
        dot <- function(r) as.integer(regexpr(".", r, fixed = TRUE))
        length(r0) == 1L && length(r1) == 1L &&
        identical(last_digit(r0), last_digit(r1)) && identical(dot(r0), dot(r1)) })
check("N49c ... header centered over the column: 'Variable      N  Missing  % Missing' over '-----------  --  -------  ---------'",
      any(.v49a == "Variable      N  Missing  % Missing") &&
      any(.v49a == "-----------  --  -------  ---------"))
check("N49d ... a header narrower than its values is centered too: 'N' over the middle of 103",
      any(.v49d == "Variable    N   Missing  % Missing") &&
      any(.v49d == "Volunteer  103     0        0.0%"))
check("N49e ... the block sits under the header's middle: the 0.0% row ends before the column's right edge",
      { h <- .v49a[.v49a == "Variable      N  Missing  % Missing"]
        r <- .v49a[.v49a == "Flourishing  70      0       0.0%"]
        length(h) == 1L && length(r) == 1L && nchar(r) < nchar(h) })

reset()
.v50a <- plines(jscreen(d))
.v50b <- plines(jscreen(d3))
rm(d3)
check("N50a jscreen Missing Data table: '4 / 5.7 / 1' and '-- / -- / 1' block-centered under their headers",
      any(.v50a == "Stress             4       5.7         1") &&
      any(.v50a == "Flourishing       --        --         1"))
check("N50b ... a two-digit count keeps the ones column: 19 / 27.1 over 4 / 5.7",
      any(.v50b == "SleepHours        19       27.1       --") &&
      any(.v50b == "Stress             4        5.7        1"))
check("N50c ... Outliers follows the same rule (v0.9.187): its cell sits short of the header's right edge",
      { h <- .v50a[.v50a == "Variable       Missing  % Missing  Outliers"]
        r <- .v50a[.v50a == "Stress             4       5.7         1"]
        length(h) == 1L && length(r) == 1L && nchar(r) < nchar(h) })

# =============================================================================
# N51 -- A RANGE-ONLY DECLARATION REACHES ITS BREAKDOWN (S315, AUDIT-007)
# =============================================================================
# Table 3's "Has UDMs" means a declaration of ANY kind. The flag read only
# .jst_missing_info()'s codes table, which is NULL when a column's sole
# declaration is an SPSS range, so a range-only column never reached the
# per_code breakdown: jdesc showed Non_missing 10 of 12 and nothing to explain
# the two, and a listwise function degraded per_code to totals (footnote (a),
# applied to a column that HAS a declaration). The range renders as ONE row,
# per [RANGE-COLLAPSE-RETAINED]. N51e locks the system-NA count the flag now
# shares with the System/NA row.
d51 <- data.frame(
  Score = haven::labelled_spss(c(12.5, 30, 18, 22, -97, -95, 40, 27, 33, 15,
                                 21, 36),
                               labels = c(Refused = -97, Skipped = -95),
                               na_range = c(-99, -90)),
  Grp   = rep(1:2, 6))
range_row <- function(ln) sum(grepl("^ +range -99 to -90 +2 +16\\.7$", ln))
.sn <- function(x) jstats:::.jst_system_na_count(x, jstats:::.jst_missing_info(x))
reset()
.v51a <- plines(jdesc(d51, Score, case.processing.detail = "per_code"))
check("N51a jdesc at per_code renders the breakdown for a range-only column",
      has_bottom(.v51a))
check("N51b ... as ONE range row counting both in-band cells ([RANGE-COLLAPSE-RETAINED])",
      range_row(.v51a) == 1L)
quiet(joutput("full", quiet = TRUE))
.v51c <- plines(jdesc(d51, Score))
reset()
check("N51c ... and at joutput(\"full\"), whose tier is per_code",
      range_row(.v51c) == 1L)
check("N51d a listwise function keeps per_code for it: the range row, not totals",
      range_row(plines(jt(Score ~ Grp, data = d51,
                          case.processing.detail = "per_code"))) == 1L)
check("N51e the system-NA count leaves declared cells out: codes, a range, markers",
      identical(.sn(haven::labelled_spss(c(1, -99, NA, 2), na_values = -99)), 1L) &&
      identical(.sn(haven::labelled_spss(c(1, -95, NA, NA, 2),
                                         na_range = c(-99, -90))), 2L) &&
      identical(.sn(haven::labelled(c(1, haven::tagged_na("A"), NA, 3),
                    labels = c(Refused = haven::tagged_na("A")))), 1L))
reset()

# =============================================================================
# N52 -- THE GROUPED LAYOUT ACCOUNTS FOR ITS CASES (S316, AUDIT-027)
# =============================================================================
# jdesc(by =) describes the cases that HAVE a group: a case missing on the
# grouping variable is in no table. Until v0.9.191 nothing said so -- the
# block read "70 Cases in the 2 Variable Pool" over groups summing to 65, and
# a variable's own missing cases hid inside a lone per-group N. Now (1) those
# cases are the by = row, the layout's counterpart of Auto-listwise (Table 2's
# by_row column; nonzero only; an exclusion row for Table 1), so the endpoint
# and the N line state the grouped count; (2) the N line counts the described
# variables, not the grouping variable (the S287 "2 Variable Pool" item);
# (3) every group table carries the ungrouped table's Total and Non_missing,
# so the Totals sum to the N above and each row states its own missing
# count; (4) the grouping variable keeps its breakdown rows; (5) two stops
# replace two raw-R states; (6) the grouped output closes on one blank.
# Fixture: the shipped clinic -- Medication declares -99 on 5 of 70, Stress
# on 4 (2 -99, 2 -98); under Condition != 3, 2 of the 53 are missing on
# Medication. Helpers below are local to this Part.

# group_rows(): the data rows of the group table under a caption -- from the
# caption's rule line to the next blank -- split into tokens, so Total and
# Non_missing can be read by position. NA when the caption is absent.
group_rows <- function(ln, caption) {
  i <- match(caption, ln)
  if (is.na(i)) return(NULL)
  j <- i + 1L
  while (j <= length(ln) && !grepl("^-+( +-+)*$", ln[j])) j <- j + 1L
  if (j > length(ln)) return(NULL)
  rows <- list()
  k <- j + 1L
  while (k <= length(ln) && nzchar(ln[k])) {
    rows[[length(rows) + 1L]] <- strsplit(trimws(ln[k]), " {2,}")[[1]]
    k <- k + 1L
  }
  rows
}
# col_sum(): the sum of one column of a group table, by header name.
col_sum <- function(ln, caption, col) {
  i <- match(caption, ln)
  if (is.na(i)) return(NA_real_)
  j <- i + 1L
  while (j <= length(ln) && !grepl("^-+( +-+)*$", ln[j])) j <- j + 1L
  hdr <- strsplit(trimws(ln[j - 1L]), " {2,}")[[1]]
  p   <- match(col, hdr)
  if (is.na(p)) return(NA_real_)
  rows <- group_rows(ln, caption)
  if (is.null(rows) || !length(rows)) return(NA_real_)
  sum(vapply(rows, function(r) as.numeric(r[p]), numeric(1)))
}
# trailing_blanks(): blank lines at the very end of the captured output.
trailing_blanks <- function(ln) {
  k <- 0L
  while (length(ln) - k >= 1L && !nzchar(ln[length(ln) - k])) k <- k + 1L
  k
}
endpoint_of <- function(ln) {
  i <- grep("^    Remaining N +-- +[0-9]+$", ln)
  if (length(i) == 1L) as.integer(sub(".* ([0-9]+)$", "\\1", ln[i])) else NA_integer_
}

# N52a-e -- the by = row and the endpoint, standard, no pipeline.
reset()
.v52 <- plines(jdesc(d, Flourishing, by = Medication))
check("N52a jdesc(by =) with by-missing cases prints the upper table at standard",
      has_top(.v52) && !has_n_line(.v52))
check("N52b ... with a 'by =' row: 5 excluded, 65 remaining, the variable as detail",
      identical(top_row(.v52, "by ="), "    by =                5         65  Medication"))
check("N52c ... the endpoint is the grouped count, 65",
      identical(endpoint_of(.v52), 65L))
check("N52d ... and NO Auto-listwise row (never on this layout)",
      !row_of(.v52, "Auto-listwise"))
check("N52e ... and the row sits between Original and Remaining N",
      { i <- grep("^    (Original|by =|Remaining N) ", .v52)
        identical(sub("^    ([A-Za-z =]+?) +[-0-9].*$", "\\1", .v52[i]),
                  c("Original", "by =", "Remaining N")) })

# N52f-h -- the group tables: Total and Non_missing, summing to the endpoint.
check("N52f every group table carries Total and Non_missing",
      { r <- group_rows(.v52, "Flourishing")
        i <- match("Flourishing", .v52)
        any(grepl("^Medication +Total +Non_missing +Min +Max +Mean +SD$",
                  .v52[seq(i, length(.v52))])) && length(r) == 2L })
check("N52g ... whose Totals sum to the endpoint (39 + 26 = 65)",
      identical(col_sum(.v52, "Flourishing", "Total"), 65))
.v52h <- plines(jdesc(d, Stress, by = Medication))
check("N52h a variable with its own missing cases: Non_missing below Total (35 of 39)",
      identical(group_rows(.v52h, "Stress")[[1]][2:3], c("39", "35")) &&
      identical(col_sum(.v52h, "Stress", "Total"), 65))

# N52i-k -- the N line: the grouped count, the described-variable count, the
# rider at minimal; the S287 re-pin on a clean grouping variable.
quiet(joutput("minimal", quiet = TRUE))
.v52i <- plines(jdesc(d, Flourishing, Stress, by = Medication))
reset()
check("N52i at minimal the N line states the grouped count with the rider",
      identical(n_line(.v52i),
                "65 Grouped Cases in the 2 Variable Pool; 61 Complete on All (5 Excluded)"))
.v52j <- plines(jdesc(d, Flourishing, by = Condition))
check("N52j a clean grouping variable: no table, and the pool counts the described variable only",
      !has_top(.v52j) &&
      identical(n_line(.v52j), "70 Cases in the 1 Variable Pool"))
check("N52k ... and no 'by =' row anywhere in that output",
      !row_of(.v52j, "by ="))

# N52l-m -- under a pipeline the by = row follows the pipeline rows and the
# breakdown keeps the grouping variable's rows.
reset(); quiet(jsubset(d, Condition != 3))
.v52l <- plines(jdesc(d, Flourishing, Stress, by = Medication))
.v52m <- plines(jdesc(d, Flourishing, by = Medication,
                      case.processing.detail = "per_code"))
reset()
check("N52l under jsubset(): jsubset() 17/53, then by = 2/51, endpoint 51",
      identical(top_row(.v52l, "jsubset\\(\\)"),
                "    jsubset()          17         53  Condition != 3") &&
      identical(top_row(.v52l, "by ="),
                "    by =                2         51  Medication") &&
      identical(endpoint_of(.v52l), 51L) &&
      grep("^    jsubset\\(\\) ", .v52l) < grep("^    by = ", .v52l) &&
      identical(col_sum(.v52l, "Stress", "Total"), 51))
check("N52m ... at per_code the grouping variable keeps its breakdown rows",
      has_bottom(.v52m) && var_line(.v52m, "Medication") &&
      identical(counts_under(.v52m, "Medication"), c(5, 7.1, 3, 2, 3.8)))

# N52n-o -- the two stops, and the pipeline-aware wording.
check("N52n the grouping variable cannot also be described",
      identical(emsg(jdesc(d, Flourishing, Medication, by = Medication)),
                paste0("jdesc(): Medication is the grouping variable (by = ",
                       "Medication) and cannot also be described.")))
d52 <- d; d52$Empty <- NA_real_
check("N52o a grouping variable with no values stops before the title",
      { m <- emsg(jdesc(d52, Flourishing, by = Empty))
        identical(m, paste0("jdesc(): Empty has no non-missing values, so ",
                            "there are no groups to describe.")) &&
        !any(grepl("Descriptive Statistics", plines(
          tryCatch(jdesc(d52, Flourishing, by = Empty),
                   error = function(e) NULL)))) })
reset(); quiet(jsubset(d, Medication == 5))
.m52p <- emsg(jdesc(d, Flourishing, by = Medication))
reset()
check("N52p ... naming the active step the way the table's rows do",
      identical(.m52p, paste0("jdesc(): Medication has no non-missing values ",
                              "after jsubset(), so there are no groups to ",
                              "describe.")))

# N52q-s -- the return value and the closing blank.
.r52 <- suppressWarnings(suppressMessages(utils::capture.output(
  .o52 <- jdesc(d, Flourishing, by = Medication))))
check("N52q sample_info: n_analysis 65, n_excluded_missing 5, by_var 'Medication'",
      identical(.o52$sample_info$n_analysis, 65L) &&
      identical(.o52$sample_info$n_excluded_missing, 5L) &&
      identical(.o52$sample_info$by_var, "Medication"))
check("N52r the ungrouped return keeps by_var NULL",
      { o <- suppressWarnings(suppressMessages(utils::capture.output(
          u <- jdesc(d, Flourishing))))
        is.null(u$sample_info$by_var) })
check("N52s the grouped output closes on ONE blank line, like the ungrouped",
      identical(trailing_blanks(.v52), 1L) &&
      identical(trailing_blanks(plines(jdesc(d, Flourishing))), 1L) &&
      identical(trailing_blanks(plines(jdesc(d, Flourishing, by = Medication,
                                             variable.id = "legend"))), 1L))
check("N52t layout frame: by_row is eligible on per_var_desc alone",
      { f <- jstats:::.jst_cps_layout_rules
        "by_row" %in% names(f) &&
        identical(f$layout[f$by_row == "eligible"], "per_var_desc") })
reset()

# =============================================================================
# N53 -- JDESC'S TABLES: BLOCK-CENTERED COLUMNS, TRIMMED LINES (S316, v0.9.192)
# =============================================================================
# Both jdesc tables -- the ungrouped one and each grouped mini-table -- give
# every numeric column the S313 "bc" code: the header centered over the
# column, each value right-justified in a block the width of the column's
# widest value, the block centered under the header. So counts sit under the
# middle of Total and Non_missing on their ones digit, and the statistics keep
# their decimal alignment. Both tables also pass trim = TRUE, so no header or
# data row ends in padding (a centered header in the LAST column did; so did a
# data row whose last value was narrower than its header). The trim is opt-in.
# S327 (v0.9.203) gave the same form to the 17 statistics tables that were
# still on the default alignment -- format_check.R section J asserts them --
# so N53g, which locked "jt's table is unchanged", now pins jt's table in the
# new form; N53h moves the scope lock to a table still outside, jfreq's, and
# N53i locks the renderer's defaults, which the slice left alone.
# Fixture: d as above, plus d53 (two groups of 12 and 3) for the ones-digit
# check. raw_lines() is local to this Part: plines() strips trailing
# whitespace, which is exactly what N53e-f must see.
raw_lines <- function(expr) {
  txt <- suppressWarnings(suppressMessages(utils::capture.output(expr)))
  gsub("\033\\[[0-9;]*[A-Za-z]", "", txt)
}
# col_cells(): the text of one column in every data row of the table whose
# header line matches hdr_pattern -- the column's span read off the dashes of
# the separator line below the header, so a cell is taken by POSITION, not by
# splitting on spaces. NULL when the table is absent.
col_cells <- function(ln, hdr_pattern, col) {
  h <- grep(hdr_pattern, ln)[1]
  if (is.na(h)) return(NULL)
  sep <- ln[h + 1L]
  runs <- gregexpr("-+", sep)[[1]]
  starts <- as.integer(runs); ends <- starts + attr(runs, "match.length") - 1L
  rows <- character(0); k <- h + 2L
  while (k <= length(ln) && nzchar(trimws(ln[k]))) {
    rows <- c(rows, ln[k]); k <- k + 1L
  }
  vapply(rows, function(r) substr(formatC(r, width = -max(ends), flag = "-"),
                                  starts[col], ends[col]),
         character(1), USE.NAMES = FALSE)
}
reset()

# N53a-b -- the two tables' header and first row, pinned whole.
.v53a <- plines(jdesc(d, Stress, SocialSupport))
check("N53a ungrouped: headers centered, counts block-centered under Total and Non_missing",
      any(.v53a == "Variable       Total  Non_missing  Min  Max   Mean     SD") &&
      any(.v53a == "Stress           70        66       0    40  15.182  7.403"))
.v53b <- plines(jdesc(d, Flourishing, by = Medication))
check("N53b grouped: the same form in the group table",
      any(.v53b == "Medication  Total  Non_missing  Min  Max   Mean     SD") &&
      any(.v53b == "0: No         39        39       25   75  51.564  11.553"))

# N53c -- a two-digit and a one-digit count align on their ones digit, and the
# block sits under the middle of its header (d53: groups of 12 and 3).
d53 <- data.frame(Score = c(1:12, 20, 21, 22), G = c(rep(1, 12), rep(2, 3)))
.v53c <- plines(jdesc(d53, Score, by = G))
check("N53c counts align on their ones digit, the block centered under Total",
      { cc <- col_cells(.v53c, "^G +Total +Non_missing", 2L)
        right <- vapply(cc, function(x) nchar(sub(" +$", "", x)), integer(1))
        left  <- regexpr("[^ ]", cc)
        length(cc) == 2L && length(unique(right)) == 1L &&
          # the block ("12") sits two spaces in from the left edge of the
          # five-wide column and one from the right: centered with the odd
          # space on the LEFT (the S328 lean), not right-justified
          identical(as.integer(left[1]), 3L) && identical(right[[1]], 4L) })

# N53d -- decimal alignment kept in a column whose values differ in width.
.v53d <- plines(jdesc(d, Flourishing, Stress))
check("N53d the SD column keeps decimal alignment (13.865 over 7.403)",
      { cc <- col_cells(.v53d, "^Variable +Total +Non_missing", 7L)
        length(cc) == 2L && length(unique(regexpr(".", cc, fixed = TRUE))) == 1L &&
          identical(trimws(cc), c("13.865", "7.403")) })

# N53e -- no line of either table ends in a space: the centered SD header,
# and (digits = 0, SD values one character under a two-character header) a
# data row padded out to its column.
check("N53e no header or data row of a jdesc table ends in a space",
      { outs <- list(raw_lines(jdesc(d, Stress, SocialSupport)),
                     raw_lines(jdesc(d, Flourishing, by = Medication)),
                     raw_lines(jdesc(d, Stress, by = Condition, digits = 0)))
        all(vapply(outs, function(o) !any(grepl(" $", o)), logical(1))) })

# N53f -- the trim itself, on the helper: ON BY DEFAULT since S328 (it was
# opt-in from S316), and it removes only padding. Built inside the check, so
# a master without the argument FAILS here rather than halting the battery
# outside its verdict.
.df53 <- data.frame(Name = c("a", "b"), Value = c(1, 22))
check("N53f .jst_print_table(trim =): on by default; trim = FALSE restores the padding; it removes only trailing spaces",
      { tt <- raw_lines(jstats:::.jst_print_table(.df53, align = c("l", "bc")))
        tn <- raw_lines(jstats:::.jst_print_table(.df53, align = c("l", "bc"),
                                                  trim = FALSE))
        any(grepl(" $", tn)) && !any(grepl(" $", tt)) &&
          identical(sub(" +$", "", tn), tt) })

# N53g -- jt's Group Descriptives table, RE-PINNED S327 (v0.9.203). It was the
# S316 scope lock ("unchanged": a right-justified header, "Group    N    Mean
#      SD"); since the first slice of the package-wide item it takes jdesc's
# form, each header centered over its column. The data row reads as before:
# every value fills its column, so only the header line moved. RE-PINNED
# S328 for the lean: "N" over the ones digit of 49, where it sat over the 4.
check("N53g jt's Group Descriptives table takes jdesc's form: each header centered over its column",
      { v <- plines(jt(Flourishing ~ SoughtHelp, d))
        any(v == "Group    N   Mean     SD") && any(v == "0: No   49  50.061  12.768") })

# N53h -- the scope lock, RETIRED S328: the package-wide item is built, so
# no table stands outside it. The check stays as jfreq's entry in this
# battery -- its columns block-centered ("Valid %" one place in from each
# edge of its column) and no line padded, where through v0.9.203 it was the
# table that kept an explicit "r" and its padding. format_check.R section M
# reads the table in full. raw_lines(), because the absent padding is the
# point.
check("N53h jfreq's table, the last one outside the form, takes it: block-centered columns, no line padded",
      { v <- raw_lines(jfreq(d, Condition))
        any(v == "                  Freq  Total %  Valid %  Cum. %") &&
          any(v == "1: Control         18     25.71   25.71    25.71") &&
          any(v == "Total              70    100.00") &&
          !any(grepl(" $", v)) })

# N53i -- the renderer's own DEFAULTS, as the package-wide item settled them
# (S328, Jeff): a caller that passes no align still gets a numeric column
# right-justified, header included, and a text column left-justified -- the
# form a listing of data rows keeps, and "bc" is NOT the numeric default,
# because a default cannot know that a text column holds p-values -- but its
# lines are TRIMMED now: trim is the default. (Until S327 the old N53g did
# this job through jt's table, which took the default; from S327 to S328
# this check locked the padded form.)
check("N53i the renderer's defaults: no align means numbers right and text left, and no line padded",
      { v <- raw_lines(jstats:::.jst_print_table(
               data.frame(Name = c("a", "bb"), Value = c(1, 22),
                          Text = c("x", "yy"), stringsAsFactors = FALSE),
               row.names = FALSE))
        identical(v, c("Name  Value  Text", "----  -----  ----",
                       "a         1  x", "bb       22  yy")) })

# N55 -- THE LEAN IN THE CASE PROCESSING BLOCK (S328, v0.9.204). Where a count
# or a "%" header cannot be centered exactly, the odd space goes on the LEFT,
# so the text sits one place right of center -- the rule Jeff chose for every
# table, and the block's own centering (ctr_count) follows it. Through
# v0.9.203 the odd space went on the right, here as everywhere. NOTHING in
# this battery could see the block's lean before these three: the
# breakdown's counts are read as numbers (counts_under()) or through
# patterns that take any run of spaces, and the header lines pinned whole
# carry "%" over a three-wide percentage, which centers exactly. d55 has a
# two-digit count (19, an odd spare of five under "From 70") and a
# four-wide percentage (27.1, an odd spare of three under "%").
d55 <- d; d55$SleepHours[1:17] <- NA
.v55a <- plines(jlm(Flourishing ~ SleepHours + Stress, d55))
quiet(jcomplete(d55, Stress, SleepHours, Medication))
.v55c <- plines(jlm(Flourishing ~ SleepHours + Stress, d55))
quiet(jcomplete(clear.all = TRUE)); rm(d55)
check("N55a a two-digit count sits right of center under 'From 70', and a one-digit count on its ones digit: 19 over 4",
      any(.v55a == "      Missing     19    27.1") &&
      any(.v55a == "      Missing      4     5.7"))
check("N55b ... the '%' header over a four-wide percentage: 'Missing data   From 70    %'",
      any(.v55a == "Missing data   From 70    %"))
check("N55c ... and under a pipeline, in every count column: 'Missing data   From 70    %   Filtered  From 45    %'",
      any(.v55c == "Missing data   From 70    %   Filtered  From 45    %") &&
      any(.v55c == "      Missing     19    27.1     19        0      0.0") &&
      any(.v55c == "      Missing      5     7.1      5        0      0.0"))
reset()

# =============================================================================
# N54 -- THE SCREENING LAYOUT: jscreen() (S320, v0.9.197)
# =============================================================================
# jscreen() joined the framework as Table 2's fifth layout. An active filter
# -- a stored jcomplete() or jsubset(), or subset = -- prints the table in the
# block's slot, between the title and the header, as in every analysis
# function, and joutput()'s case.processing setting governs it the same way.
# The layout has no bottom (jscreen's own Missing Data table is its
# breakdown) and no N line of its own: its N-line family, "header", has the
# one form "none", so in the N-line state the block prints NOTHING -- not
# even the closing blank rule 8 gives a block that printed something -- and
# the header's Cases line states the count, carrying the excluded count in
# never-mode: "Cases: 53 (17 Excluded)".
# Helpers local to this Part: cases_line() (the header's Cases line, or NA;
# plines() has already stripped its trailing space) and has_run() (a block
# of lines found consecutively and in order -- a pinned run, where row_of()
# checks one row).
cases_line <- function(ln) {
  i <- grep("^  Cases: ", ln)
  if (length(i) == 1L) ln[i] else NA_character_
}
has_run <- function(ln, run) {
  k <- length(run)
  if (k == 0L || length(ln) < k) return(FALSE)
  any(vapply(seq_len(length(ln) - k + 1L),
             function(i) identical(ln[i:(i + k - 1L)], run), logical(1)))
}
# .s54() catches an error and returns it as one line, so a jscreen() that
# stops FAILS the checks that read its output rather than halting the
# battery outside its verdict (the N53f rule, for captures shared by several
# checks); the reset() after each capture runs either way.
.s54 <- function(...) {
  tryCatch(plines(jscreen(d, Stress, SocialSupport, Flourishing, ...)),
           error = function(e) paste("[error]", conditionMessage(e)))
}
reset()

# N54a -- standard, no filter: nothing added. The title is followed directly
# by the Cases line, exactly as before v0.9.197.
.v54a <- .s54()
check("N54a standard, no filter: no table, no N line, the Cases line straight under the title",
      !has_top(.v54a) && !has_n_line(.v54a) &&
      has_run(.v54a, c("Data Screening", "  Cases: 70")))

# N54b-c -- standard under jsubset(): the table, pinned whole, then its place.
quiet(jsubset(d, Condition != 3)); .v54b <- .s54(); reset()
check("N54b standard, jsubset(): the table prints, and the Cases line repeats its Remaining N",
      has_run(.v54b, c("Case Processing  Excluded  Remaining",
                       "    Original           --         70",
                       "    jsubset()          17         53  Condition != 3",
                       "    Remaining N        --         53")) &&
      identical(cases_line(.v54b), "  Cases: 53"))
check(
  paste0("N54c ... between the title and the header: one blank above it, the\n",
  "      rule hugging Remaining N, one blank before the Cases line"),
      has_run(.v54b, c("Data Screening", "",
                       "Case Processing  Excluded  Remaining")) &&
      has_run(.v54b, c("    Remaining N        --         53",
                       strrep("-", 52L), "", "  Cases: 53")))

# N54d -- three filters at once: the pipeline's order, the "(k missing)" note
# (Medication declares -99 on two of the 51 cases the first two leave).
quiet(jcomplete(d, Stress)); quiet(jsubset(d, Condition != 3))
.v54d <- .s54(subset = Medication == 1); reset()
check("N54d three filters: jcomplete(), jsubset(), subset = in pipeline order, the (k missing) note",
      has_run(.v54d, c("    Original           --         70",
                       "    jcomplete()         4         66  Stress",
                       "    jsubset()          15         51  Condition != 3",
                       "    subset =           29         22  Medication == 1 (2 missing)",
                       "    Remaining N        --         22")) &&
      identical(cases_line(.v54d), "  Cases: 22"))

# N54e -- a filter that excludes nothing still shows: the reminder (Table 1
# note c), with no rider on the Cases line.
quiet(jsubset(d, Condition > 0)); .v54e <- .s54(); reset()
check("N54e standard, a filter that excludes nothing: its row shows at 0, and the Cases line has no rider",
      has_run(.v54e, c("    Original           --         70",
                       "    jsubset()           0         70  Condition > 0",
                       "    Remaining N        --         70")) &&
      identical(cases_line(.v54e), "  Cases: 70"))

# N54f -- full, and case.processing = TRUE, are literal: the table prints with
# no filter, Original and Remaining N only.
quiet(joutput("full", quiet = TRUE)); .v54f1 <- .s54(); reset()
quiet(joutput(case.processing = TRUE, quiet = TRUE)); .v54f2 <- .s54(); reset()
.full54 <- c("Data Screening", "",
             "Case Processing  Excluded  Remaining",
             "    Original           --         70",
             "    Remaining N        --         70",
             strrep("-", 36L), "", "  Cases: 70")
check("N54f full, no filter: the literal table, Original and Remaining N; case.processing = TRUE the same",
      has_run(.v54f1, .full54) && has_run(.v54f2, .full54))

# N54g-j -- never-mode: no table, and the Cases line carries the count the
# table would have shown, in the form every N line's rider takes.
quiet(joutput("minimal", quiet = TRUE)); quiet(jsubset(d, Condition != 3))
.v54g <- .s54(); reset()
check("N54g minimal, jsubset(): no table, no N line; the Cases line carries (17 Excluded)",
      !has_top(.v54g) && !has_n_line(.v54g) &&
      has_run(.v54g, c("Data Screening", "  Cases: 53 (17 Excluded)")))
quiet(joutput(case.processing = FALSE, quiet = TRUE)); quiet(jsubset(d, Condition != 3))
.v54h1 <- .s54(); reset()
quiet(joutput("minimal", quiet = TRUE)); .v54h2 <- .s54(subset = Condition != 3); reset()
check("N54h ... the same line under case.processing = FALSE at standard, and from subset = at minimal",
      !has_top(.v54h1) && identical(cases_line(.v54h1), "  Cases: 53 (17 Excluded)") &&
      !has_top(.v54h2) && identical(cases_line(.v54h2), "  Cases: 53 (17 Excluded)"))
quiet(joutput("minimal", quiet = TRUE)); quiet(jcomplete(d, Stress))
quiet(jsubset(d, Condition != 3)); .v54i <- .s54(subset = Medication == 1); reset()
check("N54i ... three filters at minimal: one count for every step's exclusions",
      identical(cases_line(.v54i), "  Cases: 22 (48 Excluded)"))
quiet(joutput("minimal", quiet = TRUE)); .v54j1 <- .s54()
quiet(jsubset(d, Condition > 0)); .v54j2 <- .s54(); reset()
check("N54j minimal with no filter, or a filter that excludes nothing: no rider, never (0 Excluded)",
      identical(cases_line(.v54j1), "  Cases: 70") &&
      identical(cases_line(.v54j2), "  Cases: 70") &&
      !any(grepl("Excluded)", c(.v54j1, .v54j2), fixed = TRUE)))

# N54k -- a filter set on ANOTHER frame: the pipeline's reminder line, no
# table, every case screened (the pre-v0.9.197 output).
d54o <- d; quiet(jsubset(d54o, Condition != 3)); .v54k <- .s54(); reset(); rm(d54o)
check("N54k a filter on another frame: the reminder line, no table, all 70 cases",
      any(.v54k == "(jsubset not active for this dataset)") &&
      !has_top(.v54k) && identical(cases_line(.v54k), "  Cases: 70"))

# N54l -- across every state above: jscreen never prints an N line, never a
# bottom breakdown, never the per-variable layouts' listwise-discrepancy note
# (three variables with different missing cases would draw it on jdesc).
.all54 <- list(.v54a, .v54b, .v54d, .v54e, .v54f1, .v54f2, .v54g, .v54h1,
               .v54h2, .v54i, .v54j1, .v54j2, .v54k)
check("N54l in every state above: never an N line, never a bottom, never the discrepancy note",
      !any(vapply(.all54, has_n_line, logical(1))) &&
      !any(vapply(.all54, has_bottom, logical(1))) &&
      !any(vapply(.all54, function(v)
             any(grepl("Listwise deletion using jcomplete()", v, fixed = TRUE)),
             logical(1))))

# N54m-n -- the printer driven directly on the screening layout (the Table 1
# frame checks' route): what it prints, and the count it hands back. Each
# call is made INSIDE its check, so a master without the layout FAILS there
# rather than halting the battery outside its verdict (the N53f rule); the
# reset() after each check runs either way.
.si54 <- list(n_original = 70L, n_analysis = 53L, n_after_pipeline = 53L,
              filter_active = TRUE, n_after_filter = 53L,
              filter_expr = "Condition != 3", analysis_vars = character(0))
check("N54m printer, screening, never-mode: prints nothing at all, returns the excluded count (17)",
      { quiet(joutput("minimal", quiet = TRUE))
        .p54m <- plines(.r54m <- jstats:::.jst_print_case_processing(
          .si54, analysis_type = "screening"))
        identical(length(.p54m), 0L) && identical(.r54m$header_excluded, 17L) })
reset()
check("N54n ... auto with a filter: the table prints, and the returned count is 0",
      { .p54n <- plines(.r54n <- jstats:::.jst_print_case_processing(
          .si54, analysis_type = "screening"))
        has_top(.p54n) && row_of(.p54n, "jsubset()") &&
          identical(.r54n$header_excluded, 0L) })

# N54o -- the frames' screening rows, as Tables 2 and 4 state them.
check("N54o frames: screening is bottom off, Remaining N, no Auto-listwise or by = row, family header; header's form is none",
      { f <- jstats:::.jst_cps_layout_rules; r <- f[f$layout == "screening", ]
        g <- jstats:::.jst_cps_n_line_rules
        identical(nrow(r), 1L) &&
        identical(unname(unlist(r[, c("bottom_default", "endpoint_label",
                                      "auto_listwise", "by_row",
                                      "n_line_family")])),
                  c("off", "Remaining N", "never", "never", "header")) &&
        identical(g$form[g$family == "header"], "none") })
reset()

# =============================================================================
# N56 -- joutput()'s SETTING ECHO (S332, v0.9.208)
# =============================================================================
# A joutput() setting call echoes only what it touched -- the red title, the
# lines named, and a pointer at the full panel -- as joptions() has since
# S233. Through v0.9.207 every call printed the Level line and all fourteen
# settings, so the change was lost in the standing state (Jeff, S327). What
# stays the full panel: a bare joutput(), and a LEVEL call, which moves most
# settings at once. The three Case Processing settings echo together when one
# of them is WRITTEN: case.processing = FALSE silences the other two and
# case.processing.detail = "none" silences case.processing.filter, so each is
# read in light of the others. A setting name in the first position, written
# without an argument name, is a QUERY (joptions("slot")'s form). And
# joutput(digits = 3) no longer reads "(override)" (Session 181).
# This section is here, not in a battery of its own, because N46b already
# reads the panel here and the one related group is the Case Processing trio.
.ptr56 <- "Run joutput() to see all settings."
.e56   <- function(expr) tryCatch({ quiet(expr); NA_character_ },
                                  error = function(e) conditionMessage(e))
.lvl56 <- "joutput(): `level` must be \"minimal\", \"standard\", or \"full\"."
reset()
.v56a <- plines(joutput(digits = 2))
check("N56a a setting call echoes the title, the one line and the pointer -- no Level line, no other setting -- and writes the setting",
      identical(.v56a, c("Output Settings", "  digits: 2 (override)", .ptr56, "")) &&
      identical(getOption(".jst_output_toggles")$digits, 2L))
reset()
check("N56b two settings echo in panel order, whatever the call's order",
      identical(plines(joutput(posthoc = TRUE, regression.ci = TRUE)),
                c("Output Settings", "  regression.ci: ON (override)",
                  "  posthoc: ON (override)", .ptr56, "")))
reset()
.trio56 <- function(a, b, c) c("Output Settings",
                               paste0("  case.processing: ", a),
                               paste0("  case.processing.detail: ", b),
                               paste0("  case.processing.filter: ", c),
                               .ptr56, "")
check("N56c setting case.processing.detail echoes the three Case Processing settings",
      identical(plines(joutput(case.processing.detail = "per_code")),
                .trio56("AUTO", "PER_CODE (override)", "AUTO")))
reset()
check("N56d ... as does setting case.processing",
      identical(plines(joutput(case.processing = FALSE)),
                .trio56("OFF (override)", "TOTALS", "AUTO")))
reset()
check("N56e ... and setting case.processing.filter",
      identical(plines(joutput(case.processing.filter = "list")),
                .trio56("AUTO", "TOTALS", "LIST (override)")))
reset()
check("N56f a named NULL echoes the setting's current value and writes nothing",
      identical(plines(joutput(regression.ci = NULL)),
                c("Output Settings", "  regression.ci: OFF", .ptr56, "")) &&
      is.null(getOption(".jst_output_toggles")))
check("N56g ... and pulls no partner: joutput(case.processing = NULL) is one line",
      identical(plines(joutput(case.processing = NULL)),
                c("Output Settings", "  case.processing: AUTO", .ptr56, "")))
check("N56h ... beside a setting that IS written, both are echoed",
      identical(plines(joutput(digits = NULL, regression.ci = TRUE)),
                c("Output Settings", "  regression.ci: ON (override)", "  digits: 3",
                  .ptr56, "")))
reset()
check("N56i quiet = TRUE prints nothing for a setting call, a named NULL included, and still applies the setting",
      identical(plines(joutput(digits = 4, quiet = TRUE)), character(0)) &&
      identical(getOption(".jst_output_toggles")$digits, 4L) &&
      identical(plines(joutput(regression.ci = NULL, quiet = TRUE)), character(0)))
reset()
.v56j <- plines(joutput("full"))
# Thirteen settings since S346: levene left the panel when Levene's test
# became one of the diagnostics.
check("N56j a LEVEL call keeps the full panel: the Level line, thirteen settings, no pointer",
      identical(length(.v56j), 16L) && identical(.v56j[1:2], c("Output Settings", "Level: full")) &&
      !any(.v56j == .ptr56) && identical(.v56j[16], ""))
.v56k <- plines(joutput("standard", regression.ci = TRUE))
check("N56k ... with a setting in the same call too",
      identical(length(.v56k), 16L) && identical(.v56k[2], "Level: standard") &&
      any(.v56k == "  regression.ci: ON (override)") && !any(.v56k == .ptr56))
reset()
.v56l <- plines(joutput(quiet = TRUE))
check("N56l a bare joutput() is the full panel, with no pointer, whatever quiet says",
      identical(length(.v56l), 16L) && identical(.v56l[2], "Level: standard") &&
      !any(.v56l == .ptr56))
quiet(joutput(regression.ci = TRUE, quiet = TRUE))
.o56 <- list(getOption(".jst_output_level"), getOption(".jst_output_toggles"))
# Wrapped: before v0.9.208 this call is the level error, and an uncaught
# stop here would end the battery instead of failing N56m inside the verdict.
.v56m <- tryCatch(plines(joutput("regression.ci", quiet = TRUE)),
                  error = function(e) NA_character_)
check("N56m joutput(\"regression.ci\") is a query: the one line and the pointer, whatever quiet says, and nothing changed",
      identical(.v56m, c("Output Settings", "  regression.ci: ON (override)", .ptr56, "")) &&
      identical(.o56, list(getOption(".jst_output_level"), getOption(".jst_output_toggles"))))
check("N56n ... its line is the full panel's own line",
      any(plines(joutput()) == .v56m[2]))
check("N56o a query takes several names, in panel order, repeats dropped",
      identical(plines(joutput(c("posthoc", "regression.ci", "posthoc"))),
                c("Output Settings", "  regression.ci: ON (override)", "  posthoc: OFF",
                  .ptr56, "")))
check("N56p ... and pulls no partner: joutput(\"case.processing.detail\") is one line",
      identical(plines(joutput("case.processing.detail")),
                c("Output Settings", "  case.processing.detail: TOTALS", .ptr56, "")))
reset()
check("N56q a NAMED level = \"digits\" is a setting call with a bad value: the level error",
      identical(.e56(joutput(level = "digits")), .lvl56))
check("N56r a near miss names the setting, quoting what was typed, with the call to run",
      identical(.e56(joutput("digit")),
                "joutput(): no setting named \"digit\". Did you mean digits?\n  joutput(\"digits\")") &&
      identical(.e56(joutput("DIGITS")),
                "joutput(): no setting named \"DIGITS\". Did you mean digits?\n  joutput(\"digits\")"))
check("N56s ... at two edits (\"dgts\") but not at three (\"dgt\"), which is the level error",
      identical(.e56(joutput("dgts")),
                "joutput(): no setting named \"dgts\". Did you mean digits?\n  joutput(\"digits\")") &&
      identical(.e56(joutput("dgt")), .lvl56))
check("N56t a string near no setting is the level error: \"ful\", \"xyzzy\"",
      identical(.e56(joutput("ful")), .lvl56) && identical(.e56(joutput("xyzzy")), .lvl56))
reset()
check("N56u joutput(digits = 3) is not an override at a level whose default is 3; digits = 2 is",
      identical(plines(joutput(digits = 3))[2], "  digits: 3") &&
      any(plines(joutput()) == "  digits: 3") &&
      identical(plines(joutput(digits = 2))[2], "  digits: 2 (override)"))
reset()
check("N56v joutput(NULL) keeps its own two lines",
      identical(plines(joutput(NULL)),
                c("Output Settings", "Reset to defaults (standard, no toggle overrides).", "")))
reset()
quiet(joutput(regression.ci = TRUE, quiet = TRUE)); quiet(joutput(digits = 2, quiet = TRUE))
check("N56w a setting call adds to the overrides already set",
      identical(getOption(".jst_output_toggles"), list(regression.ci = TRUE, digits = 2L)))
.v56x <- plines(joutput("full"))
check("N56x ... and a level call clears them: the panel is the level's own",
      is.null(getOption(".jst_output_toggles")) && any(.v56x == "  digits: 3") &&
      !any(grepl("(override)", .v56x, fixed = TRUE)))
reset()
rm(.ptr56, .e56, .lvl56, .trio56, .v56a, .v56j, .v56k, .v56l, .v56m, .o56, .v56x)

# =============================================================================
# N57 -- A STRING VARIABLE'S DECLARED MISSING VALUES (S340, v0.9.214)
# =============================================================================
# SPSS declares missing values on a string variable directly -- MISSING VALUES
# MARITAL ('UNKNOWN'). -- and haven carries them as a character na_values on a
# character-backed haven_labelled_spss column. Until 0.9.214 the reading
# helper coerced the declared strings to numbers: every one became NA (behind
# an "NAs introduced by coercion" warning, raised twice per jfreq() call),
# nothing was masked, and the declared value was tabulated as VALID above a
# Missing block of one empty row, "NA (no label)  0" (the S336 item; Jeff's
# S336 ruling: honor the declaration when reading). The declared strings are
# now the codes -- counted as stored, masked on the analysis copy -- wherever
# a declared numeric code is: jfreq()'s Missing rows, the Case Processing
# breakdown, jscreen(), jcomplete(), every listwise function.
t57 <- data.frame(Age = c(21, 34, 45, 23, 36, 52, 41, 29, 33, 40),
                  Grp = rep(1:2, 5))
t57$MS <- haven::labelled_spss(
  c("UNKNOWN", "Married", "Single", "Married", "UNKNOWN", "Single", "Married",
    NA, "REF", "Single"),
  labels = c(Refused = "REF"), na_values = c("UNKNOWN", "REF"),
  label = "Marital status")
t57$Inc <- haven::labelled_spss(c(1, 2, -99, 3, 4, 5, -99, 2, 1, 3),
                                na_values = -99)
# .w57(): the warnings a call raises (plines() swallows them).
.w57 <- function(expr) {
  w <- character(0)
  withCallingHandlers(invisible(plines(expr)),
                      warning = function(c) {
                        w <<- c(w, conditionMessage(c)); invokeRestart("muffleWarning")
                      })
  w
}
.i57 <- jstats:::.jst_missing_info(t57$MS)

check("N57a .jst_missing_info(): the declared strings are the codes, as stored and in a fixed order, each with its label; numeric is NA; text is TRUE",
      identical(.i57$representation, "spss") && isTRUE(.i57$text) &&
        identical(.i57$codes$code, c("REF", "UNKNOWN")) &&
        identical(.i57$codes$label, c("Refused", NA)) &&
        all(is.na(.i57$codes$numeric)) && is.null(.i57$na_range))
check("N57b ... and it raises no warning (the coercion warned on every read)",
      { w <- character(0)
        withCallingHandlers(jstats:::.jst_missing_info(t57$MS),
                            warning = function(c) { w <<- c(w, conditionMessage(c))
                                                    invokeRestart("muffleWarning") })
        length(w) == 0L })
check("N57c a numeric declaration reads as before, with text FALSE",
      { i <- jstats:::.jst_missing_info(t57$Inc)
        isFALSE(i$text) && identical(i$codes$code, "-99") &&
          identical(i$codes$numeric, -99) })
check("N57d a range cannot be declared on a string variable: a stray na_range on text declares nothing",
      { x <- c("a", "b"); attr(x, "na_range") <- c(1, 2)
        is.null(jstats:::.jst_missing_info(x)) })
check("N57e the masking pass: the declared cells are NA on the analysis copy, the others untouched, and the record counts them",
      { r <- jstats:::.jst_apply_declared_udms_as_na(t57)
        identical(as.character(unclass(r$data$MS)),
                  c(NA, "Married", "Single", "Married", NA, "Single", "Married",
                    NA, NA, "Single")) &&
          identical(r$converted$MS$n_cells, 3L) &&
          identical(r$converted$MS$entries$code_display, c("REF", "UNKNOWN")) &&
          identical(r$converted$MS$entries$count, c(1L, 2L)) })
.v57f <- plines(jfreq(t57, MS))
check("N57f jfreq(): the declared strings are Missing rows, labeled as a declared code is, and the valid base leaves them out (the table pinned whole)",
      identical(.v57f[7:20],
        c("                    Freq  Total %  Valid %  Cum. %",
          "------------------  ----  -------  -------  ------",
          "Valid",
          "Married               3     30.00    50.00   50.00",
          "Single                3     30.00    50.00  100.00",
          "Total valid           6     60.00   100.00",
          "",
          "Missing",
          "REF [\"Refused\"]       1     10.00       --      --",
          "UNKNOWN (no label)    2     20.00       --      --",
          "System/NA             1     10.00       --      --",
          "Total missing         4     40.00",
          "",
          "Total                10    100.00")))
check("N57g ... with no warning, and no \"NA (no label)\" row",
      length(.w57(jfreq(t57, MS))) == 0L &&
        !any(grepl("NA (no label)", .v57f, fixed = TRUE)))
check("N57h jfreq() under subset =: the Missing rows are counted off the pool",
      { v <- plines(jfreq(t57, MS, subset = Grp == 1))
        any(v == "REF [\"Refused\"]       1     20.00       --      --") &&
          any(v == "UNKNOWN (no label)    2     40.00       --      --") &&
          !any(startsWith(v, "System/NA")) &&
          any(v == "Total                 5    100.00") })
.v57i <- plines(jaov(Age ~ MS, data = t57, case.processing.detail = "per_code"))
check("N57i a listwise function: the declared cases are excluded, and the breakdown lists each declared string with its count",
      row_of(.v57i, "Auto-listwise") &&
        any(.v57i == "    Auto-listwise         4          6") &&
        any(.v57i == "      REF [\"Refused\"]        1     10.0") &&
        any(.v57i == "      UNKNOWN (no label)     2     20.0") &&
        any(.v57i == "      System/NA              1     10.0"))
check("N57j ... and the groups are the two valid categories, with no warning",
      any(startsWith(.v57i, "Married  3")) && any(startsWith(.v57i, "Single   3")) &&
        !any(startsWith(.v57i, "UNKNOWN")) && !any(startsWith(.v57i, "REF ")) &&
        length(.w57(jaov(Age ~ MS, data = t57))) == 0L)
.v57k <- plines(jscreen(t57))
check("N57k jscreen(): the header's count and the table's agree (the header said 0 beside a row of 2), no warning",
      any(.v57k == "  Cases with missing data: 6") &&
        any(.v57k == "MS           4        40.0") &&
        any(.v57k == "Inc          2        20.0") &&
        any(.v57k == "MS        Categorical   dichotomy          2") &&
        any(.v57k == "Note: SPSS-style declared missing values on: MS, Inc.") &&
        length(.w57(jscreen(t57))) == 0L)
.v57l <- plines(jcomplete(t57, MS))
check("N57l jcomplete(): its table and its count agree (\"2 missing\" stood beside \"9 of 9 complete\")",
      any(.v57l == "MS        10     4       40.0%") &&
        any(.v57l == "  Complete cases: 6 of 10 (60.0%)"))
reset()
check("N57m the shared system-NA count leaves the declared cells out",
      identical(jstats:::.jst_system_na_count(t57$MS, .i57), 1L))
check("N57n a filter runs on the masked copy: subset = MS == \"Married\" keeps 3 cases and reports the 4 missing",
      { v <- plines(jdesc(t57, Age, subset = MS == "Married"))
        any(grepl("subset =            7          3  MS == \"Married\" (4 missing)",
                  v, fixed = TRUE)) })
rm(t57, .w57, .i57, .v57f, .v57i, .v57k, .v57l)

# =============================================================================
# N58 -- BLANK TEXT CELLS IN jfreq() AND jscreen() (S340, v0.9.214)
# =============================================================================
# A text cell can be empty three ways that look alike: "", spaces or tabs
# only, and NA. Until 0.9.214 jfreq() printed each kind of blank as a row
# with no label (three rows, for three spellings) inside the valid base and
# said nothing; jscreen() counted NA alone -- "Cases with missing data: 3" on
# a field file with 3,798 blank dates (the S222 item, ruled a defect). The
# rule (Jeff, S222, and the S340 lean on it): a blank is REPORTED and never
# ASSUMED missing. jfreq() shows ONE row, <blank>, first among the valid
# rows, and a three-line footnote; jscreen() counts blank cells on a header
# line and in two columns of their own, beside the missing counts and never
# inside them. The Case Processing block is unchanged: a blank is not
# missing.
b58 <- data.frame(
  Source = c("Adult", "Adult", "Juvenile", "", "   ", NA, "Adult", "",
             "Juvenile", "Adult", "\t", "Adult"),
  Sec    = c("Y", "", "Y", "", "Y", "", "", "Y", "", "", "Y", ""),
  Age    = c(21, 34, NA, 45, 23, 36, 52, 41, 29, 33, 38, 47),
  stringsAsFactors = FALSE)
.v58a <- plines(jfreq(b58, Source))
check("N58a jfreq(): one <blank> row for the empty and the whitespace cells, first among the valid rows; the table and its footnote pinned whole",
      identical(.v58a[3:22],
        c("12 Cases in the 1 Variable Pool", "", "Source", "",
          "             Freq  Total %  Valid %  Cum. %",
          "-----------  ----  -------  -------  ------",
          "Valid",
          "<blank>        4     33.33    36.36   36.36",
          "Adult          5     41.67    45.45   81.82",
          "Juvenile       2     16.67    18.18  100.00",
          "Total valid   11     91.67   100.00",
          "",
          "Missing",
          "System/NA      1      8.33       --      --",
          "",
          "Total         12    100.00",
          "<blank>: 4 cells with no text (2 empty, 2 holding only spaces or tabs).",
          "They are counted as valid values, not as missing.",
          "To give them a code or make them missing, use jencode().",
          "")))
check("N58b ... the footnote sits against the Total row, and the output ends on one blank line",
      length(.v58a) == 22L && nzchar(.v58a[21]) && !nzchar(.v58a[22]))
check("N58c the blank cells are in the valid base, and the return value counts them",
      { r <- NULL; invisible(plines(r <- jfreq(b58, Source)))
        f <- r$frequencies$Source
        identical(f$valid_count, 11L) && identical(f$blank, 4L) &&
          identical(f$valid$Value, c("<blank>", "Adult", "Juvenile")) &&
          isTRUE(all.equal(f$valid$ValidPct[2], 500 / 11)) })
check("N58d the footnote's first line by kind: empty cells only; whitespace only; one cell, in the singular",
      { e <- function(x) plines(jfreq(data.frame(S = x, stringsAsFactors = FALSE), S))
        a <- e(c("a", "", "", "b")); w <- e(c("a", " ", "\t", "b")); o <- e(c("a", "", "b"))
        any(a == "<blank>: 2 cells with no text.") &&
          any(w == "<blank>: 2 cells holding only spaces or tabs.") &&
          identical(o[length(o) - 3:1],
                    c("<blank>: 1 cell with no text.",
                      "It is counted as a valid value, not as missing.",
                      "To give it a code or make it missing, use jencode().")) })
check("N58e a text variable with no blank cell: no <blank> row, no footnote, and blank is 0 in the return",
      { r <- NULL
        v <- plines(r <- jfreq(data.frame(S = c("a", "b", NA), stringsAsFactors = FALSE), S))
        !any(grepl("<blank>", v, fixed = TRUE)) && !any(grepl("jencode", v, fixed = TRUE)) &&
          identical(r$frequencies$S$blank, 0L) })
check("N58f a number is never blank: a numeric variable gets no row and no footnote",
      !any(grepl("<blank>", plines(jfreq(b58, Age)), fixed = TRUE)))
check("N58g the footnote is a legend, not a note: it prints at the minimal level too",
      { quiet(joutput("minimal", quiet = TRUE))
        v <- plines(jfreq(b58, Sec)); reset()
        any(v == "<blank>: 7 cells with no text.") })
check("N58h a filter reads the cells as stored: subset = Source != \"\" removes the 2 empty cells, and the footnote names what is left",
      { v <- plines(jfreq(b58, Source, subset = Source != ""))
        any(v == "<blank>     2     22.22   22.22    22.22") &&
          any(v == "<blank>: 2 cells holding only spaces or tabs.") })
check("N58i a labelled string and a factor: the blank row first, labeled the same",
      { e <- b58; e$L <- haven::labelled(e$Sec, labels = c(Yes = "Y")); e$F <- factor(e$Sec)
        vl <- plines(jfreq(e, L)); vf <- plines(jfreq(e, F))
        any(vl == "<blank>    7     58.33   58.33    58.33") &&
          any(vl == "Y: Yes     5     41.67   41.67   100.00") &&
          which(startsWith(vl, "<blank> ")) < which(startsWith(vl, "Y: Yes")) &&
          any(vf == "<blank>    7     58.33   58.33    58.33") &&
          any(vf == "<blank>: 7 cells with no text.") })
check("N58j the Case Processing block is unchanged: a blank is not missing (the N line, no table)",
      identical(n_line(.v58a), "12 Cases in the 1 Variable Pool") && !has_top(.v58a) &&
        { v <- plines(jaov(Age ~ Source, data = b58))
          any(v == "    Auto-listwise         2         10") })
.v58k <- plines(jscreen(b58))
check("N58k jscreen(): the header counts cases with blank text on a line of its own, under the missing count and not in it",
      identical(.v58k[2:6],
                c("  Cases: 12", "  Variables: 3", "  Cases with missing data: 2",
                  "  Cases with blank text: 10", "  Variables with outliers: 0")))
check("N58l ... and the table gains a Blank and a % Blank column, pinned whole",
      identical(.v58k[15:20],
        c("Missing Data & Outliers (outliers > 3 SD from mean)",
          "Variable  Missing  % Missing  Blank  % Blank",
          "--------  -------  ---------  -----  -------",
          "Source        1       8.3        4     33.3",
          "Sec          --        --        7     58.3",
          "Age           1       8.3       --       --")))
check("N58m ... the class and the distinct-value count read the blank cells as one category",
      any(.v58k == "Source    Categorical   3-category         3") &&
        any(.v58k == "Sec       Categorical   dichotomy          2"))
check("N58n jscreen() with no blank text: no line, no columns -- the header and the table as they were",
      { v <- plines(jscreen(b58, Age))
        identical(v[2:5], c("  Cases: 12", "  Variables: 1",
                            "  Cases with missing data: 1",
                            "  Variables with outliers: 0")) &&
          any(v == "Variable  Missing  % Missing") &&
          !any(grepl("Blank", v, fixed = TRUE)) })
check("N58o jscreen() with blank text and nothing missing: the table shows the Blank pair alone",
      { v <- plines(jscreen(b58, Sec))
        any(v == "  Cases with missing data: 0") && any(v == "  Cases with blank text: 7") &&
          any(v == "Variable  Blank  % Blank") && any(v == "Sec         7      58.3") })
check("N58p jscreen()'s return carries Blank and Pct_Blank for every variable, zeros included",
      { r <- NULL; invisible(plines(r <- jscreen(b58)))
        identical(r$Blank, c(4L, 7L, 0L)) && identical(r$Pct_Blank, c(33.3, 58.3, 0)) &&
          identical(r$Missing, c(1L, 0L, 1L)) })
check("N58q <blank> is the first Valid row whatever the other categories are: ahead of \"(none)\", which sorts before \"<\" in every collation",
      { e <- data.frame(Wave = c("(none)", "", "2nd", "(none)", " ", "2nd", NA),
                        stringsAsFactors = FALSE)
        v <- plines(jfreq(e, Wave))
        i <- which(v == "Valid")
        length(i) == 1L &&
          identical(sub("\\s.*$", "", v[i + 1:3]), c("<blank>", "(none)", "2nd")) })
rm(b58, .v58a, .v58k)

# =============================================================================
# LOCKSTEP -- the reference tables and the frames say the same thing
# =============================================================================
# The four data frames ARE the shipped truth; JStats_CPS_Rendering_Reference.txt
# Tables 1-4 are their prose form. These assert the frames' SHAPE so a silent
# row edit cannot pass unnoticed; the reference comparison itself is a
# session-time task, not something a battery can do.

check("N35a visibility frame is Table 1's four rows",
      identical(dim(jstats:::.jst_cps_visibility_rules), c(4L, 4L)))
check("N35b ... and table/n_line are mutually exclusive on every row",
      all(xor(jstats:::.jst_cps_visibility_rules$table,
              jstats:::.jst_cps_visibility_rules$n_line)))
check("N35c layout frame carries the five layouts, the bottom off on jfreq's and jscreen's",
      { f <- jstats:::.jst_cps_layout_rules
        identical(nrow(f), 5L) &&
        identical(f$layout[f$bottom_default == "off"],
                  c("per_var_freq", "screening")) })
check("N35d only the listwise layout is Auto-listwise eligible",
      { f <- jstats:::.jst_cps_layout_rules
        identical(f$layout[f$auto_listwise == "eligible"], "listwise") })
check("N35e N-line frame is Table 4's four rows",
      identical(dim(jstats:::.jst_cps_n_line_rules), c(4L, 3L)))
check(
  paste0("N35f ... and the listwise family is form 'analysis' regardless of\n",
  "      unequal_ns"),
      { f <- jstats:::.jst_cps_n_line_rules
        identical(f$form[f$family == "analysis"], "analysis") })

# =============================================================================
# N59 -- joutput(diagnostics = ): ONE SETTING, APART FROM THE LEVELS (S346,
#        v0.9.219)
# =============================================================================
# Jeff's ruling of 8 October 2026. Diagnostic output is one setting,
# diagnostics: TRUE, FALSE, or the names of the diagnostics wanted, combined
# with c(). It is no part of a level -- "full" does not turn it on, and a
# level call, which clears every other override, leaves it as it was -- so
# its panel line never reads "(override)". The levene setting is gone:
# Levene's test is one of the diagnostics. Here, beside N56, because this
# is the panel; format_check.R X and models_check.R O hold what the setting
# does in the analysis functions.
.ptr59 <- "Run joutput() to see all settings."
.e59   <- function(expr) tryCatch({ quiet(expr); NA_character_ },
                                  error = function(e) conditionMessage(e))
reset()
check("N59a joutput(diagnostics = TRUE) echoes its one line, with no \"(override)\", and stores the setting",
      identical(plines(joutput(diagnostics = TRUE)),
                c("Output Settings", "  diagnostics: ON", .ptr59, "")) &&
        identical(getOption(".jst_output_toggles"), list(diagnostics = TRUE)))
check("N59b names are stored as given and shown in the panel's capitals; FALSE is OFF",
      identical(plines(joutput(diagnostics = c("levene", "vif"))),
                c("Output Settings", "  diagnostics: LEVENE, VIF", .ptr59, "")) &&
        identical(getOption(".jst_output_toggles")$diagnostics, c("levene", "vif")) &&
        identical(plines(joutput(diagnostics = "qq"))[2L], "  diagnostics: QQ") &&
        identical(plines(joutput(diagnostics = FALSE))[2L], "  diagnostics: OFF"))
reset()
check("N59c no level turns it on: the full panel reads OFF at minimal, standard and full",
      all(vapply(c("minimal", "standard", "full"), function(lv) {
        any(plines(joutput(lv)) == "  diagnostics: OFF")
      }, logical(1))))
reset()
quiet(joutput(diagnostics = TRUE, quiet = TRUE)); quiet(joutput(digits = 2, quiet = TRUE))
.v59d <- plines(joutput("full"))
check("N59d a level call clears the other overrides and KEEPS diagnostics: the panel reads ON, digits is back at 3",
      identical(getOption(".jst_output_toggles"), list(diagnostics = TRUE)) &&
        any(.v59d == "  diagnostics: ON") && any(.v59d == "  digits: 3") &&
        !any(grepl("(override)", .v59d, fixed = TRUE)))
check("N59e ... a level call that names it sets it, off as well as on, beside its other settings",
      { a <- plines(joutput("standard", diagnostics = FALSE, digits = 2))
        b <- getOption(".jst_output_toggles")
        d <- plines(joutput("minimal", diagnostics = "vif"))
        any(a == "  diagnostics: OFF") && identical(b, list(diagnostics = FALSE, digits = 2L)) &&
          any(d == "  diagnostics: VIF") &&
          identical(getOption(".jst_output_toggles"), list(diagnostics = "vif")) })
check("N59f joutput(NULL) turns it off with everything else",
      { quiet(joutput(NULL, quiet = TRUE))
        is.null(getOption(".jst_output_toggles")) &&
          identical(plines(joutput("diagnostics")),
                    c("Output Settings", "  diagnostics: OFF", .ptr59, "")) })
reset()
check("N59g a named NULL leaves it as it is and echoes it; a query shows it and changes nothing",
      { quiet(joutput(diagnostics = c("levene", "vif"), quiet = TRUE))
        a <- plines(joutput(diagnostics = NULL))
        b <- plines(joutput("diagnostics"))
        identical(a, c("Output Settings", "  diagnostics: LEVENE, VIF", .ptr59, "")) &&
          identical(a, b) &&
          identical(getOption(".jst_output_toggles")$diagnostics, c("levene", "vif")) })
reset()
check("N59h the panel has no levene line, and \"levene\" is no longer a setting to query (the level error)",
      !any(grepl("levene", plines(joutput()), fixed = TRUE)) &&
        identical(.e59(joutput("levene")),
                  "joutput(): `level` must be \"minimal\", \"standard\", or \"full\"."))
.all59 <- paste0("`diagnostics` must be TRUE, FALSE, or one or more of \"levene\", \"vif\",\n",
                 "\"residuals\", \"qq\", \"scale\", \"cooks\", and \"leverage\".")
check("N59i a name that is no diagnostic stops, pinned whole, and stores nothing; so does a value that is neither TRUE, FALSE nor names",
      identical(.e59(joutput(diagnostics = "qqq")),
                paste0("joutput(): \"qqq\" is not a diagnostic.\n", .all59)) &&
        identical(.e59(joutput(diagnostics = c("vif", "leven"))),
                  paste0("joutput(): \"leven\" is not a diagnostic.\n", .all59)) &&
        identical(.e59(joutput(diagnostics = 1)),
                  paste0("joutput(): `diagnostics` must be TRUE, FALSE, or one or more of\n",
                         "\"levene\", \"vif\", \"residuals\", \"qq\", \"scale\", \"cooks\", and \"leverage\".")) &&
        !is.na(.e59(joutput(diagnostics = NA))) &&
        !is.na(.e59(joutput(diagnostics = character(0)))) &&
        is.null(getOption(".jst_output_toggles")))
check("N59j several names typed into one string get the c() form, built from what was typed -- with +, a comma or a space -- and the line it shows is a call that sets them",
      { want <- function(typed, shown) paste0(
          "joutput(): \"", typed, "\" is not a diagnostic.\n",
          "To ask for more than one, combine them with c():\n",
          "  diagnostics = c(", shown, ")")
        a <- .e59(joutput(diagnostics = "vif + qq"))
        ln <- trimws(strsplit(a, "\n", fixed = TRUE)[[1L]][3L])
        quiet(eval(parse(text = paste0("joutput(", ln, ", quiet = TRUE)"))))
        got <- getOption(".jst_output_toggles")$diagnostics
        reset()
        identical(a, want("vif + qq", "\"vif\", \"qq\"")) &&
          identical(.e59(joutput(diagnostics = "levene, vif")),
                    want("levene, vif", "\"levene\", \"vif\"")) &&
          identical(.e59(joutput(diagnostics = "cooks leverage")),
                    want("cooks leverage", "\"cooks\", \"leverage\"")) &&
          identical(.e59(joutput(diagnostics = c("levene", "vif+qq"))),
                    want("vif+qq", "\"levene\", \"vif\", \"qq\"")) &&
          identical(got, c("vif", "qq")) })
check("N59k ... but a string of pieces that are not all diagnostics is the plain stop",
      identical(.e59(joutput(diagnostics = "vif + plots")),
                paste0("joutput(): \"vif + plots\" is not a diagnostic.\n", .all59)))
reset()
rm(.ptr59, .e59, .v59d, .all59)

# =============================================================================
# N60 -- THE LISTWISE NOTE AND "COMPLETE ON ALL" IN A GROUPED jdesc; A PARTIAL
#        jcomplete(); A PERCENT OF NO CASES (S348, v0.9.221)
# =============================================================================
# Fix Slate 7, first half. (1) A grouped jdesc passed the printer no data, so
# it never stated how many cases were complete on all its variables and the
# listwise-deletion note never fired (the S316 item). It now passes the cases
# that HAVE a group, so the count agrees with the by = row; the grouping
# variable is not counted among the pool's variables. (2) Once the by = row
# has excluded cases, the N line counts "Grouped Cases" (the S316 mv item).
# (3) Under a jcomplete() that covers only some of the analysis variables the
# note was silent (the after-Session-17 item); it fires, naming the variables
# jcomplete() does not cover. (4) A filter that leaves no row printed "NaN"
# for every pool percent; the percent of nothing is "--" (the S346 item).
reset()
quiet(jload("clinic", name = "d60", package = TRUE, overwrite = TRUE, quiet = TRUE))
d60$SocialSupport[1:3] <- NA
.m60 <- jstats:::.jst_apply_declared_udms_as_na(d60)$data
.g60 <- !is.na(.m60$Medication)
.n60 <- "Note: Listwise deletion using jcomplete() first would leave 58 cases."
# .pl60(): plines() for a capture outside check() (guard 3): a call that
# stops gives its error text instead of halting the battery.
.pl60 <- function(expr) tryCatch(plines(expr),
                                 error = function(e) paste0("[error] ", conditionMessage(e)))
.v60a <- .pl60(jdesc(d60, Stress, SocialSupport, by = Medication))
check("N60a a grouped jdesc: the listwise note fires, under the Case Processing block and above the first variable",
      { i <- which(.v60a == .n60)
        length(i) == 1L && grepl("^-+$", .v60a[i - 2L]) &&
          identical(.v60a[i - 1L], "") && identical(.v60a[i + 2L], "Stress") })
check("N60b ... its count is taken among the cases with a group -- 58, where the whole pool's would be 63",
      sum(stats::complete.cases(.m60[.g60, c("Stress", "SocialSupport")])) == 58L &&
        sum(stats::complete.cases(.m60[, c("Stress", "SocialSupport")])) == 63L)
quiet(joutput("minimal", quiet = TRUE))
.v60c <- .pl60(jdesc(d60, Stress, SocialSupport, by = Medication))
.v60d <- .pl60(jdesc(d60, Stress, by = Medication))
.v60e <- .pl60(jdesc(d60, Stress, Flourishing, by = Condition))
reset()
check("N60c at minimal: the grouped count, \"Grouped Cases\", and the complete-on-all count among them, with the rider",
      identical(n_line(.v60c),
                "65 Grouped Cases in the 2 Variable Pool; 58 Complete on All (5 Excluded)"))
check("N60d ... and no listwise note at minimal",
      !any(startsWith(.v60c, "Note: Listwise")))
check("N60e one described variable: no complete-on-all count (the grouping variable is not one of the pool's)",
      identical(n_line(.v60d), "65 Grouped Cases in the 1 Variable Pool (5 Excluded)"))
check("N60f a grouping variable that excludes no case: the plain \"Cases\", with the complete-on-all count",
      identical(n_line(.v60e), "70 Cases in the 2 Variable Pool; 66 Complete on All"))
check("N60g the ungrouped call is as it was: the N line and the note",
      { v <- plines(jdesc(d60, Stress, SocialSupport))
        identical(n_line(v), "70 Cases in the 2 Variable Pool; 63 Complete on All") &&
          any(v == "Note: Listwise deletion using jcomplete() first would leave 63 cases.") })
quiet(jcomplete(d60, Anxiety1))
.v60h <- .pl60(jdesc(d60, Stress, SocialSupport))
.v60i <- .pl60(jfreq(d60, Stress, SocialSupport))
.v60j <- .pl60(jdesc(d60, Stress, SocialSupport, Anxiety1))
quiet(jcomplete(d60, Stress, SocialSupport))
.v60k <- .pl60(jdesc(d60, Stress, SocialSupport))
reset()
.p60 <- paste("Note: jcomplete() is not set on Stress and SocialSupport.",
              "Listwise deletion across all of these variables would leave 63 cases.")
check("N60h a jcomplete() on another variable: the note fires, naming the variables it does not cover, and the count",
      { i <- which(startsWith(.v60h, "Note: jcomplete()"))
        length(i) == 1L &&
          identical(paste(.v60h[i:(i + 1L)], collapse = " "), .p60) &&
          identical(.v60h[i + 2L], "") })
check("N60i ... in jfreq() too",
      { i <- which(startsWith(.v60i, "Note: jcomplete()"))
        length(i) == 1L && identical(paste(.v60i[i:(i + 1L)], collapse = " "), .p60) })
check("N60j ... a covered variable among the analysis variables is not named",
      { i <- which(startsWith(.v60j, "Note: jcomplete()"))
        length(i) == 1L && grepl("not set on Stress and SocialSupport\\.", .v60j[i]) })
check("N60k control: a jcomplete() covering every analysis variable leaves nothing to say",
      !any(grepl("^Note: (jcomplete|Listwise)", .v60k)))
.e60 <- data.frame(x = c(1:5, 200), y = c(1, NA, 3, 4, 5, 6), g = c(1, 2, 1, 2, NA, 1))
.v60l <- plines(tryCatch(jt(y ~ g, .e60, subset = x > 1000), error = function(e) NULL))
.v60m <- .pl60(jcorr(.e60, x, y, subset = x > 1000))
check("N60l a filter that leaves no row: each pool percent is \"--\", and NaN prints nowhere",
      any(.v60l == "      Missing     1    16.7      1        0      --") &&
        !any(grepl("NaN", .v60l)) && !any(grepl("NaN", .v60m)) &&
        any(.v60m == "      Missing     1    16.7      1        0      --"))
check("N60m control: a filter that leaves rows prints its pool percents as numbers",
      { v <- plines(jt(y ~ g, .e60, subset = x < 100))
        any(grepl("^      Missing +1 +16\\.7 +0 +1 +20\\.0$", v)) })
rm(d60, .m60, .g60, .n60, .v60a, .v60c, .v60d, .v60e, .v60h, .v60i, .v60j,
   .v60k, .p60, .pl60, .e60, .v60l, .v60m)

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
  rm(list = setdiff(ls(globalenv(), all.names = TRUE),
                    c(.entry_names, ".results")), envir = globalenv())
} else {
  cat("\nRESULT: FAIL (", .n_ok, "/", .n, " passed)\n", sep = "")
  for (r in .results) if (!r$ok) cat("  failed: ", r$desc, "\n", sep = "")
  stop("assertion battery failed", call. = FALSE)
}
