# =============================================================================
# import_check.R -- reading files from outside R, and saving to the formats
#                   that refuse names, asserted
# =============================================================================
# TYPE:     assertion battery (PASS/FAIL; written for Claude's checking)
# LOCKS:    ruling R9 (Jeff, S345) and ruling R20 (Jeff, S362) as built in
#           v0.9.235, with the import audit's findings (S362): jload()
#           changes a variable name R cannot read bare -- one rule for every
#           outside format, never for .rds -- keeps the old name as the
#           label and lists each change; a name R takes is never touched;
#           skip = and the title-row note; Excel's types guessed from every
#           row; a CSV file's shape checked before it is read (a short first
#           line, a long later one, semicolons, empty), its encoding; the
#           sheet = and read-error messages; the data frame's name from a
#           file's name; and jsave()'s one check of the names each format
#           refuses, clean.names = TRUE, the labels a format shortens,
#           Excel's sheet size, and the dataset name inside an .xpt file.
#           Since v0.9.236 (section R): jsave()'s CSV file starts with the
#           UTF-8 byte-order mark when it holds a character beyond ASCII,
#           and is otherwise what write.csv() writes, byte for byte.
# ORIGIN:   S362 (v0.9.235). The tenth battery. Section R added S362, the
#           second build (v0.9.236).
# FIXTURES: written by this file into a folder of R's temporary folder,
#           except one that R cannot write: datasets/import_guess_text.xlsx
#           (section G). writexl gives every cell of a column one type, and
#           the case needs NUMBER cells for 1,100 rows and then TEXT cells.
#           It was made in the S362 sandbox with Python's openpyxl:
#               wb = openpyxl.Workbook(); ws = wb.active
#               ws.title = "Sheet1"; ws.append(["id", "v"])
#               for i in range(1, 1201):
#                   ws.append([i, i if i <= 1100 else "unknown"])
#               wb.save("import_guess_text.xlsx")
#           id 1 to 1200; v the numbers 1 to 1100, then "unknown" 100
#           times. Its content is fixed; its bytes carry the time it was
#           written.
# MUTATION MAP (S362; 42 one-change mutants of the new code, this battery
#           on each): the outer strip A01 A05-A07 B01 B03 C03; the
#           underscore collapse A07; V's position A01 A06 B01 B03 C04 C05
#           F01 F04; the X before an underscore A01 B01 B03 D03 D04 Q01;
#           the length cap A01 A04 A05 D04; uniqueness ignoring case A01
#           A02 M01 M03 M04; repeats B01-B04 Q01; the label given B02 C02
#           C03 D01 D03 M04 Q01, trimmed C03; the label line B03 B06 D01
#           F01 M05; .rds renamed D05; make.names() for the frame E01 E02;
#           the title threshold F03, its skip F01-F03; the CSV title's
#           words F06-F08 H01; guess_max G01 G02; the shape check F06-F08
#           H01-H03 H05 H06 H08, the semicolon test H05 H06, quoted H10;
#           the encoding I01 I02, Latin-1 I02; sheet = J01-J03; skip = L01,
#           its warning L02; jsave()'s name check M01-M04 M06 M09, case
#           M01 M03 M04, long M02 M05; clean.names applied M04 M05; the
#           .dta labels N02, the frame labels N03, the .sav note N01;
#           Excel's size O01 O02; the .xpt dataset name P01-P03, its note
#           P03; the factor categories M08; skip = past the end H08; the
#           blank line B04; the long-line stops H02 H03 H08; the empty file
#           H07; the title line's overwrite = TRUE F09 (added at the second
#           delivery). Section R (v0.9.236; 8 more mutants, every one red):
#           the mark never R01 R04 R06, always R03 R05; the UTF-8 test
#           taken out R05; ASCII never reported R03; the mark doubled R01
#           R02 R04 R06; beyond-ASCII required of every line R01 R04 R06;
#           na = "" dropped R03; row names written R01-R03. TWO
#           SURVIVORS, read before recorded: read.csv()'s row.names
#           = NULL taken out (the shape check stops every file it guards
#           against first -- no input was found that passes the check and
#           still makes row names); read_excel() taken out of
#           read_or_stop() (excel_sheets() runs first on the same file, in
#           the same helper, and refuses every unreadable file this
#           battery can make: K01).
# FIRST WORKSTATION RUN (S362, the first delivery): 81/83. F03 -- the
#           title note's line, run as offered, met jload()'s overwrite
#           question: the workstation runs the batteries in an interactive
#           session, where the question is asked and source() answers it
#           with an empty line, and the sandbox runs them in Rscript, where
#           it is not asked. A package fix: the line now carries
#           overwrite = TRUE, since the read just made the frame (F09), and
#           the battery runs each offered call in an environment of its
#           own. I02 -- Windows's converter reads 0x81 as Windows-1252
#           (U+0081), so the Latin-1 branch is not reached there; the check
#           now expects what the platform's converter does.
# LAST VERIFIED: v0.9.236, 2026-10-17 (S362) -- 90/90 on the WORKSTATION
#           through receive_all() ("ALL BATTERIES GREEN (10 run, 2800
#           checks)"; R CMD check 0 errors, 0 warnings, 0 notes); GitHub
#           b3e9e2b (package). Jeff opened jsave()'s CSV file in Excel on
#           Windows: Muller, Cafe and Don't know as typed, accents and the
#           curly apostrophe intact (section R's case, which no battery
#           can see).
# SANDBOX:  v0.9.236, 2026-10-17 (S362, the second
#           build) -- 90/90, run_all.R 2800 across ten, plain and
#           under the RStudio-handler stand-in, each again with a
#           35-character temp path, once with interactive() TRUE, and
#           entered dirty: green, nothing changed. On the workstation:
#           v0.9.235, 84/84 (S362, second delivery).
# EARLIER:  v0.9.235 in the SANDBOX, 2026-10-17 (S362, second
#           delivery) -- 84/84, run_all.R 2794 across ten, plain and under
#           the RStudio-handler stand-in, each again with a 35-character
#           temp path, and once with interactive() TRUE and an empty answer
#           to every question (R --interactive, the driver on standard
#           input), which reproduced F03 on the first delivery; entered
#           dirty (joutput("full") with diagnostics, width 110, a juse()
#           default, a stata convention, jstats.color = TRUE, workspace
#           objects named like its working objects), plain and under the
#           stand-in: green, nothing changed. The workstation run is the
#           one that counts.
# RUN:      source()-safe from any working directory. All output is explicit
#           cat(). Also runnable via regression/run_all.R.
# CONTRACT: one printed line per check, a final "RESULT: PASS (n/n)" line,
#           and stop() if and only if any check failed.
# GUARDS:   the five of _template_check.R.
# =============================================================================

# --- Setup -------------------------------------------------------------------

stopifnot(exists("jload", mode = "function"))

.entry_names <- ls(globalenv(), all.names = TRUE)
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

.entry_message_width  <- getOption(".jst_options_message_width")
.entry_default_data   <- getOption(".jst_default_data")
.entry_output_level   <- getOption(".jst_output_level")
.entry_output_toggles <- getOption(".jst_output_toggles")
.entry_convention     <- getOption(".jst_options_missing_convention")
# The color switch (forced unset, so no escape reaches a pinned message),
# and the flag the first load narrative sets (section D loads community).
.entry_color          <- getOption("jstats.color")
.entry_notice_shown   <- getOption(".jst_missing_notice_shown")
options(jstats.color = NULL)

.pin_width <- 76L
options(.jst_options_message_width = .pin_width)

# No dataset from the test-data folder but the one Excel file R cannot
# write (section G); everything else is written below.
.ix_data <- "E:/00 R Projects/00_jstats_test_data/datasets"

