# =============================================================================
# startup_check.R -- assertion battery for the load-and-update lifecycle
#                    (S298; widened S309)
# =============================================================================
# TYPE:     assertion battery (PASS/FAIL; written for Claude's checking)
# LOCKS:    (A-C) .onAttach()'s successor guard. A redirect gist whose
#           successor names jstats ITSELF (the standing JeffsStatTools ->
#           jstats redirect) is ignored -- no rename notice, the version check
#           runs, the jai() pointer shows -- even though R passes pkgname
#           with a names attribute, c(name = "jstats"). A successor naming a
#           DIFFERENT package still gets the rename notice, with its install
#           hint, and suppresses the version check and the pointer. The
#           no-successor and no-network branches are unchanged.
#           (D) jupdate() installs into the library holding the copy of
#           jstats IN USE (.jst_update_target_lib(): the loaded copy's
#           library, or .libPaths()[1] when that path is not a library --
#           the load_all() source tree), after a write probe of that folder
#           (.jst_lib_writable(): R core's create-a-scratch-dir test); an
#           unwritable target is a guided stop naming the folder, with the
#           install step never reached; a writable one hands the RESOLVED
#           library to .jst_update_install(). The up-to-date and
#           failed-install branches are unchanged (controls).
#           (E) jupdate() does not take a quiet child as success:
#           install.packages() only WARNS on failure, so after the child
#           returns the version now on disk in the target
#           (.jst_update_installed_version()) must be NEWER than the loaded
#           one, or jupdate() stops -- naming the folder and the old
#           version, repeating ONE of the child's warnings (the first that
#           names a web address, else the first), then the remedy; with no
#           warning, the bare remedy; no jstats on disk at all is also a
#           failure. Success names the version now installed.
# ORIGIN:   S298 (v0.9.170). The guard compared the gist's plain "jstats"
#           with the NAMED pkgname via identical(), so every interactive,
#           online library(jstats) on 0.9.153-0.9.169 printed "jstats has
#           been renamed to `jstats`". Fixed once before, at v0.9.63;
#           reintroduced at v0.9.153 (S277). Before this file no regression
#           script touched zzz.R.
#           S309 (v0.9.180): jupdate()'s callr child installed with no lib=,
#           so an update landed in the child's .libPaths()[1] -- a second
#           copy beside a system-library install rather than a replacement
#           of it -- and an unwritable target died in the child with R's
#           bare "unable to install packages". The S178 to-do item. Same
#           session, found by mutant M5 below: the child returned normally
#           when the download failed (install.packages() warns, never
#           errors), and jupdate() printed "jstats has been updated." with
#           nothing installed -- reproduced live in the sandbox against a
#           blocked network.
# S340 EDIT (v0.9.214, 2026-10-05): Fix Slate 3, the Session 202 item
#           (the package with the network blocked or writes contained).
#           SECTIONS F, G AND H ADDED, 12 checks. F01-F05: the REAL
#           .jst_read_gist() on an address that cannot be read returns
#           NULL with no warning (the startup check leaked R's "cannot
#           open URL" warning on every blocked load), and a real attach
#           then prints its banner and nothing else. G01-G02: jupdate()
#           with the network blocked stops with what R could establish --
#           it could not reach the internet -- and both things that can
#           mean (pinned whole); it no longer says the computer is
#           offline. H01-H05: jsave() to a folder R cannot write stops
#           before it writes, naming the folder, with "Nothing was saved."
#           (it reported success in a sandbox that redirects the write,
#           and R's own "cannot open file" otherwise). FORTY checks.
#           Sandbox (R 4.3.3, UTF-8 locale, pkgload::load_all): 40/40 plain
#           and under the RStudio-handler stand-in, each also with a
#           Windows-length temp path, and entered dirty (joutput("full"),
#           width 110, a juse() default, a stata convention, jstats.color =
#           TRUE, workspace objects named like fixture variables): the
#           width, the default frame, the level, the convention and the
#           color option handed back, nothing left but .results.
#           On the 0.9.213 master 8 red: F03 F04 F05 G01 H01-H04. On no
#           mutant's list, by design: F01 (the premise), F03 and F05 (the
#           reader's two returns, which must not change), G02, H05.
#           MUTATION MAP (the S340 mutants that red here; the full list of
#           74 is described in cps_check.R): the gist read's warning
#           leaking again F02 F04 G01; jupdate()'s old diagnosis back G01;
#           jsave()'s folder probe off H01-H04; "Nothing was saved."
#           dropped H01 H02.
#           LAST VERIFIED: v0.9.214, R 4.6.1, 2026-10-05 (S340) -- 40/40 on
#           the WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run,
#           1734 checks)"), matching the sandbox; GitHub 2d04b68. The FIRST
#           workstation run read 36/40 -- F03 F04 F05 G01, exactly the reds
#           of the 0.9.213 zzz.R -- because zzz.R had been hand-copied AFTER
#           receive_package() and the session still held the old one;
#           devtools::load_all() and a second run gave 40/40. The battery
#           was right: a delivered zzz.R is copied in BEFORE the receive.
# S341 EDIT (v0.9.215, 2026-10-06): THE STARTUP LINE NAMES NO CAUSE. The
#           line printed when the update check does not finish read
#           "(Could not check for updates - no internet connection?)"; Jeff
#           met it on a connected machine, on the first load after the
#           computer had slept (a read ran past its 3-second limit). It is
#           now "jstats v<x> loaded. The check for updates did not
#           complete." / "To check again, run jupdate()." (his choice of
#           two renders), from one helper, .jst_update_check_line(), at
#           both sites. C02 and F04 RE-PINNED; C04 NEW (the version read
#           failing after the gist read succeeded -- the second site, which
#           nothing reached before); C05 NEW (no "internet", no question
#           mark, the remedy last). 42 checks. Sandbox: 42/42 plain and
#           under the RStudio-handler stand-in, each also with a
#           Windows-length temp path, and entered dirty. On the 0.9.214
#           zzz.R 4 red: C02 C04 C05 F04.
#           MUTATION MAP: the remedy line ending in a question mark C04
#           C05 F04; the version-read site back to a bare "loaded." C04;
#           the no-network site back to a bare "loaded." C02 C05 F04.
# S337 EDIT (v0.9.211, 2026-10-05; no package change): the fixture guard of
#           _template_check.R. A GREEN run now removes everything the battery
#           made (the names in the workspace are recorded at Setup; .results
#           stays, for run_all.R), so a walk that reports on the data frames in
#           the workspace can follow it in one session. A red run keeps its
#           fixtures. No check added or changed: 28/28 in the sandbox, plain,
#           under the RStudio-handler stand-in, and ENTERED DIRTY
#           (joutput("full"), width 90, a juse() default, a stata convention):
#           nothing left but .results, and the width, the default frame, the
#           level and the convention as they were on entry. (Setup still clears
#           stored jsubset(), jcomplete() and registration settings, as it
#           always has.)
# LAST VERIFIED: v0.9.215, R 4.6.1, 2026-10-06 (S341) -- 42/42 on the
#           WORKSTATION under run_all.R ("ALL BATTERIES GREEN (8 run, 1758
#           checks)"), matching the sandbox; GitHub da1684a.
#           Prior: PENDING on the WORKSTATION (the 22-check D-only build was
#           22/22 on the workstation, R 4.6.1, 0.9.180, before E was added).
#           SANDBOX (S309, R 4.3.3, jstats_source.R + zzz.R source()'d, :::
#           and :: shimmed, a DESCRIPTION-only stand-in package named jstats
#           installed so packageVersion() and getNamespaceName() resolve):
#           28/28.
#           MUTATION MAP (S298, sandbox, three mutants + one harness):
#           M1 the UNEDITED 0.9.169 zzz.R (no unname()) reds A02 A03 A04;
#           A05 stays green -- a plain-string pkgname never tripped the
#           guard, which is why the premise check A01 exists.
#           M2 the self-check dropped (any non-null successor migrates) reds
#           A02 A03 A04 A05.
#           M3 the successor branch disabled (a "fix" that never migrates)
#           reds B01 B02 B03.
#           M4 (harness) the non-interactive opt-in NOT forced, so every run
#           returns at the gate, reds A03-A05 B01 B02 C01-C03 -- while A02
#           and B03, which assert ABSENCES, stay green on silence. That is
#           why A03 asserts the version check was REACHED and C03 asserts
#           every run emitted something.
#           C01 C02 are on no code mutant's red list BY DESIGN: they are
#           controls for the branches the fix does not touch.
#           MUTATION MAP (S309, sandbox, four mutants):
#           M5 the UNEDITED 0.9.179 master (no helpers, callr called
#           directly) reds D01-D08 D11. SANDBOX-ONLY: with no stub to
#           intercept it, this mutant reaches callr::r for REAL -- harmless
#           where egress is blocked, a live install attempt on the
#           workstation. D09 stays GREEN on it, and that is a finding, not a
#           gap: install.packages() only WARNS when the package cannot be
#           downloaded, so the unedited master prints "jstats has been
#           updated." with nothing installed (S309 to-do). D10 green (the
#           up-to-date branch predates the fix).
#           M6 the probe call removed reds D05 D06 D07.
#           M7 the install step handed .libPaths()[1] instead of the
#           resolved library reds D08.
#           M8 the resolver's off-path fallback removed reds D02.
#           MUTATION MAP (S309, section E, sandbox, four mutants):
#           M9 the on-disk verification removed (a quiet child is success)
#           reds D12 D13 D15 D17.
#           M10 the LAST warning shown instead of the chosen one reds D13
#           D14.
#           M11 no-jstats-on-disk treated as success (the is.null branch
#           dropped) reds D17.
#           M12 the first warning shown rather than the first naming a web
#           address reds D16.
#           D10 D11 are on no code mutant's red list BY DESIGN: controls for
#           the two branches the fix does not touch.
# RUN:      source()-safe from any working directory; all output is explicit
#           cat(). Needs NO dataset (the template's jload() call is deleted)
#           and touches no pipeline state. Does NO network read and installs
#           NOTHING: .onAttach() runs as a copy whose two network-touching
#           helpers are stubs; jupdate() runs as a copy whose gist read,
#           version read, target resolver, write probe, callr install step
#           and on-disk version read are all stubs (the install stub only
#           records the library it was handed and returns the warnings a
#           check supplies). Nothing in the jstats namespace is modified.
#           D01-D04 exercise the two helpers on real folders (utils's
#           library; two temp folders, removed at the end).
# CONTRACT: one printed line per check, a final "RESULT: PASS (n/n)" line,
#           and stop() if and only if any check failed.
# =============================================================================

