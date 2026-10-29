# =============================================================================
# tables_check.R -- the table layer: what a result carries, and jtable()
# =============================================================================
# TYPE:     assertion battery (PASS/FAIL; written for Claude's checking)
# LOCKS:    (A-H) the fields Capability Slate T's table builders read from
#           the analysis results, and the two internal accessors that read
#           them (.jst_apa_terms(), .jst_apa_model()). Build 0 (S399,
#           v0.9.269): the code and the label beside every display string
#           (jfreq()'s Valid and Missing rows, jt()'s and jaov()'s Group,
#           jcrosstab()'s row and column categories, jaov()'s post-hoc
#           pairs); the statistics kept unrounded where the printed frame
#           is rounded (jt(), jaov(), jalpha(); jcorr()'s M and SD);
#           jdesc(by =)'s descriptives_raw; the jstats_version stamp on
#           every result; an accessor method for every result class,
#           registered.
#           (I-M) build 1 (S400, v0.9.270): the table layer's number
#           formats and the built-in apa style; the descriptives table's
#           structure from jdesc() results (headings =, markers =, the
#           list form, the front door's stops); the console preview, pinned
#           whole; the Word file (the five parts, the XML pinned by its
#           checksum and read for its caption row, header, rules, decimal
#           tabs, marks and note row; the paragraph placements, a report
#           style's fills and grid, landscape auto, the minus sign; the
#           overwrite gate; a built table given back); and the output.dir
#           setting.
#           (N-T) build 2 (S401, v0.9.271): style files -- the reader, the
#           folders searched, based.on, every stop and the note on a newer
#           file's settings; jstyle()'s list, printout and save.as; the
#           frequency table from jfreq() results (the cells computed here
#           from the data, the preview pinned whole, the Word file pinned by
#           its checksum); the style and style.dir settings; a style's
#           settings given in the call; open =; a bare file name written
#           where it was asked to be. Later Slate T builds add their
#           sections here.
# ORIGIN:   S399 (v0.9.269; Capability Slate T, build 0)
# LAST VERIFIED: v0.9.271, 2026-10-29 (S401) -- 141/141 on the WORKSTATION;
#           the S401 EDIT block below holds the stamp. Prior: v0.9.270,
#           2026-10-29 (S400) -- 107/107 (the S400 EDIT block); v0.9.269,
#           2026-10-28 (S399) -- 56/56 on the WORKSTATION through
#           receive_all() ("ALL BATTERIES GREEN (12 run, 3407 checks)"; R
#           CMD check 0 errors, 0 warnings, 0 notes), matching the sandbox
#           (plain, under the RStudio-handler stand-in, each again with a
#           35-character temp path, and interactive).
# RUN:      source()-safe from any working directory. All output is explicit
#           cat(), so echo = TRUE is NOT required. Also runnable via
#           regression/run_all.R, which treats a stop() as FAIL.
# CONTRACT: one printed line per check, a final "RESULT: PASS (n/n)" line,
#           and stop() if and only if any check failed.
# GUARDS:   the template's five (_template_check.R): the session handed
#           back, no fixture left by a green run, work outside check() taken
#           through res(), the message surface swept (res() records every
#           condition an analysis raises), the user's objects put back.
#           Setup also forces the missing-value convention UNSET (no call
#           here leans on it) and the diagnostics setting off, both handed
#           back at the foot; since S401 the style and the style folder
#           unset as well, and R_USER_DATA_DIR (which section N points at a
#           temporary folder) put back as it was.
# DATA:     the shipped community dataset (.jst_get_package_dataset()), the
#           standing fixture community_phase2_data.rds, and small frames
#           built here for what neither holds; the style files N-T read are
#           written here, into temporary folders removed at the foot.
# EXPECTED VALUES are computed here from the data, not read from the
#           package: a mean is mean() of the group's cases, a code is the
#           value the cells hold, a label is the value label itself.
# =============================================================================
# S401 EDIT (v0.9.271, 2026-10-29): Capability Slate T, build 2. SECTIONS N-T
#           ADDED, 34 checks (141 in all). (N) style files: the settings'
#           spec beside the apa list; every form a file is read in (a
#           byte-order mark, two too, Windows line ends, comments, quoted
#           values, a color with its #, a color name); the folders searched
#           in order, the first winning; based.on chains; a style not found,
#           a loop, every stop in a file, the did-you-mean on a near miss,
#           a wrong value after the line that set it; a newer jstats's file,
#           its unknown settings skipped in one note. (O) jstyle(): the
#           list, the printout with each inherited setting's source, save.as
#           (a complete copy, its stamps, the per-user folder created), its
#           stops. (P) the frequency table from jfreq() results: the label
#           rows and indented categories, n and % of all cases computed here
#           from the data, missing.rows in its three modes, the codes and
#           blank cells, several results in one table with role headings,
#           the N note, the stops, the preview pinned whole, the Word file
#           read for its rows and pinned by checksum, a column of numbers
#           centered under its head. (Q) joptions(style =, style.dir =):
#           the panel's two rows, the folder created, the style read as
#           jtable() would, the stops (a call that stops creating no
#           folder it names), the reset. (R) a style's settings in
#           the call: the type's section outranks the file; the stops. (S)
#           open =. (T) a bare file name written into the working directory
#           or a relative output folder (the S401 defect: until S401 the
#           Word writer named its temporary file relative to the zip root,
#           and the table was never written). RE-PINNED: I07 (the style
#           object's layers), J12 (the stop on a jcorr() result names
#           jfreq() as well), J14 (a style not found), L10 (document.xml: the
#           decimal tabs center the block of numbers under its head), M01
#           (the full panel has nine rows). MUTATION MAP (S401; 53
#           one-change mutants of tables.R, options.R and zzz.R, each red;
#           by the first check that reds): a layer's section skipped I07; a
#           file named apa.jstyle shadowing the built-in I07; the layers
#           read last to first N02; comments kept N02; a color's # read as a
#           comment N02; color names not converted N02; the byte-order mark
#           kept N02; a choice read case-sensitively N02; thresholds not
#           put largest first N02; based.on falling back to nothing N02;
#           the per-user folder before the working directory N03; a later
#           folder's file listed beside the first N03; the cycle check
#           removed N05; a setting given twice, the last winning N06; a
#           section opened twice N06; based.on in a section N06; a newer
#           format read anyway N06; no did-you-mean on a near miss N07; an
#           unknown setting skipped whatever the file's version N07; a
#           number's range not checked N08; a whole number not required
#           N08; a column named twice N08; the newer stamp ignored N09; the
#           skipped settings out of the file's order N09; the source marks
#           dropped O02; the saved file without its notes O03, or its
#           written.by stamp O03; the per-user folder not created O04;
#           save.as = "apa" allowed O05; the combined Missing row dropped
#           P01; categories not indented P01; a category named by its code
#           despite its label P01; percent of the valid cases P02; the
#           call's settings read after the file's P03; system missing not
#           named Missing in the each mode P03; the N note whatever the
#           pools P06; a variable in two results P07; a named list of one
#           result losing its heading J08; a variable's label row set in
#           italics P09; the decimal tabs at the right-hand limit L10; the
#           Style row missing from the panel M01; zzz.R without the style
#           key Q01; style.dir not created Q02; a folder the call names
#           created before the style check Q02; joptions(style =) not
#           checked Q03; the reset leaving the style Q05; a head italic
#           whatever its label R01; print() redrawing in the default style
#           R01; a general setting in the call R02; another type's setting
#           in the call R02; open = TRUE without file = S01; the opener used
#           in a script S01; the temporary file named relative again T01.
#           LAST VERIFIED: v0.9.271, 2026-10-29 (S401) -- 141/141 on the
#           WORKSTATION through receive_all() ("ALL BATTERIES GREEN (12 run,
#           3492 checks)"; R CMD check 0 errors, 0 warnings, 0 notes),
#           matching the sandbox plain, under the RStudio-handler stand-in,
#           each again with a Windows-length temp path, once with
#           interactive() TRUE (no question asked), and entered dirty.
# S400 EDIT (v0.9.270, 2026-10-29): Capability Slate T, build 1. SECTIONS I-M
#           ADDED, 51 checks (107 in all). (I) the number formats: the
#           decimals, thousands separators, the minus sign, the leading zero
#           dropped for a bounded statistic, p exact with its floor, stars
#           and their legend from one set of thresholds, the marks' glyphs,
#           the style's key lookup. (J) the structure a jdesc() result
#           builds: the apa columns and heads, the cells beside their raw
#           numbers (computed here from the data), headings = and markers =
#           in every form ruling R18 gives a name, the named-list form, and
#           every stop at the front door, rendered. (K) the preview, pinned
#           whole at the battery's width, its decimal alignment, print(),
#           print = and the silent level, the note markup. (L) the Word
#           file: the five parts in order, document.xml read for the caption
#           row on Word's SEQ field (the table's first row, apa's default:
#           Jeff, S400), the header row, APA's three rules, the heading rows
#           and indents, the decimal tab stops (with no tab character), the
#           superscript marks and the note row (the last), the page and the
#           styles part, both parts pinned by checksum; the caption and
#           notes as PARAGRAPHS under a report style with fills, a grid,
#           symbol marks and a landscape Letter page; landscape = auto on a
#           wide table; the
#           minus sign in the file and the hyphen in the preview; the
#           overwrite gate where the session cannot ask; two tables in one
#           file; a built table given back to jtable(). (M) output.dir: the
#           panel's seventh row, the folder created when set and again at
#           the write, a bare name routed there, the stops. MUTATION MAP
#           (S400; 42 one-change mutants of tables.R, options.R and zzz.R,
#           each red; by the first check that reds): the thousands
#           separators removed I01; the leading zero kept I02; the minus
#           sign never written I01 L14; a space in the p floor I04; a star
#           at the threshold I05; the legend's full stop I05; capital
#           marks I06; the section lookup skipped I07; indents dropped
#           J04; heading rows dropped J04; the headings' order ignored
#           J05; the left-out stop removed J09; marks not set J06; the N
#           note dropped J03; Min and Max at the style's decimals J02; the
#           preview's values padded left K06; the top rule dropped K01;
#           the caret dropped K01; the header's repeat flag dropped L04;
#           a right tab for the decimal tab L07; the SEQ switch dropped
#           L03; the header's top rule dropped L05; the heading row's span
#           dropped L02; superscripts dropped L06; the caption's keep-next
#           dropped L03; landscape auto never L13; the parts reordered L01;
#           output.dir ignored M03; the folder not re-created M04; the
#           .docx check removed J14; the gate's stop removed L15; the panel
#           row dropped M01; one table written of two L17; the duplicate
#           check removed J10; the unnamed-item stop removed J11; print()
#           as print.default() K03; the nested call not discarded J15;
#           bold for italic in a note L08; wider columns L09; the session
#           key dropped M02; n from the total J02; a bare name read from
#           the workspace before the result J05.
#           LAST VERIFIED: v0.9.270, 2026-10-29 (S400) -- 107/107 on the
#           WORKSTATION through receive_all() ("ALL BATTERIES GREEN (12 run,
#           3458 checks)"; R CMD check 0 errors, 0 warnings, 0 notes), on
#           the second delivery of 0.9.270 (the caption and notes as rows
#           by default); the first read 106/107 there, K03 red on a stale
#           S3 registration in the receiving session, fixed in the dev
#           tools (receive_package() reloads after document()). Matching
#           the sandbox plain, under the RStudio-handler stand-in, each
#           again with a Windows-length temp path, once with interactive()
#           TRUE, and entered dirty.
# =============================================================================

# --- Setup -------------------------------------------------------------------

stopifnot(exists("jload", mode = "function"))

# Guard 2: what is in the workspace on entry.
.entry_names <- ls(globalenv(), all.names = TRUE)

# Guard 5: the values of the workspace's undotted objects on entry.
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

# Guard 1: session state to hand back at the foot.
.entry_message_width  <- getOption(".jst_options_message_width")
.entry_default_data   <- getOption(".jst_default_data")
.entry_convention     <- getOption(".jst_options_missing_convention")
.entry_output_level   <- getOption(".jst_output_level")
.entry_output_toggles <- getOption(".jst_output_toggles")
.entry_stores <- lapply(stats::setNames(nm = c(".jst_filter", ".jst_complete",
                                              ".jst_dummy", ".jst_registry",
                                              ".jst_missing_notice_shown")),
                        getOption)

# The style and its folder (S401), and the per-user folder's location
# (R_USER_DATA_DIR, which section N points at a temporary folder).
.entry_style     <- getOption(".jst_options_style")
.entry_style_dir <- getOption(".jst_options_style_dir")
.entry_udd       <- Sys.getenv("R_USER_DATA_DIR", unset = NA)

.pin_width <- 76L
options(.jst_options_message_width = .pin_width)
# No call here names or leans on a convention: the slot is forced UNSET.
options(.jst_options_missing_convention = NULL)
# Nor on a style of the session's own: the apa default, no style folder.
options(.jst_options_style = NULL, .jst_options_style_dir = NULL)

# The data. tp2 is the standing fixture; tcm the shipped community dataset.
jload("E:/00 R Projects/00_jstats_test_data/datasets/community_phase2_data.rds",
      name = "tp2", overwrite = TRUE, quiet = TRUE)
tcm <- .jst_get_package_dataset("community")

# Neutral pipeline state; the level at its default and the diagnostics off
# (a level call leaves the diagnostics setting alone, S346).
jsubset(clear.all = TRUE); jcomplete(clear.all = TRUE); joutput(NULL)
jdummy(clear.all = TRUE)
juse(NULL)
invisible(utils::capture.output(suppressMessages(joutput(diagnostics = FALSE))))

# A small frame for what the two datasets do not hold.
#   Pol  labelled numeric: one label over 40 columns, one label no case
#        holds (a zero row), plain NA cells
#   Ctry labelled TEXT: two labelled codes, one unlabelled ("FR"), blank
#        cells (one empty, one of spaces)
#   Txt  plain text with blank cells and an NA
#   Grp  plain text grouping variable; G01 a plain numeric one; Gf a factor
#   Mar  text with declared missing values, one of them the blank
#   Rng  labelled numeric with a declared range, two of its values held and
#        one labelled value inside it that no case holds
#   Y    numeric outcome
.long_lab <- "Agree that the policy should be enforced strictly and fully"
tsy <- data.frame(
  Pol  = haven::labelled(c(1, 1, 2, 3, 3, 3, NA, 2, 1, 3, 2, 1),
                         labels = stats::setNames(c(1, 2, 3, 4),
                                                  c(.long_lab, "Neutral",
                                                    "Disagree", "Never chosen"))),
  Ctry = haven::labelled(c("US", "UK", "US", "FR", "US", "UK", "", "  ",
                           "US", "UK", "FR", "US"),
                         labels = c("United States" = "US",
                                    "United Kingdom" = "UK")),
  Txt  = c("a", "b", "", "  ", "a", NA, "b", "a", "b", "a", "a", "b"),
  Grp  = rep(c("x", "y"), 6),
  G01  = rep(c(1, 2), 6),
  Gf   = factor(rep(c("lo", "mid", "hi"), 4), levels = c("lo", "mid", "hi")),
  Mar  = haven::labelled_spss(c("Single", "Married", "UNKNOWN", "", "Single",
                                "Married", "Single", "UNKNOWN", "Married",
                                "Single", "Married", "Single"),
                              labels = c(Unknown = "UNKNOWN"),
                              na_values = c("UNKNOWN", "")),
  Rng  = haven::labelled_spss(c(1, 2, 1, -95, 2, 1, -93, 2, 1, 2, 1, 2),
                              labels = c(Low = 1, High = 2, "Not asked" = -97),
                              na_range = c(-99, -90)),
  Y    = c(12, 15, 11, 18, 14, 16, 10, 19, 13, 17, 12, 20),
  stringsAsFactors = FALSE)

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

# res() (guards 3 and 4): a result taken outside check(). What the call
# prints is captured; every note, warning and error it raises is recorded
# in .seen for the sweep at the foot and kept off the console; an error
# gives a NULL value, so the checks that read the result go red instead of
# the battery halting.
res <- function(expr) {
  val <- NULL
  txt <- tryCatch(
    paste(utils::capture.output(withCallingHandlers(
      val <- expr,
      message = function(m) { .see("note", m); invokeRestart("muffleMessage") },
      warning = function(w) { .see("warning", w); invokeRestart("muffleWarning") })),
      collapse = "\n"),
    error = function(e) {
      .see("error", e)
      paste0("[error] ", conditionMessage(e))
    })
  list(val = val, txt = txt)
}

# The value labels of a column, as a code -> label lookup.
.labs_of <- function(x) {
  l <- attr(x, "labels", exact = TRUE)
  stats::setNames(names(l), as.character(unname(l)))
}

# =============================================================================
# A. jfreq(): the code and the label beside each printed row
# =============================================================================
cat("\n--- A. jfreq(): Code and Label ---\n")

.a1 <- res(jfreq(tcm, Education))$val
.a1v <- .a1$frequencies$Education$valid
check("A01 a labelled numeric: each Valid row's Code is its value and Label its label, beside the printed Value (value.id both)",
      !is.null(.a1v) && identical(as.numeric(.a1v$Code), c(1, 2, 3, 4, 5)) &&
        identical(.a1v$Label, unname(.labs_of(tcm$Education)[c("1", "2", "3", "4", "5")])) &&
        identical(.a1v$Value, paste0(1:5, ": ", .a1v$Label)))

.a2l <- res(jfreq(tcm, Education, value.id = "labels"))$val$frequencies$Education$valid
.a2v <- res(jfreq(tcm, Education, value.id = "values"))$val$frequencies$Education$valid
check("A02 value.id labels and values change Value only: Code and Label are the same under all three",
      !is.null(.a2l) && !is.null(.a2v) &&
        identical(.a2l$Code, .a1v$Code) && identical(.a2v$Code, .a1v$Code) &&
        identical(.a2l$Label, .a1v$Label) && identical(.a2v$Label, .a1v$Label) &&
        identical(.a2l$Value, .a1v$Label) && identical(.a2v$Value, as.character(1:5)))

.a3 <- res(jfreq(tsy, Pol))$val$frequencies$Pol$valid
check("A03 a label over 40 columns: Value is cut with an ellipsis, Label holds it whole",
      !is.null(.a3) && identical(.a3$Label[1], .long_lab) &&
        nchar(.a3$Value[1]) < nchar(paste0("1: ", .long_lab)) &&
        !grepl(.long_lab, .a3$Value[1], fixed = TRUE))

check("A04 a labelled value no case holds: its zero row carries its code and label",
      !is.null(.a3) && nrow(.a3) == 4L &&
        identical(as.numeric(.a3$Code), c(1, 2, 3, 4)) &&
        identical(.a3$Freq[4], 0L) && identical(.a3$Label[4], "Never chosen"))

.a5 <- res(jfreq(tsy, Ctry))$val$frequencies$Ctry$valid
check("A05 a labelled TEXT variable: Code is the text the cells hold, the blank cells one <blank> row, an unlabelled code's Label NA",
      !is.null(.a5) && is.character(.a5$Code) &&
        setequal(.a5$Code, c("<blank>", "FR", "UK", "US")) &&
        identical(.a5$Label[.a5$Code == "US"], "United States") &&
        identical(.a5$Label[.a5$Code == "UK"], "United Kingdom") &&
        is.na(.a5$Label[.a5$Code == "FR"]) && is.na(.a5$Label[.a5$Code == "<blank>"]) &&
        identical(.a5$Freq[.a5$Code == "<blank>"], 2L))

