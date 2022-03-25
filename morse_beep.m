function [] = morse_beep(pulse_seq, sampling_freq, dot_duration, tone_freq)

len = length(pulse_seq);

s = sampling_freq;
o = tone_freq;

t = 1:(1000);

score = [];

dot = cos(t(1:dot_duration));
dash = cos(t(1:dot_duration * 3));
stop = dot;

for x = 1:len
    if pulse_seq(x) == 0
        score = [score stop];
    elseif pulse_seq(x) == 1 && pulse_seq(x + 1) == 1 && pulse_seq(x + 2) == 1
        score = [score dash];
    elseif pulse_seq(x) == 1
        score = [score dot];
end

score

%sound(y, sampling_freq)


end