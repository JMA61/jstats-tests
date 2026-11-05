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
# ORIGIN:   S400 (v0.9.270)
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
             headings = list("Dependent variable"    = WellbeingScore,
                             "Independent variables" = c(Income, Age),
                             "Control variable"      = CommuteTime),
             markers  = list("Mean-centered" = c(Income, Age)),
             title    = "Descriptive Statistics for Study Variables",
             note     = "Wellbeing is scored from 0 to 100.")
print(t1)

# Expected:
#   Table 1. Descriptive Statistics for Study Variables
#     4 variables under 3 headings, on a portrait page.
#   No file was written.
#
#   Table 1
#   Descriptive Statistics for Study Variables
#   -------------------------------------------------------------------------
#   Variable                         n       M          SD       Min     Max
#   -------------------------------------------------------------------------
#   Dependent variable
#     Wellbeing score (0-100)       103      50.89      11.48      25      81
#   Independent variables
#     Annual income (USD)^a          97  49,855.67  17,427.22  14,000  93,000
#     Age (years)^a                 103      40.65      11.62      18      71
#   Control variable
#     Daily commute time (minutes)  103      30.74      12.68       5      58
#   -------------------------------------------------------------------------
#   Note. N = 103. Wellbeing is scored from 0 to 100.
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
#   - the general note: "Note. N = 103." then your sentence.

# The same table to a Word file, opened in Word. print = FALSE leaves out
# jtable()'s report here; the file is what this call is for.
walk_file <- file.path(tempdir(), "Table1.docx")
jtable(t1, file = walk_file, overwrite = TRUE, print = FALSE)
if (interactive()) utils::browseURL(walk_file)

# Things to look at (in Word):
#   - the file opens with no repair prompt;
#   - "Table 1" in bold, the title in italics on the next line, INSIDE the
#     table as its first row -- click into it and the table's row handle
#     shows; select the table and the caption and notes come with it (the
#     SEQ field: References > Insert Table of Figures lists it);
#   - the three rules only -- above the heads, under them, under the last
#     row -- no vertical rules, none around the caption or the notes; Times
#     New Roman 12 throughout;
#   - n, M and SD in italics in the header; the role headings in italics,
#     spanning the table; the variables indented under them;
#   - the numbers aligned on the decimal point in each column (a decimal
#     tab stop in every number cell; the thing to check closely);
#   - the minus sign where a value is negative (none here), the thousands
#     separators, the superscript a on the two labels;
#   - "Note." in italics, N in italics, your sentence, then the specific
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
#   Table 1. Frequency Distributions
#     3 variables, on a portrait page.
#   No file was written.
#
#   Table 1
#   Frequency Distributions
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
#   Note. N = 103.

# Things to look at (the preview):
#   - each variable's label flush left on a row of its own (in the file a
#     row spanning the table, in plain type), its categories indented two
#     spaces under it, named by their value labels;
#   - n the count, % the percentage of all 103 cases at one decimal;
#   - the Missing rows: Education's 6 (3 Refused, 3 Don't know) and
#     Smoker's 5, so each variable's n adds up to 103 and its % to 100;
#     Region has no missing data and no Missing row;
#   - the default title, "Frequency Distributions", and the note on N.

# The same table to a Word file, opened in Word by jtable() (open = TRUE
# opens only in an interactive session, so a script or a knit opens
# nothing).
walk_file2 <- file.path(tempdir(), "Table2.docx")
jtable(t2, file = walk_file2, overwrite = TRUE, print = FALSE, open = TRUE)

# Things to look at (in Word):
#   - the file opens with no repair prompt, and Word is opened for you;
#   - the caption ("Table 1" bold, the title italic below it) as the first
#     row, the note as the last, as in Table 1;
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
#   Table 1. Frequency Distributions
#     3 variables, on a portrait page.
#   No file was written.
#
#   Table 1
#   Frequency Distributions
#   --------------------------------------------------------
#   Variable                  n    %   Valid %  Cumulative %
#   --------------------------------------------------------
#   Highest education level
#     Some high school       23  22.3     23.7          23.7
#     High school graduate   18  17.5     18.6          42.3
#     Some college           25  24.3     25.8          68.0
#     Bachelor's degree      13  12.6     13.4          81.4
#     Graduate degree        18  17.5     18.6         100.0
#     Refused                 3   2.9
#     Don't know              3   2.9
#   Region of residence
#     North                  27  26.2     26.2          26.2
#     South                  20  19.4     19.4          45.6
#     East                   31  30.1     30.1          75.7
#     West                   25  24.3     24.3         100.0
#   Current smoker
#     No                     65  63.1     66.3          66.3
#     Yes                    33  32.0     33.7         100.0
#     Refused                 5   4.9
#   --------------------------------------------------------
#   Note. N = 103.

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
#     apa  built into jstats (the default)
#
#   jstats looks for a style file in these folders, in this order:
#     <tempdir>/walk_styles (the style folder)
#     <working directory> (the working directory)
#     <your jstats folder> (your jstats folder, not created yet)