# --- Setup -------------------------------------------------------------------

# jstats must be loaded already: devtools::load_all() (development) OR
# library(jstats) (installed) -- never both in one session.
stopifnot(exists("jload", mode = "function"))

# What is in the workspace on entry (S337): on a green run everything this
# battery made beyond it is removed at the foot, so a walk that reports on
# the data frames in the workspace can follow a battery in one session.
.entry_names <- ls(globalenv(), all.names = TRUE)

# Width pin (S253, mandatory). The startup lines are packageStartupMessage()
# literals, not emitter output, so the width cannot move them -- pinned
# anyway, per the rule, so the file is safe if that ever changes.
.pin_width           <- 76L
.entry_message_width <- getOption(".jst_options_message_width")
options(.jst_options_message_width = .pin_width)

# .onAttach() returns silently in a non-interactive session unless opted in,
# and skips the gist entirely when update checks are off. Force both, record
# the entering values, restore at the foot.
.entry_attach_opts <- options(jstats.attach.noninteractive = TRUE,
                              jstats.check_updates         = TRUE)

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

# grab(): run a call and return every message / warning / error text it
# emits, concatenated. packageStartupMessage() signals a message condition,
# so the startup lines land here.
grab <- function(expr) {
  msgs <- character(0)
  withCallingHandlers(
    tryCatch(expr,
             error = function(e) msgs <<- c(msgs, conditionMessage(e))),
    message = function(m) {
      msgs <<- c(msgs, conditionMessage(m)); invokeRestart("muffleMessage")
    },
    warning = function(w) {
      msgs <<- c(msgs, conditionMessage(w)); invokeRestart("muffleWarning")
    }
  )
  paste(msgs, collapse = "")
}

