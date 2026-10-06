# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# missing_convention_walk.R -- the missing-convention message surface, walked
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# TYPE:     visual walkthrough (Expected comments; written for Jeff's checking)
# PENDING:  1 (S343, v0.9.217)
# LOCKS:    the runtime MESSAGE surface of the missing-value convention
#           machinery -- the joptions setting echo and nudge, the jdeclare_missing
#           mismatch notice, and the full jload load-narrative case set
#           (S227 E17): Cases 1, 4, 5, 6, 7, the preserve.declarations = FALSE
#           conversion report, the compact repeat form, and the all-ambiguous
#           reduction. PART C (S231) adds the jrecode convention-error
#           surface (three-way targets, the Rule G echo-back recipe, the
#           cap note) and the tag-convention mint display (.a vs .A).
#           PART E (S240) adds the jdeclare_missing parity surface: uppercase
#           minting through both tagged arms, the mixed-marker note and
#           its collapse remedy, the three-way gates, and the phrased
#           (setting-aware) refusals with gate-ready remedies.
#           PART D (S233) adds the codes-table ORDERING guarantee: the
#           order codes render in is a function of the codes themselves,
#           never of declaration order or row order.
#           PART F (S241) adds the message-build bundle: the missing
#           token (one map string, three conventions; the D7 teach-gate;
#           the D3 cap; benign reuse; NA=missing; labels missing=), the
#           D1 mint note's token-first remedy in both recode-family
#           functions, jdeclare_missing's D2 override note, jlogistic's D5
#           two-remedy DV error, and jsave's D6 release note.
#           PART G (S244) adds the Decision 11 choose-first gate: the
#           full menu (A) and the stata/sas pair (B) across their
#           spellings, the never-set range fix line (C), the data-aware
#           range-conflict refusals (D setting-level / E per-call, fits
#           and over-cap renders), jconvert's harmonized target menu
#           (F), and jscreen's SPSS-live-codes steering line (G).
#           PART H (S247) adds the label branch's truthfulness
#           annotations: the four per-marker facts and the way they
#           combine, the all-bare no-naming note that replaces the
#           naming header outright, and the bulk presence split.
#           PART J (S285) adds jfreq's Missing block under a pipeline:
#           the S217 denominator fix, read across the three forms and
#           all three stages.
#           PART K (S319) adds jrecode's markers as OLD values and the
#           S318 ruling on a declared missing value moved to a new code:
#           declared when the code looks like one, a note with the declare
#           pair when it does not, the one-form refusal, and the folded-in
#           mixed-column refusal; Section 43 is rebuilt around jconvert's
#           RANGE past the codes.
#           PART L (S339) adds jdeclare_missing()'s confirmation as a
#           statement of the variable's RESULTING declaration: what it
#           keeps, marked; labels said when absent and shown when kept; a
#           code no case holds; a call on several variables; and the drop
#           notice ahead of the durability reminder.
#           PART M (S340) adds a STRING variable's declared missing values
#           on the load and convert side: a .sav holding one loads to the
#           end of its narrative and names the declared strings;
#           preserve.declarations = FALSE and jconvert(to = "baseR") make
#           their cells NA; jconvert(to = "stata") refuses the variable,
#           with its two ways out.
# ORIGIN:   S226 (SAS-convention foundation, v0.9.123) + S227 (E17 jload
#           messaging redesign, v0.9.124). Written S228, superseding the two
#           disposable design-observation scripts it replaces:
#           S226_sas_foundation_observe.R and S227_E17_flags_observe.R.
#           Both may be deleted once this walk runs green.
# EDITED:   S343 (v0.9.217). SECTION 1, its last block RE-PINNED and one
#           block ADDED, for the (S281) item's value half: a near miss of
#           a convention value -- joptions(missing.convention = "sass"),
#           joptions("spps") -- gets, after the choice error, the value it
#           is nearest to and the call to run. Both Expected blocks FILLED
#           BY RUNNING the file on the 0.9.217 build (fill.R); the fourth
#           S282 block ("banana", near nothing) is unchanged, and its note
#           now says which of the two follow-ons has shipped. A capture of
#           every section on the 0.9.216 and 0.9.217 builds differs in
#           Section 1 alone, apart from the temporary folder's name
#           (Sections 11, 12, 17 and 30, in lines no Expected pins). No
#           NEEDS line changed (harness.R: 53 of 53). The assertion side
#           is missing_convention_check.R N83a-k. WALK PENDING: Section 1.
# EDITED:   S340 (v0.9.214; WALKED on the workstation the same session). Fix
#           Slate 3. NEW PART M, Sections 51 and 52 (a string variable's
#           declared missing values through jload() and jconvert()), every
#           Expected filled from a run of the file on the 0.9.214 build,
#           not typed. No existing Expected moved: a capture of every
#           section on the 0.9.213 and 0.9.214 builds differs only in the
#           temporary folder's name (Sections 11, 12, 17 and 30, in lines
#           no Expected pins). The two new sections need no other
#           (harness.R: 53 of 53 isolated runs equal the straight run).
#           Fixtures local to each section. WALK: Sections 51 and 52 --
#           WALKED by Jeff through rewalk("missing") ("All walks done
#           okay"); GitHub 2d04b68.
# EDITED:   S339 (v0.9.213; WALKED on the workstation the same session). Fix
#           Slate 2. NEW PART L, Sections 46-50 (the confirmation states
#           the resulting declaration), every Expected filled from a run of
#           the file on the 0.9.213 build, not typed. FIVE SECTIONS
#           RE-PINNED, found by diffing a capture of every section on the
#           0.9.212 and 0.9.213 builds (six sections' output moved; Section
#           3's moved in a line it does not pin): 18 (one space before
#           "(from -99)"), 19 (the mixed-marker note now BEFORE the
#           durability reminder), 28 (a bare redeclaration shows the labels
#           the variable kept), 40 ("-99 (no label)"), 45 render 4 (the
#           same, on IncomeR). WALK: Sections 18, 19, 28, 40, 45, 46-50.
# EDITED:   S334 (v0.9.211 PENDING; NOT yet walked on the workstation).
#           FOUR NEW BLOCKS, no existing Expected moved. Section 2 gains
#           one: joptions() with a folder note AND a nudge, to read the
#           blank line that now closes the call (and separates the two).
#           Section 43 gains renders 9-11: ONE ARROW COLUMN for the whole
#           conversion report (a one-value variable's arrow in line with
#           its neighbors'), a long label that keeps its own arrow, and
#           the return-trip note for codes that run away from zero --
#           render 2's parenthesis, which pointed at that to-do item, now
#           points at render 11. Sandbox: the whole file run end to end on
#           the 0.9.210 and 0.9.211 builds; apart from the new blocks the
#           two outputs differ only by the blank line after each nudge
#           (five places), which no Expected pins. WALK: the new Section 2
#           block and Section 43 renders 9-11.
# EDITED:   S332 (v0.9.210 PENDING; NOT yet walked on the workstation).
#           Section 1 gains ONE block, a bare joptions() under the "sas"
#           setting: the full panel now shows all six rows under every
#           convention, the SPSS codes row second (Jeff, S332, reversing
#           the S267 full-panel rule; the setting ECHO is unchanged, so no
#           existing Expected moves). The S268 note above the queries is
#           annotated where it said "in the full panel and the set-echo
#           alike". Sandbox: the whole file run end to end on the 0.9.210
#           build, its output identical to the 0.9.209 build's apart from
#           the new block. WALK: Section 1 only.
# EDITED:   S328 (v0.9.204 PENDING; NOT yet walked on the workstation).
#           jfreq's TABLE BLOCK-CENTERED AND TRIMMED -- nothing this file
#           is about changed, but it pins jfreq tables (Sections 17, 44
#           and 45: the Missing rows and Total rows of eight renders, and
#           the valid rows of Section 45's two), and their counts and
#           percentages moved: 31 pinned lines re-pinned, each to the line
#           it became in a diff of this file's own output on the 0.9.203
#           and 0.9.204 builds. Every line this file pins that was found
#           in the 0.9.203 output (465) is found in the 0.9.204 output,
#           and in output order. No message wording changed.
# EDITED:   S319, second build (v0.9.196 PENDING; NOT yet walked on the
#           workstation -- the 0.9.195 walk was skipped by agreement and
#           this one covers both). jconvert's report went to the LONG
#           FORM: one row per missing value, the column's name on the first
#           row and the rest hung beneath, the arrow aligned within each
#           block, and a declared value with a label printed as
#           -99 ["Refused"], the form jfreq's Missing section uses -- in
#           the report and in jrecode's notes, which had used
#           -99 ("Refused"). Section 43 renders 1, 2, 3, 7 and 8 and every
#           Section 45 note naming a labelled value RE-PINNED from a
#           whole-file capture diff (0.9.195 against 0.9.196, both run end
#           to end at the pinned 76): those renders and nothing else
#           changed. That answers the S319 walk question below (the
#           133-character report line). Section 43's commentary rewritten
#           for the rows.
# EDITED:   S319 (v0.9.195 PENDING; NOT yet walked on the workstation).
#           SECTION 43 REBUILT: jconvert(to = "spss") no longer refuses a
#           column with more markers than codes -- it declares the codes as
#           a RANGE from the first convention code (the S318 ruling) -- so
#           the four refusal renders are gone. Eight renders now: three
#           range conversions (five markers at the defaults; their return
#           trip; three markers at two codes), the two refusals that remain
#           (a single code; codes that would reach 0), the two-problem
#           frame at one code, and the S314 pair (jce, jcm) byte-identical
#           to their pins. NEW PART K, SECTION 45: jrecode's markers as old
#           values and the S318 ruling, six renders (the ruling-A note with
#           its jfreq; Education -99=-88 with its jfreq; Income -99=-88 and
#           the companion note's pair, pasted and run; the one-form
#           refusal; the mixed-column refusal). Every Expected a sink()
#           capture at the pinned 76, compared back against the file after
#           pasting. Whole file end to end on the 0.9.194 and 0.9.195
#           masters (community from its generator): the diff is Section 43
#           and Section 45 plus tempdir paths. FORTY-FIVE sections.
#           HYGIENE: jc5, jc5_spss, jc5_back, jc3_spss and jr45 added to
#           .walk_objects. A QUESTION FOR THE WALK, not a defect: the
#           conversion report prints one variable per line and never wraps,
#           and five labelled markers put 133 characters on that line
#           (Section 43, render 1).
# EDITED:   S314 (v0.9.189 PENDING; NOT yet walked on the workstation).
#           SECTION 43 RE-PINNED TWICE in one session. At 0.9.188, for the
#           AUDIT-051 build, the refusal moved to a letter framing under
#           the positional mapping (renders 1-4 re-pinned, a render 5
#           added). Jeff's walk of that build reopened Decision 4 Q6: the
#           positional rule refused a three-marker column (.d, .n, .r) for
#           jstats's own assumption. 0.9.189 maps a column's sorted markers
#           onto the codes in letter order, so the refusal is by count
#           again (renders 1-4 re-pinned to the family form: SPSS's limit
#           in the heading, "the maximum SPSS allows" on the widen line,
#           markers listed by letter) and the two new renders are
#           CONVERSIONS: render 5 (jce, a label-only .e) and render 6
#           (jcm, mnemonic letters), each with the always-shown return-trip
#           NOTE. Every Expected is a sink() capture at the pinned 76,
#           compared back against the file after pasting. The whole file
#           ran end to end on the 0.9.189 master (community and
#           text_columns_data from their generators): against the 0.9.188
#           run the diff is Section 43 plus tempdir paths, nothing else,
#           and both runs reach the end marker. The 0.9.188 pins were never
#           walked on the workstation and are superseded.
#           HYGIENE: eighteen frames added to .walk_objects -- PARTs E-F's
#           eleven (we ... wv), Section 43's three (jc3, jc4, jcb), and the
#           S314 fixtures and results (jce, jcm, jce_spss, jcm_spss). None
#           of the first fourteen was listed or rm()'d, so a SECOND run in
#           one session raised the foreign-frame heads-up naming them
#           (reproduced: the pre-S314 file, run twice in the sandbox, lists
#           exactly those fourteen; the edited file, run twice, raises
#           none). A fresh-session run was never affected.
# EDITED:   S303 (v0.9.174; WALKED on the workstation the same session,
#           the re-pinned sections reading as Expected). The D1
#           note's second remedy re-pinned at all five of its renders
#           (Section 27, both calls; Section 42, all three branches): from
#           S267 it named the SOURCE column in the assignment form, which
#           declares a code no source cell holds (jrecode) or errors on the
#           text source (jencode). It is now the recode-then-declare pair
#           on the result column. Section 25's absence claim quotes the new
#           intro. Found while re-pinning: Sections 27 and 42 (SET) still
#           read "Stata-style convention" in the lead line, stale since
#           S267 made it "Stata convention" -- corrected. Every re-pinned
#           block is a sandbox capture of this file run end to end against
#           the edited master (community and text_columns_data built from
#           their generators); the old-vs-new output diff is those five
#           tails and nothing else.
# EDITED:   S293 (v0.9.166; WALKED on the workstation the same session,
#           end to end, all 44 sections, end marker reached, restore block
#           run). Two Expected rows in Section 44 re-pinned for the
#           pipeline-row label change: jsubset -> jsubset() in Render 2,
#           jcomplete -> jcomplete() in Render 5. Two padding spaces
#           removed per row, so every count stays in its column. Render 5's
#           subset = row and Render 4 (Missing block only, no CPS rows
#           pinned) are unchanged; Renders 3 and 4 show jsubset()
#           consistently, unpinned. Each re-pinned row was verified
#           byte-for-byte against a sink capture (community built from its
#           generator) before delivery. The S293 ASCII ellipsis change
#           touches nothing here.
# EDITED:   S287 (v0.9.162; WALKED on the workstation the same session,
#           line by line, end marker reached, every render matching --
#           including Section 44's four tables byte for byte, Section 3's
#           re-pinned blank, and jfreq(Income) under juse(d17) at six
#           cases. Section 2's nudge shapes rendered singular / two /
#           three in turn, so no foreign frame was present. This walk also
#           clears the S285 PENDING, which never got its workstation walk.)
#           THE CPS-VISIBILITY RE-PIN. The S284 rule
#           (shipped S286, v0.9.161) replaced the no-pipeline Case
#           Processing table with a one-line N statement, and every one of
#           this file's THIRTEEN analysis calls is a jfreq: nine run with
#           the pipeline neutral and now print the N line; four (Section
#           44, Renders 2-5) run under a filter and keep their tables
#           unchanged. NO EXPECTED CHANGED -- none of the nine pins the
#           region above the frequency table; Section 44's two literal
#           CPS pins (Renders 2 and 5) rendered byte-identical, and
#           Render 4's prose "Remaining N 31" holds. Three prose
#           amendments: the Section 16 "--" bullet (it pointed at cells
#           that no longer render there), Section 44's Render 1 note (its
#           "exactly as at 0.9.159" was true of the Missing block and
#           false of the line above it), and Section 3's Expected, which
#           now says the mismatch note opens on its own blank line -- the
#           S283 rider's walk half, the S286 fix, check N60d. (First
#           delivered without the Section 3 edit; caught by Jeff's walk
#           showing the blank the Expected did not ask him to look for.)
#           The S266 entry below,
#           which speaks of "the eight jfreq CPS tables", is history and
#           left as written; those tables are the ones this entry retires.
#           Evidence: the whole file sandbox-rendered end to end (R 4.3.3,
#           community from its generator, .walkdir in tempdir) on BOTH the
#           0.9.161 and 0.9.162 masters, and the two renders are identical
#           line for line -- so the S287 master change (four leading
#           blanks in jdesc/jlm/jlogistic, the CPS printer's empty-frame
#           blank) touches nothing here, and every difference from the
#           S285 pins is S286's.
# EDITED:   S285 (v0.9.160 PENDING; NOT yet walked on the workstation). One
#           new PART (J) and one new section (44, five renders) for the
#           S217 fix: jfreq's Missing rows now count the pipeline pool. All
#           five Expecteds RENDERED in the sandbox at the pinned 76 against
#           the S285 master on this file's own fixtures (community built from
#           its generator), and the "at 0.9.159" numbers each Expected
#           quotes were rendered from the pristine master in the same pass.
#           No existing Expected changed: every jfreq beat in Sections 1-43
#           runs with the pipeline neutral, where the fix is a no-op.
#           FORTY-FOUR sections.
# EDITED:   S283 (v0.9.159; WALKED the same session -- run WARM on the
#           workstation with the check battery's fixtures still in the
#           environment, so the HEADS-UP fired and Sections 1-2 took their
#           plural/capped shapes as it predicts; end marker reached; every
#           S283 beat matched its render). Three sections, all new beats
#           RENDERED in the sandbox at the pinned 76 on this file's own
#           fixtures against the S283 master. Section 4: both
#           Expecteds re-pinned for the DELETION of "Mixing forms is
#           allowed." (Jeff's S282 read). Section 13: a third call, the
#           labels-only uppercase marker, which the refusal used to quote
#           in display case because jrecode stripped the labels parser's
#           raw record at the parse (S249) -- now harvested, so the head
#           reads '.B' and the pair leads sas. Section 32: four uppercase
#           calls (the three routes plus jencode) for the gate-lowercase
#           fix -- the gate had echoed a typed .A as '.a' in every home;
#           the Expected records the menu-reorder corollary as NOT taken.
#           Still FORTY-THREE sections.
# EDITED:   S282 (v0.9.158). THE COVERAGE-GAP SESSION: the four S268 gaps
#           and both S281 gaps closed, in one pass, every new Expected
#           RENDERED in the sandbox at the pinned 76 against the 0.9.158
#           master and none predicted. Section 1 gains four mistyped-slot
#           beats (three near misses plus the nothing-near fall-through,
#           which is the v1 boundary). Section 13 gains the UPPERCASE
#           marker -- the switch-pair reorder now has a visual witness for
#           the first time anywhere; it had gone inert once already and
#           only a workstation eye caught it. Section 20 gains refusals
#           4-6, the mix guard reached by a PER-CALL spss over a stata and
#           a sas setting, plus the named-codes prose fallback its own
#           comment had flagged. Section 42 gains the per-call convention
#           echo. NEW SECTION 43 walks jconvert's beyond-codes refusal in
#           four renders: the 3-code control, the narrowed widen remedy,
#           the gate, and the both-problems merged fix. FORTY-THREE
#           sections.
#           A PLACEMENT CORRECTION worth carrying: the uppercase beat was
#           first planned for Section 32, "variant B: the stata/sas pair",
#           on the strength of the NAME. Section 32 is the UNSET gate menu,
#           a different message that happens to list the same two options;
#           the pair S267 reordered is the spss-conflict refusal in Section
#           13. Rendering caught it. Match a section by what it EMITS, not
#           by what it is called.
#           ALSO: the "Error : " sweep, logged at S268 and taken here --
#           ten try()-wrapped Expecteds gained the space try() actually
#           prints. The tryCatch blocks keep the no-space form and are
#           annotated at Section 20 so a future diff does not "fix" them.
#           FINDING, not fixed (package to-do): the UNSET gate LOWERCASES
#           the marker it quotes back. Type '.A' and the head says "the
#           '.a' marker cannot be applied"; put '.B' in a labels argument
#           and it says '.b'. The spss-conflict refusal in Section 13
#           quotes the same typed marker correctly, so two messages
#           disagree about what the user typed, and only one satisfies
#           Rule AB. Probably the same root as the S267 inertness -- the
#           gate reads a marker the parser has already lowercased. Out of
#           scope for a walk session by Jeff's call; logged for the next
#           package pass.
# EDITED:   S280 (v0.9.157). THE S271 PIN-HYGIENE PASS, plus the joptions
#           query form. Every changed Expected was RENDERED in the sandbox
#           against the v0.9.157 master at the pinned 76 (source()'d,
#           R 4.3.3), not predicted -- the S268 lesson -- and then WALKED
#           THE SAME SESSION on the workstation in a clean environment (no
#           heads-up; Sections 1-3 rendered first time; end marker
#           reached): every changed site matched the capture, and the
#           three S271 pins had already been confirmed by the S278 walk.
#           Sites: Section 2's cw_mixed note
#           re-pinned to its one-line render (the min_last rule, N58c);
#           Section 21's first refusal, one line ("no lettered markers to
#           label"); Sections 22 and 24's provenance clause re-pinned to
#           "the missing.convention.codes default" -- the branch every
#           run in this file actually draws, because nothing here had
#           ever SET the codes slot -- and Section 22 gains the beat that
#           sets the slot and renders the OTHER branch, so the pin can
#           now fail. Section 1 gains two joptions("slot") queries: the
#           call form its S268 comment had described as though it
#           existed, shipped at v0.9.157. Setup now records, forces and
#           restores the codes slot (it forced the convention but not the
#           codes, so a session entering with codes set would have
#           flipped both provenance pins), and WALKDIR is .walkdir (the
#           S268 global-clobber item). The S268 coverage gaps (Sections
#           20 and 42, the uppercase switch pair, modify_form's plural)
#           are NOT taken here -- they need new sections judged against
#           a workstation capture.
# EDITED:   S268 (v0.9.150). THE S267 RE-PIN PASS. NOT RUN -- every
#           Expected below was rebuilt by reading the CURRENT source
#           against the old text, not transcribed from a render, so this
#           file is repaired but UNVERIFIED until the next workstation
#           walk. Fourteen sites: the joptions panel echo (Section 1 --
#           row relabel AND the codes row now suppressed off spss, so
#           the echo is a line shorter); jload Case 4 and Case 7
#           (Sections 7, 9) and D7 and D2 (Sections 23, 25) all taking
#           the setting-form clause "but your missing.convention setting
#           is \"<token>\""; Section 20's three refusals (conflict and
#           range guards gaining runnable Rule L remedies, mix guard
#           head renamed to the two styles) plus that block converted
#           out of the slash-prose form; the gate menu at Sections 31,
#           32 and 42 and the jconvert target menu at Section 36 (stata
#           and spss descriptors pre-broken); jscreen at Section 37
#           ("declared codes" -> "declared missing values", range-safe);
#           the D1 tail in all THREE of its renders (Sections 27, 42
#           twice); and the all-bare note's indents at both sites.
#           WALKED THE SAME SESSION, so the file is repaired AND
#           verified: run dirty at entry width 120 (the 76 pin fired),
#           convention entered clean, captured under sink() with
#           echo = TRUE. Every re-pin above matched EXCEPT the wrap
#           points, which had been marked as computed rather than
#           observed -- and five of the nine were wrong. All nine are
#           now transcribed from the capture and the markers are gone.
#           WHAT THE WRONG GUESSES HAD IN COMMON, worth carrying: every
#           mispredicted break broke EARLIER than the renderer does,
#           from under-counting the emitter's prefix reserve. Three
#           sites (Sections 7, 9, 28) turned out to share one
#           pattern -- line 1 closes on "missing.convention", line 2
#           opens on "setting". Section 23 collapsed from three head
#           lines to two. Section 36's pre-breaking held but the
#           secondary wrap inside each pre-broken sentence did not go
#           where predicted. Section 41's indent was settled AS shown.
#           ONE non-wrap correction: Section 20's echoed remedy renders
#           codes = c(-99), not codes = -99 -- the shared renderer emits
#           the c() form even for one code.
#           THREE COVERAGE GAPS S267 opened, noted at their sections and
#           NOT added here: the mix guard's two setting-aware branches
#           (Section 20), the D1 per-call convention echo (Section 42),
#           and the uppercase switch-pair render that flips the joptions
#           pair to sas-first -- no render in this file types an
#           uppercase marker, so the file cannot see that S267 fix at
#           all. missing_convention_check.R N59 covers the last one on
#           the assertion side.
# EDITED:   S266 (v0.9.149). The reading pass the S258 entry left owed: the
#           full capture read end to end for render quality, with findings
#           reported to the session log rather than fixed here. The capture
#           was first verified CURRENT at v0.9.149 except one construct --
#           the eight jfreq CPS tables' empty cells, em dash in the capture,
#           "--" since S261 (noted at Section 16; the post-change construct
#           is confirmed via jencode_walk's fresh capture, which renders
#           jfreq three times). File repairs, all against the S258 capture
#           or the live wrapper, NONE re-run here: Section 3's plural
#           remedy re-pinned to its one-line render; Section 14b's switch
#           line re-pinned to the render's break (a site the S258 diff
#           tolerated or missed); Section 17 brought to Section 4's S258
#           shape, retiring its pre-S253 one-console-line parenthetical;
#           Section 31's pull-back bullet rewritten to the S257 mechanism
#           (it contradicted the Expected S258 had already re-pinned above
#           it). The next workstation walk confirms all four.
# S294 EDIT (v0.9.167, 2026-09-14): the Setup reset line and the Section
#           44 foot moved to the clear.all = TRUE forms, and Renders 2-5's
#           clears to the named-frame f(j44_*, NULL) -- the S294 NULL flip.
#           Same messages either way (one frame), confirmed in the walk
#           below against a sandbox capture of the same file; no Expected
#           touched.
# LAST VERIFIED: v0.9.213, 2026-10-05 (S339) -- Sections 18, 19, 28, 40, 45
#           and 46-50 WALKED on the WORKSTATION through rewalk() (Jeff:
#           "both walk files are okay"), GitHub eb54a30, after the SANDBOX
#           run (R 4.3.3, UTF-8 locale): every Expected block of the new
#           sections found in the capture, and all 51 sections through
#           rewalk() in file order, reverse order and shuffled, and by
#           prepare = TRUE; no NEEDS line changed.
#           Prior: v0.9.211, 2026-10-05 (S337) -- Sections 4 and 17 WALKED
#           on the WORKSTATION through rewalk(), each matching its
#           re-pinned Expected; the rest untouched (no package change).
#           Prior: v0.9.204 PENDING, 2026-10-02 (S328) -- SANDBOX only: the
#           whole file run end to end at the pinned 76 on the 0.9.204 build
#           (pkgload::load_all; the shipped datasets from the package), the
#           31 re-pinned jfreq lines compared back against that capture;
#           workstation walk of Sections 17, 44 and 45 pending.
#           Prior: v0.9.196 PENDING, 2026-09-29 (S319) -- SANDBOX only:
#           the whole file run end to end at the pinned 76 on the 0.9.196
#           master (community from its generator), every re-pinned block
#           compared back against that capture; workstation walk pending.
#           Prior: v0.9.195 PENDING, 2026-09-28 (S319) -- sandbox only, the
#           workstation walk skipped for the second build.
#           Prior: v0.9.189, 2026-09-26 (S314) -- sourced end to end on the
#           WORKSTATION by Jeff, end marker reached, Section 43's six
#           renders WALKED clean.
#           Prior: v0.9.167, 2026-09-14 (S294) -- WALKED on the WORKSTATION,
#           all 44 sections, end marker reached. The four re-formed Section
#           44 clears and the two reset lines rendered byte-identically to
#           the bare forms they replaced (see the S294 EDIT note above); no
#           Expected changed. The entry foreign-frame scan stayed silent.
#           Prior: v0.9.146, 2026-08-26 (S258) -- CAPTURED AND DIFFED rather
#           than read: run cold under sink() at a pinned 76, and every
#           Expected block compared against the captured output. Sixteen
#           were stale and are re-pinned FROM that capture, not retyped.
#           Thirteen were wrap drift, carrying both generations (the S256
#           chrome reserve and the S257 pull-back condition): Sections 4,
#           22, 23, 24 x2, 31, 33, 34 x2, 35, 36, 41, 42. Three were more:
#           Section 21's block was recorded as running prose with "/"
#           marking the breaks, the only block in the file in that form
#           and the reason it stayed invisible to the diff -- now a
#           literal block; Section 25's no-target refusal had said "no
#           missing target" since before the S24x reword, against a
#           shipped message that says "no target" (N38a locks the
#           shipped form); Section 30's D6 note re-pinned around its
#           deliberate <normalized path> placeholder.
#           Section 27's convention state changed this session; a SECOND
#           run afterwards confirmed its new Expected, and re-showed every
#           other repair in this file against live output.
#           NOT read for render quality this run -- output went to a
#           file -- so a reading pass is still owed.
#
# PRIOR:    v0.9.144, 2026-08-25 (S255) -- WALKED IN FULL on the
#           workstation; every Expected matched. The two S255 sites it
#           exercises both held: jscreen's SPSS-declared-codes note (a
#           converted AND stripped site) and jdeclare_missing's mixing-forms
#           block (the site the new structural gate caught). Its read is
#           also what surfaced the condition-prefix overflow now carried
#           as an S255 to-do: R prepends "Error: " after the emitter has
#           finished budgeting, so first lines render 7-8 columns over.
#
# PRIOR:    v0.9.141, 2026-08-24 (S251) -- WALKED IN FULL on the
#           workstation, TWICE, and every Expected matched, PART I and
#           the three corrected ones included. The SECOND pass ran in a
#           CLEAN session (entry heads-up silent), which is what verifies
#           Sections 1-3 and 14b: the first pass had followed
#           missing_convention_check.R in the same session, so those four
#           named its ~70 leftover fixtures and shifted shape.
#           CLOSED by the clean pass -- half of the S248 carried finding.
#           Section 2's SINGULAR nudge shape, recorded there as never
#           having rendered at this version, renders. Its TWO-FRAME
#           sibling, logged in the same finding, is a different problem
#           and stays open: Section 2 creates cw_two and cw_three back to
#           back and calls joptions once, so it exercises one frame and
#           three, never two. No clean session fixes that -- it needs a
#           second joptions call between the two assignments, and it
#           re-pins Section 2's Expected when taken.
#           missing_convention_check.R N36b covers the shape on the
#           assertion side meanwhile.
#           Fixed between the two passes: PART I originally reused the
#           name gd, which SECTION 34 already owns -- renamed to gi. The
#           linear run was unaffected (34 and 35 finish first), but a
#           re-walk of Section 35 after a full pass would have failed on
#           a clobbered frame. Both names are now in .walk_objects.
#           S251 also re-pinned Section 31 and Section 36 for the two
#           S250 Rule H edits (both Expecteds still carried the pre-S250
#           text), corrected Section 38's Expected (short by one -- the
#           labels-hint asymmetry showing up as a promise of silence),
#           and added PART I / Section 42 for the D1 note's two branches.
#           Prior: v0.9.139, 2026-08-23 (S248) -- WALKED IN FULL on the
#           workstation, PART H included. Every PART H Expected matched,
#           and so did the three PART E Expecteds S247's ship had
#           overtaken. Nothing behavioural surfaced from the S247 bundle.
#           The run DID find one walk-side defect, in a part this session
#           had not touched: a leftover `clinic` data frame in the global
#           environment shifted every Section 2 nudge shape up by one, so
#           the singular form never rendered and the pasteable exemplar
#           named a frame the walk does not own. Fixed here by an entry
#           SCAN rather than a wider rm(), which would have broken the
#           cleanup's promise. Two known-open items reproduced unchanged
#           (the labels-hint asymmetry in Section 22; the Section 21
#           sibling recasing a typed .a to .A -- quote-fidelity site (1),
#           now observed live rather than only read in source), and
#           jdummy(NULL)'s frame scope showed itself in the run's first
#           line.
#           Prior: v0.9.138, 2026-08-23 (S246) -- WALKED IN FULL on the
#           workstation, alongside a 158/158 battery and a clean
#           devtools::check(). Rule Y landed: the jrecode/jencode
#           SPSS-form echo-back is retired, so Sections 13, 14, 14b and
#           15 carry new Expecteds and two of them changed SUBJECT --
#           Section 14 showed what the minimal tier shed and now shows
#           that the tiers are byte-identical; Section 15 was the cap
#           note and is now the Rule Y beat, running the collision
#           fixture the S245 read found. Every one matched.
#           The read produced THREE findings, all in jdeclare_missing's
#           tagged-label branch, all pre-existing, all logged:
#           (1) the branch's wording was opaque -- "Labeled SAS-style
#           missing values on Score" over '.A ["Changed"]' read as
#           though the DATA had changed, when the only act on an
#           already-tagged column is naming a marker. FIXED same
#           session (v0.9.138): "Named ..." over '.A is now "Changed"'.
#           (2) relabeling silently replaces the marker's previous
#           label; the SPSS branch announces that kind of drop and this
#           branch does not. (3) a label can be attached to a marker
#           that occurs in no cell, and the census note and jfreq then
#           both show it -- see the Section 21 note. A fourth, smaller:
#           a BARE marker (codes = ".a", no label) is a no-op that
#           still prints a "Named ..." header.
#           Prior: v0.9.137, 2026-08-23 (S245) -- WALKED IN FULL on the
#           workstation. Sections 13, 14, 14b and 15 carry S245's
#           rewritten Expecteds (generated from live renders, not
#           hand-edited); every one matched. Nothing behavioral surfaced
#           from the S245 change itself. The read DID produce two
#           findings, both PRE-EXISTING and both logged rather than
#           fixed: Section 15's rewrite substitutes pool codes without
#           checking whether those numbers already occur in the column,
#           so the recipe it hands the user can silently merge two
#           distinct values (FIXED at S246 by retiring the rewrite --
#           Rule Y; Section 15 now shows the worked example); and the
#           jdeclare_missing sibling refusal further down
#           still recases a quoted token and attaches a style word --
#           codes = c(Refused = ".a") reports '.A' -- which is exactly
#           what S245 removed from jrecode, caught here as live evidence
#           for the deferred quote-fidelity bundle.
#           Prior: v0.9.136, 2026-08-22 (S244) -- WALKED IN FULL on the
#           workstation, same session as the gate build, S242's
#           previously-unwalked additions included (Section 2's nudge
#           blocks, Section 3's mismatch blocks, 14b). Every Expected
#           matched, PART G included, and nothing BEHAVIORAL surfaced --
#           the census/ambiguity/predominance logic even got an
#           incidental verification from the 14b three-group nudge
#           (nine mismatching frames caught; d5/d11/d9/d10/d12 correctly
#           silent). What the read DID produce is a 21-item WORDING
#           findings set (Jeff's five catches plus Claude's sixteen:
#           the "tagged"/"Markers"/", as in SPSS" term set, the
#           truthfulness pair in the 14b render, the unwrapped
#           jload/jsave/jrecode-note lines, the non-runnable-remedy
#           trio, and kin), ALL LOGGED to the to-do (the two S244
#           follow-through items) rather than fixed, to keep this
#           verified base intact; two S241 known-open items reproduced
#           unchanged (the labels-hint asymmetry, the D2 bare-codes
#           display). The dash decision also landed from this read (CPS
#           adopts ASCII "--"; a next-session edit).
#           S244 built the Decision 11 choose-first gate, which replaces
#           the resolver's unset-state spss fallback with a guided
#           error. Sections that RELIED on the fallback now pin an
#           explicit spss setting so their renders stay reachable and
#           their Expecteds stay byte-valid: Sections 13, 14 (via 13's
#           pin), 15, 22 (first call), 25-26, and Section 20's third
#           call. A side effect worth noticing in Sections 13-14: the
#           error sentence "The package is currently set to SPSS
#           convention" -- previously flagged as imprecise under the
#           unset fallback -- is now literally TRUE, because the render
#           is only reachable with the setting actually set; the parked
#           contradiction dissolves. PART G (Sections 31-38) shows every
#           gate render live, including paste-and-rerun follow-throughs.
#           Prior: v0.9.135, 2026-08-22 (S242) -- NOT YET WALKED at that
#           version. S242's mv read-through rewrote messages this walk
#           pins, so EIGHT Expecteds were corrected at closeout (Section
#           2's three nudge blocks, Section 3's two mismatch blocks) and
#           Section 14b was added for the sas-phrased convention error.
#           Sections 13-15's existing Expecteds were deliberately NOT
#           touched: F2 changed display only under a tagged setting, so
#           the default renders they pin are byte-identical. The walk was
#           held back rather than run against known-stale text -- run it
#           on the next receive. Both batteries were green in the sandbox
#           (98/98 and jencode 41/41) and devtools::check() clean.
#           Prior: v0.9.134, 2026-08-22 (S241) -- walked once on the
#           workstation, and IT FOUND A DEFECT in that session's own new
#           code, which is the whole argument for reading a walk rather
#           than trusting a green battery: PART F Section 30's D6 resave
#           recipe echoed the file argument as supplied, so on Windows it
#           rendered a backslash path inside a quoted string -- a hard
#           parse error on paste, invisible to every assertion because no
#           check asserts pasteability. Fixed same-session (the recipe now
#           echoes .jst_norm_path(out_path)), along with two pre-existing
#           siblings the sweep turned up in jload, and all three verified
#           live afterwards. Everything else in PART F matched its
#           Expecteds, and PARTS A-E were re-read unchanged. Four
#           observations carried to the to-do rather than fixed (the
#           labels-hint asymmetry, the blank=9 heuristic difference, the
#           D2 bare-codes label display, jrecode dropping na_range).
#           Prior: v0.9.130, 2026-08-12 -- walked once on the S234 joptions
#           panel-echo build. Sections 1-2 carry revised Expecteds for the
#           slimmed setting echo; everything else was re-read unchanged.
#           Package GREEN: the echo correct in all four non-quiet setting
#           calls and silent in all four quiet ones, and both S233 ordering
#           guarantees (PART D) still holding. No defects in the package and
#           none in this file. Two findings, NEITHER from S234 and both
#           logged to the to-do rather than fixed here: jrecode's
#           cross-convention error says the package is "currently set to
#           SPSS convention" where joptions() reports the same slot as
#           "None selected" (parked behind the Decision 11 revisit); and
#           jload glues its Note: block on with a blank line where nothing
#           else in the package does (removal agreed for the next
#           implementation touch -- when it lands, Sections 7/8/9 Expecteds
#           lose that blank line and this walk must be re-read).
#           Prior: v0.9.129, 2026-08-12 -- walked THREE times on the S233
#           revision (expanded Section 6, new PART D): line-by-line, then
#           source() into a still-dirty session (exposing the leftover-
#           objects gap), then source() again after the entry-cleanup
#           block landed -- the third run reproducing the clean-session
#           Sections 1-3 output exactly, so idempotence-within-a-session
#           is CONFIRMED, not just implemented. Package behaviour green
#           on all three, including both S233 ordering guarantees. Three
#           defects found, ALL in this FILE rather than in the package,
#           all corrected same-session: Section 6 claimed two codes on
#           Smoker in both blocks (community declares one); Section 17
#           broke the one-line remedy across two comment lines; and the
#           walk restored its options but not its objects. Findings in
#           the Observations block.
#           Prior: v0.9.127, 2026-08-12 -- full walk covering the
#           S230-revised Expecteds AND PART C; all as designed except
#           Section 3's plural fixture, corrected in that same pass.
# EXPECTED REVISED: S230 (v0.9.126) -- Sections 7/8/9 Expecteds brought to
#           the S230 message surface (Rule L remedy blocks, wrapped
#           headlines; this also folds in the S229 modify = TRUE forms the
#           rider lines had missed). PENDING the next actual walk; the
#           LAST VERIFIED line above records runs, not edits.
#           DISCHARGED S259: walked in full at S246, S248, S251 and S255,
#           and captured against live output at S258, where Sections 7, 8
#           and 9 were not among the sixteen stale blocks -- so these
#           Expecteds are confirmed, not merely un-contradicted.
#           Also note:
#           small fixtures no longer print a "Loading dN ..." line (S230
#           1 MB floor) -- the Expecteds below never listed it, so console
#           output simply has one line fewer than at v0.9.124.
#           S231 (v0.9.127) -- PART C (Sections 13-16) ADDED for the
#           jrecode parity bundle; its Expecteds were generated from live
#           runs of the S231 build. The pending walk covers PART C at the
#           same sitting.
#           S233 (v0.9.128) -- the codes-table sort shipped, so Section 6's
#           Expected is EXPANDED (it listed one column and elided the rest,
#           which is precisely why the disorder survived to be caught by
#           eye at S231 rather than by this walk), and PART D (Section 17)
#           is ADDED to prove the guarantee rather than pass by luck: the
#           existing fixtures happen to declare their codes in an order
#           that already matched the sort. Section 17's Expecteds were
#           generated from live runs of the S233 build, and confirmed to
#           FAIL against the pre-fix build. PENDING the next actual walk.
#           DISCHARGED S259: same evidence as the S230 entry above --
#           Sections 6 and 17 were not among the S258 capture's stale
#           blocks, so both the expanded codes table and PART D's
#           ordering guarantee are confirmed against live output.
#           S248 (v0.9.139) -- PART H (Sections 39-41) ADDED for the S247
#           label-branch truthfulness bundle, the walk half of a pair whose
#           check half (N54, 13 checks) shipped at S247. Its Expecteds were
#           generated from live renders of the S247 build, not hand-drafted.
#           THREE EXISTING EXPECTEDS were also corrected, because the S247
#           ship overtook them: Section 18's second call now carries
#           '(was "Refused")', and Section 19's two declarations now carry
#           '(not present in the data)'. Two of the three sat under prose
#           describing the defect S247 fixed as though it were settled
#           behaviour -- Section 18's "what the message still does NOT say"
#           bullet and Section 19's WORTH KNOWING block -- so both were
#           rewritten rather than merely re-pinned. Section 19's block now
#           separates what S247 SETTLED (forward-declaring is allowed) and
#           FIXED (the message says so) from what stays OPEN (the census
#           counts the absent marker; jfreq renders it at frequency 0).
#           WALKED at S248 -- see LAST VERIFIED above; every one matched.
# RUN:      line-by-line first (read each block of output before moving on).
#           Also source()-safe: deliberate errors are tryCatch-wrapped and
#           every prompting call passes overwrite = TRUE. Under source(), run
#           WITH echo = TRUE, per the conventions file.
#           By section: source walk_tools.R, then rewalk("missing_convention")
#           shows the sections the PENDING line names and
#           rewalk("missing_convention", "1") shows one, each from a fresh
#           Setup and its NEEDS. Add prepare = TRUE to run only what the section
#           needs and step through it by hand.
# SECTIONS: PART A (1-3) reads the WHOLE global environment, not just this
#           file's frames -- see the entry-cleanup block below. It is
#           order-independent. PART B (4-12) is NOT --
#           see the session-state warning below. PART C (13-16) is
#           order-independent again: each section pins the convention
#           state it needs, and nothing in it touches the load-narrative
#           flag. PART D (17) DOES reset the load-narrative flag, and
#           resets it again on the way out, so it is safe to run alone
#           but leaves the flag cleared for anything run after it.
#           PART E (18-21) is order-independent: each section builds its
#           own fixtures, pins the convention state it needs, and clears
#           it on the way out. PART F (22-30) likewise. PART G (31-38)
#           shares one fixture (gw) built in Section 31, so run it from
#           its start rather than dropping into the middle. PART H
#           (39-41): Sections 39 and 40 share the hn fixture built in 39
#           -- run 39 first -- and Section 41 builds its own. PART I (42)
#           builds its own gi. SECTION 43 (S282) stands alone after it:
#           order-independent, builds its own three frames, and is the
#           only section that narrows missing.convention.codes, which it
#           clears on the way out. PART L (46-50, S339) is
#           order-independent: each section builds its own fixtures, sets
#           the convention it needs and clears it.
# ENDING:   the session-state restore, then the executable end-marker
#           line, both at the foot. The restore sat mid-file until S248,
#           left behind when PART D stopped being the last part, so a
#           full run ended with the convention slot cleared rather than
#           as it was found; it now runs after every part, and covers the
#           default data frame as well as the convention slot and the
#           notice flag. An entry SCAN (below the cleanup) reports any
#           data frame the walk did not create, because Sections 1-3
#           cannot reproduce their Expecteds when one is present.
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# *** SESSION-STATE WARNING -- READ BEFORE RUNNING SECTIONS OUT OF ORDER ***
#
# The load narrative has a FIRST-SHOWING form and a COMPACT REPEAT form, and
# which one you get depends on a session flag (.jst_missing_notice_shown) that the
# first UDM-bearing load sets. Section 4 is written as the first showing and
# Section 5 demonstrates the repeat. Jumping straight to Section 7 in a
# session where something already loaded UDMs shows you the compact form and
# it will look like guidance has gone missing.
#
# Section 4 resets the flag deliberately. To re-walk any single PART B
# section in isolation, run this first:
#     options(.jst_missing_notice_shown = NULL)
#
# WHY THE MESSAGES VARY AT ALL: three inputs, and it is worth holding them
# apart while reading. (1) the frame's own convention census -- uniform vs
# mixed vs ambiguous; (2) whether a missing.convention is EXPLICITLY set;
# (3) whether this is the first UDM-bearing load of the session. The case
# numbers below are the S227 design set, kept so the walk and the changelog
# entry can be read side by side.
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# --- Setup -------------------------------------------------------------------

