(make-music
  'RelativeOctaveMusic
  'element
  (make-music
    'SequentialMusic
    'elements
    ;;;;;;;;;;;;;;;;;   Notes 1 and 2 - two eight notes ;;;;;;;;;;;;;;;;;
    (list (make-music
            'EventChord
            'elements
            (list (make-music
                    'NoteEvent
                    'duration
                    (ly:make-duration 3 0 1 1)
                    'pitch
                    (ly:make-pitch 0 0 0))))
          (make-music
            'EventChord
            'elements
            (list (make-music
                    'NoteEvent
                    'duration
                    (ly:make-duration 3 0 1 1)
                    'pitch
                    (ly:make-pitch 0 0 0))))
    ;;;;;;;;;;;;;;;;;   Notes 3 and 4 - two eight notes with swung 8th timing ;;;;;;;;;;;;;;;;;
          (make-music
            'SequentialMusic
            'elements
            (list (make-music
                    'EventChord
                    'elements
                    (list (make-music
                            'NoteEvent
                            'elements
                            '()
                            'duration
                            (ly:make-duration 3 0 4 3)
                            'pitch
                            (ly:make-pitch 0 0 0))))
                  (make-music
                    'EventChord
                    'elements
                    (list (make-music
                            'NoteEvent
                            'elements
                            '()
                            'duration
                            (ly:make-duration 3 0 2 3)
                            'pitch
                            (ly:make-pitch 0 0 0)))))))))
