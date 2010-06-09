\version "2.12.3"

\header{
  title = "The Other Side Of Summer"
}

verseOne = {
  s2.. d8 | g4    g8 a8   c'8 b8   a8 g8 |
            b8 a8 b8 g8~  g4       r8 d8 |
            g4    g4      g8 d8    g4    |
            a4    a4      a8 d8    a4
}
verseLyrics = \lyricmode{
  The sun strug -- gles up an -- o -- ther beau -- ti -- ful day
  And I feel glad in my own sus -- pi -- cious way 
}
chorusLyrics = \lyricmode{
  From the foam -- ing break -- ers of the poi -- son -- ous surf
  The o -- ther side of sum -- mer
}
chorusOne = {
       r8  b16 b16   b8 g8   a8 g8   a8 g8 |
       b8 a8         b8 g8~  g4      r8 d8 |
       d4.              g8 g4.        b8 |
       b4.              a4.~         a4 
}

\score{
  \new Staff{
    \tempo 4 = 120
    \clef "treble_8"
    \key g \major
    <<
      \new Voice = "v1" { \verseOne }
      \new Lyrics \lyricsto "v1" \verseLyrics
    >>   
       {r1}
    <<
      \new Voice = "c1" { \chorusOne }
      \new Lyrics \lyricsto "c1" \chorusLyrics
    >>   
  }
  \midi{}
  \layout{}
}
