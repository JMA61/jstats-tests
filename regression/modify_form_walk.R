# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# modify_form_walk.R -- human-visual walkthrough
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# TYPE:     visual walkthrough (Expected comments; written for Jeff's checking)
# PENDING:  none
# LOCKS:    every runtime message that SUGGESTS a data-changing call teaches
#           modify = TRUE, not the assignment form; the two REPORT sites (the
#           durability note, the jai orientation body) still show both forms.
#           Since S351 also the other LOAD AND SAVE messages (instructions
#           Section 6 [BUILD-TESTING]: this is the walk that owns them):
#           jload()'s and jsave()'s front doors, a path typed with single
#           backslashes, the routes offered a frame holding a text variable
#           with declared missing values, jsave()'s note on a text
#           variable's missing cells (ruling R13), and the layout of
#           jload()'s Loaded line among its notes (ruling R6).
#           Since S352 also jsave() given an expression as the data
#           (Section 19). Since S359 the Excel and CSV note naming what the
#           frame had to lose, with the call to run (Sections 15, 16, 20).
#           Since S362 the import surface: the names jload() changes, skip
#           = and the title note, a CSV file's shape and encoding, sheet =
#           and a reader's own error, and jsave()'s names, labels, Excel
#           size and .xpt dataset name (Sections 23-26). Since S365 a file
#           with no names row and jload(header =), the rows and columns
#           that may not be data, and the lines jload() offers keeping the
#           call (Sections 27-29). Since S367 jload()'s warnings on an
#           argument the format does not use (Section 30). Since S380 what
#           a CSV cell is read as, the note on a few cells that are not
#           numbers, and jload(text =, na =) (Sections 32-33; ruling R31).
#           Since S381 a sheet's number stored as text in that note,
#           with base R's lines, and the label line under every
#           as.numeric() line jload() offers (Section 34).
#           Since S384 the label line under jsave()'s as.character()
#           and as.POSIXct() lines (Section 35).
#           Since S386 jsave()'s stop on data given as an expression with
#           two or more things to fix: the line that makes mydata once,
#           under the header, and the closing save on mydata (Section 36).
#           Since S387 every line of that stop runs where it sits, the
#           lines taken top to bottom, whatever the data given (Section
#           37; ruling R33).
#           Since S388 the Stata route of jsave()'s too-many-codes stop,
#           and the note after a save that writes an undeclared code, run
#           as printed (Section 38).
#           Since S389 a sheet's blank cells read as a CSV file's, jt()'s
#           stop naming <blank> among its categories, and jsave()'s note
#           on a text variable's missing cells naming Excel format (.xlsx)
#           (Section 39; ruling R34); and jsave()'s example save carrying
#           clean.names = TRUE (Section 40).
# ORIGIN:   S229
# EDITED:   S389 (v0.9.262; Fix Slate 28 and ruling R34). SECTIONS 39 AND
#           40 ADDED, every Expected block filled by running (fill.R, under
#           a Windows-length temp folder, so that the Saved lines, which
#           name the walk folder, are laid out as on the workstation; the
#           folder shown as <walk folder>). Section 39, ruling R34 (Jeff,
#           S389: "Let's go with your recommendation on the excel issue."):
#           a sheet's text variable read as a CSV file's -- its blank cells
#           the <blank> category, counted valid, a variable of numbers
#           stored as text keeping them missing; jt() on a variable whose
#           third category is <blank> naming the categories, with the
#           declaration that leaves the blank cells out (Claude's call,
#           lean L1), run as printed; jsave()'s note naming Excel format
#           (.xlsx), and the sheet read back. Section 40, the (S388) item
#           (Claude's call): jsave()'s example save carries clean.names =
#           TRUE when the data frame holds a name the format refuses, and
#           runs as printed. Both on the PENDING line. SECTION 16 RE-PINNED
#           MECHANICALLY under ruling R34 (the Build Procedure's
#           [BUILD-TESTING], Jeff, S345): its five notes' last line names R
#           format (.rds) alone, each checked against a capture of the
#           section on the build; its "Things to look at" says one format
#           keeps them; kept off the PENDING line. The assertion side is
#           import_check.R AA01-AA07, models_check.R AD01-AD05 and
#           missing_convention_check.R N86aa-N86ae and N86bh. A capture of
#           every section of every walk on 0.9.261 and the build (345
#           sections): Sections 16, 39 and 40 here differ, with
#           jencode_walk.R Section 11 and missing_convention_walk.R Section
#           20; every other section identical (temp paths aside). harness.R
#           derive: the five NEEDS lines as they were, none for 39 or 40;
#           verify, under a Windows-length temp folder: 40 of 40 sections in
#           three orders and by prepare = TRUE; 158 of 159 Expected blocks
#           found (Section 9's, as before).
# LAST VERIFIED: v0.9.262, 2026-10-22 (S389) -- Sections 39 and 40 WALKED
#           on the WORKSTATION by Jeff through receive_all() ("walked, all
#           okay"). PENDING back to none; R CMD check 0 errors, 0 warnings,
#           0 notes; ALL BATTERIES GREEN (10 run, 3203 checks).
# EDITED:   S388 (v0.9.261; Fix Slate 27, both items Claude's calls).
#           SECTION 38 ADDED, every Expected block filled by running
#           (fill.R, under a Windows-length temp folder, so that the note's
#           save line and the Saved line, which name the walk folder, are
#           laid out as on the workstation; the folder shown as <walk
#           folder>): the too-many-codes stop's Stata route carries
#           clean.names = TRUE when Stata refuses a name the data frame
#           holds; the note after a save that writes an undeclared code
#           names the data frame's variable after clean.names = TRUE, keeps
#           clean.names = TRUE, names mydata after the line that makes it
#           when the data are an expression, and puts a name R reads only
#           in backticks in them. On the PENDING line. The assertion side is
#           import_check.R Y24-Y31.
#           A capture of every section of every walk on 0.9.260 and the
#           build (343 sections): only this file's Section 38 differs, in
#           the lines the build changed; every other section identical (temp
#           paths aside). harness.R derive: the five NEEDS lines as they
#           were, none for 38; verify: 38 of 38 sections in three orders and
#           by prepare = TRUE; 149 of 150 Expected blocks found (Section
#           9's, as before).
# LAST VERIFIED: v0.9.261, 2026-10-22 (S388) -- Section 38 WALKED on the
#           WORKSTATION by Jeff through receive_all() ("walked, all okay").
#           PENDING back to none; R CMD check 0 errors, 0 warnings, 0 notes;
#           ALL BATTERIES GREEN (10 run, 3181 checks).
# EDITED:   S387 (v0.9.260; the (S386) part-[1] item, ruled S387 as ruling
#           R33). SECTION 37 ADDED, every Expected block filled by running
#           (fill.R; "#@SKIP" after the jsave() call whose Saved line
#           names a temporary folder): in a stop with two or more things
#           to fix, the names part offers no save of its own and points to
#           the save at the end; a name or a place whose stop has a names
#           part closes on the save that works, clean.names = TRUE; the
#           plain-NA route carries clean.names = TRUE. On the PENDING line;
#           the sentence in part [1] is Claude's call. SECTION 36'S RENDER
#           1 RE-PINNED MECHANICALLY under ruling R33 (the Build
#           Procedure's [BUILD-TESTING], Jeff, S345), filled by running; kept
#           off the PENDING line. The assertion side is import_check.R
#           Y16-Y23. A capture of every section of every walk on 0.9.259
#           and the build: only this file's Section 36 moved (Render 1's
#           part [1]), every other section identical (temp paths aside).
#           harness.R derive: the five NEEDS lines as they were, none for
#           37; verify: 37 of 37 sections in three orders and by prepare =
#           TRUE; 143 of 144 Expected blocks found (Section 9's, as before).
# LAST VERIFIED: v0.9.260, 2026-10-22 (S387) -- Section 37 WALKED on the
#           WORKSTATION by Jeff through receive_all() ("walked, all okay").
#           PENDING back to none; R CMD check 0 errors, 0 warnings, 0 notes;
#           ALL BATTERIES GREEN (10 run, 3173 checks).
# EDITED:   S386 (v0.9.259; the twin build's fifth stage, the (S384) item
#           as ruled at S386). SECTION 36 ADDED, every Expected block
#           filled by running (fill.R; "#@SKIP" after the jsave() call whose
#           Saved line names a temporary folder): given an expression and
#           two or more things to fix, the line that makes mydata comes
#           once, under the header, every part and each route of a part
#           building on it, and the closing line is the save on mydata,
#           clean.names = TRUE where a part names variables the format
#           refuses; a name keeps its form. On the PENDING line. The
#           sentence above the line names the data frame the copy is made
#           from (Jeff's wording at the walk, S386: "The fixes shown below
#           work on a copy of your x36 data frame."; "your data" when the
#           expression names none), and Section 36 was filled again with
#           it. SECTION 19'S RENDER 2 RE-PINNED MECHANICALLY under the S386
#           ruling (the Build Procedure's [BUILD-TESTING], Jeff, S345),
#           filled by running, and its first note rewritten to say which
#           blocks open on their own line; kept off the PENDING line. The
#           assertion side is import_check.R Y11-Y15.
# LAST VERIFIED: v0.9.259, 2026-10-21 (S386) -- Section 36 WALKED on the
#           WORKSTATION by Jeff through receive_all() ("walked, all okay")
#           on the build's second receive; his walk on the first asked for
#           the sentence above the line to be reworded (the entry above).
#           PENDING back to none; R CMD check 0 errors, 0 warnings, 0 notes;
#           ALL BATTERIES GREEN (10 run, 3165 checks).
# EDITED:   S384 (v0.9.258; Fix Slate 26). SECTION 35 ADDED, every
#           Expected block filled by running (fill.R; "#@SKIP" after the
#           two jsave() calls whose Saved line names a temporary folder):
#           jsave()'s as.character() line for a factor with a category
#           over 120 characters (.sav) and its as.POSIXct() line for a
#           POSIXlt column are each followed, where the variable has a
#           label, by the line that puts it back; a variable with no label
#           gets none. On the PENDING line; the sentences are unchanged and
#           the label line is Claude's call. The assertion side is
#           import_check.R section Y. A capture of every section of every
#           walk on 0.9.257 and the build: only this file's Section 35 is
#           new, every other section identical (temp paths aside).
#           harness.R derive: the five NEEDS lines as they were, none for
#           35; verify: 35 of 35 sections in three orders and by prepare =
#           TRUE; 136 of 137 Expected blocks found (Section 9's, as before).
# LAST VERIFIED: v0.9.258, 2026-10-21 (S384) -- Section 35 WALKED on the
#           WORKSTATION by Jeff through receive_all() ("walked, all okay");
#           PENDING back to none; R CMD check 0 errors, 0 warnings, 0 notes;
#           ALL BATTERIES GREEN (10 run, 3151 checks).
# EDITED:   S382 (v0.9.256; Fix Slate 25). SECTION 33'S RENDER 2
#           RE-PINNED, one line: the listwise note without "first" ("Note:
#           Listwise deletion using jcomplete() would leave 6 cases."), the
#           wording Jeff asked for on his S381 walk of this section ("the
#           word "first" here seems awkward and unnecessary"), its sentence
#           now in one place (.jst_listwise_note), and a "Things to look at"
#           bullet for it. On the PENDING line: the one section walked for
#           the note. The other blocks that print it were re-pinned
#           mechanically and kept off their walks' PENDING lines: cps_walk.R
#           A2, B7, C2, F4 and L1, and format_walk.R 20. A capture of every
#           section of every walk on 0.9.255 and the new build named those
#           seven and nothing else (temp paths aside). The assertion side is
#           cps_check.R N60a, N60g and N63. harness.R derive: the five NEEDS
#           lines as they were; verify: 34 of 34 sections in three orders and
#           by prepare = TRUE; 130 of 131 Expected blocks found (Section 9's,
#           as before).
# LAST VERIFIED: v0.9.256, 2026-10-21 (S382) -- Section 33 WALKED on the
#           WORKSTATION by Jeff through receive_all() ("walked, all okay");
#           PENDING back to none; R CMD check 0 errors, 0 warnings, 0 notes;
#           ALL BATTERIES GREEN (10 run, 3141 checks).
# EDITED:   S381 (v0.9.255; Fix Slate 24). SECTION 33'S RENDER 3
#           RE-PINNED and SECTION 34 ADDED, every new Expected block
#           filled by running (fill.R): a sheet's variable of number
#           cells beside a number stored as text is in the note on a
#           few cells, with base R's lines (its cells made missing,
#           then as.numeric()) in place of a reload, and the scan no
#           longer offers it a declaration; every as.numeric() line
#           puts back the label jload() gave a renamed variable.
#           Section 34 copies the new datasets/import_stored.xlsx and
#           import_stored2.xlsx into the walk's folder before loading
#           them. Both on the PENDING line; the wording is Claude's.
#           The assertion side is import_check.R X14 and X23-X28. No other
#           section moved (harness.R dump of every section of every walk on
#           0.9.254 and 0.9.255: only this file's 33 and 34 differed).
#           harness.R derive: the five NEEDS lines as they were, none for
#           33 or 34; verify: 34 of 34 sections in three orders and by
#           prepare = TRUE; 130 of 131 Expected blocks found (Section 9's,
#           as before).
# LAST VERIFIED: v0.9.255, 2026-10-20 (S381) -- Sections 33 and 34 WALKED
#           on the WORKSTATION by Jeff through receive_all() ("walked, all
#           okay"); PENDING back to none; R CMD check 0 errors, 0 warnings,
#           0 notes; ALL BATTERIES GREEN (10 run, 3130 checks).
# EDITED:   S380 (v0.9.254; ruling R31). SECTIONS 32 AND 33 ADDED, every
#           Expected block filled by running (fill.R; "#@SKIP" after the
#           data frame and the jsave() of Section 32's Render 5, whose
#           Saved line names a temporary folder). Section 33 copies the
#           new datasets/import_markers.xlsx into the walk's folder before
#           loading it, so the line its note offers names no folder (the
#           S368 trap). On the PENDING line; the wording of every note is
#           Claude's. The assertion side is import_check.R section X.
#           harness.R derive: the five NEEDS lines as they were, none for
#           32 or 33; verify: 33 of 33 sections in three orders and by
#           prepare = TRUE; 126 of 127 Expected blocks found (Section 9's,
#           as before). A capture of every section of every walk on
#           0.9.253 and 0.9.254: only 32 and 33 differ (and the end of
#           31's capture, a blank line, as the file now goes on).
# LAST VERIFIED: v0.9.254, 2026-10-20 (S380) -- Sections 32 and 33 WALKED
#           on the WORKSTATION by Jeff through receive_all() ("walked, all
#           okay"); PENDING back to none; R CMD check 0 errors, 0 warnings,
#           0 notes; ALL BATTERIES GREEN (10 run, 3124 checks).
# EDITED:   S374 (v0.9.247; Fix Slate 21). SECTION 13 RE-PINNED AND
#           EXTENDED: "Provide a name, for example:" (the audit's layout
#           item retired the last inline "e.g."); x13.RData is made before
#           it is asked for, since jload() now looks for an .RData file
#           first, as for every other format; and one new block, filled by
#           running (fill.R, "#@SKIP" ahead of it), an .RData file that does
#           not exist: the file-not-found stop, where it was offered a
#           load() line that failed. On the PENDING line. A capture of every
#           section of every walk on 0.9.246 and 0.9.247: here only Section
#           13 moved. harness.R verify: 109 of 110 Expected blocks found
#           (Section 9's, as before), 30 of 30 sections in three orders and
#           by prepare = TRUE. The assertion side is import_check.R T01 and
#           missing_convention_check.R N86m-N86m3.
# LAST VERIFIED: v0.9.247, 2026-10-19 (S374) -- Section 13 WALKED on the
#           WORKSTATION by Jeff through receive_all() ("walked, all okay");
#           PENDING back to none; R CMD check 0 errors, 0 warnings, 0 notes;
#           ALL BATTERIES GREEN (10 run, 3016 checks).
# EDITED:   S373 (v0.9.246; Slate E5, ruling R27). SECTION 16 RE-PINNED by
#           hand from the capture: the blank footnote under both read-back
#           tables names both routes, a line each -- jencode() to give the
#           cells a code, jdeclare_missing() with codes = "" to declare them
#           missing. On the PENDING line (the wording is Claude's). A capture
#           of every section on 0.9.245 and the build moves only 16 here
#           (its other differences are temporary paths).
# EDITED:   S372 (v0.9.245; Fix Slate 20). SECTION 9's prose Expected
#           rewritten by hand, its second show() title with it: codes that
#           mix a marker and a number on spss_df's SPSS-declared Income now
#           get the single-marker stop's advice, not the two-line split
#           (both its lines stopped when run), and that advice's line names
#           every code Income declares (it named -99 alone, which run
#           dropped -98). On the PENDING line. A capture of every section on
#           0.9.244 and 0.9.245 moves Section 9 here and, in a temporary
#           path alone, 6, 7, 15, 16, 20, 21, 25 and 26. The assertion side
#           is missing_convention_check.R N95l and N95n.
# EDITED:   S370 (v0.9.243; Fix Slate 18). SECTION 12 RE-PINNED from the
#           captures of every section on 0.9.242 and 0.9.243 (repin.py):
#           jdeclare_missing() given a data frame and no variables says
#           "no variables specified." and gives a line on community on a
#           line of its own, where its example sat inside a sentence and
#           named MyData beside invented variables; the vars = names() line
#           as it was (Claude's wording, Fix Slate 18's second lean); the
#           prose above the block and its "Things to look at" line updated.
#           No other section moved (temporary paths aside). On the PENDING
#           line. The assertion side is filter_check.R AF07 and
#           missing_convention_check.R N81ai and N81aj (re-pinned); the
#           stop's render beside its siblings is filter_walk.R G8. harness.R
#           derive: the five NEEDS lines as they were; verify: 30 of 30
#           sections in three orders and by prepare = TRUE; 108 of 109
#           Expected blocks found (Section 9's, as before), with the
#           dataset path replaced by an absolute one, as since S368 (run
#           first without it, 106: Section 28's two Loaded lines, the
#           S368 trap, on 0.9.242 as on 0.9.243).
# EDITED:   S369 (v0.9.241; Fix Slate 16). SECTION 13 EXTENDED, two
#           blocks filled by running (fill.R, "#@SKIP" ahead of the first):
#           jload("") and jload() given a data frame as an expression give
#           "Provide a filename, for example:" and the call on a line of its
#           own; jsave() with a default set, the data omitted and a second
#           argument unnamed, one sentence a line and "Name them, for
#           example:" above the call (Claude's call, Fix Slate 16's item 3).
#           On the PENDING line. No other section moved (harness.R dump of
#           every section of every walk on 0.9.240 and 0.9.241: none
#           differed). The assertion side is missing_convention_check.R N86f
#           and N86bg (re-pinned) and filter_check.R AD01. harness.R derive:
#           the five NEEDS lines as they were; verify: 30 of 30 sections in
#           three orders and by prepare = TRUE; 108 of 109 Expected blocks
#           found (Section 9's, as before).
# EDITED:   S368 (v0.9.240; Fix Slate 15). SECTION 13 RE-PINNED AND
#           EXTENDED, filled by running (fill.R): jsave() given a vector, or
#           a name found nowhere, gives "Provide a data frame, for example:"
#           and the call on a line of its own (Rules E and L, Claude's
#           call), naming the one data frame in the workspace -- MyData
#           here, d13 in .ws13, which now holds z13 as well -- the not-found
#           stop keeping the file the call named; a file name without its
#           quotes, ruling R18's pointer, as jload()'s; no file name, the
#           example under its sentence; jsave() with nothing and no default,
#           both routes with the example file (MyData; d13 in .ws13); and a
#           file that exists where the session cannot ask -- .ws13b, whose
#           jsave() sees interactive() FALSE, the walk folder shown as
#           <walk folder> -- one sentence a line, the path on a line of its
#           own. On the PENDING line. No other section moved (harness.R dump
#           of every section of every walk on 0.9.239 and 0.9.240: only this
#           file's Section 13 differed). The assertion side is
#           import_check.R section V and missing_convention_check.R N86i
#           (re-pinned). harness.R derive: the five NEEDS lines as they
#           were; verify: 30 of 30 sections in three orders and by prepare =
#           TRUE; 106 of 107 Expected blocks found (Section 9's, as before).
# EDITED:   S367 (v0.9.239; Fix Slate 14). SECTION 13 RE-PINNED AND
#           EXTENDED, filled by running (fill.R): jsave() given a file name
#           alone with no default set offers both routes, as the analysis
#           functions' stop does (the lean okayed at S366); a new block runs
#           it in .ws13, a stand-in workspace holding one data frame, which
#           the stop names, and for jsave(file =) and a call with overwrite
#           = TRUE (Claude's call: the same stop, the call's arguments
#           kept). NEW SECTION 30, filled by running: jload()'s sheet = and
#           skip = warnings one sentence a line (Rule E, Claude's call), and
#           a jstats example dataset named as one where each had said
#           "this . file". Both on the PENDING line. Setup gains warn = 1
#           (rule 4: Section 30's beat is a warning), restored at the foot;
#           no other section warns. No other section moved (harness.R dump
#           of every section of every walk on 0.9.238 and 0.9.239: only
#           this file's Section 13 differed). jsave()'s overwrite question
#           after the checks that can stop a save changes no layout here --
#           a stop where a session that asks had asked first; it is
#           import_check.R section U's, on a copy of jsave() run as at the
#           console. The assertion side is section U and
#           missing_convention_check.R N86g (re-pinned). harness.R derive:
#           the five NEEDS lines as they were; verify: 30 of 30 sections in
#           three orders and by prepare = TRUE; 103 of 104 Expected blocks
#           found (Section 9's, as before).
# EDITED:   S366 (v0.9.238; Fix Slate 13). SECTIONS 13 AND 29 RE-PINNED
#           from captures of every section on 0.9.237 and 0.9.238
#           (repin.py): 13, the leading-digit stop's offered name, the
#           cleaner's (X2024zz13, X2b) where the digits had been stripped
#           (zz13, b) -- the lean okayed at the S365 closeout; 29, the
#           multi-sheet note one sentence a line (Rule E, Claude's call).
#           Both on the PENDING line. No other section moved (Section 10's
#           orientation stamp names the build's version, pinned nowhere).
#           The overwrite question's new place, after the checks that can
#           stop a load, changes no layout here -- a stop where a session
#           that asks had asked first; it is import_check.R section T's,
#           on a copy of jload() run as at the console. The assertion side
#           is section T and missing_convention_check.R N86j (re-pinned).
#           harness.R verify: 29 of 29 sections in three orders and by
#           prepare = TRUE; 100 of 101 Expected blocks found (Section 9's,
#           as before).
# EDITED:   S365 (v0.9.237; Fix Slate 12, the import audit's items 14 and
#           17, with ruling R21). NEW SECTIONS 27-29, filled by running
#           (fill.R): 27, jload(header =) -- the note on names that are all
#           numbers, from a CSV file and a sheet, its header = FALSE call
#           run, header = TRUE written out, the stop on a format that
#           carries its own names, and a long line under header = FALSE; 28,
#           the note on rows and columns that may not be data -- the
#           audit's sheet (datasets/import_blank_rows.xlsx), a CSV file's
#           line of commas, footnotes, trailing comma and write.csv() row
#           numbers, a sheet whose data start in B3
#           (datasets/import_offset.xlsx), and a one-column file left
#           alone; 29, the lines jload() offers keeping the call -- the
#           multi-sheet note's folder, the sheet stop's skip = and header =
#           FALSE. All three on the PENDING line: new design and wording,
#           Claude's call (instructions Section 15 [SLATE-BUILDS]). Section
#           28 reads the two fixtures from the test-data folder. No earlier
#           section moved (harness.R dump of every section on 0.9.236 and
#           0.9.237, temporary paths aside). The assertion side is
#           import_check.R section S.
# EDITED:   S362 (v0.9.235; ruling R9 with ruling R20 and the import
#           audit's findings). NEW SECTIONS 23-26, filled by running
#           (fill.R), the Saved lines of Section 26 left out (a temporary
#           folder): 23, the names jload() changes from an Excel file, a
#           CSV file, an SPSS file, none from an .rds file, and the data
#           frame's own name; 24, skip = and the title note, the CSV
#           file's stop with the same call; 25, the CSV shapes that loaded
#           wrong without a word, the Windows-1252 note, sheet = and a
#           reader's own error; 26, jsave()'s refused names in each
#           format, clean.names = TRUE, the label notes, Excel's sheet size
#           and the .xpt dataset's name. All four on the PENDING line: new
#           design and wording, Claude's call (instructions Section 15
#           [SLATE-BUILDS]). No earlier section moved (harness.R dump of
#           every section on 0.9.234 and 0.9.235). The assertion side is
#           the new import_check.R.
# EDITED:   S359 (v0.9.232; Fix Slate 10, jsave()'s Excel and CSV note,
#           Jeff's lean okayed at S357: the labels line only when there are
#           labels to lose). SECTIONS 15, 16 AND 20 RE-PINNED by hand from
#           captures of every section on 0.9.231 and 0.9.232: the labels
#           line gone from a frame with none (Section 16's fc16), the
#           variables whose cells hold a declared code named with the codes,
#           and the call to run in place of "jsave(..., preserve.declarations
#           = FALSE)". That call names the file's full path, a temporary
#           folder, so each Expected stops above it, as the Saved lines are
#           left out. All three on the PENDING line: wording Claude drafted.
#           harness.R verify: 20 of 20 sections in three orders and by
#           prepare = TRUE; 56 of 57 Expected blocks found (Section 9's
#           summary, as before). The assertion side is
#           missing_convention_check.R N93a-j.
# EDITED:   S357 (v0.9.230; Fix Slate W2, the load, save and jai()
#           wording). NEW SECTION 20, filled by running (fill.R): "R
#           format" for .rds in the Loaded line and the format list, the
#           shipped dataset's Loaded line without its period, Case 4's note
#           of one variable ("this variable is"), the .RData redirect in one
#           voice typed or bare, jsave()'s CSV note in each branch, jai()'s
#           declined writes run with the question stubbed, and SKILL.md's
#           AI-assistant paragraph beside AGENTS.md's. Sections re-pinned
#           from captures of every section on 0.9.229 and 0.9.230
#           (repin.py): 3 (Case 6 opens on "the clinic data frame", Rule
#           T), 13 (the .RData redirect), 15 (Case 6; the CSV note's
#           "missing values"), 17 (the shipped dataset's Loaded line) -- on
#           the PENDING line, wording Claude chose. RE-PINNED MECHANICALLY,
#           NOT ON THE PENDING LINE: Sections 1, 2, 4, 5 and 18 move only
#           "R native format" to "R format" (Jeff, S357: "Rename to R
#           format"; the re-pin taken as mechanical by default, his
#           sub-question unanswered, Section 20 Render 1 the block that
#           shows it), and Section 10 only its version stamp, v3.8, whose
#           prose pin moved with it. harness.R survey: 0 of 20 sections
#           differ isolated from the straight run, so no NEEDS line; 55 of
#           56 Expected blocks found (Section 9's, as before).
# EDITED:   S355 (v0.9.228; Fix Slate W1, the missing-value messages
#           reworded). SECTIONS 4, 6, 9 AND 12 RE-PINNED from captures of
#           every section on 0.9.227 and 0.9.228 (repin.py): the load
#           scan's label-only row in the bracketed form, -99 ["Refused"]
#           (4); the jsave() refusals' verb, "carries" (6); finding 3, no
#           jconvert() internals in the SPSS-column refusal (9); "every
#           variable" and "use vars = names(...)" (12). All four on the
#           PENDING line: wording, Claude's call. harness.R verify: 19 of
#           19 sections in three orders and by prepare = TRUE; 42 of 43
#           Expected blocks found (Section 9's, as before).
# EDITED:   S354 (v0.9.227; Fix Slate H, with the S243 call-form item).
#           SECTIONS 8 AND 15 RE-PINNED: the printed jconvert() lines put
#           vars = before to =, the teaching form -- Section 15's five
#           from captures of every section on 0.9.226 and 0.9.227
#           (repin.py), Section 8's over-cap line, a hand-written pin
#           under "Expected, second render", by hand from the same
#           capture. One line each, no break moved. Both on the PENDING
#           line: the order is Claude's call, not a ruling.
# EDITED:   S353 (v0.9.226; Fix Slate 9, the second half). SECTION 5
#           RE-PINNED MECHANICALLY under ruling R5 (the layout of a long
#           printed call; walked once, in missing_convention_walk.R
#           Section 64), so PENDING stays none: the load scan's labelled
#           declaration, 77 characters, breaks before modify = TRUE. The
#           scan's lines now go through the stdout emitter, where they had
#           been printed with cat() and ran on whole. Section 9's long
#           jdeclare_missing() lines break too; its pins describe them, so
#           they did not move. harness.R verify: 42 of 43 Expected blocks
#           found (Section 9's, as before), 19 of 19 sections.
# EDITED:   S352 (v0.9.225; Fix Slate 9, the first half). SECTIONS 4 AND 5
#           RE-PINNED; SECTION 19 ADDED. Every changed Expected FILLED BY
#           RUNNING the file (fill.R).
#           Sections 4 and 5: with no convention selected -- this walk's
#           state -- the load scan's declare line stopped at the
#           choose-first gate; the menu now comes first (ruling R15). Each
#           pin had quoted one line, Section 5's in its pre-S267 commented
#           form; each is now the call's whole output.
#           Section 19: jsave()'s refusals given an expression as the data
#           (the S351 item) -- each block of lines opens on
#           "mydata <- ...".
#           harness.R derive: 42 of 43 Expected blocks found (Section 9's,
#           as before); Section 19 needs no other, every NEEDS line as it
#           was.
# EDITED:   S351 (v0.9.224; Fix Slate 6; WALKED on the workstation the same session).
#           SIX NEW SECTIONS, 13-18, every Expected filled by running the
#           file (fill.R; the Saved lines, which name a temporary folder,
#           then taken out of the pins by script): 13 the front doors of
#           jload() and jsave(); 14 a path typed with single backslashes;
#           15 a frame holding a text variable with declared missing
#           values (the load narrative's Cases 4, 7 and 6, jsave()'s .dta
#           and .sav refusals, the CSV note); 16 a text variable's missing
#           cells across a save (ruling R13) and a CSV file of one column;
#           17 the Loaded line and the notes around it, THE ONE SECTION
#           WALKED FOR RULING R6 (missing_convention_walk.R Sections 4, 6, 8
#           and 51 re-pinned mechanically under it); 18 Case 7's count past
#           three names. Sections 1-3 show R6's blank line under their
#           Loaded lines; none of their pins holds that line, so nothing
#           there moved. harness.R derive: no new section needs another,
#           every NEEDS line as it was; 38 of 39 Expected blocks found in
#           the capture (Section 9's, as before).
#           WALK: Sections 13-18 -- WALKED, see LAST VERIFIED below.
# EXPECTED REVISED: S230 (v0.9.126) -- Sections 2/3/6 Expecteds brought to
#           the S230 message surface (Rule L remedy blocks; Rule E splits
#           in the minimal refusals). PENDING the next actual walk; the
#           LAST VERIFIED line below records runs, not edits.
#           DISCHARGED S259: read end to end at S255 (all ten sections
#           green) and captured against live output at S258, where the
#           only stale block was Section 1's -- Sections 2, 3 and 6
#           matched, so these Expecteds are confirmed.
# EDITED:   S339 (v0.9.213; WALKED on the workstation the same session). Fix
#           Slate 2. TWO NEW SECTIONS, no existing Expected moved (a capture
#           of every section on the 0.9.212 and 0.9.213 builds is the same
#           line for line). Section 11: the durability note on a call with
#           many variables -- vars = as typed, every name when there are
#           three or fewer, otherwise none (the S298 item). Section 12: the
#           data given as an expression or as a place, in jdeclare_missing()
#           and jconvert(), and the no-variables refusal (the S219 item,
#           findings 2 and 5). Every Expected filled from a run of the file.
#           WALK: Sections 11 and 12.
# EDITED:   S319, second build (v0.9.196 PENDING; NOT yet walked on the
#           workstation). SECTION 8's first render RE-PINNED again, to
#           jconvert's long-form report (one row per marker, the range row
#           last), from a whole-file capture diff of the 0.9.195 and
#           0.9.196 masters: the report lines, and nothing else, changed.
# EDITED:   S319 (v0.9.195 PENDING; NOT yet walked on the workstation).
#           SECTION 8 RE-PINNED: jconvert(to = "spss") no longer refuses a
#           column with four markers -- since 0.9.195 it declares the codes
#           as a missing-value RANGE (the S318 ruling; missing_convention_walk
#           Section 43 has the shapes) -- so the first render is a
#           conversion, not a refusal, and its old Expected ("resolution
#           option 1 ... vars = c(...)") no longer applies to it. The
#           section's point stands on the second render: the 26-marker cap
#           still prints the placeholder line, and it is still runnable once
#           filled. The spss-side placeholder survives in the two-problem
#           frame (a collision beside a single-code or zero-reach refusal),
#           which Section 43 of the missing-convention walk renders; not
#           repeated here. Rendered in the sandbox at the pinned 76.
# EDITED:   S269 (v0.9.151) -- annotation only, no Expected changed. The
#           Section 6 DEFECT block records the .xpt minimal tier as FIXED
#           and carries the new render; this run is its live confirmation.
# EDITED:   S268 (v0.9.150; WALKED, dirty entry). THE S267 RE-PIN PASS, two
#           sites, both rebuilt by reading the CURRENT source rather than
#           transcribed from a render -- repaired but UNVERIFIED.
#           (1) Section 6: S267 took all three jsave minimal tiers from
#           the S230 Rule E split to RULE L, so the remedy is now an
#           intro clause plus an indented runnable line rather than two
#           prose sentences. The bullet describing them said Rule E and
#           now says what to check instead -- chiefly that a minimal
#           tier and its standard sibling should look like one message
#           at two lengths.
#           (2) Section 7: the .sav over-cap block was redrafted into the
#           shared over-cap family form (with jconvert's spss-cap and
#           26-cap, both in Section 8). The convert-then-save pair this
#           section exists to protect SURVIVES verbatim and still
#           composes; everything around it is new, including a third
#           alternative (.rds) that now leads. WALKED the same session:
#           the shape confirmed, one correction -- the Expected had
#           omitted the "jsave(): " prefix, which moves the head's wrap.
#           DEFECT FOUND, package-side, logged at Section 6 and NOT
#           fixed here: the .xpt MINIMAL tier says "to drop them" twice
#           in one sentence, the second clause a verbless fragment.
#           Collateral from S267's own Rule L conversion of the three
#           minimal tiers. No assertion reads that string and the
#           standard tier beside it is clean, so nothing but a human
#           reading the six renders together would have caught it.
#           NOT AFFECTED, checked and left alone: the durability note in
#           Section 10, which already carries the S267 blank between its
#           two halves; and the vars = c(...) placeholder in Section 8,
#           which is a REAL jconvert argument and still renders. An
#           earlier reading of this pass flagged that placeholder as
#           stale by confusing it with the durability plural echo, a
#           different site that names its columns -- recorded here
#           because the same confusion is easy to repeat.
#           COVERAGE GAP: CLOSED AT S282. Section 10 now makes a
#           two-column declare (Rating and Contact) directly below the
#           one-column beat, so both echoed lines can be read for the
#           plural. Expected rendered in the sandbox at the pinned 76
#           against the 0.9.158 master, then walked.
# EDITED:   S283 (v0.9.159; WALKED the same session on the workstation,
#           end marker reached; jai rendered v3.7 against the installed
#           0.9.159 and matched the five-point read). The jai section's stamp
#           re-pinned v3.6 -> v3.7 for the S283 orientation rewrite, and
#           its Expected gains a five-point read of the rewrite (the
#           retired UDM sites, the new convention bullet, the scoped
#           mean() clause, the E16 precondition). Nothing else changed:
#           the modify-form beats this file exists to lock are untouched.
# EDITED:   S282 (v0.9.158). Two items, both carried since S268.
#           (1) The durability plural beat above -- the last of the six
#           coverage gaps the S268 pass identified and deferred.
#           (2) The two bare globals this file assigned into the caller's
#           workspace are now dot-prefixed: walk_dir -> .walkdir (six
#           sites) and tmp -> .tmpout (eight). The rename is not cosmetic:
#           the missing-convention walk's WALKDIR clobbered a variable of
#           that name during the S268 capture session, and these two had
#           the same habit in lowercase. .tmpout rather than .tmp because
#           the value is an output PATH STEM, not a directory, and the
#           old name said neither. fx() in the missing-convention walk is
#           still a bare global with ten call sites; left alone.
#           NOT RE-VERIFIED BEYOND THE NEW BEAT: this file was last walked
#           at v0.9.152 (S271), six versions back, so its S282 walk is
#           also its re-stamp and may surface staleness unrelated to
#           either item. Its open jai() finding (retired "UDM" vocabulary
#           in runtime output, source ~404 and ~450) remains a separate
#           to-do and is not addressed here.
# EDITED:   S266 (v0.9.149; not yet re-run). Setup restructured, awaiting
#           this file's next capture -- run DIRTY per the S259 convention
#           (width and convention set to non-default values by hand before
#           sourcing). The width pin is HOISTED above the reset chatter it
#           used to trail, and the S247 "none" convention pin becomes the
#           full record/force/restore shape: entering value captured, the
#           force a silent options() call (no settings echo in Setup), and
#           the foot restoring the entering value instead of hard-clearing
#           to "none". No Expected changes; every fixture jload still runs
#           under the "none" pin exactly as before.
# S294 EDIT (v0.9.167, 2026-09-14): the Setup reset line moved to the
#           clear.all = TRUE forms (S294 NULL flip). This file is the
#           sharpest case for the move: juse(NULL) runs FIRST, so a bare
#           f(NULL) would reach the sole-frame-or-STOP path with no default
#           to resolve against. No Expected touched; confirmed in the walk
#           below.
# S378 EDIT (v0.9.252): CAPABILITY SLATE C3, jrelabel(). SECTION 31 NEW,
#           filled by running (fill.R): the list form -- a c() after the
#           data frame -- without modify = TRUE (the stop and the call it
#           offers) and with it (the one line, jfreq() showing the labels);
#           the one-variable form assigned (the reminder) and with modify =
#           TRUE (the one line); and three refusals (variables listed one
#           after another; a variable label in the list form; a text
#           variable in the list). Jeff's rulings 1-3 and his okay of the
#           reminder (S378); the wording Claude's. On the PENDING line. A
#           capture of every section of every walk on 0.9.251 and 0.9.252:
#           here only Section 31 moved (temporary paths aside). The human
#           half of jrelabel_check.R J33-J42.
# LAST VERIFIED: v0.9.252, 2026-10-20 (S378) -- Section 31 WALKED on the
#           WORKSTATION by Jeff through receive_all() ("walked, all okay");
#           R CMD check 0 errors, 0 warnings, 0 notes; ALL BATTERIES GREEN
#           (10 run, 3090 checks).
# S361 EDIT (v0.9.234): CAPABILITY SLATE C1, ITS SIX SMALLER ITEMS.
#           Sections 21 and 22 NEW, each Expected FILLED BY RUNNING the
#           file (fill.R), the Saved lines that name a temporary folder
#           trimmed from Section 21's blocks. Section 21: jsave(
#           preserve.declarations = FALSE) ahead of the .sav/.dta/.xpt
#           pre-flight -- the refusal's second remedy, the save, the note
#           with the count, the file without declarations, the .xpt drop
#           route, R format's note (the S218 item). Section 22: jload()
#           reading the example files by name, a local copy winning with
#           the call that reads the shipped one, package = TRUE's refusals,
#           and the advisory note on a variable named T (the Session 74 and
#           S289 items). RE-PINNED, by running: Sections 4 and 5 (Contact's
#           -99 is convention-matched, the Session 23 item), 15 and 19
#           (each refusal's second remedy; their saves now run in the walk's
#           folder by name, so the line names the file as typed); prose
#           updated in Sections 6 and 7 (the same line, a temporary path).
#           harness.R derive: no section needs another it does not name.
#           The assertion side is missing_convention_check.R N94.
# LAST VERIFIED: v0.9.246, 2026-10-18 (S373) -- Section 16 WALKED on the
#           WORKSTATION by Jeff through receive_all() ("walked, all okay");
#           PENDING back to none; R CMD check 0 errors, 0 warnings, 0 notes;
#           ALL BATTERIES GREEN (10 run, 2993 checks); GitHub 9d5825f (package).
# LAST VERIFIED: v0.9.245, 2026-10-18 (S372) -- Section 9 WALKED on the
#           WORKSTATION by Jeff through receive_all() ("walked, all okay");
#           PENDING back to none; R CMD check 0 errors, 0 warnings, 0 notes;
#           ALL BATTERIES GREEN (10 run, 2944 checks); GitHub 03a9ff8 (package).
# LAST VERIFIED: v0.9.243, 2026-10-18 (S370) -- Section 12 WALKED on the
#           WORKSTATION by Jeff through receive_all() ("walked, all okay");
#           PENDING back to none; R CMD check 0 errors, 0 warnings, 0 notes;
#           ALL BATTERIES GREEN (10 run, 2910 checks); GitHub 127e63b (package).
# LAST VERIFIED: v0.9.241, 2026-10-18 (S369) -- Section 13 WALKED on the
#           WORKSTATION by Jeff through receive_all() ("walked, all okay");
#           PENDING back to none; R CMD check 0 errors, 0 warnings, 0 notes;
#           ALL BATTERIES GREEN (10 run, 2887 checks). Unchanged by
#           v0.9.242 (harness.R dump: no section of this walk moved).
# LAST VERIFIED: v0.9.240, 2026-10-17 (S368) -- Section 13 WALKED on the
#           WORKSTATION by Jeff through receive_all() ("walked, all okay");
#           PENDING back to none; GitHub d62f372 (package). Sandbox:
#           harness.R verify, 30 of 30 sections in three orders and by
#           prepare = TRUE; 106 of 107 Expected blocks (Section 9's, as
#           before). Every section of every walk captured on v0.9.239 and
#           v0.9.240: this file's Section 13 moved as re-pinned, the rest
#           identical apart from temp paths.
# LAST VERIFIED: v0.9.239, 2026-10-17 (S367) -- Sections 13 and 30
#           WALKED on the WORKSTATION by Jeff through receive_all()
#           ("walked, all okay"); PENDING back to none; GitHub 6e35be6
#           (package). Sandbox: harness.R verify, 30 of 30 sections in three
#           orders and by prepare = TRUE; 103 of 104 Expected blocks
#           (Section 9's, as before). Every section of every walk captured
#           on v0.9.238 and v0.9.239: this file's Section 13 moved as
#           re-pinned, the rest identical apart from temp paths.
# LAST VERIFIED: v0.9.238, 2026-10-17 (S366) -- Sections 13 and 29
#           WALKED on the WORKSTATION by Jeff through receive_all()
#           ("walked, all okay"); PENDING back to none; GitHub 9ab5efa
#           (package). Sandbox: harness.R verify, 29 of 29 sections in three
#           orders and by prepare = TRUE; 100 of 101 Expected blocks
#           (Section 9's, as before). Every section captured on v0.9.237
#           and v0.9.238: Sections 13 and 29 moved as re-pinned, Section 10
#           by its version stamp alone (pinned nowhere), the rest identical
#           apart from temp paths.
# LAST VERIFIED: v0.9.237, 2026-10-17 (S365) -- Sections 27, 28 and 29
#           WALKED on the WORKSTATION by Jeff through receive_all()
#           ("walked, all okay"); PENDING back to none; GitHub 9ac3314
#           (package). Sandbox: harness.R verify, 29 of 29 sections in three
#           orders and by prepare = TRUE; 100 of 101 Expected blocks
#           (Section 9's, as before). Every section captured on v0.9.236
#           and v0.9.237: identical apart from temp paths.
# LAST VERIFIED: v0.9.236, 2026-10-17 (S362) -- Sections 23, 24, 25 and
#           26 WALKED on the WORKSTATION by Jeff through receive_all() on
#           v0.9.235 ("walked, all okay"), and again on v0.9.236 ("walked,
#           all okay"); PENDING back to none; GitHub b3e9e2b (package).
#           Sandbox: harness.R verify on v0.9.235, 26 of 26 sections in
#           three orders and by prepare = TRUE; 86 of 87 Expected blocks
#           (Section 9's, as before). Every section captured on v0.9.235
#           and v0.9.236: identical apart from temp paths and the version
#           jai() prints.
# LAST VERIFIED: v0.9.234, 2026-10-16 (S361) -- Sections 4, 5, 6, 7, 15,
#           19, 21 and 22 WALKED on the WORKSTATION by Jeff through
#           receive_all() ("walked, all okay"); PENDING back to none;
#           GitHub 88a372e (package). Sandbox: harness.R verify, 22 of 22
#           sections in three orders and by prepare = TRUE; 66 of 67
#           Expected blocks (Section 9's, as before).
# LAST VERIFIED: v0.9.232, 2026-10-16 (S359) -- Sections 15, 16 and 20
#           WALKED on the WORKSTATION by Jeff through receive_all(), under
#           the tool's default walk line ("walked, all okay"); PENDING back
#           to none; GitHub 6cf15d7 (package).
# LAST VERIFIED: v0.9.231, 2026-10-16 (S357) -- Sections 3, 13, 15, 17
#           and 20 WALKED on the WORKSTATION through receive_all() on
#           v0.9.231, under the tool's default walk line: the v0.9.230
#           walks were held to the end of the session, the plan for two
#           builds in one, and v0.9.231 changes nothing this walk shows
#           (every section captured on both builds, identical apart from
#           temp paths). GitHub 72b0b4e and 2a4fcc3 (package). Sandbox:
#           harness.R verify, 20 of 20 sections in three orders and by
#           prepare = TRUE; 55 of 56 Expected blocks (Section 9's, as
#           before). PENDING back to none.
# LAST VERIFIED: v0.9.228, 2026-10-15 (S355) -- Sections 4, 6, 9 and 12
#           WALKED on the WORKSTATION through receive_all() ("walked, all
#           okay"), GitHub f89e83f (package), after the SANDBOX run (R
#           4.3.3, UTF-8 locale): harness.R verify, 19 of 19 sections in
#           file order, reverse order and shuffled, and by prepare = TRUE;
#           42 of 43 blocks found (Section 9's, as before). PENDING back to
#           none.
#           Prior: v0.9.227, 2026-10-13 (S354) -- Sections 8 and 15 WALKED
#           on the WORKSTATION through receive_all() ("walked, all okay"),
#           GitHub 9eacd76 (package), after the SANDBOX run (R 4.3.3,
#           UTF-8 locale): harness.R verify, 19 of 19 sections in file
#           order, reverse order and shuffled, and by prepare = TRUE; 42
#           of 43 blocks found (Section 9's, as before).
#           Prior: v0.9.225, 2026-10-12 (S352) -- Sections 4, 5 and 19
#           WALKED on the WORKSTATION through receive_all() ("walked, all
#           okay"), GitHub 5c5304e (package), after the SANDBOX run (R
#           4.3.3, UTF-8 locale): every changed Expected filled by running
#           the file (fill.R), 42 of 43 blocks found in the capture
#           (Section 9's, as before), and all 19 sections through rewalk()
#           in file order, reverse order and shuffled, and by prepare =
#           TRUE; Section 19 needs no other.
#           Prior: v0.9.224, 2026-10-11 (S351) -- Sections 13-18 WALKED on
#           the WORKSTATION through receive_all() ("walked, all okay", the
#           tool's default line), GitHub 093763a (package), after the
#           SANDBOX run (R 4.3.3, UTF-8 locale): every new Expected filled
#           by running the file (fill.R), 38 of 39 blocks found in the
#           capture (Section 9's prose block, as on 0.9.223), and all 18
#           sections through rewalk() in file order, reverse order and
#           shuffled, and by prepare = TRUE; no new section needs another.
#           Prior: v0.9.213, 2026-10-05 (S339) -- Sections 11 and 12 WALKED
#           on the WORKSTATION through rewalk() (Jeff: "both walk files are
#           okay"), GitHub eb54a30, after the SANDBOX run (R 4.3.3, UTF-8
#           locale): both sections' Expected blocks found in the capture,
#           and all 12 sections through rewalk() in file order, reverse
#           order and shuffled, and by prepare = TRUE; neither new section
#           needs an earlier one.
#           Prior: v0.9.211, 2026-10-05 (S337) -- Section 1 WALKED
#           on the WORKSTATION through rewalk(), matching its
#           re-pinned Expected; the rest untouched (no package change).
#           Prior: v0.9.167, 2026-09-14 (S294) -- WALKED on the WORKSTATION,
#           end marker reached, every section matching (reset line only;
#           see the S294 EDIT note above).
#           Prior: v0.9.146, 26 August 2026 (S258) -- CAPTURED AND DIFFED
#           rather than read. This file had NO width pin until S258, so
#           its Expecteds had never been comparable between runs; the pin
#           went in first, then a cold run at 76 was diffed block by
#           block. One block was stale (Section 1's closing sentence,
#           which now takes two lines) and is re-pinned from the capture.
#           Three further blocks differ from the output only in the
#           display indent used inside the comment, which is a
#           transcription convention and was deliberately left alone.
#           NOT read for render quality this run.
#
# PRIOR:    v0.9.144, 25 August 2026 (S255) -- read end to end; all
#           ten sections green. First re-stamp since S125. THIS IS THE RUN
#           THAT CAUGHT the S255 hanging-indent regression in the scan
#           legend's bracket-tag branches: no battery reaches that branch
#           and neither does clinic_workflows_walk, so this file was the
#           only thing that would have found it. Re-read after the fix,
#           which renders the tag on its own line with the whole
#           explanation hanging at indent two.
#
# PRIOR:    v0.9.125, 11 Aug 2026 (Jeff, line-by-line + full source();
#           all ten sections green, findings below ledgered at S229)
# RUN:      line-by-line first (read each block of output before moving on).
#           Also source()-safe: deliberate errors are tryCatch-wrapped and
#           every prompting call passes overwrite = TRUE (the S220 traps).
#           Under source(), run WITH echo = TRUE, per the conventions file.
#           By section: source walk_tools.R, then rewalk("modify_form") shows
#           the sections the PENDING line names and
#           rewalk("modify_form", "1") shows one, each from a fresh Setup and
#           its NEEDS. Add prepare = TRUE to run only what the section needs and
#           step through it by hand.
# SECTIONS: independent unless a framing comment says otherwise.
# ENDING:   the file MUST end with the executable end-marker line at the foot
#           (not with comments) -- see the note down there for why.
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# WHAT TO WATCH FOR THROUGHOUT. Every suggested call should read
#
#     jconvert(df, to = "stata", modify = TRUE)          <- prescription
#
# and NOT
#
#     df <- jconvert(df, to = "stata")                   <- the old form
#
# The one exception is Section 10, where BOTH forms are correct and expected.
# A stray assignment-form suggestion anywhere in Sections 1-9 is the defect
# this file exists to catch.
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# --- Setup -------------------------------------------------------------------