.a6 <- res(jfreq(tp2, Gender_01, Gender_character, Gender_factor,
                 Veteran_logical))$val$frequencies
check("A06 a plain numeric variable: Code is the number (numeric), Label NA",
      !is.null(.a6) && is.numeric(.a6$Gender_01$valid$Code) &&
        identical(as.numeric(.a6$Gender_01$valid$Code),
                  sort(unique(as.numeric(stats::na.omit(tp2$Gender_01))))) &&
        all(is.na(.a6$Gender_01$valid$Label)))
check("A07 plain text, a factor, TRUE/FALSE: Code is the row's own text, Label NA",
      !is.null(.a6) &&
        identical(.a6$Gender_character$valid$Code, .a6$Gender_character$valid$Value) &&
        identical(.a6$Gender_factor$valid$Code, levels(tp2$Gender_factor)) &&
        identical(.a6$Veteran_logical$valid$Code, c("FALSE", "TRUE")) &&
        all(is.na(c(.a6$Gender_character$valid$Label,
                    .a6$Gender_factor$valid$Label,
                    .a6$Veteran_logical$valid$Label))))

.a8 <- res(jfreq(tsy, Txt))$val$frequencies$Txt$valid
check("A08 plain text with blank cells: the <blank> row's Code is <blank>, as its Value",
      !is.null(.a8) && identical(.a8$Code, .a8$Value) &&
        "<blank>" %in% .a8$Code && identical(.a8$Freq[.a8$Code == "<blank>"], 2L))

.a9 <- .a1$frequencies$Education$udm
check("A09 SPSS-style declared codes: each Missing row's Code is the number and Label its label, Value as printed",
      !is.null(.a9) && nrow(.a9) == 2L && is.numeric(.a9$Code) &&
        setequal(.a9$Code, c(-99, -98)) &&
        identical(.a9$Label[.a9$Code == -99], "Refused") &&
        identical(.a9$Label[.a9$Code == -98], "Don't know") &&
        identical(.a9$Value[.a9$Code == -99], "-99 [\"Refused\"]"))

.a10 <- res(jfreq(tp2, Age_categorical_stata, Age_categorical_sas))$val$frequencies
check("A10 Stata-style and SAS-style markers: Code is the marker as written (.a, .B), Label its label",
      !is.null(.a10) &&
        identical(.a10$Age_categorical_stata$udm$Code, c(".a", ".b")) &&
        identical(.a10$Age_categorical_stata$udm$Label, c("Refused", "Don't know")) &&
        identical(.a10$Age_categorical_sas$udm$Code, c(".A", ".B")) &&
        identical(.a10$Age_categorical_sas$udm$Label, c("Refused", "Don't know")))

.a11 <- res(jfreq(tp2, Age_categorical_range, missing.detail = "totals"))$val
.a11u <- .a11$frequencies$Age_categorical_range$udm
check("A11 a declared range shown as one row: no code and no label (NA, NA); the discrete code keeps its own",
      !is.null(.a11u) && any(grepl("^range ", .a11u$Value)) &&
        all(is.na(.a11u$Code[grepl("^range ", .a11u$Value)])) &&
        all(is.na(.a11u$Label[grepl("^range ", .a11u$Value)])) &&
        identical(.a11u$Code[!grepl("^range ", .a11u$Value)], -1) &&
        identical(.a11u$Label[!grepl("^range ", .a11u$Value)], "Outlier"))

.a12 <- res(jfreq(tp2, Age_categorical_range, missing.detail = "all"))$val
.a12u <- .a12$frequencies$Age_categorical_range$udm
.a12in <- local({
  x <- unclass(tp2$Age_categorical_range); attributes(x) <- NULL
  sort(unique(x[!is.na(x) & x >= -99 & x <= -90]))
})
check("A12 a range listed value by value: each value's row carries it as Code, Label NA where the value has none",
      !is.null(.a12u) && identical(sort(.a12u$Code[.a12u$Code != -1]), as.numeric(.a12in)) &&
        all(is.na(.a12u$Label[.a12u$Code != -1])))

.a13 <- res(jfreq(tsy, Mar))$val$frequencies$Mar$udm
check("A13 declared text values: Code is the value as stored, a declared blank the one <blank> category; Label its label or NA",
      !is.null(.a13) && is.character(.a13$Code) &&
        setequal(.a13$Code, c("UNKNOWN", "<blank>")) &&
        identical(.a13$Label[.a13$Code == "UNKNOWN"], "Unknown") &&
        is.na(.a13$Label[.a13$Code == "<blank>"]))

.a15 <- res(jfreq(tsy, Rng, missing.detail = "all"))$val$frequencies$Rng$udm
check("A15 a labelled value inside a declared range that no case holds: its zero row carries its code and label",
      !is.null(.a15) && identical(.a15$Code, c(-97, -95, -93)) &&
        identical(.a15$Freq, c(0L, 1L, 1L)) &&
        identical(.a15$Label[1], "Not asked") && all(is.na(.a15$Label[2:3])))

check("A14 Code and Label are the last two columns of the Valid and Missing frames; the printed columns keep their names and order",
      !is.null(.a1v) && !is.null(.a9) &&
        identical(names(.a1v), c("Value", "Freq", "TotalPct", "ValidPct", "CumPct",
                                 "Code", "Label")) &&
        identical(names(.a9), c("Value", "Freq", "TotalPct", "Code", "Label")))

# =============================================================================
# B. jt() and jaov(): each group's code and label; the statistics unrounded
# =============================================================================
cat("\n--- B. jt() and jaov() ---\n")

.grp <- function(y, g) {
  ok <- !is.na(y) & !is.na(g)
  split(as.numeric(y[ok]), g[ok])
}
.b_wv <- .grp(tcm$WellbeingScore, as.numeric(unclass(tcm$Volunteer)))
.b1 <- res(jt(WellbeingScore ~ Volunteer, tcm, diagnostics = FALSE))$val
check("B01 jt(): Code and Label beside the printed Group column, the printed columns unchanged",
      !is.null(.b1) &&
        identical(names(.b1$descriptives), c("Group", "N", "Mean", "SD", "Code", "Label")) &&
        identical(as.numeric(.b1$descriptives$Code), c(0, 1)) &&
        identical(.b1$descriptives$Label, c("No", "Yes")) &&
        identical(.b1$descriptives$Group, c("0: No", "1: Yes")))

.b1r <- .b1$descriptives_raw
check("B02 jt(): descriptives_raw holds each group's N, mean and SD unrounded, and the printed frame rounds them",
      !is.null(.b1r) &&
        identical(as.numeric(.b1r$group_code), c(0, 1)) &&
        identical(.b1r$group_label, c("No", "Yes")) &&
        identical(as.integer(.b1r$n), unname(vapply(.b_wv, length, integer(1)))) &&
        isTRUE(all.equal(.b1r$mean, unname(vapply(.b_wv, mean, numeric(1))))) &&
        isTRUE(all.equal(.b1r$sd, unname(vapply(.b_wv, stats::sd, numeric(1))))) &&
        identical(round(.b1r$mean, 3), .b1$descriptives$Mean) &&
        any(.b1r$mean != .b1$descriptives$Mean))

check("B03 jt(): the outcome and the grouping variable ride as attributes, name and label",
      !is.null(.b1r) &&
        identical(attr(.b1r, "outcome", exact = TRUE),
                  c(name = "WellbeingScore", label = attr(tcm$WellbeingScore, "label", exact = TRUE))) &&
        identical(attr(.b1r, "group", exact = TRUE),
                  c(name = "Volunteer", label = attr(tcm$Volunteer, "label", exact = TRUE))))

.b4 <- res(jt(WellbeingScore ~ Volunteer, tcm, digits = 1, diagnostics = FALSE))$val
check("B04 jt(digits = 1): the printed Mean rounds to one place, descriptives_raw does not move",
      !is.null(.b4) && identical(.b4$descriptives$Mean, round(.b1r$mean, 1)) &&
        isTRUE(all.equal(.b4$descriptives_raw$mean, .b1r$mean)))

.b5t <- res(jt(Y ~ Grp, tsy, diagnostics = FALSE))$val
.b5n <- res(jt(Y ~ G01, tsy, diagnostics = FALSE))$val
check("B05 a text grouping variable's Code is its text; a plain numeric one's is the number; Label NA",
      !is.null(.b5t) && !is.null(.b5n) &&
        identical(.b5t$descriptives$Code, c("x", "y")) &&
        identical(.b5n$descriptives$Code, c(1, 2)) &&
        all(is.na(c(.b5t$descriptives$Label, .b5n$descriptives$Label))) &&
        identical(.b5n$descriptives_raw$group_code, c(1, 2)))

.b6 <- res(jt(Y ~ Grp, tsy, paired = TRUE, diagnostics = FALSE))$val
check("B06 a paired jt(): descriptives_raw counts the complete pairs, as the printed N does",
      !is.null(.b6) && identical(as.integer(.b6$descriptives_raw$n),
                                 as.integer(.b6$descriptives$N)) &&
        isTRUE(all.equal(.b6$descriptives_raw$mean,
                         unname(vapply(split(tsy$Y, tsy$Grp), mean, numeric(1))))))

.b_wr <- .grp(tcm$WellbeingScore, as.numeric(unclass(tcm$Region)))
.b7 <- res(jaov(WellbeingScore ~ Region, tcm, posthoc = TRUE, diagnostics = FALSE))$val
.b7r <- .b7$descriptives_raw
.b7ci <- vapply(.b_wr, function(v) mean(v) + c(-1, 1) * stats::qt(0.975, length(v) - 1) *
                  stats::sd(v) / sqrt(length(v)), numeric(2))
check("B07 jaov(): Code and Label beside Group; descriptives_raw unrounded, each mean's 95% interval with it",
      !is.null(.b7r) &&
        identical(as.numeric(.b7$descriptives$Code), c(1, 2, 3, 4)) &&
        identical(.b7$descriptives$Label, c("North", "South", "East", "West")) &&
        isTRUE(all.equal(.b7r$mean, unname(vapply(.b_wr, mean, numeric(1))))) &&
        isTRUE(all.equal(.b7r$ci_lower, unname(.b7ci[1, ]))) &&
        isTRUE(all.equal(.b7r$ci_upper, unname(.b7ci[2, ]))))

.ph_ok <- function(ph, r) {
  if (is.null(ph) || is.null(r)) return(FALSE)
  k  <- nrow(r)
  ij <- which(lower.tri(matrix(0, k, k)), arr.ind = TRUE)
  nrow(ph) == nrow(ij) &&
    identical(as.numeric(ph$group1_code), as.numeric(r$group_code[ij[, 1]])) &&
    identical(as.numeric(ph$group2_code), as.numeric(r$group_code[ij[, 2]])) &&
    identical(ph$group1_label, r$group_label[ij[, 1]]) &&
    identical(ph$group2_label, r$group_label[ij[, 2]]) &&
    isTRUE(all.equal(ph$diff, r$mean[ij[, 1]] - r$mean[ij[, 2]]))
}
check("B08 jaov()'s Tukey pairs: each pair's two groups by code and label, the difference the first minus the second",
      .ph_ok(.b7$posthoc, .b7r) && identical(unique(.b7$posthoc$test), "Tukey HSD"))

.b9 <- res(jaov(WellbeingScore ~ Region, tcm, welch = TRUE, posthoc = TRUE,
                diagnostics = FALSE))$val
check("B09 ... the Games-Howell pairs under Welch the same",
      .ph_ok(.b9$posthoc, .b9$descriptives_raw) &&
        identical(unique(.b9$posthoc$test), "Games-Howell"))

.b10 <- tryCatch(local({
  tb <- data.frame(comparison = c("b-a", "c-a", "c-b"), diff = 1:3)
  gm <- data.frame(level = c("a", "b", "c"), code = c(10, 20, 30),
                   label = c("A", "B", "C"), stringsAsFactors = FALSE)
  list(good = .jst_posthoc_codes(tb, gm),
       bad  = .jst_posthoc_codes(transform(tb, comparison = c("a-b", "c-a", "c-b")), gm))
}), error = function(e) NULL)
check("B10 a comparison column in another order gets NA codes, never a guess",
      !is.null(.b10) && identical(.b10$good$group1_code, c(20, 30, 30)) &&
        identical(.b10$good$group2_label, c("A", "A", "B")) &&
        all(is.na(.b10$bad$group1_code)) && all(is.na(.b10$bad$group2_label)))

.b11 <- res(jaov(Y ~ Gf, tsy, diagnostics = FALSE))$val
check("B11 a factor grouping variable: Code is the level itself, Label NA",
      !is.null(.b11) && identical(.b11$descriptives$Code, c("lo", "mid", "hi")) &&
        all(is.na(.b11$descriptives$Label)))

# =============================================================================
# C. jcrosstab(): each row and column category's code and label
# =============================================================================
cat("\n--- C. jcrosstab() ---\n")

.c1 <- res(jcrosstab(Region ~ Volunteer, tcm, chisq = TRUE))$val
check("C01 row_categories and col_categories: the stored tables' level names, each with its code and label, in their order",
      !is.null(.c1) &&
        identical(.c1$row_categories$level, rownames(.c1$observed)) &&
        identical(.c1$col_categories$level, colnames(.c1$observed)) &&
        identical(as.numeric(.c1$row_categories$code), c(1, 2, 3, 4)) &&
        identical(.c1$row_categories$label, c("North", "South", "East", "West")) &&
        identical(as.numeric(.c1$col_categories$code), c(0, 1)) &&
        identical(.c1$col_categories$label, c("No", "Yes")))
check("C02 ... each variable's name and label ride as the attribute variable",
      !is.null(.c1) &&
        identical(attr(.c1$row_categories, "variable", exact = TRUE),
                  c(name = "Region", label = attr(tcm$Region, "label", exact = TRUE))) &&
        identical(attr(.c1$col_categories, "variable", exact = TRUE),
                  c(name = "Volunteer", label = attr(tcm$Volunteer, "label", exact = TRUE))))

.c3 <- res(jcrosstab(Grp ~ G01, tsy))$val
check("C03 a text variable's codes are its text, a plain numeric one's its numbers; no labels",
      !is.null(.c3) && identical(.c3$row_categories$code, c("x", "y")) &&
        identical(.c3$col_categories$code, c(1, 2)) &&
        all(is.na(c(.c3$row_categories$label, .c3$col_categories$label))))

.c4 <- res(jcrosstab(Ctry ~ Grp, tsy))$val
check("C04 a labelled text variable with blank cells: codes as the cells hold them, <blank> one category",
      !is.null(.c4) && setequal(.c4$row_categories$code, c("<blank>", "FR", "UK", "US")) &&
        identical(.c4$row_categories$label[.c4$row_categories$code == "US"], "United States"))

# =============================================================================
# D. jdesc(by =): descriptives_raw, per variable and group
# =============================================================================
cat("\n--- D. jdesc(by =) ---\n")

.d1 <- res(jdesc(tcm, Age, WellbeingScore, by = Region))$val
.d1r <- .d1$descriptives_raw
.d_age <- .grp(tcm$Age, as.numeric(unclass(tcm$Region)))
check("D01 jdesc(by =) fills descriptives_raw: one row per variable and group, in the order printed, each group's code and label",
      !is.null(.d1r) && nrow(.d1r) == 8L &&
        identical(.d1r$variable, rep(c("Age", "WellbeingScore"), each = 4)) &&
        identical(as.numeric(.d1r$group_code), rep(c(1, 2, 3, 4), 2)) &&
        identical(.d1r$group_label, rep(c("North", "South", "East", "West"), 2)))
check("D02 ... the statistics unrounded: N, min, max, mean and SD of each group's cases",
      !is.null(.d1r) &&
        identical(as.integer(.d1r$n_valid[1:4]), unname(vapply(.d_age, length, integer(1)))) &&
        isTRUE(all.equal(.d1r$mean[1:4], unname(vapply(.d_age, mean, numeric(1))))) &&
        isTRUE(all.equal(.d1r$sd[1:4], unname(vapply(.d_age, stats::sd, numeric(1))))) &&
        isTRUE(all.equal(.d1r$min[1:4], unname(vapply(.d_age, min, numeric(1))))) &&
        isTRUE(all.equal(.d1r$max[1:4], unname(vapply(.d_age, max, numeric(1))))) &&
        identical(.d1r$total - .d1r$n_valid, .d1r$n_missing))
check("D03 ... the variables' labels as the ungrouped frame keys them, the grouping variable as the attribute by",
      !is.null(.d1r) &&
        identical(attr(.d1r, "labels", exact = TRUE),
                  c(Age = attr(tcm$Age, "label", exact = TRUE),
                    WellbeingScore = attr(tcm$WellbeingScore, "label", exact = TRUE))) &&
        identical(attr(.d1r, "by", exact = TRUE),
                  c(name = "Region", label = attr(tcm$Region, "label", exact = TRUE))))

.d4 <- res(jdesc(tsy, Y, by = Grp))$val$descriptives_raw
check("D04 a text grouping variable: group_code its text, group_label NA",
      !is.null(.d4) && identical(.d4$group_code, c("x", "y")) && all(is.na(.d4$group_label)))

# =============================================================================
# E. jcorr(): each variable's M and SD
# =============================================================================
cat("\n--- E. jcorr() ---\n")

.num <- function(x) as.numeric(haven::zap_missing(x))
.e1 <- res(jcorr(tcm, Age, WellbeingScore, Income))$val
.e1r <- .e1$descriptives_raw
check("E01 jcorr() stores each variable's N, mean and SD, unrounded, declared missing values out",
      !is.null(.e1r) && identical(.e1r$variable, c("Age", "WellbeingScore", "Income")) &&
        identical(as.integer(.e1r$n_valid),
                  c(sum(!is.na(tcm$Age)), sum(!is.na(tcm$WellbeingScore)),
                    sum(!is.na(.num(tcm$Income))))) &&
        isTRUE(all.equal(.e1r$mean[3], mean(.num(tcm$Income), na.rm = TRUE))) &&
        isTRUE(all.equal(.e1r$sd[3], stats::sd(.num(tcm$Income), na.rm = TRUE))))
.e2 <- res(jcorr(tcm, Age, Income))$val
check("E02 ... a correlation of two variables stores them too",
      !is.null(.e2$descriptives_raw) &&
        isTRUE(all.equal(.e2$descriptives_raw$mean,
                         c(mean(tcm$Age), mean(.num(tcm$Income), na.rm = TRUE)))))

# =============================================================================
# F. jalpha(): alpha and the item statistics unrounded
# =============================================================================
cat("\n--- F. jalpha() ---\n")

.f_items <- c("Environment1", "Environment2", "Environment3", "Environment4",
              "Environment5")
.f_x <- as.data.frame(lapply(tcm[.f_items], .num))
.f_x <- .f_x[stats::complete.cases(.f_x), ]
.f_k <- ncol(.f_x)
.f_alpha <- .f_k / (.f_k - 1) * (1 - sum(vapply(.f_x, stats::var, numeric(1))) /
                                 stats::var(rowSums(.f_x)))