# Things to look at:
#   - apa, built in and the default; no style file yet;
#   - the three folders searched, in order: the style folder just set,
#     your working directory, and your jstats folder (R's per-user folder
#     for the package, which jstats creates only when you save a style
#     there).

jstyle("apa", save.as = "apa_copy")
cat(readLines(file.path(.walk_styles, "apa_copy.jstyle"), n = 18L,
              encoding = "UTF-8"), sep = "\n")

# Expected:
#   Style written to
#   <tempdir>/walk_styles/apa_copy.jstyle
#
#   # apa_copy.jstyle:
#   # A jstats table style.
#   # Every setting jstats has is below, each after a note saying what it does and what it takes.
#   # Change only the values after the = signs; do not add, rename or remove a setting or a section.
#   # A line that starts with # is a note.
#   # jstyle("apa_copy") checks the file and names any value it cannot use.
#
#   format     = 1
#   written.by = jstats 0.9.275
#   based.on   = apa
#
#   # The general settings: the look of every table.
#   # the typeface of every cell, caption and note
#   # takes: any text
#   font = Times New Roman
#   # the text size, in points
#   # takes: a number from 6 to 72
#   size = 12

# Things to look at: the file's head as Notepad shows it -- what the file
# is and, since S406, how to edit it (change only the values; never add,
# rename or remove a setting or a section), the two stamped lines and
# based.on, then each setting under its note on what it does and, since
# S406, a "# takes:" line saying what it takes (every setting of every
# table type follows). Since the S407 rebuild the head is the file's
# name on a line of its own, then one sentence a line, none wrapped;
# a note or a "# takes:" line runs on as long as it needs (until then
# each was broken at 76 columns).

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
#
#   font             = Times New Roman  # from apa
#   size             = 12               # from apa
#   paper            = a4               # from apa
#   caption.form     = journal
#   caption.position = row              # from apa
#   caption.size     = 12               # from apa
#   header.fill      = none             # from apa
#   header.text      = 000000           # from apa
#   header.bold      = no               # from apa
#   band.fill        = none             # from apa
#   rules            = apa              # from apa
#   rule.color       = 000000           # from apa
#   note.label       = Note.            # from apa
#   note.position    = row              # from apa
#   note.size        = 12               # from apa
#   n.position       = note             # from apa
#   decimals         = 2                # from apa
#   leading.zero     = never
#   p.format         = exact            # from apa
#   p.decimals       = 3                # from apa
#   stars            = .05, .01, .001   # from apa
#   marks            = symbols
#   minus            = true             # from apa
#   thousands        = comma            # from apa
#   landscape        = auto             # from apa
#   line.spacing     = single           # from apa
#   percent.decimals = 1                # from apa
#   filter.note      = yes              # from apa
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

# Things to look at:
#   - the settings myjournal sets, unmarked; every other "# from apa" --
#     the file names no [frequencies] or [logistic] section, so those
#     tables take apa's, in the journal's caption form;
#   - n.position (ruling R51) where note.n stood: note | title | none;
#     filter.note (build 4), yes | no: the filter sentence in a table's
#     note;
#   - the [regression] and [logistic] sections (build 3), every key with
#     apa's value but the two the file sets;
#   - the five sections build 4 adds, after [logistic]: [correlation],
#     [ttest], [anova], [crosstab] and [reliability], each key with apa's
#     value (their names are Claude's calls, for this walk);
#   - the printout is itself a style file's form: a line can be copied
#     into the file.

