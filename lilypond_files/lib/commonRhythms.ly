boomChickMidi = #(define-music-function (parser location newnotes) (ly:music?)
#{
  \changePitch { c8\mf c8-.\fff } $newnotes
#})

boomChick = #(define-music-function (parser location newnotes) (ly:music?)
#{
  \changePitch { c8 c8-.-> } $newnotes
#})
