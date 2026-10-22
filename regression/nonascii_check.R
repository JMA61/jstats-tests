# =============================================================================
# nonascii_check.R -- text in other scripts: width, encoding, names, saves
# =============================================================================
# TYPE:     assertion battery (PASS/FAIL; written for Claude's checking)
# LOCKS:    Chinese, Japanese and Korean text is laid out by its display
#           width (two console columns a character) in every table, note and
#           printed call -- each output here equals, byte for byte, the
#           output of an ASCII twin whose every such character is two
#           letters; text read with no encoding mark sorts (jencode() and the
#           declared-text sorts stopped in R's own words); dummy names keep
#           letters of any script; jsave() counts SPSS's limits in bytes and
#           gives a name starting with a letter outside A to Z a true reason
#           for .xpt; a full-width semicolon, equals sign or comma in a map
#           or labels string stops, with the call retyped.
# ORIGIN:   S390 (the non-English probe: the (Session 21 -- Issue 2) item)
# LAST VERIFIED: v0.9.263, 2026-10-22 (S390) -- 52/52 on the WORKSTATION
#           through receive_all() ("ALL BATTERIES GREEN (11 run, 3256
#           checks)"; R CMD check 0 errors, 0 warnings, 0 notes), matching
#           the sandbox plain, under the RStudio-handler stand-in, each again
#           with a Windows-length temp path, once with interactive() TRUE,
#           and entered dirty. GitHub f820cc2 (package).
# RUN:      source()-safe from any working directory. All output is explicit
#           cat(), so echo = TRUE is NOT required. Also runnable via
#           regression/run_all.R, which treats a stop() as FAIL.
# CONTRACT: one printed line per check, a final "RESULT: PASS (n/n)" line,
#           and stop() if and only if any check failed.
# DATA:     none from the test-data folder. Every fixture is made here, its
#           text written as \u escapes so this file is ASCII. Text with no
#           encoding mark -- what read.csv(), jload() of a CSV file and a
#           source()d script give -- is made with rawToChar(charToRaw()), or
#           by writing a CSV file and loading it with jload().
# THE TWIN: each W check runs one call on a frame holding Chinese or Korean
#           names, labels and values, and the same call on its ASCII twin, in
#           which every double-width character is a distinct pair of letters
#           (in code-point order, so the order of distinct strings is kept).
#           The first output, each such character put through the same map,
#           must equal the second: any column, wrap or pad laid out by a
#           count of characters rather than of columns differs.
# GUARDS:   the template's five (_template_check.R): the session handed back,
#           a green run leaves no fixture, work outside check() guarded, the
#           message surface swept -- here measured in display columns, since
#           a count of characters passes a Chinese line that overflows -- and
#           the user's objects put back.
# MUTANTS:  29 one-change copies of the build's master, run against this
#           file in three rounds as it grew (M07 against import_check.R too,
#           M14 against missing_convention_check.R). Each reds a check but
#           one, which is equivalent: the hang .jst_break_arg() measures is
#           the call's own opening, ASCII by construction. Which reds: the
#           sort without the UTF-8 mark, E01-E07; .jst_dw() counting
#           characters, W01-W16 and more; .jst_cut_width() by characters,
#           W15-W17; the prose wrapper, W06 W18 Z01; the .sav category in
#           characters, S01 S02; the .xpt reason by A to Z, S04; the old .sav
#           parenthetical, S01 S03 and import_check.R N01; dummy names by A
#           to Z, W06 W07 D01-D04; no fallback to a stored name, D03;
#           jrelabel() without the full-width check, F01 F02 F06; no space
#           after a retyped semicolon, F01; an ideographic space kept, or a
#           quoted label not skipped, F06; Fix Slate 29 reverted,
#           missing_convention_check.R N84l2; the load scan's list padded by
#           bytes, or the rename lines in characters, W14; jconvert()'s
#           report, W12; the reminder's budget, W13; the call layout, or the
#           wrapper's call test, F07; the table printer, W01-W04 W08-W10;
#           the segment test, W23 (written for it); the variable-label
#           lists, W21; the load notes' name columns, W22; .jst_pad_right(),
#           E02 E04; the plot label, W17; the 40-column cap, W15;
#           .jst_term_text() collapsing inside quotes, T01 T02.
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

# Guard 1: session state to hand back at the foot (record / force / restore).
.entry_message_width <- getOption(".jst_options_message_width")
.entry_default_data  <- getOption(".jst_default_data")
.entry_output_level  <- getOption(".jst_output_level")
.entry_output_toggles <- getOption(".jst_output_toggles")
.entry_convention    <- getOption(".jst_options_missing_convention")
.entry_conv_codes    <- getOption(".jst_options_missing_convention_codes")
.entry_data_dir      <- getOption(".jst_options_data_dir")
.entry_stores <- lapply(stats::setNames(nm = c(".jst_filter", ".jst_complete",
                                              ".jst_dummy", ".jst_registry",
                                              ".jst_missing_notice_shown")),
                        getOption)

.pin_width <- 76L
options(.jst_options_message_width = .pin_width)
# No default frame and no convention selected: every call here names its
# data frame, and the declarations name their convention when they need one.
options(.jst_default_data = NULL, .jst_options_missing_convention = NULL,
        .jst_options_missing_convention_codes = NULL,
        .jst_options_data_dir = NULL)
jsubset(clear.all = TRUE); jcomplete(clear.all = TRUE); joutput(NULL)
jdummy(clear.all = TRUE)
options(.jst_missing_notice_shown = TRUE)

# A folder of the battery's own for the files it writes and reads.
.nx_dir <- tempfile("nonascii_check_")
dir.create(.nx_dir)

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

# .both(): everything a call prints, in the order printed -- the tables on
# stdout and each note and warning as its condition is signalled (taken
# where it is signalled, never from a sink of the message stream), an
# error's text last. Colour codes are dropped. Returns lines.
.both <- function(text, env = globalenv()) {
  out <- utils::capture.output(tryCatch(
    withCallingHandlers(
      {
        v <- withVisible(eval(parse(text = text, encoding = "UTF-8")[[1L]], env))
        if (v$visible) print(v$value)
        invisible(NULL)
      },
      message = function(m) {
        .see("note", m)
        cat(conditionMessage(m))
        invokeRestart("muffleMessage")
      },
      warning = function(w) {
        .see("warning", w)
        cat("Warning: ", conditionMessage(w), "\n", sep = "")
        invokeRestart("muffleWarning")
      }),
    error = function(e) {
      .see("error", e)
      cat("Error: ", conditionMessage(e), "\n", sep = "")
    }))
  gsub("\033\\[[0-9;]*m", "", out)
}

