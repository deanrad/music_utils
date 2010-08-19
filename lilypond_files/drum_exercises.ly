\version "2.12.3"
\header {
  title = "Drum Cheat Sheet for Lilypond"
}

% TODO how to get initial bar-line ? 
%   fail: \bar "|" in  
%       (adds space, but no glyph that I can see)

% the sticking instructions are tied to spacers so they
% can be written out separately, however they must be an 
% exact copy of the timings if they are to align. 
%
% Alternatively, the stickings can be written out in-line
% if the mingling of sticking and note data is not a bother.

sticking = { s8_"R" s8_"L" 
             s16_"R" s_"L" s_"R" s_"L"}
\score{
  \new DrumStaff = "snare" 
  \with { \remove Time_signature_engraver }{
    \tempo 4=80
    \time 2/4
    \new DrumVoice{
      <<
  	   \drummode{ 
	   	  \repeat volta 2 {
	     sn8 sn sn16 sn sn sn 
	     }
	     \alternative{ 
	       {sn4->_"R" sn4->_"L" }
	       {sn4:32 sn4->}
	     }
	   }
	   \sticking
	   >>
    }
  }
  \layout{}
  \midi{} 
}
