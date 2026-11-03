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
#           refitted under ruling R55. Build 5 adds its section.
# ORIGIN:   S400 (v0.9.270)
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
# note), a title and a general note of the user's. First the preview: a
# facsimile of the Word table, under the apa style -- two caption lines,
# the three rules, the heads centered over their columns, the labels
# indented under their headings, the numbers aligned on the decimal point,
# the notes under the bottom rule. Then the same table written to a .docx
# in the temporary folder and opened in Word.

d1 <- jdesc(WellbeingScore, Income, Age, CommuteTime, print = FALSE)
t1 <- jtable(d1,
             headings = list("Dependent variable"    = WellbeingScore,
                             "Independent variables" = c(Income, Age),
                             "Control variable"      = CommuteTime),
             markers  = list("Mean-centered" = c(Income, Age)),
             title    = "Descriptive Statistics for Study Variables",
             note     = "Wellbeing is scored from 0 to 100.")

# Expected:
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

# The same table to a Word file, opened in Word. The preview is off here
# (print = FALSE) so the block above is the one preview; the file is what
# this call is for.
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
# variable adds up to N = 103 and to 100 percent. First the preview; then
# the same table in Word, opened by jtable() itself (open = TRUE).

f1 <- jfreq(Education, Region, Smoker, print = FALSE)
t2 <- jtable(f1)

# Expected:
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
#   - n in italics in the header, % upright; the numbers on the decimal
#     point, each column of numbers centered under its head (S401);
#   - the three rules only.

# The call can change a setting of the table's own section (your S401
# okay): here every missing value on its own row by its label, and the
# valid and cumulative percentages beside n and %. The style is not
# touched; the next call is back to apa's settings.
jtable(f1, missing.rows = "each",
       columns = c("n", "percent", "valid.percent", "cumulative"))

# Expected:
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
cat(readLines(file.path(.walk_styles, "apa_copy.jstyle"), n = 16L,
              encoding = "UTF-8"), sep = "\n")

# Expected:
#   Style written to <tempdir>/walk_styles/apa_copy.jstyle
#
#   # apa_copy.jstyle: a jstats table style.
#   # Change a value after its = sign and save the file;
#   # jstyle("apa_copy") prints the settings jstats reads from it.
#   # A line that starts with # is a note. A setting the file leaves out
#   # comes from the style based.on names.
#
#   format     = 1
#   written.by = jstats 0.9.273
#   based.on   = apa
#
#   # The general settings: the look of every table.
#   # the typeface of every cell, caption and note
#   font = Times New Roman
#   # the text size, in points
#   size = 12
#   # the page the file opens on: a4 | letter

# Things to look at: the file's head as Notepad shows it -- what the file
# is, the two stamped lines and based.on, then each setting under a line
# saying what it does (every setting of every table type follows).

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

# Expected:
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

# Expected:
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
# the table is what this section is for. First the preview, under the apa
# style: a spanner over each model's four columns (b, SE, beta, p), the
# Constant first, the predictors in the models' order, Region's categories
# indented under its label with the reference category named after it,
# R2 under each model's b. Then the same table in Word, opened by jtable().

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

# Expected:
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
jtable(list(m1, m2, m3, m4), columns.last = "beta.gelman",
       fit.rows = c("r2", "adj.r2", "f", "delta.r2", "f.change", "n"),
       reference = "note")

# Expected:
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
#   Note. N = 92. Reference category for Region of residence: North. β* = Gelman's
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

# Expected:
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

# Expected:
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

# Expected:
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
# table of its own. First the five previews, then the five tables in one
# Word file, then the item table on its own. The section works on a copy
# of tdat, d7, so the settings Sections 4 to 6 leave on tdat (the
# complete-cases filter, the registrations) do not reach it when the file
# is run straight through.

d7 <- tdat
c1 <- jcorr(d7, WellbeingScore, Income, Age, CommuteTime, print = FALSE)
t5 <- jtable(c1)
# Expected:
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
# Expected:
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
# Expected:
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
#   Note. Group ns vary with missing data: North, 26 to 27; South, 19 to 20; East,
#   29 to 31; West, 23 to 25.

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
# Expected:
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
# Expected:
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
#   Cronbach's α = .84. Item-total r is each item's correlation with the sum of the
#   other items.

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
#   - a LANDSCAPE page: the ANOVA table, four groups wide, cannot fit a
#     portrait page even with its labels on two lines (ruling R55's test),
#     and one file has one page orientation; the other four fit portrait;
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

cat("\n--- End of tables_walk.R ---\n")
