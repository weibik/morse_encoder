function [] = morse_beep(pulse_seq, sampling_freq, dot_duration, tone_freq)

    % MORSE_BEEP function produces the plot and the sound of the
    % morse_code
    %   It take four arguments:
    %       pulse_seq is the result of our different function
    %       (morse_encoder). It is result of the morse code saved as a
    %       string of 0's and 1's.
    %       
    %       sampling_freq, dot_duration and tone_freq can be simply
    %       understood, because of good variables names. The user can
    %       experiment with these arguments to make sound different.
    %
    
    len = length(pulse_seq);
    
    score = [];
    
    t = 1:(tone_freq);
    dot = cos(t(1:dot_duration));
    dash = cos(t(1:dot_duration * 3));
    shortStop = zeros(1, dot_duration);
    
    x = 1;
    while x <= len
        if x <= len - 2
            if pulse_seq(x) == 0
                score = [score shortStop];
                x = x + 1;
            elseif pulse_seq(x) == 1 && pulse_seq(x + 1) == 1 && pulse_seq(x + 2) == 1
                score = [score dash];
                x = x + 3;
            elseif pulse_seq(x) == 1
                score = [score dot];
                x = x + 1;
            end
        else
            if pulse_seq(x) == 0
                score = [score shortStop];
                x = x + 1;
            elseif pulse_seq(x) == 1
                score = [score dot];
                x = x + 1;
            end
        end
    end
    test = [dot shortStop dash  shortStop dash  shortStop dash  shortStop dash shortStop dot];
    
    plot(score);
    sound(score , sampling_freq)
end