# jstats must be loaded already: devtools::load_all() (development) OR
# library(jstats) (installed) -- never both in one session.
stopifnot(exists("jload", mode = "function"))

# No dataset needed: every fixture below is built in-script (fixture
# preference order #1), so this file is immune to dataset rebuilds and runs
# from any RStudio project.

# Session-state pins -- hoisted above the reset chatter at S266, per the
# S259 rule that state blocks precede the first call that produces output:
# the juse/jsubset/... confirmations and the old joptions() echo printed
# before the width pin applied (the S258 capture shows them at the entry
# width).
#
# WIDTH (S258): since v0.9.145 the shipped message.width default is "auto",
# so message output follows the console pane, and every Expected in this
# file is only meaningful at a stated width. Pinned at 76, the width the
# other regression files use; restored at the foot.
#
# CONVENTION (S266): this file has pinned "none" since S247 -- its jload
# narratives are shown in their no-convention-set case, and "none" is the
# factory state, not a fourth convention. What S266 adds is the record and
# the restore: the entering value was never captured, so the old foot's
# hard "none" clear handed every next session a cleared slot regardless of
# what it arrived with. The force is a silent options() call now, so Setup
# no longer echoes a settings panel.
.entry_convention    <- getOption(".jst_options_missing_convention")
.entry_message_width <- getOption(".jst_options_message_width")
.entry_warn          <- getOption("warn")
.pin_width           <- 76L

options(.jst_options_missing_convention = "none")
options(.jst_options_message_width = .pin_width)

# warn = 1 (conventions file, rule 4, S248; here since S367): Section 30's
# beat is a warning, which a source() run would otherwise defer to the foot
# of the file. No other section warns. Changes nothing for a line-by-line
# run; restored at the foot.
options(warn = 1)

# Neutral pipeline state (never assume the prior state is clean).
juse(NULL); jsubset(clear.all = TRUE); jcomplete(clear.all = TRUE)
joutput(NULL); jdummy(clear.all = TRUE)

# Fixtures -------------------------------------------------------------------
# spss_df   two SPSS-style declared columns (numeric codes)
# stata_df  one Stata-style column (tagged NAs)
# mixed_df  one of each -- the mixed-frame narrative cases
# plain_df  undeclared codes: one labelled, one bare (the scan's two sources)

spss_df <- data.frame(
  Income    = haven::labelled_spss(c(42000, 51000, -99, -98),
                                   labels = c(Refused = -99,
                                              `Don't know` = -98),
                                   na_values = c(-99, -98)),
  Education = haven::labelled_spss(c(12, 16, -99, 14),
                                   labels = c(Refused = -99),
                                   na_values = -99)
)

stata_df <- data.frame(
  Mood = haven::labelled(c(3, 4, haven::tagged_na("a")),
                         labels = c(Refused = haven::tagged_na("a")))
)

mixed_df <- data.frame(
  Income = spss_df$Income,
  Mood   = c(stata_df$Mood, NA)
)

plain_df <- data.frame(
  Rating  = haven::labelled(c(3, 4, -99), labels = c(Refused = -99)),
  Contact = c(2, 5, -99)
)


# Write the fixtures out so the sections below can jload them -- the messages
# under review are LOAD-path messages, and driving them through a real jload
# is better evidence than calling the narrative helper directly.
.walkdir <- file.path(tempdir(), "modify_form_walk")
dir.create(.walkdir, showWarnings = FALSE)
f_spss  <- file.path(.walkdir, "clinic.rds")
f_mixed <- file.path(.walkdir, "mixed.rds")
f_plain <- file.path(.walkdir, "plain.rds")
f_susp  <- file.path(.walkdir, "susp.rds")
invisible(jsave(spss_df,             f_spss,  overwrite = TRUE))
invisible(jsave(mixed_df,            f_mixed, overwrite = TRUE))
invisible(jsave(plain_df,            f_plain, overwrite = TRUE))
invisible(jsave(plain_df["Contact"], f_susp,  overwrite = TRUE))


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 1 -- jload narrative, Case 1: uniform SPSS, no convention set ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The single most-seen suggestion in the package: it fires on essentially
# every load of SPSS-declared data.

joptions(missing.convention = "none")
jload(f_spss, name = "clinic", overwrite = TRUE, missing.notice = TRUE)

# Expected, as the last two lines:
#   To make them missing in base R as well, convert:
#     jconvert(clinic, to = "stata", modify = TRUE)
# RE-PINNED S337 from a capture: the remedy is a head line ending in a colon
# and the call on a line of its own, indented two spaces. This block showed
# the earlier form, one sentence ending in a period ("..., run
# jconvert(...)."); the workstation's own cap_modify.txt already had the
# form above. The head stays ONE line on purpose: a second head line
# separates it from its block and hides the block from the next audit.
# Things to look at:
#   - the line is runnable as printed -- no "clinic <- " scaffold
#   - the call sits on a line of its own, with no period after it
#   - the frame name in the call is the LOADED name (clinic), not the name
#     the fixture had when it was saved
# NOTE the explicit missing.notice = TRUE: the first UDM notice in a session
# uses the full form, later showings go COMPACT and drop exactly this
# guidance tail (S227 E17 design). Without the flag, this section only
# shows its Expected line in a fresh session -- the S229 review's
# full-file re-source hit precisely that.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 2 -- jload narrative, Case 4: uniform SPSS, setting says stata ----
# NEEDS: 1
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Two equal-standing remedies. Only the SECOND is a data-changing call, so
# only the second should carry modify = TRUE; the joptions line is a settings
# call and is untouched by this pass.

joptions(missing.convention = "stata")
jload(f_spss, name = "clinic", overwrite = TRUE)

# Expected, the two remedy blocks (S230 Rule L form):
#   To use SPSS-style missing values, run:
#     joptions(missing.convention = "spss")
#   To use Stata-style missing values, run:
#     jconvert(clinic, to = "stata", modify = TRUE)
# Things to look at:
#   - each runnable call on its own two-space-indented line, no trailing
#     period (Rule L); the joptions call still carries no modify = TRUE
#     (a settings call)
#   - the two blocks still read as equal-standing, neither recommended


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 3 -- jload narrative, Cases 6 and 7: mixed frames ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The align lines carry BOTH the converted call and the joptions rider. Watch
# that adding modify = TRUE did not disturb the line break before "and".

joptions(missing.convention = "spss")
cat("--- Case 7 (mixed frame, convention explicitly set) ---\n")
jload(f_mixed, name = "clinic", overwrite = TRUE)

joptions(missing.convention = "none")
cat("\n--- Case 6 (mixed frame, no convention set) ---\n")
jload(f_mixed, name = "clinic", overwrite = TRUE)

# Expected, in both cases, align blocks of the shape (S230 Rule L form --
# the "\nand" break is retired):
#   To use Stata-style missing values throughout, run both:
#     jconvert(clinic, to = "stata", modify = TRUE)
#     joptions(missing.convention = "stata")
# Things to look at:
#   - no line breaks inside any call, at any console width
#   - Case 7's setting-matching block is "run:" with ONE indented call and
#     no rider; every off-setting block is "run both:" with the joptions
#     rider as its second indented call (Case 6 has no setting, so BOTH of
#     its blocks are "run both:")


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 4 -- the scan's declare suggestion (jload's other big surface) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Undeclared codes, so the scan runs rather than the narrative.

# RE-PINNED S352 (v0.9.225; ruling R15, Jeff, S347: "that's what I want").
# With no convention selected -- this walk's state -- the line stopped at
# the choose-first gate, so the menu now comes first ("this code cannot be
# declared yet"), then "Then, to declare one variable's codes as missing:"
# and the line. With a convention selected the block is as it was. The pin
# had quoted the line alone; it is now the call's whole output, filled by
# running.

jload(f_plain, name = "clinic", overwrite = TRUE)

# Expected:
#   Loaded clinic (R format; 3 cases, 2 variables)
#
#   Missing-value codes detected:
#     Rating:   -99 ["Refused"] (1)  [label-only -- not formally declared]
#     Contact:  -99 (1)              [convention-matched -- not formally declared]
#
#   [label-only -- not formally declared]:
#     not automatically treated as NA, but the value labels suggest they mark
#     missing values.
#     Declare them as missing if they are; leave as-is if real.
#   [convention-matched -- not formally declared]:
#     not automatically treated as NA, but they match the
#     missing.convention.codes setting (-99, -98, -97).
#     Declare them as missing if they are; leave as-is if real.
#
#   No missing-value convention is selected, so this code cannot be
#   declared yet.
#   Choose one for this session:
#     joptions(missing.convention = "stata")
#         Lowercase markers behave as true NAs in base R.
#         Recommended if you also run base R or AI-generated code.
#     joptions(missing.convention = "spss")
#         Codes stay visible numbers; jstats treats them as missing.
#         Base R does not.
#     joptions(missing.convention = "sas")
#         Like Stata, with uppercase markers (.A-.Z).
#   To make the choice permanent, put the same line in your .Rprofile.
#   Then, to declare one variable's codes as missing:
#     jdeclare_missing(clinic, Rating, codes = -99, modify = TRUE)
# RE-PINNED S361 (v0.9.234; the Session 23 item): Contact's -99 is a
# missing.convention.codes value, so it is convention-matched, with its
# own legend, where it was suspected.
# Things to look at:
#   - the menu, then the line, which runs once a convention is chosen
#   - "this code" in the menu's head, beside the block's "codes" (the
#     wording R15 left to the build)
#   - the label-only variable (Rating) is the example target, not Contact


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 5 -- the scan's commented label-at-the-same-time example ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The second, commented example fires only when the target is an
# unlabelled variable -- SUSPECTED, or since S361 (v0.9.234) convention-
# matched, as Contact's -99 now is: "Missing-value codes detected:" and the
# setting's legend, where it said "Suspected" -- so this fixture holds only
# the bare-code column.

# RE-PINNED S352 (v0.9.225; ruling R15): the menu first, as in Section 4.
# The pin quoted the second line in its pre-S267 commented form; it is now
# the call's whole output, filled by running.

jload(f_susp, name = "clinic", overwrite = TRUE)

