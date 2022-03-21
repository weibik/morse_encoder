function [] = morse_encoder(message)
    % MORSE_ENCODER function is 

    load("morse.mat","Alpha","Morse");
    message = char(message);
    result = "";

    for n = 1:strlength(message)
        i = find(Alpha == message(n));
        result = append(result, Morse{i});
    end
    result
    
end