d1 <- jdesc(WellbeingScore, Income, Age, CommuteTime, print = FALSE)
t1j <- jtable(d1, style = "myjournal",
              headings = list("Dependent variable"    = WellbeingScore,
                              "Independent variables" = c(Income, Age),
                              "Control variable"      = CommuteTime),
              markers  = list("Mean-centered" = c(Income, Age)),
              title    = "Descriptive Statistics for Study Variables",
              note     = "Wellbeing is scored from 0 to 100.")
print(t1j)

# Expected:
#   Table 1. Descriptive Statistics for Study Variables
#     4 variables under 3 headings, on a portrait page.
#   No file was written.
#
#   Table 1. Descriptive Statistics for Study Variables
#   ----------------------------------------------------------------------
#   Variable                           Mean     Std Dev.  Minimum  Maximum
#   ----------------------------------------------------------------------
#   Dependent variable
#     Wellbeing score (0-100)           50.89      11.48       25       81
#   Independent variables
#     Annual income (USD)†          49,855.67  17,427.22   14,000   93,000
#     Age (years)†                      40.65      11.62       18       71
#   Control variable
#     Daily commute time (minutes)      30.74      12.68        5       58
#   ----------------------------------------------------------------------
#   Note. N = 103. Wellbeing is scored from 0 to 100.
#   † Mean-centered.

f1 <- jfreq(Education, Region, Smoker, print = FALSE)
t2j <- jtable(f1, style = "myjournal")
print(t2j)

# Expected:
#   Table 1. Frequency Distributions
#     3 variables, on a portrait page.
#   No file was written.
#
#   Table 1. Frequency Distributions
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
#   Note. N = 103.

# Things to look at (the previews):
#   - "Table 1. Descriptive Statistics for Study Variables" on one line;
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
#   Table 1. Regression Coefficients Predicting Wellbeing score (0-100)
#     4 models side by side, on a landscape page, its text at 10 pt, long labels
#     on two lines.
#   No file was written.
#
#   Table 1
#   Regression Coefficients Predicting Wellbeing score (0-100)
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
#   Note. N = 92.

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
#   - R2 under each model's b, without a zero; "Note. N = 92."

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
#     line before this build); no number wraps; the caption keeps 12 pt,
#     the note steps down with the table; a table that fits needs none of
#     this;
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
#   - "Note. N = 92." as the last row.
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
#   Table 1. Regression Coefficients Predicting Wellbeing score (0-100)
#     4 models side by side, on a landscape page, its text at 9 pt.
#   No file was written.
#
#   Table 1
#   Regression Coefficients Predicting Wellbeing score (0-100)
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
#   Note. N = 92. Reference category for Region of residence: North. β* =
#   Gelman's (2008) standardized coefficient: each continuous predictor divided
#   by two standard deviations, each binary predictor kept at 0 and 1.

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
#   Table 1. Logistic Regression Coefficients Predicting Volunteered
#   in past year
#     4 models side by side, on a landscape page, its text at 11 pt, long labels
#     on two lines.
#   No file was written.
#
#   Table 1
#   Logistic Regression Coefficients Predicting Volunteered in past year
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
#   Note. N = 92.

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
#   Table 1. Regression Coefficients Predicting Wellbeing score (0-100)
#     4 models side by side, on a landscape page, its text at 9 pt.
#   No file was written.
#
#   Table 1. Regression Coefficients Predicting Wellbeing score (0-100)
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
#   Note. N = 92. β* = Gelman's (2008) standardized coefficient: each continuous
#   predictor divided by two standard deviations, each binary predictor kept
#   at 0 and 1.

t4j <- jtable(list(g1, g2, g3, g4), style = "myjournal")
print(t4j)