# attach_run(): run a COPY of .onAttach() with the gist read and the
# r-universe version check replaced by stubs, and return what it emits. The
# copy's enclosure is a child of the function's own environment, so every
# OTHER helper -- .jst_show_migration() included -- is the real one. The
# version-check stub prints a marker, so a check can see that the branch was
# REACHED rather than inferring it from an absence.
.VSTUB <- "<<VERSION-STATUS-STUB>>"
attach_run <- function(pkgname, successor = NULL, network_ok = TRUE) {
  f     <- jstats:::.onAttach
  stubs <- new.env(parent = environment(f))
  stubs$.jst_read_gist <- function() {
    list(network_ok = network_ok, successor = successor, message = NULL)
  }
  stubs$.jst_show_version_status <- function(installed_ver, pkg = NULL) {
    packageStartupMessage(.VSTUB)
  }
  environment(f) <- stubs
  grab(f(dirname(find.package("jstats")), pkgname))
}

has <- function(txt, pattern) grepl(pattern, txt, fixed = TRUE)

# Fixtures. .nsname is the EXACT value attachNamespace() passes as pkgname.
.nsname <- getNamespaceName("jstats")
.self   <- list(package      = "jstats",
                install_hint = "remotes::install_github('JMA61/jstats', upgrade = 'never')")
