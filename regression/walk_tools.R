# =============================================================================
# walk_tools.R -- rewalk(): run a walkthrough's pending sections, or one section
# =============================================================================
# TYPE:     runner for the *_walk.R files in this folder (S337; decided S335)
# USAGE:    with jstats loaded, source this file once per session:
#             source("E:/00 R Projects/00_jstats_test_data/regression/walk_tools.R")
#           then
#             rewalk()                  the scoreboard: every walk, and the
#                                       sections its PENDING line names
#             rewalk("filter")          run filter_walk.R's pending sections,
#                                       pausing between them
#             rewalk("filter", "C5")    run one section (several: c("C5", "C7"))
#             rewalk("cps", "B")        run every section of a Part
#             rewalk("filter", "all")   run every section
#             rewalk("filter", "C5", prepare = TRUE)
#                                       run what C5 needs, with nothing shown,
#                                       then open the file at C5 and stop:
#                                       you step through it with Ctrl+Enter
#           A walk is named by its file name, its stem, or the start of it
#           ("missing" finds missing_convention_walk.R).
#
# WHAT A RUN DOES, for each section asked for:
#   1. runs the file's Setup (everything above the first PART or SECTION
#      banner) with nothing shown -- except a Setup heads-up, any block of
#      Setup output whose first line begins "***", which is shown once;
#   2. runs, with nothing shown, the code under the section's PART banner
#      (a Part-level fixture) and every section its "# NEEDS:" line names,
#      and theirs, in file order;
#   3. shows the section as the file has it -- banner, framing comments, each
#      statement behind a "> " prompt, its output where it falls, the
#      Expected comments -- so the output sits directly above the Expected
#      it is read against;
#   4. runs the file's foot (the Restore block), with nothing shown, so the
#      session is handed back as the walk hands it back.
#   Before step 1 it removes from the workspace whatever its own earlier runs
#   created there (and nothing else), so a section that reports on the data
#   frames in the workspace -- missing_convention_walk.R Sections 1, 2 and
#   14b; modify_form_walk.R Sections 2 and 3 -- is not shown the leftovers of
#   the section walked before it. What the LAST section made stays, for a
#   look at its fixture, until the next rewalk() call.
#   Every section therefore starts from the same state whatever ran before
#   it, in this call or in the session. An uncaught error is printed where it
#   happens and the section carries on, as it would line by line.
#
# prepare = TRUE does steps 1 and 2 for ONE section and stops there: the file
#   is opened in RStudio with the cursor on the section's first statement (or
#   the line number is printed, where RStudio cannot be asked), and the
#   section is yours to run. The foot has not run, so the session stays in
#   the walk's state -- its forced width, warn level and so on -- until the
#   next rewalk() call of any kind, which runs that walk's foot before it
#   does anything else. With several sections asked for or pending, the first
#   is prepared and the call for the next is printed.
#
# WHAT IT READS IN A WALK (the conventions are in _template_walk.R):
#   # PENDING:  C5, C7 (S338, v0.9.212)      a header line; "none" when clear.
#                                            Groups are separated by ";", and
#                                            D12-D14 is a range in file order.
#   # SECTION C5 -- <title> ----             a section banner's title line; the
#   # C5 -- <title> ----                     short form is cps_walk.R's
#   # NEEDS: C1, C4                          inside a banner: sections that
#                                            must run first
#   # PART C -- <title> ----                 a Part banner
#   # --- Restore ... / # --- End marker     where the foot begins
#   The registry in JStats_Testing_File_Conventions.txt stays the record of
#   what was walked at which version; the PENDING line only drives this file.
#
# ONE OBJECT: everything lives inside rewalk's own environment, so sourcing
#   this file adds one name to the workspace and no data frame -- the walks
#   that scan the global environment (missing_convention_walk.R, Sections
#   1-3 and 14b) see nothing new.
# =============================================================================

