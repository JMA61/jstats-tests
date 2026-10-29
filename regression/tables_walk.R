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
#           and 2 made in it and written to one file. Each later build of
#           Slate T adds its table's section.
# ORIGIN:   S400 (v0.9.270)
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
# only what differs, as you would in Notepad -- and makes Tables 1 and 2 in
# it, one Word file holding both. The walk keeps its style files in a
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
#   written.by = jstats 0.9.271
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
             "",
             "[descriptives]",
             "columns = mean, sd, min, max",
             "mean.label = Mean",
             "sd.label = Std Dev.",
             "min.label = Minimum",
             "max.label = Maximum"),
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
#   note.n           = yes              # from apa
#   decimals         = 2                # from apa
#   leading.zero     = no               # from apa
#   p.format         = exact            # from apa
#   p.decimals       = 3                # from apa
#   stars            = .05, .01, .001   # from apa
#   marks            = symbols
#   minus            = true             # from apa
#   thousands        = comma            # from apa
#   landscape        = auto             # from apa
#   line.spacing     = single           # from apa
#   percent.decimals = 1                # from apa
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

# Things to look at:
#   - the settings myjournal sets, unmarked; every other "# from apa" --
#     the file names no [frequencies] section, so the frequency table takes
#     apa's, in the journal's caption form;
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
