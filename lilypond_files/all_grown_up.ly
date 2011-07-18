\version "2.12.3"

\header{
  title = "All Grown Up"
  subtitle = "Elvis Costello" 
  subsubtitle = "played in C, chords notated in F"
	tagline = ##f
}

\paper{
  indent = 0\cm         % unindent first line
  ragged-right = ##t    % allow right side to get 'ragged'
}

% the chords to the song, written in the key of the recording (D)
introChords =  \chordmode {
  \set Score.proportionalNotationDuration = #(ly:make-moment 1 8)

     f4.  c4.  g4.  c4.  
     f4.  a4.  g4.  a4.
}
verseChords = \chordmode {  
  \set Score.proportionalNotationDuration = #(ly:make-moment 1 4)

	 d2.        g           d2.       e:m         a4.:sus4 a4. \break
	 d2.        d4. b4.:m   cis2.:m   
	 fis:m      fis:m       a         a4.:sus4 a4. 
}
chorusChords = \chordmode {
	 d2.  a    g  d
	 d    fis  g  g:m  \break
	 d    fis  g  e:m  e:m
}
bridgeChords = \chordmode {
	 b:m  c   d   c4. c8 d4   c2. \break
	 b:m  d  g  e:m  
	 e:m  c  a4.:sus4 a4. 
}
outroChords = \chordmode {
	 d2.       a4. g4.      d2.
	 a4. g4.   d2.
	 \repeat percent 2{ e:m c }
}

myChordChart = { 
   \mark \markup{ \circle "I" } \introChords  \break
   \mark \markup{ \circle "V" } \verseChords  \break
   \mark \markup{ \circle "C" } \chorusChords \break
   \mark \markup{ \circle "Br"} \bridgeChords \break
   \mark \markup{ \circle "O" } \outroChords  \break
}

%% The primary score first - the midi-only score follows it
\score {
  <<
    % Chord chart so that banjar can play the song in C, a step
    % below the recorded version.
    % Use \transpose d' c' to emit a guitar part for playing in C
    % Use \transpose d' f to emit a banjar part for playing in C
    \new ChordNames { 
      \set chordChanges = ##t
      \transpose d' c { \myChordChart } 
    }
    \new Staff \with {
      %% Uncomment the following to automatically tie notes
      %%\remove "Note_heads_engraver"
      %%\consists "Completion_heads_engraver"
    }{ 
      \time 6/8
      %\set beatLength = #(ly:make-moment 1 4)  % beam quarter notes
      \transpose d' c{ \key c \major \myChordChart }
    }
  >>
  \layout{}
}

\markup{
 \column {
 	"Arrgmt:"
	"  Intro"
	"  V1/Chorus" 
	"  Bridge (did i hear you right)"
	"  V2/Chorus" 
	"  Intro"
	"  V3/Chorus"
	"  Intro Riff (fade)"
	\italic " See http://www.elviscostello.info/guitar/mlar.html#all_grown_up"
  }
}

% Draws the arrangement of the song using repeats
% TODO - dont use chordmode !
\score {
  \new Staff \with {
    \override BarLine #'bar-size = #4
    \consists Bar_engraver
  }
  \repeat volta 2 {
   \mark \markup{ \circle "I" } a1
   \mark \markup{ \circle "V" } b1
   \mark \markup{ \circle "C" } c1
   } 
   \alternative { 
     {d c e}
     {e a}
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