invisible(utils::capture.output(suppressMessages({
  juse(NULL)
  jsubset(clear.all = TRUE); jcomplete(clear.all = TRUE); joutput(NULL)
  jdummy(clear.all = TRUE)
})))
options(.jst_options_missing_convention = NULL)

.ix_dir <- file.path(tempdir(), "import_check")
unlink(.ix_dir, recursive = TRUE)
dir.create(.ix_dir)
.ix <- function(f) file.path(.ix_dir, f)
.ix_w <- function(f, lines) writeLines(lines, .ix(f), useBytes = TRUE)
.ix_b <- function(f, bytes) writeBin(bytes, .ix(f))

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
.seen <- list()
.see  <- function(kind, cnd) {
  .seen[[length(.seen) + 1L]] <<- list(
    kind = kind, text = conditionMessage(cnd),
    width = getOption(".jst_options_message_width"))
}
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
run <- function(expr) {
  val <- NULL
  txt <- tryCatch(paste(suppressMessages(utils::capture.output(val <- expr)),
                        collapse = "\n"),
                  error = function(e) paste0("[error] ", conditionMessage(e)))
  list(val = val, txt = txt)
}

# The file's own helpers. .fl(): whitespace flattened, the fixture folder
# written <DIR>, so a message that holds a path reads the same whatever the
# folder's length (a long one is laid out over more lines, ruling R5).
.fl <- function(m) {
  m <- gsub(normalizePath(.ix_dir, winslash = "/", mustWork = FALSE), "<DIR>",
            gsub("\\", "/", m, fixed = TRUE), fixed = TRUE)
  m <- gsub(gsub("\\", "/", .ix_dir, fixed = TRUE), "<DIR>", m, fixed = TRUE)
  trimws(gsub("[ \n]+", " ", m))
}
# The calls a message offers, parsed: each indented line that opens a call
# or an assignment, joined with the indented lines under it until it parses.
.calls <- function(m) {
  ls <- strsplit(m, "\n", fixed = TRUE)[[1]]
  shape <- "^ {2,}[A-Za-z.][A-Za-z0-9._]*(\\$[A-Za-z0-9._]+)* *(\\(|<- )"
  out <- list(); i <- 1L
  while (i <= length(ls)) {
    if (grepl(shape, ls[i])) {
      j <- i
      repeat {
        e <- tryCatch(parse(text = paste(ls[i:j], collapse = "\n")),
                      error = function(e) NULL)
        if (!is.null(e) || j >= length(ls) || !grepl("^ {2,}", ls[j + 1L])) break
        j <- j + 1L
      }
      if (!is.null(e)) out[[length(out) + 1L]] <- e[[1L]]
      i <- j + 1L
    } else i <- i + 1L
  }
  out
}
# A variable's label.
.lab <- function(x) attr(x, "label", exact = TRUE)
# The note of a grab() that holds one, from "Note: <lead>" to its end.
.note <- function(m, lead) {
  k <- regexpr(paste0("Note: ", lead), m, fixed = TRUE)
  if (k < 0) return("")
  substring(m, k)
}

.LONG <- "How satisfied are you with your neighbourhood overall, all things considered"

# --- A: the cleaner ----------------------------------------------------------

check("A01 a name R cannot read bare is cleaned, one rule; a name R takes is never touched (ruling R20)",
      local({
        nm <- c("2024 score", "Age (years)", "Agree?", "Age", "Score", "Score",
                "Score", "", "if", "TRUE", "Gr\u00f6\u00dfe", "_merge", .LONG,
                "%", "id", " Score ", "age", "T")
        r <- jstats:::.jst_clean_import_names(nm)
        identical(r$names, c("X2024_score", "Age_years", "Agree", "Age", "Score",
                             "Score_2", "Score_3", "V8", "Xif", "XTRUE",
                             "Gr\u00f6\u00dfe", "X_merge",
                             "How_satisfied_are_you_with_your", "V14", "id",
                             "Score_4", "age", "T")) &&
          identical(which(r$changed), c(1L, 2L, 3L, 6L, 7L, 8L, 9L, 10L, 12L,
                                        13L, 14L, 16L))
      }))
check("A02 ... a cleaned name clear of every other, ignoring case; the name R took keeps its own",
      identical(jstats:::.jst_clean_import_names(c("Age (years)", "age_years"))$names,
                c("Age_years_2", "age_years")))
check("A03 ... names differing only in case are left as they are (they are names R takes)",
      !any(jstats:::.jst_clean_import_names(c("age", "Age", "AGE"))$changed))
check("A04 ... a long name kept to 32 characters, a repeat of it shortened to make room for _2",
      local({ r <- jstats:::.jst_clean_import_names(c(.LONG, .LONG))$names
        identical(r, c("How_satisfied_are_you_with_your",
                       "How_satisfied_are_you_with_you_2")) &&
          all(nchar(r) <= 32L) }))
check("A05 ... a long name R takes stays long (never touched); a cleaned one of accented letters keeps to 64 bytes",
      local({ ok <- strrep("\u00e9", 40); bad <- paste0(" ", strrep("\u00e9", 40))
        r <- jstats:::.jst_clean_import_names(c(ok, bad))
        identical(r$names[1], ok) && !r$changed[1] &&
          nchar(r$names[2], type = "bytes") <= 64L &&
          identical(r$names[2], strrep("\u00e9", 32)) }))
check("A06 ... reserved words, digits only, dots only, NA",
      identical(jstats:::.jst_clean_import_names(
        c("NA", "Inf", "123", "...", "..1", NA, "function"))$names,
        c("XNA", "XInf", "X123", "V4", "X1", "V6", "Xfunction")))
check("A07 ... symbols at either end dropped, a run inside one underscore",
      identical(jstats:::.jst_clean_import_names(
        c("(1) Age", "$income", "Q1 -- part (a)", "a__b c"))$names,
        c("X1_Age", "income", "Q1_part_a", "a_b_c")))
check("A08 .jst_name_valid_r(): syntactic, not reserved, not empty",
      identical(jstats:::.jst_name_valid_r(c("a", "a.b", "_a", "1a", "if", "", "T", "...", "..2")),
                c(TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE)))

# --- B: Excel names ----------------------------------------------------------

local({
  d <- data.frame(1:2, 3:4, 5:6, 7:8, 9:10, 11:12, 13:14, 15:16, 17:18, 19:20, 21:22)
  names(d) <- c("2024 score", "Age (years)", "Agree?", "Score", "Score", "",
                "if", "Gr\u00f6\u00dfe", "_merge", "%", "id")
  writexl::write_xlsx(d, .ix("names.xlsx"))
})
.mB <- grab(jload(.ix("names.xlsx"), name = ".xB", overwrite = TRUE))
check("B01 an Excel file's names: each R cannot read bare changed, the rest as they were",
      exists(".xB") && identical(names(.xB),
        c("X2024_score", "Age_years", "Agree", "Score", "Score_2", "V6", "Xif",
          "Gr\u00f6\u00dfe", "X_merge", "V10", "id")))
check("B02 ... the old name is the label of each changed variable; an empty one gives none; an unchanged one has none",
      exists(".xB") &&
        identical(.lab(.xB$X2024_score), "2024 score") &&
        identical(.lab(.xB$Age_years), "Age (years)") &&
        identical(.lab(.xB$Score_2), "Score") && is.null(.lab(.xB$V6)) &&
        is.null(.lab(.xB$Score)) && is.null(.lab(.xB$id)) &&
        is.numeric(.xB$X2024_score) && identical(.xB$id, c(21, 22)))
