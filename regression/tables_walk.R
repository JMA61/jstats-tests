# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# tables_walk.R -- the table layer, walked: jtable()'s preview and Word file
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# TYPE:     visual walkthrough (Expected comments; written for Jeff's checking)
# PENDING:  none
# LOCKS:    what jtable() prints and writes under the built-in apa style
#           (Capability Slate T, build 1): the descriptives table with
#           role headings, specific-note marks and the user's title and
#           note -- the console preview, a facsimile of the Word table
#           (ruling R47) -- and the .docx the same call writes, opened in
#           Word. Build 2 (S401): the frequency table (Jeff's Table 2), a
#           setting changed in the call, open = TRUE; and the style files
#           (ruling R46) -- jstyle()'s list, a saved copy of apa, a short
#           journal file based on apa and its settings printed, Tables 1
#           and 2 made in it and written to one file. Build 3 (S403): the
#           regression table (Jeff's Table 3: four nested models side by
#           side, the Constant, a dummy-coded variable's categories by
#           their value labels with the reference named, R2), its
#           logistic twin, the settings a call changes (the Gelman
#           column, the fit rows, the reference in the note), and both
#           tables in the journal's style. Build 4 (S405): the
#           correlation, t-test, ANOVA, crosstab and item tables (rulings
#           R54 and R55, the eight S404 leans) previewed, written to one
#           Word file, and the item table on a page of its own; Table 3
#           refitted under ruling R55. Build 5 (S406): the report jtable()
#           prints in place of the table (ruling R57) and print() showing a
#           kept table; one call, one table (ruling R56) and the lines its
#           stop offers; tables written together, each on the page it
#           needs, as one object; a short style file from jstyle(). The
#           release build (S407): two codes that share a value label, in
#           the console and in a table; the reserved style name; a file
#           named like the built-in; two tables in two fonts in one file.
#           Capability Slate U's build 1 (S409): the built-in report style
#           -- its settings, tables in it, a short file based on it turning
#           on the three new looks, a complete copy's head with the block
#           for an AI assistant, open = TRUE, the built-in names; the
#           styles folder at the package root and the gallery's three
#           files, banded, bar and us, written, listed, printed, opened and
#           used in one Word file.
#           Capability Slate U's build 2 (S410): ruling R59, N after the title
#           by default in apa and report -- in the preview, the report and the
#           Word caption -- and the ns that vary within a table in the note; a
#           blank line after each setting in the files jstyle() writes.
#           Capability Slate U's charts, build 1 (S414): jmulti() and the
#           multiple-response table (rulings R60-R62); the review's table
#           rulings -- the df by style (R74), the note's sentences by style
#           (R75), the preview centering a column's numbers under a wider
#           head (R76), the caption's and the note's sizes following size
#           (R77), the caption's text color (R78), a source line and report's
#           order of the notes (R79), the gallery's bar file in teal (R80);
#           the riders -- the report's last line, two stops, a style file's
#           printout, a call's title filled, open = TRUE where no program
#           opens the file.
#           Capability Slate U's charts, build 2 (S415): the charts' look
#           (ruling R64; labels on the axes, the S412 audit's F4; the bars'
#           values, R70) in apa and report; a chart in the Word file as a
#           figure (R63, R69, R71; the S412 audit's F6 and F7) -- the report,
#           print(), a file of a table and five figures in apa, one in report
#           with a note and a source; the data and vector files (R65); ruling
#           R72's note; the (S414) riders -- the role headings in outcome and
#           predictor, a label kept whole in Word, the preview's carets -- and
#           the stops a chart meets.
# ORIGIN:   S400 (v0.9.270)
# EDITED:   S415 (v0.9.279; Capability Slate U's charts, build 2: rulings
#           R63-R65, R69-R72 with the S412 audit's F4, F6, F7 and F9, and the
#           (S414) riders). SECTIONS 17, 18 AND 19 ADDED, on the PENDING line,
#           their Expected blocks filled by running (fill.R, under a
#           Windows-length temporary folder; the paths written as
#           <tempdir>). Section 17, the charts' look: five charts in apa, the
#           same five in report by style =, a model's plots and the heatmap in
#           greys (the heatmap's greys the lean taken at S415's opening).
#           Section 18, a chart in the Word file: a figure's report and
#           print(); a file of a table and five figures in apa -- a bar
#           chart, bars by group, a model's fit and residual plots, a chart
#           drawn in ggplot2 with its own title; one figure in report with
#           the call's title, note and source. Section 19: a short file with
#           data.file and vector.file on and the files it writes; R72's note
#           on a table and a figure, and advisory at "full" where nothing is
#           labelled; the riders -- a correlation table's labels kept whole in
#           Word, two specific notes' carets in the preview; the stops a chart
#           meets. RE-PINNED by running, each block compared with the one it
#           replaced: Sections 1 and 3, the role headings "Outcome" and
#           "Predictors" (Jeff, S414: "These should be changed."); Sections 3,
#           11 and 12, the style printouts' [plot] section (ruling R64; its
#           names and values Claude's calls, reviewed in the pre-CRAN review's
#           entry 13); Section 13, R72's note on a data frame whose Group has
#           no label. A capture of every section of every walk on 0.9.278 and
#           on the build moved Sections 3, 11, 12 and 13 here; Sections 6, 17,
#           19, 25, 28, 29 and 30 of models_walk.R, 7 of format_walk.R, 7 of
#           clinic_workflows_walk.R and E5 of cps_walk.R by jlogistic()'s
#           "Outcome Encoding" (the last two pin no block that holds it).
# LAST VERIFIED: v0.9.279, 2026-11-10 (S415) -- Sections 1, 3, 11-13 and
#           17-19 WALKED on the WORKSTATION by Jeff through receive_all()
#           ("walked, all okay"); PENDING back to none; R CMD check 0 errors,
#           0 warnings, 0 notes; ALL BATTERIES GREEN (12 run, 3686 checks).
#           On the first pass Section 17's charts did not reach the Plots
#           pane: models_check.R had closed RStudio's graphics device and
#           left a null device current (that battery fixed the same
#           session). Sandbox: harness.R verify, 19 of 19 sections under
#           rewalk() and by prepare = TRUE; rewalk()'s scoreboard read the
#           PENDING line; the one-go receive_all() showed all eight.
# EDITED:   S414 (v0.9.278; Capability Slate U's charts, build 1: rulings
#           R60-R62 and R74-R80, with the riders). SECTIONS 14, 15 AND 16
#           ADDED, on the PENDING line, their Expected blocks filled by
#           running (fill.R, under a Windows-length temporary folder; the
#           paths written as <tempdir>). Section 14, jmulti() and the
#           multiple-response table (R60-R62 and the five leans okayed at
#           S414's opening): the Console output; the data frame's order and
#           the options by their labels; a LimeSurvey file's "Y" boxes -- the
#           stop and its line, then the note on a set with no "No"; the
#           "Other" box's stop; the table in apa, and in report with a note
#           and a source; both in one Word file; the stop for two sets, its
#           first four lines. Section 15, the review's table rulings: R74 the
#           df in apa's head and report's column; R75 and R79 apa's note one
#           paragraph with the source its last sentence, report's a line a
#           sentence in the report manuals' order with "Source:" last; R76's
#           centered form in its shapes (a Welch ANOVA's F under a wider head,
#           a crosstab's counts, an item table's columns); R77 a short file
#           setting size alone, caption.size and note.size following it; R78
#           a caption bar of its own color with white text; nine tables in
#           one Word file. Section 16, the riders: the report's last line and
#           the full level's note (the review's entry 8), the two stops that
#           named jtable() twice (entry 5), a call's title with {group} and
#           {outcome} (entry 12), a style file's printout saying what the file
#           sets (entry 9), open = TRUE's note where no program opens the file
#           (the (S410) item; a stand-in opener that fails). The new settings'
#           names, the jmulti() output and the wording are Claude's calls.
#           SECTION 12: the gallery's bar file takes Section 11's teal colors
#           (ruling R80, S413; Claude's call, DEFAULTED at the S413 closeout),
#           its head and the Things to look at changed to match. RE-PINNED,
#           every section's Expected blocks refilled by running and each
#           compared with the block it replaced: the report's last line, "The
#           table was made in R; no Word file was asked for." where "No file
#           was written." stood (entry 8, Claude's wording), in every section;
#           Section 8's full-level note (entry 8); the numbers centered under
#           wider heads in Sections 2, 7 and 8 (R76, mechanical under the
#           ruling); the printouts of Sections 3, 11 and 12 -- the new general
#           settings and df.position, the [multiresponse] section,
#           caption.size and note.size as size and report's note size - 1
#           (R77), and the lines naming what a file sets (entry 9); Section
#           4's first block filled with #@SKIP after its setup calls, as
#           before. On the PENDING line, every section re-pinned, each for a
#           change Claude chose: in 1, 4-6, 9, 10 and 13 the report's last
#           line alone. Every walk captured on v0.9.277 and on this build and
#           compared (harness.R dump): tables_walk.R alone printed
#           differently, in all thirteen sections; the other eight walks
#           identical.
# LAST VERIFIED: v0.9.278, 2026-11-08 (S414) -- Sections 1-16 WALKED on the
#           WORKSTATION by Jeff through receive_all() ("walked, all okay";
#           "The rest of the walk looks good"); PENDING back to none; R CMD
#           check 0 errors, 0 warnings, 0 notes; ALL BATTERIES GREEN (12 run,
#           3666 checks). Sandbox: harness.R verify, 16 of 16 sections under
#           rewalk() and by prepare = TRUE; rewalk()'s scoreboard read the
#           PENDING line; the one-go receive_all() showed all 16. The walk's
#           findings, for build 2: a label's hyphen breaking in Word ("(0-" /
#           "100)"), the preview's carets dropped under two specific notes,
#           and the role headings of Sections 1 and 3 reworded to outcome and
#           predictor (Jeff).
# EDITED:   S410 (v0.9.277; Capability Slate U, build 2: ruling R59 and the
#           (S409) blank-line item). SECTION 13 ADDED, on the PENDING line,
#           its Expected blocks filled by running (fill.R, under a
#           Windows-length temporary folder; the paths written as <tempdir>):
#           N after the title in apa and in report, in the preview, the report
#           and the Word file; the ns that vary, in the note -- two models
#           whose Ns differ, a correlation table's pairwise ns, a t test's
#           groups of different sizes and of one size (Claude's call); a short
#           file setting n.position = note, printed as written, and a table
#           made in it; a complete copy where the general settings end and
#           [descriptives] begins. SECTIONS 3 AND 11 on the PENDING line for
#           one call of Claude's: a blank line under the general settings'
#           heading note in a complete copy's head (under each section's too,
#           Section 13); their heads printed with n = 25 where n = 23 stood,
#           so the same settings show. RE-PINNED MECHANICALLY, off the PENDING
#           line (the Build Procedure's rule for a ruled layout), every
#           section's Expected blocks refilled by running: N after the title
#           where it opened the note, a note gone where N was all it held, a
#           report line or a note rewrapped (Sections 1-12, ruling R59); a
#           blank line after each setting in the files Sections 3, 9, 10 and
#           11 print, and the gallery files Section 12 writes set out the same
#           way (Jeff's words, the (S409) item); n.position = title in the
#           printouts of Sections 3, 11 and 12; the stamp 0.9.277; Section 4's
#           first block filled with #@SKIP after its setup calls, as before.
#           The prose naming N's old place rewritten (Sections 1, 2, 3, 4, 7,
#           9, 10 and 11; Section 12's editor note gains the blank lines).
#           Every walk captured on v0.9.276 and on this build and compared
#           (harness.R dump): tables_walk.R alone printed differently, in all
#           twelve sections; modify_form_walk.R only in Section 10's
#           orientation version line, which no block pins;
#           missing_convention_walk.R identical.
# LAST VERIFIED: v0.9.277, 2026-11-07 (S410) -- Sections 3, 11 and 13 WALKED
#           on the WORKSTATION by Jeff through receive_all() ("walked, all
#           okay"); PENDING back to none; R CMD check 0 errors, 0 warnings, 0
#           notes; ALL BATTERIES GREEN (12 run, 3645 checks). Sandbox:
#           harness.R verify, 13 of 13 sections in three orders under rewalk()
#           and by prepare = TRUE; the 64 Expected blocks found in a separate
#           capture with the placeholders filled; rewalk()'s scoreboard read
#           the PENDING line.
# EDITED:   S409 (v0.9.276; Capability Slate U, build 1, the look layer).
#           SECTIONS 11 AND 12 ADDED, on the PENDING line, their Expected
#           blocks filled by running (fill.R, under a Windows-length
#           temporary folder; the paths written as <tempdir>, <working
#           directory> and <your jstats folder>, the styles folder as it
#           is). Section 11, the built-in report style (ruling R58): its
#           settings printed; three tables in it, the regression's preview
#           printed; a short file based on it turning on the three new
#           looks (a teal caption bar following the header, each
#           variable's row filled, banding, no rules, Calibri), its text
#           printed; the four tables in one Word file, Report.docx, opened;
#           a complete copy's head, with the block for an AI assistant and
#           based.on = report; open = TRUE (myagency.jstyle opened, the two
#           built-ins' stops); "report" refused as a copy's name and a
#           report.jstyle passed over with the note. Section 12, the styles
#           folder at the package root, E:/00 R Projects/jstats/styles
#           (made if absent, silently), set as the style folder: the
#           gallery's three files, banded, bar and us, written from the
#           walk's text (each replacing a file of its name -- Jeff's S408
#           banded.jstyle among them); listed; bar's settings printed by
#           source (bar, then report, then apa); the three opened in the
#           editor; the same three crosstabs in report and in each written
#           to one Word file, Gallery.docx, opened; the session's style
#           folder put back. The new settings' names, values and notes,
#           the colors, the heads' wording and the gallery files are
#           Claude's calls. SECTIONS 3, 9 AND 10 RE-PINNED, on the PENDING
#           line (wording of Claude's, walked): jstyle()'s list shows
#           report; the complete copy's head gives the editing rule in its
#           one wording and the block for an AI assistant (n = 23 shows
#           the settings n = 18 did); myjournal's printout shows the three
#           new settings; the short file's head names "a style built into
#           jstats" and gives the same rule; Section 10's stop for "report"
#           and its passed-over note say "built into jstats", and its two
#           written-to lines now break where a Windows temporary path
#           breaks them (the S407 fill had used the sandbox's short one).
#           Every walk captured on v0.9.275 and on this build and compared
#           (harness.R dump): tables_walk.R Sections 3, 9 and 10 and
#           modify_form_walk.R Section 10 alone printed differently; the
#           other seven walks identical. NEEDS derived by running (5: 4; 6:
#           3, 5; none for 11 and 12, whose Word files go in folders made
#           fresh at each section's start, so a second run prints no
#           "replaced" line).
# LAST VERIFIED: v0.9.276, 2026-11-06 (S409) -- Sections 3, 9, 10, 11 and 12
#           WALKED on the WORKSTATION by Jeff through receive_all() ("walked,
#           all okay"); PENDING back to none; R CMD check 0 errors, 0
#           warnings, 0 notes; ALL BATTERIES GREEN (12 run, 3638 checks) on
#           the receive after the rebuild (tables_check.R's AQ13; the first
#           receive read 286/287). His notes on the walk are in the
#           Observations block. Sandbox: harness.R verify, 12 of 12 sections
#           in three orders under rewalk() and by prepare = TRUE; the 54
#           Expected blocks found in a separate capture with the
#           placeholders filled; rewalk()'s scoreboard read the PENDING line.
# EDITED:   S407 SECOND REBUILD (v0.9.275, the same version; on Jeff's
#           walk of the first rebuild: Table 2's title on two lines, and
#           the n and % columns under "How we contacted you"). SECTION 2
#           on the PENDING line: its Word file's first column as wide as
#           the longest label, a variable's label row included (the
#           preview's rule), its notes saying so. SECTIONS 9 AND 10: the
#           short file's head names the style it is based on ("based on
#           apa, the style built into jstats"; "any setting not listed
#           here takes apa's value"); Section 10's Render 6 notes, the
#           title on one line and the label setting the first column.
#           Every section refilled on this build and compared: only those
#           lines moved. Every Word file the walk writes compared with the
#           first rebuild's: Table2.docx (Section 2) and Tables_myjournal
#           (Section 3) the stub 46 twips wider, Tables_myjournal_models
#           (Section 6) 25, TwoFonts.docx (Section 10) as in the render;
#           the other eight the same.
# LAST VERIFIED: v0.9.275, 2026-11-05 (S407, the second rebuild) -- Sections
#           2, 3, 9 and 10 WALKED on the WORKSTATION by Jeff through
#           receive_all() ("walked, all okay"); PENDING back to none; R CMD
#           check 0 errors, 0 warnings, 0 notes; ALL BATTERIES GREEN (12
#           run, 3623 checks). Before it: the first delivery's Section 10
#           walked to the two findings (TwoFonts.docx's Table 2 wrapping,
#           the style file's wrapped head), the first rebuild's to the
#           next two (the title on two lines, the n and % columns under the
#           label). Sandbox: harness.R verify, 10 of 10 sections in three
#           orders under rewalk() and by prepare = TRUE; rewalk()'s
#           scoreboard read the PENDING line (since the first rebuild,
#           whose ";" inside the note stopped rewalk() on the workstation).
# EDITED:   S407 REBUILD (v0.9.275, the same version; on Jeff's walk of
#           the delivery). SECTIONS 3 AND 9 RE-PINNED, on the PENDING
#           line: a style file's head is its name on a line of its own,
#           then one sentence a line, and each setting's note and "# takes:"
#           line is unwrapped (Jeff: "each sentence should be on its own
#           line"); found by refilling every section on this build, every
#           other line the same, temporary paths aside. SECTION 10 on the
#           PENDING line: Render 4 shows myreport.jstyle as written, its
#           Expected block refilled; Render 6's Word file measured in each
#           table's font, its notes saying what changed and why the title
#           still wraps. The Word files of Sections 1, 2, 3, 6 and 7 move a
#           little (a stub with indented rows 53 twips wider at 12 points,
#           the indent measured as Word draws it); nothing they print moves.
# EDITED:   S407 (v0.9.275; the release build, a fix slate). SECTION 10
#           ADDED, on the PENDING line, its Expected blocks filled by
#           running (fill.R), its temporary paths shown as <tempdir>:
#           the (S399) colliding-labels fix -- codes 2 and 3 both "Other"
#           as two rows in jfreq() under value.id = "labels" and two
#           groups in jaov(), each shown with its code, and the frequency
#           table's rows the same way; jstyle(save.as = "report") refused
#           (a built-in a later version adds) and another name written; a
#           file named apa.jstyle in the style folder passed over with a
#           note; two tables built under apa and an Arial style, written to
#           one Word file, each in its own font. The new messages' wording
#           is Claude's. SECTIONS 3 AND 9 RE-PINNED MECHANICALLY, off the
#           PENDING line: the saved copy's stamp reads 0.9.275 (one line
#           each, found by refilling both sections on this build; every
#           other line the same, temporary paths aside). Every section
#           captured on v0.9.274 and on this build and compared: Sections
#           1-9 identical but for the two stamps. Section 10 clears the
#           jcomplete() Section 4 leaves on tdat, so it needs no earlier
#           section. Sandbox: harness.R verify, 10 of 10 sections in three
#           orders and by prepare = TRUE; NEEDS derived by running (5: 4; 6:
#           3, 5; none for 10).
# EDITED:   S406 (v0.9.274; Capability Slate T, build 5). SECTIONS 8 AND 9
#           ADDED, on the PENDING line, their Expected blocks filled by
#           running (fill.R). Section 8: ruling R57's report in its forms
#           (no file; at joutput("full") the note giving the call that
#           writes and the lines that keep and print the table; a file
#           written, then replaced), print() showing a kept table, ruling
#           R56's stop for results that cannot share a table and its lines
#           run as they stand, tables written together each on the page it
#           needs (a landscape page between portrait ones) and printed as
#           one object, the note on tables that could have been one, and
#           R56's other stops (what keeps results apart in each table type,
#           a setting no table takes, title = on a list that stops).
#           Section 9: a short style file from jstyle(save.as =) with
#           settings, a table made in it, and every stop of jstyle()'s
#           settings. The new messages' wording is Claude's. SECTION 3 on the
#           PENDING line: the complete copy's head says how to edit the file
#           and gives each setting a "# takes:" line (two more lines shown,
#           n = 18). SECTIONS 1, 2, 4, 5, 6 AND 7 RE-PINNED MECHANICALLY
#           under ruling R57, off the PENDING line: jtable() prints its
#           report where it printed the table, so each table a section shows
#           is printed with print() after it (R57's form; every preview as
#           it was), every Expected block refilled by running, and the prose
#           that named the old behavior reworded. Section 7's Word file
#           holds the ANOVA table on a landscape page of its own between
#           portrait pages (S406: each table gets the page it needs; ruled
#           with R56, the S406 item 4), its bullet reworded. Every section
#           captured on v0.9.273 and on this build and compared. Setup
#           now pins the message width at 76 (the report is prose, which
#           follows the console's width) and the foot hands it back.
# LAST VERIFIED: v0.9.274, 2026-11-04 (S406) -- Sections 3, 8 and 9 WALKED on
#           the WORKSTATION by Jeff through receive_all() ("walked, all
#           okay"); PENDING back to none; R CMD check 0 errors, 0 warnings,
#           0 notes; ALL BATTERIES GREEN (12 run, 3605 checks). Sandbox:
#           harness.R verify, 9 of 9 sections in three orders under
#           rewalk(); NEEDS derived by running (5: 4; 6: 3, 5; none for 8
#           and 9).
# EDITED:   S405 (v0.9.273; Capability Slate T, build 4). SECTION 7 ADDED,
#           on the PENDING line, its Expected blocks filled by running
#           (fill.R): build 4's five tables previewed and written to one
#           Word file, then the item table on its own (ruling R55's labels
#           on two lines on a portrait page). It works on a copy of tdat,
#           d7, so the settings Sections 4-6 leave on tdat do not reach it
#           in a straight run (no NEEDS, derived by running). SECTION 3
#           RE-PINNED, on the PENDING line: jstyle() prints filter.note and
#           the five new sections, and the saved copy's stamp reads 0.9.273
#           -- its Expected blocks refilled by running, the paths written as
#           <tempdir>, <working directory> and <your jstats folder> as at
#           S401. SECTION 4 on the PENDING line: its Word file refitted
#           under ruling R55 (10 pt, "Daily commute time (minutes)" on two
#           lines, where it was 9 pt), its prose on the fit and the
#           landscape test re-pinned; the preview unchanged. SECTIONS 5 AND
#           6 RE-PINNED MECHANICALLY under ruling R55, off the PENDING line:
#           their Word files are refitted by the same rule; no Expected
#           block or prose changed. Every section captured on v0.9.272 and
#           on this build and compared (harness.R dump): Sections 1, 2, 4,
#           5 and 6 print the same, Section 3 as above. AT THE REBUILD (same
#           version): Sections 6 and 7 on the PENDING line again for their
#           Word files -- a column of numbers now holds its block, the
#           widest whole part and the widest tail from whichever cells have
#           them -- each with a bullet saying where to look; no Expected
#           block changed (every Word file written by the walk compared
#           before and after: only those two differ).
# LAST VERIFIED: v0.9.273, 2026-11-04 (S405), the rebuild -- Sections 6 and 7
#           WALKED on the WORKSTATION by Jeff through receive_all() ("walked,
#           all okay"): every number on its point in Word; PENDING back to
#           none; R CMD check 0 errors, 0 warnings, 0 notes; ALL BATTERIES
#           GREEN (12 run, 3574 checks).
# LAST VERIFIED: v0.9.273, 2026-11-03 (S405), first delivery -- Sections 3, 4
#           and 7 WALKED on the WORKSTATION by Jeff through receive_all()
#           ("walked, all okay"), save one finding in Section 7's file: the
#           correlation table's decimal tab off ("I assume due to the 3
#           asterisks"). The rebuild fixes it and the same fault in Section
#           6's journal Table 3; Sections 6 and 7 pending. R CMD check 0
#           errors, 0 warnings, 0 notes; ALL BATTERIES GREEN (12 run, 3573
#           checks).
# EDITED:   S403 (v0.9.272; Capability Slate T, build 3). SECTIONS 4, 5 AND
#           6 ADDED, on the PENDING line, their Expected blocks filled by
#           running (fill.R). SECTION 3 RE-PINNED: the journal file gains
#           leading.zero = never and a [regression] section (the Gelman
#           column in the last model, s.e. for SE), and jstyle()'s printout
#           shows n.position where note.n stood (ruling R51) and the
#           [regression] and [logistic] sections; on the PENDING line.
#           SECTION 2 on the PENDING line for its Word file: its stub
#           column is a little narrower (set by the category rows; a
#           variable's label row spans the table), the preview unchanged
#           and its Expected block as it was. Sections 5 and 6 carry NEEDS
#           lines, derived by running (harness.R derive). A fit row's
#           cell spans its model's columns, its value on b's point
#           (Session 403: the df after an F had widened b).
# LAST VERIFIED: v0.9.272, 2026-11-03 (S403) -- Sections 2-6 WALKED on the
#           WORKSTATION by Jeff through receive_all() ("walked, all okay");
#           PENDING back to none; R CMD check 0 errors, 0 warnings, 0 notes;
#           ALL BATTERIES GREEN (12 run, 3530 checks).
# EDITED:   S401 (v0.9.271; Capability Slate T, build 2). SECTIONS 2 AND 3
#           ADDED, on the PENDING line; their Expected blocks filled by
#           running (fill.R), a path that holds the session's temporary
#           folder shown as <tempdir>, the working directory and the
#           per-user folder by their names. Both write to the temporary
#           folder and open Word themselves (open = TRUE). Section 1
#           unchanged: its preview is the same; in its file each column of
#           numbers now sits centered under its head (a point to the left
#           in this table).
# LAST VERIFIED: v0.9.271, 2026-10-29 (S401) -- Sections 2 and 3 WALKED on the
#           WORKSTATION by Jeff through receive_all() ("walked, all okay");
#           PENDING back to none; R CMD check 0 errors, 0 warnings, 0 notes;
#           ALL BATTERIES GREEN (12 run, 3492 checks).
# LAST VERIFIED: v0.9.270, 2026-10-29 (S400) -- Section 1 WALKED on the
#           WORKSTATION by Jeff through receive_all() ("walked, all okay"),
#           on the second delivery of 0.9.270 (the caption and notes as
#           rows by default); PENDING back to none; R CMD check 0 errors,
#           0 warnings, 0 notes; ALL BATTERIES GREEN (12 run, 3458 checks).
#           Sandbox: the Expected block filled by running (fill.R) and the
#           section verified under rewalk() as in a straight run (harness.R
#           verify).
# RUN:      line-by-line first (read each block of output before moving on).
#           Also source()-safe: every writing call passes overwrite = TRUE.
#           Under source(), run WITH echo = TRUE, per the conventions file.
#           By section: source walk_tools.R, then rewalk("tables") shows the
#           sections the PENDING line names and rewalk("tables", "1") shows
#           one, each from a fresh Setup and its NEEDS. Add prepare = TRUE
#           to run only what the section needs and step through it by hand.
# SECTIONS: independent unless a framing comment says otherwise -- and then
#           the section carries a "# NEEDS: 1, 2" line inside its banner,
#           under the title, naming the sections rewalk() must run first.
# FORM:     read by rewalk() and by RStudio's document outline (S337): the
#           PENDING line above holds bare section ids; every PART / SECTION
#           title line ends in " ----"; banner rules are SPACED.
# ENDING:   the file MUST end with the executable end-marker line at the foot.
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# --- Setup -------------------------------------------------------------------

