\version "2.12.3"
\header {
  title = "Example Drum Notations"
  % Note that every drum expression may not be possible. See the Lilypond
  % docs or this snippet for more:
  % http://lsr.dsi.unimi.it/LSR/Item?id=566
}
% Legend: 
%        voices     sn hh bd (see docs for all)
%           rest    r4       (or s4 which is invisible)
%     1/4 note      sn4      (if omitted, previous note duration used)
%          accent   -> or -^
%      tie to next  ~
%          buzz     :32
%  simultaneous     <sn bd>  or <<  \partA \partB >>
%  expand variable  \partA
%   repeat barline  \bar "|:"
%   section marker  \mark \markup{ \box A }
%     dynamics      sn4\>  sn4\p\!  ( > begins and ! ends the 'hairpin')

% Define some 'macros' which expand to snare drum flams or drags
% (Could do this for other voices as well) 
% TODO Flam and drag gracenotes - be able to turn off the slur

snflam = \drummode { 
   \override Stem #'length = #4 
   \acciaccatura {sn8} 
   \revert Stem #'length 
}

sndrag = \drummode {
   \override Stem #'length = #4 
   \acciaccatura { sn16[ sn] }
   \revert Stem #'length 
}
ghost = \drummode{  <\parenthesize sn> }

% % % % % % % % % % Begin rudimental staff % % % % % % % % % %
\new DrumStaff{
  \time 4/4
  \drummode{ 
      sn4\mf sn4-> sn4 \snflam sn4-> 
      \bar "|:"
      sn4-^ sn4 \snflam sn4 sn4 
      \bar ":|" \mark \markup{ \box A }
      \sndrag sn\> sn \times 2/3{ sn8 sn8 sn8 } sn4\p\!       
      sn8:32~ sn8 sn4:32~ sn4
  }
}

% % % % % % % % % % Begin drumset staff % % % % % % % % % %
\new DrumStaff \with {
  \consists "Parenthesis_engraver" %if using ghost notes
}
<< 
   \time 4/4
   \tempo "Fast" 4=86
   \drummode{ \stemUp
      <bd hh>8 <bd hh> <hh sn>16 
      <\parenthesize sn>16 hh16 <\parenthesize sn>16
      sn8. sn16  sn8. sn16
   }
>>
 