# Display width of each string (two columns for a Chinese, Japanese or
# Korean character), NA as 0.
.cols <- function(x) {
  w <- nchar(x, type = "width")
  w[is.na(w)] <- 0L
  w
}

# A string with no encoding mark: the bytes of x, as read.csv() returns them.
.unmarked <- function(x) {
  out <- vapply(enc2utf8(x), function(s) rawToChar(charToRaw(s)), character(1),
                USE.NAMES = FALSE)
  out[is.na(x)] <- NA_character_      # charToRaw(NA) is the bytes of "NA"
  out
}

# A CSV file holding these lines, in UTF-8.
.csv <- function(file, lines) {
  path <- file.path(.nx_dir, file)
  writeBin(charToRaw(enc2utf8(paste0(paste(lines, collapse = "\n"), "\n"))),
           path)
  path
}

# --- Fixtures: a Chinese frame, a Korean frame, a frame of long names --------

.mk_lab <- function(x, labels, label, na_values = NULL) {
  if (is.null(na_values)) haven::labelled(x, labels = labels, label = label)
  else haven::labelled_spss(x, labels = labels, na_values = na_values,
                            label = label)
}
set.seed(390)
.n    <- 40L
.sex  <- rep(c(1, 2), length.out = .n)
.age  <- round(stats::runif(.n, 18, 70))
.inc  <- round(2000 + 60 * .age + 800 * (.sex == 2) + stats::rnorm(.n, 0, 900))
.reg  <- rep(c(1, 2, 3), length.out = .n)
.sat  <- pmin(5, pmax(1, round(2 + 0.03 * .age + stats::rnorm(.n, 0, 1))))
.sat[c(5, 17)] <- -99
.emp  <- as.numeric(.inc + stats::rnorm(.n, 0, 600) > stats::median(.inc))
.it   <- sapply(1:3, function(k) pmin(5, pmax(1, round(3 + 0.8 * (.sat - 3) *
                (.sat > 0) + stats::rnorm(.n, 0, 0.8)))))

.zh <- data.frame(x = seq_len(.n))
.zh[["\u{7f16}\u{53f7}"]]   <- seq_len(.n)
.zh[["\u{6027}\u{522b}"]]   <- .mk_lab(.sex, c("\u{7537}" = 1, "\u{5973}" = 2), "\u{53d7}\u{8bbf}\u{8005}\u{6027}\u{522b}")
.zh[["\u{5e74}\u{9f84}"]]   <- .age
.zh[["\u{6536}\u{5165}"]]   <- .inc
attr(.zh[["\u{5e74}\u{9f84}"]], "label") <- "\u{53d7}\u{8bbf}\u{8005}\u{5e74}\u{9f84}\u{ff08}\u{5c81}\u{ff09}"
attr(.zh[["\u{6536}\u{5165}"]], "label") <- "\u{6708}\u{6536}\u{5165}\u{ff08}\u{5143}\u{ff09}"
.zh[["\u{6ee1}\u{610f}\u{5ea6}"]] <- .mk_lab(.sat, c("\u{975e}\u{5e38}\u{4e0d}\u{6ee1}\u{610f}" = 1, "\u{4e0d}\u{6ee1}\u{610f}" = 2, "\u{4e00}\u{822c}" = 3,
                                   "\u{6ee1}\u{610f}" = 4, "\u{975e}\u{5e38}\u{6ee1}\u{610f}" = 5, "\u{62d2}\u{7edd}\u{56de}\u{7b54}" = -99),
                           "\u{5bf9}\u{670d}\u{52a1}\u{7684}\u{603b}\u{4f53}\u{6ee1}\u{610f}\u{5ea6}", na_values = -99)
.zh[["\u{5730}\u{533a}"]]   <- .mk_lab(.reg, c("\u{5317}\u{90e8}\u{5730}\u{533a}" = 1, "\u{5357}\u{90e8}\u{5730}\u{533a}" = 2,
                                   "\u{4e1c}\u{90e8}\u{6cbf}\u{6d77}\u{5730}\u{533a}" = 3), "\u{5c45}\u{4f4f}\u{5730}\u{533a}")
.zh[["\u{57ce}\u{5e02}"]]   <- rep(c("\u{5317}\u{4eac}", "\u{4e0a}\u{6d77}", "\u{5e7f}\u{5dde}", "\u{6df1}\u{5733}"), length.out = .n)
.zh[["\u{5c31}\u{4e1a}"]]   <- .mk_lab(.emp, c("\u{5426}" = 0, "\u{662f}" = 1), "\u{662f}\u{5426}\u{5c31}\u{4e1a}")
for (.k in 1:3) {
  .zh[[paste0("\u{5de5}\u{4f5c}\u{9898}", .k)]] <- .mk_lab(.it[, .k], c("\u{975e}\u{5e38}\u{4e0d}\u{540c}\u{610f}" = 1, "\u{4e0d}\u{540c}\u{610f}" = 2,
                                                  "\u{4e2d}\u{7acb}" = 3, "\u{540c}\u{610f}" = 4,
                                                  "\u{975e}\u{5e38}\u{540c}\u{610f}" = 5),
                                     paste0("\u{6211}\u{5bf9}\u{5de5}\u{4f5c}\u{7684}\u{770b}\u{6cd5}", .k))
}
.zh$x <- NULL

.ko <- data.frame(x = seq_len(.n))
.ko[["\u{c131}\u{bcc4}"]] <- .mk_lab(.sex, c("\u{b0a8}\u{c131}" = 1, "\u{c5ec}\u{c131}" = 2), "\u{c751}\u{b2f5}\u{c790} \u{c131}\u{bcc4}")
.ko[["\u{b098}\u{c774}"]] <- .age
.ko[["\u{c18c}\u{b4dd}"]] <- .inc
.ko[["\u{c9c0}\u{c5ed}"]] <- .mk_lab(.reg, c("\u{c11c}\u{c6b8}" = 1, "\u{bd80}\u{c0b0}" = 2, "\u{acbd}\u{ae30}\u{b3c4} \u{bd81}\u{bd80}" = 3),
                         "\u{ac70}\u{c8fc} \u{c9c0}\u{c5ed}")
.ko$x <- NULL