.f1 <- res(jalpha(tcm, Environment1, Environment2, Environment3, Environment4,
                  Environment5))$val
check("F01 jalpha(): alpha_raw is Cronbach's alpha on the complete cases, unrounded; the stored alpha is it rounded",
      !is.null(.f1$alpha_raw) && isTRUE(all.equal(.f1$alpha_raw, .f_alpha)) &&
        identical(.f1$alpha, round(.f1$alpha_raw, 3)) && .f1$alpha != .f1$alpha_raw)
.f_r <- vapply(seq_len(.f_k), function(i) stats::cor(.f_x[[i]], rowSums(.f_x[-i])),
               numeric(1))
check("F02 items_raw: each item's N, mean, SD and corrected item-total r unrounded; the printed tables round them",
      !is.null(.f1$items_raw) && identical(.f1$items_raw$item, .f_items) &&
        identical(as.integer(.f1$items_raw$n), rep(nrow(.f_x), .f_k)) &&
        isTRUE(all.equal(.f1$items_raw$mean, unname(colMeans(.f_x)))) &&
        isTRUE(all.equal(.f1$items_raw$item_total_r, .f_r)) &&
        identical(round(.f1$items_raw$mean, 3), .f1$item_statistics$Mean) &&
        identical(round(.f1$items_raw$item_total_r, 3),
                  .f1$item_total_statistics$Corrected_Item_Total_r) &&
        identical(round(.f1$items_raw$alpha_if_deleted, 3),
                  .f1$item_total_statistics$Alpha_If_Deleted))
check("F03 ... each item's label whole",
      !is.null(.f1$items_raw) &&
        identical(.f1$items_raw$label,
                  unname(vapply(.f_items, function(v) attr(tcm[[v]], "label", exact = TRUE),
                                character(1)))))

# =============================================================================
# G. The version stamp
# =============================================================================
cat("\n--- G. The version stamp ---\n")

.ver <- as.character(utils::packageVersion("jstats"))
.g_all <- list(
  jdesc     = res(jdesc(tcm, Age))$val,
  jdesc_by  = .d1,
  jfreq     = .a1,
  jscreen   = res(jscreen(tcm))$val,
  jt        = .b1,
  jaov      = .b7,
  jcrosstab = .c1,
  jcorr2    = .e2,
  jcorr3    = .e1,
  jlm       = res(jlm(WellbeingScore ~ Age, tcm))$val,
  jlogistic = res(jlogistic(Volunteer ~ Age, tcm))$val,
  jalpha    = .f1)
.g_bad <- names(.g_all)[!vapply(.g_all, function(r)
  identical(attr(r, "jstats_version", exact = TRUE), .ver), logical(1))]
check(paste0("G01 every result the ten analysis functions make carries jstats_version, the version that made it (",
             length(.g_all), " results)"),
      length(.g_bad) == 0L)
if (length(.g_bad)) cat("        unstamped: ", paste(.g_bad, collapse = ", "), "\n", sep = "")

.g2 <- local({
  f <- tempfile(fileext = ".rds"); on.exit(unlink(f))
  saveRDS(.b7, f); readRDS(f)
})
check("G02 the stamp survives a save to disk and a read back",
      identical(attr(.g2, "jstats_version", exact = TRUE), .ver))
.g3 <- res(jsum(tcm, Environment1, Environment2))$val
check("G03 jsum()'s value goes into the data frame and carries no stamp",
      !is.null(.g3) && is.null(attr(.g3, "jstats_version", exact = TRUE)))

# =============================================================================
# H. The accessors: a method for every class, and what each reads
# =============================================================================
cat("\n--- H. The accessors ---\n")

.h_cls <- c("jst_lm", "jst_logistic", "jst_freq", "jst_desc", "jst_corr",
            "jst_ttest", "jst_anova", "jst_crosstab", "jst_alpha")
# Registration is read off the namespace's S3 methods table, where
# registerS3method() puts it: getS3method() also finds a method by its name
# in the namespace, so it cannot tell a registered method from one .onLoad
# never registered (the zzz.R mutant passed it).
.h_tab <- get(".__S3MethodsTable__.", envir = asNamespace("jstats"))
.h_reg <- vapply(.h_cls, function(cls) {
  exists(paste0(".jst_apa_terms.", cls), envir = .h_tab, inherits = FALSE) &&
    exists(paste0(".jst_apa_model.", cls), envir = .h_tab, inherits = FALSE)
}, logical(1))
check("H01 every result class has both accessor methods registered, and is in .jst_apa_classes",
      all(.h_reg) && all(.h_cls %in% .jst_apa_classes))

.h_res <- list(jst_lm = .g_all$jlm, jst_logistic = .g_all$jlogistic,
               jst_freq = .a1, jst_desc = .d1, jst_corr = .e1,
               jst_ttest = .b1, jst_anova = .b7, jst_crosstab = .c1,
               jst_alpha = .f1)
.h_null <- names(.h_res)[vapply(names(.h_res), function(cls) {
  r <- .h_res[[cls]]
  !inherits(r, cls) || is.null(.jst_apa_terms(r)) ||
    (cls != "jst_desc" && is.null(.jst_apa_model(r)))
}, logical(1))]
check("H02 each class's own methods answer: .jst_apa_terms() gives rows for every class, .jst_apa_model() a row for all but jst_desc",
      length(.h_null) == 0L)
if (length(.h_null)) cat("        no answer: ", paste(.h_null, collapse = ", "), "\n", sep = "")

.h3 <- .jst_apa_terms(.a1)
check("H03 frequencies: block valid then missing, each row's code and label from the result, the counts as stored",
      !is.null(.h3) &&
        identical(.h3$block, c(rep("valid", 5), rep("missing", 2))) &&
        identical(as.numeric(.h3$code), c(as.numeric(.a1v$Code), as.numeric(.a9$Code))) &&
        identical(.h3$label, c(.a1v$Label, .a9$Label)) &&
        identical(.h3$count, c(.a1v$Freq, .a9$Freq)) &&
        all(is.na(.h3$valid_pct[.h3$block == "missing"])))

.h4 <- .jst_apa_terms(.d1)
check("H04 grouped descriptives: identifiers first -- variable, var_label, group_code, group_label -- then the statistics",
      !is.null(.h4) &&
        identical(names(.h4), c("variable", "var_label", "group_code", "group_label",
                                "total", "n_valid", "n_missing", "min", "max",
                                "mean", "sd")) &&
        identical(.h4$var_label[1], attr(tcm$Age, "label", exact = TRUE)) &&
        identical(attr(.h4, "by", exact = TRUE), attr(.d1r, "by", exact = TRUE)))

.h5 <- attr(.jst_apa_terms(.e1), "variables", exact = TRUE)
check("H05 correlations: the variables' N, mean and SD ride beside the pairs as the attribute variables",
      !is.null(.h5) && identical(.h5$variable, .e1r$variable) &&
        isTRUE(all.equal(.h5$mean, .e1r$mean)) && isTRUE(all.equal(.h5$sd, .e1r$sd)))

.h6m <- .jst_apa_model(.b1)
.h6l <- res(jt(WellbeingScore ~ Volunteer, tcm, diagnostics = "levene"))$val
.h6lm <- .jst_apa_model(.h6l)
check("H06 jt(): one model row, the statistic, df and p as returned; Levene's columns NA unless it was run, then its F and p",
      !is.null(.h6m) && !is.null(.h6lm) &&
        identical(.h6m$t, .b1$t) && identical(.h6m$p, .b1$p) &&
        identical(.h6m$ci_lower, unname(.b1$ci["lower"])) &&
        is.na(.h6m$levene_f) && is.na(.h6m$levene_p) &&
        identical(.h6lm$levene_f, unname(.h6l$levene$F)) &&
        identical(.h6lm$levene_p, unname(.h6l$levene$p)))

.h7 <- .jst_apa_terms(.b7)
check("H07 jaov(): the group rows, the post-hoc table as the attribute posthoc, the model row's F and eta-squared",
      !is.null(.h7) && identical(attr(.h7, "posthoc", exact = TRUE), .b7$posthoc) &&
        identical(.jst_apa_model(.b7)$f, .b7$f) &&
        identical(.jst_apa_model(.b7)$eta_squared, .b7$eta_squared))

.h8 <- .jst_apa_terms(.c1)
.h8o <- unclass(.c1$observed)
check("H08 crosstab: one row per cell, row by row; counts, expected counts and residuals as stored; row percentages sum to 100",
      !is.null(.h8) && nrow(.h8) == length(.h8o) &&
        identical(.h8$count, as.numeric(t(.h8o))) &&
        isTRUE(all.equal(.h8$expected, as.numeric(t(.c1$expected)))) &&
        isTRUE(all.equal(.h8$adjusted_residual, as.numeric(t(.c1$adjusted_residuals)))) &&
        isTRUE(all.equal(as.numeric(tapply(.h8$row_pct, .h8$row_level, sum)), rep(100, 4))) &&
        identical(.h8$row_label[1], "North") && identical(as.numeric(.h8$col_code[2]), 1))

.h9 <- res(jcrosstab(Region ~ Volunteer, tcm))$val
check("H09 crosstab model: the chi-square columns as returned with chisq = TRUE, NA without it",
      !is.null(.h9) &&
        identical(.jst_apa_model(.c1)$chi_square, unname(as.numeric(.c1$chi_square))) &&
        identical(.jst_apa_model(.c1)$cramers_v, unname(as.numeric(.c1$cramers_v))) &&
        is.na(.jst_apa_model(.h9)$chi_square) && is.na(.jst_apa_model(.h9)$p))

check("H10 reliability: the item rows from items_raw, the model row's alpha unrounded",
      !is.null(.f1$items_raw) && !is.null(.f1$alpha_raw) &&
        identical(.jst_apa_terms(.f1), `rownames<-`(.f1$items_raw, NULL)) &&
        identical(.jst_apa_model(.f1)$alpha, .f1$alpha_raw))

.h11 <- local({
  old_f <- .a1; old_f$frequencies$Education$valid$Code <- NULL
  old_f$frequencies$Education$valid$Label <- NULL
  old_t <- .b1; old_t$descriptives_raw <- NULL
  old_x <- .c1; old_x$row_categories <- NULL; old_x$col_categories <- NULL
  old_a <- .f1; old_a$items_raw <- NULL; old_a$alpha_raw <- NULL
  list(f = tryCatch(.jst_apa_terms(old_f), error = function(e) "error"),
       t = tryCatch(.jst_apa_terms(old_t), error = function(e) "error"),
       x = tryCatch(.jst_apa_terms(old_x), error = function(e) "error"),
       a = tryCatch(.jst_apa_model(old_a), error = function(e) "error"))
})
check("H11 a result made before the build reads without an error: NA codes and labels, or NULL where the field is missing",
      is.data.frame(.h11$f) && all(is.na(.h11$f$code[.h11$f$block == "valid"])) &&
        is.null(.h11$t) && is.data.frame(.h11$x) && all(is.na(.h11$x$row_code)) &&
        is.null(.h11$a))

# =============================================================================
# I. The table layer's number formats (build 1, S400)
# =============================================================================
cat("\n--- I. Number formats ---\n")

# The console's colour escapes, stripped from a capture (the panel's title
# is red where the output draws colour).
.strip_ansi <- function(x) gsub("\033\\[[0-9;]*m", "", x)

check("I01 .jst_tbl_num(): the decimals, thousands separators, a hyphen or the minus sign, NA a blank cell, a value that rounds to zero from below unsigned",
      identical(.jst_tbl_num(c(49855.670103, 1234567.891, 0.5, -0.004, NA, -12.5),
                             2, "comma", TRUE, "hyphen"),
                c("49,855.67", "1,234,567.89", "0.50", "0.00", "", "-12.50")) &&
        identical(.jst_tbl_num(c(49855.670103, -12.5), 2, "none", TRUE, "hyphen"),
                  c("49855.67", "-12.50")) &&
        identical(.jst_tbl_num(-12.5, 1, "comma", TRUE, "true"),
                  paste0("\u2212", "12.5")))

check("I02 ... the leading zero dropped for a statistic bounded by 1 (r, p, beta), the sign kept",
      identical(.jst_tbl_num(c(0.234, -0.123, 1.5, -1.0), 2, "comma", FALSE, "hyphen"),
                c(".23", "-.12", "1.50", "-1.00")))

check("I03 .jst_tbl_count(): a count with its separators, NA blank",
      identical(.jst_tbl_count(c(103, 1037, 1e6, NA), "comma"),
                c("103", "1,037", "1,000,000", "")) &&
        identical(.jst_tbl_count(1037, "none"), "1037"))

check("I04 .jst_tbl_p(): exact to 3 places with the <.001 floor and no leading zero; stars; both; NA blank",
      identical(.jst_tbl_p(c(0.0499, 0.004, 0.0004, 0.5, NA), "exact", 3),
                c(".050", ".004", "<.001", ".500", "")) &&
        identical(.jst_tbl_p(c(0.0499, 0.004, 0.0004, 0.5, NA), "stars", 3),
                  c("*", "**", "***", "", "")) &&
        identical(.jst_tbl_p(c(0.004, 0.5), "both", 3), c(".004**", ".500")) &&
        identical(.jst_tbl_p(0.0004, "exact", 2), "<.01"))

check("I05 .jst_tbl_stars(): one star per threshold passed, none at the threshold itself; the legend made from the same thresholds",
      identical(.jst_tbl_stars(c(0.05, 0.049, 0.01, 0.0099, 0.001, 0.0009, NA)),
                c("", "*", "*", "**", "**", "***", "")) &&
        identical(.jst_tbl_stars(0.03, stars = c(0.1, 0.05)), "**") &&
        identical(.jst_tbl_stars_legend(), "**p* < .05. ***p* < .01. ****p* < .001.") &&
        identical(.jst_tbl_stars_legend(c(0.05, 0.01)), "**p* < .05. ***p* < .01."))

check("I06 .jst_tbl_mark(): letters a, b, c ... and symbols dagger, double dagger, section sign, then doubled",
      identical(vapply(1:3, .jst_tbl_mark, character(1)), c("a", "b", "c")) &&
        identical(.jst_tbl_mark(27), "a") &&
        identical(vapply(1:4, .jst_tbl_mark, character(1), marks = "symbols"),
                  c("\u2020", "\u2021", "\u00a7", "\u2020\u2020")))

check("I07 the built-in apa style: a key is read from the table type's section, then the general part, and a key nowhere is an internal error",
      identical(.jst_style_key(.jst_style_apa, "descriptives", "columns"),
                c("n", "mean", "sd", "min", "max")) &&
        identical(.jst_style_key(.jst_style_apa, "descriptives", "decimals"), 2) &&
        identical(.jst_style_key(.jst_style_apa, "descriptives", "caption.form"), "apa") &&
        inherits(tryCatch(.jst_style_key(.jst_style_apa, "descriptives", "no.such.key"),
                          error = function(e) e), "error") &&
        inherits(.jst_style_resolve("APA"), "jst_style") &&
        identical(.jst_style_resolve("APA")$layers[[1]][-1], .jst_style_apa))

# =============================================================================
# J. The descriptives table's structure, from a jdesc() result
# =============================================================================
cat("\n--- J. The structure ---\n")

.td <- file.path(tempdir(), "tables_check_out")
unlink(.td, recursive = TRUE); dir.create(.td)
.j0 <- res(jdesc(tcm, WellbeingScore, Income, Age, CommuteTime))$val
.jh <- list("Dependent variable" = "WellbeingScore",
            "Independent variables" = c("Income", "Age"),
            "Control variable" = "CommuteTime")
.j1 <- res(jtable(.j0, print = FALSE))$val
.j2 <- res(jtable(.j0,
                  headings = list("Dependent variable"    = WellbeingScore,
                                  "Independent variables" = c(Income, Age),
                                  "Control variable"      = CommuteTime),
                  markers  = list("Mean-centered" = c(Income, Age)),
                  title    = "Descriptive Statistics for Study Variables",
                  note     = "Wellbeing is scored from 0 to 100.",
                  print    = FALSE))$val
.jvals <- function(v) {
  x  <- as.numeric(tcm[[v]]); na <- attr(tcm[[v]], "na_values", exact = TRUE)
  x[!is.na(x) & !(x %in% na)]
}

check("J01 jtable() on a jdesc() result returns a jst_table: the stub and the apa columns n, M, SD, Min, Max, the statistics' heads italic, one data row per variable in the result's order, each labelled by its variable label",
      inherits(.j1, "jst_table") && identical(.j1$type, "descriptives") &&
        identical(.j1$columns$key, c("stub", "n", "mean", "sd", "min", "max")) &&
        identical(.j1$columns$label, c("Variable", "n", "M", "SD", "Min", "Max")) &&
        identical(.j1$columns$kind, c("text", rep("number", 5))) &&
        identical(.j1$columns$italic, c(FALSE, TRUE, TRUE, TRUE, FALSE, FALSE)) &&
        length(.j1$rows) == 4L &&
        all(vapply(.j1$rows, function(r) identical(r$kind, "data") && r$indent == 0L,
                   logical(1))) &&
        identical(vapply(.j1$rows, `[[`, character(1), "label"),
                  c("Wellbeing score (0-100)", "Annual income (USD)", "Age (years)",
                    "Daily commute time (minutes)")))

check("J02 the cells: n a count, M and SD at 2 decimals with separators, Min and Max at the data's precision; the raw numbers beside them are the statistics of the data, unrounded",
      identical(.j1$rows[[2]]$cells,
                list(n = "97", mean = "49,855.67", sd = "17,427.22",
                     min = "14,000", max = "93,000")) &&
        identical(.j1$rows[[1]]$cells$mean, "50.89") &&
        identical(.j1$rows[[1]]$cells$min, "25") &&
        isTRUE(all.equal(.j1$rows[[2]]$raw$mean, mean(.jvals("Income")))) &&
        isTRUE(all.equal(.j1$rows[[2]]$raw$sd, stats::sd(.jvals("Income")))) &&
        identical(.j1$rows[[2]]$raw$n, length(.jvals("Income"))) &&
        identical(.j1$rows[[1]]$raw$max, max(.jvals("WellbeingScore"))))

check("J03 no headings, no markers: no heading rows, no marks, the type's template title, the general note on N alone",
      !any(vapply(.j1$rows, function(r) identical(r$kind, "heading"), logical(1))) &&
        all(lengths(lapply(.j1$rows, `[[`, "marks")) == 0L) &&
        identical(.j1$caption$title, "Descriptive Statistics") &&
        is.na(.j1$caption$number) &&
        identical(.j1$notes$general, "*N* = 103.") &&
        length(.j1$notes$specific) == 0L && length(.j1$notes$probability) == 0L)

check("J04 headings = puts a heading row before each group, the variables indented under it, in the list's order",
      length(.j2$rows) == 7L &&
        identical(vapply(.j2$rows, `[[`, character(1), "kind"),
                  c("heading", "data", "heading", "data", "data", "heading", "data")) &&
        identical(vapply(.j2$rows, `[[`, character(1), "label"),
                  c("Dependent variable", "Wellbeing score (0-100)",
                    "Independent variables", "Annual income (USD)", "Age (years)",
                    "Control variable", "Daily commute time (minutes)")) &&
        identical(vapply(.j2$rows, `[[`, integer(1), "indent"),
                  c(0L, 1L, 0L, 1L, 1L, 0L, 1L)))

