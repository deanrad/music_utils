# -*- coding: utf-8 -*-
# ask for the 4th degree up from C (D# Eb, depending on the preference)
degree = ScaleDegree[4] 

# it follows some global preference to name itself according to preferring sharps
degree.name 
  => D#

# if you pass a key to the object, it'll name itself according to that key's preference
degree.name( Key['Bb'] )
  => Eb

# if you (or some other object) sets the preference on it (or assign to it a key,
# which has such a preference, you can omit the argument to the 'name' method
degree.naming_preference = Key['Bb'] 
# or 
degree.naming_preference = :flats
# then
degree.name
  => Eb

# When a Key object returns degrees for you, they are preset to the naming_preference
# of that key
degree = Key['Bb'][4]
degree.name
  => Eb

Key['Bb'][1].name => 'Bb'
# could use real unicode chars   ♭♮♯

# A Key object as described thusfar has a mode that can't be changed
Key['Bb'].major? => true
Key['Bb'].mode   => :ionian
Key['Bb'].intervals => [:W, :W, :H, :W, :W, :W, :H]

# To get a different mode, index by root AND mode
am = Key['A', :minor]
am.major?      => false
am.mode        => :aeolian
am.intervals   => [:W, :H, :W, :W, :H, :W, :W]
am.degrees     => [:A, :B, :C, :D, :E, :F, :G]