check("B03 ... the note, every change on its own line, the old name in quotes",
      identical(.note(.mB, "8 variable names"), paste0(
        "Note: 8 variable names were changed to valid R names:\n",
        "  \"2024 score\"   -> X2024_score\n",
        "  \"Age (years)\"  -> Age_years\n",
        "  \"Agree?\"       -> Agree\n",
        "  \"Score\"        -> Score_2\n",
        "  \"\"             -> V6\n",
        "  \"if\"           -> Xif\n",
        "  \"_merge\"       -> X_merge\n",
        "  \"%\"            -> V10\n",
        "The original names are the variables' labels.\n")))
check("B04 ... readxl's own \"New names:\" message is gone; the note follows the Loaded line, a blank line between",
      !grepl("New names", .mB, fixed = TRUE) &&
        grepl("Loaded .xB (Excel format; 2 cases, 11 variables)\n\nNote: 8 variable",
              .mB, fixed = TRUE))
check("B05 ... a file whose names R takes loads with no note",
      local({ writexl::write_xlsx(data.frame(id = 1:2, age = 3:4), .ix("clean.xlsx"))
        m <- grab(jload(.ix("clean.xlsx"), name = "k", overwrite = TRUE))
        exists("k", inherits = FALSE) && identical(names(k), c("id", "age")) &&
          !grepl("Note:", m, fixed = TRUE) }))
check("B06 ... one name changed: the note agrees in number",
      local({ d <- data.frame(1:2, 3:4); names(d) <- c("id", "Age (years)")
        writexl::write_xlsx(d, .ix("one.xlsx"))
        identical(.note(grab(jload(.ix("one.xlsx"), name = "k", overwrite = TRUE)), "1 variable"),
                  paste0("Note: 1 variable name was changed to a valid R name:\n",
                         "  \"Age (years)\"  -> Age_years\n",
                         "The original name is the variable's label.\n")) }))

# --- C: CSV names ------------------------------------------------------------

.ix_w("names.csv", c("\"2024 score\",\"Age (years)\",\"Agree?\",Score,Score,,if,Gr\u00f6\u00dfe,_merge,%,id",
                     "1,3,5,7,9,11,13,15,17,19,21", "2,4,6,8,10,12,14,16,18,20,22"))
.mC <- grab(jload(.ix("names.csv"), name = ".xC", overwrite = TRUE))
check("C01 a CSV file with the same headers gets the same names as the Excel file (no more X2024.score, Age..years.)",
      exists(".xC") && exists(".xB") && identical(names(.xC), names(.xB)))
check("C02 ... and the same labels and the same note",
      exists(".xC") && identical(.lab(.xC$Age_years), "Age (years)") &&
        identical(.note(.mC, "8 variable"), .note(.mB, "8 variable")))
check("C03 ... spaces at either end of a quoted CSV header dropped (R trims an unquoted one itself); a header that is a repeat once trimmed gets _2",
      local({ .ix_w("outer.csv", c("\"Age \",\" Score\",Score,Sex ", "1,2,3,4"))
        m <- grab(jload(.ix("outer.csv"), name = "k", overwrite = TRUE))
        identical(names(k), c("Age", "Score_2", "Score", "Sex")) &&
          identical(.lab(k$Age), "Age") && identical(.lab(k$Score_2), "Score") &&
          is.null(.lab(k$Sex)) &&
          grepl("  \"Age \"    -> Age\n  \" Score\"  -> Score_2\n", m, fixed = TRUE) }))
check("C04 ... a column R's write.csv() wrote for row names (an empty header) is V1, with no label to give",
      local({ .ix_w("rn.csv", c("\"\",\"age\",\"score\"", "\"1\",23,4", "\"2\",35,5"))
        m <- grab(jload(.ix("rn.csv"), name = "k", overwrite = TRUE))
        identical(names(k), c("V1", "age", "score")) && is.null(.lab(k$V1)) &&
          identical(.note(m, "1 variable"),
                    "Note: 1 variable name was changed to a valid R name:\n  \"\"  -> V1\n") }))
check("C05 ... a trailing comma's empty column is V4",
      local({ .ix_w("trail.csv", c("a,b,c,", "1,2,3,", "4,5,6,"))
        invisible(grab(jload(.ix("trail.csv"), name = "k", overwrite = TRUE)))
        identical(names(k), c("a", "b", "c", "V4")) }))
check("C06 ... a clean CSV file: integers stay integers, no note",
      local({ .ix_w("plain.csv", c("id,age", "1,23", "2,35"))
        m <- grab(jload(.ix("plain.csv"), name = "k", overwrite = TRUE))
        identical(k$age, c(23L, 35L)) && !grepl("Note:", m, fixed = TRUE) }))

# --- D: SPSS, Stata, SAS and R formats ---------------------------------------

check("D01 an SPSS file's names R cannot read bare (Q1@A, INC$) are changed; a label of its own is kept",
      local({ s <- data.frame(`Q1@A` = c(1, 2), `INC$` = c(3, 4), ok = c(1, 2),
                              check.names = FALSE)
        attr(s[["Q1@A"]], "label") <- "Q1 part A"
        haven::write_sav(s, .ix("names.sav"))
        m <- grab(jload(.ix("names.sav"), name = "k", overwrite = TRUE))
        identical(names(k), c("Q1_A", "INC", "ok")) &&
          identical(.lab(k$Q1_A), "Q1 part A") && identical(.lab(k$INC), "INC$") &&
          identical(.note(m, "2 variable"), paste0(
            "Note: 2 variable names were changed to valid R names:\n",
            "  \"Q1@A\"  -> Q1_A\n",
            "  \"INC$\"  -> INC\n",
            "A variable with no label of its own has its original name as its label.\n")) }))
check("D02 ... every changed variable with a label of its own: the note says they keep them",
      local({ s <- data.frame(`Q1@A` = c(1, 2), check.names = FALSE)
        attr(s[["Q1@A"]], "label") <- "Q1 part A"
        haven::write_sav(s, .ix("own.sav"))
        endsWith(grab(jload(.ix("own.sav"), name = "k", overwrite = TRUE)),
                 "The variable keeps the label it had.\n") }))
check("D03 a Stata file's _merge and TRUE: X_merge and XTRUE, the old names as labels",
      local({ haven::write_dta(data.frame(`_merge` = c(1, 2), `TRUE` = c(1, 0),
                                          check.names = FALSE), .ix("names.dta"))
        invisible(grab(jload(.ix("names.dta"), name = "k", overwrite = TRUE)))
        identical(names(k), c("X_merge", "XTRUE")) && identical(.lab(k$X_merge), "_merge") }))
check("D04 a SAS interchange file's _TYPE_: X_TYPE",
      local({ haven::write_xpt(data.frame(`_TYPE_` = c(0, 1), MEAN = c(2, 3),
                                          check.names = FALSE), .ix("names.xpt"))
        invisible(grab(jload(.ix("names.xpt"), name = "k", overwrite = TRUE)))
        identical(names(k), c("X_TYPE", "MEAN")) }))
check("D05 an .rds file comes back as it was saved: its names untouched, no note (the R9 exemption)",
      local({ r <- data.frame(`2024 score` = 1:2, `W2-W24 (binary)` = 3:4,
                              check.names = FALSE)
        saveRDS(r, .ix("own.rds"))
        m <- grab(jload(.ix("own.rds"), name = "k", overwrite = TRUE))
        identical(names(k), c("2024 score", "W2-W24 (binary)")) &&
          !grepl("variable name", m, fixed = TRUE) }))
check("D06 a package dataset is untouched, no note",
      local({ m <- grab(jload("community", name = "k", overwrite = TRUE,
                              package = TRUE))
        exists("k", inherits = FALSE) && !grepl("variable name", m, fixed = TRUE) }))

