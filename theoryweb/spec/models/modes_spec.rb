require 'spec/spec_helper'

describe Modes do
  it 'should return a mode given an identifier' do
    ids_to_intervals = {'major'  => Modes::INTERVALS[:major],
                        :major   => Modes::INTERVALS[:major],
                        :ionian  => Modes::INTERVALS[:major]}

    ids_to_intervals.each do |id, ivals|
      Modes[id].intervals.should == ivals
    end
  end
end
