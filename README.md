# morse_encoder

MORSE_ENCODER function is used to transform a normal message into a morse code.
                          
   We have two options to do that:

      - First is without output argument. In this case our
       message is transformed into a string of dots and
       dashes. Beetween every letter there is a space and
       beetween every word there is a three space break    

       - Second option is to put an output argument. In this
       case our output is the string of zero's and one's.
       dot is a 1, dash is 111
       Beetween every sign there is a 0 and beetwen every word
       there is a 0000000.
                       
 MORSE_BEEP function produces the plot and the sound of the  morse_code
    
       It take four arguments:
           pulse_seq is the result of our different function
           (morse_encoder). It is result of the morse code saved as a
           string of 0's and 1's.
           
           sampling_freq, dot_duration and tone_freq can be simply
           understood, because of good variables names. The user can
           experiment with these arguments to make sound different.