.other  <- list(package      = "jstatsnext",
                install_hint = "install.packages('jstatsnext')")
.RENAMED <- "has been renamed to"
.POINTER <- "run jai()."

# --- A: the successor names jstats itself (the standing gist) ---------------

check("A01 premise: getNamespaceName() -- what R passes .onAttach() -- is NAMED (if red, R changed and A02-A04 can no longer fail)",
      !is.null(names(.nsname)) && identical(unname(.nsname), "jstats"))

.out_self_named <- attach_run(.nsname, successor = .self)

check("A02 self-successor, R's named pkgname: no rename notice",
      !has(.out_self_named, .RENAMED))

check("A03 self-successor, R's named pkgname: the version check is REACHED",
      has(.out_self_named, .VSTUB))

check("A04 self-successor, R's named pkgname: the jai() pointer shows",
      has(.out_self_named, .POINTER))

.out_self_plain <- attach_run("jstats", successor = .self)

check("A05 self-successor, plain pkgname (control): no notice, version check reached",
      !has(.out_self_plain, .RENAMED) && has(.out_self_plain, .VSTUB))

# --- B: the successor names a different package (a real rename) ------------

.out_other <- attach_run(.nsname, successor = .other)

check("B01 real rename: the notice names the successor",
      has(.out_other, "has been renamed to `jstatsnext`"))

check("B02 real rename: the install hint is echoed",
      has(.out_other, "install.packages('jstatsnext')"))

check("B03 real rename: version check and jai() pointer both suppressed",
      !has(.out_other, .VSTUB) && !has(.out_other, .POINTER))

# --- C: branches the fix does not touch (controls) --------------------------

.out_none <- attach_run(.nsname, successor = NULL)

check("C01 no successor: version check reached, pointer shows, no notice",
      has(.out_none, .VSTUB) && has(.out_none, .POINTER) &&
        !has(.out_none, .RENAMED))

.out_offline <- attach_run(.nsname, successor = NULL, network_ok = FALSE)

check("C02 no network: the did-not-complete line, version check NOT reached, pointer shows",
      has(.out_offline, "The check for updates did not complete.") &&
        !has(.out_offline, .VSTUB) && has(.out_offline, .POINTER))

# The startup line names no cause (Session 341). The version read can fail
# on its own, after the gist read succeeded: the REAL
# .jst_show_version_status(), its version read stubbed to NA, prints the
# same line the no-network branch does.
.UPD_VER  <- as.character(utils::packageVersion("jstats"))
.UPD_LINE <- paste0("jstats v", .UPD_VER, " loaded. ",
                    "The check for updates did not complete.\n",
                    "To check again, run jupdate().\n")
version_na_run <- function() {
  f     <- jstats:::.jst_show_version_status
  stubs <- new.env(parent = environment(f))
  stubs$.jst_latest_universe_version <- function(pkg = NULL) NA_character_
  environment(f) <- stubs
  grab(f(.UPD_VER, "jstats"))
}

