\version "2.12.3"

\header{
  title =       "Yoda (origainlly Lola)"
  subtitle =    "Weird Al (originally The Kinks)" 
  subsubtitle = "Key of E, mixolydian"
	tagline =     ##f  %Turns off the lilypond message in output PDF  
}

\paper{
  indent = 0\cm         % Increase to 1 or greater to indent first line
  ragged-right = ##t    % Set to ##f to align right edges to each other
}

songTempo = { \tempo 4=76 }  % 4=76 means 76 quarter notes per minute
songTime  = { \time  4/4 }
songKey   = { \key e \mixolydian }

% Snippets that occur repeatedly are defined and given names here
riffOne = \chordmode{ c4        c4       c16 c c c16~    c16 d16 d8 }

introChords =  \chordmode {
  \set Score.proportionalNotationDuration = #(ly:make-moment 1 8)

  \riffOne  |  e1
}
verseChords = \chordmode {  
  \set Score.proportionalNotationDuration = #(ly:make-moment 1 4)

  \repeat volta 2 {
    e1      |  a2  d2   |   e1   |  
  }
  \alternative{     
    { a2 d16:sus4 d:sus4 d:sus4 d16:sus4~ d16:sus4 d16 d8 \break }
    { a2 d2  | \riffOne   }
  }
  
    e1 | e1 
}
bridgeOneChords = \chordmode {
    b1      | fis     |  a1       |  a2   a16:7 a:7 a:7 a:7~ a16:7 a16:6 a8:6 \break         
}
chorusChords = \chordmode {
  \set Score.proportionalNotationDuration = #(ly:make-moment 1 2)

    e1      | a2   d2  |
  \repeat volta 2 {
    e1      | a2   d2  | \riffOne
  }
  \repeat percent 2 { e1 }
}
bridgeTwoChords = \chordmode {
  \set Score.proportionalNotationDuration = #(ly:make-moment 1 3)
  \repeat percent 3 {
    a8.  e8.  b8~   b4.  e8   | 
  }
  a8.  e8.  cis8:m~ cis2:m | 
  b1
}
verseAltChords = \chordmode {  
  \set Score.proportionalNotationDuration = #(ly:make-moment 2 3)

  \repeat volta 2 {
    e1      |  a2  d2   |   e1   |  
  }
  \alternative{     
    { a2 d16:sus4 d:sus4 d:sus4 d16:sus4~ d16:sus4 d16 d8 }
    { a1 }
  }

}

myChordChart = { 
   \mark \markup{ \circle "I"  } \introChords  \break
   \mark \markup{ \circle "V"  } \repeat volta 2 { \verseChords }  \break
   \mark \markup{ \circle "B1" } \bridgeOneChords \break
   \mark \markup{ \circle "C"  } \chorusChords  \break
   \mark \markup{ \circle "B2" } \bridgeTwoChords \break
   \mark \markup{ \circle "V2" } \verseAltChords  \break
}

%% The primary score first - the midi-only score follows it
\score {
  <<
    % Use \transpose d' c' \myChordChart to transpose down a step
    \new ChordNames { 
      \set chordChanges = ##t
      \myChordChart 
    }
    \new Staff \with {
      %% Uncomment the following to automatically tie notes
      % \remove "Note_heads_engraver"
      % \consists "Completion_heads_engraver"
      \remove "Key_engraver"
      \remove "Accidental_engraver"
    }{ 
      \songTempo
      \songTime
      \songKey
      \myChordChart
    }
  >>
  \layout{}
}

\markup{
  
  Back to Bridge 1, then Chorus, repeating till end
}

%% The midi-only score, in order to unfold repeats
\score {
  \new Staff="chords in E" {
  	% \set Staff.midiInstrument = #"banjo"
    \songTempo

  	% play out any volta or percent repeats
    \unfoldRepeats
    
    \myChordChart
  }
  \midi{}
}