.j2o <- res(jtable(.j0, headings = list(Later = c(CommuteTime, Age),
                                        First = c(WellbeingScore, Income)),
                   print = FALSE))$val
# A workspace object named like a variable changes nothing (ruling R18): the
# bare name is the result's variable; a name that is no variable is read
# for the names it holds.
.j2w <- local({
  Income <- c("Age", "CommuteTime")   # the object, in this frame, not the workspace
  res(jtable(.j0, headings = list(A = c(WellbeingScore, Income), B = c(Age, CommuteTime)),
             print = FALSE))$val
})
.j2h <- local({
  nms <- c("Income", "Age")
  res(jtable(.j0, headings = list(A = WellbeingScore, B = nms, C = CommuteTime),
             print = FALSE))$val
})
check("J05 ... the table follows the headings' order, not the result's; names in quotes and a name holding names read the same; a workspace object named like a variable changes nothing",
      identical(vapply(.j2w$rows, `[[`, character(1), "label"),
                c("A", "Wellbeing score (0-100)", "Annual income (USD)",
                  "B", "Age (years)", "Daily commute time (minutes)")) &&
        identical(vapply(.j2h$rows, `[[`, character(1), "label"),
                  c("A", "Wellbeing score (0-100)", "B", "Annual income (USD)",
                    "Age (years)", "C", "Daily commute time (minutes)")) &&
      identical(vapply(.j2o$rows, `[[`, character(1), "label"),
                c("Later", "Daily commute time (minutes)", "Age (years)",
                  "First", "Wellbeing score (0-100)", "Annual income (USD)")) &&
        identical(res(jtable(.j0, headings = .jh, print = FALSE))$val$rows,
                  .j2$rows[seq_along(.j2$rows)]  |> lapply(function(r) { r$marks <- character(0); r })))

check("J06 markers = marks each named variable's row with the style's letter, in the markers' order, and writes the specific note; the user's title and note are carried",
      identical(.j2$rows[[4]]$marks, "a") && identical(.j2$rows[[5]]$marks, "a") &&
        length(.j2$rows[[2]]$marks) == 0L &&
        identical(.j2$notes$specific, list(list(mark = "a", text = "Mean-centered"))) &&
        identical(.j2$caption$title, "Descriptive Statistics for Study Variables") &&
        identical(.j2$notes$general,
                  c("*N* = 103.", "Wellbeing is scored from 0 to 100.")))

.j7 <- res(jtable(.j0, markers = list("Mean-centered" = c(Income, Age),
                                      "Log-transformed" = Income),
                  print = FALSE))$val
check("J07 two specific notes: a and b, a variable under both carrying both marks",
      identical(.j7$rows[[2]]$marks, c("a", "b")) &&
        identical(.j7$rows[[3]]$marks, "a") &&
        identical(vapply(.j7$notes$specific, `[[`, character(1), "mark"), c("a", "b")) &&
        identical(vapply(.j7$notes$specific, `[[`, character(1), "text"),
                  c("Mean-centered", "Log-transformed")))

.ja <- res(jdesc(tcm, WellbeingScore))$val
.jb <- res(jdesc(tcm, Income, Age))$val
.j8 <- res(jtable(list("Outcome" = .ja, "Predictors" = .jb), print = FALSE))$val
.j8u <- res(jtable(list(.ja, .jb), print = FALSE))$val
check("J08 a NAMED list of jdesc() results stacks into one table under the names as headings; an unnamed list stacks with no headings",
      identical(vapply(.j8$rows, `[[`, character(1), "label"),
                c("Outcome", "Wellbeing score (0-100)", "Predictors",
                  "Annual income (USD)", "Age (years)")) &&
        identical(vapply(.j8$rows, `[[`, character(1), "kind"),
                  c("heading", "data", "heading", "data", "data")) &&
        identical(.j8$notes$general, "*N* = 103.") &&
        length(.j8u$rows) == 3L &&
        all(vapply(.j8u$rows, function(r) identical(r$kind, "data"), logical(1))))

.j9 <- res(jtable(.j0, headings = list("Some" = c(WellbeingScore, Income)), print = FALSE))
check("J09 headings = that leaves a variable out stops, naming the variables left out (nothing is dropped silently)",
      is.null(.j9$val) &&
        grepl("jtable(): headings = leaves out Age and CommuteTime.", .j9$txt, fixed = TRUE) &&
        grepl("Name every variable of the result under a heading, or leave", .j9$txt, fixed = TRUE))

.j10 <- res(jtable(.j0, headings = list("Some" = c(WellbeingScore, Agee, Income)), print = FALSE))
.j10b <- res(jtable(.j0, markers = list("Centered" = c(Income, Income)), print = FALSE))
check("J10 a name the result does not hold stops, listing the result's variables; a name given twice stops",
      is.null(.j10$val) &&
        grepl("headings = names Agee, which is not among the variables of", .j10$txt, fixed = TRUE) &&
        grepl("The result holds WellbeingScore, Income, Age, and CommuteTime.", .j10$txt, fixed = TRUE) &&
        is.null(.j10b$val) &&
        grepl("markers = names Income more than once.", .j10b$txt, fixed = TRUE))

.j11 <- res(jtable(.j0, headings = list(c(WellbeingScore, Income)), print = FALSE))
.j11b <- res(jtable(.j0, markers = "Income", print = FALSE))
check("J11 an item with no name stops with the example; a value that is not a list stops with the example",
      is.null(.j11$val) &&
        grepl("each item of headings = needs a name, the heading's text,", .j11$txt, fixed = TRUE) &&
        grepl("  headings = list(\"Outcome\" = Wellbeing, \"Predictors\" = c(Age, Income))",
              .j11$txt, fixed = TRUE) &&
        is.null(.j11b$val) &&
        grepl("markers = takes a named list of variable names,", .j11b$txt, fixed = TRUE) &&
        grepl("markers = list(\"Mean-centered\" = c(Age, Income))", .j11b$txt, fixed = TRUE))

.j12 <- res(jtable(res(jcorr(tcm, Age, Income))$val, print = FALSE))
.j12b <- res(jtable(tcm, print = FALSE))
.j12c <- res(jtable(list(.j0, .a1), print = FALSE))
.j12d <- res(jtable(list(), print = FALSE))
check("J12 a result of another kind stops, naming its function; a data frame is not a result; results of two kinds in one list stop; an empty list stops",
      is.null(.j12$val) &&
        grepl("jtable() does not yet make a table from a jcorr() result.", .j12$txt, fixed = TRUE) &&
        grepl("It makes a table from a jdesc() or jfreq() result.", .j12$txt, fixed = TRUE) &&
        is.null(.j12b$val) &&
        grepl("jtable() takes a saved result -- what an analysis function", .j12b$txt, fixed = TRUE) &&
        grepl("  d1 <- jdesc(community, Age, Income)", .j12b$txt, fixed = TRUE) &&
        is.null(.j12c$val) &&
        grepl("(jdesc() and jfreq()) in one table.", .j12c$txt, fixed = TRUE) &&
        is.null(.j12d$val) && grepl("the list given to jtable() is empty.", .j12d$txt, fixed = TRUE))

.j13 <- res(jtable(.d1, print = FALSE))
.j13o <- local({ old <- .j0; old$descriptives_raw <- NULL; attr(old, "jstats_version") <- "0.9.200"
                 res(jtable(old, print = FALSE)) })
.j13n <- local({ old <- .j0; old$descriptives_raw <- NULL; attr(old, "jstats_version") <- NULL
                 res(jtable(old, print = FALSE)) })
check("J13 a grouped jdesc(by =) result stops in this build; a result without the fields names the version that made it, or 'an earlier version' with no stamp",
      is.null(.j13$val) &&
        grepl("does not yet make a table from a grouped", .j13$txt, fixed = TRUE) &&
        is.null(.j13o$val) &&
        grepl("this jdesc() result was made by jstats 0.9.200, before the", .j13o$txt, fixed = TRUE) &&
        grepl("Run the analysis again, then jtable() on the new result.", .j13o$txt, fixed = TRUE) &&
        is.null(.j13n$val) &&
        grepl("was made by an earlier version of", .j13n$txt, fixed = TRUE))

.j14 <- res(jtable(.j0, headinggs = .jh, print = FALSE))
.j14b <- res(jtable(.j0, notes = "x", print = FALSE))
.j14c <- res(jtable(.j0, style = apa, print = FALSE))
.j14d <- res(jtable(.j0, style = "journal", print = FALSE))
.j14e <- res(jtable(.j0, file = Table1.docx, print = FALSE))
.j14f <- res(jtable(.j0, file = "Table1.txt", print = FALSE))
.j14g <- res(jtable(.j0, overwrite = "yes", print = FALSE))
.j14h <- res(jtable(.j0, title = c("a", "b"), print = FALSE))
check("J14 the front door: an unused input, the pointer for notes =, a bare word in style = or file =, a style that is not apa, a file without .docx, a flag that is not TRUE or FALSE, a title that is not one string",
      grepl("jtable(): unused input: headinggs", .j14$txt, fixed = TRUE) &&
        grepl("'notes' is not valid.\nDid you mean `note`?", .j14b$txt, fixed = TRUE) &&
        grepl("jtable(): apa is not in quotes.\nstyle = takes a style name in quotes:",
              .j14c$txt, fixed = TRUE) &&
        grepl("  jtable(.j0, style = \"apa\", print = FALSE)", .j14c$txt, fixed = TRUE) &&
        grepl("jtable(): no style named \"journal\" was found.", .j14d$txt, fixed = TRUE) &&
        grepl("jtable(): Table1.docx is not in quotes.\nfile = takes a file name in quotes:",
              .j14e$txt, fixed = TRUE) &&
        grepl("  jtable(.j0, file = \"Table1.docx\", print = FALSE)", .j14e$txt, fixed = TRUE) &&
        grepl("jtable(): jtable() writes Word files, so the file name needs the", .j14f$txt, fixed = TRUE) &&
        grepl("  file = \"Table1.docx\"", .j14f$txt, fixed = TRUE) &&
        grepl("`overwrite` must be TRUE or FALSE.", .j14g$txt, fixed = TRUE) &&
        grepl("`title` must be a single quoted string.", .j14h$txt, fixed = TRUE))

# A nested analysis call runs quietly: only the table prints.
.j15 <- res(jtable(jdesc(tcm, Age), print = FALSE))
check("J15 a nested analysis call, jtable(jdesc(...)), runs with its output discarded and gives the table",
      inherits(.j15$val, "jst_table") && !grepl("Descriptive Statistics\n", .j15$txt, fixed = TRUE) &&
        identical(.j15$val$rows[[1]]$label, "Age (years)"))

# =============================================================================
# K. The preview
# =============================================================================
cat("\n--- K. The preview ---\n")

.k1 <- res(jtable(.j0,
                  headings = list("Dependent variable"    = WellbeingScore,
                                  "Independent variables" = c(Income, Age),
                                  "Control variable"      = CommuteTime),
                  markers  = list("Mean-centered" = c(Income, Age)),
                  title    = "Descriptive Statistics for Study Variables",
                  note     = "Wellbeing is scored from 0 to 100."))
.k1l <- strsplit(.k1$txt, "\n", fixed = TRUE)[[1]]
check("K01 the preview, pinned whole: the two caption lines, the rules, the header, the headings and the indented rows, the notes, one blank line at the end",
      endsWith(.k1$txt, "Mean-centered.\n") && identical(.k1l, c(
        "Table 1",
        "Descriptive Statistics for Study Variables",
        "-------------------------------------------------------------------------",
        "Variable                         n       M          SD       Min     Max",
        "-------------------------------------------------------------------------",
        "Dependent variable",
        "  Wellbeing score (0-100)       103      50.89      11.48      25      81",
        "Independent variables",
        "  Annual income (USD)^a          97  49,855.67  17,427.22  14,000  93,000",
        "  Age (years)^a                 103      40.65      11.62      18      71",
        "Control variable",
        "  Daily commute time (minutes)  103      30.74      12.68       5      58",
        "-------------------------------------------------------------------------",
        "Note. N = 103. Wellbeing is scored from 0 to 100.",
        "^a Mean-centered.")))

.k2 <- vapply(c(7, 9, 10, 12), function(i) regexpr(".", .k1l[i], fixed = TRUE), integer(1))
check("K02 the numbers align on the decimal point: the M column's points sit in one console column down the table, and the column heads are centered over their columns",
      length(unique(.k2)) == 1L &&
        identical(regexpr("M", .k1l[4], fixed = TRUE)[1] > regexpr("n", .k1l[4], fixed = TRUE)[1], TRUE) &&
        identical(nchar(.k1l[3]), nchar(.k1l[5])) && identical(nchar(.k1l[3]), nchar(.k1l[13])))

.k3 <- res(print(.j2))
check("K03 print() on the table reprints the preview, the same text",
      identical(.k3$txt, .k1$txt))

.k4a <- res(jtable(.j0, print = FALSE))
invisible(utils::capture.output(suppressMessages(joutput("silent"))))
.k4b <- res(jtable(.j0))
.k4c <- res(jtable(.j0, print = TRUE))
invisible(utils::capture.output(suppressMessages(joutput(NULL))))
options(.jst_options_message_width = .pin_width)
check("K04 print = FALSE prints nothing; under joutput(\"silent\") the default prints nothing and print = TRUE prints; the table is returned either way",
      identical(.k4a$txt, "") && inherits(.k4a$val, "jst_table") &&
        identical(.k4b$txt, "") && inherits(.k4b$val, "jst_table") &&
        grepl("^Table 1\nDescriptive Statistics\n", .k4c$txt))

.k5 <- res(jtable(.j0, note = "Centered at the *mean*."))$val
.k5l <- .jst_table_note_lines(.k5, .jst_style_apa, plain = TRUE)
check("K05 the note markup: *italic* and ^superscript^ are kept for the Word writer and stripped for the preview, a letter mark written ^a",
      identical(.jst_table_note_lines(.k5, .jst_style_apa),
                c("*Note.* *N* = 103. Centered at the *mean*.")) &&
        identical(.k5l, "Note. N = 103. Centered at the mean.") &&
        identical(.jst_table_note_lines(.j2, .jst_style_apa),
                  c("*Note.* *N* = 103. Wellbeing is scored from 0 to 100.",
                    "^a^ Mean-centered.")) &&
        identical(.jst_table_note_lines(.j2, .jst_style_apa, plain = TRUE)[2], "^a Mean-centered."))

# A column narrower than its head: the one-digit values sit right-aligned
# under the centered head, the head's spare space on the left.
.k6 <- local({
  w <- data.frame(x = 1:9); attr(w$x, "label") <- "x"
  res(jtable(res(jdesc(w, x))$val))
})
.k6l <- strsplit(.k6$txt, "\n", fixed = TRUE)[[1]]
check("K06 a number column narrower than its head: the values right-aligned under the centered head",
      identical(.k6l[4:6], c("Variable  n    M    SD   Min  Max",
                             "---------------------------------",
                             "x         9  5.00  2.74    1    9")))

# =============================================================================
# L. The Word file
# =============================================================================
cat("\n--- L. The Word file ---\n")

.lf <- file.path(.td, "Table1.docx")
.l1 <- res(jtable(.j0,
                  headings = list("Dependent variable"    = WellbeingScore,
                                  "Independent variables" = c(Income, Age),
                                  "Control variable"      = CommuteTime),
                  markers  = list("Mean-centered" = c(Income, Age)),
                  title    = "Descriptive Statistics for Study Variables",
                  note     = "Wellbeing is scored from 0 to 100.",
                  file     = .lf, overwrite = TRUE))
.lz <- utils::unzip(.lf, list = TRUE)
.lx <- file.path(.td, "x"); unlink(.lx, recursive = TRUE)
invisible(utils::unzip(.lf, exdir = .lx))
.ldoc <- paste(readLines(file.path(.lx, "word", "document.xml"), warn = FALSE,
                         encoding = "UTF-8"), collapse = "\n")
.lsty <- paste(readLines(file.path(.lx, "word", "styles.xml"), warn = FALSE,
                         encoding = "UTF-8"), collapse = "\n")
check("L01 file = writes a .docx: a zip of the five parts, the content types first; the written line follows the preview",
      file.exists(.lf) &&
        identical(.lz$Name, c("[Content_Types].xml", "_rels/.rels",
                              "word/_rels/document.xml.rels", "word/document.xml",
                              "word/styles.xml")) &&
        grepl("^a Mean-centered.\n\nTable written to", .l1$txt, fixed = TRUE) &&
        grepl(paste0("Table written to ", .jst_norm_path(.lf)),
              gsub("\\s+", " ", .l1$txt), fixed = TRUE))

.ltag <- function(x, tag) {
  c(open = lengths(regmatches(x, gregexpr(paste0("<", tag, "[ >]"), x))),
    close = lengths(regmatches(x, gregexpr(paste0("</", tag, ">"), x))))
}
check("L02 document.xml is one table of 10 rows (the caption row, the header, three headings and four variables, the note row): every tag closed, the body's one w:tbl, a gridCol per column, each row's cells spanning the six columns",
      all(vapply(c("w:document", "w:body", "w:tbl", "w:tr", "w:tc", "w:p", "w:r", "w:t"),
                 function(t) { n <- .ltag(.ldoc, t); n[["open"]] == n[["close"]] }, logical(1))) &&
        .ltag(.ldoc, "w:tbl")[["open"]] == 1L &&
        .ltag(.ldoc, "w:tr")[["open"]] == 10L &&
        lengths(regmatches(.ldoc, gregexpr("<w:gridCol ", .ldoc))) == 6L &&
        all(vapply(regmatches(.ldoc, gregexpr("<w:tr>.*?</w:tr>", .ldoc))[[1]], function(r) {
          cells <- lengths(regmatches(r, gregexpr("<w:tc>", r)))
          spans <- as.integer(unlist(regmatches(r, gregexpr("(?<=<w:gridSpan w:val=\")[0-9]+", r, perl = TRUE))))
          cells - length(spans) + sum(spans) == 6L
        }, logical(1))))

check("L03 the caption is the table's FIRST ROW (apa's default since the S400 walk): one cell spanning the table with no borders, two paragraphs in it -- the first on Word's SEQ Table field with the cached number 1 in bold, the second the title in italics, kept with the next -- and no caption paragraph outside the table",
      grepl("<w:pStyle w:val=\"Caption\"/><w:keepNext/>", .ldoc, fixed = TRUE) &&
        grepl("<w:instrText xml:space=\"preserve\"> SEQ Table \\* ARABIC </w:instrText>", .ldoc, fixed = TRUE) &&
        grepl("<w:fldChar w:fldCharType=\"separate\"/></w:r><w:r><w:rPr><w:b/><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\">1</w:t></w:r>", .ldoc, fixed = TRUE) &&
        grepl("<w:rPr><w:i/><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\">Descriptive Statistics for Study Variables</w:t>", .ldoc, fixed = TRUE) &&
        regexpr("<w:tbl>", .ldoc, fixed = TRUE) < regexpr("SEQ Table", .ldoc, fixed = TRUE) &&
        !grepl("Caption", sub("<w:tbl>.*$", "", .ldoc), fixed = TRUE) &&
        grepl("^<w:tr><w:trPr><w:cantSplit/><w:tblHeader/></w:trPr><w:tc><w:tcPr><w:tcW w:w=\"[0-9]+\" w:type=\"dxa\"/><w:gridSpan w:val=\"6\"/><w:tcBorders><w:top w:val=\"nil\"/><w:left w:val=\"nil\"/><w:bottom w:val=\"nil\"/><w:right w:val=\"nil\"/></w:tcBorders>",
              regmatches(.ldoc, gregexpr("<w:tr>.*?</w:tr>", .ldoc))[[1]][1]))

