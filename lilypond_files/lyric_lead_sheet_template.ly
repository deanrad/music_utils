\version "2.12.3"

\header{
  title = "{SONG_TITLE}"
  subtitle = "{SONG_SUBTITLE}" 
  subsubtitle = "{SONG_SUBSUBTITLE}"
}

% the chords to the song, written in the key of the recording (D)

verseChords = \chordmode{ 
  d1
}
myChords = \chordmode {  
   % verse 
   \mark \markup{ \circle "V" }
   \verseChords
	 \break

	 % chorus
   \mark \markup{ \circle "C" }
   \break

	 % bridge
   \mark \markup{ \circle "Br" }  
	 \break

	 % outro
     \mark \markup{ \circle "O" }  
 	 % 
 }

%% The primary score first - the midi-only score follows it
\score {
  <<
    % Chord chart so that banjar can play the song in C, a step
    % below the recorded version.
    % Use \transpose d' c' to emit a guitar part for playing in C
    \new ChordNames { 
      \set chordChanges = ##t
      \transpose d' d' { \myChords } 
    }
    \new Staff \with {
      %% Uncomment the following to automatically tie notes
      %%\remove "Note_heads_engraver"
      %%\consists "Completion_heads_engraver"
    }{ 
      \time 4/4
      %\set beatLength = #(ly:make-moment 1 4)  % beam quarter notes
      \transpose d' c'{ \key d \major \myChords }
    }
  >>
  \layout{}
}

\markup{
 \column {
 	"Arrgmt:"
	"  Intro"
	"  V1/Chorus" 
	"  V2/Chorus" 
	"  Bridge"
	"  Chorus"
	"  V3"
	"  Chorus 2x"
	"  Outro"
	\italic " See http://www.elviscostello.info/guitar/mlar.html#all_grown_up"
  }
}

%% The midi-only score, in order to unfold repeats
\score {
  \new Staff="chords in C" {
  	% \set Staff.midiInstrument = #"banjo"
	% play out any volta or percent repeats
    \tempo 4 = 88

    \unfoldRepeats
    
    \transpose c' c' { \myChords }
  }
  \midi{}
}