# --- E: the data frame's own name --------------------------------------------

check("E01 a data frame named from a file's name: the cleaner, not make.names() (My_Survey_final, not My.Survey..final.)",
      local({ file.copy(.ix("clean.xlsx"), .ix("My Survey (final).xlsx"))
        m <- grab(jload(.ix("My Survey (final).xlsx"), overwrite = TRUE))
        exists("My_Survey_final", inherits = FALSE) &&
          grepl("Loaded My_Survey_final (Excel format", m, fixed = TRUE) }))
check("E02 ... a file's name R takes is kept, dots and all; name = given the same cleaner",
      local({ file.copy(.ix("clean.xlsx"), .ix("my.data.xlsx"))
        invisible(grab(jload(.ix("my.data.xlsx"), overwrite = TRUE)))
        invisible(grab(jload(.ix("clean.xlsx"), name = "my data", overwrite = TRUE)))
        exists("my.data", inherits = FALSE) && exists("my_data", inherits = FALSE) }))
check("E03 ... a name starting with a digit still stops (Session 351's part (3), unchanged)",
      grepl("starts with a number", grab(jload(.ix("clean.xlsx"), name = "2wave")), fixed = TRUE))

# --- F: skip = and title rows ------------------------------------------------

local({
  t <- data.frame(x = c("Community Survey 2024", NA, "id", "1", "2"),
                  y = c(NA, NA, "age", "23", "35"),
                  z = c(NA, NA, "score", "4", "5"))
  writexl::write_xlsx(t, .ix("title.xlsx"), col_names = FALSE)
  t2 <- data.frame(x = c(NA, NA, "Survey", NA, "id", "1"),
                   y = c(NA, NA, NA, NA, "age", "2"))
  writexl::write_xlsx(t2, .ix("lead.xlsx"), col_names = FALSE)
})
.mF <- grab(jload(.ix("title.xlsx"), name = ".xF", overwrite = TRUE))
check("F01 an Excel title row: a note says so, gives the row the names are in and the skip = call",
      identical(.fl(.note(.mF, "row 1")), .fl(paste0(
        "Note: row 1 of title.xlsx has a name in only 1 of its 3 columns, so it may ",
        "be a title rather than the variable names.\n",
        "The names seem to be in row 3.\n",
        "To read from there, skip the 2 rows above them:\n",
        "  jload(\"<DIR>/title.xlsx\", name = \".xF\", overwrite = TRUE, skip = 2)\n",
        "\n",
        "Note: 3 variable names were changed to valid R names:\n",
        "  \"Community Survey 2024\"  -> Community_Survey_2024\n",
        "  \"\"                       -> V2\n",
        "  \"\"                       -> V3\n",
        "The original name is the variable's label.\n"))))
check("F02 ... the offered call runs and reads the names in row 3, over the frame the first read made",
      local({ cl <- .calls(.mF); e <- new.env()
        assign(".xF", "made by the first read", envir = e)
        length(cl) == 1L && { invisible(grab(eval(cl[[1]], e))); TRUE } &&
          identical(names(e$.xF), c("id", "age", "score")) && nrow(e$.xF) == 2L }))
check("F03 ... leading empty rows: the rows counted as the sheet has them (title in row 3, names in row 5, skip = 4)",
      local({ m <- grab(jload(.ix("lead.xlsx"), name = "k", overwrite = TRUE))
        grepl("Note: row 3 of lead.xlsx has a name in only 1 of its 2 columns", .fl(m), fixed = TRUE) &&
          grepl("skip the 4 rows above them", .fl(m), fixed = TRUE) &&
          { e <- new.env(); assign("k", k, envir = e)
            invisible(grab(eval(.calls(m)[[1]], e))); identical(names(e$k), c("id", "age")) } }))
check("F04 ... one unnamed column is not a title: no title note, only the name note",
      local({ d <- data.frame(1:2, 3:4, 5:6); names(d) <- c("id", "", "score")
        writexl::write_xlsx(d, .ix("gap.xlsx"))
        m <- grab(jload(.ix("gap.xlsx"), name = "k", overwrite = TRUE))
        !grepl("may be a title", m, fixed = TRUE) && grepl("->  ?V2|-> V2", m) }))
check("F05 ... skip = given right: no title note, the names read",
      local({ m <- grab(jload(.ix("title.xlsx"), name = "k", skip = 2, overwrite = TRUE))
        !grepl("Note:", m, fixed = TRUE) && identical(names(k), c("id", "age", "score")) }))
.ix_w("title1.csv", c("Community Survey 2024", "", "id,age,score", "1,23,4", "2,35,5", "3,41,3"))
.ix_w("title2.csv", c("Survey results, 2024", "id,age,score", "1,23,4", "2,35,5"))
.mF6 <- grab(jload(.ix("title1.csv"), name = ".xF6", overwrite = TRUE))
check("F06 a CSV file with a title line stops (it had stopped on R's \"more columns than column names\"): the line the names are on, the skip = call",
      identical(.fl(.mF6), .fl(paste0(
        "jload(): the first line of title1.csv holds 1 value, but most lines below ",
        "it hold 3.\n",
        "The variable names seem to be on line 3.\n",
        "To read from there, skip the 2 lines above them:\n",
        "  jload(\"<DIR>/title1.csv\", name = \".xF6\", overwrite = TRUE, skip = 2)"))) &&
        !exists(".xF6"))
check("F07 ... the offered call runs and reads three cases",
      local({ e <- new.env(); invisible(grab(eval(.calls(.mF6)[[1]], e)))
        identical(names(e$.xF6), c("id", "age", "score")) &&
          identical(e$.xF6$score, c(4L, 5L, 3L)) }))
check("F08 ... a title holding a comma (which loaded with the title as names and the names as a case, no word) stops the same way",
      local({ m <- grab(jload(.ix("title2.csv"), name = "k", overwrite = TRUE))
        grepl("the first line of title2.csv holds 2 values, but most lines below it hold 3.", .fl(m), fixed = TRUE) &&
          grepl("skip the 1 line above them", .fl(m), fixed = TRUE) &&
          !exists("k", inherits = FALSE) }))

check("F09 ... the title note's line carries overwrite = TRUE when the call gave none (the read just made the frame, and the line must run in a script); a CSV stop's line does not (nothing was made)",
      local({ m1 <- .fl(grab(jload(.ix("title.xlsx"), name = "t9")))
        m2 <- .fl(grab(jload(.ix("title1.csv"), name = "t9c")))
        grepl("jload(\"<DIR>/title.xlsx\", name = \"t9\", overwrite = TRUE, skip = 2)", m1, fixed = TRUE) &&
          grepl("jload(\"<DIR>/title1.csv\", name = \"t9c\", skip = 2)", m2, fixed = TRUE) }))

# --- G: Excel types read from every row --------------------------------------

check("G01 a column empty for 1,100 rows and then numbers: the numbers (readxl had made all 100 TRUE, without a word)",
      local({ writexl::write_xlsx(data.frame(id = 1:1200, w = c(rep(NA, 1100), 1101:1200)),
                                  .ix("guess.xlsx"))
        m <- grab(jload(.ix("guess.xlsx"), name = "k", overwrite = TRUE))
        is.numeric(k$w) && identical(k$w[1101:1200], as.numeric(1101:1200)) &&
          !grepl("Expecting", m, fixed = TRUE) }))
check("G02 numbers for 1,100 rows and then words: text, every word kept (readxl had made them missing, with 100 warnings)",
      local({ f <- file.path(.ix_data, "import_guess_text.xlsx")
        m <- grab(jload(f, name = "k", overwrite = TRUE))
        exists("k", inherits = FALSE) && is.character(k$v) &&
          sum(k$v == "unknown") == 100L && identical(k$v[1100], "1100") &&
          !grepl("Expecting", m, fixed = TRUE) }))