check("L04 the caption row and the header row repeat across pages (Word repeats a table's top rows), the stub head flush left and the statistics' heads centered, n, M and SD in italics, Min and Max upright",
      grepl("<w:trPr><w:cantSplit/><w:tblHeader/></w:trPr>", .ldoc, fixed = TRUE) &&
        lengths(regmatches(.ldoc, gregexpr("<w:tblHeader/>", .ldoc))) == 2L &&
        grepl("<w:jc w:val=\"left\"/></w:pPr><w:r><w:rPr><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\">Variable</w:t>", .ldoc, fixed = TRUE) &&
        grepl("<w:jc w:val=\"center\"/></w:pPr><w:r><w:rPr><w:i/><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\">SD</w:t>", .ldoc, fixed = TRUE) &&
        grepl("<w:jc w:val=\"center\"/></w:pPr><w:r><w:rPr><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\">Max</w:t>", .ldoc, fixed = TRUE))

check("L05 the rules are APA's: a rule above and below the header cells and under the last row's cells (18 edges), no vertical rule, every other edge nil, the table's own borders nil",
      lengths(regmatches(.ldoc, gregexpr("w:val=\"single\" w:sz=\"8\"", .ldoc))) == 18L &&
        lengths(regmatches(.ldoc, gregexpr("<w:top w:val=\"single\"", .ldoc))) == 6L &&
        lengths(regmatches(.ldoc, gregexpr("<w:bottom w:val=\"single\"", .ldoc))) == 12L &&
        !grepl("<w:left w:val=\"single\"", .ldoc, fixed = TRUE) &&
        !grepl("<w:right w:val=\"single\"", .ldoc, fixed = TRUE) &&
        grepl("<w:tblBorders><w:top w:val=\"nil\"/><w:left w:val=\"nil\"/><w:bottom w:val=\"nil\"/><w:right w:val=\"nil\"/><w:insideH w:val=\"nil\"/><w:insideV w:val=\"nil\"/></w:tblBorders>", .ldoc, fixed = TRUE))

check("L06 a heading row spans the table in italics; a row under it is indented 180 twips; a mark is a superscript run after the label",
      grepl("<w:gridSpan w:val=\"6\"/>", .ldoc, fixed = TRUE) &&
        grepl("<w:rPr><w:i/><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\">Independent variables</w:t>", .ldoc, fixed = TRUE) &&
        grepl("<w:ind w:left=\"180\"/></w:pPr><w:r><w:rPr><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\">Annual income (USD)</w:t></w:r><w:r><w:rPr><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/><w:vertAlign w:val=\"superscript\"/></w:rPr><w:t xml:space=\"preserve\">a</w:t></w:r>", .ldoc, fixed = TRUE) &&
        lengths(regmatches(.ldoc, gregexpr("<w:ind w:left=\"180\"/>", .ldoc))) == 4L)

check("L07 every number sits on a decimal tab stop in its cell, with no tab character, the stop short of the cell's right edge",
      lengths(regmatches(.ldoc, gregexpr("<w:tab w:val=\"decimal\" w:pos=\"", .ldoc))) == 20L &&
        !grepl("<w:tab/>", .ldoc, fixed = TRUE) &&
        grepl("<w:tabs><w:tab w:val=\"decimal\" w:pos=\"[0-9]+\"/></w:tabs><w:spacing [^>]*/></w:pPr><w:r><w:rPr><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\">49,855.67</w:t>", .ldoc) &&
        local({
          cells <- regmatches(.ldoc, gregexpr("<w:tc><w:tcPr><w:tcW w:w=\"[0-9]+\"[^>]*>.*?</w:tc>", .ldoc))[[1]]
          ok <- TRUE
          for (cl in cells) {
            w <- as.integer(sub(".*<w:tcW w:w=\"([0-9]+)\".*", "\\1", cl))
            p <- regmatches(cl, gregexpr("(?<=w:pos=\")[0-9]+", cl, perl = TRUE))[[1]]
            if (length(p) && any(as.integer(p) >= w - 216L)) ok <- FALSE
          }
          ok
        }))

check("L08 the notes are the table's LAST ROW, under the bottom rule: the italic Note. and N, the user's sentence, then the specific note with its superscript a; no note paragraph outside the table",
      grepl("<w:r><w:rPr><w:i/><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\">Note.</w:t></w:r><w:r><w:rPr><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\"> </w:t></w:r><w:r><w:rPr><w:i/><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\">N</w:t></w:r><w:r><w:rPr><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\"> = 103. Wellbeing is scored from 0 to 100.</w:t></w:r>", .ldoc, fixed = TRUE) &&
        grepl("<w:vertAlign w:val=\"superscript\"/></w:rPr><w:t xml:space=\"preserve\">a</w:t></w:r><w:r><w:rPr><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\"> Mean-centered.</w:t>", .ldoc, fixed = TRUE) &&
        regexpr("Mean-centered.", .ldoc, fixed = TRUE) < regexpr("</w:tbl>", .ldoc, fixed = TRUE) &&
        regexpr("Mean-centered.", .ldoc, fixed = TRUE) > regexpr("Daily commute time", .ldoc, fixed = TRUE) &&
        !grepl("Mean-centered", sub("^.*</w:tbl>", "", .ldoc), fixed = TRUE))

check("L09 the page: A4 portrait with one-inch margins; the styles part sets Times New Roman 12 for every script and the Normal and Caption styles",
      grepl("<w:sectPr><w:pgSz w:w=\"11906\" w:h=\"16838\"/><w:pgMar w:top=\"1440\" w:right=\"1440\" w:bottom=\"1440\" w:left=\"1440\"", .ldoc, fixed = TRUE) &&
        grepl("<w:rFonts w:ascii=\"Times New Roman\" w:hAnsi=\"Times New Roman\" w:cs=\"Times New Roman\" w:eastAsia=\"Times New Roman\"/><w:sz w:val=\"24\"/>", .lsty, fixed = TRUE) &&
        grepl("w:styleId=\"Normal\"", .lsty, fixed = TRUE) && grepl("w:styleId=\"Caption\"", .lsty, fixed = TRUE))

# The XML pinned whole: a build that changes the writer re-pins these.
# S401 (v0.9.271): document.xml re-pinned for the decimal tabs, which center
# each column's block of numbers (every one of the 20 stops 20 twips to the
# left in this table; nothing else in the part moved).
check("L10 document.xml and styles.xml pinned by their checksums",
      identical(unname(tools::md5sum(file.path(.lx, "word", "document.xml"))), "dfe328f1530d3aa51da7c818279388aa") &&
        identical(unname(tools::md5sum(file.path(.lx, "word", "styles.xml"))), "48761045aed48494802a638a03d41c3e"))

# The caption and the notes as PARAGRAPHS (the alternative placement), the
# journal caption form, the symbol marks, the rules and fills a report
# style sets.
.lsr <- .jst_style_apa
.lsr$general$caption.position <- "paragraph"; .lsr$general$note.position <- "paragraph"
.lsr$general$caption.form <- "journal"; .lsr$general$marks <- "symbols"
.lsr$general$rules <- "grid"; .lsr$general$header.fill <- "1F3864"
.lsr$general$header.text <- "FFFFFF"; .lsr$general$header.bold <- "yes"
.lsr$general$band.fill <- "F2F2F2"; .lsr$general$landscape <- "yes"
.lsr$general$paper <- "letter"
.lr <- .jst_table_build_desc(list(.j0), .lsr, headings = .jh,
                             markers = list("Mean-centered" = c("Income", "Age")))
.lrf <- file.path(.td, "rows.docx")
.jst_docx_pack(.jst_docx_parts(list(.lr), .lsr), .lrf)
.lrx <- file.path(.td, "xr"); unlink(.lrx, recursive = TRUE)
invisible(utils::unzip(.lrf, exdir = .lrx))
.lrd <- paste(readLines(file.path(.lrx, "word", "document.xml"), warn = FALSE,
                        encoding = "UTF-8"), collapse = "\n")
check("L11 caption.position = paragraph and note.position = paragraph: the caption is a paragraph before the table (Word's Caption style), the notes paragraphs after it, the header row alone repeated; the journal form puts bold 'Table 1.' and the title on one line",
      .ltag(.lrd, "w:tr")[["open"]] == 8L &&
        lengths(regmatches(.lrd, gregexpr("<w:tblHeader/>", .lrd))) == 1L &&
        regexpr("SEQ Table", .lrd, fixed = TRUE) < regexpr("<w:tbl>", .lrd, fixed = TRUE) &&
        regexpr("Mean-centered.", .lrd, fixed = TRUE) > regexpr("</w:tbl>", .lrd, fixed = TRUE) &&
        grepl("<w:t xml:space=\"preserve\">.</w:t></w:r><w:r><w:rPr><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\"> Descriptive Statistics</w:t>", .lrd, fixed = TRUE) &&
        grepl("<w:pStyle w:val=\"Caption\"/>", sub("<w:tbl>.*$", "", .lrd), fixed = TRUE))

check("L12 ... symbol marks: the dagger on the marked rows and in the note; a grid draws every edge; the header fill and text colour, bold heads; banded rows; a landscape Letter page",
      grepl(paste0("<w:vertAlign w:val=\"superscript\"/></w:rPr><w:t xml:space=\"preserve\">", "\u2020", "</w:t>"), .lrd, fixed = TRUE) &&
        lengths(regmatches(.lrd, gregexpr("<w:left w:val=\"single\"", .lrd))) >= 20L &&
        grepl("<w:shd w:val=\"clear\" w:color=\"auto\" w:fill=\"1F3864\"/>", .lrd, fixed = TRUE) &&
        grepl("<w:b/><w:i/><w:color w:val=\"FFFFFF\"/>", .lrd, fixed = TRUE) &&
        grepl("<w:shd w:val=\"clear\" w:color=\"auto\" w:fill=\"F2F2F2\"/>", .lrd, fixed = TRUE) &&
        grepl("<w:pgSz w:w=\"15840\" w:h=\"12240\" w:orient=\"landscape\"/>", .lrd, fixed = TRUE))

# landscape = auto: a table wider than the portrait text width turns the page.
.lw <- local({
  w <- data.frame(A = 1:12, B = 1:12 * 2)
  attr(w$A, "label") <- paste(rep("A very long variable label", 5), collapse = " ")
  attr(w$B, "label") <- "B"
  res(jdesc(w, A, B))$val
})
.lwf <- file.path(.td, "wide.docx")
invisible(res(jtable(.lw, file = .lwf, overwrite = TRUE, print = FALSE)))
.lwx <- file.path(.td, "xw"); unlink(.lwx, recursive = TRUE)
invisible(utils::unzip(.lwf, exdir = .lwx))
.lwd <- paste(readLines(file.path(.lwx, "word", "document.xml"), warn = FALSE,
                        encoding = "UTF-8"), collapse = "\n")
check("L13 landscape = auto: a table whose natural width passes the portrait text width is written on a landscape page, its columns shrunk to the page when they pass even that",
      grepl("w:orient=\"landscape\"", .lwd, fixed = TRUE) &&
        sum(as.integer(regmatches(.lwd, gregexpr("(?<=<w:gridCol w:w=\")[0-9]+", .lwd, perl = TRUE))[[1]])) <= 16838L - 2880L)

# A negative statistic carries the minus sign in the file and a hyphen in
# the preview.
.ln <- local({
  w <- data.frame(Change = c(-3.5, -1.25, -2, -4.75)); attr(w$Change, "label") <- "Change"
  res(jdesc(w, Change))
})
.lnt <- res(jtable(.ln$val, file = file.path(.td, "neg.docx"), overwrite = TRUE))
.lnx <- file.path(.td, "xn"); unlink(.lnx, recursive = TRUE)
invisible(utils::unzip(file.path(.td, "neg.docx"), exdir = .lnx))
.lnd <- paste(readLines(file.path(.lnx, "word", "document.xml"), warn = FALSE,
                        encoding = "UTF-8"), collapse = "\n")
check("L14 a negative value: the minus sign (U+2212) in the file's cells, a hyphen in the preview; Min and Max keep the data's two places",
      grepl(paste0("<w:t xml:space=\"preserve\">", "\u2212", "2.88</w:t>"), .lnd, fixed = TRUE) &&
        grepl(paste0("<w:t xml:space=\"preserve\">", "\u2212", "4.75</w:t>"), .lnd, fixed = TRUE) &&
        !grepl("\u2212", .lnt$txt, fixed = TRUE) &&
        grepl("Change    4  -2.88  1.56  -4.75  -1.25", .lnt$txt, fixed = TRUE))

# The overwrite gate, where the session cannot ask.
.lo <- res(.jst_table_overwrite_gate(.lf, overwrite = FALSE, ask = FALSE))
.lo2 <- res(.jst_table_overwrite_gate(.lf, overwrite = TRUE, ask = FALSE))
.lo3 <- res(.jst_table_overwrite_gate(file.path(.td, "new.docx"), overwrite = FALSE, ask = FALSE))
check("L15 a file that exists, overwrite = FALSE, where the session cannot ask: the stop names the path and both ways out; overwrite = TRUE and a new name pass",
      is.null(.lo$val) &&
        grepl(paste0("jtable(): this file already exists:\n  ", .jst_norm_path(.lf), "\n",
                     "To keep the file, save under another file name.\n",
                     "To replace it, add overwrite = TRUE to the call, then run it again."),
              .lo$txt, fixed = TRUE) &&
        isTRUE(.lo2$val) && isTRUE(.lo3$val))

# A single file holding two tables: numbered in order, a paragraph between.
.l2f <- file.path(.td, "two.docx")
.jst_docx_pack(.jst_docx_parts(list(.j2, .j1), .jst_style_apa), .l2f)
.l2x <- file.path(.td, "x2"); unlink(.l2x, recursive = TRUE)
invisible(utils::unzip(.l2f, exdir = .l2x))
.l2d <- paste(readLines(file.path(.l2x, "word", "document.xml"), warn = FALSE,
                        encoding = "UTF-8"), collapse = "\n")
check("L16 two tables in one file: two SEQ fields cached 1 and 2, two tables each holding its caption and notes, one empty paragraph between them so Word keeps them apart",
      .ltag(.l2d, "w:tbl")[["open"]] == 2L &&
        lengths(regmatches(.l2d, gregexpr("SEQ Table", .l2d))) == 2L &&
        grepl("<w:t xml:space=\"preserve\">2</w:t>", .l2d, fixed = TRUE) &&
        lengths(regmatches(.l2d, gregexpr("</w:tbl><w:p><w:pPr><w:spacing [^>]*/></w:pPr></w:p><w:tbl>", .l2d))) == 1L &&
        !grepl("</w:tbl><w:p><w:pPr><w:spacing [^>]*/></w:pPr><w:r>", .l2d))

# A built table given back to jtable(): previewed and written as it is.
.lb <- res(jtable(.j2, file = file.path(.td, "built.docx"), overwrite = TRUE))
.lbx <- file.path(.td, "xb"); unlink(.lbx, recursive = TRUE)
invisible(utils::unzip(file.path(.td, "built.docx"), exdir = .lbx))
.lb2 <- res(jtable(list(.j2, .j1), file = file.path(.td, "built2.docx"), overwrite = TRUE))
.lb2x <- file.path(.td, "xb2"); unlink(.lb2x, recursive = TRUE)
invisible(utils::unzip(file.path(.td, "built2.docx"), exdir = .lb2x))
.lb2d <- paste(readLines(file.path(.lb2x, "word", "document.xml"), warn = FALSE,
                         encoding = "UTF-8"), collapse = "\n")
.lb3 <- res(jtable(list(.j2, .j0), print = FALSE))
.lb4 <- res(jtable(.j2, title = "New", print = FALSE))
check("L17 a built table given to jtable() is previewed and written as it is, the same file; a list of two is previewed as Tables 1 and 2 and written to one file; a table beside a result, or with a title, stops",
      identical(sub("Table written to.*$", "", .lb$txt),
                sub("Table written to.*$", "", .l1$txt)) && inherits(.lb$val, "jst_table") &&
        identical(unname(tools::md5sum(file.path(.lbx, "word", "document.xml"))),
                  unname(tools::md5sum(file.path(.lx, "word", "document.xml")))) &&
        grepl("^Table 1\n", .lb2$txt) && grepl("\nTable 2\nDescriptive Statistics\n", .lb2$txt) &&
        grepl("\nTables written to", .lb2$txt) && length(.lb2$val) == 2L &&
        .ltag(.lb2d, "w:tbl")[["open"]] == 2L &&
        is.null(.lb3$val) &&
        grepl("jtable() takes built tables or saved results in one", .lb3$txt, fixed = TRUE) &&
        is.null(.lb4$val) &&
        grepl("belong to the", .lb4$txt, fixed = TRUE) && grepl("keeps its own.", .lb4$txt, fixed = TRUE))

# =============================================================================
# M. output.dir: the setting, and where jtable() writes
# =============================================================================
cat("\n--- M. output.dir ---\n")

.entry_od <- getOption(".jst_options_output_dir")
options(.jst_options_output_dir = NULL)
.m0 <- .strip_ansi(suppressMessages(utils::capture.output(joptions())))
check("M01 the full panel has nine rows (two since S401): Output folder after Data folder, 'Working directory' when unset",
      identical(.m0[1:10], c("Options Settings",
                             "Missing-value convention: None selected",
                             "SPSS-style missing value codes: -99, -98, -97",
                             "Data folder: Working directory",
                             "Output folder: Working directory",
                             "Style: apa",
                             "Style folder: Not set",
                             "Correlation layout: wide",
                             "Missing-value detail: per_code",
                             "Message width: 76")))

.mo <- file.path(.td, "Tables"); unlink(.mo, recursive = TRUE)
.m1 <- res(joptions(output.dir = .mo))
check("M02 joptions(output.dir = ) creates the folder, echoes the one slot and notes the folder, in jsave()'s data.dir form; the setting is stored under its own key",
      dir.exists(.mo) &&
        identical(.strip_ansi(strsplit(.m1$txt, "\n", fixed = TRUE)[[1]])[1:4],
                  c("Options Settings", paste0("Output folder: ", .mo),
                    "Run joptions() to see all settings.", "")) &&
        any(grepl(paste0("Created the output folder:\n  ", .mo), vapply(.seen, `[[`, "", "text"), fixed = TRUE)) &&
        identical(getOption(".jst_options_output_dir"), .mo) &&
        ".jst_options_output_dir" %in% .jst_session_option_keys)