# Expected:
#   Loaded clinic (R format; 3 cases, 1 variable)
#
#   Missing-value codes detected:
#     Contact:  -99 (1)
#
#   These codes match the missing.convention.codes setting (-99, -98, -97) but
#   are not formally declared, so they are not treated as missing. Declare them
#   as missing if they are; leave as-is if real.
#
#   No missing-value convention is selected, so this code cannot be
#   declared yet.
#   Choose one for this session:
#     joptions(missing.convention = "stata")
#         Lowercase markers behave as true NAs in base R.
#         Recommended if you also run base R or AI-generated code.
#     joptions(missing.convention = "spss")
#         Codes stay visible numbers; jstats treats them as missing.
#         Base R does not.
#     joptions(missing.convention = "sas")
#         Like Stata, with uppercase markers (.A-.Z).
#   To make the choice permanent, put the same line in your .Rprofile.
#   Then, to declare one variable's codes as missing:
#     jdeclare_missing(clinic, Contact, codes = -99, modify = TRUE)
#   To declare and label them in one call, replacing the placeholder names:
#     jdeclare_missing(clinic, Contact, codes = c("label1" = -99),
#         modify = TRUE)
# Things to look at:
#   - the second line, with placeholder labels, is uncommented and runs
#     as printed once a convention is chosen


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 6 -- jsave pre-flight refusals (.dta, .sav, .xpt) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Three separate builders, each with a minimal and a standard tier. All are
# errors, so all are wrapped.

show <- function(label, expr) {
  cat("\n--- ", label, " ---\n", sep = "")
  tryCatch(expr, error = function(e) cat(conditionMessage(e), "\n", sep = ""))
}

.tmpout <- file.path(tempdir(), "walk_out")

joutput("standard")
show(".dta refusal (SPSS-style codes cannot go to Stata format)",
     jsave(spss_df, paste0(.tmpout, ".dta"), overwrite = TRUE))
show(".sav refusal (Stata-style markers cannot go to SPSS format)",
     jsave(stata_df, paste0(.tmpout, ".sav"), overwrite = TRUE))
show(".xpt refusal (no extended missings in the SAS interchange format)",
     jsave(spss_df, paste0(.tmpout, ".xpt"), overwrite = TRUE))

joutput("minimal")
show(".dta refusal, MINIMAL tier",
     jsave(spss_df, paste0(.tmpout, ".dta"), overwrite = TRUE))
show(".sav refusal, MINIMAL tier",
     jsave(stata_df, paste0(.tmpout, ".sav"), overwrite = TRUE))
show(".xpt refusal, MINIMAL tier",
     jsave(spss_df, paste0(.tmpout, ".xpt"), overwrite = TRUE))
joutput(NULL)

# Expected: each of the six carries a convert recipe in the form
#   jconvert(spss_df, to = "stata", modify = TRUE)
#
# UPDATED S361 (v0.9.234; the S218 item): each refusal now also offers the
# save that makes every declared missing value plain NA in the file,
#   Or save every declared missing value as plain NA instead:
#     jsave(spss_df, "<tempdir>/walk_out.dta", overwrite = TRUE,
#         preserve.declarations = FALSE)
# at both tiers of the .dta and .sav refusals, and the .xpt refusal's drop
# route is that save, where it was jconvert(spss_df, to = "baseR", modify =
# TRUE): "To save as .xpt with every declared missing value as plain NA,
# run:" at the standard tier, "To drop them:" above the same line at the
# minimal. The path is the one typed, here a temporary folder. Section 21
# shows the saves themselves.
#
# UPDATED S268 for S267, and the change is to the SHAPE of all three
# minimal tiers, not to their words. S230 had split them per Rule E --
# the incompatibility sentence and the remedy sentence each starting
# their own line, as running prose. S267 took all three to RULE L
# instead: the remedy is now an intro clause ending in a colon with the
# runnable call on its own two-space-indented line beneath it. That is
# the same shape the standard tiers already used, so the six renders in
# this section should now differ in DETAIL but not in silhouette.
#
# NOT TRANSCRIBED FROM A RENDER. This section describes its Expected at
# summary level rather than pinning six literal blocks, which is why the
# repair here is a description rather than six re-pins -- but it also
# means the run has more to check than usual.
#
# Things to look at:
#   - THE MAIN CHECK: read a minimal tier and its standard sibling back
#     to back. After S267 they should look like the same message at two
#     lengths. If the minimal one still reads as a different shape
#     rather than a shorter one, the alignment did not land.
#   - the three minimal tiers against EACH OTHER. S267 aligned the
#     refusal trio deliberately; three builders drifting apart again is
#     the failure mode that pass was fixing.
#
# DEFECT FOUND BY THE S268 RUN -- FIXED S269 (v0.9.151), package-side.
# The .xpt MINIMAL tier HAD rendered:
#
#   To drop them, run the conversion below; to drop them, or save as SPSS format
#   (.sav) to preserve them.
#     jconvert(spss_df, to = "baseR", modify = TRUE)
#
# "to drop them" twice in one sentence, the clause after the semicolon
# left verbless. Collateral from S267's own Rule L conversion of the
# three minimal tiers: the edit that lifted the runnable line out of the
# old Rule E prose left the original opening clause standing ahead of
# the rewritten one. S269 checked the OTHER two minimal tiers and both
# were clean -- .xpt alone carried a branching tail written as a
# continuation of the old head, so every one of its three branches was
# affected, not just the one this section renders.
#
# IT THEN RENDERED (transcribed from a render through the real emitter at
# width 76, not predicted; the drop line has been the jsave() line above
# since S361):
#
#   jsave(): 2 variables carry missing-value codes, incompatible with
#   the .xpt format.
#   To preserve them, save as SPSS format (.sav). To drop them:
#     jconvert(spss_df, to = "baseR", modify = TRUE)
#
# The preserve advice moved AHEAD of the remedy so the colon sits
# directly above the runnable line -- which is what the .dta and .sav
# minimal tiers already did. The three now share one silhouette, so the
# summary description above is finally true of all three. The 79-column
# overrun was a symptom of the duplication and should be gone with it.
#
# WHAT THIS RUN CONFIRMS. The block above is the has_spss branch. The
# tagged-only branch substitutes Stata format (.dta); the both-forms
# branch reads "To preserve them, convert them to one form with
# jconvert() and save as SPSS format (.sav) or Stata format (.dta). To
# drop them:" and wraps once. This walk is where the fix meets the LIVE
# path: S269's evidence was the builder called through .jst_stop() in a
# sandbox, which cannot prove jsave() reaches it with these arguments.
#
# Note what caught it. No assertion in the suite reads this string, the
# standard tier next to it is fine, and S267's own workstation run did
# not reach here. It surfaced only because a human walkthrough put the
# six renders side by side -- which is the argument for this file.
#   - no wrap ever lands inside a jconvert(...) call
#   - the .xpt message's "convert them to one form with jconvert()" is a BARE
#     reference, not a suggested call, and is correctly left alone


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 7 -- the .sav UDM-limit refusal (a two-step recipe) ----
# NEEDS: 6
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Resolution option 2 is a convert THEN a save. The two lines have to compose:
# if the convert did not carry modify = TRUE, the jsave on the next line would
# silently write the unconverted frame.

over_df <- data.frame(
  X = haven::labelled(c(1, 2, -99, -98, -97, -96),
                      labels = c(a = -99, b = -98, c = -97, d = -96))
)
over_df$X <- haven::labelled_spss(unclass(over_df$X),
                                  labels = c(a = -99, b = -98, c = -97, d = -96),
                                  na_values = c(-99, -98, -97, -96))

show(".sav UDM-limit refusal (4 codes, cap is 3)",
     jsave(over_df, paste0(.tmpout, ".sav"), overwrite = TRUE))

# Expected -- the WHOLE block, redrafted S267 into the shared over-cap
# family form:
#   jsave(): SPSS format (.sav) allows at most 3 declared missing values
#   per variable, or a range plus one code.
#
#   This variable in over_df has more:
#     X: 4 codes
#
#   To save in R format (.rds) instead, keeping all the codes:
#     jsave(over_df, "over_df.rds")
#   To convert to Stata and save as Stata format (.dta), also keeping all
#   the codes:
#     jconvert(over_df, to = "stata", modify = TRUE)
#     jsave(over_df, "over_df.dta")
#   To save as SPSS format (.sav) with every declared missing value as plain NA:
#     jsave(over_df, "<tempdir>/walk_out.sav", overwrite = TRUE,
#         preserve.declarations = FALSE)
#   Or reduce each variable's declared missing values to fit.
#
# UPDATED S361 (v0.9.234; the S218 item): the fourth route, the save with
# preserve.declarations = FALSE, ahead of "Or reduce". Its path is the one
# typed, a temporary folder here, so the block is prose.
#
# RE-PINNED S268 for S267. The two lines this section was built to watch
# SURVIVE verbatim -- they are still adjacent, still in that order, and
# still compose. What changed is everything around them. The old
# Expected pinned the pair alone; the block now opens with a generic
# capability sentence, names the offending variables in an indented
# list, and offers THREE alternatives rather than two, each with its own
# intro. The .rds route is new here and leads, because it is the one
# option that loses nothing.
#
# One of three blocks S267 brought to a single family form (the other
# two are jconvert's spss-cap and 26-cap, exercised in Section 8). The
# point of the family treatment is that a user who meets one of them and
# later meets another should recognize the shape.
#
# SHAPE CONFIRMED by the S268 run, with ONE correction. The blank
# lines, the singular "This variable in over_df has more:" lead, the
# indented "X: 4 codes", the three remedies and their order, and the
# two-line "To convert to Stata" intro all render as assembled. What was
# wrong was the first line: the predicted Expected omitted the
# "jsave(): " prefix, and with those nine columns back in place the head
# wraps after "missing values" rather than after "per". Same root cause
# as the five mispredicted breaks in missing_convention_walk -- the
# prefix reserve was not counted.
#
# Things to look at:
#   - read the convert-then-save pair as a user would: run line 1, then
#     line 2. They compose, and that is the property this section has
#     always existed to protect -- confirm S267's redraft did not break
#     it while rearranging everything around it.
#   - three alternatives now, not two. Does the .rds option leading read
#     as the obvious first answer, or does its arriving first bury the
#     .dta route most users actually want?
#   - the closing "Or reduce ..." states a requirement and names no
#     method (Rule X). Is that a helpful boundary or a dead end?


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 8 -- jconvert's own pre-flight refusals (the placeholder lines) ----
# NEEDS: 6
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# These are the "leave as shapes or make them runnable" sites (sub-question 2,
# settled S229: make them runnable). The c(...) stays a blank the user fills;
# everything around it is now correct.

# S319: a column with more markers than codes is CONVERTED, its codes
# declared as a range from the first convention code, so this render is no
# longer a refusal. It stays as the section's contrast: the same fixture
# that met the cap for five sessions now converts, and the range note says
# why a range was used.
tag4 <- c("a", "b", "c", "d")
over_stata_df <- data.frame(
  X = haven::labelled(
    c(1, 2, vapply(tag4, haven::tagged_na, numeric(1))),
    labels = stats::setNames(vapply(tag4, haven::tagged_na, numeric(1)),
                             paste0("code_", tag4)))
)
show("jconvert to SPSS, four markers (a range since S319; was the 3-UDM cap refusal)",
     jconvert(over_stata_df, to = "spss"))

# The Stata cap is 26 markers (.a-.z), so this fixture declares 27.
codes27 <- seq(-99, by = -1, length.out = 27)
many_df <- data.frame(Y = c(1:3, codes27))
many_df$Y <- haven::labelled_spss(
  many_df$Y,
  labels = stats::setNames(codes27, paste0("c", seq_along(codes27))),
  na_values = codes27)
show("jconvert to Stata, over the 26-marker cap",
     jconvert(many_df, to = "stata"))

# Expected, first render (S319): a conversion, one row per marker, the range
# row last, and the note:
#   Converted to SPSS-style missing values in 1 variable:
#     X  .a ["code_a"]  -> -99
#        .b ["code_b"]  -> -98
#        .c ["code_c"]  -> -97
#        .d ["code_d"]  -> -96
#        range -99 to -96
#
#   Note: X has 4 lettered markers, more than the 3 separate missing-value codes
#   SPSS allows, so its codes were declared as a missing-value range.
#
#   This call changes over_stata_df only if you assign the result:
#     over_stata_df <- jconvert(over_stata_df, ...)
#
#   To change over_stata_df directly, rerun with modify = TRUE:
#     jconvert(over_stata_df, ..., modify = TRUE)
#
# Expected, second render, resolution option 1 (S354: the variables before
# the target, the teaching form):
#   jconvert(many_df, vars = c(...), to = "stata", modify = TRUE)
# Things to look at:
#   - c(...) is still plainly a blank to fill -- that is deliberate
#   - but everything else is correct, so filling it yields a working call
#   - the first render's durability note shows both forms (a REPORT on a
#     call that ran, Rule S's S229 corollary), as Section 10 explains


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 9 -- the two jdeclare_missing errors and the jrecode convention ----
#              error
# NEEDS: 8
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

joptions(missing.convention = "spss")

show("jdeclare_missing: Stata token against an SPSS-declared column",
     jdeclare_missing(spss_df, Income, codes = c(Refused = haven::tagged_na("a"))))

show("jdeclare_missing: codes mixes tagged and numeric on an SPSS-declared column",
     jdeclare_missing(spss_df, Income,
                  codes = c(Refused = haven::tagged_na("a"), DK = -98)))

show("jrecode: map uses a Stata marker under SPSS convention",
     jrecode(spss_df, Income, map = "42000=.a"))

# S247: the "none" reset that used to sit here is GONE, and the Section 9
# setting above carries through to Section 10. Nothing runs between here and
# there, so the reset had nothing to protect -- while Section 10 needs a
# chosen convention (its plain_df fixture is deliberately undeclared, so the
# S244 gate would stop both declares before they reach the durability note
# they exist to show). Re-setting "spss" in Section 10 instead would work but
# would fire a second frame-scan nudge block directly above the output a
# reader is meant to be studying.

# Expected:
#   - error 1 ends with:  jconvert(spss_df, to = "stata", modify = TRUE)
#     Since v0.9.245 (S372) its jdeclare_missing() line names BOTH of
#     Income's codes -- c(Refused = -99, `Don't know` = -98), the second
#     with the label it has -- where it named -99 alone, which run dropped
#     -98 (jdeclare_missing() replaces a variable's codes); the sentence
#     under it reads "Income's declared missing value -99 takes the place
#     of '.a'."
#   - error 2, since v0.9.245 (S372; Fix Slate 20, the S371 remedy-line
#     audit), is error 1's message, not the two-line split: Income carries
#     SPSS-style declarations and no marker, so the split's first line (a
#     marker to label) and its second (convention = "stata" on an SPSS
#     variable) both stopped when run. Its line declares the codes as
#     SPSS-style missing values -- c(Refused = -99, DK = -98), the marker
#     replaced by the code it pairs with -- under "To declare the codes as
#     SPSS-style missing values, name them directly:", then the jconvert()
#     line. The split is still given where the variable carries markers
#     (missing_convention_walk.R Section 71).
#   - error 3's jrecode( recipe line is UNCHANGED (jrecode returns a vector
#     and is outside the modify family); only its jdeclare_missing follow-up line
#     gained modify = TRUE
# Things to look at:
#   - error 3 is the mixed case worth reading closely: one line without
#     modify = TRUE (jrecode, correct) directly above one with it
#     (jdeclare_missing, correct). That juxtaposition is intentional.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 10 -- THE TWO SITES THAT KEEP BOTH FORMS ----
# NEEDS: 9
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Everything above should show modify = TRUE alone. These two should NOT --
# they are reports, not prescriptions, and both forms are correct here.

cat("--- the durability note, default branch (the call already ran) ---\n")
d1 <- jdeclare_missing(plain_df, Rating, codes = c(Refused = -99))

# Expected: BOTH forms, in this order:
#   This call changes plain_df only if you assign the result:
#     plain_df <- jdeclare_missing(plain_df, Rating, ...)
#
#   To change plain_df directly, rerun with modify = TRUE:
#     jdeclare_missing(plain_df, Rating, ..., modify = TRUE)
# Why: the assignment line rescues THIS call; the modify line is the better
# next one. Removing either would leave the user without a way to keep the
# work just done.

cat("\n--- the durability note, TWO columns (the plural echo) ---\n")
d1b <- jdeclare_missing(plain_df, Rating, Contact, codes = c(Refused = -99))

# ADDED S282, closing the COVERAGE GAP this file's header has recorded since
# S268: the echoed call rebuilds the variables the user named, and no
# section here named more than one, so the plural render had never been
# seen. The S267 change it witnesses is that BOTH echoed lines list every
# column rather than only the first.
#
# Expected: the same two forms, both echoing BOTH columns:
#   Declared SPSS-style missing values on 2 variables:
#     Rating, Contact
#     -99 ["Refused"]
#
#   This call changes plain_df only if you assign the result:
#     plain_df <- jdeclare_missing(plain_df, Rating, Contact, ...)
#
#   To change plain_df directly, rerun with modify = TRUE:
#     jdeclare_missing(plain_df, Rating, Contact, ..., modify = TRUE)
#
# (Sandbox-rendered against the v0.9.158 master at S282, at the pinned 76,
# then confirmed by the S282 workstation walk.)
#
# Things to look at:
#   - THE POINT OF THE BEAT: "Rating, Contact" appears in BOTH echoed lines.
#     If either shows only Rating, the echo has dropped back to the first
#     variable and a user pasting it would silently declare one column of
#     the two they asked for -- a wrong result that looks like a right one.
#   - The status line above the note switches to the counted form ("on 2
#     variables:" with the names on their own line) while the note keeps
#     the columns inline. Two different renderings of the same list, three
#     lines apart. Judge whether that reads as each doing its own job or as
#     an inconsistency.
#   - Contact is a PLAIN numeric column and Rating is already labelled, so
#     this also quietly shows the declare applying across both kinds in one
#     call. Nothing in the note distinguishes them; check that it should
#     not have to.

cat("\n--- the durability note, modify branch ---\n")
plain_df2 <- plain_df
invisible(jdeclare_missing(plain_df2, Rating, codes = c(Refused = -99),
                       modify = TRUE))

# Expected: NEITHER form -- just the cross-session jsave tip. The change has
# already landed on the frame, so saving is the only next rung.

cat("\n--- the jai orientation body (v3.8) ---\n")
jai()

# Expected, in the bullet beginning "Analysis functions print their results":
#   ... take `modify = TRUE` to apply the change directly
#   (`jdeclare_missing(df, ..., modify = TRUE)`) -- the form jstats teaches.
#   They also return the changed data frame, so assigning back
#   (`df <- jdeclare_missing(df, ...)`) works as well.
# Things to look at:
#   - modify = TRUE now comes FIRST and is marked as the taught form
#   - the assignment form is still present (an assistant has to recognize it
#     in your code) but is now clearly secondary
#   - the version stamp reads v3.8 (S357: SKILL.md's AI-assistant paragraph
#     set to the body's width, Section 20; the console and AGENTS.md text
#     is unchanged). If it still says 3.7, the orientation bump did not
#     land.
#
# S283 (v3.7): the retired-vocabulary finding this file carried since S268
# is CLOSED. Read the body for these, all in the S283 rewrite:
#   - "UDM" appears NOWHERE (it stood twice: the intro's "user-defined
#     missing values (UDM)" and the stray-codes bullet's "declared UDM
#     codes"); the intro now says "declared missing values".
#   - a NEW bullet precedes the stray-codes one: choose a convention once
#     per session, stata recommended WITH its reason (the P6 rationale the
#     choose-first gate's menu already carries: markers are true NAs in
#     base R, so base R and AI-generated code get right answers). Before
#     S283 jai() never mentioned the setting, so its own recommended
#     jdeclare_missing() call gated in a fresh session.
#   - the "base functions such as mean() ... wrong answers" clause is now
#     scoped to SPSS convention; it was stated unconditionally, and is
#     false under stata/sas.
#   - the stray-codes bullet carries the E16 precondition: the codes must
#     already be present in the data, and NA itself cannot be declared.
#   - "argument" still appears (this bullet and two others): whether Rule B
#     reaches jai() is an open scope question, deliberately not taken here.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 11 -- the durability note on a call with many variables ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S339 (v0.9.213; the S298 item, with S292 site 1). The note's two
# lines listed EVERY variable of the call. The field project's bulk call --
# vars = decl, 52 names -- got two lines of some 1,300 characters each,
# with the 52 names where the user had typed vars = decl. The lines end in
# the template's "..." and are never wrapped, so they were correct and
# unusable. Three forms now, the first that applies:
#     vars = as the call typed it      when the call gave vars = and it fits
#     every name                       three or fewer, and they fit
#     nothing: f(d, ...)               otherwise
# A list is never shown IN PART. Section 10's plural beat is the reason:
# a line naming the first few of fourteen variables, completed and run,
# would declare on those few and look like it had done the job.
joptions(missing.convention = "spss", quiet = TRUE)

many_q <- as.data.frame(stats::setNames(
  replicate(14, c(3, 4, -99), simplify = FALSE),
  sprintf("item_%02d", 1:14)))

cat("--- vars = given as a name: shown as typed ---\n")
q_names <- names(many_q)
d11a <- jdeclare_missing(many_q, vars = q_names, codes = c(Refused = -99))

# Expected:
#   Declared SPSS-style missing values on 14 variables:
#     item_01, item_02, item_03, item_04, item_05, item_06, item_07, item_08,
#     item_09, item_10, item_11, item_12, item_13, item_14
#     -99 ["Refused"]
#
#   This call changes many_q only if you assign the result:
#     many_q <- jdeclare_missing(many_q, vars = q_names, ...)
#
#   To change many_q directly, rerun with modify = TRUE:
#     jdeclare_missing(many_q, vars = q_names, ..., modify = TRUE)

cat("\n--- four names typed out: none shown ---\n")
d11b <- jdeclare_missing(many_q, item_01, item_02, item_03, item_04,
                         codes = c(Refused = -99))

# Expected:
#   Declared SPSS-style missing values on 4 variables:
#     item_01, item_02, item_03, item_04
#     -99 ["Refused"]
#
#   This call changes many_q only if you assign the result:
#     many_q <- jdeclare_missing(many_q, ...)
#
#   To change many_q directly, rerun with modify = TRUE:
#     jdeclare_missing(many_q, ..., modify = TRUE)

cat("\n--- three names typed out: all three, as in Section 10 ---\n")
d11c <- jdeclare_missing(many_q, item_01, item_02, item_03,
                         codes = c(Refused = -99))

# Expected:
#   Declared SPSS-style missing values on 3 variables:
#     item_01, item_02, item_03
#     -99 ["Refused"]
#
#   This call changes many_q only if you assign the result:
#     many_q <- jdeclare_missing(many_q, item_01, item_02, item_03, ...)
#
#   To change many_q directly, rerun with modify = TRUE:
#     jdeclare_missing(many_q, item_01, item_02, item_03, ..., modify = TRUE)

options(.jst_options_missing_convention = "none")
rm(many_q, q_names, d11a, d11b, d11c)

# Things to look at:
#   - The declaration block still names every variable (it is wrapped
#     prose); only the two runnable lines are short.
#   - "many_q <- jdeclare_missing(many_q, ...)": the "..." now stands for
#     the whole call. Does it read as "run your call again, assigned", or
#     does a line with no variable in it read as incomplete?
#   - Three names shown and four not is a cliff. The alternative was a
#     list cut at three with "..." after it, which is the line Section 10
#     warns about. Right trade?
#   - With vars = typed as a name the line is one the user could complete
#     and run as it stands, which the 52-name version was not.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 12 -- the data given as an expression, or as a place ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S339 (v0.9.213; the S219 item, findings 2 and 5). The note builds
# its assignment line by putting the data argument on both sides of an
# arrow. With a data frame's name that is a line to run. With a call it was
# not R at all:
#     mk12() <- jconvert(mk12(), ...)
# and the modify = TRUE line under it named a call the function refuses
# (modify = TRUE needs a name). Three cases now:
#     a name (or the juse() default)   both lines, as before
#     a place: lst12$d                 the assignment line alone -- a result
#                                      CAN be assigned to it, but modify =
#                                      TRUE cannot write to it
#     any other expression: mk12()     one line, assigning to a new name
joptions(missing.convention = "spss", quiet = TRUE)
mk12  <- function() plain_df
lst12 <- list(d = plain_df)

cat("--- jdeclare_missing() on a call ---\n")
d12a <- jdeclare_missing(mk12(), Rating, codes = c(Refused = -99))

# Expected:
#   Declared SPSS-style missing values on Rating:
#     -99 ["Refused"]
#
#   The result is kept only if you assign it to a name:
#     mydata <- jdeclare_missing(mk12(), Rating, ...)

cat("\n--- jconvert() on a call ---\n")
mkc12 <- function() spss_df
d12b <- jconvert(mkc12(), to = "baseR")

# Expected:
#   Stripped the missing-value declarations from 2 variables:
#     Income     -99 ["Refused"]
#                -98 ["Don't know"]
#     Education  -99 ["Refused"]
#
#   The result is kept only if you assign it to a name:
#     mydata <- jconvert(mkc12(), ...)

cat("\n--- a place: an element of a list ---\n")
d12c <- jdeclare_missing(lst12$d, Rating, codes = c(Refused = -99))

# Expected:
#   Declared SPSS-style missing values on Rating:
#     -99 ["Refused"]
#
#   This call changes lst12$d only if you assign the result:
#     lst12$d <- jdeclare_missing(lst12$d, Rating, ...)

# The refusal for a call that names no variables (finding 5). Its example
# line named the call's data frame beside two invented variables; from S339
# it named MyData (voice Rule AC), and since S370 (Fix Slate 18) it is a
# line on community that runs, on a line of its own, as jdesc()'s and
# jrecode()'s are. The names() line is built from the call and keeps the
# data frame it named, unless that was an expression -- names(mk12()) would
# run the call a second time for a throwaway copy's names.
cat("\n--- no variables: a name, then a call ---\n")
try(jdeclare_missing(plain_df, codes = -99))
try(jdeclare_missing(mk12(), codes = -99))

# Expected:
#   Error : jdeclare_missing(): no variables specified.
#   Provide one or more variable names, for example:
#     jdeclare_missing(community, Age, codes = -99, convention = "spss")
#   To apply one declaration to every variable, use vars = names(plain_df).
#   Error : jdeclare_missing(): no variables specified.
#   Provide one or more variable names, for example:
#     jdeclare_missing(community, Age, codes = -99, convention = "spss")
#   To apply one declaration to every variable, use vars = names(MyData).

options(.jst_options_missing_convention = "none")
rm(mk12, mkc12, lst12, d12a, d12b, d12c)

# Things to look at:
#   - "The result is kept only if you assign it to a name:" over
#     "mydata <- jdeclare_missing(mk12(), Rating, ...)". mydata is the
#     name the modify = TRUE refusal already uses for the same advice.
#     Does it read as a placeholder to replace?
#   - No modify = TRUE line follows either of the first two: there is no
#     name for it to write to.
#   - THE PLACE: lst12$d gets its own assignment line and no modify line.
#     Running that line with the "..." filled in does land the declaration
#     in the list (missing_convention_check.R N81ag runs it).
#   - THE REFUSAL, both runs (S370): "no variables specified." and a line
#     on community, which runs; then "names(plain_df)" in the first and
#     "names(MyData)" in the second. Does the community line sit well above
#     a names() line built from your own data frame?


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 13 -- jload() and jsave() given something that is not a file ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S351 (v0.9.224; Fix Slate 6). What each front door says when the
# argument it reads first is not a file name. Before 0.9.224:
#     jload(mydata.sav)         R's own "object 'mydata.sav' not found"
#     jload(community)          "Provide a filename, e.g. jload("mydata.sav")"
#     jload(d13)                the same, of a data frame already loaded
#     jload(system.file(...))   the same, of a call that found no file
#     jsave("t13.rds")          "... Did you mean to use it as a variable
#                               name?" (no default set)
#     jsave(z13, "x13.rds")     "'z13' is a integer, not a data frame."
#     a file name starting      "R does not allow variable names to start
#       with a digit            with a digit" (said of the DATA FRAME's name)
#     jload("x.RData")          ".RData files contain multiple named objects"
.wd13 <- getwd(); setwd(.walkdir)
writeLines(c("x", "1", "2"), "zz13.csv")
writeLines(c("x", "1"), "2024zz13.csv")
d13 <- data.frame(a = 1:3)
save(d13, file = "x13.RData")   # S374: the redirect is for a file that exists
p13 <- ""
z13 <- 1:3
.def13 <- getOption(".jst_default_data"); options(.jst_default_data = NULL)

cat("--- a file name without its quotes ---\n")
try(jload(zz13.csv))
# Expected:
#   Error : jload(): zz13.csv is not in quotes.
#   A file name goes in quotes:
#     jload("zz13.csv")

cat("\n--- a shipped dataset's name without its quotes ---\n")
try(jload(community))
# Expected:
#   Error : jload(): the name of the community dataset goes in quotes:
#     jload("community")

cat("\n--- a data frame already in the workspace ---\n")
try(jload(d13))
# Expected:
#   Error : jload(): the d13 data frame is already loaded.
#   To save it to a file:
#     jsave(d13, "d13.rds")

cat("\n--- an empty string from a variable, then from system.file() ---\n")
try(jload(p13))
try(jload(system.file("extdata", "zz13.csv", package = "jstats")))
# Expected:
#   Error : jload(): p13 is "", an empty file name.
#   Error : jload(): system.file("extdata", "zz13.csv", package = "jstats") is
#   "", an empty file name.
#   system.file() gives "" when the file is not in the package.

cat("\n--- jsave() given a file name alone, no default set ---\n")
try(jsave("t13.rds"))
# Expected:
#   Error : jsave(): "t13.rds" is a file name, and no data frame was
#   given to save.
#   Name the data frame first:
#     jsave(MyData, "t13.rds")
#   Or set a default first, then run the call:
#     juse(MyData)
#     jsave("t13.rds")

# The walk's workspace holds Setup's four data frames and d13, so the stop
# above names none of them. .ws13 stands in for a console session whose
# workspace holds one data frame, d13: jsave() run in it sees only what it
# holds. Then the same stop for the file named with file =, and for a call
# that also gives overwrite = TRUE.
.ws13 <- new.env(parent = baseenv())
.ws13$d13 <- d13; .ws13$jsave <- jsave
cat("\n--- ... in a workspace holding one data frame; with file =; with overwrite = TRUE ---\n")
try(evalq(jsave("t13.rds"), .ws13))
try(evalq(jsave(file = "t13.rds"), .ws13))
try(evalq(jsave("t13.rds", overwrite = TRUE), .ws13))
# Expected:
#   Error : jsave(): "t13.rds" is a file name, and no data frame was
#   given to save.
#   Name the data frame first:
#     jsave(d13, "t13.rds")
#   Or set a default first, then run the call:
#     juse(d13)
#     jsave("t13.rds")
#   Error : jsave(): no data frame was given to save.
#   Name the data frame first:
#     jsave(d13, file = "t13.rds")
#   Or set a default first, then run the call:
#     juse(d13)
#     jsave(file = "t13.rds")
#   Error : jsave(): "t13.rds" is a file name, and no data frame was
#   given to save.
#   Name the data frame first:
#     jsave(d13, "t13.rds", overwrite = TRUE)
#   Or set a default first, then run the call:
#     juse(d13)
#     jsave("t13.rds", overwrite = TRUE)