.zl <- data.frame(x = seq_len(.n))
.zl[["\u{53d7}\u{8bbf}\u{8005}\u{7684}\u{6708}\u{6536}\u{5165}\u{6c34}\u{5e73}"]] <- .inc
.zl[["\u{5bf9}\u{793e}\u{533a}\u{516c}\u{5171}\u{670d}\u{52a1}\u{7684}\u{603b}\u{4f53}\u{6ee1}\u{610f}\u{7a0b}\u{5ea6}"]] <- .zh[["\u{6ee1}\u{610f}\u{5ea6}"]]
.zl[["\u{5c45}\u{4f4f}\u{5730}\u{533a}"]] <- .mk_lab(.reg, c("\u{5317}\u{90e8}\u{5c71}\u{533a}\u{53ca}\u{5468}\u{8fb9}\u{7684}\u{519c}\u{6751}\u{5730}\u{533a}\u{548c}\u{5c0f}\u{57ce}\u{9547}" = 1,
                                     "\u{5357}\u{90e8}\u{6cbf}\u{6d77}\u{7ecf}\u{6d4e}\u{7279}\u{533a}\u{548c}\u{9ad8}\u{65b0}\u{6280}\u{672f}\u{5f00}\u{53d1}\u{533a}" = 2,
                                     "\u{4e1c}\u{90e8}" = 3), "\u{53d7}\u{8bbf}\u{8005}\u{76ee}\u{524d}\u{5c45}\u{4f4f}\u{7684}\u{5730}\u{533a}")
.zl[["\u{6027}\u{522b}"]] <- .zh[["\u{6027}\u{522b}"]]
.zl$x <- NULL

# Two variables jconvert() converts, of different widths, a label on each code.
.zc <- data.frame(x = seq_len(6))
.zc[["\u{6ee1}\u{610f}\u{5ea6}"]] <- .mk_lab(c(1, 2, -99, 3, -98, 1),
                          c("\u{6ee1}\u{610f}" = 1, "\u{4e0d}\u{6ee1}\u{610f}" = 2, "\u{62d2}\u{7edd}\u{56de}\u{7b54}" = -99, "\u{4e0d}\u{77e5}\u{9053}" = -98),
                          "\u{6ee1}\u{610f}\u{5ea6}", na_values = c(-99, -98))
.zc[["q"]] <- .mk_lab(c(1, -99, 2, 1, 2, 2), c("yes" = 1, "no" = 2, "refused" = -99),
                      "q", na_values = -99)
.zc$x <- NULL

# --- The twin: every double-width character a distinct pair of letters ------

.tw_strings <- function(df) {
  s <- names(df)
  for (v in df) {
    s <- c(s, attr(v, "label", exact = TRUE),
           names(attr(v, "labels", exact = TRUE)))
    if (is.character(v)) s <- c(s, v)
  }
  s[!is.na(s)]
}
.tw_ch <- unique(unlist(strsplit(unlist(lapply(list(.zh, .ko, .zl, .zc), .tw_strings)),
                                 "")))
.tw_ch <- .tw_ch[nchar(.tw_ch, type = "width") == 2L]
.tw_ch <- .tw_ch[order(vapply(.tw_ch, utf8ToInt, integer(1)))]
.tw_codes <- sort(as.vector(outer(LETTERS[1:20], letters, paste0)),
                  method = "radix")[seq_along(.tw_ch)]
.tw_map <- stats::setNames(.tw_codes, .tw_ch)
.tr <- function(x) {
  if (is.null(x)) return(x)
  one <- function(s) {
    cs <- strsplit(s, "", fixed = TRUE)[[1L]]
    hit <- cs %in% names(.tw_map)
    cs[hit] <- .tw_map[cs[hit]]
    paste(cs, collapse = "")
  }
  out <- vapply(as.character(x), one, character(1), USE.NAMES = FALSE)
  out[is.na(x)] <- NA_character_
  if (!is.null(names(x))) names(out) <- vapply(names(x), one, character(1),
                                              USE.NAMES = FALSE)
  out
}
.tw_frame <- function(df) {
  out <- df
  for (j in seq_along(df)) {
    v <- df[[j]]
    lab  <- attr(v, "label", exact = TRUE)
    labs <- attr(v, "labels", exact = TRUE)
    if (is.character(v)) { a <- attributes(v); v <- .tr(v); attributes(v) <- a }
    if (!is.null(lab)) attr(v, "label") <- .tr(lab)
    if (!is.null(labs)) { names(labs) <- .tr(names(labs)); attr(v, "labels") <- labs }
    out[[j]] <- v
  }
  names(out) <- .tr(names(df))
  out
}
# Each twin's name is as long as its frame's (.Zh for .zh), so a line that
# prints the name breaks in the same place in both runs.
.Zh <- .tw_frame(.zh); .Ko <- .tw_frame(.ko); .Zl <- .tw_frame(.zl)
.Zc <- .tw_frame(.zc)
.tw_name <- c(zh = "Zh", ko = "Ko", zl = "Zl", zc = "Zc")

# One call, run on the frame and on its twin: TRUE when the outputs agree.
# The call is written with the CJK frame's names; for the twin each such
# character goes through the map and each frame name gains _t.
.twin_diff <- NULL
.twin_same <- function(text) {
  a <- .tr(.both(text))
  t_text <- .tr(text)
  for (k in names(.tw_name)) {
    t_text <- gsub(paste0("\\.", k, "\\b"), paste0(".", .tw_name[[k]]), t_text, perl = TRUE)
  }
  b <- .both(t_text)
  for (k in names(.tw_name)) {
    b <- gsub(paste0("\\.", .tw_name[[k]], "\\b"), paste0(".", k), b, perl = TRUE)
  }
  same <- identical(a, b)
  if (!same) .twin_diff <<- list(cjk = a, twin = b)
  same && length(a) > 0L
}

# --- E: text with no encoding mark sorts --------------------------------------
# R's radix sort refuses a vector whose first non-missing string is not ASCII
# and carries no encoding mark ("Character encoding must be UTF-8, Latin-1
# or bytes"), on every platform; a CSV file read by jload() gives exactly
# that text. Until v0.9.263 jencode() stopped in those words on any CSV
# variable whose first word was not ASCII.

.e1 <- .csv("e1.csv", c("city,n", "Z\u{fc}rich,1", "Gen\u{e8}ve,2", "Bern,3", "Z\u{fc}rich,4"))
.e2 <- .csv("e2.csv", c("\u{57ce}\u{5e02},n", "\u{5317}\u{4eac},1", "\u{4e0a}\u{6d77},2", "\u{5e7f}\u{5dde},3", "\u{5317}\u{4eac},4"))
.r_e1 <- run(jload(.e1, name = ".e1d", overwrite = TRUE, quiet = TRUE))
.r_e2 <- run(jload(.e2, name = ".e2d", overwrite = TRUE, quiet = TRUE))
check("E00 the two CSV files load, their text with no encoding mark (the condition under test; a control)",
      exists(".e1d") && exists(".e2d") &&
        all(Encoding(.e1d$city) == "unknown") && all(Encoding(.e2d[[1L]]) == "unknown"))
