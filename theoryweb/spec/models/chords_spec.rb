require 'spec/spec_helper'

describe Chords do
  it 'should tell a key about its chords' do
    d = Key.new(:D, :major)
    d.chords(1).root.to_s.should == 'D'
    d.chords(4).root.to_s.should == 'G'
    d.chords(5).root.to_s.should == 'A'
  end

end