# --- H: a CSV file's shape, checked before it is read ------------------------

.ix_w("short.csv", c("age,score", "1,23,4", "2,35,5", "3,41,3"))
.ix_w("ragged.csv", c("a,b,c", "1,2,3", "4,5,6", "7,8,9", "10,11,12", "13,14,15",
                      "16,17,18,19,20", "21,22,23"))
check("H01 a first line with fewer names than the lines have values stops (the first values had silently become row names)",
      identical(.fl(grab(jload(.ix("short.csv"), name = ".hk", overwrite = TRUE))), .fl(paste0(
        "jload(): the first line of short.csv has 2 names, but most lines below it ",
        "hold 3 values.\n",
        "Add the missing name to the first line of the file, then run jload() again."))))
check("H02 a line longer than the first stops, naming it (R had split it into two cases)",
      identical(.fl(grab(jload(.ix("ragged.csv"), name = ".hk", overwrite = TRUE))), .fl(paste0(
        "jload(): line 7 of ragged.csv holds 5 values, but the first line has 3 ",
        "names, so R would split it into two cases.\n",
        "Correct that line of the file, then run jload() again."))))
check("H03 ... several long lines: listed, the count past five",
      local({ .ix_w("ragged2.csv", c("a,b", paste0(1:20, ",", 1:20,
                                                   ifelse(1:20 %% 2 == 0 & 1:20 <= 14, ",9", ""))))
        m <- .fl(grab(jload(.ix("ragged2.csv"), name = "k")))
        grepl("lines 3, 5, 7, 9, 11 and 2 more of ragged2.csv hold more values than the first line has names (2), so R would split each into two cases.", m, fixed = TRUE) &&
          grepl("Correct those lines of the file", m, fixed = TRUE) }))
check("H04 ... lines with fewer values than the first are read as before, their last cells empty",
      local({ .ix_w("fewer.csv", c("a,b,c", "1,2,3", "4,5", "6"))
        invisible(grab(jload(.ix("fewer.csv"), name = "k", overwrite = TRUE)))
        nrow(k) == 3L && identical(k$c, c(3L, NA, NA)) }))
.ix_w("semi.csv", c("id;age;score", "1;23;4,5", "2;35;5,25", "3;41;3,0"))
.mH5 <- grab(jload(.ix("semi.csv"), name = ".xH5"))
check("H05 a semicolon file (European Excel) stops (it had loaded as one variable holding the decimals): the base R line that reads it",
      identical(.fl(.mH5), .fl(paste0(
        "jload(): semi.csv separates its values with semicolons, as Excel does in ",
        "many European settings.\n",
        "jload() reads files whose values are separated by commas.\n",
        "Save it from Excel as an .xlsx file and load that, or read it with base R:\n",
        "  .xH5 <- read.csv2(\"<DIR>/semi.csv\")"))))
check("H06 ... the offered line runs: three variables, the decimal comma read",
      local({ cl <- .calls(.mH5); e <- new.env()
        length(cl) == 1L && { eval(cl[[1]], e); TRUE } &&
          identical(names(e$.xH5), c("id", "age", "score")) &&
          identical(e$.xH5$score, c(4.5, 5.25, 3)) }))
check("H07 an empty file: said in jstats's words (it had been R's \"no lines available in input\")",
      local({ .ix_b("empty.csv", raw(0))
        identical(grab(jload(.ix("empty.csv"), name = "k")),
                  "jload(): empty.csv is empty: it holds no lines.") }))
check("H08 skip = past the last line",
      identical(grab(jload(.ix("plain.csv"), name = ".hk", skip = 10, overwrite = TRUE)),
                "jload(): skip = 10 skips every line of plain.csv."))
check("H09 a quoted value holding a comma or a line break is one value: no stop",
      local({ .ix_b("quoted.csv", charToRaw("id,comment\r\n1,\"line one\r\nline two\"\r\n2,\"a, b\"\r\n"))
        invisible(grab(jload(.ix("quoted.csv"), name = "k", overwrite = TRUE)))
        nrow(k) == 2L && identical(k$comment[2], "a, b") }))

check("H10 a semicolon inside a quoted name is not a separator: no semicolon stop",
      local({ .ix_w("qsemi.csv", c("\"x;y;z\",c", "1,2", "3,4"))
        invisible(grab(jload(.ix("qsemi.csv"), name = "k", overwrite = TRUE)))
        identical(names(k), c("x_y_z", "c")) }))
check("H11 a one-column file below a title: skip = reaches the names, its empty lines still cases",
      local({ .ix_w("one.csv", c("Title", "", "notes", "a", "", "b"))
        invisible(grab(jload(.ix("one.csv"), name = "k", skip = 2, overwrite = TRUE)))
        identical(k$notes, c("a", "", "b")) }))

# --- I: a CSV file's encoding ------------------------------------------------

check("I01 a Windows-1252 file (Excel's \"CSV (Comma delimited)\" on Windows) is read, and said to be (it had stopped on \"invalid multibyte string\")",
      local({ .ix_b("w1252.csv", iconv("id,Caf\u00e9,answer\n1,4,Don\u2019t know\n2,5,M\u00fcller \u2013 yes\n",
                                      "UTF-8", "CP1252", toRaw = TRUE)[[1]])
        m <- grab(jload(.ix("w1252.csv"), name = "k", overwrite = TRUE))
        identical(names(k), c("id", "Caf\u00e9", "answer")) &&
          identical(k$answer, c("Don\u2019t know", "M\u00fcller \u2013 yes")) &&
          identical(.fl(.note(m, "w1252")), .fl(paste0(
            "Note: w1252.csv is not in UTF-8, the encoding R reads, so it was read as ",
            "Windows-1252, the encoding Excel on Windows saves a CSV file in.\n",
            "Check its accented letters and symbols."))) }))
check("I02 ... a byte this platform's Windows-1252 cannot read: Latin-1, which reads every byte (Windows's own converter reads 0x81 as Windows-1252, so there the note says Windows-1252)",
      local({ .ix_b("latin.csv", c(charToRaw("a\n"), as.raw(0x81), charToRaw("x\n")))
        m <- grab(jload(.ix("latin.csv"), name = "k", overwrite = TRUE))
        want <- if (is.na(iconv(list(as.raw(0x81)), "CP1252", "UTF-8"))) {
          "so it was read as Latin-1."
        } else "so it was read as Windows-1252,"
        exists("k", inherits = FALSE) && identical(k$a, "\u0081x") &&
          grepl(want, .fl(m), fixed = TRUE) }))
check("I03 ... a UTF-8 file, with or without the mark Excel's \"CSV UTF-8\" writes: read as it is, no note",
      local({ .ix_b("bom.csv", c(as.raw(c(0xef, 0xbb, 0xbf)), charToRaw("id,name\n1,"),
                                 charToRaw(enc2utf8("M\u00fcller\n"))))
        m <- grab(jload(.ix("bom.csv"), name = "k", overwrite = TRUE))
        identical(names(k), c("id", "name")) && identical(k$name, "M\u00fcller") &&
          !grepl("Note:", m, fixed = TRUE) }))

# --- J: sheet = ---------------------------------------------------------------

check("J01 sheet = naming no sheet: the file's only sheet and the call (it had been readxl's \"Sheet 'Nope' not found\")",
      local({ m <- grab(jload(.ix("clean.xlsx"), name = "k", sheet = "Nope"))
        identical(.fl(m), .fl(paste0(
          "jload(): clean.xlsx has no sheet named \"Nope\".\n",
          "Its only sheet is \"Sheet1\":\n",
          "  jload(\"<DIR>/clean.xlsx\", name = \"k\", sheet = \"Sheet1\")"))) &&
          { e <- new.env(); invisible(grab(eval(.calls(m)[[1]], e))); exists("k", envir = e) } }))
