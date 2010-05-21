\version "2.12.2"
\header { 
  title = "How to Notate Chords For LilyPond"
  composer = "Me"
}

\include "predefined-guitar-fretboards.ly"

myriff = \chordmode{ d1 g2 c4. d8 }
<<
\new FretBoards{
  \myriff
 }
\new ChordNames{ 
  \myriff 
}
\new Staff{
  \key g \major
  \myriff
}
>>





















































%{ 
%Reference Solution for #1 How to Notate Chords in LilyPond
%\version = "2.12.2"
\include "predefined-guitar-fretboards.ly"

\header {
  title = "How to Notate Chords in LilyPond"
}

myriff = \chordmode{  d4   g4.   c8   d4  } 

<<
   \new FretBoards{ \myriff }
   \new ChordNames{ \myriff } 
   \new Staff{ 
         \key g \major
   	\myriff
   }

>>
%}

