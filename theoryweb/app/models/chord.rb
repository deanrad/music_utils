# A chord is a set of notes, ascending upward from the root (if not an inversion),
# and defined by a series of intervals. 
# For example, the chords Gm and G share the same root, but differ in the intervals.
# The notes of G are spaced [4,3] apart, while Gm is spaced [3,4] apart (in semitones)
class Chord 
  # The note the chord is based on.
  attr_accessor :root

  # The type of chord this is - eg. major, minor, 7th, etc...
  attr_accessor :type

  # The set of intervals defining the sound of this chord. 
  attr_accessor :intervals

  # The key this chord is part of (this affects the naming of its notes)
  attr_accessor :key

  def initialize(root, type=:major, key=nil)
    @root, @type, @key = Notes[root], type, key
    @intervals = Chords::INTERVALS[type]
    raise ArgumentError unless @intervals
  end

  # Returns the notes involved in this chord by applying the intervals to the root.
  def notes
    ns = [ @root ] 
    @intervals.each do |i|
      n = ns.last.dup
      n.position = (n.position + i) % 12
      ns << n
    end
    ns
  end
end
