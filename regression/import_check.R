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
#           Since v0.9.237 (section S; Fix Slate 12, ruling R21): jload()'s
#           header = and its stop on a format that carries its own names;
#           the note on names that are all numbers, with the header = FALSE
#           call; the note on rows and columns that may not be data -- a
#           sheet's empty rows, empty unnamed columns and footnotes by row
#           and column letter, a CSV file's line of commas, trailing comma
#           and write.csv() row numbers by line and column number; every
#           line jload() offers keeping the call (the multi-sheet note's
#           folder, skip =, header = FALSE); and the overwrite note of a
#           session that cannot ask, printed at the replacement.
#           Since v0.9.238 (section T; Fix Slate 13): the leading-digit stop
#           offers the name the cleaner gives (X2024), and the line runs; in
#           a session that asks, the overwrite question comes after every
#           check that can stop a load, and still before the read and the
#           multi-sheet note, the Loading line after the answer; the
#           multi-sheet note one sentence a line, and none with sheet =.
#           Since v0.9.239 (section U; Fix Slate 14): in a session that
#           asks, jsave()'s overwrite question comes after every check that
#           can stop a save -- a name the format refuses, a declared missing
#           value or a column type it cannot hold, Excel's sheet size, a
#           folder R cannot write to -- and still before the write, the .dta
#           note on SAS-style markers after the answer; a session that
#           cannot ask still stops on the file first; jload()'s sheet = and
#           skip = warnings one sentence a line, a jstats example dataset
#           named as one; and jsave()'s no-default stop, for a file named
#           alone or with file =, offering both routes, the one data frame
#           in the workspace named, the call's other arguments kept, each
#           line running.
#           Since v0.9.240 (section V; Fix Slate 15): jsave()'s front-door
#           stops -- a data argument not found, not evaluable, NULL or not a
#           data frame, and no file name -- give "for example:" and the call
#           on a line of its own, naming the one data frame in the workspace
#           (the not-found stop keeping the call's file); a file name typed
#           without its quotes gets ruling R18's pointer, as jload()'s;
#           jsave() with nothing and no default, both routes with the example
#           file; and where the session cannot ask, a file that exists stops
#           with one sentence a line and the path on a line of its own (U05
#           re-pinned).
#           Since v0.9.246 (section W; Slate E5, the S372 item): jload()'s
#           scan of a CSV file's text column -- the values that read as
#           missing reported and quoted, the jdeclare_missing() line quoted
#           with no menu, running under no convention and under stata, a
#           blank cell not reported, and no block for a column holding no
#           such word.
#           Since v0.9.254 (section X; ruling R31, Jeff's answers at S380):
#           a CSV file's cells read as written and each variable typed by
#           jstats's rule -- a leading zero or more than 15 digits keeps a
#           variable of numbers as text, with a note (the as.numeric() line
#           for a leading zero only); T and F alone stay text; the word NA
#           missing in a variable of numbers or TRUE/FALSE, a word in a
#           text variable, which the scan names; a file with none of these
#           shapes read exactly as read.csv() reads it; jsave()'s CSV round
#           trip of "0800" and "F". The note on a variable of numbers made
#           text by a few cells (at most five values, numbers in more than
#           half the cells; footnotes and, under header = FALSE, a first
#           cell that is a word not counted; in a sheet, only number cells
#           among text cells that are not numbers), its line with na =,
#           and no scan block for that variable. text = (bare, quoted, c(),
#           the file's name or the cleaned one, a name holding names; a name
#           the file lacks stops before the read and the question) and na =
#           for CSV and Excel files; both stop on any other format, in one
#           stop with header = FALSE; na = a number or a bare word stops.
#           Since v0.9.255 (section X, X14 rewritten and X23-X28; Fix Slate
#           24, the (S380) item and its rider): a sheet's variable of
#           numbers that also holds a number stored as text is named by the
#           note, with base R's lines in place of a reload -- its cells made
#           missing (== for one value, %in% for several), then as.numeric()
#           -- and no scan block; beside a variable the reload serves, the
#           reload first and its as.numeric() line after; a stored number
#           with a leading zero passes the variable over, to the scan. Every
#           as.numeric() line jload() offers puts back the label it gave a
#           renamed variable, CSV and sheet alike. Each line runs, with no
#           warning, and the offered lines' shape (.calls(), Z03) takes a
#           subscripted assignment.
#           Since v0.9.258 (section Y; Fix Slate 26, the (S382) item):
#           jsave()'s as.character() line for a factor with a category over
#           120 characters (.sav) and its as.POSIXct() line for a POSIXlt
#           column (.sav, .dta, .xpt) are each followed, where the variable
#           has a label, by the line that puts it back -- none for an empty
#           label or one that is not text, the label escaped; the lines run
#           as printed, with no warning, and the save then goes ahead with
#           the label in the file; a place's lines name the place, an
#           expression's name mydata after the line that makes it; the
#           minimal level unchanged; the long-category stop is SPSS
#           format's alone.
# ORIGIN:   S362 (v0.9.235). The tenth battery. Section R added S362, the
#           second build (v0.9.236). Section S added S365 (v0.9.237).
#           Section T added S366 (v0.9.238). Section U added S367
#           (v0.9.239). Section V added, U05 re-pinned, S368 (v0.9.240).
#           Section W added S373 (v0.9.246). Section X added S380
#           (v0.9.254); X14 rewritten and X23-X28 added S381 (v0.9.255).
#           Section Y added S384 (v0.9.258).
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
#           S365, two more, for section S, made the same way (openpyxl
#           3.1.5): datasets/import_blank_rows.xlsx, the import audit's
#           item 17 sheet -- number cells in column A with text cells below
#           them -- and datasets/import_offset.xlsx, data that do not start
#           in A1, where writexl always starts:
#               wb = openpyxl.Workbook(); ws = wb.active; ws.title = "Sheet1"
#               ws.append(["id", "age", None, "score"])
#               for r in [[1, 23, None, 4], [2, 35, None, 5], [3, 41, None, 3]]:
#                   ws.append(r)
#               ws.append([None] * 4)
#               for r in [[4, 29, None, 2], [5, 52, None, 5]]: ws.append(r)
#               ws.append([None] * 4)
#               ws.append(["Source: synthetic survey, 2024", None, None, None])
#               ws.append(["Note: * fewer than 5 cases", None, None, None])
#               wb.save("import_blank_rows.xlsx")
#               wb = openpyxl.Workbook(); ws = wb.active; ws.title = "Offset"
#               ws["A1"] = "Wave 2 survey"
#               for c, v in zip("BCE", ["id", "age", "score"]): ws[c + "3"] = v
#               for c, v in zip("BCE", [1, 23, 4]): ws[c + "4"] = v
#               for c, v in zip("BCE", [2, 35, 5]): ws[c + "6"] = v
#               ws = wb.create_sheet("Footnote")
#               for c, v in zip("BC", ["id", "age"]): ws[c + "1"] = v
#               for i, (a, b) in enumerate([(1, 23), (2, 35)], start=2):
#                   ws["B%d" % i] = a; ws["C%d" % i] = b
#               ws["A5"] = "Source: synthetic survey, 2024"
#               ws = wb.create_sheet("Far")
#               for c, v in zip("BCE", ["id", "age", "score"]): ws[c + "1"] = v
#               for i in range(2, 252):
#                   ws["B%d" % i] = i - 1; ws["C%d" % i] = 20 + i % 50
#                   ws["E%d" % i] = i % 7
#               ws["A253"] = "Source: synthetic survey, 2024"
#               wb.save("import_offset.xlsx")
#           Offset: a title in A1, the data in B3:E6 with D empty and row 5
#           empty. Footnote: the data in B1:C3, a footnote in A5. Far: the
#           data in B1:E251 with D empty, a footnote in A253 -- below the
#           200 rows jload() reads first to find where the data start.
#           S380, one more, for section X (and modify_form_walk.R Section
#           33), made the same way (openpyxl 3.1.5):
#           datasets/import_markers.xlsx -- number cells with text cells
#           among them, which writexl cannot write:
#               wb = openpyxl.Workbook(); ws = wb.active; ws.title = "Markers"
#               ws.append(["id", "Income", "Code", "Diag"])
#               inc  = [52000, "N/A", 61000, "-", ".", 48000, 55000, 47000,
#                       58000, 51000]
#               code = [7, 8, "9", 5, 4, "N/A", 3, 6, 2, 1]
#               diag = ["250.10", "250.00", "401.9", "250.1", "N/A",
#                       "250.10", "401.9", "250.00", "250.1", "401.9"]
#               for i in range(10):
#                   ws.append([i + 1, inc[i], code[i], diag[i]])
#               wb.save("import_markers.xlsx")
#           Income: number cells and the text cells N/A, - and .; Code:
#           number cells, one number stored as text ("9") and N/A; Diag:
#           text cells throughout.
#           S381, two more, for X23-X28 (and modify_form_walk.R Section
#           34), made the same way (openpyxl 3.1.5):
#               wb = openpyxl.Workbook(); ws = wb.active; ws.title = "Stored"
#               ws.append(["id", "Score no."])
#               score = [7, "8", "9", 5, "-", "N/A", 3, 6, 2, 1]
#               for i in range(10):
#                   ws.append([i + 1, score[i]])
#               wb.save("import_stored.xlsx")
#               wb = openpyxl.Workbook(); ws = wb.active; ws.title = "Stored2"
#               ws.append(["id", "A", "B", "PC", "ID", "Half"])
#               a  = [1, 2, "3", 4, "N/A", 6, 7, 8, 9, 10]
#               b  = [1, 2, 3, "4", 5, "-", 7, 8, 9, 10]
#               pc = [4000, 4101, "0800", 4006, "N/A", 4000, 4101, 4006,
#                     4000, 4101]
#               ids = [1001, 1002, 1003, "12345678901234567", 1005, 1006,
#                      "N/A", 1008, 1009, 1010]
#               half = [1, "2", "3", 4, "5", 6, "7", "8", 9, "N/A"]
#               for i in range(10):
#                   ws.append([i + 1, a[i], b[i], pc[i], ids[i], half[i]])
#               wb.save("import_stored2.xlsx")
#           datasets/import_stored.xlsx: "Score no." (renamed Score_no),
#           number cells, two numbers stored as text ("8", "9") and the text
#           cells - and N/A. datasets/import_stored2.xlsx: A and B, number
#           cells with one number stored as text and one N/A or -; PC,
#           postcodes as number cells with "0800" stored as text and N/A;
#           ID, number cells with a 17-digit ID stored as text and N/A;
#           Half, four number cells, five numbers stored as text and N/A.
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
#           Section S (v0.9.237, S365; 44 one-change mutants of the new
#           code, run detached, this battery on each): the format stop's
#           extension test S10; header = TRUE written out S06; Excel's
#           col_names and V names S04 S27; col.names S13b; the count most
#           lines hold S13 S14, compared S03 S12-S15 S24, returned S13b
#           S15; one column under header = FALSE S15; the read.csv2()
#           line S16; empty names S05 S07b; the number pattern S26; the
#           note's one-name form S08, its V1 to Vk S02, its six names S09,
#           its line S02 S03, its wording S02 S04 S08; none beside a title
#           note F01 S23 (S23 tested "is empty" and missed the mutant's
#           "are empty": fixed, the mutant run again, red); one-column
#           files S22; unnamed variables only B04 B05 C06 F05 I01 R02 S22
#           S25; row numbers in order S21b, the other variables' empty row
#           S21b; a number ends the footnotes S20b; "made text" only when
#           all are numbers S20b, only for number cells S18; the sheet's
#           row S17-S19b S23, its columns left of the data S19b; the CSV
#           names line S20 S20b S21b, a case quoted over two lines S20b;
#           a line of spaces S20b; one thing or several S18 S21 S24; "is"
#           or "are" S19-S23; the note's place C04 S17; the detector off
#           S17-S25; the multi-sheet line's overwrite = TRUE S27, the note
#           itself J04 S27; header = FALSE carried S02 S03 S27 S28, skip =
#           F01-F03 F06 F07 F09 S28, package = TRUE S11, the sheet stop's
#           skip = S28; the replaced note S29 (twice). ONE SURVIVOR, read
#           before recorded: the dataset clause of the format stop taken
#           out -- a jstats dataset has no extension, so the extension test
#           stops it on its own (an equivalent mutant; the clause chooses
#           the sentence).
#           Section T (v0.9.238, S366; 16 one-change mutants of the new
#           code, run detached, this battery on each and
#           missing_convention_check.R on the four that reach it, every one
#           red): the offered name with its digits stripped S28 T01 T02
#           (and N86j), by make.names() T01; the question before every check
#           T03 T04, between the CSV and the Excel checks T04, never asked
#           T05 T06, asked in every session S29; the Loading line always
#           first T06, never after the answer T06, only after the question's
#           place T06; the multi-sheet note before the question T05, its two
#           sentences on one line T07, for one sheet F02 F03, though sheet =
#           was given T07 (the round's one survivor, then: T07 gained the
#           case and the mutant was run again); the replaced note where the
#           question was answered T05, never S29; overwrite = TRUE ignored
#           (missing_convention_check.R N86bb N86bd N94ac N94ai). A first
#           M03 put the question above loading_line()'s definition and
#           stopped there -- red for the wrong reason; rewritten to the old
#           place proper, it reds T03 T04 alone.
#           Section U (v0.9.239, S367; 20 one-change mutants of the new
#           code, run detached, this battery on each and
#           missing_convention_check.R on the two that reach N86g, every one
#           red): the question before every check U01-U03, between the
#           pre-flight and Excel's size U03, the folder probe at its old
#           place after the question U03; never asked U04, asked in every
#           session U05; the cannot-ask stop below the checks U05; the .dta
#           note before the question U04; the sheet = warning's two
#           sentences on one line U06 (the round's one survivor, then: at
#           the pinned width the wrap broke the line where the fix does, so
#           U06 gained the width of 120 and the mutant was run again, red),
#           the skip = warning's U06; the dataset form dropped U07; MyData
#           always U08-U11, the first data frame of several U09, a hidden
#           one counted U09; the second route dropped U08-U11 and N86g, its
#           juse() line MyData U08-U11; the other arguments dropped U11,
#           file = dropped U11; the file = stop gone U11, firing under a
#           default U12; the file-name stop's old one route U08-U11 and
#           N86g.
#           Section V (v0.9.240, S368; 15 one-change mutants of the new
#           code, run detached, this battery on each and
#           missing_convention_check.R on the three that reach N86i, every
#           one red): the call's file kept under every stop V03 N86i, under
#           none V03-V05; the example's frame always MyData V03-V05; the
#           not-found, not-evaluable, NULL and not-a-data-frame examples
#           back on the sentence's line V03 (the last N86i too); the
#           existing-file stop's old sentence U05 V01 V02, its path not
#           indented U05 V01 V02; the unquoted pointer rebuilding the wrong
#           argument V06; jsave() with nothing reaching the resolver V08
#           V09, its headings the file-alone stop's V08, its example file
#           another V08 V09; the no-filename example naming MyData V07 V09,
#           an expression pasted where mydata goes V07.
#           Section W (v0.9.246, S373; of Slate E5's forty-four one-change
#           mutants, run detached, the three that reach this battery, each
#           red here and in missing_convention_check.R): "not stated" out of
#           the word list W01 W02; the scan skipping a text variable W01
#           W02; its line's values unquoted W01 W02. The full map is in
#           missing_convention_check.R's S373 entry.
#           Section X (v0.9.254, S380; 38 one-change mutants of the new
#           code, run detached, this battery on each, every one red): the
#           read as text taken out (49 checks, X01-X10 among them), no value
#           read as missing X06 X15 X18; the leading-zero pattern X02, the
#           digit count X03 (a survivor until X03b gained a 15-digit value
#           with a space before it: the 16-byte pre-filter had shadowed
#           the pattern); T and F X05 X07; NA not made missing before
#           typing S21 X04 X06 X08 X10 X18, nor in a kept variable X04, nor
#           a blank X04; "more than half" X11 S20, five values X11; NA
#           counted as a cell X09 X22, NA left in a variable named X09;
#           footnotes counted X12; the header = FALSE first-word rule X13;
#           the sheet's cell check gone X14, its number-stored-as-text test
#           X14; the scan's block back X09; the CSV text = check before the
#           question X16; the cleaned name X15, a name holding names X15;
#           text = variables under na = in a sheet X17, na = not passed to
#           readxl X14 X17, the text read not spliced X17, a sheet's text =
#           variable in the note X17 (a survivor until X17 gained the case);
#           the line's na = X09 X10 X14 X22, its text = X22, na = given kept
#           X10 X22; the format stop's text = and na = X19; na = unchecked
#           X20, the bare word X20; an as.numeric() line for a long ID X03
#           X04; "starts" X04; numerals = "no.loss" X03 X04 X08 (a decimal
#           of 17 digits); text = variables typed X15; na = not applied
#           X10 X18; the kept note gone X01-X04. Two lines no mutant could
#           red were DELETED from the master, not mapped: a test that every
#           value was a word (the count test below it already returned) and
#           the footnote run's stop at the first case (a run that long
#           leaves the first variable no numbers).
#           Section X, S381 (v0.9.255; Fix Slate 24; 22 one-change mutants
#           of the new code, run detached, this battery on each, 21 red):
#           the stored number's skip put back X14 X17 X23 X24 X25; the
#           leading-zero guard X25 X26, the digit-count guard X23 X25 X26;
#           stored counted as none X14 X17 X23 X24 X25; the one-variable
#           form's values line X23 X24, its reload in place of the lines X17
#           X23 X24, its count X24; the mixed form given values lines X14,
#           its reload dropped X14, "a number" X14; the form for all stored
#           X25; == always %in% X23 X25; the label line X24 X27, no label
#           read X24 X27, the label unescaped X27 Z03, the kept note given
#           no labels X27, the marker note given none X24, the kept lines
#           joined X27; the scan keeping a stored variable X14 X23; the
#           values from every text cell X14 X23 X24 X25; "more than half"
#           over the words alone X23 X25 X28. One survivor, EQUIVALENT, not
#           a gap: the counts tabulated over every text cell rather than the
#           words (factor() with the words as levels drops the numbers, so
#           the counts are the same).
#           Section Y (v0.9.258, S384; Fix Slate 26; 11 one-change mutants
#           of the new code, run detached, this battery on each and
#           format_check.R on the one that reaches it, every one red): the
#           factor's label line dropped Y01 Y02 Y03 Y08 Y09, put before its
#           as.character() line Y01 Y02 Y03 Y08 Y09, taken from the first
#           long factor Y01 Y02; the label unescaped X27 Y03 Z03 (and
#           format_check.R's AB tests); the POSIXlt label line dropped Y05-Y09,
#           naming the column without its data frame Y05-Y09; the labels
#           not passed from jsave() Y05-Y09, not matched to the POSIXlt
#           columns Y07; the minimal level given the lines Y07 Z03; the .sav
#           guard dropped Y10; the moved check returning nothing M08 Y01-Y04
#           Y08 Y09.
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
# S386 EDIT (v0.9.259, 2026-10-21): Y11-Y15 ADDED (the (S384) item, ruled
#           S386): given an expression and two or more things to fix,
#           jsave()'s stop makes mydata once, under the header, and closes
#           on the save on mydata (clean.names = TRUE where a part names
#           variables the format refuses). Y11 pins the .sav three-part
#           message; Y12 runs its lines top to bottom and then the closing
#           save (the S384 undo gone); Y13 pins the .dta form whose second
#           part has two routes and runs the first route to a save (.calls()
#           reads the type list's row "  t (POSIXlt)" as t(), so the
#           assignments come through .Ylines()); Y14 what keeps its form --
#           a name, a place, one part (S352), the minimal level; Y15 the
#           sentence above the line, which names the data frame the copy is
#           made from (Jeff's wording at the walk: "The fixes shown below
#           work on a copy of your x36 data frame."), "your data" when the
#           expression names none. On v0.9.258 Y11-Y13 and Y15 are red and
#           Y14 green.
#           Sandbox: 198/198, run_all.R 3165 across ten, plain and under the
#           RStudio-handler stand-in, each again with a Windows-length temp
#           path, once with interactive() TRUE (0 "Overwrite?"), and entered
#           dirty (plain and under the stand-in, workspace objects also named
#           nf, src, src2, p and q): green, nothing changed. 198 checks.
#           LAST VERIFIED: v0.9.259, 2026-10-21 (S386) -- 198/198 on the
#           WORKSTATION through receive_all() ("ALL BATTERIES GREEN (10 run,
#           3165 checks)"; R CMD check 0 errors, 0 warnings, 0 notes),
#           matching the sandbox: the build's second receive, with Jeff's
#           wording and Y15; the first read 197/197 (3164 checks).
# S384 EDIT (v0.9.258, 2026-10-21): SECTION Y ADDED (Fix Slate 26, the
#           (S382) item), 10 checks: jsave()'s as.character() line for a
#           factor with a category over 120 characters (.sav) and its
#           as.POSIXct() line for a POSIXlt column (.sav, .dta, .xpt) are
#           each followed, where the variable has a label, by the line that
#           puts it back. The pinned messages were filled by running (the
#           S339 rule), at the 76-column width. .Ylines() keeps a message's
#           assignment lines: .calls() also reads the type list's row
#           "  t (POSIXlt)", which is not a line to run, as a call to t().
#           Y09 gives the data as an expression one part at a time: with two
#           parts, each opens on its own "mydata <- ..." line, so running
#           both parts top to bottom undoes the first part's fix -- found
#           here, older than this build (v0.9.257 does the same), and
#           reported for the to-do. Sandbox: 193/193, run_all.R 3151 across
#           ten, plain and under the RStudio-handler stand-in, each again
#           with a 68-character temp path, once with interactive() TRUE (0
#           "Overwrite?"), and entered dirty (joutput("full") with
#           diagnostics, width 101, a juse() default, a stata convention,
#           jstats.color = TRUE, stored jsubset(), jcomplete(), jdummy() and
#           jnumeric() settings on a frame of its own, the load-notice flag,
#           workspace objects named like its working objects -- g, e, m, p,
#           q, f, s, h, a, b, k, x, cl, ws, r, md, mx -- and like the
#           fixtures' variables and frames -- g1, g2, t, u, z, id, lst, src,
#           mydata), plain and under the stand-in: green, nothing changed.
#           On v0.9.257 Y01-Y03 and Y05-Y09 are red; Y04 and Y10 hold what
#           did not change.
#           LAST VERIFIED: v0.9.258, 2026-10-21 (S384) -- 193/193 on the
#           WORKSTATION through receive_all() ("ALL BATTERIES GREEN (10 run,
#           3151 checks)"; R CMD check 0 errors, 0 warnings, 0 notes),
#           matching the sandbox.
# S381 EDIT (v0.9.255, 2026-10-20): X14 REWRITTEN, X17 AMENDED, X23-X28
#           ADDED (Fix Slate 24: the (S380) item, a sheet's number stored as
#           text, and its rider, the label line), with the fixtures
#           datasets/import_stored.xlsx and import_stored2.xlsx (their recipe
#           under FIXTURES). X14: Code, beside a number stored as text, now
#           shares Income's note, its as.numeric() line after the reload; the
#           scan names Diag alone. X17: with text = Income, Code is in the
#           note. .calls() and Z03's shape take an assignment to a subscript
#           (k$A[k$A == "N/A"] <- NA); .runw(), new, returns the warnings
#           the offered lines raise, so each check of them asks for none.
#           Sandbox: 183/183, run_all.R 3130 across ten, plain and under the
#           RStudio-handler stand-in, each again with a 65-character temp
#           path, once with interactive() TRUE (0 "Overwrite?"), and entered
#           dirty (joutput("full") with diagnostics, width 101, a juse()
#           default, a stata convention, jstats.color = TRUE, stored
#           jsubset(), jcomplete(), jdummy() and jnumeric() settings on a
#           frame of its own, the load-notice flag, workspace objects named
#           like its working objects -- k, kb, e, f, m, mb, x, ws, cl, p --
#           and like the fixtures' variables -- Code, Score_no, A, B, PC, ID,
#           Half, Post_code, Zip_new, Plain), plain and under the stand-in:
#           green, nothing changed.
#           LAST VERIFIED: v0.9.255, 2026-10-20 (S381) -- 183/183 on the
#           WORKSTATION through receive_all() ("ALL BATTERIES GREEN (10 run,
#           3130 checks)"; R CMD check 0 errors, 0 warnings, 0 notes),
#           matching the sandbox.
# S380 EDIT (v0.9.254, 2026-10-20): SECTION X ADDED (ruling R31), 22
#           checks, and the fixture datasets/import_markers.xlsx (its recipe
#           under FIXTURES). FIRST WORKSTATION RUN: the receive stopped at
#           X11, which loaded three files under one name, k: in Jeff's
#           session the second load asked jload()'s overwrite question and
#           waited. The sandbox's R --interactive run had answered the same
#           question "no" by itself, so X11 passed there with two of its
#           three files never read -- a check that could not fail, and the
#           run's "Overwrite?" lines were not read. X11 now gives each file
#           a name of its own and checks all three were read; section X's
#           checks keep the scan's printed report out of the battery's
#           output (.gx(): grab() inside capture.output()). Sandbox: the
#           interactive run asks no question (0 "Overwrite?"), X11 red on
#           both of its mutants.
#           LAST VERIFIED: v0.9.254, 2026-10-20 (S380) -- 177/177 on the
#           WORKSTATION through receive_all() ("ALL BATTERIES GREEN (10 run,
#           3124 checks)"; R CMD check 0 errors, 0 warnings, 0 notes),
#           matching the sandbox. SANDBOX: 177/177, run_all.R 3124 across
#           ten, plain and under the RStudio-handler stand-in, each again
#           with a 58-character temp path, once with interactive() TRUE,
#           and entered dirty (joutput("full") with diagnostics, width 101,
#           a juse() default, a stata convention, jstats.color = TRUE,
#           stored jsubset(), jcomplete(), jdummy() and jnumeric() settings
#           on a frame of its own, the load-notice flag, workspace objects
#           named like its working objects -- k, e, f, m, x, k2, cols15 --
#           and like the fixtures' variables -- Postcode, Diag, Income),
#           plain and under the stand-in: green, nothing changed.
# S379 EDIT (v0.9.253, 2026-10-20): GUARD 1 WIDENED (Scripts Slate D, the
#           (S378) item). The jsubset(), jcomplete(), jdummy() and
#           registration stores and the once-a-session load-notice flag
#           (.jst_filter, .jst_complete, .jst_dummy, .jst_registry,
#           .jst_missing_notice_shown) are recorded at Setup and handed
#           back at the foot, an unset one unset: Setup clears the stores,
#           so a session that sourced this file lost its own settings.
#           No check changed. Sandbox: every battery entered dirty with a
#           stored filter, jcomplete(), jdummy() and jnumeric() on a frame
#           of the session's own and the flag set, beside the S378 dirty
#           items: all green, no option and no workspace value changed.
#           LAST VERIFIED: v0.9.253, 2026-10-20 (S379) -- 155/155 on the
#           WORKSTATION through receive_all() ("ALL BATTERIES GREEN (10 run,
#           3102 checks)"; R CMD check 0 errors, 0 warnings, 0 notes),
#           matching the sandbox.
# LAST VERIFIED: v0.9.247, 2026-10-19 (S374) -- 155/155 on the WORKSTATION
#           through receive_all() ("ALL BATTERIES GREEN (10 run, 3016
#           checks)"; R CMD check 0 errors, 0 warnings, 0 notes). T01
#           re-pinned: "Provide a name, for example:" (Fix Slate 21's layout
#           item); mutant: the stop back to "e.g." T01, red.
# LAST VERIFIED: v0.9.246, 2026-10-18 (S373) -- 155/155 on the WORKSTATION
#           through receive_all() ("ALL BATTERIES GREEN (10 run, 2993
#           checks)"; R CMD check 0 errors, 0 warnings, 0 notes); GitHub
#           9d5825f (package). Builds S369-S372 left this file unchanged
#           and ran it green through receive_all(), last at v0.9.245
#           (152/152).
# EARLIER:  v0.9.240, 2026-10-17 (S368) -- 152/152 on the WORKSTATION
#           through receive_all() ("ALL BATTERIES GREEN (10 run, 2871
#           checks)"; R CMD check 0 errors, 0 warnings, 0 notes); GitHub
#           d62f372 (package). Section V reads a stand-in workspace and
#           takes the existing-file stop from section U's copy, so it runs
#           there as in the sandbox.
# EARLIER:  v0.9.239, 2026-10-17 (S367) -- 143/143 on the WORKSTATION
#           through receive_all() ("ALL BATTERIES GREEN (10 run, 2853
#           checks)"; R CMD check 0 errors, 0 warnings, 0 notes); GitHub
#           6e35be6 (package). Section U asks its question of a copy of
#           jsave() and reads a stand-in workspace, so it runs there as in
#           the sandbox.
# EARLIER:  v0.9.238, 2026-10-17 (S366) -- 131/131 on the WORKSTATION
#           through receive_all() ("ALL BATTERIES GREEN (10 run, 2841
#           checks)"; R CMD check 0 errors, 0 warnings, 0 notes); GitHub
#           9ab5efa (package). S29 passes there as asked (interactive()
#           TRUE); section T asks its question of a copy of jload(), so it
#           runs there as in the sandbox.
# SANDBOX:  v0.9.246, 2026-10-18 (S373) -- 155/155, run_all.R 2993
#           across ten, plain and under the RStudio-handler stand-in, each
#           again with a 59-character temp path, once with interactive()
#           TRUE, and entered dirty (as missing_convention_check.R's S373
#           entry lists), plain and under the stand-in: green, nothing
#           changed. On v0.9.245 W01 and W02 red (W03, a control, passes).
# EARLIER:  v0.9.240, 2026-10-17 (S368) -- 152/152, run_all.R 2871
#           across ten, plain and under the RStudio-handler stand-in, each
#           again with a 36-character temp path, once with interactive()
#           TRUE, and entered dirty (joutput("full") with diagnostics, width
#           100, a juse() default, a stata convention, jstats.color = TRUE,
#           workspace objects named like its working objects -- d1, x, n0,
#           fname, Bad), plain and under the stand-in: green, nothing
#           changed. Section V and U05 red on v0.9.239, every check. V01-V02
#           take the existing-file stop from section U's copy in a session
#           that cannot ask, so they run the same in every session; V02's
#           path is longer than the line wherever the temporary folder is.
#           Before it: v0.9.239 (S367), 143/143 the same five ways.
# EARLIER:  v0.9.239, 2026-10-17 (S367) -- 143/143, run_all.R 2853
#           across ten, plain and under the RStudio-handler stand-in, each
#           again with a 35-character temp path, once with interactive()
#           TRUE, and entered dirty (joutput("full") with diagnostics, width
#           110, a juse() default, a stata convention, jstats.color = TRUE,
#           workspace objects named like its working objects), plain and
#           under the stand-in: green, nothing changed. Section U red on
#           v0.9.238 where it should be (U01-U03 U06-U11; U04, U05 and U12
#           hold what did not change). Section U asks its question of a
#           copy of jsave(), the same everywhere; its stops read a stand-in
#           workspace, so what the global environment holds cannot move
#           them. U10 names its file bare, data.dir the fixture folder for
#           the check: with the 35-character temp path, a first draft that
#           named the file by its path put the whole path in the stop's
#           first line, past 76 columns (Z01).
#           Before it: v0.9.238 (S366), 131/131 the same five ways.
# EARLIER:  v0.9.237, 2026-10-17 (S365) -- 124/124 on the WORKSTATION
#           through receive_all() ("ALL BATTERIES GREEN (10 run, 2834
#           checks)"; R CMD check 0 errors, 0 warnings, 0 notes); GitHub
#           9ac3314 (package). S29 passes there as asked (interactive()
#           TRUE); the sandbox's runs are the ones that check it.
# EARLIER:  v0.9.236, 2026-10-17 (S362) -- 90/90 on the WORKSTATION
#           through receive_all() ("ALL BATTERIES GREEN (10 run, 2800
#           checks)"; R CMD check 0 errors, 0 warnings, 0 notes); GitHub
#           b3e9e2b (package). Jeff opened jsave()'s CSV file in Excel on
#           Windows: Muller, Cafe and Don't know as typed, accents and the
#           curly apostrophe intact (section R's case, which no battery
#           can see). In the SANDBOX (the second build): 90/90, run_all.R
#           2800 across ten, plain and under the RStudio-handler stand-in,
#           each again with a 35-character temp path, once with
#           interactive() TRUE, and entered dirty: green, nothing changed.
#           On the workstation before it: v0.9.235, 84/84 (S362, second
#           delivery).
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
# The stored settings too (S379; Scripts Slate D, the (S378) item): Setup
# clears the jsubset(), jcomplete(), jdummy() and registration stores so
# every check starts clean, and a jload() sets the once-a-session notice
# flag; a session that sources this file gets its own back at the foot.
# An option that was unset comes back unset.
.entry_stores <- lapply(stats::setNames(nm = c(".jst_filter", ".jst_complete",
                                              ".jst_dummy", ".jst_registry",
                                              ".jst_missing_notice_shown")),
                        getOption)
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
# Since S381 an assignment to a subscript counts (k$A[k$A == "N/A"] <- NA,
# the first of the lines the note on a few cells gives a number stored as
# text); the same shape in Z03 below.
.calls <- function(m) {
  ls <- strsplit(m, "\n", fixed = TRUE)[[1]]
  shape <- "^ {2,}[A-Za-z.][A-Za-z0-9._]*(\\$[A-Za-z0-9._]+)*(\\[[^]]*\\])? *(\\(|<- )"
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

# --- S: header =, names that are all numbers, and what may not be data -------

# v0.9.237 (S365; Fix Slate 12, ruling R21). A CSV file or a sheet with no
# names row lost its first case to the names (1 -> X1); a sheet's empty rows,
# empty unnamed column and footnotes -- and a CSV file's line of commas,
# trailing comma and write.csv() row numbers -- loaded as data; nothing said
# so. jload() gains header = (ruling R21, Jeff, S364), and each case gets a
# note (the S362 leans). Two fixtures R cannot write, in the datasets folder:
# import_blank_rows.xlsx and import_offset.xlsx (the header says how they
# were made). The rider: every line jload() offers keeps the call.
.ix_w("nohead.csv", c("1,23,4", "2,35,5", "3,41,3"))
writexl::write_xlsx(data.frame(a = c(1, 2, 3), b = c(23, 35, 41), c = c(4, 5, 3)),
                    .ix("nohead.xlsx"), col_names = FALSE)
.mS <- grab(jload(.ix("nohead.csv"), name = ".xS", overwrite = TRUE))

check("S01 header = must be TRUE or FALSE",
      all(vapply(list(NA, "no", 0, c(TRUE, FALSE), NULL), function(v)
        identical(grab(jload(.ix("nohead.csv"), name = ".hk", header = v)),
                  "jload(): `header` must be TRUE or FALSE."), logical(1))))
check("S02 a CSV file with no names row: a note before the name note says the line may be the first case and gives the call with header = FALSE (the case had become the names without a word)",
      identical(.fl(.note(.mS, "every variable name")), .fl(paste0(
        "Note: every variable name read from nohead.csv is a number (1, 23, 4), so ",
        "the line they came from may be the first case rather than the names.\n",
        "To read that line as a case, with the variables named V1, V2, and V3:\n",
        "  jload(\"<DIR>/nohead.csv\", name = \".xS\", overwrite = TRUE, header = FALSE)\n",
        "\n",
        "Note: 3 variable names were changed to valid R names:\n",
        "  \"1\"   -> X1\n",
        "  \"23\"  -> X23\n",
        "  \"4\"   -> X4\n",
        "The original names are the variables' labels.\n"))) &&
        exists(".xS") && nrow(.xS) == 2L)
check("S03 ... the offered call runs, over the frame the first read made: 3 cases, V1 to V3, the numbers as read",
      local({ cl <- .calls(.mS); e <- new.env()
        assign(".xS", "made by the first read", envir = e)
        length(cl) == 1L && { invisible(grab(eval(cl[[1]], e))); TRUE } &&
          identical(names(e$.xS), c("V1", "V2", "V3")) &&
          identical(e$.xS$V2, c(23L, 35L, 41L)) }))
check("S04 ... an Excel sheet with no names row: the same note (\"row\" where a CSV file has \"line\"); header = FALSE reads row 1 as a case",
      local({ m <- .fl(grab(jload(.ix("nohead.xlsx"), name = "k", overwrite = TRUE)))
        grepl("every variable name read from nohead.xlsx is a number (1, 23, 4), so the row they came from may be the first case rather than the names. To read that row as a case", m, fixed = TRUE) &&
          { invisible(grab(jload(.ix("nohead.xlsx"), name = "k", header = FALSE,
                                 overwrite = TRUE)))
            identical(names(k), c("V1", "V2", "V3")) && identical(k$V1, c(1, 2, 3)) } }))
check("S05 ... an empty name does not stop the note (a first case with a missing value has one): \"is a number or empty\"",
      local({ .ix_w("gap1.csv", c("1,,3", "4,5,6"))
        m <- .fl(grab(jload(.ix("gap1.csv"), name = "k", overwrite = TRUE)))
        grepl("every variable name read from gap1.csv is a number or empty (1, \"\", 3), so", m, fixed = TRUE) }))
check("S06 ... header = TRUE written out says the numbers are names: no note, the name note as before",
      local({ m <- grab(jload(.ix("nohead.csv"), name = "k", header = TRUE, overwrite = TRUE))
        !grepl("every variable name", m, fixed = TRUE) &&
          grepl("Note: 3 variable names were changed", m, fixed = TRUE) && nrow(k) == 2L }))
check("S07 ... a name that is not a number beside years: no note",
      local({ .ix_w("years.csv", c("id,2019,2020", "1,5,6"))
        !grepl("every variable name",
               grab(jload(.ix("years.csv"), name = "k", overwrite = TRUE)), fixed = TRUE) }))
check("S07b ... a names line of nothing but commas: no note (no name is a number)",
      local({ .ix_w("allempty.csv", c(",,", "1,2,3"))
        !grepl("every variable name",
               grab(jload(.ix("allempty.csv"), name = "k", overwrite = TRUE)), fixed = TRUE) }))
check("S08 ... one name: \"the variable name ... is a number\" and \"the variable named V1\"",
      local({ .ix_w("one5.csv", c("5", "7", "9"))
        m <- .fl(grab(jload(.ix("one5.csv"), name = "k", overwrite = TRUE)))
        grepl("Note: the variable name read from one5.csv is a number (5), so the line it came from may be the first case rather than a name.", m, fixed = TRUE) &&
          grepl("with the variable named V1:", m, fixed = TRUE) }))
check("S09 ... eight names: the first six and a count; \"V1 to V8\"",
      local({ .ix_w("wide8.csv", c(paste(1:8, collapse = ","), paste(11:18, collapse = ",")))
        m <- .fl(grab(jload(.ix("wide8.csv"), name = "k", overwrite = TRUE)))
        grepl("is a number (1, 2, 3, 4, 5, 6 and 2 more), so", m, fixed = TRUE) &&
          grepl("named V1 to V8:", m, fixed = TRUE) }))
check("S10 header = FALSE on a format that carries its own names stops before anything is loaded, with the call that runs; header = TRUE there passes",
      local({ haven::write_sav(data.frame(a = 1:2), .ix("hs.sav"))
        m <- grab(jload(.ix("hs.sav"), name = "hs10", header = FALSE))
        identical(.fl(m), .fl(paste0(
          "jload(): header = FALSE is only for Excel format (.xlsx, .xls) and CSV ",
          "format (.csv).\n",
          "hs.sav is in SPSS format (.sav), which carries its own variable names.\n",
          "To load it, drop header = FALSE:\n",
          "  jload(\"<DIR>/hs.sav\", name = \"hs10\")"))) &&
          !exists("hs10", inherits = FALSE) &&
          { e <- new.env(); invisible(grab(eval(.calls(m)[[1]], e)))
            exists("hs10", envir = e, inherits = FALSE) } &&
          { invisible(grab(jload(.ix("hs.sav"), name = "hs10", header = TRUE,
                                 overwrite = TRUE)))
            exists("hs10", inherits = FALSE) } }))
check("S11 ... a .dta file, an .rds file and a jstats dataset the same, the dataset's line keeping package = TRUE",
      local({ haven::write_dta(data.frame(a = 1:2), .ix("hs.dta"))
        saveRDS(data.frame(a = 1:2), .ix("hs.rds"))
        m1 <- .fl(grab(jload(.ix("hs.dta"), name = "k", header = FALSE)))
        m2 <- .fl(grab(jload(.ix("hs.rds"), name = "k", header = FALSE)))
        m3 <- .fl(grab(jload("community", name = "k", package = TRUE, header = FALSE)))
        grepl("hs.dta is in Stata format (.dta), which carries its own variable names.", m1, fixed = TRUE) &&
          grepl("hs.rds is in R format (.rds), which carries its own variable names.", m2, fixed = TRUE) &&
          grepl("community is a jstats example dataset, which carries its own variable names. To load it, drop header = FALSE: jload(\"community\", name = \"k\", package = TRUE)", m3, fixed = TRUE) &&
          !exists("k", inherits = FALSE) }))
check("S12 header = FALSE with skip =: the lines above skipped, then every line a case",
      local({ .ix_w("skipnh.csv", c("Scores, 2024", "", "1,23,4", "2,35,5"))
        invisible(grab(jload(.ix("skipnh.csv"), name = "k", skip = 2, header = FALSE,
                             overwrite = TRUE)))
        identical(names(k), c("V1", "V2", "V3")) && identical(k$V1, 1:2) }))
check("S13 header = FALSE measures each line against the count most lines hold: a short first line is a case with its last cells empty; a long line past the first five stops (R would have split it)",
      local({ .ix_w("short1.csv", c("1,2", "3,4,5", "6,7,8", "9,10,11"))
        invisible(grab(jload(.ix("short1.csv"), name = "k", header = FALSE, overwrite = TRUE)))
        .ix_w("late.csv", c("1,2", "3,4", "5,6", "7,8", "9,10", "11,12,13", "14,15"))
        m <- grab(jload(.ix("late.csv"), name = "k2", header = FALSE))
        nrow(k) == 4L && identical(k$V3, c(NA, 5L, 8L, 11L)) &&
          identical(.fl(m), .fl(paste0(
            "jload(): line 6 of late.csv holds 3 values, but most lines hold 2, so R ",
            "would split it into two cases.\n",
            "Correct that line of the file, then run jload() again."))) &&
          !exists("k2", inherits = FALSE) }))
check("S13b ... five short lines, then more lines of a larger count: that count's variables, nothing split (read.csv() counts only the first five lines)",
      local({ .ix_w("five.csv", c(rep("1,2", 5), rep("3,4,5", 6)))
        invisible(grab(jload(.ix("five.csv"), name = "k", header = FALSE, overwrite = TRUE)))
        identical(dim(k), c(11L, 3L)) && identical(k$V3, c(rep(NA, 5), rep(5L, 6))) }))
check("S14 ... several long lines, listed",
      local({ .ix_w("late2.csv", c("1,2", "3,4", "5,6,7", "8,9", "10,11,12", "13,14"))
        grepl("lines 3 and 5 of late2.csv hold more values than most lines (2), so R would split each into two cases.",
              .fl(grab(jload(.ix("late2.csv"), name = "k", header = FALSE))), fixed = TRUE) }))
check("S15 ... a one-column file read with header = FALSE keeps its empty lines as cases (Session 351)",
      local({ .ix_w("onenh.csv", c("a", "", "b", "c"))
        invisible(grab(jload(.ix("onenh.csv"), name = "k", header = FALSE, overwrite = TRUE)))
        identical(k$V1, c("a", "", "b", "c")) }))
check("S16 ... a semicolon file stops as before, its read.csv2() line carrying skip = and header = FALSE, and running",
      local({ .ix_w("seminh.csv", c("Wave 2", "1;23;4,5", "2;35;5,25"))
        m <- grab(jload(.ix("seminh.csv"), name = ".s16", skip = 1, header = FALSE))
        cl <- .calls(m); e <- new.env()
        grepl(".s16 <- read.csv2(\"<DIR>/seminh.csv\", skip = 1, header = FALSE)", .fl(m), fixed = TRUE) &&
          length(cl) == 1L && { eval(cl[[1]], e); identical(dim(e$.s16), c(2L, 3L)) } }))

.mS2 <- grab(jload(file.path(.ix_data, "import_blank_rows.xlsx"), name = ".xS2",
                   overwrite = TRUE))
check("S17 the import audit's sheet: its empty rows, footnotes and empty column named by row and column in one note, before the name note; nothing removed (they had loaded as cases and a variable without a word)",
      identical(.fl(.note(.mS2, "rows 5")), .fl(paste0(
        "Note: rows 5 and 8 of import_blank_rows.xlsx (cases 4 and 7) are empty.\n",
        "Rows 9 and 10 (cases 8 and 9) have text in the first column only, below the ",
        "data, so they may be footnotes.\n",
        "Because of them, id was read as text.\n",
        "Column C (V3) has no name and is empty.\n",
        "They were read as data, and nothing was removed.\n",
        "To leave them out, delete them from the file and load the file again.\n",
        "\n",
        "Note: 1 variable name was changed to a valid R name:\n",
        "  \"\"  -> V3\n"))) &&
        exists(".xS2") && identical(dim(.xS2), c(9L, 4L)))
check("S18 ... digits stored as text in Excel beside a footnote: the footnote named, but not said to have made the variable text (it was text in the sheet)",
      local({ writexl::write_xlsx(data.frame(id = c("1", "2", "Source: a survey"),
                                             age = c(23, 35, NA)), .ix("astext.xlsx"))
        m <- .fl(grab(jload(.ix("astext.xlsx"), name = "k", overwrite = TRUE)))
        grepl("Note: row 4 of astext.xlsx (case 3) has text in the first column only, below the data, so it may be a footnote. It was read as data", m, fixed = TRUE) &&
          !grepl("was read as text", m, fixed = TRUE) }))
check("S19 ... a sheet whose data start in B3 below a title, read with skip = 2: the row and the column as the sheet has them (column D, not C); a footnote in column A beside data in B and C",
      local({ f <- file.path(.ix_data, "import_offset.xlsx")
        m1 <- .fl(grab(jload(f, name = "k", sheet = "Offset", skip = 2, overwrite = TRUE)))
        m2 <- .fl(grab(jload(f, name = "k", sheet = "Footnote", overwrite = TRUE)))
        grepl("Note: row 5 of import_offset.xlsx (case 2) is empty. Column D (V3) has no name and is empty. They were read as data", m1, fixed = TRUE) &&
          grepl("Note: row 4 of import_offset.xlsx (case 3) is empty. Row 5 (case 4) has text in the first column only, below the data, so it may be a footnote. They were read", m2, fixed = TRUE) }))
check("S19b ... a footnote in column A below row 200 beside data in B to E: column D, not E (one cell left of the data, found down the whole sheet, moves the first column)",
      grepl("Note: row 252 of import_offset.xlsx (case 251) is empty. Row 253 (case 252) has text in the first column only, below the data, so it may be a footnote. Column D (V4) has no name and is empty.",
            .fl(grab(jload(file.path(.ix_data, "import_offset.xlsx"), name = ".s19",
                           sheet = "Far", overwrite = TRUE))), fixed = TRUE))
check("S20 the CSV kin: a line of commas and Excel's quoted footnotes, by line, and the variable they made text",
      local({ .ix_w("foot.csv", c("id,age,grp", "1,23,a", ",,", "2,35,b",
                                  "\"Source: synthetic survey, 2024\",,",
                                  "\"Note: * fewer than 5 cases\",,"))
        m <- grab(jload(.ix("foot.csv"), name = "k", overwrite = TRUE))
        identical(.fl(.note(m, "line 3")), .fl(paste0(
          "Note: line 3 of foot.csv (case 2) is empty.\n",
          "Lines 5 and 6 (cases 4 and 5) have text in the first column only, below ",
          "the data, so they may be footnotes.\n",
          "Because of them, id was read as text.\n",
          "They were read as data, and nothing was removed.\n",
          "To leave them out, delete them from the file and load the file again."))) &&
          nrow(k) == 5L }))
check("S20b ... the run below the data stops at a case holding only a number (an id); no variable is said to be made text when its other values are not all numbers; a footnote quoted across two lines is named by its first line; a line of spaces is empty",
      local({ .ix_w("idonly.csv", c("id,age", "1,23", "2,35", "3,", "Source: x,"))
        .ix_w("mixed.csv", c("id,age", "1,23", "x,35", "Source: x,"))
        .ix_w("twoline.csv", c("id,age", "1,23", "2,35", "\"Source: one", "line two\","))
        .ix_w("spaces.csv", c("a,b", "x,y", "  ,  ", "z,w"))
        m1 <- .fl(grab(jload(.ix("idonly.csv"), name = "k", overwrite = TRUE)))
        m2 <- .fl(grab(jload(.ix("mixed.csv"), name = "k", overwrite = TRUE)))
        m3 <- .fl(grab(jload(.ix("twoline.csv"), name = "k", overwrite = TRUE)))
        m4 <- .fl(grab(jload(.ix("spaces.csv"), name = "k", overwrite = TRUE)))
        grepl("Note: line 5 of idonly.csv (case 4) has text in the first column only, below the data, so it may be a footnote. Because of it, id was read as text.", m1, fixed = TRUE) &&
          grepl("Note: line 4 of mixed.csv (case 3) has text", m2, fixed = TRUE) &&
          !grepl("was read as text", m2, fixed = TRUE) &&
          grepl("Note: line 4 of twoline.csv (case 3) has text in the first column only", m3, fixed = TRUE) &&
          grepl("Note: line 3 of spaces.csv (case 2) is empty.", m4, fixed = TRUE) }))
check("S21 ... a trailing comma's empty column and the row numbers write.csv() writes, by column number (sections C04 and C05's files)",
      local({ m1 <- .fl(grab(jload(.ix("trail.csv"), name = "k", overwrite = TRUE)))
        m2 <- .fl(grab(jload(.ix("rn.csv"), name = "k", overwrite = TRUE)))
        grepl("Note: column 4 of trail.csv (V4) has no name and is empty. It was read as data, and nothing was removed. To leave it out, delete it from the file and load the file again.", m1, fixed = TRUE) &&
          grepl("Note: column 1 of rn.csv (V1) has no name and holds the numbers 1 to 2 in order, so it may be row numbers, as R's write.csv() writes them.", m2, fixed = TRUE) }))
check("S21b ... an unnamed first column of other numbers is not row numbers; beside write.csv()'s row numbers, a case empty in every other variable is named",
      local({ .ix_w("notrn.csv", c("\"\",age", "7,23", "9,35"))
        utils::write.csv(data.frame(a = c(1, NA, 3), b = c(4, NA, 6)), .ix("rnna.csv"))
        m1 <- grab(jload(.ix("notrn.csv"), name = "k", overwrite = TRUE))
        m2 <- .fl(grab(jload(.ix("rnna.csv"), name = "k", overwrite = TRUE)))
        !grepl("row numbers", m1, fixed = TRUE) &&
          grepl("Note: line 3 of rnna.csv (case 2) is empty. Column 1 (V1) has no name and holds the numbers 1 to 3 in order, so it may be row numbers", m2, fixed = TRUE) }))
check("S22 ... not named: the empty line of a one-column file, a case with a missing value (Session 351); a named variable with nothing in it",
      local({ .ix_w("onecol.csv", c("notes", "a", "", "b"))
        m1 <- grab(jload(.ix("onecol.csv"), name = "k", overwrite = TRUE))
        .ix_w("named.csv", c("id,comment", "1,", "2,"))
        m2 <- grab(jload(.ix("named.csv"), name = "k2", overwrite = TRUE))
        !grepl("Note:", m1, fixed = TRUE) && !grepl("Note:", m2, fixed = TRUE) &&
          identical(k$notes, c("a", "", "b")) && all(is.na(k2$comment)) }))
check("S23 ... beside a title note there is none -- its skip = call reads the sheet again, and that read gets it",
      local({ t <- data.frame(x = c("Survey", NA, "id", "1", NA, "2"),
                              y = c(NA, NA, "age", "23", NA, "35"),
                              z = c(NA, NA, "score", "4", NA, "5"))
        writexl::write_xlsx(t, .ix("tb.xlsx"), col_names = FALSE)
        m1 <- .fl(grab(jload(.ix("tb.xlsx"), name = "k", overwrite = TRUE)))
        m2 <- .fl(grab(jload(.ix("tb.xlsx"), name = "k", skip = 2, overwrite = TRUE)))
        grepl("may be a title", m1, fixed = TRUE) && !grepl("empty", m1, fixed = TRUE) &&
          grepl("Note: row 5 of tb.xlsx (case 2) is empty.", m2, fixed = TRUE) }))
check("S24 ... with header = FALSE, a column with nothing in it is named (there are no names to check)",
      local({ .ix_w("nhblank.csv", c("1,,3", "4,,6"))
        grepl("Note: column 2 of nhblank.csv (V2) is empty. It was read as data",
              .fl(grab(jload(.ix("nhblank.csv"), name = "k", header = FALSE,
                             overwrite = TRUE))), fixed = TRUE) }))
check("S25 both notes print under quiet = TRUE, as the other notes on what a read found do; a clean file gets neither",
      local({ m1 <- grab(jload(.ix("nohead.csv"), name = "k", quiet = TRUE, overwrite = TRUE))
        m2 <- .fl(grab(jload(.ix("trail.csv"), name = "k", quiet = TRUE, overwrite = TRUE)))
        m3 <- grab(jload(.ix("plain.csv"), name = "k", overwrite = TRUE))
        m4 <- grab(jload(.ix("clean.xlsx"), name = "k", overwrite = TRUE))
        grepl("every variable name read from nohead.csv", m1, fixed = TRUE) &&
          !grepl("Loaded", m1, fixed = TRUE) &&
          grepl("column 4 of trail.csv (V4)", m2, fixed = TRUE) &&
          !grepl("Note:", m3, fixed = TRUE) && !grepl("Note:", m4, fixed = TRUE) }))
check("S26 what reads as a number: digits, a sign, a decimal point, an exponent; not Inf, NA, 1,000 or 50%; and an Excel column's letters",
      identical(jstats:::.jst_is_number_text(c("7", "-2.5", "1e3", ".5", " 12 ", "Inf",
                                               "NA", "1,000", "50%", "", NA, "x1")),
                c(TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE,
                  FALSE, FALSE)) &&
        identical(jstats:::.jst_excel_col_letters(c(1, 3, 26, 27, 52, 703)),
                  c("A", "C", "Z", "AA", "AZ", "AAA")))
check("S27 the note on a file of several sheets: its line keeps the folder as typed, name = and header = FALSE, with overwrite = TRUE, and runs (it had been jload(\"two.xlsx\", sheet = \"B\"), which read another file or none)",
      local({ sub <- .ix("S27"); dir.create(sub)
        writexl::write_xlsx(list(A = data.frame(x = 1:2), B = data.frame(y = 3:4)),
                            file.path(sub, "two.xlsx"))
        m <- grab(jload(file.path(sub, "two.xlsx"), name = "k", header = FALSE))
        cl <- .calls(m); e <- new.env(); assign("k", "first", envir = e)
        grepl("jload(\"<DIR>/S27/two.xlsx\", name = \"k\", overwrite = TRUE, sheet = \"B\", header = FALSE)",
              .fl(m), fixed = TRUE) &&
          length(cl) == 1L && { invisible(grab(eval(cl[[1]], e)))
            identical(e$k$V1, c("y", "3", "4")) } }))
check("S28 ... the sheet stop's line and the leading-digit stop's line keep skip = and header = FALSE (re-pinned S366: the name offered is the cleaner's, X2024s, section T)",
      local({ m1 <- .fl(grab(jload(.ix("clean.xlsx"), name = "k", sheet = "Nope", skip = 1,
                                   header = FALSE)))
        file.copy(.ix("nohead.csv"), .ix("2024s.csv"))
        m2 <- .fl(grab(jload(.ix("2024s.csv"), header = FALSE)))
        grepl("jload(\"<DIR>/clean.xlsx\", name = \"k\", sheet = \"Sheet1\", skip = 1, header = FALSE)", m1, fixed = TRUE) &&
          grepl("jload(\"<DIR>/2024s.csv\", name = \"X2024s\", header = FALSE)", m2, fixed = TRUE) }))
check("S29 a session that cannot ask says a name was replaced when the load replaces it, so a call that stops says nothing of it (it had said \"has been replaced\" and then stopped); run where interactive() is FALSE, since the workstation asks its question there",
      interactive() || local({
        k <- "here before"
        m1 <- grab(jload(.ix("clean.xlsx"), name = "k", sheet = "Nope"))
        ok1 <- !grepl("replaced", m1, fixed = TRUE) && identical(k, "here before")
        m2 <- grab(jload(.ix("plain.csv"), name = "k"))
        ok1 && grepl("'k' already existed and has been replaced.\n\nLoaded k", m2, fixed = TRUE) &&
          is.data.frame(k) }))

# --- T: the leading-digit name, the overwrite question, the sheets note ------

# v0.9.238 (S366; Fix Slate 13). The leading-digit stop offered the name with
# its digits stripped: 2024.csv got name = "", which loaded the data frame as
# V1, and 2024 wave.csv name = " wave". In a session that asks, the overwrite
# question came before the checks that can stop a load, so its answer was
# taken for a load that then stopped. The multi-sheet note put two sentences
# on one line (Rule E). The question is checked on a copy of jload() run as
# at the console -- interactive() TRUE, the question answered as given and
# marked "<asked>" where it is asked (missing_convention_check.R's .jai92
# pattern) -- so it is checked the same way in Rscript and on the workstation.
.askT <- function(answer) {
  f <- jload
  e <- new.env(parent = environment(f))
  e$interactive <- function() TRUE
  e$.jst_confirm <- function(prompt, remedy, subject = "overwrite") {
    message("<asked> ", prompt, answer)
    identical(answer, "y")
  }
  environment(f) <- e
  f
}
.ix_w("2024.csv", c("x", "1", "2"))
.ix_w("2024 wave.csv", c("x", "1"))
.ix_w("2024.backup.csv", c("x", "1"))
writexl::write_xlsx(list(A = data.frame(x = 1:2), B = data.frame(y = 3:4)),
                    .ix("twoT.xlsx"))

check("T01 a file name starting with a digit is offered the name the cleaner gives: 2024.csv name = \"X2024\" (it had been name = \"\", which loaded the data frame as V1), 2024 wave.csv X2024_wave (\" wave\"), 2024.backup.csv X2024_backup (.backup, a hidden name), and name = \"2b\" X2b (b)",
      local({ m1 <- .fl(grab(jload(.ix("2024.csv"))))
        m2 <- .fl(grab(jload(.ix("2024 wave.csv"))))
        m3 <- .fl(grab(jload(.ix("2024.backup.csv"))))
        m4 <- .fl(grab(jload(.ix("2024.csv"), name = "2b")))
        # Re-pinned S374 (v0.9.247): "Provide a name, for example:" -- the
        # audit's layout item retired the last inline "e.g." stops.
        grepl("starts with a number. R does not allow a data frame's name to start with a digit. Provide a name, for example: jload(\"<DIR>/2024.csv\", name = \"X2024\")", m1, fixed = TRUE) &&
          grepl("jload(\"<DIR>/2024 wave.csv\", name = \"X2024_wave\")", m2, fixed = TRUE) &&
          grepl("jload(\"<DIR>/2024.backup.csv\", name = \"X2024_backup\")", m3, fixed = TRUE) &&
          grepl("The name '2b' starts with a number.", m4, fixed = TRUE) &&
          grepl("jload(\"<DIR>/2024.csv\", name = \"X2b\")", m4, fixed = TRUE) &&
          identical(jstats:::.jst_clean_object_name("2024.backup"), "X2024_backup") }))
check("T02 ... each offered line runs, and loads the data frame under the name it offers",
      local({ ok <- TRUE
        for (f in c("2024.csv", "2024 wave.csv", "2024.backup.csv")) {
          cl <- .calls(grab(jload(.ix(f)))); e <- new.env()
          ok <- ok && length(cl) == 1L && { invisible(grab(eval(cl[[1]], e))); TRUE } &&
            identical(ls(e, all.names = TRUE), cl[[1]]$name) &&
            is.data.frame(get(cl[[1]]$name, envir = e))
        }
        ok }))
check("T03 in a session that asks, a CSV file whose shape stops the load -- a long line, an empty file -- stops it BEFORE the overwrite question, and the data frame of that name is left alone (the question had been asked first, its answer taken for a load that then stopped)",
      local({ .ix_w("longT.csv", c("id,age", "1,23", "2,35,9"))
        file.create(.ix("emptyT.csv"))
        k <- "here before"
        m1 <- grab(.askT("y")(.ix("longT.csv"), name = "k"))
        m2 <- grab(.askT("y")(.ix("emptyT.csv"), name = "k"))
        grepl("line 3 of longT.csv holds 3 values", m1, fixed = TRUE) &&
          grepl("emptyT.csv is empty: it holds no lines.", m2, fixed = TRUE) &&
          !grepl("<asked>", m1, fixed = TRUE) && !grepl("<asked>", m2, fixed = TRUE) &&
          identical(k, "here before") }))
check("T04 ... and an Excel file's: sheet = naming no sheet, a file that is not a workbook",
      local({ .ix_w("brokenT.xlsx", "not a workbook")
        k <- "here before"
        m1 <- grab(.askT("y")(.ix("twoT.xlsx"), name = "k", sheet = "Nope"))
        m2 <- grab(.askT("y")(.ix("brokenT.xlsx"), name = "k"))
        grepl("twoT.xlsx has no sheet named \"Nope\".", m1, fixed = TRUE) &&
          grepl("brokenT.xlsx could not be read.", m2, fixed = TRUE) &&
          !grepl("<asked>", m1, fixed = TRUE) && !grepl("<asked>", m2, fixed = TRUE) &&
          identical(k, "here before") }))
check("T05 ... the question is still asked before the read and before the multi-sheet note: answered n, the load is cancelled with no note and nothing read; answered y, the question, the note, then the Loaded line, and not the note of a session that cannot ask",
      local({ k <- "here before"
        m1 <- grab(.askT("n")(.ix("twoT.xlsx"), name = "k"))
        ok1 <- grepl("<asked> 'k' already exists in your environment. Overwrite? (y/n): n", m1, fixed = TRUE) &&
          grepl("Load cancelled.", m1, fixed = TRUE) && !grepl("sheets", m1, fixed = TRUE) &&
          identical(k, "here before")
        m2 <- grab(.askT("y")(.ix("twoT.xlsx"), name = "k"))
        at <- function(s) regexpr(s, m2, fixed = TRUE)
        ok1 && at("<asked>") > 0L && at("<asked>") < at("This file has 2 sheets") &&
          at("This file has 2 sheets") < at("Loaded k") && is.data.frame(k) &&
          !grepl("replaced", m2, fixed = TRUE) }))
check("T06 the Loading line of a file of 1 MB or more: with no question it comes first, as before, so the checks run under it (a stop below it); where the question is asked it follows the answer, and a no prints none",
      local({ big <- data.frame(a = seq_len(60000), b = "abcdefghijklmnop", c = 1.5)
        utils::write.csv(big, .ix("bigT.csv"), row.names = FALSE)
        utils::write.csv(big, .ix("bigbadT.csv"), row.names = FALSE)
        cat("1,x,2,3\n", file = .ix("bigbadT.csv"), append = TRUE)
        m1 <- grab(jload(.ix("bigT.csv"), name = "bg"))
        m2 <- grab(jload(.ix("bigbadT.csv"), name = "bgb"))
        m3 <- grab(.askT("y")(.ix("bigT.csv"), name = "bg"))
        m4 <- grab(.askT("n")(.ix("bigT.csv"), name = "bg"))
        at <- function(s) regexpr(s, m3, fixed = TRUE)
        isTRUE(file.size(.ix("bigT.csv")) >= 1024^2) &&
          startsWith(m1, "Loading bg ...") &&
          startsWith(m2, "Loading bgb ...") && grepl("holds 4 values", m2, fixed = TRUE) &&
          at("<asked>") > 0L && at("<asked>") < at("Loading bg ...") &&
          !grepl("Loading", m4, fixed = TRUE) && grepl("Load cancelled.", m4, fixed = TRUE) }))
check("T07 the multi-sheet note puts one sentence on a line (Rule E): \"Reading the first sheet (\\\"A\\\").\" and \"To read a different sheet, use:\" (they had shared a line); with sheet = naming one of the sheets there is no note",
      local({ m <- grab(jload(.ix("twoT.xlsx"), name = "k", overwrite = TRUE))
        m2 <- grab(jload(.ix("twoT.xlsx"), name = "k", sheet = "B", overwrite = TRUE))
        grepl("This file has 2 sheets: A, B\nReading the first sheet (\"A\").\nTo read a different sheet, use:\n  jload(\"", m, fixed = TRUE) &&
          !grepl("sheets", m2, fixed = TRUE) && identical(k$y, c(3, 4)) }))

# --- U: jsave()'s question, jload()'s two warnings, jsave()'s no-default stop -

# v0.9.239 (S367; Fix Slate 14). In a session that asks, jsave()'s overwrite
# question came before the checks that can stop a save -- a name the format
# refuses, a declared missing value it cannot hold, a column type it cannot
# store, Excel's sheet size, a folder R cannot write to -- so its answer was
# taken for a save that then stopped, the file untouched. jload()'s sheet =
# and skip = warnings put two sentences on one line (Rule E), and said "this .
# file" of a jstats example dataset. jsave("t.rds") with no default offered
# one route (name the data frame), jsave(file = "t.rds") the other (set a
# default); each now offers both, as the analysis functions' stop does, the
# one data frame in the workspace named. The question is checked on a copy of
# jsave() run as at the console (.askU(), section T's .askT() pattern; a
# folder R cannot write to is stood in by the copy's .jst_lib_writable()).
# The workspace the stop reads is a stand-in environment whose parent is the
# base environment (.wsU()), so the data frames it holds are the only ones
# the stop can see, whatever the global environment holds.
.askU <- function(answer, asks = TRUE, writable = TRUE) {
  f <- jsave
  e <- new.env(parent = environment(f))
  e$interactive <- function() asks
  # The marker drops the prompt's folder: guard 4 (Z01) reads every message
  # a check catches, and a temporary folder's path made this line long.
  e$.jst_confirm <- function(prompt, remedy, subject = "overwrite") {
    message("<asked> ", sub("^File '[^']*[/\\\\]", "File '", prompt), answer)
    identical(answer, "y")
  }
  if (!writable) e$.jst_lib_writable <- function(lib) FALSE
  environment(f) <- e
  f
}
.wsU <- function(...) {
  e <- new.env(parent = baseenv())
  fr <- list(...)
  for (nm in names(fr)) assign(nm, fr[[nm]], envir = e)
  assign("jsave", jsave, envir = e)
  assign("juse", juse, envir = e)
  e
}
.nodefU <- function(expr) {
  old <- getOption(".jst_default_data")
  options(.jst_default_data = NULL)
  on.exit(options(.jst_default_data = old), add = TRUE)
  force(expr)
}
.dU  <- data.frame(`my var` = 1:3, check.names = FALSE)
.spU <- data.frame(Income = haven::labelled_spss(c(1, -99, 3),
                                                 labels = c(Refused = -99),
                                                 na_values = -99))
.stU <- data.frame(Mood = haven::labelled(c(3, haven::tagged_na("a")),
                                          labels = c(Refused = haven::tagged_na("a"))))

check("U01 in a session that asks, a name the format refuses stops jsave() BEFORE the overwrite question, and the file is untouched (the question had been asked first, its answer taken for a save that then stopped)",
      local({ writeLines("before", .ix("U01.sav"))
        m <- grab(.askU("y")(.dU, .ix("U01.sav")))
        grepl("1 variable name in the .dU data frame cannot be used in SPSS format (.sav):",
              .fl(m), fixed = TRUE) &&
          !grepl("<asked>", m, fixed = TRUE) &&
          identical(readLines(.ix("U01.sav")), "before") }))
check("U02 ... and so do a declared missing value the format cannot hold -- SPSS-style in .dta, Stata-style in .sav, either in .xpt -- and a column type it cannot store",
      local({ cx <- data.frame(z = complex(real = 1:2, imaginary = 0))
        cases <- list(list(.spU, "U02.dta", "carries SPSS-style missing values, incompatible with the .dta format:"),
                      list(.stU, "U02.sav", "carries Stata-style missing values, incompatible with the .sav format:"),
                      list(.spU, "U02.xpt", "carries missing-value codes, incompatible with the .xpt format:"),
                      list(cx,   "U02c.sav", "1 column is of a type that SPSS format (.sav) cannot store:"))
        all(vapply(cases, function(k) {
          writeLines("before", .ix(k[[2]]))
          m <- grab(.askU("y")(k[[1]], .ix(k[[2]])))
          grepl(k[[3]], .fl(m), fixed = TRUE) && !grepl("<asked>", m, fixed = TRUE) &&
            identical(readLines(.ix(k[[2]])), "before")
        }, logical(1))) }))
check("U03 ... and so do Excel's sheet size and a folder R cannot write to (the probe stood in on the copy)",
      local({ wide <- as.data.frame(matrix(1L, 1L, 16385L))
        writeLines("before", .ix("U03.xlsx")); writeLines("before", .ix("U03.rds"))
        m1 <- grab(.askU("y")(wide, .ix("U03.xlsx")))
        m2 <- grab(.askU("y", writable = FALSE)(data.frame(a = 1), .ix("U03.rds")))
        grepl("16,385 variables, and Excel format (.xlsx) holds at most 16,384.",
              .fl(m1), fixed = TRUE) &&
          grepl("R cannot write to this folder:", m2, fixed = TRUE) &&
          !grepl("<asked>", m1, fixed = TRUE) && !grepl("<asked>", m2, fixed = TRUE) &&
          identical(readLines(.ix("U03.xlsx")), "before") &&
          identical(readLines(.ix("U03.rds")), "before") }))
check("U04 ... the question is still asked before the write: answered n, the save is cancelled and the file untouched; answered y, the file is replaced; and the .dta note on SAS-style markers, a note on what the save does, follows the answer",
      local({ a <- data.frame(a = 1:3)
        writeLines("before", .ix("U04.rds"))
        m1 <- grab(.askU("n")(a, .ix("U04.rds")))
        ok1 <- grepl("<asked> File '", m1, fixed = TRUE) &&
          grepl("U04.rds' already exists. Overwrite? (y/n): n", .fl(m1), fixed = TRUE) &&
          grepl("Save cancelled.", m1, fixed = TRUE) &&
          identical(readLines(.ix("U04.rds")), "before")
        m2 <- grab(.askU("y")(a, .ix("U04.rds")))
        ok2 <- grepl("<asked>", m2, fixed = TRUE) && grepl("Saved a to", m2, fixed = TRUE) &&
          identical(readRDS(.ix("U04.rds")), a)
        sas <- data.frame(Mood = haven::labelled(c(3, haven::tagged_na("A")),
                                                 labels = c(Refused = haven::tagged_na("A"))))
        writeLines("before", .ix("U04.dta"))
        lv <- getOption(".jst_output_level")
        m3 <- tryCatch({ options(.jst_output_level = "full")
                         grab(.askU("y")(sas, .ix("U04.dta"))) },
                       finally = options(.jst_output_level = lv))
        at <- function(s) regexpr(s, m3, fixed = TRUE)
        ok1 && ok2 && at("<asked>") > 0L &&
          at("<asked>") < at("SAS-style missing values (.A, .B, ...) converted") }))
check("U05 a session that cannot ask still stops on the file that exists first, as before; with no file in the way the name refusal stops the save, and nothing is written",
      local({ writeLines("before", .ix("U05.sav"))
        m1 <- grab(.askU("y", asks = FALSE)(.dU, .ix("U05.sav")))
        m2 <- grab(.askU("y")(.dU, .ix("U05b.sav")))
        startsWith(m1, "this file already exists:\n  ") &&
          grepl("U05.sav\nUse overwrite = TRUE to replace it.", m1, fixed = TRUE) &&
          !grepl("cannot be used", m1, fixed = TRUE) && !grepl("<asked>", m1, fixed = TRUE) &&
          identical(readLines(.ix("U05.sav")), "before") &&
          grepl("cannot be used in SPSS format (.sav):", .fl(m2), fixed = TRUE) &&
          !grepl("<asked>", m2, fixed = TRUE) && !file.exists(.ix("U05b.sav")) }))
check("U06 jload()'s two warnings put one sentence on a line (Rule E), at the pinned width and at 120, the widest the setting takes, where only the line break itself can end a line: sheet = on a CSV file, skip = on an .rds file (each had put both sentences on one line), and the file is loaded",
      local({ .ix_w("U06.csv", c("x", "1"))
        saveRDS(data.frame(x = 1:2), .ix("U06.rds"))
        m1 <- grab(jload(.ix("U06.csv"), name = "k", sheet = 2, overwrite = TRUE))
        m2 <- grab(jload(.ix("U06.rds"), name = "k2", skip = 1, overwrite = TRUE))
        wd <- getOption(".jst_options_message_width")
        w <- tryCatch({ options(.jst_options_message_width = 120L)
          c(grab(jload(.ix("U06.csv"), name = "k3", sheet = 2, overwrite = TRUE)),
            grab(jload(.ix("U06.rds"), name = "k4", skip = 1, overwrite = TRUE))) },
          finally = options(.jst_options_message_width = wd))
        grepl("`sheet` is only used for Excel format (.xlsx, .xls).\nIgnoring it for this .csv file.",
              m1, fixed = TRUE) &&
          grepl("`skip` is only used for Excel format (.xlsx, .xls) and CSV", m2, fixed = TRUE) &&
          grepl("(.csv).\nIgnoring it for this .rds file.", m2, fixed = TRUE) &&
          grepl("`sheet` is only used for Excel format (.xlsx, .xls).\nIgnoring it for this .csv file.",
                w[1], fixed = TRUE) &&
          grepl("`skip` is only used for Excel format (.xlsx, .xls) and CSV format (.csv).\nIgnoring it for this .rds file.",
                w[2], fixed = TRUE) &&
          nrow(k) == 1L && nrow(k2) == 2L && nrow(k3) == 1L && nrow(k4) == 2L }))
check("U07 ... and a jstats example dataset is named as one, \"this jstats example dataset\" (each had said \"this . file\")",
      local({ m <- grab(jload("clinic", package = TRUE, name = "k", sheet = 1, skip = 1,
                              overwrite = TRUE))
        lengths(regmatches(m, gregexpr("Ignoring it for this jstats example dataset.",
                                       m, fixed = TRUE))) == 2L &&
          !grepl("this . file", m, fixed = TRUE) && is.data.frame(k) }))
check("U08 jsave() given a file name alone, no default set, in a workspace holding one data frame: both routes, that data frame named in each (it had offered one route, with MyData)",
      local({ e <- .wsU(d1 = data.frame(a = 1:3))
        m <- .nodefU(grab(eval(quote(jsave("U08.rds")), e)))
        identical(.fl(m), .fl(paste0(
          "jsave(): \"U08.rds\" is a file name, and no data frame was given to save.\n",
          "Name the data frame first:\n",
          "  jsave(d1, \"U08.rds\")\n",
          "Or set a default first, then run the call:\n",
          "  juse(d1)\n",
          "  jsave(\"U08.rds\")"))) }))
check("U09 ... with no data frame in the workspace, or two, MyData in both routes; a hidden data frame and an object that is not a data frame are not counted",
      local({ ex <- function(fr) .fl(paste0(
          "jsave(): \"U09.rds\" is a file name, and no data frame was given to save.\n",
          "Name the data frame first:\n  jsave(", fr, ", \"U09.rds\")\n",
          "Or set a default first, then run the call:\n  juse(", fr, ")\n",
          "  jsave(\"U09.rds\")"))
        go <- function(e) .fl(.nodefU(grab(eval(quote(jsave("U09.rds")), e))))
        identical(go(.wsU()), ex("MyData")) &&
          identical(go(.wsU(d1 = data.frame(a = 1), d2 = data.frame(b = 2))), ex("MyData")) &&
          identical(go(.wsU(x = 1:3, .h = data.frame(a = 1), d3 = data.frame(b = 1))), ex("d3")) }))
check("U10 ... both routes run as printed: the first saves the data frame named, the second, after juse(), saves the default; nothing was written by the stop (the file named bare, data.dir the fixture folder for the check: a path quoted in the first line is longer than the line where the temporary folder is long)",
      local({ e <- .wsU(d1 = data.frame(a = 1:3)); f <- .ix("U10.rds")
        dd <- getOption(".jst_options_data_dir")
        tryCatch({ options(.jst_options_data_dir = .ix_dir)
          m <- .nodefU(grab(eval(quote(jsave("U10.rds")), e)))
          cl <- .calls(m)
          ok0 <- length(cl) == 3L && !file.exists(f)
          .nodefU({ invisible(grab(eval(cl[[1]], e))) })
          ok1 <- identical(readRDS(f), e$d1)
          unlink(f)
          .nodefU({ invisible(grab(eval(cl[[2]], e))); invisible(grab(eval(cl[[3]], e))) })
          ok0 && ok1 && identical(readRDS(f), e$d1) },
          finally = options(.jst_options_data_dir = dd)) }))
check("U11 jsave(file = \"...\") with no default gets the same two routes, file = kept (it had reached the resolver's one route, \"Use juse() to set a default.\"), and both lines keep the call's other arguments",
      local({ e <- .wsU(d1 = data.frame(a = 1:3))
        m1 <- .nodefU(grab(eval(quote(jsave(file = "U11.rds")), e)))
        m2 <- .nodefU(grab(eval(quote(jsave("U11.rds", overwrite = TRUE,
                                            clean.names = TRUE)), e)))
        identical(.fl(m1), .fl(paste0(
          "jsave(): no data frame was given to save.\n",
          "Name the data frame first:\n  jsave(d1, file = \"U11.rds\")\n",
          "Or set a default first, then run the call:\n  juse(d1)\n",
          "  jsave(file = \"U11.rds\")"))) &&
          grepl("jsave(d1, \"U11.rds\", overwrite = TRUE, clean.names = TRUE) Or set",
                .fl(m2), fixed = TRUE) &&
          grepl("juse(d1) jsave(\"U11.rds\", overwrite = TRUE, clean.names = TRUE)",
                .fl(m2), fixed = TRUE) }))
check("U12 ... with a default set, jsave(file = \"...\") and jsave(\"...\") save the default, as before (missing_convention_check.R N86h)",
      local({ e <- .wsU(d1 = data.frame(a = 1:3)); f1 <- .ix("U12a.rds"); f2 <- .ix("U12b.rds")
        old <- getOption(".jst_default_data")
        tryCatch({ options(.jst_default_data = "d1")
                   invisible(grab(eval(bquote(jsave(file = .(f1))), e)))
                   invisible(grab(eval(bquote(jsave(.(f2))), e))) },
                 finally = options(.jst_default_data = old))
        identical(readRDS(f1), e$d1) && identical(readRDS(f2), e$d1) }))

# --- V: jsave()'s front-door stops and its existing-file stop, laid out ------

# v0.9.240 (S368; Fix Slate 15). jsave()'s stops for a data argument that is
# not found, cannot be evaluated, is NULL or is not a data frame each gave
# "Provide a data frame, e.g. jsave(MyData, "mydata.sav")" on the line of the
# sentence before it; the no-filename stop gave its "e.g." call inline; the
# unquoted-file stop gave "'out.rds' is not quoted. Filenames must be in
# quotes, e.g. ..." on one line; and where the session cannot ask, a file that
# exists stopped with "File '<path>' already exists. Use overwrite = TRUE to
# replace it.", both sentences and the path on one line. Each now puts one
# sentence on a line and the call, or the path, on a line of its own (Rules E,
# L and Z), the example naming the one data frame in the workspace (MyData
# with none or several); the unquoted file name gets ruling R18's pointer, as
# jload()'s; and jsave() given neither a data frame nor a file, with no
# default, gets both routes with the example file, where the resolver would
# have offered jsave(d), which stops again. The workspace is .wsU()'s
# stand-in; the existing-file stop is taken from section U's copy, .askU(),
# in a session that cannot ask, so it carries no "jsave():" prefix.
check("V01 a session that cannot ask, a file that exists: one sentence a line and the path on a line of its own (it put both sentences and the path on one line); nothing written",
      local({ f <- .ix("V01.rds"); writeLines("before", f)
        m <- grab(.askU("y", asks = FALSE)(data.frame(a = 1), f))
        identical(m, paste0("this file already exists:\n",
                            "  ", normalizePath(f, winslash = "/", mustWork = FALSE), "\n",
                            "Use overwrite = TRUE to replace it.")) &&
          identical(readLines(f), "before") }))
check("V02 ... a path longer than the line, with spaces in its folder names, is still one line, never broken",
      local({ dd <- .ix("a folder name with spaces in it/and another folder name with spaces")
        dir.create(dd, recursive = TRUE); f <- file.path(dd, "V02.rds")
        writeLines("before", f)
        np <- normalizePath(f, winslash = "/", mustWork = FALSE)
        ln <- strsplit(grab(.askU("y", asks = FALSE)(data.frame(a = 1), f)), "\n", fixed = TRUE)[[1]]
        nchar(np) > .pin_width && length(ln) == 3L && identical(ln[2], paste0("  ", np)) }))
check("V03 the four data-argument stops -- not found, could not be evaluated, NULL, not a data frame -- each give the example on a line of its own, naming the one data frame in the workspace (each gave \"e.g. jsave(MyData, ...)\" inline); the not-found stop keeps the file the call named; nothing is written",
      local({ e <- .wsU(d1 = data.frame(a = 1:3), x = 1:3, n0 = NULL)
        ex <- function(lead, file) paste0("jsave(): ", lead, "\n",
                                          "Provide a data frame, for example:\n",
                                          "  jsave(d1, \"", file, "\")")
        g <- function(cl) .nodefU(grab(eval(cl, e)))
        identical(g(quote(jsave(Bad, "V03.sav"))), ex("'Bad' not found.", "V03.sav")) &&
          identical(g(quote(jsave(d1[, "zz"], "V03.sav"))),
                    ex("'d1[, \"zz\"]' could not be evaluated.", "mydata.sav")) &&
          identical(g(quote(jsave(n0, "V03.sav"))), ex("'n0' is NULL.", "mydata.sav")) &&
          identical(g(quote(jsave(x, "V03.sav"))), ex("'x' is not a data frame.", "mydata.sav")) &&
          !file.exists("V03.sav") && !file.exists(.ix("V03.sav")) }))
check("V04 ... MyData with no data frame in the workspace, or two; a file given as a name, or none, is the example file",
      local({ g <- function(e, cl) .nodefU(grab(eval(cl, e)))
        last <- function(m) tail(strsplit(m, "\n", fixed = TRUE)[[1]], 1L)
        e0 <- .wsU(); e2 <- .wsU(d1 = data.frame(a = 1), d2 = data.frame(b = 2))
        e1 <- .wsU(d1 = data.frame(a = 1), fn = "V04.sav")
        identical(last(g(e0, quote(jsave(Bad, "V04.sav")))), "  jsave(MyData, \"V04.sav\")") &&
          identical(last(g(e2, quote(jsave(Bad, "V04.sav")))), "  jsave(MyData, \"V04.sav\")") &&
          identical(last(g(e2, quote(jsave(x9, "V04.sav")))), "  jsave(MyData, \"V04.sav\")") &&
          identical(last(g(e1, quote(jsave(Bad, fn)))), "  jsave(d1, \"mydata.sav\")") &&
          identical(last(g(e1, quote(jsave(Bad)))), "  jsave(d1, \"mydata.sav\")") }))
check("V05 the not-found line runs as printed: it saves the data frame named to the file the call named (data.dir the fixture folder for the check)",
      local({ e <- .wsU(d1 = data.frame(a = 1:3)); f <- .ix("V05.rds")
        dd <- getOption(".jst_options_data_dir")
        tryCatch({ options(.jst_options_data_dir = .ix_dir)
          cl <- .calls(.nodefU(grab(eval(quote(jsave(dX, "V05.rds")), e))))
          ok0 <- length(cl) == 1L && !file.exists(f)
          .nodefU(invisible(grab(eval(cl[[1]], e))))
          ok0 && identical(readRDS(f), e$d1) },
          finally = options(.jst_options_data_dir = dd)) }))
check("V06 a file name typed without its quotes: ruling R18's pointer, as jload()'s -- the name, then the call as typed with it quoted, file = and the other arguments kept (it gave \"'out.rds' is not quoted. Filenames must be in quotes, e.g. ...\" on one line); the line runs; a name that holds a file name is not refused",
      local({ e <- .wsU(d1 = data.frame(a = 1:3))
        dd <- getOption(".jst_options_data_dir")
        tryCatch({ options(.jst_options_data_dir = .ix_dir)
          m1 <- .nodefU(grab(eval(quote(jsave(d1, V06.rds)), e)))
          m2 <- .nodefU(grab(eval(quote(jsave(d1, file = V06.rds, overwrite = TRUE)), e)))
          ok <- identical(m1, paste0("jsave(): V06.rds is not in quotes.\n",
                                     "A file name goes in quotes:\n",
                                     "  jsave(d1, \"V06.rds\")")) &&
            identical(m2, paste0("jsave(): V06.rds is not in quotes.\n",
                                 "file = takes a file name in quotes:\n",
                                 "  jsave(d1, file = \"V06.rds\", overwrite = TRUE)"))
          .nodefU(invisible(grab(eval(.calls(m1)[[1]], e))))
          ok1 <- identical(readRDS(.ix("V06.rds")), e$d1)
          e$fname <- "V06b.rds"
          .nodefU(invisible(grab(eval(quote(jsave(d1, fname)), e))))
          ok && ok1 && identical(readRDS(.ix("V06b.rds")), e$d1) },
          finally = options(.jst_options_data_dir = dd)) }))
check("V07 no file name, or one that is not a name: the example on a line of its own, naming the data frame being saved, then the formats (it gave \"e.g. jsave(MyData, ...)\" inline); an expression is named mydata first, as the pre-flight's lines name it",
      local({ e <- .wsU(d1 = data.frame(a = 1:3))
        fm <- paste0("Supported formats:\n  .sav       SPSS\n  .dta       Stata\n",
                     "  .xpt       SAS interchange\n  .xlsx      Excel\n",
                     "  .csv       Comma-separated values\n  .rds       R")
        m1 <- .nodefU(grab(eval(quote(jsave(d1)), e)))
        m2 <- .nodefU(grab(eval(quote(jsave(d1, 42)), e)))
        m3 <- .nodefU(grab(eval(quote(jsave(d1[1:2, , drop = FALSE])), e)))
        identical(m1, paste0("jsave(): Provide a filename with extension, for example:\n",
                             "  jsave(d1, \"mydata.sav\")\n", fm)) &&
          identical(m2, m1) &&
          identical(m3, paste0("jsave(): Provide a filename with extension, for example:\n",
                               "  mydata <- d1[1:2, , drop = FALSE]\n",
                               "  jsave(mydata, \"mydata.sav\")\n", fm)) }))
check("V08 jsave() given neither a data frame nor a file, no default: both routes with the example file, under headings that say the file is named too, the call's other arguments kept (the resolver would have offered jsave(d1), which stops again for want of a file)",
      local({ e <- .wsU(d1 = data.frame(a = 1:3))
        m1 <- .nodefU(grab(eval(quote(jsave()), e)))
        m2 <- .nodefU(grab(eval(quote(jsave(overwrite = TRUE)), e)))
        identical(m1, paste0("jsave(): no data frame or file name was given.\n",
                             "Name the data frame first, then the file:\n",
                             "  jsave(d1, \"mydata.sav\")\n",
                             "Or set a default first, then name the file:\n",
                             "  juse(d1)\n",
                             "  jsave(\"mydata.sav\")")) &&
          identical(vapply(.calls(m2), deparse, ""),
                    c("jsave(d1, \"mydata.sav\", overwrite = TRUE)", "juse(d1)",
                      "jsave(\"mydata.sav\", overwrite = TRUE)")) &&
          identical(deparse(.calls(.nodefU(grab(eval(quote(jsave()), .wsU()))))[[1]]),
                    "jsave(MyData, \"mydata.sav\")") }))
check("V09 ... both routes run as printed, each saving the data frame named; with a default set, jsave() alone gives the no-filename stop, naming the default",
      local({ e <- .wsU(d1 = data.frame(a = 1:3)); f <- .ix("mydata.sav")
        dd <- getOption(".jst_options_data_dir")
        tryCatch({ options(.jst_options_data_dir = .ix_dir)
          cl <- .calls(.nodefU(grab(eval(quote(jsave(overwrite = TRUE)), e))))
          .nodefU(invisible(grab(eval(cl[[1]], e))))
          ok1 <- identical(as.integer(haven::read_sav(f)$a), 1:3)
          unlink(f)
          .nodefU({ invisible(grab(eval(cl[[2]], e))); invisible(grab(eval(cl[[3]], e))) })
          ok2 <- identical(as.integer(haven::read_sav(f)$a), 1:3)
          old <- getOption(".jst_default_data")
          m <- tryCatch({ options(.jst_default_data = "d1"); grab(eval(quote(jsave()), e)) },
                        finally = options(.jst_default_data = old))
          ok1 && ok2 && startsWith(m, "jsave(): Provide a filename with extension, for example:\n  jsave(d1, \"mydata.sav\")\n") },
          finally = options(.jst_options_data_dir = dd)) }))

# --- W: a CSV file's text values that read as missing (v0.9.246) ------------

# v0.9.246 (S373; Slate E5, the S372 item, lean 5). jload()'s scan of
# suspected missing-value codes skipped every text variable, so a CSV file's
# "UNKNOWN" and "Not stated" loaded as ordinary categories with no hint. A
# text variable's values are now reported when they read as missing by the
# word list (ruling R28 added "not stated", "unknown" and three more), each
# value quoted as the declaration takes it, with a quoted jdeclare_missing()
# line -- a text variable's missing values are SPSS-style under every
# setting, so no choose-first menu (ruling R26). A blank cell is not
# reported: it is a value of its own, counted valid (Cross-cutting 7).
# missing_convention_check.R N96y-aa hold the .sav cases (a value's label,
# a declared value left out, more than three).
.ix_w("W01.csv", c("Marital,Age", "Married,34", "UNKNOWN,51", "Not stated,22",
                   ",40", "UNKNOWN,29", "Single,61"))
check("W01 a CSV file's text column: its values that read as missing reported, quoted, the line quoted, no menu, and the blank cell not reported (pinned)",
      local({ old <- getOption(".jst_options_missing_convention")
        options(.jst_options_missing_convention = NULL)
        on.exit(options(.jst_options_missing_convention = old))
        p <- run(jload(.ix("W01.csv"), name = "W01"))$txt
        grepl(paste0(
          "Suspected missing-value codes detected:\n",
          "  Marital:  \"Not stated\" (1), \"UNKNOWN\" (2)\n\n",
          "These codes are not formally defined, so they are not treated as missing.\n",
          "Declare them as missing if they are; leave as-is if real.\n\n",
          "To declare one variable's values as missing:\n",
          "  jdeclare_missing(W01, Marital, codes = c(\"Not stated\", \"UNKNOWN\"),\n",
          "      modify = TRUE)\n"), p, fixed = TRUE) &&
          !grepl("convention is selected", p, fixed = TRUE) &&
          !grepl("\"\" (1)", p, fixed = TRUE) }))
check("W02 ... the line runs as printed, under no convention and under stata: both values declared, every cell as it was",
      local({ old <- getOption(".jst_options_missing_convention")
        on.exit(options(.jst_options_missing_convention = old))
        ok <- TRUE
        for (cv in list(NULL, "stata")) {
          options(.jst_options_missing_convention = cv)
          e <- new.env(parent = globalenv())
          p <- run(eval(quote(jload(.ix("W01.csv"), name = "W01")), e))$txt
          cl <- .calls(p)
          suppressMessages(utils::capture.output(eval(cl[[1L]], e)))
          ok <- ok && length(cl) == 2L &&
            identical(sort(attr(e$W01$Marital, "na_values")), c("Not stated", "UNKNOWN")) &&
            identical(as.vector(unclass(e$W01$Marital))[c(1, 4, 6)], c("Married", "", "Single"))
        }
        ok }))
.ix_w("W03.csv", c("Group,Age", "Adult,34", "Juvenile,51", ",22", "Adult,40"))
check("W03 control: a text column holding no such word gives no scan block",
      !grepl("missing-value codes detected", run(jload(.ix("W03.csv"), name = "W03"))$txt,
             fixed = TRUE))
if (exists("W01")) rm(W01)
if (exists("W03")) rm(W03)

# --- X: what a cell is read as, text = and na = (v0.9.254) ------------------

# v0.9.254 (S380; ruling R31, Jeff's answers one at a time). jload() read a
# CSV file as read.csv() does, so a postcode 0800 loaded as 800, four
# 20-digit IDs as one number, a variable of F as FALSE and Namibia's code NA
# as missing, each without a word, and jsave()'s CSV file of a text "0800"
# came back 800. A CSV file's cells are now read as written and each
# variable typed by jstats's rule: numbers, or TRUE and FALSE, only where no
# value would change (questions 1-3); the word NA missing in a variable of
# numbers and a word in a text variable, which the scan names (question 4).
# A variable of numbers that a few cells made text -- in a CSV file or a
# sheet -- is said to be, with the line whose na = reads them as missing
# (question 5); text = and na = for CSV and Excel files (question 6). One
# fixture R cannot write, datasets/import_markers.xlsx (the header has its
# recipe).
# Section X's own helper: grab() with the scan's report, which prints to
# standard output, kept out of the battery's output (S380: it printed
# between the checks on the workstation).
.gx <- function(expr) {
  m <- ""
  invisible(utils::capture.output(m <- grab(expr)))
  m
}
.ix_w("X01.csv", c("id,Postcode", "1,0800", "2,2000", "3,0870", "4,4000"))
.ix_w("X03.csv", c("id,AccountID", "1,12345678901234567891",
                   "2,12345678901234567892", "3,123456789012345"))
.ix_w("X04.csv", c("id,Postcode,Phone,AccountID,Age",
                   "1,0800,0412345678,12345678901234567891,34",
                   "2,2000,0298765432,12345678901234567892,41",
                   "3,NA,,12345678901234567893,29"))
.ix_w("X09.csv", c("id,Income,Region", "1,52000,North", "2,N/A,South",
                   "3,61000,East", "4,-,West", "5,.,North", "6,48000,South",
                   "7,55000,East", "8,NA,West", "9,58000,North", "10,51000,"))
.ix_w("X11.csv", c("id,Income,Rent", "1,52000,1200", "2,N/A,N/A",
                   "3,61000,1350", "4,-,1100", "5,48000,unknown", "6,55000,980",
                   "7,47000,1020"))
.ix_w("X15.csv", c("id,Post code,Diag,Note", "1,4000,250.10,NA",
                   "2,4101,250.00,N/A", "3,4006,401.9,", "4,4000,250.1,ok"))

check("X01 a CSV variable with a leading zero is kept as text, as written, and the note says so with the line that makes it numbers (pinned)",
      local({ e <- new.env(parent = globalenv())
        m <- .gx(eval(quote(jload(.ix("X01.csv"), name = "k")), e))
        identical(e$k$Postcode, c("0800", "2000", "0870", "4000")) &&
          grepl(paste0("\n\nNote: Postcode was kept as text: 2 of its values ",
                       "start with a 0 (0800 and\n0870), which numbers would ",
                       "drop.\nTo make it numbers anyway:\n",
                       "  k$Postcode <- as.numeric(k$Postcode)"), m, fixed = TRUE) }))
check("X02 ... the line runs: Postcode becomes 800, 2000, 870, 4000; and 0, 0.5, 10 and -05 are numbers, with no note",
      local({ e <- new.env(parent = globalenv())
        m <- .gx(eval(quote(jload(.ix("X01.csv"), name = "k")), e))
        cl <- .calls(m)
        invisible(.gx(eval(cl[[1L]], e)))
        .ix_w("X02.csv", c("a,b", "0,0.5", "10,-05", "3,7"))
        m2 <- .gx(eval(quote(jload(.ix("X02.csv"), name = "k2")), e))
        length(cl) == 1L && identical(e$k$Postcode, c(800, 2000, 870, 4000)) &&
          identical(e$k2$a, c(0L, 10L, 3L)) && identical(e$k2$b, c(0.5, -5, 7)) &&
          !grepl("Note:", m2, fixed = TRUE) }))
check("X03 a whole number of more than 15 digits keeps its variable as text -- four IDs had become one number -- and 15 digits is not more, a space before them included (pinned)",
      local({ e <- new.env(parent = globalenv())
        m <- .gx(eval(quote(jload(.ix("X03.csv"), name = "k")), e))
        .ix_w("X03b.csv", c("id", "123456789012345", " 123456789012345", "2"))
        m2 <- .gx(eval(quote(jload(.ix("X03b.csv"), name = "k3")), e))
        identical(e$k$AccountID, c("12345678901234567891", "12345678901234567892",
                                   "123456789012345")) &&
          grepl(paste0("Note: AccountID was kept as text: 2 of its values are ",
                       "longer than the 15\ndigits a number holds exactly."),
                m, fixed = TRUE) && !grepl("as.numeric", m, fixed = TRUE) &&
          is.numeric(e$k3$id) && !grepl("Note:", m2, fixed = TRUE) }))
check("X04 several variables kept as text: one note, a line each, and an as.numeric() line for each with a leading zero only, each running; an empty cell and the word NA in them are missing (pinned)",
      local({ e <- new.env(parent = globalenv())
        m <- .gx(eval(quote(jload(.ix("X04.csv"), name = "k")), e))
        ok <- grepl(paste0(
          "Note: 3 variables were kept as text, since numbers would change\n",
          "their values:\n",
          "  Postcode   1 value starts with a 0 (0800)\n",
          "  Phone      2 values start with a 0 (0412345678 and 0298765432)\n",
          "  AccountID  3 values are longer than the 15 digits a number holds exactly\n",
          "To make them numbers anyway:\n",
          "  k$Postcode <- as.numeric(k$Postcode)\n",
          "  k$Phone <- as.numeric(k$Phone)"), m, fixed = TRUE) &&
          identical(e$k$Postcode, c("0800", "2000", NA)) &&
          identical(e$k$Phone, c("0412345678", "0298765432", NA)) &&
          identical(e$k$Age, c(34L, 41L, 29L))
        cl <- .calls(m)
        for (x in cl) invisible(.gx(eval(x, e)))
        ok && length(cl) == 2L && identical(e$k$Phone, c(412345678, 298765432, NA)) }))
check("X05 T and F standing alone keep a variable as text (a sample of women is not FALSE), with no note; the words TRUE and FALSE are logical, an empty cell missing",
      local({ e <- new.env(parent = globalenv())
        .ix_w("X05.csv", c("id,Sex,Q1,Done", "1,F,T,TRUE", "2,F,F,FALSE",
                           "3,F,T,", "4,F,,TRUE"))
        m <- .gx(eval(quote(jload(.ix("X05.csv"), name = "k")), e))
        identical(e$k$Sex, rep("F", 4)) && identical(e$k$Q1, c("T", "F", "T", "")) &&
          identical(e$k$Done, c(TRUE, FALSE, NA, TRUE)) &&
          !grepl("Note:", m, fixed = TRUE) }))
check("X06 the word NA: missing in a variable of numbers or of TRUE/FALSE, as R writes it; a word in a text variable, which the scan names with the line that declares it, and the line runs",
      local({ e <- new.env(parent = globalenv())
        .ix_w("X06.csv", c("id,Country,Score,Done", "1,AU,12,TRUE", "2,NA,NA,FALSE",
                           "3,NZ,15,NA", "4,NA,11,TRUE"))
        p <- run(eval(quote(jload(.ix("X06.csv"), name = "k")), e))$txt
        ok <- identical(e$k$Country, c("AU", "NA", "NZ", "NA")) &&
          identical(e$k$Score, c(12L, NA, 15L, 11L)) &&
          identical(e$k$Done, c(TRUE, FALSE, NA, TRUE)) &&
          grepl("  Country:  \"NA\" (2)", p, fixed = TRUE)
        cl <- .calls(p)
        suppressMessages(utils::capture.output(eval(cl[[1L]], e)))
        ok && identical(as.character(attr(e$k$Country, "na_values")), "NA") }))
check("X07 jsave()'s CSV file of text \"0800\" and \"F\" loads back as written, where it had come back 800 and FALSE",
      local({ e <- new.env(parent = globalenv())
        e$f7 <- data.frame(id = 1:3, Postcode = c("0800", "2000", "0870"),
                           Sex = c("F", "F", "F"), stringsAsFactors = FALSE)
        invisible(.gx(eval(quote(jsave(f7, .ix("X07.csv"))), e)))
        invisible(.gx(eval(quote(jload(.ix("X07.csv"), name = "g7")), e)))
        identical(e$g7$Postcode, c("0800", "2000", "0870")) &&
          identical(e$g7$Sex, c("F", "F", "F")) }))
check("X08 a file with none of these shapes loads exactly as read.csv() reads it: numbers whole and decimal, negatives, an exponent, text with blanks, TRUE/FALSE, a variable of NA, quoted values, the word NA in a number, a decimal of 17 digits as Python writes it",
      local({ e <- new.env(parent = globalenv())
        .ix_w("X08.csv", c("a,b,c,d,e,f,g,h", "1,2.5,-3,\"x\",TRUE,NA,1e3,0.30000000000000004",
                           "2,,4,,FALSE,NA,2.5e-1,0.1", "NA,3.25,-1, y ,,NA,7,0.7000000000000001"))
        invisible(.gx(eval(quote(jload(.ix("X08.csv"), name = "k")), e)))
        ref <- utils::read.csv(.ix("X08.csv"), stringsAsFactors = FALSE)
        identical(lapply(e$k, function(v) { attributes(v) <- NULL; v }),
                  lapply(ref, function(v) { attributes(v) <- NULL; v })) }))
check("X09 a variable of numbers made text by a few cells: one note names them with their counts, the word NA and an empty cell left out, and gives the line with na = (pinned); the scan says nothing of that variable",
      local({ e <- new.env(parent = globalenv())
        m <- .fl(.gx(eval(quote(jload(.ix("X09.csv"), name = "k")), e)))
        p <- run(eval(quote(jload(.ix("X09.csv"), name = "k", overwrite = TRUE)), e))$txt
        grepl(paste0("Note: Income is numbers except for 3 cells: \"N/A\" (1), ",
                     "\"-\" (1), \".\" (1). It was read as text. ",
                     "To read those cells as missing and Income as numbers: ",
                     "jload(\"<DIR>/X09.csv\", name = \"k\", overwrite = TRUE, ",
                     "na = c(\"N/A\", \"-\", \".\"))"), m, fixed = TRUE) &&
          !grepl("missing-value codes detected", p, fixed = TRUE) &&
          identical(e$k$Income[c(1, 2, 8)], c("52000", "N/A", NA)) &&
          identical(e$k$Region[10], "") }))
check("X10 ... the line runs: Income is numbers, the three cells and NA missing; and na = given, the line keeps it and adds the new values (X11's two variables, pinned)",
      local({ e <- new.env(parent = globalenv())
        m <- .gx(eval(quote(jload(.ix("X09.csv"), name = "k")), e))
        cl <- .calls(m)
        invisible(.gx(eval(cl[[1L]], e)))
        ok <- length(cl) == 1L &&
          identical(e$k$Income, c(52000L, NA, 61000L, NA, NA, 48000L, 55000L, NA,
                                  58000L, 51000L))
        m2 <- .fl(.gx(eval(quote(jload(.ix("X11.csv"), name = "k2", na = "unknown")), e)))
        ok && grepl(paste0("Note: 2 variables are numbers except for a few cells, so ",
                           "they were read as text: Income \"N/A\" (1), \"-\" (1) ",
                           "Rent \"N/A\" (1) To read those cells as missing and the ",
                           "variables as numbers: jload(\"<DIR>/X11.csv\", name = ",
                           "\"k2\", overwrite = TRUE, na = c(\"unknown\", \"N/A\", \"-\"))"),
                    m2, fixed = TRUE) && identical(e$k2$Rent[5], NA_character_) }))
check("X11 \"a few\" (Jeff's okay of the lean): no note at half numbers, at six values that are not numbers, or for a Yes/No variable with a stray 3",
      local({ e <- new.env(parent = globalenv())
        .ix_w("X11a.csv", c("v", "1", "2", "3", "N/A", "-", "."))
        .ix_w("X11b.csv", c("v", 1:12, "a", "b", "c", "d", "e", "f"))
        .ix_w("X11c.csv", c("v", "Yes", "No", "Yes", "3", "No"))
        # Each file under a name of its own: three loads under one name
        # asked jload()'s overwrite question in Jeff's session (S380, the
        # first receive), and the R --interactive run answered it "no", so
        # the second and third files were never read there.
        fs <- c("X11a.csv", "X11b.csv", "X11c.csv")
        ms <- vapply(seq_along(fs), function(i) {
          .gx(eval(bquote(jload(.ix(.(fs[i])), name = .(paste0("k", i)))), e))
        }, character(1))
        all(c("k1", "k2", "k3") %in% ls(e)) &&
          !any(grepl("numbers except", ms, fixed = TRUE)) }))
check("X12 footnotes below the data are not cells for the note: the stray-parts note names them, and id is not said to be numbers except for a few cells",
      local({ e <- new.env(parent = globalenv())
        .ix_w("X12.csv", c("id,age", "1,23", "2,35", "3,41",
                           "Source: synthetic survey 2024,", "Note: fewer than 5 cases,"))
        m <- .gx(eval(quote(jload(.ix("X12.csv"), name = "k")), e))
        grepl("may be footnotes", m, fixed = TRUE) &&
          !grepl("numbers except", m, fixed = TRUE) }))
check("X13 read with header = FALSE, a variable whose first cell is a word is not named by the note (that row may be the names)",
      local({ e <- new.env(parent = globalenv())
        .ix_w("X13.csv", c("score", "12", "15", "11", "14"))
        m <- .gx(eval(quote(jload(.ix("X13.csv"), name = "k", header = FALSE)), e))
        !grepl("numbers except", m, fixed = TRUE) && identical(e$k$V1[1], "score") }))
# S381: the offered lines run in order in e, the warnings they raise
# returned (the base R lines for a number stored as text must raise none:
# as.numeric() on a cell still holding N/A warns "NAs introduced by
# coercion"). Output and notes are dropped.
.runw <- function(cl, e) {
  ws <- character(0)
  for (x in cl) {
    withCallingHandlers(
      invisible(utils::capture.output(suppressMessages(eval(x, e)))),
      warning = function(w) {
        ws <<- c(ws, conditionMessage(w)); invokeRestart("muffleWarning")
      })
  }
  ws
}
check("X14 a sheet: Income's number cells with three text cells, and Code's beside one number stored as text and an N/A, share one note; its lines -- the reload with na =, then Code's as.numeric() -- run in order with no warning and give both as numbers; Diag, text cells throughout, is not in it, and the scan names Diag alone (pinned)",
      local({ e <- new.env(parent = globalenv())
        f <- file.path(.ix_data, "import_markers.xlsx")
        m <- .gx(eval(bquote(jload(.(f), name = "k")), e))
        p <- run(eval(bquote(jload(.(f), name = "k", overwrite = TRUE)), e))$txt
        cl <- .calls(m)
        ws <- .runw(cl, e)
        grepl(paste0("Note: 2 variables are numbers except for a few cells, so ",
                     "they were read as text: Income \"N/A\" (1), \"-\" (1), ",
                     "\".\" (1) Code \"N/A\" (1) Code also holds a number ",
                     "stored as text in the sheet, which na = does not change. ",
                     "To read those cells as missing and the variables as ",
                     "numbers:"), .fl(m), fixed = TRUE) &&
          length(cl) == 2L && identical(cl[[1L]][[1L]], quote(jload)) &&
          identical(eval(cl[[1L]]$na), c("N/A", "-", ".")) &&
          identical(deparse(cl[[2L]]), "k$Code <- as.numeric(k$Code)") &&
          length(ws) == 0L &&
          is.numeric(e$k$Income) && sum(is.na(e$k$Income)) == 3L &&
          identical(e$k$Code, c(7, 8, 9, 5, 4, NA, 3, 6, 2, 1)) &&
          is.character(e$k$Diag) && !grepl("Diag is numbers", m, fixed = TRUE) &&
          grepl("  Diag:  \"N/A\" (1)", p, fixed = TRUE) &&
          !grepl("  Code:", p, fixed = TRUE) }))
check("X15 text = reads variables exactly as written -- 250.10 kept, the word NA and N/A kept, na = not applied there -- named bare, quoted, in c(), by the file's name or the cleaned one, or by a name holding names",
      local({ e <- new.env(parent = globalenv())
        e$cols15 <- c("Diag", "Note")
        invisible(.gx(eval(quote(jload(.ix("X15.csv"), name = "k1",
                                        text = c(Diag, "Note"), na = "N/A")), e)))
        invisible(.gx(eval(quote(jload(.ix("X15.csv"), name = "k2",
                                        text = c("Post code", Post_code))), e)))
        invisible(.gx(eval(quote(jload(.ix("X15.csv"), name = "k3",
                                        text = cols15)), e)))
        identical(e$k1$Diag, c("250.10", "250.00", "401.9", "250.1")) &&
          identical(e$k1$Note, c("NA", "N/A", "", "ok")) &&
          identical(as.vector(e$k2$Post_code), c("4000", "4101", "4006", "4000")) &&
          identical(attr(e$k2$Post_code, "label"), "Post code") &&
          is.numeric(e$k2$Diag) &&
          identical(e$k3$Diag, e$k1$Diag) && identical(e$k3$Note, e$k1$Note) }))
check("X16 a name text = gives that the file does not have stops before the read and the question, every such name in one stop, the file's names listed (pinned); nothing is assigned",
      local({ e <- new.env(parent = globalenv())
        e$k <- "here before"
        e$f <- .askT("y")
        m <- .gx(eval(quote(f(.ix("X01.csv"), name = "k", text = c(Postcde, Idd))), e))
        grepl("Postcde and Idd were not found in X01.csv.\nIts variables are id and Postcode.",
              m, fixed = TRUE) && !grepl("<asked>", m, fixed = TRUE) &&
          identical(e$k, "here before") }))
check("X17 a sheet: text = gives number cells as their digits and keeps its variables out of na = and out of the note on a few cells (since S381 Code, beside a number stored as text, is in it when not named); na = reads the cells it names as missing everywhere else",
      local({ e <- new.env(parent = globalenv())
        f <- file.path(.ix_data, "import_markers.xlsx")
        invisible(.gx(eval(bquote(jload(.(f), name = "k", text = c(Code, Diag),
                                         na = c("N/A", "-", "."))), e)))
        m <- .gx(eval(bquote(jload(.(f), name = "k2", text = Income)), e))
        identical(e$k$Code, c("7", "8", "9", "5", "4", "N/A", "3", "6", "2", "1")) &&
          identical(e$k$Diag[5], "N/A") && is.numeric(e$k$Income) &&
          sum(is.na(e$k$Income)) == 3L &&
          identical(e$k2$Income[1:4], c("52000", "N/A", "61000", "-")) &&
          !grepl("Income", m, fixed = TRUE) &&
          grepl("Note: Code is numbers except for 1 cell:", m, fixed = TRUE) }))
check("X18 na = in a CSV file: the cells it names are missing in every variable but text = ones, and NA stays missing in a number (na = \"N/A\" never makes it a word)",
      local({ e <- new.env(parent = globalenv())
        invisible(.gx(eval(quote(jload(.ix("X09.csv"), name = "k",
                                        na = c("N/A", "-", "."))), e)))
        invisible(.gx(eval(quote(jload(.ix("X15.csv"), name = "k2", na = "N/A")), e)))
        identical(e$k$Income, c(52000L, NA, 61000L, NA, NA, 48000L, 55000L, NA,
                                58000L, 51000L)) &&
          identical(e$k2$Note, c("NA", NA, "", "ok")) }))
check("X19 text = and na = on a format that carries its own types and missing values stop, in one stop with header = FALSE, each named, the line without them, which runs (pinned)",
      local({ e <- new.env(parent = globalenv())
        m1 <- .fl(.gx(jload("community_spss.sav", name = "k", text = Age)))
        m2 <- .fl(.gx(jload("community_spss.sav", name = "k", na = "x", header = FALSE)))
        m3 <- .fl(.gx(jload("community", package = TRUE, text = Age, na = "-")))
        cl <- .calls(.gx(jload("community_spss.sav", name = "k", na = "x",
                                header = FALSE)))
        invisible(.gx(eval(cl[[1L]], e)))
        grepl(paste0("text = is only for Excel format (.xlsx, .xls) and CSV format ",
                     "(.csv). community_spss.sav is in SPSS format (.sav), which ",
                     "carries its own variable types. To load it, drop text =: ",
                     "jload(\"community_spss.sav\", name = \"k\")"), m1, fixed = TRUE) &&
          grepl(paste0("header = FALSE and na = are only for Excel format (.xlsx, ",
                       ".xls) and CSV format (.csv). community_spss.sav is in SPSS ",
                       "format (.sav), which carries its own variable names and ",
                       "missing values. To load it, drop them: ",
                       "jload(\"community_spss.sav\", name = \"k\")"), m2, fixed = TRUE) &&
          grepl(paste0("text = and na = are only for Excel format (.xlsx, .xls) and ",
                       "CSV format (.csv). community is a jstats example dataset, ",
                       "which carries its own variable types and missing values. ",
                       "To load it, drop them: jload(\"community\", package = TRUE)"),
                m3, fixed = TRUE) && is.data.frame(e$k) }))
check("X20 na = must be text in quotes: a number stops with the example, a bare word gets ruling R18's pointer with the call quoted (pinned)",
      local({ m1 <- .fl(.gx(jload(.ix("X01.csv"), name = "k", na = 99)))
        m2 <- .fl(.gx(jload(.ix("X01.csv"), name = "k", na = missingword)))
        grepl("`na` must be the cell values to read as missing, in quotes, for example: na = c(\"N/A\", \"-\")",
              m1, fixed = TRUE) &&
          grepl("missingword is not in quotes. na = takes a cell value in quotes: jload(.ix(\"X01.csv\"), name = \"k\", na = \"missingword\")",
                m2, fixed = TRUE) }))
check("X21 text = given something that is not names stops with an example on the file's first variable",
      grepl("text = takes the names of variables, for example: text = id",
            .fl(.gx(jload(.ix("X01.csv"), name = "k", text = 3))), fixed = TRUE))
check("X22 the lines jload() offers keep text = as typed and na =: the note on a few cells under text = c(Region) and na = \"x\"",
      local({ e <- new.env(parent = globalenv())
        m9 <- .fl(.gx(eval(quote(jload(.ix("X09.csv"), name = "k9", text = c(Region),
                                        na = "x")), e)))
        grepl("jload(\"<DIR>/X09.csv\", name = \"k9\", overwrite = TRUE, text = c(Region), na = c(\"x\", \"N/A\", \"-\", \".\"))",
              m9, fixed = TRUE) }))
# S381 (v0.9.255; Fix Slate 24): a number stored as text in a sheet, and
# the label line. Two fixtures R cannot write (the header has their recipe).
check("X23 a sheet's variable of numbers beside one number stored as text and one N/A: the note says a reload would not make it numbers and gives base R's two lines, == for its one value; they run with no warning; no scan block for it (pinned)",
      local({ e <- new.env(parent = globalenv())
        f <- file.path(.ix_data, "import_stored2.xlsx")
        m <- .gx(eval(bquote(jload(.(f), name = "k", text = c(B, PC))), e))
        p <- run(eval(bquote(jload(.(f), name = "k", overwrite = TRUE,
                                   text = c(B, PC))), e))$txt
        cl <- .calls(m)
        ws <- .runw(cl, e)
        grepl(paste0("Note: A is numbers except for 1 cell: \"N/A\" (1). It was ",
                     "read as text, and one of its numbers is stored as text in ",
                     "the sheet, so reading the file again with na = would not ",
                     "make it numbers. To read that cell as missing and A as ",
                     "numbers: k$A[k$A == \"N/A\"] <- NA k$A <- as.numeric(k$A)"),
              .fl(m), fixed = TRUE) &&
          length(cl) == 2L && length(ws) == 0L &&
          identical(e$k$A, c(1, 2, 3, 4, NA, 6, 7, 8, 9, 10)) &&
          !grepl("  A:", p, fixed = TRUE) &&
          grepl("\n  PC: +\"N/A\" \\(1\\)", p) }))
check("X24 a renamed sheet variable with two numbers stored as text and two values: %in% for the values, the count said, and a last line that puts back the label jload() gave it, which as.numeric() drops; the three lines run with no warning (pinned)",
      local({ e <- new.env(parent = globalenv())
        f <- file.path(.ix_data, "import_stored.xlsx")
        m <- .gx(eval(bquote(jload(.(f), name = "k")), e))
        cl <- .calls(m)
        ws <- .runw(cl, e)
        grepl(paste0("Note: Score_no is numbers except for 2 cells: \"-\" (1), ",
                     "\"N/A\" (1). It was read as text, and 2 of its numbers are ",
                     "stored as text in the sheet, so reading the file again with ",
                     "na = would not make it numbers. To read those cells as ",
                     "missing and Score_no as numbers: ",
                     "k$Score_no[k$Score_no %in% c(\"-\", \"N/A\")] <- NA ",
                     "k$Score_no <- as.numeric(k$Score_no) ",
                     "attr(k$Score_no, \"label\") <- \"Score no.\""),
              .fl(m), fixed = TRUE) &&
          length(cl) == 3L && length(ws) == 0L &&
          is.numeric(e$k$Score_no) &&
          identical(as.vector(e$k$Score_no), c(7, 8, 9, 5, NA, NA, 3, 6, 2, 1)) &&
          identical(.lab(e$k$Score_no), "Score no.") }))
check("X25 two sheet variables each beside a number stored as text, and none a reload serves: one note, a sentence for both, each variable's lines and no jload() line; they run with no warning (pinned)",
      local({ e <- new.env(parent = globalenv())
        f <- file.path(.ix_data, "import_stored2.xlsx")
        m <- .gx(eval(bquote(jload(.(f), name = "k")), e))
        cl <- .calls(m)
        ws <- .runw(cl, e)
        grepl(paste0("Note: 2 variables are numbers except for a few cells, so ",
                     "they were read as text: A \"N/A\" (1) B \"-\" (1) They also ",
                     "hold numbers stored as text in the sheet, so reading the ",
                     "file again with na = would not make them numbers. To read ",
                     "those cells as missing and the variables as numbers: ",
                     "k$A[k$A == \"N/A\"] <- NA k$A <- as.numeric(k$A) ",
                     "k$B[k$B == \"-\"] <- NA k$B <- as.numeric(k$B)"),
              .fl(m), fixed = TRUE) &&
          length(cl) == 4L &&
          !any(vapply(cl, function(x) grepl("jload(", deparse(x)[1L], fixed = TRUE),
                      logical(1))) &&
          length(ws) == 0L &&
          identical(e$k$A, c(1, 2, 3, 4, NA, 6, 7, 8, 9, 10)) &&
          identical(e$k$B, c(1, 2, 3, 4, 5, NA, 7, 8, 9, 10)) }))
check("X26 a stored number that numbers would change -- a postcode 0800, an ID of 17 digits, among number cells -- passes its variable over: no note names it, it stays as read, and the scan names its N/A as before",
      local({ e <- new.env(parent = globalenv())
        f <- file.path(.ix_data, "import_stored2.xlsx")
        m <- .gx(eval(bquote(jload(.(f), name = "k")), e))
        p <- run(eval(bquote(jload(.(f), name = "k", overwrite = TRUE)), e))$txt
        !grepl("PC", m, fixed = TRUE) && !grepl("ID", m, fixed = TRUE) &&
          identical(e$k$PC[3L], "0800") &&
          identical(e$k$ID[4L], "12345678901234567") &&
          grepl("\n  PC: +\"N/A\" \\(1\\)", p) &&
          grepl("\n  ID: +\"N/A\" \\(1\\)", p) }))
check("X27 a CSV variable kept as text for its leading zero, renamed by jload(): its as.numeric() line is followed by one that puts the label back, a label's quotation marks escaped; a variable not renamed gets none; every line runs, the labels kept (pinned)",
      local({ e <- new.env(parent = globalenv())
        .ix_w("X27.csv", c("id,Post code,\"Zip \"\"new\"\"\",Plain",
                           "1,0800,0810,0820", "2,4000,4001,4002",
                           "3,0810,0820,0830"))
        .ix_w("X27b.csv", c("id,Post code", "1,0800", "2,4000", "3,0810"))
        m  <- .gx(eval(quote(jload(.ix("X27.csv"), name = "k")), e))
        mb <- .gx(eval(quote(jload(.ix("X27b.csv"), name = "kb")), e))
        cl <- .calls(.note(m, "3 variables"))
        cb <- .calls(.note(mb, "Post_code"))
        ws <- c(.runw(cl, e), .runw(cb, e))
        # The escaped label pinned on the message as printed: .fl() writes
        # every backslash as a forward slash, for paths.
        grepl(paste0("To make them numbers anyway:\n",
                     "  k$Post_code <- as.numeric(k$Post_code)\n",
                     "  attr(k$Post_code, \"label\") <- \"Post code\"\n",
                     "  k$Zip_new <- as.numeric(k$Zip_new)\n",
                     "  attr(k$Zip_new, \"label\") <- \"Zip \\\"new\\\"\"\n",
                     "  k$Plain <- as.numeric(k$Plain)"), m, fixed = TRUE) &&
          grepl(paste0("To make it numbers anyway: ",
                       "kb$Post_code <- as.numeric(kb$Post_code) ",
                       "attr(kb$Post_code, \"label\") <- \"Post code\""),
                .fl(mb), fixed = TRUE) &&
          length(cl) == 5L && length(cb) == 2L && length(ws) == 0L &&
          identical(as.vector(e$k$Post_code), c(800, 4000, 810)) &&
          identical(.lab(e$k$Post_code), "Post code") &&
          identical(.lab(e$k$Zip_new), "Zip \"new\"") &&
          identical(e$k$Plain, c(820, 4002, 830)) &&
          identical(.lab(e$kb$Post_code), "Post code") }))
check("X28 a sheet variable whose number cells are not more than half its cells (four number cells, five numbers stored as text, an N/A) is not named by the note: the stored numbers count with the text cells, and the scan names its N/A",
      local({ e <- new.env(parent = globalenv())
        f <- file.path(.ix_data, "import_stored2.xlsx")
        m <- .gx(eval(bquote(jload(.(f), name = "k")), e))
        p <- run(eval(bquote(jload(.(f), name = "k", overwrite = TRUE)), e))$txt
        !grepl("Half", m, fixed = TRUE) && is.character(e$k$Half) &&
          grepl("\n  Half: +\"N/A\" \\(1\\)", p) }))
if (exists("k")) rm(k)

# --- Y: jsave()'s conversion lines put back the label (v0.9.258) ------------

# S384 (Fix Slate 26, the (S382) item): as.character() and as.POSIXct() drop
# every attribute, so the lines jsave()'s .sav pre-flight offers for a
# factor with a category over 120 characters, and its .sav, .dta and .xpt
# pre-flight for a POSIXlt column, are followed, where the variable has a
# label, by the line that puts it back (.jst_label_line(), as jload()'s
# as.numeric() lines since S381 and jscreen()'s as.Date() lines since S382).
.Y130 <- strrep("a", 130)
.Y125 <- strrep("b", 125)
.Ylt  <- function() as.POSIXlt(c("2024-01-01 10:00:00", "2024-02-01 11:00:00"),
                              tz = "UTC")
# The lines a message offers that assign -- the conversion lines, the label
# lines, mydata <- ... -- without the type list's rows ("  t (POSIXlt)"),
# which .calls() reads as a call to t().
.Ylines <- function(m) {
  Filter(function(x) is.call(x) && identical(x[[1L]], as.name("<-")), .calls(m))
}
check("Y01 a factor with a category over 120 characters and a label (.sav): its as.character() line is followed by one that puts the label back; an unlabelled one beside it gets none, and nothing is saved (pinned)",
      local({ g <- data.frame(g1 = factor(c(.Y130, "x")), g2 = factor(c("y", .Y125)))
        attr(g$g1, "label") <- "Group one"
        m <- grab(jsave(g, .ix("Y01.sav")))
        identical(.fl(m), .fl(paste0(
          "jsave(): g1 and g2 have a category longer than 120 characters, which\n",
          "SPSS format (.sav) cannot store as a value label.\n",
          "Save them as text, which SPSS keeps whole:\n",
          "  g$g1 <- as.character(g$g1)\n",
          "  attr(g$g1, \"label\") <- \"Group one\"\n",
          "  g$g2 <- as.character(g$g2)"))) && !file.exists(.ix("Y01.sav")) }))
check("Y02 ... the lines run as printed, with no warning: the factor is text with its label, the save goes ahead, and the .sav file read back holds the category whole and the label",
      local({ e <- new.env(parent = globalenv())
        e$g <- data.frame(g1 = factor(c(.Y130, "x")), g2 = factor(c("y", .Y125)))
        attr(e$g$g1, "label") <- "Group one"
        m  <- grab(eval(quote(jsave(g, .ix("Y02.sav"))), e))
        cl <- .Ylines(m)
        ws <- .runw(cl, e)
        m2 <- grab(eval(quote(jsave(g, .ix("Y02.sav"))), e))
        r  <- haven::read_sav(.ix("Y02.sav"))
        length(cl) == 3L && length(ws) == 0L && is.character(e$g$g1) &&
          identical(.lab(e$g$g1), "Group one") && is.null(.lab(e$g$g2)) &&
          !grepl("jsave():", m2, fixed = TRUE) &&
          identical(r$g1[1], .Y130) && identical(.lab(r$g1), "Group one") }))
check("Y03 ... a label holding a quotation mark and a backslash is escaped in the line, which gives it back exactly",
      local({ e <- new.env(parent = globalenv())
        e$h <- data.frame(g = factor(c(.Y130, "b")))
        attr(e$h$g, "label") <- "He said \"yes\" \\ no"
        m <- grab(eval(quote(jsave(h, .ix("Y03.sav"))), e))
        ws <- .runw(.Ylines(m), e)
        grepl("\n  attr(h$g, \"label\") <- \"He said \\\"yes\\\" \\\\ no\"", m,
              fixed = TRUE) && length(ws) == 0L &&
          identical(.lab(e$h$g), "He said \"yes\" \\ no") }))
check("Y04 ... an empty label, or one that is not text, gives no line",
      local({ a <- data.frame(g = factor(c(.Y130, "b"))); attr(a$g, "label") <- ""
        b <- a; attr(b$g, "label") <- 7
        ma <- grab(jsave(a, .ix("Y04a.sav"))); mb <- grab(jsave(b, .ix("Y04b.sav")))
        grepl("\n  a$g <- as.character(a$g)", ma, fixed = TRUE) &&
          grepl("\n  b$g <- as.character(b$g)", mb, fixed = TRUE) &&
          !grepl("attr(", ma, fixed = TRUE) && !grepl("attr(", mb, fixed = TRUE) }))
check("Y05 a POSIXlt column: its as.POSIXct() line alone when it has no label; with a label, the line that puts it back under it, for .sav, .dta and .xpt alike (pinned)",
      local({ p <- data.frame(id = 1:2); p$t <- .Ylt()
        q <- p; attr(q$t, "label") <- "Time of visit"
        mp <- grab(jsave(p, .ix("Y05p.sav")))
        ms <- vapply(c("sav", "dta", "xpt"), function(x) {
          .fl(grab(jsave(q, .ix(paste0("Y05.", x)))))
        }, "")
        identical(.fl(mp), .fl(paste0(
          "jsave(): 1 column is of a type that SPSS format (.sav) cannot store:\n",
          "  t (POSIXlt)\n",
          "\n",
          "POSIXlt columns are list-backed; convert to POSIXct (the same instant, which\n",
          "SPSS format (.sav) can store) before saving with:\n",
          "  p$t <- as.POSIXct(p$t)"))) &&
          identical(ms[["sav"]], .fl(paste0(
          "jsave(): 1 column is of a type that SPSS format (.sav) cannot store:\n",
          "  t (POSIXlt)\n",
          "\n",
          "POSIXlt columns are list-backed; convert to POSIXct (the same instant, which\n",
          "SPSS format (.sav) can store) before saving with:\n",
          "  q$t <- as.POSIXct(q$t)\n",
          "  attr(q$t, \"label\") <- \"Time of visit\""))) &&
          all(grepl(paste0("before saving with: q$t <- as.POSIXct(q$t) ",
                           "attr(q$t, \"label\") <- \"Time of visit\""), ms,
                    fixed = TRUE)) &&
          !any(file.exists(.ix(c("Y05p.sav", "Y05.sav", "Y05.dta", "Y05.xpt")))) }))
check("Y06 ... the lines run as printed, with no warning: the column is POSIXct with its label, the save goes ahead, and the .sav file read back holds the label",
      local({ e <- new.env(parent = globalenv())
        e$q <- data.frame(id = 1:2); e$q$t <- .Ylt()
        attr(e$q$t, "label") <- "Time of visit"
        m  <- grab(eval(quote(jsave(q, .ix("Y06.sav"))), e))
        cl <- .Ylines(m)
        ws <- .runw(cl, e)
        m2 <- grab(eval(quote(jsave(q, .ix("Y06.sav"))), e))
        r  <- haven::read_sav(.ix("Y06.sav"))
        length(cl) == 2L && length(ws) == 0L && inherits(e$q$t, "POSIXct") &&
          identical(.lab(e$q$t), "Time of visit") &&
          !grepl("jsave():", m2, fixed = TRUE) &&
          identical(.lab(r$t), "Time of visit") }))
check("Y07 a complex column ahead of two POSIXlt columns, the second labelled: the drop line, each as.POSIXct() line, and the label line under the labelled column alone; at the minimal level, no lines, as before (pinned)",
      local({ p <- data.frame(id = 1:2); p$z <- complex(real = 1:2, imaginary = 0)
        p$t <- .Ylt(); p$u <- .Ylt(); attr(p$u, "label") <- "Second visit"
        m <- grab(jsave(p, .ix("Y07.sav")))
        invisible(utils::capture.output(suppressMessages(joutput("minimal"))))
        mm <- tryCatch(grab(jsave(p, .ix("Y07.sav"))), finally = {
          invisible(utils::capture.output(suppressMessages(joutput(NULL)))) })
        identical(.fl(m), .fl(paste0(
          "jsave(): 3 columns are of a type that SPSS format (.sav)\n",
          "cannot store:\n",
          "  z (complex)\n",
          "  t (POSIXlt)\n",
          "  u (POSIXlt)\n",
          "\n",
          "complex/list/raw columns have no SPSS format (.sav) representation and no\n",
          "sensible automatic conversion. Drop it before saving with:\n",
          "  p[c(\"z\")] <- NULL\n",
          "\n",
          "POSIXlt columns are list-backed; convert to POSIXct (the same instant, which\n",
          "SPSS format (.sav) can store) before saving with:\n",
          "  p$t <- as.POSIXct(p$t)\n",
          "  p$u <- as.POSIXct(p$u)\n",
          "  attr(p$u, \"label\") <- \"Second visit\""))) &&
          identical(.fl(mm), .fl(paste0(
          "jsave(): 3 columns are of a type that SPSS format (.sav) cannot\n",
          "store. drop p[c(\"z\")] <- NULL; convert POSIXlt with as.POSIXct()."))) }))
check("Y08 a labelled factor with a long category beside a labelled POSIXlt column (.sav): one numbered message, each part with its label line (pinned)",
      local({ p <- data.frame(g = factor(c(.Y130, "b"))); attr(p$g, "label") <- "Group"
        p$t <- .Ylt(); attr(p$t, "label") <- "Time of visit"
        m <- grab(jsave(p, .ix("Y08.sav")))
        identical(.fl(m), .fl(paste0(
          "jsave(): p cannot be saved to SPSS format (.sav) yet -- 2\n",
          "things to fix:\n",
          "\n",
          "[1] g has a category longer than 120 characters, which SPSS format (.sav)\n",
          "cannot store as a value label.\n",
          "Save it as text, which SPSS keeps whole:\n",
          "  p$g <- as.character(p$g)\n",
          "  attr(p$g, \"label\") <- \"Group\"\n",
          "\n",
          "[2] 1 column is of a type that SPSS format (.sav) cannot store:\n",
          "  t (POSIXlt)\n",
          "\n",
          "POSIXlt columns are list-backed; convert to POSIXct (the same instant, which\n",
          "SPSS format (.sav) can store) before saving with:\n",
          "  p$t <- as.POSIXct(p$t)\n",
          "  attr(p$t, \"label\") <- \"Time of visit\"\n",
          "\n",
          "Fix the above, then run jsave() again."))) }))
check("Y09 ... the data given as a place: the lines name lst$d and run, labels kept, and the save goes ahead; given as an expression, each kind of line names mydata after the line that makes it, and runs",
      local({ e <- new.env(parent = globalenv())
        s <- data.frame(g = factor(c(.Y130, "b"))); attr(s$g, "label") <- "Group"
        s$t <- .Ylt(); attr(s$t, "label") <- "Time of visit"
        e$lst <- list(d = s); e$src <- s
        m1 <- grab(eval(quote(jsave(lst$d, .ix("Y09.sav"))), e))
        w1 <- .runw(.Ylines(m1), e)
        m1b <- grab(eval(quote(jsave(lst$d, .ix("Y09.sav"))), e))
        m2 <- grab(eval(quote(jsave(src["g"], .ix("Y09b.sav"))), e))
        w2 <- .runw(.Ylines(m2), e)
        g2 <- e$mydata$g
        m3 <- grab(eval(quote(jsave(src["t"], .ix("Y09c.sav"))), e))
        w3 <- .runw(.Ylines(m3), e)
        grepl(paste0("lst$d$g <- as.character(lst$d$g) ",
                     "attr(lst$d$g, \"label\") <- \"Group\""), .fl(m1), fixed = TRUE) &&
          grepl(paste0("lst$d$t <- as.POSIXct(lst$d$t) ",
                       "attr(lst$d$t, \"label\") <- \"Time of visit\""), .fl(m1),
                fixed = TRUE) &&
          length(w1) == 0L && !grepl("jsave():", m1b, fixed = TRUE) &&
          identical(.lab(e$lst$d$g), "Group") &&
          identical(.lab(e$lst$d$t), "Time of visit") &&
          grepl(paste0("keeps whole: mydata <- src[\"g\"] ",
                       "mydata$g <- as.character(mydata$g) ",
                       "attr(mydata$g, \"label\") <- \"Group\""), .fl(m2), fixed = TRUE) &&
          grepl(paste0("before saving with: mydata <- src[\"t\"] ",
                       "mydata$t <- as.POSIXct(mydata$t) ",
                       "attr(mydata$t, \"label\") <- \"Time of visit\""), .fl(m3),
                fixed = TRUE) &&
          length(c(w2, w3)) == 0L && is.character(g2) &&
          identical(.lab(g2), "Group") && inherits(e$mydata$t, "POSIXct") &&
          identical(.lab(e$mydata$t), "Time of visit") }))
check("Y10 ... the stop is SPSS format's alone: .dta keeps a long category whole as a value label, with the variable's label, and .xpt saves the factor, neither stopping",
      local({ f <- data.frame(g = factor(c(.Y130, "b"))); attr(f$g, "label") <- "Group"
        md <- grab(jsave(f, .ix("Y10.dta"))); mx <- grab(jsave(f, .ix("Y10.xpt")))
        r <- haven::read_dta(.ix("Y10.dta"))
        !grepl("jsave():", paste(md, mx), fixed = TRUE) &&
          file.exists(.ix("Y10.xpt")) &&
          identical(names(attr(r$g, "labels"))[1], .Y130) &&
          identical(.lab(r$g), "Group") }))

.Ysrc <- function() {
  s <- data.frame(g = factor(c(.Y130, "b"))); attr(s$g, "label") <- "Group"
  s$t <- .Ylt(); attr(s$t, "label") <- "Time of visit"; s$BY <- c(1, 2)
  s
}
check("Y11 given an expression and three things to fix (.sav; ruling S386): the line that makes mydata comes once, under the header, no part repeats it, and the closing line is the save on mydata with clean.names = TRUE (pinned)",
      local({ e <- new.env(parent = globalenv()); e$src <- .Ysrc()
        m <- grab(eval(quote(jsave(src[c("g", "t", "BY")], .ix("Y11.sav"))), e))
        identical(.fl(m), .fl(paste0(
          "jsave(): src[c(\"g\", \"t\", \"BY\")] cannot be saved to SPSS format (.sav)\n",
          "yet -- 3 things to fix.\n",
          "The fixes shown below work on a copy of your src data frame.\n",
          "Make the copy first:\n",
          "  mydata <- src[c(\"g\", \"t\", \"BY\")]\n",
          "\n",
          "[1] 1 variable name in the src[c(\"g\", \"t\", \"BY\")] data frame cannot be used in\n",
          "SPSS format (.sav):\n",
          "  \"BY\"  -> XBY  (a word SPSS reserves)\n",
          "To save the file with this name (the src[c(\"g\", \"t\", \"BY\")] data frame\n",
          "keeps its own):\n",
          "  jsave(mydata, \"", .ix("Y11.sav"), "\", clean.names = TRUE)\n",
          "\n",
          "[2] g has a category longer than 120 characters, which SPSS format (.sav)\n",
          "cannot store as a value label.\n",
          "Save it as text, which SPSS keeps whole:\n",
          "  mydata$g <- as.character(mydata$g)\n",
          "  attr(mydata$g, \"label\") <- \"Group\"\n",
          "\n",
          "[3] 1 column is of a type that SPSS format (.sav) cannot store:\n",
          "  t (POSIXlt)\n",
          "\n",
          "POSIXlt columns are list-backed; convert to POSIXct (the same instant, which\n",
          "SPSS format (.sav) can store) before saving with:\n",
          "  mydata$t <- as.POSIXct(mydata$t)\n",
          "  attr(mydata$t, \"label\") <- \"Time of visit\"\n",
          "\n",
          "Fix the above, then save mydata:\n",
          "  jsave(mydata, \"", .ix("Y11.sav"), "\", clean.names = TRUE)"))) && !file.exists(.ix("Y11.sav")) }))
check("Y12 ... its lines run top to bottom as printed -- the assignments, then the closing save -- with no warning: the file is saved, g text with its label, t a date-time with its label, BY renamed in the file only, and the data frame unchanged",
      local({ e <- new.env(parent = globalenv()); e$src <- .Ysrc()
        m  <- grab(eval(quote(jsave(src[c("g", "t", "BY")], .ix("Y12.sav"))), e))
        cl <- .calls(m)
        w  <- .runw(.Ylines(m), e)
        o  <- utils::capture.output(m2 <- grab(eval(cl[[length(cl)]], e)))
        r  <- if (file.exists(.ix("Y12.sav"))) haven::read_sav(.ix("Y12.sav")) else NULL
        length(w) == 0L && !grepl("jsave():", m2, fixed = TRUE) && !is.null(r) &&
          identical(names(r), c("g", "t", "XBY")) && is.character(r$g) &&
          identical(.lab(r$g), "Group") && inherits(r$t, "POSIXct") &&
          identical(.lab(r$t), "Time of visit") && is.factor(e$src$g) &&
          identical(names(e$src), c("g", "t", "BY")) }))
check("Y13 given an expression and two things to fix, the second with two routes (.dta): mydata is made once and both routes build on it, the closing save has no clean.names, and the conversion route run top to bottom saves (pinned)",
      local({ e <- new.env(parent = globalenv())
        s <- data.frame(X = haven::labelled_spss(c(1, -1), na_values = -1)); s$t <- .Ylt()
        e$src2 <- s
        m  <- grab(eval(quote(jsave(src2[c("t", "X")], .ix("Y13.dta"))), e))
        cl <- .calls(m)
        # the assignments (not the type list's row, which .calls() reads as
        # t()), then part [2]'s first route; the jsave() lines are its
        # second route and the closing save
        conv <- c(.Ylines(m),
                  Filter(function(x) identical(x[[1L]], as.name("jconvert")), cl))
        sv <- Filter(function(x) identical(x[[1L]], as.name("jsave")), cl)
        w  <- .runw(conv, e)
        o  <- utils::capture.output(m2 <- grab(eval(sv[[length(sv)]], e)))
        identical(.fl(m), .fl(paste0(
          "jsave(): src2[c(\"t\", \"X\")] cannot be saved to Stata format (.dta) yet\n",
          "-- 2 things to fix.\n",
          "The fixes shown below work on a copy of your src2 data frame.\n",
          "Make the copy first:\n",
          "  mydata <- src2[c(\"t\", \"X\")]\n",
          "\n",
          "[1] 1 column is of a type that Stata format (.dta) cannot store:\n",
          "  t (POSIXlt)\n",
          "\n",
          "POSIXlt columns are list-backed; convert to POSIXct (the same instant, which\n",
          "Stata format (.dta) can store) before saving with:\n",
          "  mydata$t <- as.POSIXct(mydata$t)\n",
          "\n",
          "[2] 1 variable carries SPSS-style missing values, incompatible with the\n",
          ".dta format:\n",
          "  X\n",
          "\n",
          "Before saving to Stata format, convert with:\n",
          "  jconvert(mydata, to = \"stata\", modify = TRUE)\n",
          "Or save every declared missing value as plain NA instead:\n",
          "  jsave(mydata, \"", .ix("Y13.dta"), "\", preserve.declarations = FALSE)\n",
          "\n",
          "Fix the above, then save mydata:\n",
          "  jsave(mydata, \"", .ix("Y13.dta"), "\")"))) &&
          length(conv) == 3L && length(sv) == 2L && length(w) == 0L &&
          !grepl("jsave():", m2, fixed = TRUE) &&
          file.exists(.ix("Y13.dta")) }))
check("Y14 ... and the rest keep their forms: a name and a place close on \"Fix the above, then run jsave() again.\" with no line making mydata, one part on an expression keeps its own line (S352), and the minimal level has no such header",
      local({ e <- new.env(parent = globalenv()); s <- .Ysrc()
        e$p <- s; e$lst <- list(d = s); e$src <- s
        mn <- grab(eval(quote(jsave(p, .ix("Y14.sav"))), e))
        ml <- grab(eval(quote(jsave(lst$d, .ix("Y14.sav"))), e))
        m1 <- grab(eval(quote(jsave(src["t"], .ix("Y14.sav"))), e))
        old <- getOption(".jst_output_level"); options(.jst_output_level = "minimal")
        mm <- grab(eval(quote(jsave(src[c("g", "t", "BY")], .ix("Y14.sav"))), e))
        options(.jst_output_level = old)
        endsWith(.fl(mn), "Fix the above, then run jsave() again.") &&
          endsWith(.fl(ml), "Fix the above, then run jsave() again.") &&
          !grepl("mydata", paste(mn, ml), fixed = TRUE) &&
          !grepl("work on a copy of", paste(mn, ml, m1, mm), fixed = TRUE) &&
          grepl(paste0("before saving with: mydata <- src[\"t\"] ",
                       "mydata$t <- as.POSIXct(mydata$t)"), .fl(m1), fixed = TRUE) &&
          !grepl("save mydata", mm, fixed = TRUE) && !file.exists(.ix("Y14.sav")) }))
check("Y15 ... an expression that names no one data frame -- mk() -- says the fixes work on a copy of \"your data\"; one that names one, as in Y11, names it (Jeff's wording, S386)",
      local({ e <- new.env(parent = globalenv()); s <- .Ysrc()
        e$mk <- function() s
        m <- grab(eval(quote(jsave(mk(), .ix("Y15.sav"))), e))
        grepl(paste0("cannot be saved to SPSS format (.sav) yet -- 3 things to fix. ",
                     "The fixes shown below work on a copy of your data. ",
                     "Make the copy first: mydata <- mk() [1]"), .fl(m), fixed = TRUE) &&
          !file.exists(.ix("Y15.sav")) }))
rm(.Ysrc)

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
  shape <- "^ {2,}[A-Za-z.][A-Za-z0-9._]*(\\$[A-Za-z0-9._]+)*(\\[[^]]*\\])? *(\\(|<- )"
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
options(.entry_stores)
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
