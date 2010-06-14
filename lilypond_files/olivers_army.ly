\version "2.12.3"

\header {
  title = "Olivers Army"
  subtitle = "Elvis Costello" 
  subsubtitle = "in F (chords notated for banjar)"
}

% the chords to the song, written in the key of the recording (D)
verseChords = \chordmode {  
  a1     a      d      e
  a      a      d      cis:7
  fis:m  b      fis:m  b2 e2  
}
chorusChords = \chordmode {
  a1     d2 e2   a1    d2 e2 
  a1     a1      d1    e1
}
bridgeChords = \chordmode {
  gis:m  fis     e     dis
  cis    fis     e     fis
  e      fis     fis   fis
}

myChordChart = { 
   \mark \markup{ \circle "V" } \verseChords  \break
   \mark \markup{ \circle "C" } \chorusChords \break
   \mark \markup{ \circle "Br"} \bridgeChords \break
   \mark \markup{ \circle "V2" } \transpose c' d' \verseChords \break
}

%% The primary score first - the midi-only score follows it
\score {
  <<
    % Chord chart so that banjar can play the song in C, a step
    % below the recorded version.
    % Use \transpose d' f   for a banjar part for playing in C
    % Use \transpose d' bes for a banjar part for playing in F
    % Use \transpose d' d'  for a banjar part for playing in A
    \new ChordNames { 
      \set chordChanges = ##t
      \transpose d' ees' { \myChordChart } 
    }
    \new Staff \with {
      %% Uncomment the following to automatically tie notes
      %%\remove "Note_heads_engraver"
      %%\consists "Completion_heads_engraver"
    }{ 
      \time 4/4
      %\set beatLength = #(ly:make-moment 1 4)  % beam quarter notes
      \transpose d' bes {
        \key a \major 
        \mark \markup{ \circle "V" } \verseChords  \break
        \mark \markup{ \circle "C" } \chorusChords \break
        \key b \major
        \mark \markup{ \circle "Br"} \bridgeChords \break
        \mark \markup{ \circle "V2" } \transpose c' d' \verseChords \break
      }

    }
  >>
  \layout{}
}

\markup {
 \column {
 	"Arrgmt:"
	"  Intro Riff"
	"  V1/Chorus" 
	"  V2/Chorus" 
	"  Bridge"
	"  Chorus"
	"  V3/Chorus"
	"  Intro Riff (fade)"
	\italic " See http://www.elviscostello.info/guitar/mlar.html#all_grown_up"
  }
}

% Draws the arrangement of the song using repeats
\score {
  \new ChordNames \with {
    \override BarLine #'bar-size = #4
    \consists Bar_engraver
  }
  \chordmode {     
    \repeat volta 2 {
	    a1 b1 c1
     } 
     \alternative { 
       {d c e}
       {e a}
      }
  }
}

%% The midi-only score, in order to unfold repeats
\score {
  \new Staff="chords in C" {
  	% \set Staff.midiInstrument = #"banjo"
	% play out any volta or percent repeats
    \tempo 4 = 88

    \unfoldRepeats
    
    % lets hear it a step below the recording which was in D
    \transpose d' c' { \myChordChart }
  }
  \midi{}
}