# jstats must be loaded already: devtools::load_all() (development) OR
# library(jstats) (installed) -- never both in one session.
stopifnot(exists("jload", mode = "function"))

# --- Clear this walk's own leftovers (S233) ----------------------------------
# Sections 1-3 print the environment-scan notice, and that notice reads EVERY
# data frame in the global environment -- not only the ones this file made. So
# re-running the walk in a session that still holds the previous run's objects
# makes those three sections report a crowd of leftovers and stop matching
# their Expecteds. Observed on the S233 second walk: the notice listed
# cw_sort_spss, cw_spss, d1, d17, d2, d3 and d6 where one frame was expected,
# and named cw_decl and cw_decl2 -- objects Section 3 had not yet created on
# that run. The options restore at the foot was never enough on its own; the
# walk restored its SETTINGS but left its OBJECTS behind.
#
# Cleaning on ENTRY rather than at the foot is deliberate. A walk is meant to
# leave d1-d18 sitting in the environment afterwards, so they can be poked at
# once the run finishes -- half the point of stepping through one. Clearing on
# the way IN buys idempotence without giving that up.
#
# Scoped strictly to the names this file creates: intersect() with ls() means
# it never errors on a fresh session, and nothing outside the list is touched.
# all.names = TRUE is required, not decorative -- ls() hides dot-prefixed names
# by default, so without it the dot-prefixed .tl silently survives the clear.
# Runs BEFORE the entry-state capture below, so it cannot clobber it.
.walk_objects <- c(
  paste0("d", 1:18),
  "cw_spss", "cw_stata", "cw_sas", "cw_mixed", "cw_mixed1",
  "cw_two", "cw_three", "cw_decl", "cw_decl2",
  "cw_amb", "cw_plain", "cw_sort_spss", "cw_sort_stata",
  "tw", ".tl",
  "hn", "hw", "hb", "hs", "hn_labels",
  # PART G's frames (S244) were never listed here, and PART I's gd would
  # have joined them. Added S251. The omission was not cosmetic: the
  # foreign-frame scan below is setdiff(ls(), .walk_objects), so on a
  # SECOND run in one session the walk reported its own fixtures as
  # foreign -- the exact false alarm the scan exists to prevent, and it
  # blocked the "not verified until run twice in one session" standard
  # this file sets for itself.
  "gw", "gf", "gp", "gq", "gs", "gmix", "go", "gd", "gi",
  # PARTs E and F's frames (S240-S241) and Section 43's (S282) were never
  # listed either -- the same second-run false alarm the S251 note above
  # describes, fourteen frames' worth -- and S314 adds jce. Found at S314 by
  # scanning the file for top-level names neither listed here nor rm()'d.
  "we", "wm", "wg", "wp", "ws", "wf", "wc", "wd", "wt", "wl", "wv",
  "jc3", "jc4", "jcb", "jce", "jcm", "jce_spss", "jcm_spss",
  # S319: Section 43's band fixture and results, and Section 45's frame.
  "jc5", "jc5_spss", "jc5_back", "jc3_spss", "jr45"
)
rm(list = intersect(.walk_objects,
                    ls(envir = globalenv(), all.names = TRUE)),
   envir = globalenv())

# --- Foreign-frame heads-up (S248) -------------------------------------------
# The cleanup above cannot make Sections 1-3 reproducible on its own, and it
# is worth being precise about why. It clears the names THIS file creates.
# Any OTHER data frame sitting in the global environment -- a shipped dataset
# someone loaded, a frame from the previous script -- is equally visible to
# the environment scan, and deleting it would break the cleanup's one
# promise: nothing outside the list is touched. So this reports rather than
# removes.
#
# It matters more than a longer roster. Section 2 exists to show the nudge in
# its singular, two-frame and three-plus forms IN TURN, and one extra frame
# shifts each shape up by one, so the singular form never renders at all.
# Observed S248: a leftover `clinic` (from clinic_workflows_walk.R, which
# sets juse(clinic) two files away in the same folder) turned every Section 2
# shape into its successor, and the pasteable exemplar line named clinic.
.walk_foreign <- Filter(
  function(nm) tryCatch(is.data.frame(get(nm, envir = globalenv())),
                        error = function(e) FALSE),
  setdiff(ls(envir = globalenv()), .walk_objects))

if (length(.walk_foreign) > 0L) {
  cat("\n*** HEADS-UP: data frames this walk did not create are in the",
      "\n    global environment:\n      ",
      paste(.walk_foreign, collapse = ", "),
      "\n    Sections 1-3 scan the WHOLE environment, so their nudges will",
      "\n    name these too AND shift shape -- Section 2's singular form",
      "\n    will not render. Section 14b's joptions() call scans as well.",
      "\n    For those sections to match their Expecteds, run in a clean",
      "\n    session (restart R, load jstats, then this file). Everything",
      "\n    else below is unaffected.\n\n", sep = "")
}

rm(.walk_objects, .walk_foreign)

# Session-option hygiene. This walk sets and clears the missing-convention
# option throughout. Record the entering value and restore it at the foot
# (see the restore block above the end marker), so a walk leaves the
# session as it found it. The restore is TARGETED rather than a
# joptions(NULL) reset, which would discard the other slots too.
.entry_convention <- getOption(".jst_options_missing_convention")
.entry_notice_shown <- getOption(".jst_missing_notice_shown")
# S280: the codes slot too. Setup forced the CONVENTION to unset but
# left the codes slot as it arrived, and Sections 22 and 24 pin the
# provenance clause that branches on exactly that slot ("the default"
# when it is NULL, "your setting" when it has been set) -- so a session
# entering with codes set, even to the default values, would have
# flipped both pins. Recorded here, forced NULL below, restored at the
# foot, the same three moves the convention gets.
.entry_codes <- getOption(".jst_options_missing_convention_codes")

# Message-width state (S253). The emitter now wraps every message to the
# message.width setting, so message output has become environment-dependent:
# the same message renders differently on a 90-column pane and a 64-column
# one. Every Expected in this file was transcribed at 76, so pin the
# width exactly as the convention is pinned -- record what the session came
# in with, force it, restore at the foot. Belt-and-braces while the shipped
# default is still "medium" (= 76); load-bearing the moment that default
# becomes "auto" at the close of the emitter rollout.
.pin_width           <- 76L
.entry_message_width <- getOption(".jst_options_message_width")
options(.jst_options_message_width = .pin_width)

# S248: the default data frame too. Section 17 sets juse(d17) and clears it,
# so a walk used to hand back a cleared default to a session that arrived
# with one set. Captured as the OPTION rather than via juse(), and restored
# the same way at the foot: juse() would re-echo, and would stop if the
# frame had since been removed.
.entry_default_data <- getOption(".jst_default_data")

# Fixtures are written to a temporary folder, not to the standing test-data
# folder: they are derived from the shipped datasets by package functions in
# the section below, so there is nothing here worth keeping, and nothing to
# clean up afterwards.
# S280: dot-prefixed. The bare WALKDIR silently clobbered a caller's
# variable of that name (it bit the S268 capture session); a leading dot
# keeps it out of a casual ls() and off any name a caller is likely to own.
.walkdir <- file.path(tempdir(), "jstats_missing_convention_walk")
dir.create(.walkdir, showWarnings = FALSE, recursive = TRUE)
fx <- function(name) file.path(.walkdir, name)

# Neutral pipeline state (state persists across calls and across sessions;
# never assume the prior state is clean).
jsubset(clear.all = TRUE); jcomplete(clear.all = TRUE); joutput(NULL)
jdummy(clear.all = TRUE)
options(.jst_options_missing_convention = NULL)
options(.jst_options_missing_convention_codes = NULL)

# --- Build the fixture frames ------------------------------------------------
# Preference-1 construction (S226): everything below is derived from the
# SHIPPED community dataset by package functions, so the fixtures cannot
# drift from the package's own behaviour. package = TRUE forces the shipped
# copy -- a bare jload("community") can be shadowed by the derived .rds in
# the test-data folder.
#
# community carries SPSS-style declarations on five columns: Income,
# Education, Smoker, Environment1, Environment3.

jload("community", name = "cw_spss", package = TRUE, overwrite = TRUE,
      quiet = TRUE)

cw_stata <- jconvert(cw_spss, to = "stata", missing.notice = FALSE)
cw_sas   <- jconvert(cw_spss, to = "sas",   missing.notice = FALSE)

# A genuinely MIXED frame: convert two of the five declared columns and
# leave the other three alone.
cw_mixed <- jconvert(cw_spss, Income, Education, to = "stata",
                     missing.notice = FALSE)

# Files. Case 1 goes out and back through SPSS format (.sav) because that is
# the realistic route for a uniform SPSS-style frame -- and because jload
# reads .sav with user_na = TRUE internally, which is the round-trip trap
# that has cost time in the field project. Everything else uses .rds: a
# MIXED frame cannot survive .sav (no tagged NAs) or .dta (no na_values), so
# .rds is the only format that can carry it back intact.
jsave(cw_spss,  fx("uniform_spss.sav"),  overwrite = TRUE)
jsave(cw_stata, fx("uniform_stata.rds"), overwrite = TRUE)
jsave(cw_sas,   fx("uniform_sas.rds"),   overwrite = TRUE)
jsave(cw_mixed, fx("mixed.rds"),         overwrite = TRUE)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART A -- the S226 foundation surface ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 1 -- joptions accepts "sas"; the setting echo; the choice error ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

joptions(missing.convention = "sas")

# Expected: under the red "Options Settings" title, ONE slot line and a
# pointer -- not the six-slot panel:
#   Missing-value convention: SAS-style
#   Run joptions() to see all settings.
# (Platform-spec arguments are case-insensitive, so "SAS" and "Sas" reach the
# same place. The panel label is always the familiar capitalization.)
#
# RE-PINNED S268 for S267, TWO changes in one block. (1) The row label:
# "User-defined missing values (UDMs) convention:" -> "Missing-value
# convention:", and the value now carries the style word ("SAS-style", not
# "SAS") -- the runtime term change, "user-defined missing values" ->
# "declared missing values", reaching the panel by way of a shorter label
# that drops the concept name altogether. (2) The codes row is GONE from
# this echo. It is SPSS-convention detail, so .jst_options_status() now
# shows it only under an spss setting, in the full panel and the set-echo
# alike; the exception is an explicit partial query, which always shows
# it, because suppressing a slot the user asked for by name would read as
# the option not existing. This call sets "sas", so the row is suppressed
# and the echo is one line shorter than every prior walk recorded.
# (S332, v0.9.210: "in the full panel" no longer holds. A bare joptions()
# now shows the codes row under every setting -- the last block of this
# section. The echo's rule, which is what this block shows, is unchanged.)
# (S280: at S268 the query was written here as
# joptions("missing.convention.codes"), as though that call form existed.
# It did not -- a bare string went positionally into missing.convention
# and stopped with the choice error below -- until v0.9.157 built it.
# The two calls that follow are its first render.)

# S280 (v0.9.157): joptions("slot") is a status query on that slot. A slot
# name given UNNAMED in the first position is a query; a NAMED argument is
# always a set. The six slot names and the four convention tokens share no
# string, so nothing can be read both ways. Both calls run under the "sas"
# setting the echo above left in place.

joptions("missing.convention")

# Expected: under the red "Options Settings" title, the one row named and
# the pointer -- and NOT the codes row:
#   Missing-value convention: SAS-style
#   Run joptions() to see all settings.

joptions("missing.convention.codes")

# Expected: the codes row on its own, under a SAS setting -- the row the
# echo above suppressed:
#   SPSS-style missing value codes: -99, -98, -97
#   Run joptions() to see all settings.
# (Both blocks sandbox-rendered against the v0.9.157 master at S280, then
# confirmed by the S280 workstation walk.)

# S332 (v0.9.210): the FULL panel. A bare joptions() shows all six
# settings under every convention. From S267 it left the codes row out
# unless the setting was "spss"; that is reversed, because
# jconvert(to = "spss") and a per-call convention = "spss" use those codes
# under any setting, and the pointer above promises "all settings". Still
# under the "sas" setting.

joptions()

# Expected: under the red "Options Settings" title, SIX rows and no
# pointer -- the SPSS codes row second, under a SAS-style setting:
#   Missing-value convention: SAS-style
#   SPSS-style missing value codes: -99, -98, -97
#   Data folder: Working directory
#   Correlation layout: wide
#   Missing-value detail: per_code
#   Message width: 76
# (Rows three to five are the defaults; they show your own settings if
# you have changed them. The width is this walk's pin.)
# Things to look at: does the codes row read as an SPSS setting waiting to
# be used, or as a contradiction of "SAS-style" above it?

# S282 (v0.9.158): the query form's failure path. A positional string that
# matches no slot used to fall straight through to the value check below,
# which names the WRONG argument -- you asked about a slot, it answered
# about a convention token. The guard catches the near misses first.
# These three run under the same "sas" setting as the queries above; the
# guard reads slot NAMES, so the setting does not reach it.

tryCatch(joptions("missing.converntion"),
         error = function(e) cat("Caught: ", conditionMessage(e), "\n",
                                 sep = ""))

tryCatch(joptions("Missing.Convention"),
         error = function(e) cat("Caught: ", conditionMessage(e), "\n",
                                 sep = ""))

tryCatch(joptions("message.with"),
         error = function(e) cat("Caught: ", conditionMessage(e), "\n",
                                 sep = ""))

tryCatch(joptions("banana"),
         error = function(e) cat("Caught: ", conditionMessage(e), "\n",
                                 sep = ""))

# Expected, first call -- a transposition inside the slot name:
#   Caught: joptions(): no setting named "missing.converntion". Did you
#   mean missing.convention?
#     joptions("missing.convention")
#
# Expected, second call -- CASE-only, and still a suggestion rather than a
# silent resolution:
#   Caught: joptions(): no setting named "Missing.Convention". Did you
#   mean missing.convention?
#     joptions("missing.convention")
#
# Expected, third call -- the guard is not convention-specific; it reaches
# every slot in the defaults table:
#   Caught: joptions(): no setting named "message.with". Did you
#   mean message.width?
#     joptions("message.width")
#
# Expected, fourth call -- nothing is near, so the guard does NOT fire and
# the string falls through to the value check, exactly as before v0.9.158:
#   Caught: joptions(): `missing.convention` must be "none", "spss",
#   "stata", or "sas".
#
# Things to look at:
#   - The quoted string is what you TYPED, not a normalized form. The guard
#     captures it ahead of the tolower() further down the validation block
#     (Rule AB), which is the whole point of the second call: "Did you mean"
#     against a string that differs only in case would be nonsense if the
#     message had already lowercased it.
#   - Case-only variants get the SUGGESTION rather than resolving silently.
#     Slot names are argument identifiers, so they are case-SENSITIVE; the
#     case-insensitivity rule in the design notes covers platform-spec
#     VALUES ("SPSS" for "spss"), not argument names. Judge whether a reader
#     who typed "Missing.Convention" finds that distinction obvious from the
#     message alone, or whether it reads as pedantry.
#   - The remedy is the bare QUERY, not the see-it/change-it pair the other
#     joptions messages offer. Deliberate (Rule D): someone who typed a
#     quoted positional string already knows the query form and is asking a
#     question the pair does not answer.
#   - THE FOURTH CALL IS THE BOUNDARY, and it is the one to judge. Two
#     follow-ons were deliberately left out of v1: a did-you-mean for a
#     mistyped convention VALUE, and a slot LIST when nothing is near. Read
#     the fourth render as a user who meant to query a slot would: does
#     falling back to a message about "none", "spss", "stata", "sas" leave
#     them anywhere useful, or does the near-miss guard directly above make
#     its absence here more jarring than it was before v0.9.158?
#     (S343, v0.9.217: the first of those two shipped -- the two blocks
#     below. The slot LIST when nothing is near is still left out, so the
#     fourth render above is as it was.)
#
# (All four sandbox-rendered against the v0.9.158 master at S282, at the
# pinned 76, then confirmed by the S282 workstation walk.)

tryCatch(joptions(missing.convention = "sass"),
         error = function(e) cat("Caught: ", conditionMessage(e), "\n",
                                 sep = ""))

# Expected:
#   Caught: joptions(): `missing.convention` must be "none", "spss",
#   "stata", or "sas".
#   Did you mean "spss" or "sas"?
#     joptions(missing.convention = "spss")
#     joptions(missing.convention = "sas")
# (The first two lines are the Rule A choice-error house form, unchanged:
# backticked argument name, no "one of". The S226 changelog's verbatim
# recorded this loosely with "one of" -- the live form above, read from
# .jst_stop_arg, is correct.)
# RE-PINNED S343 (v0.9.217): the message ended at the choice error. A value
# near one of the four now gets the nearest value and the call to run as
# well. "sass" is one edit from both "spss" and "sas", so both are offered,
# each with its line, in the order the choice error lists them.

# S343: the same from the bare string -- the mistyped VALUE that the S282
# notes above left out. One nearest value this time, and the call keeps the
# form that was typed.

tryCatch(joptions("spps"),
         error = function(e) cat("Caught: ", conditionMessage(e), "\n",
                                 sep = ""))

# Expected:
#   Caught: joptions(): `missing.convention` must be "none", "spss",
#   "stata", or "sas".
#   Did you mean "spss"?
#     joptions("spss")
# Things to look at (S343):
#   - The choice error still comes first and still lists all four values;
#     the suggestion is an addition under it, not a replacement. Compare
#     the slot guard above, whose "no setting named ..." REPLACES the
#     choice error. Is the difference right -- a wrong value is still
#     answered by the list of values -- or should the two read alike?
#   - The call keeps your form: joptions("spss") after a bare string,
#     joptions(missing.convention = "spss") after the named argument.
#   - "sass": two values tied. Does offering both read as help or as a
#     hedge?
#   - What gets NO suggestion: a string more than two edits from every
#     value ("banana", above), and a short one that is near only because
#     it is short -- "sa", "st", and "data", which is two edits from
#     "stata" and more likely a question about data.dir.

options(.jst_options_missing_convention = NULL)

# Things to look at:
#   - the echo is ONE line, not five. That is the S226 REVISIT item,
#     designed S233 and shipped S234: a setting call now shows what it
#     touched rather than the standing state, so the change you just made
#     is visible instead of buried. The other three slots (data folder,
#     correlation layout, missing-value detail) are independent and stay
#     out of it.
#   - the codes line USED to ride along here, because the codes are read
#     in light of the convention -- the one related pair in the package.
#     S267 narrowed that: the pair still holds, but the codes are SPSS
#     detail, so the row rides along only under an spss setting. Set
#     "spss" instead of "sas" and watch the second line reappear; that
#     contrast is the fastest way to see the rule.
#   - the pointer closes the echo. It is there because the panel is now
#     partial: joptions() on its own still prints five (six under spss).
#   - the walk's own state hygiene is unaffected -- the echo is display
#     only, and every slot still holds whatever it held.
#   - UNDER source(): the "sas" setting above fires the nudge against ALL
#     the fixture frames built in Setup (they exist by now), so expect up
#     to three grouped notes here -- spss-uniform, spss-majority,
#     stata-uniform, with cw_sas correctly EXCLUDED as matching the
#     setting. Line-by-line, whether they fire depends on what is in your
#     global environment. Either way the notes are correct behaviour, and
#     the 2026-08-11 sourced run verified the three-group display.
#   - THE TWO QUERIES (S280). The first shows the convention WITHOUT the
#     codes row, where a setting call to "spss" pulls the codes in. That
#     is deliberate: the pull contextualizes a CHANGE, and a query changes
#     nothing. Does the absence read as "unrelated" or as "hidden"?
#   - The second shows, under a sas setting, the SPSS codes row the echo
#     above hid. Naming a slot always shows it. Judge whether the row
#     reads as dormant detail or as a contradiction of the setting.
#   - Neither query nudges, and neither is silenced by quiet = TRUE --
#     the same rule as the bare joptions() panel, which ignores quiet
#     too. A silenced query would return nothing at all.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 2 -- the environment-scan nudge, across all four of its shapes ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The nudge fires when a missing.convention is SET and the global environment
# holds data frames that disagree with it. It groups frames by (convention,
# unanimity) and emits one note per group. Per the S226 two-verdicts rule,
# this section deliberately shows the message at EVERY list length -- the
# joptions notice's old "predominantly ... align" wording sat unexamined from
# Session 28 because nobody had seen it fire against a uniform frame.

# One frame.
rm(list = intersect(c("cw_stata", "cw_sas", "cw_mixed"), ls()))
joptions(missing.convention = "stata")

# Expected, after the two-line echo and its pointer:
#   Note: the cw_spss data frame uses SPSS-style missing values.
#   To convert it to match this setting, run:
#     jconvert(cw_spss, to = "stata", modify = TRUE)
#
# REWRITTEN S242 (mv R1). The remedy was "Use jconvert() to change." --
# it named the function but handed over nothing runnable, while every
# sibling in this family (D2, D6, D7, the jload Case 6/7 riders) gives a
# pasteable call. The to = target is the setting just chosen.
#
# Worth pausing on the FIRST time through this section: the note now sits
# two lines under the convention that triggered it, where before S234 it
# sat below all five panel lines. That proximity was the stated second
# reason for slimming the echo -- judge whether it reads as one thought.

# Two frames, then three -- the list is and-joined, Oxford comma at 3+.
cw_two   <- cw_spss
cw_three <- cw_spss
joptions(missing.convention = "stata")

