% See also http://osdir.com/ml/lilypond-devel-gnu/2009-06/msg00008.html
% Example \swingIt #'"eighth" { \groove }
%
swingIt = #(define-music-function
  (parser location swingDiv music)  (number? ly:music?)
  (_i "Apply a swing feel to music in @var{argMusic} according to @var{swingStyle}. ")
  (let*
   (
    ; bookeeping variables - track the current time, etc..
  	(real-elapsed (ly:make-moment 0 1))
  	(evt-duration (ly:make-moment 0 1))
  	(measure-pos  (ly:make-moment 0 1))
  	
  	; configuration variables
  	(swing-amt    (ly:make-moment 1 1))
  	(swing-unit   (ly:make-moment 1 4))
   )

  ;; music-map yields sequential events from argMusic
  ;; into the anonymous function which is its first argument
  (music-map 
  (lambda (mus)
   	(if (and (eq? (ly:music-property mus 'name) 'EventChord)
   		       (< 0 (ly:moment-main-denominator (ly:music-length mus))))
   	   (begin
   	     ;; take measurements
   	     (set! evt-duration (ly:music-length mus))
   	     (set! measure-pos (ly:moment-mod real-elapsed swing-unit))
   	     (set! real-elapsed (ly:moment-add real-elapsed evt-duration))

   	     ;; if a note doesn't start or end on an eigth note we'll never adjust it
   	     (if (or (eq? 8 (ly:moment-main-denominator measure-pos))
   		           (eq? 8 (ly:moment-main-denominator evt-duration)))
   	       (begin

     	       ; Lengthen eigth notes that start on quarter notes
     	       (if (eq? 0 (ly:moment-main-numerator measure-pos))

             		(begin
                 ;;;;;;;; Lengthen the first portion of a swing unit by a factor of 4/3 (50 becomes 66.7)
             		 (ly:music-compress mus 
             		  (ly:make-moment 
             		   ; TODO the zeros below should be the calculated number of quarters in the duration
             		   (+ 4 (* 6 0) ) 
             		   (+ 3 (* 6 0) )
             		  ))))

     	       ; like saying 'shorten eigth notes that start on eigth notes' 
     	       (if (and (eq?  (* 2 (ly:moment-main-denominator swing-unit))
     	                           (ly:moment-main-denominator evt-duration))
               		    (eq?  (* 2 (ly:moment-main-denominator swing-unit))
               		               (ly:moment-main-denominator measure-pos) ) )
               	;
             		(begin
                 ;;;;;;;;; Shrink the second portion of a swing unit by a factor of 2/3 (50 becomes 33.3)
             		 (ly:music-compress mus 
             		  (ly:make-moment 
             		   ; TODO the zeros below should be the calculated number of quarters in the duration
             		   (+ 2 (* 6 0) ) 
             		   (+ 3 (* 6 0) )
             		  ))))
   	       )) ;; if swingable
   	  )) ;; if is a music event
  mus
  )
  music) ;; return the music from music-map
    
  ;; return the adjusted music
  music

  ) ;; end let 
) 


% Dean's swing function aspires to be like scaleDurations and \featherDurations
% 
% \scaleDurations #'(2 . 1) { a2 a4 } 
% scaleDurations = #(define-music-function
% 		  (parser location fraction music) (number-pair? ly:music?)
% 		  (ly:music-compress music (ly:make-moment (car fraction) (cdr fraction))))
% featherDurations=
% #(define-music-function (parser location factor argMusic) (ly:moment? ly:music?)
%  (_i "Adjust durations of music in @var{argument} by rational @var{factor}. ")
%    (let*
%        ((orig-duration (ly:music-length argument))
% 	(multiplier (ly:make-moment 1 1)))
%
%      (music-map 
%       (lambda (mus)
% 	(if (and (eq? (ly:music-property mus 'name) 'EventChord)
% 		 (< 0 (ly:moment-main-denominator (ly:music-length mus))))
% 	    (begin
% 	      (ly:music-compress mus multiplier)
% 	      (set! multiplier (ly:moment-mul factor multiplier)))
% 	    )
% 	mus)
%       argument)
%
%      (ly:music-compress
%       argument
%       (ly:moment-div orig-duration (ly:music-length argument)))
%
%      argument))