check("E01 jencode() on a CSV variable whose first word is accented encodes it, in byte order: Bern 1, Gen\u{e8}ve 2, Z\u{fc}rich 3 (it stopped: \"Character encoding must be UTF-8, Latin-1 or bytes\")",
      local({ r <- run(jencode(.e1d, city))
        !is.null(r$val) &&
          identical(unname(attr(r$val, "labels")), c(1, 2, 3)) &&
          identical(enc2utf8(names(attr(r$val, "labels"))),
                    enc2utf8(c("Bern", "Gen\u{e8}ve", "Z\u{fc}rich"))) &&
          identical(as.vector(unclass(r$val)), c(3, 2, 1, 3)) }))
check("E02 ... a Chinese CSV variable: encoded in code-point order (\u{4e0a}\u{6d77} 1, \u{5317}\u{4eac} 2, \u{5e7f}\u{5dde} 3), each cell its code",
      local({ r <- run(eval(parse(text = "jencode(.e2d, \u{57ce}\u{5e02})", encoding = "UTF-8")[[1L]]))
        !is.null(r$val) &&
          identical(enc2utf8(names(attr(r$val, "labels"))), enc2utf8(c("\u{4e0a}\u{6d77}", "\u{5317}\u{4eac}", "\u{5e7f}\u{5dde}"))) &&
          identical(as.vector(unclass(r$val)), c(2, 1, 3, 2)) }))
check("E03 ... in map mode, a word the map does not name is reported, not R's error (the unmapped words' sort)",
      local({ m <- grab(eval(parse(text = "jencode(.e2d, \u{57ce}\u{5e02}, map = \"\u{5317}\u{4eac}=1; \u{4e0a}\u{6d77}=2\")",
                                   encoding = "UTF-8")[[1L]]))
        !grepl("Character encoding", m, fixed = TRUE) &&
          grepl("\u{5e7f}\u{5dde}", m, fixed = TRUE) }))
.e4 <- local({ d <- .e2d
  d[[1L]][2L] <- .unmarked("\u{672a}\u{77e5}")
  d })
check("E04 a declared text value on such a column: jdeclare_missing() declares it and jencode() leaves it missing (the declared words' sort, and the code sort in .jst_missing_info())",
      local({ d <- suppressMessages(eval(parse(text =
        "jdeclare_missing(.e4, \u{57ce}\u{5e02}, codes = .unmarked(\"\u{672a}\u{77e5}\"))", encoding = "UTF-8")[[1L]]))
        r <- run(eval(parse(text = "jencode(d, \u{57ce}\u{5e02})", encoding = "UTF-8")[[1L]]))
        !is.null(d) && !is.null(r$val) && is.na(as.vector(unclass(r$val))[2L]) &&
          !grepl("Character encoding", r$txt, fixed = TRUE) }))
check("E05 two declared text values with no mark: the confirmation lists both (the text declaration's sort)",
      local({ m <- paste(.both(
        "jdeclare_missing(.e4, \u{57ce}\u{5e02}, codes = .unmarked(c(\"\u{672a}\u{77e5}\", \"\u{4e0d}\u{8be6}\")))"),
        collapse = "\n")
        !grepl("Character encoding", m, fixed = TRUE) &&
          grepl("\u{672a}\u{77e5}", m, fixed = TRUE) && grepl("\u{4e0d}\u{8be6}", m, fixed = TRUE) }))
check("E06 a cell that differs from a declared value only by an outer space is named as a near miss (the near-miss sort)",
      local({ d <- .e2d
        d[[1L]][2L] <- .unmarked("\u{672a}\u{77e5}"); d[[1L]][3L] <- .unmarked(" \u{672a}\u{77e5}")
        assign(".e6", d, envir = globalenv())
        m <- paste(.both("jdeclare_missing(.e6, \u{57ce}\u{5e02}, codes = .unmarked(\"\u{672a}\u{77e5}\"))"),
                   collapse = "\n")
        !grepl("Character encoding", m, fixed = TRUE) &&
          grepl("differs from a declared value only in", m, fixed = TRUE) &&
          grepl("\" \u{672a}\u{77e5}\" (1)", m, fixed = TRUE) }))
check("E07 .jst_text_order(): unmarked keys sort as their bytes; marked, latin1 and ASCII keys as before; NA last",
      local({ x <- .unmarked(c("Z\u{fc}rich", "Bern", NA, "Gen\u{e8}ve"))
        y <- enc2utf8(c("Z\u{fc}rich", "Bern", NA, "Gen\u{e8}ve"))
        identical(.jst_text_order(x), c(2L, 4L, 1L, 3L)) &&
          identical(.jst_text_order(y), order(y, method = "radix")) &&
          identical(.jst_text_order(c("b", "a", "c")), c(2L, 1L, 3L)) &&
          identical(.jst_text_order(c(2, 1), c("b", "a")), c(2L, 1L)) }))

# --- W: laid out by display width (the twin) ----------------------------------

.w_calls <- c(
  W01 = "jfreq(.zh, \u{6ee1}\u{610f}\u{5ea6})",
  W02 = "jdesc(.zh, \u{6536}\u{5165}, by = \u{5730}\u{533a})",
  W03 = "jt(\u{c18c}\u{b4dd} ~ \u{c131}\u{bcc4}, .ko)",
  W04 = "jaov(\u{6536}\u{5165} ~ \u{5730}\u{533a}, .zh, diagnostics = TRUE)",
  W05 = "jcrosstab(\u{c9c0}\u{c5ed} ~ \u{c131}\u{bcc4}, .ko, chisq = TRUE)",
  W06 = "jlm(\u{6536}\u{5165} ~ \u{5e74}\u{9f84} + \u{6027}\u{522b} + \u{5730}\u{533a}, .zh, categorical = \u{5730}\u{533a})",
  W07 = "jlogistic(\u{5c31}\u{4e1a} ~ \u{5e74}\u{9f84} + \u{5730}\u{533a}, .zh, categorical = \u{5730}\u{533a})",
  W08 = "jcorr(.zh, \u{5e74}\u{9f84}, \u{6536}\u{5165}, \u{6ee1}\u{610f}\u{5ea6})",
  W09 = "jalpha(.zh, \u{5de5}\u{4f5c}\u{9898}1, \u{5de5}\u{4f5c}\u{9898}2, \u{5de5}\u{4f5c}\u{9898}3)",
  W10 = "jscreen(.zl)",
  W11 = "jcrosstab(\u{5c45}\u{4f4f}\u{5730}\u{533a} ~ \u{6027}\u{522b}, .zl)",
  W12 = "invisible(jconvert(.zc, to = \"stata\"))",
  W13 = "invisible(jdeclare_missing(.zl, \u{53d7}\u{8bbf}\u{8005}\u{7684}\u{6708}\u{6536}\u{5165}\u{6c34}\u{5e73}, \u{5bf9}\u{793e}\u{533a}\u{516c}\u{5171}\u{670d}\u{52a1}\u{7684}\u{603b}\u{4f53}\u{6ee1}\u{610f}\u{7a0b}\u{5ea6}, codes = -99, convention = \"spss\"))")
