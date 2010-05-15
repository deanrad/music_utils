\version "2.8"
\include "english.ly"
\header {
  title = "Fun With the Banjar 101"
}
#(set-global-staff-size 28)

dOpen = \markup \fret-diagram-terse #"o;o;o;o;"
gOpen = \markup \fret-diagram-terse #"2;o;1;2;"
aOpen = \markup \fret-diagram-terse #"o;2;1;o;"

dFive = \markup \fret-diagram-terse #"5;4;3;5;"
gFive = \markup \fret-diagram-terse #"5-(;5;5;5-);"
aFive = \markup \fret-diagram-terse #"4;2;3;4;"

mynotes = {
            a,8 d fs a
            b,\4 d\3 g\2 b\1
            a, e\3 g\2 a\1
            d\4 fs\3 a\2 d'\1
            d\4 g\3 b\2 d'\1
            cs\4 e\3 a\2 cs'\1
}	

myfrets = { 
	s2^\dOpen
	s2^\gOpen
	s2^\aOpen 
	s2^\dFive
	s2^\gFive 
    s2^\aFive 
} 

mychords = \chordmode{
   d2 g a:7
   d2 g a
}
tideIsHigh = { \repeat unfold 4 {r8 <a, d fs a>8 } 
               \repeat unfold 2 {r8 <d\4 g\3 b\2 d'\1> }
               \repeat unfold 2 {r8 <e\4 a\3 cs'\2 e'\1> }
}


\markup {  \larger "Some Chords" }
<<
  \new TabStaff {
    \set TabStaff.stringTunings = #'(-3 -6 -10 -15)
    <<
    \myfrets
    \mynotes
    >>
  }
  \new ChordNames {
  	\mychords
  }
  \new Staff {
    \key d \major
    \clef "treble_8"
    <<
    \mynotes
    >>
  }
>>

% % % % % % % % % % Tide Is High % % % % % % % % % % 

\markup {  \larger "The Tide Is High" }

<<
  \new TabStaff {
    \set TabStaff.stringTunings = #'(-3 -6 -10 -15)
    <<
    \tideIsHigh
    >>
  }
>>