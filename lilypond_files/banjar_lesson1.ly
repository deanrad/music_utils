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

aNine = \markup \fret-diagram-terse #"7-(;7;7;7-);"
dNine = \markup \fret-diagram-terse #"9;7;8;9;"
gNine = \markup \fret-diagram-terse #"10;9;8;10;"

% We include which octave a note like so: g'
% We include the string number like so :  g'\5
% We indicate a hammer-on or pull-off with a slur: a( b\3)
% We indicate right hand fingers: g'-T
% We dont need to specify which fret, the program determines that from the 
% pitch, and if we gave it a string, it uses that as well
mynotes = {
			% open, cowboy position
            a,8 d fs a
            b,\4 d\3 g\2 b\1
            a, e\3 g\2 a\1

 			% first closed position at 5
            d\4 fs\3 a\2 d'\1
            d\4 g\3 b\2 d'\1
            cs\4 e\3 a\2 cs'\1

  			% 2nd closed position at 9
            e\4 a\3 cs'\2 e'\1
            fs\4 a\3 d'\2 fs'\1
            g\4 b\3 d'\2 g'\1

%            e\4 a\3 cs'\2 e'\1
%            fs\4 a\3 d'\2 fs'\1
%            g\4 b\3 d'\2 g'\1
}	

myfrets = { 
	s2^\dOpen   s2^\gOpen   s2^\aOpen 
	s2^\dFive   s2^\gFive   s2^\aFive \break
	s2^\aNine   s2^\dNine   s2^\gNine 
} 

mychords = \chordmode{
   d2 g a:7
   d2 g a
   a  g d
}
tideIsHigh = { \repeat unfold 4 {r8 <a, d fs a>8 } 
               \repeat unfold 2 {r8 <d\4 g\3 b\2 d'\1> }
               \repeat unfold 2 {r8 <e\4 a\3 cs'\2 e'\1> }
}


\markup {  \larger "Some Chords" }
<<
  \new ChordNames { 	\mychords }
  \new TabStaff {
    \time 3/2
    \set TabStaff.stringTunings = #'(-3 -6 -10 -15)
    <<
    \myfrets
    \mynotes
    >>
  }
%  \new Staff {
%    \key d \major
%    \clef "treble_8"
%    <<
%    \mynotes
%    >>
%  }
>>

% % % % % % % % % % Tide Is High % % % % % % % % % % 

\markup {  \larger "The Tide Is High" }

<<
  % TODO this displays A 6/8/sus4 instead of D 
  % \new ChordNames { \tideIsHigh }
  \new TabStaff {
    \set TabStaff.stringTunings = #'(-3 -6 -10 -15)
    <<
    \tideIsHigh
    >>
  }
>>