cat("\n--- jsave() given a vector; given a name found nowhere ---\n")
try(jsave(z13, "x13.rds"))
try(jsave(d1x, "d13.rds"))
# Expected:
#   Error : jsave(): 'z13' is not a data frame.
#   Provide a data frame, for example:
#     jsave(MyData, "mydata.sav")
#   Error : jsave(): 'd1x' not found.
#   Provide a data frame, for example:
#     jsave(MyData, "d13.rds")

cat("\n--- ... the same two in a workspace holding one data frame ---\n")
.ws13$z13 <- z13
try(evalq(jsave(z13, "x13.rds"), .ws13))
try(evalq(jsave(d1x, "d13.rds"), .ws13))
# Expected:
#   Error : jsave(): 'z13' is not a data frame.
#   Provide a data frame, for example:
#     jsave(d13, "mydata.sav")
#   Error : jsave(): 'd1x' not found.
#   Provide a data frame, for example:
#     jsave(d13, "d13.rds")

cat("\n--- a file name without its quotes; no file name; nothing at all ---\n")
try(jsave(d13, d13.rds))
try(jsave(d13))
try(jsave())
try(evalq(jsave(), .ws13))
# Expected:
#   Error : jsave(): d13.rds is not in quotes.
#   A file name goes in quotes:
#     jsave(d13, "d13.rds")
#   Error : jsave(): Provide a filename with extension, for example:
#     jsave(d13, "mydata.sav")
#   Supported formats:
#     .sav       SPSS
#     .dta       Stata
#     .xpt       SAS interchange
#     .xlsx      Excel
#     .csv       Comma-separated values
#     .rds       R
#   Error : jsave(): no data frame or file name was given.
#   Name the data frame first, then the file:
#     jsave(MyData, "mydata.sav")
#   Or set a default first, then name the file:
#     juse(MyData)
#     jsave("mydata.sav")
#   Error : jsave(): no data frame or file name was given.
#   Name the data frame first, then the file:
#     jsave(d13, "mydata.sav")
#   Or set a default first, then name the file:
#     juse(d13)
#     jsave("mydata.sav")

# A session that cannot ask -- a script run with Rscript -- stops on a file
# that exists. .ws13b holds d13 and a jsave() that sees such a session (its
# interactive() says FALSE); the walk folder is shown as <walk folder>,
# since a temporary folder differs on every run.
saveRDS(d13, "e13.rds")
.ns13 <- new.env(parent = environment(jsave)); .ns13$interactive <- function() FALSE
.ws13b <- new.env(parent = baseenv()); .ws13b$d13 <- d13
.ws13b$jsave <- jsave; environment(.ws13b$jsave) <- .ns13
cat("\n--- a file that exists, where the session cannot ask ---\n")
.m13 <- tryCatch(evalq(jsave(d13, "e13.rds"), .ws13b), error = conditionMessage)
cat("Error : ", gsub(normalizePath(.walkdir, winslash = "/"), "<walk folder>",
                     .m13, fixed = TRUE), "\n", sep = "")
# Expected:
#   Error : jsave(): this file already exists:
#     <walk folder>/e13.rds
#   Use overwrite = TRUE to replace it.

cat("\n--- a name starting with a digit: the file's, then one given with name = ---\n")
try(jload("2024zz13.csv"))
try(jload("zz13.csv", name = "2b"))
# Expected:
#   Error : jload(): The filename '2024zz13.csv' starts with a number.
#   R does not allow a data frame's name to start with a digit.
#   Provide a name, for example:
#     jload("2024zz13.csv", name = "X2024zz13")
#   Error : jload(): The name '2b' starts with a number.
#   R does not allow a data frame's name to start with a digit.
#   Provide a name, for example:
#     jload("zz13.csv", name = "X2b")

cat("\n--- an .RData file ---\n")
try(jload("x13.RData"))
# Expected:
#   Error : jload(): x13.RData is an .RData file, which jstats does not load.
#   Load it with base R:
#     load("x13.RData")

cat("\n--- an .RData file that does not exist (S374) ---\n")
try(jload("nofile13.RData"))
# Expected:
#   Error : jload(): File 'nofile13.RData' not found.
#   Searched in: working directory
#   Check that the filename and extension are correct.

cat("\n--- an empty file name; a data frame given as an expression ---\n")
try(jload(""))
try(jload(d13[1:2, , drop = FALSE]))
# Expected:
#   Error : jload(): Provide a filename, for example:
#     jload("mydata.sav")
#   Error : jload(): d13[1:2, , drop = FALSE] is a data frame, not a file name.
#   Provide a filename, for example:
#     jload("mydata.sav")

cat("\n--- jsave() with a default set, the data omitted, a second argument unnamed ---\n")
options(.jst_default_data = "d13")
try(jsave("t13.rds", TRUE))
options(.jst_default_data = NULL)
# Expected:
#   Error : jsave(): when the data argument is omitted, all subsequent arguments
#   must be named.
#   Name them, for example:
#     jsave(file = "mydata.sav", overwrite = TRUE)

options(.jst_default_data = .def13)
setwd(.wd13)
rm(.wd13, .def13, .ws13, .ws13b, .ns13, .m13, d13, p13, z13)

# Things to look at:
#   - EACH LINE THAT IS OFFERED RUNS (missing_convention_check.R N86a-c and
#     N86j run them): jload("zz13.csv") loads the file, jload("community")
#     the shipped dataset, jsave(d13, "d13.rds") writes the frame.
#   - The subject of each first line is what was typed: zz13.csv, p13,
#     the system.file() call (voice Rules AD and T: a data frame is "the
#     d13 data frame", never a bare name opening the sentence).
#   - jsave("t13.rds") with a default set still saves the default, as it
#     always did (N86h); this message is for no default only.
#   - "jload(""): Provide a filename" -- an empty string TYPED as such --
#     keeps the generic stop (N86f); only an expression that came out empty
#     is named.
#   - THE NAME A DIGIT IS OFFERED (S366, v0.9.238; Fix Slate 13): the one
#     the cleaner gives, an X before the digit -- X2024zz13, X2b -- where
#     the digits had been stripped (zz13, b), which offered name = "" for
#     a file named only with digits (import_check.R T01-T02).
#   - BOTH ROUTES (S367, v0.9.239; Fix Slate 14, the lean okayed at S366):
#     jsave() given a file name alone, no default set, offers the default
#     route under the first, as the analysis functions' stop for the same
#     condition does ("Or set a default first, then run the call:"). The
#     data frame named is the one data frame in the workspace, else MyData:
#     MyData in the walk's workspace, which holds five; d13 in .ws13, which
#     holds d13 alone. Does the stand-in read as a console session with one
#     data frame?
#   - FILE = AND THE CALL'S OTHER ARGUMENTS (S367; Claude's call):
#     jsave(file = "t13.rds") gets the same stop, its first line "no data
#     frame was given to save." -- it had reached the resolver's "No data
#     frame specified and no default set. Use juse() to set a default.",
#     the one route the stop above lacked -- and both lines keep file =
#     and overwrite = TRUE, as jload()'s lines keep the call since S365
#     (import_check.R U08-U12; missing_convention_check.R N86g re-pinned).
#   - THE EXAMPLE ON A LINE OF ITS OWN (S368, v0.9.240; Fix Slate 15,
#     Claude's call): jsave() given a vector, or a name found nowhere,
#     said "Provide a data frame, e.g. jsave(MyData, "mydata.sav")" on the
#     line of the sentence before it. "Provide a data frame, for example:"
#     now has a line of its own and the call one under it (Rules E and L),
#     naming the one data frame in the workspace: MyData in the walk's,
#     d13 in .ws13. Under the stop for a name found nowhere -- most often
#     a misspelled data frame -- the call keeps the file the call named
#     (d13.rds); an object that is not a data frame gets the example file.
#     Does keeping the file read as the fix for a typo?
#   - A FILE NAME WITHOUT ITS QUOTES (S368): jload()'s pointer (ruling
#     R18), the call as typed with the name quoted, where it said "'d13.rds'
#     is not quoted. Filenames must be in quotes, e.g. jsave(d13,
#     "d13.rds")" on one line. No file name: the example under its sentence,
#     naming d13, then the formats.
#   - NOTHING AT ALL (S368): jsave() with no data frame, no file and no
#     default would have been offered jsave(MyData) by the resolver's new
#     two routes (filter_walk.R G6), which stops again for want of a file.
#     It gets both routes with the example file, under "Name the data frame
#     first, then the file:" and "Or set a default first, then name the
#     file:" -- MyData in the walk's workspace, d13 in .ws13.
#   - THE LAST TWO "e.g." STOPS (S369, v0.9.241; Fix Slate 16, Claude's
#     call): jload("") and jload() given a data frame as an expression said
#     "Provide a filename, e.g. jload("mydata.sav")" on one line, the
#     sentence before it on the line above. The example now has a line of
#     its own under "Provide a filename, for example:", as jsave()'s does
#     (missing_convention_check.R N86f and N86bg).
#   - THE DATA OMITTED, A SECOND ARGUMENT UNNAMED (S369): jsave("t13.rds",
#     TRUE) with a default set said "when the data argument is omitted, all
#     subsequent arguments must be named. Use jsave(file =
#     "yourfile.ext")" -- two sentences and an inline call run together.
#     One sentence a line, then "Name them, for example:" and a call that
#     names the file and an argument after it (filter_check.R AD01). Does
#     overwrite = TRUE make the point, or would the file alone do?
#   - A FILE THAT EXISTS (S368): one sentence a line, the path on a line of
#     its own (Rules E and Z), where "File '<path>' already exists. Use
#     overwrite = TRUE to replace it." put both sentences and the path on
#     one line, so a long path made a long line. A session that asks asks
#     its question instead, unchanged (import_check.R U04, V01-V02).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 14 -- a path typed with single backslashes ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S351 (v0.9.224; the S343 item, Jeff's decision: "Let's do the
# version 1", the forward-slash form alone). Inside quoted text R reads a
# backslash and the letter after it as one special character, so
# "V:\temp\new.csv" reaches jload() holding a tab and a new line, and was
# reported as a file not found -- under a name the user never typed. Now
# jload(), jsave() and joptions(data.dir = ) stop first. An ILLEGAL escape
# (a backslash before 5, U or J) stops R itself before any function runs;
# that is the guides' Troubleshooting entry.
.wd14 <- getwd(); setwd(.walkdir)
dir.create("zz14", showWarnings = FALSE)
writeLines(c("x", "1"), file.path("zz14", "temp14.csv"))

cat("--- jload(), then jsave(), then joptions(data.dir = ) ---\n")
try(jload("V:\temp\new.csv"))
try(jsave(spss_df, "V:\temp\new.csv"))
try(joptions(data.dir = "Proj\temp"))
# Expected:
#   Error : jload(): R read the single backslashes in "V:\temp\new.csv" as
#   special characters (\t as a tab, \n as a new line).
#   Write the path with forward slashes:
#     "V:/temp/new.csv"
#   Error : jsave(): R read the single backslashes in "V:\temp\new.csv" as
#   special characters (\t as a tab, \n as a new line).
#   Write the path with forward slashes:
#     "V:/temp/new.csv"
#   Error : joptions(): R read the single backslash in "Proj\temp" as a special
#   character (\t as a tab).
#   Write the folder with forward slashes:
#     "Proj/temp"

cat("\n--- a character no letter maps back to ---\n")
try(jload("C:\1data.csv"))
# Expected:
#   Error : jload(): R read a single backslash in "C:\001data.csv" as a
#   special character.
#   Type the path again with forward slashes in place of the backslashes.

cat("\n--- the path it offers is the file meant ---\n")
try(jload("zz14\temp14.csv"))
jload("zz14/temp14.csv", name = "t14", overwrite = TRUE)
# Expected:
#   Error : jload(): R read the single backslash in "zz14\temp14.csv" as a
#   special character (\t as a tab).
#   Write the path with forward slashes:
#     "zz14/temp14.csv"
#   Loaded t14 (CSV format; 1 case, 1 variable)

setwd(.wd14)
rm(.wd14, t14)

# Things to look at:
#   - The path inside the first sentence is the path as R HOLDS it, written
#     back with its escapes ("V:\temp\new.csv"), which is what was typed;
#     the parenthesis says what each made of it.
#   - The second line offers the path alone, quoted, not a whole call: the
#     call's other arguments are the user's to keep.
#   - joptions(): "the single backslash ... a special character" -- one
#     backslash, the singular. Nothing was set, no folder was made (N86p).
#   - "C:\1data.csv": a backslash before a digit is an octal escape, and
#     \1, \01 and \001 make the same character, so no path can be offered;
#     the instruction alone.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 15 -- a frame holding a text variable with declared missing values ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S351 (v0.9.224; the S340 item). jconvert(to = "stata") refuses a
# text variable with declared missing values since v0.9.214 -- a marker is
# a kind of NA in a NUMERIC variable -- so every message that offered the
# whole-frame conversion printed a line that stopped: the load narrative's
# Cases 4, 6 and 7, jsave()'s .dta refusal (both tiers) and its .sav
# over-limit refusal. Each now offers what runs: the text variable's
# declared values made plain NA, then the rest converted, with one sentence
# saying so (the Case 1 line has offered to = "baseR" since v0.9.214); the
# .dta refusal adds jencode(), which keeps them; the over-limit refusal
# drops its Stata route, whose "also keeping all the codes" would be false.
# Visits is a labelled INTEGER (the S350 lesson).
ds15 <- data.frame(
  Source = haven::labelled_spss(c("web", "phone", "X", "web", "Y", "mail"),
                                labels = c(Refused = "X", `Don't know` = "Y"),
                                na_values = c("X", "Y")),
  Income = haven::labelled_spss(c(42000, 51000, -99, 38000, -98, 61000),
                                labels = c(Refused = -99, `Don't know` = -98),
                                na_values = c(-99, -98)),
  Visits = haven::labelled_spss(c(2L, 4L, -99L, 1L, 3L, 2L),
                                labels = c(Refused = -99L), na_values = -99L))
mx15 <- ds15
mx15$Mood <- haven::labelled(c(3, 4, haven::tagged_na("a"), 2, 1, 3),
                             labels = c(Refused = haven::tagged_na("a")))
oc15 <- data.frame(Source = ds15$Source,
                   Rating = haven::labelled_spss(c(1, 2, -99, -98, -97, -96),
                                                 labels = c(a = -99, b = -98, c = -97, d = -96),
                                                 na_values = c(-99, -98, -97, -96)))
f15  <- file.path(.walkdir, "ds15.rds"); saveRDS(ds15, f15)
fm15 <- file.path(.walkdir, "mx15.rds"); saveRDS(mx15, fm15)

cat("--- Case 4: the setting says \"stata\" ---\n")
joptions(missing.convention = "stata", quiet = TRUE)
jload(f15, name = "ds15", overwrite = TRUE, missing.notice = TRUE)
# Expected:
#   Loaded ds15 (R format; 6 cases, 3 variables)
#
#   3 variables have SPSS-style missing values:
#     Source: X ["Refused"], Y ["Don't know"]
#     Income: -99 ["Refused"], -98 ["Don't know"]
#     Visits: -99 ["Refused"]
#   Note: these variables are SPSS-style, but your missing.convention setting
#   is "stata".
#   To use SPSS-style missing values, run:
#     joptions(missing.convention = "spss")
#   To use Stata-style missing values, run both:
#     jconvert(ds15, vars = "Source", to = "baseR", modify = TRUE)
#     jconvert(ds15, to = "stata", modify = TRUE)
#   Source is text, so the first line makes its declared values plain NA.

cat("\n--- ... and its two lines, run ---\n")
jconvert(ds15, to = "baseR", vars = "Source", modify = TRUE)
jconvert(ds15, to = "stata", modify = TRUE)
# Expected:
#   Stripped the missing-value declarations from 1 variable:
#     Source  X ["Refused"]
#             Y ["Don't know"]
#
#   To keep it across sessions, save the data frame:
#     jsave(ds15, "ds15.rds")
#   Converted to Stata-style missing values in 2 variables:
#     Income  -99 ["Refused"]     -> .a
#             -98 ["Don't know"]  -> .b
#     Visits  -99 ["Refused"]     -> .a
#
#   To keep it across sessions, save the data frame:
#     jsave(ds15, "ds15.rds")

cat("\n--- Case 7: the setting says \"spss\", the frame holds a Stata-style variable ---\n")
joptions(missing.convention = "spss", quiet = TRUE)
jload(fm15, name = "mx15", overwrite = TRUE, missing.notice = TRUE)
# Expected:
#   Loaded mx15 (R format; 6 cases, 4 variables)
#
#   4 variables have missing values (3 SPSS-style, 1 Stata-style):
#     Source: X ["Refused"], Y ["Don't know"]
#     Income: -99 ["Refused"], -98 ["Don't know"]
#     Visits: -99 ["Refused"]
#     Mood: .a ["Refused"]
#   Note: Mood is Stata-style, but your missing.convention setting is "spss".
#   To use SPSS-style missing values throughout, run:
#     jconvert(mx15, to = "spss", modify = TRUE)
#   To use Stata-style missing values throughout, run all three:
#     jconvert(mx15, vars = "Source", to = "baseR", modify = TRUE)
#     jconvert(mx15, to = "stata", modify = TRUE)
#     joptions(missing.convention = "stata")
#   Source is text, so the first line makes its declared values plain NA.

cat("\n--- Case 6: no setting ---\n")
joptions(missing.convention = "none", quiet = TRUE)
jload(fm15, name = "mx15", overwrite = TRUE, missing.notice = TRUE)
# Expected:
#   Loaded mx15 (R format; 6 cases, 4 variables)
#
#   4 variables have missing values (3 SPSS-style, 1 Stata-style):
#     Source: X ["Refused"], Y ["Don't know"]
#     Income: -99 ["Refused"], -98 ["Don't know"]
#     Visits: -99 ["Refused"]
#     Mood: .a ["Refused"]
#   Note: the mx15 data frame mixes SPSS-style and Stata-style missing values.
#   To use SPSS-style throughout, run both:
#     jconvert(mx15, to = "spss", modify = TRUE)
#     joptions(missing.convention = "spss")
#   To use Stata-style throughout, run all three:
#     jconvert(mx15, vars = "Source", to = "baseR", modify = TRUE)
#     jconvert(mx15, to = "stata", modify = TRUE)
#     joptions(missing.convention = "stata")
#   Source is text, so the first line makes its declared values plain NA.

# RE-PINNED S361 (v0.9.234; the S218 item): the .dta and .sav refusals end
# on the save that blanks the values, "Or save every declared missing value
# as plain NA instead:", whose line names the file as typed, so these saves
# now run in the walk's folder by name (they gave a temporary path).
cat("\n--- jsave() to Stata format, standard then minimal ---\n")
ds15 <- readRDS(f15)
.wd15 <- getwd(); setwd(.walkdir)
try(jsave(ds15, "ds15.dta"))
joutput("minimal", quiet = TRUE)
try(jsave(ds15, "ds15.dta"))
joutput(NULL, quiet = TRUE)
# Expected:
#   Error : jsave(): 3 variables carry SPSS-style missing values, incompatible
#   with the .dta format:
#     Source, Income, Visits
#
#   Before saving to Stata format, run both:
#     jconvert(ds15, vars = "Source", to = "baseR", modify = TRUE)
#     jconvert(ds15, to = "stata", modify = TRUE)
#   Source is text, so the first line makes its declared values plain NA.
#   Or turn it into a numeric variable first with jencode().
#   Or save every declared missing value as plain NA instead:
#     jsave(ds15, "ds15.dta", preserve.declarations = FALSE)
#   Error : jsave(): 3 variables carry SPSS-style missing values, incompatible
#   with the .dta format.
#   Convert first, then save again:
#     jconvert(ds15, vars = "Source", to = "baseR", modify = TRUE)
#     jconvert(ds15, to = "stata", modify = TRUE)
#   Source is text, so the first line makes its declared values plain NA.
#   Or save every declared missing value as plain NA instead:
#     jsave(ds15, "ds15.dta", preserve.declarations = FALSE)

cat("\n--- jsave() to SPSS format, more codes than it allows, standard then minimal ---\n")
try(jsave(oc15, "oc15.sav"))
joutput("minimal", quiet = TRUE)
try(jsave(oc15, "oc15.sav"))
joutput(NULL, quiet = TRUE)
setwd(.wd15)
# Expected:
#   Error : jsave(): SPSS format (.sav) allows at most 3 declared missing values
#   per variable, or a range plus one code.
#
#   This variable in oc15 has more:
#     Rating: 4 codes
#
#   To save in R format (.rds) instead, keeping all the codes:
#     jsave(oc15, "oc15.rds")
#   To save as SPSS format (.sav) with every declared missing value as plain NA:
#     jsave(oc15, "oc15.sav", preserve.declarations = FALSE)
#   Or reduce each variable's declared missing values to fit.
#   Error : jsave(): 1 variable has more declared missing values than SPSS
#   format (.sav) allows (at most 3, or a range plus one).
#   Save as R format (.rds) to keep all the codes, or reduce them first.
#   Or save every declared missing value as plain NA instead:
#     jsave(oc15, "oc15.sav", preserve.declarations = FALSE)

cat("\n--- jsave() to CSV format ---\n")
.wd15 <- getwd(); setwd(.walkdir)
jsave(ds15, "ds15.csv", overwrite = TRUE)
setwd(.wd15)
# Expected:
#   Note: CSV format (.csv) does not store variable labels, value labels, or
#   missing-value metadata.
#   The declared missing values of Source ("X" and "Y"), Income (-99 and -98),
#   and Visits (-99) are written as ordinary values and will read back as
#   valid data.
#   To write them as empty cells instead, save with:

options(.jst_options_missing_convention = "none")
rm(ds15, mx15, oc15, f15, fm15, .wd15)

# The Saved line names a temporary folder, which differs on every run, so
# no Expected above pins it. Since S359 the CSV note ends on the call to
# run, jsave(ds15, "<the full path>/ds15.csv", overwrite = TRUE,
# preserve.declarations = FALSE), whose path is that folder too; the
# Expected stops at "save with:".
#
# Things to look at:
#   - CASE 4: the SPSS remedy is unchanged; the Stata one is the two lines
#     and the sentence under them. Read them as a pair, as Section 2 asks:
#     does the sentence read as belonging to the Stata route only?
#   - THE TWO LINES, RUN: the first strips Source's declarations, the
#     second converts Income and Visits (the integer converts too). No
#     "Skipped (value labels suggest missingness ...)" report on Source:
#     under to = "stata" or "sas" jconvert() leaves a text variable out of
#     that report now, since declaring it would only lead back to the
#     refusal (N86ax; under to = "spss" it still reports, N86ay).
#   - CASE 7 and CASE 6: "run all three:" -- the two lines and the
#     joptions() rider. Three different calls in sequence, so all three
#     are listed (voice Rule U's repeated-remedy cap is for ONE call
#     repeated).
#   - THE .dta REFUSAL ends on "Or turn it into a numeric variable first
#     with jencode()." at the standard tier only.
#   - THE .sav REFUSAL offers .rds and "reduce": no Stata route.
#   - THE CSV NOTE (S359) names each variable whose cells hold a declared
#     code, with the codes held: Source's in quotes, so "ordinary values";
#     then "save with:" and the call to run, ds15 and the full path of the
#     file just written (missing_convention_check.R N93).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 16 -- a text variable's missing cells across a save (ruling R13) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S351 (v0.9.224). Ruling R13 (Jeff, S345: "yes to your
# recommendations for R13"): SPSS, Stata and CSV formats have no missing
# value for text, so a text variable's NA is saved as blank text and comes
# back as the <blank> category, counted valid; jsave() says so, jload() does
# not change. The SAS interchange format (.xpt) and a factor in a CSV file
# lose the same way (Jeff's lean, S351). And a CSV file of ONE column lost
# its missing rows altogether (the S345 item): an empty cell there is an
# empty line, which read.csv() skips -- 8 cases saved, 6 loaded. jload()
# now keeps the empty lines of a one-column file. RE-PINNED S389 under
# ruling R34 (Section 39): a sheet's empty cell is read as blank text too,
# so the notes' last line names R format (.rds) alone.
.wd16 <- getwd(); setwd(.walkdir)
tx16 <- data.frame(Source = c("web", NA, "mail", NA),
                   Visits = haven::labelled(c(1L, 2L, NA, 1L), labels = c(Once = 1L)),
                   Score  = c(1.5, NA, 2, 3),
                   stringsAsFactors = FALSE)
fc16 <- data.frame(Group = factor(c("a", NA, "b")), Source = c(NA, "x", NA),
                   stringsAsFactors = FALSE)
v16  <- data.frame(Source = c("web", "phone", NA, "web", "mail", NA, "web", "phone"))

cat("--- SPSS, Stata and SAS interchange formats ---\n")
jsave(tx16, "tx16.sav", overwrite = TRUE)
# Expected:
#   Note: SPSS format (.sav) cannot store a missing value in a text variable.
#   2 missing cells in Source were saved as blank text.
#   R format (.rds) keeps them missing.
jsave(tx16, "tx16.dta", overwrite = TRUE)
# Expected:
#   Note: Stata format (.dta) cannot store a missing value in a text variable.
#   2 missing cells in Source were saved as blank text.
#   R format (.rds) keeps them missing.
jsave(tx16, "tx16.xpt", overwrite = TRUE)
# Expected:
#   Note: SAS interchange format (.xpt) cannot store a missing value in a
#   text variable.
#   2 missing cells in Source were saved as blank text.
#   R format (.rds) keeps them missing.

cat("\n--- CSV format, a factor beside the text variable ---\n")
jsave(fc16, "fc16.csv", overwrite = TRUE)
# Expected:
#   Note: CSV format (.csv) cannot store a missing value in a text or
#   categorical variable.
#   3 missing cells in Group (1) and Source (2) were saved as blank text.
#   R format (.rds) keeps them missing.

cat("\n--- one cell ---\n")
jsave(data.frame(Source = c("web", NA)), "one16.sav", overwrite = TRUE)
# Expected:
#   Note: SPSS format (.sav) cannot store a missing value in a text variable.
#   1 missing cell in Source was saved as blank text.
#   R format (.rds) keeps it missing.

cat("\n--- the .sav file read back ---\n")
jload("tx16.sav", name = "b16", overwrite = TRUE)
jfreq(b16, Source)
# Expected:
#   Loaded b16 (SPSS format; 4 cases, 3 variables)
#   Frequencies
#
#   4 Cases in the 1 Variable Pool
#
#   Source
#
#            Freq  Total %  Valid %  Cum. %
#   -------  ----  -------  -------  ------
#   <blank>    2     50.00   50.00    50.00
#   mail       1     25.00   25.00    75.00
#   web        1     25.00   25.00   100.00
#
#   Total      4    100.00
#   <blank>: 2 cells with no text.
#   They are counted as valid values, not as missing.
#   To give them a code, use jencode().
#   To declare them missing, use jdeclare_missing() with codes = "".

cat("\n--- a CSV file of one column, saved and read back ---\n")
jsave(v16, "v16.csv", overwrite = TRUE)
jload("v16.csv", name = "c16", overwrite = TRUE)
jfreq(c16, Source)
# Expected:
#   Loaded c16 (CSV format; 8 cases, 1 variable)
#   Frequencies
#
#   8 Cases in the 1 Variable Pool
#
#   Source
#
#            Freq  Total %  Valid %  Cum. %
#   -------  ----  -------  -------  ------
#   <blank>    2     25.00   25.00    25.00
#   mail       1     12.50   12.50    37.50
#   phone      2     25.00   25.00    62.50
#   web        3     37.50   37.50   100.00
#
#   Total      8    100.00
#   <blank>: 2 cells with no text.
#   They are counted as valid values, not as missing.
#   To give them a code, use jencode().
#   To declare them missing, use jdeclare_missing() with codes = "".

setwd(.wd16)
rm(.wd16, tx16, fc16, v16, b16, c16)

# The Saved lines name a temporary folder and are not pinned.
#
# Things to look at:
#   - THE NOTE, three lines: the format and what it cannot store; the
#     cells, and in which variable; the format that keeps them (two until
#     S389, when ruling R34 took Excel format (.xlsx) out).
#     Visits and Score lose nothing -- a missing NUMBER survives every
#     format -- and are not named.
#   - CSV: this note alone -- fc16 carries no labels, so since S359 no
#     label note comes first; Group (1) and Source (2) with their counts,
#     and "a text or categorical variable".
#   - ONE CELL: "1 missing cell ... was saved", "keep it missing".
#   - READ BACK: jfreq() shows Source's two cells as <blank>, valid, with
#     its footnote -- jload() unchanged, as the ruling says; the note at
#     the save is where the user learns why.
#   - THE ONE-COLUMN FILE: "8 cases" (it read 6 before 0.9.224), the two
#     empty lines back as <blank>.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 17 -- jload()'s Loaded line and the notes around it (ruling R6) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S351 (v0.9.224). THE ONE SECTION WALKED FOR RULING R6 (Jeff, S345:
# a LEADING status line gets a blank line before the first note; the
# Console shows the message stream's blank lines). The Loaded line now sits
# a blank line from a note on either side; the other sections that show a
# load (here 1-3 and 15; missing_convention_walk.R 4-11, 17, 51) changed
# that one way and were re-pinned mechanically. Shown: the narrative under
# it; a registration note and the default-frame note above it; the line
# alone; the shipped dataset's form.
.wd17 <- getwd(); setwd(.walkdir)
reg17 <- spss_df
suppressMessages(jnumeric(reg17, Education))
suppressMessages(jsave(reg17, "reg17.rds", overwrite = TRUE))

cat("--- the narrative under it ---\n")
jload("clinic.rds", name = "r17", overwrite = TRUE, missing.notice = TRUE)
# Expected:
#   Loaded r17 (R format; 4 cases, 2 variables)
#
#   2 variables have SPSS-style missing values:
#     Income: -99 ["Refused"], -98 ["Don't know"]
#     Education: -99 ["Refused"]
#   jstats analyses treat these codes as missing. Base R functions do not.
#   To make them missing in base R as well, convert:
#     jconvert(r17, to = "stata", modify = TRUE)

