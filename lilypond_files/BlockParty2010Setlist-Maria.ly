\header{
	filename = "untitled.ly"
	composer          = "Dean Radcliffe"
	title             = "Maria "

	maintainer        = "Dean Radcliffe"
	lastupdated       = "2010/08/20"
	
	tagline = ##f
}

\version "2.12.3"

\paper { 
  bookTitleMarkup = \markup {
    \sans \fontsize #8 { 
      \fromproperty #'header:title
    }
  }
}

\markup{ 
  \column{
  	\sans \fontsize #7 {              \hspace #20
    
  	\line { Let Go \smaller{ (blastix) } }      \hspace #10
  	\line { MOTU \smaller{ (brushes) } }      \hspace #10
  	\line { Crushed  \smaller{ (sticks,samba) }}      \hspace #10
  	\line { Ordinary Year \smaller{ (sticks, loud!) }  }      \hspace #10
  	}
  	\line \bold { I'll fly away ! }
  }
}