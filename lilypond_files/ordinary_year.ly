\version "2.8"
\include "english.ly"
printDate= #(strftime "Printed: %m-%d-%Y" (localtime (current-time)))
\header {
  title = "Ordinary Year"
  composer = "Maria A Poulos"
  arranger = \markup \tiny { \printDate }
}

lyricMelody = {
  \relative c'' {
    b8    b16 b16       r16 b16 b8~   b8    cs8     gs8   a8
  }
}

upVerse = \relative c'' {
  b8    b16 b16       r16 b16 e8~        e4        r4
  b8    b16 b16       r16 b16 gs'8~      gs8 e8~   e8 r8
  e8    e16 e16       r16 e16 es8~       es4       r4
  e8    e16 e16       r16 e16 es8~       es4       r4
}

verse = { 
  \repeat percent 4 { 
    \lyricMelody 
  }
  \upVerse
}

\score {
  \new Staff << % << and >> denote simultaneous happenings
    \tempo 4 = 116
    \clef "treble"
    \key e \major
    \chords { e4. a8   r2    r1            r1                r1 
              e4. a8:m r2    e4. a8:m r2   e4. f8:maj7 r2    e4. r4 f8:maj7 f8:maj7 }
    \new Voice {
      \set Staff.midiInstrument = #"grand piano" 
      \verse
    }
    % force 4 measures per line 
    \new Voice {
      s1 * 4 \break
      s1 * 4 \break
    }
  >>
  \layout { }
  \midi {}
}

\markup {
  \tiny { % \teeny \tiny \small \normalsize \large \huge
      \hspace #1.0 
      \column {
	"Verse form: |:E-A E-A:|  E-Am E-Am   E-Fmaj7 E-Fmaj7"
        \hspace #1.0 
        "Watchin all these people / Sittin' in their ruts all day"
	"Livin' lives that pass them by / They take their breath and look away"
        "All the air that fills them / Is really helium that kills them"
	"But not before they stop / Punchin out that clock (boom boom)"
        \hspace #1.0 
        "And I got the strangest feelin / That I'm floatin with them all"
	"Inside this tiny planet / Droppin through that outer space"
        "I try to look away / but now that fallin' feelin'"
	"Is rushin' in my ears.."
        \hspace #1.0 
        "Ch (D A E E): This was not .... An ordinary year... (4x)"
        \hspace #1.0 
        "Now my thoughts have woken up / they're twistin and theyre swirlin"
	"Its makin me slowly nuts / watchin all their minds lock up"
        "Like empty rooms / Thoughts screamin and fleein"
	"But not before they stop / Punchin out that clock (boom boom)"
        \hspace #1.0 
        "And i can't contain myself / because i just need to scream"
	"Its all the seeing hurting me / and makin me flail about"
        "The skippin of my heart / While i break apart"
	"All thoyse mirrors..."
        \hspace #1.0 
        "Ch: This ways not .... An ordinary year... (4x)"
        \hspace #1.0 
        "Br: Now its gotten quiet / I feel my thoughts tellin me"
	"That its ok to run away / And try and figure these things out"
        "I feel like I've been through the earth / And born into the u-ni-ve-erse..."
	"That's how it got so cle-ar..."
        \hspace #1.0 
        "Ch (Em D7 E E): This is not .... An ordinary year... (4x)"
        \hspace #1.0 
        "Outro: (E D7 A E): (guit lead over jam)"
      }
      \hspace #1.0
  }
}