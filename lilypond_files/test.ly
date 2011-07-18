% Lilypond Template
%    For guitar/banjo/chordal instrument lead sheet creation
% 
% Author: Dean Radcliffe
% Parts: Chord instrument, 
% Parameters: midi instrument, transposition options, unindenting first line, midi tempo, clef/key/time sig, ...
\header{
	composer          = "Dean Radcliffe"
	title             = "untitled"

	copyright         = ""
	maintainer        = "Dean Radcliffe"
	lastupdated       = "2010/11/01"
}

\version "2.12.3"

\include "lib/swing.ly"

\paper { 
   indent = 0\cm
}

\displayMusic \relative c' { c8 c8 \swingIt #'8 { c8 c8 } }