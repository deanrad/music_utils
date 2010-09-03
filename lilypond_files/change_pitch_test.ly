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

daMusic = \boomChick \chordmode{ c c g g c c g g }
\score {
  \new Staff {
    \set Staff.midiMinimumVolume = #0.0
    \set Staff.midiMaximumVolume = #1.0
    \tempo 4=120

    \repeat unfold 4 \daMusic
  }

	\layout { }
}
\score{
  \articulate
  \new Staff {
    \set Staff.midiMinimumVolume = #0.0
    \set Staff.midiMaximumVolume = #1.0
    \tempo 4=120

    \repeat unfold 4 \daMusic
  }
  \midi{}
}
