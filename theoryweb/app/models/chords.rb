module Chords
  include Intervals
  
  INTERVALS = {
    :major => [MAJOR_THIRD, MINOR_THIRD],
    :minor => [MINOR_THIRD, MAJOR_THIRD],
    :seventh => [MAJOR_THIRD, MINOR_THIRD, MINOR_THIRD],
    :diminished => [MINOR_THIRD, MINOR_THIRD],
  }

  # Note these should really be derived from the mode, not tied to the major scale as below
  DEGREE_CHORD_TYPES = {
    1 => :major,
    2 => :minor, 
    3 => :minor,
    4 => :major,
    5 => :major,
    6 => :minor, 
    7 => :diminished,
    8 => :major
  }

  # The includer gets these methods

  # Returns the chord based on the degree of the scale
  def chords( deg )
    Chord.new( self.degree(deg), DEGREE_CHORD_TYPES[deg] )
  end
end
