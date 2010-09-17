% Lilypond Template
%    For chord/melody Lead sheet creation
% 
% Author: Dean Radcliffe
% Attribution: Native Ground Music's backpocket Old Time Songbook
% Parts: Chord, melody, rhythmic pattern
% Parameters: midi instrument, transposition options, unindenting first line, midi tempo, clef/key/time sig, ...
\header{
	composer          = "Dean Radcliffe"
	title             = "Cindy (trad)"

	copyright         = ""
	maintainer        = "Dean Radcliffe"
	lastupdated       = "2010/09/16"
}

\version "2.12.3"

\paper { 
  % unindent first line
   indent = 0\cm
}

%% The primary score first - the midi-only score follows it
\score {
  %% What occurs between << and >> is shown to be played at once, as multiple simulataneous parts
  <<
    \new ChordNames { 
      % only print chord names when they change
      % \set chordChanges = ##t 
      \partial 8 g8 |
      g2    g2    g2     g2 
      g2    g2    g4 d4  g2    
      % chorus % 
      c2    c2    g2     g2 
      c2    c2    d2     g2
    }

    %%  Add fretboards with \new FretBoards {}
    \new Staff { 
      \time 2/4
      \tempo 4 = 132
      % \set beatLength = #(ly:make-moment 1 4)  % beam quarter notes
      \set Score.proportionalNotationDuration = #(ly:make-moment 1 10)
      \relative d' {
        \partial 8 g8 |
        b8  d8  d8   e8  |  d8  b4      g8   |
        g8  g8  g8   g8  |  b2               |
        b8  d8  d8. e16  |  d8  b8  b4       
        a8  g8  b8   a8  |  g4  \bar "||" b16^ "Chorus:" a16 g8  
        
        e4      g8. g16  |  g8  g8  a16 g16 e8 |
        d2               |  d4      b'16 a16 g8 |
        e4      g8. g16  |  g8  g4          a8 |
        b8  b8  a8  a8   |  g4. \bar "|."
      }
    }
    \new RhythmicStaff{
      \partial 8 s8
       c8 c8-> c8 c8-> c8 c8-> c16 c16 c8-> 
    }
    
  >>
  \layout{}
  \midi{}
}


\markup {
  %\fill-line {
     \hspace #0.1 % padding on the left margin;
     \column {
        \line { 
          \bold "1."
          \column {
            "You ought to see Miss Cindy"
            "   she lives a-way down south."
            "She's so sweet, the ho-ney bees" 
            "   Swoon a-round her mouth."
          }
        }
        \hspace #0.1 
        \italic "Chorus:"
        \line { 
           \bold "  "
           \column {
             "Get a-long home, Cin-dy " 
             "  Cin-dy, get a-long home."
             "Get a-long home, Cin-dy Cin-dy "
             "  I'll ma-rry you some day."
           }
         }

        \hspace #1  % insert extra spacing between verses
        \hspace #1  % insert extra spacing between verses
        \line { 
          \bold "2."
          \column {
            "When you go-a  fi-shin"
            "   fish witha hook in mind."
            "When you go to ma-rry" 
            "   dont you never look be-hind"
          }
        }
        \hspace #1  % insert extra spacing between verses
        \line { 
          \bold "3."
          \column {
            "I wish I was an ap-ple"
            "   Hang-in on a tree."
            "And every time that Cindy passed" 
            "   she'd take a little bite of me "
          }
        }

    }
    \hspace #0.1 % padding on the right margin;
    \hspace #1   % mo padding
    \column {
       \line { 
         \column {
           \bold "Arrangement:"
             "Arrgmt:"
               "  Intro Riff"
               "  Verse 1"
               "    Chorus"
               "  Verse 2"
               "    Chorus"
               "  -Guitar-"
               "  -Guitar-"
               "  -Mando- "
               "  -Fiddle/Mando-"
               "  Verse 3"
               "    Chorus"
               "  Outro Riff"
         }
       }
    }
  %} % end of fill-line
}   % end of markup

%  \column {
%    \hspace #2.0
%   "Arrgmt:"
%   "  Intro Riff"
%     "  Chorus"
%     "  V1"
%     "  Chorus"
%   "  V2" 
%   "  Solo"
%   "  V3 (quieter)"
%   "  Chorus"
%   "  Outro Riff"
%   }
% }

