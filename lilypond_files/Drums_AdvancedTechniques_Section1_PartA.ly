%{
  The first set of exerises in the Chapin book
  Advanced Techniques for the Modern Drummer
  TODOs:
     find way to loop, so as not to repeat the DrumStaff declarations
     include MIDI output (does dotted-8th/16th sound ok ?)
     2 column layout possible ? 
%}

\version "2.12.3" % Lilypond version
\header{
  title = "Jazz Independence Exercises for Drumset"
}

%{ A custom drumstaff definition for the Advanced Techniques %}
#(define advTechDrums '((ridecymbal default #t  3)
                       (snare default #t -2)))

advStaff = {
  % This defines a staff with only two lines.
  % It also defines the positions of the two lines.
  \override Staff.StaffSymbol #'line-positions = #'(-2 3)

  % This ensures that quarter notes will align, and that all 
  % examples of the same duration will have the same width 
  \set Score.proportionalNotationDuration = #(ly:make-moment 1 12)
  \override Score.SpacingSpanner #'strict-note-spacing = ##t

  % This is neccessary; if not entered, the barline would be too short!
  \override Staff.BarLine #'bar-size = #3

  \set DrumStaff.drumStyleTable = #(alist->hash-table advTechDrums)
}

jazzRide = \drummode { \repeat unfold 2{ cymr4   cymr8. cymr16 }  }

%{ Begin generated set of exercises %} 
snareA  = \drummode { \repeat unfold 2 { sn8. sn16   sn8. sn16 } }
snareAA = \drummode { \repeat unfold 2 { sn4         sn8. sn16 } }
snareAB = \drummode { \repeat unfold 2 { sn8. sn16   sn4       } }
snareBA = \drummode { \repeat unfold 2 { r4          sn8. sn16 } }
snareBB = \drummode { \repeat unfold 2 { sn8. sn16   r4        } }
snareCA = \drummode { \repeat unfold 2 { sn4         r8. sn16  } }
snareCB = \drummode { \repeat unfold 2 { r8.  sn16   sn4       } }
snareDA = \drummode { \repeat unfold 2 { r8.  sn16   sn8. sn16 } }
snareDB = \drummode { \repeat unfold 2 { sn8. sn16   r8.  sn16 } }
snareEA = \drummode { \repeat unfold 2 { r4          r8.  sn16 } }
snareEB = \drummode { \repeat unfold 2 { r8.  sn16   r4        } }
snareF  = \drummode { \repeat unfold 2 { r8.  sn16   r8.  sn16 } }
%{ End generated set of exercises %} 


%{ Begin pairings of exercises with jazzRide time %} 

\new DrumStaff 	<<
  \advStaff
  \set Staff.instrumentName = #"1."
  \new DrumVoice { \stemUp \jazzRide }
  \new DrumVoice { \stemDown \snareA }
>>

\new DrumStaff 	<<
  \advStaff
  \set Staff.instrumentName = #"2."
  \new DrumVoice { \stemUp \jazzRide }
  \new DrumVoice { \stemDown \snareAA }
>>

\new DrumStaff 	<<
  \advStaff
  \set Staff.instrumentName = #"3."
  \new DrumVoice { \stemUp \jazzRide }
  \new DrumVoice { \stemDown \snareAB }
>>

\new DrumStaff 	<<
  \advStaff
  \set Staff.instrumentName = #"4."
  \new DrumVoice { \stemUp \jazzRide }
  \new DrumVoice { \stemDown \snareBA }
>>

\new DrumStaff 	<<
  \advStaff
  \set Staff.instrumentName = #"5."
  \new DrumVoice { \stemUp \jazzRide }
  \new DrumVoice { \stemDown \snareBB }
>>

\new DrumStaff 	<<
  \advStaff
  \set Staff.instrumentName = #"6."
  \new DrumVoice { \stemUp \jazzRide }
  \new DrumVoice { \stemDown \snareCA }
>>

\new DrumStaff 	<<
  \advStaff
  \set Staff.instrumentName = #"7."
  \new DrumVoice { \stemUp \jazzRide }
  \new DrumVoice { \stemDown \snareCB }
>>

\new DrumStaff 	<<
  \advStaff
  \set Staff.instrumentName = #"8."
  \new DrumVoice { \stemUp \jazzRide }
  \new DrumVoice { \stemDown \snareDA }
>>

\new DrumStaff 	<<
  \advStaff
  \set Staff.instrumentName = #"9."
  \new DrumVoice { \stemUp \jazzRide }
  \new DrumVoice { \stemDown \snareDB }
>>

\new DrumStaff 	<<
  \advStaff
  \set Staff.instrumentName = #"10."
  \new DrumVoice { \stemUp \jazzRide }
  \new DrumVoice { \stemDown \snareEA }
>>

\new DrumStaff 	<<
  \advStaff
  \set Staff.instrumentName = #"11."
  \new DrumVoice { \stemUp \jazzRide }
  \new DrumVoice { \stemDown \snareEB }
>>

\new DrumStaff 	<<
  \advStaff
  \set Staff.instrumentName = #"12."
  \new DrumVoice { \stemUp \jazzRide }
  \new DrumVoice { \stemDown \snareF }
>>

%{ End pairings of exercises with jazzRide time %} 


