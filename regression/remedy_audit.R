# =============================================================================
# remedy_audit.R -- the remedy-line audit (S371): every line a message
#                   offers is run in the state the message was raised in
# =============================================================================
# TYPE:     audit harness, SANDBOX ONLY. Not a battery and not a walk:
#           run_all.R does not source it (its name ends in neither
#           _check.R nor _walk.R), and receive_all() never runs it. It
#           forks the R session at each message (parallel::mcparallel),
#           which R on Windows cannot do, so it runs in the Claude sandbox
#           (Linux), on a copy of this folder.
# WHAT IT DOES. base::stop, warning, message and cat are traced on entry,
#           and a call is kept only when its nearest caller outside base R
#           is a function of the jstats namespace -- the package's own
#           emitters and bare stops. From the message it takes every block
#           of indented lines under a line ending in a colon (voice Rule
#           L), joins the lines of a call laid out over several, and keeps
#           what parses as a call or an assignment; and the calls offered
#           inline after "Use", "e.g.", "for example" or "run". At the
#           moment the message is raised it forks: the child is an exact
#           copy of the session -- workspace, options, juse() default,
#           registrations, filters -- and runs the block there, in the
#           environment the user's call was evaluated in, with interactive()
#           TRUE and .jst_confirm() replaced by a marker, so a question is
#           seen rather than answered. The parent session is untouched.
#           Each block runs as a sequence, each line after the first again
#           on its own, all the blocks of a message together, and, at the
#           first sighting of each block, under the three conventions not
#           in force and none (the AF09 pattern). A line that stops, warns
#           or asks is a FINDING (ruling R22: "A remedy never leads to
#           another stop."). Lines naming MyData (the placeholder for a
#           data frame the workspace does not hold) or "..." are counted
#           and skipped, as are fragments such as subset = Age < 40.
# FILES ON DISK. A child shares the disk with the parent: a block that can
#           write a file gets the temp folder (recursively) and the working
#           folder (top level) backed up before the fork and put back
#           after it, so a battery that reads back a file it wrote reads
#           its own file, not the child's. Run it in a scratch working
#           folder.
# USE (from a shell; every argument a path or a mode):
#   Rscript remedy_audit.R <package dir> <regression dir> <out dir> batteries
#   Rscript remedy_audit.R <package dir> <regression dir> <out dir> walk <file>
#   Rscript remedy_audit.R <package dir> <regression dir> <out dir> report [<file pattern>]
#           <package dir> is a package folder pkgload::load_all() can load
#           (the clone's, with the edited master split into R/); <file> a
#           walk of <regression dir>, or any script by its path (a probe
#           of chosen calls runs this way). "batteries" sources every
#           *_check.R under the hook; each run saves its records to
#           <out dir> as <name>.rds. "report" reads them all and prints the
#           distinct failing cases, grouped by the function raising the
#           message, its first line, the function offered and the new
#           stop's first line, with how each fared run alone, in the whole
#           message and under the other conventions. Run it under a UTF-8
#           locale (LANG=C.UTF-8), as the batteries are run.
# ORIGIN:   S371 (v0.9.243, the audit; the harness packaged with Fix Slate
#           19, v0.9.244). The audit's findings became the to-do items of
#           Fix Slates 19-21; ruling R23 came from it.
# LAST RUN: see the S371 entry in the Testing Conventions registry.
# =============================================================================

.aud_args <- commandArgs(trailingOnly = TRUE)
if (length(.aud_args) < 4L) {
  stop("usage: Rscript remedy_audit.R <package dir> <regression dir> <out dir> ",
       "batteries | walk <file> | report [<file pattern>]", call. = FALSE)
}
if (.Platform$OS.type != "unix") {
  stop("remedy_audit.R forks the R session, which R on Windows cannot do; ",
       "run it in the sandbox.", call. = FALSE)
}