# Expected:
#   Table 1. Logistic Regression Coefficients Predicting Volunteered
#   in past year
#     4 models side by side, on a landscape page, its text at 11 pt, long labels
#     on two lines.
#   No file was written.
#
#   Table 1. Logistic Regression Coefficients Predicting Volunteered in past year
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
#   Note. N = 92.

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
#   No file was written.
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
#   No file was written.
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
#   No file was written.
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
#   No file was written.
#
#   Table 1
#   Frequencies and Percentages by Volunteered in past year
#   ----------------------------------------------------------------------------
#                        Volunteered in past year
#                             No           Yes       Total
#   Variable               n      %     n     %     n    %    χ²   df    p    V
#   ----------------------------------------------------------------------------
#   Current smoker                                           0.04   1  .834  .02
#     No                   34    65.4   31   67.4  65  66.3
#     Yes                  18    34.6   15   32.6  33  33.7
#   Owns home                                                5.95   1  .015  .24
#     Yes                  19    35.2   29   59.2  48  46.6
#     No                   35    64.8   20   40.8  55  53.4
#   Region of residence                                      2.89   3  .409  .17
#     North                14    25.9   13   26.5  27  26.2
#     South                13    24.1    7   14.3  20  19.4
#     East                 17    31.5   14   28.6  31  30.1
#     West                 10    18.5   15   30.6  25  24.3
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
#   Table 1. Item Statistics and Reliability
#     1 scale of 5 items, on a portrait page, long labels on two lines.
#   No file was written.
#
#   Table 1
#   Item Statistics and Reliability
#   -----------------------------------------------------------------------------------------------------
#   Item                                                        M    SD   Item-total r  α if item deleted
#   -----------------------------------------------------------------------------------------------------
#   Climate change is a serious threat.                       3.15  1.16           .67                .80
#   Concern about the environment is exaggerated (reversed).  3.15  1.19           .72                .79
#   Government should do more for the environment.            3.10  1.27           .74                .78
#   I would pay more for environmentally friendly products.   3.39  1.22           .71                .79
#   Pollution is a major cause of public health problems.     2.74  1.45           .44                .87
#   -----------------------------------------------------------------------------------------------------
#   Note. N = 72. Only cases with Age (years) ≥ 30 are included.
#   Cronbach's α = .84. Item-total r is each item's correlation with the sum of
#   the other items.

# Things to look at:
#   - the stub head "Item", each item named by its label (its wording);
#     M and SD; "Item-total r" (the r italic in the file) and "alpha if
#     item deleted" (the Greek letter, upright), both without the zero;
#   - the note: N, then the filter in words -- "Only cases with Age
#     (years) >= 30 are included.", the sign one character -- then
#     Cronbach's alpha and what item-total r is (the console keeps
#     "alpha = .84" on one line);
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
#   Table 1. Descriptive Statistics
#     3 variables, on a portrait page.
#   No file was written.

# Render 2 -- the same call at joutput("full"): a note after the report gives
# the call with file = added, and the lines that keep the table and print it.
joutput("full", quiet = TRUE)
jtable(s8)
joutput(NULL, quiet = TRUE)
# Expected:
#   Table 1. Descriptive Statistics
#     3 variables, on a portrait page.
#   No file was written.
#   Note: to write the table to a Word file, add file = to the call:
#     jtable(s8, file = "Table1.docx")
#   To see the table here, keep it with <- and print it:
#     t1 <- jtable(s8)
#     print(t1)

# Render 3 -- those lines: the table kept, then printed.
t1 <- jtable(s8)
print(t1)
# Expected:
#   Table 1. Descriptive Statistics
#     3 variables, on a portrait page.
#   No file was written.
#
#   Table 1
#   Descriptive Statistics
#   ------------------------------------------------------------------
#   Variable                  n       M          SD       Min     Max
#   ------------------------------------------------------------------
#   Wellbeing score (0-100)  103      50.89      11.48      25      81
#   Annual income (USD)       97  49,855.67  17,427.22  14,000  93,000
#   Age (years)              103      40.65      11.62      18      71
#   ------------------------------------------------------------------
#   Note. N = 103.

# Render 4 -- a file written, then written over: the report says where it
# went, and the second time that it replaced the file.
walk_file8 <- file.path(tempdir(), "Table8.docx")
unlink(walk_file8)
jtable(k8, file = walk_file8)
jtable(k8, file = walk_file8, overwrite = TRUE)
# Expected:
#   Table 1. Regression Coefficients Predicting Wellbeing score (0-100)
#     1 model, on a portrait page.
#   Table written to <tempdir>/Table8.docx
#
#   Table 1. Regression Coefficients Predicting Wellbeing score (0-100)
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
#   Table 1. Descriptive Statistics
#     3 variables, on a portrait page.
#   No file was written.
#
#   Table 1. Regression Coefficients Predicting Wellbeing score (0-100)
#     1 model, on a portrait page.
#   No file was written.
#
#   Table 1. Descriptive Statistics
#     3 variables, on a portrait page.
#   Table 2. Regression Coefficients Predicting Wellbeing score (0-100)
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
#   No file was written.
#
#   Table 1. Descriptive Statistics
#     3 variables, on a portrait page.
#   Table 2. Means, Standard Deviations, and One-Way Analyses of Variance by
#   Region of residence
#     1 outcome by Region, on a landscape page.
#   Table 3. Regression Coefficients Predicting Wellbeing score (0-100)
#     1 model, on a portrait page.
#   3 tables written to
#   <tempdir>/Tables8_pages.docx

