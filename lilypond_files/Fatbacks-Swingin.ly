\version "2.8"
%{ TODO
% Remove tuplet brackets on all but top line
%    fail: \new DrumStaff \with { \remove Tuplet_engraver }
%}

% Sets scaling for all staffs in the document
#(set-global-staff-size 22)                  % the staff height and such
#(define myspacing  (ly:make-moment 1 15) )  % the width of the smallest musical event  

\header{
  title = \markup{ \lower #5 "Swingin' Bassdrum" }
}
% % % % % % % Music - Begin % % % % % %
% ostinato = \drummode{ << {cymr4   cymr8. cymr16} \\ {s4 hhp4} >> }
% rideVoice =  \new Voice = "1" { \voiceOne \drums { cymr4   cymr8. cymr16 } }
jazzRide = \drummode{ cymr4 \times 2/3{ cymr4 cymr8  } }
syncHHSn = \drummode{ s4 <hhp>4 }
bdA      = \drummode{ bd4 s4 }
bdB      = \drummode{ \times 2/3{ s4 bd8 } s4 }
bdC      = \drummode{ s4 bd4 }
bdD      = \drummode{ s4 \times 2/3{ s4 bd8 }}
bdE      = \drummode{ bd4 \times 2/3{ s4 bd8 } }
bdF      = \drummode{ \times 2/3{ bd4 bd8 } s4 }
bdG      = \drummode{ \times 2/3{ s4 bd8 } bd4 }
bdH      = \drummode{ s4 \times 2/3{ bd4 bd8 } }
bdI      = \drummode{ bd4 bd }
bdJ      = \drummode{ \times 2/3{ s4 bd8 } \times 2/3{ s4 bd8 } }
bdK      = \drummode{ \times 2/3{ bd4 bd8 } bd4 }
bdL      = \drummode{ \times 2/3{ bd4 bd8 } \times 2/3{ s4 bd8 } }
bdM      = \drummode{ bd4 \times 2/3{ bd4 bd8 } }
bdN      = \drummode{ \times 2/3{ s4 bd8 } \times 2/3{ bd4 bd8 } }
bdO      = \drummode{ \times 2/3{ bd4 bd8 } \times 2/3{ bd4 bd8 } }
% % % % % % % End  -  Music % % % % % %
\book{ 
  \markup { \column {
  \score{
     \new DrumStaff \with {\remove Time_signature_engraver \remove Clef_engraver}
     {
       \time 2/4
       \set Score.proportionalNotationDuration = #myspacing
       \set Staff.instrumentName = #"1."
     	\new DrumVoice = "ride" {
		  \voiceOne \repeat unfold 2 { << \jazzRide \syncHHSn \bdA >> } 
		}
     } % end DrumStaff
     \layout{}
  } % end Score
  \score{
     \new DrumStaff \with {
     \remove Time_signature_engraver \remove Clef_engraver
     \override Stem #'length = #(magstep 18)}
     {
       \time 2/4
       \set Score.proportionalNotationDuration = #myspacing
       \set Staff.instrumentName = #"3."
     	\new DrumVoice = "ride" \with{\remove Tuplet_engraver} {
		  \voiceOne \repeat unfold 2 { << \jazzRide \syncHHSn \bdC >> } 
		}
     } % end DrumStaff
     \layout{}
  } % end Score
  \score{
     \new DrumStaff \with {
     \remove Time_signature_engraver \remove Clef_engraver
     \override Stem #'length = #(magstep 18)}
     {
       \time 2/4
       \set Score.proportionalNotationDuration = #myspacing
       \set Staff.instrumentName = #"5."
     	\new DrumVoice = "ride" \with{\remove Tuplet_engraver} {
		  \voiceOne \repeat unfold 2 { << \jazzRide \syncHHSn \bdE >> } 
		}
     } % end DrumStaff
     \layout{}
  } % end Score
  \score{
     \new DrumStaff \with {
     \remove Time_signature_engraver \remove Clef_engraver
     \override Stem #'length = #(magstep 18)}
     {
       \time 2/4
       \set Score.proportionalNotationDuration = #myspacing
       \set Staff.instrumentName = #"7."
     	\new DrumVoice = "ride" \with{\remove Tuplet_engraver} {
		  \voiceOne \repeat unfold 2 { << \jazzRide \syncHHSn \bdG >> } 
		}
     } % end DrumStaff
     \layout{}
  } % end Score
  \score{
     \new DrumStaff \with {
     \remove Time_signature_engraver \remove Clef_engraver
     \override Stem #'length = #(magstep 18)}
     {
       \time 2/4
       \set Score.proportionalNotationDuration = #myspacing
       \set Staff.instrumentName = #"9."
     	\new DrumVoice = "ride" \with{\remove Tuplet_engraver} {
		  \voiceOne \repeat unfold 2 { << \jazzRide \syncHHSn \bdI >> } 
		}
     } % end DrumStaff
     \layout{}
  } % end Score
  \score{
     \new DrumStaff \with {
     \remove Time_signature_engraver \remove Clef_engraver
     \override Stem #'length = #(magstep 18)}
     {
       \time 2/4
       \set Score.proportionalNotationDuration = #myspacing
       \set Staff.instrumentName = #"11."
     	\new DrumVoice = "ride" \with{\remove Tuplet_engraver} {
		  \voiceOne \repeat unfold 2 { << \jazzRide \syncHHSn \bdK >> } 
		}
     } % end DrumStaff
     \layout{}
  } % end Score
  \score{
     \new DrumStaff \with {
     \remove Time_signature_engraver \remove Clef_engraver
     \override Stem #'length = #(magstep 18)}
     {
       \time 2/4
       \set Score.proportionalNotationDuration = #myspacing
       \set Staff.instrumentName = #"13."
     	\new DrumVoice = "ride" \with{\remove Tuplet_engraver} {
		  \voiceOne \repeat unfold 2 { << \jazzRide \syncHHSn \bdM >> } 
		}
     } % end DrumStaff
     \layout{}
  } % end Score
  \score{
     \new DrumStaff \with {
     \remove Time_signature_engraver \remove Clef_engraver
     \override Stem #'length = #(magstep 18)}
     {
       \time 2/4
       \set Score.proportionalNotationDuration = #myspacing
       \set Staff.instrumentName = #"15."
     	\new DrumVoice = "ride" \with{\remove Tuplet_engraver} {
		  \voiceOne \repeat unfold 2 { << \jazzRide \syncHHSn \bdO >> } 
		}
     } % end DrumStaff
     \layout{}
  } % end Score
 %%%%%%%%%%%%%%%% NEXT COLUMN %%%%%%%%%%%%%%%%%%%%%%%%%%%
 } \column {
  \score{
     \new DrumStaff \with {\remove Time_signature_engraver \remove Clef_engraver}
     {
       \time 2/4
       \set Score.proportionalNotationDuration = #myspacing
       \set Staff.instrumentName = #"2."
	   \new DrumVoice = "ride" { 
         \override TupletBracket #'color = #white 	  	  \override TupletNumber #'color = #white	
		  \voiceOne \repeat unfold 2 { << \jazzRide \syncHHSn \bdB >> } 
		}
     } % end DrumStaff
	  \layout{}
  } % end Score
  \score{
     \new DrumStaff \with {\remove Time_signature_engraver \remove Clef_engraver}
     {
       \time 2/4
       \set Score.proportionalNotationDuration = #myspacing
       \set Staff.instrumentName = #"4."
	   \new DrumVoice = "ride" { 
         \override TupletBracket #'color = #white  \override TupletNumber #'color = #white	
		  \voiceOne \repeat unfold 2 { << \jazzRide \syncHHSn \bdD >> } 
		}
     } % end DrumStaff
	  \layout{}
  } % end Score
  \score{
     \new DrumStaff \with {\remove Time_signature_engraver \remove Clef_engraver}
     {
       \time 2/4
       \set Score.proportionalNotationDuration = #myspacing
       \set Staff.instrumentName = #"6."
	   \new DrumVoice = "ride" \with {\remove Tuplet_engraver} { 
         \override TupletBracket #'color = #white 	  	  \override TupletNumber #'color = #white	
		  \voiceOne \repeat unfold 2 { << \jazzRide \syncHHSn \bdF >> } 
		}
	       % \\
	       % \drummode { s4  hhp4 }
     } % end DrumStaff
	  \layout{}
  } % end Score
  \score{
     \new DrumStaff \with {\remove Time_signature_engraver \remove Clef_engraver}
     {
       \time 2/4
       \set Score.proportionalNotationDuration = #myspacing
       \set Staff.instrumentName = #"8."
	   \new DrumVoice = "ride" { 
         \override TupletBracket #'color = #white 	  	  \override TupletNumber #'color = #white	
		  \voiceOne \repeat unfold 2 { << \jazzRide \syncHHSn \bdH >> } 
		}
     } % end DrumStaff
	  \layout{}
  } % end Score
  \score{
     \new DrumStaff \with {\remove Time_signature_engraver \remove Clef_engraver}
     {
       \time 2/4
       \set Score.proportionalNotationDuration = #myspacing
       \set Staff.instrumentName = #"10."
	   \new DrumVoice = "ride" \with {\remove Tuplet_engraver} { 
         \override TupletBracket #'color = #white 	  	  \override TupletNumber #'color = #white	
		  \voiceOne \repeat unfold 2 { << \jazzRide \syncHHSn \bdJ >> } 
		}
     } % end DrumStaff
	  \layout{}
  } % end Score
  \score{
     \new DrumStaff \with {\remove Time_signature_engraver \remove Clef_engraver}
     {
       \time 2/4
       \set Score.proportionalNotationDuration = #myspacing
       \set Staff.instrumentName = #"12."
	   \new DrumVoice = "ride"  { 
         \override TupletBracket #'color = #white 	  	  \override TupletNumber #'color = #white	
		  \voiceOne \repeat unfold 2 { << \jazzRide \syncHHSn \bdL >> } 
		}
     } % end DrumStaff
	  \layout{}
  } % end Score
  \score{
     \new DrumStaff \with {\remove Time_signature_engraver \remove Clef_engraver}
     {
       \time 2/4
       \set Score.proportionalNotationDuration = #myspacing
       \set Staff.instrumentName = #"14."
	   \new DrumVoice = "ride"  { 
         \override TupletBracket #'color = #white 	  	  \override TupletNumber #'color = #white	
		  \voiceOne \repeat unfold 2 { << \jazzRide \syncHHSn \bdN >> } 
		}
     } % end DrumStaff
	  \layout{}
  } % end Score
 %%%%%%%%%%%%%%%% END LAST COLUMN %%%%%%%%%%%%%%%%%%%%
 } } % end column, markup
 \markup {
 	\column \sans \smaller{
   "Practice Tips:"
   " - use a metronome, starting slowly, and increasing with mastery" 
   " - first smooth out problems, even with transitions, before moving on"  
   " - Never lose the timing of the ride !"
   " - fill the in-between beats in with another voice, or switch voices"
   " - have fun !!"
   }
 }
} % end book
