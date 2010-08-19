\version "2.12.3"
\header {
  title = "Banjo Cheat Sheet for Lilypond"
}
\markup{
  \column{
     "The note 'c':"
     "The note f sharp:"
     "4 sixteenth notes:"
     "An 8th and two 16ths:"
     "A hammer from a to b:"
     "A 'g' played on string 5:"
     "Naming a part (internally):"
     "Displaying a part in tab:"    " "   " "   " "   " "   " "
     "Displaying a part in music:"  " "   " "   " "
     "NEXT_ONE:"
  }
  \column{ "  "   "  "   "  "   "  "   "  "
           "  "   "  "   "  "   "  "   "  "   }
  \typewriter \column{
     "c c' c," 
     "fs  (or fis) "
     "g16 b d g'"
     "g8  b16 d"
     "a( b)"
     "g'\5"
     "foggyMtnLick = { b c cs }"
     \smaller {
     "\\new TabStaff {"
     "  \set TabStaff.tablatureFormat = #fret-number-tablature-format-banjo"
     "  \set TabStaff.stringTunings = #banjo-open-g-tuning"
     "  \\foggyMtnLick"
     "}"
     " "
     "\\new Staff{"
     "    \\key g \\major"
     "    \\clef \"treble_8\" "
     "    \\foggyMtnLick"
     "}"
     }
  }
}
