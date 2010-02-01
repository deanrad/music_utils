require 'spec/spec_helper'
include CommonKeys

describe Key do

  it 'should have a nice string representation' do
    C.to_s.should == '<Key of C major>'
  end

  it 'should deduce whether a sharp or flat key from its root note' do
    Key.new(:C).sharp_or_flat.should == nil
    Key.new('C#').sharp_or_flat.should == :sharp
    Key.new(:"Bb").sharp_or_flat.should == :flat
    Key.new(:F).sharp_or_flat.should == :flat
    Key.new(:G).sharp_or_flat.should == :sharp
  end

  it 'should enumerate its notes up through the octave' do
    C.notes.map(&:to_s).should == ["C", "D", "E", "F", "G", "A", "B", "C"]
    D.notes.map(&:to_s).should == ["D", "E", "F#", "G", "A", "B", "C#", "D"]
    F.notes.map(&:to_s).should == ["F", "G", "A", "Bb", "C", "D", "E", "F"]
  end

  it 'should return notes from Key#notes which remember their key' do
    D.root.key.should == D
    D.notes[1].key.should == D
  end

  it 'should return notes whose degrees are 1 greater than their index' do
    d = D.notes[0]
    d.to_s.should == 'D'
    d.degree.should == 1

    cs = D.notes[6]
    cs.to_s.should == 'C#'
    cs.degree.should == 7

    fs = D.degree(3)
    fs.to_s.should == 'F#'
  end

end