# ---- the report: no package needed ------------------------------------------
if (.aud_args[4L] == "report") {
  local({
    regdir <- .aud_args[2L]; outdir <- .aud_args[3L]
    pat <- if (length(.aud_args) >= 5L) .aud_args[5L] else ""
    files <- list.files(outdir, pattern = "\\.rds$", full.names = TRUE)
    where_cache <- new.env()
    where_of <- function(file, i) {
      fp <- if (file.exists(file.path(regdir, file))) file.path(regdir, file) else file
      if (is.na(i) || !file.exists(fp)) return(NA_character_)
      if (!exists(fp, where_cache)) {
        assign(fp, list(ex = parse(fp, keep.source = TRUE),
                        src = readLines(fp, warn = FALSE)), envir = where_cache)
      }
      w <- get(fp, where_cache)
      if (i > length(w$ex)) return(NA_character_)
      ln <- utils::getSrcLocation(w$ex[i], "line")[1L]
      e <- w$ex[[i]]
      if (grepl("_check\\.R$", file) && is.call(e) &&
          identical(e[[1L]], as.name("check")) && is.character(e[[2L]])) {
        return(paste0("L", ln, " ", substr(e[[2L]], 1L, 70L)))
      }
      hdr <- grep(" ----$", w$src[seq_len(ln)], value = TRUE)
      hdr <- hdr[grepl("^# [A-Z]", hdr)]
      paste0("L", ln, " ", if (length(hdr)) substr(hdr[length(hdr)], 3L, 80L) else "")
    }
    outcome <- function(r) {
      if (is.null(r)) return("NULL")
      if (isTRUE(r$timeout)) return("TIMEOUT")
      if (inherits(r, "try-error")) return("CHILD-ERROR")
      if (length(r$question)) return("QUESTION")
      if (!is.null(r$error)) return("ERROR")
      if (length(r$warnings)) return("WARNING")
      "OK"
    }
    detail <- function(r) {
      if (is.null(r) || isTRUE(r$timeout) || inherits(r, "try-error")) return("")
      if (length(r$question)) return(paste(r$question, collapse = " | "))
      if (!is.null(r$error)) return(r$error)
      if (length(r$warnings)) return(paste(r$warnings, collapse = " | "))
      ""
    }
    rows <- list()
    for (fp in files) {
      x <- readRDS(fp)
      if (length(x$hookerr)) cat("HOOK ERRORS in", basename(fp), ":",
                                 length(x$hookerr), "\n")
      for (r in x$recs) {
        if (nzchar(pat) && !grepl(pat, r$file)) next
        wh <- where_of(r$file, r$expr)
        pos0 <- 0L
        for (bi in seq_along(r$blocks)) {
          b <- r$blocks[[bi]]; run <- r$runs[[bi]]
          conv <- if (!is.null(r$conv) && length(r$conv) >= bi) r$conv[[bi]] else NULL
          for (ui in seq_along(b$units)) {
            seq_r <- if (run$skipped == "") run$seq[[ui]] else NULL
            alone_r <- if (run$skipped == "" && ui > 1L) run$alone[[ui - 1L]][[1L]] else NULL
            wr <- if (!is.null(r$whole) && !isTRUE(r$whole$timeout) &&
                      length(r$whole) >= pos0 + ui) r$whole[[pos0 + ui]] else NULL
            rows[[length(rows) + 1L]] <- data.frame(
              file = r$file, where = wh, ucall = substr(r$ucall, 1L, 160L),
              lead = strsplit(r$text, "\n", fixed = TRUE)[[1L]][1L],
              colon = trimws(b$colon), indent = b$indent, ui = ui,
              nunits = length(b$units), unit = b$units[ui],
              seq = if (run$skipped == "") outcome(seq_r) else run$skipped,
              seq_detail = if (run$skipped == "") detail(seq_r) else "",
              alone = if (is.null(alone_r)) "" else outcome(alone_r),
              whole = if (is.null(wr)) "" else outcome(wr),
              conv = if (is.null(conv)) "" else paste(vapply(names(conv),
                function(cv) paste0(cv, "=", outcome(conv[[cv]][[ui]])),
                character(1)), collapse = " "),
              stringsAsFactors = FALSE)
          }
          pos0 <- pos0 + length(b$units)
        }
      }
    }
    if (!length(rows)) { cat("No records.\n"); return(invisible()) }
    tab <- do.call(rbind, rows)
    frag <- vapply(tab$unit, function(u) {
      p <- tryCatch(parse(text = u)[[1L]], error = function(e) NULL)
      is.call(p) && identical(p[[1L]], as.name("="))
    }, logical(1))
    cat("Offered lines run:", nrow(tab), " fragments skipped:", sum(frag),
        " MyData skipped:", sum(tab$seq == "MyData"),
        " \"...\" skipped:", sum(tab$seq == "dots"), "\n")
    print(table(tab$seq[!frag]))
    fails <- c("ERROR", "WARNING", "QUESTION", "TIMEOUT", "CHILD-ERROR")
    bad <- tab[!frag & tab$seq %in% fails & tab$whole != "OK", ]
    mask <- function(x) gsub("'[^']*'|\"[^\"]*\"|\\b[A-Za-z_.][A-Za-z0-9_.]*\\$", "_", x)
    first <- function(x) sub("\n.*$", "", x)
    key <- paste(sub("\\(.*$", "", bad$ucall), "|", mask(bad$lead), "|",
                 sub("^.*<- *", "", sub("\\(.*$", "", bad$unit)), "|",
                 mask(first(bad$seq_detail)))
    grp <- split(bad, key)
    grp <- grp[order(-vapply(grp, nrow, integer(1)))]
    cat("\nDISTINCT FAILING CASES:", length(grp), "\n")
    for (g in grp) {
      r <- g[1L, ]
      cat("\n#", nrow(g), "x [", paste(unique(g$file), collapse = ", "), "]\n")
      cat("  where:  ", r$where, "\n")
      cat("  call:   ", substr(r$ucall, 1L, 150L), "\n")
      cat("  lead:   ", r$lead, "\n")
      cat("  colon:  ", r$colon, "\n")
      cat("  offered:", gsub("\n", "\n           ", r$unit), " (", r$ui, "/", r$nunits, ")\n", sep = "")
      cat("  result: ", r$seq, ": ", gsub("\n", " / ", substr(r$seq_detail, 1L, 260L)), "\n", sep = "")
      if (nzchar(r$alone)) cat("  alone:  ", r$alone, "\n")
      if (nzchar(r$conv)) cat("  conv:   ", r$conv, "\n")
      if (nzchar(r$whole)) cat("  whole:  ", r$whole, "\n")
    }
  })
  quit(save = "no")
}

