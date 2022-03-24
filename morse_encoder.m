function [pulse_seq] = morse_encoder(message)
    % MORSE_ENCODER function is used to transform a normal message into a
    %               morse code.
    %       
    %               We have two options to do that:
    %
    %                   - First is without output argument. In this case our
    %                   message is transformed into a string of dots and
    %                   dashes. Beetween every letter there is a space and
    %                   beetween every word there is a three space break    
    %
    %                   - Second option is to put an output argument. In this
    %                   case our output is the string of zero's and one's.
    %                   dot is a 1, dash is 111
    %                   Beetween every sign there is a 0 and beetwen every word
    %                   there is a 0000000.
                

    load("morse.mat","Alpha","Morse");
    message = upper(char(message));

    switch nargout
        case 0
            result = "";
            for n = 1:strlength(message)
                switch message(n)
                    case " "
                        result = append(result, "   ");
                    otherwise
                        i = Alpha == message(n);
                        
                        result = append(result, Morse{i} + " ");
                end                
            end
            display(result)
        case 1
            result = [];
            pulse_seq = [];
            for n = 1:strlength(message)
                switch message(n)
                    case " "
                        pulse_seq = [pulse_seq 0 0 0 0];
                        %pulse_seq = append(pulse_seq, "0000");
                    otherwise
                        i = Alpha == message(n);
                        ms = Morse{i};

                        for x = 1:strlength(ms)
                            if ms(x) == '.'
                                %result = append(result, "1");
                                result = [result 1];
                            elseif ms(x) == '-'
                                %result = append(result, "111");
                                result = [result 1 1 1];
                            end
                            %pulse_seq = append(pulse_seq, result);
                            pulse_seq = [pulse_seq result];
                            if x ~= strlength(ms)
                                %pulse_seq = append(pulse_seq, "0");
                                pulse_seq = [pulse_seq 0];
                            end
                            result = [];
                        end
                        if n ~= strlength(message)
                            	%pulse_seq = append(pulse_seq, "000");
                                pulse_seq = [pulse_seq 0 0 0];
                        end
                end
            end
     end
end