check("J02 ... a number past the last sheet",
      grepl("clean.xlsx has 1 sheet, so there is no sheet 3.",
            .fl(grab(jload(.ix("clean.xlsx"), sheet = 3))), fixed = TRUE))
check("J03 ... a file of several sheets: all named, the first offered",
      local({ writexl::write_xlsx(list(A = data.frame(x = 1), B = data.frame(y = 2)), .ix("two.xlsx"))
        m <- .fl(grab(jload(.ix("two.xlsx"), sheet = "C")))
        grepl("Its sheets are \"A\" and \"B\". To read one, name it: jload(\"<DIR>/two.xlsx\", sheet = \"A\")", m, fixed = TRUE) }))
check("J04 ... the note on a file of several sheets is as it was",
      grepl("This file has 2 sheets: A, B", grab(jload(.ix("two.xlsx"), name = ".hk", overwrite = TRUE)),
            fixed = TRUE))

# --- K: a reader's own error, relayed ----------------------------------------

check("K01 a file its reader cannot read: jstats's sentence, then R's message under \"R reported:\" (Rule AH)",
      local({ .ix_w("bad.xlsx", "this is not a workbook")
        m <- grab(jload(.ix("bad.xlsx"), name = "k"))
        startsWith(m, "jload(): bad.xlsx could not be read.\nR reported:\n  ") }))
check("K02 ... the same for an SPSS file",
      local({ .ix_w("bad.sav", "this is not an SPSS file")
        startsWith(grab(jload(.ix("bad.sav"), name = "k")),
                   "jload(): bad.sav could not be read.\nR reported:\n  ") }))

# --- L: skip = itself --------------------------------------------------------

check("L01 skip = must be a whole number, 0 or more",
      all(vapply(list(-1, 1.5, "2", NA, c(1, 2)), function(v)
        identical(.fl(grab(jload(.ix("plain.csv"), name = ".hk", skip = v))), paste0(
          "jload(): `skip` must be a whole number, 0 or more: the number of rows ",
          "above the variable names.")), logical(1))))
check("L02 ... on a format it does not apply to: a warning, and the file is loaded",
      local({ m <- grab(jload(.ix("names.sav"), name = "k", skip = 2, overwrite = TRUE))
        grepl("`skip` is only used for Excel format (.xlsx, .xls) and CSV format (.csv). Ignoring it for this .sav file.",
              .fl(m), fixed = TRUE) && exists("k", inherits = FALSE) }))

# --- M: jsave() and the names each format refuses ----------------------------

.dM <- data.frame(age = 1:3, Age = 4:6, long = 7:9, BY = 1:3, total.score = 1:3,
                  check.names = FALSE)
.dM0 <- .dM
check("M01 .sav: every refused name at once -- the later of two that differ only in case, a word SPSS reserves -- with what each becomes and why",
      identical(.fl(grab(jsave(.dM, .ix("m.sav")))), .fl(paste0(
        "jsave(): 2 variable names in the .dM data frame cannot be used in SPSS\n",
        "format (.sav):\n",
        "  \"Age\"  -> Age_2  (SPSS reads it as age)\n",
        "  \"BY\"   -> XBY    (a word SPSS reserves)\n",
        "To save the file with these names (the .dM data frame keeps its own):\n",
        "  jsave(.dM, \"<DIR>/m.sav\", clean.names = TRUE)"))) &&
        !file.exists(.ix("m.sav")))
check("M02 .dta: a word Stata reserves and a dot (haven and ReadStat had named one at a time)",
      identical(.fl(grab(jsave(.dM, .ix("m.dta")))), .fl(paste0(
        "jsave(): 2 variable names in the .dM data frame cannot be used in Stata\n",
        "format (.dta):\n",
        "  \"long\"         -> Xlong        (a word Stata reserves)\n",
        "  \"total.score\"  -> total_score  (holds a character Stata does not take)\n",
        "To save the file with these names (the .dM data frame keeps its own):\n",
        "  jsave(.dM, \"<DIR>/m.dta\", clean.names = TRUE)"))))
check("M03 .xpt: case and a dot (haven had written age and Age, which SAS reads as one name)",
      identical(.fl(grab(jsave(.dM, .ix("m.xpt")))), .fl(paste0(
        "jsave(): 2 variable names in the .dM data frame cannot be used in SAS\n",
        "interchange format (.xpt):\n",
        "  \"Age\"          -> Age_2        (SAS reads it as age)\n",
        "  \"total.score\"  -> total_score  (holds a character SAS does not take)\n",
        "To save the file with these names (the .dM data frame keeps its own):\n",
        "  jsave(.dM, \"<DIR>/m.xpt\", clean.names = TRUE)"))))
check("M04 ... the offered line runs: the file holds the new names, each old name its label there; the data frame unchanged",
      local({ m <- grab(jsave(.dM, .ix("m.sav")))
        invisible(grab(eval(.calls(m)[[1]])))
        r <- haven::read_sav(.ix("m.sav"))
        identical(names(r), c("age", "Age_2", "long", "XBY", "total.score")) &&
          identical(.lab(r$Age_2), "Age") && identical(.dM, .dM0) }))
check("M05 ... the note after clean.names = TRUE",
      local({ m <- grab(jsave(.dM, .ix("m.dta"), clean.names = TRUE))
        startsWith(.fl(.note(m, "2 variable")), .fl(paste0(
          "Note: 2 variable names were changed in the file to names Stata format (.dta) ",
          "takes; the .dM data frame keeps its own:\n",
          "  \"long\"         -> Xlong\n",
          "  \"total.score\"  -> total_score\n",
          "The original names are the variables' labels in the file.\nSaved .dM to"))) &&
          grepl("\n  \"long\"         -> Xlong\n  \"total.score\"  -> total_score\n", m, fixed = TRUE) }))
check("M06 ... the Excel names (2024 score, Age (years), a 77-character question) refused by all three, every one listed",
      local({ d <- data.frame(1:2, 3:4, 5:6); names(d) <- c("2024 score", "Age (years)", .LONG)
        ms <- vapply(c("sav", "dta", "xpt"), function(e) .fl(grab(jsave(d, .ix(paste0("x.", e))))), "")
        all(grepl("3 variable names in the d data frame cannot be used in", ms, fixed = TRUE)) &&
          all(grepl("\"2024 score\" -> X2024_score (does not start with a letter", ms, fixed = TRUE)) &&
          grepl("(longer than 64 bytes)", ms[["sav"]], fixed = TRUE) &&
          grepl("(longer than 32 characters)", ms[["dta"]], fixed = TRUE) }))
check("M07 ... clean.names = TRUE where every name is fine: no note; Excel, CSV and R format take any name",
      local({ ok <- data.frame(a = 1:2)
        m1 <- grab(jsave(ok, .ix("ok.dta"), clean.names = TRUE))
        d <- data.frame(1:2, 3:4); names(d) <- c("2024 score", "Age (years)")
        m2 <- grab(jsave(d, .ix("any.xlsx"))); m3 <- grab(jsave(d, .ix("any.csv")))
        m4 <- grab(jsave(d, .ix("any.rds")))
        !grepl("Note:", m1, fixed = TRUE) && file.exists(.ix("any.xlsx")) &&
          file.exists(.ix("any.csv")) && file.exists(.ix("any.rds")) &&
          !grepl("cannot be used", paste(m2, m3, m4), fixed = TRUE) }))