.w_what <- c(
  W01 = "jfreq(): the value labels, the Missing block and the Total rows",
  W02 = "jdesc(by =): the group labels",
  W03 = "jt(): Korean group labels wider than the Group header",
  W04 = "jaov(diagnostics = TRUE): the group rows and the post-hoc Comparison column",
  W05 = "jcrosstab(): Korean row labels and column headers",
  W06 = "jlm(): the coefficient rows, a note's wrap",
  W07 = "jlogistic(): the coefficient rows",
  W08 = "jcorr(): the matrix's names, both ways",
  W09 = "jalpha(): the item tables",
  W10 = "jscreen(): long names in both tables",
  W11 = "jcrosstab(): labels of 16 characters (32 columns)",
  W12 = "jconvert(): the report's name and arrow columns, two variables",
  W13 = "jdeclare_missing(): the reminder's line for two long names, kept to the width")
for (.w in names(.w_calls)) {
  check(paste0(.w, " ", .w_what[[.w]], " -- the output equals its ASCII twin's, byte for byte"),
        .twin_same(.w_calls[[.w]]))
  if (!is.null(.twin_diff)) {
    .dl <- which(vapply(seq_len(max(length(.twin_diff$cjk), length(.twin_diff$twin))),
                        function(i) !identical(.twin_diff$cjk[i], .twin_diff$twin[i]),
                        logical(1)))
    for (.i in head(.dl, 3L)) {
      cat("        cjk:  ", .twin_diff$cjk[.i], "\n        twin: ", .twin_diff$twin[.i], "\n", sep = "")
    }
    .twin_diff <- NULL
  }
}

# The load scan's list and jload()'s rename note, from two CSV files: the
# file of Chinese names and its twin.
.lz_lines <- c("\u{6536}\u{5165} (\u{5143}),\u{6ee1}\u{610f}\u{5ea6},a b,followup_score",
               "5200,-99,34,1", "6100,4,41,-99", "4800,-99,29,2", "7300,5,55,1",
               "5900,-98,38,2")
.lz_f   <- .csv("lz.csv", .lz_lines)
.lz_t_f <- .csv("lt.csv", .tr(.lz_lines))     # a name as long as the file's
check("W14 jload(): the rename note's arrow column and the load scan's list of codes found -- the output equals its twin's (the list padded by BYTES, which put an accented name a column short)",
      local({
        a <- .tr(.both(paste0("jload(", deparse(.lz_f), ", name = \".lz\", overwrite = TRUE)")))
        b <- .both(paste0("jload(", deparse(.lz_t_f), ", name = \".lt\", overwrite = TRUE)"))
        b <- gsub("\\.lt\\b", ".lz", gsub("lt\\.csv", "lz.csv", b), perl = TRUE)
        identical(a, b) && any(grepl("codes detected", a, fixed = TRUE)) &&
          any(grepl("->", a, fixed = TRUE)) }))

# The variable-label legends (variable.id = "legend" and "legend.bottom").
check("W20 jdesc(variable.id = \"legend\"): the legend's names padded to one column, the equals signs in line -- the output equals its twin's (a control: it held on 0.9.262, formatC() padding a vector of names to the widest one's display width)",
      .twin_same("jdesc(.zh, \u{6536}\u{5165}, \u{5e74}\u{9f84}, \u{6ee1}\u{610f}\u{5ea6}, variable.id = \"legend\")"))
check("W21 jlm(variable.id = \"legend.bottom\"): the model's legend -- the output equals its twin's",
      .twin_same("jlm(\u{6536}\u{5165} ~ \u{5e74}\u{9f84} + \u{6ee1}\u{610f}\u{5ea6}, .zh, variable.id = \"legend.bottom\")"))

# jload()'s two notes on a CSV file's columns: kept as text for a leading
# zero, and numbers but for a few cells.
# The Chinese names are the widest of each note: formatC() pads one name at
# a time to the width it is given, so a width counted in characters left the
# widest name a column short for each character beyond the count.
.kz_lines <- c("\u{90ae}\u{653f}\u{7f16}\u{7801}\u{533a}\u{53f7},id_code,\u{6708}\u{6536}\u{5165}\u{6570}\u{636e},income2",
               "0800,007,5200,10", "0911,012,N/A,20", "0200,033,4800,-",
               "0300,044,-,40", "0400,055,6100,50")
.kz_f   <- .csv("kz.csv", .kz_lines)
.kz_t_f <- .csv("kt.csv", .tr(.kz_lines))
check("W22 jload(): the notes on columns kept as text and on numbers but for a few cells, their name columns -- the output equals its twin's",
      local({
        a <- .tr(.both(paste0("jload(", deparse(.kz_f), ", name = \".kz\", overwrite = TRUE)")))
        b <- .both(paste0("jload(", deparse(.kz_t_f), ", name = \".kt\", overwrite = TRUE)"))
        b <- gsub("\\.kt\\b", ".kz", gsub("kt\\.csv", "kz.csv", b), perl = TRUE)
        identical(a, b) && any(grepl("kept as text", a, fixed = TRUE)) &&
          any(grepl("except for a few cells", a, fixed = TRUE)) }))

# The width cap and the cut.
.wl <- data.frame(g = haven::labelled(c(1, 2, 1),
                    c(stats::setNames(1, strrep("\u{5f88}", 30)), "\u{77ed}" = 2)))
check("W15 a value label of 30 Chinese characters (60 columns) is cut to the 40-column cap, ending in ... (it was not cut: the cut counted characters)",
      local({ o <- .both("jfreq(.wl, g)")
        row <- grep("^1: ", o, value = TRUE)
        lab <- sub("\\s+[0-9].*$", "", row)
        length(row) == 1L && endsWith(lab, "...") && .cols(lab) <= 40L &&
          .cols(lab) >= 39L }))
