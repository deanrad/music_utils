require 'spec/spec_helper'

describe Notes do
  it 'should take the sharp or flat preference from the note' do
    Notes['C' ].sharp_or_flat.should == nil
    Notes['C#'].sharp_or_flat.should == :sharp
    Notes['Db'].sharp_or_flat.should == :flat
  end
end
