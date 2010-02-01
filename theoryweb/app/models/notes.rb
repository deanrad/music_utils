# Handles the lookup of notes
class Notes

  # This map shows which notes are enharmonic, and assigns an unambiguous
  # number which each instance of the note class will use to keep track of itself
  MAP = { 'C'  => 0, 
          'C#' => 1,  'Db' => 1, 
          'D'  => 2,
          'D#' => 3,  'Eb' => 3,
          'E'  => 4,
          'F'  => 5,
          'F#' => 6,  'Gb' => 6,
          'G'  => 7,
          'G#' => 8,  'Ab' => 8,
          'A'  => 9,  'Bb' => 9,
          'A#' => 10, 'Bb' => 10,
          'B'  => 11 }

  SHARP_KEYS = %w{G D A E B}
  FLAT_KEYS  = %w{F}

  def self.[] note
    returning(Note.new) do |n|
      n.position = MAP[note.to_s]
      n.sharp_or_flat = :sharp if SHARP_KEYS.include?(note.to_s) || note.to_s.include?('#')
      n.sharp_or_flat = :flat  if FLAT_KEYS.include?(note.to_s)  || note.to_s.include?('b')
    end
  end
end