check("W16 .jst_cut_width(): ASCII is cut as substr() cuts it; a two-column character that would straddle the edge is left out; a combining accent stays with its letter",
      identical(.jst_cut_width("abcdefgh", 5L), "abcde") &&
        identical(.jst_cut_width(strrep("\u{5f88}", 5), 5L), strrep("\u{5f88}", 2)) &&
        identical(.jst_cut_width("e\u{301}e\u{301}e\u{301}", 2L), "e\u{301}e\u{301}") &&
        identical(.jst_truncate_ellipsis(strrep("x", 41)), paste0(strrep("x", 37), "...")))
check("W17 a plot's axis label of 30 Chinese characters is cut to 35 columns (.jst_short_label(); it ran to 30 characters, 60 columns)",
      local({ x <- haven::labelled(1:2, label = strrep("\u{5f88}", 30))
        s <- .jst_short_label(x, "g")
        endsWith(s, "...") && .cols(s) <= 35L && .cols(s) >= 34L }))
check("W18 a note naming a variable of 14 Chinese characters wraps within the 76 columns (the wrap counted characters)",
      local({ m <- grab(eval(parse(text =
        "jdesc(.zl, \u{53d7}\u{8bbf}\u{8005}\u{7684}\u{6708}\u{6536}\u{5165}\u{6c34}\u{5e73}, \u{5bf9}\u{793e}\u{533a}\u{516c}\u{5171}\u{670d}\u{52a1}\u{7684}\u{603b}\u{4f53}\u{6ee1}\u{610f}\u{7a0b}\u{5ea6})", encoding = "UTF-8")[[1L]]))
        ls <- strsplit(m, "\n", fixed = TRUE)[[1L]]
        any(grepl("seems categorical", m, fixed = TRUE)) && all(.cols(ls) <= .pin_width) }))
# A line can fit the width in characters and overflow it in columns: the
# message wrapper's test of each line (.jst_seg_category()) must measure
# columns, or it passes the line whole. Names of 1 to 12 characters move the
# warning's first line through that window, whatever its wording.
check("W23 the \"seems categorical\" warning for a variable named with 1 to 12 Chinese characters stays within the width as R prints it, after \"Warning: \" (with 2, the line fits in characters and not in columns: it was passed whole, two columns over)",
      local({
        fits <- vapply(1:12, function(k) {
          nm <- paste(rep(c("\u{6536}", "\u{5165}", "\u{6c34}", "\u{5e73}", "\u{6708}", "\u{4efd}"), length.out = k),
                      collapse = "")
          d <- data.frame(x = c(1, 2, 3, 1, 2))
          names(d) <- nm
          e <- new.env()
          assign(".w23", d, envir = e)
          w <- character(0)
          withCallingHandlers(
            utils::capture.output(eval(call("jdesc", as.name(".w23"), as.name(nm)),
                                       envir = e)),
            warning = function(cnd) {
              w <<- c(w, conditionMessage(cnd)); invokeRestart("muffleWarning")
            })
          ls <- strsplit(paste0("Warning: ", w), "\n", fixed = TRUE)
          length(w) == 1L && grepl("seems categorical", w, fixed = TRUE) &&
            all(.cols(unlist(ls)) <= .pin_width)
        }, logical(1))
        all(fits) }))
check("W19.jst_dw(): NA stays NA, as nchar() gives it, so a caller's handling of a missing string is unchanged",
      identical(.jst_dw(c("ab", NA, "\u{5f88}")), c(2L, NA, 2L)))

# --- S: jsave() and SPSS's and SAS's limits -----------------------------------

.s_cat <- data.frame(id = 1:3)
.s_cat$f <- factor(c(strrep("\u{5f88}", 50), "\u{77ed}", "\u{77ed}"))
check("S01 .sav: a factor category of 50 Chinese characters (150 bytes) stops with the as.character() line, in bytes and what that means in letters (it saved, and the file held 40 characters)",
      local({ m <- grab(jsave(.s_cat, file.path(.nx_dir, "s1.sav")))
        grepl("f has a category longer than 120 bytes, which SPSS format (.sav) cannot store as a value label (an accented letter takes two bytes, and a Chinese, Japanese or Korean character three).",
              gsub("\n", " ", m), fixed = TRUE) &&
          grepl("  .s_cat$f <- as.character(.s_cat$f)", m, fixed = TRUE) &&
          !file.exists(file.path(.nx_dir, "s1.sav")) }))
check("S02 ... 40 Chinese characters (120 bytes) save; 41 (123 bytes) stop; an ASCII category of 121 characters keeps its sentence in characters",
      local({ a <- data.frame(f = factor(c(strrep("\u{5f88}", 40), "y")))
        b <- data.frame(f = factor(c(strrep("\u{5f88}", 41), "y")))
        c3 <- data.frame(f = factor(c(strrep("x", 121), "y")))
        ra <- run(jsave(a, file.path(.nx_dir, "s2a.sav")))
        mb <- grab(jsave(b, file.path(.nx_dir, "s2b.sav")))
        mc <- grab(jsave(c3, file.path(.nx_dir, "s2c.sav")))
        file.exists(file.path(.nx_dir, "s2a.sav")) &&
          grepl("longer than 120 bytes", mb, fixed = TRUE) &&
          grepl("f has a category longer than 120 characters, which SPSS format (.sav) cannot store as a value label.\nSave it",
                gsub("SPSS\nformat", "SPSS format", gsub("format\n\\(", "format (", mc)), fixed = TRUE) }))
check("S03 .sav: the note on a shortened value label says what 120 bytes is in letters (it said only \"fewer letters when they are accented\")",
      local({ v <- data.frame(id = 1:2)
        v$v <- haven::labelled(c(1, 2), c(stats::setNames(1, strrep("\u{957f}", 45)), b = 2))
        m <- grab(jsave(v, file.path(.nx_dir, "s3.sav")))
        grepl("(an accented letter takes two bytes, and a Chinese, Japanese or Korean character three)",
              gsub("\n", " ", m), fixed = TRUE) &&
          !grepl("when they are accented)", m, fixed = TRUE) }))
check("S04 .xpt: a name that starts with a Chinese letter holds a character SAS does not take (it was said not to start with a letter); a name starting with a digit keeps its reason",
      local({ z <- data.frame(1:2, 3:4, 5:6)
        names(z) <- c("\u{7f16}\u{53f7}", "x1", "1x")
        m <- grab(jsave(z, file.path(.nx_dir, "s4.xpt")))
        grepl("\"\u{7f16}\u{53f7}\" +-> V1 +\\(holds a character SAS does not take\\)", m) &&
          grepl("(does not start with a letter or underscore)", m, fixed = TRUE) &&
          sum(gregexpr("does not start with a letter", m, fixed = TRUE)[[1L]] > 0L) == 1L }))
