\version "2.8"
\include "english.ly"
\markup {
  "An example of simple banjo tab."
}
\paper {
 ragged-right = ##t
}

% Here we define the notes that make up the melody, their duration,
% and lilypond will write them out in tab for us. Note- it doesn't work in 
% the other direction ! 
% We include which octave a note like so: g'
% We include the string number like so :  g'\5
% We indicate a hammer-on or pull-off with a slur: a( b\3)
% We indicate right hand fingers: g'-T
% We dont need to specify which fret, the program determines that from the 
% pitch, and if we gave it a string, it uses that as well
melody = { g16 b d' g'\5         e' c' g c'
          a\3(  b\3) d' g'\5
}

% Here we show the chord structure of what's being played
chordpart = \chords { g4 c4 g4 }

% Here we add some lyrics. Note: any slurs do not by default take up 
% multiple syllables
lyricpart = \lyricmode { 
  When I am a     go- in up to 
  Ca- na- da      
}

\score {
% We display the chordpart simultaneously with, and on top of, the tab
% using the << and >> markers
<<
  \chordpart
  \new TabStaff {
    \set TabStaff.tablatureFormat = #fret-number-tablature-format-banjo
    \set TabStaff.stringTunings = #banjo-open-g-tuning

    % keep beaming horizontal, and below the staff 
    \override Beam #'positions = #'(-4.2 . -4.2)
    \melody
  }
>>
}

\markup { \hspace #1.0 }

% We also display the music (and chords) on a normal staff
% We start it in a new Score to indicate the two staves are not 
% related (like a treble/bass pair for piano)
\score {
<<
  \chordpart
  \new Staff {
    \set Staff.midiInstrument = #"banjo"
    \key g \major
    \clef "treble_8"
    <<
      \new Voice = "one" { \melody }
      \new Lyrics \lyricsto "one" \lyricpart
    >>   
  }
>>
} 