rewalk <- local({

  # Where the walks are: the folder this file was sourced from, else the
  # standing regression folder.
  DEFAULT_DIR <- "E:/00 R Projects/00_jstats_test_data/regression"
  WALK_DIR <- local({
    here <- NULL
    for (i in rev(seq_len(sys.nframe()))) {
      of <- sys.frame(i)$ofile
      if (!is.null(of)) { here <- dirname(normalizePath(of, winslash = "/",
                                                        mustWork = FALSE))
                          break }
    }
    if (!is.null(here) && dir.exists(here)) here else DEFAULT_DIR
  })

  # --- small helpers ---------------------------------------------------------

  say <- function(...) cat("rewalk> ", ..., "\n", sep = "")

  halt <- function(...) stop("rewalk(): ", ..., call. = FALSE)

  # A decoration rule: "# ====...", "# ----...", or the spaced forms
  # "# = = = ..." and "# - - - ..." (S337).
  is_rule <- function(x) grepl("^# ([=-])( ?\\1){19,}\\s*$", x, perl = TRUE)

  RE_SECTION <- "^# (?:SECTION )?([A-Z]?[0-9]+[a-z]?) -- (.*?)(?: -{4,})?\\s*$"
  RE_PART    <- "^# PART ([A-Z]) -- (.*?)(?: -{4,})?\\s*$"
  RE_NEEDS   <- "^# NEEDS:\\s*(.*?)\\s*$"
  RE_FOOT    <- "^# --- (Restore|End marker)"
  RE_SETUP   <- "^# --- Setup"

  has_code <- function(lines) {
    any(nzchar(trimws(lines)) & !startsWith(trimws(lines), "#"))
  }

  split_ids <- function(x) {
    x <- trimws(unlist(strsplit(x, "[,[:space:]]+")))
    x[nzchar(x)]
  }

  # --- reading a walk --------------------------------------------------------

  find_walks <- function(dir) {
    f <- list.files(dir, pattern = "_walk\\.R$", full.names = TRUE)
    f[!startsWith(basename(f), "_")]
  }

  resolve_file <- function(file, dir) {
    if (!dir.exists(dir)) halt("folder not found: ", dir)
    if (file.exists(file) && !dir.exists(file)) return(file)
    walks <- find_walks(dir)
    stems <- sub("_walk\\.R$", "", basename(walks))
    key   <- sub("(_walk)?(\\.R)?$", "", basename(file))
    hit <- which(stems == key)
    if (length(hit) == 0L) hit <- which(startsWith(stems, key))
    if (length(hit) == 1L) return(walks[hit])
    if (length(hit) == 0L) {
      halt("no walk matches \"", file, "\". The walks in ", dir, ":\n  ",
           paste(basename(walks), collapse = "\n  "))
    }
    halt("\"", file, "\" matches more than one walk: ",
         paste(basename(walks[hit]), collapse = ", "))
  }

  parse_walk <- function(path) {
    ln <- readLines(path, warn = FALSE, encoding = "UTF-8")
    n  <- length(ln)

    setup_at <- grep(RE_SETUP, ln)
    if (length(setup_at) == 0L) {
      halt(basename(path), " has no \"# --- Setup\" line.")
    }
    setup_at <- setup_at[1L]

    # Banners below Setup: a rule, one or more comment lines, a rule.
    banners <- list()
    i <- setup_at
    while (i < n) {
      if (is_rule(ln[i])) {
        j <- i + 1L
        while (j <= n && startsWith(ln[j], "#") && !is_rule(ln[j])) j <- j + 1L
        if (j <= n && j > i + 1L && is_rule(ln[j])) {
          banners[[length(banners) + 1L]] <- c(i, j)
          i <- j + 1L
          next
        }
      }
      i <- i + 1L
    }

    foot_at <- grep(RE_FOOT, ln)
    foot_at <- foot_at[foot_at > setup_at]
    foot_at <- if (length(foot_at)) foot_at[1L] else n + 1L

    blocks <- list()
    part   <- NA_character_
    for (k in seq_along(banners)) {
      b     <- banners[[k]]
      if (b[1L] >= foot_at) break
      title <- ln[(b[1L] + 1L):(b[2L] - 1L)]
      sec   <- grep(RE_SECTION, title, perl = TRUE)
      prt   <- grep(RE_PART, title, perl = TRUE)
      nd    <- grep(RE_NEEDS, title, perl = TRUE)
      end   <- if (k < length(banners)) banners[[k + 1L]][1L] - 1L else n
      end   <- min(end, foot_at - 1L)
      if (length(prt)) {
        part <- sub(RE_PART, "\\1", title[prt[1L]], perl = TRUE)
      }
      kind <- if (length(sec)) "section" else if (length(prt)) "part" else "other"
      blocks[[length(blocks) + 1L]] <- list(
        kind  = kind,
        id    = if (length(sec)) sub(RE_SECTION, "\\1", title[sec[1L]],
                                     perl = TRUE) else NA_character_,
        title = if (length(sec)) sub(RE_SECTION, "\\2", title[sec[1L]],
                                     perl = TRUE)
                else if (length(prt)) sub(RE_PART, "\\2", title[prt[1L]],
                                          perl = TRUE)
                else sub("^# ?", "", title[1L]),
        part  = part,
        needs = if (length(nd)) split_ids(sub(RE_NEEDS, "\\1", title[nd[1L]],
                                              perl = TRUE))
                else character(0),
        start = b[1L], body = b[2L] + 1L, end = end)
    }

    is_sec <- vapply(blocks, function(b) b$kind == "section", logical(1))
    if (!any(is_sec)) halt(basename(path), " has no section banner.")
    first  <- blocks[[1L]]$start
    ids    <- vapply(blocks[is_sec], function(b) b$id, "")
    if (anyDuplicated(ids)) {
      halt(basename(path), " names a section twice: ",
           paste(unique(ids[duplicated(ids)]), collapse = ", "))
    }

    # The PENDING header line, with any continuation lines under it.
    pend_at  <- grep("^# PENDING:", ln[seq_len(setup_at)])
    pending  <- NULL
    pend_txt <- NA_character_
    if (length(pend_at)) {
      p <- pend_at[1L]
      txt <- sub("^# PENDING:\\s*", "", ln[p])
      q <- p + 1L
      while (q < setup_at && grepl("^#\\s{6,}\\S", ln[q])) {
        txt <- paste(txt, trimws(sub("^#", "", ln[q])))
        q <- q + 1L
      }
      pend_txt <- trimws(txt)
    }

    w <- list(path = path, name = basename(path), lines = ln,
              setup = c(1L, first - 1L), foot = c(foot_at, n),
              blocks = blocks, sections = which(is_sec), ids = ids,
              has_pending_line = length(pend_at) > 0L, pending_text = pend_txt)
    w$pending <- parse_pending(w)
    for (b in blocks[is_sec]) {
      bad <- setdiff(b$needs, ids)
      if (length(bad)) {
        halt(w$name, ", section ", b$id, ": NEEDS names ",
             paste(bad, collapse = ", "), ", which is not a section of the file.")
      }
    }
    w
  }

  # "C5, C7 (S338, v0.9.212); D12-D14 (S339, v0.9.213)" ->
  # list(ids, groups = list(list(ids, note)), unknown)
  parse_pending <- function(w) {
    out <- list(ids = character(0), groups = list(), unknown = character(0))
    txt <- w$pending_text
    if (is.na(txt) || !nzchar(txt) ||
        grepl("^\\(?none\\)?\\.?$", txt, ignore.case = TRUE)) return(out)
    for (g in trimws(unlist(strsplit(txt, ";", fixed = TRUE)))) {
      if (!nzchar(g)) next
      note <- if (grepl("\\(.*\\)\\s*$", g)) sub("^[^(]*", "", g) else ""
      toks <- split_ids(sub("\\(.*$", "", g))
      got  <- character(0)
      for (tk in toks) {
        r <- expand_id(w, tk)
        if (length(r)) got <- c(got, r) else out$unknown <- c(out$unknown, tk)
      }
      out$groups[[length(out$groups) + 1L]] <- list(ids = got, note = note,
                                                    text = g)
      out$ids <- c(out$ids, got)
    }
    out$ids <- w$ids[w$ids %in% out$ids]          # file order, once each
    out
  }

  # One token -> section ids: an id, a range A-B in file order, a Part
  # letter, or "all". Matching ignores case.
  expand_id <- function(w, tk) {
    ids <- w$ids
    up  <- toupper(ids)
    t   <- toupper(trimws(as.character(tk)))
    if (t == "ALL") return(ids)
    if (t %in% up) return(ids[match(t, up)])
    if (grepl("^[A-Z]?[0-9]+[A-Z]?-[A-Z]?[0-9]+[A-Z]?$", t)) {
      ends <- strsplit(t, "-", fixed = TRUE)[[1L]]
      a <- match(ends[1L], up); b <- match(ends[2L], up)
      if (!is.na(a) && !is.na(b) && a <= b) return(ids[a:b])
      return(character(0))
    }
    t <- sub("^PART\\s+", "", t)
    parts <- vapply(w$blocks[w$sections], function(b) b$part, "")
    if (nchar(t) == 1L && t %in% parts) return(ids[!is.na(parts) & parts == t])
    character(0)
  }

  block_of <- function(w, id) w$blocks[[w$sections[match(id, w$ids)]]]

  # Every section `id` needs, and what those need, in file order.
  needs_of <- function(w, id) {
    seen <- character(0)
    todo <- block_of(w, id)$needs
    while (length(todo)) {
      x <- todo[1L]; todo <- todo[-1L]
      if (x %in% seen || x == id) next
      seen <- c(seen, x)
      todo <- c(todo, block_of(w, x)$needs)
    }
    w$ids[w$ids %in% seen]
  }

  # The code under the section's PART banner, if that banner has any.
  part_block <- function(w, id) {
    at <- w$sections[match(id, w$ids)]
    k  <- at - 1L
    while (k >= 1L) {
      b <- w$blocks[[k]]
      if (b$kind == "part") {
        return(if (has_code(w$lines[b$body:b$end])) b else NULL)
      }
      k <- k - 1L
    }
    NULL
  }

  # --- running lines ---------------------------------------------------------

  use_color <- function() {
    identical(Sys.getenv("RSTUDIO"), "1") && interactive()
  }

  echo_code <- function(lines, color) {
    out <- paste0(c("> ", rep("+ ", length(lines) - 1L)), lines)
    if (color) out <- paste0("\033[34m", out, "\033[39m")
    cat(out, sep = "\n")
  }

  show_error <- function(e) {
    cl <- conditionCall(e)
    cat(if (is.null(cl)) "Error: "
        else paste0("Error in ", deparse(cl)[1L], " : "),
        conditionMessage(e), "\n", sep = "", file = stderr())
  }

  # R holds warnings until a top-level statement ends when warn is 0, and
  # prints them under "Warning message:". A statement run from inside
  # rewalk() is not top-level, so that is done here.
  show_warnings <- function(ws) {
    one <- function(w) {
      cl <- conditionCall(w)
      if (is.null(cl)) conditionMessage(w)
      else paste0("In ", deparse(cl)[1L], " : ", conditionMessage(w))
    }
    if (length(ws) == 1L) {
      cat("Warning message:\n", one(ws[[1L]]), "\n", sep = "", file = stderr())
    } else {
      cat("Warning messages:\n",
          paste0(seq_along(ws), ": ", vapply(ws, one, ""), collapse = "\n"),
          "\n", sep = "", file = stderr())
    }
  }

  # Run lines [from, to] of the walk in the global environment.
  #   show = TRUE   echo comments and code, let output through, carry on past
  #                 an uncaught error. Returns the number of such errors.
  #   show = FALSE  nothing shown; an uncaught error is returned as
  #                 list(line, message) and the run of these lines stops.
  #                 stdout is returned in attr(, "out").
  run_lines <- function(w, from, to, show, color = FALSE) {
    if (to < from) return(if (show) 0L else NULL)
    src   <- w$lines[from:to]
    exprs <- tryCatch(parse(text = src, keep.source = TRUE),
                      error = function(e) {
                        halt(w$name, ", lines ", from, "-", to,
                             " do not parse: ", conditionMessage(e))
                      })
    refs <- attr(exprs, "srcref")
    env  <- globalenv()

    if (!show) {
      tf  <- tempfile()
      con <- file(tf, open = "wt")
      depth <- sink.number()
      sink(con)
      on.exit({
        while (sink.number() > depth) sink()
        close(con)
        unlink(tf)
      }, add = TRUE)
      failed <- NULL
      for (i in seq_along(exprs)) {
        failed <- tryCatch({
          withCallingHandlers(
            eval(exprs[[i]], env),
            message = function(m) invokeRestart("muffleMessage"),
            warning = function(w) invokeRestart("muffleWarning"))
          NULL
        }, error = function(e) {
          list(line = from + refs[[i]][1L] - 1L, message = conditionMessage(e))
        })
        if (!is.null(failed)) break
      }
      while (sink.number() > depth) sink()
      flush(con)
      out <- readLines(tf, warn = FALSE)
      res <- if (is.null(failed)) list() else failed
      attr(res, "out") <- out
      return(res)
    }

    pos    <- 1L
    errors <- 0L
    for (i in seq_along(exprs)) {
      first <- refs[[i]][1L]
      last  <- refs[[i]][3L]
      if (first >= pos) {
        if (first > pos) cat(src[pos:(first - 1L)], sep = "\n")
        echo_code(src[first:last], color)
        pos <- last + 1L
      }
      held <- list()
      tryCatch({
        r <- withCallingHandlers(
          withVisible(eval(exprs[[i]], env)),
          warning = function(w) {
            if (identical(as.integer(getOption("warn")), 0L)) {
              held[[length(held) + 1L]] <<- w
              invokeRestart("muffleWarning")
            }
          })
        if (r$visible) {
          if (isS4(r$value)) methods::show(r$value) else print(r$value)
        }
      }, error = function(e) {
        errors <<- errors + 1L
        show_error(e)
      })
      if (length(held)) show_warnings(held)
    }
    if (pos <= length(src)) cat(src[pos:length(src)], sep = "\n")
    errors
  }

  # A Setup heads-up: a block of Setup output whose first line begins "***",
  # through the line before the next empty one.
  heads_up <- function(out) {
    at <- grep("^\\*\\*\\*", out)
    if (length(at) == 0L) return(character(0))
    keep <- character(0)
    for (a in at) {
      b <- a
      while (b < length(out) && nzchar(out[b + 1L])) b <- b + 1L
      keep <- c(keep, out[a:b], "")
    }
    keep
  }

  # --- what rewalk() itself left in the workspace -----------------------------

  made <- character(0)

  # A walk left open by prepare = TRUE: list(w, before), or NULL.
  left_open <- NULL

  close_open <- function() {
    if (is.null(left_open)) return(invisible(FALSE))
    o <- left_open
    left_open <<- NULL
    foot <- run_lines(o$w, o$w$foot[1L], o$w$foot[2L], show = FALSE)
    made <<- union(made, setdiff(ws_names(), o$before))
    if (length(foot)) {
      say("! the foot of ", o$w$name, " (left open by prepare = TRUE) stopped ",
          "at line ", foot$line, ":")
      cat("    ", foot$message, "\n", sep = "")
    } else {
      say("ran the foot of ", o$w$name, ", left open by prepare = TRUE.")
    }
    invisible(TRUE)
  }

  ws_names <- function() {
    setdiff(ls(globalenv(), all.names = TRUE), c(".Random.seed", "rewalk"))
  }

  sweep <- function() {
    gone <- intersect(made, ws_names())
    if (length(gone)) rm(list = gone, envir = globalenv())
    made <<- character(0)
    invisible(length(gone))
  }

  # --- one section, start to finish ------------------------------------------

  # Steps 1 and 2: sweep, Setup, the Part fixture, the NEEDS -- nothing shown
  # but a Setup heads-up. Returns the names of what ran. `state` carries what
  # has been told once and whether the walk is open (Setup run, foot not).
  ready <- function(w, id, state) {
    needs <- needs_of(w, id)
    pb    <- part_block(w, id)

    setup <- run_lines(w, w$setup[1L], w$setup[2L], show = FALSE)
    if (length(setup)) {
      halt(w$name, ": Setup stopped at line ", setup$line, ":\n  ",
           setup$message,
           "\nNothing was run after it, and the foot was not run.")
    }
    state$open <- TRUE
    hu <- heads_up(attr(setup, "out"))
    if (length(hu) && !isTRUE(state$told)) {
      cat("\n", hu, sep = "\n")
      state$told <- TRUE
    }

    quiet <- function(blk, what) {
      r <- run_lines(w, blk$body, blk$end, show = FALSE)
      if (length(r)) {
        say("! ", what, ", run first with nothing shown, stopped at line ",
            r$line, ":")
        cat("    ", r$message, "\n", sep = "")
      }
    }
    if (!is.null(pb)) quiet(pb, paste0("the code under PART ", pb$part))
    for (x in needs) quiet(block_of(w, x), paste0("section ", x))

    c("Setup", if (!is.null(pb)) paste0("the PART ", pb$part, " fixture"), needs)
  }

  # One section, start to finish. Returns list(errors).
  run_section <- function(w, id, lead, state, color) {
    b <- block_of(w, id)
    sweep()
    before <- ws_names()
    on.exit(made <<- union(made, setdiff(ws_names(), before)), add = TRUE)

    ran <- ready(w, id, state)
    cat("\n")
    say(lead, ". Ran first, not shown: ", paste(ran, collapse = ", "), ".")
    cat("\n")
    last <- b$end
    while (last > b$body && !nzchar(trimws(w$lines[last]))) last <- last - 1L
    errors <- run_lines(w, b$start, last, show = TRUE, color = color)

    foot <- run_lines(w, w$foot[1L], w$foot[2L], show = FALSE)
    state$open <- FALSE
    if (length(foot)) {
      say("! the foot of ", w$name, " stopped at line ", foot$line, ":")
      cat("    ", foot$message, "\n", sep = "")
    }
    if (errors > 0L) {
      say("! ", errors, " uncaught error", if (errors > 1L) "s",
          " in section ", id, " (a walk wraps the errors it means to show).")
    }
    list(errors = errors)
  }

  # prepare = TRUE: steps 1 and 2 for one section, then the file is opened at
  # the section's first statement and the walk is left open.
  first_statement <- function(w, b) {
    body <- w$lines[b$body:b$end]
    at <- which(nzchar(trimws(body)) & !startsWith(trimws(body), "#"))
    if (length(at)) b$body + at[1L] - 1L else b$start
  }

  go_to <- function(path, line) {
    ok <- FALSE
    if (identical(Sys.getenv("RSTUDIO"), "1") &&
        requireNamespace("rstudioapi", quietly = TRUE)) {
      ok <- tryCatch({
        if (rstudioapi::isAvailable()) {
          rstudioapi::navigateToFile(path, line = line, column = 1L)
          TRUE
        } else FALSE
      }, error = function(e) FALSE)
    }
    ok
  }

  prepare_section <- function(w, id, state, rest) {
    b <- block_of(w, id)
    sweep()
    before <- ws_names()
    ran <- ready(w, id, state)
    state$open <- FALSE                 # not for the exit handler: left open
    left_open <<- list(w = w, before = before)
    line <- first_statement(w, b)
    stem <- sub("_walk\\.R$", "", w$name)
    cat("\n")
    say(w$name, " is ready at section ", id, ". Ran, not shown: ",
        paste(ran, collapse = ", "), ". Nothing of ", id, " has run.")
    if (go_to(w$path, line)) {
      say("the file is open at line ", line,
          ": step through the section with Ctrl+Enter.")
    } else {
      say("open ", w$path)
      say("at line ", line, ", and step through the section with Ctrl+Enter.")
    }
    say("the session stays in the walk's state until the next rewalk() call, ",
        "which runs the walk's foot first.")
    if (length(rest)) {
      say("next: rewalk(\"", stem, "\", \"", rest[1L], "\", prepare = TRUE)",
          if (length(rest) > 1L) paste0("  (then ", paste(rest[-1L],
                                                         collapse = ", "), ")"))
    }
    invisible(NULL)
  }

  # --- the scoreboard --------------------------------------------------------

  compact_ids <- function(w, ids) {
    if (length(ids) == 0L) return("")
    pos  <- match(ids, w$ids)
    runs <- split(ids, cumsum(c(1L, diff(pos) != 1L)))
    paste(vapply(runs, function(r) {
      if (length(r) > 2L) paste0(r[1L], "-", r[length(r)])
      else paste(r, collapse = ", ")
    }, ""), collapse = ", ")
  }

  scoreboard <- function(dir) {
    walks <- find_walks(dir)
    if (length(walks) == 0L) halt("no *_walk.R file in ", dir)
    say("the walks in ", dir)
    width <- max(nchar(basename(walks)))
    npend <- 0L
    for (f in walks) {
      w <- tryCatch(parse_walk(f), error = function(e) conditionMessage(e))
      name <- formatC(basename(f), width = -width)
      if (is.character(w)) {
        cat("  ", name, "  CANNOT BE READ: ", sub("^rewalk\\(\\): ", "", w),
            "\n", sep = "")
        next
      }
      nsec <- formatC(paste0(length(w$ids), " sections"), width = 11L)
      if (!w$has_pending_line) {
        cat("  ", name, "  ", nsec, "  no PENDING line\n", sep = "")
      } else if (length(w$pending$ids) == 0L && length(w$pending$unknown) == 0L) {
        cat("  ", name, "  ", nsec, "  nothing pending\n", sep = "")
      } else {
        npend <- npend + 1L
        g <- w$pending$groups
        cat("  ", name, "  ", nsec, "  PENDING  ", g[[1L]]$text, "\n", sep = "")
        for (x in g[-1L]) {
          cat(strrep(" ", width + 26L), x$text, "\n", sep = "")
        }
        if (length(w$pending$unknown)) {
          cat(strrep(" ", width + 17L), "! not a section of the file: ",
              paste(w$pending$unknown, collapse = ", "), "\n", sep = "")
        }
      }
    }
    if (npend == 0L) {
      say("no walk is pending. One section: rewalk(\"filter\", \"C5\").")
    } else {
      say(npend, if (npend == 1L) " walk is" else " walks are",
          " pending. Run one with rewalk(\"<name>\"); ",
          "one section with rewalk(\"<name>\", \"<section>\").")
    }
    invisible(NULL)
  }

  # --- the function ----------------------------------------------------------

  function(file = NULL, section = NULL, prepare = FALSE,
           pause = interactive(), dir = WALK_DIR) {
    close_open()
    if (is.null(file)) return(scoreboard(dir))
    if (!exists("jload", mode = "function")) {
      halt("jstats is not loaded: devtools::load_all() or library(jstats) first.")
    }
    w <- parse_walk(resolve_file(file, dir))

    if (is.null(section)) {
      if (length(w$pending$unknown)) {
        halt(w$name, ": the PENDING line names ",
             paste(w$pending$unknown, collapse = ", "),
             ", which is not a section of the file.")
      }
      ids <- w$pending$ids
      if (length(ids) == 0L) {
        say(w$name, ": ",
            if (w$has_pending_line) "nothing pending." else "no PENDING line.")
        say("its sections: ", compact_ids(w, w$ids))
        say("one section: rewalk(\"", sub("_walk\\.R$", "", w$name), "\", \"",
            w$ids[1L], "\"); all of them: rewalk(\"",
            sub("_walk\\.R$", "", w$name), "\", \"all\").")
        return(invisible(NULL))
      }
      what <- "pending"
    } else {
      ids <- character(0)
      for (tk in as.character(section)) {
        r <- expand_id(w, tk)
        if (length(r) == 0L) {
          halt(w$name, " has no section \"", tk, "\". Its sections: ",
               compact_ids(w, w$ids))
        }
        ids <- c(ids, r)
      }
      ids  <- w$ids[w$ids %in% ids]
      what <- "asked for"
    }

    state <- new.env()
    state$open <- FALSE
    on.exit({
      if (isTRUE(state$open)) {
        # Interrupted between Setup and the foot: hand the session back.
        try(run_lines(w, w$foot[1L], w$foot[2L], show = FALSE), silent = TRUE)
      }
    }, add = TRUE)

    if (isTRUE(prepare)) {
      return(prepare_section(w, ids[1L], state, ids[-1L]))
    }

    color  <- use_color()
    total  <- 0L
    shown  <- 0L
    for (k in seq_along(ids)) {
      lead <- paste0(w$name, ", section ", ids[k], " (", k, " of ",
                     length(ids), " ", what, ")")
      r <- run_section(w, ids[k], lead, state, color)
      total <- total + r$errors
      shown <- shown + 1L
      if (k < length(ids) && isTRUE(pause)) {
        cat("\n")
        ans <- readline(paste0("rewalk> Enter for section ", ids[k + 1L],
                               ", q to stop: "))
        if (tolower(trimws(ans)) %in% c("q", "quit", "stop")) break
      }
    }
    cat("\n")
    say(shown, " of ", length(ids), " section", if (length(ids) != 1L) "s",
        " shown from ", w$name, " (", compact_ids(w, ids[seq_len(shown)]), ")",
        if (total > 0L) paste0("; ", total, " uncaught error",
                               if (total > 1L) "s"),
        ". The session is as the walk's foot leaves it.")
    invisible(NULL)
  }
})