# ---- the hook: kept in an attached environment, out of the workspace -------
suppressMessages(pkgload::load_all(.aud_args[1L], quiet = TRUE))
.aud_e <- attach(NULL, name = "audit_state")
evalq({
  .AUD <- new.env()
  .AUD$ns <- asNamespace("jstats")
  .AUD$recs <- list()
  .AUD$n <- 0L
  .AUD$busy <- FALSE
  .AUD$in_child <- FALSE
  .AUD$file <- NA_character_
  .AUD$seen <- new.env()
  .AUD$hookerr <- character()
  .AUD$hookstack <- list()
  .AUD$ctx <- list()
  .AUD$conv_seen <- new.env()
  .AUD$do_conv <- TRUE
  .AUD$timeout <- 60

  .AUD$ops <- c("+", "-", "*", "/", "^", ">", "<", ">=", "<=", "==", "!=", "&",
                "|", "&&", "||", "!", "~", "?", ":", "$", "@", "[", "[[", "(",
                "{", "if", "for", "while", "repeat", "function", "%in%", "%%",
                "%/%")

  .AUD$indent <- function(x) nchar(x) - nchar(sub("^ +", "", x))

  .AUD$callish <- function(e) {
    if (!is.call(e)) return(FALSE)
    h <- e[[1L]]
    if (is.symbol(h)) {
      hs <- as.character(h)
      if (hs %in% c("<-", "=", "<<-")) {
        tg <- e[[2L]]
        return(is.symbol(tg) || is.call(tg))
      }
      return(!(hs %in% .AUD$ops))
    }
    if (is.call(h) && is.symbol(h[[1L]]) &&
        as.character(h[[1L]]) %in% c("::", ":::")) return(TRUE)
    FALSE
  }

  # Every block of indented lines under a colon line. A unit starts at the
  # block's smallest indent; deeper lines continue it.
  .AUD$extract <- function(text) {
    L <- strsplit(text, "\n", fixed = TRUE)[[1L]]
    out <- list()
    k <- 1L
    while (k < length(L)) {
      if (grepl(":\\s*$", L[k]) && grepl("^ +\\S", L[k + 1L]) &&
          .AUD$indent(L[k + 1L]) > .AUD$indent(L[k])) {
        base <- .AUD$indent(L[k])
        j <- k + 1L
        while (j <= length(L) && grepl("^ +\\S", L[j]) &&
               .AUD$indent(L[j]) > base) j <- j + 1L
        lines <- L[(k + 1L):(j - 1L)]
        ind <- .AUD$indent(lines)
        mi <- min(ind)
        starts <- which(ind == mi)
        units <- character()
        for (s in seq_along(starts)) {
          e <- if (s < length(starts)) starts[s + 1L] - 1L else length(lines)
          # Add continuation lines only while the call is incomplete: deeper
          # lines after a complete call are a descriptor's prose (the
          # convention menu), not more of the call.
          seg <- substring(lines[starts[s]:e], mi + 1L)
          u <- seg[1L]
          q <- 1L
          while (q < length(seg) && .AUD$incomplete(u)) {
            q <- q + 1L
            u <- paste(u, seg[q], sep = "\n")
          }
          p <- tryCatch(parse(text = u, keep.source = TRUE),
                        error = function(e) NULL)
          pd <- if (is.null(p)) NULL else utils::getParseData(p)
          right <- !is.null(pd) && any(pd$token == "RIGHT_ASSIGN")
          spaced <- grepl("^[A-Za-z_.][A-Za-z0-9_.]* +\\(", u)
          if (!is.null(p) && length(p) > 0L && !right && !spaced &&
              all(vapply(as.list(p), .AUD$callish, logical(1)))) {
            units <- c(units, u)
          }
        }
        if (length(units)) {
          out[[length(out) + 1L]] <- list(colon = L[k], indent = mi,
                                          units = units, raw = lines)
        }
        k <- j
      } else {
        k <- k + 1L
      }
    }
    out
  }

  .AUD$incomplete <- function(u) {
    r <- tryCatch({ parse(text = u, keep.source = FALSE); "ok" },
                  error = function(e) conditionMessage(e))
    !identical(r, "ok") && grepl("unexpected end of input|INCOMPLETE", r)
  }

  # Inline offers: a call woven into prose after "Use", "use", "e.g.", "for
  # example" or "run" (Rule L's carve-out, and the S370 seeds' layout cases).
  .AUD$inline <- function(text) {
    L <- strsplit(text, "\n", fixed = TRUE)[[1L]]
    L <- L[!grepl("^ ", L)]
    out <- character()
    for (ln in L) {
      m <- gregexpr("(Use|use|e\\.g\\.|for example|[Rr]un) +[A-Za-z_.][A-Za-z0-9_.]*(\\$[A-Za-z0-9_.]+)? *(<-)? *[A-Za-z_.][A-Za-z0-9_.:]*\\(", ln)[[1L]]
      if (m[1L] < 0) next
      for (st in m) {
        sub_ <- substring(ln, st)
        sub_ <- sub("^(Use|use|e\\.g\\.|for example|[Rr]un) +", "", sub_)
        # take the shortest prefix that parses as one complete call
        ok <- NA_character_
        for (cut in seq(nchar(sub_), 1L)) {
          cand <- substr(sub_, 1L, cut)
          if (!grepl("\\)$", cand)) next
          pp <- tryCatch(parse(text = cand, keep.source = FALSE), error = function(e) NULL)
          if (!is.null(pp) && length(pp) == 1L && .AUD$callish(pp[[1L]]) &&
              length(pp[[1L]]) > 1L) { ok <- cand }
        }
        if (!is.na(ok)) out <- c(out, ok)
      }
    }
    unique(out)
  }

  .AUD$is_base <- function(f) {
    if (!is.function(f) || is.primitive(f)) return(TRUE)
    te <- tryCatch(topenv(environment(f)), error = function(e) NULL)
    is.null(te) || identical(te, baseenv()) || identical(te, .BaseNamespaceEnv)
  }

  .AUD$hook <- function(kind, frame) {
    if (.AUD$busy || .AUD$in_child) return(invisible(NULL))
    .AUD$busy <- TRUE
    on.exit(.AUD$busy <- FALSE)
    tryCatch(withCallingHandlers(
               suppressWarnings(suppressMessages(.AUD$handle(kind, frame))),
               error = function(e) {
                 cs <- vapply(sys.calls(), function(x)
                   substr(paste(deparse(x), collapse = " "), 1L, 80L),
                   character(1))
                 .AUD$hookstack <- c(.AUD$hookstack, list(utils::tail(cs, 12L)))
               }),
             error = function(e) {
               .AUD$hookerr <- c(.AUD$hookerr,
                                 paste(kind, conditionMessage(e)))
             })
    invisible(NULL)
  }

  .AUD$handle <- function(kind, frame) {
    fr <- sys.frames()
    idx <- NA_integer_
    for (i in rev(seq_along(fr))) {
      if (identical(fr[[i]], frame)) { idx <- i; break }
    }
    if (is.na(idx)) return(invisible(NULL))
    pars <- sys.parents()
    # Walk up through base callers (packageStartupMessage, etc.).
    p <- pars[idx]
    while (p > 0L && .AUD$is_base(sys.function(p))) p <- pars[p]
    if (p == 0L) return(invisible(NULL))
    f <- sys.function(p)
    if (!identical(topenv(environment(f)), .AUD$ns)) return(invisible(NULL))
    caller <- tryCatch(paste(deparse(sys.call(p)[[1L]]), collapse = ""),
                       error = function(e) "?")
    a <- eval(quote(list(...)), frame)
    text <- if (kind == "cat") {
      sep <- get("sep", envir = frame)
      paste(unlist(lapply(a, as.character)), collapse = sep)
    } else if (length(a) && inherits(a[[1L]], "condition")) {
      conditionMessage(a[[1L]])
    } else {
      paste(unlist(lapply(a, as.character)), collapse = "")
    }
    stream <- if (kind == "cat") "cat" else if (kind == "message") "message" else "cond"
    if (stream != "cond") {
      ctx <- .AUD$ctx[[stream]]
      if (!is.null(ctx) && grepl("^ +\\S", text)) text <- paste0(ctx, "\n", text)
      TL <- strsplit(sub("\n+$", "", text), "\n", fixed = TRUE)[[1L]]
      TL <- TL[nzchar(TL)]
      lastp <- rev(TL[!grepl("^ ", TL)])[1L]
      .AUD$ctx[[stream]] <- if (length(TL) && !is.na(lastp) &&
                                 grepl(":\\s*$", lastp) &&
                                 (identical(TL[length(TL)], lastp) ||
                                  all(grepl("^ ", TL[(which(TL == lastp)[1L] + 1L):length(TL)]))))
        lastp else NULL
    }
    inl <- .AUD$inline(text)
    if (!grepl(":\\s*\n +\\S", text) && !length(inl)) return(invisible(NULL))
    blocks <- .AUD$extract(text)
    for (u in inl) blocks[[length(blocks) + 1L]] <- list(colon = "(inline)", indent = -1L, units = u, raw = u)
    if (!length(blocks)) return(invisible(NULL))
    # The user's call: the outermost jstats frame; its caller's env is where
    # the user's line was evaluated.
    k <- NA_integer_
    for (i in seq_len(idx)) {
      fi <- sys.function(i)
      if (is.function(fi) && !is.primitive(fi) &&
          identical(tryCatch(topenv(environment(fi)), error = function(e) NULL),
                    .AUD$ns)) { k <- i; break }
    }
    uenv <- if (is.na(k) || pars[k] == 0L) globalenv() else sys.frame(pars[k])
    ucall <- if (is.na(k)) "?" else
      paste(deparse(sys.call(k), width.cutoff = 200L), collapse = " ")
    # Position in the script: the source() frame's loop index.
    si <- NA_integer_
    for (i in seq_len(idx)) {
      if (identical(sys.function(i), base::source)) {
        si <- tryCatch(get("i", envir = sys.frame(i)), error = function(e) NA)
        break
      }
    }
    key <- paste(.AUD$file, si, text, sep = "\r")
    if (exists(key, envir = .AUD$seen, inherits = FALSE)) {
      return(invisible(NULL))
    }
    assign(key, TRUE, envir = .AUD$seen)
    conv_now <- getOption(".jst_options_missing_convention", "none")
    runs <- lapply(blocks, function(b) .AUD$run_block(b, uenv))
    whole <- NULL
    allu <- unlist(lapply(blocks, function(b) b$units))
    if (length(blocks) > 1L && .AUD$skip_kind(allu) == "") {
      whole <- .AUD$fork(allu, uenv, NULL)
    }
    # The AF09 pattern: each distinct block also under the four convention
    # states, at its first sighting.
    conv <- NULL
    if (.AUD$do_conv) {
      conv <- lapply(blocks, function(b) {
        bk <- paste(b$units, collapse = "\n")
        if (exists(bk, envir = .AUD$conv_seen, inherits = FALSE)) return(NULL)
        assign(bk, TRUE, envir = .AUD$conv_seen)
        if (.AUD$skip_kind(b$units) != "") return(NULL)
        st <- setdiff(c("none", "spss", "stata", "sas"), conv_now)
        stats::setNames(lapply(st, function(cv) .AUD$fork(b$units, uenv, cv)),
                        st)
      })
    }
    .AUD$n <- .AUD$n + 1L
    .AUD$recs[[.AUD$n]] <- list(
      file = .AUD$file, expr = si, kind = kind, caller = caller,
      ucall = ucall, text = text, blocks = blocks, runs = runs, conv = conv,
      whole = whole,
      conv_now = conv_now, width = getOption("width"),
      jst_width = getOption(".jst_options_message_width"))
    invisible(NULL)
  }

  .AUD$skip_kind <- function(units) {
    if (any(grepl("MyData", units, fixed = TRUE))) return("MyData")
    if (any(grepl("...", units, fixed = TRUE))) return("dots")
    ""
  }

  .AUD$run_block <- function(b, uenv) {
    sk <- .AUD$skip_kind(b$units)
    if (sk != "") return(list(skipped = sk))
    seq_res <- .AUD$fork(b$units, uenv, NULL)
    alone <- NULL
    if (length(b$units) > 1L) {
      alone <- lapply(b$units[-1L], function(u) .AUD$fork(u, uenv, NULL))
    }
    list(skipped = "", seq = seq_res, alone = alone)
  }

  .AUD$fork <- function(units, env, conv) {
    snap <- if (.AUD$may_write(units)) .AUD$snapshot() else NULL
    job <- parallel::mcparallel(.AUD$child(units, env, conv), silent = TRUE)
    r <- parallel::mccollect(job, wait = FALSE, timeout = .AUD$timeout)
    if (is.null(r)) {
      tools::pskill(job$pid, tools::SIGKILL)
      parallel::mccollect(job, wait = TRUE)
      r <- list(list(timeout = TRUE))
    }
    if (!is.null(snap)) .AUD$restore(snap)
    r[[1L]]
  }

  # A child shares the disk with the parent. Any block that can write gets the
  # temp folder (recursive) and the working folder (top level) backed up
  # before the fork and put back after it, so a check that reads back a file
  # its battery wrote reads the battery's file, not the child's.
  .AUD$may_write <- function(units) {
    any(grepl("jsave\\(|jai\\(|write|file\\.|unlink|saveRDS|jconvert\\(|jload\\(|joptions\\(",
              units))
  }
  .AUD$snap_files <- function() {
    td <- normalizePath(tempdir())
    wd <- normalizePath(getwd())
    f1 <- list.files(td, recursive = TRUE, full.names = TRUE, all.files = TRUE,
                     no.. = TRUE)
    f2 <- list.files(wd, full.names = TRUE, all.files = TRUE, no.. = TRUE)
    f2 <- f2[!dir.exists(f2)]
    d1 <- list.dirs(td, full.names = TRUE, recursive = TRUE)
    list(files = unique(normalizePath(c(f1, f2))), dirs = normalizePath(d1))
  }
  .AUD$snapshot <- function() {
    s <- .AUD$snap_files()
    bk <- file.path(.AUD$bkroot, sprintf("b%06d", .AUD$nbk <- .AUD$nbk + 1L))
    dir.create(bk, recursive = TRUE)
    map <- character()
    for (i in seq_along(s$files)) {
      dst <- file.path(bk, sprintf("f%05d", i))
      if (file.copy(s$files[i], dst, copy.date = TRUE)) map[s$files[i]] <- dst
    }
    list(map = map, md5 = if (length(map)) tools::md5sum(names(map)) else character(),
         dirs = s$dirs, bk = bk)
  }
  .AUD$restore <- function(snap) {
    now <- .AUD$snap_files()
    new <- setdiff(now$files, names(snap$map))
    if (length(new)) {
      .AUD$restored <- c(.AUD$restored, paste("removed", new))
      unlink(new)
    }
    newd <- setdiff(now$dirs, snap$dirs)
    if (length(newd)) unlink(newd, recursive = TRUE)
    for (f in names(snap$map)) {
      if (!file.exists(f) || !identical(unname(tools::md5sum(f)),
                                        unname(snap$md5[f]))) {
        .AUD$restored <- c(.AUD$restored, paste("put back", f))
        dir.create(dirname(f), recursive = TRUE, showWarnings = FALSE)
        file.copy(snap$map[[f]], f, overwrite = TRUE, copy.date = TRUE)
      }
    }
    unlink(snap$bk, recursive = TRUE)
  }
  .AUD$bkroot <- file.path(dirname(tempdir()), paste0("remedy_audit_bk_", Sys.getpid()))
  .AUD$nbk <- 0L
  .AUD$restored <- character()

  .AUD$child <- function(units, env, conv) {
    .AUD$in_child <- TRUE
    options(warn = 1)
    if (!is.null(conv)) options(.jst_options_missing_convention = conv)
    for (e in list(baseenv(), .BaseNamespaceEnv)) {
      try({
        if (bindingIsLocked("interactive", e)) unlockBinding("interactive", e)
        assign("interactive", function() TRUE, envir = e)
      }, silent = TRUE)
    }
    if (!exists("juse", envir = env, mode = "function")) {
      w <- new.env(parent = globalenv())
      for (nm in ls(env, all.names = TRUE)) {
        if (!is.function(get(nm, envir = env))) assign(nm, get(nm, envir = env), envir = w)
      }
      env <- w
    }
    ns <- .AUD$ns
    try({
      if (bindingIsLocked(".jst_confirm", ns)) unlockBinding(".jst_confirm", ns)
      assign(".jst_confirm", function(prompt, remedy, subject = "overwrite") {
        signalCondition(structure(
          class = c("audit_question", "condition"),
          list(message = prompt, call = NULL)))
        stop("AUDIT-QUESTION: ", prompt, call. = FALSE)
      }, envir = ns)
    }, silent = TRUE)
    # The child keeps the original call's frames under it. The two helpers
    # that walk the stack from the outermost frame would find the original
    # call, not the offered line's, so they ignore every frame below this one.
    D <- sys.nframe()
    for (h in c(".jst_caller_fn", ".jst_caller_call")) {
      try({
        src <- paste(deparse(get(h, envir = ns)), collapse = "\n")
        src <- sub("calls <- sys.calls()",
                   paste0("calls <- as.list(sys.calls()); calls[seq_len(min(length(calls), ",
                          D, "L))] <- list(NULL)"), src, fixed = TRUE)
        f <- eval(parse(text = src))
        environment(f) <- ns
        if (bindingIsLocked(h, ns)) unlockBinding(h, ns)
        assign(h, f, envir = ns)
      }, silent = TRUE)
    }
    lapply(units, function(u) {
      w <- character(); m <- character(); q <- character()
      out <- character()
      err <- tryCatch({
        out <- utils::capture.output(withCallingHandlers({
          v <- withVisible(eval(parse(text = u, keep.source = FALSE)[[1L]],
                                envir = env))
          if (v$visible) print(v$value)
        },
        warning = function(c) {
          w <<- c(w, conditionMessage(c)); invokeRestart("muffleWarning")
        },
        message = function(c) {
          m <<- c(m, conditionMessage(c)); invokeRestart("muffleMessage")
        },
        audit_question = function(c) q <<- c(q, conditionMessage(c))))
        NULL
      }, error = function(e) conditionMessage(e))
      list(unit = u, error = err, warnings = w, messages = m, question = q,
           out = utils::head(out, 30L))
    })
  }

  .AUD$install <- function() {
    for (fn in c("stop", "warning", "message", "cat")) {
      tr <- bquote(.(.AUD$hook)(.(fn), environment()))
      suppressMessages(trace(fn, tracer = tr, print = FALSE,
                             where = baseenv()))
    }
    invisible(TRUE)
  }
  .AUD$uninstall <- function() {
    for (fn in c("stop", "warning", "message", "cat")) {
      suppressMessages(untrace(fn, where = baseenv()))
    }
  }
}, .aud_e)
rm(.aud_e)
assign(".aud_mode", .aud_args[4L], envir = as.environment("audit_state"))
assign(".aud_regdir", .aud_args[2L], envir = as.environment("audit_state"))
assign(".aud_outdir", .aud_args[3L], envir = as.environment("audit_state"))
dir.create(.aud_args[3L], showWarnings = FALSE, recursive = TRUE)
.AUD$install()
if (.aud_args[4L] == "batteries") {
  rm(.aud_args)
  local({
    bats <- list.files(.aud_regdir, pattern = "_check\\.R$", full.names = TRUE)
    bats <- bats[!startsWith(basename(bats), "_")]
    tot <- 0; okk <- 0
    for (f in bats) {
      .AUD$file <- basename(f)
      cat("\n==== ", basename(f), "\n", sep = "")
      if (exists(".results", envir = globalenv(), inherits = FALSE)) {
        rm(".results", envir = globalenv())
      }
      err <- tryCatch({ source(f); NULL }, error = function(e) conditionMessage(e))
      res <- if (exists(".results", envir = globalenv(), inherits = FALSE))
        get(".results", envir = globalenv()) else NULL
      ok <- vapply(res, function(r) isTRUE(r$ok), logical(1))
      tot <- tot + length(ok); okk <- okk + sum(ok)
      cat("AUDIT-BOARD ", basename(f), " ", sum(ok), "/", length(ok),
          if (!is.null(err)) paste0(" HALTED: ", err), "\n", sep = "")
    }
    cat("AUDIT-TOTAL ", okk, "/", tot, "\n", sep = "")
  })
} else if (.aud_args[4L] == "walk") {
  .aud_src <- if (file.exists(.aud_args[5L])) .aud_args[5L] else
    file.path(.aud_regdir, .aud_args[5L])
  .AUD$file <- basename(.aud_src)
  rm(.aud_args)
  tryCatch(source(.aud_src, echo = TRUE, max.deparse.length = Inf),
           error = function(e) cat("AUDIT-WALK-HALTED: ", conditionMessage(e),
                                   "\n", sep = ""))
  rm(.aud_src)
} else {
  stop("unknown mode: ", .aud_args[4L], call. = FALSE)
}
.AUD$uninstall()
saveRDS(list(recs = .AUD$recs, hookerr = .AUD$hookerr,
             restored = .AUD$restored, hookstack = .AUD$hookstack),
        file.path(.aud_outdir, paste0(if (.aud_mode == "batteries") "batteries"
                                      else sub("\\.R$", "", .AUD$file), ".rds")))
cat("AUDIT-DONE records:", .AUD$n, " hook errors:", length(.AUD$hookerr), "\n")
