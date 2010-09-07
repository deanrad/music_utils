\version "2.12.3"
%%%%%%%%%%%%%%%%%%%%
%  This is a sample file for the development of the swing feature of lilypond
%%%%%%%%%%%%%%%%%%%%%
\header {
  title = "Swing Example File for Lilypond"
}
\include "lib/swing.ly"

\paper { 
   indent = 0\cm
}

groove = \drummode{ 
  \repeat unfold 2 { sn8 sn8 sn8 sn8 }
  \repeat unfold 4 { \times 2/3 { sn8 sn8 sn8 } }
  \repeat unfold 1 { sn8 sn4 sn4 sn8 sn8 sn8 }
  \repeat unfold 2 { \times 2/3 { sn4 sn8 } sn4 }
}
grooveSixteenth = \drummode{ 
  \repeat unfold 2 { sn16 sn sn sn }
  \repeat unfold 4 { \times 2/3 { sn16 sn sn } }
  \repeat unfold 1 { sn16 sn8 sn8 sn16 sn sn }
  \repeat unfold 2 { sn8 sn8}
}

testMusic =  {
  \swingIt #'8 { \groove }
  \groove
  
  \swingIt #'16 { \grooveSixteenth }
  \grooveSixteenth
}
annotations = {
  s1*4 ^ "W/ Swing" \break
  s1*4 ^ "No Swing" \break 
  s1*2 ^ "W/ 16th Swing" \break
  s1*2 ^ "No Swing"  
}

\markup{ 
  \larger{ "Eigth Note Swing" } 
}
\score{
  \new DrumStaff = "snare" 
  \with { \remove Time_signature_engraver }{
    \time 4/4
    \tempo 4 = 105
    \new DrumVoice{
      <<
      \testMusic
      \annotations
      >>
    }
  }
  \layout{}
  \midi{} 
}
