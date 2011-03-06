\version "2.12.3"

\header{
  title = "Bring My Ding Ding Back"
  subtitle = "Dean Radcliffe" 
  % subsubtitle = "Key of G"
	tagline = ##f
}

\paper{
  indent = 0\cm         % unindent first line
  ragged-right = ##t    % allow right side to get 'ragged'
}

introChords =  \chordmode {

}
verseChords = \chordmode {  
%  \set Score.proportionalNotationDuration = #(ly:make-moment 1 4)

    g2 c2    g1      g1      d1 
    g2 g2:7  c2  e2:dim  g2  d2  g2  r2
}
chorusChords = \chordmode {
    c1       g1      g1      d1
    g2 g2:7  c2  e2:dim  g2  d2  g2  r2
}
bridgeChords = \chordmode {
}
outroChords = \chordmode {
}

myChordChart = { 
   \mark \markup{ \circle "V" } \verseChords  \break
   \mark \markup{ \circle "C" } \chorusChords \break
%   \mark \markup{ \circle "Br"} \bridgeChords \break
%   \mark \markup{ \circle "O" } \outroChords  \break
}

%% The primary score first - the midi-only score follows it
\score {
  <<
    \set Score.proportionalNotationDuration = #(ly:make-moment 2 6)
    \new ChordNames { 
      \set chordChanges = ##t
      \transpose g g { \myChordChart } 
    }
    \new Staff \with {
      %% Uncomment the following to automatically tie notes
      %%\remove "Note_heads_engraver"
      %%\consists "Completion_heads_engraver"
    }{ 
      \time 4/4
      \tempo 4 = 132
      % \set beatLength = #(ly:make-moment 1 4)  % beam quarter notes
      \transpose g g { \key g \major \myChordChart }
    }
  >>
  \layout{}
}

\markup{
 \column {
%   "Arrgmt:"
%   "  V1/Chorus" 
%   "  V2/Chorus" 
%   "  Bridge"
%   "  Chorus"
%   "  V3/Chorus"
%   "  Intro Riff (fade)"
  }
}

\markup{
  \column{ 
    \line{ \bold "Intro" "(spoken, over quiet finger plucked half-time chords)" }
    "What if love was more like your local library than a bookstore ?"
    "Where you can borrow and read a book whenever you want"
    "As long as you return it on time, and dont forget about the books you got at home"
    "You know what I'm sayin?"
    "Here's a little song about it, it goes somethin like this..."
  }
}

\markup{
  \column{ 
    \bold "Verse 1:"
    "After years of love it seemed, our love became routine"
    "The time had come, to take a holiday"
    "Theres this woman down the way- baby she just wants to play"
    "Gonna lend my love away, but I'll bring it back"
  }
}
\markup{
  \column{ 
    \bold "Chorus:"
    "Bring it back, bring it back .. I'll bring my ding-ding back"
    "Ain't no such thing as too much time between"
    "Cuz you know you are to me, like the devil and the deep blue sea.."
    "To my heart you hold the key - gonna bring it back"
  }
}
\markup{
  \column{ 
    \bold "Verse 2:"
    "Last night when I's alone, came a ringin' of my phone"
    "I checked the text - said come on by and play"
    "I was feelin' kinda tired, but I just dun got inspired"
    "Tonight - gonna stoke the fire, but I'll bring it back"
  }
}
\markup{
  \column{ 
    \bold "Verse 3:"
    "One night while having drinks, I met a flirty little minx"
    "With legs that went for miles and miles and miles"
    "When she said lets hit the hay - I just didnt know what to say"
    "Tonight I may go astray - but I'll bring it back"
  }
}
% \markup{
%   \column{ 
%     \bold "Verse 3:"
%     "After last weeks show, I met a singer, dontcha know"
%     "Her voice - just like an angel's made me weep"
%     "When she said lets hit the hay - I just didnt know whatto say"
%     "Tonight I'ma go astray - but I'll bring it back"
%   }
% }
\markup{
  \column{ 
    \line{ \bold "Extra Blue Verse"}
    "Well now just the other day, brought my ding-ding out to play"
    "Its shiny fireman's helmet all erect"
    "Then I didn't know what to do, when its work was done too soon"
    "I'll do what gotta do, justto bring it back !"
  }
}

\markup{
  "Arrangement: I - V - C - V - C - Sx3 - C - V - C"
}

% Draws the arrangement of the song using repeats
% \score {
%   \new Staff \with {
%     \override BarLine #'bar-size = #4
%     \consists Bar_engraver
%   }
%   \repeat volta 2 {
%    \mark \markup{ \circle "I" } a1
%    \mark \markup{ \circle "V" } b1
%    \mark \markup{ \circle "C" } c1
%    } 
%    \alternative { 
%      {d c e}
%      {e a}
%     }
% }

%% The midi-only score, in order to unfold repeats
\score {
  \new Staff="chords in C" {
  	% \set Staff.midiInstrument = #"banjo"
	% play out any volta or percent repeats
    \tempo 4 = 132

    \unfoldRepeats
    
    \transpose c' c' { \myChordChart }
  }
  \midi{}
}