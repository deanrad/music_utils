\version "2.12.3"
% \include "english.ly"
% \include "predefined-guitar-fretboards.ly"
\header {
  title = "Sophie's Heartbreak"
  composer = "Dean Radcliffe and Maria Poulos"
  meter = "1/4 note at 60 bpm, swung 16ths"
  }

mychords ={ f1 bes c f }

mymelody =     \relative c'' {
      r4 a8 a8      a4 c8 bes8~
      bes1
      r4 bes8 bes8   bes4 c8. f,16
      bes8 a8~ a4~ 
}

myaccompaniment =       \relative c' { 
  f16 a8 f16    a8 f16  a16~    |  a16  f16 a8    f8 a8  
  a16(bes8.)    d,8.  bes'16~   |  bes16  d,16 bes'8  d,8 bes'8

  g16 c8 g16    c8 g16  c16~    |  c16  g16 c8    g8 c8  
  f,16 a8 f16    a8 f16  a16~   |  a2 
} 

\score {
<<
  %\new ChordNames {
   % \mychords
  %}
  %\new FretBoards {
   % \mychords
  %} 
  \new Staff {
    \time 2/4
    \key f \major
    \new Voice \with {
      \consists "Pitch_squash_engraver"
    }
   \mymelody
  }

%{    
     % remove the percent at the beginning of this line to only show the rhythm
%      \improvisationOn  
                                          %  of the picking
    \new Voice = "melody" {
	  \mymelody
    }
    \new Lyrics {
      \lyricsto "melody" {
         Swim -- ming in the lake
         Look -- ing up at the stars __
      }
    }
%}
>>
  \layout{} 
  \midi{}
} % score
