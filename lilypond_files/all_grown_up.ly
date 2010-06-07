\version "2.12.3"

\header{
  title = "All Grown Up"
  subtitle = "Elvis Costello" 
  subsubtitle = "(in C, chords transposed for banjar)"
}

% the chords to the song, written in the key of the recording (D)
myChords = \chordmode {  
     % verse 
     \mark \markup{ \circle "V" }
	 d2.      g      d2.
	 e:m      a4.:sus4 a4. 
	 d2.      d4. b4.:m   
	 cis2.      fis:m   fis:m    a:sus4 a \break
	 % chorus
     \mark \markup{ \circle "C" }
	 d2.  a    g  d
	 d    fis  g  g:m       
	 d    fis  g  e:m  e:m  \break
	 % bridge
     \mark \markup{ \circle "Br" }  
	 b:m  c   d   c   c
	 b:m  d  g  e:m  
	 e:m  c  a4.:sus4 a4.  \break
	 % outro
     \mark \markup{ \circle "O" }  
	 d2.        a4. g4.      d2.
	 a4. g4.    d2.
	 e:m \repeat percent 3{ c e:m }
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
      \transpose d' f { \myChords } 
    }
    \new Staff \with {
      %% Uncomment the following to automatically tie notes
      %%\remove "Note_heads_engraver"
      %%\consists "Completion_heads_engraver"
    }{ 
      \time 6/8
      %\set beatLength = #(ly:make-moment 1 4)  % beam quarter notes
      \transpose d' c'{ \key d \major \myChords }
    }
  >>
  \layout{}
}

\markup{
 \column {
 	"Arrgmt:"
	"  Intro Riff (not notated)"
	"  V1/Chorus" 
	"  V2/Chorus" 
	"  Bridge"
	"  Chorus"
	"  V3/Chorus"
	"  Chorus"
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
    
    % lets hear it a step below the recording which was in D
    \transpose d' c' { \myChords }
  }
  \midi{}
}