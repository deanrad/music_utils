\version "2.12.3"

\header{
  title = "Walkin' Around In The Snow"
  subtitle = "Outlaw Family Band"
}

myChords = \chordmode {   
  \repeat volta 2{ 
    g1   c1 
    d1.
    g1 
  }
  d1.
  g1
}

myStrum = \repeat unfold 14 \relative c''{ g8 g8 r16 g16 g16 g16 }
myStrumTips = {s8 \downbow s8. \downbow s16 \upbow s16 \downbow s16 \upbow }

%% The primary score first - the midi-only score follows it
\score {
  <<
    \new ChordNames { \set chordChanges = ##t \myChords }
    \new Staff \with {
      %% Uncomment the following to automatically tie notes
      %%\remove "Note_heads_engraver"
      %%\consists "Completion_heads_engraver"
    }{ 
      \time 2/4
      \tempo 4 = 132
      \set beatLength = #(ly:make-moment 1 4)  % beam quarter notes
      \improvisationOn 
      <<  \myStrum \myStrumTips >>
    }
  >>
  \layout{}
}

\smaller \markup{
 \column { \wordwrap-string #"Chorus:
 
 Walkin' around in the snow, got nowhere to go
 
 My feet are gettin' cold, my soul is old and gray
 
 Been wanderin' too long, it ain't right and it ain't wrong 
 
 These nights last too long, and I haven't slept for days
 
 My heart is a-wanderin', has no place to stay.." 
 }
 }
 
 \markup {
 \column {
 
 \hspace #2.0
  "I've toiled, traveled and I've tried,"
  "   I've torn whats left inside" 
  "Lost my spirit and my pride"
  "   Somewhere down the dusty road.." 
  "Sometimes its hard to bear,"
  "   Sometimes I just don't care" 
  "This life ain't never fair"
  "   If there's one thing that I know"
  "My heart is a wanderer,"
  "   Has no place to go.."

 \hspace #1.0
 "<Chorus>"
 
 \hspace #2.0
  "Dogs howlin' at the moon,"
  "   This night fell too soon" 
  "Headed south from the graveyard of"
  "   A thousand yesterdays.." 
  "I stopped to cough up death,"
  "   Cried out to catch my breath" 
  "Then lit another cigarette"
  "   To help death on its way"
  "My heart is a wanderer,"
  "   Has no place to stay.."

 \hspace #1.0
 "<Solo>"
 
 }
 \column {
 \hspace #2.0
  \italic{ "(Quieter)" }
  "Down to the frozen waters"
  "   I've known since I was a kid" 
  "My father brought me fishin there"
  "   Just like his father did.." 
  "That boy's become a man,"
  "   And I'll never fish again" 
  "My heart and soul are out there somewhere"
  "   Dancin in the wind.."
  "My spirit is a wanderin',"
  "   Death my only friend.."

 \hspace #1.0
 "<Chorus>"
 }
 \column {
   \hspace #2.0
 	"Arrgmt:"
	"  Intro Riff"
  	"  Chorus"
	  "  V1"
  	"  Chorus"
	"  V2" 
	"  Solo"
	"  V3 (quieter)"
	"  Chorus"
	"  Outro Riff"
  }
}

%% The midi-only score, in order to unfold repeats
\score {
  \new Staff="chords in Bb" {
  	\set Staff.midiInstrument = #"banjo"
    \unfoldRepeats
    \transpose g' bes \myChords
  }
  \midi{}
}