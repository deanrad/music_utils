\version "2.8"
%{
  Inspired by Gary Chafee drumming systems, but ultimately based on 
  basic combinatorical mathematics, these exercises illustrate each
  possible combination of bassdrum hits possible within 1 quarter note
  of a sixteenth-note framework. Each is played against an ostinato of 
  eigth-note hihats (or ride), and the snare on beats 2 and 4. 
  
  There are many ways to play these. At the least, I believe it helpful
  to play w/the hihat in one of two relations: on 2 and 4 with the snare, 
  or on every '&', which is more like a jazz styling. And then, with the 
  usual variations of tempo, dynamics, left/right-handedness..

  Open questions: 
    How to get beaming to stop at 1/4 note boundaries in 4/4 time ? 
       - fail: \set Score.beatLength = #(ly:make-moment 1 16) 
    How to keep beams horizontal ?? 
       - fail: \override Beam #'damping = #+inf.0 
    How to hide time signature ??
       - fail: \once \override Staff.TimeSignature #'stencil = ##f

  Solved issues: 
    Beaming: while the ostinato and bassdrum CAN be generated separately
      and put on the same staff, instead of manually combined as I did, 
      manual seems best due to the following drawbacks:
      - separate voices: they don't beam together
      - as simultaneous lines: they beam together, but with small distracting gaps indicating their separateness. example: 
        ost = \drummode{ cymr8 cymr8 <<cymr8 sn8^> >> cymr8 }
        drumAA = \drummode {bd8 s8    s16 bd16 s8}
        << \ost \drumAA >>
        A single beam will tie the notes of the 2nd 1/4 note, but the 
        1/16 note beam will not connect (I suspect 'preserving' the 
        separateness of the voices, but it's visually distracting

%}
\layout {
 ragged-right = ##t
}

% the 15 drum parts  - unfortunately, I can't list the BD rhythms out separately
% and combine them, so I've written each together. 
drumA = \drummode{ <<cymr8 bd8>> cymr8                   <<cymr8 sn8^> bd8>> cymr8 }
drumB = \drummode{ cymr16 bd16 cymr8                     <<cymr16 sn16^> >> bd16 cymr8 }
drumC = \drummode{ cymr8 <<cymr8 bd8>>                   <<cymr8 sn8^> >> <<cymr8 bd8>> }
drumD = \drummode{ cymr8 cymr16 bd16                     <<cymr8 sn8^> >> cymr16 bd16  }
drumE = \drummode{ <<cymr16 bd16>> bd16 cymr8            <<cymr16 sn16^> bd16>> bd16 cymr8  }
drumF = \drummode{ <<cymr8 bd8>> <<cymr8 bd8>>           <<cymr8 sn8^> bd8>> <<cymr8 bd8>>}
drumG = \drummode{ <<cymr8 bd8>> cymr16 bd16             <<cymr8 sn8^> bd8>> cymr16 bd16}
drumH = \drummode{ cymr16 bd16 <<cymr8 bd8>>             <<cymr16 sn16^> >> bd16 <<cymr8 bd8>> }
drumI = \drummode{ cymr16 bd16 cymr16 bd16               <<cymr16 sn16^> >> bd16 cymr16 bd16 }
drumJ = \drummode{ cymr8 <<cymr16 bd16>> bd16            <<cymr8 sn8^> >> <<cymr16 bd16>> bd16}
drumK = \drummode{ <<cymr16 bd16>> bd16 <<cymr8 bd8>>    <<cymr16 sn16^> bd16 >> bd16 <<cymr8 bd8>> }
drumL = \drummode{ <<cymr16 bd16>> bd16 cymr16 bd16      <<cymr16 sn16^> bd16 >> bd16 cymr16 bd16}
drumM = \drummode{ <<cymr8 bd8>> <<cymr16 bd16>> bd16    <<cymr8 sn8^> bd8>> <<cymr16 bd16>> bd16  }
drumN = \drummode{ hh16 bd16 <<hh16 bd16>> bd16          <<hh16 sn16^> >> bd16 <<hh16 bd16>> bd16 }
drumO = \drummode{ <<hh16 bd16>> bd16 <<hh16 bd16>> bd16 <<hh16 bd16 sn16^> >> bd16 <<hh16 bd16>> bd16 }

\markup{
 \column{
   \score{ \new DrumStaff {
        \time 2/4   \set Score.proportionalNotationDuration = #(ly:make-moment 1 12)
        \set Staff.instrumentName = #"1."
        \new DrumVoice { \stemUp \repeat unfold 2{ \drumA } } 
      } \layout{}
   }
   \score{ \new DrumStaff {
        \time 2/4 \set Score.proportionalNotationDuration = #(ly:make-moment 1 12)
        \set Staff.instrumentName = #"3."
        \new DrumVoice { \stemUp \repeat unfold 2{ \drumC } } 
      } \layout{}
   }
   \score{ \new DrumStaff {
        \time 2/4 \set Score.proportionalNotationDuration = #(ly:make-moment 1 12)
        \set Staff.instrumentName = #"5."
        \new DrumVoice { \stemUp \repeat unfold 2{ \drumE } } 
      } \layout{}
   }
   \score{ \new DrumStaff {
        \time 2/4 \set Score.proportionalNotationDuration = #(ly:make-moment 1 12)
        \set Staff.instrumentName = #"7."
        \new DrumVoice { \stemUp \repeat unfold 2{ \drumG } } 
      } \layout{}
   }
   \score{ \new DrumStaff {
        \time 2/4 \set Score.proportionalNotationDuration = #(ly:make-moment 1 12)
        \set Staff.instrumentName = #"9."
        \new DrumVoice { \stemUp \repeat unfold 2{ \drumI } } 
      } \layout{}
   }
   \score{ \new DrumStaff {
        \time 2/4 \set Score.proportionalNotationDuration = #(ly:make-moment 1 12)
        \set Staff.instrumentName = #"11."
        \new DrumVoice { \stemUp \repeat unfold 2{ \drumK } } 
      } \layout{}
   }
   \score{ \new DrumStaff {
        \time 2/4 \set Score.proportionalNotationDuration = #(ly:make-moment 1 12)
        \set Staff.instrumentName = #"13."
        \new DrumVoice { \stemUp \repeat unfold 2{ \drumM } } 
      } \layout{}
   }
   \score{ \new DrumStaff {
        \time 2/4 \set Score.proportionalNotationDuration = #(ly:make-moment 1 12)
        \set Staff.instrumentName = #"15."
        \new DrumVoice { \stemUp \repeat unfold 2{ \drumO } } 
      } \layout{}
   }
 }
 \column{
   \score{ \new DrumStaff {
        \time 2/4 \set Score.proportionalNotationDuration = #(ly:make-moment 1 12)
        \set Staff.instrumentName = #"2."
        \new DrumVoice { \stemUp \repeat unfold 2{ \drumB } } 
      } \layout{}
   }
   \score{ \new DrumStaff {
        \time 2/4 \set Score.proportionalNotationDuration = #(ly:make-moment 1 12)
        \set Staff.instrumentName = #"4."
        \new DrumVoice { \stemUp \repeat unfold 2{ \drumD } } 
      } \layout{}
   }
   \score{ \new DrumStaff {
        \time 2/4 \set Score.proportionalNotationDuration = #(ly:make-moment 1 12)
        \set Staff.instrumentName = #"6."
        \new DrumVoice { \stemUp \repeat unfold 2{ \drumF } } 
      } \layout{}
   }
   \score{ \new DrumStaff {
        \time 2/4 \set Score.proportionalNotationDuration = #(ly:make-moment 1 12)
        \set Staff.instrumentName = #"8."
        \new DrumVoice { \stemUp \repeat unfold 2{ \drumH } } 
      } \layout{}
   }
   \score{ \new DrumStaff {
        \time 2/4 \set Score.proportionalNotationDuration = #(ly:make-moment 1 12)
        \set Staff.instrumentName = #"10."
        \new DrumVoice { \stemUp \repeat unfold 2{ \drumJ } } 
      } \layout{}
   }
   \score{ \new DrumStaff {
        \time 2/4 \set Score.proportionalNotationDuration = #(ly:make-moment 1 12)
        \set Staff.instrumentName = #"12."
        \new DrumVoice { \stemUp \repeat unfold 2{ \drumL } } 
      } \layout{}
   }
   \score{ \new DrumStaff {
        \time 2/4 \set Score.proportionalNotationDuration = #(ly:make-moment 1 12)
        \set Staff.instrumentName = #"14."
        \new DrumVoice { \stemUp \repeat unfold 2{ \drumN } } 
      } \layout{}
   }

 }
}