check("M08 a factor with a category over 120 characters (.sav): stops in jstats's words, the line that keeps it as text runs",
      local({ f <- data.frame(g = factor(c(strrep("a", 130), "b")))
        m <- grab(jsave(f, .ix("f.sav")))
        identical(.fl(m), .fl(paste0(
          "jsave(): g has a category longer than 120 characters, which SPSS format\n",
          "(.sav) cannot store as a value label.\n",
          "Save it as text, which SPSS keeps whole:\n",
          "  f$g <- as.character(f$g)"))) &&
          { eval(.calls(m)[[1]]); !grepl("jsave():", grab(jsave(f, .ix("f.sav"))), fixed = TRUE) } &&
          identical(haven::read_sav(.ix("f.sav"))$g[1], strrep("a", 130)) }))
check("M09 ... a refused name beside a missing-value refusal: one message, both numbered",
      local({ d <- data.frame(BY = 1:2, x = haven::labelled(c(1, haven::tagged_na("a")),
                                                            labels = c(Yes = 1)))
        m <- .fl(grab(jsave(d, .ix("both.sav"))))
        grepl("cannot be saved to SPSS format (.sav) yet -- 2 things to fix", m, fixed = TRUE) &&
          grepl("[1] 1 variable name in the d data frame cannot be used", m, fixed = TRUE) }))

# --- N: labels a format shortens ---------------------------------------------

.labN <- paste(rep("How satisfied are you with the services you received?", 6), collapse = " ")
check("N01 .sav: a variable label past 256 bytes and a value label past 120, said, the data frame keeping them",
      local({ L <- data.frame(q1 = c(1, 2)); attr(L$q1, "label") <- .labN
        L$q2 <- haven::labelled(c(1, 2), labels = setNames(c(1, 2), c(strrep("v", 130), "No")))
        m <- grab(jsave(L, .ix("L.sav")))
        r <- haven::read_sav(.ix("L.sav"))
        startsWith(.fl(.note(m, "SPSS format")), .fl(paste0(
          "Note: SPSS format (.sav) keeps 256 bytes of a variable label and 120 of a value ",
          "label (fewer letters when they are accented).\n",
          "Shortened in the file: the variable label of q1 and value labels of q2.\n",
          "The L data frame keeps them whole.\nSaved L to"))) &&
          nchar(.lab(r$q1), type = "bytes") <= 256L &&
          nchar(names(attr(r$q2, "labels"))[1], type = "bytes") <= 120L &&
          identical(.lab(L$q1), .labN) }))
check("N02 .dta: a label of accented letters shortened to 80 characters between characters (ReadStat had cut one in half)",
      local({ L <- data.frame(q1 = c(1, 2)); attr(L$q1, "label") <- strrep("\u00e9", 300)
        m <- grab(jsave(L, .ix("L.dta")))
        r <- haven::read_dta(.ix("L.dta"))
        validUTF8(.lab(r$q1)) && nchar(.lab(r$q1)) == 80L &&
          grepl("Note: Stata format (.dta) keeps 80 characters of a variable label and of the data frame's label.",
                .fl(m), fixed = TRUE) }))
check("N03 a data frame's own label: .xpt keeps 40 characters, .dta 80 (haven had refused the save)",
      local({ L <- data.frame(q1 = c(1, 2)); attr(L, "label") <- strrep("L", 90)
        m1 <- grab(jsave(L, .ix("F.xpt"))); m2 <- grab(jsave(L, .ix("F.dta")))
        file.exists(.ix("F.xpt")) && file.exists(.ix("F.dta")) &&
          nchar(attr(haven::read_xpt(.ix("F.xpt")), "label")) == 40L &&
          grepl("Shortened in the file: the data frame's own label.", .fl(m1), fixed = TRUE) &&
          grepl("Shortened in the file: the data frame's own label.", .fl(m2), fixed = TRUE) }))
check("N04 ... short labels: no note",
      local({ L <- data.frame(q1 = c(1, 2)); attr(L$q1, "label") <- "Satisfied?"
        !grepl("Note:", grab(jsave(L, .ix("S.sav"))), fixed = TRUE) }))

# --- O: Excel's sheet size ---------------------------------------------------

check("O01 more cases than a sheet holds: stopped before writing (writexl had stopped in its words, or libxlsxwriter's at the limit itself)",
      local({ big <- data.frame(id = seq_len(1048576L))
        m <- grab(jsave(big, .ix("big.xlsx")))
        identical(.fl(m), .fl(paste0(
          "jsave(): the big data frame has 1,048,576 cases, and Excel format (.xlsx)\n",
          "holds at most 1,048,575.\n",
          "A sheet has 1,048,576 rows, one of them for the variable names.\n",
          "Save it in another format, for example:\n",
          "  jsave(big, \"<DIR>/big.rds\")\n",
          "  jsave(big, \"<DIR>/big.csv\")"))) && !file.exists(.ix("big.xlsx")) }))
check("O02 ... more variables than a sheet holds; 16,384 save",
      local({ wide <- as.data.frame(matrix(1L, 1, 16385))
        m <- .fl(grab(jsave(wide, .ix("wide.xlsx"))))
        ok <- wide[, 1:16384]
        grepl("the wide data frame has 16,385 variables, and Excel format (.xlsx) holds at most 16,384.", m, fixed = TRUE) &&
          !grepl("jsave():", grab(jsave(ok, .ix("ok.xlsx"))), fixed = TRUE) }))

# --- P: the dataset inside an .xpt file --------------------------------------

.xpt_member <- function(f) {
  b <- readBin(f, "raw", file.size(f))
  s <- rawToChar(b[b != as.raw(0)])
  k <- regexpr("DSCPTV8", s, fixed = TRUE)
  trimws(substr(s, k + 68L, k + 68L + 31L))
}
check("P01 the dataset inside an .xpt file is named after the file asked for (it had been jsave_<name>_<hex>)",
      local({ invisible(grab(jsave(data.frame(x = 1:2), .ix("survey.xpt"))))
        identical(.xpt_member(.ix("survey.xpt")), "survey") }))
check("P02 ... a long file name saves (it had stopped: \"`name` must be 32 characters or fewer\")",
      local({ m <- grab(jsave(data.frame(x = 1:2), .ix("community_wave_two_followup.xpt")))
        file.exists(.ix("community_wave_two_followup.xpt")) &&
          identical(.xpt_member(.ix("community_wave_two_followup.xpt")), "community_wave_two_followup") &&
          !grepl("Note:", m, fixed = TRUE) }))
check("P03 ... a file name that is not a SAS name: the dataset's name said",
      local({ m <- grab(jsave(data.frame(x = 1:2), .ix("my data.xpt")))
        identical(.xpt_member(.ix("my data.xpt")), "my_data") &&
          startsWith(.fl(.note(m, "inside")), .fl(paste0(
            "Note: inside my data.xpt the dataset is named my_data.\n",
            "A SAS dataset name holds only the letters A to Z, digits and underscores, up to ",
            "32 characters.\nSaved"))) }))

# --- Q: round trips ----------------------------------------------------------

check("Q01 an Excel file's names, loaded, saved to .sav and loaded again: the same names, the old names still the labels",
      local({ invisible(grab(jload(.ix("names.xlsx"), name = "k", overwrite = TRUE)))
        invisible(grab(jsave(k, .ix("rt.sav"))))
        m <- grab(jload(.ix("rt.sav"), name = "k2", overwrite = TRUE))
        identical(names(k2), names(k)) && identical(.lab(k2$Age_years), "Age (years)") &&
          !grepl("variable name", m, fixed = TRUE) }))

# --- R: a CSV file Excel opens as written (v0.9.236) -------------------------