# jstats must be loaded already: devtools::load_all() (development) OR
# library(jstats) (installed) -- never both in one session.
stopifnot(exists("jload", mode = "function"))

# WIDTH (S406): since S406 jtable() prints a report (ruling R57) -- prose,
# which follows the console's width as every message does -- so the walk
# pins the message width at 76, as the other walks do, and hands back the
# entering value at the foot.
.entry_message_width <- getOption(".jst_options_message_width")
options(.jst_options_message_width = 76L)

# Load what THIS file needs -- jload(), never readRDS(); absolute path per
# JStats_Testing_File_Conventions.txt.
jload("E:/00 R Projects/00_jstats_test_data/datasets/community.rds",
      name = "tdat", overwrite = TRUE, quiet = TRUE)

# Neutral pipeline state (never assume the prior state is clean).
juse(tdat)
jsubset(clear.all = TRUE); jcomplete(clear.all = TRUE); joutput(NULL)
jdummy(clear.all = TRUE)
# The table is written to the session's temporary folder, never into the
# working directory; output.dir is left as it is.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 1 -- Table 1: descriptives under role headings, the preview and the Word file ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Jeff's Table 1 (the Table Layer Reference, Part 4.1): four variables of
# tdat under three role headings, two of them mean-centered (a specific
# note), a title and a general note of the user's. jtable() reports what it
# made (since S406, ruling R57: the table's number and title, what it holds
# and its page, and that no file was written); print(t1) then shows the
# preview: a facsimile of the Word table, under the apa style -- two
# caption lines, the three rules, the heads centered over their columns,
# the labels indented under their headings, the numbers aligned on the
# decimal point, the notes under the bottom rule. Then the same table
# written to a .docx in the temporary folder and opened in Word.

d1 <- jdesc(WellbeingScore, Income, Age, CommuteTime, print = FALSE)
t1 <- jtable(d1,
             headings = list("Outcome"          = WellbeingScore,
                             "Predictors"       = c(Income, Age),
                             "Control variable" = CommuteTime),
             markers  = list("Mean-centered" = c(Income, Age)),
             title    = "Descriptive Statistics for Study Variables",
             note     = "Wellbeing is scored from 0 to 100.")
print(t1)

# Expected:
#   Table 1. Descriptive Statistics for Study Variables (N = 103)
#     4 variables under 3 headings, on a portrait page.
#   The table was made in R; no Word file was asked for.
#
#   Table 1
#   Descriptive Statistics for Study Variables (N = 103)
#   -------------------------------------------------------------------------
#   Variable                         n       M          SD       Min     Max
#   -------------------------------------------------------------------------
#   Outcome
#     Wellbeing score (0-100)       103      50.89      11.48      25      81
#   Predictors
#     Annual income (USD)^a          97  49,855.67  17,427.22  14,000  93,000
#     Age (years)^a                 103      40.65      11.62      18      71
#   Control variable
#     Daily commute time (minutes)  103      30.74      12.68       5      58
#   -------------------------------------------------------------------------
#   Note. Wellbeing is scored from 0 to 100.
#   ^a Mean-centered.

# Things to look at (the preview):
#   - the caption: "Table 1" on one line, the title on the next (APA 7's
#     two lines; the file sets them bold and italic, which the console
#     cannot show); in the file they are the table's first row, as the
#     notes are its last (your placement, the apa default since this
#     session), which the console shows the same way;
#   - the heads n, M, SD, Min, Max centered over their columns, the stub
#     head "Variable" flush left;
#   - the role headings flush left, the variables indented two spaces
#     under them;
#   - the numbers: M and SD at two decimals with a thousands separator
#     (49,855.67), n a count, Min and Max at the data's own precision (the
#     whole numbers the data hold), every column aligned on the point;
#   - the marks: ^a after the two mean-centered labels (the caret says
#     "superscript"; the file sets a real superscript a), and the specific
#     note "^a Mean-centered." on its own line under the general note;
#   - since S410 (ruling R59, your words on build 1's walk) N after the
#     title, "(N = 103)", where it opened the general note;
#   - the general note: "Note." then your sentence.

# The same table to a Word file, opened in Word. print = FALSE leaves out
# jtable()'s report here; the file is what this call is for.
walk_file <- file.path(tempdir(), "Table1.docx")
jtable(t1, file = walk_file, overwrite = TRUE, print = FALSE)
if (interactive()) utils::browseURL(walk_file)

# Things to look at (in Word):
#   - the file opens with no repair prompt;
#   - "Table 1" in bold, the title in italics on the next line, "(N = 103)"
#     after it with the N upright (a symbol inside italic type is set
#     upright), INSIDE the table as its first row -- click into it and the
#     table's row handle shows; select the table and the caption and notes
#     come with it (the SEQ field: References > Insert Table of Figures
#     lists it);
#   - the three rules only -- above the heads, under them, under the last
#     row -- no vertical rules, none around the caption or the notes; Times
#     New Roman 12 throughout;
#   - n, M and SD in italics in the header; the role headings in italics,
#     spanning the table; the variables indented under them;
#   - the numbers aligned on the decimal point in each column (a decimal
#     tab stop in every number cell; the thing to check closely);
#   - the minus sign where a value is negative (none here), the thousands
#     separators, the superscript a on the two labels;
#   - "Note." in italics, your sentence, then the specific
#     note on its own line with its superscript a -- the table's last row,
#     under the bottom rule;
#   - the page: A4, portrait, one-inch margins; the table sized to its
#     contents and left-aligned.
# Try: select the whole table and paste it into a manuscript; then open
# the same file in LibreOffice or Google Docs if you have either.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 2 -- Table 2: frequencies, the preview and the Word file ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Jeff's Table 2 (the Table Layer Reference, Part 4.1), built at S401:
# three categorical variables of tdat in one table, each variable's label
# on a row of its own and its categories indented under it, with n and the
# percentage of ALL cases. Education and Smoker hold declared missing
# values (Refused, Don't know), so each closes on one Missing row, and every
# variable adds up to N = 103 and to 100 percent. First jtable()'s report
# and the preview print(t2) shows; then the same table in Word, opened by
# jtable() itself (open = TRUE).

f1 <- jfreq(Education, Region, Smoker, print = FALSE)
t2 <- jtable(f1)
print(t2)

# Expected:
#   Table 1. Frequency Distributions (N = 103)
#     3 variables, on a portrait page.
#   The table was made in R; no Word file was asked for.
#
#   Table 1
#   Frequency Distributions (N = 103)
#   ---------------------------------
#   Variable                  n    %
#   ---------------------------------
#   Highest education level
#     Some high school       23  22.3
#     High school graduate   18  17.5
#     Some college           25  24.3
#     Bachelor's degree      13  12.6
#     Graduate degree        18  17.5
#     Missing                 6   5.8
#   Region of residence
#     North                  27  26.2
#     South                  20  19.4
#     East                   31  30.1
#     West                   25  24.3
#   Current smoker
#     No                     65  63.1
#     Yes                    33  32.0
#     Missing                 5   4.9
#   ---------------------------------

# Things to look at (the preview):
#   - each variable's label flush left on a row of its own (in the file a
#     row spanning the table, in plain type), its categories indented two
#     spaces under it, named by their value labels;
#   - n the count, % the percentage of all 103 cases at one decimal;
#   - the Missing rows: Education's 6 (3 Refused, 3 Don't know) and
#     Smoker's 5, so each variable's n adds up to 103 and its % to 100;
#     Region has no missing data and no Missing row;
#   - the default title, "Frequency Distributions", with N after it,
#     "(N = 103)", and no note: N was all it held (ruling R59, S410).

# The same table to a Word file, opened in Word by jtable() (open = TRUE
# opens only in an interactive session, so a script or a knit opens
# nothing).
walk_file2 <- file.path(tempdir(), "Table2.docx")
jtable(t2, file = walk_file2, overwrite = TRUE, print = FALSE, open = TRUE)

# Things to look at (in Word):
#   - the file opens with no repair prompt, and Word is opened for you;
#   - the caption ("Table 1" bold, the title italic below it, "(N = 103)"
#     after it) as the first row, as in Table 1; no note row;
#   - each variable's label a row of its own spanning the table, upright
#     (not italic: those are role headings), its categories indented;
#     since the S407 second rebuild the first column as wide as the
#     longest label, a variable's label included ("Highest education
#     level"), as in the preview, the n and % columns beside it;
#   - n in italics in the header, % upright; the numbers on the decimal
#     point, each column of numbers centered under its head (S401);
#   - the three rules only.

# The call can change a setting of the table's own section (your S401
# okay): here every missing value on its own row by its label, and the
# valid and cumulative percentages beside n and %. The style is not
# touched; the next call is back to apa's settings. print() shows the table
# jtable() returns, after its report.
print(jtable(f1, missing.rows = "each",
             columns = c("n", "percent", "valid.percent", "cumulative")))

# Expected:
#   Table 1. Frequency Distributions (N = 103)
#     3 variables, on a portrait page.
#   The table was made in R; no Word file was asked for.
#
#   Table 1
#   Frequency Distributions (N = 103)
#   --------------------------------------------------------
#   Variable                  n    %   Valid %  Cumulative %
#   --------------------------------------------------------
#   Highest education level
#     Some high school       23  22.3    23.7        23.7
#     High school graduate   18  17.5    18.6        42.3
#     Some college           25  24.3    25.8        68.0
#     Bachelor's degree      13  12.6    13.4        81.4
#     Graduate degree        18  17.5    18.6       100.0
#     Refused                 3   2.9
#     Don't know              3   2.9
#   Region of residence
#     North                  27  26.2    26.2        26.2
#     South                  20  19.4    19.4        45.6
#     East                   31  30.1    30.1        75.7
#     West                   25  24.3    24.3       100.0
#   Current smoker
#     No                     65  63.1    66.3        66.3
#     Yes                    33  32.0    33.7       100.0
#     Refused                 5   4.9
#   --------------------------------------------------------

# Things to look at:
#   - Refused and Don't know as rows of their own, under Education and
#     Smoker, where Missing stood above;
#   - Valid % and Cumulative % blank on those rows, as SPSS leaves them;
#   - the heads, the numbers centered under them (in Word; the preview
#     right-aligns them under a wide head).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 3 -- A journal's style file: jstyle(), a copy, Tables 1 and 2 in it ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# A style file holds a journal's conventions (ruling R46). This section
# lists the styles, saves a complete copy of apa (the "Save TableLook As"
# step), then writes a short file for your journal -- based on apa, setting
# only what differs, as you would in Notepad; since S403 the zero before
# the point dropped on every number and, for its regression tables, the
# Gelman column in the last model and "s.e." for SE -- and makes Tables 1
# and 2 in it, one Word file holding both (Section 6 makes Tables 3 and 4
# in it). The walk keeps its style files in a
# folder of the session's temporary folder, set as the style folder and
# cleared at the end of the section, so nothing is written into your own
# folders. A path on the screen that holds this session's temporary
# folder is shown here as <tempdir>, and your working directory and your
# jstats folder by their names.

.walk_styles <- file.path(tempdir(), "walk_styles")
unlink(.walk_styles, recursive = TRUE)
joptions(style.dir = .walk_styles)

# Expected:
#   Options Settings
#   Style folder: <tempdir>/walk_styles
#   Run joptions() to see all settings.
#
#   Created the style folder:
#     <tempdir>/walk_styles

jstyle()

# Expected:
#   Styles
#     apa     built into jstats (the default)
#     report  built into jstats
#
#   jstats looks for a style file in these folders, in this order:
#     <tempdir>/walk_styles (the style folder)
#     <working directory> (the working directory)
#     <your jstats folder> (your jstats folder, not created yet)

# Things to look at:
#   - apa, built in and the default, and since S409 report, built in too
#     (Section 11); no style file yet;
#   - the three folders searched, in order: the style folder just set,
#     your working directory, and your jstats folder (R's per-user folder
#     for the package, which jstats creates only when you save a style
#     there).

jstyle("apa", save.as = "apa_copy")
cat(readLines(file.path(.walk_styles, "apa_copy.jstyle"), n = 25L,
              encoding = "UTF-8"), sep = "\n")

# Expected:
#   Style written to
#   <tempdir>/walk_styles/apa_copy.jstyle
#
#   # apa_copy.jstyle:
#   # A jstats table style.
#   # Every setting jstats has is below, each after a note saying what it does and what it takes.
#   # Change only the values after the = signs; do not invent a setting, and do not rename a setting or a section.
#   # A line that starts with # is a note.
#   # jstyle("apa_copy") checks the file and names any value it cannot use.
#   #
#   # To an AI assistant asked to edit this file so tables look like an example:
#   # Change only the values after the = signs, using only the values each setting's "# takes:" line allows.
#   # Keep every other line as it is, and return the whole file.
#   # Then say what the example has that these settings cannot make, rather than inventing a setting for it.
#
#   format     = 1
#   written.by = jstats 0.9.279
#   based.on   = apa
#
#   # The general settings: the look of every table.
#
#   # the typeface of every cell, caption and note
#   # takes: any text
#   font = Times New Roman
#
#   # the text size, in points
#   # takes: a number from 6 to 72
#   size = 12

# Things to look at: the file's head as Notepad shows it -- what the file
# is and, since S406, how to edit it, the two stamped lines and based.on,
# then each setting under its note on what it does and, since S406, a "#
# takes:" line saying what it takes (every setting of every table type
# follows). Since the S407 rebuild the head is the file's name on a line
# of its own, then one sentence a line, none wrapped; a note or a "#
# takes:" line runs on as long as it needs (until then each was broken at
# 76 columns). Since S409 (the review's entry 7) the editing rule is one
# wording, here, in the short file's head (Section 9) and in jai()'s
# orientation: "do not invent a setting, and do not rename a setting or a
# section" (it said "do not add, rename or remove a setting or a
# section", where the short file allows adding one from ?jstyle_settings);
# and a block under it is addressed to an AI assistant asked to make the
# tables look like an example -- values only, from the "# takes:" lines,
# the whole file back, and what the settings cannot make said rather than
# a setting invented (the AI route's first piece; the second is the
# prompt in ?jstyle). Five more head lines, so n = 23 showed the same
# settings as before. Since S410 (the S409 item, your words on build 1's
# walk) a blank line after each setting, none between a setting's notes
# and the setting, and one under the general settings' heading note
# (Claude's call, so the heading stands apart from font's notes): n = 25
# shows what n = 23 did.

writeLines(c("# myjournal.jstyle -- the journal's conventions",
             "based.on = apa",
             "caption.form = journal     # \"Table 1.\" and the title on one line",
             "marks = symbols            # daggers for the notes on rows",
             "leading.zero = never       # the zero before the point dropped everywhere",
             "",
             "[descriptives]",
             "columns = mean, sd, min, max",
             "mean.label = Mean",
             "sd.label = Std Dev.",
             "min.label = Minimum",
             "max.label = Maximum",
             "",
             "[regression]",
             "columns.last = beta.gelman # the Gelman column in the last model only",
             "se.label = s.e."),
           file.path(.walk_styles, "myjournal.jstyle"))
jstyle("myjournal")

# Expected:
#   Style: myjournal
#     <tempdir>/walk_styles/myjournal.jstyle
#     based on apa
#     Set in this file: caption.form, marks, leading.zero, [descriptives]
#     columns, mean.label, sd.label, min.label, max.label, [regression]
#     columns.last, and se.label.
#     Every other setting comes from apa.
#
#   font              = Times New Roman  # from apa
#   size              = 12               # from apa
#   paper             = a4               # from apa
#   caption.form      = journal
#   caption.position  = row              # from apa
#   caption.size      = size             # from apa
#   caption.fill      = none             # from apa
#   caption.text      = 000000           # from apa
#   header.fill       = none             # from apa
#   header.text       = 000000           # from apa
#   header.bold       = no               # from apa
#   band.fill         = none             # from apa
#   heading.fill      = none             # from apa
#   rules             = apa              # from apa
#   rule.color        = 000000           # from apa
#   note.label        = Note.            # from apa
#   note.label.italic = yes              # from apa
#   note.position     = row              # from apa
#   note.size         = size             # from apa
#   note.sentences    = paragraph        # from apa
#   note.order        = apa              # from apa
#   source.position   = note             # from apa
#   source.label      = Source:          # from apa
#   n.position        = title            # from apa
#   decimals          = 2                # from apa
#   leading.zero      = never
#   p.format          = exact            # from apa
#   p.decimals        = 3                # from apa
#   stars             = .05, .01, .001   # from apa
#   marks             = symbols
#   minus             = true             # from apa
#   thousands         = comma            # from apa
#   landscape         = auto             # from apa
#   line.spacing      = single           # from apa
#   percent.decimals  = 1                # from apa
#   filter.note       = yes              # from apa
#
#   [descriptives]
#   title          = Descriptive Statistics  # from apa
#   columns        = mean, sd, min, max
#   stub.label     = Variable                # from apa
#   n.label        = n                       # from apa
#   mean.label     = Mean
#   sd.label       = Std Dev.
#   min.label      = Minimum
#   max.label      = Maximum
#   group.headings = italic                  # from apa
#
#   [frequencies]
#   title               = Frequency Distributions  # from apa
#   columns             = n, percent               # from apa
#   stub.label          = Variable                 # from apa
#   n.label             = n                        # from apa
#   percent.label       = %                        # from apa
#   valid.percent.label = Valid %                  # from apa
#   cumulative.label    = Cumulative %             # from apa
#   missing.rows        = combined                 # from apa
#   missing.label       = Missing                  # from apa
#   variable.headings   = plain                    # from apa
#   group.headings      = italic                   # from apa
#
#   [regression]
#   title             = Regression Coefficients Predicting {outcome}  # from apa
#   columns           = b, se, beta, p              # from apa
#   columns.last      = beta.gelman
#   stub.label        = Predictor                   # from apa
#   b.label           = b                           # from apa
#   se.label          = s.e.
#   beta.label        = β                           # from apa
#   p.label           = p                           # from apa
#   t.label           = t                           # from apa
#   ci.label          = 95% CI                      # from apa
#   beta.gelman.label = β*                          # from apa
#   ci.style          = one                         # from apa
#   intercept         = yes                         # from apa
#   intercept.label   = Constant                    # from apa
#   fit.rows          = r2                          # from apa
#   reference         = row                         # from apa
#   reference.label   = reference                   # from apa
#   variable.headings = plain                       # from apa
#   group.headings    = italic                      # from apa
#
#   [logistic]
#   title             = Logistic Regression Coefficients Predicting {outcome}  # from apa
#   columns           = b, se, or, p                # from apa
#   columns.last      = none                        # from apa
#   stub.label        = Predictor                   # from apa
#   b.label           = b                           # from apa
#   se.label          = SE                          # from apa
#   or.label          = OR                          # from apa
#   p.label           = p                           # from apa
#   wald.label        = Wald                        # from apa
#   ci.label          = 95% CI for OR               # from apa
#   beta.gelman.label = β*                          # from apa
#   ci.style          = one                         # from apa
#   intercept         = yes                         # from apa
#   intercept.label   = Constant                    # from apa
#   fit.rows          = chisq, nagelkerke           # from apa
#   reference         = row                         # from apa
#   reference.label   = reference                   # from apa
#   variable.headings = plain                       # from apa
#   group.headings    = italic                      # from apa
#
#   [correlation]
#   title          = Descriptive Statistics and Correlations for Study Variables  # from apa
#   columns        = n, mean, sd                 # from apa
#   stub.label     = Variable                    # from apa
#   n.label        = n                           # from apa
#   mean.label     = M                           # from apa
#   sd.label       = SD                          # from apa
#   lower.triangle = yes                         # from apa
#   r.stars        = yes                         # from apa
#   method.note    = yes                         # from apa
#
#   [ttest]
#   title         = Means, Standard Deviations, and t Tests by {group}  # from apa
#   columns       = mean, sd, t, p, d           # from apa
#   stub.label    = Variable                    # from apa
#   n.label       = n                           # from apa
#   mean.label    = M                           # from apa
#   sd.label      = SD                          # from apa
#   t.label       = t                           # from apa
#   df.label      = df                          # from apa
#   df.position   = head                        # from apa
#   p.label       = p                           # from apa
#   d.label       = d                           # from apa
#   diff.label    = Mean difference             # from apa
#   ci.label      = 95% CI                      # from apa
#   ci.style      = one                         # from apa
#   group.spanner = yes                         # from apa
#   test.note     = yes                         # from apa
#
#   [anova]
#   title         = Means, Standard Deviations, and One-Way Analyses of Variance by {group}  # from apa
#   columns       = mean, sd, f, p, eta2        # from apa
#   stub.label    = Variable                    # from apa
#   n.label       = n                           # from apa
#   mean.label    = M                           # from apa
#   sd.label      = SD                          # from apa
#   f.label       = F                           # from apa
#   df.label      = df                          # from apa
#   df.position   = head                        # from apa
#   p.label       = p                           # from apa
#   eta2.label    = η²                          # from apa
#   group.spanner = yes                         # from apa
#   test.note     = yes                         # from apa
#
#   [crosstab]
#   title             = Frequencies and Percentages by {group}  # from apa
#   columns           = n, percent                  # from apa
#   total             = yes                         # from apa
#   percent.base      = column                      # from apa
#   test.columns      = chisq, df, p, v             # from apa
#   stub.label        = Variable                    # from apa
#   n.label           = n                           # from apa
#   percent.label     = %                           # from apa
#   total.label       = Total                       # from apa
#   chisq.label       = χ²                          # from apa
#   df.label          = df                          # from apa
#   p.label           = p                           # from apa
#   v.label           = V                           # from apa
#   group.spanner     = yes                         # from apa
#   variable.headings = plain                       # from apa
#
#   [reliability]
#   title                  = Item Statistics and Reliability  # from apa
#   columns                = mean, sd, item.total, alpha.if.deleted  # from apa
#   stub.label             = Item                        # from apa
#   mean.label             = M                           # from apa
#   sd.label               = SD                          # from apa
#   item.total.label       = Item-total *r*              # from apa
#   alpha.if.deleted.label = α if item deleted           # from apa
#   alpha                  = yes                         # from apa
#   item.total.note        = yes                         # from apa
#   group.headings         = italic                      # from apa
#
#   [multiresponse]
#   title         = {set}          # from apa
#   columns       = n, percent     # from apa
#   stub.label    = Option         # from apa
#   n.label       = n              # from apa
#   percent.label = %              # from apa
#   none.label    = None of these  # from apa
#   choice.note   = yes            # from apa
#
#   [plot]
#   font            = Arial   # from apa
#   size            = 10      # from apa
#   palette         = greys   # from apa
#   gridlines       = none    # from apa
#   grid.color      = D9D9D9  # from apa
#   axis.lines      = both    # from apa
#   legend.position = right   # from apa
#   values          = yes     # from apa
#   values.grouped  = no      # from apa
#   width           = 6       # from apa
#   height          = 4       # from apa
#   resolution      = 300     # from apa
#   data.file       = no      # from apa
#   vector.file     = none    # from apa

# Things to look at:
#   - the settings myjournal sets, unmarked; every other "# from apa" --
#     the file names no [frequencies] or [logistic] section, so those
#     tables take apa's, in the journal's caption form;
#   - n.position (ruling R51) where note.n stood: note | title | none,
#     apa's title since S410 (ruling R59);
#     filter.note (build 4), yes | no: the filter sentence in a table's
#     note;
#   - the [regression] and [logistic] sections (build 3), every key with
#     apa's value but the two the file sets;
#   - the five sections build 4 adds, after [logistic]: [correlation],
#     [ttest], [anova], [crosstab] and [reliability], each key with apa's
#     value (their names are Claude's calls, for this walk);
#   - since S409 three more general settings, each beside its kin and off
#     in apa: caption.fill = none after caption.size, heading.fill = none
#     after band.fill, note.label.italic = yes after note.label (the
#     looks Section 11 shows);
#   - the printout is itself a style file's form: a line can be copied
#     into the file.

d1 <- jdesc(WellbeingScore, Income, Age, CommuteTime, print = FALSE)
t1j <- jtable(d1, style = "myjournal",
              headings = list("Outcome"          = WellbeingScore,
                              "Predictors"       = c(Income, Age),
                              "Control variable" = CommuteTime),
              markers  = list("Mean-centered" = c(Income, Age)),
              title    = "Descriptive Statistics for Study Variables",
              note     = "Wellbeing is scored from 0 to 100.")
print(t1j)