check("S05 .sav and .dta keep Chinese and Korean names, labels and value labels whole on the round trip (a control on the reads)",
      local({ f1 <- file.path(.nx_dir, "rt.sav"); f2 <- file.path(.nx_dir, "rt.dta")
        st <- suppressMessages(jconvert(.ko, to = "stata", missing.notice = FALSE))
        run(jsave(.ko, f1)); run(jsave(st, f2))
        a <- haven::read_sav(f1, user_na = TRUE); b <- haven::read_dta(f2)
        identical(enc2utf8(names(a)), enc2utf8(names(.ko))) &&
          identical(enc2utf8(names(b)), enc2utf8(names(.ko))) &&
          identical(enc2utf8(names(attr(a[["\u{c9c0}\u{c5ed}"]], "labels"))),
                    enc2utf8(c("\u{c11c}\u{c6b8}", "\u{bd80}\u{c0b0}", "\u{acbd}\u{ae30}\u{b3c4} \u{bd81}\u{bd80}"))) &&
          identical(enc2utf8(attr(b[["\u{c131}\u{bcc4}"]], "label")), enc2utf8("\u{c751}\u{b2f5}\u{c790} \u{c131}\u{bcc4}")) }))

# --- D: dummy names keep letters of any script --------------------------------

check("D01 jdummy() on Chinese value labels names the dummies by them, with no note that the labels were not available (it named them by code: \u{5730}\u{533a}_2)",
      local({ m <- paste(.both("jdummy(.zh, \u{5730}\u{533a})"), collapse = "\n")
        jdummy(clear.all = TRUE)
        grepl("Dummy variables: \u{5730}\u{533a}_\u{5357}\u{90e8}\u{5730}\u{533a}, \u{5730}\u{533a}_\u{4e1c}\u{90e8}\u{6cbf}\u{6d77}\u{5730}\u{533a}", m, fixed = TRUE) &&
          !grepl("built from numeric codes", m, fixed = TRUE) }))
check("D02 an accented label keeps its letters (S\u{f8}r, not S_r), and ref = matches it as typed",
      local({ d <- data.frame(r = haven::labelled(rep(1:2, 3), c(Nord = 1, "S\u{f8}r" = 2)),
                              e = rep(c("\u{c9}tudiant", "Ouvrier"), 3))
        assign(".d02", d, envir = globalenv())
        m1 <- paste(.both("jdummy(.d02, r, ref = \"S\u{f8}r\")"), collapse = "\n")
        m2 <- paste(.both("jdummy(.d02, e)"), collapse = "\n")
        jdummy(clear.all = TRUE)
        grepl("Reference category: r_S\u{f8}r", m1, fixed = TRUE) &&
          grepl("Reference category: .d02_e|Reference category: e_\u{c9}tudiant", m2) }))
check("D03 a registration stored under the A-to-Z rule (S_r, no stored values) still finds its values; a label of symbols and ASCII keeps its old name (Not_sure)",
      identical(.jst_dummy_category_values(
                  list(var_name = "e", var_type = "character", codes = 1:2,
                       labels = c("e_Ouvrier", "e_tudiant")),
                  c("\u{c9}tudiant", "Ouvrier")),
                c("Ouvrier", "\u{c9}tudiant")) &&
        identical(.jst_dummy_canon(c("Not sure?", "S\u{f8}r", "\u{5317}\u{90e8} \u{5730}\u{533a}", "--")),
                  c("Not_sure", "S\u{f8}r", "\u{5317}\u{90e8}_\u{5730}\u{533a}", "")))
check("D04 jlm(): a Chinese categorical's rows are labelled, and no note says its labels were not available",
      local({ m <- paste(.both("jlm(\u{6536}\u{5165} ~ \u{5e74}\u{9f84} + \u{5730}\u{533a}, .zh, categorical = \u{5730}\u{533a})"), collapse = "\n")
        grepl("2: \u{5357}\u{90e8}\u{5730}\u{533a}", m, fixed = TRUE) && !grepl("built from numeric codes", m, fixed = TRUE) }))

# --- F: full-width punctuation in a map or labels string ----------------------

.f_d <- data.frame(s = haven::labelled(c(1, 2, 1), c(a = 1, b = 2)))
check("F01 jrelabel(): labels holding a full-width semicolon stops, naming it, with the call retyped (it made ONE label, \"\u{7537}\u{ff1b}2=\u{5973}\")",
      identical(grab(jrelabel(.f_d, s, labels = "1=\u{7537}\u{ff1b}2=\u{5973}")), paste0(
        "jrelabel(): labels holds a full-width semicolon (\u{ff1b}).\n",
        "Type the plain semicolon (;) instead:\n",
        "  jrelabel(.f_d, s, labels = \"1=\u{7537}; 2=\u{5973}\")")))
check("F02 ... and the retyped line runs, giving the two labels",
      local({ m <- grab(jrelabel(.f_d, s, labels = "1=\u{7537}\u{ff1b}2=\u{5973}"))
        ln <- trimws(strsplit(m, "\n", fixed = TRUE)[[1L]][3L])
        r <- run(eval(parse(text = ln, encoding = "UTF-8")[[1L]]))
        !is.null(r$val) &&
          identical(enc2utf8(names(attr(r$val, "labels"))), enc2utf8(c("\u{7537}", "\u{5973}"))) }))
check("F03 jdeclare_missing(): labels holding one stops (it kept the first code and gave it the rest as its label)",
      startsWith(grab(jdeclare_missing(.f_d, s, codes = -99, labels = "-99=\u{62d2}\u{7edd}\u{ff1b}-98=\u{4e0d}\u{77e5}\u{9053}",
                                       convention = "spss")),
                 "jdeclare_missing(): labels holds a full-width semicolon (\u{ff1b})."))
check("F04 jrecode(): a full-width equals sign is named (it stopped with \"each rule must contain '='\")",
      startsWith(grab(jrecode(.f_d, s, map = "1\u{ff1d}2; else=copy")),
                 "jrecode(): map holds a full-width equals sign (\u{ff1d}).\nType the plain equals sign (=) instead:"))
check("F05 jencode(): a full-width comma and semicolon are named together",
      startsWith(grab(jencode(data.frame(t = c("a", "b")), t, map = "a\u{ff0c}b=1\u{ff1b}else=2")),
                 "jencode(): map holds full-width punctuation (\u{ff0c} \u{ff1b})."))
check("F06 a quoted label may hold a full-width semicolon (ruling R17's quotes), and an ideographic space beside one becomes a plain space in the retyped call",
      local({ r <- run(jrelabel(.f_d, s, labels = "1=\"M\u{ff1b}x\"; 2=F"))
        m <- grab(jrelabel(.f_d, s, labels = "1=M\u{ff1b}\u{3000}2=F"))
        !is.null(r$val) && identical(enc2utf8(names(attr(r$val, "labels"))), enc2utf8(c("M\u{ff1b}x", "F"))) &&
          grepl("labels = \"1=M; 2=F\")", m, fixed = TRUE) }))

