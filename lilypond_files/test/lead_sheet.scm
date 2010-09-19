; % This is what a lead sheet looks like as a serialized object graph
(make-music
  'UnrelativableMusic
  'element
  (make-music
    'SequentialMusic
    'elements
    (list (make-music
            'EventChord
            'elements
            (list (make-music
                    'MarkEvent
                    'label
                    (markup #:line (#:circle "V")))))
          (make-music
            'UnrelativableMusic
            'element
            (make-music
              'SequentialMusic
              'elements
              (list (make-music
                      'EventChord
                      'elements
                      (list (make-music
                              'NoteEvent
                              'pitch
                              (ly:make-pitch 0 1 0)
                              'duration
                              (ly:make-duration 0 0 1 1))
                            (make-music
                              'NoteEvent
                              'pitch
                              (ly:make-pitch 0 3 1/2)
                              'duration
                              (ly:make-duration 0 0 1 1))
                            (make-music
                              'NoteEvent
                              'pitch
                              (ly:make-pitch 0 5 0)
                              'duration
                              (ly:make-duration 0 0 1 1)))))))
          (make-music
            'EventChord
            'elements
            (list (make-music
                    'LineBreakEvent
                    'break-permission
                    'force)))
          (make-music
            'EventChord
            'elements
            (list (make-music
                    'MarkEvent
                    'label
                    (markup #:line (#:circle "C")))))
          (make-music
            'EventChord
            'elements
            (list (make-music
                    'LineBreakEvent
                    'break-permission
                    'force)))
          (make-music
            'EventChord
            'elements
            (list (make-music
                    'MarkEvent
                    'label
                    (markup #:line (#:circle "Br")))))
          (make-music
            'EventChord
            'elements
            (list (make-music
                    'LineBreakEvent
                    'break-permission
                    'force)))
          (make-music
            'EventChord
            'elements
            (list (make-music
                    'MarkEvent
                    'label
                    (markup #:line (#:circle "O"))))))))