require 'spec/spec_helper'

describe Note do
  it 'should have a string representation which respects its sharp_or_flat preference' do
    [ [0, nil, 'C'], [1, :sharp, 'C#'], [1, :flat, 'Db'] ].each do |(pos, sharp_or_flat, exp)|
      n = Note.new
      n.sharp_or_flat = sharp_or_flat
      n.position = pos
      n.to_s.should == exp
    end
  end

end
