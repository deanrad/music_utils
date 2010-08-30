% Lilypond Template
%    For guitar/banjo/chordal instrument lead sheet creation
% 
% Author: Dean Radcliffe
% Parts: Chord instrument, 
% Parameters: midi instrument, transposition options, unindenting first line, midi tempo, clef/key/time sig, ...
\header{
	composer          = "Donnie Hall"
	title             = "Promise Land"

	copyright         = ""
	maintainer        = "Dean Radcliffe"
	lastupdated       = "2010/08/28"
}

\version "2.12.3"

\paper { 
  indent = 0\cm
}

myVerse = \chordmode{
  c2 c     f  c      c  c      d:7  g
  c2 c:7   f  f:m    c  g      c4 g4 c4 
}
myChorus = \chordmode{
  g2 g     c  c      g g:7    c   c    
  
}
myChords = \chordmode { 
  \repeat volta 2{
    \myVerse
  }
  \break
  \repeat volta 2 {
    % e1:m  a:m  e:7  e:m
  }
  \break
  \repeat volta 2 {
    % e:m   a:m     d:7    g
  }
}

% enter the rhythm of the strumming pattern here 
myStrum = \repeat unfold 14 \relative c''{ g16 g8 g16 g8 g16 g8 g16 g8 g8 g8 }

%% The primary score first - the midi-only score follows it
\score {
  <<
    %% First display the chordnames laid out in \myChords, while
    %% Only displaying the name of chords when they change
    \new ChordNames {
      % \set chordChanges = ##t 
      \myChords 
    }
    \include "predefined-guitar-fretboards.ly"
    \new FretBoards {
      \myChords
    }
    
    %% Display a musical staff, on which to draw the squashed noteheads as
    %% indicated by \improvisationOn
    \new Staff { 
      \clef "treble"
      
      \time 4/4
      \tempo 4 = 70
      \set beatLength = #(ly:make-moment 1 4)  % beam quarter notes
      \myChords 
    }
    \new TabStaff {
      \set TabStaff.stringTunings = #guitar-tuning
      \transpose c c, \myChords
    }
  >>
  \layout{}
}

 \markup {
  \column {

  \hspace #2.0
  "---"
  "   ---" 
  "---"
  "   ---" 
  "---"
  "   ---" 
  "---"
  "   ---" 

  \hspace #1.0
  "<Chorus>"

  \hspace #2.0
  "---"
  "   ---" 
  "---"
  "   ---" 
  "---"
  "   ---" 
  "---"
  "   ---" 
  }
}

%% The midi-only score, in order to unfold repeats
\score {
  <<
%   \new Staff="track 1 guitar" {
%     \set Staff.midiInstrument = #"acoustic guitar (steel)"
%     \unfoldRepeats
%     \myChords
%   }
  \new Staff="track 2 bass" {
    \set Staff.midiInstrument = #"acoustic guitar (steel)"
    \set Score.tempoWholesPerMinute = #(ly:make-moment 120 4)
    \unfoldRepeats
    \myChords
  }
  >>
  \midi{}
}