# Expected:
#   Table 1. Descriptive Statistics for Study Variables (N = 103)
#     4 variables under 3 headings, on a portrait page.
#   The table was made in R; no Word file was asked for.
#
#   Table 1. Descriptive Statistics for Study Variables (N = 103)
#   ----------------------------------------------------------------------
#   Variable                           Mean     Std Dev.  Minimum  Maximum
#   ----------------------------------------------------------------------
#   Outcome
#     Wellbeing score (0-100)           50.89      11.48       25       81
#   Predictors
#     Annual income (USD)†          49,855.67  17,427.22   14,000   93,000
#     Age (years)†                      40.65      11.62       18       71
#   Control variable
#     Daily commute time (minutes)      30.74      12.68        5       58
#   ----------------------------------------------------------------------
#   Note. Wellbeing is scored from 0 to 100.
#   † Mean-centered.

f1 <- jfreq(Education, Region, Smoker, print = FALSE)
t2j <- jtable(f1, style = "myjournal")
print(t2j)

# Expected:
#   Table 1. Frequency Distributions (N = 103)
#     3 variables, on a portrait page.
#   The table was made in R; no Word file was asked for.
#
#   Table 1. Frequency Distributions (N = 103)
#   ---------------------------------
#   Variable                  n    %
#   ---------------------------------
#   Highest education level
#     Some high school       23  22.3
#     High school graduate   18  17.5
#     Some college           25  24.3
#     Bachelor's degree      13  12.6
#     Graduate degree        18  17.5
#     Missing                 6   5.8
#   Region of residence
#     North                  27  26.2
#     South                  20  19.4
#     East                   31  30.1
#     West                   25  24.3
#   Current smoker
#     No                     65  63.1
#     Yes                    33  32.0
#     Missing                 5   4.9
#   ---------------------------------

# Things to look at (the previews):
#   - "Table 1. Descriptive Statistics for Study Variables (N = 103)" on
#     one line;
#   - Table 1's columns Mean, Std Dev., Minimum and Maximum, no n;
#   - the dagger in place of ^a, on the two labels and in the note;
#   - Table 2 as in Section 2, its caption on one line.

walk_file3 <- file.path(tempdir(), "Tables_myjournal.docx")
jtable(list(t1j, t2j), file = walk_file3, overwrite = TRUE, print = FALSE,
       open = TRUE)
joptions(style.dir = NULL, quiet = TRUE)

# Things to look at (in Word):
#   - two tables, numbered 1 and 2 (References > Insert Table of Figures
#     lists both);
#   - each caption bold "Table 1." / "Table 2." then the title, on one
#     line;
#   - Table 1's four columns and their heads (Mean, Std Dev., Minimum,
#     Maximum: upright, since the labels are words; italic was apa's M and
#     SD), the superscript daggers;
#   - Table 2 as in Section 2.
# The journal's name is a placeholder, as you said ("just leave this first
# style what you have it"): a style's name is its file's name, so renaming
# myjournal.jstyle renames the style.



# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 4 -- Table 3: four nested regression models, the preview and the Word file ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Jeff's Table 3 (the Table Layer Reference, Part 4.1; the S402 sketch,
# built at S403): four nested models of wellbeing on tdat, side by side.
# Region is dummy-coded (jdummy()), Education treated as numeric
# (jnumeric()), and jcomplete() set over the largest model's variables,
# so every model is fit on the same 92 cases. The models are fit quietly;
# the table is what this section is for. First jtable()'s report, then the
# preview print(t3) shows, under the apa style: a spanner over each model's
# four columns (b, SE, beta, p), the Constant first, the predictors in the
# models' order, Region's categories indented under its label with the
# reference category named after it, R2 under each model's b. Then the
# same table in Word, opened by jtable().

jdummy(Region)
jnumeric(Education)
jcomplete(WellbeingScore, Volunteer, Age, Smoker, Region, Education,
          CommuteTime)
m1 <- jlm(WellbeingScore ~ Age, print = FALSE)
m2 <- jlm(WellbeingScore ~ Age + Smoker + Region, print = FALSE)
m3 <- jlm(WellbeingScore ~ Age + Smoker + Region + Education, print = FALSE)
m4 <- jlm(WellbeingScore ~ Age + Smoker + Region + Education + CommuteTime,
          print = FALSE)
t3 <- jtable(list(m1, m2, m3, m4))
print(t3)

# Expected:
#   Table 1. Regression Coefficients Predicting Wellbeing score (0-100) (N = 92)
#     4 models side by side, on a landscape page, its text at 10 pt, long labels
#     on two lines.
#   The table was made in R; no Word file was asked for.
#
#   Table 1
#   Regression Coefficients Predicting Wellbeing score (0-100) (N = 92)
#   -----------------------------------------------------------------------------------------------------------------------------------------------
#                                                    Model 1                   Model 2                   Model 3                   Model 4
#   Predictor                                  b     SE    β     p      b     SE     β     p      b     SE     β     p       b     SE     β     p
#   -----------------------------------------------------------------------------------------------------------------------------------------------
#   Constant                                 36.19  4.07       <.001  37.10  4.67        <.001  20.97  4.45        <.001  21.01   5.07        <.001
#   Age (years)                               0.37  0.10  .38  <.001   0.38  0.10   .39  <.001   0.40  0.08   .41  <.001   0.40   0.08   .41  <.001
#   Current smoker                                                     1.84  2.41   .08   .446   3.88  1.97   .16   .052   3.88   2.00   .16   .056
#   Region of residence (reference = North)
#     South                                                           -3.97  3.42  -.14   .248  -0.98  2.80  -.03   .727  -0.98   2.81  -.03   .728
#     East                                                            -1.68  3.05  -.07   .584   0.48  2.48   .02   .847   0.49   2.52   .02   .848
#     West                                                            -3.63  3.25  -.13   .268  -3.40  2.63  -.13   .199  -3.40   2.65  -.13   .203
#   Highest education level                                                                      4.65  0.68   .56  <.001   4.65   0.69   .56  <.001
#   Daily commute time (minutes)                                                                                          -0.001  0.08   .00   .987
#   R²                                         .14                      .16                       .46                       .46
#   -----------------------------------------------------------------------------------------------------------------------------------------------

# Things to look at (the preview):
#   - the title from the style's template, naming the outcome by its
#     variable label as written (ruling R49: "Predicting", never
#     "dependent variable"); the stub head "Predictor";
#   - "Model 1" to "Model 4" centered over their columns (a named list,
#     jtable(list("Baseline" = m1, "Full" = m4)), puts the names there);
#   - the heads: b, SE and p (italic in the file), beta (upright: a Greek
#     letter, APA's rule);
#   - the Constant first, its beta cell empty; the predictors in the
#     order they enter the models; a model's missing predictor a blank;
#   - Region: its label as a row, "(reference = North)" after it, South,
#     East and West indented under it, named by their value labels; the
#     0/1 variable Smoker as one row under its own label ("Current
#     smoker");
#   - the numbers: b and SE at two decimals with the zero, beta and p
#     without it (APA's rule for a statistic bounded by 1), p's floor
#     "<.001" hanging left of the point; CommuteTime's b, which rounds to
#     0.00, printed as -0.001 so its sign and size show;
#   - R2 under each model's b, without a zero; "(N = 92)" after the title
#     (ruling R59, S410), and no note: N was all it held.

walk_file4 <- file.path(tempdir(), "Table3.docx")
jtable(t3, file = walk_file4, overwrite = TRUE, print = FALSE, open = TRUE)

# Things to look at (in Word):
#   - the file opens with no repair prompt, on a LANDSCAPE page: the
#     table cannot fit a portrait page even with its labels on two lines
#     (landscape = auto, ruling R55);
#   - the table FITTED to the page (ruling R55, S405): its number columns
#     lose half their padding, then a label may wrap onto two lines, then
#     the font steps down a point at a time -- here to 10 pt, with "Daily
#     commute time (minutes)" on two lines (9 pt with every label on one
#     line before this build); no number wraps; the caption keeps 12 pt
#     (a note steps down with the table; this one has none since S410); a
#     table that fits needs none of this;
#   - the spanner row: "Model 1" to "Model 4", each over its four columns,
#     a rule under each; the rule above them is the table's top rule;
#   - b, SE and p italic in the heads, beta upright; R2 an italic R with
#     a superscript 2;
#   - "Region of residence (reference = North)" spanning the table, the
#     three categories indented under it;
#   - every column on its decimal point; the minus sign on the negative
#     coefficients; "-0.001" for CommuteTime;
#   - R2 on the b column's point, in a cell that spans the model's four
#     columns (click into it): an F's df would run on under SE and beta
#     instead of widening b;
#   - "(N = 92)" after the title, the N upright in the italic line; no
#     note row (ruling R59, S410).
# Try: Insert > Table of Figures lists "Table 1" with its title.

# The settings a call can change for this table (your S402 answers): the
# Gelman column in the last model only (columns.last), every fit row --
# adjusted R2, F with its df, delta R2 and its F test, N -- and the
# reference category named in the note instead of after the label. A
# style file sets the same keys for every table it makes (Section 6).
print(jtable(list(m1, m2, m3, m4), columns.last = "beta.gelman",
             fit.rows = c("r2", "adj.r2", "f", "delta.r2", "f.change", "n"),
             reference = "note"))

# Expected:
#   Table 1. Regression Coefficients Predicting Wellbeing score (0-100) (N = 92)
#     4 models side by side, on a landscape page, its text at 9 pt.
#   The table was made in R; no Word file was asked for.
#
#   Table 1
#   Regression Coefficients Predicting Wellbeing score (0-100) (N = 92)
#   -------------------------------------------------------------------------------------------------------------------------------------------
#                                         Model 1                   Model 2                   Model 3                       Model 4
#   Predictor                       b     SE    β     p      b     SE     β     p      b     SE     β     p       b     SE     β     p      β*
#   -------------------------------------------------------------------------------------------------------------------------------------------
#   Constant                      36.19  4.07       <.001  37.10  4.67        <.001  20.97  4.45        <.001  21.01   5.07        <.001
#   Age (years)                    0.37  0.10  .38  <.001   0.38  0.10   .39  <.001   0.40  0.08   .41  <.001   0.40   0.08   .41  <.001   9.51
#   Current smoker                                          1.84  2.41   .08   .446   3.88  1.97   .16   .052   3.88   2.00   .16   .056   3.88
#   Region of residence
#     South                                                -3.97  3.42  -.14   .248  -0.98  2.80  -.03   .727  -0.98   2.81  -.03   .728  -0.98
#     East                                                 -1.68  3.05  -.07   .584   0.48  2.48   .02   .847   0.49   2.52   .02   .848   0.49
#     West                                                 -3.63  3.25  -.13   .268  -3.40  2.63  -.13   .199  -3.40   2.65  -.13   .203  -3.40
#   Highest education level                                                           4.65  0.68   .56  <.001   4.65   0.69   .56  <.001  13.08
#   Daily commute time (minutes)                                                                               -0.001  0.08   .00   .987  -0.03
#   R²                              .14                      .16                       .46                       .46
#   Adjusted R²                     .13                      .11                       .42                       .42
#   F                             14.74 (1, 90)             3.36 (5, 86)             12.10 (6, 85)             10.25 (7, 84)
#   ΔR²                                                      .02                       .30                       .00
#   ΔF                                                      0.59 (4, 86)             46.84 (1, 85)              0.00 (1, 84)
#   N                             92                       92                        92                        92
#   -------------------------------------------------------------------------------------------------------------------------------------------
#   Note. Reference category for Region of residence: North. β* = Gelman's
#   (2008) standardized coefficient: each continuous predictor divided by two
#   standard deviations, each binary predictor kept at 0 and 1.

# Things to look at:
#   - beta* in Model 4 only, defined in the general note (Gelman's
#     standardization, as ?jlm describes it);
#   - the fit rows: F with its df in parentheses, delta R2 from Model 2 on
#     (each model holds the one before it, on the same cases), the F test
#     of each delta R2 with its df, N under every model;
#   - "Reference category for Region of residence: North." in the note,
#     and nothing after Region's label.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 5 -- Table 4: the logistic twin, four models of volunteering ----
# NEEDS: 4
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The same four models with Volunteer as the outcome, through jlogistic():
# the same builder, with the odds ratio in place of beta and the model
# chi-square and Nagelkerke's R2 as the fit rows (Section 4 set the
# registrations and the complete-cases filter, so N = 92 here too).

g1 <- jlogistic(Volunteer ~ Age, print = FALSE)
g2 <- jlogistic(Volunteer ~ Age + Smoker + Region, print = FALSE)
g3 <- jlogistic(Volunteer ~ Age + Smoker + Region + Education, print = FALSE)
g4 <- jlogistic(Volunteer ~ Age + Smoker + Region + Education + CommuteTime,
                print = FALSE)
t4 <- jtable(list(g1, g2, g3, g4))
print(t4)

# Expected:
#   Table 1. Logistic Regression Coefficients Predicting Volunteered in past
#   year (N = 92)
#     4 models side by side, on a landscape page, its text at 11 pt, long labels
#     on two lines.
#   The table was made in R; no Word file was asked for.
#
#   Table 1
#   Logistic Regression Coefficients Predicting Volunteered in past year (N = 92)
#   ---------------------------------------------------------------------------------------------------------------------------------------------
#                                                    Model 1                  Model 2                   Model 3                   Model 4
#   Predictor                                  b     SE    OR     p     b     SE    OR     p     b     SE    OR     p      b     SE    OR     p
#   ---------------------------------------------------------------------------------------------------------------------------------------------
#   Constant                                 -1.95  0.82  0.14  .017  -1.65  0.91  0.19  .070  -3.97  1.23  0.02   .001  -4.71  1.39  0.01  <.001
#   Age (years)                               0.05  0.02  1.05  .016   0.05  0.02  1.05  .021   0.05  0.02  1.06   .011   0.05  0.02  1.05   .013
#   Current smoker                                                    -0.05  0.46  0.95  .908   0.22  0.51  1.25   .665   0.30  0.52  1.35   .563
#   Region of residence (reference = North)
#     South                                                           -0.90  0.67  0.41  .175  -0.66  0.72  0.52   .357  -0.64  0.73  0.53   .375
#     East                                                            -0.26  0.58  0.77  .650  -0.08  0.62  0.92   .895  -0.18  0.63  0.83   .769
#     West                                                             0.05  0.62  1.05  .941   0.06  0.67  1.06   .932   0.01  0.68  1.01   .994
#   Highest education level                                                                     0.61  0.18  1.84  <.001   0.63  0.19  1.88  <.001
#   Daily commute time (minutes)                                                                                          0.02  0.02  1.02   .223
#   Model χ²                                  6.37 (1)                 8.87 (5)                21.52 (6)                 23.03 (7)
#   Nagelkerke R²                              .09                      .12                      .28                       .30
#   ---------------------------------------------------------------------------------------------------------------------------------------------

# Things to look at (the preview):
#   - the title "Logistic Regression Coefficients Predicting ..." with the
#     outcome's label;
#   - the columns b, SE, OR, p per model -- OR the odds ratio, exp(b),
#     with its zero kept (it is not bounded by 1); the Constant's OR
#     shown as jlogistic() prints it;
#   - the fit rows: "Model chi-square" with its df in parentheses, then
#     Nagelkerke R2; the Wald statistic, the CI for the odds ratio, the
#     Gelman column, Cox and Snell R2, -2 log likelihood, AIC and N are
#     available through columns = and fit.rows =, and each can be left
#     out (ruling R53).

walk_file5 <- file.path(tempdir(), "Table4.docx")
jtable(t4, file = walk_file5, overwrite = TRUE, print = FALSE, open = TRUE)