check("C04 the version read fails after the gist read succeeded: the same line, whole",
      identical(version_na_run(), .UPD_LINE))

check("C05 the no-network line guesses no cause: no \"internet\" and no question mark, and its last line before the pointer is the one remedy",
      !has(.out_offline, "internet") && !has(.out_offline, "?") &&
        has(.out_offline, "\nTo check again, run jupdate().\n"))

check("C03 every run emitted something (the interactive gate did not return early)",
      all(nzchar(c(.out_self_named, .out_self_plain, .out_other,
                   .out_none, .out_offline))))

# --- D: jupdate() installs into the library holding the copy in use (S309) --

# The two helpers, on real folders. D01 uses utils, which is always installed
# in a library on .libPaths(), so the on-path answer is deterministic under
# both load_all() and library(jstats) (under load_all() jstats's own path is
# a SOURCE folder -- D02's case). The probe leaves nothing behind (D03).
.utils_lib <- normalizePath(dirname(find.package("utils")), winslash = "/")
check("D01 target: an on-path package resolves to the library holding it",
      identical(.jst_update_target_lib(find.package("utils")), .utils_lib))

.src_dir <- tempfile("srcpkg"); dir.create(.src_dir)
check("D02 target: an off-path folder (the load_all() source tree) falls back to .libPaths()[1]",
      identical(.jst_update_target_lib(.src_dir),
                normalizePath(.libPaths()[1L], winslash = "/", mustWork = FALSE)))

.lib_w <- tempfile("libw"); dir.create(.lib_w)
check("D03 writable: a folder this session can write to -> TRUE, and the probe is removed",
      isTRUE(.jst_lib_writable(.lib_w)) &&
        length(list.files(.lib_w, all.files = TRUE, no.. = TRUE)) == 0L)

check("D04 writable: a folder that does not exist -> FALSE",
      identical(.jst_lib_writable(file.path(.lib_w, "absent")), FALSE))

# update_run(): run a COPY of jupdate() with the gist read, the r-universe
# version read, the target-library resolver, the writability probe, the
# callr install step and the on-disk version read all replaced by stubs,
# and return what it emits. The install stub records the library it was
# HANDED in .handed, so a check can assert both that the step was reached
# and what it received, and returns `reported` -- what the real child
# returns: install.packages()'s warnings, empty on a clean install. The
# version-on-disk stub returns `on_disk`, which defaults to `latest` (the
# install worked) and is set to the OLD version to play a child that
# returned normally having installed nothing. Nothing is installed and
# nothing touches the network. The copy is called under the name jupdate
# so .jst_stop()'s caller detection prefixes the error as the real one is.
.LIB      <- "C:/Program Files/R/R-4.6.1/library"
.handed   <- NULL
.INSTALLED <- as.character(utils::packageVersion("jstats"))
update_run <- function(writable = TRUE, latest = "99.0.0", install_error = NULL,
                       reported = character(0), on_disk = latest) {
  .handed <<- NULL
  f     <- jstats:::jupdate
  stubs <- new.env(parent = environment(f))
  stubs$.jst_read_gist <- function() {
    list(network_ok = TRUE, successor = NULL, message = NULL)
  }
  stubs$.jst_latest_universe_version <- function(pkg = NULL) latest
  stubs$.jst_update_target_lib       <- function(pkg_path = NULL) .LIB
  stubs$.jst_lib_writable            <- function(lib) writable
  stubs$.jst_update_install          <- function(lib) {
    .handed <<- lib
    if (!is.null(install_error)) stop(install_error)
    reported
  }
  stubs$.jst_update_installed_version <- function(lib) on_disk
  environment(f) <- stubs
  jupdate <- f
  grab(jupdate())
}

.out_locked <- update_run(writable = FALSE)

check("D05 unwritable target: the stop names the function and the folder on its own line",
      has(.out_locked, "jupdate(): R cannot write to the folder where jstats is installed:") &&
        has(.out_locked, paste0("\n  ", .LIB, "\n")))