.m3 <- res(jtable(.j0, file = "bare.docx", print = FALSE))
.m3b <- res(jtable(.j0, file = file.path(.td, "elsewhere.docx"), print = FALSE))
check("M03 a bare file name goes in the output folder; a path with a folder goes where it says",
      file.exists(file.path(.mo, "bare.docx")) &&
        file.exists(file.path(.td, "elsewhere.docx")) && !file.exists(file.path(.mo, "elsewhere.docx")))

unlink(.mo, recursive = TRUE)
.m4 <- res(jtable(.j0, file = "again.docx", print = FALSE))
check("M04 an output folder removed after it was set is created again at the write, with the note",
      dir.exists(.mo) && file.exists(file.path(.mo, "again.docx")) &&
        any(grepl(paste0("Created the output folder:\n  ", .mo), vapply(.seen, `[[`, "", "text"), fixed = TRUE)))

.m5 <- res(jtable(.j0, file = file.path(.td, "no_such_folder", "t.docx"), print = FALSE))
check("M05 a path whose folder does not exist stops before anything is written",
      is.null(.m5$val) &&
        grepl(paste0("jtable(): the folder does not exist:\n  ", .jst_norm_path(file.path(.td, "no_such_folder"))),
              .m5$txt, fixed = TRUE))

.m6 <- res(joptions(output.dir = NULL))
.m6b <- res(joptions(output.dir = "NULL"))
.m6c <- res(joptions(output.dir = 42))
.m6d <- res(joptions(output.dir = Tables))
check("M06 output.dir = NULL clears the folder (and \"\" would); the typo guard, a value that is not a string, and a folder typed bare stop as data.dir's do",
      is.null(getOption(".jst_options_output_dir")) &&
        grepl("Output folder: Working directory", .m6$txt, fixed = TRUE) &&
        grepl("joptions(): output.dir = \"NULL\" looks like a typo.", .m6b$txt, fixed = TRUE) &&
        grepl("joptions(): output.dir must be a single character string,", .m6c$txt, fixed = TRUE) &&
        grepl("joptions(): Tables is not in quotes.\noutput.dir = takes a folder name in quotes:", .m6d$txt, fixed = TRUE) &&
        grepl("  joptions(output.dir = \"Tables\")", .m6d$txt, fixed = TRUE))

options(.jst_options_output_dir = .entry_od)
unlink(.td, recursive = TRUE)

# =============================================================================
# N. Style files: the reader, the lookup, based.on (build 2, S401)
# =============================================================================
cat("\n--- N. Style files ---\n")

# Every style this battery reads is written into a folder of its own, set
# as the style folder; the per-user folder is pointed at a temporary one
# (R_USER_DATA_DIR), so nothing is written into the user's own folders.
# All three are handed back at the foot.
.ns <- file.path(tempdir(), "tables_check_styles"); unlink(.ns, recursive = TRUE)
dir.create(.ns)
.nu <- file.path(tempdir(), "tables_check_user"); unlink(.nu, recursive = TRUE)
Sys.setenv(R_USER_DATA_DIR = .nu)
.nud <- tools::R_user_dir("jstats", "data")
options(.jst_options_style = NULL, .jst_options_style_dir = .ns)
.wsty <- function(name, ..., dir = .ns) {
  p <- file.path(dir, paste0(name, ".jstyle"))
  writeBin(charToRaw(enc2utf8(paste0(paste(c(...), collapse = "\n"), "\n"))), p)
  invisible(p)
}
.nf1 <- res(jfreq(tcm, Education, Region, Smoker))$val

check("N01 the settings' spec and the built-in apa list name the same settings in every part, in one order, and every apa value passes its own check unchanged",
      identical(names(.jst_style_spec), names(.jst_style_apa)) &&
        all(vapply(names(.jst_style_apa), function(p)
          identical(names(.jst_style_spec[[p]]), names(.jst_style_apa[[p]])), logical(1))) &&
        all(unlist(lapply(names(.jst_style_apa), function(p) {
          vapply(names(.jst_style_apa[[p]]), function(k) {
            v <- .jst_style_apa[[p]][[k]]
            identical(.jst_style_check_value(k, .jst_style_spec[[p]][[k]], v, p, "jtable"), v)
          }, logical(1))
        }))))

# A file in every form the reader takes: a byte-order mark, Windows line
# ends, a comment line and a comment after a value, a value in quotes
# holding a #, a color with its #, a color by name, keys, sections and
# choices in any case, a list with a quoted item, a general setting set in
# a section.
writeBin(c(as.raw(c(0xef, 0xbb, 0xbf)), charToRaw(paste0(
  "# my journal\r\nformat = 1\r\nFont = Garamond   # the face\r\n",
  "header.fill = #1f3864\r\nrule.color = navy\r\nnote.label = \"Notes: #1\"\r\n",
  "CAPTION.FORM = Journal\r\n\r\n[Frequencies]\r\ncolumns = n, \"valid.percent\"\r\n",
  "stars = .05, .1\r\nmissing.label = Not answered\r\n"))),
  file.path(.ns, "forms.jstyle"))
.n2 <- res(.jst_style_resolve("forms"))$val
# A second byte-order mark: R itself drops the first in a UTF-8 session
# (and keeps it in a session that is not UTF-8); the reader drops what is
# left at the start of the first line, here the second.
writeBin(c(as.raw(c(0xef, 0xbb, 0xbf, 0xef, 0xbb, 0xbf)), charToRaw("font = Garamond\n")),
         file.path(.ns, "bom2.jstyle"))
.n2b <- res(.jst_style_resolve("bom2"))$val
check("N02 a style file is read in every form: the byte-order mark (a second one too) and Windows line ends, comments, a quoted value holding a #, a color with its # and one by name, any case in a key, a section or a choice, a list with a quoted item, thresholds put largest first, a general setting set in a section for that type only",
      inherits(.n2, "jst_style") && identical(.n2$name, "forms") &&
        identical(.jst_style_key(.n2b, "general", "font"), "Garamond") &&
        identical(.jst_style_key(.n2, "general", "font"), "Garamond") &&
        identical(.jst_style_key(.n2, "general", "header.fill"), "1F3864") &&
        identical(.jst_style_key(.n2, "general", "rule.color"), "000080") &&
        identical(.jst_style_key(.n2, "general", "note.label"), "Notes: #1") &&
        identical(.jst_style_key(.n2, "general", "caption.form"), "journal") &&
        identical(.jst_style_key(.n2, "frequencies", "columns"), c("n", "valid.percent")) &&
        identical(.jst_style_key(.n2, "frequencies", "stars"), c(0.1, 0.05)) &&
        identical(.jst_style_key(.n2, "descriptives", "stars"), c(0.05, 0.01, 0.001)) &&
        identical(.jst_style_key(.n2, "frequencies", "missing.label"), "Not answered") &&
        identical(.jst_style_key(.n2, "descriptives", "columns"), c("n", "mean", "sd", "min", "max")) &&
        identical(.jst_style_key_source(.n2, "general", "font"), "forms.jstyle") &&
        identical(.jst_style_key_source(.n2, "general", "size"), "apa"))

# The lookup: the style folder, then the working directory, then the
# per-user folder; the first folder holding a name wins, its case aside;
# "apa" is always the built-in.
.wsty("dupe", "font = A")
dir.create(.nud, recursive = TRUE)
.wsty("dupe", "font = B", dir = .nud)
.wsty("useronly", "font = U", dir = .nud)
.wsty("apa", "font = Shadow")
.nwd <- file.path(tempdir(), "tables_check_wd"); unlink(.nwd, recursive = TRUE); dir.create(.nwd)
.wsty("wdonly", "font = W", dir = .nwd)
.wsty("useronly", "font = W2", dir = .nwd)
.n3 <- local({
  old <- setwd(.nwd); on.exit(setwd(old))
  list(dupe  = .jst_style_key(.jst_style_resolve("dupe"), "general", "font"),
       DUPE  = .jst_style_key(.jst_style_resolve("DUPE"), "general", "font"),
       ext   = .jst_style_key(.jst_style_resolve("dupe.jstyle"), "general", "font"),
       wd    = .jst_style_key(.jst_style_resolve("wdonly"), "general", "font"),
       wduse = .jst_style_key(.jst_style_resolve("useronly"), "general", "font"),
       path  = .jst_style_key(.jst_style_resolve(file.path(.nud, "dupe")), "general", "font"),
       pathx = .jst_style_key(.jst_style_resolve(file.path(.nud, "dupe.jstyle")), "general", "font"),
       apa   = .jst_style_key(.jst_style_resolve("APA"), "general", "font"),
       files = names(.jst_style_files()))
})
.n3u <- .jst_style_key(.jst_style_resolve("useronly"), "general", "font")
check("N03 a name is looked for in the style folder, then the working directory, then the per-user folder, the first holding it winning and its case aside; a name given with .jstyle is the name; a path is read as given, .jstyle added; \"apa\" is always the built-in, an apa.jstyle passed over",
      identical(.n3$dupe, "A") && identical(.n3$DUPE, "A") && identical(.n3$ext, "A") &&
        identical(.n3$wd, "W") && identical(.n3$wduse, "W2") && identical(.n3u, "U") &&
        identical(.n3$path, "B") && identical(.n3$pathx, "B") &&
        identical(.n3$apa, "Times New Roman") &&
        !"apa" %in% .n3$files && sum(tolower(.n3$files) == "dupe") == 1L)

# based.on: a chain, each layer read in turn; the derived file's general
# part outranks the base's section (the reference, Part 3.2).
.wsty("base2", "font = Arial", "[frequencies]", "missing.rows = none", "percent.decimals = 2")
.wsty("derived", "based.on = base2", "caption.form = report", "percent.decimals = 0")
.n4 <- res(.jst_style_resolve("derived"))$val
check("N04 based.on chains: a setting comes from the file, else the style it is based on, else apa; the derived file's general part outranks the base file's section; each layer names its source",
      identical(vapply(.n4$layers, `[[`, character(1), "source"),
                c("derived.jstyle", "base2.jstyle", "apa")) &&
        identical(.jst_style_key(.n4, "general", "caption.form"), "report") &&
        identical(.jst_style_key(.n4, "general", "font"), "Arial") &&
        identical(.jst_style_key(.n4, "frequencies", "missing.rows"), "none") &&
        identical(.jst_style_key(.n4, "frequencies", "percent.decimals"), 0) &&
        identical(.jst_style_key(.n4, "descriptives", "percent.decimals"), 0) &&
        identical(.jst_style_key(.n4, "general", "size"), 12) &&
        identical(.jst_style_key_source(.n4, "frequencies", "missing.rows"), "base2.jstyle"))

# The stops, each with what the user wrote as its subject.
.wsty("cyc1", "based.on = cyc2"); .wsty("cyc2", "based.on = cyc1"); .wsty("me", "based.on = me")
.wsty("nobase", "based.on = elsewhere")
.n5a <- res(jtable(.nf1, style = "dupee", print = FALSE))
.n5b <- res(jtable(.nf1, style = "nonesuch", print = FALSE))
.n5c <- res(jtable(.nf1, style = "cyc1", print = FALSE))
.n5d <- res(jtable(.nf1, style = "me", print = FALSE))
.n5e <- res(jtable(.nf1, style = "nobase", print = FALSE))
.n5f <- res(jtable(.nf1, style = file.path(.ns, "x.txt"), print = FALSE))
.n5g <- res(jtable(.nf1, style = file.path(.ns, "absent"), print = FALSE))
check("N05 a style not found: a near name offered with the call that uses it, else the styles found named; a loop of based.on, and a style based on itself; based.on naming no style; a path with another extension; a path to no file",
      is.null(.n5a$val) &&
        grepl("jtable(): no style named \"dupee\" was found.\nDid you mean \"dupe\"?\n  jtable(.nf1, style = \"dupe\", print = FALSE)", .n5a$txt, fixed = TRUE) &&
        grepl("jtable(): no style named \"nonesuch\" was found.\nThe styles found are \"apa\",", .n5b$txt, fixed = TRUE) &&
        grepl("jstyle() lists them and the folders searched.", .n5b$txt, fixed = TRUE) &&
        grepl("jtable(): cyc1.jstyle is based on cyc2.jstyle, which is based", .n5c$txt, fixed = TRUE) &&
        grepl("on cyc1.jstyle.\nA style cannot be based on itself.", .n5c$txt, fixed = TRUE) &&
        grepl("jtable(): me.jstyle is based on me.jstyle.\nA style cannot be based on itself.", .n5d$txt, fixed = TRUE) &&
        grepl("jtable(): line 1 of nobase.jstyle sets based.on = elsewhere, and no\nstyle of that name was found.\nThe styles found are \"apa\",", .n5e$txt, fixed = TRUE) &&
        grepl(paste0("jtable(): style = names a file ending in .txt, not .jstyle:\n  ",
                     file.path(.ns, "x.txt")), .n5f$txt, fixed = TRUE) &&
        grepl(paste0("jtable(): File not found:\n", .jst_norm_path(file.path(.ns, "absent.jstyle"))), .n5g$txt, fixed = TRUE))

.wsty("notset", "# a note", "font Arial")
.wsty("twice", "font = A", "size = 11", "font = B")
.wsty("twosec", "[frequencies]", "columns = n", "[descriptives]", "columns = n", "[frequencies]", "missing.rows = none")
.wsty("ownsec", "[frequencies]", "based.on = apa")
.wsty("fmtbad", "format = one"); .wsty("fmtnew", "format = 2")
.n6 <- lapply(c("notset", "twice", "twosec", "ownsec", "fmtbad", "fmtnew"),
              function(s) res(jtable(.nf1, style = s, print = FALSE)))
check("N06 a line that is not a setting; a setting given twice in a section, and a section opened twice; based.on in a section; a format that is not a whole number, and one newer than this version reads",
      all(vapply(.n6, function(r) is.null(r$val), logical(1))) &&
        grepl("jtable(): line 2 of notset.jstyle is not a setting:\n  font Arial\nA setting is a name, an equals sign and a value, for example:\n  font = Times New Roman", .n6[[1]]$txt, fixed = TRUE) &&
        grepl("jtable(): line 3 of twice.jstyle sets font again\n(line 1 set it first).\nSet each setting once in a section.", .n6[[2]]$txt, fixed = TRUE) &&
        grepl("jtable(): line 5 of twosec.jstyle opens [frequencies] again\n(line 1 opened it first).\nPut a section's settings under one heading.", .n6[[3]]$txt, fixed = TRUE) &&
        grepl("jtable(): line 2 of ownsec.jstyle sets based.on in [frequencies].\nbased.on goes at the top of the file, before the first section.", .n6[[4]]$txt, fixed = TRUE) &&
        grepl("jtable(): line 1 of fmtbad.jstyle sets format = one.\n`format` must be a whole number.", .n6[[5]]$txt, fixed = TRUE) &&
        grepl("jtable(): fmtnew.jstyle is in style-file format 2, which this\nversion of jstats (", .n6[[6]]$txt, fixed = TRUE) &&
        grepl("Update jstats with jupdate().", .n6[[6]]$txt, fixed = TRUE))

.wsty("typo", "[frequencies]", "colums = n")
.wsty("unkn", "[frequencies]", "colwidth = 5")
.wsty("unkg", "fontface = Arial")
.wsty("secnear", "[frequncies]", "columns = n")
.wsty("secunk", "[regression]", "columns = b")
.n7 <- lapply(c("typo", "unkn", "unkg", "secnear", "secunk"),
              function(s) res(jtable(.nf1, style = s, print = FALSE)))
check("N07 a setting or a section this version does not have: a near miss gets the did-you-mean; any other names both causes and the settings, or the sections, there are",
      all(vapply(.n7, function(r) is.null(r$val), logical(1))) &&
        grepl("jtable(): line 2 of typo.jstyle sets colums, which is not a setting\nof [frequencies].\nDid you mean columns?", .n7[[1]]$txt, fixed = TRUE) &&
        grepl("jtable(): line 2 of unkn.jstyle sets colwidth, which is not a\nsetting jstats has.\nIt may be misspelled, or it may be from a newer version of jstats", .n7[[2]]$txt, fixed = TRUE) &&
        grepl("The settings of [frequencies] are title, columns, stub.label, n.label,", .n7[[2]]$txt, fixed = TRUE) &&
        grepl("A general setting may be set there too.", .n7[[2]]$txt, fixed = TRUE) &&
        grepl("The general settings are font, size, paper,", .n7[[3]]$txt, fixed = TRUE) &&
        grepl("jtable(): line 1 of secnear.jstyle opens [frequncies], which is not\na section of a style.\nDid you mean [frequencies]?", .n7[[4]]$txt, fixed = TRUE) &&
        grepl("The sections are [descriptives] and [frequencies].", .n7[[5]]$txt, fixed = TRUE))

.wsty("vchoice", "rules = box"); .wsty("vnum", "size = 100"); .wsty("vint", "decimals = 2.5")
.wsty("vcol", "header.fill = notacolor"); .wsty("vcol2", "rule.color = none")
.wsty("vcols", "[frequencies]", "columns = n, median"); .wsty("vdup", "[descriptives]", "columns = n, n")
.wsty("vstars", "stars = .05, 2"); .wsty("vtext", "font = \"\"")
.n8 <- lapply(c("vchoice", "vnum", "vint", "vcol", "vcol2", "vcols", "vdup", "vstars", "vtext"),
              function(s) res(jtable(.nf1, style = s, print = FALSE)))
check("N08 a wrong value stops after the line that set it, with what the setting takes: a choice in the house form, a number's range, a whole number, a color (none where the setting allows it), the columns a table type has, the thresholds, text that may not be empty",
      all(vapply(.n8, function(r) is.null(r$val), logical(1))) &&
        grepl("jtable(): line 1 of vchoice.jstyle sets rules = box.\n`rules` must be \"apa\", \"grid\", \"outer\", or \"none\".", .n8[[1]]$txt, fixed = TRUE) &&
        grepl("`size` must be a number from 6 to 72.", .n8[[2]]$txt, fixed = TRUE) &&
        grepl("`decimals` must be a whole number from 0 to 6.", .n8[[3]]$txt, fixed = TRUE) &&
        grepl("`header.fill` must be \"none\", a color name such as \"navy\", or six hex digits\nsuch as \"1F3864\".", .n8[[4]]$txt, fixed = TRUE) &&
        grepl("`rule.color` must be a color name such as \"navy\" or six hex digits such", .n8[[5]]$txt, fixed = TRUE) &&
        !grepl("or or", .n8[[5]]$txt, fixed = TRUE) &&
        grepl("`columns` must be columns of a frequency table, each named once: \"n\",\n\"percent\", \"valid.percent\", or \"cumulative\".", .n8[[6]]$txt, fixed = TRUE) &&
        grepl("`columns` must be columns of a descriptives table, each named once: \"n\",", .n8[[7]]$txt, fixed = TRUE) &&
        grepl("`stars` must be one to three p-values between 0 and 1, for example .05,", .n8[[8]]$txt, fixed = TRUE) &&
        grepl("`font` must be text, not empty.", .n8[[9]]$txt, fixed = TRUE))

# A file a newer jstats wrote: what this version does not have is passed
# over with one note naming it in the file's order; a near miss still
# stops, and says the file is newer.
.wsty("newer", "written.by = jstats 99.0.0", "caption.color = red", "caption.form = journal",
      "[frequencies]", "colwidth = 5", "[regression]", "columns = b")