# Render 8 -- the object printed: every table, numbered as in the file.
print(doc8)
# Expected:
#   Table 1
#   Descriptive Statistics
#   ------------------------------------------------------------------
#   Variable                  n       M          SD       Min     Max
#   ------------------------------------------------------------------
#   Wellbeing score (0-100)  103      50.89      11.48      25      81
#   Annual income (USD)       97  49,855.67  17,427.22  14,000  93,000
#   Age (years)              103      40.65      11.62      18      71
#   ------------------------------------------------------------------
#   Note. N = 103.
#
#   Table 2
#   Means, Standard Deviations, and One-Way Analyses of Variance by Region of residence
#   --------------------------------------------------------------------------------------------------------
#                                                  Region of residence
#                                     North        South         East          West
#   Variable                        M      SD     M     SD     M      SD     M      SD   F(3, 99)    p    η²
#   --------------------------------------------------------------------------------------------------------
#   Daily commute time (minutes)  29.00  14.15  28.20  7.98  33.39  13.35  31.36  13.24      0.90  .442  .03
#   --------------------------------------------------------------------------------------------------------
#   Note. n = 27 (North), 20 (South), 31 (East), and 25 (West).
#
#   Table 3
#   Regression Coefficients Predicting Wellbeing score (0-100)
#   -------------------------------------------------
#   Predictor               b        SE     β     p
#   -------------------------------------------------
#   Constant             24.81    3.75          <.001
#   Age (years)           0.18    0.08     .18   .030
#   Annual income (USD)   0.0004  0.00006  .56  <.001
#   R²                     .41
#   -------------------------------------------------
#   Note. N = 97.

# Render 9 -- at joutput("full"), tables written together that could have
# been one table: a note names them, with the line that makes them one.
s8b <- jdesc(d8, CommuteTime, print = FALSE)
tab4 <- jtable(s8b, print = FALSE)
joutput("full", quiet = TRUE)
jtable(list(tab1, tab4), file = walk_file8b, overwrite = TRUE)
joutput(NULL, quiet = TRUE)
# Expected:
#   Table 1. Descriptive Statistics
#     3 variables, on a portrait page.
#   Table 2. Descriptive Statistics
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
#   # A jstats table style, based on apa, the style built into jstats.
#   # It lists only the settings that differ from apa; any setting not listed here takes apa's value.
#   # ?jstyle_settings lists every setting and what it takes.
#   # Change only the values after the = signs, or add a setting from that list.
#   # jstyle("short") checks the file and names any value it cannot use.
#
#   format     = 1
#   written.by = jstats 0.9.275
#   based.on   = apa
#
#   # the text size, in points
#   # takes: a number from 6 to 72
#   size = 11
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
#   Table 1. Regression Coefficients Predicting Wellbeing score (0-100)
#     1 model, on a portrait page.
#   No file was written.
#
#   Table 1
#   Regression Coefficients Predicting Wellbeing score (0-100)
#   -------------------------------------------------
#   Predictor               b        SE     β     p
#   -------------------------------------------------
#   Constant             24.81    3.75          <.001
#   Age (years)           0.18    0.08     .18   .030
#   Annual income (USD)   0.0004  0.00006  .56  <.001
#   R²                     .41
#   N                    97
#   -------------------------------------------------
#   Note. N = 97.

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
#     from that list; the stamps and based.on; then size and header.fill
#     with their notes, and [regression] with fit.rows. lightblue as you
#     typed it. Since the S407 rebuild the file's name is a line of its
#     own and each sentence another, none wrapped; header.fill's
#     "# takes:" and fit.rows' note and "# takes:" are one line each.
#   - Render 2: the N row under R2, as the file asks; the table's text at
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
# the style name "report", kept for the built-in report style a later
# version adds; a file named apa.jstyle, which jstats never reads; and two
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
#   Table 1. Frequency Distributions
#     1 variable, on a portrait page.
#   No file was written.
#
#   Table 1
#   Frequency Distributions
#   -----------------------------
#   Variable              n    %
#   -----------------------------
#   How we contacted you
#     Phone               5  41.7
#     2: Other            3  25.0
#     3: Other            4  33.3
#   -----------------------------
#   Note. N = 12.

