% Lilypond Template
%    For chord/melody Lead sheet creation
% 
% Author: Dean Radcliffe
% Attribution: Native Ground Music's backpocket Old Time Songbook
% Parts: Chord, melody, rhythmic pattern
% Parameters: midi instrument, transposition options, unindenting first line, midi tempo, clef/key/time sig, ...
\header{
	title             = "Deep Freeze"
	subtitle          = "Dean Davis Radcliffe"

	copyright         = "Copyright 2012 DDR"
	lastupdated       = "2012/02/08"
  tagline = ##f
}

\version "2.12.3"

\paper { 
   indent = 0\cm         % unindent first line
}

%% The primary score first - the midi-only score follows it
\score {
  %% What occurs between << and >> is shown to be played at once, as multiple simulataneous parts
  <<
    \new ChordNames { 
      % only print chord names when they change
      \set chordChanges = ##t 
      \time 2/4
      \tempo 4 = 66
      \chordmode {
        a4:m    a:m |  g     g  |  d     d  |  f   f  |
        a:m     a:m |  g     g  |  d     d  |  e   e  |
      }
    }
    
    \new Staff{
      \time 2/4
      \relative c''{
        a16 a a a4 r16 | r2     |         a16 a a a4 r16 | r2
      }
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
%          \bold "1."
          \column {
            "I'm wound up tighter than a cat who's about to spring"
            "In work or play I think of you doin' everything (to me)"
            "I tried confessin' my thoughts, I tried payin' pennance too" 
            "But it's no damn good I can't rid myself of you"
          }
        }
        \hspace #0.1 
        \italic "Chorus:"
        \line { 
           \bold "  "
           \column {
             "Till I can sleep through the night ..." 
             "Here's what I'm forced to do"
             "I've got to cryogenically freeze me (stop)"
             "Till I'm rid of you"
           }
         }
        \hspace #1  % insert extra spacing between verses
        \hspace #1  % insert extra spacing between verses
        \line { 
%          \bold "2."
          \column {
            "I'd never cut off my nose, just to spite my face"
            "I wouldn't throw in the towel, if I come in second place"
            "But I'm a mess inside with you hauntin' me in my dreams" 
            "In extra-ordinary times I take measures to their extremes"
          }
        }

        \hspace #0.1 
        \italic "Chorus"

        \line { 
%          \bold "1."
          \column {
            "I pinch myself every minute, but distraction just won't do"
            "Maybe things will change with a Rip Van Winkle or two"
            "I'll finally get some sleep, I'll be so happy when.." 
            "But if you've had a daughter it'll start all over again"
          }
        }
        \hspace #0.1 
        \italic "Chorus (double)"



        \hspace #0.1 
        \column {
          \bold "Arrgmt:"
              "  Intro"
              "  V1"
              "  Interlude"
              "  V2"
              "  Chorus"
              "  V2"
              "  Chorus (double)"
              "  Outro - \"Till I'm rid of you\""
        }
    }
  %} % end of fill-line
}   % end of markup