# Things to look at (in Word): as Table 3 -- landscape, fitted, OR italic
# in the heads, "Model chi-square" with the Greek letter and a superscript 2.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 6 -- Tables 3 and 4 in the journal's style, one Word file ----
# NEEDS: 3, 5
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The journal file Section 3 wrote (myjournal.jstyle in the walk's style
# folder: the one-line caption, daggers, the zero before the point dropped
# on every number, the Gelman column in the last model, "s.e." for SE)
# applied to the four regression models and the four logistic models, both
# tables written to one Word file. The style folder is set again here
# (Section 3 cleared it at its end).

joptions(style.dir = .walk_styles, quiet = TRUE)
t3j <- jtable(list(m1, m2, m3, m4), style = "myjournal")
print(t3j)

# Expected:
#   Table 1. Regression Coefficients Predicting Wellbeing score (0-100) (N = 92)
#     4 models side by side, on a landscape page, its text at 9 pt.
#   The table was made in R; no Word file was asked for.
#
#   Table 1. Regression Coefficients Predicting Wellbeing score (0-100) (N = 92)
#   ------------------------------------------------------------------------------------------------------------------------------------------------------
#                                                    Model 1                   Model 2                   Model 3                       Model 4
#   Predictor                                  b    s.e.   β     p      b    s.e.    β     p      b    s.e.    β     p       b    s.e.    β     p      β*
#   ------------------------------------------------------------------------------------------------------------------------------------------------------
#   Constant                                 36.19  4.07       <.001  37.10  4.67        <.001  20.97  4.45        <.001  21.01   5.07        <.001
#   Age (years)                                .37   .10  .38  <.001    .38   .10   .39  <.001    .40   .08   .41  <.001    .40    .08   .41  <.001   9.51
#   Current smoker                                                     1.84  2.41   .08   .446   3.88  1.97   .16   .052   3.88   2.00   .16   .056   3.88
#   Region of residence (reference = North)
#     South                                                           -3.97  3.42  -.14   .248   -.98  2.80  -.03   .727   -.98   2.81  -.03   .728   -.98
#     East                                                            -1.68  3.05  -.07   .584    .48  2.48   .02   .847    .49   2.52   .02   .848    .49
#     West                                                            -3.63  3.25  -.13   .268  -3.40  2.63  -.13   .199  -3.40   2.65  -.13   .203  -3.40
#   Highest education level                                                                      4.65   .68   .56  <.001   4.65    .69   .56  <.001  13.08
#   Daily commute time (minutes)                                                                                           -.001   .08   .00   .987   -.03
#   R²                                         .14                      .16                       .46                       .46
#   ------------------------------------------------------------------------------------------------------------------------------------------------------
#   Note. β* = Gelman's (2008) standardized coefficient: each continuous
#   predictor divided by two standard deviations, each binary predictor kept
#   at 0 and 1.

t4j <- jtable(list(g1, g2, g3, g4), style = "myjournal")
print(t4j)

# Expected:
#   Table 1. Logistic Regression Coefficients Predicting Volunteered in past
#   year (N = 92)
#     4 models side by side, on a landscape page, its text at 11 pt, long labels
#     on two lines.
#   The table was made in R; no Word file was asked for.
#
#   Table 1. Logistic Regression Coefficients Predicting Volunteered in past year (N = 92)
#   -------------------------------------------------------------------------------------------------------------------------------------------
#                                                    Model 1                 Model 2                  Model 3                   Model 4
#   Predictor                                  b     SE   OR     p     b     SE   OR     p     b     SE    OR     p      b     SE    OR     p
#   -------------------------------------------------------------------------------------------------------------------------------------------
#   Constant                                 -1.95  .82   .14  .017  -1.65  .91   .19  .070  -3.97  1.23   .02   .001  -4.71  1.39   .01  <.001
#   Age (years)                                .05  .02  1.05  .016    .05  .02  1.05  .021    .05   .02  1.06   .011    .05   .02  1.05   .013
#   Current smoker                                                    -.05  .46   .95  .908    .22   .51  1.25   .665    .30   .52  1.35   .563
#   Region of residence (reference = North)
#     South                                                           -.90  .67   .41  .175   -.66   .72   .52   .357   -.64   .73   .53   .375
#     East                                                            -.26  .58   .77  .650   -.08   .62   .92   .895   -.18   .63   .83   .769
#     West                                                             .05  .62  1.05  .941    .06   .67  1.06   .932    .01   .68  1.01   .994
#   Highest education level                                                                    .61   .18  1.84  <.001    .63   .19  1.88  <.001
#   Daily commute time (minutes)                                                                                         .02   .02  1.02   .223
#   Model χ²                                  6.37 (1)                8.87 (5)               21.52 (6)                 23.03 (7)
#   Nagelkerke R²                              .09                     .12                     .28                       .30
#   -------------------------------------------------------------------------------------------------------------------------------------------

# Things to look at (the previews):
#   - "Table 1. Regression Coefficients ..." on one line;
#   - no zero before the point anywhere: ".37" for a b, ".10" for an SE
#     (the journal's form), where apa keeps it on b and SE;
#   - "s.e." in SE's place (upright: a word, not the symbol);
#   - beta* in Model 4 only, and its sentence in the note -- the file's
#     [regression] section, so every regression table it makes has it;
#   - the logistic table takes apa's [logistic] settings in the journal's
#     caption form and number form (the file sets no [logistic] section).

walk_file6 <- file.path(tempdir(), "Tables_myjournal_models.docx")
jtable(list(t3j, t4j), file = walk_file6, overwrite = TRUE, print = FALSE,
       open = TRUE)
joptions(style.dir = NULL, quiet = TRUE)

# Things to look at (in Word):
#   - two tables, "Table 1." and "Table 2." then the titles on one line,
#     two empty lines between the tables (your S401 request);
#   - each fitted to the landscape page as in Sections 4 and 5;
#   - ".37", ".10", beta*, s.e. as in the previews;
#   - Table 1, Model 4's b column: 21.01 and -3.40 on the point with the
#     rest (the S405 rebuild: the column now holds -3.40's whole part
#     beside -.001's tail; Word had pushed both off the point).

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 7 -- Build 4's five tables: correlations, t tests, ANOVAs, crosstabs, items; one Word file ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Build 4 (S405): the five table types the S404 sketch drew, as your S404
# answers settled them (rulings R54 and R55, the eight leans), each from
# results of tdat. Results share a table when they share its columns
# (ruling R54): three t tests of one grouping variable stack a row per
# outcome, as do three ANOVAs and three crosstabs; a jcorr() result is a
# table of its own. First the five tables, each reported by jtable() and
# shown by print(), then the five in one Word file, then the item table on
# its own. The section works on a copy
# of tdat, d7, so the settings Sections 4 to 6 leave on tdat (the
# complete-cases filter, the registrations) do not reach it when the file
# is run straight through.

d7 <- tdat
c1 <- jcorr(d7, WellbeingScore, Income, Age, CommuteTime, print = FALSE)
t5 <- jtable(c1)
print(t5)
# Expected:
#   Table 1. Descriptive Statistics and Correlations for Study Variables
#     4 variables, on a portrait page, long labels on two lines.
#   The table was made in R; no Word file was asked for.
#
#   Table 1
#   Descriptive Statistics and Correlations for Study Variables
#   ----------------------------------------------------------------------------------
#   Variable                          n       M          SD        1       2     3   4
#   ----------------------------------------------------------------------------------
#   1. Wellbeing score (0-100)       103      50.89      11.48     —
#   2. Annual income (USD)            97  49,855.67  17,427.22   .62***    —
#   3. Age (years)                   103      40.65      11.62   .34***  .29**   —
#   4. Daily commute time (minutes)  103      30.74      12.68  -.07     .01    .07  —
#   ----------------------------------------------------------------------------------
#   Note. Pairwise ns range from 97 to 103.
#   *p < .05. **p < .01. ***p < .001.

# Things to look at:
#   - APA's sample form: the variables numbered, each one's n, M and SD on
#     its own cases (Annual income has 97), then a column per variable
#     headed 1 to 4;
#   - each correlation once, below the diagonal, without the zero (r is
#     bounded by 1), its stars hanging right of the point; an em dash
#     centered on the diagonal; the upper triangle empty;
#   - "Pairwise ns range from 97 to 103." (one N when every pair shares
#     it), then the stars' legend.

tt1 <- jt(WellbeingScore ~ Volunteer, d7, print = FALSE)
tt2 <- jt(Age ~ Volunteer, d7, print = FALSE)
tt3 <- jt(CommuteTime ~ Volunteer, d7, print = FALSE)
t6 <- jtable(list(tt1, tt2, tt3))
print(t6)
# Expected:
#   Table 1. Means, Standard Deviations, and t Tests by Volunteered in past year
#     3 outcomes by Volunteer, on a portrait page, long labels on two lines.
#   The table was made in R; no Word file was asked for.
#
#   Table 1
#   Means, Standard Deviations, and t Tests by Volunteered in past year
#   -----------------------------------------------------------------------------
#                                  Volunteered in past year
#                                      No            Yes
#   Variable                        M      SD     M      SD   t(101)    p     d
#   -----------------------------------------------------------------------------
#   Wellbeing score (0-100)       47.46  11.70  54.67  10.06   -3.34  .001  -0.66
#   Age (years)                   37.41  11.24  44.22  11.07   -3.10  .003  -0.61
#   Daily commute time (minutes)  29.35  11.16  32.27  14.13   -1.17  .246  -0.23
#   -----------------------------------------------------------------------------
#   Note. n = 54 (No) and 49 (Yes).

# Things to look at:
#   - the title names the grouping variable by its label (the {group}
#     placeholder); the stub head "Variable";
#   - "Volunteered in past year" over the groups, each group's value label
#     over its M and SD;
#   - t with its df in the head, "t(101)" (in the file the t italic, the
#     df upright), since every row shares them -- rows whose df differ get
#     a df column; then p, and Cohen's d with its zero (d is not bounded
#     by 1), its sign the first group's mean minus the second's, as jt()
#     prints it;
#   - the groups' ns in the note: "n = 54 (No) and 49 (Yes)."

jnumeric(d7, Education)
# Expected:
#   Numeric registration set for 'Education' in d7.
#   Note: this registration is stored for this session only.
#   To keep it across sessions, save the data frame in R format (.rds):
#     jsave(d7, "d7.rds")
#
#   Next session, load that file to restore the registration:
#     jload("d7.rds")

a1 <- jaov(WellbeingScore ~ Region, d7, print = FALSE)
a2 <- jaov(Education ~ Region, d7, print = FALSE)
a3 <- jaov(CommuteTime ~ Region, d7, print = FALSE)
t7 <- jtable(list(a1, a2, a3))
print(t7)
# Expected:
#   Table 1. Means, Standard Deviations, and One-Way Analyses of Variance by
#   Region of residence
#     3 outcomes by Region, on a landscape page.
#   The table was made in R; no Word file was asked for.
#
#   Table 1
#   Means, Standard Deviations, and One-Way Analyses of Variance by Region of residence
#   ------------------------------------------------------------------------------------------------------------
#                                                   Region of residence
#                                     North         South         East          West
#   Variable                        M      SD     M      SD     M      SD     M      SD     F     df     p    η²
#   ------------------------------------------------------------------------------------------------------------
#   Wellbeing score (0-100)       52.96  10.15  48.15  14.74  50.94   9.94  50.80  11.92  0.67  3, 99  .574  .02
#   Highest education level        3.04   1.40   2.47   1.22   2.79   1.45   3.00   1.57  0.69  3, 93  .558  .02
#   Daily commute time (minutes)  29.00  14.15  28.20   7.98  33.39  13.35  31.36  13.24  0.90  3, 99  .442  .03
#   ------------------------------------------------------------------------------------------------------------
#   Note. Group ns vary with missing data: North, 26 to 27; South, 19 to 20;
#   East, 29 to 31; West, 23 to 25.

# Things to look at:
#   - the same frame for four regions, each region's M and SD under its
#     value label, in code order;
#   - Highest education level as an outcome: registered as numeric above
#     (jnumeric()), so jaov() takes it without its seems-categorical
#     warning;
#   - F, then a df column -- the education level's missing cases give it
#     3, 93 where the others have 3, 99 -- the df centered in their cells;
#     then p, and eta2 (the Greek letter, upright) without the zero;
#   - "Group ns vary with missing data:" and each region's range.

x1 <- jcrosstab(Smoker ~ Volunteer, d7, print = FALSE)
x2 <- jcrosstab(OwnsHome ~ Volunteer, d7, print = FALSE)
x3 <- jcrosstab(Region ~ Volunteer, d7, print = FALSE)
t8 <- jtable(list(x1, x2, x3))
print(t8)
# Expected:
#   Table 1. Frequencies and Percentages by Volunteered in past year
#     3 variables by Volunteer, on a portrait page.
#   The table was made in R; no Word file was asked for.
#
#   Table 1
#   Frequencies and Percentages by Volunteered in past year
#   ----------------------------------------------------------------------------
#                        Volunteered in past year
#                             No           Yes       Total
#   Variable               n      %     n     %     n    %    χ²   df    p    V
#   ----------------------------------------------------------------------------
#   Current smoker                                           0.04   1  .834  .02
#     No                  34    65.4    31   67.4  65  66.3
#     Yes                 18    34.6    15   32.6  33  33.7
#   Owns home                                                5.95   1  .015  .24
#     Yes                 19    35.2    29   59.2  48  46.6
#     No                  35    64.8    20   40.8  55  53.4
#   Region of residence                                      2.89   3  .409  .17
#     North               14    25.9    13   26.5  27  26.2
#     South               13    24.1     7   14.3  20  19.4
#     East                17    31.5    14   28.6  31  30.1
#     West                10    18.5    15   30.6  25  24.3
#   ----------------------------------------------------------------------------
#   Note. N differs by variable: 98 (Current smoker), 103
#   (Owns home and Region of residence).

# Things to look at:
#   - each row variable's label a row of its own, its categories indented
#     under it by their value labels (Table 2's form);
#   - "Volunteered in past year" over the groups, each group over n and %,
#     then the Total; the percentages are WITHIN each group (column
#     percentages) -- jcrosstab() prints row percentages by default, so its
#     console table can show other figures;
#   - the chi-square test on each variable's label row: chi2 (the Greek
#     letter, upright), df, p and Cramer's V, computed from the stored
#     counts -- the Pearson test jcrosstab(chisq = TRUE) reports, though
#     these results were made without it;
#   - "N differs by variable:" with equal Ns grouped (Current smoker has
#     five declared missing values).

d7$Environment2R <- 6 - as.numeric(d7$Environment2)
attr(d7$Environment2R, "label") <-
  "Concern about the environment is exaggerated (reversed)."
jsubset(d7, Age >= 30)
# Expected:
#   jsubset activated for d7: Age >= 30

r1 <- jalpha(d7, Environment1, Environment2R, Environment3, Environment4,
             Environment5, print = FALSE)
t9 <- jtable(r1)
print(t9)
# Expected:
#   Table 1. Item Statistics and Reliability (N = 72)
#     1 scale of 5 items, on a portrait page, long labels on two lines.
#   The table was made in R; no Word file was asked for.
#
#   Table 1
#   Item Statistics and Reliability (N = 72)
#   -----------------------------------------------------------------------------------------------------
#   Item                                                        M    SD   Item-total r  α if item deleted
#   -----------------------------------------------------------------------------------------------------
#   Climate change is a serious threat.                       3.15  1.16       .67             .80
#   Concern about the environment is exaggerated (reversed).  3.15  1.19       .72             .79
#   Government should do more for the environment.            3.10  1.27       .74             .78
#   I would pay more for environmentally friendly products.   3.39  1.22       .71             .79
#   Pollution is a major cause of public health problems.     2.74  1.45       .44             .87
#   -----------------------------------------------------------------------------------------------------
#   Note. Only cases with Age (years) ≥ 30 are included. Cronbach's α = .84.
#   Item-total r is each item's correlation with the sum of the other items.

# Things to look at:
#   - the stub head "Item", each item named by its label (its wording);
#     M and SD; "Item-total r" (the r italic in the file) and "alpha if
#     item deleted" (the Greek letter, upright), both without the zero;
#   - "(N = 72)" after the title (ruling R59, S410); the note: the filter
#     in words -- "Only cases with Age (years) >= 30 are included.", the
#     sign one character -- then Cronbach's alpha and what item-total r is
#     (the console keeps "alpha = .84" on one line);
#   - several scales in a named list stack, each under its name with its
#     alpha: jtable(list("Concern" = ra, "Action" = rb)).

jsubset(d7, NULL)
# Expected:
#   jsubset cleared for d7 (had: Age >= 30).

walk_file7 <- file.path(tempdir(), "Tables_build4.docx")
jtable(list(t5, t6, t7, t8, t9), file = walk_file7, overwrite = TRUE,
       print = FALSE, open = TRUE)

# Things to look at (in Word):
#   - five tables, "Table 1" to "Table 5", two empty lines between them;
#   - the ANOVA table, Table 3, on a LANDSCAPE page of its own: four groups
#     wide, it cannot fit a portrait page even with its labels on two lines
#     (ruling R55's test). Since S406 each table gets the page it needs, so
#     Tables 1 and 2 sit on a portrait page before it and Tables 4 and 5 on
#     one after it (until S406 one landscape page held all five);
#   - the heads with markup: "t(101)" with the t italic and "(101)"
#     upright; "Item-total r" with the r italic; eta2, chi2 and alpha
#     upright; n, M, SD, p, d, F, df and V italic;
#   - the em dashes centered in their cells, and the ANOVA's df ("3, 99")
#     centered; every number on its decimal point, a negative one's minus
#     sign hanging left;
#   - Table 1's first column: -.07's point under .62***'s and .34***'s
#     (the S405 rebuild: the column now holds the minus left of the point
#     and the three stars right of it);
#   - Table 5's note with the filter sentence, the sign as one character.

walk_file7b <- file.path(tempdir(), "Table_items.docx")
jtable(t9, file = walk_file7b, overwrite = TRUE, print = FALSE, open = TRUE)

# Things to look at (in Word): the item table on its own, PORTRAIT at 12
# pt. With its items on one line it is wider than a portrait page, so
# under ruling R55 its padding halves and its stub narrows until each item
# takes two lines -- no smaller font and no landscape page.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 8 -- What jtable() prints, and one call makes one table (rulings R56 and R57) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Build 5 (S406). Ruling R57: jtable() prints a report in place of the
# table -- each table's number and title, what it holds and the page it is
# on (turned, its text stepped down, its long labels on two lines, as the
# Word file has them), then where the file went -- and print() shows a kept
# table in the console, as base R prints any object. Ruling R56: one call
# makes one table, so results that cannot share a table stop, and the stop
# gives the lines that make each table and write them to one file. Tables
# written together come back as one object, each on the page it needs. The
# section works on a copy of tdat, d8, so the settings Sections 4 to 6
# leave on tdat do not reach it.

d8 <- tdat
s8 <- jdesc(d8, WellbeingScore, Income, Age, print = FALSE)
k8 <- jlm(WellbeingScore ~ Age + Income, d8, print = FALSE)
v8 <- jaov(CommuteTime ~ Region, d8, print = FALSE)

# Render 1 -- a table with no file: the report, and that no file was written.
jtable(s8)
# Expected:
#   Table 1. Descriptive Statistics (N = 103)
#     3 variables, on a portrait page.
#   The table was made in R; no Word file was asked for.

# Render 2 -- the same call at joutput("full"): a note after the report gives
# the call with file = added, and the lines that keep the table and print it.
joutput("full", quiet = TRUE)
jtable(s8)
joutput(NULL, quiet = TRUE)
# Expected:
#   Table 1. Descriptive Statistics (N = 103)
#     3 variables, on a portrait page.
#   The table was made in R; no Word file was asked for.
#   Note: to write the table to a Word file, add file = to the call:
#     jtable(s8, file = "Table1.docx")
#   To see a table here, print it by the name it was kept under with <-,
#   for example:
#     print(t1)

# Render 3 -- those lines: the table kept, then printed.
t1 <- jtable(s8)
print(t1)
# Expected:
#   Table 1. Descriptive Statistics (N = 103)
#     3 variables, on a portrait page.
#   The table was made in R; no Word file was asked for.
#
#   Table 1
#   Descriptive Statistics (N = 103)
#   ------------------------------------------------------------------
#   Variable                  n       M          SD       Min     Max
#   ------------------------------------------------------------------
#   Wellbeing score (0-100)  103      50.89      11.48      25      81
#   Annual income (USD)       97  49,855.67  17,427.22  14,000  93,000
#   Age (years)              103      40.65      11.62      18      71
#   ------------------------------------------------------------------

# Render 4 -- a file written, then written over: the report says where it
# went, and the second time that it replaced the file.
walk_file8 <- file.path(tempdir(), "Table8.docx")
unlink(walk_file8)
jtable(k8, file = walk_file8)
jtable(k8, file = walk_file8, overwrite = TRUE)
# Expected:
#   Table 1. Regression Coefficients Predicting Wellbeing score (0-100) (N = 97)
#     1 model, on a portrait page.
#   Table written to <tempdir>/Table8.docx
#
#   Table 1. Regression Coefficients Predicting Wellbeing score (0-100) (N = 97)
#     1 model, on a portrait page.
#   Table written to <tempdir>/Table8.docx
#   It replaced the file that was there.

# Render 5 -- results that cannot share a table (ruling R56). The stop gives
# a line for each table and one that writes them to one file, keeping the
# call's file = and overwrite =. t1 is taken (Render 3 kept a table under
# it), so the lines name the tables tab1 and tab2 rather than replace it.
walk_file8b <- file.path(tempdir(), "Tables8.docx")
unlink(walk_file8b)
try(jtable(list(s8, k8), file = walk_file8b, overwrite = TRUE))
# Expected:
#   Error : jtable(): results of different kinds (jdesc() and jlm()) cannot
#   share a table.
#   Make each table in a call of its own, then give the tables together to write
#   them to one file:
#     tab1 <- jtable(s8)
#     tab2 <- jtable(k8)
#     jtable(list(tab1, tab2), file = walk_file8b, overwrite = TRUE)

# Render 6 -- the stop's lines, run as they stand.
tab1 <- jtable(s8)
tab2 <- jtable(k8)
jtable(list(tab1, tab2), file = walk_file8b, overwrite = TRUE)
# Expected:
#   Table 1. Descriptive Statistics (N = 103)
#     3 variables, on a portrait page.
#   The table was made in R; no Word file was asked for.
#
#   Table 1. Regression Coefficients Predicting Wellbeing score (0-100) (N = 97)
#     1 model, on a portrait page.
#   The table was made in R; no Word file was asked for.
#
#   Table 1. Descriptive Statistics (N = 103)
#     3 variables, on a portrait page.
#   Table 2. Regression Coefficients Predicting Wellbeing score (0-100) (N = 97)
#     1 model, on a portrait page.
#   2 tables written to
#   <tempdir>/Tables8.docx

# Render 7 -- each table on the page it needs: the four-group ANOVA table
# turns landscape; written between the other two, it gets a landscape page
# of its own. The three come back as one object, opened in Word.
tab3 <- jtable(v8)
walk_file8c <- file.path(tempdir(), "Tables8_pages.docx")
unlink(walk_file8c)
doc8 <- jtable(list(tab1, tab3, tab2), file = walk_file8c, overwrite = TRUE,
               open = TRUE)
# Expected:
#   Table 1. Means, Standard Deviations, and One-Way Analyses of Variance by
#   Region of residence
#     1 outcome by Region, on a landscape page.
#   The table was made in R; no Word file was asked for.
#
#   Table 1. Descriptive Statistics (N = 103)
#     3 variables, on a portrait page.
#   Table 2. Means, Standard Deviations, and One-Way Analyses of Variance by
#   Region of residence
#     1 outcome by Region, on a landscape page.
#   Table 3. Regression Coefficients Predicting Wellbeing score (0-100) (N = 97)
#     1 model, on a portrait page.
#   3 tables written to
#   <tempdir>/Tables8_pages.docx

# Render 8 -- the object printed: every table, numbered as in the file.
print(doc8)
# Expected:
#   Table 1
#   Descriptive Statistics (N = 103)
#   ------------------------------------------------------------------
#   Variable                  n       M          SD       Min     Max
#   ------------------------------------------------------------------
#   Wellbeing score (0-100)  103      50.89      11.48      25      81
#   Annual income (USD)       97  49,855.67  17,427.22  14,000  93,000
#   Age (years)              103      40.65      11.62      18      71
#   ------------------------------------------------------------------
#
#   Table 2
#   Means, Standard Deviations, and One-Way Analyses of Variance by Region of residence
#   --------------------------------------------------------------------------------------------------------
#                                                  Region of residence
#                                     North        South         East          West
#   Variable                        M      SD     M     SD     M      SD     M      SD   F(3, 99)    p    η²
#   --------------------------------------------------------------------------------------------------------
#   Daily commute time (minutes)  29.00  14.15  28.20  7.98  33.39  13.35  31.36  13.24    0.90    .442  .03
#   --------------------------------------------------------------------------------------------------------
#   Note. n = 27 (North), 20 (South), 31 (East), and 25 (West).
#
#   Table 3
#   Regression Coefficients Predicting Wellbeing score (0-100) (N = 97)
#   -------------------------------------------------
#   Predictor               b        SE     β     p
#   -------------------------------------------------
#   Constant             24.81    3.75          <.001
#   Age (years)           0.18    0.08     .18   .030
#   Annual income (USD)   0.0004  0.00006  .56  <.001
#   R²                     .41
#   -------------------------------------------------

# Render 9 -- at joutput("full"), tables written together that could have
# been one table: a note names them, with the line that makes them one.
s8b <- jdesc(d8, CommuteTime, print = FALSE)
tab4 <- jtable(s8b, print = FALSE)
joutput("full", quiet = TRUE)
jtable(list(tab1, tab4), file = walk_file8b, overwrite = TRUE)
joutput(NULL, quiet = TRUE)
# Expected:
#   Table 1. Descriptive Statistics (N = 103)
#     3 variables, on a portrait page.
#   Table 2. Descriptive Statistics (N = 103)
#     1 variable, on a portrait page.
#   2 tables written to
#   <tempdir>/Tables8.docx
#   It replaced the file that was there.
#   Note: Tables 1 and 2 are descriptives tables and could be one table:
#     jtable(list(s8, s8b))

# Render 10 -- what else keeps results apart, each in its own words: t tests
# of different grouping variables, ANOVAs of different groups, crosstabs of
# different column variables, two jcorr() results. t1, tab1 and tab2 are
# all taken now, so the lines name the tables table1 and table2.
tt8a <- jt(Income ~ Volunteer, d8, print = FALSE)
tt8b <- jt(Age ~ Smoker, d8, print = FALSE)
try(jtable(list(tt8a, tt8b)))
v8b <- jaov(CommuteTime ~ Region, d8, subset = Region != 4, print = FALSE)
try(jtable(list(v8, v8b)))
x8a <- jcrosstab(Smoker ~ Volunteer, d8, print = FALSE)
x8b <- jcrosstab(Smoker ~ Region, d8, print = FALSE)
try(jtable(list(x8a, x8b)))
c8a <- jcorr(d8, Age, Income, print = FALSE)
c8b <- jcorr(d8, Age, WellbeingScore, print = FALSE)
try(jtable(list(c8a, c8b)))
# Expected:
#   Error : jtable(): jt() results of different grouping variables
#   (Volunteer and Smoker) cannot share a table.
#   Make each table in a call of its own, then give the tables together to write
#   them to one file:
#     table1 <- jtable(tt8a)
#     table2 <- jtable(tt8b)
#     jtable(list(table1, table2), file = "Tables.docx")
#   Error : jtable(): the jaov() results compare different groups of Region
#   (North, South, East, and West; North, South, and East), so they cannot
#   share a table.
#   Make each table in a call of its own, then give the tables together to write
#   them to one file:
#     table1 <- jtable(v8)
#     table2 <- jtable(v8b)
#     jtable(list(table1, table2), file = "Tables.docx")
#   Error : jtable(): jcrosstab() results with different column variables
#   (Volunteer and Region) cannot share a table.
#   Make each table in a call of its own, then give the tables together to write
#   them to one file:
#     table1 <- jtable(x8a)
#     table2 <- jtable(x8b)
#     jtable(list(table1, table2), file = "Tables.docx")
#   Error : jtable(): each jcorr() result is a table of its own.
#   To correlate more variables in one table, name them in one jcorr() call.
#   Make each table in a call of its own, then give the tables together to write
#   them to one file:
#     table1 <- jtable(c8a)
#     table2 <- jtable(c8b)
#     jtable(list(table1, table2), file = "Tables.docx")

# Render 11 -- a table type's setting that none of the tables takes stops on
# its own; title = (or note =, headings =, markers =) names one table, so
# the stop ends saying where it goes.
f8 <- jfreq(d8, Smoker, print = FALSE)
try(jtable(list(s8, f8), fit.rows = "r2"))
try(jtable(list(s8, k8), title = "Study Variables"))
# Expected:
#   Error : jtable(): fit.rows = is a setting of a regression table and a
#   logistic regression table, and none of these results makes one.
#   Error : jtable(): results of different kinds (jdesc() and jlm()) cannot
#   share a table.
#   Make each table in a call of its own, then give the tables together to write
#   them to one file:
#     table1 <- jtable(s8)
#     table2 <- jtable(k8)
#     jtable(list(table1, table2), file = "Tables.docx")
#   title = names one table: add it to that table's line.

# Things to look at:
#   - Render 1: two lines for the table -- "Table 1." and its title, then
#     indented what it holds and its page -- and "No file was written."; no
#     table in the console. Enough to say what the call made?
#   - Render 2: the note at joutput("full") only -- the call with file =
#     added, then t1 <- and print(t1). At the standard level nothing is
#     said beyond the report (Render 1).
#   - Render 3: print(t1) shows the preview the calls above showed until
#     this build; typing t1 alone does the same.
#   - Render 4: "Table written to" and the path, and the second time "It
#     replaced the file that was there." on a line of its own.
#   - Render 5: the stop names what keeps the results apart (no "yet": one
#     call makes one table), then the three lines: tab1 and tab2, since t1
#     is in the workspace; the writing line keeps file = and overwrite =.
#   - Render 6: the lines run: two reports, then the document's -- both
#     tables numbered, "2 tables written to".
#   - Render 7: tab3's report says "on a landscape page"; the document's
#     report gives each table its page. In Word: Table 1 on a portrait
#     page, Table 2 (the ANOVA) on a landscape page of its own, Table 3 on
#     a portrait page again.
#   - Render 8: the three previews, "Table 1" to "Table 3".
#   - Render 9: the note at the foot -- Tables 1 and 2 are descriptives
#     tables of different variables, so they could be one table, and the
#     line that makes it names the results, not the tables.
#   - Render 10: each stop's first sentence says what keeps the results
#     apart in that table type's terms -- the groups by their value
#     labels, a set for each result -- and the corr stop says how to put
#     more variables in one table; the lines below as in Render 5.
#   - Render 11: the setting's stop names the table types that take it;
#     the title stop ends on where title = goes.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 9 -- A short style file from jstyle(): only the settings that differ ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Build 5 (S406; your answers to item 6). jstyle(save.as =) given settings
# writes a SHORT file -- the settings given, based on the style copied --
# where a call with none writes the complete copy (Section 3). A general
# setting goes by its name; a table type's goes in a list named for its
# section, since several sections share a name (columns, fit.rows). The
# file's head says what it holds and how to edit it, each setting carries
# its note and a "# takes:" line, and ?jstyle_settings lists every
# setting. The walk writes into a folder of the session's temporary
# folder; a table is made in a copy of tdat, d9.

.walk_styles9 <- file.path(tempdir(), "walk_styles9")
unlink(.walk_styles9, recursive = TRUE); dir.create(.walk_styles9)
d9 <- tdat

# Render 1 -- two general settings and a regression setting: the short file.
jstyle(save.as = file.path(.walk_styles9, "short"), size = 11,
       header.fill = "lightblue", regression = list(fit.rows = c("r2", "n")))
cat(readLines(file.path(.walk_styles9, "short.jstyle"), encoding = "UTF-8"),
    sep = "\n")
# Expected:
#   Style written to
#   <tempdir>/walk_styles9/short.jstyle
#
#   # short.jstyle:
#   # A jstats table style, based on apa, a style built into jstats.
#   # It lists only the settings that differ from apa; any setting not listed here takes apa's value.
#   # ?jstyle_settings lists every setting and what it takes.
#   # Change only the values after the = signs, or add a setting from that list; do not invent a setting, and do not rename a setting or a section.
#   # jstyle("short") checks the file and names any value it cannot use.
#
#   format     = 1
#   written.by = jstats 0.9.277
#   based.on   = apa
#
#   # the text size, in points
#   # takes: a number from 6 to 72
#   size = 11
#
#   # a color filling the header cells, or none
#   # takes: a color name such as lightblue, or six hex digits such as ADD8E6; or none
#   header.fill = lightblue
#
#   [regression]
#   # the fit rows under the predictors, in order: r2, adj.r2, f, delta.r2 (nested models), f.change (its F test), n, or none
#   # takes: one or more of r2, adj.r2, f, delta.r2, f.change, n, in order, separated by commas; or none
#   fit.rows = r2, n

# Render 2 -- a table made in it: the N row its fit.rows asks for.
k9 <- jlm(WellbeingScore ~ Age + Income, d9, print = FALSE)
t9s <- jtable(k9, style = file.path(.walk_styles9, "short.jstyle"))
print(t9s)
# Expected:
#   Table 1. Regression Coefficients Predicting Wellbeing score (0-100) (N = 97)
#     1 model, on a portrait page.
#   The table was made in R; no Word file was asked for.
#
#   Table 1
#   Regression Coefficients Predicting Wellbeing score (0-100) (N = 97)
#   -------------------------------------------------
#   Predictor               b        SE     β     p
#   -------------------------------------------------
#   Constant             24.81    3.75          <.001
#   Age (years)           0.18    0.08     .18   .030
#   Annual income (USD)   0.0004  0.00006  .56  <.001
#   R²                     .41
#   N                    97
#   -------------------------------------------------

# Render 3 -- a table type's setting given bare stops with the call
# rewritten; settings without save.as = stop with it added.
try(jstyle(save.as = file.path(.walk_styles9, "short2"),
           fit.rows = c("r2", "n")))
try(jstyle(size = 11))
# Expected:
#   Error : jstyle(): fit.rows = is a setting of a regression table and a
#   logistic regression table, so it goes in a list named for its section,
#   for example:
#     jstyle(save.as = file.path(.walk_styles9, "short2"),
#         regression = list(fit.rows = c("r2", "n")))
#   Error : jstyle(): a style's settings are written to a new style file, so
#   they need save.as =, for example:
#     jstyle(size = 11, save.as = "mystyle")

# Render 4 -- the other stops: a section given other than a list of named
# settings, a name the section does not hold (near one: did you mean; far:
# the section's settings), a setting given twice, a near-miss argument.
try(jstyle(save.as = file.path(.walk_styles9, "s3"), regression = "r2"))
try(jstyle(save.as = file.path(.walk_styles9, "s3"),
           regression = list(fit.row = "r2")))
try(jstyle(save.as = file.path(.walk_styles9, "s3"),
           crosstab = list(zzz = "no")))
try(jstyle(save.as = file.path(.walk_styles9, "s3"), size = 11, size = 12))
try(jstyle(save.as = file.path(.walk_styles9, "s3"), sise = 11))
# Expected:
#   Error : jstyle(): regression = takes a list of the section's settings, each
#   named, for example:
#     regression = list(columns = c("b", "se", "beta", "p"))
#   Error : jstyle(): fit.row is not a setting of [regression].
#   Did you mean fit.rows?
#   Error : jstyle(): zzz is not a setting of [crosstab].
#   The settings of [crosstab] are title, columns, total, percent.base,
#   test.columns, stub.label, n.label, percent.label, total.label, chisq.label,
#   df.label, p.label, v.label, group.spanner, and variable.headings.
#   A general setting may be set there too.
#   Error : jstyle(): size = is given twice.
#   Give each setting once.
#   Error : jstyle(): 'sise' is not valid.
#   Did you mean `size`?

# Things to look at:
#   - Render 1: the head -- based on apa, only the settings that differ,
#     ?jstyle_settings for the rest, change the values or add a setting
#     from that list; since S409 "a style built into jstats" (there are
#     two) and the editing rule in the complete copy's words, "do not
#     invent a setting, and do not rename a setting or a section" (Section
#     3); the stamps and based.on; then size and header.fill
#     with their notes, and [regression] with fit.rows, since S410 a blank
#     line after each setting but the last (the S409 item). lightblue as you
#     typed it. Since the S407 rebuild the file's name is a line of its
#     own and each sentence another, none wrapped; header.fill's
#     "# takes:" and fit.rows' note and "# takes:" are one line each.
#   - Render 2: the N row under R2, as the file asks, and since S410 N
#     after the title (ruling R59); the table's text at
#     11 points and its header filled light blue in Word (the preview cannot
#     show either).
#   - Render 3: fit.rows belongs to the regression and logistic sections,
#     so the stop moves it into regression = list(...) and gives the call
#     that runs; the second stop adds save.as =.
#   - Render 4: each stop says what to give instead -- the list form with
#     one of the section's own settings, the setting meant, the section's
#     settings in full, each setting once, the argument meant.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 10 -- Two codes with one label, the reserved name, each table's font ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The release build (S407). Two codes that share a value label -- here 2
# and 3, both "Other", as a survey that merged two answers might leave
# them -- are two categories everywhere: their own rows in jfreq(), their
# own groups in jt(), jaov(), jcrosstab() and jdesc(by =), their own bars
# in jplot(), their own rows in a table. Where the labels collide the rows
# show their codes as well, "2: Other" and "3: Other", the form value.id =
# "both" gives every row; a label no other code shares stays alone (the
# lean's default). Until v0.9.275 jfreq() under value.id = "labels" counted
# the two as one row, and the other functions made them one group. Then
# the style name "report", kept at S407 for the built-in report style,
# which v0.9.276 adds (Section 11); a file named apa.jstyle, which jstats
# never reads; and two
# tables built under two styles, written to one Word file, each in its own
# font. The section's style files go in a folder of the session's
# temporary folder, set as the style folder and cleared at the end. The
# jcomplete() Section 4 sets on tdat is cleared first (its note kept out
# of the way), so the analyses here print as they would on their own.

suppressMessages(jcomplete(clear.all = TRUE))
d10 <- data.frame(
  Contact = haven::labelled(c(1, 1, 1, 1, 2, 2, 2, 3, 3, 3, 3, 1),
                            c(Phone = 1, Other = 2, Other = 3)),
  Satisfaction = c(7, 8, 6, 7, 4, 5, 3, 9, 8, 9, 10, 8))
attr(d10$Contact, "label") <- "How we contacted you"
attr(d10$Satisfaction, "label") <- "Satisfaction (0-10)"

# Render 1 -- jfreq() under value.id = "labels": a row for each code.
jfreq(d10, Contact, value.id = "labels")
# Expected:
#   Frequencies
#
#   12 Cases in the 1 Variable Pool
#
#   Contact
#
#             Freq  Total %  Valid %  Cum. %
#   --------  ----  -------  -------  ------
#   Phone       5     41.67   41.67    41.67
#   2: Other    3     25.00   25.00    66.67
#   3: Other    4     33.33   33.33   100.00
#
#   Total      12    100.00

# Render 2 -- jaov(): three groups, each with its own mean.
jaov(Satisfaction ~ Contact, d10, value.id = "labels")
# Expected:
#   One-Way ANOVA
#
#   Analysis N: 12
#
#   Group Descriptives: Satisfaction by Contact
#   Group     N   Mean    SD   95% CI Lower  95% CI Upper
#   --------  -  -----  -----  ------------  ------------
#   Phone     5  7.200  0.837      6.161         8.239
#   2: Other  3  4.000  1.000      1.516         6.484
#   3: Other  4  9.000  0.816      7.701        10.299
#
#   ANOVA: Satisfaction by Contact
#   Source    df  Sum of Squares  Mean Square     F      p
#   --------  --  --------------  -----------  ------  -----
#   Contact    2      43.200         21.600    28.588  <.001
#   Residual   9       6.800          0.756
#   Total     11      50.000
#
#   Eta-squared: 0.864

# Render 3 -- the frequency table: the same rows by code and label.
t10f <- jtable(jfreq(d10, Contact, print = FALSE))
print(t10f)
# Expected:
#   Table 1. Frequency Distributions (N = 12)
#     1 variable, on a portrait page.
#   The table was made in R; no Word file was asked for.
#
#   Table 1
#   Frequency Distributions (N = 12)
#   -----------------------------
#   Variable              n    %
#   -----------------------------
#   How we contacted you
#     Phone               5  41.7
#     2: Other            3  25.0
#     3: Other            4  33.3
#   -----------------------------

# Render 4 -- "report" names a style built into jstats; another name is
# written.
.walk_styles10 <- file.path(tempdir(), "walk_styles10")
unlink(.walk_styles10, recursive = TRUE); dir.create(.walk_styles10)
joptions(style.dir = .walk_styles10, quiet = TRUE)
try(jstyle("apa", save.as = "report"))
jstyle("apa", save.as = "myreport", font = "Arial", size = 11)
cat(readLines(file.path(.walk_styles10, "myreport.jstyle"), encoding = "UTF-8"),
    sep = "\n")
# Expected:
#   Error : jstyle(): "report" is the name of a style built into jstats.
#   Give the copy another name, for example:
#     jstyle("apa", save.as = "myreport")
#   Style written to
#   <tempdir>/walk_styles10/myreport.jstyle
#
#   # myreport.jstyle:
#   # A jstats table style, based on apa, a style built into jstats.
#   # It lists only the settings that differ from apa; any setting not listed here takes apa's value.
#   # ?jstyle_settings lists every setting and what it takes.
#   # Change only the values after the = signs, or add a setting from that list; do not invent a setting, and do not rename a setting or a section.
#   # jstyle("myreport") checks the file and names any value it cannot use.
#
#   format     = 1
#   written.by = jstats 0.9.277
#   based.on   = apa
#
#   # the typeface of every cell, caption and note
#   # takes: any text
#   font = Arial
#
#   # the text size, in points
#   # takes: a number from 6 to 72
#   size = 11

# Render 5 -- a file named apa.jstyle in the style folder is not read: the
# note where a call takes the built-in apa, here as the session's style.
invisible(file.copy(file.path(.walk_styles10, "myreport.jstyle"),
                    file.path(.walk_styles10, "apa.jstyle")))
t10a <- jtable(jdesc(d10, Satisfaction, print = FALSE))
unlink(file.path(.walk_styles10, "apa.jstyle"))
# Expected:
#   This file is not read, since "apa" always names a style built into jstats:
#     <tempdir>/walk_styles10/apa.jstyle
#   To use it, rename it, for example to myapa.jstyle, and use style = "myapa".
#
#   Table 1. Descriptive Statistics (N = 12)
#     1 variable, on a portrait page.
#   The table was made in R; no Word file was asked for.

# Render 6 -- two tables, built under two styles, written to one Word file:
# Table 1 in apa's Times New Roman 12, Table 2 in myreport's Arial 11.
t10b <- jtable(jfreq(d10, Contact, print = FALSE), style = "myreport")
jtable(list(t10a, t10b), file = file.path(.walk_styles10, "TwoFonts.docx"),
       open = TRUE)
joptions(style.dir = NULL, quiet = TRUE)
# Expected:
#   Table 1. Frequency Distributions (N = 12)
#     1 variable, on a portrait page.
#   The table was made in R; no Word file was asked for.
#
#   Table 1. Descriptive Statistics (N = 12)
#     1 variable, on a portrait page.
#   Table 2. Frequency Distributions (N = 12)
#     1 variable, on a portrait page.
#   2 tables written to
#   <tempdir>/walk_styles10/TwoFonts.docx

# Things to look at:
#   - Render 1: four rows, one per code -- "2: Other" and "3: Other" each
#     with its own count (3 and 4), "Phone" alone. Before, one "Other" row
#     of 7.
#   - Render 2: three groups with their own means (Other on 2 low, Other on
#     3 high), the same two names with their codes; the F of three groups.
#   - Render 3: the table's rows the same way -- what a Word table of this
#     variable shows.
#   - Render 4: the stop for "report" in the words apa's stop uses, and the
#     line that runs; myreport written, and the file as Notepad shows it
#     (the S407 rebuild, on your walk): its name on the first line, then
#     one sentence a line; each setting's note and "# takes:" line whole.
#     Since S409 report is built in (Section 11): the stop says so, where
#     it named "a later version", and the head says "a style built into
#     jstats" and gives the complete copy's editing rule (Section 3).
#   - Render 5: the note before the report -- the file named, why it is not
#     read, and the way to use it.
#   - Render 6 (in Word): Table 1 in Times New Roman 12, Table 2 in Arial
#     11, caption included (since S410 N is after each title, so neither
#     table has a note). Before, Table 2 came out in Times
#     with myreport's other settings. Since the S407 rebuilds (your walk:
#     "How we contacted you", "2: Other" and "3: Other" each wrapped onto
#     a second line, the title too, and the n and % columns stood under
#     the label) every label on one line: the columns are measured in the
#     table's own font, Arial a tenth wider than Times, each category
#     beside its indent as Word draws it; "How we contacted you" sets the
#     first column's width, as in the console, the n and % columns beside
#     it; and "Frequency Distributions (N = 12)" on one line -- a table
#     narrower than its title widens to it, every column in proportion.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 11 -- The built-in report style, three new looks, jstyle(open = TRUE) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Capability Slate U, build 1 (S409; ruling R58). jstats has a second
# built-in style, report, the plain look the report style manuals share,
# based on apa: Arial 10, the caption 10 and the note 9, "Table 1:" and
# the title on one line, a light grey bold header, apa's three rules, the
# zero before the point kept (your lean: most of the guidance writes it),
# an upright "Note:", and each variable's label row bold. Three new general
# settings give the looks an agency's own file turns on, all three off in
# both built-ins: caption.fill (a fill on the caption row -- a color, or
# header to take the header's fill and its text color), heading.fill (a
# fill on each variable's label row) and note.label.italic. A complete
# copy's head now carries a block for an AI assistant (the AI route's
# first piece; the second is the prompt in ?jstyle), and open = TRUE opens
# a style's file in the editor in place of printing its settings (RULED
# S406). The new settings' names, values and notes, the colors and the
# wording are Claude's calls. The style files go in a folder of the
# session's temporary folder, set as the style folder and cleared at the
# end; the tables are made from d11, a copy of tdat.

.walk_styles11 <- file.path(tempdir(), "walk_styles11")
unlink(.walk_styles11, recursive = TRUE); dir.create(.walk_styles11)
joptions(style.dir = .walk_styles11, quiet = TRUE)
d11 <- tdat

# Render 1 -- report's settings: its own unmarked, every other apa's.
jstyle("report")
# Expected:
#   Style: report
#     built into jstats
#     based on apa
#
#   font              = Arial
#   size              = 10
#   paper             = a4              # from apa
#   caption.form      = report
#   caption.position  = row             # from apa
#   caption.size      = size            # from apa
#   caption.fill      = none            # from apa
#   caption.text      = 000000          # from apa
#   header.fill       = D9D9D9
#   header.text       = 000000          # from apa
#   header.bold       = yes
#   band.fill         = none            # from apa
#   heading.fill      = none            # from apa
#   rules             = apa             # from apa
#   rule.color        = 000000          # from apa
#   note.label        = Note:
#   note.label.italic = no
#   note.position     = row             # from apa
#   note.size         = size - 1
#   note.sentences    = lines
#   note.order        = report
#   source.position   = line
#   source.label      = Source:         # from apa
#   n.position        = title           # from apa
#   decimals          = 2               # from apa
#   leading.zero      = yes
#   p.format          = exact           # from apa
#   p.decimals        = 3               # from apa
#   stars             = .05, .01, .001  # from apa
#   marks             = letters         # from apa
#   minus             = true            # from apa
#   thousands         = comma           # from apa
#   landscape         = auto            # from apa
#   line.spacing      = single          # from apa
#   percent.decimals  = 1               # from apa
#   filter.note       = yes             # from apa
#
#   [descriptives]
#   title          = Descriptive Statistics  # from apa
#   columns        = n, mean, sd, min, max   # from apa
#   stub.label     = Variable                # from apa
#   n.label        = n                       # from apa
#   mean.label     = M                       # from apa
#   sd.label       = SD                      # from apa
#   min.label      = Min                     # from apa
#   max.label      = Max                     # from apa
#   group.headings = italic                  # from apa
#
#   [frequencies]
#   title               = Frequency Distributions  # from apa
#   columns             = n, percent               # from apa
#   stub.label          = Variable                 # from apa
#   n.label             = n                        # from apa
#   percent.label       = %                        # from apa
#   valid.percent.label = Valid %                  # from apa
#   cumulative.label    = Cumulative %             # from apa
#   missing.rows        = combined                 # from apa
#   missing.label       = Missing                  # from apa
#   variable.headings   = bold
#   group.headings      = italic                   # from apa
#
#   [regression]
#   title             = Regression Coefficients Predicting {outcome}  # from apa
#   columns           = b, se, beta, p              # from apa
#   columns.last      = none                        # from apa
#   stub.label        = Predictor                   # from apa
#   b.label           = b                           # from apa
#   se.label          = SE                          # from apa
#   beta.label        = β                           # from apa
#   p.label           = p                           # from apa
#   t.label           = t                           # from apa
#   ci.label          = 95% CI                      # from apa
#   beta.gelman.label = β*                          # from apa
#   ci.style          = one                         # from apa
#   intercept         = yes                         # from apa
#   intercept.label   = Constant                    # from apa
#   fit.rows          = r2                          # from apa
#   reference         = row                         # from apa
#   reference.label   = reference                   # from apa
#   variable.headings = bold
#   group.headings    = italic                      # from apa
#
#   [logistic]
#   title             = Logistic Regression Coefficients Predicting {outcome}  # from apa
#   columns           = b, se, or, p                # from apa
#   columns.last      = none                        # from apa
#   stub.label        = Predictor                   # from apa
#   b.label           = b                           # from apa
#   se.label          = SE                          # from apa
#   or.label          = OR                          # from apa
#   p.label           = p                           # from apa
#   wald.label        = Wald                        # from apa
#   ci.label          = 95% CI for OR               # from apa
#   beta.gelman.label = β*                          # from apa
#   ci.style          = one                         # from apa
#   intercept         = yes                         # from apa
#   intercept.label   = Constant                    # from apa
#   fit.rows          = chisq, nagelkerke           # from apa
#   reference         = row                         # from apa
#   reference.label   = reference                   # from apa
#   variable.headings = bold
#   group.headings    = italic                      # from apa
#
#   [correlation]
#   title          = Descriptive Statistics and Correlations for Study Variables  # from apa
#   columns        = n, mean, sd                 # from apa
#   stub.label     = Variable                    # from apa
#   n.label        = n                           # from apa
#   mean.label     = M                           # from apa
#   sd.label       = SD                          # from apa
#   lower.triangle = yes                         # from apa
#   r.stars        = yes                         # from apa
#   method.note    = yes                         # from apa
#
#   [ttest]
#   title         = Means, Standard Deviations, and t Tests by {group}  # from apa
#   columns       = mean, sd, t, p, d           # from apa
#   stub.label    = Variable                    # from apa
#   n.label       = n                           # from apa
#   mean.label    = M                           # from apa
#   sd.label      = SD                          # from apa
#   t.label       = t                           # from apa
#   df.label      = df                          # from apa
#   df.position   = column
#   p.label       = p                           # from apa
#   d.label       = d                           # from apa
#   diff.label    = Mean difference             # from apa
#   ci.label      = 95% CI                      # from apa
#   ci.style      = one                         # from apa
#   group.spanner = yes                         # from apa
#   test.note     = yes                         # from apa
#
#   [anova]
#   title         = Means, Standard Deviations, and One-Way Analyses of Variance by {group}  # from apa
#   columns       = mean, sd, f, p, eta2        # from apa
#   stub.label    = Variable                    # from apa
#   n.label       = n                           # from apa
#   mean.label    = M                           # from apa
#   sd.label      = SD                          # from apa
#   f.label       = F                           # from apa
#   df.label      = df                          # from apa
#   df.position   = column
#   p.label       = p                           # from apa
#   eta2.label    = η²                          # from apa
#   group.spanner = yes                         # from apa
#   test.note     = yes                         # from apa
#
#   [crosstab]
#   title             = Frequencies and Percentages by {group}  # from apa
#   columns           = n, percent                  # from apa
#   total             = yes                         # from apa
#   percent.base      = column                      # from apa
#   test.columns      = chisq, df, p, v             # from apa
#   stub.label        = Variable                    # from apa
#   n.label           = n                           # from apa
#   percent.label     = %                           # from apa
#   total.label       = Total                       # from apa
#   chisq.label       = χ²                          # from apa
#   df.label          = df                          # from apa
#   p.label           = p                           # from apa
#   v.label           = V                           # from apa
#   group.spanner     = yes                         # from apa
#   variable.headings = bold
#
#   [reliability]
#   title                  = Item Statistics and Reliability  # from apa
#   columns                = mean, sd, item.total, alpha.if.deleted  # from apa
#   stub.label             = Item                        # from apa
#   mean.label             = M                           # from apa
#   sd.label               = SD                          # from apa
#   item.total.label       = Item-total *r*              # from apa
#   alpha.if.deleted.label = α if item deleted           # from apa
#   alpha                  = yes                         # from apa
#   item.total.note        = yes                         # from apa
#   group.headings         = italic                      # from apa
#
#   [multiresponse]
#   title         = {set}          # from apa
#   columns       = n, percent     # from apa
#   stub.label    = Option         # from apa
#   n.label       = n              # from apa
#   percent.label = %              # from apa
#   none.label    = None of these  # from apa
#   choice.note   = yes            # from apa
#
#   [plot]
#   font            = Arial
#   size            = 10
#   palette         = greys       # from apa
#   gridlines       = horizontal
#   grid.color      = D9D9D9      # from apa
#   axis.lines      = x
#   legend.position = top
#   values          = yes         # from apa
#   values.grouped  = no          # from apa
#   width           = 6           # from apa
#   height          = 4           # from apa
#   resolution      = 300         # from apa
#   data.file       = no          # from apa
#   vector.file     = none        # from apa

# Render 2 -- three tables in report: descriptives, frequencies, and a
# regression with a dummy-coded variable, whose preview is printed.
t11a <- jtable(jdesc(d11, WellbeingScore, Income, Age, print = FALSE),
               style = "report")
t11b <- jtable(jfreq(d11, Education, Region, print = FALSE), style = "report")
m11 <- jlm(WellbeingScore ~ Age + Income + Region, d11, categorical = Region,
           print = FALSE)
t11c <- jtable(m11, style = "report")
print(t11c)
# Expected:
#   Table 1. Descriptive Statistics (N = 103)
#     3 variables, on a portrait page.
#   The table was made in R; no Word file was asked for.
#
#   Table 1. Frequency Distributions (N = 103)
#     2 variables, on a portrait page.
#   The table was made in R; no Word file was asked for.
#
#   Table 1. Regression Coefficients Predicting Wellbeing score (0-100) (N = 97)
#     1 model, on a portrait page.
#   The table was made in R; no Word file was asked for.
#
#   Table 1: Regression Coefficients Predicting Wellbeing score (0-100) (N = 97)
#   ------------------------------------------------------------------------
#   Predictor                                   b        SE      β       p
#   ------------------------------------------------------------------------
#   Constant                                 27.31    3.91            <0.001
#   Age (years)                               0.19    0.08      0.19   0.021
#   Annual income (USD)                       0.0004  0.00005   0.57  <0.001
#   Region of residence (reference = North)
#     South                                  -5.45    2.76     -0.18   0.051
#     East                                   -3.65    2.38     -0.15   0.128
#     West                                   -4.90    2.55     -0.18   0.058
#   R²                                        0.44
#   ------------------------------------------------------------------------

# Render 3 -- the three new looks in a short file based on report: a teal
# bar behind the caption, taking the header's fill and its white text, a
# light fill on each variable's row, banding, no rules, Calibri.
jstyle("report", save.as = "teal", font = "Calibri", header.fill = "0E5A5F",
       header.text = "FFFFFF", caption.fill = "header",
       heading.fill = "D3E3E5", band.fill = "EAF2F3", rules = "none")
cat(readLines(file.path(.walk_styles11, "teal.jstyle"), encoding = "UTF-8"),
    sep = "\n")
# Expected:
#   Style written to
#   <tempdir>/walk_styles11/teal.jstyle
#
#   # teal.jstyle:
#   # A jstats table style, based on report, a style built into jstats.
#   # It lists only the settings that differ from report; any setting not listed here takes report's value.
#   # ?jstyle_settings lists every setting and what it takes.
#   # Change only the values after the = signs, or add a setting from that list; do not invent a setting, and do not rename a setting or a section.
#   # jstyle("teal") checks the file and names any value it cannot use.
#
#   format     = 1
#   written.by = jstats 0.9.279
#   based.on   = report
#
#   # the typeface of every cell, caption and note
#   # takes: any text
#   font = Calibri
#
#   # a color filling the header cells, or none
#   # takes: a color name such as lightblue, or six hex digits such as ADD8E6; or none
#   header.fill = 0E5A5F
#
#   # the color of the header's text
#   # takes: a color name such as lightblue, or six hex digits such as ADD8E6
#   header.text = FFFFFF
#
#   # a color filling the caption row (caption.position = row), header for the header's fill and text color, or none
#   # takes: a color name such as lightblue, or six hex digits such as ADD8E6; or header, or none
#   caption.fill = header
#
#   # a color filling each variable's label row (the rows variable.headings sets), or none
#   # takes: a color name such as lightblue, or six hex digits such as ADD8E6; or none
#   heading.fill = D3E3E5
#
#   # a color filling every other data row, or none
#   # takes: a color name such as lightblue, or six hex digits such as ADD8E6; or none
#   band.fill = EAF2F3
#
#   # apa: rules above and below the header and under the table
#   # grid: every cell | outer: a box | none
#   # takes: one of apa | grid | outer | none
#   rules = none

# Render 4 -- two crosstabs in teal, then the four tables in one Word file.
t11d <- jtable(list(jcrosstab(Smoker ~ Volunteer, d11, print = FALSE),
                    jcrosstab(Region ~ Volunteer, d11, print = FALSE)),
               style = "teal")
jtable(list(t11a, t11b, t11c, t11d),
       file = file.path(.walk_styles11, "Report.docx"), overwrite = TRUE,
       open = TRUE)
# Expected:
#   Table 1. Frequencies and Percentages by Volunteered in past year
#     2 variables by Volunteer, on a portrait page.
#   The table was made in R; no Word file was asked for.
#
#   Table 1. Descriptive Statistics (N = 103)
#     3 variables, on a portrait page.
#   Table 2. Frequency Distributions (N = 103)
#     2 variables, on a portrait page.
#   Table 3. Regression Coefficients Predicting Wellbeing score (0-100) (N = 97)
#     1 model, on a portrait page.
#   Table 4. Frequencies and Percentages by Volunteered in past year
#     2 variables by Volunteer, on a portrait page.
#   4 tables written to
#   <tempdir>/walk_styles11/Report.docx

# Render 5 -- a complete copy of report: the head, with the block for an
# AI assistant, and based.on = report.
jstyle("report", save.as = "myagency")
cat(readLines(file.path(.walk_styles11, "myagency.jstyle"), n = 25L,
              encoding = "UTF-8"), sep = "\n")
# Expected:
#   Style written to
#   <tempdir>/walk_styles11/myagency.jstyle
#
#   # myagency.jstyle:
#   # A jstats table style.
#   # Every setting jstats has is below, each after a note saying what it does and what it takes.
#   # Change only the values after the = signs; do not invent a setting, and do not rename a setting or a section.
#   # A line that starts with # is a note.
#   # jstyle("myagency") checks the file and names any value it cannot use.
#   #
#   # To an AI assistant asked to edit this file so tables look like an example:
#   # Change only the values after the = signs, using only the values each setting's "# takes:" line allows.
#   # Keep every other line as it is, and return the whole file.
#   # Then say what the example has that these settings cannot make, rather than inventing a setting for it.
#
#   format     = 1
#   written.by = jstats 0.9.279
#   based.on   = report
#
#   # The general settings: the look of every table.
#
#   # the typeface of every cell, caption and note
#   # takes: any text
#   font = Arial
#
#   # the text size, in points
#   # takes: a number from 6 to 72
#   size = 10

# Render 6 -- open = TRUE: myagency.jstyle opens in the editor, a tab beside
# this file, and nothing is printed; the built-in styles have no file to
# open, whether named or the session's style.
jstyle("myagency", open = TRUE)
try(jstyle("report", open = TRUE))
try(jstyle(open = TRUE))
# Expected:
#   Error : jstyle(): "report" is built into jstats, so it has no file to open.
#   Save a copy to open, for example:
#     jstyle("report", save.as = "myreport", open = TRUE)
#   Error : jstyle(): "apa" is built into jstats, so it has no file to open.
#   Save a copy to open, for example:
#     jstyle("apa", save.as = "myjournal", open = TRUE)

# Render 7 -- report cannot be a copy's name, and a report.jstyle in a
# folder searched is passed over, with a note under jstyle()'s list.
try(jstyle("apa", save.as = "report"))
invisible(file.copy(file.path(.walk_styles11, "teal.jstyle"),
                    file.path(.walk_styles11, "report.jstyle")))
jstyle()
unlink(file.path(.walk_styles11, "report.jstyle"))
joptions(style.dir = NULL, quiet = TRUE)
# Expected:
#   Error : jstyle(): "report" is the name of a style built into jstats.
#   Give the copy another name, for example:
#     jstyle("apa", save.as = "myreport")
#   Styles
#     apa       built into jstats (the default)
#     report    built into jstats
#     myagency  <tempdir>/walk_styles11/myagency.jstyle
#     teal      <tempdir>/walk_styles11/teal.jstyle
#
#   jstats looks for a style file in these folders, in this order:
#     <tempdir>/walk_styles11 (the style folder)
#     <working directory> (the working directory)
#     <your jstats folder> (your jstats folder, not created yet)
#
#   This file is not read, since "report" always names a style built
#   into jstats:
#     <tempdir>/walk_styles11/report.jstyle
#   To use it, rename it, for example to myreport.jstyle, and
#   use style = "myreport".

# Things to look at:
#   - Render 1: report's own settings unmarked -- font Arial, size 10,
#     caption.form report, caption.size 10, header.fill D9D9D9,
#     header.bold yes, note.label "Note:", note.label.italic no, note.size
#     9, leading.zero yes, and variable.headings bold in [frequencies],
#     [regression], [logistic] and [crosstab]; every other "# from apa",
#     the new caption.fill and heading.fill among them (none). "based on
#     apa" under its name.
#   - Render 2: each table's report line; the preview in report's form --
#     "Table 1:" and the title on one line, N after it since S410 (ruling
#     R59), the zero kept on b, beta, p and R squared (0.19, 0.021,
#     <0.001, 0.44: your lean 1); no note, N having been all it held.
#   - Render 3: the short file's head -- "based on report, a style built
#     into jstats", only what differs from report, the editing rule in the
#     complete copy's words with adding a setting from ?jstyle_settings
#     allowed; the three new settings' notes and "# takes:" lines --
#     caption.fill takes a color, header or none; since S410 a blank line
#     after each setting but the last.
#   - Render 4 (in Word): Tables 1 to 3 in report -- Arial 10, "Table 1:"
#     and the title bold on one line at 10 points, the header filled light
#     grey and bold, apa's three rules, each variable's label row bold
#     (Table 2's two variables, Table 3's Region of residence), the zero
#     kept; since S410 N after each title and no note, N having been all
#     their notes held. Table 4 in teal: Calibri, a teal bar behind "Table
#     4:" and its title, the text white as the header's is, the header teal
#     and bold, each variable's row on a light teal fill, every other data
#     row shaded, no rules; its note, the Ns that differ by variable, after
#     "Note:" upright at 9 points.
#   - Render 5: the complete copy's head -- the editing rule, then the
#     block for an AI assistant; based.on = report, since the copy is of
#     report (a copy of apa says apa; your default on lean 2). Since S410
#     a blank line under the general settings' heading note and after
#     font, as in Section 3, so n = 25 shows what n = 23 did.
#   - Render 6: a tab with myagency.jstyle opens and nothing prints; the
#     two stops give the line that saves a copy and opens it -- myreport
#     for report, myjournal for apa, the session's style (your default on
#     lean 3).
#   - Render 7: the stop in the words apa's stop uses; the list shows
#     myagency and teal, and the note names report.jstyle as passed over,
#     with the way to use it.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 12 -- The styles folder and the gallery's files: banded, bar and us ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Capability Slate U, build 1 (S409; the S408 decisions). The style
# gallery the guides' How-To page will hold (LOCKED S408): short files
# based on report, each named for a look -- banded, bar and us -- written
# here from the text below into the styles folder at the package's root,
# E:/00 R Projects/jstats/styles (made if absent; git and the build ignore
# it). The section writes only those three file names there, each
# replacing a file of its name: your S408 banded.jstyle, based on apa, is
# replaced by the gallery's. It sets the folder as the style folder, lists
# the styles, prints one file's settings, opens the three in the editor,
# writes the same table in report and in each to one Word file, and puts
# back the style folder the session had. The files' text, colors and
# heads are Claude's calls; each head says what the file follows and that
# the source's other rules are the author's. Since S414 bar takes Section
# 11's teal colors (ruling R80, S413: the built-in report unchanged, the
# gallery adjusted; Claude's call, DEFAULTED at the S413 closeout). The
# Word file goes in a folder of the session's temporary folder.

.styles12 <- "E:/00 R Projects/jstats/styles"
.entry_style_dir12 <- getOption(".jst_options_style_dir")
.walk_out12 <- file.path(tempdir(), "walk_tables12")
unlink(.walk_out12, recursive = TRUE); dir.create(.walk_out12)
if (!dir.exists(.styles12)) dir.create(.styles12, recursive = TRUE)
joptions(style.dir = .styles12)
# Expected:
#   Options Settings
#   Style folder: E:/00 R Projects/jstats/styles
#   Run joptions() to see all settings.

# Render 1 -- the three files, written from this text, then the list.
writeLines(c(
  "# banded.jstyle:",
  "# A jstats table style, based on report, a style built into jstats.",
  "# It shades every other data row under report's grey header, the zebra shading the Australian Government Style Manual allows for long tables.",
  "# The manual's other rules, such as the order of a table's notes, are the author's to follow.",
  "# It lists only the settings that differ from report; any setting not listed here takes report's value.",
  "# ?jstyle_settings lists every setting and what it takes.",
  "# Change only the values after the = signs, or add a setting from that list; do not invent a setting, and do not rename a setting or a section.",
  "# jstyle(\"banded\") checks the file and names any value it cannot use.",
  "",
  "based.on  = report",
  "",
  "band.fill = F2F2F2    # light grey on every other data row"),
  file.path(.styles12, "banded.jstyle"))
writeLines(c(
  "# bar.jstyle:",
  "# A jstats table style, based on report, a style built into jstats.",
  "# It sets the caption on a dark teal bar that runs into the header, both with white text, fills each variable's row and every other data row in lighter teals, and draws no rules: the look of many research institutes' reports, in a teal for an institute's own color to replace.",
  "# The institute's other rules, such as its font and its source line, are the author's to follow.",
  "# It lists only the settings that differ from report; any setting not listed here takes report's value.",
  "# ?jstyle_settings lists every setting and what it takes.",
  "# Change only the values after the = signs, or add a setting from that list; do not invent a setting, and do not rename a setting or a section.",
  "# jstyle(\"bar\") checks the file and names any value it cannot use.",
  "",
  "based.on     = report",
  "",
  "header.fill  = 0E5A5F    # dark teal: put the institute's color here",
  "",
  "header.text  = FFFFFF    # white",
  "",
  "caption.fill = header    # the caption bar takes the header's fill and text color",
  "",
  "heading.fill = D3E3E5    # light teal on each variable's row",
  "",
  "band.fill    = EAF2F3    # lighter teal on every other data row",
  "",
  "rules        = none"),
  file.path(.styles12, "bar.jstyle"))
writeLines(c(
  "# us.jstyle:",
  "# A jstats table style, based on report, a style built into jstats.",
  "# It follows the table guidelines of the US National Center for Education Statistics (NCES Statistical Standard 5-4 and its Guidelines for Tabular Presentations): \"Table 1.\" and the title on one line, the label NOTE:, and no zero before a decimal that cannot be greater than 1, such as a p value or a correlation.",
  "# The guidelines' other rules, such as footnotes before the NOTE and a SOURCE: line last, are the author's to follow.",
  "# It lists only the settings that differ from report; any setting not listed here takes report's value.",
  "# ?jstyle_settings lists every setting and what it takes.",
  "# Change only the values after the = signs, or add a setting from that list; do not invent a setting, and do not rename a setting or a section.",
  "# jstyle(\"us\") checks the file and names any value it cannot use.",
  "",
  "based.on     = report",
  "",
  "caption.form = journal    # \"Table 1.\" and the title on one line",
  "",
  "note.label   = NOTE:",
  "",
  "leading.zero = no         # no zero before p or a correlation; b keeps it"),
  file.path(.styles12, "us.jstyle"))
jstyle()
# Expected:
#   Styles
#     apa     built into jstats (the default)
#     report  built into jstats
#     banded  E:/00 R Projects/jstats/styles/banded.jstyle
#     bar     E:/00 R Projects/jstats/styles/bar.jstyle
#     us      E:/00 R Projects/jstats/styles/us.jstyle
#
#   jstats looks for a style file in these folders, in this order:
#     E:/00 R Projects/jstats/styles (the style folder)
#     <working directory> (the working directory)
#     <your jstats folder> (your jstats folder, not created yet)

# Render 2 -- bar's settings: its own unmarked, then report's and apa's,
# each marked with the style it comes from.
jstyle("bar")
# Expected:
#   Style: bar
#     E:/00 R Projects/jstats/styles/bar.jstyle
#     based on report, then apa
#     Set in this file: header.fill, header.text, caption.fill, heading.fill,
#     band.fill, and rules.
#     Every other setting comes from report, then apa.
#
#   font              = Arial           # from report
#   size              = 10              # from report
#   paper             = a4              # from apa
#   caption.form      = report          # from report
#   caption.position  = row             # from apa
#   caption.size      = size            # from apa
#   caption.fill      = header
#   caption.text      = 000000          # from apa
#   header.fill       = 0E5A5F
#   header.text       = FFFFFF
#   header.bold       = yes             # from report
#   band.fill         = EAF2F3
#   heading.fill      = D3E3E5
#   rules             = none
#   rule.color        = 000000          # from apa
#   note.label        = Note:           # from report
#   note.label.italic = no              # from report
#   note.position     = row             # from apa
#   note.size         = size - 1        # from report
#   note.sentences    = lines           # from report
#   note.order        = report          # from report
#   source.position   = line            # from report
#   source.label      = Source:         # from apa
#   n.position        = title           # from apa
#   decimals          = 2               # from apa
#   leading.zero      = yes             # from report
#   p.format          = exact           # from apa
#   p.decimals        = 3               # from apa
#   stars             = .05, .01, .001  # from apa
#   marks             = letters         # from apa
#   minus             = true            # from apa
#   thousands         = comma           # from apa
#   landscape         = auto            # from apa
#   line.spacing      = single          # from apa
#   percent.decimals  = 1               # from apa
#   filter.note       = yes             # from apa
#
#   [descriptives]
#   title          = Descriptive Statistics  # from apa
#   columns        = n, mean, sd, min, max   # from apa
#   stub.label     = Variable                # from apa
#   n.label        = n                       # from apa
#   mean.label     = M                       # from apa
#   sd.label       = SD                      # from apa
#   min.label      = Min                     # from apa
#   max.label      = Max                     # from apa
#   group.headings = italic                  # from apa
#
#   [frequencies]
#   title               = Frequency Distributions  # from apa
#   columns             = n, percent               # from apa
#   stub.label          = Variable                 # from apa
#   n.label             = n                        # from apa
#   percent.label       = %                        # from apa
#   valid.percent.label = Valid %                  # from apa
#   cumulative.label    = Cumulative %             # from apa
#   missing.rows        = combined                 # from apa
#   missing.label       = Missing                  # from apa
#   variable.headings   = bold                     # from report
#   group.headings      = italic                   # from apa
#
#   [regression]
#   title             = Regression Coefficients Predicting {outcome}  # from apa
#   columns           = b, se, beta, p              # from apa
#   columns.last      = none                        # from apa
#   stub.label        = Predictor                   # from apa
#   b.label           = b                           # from apa
#   se.label          = SE                          # from apa
#   beta.label        = β                           # from apa
#   p.label           = p                           # from apa
#   t.label           = t                           # from apa
#   ci.label          = 95% CI                      # from apa
#   beta.gelman.label = β*                          # from apa
#   ci.style          = one                         # from apa
#   intercept         = yes                         # from apa
#   intercept.label   = Constant                    # from apa
#   fit.rows          = r2                          # from apa
#   reference         = row                         # from apa
#   reference.label   = reference                   # from apa
#   variable.headings = bold                        # from report
#   group.headings    = italic                      # from apa
#
#   [logistic]
#   title             = Logistic Regression Coefficients Predicting {outcome}  # from apa
#   columns           = b, se, or, p                # from apa
#   columns.last      = none                        # from apa
#   stub.label        = Predictor                   # from apa
#   b.label           = b                           # from apa
#   se.label          = SE                          # from apa
#   or.label          = OR                          # from apa
#   p.label           = p                           # from apa
#   wald.label        = Wald                        # from apa
#   ci.label          = 95% CI for OR               # from apa
#   beta.gelman.label = β*                          # from apa
#   ci.style          = one                         # from apa
#   intercept         = yes                         # from apa
#   intercept.label   = Constant                    # from apa
#   fit.rows          = chisq, nagelkerke           # from apa
#   reference         = row                         # from apa
#   reference.label   = reference                   # from apa
#   variable.headings = bold                        # from report
#   group.headings    = italic                      # from apa
#
#   [correlation]
#   title          = Descriptive Statistics and Correlations for Study Variables  # from apa
#   columns        = n, mean, sd                 # from apa
#   stub.label     = Variable                    # from apa
#   n.label        = n                           # from apa
#   mean.label     = M                           # from apa
#   sd.label       = SD                          # from apa
#   lower.triangle = yes                         # from apa
#   r.stars        = yes                         # from apa
#   method.note    = yes                         # from apa
#
#   [ttest]
#   title         = Means, Standard Deviations, and t Tests by {group}  # from apa
#   columns       = mean, sd, t, p, d           # from apa
#   stub.label    = Variable                    # from apa
#   n.label       = n                           # from apa
#   mean.label    = M                           # from apa
#   sd.label      = SD                          # from apa
#   t.label       = t                           # from apa
#   df.label      = df                          # from apa
#   df.position   = column                      # from report
#   p.label       = p                           # from apa
#   d.label       = d                           # from apa
#   diff.label    = Mean difference             # from apa
#   ci.label      = 95% CI                      # from apa
#   ci.style      = one                         # from apa
#   group.spanner = yes                         # from apa
#   test.note     = yes                         # from apa
#
#   [anova]
#   title         = Means, Standard Deviations, and One-Way Analyses of Variance by {group}  # from apa
#   columns       = mean, sd, f, p, eta2        # from apa
#   stub.label    = Variable                    # from apa
#   n.label       = n                           # from apa
#   mean.label    = M                           # from apa
#   sd.label      = SD                          # from apa
#   f.label       = F                           # from apa
#   df.label      = df                          # from apa
#   df.position   = column                      # from report
#   p.label       = p                           # from apa
#   eta2.label    = η²                          # from apa
#   group.spanner = yes                         # from apa
#   test.note     = yes                         # from apa
#
#   [crosstab]
#   title             = Frequencies and Percentages by {group}  # from apa
#   columns           = n, percent                  # from apa
#   total             = yes                         # from apa
#   percent.base      = column                      # from apa
#   test.columns      = chisq, df, p, v             # from apa
#   stub.label        = Variable                    # from apa
#   n.label           = n                           # from apa
#   percent.label     = %                           # from apa
#   total.label       = Total                       # from apa
#   chisq.label       = χ²                          # from apa
#   df.label          = df                          # from apa
#   p.label           = p                           # from apa
#   v.label           = V                           # from apa
#   group.spanner     = yes                         # from apa
#   variable.headings = bold                        # from report
#
#   [reliability]
#   title                  = Item Statistics and Reliability  # from apa
#   columns                = mean, sd, item.total, alpha.if.deleted  # from apa
#   stub.label             = Item                        # from apa
#   mean.label             = M                           # from apa
#   sd.label               = SD                          # from apa
#   item.total.label       = Item-total *r*              # from apa
#   alpha.if.deleted.label = α if item deleted           # from apa
#   alpha                  = yes                         # from apa
#   item.total.note        = yes                         # from apa
#   group.headings         = italic                      # from apa
#
#   [multiresponse]
#   title         = {set}          # from apa
#   columns       = n, percent     # from apa
#   stub.label    = Option         # from apa
#   n.label       = n              # from apa
#   percent.label = %              # from apa
#   none.label    = None of these  # from apa
#   choice.note   = yes            # from apa
#
#   [plot]
#   font            = Arial       # from report
#   size            = 10          # from report
#   palette         = greys       # from apa
#   gridlines       = horizontal  # from report
#   grid.color      = D9D9D9      # from apa
#   axis.lines      = x           # from report
#   legend.position = top         # from report
#   values          = yes         # from apa
#   values.grouped  = no          # from apa
#   width           = 6           # from apa
#   height          = 4           # from apa
#   resolution      = 300         # from apa
#   data.file       = no          # from apa
#   vector.file     = none        # from apa

# Render 3 -- the three files opened in the editor, three tabs, nothing
# printed. Each is opened, then checked: a value jstats cannot use would
# stop, naming its line, with the file already open to put it right.
jstyle("banded", open = TRUE)
jstyle("bar", open = TRUE)
jstyle("us", open = TRUE)

# Render 4 -- the same three crosstabs in report and in each of the three,
# written to one Word file and opened; then the style folder put back.
d12 <- tdat
x12 <- list(jcrosstab(Smoker ~ Volunteer, d12, print = FALSE),
            jcrosstab(OwnsHome ~ Volunteer, d12, print = FALSE),
            jcrosstab(Region ~ Volunteer, d12, print = FALSE))
g12a <- jtable(x12, style = "report", print = FALSE,
               title = "Frequencies and Percentages by Volunteering (report)")
g12b <- jtable(x12, style = "banded", print = FALSE,
               title = "Frequencies and Percentages by Volunteering (banded)")
g12c <- jtable(x12, style = "bar", print = FALSE,
               title = "Frequencies and Percentages by Volunteering (bar)")
g12d <- jtable(x12, style = "us", print = FALSE,
               title = "Frequencies and Percentages by Volunteering (us)")
jtable(list(g12a, g12b, g12c, g12d),
       file = file.path(.walk_out12, "Gallery.docx"), overwrite = TRUE,
       open = TRUE)
joptions(style.dir = .entry_style_dir12, quiet = TRUE)
# Expected:
#   Table 1. Frequencies and Percentages by Volunteering (report)
#     3 variables by Volunteer, on a portrait page.
#   Table 2. Frequencies and Percentages by Volunteering (banded)
#     3 variables by Volunteer, on a portrait page.
#   Table 3. Frequencies and Percentages by Volunteering (bar)
#     3 variables by Volunteer, on a portrait page.
#   Table 4. Frequencies and Percentages by Volunteering (us)
#     3 variables by Volunteer, on a portrait page.
#   4 tables written to
#   <tempdir>/walk_tables12/Gallery.docx

# Things to look at:
#   - the folder set as the style folder (made first, silently, if it was
#     not there);
#   - Render 1: banded, bar and us from the folder, after the two built-in
#     styles (any other file of yours there is listed too); the folders
#     searched, the styles folder first;
#   - Render 2: "based on report, then apa" under the file's path; bar's
#     six settings unmarked; "# from report" on report's own (font, size,
#     caption.form and the rest it sets); "# from apa" on everything else;
#   - Render 3 (in the editor): each file as Notepad shows it -- its name,
#     what it follows, that the source's other rules are the author's,
#     then the short file's lines on what it lists and how to edit it (the
#     words jstyle() writes), then its settings, each with a short note,
#     since S410 a blank line after each but the last, as jstyle() writes
#     them;
#   - Render 4 (in Word): the same table four times. (report) as built in.
#     (banded) every other data row shaded light grey. (bar) a dark teal
#     bar behind the caption, running into the header, the text white;
#     each variable's row light teal, every other data row lighter, no
#     rules (teal's colors since S414, ruling R80). (us) "Table 4." and
#     the title on one line, the note's label
#     NOTE:, p and V without the zero while the chi-square keeps it;
#   - at the end the style folder the session had is put back. To keep the
#     styles folder set in every session of this project, put
#     joptions(style.dir = "styles") after library(jstats) at the top of
#     your script, or in the project's .Rprofile: a name with no folder is
#     read from the working directory, the project's folder. jstats does
#     not look in a styles folder by itself (S408), so that line is what
#     sets it.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 13 -- N after the title, the ns in the note, a style file's blank lines ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Capability Slate U, build 2 (S410). Ruling R59, from your words on build
# 1's walk: N, the number of cases, goes after the title by default --
# apa's n.position is title, and report takes it from apa -- in the
# preview, in the report jtable() prints and in the Word caption. Where
# the ns vary within a table they stay in the note, as n.position = note
# writes them: models side by side whose Ns differ, a correlation table's
# pairwise ns, the groups of a t test or an ANOVA (the reading you
# confirmed: "when the Ns differ by variable or model, they go in the note
# as today"). Groups of one size give theirs in the note too, Claude's
# call: a t test's table names its groups' ns there whatever their sizes.
# A style that sets n.position = note puts N back at the head of the note.
# Then the (S409) item, from your words on the same walk: the files
# jstyle() writes have a blank line after each setting, none between a
# setting's notes and the setting; a blank line under each part's heading
# note is Claude's call. Sections 1-12 were re-pinned for both by running
# (the header names them). The style files and the Word file go in a
# folder of the session's temporary folder, set as the style folder and
# put back at the end; the tables are made from d13, a copy of tdat, and
# from e13, two groups of six. The jcomplete() Section 4 sets on tdat is
# cleared first, as in Section 10.

suppressMessages(jcomplete(clear.all = TRUE))
.walk_styles13 <- file.path(tempdir(), "walk_styles13")
unlink(.walk_styles13, recursive = TRUE); dir.create(.walk_styles13)
.entry_style_dir13 <- getOption(".jst_options_style_dir")
joptions(style.dir = .walk_styles13, quiet = TRUE)
d13 <- tdat
e13 <- data.frame(
  Score = c(12, 15, 11, 18, 14, 16, 10, 19, 13, 17, 12, 20),
  Group = haven::labelled(rep(c(1, 2), 6), c(Control = 1, Treatment = 2)))
attr(e13$Score, "label") <- "Score (0-20)"
attr(e13$Group, "label") <- "Group"

# Render 1 -- one pool of cases: N after the title, in apa and in report.
t13a <- jtable(jdesc(d13, WellbeingScore, Income, Age, print = FALSE))
print(t13a)
# Expected:
#   Table 1. Descriptive Statistics (N = 103)
#     3 variables, on a portrait page.
#   The table was made in R; no Word file was asked for.
#
#   Table 1
#   Descriptive Statistics (N = 103)
#   ------------------------------------------------------------------
#   Variable                  n       M          SD       Min     Max
#   ------------------------------------------------------------------
#   Wellbeing score (0-100)  103      50.89      11.48      25      81
#   Annual income (USD)       97  49,855.67  17,427.22  14,000  93,000
#   Age (years)              103      40.65      11.62      18      71
#   ------------------------------------------------------------------
t13b <- jtable(jfreq(d13, Region, print = FALSE), style = "report")
print(t13b)
# Expected:
#   Table 1. Frequency Distributions (N = 103)
#     1 variable, on a portrait page.
#   The table was made in R; no Word file was asked for.
#
#   Table 1: Frequency Distributions (N = 103)
#   -----------------------------
#   Variable              n    %
#   -----------------------------
#   Region of residence
#     North              27  26.2
#     South              20  19.4
#     East               31  30.1
#     West               25  24.3
#   -----------------------------

# Render 2 -- ns that vary within a table, in the note: two models whose
# Ns differ, then a correlation table's pairwise ns.
m13a <- jlm(WellbeingScore ~ Age, d13, print = FALSE)
m13b <- jlm(WellbeingScore ~ Age + Income, d13, print = FALSE)
t13c <- jtable(list(m13a, m13b))
print(t13c)
# Expected:
#   Note: the models were fit on different numbers of cases
#   (Model 1: 103; Model 2: 97); the table's note says so.
#   To fit every model on the same cases, run jcomplete() on the largest model's
#   variables, then the models again:
#     jcomplete(d13, WellbeingScore, Age, Income)
#   Table 1. Regression Coefficients Predicting Wellbeing score (0-100)
#     2 models side by side, on a portrait page, long labels on two lines.
#   The table was made in R; no Word file was asked for.
#
#   Table 1
#   Regression Coefficients Predicting Wellbeing score (0-100)
#   ---------------------------------------------------------------------------
#                                 Model 1                     Model 2
#   Predictor               b     SE    β     p       b        SE     β     p
#   ---------------------------------------------------------------------------
#   Constant              37.11  3.90       <.001  24.81    3.75          <.001
#   Age (years)            0.34  0.09  .34  <.001   0.18    0.08     .18   .030
#   Annual income (USD)                             0.0004  0.00006  .56  <.001
#   R²                      .12                      .41
#   N                    103                       97
#   ---------------------------------------------------------------------------
#   Note. N differs by model: 103 (Model 1), 97 (Model 2).
t13d <- jtable(jcorr(d13, WellbeingScore, Income, Age, print = FALSE))
print(t13d)
# Expected:
#   Table 1. Descriptive Statistics and Correlations for Study Variables
#     3 variables, on a portrait page.
#   The table was made in R; no Word file was asked for.
#
#   Table 1
#   Descriptive Statistics and Correlations for Study Variables
#   -----------------------------------------------------------------------
#   Variable                     n       M          SD        1      2    3
#   -----------------------------------------------------------------------
#   1. Wellbeing score (0-100)  103      50.89      11.48     —
#   2. Annual income (USD)       97  49,855.67  17,427.22  .62***    —
#   3. Age (years)              103      40.65      11.62  .34***  .29**  —
#   -----------------------------------------------------------------------
#   Note. Pairwise ns range from 97 to 103.
#   *p < .05. **p < .01. ***p < .001.

# Render 3 -- a t test's groups, in the note: 54 and 49, then six and six.
t13e <- jtable(jt(WellbeingScore ~ Volunteer, d13, print = FALSE))
print(t13e)
# Expected:
#   Table 1. Means, Standard Deviations, and t Tests by Volunteered in past year
#     1 outcome by Volunteer, on a portrait page.
#   The table was made in R; no Word file was asked for.
#
#   Table 1
#   Means, Standard Deviations, and t Tests by Volunteered in past year
#   ------------------------------------------------------------------------
#                             Volunteered in past year
#                                 No            Yes
#   Variable                   M      SD     M      SD   t(101)    p     d
#   ------------------------------------------------------------------------
#   Wellbeing score (0-100)  47.46  11.70  54.67  10.06   -3.34  .001  -0.66
#   ------------------------------------------------------------------------
#   Note. n = 54 (No) and 49 (Yes).
t13f <- jtable(jt(Score ~ Group, e13, print = FALSE))
print(t13f)
# Expected:
#   Note: Table 1 shows Group by its name, having no variable label.
#   To show labels, add them with jrelabel(), then run the analysis again,
#   for example:
#     jrelabel(MyData, Group, var.label = "...", modify = TRUE)
#   Table 1. Means, Standard Deviations, and t Tests by Group
#     1 outcome by Group, on a portrait page.
#   The table was made in R; no Word file was asked for.
#
#   Table 1
#   Means, Standard Deviations, and t Tests by Group
#   -----------------------------------------------------------
#                           Group
#                   Control     Treatment
#   Variable        M     SD     M     SD   t(10)    p      d
#   -----------------------------------------------------------
#   Score (0-20)  12.00  1.41  17.50  1.87  -5.74  <.001  -3.32
#   -----------------------------------------------------------
#   Note. n = 6 (Control) and 6 (Treatment).

# Render 4 -- the six tables in one Word file, opened.
jtable(list(t13a, t13b, t13c, t13d, t13e, t13f),
       file = file.path(.walk_styles13, "NAfterTitle.docx"), overwrite = TRUE,
       open = TRUE)
# Expected:
#   Table 1. Descriptive Statistics (N = 103)
#     3 variables, on a portrait page.
#   Table 2. Frequency Distributions (N = 103)
#     1 variable, on a portrait page.
#   Table 3. Regression Coefficients Predicting Wellbeing score (0-100)
#     2 models side by side, on a portrait page, long labels on two lines.
#   Table 4. Descriptive Statistics and Correlations for Study Variables
#     3 variables, on a portrait page.
#   Table 5. Means, Standard Deviations, and t Tests by Volunteered in past year
#     1 outcome by Volunteer, on a portrait page.
#   Table 6. Means, Standard Deviations, and t Tests by Group
#     1 outcome by Group, on a portrait page.
#   6 tables written to
#   <tempdir>/walk_styles13/NAfterTitle.docx

# Render 5 -- a short file that puts N back in the note, printed as
# written; then a table made in it.
jstyle(save.as = "nnote", n.position = "note", size = 11,
       descriptives = list(columns = c("n", "mean", "sd")))
cat(readLines(file.path(.walk_styles13, "nnote.jstyle"), encoding = "UTF-8"),
    sep = "\n")
# Expected:
#   Style written to
#   <tempdir>/walk_styles13/nnote.jstyle
#
#   # nnote.jstyle:
#   # A jstats table style, based on apa, a style built into jstats.
#   # It lists only the settings that differ from apa; any setting not listed here takes apa's value.
#   # ?jstyle_settings lists every setting and what it takes.
#   # Change only the values after the = signs, or add a setting from that list; do not invent a setting, and do not rename a setting or a section.
#   # jstyle("nnote") checks the file and names any value it cannot use.
#
#   format     = 1
#   written.by = jstats 0.9.279
#   based.on   = apa
#
#   # where N, the number of cases, goes: note (the general note opens on it) | title ("(N = 103)" after the title; a table with several ns, such as Ns that differ or a t test's groups, gives them in the note) | none
#   # takes: one of note | title | none
#   n.position = note
#
#   # the text size, in points
#   # takes: a number from 6 to 72
#   size = 11
#
#   [descriptives]
#   # the columns, in order: n, mean, sd, min, max
#   # takes: one or more of n, mean, sd, min, max, in order, separated by commas
#   columns = n, mean, sd
t13g <- jtable(jdesc(d13, WellbeingScore, Income, Age, print = FALSE),
               style = "nnote")
print(t13g)
# Expected:
#   Table 1. Descriptive Statistics
#     3 variables, on a portrait page.
#   The table was made in R; no Word file was asked for.
#
#   Table 1
#   Descriptive Statistics
#   --------------------------------------------------
#   Variable                  n       M          SD
#   --------------------------------------------------
#   Wellbeing score (0-100)  103      50.89      11.48
#   Annual income (USD)       97  49,855.67  17,427.22
#   Age (years)              103      40.65      11.62
#   --------------------------------------------------
#   Note. N = 103.

# Render 6 -- a complete copy where the general settings end and the
# [descriptives] section begins.
jstyle("apa", save.as = "full13")
f13 <- readLines(file.path(.walk_styles13, "full13.jstyle"), encoding = "UTF-8")
at13 <- grep("^\\[descriptives\\]$", f13)
cat(f13[(at13 - 4L):(at13 + 9L)], sep = "\n")
joptions(style.dir = .entry_style_dir13, quiet = TRUE)
# Expected:
#   Style written to
#   <tempdir>/walk_styles13/full13.jstyle
#
#   # yes: the general note says which cases a filter kept (jsubset(), subset =) | no
#   # takes: one of yes | no
#   filter.note = yes
#
#   [descriptives]
#   # A descriptives table, from jdesc() results.
#
#   # the title when the call gives none
#   # takes: any text
#   title = Descriptive Statistics
#
#   # the columns, in order: n, mean, sd, min, max
#   # takes: one or more of n, mean, sd, min, max, in order, separated by commas
#   columns = n, mean, sd, min, max

# Things to look at:
#   - Render 1: "(N = 103)" after the title, in the report's line and the
#     preview's, in apa (the title on its own line) and in report
#     ("Table 1:" and the title on one line); no note under either table,
#     N having been all it held;
#   - Render 2: the two models' Ns in the N row and in the note, "N
#     differs by model: 103 (Model 1), 97 (Model 2).", nothing after the
#     title; the correlation table's "Pairwise ns range from 97 to 103." in
#     the note, nothing after the title;
#   - Render 3: the groups' ns in the note and nothing after the title --
#     "n = 54 (No) and 49 (Yes)."; and "n = 6 (Control) and 6
#     (Treatment).", groups of one size (Claude's call; the other way
#     would put "(N = 12)" after the title and leave no note);
#   - Render 4 (in Word): Tables 1 and 2 with "(N = 103)" after the title
#     -- in apa's italic title the N upright (a symbol inside italic type
#     is set upright), in report's bold upright title the N italic; Tables
#     3 to 6 with their ns in the note, as in the previews;
#   - Render 5: the short file -- after the stamps, each setting under its
#     notes with a blank line after it, none between a setting's notes and
#     the setting, none at the end, so [descriptives] follows a blank
#     line; n.position's note in its new words (Claude's); then the table
#     made in it: nothing after the title, "Note. N = 103." as apa wrote it
#     until this build;
#   - Render 6: the complete copy the same way; under "[descriptives]" the
#     section's heading note, then a blank line (Claude's call: that note
#     says what the section is for, not what a setting does; the general
#     settings' heading note has one too, Sections 3 and 11).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 14 -- jmulti(): a multiple-response set, and its table ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Capability Slate U's charts, build 1 (S414): rulings R60-R62 from the
# S411 design session -- a multiple-response set ("Which services have you
# used? Tick all that apply") counted by a function of its own, jmulti()
# (R62), on everyone who answered (R61), with a table of its own (R60) --
# and the five leans you okayed at S414's opening: a ticked box is 1, and
# ticked = names another value; a text item in the set stops, named; the
# options ranked by count, rank = FALSE keeping the data frame's order; the
# set's title from the text its items' labels share, else "Options
# Chosen"; a note when no item holds a "No". The Console output, the
# table's layout (the stub "Option", n and %) and every message here are
# Claude's calls. The data are made here: s14, twelve people asked about
# four services, 1 = used and 2 = not, the twelfth declared -99 "Not asked"
# on every item, the seventh blank on every item, the ninth blank on
# Housing alone; then l14, the shape a LimeSurvey CSV file has, "Y" or
# blank. The Word file goes in a folder of the session's temporary folder.

.walk_out14 <- file.path(tempdir(), "walk_tables14")
unlink(.walk_out14, recursive = TRUE); dir.create(.walk_out14)
s14 <- data.frame(
  LegalAid    = c(2, 2, 1, 1, 2, 2, NA, 2, 2, 2, 1, -99),
  Counselling = c(1, 2, 1, 2, 2, 1, NA, 2, 1, 2, 1, -99),
  Financial   = c(2, 2, 2, 2, 2, 1, NA, 2, 2, 2, 1, -99),
  Housing     = c(2, 1, 1, 2, 2, 1, NA, 2, NA, 2, 1, -99))
s14$LegalAid <- haven::labelled_spss(s14$LegalAid, c(Yes = 1, No = 2, "Not asked" = -99),
  na_values = -99, label = "Services used: Legal aid")
s14$Counselling <- haven::labelled_spss(s14$Counselling, c(Yes = 1, No = 2, "Not asked" = -99),
  na_values = -99, label = "Services used: Counselling")
s14$Financial <- haven::labelled_spss(s14$Financial, c(Yes = 1, No = 2, "Not asked" = -99),
  na_values = -99, label = "Services used: Financial advice")
s14$Housing <- haven::labelled_spss(s14$Housing, c(Yes = 1, No = 2, "Not asked" = -99),
  na_values = -99, label = "Services used: Housing")

# Render 1 -- the set: the Console output.
jmulti(s14, LegalAid:Housing)
# Expected:
#   Multiple Response
#
#   Analysis N: 10 (2 answered no item)
#
#   Services used
#                  Freq  Percent
#   -------------  ----  -------
#   Counselling      5    50.00
#   Housing          4    40.00
#   LegalAid         3    30.00
#   Financial        2    20.00
#   None of these    3    30.00

# Render 2 -- the data frame's order, the options named by their labels.
jmulti(s14, LegalAid:Housing, rank = FALSE, variable.id = "labels")
# Expected:
#   Multiple Response
#
#   Analysis N: 10 (2 answered no item)
#
#   Services used
#                     Freq  Percent
#   ----------------  ----  -------
#   Legal aid           3    30.00
#   Counselling         5    50.00
#   Financial advice    2    20.00
#   Housing             4    40.00
#   None of these       3    30.00

# Render 3 -- a file that writes a ticked box "Y" and an empty one blank:
# under the default ticked = 1 the call stops and gives the line with
# ticked = "Y"; that line run, the note that no item holds a "No".
l14 <- data.frame(Q1_SQ001 = c("Y", "", "Y", "", "Y"),
                  Q1_SQ002 = c("", "Y", "Y", "", ""),
                  Q1_SQ003 = c("", "", "Y", "", "Y"), stringsAsFactors = FALSE)
try(jmulti(l14, Q1_SQ001:Q1_SQ003))
# Expected:
#   Error : jmulti(): Q1_SQ001, Q1_SQ002, and Q1_SQ003 hold text ("Y"), not
#   numbers, and ticked = is 1.
#   If "Y" marks a chosen option, name it with ticked =:
#     jmulti(l14, Q1_SQ001:Q1_SQ003, ticked = "Y")
jmulti(l14, Q1_SQ001:Q1_SQ003, ticked = "Y")
# Expected:
#   Multiple Response
#
#   Analysis N: 4 (1 answered no item)
#
#   Options Chosen
#             Freq  Percent
#   --------  ----  -------
#   Q1_SQ001    3    75.00
#   Q1_SQ002    2    50.00
#   Q1_SQ003    2    50.00
#
#   Note: no item of the set holds any value but "Y", the value counted as
#   chosen, so a person who chose nothing is blank on every item and
#   is not in N.
#   N counts only those who chose at least one option.
#   If the survey had its own "None of these" box, name it with none = to count
#   everyone who answered.

# Render 4 -- the "Other" box inside the range, a text answer among the
# "Y" boxes: the stop names it.
l14$Q1_other <- c("", "bus pass", "", "", "")
try(jmulti(l14, Q1_SQ001:Q1_other, ticked = "Y"))
# Expected:
#   Multiple Response
#   Error : jmulti(): Q1_other holds text that no other item of the set holds
#   ("bus pass"), so it is not a yes/no item.
#   Name only the set's yes/no items, and leave out a text answer such as an
#   "Other" box.

# Render 5 -- the table in apa: the report, then the table itself.
m14 <- jmulti(s14, LegalAid:Housing, print = FALSE)
t14a <- jtable(m14)
print(t14a)
# Expected:
#   Table 1. Services used (N = 10)
#     1 set of 4 options, on a portrait page.
#   The table was made in R; no Word file was asked for.
#
#   Table 1
#   Services used (N = 10)
#   -------------------------
#   Option            n    %
#   -------------------------
#   Counselling       5  50.0
#   Housing           4  40.0
#   Legal aid         3  30.0
#   Financial advice  2  20.0
#   None of these     3  30.0
#   -------------------------
#   Note. Respondents could choose more than one, so the percentages sum to
#   more than 100.

# Render 6 -- the same in report, with a note and a source of the call's.
t14b <- jtable(m14, style = "report", note = "Asked of all respondents.",
               source = "Community services survey, 2026")
print(t14b)
# Expected:
#   Table 1. Services used (N = 10)
#     1 set of 4 options, on a portrait page.
#   The table was made in R; no Word file was asked for.
#
#   Table 1: Services used (N = 10)
#   -------------------------
#   Option            n    %
#   -------------------------
#   Counselling       5  50.0
#   Housing           4  40.0
#   Legal aid         3  30.0
#   Financial advice  2  20.0
#   None of these     3  30.0
#   -------------------------
#   Note: Respondents could choose more than one, so the percentages sum to
#   more than 100.
#   Asked of all respondents.
#   Source: Community services survey, 2026.

# Render 7 -- both in one Word file, opened.
jtable(list(t14a, t14b), file = file.path(.walk_out14, "Services.docx"),
       overwrite = TRUE, open = TRUE)
# Expected:
#   Table 1. Services used (N = 10)
#     1 set of 4 options, on a portrait page.
#   Table 2. Services used (N = 10)
#     1 set of 4 options, on a portrait page.
#   2 tables written to
#   <tempdir>/walk_tables14/Services.docx

# Render 8 -- two sets in one call: each jmulti() result is a table of its
# own (ruling R56). The stop's first four lines; the lines that make each
# table and write them to one file follow them, named as Section 8 shows.
m14b <- jmulti(s14, LegalAid, Counselling, print = FALSE)
tryCatch(jtable(list(m14, m14b)),
         error = function(e) cat(strsplit(conditionMessage(e), "\n")[[1]][1:4],
                                 sep = "\n"))
# Expected:
#   jtable(): each jmulti() result is a table of its own.
#   To put more options in one table, name them in one jmulti() call.
#   Make each table in a call of its own, then give the tables together to write
#   them to one file:

# Things to look at:
#   - Render 1: "Analysis N: 10 (2 answered no item)" -- the seventh person,
#     blank on every item, and the twelfth, declared missing on every item,
#     are out of N (R61); the ninth, blank on Housing alone, is in N and
#     counted as not using it; the options ranked by count, "Services used"
#     over them (the text the labels share); "None of these 3", the three
#     who answered and used none, last; each percentage of N, so they sum
#     to more than 100;
#   - Render 2: the data frame's order, each option by what its label adds
#     to "Services used", "None of these" still last;
#   - Render 3: the stop names the items holding text and gives the call
#     with ticked = "Y", which runs; then the set with no "No" in it -- the
#     fourth person blank on every item and out of N -- with the note that
#     says so and points to none = for a survey's own "None of these" box;
#   - Render 4: the "Other" box named, with the text it holds, and what to
#     leave out;
#   - Render 5: the report's line "1 set of 4 options"; the table: the stub
#     "Option", n and %, the options by their text, "None of these" last,
#     "(N = 10)" after the title, the note that the percentages sum to
#     more than 100 (R61's sentence);
#   - Render 6: report's form -- "Table 1:" and the title on one line,
#     "Note:" upright, each sentence of the note on a line of its own,
#     your note after jstats's, "Source:" last on a line of its own;
#   - Render 7 (in Word): the two tables as previewed, the counts and the
#     percentages each centered under their heads;
#   - Render 8: the stop for two sets: why, and that more options go in one
#     jmulti() call (Claude's wording), then the lead to the lines.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 15 -- The review's table rulings: the df, the notes, the centering, the sizes, the caption's color ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Capability Slate U's charts, build 1 (S414): the pre-CRAN review's table
# entries, ruled at S413 -- R74 the df by style (apa in the statistic's
# head, report a df column); R75 the general note's sentences by style (apa
# one paragraph, report a line each); R76 the preview centering a column's
# numbers under a wider head, as Word centers them; R77 size carrying the
# caption's and the note's sizes; R78 caption.text, the caption's text
# color; R79 source = on jtable() -- under report its own line, last -- and
# report's notes in the report manuals' order. R76's re-pins elsewhere in
# this file are mechanical under the ruling; this section shows its forms.
# The new settings' names (df.position, note.sentences, note.order,
# source.position, source.label, caption.text) and their notes are Claude's
# calls, reviewed with every setting in the review's entry 13. The style
# files and the Word file go in a folder of the session's temporary folder,
# set as the style folder and put back at the end.

d15 <- tdat
.walk_styles15 <- file.path(tempdir(), "walk_styles15")
unlink(.walk_styles15, recursive = TRUE); dir.create(.walk_styles15)
.entry_style_dir15 <- getOption(".jst_options_style_dir")
joptions(style.dir = .walk_styles15, quiet = TRUE)

# Render 1 -- R74: a t test under apa, "t(101)" in the head, and under
# report, a df column beside a plain t.
t15a <- jtable(jt(WellbeingScore ~ Volunteer, d15, print = FALSE), print = FALSE)
t15b <- jtable(jt(WellbeingScore ~ Volunteer, d15, print = FALSE), style = "report",
               print = FALSE)
print(t15a)
print(t15b)
# Expected:
#   Table 1
#   Means, Standard Deviations, and t Tests by Volunteered in past year
#   ------------------------------------------------------------------------
#                             Volunteered in past year
#                                 No            Yes
#   Variable                   M      SD     M      SD   t(101)    p     d
#   ------------------------------------------------------------------------
#   Wellbeing score (0-100)  47.46  11.70  54.67  10.06   -3.34  .001  -0.66
#   ------------------------------------------------------------------------
#   Note. n = 54 (No) and 49 (Yes).
#
#   Table 1: Means, Standard Deviations, and t Tests by Volunteered in past year
#   -----------------------------------------------------------------------------
#                             Volunteered in past year
#                                 No            Yes
#   Variable                   M      SD     M      SD     t     df    p      d
#   -----------------------------------------------------------------------------
#   Wellbeing score (0-100)  47.46  11.70  54.67  10.06  -3.34  101  0.001  -0.66
#   -----------------------------------------------------------------------------
#   Note: n = 54 (No) and 49 (Yes).

# Render 2 -- R74 and R76: a Welch ANOVA under apa, its F centered under
# the wider "F(3, 50.34)"; under report the df in a column; then a
# crosstab, each count and percentage centered under its head.
a15 <- jaov(WellbeingScore ~ Region, d15, welch = TRUE, print = FALSE)
t15c <- jtable(a15, print = FALSE)
t15d <- jtable(a15, style = "report", print = FALSE)
print(t15c)
print(t15d)
print(jtable(jcrosstab(Smoker ~ Volunteer, d15, print = FALSE), print = FALSE))
# Expected:
#   Table 1
#   Means, Standard Deviations, and One-Way Analyses of Variance by Region of residence
#   ------------------------------------------------------------------------------------------------------
#                                             Region of residence
#                                North         South         East         West
#   Variable                   M      SD     M      SD     M     SD     M      SD   F(3, 50.34)    p    η²
#   ------------------------------------------------------------------------------------------------------
#   Wellbeing score (0-100)  52.96  10.15  48.15  14.74  50.94  9.94  50.80  11.92      0.56     .645  .02
#   ------------------------------------------------------------------------------------------------------
#   Note. n = 27 (North), 20 (South), 31 (East), and 25 (West). The analysis of
#   variance did not assume equal variances (Welch's F test).
#
#   Table 1: Means, Standard Deviations, and One-Way Analyses of Variance by Region of residence
#   -----------------------------------------------------------------------------------------------------------
#                                             Region of residence
#                                North         South         East         West
#   Variable                   M      SD     M      SD     M     SD     M      SD     F      df       p     η²
#   -----------------------------------------------------------------------------------------------------------
#   Wellbeing score (0-100)  52.96  10.15  48.15  14.74  50.94  9.94  50.80  11.92  0.56  3, 50.34  0.645  0.02
#   -----------------------------------------------------------------------------------------------------------
#   Note: n = 27 (North), 20 (South), 31 (East), and 25 (West).
#   The analysis of variance did not assume equal variances (Welch's F test).
#
#   Table 1
#   Frequencies and Percentages by Volunteered in past year (N = 98)
#   -----------------------------------------------------------------------
#                   Volunteered in past year
#                        No           Yes       Total
#   Variable          n      %     n     %     n    %    χ²   df    p    V
#   -----------------------------------------------------------------------
#   Current smoker                                      0.04   1  .834  .02
#     No             34    65.4    31   67.4  65  66.3
#     Yes            18    34.6    15   32.6  33  33.7
#   -----------------------------------------------------------------------

# Render 3 -- R75 and R79: an item table under a filter, with a source of
# the call's: apa's note one paragraph, the source its last sentence;
# report's a line a sentence, "Source:" on a line of its own, last.
r15 <- jalpha(d15, Environment1, Environment3, Environment4, subset = Age >= 30,
              print = FALSE)
t15e <- jtable(r15, source = "Community survey, 2026", print = FALSE)
t15f <- jtable(r15, style = "report", source = "Community survey, 2026", print = FALSE)
print(t15e)
print(t15f)
# Expected:
#   Table 1
#   Item Statistics and Reliability (N = 72)
#   ----------------------------------------------------------------------------------------------------
#   Item                                                       M    SD   Item-total r  α if item deleted
#   ----------------------------------------------------------------------------------------------------
#   Climate change is a serious threat.                      3.15  1.16       .63             .81
#   Government should do more for the environment.           3.10  1.27       .72             .72
#   I would pay more for environmentally friendly products.  3.39  1.22       .71             .74
#   ----------------------------------------------------------------------------------------------------
#   Note. Only cases with Age (years) ≥ 30 are included. Cronbach's α = .83.
#   Item-total r is each item's correlation with the sum of the other items.
#   Community survey, 2026.
#
#   Table 1: Item Statistics and Reliability (N = 72)
#   ----------------------------------------------------------------------------------------------------
#   Item                                                       M    SD   Item-total r  α if item deleted
#   ----------------------------------------------------------------------------------------------------
#   Climate change is a serious threat.                      3.15  1.16      0.63             0.81
#   Government should do more for the environment.           3.10  1.27      0.72             0.72
#   I would pay more for environmentally friendly products.  3.39  1.22      0.71             0.74
#   ----------------------------------------------------------------------------------------------------
#   Note: Only cases with Age (years) ≥ 30 are included.
#   Cronbach's α = 0.83.
#   Item-total r is each item's correlation with the sum of the other items.
#   Source: Community survey, 2026.

# Render 4 -- R79's order: a correlation table with a note on one row,
# under report: the stars' line, the row's note, "Note:", then "Source:".
t15g <- jtable(jcorr(d15, WellbeingScore, Income, Age, print = FALSE),
               style = "report", markers = list("Before tax." = Income),
               source = "Community survey, 2026", print = FALSE)
print(t15g)
# Expected:
#   Table 1: Descriptive Statistics and Correlations for Study Variables
#   -------------------------------------------------------------------------
#   Variable                     n       M          SD        1        2    3
#   -------------------------------------------------------------------------
#   1. Wellbeing score (0-100)  103      50.89      11.48     —
#   2. Annual income (USD)^a     97  49,855.67  17,427.22  0.62***     —
#   3. Age (years)              103      40.65      11.62  0.34***  0.29**  —
#   -------------------------------------------------------------------------
#   *p < 0.05. **p < 0.01. ***p < 0.001.
#   ^a Before tax.
#   Note: Pairwise ns range from 97 to 103.
#   Source: Community survey, 2026.

# Render 5 -- R77: a short file that sets size = 11 and nothing else; its
# general settings printed: caption.size and note.size are "size", from
# apa, so the caption and the note are 11 points with the cells.
jstyle(save.as = "size11", size = 11)
cat(utils::capture.output(jstyle("size11"))[1:30], sep = "\n")
# Expected:
#   Style written to
#   <tempdir>/walk_styles15/size11.jstyle
#
#   Style: size11
#     <tempdir>/walk_styles15/size11.jstyle
#     based on apa
#     Set in this file: size.
#     Every other setting comes from apa.
#
#   font              = Times New Roman  # from apa
#   size              = 11
#   paper             = a4               # from apa
#   caption.form      = apa              # from apa
#   caption.position  = row              # from apa
#   caption.size      = size             # from apa
#   caption.fill      = none             # from apa
#   caption.text      = 000000           # from apa
#   header.fill       = none             # from apa
#   header.text       = 000000           # from apa
#   header.bold       = no               # from apa
#   band.fill         = none             # from apa
#   heading.fill      = none             # from apa
#   rules             = apa              # from apa
#   rule.color        = 000000           # from apa
#   note.label        = Note.            # from apa
#   note.label.italic = yes              # from apa
#   note.position     = row              # from apa
#   note.size         = size             # from apa
#   note.sentences    = paragraph        # from apa
#   note.order        = apa              # from apa
#   source.position   = note             # from apa
#   source.label      = Source:          # from apa
#   n.position        = title            # from apa

# Render 6 -- R78: a short file based on report, its caption on a bar of a
# color of its own with white text; a table made in it.
jstyle("report", save.as = "teal15", caption.fill = "0E5A5F", caption.text = "white")
t15h <- jtable(jdesc(d15, WellbeingScore, Age, print = FALSE), style = "teal15",
               print = FALSE)
t15i <- jtable(jdesc(d15, WellbeingScore, Age, print = FALSE), style = "size11",
               note = "Ages are in whole years.", print = FALSE)
# Expected:
#   Style written to
#   <tempdir>/walk_styles15/teal15.jstyle

# Render 7 -- the tables in one Word file, opened; the style folder put
# back.
jtable(list(t15a, t15b, t15c, t15d, t15e, t15f, t15g, t15h, t15i),
       file = file.path(.walk_styles15, "Rulings.docx"), overwrite = TRUE,
       open = TRUE)
joptions(style.dir = .entry_style_dir15, quiet = TRUE)
# Expected:
#   Table 1. Means, Standard Deviations, and t Tests by Volunteered in past year
#     1 outcome by Volunteer, on a portrait page.
#   Table 2. Means, Standard Deviations, and t Tests by Volunteered in past year
#     1 outcome by Volunteer, on a portrait page.
#   Table 3. Means, Standard Deviations, and One-Way Analyses of Variance by
#   Region of residence
#     1 outcome by Region, on a landscape page.
#   Table 4. Means, Standard Deviations, and One-Way Analyses of Variance by
#   Region of residence
#     1 outcome by Region, on a landscape page.
#   Table 5. Item Statistics and Reliability (N = 72)
#     1 scale of 3 items, on a portrait page, long labels on two lines.
#   Table 6. Item Statistics and Reliability (N = 72)
#     1 scale of 3 items, on a portrait page, long labels on two lines.
#   Table 7. Descriptive Statistics and Correlations for Study Variables
#     3 variables, on a portrait page.
#   Table 8. Descriptive Statistics (N = 103)
#     2 variables, on a portrait page.
#   Table 9. Descriptive Statistics (N = 103)
#     2 variables, on a portrait page.
#   9 tables written to
#   <tempdir>/walk_styles15/Rulings.docx

# Things to look at:
#   - Render 1: apa's head "t(101)", the df inside it; report's plain "t"
#     with "df" a column of its own beside it, 101 under it;
#   - Render 2: apa's "F(3, 50.34)", and 0.56 centered under it, where it
#     sat hard right until this build; report's df column holding
#     "3, 50.34"; the crosstab's counts and percentages centered under n
#     and % within the wider group columns (the odd space on the left);
#   - Render 3: apa -- "Note." and every sentence in one paragraph, the
#     source's sentence last, its full stop added; report -- "Note:" and
#     each sentence on a line of its own, then "Source: Community survey,
#     2026." on its own line, last;
#   - Render 4: report's order -- the stars' line first, then the row's
#     note (^a Before tax.), then "Note:" and its sentence, then the
#     source;
#   - Render 5: size = 11 the file's one setting; caption.size and
#     note.size read "size # from apa", so both are 11 points, the size
#     the cells are;
#   - Render 7 (in Word): Tables 1-7 as previewed, in apa or report; Table
#     8 on a dark teal caption bar, its caption in white, the header report's
#     grey; Table 9 at 11 points throughout -- the caption, the cells and
#     the note the same size.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 16 -- The riders: the report's last line, two stops, a style file's printout, a title's placeholders, open = TRUE ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Capability Slate U's charts, build 1 (S414): the riders, each Claude's
# call or a lean you okayed at S414's opening. The review's entry 8: the
# report's last line when no file was asked for -- "No file was written."
# until this build -- and the full level's note, which no longer
# prescribes an assignment R cannot see; entry 5: two stops that named
# jtable() twice; entry 9: a style file's printout says what the file
# itself sets; entry 12 (lean 4): a title of the call's fills {group} and
# {outcome}; and the (S410) open = TRUE item (lean 2): where no program on
# the computer opens a .docx file, a note, and the call goes on. The walk
# cannot make a computer with no such program, so Render 5 hands the
# helper that opens the file a stand-in that fails, as the battery does.

d16 <- tdat
.walk_styles16 <- file.path(tempdir(), "walk_styles16")
unlink(.walk_styles16, recursive = TRUE); dir.create(.walk_styles16)

# Render 1 -- entry 8: the report when no Word file was asked for; at
# joutput("full") the note on writing it and printing it.
t16a <- jtable(jdesc(d16, Age, print = FALSE))
joutput("full", quiet = TRUE)
t16b <- jtable(jdesc(d16, Age, print = FALSE))
joutput(NULL, quiet = TRUE)
# Expected:
#   Table 1. Descriptive Statistics (N = 103)
#     1 variable, on a portrait page.
#   The table was made in R; no Word file was asked for.
#
#   Table 1. Descriptive Statistics (N = 103)
#     1 variable, on a portrait page.
#   The table was made in R; no Word file was asked for.
#   Note: to write the table to a Word file, add file = to the call:
#     jtable(jdesc(d16, Age, print = FALSE), file = "Table1.docx")
#   To see a table here, print it by the name it was kept under with <-,
#   for example:
#     print(t1)

# Render 2 -- entry 5: the two stops, jtable() named once.
try(jtable(list()))
try(jtable(jdesc(d16, Age, print = FALSE), open = TRUE))
# Expected:
#   Error : jtable(): the list given is empty.
#   Give a saved result, or a list of results or of built tables.
#   Error : jtable(): open = TRUE opens the file the call writes, so it needs
#   file = as well, for example:
#     jtable(jdesc(d16, Age, print = FALSE), open = TRUE, file = "Table1.docx")

# Render 3 -- entry 12: a title of the call's own, its placeholders filled.
t16c <- jtable(jt(WellbeingScore ~ Volunteer, d16, print = FALSE),
               title = "Wellbeing by {group}")
t16d <- jtable(jlm(WellbeingScore ~ Age, d16, print = FALSE),
               title = "Predictors of {outcome}")
# Expected:
#   Table 1. Wellbeing by Volunteered in past year
#     1 outcome by Volunteer, on a portrait page.
#   The table was made in R; no Word file was asked for.
#
#   Table 1. Predictors of Wellbeing score (0-100) (N = 103)
#     1 model, on a portrait page.
#   The table was made in R; no Word file was asked for.

# Render 4 -- entry 9: a style file's printout, its head: what the file
# sets, then where every other setting comes from.
jstyle(save.as = file.path(.walk_styles16, "two16"), size = 11,
       regression = list(fit.rows = c("r2", "n")))
cat(utils::capture.output(jstyle(file.path(.walk_styles16, "two16.jstyle")))[1:8],
    sep = "\n")
# Expected:
#   Style written to
#   <tempdir>/walk_styles16/two16.jstyle
#
#   Style: two16
#     <tempdir>/walk_styles16/two16.jstyle
#     based on apa
#     Set in this file: size and [regression] fit.rows.
#     Every other setting comes from apa.
#
#   font              = Times New Roman  # from apa
#   size              = 11

# Render 5 -- open = TRUE where no program opens a .docx file: the note,
# and FALSE back, so the call goes on.
jtable(t16a, file = file.path(.walk_styles16, "Age.docx"), overwrite = TRUE)
print(.jst_table_open(file.path(.walk_styles16, "Age.docx"), TRUE, ask = TRUE,
                      browse = function(p) stop("no program is set to open .docx files")))
# Expected:
#   Table 1. Descriptive Statistics (N = 103)
#     1 variable, on a portrait page.
#   Table written to
#   <tempdir>/walk_styles16/Age.docx
#
#   Note: the file was written, but no program on this computer opened it:
#     <tempdir>/walk_styles16/Age.docx
#   Open it from its folder, in Word, LibreOffice, or another program that reads
#   .docx files.
#
#   [1] FALSE

# Things to look at:
#   - Render 1: "The table was made in R; no Word file was asked for." under
#     the report (Claude's wording); at "full" the note gives the call with
#     file = added, then "To see a table here, print it by the name it was
#     kept under with <-, for example:" and print(t1) -- no "t1 <- ..." line
#     that a call already assigned could not see;
#   - Render 2: "the list given is empty." and "open = TRUE opens the file
#     the call writes", each naming jtable() once, in the prefix;
#   - Render 3: "Wellbeing by Volunteered in past year" and "Predictors of
#     Wellbeing score (0-100) (N = 103)" -- the placeholders filled from the
#     labels, as the style's own titles fill them;
#   - Render 4: under "based on apa", "Set in this file: size and
#     [regression] fit.rows." (a section's settings after its name), then
#     "Every other setting comes from apa.";
#   - Render 5: the note naming the file and how to open it, a blank line
#     after it, then [1] FALSE.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 17 -- The charts' look: each style's greys, labels on the axes, the bars' values ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Capability Slate U's charts, build 2 (S415). Ruling R64: every chart
# jplot() draws takes a publication style's look, its [plot] section --
# both built-ins in greys, Arial 10 on white, the bars standing on the
# axis; apa with both axis lines, no gridlines and the legend at the
# right; report with light horizontal gridlines, the x axis line alone and
# the legend at the top. The S412 audit's F4: a chart's axis and legend
# titles are the variables' labels, whatever joutput()'s variable.id.
# Ruling R70: a bar chart of one series shows each bar's count above it;
# several series show none. The Console is unchanged -- the red title still
# names the variables -- so the Expected blocks hold the titles and N
# lines; the charts are in the Plots pane, one per call: step through them
# with its arrows. The heatmap in greys is the lean you took at S415's
# opening (the sign in the number on each tile).

d17 <- tdat

# Render 1 -- apa, the session's style: a bar chart, bars by group, a
# histogram, a scatterplot with its line, a box plot.
jplot(d17, Region)
jplot(d17, Region, by = Volunteer)
jplot(d17, Age)
jplot(WellbeingScore ~ Income, d17, line = "lm")
jplot(WellbeingScore ~ Region, d17)
# Expected:
#   Bar Chart: Region
#
#   Analysis N: 103
#
#   Bar Chart: Region by Volunteer
#
#   Analysis N: 103
#
#   Histogram: Age
#
#   Analysis N: 103
#
#   Scatterplot: WellbeingScore and Income
#
#   Analysis N: 97 (6 Excluded)
#
#   Boxplot: WellbeingScore and Region
#
#   Analysis N: 103

# Render 2 -- the same five in report's look, by style =.
jplot(d17, Region, style = "report")
jplot(d17, Region, by = Volunteer, style = "report")
jplot(d17, Age, style = "report")
jplot(WellbeingScore ~ Income, d17, line = "lm", style = "report")
jplot(WellbeingScore ~ Region, d17, style = "report")
# Expected:
#   Bar Chart: Region
#
#   Analysis N: 103
#
#   Bar Chart: Region by Volunteer
#
#   Analysis N: 103
#
#   Histogram: Age
#
#   Analysis N: 103
#
#   Scatterplot: WellbeingScore and Income
#
#   Analysis N: 97 (6 Excluded)
#
#   Boxplot: WellbeingScore and Region
#
#   Analysis N: 103

# Render 3 -- a model's plots and the correlation heatmap, in greys; the
# names printed are the model's plots in the Plots pane, the heatmap last.
m17 <- jlm(WellbeingScore ~ Income + Age, d17, print = FALSE)
p17 <- jplot(m17)
h17 <- jplot(jcorr(d17, WellbeingScore, Income, Age, CommuteTime, print = FALSE))
names(p17)
# Expected:
#   [1] "fit"       "residuals" "qq"        "cooks"    

# Things to look at (in the Plots pane):
#   - Render 1 (apa): greys -- one series dark grey, the two groups' bars
#     dark and light grey; Arial; the axes titled by the labels ("Region of
#     residence", "Age (years)", "Annual income (USD)"); no gridlines; both
#     axis lines; the bars standing on the x axis; each bar's count above it
#     in the first chart, none on the grouped bars or the histogram; the
#     grouped chart's legend at the right, titled "Volunteered in past
#     year"; the histogram's Count axis in whole numbers;
#   - Render 2 (report): light grey horizontal gridlines, the x axis line
#     alone, the grouped chart's legend at the top, starting at the left;
#   - Render 3: the model's plots in greys, their reference lines black;
#     the heatmap's tiles white to dark grey by the size of r, its sign in
#     the number, the numbers white on the darkest tiles, the variables by
#     their labels.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 18 -- A chart in the Word file: the figure, its frame, a chart drawn in ggplot2 ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Rulings R63, R65, R69 and R71 (S411-S413) and the S412 audit's F6 and
# F7. A chart kept with <- goes to jtable() as a built table does, and into
# the Word file as a figure: numbered on a sequence of its own (Figure 1
# beside Table 1); framed by the style's caption form -- apa's "Figure 1"
# bold with the title in italics below, report's "Figure 1: Title" bold on
# one line -- N after the title (the cases the chart draws); the picture, a
# PNG at 300 dots an inch, 6 by 4 inches; a note only when there is one. A
# model's or a test's plot loses its title from the picture, the title
# standing in the caption; a chart drawn in ggplot2 by hand keeps its own
# look, its title moving to the caption. The report's figure lines, the
# preview and the Word files are Claude's calls on the rulings. Each
# Expected block starts at the jtable() call that makes the figures: the
# lines above it, which draw the charts and build Render 2's table, print
# what Sections 1 and 17 show, not repeated here.

d18 <- tdat
.walk_fig18 <- file.path(tempdir(), "walk_fig18")
unlink(.walk_fig18, recursive = TRUE); dir.create(.walk_fig18)

# Render 1 -- a chart made a figure: what jtable() reports, then print().
p18 <- jplot(d18, Region)
f18 <- jtable(p18)
print(f18)
# Expected:
#   Figure 1. Region of residence (N = 103)
#     a bar chart, 6 by 4 inches, on a portrait page.
#   The figure was made in R; no Word file was asked for.
#
#   Figure 1
#   Region of residence (N = 103)
#   (a bar chart, drawn in the Plots pane)

# Render 2 -- a Word file, apa: a table, then a bar chart, bars by group, a
# model's fit and residual plots, and a chart drawn in ggplot2 with a title
# of its own.
t18 <- jtable(jdesc(d18, Age, WellbeingScore, print = FALSE))
g18 <- jplot(d18, Region, by = Volunteer)
m18 <- jplot(jlm(WellbeingScore ~ Income + Age, d18, print = FALSE))
u18 <- ggplot2::ggplot(as.data.frame(d18), ggplot2::aes(x = Age, y = WellbeingScore)) +
  ggplot2::geom_point() + ggplot2::labs(title = "Age and wellbeing, drawn in ggplot2")
doc18 <- jtable(list(t18, p18, g18, m18$fit, m18$residuals, u18),
                file = file.path(.walk_fig18, "Figures_apa.docx"), overwrite = TRUE,
                open = TRUE)
# Expected:
#   Table 1. Descriptive Statistics (N = 103)
#     2 variables, on a portrait page.
#   Figure 1. Region of residence (N = 103)
#     a bar chart, 6 by 4 inches, on a portrait page.
#   Figure 2. Region of residence by Volunteered in past year (N = 103)
#     a bar chart, 6 by 4 inches, on a portrait page.
#   Figure 3. Wellbeing score (0-100) by Annual income (USD) (N = 97)
#     a fit plot, 6 by 4 inches, on a portrait page.
#   Figure 4. Residuals vs Fitted (N = 97)
#     a residual plot, 6 by 4 inches, on a portrait page.
#   Figure 5. Age and wellbeing, drawn in ggplot2
#     a chart drawn in ggplot2, 6 by 4 inches, on a portrait page.
#   1 table and 5 figures written to
#   <tempdir>/walk_fig18/Figures_apa.docx

# Render 3 -- the bar chart in the report style, with a title, a note and a
# source of the call's.
f18b <- jtable(p18, style = "report", title = "Where respondents live",
               note = "Region as respondents reported it.",
               source = "The 2024 community survey",
               file = file.path(.walk_fig18, "Figure_report.docx"), overwrite = TRUE,
               open = TRUE)
# Expected:
#   Figure 1. Where respondents live (N = 103)
#     a bar chart, 6 by 4 inches, on a portrait page.
#   Figure written to
#   <tempdir>/walk_fig18/Figure_report.docx

# Things to look at:
#   - Render 1: the report, "Figure 1. Region of residence (N = 103)" and
#     "a bar chart, 6 by 4 inches, on a portrait page."; print(f18): the
#     caption's two lines, a line saying the chart is in the Plots pane, and
#     the chart drawn there as the Word file holds it;
#   - Render 2, Figures_apa.docx: Table 1, then Figures 1 to 5 -- "Figure n"
#     bold over its title in italics, N upright after it ((N = 97) for the
#     model's plots); each picture 6 inches wide and sharp; the fit plot's
#     title the outcome by the predictor, the residual plot's "Residuals vs
#     Fitted", each in the caption and not in the picture; Figure 5 the
#     ggplot2 chart in its own grey-panel look, its title in the caption
#     only; no note under any figure; no figure's caption on one page and
#     its picture on the next;
#   - Render 3, Figure_report.docx: "Figure 1: Where respondents live (N =
#     103)" bold on one line, the chart with report's gridlines, then "Note:
#     Region as respondents reported it." and "Source: The 2024 community
#     survey." on lines of their own.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 19 -- The data and vector files, R72's note, the riders ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Ruling R65: a style file's [plot] section can write each chart's data
# to an Excel file beside the Word file (data.file = yes: <file>_figures.xlsx,
# a sheet per figure) and each figure as a vector file (vector.file = pdf or
# eps), both off in the built-ins. Ruling R72 (the S412 audit's F9): where a
# table or a figure shows a variable by its name, or a category by its code,
# because the result holds no label, a note says so when it is made --
# consequential where the result holds other labels, advisory at "full"
# where it holds none -- its jrelabel() line carrying the user's codes. The
# (S414) riders: a label kept whole in Word (the S414 walk's correlation
# table, whose stub broke "(0-" / "100)"), and the preview's carets under
# two specific notes in one paragraph. And the stops a chart meets. The
# notes' and the stops' wording are Claude's calls. In Renders 1 and 2 the
# Expected block starts at the first jtable() call: the lines above it
# that write the style file and draw the charts print what Sections 9 and
# 17 show, not repeated here.

d19 <- tdat
.walk_fig19 <- file.path(tempdir(), "walk_fig19")
unlink(.walk_fig19, recursive = TRUE); dir.create(.walk_fig19)

# Render 1 -- a short style file with data.file and vector.file on; two
# figures written; the files beside the Word file; Figure 1's sheet.
jstyle(save.as = file.path(.walk_fig19, "figfiles"),
       plot = list(data.file = "yes", vector.file = "pdf"))
p19a <- jplot(d19, Region)
p19b <- jplot(d19, Age)
f19 <- jtable(list(p19a, p19b), style = file.path(.walk_fig19, "figfiles.jstyle"),
              file = file.path(.walk_fig19, "Figures.docx"), overwrite = TRUE)
print(sort(basename(list.files(.walk_fig19))))
print(as.data.frame(readxl::read_excel(file.path(.walk_fig19, "Figures_figures.xlsx"),
                                       sheet = "Figure 1")))
# Expected:
#   Figure 1. Region of residence (N = 103)
#     a bar chart, 6 by 4 inches, on a portrait page.
#   Figure 2. Age (years) (N = 103)
#     a histogram, 6 by 4 inches, on a portrait page.
#   2 figures written to
#   <tempdir>/walk_fig19/Figures.docx
#   The data of Figures 1 and 2 written to
#   <tempdir>/walk_fig19/Figures_figures.xlsx
#   Figure 1 also written to
#   <tempdir>/walk_fig19/Figures_Figure_1.pdf
#   Figure 2 also written to
#   <tempdir>/walk_fig19/Figures_Figure_2.pdf
#
#   [1] "figfiles.jstyle"      "Figures_Figure_1.pdf" "Figures_Figure_2.pdf"
#   [4] "Figures_figures.xlsx" "Figures.docx"        
#     Region  n  Percent
#   1  North 27 26.21359
#   2  South 20 19.41748
#   3   East 31 30.09709
#   4   West 25 24.27184

# Render 2 -- ruling R72's note: Volunteer's label taken off a copy of the
# data, so a table and a figure show its name; then a data frame with no
# labels at all, at the standard level and at "full".
d19b <- d19
attr(d19b$Volunteer, "label") <- NULL
p19c <- jplot(d19b, Region, by = Volunteer)
t19 <- jtable(jt(WellbeingScore ~ Volunteer, d19b, print = FALSE))
f19c <- jtable(p19c)
u19 <- data.frame(Group = rep(1:2, 10), Score = seq(1, 20))
t19b <- jtable(jt(Score ~ Group, u19, print = FALSE))
joutput("full", quiet = TRUE)
t19c <- jtable(jt(Score ~ Group, u19, print = FALSE))
joutput(NULL, quiet = TRUE)
# Expected:
#   Note: Table 1 shows Volunteer by its name, having no variable label.
#   To show labels, add them with jrelabel(), then run the analysis again,
#   for example:
#     jrelabel(MyData, Volunteer, var.label = "...", modify = TRUE)
#   Table 1. Means, Standard Deviations, and t Tests by Volunteer
#     1 outcome by Volunteer, on a portrait page.
#   The table was made in R; no Word file was asked for.
#
#   Note: Figure 1 shows Volunteer by its name, having no variable label.
#   To show labels, add them with jrelabel(), then draw the chart again,
#   for example:
#     jrelabel(d19b, Volunteer, var.label = "...", modify = TRUE)
#   Figure 1. Region of residence by Volunteer (N = 103)
#     a bar chart, 6 by 4 inches, on a portrait page.
#   The figure was made in R; no Word file was asked for.
#
#   Table 1. Means, Standard Deviations, and t Tests by Group
#     1 outcome by Group, on a portrait page.
#   The table was made in R; no Word file was asked for.
#
#   Note: Table 1 shows Score and Group by their names, having no
#   variable labels.
#   It shows codes 1 and 2 of Group without value labels.
#   To show labels, add them with jrelabel(), then run the analysis again,
#   for example:
#     jrelabel(MyData, Score, var.label = "...", modify = TRUE)
#   Table 1. Means, Standard Deviations, and t Tests by Group
#     1 outcome by Group, on a portrait page.
#   The table was made in R; no Word file was asked for.
#   Note: to write the table to a Word file, add file = to the call:
#     jtable(jt(Score ~ Group, u19, print = FALSE), file = "Table1.docx")
#   To see a table here, print it by the name it was kept under with <-,
#   for example:
#     print(t1)

# Render 3 -- the riders: the correlation table with descriptives, its
# labels on two lines in Word, each broken where ruling R55 measured it
# ("1. Wellbeing score" / "(0-100)"); two specific notes in one paragraph
# of the preview, each with its caret. t1 is kept for Render 4.
t1 <- jtable(jcorr(d19, WellbeingScore, Income, Age, CommuteTime, print = FALSE),
             file = file.path(.walk_fig19, "Correlations.docx"), overwrite = TRUE,
             open = TRUE)
t19e <- jtable(jdesc(d19, Age, Income, WellbeingScore, print = FALSE),
               markers = list("Mean-centered" = Age, "In US dollars" = Income))
print(t19e)
# Expected:
#   Table 1. Descriptive Statistics and Correlations for Study Variables
#     4 variables, on a portrait page, long labels on two lines.
#   Table written to
#   <tempdir>/walk_fig19/Correlations.docx
#
#   Table 1. Descriptive Statistics (N = 103)
#     3 variables, on a portrait page.
#   The table was made in R; no Word file was asked for.
#
#   Table 1
#   Descriptive Statistics (N = 103)
#   ------------------------------------------------------------------
#   Variable                  n       M          SD       Min     Max
#   ------------------------------------------------------------------
#   Age (years)^a            103      40.65      11.62      18      71
#   Annual income (USD)^b     97  49,855.67  17,427.22  14,000  93,000
#   Wellbeing score (0-100)  103      50.89      11.48      25      81
#   ------------------------------------------------------------------
#   ^a Mean-centered. ^b In US dollars.

# Render 4 -- the stops a chart meets: a table's input on a chart, a
# chart's setting in a call, a saved result beside a chart (t1 and tab1
# are taken, so the lines name the table table1 rather than replace either).
tab1 <- t1
try(jtable(p19c, headings = list(Groups = Region)))
try(jtable(p19c, resolution = 600))
try(jtable(list(jt(WellbeingScore ~ Volunteer, d19, print = FALSE), p19c)))
# Expected:
#   Error : jtable(): headings = is for a table; a chart takes title =,
#   note = and source =, for example:
#     jtable(p19c, title = "Region of residence by Volunteer")
#   Error : jtable(): resolution = is one of a style's chart settings, which a
#   call cannot change.
#   Set it in a style file, for example a copy of apa:
#     jstyle("apa", save.as = "mystyle")
#   Error : jtable(): saved results cannot be given beside built tables or
#   charts in one call.
#   Build each result into a table first, then give the tables and
#   charts together:
#     table1 <- jtable(jt(WellbeingScore ~ Volunteer, d19, print = FALSE))
#     jtable(list(table1, p19c), file = "Report.docx")

# Things to look at:
#   - Render 1: the report naming Figures.docx, then the data file and the
#     two pdf files beside it; the file list; Figure 1's sheet -- Region,
#     n and Percent, a row a region;
#   - Render 2: "Note: Table 1 shows Volunteer by its name, having no
#     variable label." with its jrelabel() line, before the report; the
#     figure's note saying "draw the chart again"; nothing for the frame with
#     no labels at the standard level, then at "full" the advisory note
#     naming Score and Group and Group's codes 1 and 2;
#   - Render 3, Correlations.docx in Word: the labels wrapped onto two lines
#     each broken between words, "(0-100)" whole on the second line; the
#     preview's note line "^a Mean-centered. ^b In US dollars.";
#   - Render 4: each stop's first line naming what was typed, then what a
#     chart takes, or where its settings go, or the lines that make the
#     table and write both.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Observations
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# <Free-form notes from the most recent walk: anything that looked off,
# wording worth an mv review, follow-ups. Dated entries, newest first.>
#
# 2026-11-06 (S409; Sections 3 and 9-12, "walked, all okay"). For the next
# build, riders: a blank line after each setting in the files jstyle()
# writes, none between a setting's notes and the setting (Jeff: "I think it
# will read better if there was a blank line after each of the actual
# settings (but not between the comments and the setting)"); the shading
# at the top of some report tables, left for later (Jeff: "let's let that
# alone for now and address it later"). Asked on the walk: N after the
# title -- a setting since S403, n.position = title, which the preview
# follows too; apa's default and so report's is the note (ruling R51,
# S401: "with a default to what you're saying is the APA sample's
# placement"), and N's place is the presentation review's entry 3, a
# ruling. And the two lines of TwoFonts.docx's captions -- apa's
# caption.form, APA 7's form, which myreport inherits from apa;
# caption.form = journal or report puts "Table 1" and the title on one
# line, as the built-in report style does.


# --- End marker --------------------------------------------------------------
# A real statement, deliberately last: stepping through with Ctrl+Enter, RStudio
# keeps expanding the selection when only comments remain, echoing the tail of
# the file back repeatedly. Ending on executable code gives it somewhere to
# stop. Keep this line at the foot of every walkthrough, below the Observations
# block.

# Hand back the message width Setup pinned (S406).
options(.jst_options_message_width = .entry_message_width)

cat("\n--- End of tables_walk.R ---\n")
