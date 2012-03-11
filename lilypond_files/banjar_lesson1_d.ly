\version "2.12.3"
\include "english.ly"
\header {
  title = "Day One - Know Thy Banjar"
}
#(set-global-staff-size 28)
\paper { 
   indent = 0\cm
}
dOpen = \markup \override #'(fret-diagram-details . (
  (fret-count . 5)
)) 
\fret-diagram-terse #"o;o;o;o;"
gOpen = \markup \override #'(fret-diagram-details . (
  (number-type . roman-lower) 
  (finger-code . in-dot)
  (fret-count . 5) 
  (string-count . 4)
))
\fret-diagram-verbose #'( 
	(place-fret 4 2 2)
	(open 3)
	(place-fret 2 1 1)
	(place-fret 1 2 3)
)
	
aOpen = \markup \override #'(fret-diagram-details . (
  (number-type . roman-lower) 
  (finger-code . in-dot)
  (fret-count . 5) 
  (string-count . 4)
))
\fret-diagram-verbose #'( 
	(open 4)
	(place-fret 3 2 2)
	(place-fret 2 1 1)
	(open 1)
)

dFive = \markup \override #'(fret-diagram-details . (
  (fret-count . 5)
  (number-type . arabic) 
  (finger-code . in-dot) 
  (string-count . 4)
))
\fret-diagram-verbose #'( 
	(place-fret 4 5 3)
	(place-fret 3 4 2)
	(place-fret 2 3 1)
	(place-fret 1 5 4)
)

gFive = \markup \override #'(fret-diagram-details . (
  (fret-count . 5)
  (string-count . 4)
  (barre-type . straight)
  (finger-code . in-dot) 
))
\fret-diagram-verbose #'( 
  (place-fret 4 5 3)
	(barre 4 1 5)
  (place-fret 1 5 3)
)

aFive = \markup \override #'(fret-diagram-details . (
  (fret-count . 5)
  (string-count . 4)
  (finger-code . in-dot) 
))
\fret-diagram-verbose #'( 
  (place-fret 4 4 3)
  (place-fret 3 2 1)
  (place-fret 2 3 2)
  (place-fret 1 4 4)
)

dSeven = \markup \override #'(fret-diagram-details . (
  (fret-count . 5)
  (string-count . 4)
  (finger-code . in-dot) 
))
\fret-diagram-verbose #'( 
  (place-fret 4 9 3)
  (place-fret 3 7 1)
  (place-fret 2 2)
  (place-fret 1 9 4)
)

gSeven = \markup \override #'(fret-diagram-details . (
  (fret-count . 3)
  (finger-code . in-dot) 
  (string-count . 4)
))
% to use an 'invisible' fretted string to 'anchor' at fret 7 instead of 8
%   (place-fret 5 7 3)   
\fret-diagram-verbose #'( 
	(place-fret 4 10 3)
	(place-fret 3 9 2)
	(place-fret 2 1)
	(place-fret 1 10 4)
)

aSeven = \markup \override #'(fret-diagram-details . (
  (fret-count . 5)
  (string-count . 4)
  (barre-type . straight)
  (finger-code . in-dot) 
))
\fret-diagram-verbose #'( 
  (place-fret 4 7 1)
	(barre 4 1 7)
  (place-fret 1 7 1)
)

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

  			% 2nd closed position at 7
            fs\4 a\3 d'\2 fs'\1
            g\4 b\3 d'\2 g'\1
            e\4 a\3 cs'\2 e'\1

	        r1.*3
}	

myfrets = { 
	s2^\dOpen   s2^\gOpen   s2^\aOpen 
	s2^\dFive   s2^\gFive   s2^\aFive \break
	s2^\dSeven  s2^\gSeven  s2^\aSeven   
} 

mychords = \chordmode{
   d2 g a:7
   d2 g a
   d g a
}


\markup {  \larger "The Trinity of Chords - 3 ways to play 'em" \hspace #0 }
\new Score {
<<
  \new ChordNames { 	\mychords }
  \new TabStaff \with {
  	\remove Time_signature_engraver 
    \remove "Bar_number_engraver"
  } 
  {
    \time 3/2
    \set TabStaff.stringTunings = #'(-3 -6 -10 -15)
     \override Staff.Clef #'stencil = ##f 
    <<
    \myfrets
    \mynotes
    >>
  }
>>
} % new Score
\layout { 
 \context {
    \Score
    \remove "Bar_number_engraver"
  }
}
% % % % % % % % % % Yo quiero Pachelbel ! % % % % % % % % % % 
\markup \hspace #3
\markup \smaller \wordwrap {
  Try this little ditty below. Once you can play it through
  once in one of the Trinities (for example, the set of D G and A that hovers around the 5th fret), try substituting a chord from another group - for example - play a fretted D one time through and the open D another time. Go on ! What
  have you got to lose !
}
\markup \hspace #0
\markup \larger "Pachelbel's Canon in D"
\markup \hspace #0
\score {
  \new ChordNames \with {
    \override BarLine #'bar-size = #4
    \consists Bar_engraver
    \remove Time_signature_engraver
    \remove Bar_number_engraver
   }
  \chordmode {     
	    d2 d2   a2 a2    g2 g2   d2 d2  \break
	  g2 g2   d2 d2    g2 g2   a2 a2  \bar ":|"
  }
}
