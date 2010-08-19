\version "2.12.3"
%%%%%%%%%%%%%%%%%%%%
%  This is a sample file for the development of the swing feature of lilypond
%%%%%%%%%%%%%%%%%%%%%
\header {
  title = "Swing Example File for Lilypond"
}
\include "swing.ly"

\paper { 
   indent = 0\cm
}

groove = \drummode{ 
  \repeat unfold 2 {sn8 sn8 sn8 sn8}
  \repeat unfold 4 { \times 2/3 { sn8 sn8 sn8 } }
  \repeat unfold 1 {sn8 sn4 sn4 sn8 sn8 sn8 }
  \repeat unfold 2 {sn4 sn4}
}

testMusic =  {
  \swingIt #'"eighth" { \groove }
  \groove
}
annotations = {s1*4^"W/ Swing" s1*4^"No Swing"}

\markup{ \larger{ "Eigth Note Swing (\swing 'eighth')" } }
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