check("D06 unwritable target: the remedy is write permission, the Windows parenthetical, then jupdate() again (flattened: the line wraps at the pin)",
      has(gsub("\n", " ", .out_locked, fixed = TRUE),
          paste0("Run R with permission to write to that folder (on your own Windows ",
                 "computer, this usually means starting RStudio as an administrator), ",
                 "then run jupdate() again.")))

check("D07 unwritable target: the install step is NOT reached and no update is announced",
      is.null(.handed) && !has(.out_locked, "Updating jstats"))

.out_open <- update_run(writable = TRUE)

check("D08 writable target: the install step is handed the RESOLVED library",
      identical(.handed, .LIB))

check("D09 writable target: the update is announced and success names the version now on disk",
      has(.out_open, "Updating jstats") &&
        has(.out_open, "jstats has been updated to version 99.0.0."))

.out_current <- update_run(latest = "0.0.1")

check("D10 control: an up-to-date install stops before the target is probed",
      has(.out_current, "is already up to date.") && is.null(.handed))

.out_failed <- update_run(install_error = "boom from the child")

check("D11 control: a failing install is still surfaced through the wrapper (flattened: the line wraps at the pin)",
      has(gsub("\n", " ", .out_failed, fixed = TRUE),
          "the update did not complete. The error was: boom from the child"))

# E: the child returned normally but installed nothing (install.packages()
# only warns), so the version on disk is unchanged. The real two-line
# warning a blocked repository produces, followed by its consequence.
.W_INDEX <- paste0("unable to access index for repository ",
                   "https://jma61.r-universe.dev/bin/windows/contrib/4.6:\n",
                   "  cannot open URL 'https://jma61.r-universe.dev/bin/windows/",
                   "contrib/4.6/PACKAGES'")
.W_AVAIL <- "package 'jstats' is not available for this version of R"

.out_nothing <- update_run(reported = c(.W_INDEX, .W_AVAIL), on_disk = .INSTALLED)
.flat_nothing <- gsub("\n *", " ", .out_nothing)   # a wrapped line's hang is newline + indent

check("D12 quiet failure: the stop states that the folder still holds the old version, on its own line",
      has(.out_nothing, "jupdate(): the update did not complete.\n") &&
        has(.out_nothing, paste0("The copy in this folder is still version ", .INSTALLED, ":\n  ", .LIB, "\n")) &&
        !has(.out_nothing, "has been updated"))

check("D13 quiet failure: R's FIRST warning is repeated, whitespace flattened, then the remedy (flattened: the reason wraps)",
      has(.out_nothing, "\nR reported:\n  ") &&
        has(.flat_nothing, "unable to access index for repository https://jma61.r-universe.dev/bin/windows/contrib/4.6: cannot open URL") &&
        has(.flat_nothing, "Once that is fixed, run jupdate() again."))

check("D14 quiet failure: the consequence warning (\"not available\") is NOT repeated",
      !has(.flat_nothing, .W_AVAIL))

.out_silent <- update_run(reported = character(0), on_disk = .INSTALLED)

check("D15 quiet failure with nothing reported: no \"R reported\" block, the bare remedy",
      has(.out_silent, "still version") && !has(.out_silent, "R reported") &&
        has(.out_silent, "\nRun jupdate() again."))

# The order a blocked repository really produces: R's download layer warns
# about byte counts BEFORE the warning that names what it could not reach.
.W_BYTES <- "downloaded length 0 != reported length 0"
.W_URL   <- paste0("cannot open URL 'https://jma61.r-universe.dev/src/contrib/",
                   "PACKAGES.rds': HTTP status was '403 Forbidden'")
.out_bytes <- update_run(reported = c(.W_BYTES, .W_URL, .W_AVAIL), on_disk = .INSTALLED)

check("D16 quiet failure: the reason shown is the first warning naming a web address, not the first warning",
      has(gsub("\n *", " ", .out_bytes), .W_URL) && !has(.out_bytes, .W_BYTES))

.out_gone <- update_run(reported = character(0), on_disk = NULL)

check("D17 quiet failure: no jstats on disk in the target afterwards is also a failure, not success",
      has(.out_gone, "the update did not complete.") && !has(.out_gone, "has been updated"))

unlink(c(.src_dir, .lib_w), recursive = TRUE)

