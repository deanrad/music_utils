% Lilypond Template
%    For monophonic (possibly transposing) instrument-  woodwind, violin, etc..
% 
% Author: Dean Radcliffe
%
% Parameters: midi instrument, transposition options (c' to c' is no transpose at all)
%             midi tempo, clef/key/time sig, ...
\header{
	composer          = "Dean Radcliffe"
	title             = "Example using changePitch.ly"

	copyright         = ""
	maintainer        = "Dean Radcliffe"
	lastupdated       = "2010/09/01"
}

\version "2.12.3"

\include "lib/changePitch.ly"
\include "lib/articulate.ly"
\include "lib/commonRhythms.ly"
\include "lib/swing.ly"

daMusic = \boomChick \chordmode{ c g c d:7 }
\score {
  \new Staff {
    \tempo 4=120

    \repeat percent 2 \daMusic
  }

	\layout { }
}
\score{
  \articulate
  \new Staff {
    \tempo 4=100

    \repeat unfold 4 
    \swingIt #'"eigth" {
      \boomChickMidi \chordmode{ c g c d:7 }
    }
      
  }
  \midi{}
}
