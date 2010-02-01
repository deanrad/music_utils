# Handles the lookup and creation of individual modes
class Modes

  # Defines synonyms and canonical names for the modes
  MAP = {
    'ionian'   => :major,
    'major'    => :major,
    'minor'    => :minor,
    'aeolian'  => :minor
  }

  INTERVALS = {
    :major => [2, 2, 1, 2, 2, 2, 1],
    :minor => [2, 1, 2, 2, 1, 2, 2],
  }

  def self.[] mode
    modename = MAP[mode.to_s]
    case modename
    when nil
      raise ArgumentError
    else
      Mode.new( modename, INTERVALS[modename] )
    end
  end
end
