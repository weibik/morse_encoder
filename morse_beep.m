function [] = morse_beep(pulse_seq, tone_freq, dot_duration, sampling_freq)

sound(pulse_seq, tone_freq, dot_duration)

end