cat("\n--- notes above it: a registration restored, the default set ---\n")
jload("reg17.rds", name = "s17", overwrite = TRUE, use = TRUE, missing.notice = FALSE)
# Expected:
#   Restored the classification registrations saved with this file (saved
#   under 'reg17').
#
#   Default data frame set to: s17
#
#   Loaded s17 (R format; 4 cases, 2 variables)

cat("\n--- the line alone ---\n")
jload("clinic.rds", name = "r17", overwrite = TRUE, missing.notice = FALSE)
# Expected:
#   Loaded r17 (R format; 4 cases, 2 variables)

cat("\n--- the shipped dataset ---\n")
jload("community", name = "c17", package = TRUE, overwrite = TRUE,
      missing.notice = TRUE)
# Expected:
#   Loaded the jstats example dataset 'community'
#
#   5 variables have SPSS-style missing values:
#     Income: -99 ["Refused"], -98 ["Don't know"]
#     Education: -99 ["Refused"], -98 ["Don't know"]
#     Smoker: -99 ["Refused"]
#     Environment1: -99 ["Refused"], -98 ["Don't know"]
#     Environment3: -99 ["Refused"], -98 ["Don't know"]
#   jstats analyses treat these codes as missing. Base R functions do not.
#   To make them missing in base R as well, convert:
#     jconvert(c17, to = "stata", modify = TRUE)

options(.jst_default_data = NULL)
suppressMessages(jnumeric(reg17, NULL)); suppressMessages(jnumeric(s17, NULL))
setwd(.wd17)
rm(.wd17, reg17, r17, s17, c17)

# Things to look at:
#   - ONE blank line between the Loaded line and the narrative's first
#     line, and one between each note above it and the next. Between the
#     narrative's inventory and its own Note: block there is still none
#     (S237): that is one message, not two.
#   - The line alone ends the output: no blank line after it.
#   - Is the gap above the Loaded line right as well? The ruling spoke of
#     a LEADING status line; with notes above it, this build treats it the
#     same way on both sides.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 18 -- Case 7 on a wider frame: a count past three names ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S351 (v0.9.224; the S294 item). Case 7's note named every
# off-setting variable ahead of its verb, ten and "... and 2 more" on a wide
# frame. Past three it now gives a count, as Case 4's "these variables"
# leans on the inventory just above; three or fewer keep their names
# (three is the durability reminder's limit, S339).
w18 <- data.frame(Income = spss_df$Income)
for (v18 in c("Q1", "Q2", "Q3", "Q4")) {
  w18[[v18]] <- haven::labelled(c(3, 4, haven::tagged_na("a"), 2),
                                labels = c(Refused = haven::tagged_na("a")))
}
fw18  <- file.path(.walkdir, "w18.rds");  saveRDS(w18, fw18)
fw18b <- file.path(.walkdir, "w18b.rds"); saveRDS(w18[1:4], fw18b)
joptions(missing.convention = "spss", quiet = TRUE)

cat("--- four Stata-style variables ---\n")
jload(fw18, name = "w18", overwrite = TRUE, missing.notice = TRUE)
# Expected:
#   Loaded w18 (R format; 4 cases, 5 variables)
#
#   5 variables have missing values (1 SPSS-style, 4 Stata-style):
#     Income: -99 ["Refused"], -98 ["Don't know"]
#     Q1: .a ["Refused"]
#     Q2: .a ["Refused"]
#     Q3: .a ["Refused"]
#     Q4: .a ["Refused"]
#   Note: 4 variables are Stata-style, but your missing.convention setting
#   is "spss".
#   To use SPSS-style missing values throughout, run:
#     jconvert(w18, to = "spss", modify = TRUE)
#   To use Stata-style missing values throughout, run both:
#     jconvert(w18, to = "stata", modify = TRUE)
#     joptions(missing.convention = "stata")

cat("\n--- three ---\n")
jload(fw18b, name = "w18b", overwrite = TRUE, missing.notice = TRUE)
# Expected:
#   Loaded w18b (R format; 4 cases, 4 variables)
#
#   4 variables have missing values (1 SPSS-style, 3 Stata-style):
#     Income: -99 ["Refused"], -98 ["Don't know"]
#     Q1: .a ["Refused"]
#     Q2: .a ["Refused"]
#     Q3: .a ["Refused"]
#   Note: Q1, Q2, and Q3 are Stata-style, but your missing.convention setting
#   is "spss".
#   To use SPSS-style missing values throughout, run:
#     jconvert(w18b, to = "spss", modify = TRUE)
#   To use Stata-style missing values throughout, run both:
#     jconvert(w18b, to = "stata", modify = TRUE)
#     joptions(missing.convention = "stata")

options(.jst_options_missing_convention = "none")
rm(w18, w18b, v18, fw18, fw18b)

# Things to look at:
#   - "4 variables are Stata-style": the inventory above lists them.
#   - "Q1, Q2, and Q3 are Stata-style": the names, as before.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 19 -- jsave() given an expression as the data (S352) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S352 (v0.9.225; the S351 item). jsave()'s pre-flight refusals pasted
# the data as typed into their lines: given oc19["X"], the .sav over-limit
# refusal printed jsave(oc19["X"], "oc19["X"].rds"), which does not parse,
# and jconvert(oc19["X"], ..., modify = TRUE), which stops. Each block of
# lines now names mydata and opens on "mydata <- oc19["X"]" -- the S339
# form of every other message given an expression -- and its files are
# named mydata. Section 12 has jdeclare_missing() and jconvert() given an
# expression. The assertion side is missing_convention_check.R N87av-ay.

oc19 <- data.frame(
  X = haven::labelled_spss(c(1, -1, -2, -3, -4), na_values = c(-1, -2, -3, -4)),
  Y = c(1L, 2L, 3L, 4L, 5L))
cx19 <- oc19; cx19$Z <- I(list(1, 2, 3, 4, 5))

# RE-PINNED S361 (v0.9.234; the S218 item): each refusal has one more
# block, the save that blanks the values, opening on mydata too; the saves
# run in the walk's folder by name, so its line names the file as typed.

# Render 1 -- the .sav over-limit refusal: three blocks, each opening on
# mydata.
.wd19 <- getwd(); setwd(.walkdir)
try(jsave(oc19["X"], "oc19.sav"))
# Expected:
#   Error : jsave(): SPSS format (.sav) allows at most 3 declared missing values
#   per variable, or a range plus one code.
#
#   This variable in oc19["X"] has more:
#     X: 4 codes
#
#   To save in R format (.rds) instead, keeping all the codes:
#     mydata <- oc19["X"]
#     jsave(mydata, "mydata.rds")
#   To convert to Stata and save as Stata format (.dta), also keeping all
#   the codes:
#     mydata <- oc19["X"]
#     jconvert(mydata, to = "stata", modify = TRUE)
#     jsave(mydata, "mydata.dta")
#   To save as SPSS format (.sav) with every declared missing value as plain NA:
#     mydata <- oc19["X"]
#     jsave(mydata, "oc19.sav", preserve.declarations = FALSE)
#   Or reduce each variable's declared missing values to fit.

# Render 2 -- two problems at once (a list column and SPSS-style missing
# values) in a .dta file.
try(jsave(cx19[c("X", "Z")], "oc19.dta"))
# Expected:
#   Error : jsave(): cx19[c("X", "Z")] cannot be saved to Stata format (.dta)
#   yet -- 2 things to fix.
#   The fixes shown below work on a copy of your cx19 data frame.
#   Make the copy first:
#     mydata <- cx19[c("X", "Z")]
#
#   [1] 1 column is of a type that Stata format (.dta) cannot store:
#     Z (list)
#
#   complex/list/raw columns have no Stata format (.dta) representation and no
#   sensible automatic conversion. Drop it before saving with:
#     mydata[c("Z")] <- NULL
#
#   [2] 1 variable carries SPSS-style missing values, incompatible with the
#   .dta format:
#     X
#
#   Before saving to Stata format, convert with:
#     jconvert(mydata, to = "stata", modify = TRUE)
#   Or save every declared missing value as plain NA instead:
#     jsave(mydata, "oc19.dta", preserve.declarations = FALSE)
#
#   Fix the above, then save mydata:
#     jsave(mydata, "oc19.dta")
setwd(.wd19)
rm(oc19, cx19, .wd19)

# Things to look at:
#   - Render 1: one problem, whose blocks are alternatives, so each runs on
#     its own and opens on "mydata <- ...";
#   - Render 2: two problems, to be fixed together, so mydata is made once,
#     under the header, and the closing line saves it (ruling S386; Section
#     36 shows it whole);
#   - the sentences above the lines keep the expression as typed
#     ("This variable in oc19["X"] has more:"), as the header does.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 20 -- Fix Slate W2: load, save and jai() wording (S357) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S357 (v0.9.230; Fix Slate W2, eight logged wording items). The ones
# this walk owns, as they now read. Section 3 shows Case 6's note in place,
# opening on "the clinic data frame" (Rule T).
#   Render 1 -- "R format" for .rds, the name the save reminders have used
#   since Session 91 (Jeff, S357: "Rename to R format"). Every other block
#   of this walk that shows a Loaded line was re-pinned to it mechanically.
#   Render 2 -- the shipped dataset's Loaded line ends as the file branch's
#   does, with no period.
#   Render 2b -- Case 4's note agrees with its count: "this variable is"
#   after "1 variable has" (Section 2's frame has two).
#   Render 3 -- the .RData redirect in one voice, typed or bare.
#   Render 4 -- jsave()'s CSV note: one sentence a line, "missing values"
#   where it said "missing-value codes", the blanked count in number.
#   Render 5 -- jai() declined: after a declined REPLACE, only "Nothing was
#   written."; a declined CREATE keeps the line about another folder.
#   Render 6 -- SKILL.md's AI-assistant paragraph, set to the body's width.
# The assertion side is missing_convention_check.R N92a-m.
.wd20 <- getwd(); setwd(.walkdir)
s20 <- data.frame(Income = spss_df$Income, Mood = c(stata_df$Mood, NA))
saveRDS(spss_df["Income"], "s20.rds")

# Render 1 -- an .rds file loaded, and the formats jload() reads.
jload("s20.rds", name = "l20", overwrite = TRUE, missing.notice = FALSE)
try(jload("s20.zzz"))
# Expected:
#   Loaded l20 (R format; 4 cases, 1 variable)
#   Error : jload(): Unsupported file extension '.zzz'. Supported formats:
#     .sav       SPSS
#     .dta       Stata
#     .sas7bdat  SAS
#     .xpt       SAS interchange
#     .xlsx      Excel
#     .xls       Excel (legacy)
#     .csv       Comma-separated values
#     .rds       R

# Render 2 -- the shipped dataset.
jload("community", name = "cm20", package = TRUE, overwrite = TRUE,
      missing.notice = FALSE)
# Expected:
#   Loaded the jstats example dataset 'community'

# Render 2b -- one SPSS-style variable loaded under a stata setting.
joptions(missing.convention = "stata", quiet = TRUE)
jload("s20.rds", name = "l20", overwrite = TRUE, missing.notice = TRUE)
joptions(missing.convention = "none", quiet = TRUE)
# Expected:
#   Loaded l20 (R format; 4 cases, 1 variable)
#
#   1 variable has SPSS-style missing values:
#     Income: -99 ["Refused"], -98 ["Don't know"]
#   Note: this variable is SPSS-style, but your missing.convention setting
#   is "stata".
#   To use SPSS-style missing values, run:
#     joptions(missing.convention = "spss")
#   To use Stata-style missing values, run:
#     jconvert(l20, to = "stata", modify = TRUE)

# Render 3 -- an .RData file, typed with its extension and without.
save(s20, file = "r20.RData")
try(jload("r20.RData"))
try(jload("r20"))
# Expected:
#   Error : jload(): r20.RData is an .RData file, which jstats does not load.
#   Load it with base R:
#     load("r20.RData")
#   Error : jload(): No file found matching 'r20' with any supported extension.
#   r20.RData is an .RData file, which jstats does not load.
#   Load it with base R:
#     load("r20.RData")

# Render 4 -- jsave()'s note for a CSV file: SPSS-style, Stata-style, both,
# and with preserve.declarations = FALSE. (The Saved lines under each name
# a temporary folder; only the notes are pinned. Since S359 the jsave()
# line a note offers names that folder too, so each Expected stops above
# it: under s20a after "mydata <- s20["Income"]", under s20c at "save
# with:", the Stata-style sentence pinned on its own below.)
invisible(jsave(s20["Income"], "s20a.csv", overwrite = TRUE))
# Expected:
#   Note: CSV format (.csv) does not store variable labels, value labels, or
#   missing-value metadata.
#   Income's declared missing values -99 and -98 are written as ordinary numbers
#   and will read back as valid data.
#   To write them as empty cells instead, save with:
#     mydata <- s20["Income"]
invisible(jsave(s20["Mood"], "s20b.csv", overwrite = TRUE))
# Expected:
#   Note: CSV format (.csv) does not store variable labels, value labels, or
#   missing-value metadata.
#   Stata-style missing values (.a, .b, ...) are written as blank cells; the
#   distinction between them is not preserved.
invisible(jsave(s20, "s20c.csv", overwrite = TRUE))
# Expected:
#   Note: CSV format (.csv) does not store variable labels, value labels, or
#   missing-value metadata.
#   Income's declared missing values -99 and -98 are written as ordinary numbers
#   and will read back as valid data.
#   To write them as empty cells instead, save with:
# Expected:
#   Stata-style missing values (.a, .b, ...) are written as blank cells; the
#   distinction between them is not preserved.
invisible(jsave(spss_df["Education"], "s20d.csv", overwrite = TRUE,
                preserve.declarations = FALSE))
# Expected:
#   Note: CSV format (.csv) does not store variable labels or value labels.
#   1 cell holding a declared missing value was blanked
#   (preserve.declarations = FALSE).

# Render 5 -- jai() writing AGENTS.md and SKILL.md, each answered "n" at its
# question. The writers are run as the console runs them, with the question
# answered for you, so the walk asks nothing.
jai20 <- function(fn, answer, skill_dir = NULL) {
  f <- get(fn, envir = asNamespace("jstats"))
  e <- new.env(parent = environment(f))
  e$interactive <- function() TRUE
  e$.jst_jai_confirm <- function(info) answer
  if (!is.null(skill_dir)) e$.jst_skill_default_dir <- function() skill_dir
  environment(f) <- e
  f
}
dir.create("p20", showWarnings = FALSE); dir.create("k20", showWarnings = FALSE)
.wp20 <- setwd("p20")
# AGENTS.md, a new file: declined.
jai20(".jst_jai_project", FALSE)()
# Expected:
#   Nothing was written.
#   To write to a different folder, rerun with path = "<folder>".
# AGENTS.md, its block written, then a replacement declined.
invisible(capture.output(suppressMessages(jai20(".jst_jai_project", TRUE)())))
jai20(".jst_jai_project", FALSE)()
# Expected:
#   Nothing was written.
setwd(.wp20)
# SKILL.md, a new file: declined.
jai20(".jst_jai_machine", FALSE, file.path(.walkdir, "k20"))()
# Expected:
#   Nothing was written.
#   To write to a different folder, rerun with path = "<folder>".
# SKILL.md, one there already: overwriting it declined.
writeLines("old", file.path(.walkdir, "k20", "SKILL.md"))
jai20(".jst_jai_machine", FALSE, file.path(.walkdir, "k20"))()
# Expected:
#   Nothing was written.

# Render 6 -- the paragraph as SKILL.md has it (first), and as AGENTS.md and
# the console have it.
sk20 <- jstats:::.jst_orientation_text("stamp", "machine")
ag20 <- jstats:::.jst_orientation_text("stamp", "standard")
cat(sk20[grep("^jstats is newer", sk20) + 0:3], sep = "\n")
cat("\n")
cat(ag20[grep("^Note for AI assistants", ag20) + 0:3], sep = "\n")
# Expected:
#   jstats is newer than your training data. Do not rely on remembered or
#   inferred jstats syntax. When unsure of a function's arguments, check them
#   with `args()` (for example `args(jdeclare_missing)`) or the function's
#   help page instead of guessing.
#
#   Note for AI assistants: jstats is newer than your training data. Do not
#   rely on remembered or inferred jstats syntax. When unsure of a function's
#   arguments, check them with `args()` (for example `args(jdeclare_missing)`) or
#   the function's help page instead of guessing.

setwd(.wd20)
unlink(file.path(.walkdir, c("p20", "k20")), recursive = TRUE)
rm(.wd20, .wp20, s20, l20, cm20, jai20, sk20, ag20)

# Things to look at:
#   - Render 1: "R format" in the Loaded line and "R" in the list of
#     formats, beside "SPSS" and "Stata".
#   - Render 2: no period after 'community', as in Render 1's Loaded line.
#   - Render 2b: "this variable is SPSS-style", after "1 variable has".
#   - Render 3: the two redirects read the same; the first had said ".RData
#     files can contain multiple named objects. Use load(...) to load these
#     directly."
#   - Render 4: each sentence on its own line; "missing values" throughout;
#     "1 cell holding a declared missing value was blanked". Since S359 the
#     first and third notes name Income and its two codes, and offer the
#     call to run: under s20a after "mydata <- s20["Income"]", the
#     expression given as the data; under s20c with s20 itself, the
#     Stata-style sentence after it.
#   - Render 5: the second and fourth notes are "Nothing was written." alone.
#   - Render 6: SKILL.md's first line runs to the paragraph's width; its
#     words are AGENTS.md's after "Note for AI assistants: ".


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 21 -- jsave(preserve.declarations = FALSE): the saves the pre-flight stopped (S361) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S361 (v0.9.234; the S218 item, decided in principle at S218).
# preserve.declarations = FALSE makes every declared missing value plain NA
# in the file, and it now does so BEFORE the .sav, .dta and .xpt checks, so
# a save they refused for a missing-value form the format cannot hold goes
# ahead -- an explicit instruction, which the no-silent-loss rule allows --
# and a note gives the count after the write. Each refusal offers that save
# beside the conversion (two remedies in opposite directions, voice Rule D's
# equal-standing carve-out); the .xpt refusal's drop route is that save,
# where it was jconvert(to = "baseR", modify = TRUE), which made the values
# NA in the data frame too. Sections 6, 7, 15 and 19 show the same line in
# their refusals. The assertion side is missing_convention_check.R N94r-y.
# (The Saved lines name a temporary folder, so each Expected stops above
# them.)
.wd21 <- getwd(); setwd(.walkdir)
d21 <- data.frame(Income = spss_df$Income, Mood = c(stata_df$Mood, NA))

# Render 1 -- the .dta refusal: the conversion, then the save that blanks them.
try(jsave(d21, "d21.dta", overwrite = TRUE))
# Expected:
#   Error : jsave(): 1 variable carries SPSS-style missing values, incompatible
#   with the .dta format:
#     Income
#
#   Before saving to Stata format, convert with:
#     jconvert(d21, to = "stata", modify = TRUE)
#   Or save every declared missing value as plain NA instead:
#     jsave(d21, "d21.dta", overwrite = TRUE, preserve.declarations = FALSE)

# Render 2 -- that save, run: the note, then the Saved line.
jsave(d21, "d21.dta", overwrite = TRUE, preserve.declarations = FALSE)
# Expected:
#   Note: 3 cells holding declared missing values were blanked
#   (preserve.declarations = FALSE).

# Render 3 -- the file holds no declarations; the data frame still does.
jload("d21.dta", name = "l21", overwrite = TRUE)
attr(d21$Income, "na_values")
# Expected:
#   Loaded l21 (Stata format; 4 cases, 2 variables)
#   [1] -99 -98

# Render 4 -- .xpt, where both forms are refused: the drop route is the save.
try(jsave(d21, "d21.xpt", overwrite = TRUE))
# Expected:
#   Error : jsave(): 2 variables carry missing-value codes, incompatible with
#   the .xpt format:
#     Mood, Income
#
#   To save as .xpt with every declared missing value as plain NA, run:
#     jsave(d21, "d21.xpt", overwrite = TRUE, preserve.declarations = FALSE)
#
#   To preserve these codes, convert them to one form with jconvert() first,
#   then save as SPSS format (.sav) or Stata format (.dta) instead.

# Render 5 -- R format, where the same call had blanked them without a word;
# and a frame whose declared codes no cell holds.
jsave(d21, "d21.rds", overwrite = TRUE, preserve.declarations = FALSE)
# Expected:
#   Note: 3 cells holding declared missing values were blanked
#   (preserve.declarations = FALSE).
z21 <- data.frame(Q = haven::labelled_spss(c(1, 2, 3), na_values = -99))
jsave(z21, "z21.rds", overwrite = TRUE, preserve.declarations = FALSE)
# Expected:
#   Note: no cell held a declared missing value; the declarations were dropped
#   (preserve.declarations = FALSE).
setwd(.wd21)
rm(.wd21, d21, l21, z21)

# Things to look at:
#   - RENDER 1: "Or save every declared missing value as plain NA instead:"
#     -- the conversion keeps them, as Stata-style missing values; this
#     drops which code each was. Do the two read as a choice, neither
#     recommended?
#   - RENDER 2: 3 cells: Income's -99 and -98, and Mood's .a -- a marker is
#     counted too, since what is dropped is which marker it was.
#   - RENDER 3: no narrative on the load (nothing declared), and the data
#     frame's own declaration unchanged: the save blanked the file only.
#   - RENDER 4: one route to drop them, where there were two to choose from.
#   - RENDER 5: the second note, when there was nothing to blank.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 22 -- jload(): the example files, and a variable named T or F (S361) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S361 (v0.9.234). Two load notes. (1) The Session 74 item's second
# half (decided S77 and S107): jstats ships community as three files a
# colleague might send -- community_spss.sav, community_stata.dta and
# community_excel.xlsx -- and jload() now reads one by name when no file of
# that name is on disk, where it took system.file(). A file on disk wins and
# is said to win, with the call that reads the shipped one; package = TRUE
# forces it, as it forces a shipped dataset. (2) The S289 item: at
# joutput("full"), a note on a variable named T or F, which base R code run
# inside the data frame reads in place of TRUE or FALSE. The assertion side
# is missing_convention_check.R N94z-ai.
.wd22 <- getwd(); setwd(.walkdir)
unlink(c("community_spss.sav", "community_stata.dta"))

# Render 1 -- by name, with its extension and without.
jload("community_spss.sav", overwrite = TRUE, missing.notice = FALSE)
jload("community_stata", overwrite = TRUE, missing.notice = FALSE)
# Expected:
#   Reading from the jstats example files
#   Loaded community_spss (SPSS format; 103 cases, 15 variables)
#   Reading from the jstats example files
#   Loaded community_stata (Stata format; 103 cases, 15 variables)

# Render 2 -- a copy of the file on disk: read instead, and the line that
# reads the shipped one, run.
invisible(file.copy(system.file("extdata", "community_spss.sav", package = "jstats"),
                    "community_spss.sav", overwrite = TRUE))
jload("community_spss.sav", overwrite = TRUE, missing.notice = FALSE)
jload("community_spss.sav", package = TRUE, overwrite = TRUE, missing.notice = FALSE)
# Expected:
#   A local file and a jstats example file are both named 'community_spss.sav'.
#   The local file was loaded.
#   To load the example file instead, use:
#     jload("community_spss.sav", package = TRUE)
#   Loaded community_spss (SPSS format; 103 cases, 15 variables)
#   Reading from the jstats example files
#   Loaded community_spss (SPSS format; 103 cases, 15 variables)

# Render 3 -- package = TRUE given a name it does not ship, a dataset's
# name with an extension, and a path.
try(jload("survey.sav", package = TRUE))
try(jload("community.rds", package = TRUE))
try(jload("data/community_spss.sav", package = TRUE))
# Expected:
#   Error : jload(): No jstats example dataset or file named 'survey.sav'.
#   Shipped datasets: clinic, community.
#   Example files: community_excel.xlsx, community_spss.sav,
#   community_stata.dta.
#   Error : jload(): package = TRUE loads a jstats example dataset by its
#   name alone.
#   Drop the extension:
#     jload("community", package = TRUE)
#   Error : jload(): package = TRUE loads a jstats example dataset or file by
#   its name alone.
#   Drop the path:
#     jload("community_spss.sav", package = TRUE)

# Render 4 -- a variable named T, at joutput("full"); at the standard level
# no note.
utils::write.csv(data.frame(T = c(1, 2, 1), Score = c(4, 5, 6)), "tf22.csv",
                 row.names = FALSE)
joutput("full", quiet = TRUE)
jload("tf22.csv", overwrite = TRUE)
joutput(NULL, quiet = TRUE)
# Expected:
#   Loaded tf22 (CSV format; 3 cases, 2 variables)
#
#   Note: T is a variable in tf22.
#   jstats reads it as the variable, but in base R T also stands for TRUE, and
#   code run inside tf22 (with(), subset()) reads the variable in its place.
#   To rename it, replacing newname:
#     names(tf22)[names(tf22) == "T"] <- "newname"
unlink(c("community_spss.sav", "tf22.csv"))
setwd(.wd22)
rm(.wd22, community_spss, community_stata, tf22)

# Things to look at:
#   - RENDER 1: "Reading from the jstats example files" where a data.dir
#     read says "Reading from <folder>", above the usual Loaded line.
#   - RENDER 2: the note before the Loaded line, as the note for a shipped
#     dataset reads; the line it gives runs.
#   - RENDER 3: the names jstats ships, datasets and files, in the refusal.
#   - RENDER 4: the note is advisory, so it shows at "full" only -- is
#     that where it belongs? "jstats reads it as the variable": the S289
#     item feared a clash in a jstats call, which ruling R18 has since
#     ruled out; the clash left is base R's (with(), subset()).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 23 -- jload(): variable names from outside R (ruling R9, ruling R20; S362) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S362 (v0.9.235). Ruling R9 part (1) (Jeff, S345: "Yes to each
# part") with ruling R20 (Jeff, S362, on the import audit's
# recommendation). A file from outside R -- every format but .rds -- can
# hold names R cannot use as they are. Each is changed by one rule:
# spaces and symbols at either end dropped, any other run of characters
# that are not letters, digits or underscores one underscore, an X before a
# digit, an underscore or a word R reserves, V and the column's position
# for an empty name, _2 for a repeat, 32 characters at most. A name R takes
# is never touched. The old name becomes the variable's label unless it has
# one, and a note lists every change. Until now Excel kept the names as
# typed (backticks in every call) and read.csv() rewrote them its own way
# (X2024.score, Age..years.), neither said. The assertion side is
# import_check.R sections A-E.
.wd23 <- getwd(); setwd(.walkdir)
d23 <- data.frame(1:2, 3:4, 5:6, 7:8, 9:10, 11:12, 13:14, 15:16)
names(d23) <- c("2024 score", "Age (years)", "Agree?", "Score", "Score", "",
                "if", "id")
writexl::write_xlsx(d23, "names23.xlsx")
writeLines(c("\"2024 score\",\"Age (years)\",\"Agree?\",Score,Score,,if,id",
             "1,3,5,7,9,11,13,15", "2,4,6,8,10,12,14,16"), "names23.csv")

# Render 1 -- an Excel file: the note under the Loaded line.
jload("names23.xlsx", name = "x23", overwrite = TRUE)
# Expected:
#   Loaded x23 (Excel format; 2 cases, 8 variables)
#
#   Note: 6 variable names were changed to valid R names:
#     "2024 score"   -> X2024_score
#     "Age (years)"  -> Age_years
#     "Agree?"       -> Agree
#     "Score"        -> Score_2
#     ""             -> V6
#     "if"           -> Xif
#   The original names are the variables' labels.

# Render 2 -- the same headers in a CSV file: the same names (identical()
# prints TRUE), where read.csv() gave X2024.score and Age..years.
jload("names23.csv", name = "c23", overwrite = TRUE)
identical(names(c23), names(x23))
# Expected:
#   Loaded c23 (CSV format; 2 cases, 8 variables)
#
#   Note: 6 variable names were changed to valid R names:
#     "2024 score"   -> X2024_score
#     "Age (years)"  -> Age_years
#     "Agree?"       -> Agree
#     "Score"        -> Score_2
#     ""             -> V6
#     "if"           -> Xif
#   The original names are the variables' labels.
#   [1] TRUE

# Render 3 -- an SPSS file whose names SPSS takes and R does not; one has
# a label of its own, which it keeps.
s23 <- data.frame(`Q1@A` = c(1, 2), `INC$` = c(3, 4), check.names = FALSE)
attr(s23[["Q1@A"]], "label") <- "Q1 part A"
haven::write_sav(s23, "names23.sav")
jload("names23.sav", name = "v23", overwrite = TRUE)
# Expected:
#   Loaded v23 (SPSS format; 2 cases, 2 variables)
#
#   Note: 2 variable names were changed to valid R names:
#     "Q1@A"  -> Q1_A
#     "INC$"  -> INC
#   A variable with no label of its own has its original name as its label.

# Render 4 -- an .rds file comes back as it was saved: no note, the names
# as they were (R9's exemption; the S345 student case).
saveRDS(d23[c(1, 2)], "own23.rds")
jload("own23.rds", name = "r23", overwrite = TRUE)
names(r23)
# Expected:
#   Loaded r23 (R format; 2 cases, 2 variables)
#   [1] "2024 score"  "Age (years)"

# Render 5 -- the data frame's own name, from a file's name: underscores,
# as the variables get, where make.names() gave My.Survey..final.
invisible(file.copy("names23.xlsx", "My Survey (final).xlsx", overwrite = TRUE))
jload("My Survey (final).xlsx", overwrite = TRUE)
# Expected:
#   Loaded My_Survey_final (Excel format; 2 cases, 8 variables)
#
#   Note: 6 variable names were changed to valid R names:
#     "2024 score"   -> X2024_score
#     "Age (years)"  -> Age_years
#     "Agree?"       -> Agree
#     "Score"        -> Score_2
#     ""             -> V6
#     "if"           -> Xif
#   The original names are the variables' labels.
unlink(c("names23.xlsx", "names23.csv", "names23.sav", "own23.rds",
         "My Survey (final).xlsx"))
setwd(.wd23)
rm(.wd23, d23, s23, x23, c23, v23, r23, My_Survey_final)

# Things to look at:
#   - RENDER 1: the old names in quotes, so an empty one shows as "" and a
#     space at the end would show; the arrow column; the label line.
#   - RENDER 3: the two kinds in one note -- Q1_A keeps "Q1 part A", INC
#     takes "INC$" -- and the sentence that covers both.
#   - Is "valid R names" the phrase for a reader new to R?


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 24 -- skip = and a title above the names (ruling R9 part 2; S362) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S362 (v0.9.235). A sheet whose first row is a title loaded the
# title as a variable name, the real names as a case and every column as
# text, and readxl said only "New names:". Now, when at most half the
# columns of the first row have a name and a later row holds words in at
# least half of them, a note gives the row the names seem to be in and the
# skip = call. A CSV file in that shape stopped on R's "more columns than
# column names", or, when the title held a comma, loaded wrong without a
# word; it stops now with the same call. The assertion side is
# import_check.R section F.
.wd24 <- getwd(); setwd(.walkdir)
t24 <- data.frame(x = c("Community Survey 2024", NA, "id", "1", "2"),
                  y = c(NA, NA, "age", "23", "35"),
                  z = c(NA, NA, "score", "4", "5"))
