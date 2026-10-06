# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# _template_walk.R -- TEMPLATE for human-visual walkthroughs
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Copy to <topic>_walk.R (e.g. E11_na_map_walk.R) and fill in. The walkthrough
# is the human half of a regression pair: the *_check.R battery proves the
# numbers; this file shows a person what the OUTPUT looks like.
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# TYPE:     visual walkthrough (Expected comments; written for Jeff's checking)
# PENDING:  none
# LOCKS:    <one line: the shipped behavior this file keeps locked>
# ORIGIN:   S<NNN>
# LAST VERIFIED: v0.9.xxx, <date>   -- update after each full walk
# RUN:      line-by-line first (read each block of output before moving on).
#           Also source()-safe: deliberate errors are tryCatch-wrapped and
#           every prompting call passes overwrite = TRUE (the S220 traps).
#           Under source(), run WITH echo = TRUE, per the conventions file.
#           By section: source walk_tools.R, then rewalk("<topic>") shows the
#           sections the PENDING line names and rewalk("<topic>", "2") shows
#           one, each from a fresh Setup and its NEEDS. Add prepare = TRUE
#           to run only what the section needs and step through it by hand.
# SECTIONS: independent unless a framing comment says otherwise -- and then
#           the section carries a "# NEEDS: 1, 2" line inside its banner,
#           under the title, naming the sections rewalk() must run first.
#           Derive it by running, never by reading: a section needs an
#           earlier one when its output alone differs from its output in a
#           straight run of the file (the S337 harness, conventions file).
# FORM:     read by rewalk() and by RStudio's document outline (S337):
#           - the PENDING line above: "none", or the sections a build
#             re-pinned or added with the session and version, as in
#             "3, 5 (S338, v0.9.212)"; groups separated by ";". Claude
#             writes it at delivery and clears it when the walk is stamped.
#             Keep it to that one line -- an indented line under it is read
#             as more of the list.
#           - the title line of every PART / SECTION banner ends in " ----",
#             which is what puts it in the outline (Ctrl+Shift+O);
#           - banner rules are SPACED ("# = = ="). A solid rule of four or
#             more = or - is itself a section to RStudio and fills the
#             outline with "(Untitled)" entries.
# ENDING:   the file MUST end with the executable end-marker line at the foot
#           (not with comments) -- see the note down there for why.
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# --- Setup -------------------------------------------------------------------

# jstats must be loaded already: devtools::load_all() (development) OR
# library(jstats) (installed) -- never both in one session.
stopifnot(exists("jload", mode = "function"))

# Load what THIS file needs -- jload(), never readRDS(); absolute path per
# JStats_Testing_File_Conventions.txt. A file that needs no dataset DELETES
# this call and says so in the header.
jload("E:/00 R Projects/00_jstats_test_data/datasets/community.rds",
      name = "tdat", overwrite = TRUE)

# Neutral pipeline state (never assume the prior state is clean).
# clear.all = TRUE on the three per-frame setters: a bare f(NULL) clears
# only the default frame (S294).
juse(tdat)
jsubset(clear.all = TRUE); jcomplete(clear.all = TRUE); joutput(NULL)
jdummy(clear.all = TRUE)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 1 -- <what this section shows> ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# [1-3 sentence framing if the section sets up something specific.]

jfreq(Education)

# Things to look at:
#   - <the aspect of the output under judgement>
#   - <another>


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 2 -- <a behavior with a precise expectation> ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

jdesc(Income)

# Expected: <precise statement -- use this rigid form only where the
# behavior is genuinely on jstats (round trips, error paths, UDM display),
# per the light-by-default rule in the conventions file>


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 3 -- a deliberate error (wrapped so source() survives it) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

tryCatch(jload(""),
         error = function(e) cat("Caught: ", conditionMessage(e), "\n",
                                 sep = ""))

# Expected: Caught: jload(): Provide a filename, e.g. jload("mydata.sav")
# (Remember: an UNwrapped error under a plain try() prints "Error : " with
# a space -- that spacing is the wrapper, not a message defect.)


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
# block, and rename it to match the file.

cat("\n--- End of _template_walk.R ---\n")