# Excel on Windows reads a CSV file that does not start with the UTF-8
# byte-order mark in Windows-1252, so jsave()'s UTF-8 file opened there with
# every accented letter as two other characters (Jeff's check, S362). Each
# frame below is built inside its check, so a dirty entry cannot reach it.
.R_acc <- c("M\u00fcller", "Caf\u00e9", "Don\u2019t know \u2013 yes")
.R_bom <- as.raw(c(0xef, 0xbb, 0xbf))
.R_bytes <- function(f) readBin(f, "raw", file.size(f))

check("R01 a CSV file holding accented letters, a curly apostrophe and a dash: the UTF-8 byte-order mark first, as Excel's \"CSV UTF-8\" writes it, then exactly what write.csv() writes, and no note",
      local({ d <- data.frame(id = 1:3, name = .R_acc)
        m <- grab(jsave(d, .ix("acc.csv")))
        utils::write.csv(d, .ix("acc_w.csv"), row.names = FALSE, na = "")
        identical(.R_bytes(.ix("acc.csv")), c(.R_bom, .R_bytes(.ix("acc_w.csv")))) &&
          !grepl("Note:", m, fixed = TRUE) }))
check("R02 ... read back by jload(): the names and the text as saved, and no note (the mark is read as the start of a UTF-8 file)",
      local({ d <- data.frame(id = 1:3, name = .R_acc)
        invisible(grab(jsave(d, .ix("acc_rt.csv"))))
        m <- grab(jload(.ix("acc_rt.csv"), name = "k", overwrite = TRUE))
        identical(names(k), c("id", "name")) && identical(k$name, .R_acc) &&
          identical(k$id, 1:3) && !grepl("Note:", m, fixed = TRUE) }))
check("R03 ... a CSV file of plain ASCII has no mark: byte for byte what write.csv() writes, as before",
      local({ d <- data.frame(id = 1:3, name = c("a", "b c", ""), x = c(1.5, NA, 3))
        invisible(grab(jsave(d, .ix("ascii.csv"))))
        utils::write.csv(d, .ix("ascii_w.csv"), row.names = FALSE, na = "")
        identical(.R_bytes(.ix("ascii.csv")), .R_bytes(.ix("ascii_w.csv"))) }))
check("R04 ... a character beyond ASCII in a name, or in a factor's labels, is enough for the mark; a file of one text column with blank cells keeps all its cases on the way back",
      local({ d1 <- data.frame(x = 1:2); names(d1) <- "Gr\u00f6\u00dfe"
        d2 <- data.frame(f = factor(c("\u00e9t\u00e9", "hiver")))
        d3 <- data.frame(name = c(.R_acc[1], "", .R_acc[2], ""))
        for (i in 1:3) invisible(grab(jsave(get(paste0("d", i)), .ix(paste0("one", i, ".csv")))))
        marked <- vapply(1:3, function(i) identical(
          .R_bytes(.ix(paste0("one", i, ".csv")))[1:3], .R_bom), logical(1))
        invisible(grab(jload(.ix("one3.csv"), name = "k", overwrite = TRUE)))
        all(marked) && identical(k$name, c(.R_acc[1], "", .R_acc[2], "")) }))
check("R05 ... text that is not UTF-8 (bytes read in another encoding and never converted) gets no mark, which would misdescribe it",
      local({ d <- data.frame(s = c("plain", rawToChar(as.raw(c(0x63, 0x61, 0x66, 0xe9)))))
        invisible(grab(jsave(d, .ix("notutf8.csv"))))
        b <- .R_bytes(.ix("notutf8.csv"))
        !identical(b[1:3], .R_bom) && any(b == as.raw(0xe9)) }))
check("R06 ... writing the mark leaves nothing else in the folder, and overwrite = TRUE replaces a marked file with a marked one",
      local({ sub <- .ix("R06"); dir.create(sub)
        d <- data.frame(name = .R_acc)
        invisible(grab(jsave(d, file.path(sub, "only.csv"))))
        invisible(grab(jsave(d, file.path(sub, "only.csv"), overwrite = TRUE)))
        b <- .R_bytes(file.path(sub, "only.csv"))
        identical(list.files(sub, all.files = TRUE, no.. = TRUE), "only.csv") &&
          identical(b[1:3], .R_bom) && !identical(b[4:6], .R_bom) }))

# --- The message surface, swept (guard 4) ------------------------------------

.sw <- Filter(function(s) identical(as.numeric(s$width), as.numeric(.pin_width)),
              .seen)
.sw <- .sw[!duplicated(vapply(.sw, function(s) paste(s$kind, s$text), ""))]
.ln <- unlist(lapply(.sw, function(s) strsplit(s$text, "\n", fixed = TRUE)[[1]]))
.ln <- .ln[nzchar(trimws(.ln)) & !grepl("^\\s{2}", .ln)]
# A file path on a line of its own (jsave()'s Saved line puts it there,
# S230) cannot be broken; this file saves to a folder of R's temporary
# folder, which on Windows is long, so the path lines are left out, as
# Z02 leaves them out.
.ln <- .ln[!grepl("^([A-Za-z]:[\\\\/]|/|~|\\\\\\\\)", .ln)]
check(paste0("Z01 no prose line of a message exceeds ", .pin_width,
             " columns (", length(.sw), " conditions)"),
      length(.sw) >= 40L && !any(nchar(.ln) > .pin_width))
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
    if (grepl("^([A-Za-z]:[\\\\/]|/|~|\\\\\\\\)", b)) next
    if (grepl("[.!?:][)\"']?$", b)) next
    budget <- width - if (i == 1L) first_line_slack else 0L
    if (nchar(a) + 1L + nchar(unit(b)) <= budget)
      out <- c(out, sprintf("[%d] %s | %s", i, a, unit(b)))
  }
  out
}
.pb <- unlist(lapply(.sw, function(s) {
  pbreaks(s$text, .pin_width, switch(s$kind, error = 8L, warning = 9L, 0L))
}))
check("Z02 no premature break: a line's first unit never fit on the line above",
      length(.sw) >= 1L && length(.pb) == 0L)
if (length(.pb) > 0L) for (l in .pb) cat("        early: ", l, "\n")
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
.ub <- unlist(lapply(.up, function(u) u$bad))
check("Z03 every runnable line in a message parses",
      sum(vapply(.up, function(u) u$n, 0L)) >= 10L && length(.ub) == 0L)
if (length(.ub) > 0L) for (l in .ub) cat("        does not parse: ", l, "\n")

# --- Restore session state ---------------------------------------------------

options(.jst_options_message_width = .entry_message_width)
options(.jst_default_data          = .entry_default_data)
options(.jst_output_level          = .entry_output_level)
options(.jst_output_toggles = .entry_output_toggles)
options(.jst_options_missing_convention = .entry_convention)
options(jstats.color = .entry_color)
options(.jst_missing_notice_shown = .entry_notice_shown)
unlink(.ix_dir, recursive = TRUE)

# --- Verdict -----------------------------------------------------------------

.n_ok <- sum(vapply(.results, `[[`, logical(1), "ok"))
.n    <- length(.results)
if (.n_ok == .n) {
  cat("\nRESULT: PASS (", .n_ok, "/", .n, ")\n", sep = "")
  .ws_restore()
  rm(list = setdiff(ls(globalenv(), all.names = TRUE),
                    c(.entry_names, ".results")), envir = globalenv())
} else {
  cat("\nRESULT: FAIL (", .n_ok, "/", .n, " passed)\n", sep = "")
  for (.r in .results) if (!.r$ok) cat("  failed: ", .r$desc, "\n", sep = "")
  .ws_restore()
  stop("assertion battery failed", call. = FALSE)
}
