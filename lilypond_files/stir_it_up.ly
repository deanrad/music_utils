\version "2.12.3"
\include "english.ly"
\header {
  title = "Stir It Up"
  arranger = "Dean Radcliffe"
}

bassChorusMelody = \relative c, {
  a4-.       cs8.-. cs16    d4-.        cs8.   cs16
  d8  fs8    a8.    d,16    e8  gs8     b4
}

\score {
  \new Staff <<
    \clef "treble"
    \key e \major
    \new Voice {
      \tempo 4 = 80
      \set Staff.midiInstrument = #"piano" 
      \bassChorusMelody
    }
  >>
  \layout { }
  \midi {}
}

\markup {
  \large { % \teeny \tiny \small \normalsize \large \huge
           % are all viable options here, with \normalsize
           % the default. Pick whatever looks good.
      \hspace #1.0 % gives the fill-line something to work with
      \column {
        "Watchin all these people"
	"Sittin' in their ruts all day"
        \hspace #1.0 % (Basically inserts a blank line; the argument is irrelevant)
        " . . . etc. . . . "
        " ......etc....... "
      }
      \column {
        " . . . etc. . . . "
        " ......etc....... "
        \hspace #1.0 % (Basically inserts a blank line; the argument is irrelevant)
        " . . . etc. . . . "
        " ......etc....... "
      }
      \hspace #1.0 % gives the fill-line something to work with
  }
}