# Expected: one note naming all three frames, in ls() order, and -- because
# this is THREE frames -- the capped remedy: the repetition named in the
# intro, a SINGLE exemplar call built from the first named frame.
#   Note: the cw_spss, cw_three, and cw_two data frames use SPSS-style
#   missing values.
#   To convert them to match this setting, run one call per data frame:
#     jconvert(cw_spss, to = "stata", modify = TRUE)
# (Alphabetical, not creation order -- the scan walks ls(). Worth confirming
# that reads naturally; it is the one place the message's word order is not
# under our control.)
#
# THE CAP (S242, Rule U's repeated-remedy rule). One frame takes "run:" and
# one call; exactly TWO take "run both:" and one call each; three or more
# take this named-repetition form with one exemplar. The rule exists because
# .jst_format_var_list caps at max_show = 10, so enumerating would let a
# twelve-frame workspace put ten near-identical calls in one note -- and
# because the exemplar form absorbs a TRUNCATED list for free ("one call per
# data frame" is equally true of the named frames and the "... and N more"
# tail). Worth deliberately checking: insert a second frame temporarily and
# confirm the "run both:" form appears, since two is the only arm this
# section does not otherwise exercise.

# A frame with an internal MAJORITY rather than a uniform convention: the
# verb changes to "predominantly uses" and the remedy verb to "align".
rm(cw_two, cw_three)
cw_mixed <- jconvert(cw_spss, Income, Education, to = "stata",
                     missing.notice = FALSE)
joptions(missing.convention = "sas")

# Expected: TWO notes, separated by a blank line, in canonical style order
# (spss before stata):
#   Note: the cw_spss data frame uses SPSS-style missing values.
#   To convert it to match this setting, run:
#     jconvert(cw_spss, to = "sas", modify = TRUE)
#
#   Note: the cw_mixed data frame predominantly uses SPSS-style missing values.
#   To convert it to match this setting, run:
#     jconvert(cw_mixed, to = "sas", modify = TRUE)
# (S280 re-pin, per the S271/S278 walks: the second note's first sentence
# fits on ONE line at 75 of the 76-column pin. "values." on its own would
# be a single-word tail, and the min_last rule pulls it back onto the
# line -- locked by missing_convention_check.R N58c. The pre-S280 pin,
# which wrapped after "missing", predated that rule. S271 saw this only
# in the CLEAN run: the contaminated plural form is longer and genuinely
# wraps, so a dirty environment had been hiding it.)
#
# Things to look at:
#   - "uses" vs "predominantly uses" is the unanimity distinction doing its
#     work: cw_spss is wholly SPSS-style, cw_mixed merely mostly so.
#   - the REMEDY no longer tracks that distinction. Pre-S242 the verb split
#     "change" vs "align" carried it; the mv pass judged that a distinction
#     the reader cannot act on -- the call is the same either way -- so both
#     arms now take the identical runnable line and the unanimity signal
#     lives entirely in the sentence verb. Check that reads as a loss of
#     nothing.
#   - the blank line between the two notes is Rule F, and it survived the
#     redraft (the group loop is untouched).
#   - the leading article and "data frame(s)". Bare frame names cannot be
#     capitalized (R is case-sensitive), which is what made the pre-S227
#     wording read as a fragment.

# THE CLOSING BLANK LINE (S334, v0.9.211). The nudge prints after the echo's
# closing blank line, and until 0.9.211 nothing followed it, so its last
# line -- a call to paste -- sat directly against the next prompt. So did the
# "Created" note that joptions(data.dir = ) prints, and with both in one call
# the note ran straight into the nudge. Now the call ends on ONE blank line
# whatever it printed last, with one between the note and the nudge. The
# same two frames as the block above, so the same two notes; the folder is
# made in the session's temporary directory and removed again, and the
# data.dir setting this session came in with is put back.
.dd2 <- getOption(".jst_options_data_dir")
.wd2 <- setwd(tempdir()); unlink("walk_data_folder", recursive = TRUE)
joptions(missing.convention = "sas", data.dir = "walk_data_folder")

# Expected -- the echo and its blank line; the folder note; a blank line; the
# two notes; and a blank line before whatever comes next:
#   Options Settings
#   Missing-value convention: SAS-style
#   Data folder: walk_data_folder
#   Run joptions() to see all settings.
#
#   Created 'walk_data_folder' folder in working directory.
#
#   Note: the cw_spss data frame uses SPSS-style missing values.
#   To convert it to match this setting, run:
#     jconvert(cw_spss, to = "sas", modify = TRUE)
#
#   Note: the cw_mixed data frame predominantly uses SPSS-style missing values.
#   To convert it to match this setting, run:
#     jconvert(cw_mixed, to = "sas", modify = TRUE)
#
#
# Things to look at:
#   - THE THREE BLANK LINES: under the pointer, under the "Created" line,
#     and under the last jconvert() line. The first was always there; the
#     other two are new. Does the "Created" line now read as part of this
#     call's answer, and the last jconvert() line as finished?
#   - The blank lines are written to the output, not put in the notes: the
#     RStudio console does not show a blank line that travels with a note.
#     The one BETWEEN the two notes is the nudge's own, as above.
options(.jst_options_data_dir = .dd2)
unlink("walk_data_folder", recursive = TRUE); setwd(.wd2); rm(.wd2, .dd2)

options(.jst_options_missing_convention = NULL)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 3 -- the jdeclare_missing post-declaration mismatch notice ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The mirror-image rule to Section 2's: VARIABLE names stand alone in their
# own case, with no article and no noun. The asymmetry is deliberate (S227) --
# a bare frame name reads as a fragment, a bare variable name in a
# declaration notice does not.

# Singular. Declare a Stata-style code on one column of an otherwise
# SPSS-style frame.
cw_decl <- jdeclare_missing(cw_spss, Age, codes = -97,
                        labels = "-97=Not asked", convention = "stata")

# Expected, after the declaration notification -- and after ONE BLANK LINE
# (S287 re-pin; the blank is the S286 fix):
#     jdeclare_missing(cw_spss, Age, ..., modify = TRUE)
#
#   Note: Age uses Stata-style missing values, but other columns in cw_spss
#   are SPSS-style.
#   To align Age with the rest, run:
#     jconvert(cw_spss, to = "spss", vars = "Age", modify = TRUE)
#
# The blank matters: until v0.9.161 this note printed on the very next line
# after the modify = TRUE hint's indented call, so it read as fallout from
# the runnable line rather than as its own note. S267's Rule F pass gave the
# other two follow-on notes (the drop notice, the mixed-marker note) their
# blank and missed this one; seen at the S283 walk, fixed S286 (a cat("\n")
# at the head of the mismatch block, the same idiom as its siblings), pinned
# by check N60d at S287. The plural render below carries the same blank.
#
# RE-PINNED S283: "Mixing forms is allowed." DELETED (Jeff's read at the
# S282 walk: unnecessary). The note now runs straight from the mismatch
# to the remedy. Check N37c locks the adjacency.
#
# REWRITTEN S242 (mv R2), two changes still worth reading for:
#   - the opening spends the FULL locked term on first mention and drops to
#     the bare style word for the second clause. Reading this note beside
#     the shipped D2 override note is what surfaced it -- D2 already did
#     exactly that, and the MISSING-VALUE-TERMS rule wants the full term.
#   - the remedy is runnable and SCOPED: vars = "Age" aligns the one column,
#     not the frame. Singular takes a bare string; plural takes c(...).
#   (The third S242 change, "Mixing forms is allowed." replacing the
#   "if desired" hedge, is history: the sentence went at S283.)

# Plural, and the "are predominantly" variant: declaring on two columns at
# once, in a frame whose remainder is itself no longer uniform.
#
# FIXTURE NOTE (corrected S231). This demo needs its own frame, converted
# on ONE column only. Detection is whole-frame predominance judged AFTER
# the declaration lands, so declaring two Stata columns into cw_mixed
# (3 SPSS / 2 Stata) would tip the frame to Stata 4-3 -- the declared
# columns would then be in the MAJORITY and the notice would correctly
# stay silent. Converting one column instead (4 SPSS / 1 Stata) leaves
# SPSS ahead after the declaration, so the mismatch is real and the notice
# fires. The S228 version of this section used cw_mixed and promised a
# notice the fixture could not produce; the code was right, the fixture
# was wrong. Decision 11's silence-on-tipping was examined at length at
# S231 and confirmed as shipped -- see the Decision 11 Notes.
cw_mixed1 <- jconvert(cw_spss, Income, to = "stata", missing.notice = FALSE)
cw_decl2 <- jdeclare_missing(cw_mixed1, Age, CommuteTime, codes = -97,
                         labels = "-97=Not asked", convention = "stata")

# Expected: the plural verb, and -- because the columns left over after
# removing Age and CommuteTime are a genuine SPSS/Stata mix -- "are
# predominantly" rather than "are":
#   Note: Age and CommuteTime use Stata-style missing values, but other
#   columns in cw_mixed1 are predominantly SPSS-style.
#   To align them with the rest, run:
#     jconvert(cw_mixed1, to = "spss", vars = c("Age", "CommuteTime"), modify = TRUE)
#   (one console line, 81 columns -- a runnable call is an unbreakable
#   atom, so it runs past the 76 pin rather than wrapping; re-pinned S266,
#   the comment used to show it wrapped)
#
# Things to look at:
#   - the verb is judged over the frame MINUS the named columns (S226), so
#     it describes the population the sentence actually claims.
#   - the frame name is the name the object was passed under.
#   - the DETECTION, by contrast, is judged over the whole frame including
#     the declared columns -- which is why the fixture note above matters.
#
# NOT WALKED HERE, DELIBERATELY: convention = "sas" on jdeclare_missing. The sas
# rollout is piecewise and the parity worklist has not reached this function,
# so what a per-call "sas" does at the mint site is exactly the open
# question -- not something a walkthrough should quietly assert an
# expectation about. The lag itself is asserted in
# missing_convention_check.R (check N11); add a section here when the
# worklist ticks jdeclare_missing.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART B -- the S227 jload load narrative, case by case ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 4 -- Case 1: uniform SPSS-style, no setting (the first showing) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The commonest load in the wild, and the one E17 was raised about.

options(.jst_missing_notice_shown = NULL)   # force the FIRST-showing form
options(.jst_options_missing_convention = NULL)

jload(fx("uniform_spss.sav"), name = "d1", overwrite = TRUE)

# Expected, in this order:
#   Loaded d1 (SPSS format; 103 cases, 15 variables)
#   5 variables have SPSS-style missing values:
#     Income: -99 ["Refused"], -98 ["Don't know"]
#     Education: -99 ["Refused"], -98 ["Don't know"]
#     Smoker: -99 ["Refused"]
#     Environment1: -99 ["Refused"], -98 ["Don't know"]
#     Environment3: -99 ["Refused"], -98 ["Don't know"]
#   jstats analyses treat these codes as missing. Base R functions do not.
#   To make them missing in base R as well, convert:
#     jconvert(d1, to = "stata", modify = TRUE)
#   (re-pinned S337 from a capture: the remedy is a head line ending in a
#   colon and the call on a line of its own, indented two spaces; this
#   block showed the earlier one-sentence form, "..., run jconvert(...).")
#
# (Inventory ORDER follows the frame's column order, so check the five names
# are all present rather than that they appear exactly as listed.)
#
# Things to look at:
#   - the Loaded line comes FIRST (S227 D1). That is the E17 fix: in outbound
#     work the read is a confirmation step, so the confirmation leads and the
#     narrative reads as detail beneath it.
#   - the remedy names the loaded object, d1 -- copy-paste runnable, not a
#     generic placeholder.
#   - no menu of alternatives. to = "baseR" and the range-enumeration cost
#     live in ?jconvert; costs surface where they bite.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 5 -- the compact repeat form, and forcing the full form back ----
# NEEDS: 4
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

jload(fx("uniform_spss.sav"), name = "d2", overwrite = TRUE)

# Expected: Loaded line, header and inventory -- and NO guidance pair. The
# two "jstats analyses treat these codes..." lines are dropped on repeat
# loads (S227 D6: richness scales inversely with per-session repetition).

jload(fx("uniform_spss.sav"), name = "d3", overwrite = TRUE,
      missing.notice = TRUE)

# Expected: the FULL form again, guidance included. An explicitly passed
# missing.notice = TRUE overrides the compact repeat, which is how you recall
# the guidance later in a session without restarting R.
#
# Things to look at:
#   - a convention NOTE (Sections 7-9) is retained even in the compact form,
#     while the Case 1 guidance is dropped. That is deliberate: a session's
#     second frame can carry a mismatch the first could not have reported.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 6 -- Case 5: uniform Stata-style, then uniform SAS-style ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# No remedy at all in either. Tagged markers are ALREADY NA to base R, so
# the whole base-R-compatibility pitch is moot -- there is nothing to fix.

options(.jst_missing_notice_shown = NULL)
jload(fx("uniform_stata.rds"), name = "d4", overwrite = TRUE)

# Expected: header + inventory ONLY. All five columns are listed rather
# than elided, because an elided Expected cannot catch an ordering defect
# -- this block used to name Income and end with "...", which is how two
# columns rendering .a, .b and .b, .a two lines apart went unnoticed here
# and had to be caught by eye on the S231 walk.
#
# FOUR of the five columns carry the same two codes; SMOKER CARRIES ONE.
# Read for that asymmetry, not down a column of identical lines: four
# matching lines plus one deliberately different one is a check the eye
# can actually perform, and Smoker is the line that proves you read them.
#   Loaded d4 (R native format; 103 cases, 15 variables)
#   5 variables have Stata-style missing values:
#     Income: .a ["Refused"], .b ["Don't know"]
#     Education: .a ["Refused"], .b ["Don't know"]
#     Smoker: .a ["Refused"]                          <- ONE code, by design
#     Environment1: .a ["Refused"], .b ["Don't know"]
#     Environment3: .a ["Refused"], .b ["Don't know"]

options(.jst_missing_notice_shown = NULL)
jload(fx("uniform_sas.rds"), name = "d5", overwrite = TRUE)

# Expected: the same shape and the same four-plus-one asymmetry, with the
# style named SAS-style and the codes in their true UPPERCASE form:
#   5 variables have SAS-style missing values:
#     Income: .A ["Refused"], .B ["Don't know"]
#     Education: .A ["Refused"], .B ["Don't know"]
#     Smoker: .A ["Refused"]                          <- ONE code, by design
#     Environment1: .A ["Refused"], .B ["Don't know"]
#     Environment3: .A ["Refused"], .B ["Don't know"]
#
# Things to look at:
#   - .a/.b vs .A/.B is the whole of the SAS/Stata distinction. The
#     representation underneath is identical (Decision 13); only tag case
#     and the display label differ.
#   - in the four two-code lines, Refused precedes Don't know in BOTH
#     blocks. A line out of step is an ordering regression (S233).
#   - Smoker's single code is the frame's own shape, not a truncation:
#     community declares only -99 on it. Section 4 shows the same column
#     as -99 ["Refused"] in SPSS form.
#   - this is the pair a former SAS user meets. Does "SAS-style" plus
#     uppercase tags read as their own convention, or still as Stata with a
#     coat of paint?


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 7 -- Case 4: uniform frame, explicitly set DIFFERENT convention ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Two remedies that resolve in OPPOSITE directions. Which is right turns on
# whether the user regards the data or the setting as authoritative -- and
# the package cannot infer that, so it recommends neither. This is the Rule D
# equal-standing-remedies carve-out agreed at S227.

options(.jst_missing_notice_shown = NULL)
joptions(missing.convention = "stata", quiet = TRUE)
jload(fx("uniform_spss.sav"), name = "d6", overwrite = TRUE)

# Expected: Loaded line, header, inventory, then IMMEDIATELY the note --
# no blank line between them as of S237 (S234 decision: jload's "\n\n" join
# reduced to "\n", aligning it with its own Case 1 advisory and with
# jdeclare_missing's mismatch notice, and matching Rule F's letter):
#   Note: these variables are SPSS-style, but your missing.convention setting
#   is "stata".
#   To use SPSS-style missing values, run:
#     joptions(missing.convention = "spss")
#   To use Stata-style missing values, run:
#     jconvert(d6, to = "stata", modify = TRUE)
#
# RE-PINNED S268 for S267. The head clause was "but the session's missing
# convention is set to \"stata\"." and is now "but your missing.convention
# setting is \"stata\"." -- naming the ARGUMENT the user would type rather
# than describing the session, and harmonizing this note with D2 and D7,
# which already used the possessive form. The token was quoted before and
# after; it is the clause around it that moved.
#
# BREAK CORRECTED from the S268 run. The predicted break was one word
# early -- "setting" was put on line 2 and belongs on line 1, leaving
# only 'is "stata".' below. Transcribed from the capture, not computed.
#
# Things to look at:
#   - the Case 1 guidance is GONE. With a setting in place the user has
#     stated a preference, so the mismatch and its remedies are the whole
#     message.
#   - the data's own style is offered first (the non-destructive remedy
#     first, per the standing suggestion convention), but neither block is
#     marked as recommended. Read them as a pair: is the even-handedness
#     legible, or does first-position read as endorsement?
#   - each runnable call sits on its own two-space-indented line with no
#     trailing period (Rule L); the joptions line is a settings call and
#     correctly carries no modify = TRUE.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 8 -- Case 6: mixed frame, no setting ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

options(.jst_missing_notice_shown = NULL)
options(.jst_options_missing_convention = NULL)
jload(fx("mixed.rds"), name = "d7", overwrite = TRUE)

# Expected: a GROUPED-COUNT header rather than a style-named one, then the
# note with an align line per style present:
#   Loaded d7 (R native format; 103 cases, 15 variables)
#   5 variables have missing values (3 SPSS-style, 2 Stata-style):
#     ...
#   Note: d7 mixes SPSS-style and Stata-style missing values.
#   To use SPSS-style throughout, run both:
#     jconvert(d7, to = "spss", modify = TRUE)
#     joptions(missing.convention = "spss")
#   To use Stata-style throughout, run both:
#     jconvert(d7, to = "stata", modify = TRUE)
#     joptions(missing.convention = "stata")
#
# Things to look at:
#   - BOTH align lines carry a joptions rider here. Converting under a
#     "none" setting leaves the resolver falling back to SPSS, so the next
#     fresh declaration would re-mix the frame -- the rider closes that.
#   - grouped counts rather than a per-line style tag (S227 D2): the
#     inventory lines already carry multiple code ["label"] entries and wrap,
#     so a trailing tag column would be fragile there.
#   - NO BLANK LINE before the Note: block (S237). The inventory runs
#     straight into it.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 9 -- Case 7: mixed frame under an explicit setting ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

options(.jst_missing_notice_shown = NULL)
joptions(missing.convention = "spss", quiet = TRUE)
jload(fx("mixed.rds"), name = "d8", overwrite = TRUE)

# Expected: the note now NAMES the off-setting columns, the setting's own
# style leads the remedies, and only the non-setting target carries the
# joptions rider (S230 Rule L form):
#   Note: Income and Education are Stata-style, but your missing.convention
#   setting is "spss".
#   To use SPSS-style missing values throughout, run:
#     jconvert(d8, to = "spss", modify = TRUE)
#   To use Stata-style missing values throughout, run both:
#     jconvert(d8, to = "stata", modify = TRUE)
#     joptions(missing.convention = "stata")
#
# RE-PINNED S268 for S267, the same clause change as Section 7: "but the
# session's missing convention is set to" -> "but your missing.convention
# setting is". The remedies below it are untouched.
#
# BREAK CORRECTED from the S268 run, and wrong in the same direction as
# Section 7's: the guess broke after "your" where the render breaks
# after "missing.convention". Both heads in fact land identically --
# the argument name closes line 1 in Section 7 and opens the tail here.
#
# Things to look at:
#   - the rider rule in one view: the setting-matching block is "run:" with
#     one call (running it leaves the setting matching the result); the
#     off-setting block is "run both:" with the joptions rider as its
#     second indented call.
#   - the headline break is now COMPUTED (.jst_wrap_prose, width 76 with
#     orphan pull-back), not the old hard-wrapped format string -- it
#     should land at a word boundary with no dangling short tail, on long
#     and short column lists alike.
#   - NO BLANK LINE before the Note: block (S237), as in Sections 7 and 8.

options(.jst_options_missing_convention = NULL)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 10 -- preserve.declarations = FALSE: the conversion report ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# A different message entirely: not "here is what your data carries" but
# "here is what I just threw away".

options(.jst_missing_notice_shown = NULL)
jload(fx("uniform_spss.sav"), name = "d9", overwrite = TRUE,
      preserve.declarations = FALSE)

# Expected:
#   5 variables had SPSS-style missing values, converted to plain NA per
#   preserve.declarations = FALSE:
#     Income: was -99 ["Refused"], -98 ["Don't know"]
#     ...
#   To keep the declarations instead, reload with preserve.declarations = TRUE.
#
# Things to look at:
#   - past tense throughout, and every inventory line prefixed "was".
#   - this form is NEVER compacted, on any repeat. Destructive conversion
#     always gets its full report.

jload(fx("uniform_spss.sav"), name = "d10", overwrite = TRUE,
      preserve.declarations = FALSE)

# Expected: the identical full report, not a compacted one.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 11 -- ambiguous (mixed-case) columns: the all-ambiguous reduction ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# A column carrying BOTH .a and .B classifies as no convention at all
# (Decision 13). It is reachable by row-binding differently-converted frames
# and appears in no shipped data. The fixture is hand-built with haven
# primitives -- deliberately, because the package will not mint a mixed-case
# column and should not be taught to.

cw_amb <- data.frame(
  x = haven::labelled(
    c(1, 2, haven::tagged_na("a"), 4, haven::tagged_na("B")),
    labels = stats::setNames(
      c(haven::tagged_na("a"), haven::tagged_na("B")),
      c("Refused", "Don't know"))),
  y = haven::labelled(
    c(5, haven::tagged_na("A"), 7, haven::tagged_na("b"), 9),
    labels = stats::setNames(
      c(haven::tagged_na("A"), haven::tagged_na("b")),
      c("Refused", "Don't know")))
)
jsave(cw_amb, fx("ambiguous.rds"), overwrite = TRUE)

options(.jst_missing_notice_shown = NULL)
jload(fx("ambiguous.rds"), name = "d11", overwrite = TRUE)

# Expected: header + inventory and NOTHING ELSE -- no style named, no
# remedy, no note. Every declared column is ambiguous, so there is no
# evidence to reason from:
#   2 variables have missing values (2 mixed-case):
#     x: ...
#     y: ...
#
# Things to look at:
#   - "mixed-case" is the display label for the ambiguous group, sitting in
#     the same slot the style labels occupy.
#   - silence here is the designed behaviour, not a gap. Judge whether a
#     reader who lands on this without context would understand that.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 12 -- the D1 reorder applies to UDM-FREE loads too ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# S227 ruling 3: the Loaded-line-first reorder is not scoped to declared
# frames. A plain frame now prints Loaded above the suspicious-codes scan.

options(.jst_missing_notice_shown = NULL)
cw_plain <- jconvert(cw_spss, to = "baseR", missing.notice = FALSE)
jsave(cw_plain, fx("plain.rds"), overwrite = TRUE)
jload(fx("plain.rds"), name = "d12", overwrite = TRUE)

# Expected: the Loaded line first, then whatever the coded-missing scan has
# to say about undeclared codes (this frame's UDM cells are now plain NA, so
# the scan may well find nothing and print nothing).
#
# Things to look at:
#   - Loaded first, consistently, regardless of what follows it.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART C -- the S231 jrecode parity bundle: the convention error and the ----
#           mint
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# jrecode joined the sas convention at S231 (per-call "sas"; tag case
# canonicalized at the mint; the convention error's switch recipes made
# three-way; the S223 echo-back recipe defect closed). PART C shows the
# rewritten error surface and makes the mint-case rule visible in jfreq.
#
# Fixture note: PART C departs from the Preference-1 construction above
# DELIBERATELY. Its subject is what jrecode does to raw input, so the
# input is a five-line synthetic frame whose Expecteds can be exact;
# nothing here is derived state that could drift from package behaviour.

tw <- data.frame(Rating = c(1, 2, 3, -99, 2, 1, NA))


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 13 -- the convention error, standard tier ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Stata-style tokens under an spss SETTING. S246 changed this error's job.
# It used to teach both ways out, one of them by TRANSLATING the call into
# an SPSS-style rewrite; that echo-back is retired (Rule Y -- see Section 15
# for why). What remains states the mismatch and names the two ways out
# without writing anyone's codes for them. S244: the pin below was
# options(NULL) -- "pin the SPSS default" -- until the choose-first gate
# removed that default; under an unset setting these calls now gate
# (PART G shows that render).

options(.jst_options_missing_convention = "spss")   # pin spss (S244)

tryCatch(jrecode(tw, Rating, map = "1,2=1; 3=2; else=.a",
                 labels = "1=Low; 2=High; .a=Refused"),
         error = function(e) cat("Error: ", conditionMessage(e), "\n", sep = ""))

# S282: the SAME call with an UPPERCASE marker. Added to close the S268
# coverage gap -- until now no walk in the package typed one, so the S267
# switch-pair reorder had no visual witness anywhere and could have gone
# inert a second time without a walk noticing. (It went inert ONCE already:
# S267 shipped the rule keyed to a variable that is constant on this route,
# and only a workstation eye caught it. missing_convention_check.R N59a-c
# covers the order by character position; this is the render.)
tryCatch(jrecode(tw, Rating, map = "1,2=1; 3=2; else=.A",
                 labels = "1=Low; 2=High; .A=Refused"),
         error = function(e) cat("Error: ", conditionMessage(e), "\n", sep = ""))

# S283: the marker seen ONLY in labels. Until S283 jrecode stripped the
# labels parser's raw-spelling record at the parse, so a labels-only .B
# fell back to the display case in this head ('.b') and the pair could
# not follow its case. The record is now harvested before the strip.
tryCatch(jrecode(tw, Rating, map = "1,2=1; 3=2; else=copy",
                 labels = "1=Low; 2=High; .B=Refused"),
         error = function(e) cat("Error: ", conditionMessage(e), "\n", sep = ""))

# Expected, first call (verbatim):
#   Error: jrecode(): the map uses '.a', a missing-value marker.
#   Lettered markers can exist only under Stata or SAS convention, and your
#   missing.convention setting is "spss", which uses numeric codes.
#   To keep SPSS convention, restate the marker as a numeric code.
#   To switch conventions instead, run one of:
#     joptions(missing.convention = "stata")
#     joptions(missing.convention = "sas")
#
# Expected, second call (verbatim) -- IDENTICAL except the head's quoted
# marker and the ORDER of the two switch lines:
#   Error: jrecode(): the map uses '.A', a missing-value marker.
#   Lettered markers can exist only under Stata or SAS convention, and your
#   missing.convention setting is "spss", which uses numeric codes.
#   To keep SPSS convention, restate the marker as a numeric code.
#   To switch conventions instead, run one of:
#     joptions(missing.convention = "sas")
#     joptions(missing.convention = "stata")
#
# Expected, third call: the second render again, with '.B' in the head and
# sas first -- the labels-only marker now reads from the same raw channel
# as the map (S283; check N63a locks it, N63b locks that a labels-only
# lowercase .b still leads stata).
#
# (First two: sandbox-rendered against the v0.9.158 master at S282, at
# the pinned 76, then confirmed by the S282 workstation walk. Third:
# sandbox-rendered against the S283 master, confirmed by the S283 walk.)
#
# Things to look at, THE UPPERCASE BEAT specifically:
#   - PUT THE TWO SIDE BY SIDE. The only differences should be the quoted
#     marker and which joptions line comes first. If both renders list stata
#     first, the S267 rule has gone inert again and N59b should be red.
#   - The rule is "the user's own marker style leads", not "SAS is better":
#     someone who typed .A is already thinking in uppercase, so the option
#     matching what they typed sits where the eye lands. Read the second
#     render cold and judge whether the reorder is even noticeable -- if it
#     is not, that is arguably the rule working rather than failing.
#   - Mixed case (a map carrying both .a and .B) keeps the stata-first
#     default. Not rendered here; N59c asserts it.
#
# Things to look at, the error generally:
#   - The head is a pure QUOTE of the call (S245) -- no style word attached
#     to the token, because input case is accepted either way and labelling
#     a typed '.a' "SAS-style" equates two spellings a reader sees as
#     different. The surface-form contrast that carries the teaching
#     (lettered markers against numeric codes) sits in the second line,
#     which also names the SETTING rather than "the package".
#   - The third line is the S246 stay-put remedy. It states the REQUIREMENT
#     (Rule X's form) and stops: no rewritten map, no minted codes, no
#     follow-up declaration. Compare it against what the same call used to
#     print -- four more lines, two of them a runnable recipe -- and judge
#     whether anything a user needed went with them.
#   - The switch recipe is three-way and Rule L-form: colon intro, one
#     two-space-indented call per line, no trailing period.
#   - The two remedies are equal-standing (Rule D's carve-out): the message
#     names both and recommends neither, because which is right depends on
#     what the user meant. Does the pair read as a genuine choice, or does
#     the stay-put line read as the "real" answer with the switch as an
#     afterthought?


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 14 -- the same error, one form at every tier ----
# NEEDS: 13
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# joutput("minimal") prints its settings panel on the way in; the reset
# prints a one-line confirmation on the way out. Before S246 this section
# existed to show what minimal SHED -- the echo-back. Now that the echo-back
# is gone from every tier, the section shows the opposite property: the
# error is tier-independent, and this render should be BYTE-IDENTICAL to
# Section 13's.

joutput("minimal")

tryCatch(jrecode(tw, Rating, map = "1,2=1; 3=2; else=.a",
                 labels = "1=Low; 2=High; .a=Refused"),
         error = function(e) cat("Error: ", conditionMessage(e), "\n", sep = ""))

joutput(NULL)

# Expected (the error only; the joutput panels print around it):
#   Error: jrecode(): the map uses '.a', a missing-value marker.
#   Lettered markers can exist only under Stata or SAS convention, and your
#   missing.convention setting is "spss", which uses numeric codes.
#   To keep SPSS convention, restate the marker as a numeric code.
#   To switch conventions instead, run one of:
#     joptions(missing.convention = "stata")
#     joptions(missing.convention = "sas")
#
# Things to look at:
#   - Put this beside Section 13 and look for ANY difference. There should
#     be none. The tier gate went with the echo-back: what was once the
#     minimal-tier render, plus the stay-put line, is now the only render.
#   - The joutput panels still frame it, so the section still earns its
#     place -- it is the one beat that shows the panels around an error.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 14b -- the SAME error, phrased for a SAS user (S242, audit F2) ----
# NEEDS: 2, 3, 5, 6, 7, 8, 9
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Sections 13 and 14 above are DEFAULT-setting renders. This beat is the
# other side: the per-call route.
#
# Reachability matters here and is easy to get wrong: the resolver takes no
# column at this call site, so the ONLY route to an spss resolution under a
# sas setting is an explicit per-call convention = "spss". That is the
# configuration below -- a SAS user who pinned one call to SPSS.

joptions(missing.convention = "sas")

tryCatch(jrecode(tw, Rating, map = "1,2=1; 3=2; else=.a",
                 labels = "1=Low; 2=High; .a=Refused", convention = "spss"),
         error = function(e) cat("Error: ", conditionMessage(e), "\n", sep = ""))

# Expected (verbatim). The user typed '.a' and the message says '.a' (S245);
# the lead-in blames the CALL, not the setting; and the switch remedy is a
# call-level edit, since joptions() cannot outrank a per-call argument:
#   Error: jrecode(): the map uses '.a', a missing-value marker.
#   Lettered markers can exist only under Stata or SAS convention; they cannot
#   be combined with convention = "spss", which uses numeric codes.
#   To keep SPSS convention, restate the marker as a numeric code.
#   To switch conventions instead, change convention = "spss" on this call to
#   "stata" or "sas".

options(.jst_options_missing_convention = NULL)

# Things to look at:
#   - The token is quoted AS TYPED. Before S245 this line recased it to the
#     phrasing convention and showed '.A' -- a misread of a call that said
#     '.a'. That quote position survives S246 intact; it was the
#     PRESCRIPTIVE positions, which existed only inside the rewrite, that
#     went away.
#   - BOTH S242 non-conformities remain CLOSED here. (1) The lead-in names
#     the per-call argument that actually forced spss, not the setting.
#     (2) The stata-first switch menu is gone from this path entirely --
#     a menu whose entries could not work here, replaced by the one edit
#     that does.
#   - Only the SWITCH line forks by route; the stay-put line is the same
#     sentence on both paths, because restating markers as numeric codes is
#     the requirement either way. Check that the two lines still read as a
#     matched pair after the fork.
#   - The remaining question for the reader: the remedy offers "stata" or
#     "sas" without preferring the one this user's setting already names.
#     Steering it was considered at S245 and sent to the message-surface
#     mvbatch, to be decided across all four remedy sites at once. Judge
#     whether the unsteered pair grates here.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 15 -- why there is no rewrite (Rule Y, S246) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# This section used to show the CAP NOTE: five distinct tags against SPSS's
# three-code ceiling, the echo-back substituting pool codes for the first
# three and the note naming the two it could not place. All of that is
# retired, and this is the beat that shows why.
#
# THE DEFECT, found in the S245 walk read of this very section. The rewrite
# substituted codes from joptions("missing.convention.codes") -- a pool that
# knows nothing about the column. tw$Rating already contains -99. So:
#
#     map = "1=.a; 2=.b; else=copy"   on Rating = 1, 2, 3, -99, 2, 1, NA
#     old recipe handed back:  map = "1=-99; 2=-98; else=copy"
#     original:   1    2   3  -99    2    1   NA
#     recoded : -99  -98   3  -99  -98  -99   NA
#
# The cells that held 1 and the cells that held -99 are now the same value,
# irreversibly and with no warning -- and the paired jdeclare_missing then
# declared -99 missing, so whichever of them was valid data is gone. Rules
# apply against ORIGINAL values, so this is a target/source collision, not
# an ordering bug. Detecting it inside a message builder would have meant
# reimplementing jrecode's survival semantics there. Rule Y instead: a
# message may NAME values that already exist in the user's data or
# declaration, and may not MINT values the user never supplied.