# --- F: the network blocked or absent -- no warning of R's own (S340) -------
# The Session 202 find-out run. With the network blocked, every
# library(jstats) ended on R's own warning -- "In file(con, "r") : URL
# 'https://gist.githubusercontent.com/...': status was 'Couldn't connect to
# server'" -- under the package's own startup line: an
# address that cannot be opened WARNS before it errors, and .jst_read_gist()
# caught only the error. Section C could not see it, because attach_run()
# stubs that helper. Here the REAL helper reads an address that cannot be
# opened: a file:// address of a file that does not exist, which fails the
# way a blocked URL does (a warning, then the error) with no network at all.
# .warned(): the warnings a call raises.
.warned <- function(expr) {
  w <- character(0)
  withCallingHandlers(tryCatch(expr, error = function(e) NULL),
                      warning = function(c) {
                        w <<- c(w, conditionMessage(c)); invokeRestart("muffleWarning")
                      })
  w
}
.gone_url <- paste0("file:///", gsub("^/", "", gsub("\\\\", "/", tempfile("no_gist_"))), ".json")

check("F01 premise: opening an address that cannot be opened WARNS before it errors (if red, F02 and F04 can no longer fail)",
      length(.warned(readLines(.gone_url, warn = FALSE))) >= 1L)

check("F02 .jst_read_gist() on such an address raises no warning",
      length(.warned(jstats:::.jst_read_gist(.gone_url))) == 0L)

check("F03 ... and reports the network unreachable, with no successor and no message",
      identical(jstats:::.jst_read_gist(.gone_url),
                list(network_ok = FALSE, successor = NULL, message = NULL)))

# The real hook with the real gist helper, aimed at that address; only the
# version check is stubbed (it is not reached).
attach_real <- function(url) {
  f     <- jstats:::.onAttach
  stubs <- new.env(parent = environment(f))
  stubs$.jst_read_gist <- function() jstats:::.jst_read_gist(url)
  stubs$.jst_show_version_status <- function(installed_ver, pkg = NULL) {
    packageStartupMessage(.VSTUB)
  }
  environment(f) <- stubs
  # grab() takes a warning into its text, so a leaked one fails the
  # identical() below.
  list(out = grab(f(dirname(find.package("jstats")), .nsname)))
}
.att_gone <- attach_real(.gone_url)

check("F04 library(jstats) with the network unreachable: the two startup lines and nothing else -- no warning, no web address",
      identical(.att_gone$out, paste0(
        .UPD_LINE,
        "For jstats conventions (useful to AI assistants too), run jai().\n")) &&
        !has(.att_gone$out, "://"))

.gist_ok <- tempfile("gist_", fileext = ".json")
writeLines('{ "schema_version": 1, "current_package": "jstats", "successor": null, "message": "Course data updated.", "last_updated": "2026-10-05" }',
           .gist_ok)
.ok_url <- paste0("file:///", gsub("^/", "", gsub("\\\\", "/", .gist_ok)))

check("F05 control: an address that CAN be read is still read -- the network is ok and the broadcast message parsed",
      identical(jstats:::.jst_read_gist(.ok_url),
                list(network_ok = TRUE, successor = NULL,
                     message = "Course data updated.")))
unlink(.gist_ok)

# --- G: jupdate() with the network unreachable (S340) -----------------------
# It said "no internet connection was detected ... Connect and run jupdate()
# again", which sends a user who IS connected -- behind a firewall, or in an
# AI assistant's sandbox mode -- looking for a fault they do not have. What
# failed is R's read of a web address, which an absent connection and a
# blocked one produce alike (voice Rule AH: no cause that was not checked).
update_blocked <- function() {
  .handed <<- NULL
  f     <- jstats:::jupdate
  stubs <- new.env(parent = environment(f))
  stubs$.jst_read_gist <- function() jstats:::.jst_read_gist(.gone_url)
  stubs$.jst_lib_writable   <- function(lib) { .handed <<- "probed"; TRUE }
  stubs$.jst_update_install <- function(lib) { .handed <<- lib; character(0) }
  environment(f) <- stubs
  jupdate <- f
  list(out = grab(jupdate()))
}
.upd_gone <- update_blocked()