writexl::write_xlsx(t24, "title24.xlsx", col_names = FALSE)
writeLines(c("Community Survey 2024", "", "id,age,score", "1,23,4", "2,35,5"),
           "title24.csv")

# Render 1 -- the Excel file, read as it stands: the title note, then the
# name note for what was read.
jload("title24.xlsx", name = "e24", overwrite = TRUE)
# Expected:
#   Loaded e24 (Excel format; 4 cases, 3 variables)
#
#   Note: row 1 of title24.xlsx has a name in only 1 of its 3 columns, so it may
#   be a title rather than the variable names.
#   The names seem to be in row 3.
#   To read from there, skip the 2 rows above them:
#     jload("title24.xlsx", name = "e24", overwrite = TRUE, skip = 2)
#
#   Note: 3 variable names were changed to valid R names:
#     "Community Survey 2024"  -> Community_Survey_2024
#     ""                       -> V2
#     ""                       -> V3
#   The original name is the variable's label.

# Render 2 -- the call the note gives, run.
jload("title24.xlsx", name = "e24", skip = 2, overwrite = TRUE)
names(e24)
# Expected:
#   Loaded e24 (Excel format; 2 cases, 3 variables)
#   [1] "id"    "age"   "score"

# Render 3 -- the CSV file stops, with the same call; run, it reads.
try(jload("title24.csv", name = "c24", overwrite = TRUE))
jload("title24.csv", name = "c24", skip = 2, overwrite = TRUE)
# Expected:
#   Error : jload(): the first line of title24.csv holds 1 value, but most lines
#   below it hold 3.
#   The variable names seem to be on line 3.
#   To read from there, skip the 2 lines above them:
#     jload("title24.csv", name = "c24", overwrite = TRUE, skip = 2)
#   Loaded c24 (CSV format; 2 cases, 3 variables)

# Render 4 -- one unnamed column is not a title: the name note alone.
g24 <- data.frame(1:2, 3:4, 5:6); names(g24) <- c("id", "", "score")
writexl::write_xlsx(g24, "gap24.xlsx")
jload("gap24.xlsx", name = "g24", overwrite = TRUE)
# Expected:
#   Loaded g24 (Excel format; 2 cases, 3 variables)
#
#   Note: 1 variable name was changed to a valid R name:
#     ""  -> V2
unlink(c("title24.xlsx", "title24.csv", "gap24.xlsx"))
setwd(.wd24)
rm(.wd24, t24, e24, c24, g24)

# Things to look at:
#   - RENDER 1: "row 1 ... may be a title rather than the variable names":
#     a guess, said as one. Two notes, the title note first.
#   - RENDER 3: a stop where Render 1 is a note: the CSV file cannot be
#     read past its first line as it stands, the sheet can.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 25 -- what a file read wrong without a word now says (the import audit; S362) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S362 (v0.9.235). The import audit's silent cases, and the raw
# messages it found. A CSV file's values are counted line by line before
# it is read: a first line shorter than the rows (whose first values R made
# row names, dropped), a later line longer than the first (which R split
# into two cases), a semicolon file from European Excel (which loaded as
# one variable holding the decimals) and an empty file each stop in
# jstats's words; a Windows-1252 file (Excel's "CSV (Comma delimited)" on
# Windows) is read, and said to be, where it stopped on "invalid multibyte
# string". sheet = naming no sheet, and a file its reader cannot read, are
# said in jstats's words. The assertion side is import_check.R sections H-L.
.wd25 <- getwd(); setwd(.walkdir)
writeLines(c("age,score", "1,23,4", "2,35,5"), "short25.csv")
writeLines(c("a,b,c", "1,2,3", "4,5,6", "7,8,9", "10,11,12", "13,14,15",
             "16,17,18,19,20", "21,22,23"), "ragged25.csv")
writeLines(c("id;age;score", "1;23;4,5", "2;35;5,25"), "semi25.csv")
invisible(writeBin(raw(0), "empty25.csv"))
invisible(writeBin(iconv("id,answer\n1,Don\u2019t know\n2,Caf\u00e9\n", "UTF-8",
                         "CP1252", toRaw = TRUE)[[1]], "w1252_25.csv"))
writexl::write_xlsx(data.frame(id = 1:2), "one25.xlsx")
writeLines("not a workbook", "bad25.xlsx")

# Render 1 -- a first line short of a name, and a line too long.
try(jload("short25.csv", name = "z25"))
try(jload("ragged25.csv", name = "z25"))
# Expected:
#   Error : jload(): the first line of short25.csv has 2 names, but most lines
#   below it hold 3 values.
#   Add the missing name to the first line of the file, then run jload() again.
#   Error : jload(): line 7 of ragged25.csv holds 5 values, but the first line
#   has 3 names, so R would split it into two cases.
#   Correct that line of the file, then run jload() again.

# Render 2 -- a semicolon file, and an empty one.
try(jload("semi25.csv", name = "z25"))
try(jload("empty25.csv", name = "z25"))
# Expected:
#   Error : jload(): semi25.csv separates its values with semicolons, as Excel
#   does in many European settings.
#   jload() reads files whose values are separated by commas.
#   Save it from Excel as an .xlsx file and load that, or read it with base R:
#     z25 <- read.csv2("semi25.csv")
#   Error : jload(): empty25.csv is empty: it holds no lines.

# Render 3 -- a Windows-1252 file: read, and the note; the curly apostrophe
# and the accented letter read right (TRUE).
jload("w1252_25.csv", name = "w25", overwrite = TRUE)
identical(w25$answer, c("Don\u2019t know", "Caf\u00e9"))
# Expected:
#   Loaded w25 (CSV format; 2 cases, 2 variables)
#
#   Note: w1252_25.csv is not in UTF-8, the encoding R reads, so it was read as
#   Windows-1252, the encoding Excel on Windows saves a CSV file in.
#   Check its accented letters and symbols.
#   [1] TRUE

# Render 4 -- sheet = naming no sheet.
try(jload("one25.xlsx", name = "z25", sheet = "Wave2"))
# Expected:
#   Error : jload(): one25.xlsx has no sheet named "Wave2".
#   Its only sheet is "Sheet1":
#     jload("one25.xlsx", name = "z25", sheet = "Sheet1")

# Render 5 -- a file its reader cannot read. (R's own message, the line
# under "R reported:", names the file's full path, a temporary folder, so
# the Expected stops above it.)
try(jload("bad25.xlsx", name = "z25"))
# Expected:
#   Error : jload(): bad25.xlsx could not be read.
#   R reported:
unlink(c("short25.csv", "ragged25.csv", "semi25.csv", "empty25.csv",
         "w1252_25.csv", "one25.xlsx", "bad25.xlsx"))
setwd(.wd25)
rm(.wd25, w25)

# Things to look at:
#   - RENDER 1: each names the file, the line, and what to do; "R would
#     split it into two cases" says why it stops at all.
#   - RENDER 2: the semicolon stop's two ways out, Excel or base R.
#   - RENDER 3: the note's wording for a researcher who never chose an
#     encoding: is "Check its accented letters and symbols." enough?
#   - RENDER 5: the readxl message under "R reported:" (Rule AH).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 26 -- jsave(): names a format refuses, labels it shortens, and Excel's size (S362) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S362 (v0.9.235). Ruling R20's second half: a name R takes may be
# one a format refuses -- a word Stata reserves (long), a dot (Stata,
# SAS), two names SPSS and SAS read as one (age, Age), a word SPSS reserves
# (BY). haven and ReadStat checked in their own words and one name at a
# time; one check now names every refused name, why, and what it would
# become, and clean.names = TRUE changes them in the file only. Also: the
# labels a format shortens, said (ReadStat cut a .dta label inside a
# character); Excel's sheet size, said before writing; and the dataset
# inside an .xpt file named after the file asked for, not jsave()'s
# temporary file. The assertion side is import_check.R sections M-P.
# (The Saved lines name a temporary folder, so each Expected stops above
# them.)
.wd26 <- getwd(); setwd(.walkdir)
d26 <- data.frame(age = 1:3, Age = 4:6, long = 7:9, BY = 1:3, total.score = 1:3,
                  check.names = FALSE)

# Render 1 -- the same data frame refused by .sav, .dta and .xpt, each for
# its own names.
try(jsave(d26, "d26.sav", overwrite = TRUE))
try(jsave(d26, "d26.dta", overwrite = TRUE))
try(jsave(d26, "d26.xpt", overwrite = TRUE))
# Expected:
#   Error : jsave(): 2 variable names in the d26 data frame cannot be used in
#   SPSS format (.sav):
#     "Age"  -> Age_2  (SPSS reads it as age)
#     "BY"   -> XBY    (a word SPSS reserves)
#   To save the file with these names (the d26 data frame keeps its own):
#     jsave(d26, "d26.sav", overwrite = TRUE, clean.names = TRUE)
#   Error : jsave(): 2 variable names in the d26 data frame cannot be used in
#   Stata format (.dta):
#     "long"         -> Xlong        (a word Stata reserves)
#     "total.score"  -> total_score  (holds a character Stata does not take)
#   To save the file with these names (the d26 data frame keeps its own):
#     jsave(d26, "d26.dta", overwrite = TRUE, clean.names = TRUE)
#   Error : jsave(): 2 variable names in the d26 data frame cannot be used in
#   SAS interchange format (.xpt):
#     "Age"          -> Age_2        (SAS reads it as age)
#     "total.score"  -> total_score  (holds a character SAS does not take)
#   To save the file with these names (the d26 data frame keeps its own):
#     jsave(d26, "d26.xpt", overwrite = TRUE, clean.names = TRUE)

# Render 2 -- the call the message gives, run: the note, then the Saved
# line; the file's names; the data frame's.
jsave(d26, "d26.dta", overwrite = TRUE, clean.names = TRUE)
# Expected:
#   Note: 2 variable names were changed in the file to names Stata format (.dta)
#   takes; the d26 data frame keeps its own:
#     "long"         -> Xlong
#     "total.score"  -> total_score
#   The original names are the variables' labels in the file.
names(haven::read_dta("d26.dta"))
names(d26)
# Expected:
#   [1] "age"         "Age"         "Xlong"       "BY"          "total_score"
#   [1] "age"         "Age"         "long"        "BY"          "total.score"

# Render 3 -- a long label in .sav, and a label of accented letters in .dta.
L26 <- data.frame(q1 = c(1, 2))
attr(L26$q1, "label") <- paste(rep("How satisfied are you with the services you received?", 6),
                               collapse = " ")
jsave(L26, "L26.sav", overwrite = TRUE)
# Expected:
#   Note: SPSS format (.sav) keeps 256 bytes of a variable label and 120 of a
#   value label (fewer letters when they are accented).
#   Shortened in the file: the variable label of q1.
#   The L26 data frame keeps it whole.
attr(L26$q1, "label") <- strrep("\u00e9", 100)
jsave(L26, "L26.dta", overwrite = TRUE)
# Expected:
#   Note: Stata format (.dta) keeps 80 characters of a variable label and of the
#   data frame's label.
#   Shortened in the file: the variable label of q1.
#   The L26 data frame keeps it whole.

# Render 4 -- more cases than an Excel sheet holds; an .xpt file whose
# name is not a SAS name.
big26 <- data.frame(id = seq_len(1048576L))
try(jsave(big26, "big26.xlsx"))
jsave(d26["age"], "my data.xpt", overwrite = TRUE)
# Expected:
#   Error : jsave(): the big26 data frame has 1,048,576 cases, and Excel format
#   (.xlsx) holds at most 1,048,575.
#   A sheet has 1,048,576 rows, one of them for the variable names.
#   Save it in another format, for example:
#     jsave(big26, "big26.rds")
#     jsave(big26, "big26.csv")
#   Note: inside my data.xpt the dataset is named my_data.
#   A SAS dataset name holds only the letters A to Z, digits and underscores, up
#   to 32 characters.
unlink(c("d26.dta", "L26.sav", "L26.dta", "my data.xpt"))
setwd(.wd26)
rm(.wd26, d26, L26, big26)

# Things to look at:
#   - RENDER 1: the reason column. "SPSS reads it as age" for a name that
#     differs from another only in case.
#   - RENDER 2: the data frame keeps age, Age, long, BY, total.score; the
#     file has Xlong and total_score, each old name its label there.
#   - RENDER 3: the label note's wording (bytes, letters).
#   - RENDER 4: the offered saves; the dataset name inside the .xpt file.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 27 -- jload(header =): a file with no names row (ruling R21; S365) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S365 (v0.9.237; Fix Slate 12). A CSV file or a sheet with no names
# row lost its first case to the names, which were then numbers (1 became
# X1), and only the name note said anything. When every name read is a
# number, or empty, a note now says the row may be the first case and gives
# the call with header = FALSE (ruling R21, Jeff, S364: "add a "header"
# argument to jload ... Yes, that's a good idea."), which reads it as a
# case and names the variables V1, V2, ... header = TRUE written out says
# the numbers are names, and the note is not shown. Every other format
# carries its own names, so header = FALSE stops there. The assertion side
# is import_check.R section S.
.wd27 <- getwd(); setwd(.walkdir)
writeLines(c("1,23,4", "2,35,5", "3,41,3"), "nohead27.csv")
writexl::write_xlsx(data.frame(a = c(1, 2, 3), b = c(23, 35, 41), c = c(4, 5, 3)),
                    "nohead27.xlsx", col_names = FALSE)
writeLines(c("2019,2020,2021", "5,6,7", "8,9,10"), "years27.csv")
haven::write_sav(data.frame(id = 1:2, age = c(23, 35)), "survey27.sav")
writeLines(c("1,2", "3,4", "5,6", "7,8", "9,10", "11,12,13", "14,15"),
           "late27.csv")

# Render 1 -- the CSV file read as it stands: two cases, the note first,
# then the name note.
jload("nohead27.csv", name = "n27", overwrite = TRUE)
# Expected:
#   Loaded n27 (CSV format; 2 cases, 3 variables)
#
#   Note: every variable name read from nohead27.csv is a number (1, 23, 4), so
#   the line they came from may be the first case rather than the names.
#   To read that line as a case, with the variables named V1, V2, and V3:
#     jload("nohead27.csv", name = "n27", overwrite = TRUE, header = FALSE)
#
#   Note: 3 variable names were changed to valid R names:
#     "1"   -> X1
#     "23"  -> X23
#     "4"   -> X4
#   The original names are the variables' labels.

# Render 2 -- the call the note gives, run: three cases, V1 to V3.
jload("nohead27.csv", name = "n27", overwrite = TRUE, header = FALSE)
n27
# Expected:
#   Loaded n27 (CSV format; 3 cases, 3 variables)
#     V1 V2 V3
#   1  1 23  4
#   2  2 35  5
#   3  3 41  3

# Render 3 -- the same sheet in Excel: "row" where the CSV file has "line".
jload("nohead27.xlsx", name = "x27", overwrite = TRUE)
# Expected:
#   Loaded x27 (Excel format; 2 cases, 3 variables)
#
#   Note: every variable name read from nohead27.xlsx is a number (1, 23, 4), so
#   the row they came from may be the first case rather than the names.
#   To read that row as a case, with the variables named V1, V2, and V3:
#     jload("nohead27.xlsx", name = "x27", overwrite = TRUE, header = FALSE)
#
#   Note: 3 variable names were changed to valid R names:
#     "1"   -> X1
#     "23"  -> X23
#     "4"   -> X4
#   The original names are the variables' labels.

# Render 4 -- years as names, said so with header = TRUE: the name note
# alone.
jload("years27.csv", name = "y27", overwrite = TRUE, header = TRUE)
# Expected:
#   Loaded y27 (CSV format; 2 cases, 3 variables)
#
#   Note: 3 variable names were changed to valid R names:
#     "2019"  -> X2019
#     "2020"  -> X2020
#     "2021"  -> X2021
#   The original names are the variables' labels.

# Render 5 -- header = FALSE on an SPSS file and on a jstats dataset: a
# stop, with the call that runs.
try(jload("survey27.sav", name = "s27", header = FALSE))
try(jload("community", name = "s27", package = TRUE, header = FALSE))
# Expected:
#   Error : jload(): header = FALSE is only for Excel format (.xlsx, .xls) and
#   CSV format (.csv).
#   survey27.sav is in SPSS format (.sav), which carries its own variable names.
#   To load it, drop header = FALSE:
#     jload("survey27.sav", name = "s27")
#   Error : jload(): header = FALSE is only for Excel format (.xlsx, .xls) and
#   CSV format (.csv).
#   community is a jstats example dataset, which carries its own variable names.
#   To load it, drop header = FALSE:
#     jload("community", name = "s27", package = TRUE)

# Render 6 -- header = FALSE measures each line against the count most
# lines hold: a long line past the first five stops, as a line longer than
# the names line does.
try(jload("late27.csv", name = "l27", header = FALSE))
# Expected:
#   Error : jload(): line 6 of late27.csv holds 3 values, but most lines hold 2,
#   so R would split it into two cases.
#   Correct that line of the file, then run jload() again.
unlink(c("nohead27.csv", "nohead27.xlsx", "years27.csv", "survey27.sav",
         "late27.csv"))
setwd(.wd27)
rm(.wd27, n27, x27, y27)

