\header{
	filename = "untitled.ly"
	composer          = "Dean Radcliffe"
	title             = "C.A.W. Blues Project 2010 Block Party"

	maintainer        = "Dean Radcliffe"
	lastupdated       = "2010/08/20"
	
	tagline = ##f
}

\version "2.12.3"

\paper { 
  bookTitleMarkup = \markup {
    \fontsize #8 { 
      \fromproperty #'header:title
    }
  }
}

\markup{ 
  \column{
    \fontsize #5 {
  	\fontsize #2 {              
    \hspace #20  \hspace #20  \hspace #20
    
  	\line { Slippin Out/Slippin In (F) (92)  }      \hspace #10
  	\line { Cleanup Woman        (E) (88)           }      \hspace #10
  	\line { Roadhouse Blues (E) (116)         }      \hspace #10
  	\line { Dock of the Bay (G) (92)        }      \hspace #10
  	\line { Stray Cat Strut (C) (126)       }      \hspace #10
  	\line { Your Husband Is Cheatin On Us (E) (80)  }      \hspace #10
  	\line { Nasty Habits (C) (112) }      \hspace #10
 	  \line { Fever (A-Bb-B) (slow) }      \hspace #10
 	  \line { Blue Moon Of Kentucky (A-Bb) (100) } \hspace #10
  	}

  \line { Rock Me Baby (C) }      \hspace #10
  \line { The Blues Is My Business (C) }      \hspace #10
  \line { You Can Run (B) }      \hspace #10
  }
  }
}

\markuplines{
  Test one two
  Test three four
}