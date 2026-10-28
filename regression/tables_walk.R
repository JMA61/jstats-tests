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
#           Word. Each later build of Slate T adds its table's section.
# ORIGIN:   S400 (v0.9.270)
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
