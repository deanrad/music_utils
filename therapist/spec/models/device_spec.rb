require 'spec_helper'

describe Device do
  let(:zoom) { #Device.new(:ZOOM_H2N, {
    Device::ZoomH2n.new( {
    'FOLDER01/ZOOM0001.WAV' => {mtime: Time.new(2012,07,20)},
    'FOLDER02/ZOOM0001.WAV' => {mtime: Time.new(2012,07,21, 8, 0, 0)},
    'FOLDER02/ZOOM0002.WAV' => {mtime: Time.new(2012,07,21, 9, 0, 1)},
    'FOLDER02/ZOOM0002.MP3' => {mtime: Time.new(2012,07,21, 9, 0, 7)},
  })}
  let(:zoomfile) {
    zoom.files['FOLDER01/ZOOM0001.WAV']
  }
 
  it 'should not be an AR::Base descendant' do
    Device.ancestors.should_not include(ActiveRecord::Base)
  end
  
  it 'should have a path' do
    zoom.path.should == '/Volumes/H2N_SD/STEREO'
  end
  
  it 'should have a list of files' do
    zoom.files.keys.first.should == 'FOLDER01/ZOOM0001.WAV'
    zoomfile = zoom.files['FOLDER01/ZOOM0001.WAV']

    Hash.should === zoomfile
    zoomfile[:mtime].should == Time.new(2012,07,20)
    zoomfile[:path].should include('FOLDER01/ZOOM0001.WAV')
  end
  
  it 'should have a list of sessions' do
    zoom.sessions.sort{ |s1,s2| s1.path <=> s2.path }.map(&:path).should == ["FOLDER01", "FOLDER02"]
  end

  describe Session do
    let(:sessions) {
      zoom.sessions
    }
    it 'should have a list of session files' do
      sessions.map(&:files).map(&:count).should == [1,3]
    end

    it 'should have a list of session created dates' do
      sessions.map(&:created).should == [Time.new(2012,07,20), Time.new(2012,07,21, 8, 0, 0)]
    end
  end
  
end


























