# Digitech Loop Tempo Writer
# For digitech Jam Man pedal, writes out the folders and files needed to have loops 30-80 as
# predefined tempos, (double their loop #) which you can store into the lower loop positions. 
# 
# A track will not show itself as being configured on the Jam Man, but it will be. The folder
# structure on the Jam Man is:
# /JAMMAN/
#    LOOP01/       
#       LOOP.WAV   # the optional 1-channel wave file (mono)
#       LOOP.XML   # the loop definition file with bpm, stop mode, loop or one-shot options
#    LOOP02/...
# A loop definition file looks like this, with %d replaced with the num of ticks per beat 44100 / bpm * 60
loop_def = 
  %q{<?xml version="1.0" encoding="utf-8" ?>
<JamManLoopSetup>
	<LoopMode>Loop</LoopMode>
	<Tempo>%d</Tempo>
	<TimeSignature>2</TimeSignature>
	<RhythmType>1</RhythmType>
	<StopMode>Stop</StopMode>
</JamManLoopSetup>
}
# For loops in this range
puts "Writing loops into ./LOOP*/*.xml"

(30..90).each do |bpm|
  Dir.mkdir(dir_name ="LOOP#{bpm}") rescue nil
  File.open("#{dir_name}/LOOP.XML", "w") do |f|
    # we divide the ticks in half to double the tempo of each loop relative to its loop number
    ticks = (44100.0 / bpm.to_f)*60 / 2
    f.puts(loop_def % ticks)
  end  
  puts "Wrote LOOP#{bpm}/LOOP.XML"
end

#puts loop_def.split("\n").join("\r\n")
# Create the folder