.wsty("newtypo", "written.by = jstats 99.0.0", "[frequencies]", "colums = n")
.n9 <- res(jtable(.nf1, style = "newer", print = FALSE))
.n9b <- res(jtable(.nf1, style = "newtypo", print = FALSE))
.n9n <- Filter(function(s) grepl("newer.jstyle was written by", s$text, fixed = TRUE), .seen)
check("N09 a file a newer jstats wrote: its unknown settings and sections are skipped, one note naming each in the file's order with both versions and jupdate(); the table is built from the rest; a near miss there still stops, saying the file is newer",
      inherits(.n9$val, "jst_table") &&
        identical(.jst_style_key(.n9$val$style, "general", "caption.form"), "journal") &&
        length(.n9n) >= 1L &&
        grepl(paste0("newer.jstyle was written by jstats 99.0.0, and this is jstats ",
                     .jst_jstats_version(), ".\nThese settings are from the newer version and were skipped:"),
              .n9n[[1]]$text, fixed = TRUE) &&
        grepl("caption.color, [frequencies] colwidth, [regression].", gsub("\n", " ", .n9n[[1]]$text), fixed = TRUE) &&
        grepl("Update jstats with jupdate() to use them.", .n9n[[1]]$text, fixed = TRUE) &&
        is.null(.n9b$val) &&
        grepl("Did you mean columns?\nnewtypo.jstyle was written by jstats 99.0.0, newer than this", .n9b$txt, fixed = TRUE))

# =============================================================================
# O. jstyle(): the list, the settings, save.as
# =============================================================================
cat("\n--- O. jstyle() ---\n")

.o1 <- res(jstyle())
.o1l <- .strip_ansi(strsplit(.o1$txt, "\n", fixed = TRUE)[[1]])
check("O01 jstyle() lists the built-in apa style (the default) and every style file found once, the first folder winning, then the folders searched in order with what each is; the styles are returned",
      identical(.o1l[1], "Styles") &&
        any(grepl("^  apa +built into jstats \\(the default\\)$", .o1l)) &&
        any(grepl(paste0("^  dupe +", .jst_norm_path(file.path(.ns, "dupe.jstyle")), "$"), .o1l)) &&
        sum(grepl("^  dupe ", .o1l)) == 1L &&
        any(grepl(paste0("^  useronly +", .jst_norm_path(file.path(.nud, "useronly.jstyle")), "$"), .o1l)) &&
        any(.o1l == "jstats looks for a style file in these folders, in this order:") &&
        any(.o1l == paste0("  ", .jst_norm_path(.ns), " (the style folder)")) &&
        any(.o1l == paste0("  ", .jst_norm_path(getwd()), " (the working directory)")) &&
        any(.o1l == paste0("  ", .jst_norm_path(.nud), " (your jstats folder)")) &&
        is.data.frame(.o1$val) && identical(.o1$val$name[1], "apa") && is.na(.o1$val$path[1]))

.o2 <- res(jstyle("derived"))
.o2l <- .strip_ansi(strsplit(.o2$txt, "\n", fixed = TRUE)[[1]])
.o2a <- .strip_ansi(strsplit(res(jstyle("apa"))$txt, "\n", fixed = TRUE)[[1]])
check("O02 jstyle(name) prints every setting in the style file's own form, the general part first and then each section; a setting the file does not set says where it comes from; the header names the file and the chain; jstyle(\"apa\") marks nothing",
      identical(.o2l[1], "Style: derived") &&
        identical(.o2l[2], paste0("  ", .jst_norm_path(file.path(.ns, "derived.jstyle")))) &&
        identical(.o2l[3], "  based on base2, then apa") &&
        any(grepl("^caption.form += report$", .o2l)) &&
        any(grepl("^font += Arial +# from base2$", .o2l)) &&
        any(grepl("^size += 12 +# from apa$", .o2l)) &&
        any(grepl("^stars += \\.05, \\.01, \\.001 +# from apa$", .o2l)) &&
        any(.o2l == "[descriptives]") && any(.o2l == "[frequencies]") &&
        any(grepl("^missing.rows += none +# from base2$", .o2l)) &&
        identical(.o2a[2], "  built into jstats") && !any(grepl("# from", .o2a, fixed = TRUE)) &&
        inherits(.o2$val, "jst_style"))

.o3 <- res(jstyle("apa", save.as = "copyapa"))
.o3f <- file.path(.ns, "copyapa.jstyle")
.o3t <- readLines(.o3f, encoding = "UTF-8", warn = FALSE)
.o3s <- .jst_style_resolve("copyapa")
.o3same <- all(unlist(lapply(names(.jst_style_apa), function(p) vapply(names(.jst_style_spec[[p]]), function(k)
  identical(.jst_style_key(.o3s, p, k), .jst_style_key(.jst_style_resolve("apa"), p, k)), logical(1)))))
check("O03 jstyle(\"apa\", save.as = ) writes <name>.jstyle into the style folder: its header, the format and written.by stamps and based.on = apa, then every setting of every part after a note on what it does; read back, every setting is apa's; the written line names the file",
      file.exists(.o3f) &&
        identical(.o3t[1], "# copyapa.jstyle: a jstats table style.") &&
        identical(.o3t[3], "# jstyle(\"copyapa\") prints the settings jstats reads from it.") &&
        "format     = 1" %in% .o3t &&
        paste0("written.by = jstats ", .jst_jstats_version()) %in% .o3t &&
        "based.on   = apa" %in% .o3t &&
        all(c("[descriptives]", "[frequencies]") %in% .o3t) &&
        identical(.o3t[match("font = Times New Roman", .o3t) - 1L], "# the typeface of every cell, caption and note") &&
        "stars = .05, .01, .001" %in% .o3t && "percent.label = %" %in% .o3t &&
        sum(grepl("^[a-z][a-z.]* = ", .o3t) & !grepl("^(format|written.by|based.on) ", .o3t)) ==
          sum(lengths(lapply(.jst_style_spec, names))) &&
        .o3same &&
        grepl(paste0("Style written to ", .jst_norm_path(.o3f)), gsub("\\s+", " ", .o3$txt), fixed = TRUE))

.o4 <- res(jstyle("derived", save.as = "copyderived"))
.o4s <- .jst_style_resolve("copyderived")
.o4same <- all(unlist(lapply(names(.jst_style_apa), function(p) vapply(names(.jst_style_spec[[p]]), function(k)
  identical(.jst_style_key(.o4s, p, k), .jst_style_key(.n4, p, k)), logical(1)))))
options(.jst_options_style_dir = NULL)
unlink(.nud, recursive = TRUE)
.o4u <- res(jstyle("apa", save.as = "tousr"))
options(.jst_options_style_dir = .ns)
check("O04 a copy of a style based on others holds every setting it gives, so it reads the same alone; with no style folder set, the copy goes into the per-user folder, which is created for it",
      .o4same && identical(length(.o4s$layers), 2L) &&
        file.exists(file.path(.nud, "tousr.jstyle")) &&
        grepl(paste0("Style written to ", .jst_norm_path(file.path(.nud, "tousr.jstyle"))),
              gsub("\\s+", " ", .o4u$txt), fixed = TRUE))

.o5 <- lapply(list(quote(jstyle("apa", save.as = "apa")),
                   quote(jstyle("apa", save.as = "x.txt")),
                   quote(jstyle("apa", save.as = "a:b")),
                   quote(jstyle("apa", save.as = file.path(.ns, "nofolder", "x"))),
                   # A file that exists, where the session cannot ask: the gate
                   # jstyle() calls, called with ask = FALSE, so the check
                   # neither asks nor depends on the session (S380).
                   quote(.jst_table_overwrite_gate(.o3f, FALSE, ask = FALSE,
                                                   fn = "jstyle", noun = "style")),
                   quote(jstyle(save.as = 3)),
                   quote(jstyle(copyapa)),
                   quote(jstyle("apa", save.as = cpy)),
                   quote(jstyle("apa", folder = "x"))),
              function(e) res(eval(e)))
.o5b <- res(jstyle("apa", save.as = "copyapa", overwrite = TRUE))
check("O05 save.as stops: the built-in's name, another extension, a name a file cannot have, a folder that does not exist, a file that exists where the session cannot ask, a value that is not a name; bare words get the pointer; an unused input; overwrite = TRUE replaces",
      all(vapply(.o5, function(r) is.null(r$val), logical(1))) &&
        grepl("jstyle(): \"apa\" is the name of jstats's built-in style.\nGive the copy another name, for example:\n  jstyle(\"apa\", save.as = \"myjournal\")", .o5[[1]]$txt, fixed = TRUE) &&
        grepl("jstyle(): save.as = names a file ending in .txt, not .jstyle, which\njstyle() adds:\n  save.as = \"x\"", .o5[[2]]$txt, fixed = TRUE) &&
        grepl("jstyle(): \"a:b\" cannot be a file's name.\nUse letters, digits, spaces, dashes, or underscores.", .o5[[3]]$txt, fixed = TRUE) &&
        grepl("jstyle(): the folder does not exist:", .o5[[4]]$txt, fixed = TRUE) &&
        grepl("jstyle(): this file already exists:", .o5[[5]]$txt, fixed = TRUE) &&
        grepl("To replace it, add overwrite = TRUE to the call, then run it again.", .o5[[5]]$txt, fixed = TRUE) &&
        grepl("jstyle(): `save.as` must be a name in quotes, for example:\n  save.as = \"myjournal\"", .o5[[6]]$txt, fixed = TRUE) &&
        grepl("jstyle(): copyapa is not in quotes.\nA style name goes in quotes:\n  jstyle(\"copyapa\")", .o5[[7]]$txt, fixed = TRUE) &&
        grepl("jstyle(): cpy is not in quotes.\nsave.as = takes a name in quotes:\n  jstyle(\"apa\", save.as = \"cpy\")", .o5[[8]]$txt, fixed = TRUE) &&
        grepl("jstyle(): unused input: folder", .o5[[9]]$txt, fixed = TRUE) &&
        identical(.o5b$val, .o3f))

# =============================================================================
# P. The frequency table, from jfreq() results
# =============================================================================
cat("\n--- P. The frequency table ---\n")

.pd <- file.path(tempdir(), "tables_check_freq"); unlink(.pd, recursive = TRUE); dir.create(.pd)
.p0 <- res(jtable(.nf1, print = FALSE))$val
.pcnt <- function(v) {          # a variable's counts, computed from the data
  x <- tcm[[v]]; na <- c(attr(x, "na_values", exact = TRUE))
  x <- as.numeric(x)
  list(valid = table(factor(x[!is.na(x) & !(x %in% na)])),
       miss = sum(is.na(x) | x %in% na), n = length(x))
}
.pc <- .pcnt("Education")
.prow <- function(t, lab) t$rows[[which(vapply(t$rows, `[[`, "", "label") == lab)[1]]]
check("P01 jtable() on a jfreq() result: the stub and the apa columns n and %, n italic; each variable's label a row of its own (plain, the variable level, no cells), its categories indented under it by their value labels, a Missing row last where the variable has missing data",
      inherits(.p0, "jst_table") && identical(.p0$type, "frequencies") &&
        identical(.p0$columns$key, c("stub", "n", "percent")) &&
        identical(.p0$columns$label, c("Variable", "n", "%")) &&
        identical(.p0$columns$italic, c(FALSE, TRUE, FALSE)) &&
        identical(vapply(.p0$rows, `[[`, "", "label"),
                  c("Highest education level", "Some high school", "High school graduate",
                    "Some college", "Bachelor's degree", "Graduate degree", "Missing",
                    "Region of residence", "North", "South", "East", "West",
                    "Current smoker", "No", "Yes", "Missing")) &&
        identical(vapply(.p0$rows, `[[`, "", "kind")[c(1, 2, 8, 13)], c("heading", "data", "heading", "heading")) &&
        identical(.p0$rows[[1]]$level, "variable") && length(.p0$rows[[1]]$cells) == 0L &&
        identical(vapply(.p0$rows, `[[`, integer(1), "indent"),
                  c(0L, rep(1L, 6), 0L, rep(1L, 4), 0L, 1L, 1L, 1L)))

check("P02 the cells: n the count and % the percentage of all cases at one decimal, computed here from the data; the Missing row counts every declared and system-missing case; each variable's rows add up to N and to 100",
      identical(vapply(.p0$rows[2:7], function(r) r$cells$n, ""),
                c(as.character(as.integer(.pc$valid)), as.character(.pc$miss))) &&
        identical(vapply(.p0$rows[2:7], function(r) r$cells$percent, ""),
                  sprintf("%.1f", 100 * c(as.integer(.pc$valid), .pc$miss) / .pc$n)) &&
        isTRUE(all.equal(sum(vapply(.p0$rows[2:7], function(r) r$raw$percent, 0)), 100)) &&
        sum(vapply(.p0$rows[2:7], function(r) r$raw$n, 0)) == 103 &&
        identical(.prow(.p0, "West")$cells$percent, sprintf("%.1f", 100 * sum(as.numeric(tcm$Region) == 4) / 103)) &&
        identical(.p0$notes$general, "*N* = 103."))

.p3e <- res(jtable(.nf1, missing.rows = "each", columns = c("n", "percent", "valid.percent", "cumulative"), print = FALSE))$val
.p3n <- res(jtable(.nf1, missing.rows = "none", print = FALSE))$val
.p3s <- local({
  w <- data.frame(Q = haven::labelled(c(1, 2, 2, NA, 1, -9), labels = c(Yes = 1, No = 2)))
  w$Q <- haven::labelled_spss(c(1, 2, 2, NA, 1, -9), labels = c(Yes = 1, No = 2), na_values = -9)
  attr(w$Q, "label") <- "Question"
  res(jtable(res(jfreq(w, Q))$val, missing.rows = "each", print = FALSE))$val
})
check("P03 missing.rows = each lists each missing value by its label, its code where it has none, and the cells with no value as Missing; the valid and cumulative percentages are blank on them; none leaves them out",
      identical(vapply(.p3e$rows[2:8], `[[`, "", "label"),
                c("Some high school", "High school graduate", "Some college", "Bachelor's degree",
                  "Graduate degree", "Refused", "Don't know")) &&
        identical(.p3e$columns$label, c("Variable", "n", "%", "Valid %", "Cumulative %")) &&
        identical(.prow(.p3e, "Refused")$cells$valid.percent, "") &&
        identical(.prow(.p3e, "Refused")$cells$cumulative, "") &&
        identical(.prow(.p3e, "Graduate degree")$cells$cumulative, "100.0") &&
        !"Missing" %in% vapply(.p3n$rows, `[[`, "", "label") && length(.p3n$rows) == 14L &&
        identical(vapply(.p3s$rows, `[[`, "", "label"), c("Question", "Yes", "No", "-9", "Missing")))

.p4 <- local({
  w <- data.frame(T = c("b", "a", "", "a", "b", "b"), N = c(3, 1, 3, 3, 1, 2),
                  stringsAsFactors = FALSE)
  w$L <- haven::labelled(c(1, 1, 2, 1, 2, 2), labels = c(One = 1, Two = 2, Three = 3))
  res(jtable(res(jfreq(w, T, N, L))$val, print = FALSE))$val
})
check("P04 a category with no label is named by its code; a text variable's blank cells are its <blank> category; a labelled value no case holds is a zero row",
      identical(vapply(.p4$rows, `[[`, "", "label"),
                c("T", "<blank>", "a", "b", "N", "1", "2", "3", "L", "One", "Two", "Three")) &&
        identical(.prow(.p4, "Three")$cells$n, "0") && identical(.prow(.p4, "Three")$cells$percent, "0.0"))

.pf2 <- res(jfreq(tcm, Volunteer, OwnsHome))$val
.p5a <- res(jtable(list(.nf1, .pf2), print = FALSE))$val
.p5b <- res(jtable(list("Background" = .nf1, "Household" = .pf2), print = FALSE))$val
.p5c <- res(jtable(.nf1, headings = list("Schooling" = Education, "Other" = c(Region, Smoker)),
                   markers = list("Self-reported" = Smoker), print = FALSE))$val
.p5d <- res(jtable(list("Outcome" = .nf1), print = FALSE))$val
.p5e <- res(jtable(list("Outcome" = .j0), print = FALSE))$val
check("P05 several jfreq() results stack into one table; a named list's names, or headings =, give role headings (italic group rows) with the variables' rows indented under them and their categories under those; markers = marks a variable's row; a named list of one result gives its heading too, for both table types",
      identical(sum(vapply(.p5a$rows, function(r) identical(r$level, "variable"), logical(1))), 5L) &&
        identical(.p5b$rows[[1]]$label, "Background") && identical(.p5b$rows[[1]]$level, "group") &&
        identical(.p5b$rows[[2]]$indent, 1L) && identical(.p5b$rows[[3]]$indent, 2L) &&
        identical(.prow(.p5b, "Household")$level, "group") &&
        identical(vapply(.p5c$rows, `[[`, "", "label")[c(1, 2, 9)],
                  c("Schooling", "Highest education level", "Other")) &&
        identical(.prow(.p5c, "Current smoker")$marks, "a") &&
        identical(.p5c$notes$specific, list(list(mark = "a", text = "Self-reported"))) &&
        identical(.p5d$rows[[1]]$label, "Outcome") && identical(.p5e$rows[[1]]$label, "Outcome"))

.p6 <- res(jtable(list(.nf1, res(jfreq(tcm, Volunteer, subset = Age > 40))$val), print = FALSE))$val
.p7a <- res(jtable(list(.nf1, res(jfreq(tcm, Education))$val), print = FALSE))
.p7b <- local({ old <- .nf1; attr(old, "jstats_version") <- NULL; res(jtable(old, print = FALSE)) })
.p7c <- res(jtable(list(.nf1, .j0), print = FALSE))
check("P06 the N note: variables from one pool of cases open the note on N; results from different pools give no N",
      length(.p6$notes$general) == 0L)
check("P07 a variable in two results stops (a table lists each once, in both table types); a jfreq() result made before the fields existed names its version; results of two kinds in one list stop",
      is.null(.p7a$val) &&
        grepl("jtable(): Education is in more than one of the results.\nA table lists each variable once.", .p7a$txt, fixed = TRUE) &&
        grepl("jtable(): Age is in more than one of the results.",
              res(jtable(list(res(jdesc(tcm, Age))$val, res(jdesc(tcm, Age, Income))$val),
                         print = FALSE))$txt, fixed = TRUE) &&
        is.null(.p7b$val) &&
        grepl("jtable(): this jfreq() result was made by an earlier version of\njstats, before the fields a table needs were stored.", .p7b$txt, fixed = TRUE) &&
        is.null(.p7c$val) && grepl("(jfreq() and jdesc()) in one table.", .p7c$txt, fixed = TRUE))

.p8 <- res(jtable(.nf1))
.p8l <- strsplit(.p8$txt, "\n", fixed = TRUE)[[1]]
check("P08 the preview, pinned whole: the caption, the rules, each variable's label and its categories indented, the numbers on the decimal point, the note",
      identical(.p8l, c(
        "Table 1", "Frequency Distributions",
        "---------------------------------",
        "Variable                  n    %",
        "---------------------------------",
        "Highest education level",
        "  Some high school       23  22.3",
        "  High school graduate   18  17.5",
        "  Some college           25  24.3",
        "  Bachelor's degree      13  12.6",
        "  Graduate degree        18  17.5",
        "  Missing                 6   5.8",
        "Region of residence",
        "  North                  27  26.2",
        "  South                  20  19.4",
        "  East                   31  30.1",
        "  West                   25  24.3",
        "Current smoker",
        "  No                     65  63.1",
        "  Yes                    33  32.0",
        "  Missing                 5   4.9",
        "---------------------------------",
        "Note. N = 103.")))

