\version "2.8"
\include "english.ly"
\header {
  title = "Stir It Up"
  arranger = "Dean Radcliffe"
}

bassChorusMelody = \relative c {
  a4-.    cs8.  cs16  d4     cs8.   cs16
  d8  fs  a8.    d,16  e8  gs  b4
}

\score {
  \new Staff <<
    \clef "bass_8"
    \key a \major
    \new Voice {
      \tempo 4 = 80
      \set Staff.midiInstrument = #"acoustic bass" 
      \bassChorusMelody
    }
  >>
  \layout { }
  \midi {}
}
