# A mode specifies a set of intervals 
class Mode
  attr_accessor :name
  attr_accessor :intervals

  def initialize( name, intervals )
    @name, @intervals = name, intervals
  end

  # Applies the interval pattern going upward from the from_note
  def ascend(from_note)
    notes = [from_note]
    @intervals.each do |i| 
      n = notes.last.dup
      n.position = (n.position + i) % 12
      notes << n
    end
    notes
  end

  def to_s; name; end
end