# Things to look at:
#   - RENDER 1: "every variable name read from nohead27.csv is a number":
#     a guess, said as one ("may be"); the call carries overwrite = TRUE,
#     since the read just made n27.
#   - RENDER 4: header = TRUE as the way to say the numbers are names.
#   - RENDER 5: the stop's second line, "carries its own variable names".


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 28 -- rows and columns that may not be data (the import audit's item 17; S365) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S365 (v0.9.237; Fix Slate 12). A sheet's empty rows, an empty column
# with no name and the footnotes below the data loaded as cases and a
# variable, the footnotes turning id into text, and nothing said so; so did
# a CSV file's line of commas, a trailing comma's column and the row
# numbers R's write.csv() writes. One note now names them by their place in
# the file, the case numbers or the variable names beside, says when the
# footnotes made a variable text, and that nothing was removed (Jeff's S362
# lean: "a note naming them; nothing dropped"). The sheet is the audit's,
# a file in the test-data folder (R cannot write a column of numbers with
# text below them). The assertion side is import_check.R section S.
.wd28 <- getwd(); setwd(.walkdir)
.ds28 <- "E:/00 R Projects/00_jstats_test_data/datasets"
writeLines(c("id,age,grp", "1,23,a", ",,", "2,35,b",
             "\"Source: synthetic survey, 2024\",,",
             "\"Note: * fewer than 5 cases\",,"), "foot28.csv")
writeLines(c("a,b,c,", "1,2,3,", "4,5,6,"), "trail28.csv")
utils::write.csv(data.frame(age = c(23, 35, 41), score = c(4, 5, 3)),
                 "rows28.csv")
writeLines(c("notes", "a", "", "b"), "one28.csv")

# Render 1 -- the audit's sheet: two empty rows, two footnotes, an empty
# column; then the name note for the column's name.
jload(file.path(.ds28, "import_blank_rows.xlsx"), name = "b28", overwrite = TRUE)
# Expected:
#   Loaded b28 (Excel format; 9 cases, 4 variables)
#
#   Note: rows 5 and 8 of import_blank_rows.xlsx (cases 4 and 7) are empty.
#   Rows 9 and 10 (cases 8 and 9) have text in the first column only, below the
#   data, so they may be footnotes.
#   Because of them, id was read as text.
#   Column C (V3) has no name and is empty.
#   They were read as data, and nothing was removed.
#   To leave them out, delete them from the file and load the file again.
#
#   Note: 1 variable name was changed to a valid R name:
#     ""  -> V3

# Render 2 -- the CSV kin: a line of commas and Excel's quoted footnotes,
# by line; a trailing comma's column; write.csv()'s row numbers.
jload("foot28.csv", name = "f28", overwrite = TRUE)
# Expected:
#   Loaded f28 (CSV format; 5 cases, 3 variables)
#
#   Note: line 3 of foot28.csv (case 2) is empty.
#   Lines 5 and 6 (cases 4 and 5) have text in the first column only, below the
#   data, so they may be footnotes.
#   Because of them, id was read as text.
#   They were read as data, and nothing was removed.
#   To leave them out, delete them from the file and load the file again.
jload("trail28.csv", name = "t28", overwrite = TRUE)
# Expected:
#   Loaded t28 (CSV format; 2 cases, 4 variables)
#
#   Note: column 4 of trail28.csv (V4) has no name and is empty.
#   It was read as data, and nothing was removed.
#   To leave it out, delete it from the file and load the file again.
#
#   Note: 1 variable name was changed to a valid R name:
#     ""  -> V4
jload("rows28.csv", name = "r28", overwrite = TRUE)
# Expected:
#   Loaded r28 (CSV format; 3 cases, 3 variables)
#
#   Note: column 1 of rows28.csv (V1) has no name and holds the numbers 1 to 3
#   in order, so it may be row numbers, as R's write.csv() writes them.
#   It was read as data, and nothing was removed.
#   To leave it out, delete it from the file and load the file again.
#
#   Note: 1 variable name was changed to a valid R name:
#     ""  -> V1

# Render 3 -- a sheet whose data start in B3, below a title: the rows and
# the column counted as the sheet has them (column D, not C).
jload(file.path(.ds28, "import_offset.xlsx"), name = "o28", overwrite = TRUE,
      sheet = "Offset", skip = 2)
# Expected:
#   Loaded o28 (Excel format; 3 cases, 4 variables)
#
#   Note: row 5 of import_offset.xlsx (case 2) is empty.
#   Column D (V3) has no name and is empty.
#   They were read as data, and nothing was removed.
#   To leave them out, delete them from the file and load the file again.
#
#   Note: 1 variable name was changed to a valid R name:
#     ""  -> V3

# Render 4 -- a one-column file: its empty line is a case with a missing
# value (Session 351), and no note.
jload("one28.csv", name = "e28", overwrite = TRUE)
# Expected:
#   Loaded e28 (CSV format; 3 cases, 1 variable)
unlink(c("foot28.csv", "trail28.csv", "rows28.csv", "one28.csv"))
setwd(.wd28)
rm(.wd28, .ds28, b28, f28, t28, r28, o28, e28)

# Things to look at:
#   - RENDER 1: one sentence for each kind found, the rows and the column
#     by their place in the sheet, the cases and the variable beside them.
#   - RENDER 1: "Because of them, id was read as text." -- said only when
#     the other cells are numbers in the sheet, not digits stored as text.
#   - RENDER 2: "line" for a CSV file, "row" for a sheet; the row numbers'
#     "may be".
#   - The way out: delete them from the file and load it again. No R line
#     is offered: removing rows in base R (d[-4, ]) drops the labels jload()
#     gives a CSV file's renamed variables.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 29 -- the lines jload() offers keep the call (S365) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S365 (v0.9.237; Fix Slate 12's rider). The note on a file of several
# sheets offered jload("two29.xlsx", sheet = "B"), the file's name without
# the folder typed, which read another file of that name or none; and the
# sheet stop's line, like the stop for a name starting with a digit,
# dropped skip =. Every line jload() offers is now the call as typed with
# the one change: the folder, name =, sheet =, skip = and header = FALSE
# kept, and overwrite = TRUE where the read has made the data frame.
.wd29 <- getwd(); setwd(.walkdir)
dir.create("in29", showWarnings = FALSE)
writexl::write_xlsx(list(A = data.frame(x = 1:2), B = data.frame(y = 3:4)),
                    "in29/two29.xlsx")

# Render 1 -- a file of two sheets, in a folder: the line keeps the folder
# and the call's name; then the line, run.
jload("in29/two29.xlsx", name = "w29", overwrite = TRUE)
jload("in29/two29.xlsx", name = "w29", overwrite = TRUE, sheet = "B")
# Expected:
#   This file has 2 sheets: A, B
#   Reading the first sheet ("A").
#   To read a different sheet, use:
#     jload("in29/two29.xlsx", name = "w29", overwrite = TRUE, sheet = "B")
#   Loaded w29 (Excel format; 2 cases, 1 variable)
#   Loaded w29 (Excel format; 2 cases, 1 variable)

# Render 2 -- sheet = naming no sheet, with skip = and header = FALSE: the
# line keeps both.
try(jload("in29/two29.xlsx", name = "v29", sheet = "C", skip = 1,
          header = FALSE))
# Expected:
#   Error : jload(): two29.xlsx has no sheet named "C".
#   Its sheets are "A" and "B".
#   To read one, name it:
#     jload("in29/two29.xlsx", name = "v29", sheet = "A", skip = 1,
#         header = FALSE)
unlink("in29", recursive = TRUE)
setwd(.wd29)
rm(.wd29, w29)

# Things to look at:
#   - RENDER 1: the line names the folder, and carries overwrite = TRUE.
#   - RENDER 1 (S366, v0.9.238; Fix Slate 13): one sentence a line --
#     "Reading the first sheet ("A")." and "To read a different sheet,
#     use:" had shared a line (Rule E).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 30 -- an argument jload() does not use for the format (S367) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S367 (v0.9.239; Fix Slate 14). sheet = on a file that is not an
# Excel file, and skip = on one that is neither Excel nor CSV, are ignored
# with a warning, and the file is loaded. Each warning had put its two
# sentences on one line (Rule E), and said "Ignoring it for this . file." of
# a jstats example dataset, which has no extension.
.wd30 <- getwd(); setwd(.walkdir)
writeLines(c("x", "1", "2"), "in30.csv")
saveRDS(data.frame(x = 1:3), "in30.rds")

# Render 1 -- sheet = on a CSV file, then skip = on an .rds file.
jload("in30.csv", name = "w30", sheet = 2, overwrite = TRUE)
jload("in30.rds", name = "w30", skip = 1, overwrite = TRUE)
# Expected:
#   Warning: `sheet` is only used for Excel format (.xlsx, .xls).
#   Ignoring it for this .csv file.
#   Loaded w30 (CSV format; 2 cases, 1 variable)
#   Warning: `skip` is only used for Excel format (.xlsx, .xls) and CSV
#   format (.csv).
#   Ignoring it for this .rds file.
#   Loaded w30 (R format; 3 cases, 1 variable)

# Render 2 -- both on a jstats example dataset. missing.notice = FALSE: the
# dataset's note on its declared missing values is Section 1's.
jload("community", package = TRUE, name = "w30", sheet = 1, skip = 1,
      overwrite = TRUE, missing.notice = FALSE)
# Expected:
#   Warning: `sheet` is only used for Excel format (.xlsx, .xls).
#   Ignoring it for this jstats example dataset.
#   Warning: `skip` is only used for Excel format (.xlsx, .xls) and CSV
#   format (.csv).
#   Ignoring it for this jstats example dataset.
#   Loaded the jstats example dataset 'community'
unlink(c("in30.csv", "in30.rds"))
setwd(.wd30)
rm(.wd30, w30)

# Things to look at:
#   - ONE SENTENCE A LINE (Rule E; Claude's call, the S366 item): "`sheet`
#     is only used for Excel format (.xlsx, .xls)." and "Ignoring it for
#     this .csv file." had shared a line, and so had skip ='s two.
#   - RENDER 2: "Ignoring it for this jstats example dataset." where each
#     warning had said "this . file" (Claude's call; a defect in the same
#     two messages, found in the build).
#   - The file or dataset is loaded either way, the argument ignored
#     (import_check.R U06-U07).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 31 -- jrelabel(): the list form, modify = TRUE, the reminder (S378) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S378 (v0.9.252; Capability Slate C3, the (S219) item). Your rulings:
# the list form is a c() after the data frame (vars = takes quoted names);
# it works only with modify = TRUE, and without it stops and offers the call
# with it added (R30); modify = TRUE on one variable too, which still
# returns the variable; and, with your okay, the assign-or-lose reminder
# that jrecode(), jencode(), jsum() and javg() already give, printed after
# every one-variable call without modify = TRUE, since a function cannot
# see whether its result is assigned. The wording of every message here is
# Claude's. The assertion side is jrelabel_check.R J33-J42.
s31 <- data.frame(Q1 = c(1, 3, 2, 1), Q2 = c(2, 2, 3, 1), Q3 = c(3, 1, 1, 2),
                  Name = c("a", "b", "c", "d"), stringsAsFactors = FALSE)

# Render 1 -- three items that share a response scale, listed without
# modify = TRUE: the call stops before anything and offers itself with it.
try(jrelabel(s31, c(Q1, Q2, Q3), labels = "1=Never; 2=Sometimes; 3=Often"))
# Expected:
#   Error : jrelabel(): labelling several variables changes s31 itself, so it
#   needs modify = TRUE:
#     jrelabel(s31, c(Q1, Q2, Q3), labels = "1=Never; 2=Sometimes; 3=Often",
#         modify = TRUE)

# Render 2 -- the offered line, run: one line says what changed; jfreq()
# shows the labels on one of the three.
jrelabel(s31, c(Q1, Q2, Q3), labels = "1=Never; 2=Sometimes; 3=Often",
         modify = TRUE)
jfreq(s31, Q2)
# Expected:
#   Value labels applied to Q1, Q2, and Q3 in s31.
#   Frequencies
#
#   4 Cases in the 1 Variable Pool
#
#   Q2
#
#                 Freq  Total %  Valid %  Cum. %
#   ------------  ----  -------  -------  ------
#   1: Never        1     25.00   25.00    25.00
#   2: Sometimes    2     50.00   50.00    75.00
#   3: Often        1     25.00   25.00   100.00
#
#   Total           4    100.00

# Render 3 -- the one-variable form as taught, assigned: unchanged, with the
# reminder after it (printed on every such call -- the function cannot see
# the assignment).
s31$Q1 <- jrelabel(s31, Q1, labels = "1=Rarely; 2=Sometimes; 3=Often")
# Expected:
#   Note: This call changes s31 only if you assign the result:
#     s31$Q1 <- jrelabel(...)
#
#   To label Q1 in s31 directly, rerun with modify = TRUE:
#     jrelabel(..., modify = TRUE)

# Render 4 -- the same with modify = TRUE: no assignment, no reminder, the
# one line instead.
jrelabel(s31, Q1, labels = "1=Never; 2=Sometimes; 3=Often", modify = TRUE)
# Expected:
#   Value labels applied to Q1 in s31.

# Render 5 -- variables listed one after another, as jdesc() takes them;
# then a variable label in the list form; then a text variable in the list.
try(jrelabel(s31, Q1, Q2, Q3, labels = "1=Never; 2=Sometimes; 3=Often"))
try(jrelabel(s31, c(Q1, Q2), labels = "1=Never", var.label = "Item",
             modify = TRUE))
try(jrelabel(s31, c(Q1, Name), labels = "1=Never", modify = TRUE))
# Expected:
#   Error : jrelabel(): only one variable goes after the data frame, and this
#   call gives Q1, Q2, and Q3.
#   To label them all at once, list them in c() and add modify = TRUE:
#     jrelabel(s31, c(Q1, Q2, Q3), labels = "1=Never; 2=Sometimes; 3=Often",
#         modify = TRUE)
#   Error : jrelabel(): var.label = names one variable, so it cannot go with a
#   list of variables.
#   Give each variable its label in a call of its own, for example:
#     s31$Q1 <- jrelabel(s31, Q1, var.label = "Item")
#   Error : jrelabel(): 'Name' is a character (text) variable; value labels can
#   only be applied to numeric variables.
#   Nothing was changed. Convert it to numbers first with jencode(), or leave it
#   out of the list.
rm(s31)

# Things to look at:
#   - RENDER 1: "labelling several variables changes s31 itself, so it
#     needs modify = TRUE:" and the call with modify = TRUE added, laid out
#     past the width as every printed call is.
#   - RENDER 2: "Value labels applied to Q1, Q2, and Q3 in s31." -- one line
#     at standard and full, none at minimal; then jfreq()'s table with the
#     labels.
#   - RENDER 3: the reminder: the assignment line, a blank line, the
#     modify = TRUE line. Is it noise you can live with on every assigned
#     call (joutput("minimal") hides it)?
#   - RENDER 4: the one line, no reminder.
#   - RENDER 5: the dots-style call gets the c() line; a variable label is
#     refused in the list form with a one-variable line; a text variable
#     stops the whole call ("Nothing was changed"), jencode() named.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 32 -- what a CSV cell is read as (ruling R31, questions 1-4; S380) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S380 (v0.9.254). Your answers, one at a time: a CSV variable is read
# as numbers, or as TRUE and FALSE, only where no value would change. A
# leading zero (a postcode 0800) keeps the variable as text, with a note and
# the as.numeric() line (question 1); more than 15 digits (an ID) keeps it
# as text, with a note and no line (question 2); T and F alone stay text,
# with no note (question 3); the word NA is missing in a variable of numbers
# and a word in a text variable, which the scan names with the line that
# declares it, as for an Excel sheet (question 4). jsave()'s CSV file of a
# text "0800" or "F" now comes back as written. The wording of the notes is
# Claude's. The assertion side is import_check.R X01-X08.
.wd32 <- getwd(); setwd(.walkdir)
writeLines(c("id,Postcode,Phone,AccountID", "1,0800,0412345678,12345678901234567891",
             "2,2000,0298765432,12345678901234567892",
             "3,0870,,12345678901234567893"), "post32.csv")
writeLines(c("id,Sex,Q1,Done", "1,F,T,TRUE", "2,F,F,FALSE", "3,F,T,FALSE"),
           "women32.csv")
writeLines(c("id,Country,Score", "1,AU,12", "2,NA,NA", "3,NZ,15", "4,NA,11"),
           "nations32.csv")

# Render 1 -- postcodes, phone numbers and 20-digit IDs: one note; each
# variable as written; the empty phone number missing.
jload("post32.csv", name = "p32", overwrite = TRUE)
p32$Postcode
p32$AccountID
# Expected:
#   Loaded p32 (CSV format; 3 cases, 4 variables)
#
#   Note: 3 variables were kept as text, since numbers would change
#   their values:
#     Postcode   2 values start with a 0 (0800 and 0870)
#     Phone      2 values start with a 0 (0412345678 and 0298765432)
#     AccountID  3 values are longer than the 15 digits a number holds exactly
#   To make them numbers anyway:
#     p32$Postcode <- as.numeric(p32$Postcode)
#     p32$Phone <- as.numeric(p32$Phone)
#   [1] "0800" "2000" "0870"
#   [1] "12345678901234567891" "12345678901234567892" "12345678901234567893"

# Render 2 -- the offered lines, run: Postcode and Phone become numbers.
p32$Postcode <- as.numeric(p32$Postcode)
p32$Phone <- as.numeric(p32$Phone)
p32$Postcode
# Expected:
#   [1]  800 2000  870

# Render 3 -- a sample of women: F stays F; T and F as answers stay
# letters; the words TRUE and FALSE are TRUE and FALSE. No note.
jload("women32.csv", name = "w32", overwrite = TRUE)
str(w32)
# Expected:
#   Loaded w32 (CSV format; 3 cases, 4 variables)
#   'data.frame':	3 obs. of  4 variables:
#    $ id  : int  1 2 3
#    $ Sex : chr  "F" "F" "F"
#    $ Q1  : chr  "T" "F" "T"
#    $ Done: logi  TRUE FALSE FALSE

# Render 4 -- the word NA: a word in Country (Namibia), which the scan
# names; missing in Score. Then the line the scan offers, run.
jload("nations32.csv", name = "n32", overwrite = TRUE)
n32$Country
n32$Score
# Expected:
#   Loaded n32 (CSV format; 4 cases, 3 variables)
#
#   Suspected missing-value codes detected:
#     Country:  "NA" (2)
#
#   These codes are not formally defined, so they are not treated as missing.
#   Declare them as missing if they are; leave as-is if real.
#
#   To declare one variable's values as missing:
#     jdeclare_missing(n32, Country, codes = "NA", modify = TRUE)
#   To declare and label them in one call, replacing the placeholder names:
#     jdeclare_missing(n32, Country, codes = c(label1 = "NA"), modify = TRUE)
#   [1] "AU" "NA" "NZ" "NA"
#   [1] 12 NA 15 11
jdeclare_missing(n32, Country, codes = "NA", modify = TRUE)
jfreq(n32, Country)
# Expected:
#   Declared SPSS-style missing values on Country in n32:
#     NA (no label)
#
#   To keep it across sessions, save the data frame:
#     jsave(n32, "n32.rds")
#   Frequencies
#
#   4 Cases in the 1 Variable Pool
#
#   Country
#
#                  Freq  Total %  Valid %  Cum. %
#   -------------  ----  -------  -------  ------
#   Valid
#   AU               1     25.00    50.00   50.00
#   NZ               1     25.00    50.00  100.00
#   Total valid      2     50.00   100.00
#
#   Missing
#   NA (no label)    2     50.00       --      --
#
#   Total            4    100.00

# Render 5 -- jsave()'s round trip: text "0800" and "F", saved to CSV and
# loaded back, come back as written (they had come back 800 and FALSE).
r32 <- data.frame(id = 1:2, Postcode = c("0800", "2000"), Sex = c("F", "F"),
                  stringsAsFactors = FALSE)
jsave(r32, "round32.csv", overwrite = TRUE)
jload("round32.csv", name = "r32b", overwrite = TRUE)
r32b
# Expected:
#   Loaded r32b (CSV format; 2 cases, 3 variables)
#
#   Note: Postcode was kept as text: 1 of its values starts with a 0 (0800),
#   which a number would drop.
#   To make it numbers anyway:
#     r32b$Postcode <- as.numeric(r32b$Postcode)
#     id Postcode Sex
#   1  1     0800   F
#   2  2     2000   F
unlink(c("post32.csv", "women32.csv", "nations32.csv", "round32.csv"))
setwd(.wd32)
rm(.wd32, p32, w32, n32, r32, r32b)

# Things to look at:
#   - RENDER 1: one note for the three variables, a line each saying why,
#     then the as.numeric() lines for the two with a leading zero only --
#     converting the IDs would destroy them. The note's wording is Claude's
#     (the sketch you saw named one variable).
#   - RENDER 3: no note at all -- F reads as written.
#   - RENDER 4: the scan's block for Country, the same block an Excel sheet
#     gets, and its line run: NA under Missing.
#   - RENDER 5: the round trip says why Postcode is text (the note), and
#     Sex is F with no note.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 33 -- a few cells that are not numbers, text = and na = (ruling R31, questions 5-6; S380) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S380 (v0.9.254). Your answers: jstats never assumes N/A, - or . is
# missing; a variable of numbers that a few such cells made text gets one
# note naming them, with the jload() line whose na = reads them as missing
# (question 5) -- "a few" is your okayed lean: at most five values that are
# not numbers, and numbers in more than half the cells that are not empty;
# the note replaces the scan's block for that variable, whose declaration
# left it text. jload() gains text = (variables read exactly as written,
# for codes the rules cannot see) and na = (question 6), for CSV and Excel
# files. The sheet is a file in the test-data folder (R cannot write a
# column of number cells with text cells among them). The assertion side
# is import_check.R X09-X22.
.wd33 <- getwd(); setwd(.walkdir)
.ds33 <- "E:/00 R Projects/00_jstats_test_data/datasets"
writeLines(c("id,Income,Rent,Region", "1,52000,1200,North", "2,N/A,N/A,South",
             "3,61000,1350,East", "4,-,1100,West", "5,.,N/A,North",
             "6,48000,980,South", "7,55000,1020,East", "8,47000,N/A,West",
             "9,58000,1500,North", "10,51000,1250,South"), "inc33.csv")
writeLines(c("id,Diag", "1,250.10", "2,250.00", "3,401.9", "4,250.1",
             "5,250.10"), "icd33.csv")
invisible(file.copy(file.path(.ds33, "import_markers.xlsx"), "markers33.xlsx",
                    overwrite = TRUE))

# Render 1 -- two variables of numbers made text by a few cells: one note,
# the cells counted, the line with na =.
jload("inc33.csv", name = "i33", overwrite = TRUE)
# Expected:
#   Loaded i33 (CSV format; 10 cases, 4 variables)
#
#   Note: 2 variables are numbers except for a few cells, so they were
#   read as text:
#     Income  "N/A" (1), "-" (1), "." (1)
#     Rent    "N/A" (3)
#   To read those cells as missing and the variables as numbers:
#     jload("inc33.csv", name = "i33", overwrite = TRUE,
#         na = c("N/A", "-", "."))

# Render 2 -- the offered line, run: Income and Rent are numbers, the
# marked cells missing.
jload("inc33.csv", name = "i33", overwrite = TRUE, na = c("N/A", "-", "."))
jdesc(i33, Income, Rent)
# Expected:
#   Loaded i33 (CSV format; 10 cases, 4 variables)
#   Descriptive Statistics
#
#   10 Cases in the 2 Variable Pool
#
#   Note: Listwise deletion using jcomplete() would leave 6 cases.
#
#   Variable  Total  Non_missing   Min    Max      Mean       SD
#   --------  -----  -----------  -----  -----  ---------  --------
#   Income      10        7       47000  61000  53142.857  5145.502
#   Rent        10        7         980   1500   1200.000   185.203

# Render 3 -- the sheet: Income's numbers are number cells, so it gets the
# note. Since S381 (v0.9.255) Code, number cells beside one number stored
# as text ("9"), is in the same note: a reload with na = makes its N/A
# missing but leaves it text, so its as.numeric() line follows the reload
# (Section 34 has the note's other forms). Diag is text throughout, so no
# note names it, and the scan names its N/A as before. (A copy of the sheet
# in the walk's folder, so the line the note offers names no folder.)
jload("markers33.xlsx", name = "x33", overwrite = TRUE)
# Expected:
#   Loaded x33 (Excel format; 10 cases, 4 variables)
#
#   Note: 2 variables are numbers except for a few cells, so they were
#   read as text:
#     Income  "N/A" (1), "-" (1), "." (1)
#     Code    "N/A" (1)
#   Code also holds a number stored as text in the sheet, which na = does
#   not change.
#   To read those cells as missing and the variables as numbers:
#     jload("markers33.xlsx", name = "x33", overwrite = TRUE,
#         na = c("N/A", "-", "."))
#     x33$Code <- as.numeric(x33$Code)
#
#   Suspected missing-value codes detected:
#     Diag:  "N/A" (1)
#
#   These codes are not formally defined, so they are not treated as missing.
#   Declare them as missing if they are; leave as-is if real.
#
#   To declare one variable's values as missing:
#     jdeclare_missing(x33, Diag, codes = "N/A", modify = TRUE)
#   To declare and label them in one call, replacing the placeholder names:
#     jdeclare_missing(x33, Diag, codes = c(label1 = "N/A"), modify = TRUE)

# Render 4 -- diagnosis codes: read as numbers, 250.10 and 250.1 merge;
# with text = they are four codes, as written.
jload("icd33.csv", name = "c33", overwrite = TRUE)
jfreq(c33, Diag)
# Expected:
#   Loaded c33 (CSV format; 5 cases, 2 variables)
#   Frequencies
#
#   5 Cases in the 1 Variable Pool
#
#   Diag
#
#          Freq  Total %  Valid %  Cum. %
#   -----  ----  -------  -------  ------
#   250      1     20.00   20.00    20.00
#   250.1    3     60.00   60.00    80.00
#   401.9    1     20.00   20.00   100.00
#
#   Total    5    100.00
jload("icd33.csv", name = "c33", overwrite = TRUE, text = Diag)
jfreq(c33, Diag)
# Expected:
#   Loaded c33 (CSV format; 5 cases, 2 variables)
#   Frequencies
#
#   5 Cases in the 1 Variable Pool
#
#   Diag
#
#           Freq  Total %  Valid %  Cum. %
#   ------  ----  -------  -------  ------
#   250.00    1     20.00   20.00    20.00
#   250.1     1     20.00   20.00    40.00
#   250.10    2     40.00   40.00    80.00
#   401.9     1     20.00   20.00   100.00
#
#   Total     5    100.00

# Render 5 -- the stops: a name the file does not have (before the read,
# the file's names listed); text = and na = on a format that carries its
# own types and missing values; na = given a number.
try(jload("icd33.csv", name = "c33", text = Diagnosis))
try(jload("community_spss.sav", text = Age, na = "-"))
try(jload("icd33.csv", name = "c33", na = 99))
# Expected:
#   Error : jload(): Diagnosis was not found in icd33.csv.
#   Its variables are id and Diag.
#   Error : jload(): text = and na = are only for Excel format (.xlsx, .xls) and
#   CSV format (.csv).
#   community_spss.sav is in SPSS format (.sav), which carries its own variable
#   types and missing values.
#   To load it, drop them:
#     jload("community_spss.sav")
#   Error : jload(): `na` must be the cell values to read as missing, in quotes,
#   for example:
#     na = c("N/A", "-")
unlink(c("inc33.csv", "icd33.csv", "markers33.xlsx"))
setwd(.wd33)
rm(.wd33, .ds33, i33, x33, c33)

# Things to look at:
#   - RENDER 1: the note's two-variable form, a line each with the cells and
#     their counts, then the line -- na = lists every value, overwrite =
#     TRUE since the read made the frame. No scan block for Income or Rent.
#   - RENDER 2 (re-pinned S382): the listwise note without "first", as you
#     asked on your S381 walk of this section: "Note: Listwise deletion
#     using jcomplete() would leave 6 cases." The same sentence prints in
#     every jdesc() and jfreq() call, now from one place; cps_walk.R and
#     format_walk.R were re-pinned mechanically to it.
#   - RENDER 3 (re-pinned S381): one note for Income and Code; the sentence
#     saying Code also holds a number stored as text, which na = does not
#     change; the reload line, then Code's as.numeric() line. The scan's
#     block for Diag alone.
#   - RENDER 4: three rows, then four.
#   - RENDER 5: "Diagnosis was not found in icd33.csv." with the file's
#     names; one stop naming text = and na =, the line without them.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 34 -- a number stored as text in a sheet, and the label line (S381) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S381 (v0.9.255; Fix Slate 24, your two leans on their defaults). In
# a sheet, a variable of number cells that also holds a number stored as
# text stays text after a reload with na =, so the note on a few cells
# gives it base R's lines instead: its cells made missing, then
# as.numeric(). Until 0.9.255 the note passed it over and the scan offered
# a declaration that left it text, after which jt() refused it as a text
# variable and as.numeric() stopped. And every as.numeric() line jload()
# offers -- this note's and the CSV leading-zero note's (Section 32) --
# puts back the label jload() gave a renamed variable, which as.numeric()
# drops. The wording is Claude's. The sheets are files in the test-data
# folder (R cannot write a number stored as text among number cells). The
# assertion side is import_check.R X14 and X23-X28.
.wd34 <- getwd(); setwd(.walkdir)
.ds34 <- "E:/00 R Projects/00_jstats_test_data/datasets"
invisible(file.copy(file.path(.ds34, "import_stored.xlsx"), "stored34.xlsx",
                    overwrite = TRUE))
invisible(file.copy(file.path(.ds34, "import_stored2.xlsx"), "stored34b.xlsx",
                    overwrite = TRUE))
writeLines(c("id,Post code", "1,0800", "2,4000", "3,0810"), "post34.csv")

# Render 1 -- one variable, renamed from "Score no.": two numbers stored as
# text and the cells - and N/A. The note says why a reload would not do,
# and gives three lines: the cells made missing (%in% for two values),
# as.numeric(), and the label put back.
jload("stored34.xlsx", name = "s34", overwrite = TRUE)
# Expected:
#   Loaded s34 (Excel format; 10 cases, 2 variables)
#
#   Note: 1 variable name was changed to a valid R name:
#     "Score no."  -> Score_no
#   The original name is the variable's label.
#
#   Note: Score_no is numbers except for 2 cells: "-" (1), "N/A" (1).
#   It was read as text, and 2 of its numbers are stored as text in the sheet,
#   so reading the file again with na = would not make it numbers.
#   To read those cells as missing and Score_no as numbers:
#     s34$Score_no[s34$Score_no %in% c("-", "N/A")] <- NA
#     s34$Score_no <- as.numeric(s34$Score_no)
#     attr(s34$Score_no, "label") <- "Score no."

# Render 2 -- the three lines, run: Score_no is numbers, its two cells
# missing, its label kept, and no warning from as.numeric().
s34$Score_no[s34$Score_no %in% c("-", "N/A")] <- NA
s34$Score_no <- as.numeric(s34$Score_no)
attr(s34$Score_no, "label") <- "Score no."
jdesc(s34, Score_no)
attr(s34$Score_no, "label")
# Expected:
#   Descriptive Statistics
#
#   10 Cases in the 1 Variable Pool
#
#   Variable  Total  Non_missing  Min  Max   Mean    SD
#   --------  -----  -----------  ---  ---  -----  -----
#   Score_no    10        8        1    9   5.125  2.900
#
#   [1] "Score no."

# Render 3 -- two such variables and three it passes over: A and B share
# the note, each with its lines (== for one value) and no reload line; PC's
# stored 0800 and ID's stored 17-digit number are ones numbers would
# change, and Half's number cells are not more than half its cells, so no
# note names those three, and the scan names their N/A as before.
jload("stored34b.xlsx", name = "t34", overwrite = TRUE)
# Expected:
#   Loaded t34 (Excel format; 10 cases, 6 variables)
#
#   Note: 2 variables are numbers except for a few cells, so they were
#   read as text:
#     A  "N/A" (1)
#     B  "-" (1)
#   They also hold numbers stored as text in the sheet, so reading the file
#   again with na = would not make them numbers.
#   To read those cells as missing and the variables as numbers:
#     t34$A[t34$A == "N/A"] <- NA
#     t34$A <- as.numeric(t34$A)
#     t34$B[t34$B == "-"] <- NA
#     t34$B <- as.numeric(t34$B)
#
#   Suspected missing-value codes detected:
#     PC:    "N/A" (1)
#     ID:    "N/A" (1)
#     Half:  "N/A" (1)
#
#   These codes are not formally defined, so they are not treated as missing.
#   Declare them as missing if they are; leave as-is if real.
#
#   To declare one variable's values as missing:
#     jdeclare_missing(t34, PC, codes = "N/A", modify = TRUE)
#   To declare and label them in one call, replacing the placeholder names:
#     jdeclare_missing(t34, PC, codes = c(label1 = "N/A"), modify = TRUE)

# Render 4 -- the CSV leading-zero note (Section 32) on a variable jload()
# renamed: the label line after the as.numeric() line.
jload("post34.csv", name = "p34", overwrite = TRUE)
# Expected:
#   Loaded p34 (CSV format; 3 cases, 2 variables)
#
#   Note: 1 variable name was changed to a valid R name:
#     "Post code"  -> Post_code
#   The original name is the variable's label.
#
#   Note: Post_code was kept as text: 2 of its values start with a 0 (0800 and
#   0810), which numbers would drop.
#   To make it numbers anyway:
#     p34$Post_code <- as.numeric(p34$Post_code)
#     attr(p34$Post_code, "label") <- "Post code"
unlink(c("stored34.xlsx", "stored34b.xlsx", "post34.csv"))
setwd(.wd34)
rm(.wd34, .ds34, s34, t34, p34)

# Things to look at:
#   - RENDER 1: "It was read as text, and 2 of its numbers are stored as
#     text in the sheet, so reading the file again with na = would not make
#     it numbers." -- then the three lines, the label line last.
#   - RENDER 2: Score_no summarized as numbers (8 valid of 10); the label.
#   - RENDER 3: the two-variable form's sentence ("They also hold numbers
#     stored as text ..."), four lines; nothing for PC, ID or Half but the
#     scan's block.
#   - RENDER 4: the label line under the as.numeric() line.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 35 -- jsave(): a conversion line puts back the variable's label (S384) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S384 (v0.9.258; Fix Slate 26, Claude's call). jsave() stops on two
# kinds of column a format cannot take as they are, and offers the line
# that converts each: a factor with a category over 120 characters (.sav),
# made text with as.character(), and a POSIXlt date-time (.sav, .dta and
# .xpt), made POSIXct with as.POSIXct(). Both functions drop the variable's
# label, so until 0.9.258 the line took the label away before the save.
# Each line is now followed, where the variable has a label, by the line
# that puts it back -- as jload()'s as.numeric() lines (Section 34) and
# jscreen()'s as.Date() lines (format_walk.R Section 36). A variable with
# no label gets no such line. The sentences are unchanged. The assertion
# side is import_check.R section Y. (The Saved lines name a temporary
# folder, so each Expected stops above them.)
.wd35 <- getwd(); setwd(.walkdir)
long35 <- paste("Moved to be closer to family, to a job that suited the",
                "hours I can work, and to a cheaper rent than the city,",
                "after the lease ran out")
g35 <- data.frame(id = 1:2)
g35$reason <- factor(c(long35, "Other"))
attr(g35$reason, "label") <- "Main reason for moving"
nchar(levels(g35$reason))
# Expected:
#   [1] 133   5

# Render 1 -- a labelled factor with a category over 120 characters
# (.sav): the as.character() line, then the line that puts the label back.
try(jsave(g35, "g35.sav", overwrite = TRUE))
# Expected:
#   Error : jsave(): reason has a category longer than 120 characters, which
#   SPSS format (.sav) cannot store as a value label.
#   Save it as text, which SPSS keeps whole:
#     g35$reason <- as.character(g35$reason)
#     attr(g35$reason, "label") <- "Main reason for moving"

# Render 2 -- the two lines, run: reason is text with its label, the save
# goes ahead, and the file read back has the category whole and the label.
g35$reason <- as.character(g35$reason)
attr(g35$reason, "label") <- "Main reason for moving"
jsave(g35, "g35.sav", overwrite = TRUE)
r35 <- haven::read_sav("g35.sav")
nchar(r35$reason[1])
attr(r35$reason, "label")
# Expected:
#   [1] 133
#   [1] "Main reason for moving"

# Render 3 -- a labelled POSIXlt date-time (.sav): the as.POSIXct() line,
# then the line that puts the label back. .dta and .xpt give the same
# lines under their own format's name (import_check.R Y05).
t35 <- data.frame(id = 1:2)
t35$visit <- as.POSIXlt(c("2024-03-01 09:30:00", "2024-03-08 14:00:00"),
                        tz = "UTC")
attr(t35$visit, "label") <- "Date and time of visit"
try(jsave(t35, "t35.sav", overwrite = TRUE))
# Expected:
#   Error : jsave(): 1 column is of a type that SPSS format (.sav) cannot store:
#     visit (POSIXlt)
#
#   POSIXlt columns are list-backed; convert to POSIXct (the same instant, which
#   SPSS format (.sav) can store) before saving with:
#     t35$visit <- as.POSIXct(t35$visit)
#     attr(t35$visit, "label") <- "Date and time of visit"

# Render 4 -- the two lines, run: visit is POSIXct with its label, and the
# file read back keeps the label.
t35$visit <- as.POSIXct(t35$visit)
attr(t35$visit, "label") <- "Date and time of visit"
jsave(t35, "t35.sav", overwrite = TRUE)
attr(haven::read_sav("t35.sav")$visit, "label")
# Expected:
#   [1] "Date and time of visit"

# Render 5 -- both in one data frame, and a second date-time with no
# label: one numbered message, each labelled variable with its label line,
# and none for the one without.
b35 <- data.frame(id = 1:2)
b35$reason <- factor(c(long35, "Other"))
attr(b35$reason, "label") <- "Main reason for moving"
b35$visit <- as.POSIXlt(c("2024-03-01 09:30:00", "2024-03-08 14:00:00"),
                        tz = "UTC")
attr(b35$visit, "label") <- "Date and time of visit"
b35$followup <- as.POSIXlt(c("2024-04-01 10:00:00", "2024-04-08 15:00:00"),
                           tz = "UTC")
try(jsave(b35, "b35.sav", overwrite = TRUE))
# Expected:
#   Error : jsave(): b35 cannot be saved to SPSS format (.sav) yet -- 2
#   things to fix:
#
#   [1] reason has a category longer than 120 characters, which SPSS format
#   (.sav) cannot store as a value label.
#   Save it as text, which SPSS keeps whole:
#     b35$reason <- as.character(b35$reason)
#     attr(b35$reason, "label") <- "Main reason for moving"
#
#   [2] 2 columns are of a type that SPSS format (.sav) cannot store:
#     visit (POSIXlt)
#     followup (POSIXlt)
#
#   POSIXlt columns are list-backed; convert to POSIXct (the same instant, which
#   SPSS format (.sav) can store) before saving with:
#     b35$visit <- as.POSIXct(b35$visit)
#     attr(b35$visit, "label") <- "Date and time of visit"
#     b35$followup <- as.POSIXct(b35$followup)
#
#   Fix the above, then run jsave() again.
unlink(c("g35.sav", "t35.sav", "b35.sav"))
setwd(.wd35)
rm(.wd35, long35, g35, r35, t35, b35)

# Things to look at:
#   - RENDER 1: the attr() line under the as.character() line, naming the
#     label as the variable has it.
#   - RENDER 2: the label kept after the two lines, and in the file.
#   - RENDER 3: the same for a date-time: the attr() line under the
#     as.POSIXct() line.
#   - RENDER 5: each part of the numbered message with its label line;
#     followup, which has no label, its as.POSIXct() line alone.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Observations
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# <Free-form notes from the most recent walk: anything that looked off,
# wording worth an mv review, follow-ups. Dated entries, newest first.>
#
# 11 Aug 2026 (S230 closeout note; Expecteds revised, NOT a walk). All four
# ledgered S229 findings SHIPPED at S230 / v0.9.126: the plural fix (all
# three status emitters), the break family (Rule U: .jst_wrap_prose +
# Rule L "run:"/"run both:" blocks -- see the revised Section 2/3
# Expecteds), and the minimal-refusal Rule E splits with the
# combined-error newline join (revised Section 6). The deparsed-name echo
# stays an open observation. Fitness question (a) below is now live for
# the next walk; the Saved lines in Setup render two-line with correct
# number agreement from 0.9.126.
#
# 11 Aug 2026 (S229, first full walk, Jeff): the modify-form conversion
# itself verified green -- every suggestion site in modify form, both
# keep-sites intact. Findings, all ledgered at S229:
#   - "1 variables" / "1 cases" plural in jsave's Saved line (new defect,
#     seen on the susp.rds fixture save in Setup).
#   - jsave echoes a deparsed expression as the frame name
#     (Saved plain_df["Contact"] to ...) -- observation, not a defect call.
#   - Hardcoded mid-sentence line breaks land oddly with short names: the
#     Case 7/Case 4 convention note ("...convention is set / to \"spss\"")
#     and, worse, the jrecode convention error in Section 9 ("set to SPSS /
#     convention"). Family-wide judgment call, deliberately NOT auto-fixed.
#   - The three minimal-tier jsave refusals (Section 6) run two sentences
#     on one line -- Rule E gap, surfaced by the longer modify-form calls.
#     The .xpt one has a two-clause second sentence; sub-question for mv.
#   - Section 1's guidance tail only prints on the session's FIRST UDM
#     notice (compact-form design, S227); fixed in-file this session with
#     missing.notice = TRUE on that jload.
#   - The walk leaves its objects in the global environment, so joptions
#     census notes in a re-run list leftovers from the prior run (d1,
#     many_df, ...). Output therefore varies with session history; harmless
#     but worth remembering when reading a re-walk's console.
# Fitness questions for the NEXT walk: (a) do the minimal-tier refusals
# still read as prose once the Rule E split lands, and (b) does Section 9's
# bare jrecode( line above a modify = TRUE jdeclare_missing line read as
# deliberate or as an inconsistency?


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 36 -- jsave() given an expression: one copy, and the save that works (S386) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S386 (v0.9.259; the (S384) item, ruled S386 -- Jeff: "I like your
# recommendation"; "I'm okay with your recommendation on this one also").
# Given an expression as the data and two or more things to fix, jsave()'s
# stop opened each part on its own "mydata <- ..." line (S352; Section 19),
# so the lines, run top to bottom as a user pastes them, made mydata again
# at each part and undid the parts above; and its closing line, "run jsave()
# again", sent the user back to the expression, which stops as before. The
# line that makes mydata now comes once, under the header, and every part
# builds on it -- each route too, where a part offers two -- and the closing
# line is the save on mydata, the call's own arguments kept and
# clean.names = TRUE where a part names variables the format refuses. One
# problem keeps a line per block (Section 19, Render 1), and a name keeps
# "run jsave() again" (Render 4). The assertion side is import_check.R
# Y11-Y15. (The Saved line names a temporary folder, so Render 2 shows what
# was saved instead.)
.wd36 <- getwd(); setwd(.walkdir)
unlink(c("s36.sav", "x36.dta"))   # a file left by an earlier run stops a save
s36 <- data.frame(g = factor(c(strrep("a", 130), "b")))
attr(s36$g, "label") <- "Group"
s36$t <- as.POSIXlt(c("2026-03-01 09:30:00", "2026-03-02 14:00:00"), tz = "UTC")
attr(s36$t, "label") <- "Time of visit"
s36$BY <- c(1, 2)

# Render 1 -- three things to fix (.sav), the data an expression: mydata is
# made once, under the header, and the closing line saves it.
try(jsave(s36[c("g", "t", "BY")], "s36.sav"))
# Expected:
#   Error : jsave(): s36[c("g", "t", "BY")] cannot be saved to SPSS format
#   (.sav) yet -- 3 things to fix.
#   The fixes shown below work on a copy of your s36 data frame.
#   Make the copy first:
#     mydata <- s36[c("g", "t", "BY")]
#
#   [1] 1 variable name in the s36[c("g", "t", "BY")] data frame cannot be used
#   in SPSS format (.sav):
#     "BY"  -> XBY  (a word SPSS reserves)
#   The save at the end gives it this name in the file (the
#   s36[c("g", "t", "BY")] data frame keeps its own).
#
#   [2] g has a category longer than 120 characters, which SPSS format (.sav)
#   cannot store as a value label.
#   Save it as text, which SPSS keeps whole:
#     mydata$g <- as.character(mydata$g)
#     attr(mydata$g, "label") <- "Group"
#
#   [3] 1 column is of a type that SPSS format (.sav) cannot store:
#     t (POSIXlt)
#
#   POSIXlt columns are list-backed; convert to POSIXct (the same instant, which
#   SPSS format (.sav) can store) before saving with:
#     mydata$t <- as.POSIXct(mydata$t)
#     attr(mydata$t, "label") <- "Time of visit"
#
#   Fix the above, then save mydata:
#     jsave(mydata, "s36.sav", clean.names = TRUE)

# Render 2 -- the lines, run top to bottom as a user pastes them: each fix
# stays made, and the closing line saves (BY becomes XBY in the file only).
mydata <- s36[c("g", "t", "BY")]
mydata$g <- as.character(mydata$g)
attr(mydata$g, "label") <- "Group"
mydata$t <- as.POSIXct(mydata$t)
attr(mydata$t, "label") <- "Time of visit"
jsave(mydata, "s36.sav", clean.names = TRUE)
class(mydata$g)
names(haven::read_sav("s36.sav"))
# Expected:
#   [1] "character"
#   [1] "g"   "t"   "XBY"

# Render 3 -- two things to fix (.dta), the second with two routes: both
# routes build on the one mydata, and the closing save has no clean.names.
x36 <- data.frame(X = haven::labelled_spss(c(1, -1, 2), na_values = -1))
x36$t <- as.POSIXlt(c("2026-03-01 09:30:00", "2026-03-02 14:00:00",
                      "2026-03-03 08:00:00"), tz = "UTC")
try(jsave(x36[c("t", "X")], "x36.dta"))
# Expected:
#   Error : jsave(): x36[c("t", "X")] cannot be saved to Stata format (.dta) yet
#   -- 2 things to fix.
#   The fixes shown below work on a copy of your x36 data frame.
#   Make the copy first:
#     mydata <- x36[c("t", "X")]
#
#   [1] 1 column is of a type that Stata format (.dta) cannot store:
#     t (POSIXlt)
#
#   POSIXlt columns are list-backed; convert to POSIXct (the same instant, which
#   Stata format (.dta) can store) before saving with:
#     mydata$t <- as.POSIXct(mydata$t)
#
#   [2] 1 variable carries SPSS-style missing values, incompatible with the
#   .dta format:
#     X
#
#   Before saving to Stata format, convert with:
#     jconvert(mydata, to = "stata", modify = TRUE)
#   Or save every declared missing value as plain NA instead:
#     jsave(mydata, "x36.dta", preserve.declarations = FALSE)
#
#   Fix the above, then save mydata:
#     jsave(mydata, "x36.dta")

# Render 4 -- the same two things, the data given by name: each part names
# x36, and the closing line is as it was.
try(jsave(x36, "x36.dta"))
# Expected:
#   Error : jsave(): x36 cannot be saved to Stata format (.dta) yet -- 2
#   things to fix:
#
#   [1] 1 column is of a type that Stata format (.dta) cannot store:
#     t (POSIXlt)
#
#   POSIXlt columns are list-backed; convert to POSIXct (the same instant, which
#   Stata format (.dta) can store) before saving with:
#     x36$t <- as.POSIXct(x36$t)
#
#   [2] 1 variable carries SPSS-style missing values, incompatible with the
#   .dta format:
#     X
#
#   Before saving to Stata format, convert with:
#     jconvert(x36, to = "stata", modify = TRUE)
#   Or save every declared missing value as plain NA instead:
#     jsave(x36, "x36.dta", preserve.declarations = FALSE)
#
#   Fix the above, then run jsave() again.
setwd(.wd36)
rm(s36, x36, mydata, .wd36)

# Things to look at:
#   - Render 1: one "mydata <- ..." line, under the header, and none in a
#     part, the sentence above it naming the data frame the copy is made
#     from (Jeff's wording at the S386 walk); the closing line is the save
#     on mydata, with clean.names = TRUE because part [1] names a variable
#     SPSS refuses;
#   - Render 2: the lines, run as printed, leave g as text (the S384 undo is
#     gone), and the save goes ahead;
#   - Render 3: both routes of part [2] build on the one mydata;
#   - Render 4: a name is unchanged.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 37 -- jsave(): every line of a stop runs where it sits (ruling R33; S387) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S387 (v0.9.260; the (S386) part-[1] item, ruled S387 -- Jeff: "For
# Q2 - your recommendation is fine."; "Okay to your recommendation.").
# Run top to bottom as a user pastes them, the lines of jsave()'s stop with
# two or more things to fix stopped on the way: the names part, first,
# offered a save of its own, which ran before the other parts' fixes;
# given a name, "run jsave() again" then stopped on the names; and the
# plain-NA route stopped on them too. Now the names part points to the save
# at the end, a name or a place whose stop has a names part closes on the
# save that works (clean.names = TRUE), and the plain-NA route carries it.
# A stop with no names part keeps "run jsave() again" (Section 36, Render
# 4), and the names part alone keeps its line (Section 26). The assertion
# side is import_check.R Y16-Y23.
.wd37 <- getwd(); setwd(.walkdir)
unlink(c("d37.sav", "x37.dta"))   # a file left by an earlier run stops a save
d37 <- data.frame(g = factor(c(strrep("a", 130), "b")))
attr(d37$g, "label") <- "Group"
d37$t <- as.POSIXlt(c("2026-03-01 09:30:00", "2026-03-02 14:00:00"), tz = "UTC")
attr(d37$t, "label") <- "Time of visit"
d37$BY <- c(1, 2)

# Render 1 -- three things to fix (.sav), the data frame given by name: part
# [1] points to the save at the end, and the stop closes on that save.
try(jsave(d37, "d37.sav"))
# Expected:
#   Error : jsave(): d37 cannot be saved to SPSS format (.sav) yet -- 3
#   things to fix:
#
#   [1] 1 variable name in the d37 data frame cannot be used in SPSS
#   format (.sav):
#     "BY"  -> XBY  (a word SPSS reserves)
#   The save at the end gives it this name in the file (the d37 data frame
#   keeps its own).
#
#   [2] g has a category longer than 120 characters, which SPSS format (.sav)
#   cannot store as a value label.
#   Save it as text, which SPSS keeps whole:
#     d37$g <- as.character(d37$g)
#     attr(d37$g, "label") <- "Group"
#
#   [3] 1 column is of a type that SPSS format (.sav) cannot store:
#     t (POSIXlt)
#
#   POSIXlt columns are list-backed; convert to POSIXct (the same instant, which
#   SPSS format (.sav) can store) before saving with:
#     d37$t <- as.POSIXct(d37$t)
#     attr(d37$t, "label") <- "Time of visit"
#
#   Fix the above, then save d37:
#     jsave(d37, "d37.sav", clean.names = TRUE)

# Render 2 -- the lines, run top to bottom as a user pastes them: no stop on
# the way, and the closing save goes ahead (BY becomes XBY in the file only).
d37$g <- as.character(d37$g)
attr(d37$g, "label") <- "Group"
d37$t <- as.POSIXct(d37$t)
attr(d37$t, "label") <- "Time of visit"
jsave(d37, "d37.sav", clean.names = TRUE)
names(haven::read_sav("d37.sav"))
# Expected:
#   [1] "g"   "t"   "XBY"

# Render 3 -- a names part beside SPSS-style missing values (.dta): the
# plain-NA route and the closing save both carry clean.names = TRUE.
x37 <- data.frame(v = 1:3, X = haven::labelled_spss(c(1, -1, 2), na_values = -1))
names(x37)[1] <- "in"
try(jsave(x37, "x37.dta"))
# Expected:
#   Error : jsave(): x37 cannot be saved to Stata format (.dta) yet -- 2
#   things to fix:
#
#   [1] 1 variable name in the x37 data frame cannot be used in Stata
#   format (.dta):
#     "in"  -> Xin  (a word Stata reserves)
#   The save at the end gives it this name in the file (the x37 data frame
#   keeps its own).
#
#   [2] 1 variable carries SPSS-style missing values, incompatible with the
#   .dta format:
#     X
#
#   Before saving to Stata format, convert with:
#     jconvert(x37, to = "stata", modify = TRUE)
#   Or save every declared missing value as plain NA instead:
#     jsave(x37, "x37.dta", preserve.declarations = FALSE, clean.names = TRUE)
#
#   Fix the above, then save x37:
#     jsave(x37, "x37.dta", clean.names = TRUE)
setwd(.wd37)
rm(d37, x37, .wd37)

# Things to look at:
#   - Render 1: part [1] has no line of its own, and its sentence points to
#     the save at the end (the wording is Claude's call); the closing line
#     names d37 and adds clean.names = TRUE;
#   - Render 2: the lines run as printed with no stop, and the save goes
#     ahead;
#   - Render 3: the plain-NA route carries clean.names = TRUE, as the
#     closing save does, so either route saves.



# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 38 -- jsave(): the Stata route and the declare-again note run as printed (S388) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S388 (v0.9.261; Fix Slate 27, both items Claude's calls). Two sets of
# lines jsave() offers stopped when run as printed. The .sav stop for a
# variable with more declared missing values than SPSS allows offers a route
# to Stata format -- jconvert(), then a save to .dta -- and that save stopped
# on a name Stata refuses and SPSS takes (long, in); it now carries
# clean.names = TRUE when the data frame holds such a name (ruling R33: every
# line a part offers runs where it sits). The note after a save that writes
# an undeclared code ("To declare it and save again") named, after
# clean.names = TRUE had renamed the variable, the FILE's name, which the data
# frame does not hold, and dropped clean.names = TRUE from its save; given an
# expression, both lines named the expression. It now names the data frame's
# variable, keeps clean.names = TRUE, and gives the line that makes mydata
# first. A name R reads only in backticks gets them: in, which SPSS takes,
# printed bare did not parse. The assertion side is import_check.R Y24-Y31.
# (The note's save line and the Saved line name the walk folder, a temporary
# folder, shown here as <walk folder>.)
.wd38 <- getwd(); setwd(.walkdir)
unlink(c("d38.sav", "d38.dta", "r38.sav", "mydata.sav", "i38.sav"))
.note38 <- function(expr) {   # the call's notes as printed, the folder shown as <walk folder>
  m <- character(0)
  withCallingHandlers(expr, message = function(c) {
    m <<- c(m, conditionMessage(c)); invokeRestart("muffleMessage") })
  cat(gsub(normalizePath(.walkdir, winslash = "/"), "<walk folder>",
           paste(m, collapse = ""), fixed = TRUE))
}
d38 <- data.frame(long = 1:5,
                  X = haven::labelled_spss(c(1, -1, -2, -3, -4),
                                           na_values = c(-1, -2, -3, -4)))

# Render 1 -- X declares four missing values, one more than SPSS format
# (.sav) allows, and the data frame holds long, which SPSS takes and Stata
# reserves: the Stata route's save carries clean.names = TRUE.
try(jsave(d38, "d38.sav"))
# Expected:
#   Error : jsave(): SPSS format (.sav) allows at most 3 declared missing values
#   per variable, or a range plus one code.
#
#   This variable in d38 has more:
#     X: 4 codes
#
#   To save in R format (.rds) instead, keeping all the codes:
#     jsave(d38, "d38.rds")
#   To convert to Stata and save as Stata format (.dta), also keeping all
#   the codes:
#     jconvert(d38, to = "stata", modify = TRUE)
#     jsave(d38, "d38.dta", clean.names = TRUE)
#   To save as SPSS format (.sav) with every declared missing value as plain NA:
#     jsave(d38, "d38.sav", preserve.declarations = FALSE)
#   Or reduce each variable's declared missing values to fit.

# Render 2 -- the route, run as printed: the conversion, then the save,
# which goes ahead (long becomes Xlong in the file only).
jconvert(d38, to = "stata", modify = TRUE)
.note38(jsave(d38, "d38.dta", clean.names = TRUE))
toString(names(haven::read_dta("d38.dta")))
toString(names(d38))
# Expected:
#   Converted to Stata-style missing values in 1 variable:
#     X  -4  -> .a
#        -3  -> .b
#        -2  -> .c
#        -1  -> .d
#
#   Note: converting X back to SPSS-style missing values would give its codes
#   -99, -98, -97, -96, not -4, -3, -2, -1.
#
#   To keep it across sessions, save the data frame:
#     jsave(d38, "d38.rds")
#   Note: 1 variable name was changed in the file to a name Stata format (.dta)
#   takes; the d38 data frame keeps its own:
#     "long"  -> Xlong
#   The original name is the variable's label in the file.
#   Saved d38 to
#   <walk folder>/d38.dta
#   (Stata format; 5 cases, 2 variables)
#   [1] "Xlong, X"
#   [1] "long, X"

# Render 3 -- a save with clean.names = TRUE that writes an undeclared -99:
# the note names the data frame's variable, with (the file's is Xwith), and
# its save keeps clean.names = TRUE.
r38 <- data.frame(A = haven::labelled_spss(c(1, -99, 2), na_values = -99),
                  B = c(3, -99, 4))
names(r38)[2] <- "with"
.note38(jsave(r38, "r38.sav", clean.names = TRUE))
# Expected:
#   Note: 1 variable name was changed in the file to a name SPSS format (.sav)
#   takes; the r38 data frame keeps its own:
#     "with"  -> Xwith
#   The original name is the variable's label in the file.
#
#   Note: -99 in with is not declared as missing, though another column in r38
#   declares SPSS-style missing values.
#   It was written to the file as an ordinary value, so other software will read
#   it as valid data.
#   To declare it and save again, run both:
#     jdeclare_missing(r38, with, codes = -99, convention = "spss",
#         modify = TRUE)
#     jsave(r38,
#         "<walk folder>/r38.sav",
#         overwrite = TRUE, clean.names = TRUE)
#   Saved r38 to
#   <walk folder>/r38.sav
#   (SPSS format; 3 cases, 2 variables)

# Render 4 -- the same data given as an expression: the line that makes
# mydata comes first, and both lines name mydata.
.note38(jsave(r38[c("A", "with")], "mydata.sav", clean.names = TRUE))
# Expected:
#   Note: 1 variable name was changed in the file to a name SPSS format (.sav)
#   takes; the r38[c("A", "with")] data frame keeps its own:
#     "with"  -> Xwith
#   The original name is the variable's label in the file.
#
#   Note: -99 in with is not declared as missing, though another column in
#   r38[c("A", "with")] declares SPSS-style missing values.
#   It was written to the file as an ordinary value, so other software will read
#   it as valid data.
#   To declare it and save again, run:
#     mydata <- r38[c("A", "with")]
#     jdeclare_missing(mydata, with, codes = -99, convention = "spss",
#         modify = TRUE)
#     jsave(mydata,
#         "<walk folder>/mydata.sav",
#         overwrite = TRUE, clean.names = TRUE)
#   Saved r38[c("A", "with")] to
#   <walk folder>/mydata.sav
#   (SPSS format; 3 cases, 2 variables)

# Render 5 -- Render 3's two lines, run as printed: with declares -99 in
# r38, which keeps its names, and the file read back declares it on Xwith.
jdeclare_missing(r38, with, codes = -99, convention = "spss", modify = TRUE)
.note38(jsave(r38, "r38.sav", overwrite = TRUE, clean.names = TRUE))
attr(haven::read_sav("r38.sav", user_na = TRUE)$Xwith, "na_values")
# Expected:
#   Declared SPSS-style missing values on with in r38:
#     -99 (no label)
#
#   To keep it across sessions, save the data frame:
#     jsave(r38, "r38.rds")
#   Note: 1 variable name was changed in the file to a name SPSS format (.sav)
#   takes; the r38 data frame keeps its own:
#     "with"  -> Xwith
#   The original name is the variable's label in the file.
#   Saved r38 to
#   <walk folder>/r38.sav
#   (SPSS format; 3 cases, 2 variables)
#   [1] -99

# Render 6 -- a variable named in, which SPSS takes and R reads only in
# backticks: the declare line puts it in them.
i38 <- data.frame(A = haven::labelled_spss(c(1, -99, 2), na_values = -99),
                  B = c(3, -99, 4))
names(i38)[2] <- "in"
.note38(jsave(i38, "i38.sav"))
# Expected:
#   Note: -99 in in is not declared as missing, though another column in i38
#   declares SPSS-style missing values.
#   It was written to the file as an ordinary value, so other software will read
#   it as valid data.
#   To declare it and save again, run both:
#     jdeclare_missing(i38, `in`, codes = -99, convention = "spss",
#         modify = TRUE)
#     jsave(i38,
#         "<walk folder>/i38.sav",
#         overwrite = TRUE)
#   Saved i38 to
#   <walk folder>/i38.sav
#   (SPSS format; 3 cases, 2 variables)
unlink(c("d38.sav", "d38.dta", "r38.sav", "mydata.sav", "i38.sav"))
setwd(.wd38)
rm(d38, r38, i38, .note38, .wd38)

# Things to look at:
#   - Render 1: the save under "To convert to Stata ..." ends in
#     clean.names = TRUE; the other lines are as they were;
#   - Render 2: the two lines run with no stop, and the file holds Xlong;
#   - Render 3: the note's sentence and its declare line name with, the data
#     frame's variable, and its save keeps clean.names = TRUE;
#   - Render 4: "mydata <- r38[...]" first, the intro "run:" over three
#     lines, both lines naming mydata;
#   - Render 5: the lines run, and the file declares -99 on Xwith;
#   - Render 6: `in` in backticks in the declare line (the wording of the
#     sentence, "-99 in in", is unchanged).



# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 39 -- a sheet's blank cells, read as a CSV file's (ruling R34; S389) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S389 (v0.9.262; ruling R34, Jeff, S389: "Let's go with your
# recommendation on the excel issue."). readxl reads a sheet's empty cell,
# and a cell holding only spaces, as missing; the same cells in a CSV file
# are the <blank> category, counted valid (a blank is reported, never
# assumed missing). jload() now reads a sheet's text variable as a CSV
# file's: a variable of words gets the <blank> category in its blank cells,
# and one of numbers stored as text keeps them missing, as a CSV file's
# variable of numbers does. jt() given a grouping variable whose third
# category is <blank> names the categories and offers the declaration that
# leaves the blank cells out. And jsave()'s note on a text variable's
# missing cells names Excel format (.xlsx) among the formats that save them
# as blank text: R format (.rds) alone keeps them missing. The assertion
# side is import_check.R AA04-AA07, models_check.R AD01-AD05 and
# missing_convention_check.R N86aa-N86ae and N86bh. (The Saved line names
# the walk folder, a temporary folder, shown here as <walk folder>.)
.wd39 <- getwd(); setwd(.walkdir)
unlink(c("s39.xlsx", "t39.xlsx"))
.note39 <- function(expr) {   # the call's notes as printed, the folder shown as <walk folder>
  m <- character(0)
  withCallingHandlers(expr, message = function(c) {
    m <<- c(m, conditionMessage(c)); invokeRestart("muffleMessage") })
  cat(gsub(normalizePath(.walkdir, winslash = "/"), "<walk folder>",
           paste(m, collapse = ""), fixed = TRUE))
}
# The sheet: Sex is Female, Male or blank -- one cell empty, one holding
# three spaces; Score a number; Code numbers stored as text, each with a
# leading zero, one cell empty.
writexl::write_xlsx(data.frame(
  Sex   = c("Female", "Male", "", "Female", "   ", "Male", "Female", "Male"),
  Score = c(12, 15, 11, 14, 13, 16, 12, 17),
  Code  = c("0801", "0802", NA, "0804", "0805", "0806", "0807", "0808")),
  "s39.xlsx")

# Render 1 -- the sheet loaded: Sex's two blank cells are the <blank>
# category, counted valid; Code's empty cell stays missing.
jload("s39.xlsx", name = "s39", overwrite = TRUE)
jfreq(s39, Sex)
s39$Code
# Expected:
#   Loaded s39 (Excel format; 8 cases, 3 variables)
#   Frequencies
#
#   8 Cases in the 1 Variable Pool
#
#   Sex
#
#            Freq  Total %  Valid %  Cum. %
#   -------  ----  -------  -------  ------
#   <blank>    2     25.00   25.00    25.00
#   Female     3     37.50   37.50    62.50
#   Male       3     37.50   37.50   100.00
#
#   Total      8    100.00
#   <blank>: 2 cells with no text.
#   They are counted as valid values, not as missing.
#   To give them a code, use jencode().
#   To declare them missing, use jdeclare_missing() with codes = "".
#
#   [1] "0801" "0802" NA     "0804" "0805" "0806" "0807" "0808"

# Render 2 -- jt() on Sex: three categories, <blank> among them, and the
# declaration that leaves the blank cells out.
try(jt(Score ~ Sex, data = s39))
# Expected:
#   Independent Samples T-Test
#
#   Analysis N: 8
#
#   Error : jt(): 'Sex' has 3 categories: Female, Male, and <blank>.
#   A t-test requires exactly 2.
#   To leave out the blank cells, declare them missing:
#     jdeclare_missing(s39, Sex, codes = "", modify = TRUE)
#   Or use jaov() for more than 2 categories.

# Render 3 -- the declaration, run as printed; jt() then compares the two
# categories with a name.
jdeclare_missing(s39, Sex, codes = "", modify = TRUE)
jt(Score ~ Sex, data = s39)
# Expected:
#   Declared SPSS-style missing values on Sex in s39:
#     <blank> (no label)
#
#   To keep it across sessions, save the data frame:
#     jsave(s39, "s39.rds")
#   Independent Samples T-Test
#
#   Case Processing    Excluded  Remaining
#       Original             --          8
#       Auto-listwise         2          6
#       Analysis N           --          6
#
#   Missing data   From 8    %
#       Sex
#         Missing     2    25.0
#   --------------------------------------
#
#   Group Descriptives: Score by Sex
#   Group   N   Mean     SD
#   ------  -  ------  -----
#   Female  3  12.667  1.155
#   Male    3  16.000  1.000
#
#   Independent Samples T-Test Results (equal variances assumed)
#      t    df    p   Mean Difference  95% CI Lower  95% CI Upper
#   ------  --  ----  ---------------  ------------  ------------
#   -3.780   4  .019       -3.333         -5.782        -0.885
#
#   Cohen's d: -3.086

# Render 4 -- a data frame with a text variable's missing cells saved to a
# sheet: the note names Excel format (.xlsx); R format (.rds) alone keeps
# them missing.
t39 <- data.frame(Source = c("web", NA, "mail", NA), Score = c(1.5, 2.5, 2, 3))
.note39(jsave(t39, "t39.xlsx", overwrite = TRUE))
# Expected:
#   Note: Excel format (.xlsx) cannot store a missing value in a text variable.
#   2 missing cells in Source were saved as blank text.
#   R format (.rds) keeps them missing.
#   Saved t39 to
#   <walk folder>/t39.xlsx
#   (Excel format; 4 cases, 2 variables)

# Render 5 -- the sheet read back: the two cells are the <blank> category,
# as the note said.
jload("t39.xlsx", name = "b39", overwrite = TRUE)
jfreq(b39, Source)
# Expected:
#   Loaded b39 (Excel format; 4 cases, 2 variables)
#   Frequencies
#
#   4 Cases in the 1 Variable Pool
#
#   Source
#
#            Freq  Total %  Valid %  Cum. %
#   -------  ----  -------  -------  ------
#   <blank>    2     50.00   50.00    50.00
#   mail       1     25.00   25.00    75.00
#   web        1     25.00   25.00   100.00
#
#   Total      4    100.00
#   <blank>: 2 cells with no text.
#   They are counted as valid values, not as missing.
#   To give them a code, use jencode().
#   To declare them missing, use jdeclare_missing() with codes = "".
unlink(c("s39.xlsx", "t39.xlsx"))
setwd(.wd39)
rm(s39, t39, b39, .note39, .wd39)

# Things to look at:
#   - Render 1: <blank> 2, counted valid, and its footnote -- the counts a
#     CSV file with the same cells gives (until this build Sex read
#     Female 3, Male 3, with 2 missing). The footnote counts "2 cells with
#     no text" without the CSV file's "(1 empty, 1 holding only spaces or
#     tabs)": the sheet reader drops the spaces before jload() sees them.
#     Code's empty cell is NA: a variable of numbers stored as text keeps
#     its blank cells missing, as a CSV file's variable of numbers does.
#   - Render 2: the stop names the three categories, <blank> last, and
#     offers the declaration because the other two are a t-test's two
#     groups. Until this build a sheet's blank cells were missing and jt()
#     ran on two groups; a CSV file's were <blank>, and the stop said
#     "'Sex' has 3 categories." and "Use jaov() for more than 2
#     categories.", naming none of the three. With three named categories
#     beside <blank> it names all four and says only "Use jaov() for more
#     than 2 categories."; with no <blank> among them it reads as it did.
#     Does "To leave out the blank cells, declare them missing:" say
#     enough about what the line does?
#   - Render 3: the declaration runs as printed; jt() excludes the two
#     cells (Auto-listwise 2) and compares Female with Male.
#   - Render 4: "Excel format (.xlsx)" in the note's first line, and its
#     last line "R format (.rds) keeps them missing." -- until this build
#     it read "R format (.rds) and Excel format (.xlsx) keep them missing."
#     Section 16's six notes say the same, re-pinned under the ruling.
#   - Render 5: the round trip the note describes: the two cells back as
#     <blank>, valid.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 40 -- jsave(): the example save carries clean.names = TRUE (S389) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ADDED S389 (v0.9.262; Fix Slate 28, the (S388) item, Claude's call).
# jsave() given no file name stops with an example save, jsave(<data>,
# "mydata.sav"); on a data frame holding a name SPSS format refuses -- with,
# which SPSS reserves -- that line, run as printed, stopped on the name. The
# example carries clean.names = TRUE when the data frame holds such a name,
# and so do the example of the stop on a data frame not found and the two
# routes of the stop given nothing (the workspace decides their data frame,
# so they are shown in import_check.R AA02-AA03, not here). The assertion
# side is import_check.R AA01-AA03. (The Saved line names the walk folder,
# shown as <walk folder>.)
.wd40 <- getwd(); setwd(.walkdir)
unlink("mydata.sav")
.note40 <- function(expr) {   # the call's notes as printed, the folder shown as <walk folder>
  m <- character(0)
  withCallingHandlers(expr, message = function(c) {
    m <<- c(m, conditionMessage(c)); invokeRestart("muffleMessage") })
  cat(gsub(normalizePath(.walkdir, winslash = "/"), "<walk folder>",
           paste(m, collapse = ""), fixed = TRUE))
}
w40 <- data.frame(id = 1:3, score = c(4, 5, 6))
names(w40)[2] <- "with"

# Render 1 -- jsave() with no file name, on a data frame holding with.
try(jsave(w40))
# Expected:
#   Error : jsave(): Provide a filename with extension, for example:
#     jsave(w40, "mydata.sav", clean.names = TRUE)
#   Supported formats:
#     .sav       SPSS
#     .dta       Stata
#     .xpt       SAS interchange
#     .xlsx      Excel
#     .csv       Comma-separated values
#     .rds       R

# Render 2 -- the example, run as printed: the save goes ahead, with
# becomes Xwith in the file, and the note says so.
.note40(jsave(w40, "mydata.sav", clean.names = TRUE))
toString(names(haven::read_sav("mydata.sav")))
# Expected:
#   Note: 1 variable name was changed in the file to a name SPSS format (.sav)
#   takes; the w40 data frame keeps its own:
#     "with"  -> Xwith
#   The original name is the variable's label in the file.
#   Saved w40 to
#   <walk folder>/mydata.sav
#   (SPSS format; 3 cases, 2 variables)
#   [1] "id, Xwith"

# Render 3 -- the same data frame given as an expression: the line that
# makes mydata first, and the save on mydata carrying clean.names = TRUE.
try(jsave(w40[1:2, ]))
# Expected:
#   Error : jsave(): Provide a filename with extension, for example:
#     mydata <- w40[1:2, ]
#     jsave(mydata, "mydata.sav", clean.names = TRUE)
#   Supported formats:
#     .sav       SPSS
#     .dta       Stata
#     .xpt       SAS interchange
#     .xlsx      Excel
#     .csv       Comma-separated values
#     .rds       R

# Render 4 -- a data frame whose names SPSS takes: the example as it was.
p40 <- data.frame(id = 1:3)
try(jsave(p40))
# Expected:
#   Error : jsave(): Provide a filename with extension, for example:
#     jsave(p40, "mydata.sav")
#   Supported formats:
#     .sav       SPSS
#     .dta       Stata
#     .xpt       SAS interchange
#     .xlsx      Excel
#     .csv       Comma-separated values
#     .rds       R
unlink("mydata.sav")
setwd(.wd40)
rm(w40, p40, .note40, .wd40)

# Things to look at:
#   - Render 1: the example ends in clean.names = TRUE. The stop does not
#     say why; the note after the save does (Render 2). Enough, or should
#     the stop say a name will change?
#   - Render 2: the line runs with no stop, and the file holds Xwith.
#   - Render 3: "mydata <- w40[1:2, ]" first, the save on mydata with
#     clean.names = TRUE.
#   - Render 4: no clean.names = TRUE where every name fits the format.

# --- End marker --------------------------------------------------------------
# A real statement, deliberately last: stepping through with Ctrl+Enter, RStudio
# keeps expanding the selection when only comments remain, echoing the tail of
# the file back repeatedly. Ending on executable code gives it somewhere to
# stop. Keep this line at the foot of every walkthrough, below the Observations
# block, and rename it to match the file.

# Hand back the two knobs recorded in Setup (S266). This supersedes the
# S247 hard "none" clear: restoring the ENTERING value is what "does not
# leave a setting behind" actually requires -- the old clear left a
# cleared slot behind instead, whatever the session arrived with.
options(.jst_options_missing_convention = .entry_convention)
options(.jst_options_message_width = .entry_message_width)
options(warn = .entry_warn)

cat("\n--- End of modify_form_walk.R ---\n")
