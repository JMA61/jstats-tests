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
#           where it was asked to be.
#           (U-Y) build 3 (S403, v0.9.272): the regression table from
#           jlm() results and its logistic twin from jlogistic() results
#           on one builder -- the models side by side under spanners, the
#           Constant, a dummy-coded variable's categories by their value
#           labels with the reference after the label or in the note, the
#           fit rows spanning each model's columns, the Gelman column and
#           the columns a call or a file adds, the Ns-differ note and the
#           delta-R2 note, the stops; the general changes (n.position,
#           leading.zero = never, the near-zero coefficient, the italic
#           heads, landscape in the call); the preview pinned whole; the
#           Word file read for its spanners, heads, spanning fit cells
#           and fit to the landscape page and pinned by checksum;
#           jstyle()'s [regression] and [logistic] sections.
#           (AA-AJ) build 4 (S405, v0.9.273): the correlation, t-test,
#           ANOVA, crosstab and reliability tables from jcorr(), jt(),
#           jaov(), jcrosstab() and jalpha() results (rulings R54 and R55,
#           the eight S404 leans) -- their columns, spanners, cells (computed
#           here from the data with base R), notes and stops; the filter
#           sentence in every table type; heads with markup; the five
#           previews pinned whole; the Word file of the five (ruling R55's
#           fit and landscape test, the cells set centered); the stops that
#           named jtable() twice; jstyle()'s five new sections.
#           (AK-AO) build 5 (S406, v0.9.274; rulings R56 and R57): one call
#           makes one table -- the stops for results that cannot share a
#           table, the lines they offer (run here as they stand), the names
#           that never replace an object; the report jtable() prints in
#           place of the table, its page checked against the Word file;
#           tables written together as one object, printed numbered, spliced
#           into a list, each on the page it needs; jstyle(save.as =) with
#           settings writing a short file, read back, based on a path, and
#           its stops; the "# takes:" notes; the exports, the
#           ?jstyle_settings page, the orientation's tables bullet; jsave()
#           and jload() given a result or a built table.
#           (AP) the release build (S407, v0.9.275): two codes that share a
#           value label kept apart -- jfreq()'s rows, the groups of jt(),
#           jaov(), jcrosstab() and jdesc(by =), jplot()'s bars, groups and
#           panels, the tables' rows -- each shown with its code where the
#           labels collide; the factor they are made from against
#           haven::as_factor(); the reserved style name "report"; a file
#           named apa.jstyle passed over with a note; each table's font in
#           a document of tables built under two styles; since the S407
#           rebuild the Word widths measured in each table's font (Times,
#           Arial, Calibri, any other generously), each indent as Word
#           draws it, a bold head or label row bold, a label row wider than
#           its table widening the stub, the fit and the page turned on the
#           stub's floor in that font; the style files' head and notes
#           unwrapped; since the second rebuild a label row setting the
#           stub as the preview does (a fitted stub may narrow past it), a
#           table narrower than its title widening to it, a short file's
#           head naming the style it is based on.
#           (AQ) Capability Slate U's build 1 (S409, v0.9.276; ruling R58):
#           the built-in report style -- its values and layers, its
#           printout, a regression table in it (the preview pinned whole,
#           the Word file read); the three new general settings, their
#           checks and their looks in the Word file (the caption bar
#           following the header, each variable's label row filled, the
#           note label upright or italic); an empty note label; the stars
#           legend under leading.zero; the built-in names refused as a
#           copy's and a report.jstyle passed over; a complete copy's head
#           with the block for an AI assistant and based.on naming report;
#           a short copy of report's head; jstyle(open = TRUE) through a
#           stand-in opener; Fix Slate V's dummy rows cut alike at 40
#           columns; the settings help page giving report's values.
#           (AR) the small build (S410, v0.9.277; ruling R59): N after the
#           title by default -- apa's n.position is title, and report inherits
#           it -- in every table built from one pool of cases; the ns that
#           vary within a table (models side by side, pairwise correlations, a
#           crosstab's or a scale's variables, variables from different pools)
#           and a t test's or an ANOVA's groups, of any sizes, in the note,
#           exactly as n.position = note writes them; N in the preview's
#           caption, the report's line and the Word caption; a blank line
#           after each setting in the files jstyle() writes, none between a
#           setting's notes and the setting.
# ORIGIN:   S399 (v0.9.269; Capability Slate T, build 0)
# LAST VERIFIED: v0.9.277, 2026-11-07 (S410) -- 294/294 on the WORKSTATION;
#           the S410 EDIT block below holds the stamp. Prior: v0.9.276,
#           2026-11-06 (S409, the rebuild) -- 287/287 (the S409 REBUILD
#           block); v0.9.275, 2026-11-05 (S407, the second rebuild) --
#           272/272 (the S407 SECOND REBUILD block); v0.9.274, 2026-11-04
#           (S406) -- 254/254 (the
#           S406 EDIT block); v0.9.273,
#           2026-11-04 (S405) -- 223/223 (the S405 EDIT block); v0.9.272,
#           2026-11-03 (S403) -- 179/179 (the S403 EDIT block); v0.9.271,
#           2026-10-29 (S401) -- 141/141 (the S401 EDIT block); v0.9.270,
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
# S410 EDIT (v0.9.277, 2026-11-06): the small build: ruling R59 and the (S409)
#           blank-line rider. SECTION AR ADDED, 7 checks (294 in all); 55
#           checks RE-PINNED. (AR01) apa's n.position is title and report
#           inherits it (ruled at S409, Jeff: "I want it as the default in the
#           apa style"); the setting's note says a table with several ns gives
#           them in the note; the settings help page gives title as apa's
#           value. (AR02) a table from one pool of cases in seven types --
#           descriptives, frequencies, one linear and one logistic model, a
#           correlation table whose pairs share N, a crosstab and a scale
#           whose variables share it -- "(*N* = n)" after the title and no N
#           in the note; a note style gives the note's form, none neither.
#           (AR03) ns that vary within a table -- models side by side,
#           pairwise correlations, crosstab variables, scales, variables from
#           different pools -- built under apa exactly as under a note style.
#           (AR04) a t test's or an ANOVA's groups -- of different sizes, of
#           one size, varying with missing data, four of them, and an n column
#           -- built under apa exactly as under a note style, nothing after
#           the title (the reading Jeff confirmed: "when the Ns differ by
#           variable or model, they go in the note as today"; groups of one
#           size too, Claude's call); none writes no ns. (AR05) N after the
#           title in the preview's caption, the report's line and the Word
#           caption, under apa and under report. (AR06) a complete copy: a
#           blank line after every setting and after each part's heading note,
#           none between a setting's notes and the setting, none twice, none
#           at the end; it reads back as the same file without its blank lines
#           does, and as apa. (AR07) a short file: a blank line after each
#           setting but the last, so a section's heading follows one; it reads
#           back.
#           RE-PINNED, each value read from the battery run on the build, the
#           three Word checksums diffed against v0.9.276's document.xml (N
#           moved into the caption; a note row gone where N was all it held,
#           and the last row's keep-with-next with it; no width moved). N
#           after the title and the general note without it -- empty, or the
#           user's, the filter's or the reference's sentence alone: J03, J06,
#           J08, K01, K03, K04, K05, L01, L03, L08, L10, L11, L17, P02, P08,
#           P09, P11, R01, U01, V01, V03, V04, V05, V13, W01, W02, X01, X02,
#           Y01, Y05, Y07, AA05, AB04, AF01, AF02, AG05, AH06 and AL01-AL04.
#           AC04: the paired test's ns in the note under apa, as under note.
#           U06: .jst_table_n_parts()'s new argument, varies. V09: models
#           whose Ns differ, built under title, give the note build's notes.
#           AN01: the short file's blank lines. U07, AQ06, AQ07 and AQ09: a
#           note style named, or a note of the call's own, where the check
#           reads the note row. AP13-AP18: their fixtures built under a note
#           style, so the widths they measure are the table's and not its
#           title's, which since S407 widens a narrower table.
#           Against v0.9.276 the battery reads 242/294: the 47 re-pinned
#           checks the new default moves red, with AR01, AR02, AR05, AR06 and
#           AR07; AR03 and AR04 compare apa's build with a note style's, which
#           v0.9.276's apa was. MUTATION MAP (S410; 12 one-change mutants of
#           tables.R, each anchor found once, run detached; by the checks that
#           red): the title branch blind to varying ns U06, AR03 (and ten
#           more); the t-test and ANOVA builder writing the groups' ns under
#           note only AR04 (and eleven more); apa's default back to note AR01,
#           AR02 (and 44 more); the pools never varying AR03 (and four more);
#           the models' Ns never differing V09, V10, AR03; the correlation's
#           never AB01, AB03, AB04, AG01, AH06, AR03; the short writer without
#           its blank lines AN01, AR07; the complete writer without them AR06;
#           two blank lines left together AN01, AR06, AR07; a blank line left
#           at the end AN01, AN03, AR06, AR07; no blank line after a part's
#           heading note AR06; the title branch writing the note as well U06,
#           AR02 (and 30 more).
#           WORKSTATION, through receive_all(): "R CMD check: 0 errors, 0
#           warnings, 0 notes."; "ALL BATTERIES GREEN (12 run, 3645 checks)"
#           -- matching the sandbox (plain, under the RStudio-handler
#           stand-in, each again with a 35-character temp path, interactive,
#           and with the temporary folder reached through a symlink; entered
#           dirty plain and under the handlers, nothing added, removed or
#           changed; a LANG=C install clean).
# S409 REBUILD (v0.9.276, the same version, 2026-11-06; on Jeff's receive:
#           "tables_check.R FAIL 286/287 -- failed: AQ13", every other
#           battery green, R CMD check clean). AQ13's stand-in recorded the
#           path the package hands to the opener as given; the check
#           expects it normalized, as the opener gives it to the editor. In
#           the sandbox tempdir() is already in that form; on Windows a path
#           built from it holds backslashes (and can hold short 8.3 names),
#           so the two differed there alone. The stand-in now records
#           normalizePath(path, winslash = "/"); the package is unchanged.
#           Reproduced in the sandbox first, with a temporary folder reached
#           through a symlink (AQ13 red, every other check green, its other
#           parts holding), then 287/287 the same way; plain, under the
#           RStudio-handler stand-in, each with a 35-character temp path,
#           interactive (no question asked) and entered dirty (nothing
#           added, removed or changed): 287/287 each. The mutants that red
#           AQ13 (report's open = not stopped, the editor opened where the
#           session cannot show it, open = TRUE printing the settings) run
#           again: AQ13 red for each. WORKSTATION, through receive_all() on
#           the rebuild: "R CMD check: 0 errors, 0 warnings, 0 notes.";
#           "ALL BATTERIES GREEN (12 run, 3638 checks)" -- matching the
#           sandbox (plain, under the RStudio-handler stand-in, each again
#           with a 35-character temp path, and interactive; entered dirty
#           plain and under the handlers, nothing added, removed or
#           changed; a LANG=C install clean). The first delivery read
#           "run_all.R: NOT GREEN", tables_check.R 286/287 (AQ13), there.
# S409 EDIT (v0.9.276, 2026-11-06): Capability Slate U's build 1, the look
#           layer. SECTION AQ ADDED, 15 checks (287 in all); O03, O05,
#           Y07, AA01, AJ01, AN01, AN02, AN03, AO03, AP09 and AP10
#           RE-PINNED. (AQ01) report a built-in style, a short style based
#           on apa: its layers, report then apa, no file; its ten values
#           (Arial 10, the caption 10 and the note 9, the report caption
#           form, a D9D9D9 bold header, the zero kept, an upright "Note:")
#           and the bold variable rows of its four sections, every other
#           setting apa's -- each read through .jst_style_key() against
#           apa's; no name kept for a built-in to come. (AQ02) the three
#           new general settings, caption.fill, heading.fill and
#           note.label.italic, placed beside their kin and off in apa;
#           their checks (caption.fill takes header, in any case), the stop
#           for a wrong value, a file setting each. (AQ03) jstyle("report")
#           printed as built into jstats and based on apa, its own settings
#           unmarked. (AQ04) the caption bar in the Word file: header takes
#           the header's fill and sets every caption run in the header's
#           text color, a color fills and leaves the text black, a caption
#           set as a paragraph untouched, report none. (AQ05) heading.fill
#           on each variable's label row and nowhere else -- a frequency
#           table's, a crosstab's across its test cells, a regression's
#           dummy-coded variable. (AQ06) the note's label upright under
#           report, italic under apa, in the run and the marked-up line.
#           (AQ07) an empty note.label: no label and no asterisks, in the
#           line, the preview and the Word file. (AQ08) the stars legend
#           keeping the zero under leading.zero = yes, as the cells do.
#           (AQ09) a regression table in report: the preview pinned whole,
#           the Word file's font, sizes, fills and bold. (AQ10) the
#           built-in names refused as a copy's, the line offered copying
#           the call's own style; a report.jstyle passed over with one
#           note; report typed bare. (AQ11) a complete copy's head pinned
#           whole, the block for an AI assistant included; based.on report
#           for a copy of report or of a file based on it, apa otherwise;
#           each read back as the style it copied. (AQ12) a short copy of
#           report's head. (AQ13) jstyle(open = TRUE) through a stand-in
#           for the editor -- a trace() on .jst_style_open() that records
#           the path and sets ask to FALSE, so nothing opens in the
#           workstation's interactive receive, removed on exit: a style
#           named, by path, the session's style, with save.as, a file it
#           cannot use opened and then stopped; the two built-ins' stops,
#           a name found nowhere, open = neither TRUE nor FALSE; the opener
#           run only when open = TRUE and the session can show it. (AQ14)
#           Fix Slate V: a reference and a category the 40-column cap cuts
#           alike show their codes in jlm()'s header and rows, in both
#           results' dummy_groups and in the filter stop. (AQ15)
#           ?jstyle_settings gives report's value beside apa's where they
#           differ. RE-PINNED: O03 (the complete copy's head: the editing
#           rule's one wording and the AI block), O05 (apa's stop, "a style
#           built into jstats", its line naming myapa), AP09 (report's
#           stop), AP10 (the passed-over note), AN01 (the short head), AO03
#           (the orientation, 3.10: both built-ins, the short call, open =
#           TRUE, the editing rule), AA01 (31 general settings), Y07, AJ01,
#           AN02 and AN03 (the printout's columns one place wider, for
#           note.label.italic).
#           The section's setup runs through .aqtry() (guard 3), so a build
#           without one of its pieces reds the checks that read it rather
#           than halting the battery: the first run against v0.9.275
#           halted at AQ01's setup. Against v0.9.275 the battery reads
#           261/287, each of the fifteen AQ checks red with the eleven
#           re-pinned. MUTATION MAP (S409; 30 one-change mutants of
#           tables.R, models.R and utils.R, each anchor found once, run
#           detached; by the checks that red): report's font apa's AQ01;
#           its leading.zero no AQ01, AQ08; its note label apa's AQ01,
#           AQ06; its crosstab rows plain AQ01; apa's layer read before
#           report's AQ01 (and eight more); the caption bar never filled
#           AQ04, its text not the header's color AQ04, its runs uncolored
#           AQ04; role headings filled AQ05; every data row filled AQ05;
#           the label always italic AQ06; an empty label left as asterisks
#           AQ07; the legend dropping the zero always AQ08; header taken
#           by every color setting AQ02; report allowed as a copy's name
#           AP09, AQ10; the passed-over note reworded AP10, AQ10; the AI
#           block reworded O03, AQ11, dropped O03, AQ11; a copy of report
#           based on apa AQ11; the short head's old article AN01, AQ12;
#           report's open = not stopped AQ13; open = TRUE printing the
#           settings AQ13; the editor opened in a session that cannot show
#           it AQ13 (on the first round it opened a real one and the
#           battery hung, so AQ13's stand-in now replaces the opener as
#           well as the session test); report's values off the help page
#           AQ15; dummy_groups' labels, the header's reference and a
#           coefficient row each formatted one at a time AQ14; the
#           absent-category note's categories formatted one at a time AQ14
#           (survived the first round, red once AQ14 gained the note); the
#           orientation version not bumped AO03, the short call not taught
#           AO03. Fix Slate V's second item removed the first of plot.R's
#           two .jst_plot_group_factor() definitions, the dead one the
#           S407 round left SURVIVED by design.
# S407 SECOND REBUILD (v0.9.275, the same version, 2026-11-05; on Jeff's
#           walk of the first: Table 2's title on two lines, the n and %
#           columns standing under "How we contacted you", and "every
#           other setting comes from the style based.on names" cryptic).
#           AP18 ADDED (272 in all); AP15 and AP16 REWRITTEN; P11 and AN01
#           RE-PINNED. (AP15) a variable's label row sets the stub as a
#           category does, as the console's preview sets it (Jeff: "should
#           define the width of that first column"; from S403 the data rows
#           alone set it -- a call of Claude's, walked then); fitted to a
#           page too narrow for it, the stub narrows past the label, which
#           spans the table, at the table's own size -- the two-line floor,
#           the turn of the page and the report's "long labels on two
#           lines" all read the categories. (AP16) a label row set bold
#           sets the stub at its bold width. (AP18) a table narrower than
#           its title widens to it, every column in proportion, the
#           remainder to the stub, as far as the page (Jeff: "Frequency
#           Distributions should be on a single line"); a caption set as a
#           paragraph widens nothing; the title's width in apa's, the
#           journal's and the report's caption forms, and the tenth table
#           of a file measured as Table 10. P11: the stub 46 twips wider
#           ("Highest education level"), nothing else moved, diffed
#           against the first rebuild. AN01: the head's second and third
#           lines, Jeff's wording -- "based on apa, the style built into
#           jstats" and "It lists only the settings that differ from apa;
#           any setting not listed here takes apa's value." -- a file based
#           on another naming it without the clause. The five red on the
#           first rebuild. MUTATION MAP (the second rebuild; 19 one-change
#           mutants of tables.R): label rows out of the stub P11; label
#           rows never bold AP16; the floor, the fit, the page and the
#           report reading the label rows AP15 (each), the headings
#           argument ignored AP15; the title's widening off AP18, uncapped
#           AP18, all to the stub AP18, under a paragraph caption AP18;
#           apa's title measured bold AP18, the report's upright AP18, the
#           journal's number dropped AP18, every table measured as Table 1
#           AP18 (survived until AP18 gained the tenth table); the head's
#           built-in clause off AN01, the old sentence AN01, the built-in
#           never named AN01. WORKSTATION, through receive_all(): "R CMD
#           check: 0 errors, 0 warnings, 0 notes."; "ALL BATTERIES GREEN (12
#           run, 3623 checks)" -- matching the sandbox (plain, under the
#           RStudio-handler stand-in, each again with a 35-character temp
#           path, and interactive; entered dirty plain and under the
#           handlers, nothing added, removed or changed; a LANG=C install
#           clean). The first delivery read "ALL BATTERIES GREEN (12 run,
#           3617 checks)" there.
# S407 REBUILD (v0.9.275, the same version, 2026-11-05; on Jeff's walk of
#           the delivery: in TwoFonts.docx Table 2, Arial 11, wrapped "How
#           we contacted you", "2: Other" and "3: Other", and the style
#           files' head read poorly, wrapped at 76 columns). AP13-AP17
#           ADDED, 5 checks (271 in all); L10, P11, O03, AN01, AN03 and AN07
#           RE-PINNED. (AP13) the widths a table is measured in follow its
#           font -- Times New Roman's for that face, its kin and none named,
#           Arial's for Arial and Helvetica, Calibri's for Calibri and
#           Carlito, any other face at least as wide as all three -- checked
#           against the faces' published metrics typed here, and the stub's
#           two-line floor measured in the font. (AP14) a frequency table's
#           stub in apa and in an Arial 11 style: the widest category beside
#           its 180-twip indent (until this build measured as two spaces,
#           about 125 twips at 12 points), the % column and its decimal stop
#           in the same font. (AP15) a variable's label row wider than the
#           whole table widens the stub by the difference; one narrower
#           changes nothing. (AP16) a head set bold measured 8 percent
#           wider, and a label row set bold. (AP17) an Arial table wider
#           than its page fitted, and its page turned, on the floor measured
#           in Arial (pages set between the two measures). L10 and P11: the
#           stub 53 twips wider (the indent), nothing else in either part
#           moved, diffed against the delivery. O03, AN01, AN03 and AN07: a
#           style file's head is its name on a line of its own then one
#           sentence a line, each note and "# takes:" line unwrapped, a
#           note's choices one a line (Jeff: "each sentence should be on its
#           own line"); AN07 also reads ?jstyle_settings joining the same
#           lines. The eleven red on the S407 delivery. MUTATION MAP (the
#           rebuild; 24 one-change mutants of tables.R, each anchor found
#           once): the font lookup ignoring the font AP13, Arial measured as
#           Times AP13, Calibri as Times AP13 (survived until AP13 gained
#           Calibri's own widths), any other face as Times AP13, the lookup
#           case-sensitive K03 (17 red), the em width ignoring its font
#           AP13, the text width AP14, the widths in Times AP14, the indent
#           as two spaces L10, the label row's widening off AP15, the bold
#           allowance off AP16, number-column heads upright AP16, the
#           decimal stops in Times AP14, the stub floor in Times AP13, the
#           fit's floor in Times AP17 and the page's AP17 (both survived
#           until AP17), a bold label row measured upright AP16 (survived
#           until AP16 gained it); the "# takes:" line wrapped again O03, a
#           note's choices joined AN07, a note left in its held lines AN01,
#           the short head's title joined AN01, the complete head's O03, a
#           head sentence reworded O03, the help page's choices joined by a
#           space AN07 (survived until AN07 read the help page).
# S407 EDIT (v0.9.275, 2026-11-05): the release build, a fix slate. SECTION
#           AP ADDED, 12 checks (266 in all), and N03's fixture cleaned up.
#           (AP) the (S399) colliding-labels item, on the lean's default:
#           codes 1 and 2 both labelled "Other" are two rows in jfreq() --
#           under value.id = "labels" "1: Other" and "2: Other", a label
#           no other code shares alone -- with Code and Label as the cells
#           hold them (AP01); two long labels the 40-column cap cuts alike,
#           a labelled value no case holds sharing a present code's label
#           (both rows with codes, the empty one 0), and two long text
#           codes cut alike under "values" (shown whole) (AP02); jt()'s two
#           groups and its t against base R's (AP03); jaov()'s three groups,
#           their means, F and post-hoc pairs by code (AP04); jcrosstab()'s
#           rows and counts by code, jdesc(by =)'s groups (AP05); jplot()'s
#           bars, by = groups, facet = panels and a jaov() result's boxes,
#           an older result's too (AP06); .jst_code_factor() against
#           haven::as_factor() on every labelled column of community, a
#           live declared missing value, and the last resort (AP07); the
#           frequency, ANOVA and crosstab tables' rows, heads and n sentence
#           (AP08). The (S406) reserved name: jstyle(save.as = "report")
#           refused in any case and with a folder, nothing written (AP09).
#           The passed-over note, the lean's default: an apa.jstyle in the
#           style folder named by one note where a call takes the built-in
#           (jstyle("apa"), jtable() on the session's style) and under
#           jstyle()'s list, not where a file's based.on reaches apa, a
#           blank line after it, gone with the file (AP10). The (S406)
#           per-table font: two tables built under apa and an Arial 11 style,
#           written together in both orders, read from document.xml -- the
#           defaults the first table's, the other's font on every run and
#           paragraph mark and its size on the marks; a single table's file
#           naming none (AP11); .jst_docx_retype() on a fixed fragment
#           (AP12). Each of the twelve red on v0.9.274. N03 (S401) wrote an
#           apa.jstyle into the style folder and left it there; since this
#           build every later default-style call would print the passed-over
#           note, so the file is removed after N03, and N03 takes its own
#           resolution of "APA" through res(). MUTATION MAP (S407; 28
#           one-change mutants of pipeline-internals.R, classify.R,
#           descriptives.R, compare.R, plot.R and tables.R, each anchor
#           found once; by the first check that reds): the formatter's
#           collision step off AP02; a collision shown by code alone AP01;
#           jfreq()'s last-resort display off AP02; jfreq()'s display per
#           case, numeric AP02 and text AP02; the factor's collision naming
#           off AP06; its last resort off AP07 (survived the first round,
#           red once AP07 gained the text-code case); jt()'s and jaov()'s
#           group factor by as_factor() AP03; jcrosstab()'s AP05;
#           jdesc(by =)'s AP05; jplot()'s variable AP06, by = AP06 and
#           group-factor fallback AP06; the tables' collision naming AP08;
#           the frequency table named row by row AP08; the reserved name
#           unchecked AP09, reworded AP09; the passed-over note off AP10,
#           fired on a based.on AP10, off the list AP10, without its blank
#           line AP10, reworded AP10; the font not applied AP11; bare runs
#           left plain AP12; the marks without a size AP11; the font on
#           every table L03; the size on every table L04. SURVIVED, by
#           design: the first of plot.R's two .jst_plot_group_factor()
#           definitions mutated -- the second, later in the file, is the one
#           R keeps, so the first is never called (a twin logged at S407).
# S406 EDIT (v0.9.274, 2026-11-04): Capability Slate T, build 5. SECTIONS
#           AK-AO ADDED, 31 checks (254 in all). (AK) ruling R56, one call
#           makes one table: results of different kinds stop with no "yet";
#           models of different outcomes, t tests of different grouping
#           variables, ANOVAs comparing different groups, crosstabs of
#           different column variables or categories, two jcorr() results --
#           each in its own words; the lines given grouped, in the order of
#           each table's first result, a named list's names on its line, a
#           list in a variable offered by place, an expression kept first on
#           a line of its own; style = on every line, a table type's setting
#           on the lines that take it, file =, overwrite =, landscape = and
#           print = on the writing line; a setting no table takes; title =,
#           note = and headings = said to belong on a table's line; the
#           lines run as they stand (AK07); each table built first, so a
#           result that cannot make one stops in its own words; the names
#           that never replace an object; the builders' internal guards.
#           (AL) ruling R57, the report: a table with no file, at the
#           standard level and at "full" (the note with the call that
#           writes and the lines that keep and print); written, then
#           replaced; built tables written together; the page named checked
#           against the file (orientation from the section, the size from
#           the runs) for four tables; the note on tables that could have
#           been one (models of one outcome whatever predictors they share;
#           not tables holding a variable twice, nor correlation tables;
#           without the line for results from an expression; nothing at the
#           standard level). (AM) tables written together: one object
#           (class jst_tables), printed numbered; written again; spliced
#           into a list; each table on the page it needs, a landscape
#           section of its own between portrait ones; landscape = in the
#           writing call sets every page; a table's own landscape travels;
#           tables of one orientation share a section; the writing call's
#           landscape checked, any other setting refused. (AN) jstyle()
#           with settings: the short file pinned whole; read back and used;
#           based on a path; a general setting in a section's list; the
#           stops (a section's setting given bare, the call rewritten;
#           settings without save.as =; a section not a list of named
#           settings; a name no section holds; twice; a near-miss argument;
#           a value a setting does not take), none writing; the rewritten
#           call run; a complete copy's "# takes:" notes. (AO) jtable() and
#           jstyle() exported, print() for tables written together; the
#           ?jstyle_settings page (ASCII, every setting); the orientation's
#           tables bullet (version 3.9); jsave() and jload() given a result
#           or a built table. RE-PINNED (ruling R57: jtable() prints a
#           report, the table only through print()): J12 (ruling R56's stop,
#           without "yet", with its lines; .tn gives the names), K01, K03,
#           K04, K06, L01, L14, P08 and X01 (the report, or the table
#           through print()), L17 (the tables written together returned as
#           one object), O03 (the copy's head and its "# takes:" notes), P07,
#           V11, AB05, AC05 and AE04 (ruling R56's stops in place of the
#           build-4 ones), AH01 and AH06 (the ANOVA table on a landscape
#           section of its own, the checksum). MUTATION MAP (S406; 49
#           one-change mutants of tables.R, utils.R and io.R, each red; by
#           the first check that reds): "yet" back J12; each result a table
#           of its own J08 (the battery halts in Y's setup, 18 red before
#           it); the tables in key order P07; a named list's names dropped
#           AK02; a group by place without c() AK03; the expression's line
#           dropped AK03; style = left off AK04; a section's setting on every
#           line AK04; landscape = left off the writing line AK04; the call's
#           file = lost AK04; the no-taker stop gone AK05; "it" and "them"
#           swapped AK05; "grouping variables" as "groups" AC05; the dry
#           build skipped AK08; the caller's frame unread AK09; the last
#           fallback names AK09; the count's noun singular K03; "No file was
#           written." dropped K03; print(t1) dropped from the note AL01;
#           "replaced" on every write AL02; "N tables" as "Tables" L17; the
#           orientation reversed K03; the size named at the style's own
#           AL04; the labels clause reversed AL04; models held to the
#           duplicate rule AL05; correlation tables hinted AL05; the hint at
#           every level AL05; the tables returned as a plain list L17; every
#           preview numbered 1 AM01; a document in a list not spliced AM02;
#           no section break between orientations AH01; a break between
#           every table L16; the writing call's landscape ignored AK07; the
#           document's style read for every table's page AM04; landscape
#           unchecked with built tables AM05; a general setting dropped from
#           the short file AN01; based.on by name when given by path AN03; a
#           color written as hex AN01; "for example" and ":" swapped AN04;
#           the last section taking a value AN04; settings without save.as =
#           accepted AN05; a setting twice accepted AN05; the takes notes at
#           80 columns O03; the general section off the help page AO02;
#           orientation 3.8 AO03; the skill description without jtable and
#           jstyle AO03; jsave()'s branch gone AO04; jload()'s branch gone
#           AO04; a table's Word line dropped AO04.
#           LAST VERIFIED: v0.9.274, 2026-11-04 (S406) -- 254/254 on the
#           WORKSTATION through receive_all() ("ALL BATTERIES GREEN (12 run,
#           3605 checks)"; R CMD check 0 errors, 0 warnings, 0 notes),
#           matching the sandbox plain, under the RStudio-handler stand-in,
#           each again with a Windows-length temp path (which found three
#           checks that wanted "written to" and the path on one line), once
#           with interactive() TRUE (no question asked), and entered dirty
#           plain and under the handlers, t1, tab1 and results among the
#           dirt (nothing added, removed or changed); and a one-go
#           receive_all() in the sandbox with the dev tools as the
#           workstation has them (the S400 rule: the build registers
#           print.jst_tables).
# S405 EDIT (v0.9.273, 2026-11-03): Capability Slate T, build 4. SECTIONS
#           AA-AJ ADDED, 44 checks (223 in all). (AA) the general changes:
#           the five new sections in the apa list and the spec, filter.note
#           (28 general settings), nine result classes read into nine
#           sections; the heads (V italic; chi2, eta2 and alpha upright; a
#           head with the light markup set by it); a filter in words -- the
#           variable's label, the mathematical signs, a constant on the left
#           read the other way round, a code by its value label, and and or
#           with parentheses where they mix, the minus sign -- and as typed
#           where it cannot be put into words; the filter sentence in every
#           table type, a stored jsubset() and subset = joined by and;
#           filter.note = no; results filtered differently; a cell set
#           centered and a number's parts. (AB) the correlation table: the
#           matrix computed here from the variables' cases (each r once
#           below the diagonal with its stars, an em dash on the diagonal),
#           each variable's n, M and SD, the pairwise ns, one N, a Spearman
#           table's sentence, the options, the stops. (AC) the t-test table:
#           the columns and spanners, the cells computed here (each group's
#           M and SD, Student's t, p, Cohen's d on the pooled SD), the
#           groups' ns, a df column where the df differ (Welch's at two
#           decimals), each group's n, the mean difference and its CI, the
#           Welch and paired sentences, n.position = title, group.spanner =
#           no, the stops (two grouping variables, two kinds, an outcome
#           twice, headings =, another table type's setting, a column the
#           table lacks). (AD) the ANOVA table: F, p and eta2 computed here
#           from base R's aov(), the df column as text, the groups' ns
#           varying (a group's one n where it does not), F's df in the head
#           when shared, a Welch analysis. (AE) the crosstab: each
#           variable's label row carrying chi2, df, p and V computed here by
#           chisq.test() without Yates's correction, the categories' n and
#           column percentages, the Total, N by variable, percent.base row
#           and total, total = no, test.columns = none, stars on chi2, a
#           result made with chisq = TRUE, the stops, V on a 4 x 5 table.
#           (AF) the reliability table: the items by their labels, M, SD,
#           item-total r and alpha if item deleted computed here on the
#           filtered complete cases, the note (N, the filter, alpha, the
#           definition), two scales under their names with their alphas, N
#           by scale, markers =, alpha = no and item.total.note = no, an
#           item in two results. (AG) the five previews pinned whole (the
#           S404 sketch's tables). (AH) the Word file of the five tables:
#           numbered on the SEQ field, landscape for the four-group ANOVA
#           table, the other four portrait at 12 points; ruling R55's order
#           on the item table (half padding, then two-line labels, at 12
#           points) and its landscape test; heads with markup in the file;
#           the em dash and the df centered with no tab; the font steps and
#           the last resort; the checksum; the stub's two-line floor; every
#           column of numbers holding its block, the decimal stop with room
#           for the widest whole part on its left and the widest tail on its
#           right (AH08, the rebuild's check). (AI)
#           no stop names jtable() twice (the (S403) item), each of the
#           seven reworded stops reached. (AJ) jstyle()'s printout and a
#           saved copy with the five sections; a style file's [ttest] and
#           [crosstab] sections in use, filter.note = no in its general
#           part. RE-PINNED: J12 (every class has a table, so the default
#           method's stop is reached directly; its new words), J13, J14,
#           L17, P07 and V11 (the (S403) rewording: jtable() named once),
#           N07 and N09 (the sections list; [metaanalysis] for the unknown
#           section, since [anova] is a section now), O03 (a setting's name
#           may hold a digit: eta2.label), P06 (the frequency table's note
#           names its filter), U01 (the nine table types), Y04 (ruling R55:
#           Table 3 fits at 10 points, its stub narrowed below its width
#           there and not below its floor; 9 before) and Y05 (the
#           checksum); at the rebuild AH06 (the correlation table's first
#           column wider). MUTATION MAP (S405; 62 one-change mutants of
#           tables.R and utils.R, each red; by the first check that reds):
#           a number column held to its widest cell AH06 (and AH08); the
#           decimal stop let left of the whole part AH08; an em dash
#           off the diagonal AB02; the upper triangle filled AB02; r with
#           its zero AB02; r without stars AB02; one N whatever the pairs
#           AB03; the Spearman sentence's words AB04; columns = none ignored
#           AB04; M from the SD AB03; two jcorr() results allowed AB05; df
#           never in the head AC01; the t head without its markup AC01; the
#           grouping variable's spanner off AC01; the variable's name in
#           the title AC01; Welch's df whole AC03; N for n in the groups'
#           sentence AC02; d without its sign AC02; the paired dz as d
#           AC04; n for N in the title AC04; two grouping variables allowed
#           AC05; "with missing data" whatever the filters AA06; the Welch
#           sentence for Student's tests AA06; the ANOVA's df a number
#           column AD01; eta2 with its zero AD01; one n written as a range
#           AD03 (SURVIVED the first round; AD03 written for it); row
#           percentages for column AE02; Yates's correction AE01; V with its
#           zero AE01; the test off the label row AE01; V without the
#           smaller dimension AE05; the Total's percentage of all cases
#           under row percentages AE03; two column variables allowed AE04;
#           different categories allowed AE04; an item by its name AF01;
#           item-total r with its zero AF01; a scale's alpha dropped AF03;
#           "Set" for "Scale" AF03; Cronbach's sentence beside several
#           scales AF03; item.total.note ignored AF03; >= written as typed
#           AA03; a constant on the left not read the other way round AA03;
#           a code for its value label AA03; no parentheses where and and or
#           mix AA03; & for and AA05; filter.note ignored AA06; the
#           per-filter sentence without "for" P06; a condition not put into
#           words written empty AA04; a plain cell not centered AH04, or on
#           a tab AH04; a cell with no digit taken as a number AA07; the
#           stub's floor at half its width alone AH07 (SURVIVED the first
#           round; AH07 written for it); the font stepped before a label
#           wraps Y04; the pad not halved at the font steps Y04; landscape
#           by the natural width AH01; the font steps ending at 9 points
#           AH05; a head's markup ignored in the file AH04; the preview's
#           heads with their markup AG02; the wrapper's name = value pair
#           ASCII-only AG05; the reliability class unread AA01; V upright
#           AA02; the S403 wording back J12.
#           FIRST DELIVERY of v0.9.273: 222/222 on the WORKSTATION through
#           receive_all() ("ALL BATTERIES GREEN (12 run, 3573 checks)"; R CMD
#           check 0 errors, 0 warnings, 0 notes); on the walk Jeff found the
#           correlation table's decimal tab off in Word ("I assume due to the
#           3 asterisks"): its first column was as wide as its widest cell,
#           .62***, leaving no room for the minus of -.07 left of the stop,
#           and Word pushed -.07 off the point (the journal Table 3's Model 4
#           b column the same: -3.40 beside -.001). REBUILT under the same
#           version (S400's precedent): a column of numbers holds its block,
#           the stop is never left of the whole part; AH08 added (red on the
#           first delivery's code), AH06 re-pinned.
#           LAST VERIFIED: v0.9.273, 2026-11-04 (S405), the rebuild --
#           223/223 on the WORKSTATION through receive_all() ("ALL BATTERIES
#           GREEN (12 run, 3574 checks)"; R CMD check 0 errors, 0 warnings,
#           0 notes), matching the sandbox plain, under the RStudio-handler
#           stand-in, each again with a Windows-length temp path, once with
#           interactive() TRUE (no question asked), and entered dirty plain
#           and under the handlers (nothing added, removed or changed).
# S403 EDIT (v0.9.272, 2026-11-03): Capability Slate T, build 3. SECTIONS U-Y
#           ADDED, 38 checks (179 in all). (U) the general changes: the
#           [regression] and [logistic] sections in the apa list and the
#           spec with n.position (ruling R51) where note.n stood; the
#           italic heads (beta, eta2, alpha and Wald upright); leading.zero
#           yes | no | never and its reach into a descriptives table's
#           cells; the near-zero coefficient kept visible (.0002); "none"
#           for fit.rows and columns.last from a file and from a call;
#           n.position in each table type. (V) the regression table: what
#           a jlm() result carries for it (each dummy group's codes, value
#           labels and variable label; a factor's levels as codes), four
#           models side by side -- the columns, spanners and italic heads,
#           the row order and the dummy-coded variable's rows, every cell
#           computed here from base R's fit on the model frame; the Gelman
#           column and every fit row (adjusted R2, F with its df, delta R2,
#           its F test computed here for Model 2 and Model 4, N); one model
#           (no spanner; the CI in two columns or bracketed; intercept,
#           fit.rows and reference = none); named lists and markers =;
#           p.format = stars on b or on p; a two-category registered
#           variable as one row, a factor's levels, an interaction and a
#           power; models with different Ns built with the N row, the note
#           and the console's jcomplete() line (equal Ns grouped; mydata
#           for an expression); the stops; landscape in the call; a file's
#           [regression] section; the span field on a fit row; non-nested
#           models losing delta R2 and its F test with one note. (W) the
#           logistic table: b, SE, OR, p and the chi-square and Nagelkerke
#           rows from base R's glm; every optional column and fit row;
#           the front door's routing to the logistic section. (X) the
#           preview pinned whole (the S402 sketch), one model with LL and
#           UL, every fit row with F's df running on past b. (Y) the Word
#           file: its rows, spanner cells and heads; landscape under auto
#           and in the call; the fit to the page (the pad, then the font
#           to 9 points, every number column as wide as its widest cell;
#           a table one twip too wide losing half its pad); the checksum;
#           n.position = title in the file; the spanning fit cells on the
#           b column's decimal tab, the grid and the tabs unchanged by an
#           F row; jstyle()'s printout and saved copy with the two
#           sections. RE-PINNED: J12 (the stop on a jcorr() result names
#           the four kinds), L16, M01 and Q01 (the panel's style row reads
#           "Publication style", ruling R50), N07 and N09 (the general
#           settings list with n.position; the [anova] section's unknown
#           keys), P11 (document.xml: a variable's label row no longer
#           sets the stub's width, so it is a little narrower), Q03 and
#           Q05 (the Publication style line). MUTATION MAP (S403; 52
#           one-change mutants of tables.R, models.R and options.R, each
#           red but one; by the first check that reds): the intercept kept
#           as a term V02; a term listed once per model V02; a category
#           repeated across models V02; the variable's own name for its
#           label V02; categories named by code V02; stars on b with a p
#           column V07; the Gelman column blank V04; OR without its zero
#           W01; the CI of b in the odds-ratio table W02; the reference
#           after the label under reference = note V04; no reference
#           sentence in the note V04; a two-category variable as a heading
#           V08; no N row when the Ns differ V09; every list taken as
#           nested V15 (SURVIVED the first round; V15 written for it);
#           delta R2 as R2 V04; the F change's denominator V04 and X03
#           (first caught by X03 alone: V04's Model 4 value is near zero,
#           so V04 now checks Model 2's); the F label unmarked V04; R2 with
#           its zero V03; the N-differs wording V09; no Gelman sentence
#           V04; a named frame printed as mydata V09; no span field V14;
#           the preview's spanning branch skipped X01; a spanning tail
#           widening the column X03; the Word widths counting the tail
#           Y08; no gridSpan on a fit cell Y05; the decimal tab pushed by
#           the tail Y08; two font steps only Y05; the pad step skipped
#           Y04 (SURVIVED the first round; Y04 extended for it); landscape
#           refused in the call V11; landscape outside the call layer V11;
#           leading.zero = no keeping the zero on a bounded statistic U03;
#           the near-zero coefficient rounded away U04; n.position = title
#           as note U06; b upright U02; a logistic result routed to the
#           regression section W03 (SURVIVED the first round; W03 written
#           for it); the builder's messages not printed V09; "none" not a
#           bare word N01; "none" refused in a columns setting U05; the
#           stop's text without "none" V11; the panel's old Style label
#           M01; value labels dropped from a dummy group V00; a dummy
#           group's label its name V00; "Model 2 and Model 3" V10; no
#           console note on differing Ns V09; the Gelman sentence without
#           its year V04; models of two outcomes allowed V11; the first
#           column key overwritten V03; a named list's names ignored V06;
#           columns.last dropped V04; headings = allowed on a model V11.
#           EQUIVALENT (kept, no check): the Constant's beta cell guard --
#           the accessor already carries NA for the intercept's beta, so
#           the guard blanks nothing the format would not.
#           LAST VERIFIED: v0.9.272, 2026-11-03 (S403) -- 179/179 on the
#           WORKSTATION through receive_all() ("ALL BATTERIES GREEN (12 run,
#           3530 checks)"; R CMD check 0 errors, 0 warnings, 0 notes),
#           matching the sandbox plain, under the RStudio-handler stand-in,
#           each again with a Windows-length temp path, once with
#           interactive() TRUE (no question asked), and entered dirty plain
#           and under the handlers (nothing added, removed or changed).
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

check("J03 no headings, no markers: no heading rows, no marks, the type's template title with N after it (ruling R59, S409), no general note",
      !any(vapply(.j1$rows, function(r) identical(r$kind, "heading"), logical(1))) &&
        all(lengths(lapply(.j1$rows, `[[`, "marks")) == 0L) &&
        identical(.j1$caption$title, "Descriptive Statistics (*N* = 103)") &&
        is.na(.j1$caption$number) &&
        identical(.j1$notes$general, character(0)) &&
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
        identical(.j2$caption$title, "Descriptive Statistics for Study Variables (*N* = 103)") &&
        identical(.j2$notes$general, "Wellbeing is scored from 0 to 100."))

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
        identical(.j8$notes$general, character(0)) &&
        identical(.j8$caption$title, "Descriptive Statistics (*N* = 103)") &&
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

# S405: every result class has its table, so the default method's stop is
# reached only by an object of some other class (called here directly).
# S406: the names of the tables a split stop offers lines for -- t1, t2,
# ... unless the workspace already holds one (a dirty entry), then tab1, ...
.tn <- .jst_table_line_names(5L, globalenv())
.j12 <- res(.jst_table_build.default(structure(list(), class = "jst_other"), .jst_style_apa))
.j12b <- res(jtable(tcm, print = FALSE))
.j12c <- res(jtable(list(.j0, .a1), print = FALSE))
.j12d <- res(jtable(list(), print = FALSE))
check("J12 an object of no result class stops at the builders' default, naming every function a table is made from (S405: every class has its table; the S403 wording, the name once); a data frame is not a result; results of two kinds in one list stop -- since S406 (ruling R56) without \"yet\", with the lines that make each table and write them to one file, the call's print = kept; an empty list stops",
      is.null(.j12$val) &&
        grepl("jtable(): no table is made from this kind of result yet.\nTables are made from jdesc(), jfreq(), jcorr(), jt(), jaov(), jcrosstab(),\njalpha(), jlm(), and jlogistic() results.", .j12$txt, fixed = TRUE) &&
        is.null(.j12b$val) &&
        grepl("jtable(): a table is made from a saved result -- what an analysis", .j12b$txt, fixed = TRUE) &&
        grepl("  d1 <- jdesc(community, Age, Income)", .j12b$txt, fixed = TRUE) &&
        is.null(.j12c$val) &&
        grepl(paste0("jtable(): results of different kinds (jdesc() and jfreq()) cannot\nshare a table.\n", "Make each table in a call of its own, then give the tables together to write\nthem to one file:\n",
                     "  ", .tn[1], " <- jtable(.j0)\n  ", .tn[2], " <- jtable(.a1)\n",
                     "  jtable(list(", .tn[1], ", ", .tn[2], "), file = \"Tables.docx\", print = FALSE)"),
              .j12c$txt, fixed = TRUE) &&
        is.null(.j12d$val) && grepl("the list given to jtable() is empty.", .j12d$txt, fixed = TRUE))

.j13 <- res(jtable(.d1, print = FALSE))
.j13o <- local({ old <- .j0; old$descriptives_raw <- NULL; attr(old, "jstats_version") <- "0.9.200"
                 res(jtable(old, print = FALSE)) })
.j13n <- local({ old <- .j0; old$descriptives_raw <- NULL; attr(old, "jstats_version") <- NULL
                 res(jtable(old, print = FALSE)) })
check("J13 a grouped jdesc(by =) result stops in this build; a result without the fields names the version that made it, or 'an earlier version' with no stamp",
      is.null(.j13$val) &&
        grepl("jtable(): no table is made from a grouped jdesc() result\n(one made with by =) yet.", .j13$txt, fixed = TRUE) &&
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
        grepl("jtable(): the file name needs the .docx extension (a Word file),\nfor example:", .j14f$txt, fixed = TRUE) &&
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

# S406 (ruling R57): jtable() reports what it made, and print() on the
# table shows the replica -- .k1 is the replica, .k1r the report.
.k1r <- res(jtable(.j0,
                   headings = list("Dependent variable"    = WellbeingScore,
                                   "Independent variables" = c(Income, Age),
                                   "Control variable"      = CommuteTime),
                   markers  = list("Mean-centered" = c(Income, Age)),
                   title    = "Descriptive Statistics for Study Variables",
                   note     = "Wellbeing is scored from 0 to 100."))
.k1 <- res(print(.k1r$val))
.k1l <- strsplit(.k1$txt, "\n", fixed = TRUE)[[1]]
check("K01 the preview -- print() on the table, since jtable() reports (ruling R57, S406) -- pinned whole: the two caption lines, the rules, the header, the headings and the indented rows, the notes, one blank line at the end",
      endsWith(.k1$txt, "Mean-centered.\n") && identical(.k1l, c(
        "Table 1",
        "Descriptive Statistics for Study Variables (N = 103)",
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
        "Note. Wellbeing is scored from 0 to 100.",
        "^a Mean-centered.")))

.k2 <- vapply(c(7, 9, 10, 12), function(i) regexpr(".", .k1l[i], fixed = TRUE), integer(1))
check("K02 the numbers align on the decimal point: the M column's points sit in one console column down the table, and the column heads are centered over their columns",
      length(unique(.k2)) == 1L &&
        identical(regexpr("M", .k1l[4], fixed = TRUE)[1] > regexpr("n", .k1l[4], fixed = TRUE)[1], TRUE) &&
        identical(nchar(.k1l[3]), nchar(.k1l[5])) && identical(nchar(.k1l[3]), nchar(.k1l[13])))

.k3 <- res(print(.j2))
check("K03 jtable() prints its report, not the table (ruling R57, S406): the number and title, what the table holds and its page, that no file was written; print() on a table built the same way shows the same replica",
      identical(.k1r$txt, paste0("Table 1. Descriptive Statistics for Study Variables (N = 103)\n",
                                 "  4 variables under 3 headings, on a portrait page.\n",
                                 "No file was written.\n")) &&
        identical(.k3$txt, .k1$txt))

.k4a <- res(jtable(.j0, print = FALSE))
invisible(utils::capture.output(suppressMessages(joutput("silent"))))
.k4b <- res(jtable(.j0))
.k4c <- res(jtable(.j0, print = TRUE))
invisible(utils::capture.output(suppressMessages(joutput(NULL))))
options(.jst_options_message_width = .pin_width)
check("K04 print = FALSE prints nothing; under joutput(\"silent\") the default prints nothing and print = TRUE prints the report (S406, ruling R57); the table is returned either way",
      identical(.k4a$txt, "") && inherits(.k4a$val, "jst_table") &&
        identical(.k4b$txt, "") && inherits(.k4b$val, "jst_table") &&
        identical(.k4c$txt, paste0("Table 1. Descriptive Statistics (N = 103)\n",
                                   "  4 variables, on a portrait page.\n",
                                   "No file was written.\n")))

.k5 <- res(jtable(.j0, note = "Centered at the *mean*."))$val
.k5l <- .jst_table_note_lines(.k5, .jst_style_apa, plain = TRUE)
check("K05 the note markup: *italic* and ^superscript^ are kept for the Word writer and stripped for the preview, a letter mark written ^a",
      identical(.jst_table_note_lines(.k5, .jst_style_apa),
                c("*Note.* Centered at the *mean*.")) &&
        identical(.k5l, "Note. Centered at the mean.") &&
        identical(.jst_table_note_lines(.j2, .jst_style_apa),
                  c("*Note.* Wellbeing is scored from 0 to 100.",
                    "^a^ Mean-centered.")) &&
        identical(.jst_table_note_lines(.j2, .jst_style_apa, plain = TRUE)[2], "^a Mean-centered."))

# A column narrower than its head: the one-digit values sit right-aligned
# under the centered head, the head's spare space on the left.
.k6 <- local({
  w <- data.frame(x = 1:9); attr(w$x, "label") <- "x"
  res(print(jtable(res(jdesc(w, x))$val, print = FALSE)))
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
check("L01 file = writes a .docx: a zip of the five parts, the content types first; the written line follows the report (S406, ruling R57)",
      file.exists(.lf) &&
        identical(.lz$Name, c("[Content_Types].xml", "_rels/.rels",
                              "word/_rels/document.xml.rels", "word/document.xml",
                              "word/styles.xml")) &&
        startsWith(.l1$txt, paste0("Table 1. Descriptive Statistics for Study Variables (N = 103)\n",
                                   "  4 variables under 3 headings, on a portrait page.\n",
                                   "Table written to")) &&
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

check("L03 the caption is the table's FIRST ROW (apa's default since the S400 walk): one cell spanning the table with no borders, two paragraphs in it -- the first on Word's SEQ Table field with the cached number 1 in bold, the second the title in italics with (N = 103) after it, N upright (ruling R59, S409), kept with the next -- and no caption paragraph outside the table",
      grepl("<w:pStyle w:val=\"Caption\"/><w:keepNext/>", .ldoc, fixed = TRUE) &&
        grepl("<w:instrText xml:space=\"preserve\"> SEQ Table \\* ARABIC </w:instrText>", .ldoc, fixed = TRUE) &&
        grepl("<w:fldChar w:fldCharType=\"separate\"/></w:r><w:r><w:rPr><w:b/><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\">1</w:t></w:r>", .ldoc, fixed = TRUE) &&
        grepl("<w:rPr><w:i/><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\">Descriptive Statistics for Study Variables (</w:t></w:r><w:r><w:rPr><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\">N</w:t></w:r><w:r><w:rPr><w:i/><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\"> = 103)</w:t></w:r></w:p>", .ldoc, fixed = TRUE) &&
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

check("L08 the notes are the table's LAST ROW, under the bottom rule: the italic Note. and the user's sentence (N after the title since ruling R59, S409), then the specific note with its superscript a; no note paragraph outside the table",
      grepl("<w:r><w:rPr><w:i/><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\">Note.</w:t></w:r><w:r><w:rPr><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\"> Wellbeing is scored from 0 to 100.</w:t></w:r>", .ldoc, fixed = TRUE) &&
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
# S407 rebuild (v0.9.275): re-pinned -- the stub's indented rows measured
# with their 180-twip indent, not two spaces, so the stub widens 53 twips;
# nothing else in the part moved (diffed against the S407 delivery).
# S410 (v0.9.277): re-pinned -- N after the title (ruling R59), the note
# opening on the call's sentence; diffed against the S409 build's part,
# nothing else moved (no width, no other run). The same holds for P11, Y05
# and AH06, where a table left with no note loses its note row and its
# last row the keep-with-next it had for the note.
check("L10 document.xml and styles.xml pinned by their checksums",
      identical(unname(tools::md5sum(file.path(.lx, "word", "document.xml"))), "52f55f4cc6657612da7e9756c7abb60a") &&
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
        grepl("<w:t xml:space=\"preserve\">.</w:t></w:r><w:r><w:rPr><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\"> Descriptive Statistics (</w:t></w:r><w:r><w:rPr><w:i/><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\">N</w:t></w:r><w:r><w:rPr><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\"> = 103)</w:t></w:r></w:p>", .lrd, fixed = TRUE) &&
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
        !grepl("\u2212", res(print(.lnt$val))$txt, fixed = TRUE) &&
        grepl("Change    4  -2.88  1.56  -4.75  -1.25", res(print(.lnt$val))$txt, fixed = TRUE))

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
# S403: TWO empty paragraphs between tables (Jeff, on the S401 walk: "an
# additional empty line in between all tables"); one until then.
check("L16 two tables in one file: two SEQ fields cached 1 and 2, two tables each holding its caption and notes, two empty paragraphs between them so Word keeps them apart with a line between",
      .ltag(.l2d, "w:tbl")[["open"]] == 2L &&
        lengths(regmatches(.l2d, gregexpr("SEQ Table", .l2d))) == 2L &&
        grepl("<w:t xml:space=\"preserve\">2</w:t>", .l2d, fixed = TRUE) &&
        lengths(regmatches(.l2d, gregexpr("</w:tbl><w:p><w:pPr><w:spacing [^>]*/></w:pPr></w:p><w:p><w:pPr><w:spacing [^>]*/></w:pPr></w:p><w:tbl>", .l2d))) == 1L &&
        !grepl("</w:tbl><w:p><w:pPr><w:spacing [^>]*/></w:pPr></w:p><w:tbl>", .l2d) &&
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
check("L17 a built table given to jtable() is reported and written as it is, the same file; a list of two is reported as Tables 1 and 2, written to one file and returned together as one object (S406); a table beside a result, or with a title, stops",
      identical(sub("Table written to.*$", "", .lb$txt),
                sub("Table written to.*$", "", .l1$txt)) && inherits(.lb$val, "jst_table") &&
        identical(unname(tools::md5sum(file.path(.lbx, "word", "document.xml"))),
                  unname(tools::md5sum(file.path(.lx, "word", "document.xml")))) &&
        grepl("^Table 1. Descriptive Statistics for Study Variables \\(N = 103\\)\n", .lb2$txt) &&
        grepl("\nTable 2. Descriptive Statistics \\(N = 103\\)\n", .lb2$txt) &&
        grepl("\n2 tables written to", .lb2$txt) && length(.lb2$val) == 2L &&
        inherits(.lb2$val, "jst_tables") &&
        .ltag(.lb2d, "w:tbl")[["open"]] == 2L &&
        is.null(.lb3$val) &&
        grepl("jtable(): built tables and saved results cannot be given\nin one call.\nBuild each result into a table first, then give the tables together.", .lb3$txt, fixed = TRUE) &&
        is.null(.lb4$val) &&
        grepl("belong to the", .lb4$txt, fixed = TRUE) && grepl("keeps its own.", .lb4$txt, fixed = TRUE))

# =============================================================================
# M. output.dir: the setting, and where jtable() writes
# =============================================================================
cat("\n--- M. output.dir ---\n")

.entry_od <- getOption(".jst_options_output_dir")
options(.jst_options_output_dir = NULL)
.m0 <- .strip_ansi(suppressMessages(utils::capture.output(joptions())))
check("M01 the full panel has nine rows (two since S401): Output folder after Data folder, 'Working directory' when unset; the style row reads Publication style (ruling R50, S403)",
      identical(.m0[1:10], c("Options Settings",
                             "Missing-value convention: None selected",
                             "SPSS-style missing value codes: -99, -98, -97",
                             "Data folder: Working directory",
                             "Output folder: Working directory",
                             "Publication style: apa",
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
       apa   = .jst_style_key(res(.jst_style_resolve("APA"))$val, "general", "font"),
       files = names(.jst_style_files()))
})
.n3u <- .jst_style_key(.jst_style_resolve("useronly"), "general", "font")
check("N03 a name is looked for in the style folder, then the working directory, then the per-user folder, the first holding it winning and its case aside; a name given with .jstyle is the name; a path is read as given, .jstyle added; \"apa\" is always the built-in, an apa.jstyle passed over",
      identical(.n3$dupe, "A") && identical(.n3$DUPE, "A") && identical(.n3$ext, "A") &&
        identical(.n3$wd, "W") && identical(.n3$wduse, "W2") && identical(.n3u, "U") &&
        identical(.n3$path, "B") && identical(.n3$pathx, "B") &&
        identical(.n3$apa, "Times New Roman") &&
        !"apa" %in% .n3$files && sum(tolower(.n3$files) == "dupe") == 1L)
# The shadow file goes now (S407): since v0.9.275 a call that takes the
# built-in apa while an apa.jstyle sits in a folder searched says the file
# is passed over (section AP), which every later default-style call here
# would print.
unlink(file.path(.ns, "apa.jstyle"))

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
.wsty("secunk", "[metaanalysis]", "columns = f")   # S403: [regression] is a section now; S405: [anova] too
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
        grepl("The sections are [descriptives], [frequencies], [regression], [logistic],\n[correlation], [ttest], [anova], [crosstab], and [reliability].", .n7[[5]]$txt, fixed = TRUE))

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
      "[frequencies]", "colwidth = 5", "[metaanalysis]", "columns = f")   # S403: [anova] for [regression]; S405: [metaanalysis] for [anova]
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
        grepl("caption.color, [frequencies] colwidth, [metaanalysis].", gsub("\n", " ", .n9n[[1]]$text), fixed = TRUE) &&
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
check("O03 jstyle(\"apa\", save.as = ) writes <name>.jstyle into the style folder: its header (since S406 saying to change values only, for a person or an AI assistant; since the S407 rebuild the file's name on a line of its own, then one sentence a line; since S409 the editing rule worded as the short file's and a block for an AI assistant asked to match an example), the format and written.by stamps and based.on = apa, then every setting of every part after a note on what it does and one on what it takes (S406); read back, every setting is apa's; the written line names the file",
      file.exists(.o3f) &&
        identical(.o3t[1:11], c("# copyapa.jstyle:", "# A jstats table style.",
                                "# Every setting jstats has is below, each after a note saying what it does and what it takes.",
                                "# Change only the values after the = signs; do not invent a setting, and do not rename a setting or a section.",
                                "# A line that starts with # is a note.",
                                "# jstyle(\"copyapa\") checks the file and names any value it cannot use.",
                                "#",
                                "# To an AI assistant asked to edit this file so tables look like an example:",
                                "# Change only the values after the = signs, using only the values each setting's \"# takes:\" line allows.",
                                "# Keep every other line as it is, and return the whole file.",
                                "# Then say what the example has that these settings cannot make, rather than inventing a setting for it.")) &&
        "format     = 1" %in% .o3t &&
        paste0("written.by = jstats ", .jst_jstats_version()) %in% .o3t &&
        "based.on   = apa" %in% .o3t &&
        all(c("[descriptives]", "[frequencies]") %in% .o3t) &&
        identical(.o3t[match("font = Times New Roman", .o3t) - 2:1],
                  c("# the typeface of every cell, caption and note", "# takes: any text")) &&
        identical(.o3t[match("header.fill = none", .o3t) - 2:1],
                  c("# a color filling the header cells, or none",
                    "# takes: a color name such as lightblue, or six hex digits such as ADD8E6; or none")) &&
        "stars = .05, .01, .001" %in% .o3t && "percent.label = %" %in% .o3t &&
        sum(grepl("^[a-z][a-z0-9.]* = ", .o3t) & !grepl("^(format|written.by|based.on) ", .o3t)) ==
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
        grepl("jstyle(): \"apa\" is the name of a style built into jstats.\nGive the copy another name, for example:\n  jstyle(\"apa\", save.as = \"myapa\")", .o5[[1]]$txt, fixed = TRUE) &&
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
        identical(.p0$notes$general, character(0)) &&
        identical(.p0$caption$title, "Frequency Distributions (*N* = 103)"))

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
check("P06 the N note: variables from one pool of cases open the note on N; results from different pools give no N (since S405 the filter sentence names the result a subset = filtered)",
      identical(.p6$notes$general, "Only cases with Age (years) > 40 are included for Volunteered in past year."))
check("P07 a variable in two results stops (a table lists each once, in both table types); a jfreq() result made before the fields existed names its version; results of two kinds in one list stop, with the lines that make each table (S406, ruling R56)",
      is.null(.p7a$val) &&
        grepl("jtable(): Education is in more than one of the results.\nA table lists each variable once.", .p7a$txt, fixed = TRUE) &&
        grepl("jtable(): Age is in more than one of the results.",
              res(jtable(list(res(jdesc(tcm, Age))$val, res(jdesc(tcm, Age, Income))$val),
                         print = FALSE))$txt, fixed = TRUE) &&
        is.null(.p7b$val) &&
        grepl("jtable(): this jfreq() result was made by an earlier version of\njstats, before the fields a table needs were stored.", .p7b$txt, fixed = TRUE) &&
        is.null(.p7c$val) &&
        grepl(paste0("jtable(): results of different kinds (jfreq() and jdesc()) cannot\nshare a table.\n", "Make each table in a call of its own, then give the tables together to write\nthem to one file:\n",
                     "  ", .tn[1], " <- jtable(.nf1)\n  ", .tn[2], " <- jtable(.j0)\n",
                     "  jtable(list(", .tn[1], ", ", .tn[2], "), file = \"Tables.docx\", print = FALSE)"), .p7c$txt, fixed = TRUE))

.p8 <- res(print(jtable(.nf1, print = FALSE)))
.p8l <- strsplit(.p8$txt, "\n", fixed = TRUE)[[1]]
check("P08 the preview (print() on the table, S406), pinned whole: the caption with N after the title (ruling R59, S409), the rules, each variable's label and its categories indented, the numbers on the decimal point, no note",
      identical(.p8l, c(
        "Table 1", "Frequency Distributions (N = 103)",
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
        "---------------------------------")))

.p9f <- file.path(.pd, "Table2.docx")
.p9 <- res(jtable(.nf1, file = .p9f, overwrite = TRUE, print = FALSE))
.p9x <- file.path(.pd, "x"); invisible(utils::unzip(.p9f, exdir = .p9x))
.p9d <- paste(readLines(file.path(.p9x, "word", "document.xml"), warn = FALSE, encoding = "UTF-8"),
              collapse = "\n")
.p9tabs <- as.integer(regmatches(.p9d, gregexpr("(?<=w:val=\"decimal\" w:pos=\")[0-9]+", .p9d, perl = TRUE))[[1]])
check("P09 the Word file: 18 rows (the caption, the header, three variable rows spanning the table, plain and unindented, thirteen category rows indented 180 twips; no note row, N after the title since ruling R59, S409); the n and % heads; every number on a decimal tab",
      .ltag(.p9d, "w:tr")[["open"]] == 18L &&
        lengths(regmatches(.p9d, gregexpr("<w:gridSpan w:val=\"3\"/>", .p9d))) == 4L &&
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

# S403 (v0.9.272): re-pinned -- the stub column is set by the data rows'
# labels alone (a variable's label row spans the table), so Table 2's
# stub is a little narrower; nothing else in the part moved.
# S407 rebuild (v0.9.275): re-pinned -- the categories' 180-twip indent
# measured as written, not as two spaces: the stub 53 twips wider, every
# cell's width with it; nothing else moved (diffed against the delivery).
# S407 second rebuild: re-pinned -- the variables' label rows set the stub
# (Jeff), "Highest education level" the widest: the stub 46 twips wider;
# nothing else moved (diffed against the first rebuild).
check("P11 document.xml of the frequency table pinned by its checksum",
      identical(unname(tools::md5sum(file.path(.p9x, "word", "document.xml"))), "2e3b38dd47a4e3ce8d1331d66d7d51c4"))

# =============================================================================
# Q. joptions(style = , style.dir = )
# =============================================================================
cat("\n--- Q. joptions(style =, style.dir =) ---\n")

options(.jst_options_style = NULL, .jst_options_style_dir = NULL)
.q0 <- .strip_ansi(suppressMessages(utils::capture.output(joptions())))
check("Q01 the full panel has nine rows: Publication style (ruling R50, S403; 'Style' until then) and Style folder after Output folder, apa and Not set when unset; both settings are session keys",
      identical(.q0[1:10], c("Options Settings",
                             "Missing-value convention: None selected",
                             "SPSS-style missing value codes: -99, -98, -97",
                             "Data folder: Working directory",
                             "Output folder: Working directory",
                             "Publication style: apa",
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
      grepl("Publication style: house", .q3$txt, fixed = TRUE) &&
        identical(.jst_style_key(.q3t$style, "general", "caption.form"), "report") &&
        identical(.q3q[1:2], c("Options Settings", "Publication style: house")) &&
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
        "Publication style: apa" %in% .q5 && "Style folder: Not set" %in% .q5)
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
        startsWith(.r1j$txt, "Table 1. Frequency Distributions (N = 103)\n"))

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

# =============================================================================
# U. Build 3's additions to the style and the formats (S403)
# =============================================================================
cat("\n--- U. The style and the formats, build 3 ---\n")

check("U01 the apa list and the spec have [regression] and [logistic] sections, their columns and labels, and the general n.position (note | title | none, in note.n's place; apa's title since ruling R59, S409) and leading.zero's third value",
      all(c("regression", "logistic") %in% names(.jst_style_apa)) &&
        identical(names(.jst_style_type_nouns), c("descriptives", "frequencies", "regression", "logistic",
                                                  "correlation", "ttest", "anova", "crosstab", "reliability")) &&
        identical(.jst_style_apa$regression$columns, c("b", "se", "beta", "p")) &&
        identical(.jst_style_apa$logistic$columns, c("b", "se", "or", "p")) &&
        identical(.jst_style_spec$regression$columns$cols, c("b", "se", "beta", "p", "t", "ci", "beta.gelman")) &&
        identical(.jst_style_spec$logistic$columns$cols, c("b", "se", "or", "p", "wald", "ci", "beta.gelman")) &&
        identical(.jst_style_apa$regression$columns.last, "none") &&
        identical(.jst_style_apa$regression$fit.rows, "r2") &&
        identical(.jst_style_apa$logistic$fit.rows, c("chisq", "nagelkerke")) &&
        identical(.jst_style_apa$regression$stub.label, "Predictor") &&
        identical(.jst_style_apa$regression$reference, "row") &&
        identical(.jst_style_apa$regression$intercept.label, "Constant") &&
        is.null(.jst_style_apa$general$note.n) && is.null(.jst_style_spec$general$note.n) &&
        identical(.jst_style_apa$general$n.position, "title") &&
        identical(.jst_style_spec$general$n.position$choices, c("note", "title", "none")) &&
        identical(.jst_style_spec$general$leading.zero$choices, c("yes", "no", "never")) &&
        identical(.jst_style_apa$regression$beta.label, "\u03b2") &&
        identical(.jst_style_apa$regression$beta.gelman.label, "\u03b2*"))

check("U02 the italic heads: b, SE, p, t, OR and R2 are symbols; beta, eta2 and alpha (Greek letters, upright under APA) and Wald (a word) are not",
      all(c("b", "se", "p", "t", "or", "r2", "n", "mean", "sd") %in% .jst_tbl_italic_heads) &&
        !any(c("beta", "eta2", "alpha", "wald") %in% .jst_tbl_italic_heads) &&
        identical(.jst_tbl_head_italic("regression", c("b", "se", "beta", "p", "beta.gelman", "ci"),
                                       c("b", "SE", "\u03b2", "p", "\u03b2*", "95% CI")),
                  c(TRUE, TRUE, FALSE, TRUE, FALSE, FALSE)) &&
        identical(.jst_tbl_head_italic("logistic", c("or", "wald"), c("OR", "Wald")), c(TRUE, FALSE)) &&
        identical(.jst_tbl_head_italic("regression", "se", "s.e."), FALSE))

check("U03 the leading zero: yes keeps it on every number, no drops it on a bounded statistic only, never drops it on every number below 1; p keeps its zero under yes",
      identical(c(.jst_tbl_lz("yes", TRUE), .jst_tbl_lz("yes", FALSE)), c(TRUE, TRUE)) &&
        identical(c(.jst_tbl_lz("no", TRUE), .jst_tbl_lz("no", FALSE)), c(FALSE, TRUE)) &&
        identical(c(.jst_tbl_lz("never", TRUE), .jst_tbl_lz("never", FALSE)), c(FALSE, FALSE)) &&
        identical(.jst_tbl_num(c(0.197, -0.5, 1.5), 3L, "comma", FALSE, "hyphen"), c(".197", "-.500", "1.500")) &&
        identical(.jst_tbl_p(c(0.004, 0.0004), leading.zero = TRUE), c("0.004", "<0.001")) &&
        identical(.jst_tbl_p(c(0.004, 0.0004)), c(".004", "<.001")))

check("U04 a coefficient that rounds to zero but is not prints with enough places to show it (.0002, as APA's Table 7.17), capped at six; zero and a value with a digit at the decimals keep the decimals",
      identical(.jst_tbl_coef(c(-0.00129, 0.0002, 0, 0.004, 12.3456, 1e-9), 2L, "comma", TRUE, "hyphen"),
                c("-0.001", "0.0002", "0.00", "0.004", "12.35", "0.000000")) &&
        identical(.jst_tbl_coef(0.0000558, 2L, "comma", FALSE, "hyphen"), ".00006") &&
        identical(.jst_tbl_coef(NA, 2L), ""))

check("U05 a columns setting that allows none: fit.rows and columns.last take \"none\" from a file and from a call, and a wrong value names it; columns does not take none",
      identical(.jst_style_check_value("fit.rows", .jst_style_spec$regression$fit.rows,
                                       list(text = "none", raw = "none", quoted = FALSE), "regression", "jtable", where = "x"), "none") &&
        identical(.jst_style_check_value("columns.last", .jst_style_spec$regression$columns.last, "none", "regression", "jtable"), "none") &&
        identical(.jst_style_check_value("fit.rows", .jst_style_spec$regression$fit.rows, c("R2", "n"), "regression", "jtable"), c("r2", "n")) &&
        grepl("`fit.rows` must be columns of a regression table, each\nnamed once: \"r2\", \"adj.r2\", \"f\", \"delta.r2\", \"f.change\", or \"n\"; or \"none\".",
              res(.jst_style_check_value("fit.rows", .jst_style_spec$regression$fit.rows, "r3", "regression", "jtable"))$txt, fixed = TRUE) &&
        grepl("`columns` must be columns of a regression table, each\nnamed once: \"b\", \"se\", \"beta\", \"p\", \"t\", \"ci\", or \"beta.gelman\".",
              res(.jst_style_check_value("columns", .jst_style_spec$regression$columns, "none", "regression", "jtable"))$txt, fixed = TRUE))

# The N placement helper (ruling R51).
check("U06 n.position: note gives the sentence, title the parenthesis after the title, none nothing; under title ns that vary go in the note as note writes them (ruling R59, S409); a table with no one N gets nothing under any setting",
      identical(.jst_table_n_parts("note", "*N* = 92"), list(note = "*N* = 92.", title = "")) &&
        identical(.jst_table_n_parts("title", "*N* = 92"), list(note = character(0), title = " (*N* = 92)")) &&
        identical(.jst_table_n_parts("title", "*N* differs by model: 1 (a), 2 (b)", varies = TRUE),
                  list(note = "*N* differs by model: 1 (a), 2 (b).", title = "")) &&
        identical(.jst_table_n_parts("note", "*N* differs by model: 1 (a), 2 (b)", varies = TRUE),
                  .jst_table_n_parts("title", "*N* differs by model: 1 (a), 2 (b)", varies = TRUE)) &&
        identical(.jst_table_n_parts("none", "*N* differs by model: 1 (a), 2 (b)", varies = TRUE),
                  list(note = character(0), title = "")) &&
        identical(.jst_table_n_parts("none", "*N* = 92"), list(note = character(0), title = "")) &&
        identical(.jst_table_n_parts("note", NULL), list(note = character(0), title = "")))

# n.position = note set by hand: apa's value is title since ruling R59
# (S410), which .u7t sets as well, so the check holds whatever apa holds.
.u7 <- local({ s <- .jst_style_apa; s$general$n.position <- "note"
               .jst_table_build_desc(list(.j0), s) })
.u7t <- local({ s <- .jst_style_apa; s$general$n.position <- "title"
                .jst_table_build_desc(list(.j0), s) })
.u7n <- local({ s <- .jst_style_apa; s$general$n.position <- "none"
                .jst_table_build_freq(list(.nf1), s) })
.u7p <- res(.jst_table_preview(.u7t, .u7t$style))
check("U07 the descriptives and frequency tables read n.position: note opens the general note on N; title writes (N = 103) after the title, N in italics in the file and plain in the preview; none writes no N",
      identical(.u7$notes$general, "*N* = 103.") &&
        identical(.u7t$caption$title, "Descriptive Statistics (*N* = 103)") &&
        length(.u7t$notes$general) == 0L &&
        grepl("^Table 1\nDescriptive Statistics \\(N = 103\\)\n", .u7p$txt) &&
        length(.u7n$notes$general) == 0L && identical(.u7n$caption$title, "Frequency Distributions"))

.u8 <- local({ s <- .jst_style_apa; s$general$leading.zero <- "never"
               w <- data.frame(x = c(0.25, 0.5, 0.75)); attr(w$x, "label") <- "x"
               .jst_table_build_desc(list(res(jdesc(w, x))$val), s) })
check("U08 leading.zero = never reaches a descriptives table's cells: a mean, an SD, a minimum below 1 lose the zero",
      identical(unlist(.u8$rows[[1]]$cells[c("mean", "sd", "min", "max")]),
                c(mean = ".50", sd = ".25", min = ".25", max = ".75")))

# =============================================================================
# V. The regression table, from jlm() results
# =============================================================================
cat("\n--- V. The regression table ---\n")

# The four nested models of the S402 sketch, on the shipped community
# dataset: Region dummy-coded, Education numeric, jcomplete() over the
# largest model's variables, so N = 92 in every model.
.vd <- file.path(tempdir(), "tables_check_reg"); unlink(.vd, recursive = TRUE); dir.create(.vd)
invisible(res({ jdummy(tcm, Region); jnumeric(tcm, Education)
                jcomplete(tcm, WellbeingScore, Volunteer, Age, Smoker, Region, Education, CommuteTime) }))
.vm1 <- res(jlm(WellbeingScore ~ Age, tcm))$val
.vm2 <- res(jlm(WellbeingScore ~ Age + Smoker + Region, tcm))$val
.vm3 <- res(jlm(WellbeingScore ~ Age + Smoker + Region + Education, tcm))$val
.vm4 <- res(jlm(WellbeingScore ~ Age + Smoker + Region + Education + CommuteTime, tcm))$val
.vg1 <- res(jlogistic(Volunteer ~ Age, tcm))$val
.vg4 <- res(jlogistic(Volunteer ~ Age + Smoker + Region + Education + CommuteTime, tcm))$val
# base R's fit on the same model frame, for the expected cells.
.vfit <- function(m) stats::lm(stats::reformulate(names(m$model_frame)[-1], names(m$model_frame)[1]), data = m$model_frame)
.vco  <- function(m) summary(.vfit(m))$coefficients
.vf2  <- function(x) sub("^(-?)0\\.", "\\1.", sprintf("%.2f", x))
.vrow <- function(t, lab) t$rows[[which(vapply(t$rows, `[[`, "", "label") == lab)[1]]]

check("V00 what a model result carries for the table (build 3): each dummy_groups element's codes, value_labels and var_label; a factor's codes are its levels with no label; data_name on jlm() and jlogistic() results",
      identical(as.numeric(.vm4$dummy_groups$Region$codes), c(1, 2, 3, 4)) &&
        identical(.vm4$dummy_groups$Region$value_labels, c("North", "South", "East", "West")) &&
        identical(.vm4$dummy_groups$Region$var_label, "Region of residence") &&
        identical(.vm4$dummy_groups$Region$dummy, c(NA, "Region_South", "Region_East", "Region_West")) &&
        identical(.vm4$data_name, "tcm") && identical(.vg4$data_name, "tcm") &&
        local({
          wf <- data.frame(y = c(12, 15, 11, 18, 14, 16, 10, 19, 13, 17, 12, 20),
                           g = factor(rep(c("lo", "mid", "hi"), 4), levels = c("lo", "mid", "hi")))
          invisible(res(jdummy(wf, g)))
          m <- res(jlm(y ~ g, wf))$val
          identical(m$dummy_groups$g$codes, c("lo", "mid", "hi")) &&
            all(is.na(m$dummy_groups$g$value_labels)) && identical(m$dummy_groups$g$var_label, "g")
        }))

.v1 <- res(jtable(list(.vm1, .vm2, .vm3, .vm4), print = FALSE))$val
.v1k <- vapply(.v1$rows, `[[`, "", "label")
check("V01 four jlm() results side by side: the stub Predictor (ruling R49) then b, SE, beta, p per model, the symbols italic and beta upright; a spanner row Model 1 to Model 4 over each model's four columns; the title names the outcome's label (ruling R49, {outcome})",
      inherits(.v1, "jst_table") && identical(.v1$type, "regression") &&
        identical(.v1$columns$key, c("stub", paste0("m", rep(1:4, each = 4), ".", c("b", "se", "beta", "p")))) &&
        identical(.v1$columns$label, c("Predictor", rep(c("b", "SE", "\u03b2", "p"), 4))) &&
        identical(.v1$columns$italic, c(FALSE, rep(c(TRUE, TRUE, FALSE, TRUE), 4))) &&
        length(.v1$spanners) == 1L && length(.v1$spanners[[1]]) == 4L &&
        identical(vapply(.v1$spanners[[1]], `[[`, "", "label"), paste("Model", 1:4)) &&
        identical(.v1$spanners[[1]][[2]]$from, 6L) && identical(.v1$spanners[[1]][[2]]$to, 9L) &&
        identical(.v1$caption$title, "Regression Coefficients Predicting Wellbeing score (0-100) (*N* = 92)"))

check("V02 the rows: the Constant first, then the predictors in first-appearance order over the models; a dummy-coded variable's label row (plain, the variable level) with its reference category after it and its categories indented under it by their value labels; an unregistered 0/1 variable and a registered numeric one on their own labels; R2 last",
      identical(.v1k, c("Constant", "Age (years)", "Current smoker", "Region of residence",
                        "South", "East", "West", "Highest education level",
                        "Daily commute time (minutes)", "*R*\u00b2")) &&
        identical(.vrow(.v1, "Region of residence")$kind, "heading") &&
        identical(.vrow(.v1, "Region of residence")$level, "variable") &&
        identical(.vrow(.v1, "Region of residence")$tail, " (reference = North)") &&
        identical(vapply(.v1$rows, `[[`, integer(1), "indent"), c(0L, 0L, 0L, 0L, 1L, 1L, 1L, 0L, 0L, 0L)) &&
        isTRUE(.vrow(.v1, "*R*\u00b2")$markup) && !isTRUE(.vrow(.v1, "Constant")$markup))

.vc4 <- .vco(.vm4); .vc1 <- .vco(.vm1)
check("V03 the cells, computed here from base R's fit on the model frame: b and SE at two decimals with the zero, beta without it, p at three with the <.001 floor; a model's missing term is a blank cell; the Constant's beta is blank; a near-zero b keeps its first digit (-0.001)",
      identical(.vrow(.v1, "Age (years)")$cells$m4.b, sprintf("%.2f", .vc4["Age", "Estimate"])) &&
        identical(.vrow(.v1, "Age (years)")$cells$m4.se, sprintf("%.2f", .vc4["Age", "Std. Error"])) &&
        identical(.vrow(.v1, "Age (years)")$cells$m1.b, sprintf("%.2f", .vc1["Age", "Estimate"])) &&
        identical(.vrow(.v1, "Age (years)")$cells$m4.p, "<.001") &&
        identical(.vrow(.v1, "South")$cells$m4.b, sub("^-", "\u2212", sprintf("%.2f", .vc4["Region_South", "Estimate"]))) &&
        identical(.vrow(.v1, "South")$cells$m4.p, sub("^0", "", sprintf("%.3f", .vc4["Region_South", "Pr(>|t|)"]))) &&
        identical(.vrow(.v1, "Current smoker")$cells$m1.b, "") &&
        identical(.vrow(.v1, "Current smoker")$cells$m1.p, "") &&
        identical(.vrow(.v1, "Constant")$cells$m4.beta, "") &&
        identical(.vrow(.v1, "Constant")$cells$m4.b, sprintf("%.2f", .vc4["(Intercept)", "Estimate"])) &&
        identical(.vrow(.v1, "Daily commute time (minutes)")$cells$m4.b, "\u22120.001") &&
        identical(.vrow(.v1, "Age (years)")$cells$m4.beta, .vf2(.vm4$coefficients_raw$beta[.vm4$coefficients_raw$term == "Age"])) &&
        identical(.vrow(.v1, "*R*\u00b2")$cells$m4.b, .vf2(summary(.vfit(.vm4))$r.squared)) &&
        identical(.vrow(.v1, "*R*\u00b2")$cells$m4.se, "") &&
        identical(.v1$notes$general, character(0)))

.v4 <- res(jtable(list(.vm1, .vm2, .vm3, .vm4), columns.last = "beta.gelman",
                  fit.rows = c("r2", "adj.r2", "f", "delta.r2", "f.change", "n"),
                  reference = "note", print = FALSE))$val
.v4k <- vapply(.v4$rows, `[[`, "", "label")
.v4s <- function(m) summary(.vfit(m))
.v4fc <- local({ s3 <- .v4s(.vm3); s4 <- .v4s(.vm4)
                 ((s4$r.squared - s3$r.squared) / 1) / ((1 - s4$r.squared) / s4$df[2]) })
.v4fc2 <- local({ s1 <- .v4s(.vm1); s2 <- .v4s(.vm2)     # four terms added: Smoker and three dummies
                  ((s2$r.squared - s1$r.squared) / 4) / ((1 - s2$r.squared) / s2$df[2]) })
check("V04 columns.last adds the Gelman column to the last model only, headed beta* and defined in the general note; every fit row: adjusted R2, F with its df, delta R2 from Model 2 on, its F test (the F change, computed here), N; the reference in the note under reference = note, and not after the label",
      identical(.v4$columns$key[18], "m4.beta.gelman") && !"m3.beta.gelman" %in% .v4$columns$key &&
        identical(.v4$columns$label[18], "\u03b2*") && isFALSE(.v4$columns$italic[18]) &&
        identical(.vrow(.v4, "Age (years)")$cells$m4.beta.gelman,
                  sprintf("%.2f", .vm4$coefficients_raw$beta_gelman[.vm4$coefficients_raw$term == "Age"])) &&
        identical(tail(.v4k, 6), c("*R*\u00b2", "Adjusted *R*\u00b2", "*F*", "\u0394*R*\u00b2", "\u0394*F*", "*N*")) &&
        identical(.vrow(.v4, "Adjusted *R*\u00b2")$cells$m4.b, .vf2(.v4s(.vm4)$adj.r.squared)) &&
        identical(.vrow(.v4, "*F*")$cells$m4.b, sprintf("%.2f (7, 84)", .v4s(.vm4)$fstatistic[["value"]])) &&
        identical(.vrow(.v4, "\u0394*R*\u00b2")$cells$m1.b, "") &&
        identical(.vrow(.v4, "\u0394*R*\u00b2")$cells$m3.b, .vf2(.v4s(.vm3)$r.squared - .v4s(.vm2)$r.squared)) &&
        identical(.vrow(.v4, "\u0394*F*")$cells$m4.b, sprintf("%.2f (1, 84)", .v4fc)) &&
        identical(.vrow(.v4, "\u0394*F*")$cells$m2.b, sprintf("%.2f (4, 86)", .v4fc2)) &&
        identical(.vrow(.v4, "*N*")$cells$m2.b, "92") &&
        identical(.vrow(.v4, "Region of residence")$tail, "") &&
        identical(.v4$notes$general,
                  c("Reference category for Region of residence: North.",
                    "\u03b2* = Gelman's (2008) standardized coefficient: each continuous predictor divided by two standard deviations, each binary predictor kept at 0 and 1.")))

.v5 <- res(jtable(.vm4, columns = c("b", "se", "ci", "p"), ci.style = "two", intercept = "no",
                  fit.rows = "none", reference = "none", title = "Model 4 alone", print = FALSE))$val
.v5o <- res(jtable(.vm4, columns = c("b", "ci", "t"), print = FALSE))$val
check("V05 one model: no model spanner; ci.style = two gives LL and UL under a 95% CI spanner, one gives the bracketed interval; the t column; intercept = no drops the Constant, fit.rows = none the fit rows, reference = none the reference; the call's title",
      is.null(.v5o$spanners) &&
        identical(.v5$columns$key, c("stub", "m1.b", "m1.se", "m1.ci.lower", "m1.ci.upper", "m1.p")) &&
        identical(.v5$columns$label, c("Predictor", "b", "SE", "LL", "UL", "p")) &&
        length(.v5$spanners) == 1L && identical(.v5$spanners[[1]][[1]], list(label = "95% CI", from = 4L, to = 5L)) &&
        identical(.vrow(.v5, "Age (years)")$cells$m1.ci.lower, sprintf("%.2f", stats::confint(.vfit(.vm4))["Age", 1])) &&
        identical(.vrow(.v5o, "Age (years)")$cells$m1.ci,
                  sprintf("[%.2f, %.2f]", stats::confint(.vfit(.vm4))["Age", 1], stats::confint(.vfit(.vm4))["Age", 2])) &&
        identical(.vrow(.v5o, "Age (years)")$cells$m1.t, sprintf("%.2f", .vc4["Age", "t value"])) &&
        !"Constant" %in% vapply(.v5$rows, `[[`, "", "label") &&
        !"*R*\u00b2" %in% vapply(.v5$rows, `[[`, "", "label") &&
        identical(.vrow(.v5, "Region of residence")$tail, "") &&
        identical(.v5$caption$title, "Model 4 alone (*N* = 92)") && identical(.v5$notes$general, character(0)))

# A named list gives the model heads; markers = marks a predictor's row
# or a dummy-coded variable's label row, before its reference.
.v6 <- res(jtable(list("Baseline" = .vm1, "Full" = .vm4),
                  markers = list("Mean-centered" = c(Age, Region)), print = FALSE))$val
.v6b <- res(jtable(list("Baseline" = .vm1), print = FALSE))$val
.v6c <- res(jtable(list(.vm1, "Full" = .vm4), print = FALSE))$val
check("V06 a named list's names are the model heads, a list of one named too, an unnamed item Model n; markers = marks a predictor's row and a dummy-coded variable's label row (the mark before the reference), the note generated",
      identical(vapply(.v6$spanners[[1]], `[[`, "", "label"), c("Baseline", "Full")) &&
        identical(vapply(.v6b$spanners[[1]], `[[`, "", "label"), "Baseline") &&
        identical(vapply(.v6c$spanners[[1]], `[[`, "", "label"), c("Model 1", "Full")) &&
        identical(.vrow(.v6, "Age (years)")$marks, "a") &&
        identical(.vrow(.v6, "Region of residence")$marks, "a") &&
        identical(.vrow(.v6, "Region of residence")$tail, " (reference = North)") &&
        identical(.v6$notes$specific, list(list(mark = "a", text = "Mean-centered"))))

# Stars: on the p column when there is one, on b when there is not; p.format
# = both; the legend.
.v7s <- local({ s <- .jst_style_apa; s$general$p.format <- "stars"; s$regression$columns <- c("b", "se")
                .jst_table_build_models(list(.vm4), s) })
.v7p <- local({ s <- .jst_style_apa; s$general$p.format <- "stars"
                .jst_table_build_models(list(.vm4), s) })
.v7b <- local({ s <- .jst_style_apa; s$general$p.format <- "both"
                .jst_table_build_models(list(.vm4), s) })
check("V07 p.format = stars: with no p column the stars go on b and the F row; with one the p column holds them; both writes the p-value and its stars; the legend comes with the stars, none under exact",
      identical(.vrow(.v7s, "Age (years)")$cells$m1.b, paste0(sprintf("%.2f", .vc4["Age", "Estimate"]), "***")) &&
        identical(.vrow(.v7s, "Current smoker")$cells$m1.b, sprintf("%.2f", .vc4["Smoker", "Estimate"])) &&
        identical(.vrow(.v7p, "Age (years)")$cells$m1.b, sprintf("%.2f", .vc4["Age", "Estimate"])) &&
        identical(.vrow(.v7p, "Age (years)")$cells$m1.p, "***") &&
        identical(.vrow(.v7b, "Current smoker")$cells$m1.p, ".056") &&
        identical(.vrow(.v7b, "Age (years)")$cells$m1.p, "<.001***") &&
        identical(.v7s$notes$probability, "**p* < .05. ***p* < .01. ****p* < .001.") &&
        length(.v1$notes$probability) == 0L)

# Two-category variables: an unregistered 0/1 variable keeps its label; a
# registered one is one row, "label: category (reference = other)"; a
# factor's categories by their levels; an interaction and a power as the
# coefficient table keys them.
.v8 <- local({
  w <- data.frame(y = c(12, 15, 11, 18, 14, 16, 10, 19, 13, 17, 12, 20, 14, 13, 16, 11),
                  grp = factor(rep(c("lo", "mid", "hi"), length.out = 16), levels = c("lo", "mid", "hi")),
                  sex = haven::labelled(rep(c(1, 2), 8), labels = c(Male = 1, Female = 2)),
                  age = c(31, 45, 22, 38, 50, 29, 41, 36, 27, 44, 33, 48, 25, 39, 30, 42))
  attr(w$sex, "label") <- "Gender"; attr(w$age, "label") <- "Age"
  invisible(res({ jdummy(w, grp); jdummy(w, sex) }))
  k1 <- res(jlm(y ~ age + grp + sex, w))$val
  k2 <- res(jlm(y ~ age * sex + I(age^2) + grp, w))$val
  res(jtable(list(k1, k2), print = FALSE))$val
})
check("V08 a two-category registered variable is one row, label: category (reference = other); a factor's categories are its levels under its name; an interaction and a power keep the coefficient table's keys",
      identical(vapply(.v8$rows, `[[`, "", "label"),
                c("Constant", "Age", "grp", "mid", "hi", "Gender: Male", "I(age^2)", "age:sex_Male", "*R*\u00b2")) &&
        identical(.vrow(.v8, "Gender: Male")$tail, " (reference = Female)") &&
        identical(.vrow(.v8, "Gender: Male")$indent, 0L) && identical(.vrow(.v8, "Gender: Male")$kind, "data") &&
        identical(.vrow(.v8, "grp")$tail, " (reference = lo)") &&
        identical(.vrow(.v8, "I(age^2)")$cells$m1.b, "") && nzchar(.vrow(.v8, "I(age^2)")$cells$m2.b))

# Models with different Ns: built, never stopped (Jeff, S401); each model's
# N in the N row, the general note says so, the console gets the
# jcomplete() line over the largest model's variables.
invisible(res(jcomplete(clear.all = TRUE)))
.vh1 <- res(jlm(WellbeingScore ~ Age, tcm))$val
.vh2 <- res(jlm(WellbeingScore ~ Age + Income, tcm))$val
.vh3 <- res(jlm(WellbeingScore ~ Age + Income + Smoker + Region, tcm))$val
.v9 <- res(jtable(list(.vh1, .vh2, .vh3), print = FALSE))
.v9n <- Filter(function(s) grepl("different numbers of cases", s$text, fixed = TRUE), .seen)
.v9t <- local({ s <- .jst_style_apa; s$general$n.position <- "title"
                .jst_table_build_models(list(.vh1, .vh2, .vh3), s) })
.v9z <- local({ s <- .jst_style_apa; s$regression$fit.rows <- "none"
                .jst_table_build_models(list(.vh1, .vh2, .vh3), s) })
.v9e <- res(jtable(list(.vh1, .vh2), fit.rows = c("r2", "delta.r2"), print = FALSE))
.v9en <- Filter(function(s) grepl("delta R2 row is left out", s$text, fixed = TRUE), .seen)
check("V09 models with different Ns are built: the N row is added, the general note says N differs by model with each N and its models (equal Ns grouped), under n.position = title as well, the title carrying no N (ruling R59, S409), fit.rows = none adds no row; the console note names each model's N and gives the jcomplete() line on the largest model's variables, the dummy-coded variable by its own name; delta R2 asked of models on different cases is left out with a note",
      inherits(.v9$val, "jst_table") &&
        identical(tail(vapply(.v9$val$rows, `[[`, "", "label"), 2), c("*R*\u00b2", "*N*")) &&
        identical(unlist(.vrow(.v9$val, "*N*")$cells[c("m1.b", "m2.b", "m3.b")]),
                  c(m1.b = "103", m2.b = "97", m3.b = "92")) &&
        identical(.v9$val$notes$general, "*N* differs by model: 103 (Model 1), 97 (Model 2), 92 (Model 3).") &&
        identical(.v9t$caption$title, "Regression Coefficients Predicting Wellbeing score (0-100)") &&
        identical(.v9t$notes$general, .v9$val$notes$general) &&
        !"*N*" %in% vapply(.v9z$rows, `[[`, "", "label") &&
        length(.v9n) >= 1L &&
        identical(sub("\n$", "", .v9n[[1]]$text),
                  paste0("Note: the models were fit on different numbers of cases\n",
                         "(Model 1: 103; Model 2: 97; Model 3: 92); the table's note says so.\n",
                         "To fit every model on the same cases, run jcomplete() on the largest model's\n",
                         "variables, then the models again:\n",
                         "  jcomplete(tcm, WellbeingScore, Age, Income, Smoker, Region)")) &&
        inherits(.v9e$val, "jst_table") &&
        !"\u0394*R*\u00b2" %in% vapply(.v9e$val$rows, `[[`, "", "label") &&
        length(.v9en) >= 1L &&
        identical(sub("\n$", "", .v9en[[1]]$text),
                  paste0("Note: the delta R2 row is left out: it needs nested models -- each holding\n",
                         "every predictor of the one before it -- fit on the same cases.")))

# The equal-N grouping in the note, and mydata for an expression.
.v10 <- local({
  s <- .jst_style_apa
  .jst_table_build_models(list(.vh2, .vh3, .vh3, .vh1), s)
})
.v10e <- local({ m <- .vh3; m$data_name <- "subset(tcm, Age > 20)"; m2 <- .vh1; m2$data_name <- "subset(tcm, Age > 20)"
                 .jst_table_build_models(list(m2, m), .jst_style_apa) })
check("V10 equal Ns are grouped in the note (Models 2 and 3) and in the console note; data given as an expression gives the jcomplete() line on mydata, after the line that makes it",
      identical(.v10$notes$general, "*N* differs by model: 97 (Model 1), 92 (Models 2 and 3), 103 (Model 4).") &&
        grepl("(Model 1: 97; Models 2 and 3: 92; Model 4: 103)", .v10$messages[1], fixed = TRUE) &&
        grepl("variables, then the models again:\n  mydata <- subset(tcm, Age > 20)\n  jcomplete(mydata, WellbeingScore, Age, Income, Smoker, Region)", .v10e$messages[1], fixed = TRUE))

invisible(res(jcomplete(tcm, WellbeingScore, Volunteer, Age, Smoker, Region, Education, CommuteTime)))

# The stops.
.v11 <- lapply(list(quote(jtable(.vm4, headings = list(A = Age), print = FALSE)),
                    quote(jtable(.vm4, markers = list(Centered = Incom), print = FALSE)),
                    quote(jtable(list(.vm1, .vg1), print = FALSE)),
                    quote(jtable(list(.vm1, res(jlm(Volunteer ~ Age, tcm))$val), print = FALSE)),
                    quote(local({ old <- .vm1; attr(old, "jstats_version") <- NULL; jtable(old, print = FALSE) })),
                    quote(local({ old <- .vm4; old$dummy_groups$Region$codes <- NULL; jtable(old, print = FALSE) })),
                    quote(jtable(.vm4, fit.rows = "r3", print = FALSE)),
                    quote(jtable(.vm4, fit.rows = none, print = FALSE)),
                    quote(jtable(.vm4, landscape = yes, print = FALSE)),
                    quote(jtable(.vm4, landscape = "sideways", print = FALSE)),
                    quote(jtable(.vm4, missing.rows = "none", print = FALSE))),
               function(e) res(eval(e)))
check("V11 the stops: headings = on a model; markers = naming no predictor, the predictors listed; jlm() and jlogistic() results in one list, and two outcomes (since S406 with the lines that make each table, ruling R56); a result with no stamp, and one made before dummy_groups carried codes, each naming its version; a wrong fit.rows value, none among the choices; none typed bare, the pointer; landscape typed bare, and a wrong value; another type's setting",
      all(vapply(.v11, function(r) is.null(r$val), logical(1))) &&
        grepl("jtable(): headings = puts the variables of a descriptives or\nfrequency table under role headings; a regression table lists the predictors\nin the models' order.", .v11[[1]]$txt, fixed = TRUE) &&
        grepl("jtable(): markers = names Incom, which is not among the variables of\nthe result.\nThe result holds Age, Smoker, Region, Education, and CommuteTime.", .v11[[2]]$txt, fixed = TRUE) &&
        grepl(paste0("jtable(): results of different kinds (jlm() and jlogistic()) cannot\nshare a table.\n", "Make each table in a call of its own, then give the tables together to write\nthem to one file:\n",
                     "  ", .tn[1], " <- jtable(.vm1)\n  ", .tn[2], " <- jtable(.vg1)\n",
                     "  jtable(list(", .tn[1], ", ", .tn[2], "), file = \"Tables.docx\", print = FALSE)"), .v11[[3]]$txt, fixed = TRUE) &&
        grepl(paste0("jtable(): models of different outcomes\n(WellbeingScore and Volunteer) cannot share a table.\n", "Make each table in a call of its own, then give the tables together to write\nthem to one file:\n",
                     "  ", .tn[1], " <- jtable(.vm1)\n  ", .tn[2], " <- jtable(res(jlm(Volunteer ~ Age, tcm))$val)\n",
                     "  jtable(list(", .tn[1], ", ", .tn[2], "), file = \"Tables.docx\", print = FALSE)"), .v11[[4]]$txt, fixed = TRUE) &&
        grepl("jtable(): this jlm() result was made by an earlier version of\njstats, before the fields a table needs were stored.\nRun the analysis again, then jtable() on the new result.", .v11[[5]]$txt, fixed = TRUE) &&
        grepl(paste0("jtable(): this jlm() result was made by jstats ", .jst_jstats_version(), ", before the\nfields a table needs were stored."), .v11[[6]]$txt, fixed = TRUE) &&
        grepl("jtable(): `fit.rows` must be columns of a regression table, each\nnamed once: \"r2\", \"adj.r2\", \"f\", \"delta.r2\", \"f.change\", or \"n\"; or \"none\".", .v11[[7]]$txt, fixed = TRUE) &&
        grepl("jtable(): none is not in quotes.\nfit.rows = takes its value in quotes:\n  jtable(.vm4, fit.rows = \"none\", print = FALSE)", .v11[[8]]$txt, fixed = TRUE) &&
        grepl("jtable(): yes is not in quotes.\nlandscape = takes its value in quotes:\n  jtable(.vm4, landscape = \"yes\", print = FALSE)", .v11[[9]]$txt, fixed = TRUE) &&
        grepl("jtable(): `landscape` must be \"auto\", \"yes\", or \"no\".", .v11[[10]]$txt, fixed = TRUE) &&
        grepl("jtable(): missing.rows = is a setting of a frequency table, and this\ntable is a regression table.", .v11[[11]]$txt, fixed = TRUE))

# landscape in the call: the one general setting a call may give (Jeff,
# S402); it goes in the call's layer as a general setting.
.v12 <- res(jtable(.vm4, landscape = "yes", print = FALSE))$val
.v12n <- res(jtable(.vm4, landscape = "no", print = FALSE))$val
check("V12 landscape = \"yes\" or \"no\" in the call is taken, in the call's layer, and outranks the style's auto; a general setting still stops",
      identical(.jst_style_key(.v12$style, "regression", "landscape"), "yes") &&
        identical(.v12$style$layers[[1]]$source, "the call") &&
        identical(.v12$style$layers[[1]]$general$landscape, "yes") &&
        identical(.jst_style_key(.v12n$style, "regression", "landscape"), "no") &&
        identical(.jst_style_key(.v1$style, "regression", "landscape"), "auto") &&
        grepl("jtable(): font = is one of a style's general settings, which a call\ncannot change.", res(jtable(.vm4, font = "Arial", print = FALSE))$txt, fixed = TRUE))

# A style file's [regression] section: columns.last, se.label, leading.zero
# = never read from a file; a template title of the file's own.
.wsty("journal", "based.on = apa", "leading.zero = never", "[regression]", "columns.last = beta.gelman",
      "se.label = s.e.", "fit.rows = r2, n", "title = OLS Regression of {outcome}")
.v13 <- res(jtable(list(.vm1, .vm4), style = "journal", print = FALSE))$val
check("V13 a style file's [regression] section: columns.last, se.label (upright, a word in SE's place), fit.rows and a title template of its own are read; leading.zero = never drops the zero on b and SE",
      identical(.v13$columns$label, c("Predictor", "b", "s.e.", "\u03b2", "p", "b", "s.e.", "\u03b2", "p", "\u03b2*")) &&
        identical(.v13$columns$italic[3], FALSE) &&
        identical(.vrow(.v13, "Age (years)")$cells$m2.b, sub("^0", "", sprintf("%.2f", .vc4["Age", "Estimate"]))) &&
        identical(.vrow(.v13, "Age (years)")$cells$m2.se, sub("^0", "", sprintf("%.2f", .vc4["Age", "Std. Error"]))) &&
        identical(tail(vapply(.v13$rows, `[[`, "", "label"), 2), c("*R*\u00b2", "*N*")) &&
        identical(.v13$caption$title, "OLS Regression of Wellbeing score (0-100) (*N* = 92)"))

# A fit row's cells span their model's columns (Session 403): the span
# field names each model's columns, c(from, to); a predictor's row has none.
check("V14 a fit row carries a span per model -- its columns, c(from, to), the Gelman column widening the last model's -- and a predictor's row none; one model spans its columns too",
      identical(.vrow(.v4, "*F*")$span, list(c(2L, 5L), c(6L, 9L), c(10L, 13L), c(14L, 18L))) &&
        identical(.vrow(.v4, "*N*")$span, .vrow(.v4, "*R*\u00b2")$span) &&
        is.null(.vrow(.v4, "Age (years)")$span) && is.null(.vrow(.v4, "Constant")$span) &&
        identical(.vrow(.v1, "*R*\u00b2")$span, list(c(2L, 5L), c(6L, 9L), c(10L, 13L), c(14L, 17L))) &&
        identical(.vrow(.v5o, "*R*\u00b2")$span, list(c(2L, 4L))))

# Models on the same cases but not nested: delta R2 and its F test need
# each model to hold every predictor of the one before it, whichever way
# the list runs; both rows are left out, with one note naming them.
invisible(res(jcomplete(tcm, WellbeingScore, Volunteer, Age, Smoker, Region, Education, CommuteTime)))
.v15m <- res(jlm(WellbeingScore ~ Smoker + Region, tcm))$val
.v15 <- res(jtable(list(.vm1, .v15m), fit.rows = c("r2", "delta.r2", "f.change"), print = FALSE))
.v15n <- Filter(function(s) grepl("rows are left out", s$text, fixed = TRUE), .seen)
.v15r <- res(jtable(list(.vm2, .vm1), fit.rows = c("r2", "delta.r2"), print = FALSE))
.v15k <- res(jtable(list(.vm1, .vm2), fit.rows = c("r2", "delta.r2", "f.change"), print = FALSE))$val
invisible(res(jcomplete(clear.all = TRUE)))
check("V15 models on the same cases but not nested: the delta R2 and F change rows are left out with one note naming both; the models in reverse order (the second not holding the first's predictors) the same; nested models in order keep both",
      identical(.v15m$n, .vm1$n) &&
        !any(c("\u0394*R*\u00b2", "\u0394*F*") %in% vapply(.v15$val$rows, `[[`, "", "label")) &&
        length(.v15n) >= 1L &&
        identical(sub("\n$", "", .v15n[[1]]$text),
                  paste0("Note: the delta R2 and F change rows are left out: they need nested models\n",
                         "-- each holding every predictor of the one before it -- fit on the\n",
                         "same cases.")) &&
        !"\u0394*R*\u00b2" %in% vapply(.v15r$val$rows, `[[`, "", "label") &&
        all(c("\u0394*R*\u00b2", "\u0394*F*") %in% vapply(.v15k$rows, `[[`, "", "label")) &&
        identical(.vrow(.v15k, "\u0394*F*")$cells$m2.b, sprintf("%.2f (4, 86)", .v4fc2)))

# =============================================================================
# W. The logistic regression table, from jlogistic() results
# =============================================================================
cat("\n--- W. The logistic regression table ---\n")

.wfit <- function(m) stats::glm(stats::reformulate(names(m$model_frame)[-1], names(m$model_frame)[1]),
                                data = m$model_frame, family = stats::binomial())
.w1 <- res(jtable(list(.vg1, .vg4), print = FALSE))$val
.wg4 <- summary(.wfit(.vg4))$coefficients
.wg1 <- .wfit(.vg1); .wg4f <- .wfit(.vg4)
check("W01 two jlogistic() results side by side: the apa columns b, SE, OR (italic), p; the title names the outcome; the cells from base R's fit: b, SE, the odds ratio exp(b) at two decimals with its zero, p; the Constant's OR shown; the fit rows the model chi-square with its df and Nagelkerke R2 (no zero), computed here",
      identical(.w1$type, "logistic") &&
        identical(.w1$columns$label, c("Predictor", rep(c("b", "SE", "OR", "p"), 2))) &&
        identical(.w1$columns$italic, c(FALSE, rep(c(TRUE, TRUE, TRUE, TRUE), 2))) &&
        identical(.w1$caption$title, "Logistic Regression Coefficients Predicting Volunteered in past year (*N* = 92)") &&
        identical(.vrow(.w1, "Age (years)")$cells$m2.b, sprintf("%.2f", .wg4["Age", "Estimate"])) &&
        identical(.vrow(.w1, "Age (years)")$cells$m2.or, sprintf("%.2f", exp(.wg4["Age", "Estimate"]))) &&
        identical(.vrow(.w1, "Constant")$cells$m2.or, sprintf("%.2f", exp(.wg4["(Intercept)", "Estimate"]))) &&
        identical(.vrow(.w1, "Highest education level")$cells$m2.p, "<.001") &&
        identical(tail(vapply(.w1$rows, `[[`, "", "label"), 2), c("Model \u03c7\u00b2", "Nagelkerke *R*\u00b2")) &&
        identical(.vrow(.w1, "Model \u03c7\u00b2")$cells$m2.b,
                  sprintf("%.2f (%d)", .wg4f$null.deviance - .wg4f$deviance, .wg4f$df.null - .wg4f$df.residual)) &&
        identical(.vrow(.w1, "Nagelkerke *R*\u00b2")$cells$m1.b, .vf2(.vg1$fit_raw$nagelkerke_r2)) &&
        identical(.vrow(.w1, "Nagelkerke *R*\u00b2")$cells$m2.b, .vf2(.vg4$fit_raw$nagelkerke_r2)) &&
        identical(.w1$notes$general, character(0)))

.w2 <- local({ s <- .jst_style_apa; s$general$p.format <- "stars"; s$general$leading.zero <- "never"
               s$logistic$columns <- c("b", "se", "wald", "or", "ci", "beta.gelman")
               s$logistic$fit.rows <- c("chisq", "nagelkerke", "cox.snell", "neg2ll", "aic", "n")
               .jst_table_build_models(list(Base = .vg1, Full = .vg4), s) })
check("W02 every logistic column and fit row: Wald (upright) and the CI for the odds ratio, bracketed; the Gelman column with its note; the chi-square with stars under p.format = stars, Cox and Snell R2, -2 log likelihood (the minus sign), AIC and N, computed here; leading.zero = never on b, SE and the limits; the heads from the list's names",
      identical(.w2$columns$label[2:7], c("b", "SE", "Wald", "OR", "95% CI for OR", "\u03b2*")) &&
        identical(.w2$columns$italic[2:7], c(TRUE, TRUE, FALSE, TRUE, FALSE, FALSE)) &&
        identical(.vrow(.w2, "Age (years)")$cells$m2.wald, sprintf("%.2f", .wg4["Age", "z value"]^2)) &&
        identical(.vrow(.w2, "Age (years)")$cells$m2.ci,
                  sprintf("[%s, %s]", sub("^0", "", sprintf("%.2f", .vg4$coefficients_raw$exp_ci_lower[2])),
                          sub("^0", "", sprintf("%.2f", .vg4$coefficients_raw$exp_ci_upper[2])))) &&
        identical(.vrow(.w2, "Age (years)")$cells$m2.b, paste0(sub("^0", "", sprintf("%.2f", .wg4["Age", "Estimate"])), "*")) &&
        identical(.vrow(.w2, "Age (years)")$cells$m2.beta.gelman,
                  sprintf("%.2f", .vg4$coefficients_raw$beta_gelman[.vg4$coefficients_raw$term == "Age"])) &&
        identical(vapply(.w2$spanners[[1]], `[[`, "", "label"), c("Base", "Full")) &&
        identical(tail(vapply(.w2$rows, `[[`, "", "label"), 6),
                  c("Model \u03c7\u00b2", "Nagelkerke *R*\u00b2", "Cox and Snell *R*\u00b2",
                    "\u22122 log likelihood", "AIC", "*N*")) &&
        identical(.vrow(.w2, "Model \u03c7\u00b2")$cells$m2.b,
                  sprintf("%.2f** (%d)", .wg4f$null.deviance - .wg4f$deviance, .wg4f$df.null - .wg4f$df.residual)) &&
        identical(.vrow(.w2, "Cox and Snell *R*\u00b2")$cells$m2.b, .vf2(.vg4$fit_raw$cox_snell_r2)) &&
        identical(.vrow(.w2, "\u22122 log likelihood")$cells$m2.b, sprintf("%.2f", .wg4f$deviance)) &&
        identical(.vrow(.w2, "AIC")$cells$m2.b, sprintf("%.2f", .wg4f$aic)) &&
        identical(.vrow(.w2, "*N*")$cells$m1.b, "92") &&
        length(.w2$notes$general) == 1L && grepl("^\u03b2\\* = Gelman", .w2$notes$general[1]) &&
        identical(.w2$notes$probability, "**p* < .05. ***p* < .01. ****p* < .001."))

# Through the front door: a logistic result routes to the logistic section,
# so the call's columns and fit rows are checked against it -- OR and the
# chi-square accepted, beta refused as a regression column.
.w3 <- res(jtable(.vg4, columns = c("b", "or", "p"), fit.rows = c("chisq", "n"), print = FALSE))$val
.w3s <- res(jtable(.vg4, columns = c("b", "beta"), print = FALSE))
check("W03 jtable() on a jlogistic() result takes the logistic section's settings in the call: columns = b, or, p and fit.rows = chisq, n; beta in the call stops as a regression column",
      identical(.w3$columns$key, c("stub", "m1.b", "m1.or", "m1.p")) &&
        identical(tail(vapply(.w3$rows, `[[`, "", "label"), 2), c("Model \u03c7\u00b2", "*N*")) &&
        is.null(.w3s$val) &&
        grepl("[error] jtable(): `columns` must be columns of a logistic regression table,\neach named once: \"b\", \"se\", \"or\", \"p\", \"wald\", \"ci\", or \"beta.gelman\".", .w3s$txt, fixed = TRUE))

# =============================================================================
# X. The preview of the regression table, pinned whole
# =============================================================================
cat("\n--- X. The preview ---\n")

.x1 <- res(print(jtable(list(.vm1, .vm2, .vm3, .vm4), print = FALSE)))
.x1l <- strsplit(.x1$txt, "\n", fixed = TRUE)[[1]]
check("X01 the preview (print() on the table, S406), pinned whole (the S402 sketch's Table 3): the caption with N after the title (ruling R59, S409), the model spanners centered over their columns, the heads, the Constant, the rows and the indented categories, every column on the point (a beta with no zero under a b with one, a p's floor hanging left), R2 under b, no note",
      identical(.x1l, c(
        "Table 1",
        "Regression Coefficients Predicting Wellbeing score (0-100) (N = 92)",
        "-----------------------------------------------------------------------------------------------------------------------------------------------",
        "                                                 Model 1                   Model 2                   Model 3                   Model 4",
        "Predictor                                  b     SE    \u03b2     p      b     SE     \u03b2     p      b     SE     \u03b2     p       b     SE     \u03b2     p",
        "-----------------------------------------------------------------------------------------------------------------------------------------------",
        "Constant                                 36.19  4.07       <.001  37.10  4.67        <.001  20.97  4.45        <.001  21.01   5.07        <.001",
        "Age (years)                               0.37  0.10  .38  <.001   0.38  0.10   .39  <.001   0.40  0.08   .41  <.001   0.40   0.08   .41  <.001",
        "Current smoker                                                     1.84  2.41   .08   .446   3.88  1.97   .16   .052   3.88   2.00   .16   .056",
        "Region of residence (reference = North)",
        "  South                                                           -3.97  3.42  -.14   .248  -0.98  2.80  -.03   .727  -0.98   2.81  -.03   .728",
        "  East                                                            -1.68  3.05  -.07   .584   0.48  2.48   .02   .847   0.49   2.52   .02   .848",
        "  West                                                            -3.63  3.25  -.13   .268  -3.40  2.63  -.13   .199  -3.40   2.65  -.13   .203",
        "Highest education level                                                                      4.65  0.68   .56  <.001   4.65   0.69   .56  <.001",
        "Daily commute time (minutes)                                                                                          -0.001  0.08   .00   .987",
        "R\u00b2                                         .14                      .16                       .46                       .46",
        "-----------------------------------------------------------------------------------------------------------------------------------------------")) &&
        endsWith(.x1$txt, "-\n"))

.x2 <- res(print(.v5))
.x2l <- strsplit(.x2$txt, "\n", fixed = TRUE)[[1]]
check("X02 one model with the CI in two columns: no model spanner, the 95% CI spanner over LL and UL, no Constant and no fit row; print() reprints it",
      identical(.x2l[1:7], c(
        "Table 1",
        "Model 4 alone (N = 92)",
        "--------------------------------------------------------------",
        "                                               95% CI",
        "Predictor                        b     SE     LL    UL     p",
        "--------------------------------------------------------------",
        "Age (years)                    0.40   0.08   0.24  0.56  <.001")) &&
        identical(.x2l[9:10], c("Region of residence", "  South                       -0.98   2.81  -6.58  4.61   .728")) &&
        identical(.x2l[15], "--------------------------------------------------------------") &&
        length(.x2l) == 15L)

# The fit rows' values on the b column's point, their df running on under
# the model's other columns: b is not widened by them (Session 403).
.x3 <- res(print(.v4))
.x3l <- strsplit(.x3$txt, "\n", fixed = TRUE)[[1]]
.x3p <- function(pat) regexpr(".", grep(pat, .x3l, value = TRUE)[1], fixed = TRUE)
check("X03 the preview with every fit row: F and its df on the b column's point, the df under SE and beta; the F change and N the same; b not widened by them -- the Constant's b two spaces from its SE as in X01",
      startsWith(grep("^F ", .x3l, value = TRUE), "F                             14.74 (1, 90)             3.36 (5, 86)") &&
        .x3p("^F ") == .x3p("^Constant") && .x3p("^Adjusted R") == .x3p("^Constant") &&
        regexpr("0.59 (4, 86)", grep("^\u0394F ", .x3l, value = TRUE), fixed = TRUE) ==
          regexpr("37.10", grep("^Constant", .x3l, value = TRUE), fixed = TRUE) + 1L &&
        grepl("^N                             92                       92  ", grep("^N ", .x3l, value = TRUE)) &&
        grepl("36.19  4.07       <.001  37.10  4.67", grep("^Constant", .x3l, value = TRUE), fixed = TRUE))

# =============================================================================
# Y. The Word file of a regression table
# =============================================================================
cat("\n--- Y. The Word file ---\n")

.yf <- file.path(.vd, "Table3.docx")
.y1 <- res(jtable(list(.vm1, .vm2, .vm3, .vm4), file = .yf, overwrite = TRUE, print = FALSE))
.yx <- file.path(.vd, "x"); unlink(.yx, recursive = TRUE)
invisible(utils::unzip(.yf, exdir = .yx))
.yd <- paste(readLines(file.path(.yx, "word", "document.xml"), warn = FALSE, encoding = "UTF-8"), collapse = "\n")
.ytr <- regmatches(.yd, gregexpr("<w:tr>.*?</w:tr>", .yd))[[1]]
check("Y01 document.xml: 13 rows -- the caption row, the spanner row (four Model cells spanning four columns each, repeated across pages, a rule above and a rule under each label), the header, the Constant, eight predictor rows, R2 (no note row: N after the title since ruling R59, S409); a gridCol per column; the heading row spans the table with its reference after the label",
      .ltag(.yd, "w:tr")[["open"]] == 13L &&
        lengths(regmatches(.yd, gregexpr("<w:gridCol ", .yd))) == 17L &&
        lengths(regmatches(.yd, gregexpr("<w:tblHeader/>", .yd))) == 3L &&
        lengths(regmatches(.ytr[2], gregexpr("<w:gridSpan w:val=\"4\"/>", .ytr[2]))) == 4L &&
        lengths(regmatches(.ytr[2], gregexpr("<w:top w:val=\"single\"", .ytr[2]))) == 5L &&
        lengths(regmatches(.ytr[2], gregexpr("<w:bottom w:val=\"single\"", .ytr[2]))) == 4L &&
        grepl("<w:t xml:space=\"preserve\">Model 3</w:t>", .ytr[2], fixed = TRUE) &&
        !grepl("<w:top w:val=\"single\"", .ytr[3], fixed = TRUE) &&
        grepl("<w:gridSpan w:val=\"17\"/>", .ytr[7], fixed = TRUE) &&
        grepl("<w:t xml:space=\"preserve\">Region of residence</w:t></w:r><w:r><w:rPr><w:sz w:val=\"[0-9]+\"/><w:szCs w:val=\"[0-9]+\"/></w:rPr><w:t xml:space=\"preserve\"> \\(reference = North\\)</w:t>", .ytr[7]))

check("Y02 the heads: b, SE and p in italics, beta upright; the Constant row; the R2 row's label an italic R with the superscript-two character; a blank cell is an empty paragraph on its decimal tab with the fitted size on its mark; the near-zero b written with the minus sign",
      grepl("<w:jc w:val=\"center\"/><w:rPr><w:sz [^>]*/><w:szCs [^>]*/></w:rPr></w:pPr><w:r><w:rPr><w:i/><w:sz w:val=\"[0-9]+\"/><w:szCs w:val=\"[0-9]+\"/></w:rPr><w:t xml:space=\"preserve\">SE</w:t>", .yd) &&
        grepl(paste0("</w:pPr><w:r><w:rPr><w:sz w:val=\"[0-9]+\"/><w:szCs w:val=\"[0-9]+\"/></w:rPr><w:t xml:space=\"preserve\">", "\u03b2", "</w:t>"), .yd) &&
        grepl("<w:t xml:space=\"preserve\">Constant</w:t>", .yd, fixed = TRUE) &&
        grepl(paste0("<w:r><w:rPr><w:i/><w:sz w:val=\"[0-9]+\"/><w:szCs w:val=\"[0-9]+\"/></w:rPr><w:t xml:space=\"preserve\">R</w:t></w:r><w:r><w:rPr><w:sz w:val=\"[0-9]+\"/><w:szCs w:val=\"[0-9]+\"/></w:rPr><w:t xml:space=\"preserve\">", "\u00b2", "</w:t>"), .yd) &&
        grepl("<w:tabs><w:tab w:val=\"decimal\" w:pos=\"[0-9]+\"/></w:tabs><w:spacing [^>]*/><w:rPr><w:sz w:val=\"[0-9]+\"/><w:szCs w:val=\"[0-9]+\"/></w:rPr></w:pPr></w:p>", .yd) &&
        grepl(paste0("<w:t xml:space=\"preserve\">", "\u2212", "0.001</w:t>"), .yd, fixed = TRUE))

# The page: four models need a landscape page (auto); the call's landscape
# = "no" keeps portrait and the fit steps the font down; landscape = "yes"
# turns one model's page.
.ysp <- function(x) regmatches(x, regexpr("<w:sectPr>.*?</w:sectPr>", x))
.yg <- function(x) sum(as.integer(regmatches(x, gregexpr("(?<=<w:gridCol w:w=\")[0-9]+", x, perl = TRUE))[[1]]))
.y3n <- local({
  f <- file.path(.vd, "no.docx"); invisible(res(jtable(list(.vm1, .vm2, .vm3, .vm4), file = f, landscape = "no", overwrite = TRUE, print = FALSE)))
  x <- file.path(.vd, "xn"); unlink(x, recursive = TRUE); invisible(utils::unzip(f, exdir = x))
  paste(readLines(file.path(x, "word", "document.xml"), warn = FALSE, encoding = "UTF-8"), collapse = "\n")
})
.y3y <- local({
  f <- file.path(.vd, "yes.docx"); invisible(res(jtable(.vm1, file = f, landscape = "yes", overwrite = TRUE, print = FALSE)))
  x <- file.path(.vd, "xy"); unlink(x, recursive = TRUE); invisible(utils::unzip(f, exdir = x))
  paste(readLines(file.path(x, "word", "document.xml"), warn = FALSE, encoding = "UTF-8"), collapse = "\n")
})
check("Y03 the page: four models turn the page under landscape = auto, and the table fits it (the pad, then the font: a size below 12 on the cells and the paragraph marks, the caption at 12); landscape = \"no\" in the call keeps portrait, the table fitted to it; landscape = \"yes\" turns one model's page",
      grepl("w:orient=\"landscape\"", .ysp(.yd), fixed = TRUE) &&
        .yg(.yd) <= 16838L - 2880L &&
        grepl("<w:sz w:val=\"(18|20|22)\"/>", .yd) &&
        grepl("<w:rPr><w:sz w:val=\"(18|20|22)\"/><w:szCs w:val=\"(18|20|22)\"/></w:rPr></w:pPr></w:p>", .yd) &&
        grepl("<w:rPr><w:b/><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\">Table </w:t>", .yd, fixed = TRUE) &&
        !grepl("w:orient=\"landscape\"", .ysp(.y3n), fixed = TRUE) &&
        .yg(.y3n) <= 11906L - 2880L &&
        grepl("w:orient=\"landscape\"", .ysp(.y3y), fixed = TRUE))

# A fitted table never wraps a number: every number column is as wide as
# its widest cell at the fitted size, and the file's grid is the fit's.
.y4 <- local({
  tb  <- .jst_table_build_models(list(.vm1, .vm2, .vm3, .vm4), .jst_style_apa)
  fit <- .jst_docx_fit(tb, .jst_style_apa, 16838L - 2880L)
  w   <- as.integer(regmatches(.yd, gregexpr("(?<=<w:gridCol w:w=\")[0-9]+", .yd, perl = TRUE))[[1]])
  ok  <- identical(w, fit$widths) && sum(fit$widths) <= 16838L - 2880L
  for (j in 2:17) {
    k <- tb$columns$key[j]
    cells <- vapply(tb$rows, function(r) { s <- r$cells[[k]]; if (is.null(s)) "" else s }, "")
    if (.jst_docx_text_width(cells, fit$size, digits = TRUE) + 216L > fit$widths[j]) ok <- FALSE
  }
  # The natural widths at 12 points with the pad pass the page; the fit
  # stepped the size down, the pad to 60.
  nat <- .jst_docx_widths(tb, .jst_style_apa)
  # A table one twip too wide for its page at the full pad: the pad step
  # alone fits it, at 12 points, each number column 60 twips narrower.
  pad <- .jst_docx_fit(tb, .jst_style_apa, sum(nat) - 1L)
  # Ruling R55 (S405): the labels wrap onto two lines before the font
  # steps down, so the fit stops at 10 points with the stub narrowed below
  # its width there, never below its floor.
  w10 <- .jst_docx_widths(tb, .jst_style_apa, size = 10, pad = 60L)
  list(ok = ok, size = fit$size, nat = sum(nat), note = fit$note_size,
       pad_size = pad$size, pad_sum = sum(pad$widths), pad_expect = sum(nat) - 60L * 16L,
       stub = fit$widths[1], stub10 = w10[1], floor10 = .jst_docx_stub_floor(tb, 10, w10[1]))
})
check("Y04 the fitted table: its natural width passes the landscape page; under ruling R55 the fit wraps the labels before it steps the font, so it stops at 10 points (the notes with it; 9 before S405), the stub narrowed below its width there and not below its floor, every number column as wide as its widest cell at that size with the margins, the file's grid the fit's; a table one twip too wide loses half its pad and keeps its size",
      isTRUE(.y4$ok) && identical(.y4$size, 10) && .y4$nat > 16838L - 2880L &&
        .y4$stub < .y4$stub10 && .y4$stub >= .y4$floor10 &&
        identical(.y4$note, .y4$size) &&
        identical(.y4$pad_size, 12) && identical(.y4$pad_sum, .y4$pad_expect))

check("Y05 document.xml of the regression table pinned by its checksum",
      identical(unname(tools::md5sum(file.path(.yx, "word", "document.xml"))), "3f61bbc25ae86919a382d9edc33ed43a"))

# n.position = title in the file: the N inside the italic apa title set
# upright; in a journal caption, italic.
.y6 <- local({
  s <- .jst_style_apa; s$general$n.position <- "title"
  t <- .jst_table_build_desc(list(.j0), s)
  f <- file.path(.vd, "ntitle.docx"); .jst_docx_pack(.jst_docx_parts(list(t), s), f)
  x <- file.path(.vd, "xt"); unlink(x, recursive = TRUE); invisible(utils::unzip(f, exdir = x))
  a <- paste(readLines(file.path(x, "word", "document.xml"), warn = FALSE, encoding = "UTF-8"), collapse = "\n")
  s$general$caption.form <- "journal"; t2 <- .jst_table_build_desc(list(.j0), s)
  f2 <- file.path(.vd, "ntitle2.docx"); .jst_docx_pack(.jst_docx_parts(list(t2), s), f2)
  x2 <- file.path(.vd, "xt2"); unlink(x2, recursive = TRUE); invisible(utils::unzip(f2, exdir = x2))
  b <- paste(readLines(file.path(x2, "word", "document.xml"), warn = FALSE, encoding = "UTF-8"), collapse = "\n")
  list(a = a, b = b)
})
check("Y06 n.position = title in the file: apa's italic title carries (N = 103) with N upright; the journal's one-line caption sets N in italics; no N in the note",
      grepl("<w:rPr><w:i/><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\">Descriptive Statistics (</w:t></w:r><w:r><w:rPr><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\">N</w:t></w:r><w:r><w:rPr><w:i/><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\"> = 103)</w:t>", .y6$a, fixed = TRUE) &&
        !grepl("<w:t xml:space=\"preserve\"> = 103.</w:t>", .y6$a, fixed = TRUE) &&
        grepl("<w:t xml:space=\"preserve\"> Descriptive Statistics (</w:t></w:r><w:r><w:rPr><w:i/><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\">N</w:t>", .y6$b, fixed = TRUE))

# jstyle(): the two sections in the printout and in a saved copy; the
# panel's row (Q01).
.y7 <- .strip_ansi(res(jstyle("apa"))$txt)
.y7f <- local({ p <- res(jstyle("apa", save.as = file.path(.vd, "copy3")))$val
                readLines(file.path(.vd, "copy3.jstyle"), encoding = "UTF-8") })
check("Y07 jstyle(\"apa\") prints the [regression] and [logistic] sections after [frequencies], n.position in note.n's place (title since ruling R59, S409); a saved copy writes them with their notes, columns.last and fit.rows as none and the lists",
      grepl("(?s)\\[frequencies\\]\n.*\\[regression\\]\ntitle             = Regression Coefficients Predicting \\{outcome\\}\ncolumns           = b, se, beta, p\ncolumns.last      = none\n", .y7, perl = TRUE) &&
        grepl("(?s)\\[logistic\\]\n.*\nfit.rows          = chisq, nagelkerke\n", .y7, perl = TRUE) &&
        grepl("\nn.position        = title\n", .y7, fixed = TRUE) && !grepl("note.n", .y7, fixed = TRUE) &&
        "[regression]" %in% .y7f && "[logistic]" %in% .y7f &&
        any(grepl("^# A regression table, from jlm\\(\\) results\\.$", .y7f)) &&
        "fit.rows = r2" %in% .y7f && "columns.last = none" %in% .y7f &&
        "fit.rows = chisq, nagelkerke" %in% .y7f &&
        any(grepl("^# columns added to the last model only, or none$", .y7f)) &&
        inherits(res(jtable(.vm4, style = file.path(.vd, "copy3"), print = FALSE))$val, "jst_table"))

# A fit row's cell spans its model's columns (gridSpan) on the b column's
# decimal tab; the df after an F run on in the span, so b's grid column
# is as wide with the F row as without it (Session 403).
.y8 <- local({
  r2  <- .ytr[grep("<w:t xml:space=\"preserve\">R</w:t>", .ytr, fixed = TRUE)[1]]
  con <- .ytr[grep("<w:t xml:space=\"preserve\">Constant</w:t>", .ytr, fixed = TRUE)[1]]
  tab <- function(row) regmatches(row, gregexpr("<w:tab w:val=\"decimal\" w:pos=\"[0-9]+\"/>", row))[[1]]
  f <- file.path(.vd, "Table3f.docx")
  jtable(list(.vm1, .vm2, .vm3, .vm4), fit.rows = c("r2", "f"), file = f, overwrite = TRUE, print = FALSE)
  x <- file.path(.vd, "xf"); unlink(x, recursive = TRUE); invisible(utils::unzip(f, exdir = x))
  d <- paste(readLines(file.path(x, "word", "document.xml"), warn = FALSE, encoding = "UTF-8"), collapse = "\n")
  grid <- function(doc) as.integer(sub(".*w:w=\"([0-9]+)\".*", "\\1", regmatches(doc, gregexpr("<w:gridCol w:w=\"[0-9]+\"/>", doc))[[1]]))
  ftr <- regmatches(d, gregexpr("<w:tr>.*?</w:tr>", d))[[1]]
  frow <- ftr[grep("<w:t xml:space=\"preserve\">F</w:t>", ftr, fixed = TRUE)[1]]
  fcon <- ftr[grep("<w:t xml:space=\"preserve\">Constant</w:t>", ftr, fixed = TRUE)[1]]
  list(r2 = r2, con = con, tab = tab, frow = frow, fcon = fcon, g1 = grid(.yd), g2 = grid(d))
})
check("Y08 the R2 row: five cells, each number cell spanning its model's four columns on the b column's decimal tab (the Constant's); with the F row in the file, F's df in its span, every grid column as wide as without it and every decimal tab where it was",
      .ltag(.y8$r2, "w:tc")[["open"]] == 5L &&
        lengths(regmatches(.y8$r2, gregexpr("<w:gridSpan w:val=\"4\"/>", .y8$r2))) == 4L &&
        identical(.y8$tab(.y8$r2), .y8$tab(.y8$con)[c(1, 5, 9, 13)]) &&
        grepl("<w:t xml:space=\"preserve\">14.74 (1, 90)</w:t>", .y8$frow, fixed = TRUE) &&
        .ltag(.y8$frow, "w:tc")[["open"]] == 5L &&
        identical(.y8$tab(.y8$frow), .y8$tab(.y8$fcon)[c(1, 5, 9, 13)]) &&
        identical(.y8$g1, .y8$g2) && identical(.y8$tab(.y8$fcon), .y8$tab(.y8$con)))

invisible(res(jcomplete(clear.all = TRUE)))

# =============================================================================
# AA. Build 4's general changes: the five new sections, heads with markup,
#     the filter sentence, the cells set centered
# =============================================================================
cat("\n--- AA. The general changes (build 4) ---\n")

.aad <- file.path(tempdir(), "tables_check_b4"); unlink(.aad, recursive = TRUE); dir.create(.aad)

check("AA01 the apa list and the spec hold the five new sections after logistic -- correlation, ttest, anova, crosstab, reliability -- each naming the same settings in the same order (since S409 31 general settings, with caption.fill, heading.fill and note.label.italic); filter.note joins the general settings (28), yes | no; jtable() reads nine result classes into the nine sections",
      identical(names(.jst_style_apa), c("general", "descriptives", "frequencies", "regression",
                                         "logistic", "correlation", "ttest", "anova", "crosstab",
                                         "reliability")) &&
        identical(names(.jst_style_spec), names(.jst_style_apa)) &&
        all(vapply(names(.jst_style_apa), function(s) {
          identical(names(.jst_style_apa[[s]]), names(.jst_style_spec[[s]]))
        }, logical(1))) &&
        length(.jst_style_apa$general) == 31L &&
        identical(.jst_style_apa$general$filter.note, "yes") &&
        identical(.jst_style_spec$general$filter.note$choices, c("yes", "no")) &&
        identical(unname(.jst_table_types),
                  c("descriptives", "frequencies", "regression", "logistic", "correlation",
                    "ttest", "anova", "crosstab", "reliability")) &&
        identical(names(.jst_table_types),
                  c("jst_desc", "jst_freq", "jst_lm", "jst_logistic", "jst_corr",
                    "jst_ttest", "jst_anova", "jst_crosstab", "jst_alpha")))

check("AA02 the heads: V (Cramer's V) italic as a symbol; chi2, eta2 and alpha if item deleted upright (Greek letters); a head that carries the light markup is set by it -- *t*(101) and Item-total *r* -- the console showing it bare",
      "v" %in% .jst_tbl_italic_heads &&
        !any(c("chisq", "eta2", "alpha.if.deleted", "item.total") %in% .jst_tbl_italic_heads) &&
        isTRUE(.jst_tbl_markup("*t*(101)")) && isTRUE(.jst_tbl_markup("Item-total *r*")) &&
        !isTRUE(.jst_tbl_markup("Mean difference")) &&
        identical(.jst_table_strip_markup(c("*t*(101)", "Item-total *r*", "*F*(3, 99)")),
                  c("t(101)", "Item-total r", "F(3, 99)")))

# The filter in words: labels from the data, the signs as characters, a
# code compared by == or %in% as its value label; anything else as typed.
.aal <- function(v) attr(tcm[[v]], "label", exact = TRUE)
.aavl <- function(v, code) {
  l <- attr(tcm[[v]], "labels", exact = TRUE); names(l)[unname(l) == code]
}
.aaw <- function(cond, data = tcm) .jst_table_filter_words(cond, data)
check("AA03 a filter in words: a variable by its label, >=, <= and != as the mathematical signs, a constant on the left read the other way round, a code compared by == or != or %in% (a c() or a range) as its value label, & and | as and and or with parentheses where they mix, a negative value with the minus sign",
      identical(.aaw("Age >= 30")$text, paste(.aal("Age"), "\u2265", "30")) &&
        identical(.aaw("30 <= Age")$text, paste(.aal("Age"), "\u2265", "30")) &&
        identical(.aaw("Age <= 60")$text, paste(.aal("Age"), "\u2264", "60")) &&
        identical(.aaw("Smoker == 0")$text, paste(.aal("Smoker"), "=", .aavl("Smoker", 0))) &&
        identical(.aaw("Smoker != 1")$text, paste(.aal("Smoker"), "\u2260", .aavl("Smoker", 1))) &&
        identical(.aaw("Region %in% c(1, 3)")$text,
                  paste(.aal("Region"), "=", .aavl("Region", 1), "or", .aavl("Region", 3))) &&
        identical(.aaw("Region %in% 2:4")$text,
                  paste0(.aal("Region"), " = ", .aavl("Region", 2), ", ", .aavl("Region", 3),
                         ", or ", .aavl("Region", 4))) &&
        identical(.aaw("Age > 30 & Smoker == 0")$text,
                  paste(.aal("Age"), "> 30 and", .aal("Smoker"), "=", .aavl("Smoker", 0))) &&
        identical(.aaw("Age > 30 | Smoker == 0 & Volunteer == 1")$text,
                  paste0(.aal("Age"), " > 30 or (", .aal("Smoker"), " = ", .aavl("Smoker", 0),
                         " and ", .aal("Volunteer"), " = ", .aavl("Volunteer", 1), ")")) &&
        isTRUE(.aaw("Age > 30 | Smoker == 0")$or) && !isTRUE(.aaw("Age > 30 & Smoker == 0")$or) &&
        identical(.aaw("Income > -50")$text, paste(.aal("Income"), ">", "\u221250")))

check("AA04 a filter it cannot put into words is written as typed: a function of a variable, a workspace object, a name the data do not hold, a value that is not typed, and any condition when there are no data to read labels from",
      identical(.aaw("nchar(RespondentID) > 3")$text, "nchar(RespondentID) > 3") &&
        identical(.aaw("Age > cutoff")$text, "Age > cutoff") &&
        identical(.aaw("Agee > 3")$text, "Agee > 3") &&
        identical(.aaw("Age > 30 & Smoker == x")$text, "Age > 30 & Smoker == x") &&
        identical(.aaw("Age >= 30", NULL)$text, "Age >= 30"))

# The filter sentence, in every table type: a stored jsubset() and the
# call's subset =, joined by "and", after N.
.aa5 <- local({
  invisible(res(jsubset(tcm, Age >= 30)))
  r <- list(
    desc = res(jdesc(tcm, Income))$val,
    freq = res(jfreq(tcm, Region))$val,
    lm   = res(jlm(WellbeingScore ~ Age, tcm))$val,
    lg   = res(jlogistic(Volunteer ~ Age, tcm))$val,
    corr = res(jcorr(tcm, Age, Income))$val,
    tt   = res(jt(Income ~ Volunteer, tcm))$val,
    aov  = res(jaov(Income ~ Region, tcm))$val,
    xt   = res(jcrosstab(Smoker ~ Volunteer, tcm))$val,
    alp  = res(jalpha(tcm, Environment1, Environment3, Environment4))$val,
    both = res(jt(Income ~ Volunteer, tcm, subset = Smoker == 0))$val)
  invisible(res(jsubset(clear.all = TRUE)))
  r
})
.aa5g <- lapply(.aa5, function(x) res(jtable(x, print = FALSE))$val$notes$general)
.aa5s <- paste0("Only cases with ", .aal("Age"), " \u2265 30 are included.")
check("AA05 the filter sentence in every table type -- descriptives, frequencies, regression, logistic, correlation, t test, ANOVA, crosstab, reliability -- after N where N is in the note (the groups' ns), else first, N after the title (ruling R59, S409), written from the stored jsubset(); with subset = in the call as well, the two joined by and",
      all(vapply(.aa5g[1:9], function(g) .aa5s %in% g, logical(1))) &&
        identical(.aa5g$desc, .aa5s) &&
        identical(res(jtable(.aa5$desc, print = FALSE))$val$caption$title,
                  paste0("Descriptive Statistics (*N* = ", sum(tcm$Age >= 30), ")")) &&
        identical(which(.aa5g$tt == .aa5s), 2L) &&
        paste0("Only cases with ", .aal("Age"), " \u2265 30 and ", .aal("Smoker"), " = ",
               .aavl("Smoker", 0), " are included.") %in% .aa5g$both)

.aa6 <- res(local({
  s <- .jst_style_apa; s$general$filter.note <- "no"
  a <- .jst_table_build_groups(list(.aa5$tt), s)$notes$general
  t1 <- res(jt(Age ~ Volunteer, tcm, subset = Region == 2))$val
  t2 <- res(jt(Income ~ Volunteer, tcm))$val
  b <- res(jtable(list(t1, t2), print = FALSE))$val$notes$general
  v <- as.numeric(tcm$Volunteer); inc <- as.numeric(haven::zap_missing(tcm$Income))
  s2 <- as.numeric(tcm$Region) == 2
  lo <- c(min(sum(v == 0 & s2), sum(v == 0 & !is.na(inc))), min(sum(v == 1 & s2), sum(v == 1 & !is.na(inc))))
  hi <- c(max(sum(v == 0 & s2), sum(v == 0 & !is.na(inc))), max(sum(v == 1 & s2), sum(v == 1 & !is.na(inc))))
  list(a = a, b = b, lo = lo, hi = hi)
}))$val
check("AA06 filter.note = no leaves the sentence out; results filtered differently get a sentence naming each filter's results, and the groups' ns vary without the words \"with missing data\"",
      !any(grepl("Only cases", .aa6$a, fixed = TRUE)) &&
        identical(.aa6$b, c(paste0("Group *n*s vary: No, ", .aa6$lo[1], " to ", .aa6$hi[1],
                                   "; Yes, ", .aa6$lo[2], " to ", .aa6$hi[2], "."),
                            paste0("Only cases with ", .aal("Region"), " = ", .aavl("Region", 2),
                                   " are included for ", .aal("Age"), "."))))

check("AA07 a cell set centered rather than on a decimal tab: one with no digit (an em dash) or any cell of a text column (an ANOVA's df); a number's parts split at its point, a cell with no point all head",
      identical(.jst_tbl_plain_cell(c("\u2014", ".62***", "", "3, 99")), c(TRUE, FALSE, FALSE, FALSE)) &&
        identical(.jst_tbl_plain_cell(c("3, 99", "3, 93"), "text"), c(TRUE, TRUE)) &&
        identical(.jst_docx_num_parts(c("12", "\u2212.07", "\u2014", "<.001")),
                  list(head = c("12", "\u2212", "\u2014", "<"), tail = c("", ".07", "", ".001"))))

# =============================================================================
# AB. The correlation table, from a jcorr() result
# =============================================================================
cat("\n--- AB. The correlation table ---\n")

.abv <- c("WellbeingScore", "Income", "Age", "CommuteTime")
.ab  <- res(jcorr(tcm, WellbeingScore, Income, Age, CommuteTime))$val
.abt <- res(jtable(.ab, print = FALSE))$val
.abz <- data.frame(lapply(tcm[.abv], function(x) as.numeric(haven::zap_missing(x))))
.abr <- stats::cor(.abz, use = "pairwise.complete.obs")
.abn <- outer(1:4, 1:4, Vectorize(function(i, j) sum(stats::complete.cases(.abz[[i]], .abz[[j]]))))
.abp <- outer(1:4, 1:4, Vectorize(function(i, j) {
  if (i == j) NA_real_ else stats::cor.test(.abz[[i]], .abz[[j]])$p.value
}))
.abf <- function(x) gsub("-", "\u2212", sub("^(-?)0\\.", "\\1.", sprintf("%.2f", x)), fixed = TRUE)
.abs <- function(p) if (p < .001) "***" else if (p < .01) "**" else if (p < .05) "*" else ""
.abl <- vapply(.abv, .aal, "")
check("AB01 the columns: the stub Variable, then n, M and SD (italic), then one column per variable headed 1 to 4 (upright); the rows numbered, each variable by its label",
      inherits(.abt, "jst_table") && identical(.abt$type, "correlation") &&
        identical(.abt$columns$key, c("stub", "n", "mean", "sd", "r1", "r2", "r3", "r4")) &&
        identical(.abt$columns$label, c("Variable", "n", "M", "SD", "1", "2", "3", "4")) &&
        identical(.abt$columns$italic, c(FALSE, TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE)) &&
        identical(vapply(.abt$rows, `[[`, "", "label"), paste0(1:4, ". ", unname(.abl))) &&
        identical(.abt$caption$title, "Descriptive Statistics and Correlations for Study Variables"))

check("AB02 the matrix: each correlation once below the diagonal, computed here from the variables' cases (declared missing values out), at two decimals without its zero, with its stars; an em dash on the diagonal; the upper triangle empty",
      all(vapply(1:4, function(i) {
        cells <- unlist(.abt$rows[[i]]$cells[paste0("r", 1:4)])
        want <- vapply(1:4, function(j) {
          if (i == j) "\u2014" else if (j < i) paste0(.abf(.abr[i, j]), .abs(.abp[i, j])) else ""
        }, "")
        identical(unname(cells), want)
      }, logical(1))) &&
        isTRUE(all.equal(.abt$rows[[4]]$raw$r1, .abr[4, 1])))

check("AB03 each variable's n, M and SD on its own cases, computed here; the mean and SD with the thousands separator; the general note gives the range of the pairwise ns when they differ; the stars' legend under it",
      all(vapply(1:4, function(i) {
        x <- .abz[[i]][!is.na(.abz[[i]])]
        c1 <- .abt$rows[[i]]$cells
        identical(c1$n, as.character(length(x))) &&
          identical(c1$mean, formatC(mean(x), format = "f", digits = 2, big.mark = ",")) &&
          identical(c1$sd, formatC(stats::sd(x), format = "f", digits = 2, big.mark = ","))
      }, logical(1))) &&
        identical(.abt$notes$general,
                  paste0("Pairwise *n*s range from ", min(.abn[lower.tri(.abn)]), " to ",
                         max(.abn[lower.tri(.abn)]), ".")) &&
        identical(.abt$notes$probability, "**p* < .05. ***p* < .01. ****p* < .001."))

.ab4 <- res(local({
  c2 <- res(jcorr(tcm, Age, WellbeingScore, CommuteTime, method = "spearman"))$val
  list(one = res(jtable(c2, print = FALSE))$val,
       none = res(jtable(.ab, columns = "none", lower.triangle = "no", r.stars = "no",
                         print = FALSE))$val,
       nometh = res(jtable(c2, method.note = "no", print = FALSE))$val,
       ttl = local({ s <- .jst_style_apa; s$general$n.position <- "title"
                     .jst_table_build_corr(list(.ab), s)[c("caption", "notes")] }))
}))$val
check("AB04 one N when every pair shares it, after the title (ruling R59, S409); a Spearman table says so in its note (method.note = no leaves it out); columns = none leaves out n, M and SD, lower.triangle = no fills both triangles, r.stars = no drops the stars and their legend; under n.position = title the pairwise range goes in the note, the title carrying no N (R59)",
      identical(.ab4$one$notes$general, "Correlations are Spearman rank correlations.") &&
        identical(.ab4$one$caption$title, "Descriptive Statistics and Correlations for Study Variables (*N* = 103)") &&
        identical(.ab4$nometh$notes$general, character(0)) &&
        identical(.ab4$none$columns$key, c("stub", "r1", "r2", "r3", "r4")) &&
        identical(.ab4$none$rows[[1]]$cells$r2, .abf(.abr[1, 2])) &&
        identical(.ab4$none$rows[[2]]$cells$r1, .abf(.abr[2, 1])) &&
        identical(.ab4$none$notes$probability, character(0)) &&
        identical(.ab4$ttl$caption$title, "Descriptive Statistics and Correlations for Study Variables") &&
        identical(.ab4$ttl$notes$general, paste0("Pairwise *n*s range from ", min(.abn[lower.tri(.abn)]),
                                                 " to ", max(.abn[lower.tri(.abn)]), ".")))

.ab5a <- res(jtable(list(.ab, .ab), print = FALSE))
.ab5b <- res(jtable(.ab, headings = list(A = Age), print = FALSE))
.ab5c <- res(jtable(.ab, markers = list("Mean-centered" = Income), print = FALSE))$val
check("AB05 each jcorr() result a table of its own (ruling R54): two stop, with the lines that make each table (S406, ruling R56); headings = stops; markers = marks a variable's row",
      is.null(.ab5a$val) &&
        grepl(paste0("[error] jtable(): each jcorr() result is a table of its own.\n",
                     "To correlate more variables in one table, name them in one jcorr() call.\n", "Make each table in a call of its own, then give the tables together to write\nthem to one file:\n",
                     "  ", .tn[1], " <- jtable(.ab)\n  ", .tn[2], " <- jtable(.ab)\n",
                     "  jtable(list(", .tn[1], ", ", .tn[2], "), file = \"Tables.docx\", print = FALSE)"), .ab5a$txt, fixed = TRUE) &&
        is.null(.ab5b$val) &&
        grepl("[error] jtable(): headings = puts the variables of a descriptives or\nfrequency table under role headings; a correlation table lists its variables\nin the result's order.", .ab5b$txt, fixed = TRUE) &&
        identical(.ab5c$rows[[2]]$marks, "a") &&
        identical(.ab5c$notes$specific, list(list(mark = "a", text = "Mean-centered"))))

# =============================================================================
# AC. The t-test table, from jt() results
# =============================================================================
cat("\n--- AC. The t-test table ---\n")

.acv <- c("WellbeingScore", "Age", "CommuteTime")
.ac  <- lapply(.acv, function(o) res(jt(stats::as.formula(paste(o, "~ Volunteer")), tcm))$val)
.act <- res(jtable(.ac, print = FALSE))$val
.acg <- as.numeric(tcm$Volunteer)
.ace <- lapply(.acv, function(o) {
  y <- as.numeric(haven::zap_missing(tcm[[o]]))
  a <- y[.acg == 0 & !is.na(y)]; b <- y[.acg == 1 & !is.na(y)]
  tt <- stats::t.test(a, b, var.equal = TRUE)
  sp <- sqrt(((length(a) - 1) * stats::var(a) + (length(b) - 1) * stats::var(b)) /
               (length(a) + length(b) - 2))
  list(n = c(length(a), length(b)), m = c(mean(a), mean(b)), s = c(stats::sd(a), stats::sd(b)),
       t = unname(tt$statistic), df = unname(tt$parameter), p = tt$p.value,
       d = (mean(a) - mean(b)) / sp)
})
.acn <- function(x) gsub("-", "\u2212", sprintf("%.2f", x), fixed = TRUE)
.acp <- function(p) if (p < .001) "<.001" else sub("^0", "", sprintf("%.3f", p))
check("AC01 one row per outcome by its label, under the grouping variable's label over the groups, each group's value label over its M and SD (italic); t with its df in the head (*t*(101), shared by every row), p and d; the title names the grouping variable",
      inherits(.act, "jst_table") && identical(.act$type, "ttest") &&
        identical(.act$columns$key, c("stub", "g1.mean", "g1.sd", "g2.mean", "g2.sd", "t", "p", "d")) &&
        identical(.act$columns$label, c("Variable", "M", "SD", "M", "SD", "*t*(101)", "p", "d")) &&
        identical(.act$columns$italic, c(FALSE, TRUE, TRUE, TRUE, TRUE, FALSE, TRUE, TRUE)) &&
        identical(lapply(.act$spanners, function(s) vapply(s, function(z) paste(z$label, z$from, z$to), "")),
                  list(paste(.aal("Volunteer"), 2, 5),
                       c(paste(.aavl("Volunteer", 0), 2, 3), paste(.aavl("Volunteer", 1), 4, 5)))) &&
        identical(vapply(.act$rows, `[[`, "", "label"), unname(vapply(.acv, .aal, ""))) &&
        identical(.act$caption$title, paste("Means, Standard Deviations, and t Tests by", .aal("Volunteer"))))

check("AC02 the cells, computed here from the data: each group's M and SD; Student's t, its p exact without the zero, and Cohen's d on the pooled SD with its zero (the first group's mean minus the second's); the groups' ns in the general note",
      all(vapply(seq_along(.acv), function(i) {
        e <- .ace[[i]]; c1 <- .act$rows[[i]]$cells
        identical(unname(unlist(c1[c("g1.mean", "g1.sd", "g2.mean", "g2.sd")])),
                  .acn(c(e$m[1], e$s[1], e$m[2], e$s[2]))) &&
          identical(c1$t, .acn(e$t)) && identical(c1$p, .acp(e$p)) && identical(c1$d, .acn(e$d)) &&
          isTRUE(all.equal(.act$rows[[i]]$raw$t, e$t)) && e$df == 101
      }, logical(1))) &&
        identical(.act$notes$general,
                  paste0("*n* = ", .ace[[1]]$n[1], " (", .aavl("Volunteer", 0), ") and ",
                         .ace[[1]]$n[2], " (", .aavl("Volunteer", 1), ").")))

.ac3 <- local({
  ti <- res(jt(Income ~ Volunteer, tcm))$val
  tw <- res(jt(WellbeingScore ~ Volunteer, tcm, welch = TRUE))$val
  y <- as.numeric(haven::zap_missing(tcm$Income))
  list(t = res(jtable(list(.ac[[2]], ti, tw), columns = c("n", "mean", "sd", "t", "p", "d", "diff", "ci"),
                      ci.style = "two", print = FALSE))$val,
       one = res(jtable(list(.ac[[2]]), columns = c("mean", "sd", "t", "p", "ci"), print = FALSE))$val,
       inc_df = unname(stats::t.test(y[.acg == 0], y[.acg == 1], var.equal = TRUE)$parameter),
       wdf = unname(stats::t.test(as.numeric(tcm$WellbeingScore)[.acg == 0],
                                  as.numeric(tcm$WellbeingScore)[.acg == 1])$parameter))
})
check("AC03 rows of different df get a df column (Welch's at two decimals) and t its plain head; each group's n under it with columns = n; the mean difference and its CI in two columns under the 95% CI spanner; a Welch test said in the note; ci.style one brackets the CI",
      identical(.ac3$t$columns$key, c("stub", "g1.n", "g1.mean", "g1.sd", "g2.n", "g2.mean", "g2.sd",
                                      "t", "df", "p", "d", "diff", "ci.lower", "ci.upper")) &&
        identical(.ac3$t$columns$label[8:14], c("t", "df", "p", "d", "Mean difference", "LL", "UL")) &&
        identical(.ac3$t$columns$italic[8:9], c(TRUE, TRUE)) &&
        identical(vapply(.ac3$t$rows, function(r) r$cells$df, ""),
                  c("101", as.character(.ac3$inc_df), sprintf("%.2f", .ac3$wdf))) &&
        identical(vapply(.ac3$t$spanners[[2]], `[[`, "", "label"), c("No", "Yes", "95% CI")) &&
        identical(.ac3$t$notes$general,
                  paste0("The *t* test for ", .aal("WellbeingScore"),
                         " did not assume equal variances (Welch's *t* test).")) &&
        grepl("^\\[\u2212[0-9]+\\.[0-9]{2}, \u2212[0-9]+\\.[0-9]{2}\\]$", .ac3$one$rows[[1]]$cells$ci))

.ac4 <- res(local({
  w <- data.frame(Y = c(12, 15, 11, 18, 14, 16, 10, 19, 13, 17, 12, 20), G = rep(c(1, 2), 6))
  tp <- res(jt(Y ~ G, w, paired = TRUE))$val
  s <- .jst_style_apa; s$general$n.position <- "title"
  list(p = res(jtable(tp, print = FALSE))$val$notes$general,
       pn = res(jtable(tp, test.note = "no", print = FALSE))$val$notes$general,
       ttl = .jst_table_build_groups(.ac, s)[c("caption", "notes")],
       nte = local({ s$general$n.position <- "note"
                     .jst_table_build_groups(.ac, s)[c("caption", "notes")] }),
       nosp = res(jtable(.ac, group.spanner = "no", title = "My {group}", print = FALSE))$val)
}))$val
check("AC04 a paired test said in the note, d named as dz (test.note = no leaves it out), the groups' ns in the note under apa's title (ruling R59, S409), equal ns too; n.position = title gives the groups' ns in the note as note does, and no N after the title (R59); group.spanner = no drops the grouping variable's label, the groups' spanners kept; a title given in the call is the call's",
      identical(.ac4$p, c("*n* = 6 (1) and 6 (2).",
                          "The *t* test is a paired-samples test; *d* is Cohen's *d*z, computed from the differences.")) &&
        identical(.ac4$pn, "*n* = 6 (1) and 6 (2).") &&
        identical(.ac4$ttl$caption$title, paste("Means, Standard Deviations, and t Tests by", .aal("Volunteer"))) &&
        identical(.ac4$ttl$notes$general, "*n* = 54 (No) and 49 (Yes).") &&
        identical(.ac4$ttl, .ac4$nte) &&
        length(.ac4$nosp$spanners) == 1L &&
        identical(vapply(.ac4$nosp$spanners[[1]], `[[`, "", "label"), c("No", "Yes")) &&
        identical(.ac4$nosp$caption$title, "My {group}"))

.ac5 <- list(
  grp  = res(jtable(list(.ac[[1]], res(jt(Income ~ Smoker, tcm))$val), print = FALSE)),
  kind = res(jtable(list(.ac[[1]], res(jaov(Age ~ Region, tcm))$val), print = FALSE)),
  twice = res(jtable(list(.ac[[2]], .ac[[2]]), print = FALSE)),
  head = res(jtable(.ac[[1]], headings = list(A = WellbeingScore), print = FALSE)),
  set  = res(jtable(.ac[[1]], total = "no", print = FALSE)),
  cols = res(jtable(.ac[[1]], columns = c("t", "f"), print = FALSE)))
check("AC05 the stops: results of two grouping variables and results of two kinds (ruling R56, S406: one call makes one table; the stop gives the lines that make each), an outcome twice, headings =, another table type's setting, a column the t-test table does not have",
      all(vapply(.ac5, function(x) is.null(x$val), logical(1))) &&
        grepl(paste0("[error] jtable(): jt() results of different grouping variables\n(Volunteer and Smoker) cannot share a table.\n", "Make each table in a call of its own, then give the tables together to write\nthem to one file:\n",
                     "  ", .tn[1], " <- jtable(.ac[[1]])\n  ", .tn[2], " <- jtable(res(jt(Income ~ Smoker, tcm))$val)\n",
                     "  jtable(list(", .tn[1], ", ", .tn[2], "), file = \"Tables.docx\", print = FALSE)"), .ac5$grp$txt, fixed = TRUE) &&
        grepl(paste0("[error] jtable(): results of different kinds (jt() and jaov()) cannot\nshare a table.\n", "Make each table in a call of its own, then give the tables together to write\nthem to one file:\n",
                     "  ", .tn[1], " <- jtable(.ac[[1]])\n  ", .tn[2], " <- jtable(res(jaov(Age ~ Region, tcm))$val)\n",
                     "  jtable(list(", .tn[1], ", ", .tn[2], "), file = \"Tables.docx\", print = FALSE)"), .ac5$kind$txt, fixed = TRUE) &&
        grepl("[error] jtable(): Age is in more than one of the results.\nA table lists each variable once.", .ac5$twice$txt, fixed = TRUE) &&
        grepl("[error] jtable(): headings = puts the variables of a descriptives or\nfrequency table under role headings; a t-test table lists its outcomes in\nthe order given.", .ac5$head$txt, fixed = TRUE) &&
        grepl("[error] jtable(): total = is a setting of a crosstab, and this table is a\nt-test table.", .ac5$set$txt, fixed = TRUE) &&
        grepl("[error] jtable(): `columns` must be columns of a t-test table, each named\nonce: \"n\", \"mean\", \"sd\", \"t\", \"p\", \"d\", \"diff\", or \"ci\".", .ac5$cols$txt, fixed = TRUE))

# =============================================================================
# AD. The ANOVA table, from jaov() results
# =============================================================================
cat("\n--- AD. The ANOVA table ---\n")

.adv <- c("WellbeingScore", "Education", "CommuteTime")
.ad  <- lapply(.adv, function(o) res(jaov(stats::as.formula(paste(o, "~ Region")), tcm))$val)
.adt <- res(jtable(.ad, print = FALSE))$val
.adg <- as.numeric(tcm$Region)
.ade <- lapply(.adv, function(o) {
  y <- as.numeric(haven::zap_missing(tcm[[o]])); ok <- !is.na(y)
  f <- stats::aov(y[ok] ~ factor(.adg[ok])); tb <- summary(f)[[1]]
  list(n = as.vector(table(factor(.adg[ok], levels = 1:4))),
       m = as.vector(tapply(y[ok], factor(.adg[ok], levels = 1:4), mean)),
       s = as.vector(tapply(y[ok], factor(.adg[ok], levels = 1:4), stats::sd)),
       f = tb[["F value"]][1], df = tb[["Df"]], p = tb[["Pr(>F)"]][1],
       eta2 = tb[["Sum Sq"]][1] / sum(tb[["Sum Sq"]]))
})
check("AD01 one row per outcome: each region's M and SD under its value label, in code order, under the grouping variable's label; F, a df column (the rows' df differ), p and eta2 (the Greek letter, upright), computed here from base R's aov(); the df column is text, centered",
      inherits(.adt, "jst_table") && identical(.adt$type, "anova") &&
        identical(.adt$columns$key, c("stub", paste0("g", rep(1:4, each = 2), c(".mean", ".sd")),
                                      "f", "df", "p", "eta2")) &&
        identical(.adt$columns$label[10:13], c("F", "df", "p", "\u03b7\u00b2")) &&
        identical(.adt$columns$italic[10:13], c(TRUE, TRUE, TRUE, FALSE)) &&
        identical(.adt$columns$kind[11], "text") &&
        identical(vapply(.adt$spanners[[2]], `[[`, "", "label"),
                  unname(vapply(1:4, function(k) .aavl("Region", k), ""))) &&
        all(vapply(seq_along(.adv), function(i) {
          e <- .ade[[i]]; c1 <- .adt$rows[[i]]$cells
          identical(unname(unlist(c1[paste0("g", 1:4, ".mean")])), .acn(e$m)) &&
            identical(unname(unlist(c1[paste0("g", 1:4, ".sd")])), .acn(e$s)) &&
            identical(c1$f, .acn(e$f)) && identical(c1$df, paste0(e$df[1], ", ", e$df[2])) &&
            identical(c1$p, .acp(e$p)) && identical(c1$eta2, sub("^0", "", sprintf("%.2f", e$eta2)))
        }, logical(1))) &&
        identical(.adt$caption$title,
                  paste("Means, Standard Deviations, and One-Way Analyses of Variance by", .aal("Region"))))

.ad2 <- res(local({
  lo <- apply(sapply(.ade, `[[`, "n"), 1, min); hi <- apply(sapply(.ade, `[[`, "n"), 1, max)
  rng <- ifelse(lo == hi, lo, paste(lo, "to", hi))
  list(shared = res(jtable(list(.ad[[1]], .ad[[3]]), print = FALSE))$val,
       want = paste0("Group *n*s vary with missing data: ",
                     paste0(vapply(1:4, function(k) .aavl("Region", k), ""), ", ", rng, collapse = "; "), "."),
       welch = res(jtable(res(jaov(WellbeingScore ~ Region, tcm, welch = TRUE))$val, print = FALSE))$val)
}))$val
check("AD02 the groups' ns vary with missing data: each region's range in the note; rows sharing their df put them in F's head (*F*(3, 99), no df column); a Welch analysis said in the note, its df at two decimals in the head",
      identical(.adt$notes$general, .ad2$want) &&
        identical(.ad2$shared$columns$label[10], "*F*(3, 99)") &&
        !"df" %in% .ad2$shared$columns$key &&
        identical(.ad2$shared$notes$general, "*n* = 27 (North), 20 (South), 31 (East), and 25 (West).") &&
        grepl("^\\*F\\*\\(3, [0-9]+\\.[0-9]{2}\\)$", .ad2$welch$columns$label[10]) &&
        identical(.ad2$welch$notes$general[2],
                  "The analysis of variance did not assume equal variances (Welch's *F* test)."))

.ad3 <- res(local({
  t2 <- res(jtable(list(.ad[[1]], res(jaov(Income ~ Region, tcm))$val), print = FALSE))$val
  inc <- as.numeric(haven::zap_missing(tcm$Income))
  n1 <- as.vector(table(factor(.adg, levels = 1:4)))
  n2 <- as.vector(table(factor(.adg[!is.na(inc)], levels = 1:4)))
  lo <- pmin(n1, n2); hi <- pmax(n1, n2)
  list(t = t2, same = any(lo == hi),
       want = paste0("Group *n*s vary with missing data: ",
                     paste0(vapply(1:4, function(k) .aavl("Region", k), ""), ", ",
                            ifelse(lo == hi, lo, paste(lo, "to", hi)), collapse = "; "), "."))
}))$val
check("AD03 where the groups' ns vary, a group whose n is the same in every row is given its one n, the others their ranges (computed here)",
      isTRUE(.ad3$same) && identical(.ad3$t$notes$general, .ad3$want))

# =============================================================================
# AE. The crosstab, from jcrosstab() results
# =============================================================================
cat("\n--- AE. The crosstab ---\n")

.aev <- c("Smoker", "OwnsHome", "Region")
.ae  <- lapply(.aev, function(o) res(jcrosstab(stats::as.formula(paste(o, "~ Volunteer")), tcm))$val)
.aet <- res(jtable(.ae, print = FALSE))$val
.aee <- lapply(.aev, function(o) {
  y <- as.numeric(haven::zap_missing(tcm[[o]])); ok <- !is.na(y)
  lv <- sort(unique(y[ok]))
  obs <- table(factor(y[ok], levels = lv), factor(.acg[ok], levels = c(0, 1)))
  ct <- suppressWarnings(stats::chisq.test(obs, correct = FALSE))
  N <- sum(obs)
  list(obs = unclass(obs), lv = lv, N = N, x2 = unname(ct$statistic), df = unname(ct$parameter),
       p = ct$p.value, v = sqrt(unname(ct$statistic) / (N * (min(dim(obs)) - 1))))
})
.aepc <- function(x) sprintf("%.1f", x)
check("AE01 each row variable's label a row of its own carrying its test -- chi2, df, p and V, computed here by chisq.test() without Yates's correction, chi2 at two decimals with its zero, V without -- its categories indented under it by their value labels; the grouping variable's label over the groups, each over n and %, then the Total",
      inherits(.aet, "jst_table") && identical(.aet$type, "crosstab") &&
        identical(.aet$columns$key, c("stub", "g1.n", "g1.percent", "g2.n", "g2.percent", "tot.n",
                                      "tot.percent", "chisq", "df", "p", "v")) &&
        identical(.aet$columns$label, c("Variable", "n", "%", "n", "%", "n", "%", "\u03c7\u00b2", "df", "p", "V")) &&
        identical(.aet$columns$italic, c(FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE, TRUE, TRUE, TRUE)) &&
        identical(lapply(.aet$spanners, function(s) vapply(s, `[[`, "", "label")),
                  list(.aal("Volunteer"), c("No", "Yes", "Total"))) &&
        identical(vapply(.aet$rows, `[[`, "", "label"),
                  c(.aal("Smoker"), "No", "Yes", .aal("OwnsHome"), "Yes", "No", .aal("Region"),
                    "North", "South", "East", "West")) &&
        identical(vapply(.aet$rows, `[[`, integer(1), "indent"), c(0L, 1L, 1L, 0L, 1L, 1L, 0L, 1L, 1L, 1L, 1L)) &&
        all(vapply(1:3, function(i) {
          e <- .aee[[i]]; r <- .aet$rows[[c(1, 4, 7)[i]]]
          identical(r$level, "variable") &&
            identical(unname(unlist(r$cells[c("chisq", "df", "p", "v")])),
                      c(sprintf("%.2f", e$x2), as.character(e$df), .acp(e$p), sub("^0", "", sprintf("%.2f", e$v)))) &&
            identical(r$cells$g1.n, "")
        }, logical(1))))

check("AE02 the cells, computed here: each category's n in each group, its percentage within the group at one decimal (column percentages), the Total's n and percentage of all cases; N differs by variable in the note, equal Ns grouped",
      all(vapply(1:3, function(i) {
        e <- .aee[[i]]; first <- c(2, 5, 8)[i]
        all(vapply(seq_along(e$lv), function(a) {
          c1 <- .aet$rows[[first + a - 1L]]$cells
          identical(c(c1$g1.n, c1$g2.n), as.character(e$obs[a, ])) &&
            identical(c(c1$g1.percent, c1$g2.percent), .aepc(100 * e$obs[a, ] / colSums(e$obs))) &&
            identical(c1$tot.n, as.character(sum(e$obs[a, ]))) &&
            identical(c1$tot.percent, .aepc(100 * sum(e$obs[a, ]) / e$N))
        }, logical(1)))
      }, logical(1))) &&
        identical(.aet$notes$general,
                  paste0("*N* differs by variable: ", .aee[[1]]$N, " (", .aal("Smoker"), "), ",
                         .aee[[2]]$N, " (", .aal("OwnsHome"), " and ", .aal("Region"), ").")) &&
        identical(.aet$caption$title, paste("Frequencies and Percentages by", .aal("Volunteer"))))

.ae3 <- local({
  e <- .aee[[2]]
  list(row   = res(jtable(.ae[[2]], percent.base = "row", print = FALSE))$val,
       notot = res(jtable(.ae[[2]], total = "no", print = FALSE))$val,
       tot   = res(jtable(.ae[[2]], percent.base = "total", test.columns = "none", print = FALSE))$val,
       st    = res(jtable(.ae[[2]], test.columns = c("chisq", "df", "v"), print = FALSE))$val,
       chi   = res(jcrosstab(OwnsHome ~ Volunteer, tcm, chisq = TRUE))$val,
       e = e)
})
.ae3st <- res(local({ s <- .jst_style_apa; s$general$p.format <- "stars"
                      .jst_table_build_crosstab(list(.ae[[2]]), s) }))$val
check("AE03 percent.base = row (each category's percentages within it, its Total 100) and total (of all cases); total = no drops the Total; test.columns = none drops the test; a test with no p column carries its stars under p.format = stars; a result made with chisq = TRUE gives the test jcrosstab() reported",
      identical(c(.ae3$row$rows[[2]]$cells$g1.percent, .ae3$row$rows[[2]]$cells$g2.percent,
                  .ae3$row$rows[[2]]$cells$tot.percent),
                c(.aepc(100 * .ae3$e$obs[1, ] / sum(.ae3$e$obs[1, ])), "100.0")) &&
        identical(.ae3$notot$columns$key, c("stub", "g1.n", "g1.percent", "g2.n", "g2.percent", "chisq", "df", "p", "v")) &&
        identical(vapply(.ae3$notot$spanners[[2]], `[[`, "", "label"), c("No", "Yes")) &&
        identical(.ae3$tot$columns$key, c("stub", "g1.n", "g1.percent", "g2.n", "g2.percent", "tot.n", "tot.percent")) &&
        identical(.ae3$tot$rows[[2]]$cells$g1.percent, .aepc(100 * .ae3$e$obs[1, 1] / .ae3$e$N)) &&
        identical(.ae3$st$rows[[1]]$cells$chisq, sprintf("%.2f", .ae3$e$x2)) &&
        identical(.ae3st$rows[[1]]$cells$p, "*") &&
        isTRUE(all.equal(unname(.ae3$chi$chi_square), .ae3$e$x2)) &&
        identical(res(jtable(.ae3$chi, print = FALSE))$val$rows[[1]]$cells,
                  res(jtable(.ae[[2]], print = FALSE))$val$rows[[1]]$cells))

.ae4 <- list(
  col = res(jtable(list(.ae[[1]], res(jcrosstab(Smoker ~ OwnsHome, tcm))$val), print = FALSE)),
  cat = res(jtable(list(res(jcrosstab(Smoker ~ Region, tcm))$val,
                        res(jcrosstab(OwnsHome ~ Region, tcm, subset = Region != 4))$val), print = FALSE)))
check("AE04 the stops: crosstabs of two column variables, and of one column variable whose categories differ (ruling R56, S406: with the lines that make each table)",
      is.null(.ae4$col$val) && is.null(.ae4$cat$val) &&
        grepl(paste0("[error] jtable(): jcrosstab() results with different column variables\n(Volunteer and OwnsHome) cannot share a table.\n", "Make each table in a call of its own, then give the tables together to write\nthem to one file:\n",
                     "  ", .tn[1], " <- jtable(.ae[[1]])\n  ", .tn[2], " <- jtable(res(jcrosstab(Smoker ~ OwnsHome, tcm))$val)\n",
                     "  jtable(list(", .tn[1], ", ", .tn[2], "), file = \"Tables.docx\", print = FALSE)"), .ae4$col$txt, fixed = TRUE) &&
        grepl(paste0("[error] jtable(): the jcrosstab() results hold different categories of\n",
                     "Region (North, South, East, and West; North, South, and East), so they\n",
                     "cannot share a table.\n", "Make each table in a call of its own, then give the tables together to write\nthem to one file:\n",
                     "  ", .tn[1], " <- jtable(res(jcrosstab(Smoker ~ Region, tcm))$val)\n  ", .tn[2], " <- jtable(res(jcrosstab(OwnsHome ~ Region, tcm, subset = Region != 4))$val)\n",
                     "  jtable(list(", .tn[1], ", ", .tn[2], "), file = \"Tables.docx\", print = FALSE)"), .ae4$cat$txt, fixed = TRUE))

.ae5 <- res(local({
  r <- res(jcrosstab(Region ~ Education, tcm))$val
  y <- as.numeric(tcm$Region); x <- as.numeric(haven::zap_missing(tcm$Education)); ok <- !is.na(x)
  obs <- table(y[ok], x[ok]); ct <- suppressWarnings(stats::chisq.test(obs, correct = FALSE))
  list(t = res(jtable(r, print = FALSE))$val, df = unname(ct$parameter),
       v = sqrt(unname(ct$statistic) / (sum(obs) * (min(dim(obs)) - 1))))
}))$val
check("AE05 Cramer's V on a table of more than two columns divides chi2 by N times the smaller dimension less one (computed here on a 4 x 5 table); the five groups and the Total across the top",
      identical(.ae5$t$rows[[1]]$cells$v, sub("^0", "", sprintf("%.2f", .ae5$v))) &&
        identical(.ae5$t$rows[[1]]$cells$df, as.character(.ae5$df)) &&
        identical(length(.ae5$t$spanners[[2]]), 6L))

# =============================================================================
# AF. The reliability table, from jalpha() results
# =============================================================================
cat("\n--- AF. The reliability table ---\n")

tre <- tcm
tre$Environment2R <- res(jrecode(tre, Environment2, map = "1=5; 2=4; 3=3; 4=2; 5=1"))$val
attr(tre$Environment2R, "label") <- "Concern about the environment is exaggerated (reversed)."
.afv <- c("Environment1", "Environment2R", "Environment3", "Environment4", "Environment5")
invisible(res(jsubset(tre, Age >= 30)))
.af  <- res(jalpha(tre, Environment1, Environment2R, Environment3, Environment4, Environment5))$val
invisible(res(jsubset(clear.all = TRUE)))
.aft <- res(jtable(.af, print = FALSE))$val
.afe <- res(local({
  x <- data.frame(lapply(tre[.afv], function(v) as.numeric(haven::zap_missing(v))))
  x <- x[tre$Age >= 30, ]; x <- x[stats::complete.cases(x), ]
  k <- ncol(x); tot <- rowSums(x)
  alpha <- function(m) (ncol(m) / (ncol(m) - 1)) * (1 - sum(apply(m, 2, stats::var)) / stats::var(rowSums(m)))
  list(N = nrow(x), m = colMeans(x), s = apply(x, 2, stats::sd),
       r = vapply(1:k, function(i) stats::cor(x[[i]], tot - x[[i]]), 0),
       ad = vapply(1:k, function(i) alpha(x[, -i]), 0), a = alpha(x))
}))$val
.afb <- function(x) sub("^0", "", sprintf("%.2f", x))
check("AF01 one row per item by its label (the item's wording), under the stub Item; M and SD (italic), item-total r (its head with markup) and alpha if item deleted (upright), computed here on the filtered complete cases: the correlation with the sum of the other items, alpha without the item, each without its zero",
      inherits(.aft, "jst_table") && identical(.aft$type, "reliability") &&
        identical(.aft$columns$key, c("stub", "mean", "sd", "item.total", "alpha.if.deleted")) &&
        identical(.aft$columns$label, c("Item", "M", "SD", "Item-total *r*", "\u03b1 if item deleted")) &&
        identical(.aft$columns$italic, c(FALSE, TRUE, TRUE, FALSE, FALSE)) &&
        identical(vapply(.aft$rows, `[[`, "", "label"),
                  unname(vapply(.afv, function(v) attr(tre[[v]], "label", exact = TRUE), ""))) &&
        all(vapply(seq_along(.afv), function(i) {
          c1 <- .aft$rows[[i]]$cells
          identical(c(c1$mean, c1$sd), .acn(c(.afe$m[i], .afe$s[i]))) &&
            identical(c1$item.total, .afb(.afe$r[i])) && identical(c1$alpha.if.deleted, .afb(.afe$ad[i]))
        }, logical(1))) &&
        identical(.aft$caption$title, paste0("Item Statistics and Reliability (*N* = ", .afe$N, ")")))

check("AF02 the general note: the filter (N after the title since ruling R59, S409), Cronbach's alpha computed here, and what item-total r is",
      identical(.aft$notes$general,
                c(paste0("Only cases with ", .aal("Age"), " \u2265 30 are included."),
                  paste0("Cronbach's \u03b1 = ", .afb(.afe$a), "."),
                  "Item-total *r* is each item's correlation with the sum of the other items.")))

.af3 <- local({
  a1 <- res(jalpha(tre, Environment1, Environment2R, Environment3))$val
  a2 <- res(jalpha(tre, Environment4, Environment5))$val
  n1 <- sum(stats::complete.cases(data.frame(lapply(tre[.afv[1:3]], function(v) {
    as.numeric(haven::zap_missing(v))
  }))))
  list(a1 = a1, a2 = a2, n1 = n1,
       two = res(jtable(list("Concern" = a1, "Action" = a2),
                        markers = list("Reverse-scored" = Environment2R), print = FALSE))$val,
       bare = res(jtable(list(a1, a2), alpha = "no", item.total.note = "no", print = FALSE))$val,
       twice = res(jtable(list(a1, a1), print = FALSE)))
})
check("AF03 several scales stack, each under its name with its alpha (a named list's names; Scale 1, Scale 2 when unnamed), the items indented; N by scale where the scales' Ns differ; markers = marks an item; alpha = no and item.total.note = no leave the alphas and the definition out; an item in two results stops",
      identical(vapply(.af3$two$rows, `[[`, "", "label")[c(1, 5)],
                c(paste0("Concern (\u03b1 = ", .afb(.af3$a1$alpha), ")"),
                  paste0("Action (\u03b1 = ", .afb(.af3$a2$alpha), ")"))) &&
        identical(vapply(.af3$two$rows, `[[`, "", "kind")[c(1, 2, 5)], c("heading", "data", "heading")) &&
        identical(vapply(.af3$two$rows, `[[`, integer(1), "indent")[c(1, 2, 5, 6)], c(0L, 1L, 0L, 1L)) &&
        identical(.af3$two$rows[[3]]$marks, "a") &&
        identical(.af3$two$notes$general[1],
                  paste0("*N* differs by scale: ", .af3$n1, " (Concern), 103 (Action).")) &&
        !any(grepl("Cronbach", .af3$two$notes$general)) &&
        identical(vapply(.af3$bare$rows, `[[`, "", "label")[c(1, 5)], c("Scale 1", "Scale 2")) &&
        identical(.af3$bare$notes$general,
                  paste0("*N* differs by scale: ", .af3$n1, " (Scale 1), 103 (Scale 2).")) &&
        is.null(.af3$twice$val) &&
        grepl("[error] jtable(): Environment1, Environment2R, and Environment3 are in more\nthan one of the results.\nA table lists each variable once.", .af3$twice$txt, fixed = TRUE))

# =============================================================================
# AG. The previews of the five tables, pinned whole
# =============================================================================
cat("\n--- AG. The five previews ---\n")

.ag1_pin <- c(
  "Table 1",
  "Descriptive Statistics and Correlations for Study Variables",
  "----------------------------------------------------------------------------------",
  "Variable                          n       M          SD        1       2     3   4",
  "----------------------------------------------------------------------------------",
  "1. Wellbeing score (0-100)       103      50.89      11.48     \u2014",
  "2. Annual income (USD)            97  49,855.67  17,427.22   .62***    \u2014",
  "3. Age (years)                   103      40.65      11.62   .34***  .29**   \u2014",
  "4. Daily commute time (minutes)  103      30.74      12.68  -.07     .01    .07  \u2014",
  "----------------------------------------------------------------------------------",
  "Note. Pairwise ns range from 97 to 103.",
  "*p < .05. **p < .01. ***p < .001.")
.ag2_pin <- c(
  "Table 1",
  "Means, Standard Deviations, and t Tests by Volunteered in past year",
  "-----------------------------------------------------------------------------",
  "                               Volunteered in past year",
  "                                   No            Yes",
  "Variable                        M      SD     M      SD   t(101)    p     d",
  "-----------------------------------------------------------------------------",
  "Wellbeing score (0-100)       47.46  11.70  54.67  10.06   -3.34  .001  -0.66",
  "Age (years)                   37.41  11.24  44.22  11.07   -3.10  .003  -0.61",
  "Daily commute time (minutes)  29.35  11.16  32.27  14.13   -1.17  .246  -0.23",
  "-----------------------------------------------------------------------------",
  "Note. n = 54 (No) and 49 (Yes).")
.ag3_pin <- c(
  "Table 1",
  "Means, Standard Deviations, and One-Way Analyses of Variance by Region of residence",
  "------------------------------------------------------------------------------------------------------------",
  "                                                Region of residence",
  "                                  North         South         East          West",
  "Variable                        M      SD     M      SD     M      SD     M      SD     F     df     p    \u03b7\u00b2",
  "------------------------------------------------------------------------------------------------------------",
  "Wellbeing score (0-100)       52.96  10.15  48.15  14.74  50.94   9.94  50.80  11.92  0.67  3, 99  .574  .02",
  "Highest education level        3.04   1.40   2.47   1.22   2.79   1.45   3.00   1.57  0.69  3, 93  .558  .02",
  "Daily commute time (minutes)  29.00  14.15  28.20   7.98  33.39  13.35  31.36  13.24  0.90  3, 99  .442  .03",
  "------------------------------------------------------------------------------------------------------------",
  "Note. Group ns vary with missing data: North, 26 to 27; South, 19 to 20;",
  "East, 29 to 31; West, 23 to 25.")
.ag4_pin <- c(
  "Table 1",
  "Frequencies and Percentages by Volunteered in past year",
  "----------------------------------------------------------------------------",
  "                     Volunteered in past year",
  "                          No           Yes       Total",
  "Variable               n      %     n     %     n    %    \u03c7\u00b2   df    p    V",
  "----------------------------------------------------------------------------",
  "Current smoker                                           0.04   1  .834  .02",
  "  No                   34    65.4   31   67.4  65  66.3",
  "  Yes                  18    34.6   15   32.6  33  33.7",
  "Owns home                                                5.95   1  .015  .24",
  "  Yes                  19    35.2   29   59.2  48  46.6",
  "  No                   35    64.8   20   40.8  55  53.4",
  "Region of residence                                      2.89   3  .409  .17",
  "  North                14    25.9   13   26.5  27  26.2",
  "  South                13    24.1    7   14.3  20  19.4",
  "  East                 17    31.5   14   28.6  31  30.1",
  "  West                 10    18.5   15   30.6  25  24.3",
  "----------------------------------------------------------------------------",
  "Note. N differs by variable: 98 (Current smoker), 103",
  "(Owns home and Region of residence).")
.ag5_pin <- c(
  "Table 1",
  "Item Statistics and Reliability (N = 72)",
  "-----------------------------------------------------------------------------------------------------",
  "Item                                                        M    SD   Item-total r  \u03b1 if item deleted",
  "-----------------------------------------------------------------------------------------------------",
  "Climate change is a serious threat.                       3.15  1.16           .67                .80",
  "Concern about the environment is exaggerated (reversed).  3.15  1.19           .72                .79",
  "Government should do more for the environment.            3.10  1.27           .74                .78",
  "I would pay more for environmentally friendly products.   3.39  1.22           .71                .79",
  "Pollution is a major cause of public health problems.     2.74  1.45           .44                .87",
  "-----------------------------------------------------------------------------------------------------",
  "Note. Only cases with Age (years) \u2265 30 are included. Cronbach's \u03b1 = .84.",
  "Item-total r is each item's correlation with the sum of the other items.")

.agl <- function(x) strsplit(x$txt, "\n", fixed = TRUE)[[1]]
.ag1 <- res(print(.abt)); .ag2 <- res(print(.act)); .ag3 <- res(print(.adt))
.ag4 <- res(print(.aet)); .ag5 <- res(print(.aft))
check("AG01 the correlation table's preview, pinned whole (the S404 sketch's Table 1): the numbered rows, n, M and SD, the matrix on its points with each r's stars hanging right, an em dash centered on the diagonal, the pairwise ns and the stars' legend",
      identical(.agl(.ag1), .ag1_pin) && endsWith(.ag1$txt, "***p < .001.\n"))
check("AG02 the t-test table's preview, pinned whole (Table 2): the grouping variable's label over the groups, each group over its M and SD, t(101) in the head, the minus as a hyphen, the groups' ns in the note",
      identical(.agl(.ag2), .ag2_pin) && endsWith(.ag2$txt, "49 (Yes).\n"))
check("AG03 the ANOVA table's preview, pinned whole (Table 3): four regions, the df column centered, eta2 without its zero, the groups' ns varying with missing data",
      identical(.agl(.ag3), .ag3_pin) && endsWith(.ag3$txt, "West, 23 to 25.\n"))
check("AG04 the crosstab's preview, pinned whole (Table 4): each variable's label row carrying its test, its categories indented, n and % under each group and the Total, N differing by variable",
      identical(.agl(.ag4), .ag4_pin) && endsWith(.ag4$txt, "Region of residence).\n"))
check("AG05 the item table's preview, pinned whole (Table 5): N after the title (ruling R59, S409), the items by their wording, item-total r and alpha if item deleted without the zero, the filter, alpha and the definition in the note -- the alpha's \"= .84\" kept on one line by the prose wrapper (S405: a name = value pair starting with a letter of any script)",
      identical(.agl(.ag5), .ag5_pin) && endsWith(.ag5$txt, "the other items.\n"))

# =============================================================================
# AH. The Word file of the five tables: ruling R55's fit and landscape test,
#     heads with markup, the cells set centered
# =============================================================================
cat("\n--- AH. The Word file of the five tables ---\n")

.ahx <- function(f, sub) {
  if (!file.exists(f)) return("")
  x <- file.path(.aad, sub); unlink(x, recursive = TRUE); invisible(utils::unzip(f, exdir = x))
  paste(readLines(file.path(x, "word", "document.xml"), warn = FALSE, encoding = "UTF-8"), collapse = "\n")
}
.ahsz <- function(d) sort(unique(regmatches(d, gregexpr("(?<=<w:sz w:val=\")[0-9]+", d, perl = TRUE))[[1]]))
.ahland <- function(d) isTRUE(grepl("w:orient=\"landscape\"", regmatches(d, regexpr("<w:sectPr>.*?</w:sectPr>", d)), fixed = TRUE))
.ah1 <- local({
  f <- file.path(.aad, "Five.docx")
  w <- res(jtable(list(.abt, .act, .adt, .aet, .aft), file = f, overwrite = TRUE, print = FALSE))
  d <- .ahx(f, "x5")
  f4 <- file.path(.aad, "Four.docx")
  invisible(res(jtable(list(.abt, .act, .aet, .aft), file = f4, overwrite = TRUE, print = FALSE)))
  d4 <- .ahx(f4, "x4")
  list(w = w, d = d, d4 = d4, f = f)
})
.ahpos <- function(d, titles) vapply(titles, function(t) regexpr(t, d, fixed = TRUE)[1], 1L)
check("AH01 one file of the five tables: five tables in order, numbered 1 to 5 on Word's SEQ field, the titles with {group} filled; the four-group ANOVA table, which cannot fit portrait (ruling R55), on a landscape page of its own between portrait pages for the two tables before it and the two after (S406: each table gets the page it needs; until then one landscape page held all five), every cell at 12 points; the other four alone fit portrait at 12 points",
      file.exists(.ah1$f) && length(.ah1$w$val) == 5L &&
        lengths(regmatches(.ah1$d, gregexpr("<w:tbl>", .ah1$d, fixed = TRUE))) == 5L &&
        identical(regmatches(.ah1$d, gregexpr("(?<=<w:fldChar w:fldCharType=\"separate\"/></w:r><w:r><w:rPr><w:b/><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\">)[0-9]+", .ah1$d, perl = TRUE))[[1]],
                  as.character(1:5)) &&
        local({
          pos <- .ahpos(.ah1$d, c("Descriptive Statistics and Correlations for Study Variables",
                                  paste("Means, Standard Deviations, and t Tests by", .aal("Volunteer")),
                                  paste("One-Way Analyses of Variance by", .aal("Region")),
                                  paste("Frequencies and Percentages by", .aal("Volunteer")),
                                  "Item Statistics and Reliability"))
          all(pos > 0L) && !is.unsorted(pos)
        }) &&
        identical(grepl("landscape", regmatches(.ah1$d, gregexpr("<w:sectPr><w:pgSz[^/]*/>", .ah1$d))[[1]],
                        fixed = TRUE), c(FALSE, TRUE, FALSE)) &&
        identical(.ahsz(.ah1$d), "24") &&
        !.ahland(.ah1$d4) && identical(.ahsz(.ah1$d4), "24"))

.ah2 <- res(local({
  s <- .jst_style_apa; page <- .jst_docx_page("a4", FALSE)$text
  nat <- .jst_docx_widths(.aft, s); w60 <- .jst_docx_widths(.aft, s, size = 12, pad = 60L)
  fit <- .jst_docx_fit(.aft, s, page)
  two <- max(vapply(vapply(.aft$rows, `[[`, "", "label"), function(l) {
    w <- strsplit(l, " ", fixed = TRUE)[[1]]; m <- length(w)
    if (m < 2L) return(.jst_docx_text_width(l, 12))
    min(vapply(seq_len(m - 1L), function(k) {
      max(.jst_docx_text_width(paste(w[seq_len(k)], collapse = " "), 12),
          .jst_docx_text_width(paste(w[(k + 1L):m], collapse = " "), 12))
    }, 0))
  }, 0))
  one <- max(vapply(vapply(.aft$rows, `[[`, "", "label"), .jst_docx_text_width, 0, size = 12))
  list(page = page, nat = sum(nat), w60 = w60, fit = fit, two = two, one = one)
}))$val
check("AH02 ruling R55's order on the item table: wider than the portrait page at its natural width, it loses half its padding, then its stub narrows so the items take two lines -- each fits on two lines of the stub less its margins, the longest no longer on one -- and the font stays at 12 points, the table within the page",
      .ah2$nat > .ah2$page && sum(.ah2$w60) > .ah2$page &&
        identical(.ah2$fit$size, 12) && sum(.ah2$fit$widths) <= .ah2$page &&
        identical(.ah2$fit$widths[-1], .ah2$w60[-1]) &&
        .ah2$fit$widths[1] < .ah2$w60[1] && .ah2$fit$widths[1] >= 2160L &&
        .ah2$two + 216L <= .ah2$fit$widths[1] && .ah2$one + 216L > .ah2$fit$widths[1])

.ah3 <- res(local({
  fa <- file.path(.aad, "Items.docx"); fy <- file.path(.aad, "ItemsL.docx"); fv <- file.path(.aad, "Anova.docx")
  invisible(res(jtable(.aft, file = fa, overwrite = TRUE, print = FALSE)))
  invisible(res(jtable(.af, file = fy, landscape = "yes", overwrite = TRUE, print = FALSE)))
  invisible(res(jtable(.adt, file = fv, overwrite = TRUE, print = FALSE)))
  da <- .ahx(fa, "xa"); dy <- .ahx(fy, "xy"); dv <- .ahx(fv, "xv")
  page_p <- .jst_docx_page("a4", FALSE)$text
  num <- sum(.jst_docx_widths(.adt, .jst_style_apa, size = 12, pad = 60L)[-1])
  floor <- .jst_docx_stub_floor(.adt, 12, .jst_docx_widths(.adt, .jst_style_apa, size = 12, pad = 60L)[1])
  list(da = da, dy = dy, dv = dv, narrow = num + floor, page_p = page_p)
}))$val
check("AH03 landscape = auto (ruling R55) turns the page only when the table cannot fit portrait with half padding and its labels on two lines: the item table (wider than portrait at its natural width) stays portrait, the four-group ANOVA table turns landscape at 12 points; landscape = yes in the call turns any table",
      !.ahland(.ah3$da) && identical(.ahsz(.ah3$da), "24") &&
        .ah3$narrow > .ah3$page_p && .ahland(.ah3$dv) && identical(.ahsz(.ah3$dv), "24") &&
        .ahland(.ah3$dy))

.ah4 <- res(local({
  tr <- regmatches(.ah1$d, gregexpr("<w:tr>.*?</w:tr>", .ah1$d))[[1]]
  cells <- function(row) regmatches(row, gregexpr("<w:tc>(?:(?!</w:tc>).)*?</w:tc>", row, perl = TRUE))[[1]]
  pick <- function(pat) { for (row in tr) for (cl in cells(row)) if (grepl(pat, cl, fixed = TRUE)) return(cl); NA_character_ }
  list(t = pick("(101)</w:t>"), r = pick(">Item-total </w:t>"), dash = pick(">\u2014</w:t>"),
       df = pick(">3, 93</w:t>"), num = pick(">.62***</w:t>"))
}))$val
check("AH04 heads with markup in the file: t italic and (101) upright in one head, Item-total upright and r italic; a cell with no digit (the em dash) and the ANOVA's df cells centered with no tab stop; a number keeps its decimal tab",
      grepl("<w:r><w:rPr><w:i/><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\">t</w:t></w:r><w:r><w:rPr><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\">(101)</w:t></w:r>", .ah4$t, fixed = TRUE) &&
        grepl("<w:t xml:space=\"preserve\">Item-total </w:t></w:r><w:r><w:rPr><w:i/><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\">r</w:t>", .ah4$r, fixed = TRUE) &&
        grepl("<w:jc w:val=\"center\"/>", .ah4$dash, fixed = TRUE) && !grepl("<w:tabs>", .ah4$dash, fixed = TRUE) &&
        grepl("<w:jc w:val=\"center\"/>", .ah4$df, fixed = TRUE) && !grepl("<w:tabs>", .ah4$df, fixed = TRUE) &&
        grepl("<w:tab w:val=\"decimal\"", .ah4$num, fixed = TRUE) && !grepl("<w:jc ", .ah4$num, fixed = TRUE))

.ah5 <- res(local({
  s <- .jst_style_apa
  narrow <- .jst_docx_fit(.adt, s, 3000L)
  list(sizes = list(.jst_docx_fit_sizes(12), .jst_docx_fit_sizes(10.5), .jst_docx_fit_sizes(8)),
       narrow = narrow)
}))$val
check("AH05 the font steps a point at a time to 8 points (from a size between points, to the point below first); a page too narrow even at 8 points gets the stub at an inch and a half and every column in proportion, within the page",
      identical(.ah5$sizes, list(c(12, 11, 10, 9, 8), c(10.5, 10, 9, 8), 8)) &&
        identical(.ah5$narrow$size, 8) && sum(.ah5$narrow$widths) <= 3000L &&
        identical(.ah5$narrow$note_size, 8))

# Re-pinned S406: the ANOVA table on a landscape section of its own.
check("AH06 document.xml of the five tables pinned by its checksum",
      identical(unname(tools::md5sum(file.path(.aad, "x5", "word", "document.xml"))), "79b886ea242ab458ef27c2278637c0ee"))

.ah7 <- res(local({
  tb <- .aft
  tb$rows[[1]]$label <- "Environmentallyconsciousconsumerpreferenceindex (reversed)"
  w1 <- .jst_docx_widths(tb, .jst_style_apa, size = 12, pad = 60L)[1]
  list(floor = .jst_docx_stub_floor(tb, 12, w1), w1 = w1,
       word = .jst_docx_text_width("Environmentallyconsciousconsumerpreferenceindex", 12) + 216L)
}))$val
check("AH07 the stub's floor keeps every label on two lines (ruling R55): a label whose words cannot split into two lines of half the stub's width sets the floor at its own two-line width",
      !is.null(.ah7) && .ah7$word > ceiling(.ah7$w1 / 2) && .ah7$floor >= .ah7$word &&
        .ah7$floor <= .ah7$w1)

# Every column of numbers holds its block -- the widest whole part and the
# widest tail, from whichever cells have them -- so the decimal stop leaves
# room on both sides (the S405 rebuild: in Word, the correlation table's
# "-.07" sat off the point under ".62***", and a journal regression
# column's "-3.40" beside "-.001").
.ah8 <- res(local({
  sj <- .jst_style_apa; sj$general$leading.zero <- "never"
  tj <- .jst_table_build_models(list(.vm1, .vm2, .vm3, .vm4), sj)
  room <- function(tb, st, size, pad) {
    w    <- .jst_docx_widths(tb, st, size = size, pad = pad)
    tabs <- .jst_docx_decimal_tabs(tb, w, size, 108L)
    all(vapply(seq_len(nrow(tb$columns))[-1L], function(j) {
      k <- tb$columns$key[j]
      cells <- vapply(tb$rows, function(r) { x <- r$cells[[k]]; if (is.null(x)) "" else x }, "")
      keep  <- !.jst_tbl_plain_cell(cells, tb$columns$kind[j])
      spans <- vapply(tb$rows, .jst_docx_spans_from, logical(1), j = j)
      pt <- .jst_docx_num_parts(cells)
      hw <- .jst_docx_text_width(pt$head[keep], size, TRUE)
      tw <- .jst_docx_text_width(pt$tail[keep & !spans], size, TRUE)
      tabs[j] >= hw && tabs[j] + tw <= w[j] - 216L
    }, logical(1)))
  }
  tbs <- list(.abt, .act, .adt, .aet, .aft, .x1$val, .v4, tj)
  sts <- c(rep(list(.jst_style_apa), 7L), list(sj))
  ok  <- mapply(function(tb, st) {
    all(vapply(list(c(12, 120), c(12, 60), c(10, 60), c(9, 60), c(8, 60)),
               function(sp) room(tb, st, sp[1], sp[2]), logical(1)))
  }, tbs, sts)
  w <- .jst_docx_widths(.abt, .jst_style_apa); w[5] <- 1036L
  t1 <- regmatches(.ah1$d, regexpr("<w:tbl>.*?</w:tbl>", .ah1$d))
  g  <- as.integer(regmatches(t1, gregexpr("(?<=<w:gridCol w:w=\")[0-9]+", t1, perl = TRUE))[[1]])
  tr <- regmatches(t1, gregexpr("<w:tr>.*?</w:tr>", t1))[[1]]
  rw <- tr[grep(">4. Daily commute time (minutes)</w:t>", tr, fixed = TRUE)[1]]
  c5 <- regmatches(rw, gregexpr("<w:tc>(?:(?!</w:tc>).)*?</w:tc>", rw, perl = TRUE))[[1]][5]
  list(ok = ok, narrow = .jst_docx_decimal_tabs(.abt, w, 12, 108L)[5],
       minus = .jst_docx_text_width("\u2212", 12), tail = .jst_docx_text_width(".62***", 12),
       pos = as.integer(sub(".*w:pos=\"([0-9]+)\".*", "\\1", c5)), g5 = g[5],
       txt = grepl(">\u2212.07</w:t>", c5, fixed = TRUE))
}))$val
check("AH08 every column of numbers holds its block, the decimal stop leaving room for the widest whole part on its left and the widest tail on its right -- in the five tables, Table 3 and its form with no zeros, at every size the fit tries; in the file, the correlation table's first column holds the minus of -.07 and the stars of .62*** (the S405 rebuild); and a column too narrow for its block keeps its stop right of the whole part",
      !is.null(.ah8) && all(.ah8$ok) && .ah8$narrow >= .ah8$minus && isTRUE(.ah8$txt) &&
        .ah8$pos >= .ah8$minus && .ah8$pos + .ah8$tail <= .ah8$g5 - 216L)

# =============================================================================
# AI. The (S403) repeated-name rewording: the function named once
# =============================================================================
cat("\n--- AI. The stops name jtable() once ---\n")

.ai <- vapply(.seen, `[[`, "", "text")
check("AI01 no recorded stop reads \"jtable(): jtable()\" (the S403 item: the emitter's prefix and the text both naming the function); each of the seven reworded stops was reached in its new words",
      length(.ai) > 0L && !any(grepl("jtable(): jtable()", .ai, fixed = TRUE)) &&
        all(vapply(c("jtable(): no table is made from this kind of result yet.",
                     "jtable(): the file name needs the .docx extension (a Word file),",
                     "jtable(): built tables and saved results cannot be given",
                     "jtable(): a table is made from a saved result -- what an analysis",
                     "jtable(): results of different kinds (",
                     "jtable(): models of different outcomes",
                     "jtable(): no table is made from a grouped jdesc() result"),
                   function(p) any(grepl(p, .ai, fixed = TRUE)), logical(1))))

# =============================================================================
# AJ. jstyle(): the five sections; a style file's sections in use
# =============================================================================
cat("\n--- AJ. jstyle() and the five sections ---\n")

.aj1 <- .strip_ansi(res(jstyle("apa"))$txt)
.aj1f <- local({ p <- res(jstyle("apa", save.as = file.path(.aad, "copy4")))$val
                 f <- file.path(.aad, "copy4.jstyle")
                 if (file.exists(f)) readLines(f, encoding = "UTF-8") else character(0) })
check("AJ01 jstyle(\"apa\") prints the five sections after [logistic], in order, and filter.note among the general settings; a saved copy writes them with their notes and the lists, and reads back",
      grepl("(?s)\\[logistic\\]\n.*\n\\[correlation\\]\n.*\n\\[ttest\\]\n.*\n\\[anova\\]\n.*\n\\[crosstab\\]\n.*\n\\[reliability\\]\n", .aj1, perl = TRUE) &&
        grepl("\nfilter.note       = yes\n", .aj1, fixed = TRUE) &&
        grepl("\n[crosstab]\ntitle             = Frequencies and Percentages by {group}\ncolumns           = n, percent\ntotal             = yes\npercent.base      = column\ntest.columns      = chisq, df, p, v\n", .aj1, fixed = TRUE) &&
        all(c("[correlation]", "[ttest]", "[anova]", "[crosstab]", "[reliability]") %in% .aj1f) &&
        "filter.note = yes" %in% .aj1f && "test.columns = chisq, df, p, v" %in% .aj1f &&
        "item.total.label = Item-total *r*" %in% .aj1f &&
        inherits(res(jtable(.af, style = file.path(.aad, "copy4"), print = FALSE))$val, "jst_table"))

.wsty("b4", "filter.note = no", "[ttest]", "columns = n, mean, sd, t, p", "stub.label = Outcome",
      "[crosstab]", "total = no", "percent.base = row", dir = .aad)
.aj2 <- local({
  st <- file.path(.aad, "b4")
  list(t  = res(jtable(.ac, style = st, print = FALSE))$val,
       x  = res(jtable(.ae, style = st, print = FALSE))$val,
       xc = res(jtable(.ae, style = st, total = "yes", print = FALSE))$val,
       f  = res(jtable(.aa5$tt, style = st, columns = c("mean", "sd", "t", "p"), print = FALSE))$val,
       fn = local({
         inc <- as.numeric(haven::zap_missing(tcm$Income)); ok <- tcm$Age >= 30 & !is.na(inc)
         paste0("*n* = ", sum(ok & .acg == 0), " (No) and ", sum(ok & .acg == 1), " (Yes).")
       }))
})
check("AJ02 a style file's [ttest] and [crosstab] sections in use: each group's n before its M and SD, d left out, the stub head Outcome; the crosstab without its Total, its percentages within each category; the call outranks the file; filter.note = no in the file's general part leaves the filter sentence out",
      identical(.aj2$t$columns$key, c("stub", "g1.n", "g1.mean", "g1.sd", "g2.n", "g2.mean", "g2.sd", "t", "p")) &&
        identical(.aj2$t$columns$label[c(1, 8)], c("Outcome", "*t*(101)")) &&
        !"tot.n" %in% .aj2$x$columns$key &&
        identical(.aj2$x$rows[[2]]$cells$g1.percent,
                  .aepc(100 * .aee[[1]]$obs[1, 1] / sum(.aee[[1]]$obs[1, ]))) &&
        "tot.n" %in% .aj2$xc$columns$key &&
        identical(.aj2$f$notes$general, .aj2$fn))

# =============================================================================
# AK. One call makes one table (ruling R56)
# =============================================================================
cat("\n--- AK. One call makes one table ---\n")

# The results of build 5's sections, on the shipped community dataset (Region
# still dummy-coded and Education numeric from section V; nothing filtered).
.akd <- file.path(tempdir(), "tables_check_b5"); unlink(.akd, recursive = TRUE); dir.create(.akd)
.akd1 <- res(jdesc(tcm, Age, Income))$val
.akd2 <- res(jdesc(tcm, WellbeingScore))$val
.akd3 <- res(jdesc(tcm, CommuteTime))$val
.akm1 <- res(jlm(WellbeingScore ~ Age, tcm))$val
.akm2 <- res(jlm(Income ~ Age, tcm))$val
.akm3 <- res(jlm(WellbeingScore ~ Age + Income, tcm))$val
.akf1 <- res(jfreq(tcm, Smoker))$val
.akc1 <- res(jcorr(tcm, Age, Income))$val
.akc2 <- res(jcorr(tcm, Age, WellbeingScore))$val
.akt1 <- res(jt(Income ~ Volunteer, tcm))$val
.akt2 <- res(jt(Age ~ Smoker, tcm))$val
.aka1 <- res(jaov(WellbeingScore ~ Region, tcm))$val
.aka2 <- res(jaov(WellbeingScore ~ Region, tcm, subset = Region != 4))$val
.akx1 <- res(jcrosstab(Smoker ~ Volunteer, tcm))$val
.akx2 <- res(jcrosstab(Smoker ~ Region, tcm))$val
.akx3 <- res(jcrosstab(Smoker ~ Region, tcm, subset = Region != 4))$val
# The names the offered lines give the tables: t1, t2, ... unless the
# workspace already holds one (AK09 checks the choice itself), and the name
# a line gives a list typed as an expression.
.akn <- tryCatch(.jst_table_line_names(2L, globalenv()), error = function(e) c("t1", "t2"))
.akb <- tryCatch(.jst_table_line_names(0L, globalenv(), stem = c("res", "results", "res_list")),
                 error = function(e) "res")
# The stop's middle and its writing line, as every R56 stop gives them.
.akmid <- paste0("Make each table in a call of its own, then give the tables together to write\n",
                 "them to one file:\n")
.akw <- paste0("  jtable(list(", .akn[1], ", ", .akn[2], "), file = \"Tables.docx\")")

.ak1 <- res(jtable(list(.akd1, .akm1)))
check("AK01 results of different kinds stop (ruling R56: one call makes one table), naming the functions, with no \"yet\"; the stop gives the line that makes each table and the line that writes them to one file; nothing is returned",
      identical(.ak1$txt, paste0("[error] jtable(): results of different kinds (jdesc() and jlm()) cannot\n",
                                 "share a table.\n", .akmid,
                                 "  ", .akn[1], " <- jtable(.akd1)\n",
                                 "  ", .akn[2], " <- jtable(.akm1)\n", .akw)) &&
        is.null(.ak1$val) && !grepl("yet", .ak1$txt, fixed = TRUE))

.ak2 <- res(jtable(list(.akm1, .akm2, .akm3)))
.ak3 <- res(jtable(list(A = .akm1, B = .akm3, .akm2)))
check("AK02 models of different outcomes stop; the results that can share a table are grouped on one line, the tables in the order of each one's first result; a named list's names ride on the line",
      identical(.ak2$txt, paste0("[error] jtable(): models of different outcomes (WellbeingScore and Income)\n",
                                 "cannot share a table.\n", .akmid,
                                 "  ", .akn[1], " <- jtable(list(.akm1, .akm3))\n",
                                 "  ", .akn[2], " <- jtable(.akm2)\n", .akw)) &&
        grepl(paste0("\n  ", .akn[1], " <- jtable(list(\"A\" = .akm1, \"B\" = .akm3))\n  ",
                     .akn[2], " <- jtable(.akm2)\n"), .ak3$txt, fixed = TRUE))

.akres <- list(.akm1, .akm2, .akm3)
.ak4 <- res(jtable(.akres))
.ak4e <- res(jtable(c(list(.akd1), list(.akm1))))
check("AK03 a list held in a variable is offered by place (a single result by [[ ]], a group by [c( )]); a list typed as an expression is kept first on a line of its own, under a name the workspace does not hold",
      grepl(paste0("\n  ", .akn[1], " <- jtable(.akres[c(1, 3)])\n  ",
                   .akn[2], " <- jtable(.akres[[2]])\n", .akw), .ak4$txt, fixed = TRUE) &&
        endsWith(.ak4e$txt, paste0("them to one file:\n",
                                   "  ", .akb, " <- c(list(.akd1), list(.akm1))\n",
                                   "  ", .akn[1], " <- jtable(", .akb, "[[1]])\n",
                                   "  ", .akn[2], " <- jtable(", .akb, "[[2]])\n", .akw)))

.ak5f <- file.path(.akd, "Out.docx")
.ak5 <- res(jtable(list(.akm1, .akd1, .akm3), style = "apa", fit.rows = c("r2", "n"),
                   landscape = "yes", file = .ak5f, overwrite = TRUE, print = FALSE))
check("AK04 the call's settings ride on the lines: style = on every table's line, a table type's setting on the lines of the tables that take it, and file =, overwrite =, landscape = and print = on the line that writes; the stopped call writes nothing",
      grepl(paste0("\n  ", .akn[1], " <- jtable(list(.akm1, .akm3), style = \"apa\", fit.rows = c(\"r2\", \"n\"))\n",
                   "  ", .akn[2], " <- jtable(.akd1, style = \"apa\")\n",
                   "  jtable(list(", .akn[1], ", ", .akn[2], "), file = .ak5f, overwrite = TRUE, landscape = \"yes\", print = FALSE)"),
            gsub("\n {6}", " ", .ak5$txt), fixed = TRUE) &&
        !file.exists(.ak5f))

.ak6 <- res(jtable(list(.akd1, .akf1), fit.rows = "r2"))
.ak7a <- res(jtable(list(.akd1, .akm1), title = "Ages", note = "From the survey."))
.ak7b <- res(jtable(list(.akd1, .akm1), headings = list(Demographics = Age)))
check("AK05 a table type's setting that none of the tables takes stops on its own; title = and note = (or headings =) name one table, and the stop ends saying to put them on that table's line",
      identical(.ak6$txt, paste0("[error] jtable(): fit.rows = is a setting of a regression table and a\n",
                                 "logistic regression table, and none of these results makes one.")) &&
        endsWith(.ak7a$txt, paste0(.akw, "\ntitle = and note = name one table: add them to that table's line.")) &&
        endsWith(.ak7b$txt, paste0(.akw, "\nheadings = names one table: add it to that table's line.")))

.ak8t <- res(jtable(list(.akt1, .akt2)))
.ak8a <- res(jtable(list(.aka1, .aka2)))
.ak8x <- res(jtable(list(.akx1, .akx2)))
.ak8y <- res(jtable(list(.akx2, .akx3)))
.ak8c <- res(jtable(list(.akc1, .akc2)))
check("AK06 what keeps the results apart, in each table type's words: t tests of different grouping variables; ANOVAs of one grouping variable comparing different groups (each set by its value labels); crosstabs of different column variables, and of one holding different categories; two jcorr() results, each a table of its own, with how to correlate more variables in one table",
      startsWith(.ak8t$txt, paste0("[error] jtable(): jt() results of different grouping variables\n",
                                   "(Volunteer and Smoker) cannot share a table.\n", .akmid)) &&
        startsWith(.ak8a$txt, paste0("[error] jtable(): the jaov() results compare different groups of Region\n",
                                     "(North, South, East, and West; North, South, and East), so they cannot\n",
                                     "share a table.\n", .akmid)) &&
        startsWith(.ak8x$txt, paste0("[error] jtable(): jcrosstab() results with different column variables\n",
                                     "(Volunteer and Region) cannot share a table.\n", .akmid)) &&
        startsWith(.ak8y$txt, paste0("[error] jtable(): the jcrosstab() results hold different categories of\n",
                                     "Region (North, South, East, and West; North, South, and East), so they\n",
                                     "cannot share a table.\n", .akmid)) &&
        identical(.ak8c$txt, paste0("[error] jtable(): each jcorr() result is a table of its own.\n",
                                    "To correlate more variables in one table, name them in one jcorr() call.\n",
                                    .akmid,
                                    "  ", .akn[1], " <- jtable(.akc1)\n",
                                    "  ", .akn[2], " <- jtable(.akc2)\n", .akw)))

# A written file's document part, unzipped into a folder of its own.
.alx <- function(f) {
  if (!file.exists(f)) return("")
  x <- file.path(.akd, paste0("x_", tools::file_path_sans_ext(basename(f))))
  unlink(x, recursive = TRUE); invisible(utils::unzip(f, exdir = x))
  paste(readLines(file.path(x, "word", "document.xml"), warn = FALSE, encoding = "UTF-8"), collapse = "\n")
}

# The lines a stop offers run as they stand: AK04's, each evaluated in a
# fresh environment (the workspace's objects in reach, its names untouched).
.aklines <- function(txt, after = "them to one file:$") {
  ls <- strsplit(txt, "\n", fixed = TRUE)[[1]]
  at <- grep(after, ls)
  if (!length(at)) return(character(0))
  ls <- ls[-seq_len(at[1L])]
  out <- character(0)
  for (l in ls[grepl("^  ", ls)]) {
    if (grepl("^ {6}", l) && length(out)) out[length(out)] <- paste(out[length(out)], trimws(l))
    else out <- c(out, trimws(l))
  }
  out
}
.ak9 <- local({
  e <- new.env(parent = globalenv())
  ran <- lapply(.aklines(.ak5$txt), function(l) res(eval(parse(text = l)[[1]], envir = e)))
  list(ran = ran, e = e, d = .alx(.ak5f))
})
check("AK07 the offered lines run as they stand: each table's line builds its table (the models' with the N row its setting asked for), and the writing line writes both to one file, every page landscape, Table 1 the models and Table 2 the descriptives",
      length(.ak9$ran) == 3L &&
        !any(vapply(.ak9$ran, function(r) startsWith(r$txt, "[error]"), logical(1))) &&
        inherits(get(.akn[1], envir = .ak9$e), "jst_table") &&
        identical(tail(vapply(get(.akn[1], envir = .ak9$e)$rows, `[[`, "", "label"), 2), c("*R*\u00b2", "*N*")) &&
        file.exists(.ak5f) &&
        lengths(regmatches(.ak9$d, gregexpr("<w:tbl>", .ak9$d, fixed = TRUE))) == 2L &&
        all(grepl("w:orient=\"landscape\"", regmatches(.ak9$d, gregexpr("<w:sectPr>.*?</w:sectPr>", .ak9$d))[[1]], fixed = TRUE)) &&
        regexpr("Regression Coefficients Predicting", .ak9$d, fixed = TRUE) <
          regexpr("Descriptive Statistics", .ak9$d, fixed = TRUE))

.akold <- .akm1; if (!is.null(.akold)) attr(.akold, "jstats_version") <- NULL
.ak10 <- res(jtable(list(.akd1, .akold)))
check("AK08 before the stop gives its lines, each table is built: a result that cannot make a table stops in its own words, so no offered line would stop again",
      startsWith(.ak10$txt, "[error] jtable(): this jlm() result was made by an earlier version of\n") &&
        !grepl("cannot share a table", .ak10$txt, fixed = TRUE))

.ak11 <- local({
  e1 <- new.env(parent = emptyenv()); assign("t1", 1, envir = e1)
  e3 <- new.env(parent = emptyenv())
  for (nm in c("t1", "t2", "tab1", "tab2", "table1", "table2")) assign(nm, 1, envir = e3)
  n1 <- tryCatch(.jst_table_line_names(2L, e1), error = function(e) NA_character_)
  n3 <- tryCatch(.jst_table_line_names(2L, e3), error = function(e) NA_character_)
  inner <- local({ t1 <- 3; res(jtable(list(.akd1, .akm1))) })
  list(n1 = n1, n3 = n3, inner = inner)
})
check("AK09 the offered names never replace an object: t1 held in the caller's frame moves the names on (tab1, then table1), every stem taken gives table_1; a stop raised where t1 exists offers no t1",
      !identical(.ak11$n1, c("t1", "t2")) &&
        !any(vapply(.ak11$n1, exists, logical(1), envir = globalenv(), inherits = FALSE)) &&
        identical(.ak11$n3, c("table_1", "table_2")) &&
        grepl("them to one file:\n", .ak11$inner$txt, fixed = TRUE) &&
        !grepl("\n  t1 <- ", .ak11$inner$txt, fixed = TRUE))

.ak12 <- vapply(list(
  quote(.jst_table_build_corr(list(.akc1, .akc2), .jst_style_apa)),
  quote(.jst_table_build_groups(list(.aka1, .aka2), .jst_style_apa)),
  quote(.jst_table_build_groups(list(.akt1, .akt2), .jst_style_apa)),
  quote(.jst_table_build_crosstab(list(.akx1, .akx2), .jst_style_apa)),
  quote(.jst_table_build_models(list(.akm1, .akm2), .jst_style_apa))),
  function(ex) tryCatch({ eval(ex); "built" }, error = function(e) conditionMessage(e)), "")
check("AK10 each builder still refuses results that cannot share its table, as an internal stop (jtable() never sends it them)",
      identical(.ak12, c(".jst_table_build_corr(): one jcorr() result per table",
                         ".jst_table_build_groups(): results of different groups",
                         ".jst_table_build_groups(): results of different groups",
                         ".jst_table_build_crosstab(): results of different column variables",
                         ".jst_table_build_models(): models of different outcomes")))

# =============================================================================
# AL. What jtable() prints: the report, not the table (ruling R57)
# =============================================================================
cat("\n--- AL. The report ---\n")

.aln0 <- length(.seen)
.al1 <- res(jtable(.akd1))
.al1n <- length(.seen) - .aln0
invisible(utils::capture.output(suppressMessages(joutput("full"))))
.aln0 <- length(.seen)
.al2 <- res(jtable(.akd1))
.al2n <- .seen[-seq_len(.aln0)]
invisible(utils::capture.output(suppressMessages(joutput(NULL))))
check("AL01 a table with no file: the report -- its number and title, what it holds and its page, and that no file was written -- in place of the table; at joutput(\"full\") a note gives the call with file = and the lines that keep the table and print it",
      identical(.al1$txt, paste0("Table 1. Descriptive Statistics (N = 103)\n",
                                 "  2 variables, on a portrait page.\n",
                                 "No file was written.\n")) &&
        .al1n == 0L && inherits(.al1$val, "jst_table") &&
        identical(.al2$txt, .al1$txt) && length(.al2n) == 1L &&
        identical(sub("\n$", "", .al2n[[1]]$text),
                  paste0("Note: to write the table to a Word file, add file = to the call:\n",
                         "  jtable(.akd1, file = \"Table1.docx\")\n",
                         "To see the table here, keep it with <- and print it:\n",
                         "  t1 <- jtable(.akd1)\n",
                         "  print(t1)")))

.al3f <- file.path(.akd, "One.docx")
.al3a <- res(jtable(.akm3, file = .al3f))
.al3b <- res(jtable(.akm3, file = .al3f, overwrite = TRUE))
.al3h <- "Table 1. Regression Coefficients Predicting Wellbeing score (0-100) (N = 97)\n  1 model, on a portrait page.\n"
check("AL02 a table written: the report, then where the file went; written again over it, the report says it replaced the file that was there",
      startsWith(.al3a$txt, paste0(.al3h, "Table written to")) &&
        identical(gsub("\\s+", " ", sub(.al3h, "", .al3a$txt, fixed = TRUE)),
                  paste0("Table written to ", .jst_norm_path(.al3f), " ")) &&
        startsWith(.al3b$txt, paste0(.al3h, "Table written to")) &&
        endsWith(.al3b$txt, "\nIt replaced the file that was there.\n") &&
        !grepl("replaced", .al3a$txt, fixed = TRUE))

.alA <- res(jtable(.akd1, print = FALSE))$val
.alB <- res(jtable(.akd2, print = FALSE))$val
.alC <- res(jtable(.akm1, print = FALSE))$val
.alD <- res(jtable(.akm3, print = FALSE))$val
.al4f <- file.path(.akd, "Four.docx")
.al4 <- res(jtable(list(.alA, .alB, .alC, .alD), file = .al4f, print = TRUE))
check("AL03 built tables written together: each table's lines numbered as in the file, then how many tables went to the file",
      startsWith(.al4$txt, paste0("Table 1. Descriptive Statistics (N = 103)\n",
                                  "  2 variables, on a portrait page.\n",
                                  "Table 2. Descriptive Statistics (N = 103)\n",
                                  "  1 variable, on a portrait page.\n",
                                  "Table 3. Regression Coefficients Predicting Wellbeing score\n",
                                  "(0-100) (N = 103)\n",
                                  "  1 model, on a portrait page.\n",
                                  "Table 4. Regression Coefficients Predicting Wellbeing score (0-100) (N = 97)\n",
                                  "  1 model, on a portrait page.\n",
                                  "4 tables written to")) &&
        grepl(paste0("4 tables written to ", .jst_norm_path(.al4f)), gsub("\\s+", " ", .al4$txt), fixed = TRUE))

# The page the report names is the page the file has: orientation from the
# section, the text size from the cells' runs.
.alsz <- function(d) sort(unique(regmatches(d, gregexpr("(?<=<w:sz w:val=\")[0-9]+", d, perl = TRUE))[[1]]))
.al5 <- local({
  f1 <- file.path(.akd, "Anova.docx"); f2 <- file.path(.akd, "Models.docx"); f3 <- file.path(.akd, "AnovaP.docx")
  r1 <- res(jtable(.adt, file = f1, overwrite = TRUE))
  r2 <- res(jtable(list(.vm1, .vm2, .vm3, .vm4), file = f2, overwrite = TRUE))
  r3 <- res(jtable(.adt, file = f3, overwrite = TRUE, landscape = "no"))
  f4 <- file.path(.akd, "Items.docx")
  r4 <- res(jtable(.aft, file = f4, overwrite = TRUE))
  list(r1 = r1, r2 = r2, r3 = r3, r4 = r4, d1 = .alx(f1), d2 = .alx(f2), d3 = .alx(f3), d4 = .alx(f4))
})
check("AL04 the page in the report is the file's: the four-group ANOVA table on a landscape page at 12 points; the four models on a landscape page, their text at 10 points and their long labels on two lines; the ANOVA table forced portrait at 8 points, its labels on two lines; the item table at 12 points, its long labels on two lines (no size named: it is the style's)",
      startsWith(.al5$r1$txt, paste0("Table 1. Means, Standard Deviations, and One-Way Analyses of Variance by\n",
                                     "Region of residence\n",
                                     "  3 outcomes by Region, on a landscape page.\n")) &&
        grepl("w:orient=\"landscape\"", .al5$d1, fixed = TRUE) && identical(.alsz(.al5$d1), "24") &&
        startsWith(.al5$r2$txt, paste0("Table 1. Regression Coefficients Predicting Wellbeing score (0-100) (N = 92)\n",
                                       "  4 models side by side, on a landscape page, its text at 10 pt, long labels\n",
                                       "  on two lines.\n")) &&
        grepl("w:orient=\"landscape\"", .al5$d2, fixed = TRUE) && "20" %in% .alsz(.al5$d2) &&
        startsWith(.al5$r3$txt, paste0("Table 1. Means, Standard Deviations, and One-Way Analyses of Variance by\n",
                                       "Region of residence\n",
                                       "  3 outcomes by Region, on a portrait page, its text at 8 pt, long labels on\n",
                                       "  two lines.\n")) &&
        !grepl("w:orient=\"landscape\"", .al5$d3, fixed = TRUE) && "16" %in% .alsz(.al5$d3) &&
        grepl("^Table 1\\. Item Statistics and Reliability \\(N = 72\\)\n  [^\n]*, on a portrait page, long labels on two\n?\\s*lines\\.\n", .al5$r4$txt) &&
        !grepl(" pt", .al5$r4$txt, fixed = TRUE) &&
        !grepl("w:orient=\"landscape\"", .al5$d4, fixed = TRUE) && identical(.alsz(.al5$d4), "24"))

.alE <- res(jtable(c(list(.akd2), list(.akd3)), print = FALSE))$val
.alF <- res(jtable(.akd1, print = FALSE))$val
.alc <- res(jcorr(tcm, WellbeingScore, CommuteTime))$val   # no variable shared with .akc1
invisible(utils::capture.output(suppressMessages(joutput("full"))))
.aln0 <- length(.seen)
.al6 <- res(jtable(list(.alA, .alB, .alC, .alD), file = .al4f, overwrite = TRUE))
.al6n <- .seen[-seq_len(.aln0)]
.aln0 <- length(.seen)
.al6b <- res(jtable(list(.alA, .alE), file = .al4f, overwrite = TRUE))
.al6bn <- .seen[-seq_len(.aln0)]
.aln0 <- length(.seen)
.al6c <- res(jtable(list(.alA, .alF, res(jtable(.akc1, print = FALSE))$val,
                         res(jtable(.alc, print = FALSE))$val), file = .al4f, overwrite = TRUE))
.al6cn <- .seen[-seq_len(.aln0)]
invisible(utils::capture.output(suppressMessages(joutput(NULL))))
.aln0 <- length(.seen)
.al6s <- res(jtable(list(.alA, .alB, .alC, .alD), file = .al4f, overwrite = TRUE))
.al6sn <- length(.seen) - .aln0
check("AL05 at joutput(\"full\"), tables written together that could have been one table are named, with the line that makes them one; tables whose results came from an expression are named without it; tables holding a variable twice are not, nor correlation tables even of different variables; at the standard level nothing is said",
      length(.al6n) == 2L &&
        identical(sub("\n$", "", .al6n[[1]]$text),
                  "Note: Tables 1 and 2 are descriptives tables and could be one table:\n  jtable(list(.akd1, .akd2))") &&
        identical(sub("\n$", "", .al6n[[2]]$text),
                  "Note: Tables 3 and 4 hold models of one outcome and could be one table:\n  jtable(list(.akm1, .akm3))") &&
        length(.al6bn) == 1L &&
        identical(sub("\n$", "", .al6bn[[1]]$text),
                  "Note: Tables 1 and 2 are descriptives tables and could be one table.") &&
        length(.al6cn) == 0L && .al6sn == 0L &&
        endsWith(.al6s$txt, "It replaced the file that was there.\n"))

# =============================================================================
# AM. Tables written together: one object, each table on the page it needs
# =============================================================================
cat("\n--- AM. Tables written together ---\n")

.amdoc <- .al4$val
.amp <- function(t, i) sub("^Table 1\n", paste0("Table ", i, "\n"), res(print(t))$txt)
.am1 <- res(print(.amdoc))
check("AM01 the call that writes built tables returns them as one object (class jst_tables), the tables as given; print() shows every table, numbered as in the file",
      inherits(.amdoc, "jst_tables") && length(.amdoc) == 4L &&
        identical(unclass(.amdoc), list(.alA, .alB, .alC, .alD)) &&
        identical(.am1$txt, paste(.amp(.alA, 1), .amp(.alB, 2), .amp(.alC, 3), .amp(.alD, 4), sep = "\n")))

.am2f <- file.path(.akd, "Doc.docx"); .am3f <- file.path(.akd, "Doc5.docx")
.am2 <- res(jtable(.amdoc, file = .am2f, print = FALSE))
.am3 <- res(jtable(list(.amdoc, .alE), file = .am3f, print = FALSE))
.amseq <- function(d) regmatches(d, gregexpr("(?<=<w:fldChar w:fldCharType=\"separate\"/></w:r><w:r><w:rPr><w:b/><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\">)[0-9]+", d, perl = TRUE))[[1]]
check("AM02 the object written again is its tables, numbered 1 to 4 on Word's SEQ field; inside a list it stands for its tables in its place, the list's next table numbered 5",
      file.exists(.am2f) && identical(.amseq(.alx(.am2f)), as.character(1:4)) &&
        inherits(.am2$val, "jst_tables") && length(.am2$val) == 4L &&
        file.exists(.am3f) && identical(.amseq(.alx(.am3f)), as.character(1:5)) &&
        identical(unclass(.am3$val), list(.alA, .alB, .alC, .alD, .alE)))

.amsect <- function(d) {
  s <- regmatches(d, gregexpr("<w:sectPr>.*?</w:sectPr>", d))[[1]]
  vapply(s, function(x) grepl("w:orient=\"landscape\"", x, fixed = TRUE), logical(1), USE.NAMES = FALSE)
}
.am4 <- local({
  fs <- file.path(.akd, paste0("P", 1:5, ".docx"))
  .alL <- res(jtable(.akd1, landscape = "yes", print = FALSE))$val
  invisible(res(jtable(list(.alA, .adt, .alB), file = fs[1], print = FALSE)))
  invisible(res(jtable(list(.alA, .adt, .alB), file = fs[2], print = FALSE, landscape = "no")))
  invisible(res(jtable(list(.alA, .adt, .alB), file = fs[3], print = FALSE, landscape = "yes")))
  invisible(res(jtable(list(.alA, .alL, .alB), file = fs[4], print = FALSE)))
  invisible(res(jtable(list(.alA, .alB, .adt), file = fs[5], print = FALSE)))
  lapply(fs, .alx)
})
.amland <- function(d) {
  s <- regmatches(d, gregexpr("<w:sectPr>.*?</w:sectPr>", d))[[1]]
  any(vapply(s, function(x) {
    w <- as.integer(sub(".*<w:pgSz w:w=\"([0-9]+)\".*", "\\1", x))
    h <- as.integer(sub(".*w:h=\"([0-9]+)\".*", "\\1", x))
    grepl("w:orient=\"landscape\"", x, fixed = TRUE) && w > h
  }, logical(1)))
}
check("AM03 each table gets the page it needs: the four-group ANOVA table between two descriptives tables gets a landscape section of its own (its page wider than tall), the others portrait; the ANOVA's title falls between the first section's end and the second's",
      identical(.amsect(.am4[[1]]), c(FALSE, TRUE, FALSE)) && .amland(.am4[[1]]) &&
        local({
          d <- .am4[[1]]
          ends <- gregexpr("</w:sectPr>", d, fixed = TRUE)[[1]]
          at <- regexpr("One-Way Analyses of Variance", d, fixed = TRUE)[1]
          at > ends[1] && at < ends[2]
        }))
check("AM04 landscape = in the writing call sets every page (no: one portrait section; yes: one landscape section); a table built with landscape = yes keeps its page among portrait tables; tables side by side on one orientation share a section",
      identical(.amsect(.am4[[2]]), FALSE) && identical(.amsect(.am4[[3]]), TRUE) &&
        identical(.amsect(.am4[[4]]), c(FALSE, TRUE, FALSE)) &&
        identical(.amsect(.am4[[5]]), c(FALSE, TRUE)))

.am5a <- res(jtable(list(.alA, .alB), file = file.path(.akd, "No1.docx"), landscape = "sideways"))
.am5b <- res(jtable(list(.alA, .alB), file = file.path(.akd, "No2.docx"), fit.rows = "r2"))
check("AM05 with built tables, landscape = is checked as a style file's value is; any other setting still stops, a built table keeping its own; neither call writes",
      identical(.am5a$txt, "[error] jtable(): `landscape` must be \"auto\", \"yes\", or \"no\".") &&
        startsWith(.am5b$txt, "[error] jtable(): headings =, markers =, title =, note =, style =, and a\n") &&
        !file.exists(file.path(.akd, "No1.docx")) && !file.exists(file.path(.akd, "No2.docx")))

# =============================================================================
# AN. jstyle(save.as =) with settings: a short style file
# =============================================================================
cat("\n--- AN. A short style file ---\n")

.an1f <- file.path(.akd, "mine")
.an1 <- res(jstyle(save.as = .an1f, size = 11, header.fill = "lightblue",
                   regression = list(fit.rows = c("r2", "n")),
                   descriptives = list(columns = c("n", "mean", "sd"))))
.an1l <- if (file.exists(paste0(.an1f, ".jstyle"))) readLines(paste0(.an1f, ".jstyle"), encoding = "UTF-8") else ""
check("AN01 settings given to jstyle(save.as =) write a short file, pinned whole: a header (since the S407 rebuild the file's name on a line of its own, then one sentence a line) saying it holds only the settings that differ, the stamps, based.on naming the style copied, then the general settings, then each section's under its heading (in the file's order), each after its note on what it does and what it takes, a blank line after each setting and none at the end (S410); a color as typed",
      identical(.an1l, c("# mine.jstyle:",
                         "# A jstats table style, based on apa, a style built into jstats.",
                         "# It lists only the settings that differ from apa; any setting not listed here takes apa's value.",
                         "# ?jstyle_settings lists every setting and what it takes.",
                         "# Change only the values after the = signs, or add a setting from that list; do not invent a setting, and do not rename a setting or a section.",
                         "# jstyle(\"mine\") checks the file and names any value it cannot use.",
                         "",
                         "format     = 1",
                         paste0("written.by = jstats ", .jst_jstats_version()),
                         "based.on   = apa",
                         "",
                         "# the text size, in points",
                         "# takes: a number from 6 to 72",
                         "size = 11",
                         "",
                         "# a color filling the header cells, or none",
                         "# takes: a color name such as lightblue, or six hex digits such as ADD8E6; or none",
                         "header.fill = lightblue",
                         "",
                         "[descriptives]",
                         "# the columns, in order: n, mean, sd, min, max",
                         "# takes: one or more of n, mean, sd, min, max, in order, separated by commas",
                         "columns = n, mean, sd",
                         "",
                         "[regression]",
                         "# the fit rows under the predictors, in order: r2, adj.r2, f, delta.r2 (nested models), f.change (its F test), n, or none",
                         "# takes: one or more of r2, adj.r2, f, delta.r2, f.change, n, in order, separated by commas; or none",
                         "fit.rows = r2, n")) &&
        identical(gsub("\\s+", " ", .an1$txt),
                  paste0("Style written to ", .jst_norm_path(paste0(.an1f, ".jstyle")), " ")))

.an2p <- .strip_ansi(res(jstyle(paste0(.an1f, ".jstyle")))$txt)
.an2m <- res(jtable(.akm3, style = paste0(.an1f, ".jstyle"), print = FALSE))$val
.an2d <- res(jtable(.akd1, style = paste0(.an1f, ".jstyle"), file = file.path(.akd, "Mine.docx"), print = FALSE))$val
check("AN02 the short file reads back: jstyle() shows its four settings as set there and every other from apa; a table built in it takes them (the regression table's N row, the descriptives table's three columns, its cells at 11 points in the file)",
      grepl("\nsize              = 11\n", .an2p, fixed = TRUE) &&
        grepl("\nheader.fill       = ADD8E6\n", .an2p, fixed = TRUE) &&
        grepl("\ncolumns        = n, mean, sd\n", .an2p, fixed = TRUE) &&
        grepl("\nfit.rows          = r2, n\n", .an2p, fixed = TRUE) &&
        grepl("\nfont              = Times New Roman  # from apa\n", .an2p, fixed = TRUE) &&
        identical(tail(vapply(.an2m$rows, `[[`, "", "label"), 2), c("*R*\u00b2", "*N*")) &&
        identical(.an2d$columns$key, c("stub", "n", "mean", "sd")) &&
        "22" %in% .alsz(.alx(file.path(.akd, "Mine.docx"))))

.an3 <- res(jstyle(paste0(.an1f, ".jstyle"), save.as = file.path(.akd, "mine2"), size = 10))
.an3l <- if (file.exists(file.path(.akd, "mine2.jstyle"))) readLines(file.path(.akd, "mine2.jstyle"), encoding = "UTF-8") else ""
.an3p <- .strip_ansi(res(jstyle(file.path(.akd, "mine2.jstyle")))$txt)
.an4 <- res(jstyle(save.as = file.path(.akd, "gs"), regression = list(size = 9)))
.an4l <- if (file.exists(file.path(.akd, "gs.jstyle"))) readLines(file.path(.akd, "gs.jstyle"), encoding = "UTF-8") else ""
.an4m <- local({ f <- file.path(.akd, "Gs.docx")
                 invisible(res(jtable(.akm3, style = file.path(.akd, "gs.jstyle"), file = f, print = FALSE)))
                 .alsz(.alx(f)) })
.an4d <- local({ f <- file.path(.akd, "Gsd.docx")
                 invisible(res(jtable(.akd1, style = file.path(.akd, "gs.jstyle"), file = f, print = FALSE)))
                 .alsz(.alx(f)) })
check("AN03 a style given by path is named by its path in based.on, and the copy reads through it (its own size, the first file's fit rows); a general setting given in a section's list is written under that section and changes only that table type",
      identical(.an3l[1:2], c("# mine2.jstyle:", "# A jstats table style, based on mine.")) &&
        identical(.an3l[10], paste0("based.on   = ", .jst_norm_path(paste0(.an1f, ".jstyle")))) &&
        identical(tail(.an3l, 3), c("# the text size, in points", "# takes: a number from 6 to 72", "size = 10")) &&
        grepl("\nsize              = 10\n", .an3p, fixed = TRUE) &&
        grepl("\nfit.rows          = r2, n", .an3p, fixed = TRUE) &&
        identical(tail(.an4l, 5), c("", "[regression]", "# the text size, in points",
                                    "# takes: a number from 6 to 72", "size = 9")) &&
        "18" %in% .an4m && !"18" %in% .an4d && "24" %in% .an4d)

.an5in <- list.files(.akd)
.an5x <- file.path(.akd, "x")
.an5 <- lapply(list(
  bare1 = quote(jstyle(save.as = .an5x, fit.rows = c("r2", "n"))),
  bare2 = quote(jstyle(save.as = .an5x, total = "no")),
  bare3 = quote(jstyle(save.as = .an5x, fit.rows = c("r2", "n"), columns = c("n", "mean"))),
  nosave1 = quote(jstyle(size = 11)),
  nosave2 = quote(jstyle("apa", regression = list(fit.rows = "r2"))),
  list1 = quote(jstyle(save.as = .an5x, regression = "r2")),
  list2 = quote(jstyle(save.as = .an5x, regression = list("r2"))),
  sec1 = quote(jstyle(save.as = .an5x, regression = list(fit.row = "r2"))),
  sec2 = quote(jstyle(save.as = .an5x, regression = list(zzz = "r2"))),
  twice1 = quote(jstyle(save.as = .an5x, size = 11, size = 12)),
  twice2 = quote(jstyle(save.as = .an5x, regression = list(fit.rows = "r2", fit.rows = "n"))),
  near1 = quote(jstyle(save.as = .an5x, fit.row = "r2")),
  near2 = quote(jstyle(save.as = .an5x, sise = 11)),
  near3 = quote(jstyle(save.as = .an5x, regresion = list(fit.rows = "r2"))),
  val1 = quote(jstyle(save.as = .an5x, size = 99)),
  val2 = quote(jstyle(save.as = .an5x, regression = list(fit.rows = "r9")))),
  function(ex) res(eval(ex))$txt)
.an5out <- list.files(.akd)
check("AN04 a table type's setting given bare stops with the call rewritten, the setting in a list named for its section (\"for example\" where several sections hold it); two such settings move together",
      identical(.an5$bare1, paste0("[error] jstyle(): fit.rows = is a setting of a regression table and a\n",
                                   "logistic regression table, so it goes in a list named for its section,\n",
                                   "for example:\n",
                                   "  jstyle(save.as = .an5x, regression = list(fit.rows = c(\"r2\", \"n\")))")) &&
        identical(.an5$bare2, paste0("[error] jstyle(): total = is a setting of a crosstab, so it goes in a list\n",
                                     "named for its section:\n",
                                     "  jstyle(save.as = .an5x, crosstab = list(total = \"no\"))")) &&
        identical(gsub("\n {6}", " ", .an5$bare3),
                  paste0("[error] jstyle(): fit.rows = and columns = are settings of a table type, so\n",
                         "each goes in a list named for its section, for example:\n",
                         "  jstyle(save.as = .an5x, regression = list(fit.rows = c(\"r2\", \"n\")), descriptives = list(columns = c(\"n\", \"mean\")))")))
check("AN05 settings without save.as = stop with the call given save.as =; a section given other than a list of named settings, a name that is not one of its settings (near: did you mean; far: the section's settings), a setting given twice, a near-miss argument, and a value the setting does not take each stop; none of the stopped calls writes",
      identical(.an5$nosave1, paste0("[error] jstyle(): a style's settings are written to a new style file, so\n",
                                     "they need save.as =, for example:\n",
                                     "  jstyle(size = 11, save.as = \"mystyle\")")) &&
        identical(.an5$nosave2, paste0("[error] jstyle(): a style's settings are written to a new style file, so\n",
                                       "they need save.as =, for example:\n",
                                       "  jstyle(\"apa\", regression = list(fit.rows = \"r2\"), save.as = \"mystyle\")")) &&
        identical(.an5$list1, paste0("[error] jstyle(): regression = takes a list of the section's settings, each\n",
                                     "named, for example:\n",
                                     "  regression = list(columns = c(\"b\", \"se\", \"beta\", \"p\"))")) &&
        identical(.an5$list2, .an5$list1) &&
        identical(.an5$sec1, "[error] jstyle(): fit.row is not a setting of [regression].\nDid you mean fit.rows?") &&
        startsWith(.an5$sec2, "[error] jstyle(): zzz is not a setting of [regression].\nThe settings of [regression] are title, columns, columns.last,") &&
        endsWith(.an5$sec2, "\nA general setting may be set there too.") &&
        identical(.an5$twice1, "[error] jstyle(): size = is given twice.\nGive each setting once.") &&
        identical(.an5$twice2, "[error] jstyle(): regression = names fit.rows twice.\nGive each setting once.") &&
        identical(.an5$near1, "[error] jstyle(): 'fit.row' is not valid.\nDid you mean `fit.rows`?") &&
        identical(.an5$near2, "[error] jstyle(): 'sise' is not valid.\nDid you mean `size`?") &&
        identical(.an5$near3, "[error] jstyle(): 'regresion' is not valid.\nDid you mean `regression`?") &&
        identical(.an5$val1, "[error] jstyle(): `size` must be a number from 6 to 72.") &&
        startsWith(.an5$val2, "[error] jstyle(): `fit.rows` must be columns of a regression table, each\n") &&
        identical(.an5in, .an5out))

.an6 <- local({
  l <- .aklines(.an5$bare3, after = "for example:$")
  r <- res(eval(parse(text = l)[[1]]))
  f <- paste0(.an5x, ".jstyle")
  list(r = r, l = if (file.exists(f)) readLines(f, encoding = "UTF-8") else "")
})
check("AN06 the rewritten call runs as it stands: the short file holds both settings, each under its section",
      !startsWith(.an6$r$txt, "[error]") &&
        all(c("[descriptives]", "columns = n, mean", "[regression]", "fit.rows = r2, n") %in% .an6$l) &&
        which(.an6$l == "[descriptives]") < which(.an6$l == "columns = n, mean") &&
        which(.an6$l == "[regression]") < which(.an6$l == "fit.rows = r2, n"))

.an7 <- local({
  invisible(res(jstyle("apa", save.as = file.path(.akd, "full"))))
  f <- file.path(.akd, "full.jstyle")
  if (file.exists(f)) readLines(f, encoding = "UTF-8") else ""
})
# S407 rebuild (v0.9.275): rewritten -- the notes are no longer wrapped at
# 76 columns (Jeff, on the S407 walk: "each sentence should be on its own
# line"); each "# takes:" is one line, each note a line per choice.
check("AN07 a complete copy: every setting directly after its \"# takes:\" note, each on one line however long, no line opening \"#   \"; a setting's note one line, or one line per choice where it lists them (caption.form's apa, journal and report), a note held in several lines joined (leading.zero's, the longest); ?jstyle_settings joining the same lines, the choices with \"|\"",
      local({
        sets <- grep("^[a-z][a-z0-9.]* *= ", .an7)
        sets <- sets[!grepl("^(format|written\\.by|based\\.on) ", .an7[sets])]
        takes <- grep("^# takes: ", .an7)
        lz <- match("leading.zero = no", .an7)
        cf <- match("caption.form = apa", .an7)
        length(sets) == length(takes) && identical(takes, sets - 1L) &&
          !any(grepl("^#   ", .an7)) &&
          identical(.an7[lz - 2L], paste0("# ", paste(.jst_style_spec$general$leading.zero$about,
                                                      collapse = " "))) &&
          identical(.an7[cf - 4:2], paste0("# ", .jst_style_spec$general$caption.form$about)) &&
          max(nchar(.an7)) > 100L
      }) &&
        local({
          # The settings help page joins the same lines: a choice set off
          # with "|", any other line run on with a space.
          rd <- paste(.jst_style_settings_rd(), collapse = "\n")
          grepl("on the next line | journal: bold \"Table 1.\" and the title on one line | report: ",
                rd, fixed = TRUE) &&
            grepl("that cannot exceed 1, such as p (.23) | yes keeps it (0.23) | never drops it on every number",
                  rd, fixed = TRUE)
        }))

# =============================================================================
# AO. Exports, the settings help page, the orientation, and saving a result
# =============================================================================
cat("\n--- AO. Exports, help, orientation, saving a result ---\n")

check("AO01 jtable() and jstyle() are exported, and print() has a method for tables written together",
      all(c("jtable", "jstyle") %in% getNamespaceExports("jstats")) &&
        !is.null(utils::getS3method("print", "jst_tables", optional = TRUE)))

.ao2 <- tryCatch(.jst_style_settings_rd(), error = function(e) character(0))
.ao2parts <- names(.jst_style_type_nouns)
check("AO02 the ?jstyle_settings page, generated from the settings' own notes: plain ASCII, a section for the general settings and one per table type, an entry for every setting",
      !any(grepl("[^\\x01-\\x7F]", .ao2, perl = TRUE)) &&
        any(grepl("\\section{General settings}", .ao2, fixed = TRUE)) &&
        all(vapply(.ao2parts, function(p) any(grepl(paste0("\\section{[", p, "]: "), .ao2, fixed = TRUE)), logical(1))) &&
        sum(lengths(regmatches(.ao2, gregexpr("\\item{\\code{", .ao2, fixed = TRUE)))) ==
          sum(lengths(lapply(.jst_style_spec[c("general", .ao2parts)], names))))

.ao3 <- tryCatch(paste(.jst_orientation_body(), collapse = " "), error = function(e) "")
.ao3 <- gsub(" +", " ", .ao3)
check("AO03 the orientation (version 3.10; 3.9 until S409) holds the tables -- kept results to jtable(), one call one table, the document call, print(t1), the two built-in styles, the complete copy and the short call, open = TRUE, ?jstyle_settings, the editing rule the file heads give -- in lines no wider than 76 columns; a kept result saved with base R's saveRDS(); the skill's description names jtable and jstyle",
      identical(.jst_orientation_version, "3.10") &&
        grepl("- Publication tables come from `jtable()` on kept results:", .ao3, fixed = TRUE) &&
        grepl("One call makes one table;", .ao3, fixed = TRUE) &&
        grepl("`jtable(list(t1, t2), file = \"Tables.docx\")`", .ao3, fixed = TRUE) &&
        grepl("`print(t1)` shows a table in the console", .ao3, fixed = TRUE) &&
        grepl("the built-in `\"apa\"` for a journal or `\"report\"` for a report, or a `.jstyle` text file.", .ao3, fixed = TRUE) &&
        grepl("`jstyle(\"report\", save.as = \"myagency\")` writes a copy holding every setting", .ao3, fixed = TRUE) &&
        grepl("`jstyle(\"report\", save.as = \"mine\", font = \"Calibri\")` a short file holding only the settings given.", .ao3, fixed = TRUE) &&
        grepl("`jstyle(\"myagency\", open = TRUE)` opens it in the editor", .ao3, fixed = TRUE) &&
        grepl("`?jstyle_settings` lists every setting", .ao3, fixed = TRUE) &&
        grepl("edit its values, or add to a short file a setting from that list; do not invent a setting, and do not rename a setting or a section.", .ao3, fixed = TRUE) &&
        grepl("with base R's `saveRDS()` (read it back with `readRDS()`)", .ao3, fixed = TRUE) &&
        grepl("jtable, jstyle (publication tables in Word and .jstyle table styles)", .jst_skill_description(), fixed = TRUE) &&
        local({
          b <- .jst_orientation_body(); i <- grep("^- Publication tables", b)
          j <- i; while (j < length(b) && nzchar(b[j + 1L])) j <- j + 1L
          j - i >= 10L && all(nchar(b[i:j]) <= 76L)
        }))

.ao4f <- file.path(.akd, "m1.rds"); .ao4t <- file.path(.akd, "t1.rds")
saveRDS(.akm1, .ao4f); saveRDS(.alA, .ao4t)
.ao4 <- list(
  m = res(jsave(.akm1, "m1.rds"))$txt,
  m0 = res(jsave(.akm1))$txt,
  t = res(jsave(.alA, "t1.rds"))$txt,
  d = res(jsave(.amdoc, "doc.rds"))$txt,
  lm = res(jload(.ao4f))$txt,
  lt = res(jload(.ao4t))$txt)
check("AO04 jsave() given a result or a built table stops with the base R lines that keep it and read it back, in the file the call named with .rds (else the object's name; a table first offered its Word file); jload() given an .rds file holding one says so, with the line that reads it",
      identical(.ao4$m, paste0("[error] jsave(): '.akm1' is a jlm() result, not a data frame.\n",
                               "To keep it for a later session, save it with base R:\n",
                               "  saveRDS(.akm1, \"m1.rds\")\n",
                               "Then read it back with:\n",
                               "  .akm1 <- readRDS(\"m1.rds\")")) &&
        identical(.ao4$m0, gsub("\"m1.rds\"", "\".akm1.rds\"", .ao4$m, fixed = TRUE)) &&
        identical(.ao4$t, paste0("[error] jsave(): '.alA' is a table jtable() built, not a data frame.\n",
                                 "To write it to a Word file:\n",
                                 "  jtable(.alA, file = \"t1.docx\")\n",
                                 "To keep it for a later session, save it with base R:\n",
                                 "  saveRDS(.alA, \"t1.rds\")\n",
                                 "Then read it back with:\n",
                                 "  .alA <- readRDS(\"t1.rds\")")) &&
        startsWith(.ao4$d, "[error] jsave(): '.amdoc' is a set of tables jtable() put together, not a\ndata frame.\n") &&
        startsWith(.ao4$lm, "[error] jload(): m1.rds holds a jlm() result, not a data frame.\njload() loads data frames; read it back with base R:\n  m1 <- readRDS(\"") &&
        endsWith(gsub("\\s+", " ", .ao4$lm), "m1.rds\")") &&
        startsWith(.ao4$lt, "[error] jload(): t1.rds holds a table jtable() built, not a data frame.\n"))

# =============================================================================
# AP. The release build (S407): two codes with one label; the reserved
#     style name; a file named like the built-in; each table's font
# =============================================================================
cat("\n--- AP. Two codes with one label, the reserved name, the passed-over file, each table's font ---\n")

# Codes 1 and 2 both labelled "Other": each its own row and group, shown
# with its code where the labels collide (the (S399) item; the lean's
# default). Expected values come from the codes, never from the package.
.apw <- data.frame(G = haven::labelled(rep(c(1, 2, 3), each = 4),
                                       c(Other = 1, Other = 2, Third = 3)),
                   Y = c(1, 2, 3, 2, 10, 11, 12, 11, 5, 6, 7, 6),
                   H = rep(c(1, 2), 6))
.apc <- as.numeric(unclass(.apw$G))
.apm <- as.numeric(tapply(.apw$Y, .apc, mean))

.ap1 <- lapply(c(labels = "labels", both = "both", values = "values"), function(m)
  res(jfreq(.apw, G, value.id = m)))
.ap1v <- lapply(.ap1, function(r) r$val$frequencies$G$valid)
check("AP01 jfreq(): two codes with one label are two rows, each counted on its own code; under value.id = \"labels\" they show their codes (\"1: Other\", \"2: Other\") and a label no other code shares stays alone; Code and Label as the cells hold them",
      all(vapply(.ap1v, function(v) identical(as.integer(v$Freq), as.integer(table(.apc))), logical(1))) &&
        identical(.ap1v$labels$Value, c("1: Other", "2: Other", "Third")) &&
        identical(.ap1v$both$Value, c("1: Other", "2: Other", "3: Third")) &&
        identical(.ap1v$values$Value, c("1", "2", "3")) &&
        identical(as.numeric(.ap1v$labels$Code), c(1, 2, 3)) &&
        identical(.ap1v$labels$Label, c("Other", "Other", "Third")) &&
        grepl("\n1: Other +4 ", .ap1$labels$txt) && grepl("\n2: Other +4 ", .ap1$labels$txt))

.apz <- data.frame(Q = haven::labelled(c(1, 1, 1, 2, 2, 3),
  c("Agree that the policy should be enforced strictly" = 1,
    "Agree that the policy should be enforced loosely" = 2, Disagree = 3)))
.ap2 <- res(jfreq(.apz, Q, value.id = "labels"))$val$frequencies$Q$valid
.aph <- data.frame(K = haven::labelled(c(1, 1, 3, 3), c(Other = 1, Other = 2, Third = 3)))
.ap2z <- res(jfreq(.aph, K, value.id = "labels"))$val$frequencies$K$valid
.aplt <- paste("A long text code that runs well past forty columns:", c("one", "two"))
.apt <- data.frame(T = haven::labelled(.aplt[c(1, 1, 2)], c(First = .aplt[1])))
.ap2t <- res(jfreq(.apt, T, value.id = "values"))$val$frequencies$T$valid
check("AP02 jfreq(): two long labels the 40-column cap cuts alike are two rows, each with its code; a labelled value no case holds shares its label with a code that has cases and both rows show their codes, the empty one counted 0; two long text codes the cap cuts alike under value.id = \"values\" are two rows, shown whole",
      !is.null(.ap2) && identical(as.integer(.ap2$Freq), c(3L, 2L, 1L)) &&
        startsWith(.ap2$Value[1], "1: Agree that the policy") &&
        startsWith(.ap2$Value[2], "2: Agree that the policy") &&
        identical(.ap2$Value[3], "Disagree") &&
        all(nchar(.ap2$Value, type = "width") <= 40L) &&
        !is.null(.ap2z) && identical(.ap2z$Value, c("1: Other", "2: Other", "Third")) &&
        identical(as.integer(.ap2z$Freq), c(2L, 0L, 2L)) &&
        !is.null(.ap2t) && identical(.ap2t$Value, .aplt) &&
        identical(as.integer(.ap2t$Freq), c(2L, 1L)))

.apw2 <- .apw[.apc != 3, ]
.ap3 <- res(jt(Y ~ G, .apw2, value.id = "labels"))
.ap3t <- stats::t.test(.apw2$Y[.apc[.apc != 3] == 1], .apw2$Y[.apc[.apc != 3] == 2],
                       var.equal = TRUE)
check("AP03 jt(): two codes with one label are the test's two groups -- the t of the cases on code 1 against those on code 2 -- each shown with its code, where the test stopped on one category",
      !is.null(.ap3$val) && !grepl("[error]", .ap3$txt, fixed = TRUE) &&
        isTRUE(all.equal(as.numeric(.ap3$val$t), as.numeric(.ap3t$statistic))) &&
        identical(.ap3$val$descriptives$Group, c("1: Other", "2: Other")) &&
        identical(as.numeric(.ap3$val$descriptives_raw$group_code), c(1, 2)))

.ap4 <- res(jaov(Y ~ G, .apw, value.id = "labels", posthoc = TRUE))
.ap4b <- res(jaov(Y ~ G, .apw))$val
.ap4f <- stats::anova(stats::lm(.apw$Y ~ factor(.apc)))
check("AP04 jaov(): three codes, two sharing a label, are three groups with their own means, each printed beside its own code (the third, \"Third\", was printed as \"2: Other\"); the F is the codes' F; the post-hoc pairs name the codes",
      !is.null(.ap4$val) &&
        isTRUE(all.equal(as.numeric(.ap4$val$f), .ap4f[["F value"]][1])) &&
        identical(.ap4$val$descriptives$Group, c("1: Other", "2: Other", "Third")) &&
        identical(.ap4b$descriptives$Group, c("1: Other", "2: Other", "3: Third")) &&
        isTRUE(all.equal(.ap4$val$descriptives_raw$mean, .apm)) &&
        identical(as.numeric(.ap4$val$descriptives_raw$group_code), c(1, 2, 3)) &&
        identical(sort(paste(.ap4$val$posthoc$group1_code, .ap4$val$posthoc$group2_code)),
                  c("2 1", "3 1", "3 2")))

.ap5 <- res(jcrosstab(G ~ H, .apw, value.id = "labels"))
.ap5d <- res(jdesc(.apw, Y, by = G, value.id = "labels"))
check("AP05 jcrosstab() and jdesc(by =): a row per code, counted on the codes, its code beside a shared label; the grouped descriptives one group per code with its own mean",
      !is.null(.ap5$val) &&
        identical(as.numeric(.ap5$val$row_categories$code), c(1, 2, 3)) &&
        identical(unname(as.matrix(unclass(.ap5$val$observed))),
                  unname(as.matrix(unclass(table(.apc, .apw$H))))) &&
        grepl("\n1: Other ", .ap5$txt) && grepl("\n2: Other ", .ap5$txt) &&
        !is.null(.ap5d$val) &&
        identical(as.numeric(.ap5d$val$descriptives_raw$group_code), c(1, 2, 3)) &&
        isTRUE(all.equal(.ap5d$val$descriptives_raw$mean, .apm)) &&
        grepl("\n1: Other ", .ap5d$txt) && grepl("\n2: Other ", .ap5d$txt))

.ap6 <- res(jplot(.apw, G))$val
.ap6b <- res(jplot(.apw, Y, by = G))$val
.ap6f <- res(jplot(.apw, H, facet = G))$val
.ap6a <- res(jaov(Y ~ G, .apw, print = FALSE))$val
.ap6r <- res(jplot(.ap6a))$val
# A result whose table does not match its groups (one an older version
# made, here its last row cut) keeps the plot's own names for the groups.
.ap6o <- .ap6a; .ap6o$descriptives <- .ap6o$descriptives[1:2, ]
.ap6or <- res(jplot(.ap6o))$val
.ap6lv <- c("1: Other", "2: Other", "Third")
check("AP06 jplot(): a bar for each code, a group for each code under by =, a panel for each under facet =, and a box for each in a jaov() result's plot (and in an older result's, by the plot's own names) -- two codes with one label named with their codes",
      identical(levels(.ap6or$data$group), .ap6lv) &&
      inherits(.ap6, "ggplot") &&
        identical(levels(.ap6$data[[1]]), .ap6lv) &&
        identical(as.integer(table(.ap6$data[[1]])), as.integer(table(.apc))) &&
        identical(levels(.ap6b$data$by), .ap6lv) &&
        identical(levels(.ap6f$data$facet), .ap6lv) &&
        identical(levels(.ap6r$data$group), c("1: Other", "2: Other", "3: Third")) &&
        identical(as.integer(table(.ap6r$data$group)), as.integer(table(.apc))))

# The factor the analyses make agrees with haven::as_factor() wherever no
# two codes share a label: every labelled column of community, its
# declared missing values masked as an analysis masks them; and a declared
# missing value still live is missing, not a level (haven::as_factor()
# makes it one).
.ap7cols <- names(tcm)[vapply(tcm, haven::is.labelled, logical(1))]
.ap7s <- haven::labelled_spss(c(1, 2, -99, 1), c(A = 1, B = 2, Refused = -99), na_values = -99)
check("AP07 .jst_code_factor() names a labelled variable's categories as haven::as_factor() does where no two codes share a label (every labelled column of community, declared missing values masked), and a declared missing value still live is missing, not a level",
      length(.ap7cols) >= 3L &&
        all(vapply(.ap7cols, function(v) {
          a <- droplevels(haven::as_factor(haven::zap_missing(tcm[[v]])))
          b <- .jst_code_factor(tcm[[v]])
          identical(levels(a), levels(b)) && identical(as.character(a), as.character(b))
        }, logical(1))) &&
        identical(levels(.jst_code_factor(.ap7s)), c("A", "B")) &&
        is.na(.jst_code_factor(.ap7s)[3]) &&
        # The last resort: a text code that reads as another code's "code:
        # label" name still makes a category of its own.
        local({
          f <- .jst_code_factor(haven::labelled(c("1", "2", "1: X"), c(X = "1", X = "2")))
          nlevels(f) == 3L && all(as.integer(table(f)) == 1L)
        }))

.ap8f <- res(jtable(.ap1$labels$val, print = FALSE))$val
.ap8a <- res(jtable(.ap4b, print = FALSE))$val
.ap8x <- res(jtable(.ap5$val, print = FALSE))$val
check("AP08 the tables: a frequency table's rows, an ANOVA table's group heads and its n sentence, and a crosstab's rows name two codes with one label by code and label",
      identical(vapply(.ap8f$rows, `[[`, "", "label")[-1], c("1: Other", "2: Other", "Third")) &&
        identical(vapply(.ap8a$spanners[[2]], `[[`, "", "label"), c("1: Other", "2: Other", "Third")) &&
        identical(.jst_table_note_lines(.ap8a, .ap8a$style, plain = TRUE),
                  "Note. n = 4 (1: Other), 4 (2: Other), and 4 (Third).") &&
        identical(vapply(.ap8x$rows, `[[`, "", "label")[-1], c("1: Other", "2: Other", "Third")))

# The reserved name, and a file named like the built-in (the (S406) item
# and the lean's default: one note where the file is passed over).
.apd <- file.path(tempdir(), "tables_check_s407"); unlink(.apd, recursive = TRUE); dir.create(.apd)
options(.jst_options_style_dir = .apd)
.ap9 <- list(r = res(jstyle("apa", save.as = "report"))$txt,
             R = res(jstyle("apa", save.as = file.path(.apd, "REPORT"), size = 11))$txt,
             my = res(jstyle("apa", save.as = "myreport", size = 11))$txt)
check("AP09 jstyle(save.as =) refuses \"report\" -- reserved at S407 for a built-in to come, built in since S409 -- in any case and with a folder, as it refuses \"apa\", writing nothing; \"myreport\" is written",
      identical(.ap9$r, paste0("[error] jstyle(): \"report\" is the name of a style built into jstats.\n",
                               "Give the copy another name, for example:\n",
                               "  jstyle(\"apa\", save.as = \"myreport\")")) &&
        identical(.ap9$R, sub("\"report\"", "\"REPORT\"", .ap9$r, fixed = TRUE)) &&
        !any(grepl("^report\\.jstyle$", list.files(.apd), ignore.case = TRUE)) &&
        file.exists(file.path(.apd, "myreport.jstyle")))

.wsty("apa", "font = Shadow", dir = .apd)
.wsty("onapa", "based.on = apa", "size = 11", dir = .apd)
.apnote <- paste0("This file is not read, since \"apa\" always names a style built into jstats:\n",
                  "  ", .jst_norm_path(file.path(.apd, "apa.jstyle")), "\n",
                  "To use it, rename it, for example to myapa.jstyle, and use style = \"myapa\".")
# A note is kept off res()'s text (guard 4); .apmsg() reads the notes a
# call raises as well, leaving res() to record them for the sweep. Both
# are read without color (a session with jstats.color = TRUE).
.apmsg <- function(expr) {
  m <- character(0)
  r <- res(withCallingHandlers(expr, message = function(c) m <<- c(m, conditionMessage(c))))
  r$txt <- .strip_ansi(r$txt)
  c(r, list(msg = .strip_ansi(m)))
}
.ap10 <- list(sty = .apmsg(jstyle("apa")), tab = .apmsg(jtable(jdesc(tcm, Age, print = FALSE))),
              lst = .apmsg(jstyle()), on = .apmsg(.jst_style_resolve("onapa")))
unlink(file.path(.apd, "apa.jstyle"))
.ap10x <- .apmsg(jstyle("apa"))
check("AP10 a file named apa.jstyle in a folder searched is passed over with one note naming it, a blank line after -- where a call names the built-in or takes it as the session's style (jstyle(\"apa\"), jtable()), and under jstyle()'s list -- not where a file's based.on reaches apa; gone with the file",
      identical(.ap10$sty$msg, paste0(.apnote, "\n")) &&
        startsWith(.ap10$sty$txt, "\nStyle: apa\n") &&
        identical(.jst_style_key(.ap10$sty$val, "general", "font"), "Times New Roman") &&
        identical(.ap10$tab$msg, paste0(.apnote, "\n")) &&
        startsWith(.ap10$tab$txt, "\nTable 1. ") &&
        identical(.ap10$lst$msg, paste0(.apnote, "\n")) &&
        !any(grepl("is not read", .ap10$on$msg, fixed = TRUE)) &&
        identical(.jst_style_key(.ap10$on$val, "general", "size"), 11) &&
        !any(grepl("is not read", .ap10x$msg, fixed = TRUE)) &&
        startsWith(.ap10x$txt, "Style: apa\n"))
options(.jst_options_style_dir = .ns)

# Each table keeps its own style's font in a document of tables built under
# two styles (the (S406) item): read from the runs of document.xml.
.wsty("arial11", "font = Arial", "size = 11", dir = .apd)
.ap11a <- jtable(jdesc(tcm, Age, Income, print = FALSE), print = FALSE)
.ap11b <- jtable(jfreq(tcm, Region, print = FALSE), style = file.path(.apd, "arial11.jstyle"),
                 print = FALSE)
.apdoc <- function(tabs, f) {
  p <- file.path(.apd, f)
  res(jtable(tabs, file = p, print = FALSE, overwrite = TRUE))
  x <- function(part) {
    d <- utils::unzip(p, part, exdir = tempfile("apx"))
    paste(readLines(d, warn = FALSE, encoding = "UTF-8"), collapse = "")
  }
  doc <- x("word/document.xml")
  list(tbl = regmatches(doc, gregexpr("<w:tbl>.*?</w:tbl>", doc, perl = TRUE))[[1]],
       body = doc,
       def = regmatches(x("word/styles.xml"), regexpr("(?<=<w:rFonts w:ascii=\")[^\"]+", x("word/styles.xml"), perl = TRUE)))
}
.apcount <- function(s, pat) lengths(regmatches(s, gregexpr(pat, s, fixed = TRUE)))
.ap11 <- .apdoc(list(.ap11a, .ap11b), "two_fonts.docx")
.ap11r <- .apdoc(list(.ap11b, .ap11a), "two_fonts_r.docx")
.ap11s <- .apdoc(.ap11a, "one_font.docx")
.aprf <- function(f) paste0("<w:rFonts w:ascii=\"", f, "\" w:hAnsi=\"", f, "\" w:cs=\"", f,
                            "\" w:eastAsia=\"", f, "\"/>")
check("AP11 a document of tables built under two styles: the defaults are the first table's; the other table names its own font on every run and paragraph mark, and its size on the marks that carry none; a table in the document's font names none, as a single table's file names none",
      length(.ap11$tbl) == 2L && identical(.ap11$def, "Times New Roman") &&
        !grepl("<w:rFonts", .ap11$tbl[1], fixed = TRUE) &&
        .apcount(.ap11$tbl[2], "<w:r>") == .apcount(.ap11$tbl[2], paste0("<w:r><w:rPr>", .aprf("Arial"))) &&
        .apcount(.ap11$tbl[2], "</w:pPr>") == .apcount(.ap11$tbl[2], paste0("<w:rPr>", .aprf("Arial"))) - .apcount(.ap11$tbl[2], "<w:r>") &&
        !grepl("<w:pPr>(?:(?!</w:pPr>).)*<w:rPr><w:rFonts[^>]*/></w:rPr></w:pPr>", .ap11$tbl[2], perl = TRUE) &&
        identical(.ap11r$def, "Arial") && !grepl("<w:rFonts", .ap11r$tbl[1], fixed = TRUE) &&
        .apcount(.ap11r$tbl[2], "<w:r>") == .apcount(.ap11r$tbl[2], paste0("<w:r><w:rPr>", .aprf("Times New Roman"))) &&
        !grepl("<w:rFonts", .ap11s$body, fixed = TRUE))

.apx <- paste0("<w:p><w:pPr><w:jc w:val=\"left\"/></w:pPr><w:r><w:t>a</w:t></w:r>",
               "<w:r><w:rPr><w:b/></w:rPr><w:t>b</w:t></w:r></w:p>",
               "<w:p><w:pPr><w:rPr><w:sz w:val=\"18\"/></w:rPr></w:pPr></w:p>")
check("AP12 .jst_docx_retype(): nothing to change leaves the XML as it was; a font goes first in every run's properties and every paragraph mark's, a size only on the marks that carry none",
      identical(.jst_docx_retype(.apx), .apx) &&
        identical(.jst_docx_retype(.apx, font = "Arial", size = 11),
                  paste0("<w:p><w:pPr><w:jc w:val=\"left\"/><w:rPr>", .aprf("Arial"),
                         "<w:sz w:val=\"22\"/><w:szCs w:val=\"22\"/></w:rPr></w:pPr>",
                         "<w:r><w:rPr>", .aprf("Arial"), "</w:rPr><w:t>a</w:t></w:r>",
                         "<w:r><w:rPr>", .aprf("Arial"), "<w:b/></w:rPr><w:t>b</w:t></w:r></w:p>",
                         "<w:p><w:pPr><w:rPr>", .aprf("Arial"), "<w:sz w:val=\"18\"/></w:rPr></w:pPr></w:p>")) &&
        identical(.jst_docx_retype(.apx, size = 11),
                  sub("<w:pPr><w:jc w:val=\"left\"/></w:pPr>",
                      "<w:pPr><w:jc w:val=\"left\"/><w:rPr><w:sz w:val=\"22\"/><w:szCs w:val=\"22\"/></w:rPr></w:pPr>",
                      .apx, fixed = TRUE)))

# The Word file's widths in the table's own font (the S407 rebuild, on
# Jeff's walk: an Arial 11 table measured in Times wrapped its labels).
# Expected widths come from the faces' published metrics, typed here in
# thousandths of an em -- Times Roman for Times New Roman, Helvetica for
# Arial -- never from the package's own tables.
.aptimes <- c(a = 444, b = 500, c = 444, d = 500, e = 444, f = 333, g = 500, h = 500,
              i = 278, j = 278, k = 500, l = 278, m = 778, n = 500, o = 500, p = 500,
              q = 500, r = 333, s = 389, t = 278, u = 500, v = 500, w = 722, x = 500,
              y = 500, z = 444, " " = 250, A = 722, B = 667, C = 667, D = 722,
              F = 556, N = 722, R = 667, S = 556, T = 611, V = 722, Y = 722,
              "%" = 833, "0" = 500, "1" = 500, ":" = 278,
              "." = 250, "3" = 500)
.aphelv <- c(a = 556, b = 556, c = 500, d = 556, e = 556, f = 278, g = 556, h = 556,
             i = 222, j = 222, k = 500, l = 222, m = 833, n = 556, o = 556, p = 556,
             q = 556, r = 333, s = 500, t = 278, u = 556, v = 500, w = 722, x = 500,
             y = 500, z = 500, " " = 278, A = 667, B = 667, C = 722, D = 722,
             F = 611, N = 722, R = 722, S = 667, T = 611, V = 667, Y = 667,
             "%" = 889, "1" = 556,
             "." = 278, "3" = 556)
.apem <- function(s, tab) sum(tab[strsplit(s, "")[[1]]]) / 1000
# A text's width in twips as the writer measures it: its ems, 6 percent
# more, at the size's 20 twips a point (bold 8 percent more again).
.aptw <- function(s, tab, pt, bold = 1) ceiling(.apem(s, tab) * 1.06 * pt * 20 * bold)
# The width checks below (AP13-AP18) measure labels, numbers and titles;
# their tables are built with N in the note, as apa built them until
# ruling R59 (S409, built S410), so the title the S407 rule widens a table
# to is the template's alone. N after the title is checked in AR.
.apn <- .wsty("apnote", "n.position = note", dir = .apd)
.wsty("ar11", "font = Arial", "size = 11", "n.position = note", dir = .apd)
.wsty("boldhead", "header.bold = yes", "n.position = note", dir = .apd)
.apq <- data.frame(Q1 = haven::labelled(c(1, 1, 2, 3, 3, 3),
                                        c("Strongly disagree" = 1, Neutral = 2,
                                          "Strongly agree" = 3)),
                   C = haven::labelled(c(1, 1, 2, 2, 2, 1), c(A = 1, B = 2)),
                   S = haven::labelled(c(1, 1, 2, 2, 2, 1), c(Yes = 1, No = 2)),
                   L = haven::labelled(c(1, 2, 2, 1, 2, 2), c("Reached by the agency through the post" = 1,
                                                     Phone = 2)))
attr(.apq$Q1, "label") <- "Q1"
attr(.apq$C, "label") <- "Contact method used by the agency to reach you"
.apgrid <- function(tbl, f) {
  p <- file.path(.apd, f)
  res(jtable(tbl, file = p, print = FALSE, overwrite = TRUE))
  x <- utils::unzip(p, "word/document.xml", exdir = tempfile("apg"))
  d <- paste(readLines(x, warn = FALSE, encoding = "UTF-8"), collapse = "")
  list(g = as.integer(regmatches(d, gregexpr("(?<=<w:gridCol w:w=\")[0-9]+", d, perl = TRUE))[[1]]),
       tabs = as.integer(unique(regmatches(d, gregexpr("(?<=<w:tab w:val=\"decimal\" w:pos=\")[0-9]+", d, perl = TRUE))[[1]])))
}
.apq1 <- res(jfreq(.apq, Q1, print = FALSE))$val
.apqC <- res(jfreq(.apq, C, print = FALSE))$val
.ap13t <- res(jtable(.apq1, style = .apn, print = FALSE))$val
.ap13a <- res(jtable(.apq1, style = file.path(.apd, "ar11.jstyle"), print = FALSE))$val
.ap13L <- res(jtable(res(jfreq(.apq, L, print = FALSE))$val, style = .apn, print = FALSE))$val
.ap13fw <- res(lapply(list(none = NULL, empty = "", tnr = "Times New Roman", t = " times ",
                           ls = "Liberation Serif", ar = "ARIAL", hv = "Helvetica",
                           ca = "Calibri", cr = "carlito", vd = "Verdana"),
                      function(f) .jst_docx_font_widths(f)))$val
check("AP13 the widths a table is measured in follow its font: Times New Roman's for that face, its kin and no font named (as before); Arial's for Arial and Helvetica, in any case; Calibri's (its own metrics, as Carlito gives them) for Calibri and Carlito; for any other face each character at least as wide as in all three; a text measured in Arial as its Helvetica metrics give; the stub's two-line floor measured in the font too",
      identical(as.numeric(.ap13fw$none), as.numeric(.jst_docx_char_widths)) &&
        identical(attr(.ap13fw$none, "other"), 500) &&
        all(vapply(.ap13fw[c("empty", "tnr", "t", "ls")], identical, logical(1), .ap13fw$none)) &&
        identical(.ap13fw$ar, .ap13fw$hv) && identical(.ap13fw$ca, .ap13fw$cr) &&
        !identical(.ap13fw$ar, .ap13fw$none) && !identical(.ap13fw$ca, .ap13fw$ar) &&
        all(.ap13fw$ar[names(.aphelv)] == .aphelv) && all(.ap13fw$none[names(.aptimes)] == .aptimes) &&
        all(.ap13fw$ca[c("a", "e", "n", "o", "3", "%")] == c(479, 498, 525, 527, 507, 715)) &&
        all(.ap13fw$vd[names(.ap13fw$none)] >= pmax(.ap13fw$none, .ap13fw$ar[names(.ap13fw$none)],
                                                    .ap13fw$ca[names(.ap13fw$none)])) &&
        isTRUE(all.equal(.jst_docx_em_width("Strongly disagree", "Arial"),
                         .apem("Strongly disagree", .aphelv) * 1.06)) &&
        isTRUE(all.equal(.jst_docx_em_width("Strongly disagree"),
                         .apem("Strongly disagree", .aptimes) * 1.06)) &&
        .jst_docx_stub_floor(.ap13L, 11, 4000L, font = "Arial") >
          .jst_docx_stub_floor(.ap13L, 11, 4000L) &&
        .jst_docx_stub_floor(.ap13L, 11, 4000L) > 2160L)

.ap14t <- .apgrid(.ap13t, "q1_times.docx")
.ap14a <- .apgrid(.ap13a, "q1_arial.docx")
.ap14x <- function(tab, pt) {
  w <- max(.aptw("33.3", tab, pt), .aptw("%", tab, pt)) + 216 + 120
  inner <- w - 216
  head <- .aptw("33", tab, pt); tail <- .aptw(".3", tab, pt)
  c(width = w, tab = max(head, min(inner - tail - 40, floor((inner + head - tail) / 2))))
}
check("AP14 the Word file measures each label in the table's font beside its indent as written (180 twips a level; until this build two spaces): the stub of a frequency table in apa and in an Arial 11 style holds its widest category, the % column its numbers, its decimal stop placed from the same widths",
      identical(.ap14t$g[1], as.integer(.aptw("Strongly disagree", .aptimes, 12) + 180 + 216)) &&
        identical(.ap14a$g[1], as.integer(.aptw("Strongly disagree", .aphelv, 11) + 180 + 216)) &&
        identical(.ap14t$g[3], as.integer(.ap14x(.aptimes, 12)[["width"]])) &&
        identical(.ap14a$g[3], as.integer(.ap14x(.aphelv, 11)[["width"]])) &&
        as.integer(.ap14x(.aptimes, 12)[["tab"]]) %in% .ap14t$tabs &&
        as.integer(.ap14x(.aphelv, 11)[["tab"]]) %in% .ap14a$tabs &&
        !(as.integer(.ap14x(.aptimes, 11)[["tab"]]) %in% .ap14a$tabs))

.ap15 <- .apgrid(res(jtable(.apqC, style = .apn, print = FALSE))$val, "c_times.docx")
.ap15t <- res(jtable(.apqC, style = .apn, print = FALSE))$val
.ap15n <- .ap15t; .ap15n$rows <- Filter(function(r) !identical(r$kind, "heading"), .ap15n$rows)
# Fitted to a page too narrow for the label: the label row spans the
# table, so the stub narrows past it at the table's own size (the floor
# and the report read the data rows); and a page between the data rows'
# measure and the label's keeps the table portrait.
.ap15s <- .jst_table_style(.ap15t, "apa")
.ap15o <- sum(.jst_docx_widths(.ap15t, .ap15s, size = 12, pad = 60L)[-1L])
.ap15f <- res(.jst_docx_fit(.ap15t, .ap15s, .ap15o + 2500L))$val
.ap15r <- res(.jst_table_page_text(.ap15t, list(landscape = FALSE, fit = .ap15f,
                                                style = .ap15s, size0 = 12)))$val
.ap15x <- res(local({
  x <- .ap15t; k <- 0L
  repeat {
    k <- k + 1L
    x$columns$label[3] <- strrep("x", k)
    w <- .jst_docx_widths(x, .ap15s, size = 12, pad = 60L)
    if (sum(w[-1L]) >= .jst_docx_page("a4", FALSE)$text - 1800L || k > 300L) break
  }
  list(tbl = x, w = w, lay = .jst_docx_layout(list(x), .jst_style_resolve("apa")))
}))$val
check("AP15 a variable's label row sets the first column's width as a category's does, as the console's preview sets it (Jeff, on the S407 walk: the label \"should define the width of that first column\"): the stub as wide as the label, the n and % columns beside it as in AP14; in a table fitted to its page the label row spans the table, so the stub narrows past it at the table's size, the report not saying labels wrap, the two-line floor and the turn of the page read from the categories",
      identical(.ap15$g[1], as.integer(.aptw("Contact method used by the agency to reach you", .aptimes, 12) + 216)) &&
        identical(.ap15$g[-1], .ap14t$g[-1]) &&
        identical(.jst_docx_stub_floor(.ap15t, 12, 4000L), .jst_docx_stub_floor(.ap15n, 12, 4000L)) &&
        identical(.ap15f$size, 12) && identical(.ap15f$widths[1L], 2500L) &&
        identical(.ap15r, "on a portrait page") &&
        sum(.ap15x$w[-1L]) + .ap15x$w[1L] > .jst_docx_page("a4", FALSE)$text &&
        isFALSE(.ap15x$lay[[1]]$landscape))

.ap16 <- .apgrid(res(jtable(.apq1, style = file.path(.apd, "boldhead.jstyle"), print = FALSE))$val,
                 "q1_bold.docx")
.wsty("boldvar", "n.position = note", "[frequencies]", "variable.headings = bold", dir = .apd)
.ap16v <- .apgrid(res(jtable(.apqC, style = file.path(.apd, "boldvar.jstyle"), print = FALSE))$val,
                  "c_bold.docx")
check("AP16 a header set bold is measured bold, about 8 percent wider: the n column, set by its head, widens; the same table in apa keeps the upright width; a variable's label row set bold sets the stub at its bold width",
      identical(.ap16$g[2], as.integer(.aptw("n", .aptimes, 12, bold = 1.08) + 216 + 120)) &&
        identical(.ap14t$g[2], as.integer(.aptw("n", .aptimes, 12) + 216 + 120)) &&
        .ap16$g[2] > .ap14t$g[2] &&
        identical(.ap16v$g[1], as.integer(.aptw("Contact method used by the agency to reach you",
                                                .aptimes, 12, bold = 1.08) + 216)))

# A table narrower than its title widens to it (the title is the table's
# first row under caption.position = row), every column in proportion, as
# far as the page; under caption.position = paragraph nothing moves.
.wsty("parcap", "caption.position = paragraph", "n.position = note", dir = .apd)
.ap18s <- res(jfreq(.apq, S, print = FALSE))$val
.ap18 <- .apgrid(res(jtable(.ap18s, style = .apn, print = FALSE))$val, "s_row.docx")
.ap18p <- .apgrid(res(jtable(.ap18s, style = file.path(.apd, "parcap.jstyle"), print = FALSE))$val,
                  "s_par.docx")
.ap18L <- .apgrid(res(jtable(.ap18s, title = paste(rep("Frequency Distributions", 6), collapse = " "),
                             style = .apn, print = FALSE))$val, "s_long.docx")
.ap18nat <- as.integer(c(.aptw("Variable", .aptimes, 12) + 216, .aptw("n", .aptimes, 12) + 336,
                         .aptw("33.3", .aptimes, 12) + 336))
.ap18to <- as.integer(.aptw("Frequency Distributions", .aptimes, 12) + 216)
.wsty("jcap", "caption.form = journal", "n.position = note", dir = .apd)
.wsty("rcap", "caption.form = report", "n.position = note", dir = .apd)
.ap18t <- res(jtable(.ap18s, style = .apn, print = FALSE))$val
.ap18cw <- res(vapply(c(apa = "apa", journal = file.path(.apd, "jcap.jstyle"),
                        report = file.path(.apd, "rcap.jstyle")),
                      function(s) .jst_docx_caption_width(.ap18t, .jst_style_resolve(s), 1L),
                      integer(1)))$val
# Ten tables in one file: the tenth is measured with its own number.
.ap18j <- res(jtable(.ap18s, style = file.path(.apd, "jcap.jstyle"), print = FALSE))$val
.ap18ten <- res(.jst_docx_layout(rep(list(.ap18j), 10L), .jst_style_resolve("apa")))$val
check("AP18 a table narrower than its title widens to keep the title on one line (Jeff, on the S407 walk: \"Frequency Distributions should be on a single line\"): every column in proportion, the rounding's remainder to the stub; a title wider than the page widens it to the page and wraps there; a caption set as a paragraph widens nothing; the title's width in each caption form (apa's title under its bold number, the journal's bold number and title on one line, the report's all bold), the tenth table of a file measured as Table 10)",
      identical(.ap18p$g, .ap18nat) &&
        .ap18to > sum(.ap18nat) &&
        identical(sum(.ap18$g), .ap18to) &&
        identical(.ap18$g[-1], as.integer(floor(.ap18nat[-1] * .ap18to / sum(.ap18nat)))) &&
        identical(sum(.ap18L$g), .jst_docx_page("a4", FALSE)$text) &&
        identical(unname(.ap18cw), as.integer(c(
          .ap18to,
          .aptw("Table 1.", .aptimes, 12, bold = 1.08) + .aptw(" Frequency Distributions", .aptimes, 12) + 216,
          .aptw("Table 1: Frequency Distributions", .aptimes, 12, bold = 1.08) + 216))) &&
        identical(sum(.ap18ten[[10]]$fit$widths),
                  as.integer(.aptw("Table 10.", .aptimes, 12, bold = 1.08) +
                               .aptw(" Frequency Distributions", .aptimes, 12) + 216)) &&
        identical(sum(.ap18ten[[1]]$fit$widths), unname(.ap18cw[["journal"]])))

# A table wider than its page: the stub's two-line floor, measured in the
# table's font, decides the size it is fitted at and whether it turns the
# page (R55). The page widths are set here between the floor measured in
# Arial and the floor measured in Times, so the two measures part.
.ap17t <- res(jtable(res(jfreq(.apq, L, print = FALSE))$val,
                     style = file.path(.apd, "ar11.jstyle"), print = FALSE))$val
.ap17s <- .jst_table_style(.ap17t, "apa")
.ap17w <- .jst_docx_widths(.ap17t, .ap17s, size = 11, pad = 60L)
.ap17fa <- res(.jst_docx_stub_floor(.ap17t, 11, .ap17w[1L], font = "Arial"))$val
.ap17ft <- res(.jst_docx_stub_floor(.ap17t, 11, .ap17w[1L]))$val
.ap17f <- res(.jst_docx_fit(.ap17t, .ap17s, sum(.ap17w[-1L]) + as.integer((.ap17fa + .ap17ft) / 2)))$val
.ap17x <- res(local({
  x <- .ap17t; k <- 0L
  repeat {
    k <- k + 1L
    x$columns$label[3] <- strrep("x", k)
    w <- .jst_docx_widths(x, .ap17s, size = 11, pad = 60L)
    if (sum(w[-1L]) >= .jst_docx_page("a4", FALSE)$text - as.integer((.ap17fa + .ap17ft) / 2) ||
        k > 200L) break
  }
  list(tbl = x, w = w)
}))$val
.ap17l <- res(.jst_docx_layout(list(.ap17x$tbl), .jst_style_resolve("apa")))$val
check("AP17 an Arial table wider than its page is fitted with its stub's floor measured in Arial: on a page between the two measures it steps down to 10 points, where a Times measure would keep 11; and on a portrait page that only the Arial measure overflows it turns the page",
      .ap17fa > .ap17ft &&
        identical(.ap17f$size, 10) &&
        sum(.ap17x$w[-1L]) + .ap17fa > .jst_docx_page("a4", FALSE)$text &&
        sum(.ap17x$w[-1L]) + .ap17ft <= .jst_docx_page("a4", FALSE)$text &&
        isTRUE(.ap17l[[1]]$landscape))

# =============================================================================
# AQ. Capability Slate U, build 1 (S409): the built-in report style, the three
#     new looks, jstyle(open = TRUE), the file heads, Fix Slate V
# =============================================================================
cat("\n--- AQ. The report style, the new looks, open =, the heads ---\n")

.aqd <- file.path(tempdir(), "tables_check_s409"); unlink(.aqd, recursive = TRUE); dir.create(.aqd)
# Work outside check() (guard 3): a build without one of these pieces reds
# its checks rather than halting the battery.
.aqtry <- function(expr) tryCatch(expr, error = function(e) NULL)
.aqf  <- res(jfreq(tcm, Smoker, Region, print = FALSE))$val
.aqx  <- res(jcrosstab(Smoker ~ Volunteer, tcm, print = FALSE))$val
.aqm  <- res(jlm(WellbeingScore ~ Age + Region, tcm, categorical = Region, print = FALSE))$val
.aqc  <- res(jcorr(tcm, WellbeingScore, Age, Income, print = FALSE))$val
.aqdx <- function(f) {
  if (!file.exists(f)) return("")
  x <- file.path(.aqd, paste0("x_", tools::file_path_sans_ext(basename(f))))
  unlink(x, recursive = TRUE); invisible(utils::unzip(f, exdir = x))
  list(doc = paste(readLines(file.path(x, "word", "document.xml"), warn = FALSE,
                             encoding = "UTF-8"), collapse = ""),
       sty = paste(readLines(file.path(x, "word", "styles.xml"), warn = FALSE,
                             encoding = "UTF-8"), collapse = ""))
}
.aqrows <- function(doc) regmatches(doc, gregexpr("<w:tr>.*?</w:tr>", doc, perl = TRUE))[[1]]
.aqrow  <- function(rows, text) rows[grep(paste0(">", text, "<"), rows, fixed = TRUE)[1]]
.aqfill <- function(x) regmatches(x, gregexpr("(?<=w:fill=\")[0-9A-F]{6}", x, perl = TRUE))[[1]]

# The report style, resolved: its layers and every setting against apa's.
.aq1 <- res(.jst_style_resolve("report"))$val
.aq1own <- c(font = "Arial", size = "10", caption.form = "report", caption.size = "10",
             header.fill = "D9D9D9", header.bold = "yes", note.label = "Note:",
             note.label.italic = "no", note.size = "9", leading.zero = "yes")
.aq1diff <- .aqtry(local({
  out <- character(0)
  for (p in c("general", names(.jst_style_type_nouns))) {
    for (k in names(.jst_style_spec[[p]])) {
      if (!identical(.jst_style_key(.aq1, p, k), .jst_style_key(.jst_style_apa, p, k))) {
        out <- c(out, paste0(p, ":", k))
      }
    }
  }
  out
}))
check("AQ01 report is a built-in style, a short style based on apa (its layers report, then apa; no file): Arial 10, the caption 10 and the note 9, the report caption form, a D9D9D9 bold header, the zero kept, an upright \"Note:\", each variable's label row bold -- and every other setting apa's, the three new looks off; no name is kept for a built-in to come",
      identical(names(.jst_style_builtin()), c("apa", "report")) &&
        identical(.jst_style_reserved, character(0)) &&
        inherits(.aq1, "jst_style") && is.na(.aq1$path) &&
        identical(vapply(.aq1$layers, function(L) L$source, ""), c("report", "apa")) &&
        all(vapply(names(.aq1own), function(k) {
          identical(as.character(.jst_style_key(.aq1, "general", k)), .aq1own[[k]])
        }, logical(1))) &&
        all(vapply(c("frequencies", "regression", "logistic", "crosstab"), function(p) {
          identical(.jst_style_key(.aq1, p, "variable.headings"), "bold")
        }, logical(1))) &&
        identical(sort(.aq1diff),
                  sort(c(paste0("general:", names(.aq1own)),
                         paste0(c("frequencies", "regression", "logistic", "crosstab"),
                                ":variable.headings")))) &&
        identical(.jst_style_key(.aq1, "general", "caption.fill"), "none") &&
        identical(.jst_style_key(.aq1, "general", "heading.fill"), "none") &&
        identical(.jst_style_key(.aq1, "general", "rules"), "apa") &&
        identical(.jst_style_key(.aq1, "general", "band.fill"), "none"))

# The three new settings: their place, their values in apa, what each takes.
.aq2sp <- .jst_style_spec$general
.aq2 <- .aqtry(list(
  hdr  = res(.jst_style_check_value("caption.fill", .aq2sp$caption.fill, "Header", "general", "jtable"))$val,
  nav  = res(.jst_style_check_value("caption.fill", .aq2sp$caption.fill, "navy", "general", "jtable"))$val,
  hex  = res(.jst_style_check_value("heading.fill", .aq2sp$heading.fill, "#d3e3e5", "general", "jtable"))$val,
  bad1 = res(.jst_style_check_value("heading.fill", .aq2sp$heading.fill, "header", "general", "jtable"))$txt,
  bad2 = res(.jst_style_check_value("caption.fill", .aq2sp$caption.fill, "teal2", "general", "jtable"))$txt,
  bad3 = res(.jst_style_check_value("note.label.italic", .aq2sp$note.label.italic, "maybe", "general", "jtable"))$txt,
  tk1  = .jst_style_takes(.aq2sp$caption.fill),
  tk2  = .jst_style_takes(.aq2sp$heading.fill),
  ab   = vapply(c("caption.fill", "heading.fill", "note.label.italic"), function(k) {
           paste(.jst_style_about_lines(.aq2sp[[k]]$about), collapse = " | ")
         }, "")))
.wsty("aqfile", "based.on = report", "caption.fill = header", "heading.fill = lightblue",
      "note.label.italic = yes", dir = .aqd)
.aq2f <- res(.jst_style_resolve(file.path(.aqd, "aqfile.jstyle")))$val
check("AQ02 three new general settings, placed beside their kin -- caption.fill after caption.size, heading.fill after band.fill, note.label.italic after note.label -- none, none and yes in apa: caption.fill takes a color, header (any case) or none, heading.fill a color or none, note.label.italic yes or no; a wrong value stops with what the setting takes; a file sets each",
      identical(names(.jst_style_apa$general)[match(c("caption.size", "caption.fill"), names(.jst_style_apa$general))],
                c("caption.size", "caption.fill")) &&
        identical(diff(match(c("caption.size", "caption.fill", "band.fill", "heading.fill", "note.label", "note.label.italic"),
                             names(.jst_style_apa$general)))[c(1, 3, 5)], c(1L, 1L, 1L)) &&
        identical(unname(unlist(.jst_style_apa$general[c("caption.fill", "heading.fill", "note.label.italic")])),
                  c("none", "none", "yes")) &&
        identical(.aq2$hdr, "header") && identical(.aq2$nav, "000080") && identical(.aq2$hex, "D3E3E5") &&
        identical(.aq2$bad1, "[error] jtable(): `heading.fill` must be \"none\", a color name such as\n\"navy\", or six hex digits such as \"1F3864\".") &&
        identical(.aq2$bad2, "[error] jtable(): `caption.fill` must be \"none\", \"header\", a color name such\nas \"navy\", or six hex digits such as \"1F3864\".") &&
        identical(.aq2$bad3, "[error] jtable(): `note.label.italic` must be \"yes\" or \"no\".") &&
        identical(.aq2$tk1, "a color name such as lightblue, or six hex digits such as ADD8E6; or header, or none") &&
        identical(.aq2$tk2, "a color name such as lightblue, or six hex digits such as ADD8E6; or none") &&
        identical(unname(.aq2$ab), c("a color filling the caption row (caption.position = row), header for the header's fill and text color, or none", "a color filling each variable's label row (the rows variable.headings sets), or none", "the note's label in italics, as APA sets it: yes | no")) &&
        identical(.jst_style_key(.aq2f, "general", "caption.fill"), "header") &&
        identical(.jst_style_key(.aq2f, "general", "heading.fill"), "ADD8E6") &&
        identical(.jst_style_key(.aq2f, "general", "note.label.italic"), "yes"))

# jstyle("report"): built into jstats, based on apa; its own settings shown
# as its own, every other marked as apa's.
.aq3 <- .strip_ansi(res(jstyle("report"))$txt)
.aq3l <- strsplit(.aq3, "\n", fixed = TRUE)[[1]]
check("AQ03 jstyle(\"report\") prints the style as built into jstats and based on apa, its own settings unmarked and every other marked as apa's",
      identical(.aq3l[1:4], c("Style: report", "  built into jstats", "  based on apa", "")) &&
        all(c("font              = Arial", "size              = 10", "caption.form      = report", "caption.size      = 10", "header.fill       = D9D9D9", "header.bold       = yes", "note.label        = Note:", "note.label.italic = no", "note.size         = 9", "leading.zero      = yes") %in% .aq3l) &&
        all(c("paper             = a4              # from apa", "header.text       = 000000          # from apa", "rules             = apa             # from apa") %in% .aq3l) &&
        sum(grepl("# from apa$", .aq3l)) == 136L)

# The caption bar: caption.fill = header takes the header's fill and text
# color; a color fills the bar and leaves the text; a caption set as a
# paragraph is not filled; none (report, apa) fills nothing.
.wsty("aqbar", "based.on = report", "caption.fill = header", "header.fill = 0E5A5F",
      "header.text = FFFFFF", dir = .aqd)
.wsty("aqcol", "based.on = report", "caption.fill = F2F2F2", dir = .aqd)
.wsty("aqpar", "based.on = report", "caption.fill = header", "header.fill = 0E5A5F",
      "header.text = FFFFFF", "caption.position = paragraph", dir = .aqd)
.aq4 <- .aqtry(lapply(c(bar = "aqbar", col = "aqcol", par = "aqpar", rep = "report"), function(s) {
  f <- file.path(.aqd, paste0("cap_", s, ".docx"))
  st <- if (s == "report") "report" else file.path(.aqd, paste0(s, ".jstyle"))
  invisible(res(jtable(.aqf, style = st, file = f, print = FALSE)))
  d <- .aqdx(f)$doc
  first <- .aqrows(d)[1]
  cap <- if (grepl("SEQ Table", first, fixed = TRUE)) first
         else regmatches(d, regexpr("<w:p><w:pPr><w:pStyle w:val=\"Caption\"/>.*?</w:p>", d, perl = TRUE))
  list(cap = cap, row = grepl("SEQ Table", first, fixed = TRUE),
       fills = .aqfill(cap),
       colors = unique(regmatches(cap, gregexpr("(?<=<w:color w:val=\")[0-9A-F]{6}", cap, perl = TRUE))[[1]]),
       runs = lengths(regmatches(cap, gregexpr("<w:r>", cap, fixed = TRUE))),
       colored = lengths(regmatches(cap, gregexpr("<w:color w:val=", cap, fixed = TRUE))))
}))
check("AQ04 the caption bar in the Word file: caption.fill = header fills the caption row with the header's fill and sets every caption run in the header's text color; a color fills the row and leaves the text black; a caption set as a paragraph is not filled, nor its text colored; report fills none",
      .aq4$bar$row && identical(.aq4$bar$fills, "0E5A5F") && identical(.aq4$bar$colors, "FFFFFF") &&
        .aq4$bar$colored == .aq4$bar$runs &&
        .aq4$col$row && identical(.aq4$col$fills, "F2F2F2") && length(.aq4$col$colors) == 0L &&
        !.aq4$par$row && length(.aq4$par$cap) == 1L && length(.aq4$par$fills) == 0L &&
        length(.aq4$par$colors) == 0L &&
        .aq4$rep$row && length(.aq4$rep$fills) == 0L && length(.aq4$rep$colors) == 0L)

# heading.fill: each variable's label row -- a frequency table's, a
# crosstab's (with its test, every cell), a regression's dummy-coded
# variable -- and never a role heading, a category or the header.
.wsty("aqhead", "based.on = report", "heading.fill = D3E3E5", dir = .aqd)
.aq5 <- .aqtry(local({
  st <- file.path(.aqd, "aqhead.jstyle"); f <- file.path(.aqd, "head.docx")
  t1 <- res(jtable(.aqf, headings = list(Habits = Smoker, Place = Region), style = st,
                   print = FALSE))$val
  t2 <- res(jtable(.aqx, style = st, print = FALSE))$val
  t3 <- res(jtable(.aqm, style = st, print = FALSE))$val
  invisible(res(jtable(list(t1, t2, t3), file = f, print = FALSE)))
  tbls <- regmatches(.aqdx(f)$doc, gregexpr("<w:tbl>.*?</w:tbl>", .aqdx(f)$doc, perl = TRUE))[[1]]
  r1 <- .aqrows(tbls[1]); r2 <- .aqrows(tbls[2]); r3 <- .aqrows(tbls[3])
  list(lab = .aqfill(.aqrow(r1, "Current smoker")), lab2 = .aqfill(.aqrow(r1, "Region of residence")),
       role = .aqfill(.aqrow(r1, "Habits")), cat = .aqfill(.aqrow(r1, "No")),
       hdr = .aqfill(.aqrow(r1, "Variable")),
       xlab = .aqfill(.aqrow(r2, "Current smoker")),
       xcells = lengths(regmatches(.aqrow(r2, "Current smoker"),
                                   gregexpr("<w:tc>", .aqrow(r2, "Current smoker"), fixed = TRUE))),
       xcat = .aqfill(utils::tail(r2[grep(">Yes<", r2, fixed = TRUE)], 1L)),
       mlab = .aqfill(r3[grep("Region of residence", r3, fixed = TRUE)[1]]),
       mcat = .aqfill(.aqrow(r3, "South")))
}))
check("AQ05 heading.fill fills each variable's label row -- a frequency table's (both variables), a crosstab's with its test across every cell, a regression's dummy-coded variable -- and no role heading, category or header row",
      identical(.aq5$lab, "D3E3E5") && identical(.aq5$lab2, "D3E3E5") &&
        length(.aq5$role) == 0L && length(.aq5$cat) == 0L &&
        identical(unique(.aq5$hdr), "D9D9D9") &&
        identical(.aq5$xlab, rep("D3E3E5", .aq5$xcells)) && .aq5$xcells > 5L &&
        length(.aq5$xcat) == 0L &&
        identical(.aq5$mlab, "D3E3E5") && length(.aq5$mcat) == 0L)

# The note's label: upright under report, italic under apa; the console's
# line the same text.
# A note of the call's own: since ruling R59 (S409, built S410) N goes
# after the title, which leaves this table's note empty without one.
.aq6 <- .aqtry(lapply(c(apa = "apa", report = "report"), function(s) {
  t <- res(jtable(.aqm, style = s, note = "Wellbeing is scored from 0 to 100.", print = FALSE))$val
  f <- file.path(.aqd, paste0("note_", s, ".docx"))
  invisible(res(jtable(t, file = f, print = FALSE)))
  d <- .aqdx(f)$doc
  run <- regmatches(d, regexpr("<w:r><w:rPr>[^>]*(<w:[a-zA-Z]+[^>]*/>)*</w:rPr><w:t xml:space=\"preserve\">Note[.:][^<]*</w:t></w:r>", d, perl = TRUE))
  list(lines = .jst_table_note_lines(t, .jst_table_style(t, s)),
       plain = .jst_table_note_lines(t, .jst_table_style(t, s), plain = TRUE),
       run = run)
}))
check("AQ06 the note's label: report's \"Note:\" upright (note.label.italic = no), apa's \"Note.\" in italics, in the Word file's run and in the marked-up line; the console's line the same words",
      identical(.aq6$apa$lines, "*Note.* Wellbeing is scored from 0 to 100.") &&
        identical(.aq6$report$lines, "Note: Wellbeing is scored from 0 to 100.") &&
        identical(.aq6$apa$plain, "Note. Wellbeing is scored from 0 to 100.") &&
        identical(.aq6$report$plain, "Note: Wellbeing is scored from 0 to 100.") &&
        length(.aq6$apa$run) == 1L && grepl("<w:i/>", .aq6$apa$run, fixed = TRUE) &&
        length(.aq6$report$run) == 1L && !grepl("<w:i/>", .aq6$report$run, fixed = TRUE))

# An empty label is no label: until S409 a pair of asterisks was left,
# "** N = 103." -- printed as marks in the Word file and the console.
# N in the note, as apa put it until ruling R59 (S409, built S410): the
# *N* markup is what an empty label must not leave stray asterisks beside.
.wsty("aqnolab", "note.label = \"\"", "n.position = note", dir = .aqd)
.aq7 <- .aqtry(local({
  t <- res(jtable(.aqm, style = file.path(.aqd, "aqnolab.jstyle"), print = FALSE))$val
  f <- file.path(.aqd, "nolab.docx")
  invisible(res(jtable(t, file = f, print = FALSE)))
  d <- .aqdx(f)$doc
  list(lines = .jst_table_note_lines(t, .jst_table_style(t, "apa")),
       prev = .strip_ansi(res(print(t))$txt),
       stars = grepl(">\\*", d) || grepl("\\*<", d))
}))
check("AQ07 an empty note.label gives no label: the general note opens on N in the marked-up line, the preview and the Word file, with no asterisk left",
      identical(.aq7$lines, "*N* = 103.") &&
        grepl("\nN = 103.\n", .aq7$prev, fixed = TRUE) &&
        !grepl("*", .aq7$prev, fixed = TRUE) && !.aq7$stars)

# The stars legend follows leading.zero, as the cells do.
.aq8 <- .aqtry(list(yes = .jst_tbl_stars_legend(c(0.05, 0.01, 0.001), "yes"),
             no = .jst_tbl_stars_legend(c(0.05, 0.01, 0.001), "no"),
             never = .jst_tbl_stars_legend(c(0.05, 0.01, 0.001), "never"),
             dflt = .jst_tbl_stars_legend(c(0.05, 0.01, 0.001)),
             rep = res(jtable(.aqc, style = "report", print = FALSE))$val$notes$probability,
             apa = res(jtable(.aqc, print = FALSE))$val$notes$probability))
check("AQ08 the stars legend keeps the zero under leading.zero = yes, as the cells do (\"*p < 0.05.\" under report), and drops it under no (apa) and never",
      identical(.aq8$yes, "**p* < 0.05. ***p* < 0.01. ****p* < 0.001.") &&
        identical(.aq8$no, "**p* < .05. ***p* < .01. ****p* < .001.") &&
        identical(.aq8$never, .aq8$no) && identical(.aq8$dflt, .aq8$no) &&
        identical(.aq8$rep, .aq8$yes) && identical(.aq8$apa, .aq8$no))

# A report table: the preview pinned whole, and the Word file's look.
.aq9t <- res(jtable(.aqm, style = "report", note = "Wellbeing is scored from 0 to 100.",
                    print = FALSE))$val
.aq9p <- .strip_ansi(res(print(.aq9t))$txt)
.aq9x <- .aqtry(local({ f <- file.path(.aqd, "report_m.docx")
                 invisible(res(jtable(.aq9t, file = f, print = FALSE))); .aqdx(f) }))
.aq9r <- .aqtry(.aqrows(.aq9x$doc))
check("AQ09 a regression table under report: the preview pinned whole (\"Table 1:\" and the title on one line, the zero kept on b, beta, p and R2, \"Note:\"); in the Word file Arial at 10 points, the caption's runs at 10 and bold, the note's at 9, the header filled D9D9D9 and bold, the variable's label row bold",
      identical(.aq9p, "Table 1: Regression Coefficients Predicting Wellbeing score (0-100) (N = 103)\n-------------------------------------------------------------------\nPredictor                                  b     SE     \u03b2       p\n-------------------------------------------------------------------\nConstant                                 38.91  4.23         <0.001\nAge (years)                               0.36  0.09   0.36  <0.001\nRegion of residence (reference = North)\n  South                                  -5.50  3.20  -0.19   0.088\n  East                                   -1.87  2.85  -0.08   0.513\n  West                                   -3.69  3.03  -0.14   0.226\nR\u00b2                                        0.15\n-------------------------------------------------------------------\nNote: Wellbeing is scored from 0 to 100.\n") &&
        grepl("<w:rFonts w:ascii=\"Arial\" w:hAnsi=\"Arial\" w:cs=\"Arial\" w:eastAsia=\"Arial\"/>", .aq9x$sty, fixed = TRUE) &&
        grepl("<w:sz w:val=\"20\"/>", .aq9x$sty, fixed = TRUE) &&
        grepl("<w:r><w:rPr><w:b/><w:sz w:val=\"20\"/><w:szCs w:val=\"20\"/></w:rPr><w:t xml:space=\"preserve\">Table </w:t></w:r>", .aq9r[1], fixed = TRUE) &&
        grepl("<w:r><w:rPr><w:sz w:val=\"18\"/><w:szCs w:val=\"18\"/></w:rPr><w:t xml:space=\"preserve\">Note: Wellbeing is scored from 0 to 100.</w:t></w:r>", .aq9x$doc, fixed = TRUE) &&
        identical(unique(.aqfill(.aqrow(.aq9r, "Predictor"))), "D9D9D9") &&
        grepl("<w:b/>", .aqrow(.aq9r, "Predictor"), fixed = TRUE) &&
        grepl("<w:r><w:rPr><w:b/><w:sz w:val=\"20\"/><w:szCs w:val=\"20\"/></w:rPr><w:t xml:space=\"preserve\">Region of residence</w:t></w:r>",
              .aq9r[grep("Region of residence", .aq9r, fixed = TRUE)[1]], fixed = TRUE))

# A built-in's name: no copy takes it, in any case or folder, and nothing is
# written; a file of report's name in a folder searched is passed over with
# the note apa's file gets; a bare report gets the pointer.
.aq10 <- list(r = res(jstyle("apa", save.as = "report"))$txt,
              R = res(jstyle("report", save.as = file.path(.aqd, "REPORT"), size = 11))$txt,
              a = res(jstyle("report", save.as = "apa"))$txt,
              bare1 = res(jstyle(report))$txt,
              bare2 = res(jtable(.aqf, style = report))$txt)
.aq10d <- file.path(.aqd, "shadow"); dir.create(.aq10d)
.wsty("report", "font = Shadow", dir = .aq10d)
.aq10n <- .aqtry(local({
  options(.jst_options_style_dir = .aq10d); on.exit(options(.jst_options_style_dir = NULL))
  list(sty = .apmsg(jstyle("report")), tab = .apmsg(jtable(.aqf, style = "report")),
       lst = .apmsg(jstyle()))
}))
.aq10note <- sub("@PATH@", .jst_norm_path(file.path(.aq10d, "report.jstyle")), "This file is not read, since \"report\" always names a style built\ninto jstats:\n  @PATH@\nTo use it, rename it, for example to myreport.jstyle, and\nuse style = \"myreport\".",
                 fixed = TRUE)
check("AQ10 save.as refuses \"report\" and \"apa\" as names of styles built into jstats -- in any case and with a folder, the line offered copying the call's own style -- writing nothing; a report.jstyle in a folder searched is passed over with one note where a call names the built-in and under jstyle()'s list; report typed bare gets the pointer in jstyle() and jtable()",
      identical(.aq10$r, "[error] jstyle(): \"report\" is the name of a style built into jstats.\nGive the copy another name, for example:\n  jstyle(\"apa\", save.as = \"myreport\")") &&
        identical(.aq10$R, "[error] jstyle(): \"REPORT\" is the name of a style built into jstats.\nGive the copy another name, for example:\n  jstyle(\"report\", save.as = \"myreport\")") &&
        identical(.aq10$a, "[error] jstyle(): \"apa\" is the name of a style built into jstats.\nGive the copy another name, for example:\n  jstyle(\"report\", save.as = \"myapa\")") &&
        !any(grepl("^(report|apa)\\.jstyle$", list.files(.aqd), ignore.case = TRUE)) &&
        identical(.aq10$bare1, "[error] jstyle(): report is not in quotes.\nA style name goes in quotes:\n  jstyle(\"report\")") &&
        identical(.aq10$bare2, "[error] jtable(): report is not in quotes.\nstyle = takes a style name in quotes:\n  jtable(.aqf, style = \"report\")") &&
        identical(.aq10n$sty$msg, paste0(.aq10note, "\n")) &&
        identical(.jst_style_key(.aq10n$sty$val, "general", "font"), "Arial") &&
        identical(.aq10n$tab$msg, paste0(.aq10note, "\n")) &&
        identical(.aq10n$lst$msg, paste0(.aq10note, "\n")))

# The complete copy: its head, with the block for an AI assistant; based.on
# the built-in its style reaches first; read back, every setting as copied.
.wsty("onrep", "based.on = report", "size = 11", dir = .aqd)
.wsty("onapa", "size = 11", dir = .aqd)
.aq11 <- .aqtry(lapply(c(report = "report", apa = "apa", onrep = file.path(.aqd, "onrep.jstyle"),
                  onapa = file.path(.aqd, "onapa.jstyle")), function(s) {
  nm <- paste0("full_", basename(tools::file_path_sans_ext(s)))
  invisible(res(jstyle(s, save.as = file.path(.aqd, nm))))
  f <- file.path(.aqd, paste0(nm, ".jstyle"))
  l <- if (file.exists(f)) readLines(f, encoding = "UTF-8") else ""
  back <- res(.jst_style_resolve(f))$val
  from <- res(.jst_style_resolve(s))$val
  same <- !is.null(back) && all(unlist(lapply(c("general", names(.jst_style_type_nouns)), function(p) {
    vapply(names(.jst_style_spec[[p]]), function(k) {
      identical(.jst_style_key(back, p, k), .jst_style_key(from, p, k))
    }, logical(1))
  })))
  list(l = l, same = same)
}))
check("AQ11 a complete copy's head says to change values only and holds a block for an AI assistant asked to match an example, pinned whole; based.on names report for a copy of report or of a file based on it, apa otherwise; each copy reads back with every setting as the style it copied",
      identical(.aq11$report$l[1:11], c("# full_report.jstyle:", "# A jstats table style.", "# Every setting jstats has is below, each after a note saying what it does and what it takes.", "# Change only the values after the = signs; do not invent a setting, and do not rename a setting or a section.", "# A line that starts with # is a note.", "# jstyle(\"full_report\") checks the file and names any value it cannot use.", "#", "# To an AI assistant asked to edit this file so tables look like an example:", "# Change only the values after the = signs, using only the values each setting's \"# takes:\" line allows.", "# Keep every other line as it is, and return the whole file.", "# Then say what the example has that these settings cannot make, rather than inventing a setting for it.")) &&
        identical(.aq11$report$l[12:16], c("", "format     = 1", paste0("written.by = jstats ", .jst_jstats_version()),
                                           "based.on   = report", "")) &&
        identical(.aq11$onrep$l[15], "based.on   = report") &&
        identical(.aq11$apa$l[15], "based.on   = apa") &&
        identical(.aq11$onapa$l[15], "based.on   = apa") &&
        all(vapply(.aq11, function(x) isTRUE(x$same), logical(1))) &&
        all(c("caption.fill = none", "heading.fill = none", "note.label.italic = no") %in% .aq11$report$l) &&
        all(c("caption.fill = none", "heading.fill = none", "note.label.italic = yes") %in% .aq11$apa$l) &&
        all(c("# a color filling the caption row (caption.position = row), header for the header's fill and text color, or none", "# takes: a color name such as lightblue, or six hex digits such as ADD8E6; or header, or none", "# a color filling each variable's label row (the rows variable.headings sets), or none", "# takes: a color name such as lightblue, or six hex digits such as ADD8E6; or none", "# the note's label in italics, as APA sets it: yes | no", "# takes: one of yes | no") %in% .aq11$apa$l))

# The short file's head: a built-in base is "a style built into jstats";
# the editing rule the complete copy's, adding a setting from the list
# allowed.
.aq12 <- .aqtry(local({
  invisible(res(jstyle("report", save.as = file.path(.aqd, "short_rep"), font = "Calibri")))
  readLines(file.path(.aqd, "short_rep.jstyle"), encoding = "UTF-8")
}))
check("AQ12 a short copy of report: its head names report as a style built into jstats and gives the editing rule worded as the complete copy's, adding a setting from ?jstyle_settings allowed; based.on = report",
      identical(.aq12[1:6], c("# short_rep.jstyle:", "# A jstats table style, based on report, a style built into jstats.", "# It lists only the settings that differ from report; any setting not listed here takes report's value.", "# ?jstyle_settings lists every setting and what it takes.", "# Change only the values after the = signs, or add a setting from that list; do not invent a setting, and do not rename a setting or a section.", "# jstyle(\"short_rep\") checks the file and names any value it cannot use.")) &&
        identical(.aq12[7:10], c("", "format     = 1", paste0("written.by = jstats ", .jst_jstats_version()),
                                 "based.on   = report")))

# jstyle(open = TRUE). The opener and the session test stand in here: a
# trace on .jst_style_open() records the file it is handed and sets the
# session as one that cannot open, so no editor opens in an interactive
# run either.
.wsty("aqopen", "based.on = report", "size = 11", dir = .aqd)
.wsty("aqbad", "based.on = report", "heading.fill = header", dir = .aqd)
.aq13 <- .aqtry(local({
  rec <- new.env(); rec$got <- character(0)
  suppressMessages(trace(".jst_style_open", where = asNamespace("jstats"), print = FALSE,
                         tracer = bquote({
                           # The path as the editor would receive it: on
                           # Windows one built from tempdir() holds
                           # backslashes (Session 409, the workstation's red).
                           assign("got", c(get("got", envir = .(rec)),
                                           normalizePath(path, winslash = "/", mustWork = FALSE)),
                                  envir = .(rec))
                           ask <- FALSE
                           edit <- function(...) invisible(NULL)
                         })))
  on.exit(suppressMessages(untrace(".jst_style_open", where = asNamespace("jstats"))))
  options(.jst_options_style_dir = .aqd)
  on.exit(options(.jst_options_style_dir = NULL), add = TRUE)
  out <- list(path = res(jstyle(file.path(.aqd, "aqopen.jstyle"), open = TRUE)),
              name = res(jstyle("aqopen", open = TRUE)),
              sess = local({ options(.jst_options_style = "aqopen")
                             on.exit(options(.jst_options_style = NULL))
                             res(jstyle(open = TRUE)) }),
              save = res(jstyle(save.as = file.path(.aqd, "w1"), size = 11, open = TRUE)),
              bad  = res(jstyle("aqbad", open = TRUE)),
              rep  = res(jstyle("report", open = TRUE)),
              apa  = res(jstyle(open = TRUE)),
              none = res(jstyle("nosuch", open = TRUE)),
              flag = res(jstyle("aqopen", open = "yes")))
  out$got <- rec$got
  out
}))
.aq13o <- .aqtry(local({
  got <- character(0); rec <- function(p) got <<- c(got, p)
  f <- file.path(.aqd, "aqopen.jstyle")
  list(a = .jst_style_open(f, TRUE, ask = TRUE, edit = rec),
       b = .jst_style_open(f, TRUE, ask = FALSE, edit = rec),
       c = .jst_style_open(f, FALSE, ask = TRUE, edit = rec),
       d = .jst_style_open_file(f, ask = TRUE, edit = rec),
       got = got)
}))
check("AQ13 jstyle(open = TRUE) hands the style's file to the editor and prints no settings -- named, by path, or the session's style when none is named; with save.as the file just written; a file it cannot use opened first, then its stop -- while a built-in stops with the line that saves a copy and opens it, a name found nowhere stops, and open = must be TRUE or FALSE; the opener runs only when open = TRUE and the session can show it",
      identical(.aq13$got, normalizePath(file.path(.aqd, c("aqopen.jstyle", "aqopen.jstyle", "aqopen.jstyle",
                                                           "w1.jstyle", "aqbad.jstyle")), winslash = "/")) &&
        identical(.aq13$path$txt, "") && inherits(.aq13$path$val, "jst_style") &&
        identical(.aq13$name$txt, "") && identical(.aq13$sess$txt, "") &&
        identical(gsub("\\s+", " ", .aq13$save$txt),
                  paste0("Style written to ", .jst_norm_path(file.path(.aqd, "w1.jstyle")), " ")) &&
        identical(.aq13$bad$txt, "[error] jstyle(): line 2 of aqbad.jstyle sets heading.fill = header.\n`heading.fill` must be \"none\", a color name such as \"navy\", or six hex\ndigits such as \"1F3864\".") &&
        identical(.aq13$rep$txt, "[error] jstyle(): \"report\" is built into jstats, so it has no file to open.\nSave a copy to open, for example:\n  jstyle(\"report\", save.as = \"myreport\", open = TRUE)") &&
        identical(.aq13$apa$txt, "[error] jstyle(): \"apa\" is built into jstats, so it has no file to open.\nSave a copy to open, for example:\n  jstyle(\"apa\", save.as = \"myjournal\", open = TRUE)") &&
        startsWith(.aq13$none$txt, "[error] jstyle(): no style named \"nosuch\" was found.") &&
        identical(.aq13$flag$txt, "[error] jstyle(): `open` must be TRUE or FALSE.") &&
        isTRUE(.aq13o$a) && isFALSE(.aq13o$b) && isFALSE(.aq13o$c) &&
        inherits(.aq13o$d, "jst_style") &&
        identical(.aq13o$got, rep(normalizePath(file.path(.aqd, "aqopen.jstyle"), winslash = "/"), 2L)))

# Fix Slate V: a dummy-coded variable whose labels the 40-column cap cuts
# alike -- its categories formatted in one call, so the reference and the
# row show their codes, a label no other code shares alone; in jlm() and
# jlogistic(), in dummy_groups, and in the stop naming one category left.
.aqw <- data.frame(
  Y = c(52, 61, 47, 55, 44, 63, 58, 49, 51, 66, 45, 57, 60, 48, 53,
        62, 46, 59, 50, 64, 43, 56, 54, 65, 42, 58, 52, 61, 47, 55),
  B = rep(c(0, 1, 1, 0, 1, 0), 5),
  G = haven::labelled(rep(1:3, 10),
                      stats::setNames(1:3, c("Agree that the policy should be enforced strictly",
                                             "Agree that the policy should be enforced loosely",
                                             "Disagree"))))
.aq14k <- length(.seen)
.aq14 <- list(lm = res(jlm(Y ~ G, .aqw, categorical = G, value.id = "labels")),
              lg = res(jlogistic(B ~ G, .aqw, categorical = G, value.id = "labels")),
              one = res(jlm(Y ~ G, .aqw, categorical = G, value.id = "labels", subset = G == 2)),
              abs = res(jlm(Y ~ G + X, transform(.aqw, X = ifelse(unclass(G) == 2, NA, seq_along(Y))),
                            categorical = G, value.id = "labels")))
.aq14n <- vapply(utils::tail(.seen, length(.seen) - .aq14k), function(s) gsub("\\s+", " ", s$text), "")
check("AQ14 Fix Slate V: under value.id = \"labels\" a reference and a category whose long labels the 40-column cap cuts alike show their codes -- the header's reference, the coefficient rows, a jlm() and a jlogistic() result's dummy_groups labels, the stop naming the one category a filter left, and the note on a category the analysis sample lacks -- while a label no other code shares stays alone",
      grepl("G (ref = 1: Agree that the policy should be en...)", .aq14$lm$txt, fixed = TRUE) &&
        grepl("\n  2: Agree that the policy should be en...", .aq14$lm$txt, fixed = TRUE) &&
        grepl("\n  Disagree ", .aq14$lm$txt, fixed = TRUE) &&
        identical(.aq14$lm$val$dummy_groups$G$labels, c("1: Agree that the policy should be en...", "2: Agree that the policy should be en...", "Disagree")) &&
        identical(.aq14$lg$val$dummy_groups$G$labels, c("1: Agree that the policy should be en...", "2: Agree that the policy should be en...", "Disagree")) &&
        grepl("G (ref = 1: Agree that the policy should be en...)", .aq14$lg$txt, fixed = TRUE) &&
        grepl("one category of G (2: Agree that the policy should be en...)", gsub("\n", " ", .aq14$one$txt), fixed = TRUE) &&
        any(grepl("G's category 2: Agree that the policy should be en... has no cases in the analysis sample", .aq14n, fixed = TRUE)))

# ?jstyle_settings gives report's value beside apa's where they differ.
.aq15 <- tryCatch(paste(.jst_style_settings_rd(), collapse = "\n"), error = function(e) "")
check("AQ15 the settings help page gives report's value beside apa's where they differ (font, the caption and the note, leading.zero, a variable's label row) and none where they agree; the three new settings are listed",
      grepl("In apa: \\code{Times New Roman}; in report: \\code{Arial}.}", .aq15, fixed = TRUE) &&
        grepl("In apa: \\code{yes}; in report: \\code{no}.}", .aq15, fixed = TRUE) &&
        grepl("In apa: \\code{plain}; in report: \\code{bold}.}", .aq15, fixed = TRUE) &&
        grepl("\\item{\\code{decimals}}{the decimal places of a statistic, such as a mean. Takes a whole number from 0 to 6. In apa: \\code{2}.}", .aq15, fixed = TRUE) &&
        all(vapply(c("caption.fill", "heading.fill", "note.label.italic"), function(k) {
          grepl(paste0("\\item{\\code{", k, "}}"), .aq15, fixed = TRUE)
        }, logical(1))) &&
        !any(grepl("[^\\x01-\\x7F]", .aq15, perl = TRUE)))

# =============================================================================
# AR. S410 (v0.9.277): ruling R59 -- N after the title by default, the ns in
#     the note where they vary -- and a blank line after each setting in the
#     files jstyle() writes
# =============================================================================
cat("\n--- AR. N after the title (R59), blank lines in style files ---\n")

.ard <- file.path(tempdir(), "tables_check_s410"); unlink(.ard, recursive = TRUE); dir.create(.ard)
.arn <- .wsty("arnote", "n.position = note", dir = .ard)
.arz <- .wsty("arnone", "n.position = none", dir = .ard)
# One table of each type whose cases are one pool, under apa (title) and
# under a style that puts N in the note.
.ar2 <- .aqtry(local({
  rs <- list(desc = res(jdesc(tcm, Age, WellbeingScore))$val,
             freq = res(jfreq(tcm, Region))$val,
             reg  = res(jlm(WellbeingScore ~ Age, tcm))$val,
             logi = res(jlogistic(Volunteer ~ Age, tcm))$val,
             corr = res(jcorr(tcm, Age, WellbeingScore))$val,
             xtab = res(jcrosstab(Region ~ Volunteer, tcm))$val,
             rel  = res(jalpha(tcm, Environment1, Environment3, Environment4))$val)
  lapply(rs, function(r) list(t = res(jtable(r, print = FALSE))$val,
                              n = res(jtable(r, style = .arn, print = FALSE))$val,
                              z = res(jtable(r, style = .arz, print = FALSE))$val))
}))
.arN <- function(x) {   # the N a note-style table's note opens on
  g <- x$n$notes$general[1]; sub("^\\*N\\* = ([0-9,]+)\\.$", "\\1", g)
}
check("AR01 apa's n.position is title, and report's, which inherits it (ruling R59, S409); the setting's note says a table with several ns gives them in the note; the settings help page gives title as apa's value, report's the same",
      identical(.jst_style_apa$general$n.position, "title") &&
        is.null(.jst_style_report$general$n.position) &&
        identical(.jst_style_key(.jst_style_resolve("report"), "general", "n.position"), "title") &&
        identical(.jst_style_about_lines(.jst_style_spec$general$n.position$about),
                  paste("where N, the number of cases, goes: note (the general note opens on it) |",
                        "title (\"(N = 103)\" after the title; a table with several ns, such as Ns",
                        "that differ or a t test's groups, gives them in the note) | none")) &&
        grepl("\\item{\\code{n.position}}{where N, the number of cases, goes:", paste(.jst_style_settings_rd(), collapse = "\n"),
              fixed = TRUE) &&
        grepl("several ns, such as Ns that differ or a t test's groups, gives them in the note) | none. Takes one of note | title | none. In apa: \\code{title}.}",
              paste(.jst_style_settings_rd(), collapse = "\n"), fixed = TRUE))

check("AR02 a table whose cases are one pool -- descriptives, frequencies, a regression, a logistic regression, a correlation, a crosstab, a reliability table -- puts \"(N = n)\" after its title under apa, and nothing in the note, where n.position = note opens the note on the same N and leaves the title alone; none writes neither",
      !is.null(.ar2) && all(vapply(.ar2, function(x) {
        n <- .arN(x)
        grepl("^[0-9,]+$", n) &&
          identical(x$t$caption$title, paste0(x$n$caption$title, " (*N* = ", n, ")")) &&
          identical(x$n$notes$general[1], paste0("*N* = ", n, ".")) &&
          identical(x$t$notes$general, x$n$notes$general[-1]) &&
          identical(x$z$caption$title, x$n$caption$title) &&
          identical(x$z$notes$general, x$n$notes$general[-1])
      }, logical(1))) &&
        identical(.arN(.ar2$desc), "103") && identical(.arN(.ar2$xtab), "103"))

# Tables whose ns vary: under title the same as under note.
.ar3 <- .aqtry(local({
  pair <- function(r) list(t = res(jtable(r, print = FALSE))$val,
                           n = res(jtable(r, style = .arn, print = FALSE))$val)
  list(models = pair(list(.vh1, .vh2, .vh3)),
       corr   = pair(res(jcorr(tcm, WellbeingScore, Income, Age))$val),
       xtab   = pair(list(res(jcrosstab(Smoker ~ Volunteer, tcm))$val,
                          res(jcrosstab(Region ~ Volunteer, tcm))$val)),
       rel    = pair(list(A = res(jalpha(tcm, Environment1, Environment3))$val,
                          B = res(jalpha(tcm, Environment4, Environment5,
                                         subset = Age > 30))$val)),
       pools  = pair(list(res(jdesc(tcm, Age))$val,
                          res(jdesc(tcm, WellbeingScore, subset = Age > 30))$val)))
}))
check("AR03 a table whose ns vary -- models whose Ns differ, pairwise ns, crosstabs whose Ns differ, scales whose Ns differ -- gives them in the note under apa's title exactly as n.position = note does, the title carrying no N; variables from different pools of cases get no N in either place under either",
      !is.null(.ar3) &&
        all(vapply(.ar3, function(x) identical(x$t$caption, x$n$caption) &&
                                     identical(x$t$notes, x$n$notes), logical(1))) &&
        startsWith(.ar3$models$t$notes$general[1], "*N* differs by model: ") &&
        startsWith(.ar3$corr$t$notes$general[1], "Pairwise *n*s range from ") &&
        startsWith(.ar3$xtab$t$notes$general[1], "*N* differs by variable: ") &&
        startsWith(.ar3$rel$t$notes$general[1], "*N* differs by scale: ") &&
        !grepl("*N*", .ar3$pools$t$caption$title, fixed = TRUE) &&
        !any(grepl("*N*", .ar3$pools$t$notes$general, fixed = TRUE)) &&
        !any(grepl("(*N*", vapply(.ar3, function(x) x$t$caption$title, ""), fixed = TRUE)))

# t tests and ANOVAs: the groups' ns in the note under title, as under note,
# whatever the groups' sizes; none after the title.
.ar4 <- .aqtry(local({
  w <- data.frame(Y = c(12, 15, 11, 18, 14, 16, 10, 19, 13, 17, 12, 20), G = rep(c(1, 2), 6))
  attr(w$Y, "label") <- "Y"
  trip <- function(r, ...) list(t = res(jtable(r, ..., print = FALSE))$val,
                                n = res(jtable(r, ..., style = .arn, print = FALSE))$val,
                                z = res(jtable(r, ..., style = .arz, print = FALSE))$val)
  list(uneq  = trip(res(jt(WellbeingScore ~ Volunteer, tcm))$val),
       equal = trip(res(jt(Y ~ G, w))$val),
       vary  = trip(list(res(jt(WellbeingScore ~ Volunteer, tcm))$val,
                         res(jt(Income ~ Volunteer, tcm))$val)),
       aov   = trip(res(jaov(Age ~ Region, tcm))$val),
       ncol  = trip(res(jt(WellbeingScore ~ Volunteer, tcm))$val,
                    columns = c("n", "mean", "sd", "t", "p", "d")))
}))
check("AR04 a t-test or ANOVA table gives its groups' ns in the note under apa's title, exactly as under n.position = note -- groups of different sizes, of one size, ns that vary with missing data, an ANOVA's four groups -- and no N after the title; with each group's n a column, nothing in either place; none writes no ns",
      !is.null(.ar4) &&
        all(vapply(.ar4, function(x) identical(x$t$caption, x$n$caption) &&
                                     identical(x$t$notes, x$n$notes), logical(1))) &&
        identical(.ar4$uneq$t$notes$general, "*n* = 54 (No) and 49 (Yes).") &&
        identical(.ar4$equal$t$notes$general, "*n* = 6 (1) and 6 (2).") &&
        startsWith(.ar4$vary$t$notes$general, "Group *n*s vary with missing data: No, ") &&
        startsWith(.ar4$aov$t$notes$general, "*n* = ") &&
        identical(.ar4$ncol$t$notes$general, character(0)) &&
        !any(grepl("*N*", vapply(.ar4, function(x) x$t$caption$title, ""), fixed = TRUE)) &&
        all(vapply(.ar4, function(x) length(x$z$notes$general) == 0L &&
                                     identical(x$z$caption, x$t$caption), logical(1))))

# The writers: the preview, the report, the Word caption under apa and
# report.
.ar5 <- .aqtry(local({
  d1 <- res(jdesc(tcm, Age))$val
  ta <- res(jtable(d1, print = FALSE))$val
  tr <- res(jtable(d1, style = "report", print = FALSE))$val
  f <- file.path(.ard, "r59.docx")
  invisible(res(jtable(list(ta, tr), file = f, print = FALSE)))
  x <- utils::unzip(f, "word/document.xml", exdir = file.path(.ard, "x5"))
  list(pa = .strip_ansi(res(print(ta))$txt), pr = .strip_ansi(res(print(tr))$txt),
       rep = res(jtable(d1, style = "report"))$txt,
       doc = paste(readLines(x, warn = FALSE, encoding = "UTF-8"), collapse = ""))
}))
# The report table's runs carry Arial in a file whose first table is apa's
# (Session 407: each table's own font).
.arf <- "<w:rFonts w:ascii=\"Arial\" w:hAnsi=\"Arial\" w:cs=\"Arial\" w:eastAsia=\"Arial\"/>"
check("AR05 N after the title in every writer: the preview's title line (N plain), apa's and report's, with no note under the table; jtable()'s report; the Word caption -- apa's italic title with N upright, report's bold one-line caption with N bold italic",
      !is.null(.ar5) &&
        startsWith(.ar5$pa, "Table 1\nDescriptive Statistics (N = 103)\n") &&
        endsWith(.ar5$pa, "Age (years)  103  40.65  11.62   18   71\n----------------------------------------\n") &&
        startsWith(.ar5$pr, "Table 1: Descriptive Statistics (N = 103)\n") &&
        !grepl("Note", .ar5$pa, fixed = TRUE) && !grepl("Note", .ar5$pr, fixed = TRUE) &&
        startsWith(.ar5$rep, "Table 1. Descriptive Statistics (N = 103)\n") &&
        grepl("<w:t xml:space=\"preserve\">Descriptive Statistics (</w:t></w:r><w:r><w:rPr><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\">N</w:t></w:r><w:r><w:rPr><w:i/><w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t xml:space=\"preserve\"> = 103)</w:t>", .ar5$doc, fixed = TRUE) &&
        grepl(paste0("<w:t xml:space=\"preserve\">: Descriptive Statistics (</w:t></w:r><w:r><w:rPr>", .arf,
                     "<w:b/><w:i/><w:sz w:val=\"20\"/><w:szCs w:val=\"20\"/></w:rPr><w:t xml:space=\"preserve\">N</w:t></w:r><w:r><w:rPr>", .arf,
                     "<w:b/><w:sz w:val=\"20\"/><w:szCs w:val=\"20\"/></w:rPr><w:t xml:space=\"preserve\"> = 103)</w:t>"), .ar5$doc, fixed = TRUE) &&
        !grepl(">Note", .ar5$doc, fixed = TRUE))

# The files jstyle() writes: a blank line after each setting, none between
# a setting's notes and the setting, none twice, none at the end (Session
# 410; Jeff, on build 1's walk).
.arset <- function(l) grepl("^[a-z][a-z0-9.]* = ", l) & !grepl("^(format|written\\.by|based\\.on) ", l)
.arblank <- function(l) {
  s <- which(.arset(l)); b <- !nzchar(l)
  list(after = all(vapply(s, function(i) i == length(l) || !nzchar(l[i + 1L]), logical(1))),
       notes = all(startsWith(l[s - 1L], "# takes: ")),
       twice = any(b[-1L] & b[-length(b)]),
       last  = nzchar(l[length(l)]),
       n_set = length(s), n_blank = sum(b))
}
.ar6 <- .aqtry(local({
  p <- res(jstyle("apa", save.as = file.path(.ard, "arfull")))
  l <- readLines(file.path(.ard, "arfull.jstyle"), encoding = "UTF-8")
  q <- file.path(.ard, "arflat.jstyle")   # the same file with no blank line
  writeLines(l[nzchar(l)], q, useBytes = TRUE)
  keys <- unlist(lapply(names(.jst_style_spec), function(part) {
    paste(part, names(.jst_style_spec[[part]]))
  }))
  val <- function(st) lapply(keys, function(k) {
    k <- strsplit(k, " ", fixed = TRUE)[[1]]; .jst_style_key(st, k[1], k[2])
  })
  list(l = l, b = .arblank(l), heads = which(grepl("^# (The general settings|An? [A-Za-z -]+ table, from |A crosstab, from )", l)),
       same = identical(val(.jst_style_resolve(file.path(.ard, "arfull.jstyle"))),
                        val(.jst_style_resolve(q))),
       apa = identical(val(.jst_style_resolve(file.path(.ard, "arfull.jstyle"))),
                       val(.jst_style_resolve("apa"))))
}))
check("AR06 a complete copy: a blank line after every setting, none between a setting's notes and the setting, none twice and none at the end; a blank after each part's heading note; one blank line in all for each setting but the last, each part's heading note, the head and the stamps; it reads back as the same file with no blank lines does, and as apa",
      !is.null(.ar6) && .ar6$b$after && .ar6$b$notes && !.ar6$b$twice && .ar6$b$last &&
        length(.ar6$heads) == length(.jst_style_spec) &&
        all(!nzchar(.ar6$l[.ar6$heads + 1L])) &&
        identical(.ar6$b$n_set, sum(lengths(.jst_style_spec))) &&
        identical(.ar6$b$n_blank, .ar6$b$n_set - 1L + length(.jst_style_spec) + 2L) &&
        .ar6$same && .ar6$apa)

.ar7 <- .aqtry(local({
  invisible(res(jstyle("report", save.as = file.path(.ard, "arshort"), font = "Calibri", size = 11,
                       crosstab = list(total = "no"), regression = list(fit.rows = c("r2", "n")))))
  l <- readLines(file.path(.ard, "arshort.jstyle"), encoding = "UTF-8")
  st <- .jst_style_resolve(file.path(.ard, "arshort.jstyle"))
  list(l = l, b = .arblank(l),
       vals = list(.jst_style_key(st, "general", "font"), .jst_style_key(st, "general", "size"),
                   .jst_style_key(st, "crosstab", "total"), .jst_style_key(st, "regression", "fit.rows")))
}))
check("AR07 a short file: a blank line after each of its four settings but the last, none between a setting's notes and the setting, so a section's heading follows its blank line, none twice and none at the end; it reads back",
      !is.null(.ar7) && .ar7$b$after && .ar7$b$notes && !.ar7$b$twice && .ar7$b$last &&
        identical(.ar7$b$n_set, 4L) && identical(.ar7$b$n_blank, 2L + 3L) &&
        identical(.ar7$l[grep("^size = 11$", .ar7$l) + 1:2], c("", "[regression]")) &&
        identical(.ar7$l[grep("^fit.rows = r2, n$", .ar7$l) + 1:2], c("", "[crosstab]")) &&
        identical(.ar7$vals, list("Calibri", 11, "no", c("r2", "n"))))

options(.jst_options_style_dir = NULL, .jst_options_style = NULL)

unlink(c(.ns, .nu, .nwd, .qd, .pd, .tw, .vd, .aad, .akd, .apd, .aqd, .ard), recursive = TRUE)

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
