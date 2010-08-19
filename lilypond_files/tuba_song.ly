\header{
	filename          = "tuba_song.ly"
	composer          = "Dean Radcliffe"
	title             = "Example of A Lilypond template for a monophonic piece. Includes midi output with tempo and voice control."

	copyright         = "Creative Commons Attribution-ShareAlike 2.5"
	maintainer        = "Dean Radcliffe"
	lastupdated       = "2010/07/11"
}

\version "2.12.3"

theme = \relative c, {
	c16-. r8.      g'16-. r8.    d16-. r8  g,8. b8
}

\score {
	\new Staff = "tuba" {
		% See here for a list of valid instrument names:
		% http://lilypond.org/doc/v2.12/input/lsr/lilypond-snippets/MIDI#Demo-MidiInstruments
		\set Staff.midiInstrument = #"tuba"
		\set Score.beatLength = #(ly:make-moment 1 4)

		\clef bass
		\time 4/4

		\transpose c' ees'{ 
			\key c \major
			\repeat unfold 2 { 
				\theme
			}
		}
	}
	\layout { }
	\midi { 
		\context { 
			\Score tempoWholesPerMinute = #(ly:make-moment 95 4)
		}
  }
}