options(.jst_options_missing_convention = "spss")   # pin spss (S244)

# The collision fixture -- the exact call above.
tryCatch(jrecode(tw, Rating, map = "1=.a; 2=.b; else=copy"),
         error = function(e) cat("Error: ", conditionMessage(e), "\n", sep = ""))

# And the old cap case: five tags against a three-code pool.
tryCatch(jrecode(tw, Rating, map = "1=.a; 2=.b; 3=.c; -99=.d; NA=.e"),
         error = function(e) cat("Error: ", conditionMessage(e), "\n", sep = ""))

# Expected (verbatim) -- BOTH calls print exactly this:
#   Error: jrecode(): the map uses '.a', a missing-value marker.
#   Lettered markers can exist only under Stata or SAS convention, and your
#   missing.convention setting is "spss", which uses numeric codes.
#   To keep SPSS convention, restate the markers as numeric codes.
#   To switch conventions instead, run one of:
#     joptions(missing.convention = "stata")
#     joptions(missing.convention = "sas")
#
# Things to look at:
#   - Two calls, one output. The two-marker case and the five-marker case
#     are now indistinguishable, because the cap arithmetic went with the
#     thing it capped. Nothing counts markers any more.
#   - The stay-put line goes PLURAL here ("the markers ... numeric codes")
#     where Sections 13 and 14b are singular. That is the only agreement
#     the message still makes.
#   - No number appears in either render that the user did not type. That
#     is the whole of Rule Y, visible: -99, -98 and -97 were the package's
#     idea, not the user's, and they are gone.
#   - The honest cost: a user who genuinely wanted the SPSS two-call
#     pattern must now find it in the help page rather than have it handed
#     over. Read the message once as that user and judge whether the
#     stay-put line points clearly enough at what to do next.
#   - Here the switch recipe is arguably the BETTER remedy (a tag
#     convention holds all five markers, where SPSS convention holds three).
#     Does the message leave that judgement findable without saying it?


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 16 -- the mint-case rule, seen: .a under stata, .A under sas ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The same call under the two tag conventions. Input tokens are matched
# case-insensitively; the case actually STORED follows the governing
# convention (lowercase Stata-style, uppercase SAS-style), and the tagged
# value label is re-minted to match -- a lowercase label against an
# uppercase cell would silently fail to display.

joptions(missing.convention = "stata", quiet = TRUE)
tw$RatingS <- jrecode(tw, Rating, map = "1,2=1; 3=2; -99=.a; else=copy",
                      labels = "1=Low; 2=High; .a=Refused")
jfreq(tw, RatingS)

joptions(missing.convention = "sas", quiet = TRUE)
tw$RatingA <- jrecode(tw, Rating, map = "1,2=1; 3=2; -99=.a; else=copy",
                      labels = "1=Low; 2=High; .a=Refused")
jfreq(tw, RatingA)

options(.jst_options_missing_convention = NULL)

# Expected: two structurally IDENTICAL jfreq tables whose only difference
# is the Missing row --
#   RatingS:   .a ["Refused"]     1    14.29       --      --
#   RatingA:   .A ["Refused"]     1    14.29       --      --
# with the System/NA row below it in both (the untouched NA cell).
#
# Things to look at:
#   - Same map token (.a) both times; only the ACTIVE CONVENTION changed
#     the stored case. That is the whole token case rule in one pair.
#   - The label "Refused" displays against BOTH cases -- the re-minted
#     labels-attachment half of the S231 mint rule at work.
#   - S287 RE-PIN. There is no Case Processing table under either title
#     now: with no pipeline step active, the S284 visibility rule (shipped
#     S286, v0.9.161) replaces the old two-row block with a one-line N
#     statement -- "7 Cases in the 1 Variable Pool" -- one blank line
#     below the title and one above the variable name. Every no-pipeline
#     jfreq in this file renders that way; the tables, and their "--"
#     empty cells (ASCII since v0.9.148, S261), now appear only under a
#     filter -- Section 44, Renders 2-5. (The pre-S287 bullet here pointed
#     at those cells; the S258 capture predates both the dash and the
#     assign-note <n> -> <name> rename, so it differs from a live render
#     in three ways, not one.)
#   - jrecode's assign-to-keep note prints even though these calls DID
#     assign -- the known S220 item (a function cannot see assignment),
#     open, not new.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART D -- the codes-table ordering guarantee (S233) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Sections 4-6 show the order HOLDING across columns, but they cannot prove
# it: those fixtures descend from community, whose codes happen to be
# declared in an order the sort would have produced anyway. A walk that only
# ever sees agreement cannot tell a guarantee from a coincidence. Section 17
# supplies the two inputs that used to disturb the order, so the section
# fails loudly if the sort is ever lost.
#
# The two inputs, and why each one mattered:
#   (1) DECLARATION ORDER. haven returns na_values in the order SPSS wrote
#       them, which is stable within a column and arbitrary across columns.
#   (2) ROW ORDER. The tagged-NA side built its code list from the order
#       tags first APPEAR IN THE CELLS, so re-sorting the rows of a data
#       frame could re-order the codes in its own load message.
# Both now sort at the source (.jst_missing_info), so all three surfaces
# that render a codes table -- this narrative, the CPS detail table, and
# jfreq's Missing block -- inherit one order and cannot disagree.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 17 -- order survives hostile declaration order and hostile row ----
#               order
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Hand-built with haven primitives, deliberately: the package will not mint
# an out-of-order declaration, and should not be taught to.

cw_sort_spss <- data.frame(
  Income = haven::labelled_spss(
    c(45000, -98, 52000, -99, 61000, -97),
    labels = stats::setNames(c(-98, -99, -97),
                             c("Don't know", "Refused", "Not applicable")),
    na_values = c(-98, -99, -97)),          # declared -98, -99, -97
  Score = haven::labelled_spss(
    c(7, -99, 8, -97, 9, -98),
    labels = stats::setNames(c(-98, -99, -97),
                             c("Don't know", "Refused", "Not applicable")),
    na_values = c(-97, -99, -98))           # declared -97, -99, -98
)

.tl <- stats::setNames(
  c(haven::tagged_na("a"), haven::tagged_na("b")),
  c("Refused", "Don't know"))
cw_sort_stata <- data.frame(
  Income = haven::labelled(                 # first tagged cell is .a
    c(45000, haven::tagged_na("a"), 52000, haven::tagged_na("b")), .tl),
  Education = haven::labelled(              # first tagged cell is .b
    c(3, haven::tagged_na("b"), 5, haven::tagged_na("a")), .tl)
)

jsave(cw_sort_spss,  fx("sort_spss.rds"),  overwrite = TRUE)
jsave(cw_sort_stata, fx("sort_stata.rds"), overwrite = TRUE)

options(.jst_missing_notice_shown = NULL)
jload(fx("sort_spss.rds"), name = "d17", overwrite = TRUE)

# Expected: BOTH columns ascending by value, despite being declared in two
# different and equally arbitrary orders:
#   2 variables have SPSS-style missing values:
#     Income: -99 ["Refused"], -98 ["Don't know"], -97 ["Not applicable"]
#     Score: -99 ["Refused"], -98 ["Don't know"], -97 ["Not applicable"]
#   jstats analyses treat these codes as missing. Base R functions do not.
#   To make them missing in base R as well, convert:
#     jconvert(d17, to = "stata", modify = TRUE)
#   (re-pinned S337 from a capture, with Section 4: a head line ending in
#   a colon, then the call on a line of its own)
#
# On the pre-S233 build this printed Income as -98, -99, -97 and Score as
# -97, -99, -98 -- three codes, two columns, two different orders, neither
# of them the value order. That is the regression this line catches.

options(.jst_missing_notice_shown = NULL)
jload(fx("sort_stata.rds"), name = "d18", overwrite = TRUE)

# Expected: both columns .a then .b, though their tagged cells appear in
# opposite orders in the data:
#   2 variables have Stata-style missing values:
#     Income: .a ["Refused"], .b ["Don't know"]
#     Education: .a ["Refused"], .b ["Don't know"]
#
# On the pre-S233 build Education printed .b ["Don't know"], .a ["Refused"]
# -- this is the exact pair caught by eye on the S231 walk.

juse(d17)
jfreq(Income)

# Expected: the Missing block in the SAME order as the narrative above --
#   Missing
#   -99 ["Refused"]           1     16.67      --       --
#   -98 ["Don't know"]        1     16.67      --       --
#   -97 ["Not applicable"]    1     16.67      --       --
#
# Things to look at:
#   - the narrative and the frequency table agree. They are rendered by
#     different code reading the same built table, so disagreement between
#     them is the failure mode the build-layer sort exists to prevent.
#   - jfreq's Missing block sorted ascending by value already (S220). The
#     S233 sort did not change that; it brought the OTHER two surfaces into
#     line with it. If jfreq is right and the narrative is wrong, the sort
#     has been lost at .jst_missing_info rather than at the render points.
#   - three codes, not two: two codes can agree by accident, three is
#     harder to get right by luck.

juse(NULL)
options(.jst_missing_notice_shown = NULL)

# S248: the session-state restore used to sit HERE, from when PART D was the
# last part. Four parts have been added below it since, each ending on a
# cleared convention slot, so a full run restored the entering value and then
# discarded it again -- the walk left the session tidier than it found it in
# the wrong direction. The restore now runs at the foot, after PART H.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Observations
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
# 2026-08-12, THIRD WALK (v0.9.129, S233; source() into a session still
# holding the second walk's objects). CONFIRMS THE ENTRY CLEANUP: Sections
# 1-3 reproduced the clean-session output exactly -- the joptions nudges
# named cw_spss / cw_mixed / cw_stata alone, with none of the previous
# run's d-frames or cw_decl leftovers -- so the file is now verified
# idempotent WITHIN a session, the one property the first two walks could
# not show. Everything downstream matched again. No findings.
#
# 2026-08-12, SECOND WALK (v0.9.129, S233; full source() run by Jeff, into
# a session still holding the first walk's objects). The corrected Smoker
# Expecteds matched in both blocks, PART D matched again, and the three
# deliberate errors printed and let execution carry on to the end marker --
# so the source()-safety claim in the RUN header is now tested rather than
# asserted. One finding:
#
#   - THE WALK WAS NOT IDEMPOTENT WITHIN A SESSION. Run into a session
#     still holding the first walk's objects, Sections 1-3 reported a crowd
#     of leftover frames and stopped matching. Nothing was wrong with the
#     package: the environment-scan notice is SUPPOSED to read the whole
#     environment, and it did, deterministically and in sorted order. The
#     gap was in this file -- it restored its options at the foot but never
#     its objects, so the second run started from a dirtier environment
#     than the first. Fixed by the entry-cleanup block at the top;
#     confirmed by the third walk above.
#     GENERAL LESSON: a section whose output depends on the ENVIRONMENT
#     rather than on its own fixtures is only reproducible if the file
#     controls the environment. Options hygiene is not enough on its own;
#     any future section that reads across frames needs the same treatment.
#
#   - Incidental confirmation: the frame lists in that notice are sorted
#     (cw_sort_spss, cw_spss, d1, d17, d2, d3, d6). The apparently
#     unsorted output on the first walk was three separate notices grouped
#     by style, not an ordering defect. No action.
#
# 2026-08-12, FIRST WALK (v0.9.129, S233; line-by-line by Jeff -- recorded
# here initially as a source() run; corrected). PACKAGE GREEN throughout --
# every section matched, and both S233 ordering guarantees held: Section
# 6's five columns rendered in one consistent order in both the Stata and
# SAS blocks, and Section 17's two hostile fixtures (codes declared out of
# value order; tagged cells in opposite first-appearance order) both
# rendered ascending, with jfreq's Missing block agreeing with the
# narrative. Two findings, BOTH in this file's Expecteds:
#
#   - SMOKER. The expanded Section 6 Expecteds claimed Smoker carried two
#     codes in both blocks. It carries one: community declares only -99 on
#     it, as Section 4's Expected -- unchanged, thirty lines above the edit
#     -- correctly showed. The Expecteds were written from the pattern of
#     the other four columns instead of read from the frame. Corrected.
#
#   - THE WALLPAPER RISK, CONFIRMED ON ITS FIRST OUTING. The previous
#     Observations entry raised it as a hypothetical: five near-identical
#     Expected lines might read as wallpaper a walker skims. That is
#     exactly what happened -- the one line that differed from the other
#     four went unremarked on the walk. The response is NOT to re-elide
#     (an elided Expected cannot catch an ordering defect, which is the
#     whole reason the block was expanded). It is to give the eye a
#     discriminating target: the block now says four columns match and
#     SMOKER DIFFERS, and marks that line. A check with one deliberate
#     asymmetry is performable; a column of identical lines is not.
#     GENERAL LESSON for future locking sections: an Expected that can
#     only be verified by reading N identical lines will not be verified.
#     Build the asymmetry in, or the check is decorative.
#
# Still open to judge on the next sitting:
#   - Section 17 states the pre-fix output in its Expected comments so a
#     future reader can see what the section is FOR. Judge whether that
#     helps or clutters; the same question arises for every
#     regression-locking section written from here on.
#
# 2026-08-12 (v0.9.127, S231; full walk by Jeff, PART A/B/C in one sitting).
# The S230-revised Expecteds for Sections 7/8/9 all rendered as revised
# (Rule L remedy blocks, wrapped headlines, modify = TRUE forms), the S230
# two-line Saved lines and the absent "Loading dN ..." lines confirmed, and
# PART C matched its Expecteds exactly. Two findings, both walk-side:
#   - SECTION 3 PLURAL DEMO printed no mismatch notice. Diagnosed to the
#     FIXTURE, not the code: declaring two Stata columns into a 3-SPSS/
#     2-Stata frame tips the whole-frame majority to Stata 4-3, so the
#     declared columns land in the majority and Decision 11 correctly stays
#     silent. Confirmed by mechanism (one-column conversion, 4-1, fires the
#     promised sentence). Fixture and Expected corrected in this file; the
#     silence itself examined at length with Jeff and CONFIRMED AS SHIPPED
#     (rationale now in Decision 11's Notes: the tool-is-the-proxy split
#     between jconvert and jdeclare_missing, minority/majority/tie landing,
#     constant fix cost, jsave as hard backstop).
#   - SECTION 4's rider line still carried the pre-S229 assignment form
#     (d1 <- jconvert(d1, ...)); the S230 Expected revision had scoped to
#     Sections 7/8/9 and missed it. Refreshed to the shipped
#     jconvert(d1, to = "stata", modify = TRUE) form. Section 5 was clean.
# Known-open items resurfaced as documented, not as news: the codes-table
# sort instability (Finding 3, still open; visible in d4/d5/d7/d8) and
# jrecode's assign-note-despite-assignment in Section 16 (the S220 item).
# <Free-form notes from the most recent walk: anything that looked off,
# wording worth an mv review, follow-ups. Dated entries, newest first.>
#
# 2026-08-21 (S240; first PART E walk, v0.9.133, workstation, echo run;
# after the same session's mv pass). All sections as designed, PART E's
# four new sections included, and the mv-pass wrapped renders' break
# points matched the refreshed Expecteds. The mixed-marker note fired
# and fell silent after its own remedy (Section 19's loop closed by
# pasting the note's own line). Section 12's bare Loaded line confirmed
# the coded-missing scan has nothing to find post-baseR. Pre-existing
# sections rendered identically to their verified baselines (the mv
# pass touched nothing outside its scope). Findings: none new.
# Recorded candidates, not defects: the builder's "matched largest
# magnitude first" sentence still exceeds width (its string untouched
# at S240, so Rule U's adopt-on-touch has not reached it); the Rule U
# atom regex does not protect undotted name = value pairs, so M4's
# wrap separates "map =" from its quoted value -- rule-conformant, a
# one-line regex refinement if it ever reads poorly in the field.
#
# 2026-08-11 (S230 closeout note; Expecteds revised, NOT a walk). Findings
# 1 and 2 from the v0.9.124 walk SHIPPED at S230 / v0.9.126: the Saved
# parenthetical has its own line (jsave only -- jload/jcopy deliberately
# unchanged) and the Loading line now fires only from 1 MB. Finding 3
# (codes-table sort) remains OPEN. Finding 4 (record correction) stands.
# The rider/headline break family also shipped (Rule U; see the revised
# Section 7-9 Expecteds). Next walk verifies at 0.9.126+.
#
# 2026-08-11 (first walk, v0.9.124; line-by-line then a source() re-run).
# All sections as designed. Findings, all ledgered to the S228 closeout:
#   - jsave's "Saved X to <path> (...)" line: the trailing parenthetical
#     (format, cases, variables) is the verification payload and gets
#     wrapped by long paths; wants its own line. Open sub-questions: does
#     jload's Loaded line follow; parens/indent; how many emitters share
#     the shape.
#   - "Loading dN ..." prints on EVERY non-package load (one emitter; only
#     the large-file suffix is gated at 15 MB). Redundant now that the
#     Loaded line leads (S227 D1) -- but the S205 rationale for the low
#     threshold (slow media) bears on any fix; mv-shaped.
#   - Codes-table display order is unstable after conversion to tagged NAs
#     (Income .a,.b vs Education .b,.a in one block; visible in d4/d5/d7/
#     d8). Deterministic sort requested.
#   - The S226 changelog recorded the widened choice error with "one of";
#     the live Rule A form has no "one of" and backticks the name.
#     Record correction, not a message change. (.jst_stop_arg's own roxygen
#     also still says "one of:" -- stale.)
#
# Standing questions this walk exists to re-ask (S226 two-verdicts rule --
# a re-walk answers "did anything change?" AND "does this still read
# right?"):
#   - Section 2: does the nudge still read right at every list length, and
#     in ls() order rather than an order we chose?
#   - Section 6: does the SAS/Stata pair read as two conventions or one?
#   - Section 7: does first-position read as endorsement despite the
#     equal-standing intent?
#   - Section 11: is designed silence legible as design?
# When a re-walk surfaces wording that no longer sits right, mv / mvbatch is
# the processing channel -- this walk is the sighting mechanism.



# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART E -- the jdeclare_missing parity surface (S240) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The S240 bundle closed the last worklist entry: jdeclare_missing's convention
# feed is the tag-case-refined $convention field, mint case runs through
# .jst_canonical_tag per column, and the gate messages phrase three-way.
# These sections eyeball the surface the way Sections 13-16 do jrecode's.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 18 -- jdeclare_missing mint case, seen: both tagged arms under ----
#               sas
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The conversion arm (numeric codes) and the labeling arm (tokens on a
# column that already carries markers), both under a sas setting. The
# notification header names the convention, and the body shows the case
# actually written.

joptions(missing.convention = "sas", quiet = TRUE)

we <- data.frame(Score = c(10, 20, -99, 30, -98))
we <- jdeclare_missing(we, Score, codes = c(-99, -98),
                   labels = "-99=Refused; -98=DK")
jfreq(we, Score)

we <- jdeclare_missing(we, Score, codes = c(Changed = ".a"))

options(.jst_options_missing_convention = NULL)

# Expected, first call: notification headed
#   "Declared and converted to SAS-style missing values on Score:"
# with body lines (RE-PINNED S339: one space before the parenthesis, where
# there were two -- the S220 item; PART L has the form)
#   .A ["Refused"] (from -99)
#   .B ["DK"] (from -98)
# and the jfreq Missing block showing .A / .B rows. Q6 ordering is the
# familiar largest-magnitude-first, letters just uppercase.
#
# Expected, second call: the lowercase TOKEN .a canonicalizes to the
# column's convention (the column votes sas at Level 1), so the header and
# body are
#   "Named SAS-style missing values on Score:"
#     .A is now "Changed" (was "Refused")
# and the label "Changed" lands on .A -- replacing "Refused", minting no
# lowercase duplicate.
#
# Things to look at:
#   - REWORDED S246. This branch used to read "Labeled SAS-style missing
#     values on Score:" over a body line of '.A ["Changed"]'. Both halves
#     misled: on an already-tagged column nothing is declared -- the cells
#     are already missing -- so the only act is naming a marker, and the
#     state form read as though something had happened to the values.
#     "Named" plus the pairing form says what changed. This is the one
#     branch whose body departs from the shared 'code ["label"]' shape,
#     deliberately: the other two list what was declared, this one reports
#     a renaming.
#   - FIXED S247, and the fix is visible right here: the '(was "Refused")'
#     tail is the replacement being announced. Until S247 this branch
#     dropped the old label in silence while the SPSS branch announced
#     exactly that kind of drop -- the asymmetry logged at S246. PART H
#     Section 39 shows this annotation alongside its three siblings; this
#     line is the same machinery met in passing, on a sas resolution.
#   - Are the two headers' style words ("SAS-style") reading naturally?
#   - The token case rule: you typed .a, the column got .A. Same rule
#     Section 16 shows for jrecode, now on the declaration side.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 19 -- the mixed-marker note, and the remedy closing it ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# A column that ARRIVED mixed (assembled outside jstats: one batch worked
# in a Stata workflow, one through a SAS-side process). The declaration
# completes -- the ambiguous column casts no vote and the per-call
# convention governs -- and the consequential note names the mix and the
# collapse remedy in this call's resolved convention. Running the remedy
# then collapses the column, and a re-declaration shows the note gone.

wm <- data.frame(id = 1:4)
wm$Fear <- haven::labelled(
  c(1, haven::tagged_na("a"), haven::tagged_na("B"), 2),
  labels = stats::setNames(c(haven::tagged_na("a"), haven::tagged_na("B")),
                           c("Refused", "NotAsked")))

wm <- jdeclare_missing(wm, Fear, codes = c(New = ".c"), convention = "stata")

# Expected: the declaration notification ("Named Stata-style missing
# values on Fear:" with the body line
# '.c is now "New" (not present in the data)' -- see the block below),
# then, BEFORE the durability reminder and a blank line off each
# (RE-PINNED S339, v0.9.213: the note followed the reminder until then;
# Section 50 has the reason):
#   Note: Fear carries both Stata-style (.a, .c) and SAS-style (.B)
#   missing-value markers.
#   To collapse them to one form:
#     jconvert(wm, to = "stata", vars = "Fear", modify = TRUE)
#
#   This call changes wm only if you assign the result:
#     wm <- jdeclare_missing(wm, Fear, ...)
# (Prose Rule-U wrapped; the remedy is a bare Rule L line -- no trailing
# period, pasteable verbatim. The .c the call just minted counts on the
# Stata side -- the census is the column's RESULTING state.)
#
# WORTH KNOWING while reading this one -- HALF FIXED S247. .c occurs in no
# CELL of Fear, before or after: the call added a label for a marker that is
# not in the data. Three consequences, and they have now come apart.
#   SETTLED. Forward-declaring is ALLOWED (Option A, S247), decided on
#   evidence rather than taste: haven accepts a label on a marker in no
#   cell, and it survives both a write_dta/read_dta and a
#   write_sav/read_sav(user_na = TRUE) round trip, so the structure is
#   legal three platforms deep. It is a dictionary operation, the exact
#   parallel of SPSS accepting VALUE LABELS for a value no case carries.
#   FIXED. The message now SAYS the marker is absent -- the
#   "(not present in the data)" tail above. When this section was written
#   it gave no sign at all.
#   STILL OPEN. The mixed-marker census below counts .c as a Stata-side
#   data marker when no cell carries it, and jfreq renders a '.c ["New"]'
#   row at frequency 0. Both are downstream of the census, not of this
#   message. The jfreq half turns on what SPSS FREQUENCIES does with a
#   labelled-but-absent value -- Jeff's question to answer. N43b in the
#   check file is the standing reproducer.

jconvert(wm, to = "stata", vars = "Fear", modify = TRUE)
wm <- jdeclare_missing(wm, Fear, codes = c(Late = ".d"), convention = "stata")

# Expected: jconvert reports the collapse (.B -> .b), and the second
# declaration's output carries NO mixed-marker note -- the note persists
# only while the condition does. Its body line is
# '.d is now "Late" (not present in the data)': .d is absent for the same
# reason .c was, so the annotation is expected here, not a symptom of the
# collapse.
#
# Things to look at:
#   - Is the note legible as a condition report rather than a scold?
#   - The remedy is pasteable as printed and actually closes the loop --
#     paste it and confirm.
#   - No joptions rider on the remedy line (deliberate: column-scoped
#     collapse, not a mixed-frame align -- the cleaned column resolves by
#     its own form at Level 1 thereafter).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 20 -- the three-way gates ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Three refusals in a row: the sign-off 2 conflict gate naming SAS-style
# on an uppercase column; the range gate on the same column; and the
# both-representations guard on an ambiguous column resolved spss.

wg <- data.frame(id = 1:4)
wg$Up <- haven::labelled(
  c(1, haven::tagged_na("A"), 2, haven::tagged_na("B")))
wg$Mix <- haven::labelled(
  c(1, haven::tagged_na("a"), haven::tagged_na("B"), 2))

try(jdeclare_missing(wg, Up, codes = -99, convention = "spss"))
try(jdeclare_missing(wg, Up, range = c(-99, -51)))

# S244: the third refusal needs an spss RESOLUTION to be reachable --
# pre-gate the unset default supplied it; now an unset call gates first
# (PART G Section 31), so the guard is reached through a set spss.
joptions(missing.convention = "spss", quiet = TRUE)
try(jdeclare_missing(wg, Mix, codes = -99))
options(.jst_options_missing_convention = NULL)

# S282: refusals 4-6, closing the S268 coverage gap the NOT EXERCISED note
# below identified. The three above all reach the mix guard through a
# RESOLVED spss (unset, or a set spss), which renders the fallback remedy.
# These reach it the other way -- convention = "spss" arriving PER CALL over
# a tagged SETTING -- which is the route where removing the argument is a
# genuine one-step fix, and the branch says so. Refusal 6 then shows what
# happens when the call is not clean enough to echo back.

options(.jst_options_missing_convention = "stata")
try(jdeclare_missing(wg, Mix, codes = -99, convention = "spss"))

options(.jst_options_missing_convention = "sas")
try(jdeclare_missing(wg, Mix, codes = -99, convention = "spss"))

try(jdeclare_missing(wg, Mix, codes = c(Refused = -99), convention = "spss"))
options(.jst_options_missing_convention = NULL)

# REWRITTEN S268. Two things happened to this block at once. All three
# refusals were re-pinned for S267 (below), and the block itself was
# converted out of the running-prose-with-"/"-breaks form into literal
# blocks like the rest of the file. That form is not cosmetic: Section
# 21's Expected was the only other block written that way, and it is
# precisely why the S258 capture diff walked straight past it while
# checking every other Expected in the file. One such block left in the
# file is one blind spot left in the file.
#
# Expected, refusal 1 -- the sign-off 2 conflict gate, under try():
#   Error : jdeclare_missing(): 'Up' already carries SAS-style missing values;
#   cannot use convention = "spss" here.
#   To follow the column's form, remove the argument:
#     jdeclare_missing(wg, Up, codes = c(-99))
#   Or convert the column first:
#     jconvert(wg, to = "spss", vars = "Up", modify = TRUE)
#
# S267 rebuilt the remedy. It was ONE prose sentence -- "Use jconvert()
# to convert the column first, or omit the convention argument." --
# naming two options and handing over neither. Both are now runnable
# Rule L lines under their own intros. The first is ECHO-RENDERED: the
# guard rebuilds your actual call minus the convention argument, which
# it can only do when the call is clean enough to echo (plain numeric
# codes, no names, no labels, no range). Supply labels or a named codes
# vector and that first remedy falls back to prose -- "To follow the
# column's form, remove the convention argument from the call." -- which
# is a second render this section does not exercise.
#
# Note also what LEFT: the old Expected opened "Column 'Up' already
# carries", and the builder has no "Column". S266 logged that prefix as
# an observation and took no action; it is retired here rather than
# carried a third time.
#
# Expected, refusal 2 -- the range gate on the same column:
#   Error : jdeclare_missing(): 'Up' carries SAS-style missing values; a
#   missing-value range exists only under SPSS convention.
#   To declare the range, convert the column to SPSS form first:
#     jconvert(wg, to = "spss", vars = "Up", modify = TRUE)
#
# The head is unchanged. The remedy sentence became an intro plus a
# runnable line -- the same S267 treatment as refusal 1, and the reason
# the two now read as siblings rather than as one terse refusal beside
# one helpful one.
#
# Expected, refusal 3 -- the both-representations guard:
#   Error : jdeclare_missing(): 'Mix' carries both Stata-style (.a-.z) and
#   SAS-style (.A-.Z) missing values, which SPSS convention cannot act on.
#   Set convention = "stata" or convention = "sas" on this call.
#
# S267 rewrote the head and left this remedy alone. It used to say the
# column "carries tagged missing values in both letter cases, which the
# resolved convention (SPSS) cannot act on" -- describing the MECHANISM
# (letter case) and the RESOLVER (a "resolved convention"), neither of
# which is the reader's vocabulary. It now names the two styles the way
# every other message in the family names them. The guard is otherwise
# the same one: it keeps an spss resolution from minting na_values
# BESIDE tagged cells (the both-representations state).
#
# BREAKS FROM THE S268 RUN. Refusals 1 and 2 wrap exactly as shown.
# Refusal 3 did NOT -- its head is TWO lines, not three: line 1 runs
# through "SAS-style" and line 2 carries the rest. Corrected above.
# That was the fifth of five mispredicted breaks in this pass, and it
# fits the pattern the header records: the guess broke earlier than the
# renderer does, every time.
#
# ONE further correction, not a wrap: the echoed call in refusal 1
# renders codes = c(-99), not codes = -99. The guard rebuilds the
# argument through the shared renderer, which emits the c() form even
# for a single code. Worth knowing before pinning any other echoed call
# by eye.
#
# SWEPT AT S282, having been logged here since S268: under try() the prefix
# renders "Error : " with a space, not "Error: ". That is try()'s own format
# for a call. = FALSE condition. Ten Expecteds across the file wrote the
# no-space form; all ten now carry the space. The sweep waited this long
# because it touches blocks no single pass had verified -- S282 earned it by
# putting the whole file through a workstation walk in the same session.
# The tryCatch blocks (Sections 13, 14, 14b, 16, and Section 1's "Caught: "
# beats) are DELIBERATELY untouched: they format the condition themselves
# and correctly show no space. If a future diff flags one, check which
# wrapper the call used before changing anything.
#
# Expected, refusal 4 -- per-call spss over a STATA setting:
#   Error : jdeclare_missing(): 'Mix' carries both Stata-style (.a-.z) and
#   SAS-style (.A-.Z) missing values, which SPSS convention cannot act on.
#   This call sets convention = "spss", but your missing.convention setting is
#   "stata". To use the setting, remove the argument:
#     jdeclare_missing(wg, Mix, codes = c(-99))
#
# Expected, refusal 5 -- the same, over a SAS setting. Byte-identical to
# refusal 4 except the setting token:
#   Error : jdeclare_missing(): 'Mix' carries both Stata-style (.a-.z) and
#   SAS-style (.A-.Z) missing values, which SPSS convention cannot act on.
#   This call sets convention = "spss", but your missing.convention setting is
#   "sas". To use the setting, remove the argument:
#     jdeclare_missing(wg, Mix, codes = c(-99))
#
# Expected, refusal 6 -- same setting, but a NAMED codes vector, so the
# guard cannot rebuild the call and the remedy falls back to prose. Note
# the last line replaces BOTH the intro and the echoed call:
#   Error : jdeclare_missing(): 'Mix' carries both Stata-style (.a-.z) and
#   SAS-style (.A-.Z) missing values, which SPSS convention cannot act on.
#   This call sets convention = "spss", but your missing.convention setting is
#   "sas". To use the setting, remove the convention argument from the call.
#
# WHAT THESE THREE ADD. The head is the same in all six refusals; what
# changes is the remedy, and it changes because the guard now knows WHY the
# spss resolution happened. Reached through a resolved spss (refusals 1-3),
# there is no argument to remove, so the message names the two conventions
# that can act on the column. Reached through a per-call override (4-6), the
# argument IS the problem and removing it is one edit. That distinction is
# what S267 built and what nothing in this file could see until now.
#
# (All three sandbox-rendered against the v0.9.158 master at S282, at the
# pinned 76, then confirmed by the S282 workstation walk.)
#
# Things to look at, REFUSALS 4-6 specifically:
#   - Refusal 4 against refusal 3. Same column, same guard, same head; two
#     different remedies. Does the pair read as one guard adapting to how
#     you got there, or as two messages that happen to share an opening?
#   - "To use the setting, remove the argument" states the CONSEQUENCE
#     first and the action second. Read it as someone who set convention =
#     "spss" on purpose: does it land as help, or as the package telling
#     them their explicit instruction was the mistake?
#   - Refusal 6 is the fallback, and the judgement is whether it loses
#     anything. Refusals 4 and 5 hand back a pasteable call; 6 describes the
#     edit in words. The reason is mechanical -- a named or labelled codes
#     vector cannot be re-rendered faithfully -- but the reader does not
#     know that. Does the prose form feel like a lesser answer?
#
# Things to look at, refusals 1-3:
#   - Does refusal 3 read as protective rather than obstructive? Its fix
#     line is the escape the skip ruling promised (per-call wins on an
#     ambiguous column -- for the conventions that can act on it).
#   - Refusals 1 and 2 now both hand over a jconvert() line naming the
#     single column via vars =. Read them back to back: does the pair
#     read as one guard family, or does the repetition read as padding?


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 21 -- the phrased refusals: Tier 3 under a sas setting ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The two hoisted refusals fire identically under every convention source;
# what the S240 pass changed is PHRASING -- token case, style word, and
# remedy targets follow the display-time convention (per-call, else a sas
# setting, else stata). Under a stata, spss, or unset session these render
# exactly as they always have.

joptions(missing.convention = "sas", quiet = TRUE)

wp <- data.frame(Plain = c(1, 2, 3, 4))
try(jdeclare_missing(wp, Plain, codes = ".a"))

ws <- data.frame(V = haven::labelled_spss(
  c(1, 2, -99, 3, -98),
  labels = stats::setNames(c(-99, -98), c("Refused", "DK")),
  na_values = c(-99, -98)))
try(jdeclare_missing(ws, V, codes = c(Refused = ".a", DK = ".b")))

options(.jst_options_missing_convention = NULL)

# Expected, first refusal (plain column), both sentences Rule-U wrapped:
#   "Error: jdeclare_missing(): 'Plain' has no lettered markers to label, so
#    SAS-style tokens (.A-.Z) cannot be applied here.
#    To turn numeric codes into tagged missings, use jrecode() (for example
#    map = "-99=.A", convention = "sas"); or declare the numbers directly with
#    codes = c(-99), convention = "sas"."
# S280 re-pin, first line only: "no tagged missing values to label" ->
# "no lettered markers to label" (the shipped string, source line ~23730;
# seen live at S271 and S278, rendered again at 76 in the S280 sandbox
# and confirmed by the S280 workstation walk, with the wrap unmoved -- the shorter clause leaves 71 columns on line
# one, not enough to pull "SAS-style" up). The irony the S271 item kept:
# the S258 note below explains that this block was rewritten out of
# running prose BECAUSE its old form hid it from the capture diff. It was
# transcribed then, and the source moved afterwards.
# S258: was recorded as running prose with "/" marking the breaks -- the only
# block in this file in that form, which is why it stayed invisible to the
# S258 capture diff while every other Expected was checked. Now a literal
# block like the rest, opener included, transcribed from the captured run.
# The remedies are GATE-READY: each suggested call carries its
# convention, so pasting it verbatim survives the unset state under the
# Decision 11 choose-first gate (shipped S244). (Wrap points fall between
# words, never inside a protected quoted token; exact break positions
# shift with the variable name's length.)
#
# Expected, second refusal (SPSS column). REWRITTEN S249. The call types
# lowercase tokens under a sas setting, so this render is where the two
# treatments meet in ONE message and the difference is visible:
#   "codes for V contains '.a', a missing-value marker, but V / carries
#   SPSS-style missing values (na_values: -99, -98)."
#   "To label the declared numeric codes, name them directly:"
#        jdeclare_missing(ws, V, codes = c(Refused = -99, DK = -98))
#   "The numeric codes above are V's declared missing values, matched
#   largest / magnitude first (the ordering jconvert() uses)."
#   "To use SAS-style markers instead, convert the column first:"
#        jconvert(ws, to = "sas", modify = TRUE)
#
# The QUOTED marker is '.a' -- the letter AS TYPED, not recased to the
# sas setting -- and carries NO convention style word ("a missing-value
# marker", never "a SAS-style missing-value marker"). The PRESCRIPTIVE
# tail is untouched: "SAS-style markers" and to = "sas" both follow the
# phrasing convention, because that line is meant to be pasted and has to
# run. Same split in the cap note when it fires: it echoes the typed
# spellings ("uses 3 markers (.a, .b, .c)") and names no style.
#
# Until S249 every token surface here followed the phrasing convention,
# so a user who typed '.a' was told their call contained '.A'. That is
# the regression this section catches. The S245 split it now follows was
# already settled for the jrecode sibling (Sections 13-15); what is new
# is applying it to a message that KEEPS its prescriptive positions --
# Rule Y retired jrecode's, so this is the only place both appear
# together.
#
# Also S249: the "matched largest magnitude first" sentence now WRAPS
# (Rule U, adopt-on-touch reached it when the builder was edited). It ran
# to 120 characters against the house 76 for every prior walk; no line in
# this render should now exceed 76. The opening line and the cap note
# were already Rule-U wrapped (S240 mv pass); the minimal tier splits per
# Rule E and carries its jconvert remedy as a bare indented Rule L line.
# The equivalent-call block's numeric substitution is unchanged (same Q6
# ordering).
#
# Things to look at:
#   - The head says '.a' and the tail says "SAS-style" and to = "sas".
#     Read the whole message straight through: does the pairing read as
#     deliberate -- here is what you wrote, here is what to run -- or as
#     the message contradicting itself two lines apart? This is the one
#     render in the package where a quoted token and a prescriptive token
#     of DIFFERENT case sit in the same message, so it is the place the
#     S245 split is either vindicated or found wanting.
#   - Rerun the same call with codes = c(Refused = ".A", DK = ".B") and
#     confirm the head flips to '.A' while the tail does not move.
#   - Do the phrased renders read as ONE message family with their
#     stata-side renders (run the same calls under a stata setting to
#     compare), or as a different voice?
#   - Is the longer gate-ready remedy in refusal 1 still scannable, or is
#     the added convention = clutter worth an mv pass?

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART F -- the S241 message-build bundle: the missing token and D1-D7 ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The S239-approved drafts, built. One fixture family serves the whole
# part: a plain column (the token's home case), an SPSS-declared column
# (the conflict, cap, and reuse cases), and a small frame for the D2/D6
# notes. Every Expected below is the APPROVED DRAFT with its Rule E/U
# build applied; wording deltas from the drafts are build-level judgment
# calls listed in the S241 delivery summary.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 22 -- the missing token: one map string, three conventions ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The token's core promise: the same map works under every setting, and
# what it mints is the setting's own missing form. Under spss the mint is
# CONFIRMED (the user cannot see from the call which number missing
# became); under stata/sas the user wrote missing and got missing, so
# nothing prints.

wf <- data.frame(Status = c(1, 2, 8, 2, 1, 8, NA))

# S244: the first call was run UNSET ("fallback (spss)") until the
# choose-first gate removed the fallback -- unset now draws the full
# menu (PART G Section 31). Pinning spss keeps this section about the
# one-map-three-conventions promise; the D4 note is unchanged.
joptions(missing.convention = "spss", quiet = TRUE)
wf$StatusR <- jrecode(wf, Status, map = "8=missing; else=copy")
jfreq(wf, StatusR)

joptions(missing.convention = "stata", quiet = TRUE)
wf$StatusS <- jrecode(wf, Status, map = "8=missing; else=copy")

joptions(missing.convention = "sas", quiet = TRUE)
wf$StatusA <- jrecode(wf, Status, map = "8=missing; else=copy")
jfreq(wf, StatusA)

options(.jst_options_missing_convention = NULL)
wf$StatusR <- NULL; wf$StatusS <- NULL; wf$StatusA <- NULL

# Expected, first call (D4, the fresh-declaration variant), the note as it
# renders at 76:
#   Note: -99 was used for missing, from the missing.convention.codes default,
#   and declared as a missing value on the recoded variable.
# (the draft's "on StatusR" placeholder renders as "the recoded variable"
# -- jrecode cannot see the assignment target), then the no-labels hint
# and the assign-or-lose reminder. The jfreq Missing block shows -99 as a
# DECLARED code: the declaration rode in with the mint.
# S280 RE-PIN. The pre-S280 text read "from your missing.convention.codes
# setting", which is the OTHER branch: S267 split the clause on whether
# the codes slot was ever set (NULL -> "the ... default"; set -> "your ...
# setting"), and nothing in this file had ever set it, so every run drew
# "the default" -- seen at S271 and S278, and the reason the beat below
# exists. Also now a literal block with its break, sandbox-rendered
# against v0.9.157 at the pin and confirmed by the S280 workstation
# walk; it was a verbatim draft quote before.
#
# Expected, second and third calls: NO token note at all -- the stata
# mint is .a, the sas mint is .A (check the jfreq on StatusA shows the
# uppercase marker), and in both cases the user wrote missing and got
# missing. The asymmetry is the point: only the spss arm chose a number
# on the user's behalf.

# S280: the OTHER branch of the provenance clause. The split is keyed on
# whether the slot is NULL, not on its value, so setting it to the default
# values changes the clause and nothing else -- the minted number, the
# wrap and the two riders all stay put, which is what makes the two
# renders comparable line for line. Before this beat no section set the
# codes slot, so the "your setting" branch had no witness in this file
# and the pin above could not have failed had the split been broken.
joptions(missing.convention = "spss",
         missing.convention.codes = c(-99, -98, -97), quiet = TRUE)
wf$StatusR <- jrecode(wf, Status, map = "8=missing; else=copy")

options(.jst_options_missing_convention = NULL)
options(.jst_options_missing_convention_codes = NULL)
wf$StatusR <- NULL

# Expected: the same note with the clause flipped, and nothing else moved:
#   Note: -99 was used for missing, from your missing.convention.codes setting,
#   and declared as a missing value on the recoded variable.
# (sandbox-rendered against v0.9.157 at the pin, S280, then confirmed by
# the S280 workstation walk.) Note the restore: the codes slot goes back to NULL
# here, and the foot restores the ENTERING value, because Section 24's
# reuse note pins "the default" and would otherwise flip.
#
# Things to look at:
#   - Does the one-map-three-conventions promise FEEL like one promise,
#     or do the three outputs read as three different features?
#   - The two provenance renders, read back to back. "your setting" is
#     now reserved for a slot the user actually touched -- here touched
#     with the default values, which is the edge: is "your setting" still
#     the right word for a choice that changed nothing? S267 decided the
#     possessive claims an ACT, not a difference, so yes -- judge whether
#     that reads as intended or as the package overstating what you did.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 23 -- the D7 teach-gate: set-but-contradicted, and both escapes ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The one configuration where following the setting would contradict the
# user's own data: an explicitly chosen setting against a column already
# carrying the other form. The token errs rather than guessing; a
# per-call convention is the user answering the question.

wc <- data.frame(Status = haven::labelled_spss(c(1, 2, 8, 2, 1, 8, NA),
                                               na_values = -99))
joptions(missing.convention = "stata", quiet = TRUE)

try(wc$StatusR <- jrecode(wc, Status, map = "8=missing; else=copy"))

wc$StatusR <- jrecode(wc, Status, map = "8=missing; else=copy",
                      convention = "spss")

options(.jst_options_missing_convention = NULL)
wc$StatusR <- NULL

# Expected, first call (D7, verbatim to the draft):
#   "Error: jrecode(): 'missing' is ambiguous for Status. The column uses
#    SPSS-style missing values, but your missing.convention setting is "stata".
#    To follow the column's form for this call:
#      wc$StatusR <- jrecode(wc, Status, map = "8=missing; else=copy", convention = "spss")
#    Or convert the data frame to match your setting first:
#      jconvert(wc, to = "stata", modify = TRUE)"
# The head wraps at width; both recipes are bare Rule L lines, the first
# echoing the user's own map through the shared renderer.
#
# RE-PINNED S268 for S267. The setting is now reported as the QUOTED
# TOKEN -- "stata" -- not as the style label "Stata-style". The rule the
# change enforces: a style label ("Stata-style") describes DATA, and a
# quoted token ("stata") is what you TYPE. This sentence is about the
# setting, so it shows the token. Note the same sentence still says
# "SPSS-style missing values" of the column two lines up, and that is
# correct, not an inconsistency -- the column is data, the setting is a
# value you set. Reading the head straight through is the fastest way to
# see whether the distinction carries or just looks like drift.
#
# BREAK CORRECTED from the S268 run. The pull-up did happen, and by
# more than predicted: the head is TWO lines, not three -- "setting is
# \"stata\"." all rides on line 2.
#
# Expected, second call: the per-call escape RUNS, and because the mint
# (-99) is the column's own declaration, the note fires in its
# already-declared variant (Section 24 shows it on its own).
#
# Things to look at:
#   - Is the error teaching the two-lane model (column form vs setting),
#     or does it read as bureaucracy? This is the migrant's first
#     contact with the gate.
#   - The first recipe pastes and runs as-is. Paste it.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 24 -- benign reuse and the D3 cap ----
# NEEDS: 23
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The two spss-arm edges. Reuse: the mint is the user's own declaration,
# so the note reports a carry, not a fourth code. Cap: three surviving
# declarations plus a new mint would breach SPSS's limit, so the call
# stops with the two remedies.

joptions(missing.convention = "spss", quiet = TRUE)

wc$StatusR <- jrecode(wc, Status, map = "8=missing; else=copy")

wd <- data.frame(Income = haven::labelled_spss(c(100, 200, 8, 300, 8, 150),
                                               na_values = c(-1, -2, -3)))
try(wd$IncomeR <- jrecode(wd, Income, map = "8=missing; else=copy"))

options(.jst_options_missing_convention = NULL)
wc$StatusR <- NULL

# Expected, first call (D4, already-declared variant, verbatim):
#   "Note: -99 was used for missing, from the missing.convention.codes default.
#    Status already declares -99 as a missing value, so the recoded variable
#    carries the existing declaration."
# (S280 re-pin of the first line's clause, "your ... setting" -> "the ...
# default": the same S267 branch as Section 22, and the same reason --
# the codes slot is NULL here. The two sentences are separate wrap
# passes, so the first stands alone on its line either way; rendered at
# the pin against v0.9.157 in the S280 sandbox and confirmed by the S280
# workstation walk, matching S271/S278.)
#
# Expected, second call (D3, verbatim to the draft):
#   "Error: jrecode(): Income already declares 3 SPSS-style missing values (-1,
#    -2, -3), the maximum SPSS allows. 'missing' would add -99 as a fourth.
#    Use one of the declared codes instead:
#      wd$IncomeR <- jrecode(wd, Income, map = "8=-1; else=copy")
#    Or re-declare Income with fewer codes first:
#      jdeclare_missing(wd, Income, codes = c(-1, -2), modify = TRUE)"
# The first remedy's map is the user's own map with missing swapped for
# the first surviving code; running it carries the -1 declaration onto
# the result (the declared-target carry, new this session).
#
# Things to look at:
#   - Reuse note: does "carries the existing declaration" land as
#     reassurance (nothing doubled) rather than as an extra step?
#   - Cap error: are the two remedies genuinely equal-standing to your
#     eye, or does the first read as the recommendation?


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 25 -- NA=missing, and labels missing= ----
# NEEDS: 22
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The token composes with the NA rule (plain NA cells to the convention's
# missing form -- the E11 two-step collapsed into one) and with the
# labels argument (label whatever the token minted). S244: pinned spss
# (Sections 25-26 used to inherit the unset fallback from Section 24's
# reset; unset now gates). Section 27 sets its own convention on its
# way in (S258; it used to reset to NULL).

joptions(missing.convention = "spss", quiet = TRUE)

wf$StatusR <- jrecode(wf, Status, map = "NA=missing; else=copy")

wf$StatusL <- jrecode(wf, Status, map = "8=missing; else=copy",
                      labels = "missing=Refused")
jfreq(wf, StatusL)

try(wf$StatusX <- jrecode(wf, Status, map = "8=7; else=copy",
                          labels = "missing=Refused"))

wf$StatusR <- NULL; wf$StatusL <- NULL

# Expected, first call: D4 fresh-declaration note ONLY -- the old row-4
# note (since S303, "Or declare -99 as missing on the recoded variable:"
# over a recode-then-declare pair) does NOT print: the token already
# declared, so prescribing the declaration would be a step behind. The NA
# cell now holds a declared -99. (Wording updated S268 for the S267 tail
# change and S303 for the pair; the claim is about an ABSENCE, so nothing
# here was ever rendered -- it is quoted so a reader knows what to look
# for not finding.)
#
# Expected, second call: D4, and the jfreq Missing block shows
#   -99 ["Refused"]
# -- the labels entry landed on the minted code.
#
# Expected, third call (the no-target refusal):
#   "Error: jrecode(): labels names missing, but the map has no target for
#    it to label.
#    Add missing to the map (for example 8=missing), or label the value directly."
# S258: the Expected had carried "no missing target" since before the S24x
# reword -- the shipped message says "no target", which is what check N38a
# locks positively. Found by the capture diff, not by any run.
#
# Things to look at:
#   - NA=missing vs the old NA=-98-then-declare two-step: is the
#     one-step form what you would now teach in the guides?
#   - The refusal's example (8=missing): generic enough, or should it
#     echo the user's own first rule?


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 26 -- jencode: the token on a fresh column, and blank=missing ----
# NEEDS: 25
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# jencode inherits the token from the shared reader. No conflict gate and
# no cap (the column is built from scratch); the word routed to missing
# becomes the mint's value label, and blank=missing composes the two
# taught tokens.

wt <- data.frame(Answer = c("Yes", "No", "Refused", "Yes", "", NA, "No"),
                 stringsAsFactors = FALSE)

wt$AnswerR <- jencode(wt, Answer,
                      map = "Yes=1; No=0; Refused=missing; blank=9")
jfreq(wt, AnswerR)

wt$AnswerB <- jencode(wt, Answer,
                      map = "Yes=1; No=0; Refused=2; blank=missing")

wt$AnswerR <- NULL; wt$AnswerB <- NULL

# Expected, first call: D4 in jencode's own voice --
#   "... declared as a missing value on the encoded variable."
# -- and the jfreq Missing block shows -99 ["Refused"]: the word rode
# onto the mint as its label, the SPSS idiom for free. (The blank=9 mint
# may also draw the D1-parallel note when the magnitude heuristic flags
# 9 against the 0/1 codes; if it does, its recipe now leads with the
# token, Section 27's shape.)
#
# Expected, second call: the blank cell lands on a declared -99;
# blank=missing composes with no special casing.
#
# Things to look at:
#   - "encoded variable" vs "recoded variable": does the verb switch
#     read as the same note in two homes?
#   - Refused-as-label-on--99: check this against your SPSS instincts.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 27 -- the D1 mint note: token-first, in both homes ----
# NEEDS: 26
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The row-5 gap, closed: a plain numeric target that LOOKS like a coded
# missing value now draws the note, and its first remedy is the token --
# the user's own map echoed with the flagged target swapped.

# S258: a convention must be SET for this section to show what it is for.
# Run unset, both calls take the D1 note's unset branch and print the whole
# choose-first menu ahead of the remedy -- which is Section 42's beat, and
# it buries the token-first ordering this section exists to demonstrate.
joptions(missing.convention = "stata", quiet = TRUE)
wf$StatusM <- jrecode(wf, Status, map = "8=-99; else=copy")

wt$AnswerM <- jencode(wt, Answer,
                      map = "Yes=1; No=0; Refused=-99; blank=9")

wf$StatusM <- NULL; wt$AnswerM <- NULL
options(.jst_options_missing_convention = NULL)

# Expected, first call (D1, the set branch):
#   "Note: 8 was recoded to -99, which looks like a coded missing value.
#    To make the value missing under Stata convention, map it directly:
#      wf$StatusR <- jrecode(wf, Status, map = "8=missing; else=copy")
#    Or declare -99 as missing on the recoded variable:
#      wf$StatusR <- jrecode(wf, Status, map = "8=-99; else=copy")
#      jdeclare_missing(wf, StatusR, codes = c(-99), modify = TRUE)"
#
# RE-PINNED S303: the tail (below) and the lead line's "Stata-style
# convention", which had been stale since S267 dropped "-style" there.
# The tail is the S303 fix. The S267 form declared -99 on Status -- a
# column that holds no -99 -- so pasting it left StatusM's -99 a real
# value. The pair recodes into StatusR and declares on StatusR; it names
# only what it creates, so it runs whatever the user called their own
# column (this call named it StatusM). Rule S (S229 corollary): a
# suggested call teaches modify = TRUE alone.
#
# RE-PINNED S268 for S267: the D1 tail, the same change Section 42
# carries in both its branches -- the call-less pointer replaced by an
# intro and a pasteable call. This is the THIRD D1 render in the file
# and the one the S268 divergence pass initially missed: the pass went
# looking for the gate menu, and this render is a SET branch, so it has
# no menu in it. It was caught by a residual-string sweep of the
# repaired file afterwards. Worth remembering the shape of that miss --
# scoping the search to the construct rather than to the string.
#
# The S258 confirmation below still stands for everything except the
# tail: both calls take the set branch and the token remedy leads.
# CONFIRMED (S258) by a second run made after the convention change: both
# calls take the set branch, the token remedy leads, and the jencode
# parallel does the same in its own call shape.
#
# Expected, second call: the jencode parallel -- the S238 pairs head
# ('"Refused" was encoded as -99, ...') unchanged, then the same
# token-first remedy with jencode's own call shape and AnswerR naming.
# The tail moved there too (the builders are twins). Since S303 it reads:
#    Or declare -99 as missing on the encoded variable:
#      wt$AnswerR <- jencode(wt, Answer, map = "Yes=1; No=0; Refused=-99; blank=9")
#      jdeclare_missing(wt, AnswerR, codes = c(-99), modify = TRUE)
# Before S303 the second line was a jdeclare_missing() on Answer, the
# TEXT source -- a call that stops with an error, since a text column
# cannot carry a missing-value code.
#
# Things to look at:
#   - The recipe is the user's map with ONE substitution. Diff them by
#     eye: is the edit obvious?
#   - Order of remedies: token (changes the map) before jdeclare_missing
#     (keeps the map). Right way round?
#   - S258 replaced the bullet that used to sit here. It justified running
#     this section UNSET on the ground that pasting the remedy as printed
#     would land on the choose-first gate -- a second guided step rather
#     than a dead end. S250 retired that experience by teaching the choice
#     INLINE, so the reason had lapsed while the unset run remained; the
#     Expected here had been wrong since S244 and no run caught it, because
#     these blocks were never diffed against output until S258. Whether
#     D1's remedy should carry a convention rider still belongs to the
#     held-out remedy-string sweep.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 28 -- jdeclare_missing's D2 override note ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Resolver level 1 (the column's own form) beating an EXPLICITLY SET
# level 3. The declaration proceeds -- the column wins by design -- and
# the note names the mismatch with both remedies, every call.

ws <- data.frame(Income = haven::labelled_spss(c(100, 200, -99, 300),
                                               na_values = -99),
                 Age = c(30, 40, 50, 60))
joptions(missing.convention = "stata", quiet = TRUE)

ws <- jdeclare_missing(ws, Income, codes = c(Refused = -99, DK = -98))

options(.jst_options_missing_convention = NULL)

ws <- jdeclare_missing(ws, Income, codes = c(-99, -98))

# Expected, first call: the normal notification block, then a blank line
# (Rule F), then D2 (verbatim to the draft):
#   "Note: Income uses SPSS-style missing values, but your missing.convention
#    setting is "stata".
#    To convert the data frame, run:
#      jconvert(ws, to = "stata", modify = TRUE)
#    To keep SPSS-style instead, change the setting:
#      joptions(missing.convention = "spss")"
#
# RE-PINNED S268 for S267, the same change as D7 in Section 23: the
# setting reports as the quoted token "stata", not the style label
# "Stata-style". Both remedies are untouched. Worth reading D2 and D7
# side by side after the run -- S267 harmonized them deliberately, and
# this pair is where that either shows or does not.
#
# BREAK CORRECTED from the S268 run: line 1 runs through
# "missing.convention" and "setting" opens line 2 -- the same shape
# Sections 7 and 9 turned out to have. Three sites, one wrap pattern.
#
# Expected, second call: NO D2 -- the unset default has made no claim,
# so there is nothing to override. (A per-call convention likewise
# silences it: the user answered the question in the call.)
# Its body lines (RE-PINNED S339, v0.9.213): the codes were typed bare, and
# the labels the first call set are shown, because the variable kept them
# (Section 47); no case holds -98, in either call:
#   Declared SPSS-style missing values on Income:
#     -99 ["Refused"]
#     -98 ["DK"] (not present in the data)
# Until 0.9.213 the second call printed "-99" and "-98".
#
# Things to look at:
#   - D2 fires EVERY call under the mismatch, by ruling. Run the first
#     call twice: is the repetition informative or nagging? (The ruling
#     took each declaration as a deliberate choice; this is the check on
#     that judgment.)
#   - The two remedies are the R1/R2 sibling shape. When the mv pass
#     reaches R1/R2, these lines are the target form.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 29 -- jlogistic's D5: the two-remedy DV error ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The suspected-code DV, redrafted: the declaration route FIRST (Step 0
# masks declared UDMs on the analysis copy, so the very same jlogistic
# call runs after it), the destructive jrecode second, its consequence
# named.

wl <- data.frame(Reinc = c(rep(0, 20), rep(1, 20), rep(-99, 5)),
                 Age   = rnorm(45, 40, 8))
try(jlogistic(Reinc ~ Age, data = wl))

# Expected (verbatim to the draft, Rule E splits applied):
#   "Error: jlogistic(): Reinc has 3 unique values (-99, 0, 1).
#    The dependent variable must have exactly 2 categories coded 0/1.
#    -99 looks like a coded missing value.
#    Declare it so analyses exclude it:
#      jdeclare_missing(wl, Reinc, codes = -99, modify = TRUE)
#    Or convert it to NA, dropping the code:
#      wl$ReincR <- jrecode(wl, Reinc, map = "-99=NA; else=copy")"
#
# Things to look at:
#   - Paste the FIRST remedy, then rerun the identical jlogistic call.
#     It should now fit. That round trip is the whole argument for
#     declare-first.
#   - The old wording hedged ("may be coded missing value(s)"); the new
#     one commits ("looks like"). Comfortable?


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 30 -- jsave's D6 release note ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The release boundary: an undeclared suspicious code written to a
# declaration-carrying format, reported once, when the frame's own
# metadata supplies the evidence -- and silent in every configuration
# where the evidence is absent.

wv <- data.frame(
  Income    = haven::labelled_spss(c(100, 200, -99, 300, 150, 210),
                                   na_values = -99),
  Education = c(12, 16, -99, 14, 12, 18),
  Age       = c(30, 40, 50, 60, 35, 45))

jsave(wv, file.path(tempdir(), "wv.sav"), overwrite = TRUE)

jsave(wv[, c("Education", "Age")], file.path(tempdir(), "wv2.sav"),
      overwrite = TRUE)

jsave(wv, file.path(tempdir(), "wv.csv"), overwrite = TRUE)

# Expected, first call (D6, verbatim to the draft):
#   "Note: -99 in Education is not declared as missing, though another column in
#    wv declares SPSS-style missing values.
#    It was written to the file as an ordinary value, so other software will read
#    it as valid data.
#    To declare it and save again, run both:
#      jdeclare_missing(wv, Education, codes = -99, modify = TRUE)
#      jsave(wv, "<normalized path>/wv.sav", overwrite = TRUE)"
# then the Saved confirmation. The resave line's path is the NORMALIZED
# forward-slash form -- the same string the Saved line prints -- never
# the raw file argument (the first workstation walk caught the raw
# Windows echo as a parse error on paste; fixed same-session). With one
# evidence column the head says "another column ... declares"; the
# draft's "other columns ... declare" appears from two evidence columns
# up.
#
# Expected, second call: SILENT except the Saved line -- the frame
# declares nothing, so the stray is a pure guess and jload's narrative
# owns it on the way back in.
#
# Expected, third call: the CSV label-loss note only -- no D6 on a
# format with no declaration slot.
#
# Things to look at:
#   - The resave line echoes the NORMALIZED absolute path, so it pastes
#     and runs from any working directory -- but a deep real path will
#     stretch that Rule L line. Acceptable, or should the mv pass
#     consider a shorter echo?
#   - Run the first call TWICE in a row: the note repeats (jsave is
#     stateless by design). Informative or nagging at the second firing?

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART G -- the Decision 11 choose-first gate (S244) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Step (4) of Decision 11, decided INERT at S240, texts approved S243,
# built S244: with no missing-value convention selected anywhere, a
# MINTING act stops and asks instead of silently defaulting to spss.
# Renders are stateless (identical every firing) and single-form across
# joutput tiers. Variants are assigned per SPELLING by the
# paste-and-rerun test (Rule V): every line the gate offers, pasted and
# rerun, must produce a sensible next state. The sections below show
# each render live and then RUN the offered remedies.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 31 -- variant A: the full three-option menu ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The spellings legal under all three conventions: the missing token
# (both homes, both map forms) and jdeclare_missing's numeric codes. The
# recommendation lives in the menu COPY (the stata consequence line),
# never as a separate steering sentence; the permanence line states the
# action itself (.Rprofile), not a nag.

options(.jst_options_missing_convention = NULL)
gw <- data.frame(Status = c(1, 2, 8, 2, 1, 8, NA))

try(gw$StatusR <- jrecode(gw, Status, map = "8=missing; else=copy"))

try(jdeclare_missing(gw, Status, codes = -99))

# Expected, first call (verbatim):
#   Error : jrecode(): no missing-value convention is selected, so the 'missing'
#   target cannot be applied.
#   Choose one for this session:
#     joptions(missing.convention = "stata")
#         Lowercase markers behave as true NAs in base R.
#         Recommended if you also run base R or AI-generated code.
#     joptions(missing.convention = "spss")
#         Codes stay visible numbers; jstats treats them as missing.
#         Base R does not.
#     joptions(missing.convention = "sas")
#         Like Stata, with uppercase markers (.A-.Z).
#   To make the choice permanent, put the same line in your .Rprofile.
#
# RE-PINNED S268 for S267. Both the stata and the spss descriptor were
# rewritten; the sas line is untouched. The rewrite is not a wording
# preference -- it fixes a real defect. Each descriptor is now built as
# TWO separate .jst_wrap_indent() calls joined by a newline, so the
# break you see above is STRUCTURAL and fires at every width. Before
# S267 each was one wrapped sentence, and the wrapper could sever the
# locked term "base R" across the break (short_tail rescues only
# sub-10-column or single-word tails, and "base R." is neither). This
# menu is a migrant's first contact with the package, so it was the
# worst possible place for it. The S267 pair is sever-swept clean across
# widths 40 to 120.
#
# Consequence for reading this block: the two descriptor lines should
# NOT reflow when you change the console width. Resize and rerun -- if
# either one re-wraps into a different shape, the pre-breaking has been
# lost. That is the property worth checking here, more than the words.
#
# Supersedes the S251 re-pin (the S250 Rule H edit, ", as in SPSS"
# dropped because the option line above already names the convention);
# that change survives inside the current text.
#
# Expected, second call: the SAME menu under the jdeclare_missing prefix with
# the codes head -- "no missing-value convention is selected, so these
# codes cannot be declared." The labels-only numeric form
# (labels = "-99=Refused") and jencode's token spellings draw the same
# render; NA=missing likewise.
#
# Things to look at:
#   - Paste each of the three joptions lines in turn and rerun the first
#     call: all three unblock it, each minting its own form (-99 / .a /
#     .A). The menu's promise IS the paste-and-rerun property.
#   - Does the recommendation-in-copy read as advice or as a default in
#     disguise? The S240 ruling wanted the former.
#   - The spss consequence line ends on a SHORT last row ("R does not.",
#     11 columns inside the indent). Not a wrap regression: the S257
#     pull-back condition rescues only sub-10-column or single-word tails,
#     and this tail is three words. (This bullet used to describe the
#     OPPOSITE shape -- a short FIRST row from the S251-era min_last = 20
#     pull-back; the S257 rework changed the render and S258 re-pinned the
#     Expected above, but the explanation lagged until S266.) The cost
#     worth seeing: the break splits the term "base R" across two rows --
#     logged S266 as a message-pass candidate, not fixed here.
#   - The head names the blocked ACT ('missing' target / these codes),
#     not just "no convention": is that specificity earning its words?

options(.jst_options_missing_convention = NULL)
gw$StatusR <- NULL


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 32 -- variant B: the stata/sas pair ----
# NEEDS: 31
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Literal tagged spellings. The spss option line is OMITTED: pasting
# joptions(missing.convention = "spss") and rerunning a '.a' map lands
# on the convention error -- a fail under the paste-and-rerun test -- so
# the menu never offers it. The head echoes the user's own first marker.

try(gw$StatusR <- jrecode(gw, Status, map = "1,2=1; else=.a"))

try(gw$StatusL <- jrecode(gw, Status, map = "1,2=1; else=copy",
                          labels = "1=Low; .b=Refused"))

gmix <- data.frame(z = haven::labelled(
  c(1, haven::tagged_na("a"), haven::tagged_na("B"), 2)))
try(jdeclare_missing(gmix, z, codes = c(Refused = ".a")))

# S283: the same three routes with UPPERCASE markers, plus jencode. The
# gate had been echoing a typed .A as '.a' -- it read the parser-
# normalized letter, not the typed spelling the spss-conflict refusal
# (Section 13) already quoted correctly (S282 finding; the S267 pattern
# of keying a message to a variable that is normalized by the time the
# builder sees it). Now all three homes quote as typed; checks N42e-h.
try(gw$StatusR <- jrecode(gw, Status, map = "1,2=1; else=.A"))
try(gw$StatusL <- jrecode(gw, Status, map = "1,2=1; else=copy",
                          labels = "1=Low; .B=Refused"))
try(jdeclare_missing(gmix, z, codes = c(Refused = ".A")))
gwt <- data.frame(Answer = c("Yes", "No", "Refused", "Yes"))
try(jencode(gwt, Answer, map = "Yes=1; No=0; Refused=.A"))

# Expected, first call (verbatim):
#   Error : jrecode(): no missing-value convention is selected, so the '.a'
#   marker cannot be applied.
#   Choose one for this session:
#     joptions(missing.convention = "stata")
#         Lowercase markers behave as true NAs in base R.
#         Recommended if you also run base R or AI-generated code.
#     joptions(missing.convention = "sas")
#         Like Stata, with uppercase markers (.A-.Z).
#   To make the choice permanent, put the same line in your .Rprofile.
#
# RE-PINNED S268 for S267 -- the stata descriptor only, since the pair
# variant omits the spss option line. Same builder as Section 31, so
# the same two-line pre-broken shape; the rationale is recorded there
# and not repeated. What this variant is FOR is unchanged: a literal
# tagged spelling fails the paste-and-rerun test under spss, so spss is
# not offered.
#
# Expected, second call: the same pair with '.b' echoed in the head --
# the marker comes from the user's call (here the labels argument), not
# from a fixed exemplar.
#
# Expected, third call: the jdeclare_missing home ("... so the '.a' marker
# cannot be declared.") -- reachable at the gate only from an ambiguous
# MIXED-CASE column like gmix$z: a clean tagged column resolves itself
# at level 1, and tokens on plain or SPSS-form columns are refused at
# sign-off 3 before resolution ever runs.
#
# Expected, calls four to seven (S283): the SAME four renders with the
# head's quoted marker in the case typed -- '.A', '.B', '.A' (declared),
# and '.A' under the jencode(): prefix -- and NOTHING else different: the
# pair stays stata-first with the same descriptors. (The corollary
# question, whether this menu should reorder for an uppercase marker
# as Section 13's refusal does, is deliberately NOT taken here: the
# descriptors are order-dependent -- the sas line reads "Like Stata"
# -- so a reorder is a rewrite, logged as its own item.)
#
# Things to look at:
#   - Paste joptions(missing.convention = "stata") and rerun each call:
#     all seven run. Same with "sas".
#   - Is the pair legible as "the menu minus an option that would fail
#     you", or does the missing spss line read as an oversight?
#   - THE UPPERCASE BEATS: put call one beside call four. The only
#     difference should be the quoted marker. If call four still says
#     '.a', N42e should be red.

options(.jst_options_missing_convention = NULL)
gw$StatusR <- NULL; gw$StatusL <- NULL; rm(gwt)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 33 -- variant C: the never-set range ----
# NEEDS: 31
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# A range can exist only under SPSS convention, so a session menu would
# offer two options that immediately refuse. C is the one gate render
# with NO menu: a single per-call fix line. (Deliberate asymmetry with
# D/E below: C's user has no convention to stay in, so there is no
# two-step recipe to give them.)

try(jdeclare_missing(gw, Status, range = c(-99, -51)))

# Expected (verbatim):
#   Error : jdeclare_missing(): no missing-value convention is selected, and a
#   missing-value range can exist only under SPSS convention.
#   To declare it, set convention = "spss" on this call.
#
# Things to look at:
#   - Paste the fix onto the call and rerun:
#     jdeclare_missing(gw, Status, range = c(-99, -51), convention = "spss")
#     declares the band. One edit, one rerun.
#   - "can exist only under" (the S243 one-word amendment, Rule W): does
#     the capability framing land -- this is what a range IS, not a
#     jstats restriction?


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 34 -- variant D: range vs a SET tagged convention, both renders ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The conflict the removed forcing line used to override silently (a
# live S243 run showed setting = "stata" + range declaring SPSS-form
# without a word). D is DATA-AWARE: the two-step stay-tagged recipe
# renders only when every targeted column's range covers 26 or fewer
# in-band values (jconvert's cap), so the recipe is honest to paste;
# over the cap, the count line and the Rule X requirement.

joptions(missing.convention = "stata", quiet = TRUE)
gd <- data.frame(Income = c(100, 200, -99, 300, -95, -91, 150))

try(jdeclare_missing(gd, Income, range = c(-99, -91)))

go <- data.frame(Wave = c(-120:-87, 1:5))   # 34 distinct in-band values
try(jdeclare_missing(go, Wave, range = c(-120, -87)))

# Expected, first call (fits; verbatim):
#   Error : jdeclare_missing(): a missing-value range can exist only under SPSS
#   convention, and your missing.convention setting is "stata".
#   To stay in Stata convention, first declare the range using SPSS convention:
#     jdeclare_missing(gd, Income, range = c(-99, -91), convention = "spss", modify = TRUE)
#   Then convert the column to Stata convention:
#     jconvert(gd, Income, to = "stata", modify = TRUE)
#
# Expected, second call (over-cap; verbatim):
#   Error : jdeclare_missing(): a missing-value range can exist only under SPSS
#   convention, and your missing.convention setting is "stata".
#   In Wave the range covers 34 values; Stata-style missing values support at
#   most 26 per variable, so this range cannot become Stata-style.
#   To declare the range using SPSS convention:
#     jdeclare_missing(go, Wave, range = c(-120, -87), convention = "spss", modify = TRUE)
#   To use Stata convention with jconvert(), you must first reduce these to
#   26 or fewer.
#
# Things to look at:
#   - Run the first call's two-step recipe as printed: Income ends
#     Stata-form (tagged markers, no na_range). The interleaved leads
#     ("To stay in ... :" / "Then convert ... :") are the S243 ruling
#     that a two-step recipe says what each step DOES.
#   - The recipe lines are bare Rule L lines and can run long; the
#     surrounding prose wraps, they never do. Acceptable on your
#     console width?
#   - GUARD SCOPE, worth exercising: the same range call on an
#     SPSS-FORM column under this same stata setting declares WITHOUT
#     any guard (level 1 resolves the column's own form -- Decision 11
#     precedence unchanged); on a TAGGED column it draws the per-column
#     convert-first refusal, not D. D covers exactly the columns that
#     have no form of their own.

options(.jst_options_missing_convention = NULL)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 35 -- variant E: range vs a PER-CALL tagged convention ----
# NEEDS: 34
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The per-call sibling: same builder, same data-aware fork; only the
# head differs (the combined clause) and the lead says "To use" -- E's
# user may hold no setting to "stay in". Fires under ANY setting state.

try(jdeclare_missing(gd, Income, range = c(-99, -91), convention = "stata"))

try(jdeclare_missing(go, Wave, range = c(-120, -87), convention = "sas"))

# Expected, first call (fits; verbatim):
#   Error : jdeclare_missing(): a missing-value range can exist only under SPSS
#   convention; it cannot be combined with convention = "stata".
#   To use Stata convention, first declare the range using SPSS convention:
#     jdeclare_missing(gd, Income, range = c(-99, -91), convention = "spss", modify = TRUE)
#   Then convert the column to Stata convention:
#     jconvert(gd, Income, to = "stata", modify = TRUE)
#
# Expected, second call (over-cap, sas; every style word flips
# mechanically): "... it cannot be combined with convention = \"sas\"."
# then "In Wave the range covers 34 values; SAS-style missing values
# support at most 26 per variable, so this range cannot become
# SAS-style." with the same SPSS remedy line and "To use SAS convention
# with jconvert(), you must first reduce these to 26 or fewer."
#
# Things to look at:
#   - D and E side by side (Sections 34/35): one message family? The
#     S243 sheet built them as head-swap variants of one body.
#   - The "stay in"/"use" lead distinction: audible, or too subtle to
#     survive reading?


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 36 -- variant F: jconvert's harmonized target menu ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The to = NULL error, rebuilt from the one-line "A target format is
# required." to the Rule V choose-first form (S243 decision). Four
# targets -- a conversion DESTINATION is externally constrained, so no
# recommendation; baseR is destructive, can never be supplied by a
# setting, and lists last; the joptions tail is the permanence-line
# analogue, teaching the standing default that makes the bare call work.

gf <- data.frame(x = haven::labelled_spss(c(1, 2, -99), na_values = -99))
try(jconvert(gf))

# Expected (verbatim):
#   Error : jconvert(): no target format is selected, so nothing can
#   be converted.
#   Choose a target for this call:
#     to = "stata"
#         Numeric missing codes become Stata-style missing values (.a-.z).
#         Lowercase markers behave as true NAs in base R.
#     to = "spss"
#         Stata- or SAS-style missing values (.a-.z, .A-.Z) become numeric
#         codes; jstats treats them as missing.
#         Base R does not.
#     to = "sas"
#         Like to = "stata", with uppercase markers (.A-.Z).
#     to = "baseR"
#         All missing-value declarations are removed; declared values
#         become plain NA.
#   To set a session default so to = is not needed, choose a convention:
#     joptions(missing.convention = "stata")    (or "spss", "sas")
#
# RE-PINNED S268 for S267. The stata and spss target descriptors were
# pre-broken the same way the A-menu's were, and for the same reason --
# the wrapper could sever "base R". "still ... but" left the spss line
# ("jstats still treats them as missing, but base R does not") in favour
# of two flat statements. sas and baseR are untouched.
#
# The harmonization bullet below is now doing more work than it was: the
# two menus were already meant to be the same facts in opposite
# directions, and after S267 the stata and spss lines are close to
# word-for-word across the two. Read Section 31's menu and this one back
# to back and judge whether that reads as one voice or as duplication.
#
# BREAKS CORRECTED from the S268 run, both wrong. The stata consequence
# does NOT wrap at all -- "Numeric missing codes become Stata-style
# missing values (.a-.z)." fits the indent on one line, where the guess
# split "(.a-.z)." off. And the spss line breaks after "numeric", not
# before it. The pre-breaking itself held; it was the secondary wrap
# inside each pre-broken sentence that was mispredicted.
#
# Things to look at:
#   - Every offered to = runs when added to the call; the joptions tail
#     then makes the BARE call work. Try both routes.
#   - The consequence lines carry the locked Rule B terms, harmonized
#     with the A-menu's (Section 31): same facts, same words, opposite
#     directions of travel.
#   - The spss target line was RE-PINNED S251 for the S250 Rule H edit.
#     Its second clause used to paraphrase its first ("become numeric
#     codes; codes stay visible numbers"); it now gives the consequence
#     its three siblings give, so this target finally states the base-R
#     asymmetry. Does it now read as a peer of the other three?
#   - to = "baseR" last: does the destructive option read as
#     deliberately set apart?


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 37 -- G: jscreen's SPSS-live-codes line ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The S240 steering ruling's one surviving surface outside the gate
# itself: jscreen -- the inspection function -- carries a CONDITION-ONLY
# line whenever screened columns hold SPSS-form declarations, because
# base R sees those values as live numbers. No remedy and no rider (the
# steering lives in the gate's menu copy and the book/guide passages).

gs <- data.frame(
  Inc = haven::labelled_spss(c(100, -99, 200), na_values = -99),
  Rng = haven::labelled_spss(c(1, 2, -60), na_range = c(-99, -51)),
  Age = c(30, 40, 50))
jscreen(gs)

# Expected, after the Missing Data & Outliers table (verbatim):
#   Note: SPSS-style declared missing values on: Inc, Rng.
#   jstats treats these as missing; base R functions do not.
# -- naming BOTH declaration shapes (discrete codes and a range) in one
# list. A frame with no SPSS-form columns prints no such line (rerun on
# gs["Age"] to see the silence).
#
# RE-PINNED S268 for S267: "declared codes on" -> "declared missing
# values on". This section is the clearest case in the file for why the
# reword was needed rather than merely preferred. The fixture declares
# Inc with discrete codes and Rng with a RANGE, and the old wording
# called both of them "codes" -- so the message was inaccurate about the
# very data this section built to test it. The line is range-safe now.
# It is also the runtime generic at work ("declared missing values",
# adopted S267 for runtime strings; roxygen keeps the UDM vocabulary by
# deliberate scope).
#
# BREAK CORRECTED from the S268 run. The guess had the wrap falling
# mid-second-sentence; the render breaks cleanly BETWEEN the two
# sentences, so each stands on its own line. A better result than
# predicted, and worth noting as a property rather than an accident --
# though the reword lengthened the first sentence, so confirm the split
# still holds if the variable list ever grows.
#
# Things to look at:
#   - Condition-only: does the line inform without nagging? It fires on
#     every jscreen of such a frame, by design (jscreen is stateless).
#   - "base R functions do not": strong enough for the mixing hazard it
#     is warning about, without a remedy attached?


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 38 -- what does NOT gate ----
# NEEDS: 31
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The gate is demand-driven: it runs only when a call MINTS a missing
# form. A never-set user doing ordinary work never sees it.

options(.jst_options_missing_convention = NULL)

gw$StatusN <- jrecode(gw, Status, map = "8=NA; else=copy")      # plain NA
gw$StatusC <- jrecode(gw, Status, map = "8=7; else=copy")       # no mint
gp <- data.frame(S = haven::labelled_spss(c(1, 2, -99, -95),
                                          na_values = -99))
gp <- jdeclare_missing(gp, S, codes = -95, missing.notice = FALSE)      # level 1
gq <- suppressMessages(jconvert(gp, to = "baseR"))              # explicit to=

options(.jst_options_missing_convention = "none")
try(jdeclare_missing(gw, Status, codes = -99))
options(.jst_options_missing_convention = NULL)

# Expected: none of the first four calls GATES -- recoding to plain NA is
# convention-free, an ordinary recode mints nothing, an SPSS-form column
# supplies its own convention at level 1, and an explicit to = answers
# jconvert's question in the call. The LAST call gates: an explicit "none"
# is identical to never having chosen -- "none" is the factory state, not
# a fourth convention.
#
# Not silent, though, and CORRECTED S251: the Expected used to promise the
# four ran silently bar the assign-to-keep reminders, and was one message
# short. The second call (8=7) also emits
#   Note: No value labels assigned. To add labels, use jrelabel().
# where the first (8=NA) does not. That is the labels-hint asymmetry
# already open against Section 22, surfacing here as a promise of silence
# the run does not keep. Read past it; the gate is what this section is
# about, and no gate fires.
#
# Things to look at:
#   - The demand-driven boundary is the whole cost story: a fresh user
#     loading, describing, recoding to NA, and modeling never meets the
#     gate. Walk a plausible first session in your head against this
#     list.
#   - "none" gating identically: right call? (Decision 11's text: unset
#     and "none" are one state.)

gw$StatusN <- NULL; gw$StatusC <- NULL


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART H -- the label branch reports what it did (S247) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The stata_canonical branch -- the one that NAMES a marker on a column
# whose cells are already tagged -- rendered from the CODES ARGUMENT
# rather than from what changed on the column. So it announced acts that
# had not happened: a label attached to a marker in no cell, a bare token
# that changes nothing, and a rename that dropped the old label without a
# word. Each body line now carries what actually became true of that
# marker, and an all-bare call -- which names nothing at all here --
# replaces the naming header outright rather than annotating it.
#
# THE PREMISE THAT HAD TO BE SETTLED FIRST, because the annotation only
# makes sense if the act it reports is allowed: forward-declaring a label
# on a marker in no cell is LEGAL, not a mistake to refuse. haven accepts
# it; it survives a write_dta/read_dta round trip AND a write_sav/
# read_sav(user_na = TRUE) one; and sign-off 5 has counted a label-only
# marker as a real declaration since S218. It is a dictionary operation,
# the exact parallel of SPSS taking VALUE LABELS for a value no case
# carries:
#     VALUE LABELS Fear -99 'Refused' -98 'New'.
#     MISSING VALUES Fear (-99, -98).
# accepted whether or not a case holds -98. So the message reports the
# absence rather than blocking the call (Option A, S247).
#
# The check half of this pair is N54 (13 checks) in
# missing_convention_check.R. These sections show the same surface
# rendered, in the states a reader would actually meet it.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 39 -- the four facts a body line can carry ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# One fixture, four calls, and the point is the CONTRAST: three of them
# annotate and the first does not. An annotation on every line would be
# noise; these are earned one at a time.
#
# hn's V carries cells .a and .b, and a value label on .a only. NONE of
# these calls is assigned, so every one starts from that same state --
# read them as four independent questions put to one column, not as a
# sequence.

joptions(missing.convention = "stata", quiet = TRUE)

hn <- data.frame(V = haven::labelled(
  c(1, 2, haven::tagged_na("a"), haven::tagged_na("b")),
  labels = c(Refused = haven::tagged_na("a"))))

jdeclare_missing(hn, V, codes = c(Skipped = ".b"))     # in the cells, unlabeled
jdeclare_missing(hn, V, codes = c(Changed = ".a"))     # in the cells, labeled
jdeclare_missing(hn, V, codes = c(New = ".c"))         # in NO cell
jdeclare_missing(hn, V, codes = c(Refused = ".a"))     # the name it already had

# Expected -- the header is the same every time ("Named Stata-style
# missing values on V:"), and the durability note follows every time.
# What varies is the one body line:
#     .b is now "Skipped"
#     .a is now "Changed" (was "Refused")
#     .c is now "New" (not present in the data)
#     .a is now "Refused" (no change)
#
# The first is the common case and the one to check hardest: a clean
# naming carries NO parenthesis at all. (Pinned by N54b for exactly that
# reason -- the ordinary path is the one a fix like this can quietly
# spoil.)

# Both facts at once, on a marker that is labeled AND absent:

hw <- data.frame(W = haven::labelled(
  c(1, haven::tagged_na("a")),
  labels = c(New = haven::tagged_na("c"))))

jdeclare_missing(hw, W, codes = c(Newer = ".c"))

# Expected:
#     .c is now "Newer" (was "New"; not present in the data)
# Replacement first, absence second, joined by a semicolon. The order is
# fixed rather than incidental: it reads as a sentence about the label
# and then a caveat about the data.

# And the case that CANNOT arise, worth seeing refused rather than taken
# on trust -- a bare entry alongside a named one:

try(jdeclare_missing(hn, V, codes = c(New = ".b", ".a")))

# Expected: "jdeclare_missing(): `codes` is partially named. Either name every
# element (Option C) or none (Option A with separate labels=)." Partial
# naming is refused upstream, which is why all-bare (Section 40) is the
# only bare path, and why the "(no change)" annotation above is reachable
# only by re-asserting a name.
#
# Things to look at:
#   - Does "(no change)" read as informative or as pedantry? It is the
#     one annotation reporting a non-event, and a user who re-types a
#     label they already set may simply be confirming it.
#   - "(not present in the data)" -- does it read as a report or as a
#     warning? Option A says forward-declaring is legitimate, so it
#     should read as neither approval nor rebuke.
#   - The parenthetical form: four different facts in one bracket shape.
#     Compare against the SPSS branch, which announces a dropped
#     declaration in a separate Note. Is one branch's choice wrong, or do
#     the two acts genuinely differ in weight?

options(.jst_options_missing_convention = NULL)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 40 -- the all-bare call: nothing is named, so nothing is claimed ----
# NEEDS: 39
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# codes = ".a" on a column whose cells are ALREADY tagged asks for
# something that does not exist on this branch. The cells are already
# missing -- that is what put the column here -- so the only act
# available is naming a marker, and this call names none. It used to
# print a "Named ..." header over a bare marker, asserting an act that
# never happened.
#
# The note teaches to the likely CAUSE rather than just reporting the
# no-op, and the cause is a migration habit worth recognizing. On the
# SPSS side a bare code IS the declaration:
#     MISSING VALUES Income (-99).            <- declares, no label needed
# and jstats honors that reading for numeric codes (the last call in this
# section). A user who learned codes = -99 there writes codes = ".a" here
# and reasonably expects the same thing to happen.

joptions(missing.convention = "stata", quiet = TRUE)

jdeclare_missing(hn, V, codes = ".a")

# Expected -- the naming header is GONE, replaced outright:
#   Note: jdeclare_missing made no change to V. Its markers are already missing
#   values, so a bare marker has nothing to name.
#   To name one:
#     hn <- jdeclare_missing(hn, V, codes = c(Refused = ".a"))
#
# RE-PINNED S268 for S267, and this one is an INDENT change only -- no
# word moves. "To name one:" goes to column 0 and the scaffold under it
# to two spaces. Read against the block above it: the intro is a heading
# for the line beneath, and a heading indented as far as its own content
# is not a heading.
#
# Worth knowing WHY, because this is the second of the two defects the
# S267 workstation run caught that a green 189/189 had shipped straight
# past. The Rule L sweep moved the runnable to two spaces and left the
# intro at two, flattening the pair into one indistinguishable block.
# Nothing in the suite pinned indents at all, in either direction, so
# nothing failed. The fix takes the intro to column 0 -- and it had to
# be made in three literals at once, because the plural caller below
# SPLICES its variable list by matching on the exact string
# "\nTo name one:\n". Change one and the splice stops finding it.
#
# And note what does NOT follow it: no durability note. Nothing changed,
# so there is nothing to make durable -- and a "save this to keep it"
# line under a no-op would be the very defect being removed.

jdeclare_missing(hn, V, codes = ".a", modify = TRUE)

# Expected: the same note, with the scaffold in the modify form --
#       jdeclare_missing(hn, V, codes = c(Refused = ".a"), modify = TRUE)
# The remedy follows the user's own call rather than a fixed exemplar:
# someone working with modify = TRUE gets a line they can paste as-is.

hn_labels <- labelled::val_labels(hn$V)
identical(labelled::val_labels(
  suppressMessages(jdeclare_missing(hn, V, codes = ".a"))$V), hn_labels)

# Expected: TRUE. The claim in the note is that nothing changed, so the
# walk checks it rather than taking the message's word for it.

joutput("minimal", quiet = TRUE)
jdeclare_missing(hn, V, codes = ".a")
jdeclare_missing(hn, V, codes = c(New = ".c"))
joutput(NULL, quiet = TRUE)

# Expected: the no-naming note renders IDENTICALLY at minimal -- same
# wording, same remedy, single-form across tiers like the gate renders.
# It is consequential (the user asked for something and got nothing), and
# consequential messages show at every tier. The NAMED call beside it
# shows what the tier does change: header and body line survive, the
# durability note drops per Rule E.
#
# WORTH CONFIRMING ON THE RUN: .jst_jdeclare_missing_no_naming_note's own
# header comment says the note "prints at every tier above minimal",
# which reads as though minimal suppresses it. The live render above says
# otherwise, and the live render matches the level framework. If that is
# right, the comment is loose rather than the code wrong -- a source
# comment to correct, not behaviour to change.

joptions(missing.convention = "spss", quiet = TRUE)
hs <- data.frame(Income = c(100, 200, -99, 300))
jdeclare_missing(hs, Income, codes = -99)
options(.jst_options_missing_convention = NULL)

# Expected: a NORMAL declaration -- "Declared SPSS-style missing values on
# Income:" over a body line of "-99 (no label)" (RE-PINNED S339: the code
# has no label and the line now says so; it read "-99"), durability note
# and all. This is the
# contrast the note above is built on, and the check that the S247 change
# did not bleed sideways: a bare NUMERIC code is a complete declaration,
# a bare TOKEN on an already-tagged column is not. Section 28's second
# call is the same point met from the other direction (bare numerics
# after labeled ones, whose labels the variable keeps).
#
# Things to look at:
#   - Does the note explain the asymmetry well enough that a migrant does
#     not read it as jstats being fussy? The two forms genuinely differ:
#     one supplies information the column lacks, the other supplies none.
#   - "Its markers are already missing values" -- is "markers" the right
#     word here for a reader who typed a token and thinks of it as a
#     code?
#   - The remedy hardcodes "Refused" as the example label. Does that read
#     as a placeholder or as an instruction?


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 41 -- bulk: presence is a property of the COLUMN ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The bulk builder groups columns and renders one block per group, which
# is what keeps a 52-column call readable. But presence and prior labels
# belong to each COLUMN, not to the codes argument, so two columns in one
# group can differ in what is true of them -- and the block would then
# state a falsehood about one. The group key gained a marker-note
# signature to prevent it (the same widening S240 made when it added the
# convention).

joptions(missing.convention = "stata", quiet = TRUE)

hb <- data.frame(
  P = haven::labelled(c(1, haven::tagged_na("a"))),
  Q = haven::labelled(c(1, haven::tagged_na("c"))),
  R = haven::labelled(c(2, haven::tagged_na("a"))))

jdeclare_missing(hb, P, Q, R, codes = c(New = ".c"))

# Expected: TWO blocks from one call, splitting 2 + 1 --
#   Named Stata-style missing values on 2 variables:
#     P, R
#     .c is now "New" (not present in the data)
#
#   Named Stata-style missing values on 1 variable:
#     Q
#     .c is now "New"
#
# P and R carry .a, so .c is absent from both and they group together;
# Q carries .c, so its line is true without the caveat. One durability
# note covers the call.
#
# The split is by SIGNATURE, not by column: naming P and R alone gives
# ONE block, because nothing distinguishes them.

jdeclare_missing(hb, P, R, codes = c(New = ".c"))

# Expected: a single block, "2 variables", "P, R", one annotated line.

jdeclare_missing(hb, P, R, codes = ".a")

# Expected: the all-bare note, pluralized, with the variables named --
#   Note: jdeclare_missing made no change to 2 variables. Their markers are
#   already missing values, so a bare marker has nothing to name.
#     P, R
#   To name one:
#     hb <- jdeclare_missing(hb, P, codes = c(Refused = ".a"))
#
# "Their" rather than "Its", and the variable list spliced under the
# first sentence -- "no change to 2 variables" is not actionable without
# saying which. The scaffold names one column rather than the set: it is
# a form to copy, not a call to run verbatim.
#
# RE-PINNED S268 for S267: the same indent fix as the singular note
# above -- intro to column 0, scaffold to two spaces. This is the caller
# that splices the variable list by matching "\nTo name one:\n", which
# is why the two notes had to move together.
#
# INDENT SETTLED by the S268 run: the "P, R" line renders at TWO
# spaces, unchanged by the S267 move. So the plural note now has its
# variable list indented two and its "To name one:" heading at column
# 0 -- the list sits under the sentence, the heading stands clear of
# both. Read it once and judge whether that ordering is right; it was
# never designed, it fell out of where the splice happens to insert.
#
# Things to look at:
#   - Read the two-block render as a stranger would. Does it read as one
#     call reporting two truths, or as two calls having happened?
#   - The bound: the signature ranges over the markers NAMED IN THE CALL,
#     so a 52-column call naming one marker yields at most two blocks.
#     Worth holding in mind against the field corpus, where 52 declared
#     columns is a real number rather than a hypothetical.
#   - A MIXED bulk call -- some columns named, some not -- still gets a
#     durability note, because some column did change. Only an all-bare
#     call loses it.

options(.jst_options_missing_convention = NULL)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART I -- the D1 note teaches the choice (S250, walked S251) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# S250 closed a defect in the D1 suspicious-target note. Under an unset
# session it claimed "your current convention" and offered a call carrying
# no convention = -- both halves false, and the missing token it suggested
# is precisely the construct the PART G gate refuses. So the note handed
# the user the one thing that could not run, in a sentence that never said
# a choice was pending.
#
# The note now FORKS. Unset, it emits the gate's OWN menu, through the same
# builder at prefixed = FALSE, and the user chooses once. Set, it names the
# convention and goes straight to the remedy. No convention is inferred in
# either branch: Decision 11 step (4) forbids it, and the conditional Stata
# recommendation stays in the menu copy rather than migrating into a note.
#
# That the two branches share one body is asserted byte-identically by
# missing_convention_check.R N55b/N55c. What this PART is for is the
# question a check cannot answer: whether a twelve-line menu nested inside
# a note reads as help or as a wall.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 42 -- the D1 note, unset and then set ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

options(.jst_options_missing_convention = NULL)
gi <- data.frame(Status = c(1, 2, 8, 2, 1, 3, NA))

gi$StatusR <- jrecode(gi, Status, map = "8=-99; else=copy")

# Expected, UNSET (verbatim, before the two trailing reminders):
#   Note: 8 was recoded to -99, which looks like a coded missing value.
#   No missing-value convention is selected, so the value cannot be made
#   missing yet.
#   Choose one for this session:
#     joptions(missing.convention = "stata")
#         Lowercase markers behave as true NAs in base R.
#         Recommended if you also run base R or AI-generated code.
#     joptions(missing.convention = "spss")
#         Codes stay visible numbers; jstats treats them as missing.
#         Base R does not.
#     joptions(missing.convention = "sas")
#         Like Stata, with uppercase markers (.A-.Z).
#   To make the choice permanent, put the same line in your .Rprofile.
#   Then map it directly:
#     gi$StatusR <- jrecode(gi, Status, map = "8=missing; else=copy")
#   Or declare -99 as missing on the recoded variable:
#     gi$StatusR <- jrecode(gi, Status, map = "8=-99; else=copy")
#     jdeclare_missing(gi, StatusR, codes = c(-99), modify = TRUE)
#
# RE-PINNED S303: the tail, in all three branches of this section. See
# Section 27 for why the pair replaced the S267 source-column line. In
# THIS branch the pair only runs once a convention is chosen, as the menu
# above it says -- the declare line gates under the unset state.
#
# RE-PINNED S268 for S267, TWO changes. (1) The menu descriptors, as in
# Section 31 -- same shared builder, same pre-broken two-line shape.
# (2) The TAIL, which is the more interesting one. It used to read "Or
# declare -99 with jdeclare_missing() so analyses exclude it." -- a
# call-less pointer, the last non-runnable remedy in this family. It is
# now an intro plus a pasteable call, so both alternatives this note
# offers can be run rather than only the first.
#
# The same S267 pass fixed a real DEFECT here that no render in this
# section shows: the remedy builder read the convention from
# getOption() only, so a call carrying its own convention = argument
# drew the UNSET menu and then handed back a remedy that silently
# reverted to the setting. Both pasteable lines now carry convention =
# whenever the originating call did. To see it, rerun the call above
# with convention = "stata" added and check that BOTH remedy lines echo
# it back. That render is not pinned here and is worth adding.
#
# Note the head is CAPITALIZED here and lowercase in Section 31. That is
# the whole of the difference: Section 31 is a stop(), so "jrecode(): "
# precedes it; this is a message(), so the sentence starts itself.

options(.jst_options_missing_convention = "stata")

gi$StatusS <- jrecode(gi, Status, map = "8=-99; else=copy")

# Expected, SET (verbatim, before the two trailing reminders):
#   Note: 8 was recoded to -99, which looks like a coded missing value.
#   To make the value missing under Stata convention, map it directly:
#     gi$StatusR <- jrecode(gi, Status, map = "8=missing; else=copy")
#   Or declare -99 as missing on the recoded variable:
#     gi$StatusR <- jrecode(gi, Status, map = "8=-99; else=copy")
#     jdeclare_missing(gi, StatusR, codes = c(-99), modify = TRUE)
#
# RE-PINNED S303: the tail, and "Stata-style convention" -> "Stata
# convention" in the lead line (stale since S267; the per-call render
# below already showed it).
#
# RE-PINNED S268 for S267: the same tail change as the unset branch
# above -- the call-less "with jdeclare_missing() so analyses exclude it"
# pointer replaced by an intro and a pasteable call. The tail is shared
# by both branches, which is why it moved in both.
#
# -- the menu collapses to one line. Re-run under "spss" and "sas" to
# see the style word follow the setting; nothing else in the note moves.

# S282: the third branch, closing the S268 coverage gap. UNSET session, but
# the call carries its own convention = argument. This is the render the
# S267 defect fix produced and the note above described without pinning:
# the remedy builder used to read the convention from getOption() only, so
# a call like this one drew the UNSET menu and then handed back a remedy
# that silently reverted to the setting.

options(.jst_options_missing_convention = NULL)

gi$StatusP <- jrecode(gi, Status, map = "8=-99; else=copy",
                      convention = "stata")

# Expected, PER-CALL (verbatim, before the two trailing reminders):
#   Note: 8 was recoded to -99, which looks like a coded missing value.
#   To make the value missing under Stata convention, map it directly:
#     gi$StatusR <- jrecode(gi, Status, map = "8=missing; else=copy", convention = "stata")
#   Or declare -99 as missing on the recoded variable:
#     gi$StatusR <- jrecode(gi, Status, map = "8=-99; else=copy", convention = "stata")
#     jdeclare_missing(gi, StatusR, codes = c(-99), convention = "stata", modify = TRUE)
#
# RE-PINNED S303: the tail. convention = now rides on all THREE pasteable
# lines -- the per-call beat's point, one line longer.
#
# (Sandbox-rendered against the v0.9.158 master at S282, at the pinned 76,
# then confirmed by the S282 workstation walk.)
#
# Things to look at, THE PER-CALL BEAT specifically:
#   - THE POINT OF THE BEAT: all three remedy lines carry convention =
#     "stata" (since S303 the declare line puts it before modify = TRUE).
#     If any one drops it, the fix has reverted -- a user who pasted that
#     line back would land under whatever the session setting is, which is
#     nothing here, and get the unset gate for their trouble.
#   - Read it against the UNSET branch above. Same session state, same
#     recoded value, and yet no menu: supplying the convention on the call
#     is itself a choice, so the note has nothing to ask. Judge whether the
#     silent difference is right, or whether a user who has NOT set a
#     session convention should still be told that this one was per-call
#     and will not persist.
#   - THE MAP LINE IS 87 COLUMNS. It is unwrapped by design (a wrapped map
#     string cannot be pasted), and the per-call echo is what pushes it
#     past the pin -- without convention = it sits near 63. Pre-existing
#     and logged at S251 with jencode_walk.R Section 7's ~150-column case;
#     recorded here because this beat makes a short map long. Since S303
#     the pair's two lines join it, at 83 and 84.
#
# Things to look at, the section:
#   - THE MAIN JUDGEMENT. Unset, the note runs to seventeen lines for
#     what began as an observation about one recoded value (S267 added
#     one: the runnable declare line; S303 another, the pair's recode
#     line -- eighteen now). Is teaching the
#     choice here worth that, or would a pointer to the gate be kinder?
#     The alternative was weighed and rejected at S250 (a message whose
#     advice is "run this to get another message" is a round trip), so
#     this is a re-look, not a reopening.
#   - The suggested map line is UNWRAPPED and can run well past 76
#     columns on a longer map -- jencode_walk.R Section 7 shows it at
#     about 150. Pre-existing, logged S251, not fixed here.
#   - The offered call uses the missing TOKEN, which cannot run until a
#     convention is chosen. That is deliberate -- it is the same line
#     the set branch offers -- but read the two branches back to back and
#     judge whether the unset one makes the dependency obvious enough.
#   - Both branches close on the same jdeclare_missing() alternative. Does
#     the "Or" read as a genuine second route, or as an afterthought?

options(.jst_options_missing_convention = NULL)
gi$StatusR <- NULL; gi$StatusS <- NULL; gi$StatusP <- NULL


options(.jst_options_missing_convention = NULL)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 43 -- jconvert past the codes: the range, and the refusals that ----
#               remain (S282; re-pinned S314; rebuilt S319)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# THE HISTORY THIS SECTION CARRIES. Converting tagged columns to SPSS form
# maps each letter tag onto one of the numbers in missing.convention.codes.
# S282 pinned the REFUSAL a column met when it had more markers than codes,
# and S314 re-pinned it twice (the letter framing of 0.9.188, then the
# count form of 0.9.189, when a column's sorted markers began taking the
# codes in letter order). Six renders: four refusals, two conversions.
#
# S319 REBUILT. A column with more markers than codes is no longer refused.
# It is CONVERTED, and its codes are declared as a missing-value RANGE --
# SPSS's own form for more than three -- that starts at the first
# convention code and runs one integer per marker in the direction the codes
# run (the S318 ruling): with the defaults, five markers take -99 to -95,
# declared as the range -99 to -95. The conversion report lists the
# column's markers one per row and ends its block with the range row, and a
# NOTE says why the range was used. Only the
# first code and the direction are read, so .a-.c keep today's codes
# whenever the setting's codes are consecutive, and the return trip gives
# the letters back in order. Two refusals remain, each ending in a fix: a
# SINGLE code, which gives the range no direction; and codes running TOWARD
# zero from so close that the range would reach it (c(-3, -2, -1) with four
# markers), where real values are likeliest.
#
# Eight renders: three conversions with a range (jc5 at the defaults, its
# return trip, jc3 at two codes), the two refusals (jc4 at one code; jc4 at
# c(-3, -2, -1)), the two-problem frame at one code (jcb), and the S314
# pair (jce, jcm). The assertion side is missing_convention_check.R N62a-c,
# N70k/l/n/v, N72a-o and, for the report's layout, N73a-h; this is where
# the shapes get read next to each other.
#
# S334 (v0.9.211) ADDS THREE, renders 9-11. The report has ONE arrow column
# now: until 0.9.211 the arrow aligned within each variable's block, so a
# variable with a single short row had its arrow three places left of its
# neighbors' (render 9). A row too long for the message width keeps its
# arrow after its own label and moves nobody else (render 10) -- the thing
# the per-block form was for. And the return-trip note of renders 7 and 8
# now fires whenever a letter would change, which includes codes that do
# not run from the largest down (render 11). Assertion side: N73c N73d
# (re-pinned), N76a-f, N77a-l.
#
# CODES-OPTION HYGIENE: this section sets missing.convention.codes several
# ways, which no other section in the file does. It records nothing of its
# own -- Setup already records and restores the slot (S280) -- but it clears
# the slot at its foot so nothing downstream inherits a narrowed or
# reversed session.

.mk43 <- function(n, extra = numeric(0)) {
  haven::labelled(
    c(1, 2, 3, extra,
      vapply(letters[seq_len(n)], haven::tagged_na, double(1))),
    labels = c(Yes = 1, No = 2))
}
jc3 <- data.frame(Income = .mk43(3))
jc4 <- data.frame(Income = .mk43(4))
jcb <- data.frame(Income = .mk43(3), Education = .mk43(2, extra = -99))
# S314: cells .a and .b; .e is declared only by its label, no case carries it.
jce <- data.frame(Income = haven::labelled(
  c(1, 2, 3, haven::tagged_na("a"), haven::tagged_na("b")),
  labels = c(Yes = 1, No = 2, "Not applicable" = haven::tagged_na("e"))))
# S314: mnemonic letters, the Stata habit the positional rule refused.
jcm <- data.frame(Income = haven::labelled(
  c(1, 2, 3, haven::tagged_na("d"), haven::tagged_na("n"), haven::tagged_na("r")),
  labels = c(Yes = 1, No = 2, "Don't know" = haven::tagged_na("d"),
             "N/A" = haven::tagged_na("n"), Refused = haven::tagged_na("r"))))
# S319: five labelled markers, the band's own case.
jc5 <- data.frame(Income = haven::labelled(
  c(1, 2, 3, vapply(letters[1:5], haven::tagged_na, double(1))),
  labels = c(Yes = 1, No = 2, Refused = haven::tagged_na("a"),
             "Don't know" = haven::tagged_na("b"), "N/A" = haven::tagged_na("c"),
             Skipped = haven::tagged_na("d"), Lost = haven::tagged_na("e"))))

options(.jst_options_missing_convention_codes = NULL)
jc5_spss <- jconvert(jc5, to = "spss")

jc5_back <- jconvert(jc5_spss, to = "stata")

options(.jst_options_missing_convention_codes = c(-99, -98))
jc3_spss <- jconvert(jc3, to = "spss")

options(.jst_options_missing_convention_codes = -99)
try(jconvert(jc4, to = "spss"))

try(jconvert(jcb, to = "spss"))

options(.jst_options_missing_convention_codes = c(-3, -2, -1))
try(jconvert(jc4, to = "spss"))

options(.jst_options_missing_convention_codes = NULL)

jce_spss <- jconvert(jce, to = "spss")

jcm_spss <- jconvert(jcm, to = "spss")

# S334: a two-value variable beside a one-value variable; the same pair with
# one long label; and jc5 again under codes that run AWAY from zero.
jcx <- data.frame(
  Income = haven::labelled(
    c(1, 2, 3, haven::tagged_na("a"), haven::tagged_na("b")),
    labels = c(Yes = 1, No = 2, Refused = haven::tagged_na("a"),
               "Don't know" = haven::tagged_na("b"))),
  Smoker = haven::labelled(
    c(1, 2, 2, 1, haven::tagged_na("a")),
    labels = c(Yes = 1, No = 2, Refused = haven::tagged_na("a"))))
jcl <- jcx
jcl$Smoker <- haven::labelled(
  c(1, 2, 2, 1, haven::tagged_na("a")),
  labels = c(Yes = 1, No = 2,
             "Not applicable (never smoked, so not asked about quitting)" =
               haven::tagged_na("a")))
jcx_spss <- jconvert(jcx, to = "spss")

jcl_spss <- jconvert(jcl, to = "spss")

options(.jst_options_missing_convention_codes = c(-1, -2, -3))
jc5_away <- jconvert(jc5, to = "spss")

options(.jst_options_missing_convention_codes = NULL)

# Expected, render 1 -- THE BAND. jc5 carries five labelled markers at the
# default codes. Until 0.9.194 this was the control refusal ("SPSS allows at
# most 3 separate missing-value codes per variable, so at most 3 lettered
# markers can be converted"). Now the five take -99 to -95, one row each,
# the block ends "range -99 to -95", and the note names the limit that made
# a range the answer:
#   Converted to SPSS-style missing values in 1 variable:
#     Income  .a ["Refused"]     -> -99
#             .b ["Don't know"]  -> -98
#             .c ["N/A"]         -> -97
#             .d ["Skipped"]     -> -96
#             .e ["Lost"]        -> -95
#             range -99 to -95
#
#   Note: Income has 5 lettered markers, more than the 3 separate missing-value
#   codes SPSS allows, so its codes were declared as a missing-value range.
#
#   This call changes jc5 only if you assign the result:
#     jc5 <- jconvert(jc5, ...)
#
#   To change jc5 directly, rerun with modify = TRUE:
#     jconvert(jc5, ..., modify = TRUE)
#
# Expected, render 2 -- THE RETURN TRIP. The reverse direction enumerates
# the range it finds and letters the values by code order, so the five come
# back as .a-.e in the order they left, labels intact. (A range run the
# other way -- codes away from zero -- comes back reversed, and since
# 0.9.211 the conversion says so: render 11.) The range row says it was
# enumerated, and the S218 range-loss
# note follows, as it does for any enumerated range:
#   Converted to Stata-style missing values in 1 variable:
#     Income  -99 ["Refused"]     -> .a
#             -98 ["Don't know"]  -> .b
#             -97 ["N/A"]         -> .c
#             -96 ["Skipped"]     -> .d
#             -95 ["Lost"]        -> .e
#             range -99 to -95  (enumerated)
#
#   Note: Stata-style missing values have no range concept. For the
#     range declarations above, only values present in the data or
#     carrying value labels were translated; the range rule itself was
#     not preserved. A range value first appearing in later data will
#     arrive as an ordinary data value.
#
#   This call changes jc5_spss only if you assign the result:
#     jc5_spss <- jconvert(jc5_spss, ...)
#
#   To change jc5_spss directly, rerun with modify = TRUE:
#     jconvert(jc5_spss, ..., modify = TRUE)
#
# Expected, render 3 -- a NARROWED setting, two codes, a three-marker column.
# Until 0.9.194 the "widen the setting" refusal (render 2 of the old
# section). Now the third marker extends past the setting and the note
# names the setting rather than SPSS's limit -- the same note as render 1
# with its reason swapped, because below three codes the setting is the
# user's own:
#   Converted to SPSS-style missing values in 1 variable:
#     Income  .a  -> -99
#             .b  -> -98
#             .c  -> -97
#             range -99 to -97
#
#   Note: Income has 3 lettered markers, more than the 2 codes in your
#   missing.convention.codes setting, so its codes were declared as a
#   missing-value range.
#
#   This call changes jc3 only if you assign the result:
#     jc3 <- jconvert(jc3, ...)
#
#   To change jc3 directly, rerun with modify = TRUE:
#     jconvert(jc3, ..., modify = TRUE)
#
# Expected, render 4 -- A SINGLE CODE. The one setting that gives the range
# no direction, so the count refusal remains, in its S281 narrowed form.
# The widen line CHANGED at S319: it used to say "set up to three codes,
# the maximum SPSS allows", which beside five markers read as a limit the
# fix could not meet; two codes now give any number of markers a range:
#   Error : jconvert(): at most 1 lettered marker per variable can be converted
#   because your missing.convention.codes setting currently has only 1 code.
#
#   This variable in jc4 has more:
#     Income: .a, .b, .c, .d
#
#   To allow any number, set two or three codes:
#     joptions(missing.convention.codes = c(...))
#
# Expected, render 5 -- the TWO-PROBLEM frame, at one code. Income and
# Education are both over (any second marker is, at one code) and
# Education's real data holds -99, a code its .a would take. The fold line
# takes the new widen wording; the narrower-set escape keeps its
# placeholder:
#   Error : jconvert(): cannot convert jcb to SPSS -- two problems:
#
#   At most 1 lettered marker per variable can be converted because your
#   missing.convention.codes setting currently has only 1 code.
#   These variables have more:
#     Income: .a, .b, .c
#     Education: .a, .b
#
#   The missing.convention.codes values overlap with real data values.
#   This variable is affected:
#     Education: -99
#
#   To fix both, set two or three codes that do not overlap:
#     joptions(missing.convention.codes = c(...))
#
#   Or convert a narrower set, leaving out all the variables above:
#     jconvert(jcb, to = "spss", vars = c(...), modify = TRUE)
#
# Expected, render 6 -- CODES THAT REACH ZERO. c(-3, -2, -1) runs toward
# zero from three below it, so a fourth marker would need 0 -- and 0 is a
# value real data holds. Refused, naming the setting as typed, with the fix
# that reorders the codes (widening cannot help here) and the reduce
# fallback:
#   Error : jconvert(): with your missing.convention.codes setting (-3, -2, -1),
#   more lettered markers than codes would need codes that reach 0.
#
#   This variable in jc4 has more:
#     Income: .a, .b, .c, .d
#
#   To allow more, set codes that run away from 0:
#     joptions(missing.convention.codes = c(...))
#   Or first reduce its markers to 3 or fewer.
#
# Expected, render 7 -- since S314 (its rows the long form since 0.9.196):
# a marker only a value label declares. jce's cells carry .a and .b; "Not applicable" is labelled on
# .e, which no case carries. .e takes the third code, and the NOTE says
# what a return trip would give:
#   Converted to SPSS-style missing values in 1 variable:
#     Income  .a                     -> -99
#             .b                     -> -98
#             .e ["Not applicable"]  -> -97
#
#   Note: converting Income back to Stata-style missing values would give its
#   markers .a, .b, .c with the same labels, not .a, .b, .e.
#
#   This call changes jce only if you assign the result:
#     jce <- jconvert(jce, ...)
#
#   To change jce directly, rerun with modify = TRUE:
#     jconvert(jce, ..., modify = TRUE)
#
# Expected, render 8 -- since S314 (its rows the long form since 0.9.196):
# mnemonic markers. jcm carries .d, .n and .r; they take the three codes in
# letter order, and the report's rows show the mapping the note then refers
# to:
#   Converted to SPSS-style missing values in 1 variable:
#     Income  .d ["Don't know"]  -> -99
#             .n ["N/A"]         -> -98
#             .r ["Refused"]     -> -97
#
#   Note: converting Income back to Stata-style missing values would give its
#   markers .a, .b, .c with the same labels, not .d, .n, .r.
#
#   This call changes jcm only if you assign the result:
#     jcm <- jconvert(jcm, ...)
#
#   To change jcm directly, rerun with modify = TRUE:
#     jconvert(jcm, ..., modify = TRUE)
#
# Expected, render 9 -- ONE ARROW COLUMN (S334). Income has two declared
# values and Smoker one. Until 0.9.211 Smoker's row was padded only to its
# own label, so its arrow sat three places left of Income's:
#   Converted to SPSS-style missing values in 2 variables:
#     Income  .a ["Refused"]     -> -99
#             .b ["Don't know"]  -> -98
#     Smoker  .a ["Refused"]     -> -99
#
#   This call changes jcx only if you assign the result:
#     jcx <- jconvert(jcx, ...)
#
#   To change jcx directly, rerun with modify = TRUE:
#     jconvert(jcx, ..., modify = TRUE)
#
# Expected, render 10 -- A LONG LABEL KEEPS ITS OWN ARROW (S334). The same
# pair, Smoker's label now too long for the row to fit the message width.
# That row puts its arrow two spaces after its own label, and Income's rows
# stay where they were in render 9:
#   Converted to SPSS-style missing values in 2 variables:
#     Income  .a ["Refused"]     -> -99
#             .b ["Don't know"]  -> -98
#     Smoker  .a ["Not applicable (never smoked, so not asked about quitting)"]  -> -99
#
#   This call changes jcl only if you assign the result:
#     jcl <- jconvert(jcl, ...)
#
#   To change jcl directly, rerun with modify = TRUE:
#     jconvert(jcl, ..., modify = TRUE)
#
# Expected, render 11 -- CODES THAT RUN AWAY FROM ZERO (S334). jc5 again,
# with missing.convention.codes = c(-1, -2, -3): the range runs -1 to -5.
# The return direction letters the largest code first, so the five would
# come back in the opposite order, and the note of renders 7 and 8 now says
# so (it was silent here: the letters ARE the leading ones):
#   Converted to SPSS-style missing values in 1 variable:
#     Income  .a ["Refused"]     -> -1
#             .b ["Don't know"]  -> -2
#             .c ["N/A"]         -> -3
#             .d ["Skipped"]     -> -4
#             .e ["Lost"]        -> -5
#             range -5 to -1
#
#   Note: Income has 5 lettered markers, more than the 3 separate missing-value
#   codes SPSS allows, so its codes were declared as a missing-value range.
#
#   Note: converting Income back to Stata-style missing values would give its
#   markers .e, .d, .c, .b, .a with the same labels, not .a, .b, .c, .d, .e.
#
#   This call changes jc5 only if you assign the result:
#     jc5 <- jconvert(jc5, ...)
#
#   To change jc5 directly, rerun with modify = TRUE:
#     jconvert(jc5, ..., modify = TRUE)
#
# (Captured under sink() at the pinned 76 and pasted from the capture,
# not retyped: renders 4-6 against the v0.9.195 master, where the refusals
# took their current text, and the five conversions re-pinned against the
# v0.9.196 master, the only renders in this section that changed. Renders
# 9-11 captured against the v0.9.211 build at S334.)
#
# Things to look at:
#   - RENDER 9 (S334): read down the arrows. One column -- does Smoker's
#     single row now read as part of the same table as Income's two?
#   - RENDER 10 (S334): the long row's arrow is far to the right of the
#     others. Is that easier to read than moving all three arrows out to
#     it would be? (At a wider message.width the row fits, and then it does
#     set the column for every row.)
#   - RENDER 11 (S334): the note lists the letters each marker would come
#     back with, in the order of the rows above -- .e for .a, .d for .b,
#     and so on. Does "would give its markers .e, .d, .c, .b, .a with the
#     same labels, not .a, .b, .c, .d, .e" read as a reversal at a glance,
#     or does it need a plainer word?
#   - THE ROWS (renders 1, 2, 3, 7, 8). Until 0.9.196 the report put a
#     column's whole mapping on one line -- 133 characters for render 1,
#     144 for render 2. Now each marker has its row, the label beside it
#     in the form jfreq's Missing section prints, the code in a column of
#     its own. Read render 1 down the labels and then down the codes: can
#     you see at a glance which meaning landed on -99? And in render 7,
#     where only .e has a label, does the bare .a and .b read as "no label"
#     rather than as something missing from the report?
#   - RENDER 2'S RANGE ROW ends "(enumerated)". Does that read as a fact
#     about the rows above it, or as a separate item?
#   - READ 1, 3 AND 4 IN ORDER. Same column shape (jc5 and jc3 differ only
#     in count), three settings: the default three codes, two codes, one
#     code. The first two convert and say why the range was used; the third
#     refuses and says what would let it convert. Does the progression read
#     as one rule -- a range needs a direction, and two codes give one?
#   - THE RANGE NOTE'S REASON. Render 1 names "the 3 separate missing-value
#     codes SPSS allows"; render 3 names "the 2 codes in your
#     missing.convention.codes setting". A narrowed setting is the user's
#     own choice, so SPSS is not the reason there. Does the swap read as
#     deliberate, or as two notes?
#   - RENDER 2 AGAINST RENDER 1. Five codes out, five markers back, in
#     order, with the labels. This is the property the S318 ruling chose the
#     direction FOR (a band toward zero comes back in letter order). The
#     range-loss note beneath it is the S218 note firing as it always has;
#     read whether it still makes sense when the range it mourns was one
#     jstats itself declared a moment ago.
#   - RENDER 6'S HEADING quotes the setting as typed, in Rule AB form. Is
#     "would need codes that reach 0" clear about WHY that is refused, or
#     does it need the word "data"?
#   - RENDER 5: at one code every second marker is over, so Education is
#     listed under "have more" AND under the collision. Does the fold line
#     make it obvious that one joptions() call clears both?


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART J -- jfreq's Missing rows count the pool (S285; the S217 defect) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# S285 fixed a defect first suspected at S217 and reproduced at S284: under
# ANY pipeline stage (jcomplete, jsubset, subset =), jfreq's Missing rows
# were FULL-frame counts -- the Step-0 masking bundle for SPSS-form, the
# original column for tags, both recorded before a single row was filtered
# -- while the Valid rows and the Total counted the filtered pool. So under
# a filter the two halves of one table sat on different denominators: Valid
# + Missing overshot the Total, the Total % column summed past 100, and
# because the System/NA row is the SUBTRACTION total_na - udm_total clamped
# at zero, the over-count could swallow a genuine System/NA row without a
# trace. The S284 reproducer: jsubset(d, Condition != 3) on clinic, then
# jfreq(d, Stress) -- Valid 51 + Missing 2 and 2 against Total 53.
#
# The fix counts every Missing row off the pre-masking column restricted to
# the surviving rows (pre_pipeline_data[surviving_ids] -- the CPS bottom's
# pool column, so the two surfaces now share one count source). The row SET
# is unchanged: which codes print is still read from the full column, so a
# declared code absent from the pool prints at 0 as it did before, and an
# UNLABELLED tag -- whose only declaration is its cells -- keeps its row.
# Only the numbers move, and only under a pipeline: with nothing active the
# pool is the whole frame and every table below prints exactly as at 0.9.159.
#
# The assertion side is missing_convention_check.R N64 (16 checks, both
# representations across all three stages, mutation-tested). This PART is
# the read: does the table under a filter now look like a table OF the
# filter -- the Remaining N in the CPS above it, the Total at its foot, and
# every Missing row, describing the same rows?
#
# PIPELINE HYGIENE: each render sets and clears its own jsubset / jcomplete
# on the frame it uses. Setup already neutralised both (S228); this PART
# leaves them neutral at its foot.
#
# FIXTURES ARE LOCAL. Setup's cw_stata / cw_sas do NOT reach this point --
# Section 2 rm()s them to stage the nudge at one frame -- so this PART
# derives its own three forms from cw_spss (which survives), the same way
# Setup did. Found by running the spliced file end to end in the sandbox
# (the section's standalone render had passed on Setup-shaped fixtures).


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 44 -- Environment1 under a filter, three forms ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Environment1 carries -99 ["Refused"] x6 and -98 ["Don't know"] x6 across
# the 103 community rows. Region == 4 keeps 25 of them, holding two of each;
# Region == 3 keeps 31, holding one -99 and no -98. j44_stata and j44_sas are
# jconvert()s of the same frame, so their tags sit in exactly the rows the
# SPSS codes sit in -- the three renders under Region == 4 must show the
# SAME numbers in three spellings.

j44_spss  <- cw_spss
j44_stata <- jconvert(j44_spss, to = "stata", missing.notice = FALSE)
j44_sas   <- jconvert(j44_spss, to = "sas",   missing.notice = FALSE)

# Render 1 -- the control: no pipeline. The Missing block and Total print
# exactly as at 0.9.159; the block ABOVE them does not (S287 re-pin): where
# 0.9.159-0.9.160 drew a two-row Case Processing table (Original 103 /
# Remaining N 103), the S284 visibility rule now prints "103 Cases in the
# 1 Variable Pool" on one line. Renders 2-5 keep their tables -- a filter
# row is an exclusion row, and that is what the rule keys on.
jfreq(j44_spss, Environment1)

# Expected, Render 1 (the Missing block and the Total):
#   Missing
#   -99 ["Refused"]          6     5.83      --       --
#   -98 ["Don't know"]       6     5.83      --       --
#
#   Total                  103   100.00
#
# Things to look at:
#   - This is the baseline the next four renders are measured against.
#     91 valid + 6 + 6 = 103; Total % sums to 100.00.

# Render 2 -- jsubset Region == 4, SPSS-form.
jsubset(j44_spss, Region == 4)
jfreq(j44_spss, Environment1)
jsubset(j44_spss, NULL)

# Expected, Render 2 (CPS, then the Missing block and the Total):
#   Case Processing  Excluded  Remaining
#       Original           --        103
#       jsubset()          78         25  Region == 4
#       Remaining N        --         25
#   ...
#   Missing
#   -99 ["Refused"]         2      8.00      --       --
#   -98 ["Don't know"]      2      8.00      --       --
#
#   Total                  25    100.00
#
# At 0.9.159 the same two rows read 6 and 6 at 24.00% each -- the full
# frame's counts -- against this same Total of 25: 21 valid + 12 = 33 in a
# 25-row table.
#
# Things to look at:
#   - Read the Remaining N (25) and the Total (25) and the Missing rows
#     as ONE population. 21 valid + 2 + 2 = 25. Total % sums to 100.00.
#   - The Valid block is unchanged from 0.9.159 -- it always counted the
#     pool. Only the Missing rows and their Total % moved.

# Render 3 -- the same rows, Stata-form.
jsubset(j44_stata, Region == 4)
jfreq(j44_stata, Environment1)
jsubset(j44_stata, NULL)

# Expected, Render 3 (the Missing block and the Total):
#   Missing
#   .a ["Refused"]          2      8.00      --       --
#   .b ["Don't know"]       2      8.00      --       --
#
#   Total                  25    100.00
#
# Things to look at:
#   - Same numbers as Render 2, spelled in tags. The tag branch had its
#     own full-frame source (the original column, not the masking
#     bundle), so this is a separate fix that must agree with Render 2.

# Render 4 -- Region == 3, SAS-form: a declared marker with NO cell in the
# pool. The row stays, at 0.
jsubset(j44_sas, Region == 3)
jfreq(j44_sas, Environment1)
jsubset(j44_sas, NULL)

# Expected, Render 4 (CPS Remaining N 31; the Missing block and the Total):
#   Missing
#   .A ["Refused"]          1      3.23      --       --
#   .B ["Don't know"]       0      0.00      --       --
#
#   Total                  31    100.00
#
# Things to look at:
#   - At 0.9.159 both rows read 6 at 19.35% against this Total of 31.
#   - .B prints at 0 rather than vanishing: the row set comes from the
#     full column (where .B has six cells), the COUNT from the pool
#     (where it has none). This is the S284 decision-9 rule -- declared
#     but absent prints at 0 -- holding under a filter. SPSS's own
#     FREQUENCIES would drop the row.
#   - 30 valid + 1 + 0 = 31.

# Render 5 -- two stages at once: jcomplete on Environment3, then a
# per-call subset =, SPSS-form. jcomplete(Environment3) drops 12 rows; of
# the 25 Region == 4 rows, 21 survive it, and the 4 dropped carry both of
# Environment1's -99 cells in that region and one of its two -98 cells.
jcomplete(j44_spss, Environment3)
jfreq(j44_spss, Environment1, subset = Region == 4)
jcomplete(j44_spss, NULL)

# Expected, Render 5 (CPS, then the Missing block and the Total):
#   Case Processing  Excluded  Remaining
#       Original           --        103
#       jcomplete()        12         91  Environment3
#       subset =           70         21  Region == 4
#       Remaining N        --         21
#   ...
#   Missing
#   -99 ["Refused"]         0      0.00      --       --
#   -98 ["Don't know"]      1      4.76      --       --
#
#   Total                  21    100.00
#
# (All five renders sandbox-rendered against the S285 master at the pinned
# 76, R 4.3.3, community built from its generator; workstation walk
# pending.)
#
# Things to look at:
#   - Three stages are in play across this section (jsubset, jcomplete,
#     subset =) and the Total reconciles under each. At 0.9.159 this
#     render read -99 x6, -98 x6 against Total 21: 20 valid + 12 = 32.
#   - The -99 row at 0 here is the SPSS-form twin of Render 4's .B: the
#     declaration keeps the row, the pool sets the count.
#   - Do the five tables read as the same function reporting on five
#     populations, or does anything in the Missing block still read as a
#     property of the whole dataset?

jsubset(clear.all = TRUE); jcomplete(clear.all = TRUE)
rm(j44_spss, j44_stata, j44_sas)


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART K -- markers as things you can map (S319; the S314 bundled item) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The S314 item found two gaps behind one surface: a Stata-style column had
# no in-package route to a number of the user's choosing (jrecode refused a
# marker as an OLD value), to another letter, or -- past three markers --
# into SPSS form at all (Section 43's old refusals). S319 closes both. On the
# jrecode side, ".a=-99" gives the .a cells a number, ".a=NA" plain NA,
# ".b=.a" re-letters them; a marker the map does not name is kept with its
# label. And the S318 RULING decides what a recode does to a declared missing
# value it moves: onto a code that looks like a missing-value code (-88 on a
# 1-5 scale) the cells come out declared, label and all, with a note; onto a
# code that does not look like one (6; or -88 among incomes, where -88 is
# small) they become data, and a companion note says so and gives the
# declaration as the recode-then-declare pair. Two riders: the D1 pair's
# declare line now lists every code the recoded variable already declares
# (jdeclare_missing REPLACES a column's codes; the line had named the flagged
# code alone since S303), and 'missing' under a per-call convention = "spss"
# on a Stata-style column is refused rather than building a column whose
# markers every reader took for plain NA.
#
# The assertion side is missing_convention_check.R N72p-N72ar. This PART
# reads the notes beside the frequency tables they describe.
#
# FIXTURES ARE LOCAL: jr45 is built here; cw_spss (community, from Setup)
# supplies Education and Income, and the two recoded columns added to it
# are removed at the foot.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 45 -- jrecode: markers as old values, and the S318 ruling ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The Stata-style fixture: .a "Refused" and .b "Don't know" in the cells, a
# labelled 9 "Not asked" as an ordinary value.
jr45 <- data.frame(Q = haven::labelled(
  c(1, 2, 1, 2, haven::tagged_na("a"), haven::tagged_na("b"), 1, NA,
    haven::tagged_na("a"), 9),
  labels = c(Yes = 1, No = 2, "Not asked" = 9, Refused = haven::tagged_na("a"),
             "Don't know" = haven::tagged_na("b"))))
options(.jst_options_missing_convention = NULL)

# Render 1 -- two markers to two codes, declared: the S318 ruling (option A).
jr45$QR <- jrecode(jr45, Q, map = ".a=-99; .b=-98; else=copy")

jfreq(jr45, QR)

# Render 2 -- a declared code moved to a new code on a 1-5 scale: -88 is
# declared, "Refused" travels, -99 is released.
cw_spss$EducationR <- jrecode(cw_spss, Education, map = "-99=-88; else=copy")

jfreq(cw_spss, EducationR)

# Render 3 -- the same map among incomes: -88 does not look like a code
# there, so it stays valid, and the companion note gives the declaration.
cw_spss$IncomeR <- jrecode(cw_spss, Income, map = "-99=-88; else=copy")

# Render 4 -- the pair, pasted from Render 3's note.
cw_spss$IncomeR <- jrecode(cw_spss, Income, map = "-99=-88; else=copy")
jdeclare_missing(cw_spss, IncomeR, codes = c(-98, -88), modify = TRUE)

# Render 5 -- a marker the map leaves in place beside a code the rule
# declares: one form per variable.
try(jrecode(jr45, Q, map = ".a=-99; else=copy"))

# Render 6 -- 'missing' with convention = "spss" in the call, on a
# Stata-style column: the S318 mixed-column route, now refused.
try(jrecode(jr45, Q, map = "9=missing; else=copy", convention = "spss"))

cw_spss$EducationR <- NULL
cw_spss$IncomeR    <- NULL
rm(jr45)

# Expected, render 1 -- two markers to two codes. The note is the S318
# ruling speaking: the codes were declared BECAUSE the markers were, and the
# labels travelled. (Rule R: it names the source cells the declaration came
# from.) Then the table: two Missing rows where the source had .a and .b,
# and "Not asked" still a valid row, since 9 was not declared:
#   Note: -99 and -98 were declared as missing values on the recoded variable,
#   as .a ["Refused"] and .b ["Don't know"] are on Q.
#
#   Note: This call changes jr45 only if you assign the result:
#     jr45$<name> <- jrecode(...)
#   To check the recode landed correctly, compare jfreq() on the original and
#   the new column.
#
# Then jfreq(jr45, QR):
#   Frequencies
#
#   10 Cases in the 1 Variable Pool
#
#   QR
#
#                       Freq  Total %  Valid %  Cum. %
#   ------------------  ----  -------  -------  ------
#   Valid
#   1: Yes                3     30.00   50.00    50.00
#   2: No                 2     20.00   33.33    83.33
#   9: Not asked          1     10.00   16.67   100.00
#
#   Missing
#   -99 ["Refused"]       2     20.00      --       --
#   -98 ["Don't know"]    1     10.00      --       --
#   System/NA             1     10.00      --       --
#
#   Total                10    100.00
#
# Expected, render 2 -- a declared code moved on a 1-5 scale. The kept-code
# note for -98 prints first (it always has); the S319 note follows it after
# a blank (Rule F). In the table the three refusals sit under Missing at
# -88, the label with them, and -99 is gone from the variable:
#   Note: -98 ["Don't know"] is a declared missing value and was kept on the
#   recoded variable.
#   To convert it to a plain NA instead, add -98=NA to the map.
#
#   Note: -88 was declared as a missing value on the recoded variable, as -99
#   ["Refused"] is on Education.
#
#   Note: This call changes cw_spss only if you assign the result:
#     cw_spss$<name> <- jrecode(...)
#   To check the recode landed correctly, compare jfreq() on the original and
#   the new column.
#
# Then jfreq(cw_spss, EducationR):
#   Frequencies
#
#   103 Cases in the 1 Variable Pool
#
#   EducationR
#
#                            Freq  Total %  Valid %  Cum. %
#   -----------------------  ----  -------  -------  ------
#   Valid
#   1: Some high school        23    22.33   23.71    23.71
#   2: High school graduate    18    17.48   18.56    42.27
#   3: Some college            25    24.27   25.77    68.04
#   4: Bachelor's degree       13    12.62   13.40    81.44
#   5: Graduate degree         18    17.48   18.56   100.00
#
#   Missing
#   -98 ["Don't know"]          3     2.91      --       --
#   -88 ["Refused"]             3     2.91      --       --
#
#   Total                     103   100.00
#
# Expected, render 3 -- the same map among incomes. -88 does not look like
# a missing-value code beside 14000-93000, so it stays valid: the companion
# note says the three refusals now count as data and gives the pair. The
# declare line lists -98 as well as -88, because jdeclare_missing replaces
# the column's codes -- naming -88 alone would drop "Don't know":
#   Note: -98 ["Don't know"] is a declared missing value and was kept on the
#   recoded variable.
#   To convert it to a plain NA instead, add -98=NA to the map.
#
#   Note: -99 ["Refused"] is a declared missing value on Income, but its new
#   code, -88, is not declared, so those cases now count as data.
#   To keep those cases missing, declare -88 on the recoded variable:
#     cw_spss$IncomeR <- jrecode(cw_spss, Income, map = "-99=-88; else=copy")
#     jdeclare_missing(cw_spss, IncomeR, codes = c(-98, -88), modify = TRUE)
#
#   Note: This call changes cw_spss only if you assign the result:
#     cw_spss$<name> <- jrecode(...)
#   To check the recode landed correctly, compare jfreq() on the original and
#   the new column.
#
# Expected, render 4 -- the pair from render 3, pasted and run. The first
# line reprints render 3's notes (inherent to the two-step pattern, S303);
# the second declares both codes on IncomeR in cw_spss:
#   Declared SPSS-style missing values on IncomeR in cw_spss:
#     -98 ["Don't know"]
#     -88 ["Refused"]
#
#   To keep it across sessions, save the data frame:
#     jsave(cw_spss, "cw_spss.rds")
# (RE-PINNED S339, v0.9.213: the codes are typed bare and the two lines read
# "-98" and "-88" until then; the confirmation now shows the labels the
# recoded variable carries -- PART L, Section 47.)
#
# Expected, render 5 -- one form per variable. ".a=-99" would declare -99
# on a result that still carries .b, and no reader of a column can hold
# SPSS-style codes and lettered markers at once. Refused, with the convert
# route and the map-it-too route (the S302 marker refusal's mirror):
#   Error : jrecode(): the recoded variable would hold the marker .b beside -99,
#   a declared missing value from .a, and a variable holds SPSS-style missing
#   values or lettered markers, not both.
#   Convert the data frame first, then recode:
#     jconvert(jr45, to = "spss", modify = TRUE)
#   Or map .b as well, so no lettered marker remains.
#
# Expected, render 6 -- the S318 mixed-column route. With convention =
# "spss" given in the call, the D7 teach-gate stands aside (a per-call
# convention never conflicts), and until 0.9.194 the result was an
# SPSS-form column whose .a and .b cells every reader took for plain NA --
# "Refused" and "Don't know" gone from jfreq with only a note about -99.
# Now the same refusal as render 5, naming the token's code:
#   Error : jrecode(): the recoded variable would hold the markers .a and .b
#   beside -99, which 'missing' declares under SPSS convention, and a variable
#   holds SPSS-style missing values or lettered markers, not both.
#   Convert the data frame first, then recode:
#     jconvert(jr45, to = "spss", modify = TRUE)
#   Or map .a and .b as well, so no lettered marker remains.
#
# (All captured under sink() at the pinned 76 and pasted from the capture,
# not retyped: at S319 against the v0.9.195 master, and the notes naming a
# labelled value re-pinned against the v0.9.196 master, where their labels
# took the bracketed form.)
#
# Things to look at:
#   - RENDER 1'S NOTE. "-99 and -98 were declared as missing values on the
#     recoded variable, as .a ["Refused"] and .b ["Don't know"] are on Q."
#     The "as ... are on Q" clause is Rule R's data condition. Does it read
#     as the reason, or does "as" read as "while"?
#   - RENDER 2 AGAINST RENDER 3: the SAME map, two variables, two outcomes,
#     decided by whether -88 looks like a code beside the variable's real
#     values. Read the two notes together: is it clear from render 3 alone
#     WHY -88 was not declared there, or does the user need render 2 to
#     understand it? (The help page carries the rule; the note carries the
#     fact and the fix, per Rule I.)
#   - RENDER 3'S PAIR. Line 1 is the user's own call, assigned into
#     IncomeR; line 2 declares on that column with modify = TRUE. jrecode()
#     has no modify argument by design (it returns a vector), so the
#     assignment is the only way its result lands. Does the pair read as
#     "do this", or does the repeated recode line read as an error?
#   - RENDER 4: the declare line names -98 AND -88. Paste it as a user
#     would and confirm both survive on IncomeR; the D1 pair (Section 42)
#     now does the same.
#   - RENDERS 5 AND 6 share one shape with a different middle ("a declared
#     missing value from .a" / "which 'missing' declares under SPSS
#     convention"). Do the two middles read as the same rule applied twice?
#   - THE TABLE ORDER in render 2: -98 before -88 -- jfreq sorts declared
#     codes ascending, so the newly declared code lands below the kept
#     one. Expected, but worth seeing once.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART L -- the confirmation states the resulting declaration (S339) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Fix Slate 2 (v0.9.213). Until this build jdeclare_missing()'s SPSS-form
# confirmation listed what the CALL typed. Since S219 a call replaces what
# it names and keeps what it omits (Decision 12 part 3), so what a call
# typed and what the variable now declares are two different lists, and the
# confirmation showed the wrong one. The field project met it first: a code
# added to a variable carrying a range printed the code alone, and the kept
# range read as replaced (field request 6).
#
# The body lines are now read from the variable the call PRODUCED. Each is a
# value -- "range lo to hi", a code with its label -- followed, after ONE
# space and inside ONE pair of parentheses, by whatever else is true of it,
# joined by "; " in this order:
#     no label                 the code carries no value label
#     already declared         the variable keeps it; this call did not name it
#     in range                 a value label this call set inside the range
#     from -99                 (a marker) the code it was converted from
#     not present in the data  no case holds it
# That is the form the naming branch's lines have had since S247 (PART H);
# "(in range)" and "(from -99)" had two spaces before them and now have one
# (the S220 item).
#
# The assertion side is missing_convention_check.R N81a-N81ao. Fixtures are
# local to each section; each sets the convention it needs and clears it.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 46 -- what the variable keeps is shown, and marked ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The field case (S298): MaritalStatus declared missing from -99 to -51, and
# then one more code, 8 "Widowed", added in a second call.
#
# SPSS parallel, and the reason the old message misled a returning user:
#     MISSING VALUES MaritalStatus (-99 THRU -51).
#     MISSING VALUES MaritalStatus (8).        <- replaces: the range is gone
# In jstats the second call keeps the range, because it did not name one.
joptions(missing.convention = "spss", quiet = TRUE)

ms46 <- data.frame(MaritalStatus = c(1, 2, 3, 8, -99, -60, 2, 1))
ms46 <- jdeclare_missing(ms46, MaritalStatus, range = c(-99, -51),
                         missing.notice = FALSE)

# Render 1 -- the code added. Until 0.9.213 the body was the one line
# '8 ["Widowed"]'.
ms46 <- jdeclare_missing(ms46, MaritalStatus, codes = c(Widowed = 8))

# Expected:
#   Declared SPSS-style missing values on MaritalStatus:
#     range -99 to -51 (already declared)
#     8 ["Widowed"]
#
#   This call changes ms46 only if you assign the result:
#     ms46 <- jdeclare_missing(ms46, MaritalStatus, ...)
#
#   To change ms46 directly, rerun with modify = TRUE:
#     jdeclare_missing(ms46, MaritalStatus, ..., modify = TRUE)

# The claim checked rather than taken from the message: the range is still
# on the variable, beside the code.
attr(ms46$MaritalStatus, "na_range")
attr(ms46$MaritalStatus, "na_values")

# Expected:
#   [1] -99 -51
#   [1] 8

# Render 2 -- the other direction: a variable that declares a code is given
# a range. The code is kept, and it has no label.
kc46 <- data.frame(Q = haven::labelled_spss(c(1, 2, 8, -99, -60),
                                            na_values = 8))
kc46 <- jdeclare_missing(kc46, Q, range = c(-99, -51))

# Expected:
#   Declared SPSS-style missing values on Q:
#     range -99 to -51
#     8 (no label; already declared)
#
#   This call changes kc46 only if you assign the result:
#     kc46 <- jdeclare_missing(kc46, Q, ...)
#
#   To change kc46 directly, rerun with modify = TRUE:
#     jdeclare_missing(kc46, Q, ..., modify = TRUE)

# Render 3 -- a range REPLACED by a narrower one (a call replaces what it
# names). The new range is unmarked; the code is the part the call kept.
ms46 <- jdeclare_missing(ms46, MaritalStatus, range = c(-99, -90))

# Expected:
#   Declared SPSS-style missing values on MaritalStatus:
#     range -99 to -90
#     8 ["Widowed"] (already declared)
#
#   This call changes ms46 only if you assign the result:
#     ms46 <- jdeclare_missing(ms46, MaritalStatus, ...)
#
#   To change ms46 directly, rerun with modify = TRUE:
#     jdeclare_missing(ms46, MaritalStatus, ..., modify = TRUE)

options(.jst_options_missing_convention = NULL)
rm(ms46, kc46)

# Things to look at:
#   - "(already declared)". It marks the part of the declaration this call
#     did not touch. Does it read as "still in force", which is what it
#     means, or could it read as a complaint that the call repeated
#     something?
#   - THE HEADER over render 1 says "Declared SPSS-style missing values on
#     MaritalStatus:" and the first line under it is something this call
#     did NOT declare. The body is the variable's whole declaration; the
#     mark is what tells the two apart. Is that enough, or does the header
#     want to say so?
#   - RENDER 3 drops nothing from the list, but the old range covered -60
#     and the new one does not: that case is data again, and nothing says
#     so. A dropped CODE gets a note (Section 50); a narrowed RANGE does
#     not. Logged at S339 as its own item, not built here.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 47 -- labels: said when a code has none, shown when it kept one ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Two items with one cause. The confirmation printed a bare code for a bare
# code, whether or not the variable held a label for it. So a code with no
# label said nothing about labels (Session 198: in three probe runs of
# three an assistant then gave the variable the labels of the variables
# listed next to it), and a label that SURVIVED a redeclaration went
# unreported (the S241 item, part 3).
joptions(missing.convention = "spss", quiet = TRUE)

# Render 1 -- bare codes on a plain variable. "(no label)" is the form
# jload's inventory and jfreq's Missing rows already use.
lb47 <- data.frame(Mood = c(3, 4, -99, 5, -98, 2))
lb47 <- jdeclare_missing(lb47, Mood, codes = c(-99, -98))

# Expected:
#   Declared SPSS-style missing values on Mood:
#     -99 (no label)
#     -98 (no label)
#
#   This call changes lb47 only if you assign the result:
#     lb47 <- jdeclare_missing(lb47, Mood, ...)
#
#   To change lb47 directly, rerun with modify = TRUE:
#     jdeclare_missing(lb47, Mood, ..., modify = TRUE)

# Render 2 -- one code labelled in the call, one not.
lc47 <- data.frame(Mood = c(3, 4, -99, 5, -98, 2))
lc47 <- jdeclare_missing(lc47, Mood, codes = c(-99, -98),
                         labels = "-99=Refused")

# Expected:
#   Declared SPSS-style missing values on Mood:
#     -99 ["Refused"]
#     -98 (no label)
#
#   This call changes lc47 only if you assign the result:
#     lc47 <- jdeclare_missing(lc47, Mood, ...)
#
#   To change lc47 directly, rerun with modify = TRUE:
#     jdeclare_missing(lc47, Mood, ..., modify = TRUE)

# Render 3 -- labelled, then declared again with bare codes. Declaring a
# value missing does not touch its label (SPSS: MISSING VALUES never alters
# VALUE LABELS), so the labels are still there, and the confirmation now
# shows them. Until 0.9.213 this printed "-99" and "-98".
ld47 <- data.frame(Mood = c(3, 4, -99, 5, -98, 2))
ld47 <- jdeclare_missing(ld47, Mood, codes = c(Refused = -99, DK = -98),
                         missing.notice = FALSE)
ld47 <- jdeclare_missing(ld47, Mood, codes = c(-99, -98))

# Expected:
#   Declared SPSS-style missing values on Mood:
#     -99 ["Refused"]
#     -98 ["DK"]
#
#   This call changes ld47 only if you assign the result:
#     ld47 <- jdeclare_missing(ld47, Mood, ...)
#
#   To change ld47 directly, rerun with modify = TRUE:
#     jdeclare_missing(ld47, Mood, ..., modify = TRUE)

# The Missing rows jfreq prints for the same variable, to read against the
# two lines above: the same values in the same form.
jfreq(ld47, Mood)

options(.jst_options_missing_convention = NULL)
rm(lb47, lc47, ld47)

# Things to look at:
#   - RENDER 1 against the jload scan that usually precedes it: does
#     "-99 (no label)" stop a reader giving Mood the labels of a
#     neighbouring variable? That is what the mark is for.
#   - No line says HOW to label a code (codes = c(Refused = -99)); the
#     help page does. A pointer under the block would be one more line on
#     every unlabelled declaration. Wanted, or right as it is?
#   - RENDER 3 against jfreq's Missing rows: one form in both places.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 48 -- a code no case holds ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# -77 typed for -99 declared without a word (the Session 114 item): a
# declaration that catches nothing looked exactly like one that worked. The
# naming branch has marked an absent marker since S247 (Section 39); the
# same words now mark an absent code, an empty range, and a code converted
# to a marker that no case held (Jeff's S336 lean, and the three leans
# okayed at S339).
#
# It is a mark, not a refusal: declaring a code before any case carries it
# is allowed, as SPSS allows MISSING VALUES for a value no case holds.
joptions(missing.convention = "spss", quiet = TRUE)
np48 <- data.frame(Income = c(100, 200, -99, 300, -98, 250))

# Render 1 -- the slip: -77 for -98.
invisible(jdeclare_missing(np48, Income, codes = c(-99, -77)))

# Expected:
#   Declared SPSS-style missing values on Income:
#     -99 (no label)
#     -77 (no label; not present in the data)
#
#   This call changes np48 only if you assign the result:
#     np48 <- jdeclare_missing(np48, Income, ...)
#
#   To change np48 directly, rerun with modify = TRUE:
#     jdeclare_missing(np48, Income, ..., modify = TRUE)

# Render 2 -- the same slip in a range: -9 to -5 for -99 to -51.
invisible(jdeclare_missing(np48, Income, range = c(-9, -5)))

# Expected:
#   Declared SPSS-style missing values on Income:
#     range -9 to -5 (not present in the data)
#
#   This call changes np48 only if you assign the result:
#     np48 <- jdeclare_missing(np48, Income, ...)
#
#   To change np48 directly, rerun with modify = TRUE:
#     jdeclare_missing(np48, Income, ..., modify = TRUE)

# Render 3 -- a value label set inside a range is NOT marked, whether or not
# a case holds it (-70 is in no case here): the label is not a declaration
# of its own, and a codebook's worth of them would all be marked.
invisible(jdeclare_missing(np48, Income, range = c(-99, -51),
                           labels = "-98=Don't know; -70=Never asked"))

# Expected:
#   Declared SPSS-style missing values on Income:
#     range -99 to -51
#     -98 ["Don't know"] (in range)
#     -70 ["Never asked"] (in range)
#
#   This call changes np48 only if you assign the result:
#     np48 <- jdeclare_missing(np48, Income, ...)
#
#   To change np48 directly, rerun with modify = TRUE:
#     jdeclare_missing(np48, Income, ..., modify = TRUE)

# Render 4 -- under Stata convention the codes become markers, and the slip
# lands on a marker no case will ever hold.
invisible(jdeclare_missing(np48, Income, codes = c(-99, -77),
                           labels = "-99=Refused", convention = "stata"))

# Expected:
#   Declared and converted to Stata-style missing values on Income:
#     .a ["Refused"] (from -99)
#     .b (from -77; no label; not present in the data)
#
#   This call changes np48 only if you assign the result:
#     np48 <- jdeclare_missing(np48, Income, ...)
#
#   To change np48 directly, rerun with modify = TRUE:
#     jdeclare_missing(np48, Income, ..., modify = TRUE)

options(.jst_options_missing_convention = NULL)
rm(np48)

# Things to look at:
#   - "(no label; not present in the data)" -- two facts in one pair of
#     parentheses. Readable, or does the second need to stand out more for
#     a reader who has just mistyped a code?
#   - RENDER 2: "range -9 to -5 (not present in the data)". The words were
#     written for a code. Do they carry over to a range, or would "(no case
#     in this range)" be clearer?
#   - RENDER 4, second line: ".b (from -77; no label; not present in the
#     data)" is the longest a line gets. Still one line at 76.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 49 -- a call on several variables ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# One declaration on many variables stays ONE block, with two exceptions
# that are the same rule: variables are reported together only when the
# block's lines are true of every one of them. A variable that keeps a
# range the others never had gets its own block, and so do variables whose
# kept labels differ -- as on the naming branch since S247 (Section 41).
#
# Whether a case HOLDS a code is deliberately not part of that. In survey
# data -99 is in most items and -98 in some; splitting on it would turn one
# declaration into a block per pattern. So a block marks a code "not
# present in the data" only when NONE of its variables holds it (the lean
# okayed at S339) -- which is still the mistyped code.
joptions(missing.convention = "spss", quiet = TRUE)

# Render 1 -- Q1 and Q3 hold -98, Q2 does not; no item holds -77.
bk49 <- data.frame(Q1 = c(1, 2, -99, -98, 3), Q2 = c(2, -99, 1, 3, 2),
                   Q3 = c(-98, 1, 2, -99, 3))
invisible(jdeclare_missing(bk49, Q1, Q2, Q3, codes = c(-99, -98, -77)))

# Expected:
#   Declared SPSS-style missing values on 3 variables:
#     Q1, Q2, Q3
#     -99 (no label)
#     -98 (no label)
#     -77 (no label; not present in the data)
#
#   This call changes bk49 only if you assign the result:
#     bk49 <- jdeclare_missing(bk49, Q1, Q2, Q3, ...)
#
#   To change bk49 directly, rerun with modify = TRUE:
#     jdeclare_missing(bk49, Q1, Q2, Q3, ..., modify = TRUE)

# Render 2 -- Q1 already declares a range; the call adds a code to all
# three.
bk49$Q1 <- haven::labelled_spss(bk49$Q1, na_range = c(-99, -51))
invisible(jdeclare_missing(bk49, Q1, Q2, Q3, codes = 9))

# Expected:
#   Declared SPSS-style missing values on 1 variable:
#     Q1
#     range -99 to -51 (already declared)
#     9 (no label; not present in the data)
#
#   Declared SPSS-style missing values on 2 variables:
#     Q2, Q3
#     9 (no label; not present in the data)
#
#   This call changes bk49 only if you assign the result:
#     bk49 <- jdeclare_missing(bk49, Q1, Q2, Q3, ...)
#
#   To change bk49 directly, rerun with modify = TRUE:
#     jdeclare_missing(bk49, Q1, Q2, Q3, ..., modify = TRUE)

# Render 3 -- the same bare code on three variables whose value labels for
# it differ.
bl49 <- data.frame(
  A = haven::labelled(c(1, 2, -99), labels = c(Refused = -99)),
  B = haven::labelled(c(2, -99, 1), labels = c(Refused = -99)),
  C = haven::labelled(c(-99, 1, 2), labels = c(`No answer` = -99)))
invisible(jdeclare_missing(bl49, A, B, C, codes = -99))

# Expected:
#   Declared SPSS-style missing values on 2 variables:
#     A, B
#     -99 ["Refused"]
#
#   Declared SPSS-style missing values on 1 variable:
#     C
#     -99 ["No answer"]
#
#   This call changes bl49 only if you assign the result:
#     bl49 <- jdeclare_missing(bl49, A, B, C, ...)
#
#   To change bl49 directly, rerun with modify = TRUE:
#     jdeclare_missing(bl49, A, B, C, ..., modify = TRUE)

options(.jst_options_missing_convention = NULL)
rm(bk49, bl49)

# Things to look at:
#   - RENDER 1: -98 is unmarked though Q2 has no -98. Is that the right
#     reading of "one declaration, three variables", or does it hide
#     something a user would want?
#   - RENDER 2 reads as two declarations where the user made one. The
#     first block is the variable that came with history. Clear, or does
#     it want a word saying why Q1 is apart?
#   - RENDER 2, second block: 9 is in none of the three, so both blocks
#     mark it -- each block speaks for its own variables.
#   - The bound, against the field corpus: 52 variables given one range
#     stay one block unless some of them already declare codes, and then
#     the blocks are as many as there are different kept declarations.


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 50 -- what the call did comes before the reminder ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# The drop notice reports a CONSEQUENCE of the call: a code that was
# declared and no longer is. Until 0.9.213 it printed after the durability
# reminder, which reads as the closer (the S267 item). It now sits between
# the declaration and the reminder, and the mixed-marker note with it
# (Section 19, re-pinned). The two notes that are not consequences of the
# call -- the setting-override note (Section 28) and the convention-mismatch
# note (Section 3) -- stay after the reminder: their remedy lines name the
# data frame, which holds the declaration only once the result is assigned.
joptions(missing.convention = "spss", quiet = TRUE)
dn50 <- data.frame(Income = haven::labelled_spss(
  c(100, 200, -99, 300, -98), na_values = c(-99, -98),
  labels = c(Refused = -99, `Don't know` = -98)))

# Render 1 -- the natural misreading of a second call: "add -97". The call
# replaces the codes, and says which it dropped before it says anything
# else.
invisible(jdeclare_missing(dn50, Income, codes = c(-99, -97)))

# Expected:
#   Declared SPSS-style missing values on Income:
#     -99 ["Refused"]
#     -97 (no label; not present in the data)
#
#   Note: jdeclare_missing replaced the existing declared missing values for
#   Income. Previously declared codes dropped: -98 ["Don't know"].
#
#   This call changes dn50 only if you assign the result:
#     dn50 <- jdeclare_missing(dn50, Income, ...)
#
#   To change dn50 directly, rerun with modify = TRUE:
#     jdeclare_missing(dn50, Income, ..., modify = TRUE)

# Render 2 -- with modify = TRUE the header names the data frame and the
# closer is the save tip; the notice keeps its place between them.
dm50 <- dn50
jdeclare_missing(dm50, Income, codes = c(-99, -97), modify = TRUE)

# Expected:
#   Declared SPSS-style missing values on Income in dm50:
#     -99 ["Refused"]
#     -97 (no label; not present in the data)
#
#   Note: jdeclare_missing replaced the existing declared missing values for
#   Income. Previously declared codes dropped: -98 ["Don't know"].
#
#   To keep it across sessions, save the data frame:
#     jsave(dm50, "dm50.rds")

# Render 3 -- at the minimal level there is no reminder, and the notice
# takes its short form.
joutput("minimal", quiet = TRUE)
invisible(jdeclare_missing(dn50, Income, codes = c(-99, -97)))
joutput(NULL, quiet = TRUE)

# Expected:
#   Declared SPSS-style missing values on Income:
#     -99 ["Refused"]
#     -97 (no label; not present in the data)
#
#   Note: jdeclare_missing replaced the existing declared missing values on
#   Income. Dropped: -98.

options(.jst_options_missing_convention = NULL)
rm(dn50, dm50)

# Things to look at:
#   - RENDER 1 top to bottom: what the variable declares, what it lost, how
#     to keep the result. Does the reminder still read as belonging to the
#     declaration, now that a note sits between them?
#   - The body's "-97 (no label; not present in the data)" and the notice's
#     "dropped: -98" together are the whole story of a mistaken "add".
#     Does the pair make the mistake visible?


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# PART M -- a string variable's declared missing values (S340) ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Fix Slate 3 (v0.9.214). SPSS lets a STRING variable declare missing
# values, and a file from an agency often does:
#     MISSING VALUES Marital ('UNKNOWN', 'REF').
# haven reads such a variable as text whose declared values are text. Until
# this build jstats read every declaration as numbers, and a string variable
# that carried value labels -- declared missing values or none -- ended
# jload() on an error of the vctrs package, from its scan of suspected
# codes: "Can't convert `vec_data(x)` <character> to <double>". The frame
# had been assigned and the narrative printed by then, so the error read as
# a failed load of a file that had loaded.
#
# A declared string is now missing wherever a declared number is (cps_walk.R
# Part K has jfreq() and the analysis functions). This part is the load,
# convert and save side. The assertion side is missing_convention_check.R
# N82a-N82n.

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 51 -- a .sav with string variables loads, and says what it holds ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Sex is a labelled string with no declaration; Marital declares two strings,
# one of them labelled; Income declares a number, as the control.
joptions(missing.convention = "spss", quiet = TRUE)

st51 <- data.frame(Age = c(21, 34, 45, 23, 36, 52, 41, 29, 33, 40))
st51$Sex <- haven::labelled(rep(c("M", "F"), 5),
                            labels = c(Male = "M", Female = "F"))
st51$Marital <- haven::labelled_spss(
  c("UNKNOWN", "Married", "Single", "Married", "UNKNOWN", "Single",
    "Married", "Single", "REF", "Single"),
  labels = c(Refused = "REF"), na_values = c("UNKNOWN", "REF"))
st51$Income <- haven::labelled_spss(c(1, 2, -99, 3, 4, 5, -99, 2, 1, 3),
                                    labels = c(Refused = -99),
                                    na_values = -99)
f51 <- file.path(tempdir(), "st51.sav")
haven::write_sav(st51, f51)

# Render 1 -- the load. Until 0.9.214 this call ended on the vctrs error.
# missing.notice = TRUE asks for the full narrative whatever the session has
# loaded before (Section 5).
jload(f51, name = "ld51", overwrite = TRUE, missing.notice = TRUE)

# Expected:
#   Loaded ld51 (SPSS format; 10 cases, 4 variables)
#   2 variables have SPSS-style missing values:
#     Marital: REF ["Refused"], UNKNOWN (no label)
#     Income: -99 ["Refused"]
#   jstats analyses treat these codes as missing. Base R functions do not.
#   To make them missing in base R as well, convert:
#     jconvert(ld51, to = "baseR", modify = TRUE)

# Render 2 -- the same file with the declarations given up at the door.
jload(f51, name = "nd51", overwrite = TRUE, preserve.declarations = FALSE)

# Expected:
#   Loaded nd51 (SPSS format; 10 cases, 4 variables)
#   2 variables had SPSS-style missing values, converted to plain NA per
#   preserve.declarations = FALSE:
#     Marital: was REF ["Refused"], UNKNOWN (no label)
#     Income: was -99 ["Refused"]
#   To keep the declarations instead, reload with preserve.declarations = TRUE.

# The claim checked rather than taken from the message: the declared strings
# are NA, and the words are still words.
cat(paste(as.character(nd51$Marital), collapse = " "), "\n", sep = "")

# Expected:
#   NA Married Single Married NA Single Married Single NA Single

unlink(f51)
options(.jst_options_missing_convention = NULL)
rm(st51, ld51, nd51, f51)

# Things to look at:
#   - RENDER 1 ends where the narrative ends: no error under it. The
#     Marital line reads as the Income line does -- the value as stored, its
#     label in brackets or "(no label)". Until 0.9.214 it read
#     "Marital: NA (no label), NA (no label)".
#   - The suggested call is to = "baseR", where a frame of numeric
#     declarations is offered to = "stata" (Section 4): a declared string
#     has no Stata form (Section 52), so the Stata call would stop. Is
#     the plain-NA conversion the right thing to offer here?
#   - RENDER 2: the report names Marital's strings beside Income's code,
#     and the line under it shows the three cells as NA. Until 0.9.214
#     preserve.declarations = FALSE said "converted to plain NA", removed
#     the string's declaration, and left "UNKNOWN" and "REF" in the data as
#     ordinary words: the line read UNKNOWN Married Single Married UNKNOWN ...

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# SECTION 52 -- jconvert(): to base R they become NA; Stata and SAS cannot ----
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Stata's .a and SAS's .A are numeric missing values: neither program has a
# missing value for a string beyond the empty string, so there is nothing to
# convert a declared string TO. jconvert() says so before it changes
# anything. Until 0.9.214 this call met a second vctrs error.
joptions(missing.convention = "spss", quiet = TRUE)

st52 <- data.frame(Age = c(21, 34, 45, 23, 36, 52))
st52$Marital <- haven::labelled_spss(
  c("UNKNOWN", "Married", "Single", "Married", "REF", "Single"),
  labels = c(Refused = "REF"), na_values = c("UNKNOWN", "REF"))
st52$Income <- haven::labelled_spss(c(1, 2, -99, 3, 4, 5),
                                    labels = c(Refused = -99),
                                    na_values = -99)

# Render 1 -- to Stata: refused, the variable named, both ways out given.
tryCatch(jconvert(st52, to = "stata"),
         error = function(e) cat("Caught: ", conditionMessage(e), "\n",
                                 sep = ""))

# Expected:
#   Caught: jconvert(): Stata-style missing values need a numeric variable.
#
#   This variable in st52 is text, with declared missing values:
#     Marital
#
#   To convert a narrower set, leaving out the variable above:
#     jconvert(st52, to = "stata", vars = c(...), modify = TRUE)
#   Or turn it into a numeric variable first with jencode().

# Render 2 -- the first way out, run: the numeric variable converts.
cv52 <- jconvert(st52, to = "stata", vars = c("Age", "Income"))

# Expected:
#   Converted to Stata-style missing values in 1 variable:
#     Income  -99 ["Refused"]  -> .a
#
#   Skipped (no declared missing values found):
#     Age
#
#   This call changes st52 only if you assign the result:
#     st52 <- jconvert(st52, ...)
#
#   To change st52 directly, rerun with modify = TRUE:
#     jconvert(st52, ..., modify = TRUE)

# Render 3 -- to base R: nothing to refuse. A declared string becomes NA.
br52 <- jconvert(st52, to = "baseR")

# Expected:
#   Stripped the missing-value declarations from 2 variables:
#     Marital  REF ["Refused"]
#              UNKNOWN
#     Income   -99 ["Refused"]
#
#   This call changes st52 only if you assign the result:
#     st52 <- jconvert(st52, ...)
#
#   To change st52 directly, rerun with modify = TRUE:
#     jconvert(st52, ..., modify = TRUE)

cat(paste(as.character(br52$Marital), collapse = " "), "\n", sep = "")

# Expected:
#   NA Married Single Married NA Single

options(.jst_options_missing_convention = NULL)
rm(st52, cv52, br52)

# Things to look at:
#   - RENDER 1: one sentence of reason, the variable under it, then the two
#     ways out -- convert the rest, or make the variable numeric with
#     jencode(). Is "need a numeric variable" enough of a reason, or does it
#     want the fact above (Stata has no missing value for text)?
#   - The fix line names vars = c(...), since jconvert() cannot know which
#     of the other variables are wanted; Render 2 is the reader filling it
#     in. to = "sas" gives the same message with "SAS-style" (N82h).
#   - RENDER 3: the report lists Marital's strings beside Income's code,
#     and the line under it shows the two cells as NA. Until 0.9.214 the
#     report listed Marital's as "NA", removed the declaration, and left
#     "UNKNOWN" and "REF" in the data.



# --- Restore session state ---------------------------------------------------
# Moved here from mid-file at S248, so it runs after every part rather
# than after PART D only.

options(.jst_options_missing_convention = .entry_convention)
options(.jst_options_missing_convention_codes = .entry_codes)
options(.jst_missing_notice_shown = .entry_notice_shown)
options(.jst_default_data = .entry_default_data)
options(.jst_options_message_width = .entry_message_width)


# --- End marker --------------------------------------------------------------

cat("\n--- End of missing_convention_walk.R ---\n")
