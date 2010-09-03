#(define (defined-music? music)
   (not (eq? 'Music (ly:music-property music 'name))))

#(define (name-of music)
   (ly:music-property music 'name))

#(define (no-notes? music)
   "Return false if there is at least one note in `music, true otherwise."
   (let ((found? #f))
     (let loop ((evt music))
       (let ((e (ly:music-property evt 'element))
             (es (ly:music-property evt 'elements)))
         (if (ly:music? e) (loop e))
         (while (and (pair? es)(not found?))
                (if (eq? 'NoteEvent (name-of (car es)))
                    (set! found? #t)
                    (begin
                      (loop (car es))
                      (set! es (cdr es)))))
         evt))
     (not found?)))

#(define-macro (add! lst elt)
   "Add element `elt to the list `lst."
   `(set! ,lst (append ,lst (list ,elt))))

#(define (join-chords-elts original-notes new-pitches-notes)
   "Create a ChordEvent elements property list with :
    - rhythm from `original-notes
    - pitches from `new-pitches-notes
    - scripts, articulations etc ... from both. "
   (let ((dur (ly:music-property (car original-notes) 'duration)))
     (append     ; note that the code below, works also if the new-note is a rest.
      (map (lambda (x)  ; copy the original rhythm in all new-pitches-notes.
             (if (ly:duration? (ly:music-property x 'duration))
                 (ly:music-set-property! x 'duration dur))
             (ly:music-deep-copy x)) ; needed when \samePitch is used
           new-pitches-notes)
      (filter (lambda (x) ;copy articulations, scripts etc from original-notes
                (not (ly:duration? (ly:music-property x 'duration))))
              original-notes))))

#(define (make-notes-list music)
   "Make a list which element is either an 'elements list of an EventChord,
 either a music added with \\insert. "
   (let ((res '())) ; the list to fill
     (define (fill-notes-list music)
       (let ((tags (ly:music-property music 'tags)))
         (if (memq 'cPInsertInPattern tags)        ; a music added by \insert
             (begin
               (ly:music-set-property! music 'tags
                                       ;; remove 'cPInsertInPattern tag
                                       (delq 'cPInsertInPattern tags))
               (add! res music))
             (let ((elt (ly:music-property music 'element))
                   (elts (ly:music-property music 'elements)))
               (if (ly:music? elt) (fill-notes-list elt))
               (if (pair? elts)
                   (cond
                    ((eq? 'EventChord (ly:music-property music 'name))
                     (if (memq (ly:music-property (car elts) 'name)
                               (list 'NoteEvent 'RestEvent 'SkipEvent))
                         (add! res elts)))
                    (else (for-each fill-notes-list elts))))))))
     (fill-notes-list music)
     res))

                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
changePitch =
#(define-music-function (parser location pattern newnotes)
   (ly:music? ly:music?)
   "Change each notes in `pattern by the notes (or rests) given in `newnotes.
If count of events doesn't match, pattern is duplicated repeatedly or truncate."
   (if (eq? 'EventChord (name-of pattern)); pattern must be a "container" of chords
       (set! pattern (make-sequential-music (list pattern))))
   (if (no-notes? pattern)               ; avoid endless loops ...
       pattern
       (let ((notes-list (make-notes-list newnotes)); see (make-notes-list)
             (seq-list '())                         ; list of transformed patterns
             (skip-pat? #f)     ; Is (car (notes-list)) a 'elements list of a \skip ?
             (insert? #f)       ; Is (car (notes-list)) a \insert music (not a list)?
             (must-filter #f))  ; set when a music is undefined (generic name 'Music)
         (define (change-one-pattern pat) ;;; an inner function ;;;;;;;;;;;;;;;;;
           (let ((pat-e (ly:music-property pat 'element))
                 (pat-es (ly:music-property pat 'elements)))
             (if (ly:music? pat-e) (ly:music-set-property! pat 'element
                                                           (change-one-pattern pat-e)))
             (if (pair? pat-es)
                 (set! (ly:music-property pat 'elements)
                       (let ((res '()))                 ; the new list to build
                         (for-each                      ; for-each elt x of pat-es
                          (lambda (x)
                            (let* ((chord-es (and (eq? 'EventChord (name-of x))
                                                  (ly:music-property x 'elements)))
                                   (chord-with-notes? (and
                                                       chord-es
                                                       (eq? 'NoteEvent (name-of (car chord-es))))))
                              (if chord-with-notes? ; x is a "note"
                                  (if (pair? notes-list)
                                      (begin        ; element in notes-list can be either a music or :
                                        (if (pair? (car notes-list)) ;<- an EventChord 'elements list
                                            (case (name-of (caar notes-list))
                                              ((or NoteEvent RestEvent) ; join-chords-elts allows rests!
                                               (ly:music-set-property! x 'elements  ; copy pitch into x
                                                                       (join-chords-elts chord-es (car notes-list)))
                                               (let ((tags (ly:music-property x 'tags)))
                                                 (cond               ; are we in a \samePitch section ?
                                                  ((memq 'cPSamePitch tags) ;yes : only remove the tag
                                                   (ly:music-set-property! x 'tags
                                                                           (delq 'cPSamePitch tags)))
                                                  ((memq 'cPSamePitchEnd tags);last note of \samePitch
                                                   (ly:music-set-property! x 'tags
                                                                           (delq 'cPSamePitchEnd tags))
                                                   (set! notes-list (cdr notes-list)))   ; next new
                                                  (else (set! notes-list (cdr notes-list)))))   ; note
                                               (add! res x)    ; add the modified note to pat 'elements
                                               (set! insert? #f)   ; \insert and \skip delete all music
                                               (set! skip-pat? #f)); between 2 notes, so stop this here
                                              ((SkipEvent) ; the new chord was a \skip : nothing will be
                                               (set! skip-pat? #t) ; added until a note is found in
                                               (set! notes-list (cdr notes-list))))) ;  pattern.
                                        (while (and (pair? notes-list); if (car notes-list) comes from
                                                    (ly:music? (car notes-list))); an \insert music :
                                               (begin (add! res (car notes-list))
                                                      (set! insert? #t)  ; same as SkipEvent above
                                                      (set! notes-list (cdr notes-list)))))
                                      (begin ;<- if notes-list is empty
                                        (add! res (make-music 'Music)); add an undefined music that we
                                        (set! must-filter #t)))       ; will have to filter.
              ;;; now : if x is NOT a "note"
                                  (if (and (not skip-pat?)(not insert?)(pair? notes-list))
                                      (add! res (change-one-pattern x))))))
                          pat-es) ; end for-each
                         (set! insert? #f) ; re-initialization at the end of the sequence
                         (set! skip-pat? #f)
                         res))); return the new list to be assigned to pat 'elements
             pat))     ; return the maybe-modified pat
  ;;; end of change-one-pattern ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;; following of the main function ( \changePitch )
         (while (pair? notes-list)
                (let ((new-pat (change-one-pattern (ly:music-deep-copy pattern))))
                  (if must-filter (set! new-pat (music-filter defined-music? new-pat)))
                  (if (not (no-notes? new-pat))(add! seq-list new-pat))))
         (case (length seq-list)
           ((0) (make-music 'Music 'void #t))
           ((1) (car seq-list))
           (else (make-sequential-music seq-list))))))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% enhancement functions, working with \changePitch pattern newnotes
samePitch =
#(define-music-function (parser location music) (ly:music?)
   "Inside the `pattern parameter of the \\changePitch function, you can group
some notes by calling this function. All grouped notes will have the same pitch,
according to the current note of the `newnotes parameter of \\changePitch."
   (let ((last-chord-with-note #f))
     (music-map
      (lambda (x)
        (let ((chord-with-notes? (and (eq? 'EventChord (name-of x))
                                      (eq? 'NoteEvent (name-of (car
                                                                (ly:music-property x 'elements)))))))
          (if chord-with-notes? (begin
                                  (set! last-chord-with-note x)
                                  (ly:music-set-property! x 'tags (cons
                                                                   'cPSamePitch  ;; add tag 'cPSamePitch to note x
                                                                   (ly:music-property x 'tags)))))
          x))
      music)
     (if last-chord-with-note
         (set! (ly:music-property last-chord-with-note 'tags)
               (cons
                'cPSamePitchEnd  ; add 'cPSamePitchEnd tag, delete 'cPSamePitch tag
                (delq 'cPSamePitch (ly:music-property last-chord-with-note 'tags)))))
     music))



insert = #(define-music-function (parser location music) (ly:music?)
"Using this function inside the `newnotes parameter of the \\changePitch
function, allow you to insert and replace all music between 2 notes of
the `pattern parameter of \\changePitch, by `music."
#{ \tag #'cPInsertInPattern $music #})

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% shortcuts
#(define cP changePitch)
patI = { c8.  c16}
cPI = #(define-music-function (parser location newnotes) (ly:music?)
#{
        \changePitch \patI $newnotes
#})

patII ={ c4.  c8}
cPII = #(define-music-function (parser location newnotes) (ly:music?)
#{
        \changePitch \patII $newnotes

#})

