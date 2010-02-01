# A note is a specific musical pitch.
class Note
  # This is the notes 'distance' in semitones from a C.
  attr_accessor :position

  # This is the octave of the note - eg the '3' in C3.
  attr_accessor :octave

  # :sharp, :flat, or nil - whether this note is intended to be notated as C# or Db.
  attr_accessor :sharp_or_flat

  # The key this note is a part of
  attr_accessor :key

  # The degree of the scale this note is
  attr_accessor :degree

  def to_s
    case (possibles = Notes::MAP.select{|k,v| v==@position}.map(&:first)).length
    when 1 
      possibles[0]
    when 2
      possibles.detect{|p| p.include?( @sharp_or_flat == :flat  ? 'b' : '#') }
    end
  end
  # alias :inspect :to_s

end