check("G01 jupdate(), network unreachable: the stop pinned whole -- what happened, then each case on a line of its own",
      identical(.upd_gone$out, paste0(
        "jupdate(): jstats was not updated: R could not reach the internet.\n",
        "If this computer is offline, connect and run jupdate() again.\n",
        "If it is online, something is blocking R's connection, such as a firewall or\n",
        "an AI assistant's sandbox mode.")))

check("G02 ... and neither the folder probe nor the install is reached (G01, pinned whole, is what shows no warning of R's own came with it: grab() takes warnings into its text)",
      is.null(.handed))

# --- H: jsave() into a folder R cannot write to (S340) ----------------------
# A read-only folder, or one a sandbox mode keeps writes out of. Each format
# failed in its writer's own words, two of them R's: saveRDS() warned
# "cannot open compressed file './jsave_d_22e05de3092d.rds'" -- a temporary
# name the user never typed -- and stopped on "cannot open the connection".
# jsave() now probes the folder first (.jst_lib_writable(), section D's
# helper). A folder cannot be made unwritable the same way on every
# platform, so the probe is stubbed, as section D stubs it for jupdate().
.sv_dir <- tempfile("svdir"); dir.create(.sv_dir)
save_run <- function(file, writable) {
  f     <- jstats:::jsave
  stubs <- new.env(parent = environment(f))
  if (!writable) stubs$.jst_lib_writable <- function(lib) FALSE
  environment(f) <- stubs
  jsave <- f
  svd <- data.frame(x = 1:3)
  grab(jsave(svd, file))
}
.sv_dir_n <- normalizePath(.sv_dir, winslash = "/", mustWork = FALSE)
.sv_stop  <- paste0("jsave(): R cannot write to this folder:\n",
                    "  ", .sv_dir_n, "\n",
                    "Nothing was saved.\n",
                    "Choose a folder you can write to and run jsave() again.")

check("H01 an unwritable folder: one stop -- the folder on its own line, that nothing was saved, the way out",
      identical(save_run(file.path(.sv_dir, "out.rds"), writable = FALSE), .sv_stop))

check("H02 ... the same stop for every format (.sav, .dta, .csv and .xlsx each failed in its writer's own words)",
      all(vapply(c("sav", "dta", "csv", "xlsx"), function(e)
        identical(save_run(file.path(.sv_dir, paste0("out.", e)), writable = FALSE),
                  .sv_stop), logical(1))))

check("H03 ... and nothing is written: no file, no temporary file",
      length(list.files(.sv_dir, all.files = TRUE, no.. = TRUE)) == 0L)

check("H04 control: a folder that can be written to takes the file, and the probe leaves nothing beside it",
      { out <- save_run(file.path(.sv_dir, "out.rds"), writable = TRUE)
        has(out, "Saved svd to") &&
          identical(list.files(.sv_dir, all.files = TRUE, no.. = TRUE), "out.rds") })

check("H05 the folder check comes after the format check: an unsupported extension is still the format's stop",
      !has(save_run(file.path(.sv_dir, "out.zzz"), writable = FALSE),
           "R cannot write to this folder"))
unlink(.sv_dir, recursive = TRUE)

# --- Restore -----------------------------------------------------------------

options(.entry_attach_opts)
options(.jst_options_message_width = .entry_message_width)

# --- Verdict -----------------------------------------------------------------

.n_ok <- sum(vapply(.results, `[[`, logical(1), "ok"))
.n    <- length(.results)
if (.n_ok == .n) {
  cat("\nRESULT: PASS (", .n_ok, "/", .n, ")\n", sep = "")
  # Fixture cleanup (S337, the S249 item): a green run leaves nothing behind
  # but .results, which run_all.R reads. A red run keeps its fixtures, for
  # a look at what failed.
  rm(list = setdiff(ls(globalenv(), all.names = TRUE),
                    c(.entry_names, ".results")), envir = globalenv())
} else {
  cat("\nRESULT: FAIL (", .n_ok, "/", .n, " passed)\n", sep = "")
  for (r in .results) if (!r$ok) cat("  failed: ", r$desc, "\n", sep = "")
  stop("assertion battery failed", call. = FALSE)
}