.p9f <- file.path(.pd, "Table2.docx")
.p9 <- res(jtable(.nf1, file = .p9f, overwrite = TRUE, print = FALSE))
.p9x <- file.path(.pd, "x"); invisible(utils::unzip(.p9f, exdir = .p9x))
.p9d <- paste(readLines(file.path(.p9x, "word", "document.xml"), warn = FALSE, encoding = "UTF-8"),
              collapse = "\n")
.p9tabs <- as.integer(regmatches(.p9d, gregexpr("(?<=w:val=\"decimal\" w:pos=\")[0-9]+", .p9d, perl = TRUE))[[1]])
check("P09 the Word file: 19 rows (the caption, the header, three variable rows spanning the table, plain and unindented, thirteen category rows indented 180 twips, the note); the n and % heads; every number on a decimal tab",
      .ltag(.p9d, "w:tr")[["open"]] == 19L &&
        lengths(regmatches(.p9d, gregexpr("<w:gridSpan w:val=\"3\"/>", .p9d))) == 5L &&
        grepl("<w:rPr><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\">Highest education level</w:t>", .p9d, fixed = TRUE) &&
        !grepl("<w:i/><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\">Region of residence", .p9d, fixed = TRUE) &&
        lengths(regmatches(.p9d, gregexpr("<w:ind w:left=\"180\"/>", .p9d))) == 13L &&
        grepl("<w:i/><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\">n</w:t>", .p9d, fixed = TRUE) &&
        grepl("<w:t xml:space=\"preserve\">%</w:t>", .p9d, fixed = TRUE) &&
        length(.p9tabs) == 26L)

# The block of numbers centered under its head (S401): under a head wider
# than its numbers the decimal tab sits near the middle, never at the
# right-hand limit build 1 used for every column.
.p10 <- res(jtable(.nf1, columns = c("n", "cumulative"), missing.rows = "none", print = FALSE))$val
.p10w <- .jst_docx_widths(.p10, .p10$style)
.p10t <- .jst_docx_decimal_tabs(.p10, .p10w, 12, 108L)
.p10inner <- .p10w[3] - 216L
.p10tail <- .jst_docx_text_width(".3", 12, digits = TRUE)
.p10head <- .jst_docx_text_width("100", 12, digits = TRUE)
check("P10 a column of numbers is centered under its head: under the wide Cumulative % head the decimal tab sits at the middle of the block, short of the right-hand limit; a column as wide as its numbers keeps its tab short of the cell's edge",
      identical(.p10t[3], as.integer(floor((.p10inner + .p10head - .p10tail) / 2))) &&
        .p10t[3] < .p10inner - .p10tail - 40L &&
        .p10t[2] <= .p10w[2] - 216L - .jst_docx_text_width("", 12, TRUE) - 40L)

check("P11 document.xml of the frequency table pinned by its checksum",
      identical(unname(tools::md5sum(file.path(.p9x, "word", "document.xml"))), "1b50a0ddc36ac3451e325969e9cb935e"))

# =============================================================================
# Q. joptions(style = , style.dir = )
# =============================================================================
cat("\n--- Q. joptions(style =, style.dir =) ---\n")

options(.jst_options_style = NULL, .jst_options_style_dir = NULL)
.q0 <- .strip_ansi(suppressMessages(utils::capture.output(joptions())))
check("Q01 the full panel has nine rows: Style and Style folder after Output folder, apa and Not set when unset; both settings are session keys",
      identical(.q0[1:10], c("Options Settings",
                             "Missing-value convention: None selected",
                             "SPSS-style missing value codes: -99, -98, -97",
                             "Data folder: Working directory",
                             "Output folder: Working directory",
                             "Style: apa",
                             "Style folder: Not set",
                             "Correlation layout: wide",
                             "Missing-value detail: per_code",
                             "Message width: 76")) &&
        all(c(".jst_options_style", ".jst_options_style_dir") %in% .jst_session_option_keys))

.qd <- file.path(tempdir(), "tables_check_qstyles"); unlink(.qd, recursive = TRUE)
.q2 <- res(joptions(style.dir = .qd))
check("Q02 joptions(style.dir = ) creates the folder, echoes the one slot and notes the folder in the data.dir form; stored under its own key",
      dir.exists(.qd) &&
        identical(.strip_ansi(strsplit(.q2$txt, "\n", fixed = TRUE)[[1]])[1:4],
                  c("Options Settings", paste0("Style folder: ", .qd),
                    "Run joptions() to see all settings.", "")) &&
        any(grepl(paste0("Created the style folder:\n  ", .qd), vapply(.seen, `[[`, "", "text"), fixed = TRUE)) &&
        identical(getOption(".jst_options_style_dir"), .qd))

.wsty("house", "caption.form = report", dir = .qd)
.q3 <- res(joptions(style = "house"))
.q3t <- res(jtable(.nf1, print = FALSE))$val
.q3q <- .strip_ansi(suppressMessages(utils::capture.output(joptions("style"))))
.q3n <- res(joptions(style = "huose"))
.q3m <- res(joptions(style = "nowhere"))
# A call that stops changes nothing (S338): the folders it names are not
# created, the style check coming before them (S401).
.q3u  <- file.path(.ns, c("unmade_style_folder", "unmade_output_folder"))
.q3r0 <- list(getOption(".jst_options_style_dir"), getOption(".jst_options_output_dir"))
.q3r  <- res(joptions(style.dir = .q3u[1], output.dir = .q3u[2], style = "nowhere"))
.q3r1 <- list(getOption(".jst_options_style_dir"), getOption(".jst_options_output_dir"))
.q3k <- getOption(".jst_options_style")
.q3a <- res(joptions(style = "APA")); .q3ak <- getOption(".jst_options_style")
.q3both <- res(joptions(style.dir = .ns, style = "derived")); .q3bk <- getOption(".jst_options_style")
check("Q03 joptions(style = ) reads the style as jtable() would and echoes it; jtable() then makes its tables in it; a query shows it; a style not found stops with nothing set and no folder the call names created, a near name offered with the joptions() line; \"APA\" is stored as \"apa\"; a call setting both reads the style in its new folder",
      grepl("Style: house", .q3$txt, fixed = TRUE) &&
        identical(.jst_style_key(.q3t$style, "general", "caption.form"), "report") &&
        identical(.q3q[1:2], c("Options Settings", "Style: house")) &&
        grepl("joptions(): no style named \"huose\" was found.\nDid you mean \"house\"?\n  joptions(style = \"house\")", .q3n$txt, fixed = TRUE) &&
        grepl("joptions(): no style named \"nowhere\" was found.", .q3m$txt, fixed = TRUE) &&
        grepl("joptions(): no style named \"nowhere\" was found.", .q3r$txt, fixed = TRUE) &&
        !any(dir.exists(.q3u)) && identical(.q3r1, .q3r0) &&
        identical(.q3k, "house") && identical(.q3ak, "apa") &&
        identical(.q3bk, "derived") && identical(getOption(".jst_options_style_dir"), .ns))

.q4 <- res(joptions(style.dir = NULL))
.q4b <- res(joptions(style.dir = "NULL"))
.q4c <- res(joptions(style.dir = 42))
.q4d <- res(joptions(style.dir = Styles))
.q4e <- res(joptions(style = myjournal))
.q4f <- res(joptions(style = 42))
check("Q04 style.dir = NULL clears it; the typo guard, a value that is not a string and a folder typed bare stop as output.dir's do; a style typed bare gets the pointer, and a value that is not a name stops",
      is.null(getOption(".jst_options_style_dir")) &&
        grepl("Style folder: Not set", .q4$txt, fixed = TRUE) &&
        grepl("joptions(): style.dir = \"NULL\" looks like a typo.", .q4b$txt, fixed = TRUE) &&
        grepl("joptions(): style.dir must be a single character string,", .q4c$txt, fixed = TRUE) &&
        grepl("joptions(): Styles is not in quotes.\nstyle.dir = takes a folder name in quotes:", .q4d$txt, fixed = TRUE) &&
        grepl("joptions(): myjournal is not in quotes.\nstyle = takes a style name in quotes:\n  joptions(style = \"myjournal\")", .q4e$txt, fixed = TRUE) &&
        grepl("joptions(): `style` must be a style name in quotes, for example:\n  style = \"apa\"", .q4f$txt, fixed = TRUE))

options(.jst_options_style_dir = .ns, .jst_options_style = "derived")
.q5 <- .strip_ansi(suppressMessages(utils::capture.output(joptions(NULL))))
options(.jst_options_message_width = .pin_width)   # the reset cleared the pin
check("Q05 the joptions(NULL) reset clears the style and the style folder",
      is.null(getOption(".jst_options_style")) && is.null(getOption(".jst_options_style_dir")) &&
        "Style: apa" %in% .q5 && "Style folder: Not set" %in% .q5)
options(.jst_options_style_dir = .ns)

# =============================================================================
# R. A style's settings in the call
# =============================================================================
cat("\n--- R. The call's settings ---\n")

.wsty("cols2", "[descriptives]", "columns = n, mean", "mean.label = Mean")
.r1 <- res(jtable(.j0, style = "cols2", columns = c("mean", "sd"), print = FALSE))$val
.r1p <- res(print(.r1))
# A table built under a style with the journal's caption prints in it.
.r1j <- res(print(res(jtable(.nf1, style = "forms", print = FALSE))$val))
check("R01 a setting of the table type's section in the call outranks the file: the call's columns, the file's label; a word in a symbol's place is set upright, apa's SD still italic; the table keeps its style and the call's setting, so print() shows them again",
      identical(.r1$columns$key, c("stub", "mean", "sd")) &&
        identical(.r1$columns$label, c("Variable", "Mean", "SD")) &&
        identical(.r1$columns$italic, c(FALSE, FALSE, TRUE)) &&
        identical(.r1$style$layers[[1]]$source, "the call") &&
        grepl("\nVariable                         Mean        SD\n", .r1p$txt, fixed = TRUE) &&
        startsWith(.r1j$txt, "Table 1. Frequency Distributions\n"))

.r2 <- lapply(list(quote(jtable(.j0, missing.rows = "none", print = FALSE)),
                   quote(jtable(.j0, font = "Arial", print = FALSE)),
                   quote(jtable(.j0, font = "Arial", size = 10, print = FALSE)),
                   quote(jtable(.j0, colums = "n", print = FALSE)),
                   quote(jtable(.nf1, columns = c("n", "mean"), print = FALSE)),
                   quote(jtable(.nf1, missing.rows = none, print = FALSE)),
                   quote(jtable(.nf1, missing.label = Absent, print = FALSE)),
                   quote(jtable(.nf1, missing.rows = TRUE, print = FALSE)),
                   quote(jtable(.p0, columns = "n", print = FALSE))),
              function(e) res(eval(e)))
check("R02 the call's settings stopped: one of another table type's; a general setting, or two; a name near a setting's (the did-you-mean); a wrong value with what it takes; a bare word with the pointer; a value of the wrong kind; a setting given with a built table",
      all(vapply(.r2, function(r) is.null(r$val), logical(1))) &&
        grepl("jtable(): missing.rows = is a setting of a frequency table, and this\ntable is a descriptives table.", .r2[[1]]$txt, fixed = TRUE) &&
        grepl("jtable(): font = is one of a style's general settings, which a call\ncannot change.\nSet it in a style file, for example a copy of apa:\n  jstyle(\"apa\", save.as = \"mystyle\")", .r2[[2]]$txt, fixed = TRUE) &&
        grepl("jtable(): font = and size = are general settings of a style, which a\ncall cannot change.\nSet them in a style file,", .r2[[3]]$txt, fixed = TRUE) &&
        grepl("jtable(): 'colums' is not valid.\nDid you mean `columns`?", .r2[[4]]$txt, fixed = TRUE) &&
        grepl("jtable(): `columns` must be columns of a frequency table, each named\nonce: \"n\", \"percent\", \"valid.percent\", or \"cumulative\".", .r2[[5]]$txt, fixed = TRUE) &&
        grepl("jtable(): none is not in quotes.\nmissing.rows = takes its value in quotes:\n  jtable(.nf1, missing.rows = \"none\", print = FALSE)", .r2[[6]]$txt, fixed = TRUE) &&
        grepl("jtable(): Absent is not in quotes.\nmissing.label = takes text in quotes:", .r2[[7]]$txt, fixed = TRUE) &&
        grepl("jtable(): `missing.rows` must be \"combined\", \"each\", or \"none\".", .r2[[8]]$txt, fixed = TRUE) &&
        grepl("jtable(): headings =, markers =, title =, note =, style =, and a\nstyle's settings belong to the call that builds a table from a result; a\nbuilt table keeps its own.", .r2[[9]]$txt, fixed = TRUE))

# =============================================================================
# S. open = TRUE
# =============================================================================
cat("\n--- S. open = ---\n")

.s1 <- res(jtable(.nf1, open = TRUE, print = FALSE))
.s1b <- res(jtable(.nf1, open = "yes", print = FALSE))
.s2 <- local({
  got <- character(0)
  rec <- function(u) got <<- c(got, u)
  a <- .jst_table_open(.p9f, TRUE, ask = TRUE, browse = rec)
  b <- .jst_table_open(.p9f, TRUE, ask = FALSE, browse = rec)
  c <- .jst_table_open(.p9f, FALSE, ask = TRUE, browse = rec)
  list(a = a, b = b, c = c, got = got)
})
check("S01 open = TRUE needs file =, the call given back with one; open = must be TRUE or FALSE; the file is handed to the opener only when open = TRUE and the session can show it, never in a script",
      is.null(.s1$val) &&
        grepl("jtable(): open = TRUE opens the file jtable() writes, so it needs\nfile = as well, for example:\n  jtable(.nf1, open = TRUE, print = FALSE, file = \"Table1.docx\")", .s1$txt, fixed = TRUE) &&
        grepl("jtable(): `open` must be TRUE or FALSE.", .s1b$txt, fixed = TRUE) &&
        isTRUE(.s2$a) && isFALSE(.s2$b) && isFALSE(.s2$c) &&
        identical(.s2$got, normalizePath(.p9f, winslash = "/")))

# =============================================================================
# T. A bare file name, and a relative output folder (S401 defect)
# =============================================================================
cat("\n--- T. Where a bare name is written ---\n")

# Until S401 a bare file name with no output folder set -- the taught form,
# file = "Table1.docx" -- and a file in a relative output folder were never
# written: zip::zip() changes into its own folder to pack the parts, and the
# temporary file's relative name was made there.
.tw <- file.path(tempdir(), "tables_check_bare"); unlink(.tw, recursive = TRUE); dir.create(.tw)
.t1 <- local({
  old <- setwd(.tw); on.exit(setwd(old))
  od <- getOption(".jst_options_output_dir"); on.exit(options(.jst_options_output_dir = od), add = TRUE)
  options(.jst_options_output_dir = NULL)
  a <- res(jtable(.nf1, file = "Bare.docx", print = FALSE))
  options(.jst_options_output_dir = "Rel")
  dir.create("Rel")
  b <- res(jtable(.nf1, file = "InRel.docx", print = FALSE))
  list(a = a, b = b, f1 = file.exists("Bare.docx"), f2 = file.exists(file.path("Rel", "InRel.docx")),
       left = list.files(".", pattern = "^jtable_", recursive = TRUE))
})
check("T01 a bare file name with no output folder set is written into the working directory, and one with a relative output folder into it; no temporary file is left",
      isTRUE(.t1$f1) && isTRUE(.t1$f2) && length(.t1$left) == 0L &&
        inherits(.t1$a$val, "jst_table") && inherits(.t1$b$val, "jst_table"))

unlink(c(.ns, .nu, .nwd, .qd, .pd, .tw), recursive = TRUE)

# --- The message surface, swept (guard 4) ------------------------------------
# The analyses above raise notes and warnings of their own (a seems-
# categorical warning, the load scan, jalpha()'s reverse-coded item); every
# one res() recorded is swept here.

.sw <- Filter(function(s) identical(as.numeric(s$width), as.numeric(.pin_width)),
              .seen)
.sw <- .sw[!duplicated(vapply(.sw, function(s) paste(s$kind, s$text), ""))]

.ln <- unlist(lapply(.sw, function(s) strsplit(s$text, "\n", fixed = TRUE)[[1]]))
.ln <- .ln[nzchar(trimws(.ln)) & !grepl("^\\s{2}", .ln)]
.ln <- .ln[!grepl("^([A-Za-z]:[\\\\/]|/|~|\\\\\\\\)", .ln)]
check(paste0("Z01 no prose line of a message exceeds ", .pin_width,
             " columns (", length(.sw), " conditions)"),
      length(.sw) >= 2L && !any(nchar(.ln, type = "width") > .pin_width))

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
    if (nchar(a, type = "width") + 1L + nchar(unit(b), type = "width") <= budget)
      out <- c(out, sprintf("[%d] %s | %s", i, a, unit(b)))
  }
  out
}
.pb <- unlist(lapply(.sw, function(s) {
  pbreaks(s$text, .pin_width, switch(s$kind, error = 8L, warning = 9L, 0L))
}))
check("Z02 no premature break: a line's first unit never fit on the line above",
      length(.sw) >= 2L && length(.pb) == 0L)
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
      length(.ub) == 0L)
if (length(.ub) > 0L) for (l in .ub) cat("        does not parse: ", l, "\n")

# --- Restore session state ---------------------------------------------------
# Guard 1, above the verdict so a failing run hands the session back too.

options(.jst_options_message_width      = .entry_message_width)
options(.jst_default_data               = .entry_default_data)
options(.jst_options_missing_convention = .entry_convention)
options(.jst_output_level               = .entry_output_level)
options(.jst_output_toggles             = .entry_output_toggles)
options(.jst_options_style              = .entry_style)
options(.jst_options_style_dir          = .entry_style_dir)
if (is.na(.entry_udd)) Sys.unsetenv("R_USER_DATA_DIR") else Sys.setenv(R_USER_DATA_DIR = .entry_udd)
options(.entry_stores)

# --- Verdict -----------------------------------------------------------------

.n_ok <- sum(vapply(.results, `[[`, logical(1), "ok"))
.n    <- length(.results)
if (.n_ok == .n) {
  cat("\nRESULT: PASS (", .n_ok, "/", .n, ")\n", sep = "")
  .ws_restore()   # guard 5, ahead of guard 2's cleanup
  rm(list = setdiff(ls(globalenv(), all.names = TRUE),
                    c(.entry_names, ".results")), envir = globalenv())
} else {
  cat("\nRESULT: FAIL (", .n_ok, "/", .n, " passed)\n", sep = "")
  for (r in .results) if (!r$ok) cat("  failed: ", r$desc, "\n", sep = "")
  .ws_restore()   # guard 5: the user's objects back, a red run's fixtures kept
  stop("assertion battery failed", call. = FALSE)
}