check("F07 a retyped call holding a long Chinese labels string is laid out within the 76 columns (broken after its semicolon), and the call it makes runs",
      local({ m <- grab(jrelabel(.f_d, s, labels = "1=\u{975e}\u{5e38}\u{4e0d}\u{6ee1}\u{610f}\u{7684}\u{670d}\u{52a1}\u{60c5}\u{51b5}\u{548c}\u{4f53}\u{9a8c}\u{ff1b}2=\u{975e}\u{5e38}\u{6ee1}\u{610f}\u{7684}\u{670d}\u{52a1}\u{60c5}\u{51b5}\u{548c}\u{4f53}\u{9a8c}"))
        ls <- strsplit(m, "\n", fixed = TRUE)[[1L]]
        i  <- grep("^  jrelabel\\(", ls)
        cl <- if (length(i)) paste(trimws(ls[i[1L]:length(ls)]), collapse = " ") else ""
        r  <- run(eval(parse(text = cl, encoding = "UTF-8")[[1L]]))
        length(ls) > i[1L] && all(.cols(ls) <= .pin_width) && !is.null(r$val) &&
          identical(enc2utf8(names(attr(r$val, "labels"))),
                    enc2utf8(c("\u{975e}\u{5e38}\u{4e0d}\u{6ee1}\u{610f}\u{7684}\u{670d}\u{52a1}\u{60c5}\u{51b5}\u{548c}\u{4f53}\u{9a8c}", "\u{975e}\u{5e38}\u{6ee1}\u{610f}\u{7684}\u{670d}\u{52a1}\u{60c5}\u{51b5}\u{548c}\u{4f53}\u{9a8c}"))) }))

# --- T: an offered call keeps the user's text as typed ------------------------
# .jst_term_text(), which every offered call goes through (.jst_call_with()),
# collapsed every run of white space to one space, inside quoted strings too:
# a file named with two spaces was offered under another name, and an
# ideographic space inside a label became a plain one (found S390).

check("T01 jload()'s pointer for a name typed bare offers the file as it is named, two spaces kept (it offered \"my data.csv\" for \"my  data.csv\", a line that stopped)",
      local({ f <- .csv("my  data.csv", c("a,b", "1,2"))
        m <- .both(paste0("jload(", deparse(f), ", name = nx_not_a_name)"))
        i  <- grep("^  jload\\(", m)
        # the offered call, its lines joined (ruling R5 breaks a wide call
        # after a comma, and the folder's name makes this one wide)
        ln <- if (length(i)) paste(trimws(m[i[1L]:length(m)]), collapse = " ") else ""
        ok <- grepl("my  data.csv", ln, fixed = TRUE)
        run(eval(parse(text = sub("\\)$", ", overwrite = TRUE)", ln)), envir = globalenv()))
        ok && exists("nx_not_a_name", envir = globalenv(), inherits = FALSE) }))
check("T02 the full-width stop keeps an ideographic space inside a quoted label, and the spacing between a call's arguments is still made one space",
      local({ m <- grab(jrelabel(.f_d, s, labels = "1=\"\u{5317}\u{4eac}\u{3000}\u{5e02}\"\u{ff1b}2=F"))
        grepl("labels = \"1=\\\"\u{5317}\u{4eac}\u{3000}\u{5e02}\\\"; 2=F\")", m, fixed = TRUE) &&
          identical(.jst_term_text(quote(f(a,   b, "x  y"))), "f(a, b, \"x  y\")") &&
          identical(.jst_term_text(quote(I(x   >  2))), "I(x > 2)") }))

# --- The message surface, swept in display columns (guard 4) ------------------

.sw <- Filter(function(s) identical(as.numeric(s$width), as.numeric(.pin_width)),
              .seen)
.sw <- .sw[!duplicated(vapply(.sw, function(s) paste(s$kind, s$text), ""))]
.sw_txt <- function(s) gsub("\033\\[[0-9;]*m", "", s$text)

.ln <- unlist(lapply(.sw, function(s) strsplit(.sw_txt(s), "\n", fixed = TRUE)[[1]]))
.ln <- .ln[nzchar(trimws(.ln)) & !grepl("^\\s{2}", .ln)]
# A file path on a line of its own (jsave()'s Saved line puts it there,
# S230) cannot be broken, and this file saves to a folder of R's temporary
# folder, which on Windows is long: the path lines are left out, as
# import_check.R leaves them out and Z02 does (the run with a 35-character
# temporary folder found one, S390).
.ln <- .ln[!grepl("^([A-Za-z]:[\\\\/]|/|~|\\\\\\\\)", .ln)]
check(paste0("Z01 no prose line of a message exceeds ", .pin_width,
             " columns, measured in display columns (", length(.sw), " conditions)"),
      length(.sw) >= 20L && !any(.cols(.ln) > .pin_width))

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
    if (.cols(a) + 1L + .cols(unit(b)) <= budget)
      out <- c(out, sprintf("[%d] %s | %s", i, a, unit(b)))
  }
  out
}
.pb <- unlist(lapply(.sw, function(s) {
  pbreaks(.sw_txt(s), .pin_width, switch(s$kind, error = 8L, warning = 9L, 0L))
}))
check("Z02 no premature break: a line's first unit never fit on the line above (in display columns)",
      length(.sw) >= 20L && length(.pb) == 0L)
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
.up <- lapply(.sw, function(s) unparsed(.sw_txt(s)))
.ub <- unlist(lapply(.up, function(u) u$bad))
check("Z03 every runnable line in a message parses",
      length(.ub) == 0L)
if (length(.ub) > 0L) for (l in .ub) cat("        does not parse: ", l, "\n")

# --- Restore session state ---------------------------------------------------

options(.jst_options_message_width = .entry_message_width)
options(.jst_default_data          = .entry_default_data)
options(.jst_output_level          = .entry_output_level)
options(.jst_output_toggles = .entry_output_toggles)
options(.jst_options_missing_convention = .entry_convention,
        .jst_options_missing_convention_codes = .entry_conv_codes,
        .jst_options_data_dir = .entry_data_dir)
options(.entry_stores)
unlink(.nx_dir, recursive = TRUE)

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
  for (r in .results) if (!r$ok) cat("  failed: ", r$desc, "\n", sep = "")
  .ws_restore()
  stop("assertion battery failed", call. = FALSE)
}