# Render 4 -- "report" is kept for a built-in style; another name is written.
.walk_styles10 <- file.path(tempdir(), "walk_styles10")
unlink(.walk_styles10, recursive = TRUE); dir.create(.walk_styles10)
joptions(style.dir = .walk_styles10, quiet = TRUE)
try(jstyle("apa", save.as = "report"))
jstyle("apa", save.as = "myreport", font = "Arial", size = 11)
cat(readLines(file.path(.walk_styles10, "myreport.jstyle"), encoding = "UTF-8"),
    sep = "\n")
# Expected:
#   Error : jstyle(): "report" is the name of a built-in style a later version
#   of jstats adds.
#   Give the copy another name, for example:
#     jstyle("apa", save.as = "myreport")
#   Style written to <tempdir>/walk_styles10/myreport.jstyle
#
#   # myreport.jstyle:
#   # A jstats table style, based on apa, the style built into jstats.
#   # It lists only the settings that differ from apa; any setting not listed here takes apa's value.
#   # ?jstyle_settings lists every setting and what it takes.
#   # Change only the values after the = signs, or add a setting from that list.
#   # jstyle("myreport") checks the file and names any value it cannot use.
#
#   format     = 1
#   written.by = jstats 0.9.275
#   based.on   = apa
#
#   # the typeface of every cell, caption and note
#   # takes: any text
#   font = Arial
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
#   This file is not read, since "apa" always names jstats's built-in style:
#     <tempdir>/walk_styles10/apa.jstyle
#   To use it, rename it, for example to myapa.jstyle, and use style = "myapa".
#
#   Table 1. Descriptive Statistics
#     1 variable, on a portrait page.
#   No file was written.

# Render 6 -- two tables, built under two styles, written to one Word file:
# Table 1 in apa's Times New Roman 12, Table 2 in myreport's Arial 11.
t10b <- jtable(jfreq(d10, Contact, print = FALSE), style = "myreport")
jtable(list(t10a, t10b), file = file.path(.walk_styles10, "TwoFonts.docx"),
       open = TRUE)
joptions(style.dir = NULL, quiet = TRUE)
# Expected:
#   Table 1. Frequency Distributions
#     1 variable, on a portrait page.
#   No file was written.
#
#   Table 1. Descriptive Statistics
#     1 variable, on a portrait page.
#   Table 2. Frequency Distributions
#     1 variable, on a portrait page.
#   2 tables written to <tempdir>/walk_styles10/TwoFonts.docx

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
#   - Render 5: the note before the report -- the file named, why it is not
#     read, and the way to use it.
#   - Render 6 (in Word): Table 1 in Times New Roman 12, Table 2 in Arial
#     11, caption and notes included. Before, Table 2 came out in Times
#     with myreport's other settings. Since the S407 rebuilds (your walk:
#     "How we contacted you", "2: Other" and "3: Other" each wrapped onto
#     a second line, the title too, and the n and % columns stood under
#     the label) every label on one line: the columns are measured in the
#     table's own font, Arial a tenth wider than Times, each category
#     beside its indent as Word draws it; "How we contacted you" sets the
#     first column's width, as in the console, the n and % columns beside
#     it; and "Frequency Distributions" on one line -- a table narrower
#     than its title widens to it, every column in proportion.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Observations
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# <Free-form notes from the most recent walk: anything that looked off,
# wording worth an mv review, follow-ups. Dated entries, newest first.>


# --- End marker --------------------------------------------------------------
# A real statement, deliberately last: stepping through with Ctrl+Enter, RStudio
# keeps expanding the selection when only comments remain, echoing the tail of
# the file back repeatedly. Ending on executable code gives it somewhere to
# stop. Keep this line at the foot of every walkthrough, below the Observations
# block.

# Hand back the message width Setup pinned (S406).
options(.jst_options_message_width = .entry_message_width)

cat("\n--- End of tables_walk.R ---\n")
