# A key is a starting pitch, called the 'root' and a mode. Example: A major.
# The default mode for a key is the major scale.
# Key and Scale are used interchangably here..
class Key
  include Chords

  attr_accessor :root
  attr_accessor :mode

  # Whether this key is based on a sharp or flat root (this determines how its notes will display).
  attr_accessor :sharp_or_flat

  # Make a nice display
  def to_s
    "<Key of #{@root.to_s} #{@mode.to_s}>"
  end
  alias :inspect :to_s

  # Using the mode of this key, returns notes which are aware of their key and degree
  def notes
    return @notes if @notes
    ns = @mode.ascend(@root)
    ns.each_with_index do |n, i| 
      n.key = self
      n.degree = i+1;
    end
    @notes = ns
  end

  # Fetches the note at the given scale degree. This is 1-based not 0-based indexing here!!!
  def degree one_based_index
    self.notes[one_based_index - 1]
  end

  def initialize(root = :C, mode = :major)
    # look up these attributes and remember them
    @root, @mode = Notes[root], Modes[mode]

    # take this preference from the root note
    @sharp_or_flat = @root.sharp_or_flat

    # ensure we've initialized correctly
    raise ArgumentError if @root.nil? || @mode.nil?
  end
end

# Scale is also another name for key. See: http://en.wikipedia.org/wiki/Musical_scale
Scale = Key unless defined? Scale
