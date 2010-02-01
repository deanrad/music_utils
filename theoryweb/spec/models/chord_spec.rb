require 'spec/spec_helper'

describe Chord do
  it 'should have a root and a type' do
    g = Chord.new(:G, :major)
    g.root.to_s.should == 'G'
    g.type.should == :major
  end

  it 'should get the intervals associated with the chord type' do
    g = Chord.new(:G, :major)
    g.intervals.should == [4,3]
  end

  it 'should get the notes associated with the chord type' do
    d = Chord.new(:D, :major)
    d.notes.map(&:to_s).should == ['D', 'F#', 'A']

    d7 = Chord.new(:D, :seventh)
    d7.notes.map(&:to_s).should == ['D', 'F#', 'A', 'C']

    bb = Chord.new("Bb", :major)
    bb.notes.map(&:to_s).should == ['Bb', 'D', 'F']

    bbm = Chord.new("Bb", :minor)
    bbm.notes.map(&:to_s).should == ['Bb', 'Db', 'F']

  end

end
