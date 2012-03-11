\version "2.12.3"
\include "english.ly"

% SEE ALSO banjar_lesson1.ly in this project for better looking stuff
\header { 
  title= "Banjar Fretboard Test File (Experimental)"
}
experimento = {
       
    <d g b d'>          % explicit pitches notate fine and find the open G
   \chordmode{ g, }    % with correct octaving, simply 'g' works OK but..
   \chordmode{ g,/+d } % if you want to say simply 'g' - you've got to include
                       % extra info to get the normal fret diagram
   \key a \major
   <e a cs' e'>
   <a cs' e' a'>       % you may need to force-notate ALL the frets 
                       % - fretboard will be fine, tab will not be w/o 'em
}


%%% banjar include %%%
%banjarTuning = #'(-3 -6 -10 -15)
banjarTuning  = #'(2 -1 -5 -10) % normal banjo for the moment
aMajorAtTwo   = { <e\4 a\3 cs'\2 e'\1> }
aMajorAtSeven = { <a\4 cs'\3 e'\2 a'\1> }

\storePredefinedDiagram \aMajorAtTwo
                        #banjarTuning
                        #"2;2;2;2;"

\storePredefinedDiagram \aMajorAtSeven
                        #banjarTuning
                        #"7;6;5;7;"
                      
%%% end banjar include  
\score{
  <<
  \context FretBoards{
    \set FretBoards.stringTunings = #banjo-open-g-tuning
  	\experimento
  }
  \new TabStaff {
    \set TabStaff.stringTunings = #banjo-open-g-tuning
    \experimento
  }

  \new Staff{
     \key g \major
%     \clef "treble_8"
%     \tempo 4 = 126
     \experimento
  }
  >>
  \layout{}
  \midi{}
}
