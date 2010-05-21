\version "2.8"
%{
   Two_column: this file shows how to layout music in multiple columns.
   Note: the \layout{} block is necessary for the scores to be printed !
%}
\layout {
 ragged-right = ##t
}

\markup{
 \column{
   \score{\relative c'{ c4 d e f g f e d c1 }\layout{}}
   \score{\relative c'{ \key c \minor c4 d es f g f es d c1 } \layout{} }
 }
 \column{
   \score{\relative c'{ \key d \major d4 e fis g a g fis e d1 }\layout{}}
   \score{\relative c'{ \key c \minor d4 e f g a g f e d1 }\layout{}}
 }
}