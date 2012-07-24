require 'spec_helper'

describe Kitchen do
  let(:kitchen){
    Kitchen.new(
      Device::ZoomH2n.new({
        'FOLDER01/ZOOM0001.WAV' => {mtime: Time.new(2012,07,20)},
        'FOLDER02/ZOOM0001.WAV' => {mtime: Time.new(2012,07,21, 8, 0, 0)},
        'FOLDER02/ZOOM0002.WAV' => {mtime: Time.new(2012,07,21, 9, 0, 1)},
        'FOLDER02/ZOOM0002.MP3' => {mtime: Time.new(2012,07,21, 9, 0, 7)},
      })).tap do |k|
        k.seen_sessions = ["FOLDER01"]
        k.destinations = [ Destination::TestFolder.new('/Volumes/Cowbell/Dean Songs') ]
    end 
  }

  let(:kitchenzoom){
    kitchen
  }
  
  let(:importsettings){
    {
      'FOLDER01' => {
        :artist => 'FOO',
        :album => 'Rehearsal Foo & Bar July 4th',
        :songs => Hash[
          'FOLDER01/ZOOM0001.WAV', {:song => 'Foo'}
        ]
      }
    }
  }
  
  let(:testfolder){
    kitchen.destinations.first
  }
      
  it 'can be created to talk to a device' do
    kitchen.should_not be_nil
  end
  
  it 'knows what new files are on the device' do
    kitchenzoom.new_files.should == ["FOLDER02/ZOOM0001.WAV", "FOLDER02/ZOOM0002.WAV", "FOLDER02/ZOOM0002.MP3"]
  end

  it 'knows what new sessions are on the device' do
    kitchenzoom.new_sessions.map(&:path).should == ["FOLDER02"]
    kitchenzoom.new_sessions.first.created.should == Time.new(2012,07,21, 8, 0, 0)
  end
  
  describe 'KitchenImport' do
    it 'should raise ArgError on import an unknown session' do
      lambda{
        kitchen.import("FOLDER03")
      }.should raise_exception(ArgumentError)
    end
    it 'should import the latest session with no mapping' do
      kitchen.seen_sessions.should == ["FOLDER01"]
      kitchen.import("FOLDER02", importsettings)
      kitchen.seen_sessions.should == ["FOLDER01", "FOLDER02"]
      testfolder.sessions.keys.last.should == "FOLDER02"
      testfolder.sessions["FOLDER02"].count.should == 3
      kitchen.new_files.should == []
    end
  end
end