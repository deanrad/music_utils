\version "2.12.2"
\header { 
  title = "How to Do Midi in LilyPond"
  composer = "Me"
}

myriff = \chordmode{ d1 g2 c4. d8 }

\score{
<<
\new ChordNames ="chordnames" {
  \myriff
  \myriff
}
\new Staff = "staff"{
  %\key g \major
  \key d \mixolydian
  % TODO - transposition is taking effect but volume is unchanged
  \set Staff.midiMaximumVolume = #0.0
  \set Staff.midiMinimumVolume = #0.0
  \myriff
  
  \key c \mixolydian
  \transpose c' bes {
  \myriff
  }
  % \myriff
}
>>
  \midi{}
  \layout{}
}

% A Score just for MIDI
% \score {
%  \new Score { \myriff } 
%  % no layout block !! 
%  \midi { }
%}

%{
 Script:
   1. Until now, notes have been seen, not heard..
   2. Add \score{ \layout{} \midi{} } around things, and play .midi
   3. Show multiple tracks of midi in live, name chordnames and staff
   4. \set Staff.midiMinimumVolume = #0.0 and rerender
   5. Transposition examples: 
       capo on guitar, transposing instruments, 'try a step lower'
   6. \transpose c' bes {} Transposition fu
   
%}















































