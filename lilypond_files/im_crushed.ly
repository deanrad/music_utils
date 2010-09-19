% Lilypond Template
%    For guitar/banjo/chordal instrument lead sheet creation
% 
% Author: Dean Radcliffe
% Parts: Chord instrument, 
% Parameters: midi instrument, transposition options, unindenting first line, midi tempo, clef/key/time sig, ...
\header{
	composer          = "Maria Poulos"
	title             = "I'm Crushed"

	copyright         = ""
	maintainer        = "Dean Radcliffe"
	lastupdated       = "2010/09/12"
}

\version "2.12.3"

\include "predefined-guitar-fretboards.ly"

\paper { 
  indent = 0\cm
}

myBass = \relative c {
  \mark \markup \box "Verse"
  \repeat volta 2 {
    fis1\2   e\2     dis\2 e,\3
  }
  \mark \markup \box "Chorus"
  \repeat volta 2 {
    e,    a     b     e,
  }
  \mark \markup \box "Bridge"
  \repeat volta 2 {
    e    a     d     g
  }
}

myGuitar = \relative c, {
  s1*3 s1
  <e b' e g b e> 
  <e a e' a c e>
  <e b' dis a' b e> 
  <e b' e g b e> 
}

myChords = \chordmode { 
  \repeat volta 2 {
    d1:7  d:m  e:7  e
  }
  \break
  \repeat volta 2 {
    e1:m  a:m  e:7  e:m
  }
  \break
  \repeat volta 2 {
    e:m   a:m     d:7    g
  }
}

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
    
    %% Display a musical staff, on which to draw the squashed noteheads as
    %% indicated by \improvisationOn
%     \new Staff { 
%       \clef "treble_8"
%       
%       \time 4/4
%       \tempo 4 = 70
%       \set beatLength = #(ly:make-moment 1 4)  % beam quarter notes
%       \improvisationOn 
%       \myStrum 
%     }
    \new FretBoards {
      \myGuitar
    }
    \new TabStaff {
      \set TabStaff.instrumentName = # "Acou. Guit."
      \myGuitar
    }
    \new TabStaff {
      \set TabStaff.stringTunings = #bass-tuning
      \myBass
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
  \new Staff="track 1 guitar" {
    \set Staff.midiInstrument = # "acoustic guitar (steel)"
    \set Score.tempoWholesPerMinute = #(ly:make-moment 72 4)
    \unfoldRepeats
    \myGuitar
  }
  \new Staff="track 2 bass" {
    \set Staff.midiInstrument = # "electric bass (finger)"
    \set Score.tempoWholesPerMinute = #(ly:make-moment 72 4)
    \unfoldRepeats
    \myBass
  }
  >>
  \midi{}
}